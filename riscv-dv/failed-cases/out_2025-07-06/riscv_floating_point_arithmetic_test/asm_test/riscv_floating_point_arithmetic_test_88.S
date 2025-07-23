.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x8, h0_start
jalr x0, x8, 0
h0_start:
                  li x14, 0x40001120
                  csrw 0x301, x14
kernel_sp:        
                  la x21, kernel_stack_end

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
                  li x14, 2139095040
                  fmv.w.x f0, x14
                  li x14, 0
                  fmv.w.x f1, x14
                  li x14, 2398805982
                  fmv.w.x f2, x14
                  li x14, 2154730196
                  fmv.w.x f3, x14
                  li x14, 2153208902
                  fmv.w.x f4, x14
                  li x14, 2147483648
                  fmv.w.x f5, x14
                  li x14, 529498536
                  fmv.w.x f6, x14
                  li x14, 4286578687
                  fmv.w.x f7, x14
                  li x14, 1844383
                  fmv.w.x f8, x14
                  li x14, 6943340
                  fmv.w.x f9, x14
                  li x14, 0
                  fmv.w.x f10, x14
                  li x14, 4272537463
                  fmv.w.x f11, x14
                  li x14, 4286578688
                  fmv.w.x f12, x14
                  li x14, 2139095039
                  fmv.w.x f13, x14
                  li x14, 980419424
                  fmv.w.x f14, x14
                  li x14, 4286578687
                  fmv.w.x f15, x14
                  li x14, 2147483648
                  fmv.w.x f16, x14
                  li x14, 4286578688
                  fmv.w.x f17, x14
                  li x14, 0
                  fmv.w.x f18, x14
                  li x14, 2147483648
                  fmv.w.x f19, x14
                  li x14, 2147483648
                  fmv.w.x f20, x14
                  li x14, 2659634391
                  fmv.w.x f21, x14
                  li x14, 2143289344
                  fmv.w.x f22, x14
                  li x14, 1182678952
                  fmv.w.x f23, x14
                  li x14, 0
                  fmv.w.x f24, x14
                  li x14, 2147483648
                  fmv.w.x f25, x14
                  li x14, 2143289344
                  fmv.w.x f26, x14
                  li x14, 0
                  fmv.w.x f27, x14
                  li x14, 2143289344
                  fmv.w.x f28, x14
                  li x14, 0
                  fmv.w.x f29, x14
                  li x14, 2154720227
                  fmv.w.x f30, x14
                  li x14, 4286578687
                  fmv.w.x f31, x14
                  fsrmi 3
                  li x0, 0x80000000
                  li x1, 0x84a34ee3
                  li x2, 0x80000000
                  li x3, 0x0
                  li x4, 0x0
                  li x5, 0xf6c9aa63
                  li x6, 0xfa86eab0
                  li x7, 0x0
                  li x8, 0xd7f6ef7a
                  li x9, 0x356ff3bd
                  li x10, 0xf298d774
                  li x11, 0xf48596ad
                  li x12, 0xf6b283a2
                  li x13, 0x80000000
                  li x14, 0x0
                  li x15, 0x2276868b
                  li x16, 0x0
                  li x17, 0xd35cf837
                  li x18, 0xf2f043b9
                  li x19, 0x80000000
                  li x20, 0xa30e6a9e
                  li x22, 0x80000000
                  li x23, 0x999f369c
                  li x24, 0xc
                  li x25, 0xf9d7761f
                  li x26, 0x0
                  li x28, 0xd
                  li x29, 0x0
                  li x30, 0x0
                  li x31, 0x0
                  la x27, user_stack_end
main:             srli         s10, s9, 18
                  srl          t6, s1, t4
                  sltiu        t0, s6, 1469
                  or           a7, a2, tp
                  slt          s8, s2, a0
                  fmin.s       fs0, ft8, fs0
                  fsqrt.s      fa6, fs7
                  fcvt.s.w     ft4, a6
                  fcvt.wu.s    sp, ft3, rtz
                  addi         t1, tp, -144
                  sll          s3, a2, s4
                  sub          s3, s1, sp
                  xori         t3, t6, 1776
                  slli         s2, ra, 3
                  and          s8, t4, ra
                  sltiu        t2, ra, -1432
                  fsgnjn.s     fa6, fs3, ft5
                  or           gp, s6, s7
                  auipc        s3, 122076
                  mulhsu       a6, a7, s6
                  fsgnj.s      ft4, ft11, fa3
                  sll          a2, t2, a2
                  fadd.s       fs6, fs9, fs9, rmm
                  lui          tp, 512178
                  fsub.s       ft0, fs11, ft9, rup
                  fadd.s       ft5, fa6, fs0
                  fmax.s       ft11, fs3, ft8
                  addi         s4, s8, -810
                  fsqrt.s      fa7, fs2, rdn
                  xor          a4, s9, a5
                  lui          a1, 279406
                  mulh         a7, t6, a3
                  rem          a5, t4, t1
                  mul          a6, t3, a4
                  add          gp, gp, a6
                  fcvt.w.s     s7, ft9, rup
                  mulhu        s8, s1, a3
                  sra          t1, zero, gp
                  feq.s        s1, fs7, fa5
                  remu         s6, s1, s5
                  xori         ra, t3, -1141
                  sll          a7, s5, s10
                  fsgnjn.s     fa6, ft9, ft0
                  fmax.s       fs2, fs5, fa4
                  slli         t5, s3, 27
                  slti         t4, s5, -1112
                  sub          a3, a2, s6
                  fcvt.s.wu    ft7, zero, rdn
                  ori          t5, a5, -1334
                  fsqrt.s      fs4, fs4, rtz
                  slt          sp, s1, s7
                  fmax.s       ft3, ft3, fa6
                  auipc        s4, 278803
                  fadd.s       ft11, fa7, ft8, rup
                  fsgnjn.s     fa5, fs5, fs5
                  sltiu        s9, a3, -528
                  mul          t4, t3, a1
                  slli         t2, t5, 14
                  mulhsu       gp, s8, t3
                  fsgnj.s      fs9, fs11, fs5
                  sltu         a0, zero, t5
                  sll          a3, a5, s9
                  fsgnjx.s     fa0, fa6, fs11
                  srli         s10, t0, 25
                  sub          s4, s1, s6
                  fsqrt.s      fs5, fa4, rdn
                  sra          t5, t0, a5
                  auipc        a2, 306724
                  lui          ra, 502719
                  xori         a7, a4, 1262
                  mulh         t5, tp, a1
                  auipc        a3, 537983
                  fcvt.wu.s    s9, fs4, rdn
                  fsgnjx.s     ft4, fs5, fs4
                  fmv.x.w      zero, ft0
                  fcvt.s.wu    fa6, s1, rtz
                  fmv.x.w      t5, ft11
                  fmv.w.x      fs0, s3
                  ori          sp, s11, -349
                  lui          s2, 285175
                  fsgnjx.s     fs9, ft0, fa7
                  flt.s        ra, fs11, ft7
                  fmin.s       ft1, fa7, fs4
                  slli         a6, s2, 12
                  fdiv.s       ft7, ft10, ft1
                  fclass.s     s1, fs1
                  xori         ra, a2, -1756
                  mulhsu       s1, a1, s5
                  mul          t3, a1, s7
                  or           ra, tp, a6
                  sra          a3, a7, s0
                  mulhsu       tp, ra, a2
                  sltiu        s6, s7, 610
                  fmv.w.x      fs2, s5
                  feq.s        a3, fs5, ft11
                  fmax.s       fs9, fs3, ft6
                  fmv.x.w      t4, fs2
                  auipc        t1, 941989
                  add          a3, t0, a3
                  fcvt.wu.s    t0, fs11, rup
                  sll          s7, ra, tp
                  fadd.s       ft5, fs7, fa1
                  div          t3, a5, s1
                  andi         a7, t1, 567
                  mulhsu       zero, s8, a4
                  ori          s9, a5, 1714
                  xori         sp, a4, -1058
                  fmv.w.x      ft1, t5
                  addi         a6, s5, -1083
                  feq.s        a0, fs10, fa4
                  lui          tp, 334442
                  sltu         s7, a1, s5
                  add          s3, a7, s3
                  fclass.s     a7, ft9
                  slt          a3, t1, s8
                  sltiu        s6, s5, -1896
                  add          t6, s11, a6
                  andi         ra, s0, -579
                  fsgnj.s      fs1, fs11, fa3
                  andi         t0, a2, 1389
                  fadd.s       fa0, ft9, fa6
                  ori          a5, s6, -633
                  auipc        t4, 715865
                  feq.s        s8, fs8, fa2
                  and          t4, a0, s4
                  remu         tp, t2, t4
                  fmv.w.x      ft9, a0
                  addi         s10, t4, -1091
                  remu         s7, t5, a1
                  fmin.s       ft1, ft4, fs7
                  feq.s        s8, ft5, fs6
                  fmax.s       ft4, ft4, ft7
                  fmin.s       fa2, fs10, ft8
                  sltiu        t5, s6, 1173
                  slt          t1, a6, t0
                  fle.s        a4, ft3, ft8
                  fsgnjx.s     ft10, ft8, ft9
                  slti         a1, t3, -1861
                  lui          t0, 156852
                  srai         s6, a7, 15
                  fmul.s       fa6, fa5, fa2, rne
                  sltiu        s3, a4, -538
                  xor          a6, a7, t2
                  mulhsu       s3, t0, s10
                  mul          t3, s6, t0
                  fcvt.s.wu    fs11, s11
                  remu         s2, a4, t5
                  feq.s        s4, ft10, fa2
                  xori         a3, s1, -1322
                  mulh         zero, s8, s1
                  fle.s        s7, ft7, fs11
                  sra          s7, t3, s11
                  nop
                  mulh         s4, a3, a6
                  add          t5, s4, t3
                  fsgnjn.s     fa4, fs11, fa2
                  nop
                  sltu         s4, s4, s7
                  and          s10, tp, sp
                  fmv.x.w      a6, ft5
                  fmul.s       fa6, fa6, fa4
                  srli         t6, a0, 8
                  fle.s        a2, ft4, ft8
                  fsub.s       fs0, fs8, fs11
                  rem          tp, s2, t1
                  fmin.s       fs5, fs0, fs9
                  fcvt.s.w     ft6, a2
                  div          a0, s6, ra
                  xori         ra, s6, 1658
                  slt          t1, a6, a2
                  slt          t1, s2, s6
                  addi         s6, s5, -447
                  srai         t3, a2, 8
                  srli         s8, t5, 21
                  slt          a5, s7, s2
                  sll          a0, s10, s9
                  sra          s9, t5, s0
                  fmv.w.x      ft9, s2
                  ori          s10, tp, -809
                  fdiv.s       fa7, ft3, fs8
                  mulh         a2, s6, a7
                  fmul.s       ft6, ft11, ft0
                  divu         ra, t2, t6
                  slti         t6, a5, 1442
                  sll          a0, s5, t3
                  feq.s        a6, fs5, ft11
                  fsgnjn.s     fa1, fs8, ft0
                  xor          sp, a4, a1
                  fadd.s       ft2, fs1, fs8
                  rem          t0, s9, a2
                  fsgnj.s      fs2, ft1, fs1
                  fsgnjx.s     fs7, ft6, fs4
                  fadd.s       ft2, fs11, ft8
                  fcvt.s.w     ft2, t2, rup
                  sll          a2, sp, a7
                  srai         s3, s2, 24
                  ori          s4, s6, -516
                  sub          s7, a5, s7
                  div          a6, t0, s7
                  fcvt.w.s     a1, ft1
                  feq.s        a6, fs9, fs0
                  mulh         a5, t3, a4
                  lui          a4, 499942
                  xor          a5, s9, ra
                  sra          a4, a0, a0
                  sra          a7, t5, a1
                  fcvt.s.w     ft5, t3
                  andi         t2, tp, -157
                  addi         s4, s10, 1373
                  or           t4, ra, a1
                  auipc        a4, 769227
                  andi         tp, s8, 274
                  srai         t3, s9, 28
                  fcvt.w.s     a2, fa0, rup
                  flt.s        s3, fs0, fs6
                  fsgnjn.s     fa1, fa5, fa5
                  fcvt.wu.s    t1, ft4
                  feq.s        tp, ft3, ft1
                  fclass.s     s8, fs11
                  fmul.s       ft5, ft9, ft9, rne
                  fmax.s       ft3, ft3, ft10
                  fadd.s       fs11, fs5, fa1, rdn
                  fmv.x.w      s8, fs6
                  flt.s        a0, fs3, fa1
                  fmv.x.w      s4, fs7
                  mulhsu       t0, s7, a1
                  fmv.w.x      ft11, gp
                  fcvt.wu.s    sp, ft6
                  fcvt.s.wu    fs6, a3
                  mulh         t5, s3, t1
                  slli         s1, t2, 16
                  fmv.x.w      t6, ft7
                  slti         a2, s9, 1422
                  sltu         a7, s0, t6
                  fmv.w.x      ft9, s0
                  add          tp, s7, a0
                  mul          gp, t4, s10
                  fmv.x.w      s10, fs4
                  auipc        gp, 1003458
                  mulhsu       sp, sp, s8
                  fsgnjx.s     fa0, fs6, fs2
                  sltiu        a6, s7, 535
                  srai         ra, s5, 3
                  fsgnjn.s     ft6, ft7, ft10
                  rem          s8, s7, s9
                  mul          zero, s0, a2
                  fmv.x.w      s1, fs2
                  slli         t1, s4, 14
                  fclass.s     a4, fa4
                  fsgnjn.s     ft2, fa7, ft3
                  ori          a2, ra, 1656
                  sltiu        zero, t1, 1143
                  fsub.s       fs6, fs4, ft5, rmm
                  nop
                  fcvt.s.w     ft0, s1
                  div          a6, sp, tp
                  fmv.w.x      fs7, t4
                  fclass.s     zero, fs10
                  mulhu        t2, a3, s7
                  fmin.s       fs4, ft11, fa2
                  mulh         s9, sp, a3
                  or           tp, a2, t2
                  or           s4, sp, s7
                  fsub.s       ft2, ft7, ft3, rmm
                  fsub.s       ft10, fs4, fs5
                  fdiv.s       ft9, ft0, fs9, rup
                  srai         s9, t4, 10
                  fcvt.w.s     s4, ft9, rmm
                  mul          s2, a3, s8
                  flt.s        a2, fs8, fa2
                  mulhsu       t0, ra, a6
                  ori          s2, s7, 1157
                  divu         a6, a2, a1
                  fcvt.s.w     fs10, s0
                  and          t3, gp, a2
                  fcvt.wu.s    t6, fs5, rtz
                  fle.s        a4, fs7, fs6
                  srai         tp, a7, 21
                  flt.s        s9, fa1, ft8
                  fle.s        s4, fs6, fs6
                  mulh         s3, s7, a1
                  slli         a0, a1, 3
                  mul          a0, a2, t3
                  andi         a0, ra, 1276
                  fdiv.s       fa7, fs4, ft11
                  sltu         s6, t1, s10
                  fmin.s       ft3, fs0, fa1
                  auipc        gp, 987706
                  fmin.s       ft11, ft4, fa3
                  sltu         tp, ra, zero
                  fmv.x.w      zero, fs1
                  slli         a5, a0, 18
                  fsgnjn.s     ft1, ft11, fs10
                  xor          t6, s9, s9
                  sll          a4, zero, t0
                  add          s6, s1, s11
                  srl          a4, s4, s10
                  sltiu        a3, gp, -358
                  fmul.s       fs3, fs9, fs2, rmm
                  mulh         a0, s4, t1
                  fmax.s       fa0, ft10, fs9
                  sltu         t1, s4, s4
                  mul          t1, t0, gp
                  fsgnj.s      ft10, ft5, fs9
                  fadd.s       fs2, ft7, fa4, rtz
                  or           ra, a1, ra
                  sll          t3, t4, s0
                  fsgnj.s      fa4, ft9, ft11
                  and          s6, ra, s9
                  or           a7, s10, a4
                  srli         zero, t3, 19
                  fcvt.w.s     tp, ft1
                  fcvt.w.s     zero, fs6, rmm
                  fcvt.s.w     fa4, s2
                  divu         s3, s3, s10
                  xor          a1, s6, s5
                  fsgnjn.s     ft10, ft11, fs10
                  fmv.x.w      gp, ft3
                  fmv.w.x      fa1, s3
                  sub          s2, a1, a0
                  feq.s        gp, ft10, ft1
                  slti         s7, a4, 1440
                  sltu         t6, sp, s6
                  fsub.s       fs3, fs3, ft0, rup
                  ori          a2, a5, 1924
                  divu         s10, s6, a6
                  fsub.s       ft6, ft9, fs1
                  divu         a3, s0, s3
                  mul          t0, s4, a3
                  fsub.s       fa5, fs6, fs5, rtz
                  andi         s2, sp, -1268
                  sltu         sp, gp, t1
                  fcvt.wu.s    a5, ft4
                  add          s7, s8, s2
                  auipc        a2, 286115
                  sll          s4, a2, t1
                  fmv.w.x      ft2, s5
                  fle.s        zero, fs11, fs10
                  fmv.x.w      s4, ft0
                  divu         a0, zero, ra
                  fcvt.s.wu    ft8, t0
                  sltu         sp, s2, t1
                  add          a0, a6, s9
                  fcvt.s.wu    ft9, ra
                  mulhu        s10, t3, a4
                  slt          a0, a5, s1
                  mul          tp, zero, s10
                  fsqrt.s      fs3, fs5, rdn
                  add          t3, t2, ra
                  srl          t2, t4, a6
                  mulhsu       a5, t0, s0
                  mulhsu       a0, s8, t5
                  srl          t6, t3, t6
                  slli         t4, s8, 22
                  sltu         ra, sp, s8
                  mulhsu       a0, a3, s6
                  fmul.s       fs8, ft6, fa5, rmm
                  fcvt.wu.s    a6, ft10, rtz
                  fcvt.s.w     fs11, ra
                  fclass.s     ra, fa3
                  fmv.x.w      a3, fs5
                  fmul.s       fa4, ft9, ft10
                  fcvt.s.w     fa3, a2, rmm
                  mul          a2, s4, sp
                  sra          t4, zero, s2
                  fcvt.s.wu    fs11, t5, rne
                  rem          sp, tp, t0
                  sub          a7, t4, t0
                  fcvt.wu.s    sp, ft3, rtz
                  srli         sp, t6, 5
                  div          ra, ra, s6
                  rem          ra, a5, s7
                  fsqrt.s      ft2, fa3, rdn
                  fcvt.s.wu    ft0, t4
                  fsgnjx.s     ft6, fs1, fs11
                  fcvt.s.w     ft7, t5
                  fmul.s       fs1, ft2, ft10
                  fsgnj.s      fa1, ft0, ft8
                  remu         a5, s3, a2
                  sll          zero, a7, s5
                  fmin.s       fa1, fs2, ft3
                  lui          t2, 306535
                  auipc        a2, 105932
                  feq.s        a4, fs3, fs4
                  flt.s        a2, ft1, fa1
                  sltu         a4, s3, s10
                  sltu         t1, s1, a7
                  fle.s        s4, fs3, fs9
                  feq.s        ra, fs8, ft3
                  ori          gp, s2, -378
                  lui          t0, 1048350
                  fsub.s       ft11, fs3, ft4, rup
                  fsgnjx.s     fa7, fa2, fs4
                  and          s1, t1, tp
                  slli         t2, a7, 22
                  and          s9, s9, s6
                  fsgnj.s      fa1, ft8, fs5
                  sll          s2, gp, a1
                  srl          zero, t1, ra
                  ori          a5, t4, -1813
                  sll          t0, a1, a1
                  lui          ra, 347238
                  srli         t6, s6, 4
                  xori         t1, zero, 2026
                  slti         a7, t5, 1779
                  xori         s3, t0, 352
                  nop
                  add          t6, s4, gp
                  sra          t1, t1, s2
                  fle.s        a7, fs1, fa2
                  fmin.s       fs5, fa1, ft9
                  and          s7, a5, a3
                  ori          a4, t5, -1402
                  fmv.w.x      ft10, a5
                  fmul.s       ft10, fs0, fs7
                  sra          a3, ra, s3
                  auipc        a6, 629320
                  fle.s        s3, fs5, fa7
                  feq.s        a4, ft9, ft2
                  fmax.s       ft4, fa0, ft0
                  sub          t2, s8, t4
                  xor          sp, a6, s5
                  slli         sp, a2, 10
                  sltu         s9, a7, s8
                  srli         t6, s8, 7
                  fcvt.wu.s    a6, fa3, rup
                  auipc        t5, 605920
                  sll          s7, tp, a5
                  sltiu        a4, s8, -821
                  mulh         s1, a4, t2
                  sltiu        a2, zero, -359
                  andi         a4, s2, -1771
                  fmv.w.x      fs11, s4
                  ori          s9, s6, -579
                  slt          s9, s3, s3
                  fsub.s       ft11, fs5, ft7
                  or           t4, s8, a5
                  fcvt.s.w     fs6, a7, rmm
                  fle.s        a4, ft9, fa6
                  xor          ra, t1, a1
                  slt          s6, ra, a5
                  fclass.s     zero, fa6
                  lui          t1, 171542
                  fsub.s       fa2, fs7, fa6, rtz
                  slt          a5, ra, s8
                  fadd.s       fa3, ft9, fs7, rmm
                  fclass.s     sp, ft10
                  div          s7, t2, a7
                  slti         s1, s0, 621
                  feq.s        a1, ft7, fs6
                  sra          t3, s4, a2
                  addi         s6, a1, 1253
                  mulhsu       a6, s5, zero
                  fsgnj.s      ft7, fs9, fa1
                  fcvt.wu.s    a7, fa6, rup
                  fmul.s       fs4, fs1, fs1
                  and          s8, tp, s10
                  sltiu        a6, gp, 1827
                  feq.s        t3, ft5, fs7
                  fadd.s       ft0, fs2, fa0
                  fsgnjx.s     fa0, fs4, fa0
                  mulhsu       t2, s8, t3
                  sub          a3, a2, a5
                  fsgnjx.s     ft5, fa3, fa0
                  fcvt.w.s     a1, fa0, rdn
                  fsub.s       ft4, ft4, fa1
                  sltu         a2, a6, a6
                  srl          a0, t6, a6
                  xori         s7, t5, 1416
                  or           s3, a2, a4
                  fsgnjx.s     fs4, fa3, fs1
                  fclass.s     a0, ft10
                  div          a5, a2, t5
                  sll          t0, tp, s3
                  slti         a2, a7, 1970
                  fsgnjn.s     fs11, fa2, fa4
                  fsgnj.s      ft8, fa3, fs9
                  sra          a2, ra, gp
                  fmax.s       fs1, fs3, fs4
                  fdiv.s       fs9, ft9, ft5, rmm
                  fdiv.s       ft0, fs2, fs5, rup
                  sll          a1, a5, s2
                  fcvt.s.wu    fs8, a2, rup
                  mulhu        t4, a6, t4
                  fsgnjn.s     fa5, fs7, ft2
                  xor          t4, s8, a4
                  mulhu        a6, a4, s10
                  fmv.w.x      fs7, sp
                  remu         a5, s0, s1
                  mulhsu       a5, a5, t6
                  slti         t0, s4, -157
                  fcvt.s.w     ft0, a0, rmm
                  fadd.s       ft10, ft8, ft7, rmm
                  slt          t2, s9, a7
                  mulhsu       s8, t5, gp
                  slt          a4, a3, t0
                  mulhsu       t4, s1, s11
                  mulhsu       a3, a4, a6
                  fsgnjn.s     fs10, ft7, ft7
                  slli         t6, a7, 0
                  andi         ra, a1, -1292
                  fsub.s       ft9, fa2, fa7
                  fmul.s       ft2, fs1, fs9, rdn
                  fclass.s     s8, ft3
                  slti         t6, s5, 1318
                  sltiu        t1, s3, -1830
                  sltu         a4, ra, tp
                  srai         t6, t6, 23
                  fsqrt.s      fs6, ft5
                  fmv.x.w      s7, fa7
                  sltu         zero, t4, a7
                  sra          t0, s10, a7
                  divu         s10, s4, s9
                  fmv.w.x      fa4, s3
                  mulhu        t1, a6, zero
                  mulhu        zero, t2, a3
                  fle.s        s7, ft8, ft2
                  add          a5, s8, a3
                  auipc        a3, 251889
                  fcvt.wu.s    a1, ft11, rup
                  ori          a7, t2, 307
                  divu         zero, t2, s5
                  rem          a2, a6, s8
                  sltiu        t4, sp, -1348
                  xor          a4, s1, a6
                  nop
                  divu         zero, a1, s7
                  mulh         a4, s0, s0
                  xor          t1, gp, s3
                  srl          t1, s2, t2
                  auipc        a7, 804167
                  fmv.w.x      fa5, t2
                  mulh         t6, s6, t3
                  fcvt.wu.s    gp, ft0, rdn
                  divu         s4, a0, a0
                  remu         s2, s5, s11
                  slli         s6, a4, 18
                  nop
                  mulhsu       a4, ra, t3
                  fsgnjx.s     fs8, ft3, fa0
                  srl          s8, a3, a5
                  remu         tp, s7, s2
                  nop
                  slt          t3, a2, sp
                  fcvt.wu.s    a1, fs3
                  lui          a5, 58885
                  sra          a7, ra, s9
                  sub          t0, a5, t1
                  div          s4, s1, a5
                  mulhu        s2, t0, t3
                  flt.s        s1, fs1, ft0
                  fcvt.s.wu    fs10, a2
                  sltu         t2, a3, s3
                  ori          a3, t2, -1447
                  slti         a3, s0, -1989
                  or           a7, t2, a2
                  slli         s4, a3, 17
                  mulhu        a6, s10, s10
                  ori          gp, t1, 546
                  or           a3, s4, a5
                  and          a1, s10, sp
                  andi         t6, t3, -1456
                  sltiu        gp, t6, -544
                  lui          s9, 184904
                  addi         zero, gp, -1521
                  fsgnjx.s     ft11, fs8, fs5
                  srl          a4, t4, t4
                  sra          tp, s8, s7
                  or           a0, zero, a0
                  fclass.s     s1, fs5
                  fsgnjn.s     fa1, ft10, fs7
                  fmax.s       ft5, ft4, ft9
                  remu         s3, tp, ra
                  divu         s7, zero, t4
                  slli         tp, t6, 1
                  fcvt.wu.s    t4, fa0, rdn
                  rem          a0, a4, t1
                  sltiu        t4, a6, 164
                  slti         s2, t4, -56
                  flt.s        t4, fs5, ft11
                  sll          a4, a5, a2
                  slti         a4, s3, -891
                  xori         t5, a4, 1681
                  slti         sp, a3, 827
                  fmv.w.x      fa1, a0
                  srli         a1, t1, 0
                  fmv.w.x      fa0, t4
                  auipc        tp, 216621
                  fle.s        t0, ft9, fs6
                  andi         gp, s9, -1209
                  ori          s8, t0, 1510
                  sltu         gp, s1, t5
                  and          s4, t4, a4
                  fcvt.w.s     s10, ft1
                  mul          a2, a4, a7
                  slt          s6, a4, ra
                  fmin.s       fs7, fs0, fs11
                  andi         t4, t2, 1533
                  fmul.s       fs8, fs9, fa2
                  fmul.s       fs7, fa1, fs10
                  fsub.s       fa4, fs1, fs8
                  fcvt.wu.s    a3, fs4, rup
                  fadd.s       fs9, fs7, fs7
                  srl          a4, t2, s7
                  fcvt.w.s     s1, fa2
                  add          s1, s5, a1
                  fsqrt.s      ft1, ft6, rdn
                  add          s4, s5, s8
                  xor          a6, t4, tp
                  mulhsu       a7, t6, t4
                  remu         gp, a1, a4
                  fclass.s     a4, fa0
                  fclass.s     a1, fs10
                  srai         a2, zero, 29
                  slti         a4, a3, -640
                  slt          t1, t6, s1
                  slli         a4, a2, 24
                  fsqrt.s      ft6, ft1, rtz
                  sll          t4, a6, ra
                  fadd.s       ft3, fs7, ft9, rmm
                  and          sp, a5, a5
                  mulh         tp, zero, a5
                  flt.s        a1, fa7, ft5
                  mulhsu       t5, a0, a2
                  fsub.s       fa6, fs11, fs6, rmm
                  xor          t0, s1, t3
                  fmv.x.w      gp, fa0
                  fcvt.wu.s    tp, ft8, rdn
                  auipc        t3, 157296
                  fcvt.s.w     fa1, a3, rmm
                  mulh         tp, a0, t5
                  andi         a7, t2, 695
                  fsgnjn.s     ft3, ft1, fs1
                  fcvt.wu.s    t4, ft7
                  lui          t2, 400846
                  fmax.s       ft8, ft10, ft11
                  fmax.s       fa4, fa0, ft8
                  slt          s2, s5, a5
                  mulhsu       s6, t6, a3
                  fmax.s       fs10, fs9, fa1
                  divu         a1, ra, a3
                  fcvt.s.wu    fs8, t5, rmm
                  sub          s2, s2, s2
                  xor          a1, t0, a2
                  mul          zero, s1, gp
                  fsgnjx.s     ft3, fs7, ft9
                  sra          t3, a6, a7
                  fcvt.w.s     a7, fa3, rdn
                  fsqrt.s      ft8, fs3, rtz
                  nop
                  sub          a3, s7, gp
                  sub          zero, a7, s4
                  slti         s10, t0, 32
                  rem          t2, sp, a1
                  mulhsu       tp, t6, t6
                  sub          a0, zero, a6
                  mulhsu       zero, gp, s8
                  rem          a5, t4, a4
                  slt          t4, a6, a3
                  fmv.w.x      ft2, t3
                  rem          t5, s11, t6
                  divu         t4, a5, ra
                  mulh         tp, zero, s3
                  fmax.s       fs11, ft8, fa6
                  divu         a5, sp, sp
                  mulh         s10, s11, t6
                  fclass.s     tp, fa6
                  feq.s        a6, ft8, fa7
                  fdiv.s       fa4, ft4, fs9, rmm
                  divu         a1, s10, tp
                  slli         a2, t6, 10
                  fmv.x.w      t5, fa1
                  fmv.x.w      a7, ft2
                  sub          s8, a1, t4
                  srl          t5, sp, t1
                  slli         t6, a0, 9
                  ori          t4, s4, 1499
                  feq.s        s7, ft11, ft9
                  fadd.s       fs9, ft0, fa6
                  fcvt.s.w     ft7, a0
                  fmv.w.x      ft6, s5
                  fmv.x.w      a3, fa5
                  fsqrt.s      fs3, fs0, rne
                  srli         a7, s7, 10
                  andi         t4, s2, 1691
                  sub          t4, a2, t0
                  srai         s1, a7, 5
                  fmv.w.x      ft2, s1
                  add          t2, zero, s6
                  andi         a2, a7, 127
                  flt.s        s9, ft4, ft3
                  xor          s10, s8, s8
                  mul          a5, s8, sp
                  fsub.s       ft10, fs8, fs8
                  and          a4, s10, s1
                  fsgnj.s      fa7, fa1, fs11
                  fsqrt.s      ft4, fs7, rup
                  div          t6, t0, tp
                  rem          t0, t0, s0
                  sltiu        s9, t0, -1799
                  fmul.s       fs7, ft5, ft5
                  add          gp, a5, t5
                  slt          a4, a1, s8
                  fsqrt.s      ft11, ft5, rne
                  fsub.s       ft4, fs5, fs3, rmm
                  fmin.s       ft8, ft1, fa6
                  xori         s4, t2, -1
                  fmv.x.w      zero, fa1
                  srl          zero, tp, t2
                  fle.s        t0, fa1, fs11
                  sltu         s4, t2, t1
                  sltiu        s9, s3, 283
                  fsgnjn.s     ft3, fs8, fa6
                  sltiu        s3, s11, -1607
                  slti         s6, sp, 713
                  lui          s9, 291207
                  fcvt.s.w     ft3, s4
                  addi         sp, zero, -113
                  xori         s3, t1, -995
                  mulhu        s10, s6, gp
                  feq.s        a2, ft4, ft5
                  fsub.s       fs0, ft7, fa1, rup
                  fsgnjx.s     ft1, fa6, ft3
                  sub          a1, s8, s2
                  fcvt.s.w     ft11, t2, rup
                  xori         t2, a4, -1886
                  srl          a6, gp, a7
                  fcvt.w.s     t0, ft0, rne
                  slti         t2, s3, -973
                  fmv.w.x      ft4, s0
                  flt.s        a1, ft9, ft8
                  add          a3, a7, zero
                  fcvt.w.s     t5, fa5
                  fdiv.s       fa7, fa5, ft3, rmm
                  sltiu        a5, gp, 884
                  fsgnj.s      fa7, fa6, fs10
                  fdiv.s       ft6, fa3, fa4
                  srl          a2, a1, s6
                  andi         s9, zero, -1672
                  fmul.s       fa5, fs2, ft2, rmm
                  fmax.s       fs8, fs0, fa6
                  fmv.x.w      s2, fs9
                  feq.s        t0, fs8, fs6
                  auipc        a6, 947751
                  fsgnjx.s     fs10, fs9, ft4
                  fsgnjx.s     fs3, fs5, ft0
                  mulhsu       t0, s0, a5
                  fle.s        s10, fs2, fs5
                  fsqrt.s      fs8, fs9
                  feq.s        s2, fs11, ft5
                  fcvt.w.s     s10, ft1, rtz
                  srai         s6, a5, 18
                  fcvt.wu.s    gp, fa5, rmm
                  mul          s2, a1, s2
                  fmv.x.w      sp, fs10
                  srli         s9, tp, 27
                  auipc        s3, 1043889
                  fcvt.w.s     a0, fa0, rdn
                  fcvt.wu.s    t4, fa2
                  slti         sp, t0, 1525
                  fsub.s       ft7, ft10, fa0, rdn
                  addi         ra, s6, 1545
                  sll          t6, t1, s11
                  xori         t3, s7, 47
                  xori         sp, s0, 1555
                  srl          a5, ra, sp
                  fcvt.w.s     t2, fs10, rup
                  fsgnjn.s     fa6, fa1, ft1
                  fsqrt.s      ft9, fa7, rtz
                  sltiu        a7, t1, 1737
                  fmv.x.w      t0, ft1
                  fadd.s       ft6, fs8, ft0, rmm
                  fadd.s       fa6, fa4, fs4
                  fmin.s       fs10, ft5, fs1
                  mulhu        ra, s8, s11
                  fsgnjx.s     ft6, fa1, fs7
                  sub          a1, t6, a7
                  mulh         a3, t6, s9
                  mulhu        a6, t4, t4
                  xori         t3, t1, -544
                  fmin.s       ft10, fs1, ft7
                  sub          s6, gp, a4
                  slti         a6, a3, 1819
                  divu         s7, a5, s11
                  slli         t5, s6, 22
                  mulh         s4, a5, t5
                  fclass.s     a7, fa4
                  fclass.s     a5, fs10
                  fcvt.s.w     ft0, t6, rdn
                  sltu         a3, a0, zero
                  auipc        a3, 759339
                  sltu         t6, s11, s6
                  fadd.s       ft6, ft3, ft7
                  fcvt.s.w     ft0, gp, rdn
                  fcvt.s.wu    fs7, s9, rmm
                  sltiu        s7, s10, 2019
                  sltu         s7, gp, s7
                  slt          s3, t0, t6
                  fsgnjx.s     fs9, fs10, ft9
                  srai         s7, s8, 20
                  mulh         t1, a5, a2
                  sll          sp, a4, a0
                  lui          s10, 15112
                  fcvt.wu.s    s1, fs11
                  add          t2, s10, s6
                  fcvt.wu.s    t1, fa3, rne
                  sltu         tp, t3, zero
                  lui          s1, 507010
                  fsqrt.s      fs5, ft8
                  srl          a4, s1, a1
                  fsub.s       fa7, fs0, fa1, rmm
                  and          t1, t6, s11
                  sll          a5, ra, s8
                  feq.s        s8, ft0, ft7
                  fmul.s       ft5, ft6, fs6, rne
                  slli         zero, s0, 10
                  fadd.s       ft3, ft8, fa5
                  srli         s2, tp, 20
                  srl          s2, a4, s8
                  div          s4, t5, tp
                  xor          t4, ra, ra
                  fsgnj.s      ft1, fs6, fs11
                  slti         t3, s11, -1220
                  andi         a1, gp, -1447
                  fmin.s       fa4, ft2, fs6
                  or           a0, t3, a7
                  fsub.s       fs3, fs6, fa1, rdn
                  rem          s1, t2, s6
                  fmv.x.w      s8, fs1
                  fcvt.s.w     fa4, t6, rne
                  xor          t6, t2, s10
                  mulh         s10, tp, a0
                  fsgnj.s      ft1, fs10, fs9
                  mulhsu       t0, t2, s10
                  fsqrt.s      ft9, fs10, rdn
                  xori         a3, t1, -809
                  fcvt.s.wu    fs2, ra
                  divu         t0, a2, a5
                  fmin.s       fa1, fa5, ft6
                  mulh         s9, tp, t2
                  sub          t6, s7, s5
                  fmin.s       fa3, fs9, fs7
                  xor          s7, s1, s6
                  fsgnj.s      ft11, ft9, ft10
                  fsqrt.s      fs9, fs5
                  fcvt.s.wu    fs0, zero, rdn
                  fmv.w.x      ft8, t2
                  sltiu        a4, t6, -481
                  and          s7, a1, s10
                  srai         a6, s4, 8
                  flt.s        s9, ft4, ft7
                  auipc        a4, 330038
                  fclass.s     a3, fs9
                  mulhu        ra, a3, s8
                  auipc        t5, 26117
                  fcvt.s.w     fa2, tp, rdn
                  rem          a6, a2, s9
                  mul          a4, t2, s7
                  addi         a1, s9, -20
                  mulhu        a1, s1, s7
                  fclass.s     zero, ft10
                  srli         tp, s0, 8
                  sltiu        s3, a3, 1030
                  sra          zero, s9, a4
                  fsgnjn.s     ft9, fs6, ft10
                  mulhu        s2, t5, sp
                  ori          t3, ra, -1761
                  lui          t4, 287578
                  fsgnj.s      fs7, fa4, ft3
                  rem          sp, s3, a4
                  andi         a1, s6, 834
                  mulh         t4, a4, a6
                  fcvt.wu.s    t4, fa0, rmm
                  fmin.s       ft11, fa6, ft7
                  sltiu        zero, s10, 331
                  feq.s        s10, fs4, fs2
                  fadd.s       fs4, fa2, ft7, rup
                  fcvt.w.s     a3, ft0, rdn
                  sltu         s9, s8, zero
                  fsqrt.s      fs11, fs10, rmm
                  or           a1, s8, s5
                  fcvt.wu.s    t0, fs1, rmm
                  srl          s9, s10, s9
                  fcvt.s.wu    ft4, zero
                  sra          t3, tp, s6
                  sub          a0, s7, a2
                  fcvt.s.wu    ft11, a1, rtz
                  fmv.w.x      ft0, s3
                  slti         zero, t0, -1984
                  fsub.s       fs4, fs8, ft9, rdn
                  slt          a2, s11, t6
                  mulh         zero, t1, zero
                  fmax.s       fs5, ft1, ft8
                  fsub.s       fa7, ft3, fa7
                  slt          t2, a5, tp
                  mul          t1, t2, s3
                  addi         a1, sp, 1186
                  fsgnjn.s     ft7, ft1, fs6
                  mul          s9, s7, a4
                  sll          s4, t2, t6
                  fcvt.w.s     s8, fs0, rup
                  andi         s2, s2, 365
                  sra          s10, a6, a4
                  lui          a6, 15727
                  sra          s1, s2, a3
                  mulhu        s7, t0, s9
                  srl          s9, s10, a2
                  fmv.x.w      zero, ft6
                  srli         s3, t3, 22
                  sub          t2, s10, a6
                  mulhsu       t6, s11, s0
                  or           s9, zero, s4
                  fclass.s     a5, ft1
                  fadd.s       fs7, fa5, ft4
                  divu         s1, t6, t1
                  fcvt.s.w     fs2, t6, rne
                  rem          t3, a6, zero
                  fsgnjn.s     ft10, fs10, ft7
                  and          t1, t5, s2
                  slti         t6, t1, -1984
                  addi         zero, s5, 1266
                  fsgnj.s      ft1, ft0, fa4
                  slti         a5, s8, -1708
                  or           tp, a5, s1
                  flt.s        t1, ft4, ft6
                  addi         s10, s1, 127
                  srai         s3, s1, 23
                  fsgnj.s      fa3, ft6, ft11
                  fmin.s       ft10, fs1, ft10
                  fcvt.s.w     ft4, a1, rdn
                  divu         a3, s3, zero
                  slt          s8, a0, s0
                  slli         a3, a4, 2
                  mulh         s9, s9, a0
                  ori          t4, s4, -1033
                  feq.s        s6, fa2, fa0
                  or           s10, a2, a0
                  ori          s10, s4, -1255
                  fmul.s       ft3, ft10, ft2, rmm
                  slti         s6, a0, -607
                  fcvt.s.w     fs6, s2, rup
                  fmul.s       fs5, fa5, ft11
                  fle.s        t4, ft7, fs4
                  sltiu        t3, a7, -1053
                  fcvt.s.wu    ft6, t0
                  rem          a7, s1, a1
                  add          a1, a6, a5
                  addi         gp, t6, 942
                  add          a2, s5, t1
                  fsub.s       fa0, ft7, fs4, rtz
                  slt          s4, tp, s5
                  mulhu        a1, a6, s6
                  fmin.s       ft3, ft7, fs9
                  feq.s        zero, fs0, fs8
                  fsgnj.s      fs4, fs2, fa4
                  fmax.s       fs7, ft8, ft11
                  addi         a0, s9, 1640
                  mul          s2, t4, s2
                  fadd.s       ft9, ft2, fa1
                  divu         s1, t5, a1
                  and          gp, tp, tp
                  fmin.s       fs9, ft1, ft7
                  fmv.x.w      t3, fa3
                  mul          a0, t3, a6
                  fsgnjx.s     fs5, fs8, fs4
                  nop
                  srli         gp, s2, 31
                  fle.s        zero, fs7, ft6
                  fdiv.s       fs4, fs9, fs3, rtz
                  fle.s        t5, fs0, fs7
                  lui          a6, 662889
                  addi         t6, s10, -1954
                  and          s10, zero, s3
                  sltiu        s4, s0, -1663
                  mulhu        t1, s11, s1
                  xori         ra, t6, -1093
                  fcvt.wu.s    a6, ft9
                  divu         t5, s11, s9
                  slt          tp, s9, s3
                  remu         s3, s1, sp
                  mulhu        a7, a1, zero
                  mulhu        s4, s11, a7
                  fmv.w.x      ft2, s8
                  srli         a3, a6, 11
                  fmin.s       ft4, fs4, ft0
                  divu         s4, a7, a5
                  div          s2, zero, gp
                  fsub.s       fa2, fs4, fs4, rne
                  xor          s6, s8, a6
                  fmv.x.w      s7, fs9
                  fdiv.s       ft9, fs6, ft7, rup
                  feq.s        s4, fs8, fa6
                  fcvt.w.s     s3, fs11
                  feq.s        a1, ft1, fs8
                  mulh         a4, a0, gp
                  fmin.s       fs5, fa3, fs0
                  fcvt.s.wu    fs0, t3
                  fmv.x.w      ra, fa3
                  fsqrt.s      fa2, ft3
                  andi         tp, s10, 809
                  mulhsu       t3, t5, s6
                  ori          s4, s10, -1929
                  srl          a6, a1, s9
                  xori         gp, s9, -1400
                  fmv.w.x      ft9, t5
                  divu         a1, ra, a2
                  fcvt.w.s     t3, ft7, rtz
                  srai         zero, s8, 13
                  andi         t0, a6, -1073
                  add          s4, s3, a0
                  or           t6, sp, s1
                  fadd.s       ft1, fs7, fs6, rne
                  fsqrt.s      ft5, ft3, rmm
                  slti         s1, s4, -161
                  flt.s        a5, ft10, ft3
                  mul          t3, t2, t1
                  slti         a5, s1, -611
                  srl          a0, s7, a2
                  fcvt.s.wu    ft7, sp
                  fmax.s       fa2, ft0, fs10
                  remu         s3, t0, a5
                  lui          s4, 145349
                  fsgnj.s      fa6, fs4, ft3
                  fcvt.s.w     ft10, a0, rne
                  fcvt.s.wu    fs10, t5, rne
                  sra          t2, t6, a1
                  and          t0, a5, a0
                  fsgnjx.s     ft4, fs9, fa0
                  fcvt.s.w     fs11, t3, rdn
                  fsgnjx.s     fa5, fa3, ft9
                  nop
                  sub          a6, s7, s9
                  slt          t1, zero, ra
                  fsub.s       ft5, fa6, fa1
                  slli         a7, ra, 16
                  lui          a7, 876582
                  slt          s2, a2, s3
                  sltiu        a2, ra, -1889
                  xor          s6, t0, s9
                  nop
                  remu         ra, tp, s5
                  fcvt.w.s     a2, fs11, rne
                  add          s4, t6, t3
                  xori         ra, ra, -3
                  fclass.s     s1, ft0
                  fle.s        ra, fa0, fs1
                  srl          a6, s8, s8
                  slti         t1, tp, 1450
                  fsgnjx.s     fa0, fs3, ft10
                  srl          s3, a1, s8
                  addi         a5, s6, 1701
                  fsub.s       fa2, ft9, fs11, rmm
                  fsqrt.s      fa5, fa7
                  fsgnjx.s     ft10, ft5, fa4
                  fsub.s       ft2, ft5, fs9
                  fmv.x.w      ra, fs3
                  fclass.s     s8, fs10
                  mul          gp, s6, s10
                  fmin.s       ft10, ft2, fs11
                  and          a5, s9, zero
                  srli         s10, a7, 26
                  sltu         a1, a4, t4
                  fcvt.wu.s    s4, fs9, rtz
                  fcvt.s.w     fs0, a4
                  xori         t3, t0, 1612
                  addi         zero, t2, -433
                  fmax.s       ft6, ft9, fa2
                  sll          t0, a1, tp
                  flt.s        gp, ft3, fa3
                  fmul.s       fs7, fa1, ft1, rmm
                  fmax.s       fa0, ft0, fs5
                  fclass.s     s7, ft2
                  rem          t1, s0, a7
                  add          s9, a1, a0
                  fmv.x.w      s9, fs9
                  feq.s        s1, fs9, fa6
                  fmin.s       ft10, fa4, fs7
                  xor          a4, tp, ra
                  slli         sp, t6, 17
                  fcvt.w.s     a6, ft7
                  slli         t5, ra, 9
                  fdiv.s       fa5, ft7, fs2, rne
                  lui          a3, 35712
                  fcvt.wu.s    t2, fs9, rdn
                  div          s8, tp, a0
                  fdiv.s       fa7, fa3, ft0, rne
                  fsub.s       ft4, fs11, ft6
                  fcvt.w.s     s9, ft3
                  fcvt.wu.s    t0, fs1, rmm
                  feq.s        a7, fa6, ft11
                  sub          s4, s6, t4
                  fsqrt.s      ft1, ft9, rtz
                  ori          a4, gp, 590
                  fmv.w.x      fs11, a3
                  fsgnjx.s     fs0, ft10, fa1
                  divu         a4, t4, a4
                  mul          s2, t1, a1
                  slti         a3, t6, 1903
                  srl          s1, s11, t2
                  lui          s10, 87832
                  fsgnjx.s     fs5, fs9, fs9
                  srli         s10, sp, 12
                  div          ra, t1, s6
                  rem          a3, t2, tp
                  sll          t5, ra, sp
                  sltiu        ra, t6, 1007
                  sub          t4, s0, sp
                  fsgnjn.s     fa2, fs7, ft6
                  fcvt.wu.s    s8, fs9, rne
                  fmv.w.x      fa2, s8
                  fsgnjx.s     fa2, ft7, ft10
                  fmv.w.x      fs2, t2
                  fsgnjx.s     fs6, ft10, ft4
                  remu         t4, s2, t2
                  mul          a1, sp, s9
                  sra          s10, ra, ra
                  fsgnjx.s     fa6, fs8, fs0
                  fdiv.s       fa1, ft3, fs3, rup
                  lui          t5, 628821
                  lui          s2, 668304
                  remu         t3, s2, a3
                  fmax.s       ft9, fs9, ft6
                  srl          t1, a0, s1
                  fsgnj.s      ft7, fa7, fs8
                  fcvt.s.w     fa7, t5, rne
                  xor          s10, a1, t0
                  lui          a2, 399777
                  slti         a7, a5, 1187
                  slti         a0, gp, 978
                  fmin.s       ft8, ft3, fa0
                  andi         t6, s0, -62
                  fmin.s       fs4, ft10, ft11
                  andi         t2, a3, 1663
                  fmv.x.w      tp, fa1
                  fdiv.s       fs8, ft6, fs7
                  nop
                  fcvt.wu.s    sp, fs11
                  mulhu        s9, t0, t0
                  ori          a6, s10, 11
                  rem          t1, ra, s9
                  andi         s9, t1, -750
                  and          t2, s2, t3
                  srli         t3, zero, 0
                  srai         s9, tp, 7
                  sltu         a1, ra, t2
                  sra          a7, ra, zero
                  srai         s10, a6, 29
                  mulhu        ra, s3, s8
                  lui          s9, 663361
                  fsgnj.s      ft3, ft11, fs8
                  ori          gp, s8, 812
                  sltiu        t2, t1, 1612
                  andi         a1, s10, -1898
                  mulh         ra, tp, a6
                  remu         zero, t2, a7
                  mulhu        a1, a7, a3
                  mulh         zero, s2, t4
                  fmv.w.x      ft6, t6
                  add          t4, s8, s4
                  lui          zero, 342005
                  fmin.s       fa6, ft5, ft1
                  auipc        a7, 102410
                  andi         zero, t0, -1377
                  fsgnjn.s     fa3, fa4, ft4
                  xori         s7, s2, -363
                  slt          s7, s8, a6
                  xori         t2, t2, 976
                  fadd.s       fs4, ft7, ft9, rne
                  xor          t3, t3, zero
                  lui          s1, 340368
                  sltiu        zero, a5, -1140
                  rem          s8, s10, tp
                  srai         s1, a1, 16
                  sub          tp, s0, s5
                  srl          a4, a1, t0
                  auipc        a0, 423992
                  fclass.s     a4, ft10
                  mul          a7, s8, zero
                  sub          a4, t5, a3
                  or           s6, t2, s5
                  mul          s4, t0, s7
                  slli         s1, sp, 6
                  slli         ra, s10, 30
                  nop
                  fsqrt.s      fs3, ft6
                  fcvt.s.wu    fs1, t4
                  auipc        gp, 240186
                  auipc        a1, 90653
                  srai         tp, a4, 18
                  fmin.s       fa1, ft9, fa5
                  div          s1, s7, a6
                  or           t6, a7, tp
                  fdiv.s       fs8, fa2, fs10
                  divu         t6, t3, t0
                  fsgnjx.s     fa1, fs0, fa7
                  mulhsu       s6, a5, t4
                  fsqrt.s      ft0, ft8, rmm
                  fcvt.w.s     a7, fa0, rdn
                  xori         s7, s6, -1045
                  fmv.x.w      gp, fa0
                  srai         t6, s6, 19
                  xor          a4, t5, s11
                  fdiv.s       fa5, fa5, fs6, rtz
                  fcvt.s.wu    fs2, s4
                  nop
                  fsgnjx.s     ft4, fa2, fs0
                  sra          a7, t6, s7
                  srl          a4, t1, s9
                  rem          s2, tp, a5
                  slli         s4, t6, 7
                  andi         a3, a5, 1294
                  addi         s7, s4, 178
                  fsqrt.s      fa2, fa0, rne
                  xori         s7, s6, -260
                  remu         a7, a6, tp
                  fsqrt.s      fa3, ft4, rne
                  fmv.w.x      ft6, a7
                  slti         a0, t5, -1002
                  sub          tp, s4, s0
                  rem          a2, a4, s10
                  fmin.s       fa5, ft9, fs4
                  div          s1, s6, t5
                  div          a0, t1, s11
                  rem          a5, a0, s0
                  addi         a7, s8, 1137
                  lui          t5, 1012895
                  fadd.s       ft0, fs2, fa3
                  feq.s        s9, fa7, fa7
                  lui          a3, 295197
                  fmv.x.w      s8, fs11
                  fcvt.s.w     ft3, s2, rdn
                  fcvt.w.s     t3, ft0, rdn
                  mulhsu       a3, t2, gp
                  fsub.s       ft0, fa5, fs2, rmm
                  fadd.s       fs7, fa3, fa0, rne
                  srli         a2, t2, 4
                  fcvt.w.s     zero, ft2
                  srai         s9, a6, 3
                  srli         tp, sp, 7
                  srl          s6, s9, t1
                  fmax.s       ft0, fa1, fa2
                  mulhsu       t0, a1, zero
                  fdiv.s       fa5, fs1, fa2, rup
                  sltiu        s6, sp, 933
                  or           gp, a0, a0
                  auipc        sp, 252353
                  fcvt.wu.s    t0, fs0
                  fadd.s       ft7, ft3, ft9, rtz
                  and          a7, t0, a2
                  srli         a6, t1, 19
                  fcvt.s.wu    fa2, s5
                  sub          s3, s11, zero
                  andi         s6, t3, 757
                  fadd.s       ft3, ft6, ft6, rup
                  xor          a3, s2, gp
                  fcvt.s.wu    fs5, t4
                  fsgnjn.s     fs1, fa3, ft7
                  fadd.s       fa0, fs5, ft11, rdn
                  or           t0, a3, t1
                  mulh         s8, s6, t5
                  srai         s9, s10, 11
                  flt.s        a7, fs8, fs11
                  fcvt.s.w     fa4, t0
                  fmv.x.w      s8, fa0
                  mulhsu       a7, t4, s0
                  slti         a0, t0, -1322
                  fdiv.s       fs6, ft6, fs7
                  fsgnj.s      ft3, fa2, ft9
                  fmin.s       ft2, fs2, fa7
                  add          gp, t3, s11
                  srai         a1, s2, 30
                  fsgnj.s      ft7, fa1, ft5
                  slt          s3, t4, a2
                  slti         sp, t2, -35
                  ori          a6, t6, -263
                  fcvt.wu.s    t0, fs1, rtz
                  lui          t0, 981019
                  lui          t2, 57337
                  div          a7, t6, s1
                  or           a4, a6, s2
                  fdiv.s       ft4, ft10, fa0
                  fmax.s       fa5, ft8, fs9
                  fcvt.s.wu    fa7, t5
                  mulhsu       a7, s3, a3
                  srl          a0, s3, s3
                  fclass.s     s10, ft1
                  mulhu        gp, t0, t1
                  slti         a7, a6, 249
                  ori          t1, s7, -1271
                  fsub.s       ft10, fa5, ft10
                  xor          a0, s5, s2
                  srl          a0, s0, s1
                  slli         a4, s5, 21
                  fcvt.s.w     fs3, gp, rup
                  divu         s8, t2, t5
                  auipc        t5, 649480
                  sub          s4, s2, a2
                  fadd.s       ft4, fs5, ft6
                  srli         a6, sp, 30
                  remu         a1, s1, a2
                  add          ra, s9, ra
                  fmv.x.w      s2, fs3
                  rem          a3, a0, a3
                  flt.s        zero, fs7, fs10
                  sltiu        t0, s9, 1644
                  div          s3, s0, a0
                  feq.s        s7, fa2, ft5
                  fcvt.s.w     fs6, s9
                  divu         t0, a5, s7
                  fsqrt.s      fs2, fa2, rne
                  fmin.s       fs6, fs3, fs3
                  slli         a7, zero, 30
                  addi         a7, t4, 1757
                  xori         s10, t5, -530
                  mulh         tp, sp, a6
                  fmax.s       ft10, ft10, ft2
                  mul          s1, s2, ra
                  fsgnjn.s     ft9, fs2, fs8
                  fsub.s       fs3, ft7, fs5
                  fcvt.s.w     fs9, s11
                  div          t5, ra, t6
                  mul          gp, a3, s11
                  sltu         t3, t0, zero
                  fcvt.s.w     fs7, a0
                  mulhu        tp, a0, a2
                  sltu         sp, t2, s0
                  or           s6, a3, s0
                  fsgnjn.s     fs7, fs5, fs10
                  srai         t2, a1, 14
                  fmax.s       fs1, ft5, fa1
                  fsub.s       ft2, ft2, fs6
                  slli         t4, s7, 4
                  mulhu        zero, tp, a6
                  rem          a6, gp, s8
                  fle.s        t0, ft9, ft0
                  addi         t6, s2, 83
                  sltiu        s7, t2, 864
                  fmin.s       fa2, fs5, ft11
                  sra          s10, t1, s9
                  fdiv.s       fs6, ft0, fs5, rtz
                  srli         s9, tp, 6
                  fcvt.wu.s    a6, ft9, rtz
                  fmin.s       ft6, ft4, fs1
                  addi         a0, a0, -1106
                  flt.s        t6, fa6, fs0
                  and          zero, s8, ra
                  fsgnjx.s     fa4, ft5, fs4
                  xori         zero, zero, 1662
                  fcvt.s.w     ft1, s1
                  slli         a4, t2, 30
                  fcvt.wu.s    s6, ft3, rup
                  slt          sp, t2, s11
                  fmax.s       ft2, fs11, fs8
                  div          ra, a0, t4
                  slti         s9, ra, -318
                  fsgnjx.s     ft4, fs8, fa0
                  fcvt.w.s     gp, fs1
                  srl          ra, ra, s0
                  flt.s        a4, ft4, ft2
                  fmul.s       ft10, fa2, fa3, rmm
                  slt          a0, sp, t3
                  fcvt.s.w     ft1, s11
                  fdiv.s       fa4, fs4, ft10
                  mulh         t2, s7, ra
                  fsub.s       fs11, fa6, ft2
                  and          s1, s5, s5
                  fclass.s     s3, fs3
                  fcvt.w.s     a0, ft0
                  sub          t2, a7, a2
                  fmax.s       ft7, fs2, fs2
                  divu         t1, tp, ra
                  sltiu        zero, t6, 392
                  and          a7, s1, a1
                  fmv.w.x      fa4, a7
                  srl          a2, a6, t5
                  sub          gp, a4, a7
                  fcvt.s.w     fs1, t2
                  sltu         t2, s9, zero
                  sltu         t1, a2, s6
                  fcvt.w.s     s2, fs11
                  fmax.s       ft2, fa6, fa7
                  xor          s7, ra, gp
                  fmin.s       ft5, fa1, fs4
                  fcvt.s.w     fs10, ra
                  flt.s        a0, ft11, ft5
                  andi         t4, t0, -146
                  ori          t0, s7, -1361
                  srl          a0, t5, gp
                  fsgnj.s      fs10, fa3, ft6
                  div          s6, s11, t6
                  fcvt.w.s     gp, ft8, rmm
                  flt.s        t6, ft8, ft7
                  ori          tp, s2, -633
                  xor          s1, a2, a6
                  sltu         s6, s9, t1
                  fsgnjn.s     ft8, ft6, ft0
                  mulhsu       zero, a2, ra
                  rem          s9, a0, t6
                  fcvt.s.w     fa5, a3
                  mulh         a4, s6, a7
                  andi         t1, t5, 1961
                  srl          a1, a2, a7
                  fsgnjx.s     ft6, fa6, ft0
                  divu         zero, a7, t5
                  srai         a1, a4, 20
                  andi         a1, t3, -664
                  srai         s1, ra, 15
                  fle.s        s10, fs9, fs3
                  fsqrt.s      ft1, fs1
                  and          zero, s9, a2
                  add          t2, s2, s8
                  fmv.x.w      t2, ft3
                  div          gp, a1, ra
                  andi         a6, t5, -2034
                  nop
                  divu         s10, t1, s1
                  fcvt.s.w     ft6, a3
                  srli         s9, t4, 30
                  rem          a3, a5, s10
                  fsgnj.s      fa4, ft1, fs2
                  mulhu        s1, s3, a7
                  slli         s2, tp, 1
                  sra          t4, a6, a4
                  divu         t6, a2, s7
                  fsgnjn.s     fs0, fs5, fs10
                  fmax.s       fa0, ft10, fs11
                  fcvt.s.wu    fs4, a5
                  lui          s8, 346999
                  sub          a0, a6, a0
                  mulh         s7, a2, s8
                  sll          t2, t0, s11
                  fadd.s       ft4, fa3, ft1, rtz
                  fmul.s       fs11, fa1, ft8, rtz
                  fdiv.s       fa5, fs3, fa1, rne
                  fmv.w.x      fa4, gp
                  sltu         t5, s5, s5
                  slt          t3, s8, t1
                  mulh         s7, a2, a2
                  sll          t1, a1, a1
                  remu         s1, tp, a5
                  feq.s        t2, ft11, ft8
                  fmul.s       fs2, ft7, ft7, rdn
                  or           s4, a4, t3
                  auipc        s3, 732249
                  fcvt.wu.s    t3, fs0, rup
                  sra          s8, a5, s6
                  fmv.w.x      ft7, a1
                  fsgnj.s      fs7, fa4, ft7
                  fle.s        t6, fa4, fa4
                  sub          s2, zero, s9
                  srl          s10, s4, a1
                  fmv.w.x      fs0, s8
                  mulh         tp, s5, t2
                  or           t1, a6, a6
                  lui          zero, 28467
                  fsub.s       fa4, fs10, fs9
                  addi         t6, s8, 434
                  mulh         t2, t5, a6
                  srl          tp, ra, s9
                  slt          tp, sp, s7
                  srl          t0, a3, s6
                  remu         s8, a5, sp
                  sll          s7, t6, a1
                  add          s10, a2, tp
                  add          t2, a6, t1
                  sltu         zero, a1, s9
                  slti         s1, s8, -861
                  fclass.s     t0, ft5
                  nop
                  fcvt.s.w     ft2, t0, rup
                  mulhu        s6, a1, gp
                  fdiv.s       ft11, fs5, ft9, rdn
                  addi         a5, t1, 1275
                  fsub.s       ft1, ft9, fa7, rdn
                  fclass.s     a1, fs1
                  or           a6, a5, s9
                  xor          s8, zero, t0
                  addi         s10, s5, 1927
                  fmul.s       ft2, fa4, ft6, rdn
                  fsgnjn.s     fs10, fs11, ft0
                  srl          s1, s11, s7
                  mulh         s2, s9, t5
                  fsgnj.s      fa2, fs6, ft0
                  add          a2, s7, s5
                  add          a4, gp, ra
                  div          tp, t4, s11
                  sll          t2, a5, t5
                  fsub.s       fs5, fa7, fs8
                  fclass.s     a4, fa1
                  srli         s10, t3, 14
                  slli         a7, a2, 29
                  fmax.s       fs0, fs9, fs8
                  or           a0, t2, t2
                  flt.s        t5, ft6, fa3
                  srai         s9, t0, 17
                  xori         tp, t0, 234
                  sub          t2, gp, gp
                  fsgnjn.s     fa7, fa0, fa7
                  auipc        t1, 705791
                  and          a0, ra, s2
                  addi         a2, ra, 501
                  mulhu        a1, s4, t0
                  fcvt.w.s     a4, fa1, rup
                  div          zero, s4, a5
                  mulhu        gp, t1, t4
                  fsqrt.s      fa0, fs2
                  fle.s        a2, fa7, ft8
                  fcvt.wu.s    a3, ft10, rtz
                  xor          tp, t4, t1
                  sll          t6, s9, s11
                  fcvt.wu.s    a7, fa1
                  and          s7, a1, s9
                  sra          t4, a5, s6
                  and          a5, s0, s3
                  andi         a3, a2, -754
                  fmv.x.w      s1, fs5
                  nop
                  srl          a3, s6, t2
                  fle.s        gp, ft1, ft4
                  fmin.s       fa7, fa3, fs11
                  ori          t4, a2, 1838
                  fcvt.s.wu    fa2, s4, rmm
                  div          a3, t0, s0
                  rem          a6, t3, a7
                  slt          t6, t3, t0
                  slli         t2, s1, 6
                  srli         a6, s8, 15
                  sltu         t2, s3, s5
                  fmax.s       fs1, fa4, fs9
                  mul          a3, ra, a0
                  sub          s9, tp, t4
                  slt          t2, s0, s1
                  auipc        s9, 153107
                  fsgnjn.s     fs4, fs3, fs0
                  srai         s4, t5, 14
                  slt          s8, a4, ra
                  rem          s1, ra, t4
                  xor          a7, s0, tp
                  xori         sp, s11, 1263
                  fcvt.w.s     s8, fs2, rne
                  auipc        a0, 872697
                  fsgnjx.s     fs8, fa6, fa0
                  andi         s8, t4, -869
                  auipc        s7, 5021
                  sltu         t3, a2, s10
                  add          ra, t3, a5
                  remu         s9, s4, a1
                  fmul.s       fs7, ft11, fs10
                  fcvt.s.wu    ft5, s3
                  sub          t6, s7, s1
                  remu         t0, sp, a1
                  fclass.s     t6, fa4
                  divu         s6, s4, a6
                  mulhsu       s10, tp, a0
                  mulh         ra, a0, s4
                  fmul.s       fs3, fs0, fa1
                  sra          s3, sp, t0
                  sltiu        a0, a1, 890
                  fsgnjx.s     fs5, ft11, ft5
                  xor          s2, s6, sp
                  feq.s        s3, ft2, ft0
                  slt          s2, s2, s7
                  fsub.s       fa2, fa2, ft7
                  fcvt.w.s     a1, fs2
                  divu         sp, a4, s8
                  fdiv.s       fs1, ft11, fs1
                  sra          s9, s9, s7
                  mulhu        t3, s1, t4
                  flt.s        s2, ft9, fa2
                  sll          s1, t5, a1
                  fadd.s       ft3, ft2, fs4, rne
                  sub          s8, s5, t2
                  fcvt.s.wu    fs7, t3
                  div          ra, a4, t5
                  xori         t3, s11, -148
                  fmax.s       fs4, fs5, fs4
                  mulh         s10, t3, tp
                  and          s8, gp, t3
                  slt          t1, a4, a0
                  fsqrt.s      fa1, fa5, rmm
                  auipc        a2, 539535
                  fsub.s       ft7, ft3, ft7
                  fcvt.w.s     sp, fs4, rup
                  rem          ra, a3, a4
                  slt          s6, tp, t2
                  fsqrt.s      ft1, fa6, rdn
                  andi         s2, s6, 1313
                  slt          t2, t6, s4
                  sub          a1, s10, t2
                  fadd.s       fs1, fs10, fs1
                  fclass.s     t5, ft11
                  fsgnj.s      ft1, ft1, ft8
                  fcvt.w.s     s6, fa2, rtz
                  add          a4, s4, s5
                  fcvt.s.wu    ft10, s1, rmm
                  xori         a6, sp, 696
                  fcvt.s.w     ft2, s0, rmm
                  sltu         zero, gp, t6
                  and          s3, a1, t1
                  fsqrt.s      ft1, fa2, rtz
                  slt          t3, s7, s3
                  srai         sp, s2, 16
                  mul          s4, t2, t4
                  fcvt.wu.s    sp, fs10, rtz
                  xori         s4, s10, -1352
                  sub          s3, s2, a1
                  srli         t4, t6, 5
                  fcvt.wu.s    s7, fs1, rne
                  mulhsu       ra, s0, s8
                  add          s10, a4, ra
                  mul          t0, t3, s8
                  fmv.w.x      fa5, a6
                  srai         a7, t2, 4
                  divu         t3, a5, zero
                  sltu         s4, a5, a2
                  div          t3, s1, a1
                  fmul.s       fs1, ft8, fa2
                  fmax.s       fa0, ft8, ft8
                  auipc        s6, 899190
                  fsgnjx.s     fa5, fa2, fs11
                  fsgnjn.s     fs5, ft1, fa5
                  fdiv.s       fa6, fa0, fa3, rup
                  srai         a0, s6, 13
                  srai         s6, a0, 22
                  fclass.s     t4, ft1
                  srli         s6, s8, 11
                  fcvt.s.w     ft6, t1
                  fmul.s       fa2, fa0, fs6, rtz
                  fclass.s     s2, fs9
                  fsgnjx.s     fs6, fa1, fs6
                  fsgnjn.s     fs3, fa5, fs8
                  sub          s7, t6, s2
                  remu         a6, s4, t5
                  mulhsu       a6, t5, s8
                  sll          t6, a0, s8
                  slt          t2, s5, s0
                  fsqrt.s      fa6, ft2, rdn
                  mulh         s4, t3, zero
                  fadd.s       fs6, ft0, ft10, rup
                  mulhsu       a3, t3, a0
                  fdiv.s       fs4, fs9, fa3, rne
                  mul          s6, s11, sp
                  mulh         a6, s7, t4
                  fsgnjn.s     ft2, fa7, fs8
                  sra          t1, zero, t1
                  srai         s9, t4, 17
                  slti         a5, a3, 1618
                  sra          zero, ra, ra
                  add          a3, s6, a5
                  add          t6, ra, a5
                  xori         s3, a1, -2014
                  rem          ra, t2, s5
                  div          s3, s10, a3
                  flt.s        gp, fs1, ft0
                  mulh         t0, t5, a1
                  flt.s        s2, fs0, fs9
                  srl          sp, ra, s11
                  mulhu        s3, s1, s7
                  fmax.s       ft0, fa0, fs7
                  fclass.s     a4, ft7
                  rem          a7, a1, s8
                  fadd.s       ft7, fs0, fs9
                  fcvt.s.w     ft1, a3, rup
                  fadd.s       fs8, fs11, fa1
                  and          s9, t3, t1
                  nop
                  andi         tp, s3, 775
                  fsub.s       ft8, fs6, fs8, rmm
                  srai         s10, a2, 27
                  fmv.x.w      a6, ft11
                  auipc        s9, 537702
                  mul          a3, a0, gp
                  mulhu        s7, s1, tp
                  fmv.x.w      t4, fs4
                  rem          s7, s2, s4
                  fsgnjx.s     fs10, fa4, ft5
                  add          a5, t3, s1
                  div          a6, s0, t2
                  fclass.s     s3, fs2
                  fmin.s       fa1, fa7, ft5
                  srli         s7, a1, 17
                  fmax.s       ft8, ft6, fs6
                  remu         gp, t4, a3
                  addi         s2, a1, -179
                  fcvt.s.w     ft7, tp
                  fdiv.s       ft0, ft2, ft7, rmm
                  ori          s10, s11, 789
                  fclass.s     t2, fa5
                  addi         t6, a5, -878
                  slt          s8, t2, s9
                  fle.s        s7, ft9, fa3
                  srai         t1, t0, 24
                  addi         t0, s4, 1647
                  fmax.s       fs4, fa1, ft7
                  slti         a6, s9, 613
                  fcvt.wu.s    t2, ft3
                  divu         t3, a7, a3
                  mul          ra, s8, s10
                  fsqrt.s      fs2, fs9
                  addi         zero, s6, -1703
                  sra          a4, s8, s11
                  fcvt.s.wu    fs9, t6, rne
                  auipc        gp, 270343
                  fmul.s       fs10, ft7, ft9
                  flt.s        s4, ft8, ft6
                  fdiv.s       ft0, fs8, fa4, rdn
                  sub          t5, a6, sp
                  add          a4, t5, t0
                  divu         gp, t1, sp
                  slli         gp, a0, 31
                  fcvt.w.s     s1, fs1, rup
                  fcvt.s.w     fs6, a0, rne
                  or           t5, s9, t0
                  flt.s        a5, fa0, fa5
                  fmv.x.w      s3, ft3
                  rem          t3, a7, s1
                  fdiv.s       ft8, ft6, ft9, rtz
                  addi         s9, s0, -1667
                  srai         t0, s4, 10
                  fcvt.wu.s    t1, fs1, rne
                  div          a1, s10, t4
                  fcvt.w.s     s6, fs8, rtz
                  fmv.w.x      ft1, sp
                  fsqrt.s      fa2, fa1, rdn
                  fsgnj.s      fa5, fa6, fa7
                  nop
                  sll          s10, a2, a3
                  mulhu        t5, a1, s6
                  andi         t6, s7, 2017
                  fsub.s       ft3, ft5, fs0, rtz
                  add          a4, t5, t4
                  ori          t0, s5, 483
                  sub          s3, s1, t3
                  slti         tp, tp, -1328
                  mulhu        a1, t4, s2
                  slli         s8, s6, 28
                  or           s3, s8, a5
                  ori          t0, t6, 1184
                  slti         s2, zero, -59
                  slti         a5, a1, -607
                  fadd.s       ft5, ft6, ft7
                  mulh         t1, s5, a4
                  div          t6, t0, a1
                  sll          s9, s2, s5
                  fclass.s     s6, fs8
                  ori          s8, s1, -331
                  add          a5, s0, s9
                  xor          ra, sp, t0
                  fcvt.s.w     ft8, s0, rne
                  fadd.s       fa4, fs4, fa3
                  and          s9, s5, zero
                  fmin.s       fa2, fs2, fa0
                  and          gp, a6, s7
                  sll          a0, s10, zero
                  add          t6, a0, s1
                  rem          s10, a6, a2
                  fdiv.s       fa3, fa7, ft2
                  fsqrt.s      ft1, fa3
                  fcvt.wu.s    s6, fs11, rup
                  fcvt.w.s     s2, fa5
                  fmv.w.x      fs3, s5
                  add          tp, t2, t1
                  fsub.s       fs3, ft4, fs10
                  fsub.s       fs0, fa3, ft5, rmm
                  flt.s        s4, fs5, fa3
                  or           t4, s3, a5
                  srai         a6, t4, 12
                  and          t0, s2, s1
                  fsgnjn.s     fa4, fs10, fa2
                  slti         zero, a6, -1313
                  sltu         t0, s1, a4
                  fcvt.s.w     ft2, s8
                  fle.s        t1, fa7, ft9
                  sltiu        a4, zero, 271
                  feq.s        a6, fs0, fs11
                  lui          s9, 28767
                  fmv.x.w      t1, fa4
                  divu         a2, a0, a7
                  rem          s3, a2, s1
                  fcvt.s.wu    ft0, t6, rtz
                  divu         a3, s4, s8
                  div          sp, t0, s8
                  nop
                  fmax.s       ft7, ft5, ft8
                  fsgnj.s      fs10, ft7, ft5
                  feq.s        s3, fs4, fa5
                  feq.s        s7, fs0, ft11
                  nop
                  add          t3, a6, s4
                  add          a0, s7, s10
                  or           t1, a5, t5
                  rem          t4, s6, s7
                  divu         tp, s4, t5
                  ori          s8, a3, 1521
                  slli         t1, s11, 21
                  add          a0, a1, s3
                  lui          t2, 638180
                  fcvt.wu.s    gp, fs7
                  fsgnjn.s     ft10, fs2, ft1
                  srai         s2, gp, 22
                  or           s3, gp, s2
                  lui          s9, 846580
                  fmv.w.x      ft0, s11
                  rem          a4, t5, s2
                  fsqrt.s      fa1, ft8, rup
                  mul          a7, t6, a2
                  remu         s1, s8, s5
                  slt          s8, t0, s2
                  sltu         a0, t4, s5
                  fmin.s       ft6, fa5, fa4
                  fsgnj.s      fs4, fs8, ft4
                  xor          t0, t1, t1
                  fmv.w.x      fa7, s0
                  fsgnjx.s     fs0, fa7, fa1
                  divu         sp, t6, t2
                  sltu         s1, s4, zero
                  mulh         s7, s5, s6
                  fcvt.wu.s    t4, ft11
                  fmin.s       fa1, fa4, ft7
                  fsgnjn.s     ft6, fa3, fs9
                  nop
                  srai         t1, s10, 28
                  fmv.w.x      fs5, a7
                  xor          s10, s11, a4
                  ori          s7, t6, -1415
                  mulhu        t2, ra, s9
                  ori          t3, s1, 559
                  fcvt.s.wu    ft6, s0, rne
                  fclass.s     t3, fs0
                  mulh         t5, a4, s0
                  or           ra, a7, a6
                  sltiu        a4, s1, 252
                  sltiu        s7, s5, -492
                  fadd.s       fs1, fa3, fs5, rdn
                  fmul.s       ft8, fa6, fs8
                  fdiv.s       ft3, fa0, ft4
                  fmin.s       fs8, fa0, fs5
                  fmin.s       fs6, fa6, fa2
                  fsgnjn.s     fs11, ft10, ft7
                  mulh         a1, s2, t6
                  mulh         s8, a1, a0
                  add          tp, s0, sp
                  div          zero, sp, t5
                  div          s2, s8, s4
                  or           a1, t2, s10
                  sll          s2, s5, t3
                  mulhu        a7, t3, a5
                  fclass.s     s9, ft5
                  srli         sp, t3, 6
                  fsub.s       fa6, fs10, fs5, rne
                  flt.s        a1, ft6, fs1
                  rem          t5, a0, ra
                  mulh         s9, gp, s7
                  fcvt.s.wu    ft11, s7, rmm
                  fmin.s       fa2, fa5, ft2
                  divu         a7, t3, s3
                  auipc        s1, 444673
                  add          a4, s9, a3
                  sltu         a7, a7, s9
                  xori         tp, s10, -142
                  fmin.s       fs1, ft10, ft1
                  fcvt.w.s     t0, ft4, rdn
                  and          s10, t2, ra
                  sra          t5, s4, s10
                  fsgnjx.s     ft7, ft2, fs6
                  sra          ra, t4, s5
                  fsub.s       ft3, fa3, fs3
                  sltu         t1, zero, s2
                  sltu         a2, a2, tp
                  remu         t5, a2, t5
                  or           s1, t4, tp
                  sltiu        a5, a6, 410
                  sub          s10, s3, t6
                  xori         s8, t3, 356
                  fclass.s     s8, fa0
                  fsqrt.s      ft1, fa7
                  feq.s        s7, fs1, fa2
                  fsgnjn.s     fs7, ft9, fs1
                  srli         a4, s11, 17
                  srli         a4, s3, 20
                  auipc        s3, 1033463
                  srai         s2, s5, 3
                  srai         t5, sp, 16
                  fcvt.wu.s    sp, ft2
                  mul          s6, a7, a5
                  fcvt.wu.s    zero, ft7
                  srai         s3, s2, 22
                  srai         tp, a0, 22
                  auipc        t6, 499045
                  fmin.s       ft2, ft0, ft11
                  feq.s        s6, fs3, fs2
                  fclass.s     a6, fa2
                  srl          s7, s3, s4
                  fmv.x.w      a3, ft9
                  fcvt.wu.s    sp, fa7, rdn
                  feq.s        t1, ft8, ft11
                  fmul.s       ft6, fs1, ft4
                  sll          a0, s4, s6
                  fadd.s       ft10, fs2, ft10, rdn
                  srl          t0, s9, a3
                  fclass.s     s6, ft4
                  addi         s9, t0, -1433
                  fsgnj.s      fs4, ft10, fa7
                  fsub.s       ft3, ft2, ft7, rdn
                  fmin.s       ft11, fs0, fa7
                  srai         a6, gp, 7
                  mulh         tp, a1, s10
                  srli         s3, t2, 16
                  fadd.s       ft3, ft1, ft1, rmm
                  mulhsu       s2, a0, s5
                  add          s10, s10, s4
                  mul          a2, a7, s9
                  fmul.s       fa3, fa1, fa3
                  lui          a3, 225042
                  add          a6, a6, s11
                  slti         s8, t2, -1399
                  xor          s8, zero, a5
                  fmv.w.x      fa4, t5
                  srai         t1, t5, 16
                  srli         s9, s2, 7
                  ori          s2, sp, -1748
                  sll          t4, a4, t4
                  fcvt.w.s     gp, ft7, rdn
                  mulh         t1, s9, t6
                  sltu         a4, s2, s8
                  fmv.x.w      tp, ft1
                  addi         t5, s9, -418
                  mulhsu       gp, s11, a7
                  xori         a3, a2, -79
                  xor          t5, a5, s11
                  mulhsu       s6, s8, t3
                  add          a0, a1, tp
                  mulhsu       s2, a6, s1
                  xori         t0, a7, 1009
                  and          t4, s8, a0
                  fle.s        a6, ft11, fa4
                  fsgnj.s      fa5, ft10, ft2
                  xori         s9, gp, -619
                  fmul.s       ft7, fs0, fs2
                  andi         t4, a1, 1584
                  slti         s6, a7, -1754
                  slt          t3, s2, s0
                  auipc        a1, 516280
                  remu         t3, ra, s10
                  slli         gp, a4, 9
                  fcvt.wu.s    gp, ft6
                  remu         s4, tp, a7
                  add          t2, t4, s4
                  sltu         gp, s4, sp
                  mulhsu       t1, s6, s11
                  fmax.s       ft7, fs3, fs1
                  srl          s6, s6, a0
                  nop
                  fcvt.s.wu    ft4, tp
                  and          s6, s3, a1
                  rem          a4, t2, a7
                  lui          a1, 474087
                  srli         a6, s10, 15
                  sub          ra, t3, zero
                  srli         s8, s10, 30
                  fmax.s       fa5, ft10, ft1
                  nop
                  fcvt.w.s     t2, fs11
                  addi         a3, a6, -1701
                  andi         a3, t3, -725
                  fmax.s       fa5, fs11, fs2
                  rem          t1, ra, a4
                  addi         t5, s11, 1654
                  div          s6, s5, s11
                  andi         s7, zero, -215
                  rem          s6, a2, t1
                  fle.s        a1, ft9, fs6
                  fmax.s       ft5, fa1, fa0
                  and          a5, s5, s2
                  fsgnjx.s     ft8, ft9, fs6
                  fsub.s       fa5, fa7, fa0
                  fcvt.s.wu    fs7, a7, rmm
                  fmin.s       ft4, ft8, fs3
                  slti         ra, s8, 683
                  fsub.s       fs4, ft1, fs2, rtz
                  and          s7, a2, sp
                  and          s4, s4, a7
                  fsgnjn.s     fs6, ft7, fs8
                  xori         ra, sp, -548
                  slli         s8, s10, 24
                  mulhsu       tp, s7, s3
                  and          s6, s2, a3
                  sltiu        t4, t6, 1005
                  slti         t1, a6, 254
                  fsgnjx.s     ft8, ft10, ft4
                  rem          s4, s3, t3
                  fsgnjn.s     fa0, ft6, fa5
                  srli         s10, s2, 7
                  mulh         a1, s6, s4
                  mul          t0, s8, gp
                  fclass.s     s10, ft10
                  remu         t5, a4, s0
                  fle.s        a7, fs5, fs9
                  sltu         t5, a0, a2
                  xori         a5, a7, -284
                  fclass.s     t6, fa7
                  sltu         s3, t0, s9
                  xor          a2, s5, s5
                  add          a5, a4, s1
                  mul          t3, a2, t2
                  fsgnjx.s     fs3, fs8, fa6
                  srai         a1, a3, 26
                  or           s4, tp, s3
                  fcvt.wu.s    tp, fs8, rdn
                  slli         t4, t3, 10
                  srai         zero, a7, 0
                  fmin.s       fs4, fs6, fa0
                  slt          s3, s10, s1
                  fle.s        a7, fs3, ft2
                  divu         t0, a7, s2
                  addi         ra, s3, 1082
                  lui          t6, 6986
                  fcvt.s.w     fs6, a5, rtz
                  fcvt.s.w     ft7, s8
                  fsgnjx.s     ft4, ft3, fs10
                  fmv.w.x      ft1, t5
                  sltu         gp, t3, s3
                  or           gp, s8, t1
                  sub          s10, s8, zero
                  fmv.x.w      s1, ft5
                  ori          a0, t4, -1685
                  fcvt.s.wu    fs7, s10, rdn
                  fmul.s       ft11, ft3, fa6, rup
                  addi         s10, s10, 457
                  auipc        ra, 96219
                  and          a5, a1, s5
                  fmv.w.x      fa4, s4
                  srai         s8, sp, 20
                  mulhu        s7, t0, a0
                  fsgnjn.s     fs4, fs4, fs10
                  addi         s2, a5, -140
                  slti         a6, s6, -1890
                  sll          ra, a1, s5
                  feq.s        a6, ft1, ft8
                  or           sp, tp, s4
                  srai         t4, a6, 4
                  fcvt.w.s     a0, fa5
                  xor          s2, ra, s4
                  mulhu        t1, s7, s9
                  nop
                  fmv.x.w      s1, fs10
                  fsgnjn.s     fs11, ft6, ft4
                  div          t0, t5, tp
                  fsgnjn.s     fs6, ft11, ft8
                  slt          a2, a7, s3
                  srai         a1, a2, 13
                  fmv.x.w      a1, fa2
                  fsgnjx.s     fs1, fa6, fa6
                  nop
                  fsub.s       fa4, fs8, fs4, rtz
                  xori         s3, s6, 994
                  ori          t6, a4, -1850
                  sltiu        a4, t6, 1313
                  xori         t4, s6, 216
                  fclass.s     a5, ft8
                  sltu         s2, a5, zero
                  divu         a1, s10, s1
                  remu         s4, s2, a3
                  andi         a3, a6, 383
                  srl          t1, t1, s3
                  rem          t2, a3, a0
                  slt          a7, gp, t0
                  sub          a1, t0, a2
                  srai         tp, s2, 18
                  fsgnj.s      ft1, ft9, fa6
                  sltu         tp, t2, s8
                  mulhsu       s2, zero, t2
                  or           a7, sp, t1
                  fmul.s       ft4, fs9, ft9
                  auipc        s8, 196128
                  fcvt.s.w     fa3, s2, rdn
                  ori          t3, s11, -1143
                  sub          t6, t5, t0
                  or           t0, s9, s6
                  lui          s10, 731329
                  slti         t0, ra, -1243
                  fcvt.s.w     fa7, s0, rdn
                  fadd.s       ft4, fs11, fa0, rtz
                  xori         s2, t0, 1329
                  fsqrt.s      fs1, fa7
                  remu         t3, s11, t5
                  fadd.s       fs4, fs10, fa5
                  mulhu        ra, a1, a0
                  sll          t5, s8, a1
                  sll          zero, s5, a2
                  or           s3, a3, t0
                  fmin.s       fs2, fs11, fs11
                  fcvt.wu.s    a1, ft4, rne
                  fsgnjx.s     fa2, fa5, ft5
                  fsgnjx.s     ft6, fs10, fa7
                  sub          ra, s4, s9
                  flt.s        s1, ft1, ft10
                  slti         s6, s10, 365
                  fcvt.wu.s    t5, fs10, rdn
                  sra          a7, t4, zero
                  srl          s8, s8, t5
                  fcvt.wu.s    t3, fs5
                  rem          s10, s1, a6
                  fmul.s       fa7, fa5, fs2, rne
                  feq.s        gp, fs6, ft10
                  sra          a4, ra, a6
                  slli         s1, gp, 25
                  mul          s4, s5, a7
                  fcvt.s.wu    fs2, a7
                  slti         t2, a6, 1358
                  feq.s        a3, fs2, ft1
                  feq.s        a3, fs11, fs10
                  srli         s10, sp, 5
                  divu         s7, sp, a5
                  fcvt.w.s     zero, ft1
                  fle.s        a3, ft5, ft5
                  slti         a4, s5, -1628
                  sra          a5, s7, s1
                  slt          a5, s11, t2
                  addi         t2, sp, -1431
                  mulhu        a0, tp, s1
                  fcvt.w.s     t4, fs3, rne
                  divu         s3, s4, tp
                  nop
                  auipc        s7, 1015835
                  mulhu        s3, s1, a4
                  slt          t1, s0, s7
                  nop
                  sll          t3, a1, s10
                  sll          a0, a4, a7
                  add          t3, s4, a0
                  fclass.s     s10, fs2
                  mul          a0, gp, t4
                  andi         t4, s5, -1702
                  slli         a5, t5, 26
                  mulh         a6, gp, s6
                  fsgnjx.s     fs1, fs7, ft9
                  remu         s3, s2, a5
                  sltu         a6, t4, s6
                  sll          t1, tp, ra
                  mul          s8, s4, a4
                  slli         s7, t2, 20
                  slli         a1, sp, 6
                  fsqrt.s      ft5, ft7
                  fsgnj.s      ft5, fs9, fs3
                  fmul.s       fs11, ft1, fs6, rdn
                  fsgnjx.s     fs9, fs10, ft6
                  fmin.s       fs11, fs2, ft6
                  fdiv.s       fs6, fs11, fa6
                  fdiv.s       fa3, ft0, fs4, rmm
                  rem          s1, a5, t5
                  fcvt.w.s     tp, fa7
                  xor          sp, s10, t5
                  fmv.w.x      ft5, t3
                  srli         a5, s10, 0
                  and          a6, s3, s6
                  fsgnjn.s     fs7, ft2, ft4
                  fcvt.s.w     fs3, a0, rne
                  fdiv.s       fa0, fs4, ft4, rdn
                  sltiu        ra, s10, 616
                  andi         sp, t6, -657
                  sub          a0, tp, ra
                  fmin.s       fa4, fs11, ft0
                  sra          s8, ra, tp
                  fclass.s     a1, ft2
                  slti         gp, t1, -1359
                  slt          a6, t1, t5
                  auipc        s8, 539753
                  srl          s10, t0, s6
                  ori          s3, a3, 595
                  divu         s8, t2, s10
                  fmax.s       fa7, ft2, ft7
                  fmv.w.x      fs8, a2
                  slt          ra, s8, s3
                  divu         a6, s1, s3
                  auipc        t2, 181572
                  sltu         a0, a0, s11
                  fsqrt.s      fa6, fs11
                  lui          s2, 958942
                  fmv.w.x      ft3, a0
                  auipc        sp, 142493
                  fadd.s       fs4, fs3, fs2, rup
                  sub          s7, t4, a5
                  sll          s2, s11, zero
                  feq.s        s8, ft9, fa0
                  fdiv.s       fs6, ft0, ft9, rmm
                  mulh         s2, t5, s5
                  fcvt.wu.s    t4, fa0
                  fmv.x.w      t1, fs1
                  lui          a7, 669503
                  fcvt.wu.s    t5, ft3, rmm
                  ori          a2, s0, 1941
                  auipc        tp, 334771
                  or           s1, s0, s6
                  fsub.s       ft5, ft8, fs1, rtz
                  addi         s1, a3, 66
                  lui          t1, 909472
                  fsgnjn.s     ft1, fa7, fa3
                  mulhsu       a3, s1, sp
                  xori         a2, s4, -1906
                  slt          a1, s5, t2
                  fsgnj.s      ft5, fa2, fs1
                  srl          tp, gp, t0
                  slt          sp, a1, s11
                  fcvt.wu.s    t4, ft4, rmm
                  sll          a2, a4, sp
                  or           s4, s7, t3
                  or           t4, s4, t2
                  xor          tp, t4, t1
                  xori         ra, s9, -888
                  sltu         ra, t6, s4
                  addi         tp, t5, 838
                  xor          a2, zero, t3
                  slli         t5, s9, 31
                  srl          t3, s7, t0
                  srli         a1, s9, 28
                  mulhu        t0, a4, s11
                  fmv.w.x      fa6, s11
                  fle.s        s10, fs6, ft3
                  fadd.s       fs7, fa2, fs6, rmm
                  nop
                  and          a1, s3, s9
                  add          a1, s11, s4
                  sub          s8, s8, a2
                  and          a0, t4, a5
                  lui          t4, 558212
                  sra          t4, ra, sp
                  feq.s        zero, fs7, fa5
                  sll          zero, t4, a4
                  sub          t5, a5, a4
                  sll          sp, s5, t1
                  sra          a5, s0, s4
                  lui          a0, 260698
                  sll          s4, s6, a1
                  and          gp, s1, a7
                  ori          a7, s8, 239
                  mul          t3, s7, s2
                  andi         s1, a2, -1194
                  sll          gp, ra, s6
                  fcvt.wu.s    a4, ft4
                  remu         s4, s3, t3
                  nop
                  nop
                  fadd.s       fa2, ft8, fs4
                  fmv.x.w      t0, fa3
                  fcvt.s.wu    fs11, t0, rmm
                  sub          t0, a6, s3
                  remu         zero, s5, t4
                  add          s10, s5, sp
                  fmul.s       fs0, ft0, fa7
                  slt          a2, s9, s8
                  remu         s8, s0, t1
                  xor          s6, s0, s10
                  sll          t5, s6, a0
                  sra          a5, zero, tp
                  mulhsu       gp, t0, s8
                  slt          t5, ra, s10
                  addi         s9, s0, -1503
                  flt.s        ra, fs3, fa5
                  srli         t4, s3, 31
                  feq.s        a4, ft9, fs0
                  srl          t3, t1, t2
                  nop
                  srl          a2, a2, s8
                  div          sp, a6, a4
                  divu         sp, s11, t6
                  fcvt.wu.s    t0, fs9
                  sll          ra, tp, tp
                  fle.s        zero, fa2, ft7
                  srl          t2, tp, t6
                  slti         s4, s1, -1459
                  xor          t1, tp, a4
                  fmax.s       ft8, fs7, ft9
                  sltiu        t2, s1, 7
                  fle.s        t2, fa0, fa0
                  mulhu        t2, t3, a6
                  fsgnjx.s     fs8, fs11, ft0
                  fsub.s       fa1, fs0, fa3
                  remu         t0, t1, s11
                  fle.s        t3, ft9, ft3
                  flt.s        gp, fs5, fa2
                  lui          s10, 865096
                  mulh         t0, s8, t0
                  and          s9, s0, a5
                  srai         s4, sp, 6
                  fle.s        s4, fs11, ft11
                  fcvt.w.s     t5, ft10
                  nop
                  add          s8, t1, s1
                  srl          a2, t5, t4
                  fcvt.s.w     fs10, s1
                  sra          s10, a1, a5
                  fdiv.s       fa0, fa1, ft11
                  fsqrt.s      ft9, fs6, rtz
                  sltu         s7, t3, s2
                  ori          a1, tp, 1689
                  remu         a0, t4, a5
                  add          s2, t3, s2
                  fsgnj.s      fa1, fa5, ft7
                  ori          s6, s6, 1202
                  sub          sp, s11, a2
                  sra          t6, s2, a5
                  auipc        t4, 86500
                  flt.s        t6, fa4, ft11
                  slt          t1, t5, t5
                  fdiv.s       fs7, ft4, ft2, rtz
                  flt.s        ra, fs6, ft1
                  sltu         ra, t5, s0
                  fle.s        gp, ft5, fs10
                  srl          t4, gp, t0
                  fmax.s       fs1, ft11, fs2
                  and          s8, t5, s8
                  fmv.w.x      ft8, t1
                  sra          a7, s10, t3
                  slt          a4, a6, a4
                  fsgnj.s      ft5, ft10, fa0
                  fmin.s       ft6, fs9, ft0
                  fdiv.s       ft1, fs10, fs8
                  fcvt.s.wu    ft10, ra, rne
                  srl          t2, s6, gp
                  feq.s        s9, fa6, ft9
                  slli         a7, s1, 1
                  fmul.s       fs3, fs2, fs5, rdn
                  fsqrt.s      fa6, ft3, rdn
                  sltiu        s1, t4, -1790
                  fadd.s       fs7, ft1, fs4
                  sltu         tp, s3, s10
                  fdiv.s       fa2, ft7, fs7
                  srl          sp, a2, a0
                  fmin.s       fs7, ft10, fs4
                  fadd.s       ft3, fs11, ft3
                  srai         s9, zero, 16
                  fsqrt.s      fs11, fa3, rup
                  flt.s        zero, ft2, fa7
                  mul          a2, sp, a5
                  nop
                  sub          t0, a2, gp
                  fsgnj.s      fa5, fs8, fa6
                  nop
                  div          sp, a2, s1
                  auipc        s1, 71820
                  slti         t6, sp, -2014
                  nop
                  addi         tp, s9, -608
                  fdiv.s       fa6, ft10, fs1
                  feq.s        t1, fa7, ft6
                  remu         s2, tp, t2
                  fsgnjn.s     ft3, fs2, fa3
                  sltu         a2, a2, s2
                  fcvt.s.wu    fs11, a2, rmm
                  fsgnjx.s     fs0, fs4, ft6
                  add          t1, s3, a6
                  sub          s6, a4, sp
                  mulhsu       a6, s9, a7
                  fsgnj.s      fa5, fs0, fs4
                  sll          a6, s10, s0
                  div          s10, a7, s5
                  addi         s7, a1, -1329
                  flt.s        t0, ft2, ft1
                  fcvt.s.w     fs1, s9
                  add          s6, t5, t5
                  fcvt.w.s     s6, ft2
                  mulh         s3, a7, s8
                  fsgnjn.s     ft5, ft2, fs0
                  slli         s3, sp, 22
                  fcvt.wu.s    s10, fa5, rdn
                  mulhsu       a3, a3, s11
                  lui          s2, 252957
                  fdiv.s       fs1, ft3, ft4
                  srli         a0, zero, 19
                  fsgnjx.s     ft2, fs8, ft1
                  srai         a1, a2, 16
                  fle.s        t4, fa5, fs9
                  fsgnj.s      fa1, ft9, ft4
                  slt          t6, a4, a3
                  fmax.s       fs4, ft6, fs3
                  fsub.s       fs6, fa7, fs7
                  fclass.s     t5, fs9
                  feq.s        ra, fa5, fs4
                  fmax.s       fa7, ft11, ft10
                  ori          t5, a6, 1989
                  fmin.s       ft3, fs7, ft2
                  fclass.s     a3, fs6
                  sra          t4, s5, a4
                  fadd.s       fs10, fa5, fs8, rup
                  fsub.s       ft3, fa7, ft3
                  fmax.s       fa3, fa2, fa4
                  sltu         a2, t4, a7
                  mul          s8, t0, s7
                  xori         zero, t0, 1561
                  and          s7, s5, t4
                  sltu         a7, a3, a3
                  xor          ra, a2, s5
                  mulhsu       a0, a7, a4
                  srl          s10, s3, a5
                  nop
                  fsqrt.s      fa5, fs10
                  fle.s        a3, fs7, fs10
                  and          gp, t0, a6
                  fclass.s     t4, ft3
                  ori          tp, s7, 674
                  flt.s        t6, fa0, fs0
                  remu         s8, s4, t4
                  slt          t2, s0, s6
                  sll          s1, s8, s3
                  add          t2, t6, a6
                  sll          t6, t2, s9
                  ori          a0, a5, -1631
                  fcvt.s.w     fa2, a6, rup
                  fsub.s       ft7, fs2, fa1, rmm
                  mulh         t3, t3, t2
                  sltiu        tp, sp, 260
                  divu         a7, zero, a4
                  fadd.s       fa4, fa7, fa2
                  fmin.s       fs5, fa6, ft4
                  fmul.s       fa6, fs9, fs1, rtz
                  flt.s        s2, ft8, ft1
                  remu         tp, s4, s7
                  slti         t5, s2, -1325
                  add          a2, ra, a1
                  mulhsu       a4, tp, a6
                  lui          s8, 309470
                  xor          tp, a0, a4
                  slt          zero, a3, s1
                  fmin.s       fs2, fs10, ft1
                  feq.s        a3, ft6, ft3
                  sll          s1, t1, s9
                  xor          s6, a4, zero
                  fmv.w.x      ft5, t4
                  or           a7, a7, sp
                  fmul.s       fa7, fa1, ft6, rdn
                  and          t4, t2, ra
                  fclass.s     t0, ft0
                  sltiu        a4, t1, 1640
                  fcvt.s.w     fa1, a6
                  xori         gp, s10, 1210
                  andi         zero, a1, -1174
                  mulhu        a2, zero, s8
                  fsub.s       ft9, ft3, ft8
                  lui          zero, 201786
                  fmin.s       ft2, fs10, fs8
                  addi         sp, t1, -425
                  andi         a0, s11, -606
                  slti         a0, s9, 1734
                  slt          s9, s0, sp
                  divu         s7, s8, t3
                  slt          s1, s5, s3
                  add          sp, a4, s11
                  sltiu        t0, a0, 260
                  fcvt.w.s     a6, ft7
                  feq.s        s9, fs2, ft7
                  xor          tp, ra, sp
                  fclass.s     a1, ft11
                  fcvt.w.s     gp, fa0
                  xor          t6, t4, s7
                  sltiu        t6, a0, -1051
                  slti         s4, a2, 1857
                  fsgnj.s      fa1, fs7, fa6
                  sltiu        s1, a6, -260
                  ori          t6, s10, 1266
                  nop
                  fcvt.w.s     zero, fa2
                  andi         t1, a4, -1217
                  fadd.s       fa4, fa2, fs0, rtz
                  mulhu        t5, s10, t3
                  slt          a0, s7, s6
                  div          sp, tp, s10
                  fmax.s       fs6, fs9, ft3
                  sra          t2, a7, s2
                  sra          a4, a3, a7
                  mul          gp, s5, s1
                  addi         a0, gp, 1752
                  fmv.w.x      fs4, s4
                  fadd.s       ft11, ft8, fa1
                  fcvt.w.s     a1, fs3
                  srli         s2, s6, 24
                  sub          t6, t6, a0
                  fsub.s       ft0, fs7, fs11, rtz
                  xori         s1, s2, 1121
                  srai         tp, tp, 28
                  fmv.x.w      t3, ft0
                  fmin.s       fa7, ft9, ft4
                  slli         sp, a7, 9
                  addi         t6, a4, 68
                  fmul.s       fs1, ft8, ft7
                  divu         s2, s1, s11
                  slti         t0, s0, 1376
                  xori         t6, s8, -639
                  mulh         s9, s9, ra
                  div          s3, tp, t1
                  add          t4, a5, zero
                  fmv.x.w      s3, fa5
                  fsgnjx.s     ft7, fa6, ft1
                  sltu         s3, sp, a3
                  flt.s        t1, ft10, fs6
                  addi         a2, s5, 913
                  fsqrt.s      ft8, fs7
                  fle.s        a4, ft5, fs1
                  fsgnjx.s     ft0, fs5, ft3
                  sltu         s3, t5, a1
                  fsub.s       fs3, ft11, ft5, rmm
                  ori          t4, s6, 826
                  sltiu        t3, a4, 262
                  fsgnjx.s     fs7, ft11, ft5
                  fsqrt.s      fa5, ft6
                  lui          s4, 607464
                  fmax.s       ft1, ft0, ft3
                  fmin.s       ft4, fa6, ft9
                  mulhsu       zero, a7, zero
                  mulh         s7, s9, t6
                  sub          gp, t2, t2
                  nop
                  ori          s1, s11, -1094
                  slli         s6, a0, 8
                  auipc        tp, 874287
                  srai         s7, t0, 19
                  fclass.s     a6, fs2
                  and          a6, a3, gp
                  slti         s2, t4, 810
                  slti         s9, t0, -417
                  xori         s3, s10, 762
                  lui          sp, 529066
                  fcvt.wu.s    ra, fs4
                  divu         a6, a2, a6
                  or           t6, t4, t0
                  addi         a1, a3, 1179
                  fcvt.wu.s    tp, ft1, rne
                  rem          a0, s5, s9
                  fcvt.w.s     a3, fs3, rup
                  sll          a3, a1, t1
                  fsub.s       ft8, fs10, fa6
                  fmv.w.x      fs1, s8
                  slli         ra, t5, 30
                  add          a4, a5, sp
                  fcvt.s.wu    ft1, a4
                  fmin.s       ft5, fa2, fa2
                  andi         a1, s6, 1203
                  sra          s3, tp, a2
                  sltiu        s1, s5, -1092
                  fmv.x.w      s10, fa2
                  mulh         t3, ra, a3
                  lui          s6, 31075
                  fsqrt.s      fa3, fs8
                  fdiv.s       ft5, fs0, fs5, rne
                  sra          a0, s3, a0
                  fmax.s       fs10, ft8, fs8
                  fcvt.s.wu    fa3, a5, rne
                  fdiv.s       fs10, fa5, fa6
                  remu         tp, s1, s0
                  slt          tp, s6, t6
                  xori         a0, a3, 1599
                  fclass.s     t1, fa2
                  sltu         a5, t1, a2
                  xor          s3, t6, s3
                  feq.s        t1, ft3, ft9
                  fmin.s       fs7, ft0, fs9
                  slti         t6, s4, -146
                  fcvt.wu.s    t2, ft0
                  auipc        t5, 692074
                  fmin.s       fs10, fa4, fs3
                  fmul.s       ft2, fa3, fa7
                  andi         t2, a7, 36
                  srli         gp, t6, 4
                  fcvt.s.w     fa3, zero
                  sra          a0, a0, s0
                  feq.s        s9, fa4, ft8
                  addi         a3, s4, -266
                  fle.s        s3, fa6, fa0
                  sub          a3, a3, t4
                  slti         sp, ra, 47
                  fmax.s       fs9, ft3, ft8
                  remu         s4, s0, s2
                  fcvt.s.wu    fs2, s8, rtz
                  slt          s3, a3, ra
                  and          s2, s3, a4
                  sra          zero, s2, s10
                  fmv.w.x      fa1, s3
                  sltiu        s1, s7, -1613
                  fcvt.s.w     ft7, t1, rne
                  fsqrt.s      fs11, fs3
                  nop
                  fdiv.s       fs4, ft7, fs11
                  lui          a3, 502646
                  fclass.s     gp, fs0
                  fle.s        a1, fs6, ft9
                  mulhsu       gp, ra, a3
                  andi         a5, ra, -1196
                  fle.s        gp, ft8, fa0
                  fcvt.s.wu    fa5, a1
                  fmv.x.w      s4, fs7
                  fcvt.s.w     fs0, s4, rup
                  mulhsu       t0, a3, a2
                  andi         s6, t4, -248
                  fclass.s     a1, ft11
                  sltu         a0, a0, s7
                  fmax.s       fs9, fs0, fa3
                  mulh         a0, a7, ra
                  fclass.s     t3, fa0
                  fmv.w.x      ft6, a3
                  fcvt.w.s     a3, fa1, rne
                  fmax.s       fs4, ft9, fa0
                  mul          a3, a6, a3
                  sltiu        a4, gp, -1172
                  feq.s        s3, fs3, fa6
                  addi         s10, s4, -1140
                  fsub.s       fs8, fs0, fs7
                  ori          gp, a0, 1347
                  fmax.s       fs9, ft7, fs7
                  sub          a4, tp, t2
                  and          s9, s8, sp
                  fsgnjn.s     fa0, fs4, ft11
                  fsgnjn.s     fs11, fs0, ft10
                  fclass.s     t1, ft4
                  fsgnj.s      ft1, ft7, fa5
                  sub          s4, s11, zero
                  fsgnjx.s     fs5, fs10, ft8
                  mul          gp, a3, zero
                  srai         s4, a5, 15
                  addi         s8, s9, 142
                  mul          t3, a1, s3
                  xor          a5, a6, s11
                  mulh         s9, a1, t3
                  fsqrt.s      ft2, fs1, rne
                  fcvt.wu.s    zero, ft9
                  and          a4, tp, sp
                  fsqrt.s      ft9, ft9
                  slli         zero, s10, 24
                  xor          zero, t0, a3
                  fdiv.s       ft2, fa4, ft1, rmm
                  fcvt.wu.s    a1, ft3
                  fmv.x.w      sp, fs3
                  feq.s        ra, ft1, ft6
                  or           s1, zero, sp
                  ori          s4, a3, 371
                  auipc        s3, 869381
                  flt.s        s9, fa4, fs0
                  xori         s9, s0, -663
                  fcvt.s.wu    ft2, t1
                  lui          s10, 21157
                  remu         a2, s3, s10
                  sltu         a0, s1, t1
                  sll          s10, s4, gp
                  ori          s6, sp, -1920
                  feq.s        t6, fa7, ft2
                  fcvt.s.w     fa5, s6, rdn
                  srai         ra, s10, 10
                  remu         a7, t5, s3
                  fsgnjn.s     fa6, fa3, fs4
                  fcvt.s.w     fa7, s11, rtz
                  sltu         t4, s6, sp
                  slti         s3, a6, 686
                  feq.s        t3, fs11, fa4
                  and          t6, a4, t1
                  fsqrt.s      ft11, ft9, rup
                  fcvt.wu.s    t5, fa6
                  slti         gp, s5, -584
                  slli         tp, t3, 17
                  xori         t2, a7, 1579
                  fcvt.s.w     ft1, t5
                  mulh         s10, s8, t0
                  fle.s        s4, fs1, fa6
                  fdiv.s       ft1, ft9, ft7
                  mulhu        t4, zero, a2
                  sra          tp, s6, zero
                  fsgnj.s      fa7, fs4, fs0
                  fcvt.wu.s    t6, fs0, rmm
                  div          zero, s4, a3
                  fcvt.w.s     s10, ft6, rmm
                  sub          s4, s7, t0
                  fsub.s       fs0, fs11, fs9, rmm
                  xor          a7, tp, t4
                  addi         s2, s7, 552
                  nop
                  andi         t1, ra, 1290
                  fdiv.s       fs8, fa2, fs8
                  divu         a4, t3, s10
                  fsgnjn.s     fa7, fs3, fa1
                  slli         s7, s7, 12
                  slli         s7, s0, 10
                  or           a4, a2, zero
                  or           s4, a2, a3
                  mul          a6, t1, t6
                  slt          t0, t2, zero
                  slt          tp, s9, t3
                  rem          a1, s10, t6
                  fclass.s     sp, fs3
                  flt.s        s1, ft5, ft5
                  fmv.w.x      fs8, t0
                  ori          s8, t2, 1176
                  fmul.s       fs10, fs8, fs8
                  rem          sp, a3, a5
                  sll          t6, t5, s9
                  fsgnjn.s     fs11, fs7, fs0
                  mulhsu       s8, t0, t4
                  ori          zero, s10, 817
                  mulhsu       t2, s0, s8
                  fle.s        s2, fa7, fs1
                  fmin.s       fs8, fa6, fs3
                  srli         s10, s1, 29
                  lui          a1, 254340
                  and          t2, a4, t4
                  fle.s        s10, fa1, fs1
                  srl          a5, a5, t0
                  fmul.s       ft2, ft10, fs0
                  slt          t0, ra, t6
                  fsub.s       fa1, fs10, ft8
                  fmv.w.x      fs6, s1
                  sra          s3, a4, s9
                  fsgnjn.s     fs1, fs6, ft11
                  fmin.s       fs7, fs10, fs11
                  srl          t3, a4, a3
                  fsub.s       fs5, ft1, fa2, rne
                  sra          a5, s6, zero
                  srli         s2, t4, 3
                  ori          t0, a1, -1816
                  fsgnjn.s     fs6, fs5, fs4
                  slli         s3, t2, 7
                  fdiv.s       fs6, fa0, fs7
                  fsub.s       fa4, fa0, fs9
                  nop
                  sra          a3, zero, s11
                  rem          a7, t6, s3
                  fmin.s       fs6, fs6, fs9
                  fsqrt.s      fs5, ft0
                  fcvt.wu.s    t4, ft7
                  sra          zero, a6, a0
                  div          s7, zero, s6
                  fcvt.w.s     t2, fs8, rtz
                  fclass.s     s8, ft6
                  srl          s6, s1, a4
                  fcvt.s.wu    ft0, tp, rne
                  add          s2, t1, a0
                  fmax.s       fa5, fa3, ft0
                  rem          a0, sp, s3
                  srl          t1, a6, t0
                  srl          tp, s4, a2
                  sll          ra, s0, t5
                  mulh         a0, a4, zero
                  fmul.s       fs6, fa7, fs4
                  fclass.s     t2, fs10
                  sll          ra, t0, t5
                  sltu         s1, t4, s2
                  xori         s10, ra, -1832
                  flt.s        a7, ft4, ft10
                  ori          s7, s1, 43
                  srli         t2, t4, 18
                  xori         a3, gp, -166
                  fclass.s     a2, fs4
                  sll          a1, a1, s2
                  or           s1, a0, t1
                  fsgnjn.s     fa3, fs11, ft1
                  fsgnjn.s     ft1, fs8, fa1
                  mulhu        t4, t6, s2
                  fmv.x.w      t3, fs5
                  xor          t6, s10, t4
                  divu         s7, s2, s5
                  feq.s        a7, fs3, fa7
                  fcvt.w.s     a5, ft8
                  mul          sp, t5, s0
                  nop
                  srai         t1, t4, 9
                  fcvt.s.wu    ft11, a1
                  andi         a1, s11, 236
                  lui          t3, 431178
                  sub          t6, s5, a7
                  fsgnj.s      fs7, fs1, fa5
                  fcvt.wu.s    sp, fs7
                  fcvt.w.s     a2, fa7, rdn
                  feq.s        t4, ft2, fs3
                  rem          sp, a3, s4
                  divu         t0, zero, a4
                  fsgnjx.s     fs6, fa6, ft5
                  andi         s7, s6, 246
                  fdiv.s       ft3, fs9, fs8, rne
                  sll          a2, a4, a7
                  slli         zero, s9, 18
                  mulhu        s1, s6, sp
                  fcvt.w.s     a7, fa1
                  auipc        t1, 507786
                  or           t2, s10, zero
                  mul          s7, a0, t3
                  fcvt.wu.s    a0, fa5
                  fclass.s     a0, fs0
                  ori          s8, t2, -1581
                  fdiv.s       ft0, ft8, fa3, rdn
                  slli         t1, s8, 1
                  add          t4, t1, gp
                  sltu         a6, gp, s0
                  fdiv.s       fs3, ft5, fs10, rmm
                  feq.s        s2, fs2, fa3
                  slli         s6, t1, 11
                  fsqrt.s      ft7, fs7, rne
                  srai         s10, s3, 7
                  fmv.w.x      fa0, s8
                  xori         a0, ra, -1693
                  remu         gp, s6, zero
                  fmv.x.w      sp, ft6
                  fsqrt.s      fa6, ft10
                  rem          a4, ra, zero
                  fadd.s       ft4, ft5, fa7
                  div          t6, t4, a3
                  flt.s        s10, ft7, fs7
                  mul          zero, zero, s5
                  xori         s10, s0, 504
                  lui          t4, 328852
                  sll          t3, s3, a6
                  sltiu        s1, a6, 612
                  fsqrt.s      fa6, fs2, rmm
                  flt.s        t1, fs1, ft4
                  add          a2, a7, t1
                  sltu         a6, t6, t2
                  fle.s        a0, ft1, ft5
                  feq.s        s4, fs5, fs2
                  andi         t2, s5, 77
                  andi         t6, t3, 1333
                  fsqrt.s      ft1, ft5
                  fdiv.s       fs1, fa7, ft2, rdn
                  fsub.s       ft5, ft2, fs3
                  fcvt.wu.s    a7, fs5, rup
                  fcvt.s.wu    ft1, s1, rmm
                  sltiu        sp, s2, 665
                  flt.s        t0, fa2, ft1
                  fcvt.s.wu    fs0, t4
                  slli         s8, t0, 16
                  lui          s3, 173777
                  fcvt.s.w     fa5, a4, rtz
                  fcvt.s.w     ft8, tp
                  sltiu        zero, t0, -1976
                  fmax.s       ft9, ft1, ft3
                  mul          s9, a2, a0
                  rem          s6, tp, t6
                  add          s9, s2, t4
                  or           a7, s0, t6
                  xori         t3, s2, 585
                  feq.s        sp, fa5, fs6
                  addi         t4, a5, 724
                  slli         gp, a7, 28
                  auipc        s4, 136265
                  fmv.w.x      ft3, a0
                  fcvt.s.w     ft2, s5
                  fcvt.w.s     s3, fs8, rdn
                  fmv.w.x      fa0, t0
                  fsgnjn.s     ft8, fs9, fs1
                  mulhu        a2, s8, tp
                  mulh         s1, t2, s1
                  mul          s4, a4, a4
                  sub          a7, a2, a2
                  fcvt.s.w     ft7, a5, rmm
                  sra          t5, a3, t0
                  fmv.x.w      s1, fa5
                  div          t0, a1, s10
                  sltiu        t2, s9, -770
                  fmv.x.w      t3, ft7
                  srli         s9, a2, 5
                  fsgnjx.s     fa4, fs10, ft4
                  nop
                  addi         tp, s1, 612
                  fsgnj.s      ft7, fa0, ft5
                  sub          a4, a6, s3
                  fmul.s       ft2, ft2, ft10, rup
                  sltiu        sp, tp, 206
                  srai         a1, a2, 19
                  fmv.w.x      fs2, ra
                  fsqrt.s      fa3, fs10
                  divu         tp, sp, t4
                  fsgnj.s      fs4, fs8, ft7
                  fmul.s       fs8, ft10, fa3
                  ori          a7, tp, -1224
                  mulh         t1, s9, sp
                  fsgnj.s      fs6, fs2, fa5
                  fcvt.s.w     fs10, tp
                  sll          t6, ra, a0
                  sra          s6, a1, a0
                  div          a3, t4, a2
                  addi         a1, s2, 865
                  fmv.x.w      t0, ft2
                  fsqrt.s      fa0, fs7, rmm
                  mul          t6, s3, s7
                  fsqrt.s      fa5, ft9
                  slt          s3, gp, s4
                  sltu         s8, s11, a5
                  fsub.s       ft7, fs2, fs4
                  sltu         t4, s4, s3
                  divu         a5, a6, s5
                  fclass.s     gp, ft4
                  nop
                  fadd.s       fs1, ft8, fs9, rne
                  fsgnj.s      fs6, ft9, ft1
                  fle.s        s3, fs2, ft5
                  fclass.s     t4, ft1
                  feq.s        s2, ft9, fs4
                  fsgnjn.s     fs9, fa6, fs4
                  fcvt.s.w     fa2, s5, rne
                  srl          gp, s8, tp
                  fadd.s       fs8, fa1, ft2
                  mulhsu       ra, t2, s0
                  fcvt.wu.s    a3, ft3, rdn
                  fmin.s       fs11, fs9, fs1
                  div          ra, zero, s8
                  mul          s7, s1, t5
                  mulhsu       a1, a6, s4
                  srli         s4, a7, 22
                  flt.s        s9, fs5, fa5
                  remu         s9, a3, a5
                  sll          zero, a2, s4
                  mul          t3, a7, sp
                  fle.s        s7, ft7, fs5
                  feq.s        s1, fa2, ft11
                  and          t3, a2, t0
                  ori          gp, gp, 1718
                  fsub.s       ft6, fs3, fs8, rtz
                  srli         s8, s5, 31
                  slli         s3, a4, 20
                  srli         a5, a1, 11
                  div          sp, a2, t1
                  fmin.s       ft8, fa1, fa1
                  addi         a4, s1, -530
                  sra          t4, a6, tp
                  fclass.s     s2, fa7
                  fmin.s       ft1, fa3, fa3
                  sub          s1, s1, a2
                  fcvt.s.wu    fa5, s11
                  mul          t0, zero, t3
                  xor          a1, t2, s3
                  rem          t1, s6, sp
                  remu         s7, a7, t6
                  ori          s7, a5, -1657
                  fsgnjn.s     fs6, ft1, fs6
                  fdiv.s       ft1, fs5, fs0, rup
                  mulh         t4, s8, t1
                  fsgnjn.s     ft9, ft5, fa1
                  auipc        t1, 880358
                  slli         t3, t3, 20
                  ori          zero, gp, 1684
                  slli         t4, a4, 18
                  fle.s        t0, ft10, ft3
                  mulhsu       sp, s4, t5
                  sll          t3, t3, a2
                  xori         ra, a3, 317
                  fmv.x.w      ra, ft3
                  fsub.s       ft3, fs9, fs2, rmm
                  sltiu        a3, gp, 1668
                  auipc        a5, 483172
                  sltu         s2, a1, s10
                  lui          t4, 469654
                  mulhsu       t3, s6, a7
                  fclass.s     t4, fa0
                  or           tp, ra, a6
                  mulhu        s2, t2, s7
                  xori         a0, s5, 4
                  addi         ra, gp, -319
                  fdiv.s       ft8, ft9, fs9
                  fadd.s       fs3, fs3, fa1, rmm
                  xor          a7, zero, s1
                  fsgnjn.s     fs7, fs9, fs9
                  nop
                  slti         t4, s7, 660
                  divu         gp, s10, s2
                  or           sp, a5, t4
                  add          t4, s2, a3
                  fsqrt.s      ft10, fa4
                  srai         t5, s5, 10
                  nop
                  xor          a5, ra, t1
                  srli         s6, gp, 8
                  xor          s8, t2, s0
                  fsqrt.s      fa4, fa6
                  sll          gp, a1, a2
                  addi         a6, tp, 938
                  fadd.s       fa3, fs0, ft3
                  srai         a0, s1, 20
                  fsgnjn.s     ft8, ft5, ft6
                  add          t4, a7, zero
                  andi         t4, sp, 69
                  fmv.x.w      t4, ft11
                  srai         t5, s3, 21
                  sra          t3, s0, a4
                  fsub.s       ft4, ft1, ft1, rtz
                  andi         s4, t2, -1275
                  fdiv.s       fs11, ft6, fa0, rup
                  sub          t5, a2, s10
                  sra          a1, s5, s3
                  sltiu        s8, t2, -844
                  addi         gp, t1, -732
                  srai         t4, a4, 1
                  fmax.s       fs0, fa0, fs1
                  fcvt.w.s     s8, fs11
                  sll          t0, s8, ra
                  sltiu        a5, s6, -1980
                  srli         a4, s4, 1
                  fle.s        sp, fs1, fs9
                  andi         s6, ra, -1001
                  fcvt.s.w     fs0, s7, rup
                  sltu         t1, s3, s6
                  add          a0, s2, s3
                  slti         t5, t6, -1881
                  auipc        s1, 75338
                  fsgnjn.s     fa7, ft8, fs8
                  mul          a5, a0, s11
                  sra          a1, a0, a1
                  mulhu        a4, a2, gp
                  slli         t3, s6, 19
                  fmv.w.x      fa0, ra
                  fclass.s     a3, fa1
                  sub          t1, s10, s4
                  mulh         sp, t1, t5
                  xori         s1, s10, 1967
                  fsgnj.s      fs9, ft9, fa1
                  fmul.s       fa2, fs2, fa5
                  fmax.s       ft5, ft6, fa1
                  slli         a4, s3, 0
                  feq.s        t2, fs10, fa2
                  rem          sp, s9, t4
                  fmv.w.x      fs8, t3
                  xor          s7, t2, s11
                  xori         a3, a1, 146
                  ori          s2, s9, 1093
                  sltiu        t1, a2, -276
                  fmin.s       fa2, fs6, fa6
                  div          a6, a4, a3
                  auipc        s4, 795150
                  auipc        a7, 176762
                  auipc        ra, 463
                  fadd.s       fs7, fs1, ft7
                  fle.s        a6, fa2, fa7
                  fmul.s       ft4, ft4, ft3, rne
                  mulhsu       s3, t3, t3
                  xor          s2, a0, s3
                  fcvt.s.wu    fa0, s9, rtz
                  or           a0, t4, zero
                  sra          t1, zero, tp
                  mul          a7, s5, s2
                  slli         s3, a5, 15
                  sra          a3, zero, a6
                  mulhu        a7, t4, t5
                  srai         gp, t3, 15
                  mulhsu       t3, t1, a2
                  ori          t2, t5, -1193
                  sra          s10, a2, a1
                  slli         t3, tp, 20
                  srai         a6, t5, 25
                  fcvt.w.s     a0, fs4, rmm
                  fsgnj.s      fs8, fs7, ft5
                  fcvt.w.s     a3, fa0, rmm
                  sub          a7, s11, s10
                  fadd.s       fa7, ft9, ft10, rup
                  addi         ra, a1, -638
                  auipc        t2, 164930
                  fle.s        t4, ft10, fs7
                  rem          a7, s3, a5
                  andi         a3, a1, -1009
                  slli         sp, s7, 15
                  or           t1, ra, t0
                  rem          s2, a7, s2
                  sll          gp, t4, tp
                  fcvt.s.w     ft0, s5
                  nop
                  fsgnjn.s     fs9, ft5, ft8
                  sltiu        s2, t1, -1967
                  rem          s1, s2, tp
                  slli         t5, a1, 30
                  slt          s2, a2, s10
                  fdiv.s       ft6, fa5, fs9
                  sll          a6, s6, a4
                  slt          s4, s8, gp
                  add          t4, sp, a7
                  fmv.w.x      fs11, a5
                  fsub.s       fa3, ft8, fs10
                  flt.s        a7, fs9, ft2
                  fsub.s       ft9, fs7, ft5, rtz
                  fcvt.w.s     s1, fa4, rne
                  fsub.s       ft3, fs11, fa4, rne
                  fadd.s       fa5, ft8, fa7
                  feq.s        t6, fa6, ft4
                  slti         s7, a5, -116
                  mulhsu       s1, a2, t3
                  sub          s3, tp, t0
                  slt          t5, t1, gp
                  add          a7, sp, a0
                  mulhsu       s8, a2, ra
                  mulh         t5, s11, s1
                  sltu         s3, a1, a5
                  fmul.s       fs2, fs11, fa4, rdn
                  add          a6, s9, s0
                  xor          s4, a5, s10
                  fcvt.w.s     t2, fs2, rmm
                  ori          t2, t0, 1686
                  fmul.s       fa2, ft1, fs4
                  div          gp, t3, t6
                  fmv.x.w      a3, ft5
                  slt          s8, a1, s1
                  fsgnj.s      ft1, fa0, fs6
                  fmv.x.w      s10, fa2
                  ori          ra, a4, -452
                  fcvt.w.s     t4, fa5
                  slt          s9, s11, t3
                  fsgnj.s      fs10, fa2, fs2
                  fcvt.wu.s    zero, fs5, rne
                  sub          a1, t6, t1
                  srl          sp, t6, s1
                  flt.s        t6, ft9, ft6
                  fle.s        s6, fa6, ft3
                  sra          s10, t3, a5
                  fcvt.w.s     t3, fs9, rmm
                  or           sp, t3, s0
                  fmv.w.x      fa4, s4
                  or           t6, tp, s5
                  and          s2, s0, s9
                  fcvt.s.wu    ft8, s9
                  fsub.s       ft2, fs3, ft1
                  rem          t1, s11, s0
                  mulhu        s7, a7, s11
                  remu         s4, a1, tp
                  srai         t0, a0, 8
                  addi         t4, s6, 484
                  xor          s6, s2, a2
                  nop
                  xori         a4, t5, 664
                  fmin.s       fa0, fa7, fa3
                  mulhu        t6, s1, t1
                  fsgnj.s      ft5, fs5, fs10
                  sltiu        a6, t3, -972
                  fsgnjx.s     fs6, ft10, ft7
                  fle.s        s8, ft6, ft7
                  xor          t4, t1, s4
                  fle.s        a3, fa1, ft5
                  fmv.w.x      fs4, s11
                  slli         t0, s5, 17
                  fsgnj.s      fa1, ft3, fs1
                  fsgnjx.s     fs3, fs6, fa3
                  fadd.s       fa1, fa7, ft6
                  auipc        s2, 899039
                  fmin.s       fa4, fa6, ft9
                  rem          t0, a3, a3
                  mulhu        zero, s9, s1
                  fcvt.wu.s    s1, fa1
                  sltiu        sp, t0, 1853
                  sll          a5, s1, s5
                  fcvt.s.w     fa4, s0
                  fmul.s       fa2, fa7, fa7
                  and          s1, s8, s10
                  flt.s        gp, fs10, fa3
                  nop
                  fsgnjx.s     fs2, ft6, fa7
                  mulhu        a2, tp, s4
                  addi         sp, t0, 421
                  fmul.s       fa3, ft10, ft9
                  divu         a7, a6, s10
                  fmv.w.x      fs2, t2
                  fclass.s     s3, fa1
                  fmul.s       fa7, fs0, fa5, rtz
                  fcvt.w.s     ra, ft4, rup
                  nop
                  auipc        a4, 772529
                  fadd.s       fs5, ft2, fs1, rdn
                  sltiu        s1, s9, 469
                  fmv.w.x      fs2, s3
                  mul          zero, t6, a5
                  sll          s1, a5, s8
                  remu         tp, s1, t5
                  fclass.s     s6, fs1
                  rem          t6, s3, s7
                  lui          sp, 498305
                  fsgnjn.s     fa2, ft9, fs11
                  fsgnj.s      fs0, ft7, fa4
                  add          a2, gp, a2
                  andi         s3, gp, 585
                  slti         a3, t1, -1547
                  slt          a2, t2, s2
                  auipc        s8, 739513
                  srli         s1, a7, 9
                  slti         s8, a2, -2038
                  fcvt.wu.s    a0, ft4
                  srli         sp, t3, 28
                  flt.s        t1, fs7, fa6
                  mulh         a7, a1, t5
                  auipc        ra, 523987
                  or           gp, t1, t4
                  xori         t3, s2, 1304
                  and          t6, s1, a2
                  slli         a3, s0, 4
                  div          s9, t4, s4
                  divu         s1, a5, t5
                  fcvt.s.w     fa1, s10, rtz
                  xor          zero, t4, a3
                  fsgnjn.s     fa2, ft9, ft9
                  fdiv.s       fa6, fs5, ft6
                  fle.s        zero, fs2, fa6
                  sltiu        t0, a7, 1945
                  fmv.w.x      fa3, a2
                  fmv.x.w      t3, fa7
                  auipc        s6, 912489
                  xori         t0, s11, -1063
                  srl          t3, a1, s0
                  slt          s6, s9, s7
                  slti         t0, s7, -1383
                  fcvt.w.s     s10, ft6
                  fcvt.s.wu    fs0, s8
                  fsgnjx.s     ft5, fs8, fa6
                  flt.s        gp, fs9, fs1
                  flt.s        gp, fa5, fa0
                  fle.s        t5, ft5, ft5
                  fmax.s       fs3, fs10, fs0
                  fmv.x.w      t4, ft9
                  ori          s7, a1, -1935
                  fcvt.wu.s    a5, ft9
                  div          zero, s3, a1
                  auipc        t5, 385822
                  slti         t4, s3, -1014
                  ori          s3, s9, -1302
                  fmv.w.x      ft0, t1
                  and          a1, ra, t3
                  fmax.s       fs9, ft9, ft1
                  addi         a1, s0, 927
                  fsqrt.s      ft9, fs2
                  fdiv.s       fa0, fa1, fa2
                  nop
                  fmul.s       ft5, ft6, ft5, rdn
                  mul          t3, t5, a2
                  nop
                  fsgnjn.s     ft2, fs11, ft6
                  xor          s10, s3, a5
                  fsqrt.s      fs1, ft4, rmm
                  fdiv.s       fa3, fa5, fs2
                  sltiu        tp, zero, 1469
                  mulhsu       t3, t6, a2
                  remu         t0, tp, tp
                  sltiu        t1, a6, -743
                  fclass.s     t3, ft0
                  mulhsu       a0, s9, s9
                  mulhsu       a0, tp, s1
                  div          a4, t3, a1
                  ori          gp, a0, 884
                  srai         s9, gp, 25
                  fsgnj.s      fa2, fa6, ft8
                  rem          t3, s8, gp
                  addi         t5, s6, 970
                  srl          a6, s1, t6
                  or           gp, a2, a7
                  addi         tp, s10, 1433
                  rem          a4, t6, s10
                  and          s4, s0, t4
                  add          t1, a0, s4
                  srai         t4, gp, 15
                  fmv.x.w      gp, fa6
                  fle.s        s9, fa1, fs5
                  fmin.s       ft9, fa0, fa7
                  sub          s3, a6, a3
                  xori         s10, s3, 682
                  sltu         s4, t1, s9
                  slli         tp, s7, 6
                  fmax.s       fa4, ft9, fs5
                  sll          a0, t3, zero
                  fmv.x.w      s6, fa7
                  srl          s10, s4, t2
                  slti         a4, t1, -960
                  fsgnjx.s     ft9, ft3, fa5
                  feq.s        s2, fa4, ft7
                  remu         t6, a3, s7
                  fsgnj.s      ft4, ft5, fs7
                  fsgnj.s      fa1, fs2, fs6
                  rem          s2, s8, s6
                  srli         t6, tp, 4
                  fmax.s       fs6, fs6, fa0
                  fcvt.wu.s    s7, fs8
                  and          zero, s1, s9
                  div          tp, s7, t0
                  andi         s6, t6, -1828
                  xori         s2, s4, -1144
                  fdiv.s       fs7, fa1, ft0
                  and          gp, t2, s8
                  slli         t5, t5, 25
                  mul          t6, zero, s6
                  div          a0, s10, s7
                  rem          s2, t6, a1
                  fcvt.s.wu    fa4, s6
                  ori          s4, t0, 1998
                  addi         s1, s2, 866
                  srli         a1, t2, 12
                  mul          t6, sp, s5
                  andi         t5, s10, 1896
                  fmul.s       fs4, ft11, ft2
                  ori          a4, s8, -1674
                  fsgnj.s      fs6, ft11, fs6
                  sll          a2, t4, sp
                  xori         s1, t2, -70
                  fcvt.w.s     t4, ft9
                  fcvt.wu.s    s3, fs6, rne
                  sltu         s6, s2, s2
                  fcvt.s.w     ft6, s8
                  slti         a1, s3, 1346
                  fsub.s       ft8, fs1, fs1, rne
                  flt.s        s4, fs5, fs1
                  fmv.w.x      fs0, t3
                  lui          a4, 984164
                  sra          a0, t6, t1
                  andi         t1, s11, -985
                  fmv.w.x      fa5, tp
                  fle.s        a7, fs7, ft2
                  fsqrt.s      ft8, fa4, rup
                  fcvt.s.wu    fa0, s6, rdn
                  srai         gp, a7, 15
                  sll          t0, a6, a3
                  xori         t0, s6, 524
                  div          t6, t4, t6
                  mulh         t0, t4, s6
                  remu         t3, tp, s0
                  fmax.s       fs9, ft2, ft10
                  sll          t3, t0, s10
                  fsgnj.s      fa7, fs9, ft9
                  mulhu        t3, t3, tp
                  fsgnjx.s     fs4, fs8, ft0
                  srai         s2, s5, 0
                  fle.s        t6, ft1, fa1
                  sltu         s2, s10, t0
                  divu         ra, t5, s10
                  add          zero, tp, s2
                  mul          s1, s1, s5
                  fsqrt.s      fa7, fa6, rmm
                  fcvt.s.w     fs4, s6
                  or           tp, gp, a1
                  slli         a6, a2, 9
                  fsgnj.s      fa2, ft8, fa3
                  rem          t1, gp, a4
                  slli         s3, a1, 15
                  or           s2, s2, s3
                  lui          ra, 561206
                  fdiv.s       fs5, fa6, fa6, rne
                  fcvt.s.w     fs8, sp, rdn
                  flt.s        s10, fs5, fa0
                  slli         a4, t0, 0
                  sltiu        s1, s8, 1456
                  addi         s6, t6, 1752
                  sltu         gp, s8, s4
                  srai         t0, a6, 12
                  fmin.s       fa2, ft7, fa1
                  xor          s1, t3, t6
                  fcvt.s.wu    fs0, s5
                  fcvt.s.w     fs7, a2, rtz
                  auipc        a7, 100622
                  fcvt.wu.s    gp, fs10
                  nop
                  mulhu        tp, t3, a1
                  srli         s1, t0, 1
                  srli         t5, a0, 7
                  sub          s1, s6, s8
                  fsgnj.s      fa7, ft3, fs3
                  fmin.s       fs6, ft1, fa0
                  and          s2, t3, s2
                  xor          s2, t3, a4
                  fmin.s       ft5, ft11, fs1
                  remu         a0, ra, s6
                  mulh         s3, a4, s9
                  fsgnjx.s     fa5, ft0, ft0
                  nop
                  fmv.x.w      s3, ft7
                  fmin.s       ft11, ft5, fs0
                  sra          zero, s0, t0
                  slti         s4, t1, 251
                  divu         a3, s4, a4
                  sra          ra, t5, t5
                  lui          s4, 627523
                  sltu         t3, a2, t3
                  slli         zero, tp, 13
                  fcvt.s.w     fs2, s4, rup
                  fmin.s       fs4, fa1, fa1
                  srai         s4, s11, 15
                  mulhsu       a5, ra, gp
                  add          t1, s11, t6
                  xori         a3, ra, -792
                  fmv.x.w      a6, ft9
                  fcvt.s.wu    ft1, a5
                  fsqrt.s      fs3, fs7, rne
                  or           a6, s10, s4
                  sra          s8, t2, gp
                  fmv.x.w      t2, fs6
                  mul          a1, t4, s5
                  feq.s        a3, fs5, fa1
                  xori         ra, s8, 1439
                  srli         a5, s2, 31
                  srai         s1, zero, 3
                  fmin.s       fs3, fa3, ft1
                  xori         a3, t5, 1819
                  flt.s        t2, fa3, fa1
                  fdiv.s       ft6, fs7, fs9, rup
                  addi         a4, zero, -1256
                  slti         t1, a4, -292
                  srl          t0, ra, s2
                  fadd.s       ft1, fs4, ft5
                  andi         t5, gp, -1260
                  fsgnjn.s     fs9, fs7, fs9
                  fsgnj.s      fs7, fa6, ft1
                  auipc        a2, 764989
                  flt.s        a5, ft3, ft2
                  flt.s        a5, fs6, ft0
                  fsgnjn.s     fs0, fa1, fs2
                  fmin.s       ft8, fs9, fa0
                  fmax.s       fs4, fs6, fs11
                  fmv.w.x      ft5, s9
                  srl          s10, a7, t0
                  fdiv.s       ft4, ft7, fa0, rup
                  addi         a0, a6, 768
                  mulhsu       zero, s1, s3
                  flt.s        a1, fs0, fs6
                  or           t6, sp, s10
                  nop
                  auipc        t2, 851364
                  remu         a2, a3, a0
                  fmin.s       fs3, fs11, fs6
                  slli         gp, s1, 23
                  mulhu        ra, zero, a6
                  and          a5, t2, s3
                  fsub.s       fs7, fs5, fs0
                  div          a7, t6, t5
                  add          zero, a7, t0
                  add          s4, t3, s3
                  addi         ra, a4, 578
                  flt.s        t2, fs4, fa6
                  sll          a2, t6, a4
                  srai         t2, t1, 11
                  fsub.s       fs0, fs3, ft3, rdn
                  nop
                  flt.s        ra, fs0, fs9
                  fmul.s       ft1, fs7, ft0
                  and          s7, s9, s8
                  fadd.s       ft4, fs2, ft0, rdn
                  remu         s7, a0, s9
                  sltiu        t0, t2, 628
                  fmul.s       fa4, fs5, ft7, rne
                  auipc        s4, 304552
                  fclass.s     s10, fs4
                  sll          sp, t5, a6
                  fcvt.s.wu    ft9, s8, rtz
                  fsgnj.s      ft5, fa7, fa6
                  xori         a4, a4, 1055
                  mulhu        s4, a2, t2
                  lui          t5, 263891
                  xori         gp, s0, 1105
                  fdiv.s       fa5, ft8, fs1
                  fcvt.s.w     fs10, a1, rmm
                  sub          a3, a2, s10
                  and          zero, a5, a1
                  fle.s        a5, ft10, ft3
                  mulhu        a0, a3, a6
                  fle.s        tp, fa2, ft1
                  slli         tp, a5, 2
                  mulhu        zero, s8, a3
                  fmin.s       fa0, fa6, fs9
                  fmin.s       ft8, fs10, fa4
                  sra          t1, t4, sp
                  fle.s        a5, fa3, ft4
                  fmv.x.w      a0, fa7
                  fmv.x.w      t4, fs0
                  auipc        s7, 222416
                  sll          a1, s11, a1
                  fmul.s       fs0, fs2, ft6, rdn
                  fmul.s       ft10, ft8, fa5
                  mulh         t3, s5, t2
                  slti         gp, s9, 1313
                  fmin.s       fa3, fs3, fa7
                  fle.s        a2, ft5, fa1
                  fsqrt.s      fs9, fs3, rdn
                  fcvt.w.s     s2, fs11, rmm
                  fdiv.s       fa5, ft11, ft8
                  xor          a6, s5, s2
                  sub          t4, tp, s5
                  nop
                  slt          a0, s10, s1
                  srl          t1, a7, t2
                  rem          s9, sp, s9
                  srl          a7, s2, s0
                  lui          a1, 527530
                  mulhu        s2, a3, a3
                  fmv.x.w      s3, fa7
                  div          a3, s0, s4
                  rem          s8, t5, ra
                  srai         s7, s9, 0
                  sll          s10, t0, gp
                  feq.s        s3, fa4, ft1
                  flt.s        a1, fs0, fa4
                  fsgnj.s      fa1, fs5, ft6
                  fcvt.s.wu    fs8, s8, rmm
                  sra          t1, s10, a4
                  srli         t6, a4, 17
                  fmul.s       ft10, ft9, ft8
                  sra          s2, t2, s3
                  sll          t1, s2, a3
                  fsqrt.s      fa3, fs6, rup
                  sltu         s3, s6, s6
                  fmv.x.w      t3, fs2
                  fle.s        s8, ft11, fa2
                  div          t5, a2, s11
                  fmax.s       fa6, ft6, fa7
                  feq.s        t2, ft1, fa6
                  fsgnj.s      ft5, ft11, ft9
                  andi         a3, t3, -495
                  sra          a0, a0, s9
                  slli         gp, a7, 22
                  fmv.w.x      ft0, t2
                  fmin.s       fs11, fs4, fa4
                  fsgnjn.s     fs6, ft4, ft7
                  div          a3, gp, t2
                  and          a2, s11, s8
                  fclass.s     a2, fa2
                  mulh         s9, sp, s1
                  fmax.s       fa6, fs4, fa1
                  feq.s        a3, fs2, ft8
                  rem          s9, t3, s0
                  mulhu        t2, a0, t0
                  srli         a3, a2, 19
                  fclass.s     t4, fs3
                  add          s10, s7, s10
                  xor          s1, s10, zero
                  srl          a6, s7, t6
                  fcvt.s.wu    ft7, a2, rup
                  fmul.s       fs2, ft3, ft7, rdn
                  div          t2, s11, a3
                  fsgnjx.s     ft4, ft10, fs9
                  fcvt.wu.s    t6, fs11, rne
                  nop
                  sra          s10, s9, t3
                  fmax.s       ft11, fs7, fa4
                  fmax.s       fs0, fs9, ft5
                  lui          t3, 429285
                  srl          t0, zero, s11
                  or           t6, s2, a1
                  fsgnjx.s     fs9, ft11, ft0
                  auipc        s10, 849246
                  xor          a0, a1, s9
                  fcvt.wu.s    t3, ft3
                  fsqrt.s      ft4, fs4, rtz
                  fcvt.w.s     t0, fs5
                  add          a2, tp, a0
                  fcvt.s.wu    ft2, s6, rmm
                  fdiv.s       ft8, fa6, ft8, rdn
                  slli         s3, t4, 26
                  and          a6, sp, t3
                  fclass.s     s6, fa6
                  remu         t2, s9, s9
                  add          s1, a4, s0
                  sub          s9, gp, t5
                  srai         ra, s7, 5
                  sltiu        s2, a4, -263
                  sltu         t3, s4, s7
                  fle.s        s3, fs10, fa3
                  fmax.s       fa7, fs1, fs8
                  flt.s        sp, fs7, ft9
                  auipc        t2, 552717
                  slti         t0, s0, -1970
                  mulhu        s10, ra, a1
                  fsqrt.s      fa3, fa0, rmm
                  fdiv.s       ft10, fa1, fs0
                  fsgnjx.s     fs8, ft9, fs4
                  fmv.x.w      t3, fs1
                  fcvt.s.wu    ft9, a4, rmm
                  xor          t5, t5, s2
                  flt.s        a2, fs8, ft9
                  fsgnj.s      ft7, fa6, ft4
                  divu         a4, s6, t5
                  srl          t6, s3, tp
                  divu         a2, a3, a6
                  fcvt.w.s     gp, fa2, rne
                  fcvt.wu.s    t6, fs8, rup
                  fsgnjn.s     fa7, fa7, fs5
                  mulhu        a5, gp, tp
                  ori          zero, a7, 950
                  fdiv.s       fs6, fs2, fa0, rmm
                  fsgnjx.s     fa4, fs0, fs1
                  divu         t1, s5, a4
                  sub          s7, s11, zero
                  fcvt.w.s     t2, ft5, rne
                  xor          a4, t1, s2
                  fle.s        zero, ft6, fs8
                  slli         a2, s7, 17
                  fmin.s       ft5, fs0, fs3
                  fclass.s     s3, ft1
                  slti         t3, s1, 1130
                  fle.s        a5, fs9, ft6
                  fclass.s     s8, fs9
                  fcvt.s.w     ft3, s0
                  or           s2, a1, s9
                  fclass.s     a5, fa5
                  fcvt.s.w     ft7, t3, rtz
                  fsqrt.s      fa3, ft1
                  fadd.s       fs11, fa5, ft2, rtz
                  fadd.s       fa7, ft10, ft6, rmm
                  fsgnj.s      fs11, fs9, fs11
                  mulh         tp, t1, s8
                  srli         a6, t5, 21
                  andi         t4, zero, 1407
                  mulhsu       t2, a7, s5
                  mulh         a7, a0, zero
                  fmax.s       fa4, fa4, fa4
                  srl          a6, s2, s8
                  rem          a3, tp, a6
                  fsgnjx.s     fs1, ft11, ft0
                  fsqrt.s      fs3, fa3, rne
                  mulh         a3, a6, s1
                  srli         t2, s11, 25
                  addi         s8, gp, 613
                  fle.s        t5, ft1, fs5
                  div          a0, s4, a4
                  fle.s        t3, ft11, fs10
                  fsqrt.s      fs8, fs8, rup
                  slt          s1, s3, t4
                  mulh         a7, t6, a0
                  nop
                  fmul.s       fa4, ft6, fa4
                  fle.s        s7, ft1, fa5
                  andi         s2, tp, 830
                  remu         a1, s4, t3
                  auipc        s4, 516412
                  fsgnj.s      fa3, fs0, ft2
                  fclass.s     t6, ft0
                  mulhu        a0, sp, s0
                  srai         a3, s5, 21
                  nop
                  and          s10, s1, tp
                  flt.s        s10, ft7, ft5
                  sra          a5, t3, s6
                  add          tp, t5, s11
                  lui          s6, 30394
                  fle.s        a0, fa5, fs3
                  fcvt.s.w     ft1, s4
                  nop
                  fdiv.s       fa3, fa1, fs3, rtz
                  fsgnjn.s     ft1, ft7, fa2
                  nop
                  auipc        s2, 645304
                  fsgnjx.s     fs6, fs0, fa5
                  addi         ra, tp, 1650
                  fsgnjn.s     ft3, fs8, ft11
                  srai         t5, t6, 26
                  divu         s7, t2, s3
                  addi         a6, s9, -994
                  fsgnjx.s     fs4, fa6, fs10
                  ori          a2, t3, 949
                  srl          gp, gp, t2
                  remu         sp, a0, t0
                  xori         s2, ra, 1889
                  fsgnjn.s     ft1, fs7, fs8
                  fmul.s       fa3, fs6, fs7, rup
                  fsgnj.s      ft7, fs0, fa6
                  mulhu        gp, a7, a6
                  feq.s        s4, ft4, fs0
                  and          t2, t4, s4
                  sltiu        s2, a5, 779
                  rem          t2, a6, s1
                  mul          s1, s2, tp
                  slti         s2, t2, -753
                  fcvt.s.w     ft3, a6
                  or           s9, s6, s5
                  slli         s10, s5, 23
                  nop
                  srl          s9, s10, t2
                  fmax.s       fa2, ft10, ft10
                  sll          a5, t4, s8
                  fclass.s     t2, fs2
                  fcvt.w.s     sp, ft5
                  divu         a2, t1, a2
                  fmv.x.w      a3, fa6
                  lui          s10, 978725
                  fcvt.s.wu    fa3, s8, rne
                  xori         s1, a7, 1401
                  xor          t1, a4, s4
                  fsgnj.s      fs2, ft10, fa5
                  mulhu        zero, s0, a4
                  fmax.s       fs11, ft10, fs9
                  xor          t2, s11, gp
                  fmul.s       ft6, ft3, fa2, rne
                  sltu         s8, a7, t6
                  fmv.x.w      t3, fs5
                  srli         ra, s6, 3
                  fcvt.w.s     a5, fa0, rup
                  slli         a0, s1, 2
                  sll          s4, s1, s8
                  sltiu        a4, a4, -1342
                  fmax.s       fa7, ft11, fs3
                  ori          s7, s9, -676
                  mulhu        t2, a6, t0
                  addi         a1, t5, -335
                  fcvt.s.wu    fa4, zero, rne
                  fdiv.s       ft1, ft1, ft1, rne
                  divu         s3, zero, zero
                  fmul.s       ft10, ft10, ft11, rtz
                  remu         a2, a1, a7
                  sub          a4, t5, t3
                  fsqrt.s      fs10, ft0, rdn
                  sltiu        s4, gp, 1963
                  fsgnj.s      ft4, fs4, ft9
                  fdiv.s       fs4, fa2, fs4, rtz
                  xori         zero, a2, 760
                  ori          a5, t5, 1198
                  nop
                  and          s3, ra, s5
                  srai         a5, a1, 29
                  fmin.s       ft8, fs8, ft5
                  fdiv.s       ft9, fs11, fa7
                  fdiv.s       ft8, fa7, fa4, rmm
                  div          t6, s6, gp
                  fmv.x.w      a1, ft3
                  andi         t5, gp, -1428
                  feq.s        t2, fa7, fs7
                  divu         ra, a3, a1
                  divu         s7, s11, t5
                  fsgnjx.s     fa3, fs7, ft10
                  fcvt.s.wu    ft6, s11
                  sub          s3, s9, s9
                  fadd.s       ft5, ft9, fs4, rtz
                  fclass.s     s10, ft3
                  remu         s7, s6, gp
                  fsqrt.s      ft5, fa7, rmm
                  mulh         a7, zero, t2
                  fdiv.s       ft11, ft9, ft2, rtz
                  sltu         a5, sp, zero
                  add          s9, ra, s7
                  fle.s        s8, ft9, ft7
                  add          s6, t1, gp
                  fmul.s       ft5, fa1, fa4, rtz
                  srl          s9, a5, t5
                  divu         s6, s2, s8
                  fmax.s       fs2, fs2, fs4
                  fcvt.s.w     fs0, t6, rdn
                  andi         gp, t5, -1565
                  fle.s        t3, ft1, fa2
                  fcvt.wu.s    t1, ft6, rmm
                  fcvt.w.s     s3, fa2, rne
                  slti         s2, s3, 269
                  fcvt.s.w     ft6, s2, rmm
                  nop
                  sltu         s9, sp, t5
                  feq.s        gp, fs10, ft9
                  lui          s9, 70014
                  fmax.s       ft11, ft2, fs8
                  or           zero, s1, a4
                  fadd.s       fa4, ft6, fs0, rdn
                  auipc        t2, 210768
                  fcvt.s.w     fa2, a1
                  fadd.s       ft9, fs3, ft2, rtz
                  sltiu        t0, zero, 1994
                  srli         t6, zero, 16
                  fmin.s       fs8, fs4, fs0
                  fcvt.s.w     fa2, a4
                  sra          s10, t3, s6
                  sra          a6, t1, a5
                  fadd.s       fs4, fs9, fa2, rne
                  fmin.s       fs7, ft7, ft3
                  flt.s        gp, ft8, fa4
                  sltiu        a7, a4, 938
                  add          gp, a0, s0
                  nop
                  fle.s        s4, ft5, fs4
                  sra          s10, a7, ra
                  mulh         s3, sp, s4
                  add          s7, a7, s11
                  rem          t6, ra, a4
                  xori         s3, s9, -1542
                  fmv.w.x      ft3, s7
                  auipc        s3, 366289
                  slli         a5, t5, 27
                  srli         s1, a3, 16
                  sra          s3, s9, s0
                  rem          t2, s7, s9
                  rem          a6, a3, s6
                  fsgnjn.s     ft6, ft8, fa1
                  fmv.x.w      t2, fs2
                  fsgnjx.s     ft1, ft6, ft11
                  fdiv.s       ft9, ft2, ft3
                  fle.s        a6, ft2, fs2
                  fcvt.wu.s    a3, ft8
                  fmul.s       ft4, ft11, ft5, rmm
                  div          a0, s10, s0
                  fmul.s       fs1, ft11, fs3, rtz
                  fcvt.w.s     s8, fs0
                  fmax.s       fs10, ft10, fa7
                  slli         t5, s8, 8
                  fclass.s     s6, fs11
                  fmv.w.x      ft8, t5
                  or           s6, t6, t2
                  fcvt.s.wu    ft10, s11
                  fsgnj.s      ft0, fs4, fs11
                  fcvt.wu.s    tp, fs3
                  mul          gp, s5, tp
                  and          t0, t2, s8
                  fdiv.s       ft3, fs2, ft6, rtz
                  rem          s7, t3, sp
                  sltiu        zero, s5, -328
                  slti         a4, t0, 1900
                  sub          t6, a3, s9
                  fle.s        a1, ft3, ft4
                  srai         s4, a0, 16
                  flt.s        s10, ft5, fa6
                  fsgnj.s      fa1, fa2, fs0
                  div          a7, t6, s8
                  slt          ra, s4, a3
                  feq.s        zero, fs7, ft3
                  fdiv.s       fa5, fs1, fs3
                  fcvt.s.wu    fs3, s3
                  fadd.s       fs7, ft11, fs11
                  slt          sp, s4, a3
                  srl          a6, t3, ra
                  fsgnj.s      ft4, ft10, fa5
                  fsgnj.s      fs5, ft5, fs10
                  fle.s        s2, ft1, ft3
                  srl          t4, s5, a4
                  slli         s10, s9, 8
                  sub          s8, gp, s5
                  fmv.x.w      s6, ft1
                  fadd.s       fa2, ft1, fs4, rtz
                  fclass.s     a1, ft10
                  flt.s        sp, ft10, fs7
                  fdiv.s       fa0, fs2, fs8, rne
                  xori         s7, t6, 978
                  xori         s8, s2, -264
                  fsgnjn.s     fs9, fs8, ft2
                  sub          zero, t2, a6
                  ori          t4, t3, 1996
                  srai         s4, a7, 10
                  fsgnjx.s     fa6, fa7, ft8
                  fsgnjx.s     fs9, fs6, ft10
                  remu         t0, a2, t1
                  sra          s8, a7, s3
                  nop
                  rem          tp, t3, t5
                  lui          a0, 689981
                  fdiv.s       ft5, ft8, fa3, rdn
                  srai         t3, s11, 26
                  sltiu        t0, a0, -889
                  fsqrt.s      ft5, ft4
                  fclass.s     t4, ft8
                  fcvt.w.s     a2, ft11
                  and          t2, s9, s7
                  fle.s        s4, fa2, fa5
                  fle.s        s7, ft1, fs0
                  fcvt.s.w     ft3, a2
                  mulhu        t5, t3, a2
                  sll          s6, tp, s8
                  addi         tp, s9, 92
                  lui          t2, 441614
                  xori         s6, s5, 1969
                  srl          t4, s0, sp
                  fmin.s       ft2, fs3, fa7
                  fadd.s       fs2, fs0, fs11, rup
                  fmin.s       fs5, ft0, fs0
                  fsgnj.s      fa6, fa0, fs10
                  slli         s4, s10, 21
                  fmv.w.x      ft7, ra
                  fcvt.w.s     s7, fa5, rdn
                  sltu         a3, t0, s2
                  fmin.s       fa2, ft2, fs4
                  div          zero, s11, t2
                  srl          s7, s5, s11
                  nop
                  add          t4, a2, t6
                  fsgnj.s      ft8, fa0, fs10
                  xori         sp, a1, -268
                  and          a2, s3, a4
                  xor          t0, s5, t0
                  sll          s8, s3, s3
                  add          s10, s6, s1
                  sll          t3, s8, s7
                  nop
                  fmin.s       fa6, ft2, ft6
                  fsgnjn.s     fs1, fs4, fs9
                  rem          s1, t1, t3
                  fsgnjn.s     ft7, fa0, fa3
                  mul          zero, t6, a3
                  and          t1, t5, zero
                  fadd.s       fs9, fs5, ft8, rup
                  remu         s8, s8, a5
                  mul          zero, s6, s6
                  srli         gp, a4, 14
                  divu         s4, a5, gp
                  lui          s7, 125387
                  fcvt.w.s     s3, ft1
                  xor          ra, sp, t2
                  nop
                  srai         t0, sp, 5
                  divu         t5, t3, s6
                  fcvt.s.wu    ft5, a7, rup
                  fsub.s       ft10, ft4, ft11
                  ori          t4, s5, -1434
                  fcvt.s.wu    ft2, s1, rne
                  divu         sp, s6, gp
                  sll          s3, s4, a3
                  xori         a0, zero, -1940
                  srai         a4, a4, 9
                  div          s4, s8, a1
                  fcvt.s.wu    fa4, s0, rtz
                  srl          zero, s6, s2
                  fcvt.w.s     s10, fa1, rne
                  flt.s        tp, fs10, fa2
                  srli         a6, s0, 13
                  div          s2, a3, s1
                  fsgnjx.s     ft10, fa5, ft10
                  srli         s1, s7, 12
                  fsub.s       fs6, fs7, fs7, rne
                  fdiv.s       fs6, fs3, fa3
                  or           s10, s6, a3
                  fdiv.s       ft10, ft4, fs10
                  and          s2, s4, a6
                  srl          a4, a7, a5
                  nop
                  fle.s        t0, ft1, fs11
                  rem          a2, sp, gp
                  remu         a4, s11, t0
                  fsgnj.s      fs2, fs10, ft3
                  feq.s        t3, ft2, fa7
                  fcvt.wu.s    a2, fs6, rne
                  fcvt.w.s     s9, fs9
                  divu         t1, ra, sp
                  fcvt.s.wu    fs8, s6, rtz
                  feq.s        zero, fa4, fs10
                  fmv.w.x      fa6, sp
                  xor          t0, a7, t1
                  divu         a1, s10, t0
                  fadd.s       ft9, ft11, fs4, rdn
                  or           t2, t2, a0
                  nop
                  sra          s2, s1, zero
                  mulhu        s9, a2, zero
                  nop
                  mulhu        s3, a1, s6
                  slli         s2, sp, 3
                  sltu         a1, t0, a4
                  mulhsu       s2, a1, gp
                  slt          t1, a6, t6
                  remu         a2, t1, s4
                  fsgnjn.s     fa6, fa5, ft9
                  andi         s6, s7, -630
                  fcvt.s.w     fs3, t6, rne
                  remu         a2, a5, a5
                  sra          a7, s9, s2
                  mul          t3, a2, t2
                  and          sp, t3, t6
                  auipc        ra, 767764
                  srai         a4, s0, 8
                  fsgnjn.s     fs11, fa7, ft10
                  fmul.s       fa6, fs11, fs6
                  divu         ra, a3, s4
                  sltiu        a3, s4, 1123
                  fcvt.s.w     fs11, a6
                  fcvt.s.wu    fa2, a6, rdn
                  rem          t5, s10, s3
                  fmul.s       ft1, fs4, fs2
                  fcvt.s.wu    ft2, t4
                  fdiv.s       fa6, fs11, fa5
                  slt          a4, s2, s1
                  div          s7, s9, a3
                  rem          s10, a3, t2
                  sub          a1, s3, s2
                  fmax.s       ft10, fs9, fs6
                  fsqrt.s      fa2, fs10, rdn
                  lui          t5, 164712
                  slti         t6, s3, 1007
                  and          t3, t4, t5
                  and          t0, t6, zero
                  rem          tp, t3, t1
                  sltiu        a2, t2, 753
                  fsgnj.s      ft6, fs1, fs1
                  srli         a3, s2, 25
                  andi         gp, t3, 74
                  sra          s10, a3, a1
                  add          t1, a6, a6
                  sll          t6, s9, s8
                  nop
                  slli         zero, a2, 6
                  fmax.s       fa5, fa0, fa2
                  divu         s8, tp, a1
                  mul          ra, a0, a5
                  addi         s1, a2, 1878
                  fcvt.s.wu    ft5, a3, rup
                  auipc        s9, 180466
                  srl          a6, t2, s0
                  flt.s        tp, ft2, ft4
                  slti         gp, s6, 1776
                  fmv.x.w      a2, ft7
                  nop
                  div          s1, t6, a3
                  and          s3, a6, sp
                  sltiu        t4, s1, -1126
                  slti         a4, s1, -355
                  feq.s        t1, fa1, fa2
                  xor          tp, a2, t1
                  and          t6, s11, s10
                  fmv.w.x      fs4, t4
                  fadd.s       ft0, fs7, ft11, rup
                  sll          a3, a5, t4
                  slt          t4, ra, a4
                  or           sp, t1, a1
                  fsqrt.s      ft11, fs0
                  flt.s        t6, ft2, fa6
                  ori          s8, s9, -873
                  xori         a3, a0, -953
                  fsgnjx.s     fa4, ft7, fs3
                  slt          t6, s3, zero
                  divu         s1, s0, a5
                  fcvt.s.wu    fs7, t4, rtz
                  fsqrt.s      fa7, ft0
                  fcvt.w.s     s6, fs5, rtz
                  fsub.s       ft2, ft0, ft7
                  fmv.x.w      gp, ft4
                  srli         s4, t5, 25
                  fclass.s     ra, fs11
                  fmv.w.x      ft6, t1
                  lui          s2, 945990
                  fcvt.s.w     fs5, a3, rdn
                  fcvt.w.s     s1, fs0
                  mulh         t5, s3, gp
                  addi         t5, t1, -92
                  sll          s6, a3, s6
                  fmv.x.w      s3, fs3
                  mul          s6, s8, a4
                  fsgnj.s      fa2, fa6, ft0
                  rem          t2, a7, t2
                  xori         s8, s3, -344
                  xor          tp, s4, s9
                  fsub.s       ft2, fa4, fs0
                  fmv.w.x      fs11, a5
                  srai         a7, tp, 20
                  fmv.x.w      sp, ft2
                  sltiu        a6, s5, -505
                  srai         t1, ra, 1
                  fsgnjn.s     fs2, fs6, ft5
                  sltu         t4, s6, a3
                  mul          a3, tp, a0
                  and          s8, t0, s8
                  mul          gp, ra, s3
                  fclass.s     zero, fs1
                  fclass.s     tp, ft8
                  sra          s7, s6, s10
                  slt          a3, a5, a7
                  ori          s3, s9, -662
                  divu         gp, s8, a0
                  fle.s        s2, fs3, fa5
                  sltu         t2, s10, a1
                  divu         a6, s8, s8
                  mulhu        s1, s7, t4
                  div          t3, a3, t6
                  sltiu        s7, a6, -1547
                  lui          tp, 227038
                  fmin.s       fs9, fs2, fa7
                  fclass.s     t1, fs4
                  remu         sp, a4, t1
                  slti         s1, t0, 905
                  fsgnjx.s     fa0, ft0, ft6
                  fsub.s       fs5, ft8, fa7
                  fcvt.s.w     fs6, t6
                  and          sp, s7, tp
                  fle.s        a3, fs2, fs4
                  fmul.s       fa3, fa5, fa1
                  fle.s        ra, fs3, fa5
                  or           a4, ra, s5
                  fcvt.s.wu    fa4, a2
                  slli         s7, t4, 14
                  xor          s2, a5, sp
                  addi         t0, t5, -73
                  srli         t2, s3, 8
                  srl          a0, tp, t0
                  fdiv.s       fa2, fs4, fs4, rup
                  mulhu        s1, s3, s2
                  fmin.s       fs11, ft10, ft1
                  slli         a5, s8, 12
                  fsgnj.s      ft11, ft5, fa4
                  fsgnjx.s     ft10, fs8, fs4
                  fmv.x.w      t2, ft8
                  slti         s9, s4, 1267
                  fcvt.s.w     ft3, s1
                  add          ra, s5, zero
                  fsgnj.s      fa7, fs6, ft10
                  slli         a5, s11, 3
                  andi         s4, a5, -368
                  fcvt.wu.s    s9, fs3, rmm
                  fsgnj.s      ft2, fs0, fs8
                  slt          zero, tp, s11
                  fmv.w.x      fs1, a0
                  fsgnj.s      fs9, fa2, ft9
                  mulh         t6, s4, s8
                  div          a5, s3, s11
                  fadd.s       fs0, fa0, fs8, rne
                  fmin.s       fs8, fs9, ft7
                  mul          t1, gp, t4
                  slti         s10, s6, -1290
                  flt.s        t1, fa5, fs10
                  div          s2, s10, a4
                  mulhu        a5, s9, s10
                  mulh         a7, s4, s0
                  add          zero, t3, s9
                  or           ra, s7, a7
                  fclass.s     sp, fa6
                  fmv.x.w      a6, fs9
                  nop
                  lui          s8, 145605
                  addi         s7, t2, -1018
                  sltiu        s2, a5, -710
                  fmin.s       fs10, fs7, fa7
                  fcvt.wu.s    t4, fs8, rdn
                  fsgnjx.s     fs6, fa3, fs10
                  srai         t3, s5, 7
                  fmax.s       fs1, ft1, fs3
                  fsgnj.s      fa3, ft7, fa3
                  fsqrt.s      fa0, fa0
                  and          a2, s1, a5
                  sltiu        s9, a2, 804
                  fmv.x.w      t1, ft6
                  lui          a4, 979643
                  fmv.x.w      a2, ft6
                  fcvt.s.wu    ft0, sp
                  remu         gp, s3, ra
                  div          s9, s2, s5
                  xori         t2, s1, 1101
                  fmul.s       ft3, ft6, fa1, rup
                  fadd.s       fs10, fa2, ft11
                  rem          a2, gp, a6
                  fcvt.s.wu    ft10, gp
                  fcvt.s.w     ft1, a3, rne
                  fsgnj.s      fa6, ft7, fa5
                  divu         a5, s8, a4
                  srli         t1, t5, 2
                  fmv.x.w      a6, ft4
                  nop
                  slti         tp, s0, -108
                  fmax.s       ft11, fa3, fa1
                  xor          a7, t1, s1
                  srai         s3, s7, 11
                  fmv.x.w      tp, fs9
                  fsub.s       fa3, fs8, ft4
                  fsgnj.s      fs10, fs11, ft2
                  divu         gp, a5, s9
                  fmv.x.w      a4, ft3
                  mul          s3, a1, a5
                  fclass.s     t6, fa7
                  mul          tp, ra, a6
                  xori         t2, s11, -660
                  fsgnjx.s     ft8, ft1, fa7
                  flt.s        s3, ft3, fa4
                  sltu         a1, s11, ra
                  flt.s        zero, fa0, ft8
                  divu         t5, s0, s9
                  fmv.x.w      t4, ft3
                  xor          t6, t1, ra
                  nop
                  ori          s3, t4, 1179
                  auipc        a6, 364889
                  div          ra, s1, s4
                  divu         t4, a3, sp
                  fsqrt.s      fs8, ft10, rmm
                  fsgnj.s      ft0, fa0, fa5
                  and          s9, s10, a4
                  srli         s4, a0, 9
                  and          a6, t4, t3
                  sub          s10, a5, gp
                  fmul.s       fs9, fs0, ft3, rdn
                  add          s4, ra, a1
                  remu         t4, t3, t6
                  mulh         a2, a7, t1
                  slli         t1, s5, 8
                  sra          t5, s2, ra
                  srai         t5, s2, 24
                  slt          a6, t2, a6
                  fcvt.w.s     s3, ft7
                  fsqrt.s      ft4, ft11, rup
                  fmax.s       fs2, ft10, fs2
                  andi         t6, t0, 1043
                  auipc        t0, 622103
                  div          a6, s5, tp
                  sltu         s9, a5, a3
                  addi         a2, s9, -1644
                  fadd.s       fa1, fs6, fs7, rup
                  fcvt.wu.s    a3, fs10
                  sltiu        t4, s0, 1258
                  fmul.s       ft6, fa7, ft7
                  slt          a4, a6, s11
                  auipc        t1, 379059
                  div          t0, a1, zero
                  srai         gp, s9, 13
                  mulh         t5, tp, ra
                  slli         a7, t3, 14
                  fdiv.s       fs4, ft7, fa2
                  srl          s7, a3, gp
                  sltiu        a0, s11, 682
                  and          ra, t2, s9
                  lui          s4, 1018866
                  ori          tp, t6, -784
                  fmv.x.w      t3, ft10
                  divu         ra, a3, ra
                  sll          t1, a2, a3
                  fsqrt.s      fs0, ft9
                  and          a0, t1, t0
                  feq.s        s4, fs5, fa7
                  fsqrt.s      fs10, fs2, rmm
                  srl          t1, s5, ra
                  sltu         t1, gp, s5
                  fmin.s       fs10, ft3, fa0
                  nop
                  fmul.s       fs11, fa6, fa0
                  xor          a3, t5, t6
                  fmul.s       fa5, ft1, ft10
                  mul          s9, t2, a2
                  fmin.s       fa2, ft11, fs5
                  xor          a4, t6, s10
                  fle.s        t5, fs8, ft11
                  fsgnj.s      fs10, ft11, ft7
                  srl          t5, s11, t5
                  feq.s        a0, ft9, ft1
                  fsgnjx.s     ft8, ft8, fs2
                  add          s8, a4, s2
                  fsqrt.s      fa5, fa2, rtz
                  sltiu        s1, s4, -1919
                  fcvt.w.s     s3, ft0, rne
                  fcvt.s.w     fs9, ra, rup
                  fmv.w.x      ft7, a2
                  fcvt.wu.s    a4, ft0, rmm
                  fcvt.wu.s    t1, fa5
                  add          a0, t4, tp
                  lui          s7, 801234
                  fsgnjx.s     fa4, fs5, ft9
                  fsgnjn.s     fa3, fa3, fa7
                  feq.s        zero, ft7, fs11
                  slli         a3, t0, 20
                  fcvt.s.wu    fa3, tp, rup
                  fcvt.wu.s    t3, fs4
                  feq.s        a2, fs9, ft11
                  fsgnjn.s     ft8, fs7, ft10
                  feq.s        s1, fs2, fa6
                  mulhu        t6, t1, ra
                  flt.s        a7, fs4, fs4
                  lui          s4, 882834
                  xori         s6, a6, -1042
                  mul          s7, s11, t2
                  srli         s2, s10, 23
                  fsub.s       fa6, fs5, fa2, rdn
                  fcvt.s.w     fs1, s8, rtz
                  fmv.x.w      s4, ft9
                  lui          t1, 302174
                  fsgnjn.s     fa1, ft6, fa5
                  mulhu        tp, t5, t6
                  fdiv.s       ft2, fs4, fs2, rdn
                  mulh         s9, s9, zero
                  sltiu        t2, t5, -544
                  divu         a0, s8, s6
                  fdiv.s       fa3, fs8, fs2
                  lui          a1, 555372
                  divu         s3, a5, s2
                  sltiu        t5, s4, 450
                  rem          a4, a2, s0
                  andi         a4, s0, -1435
                  fcvt.s.w     fa6, s6, rmm
                  fclass.s     s10, ft9
                  lui          s7, 324953
                  fsgnj.s      ft4, fs4, fa7
                  sub          s3, ra, s1
                  xori         tp, t5, 268
                  fmv.x.w      t2, ft7
                  fcvt.wu.s    s3, fs7, rne
                  srl          t2, s5, t4
                  auipc        sp, 549642
                  feq.s        zero, ft3, fa5
                  add          a2, s5, tp
                  remu         s4, t6, t2
                  srli         s4, s1, 31
                  fsub.s       fa1, fa5, ft2, rne
                  slti         a3, a6, -1423
                  srli         s7, t2, 15
                  div          s7, a0, t0
                  div          a7, t1, s11
                  srai         ra, a3, 8
                  fsgnjn.s     fs7, fs8, ft9
                  slli         s6, s3, 1
                  slli         s9, s0, 6
                  sra          s9, a2, sp
                  sub          tp, a3, s8
                  or           t3, a1, s0
                  sra          t1, a5, t1
                  fsqrt.s      fa4, ft8, rup
                  divu         a3, ra, s9
                  auipc        t1, 509836
                  and          zero, s0, a0
                  fsqrt.s      fs10, ft9
                  flt.s        t4, ft6, ft10
                  addi         a1, a1, -605
                  div          t4, sp, a3
                  fsqrt.s      fa3, fs1
                  fle.s        a3, fs1, fs6
                  fsub.s       fa2, fs11, fs1, rup
                  fmv.w.x      ft7, a2
                  andi         t3, tp, -239
                  fmv.w.x      fs0, a6
                  fmin.s       ft0, fs7, ft3
                  fmin.s       fa1, fs9, ft2
                  slti         s7, t2, -1922
                  feq.s        a5, fa3, fa0
                  slti         gp, a0, 1688
                  slli         a0, s11, 20
                  fadd.s       fa0, fs3, fs2, rdn
                  fsub.s       fa4, ft8, fs0, rmm
                  fmv.x.w      s9, fs5
                  fmv.w.x      fs11, gp
                  srai         gp, s8, 19
                  mulhu        a7, s9, s1
                  fsgnjx.s     fs0, ft8, fs0
                  andi         a7, zero, 2045
                  rem          a5, zero, s7
                  fmax.s       fs6, fs0, fs9
                  mul          tp, t3, a6
                  mul          t6, a7, tp
                  fmv.x.w      s8, fs11
                  sltiu        s10, t2, 1898
                  sltu         a3, t6, zero
                  sltu         a3, t6, t6
                  mulh         a6, s5, a4
                  fsub.s       ft3, fs9, ft7
                  add          t5, t1, s2
                  slli         t0, a3, 10
                  fclass.s     a7, ft1
                  fsgnj.s      ft8, fs2, ft1
                  mulhsu       t0, a3, t3
                  and          a1, t1, s2
                  mulhu        a0, s5, s3
                  fsgnj.s      fa7, fa3, ft10
                  fcvt.wu.s    t0, fa7, rup
                  nop
                  fmax.s       fs11, fs4, ft3
                  fsgnjn.s     fs8, fs4, fs6
                  auipc        a6, 111442
                  fmin.s       fs6, fs3, ft1
                  nop
                  slti         s7, t1, -326
                  lui          s3, 169412
                  slli         t2, s1, 24
                  fsub.s       ft4, ft5, fa7
                  fmax.s       fs7, fa6, fs6
                  fsgnjn.s     ft1, fa2, fa0
                  xor          a2, a3, t2
                  fmul.s       fs6, ft0, fs7
                  slti         a3, s10, 4
                  fclass.s     a1, fa7
                  fmax.s       fs5, fs8, ft2
                  auipc        a1, 21963
                  slti         s1, t6, 1418
                  or           s9, zero, a3
                  add          ra, t0, a2
                  fle.s        s10, fs0, fs0
                  fcvt.wu.s    sp, fs1
                  remu         t5, gp, t0
                  and          tp, t0, s8
                  fadd.s       fa7, fs7, fs7, rtz
                  srli         a7, s7, 12
                  flt.s        s1, ft6, fs7
                  sltiu        s2, s3, -638
                  srl          a3, a1, a1
                  srai         zero, s5, 11
                  slli         s6, gp, 17
                  sltu         a7, s11, zero
                  auipc        t6, 457139
                  fle.s        t6, ft11, fs1
                  ori          a2, t0, -1115
                  mulh         gp, a6, a5
                  mulh         s1, t5, gp
                  divu         a6, s3, s4
                  fmin.s       fs8, fa2, fs7
                  fmax.s       ft5, fa3, fa2
                  addi         s6, s8, -13
                  nop
                  slli         s3, a3, 29
                  fclass.s     zero, fa4
                  fsgnjx.s     fs7, fs11, ft1
                  fsqrt.s      fs1, fs11
                  sltiu        a1, a2, 2021
                  addi         gp, s1, -1216
                  fsgnj.s      ft8, fs6, ft7
                  fmax.s       fa4, fs11, fa2
                  fcvt.s.w     ft8, a2, rtz
                  fdiv.s       fs1, fa2, fs8
                  fsgnj.s      ft3, ft11, ft3
                  fcvt.wu.s    s6, ft7, rmm
                  fclass.s     a0, ft9
                  mul          a7, a3, a4
                  fsgnj.s      fa6, fa4, ft2
                  andi         s2, a5, -730
                  mul          a5, a2, s4
                  mulhu        a1, ra, t5
                  fdiv.s       ft4, fs4, ft4
                  slli         s10, gp, 9
                  feq.s        t4, fs0, ft0
                  rem          a3, s8, t5
                  and          s8, a2, t5
                  slli         t1, t1, 9
                  srai         a0, s1, 12
                  auipc        a1, 1042284
                  fmv.w.x      fa6, s5
                  sub          a6, s1, s11
                  fmin.s       fs7, ft9, ft7
                  fadd.s       fa7, ft5, ft6
                  mulhsu       s9, t2, t6
                  slli         t4, t6, 1
                  fsgnj.s      ft9, fa3, fa7
                  fadd.s       ft2, ft6, fa0
                  fdiv.s       fa3, ft3, ft10, rdn
                  fsgnj.s      ft2, fs9, fs3
                  fsgnj.s      fs4, fs7, fs10
                  slt          a2, a0, s0
                  slt          gp, t4, s9
                  remu         s2, t6, s1
                  divu         a6, a1, a6
                  srl          a1, a5, t1
                  sltu         s7, sp, s2
                  sltu         a1, a0, t4
                  mulh         t3, a4, s4
                  or           t5, a6, s10
                  slt          tp, s8, t6
                  or           t5, a2, s2
                  lui          t0, 805218
                  fsgnjx.s     ft8, fs7, fa0
                  fsgnj.s      fa1, ft2, ft5
                  fcvt.w.s     s7, fs10, rup
                  slti         s1, s11, -1007
                  fsgnjn.s     ft8, ft9, fs1
                  fcvt.w.s     a1, ft11
                  divu         s8, zero, a6
                  fdiv.s       ft9, fs2, ft0
                  fclass.s     t2, fs1
                  slli         sp, a2, 30
                  srai         t4, t6, 3
                  srai         t4, t4, 8
                  auipc        a4, 721021
                  ori          s6, a7, 1484
                  sll          a6, a1, s7
                  mul          t0, s9, s11
                  divu         s9, s1, s8
                  xor          t1, ra, a2
                  slti         gp, zero, -942
                  divu         a4, t1, s10
                  mulh         t6, s9, s11
                  remu         a0, a2, a7
                  fdiv.s       ft2, fa7, ft4
                  srai         ra, a3, 1
                  fmv.w.x      fa1, a6
                  srli         a3, a0, 20
                  add          s10, a1, t6
                  fcvt.s.w     ft8, t5, rne
                  fcvt.w.s     s10, ft10
                  srai         a1, a5, 9
                  lui          a4, 962482
                  fle.s        gp, fa2, fs9
                  sll          t6, gp, s9
                  addi         t4, a7, -814
                  slli         gp, a2, 23
                  ori          s9, s11, 431
                  srai         t5, s4, 10
                  fcvt.s.wu    fa4, ra
                  fcvt.s.w     fa4, a1, rmm
                  srai         a3, a4, 12
                  fclass.s     t0, fa4
                  fmv.x.w      s6, fs10
                  fcvt.s.wu    ft1, s5, rtz
                  fcvt.s.w     fs7, t4, rtz
                  mulh         s4, t2, s2
                  slti         s10, s5, 505
                  fclass.s     sp, fs5
                  slti         s8, s7, -1698
                  divu         s3, t6, t6
                  fsgnj.s      fa7, ft6, ft3
                  feq.s        t6, ft6, fs10
                  srl          a4, s3, t2
                  fsub.s       fs8, fa0, fs4, rne
                  xor          t1, s4, gp
                  fcvt.wu.s    a7, ft1, rdn
                  fmul.s       ft11, fs4, ft9
                  fmin.s       fa1, fs5, fs3
                  fle.s        a6, fa1, ft0
                  slli         a2, t0, 1
                  add          a5, tp, a3
                  ori          s10, s11, -964
                  sltu         a2, a5, a3
                  feq.s        ra, ft3, fa2
                  fmul.s       ft6, fa4, fs11
                  mul          a1, a4, s5
                  fsqrt.s      ft1, ft11
                  add          s3, a6, a7
                  add          a3, t1, tp
                  addi         s10, t6, -685
                  nop
                  or           a7, gp, sp
                  sltu         zero, sp, a7
                  flt.s        s3, ft6, fs11
                  fsgnjx.s     fa4, fa4, fs7
                  srl          a6, a6, t2
                  mulhsu       a5, a7, a6
                  fsgnjn.s     fa6, fs9, fa3
                  sll          s7, s0, t5
                  flt.s        sp, ft5, fa6
                  sll          s7, s7, a0
                  fsgnj.s      fs5, fs7, fs0
                  fsgnjn.s     fs9, ft11, fs4
                  sra          a0, gp, a7
                  fsgnj.s      ft0, fs10, ft0
                  fcvt.s.wu    ft10, s1, rmm
                  fcvt.wu.s    s1, fa6, rdn
                  fsgnj.s      fs11, ft3, ft7
                  sll          s4, s4, s11
                  fmul.s       fs2, fs2, fs8, rne
                  fsgnj.s      fa7, fs2, fs3
                  fcvt.s.w     fs1, a6
                  fcvt.wu.s    s8, ft0, rne
                  srli         s4, s1, 5
                  fcvt.s.w     fs11, tp, rmm
                  fsgnjn.s     ft1, fa1, fs11
                  fcvt.wu.s    s2, fs2
                  fclass.s     a4, ft1
                  auipc        s4, 695785
                  fsqrt.s      ft6, ft10
                  xori         ra, gp, 1864
                  or           a7, t2, s8
                  sll          s8, t4, a7
                  sra          t4, tp, a6
                  or           t6, a5, s7
                  slti         t1, t1, -336
                  flt.s        s2, fs5, ft3
                  lui          t0, 940761
                  divu         sp, t2, sp
                  addi         s1, s8, 1354
                  remu         s4, a5, s11
                  srl          gp, gp, s10
                  fmax.s       fa3, fs8, fs8
                  fmax.s       fs11, fs4, fs1
                  fadd.s       ft1, fs1, fs1
                  ori          a1, s9, 1921
                  mulh         t5, zero, t5
                  lui          a0, 592291
                  add          t2, t3, t2
                  auipc        s6, 221466
                  flt.s        s4, ft0, ft1
                  slti         s7, t1, -804
                  fmul.s       fs11, ft1, ft7, rup
                  divu         s1, s11, a4
                  fcvt.w.s     t1, fa2
                  fle.s        a0, ft1, fa2
                  fcvt.s.w     fa1, t2
                  remu         s2, a7, a5
                  fsgnjn.s     fa0, ft11, fa6
                  slt          s3, a5, a7
                  sub          t1, s7, s9
                  fadd.s       fa1, fs6, fs8, rup
                  divu         t0, s5, a3
                  srai         a6, a3, 6
                  srai         s7, t4, 16
                  fsgnjn.s     fs4, ft3, ft6
                  slli         gp, s6, 17
                  srl          t2, s0, t5
                  mulhsu       gp, ra, ra
                  mulh         s8, t5, s9
                  add          tp, s0, a4
                  andi         s4, s6, 175
                  fmax.s       ft3, fs8, fs2
                  mulhsu       s3, s11, s3
                  slli         a0, ra, 10
                  remu         a1, s5, s5
                  rem          s3, a6, s7
                  fmin.s       ft3, fa5, fs11
                  fmin.s       fs1, fs1, fa0
                  lui          t3, 689228
                  and          t6, s8, s0
                  sltiu        s7, s4, -531
                  slti         gp, a4, -1339
                  rem          t3, s4, t3
                  fmv.w.x      fs4, a4
                  srli         a1, s5, 21
                  mulhsu       t5, a7, t5
                  xori         ra, s8, -992
                  auipc        s9, 424020
                  sub          t2, s6, s1
                  sltiu        s8, a6, 1295
                  fmin.s       fs10, ft5, fa2
                  feq.s        a1, ft7, fa7
                  remu         s6, s9, s8
                  fadd.s       ft1, fa3, fa2, rmm
                  mul          a5, s11, t2
                  sll          t1, t5, t3
                  andi         s10, s0, 1314
                  sll          a3, s1, s1
                  feq.s        sp, ft3, fs2
                  divu         a7, t4, s6
                  fcvt.w.s     a2, fs3
                  rem          s4, gp, t4
                  slti         a6, zero, 1230
                  feq.s        s8, fs8, fs11
                  fsqrt.s      ft5, fs9
                  add          t1, t3, a5
                  fmul.s       fs8, fs2, ft9
                  sltiu        a3, s5, -1014
                  fmv.x.w      t2, fs11
                  or           s9, a6, a7
                  mulhsu       t5, tp, s6
                  fsgnj.s      fs7, ft8, fs1
                  fmv.x.w      tp, fs9
                  lui          s3, 556488
                  fcvt.s.wu    fs7, s6
                  fcvt.s.wu    fa2, t5
                  xori         a5, s5, 837
                  fmv.x.w      t6, fs6
                  mulh         a3, s9, s6
                  mulhsu       s3, t0, zero
                  add          a1, a3, ra
                  srai         a2, a4, 12
                  rem          a0, t4, t1
                  sll          zero, s4, s5
                  mulhsu       s8, t3, s3
                  and          tp, s11, t3
                  fcvt.wu.s    ra, fs5, rtz
                  divu         t2, a2, gp
                  xor          a0, a6, s3
                  or           a4, s9, s1
                  fmv.x.w      s7, fs2
                  fmax.s       ft3, fs4, ft11
                  nop
                  ori          gp, a3, 1978
                  fmin.s       ft5, fa5, fa3
                  mul          s9, t6, s10
                  sub          a2, s1, ra
                  nop
                  slli         a5, a5, 3
                  srai         s2, sp, 10
                  fclass.s     s4, fa4
                  or           t3, a7, a2
                  sub          s1, t4, tp
                  fsgnjn.s     fs6, fs6, ft9
                  fmv.w.x      fs9, s7
                  mulhsu       ra, sp, t6
                  slli         t5, s2, 14
                  fcvt.s.wu    fa2, t1
                  fclass.s     a2, ft8
                  addi         a1, s0, 459
                  mulhsu       s4, s2, t0
                  fclass.s     a1, ft7
                  divu         a7, sp, t3
                  fmv.x.w      s6, fs2
                  fsgnj.s      fs2, fs3, ft1
                  mulh         a2, s11, a0
                  fsqrt.s      ft0, fa7, rne
                  sra          s3, tp, s11
                  addi         a6, a1, 1511
                  fadd.s       ft8, fa7, fs1
                  fmv.x.w      tp, ft2
                  sra          t6, a3, s10
                  xori         sp, s9, -1904
                  fdiv.s       fa3, fs9, fa2, rne
                  remu         s2, a1, s8
                  fmax.s       fs7, ft6, ft7
                  slti         zero, a0, 769
                  srai         a7, s10, 19
                  andi         zero, a7, -682
                  fsqrt.s      ft4, ft7, rmm
                  fmul.s       fs9, ft3, fs6
                  andi         t0, gp, 750
                  fcvt.w.s     t3, fs8, rup
                  rem          s6, s3, s7
                  mulhu        a7, s11, a6
                  remu         t6, s0, t3
                  lui          s4, 145679
                  sltu         a1, a1, s2
                  fsgnj.s      fs7, fs9, ft10
                  sll          a7, t4, ra
                  fcvt.s.w     ft9, a7, rtz
                  fsgnj.s      ft3, fa6, fs0
                  sra          sp, a6, t2
                  slt          s6, t5, t3
                  and          t6, a4, a5
                  fadd.s       fs9, ft1, fa2
                  rem          a7, a1, a1
                  slti         s7, a7, -89
                  slt          tp, a5, s3
                  slt          a6, s9, a0
                  fcvt.wu.s    tp, ft4, rup
                  sub          s7, s4, t1
                  mul          gp, t2, t5
                  fcvt.wu.s    s4, fs10, rup
                  nop
                  auipc        a4, 82636
                  fmul.s       fa3, fs10, fa3, rne
                  fcvt.w.s     a7, ft10, rdn
                  mulh         ra, gp, s4
                  fsgnj.s      ft0, fa3, fa3
                  mulhu        a5, gp, a6
                  fmax.s       ft6, fs11, ft9
                  nop
                  nop
                  fsgnjn.s     fs6, fa5, fa0
                  srli         a3, s0, 0
                  fle.s        a4, fs3, fs1
                  xor          s2, t4, tp
                  fadd.s       ft1, ft9, fs6
                  fmv.x.w      t0, fs6
                  addi         a4, s8, 798
                  fmul.s       ft6, fa1, fa6, rmm
                  or           s9, a4, t2
                  sll          s6, a3, a2
                  slli         a6, s3, 16
                  andi         t3, s1, -292
                  or           t2, s3, s5
                  mul          s9, s8, a5
                  slti         a0, ra, 300
                  srl          a4, s11, gp
                  flt.s        a4, fa3, ft5
                  fadd.s       fs1, fs10, fa4, rup
                  fclass.s     s10, fa6
                  mulhsu       t1, tp, t4
                  fcvt.s.w     fa5, s3
                  slli         t3, t6, 9
                  fadd.s       ft10, ft4, fa1
                  or           t2, t3, sp
                  sub          a6, a3, a0
                  add          a7, s6, t5
                  andi         t5, s0, -1581
                  remu         a6, s9, s9
                  ori          t5, s3, -46
                  fsgnjn.s     ft7, fa7, ft10
                  add          s7, t2, ra
                  add          sp, s2, t3
                  mulhsu       t3, zero, t4
                  fcvt.wu.s    s10, fs0
                  rem          t2, a1, s1
                  fadd.s       ft6, ft9, fs7, rmm
                  slli         ra, a2, 27
                  sub          a2, s11, a5
                  fsgnjn.s     fs10, fs2, ft10
                  fmul.s       fa7, fs4, fs10, rtz
                  add          s3, a4, t5
                  and          s9, t2, s7
                  fsgnj.s      fa3, fa5, fs0
                  slt          gp, s2, a4
                  remu         tp, s9, t6
                  div          a5, a3, sp
                  fcvt.s.w     fa4, s0
                  add          zero, zero, t1
                  slt          a4, s7, a0
                  srl          s6, s7, t5
                  flt.s        a3, ft7, ft11
                  ori          a7, t1, 177
                  mulh         t5, t0, s4
                  or           s10, t0, a1
                  fcvt.s.w     ft4, gp
                  xori         t6, a1, 547
                  fclass.s     s10, fa7
                  fadd.s       fa2, fa3, fs7, rne
                  mul          sp, gp, t6
                  mulhu        s9, zero, s4
                  and          t3, t4, a4
                  fsub.s       ft9, ft10, fs6, rdn
                  srai         a1, a1, 15
                  div          a4, s5, a0
                  fcvt.s.w     fs1, s5
                  fsub.s       fa6, fs3, fs1, rne
                  lui          t2, 1037329
                  fcvt.w.s     tp, ft5
                  xori         tp, s3, -660
                  fsub.s       ft11, fa7, ft9, rtz
                  srl          sp, s1, s3
                  sltu         a7, t0, s1
                  mulh         t6, s0, a0
                  xor          s9, t1, t6
                  divu         tp, a1, t5
                  mul          ra, s10, s4
                  mulhu        t1, t1, s0
                  fmv.x.w      s6, ft9
                  fsub.s       ft9, ft11, ft0
                  fcvt.s.w     fs8, ra
                  slt          a2, a4, a6
                  sltu         t2, s8, zero
                  fsgnj.s      ft3, fs11, fs8
                  fcvt.s.wu    fa7, s9
                  slt          a5, s9, s2
                  feq.s        s1, fa3, ft5
                  remu         s3, s6, s10
                  xor          sp, t0, s7
                  and          s6, t5, s10
                  sub          t3, a1, s2
                  sltu         s10, a6, sp
                  fmv.w.x      ft1, s1
                  xor          t5, gp, t5
                  andi         a2, sp, -1853
                  feq.s        a2, fa0, ft9
                  slti         s6, s5, 1231
                  add          a1, s2, t6
                  fsgnjx.s     ft4, ft2, ft11
                  fadd.s       ft1, ft6, fs2, rmm
                  andi         zero, tp, -2007
                  fmin.s       fa3, ft10, ft4
                  fdiv.s       ft5, fs8, fs5
                  feq.s        s9, fs10, ft7
                  fsgnj.s      fs0, fa3, fa2
                  xor          s8, s3, s4
                  rem          a1, a2, s8
                  fcvt.s.w     fs5, sp, rmm
                  fsgnjn.s     ft4, ft0, fs8
                  sub          s2, a7, t6
                  sll          ra, sp, s5
                  remu         a3, t3, t5
                  remu         t0, ra, t1
                  fsgnjx.s     fa1, ft2, fa1
                  fsgnj.s      fa7, ft1, fs5
                  fdiv.s       fs1, ft3, ft7, rup
                  fclass.s     tp, ft9
                  sra          a4, s7, zero
                  slli         s9, s1, 21
                  feq.s        t2, fa5, fs3
                  slti         a0, a6, -745
                  fsgnj.s      fs7, fs5, ft4
                  addi         t2, a4, -1267
                  fcvt.wu.s    s10, ft11, rdn
                  sltu         s6, zero, t1
                  fsqrt.s      fs10, fs11, rmm
                  fsgnjn.s     fs8, ft4, fa2
                  slti         t3, s3, -834
                  slli         s4, a5, 3
                  fcvt.s.wu    ft2, a7, rup
                  fle.s        s2, fs11, fs6
                  fsgnj.s      fa5, ft8, fa5
                  fmin.s       ft0, ft4, fs5
                  fdiv.s       ft9, fs3, ft0
                  mulh         s6, a2, tp
                  slli         s1, s7, 18
                  sll          t2, a5, t2
                  mulh         t0, t4, a4
                  andi         a0, s7, -1569
                  xori         t4, gp, 1487
                  mul          a4, t0, s5
                  fcvt.w.s     zero, ft8
                  slt          s2, gp, sp
                  auipc        s7, 863310
                  fsgnjn.s     fs0, fs6, fs0
                  fmul.s       fa3, fa5, fs1
                  fsqrt.s      ft5, ft0
                  fmv.x.w      t0, fs0
                  feq.s        a2, ft9, fs6
                  sub          t6, t4, sp
                  and          t6, t3, s5
                  fcvt.s.wu    fs2, a2, rtz
                  fsgnjx.s     fs1, fs6, ft3
                  and          a3, a4, a2
                  fsqrt.s      fs3, ft4, rtz
                  sub          a7, sp, s5
                  addi         s9, t0, 910
                  or           t6, sp, s9
                  fcvt.s.wu    fs5, sp, rne
                  sub          t0, a6, a1
                  slt          t3, a6, a6
                  fmv.w.x      fs10, s3
                  lui          a1, 956149
                  slt          zero, s7, s4
                  or           a6, s10, s8
                  sltiu        s6, s2, 1016
                  ori          s1, a0, 241
                  remu         t1, a7, t0
                  sub          s10, a5, s3
                  or           sp, a0, a7
                  fmin.s       fa1, fs10, fa2
                  mulhsu       t0, tp, a0
                  add          t3, a5, tp
                  fmin.s       ft4, ft5, ft0
                  and          a4, a3, a0
                  nop
                  fcvt.w.s     a1, fs2
                  add          s4, a2, zero
                  mulhu        s6, a1, ra
                  srli         t0, s2, 18
                  remu         a6, s9, t2
                  xori         s7, s7, -1236
                  slt          a3, a2, a0
                  andi         zero, tp, 1030
                  sra          a3, t6, s3
                  fmv.x.w      a0, fs8
                  and          a6, t3, s8
                  slli         a4, a7, 16
                  fmv.x.w      s6, fs9
                  fcvt.wu.s    s3, fa4
                  srli         a4, t0, 23
                  slt          s10, tp, s8
                  fle.s        a2, ft10, fs7
                  fcvt.wu.s    s4, ft5
                  fcvt.w.s     t2, fs2
                  sltiu        t6, s5, -1464
                  sltiu        a7, s4, -306
                  and          s6, a1, s11
                  srai         sp, s11, 29
                  nop
                  mul          tp, a0, gp
                  mulhsu       s3, s8, s5
                  fcvt.wu.s    a6, ft2
                  fle.s        s6, fs5, fs4
                  addi         t0, t5, 937
                  mulh         gp, t5, gp
                  fmv.w.x      fs0, s8
                  or           t2, t6, s0
                  fadd.s       fs1, fa7, ft11, rup
                  fmv.w.x      fa4, t2
                  fcvt.s.wu    fs1, s2
                  fsgnj.s      ft7, fa1, fs1
                  fmv.x.w      t5, fs4
                  fcvt.s.w     fs8, s9
                  xori         a4, s3, -1161
                  fcvt.wu.s    gp, fs11
                  fsgnjn.s     ft3, fa6, fs10
                  fcvt.s.wu    fs9, a3
                  fmin.s       fs9, fs2, fs7
                  and          s3, s2, t1
                  xor          a5, s5, t4
                  xor          t1, s8, t2
                  fsgnjx.s     fs4, ft10, fa4
                  fcvt.w.s     a6, fs8
                  fle.s        a4, fs2, ft8
                  divu         t6, s0, zero
                  remu         s4, t5, tp
                  mulhu        a6, t3, zero
                  fsqrt.s      fa6, fs10, rtz
                  fsgnjx.s     fs1, fs2, fs10
                  div          a2, t2, s8
                  slt          t1, gp, s6
                  rem          zero, s2, a6
                  auipc        t3, 504209
                  fmax.s       ft8, fa2, fs11
                  and          sp, a0, a2
                  sll          zero, zero, s0
                  slti         t1, s7, 1622
                  sltu         a1, a2, a7
                  andi         a3, a1, 1567
                  mulh         t6, a0, s5
                  and          s3, a2, t6
                  fmax.s       fa2, ft1, fa0
                  flt.s        zero, fs4, ft10
                  slti         sp, s10, 1152
                  fcvt.wu.s    s3, fa6, rdn
                  nop
                  ori          gp, gp, -1574
                  fdiv.s       fa5, fs5, ft5
                  fsgnjx.s     ft4, ft10, ft4
                  fsgnjx.s     ft7, fs2, ft7
                  divu         s10, s8, ra
                  ori          t5, t1, 45
                  remu         t1, a1, s11
                  ori          gp, s0, 600
                  divu         s3, s7, s5
                  srli         a4, s10, 21
                  fle.s        a3, ft5, fs2
                  addi         s9, s2, -999
                  rem          a2, s9, t6
                  rem          a0, s9, s0
                  fcvt.s.wu    ft6, a4, rne
                  fmv.x.w      s6, fs4
                  auipc        s10, 247550
                  slt          s4, zero, s3
                  feq.s        ra, ft9, ft5
                  mulhu        t2, a4, s9
                  fmul.s       fs0, fa4, fa0
                  mulhsu       a4, a0, s10
                  auipc        tp, 849535
                  rem          a7, a1, s2
                  mulhu        zero, s6, gp
                  and          s9, s4, tp
                  fsgnj.s      fa1, fs9, fs7
                  nop
                  mulh         s1, a3, a4
                  fcvt.w.s     a0, ft10, rtz
                  andi         t3, t1, 1624
                  fsqrt.s      ft9, fs7, rup
                  sltu         tp, s0, a3
                  div          a4, s7, s10
                  fmul.s       fa5, ft5, ft0, rmm
                  srli         t5, s5, 9
                  fsub.s       ft3, fs4, ft7, rdn
                  fcvt.s.w     fs7, s1, rdn
                  mulhu        a3, a1, a2
                  slli         s1, t2, 24
                  fsgnj.s      fa3, fs0, ft6
                  mulh         tp, a4, s9
                  nop
                  fmv.w.x      fa3, t2
                  add          sp, s4, a6
                  div          a1, s9, s4
                  divu         t4, ra, s8
                  fmv.x.w      s3, ft7
                  xor          ra, s9, tp
                  sub          t0, s0, s2
                  nop
                  fsqrt.s      ft1, ft4, rne
                  fdiv.s       ft4, fs6, fs9, rdn
                  nop
                  fsgnjn.s     ft4, ft9, ft7
                  fmul.s       fs0, fs11, ft7, rne
                  srli         a4, s5, 17
                  mulhsu       s7, a5, zero
                  flt.s        s3, fs6, ft8
                  fcvt.w.s     s6, fa4, rmm
                  fcvt.w.s     a3, fa7, rne
                  fmax.s       fa6, ft8, fs9
                  andi         ra, sp, -126
                  nop
                  mul          s9, a0, t3
                  fmv.x.w      t4, fs6
                  fmv.w.x      fs10, a5
                  rem          a4, t6, t1
                  srli         t2, a0, 13
                  slti         s6, zero, -419
                  fsgnjn.s     ft7, fa7, fs1
                  rem          s3, s7, s4
                  sra          ra, sp, t3
                  flt.s        t1, ft2, fa5
                  fcvt.wu.s    s7, fs9
                  fsub.s       ft5, ft8, ft1, rup
                  fsqrt.s      fs10, fs6
                  fmax.s       fa4, ft0, fs1
                  divu         a5, s8, s10
                  fadd.s       fs9, fa1, fa6
                  srl          s3, t1, ra
                  fclass.s     s10, fs1
                  mulh         a4, t4, a6
                  slli         s6, t2, 7
                  fcvt.w.s     s8, fa7
                  div          s1, s4, s9
                  or           s8, t5, a6
                  sll          a6, zero, s7
                  srl          s7, t3, sp
                  fmul.s       ft6, fa4, fs4, rup
                  fsgnjx.s     fa0, fs8, ft1
                  mulhsu       gp, s4, a2
                  sub          t4, a4, a4
                  sll          s1, a2, s8
                  mul          a0, ra, t3
                  mulhu        a6, a6, a4
                  fcvt.wu.s    t5, fs0, rdn
                  sltu         t5, gp, s1
                  sll          t3, s1, a0
                  and          s2, ra, s0
                  fdiv.s       fs11, fs9, fa3, rtz
                  fcvt.wu.s    s8, fs3
                  srli         a7, a2, 7
                  remu         s4, s8, s1
                  fsgnj.s      fs0, ft3, ft11
                  fmv.x.w      gp, fs9
                  fcvt.s.w     ft2, t2
                  add          t5, s10, a1
                  fsgnjx.s     ft8, fs10, fs0
                  sra          tp, a5, s0
                  divu         ra, s6, zero
                  srli         a6, s2, 26
                  and          a2, t2, s9
                  fadd.s       ft2, fs10, fs4
                  auipc        t3, 664798
                  div          s7, a6, a2
                  fmul.s       ft1, fa4, fa4, rne
                  fmv.x.w      t1, fa7
                  remu         s10, t4, t4
                  sltu         tp, a2, a2
                  div          ra, t0, s8
                  srli         s7, s11, 31
                  sub          a5, t1, a6
                  sll          ra, t1, gp
                  fmul.s       ft4, fa7, fa6, rmm
                  nop
                  fcvt.wu.s    a1, ft5, rmm
                  srl          a7, t2, t6
                  flt.s        a4, fa5, fs2
                  mulh         a4, t6, s4
                  rem          a2, a5, s9
                  flt.s        a6, ft9, ft0
                  fcvt.s.wu    fs10, t2
                  fmv.x.w      a3, fs10
                  flt.s        t6, fs2, fs2
                  fmul.s       fa6, fs0, fs4
                  divu         s6, sp, s2
                  fclass.s     zero, fa3
                  lui          tp, 743908
                  xori         t2, s5, -277
                  fclass.s     a6, ft9
                  srl          t2, a5, ra
                  remu         ra, s4, s3
                  xor          t0, tp, a5
                  sll          a6, t0, s7
                  fsub.s       ft1, fs1, ft1
                  ori          s4, s11, -1551
                  fsgnj.s      ft1, ft9, fa2
                  fle.s        s6, ft7, ft5
                  fdiv.s       fa5, ft0, fs11
                  feq.s        s1, fs9, fs8
                  mul          t6, s4, tp
                  fmin.s       ft10, fs3, fs10
                  xori         a2, s6, -562
                  ori          gp, a2, 537
                  div          s10, tp, a6
                  fsgnjx.s     fs0, ft1, ft10
                  fcvt.s.wu    fs5, a3
                  srli         t4, sp, 15
                  sll          a4, t1, s0
                  slli         a0, a6, 23
                  ori          s10, t6, 1411
                  fsgnjn.s     fa4, ft10, fa2
                  fmin.s       ft8, fa1, ft11
                  remu         a0, s8, s9
                  fcvt.s.wu    fs8, s3, rtz
                  fmv.w.x      ft1, a0
                  flt.s        s10, ft4, fs10
                  fcvt.w.s     zero, fs3, rne
                  add          t3, t5, a7
                  srai         sp, s4, 30
                  fsgnjn.s     fa6, ft4, fs0
                  or           a1, s6, s3
                  fmin.s       fs10, fa5, fa1
                  sub          a0, a2, t0
                  srli         t4, t5, 12
                  fsgnjx.s     ft1, fs10, fs3
                  xori         a4, s8, -1930
                  fcvt.wu.s    sp, fs6
                  sub          gp, s11, s5
                  mulh         sp, a1, s0
                  mulhsu       t5, s6, s4
                  sltiu        a5, t3, -1047
                  fadd.s       fa4, fs7, fs2, rup
                  mulhu        t3, s9, s10
                  divu         a0, s9, a1
                  fcvt.s.wu    fs4, a1, rmm
                  srli         t5, t6, 21
                  fmul.s       ft10, ft10, ft7, rtz
                  fsub.s       fs11, fs9, ft4, rtz
                  fmax.s       fa2, fa0, fs3
                  mulhu        t0, a2, t4
                  flt.s        a0, ft11, fs2
                  lui          a6, 810364
                  xor          a7, a2, s0
                  flt.s        s4, fs9, fa4
                  fcvt.s.wu    fa2, a6, rmm
                  rem          s1, s6, s11
                  or           t0, s1, a3
                  fmin.s       ft8, fs8, ft1
                  fle.s        a7, fa2, fa7
                  slti         a5, s4, 1206
                  nop
                  sub          a3, a3, t5
                  fmin.s       ft5, ft2, fs6
                  srli         s9, t3, 24
                  xori         a0, s9, 1876
                  fsqrt.s      ft4, ft10, rtz
                  slli         s3, t0, 21
                  addi         tp, s0, 641
                  add          t1, t5, s9
                  fcvt.wu.s    s2, fa2, rtz
                  mul          zero, a2, zero
                  fsqrt.s      fs1, fs9
                  sltu         s1, t5, a4
                  sltu         t5, a1, a2
                  fsgnj.s      ft1, fs2, ft6
                  mulh         a7, t3, s8
                  fmin.s       fa7, ft0, fs6
                  feq.s        a3, fs7, fs3
                  addi         sp, a1, 1689
                  fmin.s       fs11, fa7, ft10
                  slli         t0, a1, 28
                  or           t5, ra, t5
                  rem          s9, t1, t2
                  rem          s1, s9, s9
                  fdiv.s       ft0, fs1, ft3
                  nop
                  mulhsu       t4, a6, a4
                  fmax.s       fa2, ft1, fs8
                  mulhu        t1, s9, t5
                  andi         t2, a3, -1674
                  srai         a2, a5, 10
                  div          t1, s11, t1
                  fsqrt.s      ft0, ft11, rdn
                  mulhu        tp, a1, ra
                  mul          a6, s10, ra
                  xor          zero, t2, s1
                  xori         a4, s4, -224
                  xor          t1, a5, t5
                  and          ra, a3, s8
                  fmv.x.w      a7, fa0
                  mulhsu       s8, t4, sp
                  fsub.s       fs2, fs11, fa3, rne
                  srai         a0, s2, 26
                  feq.s        a2, fa0, fs8
                  fadd.s       ft1, fa5, fs7, rne
                  slt          t2, t4, t6
                  fmul.s       fs10, fs6, ft11, rup
                  xori         t6, ra, 1740
                  fcvt.w.s     a3, fs8
                  divu         t2, s0, sp
                  fdiv.s       ft10, ft4, ft8, rne
                  xor          t1, s10, a4
                  fsgnj.s      fa5, ft2, ft11
                  xor          t6, s11, t2
                  add          t4, t6, s3
                  divu         ra, t6, t2
                  sll          a5, s11, t2
                  xori         t3, tp, -1921
                  feq.s        s9, fa6, fa0
                  xor          s3, a0, t2
                  fcvt.s.wu    ft11, s10, rdn
                  xor          zero, t3, a5
                  or           s7, s11, a7
                  auipc        s3, 604620
                  mul          s4, tp, zero
                  addi         sp, s2, 1849
                  fmax.s       ft6, fs4, ft0
                  xori         a6, s0, -1546
                  flt.s        t3, fs8, fs4
                  srli         t5, a4, 27
                  sll          sp, tp, a2
                  auipc        t4, 446670
                  srli         t4, ra, 29
                  fsgnj.s      fa3, ft9, fa2
                  fmv.w.x      fa1, a7
                  addi         a3, a5, 779
                  srai         a4, s2, 19
                  addi         s7, a4, -437
                  sub          s8, tp, s4
                  fcvt.w.s     t4, fs7, rtz
                  fsgnj.s      fa4, fa0, fa4
                  fmv.x.w      a5, ft7
                  divu         a4, s2, s3
                  mul          s3, gp, a2
                  fcvt.s.w     ft2, t5, rtz
                  divu         t3, t5, zero
                  fcvt.w.s     s9, ft7
                  mul          t6, s7, s4
                  flt.s        s10, ft3, ft8
                  addi         t1, t2, 1911
                  remu         s10, a4, s0
                  lui          s9, 652720
                  and          t4, s4, s11
                  srai         t6, s4, 2
                  fmul.s       ft4, ft3, ft8, rup
                  fadd.s       ft7, ft3, fs6, rne
                  fmul.s       ft1, ft3, fs4, rne
                  mulh         a0, s2, s5
                  fmin.s       ft9, ft4, ft2
                  xori         t3, t4, 419
                  feq.s        ra, ft8, ft8
                  srli         t3, s9, 22
                  sra          a5, s7, t4
                  or           s9, a0, s2
                  mulh         t1, s10, zero
                  sll          t1, t5, a1
                  fcvt.s.wu    fs9, s7
                  mulh         tp, s6, s3
                  fmv.w.x      ft5, zero
                  andi         s6, a2, 1718
                  rem          t4, s8, tp
                  fcvt.s.w     fs7, sp
                  mulhu        t2, s11, s10
                  add          a6, s4, s6
                  add          s10, s3, s4
                  mulhsu       zero, a5, t0
                  auipc        t0, 318917
                  fmin.s       ft11, fa7, fs3
                  slt          tp, a7, a2
                  flt.s        tp, ft11, fa3
                  fmax.s       fa5, ft2, fs9
                  srl          a3, s4, s6
                  nop
                  sll          s3, ra, t0
                  div          s3, s3, sp
                  andi         a2, s9, 937
                  divu         gp, gp, t4
                  andi         a1, gp, -1770
                  and          s2, s7, a2
                  fmin.s       fa0, fs1, fs8
                  fsqrt.s      fa6, fs1, rup
                  addi         zero, s0, 971
                  sra          a7, s8, gp
                  mulh         a0, ra, s0
                  fmin.s       fa3, fs8, ft5
                  fdiv.s       fa2, fs0, fa5, rdn
                  div          gp, s9, a4
                  fmv.x.w      a0, ft1
                  fle.s        a0, fa0, ft7
                  rem          s3, t4, s7
                  fclass.s     zero, ft11
                  remu         a3, t4, s10
                  flt.s        t0, ft1, fa2
                  fsqrt.s      ft1, fa2, rne
                  xor          t6, s2, a3
                  remu         a4, t1, t2
                  mulhu        s4, sp, t4
                  ori          t1, s10, -24
                  div          t0, s1, a6
                  xori         s9, a1, -541
                  fdiv.s       ft5, fs1, fs6
                  mulhu        a5, t1, t4
                  fmv.x.w      s1, fa7
                  fcvt.s.wu    fs8, a4
                  flt.s        ra, fa5, fa7
                  sra          s3, s0, a0
                  mulh         s7, t5, s9
                  srl          a0, t4, t1
                  ori          a3, a3, -1027
                  and          a6, s8, a1
                  divu         s2, s8, t1
                  fsub.s       ft1, fa3, ft7
                  xor          s8, a0, s2
                  xori         t4, a3, -476
                  fcvt.wu.s    t1, fs10, rtz
                  sltu         a1, s1, s5
                  slt          s6, t2, a2
                  sll          sp, t1, s2
                  sra          s8, s4, t3
                  fcvt.s.wu    fs4, a3, rtz
                  fmul.s       fs7, fa6, fa5, rtz
                  add          a5, s4, s1
                  fsgnjx.s     ft2, fa4, fs5
                  slt          t0, s5, t6
                  lui          a3, 560588
                  fmv.w.x      ft4, ra
                  add          t1, t0, gp
                  divu         a1, t0, s8
                  fdiv.s       ft2, ft4, fs11, rup
                  divu         a5, s9, t4
                  slli         t0, t2, 0
                  slli         t3, t5, 4
                  mulhsu       s4, t2, s6
                  fsub.s       ft11, ft11, ft9, rne
                  xori         gp, a1, 1673
                  lui          s8, 616311
                  sltu         zero, s9, t6
                  feq.s        s3, ft11, fs7
                  srai         s10, a6, 28
                  or           ra, t4, a2
                  mulhu        sp, s2, a5
                  flt.s        s6, fs4, ft5
                  fsub.s       ft11, ft2, ft3, rup
                  srli         a1, a5, 20
                  slti         s4, s9, -579
                  divu         s9, t2, sp
                  div          s9, ra, a7
                  fsgnjn.s     ft2, ft1, fa1
                  xori         s1, t1, 298
                  slli         s10, s0, 15
                  fmax.s       fa3, fs5, fs7
                  fadd.s       fs2, fs4, fs5, rtz
                  mulh         sp, t4, a2
                  srai         s7, a1, 20
                  fsgnjn.s     ft3, fa1, ft5
                  sra          tp, s4, a3
                  srai         a6, s7, 1
                  add          t5, s9, s1
                  fmin.s       fs9, fs8, fs11
                  and          a7, a0, s8
                  lui          a5, 233330
                  sub          a7, a0, s11
                  mulhsu       a6, s1, t2
                  fsgnjx.s     fs6, fs5, ft5
                  nop
                  fsqrt.s      ft7, fs2, rdn
                  nop
                  xor          t5, sp, s9
                  fcvt.s.w     ft3, s4, rne
                  fsgnj.s      ft0, ft11, fs1
                  fsgnjn.s     fa1, fs9, ft10
                  fsgnjx.s     ft2, ft1, fa3
                  fdiv.s       fa0, fa5, ft11
                  fsqrt.s      fs0, ft8
                  fadd.s       fa1, fa7, fs8
                  mulhsu       s10, s5, a5
                  xor          s7, zero, a2
                  slti         a7, sp, 495
                  feq.s        s7, fa1, fa1
                  srli         s2, gp, 17
                  ori          s3, s4, 1680
                  mulhu        t0, t0, t0
                  mul          s8, s8, s11
                  fclass.s     s9, fs7
                  auipc        s10, 833888
                  fsgnj.s      fs4, ft0, fs9
                  remu         s4, s5, s4
                  fclass.s     t2, fs8
                  xori         ra, s3, -37
                  fmul.s       fs10, fs11, fa1, rtz
                  remu         t1, a5, s7
                  auipc        s10, 463711
                  srai         t2, ra, 6
                  feq.s        tp, ft5, fa7
                  fsqrt.s      fa2, fs0
                  andi         a3, a6, -1469
                  xori         a0, t3, 516
                  addi         s10, tp, 1699
                  addi         a0, ra, -813
                  divu         t3, s0, tp
                  fadd.s       fa4, fs8, fa0
                  fdiv.s       fa1, fs2, ft0, rtz
                  srai         t2, s2, 22
                  fmax.s       fs6, ft0, ft8
                  sltiu        s3, s5, -889
                  ori          a0, s11, 1815
                  fcvt.s.w     ft2, t2, rup
                  fclass.s     sp, fs1
                  divu         t1, s6, s2
                  mulhsu       s3, a4, a6
                  fmul.s       fs5, ft8, fa0, rne
                  mul          t6, a3, a7
                  add          s6, t4, t6
                  xori         a3, t2, -1733
                  xor          s1, sp, tp
                  fcvt.wu.s    a6, ft6
                  sltu         s10, s6, s3
                  mulhsu       t2, a2, s6
                  rem          tp, s6, s11
                  mulhsu       a1, a0, sp
                  slti         t2, a5, -2012
                  sra          t4, s3, zero
                  divu         a6, s0, s11
                  sub          a1, a4, a1
                  fcvt.s.w     fs3, s0, rmm
                  mulhu        a7, s4, s0
                  slt          ra, s1, s0
                  fmv.w.x      fs10, t4
                  slt          a0, a0, t6
                  rem          s7, a6, t6
                  sltiu        s1, a0, 35
                  ori          t1, t1, 643
                  auipc        s3, 707529
                  feq.s        s1, fs10, ft9
                  fcvt.w.s     t0, fa4
                  feq.s        t1, ft2, fa5
                  fadd.s       fa3, ft7, fa3, rdn
                  ori          t5, s10, -1588
                  srli         s8, s8, 17
                  rem          a5, s11, t1
                  fclass.s     a4, ft9
                  sltiu        t3, t2, 1922
                  slli         t4, sp, 9
                  auipc        sp, 64146
                  fsgnjn.s     fs0, fa1, fs0
                  nop
                  fmv.w.x      ft3, s6
                  fcvt.wu.s    a0, fs2
                  fmin.s       fs3, ft10, fs8
                  sub          a3, s4, a4
                  fsgnjx.s     ft6, fa4, ft4
                  fcvt.w.s     t0, fs10, rmm
                  fmv.x.w      a6, ft11
                  fsqrt.s      ft6, fa1, rmm
                  addi         t1, a4, -1734
                  fmv.x.w      a7, ft6
                  sub          a4, t4, a4
                  mul          a6, s10, tp
                  or           s2, s5, s1
                  feq.s        a5, ft8, ft4
                  fadd.s       fs10, fs4, fa7
                  fadd.s       ft5, fs1, fs10, rne
                  fcvt.wu.s    a1, fs10
                  fmv.w.x      ft7, a2
                  fcvt.wu.s    s7, fa5
                  ori          s10, a0, 1748
                  divu         s9, t4, t1
                  fmax.s       ft6, fa3, ft10
                  fcvt.s.wu    fa3, a1
                  srl          a5, s7, t2
                  fsub.s       fs5, fs5, ft0
                  fsqrt.s      ft2, fs4
                  or           zero, ra, t0
                  fsgnjx.s     fa2, ft8, fs11
                  fmin.s       fs4, ft10, fs3
                  add          s3, a2, s3
                  addi         s8, s8, 763
                  andi         s9, sp, 1786
                  slti         t3, a5, 484
                  srli         s7, a2, 2
                  fsub.s       fs1, fs7, ft7
                  fsub.s       ft3, fs11, ft7
                  fsgnjx.s     fa4, fa6, fa0
                  or           ra, a5, s8
                  slli         a4, t6, 9
                  fsub.s       fs6, fs10, fs1, rtz
                  fadd.s       fs10, fs8, ft5
                  fsgnjn.s     ft9, fs7, fs7
                  mul          s1, a1, ra
                  and          s9, s5, a5
                  xor          s6, a2, a3
                  fle.s        a0, fs8, fa0
                  srli         a7, t6, 25
                  divu         s1, s6, t3
                  slli         s8, a3, 20
                  rem          a2, t1, ra
                  mul          s1, s2, sp
                  fmv.w.x      fs3, s1
                  sll          s7, s5, t4
                  fmax.s       fs1, ft3, ft0
                  addi         s7, a6, 1841
                  and          a5, a5, s2
                  ori          s2, s6, -1838
                  mulh         zero, a3, ra
                  slti         ra, a3, -1432
                  lui          a5, 469427
                  mulh         s10, s1, a3
                  slt          tp, s8, a1
                  fsqrt.s      ft4, fa4, rtz
                  mulhu        t0, gp, s8
                  sra          a3, a1, s10
                  fsub.s       ft2, fs1, fs0
                  srl          s7, gp, a5
                  fadd.s       fs9, ft4, fa0
                  slli         s3, t0, 25
                  sra          s2, s8, s9
                  fsqrt.s      fs4, fs11
                  mulhu        a5, a2, s6
                  fmax.s       ft0, ft7, fa7
                  add          t1, a6, s4
                  fadd.s       ft0, ft8, fa0, rdn
                  fsgnj.s      ft5, ft6, fa1
                  fcvt.s.w     fs6, a1, rtz
                  srai         s2, sp, 31
                  fsgnj.s      fs2, fa7, fs2
                  fadd.s       ft2, ft0, fs11, rmm
                  fmax.s       fs3, ft1, fs5
                  fsqrt.s      fs2, ft7, rne
                  or           s8, zero, tp
                  sll          sp, a6, t0
                  srl          t1, sp, s3
                  sra          t6, t4, s1
                  nop
                  srli         t5, a1, 21
                  xori         s2, s6, -1913
                  mulh         s3, a0, sp
                  fsqrt.s      ft10, fs7, rmm
                  fle.s        t3, fa7, fs10
                  fsgnj.s      ft9, fs9, ft7
                  sltu         s7, zero, zero
                  fsgnj.s      fs1, fa6, fs2
                  fmv.w.x      fa6, tp
                  fmin.s       fs7, ft4, ft10
                  and          s3, t5, t2
                  fcvt.s.wu    ft0, s3
                  lui          a7, 716469
                  fadd.s       fs10, fa4, fs0, rtz
                  add          s3, s0, s1
                  srl          a1, s9, a7
                  fadd.s       fa4, ft7, ft10
                  slli         a3, s2, 13
                  sltu         t1, s3, s1
                  fsgnj.s      ft7, fs8, fs7
                  ori          t1, t5, -272
                  xor          t5, a7, s8
                  sub          s1, s2, sp
                  slt          a2, tp, s3
                  or           a6, a0, s5
                  divu         t3, t3, s10
                  fcvt.s.wu    fa7, t1, rne
                  or           a3, s4, t1
                  fsub.s       fa1, fa6, fa6
                  fmv.w.x      fs3, a5
                  fcvt.w.s     a4, fs9, rup
                  slti         ra, s4, 167
                  fsqrt.s      ft5, fa6, rtz
                  mul          s10, s1, s6
                  xor          zero, a0, a7
                  nop
                  rem          a0, s2, a4
                  or           a3, t0, t3
                  fcvt.s.w     fa2, a7
                  slt          s7, t5, a3
                  fmin.s       fs11, ft1, fa4
                  fmax.s       fa2, fs6, ft6
                  fsub.s       fs6, fs4, ft2, rup
                  fmv.w.x      fa7, a0
                  and          gp, s11, s8
                  sra          a0, a5, ra
                  mulhu        s7, s4, gp
                  fcvt.s.w     ft3, a6, rup
                  srl          t5, s5, s11
                  div          s3, s2, gp
                  remu         s9, t6, t5
                  rem          s7, a1, s5
                  srl          s7, s10, a3
                  fsqrt.s      ft9, ft7
                  ori          t2, s7, 1043
                  divu         zero, t0, s8
                  fcvt.s.wu    ft7, a6, rne
                  fmax.s       fs11, fs10, fs7
                  fcvt.s.wu    fs5, s5
                  slli         t1, s0, 26
                  sltiu        s2, zero, 393
                  div          t5, s6, t4
                  fcvt.s.w     fs8, s8
                  sltu         s9, s2, s1
                  div          t2, t1, t0
                  fcvt.s.wu    fa5, zero
                  fsgnjx.s     fs9, ft6, ft6
                  sra          s1, s11, a5
                  srai         t3, s4, 1
                  fmax.s       fs9, fs1, fs9
                  andi         s8, s2, -1204
                  ori          a2, gp, -485
                  add          t3, s11, tp
                  add          sp, gp, t3
                  srl          s2, t3, s2
                  slli         s3, s3, 8
                  fdiv.s       ft0, ft1, fs0
                  andi         zero, t1, 1857
                  div          zero, a7, ra
                  addi         a6, a6, -1791
                  slti         a1, a7, 1641
                  mul          a2, t4, s3
                  add          ra, t6, zero
                  fclass.s     s6, fa1
                  slti         s2, t6, -1694
                  lui          tp, 752628
                  fcvt.s.wu    ft5, s7, rup
                  flt.s        t4, ft0, fs2
                  lui          zero, 954928
                  fsub.s       fs10, fa4, fs1, rdn
                  add          a3, t4, s8
                  rem          s7, s10, s5
                  nop
                  or           s6, zero, a2
                  slli         t1, t0, 22
                  lui          a7, 631257
                  ori          s3, t2, 514
                  fadd.s       fs3, fs1, fa2
                  div          gp, s5, a7
                  fsgnjx.s     ft3, fs10, fs8
                  fsub.s       ft0, fa0, ft3
                  fclass.s     s10, ft3
                  mulh         t4, sp, t4
                  fsgnjx.s     ft11, fa7, ft10
                  andi         t3, a2, -351
                  lui          a4, 488166
                  nop
                  andi         t5, s2, -1348
                  sltu         t2, s8, s8
                  sub          ra, s9, s11
                  add          s6, s1, a3
                  slt          t6, s3, a7
                  fsgnjn.s     ft3, fs3, fs8
                  srai         t5, a0, 8
                  srai         s3, zero, 18
                  mul          a4, a2, t1
                  or           a6, gp, ra
                  fsgnjx.s     ft1, fa4, ft2
                  fle.s        a1, ft8, fa5
                  fcvt.wu.s    a4, fs11
                  or           a7, s2, t2
                  srai         t5, a4, 28
                  srli         zero, s10, 20
                  fcvt.wu.s    t0, ft11, rne
                  auipc        tp, 798043
                  fcvt.s.w     fs5, s10, rmm
                  flt.s        a7, ft2, ft4
                  lui          s2, 156311
                  feq.s        tp, fs8, ft5
                  fadd.s       fs7, fs3, fs4
                  ori          s4, a7, -1444
                  addi         a5, t3, 1153
                  ori          gp, t5, -1365
                  fcvt.wu.s    zero, fa3
                  fadd.s       ft11, ft2, fa5
                  fsqrt.s      fs6, fa4
                  fdiv.s       fa3, ft11, ft3
                  srl          a4, ra, t0
                  mul          s1, gp, s9
                  fadd.s       ft4, fa6, ft3, rup
                  fcvt.s.w     fs1, sp
                  addi         t6, s10, -794
                  sll          a6, s4, a6
                  fadd.s       fa3, ft9, ft11, rtz
                  divu         t6, t5, tp
                  rem          a5, t3, s3
                  lui          a3, 477727
                  flt.s        s9, ft4, ft7
                  slt          t1, a2, s3
                  fmv.x.w      gp, fs11
                  fsgnjx.s     ft0, fs7, fs5
                  fcvt.w.s     t6, fs0, rtz
                  fsgnj.s      fs9, ft4, ft11
                  slli         ra, gp, 23
                  fsgnjx.s     fs11, ft0, fs0
                  fcvt.wu.s    a6, ft9, rdn
                  fmax.s       fa5, ft0, fs9
                  fdiv.s       fs6, ft4, fs7, rne
                  fcvt.s.w     fa2, tp, rup
                  fle.s        t0, ft8, fa5
                  lui          s7, 928777
                  andi         a4, s1, -1296
                  sltu         s6, t6, s11
                  fle.s        gp, ft7, ft7
                  fadd.s       ft8, ft5, fs3
                  fcvt.wu.s    s6, fa7, rmm
                  fadd.s       fa5, ft11, fs4
                  ori          s1, sp, 1167
                  fclass.s     t2, ft3
                  mulhsu       a7, a4, t3
                  fclass.s     a5, ft11
                  sub          a7, s2, t2
                  sub          a3, a5, tp
                  fdiv.s       fs2, ft0, fs9
                  fmv.w.x      ft5, a2
                  fsqrt.s      fs5, fa1, rdn
                  feq.s        tp, fa3, ft2
                  ori          t2, s11, -395
                  ori          t0, t4, 619
                  fle.s        s10, fs4, fs7
                  xori         t4, tp, -363
                  sll          s4, zero, t5
                  slti         t3, t5, -626
                  lui          t1, 140447
                  fmv.w.x      ft1, t0
                  slti         a3, s2, 1785
                  slt          a3, t3, s9
                  or           a0, a2, s9
                  addi         zero, s9, 1174
                  sltiu        a3, a4, -2019
                  auipc        s2, 255649
                  add          s7, t4, t3
                  xori         sp, t1, -1620
                  slt          t6, s8, a5
                  fmul.s       ft11, fs2, fs8
                  fmax.s       ft7, ft3, ft7
                  flt.s        a4, fa7, fa6
                  andi         sp, gp, 1774
                  divu         t1, a7, zero
                  fsgnjx.s     ft8, fs3, fs4
                  fsqrt.s      ft2, fa3, rdn
                  fsgnjx.s     fa4, ft11, fs9
                  add          t0, s6, tp
                  lui          s9, 563778
                  xori         a7, tp, 855
                  remu         t3, s1, t0
                  ori          a2, s0, -794
                  divu         s4, a5, s1
                  fmul.s       ft8, fs9, fs3, rne
                  sll          a5, a7, s11
                  slt          t5, s7, zero
                  divu         a0, t5, s1
                  xori         gp, s11, -1512
                  sltu         t3, s3, s8
                  remu         t5, s2, a5
                  sltu         gp, a7, s1
                  divu         t6, s10, a3
                  slli         s7, a1, 15
                  sra          a2, sp, a7
                  fmv.x.w      gp, fs3
                  mul          s2, s8, t3
                  fmax.s       fs1, ft7, ft7
                  sra          t5, s1, zero
                  mulhsu       a6, a5, s7
                  sltiu        s4, a6, -64
                  slti         sp, a0, -481
                  slti         a5, a5, 1230
                  sltiu        s9, a7, 1985
                  fcvt.wu.s    a2, ft7
                  ori          t6, s3, 1550
                  fsub.s       ft11, fs1, fa4, rmm
                  sltu         t1, zero, t2
                  fcvt.wu.s    tp, fa5, rdn
                  addi         t4, s6, 1455
                  fmin.s       fs5, fs4, ft5
                  fadd.s       fs10, ft5, fs11
                  sub          zero, s8, s2
                  nop
                  fadd.s       fa6, fs4, ft6
                  fsqrt.s      ft8, ft7
                  auipc        s9, 460587
                  andi         gp, s5, 531
                  rem          a6, a5, zero
                  fsgnjx.s     fa3, ft4, fa4
                  ori          t4, t5, -195
                  fsgnj.s      ft3, ft2, fs1
                  addi         a7, s11, -675
                  xori         s2, t3, 1927
                  fsgnjn.s     fa4, fa4, ft1
                  nop
                  andi         ra, a7, 311
                  fclass.s     a5, fs9
                  fmul.s       fs9, ft9, fs4, rtz
                  remu         t2, s9, t0
                  fmv.x.w      s3, ft10
                  fmax.s       fa0, ft8, fs10
                  fmin.s       fs0, fs9, ft6
                  remu         t5, t0, gp
                  fcvt.s.w     fs7, sp, rup
                  fclass.s     tp, ft7
                  fmv.w.x      fs7, t3
                  auipc        s1, 196350
                  rem          s4, s11, zero
                  flt.s        s6, fa0, fs2
                  rem          s1, gp, a1
                  fmax.s       fs1, ft11, ft10
                  fcvt.s.w     fs2, a6, rmm
                  or           t5, a5, t5
                  sra          s7, a7, a2
                  fmv.x.w      s4, fs0
                  fsub.s       ft1, fs1, fs6, rdn
                  fmax.s       ft4, fa0, fs8
                  fadd.s       fa1, ft10, fa2
                  remu         s7, t4, a2
                  fcvt.s.wu    fa5, tp, rne
                  sltu         a3, t6, s6
                  lui          sp, 261533
                  sll          a2, t0, s8
                  sub          s3, t4, a4
                  sub          t6, t6, s4
                  srl          t4, a7, a7
                  sub          tp, s7, gp
                  div          ra, t0, a5
                  addi         s3, s0, -1408
                  fmin.s       fs5, ft3, ft7
                  auipc        s1, 518962
                  nop
                  flt.s        a2, fs1, ft11
                  slt          t2, a2, ra
                  fmax.s       fs10, ft1, ft6
                  remu         a4, s6, s6
                  sltu         s3, t1, a2
                  fcvt.w.s     a2, ft6
                  srl          ra, tp, s0
                  and          t5, ra, s11
                  sltiu        a2, a6, -1629
                  mulhu        t1, a6, t2
                  fmax.s       ft6, fa0, fs5
                  fmul.s       ft3, fs1, fa6, rup
                  feq.s        a3, ft0, fs8
                  fsqrt.s      ft9, fs1, rne
                  fmin.s       ft10, fs7, fs3
                  nop
                  fsgnj.s      fs5, fs3, fs7
                  fcvt.wu.s    sp, fs6, rmm
                  fle.s        t6, ft10, fs1
                  rem          s8, s8, s8
                  sltu         t0, t3, s7
                  fcvt.wu.s    t4, ft4, rne
                  div          s7, tp, a6
                  fsgnjn.s     ft2, fs5, ft3
                  fcvt.wu.s    s3, ft7, rdn
                  add          s1, a0, s1
                  fmul.s       ft8, ft2, ft9
                  fmul.s       fs1, fs11, ft6
                  xor          s9, zero, a3
                  or           a6, a4, a2
                  fsub.s       fs10, ft9, fa1
                  andi         t5, s0, -1531
                  and          ra, s4, a0
                  lui          t0, 753589
                  nop
                  slli         s4, t5, 12
                  fsgnjx.s     ft1, fs6, fs4
                  mulhu        a4, s6, t3
                  fmax.s       fs3, fs3, ft5
                  nop
                  fmul.s       fs9, ft4, ft11, rne
                  remu         s6, s8, s1
                  srli         t1, t4, 22
                  fclass.s     a7, fs11
                  fsgnjn.s     ft7, fs5, fa7
                  fsqrt.s      ft3, ft3, rmm
                  fle.s        s1, ft5, fs9
                  fle.s        t4, fa3, fs11
                  or           sp, a3, a1
                  fclass.s     zero, ft0
                  addi         t6, t4, -317
                  fcvt.w.s     t4, fs2, rmm
                  fmv.x.w      t3, ft10
                  srai         s1, gp, 15
                  mulh         a4, gp, s0
                  mul          gp, t2, s7
                  fsqrt.s      ft4, ft4
                  mulh         gp, a4, s4
                  mulhu        a7, s2, s5
                  xor          a1, a1, s6
                  add          a7, t0, a1
                  slt          a7, a7, a3
                  addi         a1, ra, 1120
                  add          t1, tp, a2
                  srai         sp, sp, 23
                  fcvt.w.s     gp, fa5
                  remu         t5, zero, s1
                  addi         t5, a2, -1496
                  fsgnj.s      ft7, ft10, ft4
                  fcvt.s.wu    ft7, t0
                  fmax.s       fa1, fs5, ft9
                  fclass.s     t0, ft6
                  auipc        s2, 153228
                  andi         a0, s7, 1790
                  sltu         s2, s11, a1
                  rem          a6, s5, t0
                  srl          s1, s2, a5
                  fsqrt.s      fs4, fa3
                  fmv.x.w      t4, ft6
                  fadd.s       fs8, fs9, ft4, rne
                  fsgnj.s      ft2, fa5, fs8
                  fmv.w.x      fs9, s5
                  ori          s3, s11, 994
                  add          s9, t1, s9
                  fsgnjn.s     ft1, ft1, fs1
                  fsgnjx.s     fa7, fs7, fs2
                  mulhu        t4, s10, zero
                  fsub.s       fa7, fs0, fs2
                  slt          s3, a0, a5
                  sltiu        ra, gp, -1902
                  fsgnj.s      ft6, fa2, fs7
                  feq.s        s6, fs11, fa4
                  fsgnjx.s     fs3, ft5, fs1
                  xori         a2, s1, 807
                  fcvt.s.wu    fs10, s11
                  fsub.s       fs11, ft1, fs4
                  feq.s        a2, ft6, fa0
                  xori         s8, s2, -737
                  add          s10, tp, tp
                  sub          t5, t4, a1
                  fcvt.w.s     t5, fa5
                  feq.s        gp, ft1, fs11
                  fle.s        s6, fs6, fs6
                  sll          gp, s9, a2
                  mul          s10, t4, t1
                  fdiv.s       fs1, ft10, fs3, rne
                  fmv.w.x      fa5, s8
                  and          a3, zero, s0
                  fcvt.s.w     ft7, s6, rtz
                  fsgnjx.s     fs9, fs8, fa0
                  srai         s9, s8, 1
                  remu         t5, ra, zero
                  fsgnj.s      ft5, ft6, fa5
                  slt          a4, ra, s2
                  andi         zero, s0, -1675
                  rem          sp, zero, a4
                  fsgnj.s      ft4, ft11, fs11
                  sra          s3, s1, a6
                  mulhu        t5, s0, s4
                  fcvt.wu.s    s6, ft4, rmm
                  fdiv.s       ft11, fa1, fa0
                  fsgnjn.s     fa5, fs7, ft9
                  fsgnjx.s     fs9, fs6, fs7
                  fsgnjx.s     fa4, fa1, fs3
                  fsub.s       ft11, fa0, ft4
                  flt.s        t2, ft1, fa4
                  addi         t6, s5, -1084
                  fsub.s       ft10, ft5, fs7
                  auipc        a4, 774096
                  fcvt.wu.s    s9, fs10, rdn
                  sub          s4, s10, s10
                  feq.s        s1, ft9, fs10
                  fsgnjx.s     ft0, ft10, fs3
                  sub          a2, a5, a5
                  sltiu        a2, a4, -1598
                  divu         zero, a0, s4
                  mulhsu       a6, a5, a7
                  xori         s2, a4, -162
                  mulh         sp, ra, a3
                  fcvt.s.wu    ft5, t2, rne
                  fmax.s       fa3, ft6, ft11
                  sra          a7, s1, t0
                  addi         ra, t4, 1607
                  div          a4, s9, a1
                  feq.s        t5, ft10, ft10
                  remu         s8, s2, a4
                  mulhu        t4, a3, s11
                  mulhu        a2, t5, t6
                  fle.s        a0, fa0, ft7
                  or           a5, a4, t0
                  remu         a6, t1, ra
                  add          a5, s5, s6
                  srli         a1, sp, 26
                  add          s8, gp, s3
                  sltiu        s1, s2, 1882
                  div          a3, s9, s0
                  rem          t3, s9, s6
                  fmax.s       fa5, fa4, fa2
                  mulh         s7, s7, s10
                  addi         a5, t1, -1364
                  fmin.s       ft9, ft2, ft4
                  sub          s2, s2, s0
                  srai         gp, t3, 20
                  fcvt.wu.s    s3, fs7, rup
                  xor          s2, s1, s8
                  slli         a0, s8, 10
                  addi         t4, s6, -1712
                  sub          s3, tp, s3
                  fle.s        s2, fs1, ft3
                  and          t1, s11, s2
                  fsqrt.s      ft1, fa4, rdn
                  sub          a5, s7, s8
                  lui          s1, 21068
                  sltiu        tp, s9, -686
                  fsub.s       ft4, fa6, fs9
                  auipc        t4, 589127
                  nop
                  fcvt.s.wu    ft2, a1, rmm
                  fclass.s     gp, fs6
                  fmul.s       fa3, fs11, fa0, rup
                  fsgnj.s      fa6, ft0, fa3
                  fsgnj.s      fs5, ft8, fs0
                  xor          a6, s10, t5
                  remu         t6, sp, s6
                  mulhsu       t0, s0, s10
                  addi         a7, t5, -976
                  srai         s4, s9, 24
                  andi         a3, s7, -2004
                  sll          s7, s6, a1
                  fmul.s       ft8, fs2, ft5
                  fcvt.w.s     s8, fs4
                  fcvt.s.wu    ft9, a3
                  mulhu        s8, s10, s6
                  mulhsu       t3, a0, s7
                  fclass.s     a3, ft11
                  fcvt.s.wu    ft2, t6
                  fcvt.s.w     fs6, s4
                  fcvt.s.wu    fs7, t3
                  mul          s2, s3, a1
                  auipc        t6, 803910
                  xori         s3, t3, -1374
                  xori         t2, t4, -1115
                  fdiv.s       fs3, fs8, fa2, rmm
                  fmin.s       fs0, fs4, ft4
                  fmv.w.x      ft11, s0
                  ori          a7, t2, -1783
                  ori          s3, a0, 1985
                  fcvt.s.w     fa0, t3
                  xor          s9, t4, s7
                  or           sp, s0, s6
                  mulh         s1, a0, t3
                  slti         s9, s5, -1866
                  mulhu        a4, s4, s11
                  fsgnj.s      ft11, fs5, fa4
                  slti         sp, t0, 1067
                  sltiu        t2, s8, -879
                  fsqrt.s      fs5, fs1
                  div          t4, a1, zero
                  xor          a5, a4, s0
                  fcvt.w.s     ra, ft3, rdn
                  xor          s6, s3, s11
                  fmv.x.w      t4, fs3
                  div          gp, a2, sp
                  fdiv.s       ft11, ft1, fs10, rne
                  fsgnj.s      fa4, fs1, ft5
                  lui          s10, 929787
                  remu         a7, s9, a3
                  fsgnj.s      fs4, fs9, ft10
                  or           a4, t4, a1
                  lui          s2, 666259
                  sra          s8, s3, s5
                  remu         s9, s3, t5
                  fle.s        t0, ft9, fs4
                  auipc        a6, 1027930
                  sltu         t3, a1, t4
                  andi         s3, t0, -370
                  nop
                  rem          a4, s6, s5
                  srai         a2, s9, 5
                  fsgnj.s      fa4, ft11, fa6
                  srai         a7, s5, 5
                  fadd.s       ft3, ft0, fa4
                  srl          a1, a0, s2
                  slt          a4, s2, a2
                  ori          a1, sp, 1520
                  fmin.s       ft1, fs5, ft2
                  divu         t1, a3, a3
                  fcvt.w.s     sp, fa0
                  ori          a4, s10, 1417
                  fsgnjn.s     fa6, fs1, fa3
                  fmv.w.x      fs8, s3
                  fsgnjn.s     ft1, fs9, fs6
                  fmax.s       fa1, ft9, ft9
                  divu         t2, s0, s11
                  fcvt.s.wu    ft9, t1
                  fmin.s       fa1, ft8, fs3
                  fdiv.s       fs11, fs3, fa6
                  fmin.s       ft11, fs9, fs0
                  xor          a2, s3, s0
                  sra          s3, zero, s0
                  fcvt.s.wu    fs10, t0, rdn
                  sll          a3, s4, s4
                  andi         s2, s1, 1503
                  slli         a6, t2, 31
                  fle.s        t3, ft3, fs10
                  feq.s        s6, fa7, fa7
                  slt          s6, ra, zero
                  xor          tp, t6, s5
                  sltiu        s8, t2, -1157
                  fle.s        s6, fa5, fa4
                  mul          sp, s8, t4
                  fsgnj.s      ft6, fs3, ft1
                  srl          t1, a5, a2
                  mulh         a7, t2, a0
                  fcvt.s.w     ft5, a1
                  srli         s2, t2, 18
                  auipc        a2, 54710
                  sltiu        s3, s11, -417
                  fcvt.s.wu    fs4, s6
                  andi         s7, s8, -545
                  fmax.s       ft1, fa7, fs1
                  fadd.s       fa1, ft5, fs3
                  fcvt.s.wu    fa3, a0
                  divu         a5, a5, t2
                  fsgnj.s      fs9, fa7, ft8
                  fsgnj.s      fa0, ft10, ft2
                  auipc        a5, 847295
                  sltu         t0, a3, gp
                  mulhu        s8, s2, s2
                  fmv.w.x      fs7, a3
                  lui          s3, 477560
                  fmin.s       ft10, ft10, ft0
                  fmv.w.x      fs9, gp
                  mulhsu       zero, a6, a0
                  feq.s        t3, fs6, fa1
                  fmv.x.w      tp, ft8
                  fcvt.wu.s    s9, ft8
                  and          t3, s4, t2
                  fdiv.s       ft1, fs4, fa7, rdn
                  or           tp, t5, s5
                  fsqrt.s      fs11, ft6, rdn
                  addi         zero, s7, -1338
                  mulh         a3, s2, s3
                  lui          sp, 559665
                  xor          tp, t3, t0
                  mulhsu       a5, a2, a4
                  fdiv.s       fa5, ft0, ft3
                  slti         s9, gp, 1054
                  fdiv.s       fa3, fs8, ft4
                  fle.s        t2, fa6, ft7
                  divu         s1, s9, a2
                  mulh         t0, a6, s8
                  sll          gp, a1, s9
                  sra          a5, s6, zero
                  fsgnj.s      ft1, ft6, fs11
                  fmax.s       fa4, fs4, fs11
                  sra          s9, s1, s8
                  srli         s4, s10, 14
                  andi         s8, s6, -1830
                  rem          t5, tp, s9
                  add          t5, t5, t5
                  nop
                  andi         t3, a7, 874
                  nop
                  mul          a3, s1, t6
                  slli         s9, a5, 22
                  ori          s4, s4, 310
                  flt.s        ra, fs2, fs4
                  ori          t6, s8, 2025
                  fdiv.s       ft3, fa5, fs9
                  ori          t4, s0, -1374
                  mulhu        s10, t5, s7
                  sub          tp, zero, s9
                  mul          a7, tp, s0
                  and          s4, a0, s11
                  srl          ra, t5, s3
                  divu         s6, a2, s5
                  fsgnjx.s     ft11, ft5, ft4
                  fclass.s     sp, ft4
                  flt.s        s2, fs0, ft3
                  fsqrt.s      ft11, fa4, rmm
                  slti         sp, s0, 1781
                  sra          t2, s0, tp
                  fclass.s     t1, ft1
                  mulh         s3, t6, s10
                  fsqrt.s      fs8, fa3
                  mulhu        s3, s7, t6
                  mul          s9, a3, a0
                  mul          a1, s5, s7
                  sub          t5, a1, t4
                  divu         zero, zero, s5
                  andi         s3, sp, 1526
                  divu         gp, s0, t5
                  sltiu        gp, a2, 427
                  fmv.x.w      a7, fs10
                  sltiu        sp, t5, -330
                  remu         a0, s0, sp
                  srli         ra, s0, 3
                  mulh         a1, gp, s6
                  ori          s10, ra, -682
                  sub          s8, a0, a4
                  fcvt.s.wu    ft4, a5, rup
                  fsgnjx.s     ft5, fa5, fa1
                  fsgnjx.s     ft10, fa1, fa4
                  fmax.s       fa2, ft8, ft8
                  add          sp, s6, s1
                  flt.s        t6, fa2, fa6
                  fmv.w.x      fa6, s3
                  mul          t1, a4, s8
                  addi         tp, s1, 29
                  sltiu        tp, s0, -739
                  flt.s        ra, ft5, fs5
                  fcvt.s.wu    fs6, s4
                  fmul.s       ft11, fs6, ft0
                  fmax.s       ft2, fs3, fa6
                  sltiu        a1, s3, 1266
                  fclass.s     t2, fa6
                  sra          t3, s5, a4
                  divu         s6, a3, a2
                  slt          s9, t0, t1
                  mulhu        gp, t0, s10
                  sltu         zero, s1, zero
                  sltiu        s10, t3, -137
                  flt.s        a6, fa7, ft1
                  fsgnj.s      fs7, ft6, fs8
                  mul          tp, t4, s2
                  srl          t1, t6, a7
                  ori          a7, a1, 732
                  fmax.s       fs3, fs5, ft8
                  fcvt.wu.s    t5, fs2, rup
                  fcvt.s.wu    ft1, a2
                  div          s8, t2, s5
                  fmul.s       fs2, fa6, fs0, rup
                  mul          s2, a1, a3
                  auipc        s9, 299341
                  fclass.s     s4, fs4
                  srl          s10, s2, t5
                  mulh         t2, a7, s2
                  addi         zero, s9, 2033
                  fsqrt.s      fs11, fs5
                  divu         gp, s7, ra
                  add          tp, a1, t5
                  srli         sp, a6, 22
                  fcvt.s.wu    ft2, ra
                  sll          ra, a0, a3
                  rem          t1, t3, sp
                  mulhsu       s7, s6, a6
                  fmax.s       fa3, ft5, fs0
                  srli         s3, t5, 0
                  rem          a0, t2, a5
                  mulhu        s10, s11, t1
                  sll          s2, a4, s4
                  addi         s6, t3, -118
                  slti         gp, a0, -498
                  slt          ra, s5, ra
                  lui          t0, 770616
                  fmin.s       ft11, fs8, fs6
                  sra          a1, t0, t6
                  fsub.s       fs7, fa2, fs0
                  sra          s10, s8, t2
                  slti         s3, s8, 1239
                  xori         s6, s3, -1578
                  fmul.s       fa7, fa6, fs1
                  fcvt.s.wu    ft7, s6
                  nop
                  lui          a1, 42728
                  fsgnjn.s     ft7, fa7, ft4
                  xori         a7, s7, 167
                  slli         t6, a5, 0
                  fmv.w.x      fa5, ra
                  fsqrt.s      ft3, fs8, rne
                  slt          a3, a7, s8
                  fcvt.s.w     fa0, sp
                  nop
                  fmv.x.w      a1, fs10
                  lui          s1, 771439
                  mulh         t5, a6, a0
                  fcvt.s.wu    ft8, t1, rne
                  fcvt.s.wu    fs10, s11
                  fcvt.wu.s    a2, ft9, rne
                  fclass.s     a6, ft9
                  fsgnjx.s     ft11, ft0, fs2
                  flt.s        s3, fs8, ft5
                  nop
                  rem          s1, a6, tp
                  mul          s4, t2, a1
                  srl          t5, zero, s0
                  slt          s6, s11, ra
                  add          a5, a7, gp
                  fadd.s       ft4, ft5, ft7
                  fmv.w.x      fs1, zero
                  nop
                  srai         s9, a2, 28
                  mulhsu       a6, t1, ra
                  feq.s        t4, fa7, ft9
                  slt          s4, a6, s2
                  fcvt.s.wu    ft8, tp, rup
                  mul          s4, t4, s6
                  srai         t0, s2, 31
                  fdiv.s       fa4, ft10, ft10, rne
                  srai         a0, t3, 21
                  remu         s8, tp, a7
                  flt.s        a2, ft6, fa3
                  sub          t3, sp, s10
                  xor          s9, s7, gp
                  mulhsu       s1, t5, t1
                  xori         gp, s10, 1563
                  flt.s        s2, fs1, ft6
                  divu         gp, a7, zero
                  srl          t1, s5, s7
                  fdiv.s       fs8, fs6, ft6, rne
                  fadd.s       fs2, fs0, fa5
                  fadd.s       fa5, fs5, fs4
                  add          ra, t2, s5
                  fclass.s     t0, ft5
                  divu         a7, tp, a1
                  mulhu        a4, gp, a2
                  remu         s6, a0, sp
                  or           s8, s3, s9
                  fmin.s       ft7, ft7, ft1
                  or           t1, sp, s1
                  flt.s        a6, fa6, ft2
                  fsgnjn.s     ft2, fs6, fa3
                  andi         s8, a0, 956
                  fcvt.s.w     fa7, s2, rmm
                  rem          zero, t4, s0
                  auipc        zero, 442335
                  nop
                  fmv.x.w      ra, fa6
                  fle.s        sp, ft4, ft11
                  lui          s3, 340009
                  fcvt.s.wu    fa5, t0, rtz
                  slli         ra, s8, 30
                  div          t0, zero, s2
                  mulhu        a6, t6, zero
                  lui          zero, 1026008
                  srai         t3, s1, 3
                  xor          sp, s1, a2
                  fclass.s     a7, ft0
                  fsgnjn.s     fa2, ft11, fs7
                  addi         t2, s2, 1123
                  mulh         t2, a6, s4
                  fadd.s       fs3, fa1, fs0, rtz
                  andi         s2, s4, -1884
                  add          a6, s7, t0
                  fmax.s       ft5, fs2, fa6
                  xor          s3, t5, s4
                  fle.s        ra, ft0, fs6
                  ori          ra, t6, 1880
                  fsgnj.s      ft8, ft6, fa7
                  fsqrt.s      fa5, ft11
                  fcvt.wu.s    s10, fs6, rup
                  add          a5, s1, gp
                  fcvt.wu.s    s7, fa0
                  mulh         t0, s7, a1
                  addi         t4, s0, -1348
                  slti         sp, a2, 1304
                  fclass.s     s8, fa3
                  and          sp, t6, s0
                  ori          a4, a7, 738
                  srl          ra, s10, s7
                  addi         s9, t6, -1762
                  fcvt.wu.s    s3, ft2
                  mul          a5, ra, s9
                  and          a0, t5, s7
                  add          a3, t4, s2
                  div          t4, t3, s7
                  sub          t2, a7, s10
                  fcvt.s.w     ft1, s3, rmm
                  addi         t1, s3, -1976
                  ori          ra, t0, 1348
                  fcvt.wu.s    t0, fa7, rtz
                  flt.s        a7, ft7, fs11
                  mulhu        s7, s9, a4
                  andi         sp, sp, -1697
                  fmin.s       fa0, fa7, fa4
                  ori          t4, ra, 1631
                  srai         gp, t4, 22
                  fcvt.wu.s    s10, fs6
                  fmv.x.w      s4, fs3
                  xori         s7, s8, 1691
                  fmax.s       fs2, fs1, ft4
                  fmv.w.x      fa3, zero
                  auipc        zero, 820675
                  sltu         a7, t5, s10
                  fmv.x.w      s8, fa4
                  remu         s6, t3, t6
                  sra          t0, a5, a2
                  sub          sp, sp, t5
                  fsqrt.s      fa3, ft8, rtz
                  divu         ra, a5, s9
                  fsgnj.s      fa5, ft5, fs11
                  or           s1, t4, t5
                  ori          a7, tp, 1307
                  andi         sp, s10, -1700
                  mul          t4, ra, t6
                  fmin.s       fa6, fs6, ft4
                  sub          ra, s11, sp
                  fdiv.s       fs9, fs5, fa2, rdn
                  slti         zero, a3, -190
                  slt          s7, a1, a3
                  fmin.s       ft10, ft3, fs8
                  div          a7, s10, t4
                  remu         a0, s4, t3
                  slti         t5, t4, -1057
                  div          a1, s8, a4
                  flt.s        a6, fa4, fa2
                  slli         a0, gp, 5
                  slt          t1, s0, s0
                  slti         tp, t2, -314
                  or           zero, t1, gp
                  fmax.s       fs2, ft0, fs8
                  fdiv.s       ft4, fa3, fa3
                  mulhsu       s9, a0, a2
                  remu         a7, a0, a3
                  ori          s2, t2, 245
                  fsgnjx.s     ft2, ft0, fs3
                  and          a2, s8, tp
                  mulhsu       a3, t4, a7
                  auipc        sp, 960234
                  sltiu        t5, t5, 1254
                  rem          t2, t4, a4
                  ori          t3, a2, -503
                  fmv.w.x      fs2, s1
                  fdiv.s       fs2, fa5, fs7, rmm
                  fclass.s     s2, fa2
                  fle.s        ra, ft9, ft10
                  fmul.s       ft1, ft9, ft5, rtz
                  fclass.s     a6, fs3
                  srl          a7, tp, s4
                  mulh         a5, a5, t5
                  srai         t6, s0, 3
                  fdiv.s       fa4, fs9, ft1
                  ori          a2, t6, -245
                  fcvt.wu.s    sp, fs1
                  nop
                  nop
                  srai         a6, gp, 30
                  sltiu        a3, a5, -419
                  or           ra, s7, s4
                  srl          gp, s4, t1
                  div          t2, s4, ra
                  fsgnj.s      ft4, ft4, fs4
                  slli         s7, s5, 8
                  srai         s8, s9, 18
                  xor          zero, s8, a6
                  sltiu        s2, a1, 1955
                  mulhu        a3, a1, t4
                  flt.s        t3, ft6, ft8
                  fsgnj.s      ft3, ft2, fs1
                  slt          s1, a4, t2
                  sll          t1, s11, t4
                  fmul.s       fs1, fa5, ft8
                  sra          t5, s11, a2
                  and          s1, a7, s0
                  divu         t3, s9, s1
                  nop
                  rem          a6, s6, sp
                  lui          s6, 392140
                  fcvt.w.s     t1, fs11
                  fmin.s       ft8, fs7, ft3
                  srl          s4, s8, s11
                  ori          t0, s9, 337
                  fmul.s       ft3, ft2, fa1
                  div          s7, s1, s11
                  auipc        s3, 839612
                  srl          t4, a5, t1
                  fmax.s       ft2, fs0, fa2
                  add          t4, t1, t1
                  fsgnjx.s     ft5, ft10, fs9
                  fcvt.wu.s    a2, fs7, rmm
                  mulhu        t2, s11, s11
                  sltu         tp, gp, a3
                  sltu         s8, s1, t1
                  fdiv.s       fs11, ft6, ft1
                  mulhsu       a1, zero, a1
                  fmin.s       fs11, fs10, fs4
                  fmin.s       ft8, fa5, ft11
                  fmv.x.w      t6, ft7
                  feq.s        a5, fs10, fa6
                  fcvt.s.wu    fs2, s5
                  fcvt.w.s     t0, fs4
                  fdiv.s       ft4, fs11, fs5
                  fmv.w.x      fa0, s1
                  srai         a7, s11, 10
                  rem          s6, s3, a0
                  nop
                  mulh         s1, s8, s9
                  slli         t1, s9, 30
                  ori          t0, t3, 1611
                  fmul.s       fs2, fs10, ft6, rdn
                  fmax.s       fs1, fa1, fs4
                  or           t3, s3, s0
                  fmin.s       fa6, fs11, fs11
                  mulh         t4, s6, s3
                  mulh         tp, s6, s2
                  xor          a5, a7, s2
                  mulh         t3, t5, a6
                  auipc        a7, 283612
                  fsgnjn.s     ft11, fs9, ft2
                  rem          gp, s6, s2
                  fclass.s     t1, fa3
                  mulhsu       a2, t5, s6
                  add          t0, s9, t0
                  sltu         t6, s9, t0
                  sra          zero, s0, s11
                  andi         t2, a3, 443
                  mulh         s10, s5, s1
                  lui          s10, 39178
                  fdiv.s       fa2, fs6, ft10
                  rem          s1, t6, t0
                  sra          t4, s8, t2
                  sub          t2, a0, tp
                  srl          s7, t4, t3
                  sll          s7, s11, s2
                  xor          s7, s1, s0
                  fmin.s       fs9, fs2, ft9
                  fmul.s       ft9, fs8, ft6, rne
                  fcvt.s.w     fa5, s0
                  nop
                  sub          s6, a7, s8
                  fadd.s       fa4, fs9, ft7
                  remu         a6, t6, s0
                  feq.s        a7, fs3, fa4
                  fmv.x.w      a1, ft8
                  sltiu        t6, tp, -701
                  fcvt.s.wu    ft8, s11, rdn
                  slli         a3, gp, 15
                  divu         sp, s7, s8
                  fsub.s       fs1, fa7, fa7, rmm
                  fmul.s       fs4, fa4, fs0
                  fdiv.s       fs4, fs0, fa6
                  xor          a0, a5, a5
                  lui          a4, 274066
                  or           s8, a3, t1
                  div          a0, s0, t0
                  xor          a5, a3, t3
                  and          a4, sp, s3
                  remu         s1, t6, a7
                  nop
                  remu         s1, s10, t4
                  fsub.s       fs8, ft9, fs9
                  srl          a0, a5, sp
                  feq.s        s8, fs7, fs9
                  and          sp, s8, sp
                  mul          a4, a7, s4
                  srl          ra, s11, a0
                  slti         s4, t3, -453
                  and          t1, gp, t2
                  fcvt.s.w     ft1, tp
                  mulh         s7, t4, s1
                  divu         t4, zero, gp
                  mulh         s9, a0, s9
                  fsgnj.s      fs10, ft2, fs8
                  fclass.s     s10, ft11
                  fcvt.w.s     tp, ft9, rup
                  fsgnjn.s     fs4, ft4, fs7
                  sra          s10, a5, s5
                  fcvt.s.w     fs5, s5
                  divu         t2, sp, s8
                  fsgnj.s      ft2, fa0, fs4
                  auipc        a0, 978556
                  addi         sp, sp, -1202
                  fcvt.wu.s    a7, fa7, rmm
                  fsgnj.s      fs0, ft2, ft5
                  fcvt.s.wu    fs8, s10
                  fsub.s       fa6, fs8, fs2
                  sub          a5, t6, s11
                  xori         t4, a5, 1598
                  fcvt.wu.s    s2, fa1, rdn
                  srai         a4, tp, 23
                  xori         ra, s3, -1502
                  fsub.s       fs2, fs3, ft11
                  xor          ra, t5, s9
                  mulhu        ra, s6, s3
                  fmax.s       fa3, fs9, ft7
                  slt          s10, t3, a5
                  fmax.s       fs8, fa6, fs10
                  mulhsu       a4, sp, zero
                  fsgnjx.s     fs3, ft0, fs5
                  mulh         t0, t5, s4
                  sltu         t2, s8, a3
                  nop
                  nop
                  sll          a6, s11, t2
                  or           t5, gp, t4
                  andi         t6, s0, 546
                  fmax.s       ft1, ft6, ft9
                  sltiu        t4, t3, 1739
                  fsgnj.s      fs5, ft6, fa7
                  mulhu        s7, a4, s5
                  sltiu        gp, gp, 1436
                  xori         s7, t6, 322
                  fsgnj.s      ft6, fs7, ft1
                  mul          s4, t5, s7
                  fclass.s     s4, fs10
                  fcvt.wu.s    s8, fa7, rtz
                  auipc        a2, 318412
                  addi         gp, a4, -1592
                  remu         s10, t5, a1
                  slti         s4, t4, -101
                  rem          s3, a2, zero
                  fcvt.s.wu    fa1, a1, rup
                  fsgnjx.s     fs9, fs9, fa4
                  fmv.x.w      t3, fa7
                  mulh         s6, t2, s10
                  fsqrt.s      fs2, fs1, rdn
                  lui          t4, 363344
                  srai         gp, a3, 1
                  or           s8, s0, t5
                  andi         sp, t4, -2045
                  fcvt.s.w     fs6, s1
                  auipc        s2, 966789
                  xori         a1, sp, 844
                  fcvt.wu.s    t0, fs2
                  fmv.w.x      fs6, s2
                  fclass.s     a7, fs1
                  sll          t5, t2, sp
                  fmin.s       fs11, fs3, ft10
                  addi         a0, s5, 33
                  sub          t2, s4, s2
                  fadd.s       fs10, fs7, fs3
                  fcvt.w.s     t1, fa6
                  slli         t6, a2, 14
                  srai         sp, tp, 6
                  feq.s        s2, ft10, ft4
                  fmv.x.w      t4, fa3
                  sltu         a4, a1, s9
                  fsqrt.s      ft3, fs1, rdn
                  slli         ra, zero, 8
                  fsgnjn.s     fa4, fa3, fs1
                  mul          a6, s3, s1
                  slti         s2, tp, 1066
                  auipc        a1, 484723
                  xor          gp, s4, t1
                  mul          s6, s8, s11
                  lui          a7, 145545
                  fmin.s       fs1, fs8, fs0
                  fcvt.s.w     fa7, a1, rmm
                  mul          s8, t6, t0
                  srai         a6, t5, 30
                  fdiv.s       fs1, ft5, fa2, rne
                  sra          s1, a6, t2
                  xori         s1, t6, -962
                  srli         a0, a6, 13
                  sub          t0, tp, s10
                  fsub.s       fs5, fs8, ft0
                  fsqrt.s      ft1, fs9
                  fdiv.s       ft2, ft3, fs10
                  fdiv.s       fa7, ft1, fs2
                  fclass.s     a5, fa3
                  fclass.s     s7, fs1
                  addi         a2, s10, 345
                  fadd.s       ft11, ft4, fa2, rne
                  srli         t2, t0, 31
                  fmv.w.x      fa3, a3
                  remu         zero, s2, tp
                  fdiv.s       ft3, fs8, ft4, rne
                  divu         a1, a5, s4
                  nop
                  add          a0, a2, s2
                  fcvt.w.s     t2, ft8, rmm
                  div          t5, t4, tp
                  srli         tp, s11, 23
                  fmul.s       fs1, fa5, ft9
                  fsgnjx.s     fs9, ft0, ft4
                  fsgnjn.s     fa2, fa0, ft7
                  fsgnjn.s     ft4, ft9, fa0
                  fmin.s       fa1, ft5, fa5
                  srai         t6, t5, 13
                  feq.s        a6, fs7, fa4
                  nop
                  fmv.w.x      ft5, a7
                  fcvt.s.wu    fa6, sp
                  slli         ra, s10, 11
                  srli         t6, s10, 24
                  auipc        tp, 117018
                  mulhu        a1, a3, s10
                  remu         a1, s8, t1
                  lui          s2, 976267
                  srli         ra, t2, 19
                  fsub.s       fa0, fa6, ft0
                  fsub.s       ft8, ft5, fs0, rup
                  divu         zero, t4, t1
                  fcvt.s.w     fa3, s1, rmm
                  remu         a7, t5, t3
                  andi         gp, t4, -44
                  slt          t3, s10, a0
                  fmax.s       fs6, ft11, ft11
                  mulhu        gp, s0, s7
                  fclass.s     tp, fs3
                  fmv.x.w      a0, fs1
                  fdiv.s       ft11, fs3, fa0, rup
                  feq.s        sp, ft7, ft9
                  divu         a4, s4, t1
                  fsgnjn.s     fa3, fa5, ft8
                  flt.s        a3, fs8, fs0
                  feq.s        s4, fa5, ft1
                  mulh         a2, a5, t5
                  srai         a5, a5, 31
                  srai         a6, ra, 1
                  sll          gp, s8, ra
                  xori         t1, ra, 1700
                  fle.s        t1, ft1, ft0
                  slli         a6, a2, 22
                  addi         a4, t6, 45
                  fclass.s     t6, fa2
                  srai         s8, s2, 21
                  fclass.s     s1, ft7
                  fsgnjx.s     ft2, fs9, fs4
                  srai         s7, s10, 13
                  fmul.s       fa1, fs10, ft1
                  slti         s1, t2, -58
                  ori          s6, t0, 1342
                  add          s9, t3, gp
                  xor          a4, s5, a0
                  flt.s        t2, ft11, ft11
                  slt          a0, a2, t4
                  fmul.s       ft7, ft4, fa4, rmm
                  fclass.s     s9, ft0
                  fmax.s       fa6, fa4, ft1
                  sll          a4, s9, s6
                  fsgnj.s      fs3, ft4, ft1
                  sub          zero, t2, a5
                  fsgnjx.s     ft9, ft6, ft10
                  sra          t5, a6, s0
                  feq.s        s8, fs10, ft11
                  fdiv.s       fs0, fs7, ft8, rne
                  ori          t4, s5, 463
                  rem          a0, gp, s8
                  fadd.s       fs10, ft1, fs8, rne
                  andi         s9, s1, 1148
                  sub          a3, a4, zero
                  srli         s10, a2, 30
                  rem          zero, s2, a4
                  fcvt.wu.s    s2, fs9, rup
                  slti         zero, s8, -1908
                  fcvt.s.w     ft11, t4
                  fcvt.s.wu    fa1, s4, rdn
                  sub          s2, s1, t4
                  divu         a1, s7, a7
                  fdiv.s       ft1, fa5, ft6, rup
                  fsqrt.s      ft2, fs6, rup
                  fsgnj.s      fs10, ft3, fa5
                  mulhu        t5, t5, sp
                  fmv.w.x      fa4, gp
                  feq.s        t0, fa6, ft9
                  and          a7, s1, t5
                  andi         a4, s9, 1760
                  and          t4, t2, t1
                  div          s7, a6, t3
                  fsub.s       ft7, fs5, fa5
                  rem          zero, a5, t0
                  fmv.w.x      fs4, a5
                  fmin.s       fs7, ft11, fa5
                  slti         a3, zero, 414
                  fmin.s       fa0, fs8, fa6
                  rem          gp, gp, s1
                  srai         ra, t5, 10
                  fmin.s       fa2, ft7, fa0
                  ori          t1, s2, -311
                  fsgnjn.s     ft5, fs11, fs7
                  fsgnjn.s     ft8, fs8, fa2
                  fmax.s       ft4, ft2, ft6
                  mulhsu       a5, s8, s8
                  sltu         t5, t2, t2
                  slli         s6, s10, 27
                  slt          sp, s3, a4
                  rem          zero, t6, a3
                  and          s4, s4, s5
                  srai         a3, s8, 13
                  sltu         a4, t3, a0
                  fsgnjx.s     fa2, ft2, fa1
                  sltu         t6, t6, sp
                  rem          gp, s6, a4
                  sra          a6, t1, t4
                  fcvt.wu.s    s4, fs8, rmm
                  fmax.s       ft10, fa5, fs1
                  slli         t4, s1, 18
                  slt          s6, a7, a7
                  fcvt.s.w     fs0, s6, rup
                  add          t6, a0, t5
                  andi         t6, a3, 1585
                  or           s8, s1, t0
                  fcvt.s.w     ft0, s2
                  xor          a7, s6, a5
                  mulh         s2, a6, a6
                  fcvt.wu.s    t0, fa4
                  srai         a2, zero, 18
                  add          ra, s8, s10
                  fsgnjn.s     ft3, fs7, ft1
                  fmv.x.w      tp, fs4
                  fcvt.w.s     ra, ft1, rdn
                  addi         a6, a5, 1102
                  fcvt.wu.s    s4, fs6
                  fle.s        t1, fs4, ft5
                  srl          s10, sp, a0
                  fsgnjx.s     ft2, ft1, fa0
                  xor          a7, ra, s0
                  div          a4, t6, a6
                  sll          s8, s5, t3
                  divu         s7, t0, tp
                  mulhsu       a4, s2, s3
                  fcvt.wu.s    s7, fs9, rup
                  lui          s4, 683262
                  fcvt.w.s     s8, fa6
                  fsgnjn.s     ft1, ft5, ft1
                  sub          t3, a7, t1
                  xori         ra, gp, -657
                  fcvt.w.s     a6, fs6
                  sltu         a2, s0, s9
                  sltu         s6, t6, s2
                  sll          a4, ra, s4
                  fsgnjn.s     fs0, ft7, ft11
                  srli         s4, t3, 21
                  addi         s3, t6, -1343
                  remu         ra, a7, a2
                  ori          s2, a1, 1490
                  mulhu        s10, gp, t4
                  sll          s10, t2, s3
                  sub          t4, s2, s0
                  srl          a7, t4, a7
                  fmul.s       ft10, ft10, ft4
                  fmv.w.x      ft5, s4
                  auipc        t2, 114679
                  feq.s        t2, fa4, fa7
                  sltu         t5, s0, a7
                  flt.s        s3, fs1, fs9
                  xor          s2, s3, s2
                  fmul.s       fs3, fa6, fs3
                  xor          sp, tp, a1
                  fsgnjn.s     fa6, ft2, fs1
                  fsgnj.s      fs5, ft0, fa5
                  rem          t6, s11, t1
                  srai         t0, s4, 24
                  xori         s6, s3, -1619
                  fmv.w.x      fs11, gp
                  srai         t1, a7, 31
                  fmv.x.w      a2, fa4
                  nop
                  mulhu        a4, sp, t4
                  fmin.s       ft10, fa3, fs6
                  sub          s1, s7, t6
                  divu         s7, s4, a2
                  slli         s10, t2, 11
                  feq.s        t2, fs6, fs8
                  xori         a1, a6, 378
                  slt          a1, zero, s8
                  add          t4, t0, gp
                  mulhu        zero, a0, s8
                  flt.s        s7, ft7, fs1
                  sltu         s1, a2, sp
                  mulh         s8, a5, s3
                  rem          t6, t0, a2
                  srl          a5, a7, t2
                  xor          a2, s3, zero
                  sltiu        t6, t6, -248
                  remu         sp, s0, a0
                  and          s7, s8, gp
                  fcvt.wu.s    t6, fa4
                  sltiu        zero, s6, 1662
                  fmv.w.x      fs6, tp
                  xor          s6, s0, t3
                  xor          a6, t0, s7
                  mulhsu       s8, t0, a7
                  fsgnjx.s     fa7, fs4, fs5
                  xori         t0, t2, -853
                  xor          s7, s5, s6
                  sltiu        s7, a0, -1588
                  add          s6, t3, s7
                  fclass.s     t5, fa0
                  sll          a3, a1, s10
                  fsub.s       fa6, fs11, fs10
                  fcvt.s.wu    ft8, a0, rup
                  mul          a5, s7, t3
                  fmv.x.w      s3, ft7
                  fsub.s       fs0, ft5, ft9, rmm
                  mulh         a4, s2, a1
                  add          ra, zero, sp
                  xori         a0, a6, -1494
                  fle.s        s2, fs1, ft1
                  mulh         t0, a6, s2
                  srli         t5, ra, 28
                  fle.s        gp, ft8, ft10
                  slti         s2, s6, -430
                  addi         a0, s11, -742
                  fsgnjn.s     fs6, ft6, ft0
                  fsgnjx.s     ft4, ft11, fa1
                  fcvt.wu.s    t2, fa0, rmm
                  mulhsu       t3, a5, s2
                  mul          gp, s11, a4
                  remu         s3, s5, s8
                  fmax.s       fa1, ft4, ft3
                  lui          a7, 72860
                  sll          t1, a7, a1
                  fsgnjx.s     fa3, fa7, ft4
                  div          s9, t3, s7
                  sltu         s8, a7, ra
                  srli         a7, s5, 14
                  sltu         s2, gp, t0
                  srai         t1, s11, 13
                  fdiv.s       fs3, fs6, ft5, rne
                  fcvt.s.wu    fs3, a2, rup
                  fsgnj.s      fs9, fa7, ft9
                  flt.s        t2, ft3, ft2
                  slli         tp, t3, 10
                  or           gp, a2, s11
                  fcvt.s.w     fs7, s3
                  rem          a0, s2, s5
                  auipc        a7, 209416
                  or           a6, a0, tp
                  sub          s2, a4, s8
                  fsgnjx.s     ft5, ft8, fs10
                  mul          s4, a7, s7
                  sub          t1, s0, t0
                  fcvt.wu.s    t4, fs8
                  fmv.w.x      ft6, t0
                  divu         t2, s10, s6
                  fcvt.w.s     s1, fs7
                  fcvt.s.w     fs10, s3
                  auipc        s4, 815186
                  add          s10, t5, a7
                  fclass.s     a5, fs8
                  fmul.s       fs7, fs6, fs6, rmm
                  mulhu        a2, a5, t2
                  slti         s4, a1, 1190
                  sll          s8, s11, gp
                  sra          s9, t1, s4
                  mul          t0, zero, t2
                  fadd.s       ft6, fa1, fs3, rmm
                  fsgnj.s      fs9, fs9, fs2
                  sub          s7, zero, s0
                  rem          a4, a3, a4
                  flt.s        t0, fa5, fs9
                  fle.s        a7, ft3, ft5
                  sub          gp, s8, s0
                  fcvt.wu.s    s10, fs4, rne
                  fclass.s     a0, fs5
                  addi         s10, s1, -72
                  sll          a5, t1, ra
                  sll          ra, s11, s1
                  or           tp, a4, s0
                  fmax.s       fs9, ft3, fs7
                  srl          t1, s3, a0
                  fsgnjn.s     fs8, ft11, fs11
                  fmin.s       ft6, ft4, fs6
                  fadd.s       ft7, fs11, fs7
                  fcvt.wu.s    t3, ft6, rtz
                  flt.s        s9, fs3, fs4
                  auipc        s1, 1048122
                  addi         sp, ra, 1544
                  xor          a1, t6, a2
                  fcvt.w.s     a6, fa0
                  fadd.s       fs11, fs9, fs7, rdn
                  fcvt.w.s     gp, ft8, rmm
                  sltu         tp, zero, zero
                  fdiv.s       fs4, fs11, ft5
                  feq.s        t1, ft2, ft10
                  fmax.s       fs10, ft4, fs2
                  xori         t6, a6, 552
                  addi         s2, zero, -1528
                  divu         a3, s4, ra
                  fmv.w.x      fs4, t1
                  fclass.s     zero, fs11
                  divu         a4, tp, a7
                  fsub.s       fa3, fs2, ft4
                  fmin.s       fs10, ft2, fa1
                  fle.s        t4, fa6, ft0
                  fsqrt.s      fa7, fs2
                  fmul.s       fs0, ft5, fa3
                  slt          gp, s6, sp
                  rem          t6, sp, a7
                  fsub.s       fa0, ft3, ft2, rne
                  fsub.s       ft3, ft3, fs9, rtz
                  or           s1, zero, a7
                  slli         t4, a7, 14
                  fcvt.w.s     a3, ft11
                  xor          a3, t4, s5
                  sll          a1, s0, s7
                  fsgnjn.s     ft5, ft6, fa5
                  fsqrt.s      fa6, fa1, rup
                  andi         s7, zero, 387
                  srl          s8, s10, t5
                  sll          s4, s5, s11
                  fsgnjn.s     fs10, fs5, fs8
                  fcvt.s.w     fs1, a1, rup
                  addi         sp, s11, 1327
                  slt          a7, gp, s4
                  fadd.s       ft0, fs6, fa5, rtz
                  and          tp, s5, a7
                  ori          s7, s11, -1079
                  remu         s2, a1, sp
                  rem          zero, a5, a3
                  lui          gp, 141409
                  fcvt.w.s     t2, fs6, rtz
                  fcvt.w.s     zero, fs9, rne
                  slti         a0, a3, 1228
                  lui          zero, 695141
                  fmin.s       fs1, fs2, ft10
                  fcvt.s.w     fa4, s1
                  fmv.w.x      fa7, a0
                  flt.s        s8, fs1, ft8
                  fsgnjn.s     fs1, fs0, fs10
                  flt.s        a3, ft10, ft8
                  divu         s2, s9, t6
                  xor          a1, s9, a0
                  fle.s        t3, fs9, ft10
                  remu         s1, s0, a1
                  fsub.s       fs6, fs11, ft7, rup
                  fmax.s       fs5, ft11, fs0
                  fcvt.s.wu    fa3, a5
                  srai         s6, t0, 23
                  flt.s        tp, ft0, fs5
                  fsgnjx.s     fs3, fs3, fs5
                  or           a4, s5, ra
                  sra          ra, s5, a0
                  xor          a7, a6, t2
                  andi         zero, s9, -1
                  feq.s        s10, ft4, fa0
                  fsub.s       fa0, fa6, fa4, rup
                  divu         a2, a0, s2
                  fsqrt.s      ft8, fa1, rne
                  srli         a7, s9, 20
                  sra          t1, s9, s5
                  feq.s        s3, fa1, fa4
                  rem          a2, tp, t0
                  mulhsu       t3, a2, s0
                  fclass.s     a3, fs0
                  xor          gp, a6, t5
                  sra          s4, t5, a5
                  sra          t6, a1, t0
                  mul          t2, a4, sp
                  fsqrt.s      fa6, fs1
                  srai         t0, ra, 24
                  fdiv.s       fs10, ft0, fs1, rdn
                  slt          gp, t4, t1
                  flt.s        t6, fs9, ft0
                  sltiu        s8, a0, -129
                  fcvt.s.w     fs8, a3
                  and          s10, s4, t1
                  fmv.x.w      t1, ft2
                  srai         s1, a0, 31
                  fcvt.s.wu    fa3, s6, rup
                  slli         t4, a1, 10
                  rem          s1, a3, s7
                  or           t4, ra, t3
                  div          s1, s4, zero
                  fcvt.s.wu    fa4, a6, rdn
                  flt.s        s8, ft7, ft9
                  div          t4, a3, s3
                  addi         s10, gp, -65
                  sltu         a3, s3, t3
                  fsgnjx.s     fa5, ft3, fs0
                  srai         a0, t0, 16
                  srl          t2, ra, s0
                  mul          s3, t2, a5
                  srai         t5, s1, 27
                  remu         s8, s8, a0
                  fsgnjn.s     ft8, ft7, fa3
                  ori          a5, t3, -1551
                  slt          ra, tp, a7
                  feq.s        t3, fs3, fs11
                  srai         s7, gp, 24
                  fcvt.s.wu    ft10, t5
                  or           s6, a3, s6
                  fcvt.w.s     sp, fs5
                  sub          gp, sp, t3
                  fmin.s       fs0, ft8, fa7
                  fadd.s       fs7, fa1, fs4, rmm
                  add          a0, gp, tp
                  fclass.s     zero, fs8
                  fsqrt.s      fa3, fs9
                  fsgnjx.s     ft9, fs11, fa2
                  fsgnjn.s     fs0, fa1, fa7
                  slti         s10, s3, -903
                  rem          a4, s11, s5
                  addi         ra, s6, 175
                  sll          a2, s1, a3
                  auipc        a6, 97784
                  fsgnjx.s     ft4, ft1, ft9
                  remu         s4, a0, a5
                  ori          a4, s10, 141
                  sll          gp, s6, a0
                  mul          a2, tp, s2
                  fclass.s     a3, fs7
                  fmv.w.x      ft2, a0
                  sltiu        s1, s9, 691
                  addi         zero, t4, -1308
                  divu         ra, tp, a2
                  addi         s1, s5, 1041
                  xor          t2, s10, s4
                  fsgnjn.s     ft10, ft4, ft10
                  and          t1, t0, a6
                  fmax.s       fa5, ft9, ft9
                  fmul.s       fa5, ft7, fa3, rtz
                  and          sp, t0, s5
                  fsqrt.s      fs4, fs4
                  feq.s        s3, fs1, fs10
                  fmin.s       fa1, fa0, fs0
                  remu         a5, t1, a3
                  nop
                  srl          t5, t4, t0
                  fmax.s       ft2, ft3, fs7
                  feq.s        a6, fa1, ft9
                  srl          a7, t1, s7
                  fcvt.s.wu    ft4, t3, rne
                  ori          t5, s0, 398
                  fsgnj.s      ft4, ft7, fa4
                  or           s2, s6, s0
                  fsqrt.s      fa2, fa4, rne
                  sub          tp, s4, s2
                  xor          tp, tp, s6
                  slti         a4, a2, -325
                  srl          t0, t2, zero
                  and          gp, a7, t1
                  feq.s        a5, ft0, ft7
                  fcvt.w.s     s10, fs8, rtz
                  xor          t3, a7, gp
                  rem          s8, a3, zero
                  sll          s3, s3, t6
                  slti         t3, a6, -791
                  div          a7, a4, a2
                  fdiv.s       fs11, fs2, fs5
                  slli         a3, s6, 11
                  fmv.x.w      a3, fs3
                  fsgnjn.s     ft8, ft10, fs8
                  fdiv.s       fs7, ft1, fa2, rup
                  ori          sp, t5, 598
                  slt          s1, s8, a5
                  slt          s8, t5, s9
                  mul          zero, ra, s10
                  fcvt.s.wu    ft3, s4
                  xori         s4, a3, 709
                  srli         s3, s11, 5
                  xor          s8, s1, a4
                  sll          t2, t3, s9
                  mulhu        s4, s4, a3
                  fsub.s       fa0, ft10, fs2, rdn
                  sub          sp, tp, s3
                  srai         sp, a3, 24
                  slli         sp, a1, 23
                  sub          t2, s0, a6
                  fmax.s       ft1, fs11, fa4
                  sltiu        s3, t1, 1539
                  fcvt.w.s     s4, ft9
                  fclass.s     a2, fs10
                  nop
                  divu         a5, s2, t6
                  sra          ra, ra, a0
                  sltu         a0, s8, t4
                  slli         s10, s9, 16
                  fcvt.s.wu    ft1, ra
                  srli         a1, t5, 6
                  andi         s7, t5, -649
                  fdiv.s       fs7, fa3, ft2, rmm
                  and          a2, t4, s4
                  fmax.s       ft2, fa3, ft11
                  xor          ra, t1, s10
                  fcvt.wu.s    s6, ft11, rtz
                  and          s6, t6, t4
                  nop
                  fmv.x.w      s6, fa7
                  fadd.s       fa3, fs0, fa5
                  lui          s3, 890704
                  fmv.x.w      a2, ft4
                  sltiu        s8, gp, 361
                  fcvt.w.s     t2, ft4
                  fsub.s       fa0, fs4, fs7, rne
                  feq.s        tp, fs3, fa0
                  div          zero, t5, s10
                  fsqrt.s      ft1, fs5, rne
                  mul          s1, a2, t6
                  fsgnjx.s     ft0, fs5, fs7
                  fcvt.w.s     t0, fs4
                  mulhu        a3, a7, t2
                  fsgnj.s      ft7, fs10, ft8
                  fclass.s     a3, ft10
                  slli         s4, t5, 9
                  sra          sp, s0, t4
                  fsqrt.s      fa4, ft6, rne
                  or           a4, t4, t2
                  sltiu        tp, t1, -125
                  lui          t2, 870449
                  fsgnjx.s     ft11, fa4, ft1
                  rem          a4, t6, zero
                  fsgnjx.s     fs6, ft11, ft3
                  slti         s8, a4, -128
                  fsgnjn.s     fs3, fs4, fs4
                  add          s1, a0, s1
                  slli         s8, t4, 10
                  fcvt.s.wu    ft2, a0
                  fcvt.wu.s    t2, fa4
                  fclass.s     t6, fs6
                  auipc        sp, 307488
                  div          s8, a7, a4
                  mulh         a3, s5, ra
                  fmul.s       fa3, ft3, fa3, rtz
                  mulhsu       s2, a2, s0
                  fle.s        s3, fa7, fs8
                  fcvt.s.wu    ft11, a3
                  mul          a7, a0, a7
                  auipc        s1, 156190
                  fmv.x.w      s4, fs6
                  divu         t6, t3, a6
                  mulhsu       t2, s0, t2
                  fmv.x.w      t5, ft8
                  fclass.s     s3, ft10
                  fsqrt.s      fa4, ft8, rmm
                  mulhu        s8, t2, t1
                  fsgnjn.s     fs7, ft5, ft2
                  fmin.s       fs7, ft11, ft1
                  sub          s10, s1, s8
                  fadd.s       fs9, fa6, fs7, rtz
                  rem          s10, a7, s7
                  mul          ra, a2, a1
                  fmul.s       fa5, fs10, fs1, rmm
                  fle.s        ra, ft4, ft0
                  feq.s        t1, fs8, ft7
                  fmv.w.x      ft10, a2
                  addi         s3, gp, -764
                  slti         t3, a5, -1759
                  rem          a6, s10, t6
                  mulhsu       a3, a5, a3
                  fmin.s       ft0, fs8, fs11
                  and          tp, s8, t0
                  sub          a3, sp, s3
                  mulhsu       s3, sp, s11
                  fsgnjx.s     ft4, fs10, fa1
                  lui          s10, 991148
                  fmin.s       fa4, fs5, fa6
                  remu         ra, a2, t2
                  addi         t3, zero, -1863
                  fsub.s       ft6, fs3, ft10
                  flt.s        a1, fs3, fs7
                  mulhu        ra, a3, zero
                  div          a1, t1, s9
                  and          t5, gp, t1
                  lui          t4, 211781
                  mulhsu       t6, a1, a3
                  feq.s        a1, ft1, fs8
                  fmax.s       fs10, fa1, fa2
                  fcvt.s.wu    fs7, s9, rdn
                  srl          t0, zero, ra
                  feq.s        s3, ft2, ft9
                  fmul.s       ft7, fa0, fs4
                  sll          zero, t2, tp
                  sll          a4, a6, s6
                  xori         s1, a4, -345
                  or           t3, t6, s7
                  sltiu        t1, t1, -991
                  and          s2, s3, t4
                  fcvt.w.s     sp, ft11, rne
                  flt.s        t2, ft11, fs7
                  and          a6, gp, gp
                  fsgnjx.s     fs1, ft7, fa1
                  mulhsu       s1, a0, s3
                  fsgnj.s      ft0, ft6, fs3
                  sra          a5, gp, s7
                  sll          s7, t6, zero
                  fsqrt.s      fa6, fa6, rup
                  flt.s        s9, fs6, fs3
                  fdiv.s       fs0, fs0, fa3, rtz
                  sra          t6, t2, a2
                  slli         s10, s2, 3
                  fmin.s       fs4, ft6, fs8
                  fclass.s     s7, fa0
                  fsgnjx.s     ft1, fa6, fa4
                  fmul.s       fa7, ft7, fa2, rne
                  fmul.s       ft1, fa1, ft8, rdn
                  mulhu        t0, t0, s4
                  sltiu        s2, t6, 990
                  mul          zero, s8, gp
                  mulhu        s10, s8, a1
                  xor          s3, a5, a0
                  fcvt.s.w     fs6, t0
                  sub          gp, gp, s3
                  rem          t2, s11, s0
                  fmul.s       fa3, fs7, ft9
                  fclass.s     a2, fa7
                  fsub.s       fs1, fa1, fs4, rtz
                  srli         s9, a7, 27
                  fcvt.s.w     ft11, s5, rup
                  slt          sp, a5, t3
                  auipc        a6, 205613
                  fsqrt.s      fs11, fs4, rup
                  addi         s10, t5, 1032
                  mulhu        s3, s8, ra
                  flt.s        s10, fs1, fs7
                  auipc        t6, 347241
                  rem          t5, t3, s6
                  mulhu        t1, s1, zero
                  fsgnjn.s     ft1, fs0, fs1
                  and          t1, t1, t4
                  mulh         a4, s4, t3
                  rem          a5, s1, a5
                  fmax.s       fa5, fs5, ft10
                  fle.s        a1, fs11, fa7
                  ori          zero, tp, -1910
                  fcvt.s.wu    fs7, s8, rne
                  fle.s        a3, ft5, fs5
                  srl          zero, s10, gp
                  fcvt.s.w     ft7, s3
                  fmv.w.x      fs9, a7
                  sra          s6, a7, a3
                  xori         t2, s0, -1569
                  remu         t3, s3, t2
                  srl          t5, sp, a6
                  divu         sp, t5, a7
                  mulh         s6, s6, a5
                  sub          a0, s4, a4
                  sltu         s9, s0, s9
                  fmv.w.x      ft9, t6
                  or           s10, t3, t4
                  divu         gp, s0, s4
                  mulh         t2, a5, t5
                  and          a1, s7, t1
                  fclass.s     s6, fa6
                  addi         s3, a7, 893
                  fcvt.w.s     t6, ft3, rdn
                  fsgnj.s      ft11, ft7, ft6
                  mul          s6, s0, a7
                  auipc        s1, 555985
                  flt.s        s9, fs10, fa5
                  mulhsu       s1, a0, s4
                  fmul.s       ft9, fa3, fa5, rdn
                  fcvt.wu.s    a1, fs10
                  andi         t6, s4, -1399
                  andi         zero, gp, 394
                  flt.s        a3, fs3, ft4
                  fcvt.wu.s    s4, fs3
                  slli         s10, s8, 26
                  sra          s1, s11, s6
                  slti         s1, s4, 1766
                  nop
                  sll          s8, s5, s6
                  remu         a5, a6, a7
                  sll          ra, a5, a3
                  and          t3, s9, t4
                  sltiu        tp, s11, 290
                  or           gp, t6, s0
                  remu         tp, s7, t5
                  remu         gp, a1, a4
                  sltu         ra, a5, s11
                  ori          s10, a2, 885
                  divu         a3, s11, t3
                  div          s2, s9, s5
                  ori          s7, a1, 1570
                  rem          tp, a2, s10
                  fsub.s       fs11, fa1, ft6
                  fcvt.wu.s    t3, fs5, rtz
                  sll          s7, s10, ra
                  feq.s        a1, fs7, fa3
                  srl          s10, a0, t1
                  add          s1, s0, s9
                  slt          a4, a5, s7
                  srli         t4, t5, 14
                  mulhsu       sp, a4, a1
                  addi         gp, t6, 1220
                  sltu         a7, s9, a2
                  ori          s8, a1, 101
                  div          ra, s11, s4
                  srai         s9, s7, 21
                  srai         t5, s10, 16
                  sltu         a0, a6, a0
                  mulhu        a0, s7, a6
                  sub          s1, t2, s1
                  slt          t6, t3, ra
                  fclass.s     a6, fs7
                  addi         a3, t5, -209
                  sltiu        zero, s9, -299
                  sltiu        s2, s1, 145
                  fcvt.s.w     ft0, t2, rmm
                  lui          a6, 766751
                  fsgnjx.s     ft0, ft4, ft8
                  fmv.w.x      fa6, a3
                  sltiu        t0, a0, -1064
                  fcvt.s.w     fs5, s11
                  rem          t5, gp, zero
                  sll          t3, t3, t5
                  or           s10, s4, s5
                  andi         sp, s7, -1525
                  sltu         s9, a1, a4
                  auipc        t2, 1046616
                  rem          a7, zero, s10
                  sra          t2, sp, s9
                  auipc        s10, 991637
                  fmv.x.w      tp, fs1
                  fcvt.w.s     a4, fs4
                  fcvt.wu.s    a0, fs4
                  fsgnj.s      fa2, fs8, ft2
                  fsgnjx.s     ft6, fs5, fa0
                  fmv.w.x      ft1, a4
                  slli         a5, t0, 14
                  fsqrt.s      fs5, fa1
                  fcvt.s.wu    fs9, t1, rmm
                  remu         s9, tp, a3
                  srl          s1, s8, s6
                  slt          t0, s7, t5
                  fmax.s       fa3, fa3, ft11
                  xor          s1, s3, t5
                  fsgnjn.s     fs4, ft2, ft11
                  auipc        a6, 744963
                  mulhu        t4, s4, a1
                  divu         s2, s0, a5
                  mulhu        s9, t6, s4
                  fsgnj.s      ft6, ft8, ft9
                  fsqrt.s      ft2, fs9
                  sra          t2, a0, s5
                  remu         zero, a5, t6
                  nop
                  slli         t3, s8, 7
                  addi         t4, s8, -1173
                  fadd.s       fs4, fa1, fs1
                  ori          tp, a7, 1308
                  fsqrt.s      fs6, fs2
                  remu         s10, s10, tp
                  sltu         a4, s7, s8
                  nop
                  fclass.s     s1, fs11
                  feq.s        t0, fs8, fs3
                  fsgnjx.s     fa3, ft1, ft0
                  fsub.s       ft6, ft1, ft0
                  sltiu        t0, a4, -787
                  srai         t4, sp, 0
                  flt.s        s6, fs6, fa4
                  srai         a2, a0, 12
                  nop
                  sltu         a0, s2, gp
                  fle.s        a0, fs3, fa4
                  or           a3, t2, a1
                  sltu         ra, s9, t5
                  and          s9, s10, s8
                  fsgnjx.s     fs7, ft10, fa4
                  andi         t1, s6, 571
                  sltiu        s8, s2, 385
                  div          t1, a1, s2
                  or           a7, s7, s7
                  fmax.s       ft6, fa3, fs3
                  sltu         t0, s4, tp
                  andi         t5, a3, -863
                  slli         a7, t3, 13
                  fclass.s     a0, ft2
                  fcvt.s.w     fa7, a3
                  slt          s3, a2, ra
                  rem          s3, t0, s2
                  sll          s1, s5, tp
                  fsub.s       fs9, ft7, fa4
                  fmin.s       fa5, ft6, fs1
                  feq.s        t6, ft7, fs3
                  srai         t0, a2, 20
                  mul          gp, s11, t4
                  divu         s1, t6, tp
                  fmin.s       ft8, fs10, ft1
                  sll          s9, t3, t1
                  fcvt.s.w     ft6, a7
                  fcvt.w.s     s9, ft3
                  fcvt.s.wu    ft1, s6
                  andi         s8, sp, -1196
                  fmv.w.x      ft4, s3
                  slli         t6, s10, 0
                  sub          s4, s7, ra
                  addi         s8, a5, 633
                  divu         a4, t1, s2
                  divu         s10, a2, gp
                  fsgnjx.s     ft8, ft8, fa7
                  fsqrt.s      ft5, fs7
                  ori          t5, s1, -1429
                  or           s7, s3, t1
                  lui          t2, 825251
                  fadd.s       fs0, ft7, ft1
                  srai         a5, s6, 2
                  fdiv.s       fa7, fa5, ft5
                  fclass.s     gp, fs7
                  fsgnjx.s     ft7, ft7, ft3
                  fcvt.s.w     fa6, s3, rtz
                  fmax.s       fa0, fs7, fa5
                  and          s7, a2, s11
                  auipc        ra, 104681
                  mul          t0, t6, s0
                  div          s2, s11, gp
                  fsqrt.s      fa6, fs11
                  ori          t2, a7, -355
                  fmul.s       ft1, ft4, fa5
                  slli         gp, a0, 28
                  fcvt.s.w     ft2, a5, rtz
                  slt          s7, s3, a1
                  fsqrt.s      fs11, fa1, rup
                  fle.s        ra, fs1, fs11
                  sltiu        t6, t3, 840
                  ori          s9, a6, -2002
                  fsgnjx.s     fs11, ft0, ft9
                  div          zero, s3, tp
                  fdiv.s       ft7, fa7, ft2
                  auipc        s3, 601342
                  xor          a1, tp, t3
                  lui          s4, 405742
                  sll          t3, sp, s3
                  fcvt.w.s     zero, ft8, rup
                  xori         t2, zero, 1703
                  mulh         tp, s1, t6
                  addi         t1, t6, -348
                  flt.s        t0, fa5, fs10
                  sra          t4, s3, a3
                  srli         s3, s1, 14
                  fdiv.s       fa0, fa4, ft4, rdn
                  div          s2, s2, a0
                  fmv.x.w      a1, fa1
                  remu         a5, t5, a0
                  srli         t1, a6, 19
                  flt.s        a2, fs11, fa4
                  fdiv.s       ft8, fa0, fs0
                  xori         t1, zero, -1778
                  fsgnjn.s     fs3, fa3, fs3
                  add          s9, a2, a3
                  or           t3, a0, t4
                  srai         a4, t4, 7
                  and          a6, s10, a0
                  feq.s        a7, ft11, fs9
                  srl          s2, a3, a3
                  sltiu        t3, s2, 1942
                  xori         a6, t0, 1107
                  nop
                  flt.s        t2, fs0, ft6
                  lui          s10, 341664
                  sra          t3, a3, s8
                  fsgnj.s      fa6, fs5, fa2
                  fcvt.s.w     fs0, s3, rtz
                  sltu         s3, t4, zero
                  srli         t2, a0, 7
                  flt.s        a1, fs4, fs8
                  fcvt.s.wu    fs7, s0
                  sltiu        t4, zero, 11
                  fmv.x.w      s6, fs9
                  slli         a2, s10, 24
                  flt.s        zero, fs6, ft4
                  xori         s1, s6, -84
                  nop
                  fmv.w.x      ft6, a3
                  ori          a1, a1, 1776
                  xor          s2, t0, a7
                  fcvt.w.s     a1, ft8
                  nop
                  slt          sp, sp, s6
                  srli         s1, s3, 13
                  sra          a7, t0, t6
                  fsgnj.s      ft8, fs8, ft7
                  fcvt.s.w     fa6, a3, rdn
                  xori         sp, s1, 962
                  fdiv.s       ft6, fa1, ft1
                  xori         t1, zero, 259
                  fmv.x.w      t3, ft7
                  or           ra, a0, s4
                  srli         ra, s10, 6
                  nop
                  sltiu        a7, s10, -1982
                  remu         s3, s5, s7
                  feq.s        gp, fs10, ft2
                  sll          a4, s3, s1
                  nop
                  ori          a3, s11, -1642
                  srl          t2, zero, s10
                  slli         a2, s0, 4
                  srl          s9, s4, s7
                  sltu         zero, tp, s7
                  sub          a0, s6, ra
                  slti         t0, a2, -937
                  div          s10, s1, t3
                  sra          s9, a4, a0
                  feq.s        s2, ft10, fa2
                  fmax.s       ft2, fa6, fa0
                  mulh         t0, s9, s4
                  add          t5, t3, a0
                  fle.s        zero, fs2, ft5
                  fmv.w.x      fs1, a3
                  lui          t2, 154
                  nop
                  srai         ra, gp, 9
                  auipc        a2, 988992
                  fcvt.wu.s    t5, fa4
                  fle.s        a0, ft11, fs1
                  fmul.s       ft4, ft11, ft3
                  feq.s        t2, ft3, ft6
                  add          t5, t3, sp
                  rem          a4, s8, s9
                  fcvt.s.w     fa2, t1
                  fsgnjx.s     fs5, ft3, ft2
                  ori          a5, a6, -1436
                  xori         t0, gp, -914
                  sub          sp, s11, s0
                  slti         a0, s1, -1608
                  fmin.s       fa2, fa1, ft10
                  fsqrt.s      ft3, fa4, rtz
                  sltiu        t3, s11, -757
                  sll          ra, t2, tp
                  or           s10, s6, s11
                  remu         s8, a0, s10
                  remu         t1, zero, t2
                  fmv.x.w      a6, fs9
                  or           s7, t5, s5
                  srli         a7, t3, 6
                  fsgnjx.s     ft10, fs0, fs2
                  fcvt.w.s     a2, ft5
                  feq.s        a3, fa2, ft5
                  nop
                  fcvt.s.wu    fa6, s9, rdn
                  slti         s8, s9, 1993
                  srli         s4, ra, 11
                  fmax.s       ft0, ft7, fs3
                  divu         t0, s10, s11
                  fmul.s       ft1, ft3, fa0, rup
                  divu         sp, a4, ra
                  fmul.s       fs1, fs10, fa7, rup
                  sub          a7, s4, a4
                  ori          s4, t5, -536
                  sltu         t0, s2, zero
                  sub          t1, t6, a1
                  divu         s8, t6, s7
                  slti         a7, s11, -1405
                  sra          s4, tp, gp
                  and          s9, a5, s4
                  andi         tp, t1, -1528
                  fcvt.wu.s    s3, fs0, rtz
                  remu         ra, s2, a0
                  rem          s7, s7, t1
                  fsub.s       ft11, fa3, fs6
                  xori         ra, a4, 433
                  fcvt.wu.s    a5, ft2
                  and          ra, zero, s11
                  slli         t3, s5, 18
                  fsgnjn.s     fs1, fs4, fa7
                  slli         s9, t0, 17
                  fadd.s       ft10, fa5, ft6, rtz
                  srl          a4, a1, a4
                  sll          s3, tp, sp
                  slti         t4, s6, -1029
                  auipc        sp, 983047
                  fadd.s       fs4, fa5, fa3, rup
                  or           a0, s3, s5
                  auipc        t1, 948578
                  mulhsu       zero, zero, a7
                  mulh         a3, sp, a1
                  fsqrt.s      fs4, fs2, rdn
                  fmin.s       ft4, ft0, ft1
                  remu         t3, s7, a6
                  fsgnjn.s     ft5, fs1, ft7
                  sltu         t4, s9, s6
                  fcvt.wu.s    s3, fa4
                  slti         a7, a1, 640
                  fcvt.s.wu    ft1, a3
                  mulhsu       a6, tp, s0
                  mulhsu       s7, s2, s6
                  fsub.s       fs9, ft6, fs7, rtz
                  fmin.s       ft9, fs4, ft5
                  mul          s3, t2, s1
                  rem          s3, t0, s5
                  flt.s        a5, fa7, ft10
                  srli         s10, a7, 16
                  fsub.s       fs7, ft5, ft2
                  fmv.x.w      s7, fs9
                  sltiu        s4, t3, -338
                  sltu         s4, zero, zero
                  fmv.w.x      ft2, a2
                  add          s6, s11, t5
                  andi         s3, a5, -162
                  fmul.s       ft9, fs0, ft7
                  fcvt.s.w     ft4, a1, rne
                  fcvt.w.s     zero, ft3
                  ori          s3, t2, -1670
                  div          s6, a5, t2
                  slt          a7, s1, s8
                  sub          a1, s4, tp
                  fmul.s       fs5, ft3, fs5
                  addi         s8, a0, 1506
                  srl          t4, t2, ra
                  mul          s10, a2, t2
                  mulhu        t6, s8, a0
                  fmax.s       fs11, ft6, fa3
                  mulhu        t6, t4, t0
                  mul          s2, s1, s10
                  fsgnjx.s     fa1, fa3, fa2
                  fsqrt.s      ft3, fs9, rtz
                  xori         s6, a6, 1967
                  mulhsu       s6, t6, t5
                  addi         t3, t6, -1376
                  srli         a0, ra, 13
                  fsqrt.s      fa0, fs11
                  fcvt.w.s     s3, fa7, rtz
                  srli         ra, s8, 2
                  fcvt.s.w     ft1, t3, rtz
                  divu         sp, s3, zero
                  fsgnj.s      ft4, fa7, fs8
                  fmin.s       fa3, fa4, fa7
                  fmax.s       ft5, ft11, ft8
                  fsgnj.s      ft9, fs3, ft7
                  ori          s4, s3, -1212
                  fsgnjx.s     fa7, fs11, fa6
                  fclass.s     s9, ft2
                  fmul.s       fa6, fs0, fs8, rmm
                  lui          a1, 257091
                  divu         t2, a6, zero
                  sra          t0, s8, tp
                  mul          a1, gp, a2
                  divu         t6, gp, s0
                  ori          tp, gp, -390
                  lui          a5, 694164
                  slti         s6, t1, 1033
                  fcvt.wu.s    t3, fa6, rtz
                  fmax.s       fa6, fs1, ft3
                  fmv.w.x      fs6, a6
                  fdiv.s       fs8, ft5, fa6, rne
                  divu         a4, s11, a5
                  srli         gp, s6, 8
                  fsgnjx.s     fs0, ft3, fa7
                  fsqrt.s      fs6, fs2, rup
                  rem          s8, s8, a3
                  sltiu        a0, a7, -239
                  fcvt.s.w     ft7, t6
                  mulh         s10, zero, s11
                  fcvt.wu.s    a0, fs6
                  rem          gp, t4, s3
                  fsqrt.s      fs1, ft7, rtz
                  fmul.s       ft10, fa4, fs6
                  andi         t1, s5, -925
                  fle.s        t2, ft0, ft3
                  mulhsu       a1, a5, s0
                  fmv.w.x      fs4, t5
                  remu         s10, a0, t2
                  mulhsu       s2, a5, t3
                  fsqrt.s      fa6, ft5, rup
                  fmv.x.w      t2, fa3
                  sra          a0, t0, s3
                  div          s8, ra, s2
                  fadd.s       fa0, ft9, fs7, rne
                  fadd.s       ft3, ft0, fs0, rtz
                  xor          zero, s6, t4
                  add          tp, s8, s0
                  andi         s6, a4, 1034
                  fmv.w.x      ft10, a7
                  slti         sp, a7, -1296
                  xori         a2, t2, 1195
                  slli         a0, zero, 22
                  auipc        tp, 891466
                  slti         t3, t0, 1591
                  mulhsu       t3, s9, s9
                  ori          s2, ra, 353
                  feq.s        a1, fs10, ft8
                  remu         tp, s4, s11
                  fmv.w.x      fa7, zero
                  slli         zero, t3, 19
                  fsqrt.s      fs3, ft10, rtz
                  fsgnjn.s     fa5, ft11, fa6
                  slli         a0, s11, 14
                  mul          t4, s0, s0
                  fmax.s       fs9, fs4, fa5
                  fcvt.s.w     ft0, s9, rne
                  add          ra, a7, a1
                  fmul.s       fs1, fs5, ft9, rmm
                  fcvt.w.s     t6, ft3
                  fcvt.s.w     fs11, a0, rne
                  xor          sp, a7, sp
                  fclass.s     sp, fa4
                  mulhsu       a5, t5, s5
                  slti         sp, t1, -1594
                  fsgnj.s      ft8, ft1, fs5
                  fsgnj.s      fa6, fs9, ft11
                  fmv.w.x      ft2, a1
                  feq.s        s3, ft5, fs8
                  or           a2, t3, s2
                  fmax.s       fs8, fa7, fs2
                  ori          t5, a7, -1624
                  mulhu        a4, s2, a3
                  div          a3, a6, s11
                  fsgnjx.s     ft7, fs0, ft9
                  fmv.x.w      a0, ft0
                  sltiu        a7, t1, -1159
                  fle.s        s2, fa6, fs4
                  or           t5, t2, s2
                  sub          t2, s8, t2
                  slti         s6, s7, 1421
                  lui          a1, 410570
                  remu         zero, t6, sp
                  feq.s        a3, fs10, fs9
                  srl          a6, t3, t1
                  xor          a6, zero, s9
                  div          s1, s6, s2
                  fadd.s       fa4, ft2, fs7, rtz
                  fle.s        a3, fs3, fa0
                  fsgnjx.s     fa2, ft3, fa3
                  mulh         s2, t5, sp
                  lui          a3, 977842
                  fsgnjx.s     ft11, fs3, fs10
                  and          a1, t5, s8
                  div          gp, s3, s5
                  feq.s        s8, ft3, ft1
                  fsgnjx.s     ft7, fa2, fs0
                  feq.s        zero, fs11, ft5
                  mulhu        t0, sp, s1
                  lui          s8, 633793
                  nop
                  div          s10, sp, ra
                  fadd.s       fa5, fa1, fs5
                  flt.s        s4, fs11, ft3
                  fsqrt.s      ft10, fs9
                  andi         s6, a1, 821
                  addi         t2, t2, 954
                  add          a7, zero, t4
                  fcvt.w.s     t6, ft8, rne
                  srl          s2, s8, s7
                  fcvt.wu.s    a7, ft7, rdn
                  and          a1, gp, s5
                  lui          a0, 776368
                  nop
                  slli         a1, a3, 4
                  flt.s        t5, ft1, fs9
                  fsgnjx.s     ft3, ft9, fs4
                  slt          t5, s4, a7
                  mulh         a1, t3, t3
                  sltiu        t6, s2, -1228
                  slli         s9, sp, 4
                  srai         t5, a7, 12
                  fmv.w.x      fa3, a0
                  mulh         s4, t2, s5
                  mulh         t1, s3, t5
                  fcvt.s.w     fa7, a4, rmm
                  fsub.s       fs7, ft3, ft0
                  remu         t1, s2, s9
                  mulhsu       s4, a0, s8
                  fmv.x.w      s3, fs0
                  sltiu        s10, t3, -1062
                  fmv.w.x      ft7, s6
                  add          a6, s11, a5
                  fclass.s     t6, fs8
                  fcvt.wu.s    ra, fa1
                  xor          sp, s8, t1
                  sltu         t6, a3, t2
                  or           a7, s10, s7
                  fcvt.wu.s    t0, fs1, rdn
                  fmv.x.w      a4, ft7
                  fmin.s       fs4, ft11, fs11
                  xori         a7, a5, 83
                  fcvt.s.wu    ft10, s1
                  fdiv.s       fs8, fs10, ft7
                  sltiu        a1, a7, -858
                  sll          a7, a7, s7
                  rem          a7, t0, s8
                  auipc        t5, 282969
                  fle.s        s7, fa6, ft7
                  fdiv.s       ft4, fa4, fa7
                  fmul.s       ft4, fs9, ft2, rmm
                  andi         sp, s9, -1203
                  fmul.s       ft6, fs6, ft0
                  lui          s2, 922627
                  div          s7, t4, gp
                  fmv.w.x      fs5, a7
                  ori          t0, gp, 144
                  fmv.x.w      a3, fs2
                  mul          s6, s10, sp
                  fsgnjn.s     fs2, fs5, ft10
                  fsub.s       fs5, ft4, ft2
                  xori         t1, a6, 1012
                  sltu         s10, s3, s8
                  fsgnjx.s     fs2, fa5, fa4
                  sra          a6, s4, t6
                  fmv.w.x      fa4, s8
                  or           s4, s2, s6
                  ori          s7, a2, -901
                  remu         s10, gp, a1
                  div          a2, gp, a4
                  auipc        s10, 928448
                  fcvt.wu.s    s3, fs9
                  mulhu        a7, s5, a3
                  fmul.s       fa2, ft9, ft8, rup
                  fcvt.w.s     zero, fa3, rup
                  sltiu        t2, t2, -1276
                  fdiv.s       fs1, fa7, fa2
                  rem          s3, s10, t1
                  flt.s        s7, ft9, fs11
                  rem          a6, s0, t4
                  srai         s7, a2, 20
                  fcvt.w.s     t0, fs8, rdn
                  fclass.s     tp, ft10
                  sltu         gp, s8, t6
                  fsqrt.s      fs9, fs9, rmm
                  remu         a1, a4, a4
                  fcvt.s.w     fs11, tp, rtz
                  fmul.s       ft1, ft3, ft4
                  remu         s6, s5, gp
                  div          a0, s5, a7
                  slli         s1, a2, 9
                  fsgnjn.s     fs8, fs11, fs1
                  andi         s3, t0, -1898
                  fle.s        a0, ft0, fa1
                  sltu         a0, s1, s2
                  slt          s2, s11, a1
                  slti         s6, t2, -1174
                  flt.s        zero, fs10, ft6
                  remu         t3, t3, t4
                  fsqrt.s      fa1, fa0
                  or           t1, s3, gp
                  ori          s9, s9, 227
                  fcvt.s.w     ft1, gp
                  fsqrt.s      fa0, fs6
                  fle.s        zero, ft9, ft5
                  rem          t6, t4, s3
                  sll          a3, t2, tp
                  fmv.x.w      ra, ft5
                  fcvt.w.s     s4, fa0, rup
                  flt.s        t1, fs9, fa2
                  remu         t6, t4, a2
                  mulh         a3, tp, a1
                  fsgnjx.s     ft9, fa1, ft6
                  sltiu        s6, a0, 1598
                  fcvt.w.s     t3, fa3, rne
                  fcvt.wu.s    t5, ft10, rdn
                  nop
                  fsgnjn.s     fa1, ft9, fs8
                  xor          s3, a2, s10
                  sub          s3, tp, t5
                  divu         t4, t3, s1
                  feq.s        s7, fa1, ft1
                  flt.s        s9, fs4, fs8
                  and          s10, a5, t2
                  fsqrt.s      ft9, ft8, rtz
                  and          a3, s9, s8
                  slli         t1, a0, 4
                  fsgnjx.s     ft0, fs2, fa1
                  nop
                  fsgnj.s      fs11, fa7, fs0
                  sra          a7, a5, a5
                  fsub.s       fa6, ft1, ft11, rtz
                  srai         zero, t4, 12
                  sub          gp, a6, a4
                  fmax.s       ft3, fs10, ft2
                  slt          tp, t4, t2
                  nop
                  fmv.x.w      gp, fa7
                  slti         sp, a4, -1378
                  sub          s2, sp, s1
                  fdiv.s       fs4, fa3, fa6, rdn
                  rem          s8, s2, ra
                  divu         a4, t4, t2
                  slt          t3, s9, a6
                  fcvt.w.s     t2, fa6, rdn
                  nop
                  xori         t3, gp, -903
                  fmin.s       ft7, fs10, ft3
                  mulhsu       tp, s4, a1
                  fcvt.wu.s    s9, ft1
                  fsub.s       ft2, ft3, fa0
                  slti         s9, t3, 1050
                  sll          t5, s1, t0
                  fadd.s       ft1, ft1, fa0, rtz
                  slt          t2, a0, a7
                  slt          gp, a7, t6
                  fclass.s     t2, ft8
                  flt.s        t0, fa4, fs1
                  fcvt.s.wu    fa4, a4, rtz
                  divu         tp, t3, s7
                  sra          a1, s11, tp
                  nop
                  fmv.x.w      gp, fs8
                  fmul.s       fs1, ft0, fa7
                  addi         zero, s9, 16
                  fmax.s       ft1, ft9, fs10
                  add          ra, s2, a7
                  srl          s8, a6, t3
                  fle.s        t4, fs3, fa7
                  fclass.s     t2, ft7
                  sltu         s1, s3, t2
                  add          t4, t3, s8
                  srli         zero, a3, 10
                  fcvt.wu.s    a0, fa6, rne
                  fadd.s       ft8, ft5, ft1, rmm
                  sra          s9, s9, gp
                  auipc        a6, 212682
                  mulhu        t3, ra, gp
                  andi         s7, s9, -1342
                  sra          a4, s11, a3
                  or           s10, a0, gp
                  fmin.s       fa4, fs9, fs2
                  lui          a0, 600529
                  fmul.s       fa7, fs6, ft7, rdn
                  fsgnjx.s     fs9, fa4, ft8
                  flt.s        a2, fs3, fs2
                  andi         s4, s7, 1047
                  fsgnj.s      ft8, fs1, fa4
                  or           s4, s3, t5
                  mul          ra, gp, a7
                  nop
                  sltu         s4, s1, t6
                  ori          t2, s0, 1433
                  fmv.x.w      a3, ft10
                  fle.s        tp, fs4, fs0
                  fcvt.s.w     ft11, a1, rdn
                  srl          s9, s6, a6
                  fsub.s       ft8, fs7, ft8
                  rem          a1, a0, s1
                  divu         s1, t6, s5
                  fcvt.s.w     ft5, s6, rne
                  remu         tp, s0, t3
                  rem          zero, t3, s0
                  rem          s4, s7, t0
                  lui          t3, 359223
                  flt.s        a6, fa4, ft11
                  fmv.x.w      t4, ft8
                  fcvt.wu.s    s7, ft7, rup
                  fcvt.s.w     ft5, s2
                  fmv.x.w      s3, ft4
                  fsgnjn.s     fs0, fa0, fa2
                  auipc        a0, 177026
                  fdiv.s       fa0, fa4, fs5, rne
                  fclass.s     s1, ft9
                  div          ra, t0, ra
                  nop
                  feq.s        s6, ft0, fs8
                  xor          s6, t3, t4
                  sll          t2, t1, tp
                  slt          t3, a5, a3
                  nop
                  mulhsu       s8, s2, sp
                  mul          s10, s10, s4
                  fmul.s       ft2, fa2, ft11, rne
                  fmul.s       ft7, ft4, ft6, rtz
                  srai         a7, a6, 14
                  xor          a7, s6, s10
                  mul          a6, ra, t0
                  xori         s6, t1, -577
                  fmin.s       ft10, fs6, fs4
                  nop
                  sltiu        tp, s5, 1362
                  addi         a1, a6, -30
                  fcvt.s.wu    ft4, s8, rup
                  addi         a1, a4, 800
                  fsqrt.s      fa1, fs3, rdn
                  fmul.s       fa0, fa1, fs5
                  fle.s        s2, ft1, fs1
                  mulhsu       s1, t1, a1
                  xor          s9, a6, tp
                  andi         ra, t1, 1173
                  or           a5, a1, a5
                  fmv.x.w      s1, ft11
                  fle.s        a7, ft11, fa3
                  slti         a0, t4, -306
                  sltiu        s8, gp, -1263
                  sub          s6, sp, s3
                  sll          s4, t0, a1
                  mulhsu       sp, s3, sp
                  xor          t4, t6, a6
                  sub          t5, a5, t5
                  mulh         sp, a2, s7
                  srl          a4, t0, a0
                  mul          a6, s0, a6
                  fmax.s       fs3, fs9, ft10
                  nop
                  fmv.x.w      t1, fs7
                  and          gp, a1, s9
                  fcvt.s.w     ft7, t5
                  slli         a0, ra, 12
                  fcvt.w.s     a0, fs4, rmm
                  fcvt.wu.s    t6, ft2
                  fmv.w.x      fa6, zero
                  fmax.s       fa4, fs6, fs0
                  sltu         t1, t4, a3
                  fsqrt.s      fs7, fa6
                  addi         s3, a5, 424
                  lui          t0, 693563
                  sra          a0, t5, a2
                  mulhsu       t1, t6, s5
                  fcvt.s.w     ft11, a4
                  sll          s10, s3, s4
                  and          tp, s10, ra
                  xori         a5, a7, 1327
                  fmul.s       fs6, ft8, fs11, rup
                  fmul.s       fs0, fs5, ft0, rmm
                  fmv.w.x      ft8, s5
                  mulhsu       t1, s5, t5
                  fmul.s       ft5, ft0, ft1
                  lui          t6, 908432
                  ori          s3, t4, -1309
                  nop
                  mulh         s10, t5, s3
                  andi         t2, gp, 22
                  fsub.s       fs4, fs5, ft8
                  rem          s9, tp, a5
                  srai         s6, t5, 14
                  fcvt.wu.s    s4, fa0
                  fsgnjx.s     fa0, fa3, fs8
                  mulhsu       a5, t1, s7
                  fle.s        a1, ft9, fs10
                  fcvt.s.w     ft8, t3, rdn
                  fmv.x.w      tp, fa7
                  auipc        tp, 131873
                  fsgnjn.s     fs11, fs10, ft7
                  div          t0, t0, s10
                  nop
                  fclass.s     a3, fs6
                  fcvt.w.s     s4, fs0
                  fsgnjx.s     fa3, ft3, ft7
                  fadd.s       fs2, fs4, ft10, rne
                  sll          a0, a2, s3
                  srl          sp, t0, a1
                  xor          t3, s1, s2
                  srli         s10, t5, 28
                  fsqrt.s      ft7, fs11
                  fsgnj.s      fa1, ft7, fs5
                  fmv.x.w      a6, fs4
                  fsub.s       ft6, fs1, fs5, rup
                  sltu         t6, s11, a3
                  fmv.x.w      s8, ft4
                  fmul.s       ft7, fa0, fa4, rne
                  or           s3, s8, t6
                  slli         a0, s8, 26
                  lui          a2, 410200
                  mulhu        a7, t6, s10
                  fcvt.s.wu    ft4, a2
                  flt.s        s3, ft9, fs5
                  xor          t5, a7, s3
                  fclass.s     s4, ft6
                  srai         s8, s6, 10
                  mulhu        s2, s4, t1
                  srai         t5, s4, 0
                  and          t5, s3, zero
                  fmin.s       fa3, fs0, fs9
                  fsgnj.s      ft2, ft2, ft2
                  fsgnjx.s     fs0, ft4, fa7
                  fsgnjn.s     fs9, ft4, fa0
                  slli         a3, a5, 16
                  remu         s6, a6, t4
                  fsgnjx.s     fs11, fs11, ft5
                  srai         s8, s10, 7
                  fcvt.s.w     fs4, a6, rup
                  fcvt.s.w     fa3, a5
                  fsqrt.s      fa6, ft6
                  srai         a2, s7, 21
                  sll          t2, t2, s5
                  fsqrt.s      fa1, fa1, rtz
                  andi         t6, a2, 1652
                  ori          s3, ra, -436
                  fclass.s     s2, ft8
                  fcvt.s.w     fs6, t4, rmm
                  slli         sp, s7, 29
                  sub          s3, sp, a3
                  fsgnjx.s     fa1, fa0, fa3
                  fcvt.wu.s    a5, ft0
                  addi         s8, t5, -838
                  fclass.s     ra, ft6
                  fsgnj.s      fs4, fs9, ft4
                  fcvt.s.w     ft4, t4
                  auipc        s3, 894863
                  fcvt.wu.s    t6, fs11
                  srli         s10, t1, 25
                  auipc        a0, 846019
                  fmax.s       fs6, ft3, fa6
                  divu         t5, a0, t5
                  andi         zero, s9, -1111
                  fmv.x.w      t5, ft9
                  mul          t0, s10, s9
                  sltiu        t5, a0, 56
                  fmv.x.w      s7, ft11
                  fmul.s       fs2, ft7, fa2
                  mul          t6, a7, a4
                  add          s7, s7, t4
                  fmax.s       fa7, fa2, ft10
                  div          a5, t6, s3
                  srl          s2, s10, t6
                  fmv.w.x      fs1, a3
                  fsub.s       ft0, fs1, fa7
                  sltu         s6, ra, t4
                  xori         gp, s6, 177
                  slti         a5, a3, -302
                  fsgnj.s      fa3, fs9, fs2
                  andi         sp, s11, -493
                  sll          s6, a0, s6
                  srl          s2, s2, t6
                  mulhu        a4, t6, a2
                  or           s10, tp, t2
                  fmul.s       ft7, ft5, fs4
                  fsub.s       ft2, ft9, ft3
                  fclass.s     a4, fs3
                  sra          t5, s2, t4
                  auipc        t4, 220377
                  rem          s7, ra, s10
                  remu         a4, t0, t5
                  rem          zero, t5, a4
                  fmv.w.x      fs11, a0
                  fcvt.w.s     sp, fa7
                  mulhsu       a1, t0, s0
                  fclass.s     a0, ft0
                  flt.s        s1, fs11, fa1
                  xor          t0, s0, s6
                  srli         s4, t1, 22
                  fdiv.s       ft7, fs1, fs3
                  fmul.s       ft1, fa5, fs11
                  fmax.s       ft3, fs5, fa6
                  xori         a5, s0, -337
                  lui          s3, 854742
                  slli         s8, a0, 14
                  mulh         t5, s2, s4
                  and          t2, gp, a2
                  flt.s        a5, fa6, ft9
                  fcvt.s.w     fs9, a6
                  or           t2, t0, s2
                  lui          tp, 826113
                  sll          t3, s7, s4
                  slti         t5, t4, -831
                  lui          t6, 112598
                  remu         s3, s6, t3
                  slt          t1, s9, a2
                  mulhsu       a6, a7, gp
                  ori          s1, s9, 1261
                  andi         zero, s3, 1712
                  and          t0, gp, a7
                  and          t0, a7, tp
                  sra          t5, s9, gp
                  fmv.w.x      ft9, a0
                  xor          t0, tp, s6
                  fle.s        s2, fa5, fs5
                  divu         ra, t1, t3
                  fclass.s     s6, fs3
                  auipc        s10, 123975
                  and          zero, a5, t4
                  srli         t3, t4, 22
                  fmin.s       fa5, fs11, fs5
                  fcvt.wu.s    t2, fs6, rup
                  fmul.s       ft0, ft1, ft11, rne
                  slti         s2, s3, -1329
                  auipc        a2, 969035
                  rem          t0, s0, a2
                  fmv.x.w      tp, fs0
                  fcvt.s.w     ft1, t3
                  lui          a2, 391827
                  fmul.s       ft1, fs11, fs5
                  ori          s6, s10, 1648
                  srai         s4, t6, 27
                  mulhu        t1, s1, t1
                  feq.s        s8, fs11, fs0
                  sub          t5, t0, a3
                  fclass.s     t4, fa6
                  fsub.s       fs4, fa4, ft8
                  fmul.s       fa6, ft7, ft3, rdn
                  slli         a6, a7, 8
                  fclass.s     tp, ft7
                  nop
                  sll          t1, s0, s1
                  srl          a4, a3, s4
                  andi         a4, t6, 271
                  rem          sp, s8, s4
                  slli         tp, a4, 26
                  fmax.s       fs9, ft11, ft6
                  mulhu        a4, s11, t1
                  fsgnjn.s     ft6, fs4, ft11
                  slti         s4, s8, -545
                  mulhu        s9, s2, a0
                  fmin.s       ft10, fs3, fa6
                  auipc        t0, 789830
                  xori         t0, s4, 1537
                  ori          a2, s1, 1056
                  lui          t2, 506073
                  fmv.x.w      s3, fa2
                  fsgnjx.s     fs4, ft10, ft6
                  lui          t6, 488904
                  slli         s2, s4, 13
                  add          a5, zero, s4
                  andi         t4, t5, -662
                  or           s10, t3, a6
                  slt          t0, zero, a0
                  auipc        ra, 292145
                  nop
                  fsqrt.s      fa7, fa2
                  slli         s6, s2, 27
                  auipc        t1, 639605
                  fcvt.w.s     t2, ft5, rdn
                  fmv.x.w      t3, ft7
                  xor          t0, t1, a7
                  xori         t1, t5, -560
                  mul          a7, t1, t4
                  fcvt.wu.s    t3, ft7, rup
                  fdiv.s       fa2, fs8, ft2, rdn
                  sll          t5, sp, s7
                  andi         gp, s11, 2009
                  fsub.s       ft11, fs0, ft6
                  fmax.s       fa0, fa4, fs5
                  mulhu        s1, gp, t2
                  fdiv.s       fs11, fa3, fs11, rtz
                  fmv.x.w      s4, fs6
                  rem          t2, a7, t4
                  sub          a5, t1, sp
                  fmin.s       fa4, fs2, ft0
                  rem          a7, t4, s2
                  fsub.s       fa3, ft11, fa7
                  sltu         t6, s5, s8
                  slli         s4, a0, 26
                  fmin.s       fa7, fa6, ft11
                  fcvt.s.w     fa4, s1, rmm
                  slt          ra, s1, t0
                  or           a1, s3, a2
                  xori         t6, s0, 569
                  slti         t3, t0, -1029
                  fmv.w.x      ft6, s8
                  srai         s7, sp, 27
                  srli         t2, a5, 14
                  fsgnjx.s     fa7, ft9, ft6
                  mulhu        ra, a0, s0
                  sltiu        s8, sp, -817
                  fdiv.s       fa4, fa1, fa4, rdn
                  auipc        s2, 172119
                  andi         a4, t3, 709
                  fclass.s     t6, fs11
                  nop
                  div          t0, s8, s8
                  fcvt.w.s     a0, fa2, rup
                  divu         a2, t5, a4
                  xori         a2, zero, 748
                  slli         sp, s7, 19
                  feq.s        s2, ft11, ft3
                  nop
                  xori         a1, a6, -576
                  andi         sp, a0, -1190
                  slli         s10, t2, 11
                  slti         s9, a1, 1994
                  xori         s2, a0, 1799
                  slt          gp, a0, s1
                  slti         a3, s4, 25
                  div          a7, t0, a6
                  xori         a2, s9, -1508
                  srli         t2, a4, 26
                  add          ra, s11, s2
                  slt          sp, a7, s2
                  fcvt.wu.s    ra, ft4
                  add          a1, a2, t2
                  auipc        s7, 697038
                  slli         s2, zero, 20
                  xor          s7, a6, s6
                  mulh         zero, ra, ra
                  mul          a6, s5, a2
                  fle.s        s2, fs0, ft7
                  fclass.s     a1, ft9
                  fcvt.wu.s    tp, ft3, rup
                  fsub.s       fs4, fs1, ft7
                  nop
                  fmul.s       fs9, fs1, ft2
                  sltu         a0, s7, a5
                  fsub.s       fs8, fa7, fa4
                  fsqrt.s      fa6, fa1
                  mulhsu       s7, t1, t6
                  feq.s        s6, ft9, fa7
                  sub          a2, sp, t3
                  feq.s        s6, fs5, ft2
                  fmv.w.x      ft1, a6
                  lui          a7, 653431
                  fmul.s       fs9, fs7, ft9
                  rem          a2, t1, s7
                  sub          s8, s8, s11
                  sll          a0, gp, a7
                  fdiv.s       fa6, fs4, ft3, rtz
                  fsgnjn.s     fa5, fa4, ft10
                  sra          a4, s5, s9
                  div          s6, t1, s7
                  fsgnj.s      fs0, fs6, fs4
                  remu         gp, a1, t3
                  and          t2, tp, s4
                  srli         sp, t2, 10
                  slli         s10, s11, 29
                  flt.s        s2, fa0, fs1
                  xor          s8, a4, a3
                  fcvt.wu.s    a1, fs1
                  fadd.s       ft5, fs9, fs3, rdn
                  nop
                  srl          t0, s6, t6
                  fadd.s       fs4, ft11, fa0, rtz
                  fmin.s       fs5, ft9, fa4
                  mul          gp, s3, s0
                  srai         t1, a5, 24
                  fmin.s       fa7, ft1, fs3
                  andi         a2, s3, -1941
                  fsgnj.s      fa0, fs9, ft4
                  slti         a6, s3, 1645
                  mulh         tp, s0, t6
                  or           s9, s4, t2
                  srai         ra, s9, 10
                  and          s10, s3, s0
                  fadd.s       fs1, fs6, ft11, rmm
                  fcvt.s.w     fs3, s5
                  auipc        s4, 978085
                  xori         gp, a3, -1154
                  flt.s        s7, ft1, ft3
                  rem          ra, tp, s7
                  feq.s        a7, ft6, fa7
                  remu         a6, s7, s5
                  srli         gp, s9, 24
                  slti         zero, s11, -114
                  fsgnjn.s     fs5, fa2, fs10
                  addi         gp, a6, 881
                  fmax.s       fs9, fa3, fa6
                  auipc        a0, 607215
                  and          s8, s2, s0
                  fadd.s       fa1, fs8, fa6
                  feq.s        t5, ft5, ft11
                  fmin.s       fa4, ft7, fa3
                  ori          t3, ra, -1976
                  addi         a3, tp, -689
                  fcvt.s.wu    ft2, t4
                  fsgnj.s      ft8, ft7, ft0
                  fcvt.s.wu    fs10, s1
                  fadd.s       ft4, fa0, fs10, rdn
                  sra          a5, a0, tp
                  sltu         a6, a3, gp
                  auipc        a3, 37331
                  fclass.s     a4, fa2
                  fclass.s     s8, fs2
                  fmax.s       ft6, ft11, fs11
                  fle.s        tp, fa3, fa4
                  fsgnj.s      fa0, fs1, fa7
                  and          s4, t6, a0
                  fsgnj.s      fs1, ft0, fa6
                  xori         a3, gp, -306
                  addi         a6, s1, 1528
                  auipc        t1, 855531
                  divu         tp, t4, s7
                  mul          t1, sp, a4
                  fcvt.s.wu    fa2, zero, rne
                  sltiu        s6, zero, -1939
                  fcvt.s.wu    ft8, a3
                  fsub.s       fs0, ft6, fa1
                  fcvt.s.wu    fs0, ra
                  divu         a7, sp, t5
                  mulhu        s3, a6, s8
                  srai         s9, t6, 21
                  nop
                  fadd.s       fs5, fs10, ft7
                  or           s7, a4, a4
                  divu         s4, a6, t3
                  xor          s3, s11, ra
                  divu         a2, t0, a7
                  slti         zero, gp, 677
                  fsgnjx.s     fs9, fs7, ft2
                  sll          t5, s2, s10
                  ori          t0, a1, -1156
                  fdiv.s       fs0, ft0, fa3
                  mulhsu       ra, s1, s10
                  mulhsu       s8, s8, a6
                  sra          ra, ra, tp
                  fmv.x.w      a6, fs9
                  sltu         a4, t3, a3
                  mul          a2, s11, s9
                  fsgnjx.s     ft5, fa7, fa4
                  srli         s8, s2, 16
                  rem          a6, s0, a2
                  srli         a3, t2, 2
                  slli         a2, zero, 23
                  fadd.s       fs2, fs2, fs10
                  slli         gp, s7, 23
                  sll          ra, a5, s4
                  slli         s8, sp, 6
                  fsqrt.s      fa0, fs5
                  fcvt.s.wu    ft0, a0, rup
                  fsgnjn.s     fa5, fs7, ft6
                  fcvt.s.wu    ft6, t4
                  addi         s4, a5, 108
                  fmin.s       fa2, fs9, ft8
                  fmul.s       fa3, fa3, ft0
                  mulhsu       a7, a2, a1
                  slti         a6, a6, -139
                  divu         s4, s11, t5
                  fcvt.s.w     ft3, s9
                  sltu         t3, s2, t5
                  xori         t2, s1, 380
                  lui          a0, 750821
                  mulhu        s1, zero, t2
                  mul          tp, gp, s9
                  addi         a2, s6, -1555
                  sltu         s10, s6, s3
                  slti         s1, s4, 782
                  mul          a1, s8, s8
                  div          t0, tp, a3
                  sll          tp, t6, s9
                  nop
                  fcvt.wu.s    s8, ft10
                  mulh         a6, t3, s5
                  remu         t6, gp, s8
                  fcvt.s.w     ft10, s6, rmm
                  feq.s        s6, ft8, fs4
                  xor          a2, a2, a2
                  fcvt.s.wu    fa0, zero
                  fmax.s       fs4, ft8, fs6
                  fadd.s       fs10, fa4, ft5, rmm
                  slti         s6, s3, 577
                  nop
                  remu         s3, a1, s9
                  or           s6, s10, s4
                  auipc        t6, 119133
                  mulhu        a1, s4, s8
                  fmv.w.x      fa1, t6
                  rem          gp, t4, gp
                  fsgnjx.s     fs7, fa0, ft1
                  addi         s6, t2, -487
                  mulhsu       s1, a2, s5
                  xori         t4, t6, -1283
                  auipc        gp, 1005657
                  remu         a1, s3, t2
                  fmax.s       ft9, fa2, fa2
                  and          t6, gp, ra
                  xor          a0, sp, s8
                  addi         t1, s5, -1164
                  fmul.s       fs5, ft4, fs4, rne
                  flt.s        s4, fs5, fs5
                  xor          a2, s5, s3
                  fclass.s     zero, ft7
                  sra          s6, sp, t2
                  flt.s        s8, fs9, fs9
                  fmv.w.x      fa1, tp
                  fadd.s       ft7, ft10, fs6
                  fadd.s       ft7, ft5, fs6
                  and          a4, t6, a5
                  fcvt.wu.s    s1, fs8
                  xori         a3, a4, -866
                  fmin.s       fa4, ft2, fs3
                  sltu         s4, t3, t0
                  fmul.s       fa4, fs7, fa3
                  srli         t2, s7, 13
                  fsgnjn.s     fa0, fa4, fa4
                  srli         ra, a7, 29
                  slti         s9, sp, 522
                  fcvt.wu.s    t2, ft1, rtz
                  fsgnjx.s     fa3, fa4, fs7
                  fcvt.s.wu    fa7, s7
                  srli         t0, zero, 5
                  mul          t1, a3, s1
                  fcvt.wu.s    s7, ft1, rdn
                  divu         s6, s5, t1
                  fsgnj.s      ft1, ft10, fa1
                  flt.s        t1, fs6, fa4
                  srli         a4, t4, 30
                  xor          zero, gp, t2
                  fmv.x.w      s2, fs4
                  fmv.x.w      a1, ft0
                  mul          s6, t5, s10
                  fdiv.s       fs4, fs7, fs5, rdn
                  div          s1, ra, s1
                  remu         s4, t5, s9
                  fsgnjx.s     fs6, ft7, ft10
                  fsgnj.s      ft8, fs0, fa4
                  auipc        t2, 862872
                  fcvt.wu.s    t0, fa6, rmm
                  divu         s4, t3, ra
                  fclass.s     tp, fa4
                  addi         t0, t3, 655
                  fsub.s       fs4, fs10, fs1, rmm
                  ori          s8, t2, 955
                  feq.s        tp, ft4, fa4
                  divu         s7, s1, s0
                  fsqrt.s      fs8, fs11, rup
                  fmv.x.w      sp, ft3
                  srai         a0, a1, 1
                  fmul.s       fs0, fa5, fs5, rtz
                  slli         t2, a4, 11
                  remu         t0, a0, s2
                  fclass.s     zero, ft1
                  fadd.s       fs7, ft6, fs0, rtz
                  sub          s6, a3, s0
                  ori          tp, a2, -1912
                  sll          a1, sp, ra
                  fmax.s       fa2, ft5, ft7
                  xori         a0, tp, -1795
                  mulh         s9, a6, s1
                  lui          s8, 521976
                  sub          gp, s0, s8
                  srai         a6, s4, 23
                  fadd.s       fs1, ft5, fs8, rmm
                  ori          s10, a2, 2031
                  fmin.s       fs3, fs8, ft0
                  fsgnjx.s     ft0, fs8, fs8
                  fsub.s       fs11, ft9, fs4, rdn
                  fsgnjn.s     fa1, fa3, ft2
                  fcvt.w.s     s9, ft11, rup
                  mulh         a1, t0, s11
                  sub          a2, t4, sp
                  fcvt.w.s     t3, fs8, rup
                  remu         t0, zero, a4
                  addi         s9, s1, -1015
                  fsgnjx.s     ft8, fs4, fa1
                  fcvt.s.w     fs4, s6, rtz
                  fmin.s       fa6, ft10, fa2
                  mulhsu       gp, t5, s5
                  sub          a4, t5, t5
                  lui          t6, 94473
                  auipc        s8, 96090
                  fcvt.s.w     fs4, s8, rup
                  fmv.w.x      fs2, s9
                  sltiu        a4, a3, -436
                  fle.s        s10, fa0, fs5
                  divu         t2, s11, s0
                  mulhsu       gp, s3, a7
                  rem          s8, s3, a2
                  feq.s        sp, ft8, ft1
                  fclass.s     t6, fs7
                  slli         t6, s5, 22
                  fmv.x.w      gp, ft0
                  slt          gp, t4, a1
                  feq.s        zero, fa0, ft6
                  divu         a4, zero, tp
                  addi         s7, a1, -1071
                  mulhsu       tp, s9, s0
                  sll          s4, t5, s3
                  xor          s3, s0, s10
                  sra          s7, t2, a7
                  mulhsu       t2, a1, t6
                  fclass.s     t3, fa2
                  flt.s        tp, fa3, ft10
                  add          s10, ra, a1
                  addi         ra, s9, 1273
                  sub          t3, t6, t2
                  flt.s        a2, fa7, fa5
                  or           zero, a3, s9
                  or           a5, s8, s6
                  xor          a0, s3, s5
                  slli         sp, s8, 2
                  div          t3, t0, t1
                  fsgnjn.s     fa6, fs10, ft1
                  sltu         s3, tp, s9
                  addi         s6, t2, -1682
                  fsgnj.s      fs11, fa1, ft10
                  fsgnjx.s     fs3, ft8, fa6
                  sll          a4, t5, gp
                  srl          tp, gp, s11
                  mul          t3, a7, s6
                  rem          s6, t6, t2
                  fsub.s       ft2, fs11, ft3, rmm
                  fmax.s       fs9, fs0, ft7
                  lui          sp, 772636
                  add          s2, a1, t6
                  sltu         t5, a1, a4
                  xori         ra, s7, -1801
                  andi         ra, s0, 812
                  or           s6, s1, t2
                  or           t3, s3, s9
                  slli         s6, t5, 13
                  andi         s8, s0, 1765
                  mulhsu       s9, tp, t1
                  flt.s        a2, fa2, ft3
                  fmv.x.w      s1, fa1
                  ori          t2, s3, 37
                  sll          a4, s0, s10
                  fmv.w.x      ft10, a5
                  fsgnjn.s     ft11, ft8, fs11
                  remu         tp, tp, tp
                  fsgnj.s      fs10, fs4, ft3
                  fsgnj.s      fs9, fa6, ft4
                  fclass.s     t2, ft6
                  auipc        a5, 834898
                  xori         t3, t5, -1616
                  sltiu        s1, s6, -1578
                  fle.s        gp, fs5, ft3
                  slti         a0, s3, -1746
                  mulhsu       s3, t4, tp
                  fdiv.s       fs6, ft5, fa2
                  ori          a4, ra, 535
                  fcvt.s.w     fa4, tp
                  add          a4, s8, t5
                  fsqrt.s      fs10, ft2
                  or           a3, s6, s6
                  fsgnjn.s     fs1, ft11, fa7
                  mulhu        t4, zero, tp
                  fsub.s       fa6, ft3, ft9, rup
                  srl          t1, tp, s4
                  nop
                  divu         a0, s2, tp
                  srai         s1, s2, 7
                  remu         a6, s8, s6
                  fcvt.w.s     a5, fa2, rmm
                  fsqrt.s      ft4, fs9, rdn
                  fsub.s       fa4, ft9, ft6, rtz
                  srl          s1, s3, s5
                  mulhu        s2, a6, t2
                  xori         s6, t2, 1764
                  fsgnj.s      ft6, fa2, fs4
                  mulh         gp, s0, s1
                  fcvt.s.w     fs7, a4, rup
                  nop
                  sra          s1, t2, s6
                  srl          a0, zero, s10
                  fadd.s       fs9, fs4, fs2
                  fsgnjx.s     ft9, fs0, fa6
                  feq.s        s1, fs9, fa1
                  xor          s8, a7, s9
                  fmax.s       fs4, fs10, fs0
                  fadd.s       fs4, ft2, fs10
                  fcvt.w.s     t1, fs11, rne
                  div          gp, s1, s1
                  nop
                  mul          s7, s1, s6
                  nop
                  fmul.s       fs4, ft1, fs11
                  fmin.s       fa2, fs6, fa5
                  fle.s        tp, fs1, ft7
                  andi         s4, a4, 487
                  or           s6, ra, tp
                  flt.s        s4, ft8, ft8
                  ori          t6, ra, 1331
                  add          ra, a1, gp
                  sra          sp, a5, s7
                  xori         t6, a3, -1888
                  fsgnjn.s     fs2, fs2, fs4
                  mulh         a6, a7, s11
                  fmv.w.x      ft6, a4
                  fmv.x.w      a6, fa0
                  divu         a2, s8, s9
                  add          a6, s6, s2
                  mulhu        t6, s10, s1
                  fsqrt.s      ft10, ft8, rdn
                  or           a3, s2, a2
                  ori          a7, s10, -1882
                  add          t4, s9, s11
                  rem          t0, a5, t5
                  fcvt.s.w     fs0, t1, rmm
                  fcvt.wu.s    a6, ft8
                  mul          a4, sp, s6
                  xori         a3, a3, -1213
                  sra          t1, a7, s0
                  sra          s1, a2, a4
                  fcvt.wu.s    a5, ft6
                  fsub.s       ft10, ft8, fs3
                  fsgnj.s      fa2, fs2, ft11
                  and          a4, s1, s1
                  fmv.x.w      t6, fa6
                  rem          s8, t2, a5
                  fmax.s       fa0, fa7, fs10
                  fclass.s     s7, fs2
                  xori         t0, t6, -1084
                  feq.s        zero, fs2, fs3
                  srli         t2, tp, 20
                  fsgnjx.s     fa0, ft11, fs9
                  fadd.s       fa7, ft11, ft11
                  fle.s        t3, ft2, ft2
                  srli         s7, s8, 5
                  sub          zero, tp, zero
                  rem          s7, t1, a5
                  sltiu        t6, s2, -1103
                  fcvt.s.w     fa7, s11
                  srai         s4, a2, 1
                  sltu         s3, sp, a6
                  sltiu        s7, ra, -30
                  mulhsu       s1, a0, tp
                  and          t2, s8, t1
                  mulhu        a6, s0, a2
                  fmin.s       ft10, fa6, fa7
                  fmv.x.w      t4, fs5
                  fadd.s       ft10, fs10, fs0, rdn
                  slli         s9, zero, 6
                  ori          t3, ra, -1095
                  add          s2, s3, s9
                  srl          a3, s7, a0
                  nop
                  mulhu        t0, a0, s10
                  slt          t5, s7, s9
                  fsub.s       fa1, fa5, fs4
                  slt          s8, s2, t3
                  fsub.s       ft3, fa7, ft9
                  mulhu        tp, s1, t4
                  srai         a0, s9, 6
                  fmul.s       fs2, fs0, fs4
                  fmax.s       fa5, fs6, fa6
                  fsgnjx.s     ft8, fa0, fa6
                  flt.s        s6, ft0, fs0
                  fdiv.s       fa6, ft8, ft1, rdn
                  auipc        s8, 868688
                  srai         t2, s9, 7
                  fsub.s       ft10, ft6, fs7, rup
                  sltu         s6, s4, s1
                  nop
                  divu         t4, a7, ra
                  slti         gp, s8, 1884
                  fcvt.w.s     a1, fa2
                  sra          tp, gp, s5
                  sltiu        a2, s10, -512
                  fclass.s     s2, fa2
                  fcvt.s.wu    fs2, a4
                  nop
                  and          s2, t4, t4
                  mulhsu       s8, s8, a0
                  sub          s2, gp, a0
                  add          t5, t5, gp
                  mulh         s7, s3, s11
                  auipc        gp, 145803
                  slt          a4, s4, s5
                  xori         gp, tp, 1601
                  ori          ra, tp, 265
                  divu         zero, s8, a6
                  srai         a0, a6, 1
                  fcvt.s.w     ft6, t3, rtz
                  rem          t3, t3, t0
                  fsgnj.s      ft4, ft5, fs6
                  mul          s9, t6, s8
                  nop
                  lui          a2, 744715
                  ori          a0, a5, 1495
                  and          a6, t6, tp
                  andi         a5, t5, 817
                  remu         s4, s6, zero
                  xori         t6, t6, 83
                  fmin.s       fs7, fs0, fa0
                  slti         t0, t0, 1694
                  sra          s9, s2, a5
                  slli         zero, a0, 7
                  fsqrt.s      ft4, fs0, rne
                  ori          s3, a5, 57
                  divu         sp, t6, ra
                  srai         t5, tp, 5
                  fsqrt.s      fs7, ft0, rtz
                  fmv.x.w      s8, fs10
                  mulh         s10, a1, a3
                  mul          t5, t0, s6
                  sltiu        a0, s9, 117
                  fmv.w.x      fa0, s3
                  and          t1, s6, s3
                  nop
                  fcvt.s.w     ft0, gp
                  fsqrt.s      ft5, fs9
                  sltu         a7, s7, a0
                  mulhu        ra, t4, t6
                  mulh         ra, sp, t4
                  slt          sp, zero, t3
                  srli         zero, s7, 16
                  ori          t5, t6, -1163
                  fsgnjx.s     fs6, ft9, fa3
                  xori         a3, s7, -1466
                  fsub.s       ft6, fa2, fa3, rtz
                  rem          a0, s10, s3
                  fmv.x.w      s6, ft10
                  lui          a1, 935168
                  sltiu        t0, a5, 1518
                  fcvt.wu.s    t2, fs7, rtz
                  slli         a1, gp, 10
                  sltiu        s10, gp, 477
                  fcvt.s.w     fs5, s0
                  fle.s        zero, ft1, fs7
                  fcvt.s.wu    fa5, t6, rdn
                  flt.s        t5, fs1, fs6
                  fcvt.s.wu    ft10, a6
                  xori         s1, tp, 1584
                  srli         t0, t0, 2
                  fcvt.s.w     fa6, s0
                  sltu         a7, s7, t0
                  fsgnjn.s     ft3, ft5, ft9
                  mulh         a1, a4, t0
                  fsgnjx.s     fs3, fs0, fa6
                  fadd.s       fs6, fs10, ft9, rup
                  mulhsu       t1, t1, s11
                  fmin.s       fs5, ft6, fa6
                  fle.s        s2, fs1, fa0
                  mulhsu       ra, a7, s4
                  srli         s9, a3, 27
                  xori         t1, a5, -419
                  rem          a6, s9, s4
                  auipc        t4, 550815
                  slt          a7, s8, tp
                  srl          gp, a4, s9
                  slli         t5, a7, 12
                  feq.s        a5, fs11, ft10
                  fle.s        a7, fa5, fa4
                  add          sp, a5, s5
                  and          ra, s5, s11
                  fmax.s       fa6, ft11, fa0
                  sltu         a7, a4, a3
                  auipc        a5, 421797
                  fcvt.s.wu    ft8, a2, rne
                  mul          t5, s9, s0
                  sub          sp, s1, a3
                  lui          sp, 973419
                  rem          tp, ra, s3
                  flt.s        s4, fa2, ft9
                  mulhu        t0, s11, t0
                  nop
                  sltu         s3, s9, zero
                  div          sp, t3, t2
                  nop
                  feq.s        s9, fa7, ft1
                  slti         t5, t3, 648
                  fmul.s       fa4, fa0, fs9
                  sltu         t5, t0, s6
                  and          a7, t1, s2
                  srai         t3, a6, 22
                  sub          s2, zero, a2
                  andi         t1, s2, 1035
                  sra          a6, t0, s8
                  fle.s        t3, ft9, fs0
                  or           a6, s2, t3
                  mulhu        s10, s2, zero
                  and          a0, tp, s6
                  mul          s3, ra, a2
                  remu         t4, a1, tp
                  sra          t5, t6, a5
                  mul          zero, s5, t1
                  addi         t1, a6, 1883
                  rem          t3, gp, a4
                  add          a7, s2, s4
                  divu         a7, gp, s9
                  fadd.s       ft9, fs4, ft9
                  fsub.s       fs6, ft4, fa0, rtz
                  fadd.s       fs5, fa6, fa4
                  fmul.s       fs3, fs0, ft2, rne
                  fcvt.wu.s    a7, fa1, rup
                  flt.s        a4, ft6, fs2
                  srl          t6, t0, a2
                  fmin.s       fa4, fs7, fs4
                  srai         s9, t0, 25
                  slli         a5, t1, 24
                  fmax.s       fa1, fs3, ft11
                  and          a1, t1, t0
                  or           s7, zero, a6
                  auipc        s8, 306775
                  xor          s2, s5, s4
                  fle.s        s4, ft11, fa1
                  andi         a0, t0, -1210
                  mulhsu       tp, a4, t6
                  slt          a3, s5, t3
                  remu         s7, a0, s0
                  xor          a1, s2, a0
                  fclass.s     s1, fs2
                  add          t1, t5, gp
                  fcvt.s.w     fa1, a2, rmm
                  mulh         t2, s0, t6
                  slt          t6, ra, s4
                  fmv.x.w      a5, fs6
                  xor          ra, gp, s0
                  andi         s7, a4, 808
                  fmv.x.w      t3, fs5
                  fmv.w.x      fa7, a5
                  auipc        s1, 374540
                  fsub.s       ft11, ft11, fs1, rup
                  slt          zero, s9, s4
                  slt          s7, a3, s0
                  mulhsu       t3, s4, a0
                  fsqrt.s      fs10, fs8
                  fdiv.s       fa6, fa2, fa3
                  fcvt.s.wu    fa0, s0, rup
                  fsqrt.s      ft11, fs4, rup
                  mulhu        sp, t1, s7
                  mulhu        s2, s11, a3
                  fcvt.w.s     s2, fs2, rdn
                  sra          s1, s3, ra
                  flt.s        s10, fs5, ft11
                  fdiv.s       ft9, ft2, ft0
                  auipc        t2, 459124
                  remu         s7, s8, ra
                  fcvt.s.wu    fs4, zero, rne
                  nop
                  auipc        sp, 29081
                  ori          gp, a2, -178
                  srai         t1, s5, 27
                  addi         tp, s1, -1480
                  fmax.s       fs10, ft9, ft11
                  divu         a1, s3, s10
                  divu         a2, gp, t0
                  auipc        a1, 234838
                  addi         zero, tp, -1701
                  mulhu        ra, s7, t6
                  fdiv.s       fa2, ft9, fs5, rup
                  mulhsu       a6, s3, ra
                  fclass.s     t1, ft9
                  feq.s        s3, fa1, ft0
                  fcvt.wu.s    a0, ft3, rmm
                  lui          tp, 150813
                  fadd.s       fa1, fs5, ft0
                  sll          t3, tp, a1
                  mulh         s2, t1, ra
                  fmin.s       fa3, fa7, ft0
                  fmv.x.w      s10, fs1
                  remu         t5, t6, s4
                  fadd.s       fa6, fs2, fa2, rup
                  fclass.s     s3, ft10
                  slti         a3, a7, 990
                  ori          a5, a2, 31
                  rem          a2, t3, s0
                  fmax.s       fs5, fs2, fa5
                  srl          zero, a3, t0
                  sll          t2, a5, t1
                  fsub.s       fa2, fs6, ft6
                  fmv.w.x      fs11, s7
                  lui          t0, 166733
                  sltu         t6, ra, a5
                  ori          tp, s4, 369
                  divu         s3, t4, ra
                  sra          s2, s8, t1
                  divu         tp, a3, t1
                  ori          s2, t1, 473
                  mulhu        a4, t3, tp
                  fsgnj.s      fs0, fs1, fs3
                  mulhsu       s6, s8, a0
                  fmv.x.w      s6, fs11
                  mul          t1, sp, sp
                  sltu         t3, t4, t2
                  mulh         a4, s11, s1
                  srai         s3, s7, 29
                  sra          s6, a1, t4
                  fmul.s       fs0, fa3, fs0
                  andi         sp, t6, -1812
                  fcvt.s.w     fs9, s4, rdn
                  fcvt.s.w     ft4, t2
                  srai         zero, a4, 3
                  mul          s1, t6, tp
                  fmv.w.x      ft7, gp
                  sll          t0, zero, s0
                  andi         t2, s10, 1143
                  fmv.x.w      t1, fa7
                  mulhu        s9, s11, tp
                  flt.s        ra, fs6, fa4
                  rem          s9, sp, a3
                  mul          t0, t1, t6
                  feq.s        ra, fa0, ft8
                  fmv.w.x      fs10, s7
                  andi         s6, s4, 706
                  sltiu        s8, tp, 1930
                  fmv.w.x      fs4, a6
                  xor          ra, t6, s9
                  sub          t0, t1, t0
                  or           s8, s4, a7
                  fmin.s       ft5, ft8, fa6
                  fclass.s     t3, ft11
                  sub          a2, s11, t3
                  fmul.s       fs10, ft3, ft2, rmm
                  fmax.s       fs10, ft7, fs3
                  sra          a2, a5, s8
                  flt.s        s7, ft6, fa3
                  ori          zero, t3, -1328
                  srli         t3, sp, 1
                  fclass.s     s4, fa7
                  srl          t5, a3, a2
                  fadd.s       ft9, fs11, ft2, rne
                  fmv.x.w      t5, ft1
                  flt.s        sp, fs1, fs6
                  xor          a3, a3, s11
                  slti         t1, s6, -1396
                  feq.s        s4, ft5, fs11
                  flt.s        ra, fa1, fa5
                  fmin.s       fs3, fs4, fs4
                  fmax.s       fs10, fa0, fs0
                  remu         t3, zero, t0
                  mulh         a0, zero, s2
                  fsub.s       ft0, fs11, fa7
                  sra          s3, a5, a0
                  fmax.s       ft8, fa2, fa7
                  srai         ra, a6, 15
                  divu         a1, s3, ra
                  or           t6, s11, s11
                  mulhsu       t2, a3, zero
                  fsgnj.s      fs8, ft7, fs11
                  mulh         t1, s7, t5
                  lui          t4, 860412
                  fmv.w.x      ft8, t1
                  fsgnjn.s     fa3, ft1, ft9
                  fmin.s       ft9, ft3, ft8
                  lui          a4, 520134
                  fmv.x.w      a6, fs6
                  mulhu        s8, s4, s7
                  sub          t0, a0, a6
                  fmin.s       fa2, ft10, fs4
                  fcvt.wu.s    a6, fs0
                  xori         a0, s10, 934
                  srai         sp, t3, 2
                  sltu         ra, gp, s1
                  fcvt.wu.s    a6, ft10
                  fcvt.s.wu    fa4, s9, rtz
                  fmax.s       fs10, ft3, ft9
                  fsgnjx.s     fa5, ft0, fa0
                  fle.s        s7, fs11, fs5
                  sub          s3, sp, a1
                  fmin.s       ft1, ft6, fs1
                  sra          s4, zero, s7
                  fmv.w.x      fs2, a7
                  flt.s        s2, fa4, fs1
                  fcvt.wu.s    t3, ft9
                  andi         t3, a5, -322
                  rem          t3, sp, a4
                  lui          s3, 938598
                  auipc        ra, 84954
                  add          s6, s7, t1
                  srli         a4, sp, 16
                  divu         t2, s6, t6
                  xori         a7, a1, -1631
                  sltiu        t5, s10, -794
                  flt.s        a7, fs4, fa5
                  fmul.s       ft1, ft0, ft8, rdn
                  div          a0, a2, s0
                  addi         tp, t6, 1557
                  lui          ra, 795555
                  fcvt.w.s     t2, fs1
                  sra          t3, t4, s2
                  fsgnjx.s     fs3, fa5, fa5
                  remu         a5, s2, a7
                  fmv.x.w      a7, fs8
                  mulhu        t1, s0, s1
                  slli         a5, a6, 4
                  div          s7, t4, a3
                  srai         s3, s5, 24
                  fcvt.s.wu    ft1, s10
                  mul          a6, a5, a2
                  sub          s3, zero, zero
                  sra          t3, s9, s1
                  fmax.s       fa3, fs5, ft8
                  lui          a0, 214775
                  fcvt.s.wu    fa1, a5, rmm
                  fcvt.s.w     fs11, zero
                  div          a4, a2, s11
                  divu         s9, s2, gp
                  fmax.s       fa6, ft0, fa5
                  srl          s10, a7, t4
                  nop
                  fsgnjx.s     fs5, ft5, ft11
                  fmax.s       fa7, fa7, fs6
                  mulhu        t1, a6, zero
                  mulhu        a2, a7, sp
                  sub          s2, s0, t0
                  div          s7, s1, s0
                  sltiu        t1, s8, 1313
                  fcvt.s.wu    ft6, a7, rne
                  rem          a0, s2, zero
                  rem          a1, a3, t2
                  fsgnjn.s     fa3, ft11, ft5
                  slti         t4, t1, -72
                  fcvt.s.wu    ft3, t2, rdn
                  slli         a5, s9, 19
                  mulh         a2, s9, a4
                  fcvt.s.wu    ft2, t0
                  slli         s8, a4, 13
                  fsgnjn.s     fs9, ft11, fa1
                  fsgnjx.s     fa2, fs9, fs4
                  or           s2, t0, a6
                  fmax.s       ft10, fa0, fa6
                  fcvt.s.wu    fa7, sp, rtz
                  slti         a4, s11, 1197
                  div          t3, t4, s7
                  add          s3, a3, zero
                  fcvt.wu.s    a2, fs10, rmm
                  ori          s3, s2, 1902
                  fmax.s       ft7, ft1, fs7
                  fcvt.w.s     a3, ft1, rtz
                  fmax.s       fs5, ft9, fs3
                  mulh         t6, a2, s2
                  addi         t2, s2, -1441
                  div          s9, a6, s6
                  addi         s4, s7, -585
                  sub          s4, t1, t0
                  mulh         tp, s5, a6
                  fcvt.w.s     s1, ft1, rtz
                  xori         gp, s6, -93
                  fsqrt.s      fs8, fa0
                  sltu         s6, s11, s5
                  fle.s        s1, fa5, ft1
                  fcvt.s.w     ft2, a4
                  addi         a4, s2, 1127
                  fcvt.s.wu    fa1, a1, rup
                  lui          a6, 522501
                  slt          s10, s2, s5
                  addi         ra, s3, 960
                  xor          s2, s8, zero
                  fcvt.s.w     fa5, t0, rdn
                  auipc        t2, 380901
                  fmv.x.w      zero, ft8
                  sll          ra, s0, s4
                  fmin.s       fa7, fs7, fs10
                  fcvt.s.wu    ft6, a4, rtz
                  srl          s10, s7, a7
                  xori         t3, a0, -1902
                  slt          s3, t5, t0
                  fdiv.s       ft4, fa5, ft0, rmm
                  add          a4, sp, a1
                  fmax.s       fs3, ft1, fs8
                  sltu         s9, a6, s7
                  lui          a6, 610230
                  fle.s        s1, fa0, fs6
                  sra          tp, a5, s8
                  fle.s        a7, ft7, ft0
                  div          s10, t5, t5
                  slti         a1, s0, 2013
                  rem          s9, t0, s4
                  sra          s8, s11, s7
                  slli         s2, s3, 2
                  fdiv.s       fs10, ft1, fs11, rmm
                  sub          t2, t5, t1
                  div          a3, t2, sp
                  srl          s9, a2, t5
                  mul          t1, s11, t2
                  and          s7, zero, a0
                  srl          a4, a6, s8
                  lui          t6, 422272
                  fcvt.w.s     a6, fa7, rtz
                  or           s3, a1, gp
                  slt          s4, s6, t0
                  xori         t3, s1, 473
                  srl          s1, sp, s8
                  fcvt.s.wu    fs2, a7, rtz
                  mulh         sp, s5, s8
                  fsqrt.s      fa1, fs7, rne
                  remu         t6, gp, a4
                  fmax.s       ft1, fa2, fs0
                  xori         s7, s5, -1776
                  mul          a3, tp, t1
                  fsub.s       fa1, ft11, ft11
                  fsgnjn.s     ft9, fa1, fa5
                  add          s2, a7, a5
                  nop
                  and          a2, a2, s3
                  slli         t5, s4, 20
                  divu         a5, zero, s2
                  srli         ra, sp, 27
                  mulhu        a3, a1, a2
                  fcvt.s.w     ft8, s11, rne
                  slti         a2, zero, -1476
                  fsub.s       ft11, fs4, ft2, rmm
                  divu         sp, s4, s9
                  fclass.s     zero, fa0
                  slt          s2, a2, t0
                  xori         s1, a1, -1223
                  mulhsu       a2, a7, s2
                  fmin.s       fs4, ft6, fs7
                  fmv.x.w      s4, ft1
                  fsgnj.s      fs0, fs5, ft7
                  auipc        s8, 996195
                  andi         s1, a6, -1629
                  rem          zero, s6, a6
                  fsgnjx.s     ft0, fa5, ft8
                  fcvt.s.wu    fs4, t5
                  fmv.x.w      t0, fs10
                  xori         zero, a7, 431
                  nop
                  andi         t1, a3, 588
                  slli         t5, a4, 12
                  andi         zero, a6, 1730
                  fcvt.s.w     fa4, t1
                  mulhu        zero, t1, a0
                  fclass.s     a7, ft10
                  ori          ra, t5, 675
                  slt          a5, a2, a0
                  div          s4, a0, a5
                  fmul.s       ft3, fa2, ft4
                  fcvt.w.s     gp, ft2
                  xor          s8, s4, s7
                  fcvt.wu.s    s10, ft5, rdn
                  sltiu        a7, s6, 188
                  mulhsu       s7, t0, t5
                  nop
                  feq.s        tp, fs5, fs4
                  divu         s10, sp, a6
                  fmv.x.w      s8, fs10
                  srai         a0, a1, 2
                  or           s10, s5, gp
                  slli         t4, a6, 15
                  remu         a5, a5, sp
                  sll          ra, s7, a5
                  mulh         a0, a7, sp
                  div          a7, tp, ra
                  divu         a0, a4, tp
                  xori         a3, t2, 1832
                  fle.s        a6, ft4, ft9
                  fle.s        s8, ft6, ft11
                  feq.s        s10, fs9, fa7
                  and          t0, s10, s11
                  fsqrt.s      fs1, fs8
                  feq.s        a2, fa7, fa4
                  and          a1, s9, a0
                  fmul.s       fs1, fa2, fs8
                  mulhu        a4, s3, s7
                  fcvt.s.w     fs3, s3
                  flt.s        s8, ft9, fa5
                  srli         t2, t5, 25
                  slt          t1, tp, s4
                  slt          s2, t5, t0
                  fdiv.s       ft4, fs1, ft1
                  slti         ra, a6, -53
                  fcvt.w.s     ra, ft5
                  add          a6, t0, t3
                  fsgnjx.s     fs11, fa2, fs1
                  divu         s4, s1, s0
                  sll          a0, zero, a7
                  fsgnj.s      ft7, fs0, fa4
                  lui          t6, 55465
                  mulhu        sp, t6, a4
                  slt          s7, s11, ra
                  fadd.s       ft4, fa7, fs5
                  mulh         s7, ra, s3
                  div          s4, s7, a3
                  fdiv.s       ft2, fs7, ft7
                  xori         t5, t3, 1978
                  slt          a6, s5, a6
                  ori          t2, s3, -62
                  flt.s        s6, fs11, fs10
                  addi         gp, s4, 1568
                  fsgnjx.s     fs0, fa3, fa1
                  sltiu        a3, a5, -1362
                  rem          a7, s8, zero
                  rem          s1, t4, s2
                  sub          s4, a3, s7
                  and          s8, s9, a2
                  fcvt.s.w     fs8, s0
                  sra          s8, a0, s1
                  divu         s6, s9, t2
                  mulh         s10, t5, ra
                  fmv.x.w      t0, ft0
                  srli         t3, s0, 0
                  divu         ra, a6, s4
                  fsgnjx.s     fs0, fa6, fs0
                  mul          t0, s10, t6
                  mulhsu       a4, s5, s1
                  srli         s9, s1, 11
                  fsgnjx.s     fa4, fs3, ft7
                  slli         a4, tp, 11
                  fmv.x.w      s3, ft1
                  flt.s        tp, ft11, fa0
                  and          tp, gp, ra
                  fsgnj.s      fs4, ft3, fa1
                  lui          t5, 856885
                  fmul.s       fs11, fa7, fa7, rdn
                  fcvt.wu.s    t1, ft2, rdn
                  fmul.s       fs11, ft3, fs2, rne
                  div          a0, ra, s11
                  sll          t6, s1, t0
                  mul          t2, ra, t0
                  mulh         a0, s9, a0
                  mulhu        a6, s7, s1
                  fcvt.w.s     a3, ft11
                  slli         s6, a3, 20
                  mulhu        t6, a4, tp
                  remu         s2, a3, a7
                  fmv.x.w      s10, ft0
                  divu         a3, t6, s3
                  fsgnjx.s     ft11, ft5, ft1
                  mul          t6, a4, tp
                  fsqrt.s      ft6, fa7, rtz
                  slti         s2, s1, 714
                  div          t6, gp, s2
                  rem          tp, a6, a1
                  fclass.s     t0, fs7
                  fcvt.s.w     fa4, a0
                  fclass.s     s1, fs5
                  fmv.w.x      fs9, s5
                  sra          zero, t5, s3
                  fle.s        ra, ft8, fa7
                  fcvt.s.w     ft5, t6
                  andi         t2, s0, -1050
                  fsgnjn.s     fs2, fs3, fa5
                  lui          t5, 959300
                  fsqrt.s      ft1, fs8
                  fle.s        t1, fs6, ft5
                  slt          s1, s1, t5
                  mulh         s6, s6, sp
                  fmax.s       fs10, fs2, fs4
                  fsub.s       fa4, fs1, ft7, rmm
                  fcvt.s.wu    fa2, s2
                  fcvt.w.s     s6, fs6
                  remu         a7, a0, s6
                  mulh         a4, a2, t2
                  fsgnjx.s     ft5, fs5, fs7
                  fsub.s       ft5, fa6, ft2
                  auipc        a6, 672171
                  slli         a4, s2, 26
                  srl          a3, t3, t3
                  fmv.w.x      fs4, s3
                  or           t6, s6, ra
                  ori          s4, s8, 584
                  sra          sp, a2, t6
                  auipc        sp, 369736
                  srli         a7, s3, 18
                  sltu         ra, sp, a3
                  mul          a4, s10, s10
                  sll          t1, a0, s8
                  remu         t6, ra, a1
                  sltu         a0, s8, t2
                  mulhsu       s10, a3, a4
                  fmin.s       ft10, fs8, ft4
                  fmin.s       fs2, fa7, ft3
                  addi         a0, s4, 1818
                  fcvt.wu.s    ra, ft10
                  fmul.s       fs5, fs5, fa6, rtz
                  fadd.s       ft0, fa4, fs4
                  addi         t6, s1, 1205
                  slt          t6, s7, a5
                  fcvt.w.s     a2, ft2
                  slt          a4, s6, zero
                  slt          tp, s6, t5
                  fsgnjx.s     fa6, ft0, fa4
                  add          t1, t6, s6
                  div          t6, s1, a0
                  fadd.s       fa1, fs4, ft2, rdn
                  srli         s4, s2, 28
                  auipc        s10, 878638
                  ori          t3, s1, 1135
                  fdiv.s       ft6, fa1, fs10, rtz
                  sltu         ra, s5, a6
                  fmax.s       ft3, fa4, ft4
                  sra          s4, a2, s4
                  rem          s9, t5, t4
                  srl          a2, a3, a5
                  fcvt.w.s     ra, fs6
                  or           a1, t5, s5
                  remu         a6, t2, s6
                  divu         s10, a0, a0
                  slt          a1, t3, s2
                  sll          a2, s6, t0
                  srai         t0, t5, 27
                  fcvt.w.s     a3, ft6
                  andi         s6, s5, 2025
                  sub          s7, t0, gp
                  srl          ra, s9, zero
                  lui          a6, 449630
                  sltiu        a3, a1, 274
                  fle.s        a1, ft2, fs8
                  srl          s4, a4, t1
                  fdiv.s       fs7, fs3, fa1, rtz
                  and          s10, s1, zero
                  fsgnjx.s     fa1, fa2, fa5
                  fmul.s       fs2, fa1, fa4
                  fsgnjn.s     fs10, fa6, ft10
                  fcvt.w.s     s4, ft8
                  slt          t2, a4, s5
                  fsgnj.s      fa3, fa7, ft11
                  nop
                  fsgnj.s      fs6, ft9, fa0
                  andi         t1, t6, 1218
                  remu         a0, a4, a6
                  div          t1, a6, s0
                  andi         t6, sp, -1020
                  fsub.s       ft0, fa4, ft6, rmm
                  add          a6, s6, a4
                  fsgnjx.s     ft6, fs2, ft10
                  mulhu        a4, gp, t3
                  rem          gp, a4, a5
                  lui          tp, 623136
                  mulh         s10, sp, t4
                  srl          s2, a7, t0
                  auipc        zero, 979491
                  nop
                  fclass.s     gp, ft6
                  mul          a3, sp, tp
                  fdiv.s       ft4, fa0, ft2
                  remu         t0, a5, s3
                  fsgnj.s      ft10, fa2, fa4
                  divu         t2, a2, t2
                  srli         a0, a0, 3
                  add          a4, a5, t2
                  fclass.s     tp, fs9
                  fsgnj.s      fa6, fa7, ft1
                  srli         tp, s4, 15
                  srli         a3, gp, 31
                  sll          a5, a4, t2
                  sra          a4, a5, s11
                  srl          a5, t6, a6
                  andi         sp, a4, 1815
                  nop
                  fmv.x.w      t2, ft6
                  fdiv.s       fs11, ft3, fa2, rdn
                  sll          a4, t4, a0
                  xor          s8, ra, a1
                  fsgnjn.s     fa4, ft4, fa3
                  srl          s1, s9, s7
                  fsqrt.s      fs6, ft1, rmm
                  add          t1, s10, a0
                  xori         t5, t1, 353
                  auipc        a5, 988681
                  fmv.w.x      fs11, sp
                  fsqrt.s      ft7, ft10
                  fsgnjn.s     ft1, fa6, fa4
                  rem          t4, s1, s2
                  fmv.w.x      fa1, t5
                  nop
                  xori         s10, s7, -465
                  fmul.s       fa2, fa0, fs6
                  slli         t1, s7, 22
                  srai         a7, a4, 31
                  fmv.x.w      s10, ft10
                  sra          tp, a3, s0
                  sll          t6, t5, t1
                  rem          gp, t5, a5
                  mul          a5, a5, zero
                  nop
                  div          a0, s2, s0
                  mulhu        a3, sp, a0
                  slt          s4, tp, s0
                  andi         a7, t4, 1913
                  or           a6, a7, a6
                  ori          t2, s5, -1320
                  fcvt.wu.s    sp, ft1, rtz
                  fcvt.s.w     ft3, zero
                  nop
                  fmin.s       fa4, fa6, ft8
                  fcvt.w.s     s2, ft9
                  fcvt.s.w     ft2, s9, rmm
                  fsub.s       fs6, fs4, ft2
                  sltu         t2, s3, a3
                  fsqrt.s      ft10, ft0
                  fmax.s       ft3, fs9, fs8
                  fsgnjx.s     fa3, fs11, ft9
                  andi         s2, a7, 1503
                  flt.s        s7, ft6, fa4
                  mulhu        s1, a6, t1
                  and          s9, s5, s6
                  fmv.x.w      a5, fa2
                  slt          s8, a2, tp
                  fcvt.s.wu    fa7, gp
                  fsub.s       ft0, fs10, ft1, rup
                  slti         s4, s3, 412
                  ori          s7, t0, -1445
                  auipc        s10, 873074
                  fcvt.s.wu    fs5, a6
                  flt.s        sp, fs2, ft0
                  remu         s6, s7, a6
                  sra          t5, a0, sp
                  nop
                  add          t2, a0, s2
                  fsgnjx.s     fs0, fs5, ft5
                  fmax.s       fs0, ft9, ft4
                  flt.s        a2, ft10, fs5
                  mulhu        a7, s7, s3
                  srli         s1, s6, 6
                  fcvt.s.wu    fs2, t1
                  fmax.s       ft2, fs9, ft1
                  fmul.s       ft4, fs0, fa3
                  fsub.s       ft8, fa5, ft2, rmm
                  fsgnjn.s     fa6, fa5, fs5
                  sltiu        sp, tp, -333
                  rem          zero, s7, t0
                  fmv.x.w      t0, fs2
                  srai         t1, a3, 14
                  nop
                  fmin.s       fa3, fa3, fa5
                  or           ra, s1, t0
                  fclass.s     s10, ft2
                  mulhsu       sp, s4, s2
                  fadd.s       ft1, ft0, ft0, rup
                  div          t2, s7, tp
                  fsgnj.s      ft1, fa5, fa0
                  srai         s6, a1, 15
                  sltiu        a3, t4, -489
                  ori          s10, s7, -1626
                  fmul.s       ft6, ft11, ft11, rtz
                  fmv.x.w      s1, fa7
                  lui          t1, 878370
                  fclass.s     a2, ft6
                  fcvt.s.w     fa3, sp
                  fmax.s       fa1, ft5, fa0
                  xor          t2, a5, s4
                  feq.s        a2, ft5, fs9
                  sltu         a6, tp, s11
                  fsgnjn.s     ft11, ft3, ft11
                  sltiu        ra, s3, 1891
                  srli         a5, a1, 3
                  fcvt.s.wu    fa7, t4, rne
                  andi         a4, a5, -538
                  sll          tp, s4, s4
                  addi         a1, tp, 932
                  ori          s10, zero, -458
                  fsgnjx.s     fs4, ft7, fs8
                  mulhu        t2, sp, tp
                  mulhu        s3, a1, s7
                  mulhsu       ra, sp, t0
                  sll          s2, gp, s11
                  srai         tp, gp, 2
                  fdiv.s       fa4, fa7, ft4, rne
                  ori          a0, a6, -483
                  fdiv.s       ft0, ft9, fs0, rne
                  nop
                  feq.s        t1, ft1, fa4
                  fcvt.w.s     t4, fs5
                  and          t4, s0, s7
                  fcvt.s.w     fs8, a3
                  fadd.s       fs0, fs0, ft2
                  fmv.w.x      fs3, s0
                  fcvt.w.s     s1, fs6, rne
                  lui          s10, 37276
                  srli         s4, t6, 26
                  fdiv.s       fs10, ft6, fs5
                  divu         s1, tp, s7
                  sub          a0, a3, a4
                  mulhu        a0, t2, sp
                  sltu         s2, t2, s0
                  fmv.w.x      ft4, t4
                  fsgnj.s      fa7, fa0, ft1
                  remu         s6, t5, s5
                  sltu         a4, s4, a7
                  fsqrt.s      fa0, fs9
                  mulh         a1, t1, a2
                  ori          s7, s3, 1679
                  mulhsu       zero, a3, t2
                  fmv.w.x      fa4, t2
                  addi         a2, a7, 978
                  div          s6, t6, s4
                  flt.s        t2, fa0, fs5
                  mulh         t5, gp, t6
                  div          ra, s8, a6
                  sll          a4, s11, s9
                  srai         a3, s2, 29
                  nop
                  divu         s3, a1, s6
                  divu         t2, t5, tp
                  add          a7, a0, t2
                  fsub.s       fa3, fs8, fs0, rup
                  nop
                  auipc        sp, 95192
                  rem          t4, t1, s8
                  fclass.s     t5, ft8
                  rem          ra, s8, s8
                  fcvt.w.s     t1, ft5
                  xor          a4, s7, s8
                  sll          s4, s10, a5
                  slti         s4, t5, 1599
                  divu         a6, a2, s10
                  sltiu        tp, s11, -1739
                  ori          a3, tp, -1572
                  feq.s        s4, fa5, fa3
                  fsgnj.s      fa6, fs2, fa3
                  fmv.x.w      ra, fs9
                  fsgnjx.s     ft7, fa5, fa4
                  fdiv.s       ft11, ft10, ft10, rdn
                  slti         a3, s0, -1227
                  addi         a1, t5, 1878
                  mul          s1, a2, s4
                  addi         a5, s0, -721
                  fmul.s       ft0, fs7, ft4, rmm
                  or           a3, s2, t2
                  srli         a6, s3, 30
                  divu         s3, s6, s7
                  lui          s8, 956963
                  or           a2, s8, t5
                  andi         sp, ra, -114
                  auipc        t6, 462079
                  fclass.s     a4, ft4
                  nop
                  feq.s        a7, ft1, fs11
                  and          tp, a1, gp
                  ori          t6, s11, 514
                  ori          a6, zero, 1310
                  slt          ra, a0, gp
                  mulh         a5, s4, s3
                  remu         t0, sp, a3
                  sll          a7, t2, s10
                  flt.s        t1, fa5, fa0
                  xori         a5, s5, 646
                  fsgnj.s      fa0, fs1, ft9
                  fcvt.wu.s    t3, ft6, rdn
                  srli         gp, a7, 4
                  mul          s9, t5, a4
                  remu         t4, t2, s7
                  flt.s        sp, fs0, fs10
                  mulhu        s8, t3, ra
                  fle.s        a0, fs2, fa7
                  slt          s3, s10, a1
                  sub          s9, s7, s7
                  fsub.s       fs7, fa2, ft6
                  srl          t3, zero, t2
                  sll          sp, tp, s2
                  slt          zero, s8, s3
                  mulh         s10, a6, t0
                  fmul.s       fa3, ft8, fs6
                  fsgnj.s      fa6, ft9, fa7
                  fmax.s       fs7, ft9, fa6
                  mulh         t3, s8, a3
                  fdiv.s       ft3, ft0, fs10, rdn
                  slti         ra, a3, 1947
                  divu         zero, s9, s9
                  rem          s3, s1, t1
                  xori         t1, s5, -694
                  fdiv.s       fs4, fa0, ft8, rmm
                  fadd.s       fs7, fs9, ft6
                  fcvt.wu.s    zero, ft9
                  fsub.s       fs4, fs10, fs11
                  andi         t4, t5, -387
                  remu         s3, t0, a4
                  fadd.s       fs4, fs7, ft0
                  fmv.w.x      ft4, t3
                  sra          a7, t1, tp
                  mulhsu       t0, s7, gp
                  fdiv.s       fa0, ft0, fa3, rmm
                  fsgnj.s      ft1, ft8, ft5
                  fdiv.s       fa4, ft0, ft1, rtz
                  slti         s6, s8, 1120
                  auipc        t5, 289280
                  or           sp, a0, t6
                  lui          a7, 232179
                  addi         s4, s3, 878
                  fle.s        a2, fa4, ft4
                  sub          s1, a0, s5
                  fmv.x.w      ra, fa5
                  fclass.s     a5, fs1
                  fsub.s       ft6, ft2, fs10
                  auipc        s8, 260793
                  fcvt.s.w     fs9, a1, rne
                  div          s4, s9, t2
                  fmv.x.w      t5, fa4
                  mulhu        a3, a5, s6
                  fadd.s       ft7, fa4, fs4, rmm
                  fmul.s       fs6, fs2, fa0, rne
                  fle.s        s8, fa0, ft8
                  fcvt.s.wu    ft6, s7
                  fsub.s       fs7, ft11, fa0, rmm
                  fcvt.wu.s    t2, fa3
                  fadd.s       ft9, ft1, ft8, rup
                  sltu         s2, a7, a1
                  fsgnjn.s     fs5, ft9, fa3
                  fsgnjn.s     fa2, fa7, ft6
                  fmul.s       fa3, fs3, ft0, rne
                  fadd.s       ft0, ft8, ft0, rdn
                  mulhsu       s2, a2, gp
                  add          a7, sp, a0
                  flt.s        a5, fs7, fs1
                  auipc        t4, 696509
                  div          t1, a5, t6
                  fcvt.wu.s    s4, fa0
                  fclass.s     a6, ft8
                  xor          ra, s9, a0
                  fsqrt.s      fs7, fs3
                  mulh         s8, s9, s4
                  fcvt.s.wu    fs6, a5, rmm
                  sub          s7, s2, s8
                  sub          a2, gp, ra
                  fsub.s       ft5, ft4, fs0
                  slti         s8, s2, 65
                  fsqrt.s      fs3, fa7, rne
                  fsgnjx.s     fa1, fs1, fs9
                  auipc        zero, 315432
                  slti         s7, ra, 1935
                  fmin.s       fs4, ft6, fa2
                  nop
                  sll          t4, t2, a2
                  slti         s4, t0, 1336
                  fle.s        s7, fs5, fs1
                  fcvt.s.w     fs3, a3, rtz
                  fsgnjx.s     ft5, ft9, fs9
                  sra          t6, a5, a4
                  rem          s8, t6, gp
                  srli         s3, s8, 16
                  addi         s10, tp, -472
                  fcvt.s.wu    fs2, a3
                  addi         s1, s4, 449
                  mul          sp, a1, t3
                  ori          s4, t2, -1930
                  rem          s10, t2, s1
                  or           s4, s4, a1
                  rem          a2, a0, a6
                  sra          s4, s5, ra
                  and          a2, sp, s11
                  xor          a5, t4, s2
                  slli         a7, a3, 4
                  fsgnj.s      fs0, fs6, ft9
                  fsgnjx.s     fs7, ft11, fs0
                  xori         s8, t2, -1513
                  fmul.s       fa3, ft4, fs1, rup
                  div          a5, t4, a5
                  sll          a3, a1, a5
                  fcvt.s.wu    fa1, a0, rmm
                  and          s1, t1, s4
                  fadd.s       fs4, ft9, fs9, rtz
                  fcvt.s.w     ft9, s8, rup
                  sub          sp, a7, s1
                  fmax.s       fa3, fs2, fa5
                  ori          a5, ra, 1853
                  srai         a4, a5, 17
                  fsgnjn.s     fs1, fs9, fs1
                  fsub.s       ft10, ft1, ft0
                  divu         a4, sp, a0
                  addi         s2, a5, -596
                  xor          a7, sp, a4
                  fsgnj.s      ft11, ft1, fa7
                  xori         a4, sp, 955
                  sra          a0, a6, s3
                  fsgnj.s      fs4, fa0, ft3
                  fsgnjx.s     ft7, ft9, fa5
                  fmv.x.w      s8, fs11
                  div          t2, a2, a2
                  remu         s7, s8, gp
                  srl          s3, a5, s2
                  srl          a4, zero, a2
                  fmv.x.w      s2, fa0
                  fsub.s       ft1, fs1, fs2, rdn
                  sltiu        s2, s2, -1698
                  lui          t1, 1029239
                  or           s9, s10, t2
                  fmul.s       fs4, ft5, ft7, rmm
                  fsgnjx.s     fs2, fs2, fs6
                  fcvt.s.w     fa5, a7, rne
                  fmv.w.x      ft7, a7
                  fdiv.s       ft11, ft1, fs4
                  fmul.s       fs10, fs1, fa6
                  mulhsu       a6, s9, a3
                  feq.s        a5, ft8, fa6
                  slli         sp, zero, 3
                  fsqrt.s      ft6, fa0, rne
                  rem          s2, tp, s5
                  and          s1, a1, s11
                  xor          gp, s1, t1
                  srai         a2, s2, 23
                  fmv.w.x      ft7, t4
                  fclass.s     gp, fs10
                  sltiu        s9, s3, -389
                  remu         a2, s1, s10
                  fsgnjx.s     ft7, ft7, fs5
                  sltiu        s4, a7, -147
                  and          s1, tp, a7
                  slti         t4, s8, 1845
                  fsqrt.s      ft1, ft1
                  feq.s        zero, fs8, ft8
                  sltiu        s1, a4, -38
                  add          a0, t6, t1
                  and          t5, zero, a5
                  fsgnjx.s     fa7, ft6, fs5
                  addi         tp, s9, 1139
                  fmin.s       fs1, ft3, fs11
                  divu         t1, zero, a6
                  fmax.s       ft4, ft10, ft9
                  fcvt.wu.s    s3, ft11
                  and          t6, t3, a0
                  fdiv.s       fs3, fa1, ft5
                  sll          gp, t6, ra
                  sub          t1, t6, a2
                  sub          gp, s4, sp
                  fmax.s       fa4, fs10, fs0
                  fsgnjn.s     ft7, fa1, ft2
                  fsqrt.s      ft11, fa5, rne
                  fcvt.wu.s    t2, fs11
                  flt.s        gp, fa3, fs0
                  feq.s        s10, fs6, fa1
                  fsgnjx.s     fa7, ft5, fa5
                  sll          t3, s8, s9
                  fmv.x.w      t2, ft11
                  fmin.s       fa4, fs1, ft9
                  fsqrt.s      fs5, fs11
                  fcvt.s.w     fs1, s0, rup
                  divu         t0, s9, t0
                  sltiu        zero, t2, 1966
                  slli         t0, t1, 29
                  mulh         s9, a3, s7
                  fsgnjx.s     fa4, ft10, fa3
                  and          tp, a2, zero
                  or           t1, a6, t2
                  remu         t1, s9, s0
                  fcvt.wu.s    s2, ft3
                  sub          t4, a1, s11
                  fsub.s       fa5, ft10, ft2
                  fadd.s       fa4, fs0, ft2, rup
                  sltu         ra, a5, gp
                  sub          ra, a5, t0
                  rem          t0, s3, s5
                  srai         t4, sp, 7
                  feq.s        tp, fa3, ft9
                  slt          a3, tp, s8
                  sra          a1, t3, t0
                  addi         a1, a3, -1307
                  lui          s8, 773362
                  sub          gp, s10, a1
                  xor          s1, t1, s5
                  fmax.s       fa4, fs2, ft6
                  sra          t6, t0, t5
                  fmul.s       fs6, fa7, ft8
                  addi         gp, tp, -1718
                  rem          zero, s11, a6
                  sltiu        tp, a4, 1117
                  slli         tp, ra, 22
                  fsub.s       fa7, fa4, fa7, rtz
                  and          a5, a0, sp
                  rem          t1, t1, s8
                  fle.s        s10, fs5, ft8
                  addi         a7, t3, 1480
                  srl          t3, tp, s7
                  add          s9, t4, sp
                  srai         t2, a3, 7
                  sltiu        s4, t3, -1680
                  sub          zero, t6, t4
                  lui          s6, 484510
                  sub          a3, t0, s7
                  sltu         s1, a2, a7
                  srl          gp, t3, tp
                  sub          t5, t3, t6
                  and          a2, a2, s8
                  addi         t5, s10, 941
                  andi         gp, t1, 1068
                  srl          a2, a7, s8
                  fdiv.s       ft9, ft4, fs0, rup
                  fmul.s       fs6, fs2, fs4, rne
                  slt          zero, s1, t3
                  add          s6, s5, s0
                  fmul.s       fa2, ft4, fa3, rdn
                  fsgnj.s      ft9, fs5, fs6
                  ori          t2, s9, 717
                  or           t3, a3, s4
                  sll          s4, s8, s2
                  fsgnjx.s     fa7, fs11, fa4
                  fmin.s       fs1, fs10, fs6
                  div          t5, s5, a6
                  add          s1, a7, t4
                  fle.s        s7, fs2, ft9
                  lui          s10, 92135
                  fmv.w.x      fs11, s6
                  rem          t2, s0, t3
                  fcvt.w.s     t6, fs1, rne
                  fdiv.s       fa0, ft7, fa7, rdn
                  nop
                  slt          s4, s11, s2
                  rem          s6, a1, s10
                  sra          t6, s11, t1
                  slti         a3, s6, -1921
                  fsqrt.s      ft4, fs8, rmm
                  nop
                  fmul.s       fa4, fs10, fs6, rup
                  remu         sp, s11, s4
                  fcvt.s.w     fa5, s7
                  fsqrt.s      fs9, fs6
                  ori          a6, s2, 801
                  xori         s3, s9, 240
                  divu         s7, s11, tp
                  fmul.s       ft5, ft11, fa5
                  sll          a6, t2, s11
                  fcvt.w.s     a3, ft0, rmm
                  sltiu        a5, t6, 54
                  srl          a7, gp, t5
                  fsqrt.s      fs2, ft6, rup
                  fle.s        s1, fs8, fa2
                  fsub.s       fs9, ft4, ft2, rdn
                  fsqrt.s      ft9, ft3
                  fcvt.s.w     ft8, gp
                  fclass.s     s2, fa1
                  sra          sp, gp, s4
                  slt          tp, s2, s0
                  or           a4, s4, a0
                  slt          s9, s3, t2
                  slli         a3, t0, 29
                  fsqrt.s      fa5, fs6, rdn
                  or           t4, s11, t1
                  fmv.w.x      ft1, a3
                  sltiu        t6, ra, -949
                  divu         t5, ra, a2
                  srl          tp, tp, t6
                  andi         s2, t3, 887
                  div          a1, a3, t2
                  srai         t0, t6, 8
                  sll          sp, tp, s1
                  srai         a0, a0, 11
                  slt          s8, t3, t2
                  slli         s6, a5, 19
                  slli         a3, sp, 29
                  mul          s2, t5, s7
                  fadd.s       fs4, fs3, fs5
                  lui          a0, 150482
                  fcvt.s.wu    fa5, s7
                  fmin.s       ft3, fa3, ft11
                  fcvt.wu.s    s4, fa0, rne
                  srai         s2, a5, 7
                  feq.s        sp, fs7, ft4
                  mul          s1, s8, s11
                  sltu         a0, s3, a2
                  fle.s        s7, ft6, ft0
                  xori         s3, s4, 1770
                  or           s4, t2, a7
                  sll          ra, t0, s9
                  fmul.s       fs6, fs2, ft4
                  rem          ra, t5, a0
                  fmv.x.w      a4, ft7
                  nop
                  fsgnj.s      ft6, ft3, fa2
                  divu         zero, s2, s8
                  fmv.w.x      fs8, a2
                  rem          s2, s11, a0
                  mulhsu       t5, t4, a3
                  fsqrt.s      fa5, fs7
                  sub          gp, s6, s4
                  srl          t0, t0, t2
                  sltiu        s6, s5, -1864
                  fcvt.s.wu    fa2, t6, rup
                  fsgnjn.s     fs2, fs11, fa4
                  fdiv.s       fa1, fs3, fs5, rmm
                  sll          s3, a7, ra
                  rem          a2, t0, s7
                  remu         t1, a7, s2
                  mul          s10, a2, zero
                  ori          t2, s11, 198
                  slli         a1, a6, 10
                  fmv.x.w      s10, ft8
                  fsgnjn.s     fs8, fa5, fa7
                  and          s2, sp, t4
                  nop
                  mul          s10, s6, s11
                  andi         t4, t5, 1163
                  fmin.s       ft8, fa6, ft5
                  fsgnj.s      fs1, fs7, fa2
                  fmin.s       fs3, ft1, fs3
                  sll          a2, t2, a3
                  mul          s2, s0, gp
                  slti         a3, a3, -1530
                  fadd.s       ft7, fs6, ft8
                  fclass.s     t2, ft9
                  mulh         t0, t2, t0
                  ori          s4, s2, 1025
                  fcvt.s.wu    fs2, t0, rdn
                  fmv.w.x      ft8, zero
                  fmv.w.x      ft4, s11
                  mulhu        gp, a6, s1
                  sra          t0, s10, tp
                  auipc        t1, 857588
                  srli         s9, s4, 30
                  slt          t5, t6, a3
                  rem          t6, s8, s7
                  fmv.x.w      ra, ft2
                  fcvt.wu.s    a6, ft11
                  srli         s1, ra, 6
                  fle.s        t6, fs9, fs0
                  fmax.s       ft5, fa7, fs1
                  sra          t4, a1, s0
                  sltu         s4, s2, a3
                  fcvt.s.w     fs4, a0
                  slti         tp, t0, 723
                  or           a0, a2, t5
                  sltu         s10, a4, a2
                  srli         s1, t1, 8
                  fmin.s       ft0, ft5, ft1
                  rem          a0, s1, t4
                  auipc        tp, 339671
                  srli         s4, a7, 25
                  srli         gp, a1, 0
                  mulhu        t0, s10, s3
                  sltiu        a0, zero, -1435
                  andi         s6, s5, 914
                  fcvt.s.wu    ft9, t5
                  fmv.x.w      s9, fa6
                  srai         t5, t1, 22
                  mulhu        sp, s2, s4
                  flt.s        s8, ft11, ft8
                  feq.s        a4, ft11, ft8
                  slt          s3, s10, ra
                  sltiu        a3, s2, -204
                  slt          gp, t5, t4
                  sltu         t4, t6, s1
                  fmv.w.x      ft4, tp
                  slt          a5, s5, s10
                  mulhu        a1, s0, sp
                  remu         a1, s11, s6
                  rem          a7, gp, a0
                  fclass.s     t6, fa6
                  la x8, test_done
                  jalr x0, x8, 0
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
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_2:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_3:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_4:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_5:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_6:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_7:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_8:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_9:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_10:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_11:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_12:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_13:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_14:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_15:
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

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
                  addi x21, x21, -4
                  sw  x27, (x21)
                  add x27, x21, zero
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
                  add x21, x27, zero
                  csrr x14, 0x341 # MEPC
                  csrr x14, 0x342 # MCAUSE
                  li x22, 0x3 # BREAKPOINT
                  beq x14, x22, ebreak_handler
                  li x22, 0x8 # ECALL_UMODE
                  beq x14, x22, ecall_handler
                  li x22, 0x9 # ECALL_SMODE
                  beq x14, x22, ecall_handler
                  li x22, 0xb # ECALL_MMODE
                  beq x14, x22, ecall_handler
                  li x22, 0x1
                  beq x14, x22, instr_fault_handler
                  li x22, 0x5
                  beq x14, x22, load_fault_handler
                  li x22, 0x7
                  beq x14, x22, store_fault_handler
                  li x22, 0xc
                  beq x14, x22, pt_fault_handler
                  li x22, 0xd
                  beq x14, x22, pt_fault_handler
                  li x22, 0xf
                  beq x14, x22, pt_fault_handler
                  li x22, 0x2 # ILLEGAL_INSTRUCTION
                  beq x14, x22, illegal_instr_handler
                  csrr x22, 0x343 # MTVAL
                  1: la x8, test_done
                  jalr x1, x8, 0

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
                  la x8, write_tohost
                  jalr x0, x8, 0

instr_fault_handler:
                  add x27, x21, zero
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
                  add x21, x27, zero
                  lw  x27, (x21)
                  addi x21, x21, 4
                  mret

load_fault_handler:
                  add x27, x21, zero
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
                  add x21, x27, zero
                  lw  x27, (x21)
                  addi x21, x21, 4
                  mret

store_fault_handler:
                  add x27, x21, zero
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
                  add x21, x27, zero
                  lw  x27, (x21)
                  addi x21, x21, 4
                  mret

ebreak_handler:   
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x27, x21, zero
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
                  add x21, x27, zero
                  lw  x27, (x21)
                  addi x21, x21, 4
                  mret

illegal_instr_handler:
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x27, x21, zero
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
                  add x21, x27, zero
                  lw  x27, (x21)
                  addi x21, x21, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x14, 0x300 # MSTATUS;
                  csrr  x14, 0x304 # MIE;
                  csrr  x14, 0x344 # MIP;
                  csrrc x14, 0x344, x14 # MIP;
                  add x27, x21, zero
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
                  add x21, x27, zero
                  lw  x27, (x21)
                  addi x21, x21, 4
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
