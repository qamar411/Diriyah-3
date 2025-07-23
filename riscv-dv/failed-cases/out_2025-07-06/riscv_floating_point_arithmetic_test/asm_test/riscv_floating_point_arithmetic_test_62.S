.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x2, h0_start
jalr x0, x2, 0
h0_start:
                  li x16, 0x40001120
                  csrw 0x301, x16
kernel_sp:        
                  la x11, kernel_stack_end

trap_vec_init:    
                  la x16, mtvec_handler
                  ori x16, x16, 0
                  csrw 0x305, x16 # MTVEC

mepc_setup:       
                  la x16, init
                  csrw 0x341, x16

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x16, 0x3800
                  csrw 0x300, x16 # MSTATUS
                  li x16, 0x0
                  csrw 0x304, x16 # MIE
                  mret
init:             
                  li x16, 2139095039
                  fmv.w.x f0, x16
                  li x16, 1397230416
                  fmv.w.x f1, x16
                  li x16, 7317385
                  fmv.w.x f2, x16
                  li x16, 2147483648
                  fmv.w.x f3, x16
                  li x16, 0
                  fmv.w.x f4, x16
                  li x16, 4147015806
                  fmv.w.x f5, x16
                  li x16, 2143289344
                  fmv.w.x f6, x16
                  li x16, 4286578687
                  fmv.w.x f7, x16
                  li x16, 2139095040
                  fmv.w.x f8, x16
                  li x16, 0
                  fmv.w.x f9, x16
                  li x16, 2139095040
                  fmv.w.x f10, x16
                  li x16, 2139095040
                  fmv.w.x f11, x16
                  li x16, 0
                  fmv.w.x f12, x16
                  li x16, 2154789070
                  fmv.w.x f13, x16
                  li x16, 2139095041
                  fmv.w.x f14, x16
                  li x16, 2139095039
                  fmv.w.x f15, x16
                  li x16, 0
                  fmv.w.x f16, x16
                  li x16, 2139095041
                  fmv.w.x f17, x16
                  li x16, 2139095041
                  fmv.w.x f18, x16
                  li x16, 2143289344
                  fmv.w.x f19, x16
                  li x16, 2293630013
                  fmv.w.x f20, x16
                  li x16, 2139095039
                  fmv.w.x f21, x16
                  li x16, 0
                  fmv.w.x f22, x16
                  li x16, 2139095041
                  fmv.w.x f23, x16
                  li x16, 2143289344
                  fmv.w.x f24, x16
                  li x16, 2139095040
                  fmv.w.x f25, x16
                  li x16, 1556410032
                  fmv.w.x f26, x16
                  li x16, 2154792547
                  fmv.w.x f27, x16
                  li x16, 2139095041
                  fmv.w.x f28, x16
                  li x16, 2139095039
                  fmv.w.x f29, x16
                  li x16, 2139095040
                  fmv.w.x f30, x16
                  li x16, 4266689
                  fmv.w.x f31, x16
                  fsrmi 3
                  li x0, 0x3
                  li x1, 0xf8426b42
                  li x2, 0xf9972418
                  li x3, 0x80000000
                  li x4, 0x0
                  li x5, 0x0
                  li x6, 0xfca94839
                  li x7, 0xaed15ea8
                  li x8, 0x4c947ecc
                  li x9, 0xf4c40490
                  li x10, 0x80000000
                  li x12, 0xa
                  li x13, 0x0
                  li x14, 0x28d47f78
                  li x15, 0x80000000
                  li x16, 0xf
                  li x17, 0x0
                  li x18, 0xf7451ce8
                  li x19, 0x80036a18
                  li x20, 0x4d2f9efc
                  li x21, 0x80000000
                  li x22, 0xffce1833
                  li x23, 0x6906b83d
                  li x24, 0xd
                  li x25, 0x80000000
                  li x26, 0xb
                  li x27, 0x0
                  li x29, 0x5
                  li x30, 0xd29a3889
                  li x31, 0x0
                  la x28, user_stack_end
main:             sra          s7, s6, zero
                  rem          s5, t5, s9
                  fcvt.s.w     fs3, a3, rtz
                  feq.s        s11, fs0, fa6
                  srl          s4, s4, a4
                  flt.s        s5, fs2, fa1
                  srl          s9, s4, t5
                  addi         zero, a1, -545
                  or           a2, t2, s4
                  fsgnj.s      fs3, fs7, fs6
                  mulhsu       ra, s10, t3
                  and          s11, t5, sp
                  xori         gp, s10, 1672
                  or           t2, s3, s2
                  or           s9, s0, s10
                  auipc        s10, 472598
                  slli         tp, s5, 23
                  xori         s11, zero, 168
                  lui          s3, 17413
                  divu         s11, s5, gp
                  fcvt.w.s     gp, fs0
                  fmax.s       fs9, fs5, fa0
                  lui          s6, 686387
                  sub          a3, t0, a4
                  fmul.s       fa1, ft4, fa0, rtz
                  remu         t0, s5, t0
                  fcvt.s.wu    fs0, s2, rne
                  fdiv.s       fa1, fs5, fs7
                  div          a6, s0, ra
                  fdiv.s       fs7, ft3, ft1, rmm
                  or           a7, s8, s9
                  fmin.s       fa4, fa0, fs1
                  sltiu        t5, s0, -3
                  fcvt.wu.s    s2, fa4
                  sltiu        a3, a7, 680
                  fsgnjx.s     fs1, ft5, fa1
                  fcvt.w.s     a2, ft3
                  flt.s        s0, ft11, ft11
                  mulhu        a3, s9, s7
                  fsgnjx.s     ft7, fs9, ft8
                  rem          s11, s8, s2
                  fsqrt.s      fs1, ft7
                  divu         s1, a2, a0
                  mulh         s4, s10, a3
                  fsgnjx.s     ft0, ft11, ft3
                  fmv.x.w      a6, fs9
                  fcvt.s.wu    fs7, a5, rmm
                  ori          t4, sp, -919
                  fmv.w.x      fa5, t1
                  addi         ra, t0, 1717
                  and          s3, zero, s2
                  fmul.s       fa0, fs5, ft11
                  fcvt.w.s     s10, ft4, rne
                  fdiv.s       ft7, ft9, ft5, rup
                  fclass.s     a4, fs0
                  addi         t4, a0, -249
                  slli         t4, a6, 22
                  fsgnj.s      fa7, fs10, fa3
                  nop
                  and          s3, t1, s0
                  fsgnjx.s     fa3, ft6, fs4
                  fmin.s       fs2, ft8, ft10
                  fmv.x.w      a6, fa5
                  fmv.w.x      fs8, s3
                  xor          zero, t0, s11
                  fle.s        zero, ft8, ft5
                  rem          s6, a6, a3
                  ori          s9, sp, 1740
                  srai         s5, tp, 13
                  fmin.s       fs10, fs8, fs2
                  fmv.w.x      fs3, s1
                  sra          t6, s4, a5
                  fsgnj.s      ft11, fs11, fs0
                  fmin.s       ft6, fs8, fs8
                  fsgnjx.s     ft8, fa4, ft4
                  xori         t4, a0, 178
                  fcvt.s.wu    fs7, a1
                  nop
                  fclass.s     s1, ft6
                  mulhu        gp, s3, sp
                  fsgnjn.s     fs3, ft5, ft0
                  divu         a6, s3, s3
                  ori          a3, s6, 1992
                  srli         a6, a5, 14
                  fsgnjn.s     fa0, fs8, fs3
                  mulh         a0, t6, s6
                  sll          t2, a5, zero
                  srli         s5, s10, 30
                  mul          t6, s4, a6
                  fsgnj.s      fa2, fa5, ft3
                  srai         a3, t1, 27
                  div          t2, s10, a5
                  xori         s4, a0, -67
                  fmv.w.x      fs11, sp
                  fmul.s       ft8, ft7, fa5, rne
                  fadd.s       fa4, fs8, fa1
                  sltu         s2, s2, a3
                  nop
                  div          s4, zero, s1
                  or           t1, a5, a4
                  or           t1, a3, s5
                  slli         zero, s3, 19
                  fsgnj.s      fs6, fs10, fs9
                  fmul.s       fa5, ft6, ft8, rmm
                  slti         tp, zero, -1923
                  sra          t6, s10, t1
                  mulh         a7, s10, s7
                  srl          s1, zero, t6
                  sub          tp, t3, a4
                  fsgnj.s      fs5, fs7, fs7
                  fcvt.s.w     fs1, t4, rdn
                  andi         tp, t1, -934
                  divu         s4, a5, s4
                  sra          a3, ra, a3
                  ori          t0, gp, 809
                  fle.s        s8, fa0, ft10
                  slti         s4, a5, -869
                  fcvt.s.w     fs3, s11, rtz
                  div          a0, a3, s11
                  fsgnjx.s     fa5, ft5, fa0
                  fmul.s       fs10, fs11, ft3, rtz
                  xor          a6, t4, t5
                  feq.s        s9, fs10, ft7
                  ori          s2, s2, 1865
                  andi         s7, s5, -1155
                  fsgnjn.s     fs6, ft0, fs4
                  feq.s        s4, fs9, fs9
                  srl          a3, t0, t3
                  fadd.s       fa3, fs3, ft10
                  srai         a7, a1, 14
                  mulhu        s0, ra, s8
                  fcvt.s.w     fa4, s0
                  srl          a3, s9, t5
                  nop
                  fmax.s       fs11, ft0, fa1
                  feq.s        s1, fs0, ft5
                  andi         gp, a4, -71
                  fadd.s       fs3, fs2, fs1
                  fmv.w.x      fa0, s9
                  mul          s9, t5, gp
                  fsub.s       ft2, fa6, fs4, rup
                  auipc        s4, 462259
                  mulh         a0, t0, a0
                  remu         s1, s5, a7
                  slti         t4, t0, -1945
                  andi         t2, ra, -1724
                  srl          a3, a0, s0
                  feq.s        t6, fs8, fa2
                  flt.s        t6, fs11, fa7
                  lui          s2, 28828
                  auipc        tp, 790899
                  fadd.s       fs2, ft3, fs5
                  fmin.s       ft0, fs5, ft5
                  add          a6, sp, s6
                  ori          a3, a1, -1254
                  flt.s        s3, ft4, ft0
                  mul          s1, s7, s9
                  sub          t4, a4, s8
                  sltiu        s4, t1, 879
                  flt.s        a3, ft2, fa0
                  mulhsu       t5, s11, t4
                  srl          s6, t4, t1
                  lui          t1, 423545
                  fmin.s       fa5, fs3, fs7
                  flt.s        t5, ft5, ft5
                  sltu         a6, s4, zero
                  fclass.s     tp, fs3
                  add          s10, a7, a4
                  srl          s6, a3, s10
                  xori         gp, s4, 1237
                  slt          s9, t2, t1
                  fcvt.s.w     fs1, s5, rmm
                  fadd.s       ft5, fa2, ft7, rtz
                  fle.s        s8, fa7, fs5
                  sra          s7, s4, s2
                  flt.s        s0, ft11, ft9
                  fsgnjn.s     fs4, ft3, fa4
                  ori          s8, a3, 814
                  fsub.s       fs6, ft10, fs2, rup
                  fmin.s       fa5, ft3, fs8
                  fsgnjn.s     fs5, fs11, ft1
                  mul          s6, tp, zero
                  fdiv.s       ft2, fs4, fa5
                  ori          a2, a4, -1923
                  srli         s5, s10, 27
                  fsqrt.s      ft8, fa4
                  fsqrt.s      fa5, ft9
                  auipc        s9, 725523
                  and          gp, t5, s9
                  fcvt.wu.s    s5, ft3
                  add          a7, a6, s11
                  fsgnj.s      fs10, fa7, fa6
                  fmax.s       fa1, fs0, fs11
                  slti         t6, s5, 909
                  divu         t6, s4, sp
                  lui          t6, 505994
                  fcvt.wu.s    s2, fs6
                  fsgnjn.s     ft7, ft5, ft5
                  and          zero, s4, s1
                  slli         s2, t6, 11
                  and          s8, a5, sp
                  srli         a4, s3, 9
                  slti         a5, sp, -1761
                  ori          a2, t1, 595
                  add          a2, a0, sp
                  fadd.s       ft7, fa6, fs6, rmm
                  fcvt.s.wu    ft9, a0, rup
                  slt          t1, a1, s3
                  ori          a7, s2, 459
                  addi         a5, a0, -937
                  srl          t5, t3, ra
                  srli         a2, gp, 13
                  xor          s4, t3, a1
                  or           s8, t1, a2
                  fcvt.s.w     ft1, s10, rtz
                  xori         s7, a1, 1336
                  sll          s6, a5, a5
                  mulhu        s4, s2, s1
                  slti         s8, t1, 253
                  fmv.x.w      a6, fs5
                  xori         s6, s11, 833
                  fcvt.s.w     fa5, a2, rup
                  flt.s        t6, fa0, fa6
                  srli         t4, a3, 6
                  fsgnjn.s     ft8, ft10, fs7
                  slti         a7, gp, 1522
                  sra          s1, a7, t5
                  mulh         gp, s7, t0
                  fcvt.w.s     zero, ft8
                  fmul.s       fa6, fa3, fs4, rup
                  remu         s3, s7, gp
                  fmax.s       fs10, fs8, fa6
                  fcvt.s.w     fa7, s8
                  sra          s2, t5, s4
                  mulhu        s5, a2, s0
                  remu         a4, s3, t1
                  flt.s        zero, ft9, ft5
                  mulh         a3, s4, t6
                  fmv.x.w      tp, fs2
                  mulhu        s3, s7, s7
                  fsgnj.s      fa6, fs2, fs5
                  srl          s1, s5, a7
                  srai         s8, t4, 17
                  mulh         s8, t4, a7
                  fmin.s       fs6, ft3, fa3
                  fclass.s     gp, ft7
                  fmv.x.w      a6, ft9
                  lui          zero, 507369
                  fmul.s       ft0, fa1, ft5, rmm
                  sll          t6, t5, sp
                  mulhsu       a5, a4, t2
                  sub          a4, s9, gp
                  sub          s7, s5, zero
                  srl          s5, s11, s4
                  sra          tp, tp, zero
                  slti         t6, s10, -355
                  addi         s1, t6, 145
                  fcvt.wu.s    s0, ft0, rne
                  fmul.s       fa3, fs5, fs2
                  fsgnjx.s     fa7, fs11, fa2
                  divu         s6, s11, s8
                  slt          t0, s9, a5
                  andi         t0, s5, 246
                  fcvt.s.w     fa3, gp
                  fsgnjn.s     fs3, fs7, fa6
                  fsgnjn.s     fs0, fa5, fa2
                  srl          a4, t5, s8
                  xori         s6, ra, -1563
                  fmax.s       ft3, fs3, fs1
                  fmv.x.w      t5, fa5
                  fcvt.w.s     s10, fa7, rtz
                  rem          s3, t2, ra
                  srli         s0, s0, 6
                  divu         zero, a2, t1
                  fmin.s       fa5, fa5, fa2
                  srl          s8, tp, a6
                  slli         a7, tp, 18
                  ori          s3, sp, 155
                  fsgnj.s      ft10, fs5, ft5
                  mul          s10, gp, tp
                  or           s6, a6, s11
                  flt.s        s8, ft9, ft7
                  ori          t5, t2, 1031
                  lui          s6, 403045
                  fsqrt.s      fs10, ft3
                  div          a0, sp, s2
                  andi         s2, s10, -1202
                  or           t2, t1, s8
                  feq.s        s9, fs1, ft3
                  ori          s3, a7, 1408
                  lui          s11, 277788
                  fle.s        a3, fa3, fs5
                  fmin.s       fs10, ft9, fs11
                  fdiv.s       fa3, ft2, ft11
                  ori          a3, s11, -1533
                  fmv.x.w      t1, ft10
                  srli         s4, s4, 24
                  fsqrt.s      fa2, fa3, rup
                  nop
                  fcvt.wu.s    s4, fa0
                  mul          a5, a7, s7
                  fmax.s       ft1, ft9, fs11
                  srl          s5, s4, a6
                  fmax.s       fs11, ft9, fs7
                  fmin.s       fs8, ft9, ft10
                  rem          a7, t5, t5
                  slti         t4, t1, 276
                  add          s7, s3, a1
                  slt          a6, t4, a0
                  srai         s3, s8, 9
                  add          a3, s0, s9
                  slt          t4, s6, s3
                  fcvt.s.wu    fa5, s6, rup
                  fcvt.w.s     s9, ft5
                  xori         t6, s6, -278
                  auipc        s7, 259732
                  fclass.s     ra, fa0
                  fsgnjx.s     ft9, ft7, ft3
                  fmul.s       ft0, fs7, ft9
                  fmax.s       fs2, fa1, ft9
                  div          t1, a2, t1
                  div          t1, s4, s8
                  fdiv.s       ft6, ft6, ft0, rdn
                  fsqrt.s      fs4, fs10, rtz
                  fsgnj.s      ft6, ft10, ft11
                  fmul.s       ft0, fs8, ft3, rmm
                  slti         a3, a3, 354
                  ori          t1, s7, 1423
                  fadd.s       fa4, ft2, fs1
                  srai         a5, s11, 14
                  auipc        t5, 808767
                  sltu         a2, a2, s11
                  fsgnjx.s     fs8, fs9, ft2
                  fmv.w.x      fs8, t0
                  fsgnjx.s     fs8, fs3, ft3
                  fcvt.w.s     s1, fa4
                  srai         s9, a6, 14
                  slti         t1, sp, -890
                  slti         t0, t6, -594
                  andi         s7, s4, 1979
                  ori          t5, a6, 150
                  srli         s5, a0, 2
                  fdiv.s       ft7, fa6, fs2
                  fdiv.s       fs11, ft4, ft1, rtz
                  fcvt.s.w     ft0, s1, rne
                  fle.s        s9, fs10, fa4
                  slti         s2, s1, 1850
                  mulhsu       s0, s2, gp
                  auipc        tp, 72370
                  sra          a5, t3, a1
                  srai         s10, a7, 13
                  sll          a3, gp, a4
                  slti         gp, s11, 26
                  divu         a4, s5, a4
                  mulh         a5, s1, t0
                  fmin.s       fa0, fa3, fs5
                  fmv.x.w      t2, ft11
                  rem          tp, s9, s0
                  fsqrt.s      ft0, fs7, rdn
                  lui          zero, 287425
                  sltiu        s4, zero, -1494
                  fsgnjx.s     fs3, fa1, ft11
                  remu         a2, t4, a3
                  sll          s4, t5, s9
                  fmv.w.x      fa3, t6
                  div          s1, t1, s6
                  flt.s        a5, fs9, ft2
                  fsqrt.s      fs3, ft9, rup
                  srli         t4, a5, 13
                  xori         s4, s6, 1265
                  fmv.w.x      ft3, a1
                  mul          s8, s7, tp
                  fmv.w.x      fa2, t5
                  srl          s6, a3, s5
                  fsqrt.s      fa7, fa5, rmm
                  sub          s7, s11, s2
                  sltu         s9, s2, s6
                  mulhsu       s11, s10, s2
                  addi         s3, s10, -1269
                  mulh         s7, a6, s1
                  srl          t0, t6, t5
                  ori          s11, s11, -1261
                  ori          s9, tp, 1019
                  and          ra, a6, s2
                  auipc        t0, 157395
                  divu         s2, t1, tp
                  remu         s2, s4, s4
                  fsqrt.s      ft10, fs4, rmm
                  auipc        t2, 573328
                  fle.s        s5, fs3, fs4
                  fclass.s     s8, fs9
                  fcvt.s.wu    fs10, s11
                  sra          tp, t0, a1
                  fmv.w.x      fa3, a5
                  fle.s        a2, fs6, fa5
                  fcvt.wu.s    s9, ft1
                  slti         s4, s9, 1534
                  auipc        s8, 887283
                  sltiu        s9, t0, 281
                  fmax.s       fa5, ft9, fs10
                  fcvt.s.wu    ft4, tp, rtz
                  lui          a6, 506254
                  mulhsu       tp, s10, s7
                  srai         t6, zero, 29
                  ori          s8, s10, -1950
                  lui          s6, 182287
                  and          s3, a6, s6
                  remu         t2, s0, s5
                  fcvt.wu.s    gp, fa1
                  mulhsu       s8, t2, s2
                  sub          a2, a4, a6
                  slli         ra, s7, 2
                  sub          a5, a2, t1
                  sltiu        zero, zero, 1290
                  mulhu        tp, sp, a6
                  fmv.x.w      a2, ft9
                  fmul.s       ft10, ft0, ft10
                  fsgnj.s      fs4, fa4, ft9
                  divu         t1, gp, a5
                  fcvt.w.s     a7, fa2, rup
                  auipc        tp, 1034439
                  or           t4, s1, gp
                  feq.s        t4, ft0, ft2
                  srli         tp, s6, 15
                  fmax.s       fs2, ft10, fs7
                  fdiv.s       ft0, fa2, fa4
                  or           s11, t0, s2
                  div          s2, a3, a5
                  lui          a5, 383629
                  srli         a3, s11, 8
                  mulh         t4, s6, zero
                  slti         s4, a3, 1347
                  sra          s3, s3, a6
                  div          s3, a7, t5
                  mul          s8, a1, a2
                  flt.s        t6, fs1, fs2
                  add          a4, a6, s4
                  mulhsu       s4, zero, s8
                  slti         s1, t4, -503
                  fcvt.w.s     t6, fs3, rup
                  xori         s6, s9, -1905
                  mulhsu       a3, a6, s1
                  mulhu        t2, sp, s9
                  fcvt.s.wu    ft7, t2
                  flt.s        a7, fs3, fs1
                  rem          ra, a7, ra
                  divu         s4, s6, s1
                  fmin.s       fs9, fa7, fa6
                  add          s7, a3, t0
                  fmax.s       ft8, fa2, ft6
                  flt.s        tp, ft0, ft0
                  flt.s        ra, ft5, fs1
                  sltu         t1, a7, s10
                  sra          a0, t1, a1
                  srai         a7, s2, 8
                  rem          a6, a2, a6
                  addi         t6, s7, -423
                  xori         a6, s0, -954
                  fclass.s     a5, fa3
                  fcvt.w.s     a4, ft2
                  fsqrt.s      ft0, ft9, rdn
                  sltu         s4, s0, a1
                  fmax.s       fs10, ft7, fa2
                  and          t1, t0, a2
                  slt          s0, ra, ra
                  fsqrt.s      fs1, fa1
                  srai         ra, a3, 23
                  fcvt.w.s     a6, ft2
                  slt          t4, a7, a1
                  slt          a7, tp, t2
                  fle.s        s11, fs9, fa5
                  remu         a0, a3, t5
                  srai         s7, t4, 28
                  slli         gp, a1, 28
                  mul          s2, s11, s10
                  sra          s1, s3, tp
                  mulh         a0, t6, a6
                  flt.s        t0, ft6, fs0
                  fsqrt.s      ft3, fa4
                  fmul.s       fs2, fa6, fa1, rne
                  fmv.w.x      fa4, a4
                  lui          a5, 735519
                  divu         ra, a4, s0
                  xori         a6, s7, 797
                  slt          t2, t6, a5
                  sll          t0, s6, tp
                  sltu         s8, a2, ra
                  rem          a0, s4, s11
                  fsgnj.s      ft6, fa2, fa3
                  fcvt.w.s     s0, ft6
                  xori         s5, t3, -204
                  fmax.s       ft8, ft10, fs11
                  xori         a4, s5, -1104
                  fsgnjn.s     fs6, fs0, fa7
                  sra          t1, ra, a3
                  srli         a5, s9, 12
                  fadd.s       fa7, fs5, ft4, rmm
                  remu         a3, s3, a7
                  fcvt.wu.s    s8, fs8, rmm
                  fcvt.w.s     a2, ft5
                  slli         tp, s4, 9
                  fsqrt.s      fs10, ft6, rmm
                  auipc        s9, 704253
                  mul          t5, s1, s11
                  slli         s9, t0, 25
                  srli         tp, s11, 24
                  xori         s3, zero, 945
                  slli         a2, t2, 28
                  mulhsu       s11, a0, s1
                  xori         s8, s6, 108
                  fsub.s       ft2, ft9, fa6, rmm
                  add          s3, s2, s3
                  ori          s0, t3, -670
                  srli         s9, a7, 30
                  fmul.s       fs1, ft8, ft3, rmm
                  sltu         s2, t5, a5
                  div          s3, a3, t3
                  and          s8, gp, s8
                  fmv.w.x      fs8, s6
                  ori          t5, s1, 1863
                  fcvt.s.wu    fa1, s1
                  fmin.s       fs1, fs7, fa5
                  fcvt.w.s     s3, ft0, rne
                  flt.s        a2, fs9, fs3
                  fcvt.wu.s    a0, fa0, rtz
                  srli         t4, a5, 17
                  sub          s4, a0, a1
                  fcvt.w.s     a3, fa4
                  addi         t0, s2, 1720
                  and          s6, tp, s6
                  srl          t2, s1, ra
                  addi         s2, a5, 824
                  slti         s6, s10, 667
                  xor          s4, s7, tp
                  fmin.s       fa2, fs3, fa7
                  auipc        s5, 83551
                  and          t5, s2, ra
                  fle.s        a3, ft5, fa4
                  fcvt.s.wu    ft4, t0, rne
                  feq.s        s10, fs3, fs9
                  fdiv.s       fa1, ft0, fs3, rtz
                  xori         a6, sp, 1838
                  nop
                  fle.s        s2, ft2, ft7
                  mulh         a0, a4, s5
                  mulhsu       s0, t3, s5
                  fmv.x.w      s2, ft10
                  fsgnjn.s     fa1, fs6, fa4
                  divu         a2, a7, s8
                  sltiu        t2, t2, 205
                  sltiu        zero, s5, 1427
                  auipc        s0, 324987
                  fmul.s       fs7, fs2, ft2
                  remu         a7, s9, s5
                  fle.s        s1, fa6, fs10
                  slt          s8, s11, t3
                  slli         t4, s11, 0
                  andi         s10, a5, 527
                  and          t2, t0, sp
                  rem          s6, s7, t4
                  mulh         s7, a6, t2
                  sltiu        s4, t4, -1934
                  fsub.s       fs0, fs5, fa5
                  fsqrt.s      fs9, fs7, rtz
                  fadd.s       fa3, ft5, fa4, rtz
                  slti         t2, t4, 1126
                  sltu         tp, s11, sp
                  fcvt.s.wu    fs2, s10, rne
                  fcvt.s.wu    fs8, t5
                  sub          a7, t4, t2
                  fle.s        t4, ft4, fs3
                  fmv.x.w      a3, ft4
                  fsqrt.s      ft10, ft5
                  sub          a6, t3, t1
                  mulhu        s0, t4, a7
                  fmul.s       fa4, fa6, fa7
                  fcvt.s.wu    fs6, a4, rmm
                  sltu         s11, t6, a3
                  slt          a5, s2, a6
                  fmv.w.x      fs7, t1
                  mul          t2, s0, s10
                  slt          a6, s11, ra
                  flt.s        tp, fs7, ft10
                  sltu         a7, sp, t4
                  flt.s        a5, fa7, fs3
                  auipc        a6, 733474
                  fmv.x.w      a2, fa7
                  fdiv.s       ft2, fs11, fs4
                  add          a5, a7, t2
                  fcvt.w.s     s9, fs8, rdn
                  fmv.w.x      fa7, s11
                  add          a2, zero, s1
                  fsub.s       fa7, ft1, ft0, rmm
                  slti         s5, a6, -1597
                  slti         s4, t0, 814
                  sltiu        gp, t5, 1069
                  fmv.x.w      t0, fa2
                  fadd.s       fa3, fs6, fs8, rdn
                  andi         s0, t3, 4
                  fmax.s       fa4, fs11, ft3
                  lui          s7, 540654
                  fclass.s     t4, fa0
                  fsgnj.s      fs7, fa3, fa0
                  xori         zero, s6, -961
                  slli         s8, a1, 23
                  mulh         s10, s10, s1
                  fdiv.s       fs3, fa6, fa0, rne
                  mul          t5, s8, t3
                  fmv.x.w      s0, fs6
                  fclass.s     s7, fs7
                  fsqrt.s      ft10, fa2, rmm
                  add          ra, a3, t2
                  slti         s10, zero, 114
                  fdiv.s       fs1, ft8, ft0
                  fmin.s       ft11, fs9, fa7
                  fle.s        s3, ft10, ft6
                  fdiv.s       fs0, fs0, fa5
                  fclass.s     s11, fs9
                  rem          t1, sp, s0
                  add          a6, s9, s11
                  addi         a3, zero, -1918
                  fmv.x.w      tp, fa7
                  slli         t2, t0, 17
                  fmv.x.w      s4, fs2
                  ori          a0, s11, -1064
                  srli         t2, a3, 0
                  fsgnjn.s     fs2, fs10, fa1
                  fmax.s       fs6, fs8, fa2
                  sll          s10, a0, t3
                  lui          t5, 518454
                  fmul.s       fs4, ft6, ft1, rup
                  xor          s8, a4, zero
                  div          s1, s9, t0
                  fsgnjn.s     ft5, fa2, fs4
                  slt          t1, a6, a7
                  flt.s        ra, ft5, ft4
                  sra          t2, s8, t4
                  fcvt.s.w     fs4, a3
                  or           a0, t3, a2
                  fcvt.w.s     s2, ft1
                  ori          a0, t5, 1049
                  mulh         a6, a7, t2
                  fsgnj.s      fs8, ft2, ft6
                  sltiu        a4, a5, -1218
                  fdiv.s       ft3, fa0, ft4
                  mulh         s11, s10, tp
                  sltiu        s9, t4, 929
                  fsgnjx.s     fs7, fa1, ft5
                  fle.s        s4, ft0, fa7
                  nop
                  srai         a7, t1, 27
                  fmax.s       fs6, ft9, fs6
                  mulh         a3, a6, s7
                  fmax.s       fs3, fs9, fs11
                  fsgnjx.s     fa6, fs4, ft6
                  fcvt.wu.s    t0, fs8, rmm
                  remu         s0, t1, s8
                  andi         s3, ra, -476
                  rem          s3, s0, ra
                  fmax.s       fs1, fa7, fs11
                  xor          t6, t2, a4
                  mulhu        s11, s7, a1
                  fsgnjx.s     fs8, fs3, fs1
                  divu         s0, s2, s3
                  andi         t1, t4, -130
                  fsgnjn.s     ft8, fs8, ft2
                  div          t2, s1, t3
                  fmv.x.w      a0, fs5
                  mulhu        s5, s8, zero
                  lui          ra, 934393
                  fsqrt.s      fs7, ft5
                  nop
                  slti         gp, a4, 1689
                  and          gp, t5, s1
                  sll          t5, sp, s4
                  fmul.s       ft10, fs10, fa6
                  fsgnjn.s     fs8, fs9, fs7
                  ori          a5, a7, 78
                  fle.s        s7, fs11, fs3
                  fsgnjn.s     ft10, ft11, ft5
                  srai         a2, a5, 23
                  fmv.x.w      zero, fa2
                  fmax.s       fs3, fa6, fs5
                  fcvt.s.wu    fa4, s5
                  fmv.w.x      fa2, s4
                  fsgnjx.s     fs7, fa0, fs11
                  ori          t2, a3, 1369
                  sll          a5, tp, tp
                  sltu         t2, a6, t6
                  lui          s6, 527179
                  fsgnjx.s     fs5, fa6, ft2
                  mulhsu       gp, a6, a5
                  addi         a5, a5, -717
                  and          a7, t2, s7
                  remu         a2, a7, s9
                  remu         s7, s2, s5
                  remu         s2, t0, s0
                  fsub.s       ft0, fa7, ft10, rdn
                  feq.s        t2, fs10, fs3
                  mul          s8, gp, t2
                  sub          s0, a3, s7
                  slti         a4, a3, 1095
                  div          s3, t3, s4
                  fsgnj.s      fa7, ft7, fs7
                  fcvt.s.wu    ft7, t2
                  slti         t0, s4, 1008
                  fclass.s     s4, ft3
                  srl          s9, ra, t2
                  fmax.s       fs3, ft5, fs3
                  slli         s9, a2, 0
                  fsub.s       ft3, fs8, ft2
                  slt          tp, t2, s1
                  fcvt.wu.s    a7, fa7
                  xor          s9, t1, s11
                  feq.s        s1, ft8, ft5
                  nop
                  xor          gp, s5, s3
                  slti         tp, a1, -2007
                  sra          t1, t5, t5
                  add          t4, s1, s6
                  srai         t1, s5, 15
                  fcvt.s.w     fa7, gp, rdn
                  divu         t5, s6, s4
                  slt          a0, a0, t4
                  fmv.x.w      t6, fs7
                  auipc        s2, 270103
                  fcvt.wu.s    a4, fa0
                  feq.s        s0, ft8, ft10
                  slti         s9, a3, -1357
                  rem          s2, t0, s7
                  slt          a6, s10, t6
                  ori          s2, gp, 273
                  fmin.s       ft4, fa3, fs9
                  fmv.x.w      s2, ft7
                  fmv.x.w      a5, fs8
                  fmin.s       fs9, fs5, fa4
                  fmax.s       ft5, fs7, fa7
                  fle.s        a5, fs10, ft1
                  fsqrt.s      ft10, fs7, rup
                  mulhu        tp, t0, a2
                  fmv.w.x      fs2, a5
                  fcvt.w.s     s4, ft0, rtz
                  srli         s3, a6, 2
                  fmax.s       fs7, fs8, fa5
                  add          a3, s1, s9
                  sltu         s3, a4, t2
                  fcvt.wu.s    a2, fa3
                  and          s10, s7, zero
                  fclass.s     s8, ft3
                  and          t1, ra, s1
                  mulhsu       tp, s6, t2
                  div          a7, s10, s10
                  fmv.w.x      fs11, s3
                  slti         a5, a1, -1549
                  srl          a7, s2, sp
                  slli         a4, t4, 7
                  rem          zero, a2, sp
                  fsqrt.s      fa1, ft4, rmm
                  sltiu        a3, s2, -193
                  fmax.s       ft10, fs10, ft11
                  fadd.s       ft2, ft11, ft11
                  sll          a3, s10, gp
                  fadd.s       fs3, ft9, fs10
                  div          a2, ra, s7
                  add          s7, a2, s11
                  mulhu        zero, t3, a3
                  mulh         s10, t4, a6
                  feq.s        s3, fs8, fs11
                  divu         s3, a0, s0
                  divu         s11, a7, s3
                  mulhsu       gp, a3, t5
                  fsqrt.s      fa0, ft4
                  mulh         a0, zero, s0
                  xori         ra, s7, 910
                  remu         s10, s3, ra
                  nop
                  sra          a3, s3, s11
                  fclass.s     t5, fa7
                  nop
                  fmul.s       fa3, fs8, ft4
                  nop
                  mulhu        s0, s8, s3
                  fmul.s       ft6, fs5, ft4
                  auipc        ra, 766024
                  andi         a3, s4, 476
                  fmv.x.w      a7, fs6
                  srai         s5, a6, 12
                  sltu         t5, s9, s7
                  fsgnj.s      ft11, fs10, ft2
                  nop
                  fle.s        zero, fs6, fs4
                  remu         t6, s5, t5
                  mul          s11, s5, s0
                  div          tp, s11, s10
                  and          ra, t5, s4
                  fcvt.wu.s    t4, fa3
                  addi         a2, s6, 836
                  mulhsu       t5, ra, t6
                  remu         s6, a4, a1
                  nop
                  sltu         s3, zero, t1
                  fsgnjx.s     fa6, ft4, ft10
                  srli         a4, s11, 15
                  srli         s5, s8, 15
                  xor          tp, a5, a2
                  mulhsu       s4, s1, t4
                  fmv.w.x      fs11, t2
                  nop
                  fle.s        a6, ft4, ft6
                  fadd.s       fa4, ft0, fs7
                  add          s8, a2, s1
                  ori          s2, s10, -731
                  fmin.s       fs7, fs1, fs7
                  srli         t4, s2, 15
                  mul          a7, a1, s10
                  addi         a0, s8, 1693
                  fsgnjn.s     ft9, fa3, ft4
                  xor          s7, t1, a5
                  feq.s        s8, ft6, fs8
                  srli         a4, a3, 15
                  fmax.s       fa1, fs6, ft0
                  addi         s6, t6, 575
                  fle.s        a7, fa3, fs0
                  fmin.s       ft5, ft5, ft11
                  fmv.w.x      fs8, t0
                  slt          zero, ra, a5
                  fmv.x.w      s4, ft5
                  addi         s4, t2, -249
                  andi         t6, s7, 323
                  add          t1, s6, t1
                  remu         t1, sp, t3
                  divu         tp, tp, s11
                  sub          t2, sp, t3
                  sltiu        a6, t5, -1604
                  sltiu        tp, a6, -944
                  slli         s2, a7, 23
                  fclass.s     gp, ft8
                  srai         t4, s2, 13
                  andi         s10, a7, 1259
                  fcvt.s.w     fs10, t2
                  div          t1, t0, a6
                  fmul.s       fs0, fs7, ft0
                  fadd.s       fa2, fs4, fs0
                  mulhsu       s1, s2, sp
                  mulhsu       gp, s9, a1
                  slli         a4, t5, 19
                  srl          s1, s3, s4
                  fle.s        zero, fs3, fa3
                  fsqrt.s      fa2, fa0, rup
                  andi         s8, s9, 1133
                  sub          t1, s4, a7
                  fcvt.wu.s    tp, fs6, rdn
                  srli         t4, s3, 29
                  fcvt.w.s     a7, fa2
                  sub          tp, s11, a3
                  fmax.s       fs8, ft9, fs6
                  xori         s3, sp, 1583
                  xor          s9, t6, s1
                  sltiu        ra, sp, -1948
                  fmv.x.w      t4, fa2
                  fsqrt.s      fs7, fs9
                  nop
                  addi         t4, t1, 119
                  fdiv.s       ft6, fa2, fs4
                  mulhu        s10, a3, a7
                  add          s8, s9, a4
                  sra          s4, a6, t5
                  fmul.s       ft10, ft0, fs5
                  fmul.s       ft11, fa0, ft11
                  lui          s11, 445157
                  addi         t6, a4, 261
                  mulh         s7, a4, s2
                  andi         a6, a0, -1537
                  fmv.x.w      t6, fa5
                  fsqrt.s      ft7, ft0
                  rem          s4, tp, a2
                  srli         t2, s8, 24
                  rem          a0, a3, s7
                  sll          s3, a5, a6
                  mul          a5, sp, s4
                  andi         s1, t1, -1480
                  fcvt.w.s     s6, fs2
                  sltiu        zero, a4, -5
                  fsqrt.s      ft4, fs10, rne
                  fsub.s       ft3, fs3, fa0
                  sll          tp, a4, a4
                  fsqrt.s      ft4, ft9, rne
                  xor          a5, s3, zero
                  mul          a0, t4, a5
                  slti         s11, s7, -608
                  fcvt.w.s     s3, fs9
                  fle.s        t1, fa7, fa5
                  fcvt.wu.s    a7, fa7
                  remu         s3, s3, s8
                  sll          t1, a4, s9
                  sltu         a4, t0, t3
                  mulh         a6, a0, t2
                  sll          gp, sp, s0
                  fmv.w.x      fs8, s2
                  sltiu        s1, t2, -1937
                  slli         t4, s3, 27
                  srli         s3, t4, 4
                  xori         s4, t6, -924
                  fadd.s       fs8, fs3, fs1, rmm
                  andi         a0, gp, -100
                  sub          t4, a4, zero
                  sra          t6, t4, ra
                  addi         t0, s7, 1548
                  andi         s4, tp, 1594
                  sll          s2, t5, s10
                  fcvt.w.s     a4, ft11
                  slli         a0, s2, 18
                  xor          a3, tp, a2
                  mul          a4, s5, sp
                  fcvt.s.wu    ft4, sp, rtz
                  fclass.s     s0, fa5
                  addi         t6, s8, 225
                  srl          t2, tp, s10
                  nop
                  rem          t0, a0, a4
                  fcvt.s.w     fs0, t4
                  mulh         t5, t0, gp
                  srl          zero, a7, gp
                  fmv.w.x      fa6, s7
                  or           s4, s11, t4
                  fclass.s     gp, fa5
                  fmul.s       fa2, fs11, fs0
                  fmin.s       fs9, ft4, fa7
                  fmax.s       fa6, fa6, fs1
                  fsgnjn.s     ft7, ft4, ft9
                  lui          t5, 434693
                  fmv.w.x      fa6, a0
                  ori          gp, s3, -1059
                  or           s6, a4, s11
                  fmv.w.x      fa1, s7
                  fmv.w.x      fa3, t2
                  sll          gp, s9, s2
                  slli         t1, a6, 1
                  fmv.w.x      fs4, s0
                  srai         t6, t4, 1
                  fmax.s       ft6, fs8, fs0
                  fsub.s       fs4, ft0, fa6, rmm
                  fcvt.s.wu    fa4, ra, rmm
                  fdiv.s       fs9, ft4, ft11
                  fsgnjx.s     ft5, ft4, fs3
                  andi         s9, s8, 1175
                  fclass.s     a3, fs3
                  slti         s9, s7, -951
                  nop
                  sltiu        ra, s9, 843
                  fadd.s       fs10, ft4, ft2
                  slti         t5, t3, 1043
                  slt          tp, s3, s4
                  slli         ra, s7, 9
                  xor          s2, t3, t6
                  mulh         s2, s4, zero
                  fmv.x.w      s1, fs4
                  auipc        s5, 1042311
                  fsqrt.s      fa5, fs9, rup
                  fadd.s       ft6, fs8, ft11, rup
                  add          s5, t2, a3
                  fadd.s       ft3, fs3, fs7
                  addi         t2, s0, -211
                  fadd.s       fs4, ft7, fa3
                  fcvt.wu.s    s6, ft11
                  srl          s0, t4, tp
                  fmul.s       ft0, ft0, fs11
                  sra          s9, a3, s10
                  fmv.x.w      a7, fs4
                  auipc        s7, 840866
                  slti         s3, a2, -1785
                  fmax.s       fs11, ft6, fs7
                  sltiu        s11, t3, 1586
                  andi         s6, t0, -899
                  slti         t0, t2, -1225
                  slti         t1, s0, -1878
                  fsgnjn.s     fs6, ft9, ft11
                  lui          s7, 843314
                  fsgnjn.s     fa2, fs8, ft4
                  ori          t5, s10, 2027
                  fdiv.s       ft11, fa7, fs2, rne
                  fcvt.wu.s    a0, fs6
                  add          t2, a4, t6
                  mulhsu       a4, s10, t5
                  slt          a7, a1, s10
                  feq.s        a2, fa3, fa0
                  fsgnj.s      fs6, ft6, fa2
                  fcvt.w.s     t4, fs8
                  fmv.x.w      s9, fs2
                  nop
                  fmul.s       fs3, fs0, ft6
                  feq.s        zero, fa0, fs9
                  or           a0, s0, t6
                  fsqrt.s      ft1, ft7
                  srli         s2, a4, 5
                  slli         s9, t0, 6
                  fcvt.wu.s    a4, ft3, rmm
                  rem          tp, a1, sp
                  mulh         s2, s4, s11
                  slti         s10, a3, -169
                  add          s6, t2, a5
                  slli         s0, a6, 5
                  rem          s7, a7, zero
                  slt          s0, s0, s7
                  slt          a6, s1, tp
                  slti         t4, a5, -1997
                  fmul.s       fa4, fa4, fs11
                  fle.s        t5, fs6, ft6
                  nop
                  fcvt.s.w     fa2, t0, rup
                  mulhu        t1, a3, t3
                  rem          s9, ra, gp
                  sll          t6, a2, ra
                  fsqrt.s      ft6, ft9, rtz
                  flt.s        s0, fs5, fs4
                  xor          s6, a2, s7
                  auipc        a4, 522579
                  fsub.s       fa3, fa0, ft8, rtz
                  sltu         t5, a5, t4
                  andi         a6, a6, -1487
                  ori          s3, s5, 964
                  srai         s3, s6, 22
                  fdiv.s       ft2, fa7, ft0
                  sltiu        s4, s1, -775
                  fadd.s       fs6, fa2, ft9
                  rem          a5, ra, s3
                  fle.s        t4, ft7, fa6
                  fsub.s       fa3, fs8, fs3
                  slti         t1, sp, -244
                  mulh         s5, s3, a5
                  fsqrt.s      ft5, ft10
                  divu         ra, s7, a3
                  xori         a2, a1, -1412
                  auipc        s11, 1014213
                  fcvt.s.wu    fs6, ra
                  fmv.w.x      ft11, t5
                  rem          a5, t5, s9
                  slli         s1, sp, 23
                  sub          s9, t1, t6
                  xori         a3, a6, 141
                  fcvt.wu.s    a2, fa1
                  divu         gp, zero, s0
                  divu         s0, a5, s4
                  fsub.s       ft3, ft4, ft5, rne
                  fcvt.s.w     fa7, s2, rmm
                  mulhsu       a5, t2, sp
                  sll          t1, a2, sp
                  or           t1, a7, a5
                  fle.s        s8, fa1, ft6
                  divu         a3, s3, s9
                  fmin.s       fs1, fs3, fs6
                  fmin.s       ft7, ft7, fs10
                  fmul.s       fs4, ft5, fa3
                  sltiu        s6, a6, -1925
                  fle.s        t6, fa6, ft9
                  addi         s4, a3, -205
                  feq.s        a5, fs2, fa4
                  ori          a6, a0, -1676
                  fdiv.s       fa2, fs10, fs2
                  fmul.s       fa2, fa7, fa2
                  addi         s4, s0, -1496
                  fmin.s       fa6, fa1, fa6
                  fmv.x.w      ra, fs6
                  fsgnjx.s     fa4, fa4, fa5
                  sra          tp, a6, s4
                  fsgnjx.s     fs10, ft2, fs6
                  fmv.x.w      ra, fs8
                  slti         s4, a0, 765
                  fcvt.s.w     ft3, sp
                  slli         t0, s6, 30
                  fsgnj.s      ft6, fa7, fs4
                  andi         a4, s8, -1334
                  fclass.s     tp, fs3
                  xor          t1, s1, tp
                  divu         a3, t2, s9
                  mulhu        t6, a4, sp
                  fsub.s       fa2, fa7, ft2, rup
                  fsgnjn.s     fs2, fa7, fa0
                  andi         s9, s3, 228
                  fdiv.s       ft3, fa2, fa0, rne
                  lui          a5, 182941
                  fmul.s       fa2, ft7, ft8, rdn
                  fadd.s       fa3, ft11, fa7, rdn
                  srl          s8, zero, zero
                  fcvt.s.wu    fa6, ra
                  mulhu        t6, a1, t2
                  slt          a4, s2, zero
                  sltu         s0, s11, a0
                  auipc        a2, 267845
                  rem          a3, a7, t5
                  fmin.s       ft7, ft6, fa1
                  fcvt.wu.s    s0, ft7, rtz
                  fmul.s       fs11, ft3, ft6, rmm
                  nop
                  sra          zero, t5, s11
                  remu         s3, ra, a6
                  fadd.s       fa4, fa6, fs6, rne
                  addi         a2, a7, 1645
                  ori          s4, a7, -304
                  andi         s6, s6, 1929
                  ori          s11, sp, -685
                  ori          t2, s9, -222
                  feq.s        s1, fa0, ft4
                  fsgnjx.s     fs10, fa6, fa0
                  fle.s        s5, fa6, fs5
                  fle.s        s11, fa5, ft8
                  fmul.s       fs0, ft5, fa4
                  fcvt.w.s     s1, fs9, rtz
                  srai         ra, s6, 25
                  srli         t5, s5, 31
                  flt.s        t5, fs1, fa7
                  fsqrt.s      ft10, fs10, rtz
                  and          s11, s10, a1
                  divu         t5, t1, gp
                  lui          a7, 382453
                  auipc        ra, 931260
                  ori          s2, a0, 412
                  sltu         a5, s2, s10
                  fsqrt.s      fa7, fs8, rup
                  srl          a0, t2, s11
                  add          t4, t2, t6
                  fmv.w.x      fs11, s8
                  slti         t1, t5, 2017
                  fmv.w.x      fs7, tp
                  fmax.s       fs6, ft10, fa1
                  fadd.s       fa2, ft4, ft7, rup
                  sra          t5, t2, t4
                  andi         zero, a4, 606
                  fmin.s       fs3, fs3, ft0
                  remu         t4, a2, t0
                  slti         t0, a0, 345
                  fcvt.s.w     fs11, s10
                  fmax.s       ft11, ft1, fa1
                  mulh         t4, gp, s1
                  fcvt.s.w     fs9, s7, rdn
                  nop
                  flt.s        t2, fa6, fs5
                  xor          t4, t2, zero
                  fadd.s       fa1, ft8, ft8, rdn
                  sll          s6, t1, s8
                  fsgnjn.s     fs11, fa3, fa0
                  flt.s        s7, fa1, ft2
                  flt.s        t6, fs8, ft7
                  srai         t4, s1, 26
                  fsgnjx.s     fs7, fa0, fs2
                  srli         t1, t3, 20
                  fmul.s       ft5, ft0, fs11
                  fcvt.wu.s    a3, fa7
                  fsqrt.s      fs11, ft7
                  remu         ra, t6, s2
                  sll          t6, ra, a2
                  andi         zero, a3, -410
                  srl          s10, s9, gp
                  sltiu        s7, t6, -146
                  fmv.x.w      gp, fs10
                  feq.s        a7, fa7, ft2
                  addi         t5, s9, -1096
                  mul          a3, a4, s0
                  sltiu        s4, s1, 1523
                  mul          t0, s6, a5
                  fsub.s       fs10, ft2, ft1
                  fmv.x.w      a6, ft6
                  mulhu        s2, t5, s3
                  fcvt.s.wu    ft3, a3, rup
                  srli         a4, a2, 27
                  mulhsu       s5, t0, t3
                  sll          s9, tp, t0
                  feq.s        s11, ft1, fs1
                  add          s3, tp, t3
                  fcvt.s.w     fs3, s6
                  andi         tp, t4, 1286
                  fcvt.w.s     s5, fa2
                  mul          a6, t0, s2
                  fmv.w.x      ft0, t3
                  auipc        s7, 591183
                  and          s11, a6, a2
                  sub          a2, s8, s8
                  rem          a7, s6, a4
                  remu         t4, s7, s9
                  fle.s        s7, ft1, ft3
                  nop
                  fdiv.s       fs4, ft1, fa5
                  srai         t6, t4, 31
                  fcvt.wu.s    t1, ft8
                  fmv.w.x      fs11, a6
                  flt.s        t6, ft8, ft6
                  fcvt.w.s     gp, fa5
                  srli         a4, t1, 21
                  srai         t6, s8, 15
                  sra          s2, sp, t5
                  fsgnjx.s     ft3, fs2, ft11
                  and          s10, a5, s5
                  fsgnjx.s     fs9, fa4, fa0
                  fcvt.s.wu    fa2, s3
                  slt          s6, t3, a1
                  fmin.s       fs7, ft4, fa0
                  add          s3, a4, s1
                  nop
                  fsgnjn.s     ft9, ft9, ft7
                  fmv.x.w      s3, fs9
                  slli         s10, t1, 18
                  mulhu        t4, a5, s1
                  sll          s9, a7, s7
                  fcvt.s.wu    fa5, s2, rtz
                  fcvt.w.s     s7, ft1
                  xor          t0, a0, tp
                  rem          t0, s10, s1
                  fcvt.w.s     s9, ft4, rtz
                  fdiv.s       ft2, ft2, ft4
                  divu         s2, tp, s11
                  sltiu        gp, a0, 650
                  sra          s3, s8, s4
                  add          t2, a0, s3
                  slt          tp, s3, a0
                  feq.s        t4, ft5, fs10
                  div          a4, ra, t5
                  fmul.s       fa1, fa5, ft0
                  add          a0, a2, zero
                  xori         t5, t2, -1600
                  mulh         t0, s5, a4
                  fcvt.wu.s    s1, fs10, rmm
                  sltiu        s6, t2, 256
                  sll          t1, s2, t5
                  fcvt.w.s     s10, ft0, rup
                  xori         s11, s7, -88
                  fcvt.wu.s    t2, fs10, rdn
                  xori         t0, zero, -1499
                  fcvt.s.wu    fa2, s2
                  flt.s        t6, ft7, fs4
                  sra          s6, t4, gp
                  fmax.s       fs1, fa2, fs10
                  mulh         t0, a0, t5
                  fmv.w.x      fs1, s7
                  fcvt.wu.s    a0, fs9
                  fle.s        s2, ft11, ft10
                  xori         t5, t0, 425
                  sltiu        t2, a1, -65
                  fmv.x.w      a7, fa1
                  fcvt.s.wu    fs0, a6
                  fmv.x.w      s9, ft8
                  mul          t0, t2, s0
                  addi         a0, s6, -1722
                  srl          s11, s7, s2
                  fdiv.s       fs11, ft7, fa7, rne
                  fcvt.w.s     t0, fa5, rup
                  flt.s        t0, ft9, fs7
                  slti         s7, a4, 1958
                  sll          a2, zero, s4
                  sub          zero, s9, a0
                  fcvt.w.s     s8, ft1, rmm
                  fsub.s       fa4, ft8, fs3
                  fle.s        s1, fs1, fa2
                  fsqrt.s      fa4, fs2
                  srai         s6, a5, 30
                  feq.s        s2, ft11, ft7
                  nop
                  sll          gp, a2, ra
                  xor          s4, s11, s10
                  fmin.s       fs10, fa4, fs3
                  srai         s8, t2, 9
                  fsgnjn.s     ft11, ft7, fs6
                  srl          a4, a1, s11
                  mulhsu       a3, gp, s11
                  fsgnj.s      fs1, fs9, fa1
                  fsgnjx.s     ft8, fa5, ft10
                  divu         s3, ra, s5
                  fcvt.s.w     ft7, a1, rup
                  nop
                  fsgnj.s      fa3, fs7, ft10
                  mulh         a3, s2, a5
                  rem          a4, s5, t2
                  addi         a5, s8, -1912
                  flt.s        s5, fs4, ft3
                  fle.s        tp, fa6, fs10
                  fadd.s       fa0, ft6, ft0, rdn
                  or           s5, t2, s1
                  fmul.s       fs6, fa3, ft2
                  fmin.s       fa0, fs4, fs8
                  fmv.x.w      s0, fa6
                  fmv.w.x      ft7, s5
                  fle.s        s7, ft5, fa1
                  auipc        s8, 801607
                  fsgnjn.s     fs4, fs10, fs9
                  xori         t6, a1, 373
                  fle.s        a6, fs11, ft8
                  fsub.s       ft1, fs6, fs0
                  auipc        s8, 962999
                  fclass.s     a0, fs2
                  slt          s10, s11, s5
                  fle.s        s11, fa6, ft10
                  fcvt.wu.s    s2, fa1
                  mulhu        s11, s5, a4
                  flt.s        s5, fa5, fa6
                  xor          t4, t2, s0
                  mulh         s1, t2, s0
                  srl          s5, s9, s3
                  andi         a7, t0, 1433
                  and          s0, t2, t3
                  fsqrt.s      fs5, fa4, rne
                  slti         t5, s6, 1914
                  srai         t2, s10, 19
                  feq.s        gp, fs4, fs7
                  fsgnjn.s     fs4, ft4, fa0
                  fmv.x.w      zero, fs8
                  fcvt.s.w     fs8, a0
                  fdiv.s       fa3, ft9, fs11, rdn
                  fmax.s       fa6, fa4, fs3
                  fmv.w.x      ft7, s6
                  fclass.s     a5, fs4
                  fcvt.wu.s    s4, fs4, rdn
                  fmv.x.w      zero, fa7
                  xori         s4, t6, -725
                  fsub.s       fs2, fs2, ft10
                  fcvt.s.w     fa0, zero, rne
                  mulhu        t4, a5, t4
                  slti         gp, sp, -1940
                  fle.s        t5, fa1, ft6
                  sltu         ra, sp, a4
                  auipc        s2, 240214
                  fmv.w.x      ft2, gp
                  fsub.s       ft9, ft1, fs8, rup
                  flt.s        a3, fa2, ft7
                  slt          tp, zero, s1
                  andi         s9, a4, 324
                  slti         s10, tp, 674
                  mul          t4, t4, ra
                  fsgnj.s      fa6, ft5, fa3
                  sub          a6, s11, a3
                  xori         a2, s7, -499
                  fmin.s       ft9, ft10, fa3
                  or           t4, s3, tp
                  fmv.w.x      ft6, t1
                  xor          t6, s7, t3
                  fmax.s       ft6, fa6, fs0
                  lui          a0, 165716
                  auipc        s6, 1005606
                  fmul.s       fa1, fa3, fa7
                  lui          s4, 673146
                  slti         s8, s6, -1218
                  fcvt.w.s     a2, ft11, rtz
                  fsqrt.s      ft7, ft7
                  fsgnjn.s     fa3, ft1, ft4
                  fmv.w.x      fs6, s7
                  fcvt.wu.s    s4, fa7
                  feq.s        s6, ft10, fs1
                  fcvt.s.wu    ft11, sp
                  sltu         a3, s8, s8
                  slt          s6, t2, s8
                  nop
                  fcvt.wu.s    a5, fs9, rdn
                  fdiv.s       fa6, fs0, ft3
                  addi         t0, tp, 279
                  fcvt.s.w     fs9, t1, rtz
                  lui          s9, 109664
                  add          t2, t6, t3
                  mulh         s6, s0, t6
                  and          t2, t3, a0
                  srl          t4, a1, t1
                  xor          a5, s11, a7
                  lui          a6, 577949
                  feq.s        ra, fs2, ft7
                  or           s0, a1, a4
                  nop
                  mul          a7, a6, t4
                  slt          s4, a6, s2
                  feq.s        s11, fs5, ft7
                  ori          t0, t6, 1745
                  slli         t5, a1, 14
                  fcvt.wu.s    a2, fa2
                  addi         s9, sp, -430
                  div          t5, t4, s2
                  fsub.s       ft7, ft0, ft1
                  lui          t4, 861415
                  auipc        t6, 827821
                  xori         s6, s9, -201
                  fmul.s       fs10, ft0, fs4, rne
                  fsgnjn.s     ft9, fa1, fs5
                  srai         s2, s9, 28
                  fle.s        t1, fs5, fs0
                  fmax.s       fa2, fs1, ft0
                  mulhsu       t6, ra, s0
                  slli         ra, s4, 28
                  srl          t0, a7, sp
                  sll          t2, a1, ra
                  lui          s0, 395837
                  sltiu        a6, sp, 1074
                  mulh         s7, s10, s9
                  fsqrt.s      ft8, ft11, rmm
                  srli         tp, zero, 14
                  sra          zero, a3, t1
                  fsqrt.s      fs6, ft1, rmm
                  srl          s2, t0, t6
                  div          tp, ra, s3
                  srai         tp, s1, 5
                  feq.s        s8, ft2, fa6
                  sub          ra, t1, s1
                  fcvt.wu.s    t5, fs4, rmm
                  sll          s7, a4, t1
                  andi         s1, s9, -61
                  fmin.s       ft7, fs0, fs10
                  mul          t4, t3, s3
                  divu         a4, t4, s5
                  sltiu        t0, gp, -1588
                  slt          t0, s11, a6
                  fsqrt.s      fa3, ft8
                  fcvt.w.s     a0, ft7
                  sltiu        s7, s7, -1390
                  srli         a3, s11, 27
                  fsub.s       ft4, ft11, fa4, rtz
                  or           a3, sp, s5
                  fmv.w.x      fs3, s5
                  fdiv.s       fs1, fs10, fs4
                  srli         s8, s9, 20
                  sltiu        a6, s10, 612
                  mulh         t1, t6, a1
                  fle.s        s0, ft11, fs4
                  fsgnjn.s     ft0, fa2, ft2
                  remu         gp, gp, a2
                  fadd.s       fs1, ft8, fa1, rtz
                  mul          a6, a2, a7
                  slli         a7, sp, 17
                  sub          ra, t6, t2
                  fmul.s       ft11, fs0, fa4
                  ori          zero, s3, -584
                  remu         zero, t4, tp
                  feq.s        t1, ft11, fs5
                  fle.s        a0, fs1, ft1
                  mul          a7, a3, a2
                  fcvt.s.w     ft9, zero
                  and          ra, a5, t4
                  divu         s0, t6, zero
                  sltiu        a2, t5, -1536
                  remu         s3, t1, a0
                  ori          a4, s3, 1215
                  mul          a4, t6, s6
                  add          t2, gp, a2
                  fmul.s       fs8, ft11, fa3, rmm
                  nop
                  fcvt.wu.s    t1, fa3
                  fsub.s       fs10, fs10, fa7, rup
                  sub          a5, a1, t3
                  fsgnjx.s     fa5, fa5, fa5
                  sltu         t4, gp, s2
                  remu         a7, gp, s0
                  rem          s4, a4, sp
                  ori          s5, a0, -1695
                  fdiv.s       ft5, fs3, fs6, rdn
                  fcvt.s.w     ft6, s9, rmm
                  mulhu        s8, a6, tp
                  feq.s        a7, fa2, fs8
                  and          s4, t3, a6
                  mulhu        s9, s10, t4
                  flt.s        t4, fs4, ft6
                  sub          s3, a0, a2
                  fsub.s       fs11, ft7, fs1
                  fclass.s     s5, fs3
                  mulhu        t4, s3, a5
                  srl          t6, zero, gp
                  and          a0, gp, a5
                  feq.s        zero, fs2, fa7
                  add          s6, sp, s8
                  fmv.x.w      t0, fs6
                  mul          s4, a0, ra
                  srl          a5, a3, s0
                  fcvt.s.w     fa4, a0, rne
                  fmul.s       ft4, ft7, fs10
                  feq.s        t6, ft3, fs8
                  slli         s5, t0, 13
                  ori          s10, gp, -946
                  mulh         s3, t0, t5
                  feq.s        a2, fa5, fs9
                  mulh         a6, s9, s9
                  fmv.w.x      fs10, tp
                  fsgnj.s      ft6, fs6, fa7
                  fcvt.w.s     gp, ft3
                  fmv.x.w      t2, fs10
                  srai         a6, a5, 22
                  fle.s        t1, ft6, ft8
                  slti         a2, s3, 11
                  fmax.s       ft11, ft11, fs5
                  fle.s        s4, fs5, fs5
                  mulh         s3, t0, a2
                  addi         gp, s9, 59
                  fcvt.w.s     zero, fa6
                  fclass.s     a3, fa4
                  fadd.s       ft8, fa2, fa7, rup
                  andi         s3, sp, -1955
                  andi         s7, a1, 1479
                  addi         s11, ra, -645
                  fmv.w.x      fs9, a3
                  fmin.s       ft6, fs4, ft8
                  fle.s        t6, fa4, fa6
                  rem          a0, sp, s10
                  mulhsu       a7, gp, s2
                  lui          a5, 229511
                  rem          t6, a1, t0
                  rem          s1, s7, s10
                  fcvt.w.s     t6, fs4
                  mulhsu       s1, s8, s11
                  auipc        a6, 540379
                  mulhu        t0, t2, s3
                  srli         s3, s1, 22
                  fsgnj.s      fs9, ft11, fs2
                  lui          gp, 973612
                  andi         t2, s6, 1260
                  slti         t0, t6, 1572
                  srai         t2, s10, 15
                  srai         ra, a2, 30
                  fmv.w.x      ft11, a6
                  fmv.w.x      fs4, sp
                  srl          a4, a7, s9
                  fsub.s       ft3, fs1, fa2, rtz
                  srl          ra, a1, s3
                  fsqrt.s      ft4, fs5
                  fcvt.s.wu    ft1, a6, rup
                  fdiv.s       ft5, fs6, fa7, rup
                  feq.s        ra, fa2, fs7
                  divu         s2, s8, gp
                  sub          s6, gp, a1
                  slli         s9, s7, 11
                  srli         a6, a3, 2
                  fle.s        t4, ft6, ft8
                  ori          s2, s6, -1808
                  nop
                  xor          t6, a6, s0
                  fmul.s       fa7, ft10, ft4, rdn
                  fmv.x.w      a4, fa3
                  fsgnjn.s     fs8, ft8, fa6
                  mulhsu       a5, a3, t3
                  fcvt.s.wu    fs7, t3
                  or           s0, tp, s2
                  sltu         gp, a3, sp
                  mulhu        a6, s7, s5
                  mulhu        gp, ra, zero
                  fmin.s       ft0, fs8, fa6
                  fmax.s       ft5, fs3, fs0
                  mulhsu       s5, t6, t4
                  fcvt.w.s     ra, ft10, rne
                  mulhu        s11, s1, gp
                  fcvt.s.w     ft5, s11, rmm
                  and          t5, t3, s3
                  sll          t2, t6, a0
                  feq.s        a5, fa0, fa1
                  sll          s11, a4, s4
                  fmul.s       ft0, fa3, fa1
                  auipc        s7, 366303
                  srli         s1, s1, 4
                  andi         s5, t1, 913
                  sll          s7, s3, a4
                  fsgnjx.s     fs1, ft5, ft9
                  fsgnjx.s     fa1, fa6, fa6
                  add          s3, a0, t4
                  sll          s10, s7, s8
                  fle.s        a3, ft9, fs8
                  sra          s9, zero, a7
                  fclass.s     t5, ft6
                  andi         a6, gp, 1218
                  sra          s7, t2, s2
                  fcvt.w.s     s8, fa7, rup
                  fsgnj.s      fs1, ft11, ft8
                  flt.s        a5, fa2, ft6
                  mul          s4, tp, s6
                  fmin.s       fs6, fa3, fa4
                  div          a2, gp, t0
                  flt.s        s10, fs7, fs9
                  fclass.s     s9, fa5
                  mulh         s11, t6, s7
                  fcvt.wu.s    a2, fa2, rne
                  fcvt.s.wu    fa2, t2
                  fmax.s       fa5, ft2, ft8
                  flt.s        a4, fs3, ft4
                  fsub.s       fs10, fs0, fs8
                  fcvt.s.wu    fa2, a0, rmm
                  xori         t4, s10, 91
                  lui          s2, 742682
                  slt          t1, s7, zero
                  fmin.s       fa5, ft11, ft1
                  nop
                  slt          ra, a0, t4
                  srai         a6, sp, 15
                  lui          s0, 821598
                  mulh         a3, s4, t1
                  or           s2, a2, s3
                  mulh         tp, s5, s2
                  mulh         a7, s9, s4
                  addi         s5, s4, 752
                  divu         s5, t4, s0
                  remu         s9, sp, a3
                  fclass.s     s0, ft0
                  feq.s        a4, ft11, fs5
                  fle.s        t0, ft11, fs2
                  rem          a7, s7, zero
                  andi         tp, sp, 1042
                  or           t1, s1, s6
                  fmin.s       fs9, fa0, ft6
                  fdiv.s       fs3, fs11, fs10, rdn
                  fmv.x.w      a6, fs6
                  fmv.x.w      s5, ft0
                  fmin.s       fa4, fs6, ft4
                  andi         a7, s0, -2038
                  flt.s        a0, ft7, ft1
                  flt.s        s5, fs1, ft1
                  fsub.s       fa0, ft9, fa1
                  remu         s3, t3, t3
                  fdiv.s       fa2, ft8, fs3
                  rem          s11, gp, t1
                  fmv.x.w      t1, fs1
                  fmv.w.x      fa1, a1
                  or           s0, sp, tp
                  lui          s4, 583192
                  srai         t0, s7, 8
                  fcvt.s.w     fs11, s11, rdn
                  fsgnjn.s     fs11, fs8, fa3
                  fsgnjx.s     ft8, ft6, fa1
                  fcvt.wu.s    a7, fs3
                  fmv.w.x      ft4, tp
                  lui          a5, 927987
                  mulh         t0, sp, gp
                  addi         s9, a0, -1604
                  mulhu        a6, s6, ra
                  sra          a4, s10, zero
                  auipc        s11, 499626
                  remu         s4, t2, tp
                  sra          a3, s2, a3
                  remu         s10, t6, t3
                  sltiu        s11, a2, 1620
                  addi         s4, s7, -1583
                  fmin.s       ft0, fa2, fa6
                  fsgnjn.s     fs1, fs0, ft6
                  rem          s7, gp, t5
                  sltiu        t1, s11, 1537
                  flt.s        s7, ft8, fa0
                  sltiu        s7, a2, -884
                  andi         a3, gp, -238
                  andi         a3, t4, -18
                  addi         s0, a4, -1398
                  fmax.s       fs1, fs9, fa7
                  slt          t1, zero, a3
                  sra          s2, s3, tp
                  andi         s4, s3, -1611
                  fmax.s       ft5, ft6, fs7
                  fclass.s     s9, ft2
                  fsub.s       fs6, ft0, ft4
                  fsgnj.s      fs5, ft0, fs4
                  addi         s10, ra, -1049
                  mulhu        t6, s0, s0
                  fcvt.wu.s    s0, fs4, rtz
                  fmin.s       ft11, ft5, fs11
                  feq.s        a7, ft4, fs4
                  mul          s3, s2, tp
                  srli         a5, a2, 20
                  and          t1, zero, a7
                  nop
                  xori         t5, a6, -1159
                  ori          s5, s7, 1908
                  add          ra, s0, s11
                  flt.s        t0, fa5, fs8
                  fsqrt.s      fs1, ft1
                  div          s8, s0, s1
                  fsgnjx.s     ft0, fa0, ft2
                  auipc        s11, 195982
                  feq.s        a4, fa0, fs5
                  fsgnj.s      fs1, ft3, fa7
                  fsgnjn.s     fa2, ft0, fa1
                  slli         s7, a4, 20
                  auipc        s0, 295650
                  xori         a7, s7, 110
                  fdiv.s       ft5, fs1, fa1, rmm
                  fcvt.wu.s    a2, fs3
                  sra          a3, t4, s11
                  srai         a2, t2, 30
                  srai         tp, zero, 14
                  add          s8, t2, t6
                  mulhu        t5, tp, s0
                  fmin.s       ft3, fs1, fs5
                  srai         a0, a5, 20
                  fadd.s       fs11, fa3, ft0, rup
                  sltiu        s10, t3, 1760
                  slt          a0, a4, a1
                  sll          s5, a3, a5
                  andi         s2, s8, -856
                  ori          s9, a3, 944
                  mulhu        a6, s6, s8
                  fcvt.s.wu    fa1, t5, rup
                  nop
                  fmv.x.w      s4, ft2
                  srli         t2, s4, 28
                  andi         s8, a2, -1717
                  ori          s11, t0, -782
                  sll          t0, t4, s7
                  fclass.s     tp, fs3
                  xor          gp, s1, s7
                  sub          s8, t3, s6
                  fmax.s       ft0, ft10, ft7
                  fcvt.wu.s    t1, fs1, rne
                  addi         t5, s7, -1726
                  sltiu        a3, sp, -951
                  addi         s6, a3, -159
                  fmax.s       ft4, ft0, fs9
                  srli         s1, tp, 31
                  fmin.s       ft4, fs11, fs6
                  fsgnjn.s     fs8, fs4, fs1
                  fadd.s       ft8, fs0, ft8, rne
                  sltu         a5, s5, s0
                  srli         t2, sp, 6
                  mul          s7, t6, ra
                  sltiu        tp, a4, 1488
                  divu         t0, tp, sp
                  auipc        s1, 194021
                  fsgnjn.s     fs6, fs4, ft10
                  fclass.s     s9, fs10
                  fsub.s       ft0, ft4, fa5, rdn
                  flt.s        a6, fa7, fs6
                  fmv.w.x      ft4, s5
                  divu         a0, sp, a6
                  andi         t1, zero, 511
                  srl          s4, s11, s3
                  fcvt.w.s     s1, ft4
                  fdiv.s       ft2, ft9, fs0, rmm
                  andi         t4, t2, 572
                  fmv.w.x      fs3, a4
                  feq.s        a2, ft1, ft1
                  fsgnjx.s     fs5, fa4, fa2
                  or           t6, a2, s10
                  divu         s2, tp, s4
                  fcvt.s.wu    ft10, t0
                  and          s9, s5, s10
                  fsub.s       fa5, fs10, ft3
                  fsgnjn.s     fa3, fs0, fs3
                  fcvt.s.wu    ft9, a6
                  nop
                  mulhu        gp, s2, s3
                  sltiu        t4, s6, -525
                  fadd.s       fa0, ft5, fa1
                  divu         s1, s7, s2
                  fsgnjn.s     fa4, ft10, fs0
                  fmin.s       fs8, fa4, fa6
                  srl          s10, t5, a7
                  fsub.s       ft4, fs3, fs2, rup
                  fsgnjx.s     ft9, fs10, fs9
                  slt          s4, t4, s0
                  and          t2, t0, zero
                  fclass.s     t5, fa3
                  lui          a6, 127443
                  add          s1, gp, s11
                  srl          s8, t1, a5
                  andi         a2, s2, -46
                  fsub.s       fs11, fs3, ft11, rtz
                  nop
                  fcvt.s.w     fs4, t2, rtz
                  or           a4, s2, a2
                  srl          t2, s6, t3
                  ori          s3, s2, -121
                  fadd.s       ft7, ft10, fs3, rmm
                  fsgnjx.s     fs2, fs11, ft8
                  remu         a3, a1, a6
                  xor          t2, s6, s2
                  sub          s0, s7, s8
                  fsgnjx.s     ft5, fa4, fa5
                  srl          t1, s7, a4
                  sra          s9, a1, a1
                  fclass.s     t1, ft7
                  fcvt.w.s     a5, fs6
                  feq.s        gp, ft4, ft8
                  fle.s        a0, fs9, fa6
                  mulhsu       s6, s1, s4
                  slli         a3, a6, 12
                  xori         a0, a1, 802
                  or           s8, a5, s11
                  add          t6, a1, s4
                  sll          s2, t1, s6
                  add          ra, sp, s8
                  mulhu        s6, a7, tp
                  fdiv.s       fa6, fa1, fa3
                  srl          a7, t6, a2
                  fdiv.s       ft7, ft6, fs1
                  rem          t2, s10, t6
                  fadd.s       fa4, fa3, fa3, rup
                  divu         s4, a5, s2
                  fmin.s       ft4, fs10, fs2
                  mulhu        t5, a6, s9
                  sub          a7, t2, s2
                  feq.s        s2, fs9, fa4
                  fle.s        zero, fs10, fa0
                  fmv.w.x      fs7, a7
                  fcvt.s.wu    ft6, a1, rup
                  fcvt.wu.s    t4, fa2
                  lui          s3, 948326
                  rem          t5, a0, a5
                  mul          t6, s7, s7
                  fcvt.wu.s    s4, fs7
                  slli         s10, s6, 21
                  auipc        t2, 333428
                  addi         t6, s0, -1184
                  xor          a4, s10, a6
                  fmv.w.x      fa3, gp
                  fle.s        t0, fs3, fa6
                  nop
                  sra          s5, zero, a2
                  flt.s        s8, ft0, ft1
                  fcvt.w.s     t4, fs6
                  div          tp, s11, t5
                  fadd.s       ft4, ft1, fs9
                  andi         t1, s7, 1525
                  sltu         a3, a3, t6
                  slt          s6, s8, s8
                  xori         t0, sp, -1994
                  fsgnjn.s     fa4, ft9, fs10
                  fmv.w.x      fa4, s1
                  xori         a5, a4, -946
                  slli         a0, s8, 17
                  srai         s4, s8, 5
                  or           s0, tp, t1
                  slti         s10, a6, -6
                  fmul.s       ft7, fa4, fa0
                  flt.s        t4, fs7, fa2
                  mulh         t4, zero, sp
                  lui          t5, 455321
                  srai         s9, tp, 2
                  xor          s11, a1, s6
                  slli         t5, s4, 31
                  sltiu        s4, t3, -1755
                  xori         tp, t3, 917
                  sra          a6, s9, s11
                  rem          s11, gp, s4
                  divu         ra, s4, t4
                  sll          gp, tp, a0
                  mul          tp, ra, tp
                  xori         tp, s5, -284
                  srli         s9, s2, 17
                  add          s5, a1, t6
                  fcvt.s.wu    ft6, s2, rne
                  slli         t0, a4, 10
                  mulhsu       a3, a3, a6
                  slli         t6, a5, 6
                  mulhsu       a0, a3, s9
                  or           ra, a2, ra
                  lui          t0, 510148
                  ori          s6, ra, 801
                  fmv.x.w      t4, ft10
                  fcvt.wu.s    tp, ft9
                  fsgnjx.s     fs7, fs4, ft9
                  fsub.s       fs6, ft5, ft4
                  fcvt.wu.s    s1, fa5, rdn
                  nop
                  andi         a6, a4, -1554
                  fsgnjn.s     ft11, fa4, ft11
                  fmv.w.x      ft11, s1
                  fsub.s       fs7, ft10, fa3
                  slt          t6, ra, s10
                  mulhsu       zero, tp, t6
                  fmin.s       fa0, ft7, fa0
                  sub          s0, s5, s7
                  divu         s6, s5, s11
                  fmax.s       fs10, ft10, fs3
                  slti         s3, gp, 1262
                  fsgnjx.s     ft2, fs11, fa7
                  fcvt.s.w     fs9, gp, rtz
                  divu         a4, a7, s9
                  fmin.s       ft3, fs5, ft5
                  or           t0, s11, a5
                  srai         t4, s9, 17
                  slt          s11, a4, s9
                  mulhsu       a5, s1, tp
                  remu         s2, s2, a2
                  slti         s5, s9, 426
                  fsgnjn.s     fs9, fa3, ft1
                  fmin.s       fa3, fs3, ft10
                  fsub.s       ft8, fa3, fa6, rne
                  slt          s0, a0, s0
                  and          ra, a7, ra
                  xori         s4, s8, -1608
                  andi         a5, a1, 109
                  sll          t5, t0, s10
                  fmv.w.x      fa1, s2
                  fsgnjn.s     ft5, ft10, ft10
                  sub          t2, s5, sp
                  fdiv.s       ft2, ft11, fa4
                  sra          t4, s8, t1
                  divu         t0, tp, ra
                  srli         s10, a6, 20
                  slt          s3, s1, s10
                  fclass.s     s0, ft6
                  srai         ra, s10, 2
                  ori          a6, t5, 581
                  fcvt.wu.s    s7, fa3
                  fmax.s       fa5, ft7, fs2
                  srl          s0, s2, s5
                  xori         a7, sp, -1062
                  fmax.s       fa6, fs0, ft10
                  fmin.s       ft10, ft2, fs8
                  nop
                  sltu         t5, t6, t0
                  fcvt.w.s     t2, ft2, rne
                  fmul.s       fs4, ft6, ft2
                  ori          s10, s0, 1669
                  fcvt.s.wu    ft6, t2
                  fcvt.s.wu    fs0, a5
                  fmv.x.w      s9, fs11
                  add          s6, t6, a2
                  sub          s10, t0, a6
                  mulhu        t0, t2, s1
                  xor          s1, s8, s1
                  fcvt.w.s     s7, ft5
                  fcvt.s.wu    fs8, s3, rtz
                  fsub.s       fs1, fs1, ft4
                  fmul.s       fs1, fa0, ft2, rup
                  sltiu        a5, s7, 448
                  fcvt.w.s     s4, ft0
                  slli         t0, s3, 10
                  srai         gp, a1, 13
                  fmv.x.w      a4, ft7
                  srai         a0, s5, 21
                  fcvt.w.s     a7, ft3, rne
                  fcvt.s.w     fs3, s4
                  mulh         s0, t4, s1
                  feq.s        a3, fs1, fs6
                  sra          t4, s8, s9
                  fmax.s       ft7, fs8, ft10
                  fcvt.s.w     ft7, a2
                  feq.s        s5, ft4, ft5
                  fsgnj.s      fs3, ft0, fs4
                  fclass.s     a7, fs1
                  fmin.s       fa5, fs2, ft3
                  fmax.s       fa4, fs9, ft5
                  fmul.s       fs2, fs9, ft1
                  srai         t2, s10, 31
                  feq.s        t5, ft10, ft6
                  fmin.s       fs4, fs8, fa6
                  fsgnjx.s     fs6, ft2, fa3
                  and          t0, a6, ra
                  andi         s11, t0, -946
                  fcvt.wu.s    t0, fs5, rdn
                  fcvt.wu.s    s2, ft4, rne
                  sltu         s3, a5, s10
                  feq.s        s11, ft2, fs7
                  fmin.s       ft11, ft9, ft0
                  mulhsu       t1, a2, gp
                  sltu         t4, a0, a4
                  fsgnjx.s     fs5, fs3, fs8
                  srli         s9, s7, 30
                  sltu         a7, t5, s6
                  fcvt.wu.s    s2, fa5
                  fcvt.s.wu    fs8, a6
                  addi         a0, s1, 1871
                  sub          t1, s0, s2
                  and          tp, ra, s10
                  fle.s        s2, ft8, ft2
                  fsgnjn.s     ft0, fa7, ft7
                  fsgnjn.s     ft8, ft0, fa0
                  remu         s7, s2, s1
                  srli         a3, gp, 20
                  fsub.s       ft0, ft3, fs8
                  add          s8, a5, a1
                  fcvt.w.s     s10, ft0, rne
                  div          s11, s7, s2
                  fsgnjx.s     ft0, ft9, fa6
                  remu         s6, s8, s1
                  fmul.s       fs2, fa3, ft3
                  nop
                  mul          tp, a4, s7
                  sll          tp, s10, s6
                  lui          zero, 305368
                  auipc        s8, 979555
                  lui          t2, 1027283
                  auipc        a5, 917074
                  xor          t4, a6, a4
                  fcvt.s.w     fs5, t6, rtz
                  fcvt.s.wu    fa6, a4
                  mulh         s2, s6, t4
                  sra          s2, t6, gp
                  slli         t5, s4, 21
                  sltiu        a6, t6, 867
                  andi         t2, t1, 739
                  sra          ra, s4, s10
                  mulh         t2, s4, s0
                  srli         tp, t0, 8
                  mulhu        ra, a2, s5
                  fsgnjn.s     fa7, fa1, fs8
                  slti         s0, a2, 286
                  fclass.s     zero, ft6
                  slti         ra, s2, 1445
                  fmv.w.x      fs10, gp
                  fcvt.w.s     s6, ft5, rtz
                  srai         s1, s1, 11
                  xor          t1, a1, s9
                  nop
                  srli         s1, s3, 17
                  remu         t0, t6, s5
                  mulhsu       s9, t3, a0
                  fmv.w.x      ft2, s1
                  sra          a7, s9, s9
                  lui          a3, 78935
                  fdiv.s       fa7, fa0, ft4, rup
                  mulh         s11, s0, s7
                  fsqrt.s      fs5, fs0, rmm
                  remu         s1, a0, s4
                  xor          s1, s3, zero
                  div          t2, t4, t4
                  remu         s8, t2, s11
                  slt          t2, t3, s11
                  div          t6, s10, t3
                  rem          s4, s10, a3
                  fmv.x.w      s0, fs1
                  fsgnj.s      ft5, fa5, ft8
                  srli         t0, s5, 7
                  fsub.s       ft11, fs4, ft2
                  mulh         s6, s7, t2
                  fmax.s       fa7, ft11, ft8
                  fmul.s       fs1, fa0, ft0
                  lui          a2, 848687
                  add          a3, s7, a3
                  sra          t1, a6, s0
                  lui          a3, 319487
                  fle.s        t2, ft11, fs9
                  sub          s7, a0, t2
                  fsgnjx.s     ft4, ft0, fs11
                  fmul.s       ft7, fs0, ft5
                  divu         t2, zero, s4
                  srl          t2, t1, t2
                  fclass.s     s7, fs1
                  fmv.w.x      ft4, a4
                  fmv.x.w      s3, fs8
                  mulhsu       a6, t5, t5
                  fsub.s       fa0, ft9, fs11
                  slt          t2, a3, t4
                  fadd.s       fs5, fs6, fs7, rtz
                  fsgnjx.s     fa6, fa6, fs0
                  sltu         gp, s5, s5
                  fsgnjn.s     fs5, fs2, fs7
                  sll          gp, s7, s0
                  fsgnjn.s     fs4, fs2, fs11
                  fsqrt.s      ft7, fs8
                  fmv.x.w      s0, fa1
                  fadd.s       ft6, fs6, fs6
                  srli         a7, a0, 20
                  rem          tp, t0, s5
                  fclass.s     t2, fs10
                  srli         t5, t5, 10
                  mulhsu       tp, s1, t2
                  addi         ra, a1, 716
                  rem          s1, s4, gp
                  divu         t4, s6, t5
                  srl          a7, a4, gp
                  sltu         s1, sp, s3
                  mulhsu       gp, gp, s2
                  fle.s        s7, fa4, fa2
                  srl          s11, a0, a3
                  rem          zero, t4, s1
                  sltu         s11, s7, zero
                  add          s2, sp, t3
                  rem          s10, gp, ra
                  fcvt.s.w     fs7, s6, rmm
                  xor          a3, a4, s7
                  sltu         s1, s4, s9
                  feq.s        s11, fs1, fs3
                  and          s1, gp, s8
                  fmax.s       fa1, ft7, fs4
                  sltu         s7, t4, t3
                  fle.s        s9, fs8, fs7
                  auipc        s9, 419676
                  fmin.s       fs1, fa6, ft8
                  flt.s        a6, fs6, ft11
                  fsgnjx.s     ft3, ft8, fs2
                  divu         a6, sp, a4
                  mulh         a6, t1, a1
                  fmin.s       ft5, fs11, fs11
                  fsub.s       fa2, ft1, ft1, rdn
                  fmv.w.x      fa7, s9
                  fcvt.w.s     s0, fa7
                  srli         a5, a6, 12
                  sll          t5, s11, a7
                  lui          s6, 755431
                  sra          s2, a3, s4
                  fsgnjx.s     fa7, fs3, fs7
                  srl          s8, s7, t4
                  fsgnj.s      ft9, fa1, ft0
                  fsqrt.s      ft8, fs9
                  fsqrt.s      fs7, fa2
                  sltiu        s4, a3, -818
                  flt.s        s8, fs10, ft0
                  fdiv.s       ft6, fa0, ft5
                  xor          s3, t2, t1
                  remu         tp, gp, s4
                  fle.s        gp, ft4, ft3
                  andi         a0, s1, -1973
                  remu         s1, t1, s8
                  lui          a3, 652016
                  fsgnjn.s     fs0, ft3, fa3
                  div          t2, ra, s2
                  nop
                  fdiv.s       fs11, fs7, fa6
                  fmax.s       fs11, fs6, fs6
                  fle.s        s0, ft8, fa3
                  ori          s4, gp, 428
                  mulhsu       a5, ra, a7
                  add          tp, t0, t6
                  addi         a6, s0, -1692
                  remu         s5, s7, a7
                  fadd.s       fa2, fs0, ft11, rtz
                  and          t4, s1, t0
                  sltu         s7, a3, a5
                  fmv.x.w      tp, fa6
                  srli         s0, sp, 12
                  and          s5, t6, zero
                  sltiu        s1, gp, -487
                  div          a4, s10, a7
                  sltu         s2, t2, ra
                  fsgnj.s      ft10, ft2, ft4
                  slli         s0, s6, 18
                  sub          s2, a7, zero
                  and          a7, t0, a6
                  mulhsu       s9, s4, gp
                  fmv.x.w      t0, fs4
                  fmv.x.w      s0, fs11
                  fmv.x.w      s11, fa7
                  fsub.s       fs5, fs10, fs7, rmm
                  fsqrt.s      fs7, fs10, rup
                  or           s11, s5, s10
                  srli         t6, s4, 31
                  fcvt.w.s     s11, ft3, rmm
                  xor          s11, t4, s0
                  fmul.s       fs1, fs7, ft5, rup
                  addi         gp, s5, -1791
                  fsqrt.s      fa0, fs9, rtz
                  and          t4, s3, s2
                  mulhsu       s8, s9, s3
                  srli         s11, sp, 18
                  xor          t1, t6, a0
                  fcvt.wu.s    zero, fs0, rtz
                  mulhu        s3, s1, t5
                  fsub.s       ft8, fs7, ft2
                  fsgnj.s      fs8, fa6, fa6
                  addi         s7, t2, -1983
                  mulhu        s7, s6, s0
                  xori         t6, t4, 1043
                  fmv.w.x      fs1, s6
                  mulhu        t4, s4, t3
                  auipc        s9, 451968
                  fdiv.s       fa7, fs6, fs10, rtz
                  fdiv.s       ft9, ft8, ft3, rne
                  mul          s10, s0, s3
                  mulhsu       s10, a5, t1
                  mul          a5, s0, t6
                  fmax.s       fa2, fa1, ft1
                  sltiu        t0, zero, 313
                  flt.s        a5, fs2, ft4
                  or           tp, t2, t1
                  srl          s11, s2, tp
                  ori          s5, s3, 1279
                  xori         a5, sp, -1080
                  fcvt.s.w     ft0, t4
                  xori         a0, zero, 1181
                  fcvt.wu.s    s3, ft10
                  fdiv.s       ft9, ft9, ft8
                  fcvt.s.wu    ft3, s1
                  fle.s        s4, ft1, fs7
                  sltu         tp, t3, t5
                  sltu         s2, s9, a3
                  fclass.s     t4, fs8
                  nop
                  divu         gp, s0, a5
                  fmin.s       fs10, ft8, fs1
                  fsub.s       fs6, ft10, ft9
                  fmax.s       fa1, fs0, ft11
                  mulhsu       s8, s0, a5
                  fcvt.w.s     t6, ft5
                  fmin.s       ft7, ft11, ft4
                  slli         a2, s3, 6
                  remu         s8, s6, a1
                  add          s7, s1, s10
                  addi         a4, ra, -1758
                  fcvt.wu.s    s5, ft10
                  sltiu        t5, a4, 1112
                  div          a4, t2, s6
                  mulh         s7, s11, s0
                  fmax.s       ft1, fa7, fs10
                  add          s5, tp, t2
                  mul          s1, sp, a5
                  slti         ra, a7, 1421
                  fcvt.w.s     s11, ft3, rmm
                  sll          s0, a3, s5
                  fdiv.s       fs6, ft8, fa0
                  slti         s3, s10, -1627
                  remu         s5, s7, t4
                  sll          a6, a6, t6
                  mulhu        t5, t1, s8
                  fcvt.s.w     fs5, a6, rne
                  addi         a5, a6, -1789
                  fle.s        a5, fs8, fa2
                  div          s0, s3, s6
                  mulhu        t1, t4, s0
                  sub          ra, s0, a1
                  slti         s6, a2, 1209
                  flt.s        ra, fs5, ft8
                  fmax.s       ft4, ft7, fs7
                  fmin.s       fs4, ft6, ft8
                  mulhu        s1, s11, t0
                  rem          tp, sp, s0
                  fmv.x.w      t1, fa5
                  fmv.x.w      a6, fa6
                  fclass.s     t0, fs10
                  srai         s3, t3, 9
                  srai         s3, t2, 2
                  nop
                  andi         t5, a4, -810
                  flt.s        s1, ft9, fa4
                  srl          s2, s3, s11
                  or           a4, s11, t6
                  fmin.s       ft2, fs8, ft11
                  sltu         s9, s4, a1
                  fmul.s       fs1, fa5, fs5
                  auipc        tp, 380527
                  fmv.x.w      t6, fs2
                  mulhu        t0, t6, s2
                  fadd.s       fs8, fa5, fs11, rtz
                  fcvt.s.w     ft8, t4
                  fcvt.wu.s    tp, fa7, rne
                  sra          ra, a4, t5
                  srai         a7, a3, 13
                  fcvt.s.wu    fa0, a2, rmm
                  fcvt.s.wu    fs6, sp, rmm
                  sub          s3, gp, gp
                  or           s10, t3, a0
                  ori          s8, t5, 1420
                  xor          s9, s9, t4
                  sll          s7, s8, t4
                  fmul.s       fa5, ft6, fs7, rtz
                  sll          ra, sp, s10
                  fmin.s       fa6, ft7, ft11
                  fsgnjn.s     fs8, fa4, ft9
                  mulhsu       s1, a7, a7
                  fsgnjn.s     ft2, fs5, fs4
                  nop
                  add          s5, s10, t0
                  mulhsu       a3, s9, s8
                  addi         t5, sp, 920
                  lui          a6, 1005245
                  fle.s        a4, fa0, ft1
                  div          s10, t1, s10
                  slti         t1, t5, -635
                  srai         a4, t4, 20
                  fcvt.wu.s    a6, fs0
                  flt.s        a5, ft0, ft6
                  nop
                  sltiu        s2, s3, 197
                  ori          gp, a3, -1452
                  fmin.s       fa7, fs9, fa2
                  srl          s2, t0, t2
                  xor          a7, t5, zero
                  mulhsu       s4, s7, s3
                  fsub.s       ft11, fs11, fa5
                  remu         a4, a1, s0
                  fcvt.s.w     fa1, t4, rne
                  addi         s5, s4, 1004
                  add          a7, gp, t6
                  rem          s7, s4, a0
                  fmax.s       fs5, fa6, ft3
                  fmin.s       fa6, fs9, ft3
                  rem          t2, s3, tp
                  fclass.s     a3, ft10
                  nop
                  mulhsu       s10, t4, s1
                  srai         s0, a5, 4
                  sra          t4, s11, s5
                  xor          a6, tp, t2
                  sll          s6, a5, s4
                  fsqrt.s      fs0, fs6
                  rem          s1, s2, t5
                  auipc        tp, 615128
                  fsgnjn.s     fs4, fa2, ft1
                  or           s10, ra, s0
                  sltu         zero, s11, ra
                  srai         t2, s11, 2
                  fsgnjn.s     fs6, ft3, fa4
                  fmul.s       ft9, ft0, fs3, rmm
                  and          s3, a0, sp
                  sll          t4, gp, a5
                  remu         s9, a1, s1
                  srli         s8, gp, 25
                  nop
                  fsgnj.s      ft11, fa4, fa3
                  slti         s4, s0, -1527
                  fcvt.w.s     tp, fs5, rdn
                  sub          s3, s4, t1
                  slli         a2, s3, 20
                  addi         s3, t4, 2010
                  ori          s3, ra, -339
                  sltiu        s1, a2, -1745
                  rem          ra, s11, s11
                  flt.s        a6, fa1, fs4
                  slli         s1, t6, 13
                  srai         s4, s1, 10
                  or           s4, s9, s3
                  fsgnj.s      fs11, ft3, fa5
                  fsgnjx.s     fs3, ft8, fs8
                  fsgnjn.s     fa0, ft11, fs10
                  feq.s        a3, ft8, fs7
                  fcvt.s.w     ft6, gp, rne
                  sltu         a0, ra, a5
                  srli         t4, ra, 3
                  slt          t6, s11, s7
                  add          t0, t6, sp
                  lui          s4, 166346
                  fmul.s       fs0, fs10, ft9, rup
                  slti         a4, t1, -674
                  rem          a0, s11, a1
                  mulh         t5, t3, t1
                  div          s7, ra, a4
                  divu         s9, a7, s1
                  fmv.w.x      ft8, s11
                  slti         s7, a5, 758
                  srli         t4, s5, 19
                  add          t6, a7, s6
                  add          s0, t1, s2
                  fclass.s     a0, ft3
                  remu         a3, gp, s4
                  nop
                  slli         ra, tp, 20
                  slti         s1, a6, -1181
                  fcvt.s.wu    fa7, a5
                  auipc        tp, 230697
                  mul          zero, a4, s1
                  mulh         a7, s5, t2
                  flt.s        t1, fs11, fs4
                  ori          zero, t5, -869
                  add          t4, t6, s0
                  sub          a5, a6, a1
                  ori          ra, a7, 1215
                  fcvt.w.s     a3, fs5
                  or           s1, ra, a2
                  slt          s6, a0, t4
                  remu         s3, s0, a0
                  sltu         s0, s10, s4
                  mulh         s9, s7, t4
                  fmv.x.w      a5, fs9
                  mulhsu       a3, s8, s10
                  fmv.x.w      t1, ft10
                  fdiv.s       fa7, fs10, fa4
                  sll          s4, s10, s7
                  fclass.s     ra, ft11
                  fmax.s       ft7, fs9, fs0
                  fle.s        gp, fa4, ft9
                  lui          t4, 1013619
                  fcvt.w.s     a3, ft0, rne
                  andi         zero, a0, 800
                  sll          t1, t0, t3
                  fmul.s       ft8, ft7, ft2
                  fsgnjn.s     ft2, ft8, ft2
                  fle.s        s10, fa7, fs4
                  fcvt.s.wu    fa2, a5
                  flt.s        s10, fs11, fa2
                  srli         t1, a7, 4
                  fmv.x.w      zero, fs2
                  div          tp, a6, s10
                  mulh         s5, s1, s0
                  fmul.s       fs7, ft11, ft9
                  fsub.s       fs5, ft9, ft0, rne
                  and          gp, t1, t3
                  fsub.s       ft1, fs5, ft11, rtz
                  srli         a0, a5, 10
                  srl          s8, s1, s6
                  andi         ra, t4, 1307
                  ori          s2, zero, -1983
                  fmv.w.x      ft7, a1
                  fdiv.s       ft1, fs10, fa0, rne
                  fmul.s       fa1, fs7, fs6, rtz
                  fclass.s     s10, ft3
                  lui          s11, 932164
                  fmul.s       ft11, ft2, ft7
                  fle.s        t4, fa6, fs6
                  fdiv.s       fs6, fa7, fs0
                  fsgnjn.s     fs5, fa3, fs6
                  divu         s4, s5, zero
                  slli         a4, s1, 29
                  feq.s        s2, fa2, fs11
                  xori         s6, s6, -955
                  fmax.s       fs5, fa5, fa2
                  fsgnjn.s     fa4, ft6, fa6
                  fcvt.s.wu    ft2, t6
                  fclass.s     s6, ft7
                  slti         a4, a4, 1271
                  mulhsu       a6, ra, s5
                  mulh         a2, s6, s10
                  sltiu        s10, a0, 1672
                  sub          a4, s7, a4
                  feq.s        s2, fa5, fs0
                  auipc        t6, 626989
                  sra          s9, s10, s4
                  add          t1, a1, a3
                  sll          s1, gp, ra
                  fle.s        t5, ft6, fs6
                  sll          s4, s2, a3
                  fcvt.wu.s    s8, ft2
                  srl          s10, s8, sp
                  and          s4, s3, t5
                  slli         a6, s0, 6
                  add          s0, sp, t1
                  fle.s        gp, fs4, fs6
                  or           s2, t3, a7
                  and          s8, a0, a6
                  mulhsu       a6, a1, a5
                  sltu         s2, sp, a0
                  sub          a0, t0, t6
                  xori         s7, s1, -627
                  lui          s3, 85098
                  xori         t4, a7, -1956
                  sltiu        a6, sp, 1540
                  divu         a5, a4, s0
                  ori          s9, t0, -1147
                  fle.s        a4, ft10, fa7
                  div          s8, t1, t0
                  remu         s0, s11, a3
                  fsub.s       fs6, fs11, ft7
                  xori         a3, tp, -1492
                  flt.s        t0, fs1, ft7
                  divu         s2, s4, a5
                  fsqrt.s      fs5, fa3
                  fle.s        s2, fa4, ft2
                  fmv.w.x      ft11, s7
                  fmv.x.w      t5, fs8
                  fcvt.s.wu    fa2, t6, rne
                  nop
                  srl          zero, a0, a3
                  fsgnjn.s     fs0, ft6, fa2
                  fmv.w.x      fs6, a2
                  srl          ra, t1, t5
                  srli         a2, t6, 22
                  srli         t0, a5, 25
                  fmin.s       fs10, ft3, fa5
                  fsgnjn.s     fa0, fs9, ft5
                  fsqrt.s      fs7, ft2
                  fsgnjn.s     ft4, fa5, fs3
                  fsqrt.s      fa4, fs9, rne
                  slt          s1, a0, s7
                  fcvt.w.s     gp, ft6
                  fcvt.s.w     fs3, s10, rtz
                  lui          s2, 710333
                  fcvt.w.s     s3, ft3, rne
                  fle.s        s8, ft8, fa4
                  fmul.s       fa7, fa7, ft3, rne
                  and          t5, tp, s9
                  divu         s10, a4, t1
                  srai         s8, t5, 6
                  fadd.s       fa1, fs3, fs2, rne
                  lui          s6, 44402
                  divu         t2, a3, t6
                  flt.s        s9, fs11, fa2
                  slt          gp, s7, t5
                  divu         s4, t2, s2
                  ori          s9, s3, -621
                  fsqrt.s      fa2, ft4
                  srl          t4, t0, s8
                  slt          s5, s0, t5
                  fsgnjx.s     ft7, fs1, fs7
                  add          t5, s4, a5
                  sub          s6, s1, t2
                  fsgnjn.s     fa6, fs4, fa0
                  slti         t2, ra, -437
                  fmv.x.w      t1, ft1
                  auipc        t4, 497792
                  remu         gp, a3, ra
                  fsqrt.s      fa1, fs8
                  remu         s6, a7, t1
                  add          s3, zero, t3
                  remu         s10, a5, zero
                  srl          a3, s2, tp
                  fcvt.s.wu    fs1, s9
                  sltiu        s8, s11, 502
                  srli         s3, a4, 25
                  divu         a4, a1, s10
                  divu         s5, s6, s7
                  fsgnjx.s     fs11, ft7, fa4
                  fmin.s       fs11, fs11, fs0
                  xori         s3, t4, 1368
                  fcvt.w.s     gp, fa1
                  fcvt.wu.s    t1, ft9
                  fcvt.s.wu    fa3, a5, rdn
                  srai         a0, t3, 12
                  divu         t5, a6, s3
                  fcvt.s.wu    fa6, s0, rmm
                  addi         gp, s11, 1289
                  mulhu        s0, t2, s2
                  remu         tp, t6, sp
                  mulh         a2, a2, a2
                  or           a6, ra, s1
                  rem          s9, a0, s9
                  sub          a0, s8, t6
                  divu         a0, s7, s11
                  srl          zero, zero, a5
                  fcvt.w.s     s0, fs7, rmm
                  sltiu        s7, t2, -1877
                  fclass.s     s11, fs6
                  lui          t0, 254836
                  sltiu        t2, a7, -1214
                  addi         s10, s9, 1037
                  fle.s        t6, ft3, ft2
                  fsgnj.s      fa2, fs10, fa7
                  flt.s        s5, fs10, fs0
                  fsgnjx.s     fa2, fs0, ft9
                  addi         s5, s5, 10
                  fadd.s       ft11, ft3, fa0
                  fcvt.s.w     fs8, ra
                  fsgnj.s      fs3, ft8, fa6
                  sub          s3, a0, s10
                  addi         s9, a4, 22
                  fdiv.s       ft3, ft10, fa0
                  remu         t2, s2, t5
                  slti         t5, s5, -1600
                  fle.s        s8, fa1, ft4
                  nop
                  fadd.s       fa4, fs4, fa2, rmm
                  fcvt.s.wu    fs4, s10, rup
                  addi         gp, s3, -1285
                  mulhsu       s11, s9, t6
                  lui          s10, 231438
                  fcvt.s.wu    fs2, a4
                  div          t1, gp, a1
                  or           t6, s7, s1
                  sra          a3, a6, s8
                  fclass.s     a7, fs0
                  fcvt.s.w     ft3, a1
                  div          s1, t2, sp
                  fle.s        t5, ft6, fa3
                  xori         a3, s11, -536
                  sltiu        a4, t0, -1300
                  slt          s6, a5, gp
                  sltu         s5, s6, t3
                  rem          a7, a5, t5
                  fdiv.s       fs8, ft5, ft5
                  ori          ra, s6, -632
                  sll          s0, gp, a2
                  divu         t6, t4, a0
                  fcvt.w.s     t6, fs2
                  srai         a5, s7, 18
                  slli         t6, a0, 29
                  fsub.s       fs1, fa7, ft10
                  addi         a4, a5, 1474
                  slli         s4, zero, 15
                  lui          s1, 177973
                  slt          t1, s10, t6
                  fcvt.s.w     fa4, s11, rdn
                  rem          s1, s8, t1
                  slli         a7, s10, 13
                  rem          s5, sp, s0
                  addi         t6, s10, 1569
                  auipc        s9, 1037883
                  fsgnj.s      fa4, fs5, ft10
                  fle.s        s7, fs5, ft6
                  fmax.s       fs0, ft11, fs8
                  mulh         a6, a2, a2
                  fclass.s     a4, fa0
                  add          a6, tp, tp
                  fcvt.s.w     fs0, a6, rdn
                  mul          t6, s9, a1
                  fsgnjn.s     fa3, fa6, fs4
                  srli         tp, a0, 10
                  remu         s0, s1, a6
                  fcvt.w.s     a6, ft4, rmm
                  and          ra, a0, s2
                  sra          s9, a6, t2
                  sltu         zero, s5, a6
                  sll          a0, gp, s10
                  xor          s6, a3, s1
                  xori         t2, t0, -1588
                  fcvt.s.w     ft4, t3, rup
                  remu         t4, s9, s3
                  remu         s7, tp, a3
                  fmax.s       fs7, ft6, ft0
                  slt          s7, sp, s11
                  srl          s8, t5, t3
                  srli         t0, s6, 15
                  fadd.s       fa3, fs1, ft9
                  srai         s10, s6, 22
                  xori         t4, t4, 1038
                  fdiv.s       fs3, ft0, ft6, rne
                  andi         t4, s0, -1861
                  srl          a7, a4, t2
                  remu         s11, t1, t2
                  andi         a7, zero, 635
                  srai         gp, a5, 16
                  auipc        t6, 1031591
                  fcvt.wu.s    gp, fa7
                  sra          s9, gp, s8
                  fcvt.s.w     fa5, a4, rne
                  mulh         a6, ra, a0
                  or           ra, a3, t1
                  fmin.s       ft4, fs7, fa1
                  remu         s10, gp, s2
                  sltu         a4, s8, gp
                  auipc        t5, 668011
                  flt.s        t6, fs6, ft7
                  flt.s        s4, fa5, fs5
                  srai         s9, a3, 30
                  slli         t1, s11, 0
                  remu         tp, s8, t4
                  auipc        a6, 372677
                  slli         a3, s11, 13
                  fcvt.wu.s    s10, fa2
                  srl          t0, s1, a4
                  fcvt.wu.s    t2, ft5, rup
                  mulhsu       s1, t0, s4
                  mulh         s0, t3, s2
                  addi         t4, t5, -1860
                  fsgnjx.s     fa5, fs8, fa0
                  remu         s9, s5, a1
                  sub          s4, s3, a4
                  sltu         s1, a7, a6
                  fsgnj.s      fs6, fs6, fs8
                  fsub.s       ft2, ft8, ft8, rup
                  fsgnjx.s     fs0, ft8, fs3
                  fcvt.wu.s    s7, ft1, rtz
                  fcvt.s.w     fs4, t6, rtz
                  remu         a2, t3, a7
                  mulh         s3, t1, s10
                  fdiv.s       fs5, ft7, ft6
                  fcvt.s.w     fs5, a5
                  srl          a7, s11, s8
                  divu         s9, a1, s3
                  fdiv.s       ft1, fa0, ft6, rne
                  fsub.s       ft1, fa5, ft10, rtz
                  or           a2, s2, s8
                  mulhu        a2, s8, a1
                  sub          tp, t3, s1
                  fdiv.s       ft6, fs6, fa4, rup
                  fcvt.s.wu    fs5, s5, rdn
                  div          t5, a2, a2
                  or           s5, a5, s11
                  fmv.x.w      s5, ft10
                  fmin.s       ft8, ft10, fs2
                  fdiv.s       fa5, ft8, fs0
                  divu         s10, a6, s9
                  sll          s11, s4, s5
                  srai         gp, s9, 7
                  fcvt.s.w     fa3, zero
                  and          ra, s6, t3
                  fle.s        a2, ft10, fa0
                  flt.s        t5, fs6, fa2
                  fmv.w.x      fs0, a5
                  fsgnjn.s     fs2, fa2, fs4
                  mulhu        s2, t5, t3
                  remu         a6, t3, t4
                  srli         a4, s8, 27
                  fmax.s       ft3, fa1, ft2
                  mulhsu       s6, gp, tp
                  fdiv.s       fa0, fa2, fa2
                  or           t2, a2, s4
                  fdiv.s       fa6, fs7, fs7, rdn
                  fsgnjx.s     fs2, ft6, ft10
                  divu         s7, ra, gp
                  fcvt.w.s     s1, ft3
                  srl          t4, t6, s3
                  divu         t2, s0, s3
                  sltu         s9, s11, gp
                  sra          s0, a6, a0
                  fmv.x.w      s8, ft9
                  fmin.s       fa4, fs6, fa1
                  mulh         s3, a0, tp
                  fclass.s     s7, fs8
                  slt          a3, s7, zero
                  addi         tp, gp, 557
                  sltiu        gp, a2, -1908
                  xori         s8, s9, 1672
                  mulhu        a4, s11, a6
                  auipc        a5, 221934
                  andi         a0, a6, -1333
                  slti         s8, s10, 427
                  fmul.s       fa7, ft0, ft0
                  sll          t6, a6, t6
                  sll          s10, a6, a7
                  fsub.s       fs1, ft2, ft0, rne
                  sltiu        a3, s9, 940
                  fdiv.s       fs0, ft8, ft11, rdn
                  rem          ra, s2, sp
                  add          t4, s5, a6
                  fsgnjn.s     fs10, fa3, fs10
                  fsgnj.s      ft0, fa2, ft7
                  divu         s2, t5, tp
                  div          t4, s6, a6
                  or           t4, t2, a5
                  remu         a3, s11, sp
                  feq.s        t6, ft6, ft3
                  fcvt.s.w     ft8, t2
                  andi         a0, t1, -1200
                  slti         s4, s5, -322
                  fmv.w.x      fa5, s6
                  or           a7, s6, a1
                  fmax.s       fa5, fa0, ft2
                  fsub.s       ft0, fs2, ft9, rdn
                  nop
                  fclass.s     s4, ft11
                  sra          t6, t3, s7
                  fcvt.s.w     ft4, tp, rdn
                  auipc        s0, 527468
                  mul          a4, zero, s9
                  sra          s9, t3, tp
                  slt          t5, s6, s6
                  slti         s10, a3, 850
                  fmv.x.w      zero, ft8
                  add          s0, s4, s6
                  sra          t5, tp, t4
                  auipc        ra, 725208
                  addi         t4, s8, 1036
                  and          a4, s1, s1
                  xor          tp, s2, a6
                  and          a0, s1, t3
                  nop
                  fsgnjx.s     fs0, fa5, fs8
                  fmax.s       fa2, ft2, fa0
                  fcvt.w.s     ra, ft1, rup
                  mulhu        s9, t2, a5
                  div          a7, s3, s11
                  fdiv.s       fs1, fa6, fa1
                  remu         a6, s2, s1
                  slt          s9, a4, a1
                  divu         zero, t5, t5
                  fmin.s       fs2, ft11, fa6
                  mulhu        s4, t0, sp
                  srai         s9, a4, 23
                  sltu         t5, zero, s11
                  fsgnjx.s     ft6, fs0, fs6
                  fsgnjx.s     fs2, ft11, fs5
                  fadd.s       ft9, fs3, fa6
                  or           a2, sp, s11
                  slt          a0, s11, a6
                  srli         a2, t4, 12
                  fclass.s     zero, ft1
                  add          gp, s1, sp
                  andi         a0, s9, 355
                  and          gp, t4, t1
                  fmv.w.x      ft10, a4
                  lui          zero, 380472
                  fsgnjn.s     ft8, fs5, fs4
                  fsub.s       fs8, fa2, fs2
                  fmv.x.w      tp, fs0
                  fdiv.s       fa2, ft9, fs0, rdn
                  fcvt.s.wu    ft6, ra, rmm
                  xori         s7, s3, -1218
                  srli         s3, s9, 11
                  mulh         t6, a5, gp
                  nop
                  fsgnj.s      ft6, ft4, fs0
                  nop
                  fadd.s       ft1, ft0, ft3, rdn
                  sub          a0, t3, a4
                  sub          t0, a2, s2
                  flt.s        s11, fa2, fs11
                  fmul.s       fa4, fs4, fs11
                  fsgnjn.s     fa2, ft4, fs4
                  fcvt.s.wu    fs1, a2
                  feq.s        s4, ft4, ft5
                  sub          s3, gp, t6
                  slt          t6, s10, s10
                  srl          a2, a7, t1
                  nop
                  fclass.s     s7, ft10
                  add          s11, s4, a4
                  xor          t4, a6, t1
                  mulh         a4, zero, s10
                  srli         s6, a3, 15
                  slti         s8, s4, 1945
                  sll          tp, s11, s1
                  remu         s0, s0, zero
                  feq.s        t2, ft5, ft11
                  sltiu        s5, s10, 1032
                  remu         s2, a6, t5
                  fsgnjx.s     fa2, fs11, fs7
                  slti         s10, t1, -710
                  fdiv.s       fa7, ft8, fs5
                  mul          s11, t0, s11
                  fsqrt.s      fs8, fs8
                  fmul.s       fa4, fa4, fs8, rup
                  fadd.s       ft1, ft9, fa0
                  fmv.x.w      a6, ft10
                  sltu         t6, a7, a7
                  fmv.w.x      fs0, tp
                  fsqrt.s      fa1, fa2, rup
                  mulhsu       a6, t3, t3
                  srai         s11, a1, 29
                  fsub.s       fs2, fa3, fs10
                  fcvt.wu.s    a3, fs0, rtz
                  and          a5, a3, a4
                  fcvt.w.s     gp, ft6, rne
                  fmin.s       fa3, fa7, fs5
                  sub          a0, a5, s0
                  fmv.x.w      t0, fa2
                  fmv.x.w      a7, ft2
                  fle.s        s11, fa0, fa5
                  fcvt.wu.s    s11, ft0
                  andi         a5, s7, 541
                  nop
                  nop
                  mulhu        a2, t1, s10
                  mulhsu       t4, s5, a5
                  slti         t6, a1, 1048
                  sltiu        s0, a2, 1585
                  fcvt.w.s     t5, ft8
                  fsgnjx.s     ft9, fa1, ft9
                  rem          s3, s11, s10
                  fsgnj.s      ft9, fs4, fs9
                  srli         t4, s5, 23
                  sltu         tp, a3, a5
                  sltu         t4, t3, ra
                  slli         s0, t4, 18
                  fcvt.wu.s    a5, ft10, rmm
                  fcvt.s.w     fa0, s6, rup
                  slt          t0, a1, s5
                  fsgnjn.s     ft1, fa2, ft10
                  slti         s9, s0, -2024
                  fcvt.wu.s    a2, fs5, rmm
                  sltiu        s5, s5, -526
                  fsqrt.s      fs10, fa7, rne
                  xori         s0, a1, -1678
                  mulh         s2, a3, t2
                  sra          gp, a5, s3
                  mul          zero, t0, t3
                  divu         a5, tp, s6
                  fsgnjn.s     ft10, ft8, fs1
                  fsqrt.s      fs3, fs8
                  fadd.s       fa1, fa4, ft9
                  fsqrt.s      fs5, fs1, rmm
                  nop
                  rem          t0, s11, sp
                  xor          t6, t3, a4
                  nop
                  feq.s        t1, ft3, ft10
                  mul          zero, t4, s3
                  sra          a4, s10, a6
                  sra          ra, tp, s7
                  fle.s        t0, fa7, fa0
                  lui          a5, 633089
                  xor          a3, a5, t4
                  div          t4, s5, ra
                  andi         t1, tp, -1677
                  fmax.s       ft6, fs0, fs2
                  slti         t2, t3, 916
                  fadd.s       ft1, fs6, fs10
                  srl          s6, ra, s4
                  fcvt.s.wu    fa0, t5, rdn
                  nop
                  div          t0, tp, t3
                  lui          s2, 310917
                  nop
                  slli         s11, s7, 8
                  andi         s8, t4, 120
                  fmv.x.w      s9, fa0
                  sltu         a7, a4, a1
                  slti         t1, t3, -741
                  feq.s        a5, ft6, fa2
                  remu         s9, t3, sp
                  sra          a5, s5, a4
                  mul          s9, ra, t6
                  fadd.s       ft8, fs9, fs8
                  ori          s4, a7, 2012
                  fmax.s       ft8, fa1, ft10
                  slti         t4, s1, -198
                  slt          s11, a1, s1
                  mul          s11, t2, s11
                  addi         t1, s3, -138
                  fmv.w.x      fa2, s9
                  feq.s        s6, fa0, fa4
                  sub          a4, s11, t1
                  addi         gp, a1, 855
                  remu         a6, a3, gp
                  fcvt.s.w     fs1, gp, rtz
                  flt.s        a0, fs6, ft11
                  fadd.s       fa1, fs5, ft5, rdn
                  andi         a5, tp, 697
                  mulhu        s0, sp, a4
                  mulhu        s8, zero, s1
                  mulhsu       s11, s9, s8
                  fcvt.s.w     ft9, tp
                  mulh         s3, sp, s10
                  rem          t4, s4, s9
                  fcvt.s.wu    fs1, tp, rup
                  mulhu        tp, t0, t3
                  sltiu        t2, s0, -31
                  divu         t1, a0, t4
                  or           gp, a5, a4
                  remu         zero, a3, t3
                  fmv.w.x      ft3, gp
                  fsgnjx.s     ft5, fs2, fa1
                  addi         s3, s7, 331
                  auipc        t5, 810858
                  fle.s        tp, fs3, fs1
                  fmv.x.w      t6, ft4
                  ori          zero, s0, -717
                  xori         s2, s3, 1814
                  fcvt.s.wu    ft4, sp
                  srli         t5, a6, 28
                  fsgnjn.s     ft8, fs6, fs0
                  rem          a3, a2, gp
                  divu         ra, a1, t3
                  srai         s0, s11, 22
                  divu         t4, a7, s11
                  feq.s        s9, ft7, ft8
                  fmv.w.x      fs7, a5
                  fle.s        s4, fs5, ft5
                  fmul.s       fs5, ft4, fa2
                  fcvt.wu.s    s7, fa0, rdn
                  nop
                  fcvt.s.wu    fs11, a2
                  fcvt.s.wu    ft1, a7
                  sltu         s5, a7, s0
                  flt.s        t0, ft6, fa0
                  fmv.x.w      t6, ft0
                  sll          s5, s1, a5
                  sltu         s1, s4, a7
                  fmul.s       fa6, fs8, fs5
                  fsub.s       ft4, fs0, ft11, rne
                  fsub.s       fa4, fs3, fs8, rdn
                  fmv.w.x      fa2, t6
                  srli         s3, a0, 15
                  fmin.s       fa4, fa5, fa6
                  sltiu        t1, s6, 1388
                  sltiu        t1, s0, -1956
                  xor          zero, zero, s0
                  fcvt.s.wu    fs5, t5, rmm
                  slt          a5, s6, s11
                  fsqrt.s      ft2, ft5, rup
                  fcvt.s.wu    fs9, s11
                  srl          s5, a3, s1
                  feq.s        zero, fa5, ft0
                  divu         s4, s11, t1
                  mulhu        t5, s10, t0
                  mulh         a5, a3, t2
                  andi         t5, a5, 1515
                  fcvt.wu.s    a4, fa7, rup
                  fcvt.wu.s    s7, fa5
                  or           t6, t3, zero
                  fcvt.s.w     fs5, a5, rne
                  sll          s10, gp, s4
                  mul          a0, a4, s9
                  slt          a6, a2, s2
                  sll          a3, s4, s7
                  and          ra, s10, a0
                  mulhsu       s4, a7, a7
                  fmax.s       fs7, fs11, fa2
                  fcvt.wu.s    tp, ft2, rne
                  fmul.s       fa1, ft8, ft2, rne
                  sra          s9, s1, s3
                  div          t4, a4, s1
                  slti         s2, a4, -663
                  fcvt.wu.s    t4, ft0
                  srl          s5, a1, a0
                  fcvt.s.w     ft5, t4
                  mulhsu       gp, sp, s7
                  fmv.w.x      fs11, a1
                  sltiu        s2, s6, 1875
                  fcvt.wu.s    tp, ft5, rdn
                  and          t5, s4, s5
                  div          s11, ra, a1
                  srai         t1, t4, 1
                  divu         a5, ra, a2
                  sltiu        tp, t6, -1175
                  fsub.s       ft5, fa7, fa5
                  nop
                  slt          zero, a2, s8
                  fsqrt.s      fs9, fa0, rdn
                  fmax.s       fs5, fs7, fa1
                  sltiu        s0, s7, -1112
                  srl          tp, sp, a3
                  fsgnjn.s     fa6, fs7, ft7
                  andi         zero, tp, -1567
                  feq.s        s2, fa4, fa7
                  fmv.x.w      s2, fs11
                  or           s4, t3, zero
                  fsqrt.s      fa6, fs2
                  mulhsu       a4, s7, s1
                  fsqrt.s      fs6, fs10
                  mulh         s1, a6, t0
                  auipc        s10, 314384
                  fcvt.s.wu    ft0, a0, rtz
                  xori         a7, t3, 589
                  xor          s9, t0, s1
                  fclass.s     a3, fs9
                  fclass.s     a6, fs4
                  fmv.w.x      fs8, a3
                  mulhsu       a0, t2, s0
                  lui          t5, 169777
                  mul          a4, a7, a5
                  mulh         tp, t1, t1
                  fmv.x.w      a6, fs3
                  mulhu        s7, t6, s9
                  fmax.s       fa5, fa5, fs9
                  ori          t4, a1, -1417
                  sub          gp, t1, sp
                  sra          t5, ra, t4
                  fsub.s       fs3, fs6, fs2, rup
                  lui          s4, 358770
                  fclass.s     a6, fa5
                  fsgnjn.s     fs3, fs9, fs6
                  andi         s4, ra, -719
                  fclass.s     t4, ft2
                  fle.s        a4, fs9, fa3
                  fmax.s       fa5, ft9, fs9
                  fcvt.s.wu    fs2, sp
                  rem          s9, s5, s10
                  nop
                  xor          t6, a1, gp
                  fmul.s       ft2, ft7, fa1, rdn
                  fmv.w.x      fs1, t3
                  add          s7, t1, a7
                  slt          t0, t2, a3
                  fsgnj.s      fa0, fa3, fa5
                  xor          s11, t3, ra
                  sltu         s11, t2, sp
                  fsgnj.s      ft0, ft5, ft3
                  fsgnjx.s     fa6, fs0, fa3
                  fcvt.w.s     t0, ft2, rtz
                  rem          a5, zero, t6
                  sltiu        t1, a6, -1052
                  mulhu        s5, t3, t4
                  fmin.s       ft4, fs3, fs8
                  fcvt.s.w     fs5, t3
                  mulhsu       t2, s10, a1
                  sub          a2, s4, t4
                  fcvt.w.s     s8, fa7
                  fsgnjx.s     fs0, fa0, ft7
                  fmv.x.w      a2, ft1
                  fsqrt.s      fs11, ft3
                  fcvt.s.w     fs4, s7
                  sltu         tp, gp, s10
                  srai         s7, t6, 17
                  sltiu        a5, a4, 114
                  fcvt.w.s     s1, fa6, rtz
                  sra          s5, a0, t4
                  fsub.s       fa2, fs9, fa4, rne
                  and          s1, s2, t5
                  or           t5, s2, a6
                  slti         s11, s3, 1945
                  slli         tp, a5, 1
                  fcvt.wu.s    s8, ft5, rtz
                  fcvt.wu.s    tp, fs6, rmm
                  fdiv.s       ft1, ft10, fa0
                  fcvt.wu.s    s9, fa3, rtz
                  sub          t1, t5, tp
                  fsgnjn.s     ft10, ft0, fa0
                  mul          a7, t4, t4
                  fcvt.s.w     fs8, t1
                  addi         s11, a1, 199
                  fle.s        t2, ft7, fa4
                  fcvt.s.wu    ft6, t0, rtz
                  fsgnj.s      fs3, ft10, fa3
                  div          t0, zero, a7
                  add          t4, t1, t0
                  auipc        s5, 46571
                  fclass.s     t1, fs10
                  fadd.s       fs9, ft9, fs9, rup
                  addi         a7, t1, -1307
                  sra          s8, s6, s4
                  sll          tp, s0, t2
                  andi         t0, s1, 1778
                  andi         s8, a3, 1276
                  fcvt.s.w     fa1, s5, rdn
                  rem          a5, s4, s3
                  andi         a5, ra, 457
                  fdiv.s       ft8, ft4, fa6, rmm
                  fmul.s       ft10, ft3, fs6, rup
                  fdiv.s       ft3, fa5, fa3, rup
                  xor          s1, tp, gp
                  flt.s        t0, fs0, ft5
                  xori         ra, sp, 2021
                  xori         t6, a2, 536
                  mul          s5, s9, zero
                  div          s0, ra, zero
                  nop
                  slli         s11, s3, 19
                  add          s5, ra, a6
                  mulh         s2, a7, t0
                  flt.s        s0, ft9, fa1
                  mulh         s7, a2, s3
                  slti         t5, t5, 1154
                  remu         a4, t4, zero
                  addi         t1, s8, -1024
                  mulhsu       s2, a1, a2
                  slt          a4, s3, s5
                  xor          s4, s3, t3
                  fsqrt.s      fs11, ft6
                  mulhsu       a5, s2, tp
                  mul          t5, s3, s7
                  ori          s9, t5, -1981
                  ori          s3, t6, 1103
                  srl          t1, t0, s8
                  lui          t5, 803114
                  fcvt.wu.s    t5, fs10, rup
                  fsgnj.s      fs8, fs10, fa2
                  srl          s1, s3, s3
                  slli         tp, gp, 24
                  sll          s11, s2, t3
                  fmv.w.x      ft5, t0
                  sra          zero, s4, a5
                  mulhu        s3, t1, s5
                  fmv.x.w      tp, ft5
                  fcvt.w.s     t2, fs10
                  auipc        zero, 635642
                  fcvt.s.w     fa7, s0
                  srl          t5, s2, s10
                  lui          a0, 862294
                  fmv.w.x      fa0, t2
                  srli         t2, tp, 22
                  flt.s        s3, ft1, ft6
                  fcvt.w.s     zero, fs10
                  fsgnjn.s     ft0, ft7, ft11
                  divu         s8, sp, t2
                  divu         a4, s3, s9
                  srai         s2, s0, 0
                  fcvt.w.s     t6, ft8
                  fcvt.s.wu    fs11, a3
                  feq.s        s7, fa3, fa6
                  srli         a6, s3, 9
                  fcvt.s.wu    fa6, tp
                  fmv.x.w      t4, ft7
                  sltiu        s10, ra, -1342
                  srl          t1, s5, zero
                  slt          s8, t1, ra
                  fle.s        a3, fs10, fa2
                  fsgnjn.s     ft6, fs5, ft8
                  srli         s0, a6, 23
                  fcvt.s.wu    fs1, t3
                  fmax.s       ft8, fs0, fs8
                  fcvt.wu.s    s9, fs11, rup
                  divu         a6, tp, gp
                  sltiu        a5, s11, 1357
                  nop
                  mulhu        s10, a2, s3
                  or           a5, s5, t5
                  fcvt.w.s     t4, fs1
                  sra          s7, s1, s7
                  fsgnjx.s     ft7, ft5, fs6
                  ori          a2, a5, -819
                  fle.s        a6, fs11, fs7
                  fsgnjx.s     fs8, fa5, fs0
                  slti         s2, t3, 352
                  lui          s9, 325228
                  srli         s9, t6, 20
                  fdiv.s       fa5, fs7, fa1, rup
                  div          a4, s2, a7
                  sll          a7, a5, s5
                  fmul.s       fs1, fs7, ft6
                  fadd.s       ft10, fs10, fa6, rne
                  auipc        t4, 68177
                  nop
                  div          t5, t5, t1
                  srai         s9, t1, 30
                  mulhsu       a7, s5, t6
                  fsgnjx.s     ft6, fs10, fs7
                  add          a7, sp, t3
                  fdiv.s       fa5, fa5, fs10, rmm
                  fmul.s       ft3, ft3, fs5, rne
                  divu         s8, t2, t4
                  sll          tp, a3, t3
                  srai         t4, a3, 21
                  andi         gp, s7, -326
                  sltiu        t4, a4, 1839
                  mulhu        s2, s11, t0
                  fcvt.s.wu    ft3, s6
                  slt          s2, a6, zero
                  fmv.w.x      fa4, t1
                  sra          s10, s8, s4
                  fsgnj.s      ft7, ft8, ft7
                  fsgnjx.s     ft7, fa3, fs11
                  remu         t4, s2, sp
                  srli         ra, t0, 10
                  rem          s3, a1, t6
                  fcvt.s.wu    ft10, a4
                  fsgnj.s      fa5, fs8, fa0
                  fmax.s       fa6, ft3, fa2
                  mul          s5, s6, t0
                  feq.s        a6, fa7, fs3
                  fmul.s       fs9, fa3, ft0, rtz
                  fcvt.s.wu    ft6, a2
                  andi         s2, s5, -1507
                  fadd.s       fs8, fa3, ft7
                  mulhu        a7, s8, s7
                  mul          zero, s3, s5
                  fadd.s       ft4, fa0, ft6, rdn
                  divu         s5, tp, t5
                  fadd.s       fs10, fs0, ft5, rup
                  fle.s        gp, fa2, fa3
                  nop
                  mulhsu       s10, s4, t6
                  sltiu        tp, t4, 397
                  addi         s10, tp, -1487
                  sub          a7, t0, s4
                  slli         ra, s11, 1
                  mulhu        a4, s3, a3
                  slt          a2, t5, t3
                  nop
                  srli         t6, s4, 2
                  remu         t6, a6, a5
                  sltu         s6, s2, a0
                  mulhsu       s1, a4, s5
                  fmul.s       fs5, ft7, ft2
                  mulh         s1, a0, s4
                  fsqrt.s      ft7, ft9, rtz
                  fsgnjn.s     fa2, fa0, fs8
                  rem          gp, a2, t1
                  nop
                  sub          t1, s1, s9
                  or           t0, t3, s9
                  xor          s9, s3, t5
                  andi         a4, t1, -1218
                  fclass.s     s4, fa1
                  mul          s11, a4, a4
                  fsgnjx.s     fa6, fa2, fa5
                  divu         s0, s3, s11
                  remu         tp, a2, zero
                  fcvt.wu.s    a6, fs8
                  fmin.s       fa0, fs11, fa4
                  fle.s        s2, fs6, ft1
                  xori         t0, t0, -225
                  fadd.s       fa4, ft10, ft7
                  sub          s0, s6, s9
                  sltu         zero, t2, t3
                  sub          t6, s9, s8
                  slli         s6, s11, 27
                  srai         s10, s2, 19
                  srli         t1, t2, 31
                  add          s5, a0, s6
                  fmv.x.w      t5, fs8
                  fsgnjn.s     ft2, fa5, fs4
                  fdiv.s       ft9, fs9, fa6
                  slti         a2, tp, 911
                  srl          s7, s3, sp
                  fmin.s       fa0, fa3, fa4
                  fclass.s     s1, ft3
                  fmul.s       ft10, ft5, fa6
                  fmin.s       fs9, ft11, fs1
                  sll          a4, a6, s1
                  fcvt.s.wu    fa1, s6
                  sll          a5, a4, s0
                  add          s2, t6, a7
                  fle.s        zero, ft1, fs1
                  slli         a0, a7, 5
                  addi         t2, t1, 924
                  xori         t1, s11, 246
                  fmv.x.w      t5, ft3
                  fsgnjn.s     ft4, ft0, ft6
                  fcvt.wu.s    gp, fa1, rdn
                  xor          t6, t6, t4
                  divu         s10, t5, s10
                  add          s4, s1, s8
                  fsgnjn.s     fs1, fa0, ft9
                  fsgnj.s      fs10, fs8, ft11
                  mulh         zero, s8, a0
                  fcvt.s.wu    ft1, s2, rmm
                  mulhu        zero, a0, ra
                  auipc        t5, 118385
                  feq.s        s2, ft2, fs4
                  divu         s2, ra, a2
                  mulhsu       t6, a6, s1
                  fdiv.s       ft1, ft2, fs4
                  fadd.s       fa0, fs9, ft1, rne
                  slt          tp, a0, s1
                  flt.s        s10, fa1, fs6
                  add          t2, s10, s2
                  and          t0, t0, t0
                  andi         a4, sp, -1368
                  fsgnjn.s     fa1, fa3, ft9
                  fclass.s     s6, fa6
                  fsqrt.s      fs2, fs9, rne
                  xor          a2, a1, t6
                  fsgnj.s      fa2, ft5, fa3
                  fmax.s       ft3, fa2, fs8
                  addi         a5, gp, -1690
                  addi         tp, t4, -684
                  fmin.s       ft3, fa6, ft2
                  slli         t0, s9, 24
                  fcvt.s.wu    fs5, s8, rdn
                  mulhu        s8, s6, sp
                  srai         t1, s2, 14
                  fmul.s       fs5, ft7, fs11
                  fmax.s       fs3, fs2, fa6
                  fcvt.w.s     s5, fs0
                  slt          s6, a1, t6
                  andi         s3, ra, 678
                  feq.s        s2, ft9, ft1
                  slti         s8, t3, 447
                  fmax.s       ft2, fs7, ft10
                  mulh         s2, a3, a7
                  andi         t6, t3, -1695
                  fsqrt.s      ft2, ft3, rup
                  div          s10, a7, a2
                  andi         a5, t2, 149
                  fmin.s       fs0, fa6, fa4
                  fle.s        zero, ft3, ft10
                  remu         s6, t0, s0
                  slli         a4, t5, 7
                  slt          s11, s5, t4
                  fsgnjn.s     ft7, fa0, fa5
                  nop
                  sltiu        t2, sp, 125
                  srai         s1, s11, 20
                  sltu         t2, a5, s11
                  div          a4, t6, s6
                  srai         t4, t1, 12
                  fadd.s       fa6, ft10, fa6, rtz
                  xori         s1, a7, 926
                  fclass.s     s1, fa2
                  fle.s        s2, fa0, fs5
                  fcvt.w.s     a5, fs2
                  xori         s3, s5, 950
                  fcvt.w.s     s11, ft6, rdn
                  fadd.s       fs3, fs3, fs9
                  sub          a3, s1, s10
                  fcvt.wu.s    s8, fs1, rtz
                  fsgnj.s      fs11, ft2, ft3
                  slti         a7, s0, -1079
                  or           a3, t1, s1
                  srli         a2, a7, 29
                  mulhsu       s1, a3, ra
                  sll          a5, ra, s5
                  fcvt.wu.s    a7, fs7
                  mulhsu       a0, s4, sp
                  fclass.s     s10, fa3
                  srai         a5, s4, 4
                  sub          gp, t5, a0
                  mulh         a5, s3, s11
                  sltu         t0, s7, a3
                  fmv.x.w      s3, fs7
                  fcvt.s.wu    ft10, s2
                  slti         s3, a0, -377
                  srai         t0, t5, 31
                  ori          tp, s6, 835
                  divu         t2, t0, s1
                  sltu         s3, sp, s0
                  fcvt.wu.s    a0, fa2, rup
                  mulh         t1, s8, s9
                  and          t5, s3, sp
                  srl          a6, t1, a7
                  sltiu        s9, a0, 728
                  fcvt.w.s     a3, ft10, rdn
                  sltu         s10, a2, sp
                  andi         zero, s9, 776
                  slt          s10, s11, s7
                  sltu         s2, gp, t4
                  fcvt.s.wu    fs6, t6
                  fmul.s       fs3, fs5, ft9
                  feq.s        t4, fa0, ft5
                  sltu         t5, a3, s0
                  fmv.w.x      fs7, s10
                  fmv.w.x      fs1, a5
                  addi         gp, sp, -1631
                  xori         t6, a6, -1353
                  sra          s3, s11, tp
                  fcvt.s.wu    ft10, gp
                  or           t6, t4, a6
                  fmax.s       ft4, fa6, ft5
                  fmv.x.w      a2, ft8
                  srli         t2, tp, 15
                  feq.s        s10, fs2, ft9
                  and          t4, t3, sp
                  srli         s8, t3, 21
                  fle.s        a0, ft1, fa2
                  sll          s5, s8, s7
                  auipc        s10, 828340
                  sra          t6, gp, s11
                  fsub.s       fa1, ft2, ft2, rdn
                  fclass.s     s8, fs1
                  lui          s1, 825252
                  mul          t6, a2, a6
                  fcvt.s.w     ft3, a4, rdn
                  mulh         s7, t0, t0
                  auipc        tp, 24496
                  srli         t4, s1, 0
                  slti         t2, t6, -1652
                  fcvt.s.wu    ft6, s0
                  and          zero, a5, s10
                  andi         s0, gp, -298
                  mulhu        t6, t2, a5
                  fcvt.w.s     s11, fs9, rup
                  sll          s0, a2, ra
                  sltu         s4, s7, s6
                  srli         gp, a4, 23
                  divu         s0, a3, t2
                  add          s9, s0, a2
                  xori         s6, a4, -149
                  andi         ra, tp, -1414
                  fsgnj.s      fa7, fs5, fs10
                  fmax.s       ft10, ft7, ft10
                  slt          t0, tp, s11
                  ori          a4, ra, 1981
                  mulhu        a4, t2, a1
                  srl          a5, sp, t2
                  flt.s        s8, ft8, ft11
                  mulhsu       t6, sp, gp
                  addi         s10, s3, -534
                  sll          tp, gp, t4
                  sltu         t1, zero, s1
                  fmv.w.x      fa0, s8
                  slt          s10, s1, s8
                  fsgnjx.s     fs8, fs2, fa3
                  sub          t5, s5, sp
                  srl          ra, t3, gp
                  slti         s7, a3, -278
                  rem          s4, t4, a5
                  xori         a0, a4, 999
                  fmv.w.x      fa2, t2
                  fadd.s       fs0, ft8, fa6, rne
                  andi         gp, t0, -1244
                  andi         s11, ra, -457
                  auipc        s3, 307806
                  sltiu        s0, a6, -1311
                  sltiu        s11, a6, -1897
                  auipc        gp, 60480
                  xori         t2, t6, 1560
                  fsgnjx.s     fs3, ft9, fs2
                  mulh         s5, a7, gp
                  slt          t4, t1, s10
                  mulhu        s5, t3, a4
                  fcvt.wu.s    a2, fs3
                  fmin.s       fa2, ft2, fs8
                  fmax.s       fs7, fs4, ft9
                  xori         s10, a4, 1256
                  sub          s5, s6, t0
                  fmax.s       fa6, fs7, ft6
                  divu         a3, s3, s9
                  fdiv.s       fs4, ft5, fa2
                  srl          a2, s5, s4
                  slt          a0, a5, sp
                  nop
                  fsgnjx.s     fa6, fs2, ft1
                  add          a6, s9, t6
                  fcvt.s.wu    ft6, s6, rup
                  fmul.s       fs2, fs6, fs5, rdn
                  fmul.s       fs9, ft1, fs5, rtz
                  fsgnj.s      ft0, fs11, fs3
                  fmax.s       fa0, ft10, fa4
                  sra          a6, gp, ra
                  sll          a0, zero, s2
                  srl          s0, s5, a5
                  fmul.s       fs0, fa1, fs1, rne
                  fle.s        a4, ft11, fs2
                  fdiv.s       fa1, ft1, ft0, rdn
                  fsub.s       ft8, fa6, fs8, rne
                  fmin.s       fs2, fs7, ft4
                  fsgnjn.s     fs10, ft9, fa5
                  xor          t6, t6, t0
                  feq.s        a6, ft8, ft1
                  mulhsu       s6, t5, a3
                  fmv.x.w      t0, ft6
                  lui          gp, 29784
                  rem          a4, t0, s9
                  fdiv.s       fs8, fs4, fa4
                  fsqrt.s      fa7, fs0
                  srai         s7, a7, 21
                  xor          s5, zero, a2
                  xori         s7, s9, -206
                  mulhu        s8, s7, zero
                  fle.s        zero, fa0, ft3
                  xori         t2, s9, -1004
                  add          s9, a5, sp
                  fsgnjx.s     fs6, fa3, fa1
                  sra          a0, s10, a0
                  flt.s        s4, ft11, fa2
                  flt.s        s5, ft8, ft5
                  lui          a7, 884763
                  mulh         s10, a2, s10
                  feq.s        s10, fs5, fa3
                  mulhsu       s7, gp, t2
                  fcvt.w.s     s10, fs0
                  andi         a3, a6, 1155
                  fcvt.s.wu    ft7, gp, rtz
                  fsgnj.s      fa1, ft9, fa6
                  mulh         s0, s6, a2
                  fsgnj.s      fa3, fa0, fs1
                  slt          a0, t4, a6
                  slti         a6, a3, 59
                  feq.s        t0, ft7, ft10
                  fsgnjn.s     fs9, ft5, ft9
                  fcvt.s.wu    fs9, a7
                  mulhu        t6, s2, s1
                  fsqrt.s      ft3, fa1
                  feq.s        s2, fs11, ft8
                  add          t5, t4, t1
                  divu         ra, a0, s3
                  fsgnj.s      fa5, ft1, fs7
                  xori         a0, a1, 876
                  fcvt.s.w     fs3, a7
                  fmul.s       fa4, ft0, fa4, rdn
                  sra          s0, t4, s0
                  fmax.s       fs7, fs5, fs11
                  fcvt.w.s     tp, fa6, rmm
                  sltu         a2, s10, a3
                  lui          a0, 712940
                  srai         zero, a0, 18
                  ori          a5, s1, -112
                  or           s1, a3, s3
                  fmul.s       fa6, ft3, fs3
                  fclass.s     s4, ft3
                  fdiv.s       fa4, ft8, ft2
                  remu         s1, a5, t0
                  div          zero, t0, tp
                  addi         s3, a3, 564
                  slti         t6, s9, -766
                  fdiv.s       ft5, ft4, fa1
                  flt.s        s3, ft11, ft8
                  fcvt.wu.s    t0, ft2, rne
                  fmul.s       ft5, fa4, fa2, rtz
                  auipc        ra, 266317
                  srai         a6, t4, 25
                  sll          s6, a0, s4
                  divu         a5, a4, sp
                  srli         t1, s7, 22
                  sra          s7, a5, s0
                  srl          s0, s6, t5
                  srai         zero, a6, 31
                  add          s2, a2, gp
                  fadd.s       fs11, ft2, fa5, rup
                  fsqrt.s      ft1, ft11
                  fcvt.s.w     fs9, a1
                  sub          s7, tp, t2
                  rem          s7, s11, a0
                  sltiu        s5, t1, 640
                  andi         gp, a5, -1006
                  fcvt.w.s     a4, fs0
                  srai         gp, sp, 24
                  fcvt.w.s     a0, fs7, rup
                  lui          s3, 361940
                  fmax.s       fa0, ft7, ft4
                  andi         t4, s8, 1239
                  div          s0, a7, zero
                  mul          s6, s8, s5
                  fle.s        s9, fs0, ft6
                  fmv.x.w      a3, fa1
                  fmin.s       ft1, fa6, ft3
                  sll          s8, ra, zero
                  nop
                  remu         s5, a2, a6
                  fdiv.s       ft8, fs2, ft0, rne
                  fle.s        t2, ft2, fs0
                  addi         s9, a5, -133
                  fle.s        a4, ft6, ft6
                  sltiu        a2, s2, -1467
                  fmax.s       fa2, fs11, fs3
                  flt.s        a0, ft6, fa6
                  sub          s3, s0, tp
                  xor          a7, t5, ra
                  fsgnj.s      fs5, fa4, ft6
                  fsub.s       fs1, fs1, fa5, rdn
                  rem          t5, s5, s2
                  slt          s5, sp, s4
                  fsgnjn.s     ft1, fs1, fs8
                  auipc        a5, 1001372
                  fcvt.wu.s    a6, fa3
                  fsqrt.s      fs5, fa2, rtz
                  fcvt.w.s     a4, fs2
                  slt          t1, t1, gp
                  sra          a2, s11, gp
                  fsgnjx.s     fs10, fs8, fa4
                  sll          s3, t2, s9
                  srl          a2, t3, s2
                  srl          t2, s0, a1
                  fdiv.s       fa5, ft3, ft2
                  mulh         s2, s0, s11
                  slti         t2, tp, -1856
                  slti         a6, a3, 963
                  mulh         t0, s2, t4
                  fsgnjx.s     fs2, fa0, fs6
                  xor          a5, s9, s6
                  xori         a3, s9, 838
                  add          t1, zero, a1
                  fmin.s       ft7, ft5, ft6
                  addi         a7, s6, -1094
                  fclass.s     s1, fs4
                  fdiv.s       ft4, fs3, fs5, rup
                  fmax.s       fs8, fa1, ft2
                  fsgnj.s      ft11, fs7, fs4
                  fsub.s       fs4, fs11, fa4
                  sub          s3, s10, a6
                  fmv.w.x      fs0, t2
                  fcvt.w.s     t1, fs10, rne
                  mul          zero, s3, s6
                  fmul.s       fs11, fs3, fs1
                  andi         t5, a5, 682
                  flt.s        a0, ft3, fs0
                  mulh         s8, t1, s2
                  sll          s10, tp, tp
                  fmin.s       ft11, ft9, fs9
                  and          s10, t4, tp
                  sltiu        gp, s11, 1979
                  fsqrt.s      fs1, fs8, rup
                  fsgnjn.s     ft9, fs6, fs2
                  auipc        zero, 1000980
                  lui          t5, 840801
                  fadd.s       fs6, fs4, fa5
                  fadd.s       fs3, fa4, fs8
                  fmin.s       fs8, fs0, fs8
                  sltu         s10, a5, s11
                  fsgnjx.s     ft8, fs5, fs8
                  fcvt.s.w     ft0, ra, rtz
                  sltiu        s11, s3, -1691
                  rem          s7, s11, a5
                  xor          tp, t3, a4
                  fcvt.w.s     s10, fs0, rmm
                  feq.s        t1, ft10, ft0
                  or           t1, t4, a3
                  auipc        a0, 420403
                  ori          a4, s1, -527
                  nop
                  or           a4, s1, ra
                  fmv.x.w      s1, ft8
                  fsgnjn.s     ft2, fs3, fs8
                  feq.s        s6, fa2, fs10
                  fsgnj.s      ft11, fs7, fs6
                  fsqrt.s      fa6, ft7, rdn
                  fsgnjn.s     ft7, fs7, fa1
                  fsgnjx.s     ft0, fs8, fa5
                  fcvt.w.s     a5, fs1
                  fmv.w.x      fs1, t6
                  sll          s1, t6, gp
                  lui          s7, 319415
                  fsgnjn.s     ft8, ft4, ft4
                  fmv.w.x      fa7, s2
                  fcvt.s.w     fs1, s5, rdn
                  slli         s11, a4, 24
                  mulhu        s7, a7, a0
                  fsgnjx.s     fa1, fs6, fa1
                  div          t4, t4, s10
                  sll          a3, t2, a6
                  feq.s        s6, fs4, fs10
                  srai         s5, s5, 0
                  srli         t0, s2, 9
                  fsgnj.s      ft2, fs10, fs3
                  flt.s        a6, ft2, fs2
                  fcvt.wu.s    a5, ft8
                  divu         s1, a3, t1
                  xor          t2, s8, a7
                  ori          t0, t3, -1666
                  fle.s        s11, fs3, fa0
                  fcvt.wu.s    t4, fa3
                  divu         a4, a5, a4
                  fadd.s       ft1, fa2, ft7, rmm
                  fsqrt.s      fs8, ft4, rdn
                  slti         a6, zero, -165
                  fdiv.s       fa0, fa7, ft2, rdn
                  fle.s        s8, ft10, fs11
                  srl          t4, tp, s10
                  fdiv.s       fs10, fa5, fs5
                  fcvt.w.s     t4, fa1
                  fclass.s     s10, fs5
                  fmul.s       ft8, ft6, ft1, rup
                  mul          a0, s5, a2
                  slt          a7, zero, a4
                  fmv.x.w      gp, fs1
                  xori         zero, s0, 1797
                  fadd.s       ft6, fs1, ft0, rdn
                  slti         s6, s8, -927
                  flt.s        s5, fs2, fa3
                  fsqrt.s      fa3, fa7, rne
                  fmv.w.x      fa5, sp
                  andi         t4, t2, 609
                  sll          t4, a0, t5
                  slli         ra, s10, 31
                  fcvt.wu.s    t0, ft4, rtz
                  xori         s1, s0, 1854
                  mulhu        a6, s0, s10
                  remu         a4, t0, zero
                  fsgnj.s      fs1, fs0, fs1
                  slt          s2, t2, s8
                  fmv.w.x      fa6, s11
                  mul          tp, s0, s4
                  remu         s3, a5, a6
                  fsgnjx.s     fs8, ft6, fs0
                  fmv.w.x      fa2, s4
                  rem          tp, s5, t1
                  srai         t2, t4, 2
                  fadd.s       fa5, ft2, fa1
                  div          t4, s3, t5
                  div          s7, a5, t4
                  lui          tp, 951863
                  fcvt.w.s     s6, fs1
                  fcvt.s.w     ft11, ra
                  and          a3, s7, t2
                  mulhsu       s8, t5, s9
                  fcvt.wu.s    ra, fa2
                  fmv.x.w      s11, fs0
                  slt          ra, s8, zero
                  flt.s        tp, fs6, ft2
                  sll          t1, s4, tp
                  sub          tp, s5, s3
                  sltiu        s7, gp, -1368
                  fmax.s       ft9, ft7, fs8
                  add          s6, ra, zero
                  fsgnjx.s     fs11, fs11, ft11
                  flt.s        s11, fs2, ft6
                  srli         t1, a4, 11
                  sub          s1, s2, s1
                  srli         t4, a7, 21
                  fcvt.w.s     t2, ft11, rtz
                  fmv.x.w      s11, ft10
                  div          s4, a6, s1
                  andi         s6, a2, 1724
                  fle.s        s6, fa1, fa2
                  mulhsu       s3, a6, a4
                  fsgnjn.s     ft2, ft8, fs9
                  slli         a7, ra, 30
                  fclass.s     t2, ft8
                  fsgnjn.s     fa2, fs4, fs10
                  fmax.s       ft6, fs9, fs9
                  mulhu        s3, t6, s0
                  div          s2, s11, s4
                  mulhsu       t5, tp, t0
                  fsub.s       ft3, fs4, fs7, rup
                  fmv.x.w      t4, fs1
                  srli         ra, t4, 21
                  fsqrt.s      fa5, ft1, rmm
                  slti         a2, s6, 1637
                  fcvt.w.s     a3, ft10, rdn
                  slli         s4, s10, 5
                  sltu         a3, a3, sp
                  sltiu        a5, s11, -1006
                  div          s4, a0, t4
                  fmax.s       ft1, ft6, ft6
                  div          t6, s5, zero
                  fadd.s       fs4, fs6, ft4
                  or           zero, s3, s2
                  fsqrt.s      fa5, ft5, rtz
                  auipc        s1, 360194
                  nop
                  fdiv.s       ft10, ft4, fa3
                  remu         t1, zero, s1
                  fmin.s       fa7, fa2, ft9
                  slli         s2, s10, 15
                  sra          s2, t2, t4
                  srai         s6, s7, 17
                  fle.s        zero, ft1, ft2
                  mulh         s5, t5, a3
                  feq.s        a0, ft8, ft3
                  and          s4, t6, s11
                  mulhu        s7, a2, s8
                  fsqrt.s      ft7, fa5, rne
                  nop
                  fmv.w.x      fa0, t2
                  fdiv.s       fa3, ft8, fs1, rup
                  xor          ra, ra, t6
                  lui          s10, 451240
                  fadd.s       fs6, fa6, ft7, rmm
                  feq.s        s1, ft1, ft0
                  srl          t4, a4, a2
                  add          a5, a3, s6
                  fle.s        t5, ft2, fs1
                  andi         t6, s9, 747
                  fmin.s       fs1, ft7, ft7
                  fmul.s       ft11, ft5, fs4
                  ori          s3, a3, -1980
                  fmv.w.x      fs11, a6
                  sltiu        s8, s9, 864
                  xori         a5, a1, 110
                  fmax.s       ft6, fs11, ft6
                  mulhu        a6, s8, s2
                  mul          a6, s7, t1
                  mul          t6, s9, s8
                  fcvt.wu.s    a0, fs10, rne
                  fmv.w.x      ft7, a3
                  mulhsu       s2, a7, s11
                  xori         a2, sp, -1459
                  fcvt.w.s     a6, ft7
                  flt.s        zero, ft0, ft3
                  mulhu        s11, s11, a1
                  fsgnj.s      fa5, fs1, ft5
                  sltu         tp, ra, a0
                  remu         s4, a1, t4
                  mul          ra, s2, a0
                  add          a0, a5, t5
                  mul          s9, s11, a7
                  fmv.w.x      ft2, t6
                  sub          s10, a3, t3
                  auipc        s10, 16152
                  sub          a3, ra, t3
                  fmul.s       fs1, ft0, fs3
                  xori         t1, s6, -536
                  fsqrt.s      fs4, ft10
                  rem          a3, s1, zero
                  mulh         a0, sp, t0
                  sub          t6, t3, s0
                  fsub.s       fa0, ft2, fs8, rmm
                  fcvt.wu.s    a6, fa3, rmm
                  auipc        gp, 933560
                  and          gp, t6, gp
                  div          a6, ra, tp
                  fle.s        a5, ft1, fa6
                  remu         s5, a6, t6
                  auipc        t0, 38438
                  nop
                  fmin.s       fa6, fs4, ft4
                  add          s6, sp, gp
                  fsub.s       fs11, fs3, fs9
                  fsub.s       fa4, ft7, ft3, rdn
                  fcvt.wu.s    a5, ft0
                  fmul.s       ft8, fa5, fs3, rup
                  fsgnjx.s     ft9, ft0, fs5
                  sll          t5, s1, t6
                  fmv.x.w      a4, ft9
                  nop
                  or           s6, t5, a2
                  slli         a2, tp, 0
                  xor          s8, a0, t4
                  div          a6, ra, s3
                  auipc        gp, 37513
                  fle.s        s8, ft7, fs4
                  fdiv.s       ft4, ft5, ft0
                  lui          a0, 670493
                  fsqrt.s      fa0, ft11, rne
                  mul          t0, t2, t0
                  fcvt.wu.s    s7, ft4, rup
                  feq.s        s7, fa5, fa7
                  flt.s        s9, fs5, fs0
                  fcvt.s.w     fa7, t0, rup
                  flt.s        t5, ft9, fs7
                  mulhu        s6, t6, a3
                  fmv.w.x      ft11, s9
                  fmax.s       fs7, fa4, ft9
                  fsgnjx.s     ft7, fa0, ft10
                  rem          a6, t3, a5
                  slli         a7, t0, 26
                  fcvt.w.s     a6, ft2
                  sra          t6, a6, s9
                  and          a6, t1, s3
                  srl          s9, s9, a2
                  fmul.s       ft11, ft8, fs5, rne
                  slli         s5, a7, 29
                  mul          s5, s11, s5
                  or           s7, a4, s3
                  fmv.x.w      t0, fa5
                  flt.s        t4, fs0, fa7
                  or           a5, s7, gp
                  fmv.x.w      tp, fa1
                  fmv.x.w      s10, fs1
                  fcvt.w.s     t1, fs3, rup
                  slt          s6, t2, a1
                  or           t1, s5, a6
                  and          a6, s1, t5
                  ori          s0, sp, 996
                  sltiu        t0, s1, 1538
                  nop
                  fsgnj.s      ft3, fs9, fs0
                  div          s1, a2, s1
                  mulh         t1, t6, t4
                  fsub.s       fs4, fs11, fa1, rup
                  auipc        a7, 538170
                  fdiv.s       fs5, ft0, ft10
                  ori          s10, sp, 505
                  fcvt.s.wu    fs8, t2, rmm
                  addi         t5, tp, 540
                  or           s6, s7, t6
                  fle.s        s11, ft10, fs6
                  mul          s7, s0, a7
                  nop
                  fle.s        s6, fa4, fa0
                  mul          a7, t2, t0
                  div          a2, t1, t4
                  fle.s        t4, fs2, ft8
                  div          s1, a4, a2
                  fsgnj.s      fs3, fa7, fs0
                  sub          t2, zero, s2
                  fcvt.s.w     ft1, s2, rdn
                  fdiv.s       fa5, ft8, ft2, rmm
                  mulhu        tp, ra, a6
                  fmax.s       ft8, fs4, fa1
                  fmv.w.x      ft10, s6
                  div          s8, ra, a5
                  feq.s        a6, fa4, fs2
                  fcvt.w.s     zero, fa0, rdn
                  divu         s6, s6, t0
                  srl          a4, s8, a6
                  fsub.s       fs10, ft10, fa7
                  lui          s0, 228731
                  srai         s11, a4, 7
                  auipc        s8, 529072
                  remu         s3, t4, a0
                  fcvt.wu.s    a3, fs0, rdn
                  add          s6, a5, s7
                  fcvt.w.s     a7, ft3
                  fcvt.s.wu    ft11, ra, rup
                  sltiu        t2, a6, 1
                  addi         t1, s11, 1883
                  xor          t5, a4, t2
                  sltiu        a0, t4, -55
                  addi         t1, zero, 1595
                  or           s5, gp, t2
                  sub          a7, s10, gp
                  fle.s        s7, ft10, fs0
                  xor          a7, a3, t6
                  fmv.x.w      s6, ft9
                  fsqrt.s      fs4, fs6, rup
                  srai         a4, s8, 14
                  xor          s8, a3, s1
                  srl          s5, a3, s6
                  fmul.s       fa5, fa1, fa7, rup
                  fcvt.s.wu    ft1, a5
                  fmax.s       fs2, ft11, ft9
                  srai         s5, a1, 6
                  fcvt.s.wu    fa0, t3, rup
                  nop
                  addi         tp, t5, 559
                  fsgnj.s      fa1, ft0, fs4
                  sra          s1, s8, a7
                  sltiu        s9, a5, -1480
                  fle.s        t2, fs11, ft0
                  lui          t0, 424301
                  fmax.s       ft5, fs11, ft7
                  fclass.s     s11, ft0
                  fmul.s       ft4, fs8, fs4, rup
                  sub          s10, ra, s11
                  and          gp, tp, s11
                  mul          s10, s2, t2
                  flt.s        a0, ft7, fs7
                  fsqrt.s      ft2, fs4
                  srai         s7, s1, 13
                  srl          a6, a6, t2
                  and          zero, t6, t1
                  fcvt.wu.s    zero, fa6, rup
                  div          s0, s5, s10
                  slti         t0, s10, 129
                  srl          s8, t4, t0
                  fcvt.s.w     ft6, s1, rup
                  fclass.s     s4, ft3
                  slt          s6, s11, s10
                  fclass.s     t2, ft6
                  fmin.s       ft6, ft11, ft7
                  fsub.s       fs3, fs5, ft3
                  slli         t2, t1, 24
                  slli         t1, s8, 11
                  divu         ra, a5, s0
                  fmv.x.w      s11, fs7
                  slti         s5, s8, -1880
                  remu         s2, t6, a2
                  mulh         s4, t5, s11
                  srli         s8, a6, 23
                  srai         t0, s0, 25
                  feq.s        s8, fs1, ft2
                  flt.s        t4, fs5, fa6
                  and          s1, t1, a7
                  sll          tp, s7, a4
                  lui          s11, 669392
                  fsgnj.s      fs1, ft8, fa6
                  mul          s0, a7, sp
                  lui          s0, 356817
                  slt          a6, t5, s7
                  slti         a3, a6, 320
                  fcvt.s.w     ft10, s7, rne
                  fle.s        t5, fs6, ft8
                  fsgnjn.s     fs6, fs9, ft6
                  addi         s2, s1, 1520
                  slli         tp, s1, 5
                  slt          a2, a4, s6
                  fcvt.w.s     t4, ft11
                  slti         t5, s5, -93
                  xori         s11, t1, -100
                  fle.s        a6, fs2, fs4
                  rem          a3, s9, zero
                  fmin.s       fa4, fs1, fs7
                  sll          s0, s3, s5
                  slli         t0, s5, 19
                  fcvt.s.w     ft5, gp
                  mul          ra, s10, t0
                  fsub.s       ft6, fa1, fs9, rmm
                  remu         a3, s3, s3
                  fle.s        s6, fs1, fs4
                  fdiv.s       ft11, fs0, fs1
                  fcvt.w.s     t6, ft11, rdn
                  and          t5, a2, t3
                  slt          tp, s1, s3
                  fadd.s       fa4, fa0, ft2
                  fmv.w.x      ft11, t4
                  fsgnj.s      fa5, ft1, fa3
                  fmax.s       fa4, fa5, fs0
                  sltu         a5, ra, s3
                  sra          t2, t1, s0
                  fmax.s       fs1, ft5, fs9
                  flt.s        s3, ft9, ft10
                  fsgnj.s      ft8, fa2, fs11
                  auipc        tp, 654953
                  fmv.x.w      a0, fa0
                  remu         s8, t3, s1
                  sub          t6, t4, a1
                  sra          s11, s11, a2
                  fsgnj.s      ft3, fa6, fs9
                  mul          s5, a2, a4
                  or           s10, a5, tp
                  div          a2, t5, s11
                  sra          a4, s9, s7
                  mulhu        gp, s1, s4
                  mulh         a5, a2, gp
                  srai         s8, a3, 14
                  fmin.s       ft8, ft8, ft11
                  flt.s        gp, fa1, ft11
                  fle.s        s7, fs1, fs10
                  auipc        s8, 266119
                  fdiv.s       fs10, ft10, fs3, rup
                  fmax.s       fa6, ft4, fa0
                  fmul.s       ft0, fa0, fs3
                  flt.s        a6, ft11, ft6
                  sra          s8, a2, t5
                  mulhu        a5, s4, s3
                  and          s4, a0, s10
                  fcvt.w.s     s2, ft8
                  add          s4, s10, tp
                  auipc        t4, 33618
                  fadd.s       fs3, fa5, fs3, rdn
                  feq.s        a3, fs9, fs5
                  srl          s8, t6, t0
                  sltiu        t6, a2, 956
                  slt          a4, a1, s6
                  ori          zero, s8, 28
                  auipc        s0, 538348
                  fcvt.s.wu    ft3, s0
                  fcvt.s.wu    fa1, a2
                  fmv.w.x      fa0, a4
                  rem          t5, a3, s0
                  or           a0, t6, t6
                  srli         s2, sp, 28
                  add          s1, s0, a3
                  mulhsu       s4, a6, s4
                  fsgnj.s      fs6, fa3, ft0
                  or           gp, a0, s5
                  addi         s0, a3, -235
                  mulhu        a6, zero, s6
                  fsgnjx.s     fs7, fs8, ft2
                  slt          gp, t3, ra
                  fmv.x.w      s0, ft7
                  fmv.w.x      fa6, s8
                  xor          t6, a2, s0
                  fsgnjn.s     fa0, ft1, fa4
                  fmul.s       ft11, fs8, fs9
                  sra          tp, sp, a4
                  lui          t6, 219434
                  fcvt.s.wu    fs10, s0
                  sll          a0, a6, sp
                  feq.s        s8, ft9, fs3
                  sltu         a5, t6, zero
                  fcvt.s.w     fa4, tp
                  xor          s2, a2, gp
                  fsqrt.s      fs4, fa2
                  flt.s        s8, fa0, ft4
                  xori         s7, t1, 673
                  xor          ra, s3, a6
                  fclass.s     a2, fa1
                  fmul.s       fs11, ft2, fa2
                  divu         ra, a5, a4
                  mul          s5, t0, s4
                  slt          ra, s7, s7
                  sltu         s7, s9, a5
                  slti         ra, t6, 135
                  flt.s        a7, fa5, ft9
                  or           a4, s9, s11
                  fdiv.s       fs1, fa1, fs4
                  fcvt.s.wu    fa2, a7
                  slt          zero, t0, ra
                  slti         gp, s2, 342
                  fmv.x.w      s5, fs1
                  sll          s11, ra, t4
                  div          s5, s11, a4
                  add          gp, s10, s2
                  fcvt.w.s     t2, fa7, rmm
                  xori         t5, t5, -1770
                  lui          s5, 811826
                  mulhsu       s4, t6, t4
                  slt          s10, a2, s1
                  flt.s        a0, fs5, ft8
                  ori          s9, s11, 1834
                  xor          s1, s1, a7
                  fmin.s       fs3, ft6, ft4
                  divu         s10, ra, t6
                  fdiv.s       fs9, fs5, ft8, rdn
                  ori          s1, zero, 501
                  auipc        t1, 578490
                  sll          tp, t5, s11
                  ori          gp, a6, 1034
                  fle.s        s8, fs9, ft2
                  fadd.s       ft2, fa1, ft7
                  sra          s6, s7, t3
                  nop
                  andi         s9, s10, -574
                  fadd.s       fs3, fs5, fa2, rup
                  fmul.s       fs0, fs1, fs1, rtz
                  sra          a6, a1, a4
                  fcvt.w.s     t2, ft5
                  sltu         s11, a1, s3
                  or           s6, a7, s1
                  slli         s3, t1, 8
                  mul          s2, s3, s6
                  nop
                  fsub.s       fs1, ft11, fa2
                  sub          tp, a4, zero
                  srl          s2, a6, t6
                  flt.s        t1, fs0, fs10
                  div          s11, s5, s8
                  fadd.s       fs6, fs8, fs5
                  xori         gp, s7, 425
                  add          a2, t1, s3
                  fle.s        s2, fa4, fs2
                  fadd.s       ft2, fs2, ft7, rdn
                  xori         a4, t3, -24
                  fsgnjx.s     fa7, fs4, ft7
                  fmin.s       fa7, ft6, fs5
                  srl          s7, a2, t2
                  mulhsu       a3, ra, a1
                  fadd.s       fa7, fs4, fs7, rup
                  sltu         t4, s10, s7
                  fmv.w.x      fa1, a7
                  mul          t2, a2, a7
                  srai         zero, s10, 11
                  sra          t5, a0, tp
                  feq.s        a7, fs2, fa7
                  fsgnjn.s     fa4, ft4, fa4
                  mulhu        s3, a7, gp
                  fsgnjx.s     fs10, fs7, ft2
                  sltiu        ra, a2, 1355
                  fcvt.wu.s    t0, fa4, rne
                  srai         s9, s7, 7
                  divu         s7, a2, a0
                  fdiv.s       fs6, ft10, fs3, rmm
                  fsgnjx.s     fs2, fs4, fs10
                  lui          a6, 868902
                  srl          gp, s8, t1
                  fsgnjn.s     ft9, ft9, fs11
                  sltiu        t4, s10, 6
                  fsgnj.s      fs11, ft8, ft6
                  auipc        s11, 431669
                  lui          s10, 160607
                  fsqrt.s      ft5, ft8, rdn
                  nop
                  mul          t4, t0, t4
                  fmv.x.w      a2, fa2
                  feq.s        s5, ft8, fa0
                  fle.s        s0, ft5, ft7
                  xori         t5, a5, 735
                  mulh         a3, a5, a0
                  fsub.s       ft4, fs6, fs2
                  ori          s2, t3, -1873
                  srli         t0, t2, 19
                  divu         s8, s7, tp
                  fadd.s       fa7, fa6, ft7
                  fadd.s       ft10, fs6, fa3, rne
                  ori          t5, a3, -552
                  xori         t0, t5, 314
                  fsgnjx.s     ft11, ft8, ft7
                  ori          s7, t4, -886
                  andi         s7, s3, -384
                  fmax.s       ft7, fa2, fs3
                  sll          a3, t3, gp
                  auipc        a2, 428771
                  sltiu        s8, s3, -261
                  nop
                  fmul.s       fs1, ft11, ft1
                  feq.s        a6, fs3, fa5
                  fsgnj.s      fs9, fs3, fs1
                  ori          s6, t5, -752
                  fle.s        s11, fs10, ft9
                  sll          s11, t6, s4
                  addi         a5, s5, 799
                  and          s4, s1, zero
                  div          s8, t4, s5
                  fmax.s       fs6, ft4, ft6
                  or           gp, s8, s9
                  slli         a0, t3, 16
                  fmv.w.x      fs6, s7
                  srl          zero, a7, s10
                  slt          t2, ra, s0
                  fmv.w.x      fs0, s7
                  srl          s9, s2, s2
                  fsqrt.s      fa1, ft10
                  add          s9, t4, t4
                  or           tp, tp, gp
                  srai         a3, a5, 12
                  sltiu        a0, s3, -508
                  fmv.x.w      zero, ft5
                  fsgnjx.s     fs2, fa5, ft5
                  fle.s        a5, ft6, ft7
                  fsgnjx.s     ft9, fa0, fs3
                  slli         s11, t3, 0
                  fle.s        s6, ft8, fa0
                  slt          s10, s6, s11
                  sltu         a0, t6, a0
                  fsgnjx.s     fs3, fs3, ft0
                  fcvt.s.w     fs11, a2, rtz
                  auipc        t2, 282187
                  xori         a4, t6, 518
                  and          s5, a3, sp
                  nop
                  mulhu        s7, a2, t4
                  fsgnj.s      ft6, ft7, ft4
                  fcvt.wu.s    s11, fs9
                  or           zero, s2, t2
                  rem          s2, s3, t3
                  and          t4, a4, s8
                  divu         t5, s8, s4
                  slli         a6, gp, 28
                  andi         a6, s5, -1849
                  or           t0, s1, a5
                  fsgnj.s      fs11, fs0, fs11
                  fsgnjx.s     fa1, ft5, fs4
                  sltu         s11, s5, zero
                  flt.s        t0, ft6, ft11
                  fmul.s       ft0, fs8, ft2
                  fadd.s       ft2, fa4, fa0
                  remu         s1, a6, s11
                  srli         a0, a3, 24
                  fmv.w.x      fs2, zero
                  sltu         s9, a6, gp
                  and          gp, gp, t5
                  fsqrt.s      fa7, fs3
                  div          a3, t3, a4
                  mulhsu       s8, s5, s7
                  div          t5, s2, s9
                  xori         a5, sp, -1775
                  or           s6, s1, a6
                  sltu         a7, s10, s2
                  fmin.s       ft1, fs11, ft10
                  fcvt.s.wu    ft3, s3, rne
                  fsgnj.s      fa4, fs9, fs0
                  fcvt.wu.s    gp, fa2
                  remu         zero, s7, s4
                  slti         s8, a7, -666
                  rem          t0, a6, gp
                  slti         t4, a1, 137
                  srli         a4, ra, 28
                  fcvt.w.s     s0, ft3, rdn
                  sll          s0, s0, ra
                  nop
                  sltu         s1, s5, a0
                  divu         s7, s9, s7
                  fmin.s       fs3, fs3, ft8
                  sub          s9, s9, a6
                  ori          a0, sp, 1949
                  fcvt.w.s     s1, fa6
                  fcvt.s.w     fs9, s1, rne
                  lui          t4, 714750
                  slt          zero, a0, s6
                  fmax.s       fa7, ft10, fs4
                  fmax.s       ft4, ft1, ft10
                  mulhu        tp, s7, t1
                  fmv.w.x      fa2, t3
                  sra          a4, s6, s5
                  fmv.x.w      s9, fs8
                  fsgnjx.s     fa6, fs4, ft6
                  rem          s0, s1, ra
                  xor          t1, a4, gp
                  and          s0, s2, ra
                  srl          t4, s8, a2
                  fmv.w.x      fs11, s2
                  sltiu        a5, a2, -1010
                  fsgnjx.s     fa3, ft5, ft8
                  lui          s7, 720888
                  add          a6, tp, s11
                  fmul.s       fs8, fs4, ft6, rne
                  fmv.x.w      s7, fa0
                  fle.s        a4, ft11, ft0
                  fsub.s       fa1, fa1, fs9
                  ori          s4, a2, -1999
                  remu         a5, t1, zero
                  slt          ra, a3, a3
                  fcvt.wu.s    s3, ft3, rmm
                  remu         a2, s9, s1
                  srl          a3, a5, s10
                  mulh         a7, s7, sp
                  srli         zero, ra, 3
                  slti         t0, t1, 341
                  srli         s11, a3, 7
                  feq.s        s2, fs5, fs0
                  rem          zero, t2, a1
                  fclass.s     s10, fs10
                  fmul.s       fa3, fs8, fa5, rdn
                  fmv.w.x      fs5, a0
                  fsgnjn.s     fa1, ft10, fa5
                  fle.s        a6, ft5, ft8
                  fmax.s       ft1, fa3, ft3
                  feq.s        a4, ft0, fs10
                  fclass.s     zero, fa4
                  fsub.s       ft5, fs1, ft2, rtz
                  sltiu        t4, a5, -1417
                  fcvt.w.s     a2, fa4, rtz
                  fle.s        t5, fs9, fs5
                  fcvt.w.s     a7, ft5, rne
                  xor          t0, s7, t3
                  remu         a3, sp, t5
                  feq.s        a5, fa4, fa1
                  sltu         zero, t1, s4
                  feq.s        a5, fs5, ft4
                  fsub.s       ft11, ft11, fs0, rmm
                  fcvt.w.s     t2, fs2
                  mulh         s11, s10, s5
                  fsub.s       fs1, ft11, ft7, rdn
                  srai         s5, s8, 23
                  fmv.w.x      ft2, s6
                  fsqrt.s      fs10, ft5
                  add          t4, s8, tp
                  fcvt.s.w     fa1, s9, rtz
                  feq.s        s3, fs9, ft5
                  mulhu        ra, t1, a6
                  sltu         s7, t1, t4
                  fmul.s       fs0, fs6, fs3, rdn
                  sub          s3, s1, s0
                  rem          t0, ra, s6
                  fcvt.w.s     ra, ft1
                  fsgnjx.s     fs1, fa5, ft2
                  fclass.s     t1, fs3
                  fadd.s       ft11, ft0, fa5
                  fcvt.s.wu    ft6, a6, rdn
                  flt.s        a6, ft11, fs8
                  srai         s3, s0, 12
                  add          s7, zero, s8
                  sra          a3, t0, s5
                  sltiu        t1, a5, 425
                  slt          t2, t6, sp
                  xori         t4, t6, 182
                  div          t6, t3, s6
                  nop
                  xori         ra, s1, 875
                  and          s10, t2, a6
                  fcvt.wu.s    a5, fs7, rdn
                  or           t2, a0, t6
                  slt          t4, s1, t2
                  slli         t1, a0, 2
                  rem          s11, a6, s5
                  fclass.s     s6, fs5
                  lui          tp, 456761
                  fsgnjx.s     fs2, fa6, fs1
                  xor          t6, a7, a4
                  fsgnjx.s     fs10, fs4, fs4
                  sltu         s6, s7, s11
                  fmv.w.x      fa4, a3
                  andi         s0, a4, 514
                  sra          zero, a5, s5
                  sub          tp, s6, t0
                  mulh         a0, a3, sp
                  fdiv.s       fs3, fs11, ft3, rup
                  fcvt.wu.s    s3, ft3, rtz
                  add          t4, t2, a3
                  sub          s2, gp, s7
                  remu         t0, t3, s10
                  ori          ra, s9, 1325
                  sub          s3, a1, t2
                  fdiv.s       fa5, fa5, fs2
                  and          t5, t5, a3
                  fmax.s       ft6, fs3, ft4
                  flt.s        s4, fa2, fa3
                  fdiv.s       ft1, fa3, ft7
                  fsgnj.s      ft3, ft10, fs8
                  fsqrt.s      fs5, ft0
                  and          s9, t3, sp
                  nop
                  fcvt.s.wu    fa3, tp
                  fmin.s       fs0, fa7, fs10
                  fmax.s       fa1, fs5, fa4
                  fclass.s     a5, ft1
                  or           gp, s6, a3
                  lui          a5, 28971
                  feq.s        s4, fa4, ft7
                  fsgnj.s      fa2, fs10, fa4
                  fdiv.s       fs2, ft4, fs2
                  ori          t4, tp, 1838
                  srl          s1, a4, a0
                  fcvt.s.wu    fs0, a7, rtz
                  xor          s8, t5, a5
                  and          a5, gp, t1
                  slt          s11, t2, zero
                  slt          t5, a6, t2
                  lui          t4, 822368
                  andi         s9, a5, 1459
                  fdiv.s       fs1, fa4, ft2, rmm
                  srl          s0, t4, s11
                  rem          zero, s10, a3
                  fadd.s       ft6, fa3, fa0, rup
                  lui          t2, 503546
                  slti         a4, a1, -9
                  nop
                  fmul.s       fs9, fa0, ft6
                  fcvt.w.s     a5, fa5
                  fcvt.s.wu    fa2, s6, rup
                  fcvt.wu.s    t4, ft9, rup
                  fle.s        t4, fa7, fa4
                  fcvt.wu.s    a4, fa3, rdn
                  mulh         t6, t5, a2
                  fmin.s       fs1, ft10, ft11
                  mul          t4, s4, s1
                  sltu         a7, s2, t4
                  fsgnj.s      fs9, ft0, fa6
                  fcvt.s.wu    ft1, s3
                  xori         a6, sp, -838
                  fmul.s       fs11, fs5, ft10
                  fdiv.s       ft11, fs3, fs3
                  and          t2, s9, gp
                  add          s9, zero, t3
                  fmv.w.x      fs6, s4
                  or           a6, gp, a4
                  remu         t1, a5, a1
                  fcvt.wu.s    t0, fs7
                  div          a0, t1, gp
                  add          a2, t0, s0
                  sltiu        s5, s3, 736
                  fmax.s       ft0, fs7, fs5
                  fle.s        a0, ft11, ft1
                  ori          t0, s9, -1601
                  fsgnjn.s     ft3, fs2, fa4
                  sltu         s11, a2, sp
                  fdiv.s       fa1, fs4, fa3, rne
                  fmul.s       ft4, ft4, fa7, rne
                  fdiv.s       ft5, fs2, ft8, rup
                  and          ra, s6, a1
                  sltiu        s11, t3, -1367
                  fsub.s       ft2, ft4, fs0, rmm
                  auipc        a5, 220096
                  xori         s11, a5, 150
                  mul          s5, s11, gp
                  or           s3, t6, a2
                  fle.s        tp, fa1, fa1
                  divu         t0, s7, a1
                  sra          s3, s5, a0
                  sll          t6, tp, gp
                  mulh         a3, a6, zero
                  fcvt.w.s     a6, fs7, rup
                  ori          s11, a2, 660
                  srai         s6, gp, 25
                  xori         a7, a6, 1388
                  add          gp, a5, s4
                  feq.s        s1, fa7, ft2
                  srli         s9, a6, 18
                  sra          a0, ra, t2
                  and          s5, a5, t3
                  slli         a3, zero, 4
                  fsub.s       ft4, fs2, fa1, rup
                  fcvt.w.s     t4, ft0, rup
                  sltiu        t2, s7, -58
                  mulhu        t5, t0, s10
                  fadd.s       fs2, fs2, fs11
                  srai         zero, t5, 6
                  remu         zero, s4, t3
                  mulhsu       a4, a1, t3
                  mul          s0, s3, a3
                  lui          t4, 997724
                  rem          s10, t6, a7
                  xor          tp, sp, t6
                  fsgnj.s      fa3, ft8, fs4
                  div          a3, t0, s8
                  fle.s        ra, ft3, fa7
                  fcvt.wu.s    s3, fs9, rne
                  sltiu        s11, a7, 1837
                  sltu         s4, a3, s8
                  fsgnj.s      ft5, fs7, fa3
                  fmv.x.w      s2, ft6
                  srai         a3, sp, 24
                  addi         s2, s0, 1138
                  fcvt.w.s     s9, ft11
                  slli         zero, a3, 1
                  fcvt.w.s     t4, ft11, rtz
                  fsub.s       fs4, fa4, ft0
                  fsqrt.s      fs9, ft11
                  rem          a6, s6, ra
                  fmax.s       fs5, ft1, ft3
                  sltiu        zero, a4, -454
                  lui          t0, 688386
                  srai         s2, t6, 2
                  addi         tp, t3, 425
                  rem          a3, a6, s8
                  xor          a4, s0, a7
                  fadd.s       fa7, fs2, ft7, rmm
                  fcvt.w.s     t5, fs4, rdn
                  divu         s8, s5, s1
                  lui          a7, 160680
                  slt          s7, s3, t3
                  sll          t6, t5, gp
                  and          s2, s11, t6
                  fmv.w.x      fa3, s3
                  ori          s9, a1, -1711
                  mulhsu       a2, a1, gp
                  flt.s        zero, fs8, fs4
                  fmv.x.w      a5, fa1
                  mulhu        zero, zero, s10
                  fcvt.w.s     s5, ft8
                  fclass.s     a4, ft6
                  xor          a4, s4, s10
                  srai         s10, a2, 21
                  fsgnjn.s     ft5, ft2, fs6
                  fsgnjx.s     fa5, ft6, fa5
                  lui          a4, 635750
                  flt.s        s7, fs1, fs6
                  sub          a2, s9, t0
                  fdiv.s       fa2, ft4, fs5
                  auipc        a4, 1047144
                  div          t1, s9, s6
                  srl          t0, a1, a7
                  fmv.w.x      ft10, a0
                  slti         t4, s5, -503
                  lui          a7, 72893
                  divu         gp, s9, a3
                  sltiu        zero, a6, -1144
                  divu         s7, s9, t6
                  mul          t1, s6, gp
                  fdiv.s       fa0, ft11, fs4, rup
                  remu         a7, t5, a2
                  ori          a4, t3, 1988
                  sub          s8, s4, s2
                  fsgnjx.s     ft3, fa3, fa3
                  slli         a0, gp, 10
                  fmul.s       fs0, fa6, fs10
                  mulh         s0, t4, t4
                  xor          s1, tp, t4
                  fmv.w.x      fs7, t4
                  fmin.s       fs8, fs9, ft11
                  add          s7, gp, s2
                  fmin.s       ft2, ft7, ft0
                  srai         a4, a0, 18
                  sub          ra, s3, s3
                  fsgnjn.s     fa6, fs8, ft2
                  rem          a6, tp, s8
                  fmin.s       ft8, fs11, fa5
                  fmv.w.x      ft5, t6
                  fcvt.wu.s    s11, ft4
                  fsqrt.s      fs11, fa6
                  sll          s0, t2, s5
                  fsub.s       ft7, ft1, fs4
                  srl          gp, a1, a0
                  fcvt.wu.s    s11, fa3
                  fmin.s       fs1, fs11, fs5
                  add          t2, s9, a0
                  fle.s        gp, fs2, ft4
                  slt          s5, s7, s10
                  andi         a6, s5, -527
                  srl          s2, t3, a6
                  flt.s        a6, fs9, ft3
                  fsqrt.s      fs5, fs9
                  fclass.s     t5, ft9
                  rem          s8, s7, ra
                  or           a7, s1, t3
                  fmul.s       ft9, fa6, fs7
                  or           a5, s7, t1
                  fsgnjn.s     ft0, fa0, ft10
                  fcvt.w.s     gp, ft10, rup
                  fle.s        t4, ft6, fs5
                  auipc        a0, 128875
                  fcvt.wu.s    t0, fa7, rmm
                  auipc        ra, 440975
                  fmin.s       ft10, ft9, fs1
                  slli         t1, a3, 14
                  mulh         s8, a0, a4
                  addi         s5, a1, 205
                  addi         s11, s9, -284
                  xori         zero, s9, -442
                  xor          a7, s0, t3
                  mulhu        ra, s6, a2
                  slti         t2, sp, -603
                  fcvt.wu.s    t2, fa7, rne
                  feq.s        s4, ft1, ft11
                  fcvt.w.s     ra, ft1, rtz
                  fsqrt.s      fs8, ft10
                  flt.s        a4, fs10, fs6
                  mul          t0, s2, a5
                  div          s8, ra, t4
                  fsub.s       fs8, fs7, fa6, rmm
                  fsgnjn.s     ft6, fs8, ft0
                  slt          zero, s0, s4
                  add          zero, s3, a3
                  auipc        t2, 533934
                  sltiu        zero, s7, 1557
                  fsub.s       ft0, fs7, fa7
                  rem          a5, a1, a2
                  fsgnj.s      fa2, ft0, fa6
                  andi         s2, a7, 1281
                  srl          s10, s10, t0
                  nop
                  fcvt.wu.s    s4, ft8, rtz
                  slt          t6, a1, a4
                  sltiu        a4, t4, -610
                  fsgnj.s      fa1, fa1, ft2
                  fmax.s       fs0, ft9, fa1
                  slti         s9, t4, -535
                  slti         s5, a6, 1343
                  lui          t2, 238262
                  fsub.s       fs4, ft11, ft6, rdn
                  and          tp, t5, s3
                  fcvt.w.s     a2, fs2
                  mulhu        tp, s6, s7
                  flt.s        s9, ft0, fa3
                  sra          gp, t5, t0
                  divu         tp, s11, t6
                  div          t1, zero, a4
                  fsgnjn.s     ft5, fa2, fa3
                  rem          s1, t3, s10
                  xor          a4, s0, s4
                  sltiu        tp, s2, 967
                  nop
                  fmin.s       fs6, fa1, fs7
                  fadd.s       ft4, fs0, fa2
                  fsgnj.s      fa3, fs11, ft7
                  slt          a3, a0, a4
                  xor          s8, ra, t5
                  fadd.s       ft5, ft2, fs9, rtz
                  fcvt.s.wu    ft11, a1, rup
                  sll          s8, s5, sp
                  fsgnjx.s     fa1, ft9, ft1
                  fsgnjx.s     fs9, ft5, fs11
                  add          t0, t3, s2
                  mulhu        t0, sp, zero
                  fcvt.s.w     ft4, t3, rne
                  fsqrt.s      fs0, ft8, rup
                  fsgnjx.s     fs10, ft6, fs0
                  sub          s2, s6, s8
                  slt          s4, t6, a3
                  flt.s        t0, fs3, fs5
                  mul          s7, ra, a5
                  addi         a0, ra, 876
                  srl          a5, s9, s4
                  fle.s        a4, fs9, ft3
                  fcvt.w.s     a5, fs0
                  lui          a4, 364755
                  fcvt.s.wu    ft4, s3, rdn
                  sltu         a5, t2, s11
                  fcvt.w.s     a4, fs10
                  add          gp, t4, s0
                  fdiv.s       ft0, ft11, ft2
                  remu         s10, t5, t5
                  srli         a6, s4, 9
                  slti         s8, s8, -647
                  fle.s        a2, ft1, fa4
                  mulhu        s5, s2, t4
                  fmv.w.x      ft2, s5
                  rem          ra, t3, s5
                  divu         a7, t4, gp
                  or           t2, a2, sp
                  ori          t1, tp, 224
                  xori         s7, s5, 924
                  mul          a5, a1, t2
                  slti         t0, a5, 544
                  srli         zero, a0, 11
                  div          tp, zero, a0
                  fsgnj.s      fa7, ft10, fa4
                  auipc        t1, 660265
                  sltu         a2, t1, s9
                  fcvt.w.s     zero, ft7
                  mulhu        a0, a4, a5
                  mulhsu       s3, t2, s0
                  xor          s3, a2, a6
                  fsub.s       fa6, ft5, fa2, rup
                  slti         zero, gp, 1470
                  and          s3, a2, sp
                  fsgnj.s      fa5, fa2, fs5
                  sltu         t5, t2, t3
                  fsub.s       fs7, ft7, fs0, rne
                  feq.s        s9, fs6, fa1
                  fsub.s       fs4, ft7, ft6, rdn
                  fcvt.s.wu    ft5, sp
                  fle.s        s4, ft4, fs2
                  fsub.s       fa5, fs6, fs2, rtz
                  mul          t1, s9, a1
                  div          t6, s8, s3
                  fmv.x.w      gp, ft11
                  sltu         s3, s0, tp
                  and          a0, s4, t3
                  auipc        a7, 648650
                  fcvt.wu.s    a5, ft10
                  fclass.s     a4, fs11
                  srai         t0, s11, 15
                  lui          s9, 982817
                  remu         t5, s9, a0
                  slt          a5, s6, gp
                  slt          a2, s6, ra
                  addi         s2, s6, 184
                  xori         a7, a3, -1402
                  mulh         s8, a5, s0
                  fclass.s     a4, fs10
                  fmul.s       ft4, ft4, fs11
                  fsgnj.s      ft0, fs7, fa4
                  fmv.x.w      t1, fs7
                  slt          s2, s2, s7
                  fmax.s       ft2, ft11, fa4
                  xori         s0, t4, -1668
                  fmul.s       fa0, fa7, fa4
                  sll          t6, s0, sp
                  auipc        t0, 585645
                  fle.s        s5, fa1, ft5
                  andi         ra, a2, -51
                  lui          s11, 873365
                  fdiv.s       fs7, ft2, ft4, rmm
                  fsgnjn.s     ft2, ft2, fs6
                  fcvt.wu.s    a5, fs5, rne
                  srl          s1, s7, sp
                  sltiu        t0, a3, 647
                  fsgnjx.s     fs7, fs9, ft6
                  fle.s        t1, fa0, ft0
                  slti         t1, tp, -1832
                  fsgnjn.s     fs9, ft9, ft2
                  lui          t0, 994803
                  divu         s1, t4, tp
                  remu         a3, a4, a4
                  div          s4, s4, a2
                  mulh         s2, gp, s3
                  sub          s1, s1, ra
                  or           a0, s2, a0
                  slt          s6, a3, t0
                  slti         tp, gp, 1339
                  fsub.s       fs6, fs2, fs3, rup
                  divu         s5, ra, s4
                  nop
                  fdiv.s       ft9, ft9, fs8
                  fadd.s       fs2, fa2, ft9
                  fsgnjx.s     fa5, fs3, fs8
                  sra          t5, zero, t1
                  fle.s        zero, fs4, fa5
                  fsqrt.s      fa5, fs4
                  fcvt.s.w     fs11, s9, rup
                  fsgnjn.s     fs5, fa7, fs3
                  andi         zero, a5, -1794
                  fsub.s       fs8, fs5, fa1, rmm
                  divu         t6, t6, tp
                  sltu         s3, a3, s8
                  slt          t2, a6, t0
                  fle.s        s5, fs10, fs9
                  feq.s        s7, fs9, fs10
                  fadd.s       fs3, fs6, fs2, rtz
                  flt.s        s6, fs11, fs7
                  feq.s        s8, ft10, fa7
                  fsub.s       ft7, fa2, ft9, rup
                  add          zero, a7, a4
                  feq.s        tp, ft5, fa6
                  fcvt.w.s     t5, fa3, rmm
                  sub          a2, s8, t4
                  fcvt.s.wu    fa4, s1
                  feq.s        a2, fa2, fa7
                  sub          s10, s4, a4
                  fmul.s       ft0, ft8, ft10
                  xor          s5, a1, a7
                  fcvt.s.w     ft11, sp
                  xori         ra, s8, -757
                  nop
                  or           s6, s6, a0
                  sltu         s3, t3, s7
                  slli         a4, s9, 4
                  fsgnjx.s     fa2, fa2, fa1
                  auipc        s10, 925452
                  fmv.x.w      s9, fs8
                  fsqrt.s      fs8, fs3
                  fmv.x.w      a5, ft3
                  mulh         s2, t1, a4
                  fcvt.wu.s    t5, fa1, rmm
                  fsqrt.s      fs3, ft0, rne
                  sub          s0, s9, s4
                  fmin.s       fs4, ft0, fs9
                  mulhu        s1, s0, t6
                  slli         s10, s0, 16
                  srai         a3, ra, 21
                  divu         s5, a1, s10
                  fdiv.s       fa0, fa3, fs0
                  fcvt.s.wu    ft8, a2, rtz
                  fmax.s       ft11, fs0, fs11
                  fcvt.s.wu    ft3, s10
                  addi         zero, t4, 418
                  slli         a4, s4, 20
                  fmax.s       fa4, fs8, fs5
                  sltiu        t5, a1, -1322
                  fclass.s     s1, fs6
                  divu         a2, t6, a1
                  fmv.x.w      t5, fa7
                  srai         a7, s10, 27
                  add          t4, t3, gp
                  and          s2, a7, t6
                  or           t0, a2, a1
                  feq.s        s7, fs11, ft10
                  fsub.s       ft2, ft5, fs7, rup
                  mulh         t0, t2, zero
                  fadd.s       ft9, ft4, fa5
                  fcvt.wu.s    s1, ft11, rup
                  fsub.s       ft6, fs5, ft9
                  fcvt.s.w     fs10, t0
                  div          ra, ra, t0
                  slt          t6, a6, a7
                  sltu         t4, ra, a1
                  rem          s0, t3, a1
                  slti         zero, t3, -1598
                  sra          a5, s10, t4
                  fadd.s       fa4, fs2, fa6, rtz
                  fdiv.s       ft2, ft11, fa7, rup
                  fmax.s       fa0, fa1, fa0
                  fsub.s       fa5, fs11, fa1
                  fsgnjx.s     fa6, ft8, fs3
                  fmv.w.x      fs9, a6
                  divu         t2, s11, t4
                  sra          a3, s0, s2
                  fsub.s       fa4, ft4, fa6, rne
                  srli         s11, t5, 27
                  feq.s        gp, fa4, fs7
                  fcvt.w.s     s10, fa3, rdn
                  mulh         a3, s4, a4
                  sra          a3, ra, t6
                  sll          s3, s6, t3
                  slli         s10, s6, 9
                  sltiu        t5, s6, -2008
                  remu         t0, s9, t0
                  and          s8, s0, a6
                  fmv.w.x      ft2, s8
                  or           a3, a0, s0
                  fmul.s       ft10, fa6, fs7, rmm
                  add          s3, t4, t1
                  fcvt.w.s     t2, fa4, rne
                  fcvt.w.s     s3, fs9
                  flt.s        s11, ft2, ft5
                  feq.s        a3, ft4, ft5
                  auipc        a7, 16369
                  slti         t1, a5, -1555
                  srl          t0, a3, a3
                  fsgnj.s      ft8, ft4, ft6
                  divu         tp, t4, s9
                  fmv.w.x      fs10, a6
                  srl          a4, t5, s3
                  mulhsu       a2, s5, s1
                  fsgnjx.s     fs7, fa3, ft7
                  fsgnjx.s     ft4, fs5, fs4
                  lui          a6, 540971
                  srli         s9, s6, 30
                  ori          tp, sp, 523
                  fclass.s     s10, fa0
                  fsgnjn.s     ft5, fa0, fa4
                  fcvt.s.w     fa2, a6, rup
                  add          t6, t4, s0
                  fle.s        s6, ft6, fs10
                  fmv.w.x      fs6, a7
                  or           a3, s10, s8
                  srli         a4, s10, 12
                  fmax.s       fs3, fs10, ft6
                  lui          t6, 432354
                  fcvt.s.wu    fa5, a7, rmm
                  rem          tp, t0, t6
                  sltiu        s9, gp, -1986
                  andi         s2, a6, -2036
                  fclass.s     t0, fs11
                  fcvt.s.wu    fs10, a6, rup
                  srli         ra, gp, 25
                  fsgnjn.s     ft4, ft6, ft6
                  fcvt.wu.s    s10, fs5
                  fmul.s       fa2, fs7, fs7, rdn
                  lui          s0, 86480
                  fmax.s       ft1, fs6, fa0
                  divu         t0, s3, s0
                  mulhu        s10, s10, t4
                  sra          s4, t0, t5
                  remu         ra, gp, s7
                  srli         t5, a4, 9
                  flt.s        s8, fs1, ft5
                  feq.s        a2, ft2, fa4
                  lui          a2, 4301
                  mulh         s6, a3, s2
                  fsgnjx.s     ft6, fa1, ft1
                  fcvt.s.w     fs4, s11
                  ori          a2, s8, -316
                  fadd.s       fa3, ft1, fa3
                  sltiu        t4, t1, -1722
                  xor          gp, a1, ra
                  feq.s        s6, fa6, ft7
                  divu         s5, a5, s1
                  fmv.w.x      fs9, s11
                  andi         t5, s4, 371
                  andi         a3, a5, 247
                  and          s11, s10, t4
                  auipc        a2, 1026378
                  fcvt.wu.s    s8, fs1, rmm
                  fsgnj.s      ft11, ft11, ft0
                  fclass.s     a3, ft6
                  flt.s        t1, fs2, fs6
                  slt          s5, t2, a5
                  fmul.s       fs8, fa2, ft0
                  nop
                  fle.s        zero, ft2, ft1
                  fmv.x.w      zero, fa3
                  srai         s3, a0, 22
                  fcvt.s.wu    ft2, s5, rdn
                  fcvt.s.w     fa5, s8
                  srai         a6, gp, 22
                  remu         t0, s5, s8
                  fsub.s       fs6, fs8, fa6
                  addi         s6, s8, 1051
                  or           zero, s3, a2
                  div          a2, t5, t4
                  xori         t1, t4, 678
                  slli         a0, t5, 10
                  fdiv.s       fs6, ft8, fa4, rdn
                  sra          t1, s6, a4
                  slli         s6, s7, 17
                  srl          a5, t5, a0
                  mul          ra, s10, s6
                  fmv.x.w      a7, fs11
                  fcvt.wu.s    s11, ft0, rdn
                  fmv.w.x      ft2, s10
                  nop
                  fsub.s       fa7, fa0, ft0, rmm
                  xori         s0, s9, 762
                  xor          s9, s1, t3
                  fmul.s       fs6, fs10, fs3, rdn
                  fcvt.w.s     a0, fs8, rtz
                  fmax.s       fa3, fs7, ft5
                  fmul.s       fa6, ft1, fs11
                  sltu         ra, gp, a4
                  slti         t1, sp, 1098
                  feq.s        t6, ft2, fs3
                  div          a3, s5, s2
                  feq.s        t6, fs8, fa5
                  fmul.s       fa5, fs5, fa5, rne
                  feq.s        s7, ft6, ft8
                  slti         a4, t3, -79
                  fsgnj.s      ft0, fa1, fs3
                  fmv.w.x      fs0, s1
                  slli         t6, s9, 24
                  addi         s0, t1, 1939
                  fsub.s       fs1, fa4, fs3, rdn
                  fcvt.wu.s    a0, fs9
                  feq.s        t6, fs1, ft9
                  fsgnjn.s     fs10, fs1, fs3
                  fcvt.s.wu    ft0, s2, rmm
                  sll          s8, s5, s2
                  fmul.s       ft9, fs11, fa0, rmm
                  mulhsu       t1, a5, t4
                  or           a2, s0, ra
                  xori         s5, s1, 1532
                  fmv.x.w      s8, fs6
                  fdiv.s       fs11, fa2, ft4, rtz
                  fle.s        t5, ft5, fa3
                  fsgnj.s      fa4, fa7, fs2
                  srli         a7, t2, 10
                  mul          a7, s11, s11
                  fsub.s       ft2, fs3, ft1
                  add          tp, s3, a5
                  rem          a5, s11, a2
                  andi         gp, t4, 478
                  sltu         t2, t6, a4
                  srl          t4, gp, s8
                  mul          t5, s6, s8
                  fcvt.s.w     ft3, s4
                  ori          s5, s3, -1100
                  slli         s6, t0, 1
                  fmul.s       fa0, fs10, fa2
                  add          s2, t5, t3
                  slli         ra, a7, 26
                  slli         s2, a4, 19
                  sltiu        a7, a0, 1057
                  fle.s        s2, ft2, fs6
                  mulhsu       s0, t1, a3
                  srai         a3, s1, 3
                  sub          t2, s10, a3
                  fmv.x.w      a6, ft4
                  sra          s7, s6, t1
                  fcvt.s.w     ft4, s11
                  rem          s7, ra, ra
                  fle.s        s1, fs6, ft4
                  fle.s        s10, ft0, ft8
                  andi         s6, t1, -1846
                  divu         s9, ra, s9
                  remu         t4, a5, tp
                  fclass.s     a2, fs9
                  fsgnjx.s     fa2, fs1, ft5
                  divu         t0, s9, s1
                  fcvt.wu.s    zero, ft2, rmm
                  feq.s        a7, fa7, ft2
                  addi         s6, a5, -1858
                  fsgnjx.s     ft2, ft0, fs11
                  div          a7, t1, a3
                  mulh         s1, s2, s5
                  fmul.s       fa0, fs11, fa5, rne
                  mulh         gp, a4, zero
                  add          s7, a1, tp
                  mul          s8, a7, a7
                  or           t1, a7, t4
                  slti         s2, a7, 1521
                  fmv.x.w      tp, fs6
                  fcvt.w.s     t0, fs10, rdn
                  sra          t0, s11, s7
                  or           a5, gp, s1
                  sub          s3, s9, a1
                  mul          gp, a3, a5
                  auipc        s8, 965900
                  ori          s7, a0, 547
                  flt.s        a3, fs3, fs3
                  sll          t4, t1, t1
                  slli         s6, s9, 16
                  sltu         s6, s4, a0
                  auipc        gp, 938582
                  and          s7, s3, t2
                  fsgnj.s      fa1, ft7, fs8
                  flt.s        a5, fs5, fs4
                  lui          s2, 503790
                  mul          s1, a3, zero
                  fcvt.wu.s    a0, fa7
                  srai         t0, a6, 29
                  add          t4, t0, s10
                  addi         s1, t0, 1051
                  slti         a7, sp, -148
                  srai         t1, t0, 8
                  slli         s10, t5, 29
                  and          s10, s1, s8
                  fsgnjn.s     fa4, fa2, fa7
                  ori          t6, a5, 653
                  srai         gp, s0, 18
                  fsqrt.s      ft5, fa7
                  srl          s7, a4, s9
                  sub          t1, s0, a0
                  mulhsu       s8, t4, tp
                  srl          t6, t5, tp
                  mulhu        a3, gp, t5
                  remu         s7, t2, t3
                  fsub.s       ft8, ft8, ft7
                  add          s8, t2, gp
                  addi         s6, t5, -2009
                  fcvt.s.wu    fs2, s6
                  fle.s        t1, fs0, fs3
                  fsgnjx.s     ft3, fa7, ft10
                  and          s11, sp, s1
                  fcvt.wu.s    s8, fa3
                  srl          a4, a0, gp
                  flt.s        s0, fa5, fs8
                  mul          a0, a4, t4
                  sltu         zero, t1, gp
                  srai         t2, s0, 1
                  mul          a7, t1, s9
                  flt.s        ra, ft10, fs3
                  sll          t2, gp, t2
                  fmul.s       fs11, fs9, fa6, rne
                  flt.s        a7, ft2, fa7
                  addi         t2, s6, 1132
                  add          s11, sp, t4
                  feq.s        t1, fs4, fs4
                  flt.s        t0, fa6, ft1
                  remu         t0, a6, t4
                  andi         a7, s9, 1593
                  feq.s        a7, fs1, ft8
                  add          t0, s4, sp
                  fmv.w.x      fa6, a5
                  div          s0, a0, s8
                  fmin.s       fa0, ft2, fs2
                  fmin.s       fa5, fa0, fs7
                  fcvt.w.s     a6, fa2
                  xori         zero, t6, -1872
                  fclass.s     a0, fs4
                  srli         ra, ra, 12
                  fdiv.s       fa3, ft5, ft8
                  feq.s        a2, fs9, ft7
                  auipc        s5, 751245
                  fmv.w.x      fa6, s9
                  slt          gp, t4, t5
                  fadd.s       ft2, fs4, fa0, rne
                  lui          s2, 812141
                  sltu         s9, t2, a0
                  slli         s11, s1, 11
                  sll          a0, a3, a0
                  fcvt.s.wu    ft1, ra, rtz
                  xori         s6, t5, 739
                  feq.s        a2, fa3, fs10
                  auipc        s8, 46083
                  mul          s3, a0, s2
                  fsqrt.s      ft0, fs4
                  fsgnjx.s     fs11, fa0, ft2
                  mulhu        a5, s9, sp
                  add          s11, t6, s2
                  srli         t4, s8, 12
                  sll          s2, s8, s5
                  mulhsu       gp, s4, t4
                  fsgnjn.s     fa4, ft7, fs0
                  fsub.s       ft7, ft7, fs7
                  fclass.s     tp, fa0
                  fmul.s       fa5, ft6, ft0, rtz
                  fmax.s       ft6, fs11, fs11
                  lui          t1, 478529
                  srl          a3, s9, s5
                  or           t6, s10, a7
                  divu         ra, ra, s4
                  fmv.x.w      s0, ft4
                  div          s2, t0, t1
                  remu         s11, s11, s8
                  divu         a7, a1, s1
                  mulhu        s11, zero, t2
                  andi         t2, s7, -2027
                  mul          a5, s6, a6
                  fcvt.s.w     fa1, tp
                  fsub.s       ft4, fa3, ft0, rup
                  srai         tp, s5, 3
                  srai         s4, s4, 1
                  mulhu        gp, t5, a5
                  feq.s        s3, ft6, fs5
                  sltu         a5, s9, sp
                  sltu         t6, s9, s4
                  sltiu        s3, s9, 670
                  fcvt.wu.s    t2, fs7
                  flt.s        s2, fs1, fa4
                  xor          s11, s11, a5
                  sra          s1, s6, s5
                  remu         s2, t4, t4
                  srai         s7, s7, 7
                  slt          s0, s6, t2
                  fclass.s     a5, fs10
                  lui          a6, 937620
                  fmv.w.x      ft0, s3
                  srl          s4, s2, tp
                  fdiv.s       ft5, fs3, fs10
                  slli         t1, gp, 13
                  fclass.s     s0, fs9
                  fsqrt.s      fs8, ft1, rdn
                  sltiu        s9, t4, 2044
                  fadd.s       ft4, fa7, fs9
                  fmul.s       ft1, ft5, fs1
                  fsgnj.s      fa0, ft6, fa5
                  sll          t4, a5, s4
                  slli         s2, a3, 9
                  fle.s        a0, fs3, fs7
                  fmv.x.w      a6, ft11
                  remu         a6, s4, t1
                  div          s2, gp, zero
                  srli         s9, sp, 0
                  auipc        gp, 883595
                  sll          s7, t4, tp
                  fdiv.s       fs11, fs9, fs2
                  mulh         s7, s0, t5
                  srli         zero, sp, 20
                  fmv.w.x      fs7, t0
                  nop
                  fcvt.s.w     fs5, ra, rtz
                  divu         s4, s9, tp
                  slli         s4, a4, 2
                  fsgnj.s      fs2, fa2, ft9
                  sltiu        t0, t0, 684
                  fsub.s       fa2, fs10, fs2
                  auipc        s11, 178841
                  mulhu        s9, a4, t3
                  fmv.x.w      ra, fs4
                  andi         s1, sp, 1258
                  slt          s11, t3, s4
                  flt.s        a3, ft8, fs6
                  fdiv.s       fs8, fa1, ft2, rne
                  nop
                  remu         t0, s0, t3
                  fadd.s       ft8, fa6, fs1
                  fcvt.s.w     fs4, s4
                  slt          a2, s6, a3
                  fdiv.s       ft11, ft7, ft9, rtz
                  lui          ra, 871132
                  or           a2, s10, s4
                  slt          t4, a4, a4
                  fcvt.wu.s    ra, fs3, rne
                  mulhsu       t5, s1, a5
                  sra          s6, s7, s6
                  or           s2, s0, t1
                  sub          s3, a2, s1
                  fsgnjx.s     fa6, ft7, ft7
                  auipc        s11, 39347
                  fcvt.w.s     t4, fs8
                  slti         ra, a0, -489
                  and          s1, t2, s10
                  sll          gp, t1, a2
                  fdiv.s       fa0, fs7, fs3, rup
                  slti         ra, s6, 566
                  sra          a7, a7, s3
                  fmin.s       ft2, fs9, fa7
                  sub          a4, s5, t5
                  feq.s        a5, ft4, ft5
                  slti         a0, gp, 524
                  fle.s        s6, ft5, fs2
                  fclass.s     s0, fa4
                  nop
                  fcvt.wu.s    s9, ft9, rup
                  mulhsu       ra, a5, t0
                  andi         s8, t0, -339
                  fadd.s       ft11, fs2, ft4, rne
                  or           tp, t5, a3
                  slt          a6, ra, gp
                  fcvt.s.w     fs3, gp
                  sltiu        a2, s11, -1326
                  mulhsu       a3, s7, t4
                  or           t0, t6, a4
                  fcvt.s.wu    fa1, s5, rdn
                  xori         t2, t2, 832
                  fcvt.s.w     fs10, s11
                  xor          s2, s2, s11
                  srai         t1, t3, 22
                  ori          a2, t1, -1217
                  fsgnjx.s     ft10, ft10, fa4
                  nop
                  fsgnjx.s     fa2, fa1, fa3
                  srli         a2, a6, 14
                  feq.s        t6, fa5, ft6
                  mul          s3, s11, s7
                  mulhu        s10, s5, a6
                  xor          a7, t2, s1
                  mulh         t2, s11, a7
                  fmv.w.x      ft0, a3
                  ori          s0, a5, -1944
                  divu         t4, t0, t2
                  xor          s3, t0, s11
                  div          a4, ra, t6
                  fmv.w.x      fa6, s10
                  fmv.w.x      fs11, t3
                  fmv.w.x      fs4, s9
                  rem          s7, s3, a4
                  mulhsu       s2, a4, tp
                  mulhu        s4, s10, a3
                  fsgnjx.s     fa4, fa7, fs6
                  mulhsu       gp, a5, a6
                  and          gp, a1, s1
                  sltiu        a5, a2, -292
                  fsgnjn.s     ft0, fs9, fs11
                  fmv.x.w      t6, fa7
                  add          t5, t4, s3
                  fsgnjx.s     ft1, ft6, fs5
                  rem          a2, s4, gp
                  sltu         s8, a3, a3
                  fclass.s     s8, fa6
                  srai         a4, t4, 4
                  fcvt.s.w     fa5, a4, rmm
                  fcvt.s.wu    ft9, a1
                  lui          a3, 191878
                  fcvt.s.wu    fs8, t0
                  srl          a6, sp, a1
                  fcvt.s.wu    fa5, s8, rup
                  slli         a6, a4, 3
                  fsub.s       fs10, ft4, fs7, rdn
                  fadd.s       ft9, fa2, fa5, rup
                  and          t6, s2, t2
                  auipc        a0, 740221
                  fcvt.s.w     fa3, s3, rmm
                  slti         a7, s2, 256
                  add          s5, sp, s2
                  sltiu        t2, s3, 499
                  fle.s        s10, fa1, ft3
                  fmul.s       fa7, fs2, ft1, rdn
                  add          s11, s9, a3
                  rem          t0, s9, t4
                  sra          s0, t4, a0
                  mul          t5, s8, t4
                  fsgnj.s      ft6, ft3, fa6
                  xor          a3, a3, t3
                  slli         s5, a6, 29
                  remu         a6, zero, s3
                  fle.s        a0, ft9, ft5
                  andi         a5, a7, 201
                  slli         tp, a3, 14
                  srai         s0, s4, 24
                  lui          s10, 468444
                  nop
                  fsgnjn.s     ft8, fs5, fs8
                  nop
                  fmax.s       fs7, fa0, fa3
                  fsub.s       fa0, fa4, ft11
                  xori         s10, a1, 1454
                  add          t6, s11, s5
                  srai         t4, s2, 24
                  auipc        t0, 325358
                  mulhu        t6, s10, s2
                  lui          ra, 806009
                  rem          s5, s4, a0
                  fmv.w.x      fs1, t3
                  fsub.s       ft5, ft6, ft10, rne
                  and          a4, tp, s6
                  slt          a2, a6, a6
                  add          t2, tp, s6
                  fdiv.s       ft4, fs6, ft4
                  mulhsu       gp, zero, s6
                  mul          s6, a1, s11
                  fsgnj.s      ft7, ft5, ft11
                  fmv.w.x      fs3, s8
                  xor          s10, s5, s9
                  fsgnj.s      ft6, ft3, ft11
                  flt.s        s10, fs0, fs8
                  divu         t6, s7, a7
                  rem          s1, t5, s7
                  slt          tp, s7, t3
                  lui          s6, 255280
                  fsgnjx.s     ft6, fs10, ft8
                  or           ra, t6, t3
                  fsgnj.s      fs8, fa7, fs5
                  fmv.x.w      s4, fa0
                  fsub.s       ft11, fs0, fs3
                  slt          a4, t6, t4
                  xor          s3, a0, s1
                  fclass.s     t1, ft10
                  sra          a2, s11, t6
                  fle.s        s1, fs4, fs2
                  fmin.s       fa7, fs0, ft8
                  fcvt.w.s     a5, fs10
                  or           s8, gp, s5
                  div          t0, tp, s3
                  fmv.x.w      t6, ft0
                  addi         s4, t6, 2026
                  and          t6, a4, s1
                  fdiv.s       fs2, fa2, ft3, rtz
                  fsub.s       fa5, fa7, fs10, rmm
                  auipc        s5, 59890
                  ori          zero, s2, 1337
                  fle.s        a6, fs8, ft2
                  fmin.s       ft8, ft3, ft8
                  divu         a2, s5, s11
                  srai         a0, s1, 30
                  sra          s9, t6, s1
                  fmv.x.w      t0, ft2
                  sub          t1, s6, a3
                  slt          s1, a6, s1
                  srl          s6, s8, a3
                  fmv.x.w      s8, fa6
                  mul          t5, s4, s4
                  fmax.s       ft11, fa3, ft1
                  rem          a6, a6, s8
                  fcvt.wu.s    s4, ft7
                  fmin.s       fs5, ft0, ft1
                  sll          s1, a0, ra
                  mul          gp, t4, a2
                  fclass.s     zero, fa3
                  remu         a6, s2, s6
                  fcvt.wu.s    a3, ft0
                  sltu         a5, a6, s6
                  rem          s11, t4, s6
                  fmin.s       ft1, ft0, fs8
                  slli         s8, a4, 29
                  slt          t2, s11, t3
                  rem          a6, a1, s11
                  mulh         s2, t5, s0
                  mulhu        s9, s3, t3
                  srl          s5, s4, s1
                  srl          zero, t2, t0
                  fadd.s       fa4, fs0, fs3
                  fcvt.w.s     s2, fs1
                  fcvt.s.w     ft2, s1, rtz
                  and          a2, s5, s8
                  slt          a3, t3, s10
                  fdiv.s       ft9, fs11, ft3
                  fcvt.w.s     a6, fs5, rtz
                  srai         t6, s6, 1
                  fcvt.s.wu    fs8, t6, rtz
                  slti         zero, s11, -1756
                  fle.s        t1, fs10, ft5
                  fclass.s     gp, fa7
                  fsgnjx.s     fs4, fs8, fs4
                  feq.s        a5, fs11, fa2
                  fcvt.s.w     fs10, a5, rdn
                  mul          ra, a0, t5
                  fmv.w.x      ft9, s6
                  sra          s6, a0, a7
                  fle.s        a4, fs1, ft10
                  xori         a3, s1, -1900
                  div          s2, s8, tp
                  fsub.s       fa0, ft9, ft8, rmm
                  rem          s11, t5, t2
                  or           s7, t0, a0
                  mulhsu       t6, a3, a3
                  srl          s1, zero, t1
                  fmul.s       fa3, fs10, ft3, rup
                  lui          s2, 867937
                  and          s3, a2, a2
                  div          t4, a0, a0
                  sltu         a4, s9, t1
                  mulh         t2, a3, a0
                  add          s7, s6, tp
                  lui          a0, 273301
                  sll          t6, zero, t3
                  remu         s11, a6, s1
                  flt.s        a0, ft8, fs5
                  add          a7, s8, s5
                  fmin.s       ft9, fa5, ft11
                  fdiv.s       ft2, ft2, ft0, rne
                  xor          s8, s9, s9
                  srai         t1, t1, 30
                  sra          a6, a5, zero
                  sra          s8, s10, s3
                  srl          t6, a4, t4
                  srl          t0, s7, a4
                  fcvt.s.w     fs3, s7
                  fle.s        s1, fa4, fa5
                  srl          a3, s5, t3
                  srl          ra, s10, s0
                  fmv.w.x      fa6, t4
                  mulh         s0, gp, a4
                  lui          ra, 351725
                  srli         s10, a1, 17
                  andi         t5, a5, -671
                  slt          s9, s9, s3
                  fmin.s       fs4, fs1, fa7
                  fsgnjn.s     ft11, ft9, fs11
                  srli         s7, a5, 9
                  sll          s1, s3, t2
                  fsgnjx.s     ft5, fs7, fs3
                  mulhsu       a7, s5, ra
                  srl          s7, s8, a0
                  srai         ra, s4, 9
                  andi         s3, s3, 1797
                  feq.s        ra, fa7, ft0
                  fsgnj.s      fa7, fa0, fa2
                  sra          s11, a0, s8
                  fadd.s       ft1, fa5, ft6, rmm
                  mul          s11, s0, t6
                  slli         a6, a6, 29
                  srl          a0, a6, s11
                  fmv.x.w      a2, ft11
                  xor          s6, a0, a1
                  mulh         s0, t4, s6
                  fmin.s       fa7, ft11, ft1
                  fmv.w.x      fs11, sp
                  slti         t4, a5, -195
                  fcvt.w.s     s7, fs7
                  srl          s9, s9, a1
                  fcvt.s.w     fa3, s3
                  sltu         ra, sp, a1
                  lui          t6, 399802
                  fsgnjn.s     ft0, fs8, fs9
                  fcvt.wu.s    a7, fs7
                  and          a7, s7, t0
                  sub          s11, a0, a2
                  slti         t5, t3, 1945
                  fcvt.s.wu    fa6, s10, rdn
                  fsgnjx.s     fa7, fa0, fa0
                  slti         t6, t4, -1418
                  fcvt.s.wu    ft11, a6, rne
                  slti         tp, s8, -1082
                  fdiv.s       fs11, ft5, fs2, rne
                  fcvt.s.wu    fa6, t5
                  mulhu        a5, t5, s3
                  slti         t1, a0, -218
                  and          gp, s7, s9
                  fcvt.w.s     s4, ft9, rtz
                  mulhu        s11, s4, s1
                  fclass.s     s10, fs0
                  fle.s        s4, fa1, ft7
                  fclass.s     s0, fa7
                  sltiu        s2, a3, 854
                  fmv.x.w      gp, fs8
                  sltu         s6, sp, s0
                  or           s2, a3, s1
                  div          s4, s1, gp
                  slt          s4, s10, t2
                  mulhsu       gp, t6, tp
                  fclass.s     a3, ft10
                  nop
                  fsub.s       fs5, ft5, ft7, rtz
                  fle.s        tp, fs8, fs9
                  slli         s4, s11, 13
                  divu         s8, zero, t5
                  fsqrt.s      fa2, fa4, rne
                  slti         gp, zero, -1719
                  srai         t2, t4, 26
                  andi         s9, s6, -1550
                  add          ra, s8, t5
                  fcvt.wu.s    t6, fa1
                  sra          t1, a1, s7
                  fle.s        a4, fs11, ft1
                  fcvt.w.s     a5, fa6, rne
                  srli         s6, t4, 22
                  ori          a3, t5, 115
                  auipc        s1, 832511
                  mulh         s10, s0, s0
                  fadd.s       ft0, fs8, ft11
                  sltiu        t2, t4, -1839
                  andi         a6, s11, 1115
                  flt.s        s5, ft7, fs5
                  sll          s5, t5, a4
                  srai         a7, s11, 17
                  xori         t4, a4, -1286
                  and          t2, tp, a1
                  fle.s        s1, fs11, fa4
                  and          t4, t3, s5
                  addi         s9, t2, -1198
                  feq.s        a6, ft3, fs11
                  sra          a7, s5, t1
                  andi         s11, s9, -89
                  add          a7, s8, s7
                  fcvt.w.s     s5, ft3
                  fcvt.w.s     t2, fs0, rtz
                  sub          a6, s5, a3
                  mulhsu       a5, a7, tp
                  slli         s5, s4, 12
                  sub          gp, a7, s6
                  mul          s10, s11, s1
                  srl          s2, a7, t0
                  sra          a6, t2, s6
                  fdiv.s       fs1, fs6, fs10
                  sub          ra, a3, a1
                  mulhu        t4, s1, s11
                  sra          a0, s6, s0
                  mulh         a6, s9, a3
                  mulh         t5, t1, s3
                  add          a2, s11, a7
                  fsgnjx.s     fa2, fa6, fs7
                  fclass.s     t1, ft10
                  auipc        a2, 362323
                  ori          s7, s7, -1126
                  srl          t0, tp, t2
                  fsub.s       fa5, ft1, ft11, rup
                  fmv.x.w      t1, ft9
                  feq.s        s5, fa6, ft3
                  fcvt.w.s     s5, ft10
                  fmv.x.w      s8, fa1
                  addi         t5, zero, 1253
                  fmin.s       fs1, ft10, fa6
                  sltiu        t4, sp, 1515
                  auipc        t2, 737653
                  lui          s10, 954941
                  fle.s        t4, ft9, fa4
                  sltu         s2, sp, t1
                  sltiu        zero, s6, -2011
                  sltiu        s5, s1, -1852
                  fcvt.s.wu    fa6, s1
                  fmv.x.w      s5, fs3
                  fsgnjx.s     fs6, fs5, ft11
                  auipc        s0, 812973
                  slt          s7, a0, s6
                  rem          t5, a5, t5
                  fmv.w.x      fs7, t1
                  slt          s6, s1, a0
                  mul          s4, a3, s5
                  sltu         s7, s10, zero
                  srai         s8, s11, 19
                  and          ra, sp, s3
                  fmv.w.x      fs2, s4
                  rem          a7, gp, t3
                  fcvt.s.wu    fs6, s11
                  mulhsu       s7, s8, zero
                  div          s0, s6, a2
                  andi         a5, gp, 916
                  fmv.w.x      fa5, s10
                  fcvt.s.w     ft1, t1, rne
                  sltiu        ra, s8, -1914
                  fsqrt.s      ft11, ft6, rtz
                  fle.s        a2, fs7, ft7
                  mulhsu       zero, gp, a0
                  fmax.s       fs5, fs6, fs9
                  andi         a6, s4, -894
                  srl          t6, a5, s2
                  fle.s        tp, ft2, fs10
                  feq.s        t6, fs9, fs7
                  fcvt.s.w     ft10, a3
                  fsgnjn.s     ft4, ft5, fs5
                  xori         s8, a4, -746
                  sub          s5, s4, gp
                  srl          a0, a7, s2
                  fadd.s       ft3, ft11, ft4
                  lui          t4, 300093
                  slti         a7, s4, -1228
                  sltu         a0, t1, s10
                  mulhu        tp, tp, s7
                  srli         s10, a7, 12
                  fdiv.s       fs9, fs2, fs3
                  divu         a2, t5, a5
                  and          t6, a1, s10
                  mulh         s6, t5, s5
                  rem          ra, s7, s6
                  divu         s11, s3, t1
                  srl          s10, s11, a5
                  fsgnj.s      ft8, fs10, fs2
                  xori         t4, t1, 1098
                  sub          s9, tp, a4
                  flt.s        a5, ft10, fa2
                  sltiu        s5, a0, -1183
                  mulhsu       a6, sp, s8
                  mulhu        a6, t1, s9
                  fsub.s       fs8, fs9, fs2, rne
                  add          s5, t4, tp
                  srli         s8, a7, 30
                  srai         a3, s6, 5
                  addi         t6, t0, 1030
                  ori          s11, a1, -1866
                  fcvt.s.w     ft10, s7, rmm
                  nop
                  sub          ra, sp, t3
                  slt          s6, a2, s4
                  fle.s        t4, fs6, fa3
                  fsgnj.s      fa3, ft0, fa3
                  ori          s6, s8, 195
                  fsgnjx.s     fs5, ft3, ft1
                  mulhu        a0, s3, s4
                  flt.s        a7, fa1, fa3
                  auipc        s8, 871057
                  fmax.s       ft5, ft7, fa1
                  fmv.x.w      s6, fa6
                  mul          a3, a7, a4
                  srai         s11, t5, 5
                  fmin.s       fa0, ft10, ft10
                  add          s1, ra, s3
                  fmv.x.w      t1, fs1
                  feq.s        s2, fs7, fa2
                  mulhu        ra, t4, t3
                  fmax.s       fa7, ft3, fa5
                  fcvt.w.s     s11, fs1, rtz
                  fsgnjx.s     ft9, fs4, fa5
                  fsub.s       fa7, fa7, fs3, rmm
                  sll          t0, a6, a3
                  sltu         t2, ra, s4
                  fdiv.s       ft1, fs6, fa3, rne
                  sub          t5, a6, sp
                  sll          gp, t0, a6
                  sra          s7, t5, tp
                  fcvt.wu.s    a7, ft10, rne
                  fcvt.s.wu    fs3, t1
                  fadd.s       fa0, fs11, ft4, rne
                  rem          a4, t0, a6
                  sra          s4, t0, s9
                  addi         s1, t4, -1879
                  nop
                  fsgnjn.s     ft1, ft4, ft2
                  rem          s6, s9, s6
                  and          s9, a0, a3
                  xor          gp, ra, t4
                  fcvt.w.s     s10, fs10, rtz
                  xor          s10, s3, sp
                  sra          gp, t6, zero
                  flt.s        t5, ft2, ft4
                  lui          s11, 471215
                  srai         a6, a2, 9
                  ori          t5, s3, 1957
                  nop
                  auipc        s0, 1018723
                  sltiu        a4, a4, -1587
                  fmv.w.x      fs4, t6
                  mulh         s7, s2, a6
                  fcvt.s.wu    ft4, s10, rmm
                  lui          s4, 428604
                  flt.s        t1, fs3, fs1
                  addi         s4, tp, 1801
                  fclass.s     s1, ft4
                  divu         gp, s4, s8
                  rem          t2, s5, sp
                  add          t2, s3, s8
                  fcvt.s.w     fa5, t0, rmm
                  fsgnjn.s     fa4, fa2, fs6
                  fsgnjx.s     ft4, fs1, fa1
                  mulh         s3, s7, a7
                  feq.s        s3, ft8, fs0
                  nop
                  rem          s9, a0, a7
                  fsub.s       ft0, fa1, fs0
                  slt          s4, a7, s9
                  fsgnj.s      ft3, fa4, fa0
                  mulhu        t0, t5, ra
                  fsgnjn.s     fa0, fa2, fs8
                  ori          zero, s4, -1134
                  fcvt.s.w     fs10, s4, rup
                  lui          a3, 784168
                  mulhu        t0, a3, s6
                  auipc        t6, 40005
                  fclass.s     s8, fs9
                  slli         s5, t3, 31
                  sub          t0, gp, s10
                  mulhu        a6, a7, tp
                  slli         s8, s10, 3
                  srai         tp, a4, 13
                  mulh         s0, s5, t2
                  srli         s10, t0, 19
                  fdiv.s       fs1, ft4, ft7
                  nop
                  sltu         a2, a3, a1
                  fcvt.wu.s    s1, ft7
                  sll          s10, s4, s0
                  sltu         s5, a3, t3
                  fmin.s       ft2, fs10, ft11
                  mul          s3, t2, s9
                  fmin.s       fa5, fa4, fs0
                  fcvt.s.w     ft8, t3, rmm
                  lui          s3, 698501
                  xori         gp, a5, -1490
                  remu         t0, sp, a2
                  fcvt.s.w     ft1, s4, rup
                  fsqrt.s      fa0, fs5, rmm
                  ori          s4, s4, 1641
                  fsgnjx.s     fs7, fa7, fs2
                  fsgnjn.s     fs6, fs9, fs5
                  srai         a4, t3, 12
                  sra          t2, a0, a4
                  slli         a3, tp, 16
                  and          s9, s5, a3
                  slli         t4, s9, 30
                  fcvt.s.wu    fa4, t0
                  rem          zero, t6, t2
                  flt.s        s7, fa6, fa4
                  fsgnjn.s     ft1, ft0, ft8
                  rem          t4, s5, s10
                  slli         gp, s0, 18
                  and          s11, s3, s8
                  add          s6, t0, t6
                  ori          a5, a3, -476
                  sltu         t1, gp, s0
                  sll          s5, s2, a1
                  slt          s3, s11, t5
                  mulh         a7, t4, ra
                  fsqrt.s      fa5, fs4
                  nop
                  srli         zero, a6, 0
                  srai         s11, tp, 3
                  remu         s2, t2, s11
                  fsgnjn.s     fs8, ft4, fa3
                  mulh         a2, gp, t6
                  fmv.x.w      t0, fa6
                  slt          s9, t1, sp
                  addi         a6, t6, 2010
                  fcvt.wu.s    s1, fs6
                  slti         tp, a0, 1752
                  slli         s1, a4, 27
                  fmax.s       ft2, ft10, ft10
                  fmv.x.w      ra, fs7
                  div          t5, sp, t5
                  fdiv.s       fa4, ft6, fa4, rup
                  or           s0, a6, t6
                  ori          a7, s2, 168
                  fcvt.s.wu    ft5, s10
                  slt          t0, gp, s9
                  fsqrt.s      fs9, ft8, rne
                  fclass.s     s7, ft1
                  fclass.s     tp, fs3
                  xor          gp, s6, t2
                  fadd.s       fs7, fa1, ft9
                  srli         a6, s1, 29
                  xor          s10, a2, s6
                  div          a3, a1, s3
                  andi         a3, s0, -367
                  srai         t6, s5, 3
                  fmax.s       fs10, fs7, fs11
                  xori         a0, s7, 1196
                  addi         tp, a5, 1008
                  fsqrt.s      fs9, ft7
                  fmax.s       fs7, fa4, fa3
                  auipc        s1, 502062
                  fadd.s       ft10, ft5, fs0
                  sltu         a6, sp, a1
                  fmv.x.w      s3, fa1
                  add          s4, a7, t6
                  xor          s9, a2, a6
                  fmin.s       fs11, fa4, fa4
                  fcvt.s.w     fs9, s1
                  feq.s        s8, ft8, ft11
                  xor          a0, gp, a2
                  fdiv.s       fa1, fa2, ft3, rmm
                  sra          s4, a0, a5
                  feq.s        t2, fs0, ft4
                  fsgnjn.s     ft6, ft3, fa7
                  fsgnjn.s     fs9, ft8, ft1
                  slti         a0, t2, -1839
                  fsqrt.s      fs9, ft0
                  mulhsu       s9, s2, t5
                  remu         t6, t1, a1
                  add          t5, a0, s7
                  fmin.s       ft2, fs1, ft4
                  fdiv.s       fa4, ft5, fs8, rne
                  fle.s        s0, fa5, fs8
                  xor          s3, a7, s7
                  sltu         ra, a5, a1
                  div          s6, s11, t4
                  or           s7, ra, tp
                  div          a3, s6, s4
                  slli         s9, sp, 30
                  fcvt.wu.s    a3, ft4
                  sra          s11, gp, ra
                  fsgnj.s      ft5, fs6, fa4
                  fsgnj.s      ft4, ft11, fa6
                  sll          ra, t1, s9
                  xori         a2, a6, 1295
                  or           tp, s3, s6
                  or           a5, a6, s4
                  fsqrt.s      fa5, fa2, rup
                  fsqrt.s      fa1, fs9
                  nop
                  andi         s9, s10, 1211
                  fmv.x.w      a7, ft10
                  fmv.x.w      a3, ft9
                  fmul.s       ft9, fs2, ft4
                  mulhu        s10, t4, ra
                  fmul.s       fs5, fs10, fs2
                  fmv.w.x      fs7, t0
                  fdiv.s       ft2, fs4, fs1, rmm
                  nop
                  fmv.x.w      s9, fa0
                  rem          ra, s3, t0
                  fmin.s       fs5, fs2, ft5
                  fcvt.wu.s    tp, fs6
                  slt          a4, a1, ra
                  addi         s10, s9, -1519
                  srl          a3, s6, zero
                  fmul.s       ft5, ft11, ft4, rmm
                  andi         a6, s3, -694
                  andi         a4, t2, -1759
                  andi         s5, a4, -891
                  srli         s11, s9, 17
                  fcvt.w.s     s3, fs8
                  fmv.w.x      fs3, s0
                  fcvt.s.wu    fs1, a7
                  fsgnjn.s     fs0, fs5, fa0
                  add          s11, a7, s4
                  xori         s1, t3, 1154
                  slt          t0, ra, t4
                  sltu         a6, a2, t4
                  srli         s5, ra, 27
                  srli         s10, s6, 11
                  remu         s3, s4, a4
                  remu         t2, s5, zero
                  srl          t4, t3, tp
                  add          s5, a7, t0
                  fmul.s       fs4, fa4, ft10
                  nop
                  fsgnj.s      fs3, fs10, fs2
                  xor          s3, a7, t1
                  andi         zero, s11, 583
                  fdiv.s       fa5, fs3, fs2, rup
                  divu         t4, s2, sp
                  sltu         a2, t4, gp
                  flt.s        s4, ft11, fs1
                  fsqrt.s      fa6, ft0
                  fsgnjx.s     ft0, fa2, ft0
                  ori          s2, a5, -1603
                  srai         s1, s0, 9
                  fcvt.s.wu    fs10, a2
                  sra          zero, a2, a1
                  lui          s4, 186278
                  srl          s3, a3, tp
                  mulh         t0, t3, zero
                  slt          s10, a3, t5
                  fmv.x.w      s1, ft10
                  nop
                  fcvt.s.w     fs9, t5, rup
                  fsub.s       fs10, ft5, fs4, rup
                  fmv.w.x      ft6, t3
                  div          t6, s3, zero
                  xor          t6, s10, a2
                  fsqrt.s      ft8, fs9, rne
                  fdiv.s       fs0, ft7, fs6
                  auipc        s8, 350612
                  nop
                  div          a4, a2, s7
                  fsqrt.s      fa4, ft5, rdn
                  addi         s7, t5, -420
                  fsub.s       ft8, ft1, fs9, rtz
                  sra          s3, s2, s4
                  srli         a0, tp, 28
                  feq.s        t5, fs5, fs2
                  fdiv.s       fa6, ft1, fs3, rmm
                  fcvt.s.wu    ft1, a1, rne
                  andi         s0, t2, -820
                  and          s9, s5, s11
                  fcvt.s.w     ft3, s9, rup
                  sra          s0, t0, gp
                  sll          s4, a1, s1
                  srai         a5, s3, 11
                  sltu         zero, zero, s10
                  fcvt.wu.s    s11, fa3
                  slli         t6, t6, 8
                  mulhu        s7, s9, s8
                  div          s7, s10, tp
                  remu         s0, s11, s1
                  flt.s        s11, ft2, ft5
                  srli         a5, s0, 14
                  fsgnjn.s     fs0, fa5, fa1
                  sll          s10, s0, s5
                  mulhsu       t0, t0, t1
                  sltu         ra, a2, a2
                  srl          a0, t6, s3
                  fmul.s       ft3, fs6, fa0, rtz
                  xor          t0, a5, s5
                  fmax.s       ft3, ft8, ft8
                  fmax.s       ft5, fs0, fa6
                  fclass.s     s0, fa3
                  srl          a0, s11, a6
                  srli         s10, s2, 0
                  add          s2, zero, tp
                  fclass.s     a7, ft2
                  slli         s2, sp, 20
                  lui          s2, 17478
                  div          a6, t0, s9
                  sub          s8, a5, t2
                  fmul.s       ft10, fa3, fs10
                  fsgnjx.s     ft7, fa7, fa2
                  fmul.s       fs11, ft3, fs7
                  mulh         s1, t3, a4
                  add          s5, t6, s9
                  feq.s        t6, fs9, fs3
                  fsqrt.s      fs11, fs7, rtz
                  fclass.s     t0, ft1
                  fsub.s       fs11, fa6, ft4, rmm
                  slt          s6, t2, zero
                  sub          t0, a3, a5
                  fmin.s       fs10, fs4, fs0
                  srli         s6, s11, 10
                  mulhu        gp, s10, s7
                  fmax.s       ft8, fs9, ft0
                  mul          gp, t5, s3
                  slti         a0, a3, 1572
                  fsgnj.s      fs7, fa4, fs4
                  fmv.w.x      fa1, s4
                  auipc        s6, 597737
                  fclass.s     a5, ft4
                  sltu         s7, a5, ra
                  xor          s9, a7, s2
                  divu         a7, s6, zero
                  fsub.s       fa2, fs2, ft0
                  fsgnj.s      ft1, ft3, fs3
                  divu         a5, t4, t6
                  lui          s5, 360216
                  fcvt.s.wu    fs7, t1, rtz
                  fmin.s       ft7, fa3, fa4
                  srli         s5, gp, 26
                  slli         s2, s0, 13
                  and          t1, a6, s9
                  mulhu        s3, sp, s4
                  add          s6, t5, sp
                  feq.s        zero, fs1, ft0
                  divu         s11, ra, t1
                  xori         t0, tp, 1034
                  fsqrt.s      fa2, fa4, rtz
                  srai         a7, s0, 12
                  fcvt.wu.s    tp, ft1
                  lui          t1, 140538
                  fsgnj.s      ft8, fa3, fa1
                  fmul.s       ft6, fs9, ft2
                  fdiv.s       fa4, ft6, ft10, rdn
                  div          t5, a1, t0
                  fmax.s       fs11, ft1, ft0
                  srli         t0, a7, 29
                  sll          s7, s4, sp
                  add          s11, a4, s6
                  slt          s10, a1, a3
                  div          s1, s5, s1
                  addi         a5, s8, 419
                  mulhsu       s7, t3, s10
                  slt          s8, a2, t1
                  flt.s        s10, fa0, ft8
                  fsgnjx.s     fa4, fs7, fa0
                  fmax.s       fa4, ft9, fa5
                  slli         t6, s6, 8
                  fcvt.s.wu    ft0, sp, rmm
                  sub          t1, a4, s7
                  sra          gp, ra, a0
                  rem          t2, s5, s5
                  fcvt.wu.s    s0, fs9, rtz
                  fsgnj.s      fs5, ft7, fa5
                  sltu         a6, t6, s0
                  sra          s6, s6, s1
                  fmax.s       fs2, fs6, fs2
                  srli         s7, t1, 3
                  div          t2, s5, s11
                  rem          t1, s2, t3
                  fmin.s       fs3, fs11, fa0
                  addi         ra, a4, -1331
                  xori         t0, t6, 1783
                  fadd.s       fa1, fa1, fs9, rdn
                  fdiv.s       ft10, ft9, fs5, rmm
                  fdiv.s       ft4, fs11, fs3
                  nop
                  mulhu        t2, s5, s2
                  slli         t5, a5, 23
                  add          s1, ra, zero
                  nop
                  fcvt.s.wu    fa5, a3, rup
                  sra          a4, s11, s6
                  srli         a0, t0, 28
                  feq.s        a0, ft7, fs7
                  sra          s6, s6, a3
                  srl          s10, s2, s3
                  srli         s1, t4, 14
                  ori          tp, a4, 1793
                  fcvt.w.s     s3, ft1, rne
                  and          s0, s1, ra
                  fcvt.s.w     fs8, sp
                  add          t4, s5, sp
                  mulhsu       s2, ra, t1
                  fcvt.s.w     fa0, a3
                  slli         zero, ra, 19
                  sll          s4, a0, s3
                  nop
                  fmax.s       ft2, ft3, ft3
                  andi         a3, tp, -751
                  fmax.s       ft2, fs3, fa6
                  xor          t6, a4, zero
                  sltu         t4, a1, a0
                  fle.s        a7, fs9, fs5
                  mulh         t4, s6, s1
                  mulhu        t4, t4, t5
                  lui          s4, 628161
                  slti         a2, a0, -1434
                  srai         s3, t3, 7
                  xori         s1, t5, 1784
                  divu         s5, s2, tp
                  fle.s        s3, fs5, fs5
                  sub          s2, a6, a0
                  fmv.x.w      t2, fa7
                  fcvt.wu.s    t2, ft3
                  fsgnjx.s     fa7, ft9, fs3
                  and          s9, sp, t4
                  fcvt.w.s     s6, ft3, rmm
                  divu         a4, s9, a5
                  addi         a5, s1, -900
                  fcvt.wu.s    a3, ft4, rne
                  fmv.x.w      t5, ft4
                  div          t6, s6, t4
                  mul          s3, a7, s10
                  fmv.x.w      a2, fs8
                  fcvt.s.wu    fs7, t4
                  addi         t4, t5, -880
                  srli         s6, a4, 2
                  flt.s        s6, fs3, ft7
                  xori         a5, s0, -200
                  fdiv.s       fa5, ft2, ft1, rup
                  slt          t1, a1, t2
                  fle.s        t0, ft4, fs1
                  fsqrt.s      fs10, fs0
                  fmv.w.x      fs4, s10
                  srl          tp, a5, s9
                  mul          a6, a4, a7
                  fmax.s       fs3, ft3, fs11
                  sll          t6, t0, a6
                  fclass.s     t5, fa1
                  sll          s5, gp, s11
                  fsub.s       fs11, ft0, ft4
                  mulhsu       a5, s2, a5
                  nop
                  mulhu        gp, ra, zero
                  fcvt.s.wu    fs2, s11
                  fcvt.wu.s    t5, fa0, rup
                  fmv.w.x      ft1, a3
                  mul          s7, s7, s7
                  slli         gp, a1, 14
                  mulhu        ra, s3, ra
                  nop
                  fsgnjx.s     fs8, fs11, ft4
                  lui          a6, 714615
                  fclass.s     s3, fs3
                  lui          s5, 337724
                  srli         ra, a6, 11
                  srl          s7, ra, sp
                  feq.s        s2, fs9, ft6
                  divu         t4, s4, s9
                  fsgnjn.s     ft8, fs1, ft6
                  sra          s8, a7, s7
                  fmv.w.x      fs1, t6
                  sub          s6, a5, t6
                  fle.s        s1, fs10, fa5
                  xor          a6, s6, sp
                  fle.s        s2, ft4, fs3
                  andi         s1, s0, 883
                  mulhu        a7, s8, ra
                  srai         zero, t5, 24
                  and          gp, s10, s5
                  fmax.s       fs9, fs2, fa5
                  slti         t6, gp, 424
                  fclass.s     t1, ft0
                  nop
                  fsub.s       fs3, fa6, fs7, rdn
                  add          ra, s3, gp
                  srli         a4, a5, 5
                  fadd.s       ft7, ft7, ft10
                  remu         s10, s6, t5
                  sll          s10, s11, a2
                  srl          s10, ra, s6
                  fdiv.s       ft2, fa6, fs2, rmm
                  srl          t1, s7, t4
                  addi         t0, s3, -1730
                  fmv.x.w      s4, ft0
                  fmv.w.x      ft2, t6
                  sltu         s5, t2, s7
                  divu         a6, s7, s9
                  xor          a3, a1, s10
                  lui          t1, 722717
                  fsqrt.s      fa5, ft5
                  auipc        a5, 949432
                  srli         s6, a4, 17
                  lui          a3, 476185
                  xor          a7, t2, s0
                  fmax.s       fa2, fs4, fs0
                  sub          a7, gp, s9
                  fsgnjn.s     fa2, fs11, fs2
                  sltu         s4, t2, t2
                  fcvt.s.wu    fa3, t5, rtz
                  slt          ra, s8, s11
                  andi         a5, a3, 186
                  nop
                  sll          s0, tp, t2
                  fcvt.s.wu    ft2, a7
                  fcvt.wu.s    ra, ft0
                  fle.s        tp, fa7, ft3
                  fle.s        s2, fs0, fs9
                  remu         gp, a5, a6
                  nop
                  fmv.w.x      fs10, a4
                  addi         s3, s0, 1551
                  fmul.s       ft1, ft6, ft10, rdn
                  xor          tp, a3, a5
                  slli         s9, t0, 16
                  fmul.s       ft11, fa7, ft1, rne
                  mul          s5, t5, s2
                  auipc        s9, 484931
                  fclass.s     t5, ft4
                  ori          s3, a2, 684
                  ori          s7, s10, -1408
                  divu         ra, s7, a2
                  fcvt.s.w     ft2, a1
                  fclass.s     t5, fs6
                  feq.s        a4, fa7, fs2
                  fclass.s     s5, ft8
                  and          a4, s2, t6
                  divu         s10, a1, s0
                  fmax.s       fa7, fs8, fs7
                  fsub.s       fs3, fs11, fs3, rmm
                  xori         t6, a3, 2033
                  feq.s        s10, ft4, fs9
                  fcvt.wu.s    t6, fs1, rmm
                  srai         s9, gp, 0
                  nop
                  mulhsu       s7, s6, zero
                  fle.s        a5, ft3, fa5
                  add          a5, t1, a4
                  fmul.s       fa0, fs4, fa0
                  fle.s        s7, fa1, ft5
                  sltu         s11, s11, s1
                  srai         s1, s6, 28
                  srai         ra, t1, 28
                  mulhu        s3, s2, gp
                  slt          tp, t3, s5
                  fmax.s       fa0, fs9, fa2
                  mulhu        s7, t6, s8
                  fmax.s       ft8, ft0, fs5
                  fclass.s     t5, ft4
                  mulhsu       a4, ra, a0
                  fmv.x.w      s5, ft3
                  nop
                  ori          t1, sp, -1895
                  rem          t1, s2, zero
                  andi         s0, s1, -389
                  flt.s        t2, fs2, fa0
                  nop
                  sll          s9, t1, t4
                  sll          s0, a3, s2
                  ori          a0, gp, -1622
                  mulhu        a3, s9, s0
                  srai         s7, t0, 21
                  mul          t0, a2, a4
                  feq.s        t2, fs3, fs4
                  slt          s10, a7, a6
                  fsqrt.s      ft6, fa6, rtz
                  divu         s1, s11, a2
                  sra          s2, zero, t6
                  lui          a2, 217244
                  flt.s        gp, fs4, ft7
                  rem          t4, tp, s6
                  or           t0, s0, sp
                  slt          t0, a3, t2
                  ori          a5, t0, -751
                  srl          t2, a0, s11
                  fsgnjx.s     ft3, fs8, ft2
                  fmv.w.x      fa6, a4
                  addi         a3, a7, 681
                  feq.s        s3, fs4, ft6
                  fcvt.w.s     s9, ft1
                  feq.s        a5, fs1, fs8
                  xor          t5, t0, t0
                  rem          s6, ra, s4
                  fcvt.w.s     a0, ft9, rmm
                  ori          s10, t0, 435
                  fle.s        s7, ft11, fa1
                  fcvt.w.s     ra, ft1, rmm
                  ori          s4, a2, -470
                  div          a6, ra, a4
                  mul          a5, t4, s5
                  slti         a3, t2, -576
                  fsgnj.s      fs2, fa6, ft6
                  fdiv.s       fa6, fs3, ft6
                  fcvt.s.w     fa6, a1, rmm
                  flt.s        tp, fs9, fa5
                  addi         t4, tp, 298
                  fcvt.wu.s    a4, fs6, rdn
                  fle.s        s10, ft1, fa4
                  fcvt.s.w     fa4, s5, rne
                  fadd.s       fs0, fs7, fs11, rne
                  remu         t0, gp, a6
                  or           s8, s2, s3
                  fmax.s       ft5, fs3, fs6
                  mulhsu       s9, a4, s11
                  or           t6, a6, sp
                  add          a0, s4, t0
                  div          gp, a6, s3
                  sltu         s0, s7, t0
                  divu         s7, tp, s11
                  mulhu        a2, a0, t4
                  fle.s        a5, fs3, fs0
                  remu         s11, t2, t3
                  lui          a7, 271839
                  slli         t4, a1, 8
                  xori         zero, t5, 1317
                  xori         a5, s0, 1321
                  slt          t6, s10, t3
                  div          zero, s11, t6
                  slt          s6, t3, a1
                  fmax.s       ft2, fs5, fs7
                  flt.s        t4, fa1, ft10
                  fcvt.s.wu    fa0, t3, rtz
                  div          zero, a1, s8
                  srli         s6, s0, 5
                  slti         t0, s6, 1293
                  fmv.w.x      fa6, a5
                  fle.s        s11, fs11, ft9
                  mulhu        s5, t1, zero
                  xor          a5, s7, a2
                  rem          s11, tp, ra
                  lui          s7, 466473
                  slt          t0, a6, s0
                  andi         a4, s6, 893
                  slt          a3, s8, ra
                  fclass.s     t0, fa3
                  remu         s9, t1, a7
                  fmv.w.x      fa0, tp
                  fmv.x.w      s5, fs8
                  sll          zero, a2, s0
                  fmul.s       fa2, fa2, fa5, rmm
                  sra          s10, t1, t3
                  flt.s        t2, fa1, ft8
                  feq.s        s5, fs7, fs3
                  fcvt.w.s     a4, fa7
                  fsqrt.s      fs4, ft8, rup
                  fcvt.wu.s    t5, fa6, rne
                  fclass.s     s3, ft9
                  fadd.s       fs4, ft11, ft7, rup
                  slli         s5, zero, 13
                  add          s2, a5, s7
                  divu         a6, a3, t2
                  addi         a2, a0, -21
                  sll          a7, tp, t3
                  mulhsu       t2, zero, gp
                  sll          s9, a4, a0
                  and          t0, s4, s10
                  slli         s2, a1, 16
                  sll          s5, a6, ra
                  fcvt.wu.s    t6, fs9, rup
                  rem          s2, t1, a6
                  lui          s6, 285484
                  fsgnjx.s     fa3, fa3, ft3
                  add          a6, t2, t4
                  fcvt.s.w     ft8, gp
                  fdiv.s       fs1, fs5, ft7
                  addi         t4, s3, 725
                  fcvt.s.w     fs6, s11, rne
                  fmin.s       ft2, fs4, fa4
                  fcvt.s.w     fs9, s2
                  feq.s        a0, ft9, ft2
                  fdiv.s       fa6, ft7, fs2, rup
                  addi         s8, a7, 1312
                  div          gp, s2, ra
                  fsgnj.s      fs4, fs7, ft9
                  sra          s5, s4, t0
                  fcvt.w.s     ra, ft7, rup
                  fadd.s       ft3, fs11, fa4, rne
                  srl          s7, s6, s6
                  mulhsu       s3, t2, t0
                  slti         s3, s3, -1844
                  fcvt.wu.s    a3, fa3
                  srli         t5, sp, 25
                  remu         a2, a0, t1
                  fcvt.w.s     a7, fa2, rmm
                  feq.s        s5, fa2, fs8
                  fadd.s       fs0, fs1, fa7, rne
                  sltu         ra, s2, t4
                  xor          s3, s3, t0
                  xor          s2, s10, gp
                  feq.s        a4, fs11, fs11
                  mul          a4, s9, t0
                  srl          a4, s1, t5
                  fmul.s       fs1, ft9, ft8, rmm
                  fcvt.wu.s    s6, ft2
                  fdiv.s       fa2, fs3, ft9
                  rem          t5, sp, a6
                  sltu         a2, t6, a1
                  nop
                  fmv.x.w      s6, ft6
                  divu         a6, a0, t4
                  nop
                  srl          s2, s9, gp
                  and          a5, a3, t5
                  srli         a6, a2, 11
                  slti         a5, s7, 454
                  slli         s1, a2, 17
                  mulhsu       t6, t2, s3
                  sll          a6, tp, s3
                  addi         s6, a0, -1881
                  slli         s5, t6, 18
                  sltu         s4, t4, t0
                  fmv.w.x      ft11, t4
                  fmv.w.x      ft2, gp
                  fsgnjn.s     ft4, fa3, fs11
                  fmul.s       fs6, fa5, fs6, rmm
                  fsgnjn.s     fs2, fa1, ft10
                  srai         s10, ra, 31
                  flt.s        zero, fs10, fa7
                  fmin.s       fs3, ft5, fa0
                  sltu         a0, a4, t3
                  mulhsu       s9, t2, zero
                  fcvt.s.w     fs5, gp, rtz
                  fcvt.s.wu    fs7, tp, rne
                  fcvt.s.wu    fs9, t1
                  fcvt.w.s     s3, ft8, rne
                  div          a7, s0, t5
                  fsgnjn.s     ft11, fa7, fa1
                  fcvt.s.wu    fs11, t1
                  fdiv.s       ft7, fs10, ft9
                  mulhu        t2, gp, a7
                  fcvt.w.s     s11, fa2, rne
                  lui          a5, 234363
                  fdiv.s       fs9, fs10, fa2
                  rem          a6, s7, s6
                  xori         s8, s0, -845
                  flt.s        a3, fs1, fa5
                  fmv.w.x      ft2, t5
                  rem          s6, s2, s1
                  mulh         tp, s9, t2
                  fsgnjn.s     ft2, fs9, fs4
                  mul          s6, sp, a7
                  srli         a5, t1, 0
                  srli         s2, t1, 7
                  fcvt.s.wu    ft6, s3
                  fmv.w.x      ft3, s6
                  fcvt.w.s     s1, fa2
                  xor          t1, s2, a0
                  fmv.x.w      s8, ft10
                  fsqrt.s      fa5, fs1
                  fsgnjx.s     fa2, fs5, fs10
                  mulhsu       s5, a1, a1
                  sra          a2, zero, a5
                  addi         tp, s11, 1181
                  andi         s3, s10, -723
                  divu         t0, t0, a2
                  fle.s        s0, ft7, fs9
                  slli         s1, a3, 6
                  fsgnj.s      fa4, fs1, fs0
                  fle.s        s2, fa2, fs1
                  fsgnjn.s     fs6, fa2, ft1
                  fsqrt.s      ft5, fs7, rtz
                  nop
                  fmv.x.w      s1, ft11
                  fmv.x.w      a0, fs3
                  feq.s        s7, fs8, ft1
                  fmul.s       ft3, ft2, ft11, rmm
                  xori         zero, a2, 998
                  fsgnjx.s     ft9, ft11, ft9
                  fmin.s       fa0, fa6, ft2
                  mul          gp, s3, s8
                  andi         t0, a3, -685
                  fsgnjx.s     fs3, fs5, ft5
                  fclass.s     t2, ft7
                  srai         zero, a4, 12
                  srli         t2, a6, 1
                  and          s10, tp, t3
                  div          s3, a6, s2
                  slti         s10, s2, -1079
                  fcvt.wu.s    t4, fs5
                  fmin.s       ft0, ft2, fa7
                  remu         t4, s2, t4
                  sltiu        s0, a6, -1698
                  or           ra, s8, s5
                  fcvt.s.w     fa6, s9
                  sltiu        t0, a1, 549
                  add          a0, a5, s4
                  fdiv.s       fs3, fs10, fa7, rup
                  slti         t0, t0, 1786
                  srl          s0, t2, s10
                  div          a2, tp, a5
                  slt          t1, sp, s7
                  sra          s0, t6, s0
                  srli         gp, t0, 26
                  fmv.w.x      ft10, zero
                  add          t6, tp, s11
                  andi         s4, s8, -795
                  fsqrt.s      fa7, fs7, rup
                  mulhsu       s11, s2, t4
                  mulhsu       gp, s5, t0
                  fle.s        a4, ft3, fs1
                  fle.s        a3, ft11, fs4
                  auipc        s1, 894936
                  rem          s5, s7, a4
                  or           a7, s5, s5
                  fcvt.wu.s    t0, fs9, rtz
                  slti         zero, sp, -896
                  fclass.s     t5, ft5
                  divu         a6, gp, s0
                  mulhu        tp, t0, t3
                  divu         a7, s5, s1
                  and          s1, zero, s5
                  srai         s6, s5, 10
                  fcvt.s.w     fa4, s7, rtz
                  mulhsu       s2, s3, a5
                  fcvt.s.w     fs6, s9
                  srai         a5, s9, 0
                  auipc        s9, 785456
                  lui          s1, 292230
                  slti         s2, s0, 846
                  addi         gp, sp, -805
                  div          s6, t3, ra
                  nop
                  add          a6, a6, s0
                  add          a2, t6, a2
                  fdiv.s       ft3, fs9, fs9, rne
                  sltiu        ra, s2, 1167
                  fmv.w.x      ft4, zero
                  rem          a3, a7, s2
                  fadd.s       fs7, ft7, ft11
                  addi         t0, t3, -1225
                  addi         t1, a4, 447
                  fmax.s       fa6, fs0, fs8
                  sra          ra, s10, t2
                  sll          t6, s9, zero
                  slt          s7, s0, s5
                  flt.s        s1, ft8, ft10
                  slli         a7, s2, 2
                  fsgnjn.s     fa2, ft10, fa4
                  sltiu        t4, t6, 205
                  and          t6, a4, t0
                  mulhu        a7, a7, s9
                  sll          t4, a0, s1
                  fmul.s       fs1, fa7, fa4
                  add          s11, a1, s3
                  fle.s        s0, fs1, fs2
                  fmv.w.x      fs10, zero
                  fmv.x.w      a2, fa4
                  fcvt.s.wu    fs9, a5, rmm
                  slli         a0, t5, 28
                  fmax.s       ft5, fs5, fa2
                  fdiv.s       fs9, fs3, ft11
                  sll          s7, s1, t6
                  fmin.s       fa0, fs6, ft9
                  add          a6, ra, a1
                  srl          s8, s5, a2
                  auipc        s9, 541538
                  fmax.s       fa4, fs10, fa2
                  slt          t2, s10, t1
                  sub          a4, a3, t0
                  xori         t4, a2, -294
                  fcvt.wu.s    gp, ft4, rmm
                  fsgnjn.s     ft9, ft2, fa6
                  sra          t6, s2, a6
                  mulh         tp, s10, s1
                  fdiv.s       fa5, fa2, fa2, rtz
                  fcvt.s.w     ft3, t0
                  srli         a4, a2, 5
                  xor          s6, s2, gp
                  sra          s11, s1, a6
                  sra          t6, s10, s9
                  fle.s        a6, ft2, fs4
                  feq.s        a3, fs2, fa5
                  sll          t2, s7, t3
                  remu         s0, s3, a3
                  srl          a4, t2, s10
                  fle.s        s7, fs4, ft5
                  add          t4, zero, t4
                  sub          t6, ra, zero
                  fdiv.s       ft8, ft8, fs3, rtz
                  srl          s7, t6, s2
                  auipc        a7, 46732
                  fadd.s       ft1, fa1, ft9, rtz
                  mulhu        s11, t6, s6
                  srai         s2, t1, 23
                  andi         tp, s8, -190
                  ori          t4, tp, -1961
                  srli         s7, s6, 0
                  fsgnjx.s     fa1, ft3, ft9
                  fle.s        a2, fs3, ft0
                  fsqrt.s      ft11, fs7
                  mul          a3, t6, s6
                  sltu         s6, a3, a6
                  fadd.s       fa4, fs6, fs6, rne
                  fcvt.w.s     s6, fa0, rmm
                  fadd.s       fs7, fs3, fs7, rne
                  or           s3, s10, s4
                  slti         gp, s9, 1271
                  rem          s11, t4, t3
                  add          t2, tp, s2
                  feq.s        a6, ft0, ft7
                  sll          t4, t1, s9
                  fcvt.s.w     fa7, t1, rtz
                  divu         s4, sp, a3
                  slt          s1, s7, a6
                  fcvt.wu.s    s5, fa6
                  fmax.s       fs0, fa3, fs9
                  fcvt.wu.s    s10, fa4
                  add          s3, a2, s10
                  add          a2, s6, a5
                  slli         ra, t3, 31
                  nop
                  andi         a2, a6, -61
                  lui          s3, 717501
                  rem          gp, a0, a4
                  div          gp, t3, s4
                  fdiv.s       fs9, ft8, fa2
                  mulh         gp, s7, a5
                  fsgnj.s      ft10, ft0, ft8
                  rem          s9, gp, s2
                  xor          a2, a6, sp
                  sra          s2, sp, ra
                  fsgnj.s      fa2, ft9, ft4
                  rem          t1, s1, ra
                  fcvt.wu.s    a2, ft1, rmm
                  srai         s2, s7, 6
                  div          a6, a4, gp
                  fsgnjx.s     ft11, fa1, ft6
                  mulh         a3, t3, s8
                  fsgnjn.s     fs10, fs11, fs9
                  sub          t5, sp, t5
                  fclass.s     ra, ft8
                  fcvt.s.wu    fs6, s8, rne
                  xor          gp, s1, zero
                  slli         s4, a4, 6
                  fclass.s     t2, fs8
                  mul          s3, s3, zero
                  srli         t6, s9, 7
                  lui          t4, 757594
                  fmv.w.x      fs0, s3
                  and          s7, s4, sp
                  srli         s4, tp, 17
                  fmul.s       fs4, fs11, ft1, rtz
                  slt          a4, s9, gp
                  fcvt.s.wu    fs0, s8
                  slli         s6, t6, 28
                  sub          s1, s9, s5
                  feq.s        t6, ft11, fs5
                  div          s5, t2, a6
                  rem          a4, tp, a4
                  sub          s7, s6, s4
                  sra          s4, t3, s5
                  fclass.s     a6, fa4
                  mul          s8, zero, a1
                  andi         a4, s7, -1230
                  mulhsu       s3, gp, a0
                  srl          a6, s6, s11
                  ori          t2, t3, -1969
                  or           s6, a5, a5
                  divu         s5, t6, s3
                  divu         tp, t3, s0
                  fcvt.s.wu    ft3, ra, rup
                  add          gp, s4, s8
                  remu         t4, a3, t2
                  fsqrt.s      ft2, fa5, rmm
                  add          s6, s11, t5
                  or           s4, sp, zero
                  fmv.w.x      fa3, s7
                  fmv.x.w      a4, fa0
                  fsgnjn.s     fa4, ft0, fs2
                  fcvt.w.s     s7, fa2
                  feq.s        t5, ft7, fa7
                  slti         a0, s6, -1752
                  add          t5, s7, a5
                  lui          t5, 440167
                  sll          s0, s9, a2
                  feq.s        s6, fa7, fa6
                  fsgnjx.s     fs7, fs9, fs10
                  rem          t5, t3, a5
                  fcvt.w.s     zero, fa7
                  fmv.w.x      ft0, sp
                  fcvt.wu.s    gp, ft8
                  slli         ra, t2, 30
                  fcvt.s.wu    fa6, t5
                  fdiv.s       fs11, fs1, fa1
                  xor          a0, t3, a3
                  slli         s0, s8, 18
                  fcvt.w.s     a2, fa0, rtz
                  fmv.w.x      fa5, ra
                  xori         t2, s1, 1303
                  fcvt.wu.s    gp, ft6, rmm
                  xori         t2, s0, -389
                  fsgnj.s      fs5, fs11, fs2
                  srai         s4, s5, 21
                  divu         t6, sp, gp
                  mulh         s11, a1, s8
                  fcvt.s.w     ft11, a0, rup
                  fle.s        a4, ft10, fs2
                  slt          s5, s10, a7
                  flt.s        tp, fa6, ft11
                  fclass.s     ra, fa3
                  sltu         t4, a7, s4
                  mulh         zero, s2, t1
                  xor          ra, a1, s11
                  fmul.s       fs10, ft11, ft3
                  flt.s        a7, fa1, ft2
                  flt.s        tp, fa7, fa3
                  flt.s        a5, fs1, ft11
                  srli         a0, s10, 11
                  fmv.x.w      s11, fa6
                  fsub.s       fs7, fs9, fa4, rmm
                  fsub.s       ft6, fa0, fs10
                  fmin.s       ft2, ft11, fs1
                  fdiv.s       fs1, ft0, ft8
                  fmin.s       ft5, fa7, ft4
                  remu         a6, s2, s10
                  div          t5, s2, a4
                  or           a2, s9, a4
                  mulhu        t0, s10, s4
                  fsgnj.s      ft2, fs2, fs3
                  fcvt.s.w     fs10, a6, rup
                  fcvt.s.w     fa1, s8
                  fmax.s       ft1, ft4, fs9
                  mulh         t2, s5, zero
                  fcvt.wu.s    s0, ft1, rne
                  andi         a3, t5, -1363
                  fmv.x.w      a5, ft7
                  sll          s9, t5, t2
                  addi         t6, a7, -1945
                  sra          s5, s8, s8
                  fmin.s       fa1, ft3, fs8
                  fsub.s       ft7, fs6, fa2
                  remu         s4, s7, t2
                  addi         s4, t1, -1767
                  mulhsu       ra, zero, s5
                  fdiv.s       fs9, ft9, fa1
                  lui          a2, 405596
                  fsgnj.s      fs0, ft4, fa4
                  slli         s8, a6, 8
                  xori         s6, s2, -1196
                  sra          a5, t4, gp
                  or           a2, t4, a2
                  fcvt.wu.s    gp, ft0
                  fcvt.s.wu    fa0, zero, rup
                  fsqrt.s      ft7, fa1, rtz
                  feq.s        t5, fs4, ft11
                  remu         s8, s0, s3
                  divu         gp, s2, a4
                  sub          a3, s2, t5
                  slt          a2, s3, t3
                  fclass.s     s1, ft6
                  mulhu        s0, s7, sp
                  fle.s        a5, fa4, ft3
                  fsgnjx.s     fa6, fs8, fs0
                  sra          s8, zero, t1
                  addi         s4, s4, 1820
                  divu         gp, t0, t6
                  mulhsu       s0, a5, a4
                  sll          s6, s5, zero
                  flt.s        tp, ft11, fs7
                  slli         s3, a7, 29
                  addi         t0, s1, -630
                  mul          s0, s0, t3
                  fcvt.wu.s    t5, fs0, rne
                  mulhu        a0, a6, s7
                  mulh         s9, s4, s6
                  fcvt.w.s     s10, fs2, rup
                  slt          ra, sp, a7
                  fdiv.s       fs2, fs1, ft9, rne
                  xor          a7, t3, s9
                  or           s8, s7, s4
                  fmax.s       ft9, ft6, ft2
                  fadd.s       fa3, fa5, ft3, rup
                  fcvt.s.w     fs6, s9, rmm
                  fcvt.w.s     a5, fa2
                  add          tp, a3, s4
                  fcvt.s.w     fa3, a3, rtz
                  sub          a5, t5, sp
                  fmax.s       fs3, ft0, fa5
                  remu         s10, s6, a6
                  sra          s4, s3, a1
                  fsqrt.s      fa1, fa0
                  rem          a7, s4, a5
                  lui          s5, 954929
                  mulhsu       a4, s10, a7
                  fsgnjn.s     fa5, fa1, fa3
                  mulhu        gp, a4, sp
                  sltiu        s5, a0, -1719
                  srli         a0, s3, 0
                  rem          a0, a3, gp
                  feq.s        t6, ft2, ft4
                  flt.s        a5, ft0, ft5
                  fcvt.s.w     fs3, t1
                  fmul.s       ft11, fs5, fs11
                  mulh         t6, a4, a3
                  ori          t0, s5, 1639
                  lui          t4, 512103
                  srai         s6, a4, 1
                  remu         s11, ra, t6
                  fmax.s       fs0, fs4, fs3
                  fadd.s       fs9, fs8, ft7
                  auipc        s7, 619390
                  fmul.s       ft10, fs7, ft1, rmm
                  xori         a0, a3, -1725
                  slli         t4, t2, 6
                  sra          t6, a0, a0
                  fle.s        s2, ft8, fs2
                  sub          s2, a1, t3
                  sub          a3, t4, s10
                  andi         s5, t4, -249
                  fsgnjx.s     fa4, fs10, ft5
                  add          gp, a4, s10
                  srl          t4, s7, gp
                  fdiv.s       fs9, fs5, fs6
                  fclass.s     s9, ft11
                  fsqrt.s      fs6, fa7, rdn
                  ori          s11, s10, 1163
                  fsgnjn.s     fs4, ft7, ft4
                  fmv.x.w      s6, fs0
                  feq.s        t0, ft5, fa4
                  add          s6, s6, ra
                  fle.s        a3, ft4, fs2
                  xori         s3, s3, -619
                  fmv.w.x      ft1, s4
                  xor          s6, s10, t0
                  fclass.s     a5, ft4
                  slli         s8, gp, 22
                  xori         s7, ra, 2000
                  sll          s2, gp, t6
                  add          zero, gp, s4
                  sra          tp, a6, t0
                  fcvt.s.wu    fa3, s4, rtz
                  sra          t4, s4, ra
                  fcvt.w.s     s10, fs7
                  or           s5, s10, t4
                  fmin.s       ft6, fs7, fa4
                  fsgnjn.s     fs6, fs1, fs0
                  fmv.x.w      a2, fa4
                  sub          a7, tp, s10
                  ori          t0, ra, -864
                  fcvt.wu.s    s4, fs2
                  slti         zero, t1, 217
                  fcvt.s.wu    ft7, s9
                  lui          s8, 872140
                  lui          a0, 913576
                  nop
                  or           t4, s3, s0
                  fsgnjx.s     fs9, fs6, ft0
                  fdiv.s       ft5, ft6, fa3
                  fsqrt.s      fs6, ft4
                  auipc        gp, 344241
                  fsgnjx.s     fa6, fs8, fs5
                  ori          t0, tp, -920
                  srl          gp, s1, a2
                  sub          s7, a4, tp
                  fsgnj.s      fs11, fa4, ft9
                  divu         t0, a7, s11
                  fsgnjn.s     ft7, fs5, fs4
                  feq.s        s5, fs3, fa3
                  mul          a3, t0, s6
                  sll          s4, s2, t5
                  srai         a0, a0, 0
                  xori         s1, a6, 1440
                  div          t1, s6, s9
                  rem          zero, a4, s3
                  sll          ra, gp, t0
                  or           zero, sp, a2
                  and          a5, s4, tp
                  and          t6, s6, s5
                  lui          zero, 166236
                  addi         s10, a1, 167
                  fsgnjn.s     ft11, ft6, ft6
                  lui          s11, 1048001
                  sra          t6, a3, a5
                  mulhu        a7, s2, s2
                  fsgnjn.s     fa6, ft0, fs11
                  mulhsu       a2, a3, s8
                  srai         t4, a4, 0
                  fsub.s       ft2, ft9, ft11, rmm
                  rem          s6, t2, t1
                  ori          s1, t4, 1521
                  remu         s8, gp, ra
                  slli         s0, gp, 12
                  feq.s        t6, fs5, ft4
                  fsgnjx.s     ft0, ft11, fs8
                  auipc        s6, 856214
                  divu         s10, a4, a1
                  fmax.s       fa6, fa3, ft5
                  fsgnjx.s     ft7, ft3, ft1
                  nop
                  fsqrt.s      ft5, fa7, rtz
                  mulhsu       s2, a1, a7
                  srai         a5, tp, 8
                  addi         s11, t1, -837
                  div          s3, a6, a0
                  srl          t4, s0, a2
                  srli         a3, t6, 12
                  addi         t5, a5, 711
                  fmv.x.w      t2, fa6
                  slli         a2, t4, 9
                  fsqrt.s      fs0, ft0, rmm
                  fcvt.s.w     ft6, s5, rdn
                  fcvt.s.wu    ft5, s4, rdn
                  srai         gp, tp, 19
                  addi         zero, a5, 675
                  srli         ra, s4, 13
                  fclass.s     s8, fa2
                  xor          s2, t2, a4
                  fcvt.s.wu    ft9, s7, rdn
                  fmin.s       ft6, ft9, fa3
                  nop
                  fsgnjx.s     ft5, fa3, ft11
                  sub          a3, s7, t6
                  ori          a7, a7, 1037
                  and          s5, s9, s3
                  addi         gp, s8, -1230
                  sub          t2, a4, t4
                  xor          a6, s5, gp
                  mulhsu       a7, s4, a6
                  sltu         a4, t4, s11
                  rem          s3, tp, a7
                  fsgnjx.s     ft9, fs5, fa7
                  slt          s7, a0, a5
                  fclass.s     a6, fs9
                  fsub.s       ft4, ft0, fs8
                  ori          a2, a6, -658
                  fsgnjx.s     ft4, fa0, fs10
                  fsqrt.s      fa3, fa3
                  flt.s        a7, ft6, fs4
                  sltu         a5, s3, s2
                  sra          a4, s8, zero
                  xori         a7, t2, 532
                  sra          t2, a6, t0
                  xori         t1, t3, 985
                  slti         tp, sp, 493
                  mulh         a7, ra, s2
                  fcvt.w.s     t4, fa7, rup
                  fadd.s       ft0, ft5, fs11, rup
                  fsub.s       fs1, ft3, fa6
                  slti         t1, s4, -17
                  sll          s7, a5, s0
                  fle.s        s3, fs4, ft7
                  feq.s        a4, ft0, fs11
                  srai         a3, a7, 2
                  xor          s5, tp, s6
                  rem          s7, sp, s4
                  lui          t5, 297671
                  slt          s10, s0, a3
                  fcvt.wu.s    a0, fs9, rmm
                  addi         s11, zero, 1697
                  fcvt.s.wu    fa6, a1
                  fadd.s       fa7, fs2, fa4
                  fcvt.s.w     fs0, a0, rtz
                  mulhu        s3, a0, t0
                  sltiu        t5, a3, -2030
                  ori          s8, s7, -81
                  slt          t5, s1, s7
                  slli         a2, s5, 7
                  fsub.s       fa7, fs9, fs6, rmm
                  mulh         t5, s4, t6
                  add          s3, t5, a5
                  remu         s9, a4, s2
                  divu         t1, s5, s0
                  addi         s3, a3, 710
                  fsgnjn.s     fa0, ft11, ft7
                  slli         s1, a7, 2
                  fmv.w.x      fs0, t1
                  sub          a2, zero, s8
                  add          tp, t3, ra
                  slli         s10, t2, 30
                  fsqrt.s      ft11, fs2, rmm
                  div          zero, t3, ra
                  rem          a6, s0, s10
                  ori          s6, s3, -728
                  fmul.s       fs7, fs7, fa4, rup
                  slli         s2, s7, 29
                  fle.s        ra, ft11, ft10
                  fsgnjn.s     ft3, fa3, fs11
                  xor          s4, s9, a5
                  sltu         s6, s7, a7
                  srli         s3, sp, 7
                  sll          s8, s6, a4
                  sltiu        s7, t6, 1878
                  fsqrt.s      fa6, ft11, rup
                  mul          s7, s0, a4
                  slli         gp, s11, 8
                  mulhu        s6, s4, s3
                  mulh         t2, t4, a1
                  mulhsu       a7, s2, s0
                  andi         s3, s6, 1350
                  mulhu        s4, s7, s9
                  fadd.s       fa2, fs6, fa5
                  srli         a5, s6, 21
                  div          s6, s3, s4
                  fsub.s       ft5, ft8, fs0
                  srai         a6, a6, 14
                  auipc        t0, 823522
                  fcvt.wu.s    a7, fs2, rup
                  slti         s0, s7, 1188
                  divu         a7, t0, s2
                  fmul.s       fs5, ft3, fs4
                  rem          a4, gp, s3
                  fclass.s     s9, ft7
                  add          s2, sp, t0
                  slti         s9, s3, 1795
                  slt          t2, ra, ra
                  mulh         a3, s6, s1
                  slt          s3, s1, s9
                  srl          s9, s5, a6
                  srai         t4, s10, 10
                  mulhsu       s10, a6, a2
                  andi         s9, s1, 1242
                  flt.s        s4, ft11, ft1
                  flt.s        s4, ft4, ft2
                  fdiv.s       fs2, fs10, fs3
                  fmv.w.x      fs2, a0
                  srai         s9, s8, 30
                  mulh         a0, zero, sp
                  feq.s        s2, fs3, fa0
                  nop
                  fadd.s       fs10, ft7, fs7
                  flt.s        t2, fs0, ft11
                  fmax.s       fs1, ft6, ft10
                  rem          s1, s7, gp
                  and          t1, t6, s3
                  fcvt.wu.s    t1, ft6
                  fmul.s       fs10, fs4, ft3, rup
                  sltu         s9, gp, a1
                  rem          s7, s1, s1
                  sra          s6, s8, s9
                  mulh         t4, t2, s4
                  fsgnj.s      fa1, ft0, fa0
                  auipc        t2, 539126
                  remu         s9, s8, tp
                  and          t5, s4, a0
                  slt          s10, s10, s7
                  rem          a7, s11, t2
                  ori          a0, a5, -1656
                  fmin.s       ft10, ft8, fa6
                  fsgnjx.s     fs2, fs2, fs11
                  fsgnj.s      ft2, ft2, ft8
                  fmv.w.x      fa7, s9
                  fmv.w.x      fs10, a7
                  sub          s7, zero, a0
                  xori         t0, t1, 881
                  xor          s8, zero, s3
                  xor          s2, t3, t4
                  divu         s1, a7, t4
                  sll          a0, s0, a6
                  mulh         s5, s4, s7
                  fsqrt.s      ft3, ft1, rtz
                  srli         a2, s0, 26
                  fmax.s       fs11, fs2, ft11
                  fcvt.s.wu    fs9, s7, rtz
                  fsub.s       ft4, ft1, ft2, rdn
                  srai         t1, s4, 3
                  nop
                  addi         gp, s0, 1165
                  mulhsu       s7, t3, a3
                  feq.s        t5, ft8, fs10
                  srai         s11, a1, 23
                  slti         s1, s9, -922
                  fcvt.w.s     t4, ft7
                  fclass.s     a3, fs7
                  mulhsu       t2, t0, s2
                  fle.s        a6, fa4, fa2
                  srl          t5, t3, s6
                  sltu         s11, a4, a7
                  fsqrt.s      fa7, ft6, rup
                  fmv.w.x      ft5, s1
                  addi         t5, a6, 1064
                  ori          t4, a4, -412
                  flt.s        ra, fs0, fs11
                  fmv.x.w      s8, ft3
                  ori          s5, s0, -81
                  rem          tp, s3, a6
                  fcvt.w.s     s6, fa6, rup
                  sub          a6, sp, s9
                  fcvt.w.s     s5, fs8
                  divu         t6, t5, a5
                  sra          s10, s0, a1
                  sub          zero, s8, a6
                  xor          t1, t1, t6
                  lui          s9, 856057
                  srl          tp, a1, s9
                  fmax.s       ft7, ft4, fs3
                  sltu         a0, t5, t4
                  rem          t5, s2, t5
                  fmv.w.x      ft0, s8
                  fsqrt.s      fs9, fs10, rup
                  divu         zero, gp, s0
                  auipc        s6, 817692
                  srl          ra, s7, t5
                  xor          tp, s2, a4
                  fadd.s       fa2, fs11, ft10, rup
                  fcvt.s.w     ft5, a6, rtz
                  fsgnjx.s     ft1, fa4, ft8
                  addi         t0, s8, 359
                  fsgnj.s      fa5, fa5, fs6
                  sub          a6, s8, s7
                  xori         s8, s3, -1398
                  fcvt.w.s     a6, fs1
                  sll          t6, a5, s2
                  fdiv.s       ft2, ft0, fs0
                  fsgnjx.s     fs0, ft8, fs10
                  mul          ra, s11, t4
                  lui          s4, 692178
                  slt          a2, a0, a3
                  srli         zero, s4, 16
                  fmin.s       fs5, fs2, fs10
                  xori         a5, a7, 1924
                  slli         s11, s7, 1
                  mulh         ra, t3, s3
                  srai         a0, a3, 7
                  fmv.w.x      fs0, tp
                  fle.s        s9, ft4, ft8
                  fcvt.w.s     tp, ft1, rmm
                  mul          t4, t4, a4
                  ori          gp, s5, -48
                  mulhsu       a6, a1, s4
                  sltu         s2, s10, sp
                  remu         s11, a7, t6
                  fsqrt.s      fs11, ft7, rup
                  ori          s8, zero, -1573
                  fmv.w.x      ft11, a5
                  remu         s9, t0, s0
                  xor          t0, t2, a7
                  andi         t2, t2, 536
                  srl          a3, a0, t0
                  slti         s7, zero, -1665
                  feq.s        t5, ft10, fs6
                  flt.s        t0, fs9, fa4
                  rem          s0, t3, a1
                  fsub.s       fs11, fs6, ft6
                  sll          s7, t6, s1
                  sltiu        s6, a4, -468
                  xor          s7, s3, a2
                  nop
                  sub          t1, t2, s2
                  fcvt.w.s     s1, fs4
                  srli         tp, t1, 21
                  fsgnjn.s     fa1, fs0, fa1
                  fsgnj.s      fa5, ft11, ft6
                  srl          s8, t3, ra
                  flt.s        s9, fs4, fa7
                  srl          s10, t3, ra
                  mul          s2, t1, s5
                  fmul.s       fa4, fs3, ft10, rup
                  xor          s7, s5, ra
                  mul          t0, sp, tp
                  mulh         a7, s3, a7
                  feq.s        a3, fa4, fs3
                  fcvt.wu.s    tp, fs2
                  fcvt.w.s     s4, fs6, rup
                  ori          t5, s7, 1276
                  fmv.w.x      ft0, t1
                  xori         t5, ra, 1132
                  mulhu        s8, tp, ra
                  fle.s        s8, fa4, ft0
                  or           s3, tp, t2
                  fsqrt.s      ft6, fs11, rdn
                  sltiu        t5, zero, -27
                  fsgnjn.s     fs1, fs1, ft5
                  srl          s7, a6, s11
                  xori         ra, s8, -1448
                  ori          ra, a6, 307
                  srai         gp, t6, 5
                  slt          a5, a5, tp
                  srl          a6, tp, t0
                  srai         a4, t3, 28
                  fmin.s       fs9, fa2, fs5
                  fclass.s     s1, fs7
                  fmin.s       fs7, fs3, fs3
                  srl          a3, t2, s5
                  div          a6, t5, s9
                  slti         s6, a7, 1493
                  div          t4, s6, s1
                  and          s3, t3, a0
                  div          zero, s1, t4
                  lui          a2, 646922
                  auipc        a7, 435084
                  srl          a6, s11, a7
                  addi         s1, a0, 896
                  sltu         t0, s2, s10
                  nop
                  add          a6, s0, s7
                  rem          ra, t1, s1
                  mul          t5, a5, zero
                  xori         a6, a0, 444
                  nop
                  fsqrt.s      fs6, ft8
                  sltiu        s4, s1, -1858
                  fadd.s       fs6, fa3, ft11, rtz
                  divu         s9, t1, gp
                  fmv.w.x      fs4, t5
                  xori         a7, t0, 1014
                  ori          t6, tp, 565
                  fmax.s       ft3, fs9, fa2
                  sll          s4, a5, t3
                  fmv.x.w      zero, fs9
                  fcvt.s.w     fs10, s10
                  fmin.s       ft7, fs0, fs9
                  feq.s        t0, fa7, fs3
                  lui          gp, 326585
                  mulhu        t1, t6, a5
                  mulhsu       gp, s6, gp
                  add          a6, s6, a0
                  lui          t4, 649479
                  sltiu        a7, s1, -598
                  fcvt.wu.s    t6, fa7
                  fsgnjn.s     fa6, ft11, fs8
                  fcvt.wu.s    s10, fs6
                  fdiv.s       fa1, fs3, ft11
                  fsgnj.s      fs2, ft4, fs9
                  auipc        s7, 528070
                  mulhsu       s6, s7, s10
                  div          ra, s11, s1
                  fdiv.s       ft2, fs10, fs0
                  andi         a0, a1, 2005
                  fle.s        s3, fs5, fs6
                  fclass.s     s10, ft1
                  xori         a5, a3, 583
                  fdiv.s       fs5, fs2, fa1, rmm
                  feq.s        s7, ft10, fs11
                  fsgnjn.s     fa7, ft2, fa4
                  fsgnjx.s     ft8, fa4, fs11
                  fsgnj.s      ft6, ft0, fa2
                  andi         a7, gp, 436
                  and          s4, s4, sp
                  fcvt.wu.s    s9, ft4, rup
                  xor          tp, ra, a6
                  fcvt.w.s     s10, ft9, rup
                  fmin.s       fa6, ft4, ft4
                  flt.s        s11, fs5, fa7
                  sub          t6, s1, a3
                  slti         s3, s3, -1488
                  sub          t5, a2, t2
                  slt          s11, a3, t1
                  srli         t5, s10, 29
                  fle.s        a4, fs8, fs3
                  sra          ra, t2, s0
                  srai         a7, a3, 13
                  addi         ra, t0, -1300
                  fclass.s     t1, ft2
                  mul          s9, a5, s11
                  remu         t2, s1, s9
                  fmv.w.x      ft7, a5
                  srai         a7, s7, 17
                  flt.s        t2, ft4, fs1
                  div          s3, a1, a0
                  slli         s10, s5, 18
                  slt          a0, a4, s9
                  fadd.s       ft1, ft10, fs7, rtz
                  srli         s10, ra, 21
                  mulhsu       t4, a7, s11
                  mulhu        s7, ra, s0
                  fmv.w.x      fa7, t0
                  mulhu        t4, sp, a1
                  xori         s4, t0, 1257
                  fmin.s       fs10, ft7, fs3
                  mulhu        s6, t2, s6
                  flt.s        t4, ft2, ft11
                  sub          t2, a4, gp
                  divu         a7, s3, s6
                  add          a3, s7, gp
                  fmul.s       ft7, ft8, ft11
                  fcvt.wu.s    s8, fs2, rmm
                  andi         a3, t4, -964
                  mulh         t0, gp, s1
                  or           t4, s0, t5
                  sra          a6, tp, t0
                  fmul.s       fa7, fa0, ft8, rup
                  div          s8, s1, s2
                  fle.s        t1, fs10, fs10
                  addi         a5, t4, -1961
                  srai         s9, a2, 26
                  fmv.w.x      fs6, a0
                  sra          s11, gp, a0
                  mul          s2, a0, t1
                  flt.s        t5, ft4, ft6
                  and          s8, s8, s8
                  fsgnjn.s     ft3, fs5, fa6
                  slt          a7, s1, t6
                  lui          s9, 908168
                  fmul.s       fs1, ft0, fa7, rup
                  fmin.s       ft11, ft6, fa2
                  div          a3, s0, a6
                  and          s6, s11, t2
                  lui          t2, 161337
                  mulhsu       a5, s4, a3
                  rem          s3, sp, t0
                  ori          a0, s8, 234
                  feq.s        s10, fs8, fs3
                  srli         s3, t5, 5
                  div          s0, gp, s0
                  nop
                  srli         s7, s9, 24
                  fmul.s       ft4, fs10, fa2
                  srai         s9, gp, 24
                  fclass.s     t1, fa3
                  fclass.s     a7, fs8
                  fle.s        s5, ft8, fa7
                  mulhsu       s8, a7, t1
                  srai         a3, zero, 9
                  fmax.s       ft5, fs9, ft11
                  andi         s6, s10, -1542
                  sll          t6, s11, zero
                  srai         s8, a6, 19
                  fle.s        tp, ft10, ft5
                  fmv.w.x      ft8, s10
                  fdiv.s       fa1, fa7, ft6, rdn
                  div          a6, a6, a1
                  ori          a5, a6, 1970
                  fadd.s       fs2, fa3, ft6
                  sra          s11, s8, gp
                  fcvt.w.s     zero, fs9
                  slti         s4, s6, 506
                  add          t0, a4, t0
                  srli         s7, t4, 22
                  srai         gp, gp, 17
                  fsgnj.s      ft11, ft0, fs6
                  divu         gp, t3, s1
                  xori         t5, t0, -1110
                  fcvt.s.w     fa5, a6
                  sltu         a0, a4, a1
                  fsqrt.s      ft2, ft1
                  srai         s0, a5, 20
                  andi         a2, ra, 664
                  add          s7, s9, s0
                  div          t0, s11, s9
                  fsgnjn.s     ft2, fa0, ft9
                  sltu         a0, tp, s4
                  nop
                  ori          s10, a4, -1707
                  add          t1, a4, t4
                  mulhu        gp, s7, a0
                  nop
                  sltu         s2, gp, s8
                  fsgnjx.s     fa2, fs0, fs7
                  fmv.x.w      a5, ft11
                  mulhu        s4, s11, s11
                  div          a0, a7, s6
                  xor          s4, s6, gp
                  slti         s6, a7, -1792
                  fsgnj.s      fa7, fs8, ft9
                  sll          s3, sp, a0
                  ori          tp, s3, 1231
                  xori         s10, a3, 519
                  add          t0, a7, s0
                  rem          t6, a3, s3
                  mulh         a2, t1, tp
                  mulhu        s6, tp, s6
                  mulh         t4, a7, t3
                  addi         s8, a2, -729
                  divu         t0, t5, s9
                  sra          a0, a0, s3
                  fclass.s     s6, ft0
                  ori          t0, a1, 605
                  sltiu        a0, s0, -1430
                  fdiv.s       fs6, fa2, fs11, rdn
                  srai         t6, a7, 0
                  sub          a0, a2, zero
                  fmin.s       fa0, fs2, fa5
                  div          a0, t6, t6
                  srli         s10, t3, 30
                  srl          a0, s11, s1
                  fsgnj.s      fs10, ft3, fs6
                  srai         t4, t0, 19
                  flt.s        tp, fa2, fa7
                  xori         s6, s6, 1
                  fmin.s       fs8, fa2, ft8
                  fcvt.s.w     ft11, gp
                  sltu         tp, a7, t4
                  fcvt.wu.s    s3, ft2, rup
                  div          a5, a0, s2
                  sub          s4, t0, s8
                  xor          s10, s2, zero
                  addi         zero, s3, -1220
                  fcvt.w.s     s9, fs5, rup
                  slti         t5, ra, 1436
                  mulh         s0, a6, s9
                  addi         s9, gp, 1848
                  fle.s        zero, fs11, fs2
                  addi         s5, s1, 287
                  ori          a0, sp, -1454
                  divu         t1, t4, tp
                  fmin.s       ft9, fs6, ft1
                  div          s4, ra, s6
                  xori         t1, zero, -1336
                  fdiv.s       ft6, fs6, ft10, rup
                  fcvt.s.wu    ft4, t5
                  fdiv.s       fs11, ft2, fs3
                  fle.s        s6, ft5, fs9
                  remu         s5, a2, a0
                  fcvt.wu.s    s6, ft2
                  andi         ra, sp, 49
                  srai         s4, s5, 27
                  div          a7, a0, a4
                  sra          tp, s2, s9
                  fdiv.s       fs11, fs11, fa5
                  fsgnjn.s     fs1, fa6, fa7
                  srl          a7, t2, a2
                  mulhsu       s4, s11, a2
                  auipc        a7, 87608
                  slt          a2, a1, s3
                  divu         ra, s4, t2
                  sll          s3, s8, t2
                  fdiv.s       fa0, ft7, fs4
                  or           s5, s5, s5
                  fmv.x.w      t2, ft0
                  divu         tp, t6, s2
                  sltu         s1, t4, s3
                  fcvt.w.s     s1, fs4, rne
                  mulhu        t0, s5, a5
                  fcvt.s.wu    fs5, t5
                  mul          t6, t3, s4
                  add          s2, s3, s5
                  divu         zero, gp, s6
                  addi         zero, s7, -1605
                  fsgnjx.s     fa4, ft5, ft2
                  lui          s1, 94045
                  srli         s1, t1, 25
                  fmul.s       fs2, ft2, ft1, rdn
                  add          t2, a1, t3
                  add          t2, a3, a5
                  sub          s4, s3, s9
                  fadd.s       ft0, ft1, fa7
                  mulhsu       a7, t1, s2
                  sll          a4, s10, t4
                  slti         s3, a5, 627
                  fcvt.s.w     fs11, a1
                  fcvt.s.wu    fs4, s4
                  fcvt.s.w     fs1, s11
                  fcvt.s.w     fs9, s11, rdn
                  xor          a0, sp, s2
                  lui          s11, 238025
                  sltu         s4, sp, s11
                  fsgnjn.s     fs8, ft4, ft1
                  addi         s11, s10, -1325
                  divu         s3, s7, s2
                  fcvt.wu.s    s6, fs7
                  fmin.s       fs6, ft1, ft6
                  sra          s9, t5, s10
                  fmv.x.w      t1, ft10
                  xor          ra, s4, t5
                  andi         a7, s5, 1707
                  or           ra, a4, s3
                  fsgnjn.s     ft8, ft8, fa1
                  fmul.s       fs11, fs2, ft4
                  sra          zero, a0, s10
                  fsgnj.s      ft5, ft9, fs10
                  div          a5, s0, s4
                  srli         t0, s9, 15
                  sltu         a6, s7, s11
                  fcvt.w.s     a4, fa0, rup
                  fcvt.wu.s    a5, fa0, rdn
                  mulhsu       t6, t1, a7
                  divu         tp, t6, s9
                  and          t4, a1, t5
                  auipc        t2, 930836
                  fdiv.s       fa4, ft4, fa0
                  fdiv.s       fa5, ft5, fs1, rdn
                  fmul.s       fs11, fs6, fs0
                  slti         s5, a5, 1719
                  lui          s4, 585337
                  mulh         s11, s5, s3
                  mulhsu       a3, t2, t6
                  sll          a3, tp, ra
                  slli         ra, s4, 5
                  slti         a2, t6, 4
                  fdiv.s       fs2, fs4, fs5
                  slt          t5, s1, s6
                  slti         s10, t6, 868
                  feq.s        s0, fs1, fs6
                  fmin.s       fa1, fs4, fs9
                  sll          gp, s3, a5
                  div          t1, s4, a2
                  fsgnj.s      fs1, fs9, fs4
                  fsqrt.s      ft9, fs7
                  mulhu        s4, s2, a5
                  fcvt.wu.s    a5, ft10, rtz
                  remu         s8, t6, zero
                  fle.s        t5, fs9, fs8
                  rem          t6, a7, t5
                  slti         a2, s7, -832
                  fcvt.wu.s    zero, fs6, rup
                  fsgnj.s      fs8, ft5, fa0
                  fsub.s       fs10, fa2, ft8, rne
                  slli         s10, sp, 6
                  sll          s11, a3, t5
                  addi         gp, t5, 2017
                  fadd.s       fs10, fa1, fa1, rmm
                  fsgnj.s      fa0, ft10, ft6
                  ori          t4, s11, 732
                  or           s1, s9, s1
                  slt          s7, t2, t2
                  sll          tp, s11, t1
                  xor          s2, t5, a4
                  fcvt.wu.s    t2, fs1
                  div          t1, sp, a2
                  rem          a0, s9, gp
                  fsub.s       fs2, fs3, fs1
                  mul          s2, s1, a1
                  add          s11, t5, tp
                  fle.s        s7, fs7, ft9
                  sltiu        t0, t1, 1948
                  lui          t5, 806281
                  mulhu        s2, t6, s8
                  sub          s7, t6, s4
                  fcvt.wu.s    t6, ft8, rdn
                  mulh         s0, t1, s7
                  srai         s2, a7, 27
                  srli         a0, tp, 0
                  rem          zero, a0, t4
                  fmin.s       fs9, ft3, ft2
                  fsqrt.s      fa0, fs4
                  and          zero, s9, t4
                  ori          a0, a6, 739
                  mul          t6, s0, a1
                  srli         t0, tp, 21
                  fsub.s       ft3, ft0, fa0
                  fsgnjx.s     fa4, fs5, fs5
                  fcvt.s.w     fs7, a7, rtz
                  auipc        ra, 640662
                  mul          s11, t3, ra
                  andi         s2, ra, 460
                  auipc        t0, 350709
                  nop
                  fadd.s       ft10, fs4, fs5
                  sll          s0, s3, a3
                  ori          a2, ra, 1842
                  fclass.s     s8, fa2
                  add          a4, s6, s10
                  divu         t6, s11, a6
                  srl          t6, t1, ra
                  and          a2, zero, t5
                  sltiu        t2, a7, 1151
                  mulh         tp, s1, s6
                  lui          a3, 715129
                  mul          t1, gp, a1
                  xor          t5, t2, s4
                  sll          s10, s5, s7
                  slti         a4, s11, -1972
                  fsqrt.s      fa7, ft7, rup
                  fdiv.s       ft4, fa0, ft4, rup
                  and          t4, s4, s7
                  or           a2, a2, a0
                  rem          t4, s2, s0
                  mulhu        s5, s8, t4
                  divu         s2, s11, t4
                  fcvt.wu.s    s10, fa1
                  sltu         a4, s9, t0
                  fsqrt.s      ft11, ft6
                  sra          s0, a1, s6
                  divu         tp, a4, a3
                  fmul.s       fa5, fs9, fs6, rmm
                  andi         s6, ra, -1220
                  sltu         s7, s4, s2
                  mulhu        t1, t2, t4
                  xor          s11, t2, zero
                  add          ra, a6, s4
                  slli         t4, s5, 3
                  slt          zero, s9, s0
                  slti         t4, t2, 1933
                  slli         s9, t1, 24
                  remu         tp, s11, s10
                  mulhsu       t4, s2, s1
                  fcvt.wu.s    s11, fa3
                  sltu         t5, ra, a5
                  flt.s        t1, fa1, fa6
                  sub          t2, sp, s8
                  sltiu        s5, s6, -167
                  sll          t0, s1, s4
                  fmin.s       fa3, fa1, fs11
                  fcvt.s.wu    fs3, a0, rne
                  fsgnjn.s     fs10, fs11, ft4
                  sra          t6, a4, t2
                  fsgnjx.s     ft4, fs5, fs5
                  fmv.w.x      fs5, a0
                  nop
                  flt.s        a3, fa1, ft11
                  xori         a6, ra, 484
                  addi         t6, a4, -874
                  fcvt.wu.s    s4, ft4
                  remu         a7, t0, s0
                  srl          gp, s4, t2
                  xori         a2, a7, 1886
                  xori         s0, sp, -137
                  sltu         a3, tp, t4
                  fcvt.w.s     s3, ft1
                  fsgnjx.s     fs0, fs7, ft9
                  fcvt.w.s     s3, fs8, rdn
                  div          t4, s11, s1
                  sltu         a6, a4, s4
                  andi         s10, t2, 450
                  srai         s0, a6, 16
                  fmv.x.w      a2, ft8
                  sltu         s6, s4, t3
                  slti         a3, s4, -670
                  add          tp, a1, s1
                  srai         ra, s9, 21
                  fsqrt.s      fs1, ft4, rtz
                  fmv.w.x      ft2, s5
                  fsub.s       ft5, fs3, fs2, rtz
                  slti         a0, tp, 165
                  add          t5, s8, s5
                  fmin.s       fa7, fs5, fs8
                  mulhu        s7, a0, a5
                  fmax.s       fs3, fs2, fs2
                  mul          t4, t1, t4
                  fsgnjx.s     fs0, ft5, fa4
                  slli         s4, t2, 17
                  fle.s        ra, fa1, fa5
                  fclass.s     s3, fs1
                  fcvt.wu.s    tp, fs5
                  xori         a0, a0, 223
                  fmv.w.x      fs8, s5
                  fcvt.s.wu    ft10, s0, rmm
                  srl          s9, s9, s1
                  xori         s7, t1, 1659
                  or           s6, s11, gp
                  fsgnjn.s     fa2, fa2, fs4
                  fadd.s       fs9, ft8, fs9, rtz
                  fcvt.s.w     fs5, ra, rmm
                  divu         s6, s2, s10
                  remu         s9, s5, ra
                  sub          a4, s10, s1
                  sltu         s9, s9, a2
                  fmin.s       ft8, ft9, fs1
                  srli         a5, a5, 21
                  feq.s        s10, fs10, fs6
                  slt          s11, ra, a6
                  divu         zero, s2, a2
                  fsqrt.s      fs6, ft2
                  fdiv.s       ft7, fs0, ft9, rtz
                  fmin.s       ft0, ft6, ft10
                  or           t4, a0, s10
                  fmin.s       fs7, ft10, fa1
                  srli         s4, s10, 23
                  fsgnjx.s     fs10, fs8, fs11
                  fcvt.wu.s    s2, fs0, rmm
                  divu         a5, s1, s1
                  addi         t5, t5, -33
                  fcvt.s.w     fa6, t4, rtz
                  fclass.s     t4, ft6
                  fclass.s     a0, fs9
                  sub          s5, a2, s5
                  add          s11, ra, a7
                  sra          a7, s4, zero
                  fmul.s       ft6, fs2, fs2
                  and          s3, s6, tp
                  sltu         a6, sp, t6
                  slli         zero, s10, 18
                  add          a6, s2, ra
                  fsgnjx.s     ft2, fs10, ft10
                  or           t4, t0, t6
                  mulhu        t5, s10, a5
                  or           gp, t4, t3
                  sltu         zero, tp, a1
                  srli         s0, s0, 19
                  fdiv.s       fs10, fs2, fa6
                  lui          t2, 306482
                  remu         t4, a5, a0
                  fmv.x.w      s7, ft3
                  fle.s        t5, ft7, ft8
                  add          s5, s3, t6
                  fclass.s     t1, fa6
                  srli         ra, s5, 6
                  sltiu        s3, t4, 889
                  add          a3, tp, t0
                  fmax.s       ft10, fs3, fa1
                  fsub.s       ft10, fa5, fa6, rne
                  fle.s        t1, ft4, fs0
                  or           t1, s10, zero
                  slti         gp, t4, -1897
                  sltu         t6, zero, a0
                  addi         t5, s2, 983
                  rem          t5, s7, s11
                  sltu         t2, a0, a5
                  addi         tp, s3, 257
                  fsqrt.s      fa7, ft4, rmm
                  remu         s0, t5, s3
                  fmv.x.w      s7, ft11
                  remu         s3, sp, a5
                  xori         a0, s4, 1259
                  srai         a6, s6, 27
                  andi         t0, tp, -8
                  fsgnj.s      ft6, fs0, fs3
                  slti         a2, a2, 1496
                  lui          s6, 792215
                  fsgnjx.s     fs1, ft0, fa1
                  fclass.s     s7, ft5
                  fclass.s     a6, fs7
                  fcvt.w.s     s2, fs10, rmm
                  fsub.s       fs6, ft5, fs1, rne
                  lui          a5, 594484
                  sub          s2, a5, s7
                  addi         s5, a7, 622
                  srli         a5, t0, 6
                  fclass.s     a4, fs2
                  fsub.s       fs1, fs11, fs2, rtz
                  fsub.s       fa4, fs8, fs3
                  fcvt.s.w     ft0, t3
                  feq.s        t2, fs1, fa3
                  sltiu        s7, gp, -1362
                  sltiu        a7, s3, 819
                  fmv.x.w      a0, fa1
                  fmv.x.w      a6, fa6
                  auipc        a4, 484985
                  mul          t6, ra, t0
                  sub          s6, a4, tp
                  fmv.w.x      ft1, s3
                  lui          a3, 612096
                  mul          s0, a1, s9
                  fle.s        s5, ft7, ft7
                  fmin.s       fs9, ft11, ft7
                  sra          a6, a5, s1
                  fcvt.s.w     fs6, s2, rup
                  or           s3, s9, a3
                  fcvt.s.w     fs0, t5, rmm
                  ori          tp, t1, -1950
                  sltu         gp, s1, t0
                  fcvt.w.s     a6, fa5
                  slti         tp, s2, 971
                  srli         s11, s6, 26
                  fcvt.w.s     s0, fa2
                  fsgnj.s      fs9, fa7, ft11
                  fclass.s     t2, fs0
                  fmv.w.x      ft5, a6
                  fsgnj.s      fs3, fs2, ft6
                  fmin.s       fs2, fs10, ft1
                  srli         t6, s1, 23
                  fcvt.wu.s    s8, fa0, rne
                  fcvt.wu.s    a2, ft4, rne
                  fclass.s     t4, fs2
                  lui          t5, 753896
                  fcvt.s.wu    ft11, s4, rup
                  fsqrt.s      fs0, fa3
                  fcvt.w.s     a2, fs9
                  fdiv.s       fs7, ft7, fa4, rmm
                  fcvt.w.s     s0, fa5, rtz
                  sra          tp, a3, s2
                  fsgnjn.s     ft9, fs3, ft9
                  rem          s3, s1, s8
                  fdiv.s       fs7, ft7, fa1
                  slt          a5, t3, s3
                  divu         a7, s0, ra
                  feq.s        t2, ft8, fs0
                  fmin.s       fa5, fs0, fs5
                  xori         s3, s2, 485
                  fcvt.s.wu    ft7, s10, rdn
                  mulhu        a7, a4, t4
                  fsgnj.s      fs4, ft6, fa5
                  fmv.x.w      a6, fa0
                  flt.s        zero, ft5, fs4
                  fadd.s       ft8, fs4, fa0
                  fcvt.wu.s    a3, ft2
                  mulhu        t6, s7, a6
                  divu         tp, s6, s3
                  mulhu        a4, tp, a1
                  sra          s7, t6, t5
                  sra          a6, tp, s6
                  fcvt.wu.s    s2, fs0, rup
                  rem          a3, a0, a4
                  ori          t6, a1, 447
                  sub          s7, s10, zero
                  auipc        t2, 879669
                  mulhsu       t4, t2, a2
                  fmul.s       fs0, fa2, fs11
                  and          s5, s0, tp
                  sltu         t1, gp, s3
                  auipc        t0, 303512
                  srl          a5, a6, t5
                  fcvt.wu.s    s5, ft1, rtz
                  rem          t2, s9, s2
                  srl          s1, a0, t2
                  xor          s8, ra, s2
                  ori          t4, a6, -1552
                  lui          s2, 579149
                  fsqrt.s      ft7, ft2, rmm
                  fsgnjx.s     fs9, ft5, ft10
                  auipc        t6, 733948
                  fsgnjn.s     fs9, fs3, fa2
                  flt.s        gp, ft10, ft11
                  mul          s8, a5, zero
                  fcvt.w.s     s0, fa7, rtz
                  rem          a7, s8, s1
                  ori          t2, s11, 1747
                  remu         zero, s7, s11
                  sub          s5, a1, t1
                  or           t2, t4, sp
                  fsqrt.s      ft4, fs9, rne
                  fcvt.w.s     s4, fs4, rne
                  slli         a7, a1, 5
                  slt          t0, ra, t2
                  fmin.s       ft0, fs9, fa2
                  mulhsu       a7, s9, gp
                  nop
                  fsub.s       fa4, fs0, ft6
                  fmax.s       ft9, fs1, fs10
                  fsqrt.s      fs4, ft3
                  slt          s2, a2, s11
                  sll          s5, a7, t0
                  fsgnjx.s     fs8, fs2, fa1
                  feq.s        s6, ft3, fs5
                  addi         ra, s0, -1903
                  sltu         t1, zero, gp
                  fcvt.w.s     a7, ft4, rdn
                  rem          s4, s10, t0
                  div          s3, a7, s7
                  fclass.s     s4, fs3
                  srli         s9, tp, 9
                  flt.s        t6, fs3, fs5
                  add          t4, a1, s11
                  sltu         t6, a0, t1
                  nop
                  fmax.s       fs10, fa3, ft3
                  slti         a5, a7, 1997
                  sub          gp, t4, s10
                  fle.s        s2, ft3, ft8
                  andi         s7, s10, -1933
                  fmul.s       ft6, fs9, fs1
                  mulhsu       s7, s0, s2
                  sltu         a3, a2, t3
                  fsub.s       fs5, fa5, fs8
                  fcvt.wu.s    s11, fs9
                  fcvt.wu.s    t1, fs11
                  xor          s7, t5, tp
                  fsgnjx.s     fa2, ft9, ft5
                  mul          s5, sp, s3
                  srli         ra, s6, 9
                  fadd.s       fs5, fs3, fs6
                  sra          t6, ra, s4
                  srl          t0, ra, t1
                  addi         s0, s3, 1648
                  sll          a2, a7, s6
                  fmax.s       ft10, ft3, fs9
                  remu         s9, a2, t6
                  fmul.s       ft7, fs2, ft10, rup
                  fcvt.s.wu    fs0, t3
                  flt.s        s8, fa3, fa4
                  fdiv.s       fs5, fs2, ft3, rne
                  fcvt.s.w     fa4, t6
                  auipc        s5, 192881
                  fmax.s       fs11, fs10, fs4
                  fcvt.w.s     a5, fs2
                  fdiv.s       fs1, ft6, fs4, rup
                  auipc        s7, 837466
                  fsqrt.s      fa6, fa5, rdn
                  and          a2, ra, t6
                  auipc        s5, 792466
                  slti         a6, s0, 381
                  fmv.w.x      fs9, s4
                  mulh         t0, s4, s1
                  lui          s11, 947305
                  slli         a7, t1, 27
                  srl          t5, t0, s5
                  xor          s6, t2, t3
                  div          s11, ra, t1
                  mulhu        s5, sp, tp
                  mulh         s8, a6, ra
                  mul          s1, t6, s8
                  mul          a4, s8, gp
                  slti         t4, gp, 586
                  sltu         ra, a6, t4
                  fmul.s       ft0, ft6, fa0
                  sll          t5, tp, t6
                  fmin.s       fs8, ft7, fa0
                  mul          s4, s4, a1
                  srl          t6, s2, ra
                  fadd.s       ft4, fs1, fs5
                  fcvt.s.wu    fs8, zero, rup
                  slt          s10, s6, t0
                  sltiu        t4, t6, -1031
                  divu         s11, s6, ra
                  fsgnjn.s     fa2, ft2, fa4
                  fmv.w.x      ft2, a3
                  fclass.s     s1, fs10
                  addi         t4, a0, -1188
                  srai         a3, a0, 3
                  fmin.s       ft2, ft0, fa5
                  srli         s1, s10, 25
                  remu         t4, s5, sp
                  fcvt.w.s     s9, fs0, rtz
                  andi         s1, s4, 326
                  addi         a4, a4, 950
                  add          s1, s3, s10
                  srli         s8, s10, 18
                  ori          a7, s3, 255
                  fle.s        t1, fa2, ft10
                  fcvt.s.wu    fa4, a0, rne
                  flt.s        a6, fs1, fs11
                  sub          t5, a4, s8
                  xori         s1, s0, -381
                  fmul.s       fs11, ft2, ft5
                  fmv.x.w      s9, fa4
                  ori          s2, s4, 1923
                  srl          a5, s4, s5
                  fsgnjx.s     fa6, ft7, ft7
                  divu         t5, a1, t4
                  sub          s8, t6, s11
                  auipc        s5, 172174
                  ori          a6, s11, 551
                  auipc        ra, 543760
                  sra          s1, s6, ra
                  fmv.x.w      s8, ft2
                  srli         t1, s9, 25
                  fmin.s       fa5, fs8, fa2
                  feq.s        s10, fa2, fs1
                  sltu         a7, gp, s4
                  sltu         t6, a5, t4
                  fmin.s       fs10, ft1, ft11
                  fsgnj.s      fs4, fs7, ft5
                  or           a7, s4, sp
                  flt.s        zero, ft8, ft2
                  ori          a2, s5, 754
                  sltiu        t0, s10, -697
                  fmv.x.w      s8, ft2
                  sra          s11, zero, gp
                  andi         tp, ra, -1094
                  fadd.s       fa7, fs3, fa4, rne
                  add          s8, s1, s8
                  auipc        s8, 241027
                  mul          a3, s2, tp
                  fmv.x.w      a4, ft9
                  sltu         s11, s3, a5
                  andi         s9, t6, 514
                  mul          s3, s4, t6
                  fsqrt.s      fa6, fs0, rdn
                  mulhu        s11, s4, s7
                  sub          s6, a3, a3
                  mul          gp, s8, s6
                  nop
                  srli         ra, t5, 19
                  andi         t0, t2, -1919
                  sra          t2, s1, a1
                  add          a6, t5, a6
                  sub          a5, a3, a6
                  sub          s2, s3, s9
                  sra          a2, s10, a2
                  ori          a6, t3, 1686
                  fsub.s       fa4, ft7, ft0
                  fcvt.s.w     fs2, ra
                  fcvt.s.w     ft5, a1, rup
                  fmax.s       fs0, fs1, ft8
                  feq.s        s2, fa1, ft8
                  srai         a0, s1, 28
                  srl          t2, zero, a4
                  mulh         t0, s6, tp
                  fadd.s       fa2, fs10, fa4
                  fsqrt.s      fa0, ft10
                  divu         a3, a6, s5
                  slti         s10, t6, -1096
                  fmv.w.x      fa6, s10
                  fmax.s       fs3, fs5, ft1
                  rem          ra, a5, a1
                  fsqrt.s      fs7, ft9, rmm
                  fmv.x.w      t4, ft11
                  lui          t4, 924267
                  srl          s8, s10, s5
                  fmv.x.w      s3, fa6
                  fcvt.s.wu    ft9, a6, rmm
                  nop
                  or           tp, a4, gp
                  fmv.x.w      ra, fs2
                  sll          a6, s1, t5
                  fmin.s       ft11, fs8, fa5
                  xor          zero, t2, zero
                  fmul.s       fs6, fs8, fa1
                  xori         a2, s0, 432
                  and          s10, zero, ra
                  fmv.w.x      fs11, t1
                  add          t4, a4, t0
                  fdiv.s       fs6, fs4, ft7, rtz
                  fmv.w.x      fs11, a2
                  fsgnjn.s     fa7, ft9, fa0
                  fsgnj.s      ft1, fs11, fa2
                  srl          a2, a7, gp
                  fsqrt.s      fs11, ft3
                  fmax.s       fa3, fa7, fa1
                  srai         s5, s2, 13
                  and          s5, tp, s9
                  mulhsu       s3, s9, t1
                  remu         gp, t5, s3
                  srli         s9, a7, 8
                  sra          a2, a6, a6
                  mulh         s3, s1, gp
                  add          s3, s10, s3
                  fmin.s       fs5, fs1, fs10
                  fmv.w.x      fa4, gp
                  fle.s        s3, fa1, fa1
                  srai         s1, a4, 18
                  xori         a0, a7, -122
                  fsqrt.s      fs6, fa0, rup
                  and          t6, a2, a2
                  sltu         s8, a2, t4
                  fsgnjx.s     fs2, ft3, fs3
                  fclass.s     t2, fs9
                  fclass.s     s11, fa4
                  divu         t2, s5, s9
                  fsub.s       fs7, fs1, ft7
                  ori          s4, t4, -1131
                  add          t4, sp, t3
                  fmv.x.w      a2, fs10
                  and          a4, ra, ra
                  nop
                  fcvt.w.s     s3, ft9
                  fdiv.s       fs10, fs5, fs5, rtz
                  fcvt.w.s     tp, fs0
                  fsqrt.s      ft9, fs2, rmm
                  srai         a2, s11, 27
                  and          zero, s8, s10
                  sltiu        a3, t0, 1294
                  and          gp, a4, ra
                  fsqrt.s      ft2, fs2
                  remu         s6, t0, t4
                  fsgnjx.s     fa4, ft8, ft1
                  andi         s10, s5, 78
                  mulhu        s2, a0, a5
                  fadd.s       fs11, fs0, ft1
                  fcvt.s.w     fa0, a4, rne
                  fsub.s       fa4, fa3, fa7, rdn
                  fsqrt.s      fs1, ft11, rdn
                  nop
                  sra          s0, t5, s5
                  addi         t0, t1, -678
                  auipc        t4, 938848
                  fmul.s       fa3, ft9, ft0, rup
                  fmv.x.w      s4, ft6
                  fsgnj.s      fs3, ft5, ft2
                  slt          s3, s11, a3
                  divu         t0, a1, a6
                  addi         t0, s4, 192
                  and          s9, s3, t1
                  xori         gp, a7, 623
                  fcvt.s.w     fs10, s8, rdn
                  fcvt.w.s     a6, ft0, rdn
                  slt          s1, t0, a2
                  fmv.w.x      ft9, a1
                  remu         a0, sp, t4
                  and          tp, s9, ra
                  srai         s7, s0, 11
                  andi         s9, zero, 1682
                  feq.s        a4, fa6, fa7
                  fmv.x.w      s2, fs7
                  divu         gp, s1, a3
                  fsqrt.s      fa2, fs0
                  fclass.s     s3, fs4
                  fsgnjn.s     fa5, fs1, fa2
                  auipc        t4, 83616
                  fsgnj.s      fs11, fs0, ft2
                  and          s6, gp, s9
                  andi         a2, a7, 897
                  nop
                  fmv.x.w      ra, fa3
                  remu         t6, a1, t1
                  add          s4, a0, t3
                  div          s5, t6, t0
                  fcvt.wu.s    a0, fs8
                  add          t1, ra, s7
                  fsgnjn.s     fs4, fa0, fa2
                  mulh         a7, a0, tp
                  sltu         t4, t5, s0
                  and          s4, s3, sp
                  lui          a5, 96922
                  slli         a7, zero, 18
                  fmv.w.x      ft11, s3
                  divu         t2, a1, t2
                  remu         t4, s0, a0
                  fmv.w.x      fs6, t3
                  sltiu        s6, t5, -1418
                  fmin.s       ft3, fs3, ft9
                  and          zero, a6, a0
                  fmv.x.w      s7, ft2
                  slti         a6, t3, 1810
                  ori          s3, s3, 1393
                  fcvt.s.w     fs8, s9
                  sltiu        t6, s8, -2012
                  fmv.x.w      s11, fa6
                  or           zero, s5, s7
                  fle.s        t0, fa7, ft3
                  fclass.s     t4, fs3
                  div          s1, s8, a1
                  fmv.x.w      ra, ft8
                  sltiu        a3, gp, -637
                  xor          a4, ra, t4
                  div          s10, a6, sp
                  or           a6, a1, t6
                  srli         ra, tp, 3
                  flt.s        a6, fs10, ft8
                  auipc        tp, 831172
                  fcvt.wu.s    s3, fa2
                  fcvt.s.wu    ft5, t2, rmm
                  ori          t1, gp, -1429
                  divu         s2, s3, a7
                  auipc        s11, 55428
                  addi         a7, s7, 888
                  slli         s3, a1, 26
                  fsgnj.s      ft2, fa2, ft3
                  slli         t5, s8, 27
                  fcvt.s.wu    fa6, s8, rtz
                  sltu         a6, s0, a4
                  slt          s9, s3, a4
                  mul          s6, a1, s10
                  fsgnjx.s     ft6, ft11, fa5
                  sll          a3, s6, gp
                  fmv.x.w      a7, ft6
                  fsqrt.s      fs11, fs10
                  feq.s        s11, fa0, ft2
                  fsgnjx.s     ft3, fa1, fs5
                  xori         a4, s10, -758
                  slt          a7, s1, t0
                  slli         s8, s9, 31
                  fdiv.s       ft0, fa7, ft7, rup
                  fcvt.s.wu    ft10, t0
                  or           t4, s9, a1
                  addi         a5, t1, -527
                  xor          a6, s5, ra
                  fadd.s       fa5, fs1, fs11
                  fmax.s       fa3, ft4, fa7
                  sll          s9, s9, gp
                  flt.s        s11, ft10, fa5
                  or           s4, a6, t2
                  feq.s        t0, fs0, ft5
                  mulh         a7, s2, ra
                  fcvt.w.s     a0, fs9, rne
                  add          t4, t5, sp
                  fsqrt.s      fs8, ft2, rdn
                  fsgnjx.s     fa2, ft3, ft8
                  xor          s6, s9, a4
                  xori         s1, t6, -801
                  sltiu        s4, t2, 1752
                  fmax.s       ft2, ft6, fa3
                  feq.s        s5, ft7, fs9
                  add          s6, a0, t1
                  srai         ra, t1, 3
                  mul          t2, a5, a5
                  xori         s6, a5, 875
                  fle.s        s11, fs8, fa7
                  mulhu        s7, s1, a5
                  andi         s3, sp, -1432
                  fmax.s       fa5, ft9, ft5
                  fcvt.s.wu    ft3, a7, rtz
                  auipc        s10, 166313
                  fmv.x.w      s1, fs2
                  fmul.s       ft3, ft10, ft3
                  srai         a0, s8, 24
                  fle.s        t6, fs3, ft11
                  fclass.s     t5, fa2
                  srli         s1, a1, 31
                  flt.s        t6, ft2, fa7
                  fsgnjx.s     fa7, fs1, fs6
                  andi         s7, gp, -1385
                  sltu         s9, ra, s8
                  fle.s        s8, ft11, ft4
                  feq.s        t4, fa5, fs4
                  feq.s        tp, fs9, fa2
                  or           t2, t3, s6
                  feq.s        s3, fs0, ft9
                  sra          s6, t2, ra
                  or           t0, a7, a6
                  fclass.s     s10, ft0
                  srl          t5, s3, s6
                  fsqrt.s      ft0, fa5, rup
                  fsqrt.s      fs10, fa2, rmm
                  fcvt.s.wu    ft8, s9
                  sub          a2, a0, sp
                  fsub.s       fs7, ft11, fa1
                  xori         s3, s2, -443
                  sub          a4, t3, s11
                  fcvt.wu.s    t6, ft3
                  slti         a7, s3, 1771
                  xori         s4, t5, 1512
                  fsgnjn.s     ft11, fs10, fs9
                  or           s3, t2, t4
                  nop
                  sub          s10, s10, a3
                  fclass.s     a3, fs8
                  fcvt.wu.s    t5, fs10, rne
                  slti         t4, ra, -1377
                  fmv.x.w      a3, ft2
                  fdiv.s       fs1, ft3, fa7, rup
                  slt          t4, t5, tp
                  fsqrt.s      ft5, ft11, rdn
                  fmul.s       ft9, ft0, fa0
                  fdiv.s       ft10, fs8, fs1, rmm
                  sltiu        a6, s0, -190
                  fsgnj.s      fa7, fs4, ft7
                  auipc        a5, 347317
                  ori          s1, t4, -1491
                  fcvt.wu.s    a3, fs2, rtz
                  srai         a3, t6, 4
                  fsqrt.s      fs8, ft7
                  slti         s5, t1, -1360
                  sra          t0, t3, s6
                  nop
                  sltiu        tp, tp, -172
                  fsqrt.s      fa1, ft9, rtz
                  ori          s1, s3, 699
                  fcvt.wu.s    ra, fs3, rdn
                  xori         a6, s10, 1327
                  flt.s        t4, ft1, fs8
                  sltu         a3, a0, t5
                  sltiu        t6, t6, 996
                  slt          a3, s8, s5
                  sll          a3, s9, s11
                  xori         s3, s4, -158
                  srai         s1, a5, 17
                  sll          t2, t4, s8
                  fcvt.s.wu    ft5, t5
                  sltiu        s1, s9, 787
                  fcvt.s.wu    ft4, s10, rtz
                  andi         tp, s11, -1109
                  fmax.s       fa1, fs11, ft5
                  fcvt.w.s     s6, fs8, rne
                  rem          t5, t1, tp
                  fmax.s       fa1, fa6, fs11
                  divu         t4, s4, s2
                  fle.s        zero, ft10, ft1
                  fmul.s       ft7, ft11, fs0
                  fadd.s       ft3, fs5, fa6
                  slti         t5, s2, 880
                  and          s6, s3, a7
                  auipc        ra, 487999
                  srli         s9, s1, 19
                  sub          s8, s10, s11
                  xori         a7, s5, 1652
                  fclass.s     s2, fs8
                  div          ra, a1, t6
                  andi         s7, t5, 850
                  srli         a4, t5, 18
                  mul          t0, a7, s7
                  sltu         t0, s0, gp
                  fmul.s       ft7, fs6, ft5, rmm
                  sltu         s10, zero, a1
                  fmin.s       fs1, fs4, ft8
                  and          a7, t1, tp
                  fcvt.wu.s    s4, fs6, rup
                  andi         s4, t2, 1508
                  sll          a4, a1, ra
                  fmin.s       ft1, ft11, ft0
                  srai         ra, t0, 25
                  srai         s10, a4, 18
                  auipc        s6, 325813
                  fdiv.s       fa6, fs11, fa1
                  fcvt.s.w     ft3, s8, rdn
                  auipc        a0, 1014078
                  rem          t4, s11, s8
                  fsqrt.s      fs8, ft5, rup
                  sub          s0, s5, t3
                  fsqrt.s      fa0, fs11
                  lui          gp, 562310
                  fsgnjx.s     ft10, ft3, fa3
                  nop
                  sll          s7, s8, s1
                  mul          s8, t0, s10
                  lui          a0, 1016468
                  sub          a2, a0, tp
                  sra          a0, s7, a2
                  add          t0, s7, a3
                  fcvt.s.w     fa0, a4
                  sll          s7, s1, a6
                  fcvt.w.s     s4, fs9
                  mulhu        t6, a1, t4
                  ori          tp, a0, -932
                  sra          a5, a6, a4
                  fsgnjx.s     ft9, ft7, ft6
                  sltu         t6, a0, t6
                  div          s4, t2, ra
                  sll          zero, zero, s8
                  mul          s1, zero, s3
                  fle.s        s8, ft7, fs6
                  fsqrt.s      fa7, fs8
                  lui          s5, 936151
                  fmin.s       fa4, ft3, fs3
                  fadd.s       fs2, fs11, fs6
                  fdiv.s       ft9, ft2, fa1, rup
                  slli         a6, s10, 29
                  fle.s        gp, ft9, fa3
                  remu         s9, t4, a5
                  fsub.s       ft10, fa1, fa5
                  fmv.w.x      ft10, t1
                  fle.s        t5, ft0, fa7
                  or           s9, a7, a4
                  srli         s9, a5, 16
                  xori         t5, a5, -1807
                  srai         zero, a6, 26
                  auipc        s1, 510085
                  fmv.x.w      a0, fa0
                  slti         s3, s9, 751
                  fle.s        s0, fs2, ft8
                  fmv.w.x      fs10, s11
                  fsub.s       fs3, ft2, fa3
                  fsgnjx.s     fa5, fa5, fa5
                  divu         t5, a0, t6
                  addi         s5, a6, -287
                  xori         s0, s6, 1334
                  nop
                  fle.s        a4, fa0, fs5
                  and          a2, a2, t0
                  sub          a4, a7, sp
                  sltu         s9, t5, gp
                  xor          s6, s10, a2
                  fcvt.s.wu    fa5, a7
                  fsgnjn.s     ft1, ft7, fa3
                  auipc        t0, 123020
                  sra          t4, t6, a3
                  rem          t4, zero, s5
                  sltu         ra, a4, gp
                  flt.s        a7, fa7, ft1
                  mulh         a2, a0, ra
                  and          a3, s8, zero
                  mul          a7, t2, t4
                  sub          s2, a6, s11
                  andi         t4, t4, 691
                  slli         a3, s5, 29
                  remu         s1, a6, a7
                  div          a0, s3, a0
                  fsub.s       fa5, fs0, ft4, rne
                  ori          s2, t2, -1885
                  fclass.s     a6, fs11
                  fclass.s     a7, fa0
                  slti         s5, t3, -710
                  fsgnjn.s     fa3, ft6, ft6
                  fmax.s       fa1, fa5, fs11
                  fmv.x.w      s11, ft10
                  mulhu        a0, t4, s9
                  fmv.x.w      gp, fa5
                  slti         s5, a0, 1255
                  srli         ra, s6, 21
                  fmax.s       ft6, fs3, fa1
                  lui          s4, 15359
                  sra          s4, s0, s0
                  fcvt.w.s     s6, fa3
                  add          a4, a2, s10
                  mul          zero, s9, s1
                  mul          a2, s5, a1
                  fsub.s       ft8, fs9, ft7, rup
                  fsgnjx.s     fs2, fa7, fs4
                  slli         s7, t0, 16
                  fcvt.w.s     a4, fs9
                  srai         s10, s5, 16
                  mulhsu       s6, gp, a3
                  sltiu        s9, s4, 1131
                  fcvt.s.wu    fa4, s6, rup
                  nop
                  remu         s9, a3, s4
                  fmv.w.x      fs5, s4
                  xori         t1, s8, 6
                  auipc        t1, 269913
                  fle.s        s0, fa1, ft2
                  fsgnj.s      ft0, fa0, fa5
                  mul          s10, t1, t2
                  fadd.s       ft7, fs10, fs5
                  fsqrt.s      fs7, fa4, rne
                  feq.s        a5, ft8, fa0
                  andi         t5, t4, -525
                  and          s4, s7, s1
                  srai         a6, s8, 5
                  andi         a6, t6, -1793
                  srai         a3, s7, 3
                  fmv.x.w      s8, ft5
                  srli         tp, s4, 24
                  sra          s10, s1, tp
                  add          s1, zero, s11
                  fsgnjx.s     fs1, fs11, ft11
                  sub          a7, t5, t1
                  fsgnjn.s     ft2, fa4, ft1
                  fsub.s       fs11, ft9, fs10
                  div          s2, s10, s7
                  slli         t0, t2, 22
                  fcvt.s.wu    ft7, a4
                  fle.s        s6, fs8, ft2
                  fclass.s     s11, fs10
                  fsub.s       ft8, ft5, ft6, rne
                  lui          s9, 637856
                  divu         ra, s2, sp
                  auipc        s11, 832399
                  mulhsu       s3, sp, s6
                  nop
                  sltiu        t5, a7, -1608
                  div          a3, s5, s10
                  srl          a2, s6, t0
                  fcvt.s.wu    ft9, s8
                  auipc        s4, 861487
                  ori          s8, s0, 953
                  divu         s2, a1, a4
                  or           a2, a6, a7
                  fcvt.s.wu    fs2, zero
                  ori          s10, a0, 314
                  fle.s        t0, ft3, ft3
                  sltiu        s4, a5, 870
                  slli         s7, tp, 27
                  mulhu        s0, t1, s3
                  slti         a6, s1, -1641
                  remu         s7, a1, ra
                  lui          t1, 551568
                  fmax.s       ft7, fs11, ft9
                  slli         s7, s7, 23
                  fcvt.s.w     ft7, ra, rtz
                  nop
                  slt          s3, s10, s6
                  andi         s11, a4, -1146
                  fsgnj.s      fa0, ft1, fs2
                  auipc        s2, 160914
                  remu         s11, t1, a3
                  fcvt.wu.s    a4, fa5
                  sra          a0, s5, a7
                  slti         s9, a3, 64
                  fcvt.s.w     ft11, t5, rne
                  fadd.s       fs8, ft0, fa3
                  slt          t0, s11, s2
                  mulhsu       s11, a3, a5
                  fmul.s       ft9, fs3, fa1
                  fsgnjn.s     fa3, ft3, fs4
                  sll          t4, t5, s0
                  fcvt.wu.s    s2, ft8
                  nop
                  or           t4, s5, s10
                  sltu         s1, a2, s11
                  sltu         s7, zero, tp
                  feq.s        a7, ft6, fs0
                  srai         s8, t6, 15
                  fmin.s       fs9, ft9, ft1
                  fcvt.s.wu    fs11, s8, rne
                  nop
                  xor          a5, a2, t1
                  sll          t6, t4, a4
                  fcvt.s.wu    fs4, zero
                  fsgnjx.s     fs11, fa6, ft3
                  fmv.x.w      s11, fs8
                  nop
                  mulhu        a5, s4, s3
                  slli         a6, a3, 9
                  slli         t0, s3, 25
                  or           s3, t4, s7
                  fadd.s       ft8, ft10, ft9, rmm
                  add          s6, s3, zero
                  remu         tp, gp, t6
                  slti         s0, s3, -1576
                  srl          a7, t5, a7
                  fcvt.w.s     tp, ft7
                  srl          s7, s5, tp
                  sll          t1, s9, a5
                  fmv.w.x      fs10, tp
                  andi         a6, a3, -489
                  auipc        s10, 293247
                  sll          s4, gp, t4
                  fadd.s       fs7, ft8, fs7, rdn
                  addi         gp, a2, -1658
                  fsgnjx.s     fa7, ft10, fs11
                  slli         a5, a4, 9
                  fsqrt.s      fs3, fs2, rdn
                  fcvt.wu.s    t2, fa0
                  fsgnjx.s     fs0, ft7, fa5
                  divu         tp, tp, t4
                  mulhu        tp, tp, s11
                  xori         t0, t0, 930
                  fcvt.wu.s    t5, fa7
                  sra          a2, sp, s7
                  fcvt.w.s     s5, fs10
                  feq.s        s4, ft4, fs10
                  fsgnj.s      ft1, ft6, fa1
                  fclass.s     a7, fa5
                  fsgnjn.s     fs2, fa3, fa5
                  and          s8, t6, s2
                  sltu         t6, a0, t1
                  divu         a7, a2, s11
                  nop
                  mul          s4, s7, s10
                  ori          a7, a0, -626
                  div          a3, s6, a3
                  fle.s        a7, ft7, fs1
                  srli         gp, t6, 23
                  slli         a3, t2, 27
                  feq.s        t4, ft6, ft5
                  lui          a0, 175247
                  fcvt.wu.s    s1, ft8, rdn
                  fcvt.wu.s    a7, ft10, rne
                  fmv.x.w      t0, fa6
                  srli         s9, s7, 12
                  fdiv.s       fs4, ft11, fa0, rup
                  fle.s        a7, fa1, ft9
                  slli         a4, sp, 10
                  divu         a3, a1, t0
                  rem          s3, tp, t0
                  fcvt.w.s     s1, fs1
                  fmv.w.x      ft1, t2
                  fclass.s     s0, fa2
                  fsgnj.s      fs0, ft2, ft8
                  fmax.s       ft9, fa0, ft5
                  add          a5, s11, t4
                  sra          t5, s11, t4
                  flt.s        gp, ft7, fs6
                  remu         s5, tp, zero
                  fmin.s       ft5, fs11, fs2
                  fcvt.s.w     fa4, a6
                  sltu         s5, s9, t3
                  fsub.s       fs3, fs11, ft1, rmm
                  srl          s2, s2, s1
                  rem          s5, t6, s5
                  fmv.x.w      s9, fa3
                  add          gp, s2, s3
                  auipc        tp, 924174
                  fsgnjx.s     fa2, fs7, fs6
                  fmul.s       fa3, fs7, fs0
                  mulh         s5, gp, t0
                  fmv.w.x      fs9, s7
                  and          s9, a5, s6
                  sra          tp, t3, s6
                  fsqrt.s      fs9, fs10, rne
                  rem          t5, s4, a3
                  feq.s        s8, fs9, ft0
                  divu         s2, a2, s6
                  fsqrt.s      ft5, ft4, rmm
                  and          s7, a2, a7
                  slli         s2, s11, 9
                  fcvt.w.s     a2, ft0, rmm
                  mulhu        a3, a7, a0
                  fmv.w.x      ft7, s7
                  fcvt.s.wu    fs10, s5, rup
                  fsgnjx.s     ft3, fa7, ft11
                  fmv.w.x      ft7, s8
                  srai         a5, s11, 17
                  fle.s        s0, fa5, fa1
                  srli         t5, s10, 15
                  slli         s10, s7, 15
                  xori         zero, s11, 1073
                  srl          s3, s5, s8
                  auipc        t0, 921853
                  sltiu        s6, s2, -2037
                  fcvt.w.s     s11, fs9, rne
                  xor          a6, a2, s8
                  sra          zero, a5, t5
                  fsub.s       fs4, ft5, fa4
                  srl          a2, t2, a0
                  auipc        zero, 885562
                  fcvt.s.wu    fs1, t3, rdn
                  fsgnjn.s     ft11, fs3, fs2
                  fadd.s       fa6, ft10, fa6, rmm
                  slli         t5, t1, 11
                  lui          t6, 197347
                  fsqrt.s      ft0, fs1, rmm
                  mulhu        s11, s2, s2
                  lui          a5, 639582
                  sra          t0, s5, s3
                  slli         s8, s8, 25
                  fclass.s     s2, fa3
                  fcvt.s.w     fa5, s3
                  add          s2, s2, s3
                  flt.s        a0, ft7, ft6
                  fsgnjn.s     fs10, ft9, ft8
                  sltu         s0, sp, a4
                  divu         t4, s4, a0
                  auipc        t6, 495479
                  auipc        a2, 786967
                  auipc        s6, 269210
                  fcvt.wu.s    a2, fa0, rtz
                  nop
                  fmul.s       ft2, fa6, ft4
                  fsub.s       fs4, fa0, ft3
                  mulh         ra, a7, a1
                  srli         a5, gp, 23
                  fcvt.wu.s    a2, ft2
                  flt.s        t5, ft5, fa4
                  fsgnjx.s     ft10, fs7, fs1
                  srli         s6, a4, 17
                  sra          s0, a1, s1
                  fdiv.s       fa0, ft4, fs3, rmm
                  fcvt.s.w     fs1, a7, rtz
                  lui          s6, 201895
                  mulhsu       t5, tp, t6
                  fsub.s       fs2, ft1, ft9, rdn
                  ori          s1, a5, -907
                  srai         s8, t0, 23
                  mulhu        s1, a3, s10
                  fmul.s       fa0, ft11, fa2
                  fmv.w.x      ft11, t4
                  feq.s        tp, ft3, ft0
                  srli         s0, t4, 18
                  slli         gp, a5, 4
                  div          a6, a2, s5
                  divu         t0, s3, t3
                  sub          s0, t0, zero
                  divu         s1, a2, s1
                  mulhu        tp, s0, s10
                  fcvt.s.w     fs2, ra
                  or           s0, t0, gp
                  fsgnj.s      fa0, ft4, ft2
                  add          tp, s3, s1
                  fcvt.wu.s    a4, fs7
                  fdiv.s       ft2, ft2, ft11, rtz
                  fmul.s       fa0, fa2, ft1, rne
                  auipc        s9, 265034
                  sltu         gp, s8, a0
                  srl          a5, t5, tp
                  auipc        t0, 629391
                  slli         s5, a4, 26
                  auipc        tp, 826592
                  srai         ra, s9, 7
                  fclass.s     s2, ft8
                  lui          a5, 310384
                  fadd.s       fs1, fs6, fs2
                  mulhu        s3, t1, s3
                  fcvt.s.wu    fa0, a0
                  lui          s0, 544047
                  nop
                  srai         t2, t0, 7
                  fcvt.wu.s    a0, fs11, rup
                  fsgnj.s      ft10, ft3, ft0
                  mul          a6, gp, s8
                  sll          ra, s5, tp
                  remu         a7, a3, s0
                  fclass.s     s7, fa1
                  srl          t5, t1, a1
                  addi         a5, ra, 1823
                  andi         a0, s8, -1604
                  fcvt.wu.s    gp, fs6, rup
                  srli         tp, ra, 13
                  fmin.s       fs10, ft10, ft4
                  remu         t1, a2, ra
                  fsgnj.s      ft8, fs11, fa5
                  remu         s4, a6, s10
                  remu         s1, a6, s4
                  div          a0, t1, ra
                  fsub.s       fa3, ft0, ft2, rtz
                  divu         s8, t5, a7
                  fdiv.s       fs7, fs1, fa4
                  fmv.w.x      fa7, t5
                  fsgnjn.s     fs6, fs11, ft5
                  xori         t0, t1, 608
                  fmul.s       fa5, fs6, ft2
                  ori          gp, a6, -1543
                  sltu         t5, s7, t0
                  sltiu        s2, t1, -750
                  mulhsu       zero, sp, s1
                  srl          t6, a1, sp
                  slli         t4, a6, 27
                  fmax.s       fa5, fs0, ft9
                  slli         t2, s5, 28
                  fsgnjx.s     fs2, fs2, ft5
                  fmin.s       fa0, fs9, fa1
                  fcvt.wu.s    s8, ft10, rne
                  fmv.x.w      s10, ft10
                  fsgnj.s      fs0, ft1, ft6
                  fcvt.s.wu    ft7, ra, rup
                  slli         a4, ra, 11
                  srl          s4, t1, zero
                  fsgnjn.s     ft9, fs3, ft2
                  fcvt.s.wu    fa3, a4, rne
                  and          s2, s7, s8
                  mul          s9, ra, sp
                  fsqrt.s      fa3, fs8
                  mulhu        t4, s6, s9
                  fcvt.w.s     s6, fs8
                  fmin.s       fa6, ft3, fs11
                  fclass.s     s7, ft9
                  sub          s3, s2, a5
                  fmul.s       ft1, ft7, fs3, rtz
                  srli         t1, t2, 20
                  flt.s        s4, ft5, ft2
                  mulhu        s5, s0, zero
                  fsgnjx.s     ft11, ft5, fs6
                  sltu         gp, s1, zero
                  slt          s10, a7, a4
                  sltiu        t2, s9, -1022
                  srl          a0, s2, s9
                  fmul.s       fs11, fa0, fs0, rdn
                  sub          s4, t4, s11
                  fmul.s       fs5, ft1, ft9, rtz
                  andi         s3, t1, 2041
                  fcvt.s.wu    fs0, s0, rmm
                  xori         a7, s8, 388
                  mul          t1, ra, ra
                  fdiv.s       ft9, fa2, fs0, rdn
                  ori          s7, t2, 739
                  fclass.s     ra, fa3
                  andi         a5, a7, 362
                  xori         a4, a4, -1686
                  lui          s9, 894827
                  fcvt.w.s     a4, fs11, rtz
                  flt.s        a7, fs7, fs8
                  sltiu        s2, s6, 191
                  fadd.s       fs11, fs0, ft0, rup
                  ori          ra, s9, 1303
                  flt.s        a4, ft5, fs5
                  fsgnj.s      fs11, fs9, fa4
                  fcvt.wu.s    s8, fa3, rup
                  mulhu        s11, s5, t0
                  fsgnjn.s     fa5, ft7, fa3
                  or           zero, a0, t4
                  sll          s11, a1, a4
                  slt          a7, gp, gp
                  lui          a0, 873240
                  nop
                  sra          t2, sp, t0
                  fcvt.w.s     t4, fa2
                  or           s8, gp, s5
                  fcvt.wu.s    t4, fs7, rmm
                  mulhsu       s5, a7, t2
                  fle.s        ra, fa7, fs9
                  fmin.s       fa0, fa5, fa2
                  mul          t2, a7, t1
                  feq.s        s4, fs1, fs3
                  slt          a0, t1, s3
                  fclass.s     ra, fa0
                  div          a5, gp, sp
                  rem          s1, t1, a7
                  fdiv.s       ft3, fs9, fs2, rne
                  fmin.s       fs7, fs7, ft10
                  div          a5, a0, a0
                  xor          s9, s5, a1
                  xori         s7, s10, -1823
                  xori         t6, t2, 1070
                  srl          a6, a0, s1
                  fcvt.s.wu    ft8, t6
                  fcvt.wu.s    zero, fs2
                  mulhsu       s11, gp, sp
                  sra          a2, a4, gp
                  div          s7, a7, s11
                  flt.s        a0, fs0, fa0
                  fsgnj.s      fa3, ft3, fa2
                  auipc        t2, 53032
                  srl          a0, t6, t0
                  slt          s7, s10, sp
                  sltu         a0, t6, s2
                  fmv.x.w      a5, fs1
                  nop
                  fmul.s       fs4, ft11, ft6, rtz
                  sltu         a0, ra, s8
                  rem          s3, t2, a6
                  fmul.s       fs8, ft2, fa2
                  auipc        gp, 222418
                  mul          t0, a0, t6
                  slti         s6, a5, -1964
                  feq.s        tp, fa5, fs11
                  fadd.s       ft1, fs10, fa7, rtz
                  slli         zero, s6, 23
                  fsgnjn.s     fa0, fs8, fa2
                  fmin.s       fa0, ft7, fa7
                  mulhu        s4, t0, zero
                  mulh         a3, sp, s3
                  xori         a5, s1, 914
                  fsgnjx.s     fs7, fs7, ft9
                  mulhu        s4, tp, t4
                  lui          t1, 374265
                  fsgnjn.s     fs11, fs3, fs9
                  divu         s4, s7, t6
                  sll          s2, s0, a0
                  fclass.s     a3, fs2
                  fdiv.s       ft3, fs5, fa4
                  fsub.s       fa3, ft10, ft3
                  fsub.s       ft4, ft8, fs6, rup
                  mulhu        a0, a5, tp
                  mul          ra, s10, ra
                  fsub.s       fs3, ft11, ft10
                  fsgnjn.s     fs3, ft5, fa4
                  srai         s0, sp, 9
                  sll          t1, t1, s4
                  sra          a7, tp, a6
                  fmv.x.w      s0, fa1
                  add          ra, sp, sp
                  ori          s8, ra, -616
                  srai         s9, s11, 19
                  addi         s3, s6, 1169
                  fdiv.s       fa6, fs1, ft0, rdn
                  fsgnj.s      fs9, fs4, fs0
                  or           s10, a0, t1
                  nop
                  add          s9, tp, t0
                  fmv.w.x      fs3, t2
                  slti         ra, a0, -1860
                  lui          s3, 396128
                  nop
                  srli         a6, s6, 18
                  lui          s7, 700964
                  fmin.s       ft8, fa2, ft9
                  fsgnjn.s     fs4, fs9, fs8
                  nop
                  addi         t2, t4, 1381
                  fadd.s       fs5, ft1, ft1
                  xor          t2, s3, s6
                  sll          a3, s1, s7
                  rem          t5, s5, t2
                  fclass.s     s11, fa3
                  fsgnjx.s     ft0, fs2, ft7
                  auipc        s2, 334833
                  xor          a6, t5, s9
                  andi         t0, a0, 1931
                  nop
                  feq.s        a6, ft6, ft5
                  fcvt.s.wu    ft6, t5
                  fadd.s       fs9, fs11, ft8, rtz
                  fcvt.s.wu    ft10, s5
                  slli         s9, t6, 31
                  fsgnj.s      fs0, ft10, fs0
                  lui          t1, 187810
                  sltu         t1, a0, s4
                  addi         a6, t2, 1597
                  divu         s11, sp, t1
                  srli         t6, s4, 2
                  remu         s5, a3, a1
                  sltu         s6, t3, s8
                  ori          s5, tp, -1309
                  divu         s10, s9, tp
                  fsgnj.s      fs3, fs10, fs9
                  fcvt.s.wu    ft0, a7, rtz
                  fsgnj.s      ft10, ft10, fa4
                  flt.s        t4, fa7, ft0
                  ori          a7, a7, 552
                  sltiu        s1, s2, 1029
                  sltiu        a3, a6, 1751
                  nop
                  fadd.s       fs9, fs0, fs8
                  remu         s7, s1, a6
                  add          a0, t1, a1
                  srli         s2, s3, 27
                  auipc        zero, 190281
                  fcvt.w.s     t0, ft4, rne
                  feq.s        s3, ft6, fs1
                  srli         a6, a1, 20
                  slli         s10, s4, 13
                  fcvt.s.wu    fs11, a1, rup
                  nop
                  fcvt.w.s     a6, fs7
                  fcvt.w.s     t1, ft9
                  sltu         a5, t5, a6
                  fsgnjx.s     ft10, ft8, fs8
                  auipc        s6, 489493
                  add          t5, s11, a4
                  slti         s11, s4, -315
                  sll          s5, s1, s0
                  slti         s8, a3, 1453
                  sra          t6, a6, t1
                  srai         t2, s5, 18
                  and          t5, s1, s9
                  fcvt.w.s     s9, fa3
                  ori          t5, t2, 1206
                  slli         s2, t6, 12
                  fclass.s     s4, fs1
                  xor          a3, t6, t6
                  srl          tp, a4, s1
                  div          a7, a2, t3
                  srli         s5, a6, 4
                  sltiu        s2, a1, -164
                  slti         s11, a4, -1541
                  add          a0, s0, s0
                  add          ra, s11, s2
                  xor          s10, a3, t6
                  fle.s        gp, fs1, ft9
                  add          s6, t0, s8
                  sll          s3, gp, t0
                  sltu         a7, t6, gp
                  mul          ra, s1, t3
                  sll          tp, t0, s7
                  slli         t5, t5, 25
                  mulh         s11, a1, s6
                  fcvt.s.wu    fs8, t2, rtz
                  fsgnj.s      fs1, fa1, fs8
                  xor          t1, a5, s6
                  fmin.s       ft3, ft5, ft5
                  fsqrt.s      ft0, ft1, rdn
                  fmax.s       ft7, fa4, fs6
                  fcvt.s.w     fa2, a0, rtz
                  xori         a3, t0, -1688
                  fcvt.w.s     gp, ft3, rdn
                  fcvt.w.s     t0, ft2, rdn
                  mulhsu       ra, s7, a7
                  fmax.s       fs1, fa1, fa5
                  srli         a0, s4, 23
                  or           a2, t0, t2
                  fsgnjn.s     fs8, fa7, ft10
                  sltu         ra, ra, t4
                  fcvt.s.w     fs1, s9, rmm
                  srl          s10, t1, a6
                  mulhsu       a3, sp, a5
                  sltiu        a5, s10, 1754
                  slli         s5, a1, 31
                  sra          t2, s3, s10
                  slti         s3, t1, 1701
                  srli         s2, a6, 28
                  sub          zero, a0, s2
                  fcvt.s.w     ft10, a0, rdn
                  flt.s        a0, fs6, fs5
                  auipc        s10, 898123
                  sra          t6, t2, s11
                  remu         a4, a3, s1
                  divu         gp, a4, s4
                  divu         s0, a1, s0
                  fsgnj.s      ft5, fa5, fs6
                  srli         a7, s8, 14
                  fsgnj.s      ft3, ft1, ft0
                  fcvt.w.s     t5, fa2
                  fsgnjn.s     ft3, fs6, fs10
                  fmin.s       ft11, ft8, ft11
                  fdiv.s       fs3, fa2, fs0, rtz
                  fsub.s       fs7, ft0, fa5
                  fclass.s     s7, fa4
                  sltiu        a3, a2, -1817
                  flt.s        s4, fa7, fs2
                  srli         s9, s8, 19
                  fmul.s       ft9, fs2, ft3, rmm
                  sra          s1, a7, s4
                  sub          a4, a4, t6
                  fmv.w.x      ft8, s3
                  slti         s3, a1, 1023
                  flt.s        s5, fs6, ft2
                  nop
                  fsgnjn.s     ft11, fs2, fa2
                  mulhu        a0, s9, gp
                  add          s1, t5, t0
                  fsub.s       ft10, fs0, fs4
                  flt.s        a4, ft5, fs10
                  mulh         s8, a6, a7
                  addi         a0, t0, -2
                  mul          s4, t4, a4
                  div          a4, a7, zero
                  rem          zero, a3, s6
                  feq.s        a4, ft6, fa6
                  fsgnjn.s     fs9, fs1, ft10
                  srli         a7, t2, 27
                  fmv.w.x      fs8, a7
                  rem          s5, t1, s11
                  fcvt.wu.s    s6, ft7, rup
                  fle.s        s3, fa7, ft6
                  srl          t4, t0, s2
                  slti         s1, ra, -1047
                  fcvt.wu.s    t4, fs8
                  remu         t4, s5, sp
                  fsub.s       fs2, fs5, fs6
                  slli         t6, a7, 3
                  srli         s9, s2, 11
                  add          a3, a5, gp
                  fdiv.s       fs0, fa0, ft2, rdn
                  rem          ra, a0, ra
                  mulhsu       a6, a5, s9
                  addi         t6, a2, 875
                  srai         t6, s3, 16
                  divu         s5, s1, s0
                  fcvt.s.wu    fs4, t0
                  xor          s5, ra, a2
                  xori         s3, s5, -374
                  mulhu        a6, a0, t4
                  fmul.s       fs10, fs10, ft11, rne
                  xori         s4, t2, 917
                  fmv.w.x      ft2, s8
                  fmv.x.w      s4, ft10
                  srl          s6, ra, s0
                  fmin.s       ft1, ft1, ft0
                  fdiv.s       fs11, fa3, ft11, rmm
                  and          s5, sp, a0
                  mulh         t2, t0, t2
                  fsqrt.s      fs6, fs1, rup
                  xori         a0, t5, -1264
                  feq.s        t6, ft10, fs1
                  fcvt.w.s     s1, ft8, rdn
                  lui          tp, 205184
                  div          s3, t1, a3
                  slli         a0, a4, 21
                  feq.s        a7, ft3, ft4
                  andi         s9, s11, -1744
                  sub          a6, ra, tp
                  nop
                  add          tp, s4, s4
                  fcvt.s.w     fs9, ra
                  rem          s1, s8, t4
                  fsub.s       ft1, fs8, fs7, rmm
                  ori          s11, a1, -1728
                  fsgnj.s      fs7, ft0, fa6
                  rem          s9, zero, t6
                  fle.s        s3, fa6, ft6
                  div          a6, tp, a6
                  nop
                  sub          s10, s8, tp
                  mulhsu       s4, sp, s10
                  fmax.s       fs6, fs4, fs1
                  sltu         s9, a1, s7
                  fsqrt.s      ft3, ft11, rne
                  nop
                  xor          zero, t2, a6
                  mulhsu       a0, a7, t3
                  fmin.s       fs2, fs8, fa2
                  lui          t0, 181710
                  sltu         a5, a0, s2
                  ori          s1, a5, -1113
                  srl          a4, a0, s2
                  divu         a5, a1, s3
                  div          s1, s5, a7
                  fmv.w.x      ft7, t2
                  fle.s        s8, fa6, fa6
                  mul          s7, a3, t3
                  andi         s9, a4, -10
                  addi         zero, a2, 300
                  fclass.s     a4, ft7
                  addi         t4, gp, -586
                  mulhsu       s7, t5, t1
                  mulhsu       a3, s0, t5
                  divu         a2, a3, t3
                  flt.s        s0, fs10, fs6
                  srli         a3, t1, 4
                  fsgnjx.s     fs10, ft8, ft5
                  sll          a3, s6, a4
                  divu         s7, s4, a7
                  fmul.s       ft6, fa0, fs1, rup
                  divu         gp, t1, a1
                  srl          s6, gp, gp
                  sub          t4, a4, s7
                  nop
                  sub          s3, tp, s3
                  fcvt.wu.s    s2, fa5, rmm
                  fmax.s       ft5, fs6, ft7
                  mulh         zero, t1, s10
                  auipc        s3, 495474
                  fcvt.s.wu    fs8, s9, rne
                  srli         s7, a6, 16
                  sra          s3, s5, t4
                  divu         a5, t5, s6
                  slt          s5, a2, s6
                  slli         t6, tp, 6
                  fcvt.wu.s    a2, fa5
                  remu         s11, s1, a3
                  andi         s11, s2, 1781
                  fsgnjn.s     ft9, ft4, fs6
                  mulhu        gp, t0, s2
                  fcvt.s.w     fs7, t5, rne
                  sra          s2, s0, tp
                  sll          a0, s4, a4
                  fmv.x.w      s7, ft3
                  nop
                  fclass.s     s0, fa5
                  ori          s5, a6, 855
                  fclass.s     s0, ft9
                  add          s3, t6, a1
                  fdiv.s       ft6, fs11, fa0
                  andi         zero, s6, 1218
                  srli         s8, t1, 0
                  fadd.s       fa7, fs0, fs7
                  fsgnjn.s     fa4, ft4, fs4
                  and          t1, a0, t4
                  andi         a4, s6, -448
                  fcvt.s.w     fs4, a2, rne
                  fmin.s       ft8, ft2, ft7
                  flt.s        a5, fa5, fs3
                  addi         s1, t2, 1031
                  fcvt.s.w     ft6, t0, rdn
                  div          zero, gp, ra
                  lui          t5, 919345
                  xor          s11, t4, t2
                  sltu         s9, t1, t1
                  div          s5, t4, a4
                  div          t2, s1, s3
                  fsgnj.s      ft6, fs6, ft7
                  slt          a5, t1, a2
                  fcvt.s.wu    fs7, t0
                  add          zero, t4, gp
                  slti         a7, a2, 2001
                  andi         s10, s4, 1051
                  slt          t6, s0, a0
                  fclass.s     a4, ft2
                  fmv.x.w      s6, ft10
                  fcvt.s.w     fs1, s0
                  fle.s        tp, fs5, fs5
                  addi         s10, s1, -729
                  fmin.s       fa6, fs1, fs5
                  sra          s4, t4, s10
                  fcvt.s.w     ft2, s0, rup
                  mulhsu       s3, t5, s3
                  and          a0, gp, a3
                  ori          t1, ra, 1633
                  div          a5, s3, s3
                  fmul.s       ft9, fs9, ft6, rdn
                  auipc        a2, 154973
                  slli         a6, a2, 29
                  mulh         t6, s8, a3
                  flt.s        zero, ft4, fa0
                  nop
                  fcvt.s.wu    fs7, s0, rup
                  andi         a0, a7, 1983
                  remu         zero, a3, a0
                  fmv.w.x      ft7, gp
                  ori          s8, a2, 1866
                  fsgnjx.s     ft4, fs6, ft11
                  srli         t5, s7, 2
                  xori         a4, t3, 1780
                  fmv.x.w      a0, fs10
                  fsub.s       ft5, fa0, ft1
                  srl          zero, t5, a1
                  fsqrt.s      fs3, fs0
                  mul          a5, t5, s9
                  fsgnjx.s     fa3, ft11, ft1
                  andi         a5, tp, 744
                  rem          t4, s11, s5
                  fsgnjn.s     ft1, ft4, ft1
                  slti         t1, t5, -1695
                  srai         s10, s9, 23
                  feq.s        s11, ft0, fs1
                  srl          t0, t0, s1
                  div          s3, s0, t1
                  slt          t2, t0, s2
                  div          t6, s0, s3
                  xor          a5, s3, s11
                  div          ra, a2, s0
                  fadd.s       fs3, fs11, fa1
                  mul          t0, t3, s1
                  fcvt.s.w     ft9, a1
                  mul          s3, sp, zero
                  srli         t2, ra, 24
                  fcvt.w.s     s0, fs7
                  srli         s11, t1, 31
                  rem          gp, a6, s10
                  fcvt.w.s     s11, fa0, rtz
                  flt.s        s10, ft8, fa5
                  fcvt.w.s     t0, fs4, rtz
                  sltu         tp, s5, s7
                  nop
                  srai         t0, t4, 18
                  mulh         t1, gp, ra
                  slti         s10, s10, 1603
                  slt          a2, s10, t0
                  fadd.s       ft9, fs10, fa0, rmm
                  fadd.s       fs9, fs6, ft0
                  fmv.x.w      a4, ft5
                  xori         s2, s8, -37
                  fmv.x.w      s0, ft11
                  mulh         s2, a3, s5
                  nop
                  ori          t6, s2, 1432
                  fsgnjx.s     fs3, ft9, fa2
                  srai         tp, a3, 2
                  xori         t6, s1, 1652
                  mulhsu       s0, a7, s8
                  and          s2, a0, s7
                  srli         ra, a1, 20
                  andi         t5, t2, 443
                  fmv.w.x      fs4, t0
                  fmv.x.w      s3, fa3
                  divu         tp, s1, a0
                  fcvt.s.wu    fa4, s8
                  fdiv.s       fa3, fa7, fa5, rne
                  fmv.x.w      tp, ft3
                  fmv.x.w      t1, fa5
                  sltiu        t5, t2, -667
                  fsqrt.s      ft1, fa4
                  mulhu        a5, a2, t1
                  lui          t5, 665540
                  fadd.s       fs11, fs3, fs11
                  fsqrt.s      ft0, ft11
                  mulhu        s1, s4, t1
                  fsqrt.s      ft11, fs3
                  sub          s4, tp, t2
                  fsgnj.s      fs5, fa4, ft9
                  srli         t5, t2, 20
                  mulhsu       t0, t2, gp
                  xori         s0, a0, -941
                  andi         s6, t3, -1604
                  fcvt.wu.s    a4, ft6
                  div          s9, t2, s1
                  srli         a0, a5, 11
                  sltiu        s11, s1, -474
                  or           a0, s6, s9
                  srai         s11, a5, 24
                  slli         a0, a4, 17
                  fadd.s       ft6, ft7, ft11, rup
                  sub          s5, t2, t3
                  slt          s9, t6, t4
                  sra          s11, gp, s9
                  sltiu        s0, s4, 75
                  fsgnj.s      ft9, fa3, fs7
                  divu         s8, a7, s7
                  and          s7, a3, s2
                  mulh         a6, a4, t3
                  lui          a7, 973024
                  srl          s9, ra, s8
                  sub          a2, a3, t1
                  srl          a7, t3, s1
                  sra          s6, t4, s3
                  fclass.s     a3, fa4
                  fclass.s     a4, fa5
                  mulh         s1, a6, ra
                  flt.s        t5, ft9, fa3
                  fmv.x.w      a6, fs11
                  fadd.s       ft7, ft0, ft11, rtz
                  mulh         t6, t1, a3
                  rem          gp, a0, a2
                  andi         s11, s0, -1546
                  addi         t4, t3, 983
                  fsgnjx.s     ft2, ft0, ft9
                  srl          s11, s11, a5
                  rem          s4, sp, t5
                  mulh         s9, gp, t0
                  srli         s4, t4, 12
                  add          t6, s1, ra
                  fsgnj.s      fs9, fs8, fs6
                  fmax.s       fs0, fs8, ft7
                  fmv.w.x      fs6, a7
                  fsgnjn.s     fs0, ft7, ft1
                  sub          s1, t4, sp
                  fcvt.s.wu    ft7, s10
                  sub          t1, gp, a3
                  fmv.x.w      a7, fa5
                  slt          t0, s9, tp
                  fmin.s       ft0, fs6, fs4
                  fle.s        s11, ft10, fa4
                  fmin.s       fs3, fs10, fa1
                  flt.s        t5, fa5, fs0
                  fsgnjx.s     ft10, fs3, ft8
                  srli         gp, s5, 0
                  fmax.s       fs4, ft11, fs5
                  srai         s4, s11, 3
                  fmul.s       fs2, ft8, fs9
                  andi         s10, t2, -293
                  fmul.s       fa7, ft7, ft3, rmm
                  lui          s3, 382954
                  sll          s3, a3, s2
                  xor          s8, ra, t1
                  fadd.s       fs9, ft6, fa0, rdn
                  div          a0, ra, t5
                  divu         s5, a4, sp
                  srl          a7, a2, ra
                  slti         s5, t0, 1176
                  sll          t1, s5, a5
                  or           tp, a5, t0
                  fcvt.w.s     s7, fs1, rtz
                  mul          s5, s1, t4
                  srl          tp, tp, gp
                  fmv.w.x      fs2, s3
                  fmax.s       fs2, fs0, ft10
                  fsgnjx.s     fs4, fs6, fa4
                  srl          t4, ra, zero
                  slli         s0, s9, 12
                  lui          s4, 162184
                  fsgnj.s      ft3, ft6, fs11
                  slti         ra, s10, 1387
                  sub          a0, a2, s11
                  mul          s0, a7, s7
                  fdiv.s       fs10, ft9, fs8
                  fsgnj.s      fa4, fs11, fa6
                  fcvt.s.w     ft5, s5
                  fcvt.s.w     fa2, zero
                  xori         a4, a1, 200
                  fsqrt.s      ft10, fs5
                  fle.s        a4, fs6, fa7
                  nop
                  sub          gp, zero, t6
                  fcvt.s.wu    fs7, s11, rne
                  mulhu        zero, s10, a4
                  slti         s9, s5, 1267
                  auipc        s10, 129344
                  or           s0, s10, a1
                  flt.s        s1, ft0, fa4
                  fcvt.wu.s    s5, fa2
                  and          a7, sp, a1
                  nop
                  fcvt.wu.s    t6, ft2
                  fmv.w.x      fs5, zero
                  sltiu        s6, s3, 1118
                  fmul.s       fa5, fs3, ft9, rup
                  div          ra, a3, a4
                  divu         tp, ra, s0
                  or           t1, a2, t3
                  fcvt.wu.s    gp, fs5
                  or           s0, t2, t3
                  fcvt.wu.s    s2, fa1, rdn
                  fcvt.s.wu    fa6, t5
                  slt          tp, zero, a5
                  mul          a5, s7, s9
                  xori         s9, a4, 861
                  lui          s8, 174384
                  add          s9, tp, s9
                  slt          s5, a7, s9
                  mulhsu       t2, s0, s5
                  sll          a3, s0, ra
                  srai         t1, a2, 26
                  fsgnj.s      ft0, ft3, ft9
                  fmv.w.x      fs11, s6
                  sltu         a6, s3, a6
                  fmul.s       ft3, fa6, ft0
                  slli         t5, a1, 18
                  sltu         tp, a6, s7
                  fle.s        s6, fs2, ft11
                  fsub.s       ft1, ft4, fs8
                  lui          s5, 933432
                  fmax.s       fs2, fa7, ft10
                  fcvt.w.s     s11, ft7, rne
                  sll          a6, tp, s10
                  rem          t2, sp, s4
                  fmv.x.w      a3, fa0
                  mul          a6, a3, s5
                  remu         t0, s0, s5
                  slli         a3, ra, 9
                  feq.s        t4, fs10, fa2
                  fmv.w.x      fa5, a5
                  fcvt.s.wu    ft0, s10
                  ori          s9, s9, 1670
                  fsgnjx.s     fa3, fs1, fs4
                  fle.s        t6, ft1, fs11
                  andi         s8, t6, 451
                  fdiv.s       fa4, ft4, fa2
                  divu         s0, s11, gp
                  mulhsu       zero, s8, zero
                  lui          a7, 54903
                  fsgnjx.s     ft11, fs6, fs7
                  srai         s7, s1, 6
                  fclass.s     ra, ft11
                  fcvt.s.w     ft10, s1, rup
                  xori         ra, t6, -50
                  andi         s0, a7, 1133
                  mul          s3, a3, s6
                  sra          s3, s3, t0
                  slli         a2, a7, 9
                  fcvt.s.wu    ft1, t2
                  div          tp, s1, t2
                  lui          a3, 1010335
                  sltu         zero, t4, t4
                  xori         t1, s6, 469
                  slti         a4, s9, 147
                  fcvt.w.s     s6, ft4
                  srli         s0, tp, 23
                  sltiu        t0, t4, -1173
                  srli         a7, s11, 31
                  sra          t4, t0, t4
                  fmul.s       fs4, fa1, fs4, rmm
                  srli         s6, gp, 4
                  srli         s1, tp, 26
                  fmul.s       fa6, fa0, fa5
                  fmv.x.w      t0, fs6
                  srli         t0, gp, 23
                  add          s6, s9, s7
                  div          t6, a2, gp
                  fsub.s       fs3, ft8, fs10, rup
                  slli         t5, s3, 7
                  divu         s8, s5, t0
                  rem          s4, a4, a5
                  remu         s7, t3, a4
                  fsgnjn.s     fa4, fs5, fs7
                  mulhsu       a6, gp, t0
                  remu         s2, a1, s11
                  fsgnj.s      fs1, fa3, ft7
                  srli         zero, t2, 4
                  fsgnjn.s     fs7, ft0, ft5
                  rem          s10, a1, s2
                  mulhsu       a4, tp, s2
                  xori         t4, a2, -1267
                  flt.s        t2, fs0, ft9
                  mulh         a0, tp, s3
                  slli         a3, a3, 19
                  sll          t5, s4, ra
                  fcvt.s.w     fa2, tp, rtz
                  mulh         a4, s3, s3
                  sltu         s5, s8, t3
                  sra          ra, gp, s5
                  flt.s        gp, ft3, fs1
                  fclass.s     t6, fa3
                  auipc        s7, 212265
                  slli         s4, s2, 1
                  div          zero, s0, s7
                  sra          s9, t3, s11
                  fle.s        a6, fa7, fa7
                  or           t0, t4, s4
                  auipc        a6, 899536
                  lui          s10, 32814
                  mul          tp, ra, s6
                  nop
                  fcvt.wu.s    a0, ft8, rne
                  or           gp, s0, s7
                  remu         t4, gp, ra
                  ori          t5, s11, -1642
                  sll          s2, a1, s5
                  ori          ra, sp, -797
                  slt          a6, a1, a6
                  fmin.s       fs9, ft7, ft5
                  nop
                  flt.s        a3, ft9, fa5
                  fcvt.w.s     t2, fa0, rdn
                  mulhu        tp, a0, s9
                  feq.s        t4, fa6, fa3
                  slt          t5, a1, s0
                  div          s0, s2, zero
                  sltiu        s8, s7, -1602
                  sltiu        a5, t2, -1577
                  lui          a6, 911512
                  fdiv.s       ft10, ft3, fs6
                  sub          s10, a2, a2
                  remu         s3, t4, t0
                  flt.s        s2, fs5, ft1
                  fsqrt.s      fs1, fa1, rtz
                  fcvt.s.w     fa5, t6, rmm
                  srai         a2, s11, 4
                  slti         a3, a5, -2027
                  nop
                  fmax.s       fa7, fs1, fs9
                  sltu         s3, a6, s2
                  feq.s        a2, ft5, fs0
                  add          a2, a0, zero
                  mulhu        a3, t2, s2
                  fcvt.s.wu    fs8, ra
                  and          a5, a0, s11
                  or           s4, t2, a1
                  flt.s        s1, fs2, ft2
                  srai         t6, a3, 9
                  mulh         s9, gp, sp
                  fsqrt.s      ft5, ft6
                  div          t4, a2, t5
                  sll          a7, t2, s4
                  srai         a4, t2, 4
                  xor          gp, t6, ra
                  div          s8, t0, t5
                  fsgnj.s      ft6, fa3, fs3
                  feq.s        a3, fs7, ft5
                  divu         t1, a1, a7
                  fdiv.s       fs8, ft5, ft5, rmm
                  xor          a0, ra, s6
                  divu         s10, s5, a4
                  srli         a5, a1, 29
                  slti         s8, t6, -18
                  fsgnjn.s     fs9, fs6, fa2
                  mulhu        a0, s2, sp
                  xor          t5, t3, a2
                  mulh         a0, a2, s11
                  mulh         t0, s0, a7
                  sll          a5, s8, a5
                  div          gp, s11, s0
                  auipc        s1, 860937
                  and          s7, s6, t0
                  fmul.s       fa4, fa4, fs1
                  and          s2, a1, a5
                  sll          gp, s8, s2
                  fle.s        s0, fs11, fs10
                  div          a2, t6, t5
                  addi         s9, s9, 723
                  mulhsu       s10, t5, zero
                  nop
                  fsub.s       ft5, fs10, fs0, rne
                  xori         gp, s6, -1858
                  sltu         s1, s11, t5
                  slti         t0, a1, 1158
                  sub          s7, a4, s7
                  fsgnjn.s     ft10, ft0, ft10
                  andi         a3, t2, -94
                  mul          a2, a1, s4
                  sltiu        t1, zero, 954
                  mulh         s2, t0, s9
                  fcvt.s.w     fs2, s6, rne
                  srl          ra, s2, t3
                  srli         a4, sp, 19
                  fmv.x.w      t5, fa1
                  fmax.s       fs1, fs9, ft6
                  fmv.w.x      fa5, a1
                  add          s9, s6, s6
                  fsub.s       fs9, ft5, ft10, rmm
                  sltiu        t5, a7, -97
                  divu         s10, a6, tp
                  slt          t0, t6, a4
                  fmv.x.w      a7, fs7
                  rem          a6, s0, a0
                  fcvt.w.s     s3, ft10
                  feq.s        a0, fs7, fa5
                  fle.s        a3, ft4, ft11
                  mulhsu       t0, s4, s8
                  auipc        s4, 673869
                  mulh         t0, t2, ra
                  fclass.s     a3, fs11
                  slt          a0, s2, a6
                  fsgnjn.s     fs1, ft5, ft0
                  mulh         a7, gp, ra
                  fadd.s       fa7, fs4, fa5, rne
                  remu         zero, s9, s10
                  fcvt.s.w     ft6, zero, rup
                  nop
                  srli         a0, a5, 2
                  srli         s3, s2, 19
                  andi         gp, s8, 700
                  srl          t1, s4, gp
                  fsgnjn.s     ft10, ft6, fs3
                  mulh         a7, a0, s6
                  srai         s5, s0, 0
                  mulhsu       t1, s7, t5
                  fcvt.wu.s    t0, fs2, rdn
                  fcvt.wu.s    a5, fs6, rmm
                  fle.s        s10, fa0, ft2
                  fmul.s       ft5, ft3, fa1
                  divu         a7, a4, tp
                  fcvt.s.w     fs2, t0
                  mulh         s1, t4, s5
                  fadd.s       ft0, fa7, fs6, rup
                  fcvt.s.w     fs2, a6, rdn
                  div          t5, t1, a5
                  fsub.s       ft9, fs0, fa2
                  fsgnj.s      ft9, fa6, fs9
                  slti         s9, t4, -1074
                  sub          a3, a3, a7
                  slli         s4, a3, 5
                  fcvt.w.s     a7, fa0, rup
                  feq.s        t2, ft11, ft2
                  sll          s8, sp, s0
                  fmul.s       ft2, fs11, fs11, rup
                  feq.s        ra, fa5, fs3
                  add          t1, s8, s11
                  srl          s8, t6, t5
                  fle.s        t2, ft0, fa4
                  fcvt.wu.s    s9, ft7
                  slli         t6, t0, 1
                  feq.s        t0, ft4, ft6
                  ori          s1, s10, -536
                  and          a7, s5, s2
                  fclass.s     s8, fs4
                  sll          s3, t0, sp
                  auipc        a5, 933871
                  or           t4, gp, s9
                  fcvt.s.wu    fs2, a2
                  fsgnj.s      fs9, ft7, fs10
                  sra          ra, a4, t1
                  mul          s4, tp, sp
                  sra          a5, a2, t4
                  sltu         s9, s10, t6
                  remu         a3, t3, s3
                  fclass.s     t6, fa4
                  fmv.x.w      a5, fs1
                  sra          s1, sp, a1
                  lui          s4, 121224
                  or           a0, a2, s5
                  fsqrt.s      fs9, fs8, rdn
                  or           zero, s4, a3
                  mulhu        s10, t0, t0
                  feq.s        s7, fs5, ft6
                  srli         s1, t6, 11
                  fmv.x.w      a0, fs3
                  sll          s11, s7, t0
                  fle.s        s3, fs4, fs9
                  feq.s        s0, fa2, fa2
                  fmv.x.w      t1, ft0
                  sltu         t6, s5, t5
                  mulh         a2, s9, t0
                  slli         s8, a1, 8
                  xor          a5, t2, s1
                  auipc        t6, 547736
                  sll          a7, t0, t6
                  sub          s10, zero, t4
                  andi         t0, tp, -1581
                  fle.s        s3, fa2, fa5
                  sltiu        s3, a7, -43
                  sub          t6, s9, t3
                  fmul.s       ft9, fs9, ft9
                  xori         t6, tp, 4
                  nop
                  flt.s        a3, ft1, ft3
                  fcvt.w.s     zero, fa7, rmm
                  lui          s2, 395712
                  sub          s11, t0, t5
                  rem          a7, tp, t6
                  fsub.s       fs10, fa0, ft5, rmm
                  mulh         s8, t5, t3
                  auipc        tp, 863364
                  fsgnjn.s     fa0, fa2, fs8
                  mul          ra, a6, s7
                  xori         a2, s11, -1744
                  fcvt.w.s     s8, ft0, rdn
                  fcvt.wu.s    s2, ft4, rmm
                  fmin.s       fs1, fs8, ft7
                  fsgnjn.s     ft10, ft4, fs9
                  lui          s7, 112530
                  fmax.s       ft4, fs8, fs4
                  or           tp, zero, a3
                  fclass.s     t4, fa7
                  fsgnj.s      fs3, fs7, fa5
                  fadd.s       fs10, ft4, fs6, rtz
                  fmv.w.x      fa2, s10
                  fsqrt.s      fs6, fa0, rne
                  or           zero, gp, s10
                  nop
                  slt          a3, a1, t0
                  lui          a3, 289207
                  fmul.s       ft8, ft1, fa5
                  sra          s6, a4, tp
                  fdiv.s       fa0, fs4, ft2, rne
                  auipc        tp, 19875
                  slt          s10, t2, ra
                  fsqrt.s      fa2, fa2
                  srli         a3, s9, 26
                  divu         gp, a3, s2
                  fcvt.w.s     s11, ft5, rne
                  srai         s11, s9, 0
                  mulhu        gp, t4, gp
                  feq.s        t4, ft1, ft7
                  mulhsu       t2, t0, t0
                  fcvt.w.s     a4, fa6, rdn
                  slti         s9, a3, 1860
                  mulhu        s1, s2, t2
                  srai         a6, s3, 25
                  fcvt.wu.s    a2, ft6
                  fmax.s       fa6, fs4, ft0
                  fsgnjn.s     fs7, fs7, ft7
                  fsgnjx.s     fs10, ft10, fs9
                  slt          t4, sp, s10
                  slli         t4, t1, 23
                  sra          a6, sp, s1
                  fcvt.s.w     fa4, t4
                  fsgnjx.s     fs5, ft7, ft2
                  mul          s4, s6, a4
                  srai         zero, a6, 28
                  fmul.s       fs11, fs6, ft0, rmm
                  fmin.s       ft4, fa5, fs11
                  srai         a3, tp, 7
                  nop
                  slt          a3, zero, s3
                  addi         a3, tp, 429
                  feq.s        gp, fa0, fs5
                  div          a4, s3, s0
                  fmv.w.x      fs2, t6
                  mulhu        s0, t3, t3
                  fsub.s       ft1, ft7, ft9, rtz
                  fclass.s     s11, fs8
                  fmax.s       fa7, fa5, fs2
                  sll          t5, s9, zero
                  sll          a4, s4, a5
                  sub          tp, sp, s10
                  andi         a3, a4, 1543
                  and          zero, s3, t2
                  remu         s8, gp, s9
                  fadd.s       ft8, fa0, fs10, rne
                  fle.s        a3, fs10, fs6
                  fmul.s       fs1, ft2, ft10
                  mul          a4, s8, s4
                  fsub.s       fs3, fs1, fs1
                  fadd.s       fs6, fs0, fs10
                  flt.s        a3, fs2, fa5
                  div          t1, s6, t5
                  fcvt.s.wu    ft10, a2
                  fsub.s       ft9, fs2, fs11, rne
                  fcvt.w.s     a2, fs4
                  srli         a3, ra, 7
                  fcvt.s.wu    ft7, a4
                  andi         s4, s9, 609
                  fclass.s     s8, ft5
                  sltu         gp, t4, sp
                  slli         s5, sp, 2
                  addi         s11, s8, 660
                  sll          s10, t4, a4
                  xor          s1, s3, sp
                  or           s5, s9, a0
                  fsub.s       ft11, ft2, fs3
                  fdiv.s       fs11, fs0, fa7
                  fadd.s       fs1, fs5, ft2, rup
                  sltiu        zero, gp, 1899
                  slli         tp, s3, 15
                  slti         s0, t6, 186
                  andi         s10, s1, -1465
                  auipc        s5, 805411
                  fsgnjn.s     ft7, fs4, fs6
                  sltiu        t6, t3, -1981
                  fmax.s       fa3, fa0, ft8
                  fsgnjx.s     fs6, fs8, ft1
                  fsgnjx.s     ft4, ft8, ft10
                  ori          t2, t1, 432
                  srl          t4, a3, s10
                  flt.s        zero, fs8, fs8
                  srli         ra, a0, 0
                  add          s8, s0, t4
                  fclass.s     s11, fs0
                  fmul.s       fs0, fa2, ft2
                  remu         s4, t1, gp
                  lui          zero, 274028
                  sll          s10, s11, t4
                  div          s0, s7, s5
                  mulhu        tp, gp, s10
                  fsgnjx.s     fa1, fs8, fs5
                  xori         s6, t0, -729
                  fsqrt.s      fs2, fa5
                  sltu         t2, t2, s11
                  or           a6, a3, a4
                  srai         s6, t0, 28
                  flt.s        ra, ft11, fs7
                  fsgnjn.s     fa0, ft2, ft9
                  remu         s9, t1, a7
                  fmv.w.x      fs8, t0
                  slli         a0, a7, 27
                  fdiv.s       fs5, fs2, fa5
                  add          zero, a3, t6
                  mulhsu       s5, a4, a6
                  ori          a7, s3, -2036
                  fmv.x.w      a0, fa0
                  fmin.s       ft4, ft1, ft1
                  fdiv.s       ft1, ft7, fa3, rmm
                  lui          s4, 388571
                  fcvt.w.s     a6, ft8, rup
                  srli         a3, s4, 7
                  fsqrt.s      ft6, fs11
                  addi         t5, t3, 353
                  mulhu        a4, a2, t6
                  auipc        s7, 125121
                  ori          t0, t5, -865
                  fmul.s       ft7, fs5, fa0, rup
                  fmv.w.x      ft8, s5
                  fsgnjn.s     ft6, ft0, fs6
                  remu         a3, s0, s4
                  fmv.x.w      zero, ft5
                  fmv.w.x      fs4, zero
                  slli         a2, a4, 8
                  feq.s        s8, fs2, ft11
                  fsqrt.s      ft10, fa7, rne
                  slt          s1, a4, s10
                  auipc        s1, 1031666
                  xori         a0, s4, 482
                  fclass.s     t6, fa2
                  xor          a4, t4, a1
                  slt          s4, a3, s0
                  srai         a5, a2, 3
                  feq.s        s0, fs6, ft7
                  fcvt.wu.s    t1, ft1, rne
                  fsub.s       ft7, fa4, fa2
                  auipc        s6, 718432
                  lui          s6, 940927
                  auipc        t0, 728888
                  slt          a6, s5, s9
                  addi         t0, t2, 1067
                  sra          s4, zero, a1
                  add          s7, ra, t5
                  sra          a4, sp, s1
                  fclass.s     t5, fs11
                  mul          t1, t3, s5
                  fcvt.w.s     s10, fs10
                  slti         s11, s7, -1931
                  sltu         a2, zero, a3
                  addi         s3, s2, 914
                  sll          s0, a3, s2
                  fcvt.w.s     s4, fs2, rdn
                  slli         a2, a1, 18
                  fcvt.s.wu    ft7, ra
                  and          a7, a3, a6
                  srli         t4, t5, 27
                  fmv.x.w      tp, fa1
                  fsgnjn.s     fa6, ft6, ft0
                  fsub.s       fs3, ft1, fs8
                  fsub.s       fa7, fs0, fa0, rne
                  fsgnjn.s     fa4, fa6, fa1
                  xori         s10, zero, -940
                  srli         a7, s7, 10
                  sll          s2, zero, s1
                  andi         a6, t3, -916
                  fmin.s       fs3, ft8, fa5
                  or           s8, s7, a3
                  xor          s4, t0, s5
                  slti         s10, t1, -1776
                  fcvt.s.w     fa0, a6
                  rem          s8, s4, gp
                  mulhsu       s0, s6, s0
                  fmin.s       fa3, fs1, fa3
                  divu         t2, t6, zero
                  rem          a2, gp, zero
                  slli         tp, a4, 28
                  mulhu        zero, sp, s2
                  fmin.s       fa0, fa5, ft6
                  auipc        a6, 210367
                  fdiv.s       ft9, fa6, fs8, rup
                  fmax.s       fa0, fs10, ft11
                  fadd.s       fa6, fs9, fs8
                  sra          t1, t6, a1
                  fle.s        s0, fa7, ft1
                  slt          a7, s7, s10
                  sub          s5, s9, t2
                  fcvt.s.wu    fs11, s8, rmm
                  and          t1, t5, a6
                  fsgnjx.s     fs9, ft4, fs10
                  auipc        s8, 373929
                  and          s6, t0, t0
                  add          a3, zero, s7
                  fclass.s     s0, fs3
                  sltiu        s2, s1, -905
                  srli         s2, s6, 16
                  fdiv.s       fa1, fs1, fs1, rmm
                  flt.s        a7, fs1, fs4
                  fclass.s     s0, fs6
                  sll          s9, s9, a3
                  fmv.x.w      s5, ft11
                  sll          s11, s7, a4
                  fsgnj.s      ft0, fs0, fs3
                  and          s11, ra, a3
                  ori          s0, s7, 1641
                  fcvt.s.wu    fs2, a7
                  and          s5, s2, s5
                  rem          t0, a6, t5
                  fcvt.s.wu    fa0, t6, rtz
                  mulhu        s8, a4, s4
                  fsub.s       fs5, fa0, ft3, rtz
                  srl          ra, s2, sp
                  feq.s        t0, fs11, fs9
                  add          a0, t5, s8
                  srai         a6, s6, 23
                  ori          tp, s9, 1268
                  and          t4, gp, a6
                  fmax.s       ft4, fs10, fa6
                  andi         s1, t2, -433
                  mul          zero, a1, a7
                  fclass.s     a0, fs3
                  fmv.x.w      s1, ft6
                  fmv.x.w      s0, fa6
                  srai         gp, a6, 12
                  slti         s3, t0, 941
                  ori          ra, a6, 1146
                  andi         t2, t5, -1173
                  div          s6, t0, a5
                  srli         ra, t5, 25
                  srai         t0, gp, 21
                  rem          s7, a7, s1
                  fcvt.s.w     fa1, tp
                  fmin.s       ft1, fs7, ft6
                  srai         s3, a0, 20
                  fdiv.s       fs7, ft5, fa4
                  rem          a0, s7, ra
                  div          s7, tp, a4
                  mulhsu       t1, s2, a5
                  feq.s        ra, ft6, fs0
                  or           a4, t2, s4
                  ori          a6, t4, 427
                  add          s11, ra, sp
                  srl          s8, a5, ra
                  xor          a7, s5, a7
                  fsqrt.s      ft8, fa0
                  fsub.s       fa4, ft11, ft3
                  div          s0, s7, t3
                  srl          a4, s0, t6
                  mulhu        s0, s3, a5
                  fcvt.wu.s    t0, fs5
                  fmin.s       fs1, fs7, ft9
                  sll          s10, s5, zero
                  andi         t2, s7, -1569
                  ori          t6, a6, -314
                  fsgnjn.s     ft5, ft10, fa2
                  rem          a4, a6, a4
                  fmul.s       ft2, fs11, ft1
                  nop
                  fcvt.w.s     t5, fs10, rmm
                  fcvt.s.wu    ft3, a4, rdn
                  fsgnj.s      fa3, ft3, fs11
                  andi         ra, s10, 1392
                  slli         s11, t5, 27
                  sll          zero, sp, tp
                  fmin.s       fa4, fs10, fs1
                  auipc        a2, 273548
                  and          s5, a7, tp
                  fclass.s     s9, fs9
                  remu         s8, sp, t1
                  sra          s6, tp, s4
                  fcvt.s.wu    ft0, t5
                  fcvt.w.s     a2, fs11
                  fmul.s       ft1, fs2, ft10
                  srai         zero, a4, 22
                  sub          s1, t6, s6
                  add          s9, a2, a0
                  fdiv.s       ft0, ft4, fs3
                  fcvt.wu.s    s9, fa7, rne
                  fcvt.wu.s    t1, fa3
                  fle.s        t1, fs10, ft7
                  mul          a4, sp, t1
                  fsqrt.s      fs4, ft9
                  sll          s11, zero, s8
                  fsqrt.s      fs2, ft3
                  fclass.s     a5, ft11
                  xori         a4, tp, 1468
                  fcvt.s.wu    fa1, s5
                  fcvt.s.wu    ft3, a4, rne
                  sll          s6, a4, a3
                  fsqrt.s      fa6, fa1
                  slt          s4, s3, a1
                  lui          s2, 986037
                  fdiv.s       fs3, ft3, ft10
                  fsub.s       ft10, fa6, ft0, rne
                  fmv.x.w      s3, fa0
                  sltu         a3, t5, s8
                  add          a0, s3, sp
                  and          a2, tp, s10
                  fcvt.wu.s    gp, fs8, rne
                  sra          s7, a1, t6
                  fcvt.w.s     s7, fs6
                  mul          t0, s5, t0
                  fmv.w.x      fs9, ra
                  lui          s6, 259139
                  auipc        t5, 45857
                  mul          a4, sp, s9
                  fsgnjn.s     ft7, fa4, fs0
                  feq.s        t6, fs9, ft6
                  sltu         a5, t4, a5
                  nop
                  lui          ra, 340476
                  xor          t1, a3, s6
                  fmv.x.w      s3, fs4
                  fsgnjn.s     ft6, fa5, fs9
                  add          ra, s0, s3
                  mul          t1, s5, t4
                  fadd.s       ft8, ft10, fs4, rmm
                  fmv.x.w      s3, fs10
                  flt.s        s3, ft9, ft5
                  rem          s3, s11, t2
                  fcvt.s.w     ft7, zero, rne
                  feq.s        ra, ft8, fa1
                  lui          s0, 418216
                  and          a4, s7, a6
                  fmv.x.w      gp, fa3
                  fsub.s       fa7, fs3, fs6
                  sltu         a4, s10, s8
                  fsqrt.s      ft7, fa2
                  divu         a4, ra, s8
                  xor          tp, s3, a2
                  fsgnjn.s     fs10, fs9, fs2
                  slt          t4, ra, a2
                  remu         s9, t5, s6
                  div          s11, s3, a3
                  srai         ra, s9, 1
                  sltiu        a5, s10, -1841
                  fsgnj.s      ft11, fa2, ft10
                  slli         s9, a2, 18
                  or           a4, a1, s3
                  remu         t2, t6, t0
                  nop
                  mulh         s4, a7, ra
                  divu         s6, t5, a7
                  xor          s6, a3, t4
                  fmin.s       fs5, ft4, fs2
                  fsgnj.s      fs8, fs4, fs0
                  sltiu        s1, t3, -684
                  rem          a4, s9, s7
                  mulhsu       gp, t5, s4
                  rem          s6, s5, s10
                  flt.s        t4, fs4, ft1
                  fcvt.s.w     fs7, s0
                  auipc        t2, 910537
                  srai         a6, ra, 31
                  fmul.s       fs2, ft0, fs9
                  fmin.s       ft7, fa7, ft10
                  div          a5, a0, t5
                  fadd.s       fa1, fs2, fa0, rne
                  fcvt.s.w     fa5, s5, rup
                  feq.s        a0, ft4, ft7
                  sll          s9, t2, t1
                  fsqrt.s      ft7, ft7
                  fsgnjn.s     ft10, ft6, fs5
                  mul          gp, gp, t2
                  slti         s8, s1, 1503
                  fcvt.wu.s    gp, fs0, rdn
                  lui          a5, 121984
                  fcvt.wu.s    a4, fs8, rdn
                  flt.s        s7, ft10, fa6
                  flt.s        s6, fs8, ft3
                  srl          a7, s0, tp
                  fsub.s       fa7, fs2, fs11
                  fsqrt.s      fs5, ft7
                  nop
                  fsgnj.s      ft10, ft2, ft11
                  srl          gp, a1, t6
                  sra          s6, s7, s4
                  fcvt.w.s     s9, fa0, rtz
                  andi         a5, s9, 1875
                  ori          s2, t1, -224
                  xori         tp, t1, -235
                  sltiu        t1, s1, -176
                  slt          t2, s8, a5
                  sltiu        s7, s3, 1928
                  divu         t5, a1, t5
                  mul          a5, s4, s11
                  sltiu        zero, s7, 1344
                  srl          tp, a2, a3
                  add          a5, zero, s4
                  fsgnj.s      fa7, fa6, fs9
                  andi         t4, sp, 1073
                  mulhsu       s7, s11, t3
                  slli         s7, s4, 21
                  xor          s10, s5, s0
                  sll          s9, t4, s5
                  sub          tp, s2, t3
                  or           s0, t0, a0
                  srli         s5, t5, 0
                  srai         s0, s7, 17
                  rem          a5, s9, t1
                  srli         t6, t5, 30
                  slt          s3, a1, a2
                  fcvt.wu.s    s9, ft7
                  slli         t1, a4, 24
                  ori          s6, s2, 813
                  fmv.w.x      fa0, s0
                  fmul.s       ft1, ft3, fa4, rne
                  fmax.s       ft0, fa2, fs2
                  sltu         s2, a7, s8
                  mulhsu       a7, s11, s11
                  fcvt.s.wu    fs4, a2
                  fclass.s     s9, fa7
                  slti         a6, s0, -1747
                  fcvt.wu.s    zero, fa7
                  lui          s5, 527967
                  fdiv.s       ft11, fa1, fs8, rne
                  nop
                  sub          s10, a4, a1
                  fsgnjn.s     fs3, ft0, ft2
                  flt.s        s2, fa5, fs10
                  fmin.s       fa7, fs7, fa2
                  feq.s        t4, ft9, fa5
                  fcvt.wu.s    a6, ft2, rdn
                  sltu         zero, t5, s3
                  fsub.s       fs4, fs3, fs5, rmm
                  add          ra, t3, t0
                  fcvt.w.s     gp, fa2, rup
                  andi         a2, a6, 1423
                  and          a7, a5, gp
                  xori         a3, a4, 51
                  fle.s        s8, fa2, ft10
                  remu         t1, a7, s5
                  fle.s        s5, ft9, ft8
                  fmin.s       fs8, fa2, ft7
                  sra          s10, t3, a5
                  div          s10, a5, a3
                  fadd.s       fa3, fs2, fa3
                  sra          t5, s5, sp
                  auipc        a7, 679459
                  flt.s        ra, ft9, fa5
                  fsgnj.s      ft4, fa4, fs0
                  sltu         s7, zero, s3
                  feq.s        s7, ft4, fa4
                  flt.s        s3, ft4, ft7
                  flt.s        s9, fa4, fs5
                  fmin.s       fa0, ft8, fa7
                  fdiv.s       fa7, fs4, fs8, rup
                  xori         ra, zero, 684
                  slt          a7, ra, a7
                  mulhsu       s1, s2, a3
                  sra          s11, ra, s7
                  fcvt.w.s     s3, ft5, rmm
                  div          t5, a7, s1
                  auipc        a6, 884911
                  addi         s9, ra, 1912
                  sra          a4, s4, s1
                  auipc        a6, 361537
                  xori         a5, s8, 586
                  srl          t2, sp, gp
                  divu         ra, s8, s5
                  fsgnj.s      fs3, fs2, fs3
                  sltu         t1, s8, a4
                  fcvt.s.w     ft4, a3
                  fsgnjx.s     fs1, fa2, ft8
                  auipc        t2, 229740
                  fsgnjx.s     fs6, ft9, fa1
                  fdiv.s       fa6, fa1, ft10, rmm
                  srai         a4, s0, 10
                  fsub.s       fs6, ft7, fs7, rtz
                  add          s2, a6, t1
                  fsgnjx.s     fa6, fs6, fs4
                  feq.s        t4, fs5, ft6
                  mul          t6, s7, a6
                  fmv.x.w      t6, ft3
                  fmax.s       ft0, fa2, ft4
                  addi         s1, a2, -1047
                  rem          t1, sp, a5
                  divu         s0, s1, t5
                  remu         tp, gp, s3
                  sltiu        s1, ra, 1534
                  sltu         s10, s7, t2
                  fcvt.w.s     a5, ft10
                  slli         s9, t4, 21
                  or           t5, a4, s5
                  ori          a4, a0, 602
                  fcvt.s.wu    fs8, t1, rtz
                  fcvt.wu.s    a2, fs2, rdn
                  feq.s        t6, fa6, fs9
                  mulhsu       ra, t1, a5
                  srai         t5, ra, 16
                  fle.s        t4, ft8, ft8
                  fcvt.wu.s    s5, ft10, rdn
                  andi         t2, s1, -253
                  or           t5, tp, a4
                  ori          t6, gp, -965
                  lui          s8, 954485
                  fdiv.s       fs6, fs3, fa1, rdn
                  srli         s5, s2, 12
                  auipc        ra, 490867
                  fmin.s       fs1, fs10, ft3
                  sltiu        a0, s8, 1609
                  mulh         gp, t5, t5
                  mulhsu       s3, t1, sp
                  fsqrt.s      fs9, ft5
                  div          t4, a0, s3
                  mulhsu       tp, a5, s8
                  slti         s0, s5, -622
                  slt          a2, s10, s0
                  fsgnj.s      fs11, ft7, fs0
                  fadd.s       fa1, fs4, fs7
                  fcvt.w.s     zero, ft11, rdn
                  fadd.s       fs10, fa3, fa0
                  rem          s10, a5, s5
                  fmv.x.w      s4, fs11
                  fle.s        t4, fa2, fs8
                  nop
                  div          t4, s11, s0
                  sll          tp, a7, t4
                  mul          s11, t5, t0
                  sltiu        a5, t6, 294
                  fmax.s       fs7, fa6, fa5
                  srl          s5, gp, t3
                  fle.s        a5, fa0, fs10
                  auipc        s6, 20011
                  slli         s0, s6, 12
                  addi         s3, t6, -1790
                  auipc        a0, 442310
                  fsub.s       fs9, fs0, ft11, rmm
                  mulh         s2, s1, a3
                  mul          tp, gp, s5
                  slt          a5, a6, t6
                  fsgnj.s      fa1, ft3, ft8
                  sll          t4, t5, s5
                  srai         s3, s2, 1
                  srl          t4, a3, a0
                  nop
                  flt.s        s3, fs5, ft0
                  feq.s        s10, ft6, ft9
                  fle.s        t5, fa3, fa5
                  fle.s        t6, fs4, ft6
                  fmv.w.x      fa5, a3
                  mulhsu       t2, a1, a0
                  fcvt.s.wu    fa2, a6
                  fmin.s       fs6, fa3, fs7
                  slt          a5, a1, s9
                  nop
                  mulhu        t2, s3, s9
                  fadd.s       ft4, fs9, fs4
                  ori          a7, t4, -1984
                  and          s4, s2, s4
                  fdiv.s       fs1, fs11, fs0, rne
                  fsgnjx.s     fa0, ft7, fs7
                  sltiu        t6, t1, 336
                  fcvt.wu.s    s5, fa6
                  fclass.s     a6, fa0
                  ori          s9, t2, -531
                  sltiu        a6, t5, 1503
                  rem          a7, t6, t6
                  lui          s2, 953474
                  div          t4, s9, t5
                  sltu         ra, s9, s9
                  sll          zero, s3, s8
                  fsub.s       ft5, fs0, fa6
                  ori          a0, s10, -43
                  sltiu        gp, s11, -1975
                  fsgnjn.s     ft10, ft4, ft3
                  addi         s8, t1, -814
                  add          s6, s2, s4
                  la x2, test_done
                  jalr x0, x2, 0
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
                  addi x11, x11, -4
                  sw  x28, (x11)
                  add x28, x11, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x11, x28, zero
                  csrr x16, 0x300 # MSTATUS
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 31
                  bne x16, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x16, 0x341 # MEPC
                  csrr x16, 0x342 # MCAUSE
                  li x8, 0x3 # BREAKPOINT
                  beq x16, x8, ebreak_handler
                  li x8, 0x8 # ECALL_UMODE
                  beq x16, x8, ecall_handler
                  li x8, 0x9 # ECALL_SMODE
                  beq x16, x8, ecall_handler
                  li x8, 0xb # ECALL_MMODE
                  beq x16, x8, ecall_handler
                  li x8, 0x1
                  beq x16, x8, instr_fault_handler
                  li x8, 0x5
                  beq x16, x8, load_fault_handler
                  li x8, 0x7
                  beq x16, x8, store_fault_handler
                  li x8, 0xc
                  beq x16, x8, pt_fault_handler
                  li x8, 0xd
                  beq x16, x8, pt_fault_handler
                  li x8, 0xf
                  beq x16, x8, pt_fault_handler
                  li x8, 0x2 # ILLEGAL_INSTRUCTION
                  beq x16, x8, illegal_instr_handler
                  csrr x8, 0x343 # MTVAL
                  1: la x2, test_done
                  jalr x1, x2, 0

ecall_handler:    
                  la x16, _start
                  sw x0, 0(x16)
                  sw x1, 4(x16)
                  sw x2, 8(x16)
                  sw x3, 12(x16)
                  sw x4, 16(x16)
                  sw x5, 20(x16)
                  sw x6, 24(x16)
                  sw x7, 28(x16)
                  sw x8, 32(x16)
                  sw x9, 36(x16)
                  sw x10, 40(x16)
                  sw x11, 44(x16)
                  sw x12, 48(x16)
                  sw x13, 52(x16)
                  sw x14, 56(x16)
                  sw x15, 60(x16)
                  sw x16, 64(x16)
                  sw x17, 68(x16)
                  sw x18, 72(x16)
                  sw x19, 76(x16)
                  sw x20, 80(x16)
                  sw x21, 84(x16)
                  sw x22, 88(x16)
                  sw x23, 92(x16)
                  sw x24, 96(x16)
                  sw x25, 100(x16)
                  sw x26, 104(x16)
                  sw x27, 108(x16)
                  sw x28, 112(x16)
                  sw x29, 116(x16)
                  sw x30, 120(x16)
                  sw x31, 124(x16)
                  la x2, write_tohost
                  jalr x0, x2, 0

instr_fault_handler:
                  add x28, x11, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x11, x28, zero
                  lw  x28, (x11)
                  addi x11, x11, 4
                  mret

load_fault_handler:
                  add x28, x11, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x11, x28, zero
                  lw  x28, (x11)
                  addi x11, x11, 4
                  mret

store_fault_handler:
                  add x28, x11, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x11, x28, zero
                  lw  x28, (x11)
                  addi x11, x11, 4
                  mret

ebreak_handler:   
                  csrr  x16, 0x341
                  addi  x16, x16, 4
                  csrw  0x341, x16
                  add x28, x11, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x11, x28, zero
                  lw  x28, (x11)
                  addi x11, x11, 4
                  mret

illegal_instr_handler:
                  csrr  x16, 0x341
                  addi  x16, x16, 4
                  csrw  0x341, x16
                  add x28, x11, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x11, x28, zero
                  lw  x28, (x11)
                  addi x11, x11, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x16, 0x300 # MSTATUS;
                  csrr  x16, 0x304 # MIE;
                  csrr  x16, 0x344 # MIP;
                  csrrc x16, 0x344, x16 # MIP;
                  add x28, x11, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x11, x28, zero
                  lw  x28, (x11)
                  addi x11, x11, 4
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
