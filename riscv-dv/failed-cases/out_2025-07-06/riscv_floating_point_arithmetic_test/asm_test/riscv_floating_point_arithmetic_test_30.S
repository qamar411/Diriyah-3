.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x21, h0_start
jalr x0, x21, 0
h0_start:
                  li x5, 0x40001120
                  csrw 0x301, x5
kernel_sp:        
                  la x30, kernel_stack_end

trap_vec_init:    
                  la x5, mtvec_handler
                  ori x5, x5, 1
                  csrw 0x305, x5 # MTVEC

mepc_setup:       
                  la x5, init
                  csrw 0x341, x5

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x5, 0x3800
                  csrw 0x300, x5 # MSTATUS
                  li x5, 0x0
                  csrw 0x304, x5 # MIE
                  mret
init:             
                  li x5, 0
                  fmv.w.x f0, x5
                  li x5, 2148524496
                  fmv.w.x f1, x5
                  li x5, 4286578688
                  fmv.w.x f2, x5
                  li x5, 3309876924
                  fmv.w.x f3, x5
                  li x5, 2153736339
                  fmv.w.x f4, x5
                  li x5, 2139095041
                  fmv.w.x f5, x5
                  li x5, 4286578687
                  fmv.w.x f6, x5
                  li x5, 4286578688
                  fmv.w.x f7, x5
                  li x5, 2143289344
                  fmv.w.x f8, x5
                  li x5, 4835801
                  fmv.w.x f9, x5
                  li x5, 2407387973
                  fmv.w.x f10, x5
                  li x5, 4286578688
                  fmv.w.x f11, x5
                  li x5, 0
                  fmv.w.x f12, x5
                  li x5, 1200817
                  fmv.w.x f13, x5
                  li x5, 0
                  fmv.w.x f14, x5
                  li x5, 4286578687
                  fmv.w.x f15, x5
                  li x5, 4286578688
                  fmv.w.x f16, x5
                  li x5, 2143289344
                  fmv.w.x f17, x5
                  li x5, 0
                  fmv.w.x f18, x5
                  li x5, 2147483648
                  fmv.w.x f19, x5
                  li x5, 4286578687
                  fmv.w.x f20, x5
                  li x5, 2143289344
                  fmv.w.x f21, x5
                  li x5, 2139095041
                  fmv.w.x f22, x5
                  li x5, 4286578688
                  fmv.w.x f23, x5
                  li x5, 4286578688
                  fmv.w.x f24, x5
                  li x5, 2139095040
                  fmv.w.x f25, x5
                  li x5, 4286578687
                  fmv.w.x f26, x5
                  li x5, 2139095041
                  fmv.w.x f27, x5
                  li x5, 4286578688
                  fmv.w.x f28, x5
                  li x5, 2768713730
                  fmv.w.x f29, x5
                  li x5, 2143289344
                  fmv.w.x f30, x5
                  li x5, 2139095041
                  fmv.w.x f31, x5
                  fsrmi 1
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x3, 0xf
                  li x4, 0x80000000
                  li x5, 0xe081a631
                  li x6, 0x0
                  li x7, 0x0
                  li x8, 0x91735583
                  li x9, 0x80000000
                  li x10, 0xf98ddcce
                  li x11, 0x80000000
                  li x12, 0xf5973e27
                  li x13, 0xf9ce475d
                  li x14, 0xfc65549b
                  li x15, 0x0
                  li x16, 0x80000000
                  li x17, 0xe1edaf35
                  li x18, 0x9cf95e8c
                  li x19, 0x80000000
                  li x20, 0x3
                  li x21, 0xbed7c046
                  li x22, 0x80000000
                  li x23, 0xfd53374e
                  li x24, 0x3
                  li x25, 0x80000000
                  li x26, 0x80000000
                  li x27, 0x4a2e5a12
                  li x28, 0x5
                  li x29, 0x90db8b2b
                  li x31, 0x80000000
                  la x2, user_stack_end
main:             andi         t6, a4, 1631
                  flt.s        ra, fs9, ft5
                  remu         t3, s1, t6
                  fdiv.s       fs6, ft8, ft9
                  fcvt.s.wu    fs1, t4
                  fmin.s       fa5, fs7, ft9
                  sll          t2, s5, zero
                  sltu         zero, s10, t6
                  sra          a6, a1, zero
                  divu         gp, s11, t4
                  feq.s        a0, ft8, ft4
                  mulh         t2, sp, s1
                  fcvt.w.s     a0, fa6, rtz
                  fle.s        t1, fa6, fs9
                  flt.s        a6, fa5, ft3
                  fsgnjn.s     ft8, ft8, fs7
                  andi         s4, ra, 1396
                  div          a6, s6, s4
                  divu         s8, sp, s10
                  nop
                  fmin.s       fs2, fa5, ft7
                  fsub.s       ft3, fs11, fa5
                  slli         a5, s1, 12
                  rem          a4, a1, a2
                  fsgnj.s      fa1, ft3, ft4
                  remu         s1, s1, a3
                  fmv.x.w      t2, ft5
                  fmul.s       fs4, ft7, ft0, rmm
                  fadd.s       fs9, ft4, fs11
                  fsgnjn.s     fs4, fs2, fs3
                  divu         s0, tp, s5
                  xori         s2, s8, -37
                  mulh         t1, sp, gp
                  xor          a6, s0, t6
                  srl          zero, gp, a4
                  fmax.s       ft7, fs7, fa6
                  mulhu        a2, a5, s8
                  lui          s1, 675706
                  sra          a1, s6, s5
                  fsub.s       ft4, ft8, fs8, rdn
                  rem          a4, a5, sp
                  xori         a6, s10, 1359
                  mul          t1, s9, s3
                  auipc        a5, 373812
                  sltu         s1, tp, s11
                  fmin.s       fa3, fa1, fs10
                  lui          s0, 178377
                  srl          s1, a4, a0
                  add          s10, s11, t0
                  auipc        a5, 294649
                  fcvt.s.w     fs7, s10
                  slti         a5, gp, -258
                  rem          s9, s9, a0
                  xori         gp, s7, 1873
                  xori         gp, s2, 1567
                  fmin.s       ft8, ft7, fs6
                  slli         s3, s10, 26
                  mulhsu       s8, t6, a7
                  add          t6, sp, s9
                  fmax.s       fa5, ft11, fa5
                  mulhsu       s10, t1, s1
                  fmv.x.w      s2, fa5
                  slti         s8, s7, -456
                  divu         a1, s6, s3
                  nop
                  sra          gp, a5, s8
                  srli         s11, a5, 11
                  fmul.s       fs6, fa6, ft4, rmm
                  mulh         s2, s9, s9
                  fmax.s       fa2, ft11, fs7
                  fsub.s       fs6, fs2, fs5
                  ori          s9, s8, -1
                  fcvt.wu.s    t6, fs5
                  xori         a2, t2, -632
                  feq.s        t4, ft4, fa4
                  fmv.x.w      s11, fs5
                  xori         a6, a3, -248
                  remu         a1, t4, t5
                  addi         t1, t0, -1170
                  fmul.s       ft0, ft4, fa6
                  sltu         t6, s9, t6
                  xori         tp, t3, 2040
                  divu         a0, t0, a1
                  andi         a6, s9, 917
                  lui          s10, 625029
                  add          s7, t2, a6
                  mulhu        t2, ra, zero
                  mulhu        zero, t2, tp
                  nop
                  fadd.s       fa1, fs6, fa7
                  sltiu        a3, a2, -1007
                  sra          tp, s0, t0
                  sll          t4, ra, s11
                  srl          s6, a7, zero
                  flt.s        ra, fs1, ft4
                  fadd.s       fs5, fa3, ft4, rdn
                  fmin.s       fa7, fa7, ft2
                  srli         a0, s2, 23
                  andi         t2, t0, 1711
                  or           s7, t3, a4
                  xor          a6, t1, s2
                  fcvt.s.wu    fs9, s11, rup
                  or           s6, a2, s2
                  srai         a0, t5, 10
                  fmv.w.x      ft8, a4
                  slli         a3, s7, 24
                  mul          a7, t4, ra
                  mulhu        a6, a4, s6
                  slli         t1, a7, 17
                  fmax.s       fs5, fs7, fs6
                  fclass.s     s9, fs7
                  fadd.s       ft5, fs0, ft11, rmm
                  slt          s6, a7, s9
                  fadd.s       fs1, fa4, fa1
                  flt.s        s1, ft6, fa0
                  add          a6, t1, t2
                  fsgnjn.s     fa6, fs8, fa6
                  divu         t2, s0, t6
                  fcvt.wu.s    a4, fs10, rne
                  xori         s9, s2, 1448
                  srai         t2, s0, 26
                  fsqrt.s      fs10, fa2
                  fmax.s       ft4, fs1, fs10
                  divu         s4, a5, a5
                  fle.s        t3, fa1, fa2
                  fsub.s       ft11, ft1, ft7
                  fle.s        s0, ft0, ft6
                  slli         ra, t3, 19
                  addi         t3, s1, -498
                  ori          s8, t2, -1061
                  xor          s11, t5, s11
                  fsgnj.s      fs6, fa1, ft11
                  sub          gp, ra, s7
                  mulhsu       s8, a4, gp
                  sltiu        a7, a6, 316
                  lui          s8, 955904
                  fcvt.w.s     t4, fs4, rne
                  and          t4, a6, ra
                  fsqrt.s      fa6, fs5
                  sltiu        tp, s1, 1400
                  feq.s        s8, ft4, ft6
                  mulh         a1, t3, zero
                  fcvt.wu.s    s0, fs9
                  fsub.s       fa6, ft5, fa4, rne
                  srai         a2, a7, 18
                  fadd.s       ft7, fs7, fa3, rdn
                  divu         t3, ra, s3
                  remu         s11, s1, a3
                  fsub.s       fs3, fa4, ft2
                  divu         s2, s3, s3
                  divu         zero, t4, s9
                  auipc        zero, 817226
                  or           s3, s8, t0
                  fsqrt.s      fa4, ft6, rdn
                  fcvt.s.w     ft1, t5, rtz
                  slli         a7, s4, 29
                  fmul.s       fs10, fs3, fs2
                  nop
                  fsqrt.s      fs9, ft10, rtz
                  sub          a4, s10, t6
                  auipc        tp, 322313
                  fdiv.s       fa6, fs0, fs5
                  remu         gp, s9, tp
                  flt.s        t3, ft11, fa5
                  nop
                  fle.s        gp, fs3, ft4
                  fmv.x.w      t0, fa2
                  or           a3, s3, s10
                  mul          s2, a4, sp
                  andi         a0, s5, 79
                  fsqrt.s      fa1, fs8
                  nop
                  fclass.s     a2, ft11
                  fmax.s       fs3, fs3, fs11
                  fle.s        a4, fs2, fs10
                  nop
                  addi         tp, a2, 1511
                  feq.s        s11, fs8, ft4
                  srli         a1, t2, 9
                  srai         t4, s0, 11
                  srl          t2, tp, ra
                  fmul.s       ft0, fs6, fs8, rne
                  ori          t4, t0, -197
                  fmv.w.x      fa0, s7
                  remu         s6, s8, s9
                  or           t2, t4, a4
                  srl          s11, s4, s9
                  srli         s0, s10, 0
                  fle.s        s0, ft3, fs10
                  andi         s9, s10, -878
                  xor          gp, s10, a6
                  fadd.s       fs2, ft0, ft1
                  lui          s1, 250577
                  sub          a4, t4, a5
                  mulh         t0, t0, t1
                  xori         t6, a7, 687
                  feq.s        a5, ft9, ft4
                  and          a1, a7, t0
                  fsgnjn.s     fa2, fs10, fs6
                  mulhsu       t2, s7, t3
                  nop
                  srli         s3, a3, 13
                  sub          a2, t5, s7
                  sll          t4, s6, s10
                  slli         s2, gp, 6
                  mulhsu       a3, sp, a1
                  div          a7, t5, a4
                  or           t1, a1, s4
                  mul          a0, sp, s3
                  mul          a3, t1, a2
                  sltiu        zero, s0, -521
                  feq.s        s2, fs8, fs11
                  fcvt.s.wu    ft4, zero
                  fsgnjx.s     ft10, ft11, fs3
                  fadd.s       ft3, ft11, fs7
                  andi         s1, a4, -1995
                  ori          t0, t3, -795
                  xor          s4, t6, zero
                  sra          a1, s11, t1
                  srli         s4, t3, 29
                  slt          a3, s10, s2
                  srl          s8, t1, a2
                  mulhsu       s2, gp, sp
                  fcvt.s.w     fa3, a5
                  rem          s6, s7, s8
                  fsub.s       fs4, ft11, fs11, rmm
                  fcvt.s.wu    ft10, a6
                  feq.s        s11, ft10, fa7
                  fadd.s       ft3, ft7, fs5
                  fmin.s       fs9, fs5, fa3
                  fsgnj.s      fa6, fs5, fs6
                  fle.s        t2, ft6, fa4
                  fsgnjn.s     ft1, fs4, ft3
                  fcvt.s.w     ft7, a6, rup
                  fsgnj.s      fs5, fs10, fs11
                  fclass.s     a4, ft6
                  srli         s1, t3, 10
                  sltu         gp, s10, s6
                  fsgnjx.s     fa3, ft6, fs3
                  sra          a1, t1, a6
                  srai         a0, t2, 2
                  sll          a5, t1, t3
                  fsgnjn.s     fs1, ft0, ft9
                  slti         t1, s6, -944
                  fsgnjn.s     ft10, fs9, ft6
                  rem          a2, a1, s10
                  sltiu        t6, gp, -971
                  ori          a7, gp, -898
                  fcvt.w.s     s9, fs5, rup
                  fmax.s       fa4, ft0, ft0
                  fsgnj.s      ft7, fa1, ft11
                  srl          a7, a0, s9
                  xori         s4, a1, -1645
                  fcvt.w.s     zero, ft4
                  flt.s        t2, fs11, fs11
                  rem          s11, sp, s2
                  srli         s7, t3, 13
                  remu         t3, s9, s5
                  fsgnjx.s     fs9, ft2, fa5
                  andi         a7, s11, -1240
                  andi         s4, sp, -600
                  sltiu        s8, a3, -1136
                  flt.s        s3, ft0, fa2
                  fle.s        s8, ft8, ft4
                  remu         zero, a2, t6
                  mulh         tp, sp, s1
                  addi         tp, tp, 1270
                  div          s11, t5, zero
                  slti         s2, s0, 290
                  slli         s3, ra, 0
                  sra          tp, sp, t0
                  xori         s0, a6, -1973
                  flt.s        a4, ft2, fa7
                  mulhsu       s7, a3, a5
                  fsgnjn.s     fs9, fs8, fa7
                  addi         s6, ra, -487
                  and          s9, a6, s4
                  fmv.x.w      s10, fa2
                  sra          s10, a6, t0
                  divu         s10, s8, t3
                  fadd.s       fa4, ft2, fa7
                  fmv.w.x      ft7, s6
                  mulhsu       t3, s8, a5
                  srai         s8, s8, 16
                  srai         a6, gp, 19
                  flt.s        a0, ft1, ft6
                  remu         s11, t5, s1
                  or           s3, s5, s10
                  and          ra, a2, s1
                  slti         a1, s10, -29
                  fsub.s       fa6, fa2, ft4
                  slli         s9, a7, 1
                  sra          s3, t5, a2
                  nop
                  rem          t2, t2, sp
                  sltiu        s10, t4, -147
                  fcvt.wu.s    t0, ft6
                  mulhu        t4, ra, s10
                  rem          a4, a0, t1
                  div          a6, t5, t3
                  xori         zero, t2, -1609
                  sll          a0, a6, s3
                  slli         s0, gp, 15
                  add          a6, a0, t0
                  and          s0, s10, s7
                  ori          a0, s4, -826
                  sra          a1, s1, sp
                  mulh         a7, a3, s6
                  xor          s0, t2, sp
                  sra          s9, a2, t5
                  xor          s8, t5, t4
                  fsub.s       ft4, fs1, fs11, rne
                  mulhsu       t6, a3, t2
                  andi         s11, t5, -1705
                  and          a5, a5, s5
                  fcvt.w.s     a2, ft6, rtz
                  rem          gp, t4, s0
                  fle.s        s1, fa0, fs2
                  lui          t6, 974560
                  fcvt.w.s     t1, fs2
                  fcvt.s.w     fa3, a4, rdn
                  slli         s7, s7, 17
                  slli         a0, gp, 10
                  fle.s        t2, ft9, fs3
                  fsgnj.s      ft4, fs2, ft4
                  fclass.s     t3, ft2
                  fsgnj.s      fs8, ft7, ft2
                  fcvt.s.w     fs0, a1
                  slt          s6, a4, t1
                  andi         s2, a7, -1890
                  srai         s1, s11, 26
                  and          a0, s4, t6
                  rem          s10, s6, s11
                  fdiv.s       ft1, ft11, fa4
                  slti         s3, s0, 1019
                  fsgnjx.s     fs4, fs4, ft2
                  slt          t4, tp, t0
                  nop
                  div          zero, a1, t0
                  add          a2, t6, a6
                  rem          s1, s4, a7
                  mulhsu       ra, s1, t3
                  feq.s        s4, ft7, ft11
                  rem          gp, a6, a3
                  fsgnj.s      fs5, ft7, fs6
                  fmul.s       ft4, ft10, fs8, rup
                  sub          t2, t5, s5
                  fmax.s       fs2, ft7, ft11
                  fmax.s       fs10, fa7, fa2
                  sltu         s3, sp, s2
                  slt          t4, s6, s8
                  xor          s0, tp, t0
                  ori          s4, a3, -1820
                  fsgnjx.s     fs2, ft7, fs5
                  lui          t2, 652684
                  div          t6, t3, a5
                  feq.s        s4, fa3, fs10
                  or           s10, a5, a2
                  feq.s        a0, fa6, ft4
                  fsqrt.s      fs0, fa0, rtz
                  xori         a2, a0, -1627
                  mul          ra, a4, ra
                  fcvt.s.w     ft4, a1
                  mul          a2, a3, a6
                  srai         t4, s11, 13
                  slti         s1, t2, 224
                  fcvt.s.w     ft6, t2
                  add          a7, a2, s2
                  fcvt.wu.s    a6, fa4, rmm
                  srli         s9, s7, 11
                  fcvt.s.wu    fa7, t6, rtz
                  add          t6, t6, t6
                  and          a4, s4, s5
                  srli         s9, a0, 26
                  fmv.x.w      s4, fa0
                  divu         a7, s9, s2
                  xori         s8, s2, -194
                  fcvt.w.s     zero, fs5, rtz
                  fcvt.wu.s    ra, fa1, rdn
                  fdiv.s       fs9, ft10, ft8
                  xori         a5, s5, -1259
                  fcvt.w.s     s6, fs8, rdn
                  nop
                  lui          s8, 241826
                  fcvt.wu.s    a2, ft9
                  slti         s11, zero, 1704
                  remu         s3, tp, s8
                  and          a6, a2, sp
                  sra          t2, s10, a3
                  flt.s        a2, ft6, fs5
                  slti         a1, s1, -68
                  slt          zero, s1, a6
                  rem          s8, t2, s5
                  lui          s1, 81690
                  lui          a0, 803590
                  remu         gp, s9, s7
                  fclass.s     a4, fs6
                  fmin.s       fs6, fs9, fs10
                  fdiv.s       fa6, fa5, fa7
                  addi         s6, t4, -1958
                  mulh         s6, a2, a2
                  fsgnjn.s     ft4, fs2, fa6
                  fmul.s       fs7, fa6, ft7
                  fmax.s       fs4, fs2, ft11
                  div          zero, t1, s9
                  xor          s11, tp, a1
                  fsgnj.s      fa3, ft6, fa0
                  lui          t0, 431756
                  fcvt.w.s     s7, ft4, rne
                  sltiu        a6, s2, -1934
                  fclass.s     s7, fa7
                  mulh         s8, t5, s11
                  fmax.s       fs7, fs9, fs10
                  fcvt.w.s     a4, fs3, rmm
                  fsub.s       fs10, ft5, ft5
                  and          t3, tp, s7
                  fclass.s     s11, fs10
                  srai         t2, tp, 30
                  fcvt.s.wu    ft6, s2, rmm
                  remu         a4, s1, s0
                  fadd.s       ft3, fa1, ft1
                  mulhsu       zero, s3, a5
                  fcvt.wu.s    s7, fs4
                  srai         t6, t4, 13
                  feq.s        ra, fs1, fa4
                  mulh         s4, s0, s5
                  fsub.s       ft6, fa6, fs4
                  andi         a0, s4, -1211
                  remu         a0, a7, a0
                  fmul.s       ft0, ft8, ft3, rtz
                  mulhu        a0, s1, s10
                  flt.s        s6, fs10, ft11
                  fcvt.s.w     fs6, t5
                  fcvt.s.wu    ft9, t0, rtz
                  fsub.s       fs7, fs3, ft1
                  fsqrt.s      fs8, fa1, rne
                  xori         a6, s1, -398
                  nop
                  fmv.w.x      ft2, s6
                  sll          t0, s7, s9
                  fmv.w.x      fs10, a4
                  fmul.s       fs8, fa0, fs2, rup
                  fmax.s       ft7, fa7, ft9
                  fle.s        t1, fs3, ft5
                  nop
                  fsgnjn.s     fs9, fs5, ft7
                  srli         ra, t4, 22
                  sll          a2, t0, sp
                  fadd.s       ft1, fs2, fs2, rup
                  srl          tp, s7, s6
                  slt          a0, t3, t5
                  ori          s10, t5, 1996
                  auipc        s7, 606457
                  srl          s6, s1, a6
                  remu         zero, s9, s4
                  mulh         t1, s2, a3
                  sltu         a6, sp, s1
                  ori          a3, t0, 162
                  mul          t2, s11, a5
                  andi         a6, sp, -547
                  sub          s8, t1, t0
                  lui          a5, 653233
                  fmv.x.w      gp, fs5
                  mulhsu       a3, t2, t4
                  fsub.s       fs11, fs1, fs7, rne
                  add          s2, a1, s10
                  remu         a1, s4, s4
                  mul          ra, a1, s11
                  mulhsu       t3, a2, t6
                  fcvt.w.s     tp, fs10
                  nop
                  flt.s        a6, fs4, fa6
                  fmax.s       fa1, ft1, fa4
                  divu         a3, s7, s4
                  fclass.s     s0, ft6
                  fcvt.wu.s    s3, ft10, rne
                  fcvt.wu.s    t6, ft2
                  xor          a4, a7, a1
                  sltiu        a3, a5, -364
                  div          gp, t3, s1
                  fdiv.s       ft5, fs8, ft10
                  nop
                  fdiv.s       ft1, fs1, ft10
                  xori         zero, ra, 1979
                  or           s7, ra, t3
                  fcvt.w.s     s10, ft0, rmm
                  nop
                  addi         a5, a4, -1328
                  fdiv.s       ft4, ft5, ft6
                  mulhsu       t2, s11, a6
                  fcvt.w.s     s6, ft9, rmm
                  fmax.s       fs11, ft10, fs3
                  mulhu        a0, gp, s2
                  srl          a0, a4, s8
                  add          s1, s7, s4
                  feq.s        s6, fa5, ft10
                  xor          a1, s5, a4
                  fmv.x.w      s0, fs6
                  sub          t6, a2, sp
                  remu         s1, a1, s6
                  mulhsu       t3, a4, t5
                  fsqrt.s      fa0, fs2, rdn
                  srli         t4, s6, 4
                  rem          t0, a5, a6
                  sra          s11, s1, t5
                  fcvt.s.w     fa0, s2
                  or           tp, a6, t6
                  addi         s10, a3, 471
                  fmul.s       ft10, fa3, fs11, rtz
                  sub          t0, a0, ra
                  fsub.s       fa1, fs11, fa3
                  flt.s        s0, fa6, fs0
                  fmv.x.w      a1, ft9
                  slti         s7, sp, 895
                  fcvt.wu.s    s7, fs6, rne
                  srl          t3, a7, s8
                  nop
                  auipc        a5, 363944
                  srli         s10, zero, 24
                  remu         s6, s6, a4
                  div          tp, t4, a4
                  fsgnjx.s     fs1, fs1, ft9
                  flt.s        t1, fs5, fs2
                  fcvt.w.s     tp, fs2
                  fsub.s       fa5, ft1, fs10
                  fdiv.s       fs10, fs1, fa4, rtz
                  sltu         a2, gp, a2
                  sltiu        t3, s5, 70
                  fsgnjn.s     ft11, fs0, fs11
                  fmv.x.w      s1, fs6
                  fclass.s     t6, fs4
                  ori          t3, s3, -959
                  sll          t0, t4, zero
                  xori         t0, s5, 1655
                  sra          t4, t5, a1
                  auipc        s4, 212537
                  mulhsu       a4, sp, t6
                  xori         t6, t6, -428
                  rem          a0, a2, s3
                  sra          tp, s2, zero
                  fcvt.wu.s    ra, fs1
                  srl          t6, t2, t5
                  fmv.x.w      a7, fs5
                  fsgnjn.s     fa0, fa0, ft6
                  addi         s4, zero, -191
                  and          a5, t1, s5
                  mulhsu       t4, a6, ra
                  sltu         zero, s6, gp
                  div          t1, t3, s5
                  fsgnj.s      fs5, fa0, ft1
                  andi         t2, t5, 1899
                  slt          t6, zero, a6
                  xori         gp, s11, -77
                  rem          a5, s1, t3
                  fcvt.w.s     gp, ft5, rup
                  fsgnjx.s     fs11, fa1, ft9
                  nop
                  lui          s6, 925374
                  andi         a3, s10, -885
                  fclass.s     a7, fs1
                  feq.s        s4, fa1, fs2
                  srl          s1, zero, t2
                  fsqrt.s      fa4, fs10, rne
                  feq.s        tp, ft7, fs8
                  divu         s3, a4, a6
                  divu         tp, s11, t3
                  fmul.s       fs8, fs4, ft9
                  fsgnj.s      ft6, fa6, fs6
                  auipc        tp, 702459
                  mulhu        s0, t1, t3
                  auipc        a5, 322614
                  fmin.s       fa0, fs7, fa6
                  mulhsu       s8, s7, tp
                  mulh         t0, a0, zero
                  nop
                  fcvt.w.s     s6, ft2, rup
                  lui          tp, 320687
                  nop
                  srai         s0, s4, 2
                  fcvt.s.wu    fs8, a0, rtz
                  and          a4, t0, s2
                  fcvt.w.s     t6, ft6, rtz
                  fcvt.s.wu    ft5, s11
                  mulhsu       s0, t6, s11
                  sub          zero, t1, s7
                  nop
                  sll          s11, t0, s4
                  xor          a0, a1, s11
                  fclass.s     s3, ft6
                  fcvt.s.wu    ft0, s0, rmm
                  xori         s0, ra, -718
                  sltu         zero, a7, sp
                  fsgnjn.s     fs6, fa7, fs9
                  sltiu        t1, t4, 351
                  slli         tp, ra, 23
                  add          s2, s9, s3
                  fcvt.s.wu    fa3, a5, rup
                  xori         s11, zero, 2033
                  slt          zero, t3, a6
                  fmv.w.x      ft3, a3
                  fmv.x.w      s9, fs0
                  fsgnjn.s     fs1, fa4, fs10
                  xor          a3, tp, a5
                  fmv.w.x      fs8, s10
                  fcvt.w.s     a7, fa5, rdn
                  fmv.x.w      a6, ft5
                  slli         a7, a2, 3
                  flt.s        t2, fs4, ft8
                  and          a7, a7, t4
                  fcvt.wu.s    a6, fs8
                  nop
                  mulhsu       gp, s10, ra
                  xor          s7, a3, a6
                  fmax.s       fs8, fs6, fa1
                  srli         a1, sp, 5
                  slt          t0, s5, ra
                  lui          s10, 804854
                  slli         t6, t5, 7
                  fmul.s       fs8, fs9, fa6
                  fsgnj.s      ft11, fa6, fa7
                  nop
                  feq.s        s4, fs8, ft1
                  fcvt.wu.s    s0, ft4
                  fcvt.s.w     fa2, s9, rup
                  sub          s10, a0, a3
                  fsub.s       fs6, ft11, ft6, rtz
                  sub          a6, tp, a2
                  xor          t1, t4, s6
                  xori         s2, a0, 1310
                  fsgnjx.s     fa6, fs7, fs6
                  fmax.s       fs4, ft10, fs6
                  nop
                  fcvt.wu.s    s1, fs6
                  fsgnjn.s     fa0, ft1, fs11
                  nop
                  fcvt.s.w     fa5, t0
                  fmul.s       fa0, fa0, ft8
                  srli         a4, s9, 21
                  div          s3, t5, s8
                  srai         s0, s5, 20
                  xori         a4, t2, 870
                  sll          s3, s3, s2
                  fcvt.w.s     tp, fa0
                  fcvt.s.wu    fs2, a4, rup
                  divu         t6, sp, a7
                  fcvt.w.s     a1, ft1, rmm
                  auipc        s4, 470290
                  slli         t1, t5, 28
                  slti         s0, ra, 317
                  fmax.s       fs0, ft10, fa7
                  srai         ra, t1, 23
                  slli         s6, s7, 0
                  fsgnjn.s     fs11, fa7, ft0
                  fmin.s       fa1, ft2, fa2
                  fmv.x.w      s4, fs8
                  fclass.s     t4, ft4
                  fadd.s       fa7, fs1, fa2, rtz
                  fcvt.s.wu    fs11, zero, rtz
                  ori          a2, t2, 1683
                  xor          t0, s10, sp
                  slli         zero, a6, 10
                  slti         s7, t3, -856
                  srli         gp, s0, 20
                  divu         a5, a4, s11
                  divu         s10, s1, gp
                  fcvt.s.wu    ft6, s4
                  mulh         zero, a4, sp
                  feq.s        t2, fs10, ft7
                  lui          a5, 521399
                  rem          t6, a1, s9
                  slt          s10, t2, s8
                  fle.s        a2, ft8, fa2
                  sltu         a5, ra, t5
                  fdiv.s       fs1, fa4, fs9, rne
                  sltu         s3, t0, s5
                  divu         a2, t5, a4
                  fmax.s       ft6, ft9, ft2
                  fdiv.s       ft1, ft3, ft2
                  srai         s7, a6, 17
                  fcvt.wu.s    a4, fa7, rmm
                  rem          zero, a7, s1
                  slt          a3, s6, t1
                  or           s1, a3, s4
                  srli         t2, t3, 27
                  div          s8, a2, s11
                  nop
                  divu         s7, s9, tp
                  fsgnjx.s     fs11, ft2, fs7
                  fclass.s     t0, ft5
                  sub          s2, zero, s0
                  divu         gp, a6, s5
                  fle.s        t3, fs9, ft5
                  fclass.s     s6, fs7
                  sltiu        gp, s0, 1623
                  fcvt.w.s     s10, ft3, rmm
                  srli         s8, a0, 31
                  mul          s0, a3, t5
                  fmin.s       fs3, fs10, fa4
                  sltiu        s4, s0, -1226
                  auipc        a4, 789220
                  fcvt.s.wu    fa5, s2, rne
                  fmax.s       fs4, ft0, fa1
                  mul          s2, s5, tp
                  fmul.s       ft3, ft8, ft1
                  fmin.s       fs8, fs5, fs0
                  xor          t0, sp, a4
                  fle.s        ra, fs2, fa3
                  fcvt.s.w     fa7, a1, rne
                  sll          s10, s11, a1
                  xori         s10, t0, 885
                  feq.s        t2, fs4, fa3
                  sltu         s10, s5, s2
                  nop
                  div          a5, s1, s1
                  fcvt.s.wu    fs9, s3
                  rem          t1, s7, s0
                  lui          s6, 843251
                  ori          s10, sp, 824
                  sll          zero, s0, s3
                  remu         s7, s4, ra
                  remu         a2, zero, ra
                  fclass.s     s10, ft0
                  slt          s7, s5, s5
                  feq.s        s11, ft2, fa0
                  remu         ra, t1, t6
                  div          zero, a7, s10
                  sub          s9, t6, a6
                  fsgnj.s      fs5, fa1, fs10
                  sub          a6, a2, t4
                  sltiu        s6, t3, 489
                  nop
                  div          zero, s7, a1
                  fcvt.s.wu    fa0, a6
                  and          s9, s3, a6
                  addi         a2, s11, -861
                  fsgnjn.s     fs1, ft10, fs3
                  fcvt.w.s     t3, fs7
                  fle.s        a6, ft8, fs9
                  slti         a6, s4, 1326
                  divu         a6, t2, t2
                  mul          t0, a6, s8
                  ori          t6, a6, 511
                  fsqrt.s      fs6, ft1, rtz
                  addi         a0, s9, 26
                  fle.s        s6, fa6, ft11
                  rem          gp, s11, a1
                  mul          s1, t5, a0
                  sub          t3, tp, a7
                  or           t1, zero, s6
                  slti         a7, t4, 224
                  add          s6, t6, a6
                  sll          a1, a1, s10
                  mul          s2, s10, t3
                  xori         s11, t6, -702
                  auipc        s3, 150794
                  remu         t1, s8, a3
                  fmv.w.x      fa7, s11
                  srl          s7, t4, t0
                  remu         a0, a0, t1
                  fmul.s       fa7, fa0, ft5
                  fmax.s       fa0, fs0, fs5
                  rem          s4, a5, t4
                  fcvt.s.wu    ft11, t5, rtz
                  fsgnjx.s     ft10, fs0, fs10
                  fmin.s       fs7, ft9, fa5
                  sra          s7, t0, s11
                  fmax.s       ft8, ft7, fs1
                  or           s0, s3, t5
                  mulhsu       t4, s3, a4
                  sub          s1, a6, a5
                  fsqrt.s      fs2, fs2, rup
                  fcvt.s.w     fa2, s3
                  fmul.s       fa5, fs0, ft3, rmm
                  mulhu        t0, t2, t6
                  srl          s1, t6, t2
                  fsub.s       fs5, fa0, ft6, rdn
                  mulhsu       a5, a1, s5
                  fsgnjx.s     fs3, fa2, ft11
                  div          s6, t3, s7
                  addi         s0, a4, 309
                  mulhu        tp, s11, tp
                  srai         a7, s6, 12
                  feq.s        s7, fs7, ft11
                  add          gp, t0, t0
                  fsgnjx.s     ft8, fa6, fa3
                  add          t4, a4, a6
                  sll          ra, a2, s1
                  mulhsu       a2, a4, zero
                  auipc        a5, 190490
                  srl          t1, s10, s5
                  slt          s7, s1, s8
                  slt          s10, s7, t1
                  fmax.s       fa1, fa2, ft2
                  ori          s0, t0, -1042
                  xor          a7, a7, s9
                  fcvt.w.s     s7, fa1
                  fmax.s       ft1, fs7, ft10
                  mul          a2, s11, a6
                  fdiv.s       ft10, ft9, fa6
                  fmv.x.w      ra, fs9
                  sll          a1, a3, tp
                  fcvt.w.s     s4, fa2
                  fmv.x.w      a4, fs5
                  fcvt.s.w     fs9, s3, rmm
                  fmv.w.x      fa6, t0
                  nop
                  mulh         a1, zero, t0
                  addi         s9, zero, 1689
                  slt          s9, a7, a6
                  fle.s        a3, fa6, ft6
                  fsqrt.s      fs5, ft2, rmm
                  fle.s        s4, ft6, fs5
                  sltu         ra, a0, a5
                  slli         t6, zero, 30
                  div          a4, s1, t0
                  fsgnjn.s     fs5, fa3, ft4
                  fcvt.wu.s    a4, ft4, rup
                  fle.s        t3, fs6, fs1
                  or           s2, s7, sp
                  fclass.s     a0, fs3
                  fsgnjn.s     ft10, fa6, ft3
                  fle.s        a5, ft1, fs8
                  fsub.s       ft3, ft0, fa0, rdn
                  fmax.s       fs8, fs2, fa5
                  slti         s10, ra, 191
                  fmin.s       ft8, ft2, fs10
                  slli         s7, t3, 23
                  or           t1, t0, gp
                  fsqrt.s      ft9, ft9, rtz
                  xori         s3, a1, -1689
                  fcvt.w.s     s4, fs11, rup
                  mulhsu       t3, s1, tp
                  mulh         s0, s10, s4
                  mulh         a5, a5, zero
                  fdiv.s       fs0, ft3, fa1
                  fmin.s       fa1, fa3, ft0
                  remu         t0, a6, s4
                  sltiu        s11, a6, 1915
                  sll          ra, tp, t3
                  xori         s8, t0, 1065
                  xori         zero, s4, 46
                  fmul.s       fa7, ft7, fs11
                  or           a0, t3, t4
                  fadd.s       fa4, fa2, fa2, rdn
                  srli         s1, t5, 27
                  fcvt.s.wu    ft10, t3, rmm
                  auipc        t0, 237848
                  xor          gp, zero, s4
                  fmul.s       fs11, fa6, ft3
                  or           t2, s10, t6
                  lui          ra, 730762
                  fle.s        t3, fa0, fs5
                  addi         s3, t6, 1184
                  sltiu        t4, a7, -47
                  mul          a0, s4, s2
                  fadd.s       ft11, ft4, ft4
                  fcvt.s.wu    fa0, sp
                  srl          ra, s7, s5
                  feq.s        ra, fs5, fs9
                  flt.s        t2, fs6, ft10
                  or           t0, t0, a1
                  fadd.s       ft1, ft11, ft7, rup
                  nop
                  remu         s9, s11, s4
                  fsub.s       fs2, ft9, fa4, rmm
                  fcvt.s.wu    fa7, t6
                  sub          s1, sp, t2
                  fdiv.s       ft4, fa5, fs11, rne
                  mulhu        t3, a7, ra
                  mulhsu       a5, a4, ra
                  addi         a4, s7, -692
                  srai         s11, s11, 9
                  div          t4, t0, a0
                  addi         a7, s10, -839
                  sltiu        s1, a3, -789
                  sub          t1, tp, a2
                  auipc        gp, 47156
                  fsgnj.s      fs10, ft3, fs4
                  srli         s10, sp, 3
                  mulh         t4, t2, a0
                  mulhu        s3, t0, s0
                  mulhu        t4, s9, sp
                  rem          t0, sp, s9
                  sll          s9, s1, a0
                  andi         a6, s11, 1460
                  fmin.s       fs5, ft6, fs6
                  fcvt.s.wu    fs7, a0
                  xor          s0, s10, a6
                  fmv.w.x      fa1, a5
                  sra          s8, s6, a1
                  srai         s1, a1, 20
                  srai         s8, t5, 30
                  fmin.s       ft9, fs1, fa6
                  feq.s        t2, fa6, fa1
                  fsgnjx.s     fa2, ft7, fa3
                  rem          s1, ra, s0
                  srli         a2, s5, 2
                  fcvt.wu.s    s6, fa0, rmm
                  fmv.w.x      ft2, a6
                  fcvt.s.wu    fs11, t6
                  fsgnjx.s     ft9, fs4, fs7
                  mulhu        a0, s2, a5
                  mulhsu       a0, tp, s4
                  auipc        s11, 285997
                  mulhsu       s0, s2, a5
                  fclass.s     s6, fa5
                  slt          tp, gp, t5
                  fle.s        gp, fs7, fa5
                  divu         t2, a7, a0
                  fle.s        a7, fs8, ft3
                  fcvt.s.w     fa3, gp, rmm
                  fdiv.s       ft4, fs9, fa7, rmm
                  sll          tp, sp, gp
                  divu         ra, t0, t4
                  flt.s        s8, fs10, ft0
                  mul          a1, t3, sp
                  addi         a1, s2, 1375
                  fclass.s     ra, fs1
                  remu         t1, s11, a5
                  mulhu        a2, t0, t3
                  fsgnjn.s     fs1, fa5, fa6
                  div          s9, s1, a3
                  auipc        s0, 46584
                  fmul.s       ft3, fs10, fs9
                  flt.s        t1, fs10, fs11
                  remu         s7, s10, a2
                  slti         a2, a1, -1767
                  fsqrt.s      fs5, ft2
                  mul          a3, a3, t1
                  fcvt.w.s     t4, ft8
                  nop
                  addi         s2, s8, 287
                  andi         s9, s11, -718
                  fmax.s       ft6, fa4, fa6
                  fclass.s     s6, fa1
                  xori         s8, zero, 1396
                  mulhsu       a5, a0, s11
                  fadd.s       fa1, ft2, fa7
                  andi         a6, s1, -1355
                  divu         t1, t3, a3
                  sltiu        s9, s8, -596
                  slt          s0, a7, s8
                  xor          t4, a3, s1
                  sub          s1, s8, s7
                  fsub.s       ft11, ft0, ft11
                  auipc        s7, 481309
                  fcvt.s.w     fs2, a0, rdn
                  fcvt.wu.s    s4, ft0, rne
                  srl          s2, s5, t1
                  fclass.s     a5, fa6
                  xori         t4, s8, 863
                  and          s0, a0, gp
                  feq.s        t6, fs6, fs6
                  nop
                  slt          gp, s3, s6
                  ori          a2, gp, -125
                  fcvt.s.wu    fs5, tp
                  slt          s3, sp, t6
                  fmv.x.w      s7, ft9
                  mulh         a3, s0, s2
                  divu         s2, sp, ra
                  addi         t6, a7, 1635
                  fsqrt.s      ft4, ft7
                  fmin.s       fs3, ft0, fs2
                  feq.s        a0, ft0, fa7
                  srli         s3, a6, 24
                  flt.s        s7, ft7, ft3
                  flt.s        a4, fs3, fs7
                  flt.s        t6, fs3, fa2
                  ori          s8, t5, 1186
                  lui          s0, 604759
                  or           t3, tp, gp
                  rem          s1, ra, t2
                  srl          t2, t1, s7
                  fclass.s     a3, fa4
                  sltu         s4, zero, zero
                  sltiu        t6, t6, 791
                  and          t3, gp, s8
                  or           a3, zero, t1
                  srli         a5, t3, 10
                  fmax.s       ft5, fs10, ft4
                  and          tp, t5, a4
                  fcvt.s.wu    fs6, s8, rdn
                  fcvt.s.wu    ft5, tp
                  remu         t1, s9, a2
                  sra          a2, s9, t2
                  fcvt.w.s     t6, fa1
                  andi         s11, s4, 656
                  and          ra, a0, t5
                  xori         s4, t0, 1868
                  srl          s10, a4, zero
                  mulhu        a0, t0, s3
                  slli         gp, t6, 6
                  rem          a2, t2, s6
                  sltiu        tp, s5, -905
                  fadd.s       fs9, ft1, fs0, rdn
                  and          a4, s7, s4
                  fsgnjn.s     fs4, fs2, fa1
                  fmv.x.w      a1, fa5
                  andi         tp, a6, 614
                  ori          s11, s6, 1824
                  fsgnjx.s     fa7, fs1, fs4
                  slti         a4, a5, -1932
                  sra          gp, s5, sp
                  slli         a1, s0, 7
                  mulhu        s2, t2, s10
                  slli         s9, s10, 21
                  mulh         s0, s3, a4
                  mulhu        t1, s7, a7
                  mulhsu       s3, ra, t0
                  flt.s        s10, fa7, ft5
                  fsqrt.s      fs10, fs9
                  rem          s0, s11, t6
                  fadd.s       fs6, fs4, ft4, rne
                  xori         s8, s3, -813
                  or           s11, t3, t3
                  fcvt.s.w     ft9, s8
                  rem          s10, a0, zero
                  lui          t3, 752223
                  srai         t4, a6, 12
                  andi         s11, t5, 587
                  fle.s        a2, ft7, fs11
                  mul          tp, s5, s8
                  rem          s0, s8, a2
                  feq.s        s8, ft5, fs6
                  div          a0, t6, s4
                  srli         zero, s6, 4
                  fmin.s       fa4, fa2, ft4
                  sltu         s3, t2, t0
                  mulh         tp, s6, ra
                  fmul.s       ft2, fa4, fs5, rmm
                  srl          a4, s10, s9
                  fcvt.s.wu    ft9, t5, rne
                  fcvt.s.w     fs6, t4
                  lui          gp, 391290
                  sll          s7, s4, a7
                  sra          a3, a2, sp
                  mulhu        a4, s11, s2
                  sltu         tp, s5, t4
                  fcvt.w.s     t1, fs8
                  sra          s2, ra, s8
                  slt          s10, t4, t0
                  mul          s6, t5, s10
                  fcvt.s.wu    ft11, a6, rdn
                  auipc        s0, 591088
                  div          t4, s8, t3
                  ori          s11, t5, -1183
                  fadd.s       ft6, ft8, fs11, rtz
                  xor          ra, t0, s1
                  fsub.s       fs7, fs2, fs8, rtz
                  mulh         s3, t6, t6
                  fmin.s       ft10, ft5, fs10
                  fcvt.s.w     fa1, t2
                  rem          a2, zero, t4
                  sll          a1, s3, sp
                  fcvt.wu.s    s10, ft0, rmm
                  sltu         a6, t1, t3
                  lui          a1, 664780
                  fmin.s       ft0, fs0, ft1
                  fsgnjn.s     fs2, fa6, fa7
                  or           a4, s9, s7
                  sltu         s10, t1, s3
                  fsgnjx.s     fa1, ft2, fa0
                  xor          a6, t1, zero
                  addi         t2, tp, -1827
                  sub          s2, s5, s7
                  fclass.s     s0, fa2
                  fsub.s       fa1, fs0, ft10
                  sltiu        t2, a5, 699
                  andi         s6, s0, 680
                  fmin.s       ft2, fa5, fs9
                  srli         s9, a2, 24
                  fle.s        s6, fs8, fs1
                  sub          a3, s3, s8
                  srai         s9, s7, 5
                  remu         s11, gp, a4
                  xori         s11, a3, 264
                  fsub.s       ft2, fa1, fs3, rmm
                  remu         s3, s0, s6
                  mulhsu       t4, s9, a7
                  feq.s        s6, fs5, ft8
                  remu         s4, t6, t4
                  nop
                  nop
                  lui          s6, 182218
                  lui          t6, 140337
                  divu         s1, a1, t4
                  fle.s        t1, ft9, fs6
                  addi         tp, a7, -678
                  slt          a2, tp, t3
                  fsub.s       ft4, ft1, fa6
                  nop
                  slt          a6, s5, sp
                  rem          s4, s8, t0
                  andi         s0, s11, -1765
                  fcvt.s.w     fa0, s0, rmm
                  fcvt.s.wu    fa3, a4, rup
                  rem          s2, s10, a3
                  sltiu        t1, s7, 1989
                  sll          a2, a2, a7
                  fmv.w.x      fs4, t3
                  fcvt.wu.s    a0, fs3, rne
                  xori         a6, a3, -1111
                  srai         s2, s3, 15
                  fadd.s       fa5, ft4, fa4, rup
                  xor          t3, s0, t0
                  fcvt.s.wu    fs4, s0, rup
                  fmax.s       ft6, ft7, ft6
                  fmax.s       fs10, ft6, fa4
                  slt          t4, zero, s0
                  fmax.s       ft11, ft1, ft9
                  mulhu        t1, s9, a2
                  fmin.s       fa5, ft1, ft5
                  sltu         gp, s6, t0
                  mulh         a4, s8, s6
                  fcvt.w.s     gp, ft9, rdn
                  auipc        t1, 418211
                  add          s6, s7, s6
                  srl          a0, s1, s2
                  div          t3, s9, s0
                  srli         tp, a0, 11
                  srai         s6, s10, 6
                  mulhu        zero, s1, s0
                  xori         s3, a5, -1870
                  fsqrt.s      ft6, fs5, rtz
                  sra          a1, a1, s11
                  xori         t0, t5, -615
                  and          zero, s8, zero
                  auipc        a5, 972072
                  fsgnj.s      ft5, ft1, fs0
                  srli         a1, t1, 15
                  addi         t2, s2, -1299
                  add          gp, a0, s6
                  fle.s        s7, fs8, ft7
                  or           zero, gp, t0
                  rem          s3, a3, s3
                  fclass.s     a1, ft8
                  or           t4, s2, a6
                  or           s1, zero, t6
                  fmv.w.x      fa6, s6
                  fadd.s       ft4, ft5, ft9
                  mulhu        ra, s4, t3
                  andi         t4, t4, -1558
                  or           ra, t0, s11
                  sll          s0, t4, s5
                  xori         t1, t4, -963
                  fcvt.s.w     fs1, s6, rtz
                  mulhsu       s11, s0, s7
                  andi         s10, s2, 467
                  sra          t4, s2, gp
                  fsgnj.s      fs4, fs3, ft3
                  or           s11, a1, s2
                  and          s6, s11, t3
                  fsub.s       ft6, ft11, fs2
                  mulhsu       t6, s10, t6
                  srli         zero, s2, 31
                  sra          ra, a1, t1
                  mulh         a3, t3, gp
                  sra          a0, tp, t6
                  mulhsu       a5, a6, s8
                  fadd.s       fs5, ft7, ft6
                  srl          s11, a7, s5
                  fdiv.s       ft1, fs8, ft7, rne
                  fmin.s       fs1, fa1, ft4
                  mulh         t4, ra, s0
                  srl          s0, s5, a0
                  nop
                  remu         t1, t1, a5
                  or           s2, s2, ra
                  fsub.s       fa7, fs10, fs0, rdn
                  addi         a2, s0, 546
                  rem          s4, a3, t6
                  sll          a3, t1, s4
                  mulhu        t4, s1, a2
                  fsqrt.s      fa5, ft6, rtz
                  fmv.x.w      s7, fs7
                  slti         s7, s8, 1609
                  ori          s2, a7, 1017
                  slt          s8, a1, t3
                  fclass.s     s11, fs0
                  fmv.w.x      fa6, t5
                  sub          gp, t4, a3
                  fmv.x.w      a5, fs10
                  fmul.s       ft2, fs10, fa4
                  remu         gp, a6, t4
                  fcvt.s.wu    ft4, a5
                  srl          a5, s11, gp
                  and          a5, t1, t3
                  srai         s8, s8, 5
                  fdiv.s       ft4, fs2, fa7, rdn
                  slt          tp, a4, s8
                  xor          s7, t6, t0
                  fclass.s     s8, fa4
                  fsgnjn.s     ft1, fs2, fs7
                  sub          a7, s4, sp
                  fcvt.w.s     a6, ft5
                  fmax.s       fa2, ft1, fs1
                  andi         gp, t5, 881
                  xor          s9, t1, a2
                  fmin.s       fs7, fs5, ft10
                  slt          a3, s11, t6
                  sub          zero, s3, s10
                  rem          t6, s3, sp
                  sltiu        t2, s6, 2012
                  fsqrt.s      ft8, fa2, rdn
                  sub          tp, s3, s10
                  slt          zero, a0, s5
                  srai         ra, s8, 18
                  slt          t2, a5, t0
                  nop
                  rem          t0, s4, t0
                  fsgnjx.s     fa6, fa4, ft5
                  sra          s11, gp, t2
                  sub          s6, s9, a7
                  mulhsu       a7, t2, t6
                  lui          t2, 327428
                  ori          s8, t5, 1509
                  fsgnjn.s     fs10, fs10, ft10
                  fadd.s       fs4, ft6, fs4, rup
                  flt.s        a2, fs4, fa5
                  fmv.w.x      fs6, t3
                  feq.s        t6, fs2, ft8
                  slti         a1, s0, -1163
                  fclass.s     s4, fs4
                  sltu         a0, sp, t5
                  xor          a0, s11, s11
                  slt          t1, t2, a0
                  fsqrt.s      fs6, fa3
                  srli         t3, t1, 20
                  mul          s6, s3, t1
                  srli         a1, a3, 6
                  flt.s        t0, fs8, ft1
                  rem          s0, t1, zero
                  fmul.s       fs9, fa5, ft3, rup
                  fsgnj.s      fa6, fs2, ft1
                  add          a3, t6, a1
                  or           t4, a0, gp
                  div          s1, s6, a6
                  fcvt.wu.s    s2, fa7
                  lui          t6, 377736
                  srli         s9, a6, 21
                  and          a6, a5, tp
                  slti         a3, s11, 1804
                  fcvt.wu.s    s10, fs11, rup
                  srai         a7, a1, 13
                  srli         s6, t2, 12
                  srai         t1, s7, 30
                  fcvt.s.w     fa3, a1, rup
                  fcvt.wu.s    t0, fa4
                  sltiu        t2, a6, 1774
                  nop
                  srli         a3, a6, 5
                  nop
                  lui          a6, 136115
                  fcvt.s.wu    fs3, a6, rtz
                  mulhu        s3, s3, s2
                  auipc        t3, 670452
                  mulh         s6, t3, a3
                  mulhsu       a4, tp, s0
                  srai         s3, t0, 31
                  mul          s9, s3, s11
                  fmin.s       ft4, fs10, ft4
                  fsgnj.s      fa3, ft7, ft11
                  mulh         a7, a7, s11
                  srai         s3, a0, 22
                  fle.s        s0, fa1, fa6
                  ori          s4, t5, -884
                  lui          t4, 550877
                  srli         gp, zero, 11
                  fcvt.s.wu    ft5, t4, rne
                  fsqrt.s      ft5, fs3
                  fcvt.s.w     fs6, a3, rup
                  fmul.s       ft5, fs9, ft10, rmm
                  divu         t3, s7, a6
                  feq.s        a7, ft3, ft1
                  fadd.s       ft7, fa5, fa7, rdn
                  and          s1, s9, a0
                  fsgnjx.s     fs1, ft5, fs4
                  fle.s        a5, ft11, fa2
                  fsgnj.s      ft7, fs7, fa1
                  and          t6, s0, a0
                  feq.s        t1, fa7, ft7
                  flt.s        t2, ft7, fs1
                  flt.s        a6, fs3, fa4
                  fmax.s       fa4, fa0, ft2
                  fmin.s       fs2, ft0, fs5
                  fmv.x.w      zero, fs9
                  remu         a1, zero, s0
                  fcvt.wu.s    a5, fa4, rmm
                  divu         a5, sp, a6
                  slti         s11, a4, -997
                  nop
                  sltu         s7, a0, a1
                  fmv.x.w      a5, ft0
                  feq.s        t0, ft7, fa5
                  fmv.x.w      a4, fs7
                  fsub.s       fa4, fs1, ft10, rdn
                  fmax.s       ft7, ft5, ft5
                  sltu         s6, a7, a6
                  addi         t6, a1, -576
                  and          a5, s9, a3
                  sltiu        t4, a5, 296
                  mulhu        a1, tp, t4
                  srai         a5, t6, 29
                  fmax.s       fs5, fa4, fa2
                  addi         t3, s1, 676
                  fcvt.s.wu    fa3, s8
                  fmax.s       fa6, fa0, ft2
                  slli         a1, s3, 18
                  sltiu        s2, s3, -598
                  fclass.s     a4, fa2
                  fle.s        zero, fs5, ft9
                  fmax.s       ft3, fa1, fa6
                  andi         s0, t5, -1251
                  slt          t1, t2, s6
                  xor          s1, t3, t1
                  fclass.s     t4, ft10
                  fsub.s       ft5, fa1, ft7, rne
                  fmv.w.x      fa1, t3
                  srl          s4, s0, a5
                  rem          a2, tp, s11
                  remu         a6, t5, s10
                  andi         s7, s7, -913
                  fsgnjn.s     fa6, fs4, ft10
                  fmin.s       fs4, fa4, fa1
                  slli         s7, t5, 2
                  divu         s8, a0, t0
                  sltiu        ra, s0, 612
                  add          zero, t5, s9
                  fmv.w.x      fs8, a7
                  mulh         a7, s11, t2
                  andi         s7, s11, 1515
                  auipc        s1, 634642
                  div          t3, tp, t5
                  fcvt.s.wu    fa7, t1
                  fcvt.s.wu    fs3, ra, rup
                  fcvt.s.wu    fs10, t6
                  fsgnjx.s     ft4, fs11, fs6
                  xor          a5, a7, t1
                  mulhsu       a6, s3, ra
                  fmul.s       ft7, fa3, ft0, rdn
                  andi         t6, gp, -824
                  mulhu        t6, a4, a2
                  slli         s2, a7, 25
                  mulhsu       t6, s4, t6
                  srai         t3, ra, 27
                  mulhsu       a0, s4, s3
                  rem          s1, t3, s6
                  fsgnj.s      ft3, fs6, fa0
                  lui          a7, 434264
                  fmv.x.w      t6, ft0
                  fsub.s       fs10, fa6, ft3
                  sll          t4, s4, a7
                  fmul.s       fs0, ft8, fs0
                  mulhsu       s11, t6, gp
                  fmin.s       fs4, ft5, fa7
                  lui          a1, 255938
                  mulh         a1, tp, a3
                  srl          t3, t0, s6
                  fclass.s     a2, fa2
                  fsgnjn.s     fs5, fa6, ft1
                  srli         s6, s8, 1
                  auipc        t2, 172177
                  fcvt.s.w     fs3, t1
                  fsgnjn.s     fs9, fs4, fa0
                  slt          t4, s11, a5
                  slli         a3, zero, 7
                  fcvt.w.s     a5, ft6
                  fcvt.s.w     fs3, s2, rup
                  fle.s        t1, fa5, fs8
                  mulhsu       s8, a0, ra
                  fsgnjx.s     ft9, fa5, fa2
                  fsgnjn.s     fs2, ft10, ft3
                  sltiu        s3, gp, 651
                  and          t3, s3, s3
                  fmin.s       fs7, fs7, ft8
                  andi         gp, a3, 1082
                  add          zero, ra, a4
                  sra          a3, s11, a4
                  remu         a5, s10, t1
                  fsgnjn.s     ft8, fa4, fa2
                  srli         a7, s11, 31
                  mulhsu       s10, s11, t5
                  fmin.s       fa7, fs6, fs1
                  srai         zero, s8, 13
                  fcvt.s.wu    fa2, s4
                  xor          a0, t6, a7
                  sltu         t3, zero, s0
                  div          s10, s7, s11
                  fcvt.s.wu    ft0, s5, rdn
                  mulh         s11, a5, a1
                  fmv.w.x      fa6, a1
                  or           s2, s3, s0
                  div          a4, s8, s3
                  andi         a3, s10, -923
                  fcvt.wu.s    t4, ft11, rmm
                  fsgnjx.s     fs1, ft1, fs7
                  srai         tp, ra, 11
                  ori          s4, t4, -1195
                  mul          a4, t6, s1
                  sra          s6, t2, s5
                  auipc        t3, 152198
                  fmin.s       fa3, fs0, ft9
                  mul          s11, tp, s0
                  fmax.s       ft10, fa7, fa2
                  fmin.s       fa2, fs9, fs2
                  sra          a7, t4, t4
                  fmv.w.x      ft2, s9
                  slt          a1, s3, ra
                  fsqrt.s      ft4, fs10, rne
                  slli         t2, s8, 22
                  remu         s9, s8, a6
                  xori         a7, t0, 822
                  fcvt.s.w     ft4, s7
                  fsgnj.s      fa1, fs1, fa3
                  slli         s2, zero, 28
                  nop
                  lui          s2, 1027510
                  fsgnjx.s     ft7, fa4, fs2
                  fcvt.wu.s    a3, ft6
                  fsgnj.s      fa2, fs8, fa4
                  sub          t6, a0, t6
                  sltu         a0, s3, t4
                  slti         t1, t3, 516
                  mulh         ra, t3, s10
                  sltiu        s3, a4, 348
                  flt.s        a0, ft5, fa7
                  xori         a2, a6, 494
                  rem          a3, a0, s3
                  fcvt.s.w     fa7, a3, rtz
                  fmul.s       ft1, fs1, ft11, rdn
                  fcvt.w.s     tp, ft11
                  fmv.x.w      s10, fa4
                  srl          s10, s7, t5
                  fmin.s       fs1, ft11, ft2
                  mulhsu       a7, a4, a4
                  sltu         a7, s2, t3
                  fsgnjn.s     fa7, fs6, fs5
                  rem          s0, a5, s3
                  fsgnj.s      fa1, ft7, ft6
                  sll          s1, zero, t2
                  div          t0, a6, a6
                  fmul.s       ft9, ft4, fs2
                  sub          s11, tp, a0
                  fclass.s     s10, fs7
                  fsgnjn.s     fs2, fs0, fa1
                  fmin.s       ft4, ft5, ft6
                  srai         zero, s11, 5
                  fclass.s     gp, ft3
                  fle.s        s2, fs0, ft4
                  fcvt.w.s     a0, fa6, rtz
                  div          s9, t6, a0
                  mulhsu       s11, a1, ra
                  rem          t6, s5, zero
                  sltu         s8, t6, t5
                  fcvt.s.w     fs3, t4
                  mulh         a4, gp, s8
                  slli         t6, t5, 13
                  fle.s        t1, fs7, ft11
                  fadd.s       fs7, ft6, fs4
                  fle.s        ra, ft4, fs8
                  fsgnjn.s     ft10, fs10, ft7
                  sltiu        s7, ra, -107
                  xor          s7, t0, gp
                  lui          a6, 790674
                  sll          t1, t6, s3
                  and          t2, a6, a0
                  div          s3, t6, gp
                  slt          s4, a2, tp
                  mulhu        a3, a2, s0
                  or           a2, a0, sp
                  xori         zero, a6, -1539
                  add          a5, tp, a7
                  fmin.s       fa0, fa4, fa1
                  mulh         zero, s9, a0
                  fdiv.s       fa7, fs2, fs9, rtz
                  sub          a3, s4, s9
                  ori          s4, zero, -1467
                  fsub.s       ft1, ft3, ft1
                  fle.s        t3, ft7, fa2
                  mulhu        s9, s6, sp
                  fclass.s     a5, ft11
                  ori          s9, s3, 503
                  slti         s4, s3, 1786
                  nop
                  mulhsu       t6, a5, s7
                  mulhsu       s2, a4, sp
                  addi         s8, t5, 534
                  divu         t4, t5, t4
                  fcvt.s.wu    fs10, t0, rtz
                  slt          a5, sp, s6
                  sltu         s8, ra, a7
                  addi         a6, t0, 566
                  feq.s        t3, fs9, ft7
                  div          s7, t0, s10
                  fsgnjn.s     fa7, ft0, ft8
                  fsgnj.s      ft11, fs6, ft2
                  fsqrt.s      fs6, fa2
                  fsub.s       ft7, fs0, ft7, rmm
                  srli         gp, tp, 2
                  srl          s4, sp, s6
                  fcvt.wu.s    tp, fa4, rdn
                  fcvt.s.wu    ft11, a2
                  slt          a5, sp, t3
                  srai         gp, s11, 18
                  srl          s0, s8, t0
                  sub          ra, a2, s3
                  fcvt.s.w     fa4, a7, rmm
                  nop
                  addi         tp, a2, -1374
                  feq.s        s4, ft8, fa1
                  fcvt.s.wu    fa2, s6
                  andi         a5, s10, 820
                  sltu         s6, t4, a5
                  slli         s4, a6, 0
                  slt          s1, t0, t2
                  andi         a0, a7, -1543
                  fsgnj.s      fs5, ft4, ft3
                  xori         a0, a3, -1360
                  div          s1, ra, a3
                  sll          s3, a7, s0
                  fcvt.s.w     fa5, a3
                  fsqrt.s      fs7, ft0
                  slli         s11, s1, 7
                  divu         s7, s2, s11
                  xor          s9, t0, s1
                  mul          tp, ra, s11
                  feq.s        zero, fa4, ft11
                  fcvt.wu.s    t0, fs10, rne
                  rem          t2, a3, a0
                  fmin.s       ft11, fs9, ft4
                  div          s0, s3, s1
                  mulhsu       s8, t3, a5
                  fmv.w.x      fa1, s1
                  addi         a2, t5, -1327
                  sll          a4, s0, s1
                  sll          gp, gp, s6
                  lui          a2, 725102
                  mul          a7, s11, t6
                  add          tp, s4, s10
                  fcvt.s.wu    fs9, tp, rmm
                  mulhu        t6, sp, zero
                  rem          s4, s1, s6
                  mul          gp, s4, s6
                  slli         s6, t2, 13
                  ori          s9, s7, -268
                  sltiu        s10, t6, -575
                  andi         s11, t1, -1955
                  fcvt.w.s     a2, fs9, rdn
                  fdiv.s       fa5, fs4, ft5
                  fsgnjn.s     fs1, fs3, ft11
                  fsgnjn.s     ft2, ft6, fa1
                  fsgnjn.s     ft8, fa2, fs1
                  divu         a6, a6, s8
                  fcvt.w.s     s6, fa3, rne
                  flt.s        zero, ft0, fs9
                  nop
                  fcvt.w.s     a5, fa0, rmm
                  fmin.s       ft7, fa3, fa7
                  fcvt.s.wu    fa5, a7, rdn
                  fadd.s       ft3, fs10, fa4, rup
                  slti         zero, t1, -252
                  mulhu        gp, t6, t0
                  fclass.s     a3, fs9
                  feq.s        s11, fs10, ft11
                  add          a1, s9, s1
                  fcvt.s.w     ft8, t0
                  fsub.s       fs10, fa5, fa7, rdn
                  fcvt.s.w     ft11, t5, rtz
                  mulhu        tp, s0, s10
                  fmv.w.x      fa6, t1
                  sll          a5, t2, gp
                  slt          s6, sp, a4
                  fle.s        s9, fs3, fs10
                  add          a2, a1, a0
                  srl          a3, a7, s1
                  slt          s10, s5, t2
                  fmax.s       fs11, ft10, fs7
                  lui          s10, 439509
                  div          t6, t2, t1
                  fmin.s       ft10, fs6, ft10
                  or           s0, a7, s6
                  auipc        a1, 790443
                  sltu         s4, t2, s9
                  fsub.s       ft9, ft3, ft0, rmm
                  mulhsu       a3, s2, a1
                  slli         s7, a6, 8
                  remu         s1, a3, tp
                  add          s0, t3, tp
                  fmv.w.x      fs6, a0
                  fadd.s       fs1, fs1, ft5
                  rem          s9, a7, a1
                  fclass.s     tp, fs10
                  rem          t4, a1, s7
                  fcvt.wu.s    s8, fs11
                  mulh         t6, s2, a2
                  mul          a1, t2, s6
                  fmv.w.x      fs1, a0
                  fmv.x.w      s2, fa7
                  mulhsu       tp, a4, t4
                  sltiu        a3, s3, 1450
                  add          t2, a3, t4
                  ori          a3, s10, -346
                  fmin.s       fs8, ft10, fa0
                  andi         t1, s0, -1851
                  fcvt.wu.s    t3, fs2, rup
                  xori         a7, s7, 986
                  auipc        a3, 404074
                  div          a6, a1, a5
                  fclass.s     a1, fs9
                  nop
                  fsgnjx.s     fs0, ft9, fs2
                  xori         s1, a4, 1370
                  flt.s        t1, fa2, fa0
                  fsgnj.s      fs10, ft7, fa2
                  sll          s7, a1, t4
                  divu         a5, s9, s10
                  fsgnjx.s     fs6, ft5, fs10
                  srai         s3, zero, 8
                  flt.s        s0, ft9, ft7
                  sra          a5, t2, t5
                  rem          t4, s6, s10
                  slti         a3, tp, 1061
                  sltu         a5, sp, a7
                  ori          zero, tp, -666
                  fmul.s       fs2, fs7, ft3
                  sltiu        gp, t6, 805
                  xor          s4, t4, a6
                  fdiv.s       ft11, fs11, ft3, rmm
                  remu         a7, t2, s2
                  xori         s9, s1, 1762
                  fclass.s     s10, fs8
                  andi         t1, t0, 1250
                  fle.s        s10, fa4, ft5
                  fcvt.w.s     a0, ft10, rmm
                  slti         a2, s5, -1241
                  and          t6, s1, a1
                  ori          a0, a1, 1085
                  mulh         t0, s7, s6
                  mul          s10, s0, s10
                  div          t4, t2, s0
                  addi         s1, s7, 300
                  fadd.s       ft11, ft7, ft7, rup
                  rem          s4, t1, a2
                  mulh         t0, t1, t2
                  fle.s        s6, fa2, fs9
                  slti         s11, s9, -327
                  fsgnj.s      fs0, ft9, ft1
                  sra          a0, s3, sp
                  srli         s8, a0, 7
                  divu         t1, a4, a4
                  fcvt.s.w     fs4, s1
                  fmax.s       fa2, fa5, fa7
                  fcvt.wu.s    s0, fa0
                  sll          ra, a1, s1
                  sltiu        a7, a3, -507
                  fdiv.s       ft11, fs1, ft9, rmm
                  or           t0, t3, t5
                  add          zero, s1, a7
                  fmin.s       ft9, ft5, fa2
                  mulhsu       tp, s9, s10
                  srli         s4, s2, 17
                  fcvt.s.w     fs6, a5
                  auipc        t1, 23983
                  fsqrt.s      fa0, ft0
                  fsgnj.s      fa4, fs6, ft0
                  sra          a5, t3, s2
                  divu         a6, a4, zero
                  xori         a2, s11, -295
                  fsgnjx.s     ft5, ft7, fs5
                  fmin.s       ft3, fs3, ft4
                  or           ra, s5, s8
                  fmax.s       ft9, ft2, ft1
                  fcvt.s.wu    ft6, ra, rdn
                  sltu         t1, s7, s1
                  fmul.s       fa5, ft1, ft10
                  fmax.s       fs10, fs7, fs7
                  andi         t0, s6, 1315
                  flt.s        t1, fa5, fs11
                  fle.s        s6, fs4, fa5
                  div          t6, a2, a3
                  fcvt.w.s     s10, ft1
                  sra          s4, t2, a4
                  srli         a0, t4, 22
                  rem          a3, t6, t3
                  sub          a1, t1, s1
                  ori          s6, a4, 1885
                  add          t4, s5, tp
                  lui          s8, 703545
                  fsub.s       fs6, fs10, fa6
                  sltiu        a2, s6, -240
                  fmv.x.w      s7, fa1
                  fmv.x.w      ra, fs7
                  fmv.w.x      ft9, s7
                  sltiu        a6, a0, 663
                  rem          s11, s10, a5
                  fcvt.s.w     ft8, t0, rup
                  mul          a0, a2, s11
                  mul          a0, t2, s2
                  fcvt.s.wu    fs6, sp, rtz
                  slti         a4, t3, -569
                  or           s9, s2, a1
                  fmul.s       fs5, fs2, fa1, rtz
                  rem          t4, t2, s6
                  fmv.x.w      t6, fs1
                  fsgnj.s      ft3, fs10, ft4
                  auipc        gp, 763380
                  flt.s        a0, ft9, fa7
                  auipc        t1, 733284
                  divu         t3, t2, zero
                  mul          s10, t1, a2
                  sll          t3, s5, s8
                  sltiu        a5, s3, 1674
                  xor          s10, s6, t6
                  nop
                  flt.s        t4, ft10, ft1
                  fmv.w.x      fa2, t1
                  nop
                  remu         t0, s5, a2
                  fmul.s       ft3, ft8, fa2
                  fcvt.w.s     t6, fs10
                  srli         s3, a4, 30
                  fclass.s     s7, ft7
                  fsqrt.s      ft1, ft7, rtz
                  fcvt.wu.s    s2, fs1, rne
                  fsgnj.s      fs6, ft11, fs8
                  add          s7, a6, t4
                  slli         s9, s3, 19
                  slt          t2, s10, a1
                  remu         a3, s2, a1
                  fsub.s       ft11, ft1, fa0
                  sub          a0, s9, t1
                  nop
                  sub          a0, a5, a3
                  nop
                  lui          a3, 429556
                  xor          a1, s6, t1
                  srl          t1, t3, gp
                  fle.s        t3, fa5, fs8
                  feq.s        s9, fa6, ft9
                  fdiv.s       fs2, ft11, ft10, rne
                  fmul.s       fa5, fs3, ft9
                  or           t4, s10, a4
                  fcvt.w.s     t3, ft4
                  sra          a1, t0, a1
                  rem          t4, a4, sp
                  fclass.s     gp, ft8
                  fcvt.w.s     a7, fa4
                  fsgnjn.s     fs10, ft11, ft9
                  fsgnj.s      ft5, fs9, ft7
                  mul          s3, zero, s11
                  fsqrt.s      ft4, fa7
                  fdiv.s       fa4, ft2, fs6
                  sra          s3, s6, a7
                  fmul.s       fa4, fs5, fa0, rmm
                  fadd.s       fs7, ft4, fs7, rmm
                  lui          t1, 540886
                  addi         a5, a6, -872
                  slti         s0, zero, 611
                  auipc        s3, 771720
                  div          s9, t3, tp
                  slt          t3, t4, t4
                  div          a6, a5, a3
                  fmv.w.x      fs9, s3
                  sltiu        t3, s9, 914
                  srai         s10, a1, 11
                  sll          t6, s9, a3
                  fclass.s     s8, fs2
                  fsgnjn.s     fa2, fa3, ft8
                  auipc        t6, 54034
                  fcvt.wu.s    s3, fa3, rne
                  or           s0, tp, a4
                  div          s6, a4, t2
                  sltu         s4, ra, s2
                  slt          t0, a7, s1
                  fmv.x.w      s1, fs7
                  sltu         s8, s1, s3
                  fsub.s       fs3, fa0, fa0, rtz
                  slt          s11, gp, a0
                  fle.s        t3, fa6, fs10
                  fmul.s       ft4, ft5, ft10, rne
                  xor          a3, a4, t5
                  flt.s        a0, fa0, fa6
                  fadd.s       fs3, ft6, fa4, rup
                  xori         a1, zero, -957
                  sra          a3, t4, s2
                  slti         s10, a6, 443
                  and          tp, t4, zero
                  sltu         s3, t6, sp
                  srli         s8, t0, 17
                  fsgnjn.s     fs8, fa1, ft5
                  fdiv.s       fs4, fa1, fa5, rdn
                  fsgnjn.s     ft10, fa7, ft0
                  mulh         t3, sp, zero
                  rem          a6, gp, t0
                  sltu         a7, s5, s3
                  fsub.s       fa4, fa4, fa5
                  fcvt.s.wu    fs3, a5
                  fsub.s       fa7, ft4, fa7, rmm
                  fmin.s       fa5, fs0, ft6
                  ori          t2, a1, 1570
                  fsqrt.s      fs3, ft2
                  fadd.s       fs1, ft1, ft2
                  fle.s        a2, ft3, fa0
                  sra          s2, t5, t4
                  fmv.w.x      fs10, s9
                  lui          s8, 864124
                  fdiv.s       fs10, fa6, fs0
                  auipc        s9, 388498
                  and          a1, t0, t2
                  fsqrt.s      fs8, ft0
                  fmin.s       fs7, ft3, fs4
                  remu         a5, s11, s6
                  fdiv.s       fs0, fs2, ft2
                  fsgnj.s      ft5, ft10, fa3
                  lui          tp, 637846
                  nop
                  fmv.x.w      a0, fs6
                  andi         a1, s8, -1384
                  fmin.s       ft0, fs7, fs3
                  fsgnj.s      fa2, fs5, fs9
                  sltiu        t0, s2, -1771
                  sub          a5, t1, s2
                  fmv.x.w      s9, fs4
                  mulhu        t3, s0, s4
                  fmv.w.x      ft10, t2
                  mulhsu       s4, s5, s6
                  fcvt.w.s     a0, fa2, rup
                  sll          s3, a5, a6
                  slt          s2, a5, s1
                  sra          s8, s4, s0
                  add          ra, gp, a4
                  fcvt.w.s     a2, fa5, rdn
                  fclass.s     t6, fs1
                  fcvt.s.wu    fs4, a7, rtz
                  slti         a3, t5, 1273
                  sltiu        a3, zero, 179
                  fadd.s       fs3, fs9, fs11
                  sltiu        t2, t0, 1176
                  add          t0, t1, a0
                  fmv.w.x      fa7, t4
                  divu         s10, a2, a3
                  fcvt.s.w     fa7, t5, rup
                  fmv.x.w      a7, ft4
                  slt          s11, t5, s7
                  fmax.s       ft2, ft4, fa5
                  mul          t6, t1, s10
                  fcvt.w.s     s10, ft8, rmm
                  mulhu        s3, s1, s2
                  mul          zero, s4, s3
                  fcvt.w.s     s6, fs5
                  or           s6, sp, sp
                  sra          s3, s9, s2
                  flt.s        zero, fs11, fa6
                  fadd.s       ft6, fa4, ft3
                  rem          a6, t2, sp
                  mul          s1, ra, t2
                  fcvt.s.w     fa5, tp
                  fmv.x.w      s10, fa7
                  auipc        a6, 460812
                  addi         s6, a4, 640
                  sll          s6, s7, a7
                  slti         ra, s4, 1741
                  sra          t3, s6, a3
                  xor          t6, t5, s6
                  mulhu        s8, a5, a6
                  sltiu        s4, zero, -574
                  fmax.s       ft10, fs5, fs0
                  feq.s        a7, ft0, ft10
                  fmv.x.w      gp, ft9
                  srli         s4, a0, 7
                  rem          tp, t3, s1
                  fmv.x.w      t4, ft6
                  fle.s        t0, fs9, fa1
                  fclass.s     s3, fs6
                  fsgnjn.s     fs5, ft5, fa4
                  flt.s        s0, ft5, ft5
                  nop
                  sub          t0, a6, zero
                  fdiv.s       ft7, ft7, fs4
                  sra          s4, a4, a1
                  fsqrt.s      fs1, fs6, rmm
                  slt          gp, t5, s8
                  nop
                  flt.s        a3, ft1, fs8
                  sll          s7, zero, t4
                  mulhu        s2, a1, zero
                  rem          ra, t1, ra
                  mulh         zero, s6, a4
                  addi         a7, t4, 1881
                  fdiv.s       ft1, ft5, ft2
                  fadd.s       fs5, ft10, fs2, rmm
                  xor          s8, a1, a3
                  addi         t3, a0, 1983
                  srl          gp, t5, s7
                  xori         s11, t4, 66
                  fmv.x.w      s0, ft11
                  addi         a1, a7, 2016
                  slt          a0, a1, a5
                  divu         t1, t4, s2
                  slli         s1, t0, 22
                  xori         t2, a2, 549
                  fadd.s       fa1, fs5, ft1, rup
                  auipc        a1, 749790
                  ori          s1, a7, -50
                  add          s10, a4, s3
                  sub          t0, t1, s11
                  fmax.s       ft9, fa5, fa2
                  fclass.s     a5, ft11
                  fsgnjn.s     fa0, fa6, fa3
                  fmin.s       fs9, fs6, ft1
                  auipc        a5, 285061
                  auipc        s9, 166226
                  fsgnjn.s     fs6, fs7, ft11
                  fmax.s       ft1, fs11, fs1
                  feq.s        s10, fa3, ft8
                  fcvt.wu.s    s8, fa7
                  srli         a0, s6, 21
                  sll          ra, a6, t6
                  fmv.x.w      ra, fs6
                  fmax.s       fs3, fs5, fa4
                  mulhu        a2, t3, a0
                  andi         a3, s4, 377
                  fsgnjn.s     fs9, fa7, ft6
                  slli         a1, t1, 13
                  sll          s9, s8, t2
                  nop
                  mulhu        gp, gp, s5
                  fcvt.w.s     a5, ft1, rup
                  sll          tp, a3, s2
                  divu         t0, tp, s10
                  addi         a2, a1, -842
                  auipc        s8, 743278
                  remu         s6, s2, t6
                  fcvt.w.s     a6, fs5, rdn
                  slt          a4, s8, s7
                  fmv.x.w      s3, fs10
                  auipc        a7, 313137
                  fsqrt.s      fs7, ft1, rne
                  fadd.s       fa6, ft11, ft9, rdn
                  fsqrt.s      ft6, fs0
                  fmul.s       fs11, fa3, ft4
                  add          t6, a4, tp
                  srai         s11, a2, 26
                  addi         s3, t4, 1008
                  ori          a3, a2, 718
                  fcvt.wu.s    s3, ft7
                  fcvt.w.s     t2, ft7
                  fsgnj.s      ft9, fs8, fs9
                  fmv.x.w      t6, fa1
                  mulhsu       a7, s4, s8
                  mul          a0, a1, t2
                  fcvt.wu.s    t3, fa2, rtz
                  auipc        t2, 472529
                  sltiu        a4, s0, 244
                  srl          t2, gp, t4
                  sltu         t4, s9, a7
                  feq.s        t4, ft6, fs6
                  fmax.s       fa4, fa1, fs9
                  fcvt.wu.s    s8, ft7
                  fclass.s     s6, ft1
                  srl          a7, s5, zero
                  sra          t1, s7, a1
                  fmin.s       fs1, fs1, fa7
                  ori          a2, a1, 116
                  fcvt.w.s     a7, fs5
                  ori          a1, s1, 1781
                  fcvt.wu.s    t0, fs1, rmm
                  srl          a0, a4, s5
                  lui          a3, 626773
                  fadd.s       fs3, ft2, ft0, rne
                  srli         a7, t6, 7
                  sra          t1, s5, s6
                  nop
                  slt          t0, s9, t3
                  mulh         s4, a3, t4
                  slt          t2, s4, s4
                  lui          a3, 1018825
                  sltu         s11, a6, t2
                  srl          t0, zero, s6
                  fsgnjx.s     fa6, fs11, fs4
                  slt          gp, t6, a7
                  fmv.x.w      a6, ft10
                  sub          s3, t0, t3
                  fmul.s       ft0, fs7, ft2
                  add          ra, t3, a5
                  slti         t2, t1, -596
                  divu         a5, a4, t2
                  mul          tp, t0, s1
                  sltiu        tp, t6, -1533
                  add          a0, s8, s2
                  andi         s9, s9, 940
                  remu         ra, sp, t1
                  rem          s6, s11, t2
                  divu         s6, a6, a4
                  divu         s0, a3, s9
                  fmv.w.x      ft2, t0
                  remu         zero, t2, s10
                  sltiu        s4, t0, 1079
                  nop
                  fdiv.s       fs9, ft5, ft6
                  fsqrt.s      fs8, ft0
                  fsgnj.s      ft8, ft11, ft3
                  lui          zero, 123887
                  mul          zero, t6, s8
                  fadd.s       fs3, ft1, fa2
                  srli         gp, gp, 14
                  slti         t0, a3, -604
                  ori          a4, a0, 523
                  xori         s8, a5, -1143
                  auipc        s4, 321159
                  div          s10, t1, s3
                  sll          a2, a2, t1
                  slti         ra, t6, -1985
                  slti         a7, s7, 268
                  sltiu        s7, t6, 868
                  fsgnjn.s     fs2, fa0, ft5
                  sltu         a2, a7, t2
                  srai         s4, s9, 10
                  fsqrt.s      fa3, fs11, rup
                  fmin.s       fs9, ft7, ft7
                  fle.s        a6, fs5, ft8
                  addi         a7, s11, -1308
                  remu         a3, s11, zero
                  ori          a7, t3, -1198
                  fcvt.wu.s    a5, ft2
                  fclass.s     s0, ft3
                  fcvt.s.w     ft7, t4, rne
                  fsub.s       fs4, fs8, fa4
                  fsgnj.s      fs11, fa5, ft8
                  fmv.x.w      s1, fs8
                  fsgnjx.s     fs0, fs8, fa3
                  fsgnjn.s     fs7, ft2, fa2
                  fcvt.w.s     a3, fa2
                  xor          t1, t5, t1
                  slt          t6, ra, ra
                  fmv.w.x      fa4, t3
                  fsgnj.s      fs5, fa6, fs7
                  lui          s10, 636740
                  sltu         s7, s11, a5
                  sltiu        zero, t6, -1028
                  ori          t4, t0, 615
                  and          a7, s7, t0
                  xor          gp, a3, s4
                  flt.s        s3, fs6, ft11
                  fmax.s       ft3, fs10, fa5
                  fsgnjx.s     ft0, fs4, fs6
                  slli         gp, t5, 31
                  ori          zero, a3, 915
                  xori         s9, a2, 1763
                  sub          s2, a6, a5
                  fmv.x.w      gp, ft0
                  sltiu        t4, t0, 239
                  mulhsu       a6, t1, s5
                  and          t6, t1, a7
                  add          t2, s2, s11
                  xor          s2, t0, t3
                  fcvt.s.wu    fa6, s6
                  feq.s        ra, fs7, ft10
                  mul          a3, a0, s3
                  mulhsu       s4, s5, a3
                  fsgnjx.s     fs8, ft2, ft1
                  fmv.x.w      s1, fs8
                  xor          a7, t1, a7
                  fclass.s     a1, fs9
                  mulh         s7, t0, s5
                  nop
                  fcvt.wu.s    s11, ft9, rtz
                  fle.s        t3, ft1, fs8
                  fsgnjn.s     fs3, ft0, fa1
                  fle.s        s10, fa4, fa6
                  lui          a6, 840952
                  addi         s11, t1, 861
                  mul          a1, t4, s3
                  nop
                  fmin.s       fa0, fa1, ft10
                  lui          s0, 575974
                  fle.s        a1, fs11, fa7
                  nop
                  fdiv.s       fa0, fs4, fs10
                  mulhsu       s1, s3, s1
                  fsub.s       ft8, fa7, fs11, rup
                  flt.s        zero, fs8, ft1
                  sra          s3, s1, s4
                  fmv.w.x      fs11, ra
                  sltu         a0, tp, s11
                  fcvt.s.wu    ft3, s4
                  mulhu        t0, t2, s6
                  slt          t1, s2, s2
                  divu         s3, s9, s9
                  fcvt.s.wu    fs3, a3, rne
                  srai         a5, s6, 28
                  lui          s6, 470797
                  sll          zero, a0, s0
                  srl          s2, a5, t3
                  auipc        a0, 342126
                  div          a3, s2, s3
                  sub          s6, s2, s0
                  fmv.w.x      fa6, a2
                  srai         s3, t6, 30
                  sll          s9, a7, a3
                  rem          a4, s1, a5
                  fmv.x.w      s8, fa0
                  fcvt.s.wu    fs11, s4
                  xor          t4, a5, s11
                  divu         s7, a3, tp
                  fmv.w.x      ft8, s3
                  xori         a7, a6, 756
                  sra          t3, t0, s2
                  or           s9, t1, a1
                  flt.s        gp, fs7, fa6
                  sub          a2, s5, ra
                  divu         t1, a7, s7
                  slti         t1, zero, 671
                  fsub.s       fa4, fs0, fa2
                  slt          a5, a4, s9
                  fcvt.s.wu    ft5, a6, rmm
                  mulhsu       s2, s11, s10
                  or           a4, ra, s5
                  srai         s3, a5, 3
                  srai         s10, s3, 22
                  rem          s9, ra, s1
                  feq.s        a6, fs11, ft1
                  fmv.w.x      fs4, ra
                  srl          tp, t2, s4
                  fadd.s       fa0, fs7, fs6, rne
                  sltiu        a1, a6, 1853
                  fmul.s       fa2, ft0, ft2, rdn
                  fcvt.wu.s    s7, ft6, rtz
                  srai         s0, s9, 30
                  nop
                  feq.s        t1, ft5, fs3
                  slli         s6, a4, 26
                  feq.s        ra, fs11, ft8
                  fsgnjx.s     ft7, ft11, fs10
                  srli         a4, sp, 26
                  sub          a2, s2, zero
                  sra          a4, s9, a0
                  fsgnjx.s     fa4, fa3, fs8
                  flt.s        tp, fa2, fa7
                  fdiv.s       fs9, fa2, fa1
                  auipc        s8, 487234
                  fsqrt.s      ft1, fs9, rdn
                  slti         t3, t3, 1046
                  srl          s0, sp, a1
                  srli         t3, t6, 17
                  fmul.s       fa1, fs0, fa4, rtz
                  fsub.s       fs2, fs4, fs0
                  and          a0, s9, t1
                  mulhsu       t2, a0, s3
                  mulh         s6, s10, ra
                  lui          s2, 840275
                  srl          s9, zero, a3
                  fcvt.s.w     fs5, t1
                  feq.s        s11, ft0, fa0
                  fle.s        gp, fa6, ft1
                  fle.s        a0, ft9, ft3
                  fsub.s       fa5, ft6, ft7, rmm
                  auipc        s10, 150934
                  sll          t4, t6, sp
                  slli         a1, a3, 4
                  srl          zero, a1, s1
                  srli         s11, sp, 8
                  fcvt.wu.s    s3, fs0
                  flt.s        s4, ft10, fs8
                  divu         s8, s4, s0
                  fadd.s       fs1, fs8, ft10
                  fclass.s     tp, fs11
                  divu         s3, a2, zero
                  fcvt.wu.s    a6, ft7, rmm
                  fmax.s       fs10, ft9, fs4
                  fcvt.wu.s    a7, fs2, rne
                  mulh         s1, a6, s10
                  mul          s9, t5, t5
                  fclass.s     s7, fa1
                  fdiv.s       fs8, fa4, ft5, rmm
                  remu         a7, t1, a5
                  fle.s        zero, fs3, ft9
                  srai         tp, s4, 24
                  ori          t3, s10, -1148
                  remu         zero, s9, s10
                  fmax.s       fs0, ft8, fs2
                  srai         t1, t2, 20
                  nop
                  sltu         s6, s3, a6
                  addi         a6, gp, 1466
                  and          s10, t5, s11
                  mul          t4, s8, t5
                  fmv.w.x      ft1, t1
                  rem          s9, s0, s7
                  mulh         a5, tp, s6
                  sra          a1, t6, t4
                  slt          s9, s6, s6
                  mul          s1, a6, a3
                  mulh         tp, sp, a5
                  fsub.s       fs8, fs1, ft8, rtz
                  fsgnj.s      ft1, fs7, fa6
                  sra          s7, a5, a5
                  ori          a3, ra, -1078
                  sltu         s0, t4, a6
                  mulh         t0, sp, s9
                  remu         a0, a2, sp
                  divu         t1, a2, a1
                  fmin.s       ft9, fs1, ft9
                  fmul.s       fa2, fs2, ft5
                  auipc        s0, 515198
                  mulh         s0, s2, zero
                  mulhu        s2, s5, tp
                  slti         t4, t3, -1868
                  fle.s        s3, ft2, fs5
                  div          a3, s0, s2
                  addi         s3, s8, -839
                  addi         a3, s0, -1771
                  fcvt.s.wu    fs11, a6, rup
                  mulh         t6, t3, t1
                  fclass.s     a6, fa5
                  mulhsu       s9, s0, a3
                  fmv.x.w      a1, fs11
                  slti         t3, a7, 1278
                  or           a2, t2, t6
                  fadd.s       ft4, fa2, ft11, rtz
                  flt.s        s3, ft8, ft1
                  feq.s        t1, ft6, ft7
                  div          s6, t6, a1
                  fmin.s       fs8, fs0, fa0
                  addi         a1, s8, 1543
                  fdiv.s       fa1, fa7, ft1, rmm
                  nop
                  fcvt.s.wu    ft4, s1, rdn
                  mul          ra, a7, a1
                  srli         t3, s9, 30
                  fcvt.w.s     a7, ft4
                  rem          s2, a0, a0
                  fmul.s       fs8, fa2, fs11
                  xor          s7, t5, t1
                  mulhu        t6, t5, a4
                  fsgnjx.s     fa4, fa0, fs11
                  fsgnjx.s     ft0, ft8, fs5
                  fadd.s       ft7, fs2, ft7
                  rem          a4, t5, tp
                  fsgnjn.s     fs3, fs9, fs6
                  fsgnj.s      fs11, fs4, fa6
                  fsgnjn.s     fs3, ft1, fa6
                  divu         t1, s1, t1
                  flt.s        s9, fa0, ft3
                  srl          s7, a2, s3
                  fcvt.w.s     s9, ft5, rup
                  sll          s11, s0, t6
                  fle.s        a4, fa4, ft3
                  fle.s        t4, fa0, fs1
                  slt          a0, a1, s7
                  srl          a7, s8, ra
                  sll          a7, s1, a2
                  andi         zero, gp, -1525
                  sll          s1, t5, sp
                  fdiv.s       fs1, fs2, fs1
                  sltiu        t4, s1, 1910
                  nop
                  mulh         a7, s4, a0
                  divu         a4, s11, t6
                  sll          t4, a0, s2
                  fclass.s     s3, fs4
                  div          t4, s8, s2
                  ori          gp, s7, -1440
                  or           a5, t6, s11
                  fcvt.w.s     t2, fa7, rdn
                  add          s3, tp, a1
                  fsgnj.s      ft9, ft0, fs3
                  mulhsu       a5, s11, s7
                  xori         t4, tp, -1278
                  srl          t0, s3, s4
                  sll          a0, a6, t0
                  divu         a0, t5, s0
                  fmul.s       ft4, fs11, fa5
                  sltiu        s2, zero, 638
                  fsgnjn.s     fs1, fs3, fs9
                  slli         a6, s2, 31
                  xori         s9, s3, 1163
                  fadd.s       ft11, ft1, fs5, rne
                  sltiu        a4, a5, 414
                  flt.s        a0, fa0, fa5
                  auipc        t0, 448183
                  remu         tp, s7, zero
                  fsqrt.s      ft6, fs4, rne
                  srli         a7, t1, 30
                  sltu         a0, a4, a5
                  fsgnj.s      fa5, fs6, fa5
                  fdiv.s       fa5, ft8, ft4, rup
                  div          s1, s11, s2
                  div          s1, a2, s7
                  srli         t0, ra, 27
                  fcvt.s.w     ft8, zero, rdn
                  slti         t0, t0, -825
                  ori          s3, s10, 1504
                  fcvt.s.wu    ft4, s7
                  remu         a7, sp, tp
                  sltiu        a0, a3, -146
                  slt          tp, tp, s8
                  mulhu        a1, t6, a6
                  flt.s        a0, ft2, fs7
                  addi         tp, gp, -906
                  fmul.s       fa6, fa4, fs6, rup
                  mul          a4, s2, ra
                  mulh         a5, s8, t1
                  fmv.x.w      s0, fa3
                  fcvt.s.w     ft6, t2
                  srli         t0, gp, 28
                  lui          t4, 176095
                  remu         t2, s6, s11
                  fdiv.s       fs11, fa6, fa4
                  auipc        s0, 871249
                  fmul.s       fa7, ft2, fs8
                  rem          s11, s7, s10
                  fsub.s       ft11, fa6, ft9
                  sltiu        s4, s6, -1677
                  lui          s6, 256935
                  sra          a5, tp, a6
                  fmin.s       fs11, ft11, fa3
                  feq.s        a1, ft9, fs10
                  sltu         s9, t1, t6
                  xori         a6, s3, -1786
                  mulhu        zero, t1, s1
                  slli         a6, t1, 30
                  feq.s        a6, fs3, fs1
                  mulh         t2, t6, s4
                  slt          s3, a7, s4
                  add          gp, s9, a0
                  feq.s        t2, ft4, fs10
                  andi         t2, sp, -129
                  ori          t0, t3, -891
                  fle.s        a3, ft6, ft1
                  ori          s2, s7, 1610
                  divu         t1, sp, t3
                  fmin.s       fs5, fs1, fa0
                  xor          s11, t3, a0
                  and          a3, a2, s1
                  flt.s        s1, fs8, fs3
                  mul          a6, t0, s3
                  add          s6, s6, a7
                  fmin.s       ft2, fa0, fa2
                  mul          tp, s3, t6
                  mulhu        a7, s11, sp
                  fcvt.s.w     ft5, t3, rtz
                  fmul.s       fs3, fs8, fs8, rne
                  lui          s11, 27292
                  sub          s6, s6, s6
                  fmul.s       fs10, fs9, fa1
                  fmul.s       ft3, fa3, ft2
                  fmax.s       ft1, fs3, fa7
                  slt          s11, a5, s9
                  or           t1, a1, a0
                  fsqrt.s      ft10, fa3
                  mulhu        t6, s5, s3
                  slt          s1, zero, s0
                  fcvt.s.w     fs2, a3, rne
                  sra          s6, t1, a6
                  remu         t3, t2, t5
                  fcvt.s.wu    fa1, s0, rmm
                  fdiv.s       fs8, ft5, ft6, rup
                  mulhsu       a2, t4, sp
                  fclass.s     t6, ft9
                  fcvt.s.w     ft6, t4
                  fmax.s       ft7, fs9, fa4
                  fcvt.wu.s    s0, fs6
                  fmin.s       fa5, fs0, fs11
                  fdiv.s       fa3, fa4, ft0, rmm
                  addi         t3, gp, -737
                  addi         zero, s4, -355
                  flt.s        s8, fs5, fa7
                  fsub.s       ft10, fs11, fs4, rtz
                  xori         s11, t0, 558
                  slt          a4, s11, s5
                  fcvt.s.w     fs5, zero, rup
                  fle.s        s0, fs3, fs9
                  mul          a2, zero, t5
                  flt.s        s11, fs5, fs6
                  slli         a7, a6, 29
                  fmv.x.w      s3, fa4
                  sra          ra, a5, zero
                  xori         a4, a2, -394
                  slti         t2, s8, -1201
                  slti         t2, s1, 1718
                  fmin.s       fs5, fs8, ft3
                  fle.s        a2, ft1, ft11
                  fcvt.s.w     fs10, t3
                  xori         s4, zero, 1346
                  fsgnjx.s     fa2, ft3, ft3
                  auipc        s6, 999623
                  mulhu        s11, s0, a3
                  fmax.s       ft3, fs5, fs9
                  xor          s3, t4, s2
                  fcvt.s.w     fa5, s6
                  fsgnj.s      ft2, fs1, fs0
                  fsgnj.s      fs10, fs5, ft11
                  mulhu        s10, s0, s3
                  nop
                  fmv.x.w      zero, ft3
                  mulh         a4, a3, gp
                  sltu         s10, s0, a0
                  mulhu        s3, ra, t0
                  srai         s2, s2, 23
                  lui          a2, 876665
                  flt.s        ra, ft6, fa7
                  fsgnjn.s     fs3, fs0, ft5
                  fsgnjx.s     fs0, fs8, fs8
                  remu         a2, t5, s7
                  ori          t6, t4, -1994
                  fcvt.w.s     s0, ft8
                  sltiu        t3, a6, 533
                  divu         a6, t4, zero
                  sltu         tp, gp, s7
                  fmin.s       fs2, fs9, fa6
                  fsgnjn.s     ft2, fa5, ft3
                  slti         s11, a3, 807
                  xor          t1, a2, a5
                  mulh         t3, t3, s6
                  slli         t6, a2, 2
                  slti         a0, a1, 115
                  xor          a1, s6, t4
                  srli         s1, s0, 20
                  slli         s7, s4, 25
                  addi         a7, a4, -1584
                  fadd.s       ft5, fs3, ft10
                  xori         a0, s11, 1553
                  slt          s9, s9, s4
                  mul          t3, a6, a0
                  fcvt.wu.s    a5, ft2, rtz
                  srai         s3, a5, 10
                  mulhsu       a7, s11, s3
                  mulh         a0, a3, a6
                  slli         s0, a2, 23
                  fsgnj.s      ft4, fa0, fs0
                  add          a0, s10, t5
                  lui          zero, 64948
                  fmin.s       fs7, ft9, fa1
                  fadd.s       ft10, fs0, ft1, rtz
                  fcvt.s.wu    ft11, s8
                  srli         t3, s11, 1
                  fcvt.s.w     fa5, s11
                  fsgnjn.s     fs5, fs7, fa1
                  fsub.s       fa5, fs11, ft5
                  sltu         ra, a3, s4
                  fdiv.s       ft8, fs6, fa5, rmm
                  fsqrt.s      fa5, fs6
                  add          s11, a5, a5
                  sll          t1, a4, a5
                  srl          a2, a4, tp
                  or           a3, a1, a5
                  fmul.s       ft6, fs4, ft3, rmm
                  mulhu        s1, ra, s11
                  and          s3, t6, gp
                  fsqrt.s      fa0, ft9
                  mulh         a6, a2, s3
                  fcvt.s.wu    ft10, s4
                  fclass.s     s7, fa2
                  fcvt.s.wu    fa6, t0, rup
                  or           a4, s3, ra
                  slt          s2, t1, a5
                  and          a5, s11, s9
                  fsgnjn.s     fa3, fs5, fs10
                  srl          s2, ra, a3
                  feq.s        t0, fs10, fa0
                  fclass.s     s10, fs2
                  mul          s10, t3, a6
                  nop
                  sltiu        t1, a6, 1381
                  sub          s1, t5, a7
                  fsub.s       fa6, fs3, fa7
                  add          a7, t6, s1
                  auipc        a1, 481941
                  mulhsu       tp, s8, t1
                  fsqrt.s      ft3, ft1, rup
                  fcvt.w.s     t0, fa2, rup
                  fdiv.s       fa5, fa1, ft8, rtz
                  divu         a4, t0, a1
                  srl          a6, t5, t6
                  srai         gp, a0, 11
                  nop
                  divu         s11, a4, t6
                  divu         t1, a0, s6
                  div          t2, a1, a7
                  fsub.s       fs3, ft11, ft0, rup
                  fle.s        a3, fa1, ft0
                  fle.s        t0, fs8, ft10
                  ori          a0, a0, -395
                  remu         s4, a7, a1
                  fmin.s       ft4, ft5, fs3
                  xori         a6, s10, -65
                  srli         s0, t5, 18
                  fcvt.w.s     zero, ft5
                  srai         a6, s2, 12
                  and          s9, s3, t5
                  flt.s        s10, fs10, ft2
                  divu         t3, a5, tp
                  fcvt.w.s     a7, ft1
                  addi         a4, s1, 1173
                  and          ra, a6, zero
                  srai         gp, s9, 2
                  fmv.w.x      fa4, a3
                  fcvt.s.wu    fa2, s7
                  sltiu        t0, a4, 148
                  fcvt.w.s     tp, ft10, rne
                  xor          s4, s6, a0
                  fmul.s       ft4, fs2, fs5
                  srai         s2, zero, 2
                  andi         a2, t4, -509
                  fmv.x.w      tp, fs5
                  fsgnjn.s     ft3, fs8, fs4
                  rem          s0, s0, ra
                  auipc        a2, 245010
                  mulhsu       ra, a5, t2
                  fmul.s       fs4, ft0, fs3, rmm
                  fle.s        a7, ft3, fs5
                  fmul.s       fs6, ft6, ft4
                  sltiu        t1, a7, 1055
                  and          s2, s11, s11
                  mulh         s6, s5, a2
                  fle.s        a6, fa1, fs11
                  slli         s8, zero, 10
                  addi         s9, s0, -618
                  sltu         a0, t3, ra
                  remu         a7, s2, s4
                  slti         t1, gp, -726
                  slli         ra, t5, 2
                  andi         t1, a0, 2017
                  fmax.s       fs9, fs5, fs10
                  srli         s11, a2, 4
                  fle.s        a3, fa0, fs5
                  sra          ra, s8, s9
                  fadd.s       ft3, fa7, ft8, rne
                  fsgnj.s      fa6, ft8, ft9
                  lui          t1, 33570
                  srl          s10, a4, a4
                  srl          t1, s3, zero
                  sltu         a0, t5, gp
                  fcvt.s.wu    fs8, t1, rne
                  remu         t1, a3, t6
                  fmax.s       fs0, fa1, ft9
                  slt          a7, t6, a3
                  fmv.x.w      zero, fa4
                  fcvt.s.wu    ft5, s6
                  fmv.w.x      ft3, t3
                  srai         a0, s10, 31
                  sltiu        s1, a6, -275
                  divu         s9, s8, sp
                  fsub.s       fs1, fs3, fa0, rne
                  xori         t2, a1, -933
                  fcvt.w.s     s6, fs1, rdn
                  fle.s        a4, ft9, ft7
                  fadd.s       ft3, ft10, fs6
                  slli         s11, gp, 3
                  fadd.s       ft2, fs2, ft2, rne
                  slti         s9, t4, 229
                  sll          tp, t0, t0
                  nop
                  fsqrt.s      fs7, fs0
                  srai         a4, t4, 2
                  fsub.s       fs7, ft5, fs3, rne
                  slt          t6, s4, a3
                  sll          tp, zero, ra
                  auipc        a0, 395067
                  andi         a2, s8, 2005
                  fclass.s     a0, fa6
                  fmv.x.w      s10, fa1
                  or           s8, a2, s0
                  sra          a5, s10, s2
                  fadd.s       ft0, ft1, ft1
                  sltu         t1, t1, t5
                  and          s7, t1, s7
                  xor          t2, a3, a1
                  fcvt.w.s     s4, fs6
                  sub          t2, tp, t2
                  fsgnjx.s     ft0, fa5, ft4
                  fle.s        s6, ft9, fa3
                  feq.s        t2, fs10, fa1
                  srli         zero, a3, 8
                  lui          ra, 828187
                  sll          a7, s10, t3
                  or           s10, gp, t2
                  fcvt.w.s     a3, fs6, rmm
                  fcvt.s.wu    ft3, t0
                  mulh         a6, t1, t4
                  auipc        zero, 99578
                  fsgnjx.s     fs11, fs6, fs8
                  mulhu        zero, t1, a3
                  mul          t0, s4, t3
                  fadd.s       fs11, fs0, fa3, rdn
                  sub          a3, s8, a7
                  fsgnjn.s     ft2, fs8, fs1
                  mulh         s8, t3, s6
                  srl          t6, t5, t5
                  lui          t0, 983208
                  fsqrt.s      fa7, ft7, rdn
                  fmv.x.w      a0, fa0
                  ori          s8, a2, 1120
                  fmax.s       fa3, fa3, fa5
                  xor          a6, tp, a5
                  srai         t2, s3, 2
                  sltiu        s2, tp, -1271
                  fmin.s       fa1, fa5, fa1
                  xori         a4, s0, -1643
                  add          s11, zero, s9
                  mul          a6, t4, tp
                  mulh         t6, s0, tp
                  div          a2, zero, gp
                  add          t0, t5, s0
                  sltiu        t2, a3, -434
                  fmin.s       fs4, ft8, ft0
                  add          t1, s2, t2
                  srli         s11, a6, 23
                  feq.s        s3, fs7, fs4
                  srli         a5, gp, 24
                  rem          t6, t5, s5
                  fclass.s     t4, ft10
                  fcvt.wu.s    t4, ft5, rmm
                  mulh         s9, ra, a3
                  mulhu        s2, s1, s11
                  fsub.s       fs9, fs5, fs5
                  fmv.x.w      a0, fs8
                  and          a4, ra, s4
                  srai         s11, zero, 8
                  sltu         zero, s3, s7
                  fsub.s       fa5, ft10, fs1
                  srai         t1, a6, 24
                  sltiu        s0, s2, -6
                  fsqrt.s      fa7, fs5, rdn
                  slt          a7, s8, s1
                  fsqrt.s      fa6, fs3
                  slt          s8, a7, s11
                  nop
                  slti         s10, s3, 1819
                  fcvt.w.s     zero, fs2, rup
                  sra          s6, a6, t4
                  fcvt.s.wu    fa6, a1, rmm
                  sltu         t3, a7, t0
                  sltiu        a0, t5, 560
                  and          t3, a1, t4
                  mulh         ra, s0, a4
                  fle.s        s1, ft5, fa2
                  div          s0, t3, s1
                  slt          t2, t6, a6
                  remu         t6, t2, zero
                  sub          a2, s6, s6
                  fcvt.s.wu    fs0, s4
                  remu         tp, a0, a5
                  fclass.s     s11, fs5
                  fmv.x.w      t1, ft3
                  mul          s10, a1, s5
                  ori          tp, s11, 1810
                  fsqrt.s      fa3, ft4, rmm
                  rem          t3, s8, s2
                  fsub.s       ft1, ft1, fs3
                  fsqrt.s      fa6, fa3, rmm
                  sub          s4, s11, s8
                  fcvt.s.wu    fs2, ra
                  mulhu        a4, s3, s8
                  fsqrt.s      fs11, ft3, rmm
                  srai         s2, t5, 10
                  mulhu        t3, a2, s0
                  fmin.s       fa0, fs2, ft9
                  and          s9, t3, s8
                  fcvt.s.wu    fs3, a7, rup
                  xori         t4, a0, 74
                  slti         zero, t2, 1173
                  sll          a6, a6, a0
                  srli         t4, t1, 30
                  fsub.s       fa6, ft6, ft3
                  and          t2, s10, t1
                  fmv.w.x      fs3, gp
                  fsgnjx.s     fs10, fa4, fs3
                  fclass.s     s9, ft0
                  fsub.s       fs9, fa4, fs3
                  srli         s0, gp, 13
                  fle.s        s6, fs3, ft4
                  fclass.s     s2, ft9
                  mulhu        s2, a4, s8
                  andi         s6, t6, 1023
                  and          s9, s8, t2
                  sltu         s11, s8, s5
                  auipc        s0, 165405
                  fmv.w.x      fa1, t3
                  ori          s2, a3, -888
                  srli         s11, t2, 2
                  sll          s10, a0, a2
                  add          t1, tp, t5
                  srli         t6, a6, 19
                  fdiv.s       fs9, ft11, fa3
                  srl          a0, s8, s2
                  srai         s6, t2, 29
                  fcvt.w.s     s0, ft3, rmm
                  fadd.s       ft5, ft11, ft5, rne
                  xori         s7, s1, -812
                  fcvt.w.s     t6, ft3
                  fmax.s       fa0, fa3, ft3
                  sub          t6, sp, s2
                  or           t2, s10, a5
                  fmin.s       fa7, fs9, ft8
                  srl          s2, tp, s0
                  srli         s6, a6, 25
                  slli         s2, a2, 10
                  fdiv.s       ft8, fa7, ft10, rup
                  sltu         s2, t3, tp
                  sltu         s11, t5, a7
                  mulhu        s8, s11, gp
                  sltiu        a7, s7, -1914
                  and          a1, s3, s8
                  flt.s        s7, fa4, ft6
                  sltiu        a7, t1, 1899
                  auipc        a2, 700853
                  nop
                  add          s2, t1, a4
                  xor          t6, a0, s4
                  divu         a1, s8, t5
                  slti         tp, a6, 292
                  fcvt.wu.s    a2, fa1, rup
                  div          t0, zero, t3
                  add          a3, t3, t5
                  flt.s        zero, ft7, fs9
                  and          a0, tp, a7
                  sll          a2, t1, s7
                  fclass.s     t6, ft7
                  fmul.s       fa1, fa2, ft2
                  xor          a0, t3, s4
                  mulhsu       a5, s0, tp
                  divu         s3, s2, s5
                  andi         a6, s4, -1289
                  rem          t4, a0, a7
                  fmin.s       ft1, ft11, fa5
                  fsgnjn.s     ft9, fs6, ft6
                  fsgnjx.s     ft11, fs11, ft11
                  fmax.s       fs1, fa0, ft1
                  fcvt.s.wu    ft7, t0
                  nop
                  srai         zero, ra, 30
                  fmax.s       ft8, ft6, fa3
                  fmax.s       fs6, fs3, fs11
                  div          a1, a3, s7
                  srai         ra, a0, 29
                  xori         t3, s8, 1124
                  nop
                  sltu         ra, s11, s4
                  mulhu        t4, s3, sp
                  fcvt.w.s     a0, fs4
                  auipc        zero, 159714
                  fmv.w.x      ft6, ra
                  flt.s        t3, ft0, ft7
                  feq.s        s11, fs1, fs10
                  sltu         s3, s10, a6
                  or           s9, s10, s1
                  sub          s2, s5, sp
                  nop
                  mulhsu       t6, s9, ra
                  lui          a1, 554569
                  addi         a1, t4, -829
                  divu         ra, t0, a3
                  srl          s2, s7, a3
                  fmax.s       fs0, fs4, ft7
                  srli         s1, t4, 15
                  remu         a2, zero, s10
                  fcvt.s.wu    fa4, sp
                  divu         a1, s6, t4
                  fsqrt.s      ft6, fs6, rdn
                  ori          a2, s2, -1221
                  fsgnj.s      fa7, ft9, ft10
                  andi         s4, a0, 72
                  slt          t2, a3, s10
                  fdiv.s       fs11, fs7, fs5
                  fclass.s     t2, fa5
                  srai         t1, s11, 24
                  slt          a3, s11, s2
                  fcvt.wu.s    a5, fs1, rtz
                  sub          s11, a2, tp
                  and          a7, zero, s11
                  fclass.s     t0, fs1
                  and          s4, a6, sp
                  fsgnjn.s     fa0, fs0, ft9
                  sltiu        a2, s0, 1294
                  div          t3, zero, s9
                  fcvt.w.s     t3, fs0
                  srli         a2, s8, 18
                  mul          s7, a7, a4
                  xori         s7, tp, -1840
                  nop
                  slti         t3, s1, -403
                  sltu         s9, t3, tp
                  xori         s0, t4, 1794
                  fadd.s       fs8, fa0, ft3
                  mul          a5, zero, a4
                  divu         s4, s11, s7
                  fadd.s       fs9, ft10, ft2, rne
                  fcvt.wu.s    a7, fs2
                  divu         s7, t2, s4
                  feq.s        s9, fa4, fa6
                  andi         s4, s6, 295
                  and          a2, t4, t2
                  fcvt.w.s     t0, fs1, rup
                  rem          tp, t2, s3
                  sll          t4, zero, a6
                  sra          t6, s10, s3
                  sltu         s4, s0, ra
                  fsub.s       ft4, ft1, ft2
                  mulh         s2, a3, t0
                  mulh         s4, gp, t0
                  fle.s        s0, ft3, ft0
                  mul          s1, s6, t3
                  rem          t2, t3, s11
                  mulhu        s6, a2, s0
                  div          t2, zero, sp
                  sub          t3, s0, a3
                  and          s8, a6, s2
                  sltu         zero, sp, zero
                  srli         s11, t3, 6
                  rem          s0, s1, tp
                  remu         s7, t5, a6
                  fclass.s     ra, fa4
                  fmul.s       fs10, fs7, fs4
                  fclass.s     zero, ft4
                  fmax.s       fa7, fs6, ft5
                  sub          s3, s4, s4
                  sltiu        t3, tp, -1999
                  srl          t2, s10, s1
                  sub          t4, s10, s7
                  mul          t6, s11, sp
                  addi         t0, a5, 1175
                  sltiu        t3, ra, 1086
                  xor          a4, s4, t0
                  div          a0, s8, sp
                  slt          s10, s0, t0
                  fmul.s       fs1, ft8, fa3, rdn
                  div          s2, t1, a6
                  fadd.s       fa7, fs11, fs1, rtz
                  fclass.s     t4, fa3
                  fmv.x.w      a5, ft9
                  sltiu        t6, a0, -628
                  srli         a4, s4, 5
                  slt          a4, t1, s6
                  fsgnjx.s     fs2, fa7, fa3
                  divu         t6, s11, s1
                  fsgnjn.s     ft4, ft4, fs5
                  fsqrt.s      fs6, fs11
                  srai         a0, a6, 0
                  fsub.s       fa7, fa0, fa6
                  addi         s1, ra, -908
                  fcvt.wu.s    s8, ft7
                  rem          s7, t6, ra
                  xor          a3, s1, sp
                  sll          s4, a3, a3
                  mulhu        ra, t1, sp
                  fadd.s       ft9, ft2, ft8
                  fadd.s       fa6, ft2, fs9
                  addi         s11, s11, 2038
                  ori          s9, s10, 1419
                  slt          s11, tp, gp
                  fadd.s       ft4, ft10, ft9, rtz
                  div          t6, a6, ra
                  fmv.x.w      a3, fs10
                  fclass.s     t6, fa2
                  fmv.x.w      t6, ft2
                  flt.s        t1, ft4, fs2
                  fmin.s       fs9, fa3, ft3
                  fsub.s       fs7, ft10, ft4
                  xori         t4, t3, 453
                  srl          s1, s9, s11
                  rem          a1, a3, a4
                  fcvt.w.s     gp, ft2
                  xori         s2, a1, 1953
                  fsgnjn.s     fa1, fa6, fa2
                  andi         s9, a5, 47
                  fmv.x.w      s7, fs11
                  srli         zero, t3, 18
                  feq.s        a6, ft11, fs10
                  or           a5, s0, t5
                  slli         a1, a7, 19
                  div          a7, a6, a6
                  or           t0, t0, a3
                  and          s11, a6, s5
                  rem          tp, s2, s11
                  fadd.s       ft2, ft10, ft7, rtz
                  flt.s        a4, fs1, fs3
                  fle.s        a2, fa7, fa0
                  sltiu        t3, sp, -1389
                  xori         s11, s4, 1792
                  fmul.s       fs11, fs10, fs5, rmm
                  sltiu        s3, s5, 499
                  andi         t2, ra, 203
                  srai         zero, s1, 29
                  fmin.s       fa3, ft2, fs9
                  srai         t0, a4, 20
                  nop
                  sub          a7, s6, a4
                  fsgnjx.s     ft4, fs10, fs2
                  slti         a4, a4, -1779
                  sltiu        s1, t5, 1542
                  and          a2, t5, a1
                  fmax.s       ft3, ft0, fa4
                  fcvt.wu.s    s6, fs6
                  slli         s7, s0, 7
                  sll          a7, t6, ra
                  feq.s        s0, fs1, fa3
                  fsgnjn.s     ft5, ft5, fa6
                  remu         s11, t6, a7
                  mulhu        a5, a6, zero
                  fcvt.wu.s    t4, ft10
                  xori         ra, s3, -1864
                  fadd.s       ft5, ft11, ft3, rup
                  sltiu        t3, t4, -1494
                  srli         s8, tp, 16
                  sltiu        a0, a3, -1113
                  fsgnj.s      fs8, fa4, fs1
                  xori         s6, s3, -778
                  sltiu        a3, s6, 257
                  or           s2, s4, s0
                  feq.s        s3, fs1, fa6
                  mul          a3, ra, s1
                  fsub.s       fa7, fs1, fs5, rtz
                  srli         s8, t4, 30
                  fsub.s       fs0, ft5, fa6, rdn
                  auipc        t4, 210535
                  feq.s        ra, fs8, fa3
                  fadd.s       ft1, fa0, fs11
                  srli         zero, s2, 30
                  fcvt.s.w     ft8, a3
                  sub          s6, a6, t6
                  sll          a3, a4, t6
                  nop
                  sra          s10, s5, ra
                  mulhu        a0, s7, t4
                  rem          s7, t0, a7
                  sll          s7, s9, s11
                  or           s0, s1, s6
                  xori         ra, a1, 264
                  fdiv.s       fs4, fs6, fa1
                  mul          s8, gp, s4
                  fmul.s       fa7, fs9, ft4, rdn
                  fsub.s       fa4, ft1, fs4
                  srl          ra, a2, t3
                  xor          a3, zero, s11
                  auipc        s8, 128579
                  sll          a6, s4, tp
                  flt.s        a6, ft10, fa2
                  remu         a7, s9, sp
                  auipc        gp, 336613
                  fmv.x.w      s6, ft3
                  fcvt.wu.s    a4, ft4, rup
                  mulhu        s3, s6, t2
                  sub          t2, s6, t4
                  xor          a4, sp, s11
                  sltu         s11, a4, s1
                  div          t4, a1, s6
                  fadd.s       fs9, fs6, fa4
                  rem          t1, s7, a2
                  fle.s        s6, ft4, fs4
                  mulhu        tp, s9, s1
                  srli         t2, s3, 30
                  fsqrt.s      ft9, fa0, rup
                  fclass.s     t4, fa6
                  srai         s6, zero, 19
                  sll          s2, s2, ra
                  fadd.s       ft10, fa5, fs1
                  fsgnjn.s     fs2, ft4, fs1
                  fsub.s       fs0, ft5, fa0, rup
                  xor          s3, sp, s9
                  mulhsu       a1, s7, s5
                  fclass.s     t3, ft5
                  sltu         s8, a2, t2
                  fsgnj.s      ft1, fs10, ft11
                  sltiu        a0, a4, 73
                  div          s1, s7, a0
                  ori          a5, s1, 202
                  div          a5, a1, s1
                  fcvt.s.w     ft9, t6, rdn
                  srl          s3, s3, s0
                  div          s8, t6, a5
                  fsgnjx.s     fa5, ft1, fs11
                  fsgnjn.s     fa3, fs8, fs9
                  remu         t4, zero, t0
                  mulhsu       a7, t2, a5
                  lui          s11, 705610
                  mul          t3, tp, a3
                  xor          a7, t2, a6
                  fclass.s     ra, fa5
                  fcvt.s.wu    fs6, s11
                  nop
                  fsgnj.s      ft5, fs11, fs9
                  srl          zero, t5, s2
                  fsgnjx.s     ft1, ft10, ft10
                  add          t6, tp, zero
                  flt.s        s6, ft7, fs2
                  fcvt.w.s     s9, fs11, rne
                  fcvt.w.s     ra, fa3
                  flt.s        s8, fs6, fs11
                  fdiv.s       ft9, ft2, ft5
                  slt          a5, s10, s1
                  fcvt.s.w     fs2, s11, rup
                  srai         ra, s0, 13
                  remu         s0, s2, s5
                  fmin.s       ft1, fs11, fs1
                  sltu         s1, t5, ra
                  divu         tp, s3, a6
                  andi         ra, a2, 1862
                  mulh         s11, a5, zero
                  sra          s1, s11, a2
                  divu         a3, s6, a5
                  fcvt.s.wu    ft3, sp, rmm
                  fcvt.s.wu    fs2, a3
                  ori          a1, a0, -1222
                  fsgnjx.s     ft4, fs7, ft0
                  fmv.x.w      ra, fs3
                  mulhsu       s1, s9, gp
                  srai         s0, zero, 15
                  mulhsu       a7, t4, a3
                  addi         s11, s0, -157
                  srl          s4, a1, t6
                  rem          s2, s5, a4
                  ori          t3, s4, 840
                  fclass.s     s0, fa5
                  or           a3, s6, s6
                  fclass.s     s2, fa5
                  fmul.s       ft5, fa5, ft9, rtz
                  fsgnj.s      fa1, ft10, fa4
                  mul          s6, t4, s2
                  fsgnjx.s     ft11, fa6, fa6
                  fmax.s       fs8, ft6, fs9
                  ori          s11, s10, 1323
                  fcvt.s.wu    fa1, a7, rne
                  fle.s        zero, fs9, fs11
                  xor          s1, s4, a3
                  sll          s0, t0, t3
                  fle.s        t2, ft7, ft2
                  rem          s10, a4, t6
                  sra          s4, ra, t5
                  sll          s0, t4, s5
                  ori          a5, a6, -2010
                  remu         s9, s0, t5
                  fmax.s       ft4, ft8, ft9
                  fmin.s       fs10, fs4, ft6
                  mulhu        s7, a6, t5
                  rem          a3, t1, a6
                  nop
                  addi         s1, t6, -1055
                  flt.s        t4, fa3, ft8
                  and          a3, a2, t2
                  fclass.s     s8, fa0
                  fmax.s       fa0, fa4, fa4
                  div          t2, s5, a6
                  nop
                  fsub.s       ft11, fs5, fs6, rup
                  mul          a2, t4, a0
                  fsqrt.s      fa4, fa5, rne
                  fdiv.s       fs10, fa5, ft3
                  lui          s1, 311288
                  add          t3, sp, t6
                  addi         a0, sp, 1970
                  lui          a7, 295206
                  srl          s9, tp, a3
                  fmul.s       fs0, fs6, fs5, rup
                  fadd.s       ft2, ft3, fa4
                  sub          t6, a4, s10
                  fcvt.s.w     ft0, s2, rmm
                  fadd.s       fa0, ft0, ft8, rtz
                  or           s6, t0, s3
                  sll          s3, s11, s1
                  fcvt.wu.s    ra, fa3
                  fsgnj.s      fa0, fa1, fs9
                  fcvt.w.s     s7, fs9
                  xori         t0, s9, 1529
                  fmax.s       ft6, fa2, ft5
                  srl          s7, t1, s6
                  sub          s6, s6, a2
                  fadd.s       ft5, fa6, fs6
                  or           gp, s5, s6
                  or           s9, zero, sp
                  slti         s2, ra, -1805
                  and          a3, s10, zero
                  remu         s10, s7, s10
                  divu         a0, s11, a4
                  nop
                  fclass.s     a1, ft3
                  div          t3, s3, tp
                  feq.s        zero, ft5, fa2
                  srli         a3, s9, 31
                  div          ra, s9, a5
                  nop
                  fcvt.s.wu    fa4, a5, rdn
                  feq.s        a4, ft4, fs2
                  remu         s10, s8, a7
                  srl          s10, zero, a0
                  sltu         s3, a0, t5
                  xor          s8, gp, gp
                  and          gp, s6, t2
                  slti         a7, s8, 734
                  addi         s2, sp, -1544
                  or           t4, s9, zero
                  fcvt.s.w     fs6, t0, rne
                  mulhsu       s1, s1, s10
                  srli         t1, a0, 13
                  div          a1, s3, t3
                  sub          a7, ra, zero
                  fmin.s       fa1, fa2, fa6
                  sra          s1, gp, t3
                  fsgnj.s      fs2, ft4, ft6
                  srli         t6, s6, 10
                  andi         s0, t0, 1251
                  fmin.s       ft9, fs4, ft11
                  auipc        zero, 267451
                  fmin.s       fs4, fa2, fs6
                  add          t4, a4, t1
                  auipc        s3, 752715
                  flt.s        a0, fa3, fs2
                  flt.s        t3, fs7, fa7
                  xor          a7, s5, s6
                  sub          a4, zero, a1
                  xori         a1, s9, 1966
                  fsub.s       fa7, fa4, fa2
                  fsgnj.s      fs7, fs2, fs3
                  fsgnjn.s     fa1, fa4, fa6
                  sll          t6, s11, s9
                  fsgnj.s      fa7, ft1, ft2
                  remu         a6, a5, a1
                  fcvt.wu.s    a5, fa7
                  add          t2, a6, t2
                  mulh         zero, a1, s11
                  xor          t4, t6, s8
                  slt          zero, zero, t4
                  mulhu        a0, a4, t2
                  slli         t2, t3, 18
                  xor          s11, tp, t4
                  srl          s3, t1, s8
                  lui          t0, 547482
                  fsgnjx.s     ft0, fs7, fa1
                  rem          s10, zero, gp
                  mul          tp, ra, s6
                  sltu         t1, s9, tp
                  fsgnj.s      fs3, ft2, ft1
                  xori         s8, s11, 1990
                  mulhu        s4, s2, s11
                  sltiu        s8, t5, 491
                  and          a0, s11, a1
                  addi         s2, gp, -675
                  div          a0, s0, t0
                  sltu         t6, s0, s1
                  fcvt.wu.s    a3, ft6
                  fsub.s       ft6, fs6, fa5
                  mulhsu       a5, s6, s10
                  feq.s        a4, ft9, fs4
                  fmin.s       fs0, fa3, fs7
                  fmv.w.x      fa6, ra
                  fmax.s       fs5, fs2, fs6
                  div          t1, t6, t6
                  fmv.w.x      fa1, a5
                  fsgnj.s      fa5, fs4, fa4
                  slli         s1, t3, 6
                  fmv.w.x      fs2, s1
                  fcvt.wu.s    a4, fs1, rup
                  fsgnjn.s     fs4, fa1, fs2
                  auipc        a7, 710869
                  rem          a3, gp, s1
                  div          s11, tp, s2
                  srli         s9, t4, 9
                  fmin.s       fa5, fs7, ft11
                  and          a1, s3, tp
                  xor          t6, s10, s11
                  xori         a3, sp, -1372
                  slti         a5, s1, 215
                  fmin.s       fs11, ft6, ft5
                  xor          s8, s9, s0
                  fmul.s       ft8, ft2, fs8, rdn
                  fcvt.wu.s    a1, fs1
                  auipc        s8, 159664
                  fcvt.wu.s    a2, fs1
                  fdiv.s       fa1, fa5, fa5, rne
                  fmv.x.w      gp, ft0
                  or           a6, s1, s0
                  fadd.s       fa2, ft7, fs11
                  fsqrt.s      fs11, ft6, rdn
                  andi         a3, a3, 739
                  srli         a7, s1, 29
                  divu         a2, s0, s0
                  fmin.s       ft3, fa3, ft9
                  mul          a7, t6, zero
                  fdiv.s       ft6, ft9, fs2, rmm
                  remu         s6, a3, t0
                  andi         s3, s9, 1546
                  fcvt.wu.s    t1, ft11
                  feq.s        t0, fa2, fs7
                  and          t6, a0, t5
                  fsgnjx.s     fs11, fs8, ft4
                  fmv.w.x      fs10, s11
                  mulhsu       s10, t4, s11
                  srai         a1, zero, 25
                  mulhsu       ra, a0, s9
                  slli         a5, s1, 19
                  fsqrt.s      fs11, ft10
                  fcvt.wu.s    s8, fs6, rtz
                  fmv.w.x      fs7, a2
                  slli         s11, a4, 0
                  and          a3, s1, t2
                  slt          s4, s6, s6
                  fsgnjx.s     fs8, fs3, ft7
                  srai         a6, s5, 8
                  fclass.s     a6, fs4
                  fcvt.w.s     ra, ft3, rne
                  fmax.s       ft1, ft4, ft3
                  or           s0, t3, s1
                  srli         tp, s0, 4
                  mulh         ra, a4, t4
                  mulhsu       t2, s10, a0
                  fcvt.s.w     ft10, s9, rdn
                  lui          gp, 1039750
                  lui          tp, 973477
                  sra          s10, s2, t5
                  fmax.s       ft4, ft7, ft2
                  feq.s        a5, fs9, ft9
                  fcvt.s.wu    fa3, s9, rdn
                  fsub.s       fa5, fs1, ft6
                  mulhsu       t4, s8, zero
                  sltu         s2, a7, s0
                  sra          s2, t2, s11
                  fsub.s       ft6, fs7, fa1, rmm
                  ori          a5, ra, 444
                  fsgnj.s      fs3, fs3, fa7
                  mul          t4, a2, s9
                  mulh         t1, t2, t2
                  rem          s6, a5, t3
                  fsqrt.s      fs6, fa3
                  fmax.s       fs1, fs2, fs11
                  remu         s2, t5, s7
                  fclass.s     s0, fa3
                  fmax.s       ft2, ft8, fa4
                  fsgnjx.s     fs2, ft1, ft6
                  lui          a4, 687637
                  slti         a5, a1, 480
                  fcvt.s.w     fs1, a0
                  fadd.s       fs5, ft7, ft0, rmm
                  slt          s6, s8, ra
                  srli         s4, a4, 29
                  and          s3, s6, s5
                  fsub.s       fs10, fa1, fs6, rne
                  xori         ra, s11, 547
                  xori         s2, zero, 1332
                  add          t3, s8, s7
                  div          a5, s8, t4
                  sltu         a6, s4, s1
                  fclass.s     s11, fs7
                  srl          s8, s3, s6
                  ori          s2, t3, -1092
                  fsgnjn.s     ft3, ft0, fa6
                  add          s2, s8, s8
                  fsqrt.s      ft0, fa5, rtz
                  fle.s        s0, ft4, fa2
                  mulhu        s4, a3, a1
                  fcvt.wu.s    a2, fs4
                  auipc        ra, 497694
                  lui          zero, 21865
                  fsqrt.s      fa2, fa1
                  xor          t1, s10, t2
                  fmin.s       fs6, fs10, fs10
                  divu         s6, s3, s10
                  div          tp, t4, s7
                  fcvt.s.wu    fs4, t4
                  slti         t4, s1, 782
                  fsqrt.s      ft10, fa7, rmm
                  fmax.s       ft9, fa2, ft1
                  sub          a3, s6, s3
                  fdiv.s       ft0, fa4, ft8, rne
                  fdiv.s       fs5, fs5, fa1, rne
                  auipc        a5, 328844
                  flt.s        s10, fs7, ft2
                  fmv.w.x      ft4, s9
                  remu         a4, s9, t4
                  auipc        s0, 727544
                  xori         ra, a5, -744
                  fdiv.s       fs8, fa6, fs9, rmm
                  div          t3, ra, t6
                  mul          s1, t1, a4
                  fcvt.wu.s    a1, fs8
                  srl          t0, a4, tp
                  divu         t0, ra, s10
                  fcvt.w.s     s7, fs11
                  or           a3, a7, s6
                  or           s11, s1, s3
                  fcvt.s.w     ft11, s6, rup
                  sub          ra, a2, t4
                  ori          s10, t4, 1562
                  fsub.s       ft8, fs3, ft2, rdn
                  fdiv.s       ft4, ft6, ft9, rmm
                  add          s9, t5, a3
                  sra          a0, t6, s9
                  fsgnj.s      fs6, fa5, fs5
                  fle.s        t0, fs3, fs8
                  fmv.x.w      zero, ft10
                  slti         s3, zero, 1444
                  fmul.s       fa1, ft7, ft5, rmm
                  slt          t1, a3, a6
                  feq.s        a2, ft4, fs0
                  add          s10, t3, s6
                  fadd.s       ft3, ft8, ft6, rdn
                  sub          s4, s9, s10
                  fcvt.w.s     tp, fa4
                  fcvt.s.w     fa5, s4
                  sltu         t4, a7, t2
                  fmin.s       fa4, ft9, fs4
                  fcvt.wu.s    ra, fs1, rtz
                  srli         s3, t3, 6
                  sll          t2, t6, s10
                  or           t0, s6, tp
                  xori         a3, s11, -1959
                  fsgnjx.s     fs6, fs1, fs5
                  auipc        a4, 794379
                  auipc        t6, 940069
                  feq.s        t3, ft2, fa5
                  fcvt.wu.s    ra, fs2
                  xori         a2, t3, -843
                  mulhsu       a3, s6, t0
                  rem          a5, s7, a5
                  srli         t0, a5, 21
                  mulhu        s8, t2, s9
                  remu         s11, t2, a3
                  fadd.s       ft8, ft9, ft3, rtz
                  xor          a7, a6, sp
                  nop
                  nop
                  fmv.x.w      a4, fs0
                  div          s4, a3, s10
                  xor          t0, a4, s3
                  fmv.w.x      ft7, gp
                  addi         t6, t0, -562
                  or           a2, t1, s10
                  addi         zero, s9, 851
                  mulhsu       s6, s11, s7
                  slt          s3, t2, t2
                  divu         t3, a6, s6
                  sll          s4, gp, s6
                  fadd.s       ft11, fa7, ft1
                  fsgnj.s      ft2, ft7, fs11
                  mulh         s11, s1, t2
                  andi         a6, s8, -517
                  fsub.s       fa0, ft9, fs2
                  slli         s10, zero, 25
                  fle.s        t4, fa1, fs0
                  addi         a3, a6, -1036
                  and          a3, s4, a6
                  mulhsu       t6, t4, a3
                  fsqrt.s      ft3, ft5
                  fsqrt.s      fs2, ft3
                  fmin.s       fs0, ft10, fs2
                  fmv.w.x      fs0, s0
                  fsub.s       ft4, ft3, ft10
                  ori          s9, s11, 814
                  div          s2, t4, a1
                  andi         a2, t3, 163
                  rem          s2, s9, s3
                  slli         a3, zero, 22
                  sltu         gp, s9, t5
                  mulh         s7, t2, s5
                  sub          s4, s2, a2
                  lui          zero, 483354
                  and          s0, t4, s0
                  sra          t3, a1, gp
                  fadd.s       fs7, ft6, ft7, rmm
                  addi         s8, zero, -710
                  divu         ra, t4, a1
                  add          tp, s7, s4
                  fmv.w.x      fs5, t2
                  fdiv.s       ft4, fs11, fs11
                  fmax.s       fs9, fs11, fs7
                  divu         ra, a7, s3
                  auipc        s0, 112405
                  lui          s2, 437139
                  fsqrt.s      ft11, fs8
                  fsgnj.s      fs7, fa1, fs10
                  sltiu        t3, a4, 427
                  nop
                  fclass.s     a4, ft3
                  slt          a5, s6, s9
                  fmul.s       ft3, ft0, fa6, rdn
                  srai         t1, tp, 31
                  divu         t0, gp, t3
                  and          t2, t1, s6
                  srli         a5, a7, 28
                  mulh         s0, s0, a7
                  mulh         s1, a2, t0
                  fsgnj.s      fs2, ft0, ft0
                  add          zero, s5, s9
                  fcvt.s.wu    ft11, t6, rmm
                  fcvt.wu.s    s2, fa3
                  fmul.s       ft9, fs10, fa4, rdn
                  xor          zero, s2, s8
                  or           s3, s5, t4
                  sltu         a0, a2, s11
                  fmin.s       fa0, fa4, fs7
                  fcvt.w.s     s6, fs5
                  divu         s3, s4, s9
                  auipc        ra, 1020913
                  mulhsu       s2, s2, a4
                  fsqrt.s      fs8, ft1
                  fsgnjx.s     fa5, fa5, ft4
                  sltu         a6, a2, t6
                  fcvt.s.wu    fa5, s10
                  sltiu        a7, a4, 1415
                  xor          gp, a0, sp
                  fsub.s       ft7, fs8, fs2
                  fsgnj.s      fs3, ft11, fs3
                  rem          s10, a7, s3
                  fclass.s     a1, fs0
                  ori          a5, t5, -1951
                  fdiv.s       fa0, fs3, fs0, rmm
                  fsgnj.s      fa7, fa4, ft5
                  nop
                  sra          a4, s9, t1
                  fsgnjx.s     ft2, fa5, fs1
                  rem          t1, s8, gp
                  add          t3, a1, s0
                  fsgnjx.s     fs8, ft9, fs3
                  lui          s3, 508970
                  fsgnj.s      ft1, fa6, ft7
                  fsgnjn.s     fs4, fs1, ft1
                  nop
                  and          t6, zero, sp
                  rem          s8, a2, s3
                  flt.s        gp, fs1, ft7
                  fmv.w.x      fa6, gp
                  fmax.s       fs5, fs7, fa0
                  fclass.s     a5, fs1
                  mulhu        a2, a0, a3
                  sltiu        s0, a0, 1740
                  fsgnj.s      ft11, fs8, fs7
                  xor          s2, zero, zero
                  slt          s7, a7, a1
                  mulhsu       t0, ra, a2
                  andi         s7, s1, 1343
                  and          s6, a3, s11
                  rem          a0, t6, tp
                  fsgnjn.s     fs4, fa1, ft0
                  rem          t1, s3, a4
                  mulhsu       s3, t2, s1
                  sll          a6, s10, a2
                  sltiu        s6, a3, -249
                  srl          s4, s10, s7
                  add          a0, sp, a0
                  fclass.s     s2, ft1
                  srai         s8, sp, 25
                  xori         t2, s1, -430
                  mul          ra, t0, s1
                  fcvt.s.w     ft1, a0, rne
                  srai         tp, zero, 3
                  fsqrt.s      ft6, fa5, rtz
                  fdiv.s       fa0, fa5, ft9
                  srai         t6, s2, 17
                  fmul.s       fs1, fs3, ft8, rtz
                  lui          t2, 455023
                  fcvt.s.w     fs11, s2
                  xori         s10, t5, 1903
                  sltu         s11, a0, ra
                  fclass.s     ra, ft11
                  fcvt.s.w     fs2, s7
                  fadd.s       fs11, fa3, ft10, rne
                  fsqrt.s      fs2, ft7
                  slli         t3, s2, 13
                  mulhsu       s9, s0, a5
                  fsqrt.s      ft11, ft10, rup
                  mulhu        s6, s1, a4
                  div          a1, tp, s11
                  fcvt.wu.s    t3, fs7, rmm
                  fcvt.s.w     fa4, a5
                  fsgnjn.s     fa1, ft9, ft2
                  fsgnjn.s     fs10, ft6, fa0
                  add          a5, s5, a1
                  fcvt.s.wu    fs11, t5, rne
                  fsgnj.s      fa1, ft1, fs11
                  slt          t6, s2, s10
                  slli         t2, s5, 19
                  sltiu        s2, t5, 1277
                  fsqrt.s      fa7, fs6, rdn
                  mulh         a1, s9, s9
                  fadd.s       ft4, ft5, fs2
                  and          s0, tp, a0
                  ori          s7, a3, -1779
                  fmax.s       ft11, fs1, ft1
                  slli         tp, a7, 19
                  fclass.s     tp, fa1
                  fsgnjn.s     fs7, ft2, fs7
                  andi         t0, a6, -101
                  fle.s        t0, fs4, fs3
                  mulh         s7, a2, s3
                  sub          gp, s1, s9
                  mulhsu       t3, t1, t6
                  divu         s0, s9, t2
                  sra          tp, s7, a5
                  fmv.x.w      s9, fa0
                  slli         t4, a4, 21
                  fsub.s       ft3, ft7, fa1, rmm
                  fadd.s       ft8, fa7, ft4, rdn
                  slli         t2, s6, 15
                  lui          s7, 585293
                  div          a3, t6, a1
                  xor          s10, s3, s11
                  or           t4, t3, t4
                  mul          a2, zero, zero
                  srl          a6, a6, a2
                  fclass.s     t6, fs6
                  mulhu        a0, s2, t3
                  slti         a0, t4, -1985
                  srai         t6, s0, 11
                  mulhsu       s6, t4, t5
                  or           s11, s2, s4
                  fadd.s       ft11, ft0, fa7
                  fmin.s       fa2, ft11, ft3
                  sltiu        t4, a2, 1935
                  fmax.s       fs10, ft1, fs1
                  flt.s        s7, fs11, ft6
                  fsgnj.s      fs9, fs7, ft9
                  sra          ra, s5, a5
                  fsub.s       fa4, ft10, fa4
                  srai         s6, s6, 26
                  and          s10, t2, s0
                  srli         t6, sp, 2
                  lui          zero, 545803
                  srli         t1, s2, 31
                  auipc        t6, 150307
                  slli         s11, t0, 0
                  lui          a7, 983424
                  xori         s4, t0, -800
                  srl          a1, gp, s1
                  srai         s1, s4, 23
                  fcvt.wu.s    s6, fa1, rup
                  fmin.s       ft8, fa4, fa7
                  fdiv.s       fa5, ft8, ft1, rdn
                  fsqrt.s      fa3, fs2, rup
                  div          s9, s3, s6
                  slti         a5, s0, 1027
                  srai         a6, t3, 4
                  nop
                  add          t4, sp, s5
                  sll          a0, s10, a0
                  nop
                  srli         a7, gp, 9
                  fcvt.w.s     tp, ft5
                  and          a4, s4, a2
                  fcvt.wu.s    s8, fs8, rdn
                  divu         a1, a3, s9
                  xor          a0, s9, a0
                  sra          s10, tp, t0
                  xor          t6, s1, tp
                  slt          s4, t3, a5
                  sub          t3, sp, s9
                  srai         a2, tp, 31
                  flt.s        s11, fs10, fs9
                  fmv.w.x      ft9, zero
                  remu         ra, tp, a0
                  slli         s1, t6, 8
                  fsgnjx.s     fs0, fa1, fs5
                  fcvt.s.wu    fs5, a1, rne
                  mulh         a6, s4, t2
                  mulhsu       a5, s3, t0
                  slt          s6, t2, a3
                  fle.s        s3, fa3, fs3
                  slti         t4, t5, 1810
                  xori         t0, gp, -2038
                  fle.s        s10, fa3, ft7
                  feq.s        a3, fs9, fa6
                  and          s4, t1, t4
                  sltiu        t0, t3, 917
                  xori         t6, t1, 1890
                  fmul.s       fa0, ft8, ft11
                  fdiv.s       ft5, fs4, ft3, rmm
                  nop
                  sll          t2, a3, tp
                  fsgnjx.s     fa7, fs11, ft8
                  divu         s8, s11, s9
                  slt          t3, tp, t6
                  slti         s0, s8, -1650
                  fsub.s       fa7, fa4, fa4
                  div          s0, s6, s7
                  add          s2, s8, a7
                  fmv.w.x      fs1, a5
                  srli         a2, a2, 13
                  sltiu        s0, ra, -522
                  fsgnj.s      fa3, ft4, fs1
                  feq.s        a6, fs6, fs1
                  div          s3, s1, a6
                  slli         a1, s7, 23
                  fcvt.s.wu    fs2, s6
                  andi         a0, a5, -1882
                  srai         a4, s2, 25
                  add          t2, sp, s3
                  divu         a0, s7, s9
                  ori          zero, zero, 464
                  slli         s0, s8, 22
                  fclass.s     s2, fs3
                  divu         t0, a6, s6
                  sltu         s3, t3, s4
                  remu         t1, zero, s10
                  mul          t2, a6, s5
                  fsgnjx.s     ft2, ft2, fs10
                  slti         s8, a7, -1715
                  fsgnjn.s     fs1, fs4, ft3
                  fsub.s       fs8, fs1, ft1
                  fcvt.wu.s    t4, ft0, rup
                  lui          zero, 1005808
                  rem          s2, gp, s7
                  srli         a0, a3, 13
                  fdiv.s       ft2, ft0, ft3, rup
                  srai         a6, s7, 27
                  fsub.s       ft9, fs6, ft3, rtz
                  srai         t0, s7, 4
                  fsgnjx.s     fs4, fs2, fs10
                  remu         s4, s10, s0
                  slli         a7, zero, 24
                  srli         t1, s5, 13
                  srli         s8, t0, 27
                  fadd.s       fs5, fa2, ft6, rne
                  mulh         t2, s11, s9
                  slli         s8, s0, 13
                  fsgnjx.s     ft2, ft4, fs3
                  and          ra, a4, a2
                  mul          ra, s1, t2
                  sltiu        a1, t0, -175
                  sltu         s11, s1, s10
                  fcvt.s.wu    ft3, t5
                  fclass.s     t6, fa1
                  fmax.s       fa7, fs0, fs3
                  fsgnj.s      fa5, fs8, fa2
                  auipc        s6, 968428
                  andi         a6, s3, 2006
                  mulh         t2, s8, sp
                  lui          s6, 518763
                  sll          s6, s6, s2
                  sub          a7, s4, s2
                  remu         s1, a3, a2
                  sll          t0, t6, t4
                  sub          a2, a1, s7
                  flt.s        s1, fs10, fa5
                  nop
                  fmax.s       fs3, ft2, ft11
                  addi         a0, a2, 339
                  srli         ra, s0, 23
                  fsqrt.s      fs4, fs10, rup
                  add          s2, s6, s4
                  fle.s        s8, fs3, fs5
                  fsgnjn.s     fa7, ft5, fs5
                  sub          t1, t5, t0
                  sra          t2, s6, t6
                  auipc        a3, 1026941
                  fmin.s       fs3, fs1, fs1
                  fclass.s     s0, fs8
                  mulh         s9, t0, t2
                  rem          t3, s10, s3
                  add          a1, s8, a6
                  slt          s10, a0, a3
                  auipc        s8, 140483
                  mulhsu       a6, t4, a7
                  lui          s11, 801563
                  auipc        s6, 921636
                  and          a1, t4, sp
                  xori         tp, s10, -854
                  mul          t3, a5, a3
                  sltu         a0, t0, t1
                  fmin.s       fs0, ft5, ft10
                  rem          s2, s11, s6
                  fsub.s       fs11, fa0, fa6
                  mulhu        s4, s9, s2
                  fcvt.s.wu    fa6, s7
                  lui          s4, 241235
                  rem          t2, s10, a3
                  fadd.s       fs10, ft1, fs2, rtz
                  fmin.s       fs7, ft3, fa4
                  sltu         s0, s9, a4
                  div          a7, t1, gp
                  fmv.x.w      a6, fs3
                  slli         s11, s7, 27
                  fsgnj.s      fs11, fs5, fs5
                  and          s11, s4, t0
                  add          s8, t5, s10
                  divu         t1, s7, s5
                  sltu         a3, a1, s9
                  xor          t3, a3, s1
                  xor          t3, sp, s9
                  fsub.s       fa4, fa3, fa5
                  srl          t2, zero, a2
                  srli         ra, t1, 2
                  xori         gp, ra, 122
                  fmin.s       fs0, fa1, ft10
                  fmv.x.w      a5, fs7
                  fsub.s       fa4, fa1, ft8
                  sub          s7, s1, a7
                  fle.s        s4, fa1, ft6
                  srl          a6, s6, a7
                  mulhu        t3, tp, a2
                  fcvt.s.w     ft7, a5
                  slli         s8, s6, 11
                  fcvt.w.s     tp, ft1, rmm
                  lui          a3, 831790
                  fmul.s       ft5, ft1, fs5, rmm
                  fclass.s     s11, ft10
                  addi         s11, a4, -948
                  slli         s9, a5, 28
                  remu         s4, t4, t6
                  add          s8, s4, t5
                  rem          a1, a5, a7
                  fmv.w.x      fs7, s7
                  slt          s9, t0, t6
                  remu         a7, sp, a6
                  fdiv.s       fs11, fa6, fs0
                  sub          t3, ra, t2
                  fmax.s       ft0, fa4, fs3
                  sub          ra, a4, a0
                  divu         tp, a2, a2
                  fcvt.wu.s    a1, ft11, rne
                  xori         s3, t2, -1618
                  fcvt.wu.s    s0, fa0, rmm
                  slt          s2, s0, t0
                  fsqrt.s      fs11, fa7
                  fmul.s       fs2, ft3, fs5
                  srai         s1, tp, 10
                  srl          s0, s3, sp
                  sltu         t4, zero, t6
                  fmv.x.w      s0, ft9
                  fcvt.wu.s    s2, fs10
                  fcvt.w.s     s6, ft3
                  fmul.s       ft9, ft8, fs1
                  fmin.s       fs9, fs4, ft1
                  fsgnjn.s     fa5, fs6, ft8
                  fdiv.s       fa6, ft4, fa7
                  ori          s0, s1, -1144
                  fsgnjx.s     ft11, fs1, ft7
                  andi         a0, s4, -777
                  xor          t6, gp, t1
                  slti         t6, a0, -202
                  xor          t4, s9, a4
                  mulhu        a1, t1, s2
                  fcvt.wu.s    gp, ft7, rup
                  fmax.s       ft4, fa0, fa7
                  srai         a2, s10, 2
                  fmv.x.w      t3, ft3
                  fmul.s       ft8, fs10, fs1, rtz
                  fsgnj.s      fs9, ft6, fa2
                  addi         gp, s1, 129
                  sra          a4, tp, a2
                  fsgnjx.s     fs6, fs4, ft7
                  fsgnjn.s     ft2, ft9, ft6
                  fsgnjx.s     ft11, ft2, fs5
                  mulhsu       ra, a4, gp
                  mulhu        a7, s4, ra
                  fcvt.s.wu    ft5, a3, rne
                  mulh         t4, t0, s6
                  sub          a4, a7, s11
                  fclass.s     s7, fa6
                  fmin.s       ft3, ft8, ft10
                  fcvt.s.wu    fs6, zero, rup
                  slt          s8, ra, t3
                  fmin.s       fa7, fs1, ft7
                  srai         s3, a3, 29
                  sra          ra, a5, zero
                  add          a7, s2, s11
                  slli         s9, t2, 16
                  fcvt.w.s     s10, fs2, rup
                  fmax.s       fa0, fa1, fa0
                  slli         s9, t2, 31
                  fadd.s       fs0, fa7, fa4
                  fcvt.s.wu    ft10, s5
                  andi         a0, s11, -1690
                  fmv.w.x      ft4, a3
                  remu         t1, s1, s2
                  sltu         gp, a3, a7
                  fsqrt.s      fs10, fa5, rne
                  fadd.s       fa2, fs9, fa3, rdn
                  srai         s2, s7, 19
                  andi         t3, t2, 1462
                  sltiu        t0, gp, -1976
                  lui          a1, 981766
                  slli         s7, t1, 25
                  srl          s11, s10, a5
                  sltiu        gp, s1, -945
                  auipc        a3, 1037272
                  sub          s2, s1, s10
                  feq.s        s9, fa0, fs4
                  fcvt.wu.s    s6, fs1, rdn
                  slti         s9, t1, -611
                  addi         t4, a5, 1457
                  sll          a4, a7, s4
                  fmv.w.x      fa3, s7
                  fcvt.s.w     fa5, s8
                  xori         a3, s9, 1616
                  fsub.s       fa0, ft10, ft0, rdn
                  div          a1, ra, gp
                  fcvt.w.s     s9, fs5
                  slli         s11, a6, 22
                  lui          gp, 245165
                  mul          a4, s6, s1
                  divu         s2, s6, s3
                  fle.s        s1, fa6, fs0
                  lui          a1, 952600
                  rem          t4, zero, s8
                  fadd.s       fs5, fa6, fs7
                  div          gp, s6, t4
                  fadd.s       fa1, ft11, fa0
                  mul          s8, s2, gp
                  fle.s        a1, fa1, fa3
                  or           a2, s9, gp
                  slti         a1, t1, -248
                  fsgnjx.s     fa1, fs10, ft4
                  fsgnj.s      ft10, fs5, ft0
                  mulh         zero, t4, sp
                  slli         a6, a0, 10
                  mulh         s1, t6, a0
                  fmv.x.w      s0, fs7
                  slt          a1, ra, s11
                  and          a2, s3, a1
                  xor          s3, s6, s11
                  mulh         s8, a0, s3
                  addi         s4, s4, -569
                  slti         s9, s10, 1117
                  fle.s        zero, fa1, ft5
                  fadd.s       ft2, ft11, fs8, rdn
                  nop
                  rem          a1, a5, t0
                  fsgnjx.s     fs6, fs0, fs2
                  fmin.s       ft1, fa7, fs0
                  andi         t1, s1, 797
                  fsgnjx.s     fs7, fa4, fs2
                  srl          t3, ra, ra
                  auipc        s11, 20586
                  or           a4, ra, s9
                  fcvt.wu.s    a0, fs0
                  rem          s10, a6, s7
                  auipc        zero, 3794
                  srai         s6, tp, 30
                  xori         a1, ra, 1924
                  addi         s3, s4, -1072
                  sra          tp, a1, s6
                  or           s8, s0, a5
                  auipc        gp, 756835
                  srl          a6, s3, zero
                  or           s0, s2, gp
                  xori         gp, sp, 767
                  auipc        s6, 676943
                  fclass.s     t4, fs11
                  fmax.s       fs8, fs11, fs8
                  or           s7, a0, a1
                  fsgnj.s      fa3, ft0, ft6
                  fclass.s     t2, fs4
                  mulhsu       s2, zero, a0
                  fadd.s       fa2, fa6, fa4, rdn
                  ori          a5, s10, -187
                  fclass.s     a5, fs6
                  rem          a0, t6, ra
                  slti         s0, t6, -299
                  ori          t6, t1, -529
                  fle.s        s7, fs7, fs3
                  slti         s3, s3, 468
                  nop
                  fclass.s     t3, ft0
                  fmin.s       ft3, fs2, ft7
                  fcvt.w.s     s8, ft3
                  fsgnjx.s     ft0, fa7, ft4
                  sra          a1, s5, tp
                  feq.s        s6, fs4, ft6
                  add          s11, a7, gp
                  fadd.s       fs1, fa2, fs8, rtz
                  fcvt.w.s     t2, fa0
                  fcvt.w.s     s9, ft6
                  fle.s        a5, fs11, fa0
                  mulhu        t6, a1, gp
                  fadd.s       fs5, fa7, fs6
                  fdiv.s       ft1, fa5, ft1, rne
                  fclass.s     s4, fs1
                  fmin.s       ft6, fa4, ft5
                  div          s2, s11, a2
                  fsgnj.s      ft11, fs7, fs0
                  andi         s10, t3, -607
                  lui          s8, 154817
                  mulhsu       ra, s2, s9
                  fsub.s       fa2, ft7, ft5, rtz
                  sra          s1, s4, a0
                  srai         s7, a3, 18
                  rem          s0, a0, zero
                  slli         s4, t4, 10
                  fmax.s       fs0, fa2, fs9
                  fmv.x.w      s4, ft2
                  mul          s6, s5, a5
                  sll          a4, t4, s8
                  sltiu        s1, t3, 93
                  fle.s        t3, ft8, fs7
                  xor          ra, s5, s0
                  fcvt.s.wu    fa2, a5
                  add          a3, t6, s3
                  fmin.s       fs7, fs1, fs11
                  fmax.s       ft10, fa7, fs10
                  rem          s0, t6, t2
                  fmv.w.x      fs10, s10
                  fmin.s       fs8, ft9, fs5
                  sltiu        ra, t0, -763
                  slt          s4, s9, gp
                  slli         s9, t2, 5
                  fdiv.s       fs3, fa2, ft11
                  fsub.s       ft1, fs11, ft5, rne
                  mulhu        s0, t5, t3
                  srai         s0, a1, 12
                  fmul.s       fs11, fs2, ft0, rdn
                  divu         a5, a3, a5
                  rem          t4, a2, a0
                  sltu         s1, a7, a0
                  sltiu        a5, t6, 2006
                  srai         a7, t1, 7
                  fle.s        s2, ft10, ft7
                  divu         gp, t5, s5
                  div          s2, t3, gp
                  fcvt.wu.s    s2, ft0, rmm
                  mulhu        ra, a0, s0
                  andi         s4, gp, -164
                  fsqrt.s      fs7, ft3
                  fsgnj.s      ft6, ft9, ft9
                  slti         t1, s3, -490
                  mul          s2, sp, t3
                  remu         a7, t3, s4
                  mulh         zero, s2, a2
                  fmin.s       fa2, ft3, fs6
                  sltiu        s11, a6, -45
                  ori          s6, s9, -454
                  slt          a2, t6, s0
                  fadd.s       fs0, fs9, ft11, rup
                  fsqrt.s      fs11, fs9
                  andi         t3, a2, -237
                  fcvt.w.s     a0, ft8
                  xori         t6, s1, 770
                  fsgnjx.s     ft0, fa7, ft1
                  remu         s0, s1, zero
                  sll          s4, s10, a1
                  fsgnjx.s     fs7, ft1, ft1
                  xori         tp, t4, -487
                  auipc        a0, 469284
                  div          s10, tp, t2
                  slli         a5, t1, 18
                  srai         s6, a7, 5
                  divu         s1, s1, a7
                  remu         s3, s7, a6
                  fcvt.s.w     fa4, s9
                  srli         t2, a0, 4
                  fmax.s       fa6, fs8, fa0
                  fdiv.s       ft2, fa2, fs10
                  fcvt.s.w     fs4, a4
                  and          s10, tp, s0
                  mulhu        s7, s9, gp
                  sltiu        a7, t6, 1980
                  fmin.s       ft5, fs10, ft7
                  sll          s0, a2, a1
                  slti         a5, a6, -1367
                  feq.s        a3, ft4, fs9
                  remu         a2, a3, s0
                  slli         gp, a6, 12
                  remu         s11, s7, a0
                  feq.s        s3, ft4, fs11
                  sltiu        a3, s8, -1832
                  feq.s        a0, ft9, fa4
                  nop
                  or           ra, t2, t6
                  ori          t2, sp, 1335
                  fcvt.wu.s    a1, fs10, rne
                  xori         a6, t5, 752
                  fsgnjx.s     fa3, fs11, fa2
                  fmax.s       ft11, fs11, ft9
                  fsgnjx.s     fa3, ft2, ft10
                  xor          s1, a5, sp
                  fmv.w.x      fa5, sp
                  sll          a1, s6, a0
                  fcvt.w.s     a4, fs1, rmm
                  fclass.s     s10, fs5
                  srl          s9, a1, a3
                  fsqrt.s      fa5, fa7
                  fdiv.s       fa2, ft10, fs6
                  fmin.s       fa3, ft9, fa7
                  fclass.s     s7, ft1
                  fsgnjn.s     ft4, fa1, fa4
                  addi         s10, s6, -205
                  slli         a3, s3, 22
                  lui          a5, 264393
                  fsgnjx.s     fa4, fs10, ft0
                  lui          a5, 1009934
                  fdiv.s       fa3, fs2, ft10, rne
                  feq.s        t0, ft6, fs9
                  addi         a1, ra, -1106
                  fle.s        a6, fs7, ft4
                  sll          a2, ra, a5
                  fmv.w.x      ft6, s0
                  fclass.s     s0, fa7
                  sra          a2, s10, sp
                  fclass.s     zero, fs7
                  andi         t6, tp, -1105
                  auipc        ra, 765316
                  fmul.s       fa4, fs1, ft1, rtz
                  flt.s        a0, fs9, fs6
                  fmin.s       fs5, fs10, fs6
                  fsgnjn.s     fs4, fs11, fs11
                  feq.s        gp, fa6, fs9
                  auipc        a1, 613513
                  srl          s8, ra, s11
                  remu         s6, t2, a7
                  fsub.s       fs10, ft11, ft11, rne
                  and          ra, ra, s4
                  remu         s11, s5, s2
                  fcvt.s.w     fs10, a6, rne
                  fle.s        s3, fs0, ft7
                  mulh         s10, a7, tp
                  andi         s9, s1, 626
                  fsgnjx.s     fs6, ft10, ft7
                  ori          t4, t5, -1517
                  fmv.w.x      ft5, a3
                  slti         a7, s8, -1872
                  fsgnj.s      fs1, fs6, ft11
                  mulhu        tp, t4, s9
                  fmv.w.x      ft1, a2
                  fclass.s     s1, fa2
                  fmul.s       fs7, fa2, fs0
                  srl          t2, ra, s5
                  sub          a3, zero, t0
                  fmv.x.w      s8, ft3
                  fmax.s       fa6, fs8, fa4
                  fsgnj.s      fa7, ft2, fs8
                  fmul.s       fs0, ft9, fs1
                  slli         s10, a3, 22
                  fdiv.s       fa5, fs3, fa1
                  divu         a7, t3, s2
                  sll          s4, s2, s2
                  srli         s1, a7, 28
                  fle.s        t2, ft6, ft9
                  add          a3, s6, tp
                  or           s9, s2, t6
                  srl          ra, tp, zero
                  or           s7, s6, t4
                  fcvt.s.w     fa3, t2, rne
                  fmv.x.w      gp, ft6
                  fsgnj.s      fa5, fa6, fs2
                  slti         a7, t1, -1057
                  fle.s        s4, ft2, fa6
                  sll          a5, zero, s8
                  or           a0, t4, t0
                  nop
                  mulhu        s6, a1, a7
                  or           s6, sp, ra
                  fmul.s       fs0, fs7, ft3, rdn
                  flt.s        s3, fs8, fa5
                  mulh         t4, t6, s10
                  sltiu        a4, s8, 1617
                  sub          a2, s10, gp
                  slli         gp, s10, 16
                  fdiv.s       ft6, ft8, fs7, rmm
                  fcvt.wu.s    a0, fs1
                  fmv.x.w      a1, ft1
                  xori         a2, sp, 1022
                  div          s7, t6, t6
                  fsgnjx.s     fa2, ft8, fa1
                  add          s3, a1, s0
                  and          a6, s0, a6
                  or           s0, s2, s9
                  and          a4, s3, tp
                  srl          s11, a5, t2
                  mulh         s8, s4, t2
                  fle.s        s8, fa6, fs4
                  fmul.s       fs10, fs11, fs11, rne
                  fmax.s       ft8, fs0, ft8
                  slt          a3, a6, s0
                  fclass.s     t4, fa4
                  fdiv.s       fs1, ft4, ft7, rtz
                  remu         s8, s9, s10
                  xor          s10, sp, s7
                  fcvt.s.w     ft8, a2
                  fcvt.s.w     fs9, t4
                  mul          a2, a7, gp
                  fclass.s     a3, ft11
                  fcvt.wu.s    a4, fs9, rne
                  fmv.w.x      fs11, tp
                  fadd.s       fa6, ft11, ft3
                  sub          a1, s11, a4
                  nop
                  feq.s        s7, ft0, fa5
                  fsub.s       ft1, ft6, fa3, rne
                  fsgnjn.s     fa0, fs6, fa6
                  srl          s6, a6, s1
                  srli         a7, t4, 0
                  srl          s8, s0, t3
                  slli         t3, ra, 4
                  xor          tp, s1, s2
                  fadd.s       fs1, ft11, ft4, rdn
                  srl          t1, a6, a0
                  rem          t6, t1, t4
                  fclass.s     s10, fa4
                  fsub.s       fs8, fs5, fs4
                  remu         s10, s9, s6
                  auipc        gp, 900622
                  andi         tp, s7, -1742
                  fmin.s       ft5, fa0, ft6
                  mul          s1, t4, a2
                  fmv.w.x      fs11, a6
                  fmax.s       ft3, fs1, ft3
                  sll          t1, t1, s3
                  add          s8, t3, t5
                  sub          ra, a4, s11
                  fcvt.s.wu    ft0, a0, rmm
                  slti         s4, s4, -1079
                  rem          a5, s0, s5
                  rem          t6, s5, a4
                  feq.s        tp, fs5, fa2
                  ori          s4, a7, 594
                  andi         s10, t1, 1969
                  addi         a2, ra, 1848
                  slli         s9, sp, 11
                  fcvt.s.w     fa1, s7, rdn
                  fsub.s       ft0, fa4, ft8, rmm
                  add          t1, t5, t3
                  feq.s        s4, fa6, fs10
                  fmv.w.x      fs8, t2
                  flt.s        gp, fs1, fa5
                  remu         a0, s1, tp
                  sltiu        t1, ra, 2002
                  fsgnjn.s     fs7, ft4, fs4
                  or           s11, a0, s0
                  sub          s2, a4, t4
                  fmin.s       ft10, fs7, ft2
                  xori         a6, t4, -252
                  sltiu        a5, a7, -729
                  ori          s11, s10, -946
                  and          t1, s9, zero
                  fsgnjx.s     ft1, ft9, fs5
                  sltu         a5, s3, s0
                  sll          s4, a6, s11
                  add          s1, t0, ra
                  fmax.s       fs9, fs6, fa6
                  fmv.x.w      s10, fs11
                  fsgnj.s      ft7, ft4, fs9
                  fsgnjn.s     ft0, ft1, fa3
                  auipc        s8, 433028
                  sltiu        a5, t5, 1246
                  lui          s11, 151195
                  xor          s3, t3, s5
                  rem          tp, tp, s5
                  remu         a6, zero, s9
                  or           s9, t2, a4
                  sub          s8, tp, a6
                  sltiu        s2, sp, 13
                  nop
                  fmin.s       fs11, ft0, ft1
                  srai         a7, s3, 26
                  rem          s7, s4, t6
                  slti         s11, s5, 1848
                  sltiu        a6, s3, -1233
                  sltiu        t3, s3, 530
                  fadd.s       fa7, ft3, ft1, rne
                  fcvt.wu.s    gp, ft6, rne
                  feq.s        t0, fa5, ft10
                  sub          t2, s9, t0
                  add          a1, t4, t4
                  divu         s7, s1, s3
                  sra          a5, t6, t4
                  div          s1, a6, a3
                  nop
                  fcvt.w.s     s9, fs3
                  mulh         tp, tp, t4
                  divu         t4, t3, tp
                  fmax.s       fa1, fs10, fa3
                  fmul.s       ft6, fa6, fs2
                  fsgnj.s      fa3, ft5, fa1
                  or           a3, a0, a2
                  andi         t4, gp, -1518
                  srl          zero, s6, t3
                  srli         a2, s5, 22
                  nop
                  lui          a6, 750080
                  fsgnjx.s     ft7, ft5, fs5
                  fle.s        s11, fa6, fs0
                  mulhsu       s11, t1, s10
                  sub          s1, s11, a3
                  fcvt.s.wu    fs6, a0
                  divu         a4, a0, t3
                  or           t4, a5, t6
                  sltu         t2, gp, s10
                  fmul.s       fs10, fs7, fs2
                  fsub.s       fs2, fs1, ft11
                  xor          a1, ra, a5
                  and          zero, t1, s2
                  mulhu        a1, s4, sp
                  slti         s2, a6, -355
                  and          t2, a3, s10
                  fcvt.s.w     fs1, t2, rmm
                  fmin.s       ft9, fs8, fs6
                  xor          a3, s10, s10
                  fcvt.w.s     a4, fa0, rtz
                  lui          s0, 1371
                  slt          a7, a4, s9
                  fcvt.s.w     fs6, t0
                  slti         a2, t3, 1649
                  slti         s1, t5, -137
                  fcvt.wu.s    t3, fs8
                  addi         a7, a1, -1894
                  fclass.s     s3, fa2
                  fclass.s     t1, fs6
                  fsgnjx.s     fs5, fs0, fs9
                  fclass.s     a0, fa0
                  lui          t1, 250124
                  fcvt.s.w     ft9, s6, rne
                  sra          ra, s2, t1
                  fsgnj.s      fa3, fs3, ft7
                  sltu         t1, s10, s2
                  fclass.s     t2, fa7
                  fmv.x.w      zero, ft8
                  fsgnjn.s     fa3, fs1, ft10
                  slti         t2, s11, -261
                  sll          a7, a3, a2
                  mulhsu       a0, a5, t2
                  auipc        a3, 612390
                  srl          a0, t4, a5
                  auipc        t6, 863967
                  sltu         s4, t4, t6
                  lui          s0, 114876
                  sra          s6, s7, ra
                  fmv.w.x      fa7, tp
                  fcvt.s.w     ft8, a2
                  remu         s4, s7, t0
                  fsub.s       fs9, ft1, ft9
                  fcvt.w.s     t6, fs5, rtz
                  fsqrt.s      fs9, fa3, rtz
                  sll          t0, t6, tp
                  lui          s11, 1043579
                  divu         s7, a1, s1
                  fsqrt.s      fs4, fs7
                  fsqrt.s      ft6, fs6
                  nop
                  sltiu        zero, tp, -772
                  fcvt.s.wu    fa2, a0, rmm
                  xor          zero, s8, s4
                  fsgnj.s      ft2, ft6, fa7
                  ori          a5, t6, 282
                  mulh         gp, s8, tp
                  ori          a1, s1, -1384
                  srai         ra, t6, 9
                  fle.s        t3, ft1, fs3
                  fmin.s       fs3, ft1, fs10
                  fmv.w.x      fs0, a5
                  slti         a5, t4, 36
                  addi         s4, s5, 480
                  sra          a2, s9, s11
                  lui          s2, 392904
                  srl          gp, t1, t0
                  fsgnj.s      fs0, ft5, fs2
                  fcvt.s.w     fa6, s4
                  andi         s1, a1, -1204
                  sra          tp, t1, a7
                  fdiv.s       fa5, ft9, ft2
                  remu         t2, gp, sp
                  fsgnjn.s     ft8, ft7, ft11
                  fmv.x.w      s11, ft0
                  fsgnj.s      ft6, ft2, ft10
                  sll          t4, s11, s7
                  fmv.w.x      fs4, t2
                  mulhu        t1, s7, s2
                  slli         a0, s10, 8
                  slti         ra, s7, -796
                  sra          t4, s6, s0
                  fcvt.s.w     ft6, sp
                  lui          s2, 76557
                  fsub.s       fs2, fs1, ft3
                  or           t3, s3, t4
                  rem          gp, a2, s9
                  add          a4, a4, s2
                  or           s7, t4, s8
                  slli         t0, sp, 29
                  slt          a2, s11, t6
                  sltiu        gp, t0, -517
                  or           t2, s0, t6
                  flt.s        ra, fs9, fs5
                  fdiv.s       fs8, ft11, fs8
                  sltu         t2, ra, s5
                  srl          a6, t6, s7
                  fmul.s       ft7, fs5, ft5
                  sub          a3, s1, t1
                  fle.s        a5, ft4, ft4
                  ori          tp, s5, -33
                  fsgnjx.s     ft2, fa1, ft11
                  div          s9, a4, ra
                  or           a6, s4, a5
                  fcvt.s.w     ft7, a0, rdn
                  nop
                  and          s4, a1, a0
                  andi         zero, s9, -1122
                  andi         s11, t4, 799
                  nop
                  sltiu        t1, t3, 615
                  fsub.s       fs4, ft5, fa6
                  xor          t0, t3, t1
                  or           t1, s4, s1
                  add          t6, s11, s9
                  fsqrt.s      fs4, fs5
                  auipc        s2, 699115
                  srli         a2, s7, 20
                  srli         ra, s4, 22
                  rem          ra, t5, t3
                  mulhu        gp, s5, t4
                  xor          s3, gp, s6
                  rem          s11, sp, a5
                  srli         s7, a5, 9
                  srli         s10, a0, 20
                  fsgnjn.s     fa5, fa7, fa2
                  divu         t1, s10, a3
                  feq.s        t2, ft5, fa5
                  sltu         s9, a7, a6
                  sltu         a5, t2, a3
                  fsqrt.s      ft5, fa2, rmm
                  fdiv.s       fs0, ft5, fa0, rmm
                  fsgnj.s      ft5, fs11, fa4
                  sltiu        t2, s6, 763
                  andi         a2, a2, -837
                  addi         t4, t1, -260
                  slti         t6, t5, 687
                  fmv.w.x      fs8, t6
                  mulh         s1, a2, t1
                  sltu         ra, a0, a0
                  fsgnj.s      ft4, fa7, fa5
                  xor          s2, t1, a1
                  divu         s8, s7, a0
                  xori         s3, a6, -1494
                  fsgnj.s      ft11, ft8, fa4
                  slti         s2, s6, -170
                  and          gp, t1, s0
                  sltiu        s4, s4, -810
                  fle.s        a1, fs10, ft10
                  fcvt.wu.s    s6, ft5, rmm
                  sll          a7, a5, ra
                  mul          tp, s8, s4
                  sltiu        s1, t2, -794
                  sltu         s9, zero, t4
                  fmax.s       fa7, fs11, fa4
                  rem          s6, s8, t4
                  mulh         s9, a3, s1
                  srl          s0, s3, t4
                  fmv.w.x      fa5, s5
                  fcvt.w.s     t6, ft5, rup
                  fmin.s       ft10, fs0, ft4
                  fsub.s       fs7, fs0, fs11, rup
                  mulhu        s2, t0, s9
                  ori          s8, s9, 1489
                  nop
                  slti         t0, t3, -591
                  fcvt.w.s     a3, fs8, rup
                  divu         t6, t5, s10
                  addi         a5, gp, 1586
                  slli         s9, t0, 12
                  slti         tp, gp, 260
                  fcvt.s.w     fa7, s10
                  nop
                  sra          a4, t6, t6
                  mulhsu       s8, s2, s5
                  mulhu        s11, t1, s3
                  fsgnjn.s     fa4, fs7, fa1
                  mulhsu       s10, s10, ra
                  xor          t6, s5, s11
                  auipc        t0, 328359
                  fcvt.s.w     fs2, s3, rmm
                  divu         a4, s8, s6
                  fcvt.wu.s    t6, ft11, rmm
                  sltiu        s2, s8, -510
                  feq.s        s8, fa3, fs1
                  xor          a5, t1, s8
                  sll          a0, s10, s5
                  mulhsu       a1, a1, a5
                  feq.s        a0, fs6, ft10
                  sltu         ra, s6, t3
                  fsqrt.s      fs8, fa0, rup
                  remu         t1, a1, s7
                  remu         s3, t3, zero
                  sra          s11, s6, a4
                  fdiv.s       ft7, ft2, fa2, rup
                  feq.s        s2, ft8, fs5
                  divu         a0, a2, zero
                  addi         s11, t6, -845
                  fmul.s       ft5, fs2, ft8
                  sltiu        s9, s8, -1788
                  srl          zero, s1, a6
                  sltiu        s10, a4, 1895
                  fmin.s       fs6, fa2, fs7
                  mulhu        s0, t1, t5
                  srai         s4, s1, 4
                  and          a2, t6, t5
                  xori         t1, t6, 206
                  flt.s        s7, fs11, ft7
                  fcvt.wu.s    zero, fs8, rdn
                  div          a2, a7, s9
                  fle.s        a5, fs3, ft4
                  sltu         s0, a6, sp
                  sra          s7, t1, t6
                  ori          a0, zero, 1691
                  mulhu        a5, tp, s10
                  fmul.s       fa1, fs3, ft3
                  fsub.s       fs7, fa1, fs9, rup
                  xori         s9, s3, -1619
                  remu         s0, t0, a6
                  fmax.s       ft2, fa2, fa3
                  fmul.s       ft5, ft7, fa0
                  fmv.x.w      a7, ft0
                  lui          a5, 261816
                  lui          t4, 807779
                  sll          s11, s3, t0
                  add          s8, a4, t2
                  fsub.s       fs10, fs7, ft8, rtz
                  fadd.s       fa6, fa5, fs2
                  mul          gp, t3, s0
                  divu         s10, s9, ra
                  fcvt.w.s     t1, ft11
                  mulhu        a0, s2, t2
                  fsqrt.s      fa2, fs2
                  flt.s        s4, ft1, ft9
                  fmv.x.w      a6, fa0
                  srli         t2, s4, 18
                  sltiu        a1, sp, -1174
                  xori         s2, gp, -1724
                  fsgnjn.s     fs6, ft6, fa5
                  addi         t6, s1, -1480
                  fadd.s       fs4, ft5, fs3, rne
                  fcvt.s.wu    ft5, zero
                  fsgnjn.s     ft4, fa6, fs0
                  or           a6, s6, t4
                  fsqrt.s      fs1, fa7
                  xori         a4, s7, 1688
                  fcvt.wu.s    s9, fa4, rtz
                  lui          t3, 91972
                  fmax.s       fs10, fs4, fs2
                  andi         zero, gp, 110
                  rem          t2, a0, s8
                  fcvt.s.wu    ft6, t1
                  fadd.s       fs0, fa5, fs5, rup
                  srli         ra, t6, 14
                  feq.s        t4, ft2, ft10
                  srli         a2, a7, 28
                  fsgnjn.s     fs6, fa7, fs1
                  or           s2, s10, s1
                  fcvt.s.wu    ft8, zero
                  addi         a1, s6, -1315
                  addi         s6, s11, 1640
                  andi         s1, t1, -732
                  add          a4, s5, t2
                  ori          zero, s3, -741
                  srli         gp, s5, 3
                  lui          s6, 160104
                  ori          s9, s5, 287
                  andi         t6, s2, 866
                  fdiv.s       ft10, ft5, fs0
                  remu         s0, s4, t3
                  fmax.s       ft10, fs4, fs1
                  fcvt.s.wu    fs6, a7, rup
                  fmv.w.x      ft11, s4
                  fsgnjn.s     ft3, fs9, ft0
                  mul          gp, s10, s1
                  fle.s        ra, fa2, fs8
                  fle.s        t0, fs6, fa1
                  fle.s        a7, ft11, ft0
                  srl          s6, a3, a1
                  feq.s        a1, ft2, ft4
                  sub          s2, sp, s11
                  div          s1, a5, ra
                  fle.s        s7, ft0, ft7
                  mulhsu       a1, a5, gp
                  fcvt.s.wu    ft0, sp
                  sra          t2, a1, s0
                  slti         s4, t3, -1524
                  fmax.s       ft5, fa0, fs2
                  sltu         zero, tp, s2
                  remu         t2, s7, s11
                  fadd.s       fs1, fs7, ft10
                  mulh         s9, sp, t4
                  fclass.s     a7, fs9
                  fadd.s       ft1, ft8, fa3, rdn
                  divu         a7, a1, t5
                  nop
                  slti         s9, a7, 647
                  fcvt.s.w     fs10, zero
                  add          s6, s9, s9
                  srai         a0, t0, 1
                  or           s4, s9, a3
                  srl          a3, s4, a0
                  ori          a3, s6, 1327
                  fmv.w.x      fs4, t2
                  fsub.s       ft8, ft10, fs6, rup
                  fle.s        zero, ft4, fa1
                  fsqrt.s      fs4, fa2, rne
                  mulhsu       s10, tp, s10
                  srli         s0, ra, 22
                  fmul.s       fs11, fa5, fa1
                  divu         s10, a3, s1
                  srai         a4, gp, 3
                  andi         s4, t3, -1523
                  xori         s4, t3, 1872
                  sltiu        s2, s3, -1065
                  xor          a1, a6, t2
                  div          s1, a6, s10
                  fsgnj.s      fa4, ft10, ft4
                  auipc        t6, 214922
                  flt.s        s7, ft0, ft11
                  fsub.s       ft10, ft1, fa0, rne
                  fcvt.w.s     s7, fs6, rdn
                  srai         s10, s10, 1
                  nop
                  auipc        a4, 420820
                  fmul.s       fs3, fs4, ft3
                  mulhu        s6, t0, s8
                  ori          t1, t4, -811
                  divu         t3, tp, tp
                  xori         s7, t4, -1617
                  fcvt.w.s     a6, fs7, rup
                  sub          t3, a5, s5
                  add          s9, a1, ra
                  fmv.x.w      s8, fa7
                  andi         s11, s10, 1464
                  sll          t4, s8, t1
                  fsgnjx.s     fa3, ft8, fa2
                  mulhsu       tp, zero, a0
                  slti         a1, s11, -298
                  srai         s0, s11, 15
                  fsgnjn.s     ft11, ft2, ft5
                  slt          t1, t5, a1
                  andi         t6, zero, 675
                  srli         s10, a6, 23
                  sltu         gp, a5, s6
                  andi         s9, a6, 1639
                  slti         t1, sp, -663
                  fsub.s       ft4, ft1, ft8, rne
                  add          gp, gp, a3
                  mulhu        tp, a6, a0
                  slti         a0, s6, -954
                  mulhu        t2, a3, s3
                  sltu         s8, s9, s0
                  rem          ra, s7, a5
                  fsgnj.s      ft1, fa1, ft0
                  fdiv.s       ft2, ft6, ft9
                  or           ra, a3, t1
                  fsgnjn.s     ft9, fa3, fs3
                  fsub.s       fs9, fa0, fs0
                  feq.s        s7, fs3, fs1
                  fmin.s       fs3, ft3, fa5
                  lui          s4, 805180
                  xor          s3, gp, s11
                  add          s8, a1, t6
                  mulhu        s3, t1, ra
                  xor          s6, t0, s3
                  ori          gp, sp, -744
                  auipc        gp, 312199
                  fsqrt.s      fa7, fa0
                  xor          t2, ra, s1
                  mulhsu       gp, t6, ra
                  nop
                  fcvt.s.w     fs10, s10
                  flt.s        s2, fs10, fa6
                  fsqrt.s      fa7, fs7, rdn
                  fmax.s       fa3, fs10, ft2
                  addi         a2, s11, 1813
                  fmax.s       fa2, fs0, fs10
                  sub          a1, t6, s6
                  lui          s6, 959954
                  srai         s11, tp, 4
                  remu         a7, t0, s7
                  div          t1, ra, s2
                  sra          s8, s5, a5
                  lui          gp, 242765
                  add          a3, sp, s9
                  sltu         a2, s2, gp
                  slti         a2, t1, 2030
                  fadd.s       fs11, fs6, fs2
                  sltu         t1, s8, a5
                  mulh         a4, t0, a1
                  fsub.s       ft8, fa5, ft3
                  fmv.x.w      s4, fa5
                  fmul.s       fs7, ft11, fs11
                  srl          t3, s9, sp
                  sltu         zero, a4, tp
                  fcvt.s.wu    fs1, a3, rmm
                  srli         a0, a7, 27
                  mulhsu       s2, s2, ra
                  fcvt.s.wu    ft0, a2, rup
                  fcvt.wu.s    s10, ft8
                  fsub.s       fs4, ft1, ft4, rtz
                  fmin.s       fs11, fa6, fa6
                  fcvt.wu.s    s7, ft5, rup
                  fmin.s       fs9, fs4, ft11
                  sub          t4, sp, t3
                  xor          t6, a2, s3
                  fmul.s       ft1, ft6, fs5
                  srl          t1, s0, a7
                  xor          s8, t1, a3
                  fmax.s       ft9, fs10, ft8
                  mulhsu       t3, s7, a4
                  fcvt.w.s     a0, ft4, rtz
                  fadd.s       fs3, fs4, fa2, rtz
                  slli         s9, s9, 3
                  flt.s        gp, ft10, ft11
                  fmax.s       fs5, fs3, ft7
                  fsgnj.s      fa3, ft4, ft11
                  fmul.s       fs2, ft4, fa3
                  mulhu        s10, a3, s6
                  slli         s7, a4, 29
                  fsqrt.s      fa2, fa7
                  fmul.s       ft2, ft4, fs0
                  divu         ra, s0, t3
                  fdiv.s       fa7, fs10, ft8, rtz
                  slli         t4, a5, 16
                  rem          s4, sp, tp
                  auipc        s0, 150801
                  divu         s9, a6, s8
                  fcvt.wu.s    s6, ft9, rne
                  mulhu        s11, t1, s9
                  fle.s        a3, fs11, ft11
                  sll          s6, t0, a7
                  lui          a1, 533852
                  flt.s        s4, fa4, ft0
                  srli         t6, zero, 26
                  sra          a1, s1, s3
                  fcvt.s.w     fa2, zero
                  sltiu        gp, s8, 1744
                  sll          t0, a0, a4
                  xor          s4, s9, t6
                  rem          a5, zero, a3
                  fsqrt.s      ft5, ft11
                  xori         s0, s4, 1078
                  slli         a3, a0, 0
                  fsqrt.s      ft7, ft8
                  srai         t6, a4, 11
                  srl          s7, ra, s1
                  sub          t3, a7, t6
                  fsgnjn.s     fs6, fs0, fs2
                  xor          t6, t1, s11
                  xori         s3, s2, -1649
                  or           a7, tp, a3
                  rem          a7, s3, a6
                  or           s1, s8, s2
                  fdiv.s       fs2, fs11, fs6, rtz
                  fadd.s       fs9, ft8, fa3, rdn
                  addi         t0, a5, 2002
                  fmax.s       fs2, fs11, ft11
                  ori          zero, s9, -1783
                  mulhsu       s7, s7, a4
                  feq.s        a2, fa5, fs3
                  fmin.s       ft7, fs9, ft8
                  lui          ra, 308313
                  fcvt.s.w     fs10, t1
                  sll          t4, s1, s8
                  sll          a2, s11, s4
                  fmv.x.w      tp, fa3
                  fcvt.s.w     fa6, s4
                  div          s7, s7, a3
                  xori         t6, s11, -1059
                  rem          a2, t6, s0
                  slli         t4, a3, 7
                  mulh         s3, s6, s2
                  feq.s        s2, fs4, ft4
                  and          a3, s11, s4
                  fsgnjx.s     ft5, ft9, fs11
                  sltu         t0, a0, a1
                  fdiv.s       fa5, ft2, fa0, rup
                  mulhu        tp, t1, a0
                  fsub.s       ft3, fs8, ft3, rup
                  fle.s        s9, ft8, ft2
                  remu         s11, a5, gp
                  fsub.s       fa6, fs2, fa4, rtz
                  fdiv.s       fa2, fa0, ft6
                  auipc        ra, 625125
                  remu         t3, s11, s9
                  sltu         t1, zero, s11
                  divu         a2, s3, a6
                  fdiv.s       ft9, fa0, fa3, rup
                  fcvt.s.wu    fs6, a3, rdn
                  auipc        s2, 764023
                  fcvt.s.w     ft5, s6
                  sltiu        a0, t6, 1852
                  divu         zero, s0, t1
                  fcvt.wu.s    a2, fs9, rmm
                  sltiu        a4, a3, 482
                  sltu         s9, s8, a0
                  mulh         t4, s4, s0
                  fsgnjn.s     fs3, fa7, fa2
                  remu         s11, sp, s0
                  divu         a2, a0, s1
                  fle.s        tp, fa1, fa3
                  srli         ra, t6, 28
                  sub          s7, s1, s7
                  and          a6, t3, s7
                  sub          a0, zero, s3
                  srli         t4, s2, 7
                  mulh         s10, t6, sp
                  xor          a2, t2, s5
                  fcvt.wu.s    a3, ft9, rup
                  flt.s        s9, fs7, ft0
                  sll          a3, s5, a3
                  or           s9, s0, s6
                  slt          a0, t1, a5
                  sltu         s4, s11, a7
                  nop
                  fcvt.s.w     ft3, s10
                  srli         tp, s0, 27
                  fadd.s       ft3, fs10, fs6, rtz
                  mulhsu       s10, t1, s6
                  add          t1, s2, t3
                  lui          t0, 909027
                  remu         a2, t4, a7
                  sll          s10, t2, sp
                  fmin.s       ft1, fs3, fs4
                  ori          a0, s2, 485
                  ori          a2, s6, -1204
                  fcvt.s.w     fs2, t6
                  fmv.w.x      ft8, s5
                  slti         gp, a5, -1823
                  flt.s        s0, fa1, fa5
                  ori          a5, tp, 144
                  auipc        a1, 411171
                  sltiu        t2, a1, 1155
                  lui          ra, 278575
                  fdiv.s       fs4, ft10, fa7, rmm
                  fsgnjn.s     fs11, ft10, ft2
                  srli         s6, t0, 28
                  xori         t2, t2, 1700
                  auipc        a1, 344257
                  mul          t3, s6, a5
                  fcvt.s.w     fs5, a3, rne
                  fmul.s       fa0, ft11, fa2, rtz
                  flt.s        gp, fs7, ft4
                  lui          t0, 770182
                  fcvt.s.w     fs4, a2, rdn
                  slti         tp, s5, 535
                  fmv.x.w      s8, fs0
                  div          tp, a7, t2
                  srli         a4, a5, 9
                  mulhu        t2, s8, s10
                  rem          ra, a5, tp
                  feq.s        a3, fs7, fa0
                  fadd.s       fa0, fs3, ft2, rne
                  slt          s9, s9, t3
                  and          s10, t5, s11
                  lui          t4, 153567
                  and          tp, gp, gp
                  fcvt.wu.s    a2, ft5, rne
                  srai         t4, a3, 24
                  fsqrt.s      fs8, fa0, rne
                  fcvt.wu.s    s4, ft11, rtz
                  fcvt.s.w     ft5, t4, rtz
                  slt          s7, a0, t1
                  fdiv.s       ft0, ft5, ft7, rmm
                  ori          a3, s0, -279
                  fsgnj.s      fs4, fs6, ft8
                  xori         s4, sp, 301
                  fcvt.wu.s    tp, fs4, rne
                  mulhsu       t1, t2, t0
                  srli         s9, s6, 20
                  fsgnj.s      ft2, fs9, ft10
                  slli         a6, t5, 24
                  sll          s11, sp, a2
                  fsgnjx.s     ft9, ft8, fs3
                  mulhu        ra, tp, t2
                  div          a4, t5, s6
                  sra          gp, a2, t1
                  slti         s6, s6, -1805
                  fsgnjn.s     fa4, fa5, fa7
                  remu         tp, t5, a5
                  mulh         ra, t3, s4
                  sra          a7, s0, a3
                  fdiv.s       fs3, ft2, ft6, rtz
                  mulhu        s7, s6, tp
                  fcvt.s.wu    fa1, a1
                  fdiv.s       fa2, fa5, ft8
                  flt.s        tp, fa0, fa7
                  fmv.w.x      fa5, s11
                  div          a4, s2, a0
                  fclass.s     t2, fa0
                  or           s4, sp, a6
                  mulhu        t6, zero, zero
                  ori          s1, s9, -882
                  fmin.s       ft8, fs8, ft5
                  fcvt.s.w     fs10, tp, rdn
                  fclass.s     s1, fs0
                  xori         s8, s2, 1808
                  fmv.w.x      fa4, tp
                  remu         a1, a7, t4
                  fmax.s       ft0, ft7, fa3
                  sra          a7, s9, gp
                  fdiv.s       fs9, fa4, fs3
                  sub          a5, s8, s0
                  xor          s0, s7, ra
                  fmv.x.w      a6, ft4
                  sltu         zero, zero, t3
                  mulh         s6, t3, a6
                  or           s3, s3, s5
                  addi         tp, s7, 1503
                  feq.s        s1, fs8, fs6
                  div          s9, gp, gp
                  remu         s4, a1, tp
                  sub          t2, t5, s0
                  fmin.s       ft4, fa2, ft9
                  slti         s6, t1, -1738
                  sltu         t2, gp, t2
                  remu         s2, s10, t2
                  feq.s        s9, fa1, fs1
                  add          s6, s1, s0
                  sltiu        s3, s0, 1480
                  fcvt.wu.s    s1, fs6, rtz
                  fmax.s       fs10, fs4, ft8
                  fsgnjx.s     ft3, fa7, fs2
                  fsgnjn.s     fa0, ft9, ft5
                  nop
                  fsgnjx.s     fs11, fs1, fa5
                  srli         s10, s4, 17
                  mul          t4, zero, gp
                  fdiv.s       fs7, fa2, fa0
                  divu         a0, s4, sp
                  fsgnjx.s     fs7, ft7, ft4
                  fmv.x.w      s7, fa1
                  srai         s6, s6, 29
                  mul          s9, s4, ra
                  fmv.x.w      s3, fa7
                  fcvt.wu.s    a7, fs2, rtz
                  fmul.s       ft5, fs4, fa3
                  fmv.x.w      ra, fs1
                  srai         zero, t1, 2
                  mulh         gp, t2, ra
                  fmin.s       ft7, fs9, ft9
                  fle.s        a4, fa0, fs10
                  fmul.s       ft9, ft9, fs5, rtz
                  add          a2, s0, a6
                  srl          a3, zero, t4
                  fsub.s       ft11, ft1, fa1
                  mul          t4, s2, s7
                  sra          t1, s1, a0
                  fcvt.wu.s    a5, fs1, rmm
                  ori          a4, t6, -1176
                  fmul.s       fs6, ft1, fa6
                  mulh         t4, s11, s8
                  fsqrt.s      fs7, fs3
                  sltu         a3, a6, s7
                  ori          a3, s0, 1905
                  mulh         ra, s2, t2
                  mulh         gp, t4, s10
                  fclass.s     s2, fa0
                  sub          s8, t0, a2
                  xor          t1, a3, s5
                  feq.s        s0, ft10, fa5
                  sltiu        a5, s11, -1471
                  fdiv.s       fa6, fa4, fs4, rmm
                  sub          s1, a2, t2
                  flt.s        a0, ft10, ft6
                  fmul.s       fs10, ft1, ft5, rmm
                  sub          a3, gp, zero
                  flt.s        a2, fs0, fa4
                  fclass.s     t0, ft5
                  div          a2, s2, s1
                  srai         s2, gp, 6
                  mulh         ra, s0, s11
                  rem          s6, t2, t3
                  fadd.s       ft2, fs11, ft6, rup
                  fcvt.s.w     fa5, s1, rup
                  slti         ra, a1, 247
                  fadd.s       fs11, fa5, ft11
                  auipc        tp, 509666
                  lui          s2, 432550
                  fmv.w.x      ft0, t0
                  slt          t2, tp, a6
                  fcvt.s.wu    fa6, s4
                  fmin.s       fs8, ft4, fs4
                  add          t6, s8, s10
                  srli         s11, tp, 23
                  feq.s        a7, fs7, fs8
                  fsgnj.s      fs7, ft8, ft9
                  fle.s        s10, fs6, ft11
                  nop
                  andi         a3, s4, 404
                  fmv.x.w      s4, fs3
                  fcvt.w.s     t2, ft2, rmm
                  sltiu        t2, t5, 1899
                  sub          s10, s8, s1
                  slli         t2, s4, 2
                  slli         a5, s8, 0
                  fmax.s       ft11, fs7, fs11
                  nop
                  slli         t3, s8, 3
                  andi         ra, t4, 1513
                  and          a0, t2, a5
                  slti         t1, s0, 460
                  add          tp, a0, s6
                  sltu         s3, s10, t3
                  fmin.s       fa5, fa7, fa3
                  sub          tp, t5, s3
                  sll          t1, s3, a1
                  mulh         a1, a6, a6
                  auipc        t3, 910885
                  andi         s7, s6, 1135
                  fmul.s       fa0, fa0, ft8, rne
                  lui          a5, 386897
                  mul          s6, s10, t3
                  auipc        a1, 966811
                  fdiv.s       fa6, fa7, fs9
                  srl          s6, t6, a7
                  fmv.x.w      t3, fs2
                  lui          tp, 714645
                  flt.s        s6, ft4, fs4
                  auipc        t6, 36005
                  divu         s11, t2, t4
                  fmax.s       fa1, fs2, fa4
                  fle.s        t2, ft8, fa4
                  remu         tp, a1, gp
                  srli         a3, a2, 30
                  fmul.s       ft8, fs8, ft7
                  addi         a2, a0, 977
                  slti         a5, t2, 462
                  sltu         t6, s9, s2
                  addi         s10, s3, -1192
                  and          a0, a2, s1
                  srai         t0, a5, 9
                  xor          ra, s11, s11
                  fclass.s     s9, fa6
                  nop
                  sra          a7, s11, s11
                  slt          s7, a6, s10
                  fmul.s       fs11, fs3, fs0
                  fmv.x.w      s1, fa6
                  srl          s10, sp, a1
                  remu         s11, s10, a4
                  sltu         s3, a0, t3
                  slti         a5, t0, -1346
                  fsgnjn.s     ft2, ft5, fa5
                  add          t1, a0, ra
                  add          t6, t2, s1
                  fsgnjn.s     fs4, ft11, ft1
                  mulhsu       t6, a4, a0
                  slti         a7, t0, -1905
                  andi         s8, a7, -1115
                  mulhsu       s0, gp, t1
                  fmin.s       fa2, fa7, ft1
                  or           tp, zero, s2
                  fle.s        a7, fs2, ft9
                  ori          s7, s9, 1133
                  fsgnjx.s     fs1, ft11, fs7
                  slt          a2, a1, a4
                  fcvt.wu.s    tp, fs7
                  flt.s        s6, ft9, fs3
                  div          s7, s7, s11
                  xor          t2, t6, s0
                  andi         s7, a3, 365
                  xori         a5, s8, 525
                  addi         s3, s0, -1751
                  srli         s9, s8, 4
                  mul          ra, t3, sp
                  lui          s9, 644312
                  auipc        s0, 670329
                  div          s1, s11, t4
                  slli         t4, a1, 3
                  addi         tp, zero, -1485
                  andi         a7, s2, 797
                  fclass.s     t0, fs6
                  xori         s9, sp, -326
                  fcvt.s.w     fs6, s8, rtz
                  mulh         a4, s9, a3
                  fcvt.w.s     a0, fs4, rne
                  nop
                  slli         zero, s10, 30
                  fmul.s       fa5, fs3, ft10, rup
                  addi         t1, a7, -783
                  lui          t3, 724457
                  or           s2, s4, s7
                  fsgnjn.s     fs6, fs8, fa7
                  fmv.x.w      a4, fa4
                  fadd.s       fa6, ft0, fa5
                  sub          t2, sp, s6
                  andi         t2, t6, -1013
                  fmv.w.x      ft6, s11
                  fsqrt.s      ft4, fa4
                  rem          a3, zero, sp
                  fmv.x.w      a7, fs6
                  fle.s        a6, fs3, fa2
                  fadd.s       ft4, fa5, fa5, rmm
                  addi         t3, t2, -676
                  srl          tp, s9, s8
                  feq.s        t0, ft6, fa5
                  fsgnj.s      ft9, ft3, ft7
                  mulh         t2, tp, t4
                  mulhu        a3, zero, s3
                  sll          t4, a7, s0
                  addi         a6, s6, 246
                  mulhu        gp, a0, s7
                  andi         t1, a4, -1586
                  fclass.s     s8, fa3
                  srli         s2, a3, 13
                  sra          t3, t0, gp
                  and          t4, s7, s8
                  auipc        tp, 77731
                  auipc        s3, 117280
                  fsqrt.s      fa3, ft5
                  fmax.s       fs7, ft11, fs9
                  mulhsu       a2, gp, t0
                  fle.s        s4, fa2, fs5
                  xor          t2, s8, t1
                  remu         s8, s1, a5
                  fcvt.w.s     t0, fa7
                  flt.s        s9, fa0, fa4
                  slli         a7, t2, 4
                  sll          a3, a6, t1
                  and          t6, s6, s0
                  fle.s        a3, fs4, ft9
                  slli         t1, t1, 15
                  slli         s11, a6, 11
                  fmul.s       fs10, ft9, fs6
                  ori          t4, t1, 143
                  fmax.s       ft1, ft9, fs8
                  slti         s10, s7, -1198
                  sll          a7, t1, t2
                  mul          ra, s11, t5
                  sltiu        zero, s6, -1826
                  sltiu        t1, gp, -282
                  mulhu        t1, t3, sp
                  sltiu        a0, ra, -1888
                  div          s8, gp, t2
                  div          tp, a0, t5
                  flt.s        s11, fs0, ft3
                  rem          s11, t4, s6
                  mulhu        ra, s9, s11
                  sltu         s0, t4, zero
                  fmax.s       ft4, fa0, fa3
                  fmul.s       fa7, fa6, fs10
                  srli         t0, gp, 13
                  sltiu        s1, s7, -49
                  fcvt.wu.s    s4, ft4, rtz
                  sra          a3, s11, t5
                  mulhsu       a6, s5, a5
                  slli         s0, s2, 27
                  flt.s        a2, fa1, fs7
                  nop
                  fclass.s     a0, ft8
                  fmv.x.w      a2, fa0
                  div          a5, s10, t1
                  sltiu        a7, s1, 897
                  ori          s9, t5, -407
                  fsub.s       fs0, fs9, fs4, rmm
                  sll          s8, s4, tp
                  and          s2, s5, t0
                  fcvt.w.s     s0, fs11, rmm
                  fmv.w.x      fs7, a7
                  srai         ra, s9, 19
                  remu         t2, t6, t2
                  fcvt.s.wu    ft10, t4, rtz
                  srli         s8, s1, 28
                  xori         s2, s3, 536
                  fcvt.w.s     a0, ft6, rmm
                  mulhsu       tp, s4, a5
                  mulhsu       s7, s3, a6
                  fclass.s     t2, fs1
                  fmax.s       fs0, fs1, fs8
                  slt          a7, s0, gp
                  fmul.s       ft9, ft4, fa0
                  fmul.s       fs3, ft4, ft2
                  fmin.s       ft10, fs9, ft11
                  slti         t2, a3, -1783
                  mul          s10, gp, s1
                  or           t0, s5, a3
                  feq.s        a7, fa7, fa2
                  mul          s9, s2, a7
                  auipc        t4, 899487
                  sltu         t4, a0, a4
                  fdiv.s       fa1, fa7, fs1
                  feq.s        t0, fs3, fa0
                  feq.s        a1, ft5, fa6
                  sll          a7, t0, s11
                  slli         t4, t0, 24
                  flt.s        tp, fs1, fs3
                  slli         t1, s5, 1
                  add          a7, s1, s0
                  fcvt.s.wu    fa1, s1, rdn
                  sll          tp, sp, tp
                  xor          s7, s7, s11
                  sub          zero, a2, ra
                  feq.s        a6, ft7, fs5
                  flt.s        t2, fs1, fa7
                  fsgnj.s      fs3, fa6, ft2
                  auipc        s4, 751214
                  fcvt.w.s     ra, fa4, rtz
                  mulhsu       s7, t1, a4
                  xori         a2, s1, -1780
                  and          a2, s10, a3
                  or           t6, s5, s1
                  xori         s1, s0, 1800
                  fsgnjn.s     fs4, ft2, fs0
                  fsgnjx.s     fs5, fs2, ft1
                  sll          s0, ra, t3
                  auipc        a4, 870618
                  mul          t3, s11, a5
                  fdiv.s       ft9, ft3, fa7, rup
                  rem          s8, ra, a1
                  addi         a3, sp, -1268
                  srai         t6, s3, 23
                  fmax.s       ft2, ft5, ft10
                  mulhsu       t6, a4, s1
                  auipc        a6, 582236
                  fsqrt.s      fa7, ft10, rup
                  fcvt.s.wu    fs3, t4, rup
                  andi         s8, s11, -332
                  sltu         t0, zero, s1
                  mulhu        tp, s2, t6
                  mul          s2, s1, a1
                  fsgnj.s      fa6, fa7, fs7
                  mulhu        a4, s4, t0
                  fmul.s       fs3, ft5, fs7, rmm
                  and          zero, s5, s10
                  sra          t4, s7, a1
                  srai         s11, tp, 9
                  srl          a0, t0, a1
                  sub          s2, a4, gp
                  xori         a2, sp, -1555
                  addi         t6, t0, 1499
                  or           t1, a6, t1
                  div          a3, s5, t0
                  mul          a2, ra, t3
                  add          a6, t0, sp
                  sra          t6, s1, s8
                  srli         a2, s3, 3
                  flt.s        zero, ft9, ft0
                  feq.s        s4, fs8, ft1
                  and          a0, t1, a1
                  fsgnjx.s     fs6, fs2, ft4
                  andi         t1, tp, 1533
                  and          s10, a7, s9
                  fdiv.s       fs7, fa4, fs3
                  fsgnjx.s     fa1, fs3, fa4
                  fmin.s       fs8, fs11, fs1
                  xori         t6, s5, -1451
                  fmul.s       fs7, fa7, fs3, rne
                  fsgnj.s      ft7, fs5, fa7
                  auipc        s7, 338823
                  sll          a0, a5, ra
                  sll          s6, gp, s7
                  sra          t3, s1, a4
                  auipc        a1, 533174
                  rem          s6, a5, zero
                  sub          s2, s1, s5
                  mulh         t0, zero, sp
                  feq.s        s8, ft3, fs10
                  nop
                  fmv.x.w      tp, fs10
                  mulhsu       s11, a6, t1
                  nop
                  fcvt.wu.s    a3, ft7
                  fmin.s       fs3, fs4, fs6
                  ori          zero, s9, 532
                  ori          a3, t1, 1444
                  fsgnjn.s     fa3, ft4, ft6
                  slti         s3, t2, 150
                  fle.s        t6, fs0, fa0
                  auipc        s6, 285931
                  fcvt.wu.s    s7, fs1, rne
                  feq.s        s1, ft7, fs0
                  mulh         s1, t1, t2
                  fmin.s       fs5, ft3, fs10
                  fmin.s       ft8, fs11, fs8
                  fle.s        t2, fs10, fs6
                  and          s7, a5, t0
                  nop
                  fsgnjx.s     fa4, fs6, ft4
                  fsqrt.s      ft3, fa3
                  feq.s        tp, fs4, fs10
                  fcvt.w.s     t4, ft1, rtz
                  xor          a6, ra, t6
                  feq.s        a7, ft9, ft7
                  slti         s4, a7, -1087
                  addi         s4, t2, -247
                  fle.s        zero, ft11, ft7
                  slti         a5, s0, -1300
                  addi         s6, t4, 1055
                  slti         s1, s3, -460
                  fsgnjn.s     fs4, ft7, fs2
                  nop
                  fdiv.s       fs2, fa6, ft8, rtz
                  fadd.s       ft1, ft6, fs11
                  mulhu        a3, s2, s2
                  fsgnjx.s     ft0, fs11, fs3
                  fmin.s       ft1, fa3, fs5
                  fmin.s       ft9, fa1, fs0
                  fdiv.s       ft7, fa1, ft4
                  fcvt.w.s     s2, fa4, rup
                  addi         s1, t1, 1258
                  slti         t1, s10, -822
                  fclass.s     a1, fa6
                  and          a3, s0, t6
                  mulhsu       s8, t3, sp
                  nop
                  mulhsu       s7, a6, a4
                  fle.s        s2, ft6, fs6
                  div          s7, ra, s0
                  fcvt.wu.s    a6, fs4, rmm
                  fsqrt.s      ft6, fs5
                  slli         a3, sp, 9
                  or           a5, t3, s1
                  fcvt.s.w     ft0, s7, rmm
                  fcvt.wu.s    t3, fs2, rup
                  rem          a4, s1, a1
                  ori          t6, s6, -1098
                  divu         t6, gp, zero
                  fadd.s       ft9, ft10, ft1, rne
                  srl          s9, a5, t3
                  mul          s8, t1, s5
                  lui          s6, 929882
                  mulhu        t0, s7, t1
                  fcvt.s.wu    ft9, a4
                  fsgnjx.s     fs3, fa0, fs2
                  lui          a5, 545434
                  andi         s6, a7, -375
                  srl          t1, s9, t0
                  mulhu        t4, s5, t0
                  fsgnjn.s     fs2, ft4, fs3
                  lui          a5, 943618
                  xor          s6, s9, s6
                  flt.s        a1, fa4, ft0
                  xori         a0, t3, 1645
                  add          a4, s11, sp
                  divu         t1, gp, t0
                  nop
                  fmv.x.w      a5, ft2
                  fsgnjx.s     fs5, ft2, fs1
                  div          a1, tp, s7
                  ori          a6, tp, -1390
                  fmul.s       fs3, fa4, fs10
                  flt.s        s11, fa5, fa0
                  fclass.s     s11, ft1
                  mulh         a1, s10, t4
                  xor          zero, s7, gp
                  mulhu        t2, s3, s11
                  sltiu        s6, s0, 23
                  srli         s9, a3, 22
                  addi         s10, s1, 1645
                  add          a2, s2, t5
                  fsub.s       ft7, ft5, fa0, rtz
                  sra          gp, s1, sp
                  ori          a7, t6, -744
                  fsgnj.s      ft10, fa6, fs7
                  fmin.s       fa2, fs1, ft7
                  fcvt.wu.s    a3, fa0
                  slti         s4, t4, 1358
                  sltu         a1, a1, a1
                  fmax.s       fa7, fa7, fa1
                  sub          a6, s11, t4
                  ori          s11, s11, -1529
                  srl          a3, s8, a7
                  fsqrt.s      ft4, fs0
                  flt.s        a1, ft5, fs10
                  and          s10, s5, t3
                  or           s7, a4, zero
                  xori         tp, ra, -304
                  fcvt.s.wu    fs3, s0
                  mulh         t0, s6, a7
                  srl          s9, s4, s5
                  rem          s6, a5, s6
                  add          s0, t0, s9
                  srl          t2, gp, t5
                  srl          tp, s1, t3
                  sltu         ra, tp, tp
                  or           s1, sp, t0
                  fcvt.w.s     s7, fs1
                  nop
                  fsqrt.s      ft10, fs6
                  sll          a7, s9, a7
                  mul          s3, t5, t3
                  srli         a1, t3, 9
                  slti         s0, tp, -822
                  mulhu        s2, s6, s4
                  sra          s4, s10, t4
                  add          t1, t4, tp
                  or           t6, s3, s0
                  fsub.s       fa2, fs3, ft9, rtz
                  fadd.s       fa0, fa5, ft3
                  fmul.s       fs0, fs4, fs6
                  auipc        s1, 379211
                  feq.s        gp, fa3, fs10
                  sltiu        a5, s4, 1542
                  fsgnjn.s     ft8, fs6, fs4
                  add          s7, sp, sp
                  fmax.s       ft1, fa0, fs6
                  mul          t6, sp, t0
                  slli         a7, t4, 6
                  sltu         zero, t0, s3
                  sltu         a2, t3, a1
                  flt.s        a3, fa1, fs8
                  fcvt.s.w     ft4, s11, rup
                  slt          a2, t1, a6
                  xori         a5, s11, -1670
                  sra          a1, a6, a3
                  fmv.x.w      a2, fs4
                  rem          s2, s9, s6
                  andi         s7, s3, -1638
                  fcvt.s.w     fs9, t3, rup
                  fcvt.s.wu    ft2, a7
                  slt          t0, s0, s6
                  fmin.s       fa1, ft1, ft5
                  mulh         s11, t4, s0
                  slt          t6, s8, t0
                  mul          a4, t5, a5
                  sra          s3, s8, t4
                  fsub.s       fs2, fs9, fs6, rup
                  fmul.s       ft0, fa4, fs0, rtz
                  sub          s10, s10, ra
                  fle.s        t3, fs0, ft3
                  fcvt.w.s     s1, ft7, rtz
                  fcvt.s.wu    ft11, a2, rup
                  lui          ra, 998089
                  fmv.x.w      s4, fs3
                  fclass.s     a6, ft9
                  and          a1, t3, s4
                  slli         t4, t5, 14
                  sltu         s9, s7, t2
                  fmin.s       fs11, fs4, ft11
                  remu         s2, t2, t4
                  fcvt.s.w     fs8, s1, rne
                  sll          zero, a7, t5
                  add          a6, a7, t4
                  nop
                  fsgnj.s      ft9, ft4, fs9
                  mulhu        a2, s11, s7
                  fcvt.s.wu    ft5, t6, rtz
                  slli         s9, a4, 26
                  sll          a2, t6, sp
                  divu         tp, gp, gp
                  fsqrt.s      ft7, ft11, rdn
                  andi         s6, t2, -868
                  fcvt.s.w     fa3, t3, rne
                  sltu         gp, s4, s3
                  slti         s1, a6, 75
                  lui          t2, 674195
                  sll          t2, a1, s10
                  fadd.s       fs8, ft6, fa5, rtz
                  slli         t0, t3, 14
                  fadd.s       ft10, fa2, fs2, rmm
                  fdiv.s       ft2, fa0, fs4
                  andi         s6, s0, 1390
                  andi         s10, t1, -879
                  mulhsu       a4, t3, t2
                  andi         gp, s3, 1052
                  srli         a3, s9, 19
                  fmin.s       fa2, ft10, fa4
                  remu         s3, zero, s8
                  srai         t6, s7, 24
                  and          s11, t4, s9
                  mulhu        s11, s1, sp
                  srl          a0, ra, a2
                  mul          a3, a6, s1
                  fmax.s       fs3, ft6, fs0
                  fmax.s       fa5, fa7, fa5
                  xor          s8, tp, t0
                  divu         a2, s6, t6
                  lui          a2, 590159
                  fcvt.s.w     ft3, s2
                  slti         s1, sp, -1368
                  mul          t3, a7, tp
                  ori          a0, a4, -1728
                  fle.s        s7, fs2, fs11
                  remu         a4, tp, s10
                  srai         ra, gp, 8
                  sltiu        s8, s11, 1779
                  or           t0, s0, tp
                  fmax.s       fs11, ft11, ft4
                  fmax.s       fa4, ft10, fs9
                  lui          tp, 62365
                  fdiv.s       fa7, ft5, fs7
                  fsub.s       ft11, fs11, fa4
                  fcvt.s.wu    ft0, s8, rne
                  mulh         a3, s0, t0
                  slti         s11, t1, -652
                  fmin.s       ft5, fs9, ft8
                  fadd.s       ft11, fs4, fs2
                  div          tp, zero, tp
                  fsqrt.s      fs10, ft7
                  fmin.s       fa1, fa6, fa1
                  slt          s4, t6, ra
                  add          s8, a2, zero
                  fsub.s       fs2, ft2, fa7, rne
                  div          s8, a6, tp
                  sra          s10, s2, gp
                  sll          a4, t0, s7
                  remu         t1, zero, t0
                  srai         s4, s0, 4
                  fmax.s       fa4, fa0, ft0
                  fmv.x.w      t2, ft9
                  fmv.w.x      ft3, a4
                  andi         a6, s2, -443
                  slti         s7, t1, 1113
                  fsgnj.s      fs3, fa6, fs0
                  mulhsu       t4, s4, tp
                  add          gp, s6, s11
                  andi         t4, gp, -1156
                  feq.s        a4, fs0, ft8
                  fsqrt.s      fs7, fs3, rup
                  add          s2, sp, t6
                  div          ra, t4, s8
                  add          tp, zero, s6
                  fmv.x.w      s1, fa1
                  add          s1, t2, a0
                  fsgnj.s      fs4, fs10, ft5
                  fsqrt.s      fs6, fs8
                  flt.s        ra, ft4, fs5
                  sltiu        t6, t6, -1871
                  fadd.s       fs10, ft6, ft5
                  div          s9, s4, s8
                  fmin.s       fa4, ft6, fa2
                  srai         a5, s3, 16
                  fclass.s     s0, ft3
                  ori          t0, s8, 1665
                  lui          a5, 1013477
                  srl          zero, s0, s6
                  slt          a2, t3, t1
                  auipc        a3, 173451
                  rem          t3, t5, a5
                  sub          a6, a3, s8
                  slt          a6, sp, t5
                  andi         ra, s8, 649
                  fmul.s       fs7, fs10, fa3
                  srai         s3, a7, 12
                  sra          s1, s3, s4
                  fsgnjx.s     ft6, fa0, fa2
                  fcvt.w.s     s2, fs10
                  srli         t3, a7, 7
                  xori         s8, a3, 1899
                  or           gp, t6, a4
                  sub          a2, a5, s1
                  fsqrt.s      ft11, fs3
                  fcvt.s.wu    fs6, a6
                  andi         s7, s3, -739
                  fclass.s     t3, ft3
                  mulhsu       s8, s11, t0
                  mulhu        t6, s2, s7
                  nop
                  srli         t3, a6, 19
                  or           s2, s2, a3
                  mulh         t6, gp, s9
                  sltu         s1, ra, s10
                  sltu         a1, s1, s8
                  srli         a3, s7, 18
                  fcvt.w.s     a5, fs11
                  and          a3, s4, a3
                  srli         t2, s2, 12
                  and          s10, s0, s11
                  fcvt.w.s     s7, fa5, rne
                  fadd.s       ft6, fa3, ft4
                  fdiv.s       fs6, fs6, fs8, rdn
                  srli         s10, gp, 23
                  fsgnj.s      ft1, fs8, fa0
                  fcvt.wu.s    a0, fs2, rne
                  div          t2, a1, a3
                  ori          t2, t1, -994
                  remu         tp, s5, a2
                  xor          gp, a4, s9
                  fadd.s       fs5, ft5, fa1, rdn
                  and          t1, s10, s3
                  mulhsu       a7, a5, s11
                  fmin.s       fa3, ft10, fs1
                  mulh         t1, t5, ra
                  fsgnj.s      fs2, ft9, ft2
                  auipc        t0, 197562
                  fsgnjx.s     fs6, ft9, fs3
                  fadd.s       ft11, ft4, ft5, rmm
                  mul          gp, ra, tp
                  mul          t2, a7, ra
                  fcvt.s.w     fs8, t1, rne
                  sltu         a1, zero, t0
                  mulhsu       t4, s6, t1
                  add          zero, t6, t4
                  fmv.x.w      s3, ft1
                  fmv.w.x      fa0, gp
                  fsgnj.s      ft10, ft9, fs6
                  fsqrt.s      fa3, ft8, rdn
                  fmax.s       fa0, ft7, fa6
                  fcvt.w.s     t2, ft6
                  fsqrt.s      fs8, ft3
                  sub          t3, a5, a3
                  rem          s11, t1, s2
                  ori          a0, ra, -1797
                  flt.s        a3, fs11, fs7
                  srl          t1, t4, s10
                  sltiu        a4, a4, 1546
                  fclass.s     a5, fa6
                  divu         t3, zero, s6
                  fsgnjx.s     fa7, fa2, fs2
                  slti         t2, a1, 1217
                  ori          ra, ra, -806
                  add          t1, s4, s3
                  slti         s8, a0, -212
                  srl          a3, s1, ra
                  fcvt.s.w     fa0, s4, rup
                  fclass.s     s0, ft6
                  fsgnj.s      ft9, fa2, fa6
                  fsqrt.s      fs5, fs0
                  srl          s3, s7, s8
                  nop
                  slli         s1, s1, 26
                  sltiu        s3, tp, -1504
                  sll          t3, s9, a0
                  fsgnj.s      fa5, ft1, fa1
                  fdiv.s       ft1, ft6, fs0, rdn
                  fmv.x.w      s7, fs2
                  slti         s1, s11, -655
                  xor          a3, a1, t3
                  srai         a2, s8, 13
                  sra          a5, s1, ra
                  fmin.s       ft6, fa4, fs2
                  rem          a6, s6, s6
                  auipc        a4, 746500
                  xor          a3, a6, s11
                  andi         s11, a2, 903
                  fsqrt.s      fs7, fs4
                  srai         a2, t2, 12
                  sll          s2, s3, t0
                  divu         a3, t4, t5
                  mulhsu       s0, s4, s6
                  fmv.x.w      a1, fa5
                  sll          t1, s7, a5
                  slli         s11, s0, 22
                  sltiu        a6, a3, -1051
                  flt.s        t3, fs4, fs6
                  srl          a2, a0, a5
                  feq.s        ra, fa0, fs10
                  mul          a0, zero, a5
                  remu         t6, ra, gp
                  nop
                  fadd.s       fa4, fs11, ft3, rtz
                  ori          t6, s2, -500
                  srli         t1, a5, 9
                  fsgnjx.s     ft0, fs10, ft4
                  fcvt.s.wu    fa7, s1, rdn
                  slli         s3, s0, 17
                  remu         s11, s1, a2
                  fmv.x.w      s0, ft3
                  slti         a6, s0, 101
                  or           a1, a2, ra
                  xor          s11, t2, sp
                  mulhsu       a1, s2, a7
                  fmv.x.w      a7, ft0
                  fsgnj.s      fs5, fa7, ft0
                  sub          s0, t6, s10
                  fcvt.s.wu    ft9, s6, rmm
                  fcvt.s.w     fs4, zero
                  fdiv.s       fs6, ft5, ft4
                  auipc        t6, 97210
                  lui          s6, 935229
                  fdiv.s       fa0, fs3, fa6
                  fdiv.s       fs6, fa5, ft9, rup
                  fsub.s       ft7, fa0, fs2, rdn
                  fsgnjn.s     fs2, fs4, ft3
                  fsgnjn.s     fs3, ft4, fs3
                  fadd.s       fa5, fs3, fa2, rdn
                  fmax.s       fs8, fs8, fa1
                  sltu         s9, a2, ra
                  fcvt.s.wu    fs6, s8, rmm
                  mulhsu       zero, tp, ra
                  sra          s6, s6, t6
                  fsgnjn.s     ft5, fs5, ft10
                  fcvt.s.wu    ft10, t6, rtz
                  fmv.x.w      a3, ft5
                  and          s3, gp, s4
                  div          tp, t2, a5
                  addi         gp, s0, 1303
                  fmul.s       fs2, fs3, fa2
                  nop
                  mulhsu       a2, a3, t0
                  div          t3, a6, s0
                  auipc        s6, 587118
                  slli         s9, s3, 8
                  srli         ra, t6, 28
                  fle.s        a0, ft9, ft9
                  sltu         a7, a0, sp
                  sll          t2, zero, s4
                  srl          s8, a7, a0
                  fle.s        a1, ft4, ft6
                  fmin.s       ft9, ft2, ft4
                  fsub.s       fs2, ft8, fa1
                  fclass.s     s9, fs2
                  divu         t1, t2, gp
                  fmax.s       ft3, ft0, ft1
                  addi         s11, s3, -1173
                  fclass.s     t4, ft8
                  fmv.x.w      gp, fs4
                  andi         a0, a2, -973
                  fmax.s       ft4, fs7, fs8
                  fcvt.wu.s    gp, ft1, rmm
                  andi         s4, s1, -319
                  auipc        s8, 482527
                  xori         s9, a2, -1701
                  slti         a3, s10, -1357
                  fcvt.wu.s    ra, fs4, rtz
                  fmax.s       ft9, fa3, fs4
                  srli         t2, a1, 26
                  fcvt.w.s     a4, ft3, rtz
                  fsgnjn.s     ft2, fs4, ft6
                  xor          a0, a7, t4
                  sub          zero, t5, s7
                  fmax.s       ft7, fa1, ft10
                  srli         t4, t0, 2
                  fcvt.w.s     t3, fa4
                  mul          a4, s5, a4
                  srai         gp, gp, 14
                  slti         t1, s0, -1210
                  mulhu        t2, t4, sp
                  fle.s        s10, fs7, ft8
                  slti         gp, a6, -730
                  slti         t4, s8, -1708
                  fcvt.s.w     ft3, s3, rdn
                  fcvt.s.w     fa0, gp
                  sltu         gp, s1, t3
                  mul          s9, s7, ra
                  fsub.s       ft8, fa1, fa6, rtz
                  rem          s4, s5, s4
                  nop
                  slti         s10, a7, 1327
                  fle.s        s4, fs8, fa5
                  srai         s4, a3, 1
                  srai         t1, s11, 20
                  nop
                  slt          t4, s4, a7
                  fmv.x.w      t4, ft1
                  fsqrt.s      fs5, fs0, rmm
                  remu         a5, a6, t0
                  add          t3, t2, tp
                  sra          s11, tp, s5
                  sub          a5, t4, s10
                  srai         a3, a2, 31
                  fmul.s       fs8, fs11, fs6, rdn
                  fsgnj.s      fs2, ft5, fa7
                  feq.s        tp, ft10, fs6
                  lui          t1, 361449
                  fsub.s       ft2, fs8, fs9, rne
                  fmv.w.x      fa1, gp
                  add          s6, gp, zero
                  addi         a7, s1, 1610
                  srai         tp, a2, 9
                  fcvt.s.w     fa2, s7, rup
                  fcvt.wu.s    s11, fs10, rup
                  rem          a0, a3, t2
                  addi         t0, gp, -670
                  srl          s6, s7, t2
                  remu         s3, t1, s6
                  fmul.s       ft4, ft2, fs1, rup
                  slt          s11, s7, s2
                  add          s6, s8, a2
                  fsub.s       fs0, fa2, ft10, rdn
                  xor          t6, s1, a4
                  remu         ra, a3, s4
                  sltiu        a2, s0, 398
                  fmv.x.w      tp, fa6
                  srli         s3, sp, 21
                  ori          ra, sp, 72
                  auipc        s8, 210567
                  auipc        a6, 423069
                  sltiu        a4, s6, 233
                  srl          t1, a7, ra
                  xor          s1, zero, s6
                  fmv.w.x      ft0, a1
                  srai         t6, gp, 17
                  xori         s9, s0, 1487
                  ori          s9, zero, 452
                  addi         s10, ra, -386
                  mulhu        s3, a1, t4
                  mulh         s7, a2, s9
                  mulhu        tp, s4, gp
                  rem          s4, s0, s3
                  sll          tp, s2, s6
                  fmv.x.w      s10, fs4
                  divu         t2, a1, tp
                  fle.s        t4, fa2, fs11
                  fsqrt.s      fs2, fs7
                  sll          s11, t3, s5
                  divu         s0, s2, s8
                  add          t2, a4, tp
                  fcvt.s.wu    ft3, s1, rdn
                  lui          a1, 659971
                  slti         t2, a3, -1165
                  nop
                  remu         s7, s0, sp
                  add          zero, a0, a6
                  addi         ra, s0, 590
                  divu         s0, t1, s0
                  fsgnjn.s     ft5, fa4, fs8
                  mulhu        s8, s2, a2
                  fmv.x.w      s1, ft8
                  fmin.s       fs5, fs10, ft9
                  sra          t1, t4, a4
                  auipc        a5, 1014522
                  xor          s9, s9, s4
                  xor          a5, s6, t1
                  or           t1, gp, tp
                  fmin.s       ft6, fa6, ft0
                  fsgnj.s      fa1, ft1, ft2
                  fsgnjx.s     fs10, ft8, fa6
                  mulhu        s6, a5, t3
                  flt.s        tp, fa1, fa1
                  fadd.s       ft10, fs4, ft3, rup
                  fmv.w.x      fs8, tp
                  fdiv.s       fs7, fa7, fs3
                  fsgnjn.s     ft3, fa5, fs8
                  fcvt.wu.s    s9, ft7, rmm
                  srai         t1, s8, 12
                  feq.s        a1, fs9, fs5
                  divu         s9, s2, t0
                  sra          ra, t3, a2
                  auipc        a7, 626471
                  fdiv.s       fa7, fs1, fs10, rdn
                  mulh         tp, s3, a5
                  addi         zero, t6, -853
                  sub          s9, s0, zero
                  sub          t2, ra, ra
                  rem          a0, gp, s8
                  fmul.s       fa6, fs2, fa1
                  fmin.s       fa7, fa2, ft10
                  fsub.s       ft0, ft0, fs11
                  srai         a2, a3, 8
                  slli         t2, tp, 5
                  rem          ra, a1, s5
                  srl          s10, s2, a3
                  add          ra, t6, a4
                  slt          zero, s2, ra
                  div          t6, ra, s1
                  fmv.x.w      t1, fa0
                  sll          s10, s9, s0
                  srli         s10, s0, 18
                  divu         s10, t0, s2
                  xor          a3, s7, zero
                  sltiu        a6, s2, 1294
                  addi         t1, tp, 1733
                  mulhsu       s2, s10, s8
                  fdiv.s       ft4, ft2, fs3, rmm
                  remu         s10, a6, a0
                  xor          tp, t0, t5
                  nop
                  remu         a2, s7, s10
                  xor          a2, a6, ra
                  sub          t0, sp, s7
                  fadd.s       ft8, fa7, fs11, rdn
                  mulh         a1, a4, a1
                  sub          a6, a0, sp
                  fmul.s       fs11, ft7, ft10
                  flt.s        a7, fs11, ft3
                  and          s6, t1, s9
                  addi         ra, t1, 1799
                  fsqrt.s      fa4, fs4
                  sltu         ra, a6, t2
                  mulhsu       a6, s10, a5
                  slti         s9, a7, -596
                  divu         a0, a7, s4
                  mulh         tp, s1, a2
                  sltu         a6, a7, s4
                  addi         s4, s9, 985
                  slti         s9, t0, -224
                  fmv.w.x      fa0, a2
                  nop
                  fmul.s       ft6, ft0, fs11
                  nop
                  fsqrt.s      ft11, ft8
                  xor          t6, s7, gp
                  sra          gp, a1, t0
                  fsub.s       fs2, ft4, ft6
                  fcvt.s.wu    ft8, s10
                  mul          t3, s11, s6
                  mul          t3, a0, sp
                  fcvt.s.wu    fs4, s7
                  remu         a4, t1, a1
                  fadd.s       ft1, fa7, fs0
                  mul          a5, a5, s5
                  lui          a2, 102197
                  mulhsu       s7, s5, s11
                  sll          s4, a5, s9
                  mulhu        s7, t6, a5
                  fmv.x.w      tp, ft5
                  mulhsu       t6, a2, s9
                  fcvt.s.w     fa6, t5
                  fclass.s     a2, ft9
                  addi         zero, a2, -12
                  or           s3, t1, t2
                  fmv.x.w      s7, fa0
                  sll          a0, a7, s7
                  mulhsu       s4, a0, tp
                  fmax.s       fs9, fa7, ft8
                  fsub.s       fs0, fs3, fs4, rtz
                  srai         a0, zero, 28
                  slt          a3, t5, tp
                  fmv.w.x      ft3, s8
                  slt          t0, t4, s0
                  sll          t6, a4, s1
                  feq.s        a6, fa2, ft1
                  sll          t6, s5, t2
                  sll          s9, zero, s5
                  fmv.x.w      s8, ft6
                  mulhu        tp, t1, s1
                  sub          zero, a7, a3
                  ori          t4, s1, 1156
                  ori          a0, s11, 500
                  fmv.w.x      fs11, gp
                  sra          a1, s8, s5
                  and          s2, t5, t2
                  fsgnjx.s     fs0, fs11, fa0
                  lui          ra, 26275
                  mulhu        s8, s2, t4
                  div          a3, s2, t3
                  sltiu        a4, t4, 1873
                  fle.s        s0, fs9, fs8
                  srai         t1, s4, 27
                  fsqrt.s      fs6, fs10
                  sltiu        s1, zero, 1483
                  xor          s4, a5, t5
                  flt.s        s6, fs3, ft11
                  xori         t4, t4, 1409
                  slli         s0, s8, 16
                  addi         s9, t2, 623
                  sll          t3, s0, s5
                  auipc        a2, 699864
                  fsgnj.s      fs10, ft4, fs9
                  fdiv.s       fs9, ft2, ft7, rup
                  fmul.s       fs5, ft4, fa0, rne
                  nop
                  fcvt.s.w     fs4, s6
                  fcvt.wu.s    a3, fs2
                  nop
                  xor          s9, ra, s5
                  xor          s0, t4, t3
                  slti         t1, s8, -842
                  andi         t6, t0, -702
                  remu         s1, t1, a1
                  fmax.s       ft10, ft1, ft4
                  srli         t2, t1, 31
                  fmax.s       ft4, ft2, ft10
                  slt          s8, s3, t3
                  fcvt.s.wu    fa5, s1
                  rem          a3, a5, s11
                  mulh         a7, a7, t4
                  sltiu        a1, a7, -295
                  fmin.s       fs10, fa4, fs10
                  sltiu        a6, t6, -381
                  mulh         a4, tp, s11
                  fcvt.wu.s    a3, ft5, rne
                  fadd.s       fs9, fa0, fs9, rdn
                  fmv.x.w      t0, ft5
                  mulhu        s11, t0, s4
                  fsqrt.s      fs6, fa1, rtz
                  fcvt.s.w     fa4, t6, rmm
                  slt          a5, s2, s0
                  sub          a6, s5, s10
                  rem          a2, s3, s4
                  srai         s1, a1, 17
                  xor          a2, s10, s11
                  fsgnjn.s     fa6, fs11, fs10
                  fcvt.s.w     ft4, s7, rne
                  addi         s3, gp, 1784
                  sub          t3, s8, s1
                  fmax.s       ft6, fs11, ft2
                  srai         tp, t3, 19
                  fdiv.s       ft3, ft7, ft6, rne
                  fcvt.s.wu    fs8, a3, rmm
                  sltu         s10, t2, tp
                  sll          s3, s4, s10
                  fadd.s       fa4, fa3, ft3, rup
                  fsgnjn.s     fa7, ft6, fs5
                  fmul.s       ft4, fs3, fs3, rne
                  rem          a0, s9, s0
                  slli         s3, t5, 15
                  auipc        s4, 400893
                  fsgnjx.s     fs8, fa4, fa0
                  flt.s        t1, fa5, fs0
                  fsgnjn.s     ft5, fa3, ft1
                  fmin.s       fa1, ft11, fs4
                  fadd.s       ft9, ft0, ft4
                  andi         t1, t2, -366
                  slti         s0, a7, -309
                  and          a7, ra, t3
                  nop
                  fcvt.wu.s    t3, ft11, rtz
                  srl          a0, t5, s1
                  fsub.s       fa1, fs1, ft3, rne
                  fle.s        s9, fs3, fs8
                  flt.s        t6, fa4, fa0
                  srli         a2, s6, 24
                  fmul.s       fa0, fa2, fs6, rmm
                  srli         s7, s6, 17
                  fmv.w.x      fa4, a4
                  mulh         t2, s1, t3
                  flt.s        s2, ft4, ft0
                  srai         s6, a0, 10
                  fadd.s       fa5, fs6, fs10
                  fmin.s       ft2, fs9, fs6
                  fmv.w.x      ft3, s9
                  fclass.s     s9, fa6
                  and          ra, s6, a0
                  rem          a5, t3, s9
                  auipc        s0, 923134
                  nop
                  fcvt.wu.s    s6, fa4, rup
                  fmax.s       fa4, fs0, fa6
                  remu         s2, a6, t2
                  rem          zero, a7, sp
                  fmax.s       ft8, fs0, fa3
                  fsqrt.s      fs8, fs0, rdn
                  sltu         a5, gp, s6
                  fmv.w.x      fs3, a3
                  srl          t2, s7, zero
                  fmv.x.w      s3, fs9
                  fle.s        ra, fs4, ft9
                  fadd.s       fs10, fs8, fs10
                  xori         s1, t2, 980
                  remu         s6, a1, s9
                  fsgnjn.s     fs1, fa2, ft1
                  nop
                  fsgnj.s      ft9, ft2, fs9
                  fmin.s       fs10, ft2, ft5
                  fsqrt.s      ft1, fs7
                  srl          s10, t1, t3
                  div          s11, a3, a5
                  fadd.s       ft6, fa4, ft1, rdn
                  mulhsu       a5, a0, s9
                  fclass.s     a1, ft8
                  fmax.s       ft1, ft9, ft11
                  fcvt.wu.s    a2, fs0, rup
                  fcvt.s.w     fs3, a7, rup
                  fmv.w.x      fa3, a3
                  sll          s0, s7, s11
                  sll          s6, a6, s6
                  fmax.s       fs10, fs7, fa7
                  fcvt.w.s     a2, ft2, rmm
                  andi         s1, t0, 2042
                  fle.s        s8, fs3, fa1
                  sltu         gp, s6, sp
                  fsqrt.s      fs8, fa1, rtz
                  lui          s11, 390556
                  fcvt.wu.s    t0, ft10
                  sra          a1, a3, s3
                  add          s4, s9, s2
                  fsgnjx.s     fs10, ft0, ft5
                  flt.s        gp, fs4, ft5
                  feq.s        a4, ft7, ft6
                  lui          s6, 597614
                  addi         s7, s9, 601
                  ori          s10, t5, 1040
                  fle.s        ra, ft8, ft8
                  sll          a1, a1, s11
                  sltiu        s6, t0, 1767
                  xor          t3, t2, s6
                  fmax.s       fs5, ft2, fs4
                  srai         s1, t0, 31
                  slt          a2, t3, a6
                  mulhu        a6, t5, a3
                  slti         a3, s0, -1515
                  feq.s        t2, ft10, fa5
                  feq.s        t6, fs1, fa4
                  flt.s        a3, fs0, ft6
                  fmin.s       ft0, fs2, ft11
                  lui          a3, 255211
                  fmul.s       fs10, fs2, fa2
                  xori         zero, s2, -1100
                  srai         s8, ra, 10
                  or           t3, s0, s7
                  and          a0, s10, ra
                  lui          t6, 34866
                  auipc        zero, 670770
                  sltu         s3, s10, s0
                  fmv.w.x      fs10, s4
                  andi         tp, a2, 1202
                  feq.s        t0, fs8, ft3
                  remu         s2, a6, t0
                  add          s11, a6, a7
                  fmin.s       fs11, ft3, fs10
                  fadd.s       fs0, fs6, ft5
                  fadd.s       fs6, ft4, fs2
                  addi         a5, gp, -212
                  xori         s6, s6, -1133
                  divu         a2, a4, a6
                  mulh         gp, zero, sp
                  sltiu        a0, ra, -426
                  sltu         t2, s3, sp
                  fmv.x.w      a0, ft10
                  sub          a6, s1, s9
                  or           t0, s2, a0
                  sltiu        a1, t4, 675
                  fsqrt.s      fs8, fa2
                  fcvt.wu.s    t6, fs7, rup
                  ori          s11, gp, 1817
                  sra          a1, s1, zero
                  mulh         zero, a4, a3
                  sll          t3, s10, a1
                  nop
                  addi         a5, t6, 2040
                  fmv.x.w      t6, fs5
                  fsgnjx.s     ft10, ft4, fs1
                  fle.s        a4, fs5, ft11
                  ori          t0, sp, 1053
                  srai         s9, ra, 14
                  mulhsu       t3, s1, a3
                  div          a2, s1, t5
                  fsub.s       ft10, ft1, ft2, rmm
                  slli         s2, a3, 18
                  and          ra, t5, s10
                  mulh         zero, a4, a4
                  fle.s        gp, fa2, fa3
                  fadd.s       fs3, fa7, fs9
                  xori         t3, a1, -13
                  srl          a7, s2, a0
                  fcvt.w.s     s11, fs9
                  fmul.s       fa4, fa3, fs11, rup
                  fclass.s     a4, fs11
                  fclass.s     s3, fs6
                  or           s0, t5, t5
                  fmax.s       ft7, fa2, ft0
                  sra          a6, t1, zero
                  add          gp, s6, tp
                  xor          a7, gp, a7
                  fsgnjn.s     fs5, ft8, fs7
                  slti         t0, s5, -1514
                  fsgnjx.s     fa0, fs7, fa1
                  fdiv.s       ft7, ft2, fs10
                  nop
                  fdiv.s       fa3, fa4, fs9, rup
                  fcvt.s.w     ft1, a6
                  mulhsu       t2, a1, tp
                  fsgnj.s      ft10, fs2, fs0
                  fsgnjx.s     ft9, ft10, fa0
                  fcvt.w.s     a4, ft9
                  feq.s        ra, fa4, ft6
                  sltiu        a6, ra, 746
                  slti         s0, a6, 494
                  sll          a5, t5, s11
                  mulhsu       s8, a4, t3
                  fadd.s       ft4, fs2, ft10, rne
                  sub          ra, ra, a1
                  add          s4, a4, s8
                  fmul.s       fa6, fs3, fa0
                  fadd.s       fa1, fs10, fa5
                  slli         a0, t3, 10
                  fsgnj.s      fs1, fa5, fs11
                  fsgnjx.s     fs6, ft8, fs5
                  slt          s8, sp, t2
                  sltu         s0, gp, s8
                  sll          s0, s2, s6
                  add          t6, s1, s2
                  fmin.s       ft0, fa7, fs4
                  slti         s3, t4, -1737
                  div          ra, gp, t2
                  or           s7, a1, s9
                  sra          t0, tp, sp
                  mulhu        s10, zero, a0
                  divu         a7, s2, a0
                  ori          a6, a7, 334
                  or           s8, a7, a4
                  fle.s        a1, fs11, ft8
                  ori          a6, t4, 1670
                  slti         t1, a5, -1201
                  lui          s3, 214153
                  fdiv.s       fs8, ft7, fs0, rup
                  andi         a3, t1, 1150
                  add          s8, a0, t5
                  andi         t6, s6, 796
                  mulhu        a3, t1, s3
                  srai         s6, a7, 29
                  sltu         gp, s4, a3
                  fsgnj.s      fa5, fs2, ft10
                  xori         s11, s5, -471
                  nop
                  sub          s7, zero, s6
                  xori         s1, s10, -323
                  addi         s10, tp, 1444
                  fmin.s       fa1, fa0, fa7
                  slt          s0, t0, t6
                  fsub.s       ft10, fs6, ft6
                  lui          gp, 834302
                  fmax.s       fa5, fa7, fs11
                  fmv.x.w      a5, fs3
                  fclass.s     tp, ft7
                  fsgnj.s      fa0, ft2, ft6
                  fcvt.wu.s    s0, fs0, rne
                  remu         t1, s2, t4
                  slli         a4, tp, 28
                  sub          a0, s1, t5
                  divu         a4, gp, s7
                  fmax.s       fa7, fa5, ft0
                  fle.s        gp, fa4, fa5
                  slli         a3, s5, 25
                  mulhsu       s7, s0, a7
                  fadd.s       fs2, ft11, ft10, rup
                  fsgnjn.s     ft5, fs10, ft0
                  lui          s7, 529573
                  mulh         s9, a4, s11
                  mulhu        ra, s5, s10
                  ori          a3, a3, 1457
                  fmv.x.w      a4, fa7
                  fmin.s       ft4, ft2, fa3
                  xori         t4, s9, 722
                  fdiv.s       ft9, fs10, fs0
                  fle.s        t6, ft10, fa4
                  slti         s1, t1, 1277
                  flt.s        s1, fs6, ft8
                  lui          s4, 603744
                  fmv.x.w      a3, fs10
                  fle.s        s6, fa2, ft11
                  srli         ra, s8, 10
                  remu         a2, sp, sp
                  fmul.s       fs1, fa6, fs8
                  fsqrt.s      fs1, ft10, rup
                  fmv.x.w      s2, fs1
                  fle.s        zero, ft1, ft1
                  auipc        a5, 490802
                  fadd.s       fs10, ft4, fs1
                  remu         s4, zero, a5
                  flt.s        t0, fs7, ft5
                  feq.s        a1, fs5, ft7
                  fmax.s       ft5, ft5, fs3
                  slti         t6, s5, 390
                  sltiu        a0, a4, -1423
                  lui          s0, 180211
                  sll          zero, s2, s1
                  fcvt.wu.s    a6, fs7, rdn
                  srai         zero, a2, 31
                  and          a0, s5, s0
                  slti         a5, gp, -1124
                  or           t2, s7, s11
                  mulhsu       a7, s0, a0
                  fsgnj.s      fs0, fs7, fs0
                  ori          a0, sp, -990
                  mulhsu       s4, a4, a6
                  fmv.w.x      fa1, s2
                  fcvt.w.s     t0, ft2, rdn
                  rem          s7, s7, s7
                  add          a5, s1, t4
                  fmul.s       fs3, fa2, fs3
                  fadd.s       fa2, fs9, ft1
                  fmin.s       ft9, ft11, fs0
                  remu         a5, s7, t0
                  xor          tp, t6, sp
                  fmv.x.w      s8, fa0
                  and          s9, a6, t5
                  lui          tp, 89222
                  slt          a6, s2, zero
                  xor          zero, s10, s6
                  srl          t3, a1, t6
                  fmax.s       ft4, fa4, fs3
                  mul          a3, s9, t6
                  xor          a2, t2, s3
                  fle.s        s8, fa5, ft0
                  fsub.s       fa6, fs3, fs3
                  fsgnj.s      fs8, ft0, fa5
                  fsgnj.s      ft11, ft9, fs3
                  fle.s        t2, fs6, ft5
                  feq.s        a6, fs0, fs0
                  slti         t3, s4, -864
                  sub          s1, tp, s5
                  div          a0, gp, t0
                  ori          s10, t2, 135
                  fcvt.s.w     ft1, a4
                  addi         a7, a2, -1252
                  fmin.s       ft9, fs10, fa2
                  fsgnjn.s     ft9, fs10, fs1
                  slli         a3, sp, 20
                  fsub.s       ft3, ft3, fs9, rdn
                  fle.s        s7, fs9, ft1
                  divu         gp, ra, s11
                  mul          s0, gp, s9
                  sra          s0, gp, s6
                  sltiu        t4, a1, -1675
                  lui          a7, 1041086
                  mul          a0, a7, s6
                  xor          t4, a0, s10
                  lui          a5, 202112
                  remu         s3, s1, a4
                  lui          t2, 1023721
                  xori         gp, sp, -2043
                  sub          s9, a5, t1
                  divu         t6, s10, s5
                  remu         s6, s3, a1
                  addi         s4, sp, 283
                  fmul.s       fs2, ft2, fs6, rdn
                  addi         a0, s2, 562
                  sra          s9, ra, s3
                  sll          a0, a6, s2
                  sltiu        t0, s7, -632
                  lui          s6, 131179
                  xor          ra, t4, t5
                  fcvt.wu.s    t3, ft2, rmm
                  fmin.s       fa3, fs5, fa5
                  xor          a2, sp, s6
                  ori          tp, s8, 1832
                  srai         s10, s6, 1
                  nop
                  rem          t4, a6, s2
                  nop
                  slti         s10, s10, -646
                  ori          tp, t5, 726
                  auipc        s11, 180903
                  or           a5, s10, t3
                  xori         a0, a7, 1294
                  fclass.s     t2, fa7
                  nop
                  fsgnj.s      fs5, fa6, fs6
                  mulh         s0, a1, a0
                  fcvt.s.w     ft9, a2, rmm
                  fle.s        t0, fs0, fs4
                  srli         t4, s11, 27
                  fcvt.wu.s    t4, fs3
                  fmv.w.x      ft7, t1
                  fcvt.wu.s    s8, fs4, rmm
                  fle.s        s3, fa0, fa6
                  srl          a5, a5, tp
                  xor          a6, a6, t4
                  lui          a4, 140268
                  sub          a4, s11, a4
                  auipc        a7, 891611
                  xor          a7, a0, s4
                  fdiv.s       fa3, fs9, ft3, rne
                  fsgnjx.s     fa2, fs7, fs6
                  flt.s        s1, ft5, fa6
                  fmin.s       fs7, fs1, ft4
                  mulh         s9, t5, t4
                  fsub.s       fs2, ft8, ft7
                  fsqrt.s      fa4, fa4, rmm
                  fcvt.s.wu    ft6, ra
                  flt.s        s2, ft3, fa1
                  fmul.s       fa0, fa2, fs0, rdn
                  srli         a1, a5, 12
                  fmul.s       ft11, fs11, fa2, rdn
                  feq.s        t0, fs3, fs1
                  fsgnjn.s     ft7, fs0, fs11
                  and          s2, tp, s10
                  fmv.w.x      fa7, t0
                  sll          a5, a2, t6
                  fclass.s     a5, fa4
                  fcvt.wu.s    s7, fs11, rtz
                  fsqrt.s      fs2, fa1, rup
                  addi         a2, a1, 1035
                  nop
                  sub          gp, zero, a4
                  fcvt.w.s     s1, fs3, rdn
                  sll          s0, s5, s5
                  fdiv.s       ft0, fa5, fs9, rdn
                  fsub.s       ft1, fs11, fs1, rdn
                  divu         s6, s1, s10
                  divu         s4, sp, a4
                  xor          s0, t6, zero
                  sra          a5, a3, s5
                  fclass.s     s8, fa6
                  sub          s2, s11, gp
                  auipc        s6, 132510
                  slti         zero, s1, 162
                  slli         a1, s1, 21
                  srl          s10, a5, a2
                  fsgnjn.s     ft3, fs9, fs10
                  xori         a6, s8, -1654
                  fmv.x.w      s0, fa1
                  fle.s        a2, fa4, ft4
                  srai         s4, s10, 20
                  xor          a1, t3, a0
                  fsqrt.s      fs10, ft4, rtz
                  fle.s        ra, ft4, fa3
                  fadd.s       ft0, fs8, ft10, rtz
                  fsub.s       fa0, fs10, fs4, rup
                  fmv.x.w      t6, fa5
                  slt          a5, a1, t0
                  sll          a7, t5, t1
                  fmax.s       ft3, fa1, fs1
                  ori          tp, a7, -446
                  fle.s        a6, fa1, ft10
                  sra          s2, t2, t4
                  andi         ra, s3, -208
                  fsgnj.s      fs8, fs8, fa1
                  xor          s10, gp, s6
                  srl          s0, t0, tp
                  div          s11, s3, s8
                  slti         t6, s11, -1291
                  fcvt.s.wu    fs11, s5, rmm
                  mulh         t4, a4, s11
                  flt.s        s0, ft3, ft10
                  fsub.s       ft5, ft4, ft1, rup
                  fsqrt.s      fa5, ft11
                  mulhsu       t6, a7, s7
                  mulhu        a1, s8, s10
                  sltiu        ra, tp, 239
                  flt.s        s8, ft10, fs7
                  sra          a2, t5, ra
                  lui          s6, 664923
                  fclass.s     a7, fs6
                  fsub.s       fs2, ft0, ft1
                  sltiu        t3, t4, 1690
                  nop
                  sub          tp, s9, s10
                  srai         a3, s6, 18
                  fsgnjx.s     ft7, ft0, fs11
                  slti         zero, t5, 243
                  remu         s8, a0, a4
                  andi         gp, t6, -812
                  or           s3, t1, s4
                  feq.s        s0, ft1, ft1
                  srl          t2, t6, t0
                  xori         ra, t5, -303
                  fmin.s       fs1, fa1, ft6
                  fsgnj.s      fs3, ft1, fa4
                  mulh         s2, a1, ra
                  xor          s0, s1, s8
                  feq.s        a7, fs6, fs0
                  lui          t0, 683812
                  ori          a5, a4, -714
                  divu         a5, a5, t2
                  addi         s2, sp, -1807
                  fmv.x.w      ra, ft10
                  and          s11, t2, a6
                  fcvt.wu.s    a2, fs2
                  fcvt.s.wu    fa0, t4
                  mulhsu       zero, s7, s4
                  fmv.x.w      s2, ft7
                  and          t1, s1, s6
                  srl          s10, ra, zero
                  fcvt.s.wu    ft4, a2
                  sll          s6, s7, gp
                  slt          s0, a7, a2
                  fsgnjx.s     ft4, fa4, fa0
                  xori         zero, sp, 356
                  ori          s1, a3, 1346
                  addi         a5, s1, 1957
                  add          t6, s2, t0
                  feq.s        t2, fs8, fs11
                  mulhu        t3, sp, t0
                  lui          s3, 465968
                  fmv.x.w      a1, fs4
                  fsgnjx.s     ft6, ft4, ft4
                  sltiu        a1, t1, 1323
                  or           a7, a0, s7
                  fmv.w.x      fs4, a1
                  rem          tp, t1, a2
                  fmv.w.x      ft10, gp
                  sub          a7, t4, s8
                  fmax.s       fs4, fs8, fs7
                  flt.s        tp, fs0, fa3
                  auipc        t6, 47407
                  fmv.x.w      a6, ft10
                  fclass.s     s2, fa4
                  fmv.x.w      a7, ft0
                  feq.s        s1, fs0, ft1
                  sll          s9, t6, zero
                  lui          t1, 129810
                  xor          tp, a2, t1
                  div          t1, t3, t2
                  fsqrt.s      fa7, fs7, rmm
                  fle.s        gp, fa1, fs6
                  mulhu        s2, t1, s1
                  xori         s6, a4, -662
                  addi         s10, a5, -1394
                  xor          a5, a3, tp
                  fcvt.s.wu    ft10, tp, rup
                  srli         a5, t4, 7
                  fdiv.s       fs4, ft9, ft3
                  fmul.s       fa1, ft5, fa6, rtz
                  divu         s3, t6, t0
                  fmax.s       fs9, ft7, ft0
                  or           gp, a2, s3
                  rem          tp, s9, s10
                  sll          zero, a3, s8
                  fdiv.s       fs2, fa2, fa2, rne
                  fmv.w.x      fs5, gp
                  xori         gp, s4, 247
                  fsgnjn.s     fs0, fs3, ft2
                  div          s9, tp, t1
                  or           s3, a4, s3
                  mulhu        t0, a4, t1
                  fmv.w.x      ft3, a0
                  or           s10, a5, s3
                  fsqrt.s      fs6, ft11
                  mulhu        s3, t6, s6
                  add          s6, a2, ra
                  div          ra, s2, t1
                  fsgnjn.s     ft9, fs10, fs1
                  feq.s        s2, fs11, fs9
                  srli         s4, a7, 23
                  srai         gp, s7, 13
                  slt          a7, t3, s2
                  and          t3, s6, s1
                  nop
                  mulh         a4, s6, s8
                  fmv.w.x      ft0, s9
                  srl          a0, t3, a6
                  remu         a1, s7, s11
                  slli         s2, s9, 24
                  slli         a2, a0, 19
                  fcvt.s.wu    fs6, s8
                  or           tp, t1, a2
                  fcvt.wu.s    gp, fs1, rtz
                  remu         a6, a5, a2
                  srl          s10, t3, a1
                  fcvt.s.w     ft10, s3
                  sltu         a4, s9, t3
                  add          t4, s1, s4
                  add          s6, zero, s2
                  sra          a2, s0, a1
                  xor          t1, a6, a1
                  mulhu        a5, a7, a0
                  slti         a1, a3, 700
                  xor          a7, t0, t5
                  fmv.x.w      s7, ft8
                  fclass.s     s10, ft8
                  auipc        a5, 355119
                  mulhu        tp, t5, a5
                  fmin.s       fs6, fs11, fs5
                  mulhsu       t6, s9, a1
                  divu         s7, s7, a1
                  nop
                  fsub.s       fa0, fa5, ft9
                  fsgnjx.s     fs0, fs6, ft11
                  fadd.s       fa7, fs7, fa0, rne
                  auipc        s10, 17609
                  andi         a3, s11, -622
                  slli         a6, s2, 0
                  divu         zero, s0, ra
                  srl          t0, s2, s0
                  fmax.s       fa0, ft1, fa7
                  fsgnjx.s     fs10, ft9, fs1
                  sra          t3, s8, s1
                  sltiu        s3, a0, 1336
                  addi         s11, t2, 1395
                  sltiu        t3, s6, -1883
                  fcvt.s.wu    fs10, a6, rtz
                  fmv.x.w      s0, fs6
                  fmv.x.w      s9, fs5
                  or           s4, ra, gp
                  lui          t0, 374618
                  flt.s        s6, fa2, fs6
                  andi         s3, s2, 2001
                  flt.s        s3, fs6, fa0
                  fmul.s       ft11, fs2, ft2
                  or           a0, a4, s3
                  fadd.s       ft7, ft10, ft8, rtz
                  slti         s9, s2, -1145
                  fsgnj.s      ft3, fs5, fs9
                  divu         t2, t5, s2
                  fmv.w.x      fs9, s6
                  divu         a7, zero, s1
                  mul          a7, t2, tp
                  fle.s        s4, fs7, ft6
                  nop
                  fmv.w.x      fs2, s5
                  srl          ra, s0, s11
                  fmv.x.w      s4, fs3
                  mulhu        gp, s2, a5
                  fmin.s       ft9, fs8, fa6
                  mulhu        s9, a3, a3
                  and          a0, s0, s7
                  fle.s        s10, fs6, ft10
                  slt          a0, s9, s1
                  flt.s        gp, fs0, fs8
                  and          a1, t0, s9
                  mulhsu       t1, s9, zero
                  srli         gp, tp, 1
                  mulhsu       s4, s3, s4
                  fclass.s     a4, ft1
                  fmv.w.x      fs1, a4
                  fmv.x.w      a6, fs7
                  nop
                  rem          s0, a2, t3
                  slt          a1, t3, a0
                  fmul.s       ft6, fs8, fs8
                  mulhu        zero, t5, t2
                  xori         s1, s1, -967
                  sltu         a0, s11, t6
                  fsgnj.s      ft4, ft10, ft3
                  fcvt.s.w     fs1, s9
                  fmv.w.x      ft3, sp
                  fle.s        t3, fs2, ft3
                  remu         gp, s0, t0
                  fle.s        s9, fa0, fa4
                  slti         s4, ra, -889
                  fmv.w.x      ft2, t6
                  fmax.s       fs0, fs9, fa5
                  fsgnj.s      ft3, ft0, fs2
                  ori          a4, t4, 1335
                  sra          s4, s7, s6
                  sra          gp, zero, s7
                  srli         a0, tp, 21
                  or           a3, a3, zero
                  add          a5, a6, t5
                  fsgnj.s      fa0, ft11, fs11
                  srli         a4, s3, 1
                  ori          s2, s0, 317
                  fsub.s       ft1, fs7, fs2, rtz
                  mulhsu       zero, s8, t0
                  fmul.s       ft1, ft1, ft8, rmm
                  fsgnj.s      fa2, fa0, fs11
                  flt.s        a7, ft5, fs0
                  auipc        s4, 510539
                  add          a5, s5, t4
                  nop
                  fmv.x.w      a7, ft9
                  srl          s10, t4, a3
                  fsgnjx.s     fs11, fa5, ft2
                  fcvt.s.w     ft10, s11, rne
                  andi         a1, s0, 866
                  and          s10, s10, t4
                  fcvt.s.wu    fs7, t0
                  or           t4, s4, a1
                  fsgnj.s      ft2, ft1, ft8
                  fmv.x.w      s0, fs10
                  fsgnj.s      fa2, ft10, ft1
                  fsgnjx.s     ft7, fs3, fa7
                  fclass.s     a0, fa6
                  mul          tp, t0, s9
                  mulh         a5, a1, a1
                  ori          t0, ra, 1769
                  div          s10, t4, s11
                  fadd.s       fa0, fs2, ft4
                  fcvt.s.w     ft2, a6
                  flt.s        a0, fs2, fa4
                  fsgnjn.s     fs10, fa1, fs6
                  sltiu        ra, ra, -1100
                  remu         t1, s0, a6
                  fmv.w.x      fs7, s1
                  rem          t4, s4, s9
                  fmax.s       ft8, ft7, fs4
                  auipc        ra, 942302
                  srli         a7, s1, 9
                  slli         s9, t5, 17
                  slli         a6, s11, 28
                  srai         a2, s9, 4
                  flt.s        a1, fs10, ft11
                  remu         a7, t2, a5
                  fclass.s     s11, ft9
                  fmul.s       fa3, ft4, fa5, rdn
                  sltiu        t2, s4, 1663
                  sub          a7, s0, ra
                  mulh         s9, tp, a3
                  ori          tp, a7, -687
                  fcvt.wu.s    ra, fs6, rdn
                  srl          s11, s7, s1
                  fmin.s       fs2, fa0, fs2
                  sltiu        t2, s3, -1062
                  slli         s1, s7, 11
                  xor          zero, s4, s11
                  srli         a4, s10, 29
                  srai         s6, s11, 25
                  mulh         a6, t3, s2
                  remu         t4, s10, a1
                  andi         ra, s5, -1625
                  xor          a5, s5, t0
                  fmv.w.x      fa3, a2
                  sra          tp, s3, t2
                  fmin.s       fs9, fa6, fs3
                  fle.s        s11, ft9, ft1
                  srli         a0, t4, 18
                  fsub.s       fa6, ft4, ft11, rmm
                  fmv.w.x      ft8, t5
                  remu         tp, s3, a1
                  srai         a7, s0, 20
                  fmv.x.w      gp, ft1
                  fcvt.w.s     ra, ft4
                  sltu         s4, a7, s11
                  fcvt.s.wu    fs1, a2
                  flt.s        s1, fs3, fa1
                  fcvt.wu.s    s3, fs6, rne
                  and          a4, t4, a7
                  fle.s        s10, ft2, fs10
                  fsgnjx.s     ft5, fs6, ft4
                  remu         a7, s10, t3
                  fmul.s       ft8, fs4, fa3
                  xori         a7, s9, -1058
                  fdiv.s       fs5, ft9, ft5
                  auipc        s1, 349676
                  flt.s        s9, ft3, fa4
                  sll          t6, s2, s7
                  add          t3, s9, a4
                  andi         a4, a4, -1628
                  nop
                  mul          zero, a0, gp
                  slli         t2, s2, 13
                  fsgnj.s      ft4, fs8, fs8
                  mulh         a2, sp, s10
                  addi         s3, t5, 140
                  mulhu        a5, s0, a6
                  fmul.s       fs5, fs7, ft8, rne
                  srli         s3, s6, 14
                  mul          zero, s7, s4
                  sra          a0, t0, s6
                  slt          a0, t4, tp
                  add          t6, a3, a7
                  ori          a6, t6, -1592
                  srai         t3, s5, 0
                  add          t2, a6, s11
                  fmv.w.x      fs10, t2
                  mulhsu       a7, ra, gp
                  remu         s2, a4, t5
                  fadd.s       fa2, fa7, ft8, rmm
                  flt.s        s2, fs11, ft6
                  mul          a0, a5, s5
                  andi         s4, a6, 588
                  slt          tp, ra, s6
                  addi         zero, s0, -1831
                  fmv.w.x      fa0, s9
                  fsqrt.s      fa4, ft3, rup
                  xor          s0, a7, s11
                  fsgnjx.s     fs5, fa7, ft11
                  slli         a2, a7, 12
                  slti         a3, t2, -1785
                  xor          t4, t6, sp
                  slt          s2, s7, s6
                  fcvt.wu.s    a3, ft1, rup
                  slt          t2, a0, sp
                  auipc        a6, 756447
                  mul          s3, t4, s7
                  mulh         t4, a1, s9
                  srli         a1, a1, 16
                  srli         a4, a7, 17
                  slti         s7, s5, -741
                  fmv.x.w      t0, ft5
                  fadd.s       fs9, fs5, fs7, rtz
                  srai         tp, s8, 1
                  add          ra, t6, t0
                  sub          s1, tp, s10
                  sll          s2, s0, s7
                  or           gp, t6, s9
                  ori          t0, s3, -827
                  add          s2, a7, t4
                  mul          t4, s9, a5
                  fsub.s       ft3, ft9, fs6, rne
                  fsgnjx.s     fa0, fs5, ft1
                  slt          ra, t5, a5
                  fdiv.s       ft2, fs8, fs9, rup
                  fle.s        a7, fa1, ft7
                  auipc        a3, 824716
                  fsqrt.s      ft1, ft7, rup
                  fmax.s       fa7, ft4, ft6
                  xor          a2, s11, s7
                  srl          s2, s1, s0
                  nop
                  lui          a1, 554327
                  andi         t6, gp, 102
                  fcvt.s.w     fs5, tp, rne
                  remu         s10, a4, s3
                  fcvt.wu.s    ra, fs2
                  mulhsu       a3, t1, gp
                  flt.s        s0, ft8, fs2
                  fcvt.wu.s    a1, ft8, rdn
                  slt          s7, s8, t4
                  fcvt.w.s     zero, ft10
                  fclass.s     t0, ft3
                  mulhsu       s4, t1, s1
                  fle.s        a2, ft10, fa4
                  auipc        a6, 476572
                  rem          s1, a0, s1
                  srl          s2, s7, s2
                  or           ra, sp, s9
                  andi         zero, t4, 616
                  nop
                  divu         gp, a2, t0
                  fmv.x.w      t4, fa4
                  sll          t3, t6, t0
                  sra          s2, a1, t5
                  mulh         a5, s4, t2
                  srl          s3, a5, a5
                  sub          gp, gp, tp
                  fmin.s       ft9, fs6, fs11
                  fsqrt.s      fa6, fa6
                  rem          s9, s3, s11
                  mul          a5, t6, a0
                  fmv.x.w      t4, fs5
                  mul          t4, t1, s7
                  fclass.s     t4, ft10
                  sra          s1, s10, t5
                  xor          s8, s3, ra
                  fcvt.s.w     ft4, t0, rmm
                  divu         a4, a7, s8
                  mulhu        a3, a3, s6
                  slli         a5, t6, 18
                  fmul.s       ft8, fa4, fs9
                  fsgnjn.s     fa0, ft7, fa1
                  srai         s9, ra, 10
                  add          a1, t2, s8
                  fcvt.wu.s    s2, fs5, rup
                  div          a5, t1, s8
                  fadd.s       fs4, fa1, fs6
                  feq.s        s8, fa2, fs10
                  lui          a6, 964079
                  sll          s2, s5, t0
                  slt          t2, t1, s4
                  srai         s7, zero, 29
                  fclass.s     ra, ft6
                  sra          s11, s4, t4
                  divu         t1, ra, a1
                  fcvt.s.w     ft9, t4
                  mulh         t2, zero, s7
                  or           t6, a2, a4
                  sltiu        t2, s0, 804
                  slt          s11, a4, tp
                  flt.s        t0, fs2, fs4
                  or           s10, s5, t5
                  rem          a0, s0, sp
                  srl          s11, s2, t6
                  fmin.s       fa5, fs9, fs6
                  srli         t3, t5, 27
                  andi         t6, a1, 1116
                  auipc        s3, 43981
                  div          a4, s9, a2
                  sll          s4, t0, s4
                  fcvt.s.w     ft7, t4
                  fsqrt.s      ft8, ft11
                  fcvt.s.w     ft1, t6
                  fdiv.s       fs11, fs3, ft3, rtz
                  sll          s8, s5, t2
                  fdiv.s       ft11, fa4, fa3, rmm
                  xori         s11, t4, 484
                  slli         a4, s5, 7
                  srai         s11, sp, 15
                  fsqrt.s      ft0, fa6
                  fsqrt.s      fa0, fs6, rtz
                  fsqrt.s      fa2, ft5, rtz
                  fcvt.wu.s    a1, fa4, rmm
                  or           s11, a7, s2
                  fmv.x.w      s8, ft3
                  sll          ra, t6, a3
                  fmax.s       ft9, ft6, fs0
                  fmax.s       ft4, fs11, fa4
                  srai         s1, t4, 14
                  fsub.s       fa5, ft7, fa6, rmm
                  fcvt.wu.s    t1, ft4
                  sltu         t0, t0, s0
                  slli         s6, s4, 4
                  fsub.s       fs5, fs10, ft1, rdn
                  srai         s1, s8, 6
                  fadd.s       ft11, ft7, ft8, rmm
                  sltu         tp, zero, gp
                  fsqrt.s      fa6, ft5
                  fmax.s       ft9, fs4, ft4
                  fmul.s       ft2, fs10, fs7
                  xori         a1, t0, 628
                  sra          a1, s2, t1
                  flt.s        s9, fs7, fs9
                  mulhu        s6, t3, s7
                  divu         a7, s11, t2
                  sra          s10, t0, t1
                  sra          zero, s1, t4
                  sub          a1, gp, a2
                  fle.s        a1, fs6, fs10
                  fmv.w.x      fs11, s2
                  feq.s        s10, fs6, fa7
                  fcvt.s.w     fs10, a7, rup
                  fadd.s       fa2, fs9, fs1
                  fmv.w.x      ft11, tp
                  slt          s4, ra, s9
                  fsgnj.s      fs2, fs9, ft3
                  rem          tp, a6, a0
                  fmul.s       fa1, fs6, fa0
                  auipc        s0, 463653
                  nop
                  and          t0, tp, t1
                  sltiu        a0, a3, 227
                  sub          s9, t6, s8
                  fsgnj.s      ft1, fs3, fs4
                  div          a3, a0, t3
                  fsgnjn.s     ft1, fa6, fs5
                  fcvt.s.wu    ft3, s7, rmm
                  xor          tp, zero, t6
                  fsgnjx.s     ft4, fs10, ft2
                  sub          t4, a0, a1
                  sub          s0, s0, a1
                  fsgnjx.s     fs3, fs7, ft4
                  fmv.w.x      ft8, t6
                  fadd.s       fa7, fs11, fs11, rdn
                  xori         a2, s1, 814
                  sll          s8, a3, t2
                  add          a7, s10, s3
                  mulhsu       t2, s1, t0
                  sub          zero, zero, s5
                  and          a5, t1, t6
                  fsgnj.s      fs2, ft1, fa0
                  mulhsu       a0, gp, s9
                  auipc        a7, 577569
                  fsub.s       ft0, ft2, fs7
                  fmv.w.x      ft7, s5
                  fmv.x.w      a7, fs2
                  srli         s8, a1, 26
                  fdiv.s       fa4, ft10, ft0
                  fsub.s       fs4, fs7, fa5, rtz
                  xori         a0, sp, -1909
                  fadd.s       fa2, fs9, fs3, rtz
                  fcvt.w.s     a7, fs9
                  slli         t6, s11, 25
                  remu         t6, a7, s5
                  fcvt.w.s     t3, fs1
                  srai         t2, t4, 20
                  fle.s        t6, fs3, ft10
                  srli         s9, s8, 1
                  nop
                  fsqrt.s      fa5, fs3, rdn
                  feq.s        s8, fs11, ft4
                  sra          s9, tp, s4
                  slti         t4, t1, -752
                  nop
                  sll          a4, ra, s7
                  rem          t2, t1, s3
                  fadd.s       fa6, ft10, fs4
                  fclass.s     a2, ft5
                  nop
                  slti         s0, a6, 1153
                  mulhsu       t4, sp, a1
                  fcvt.s.wu    fs2, zero
                  fcvt.w.s     t4, fs6, rup
                  remu         t0, t0, gp
                  fcvt.s.wu    fa1, zero
                  div          a7, s11, a1
                  div          a2, t1, a2
                  andi         a7, t3, -1814
                  fcvt.wu.s    a2, fs10, rup
                  fle.s        a6, fa3, fs2
                  fcvt.w.s     tp, ft2
                  fcvt.s.w     fa6, s2, rmm
                  fsqrt.s      fs4, fs1
                  remu         tp, gp, ra
                  auipc        s1, 679022
                  andi         s6, a1, 1372
                  div          zero, s0, a1
                  fadd.s       fa4, fs11, fa5, rne
                  slli         s7, ra, 31
                  add          s1, t2, t5
                  fcvt.wu.s    ra, ft1
                  addi         t2, s4, -1036
                  fsgnj.s      ft8, fs5, ft1
                  fcvt.w.s     tp, fa4, rup
                  feq.s        gp, ft9, fs3
                  sll          t4, a5, s1
                  or           zero, t2, zero
                  fclass.s     a4, fs4
                  sll          s7, s4, s5
                  mulh         s3, t3, a7
                  fmul.s       fa0, fs8, fs0
                  or           a5, gp, s1
                  fcvt.w.s     zero, fs9
                  fcvt.s.w     fs4, a5, rup
                  andi         a6, s6, -1541
                  fmax.s       ft1, ft8, fs7
                  sub          t4, t4, s4
                  fmul.s       fa5, ft0, fa4
                  fsgnjn.s     fs0, ft2, ft1
                  mulhu        t1, ra, s7
                  mulhu        t4, s0, ra
                  sub          s1, s0, a0
                  mulh         s11, s4, ra
                  srai         t0, s1, 19
                  sra          s11, s9, zero
                  srai         gp, a3, 12
                  fsgnjx.s     fa6, ft6, ft8
                  flt.s        a1, fs11, ft11
                  divu         t4, t0, s8
                  fcvt.s.w     fs11, s9, rmm
                  slti         a3, tp, -1562
                  fmul.s       ft11, ft1, ft6, rup
                  fcvt.w.s     a3, fa4
                  andi         s3, t4, -361
                  fmv.x.w      a7, fs9
                  srli         s6, ra, 24
                  remu         a4, t5, s6
                  div          a4, s6, t2
                  fcvt.s.w     ft8, s9, rne
                  fclass.s     gp, fs7
                  addi         a5, zero, 1524
                  div          a0, s9, s11
                  fcvt.w.s     t3, fs0
                  fmax.s       fs3, fs10, fa4
                  mulh         s1, s6, s2
                  fadd.s       fa1, fa0, fs4
                  fcvt.s.wu    fs9, t3
                  fsgnj.s      fs10, fs0, ft2
                  fsgnj.s      fa4, fs5, ft11
                  mulhu        t4, gp, t1
                  lui          gp, 805418
                  fmax.s       ft9, fs5, ft4
                  slti         zero, a1, 1887
                  flt.s        s7, fa6, fs3
                  fsqrt.s      fs11, ft3
                  sltu         t0, ra, a5
                  and          t6, s8, t6
                  xori         s4, tp, -226
                  fcvt.w.s     t6, ft5
                  xor          s4, a1, s1
                  fmin.s       fa7, fs1, fs6
                  fle.s        a0, fa7, fs7
                  add          a2, s11, a1
                  mulhsu       a7, sp, t6
                  fmv.x.w      gp, fa4
                  or           s11, a7, s0
                  mul          a4, s6, t0
                  sub          a1, s9, gp
                  addi         s9, s7, 1093
                  fsgnj.s      fa6, ft3, fa7
                  remu         zero, t3, sp
                  sub          a3, s3, a0
                  mulhu        t1, t1, zero
                  fcvt.wu.s    t6, fs10, rne
                  slt          a3, gp, a0
                  lui          a2, 116673
                  fsub.s       fa6, ft9, fs3
                  fsgnjx.s     fs7, ft4, fa3
                  fmax.s       ft4, fa7, fs2
                  fdiv.s       ft2, fs5, fa4
                  andi         a4, s11, 728
                  fmul.s       fa5, fa4, fa6, rmm
                  div          s11, sp, s1
                  add          tp, t5, s11
                  fsub.s       fa3, fs6, ft5, rup
                  srai         a6, s11, 16
                  fmax.s       fs11, fa2, fs4
                  sltiu        s10, a2, 1573
                  mul          s8, s8, s11
                  fcvt.s.w     ft9, s0, rmm
                  fclass.s     s10, fs9
                  add          a0, a3, zero
                  fmin.s       fs8, fs8, fs10
                  srai         s8, t1, 16
                  fdiv.s       fs2, ft6, ft11, rmm
                  fsgnjn.s     ft9, ft1, fs8
                  fcvt.s.wu    ft1, s0, rmm
                  slt          s11, t4, tp
                  fadd.s       fs1, fa6, fs4, rup
                  and          t2, s0, a0
                  sub          s9, a3, s10
                  add          t0, a5, s5
                  remu         gp, zero, s8
                  fsgnjx.s     fs2, fs1, fa3
                  slti         a2, t0, 1666
                  divu         s2, t5, t2
                  xor          a6, a3, t0
                  slti         a6, s10, 1922
                  fsgnj.s      ft7, fa4, fs10
                  xori         t3, sp, 1141
                  xori         a5, s5, 1549
                  slti         t1, zero, -1787
                  mulhsu       s4, ra, ra
                  sltiu        s1, s6, 1043
                  fcvt.w.s     a5, ft5
                  fcvt.s.wu    fs8, t4, rdn
                  fsgnjn.s     fs2, ft9, fs3
                  fmin.s       ft9, fs7, fs3
                  sll          t0, t4, s8
                  fcvt.w.s     a5, fs6, rdn
                  fcvt.s.w     fs7, t0
                  addi         a4, s0, -812
                  fsgnjn.s     fa3, fs11, ft9
                  fcvt.w.s     tp, fs8, rup
                  fsgnjx.s     fs11, ft8, ft9
                  fdiv.s       ft1, ft10, fs4, rdn
                  feq.s        a5, fs8, fs6
                  div          s1, s11, s10
                  fcvt.wu.s    s8, ft9
                  sra          s6, a2, t0
                  srai         a2, a5, 11
                  fclass.s     zero, fs2
                  and          tp, a0, tp
                  sll          s8, s8, zero
                  div          t4, a0, s0
                  fsgnj.s      fs5, fa3, fs7
                  slti         tp, zero, -804
                  nop
                  srli         zero, s0, 2
                  fsqrt.s      fs8, fs5
                  rem          t2, s8, a4
                  fcvt.s.wu    ft11, a0, rup
                  nop
                  addi         s4, t2, -637
                  or           gp, t4, gp
                  remu         s3, a1, t2
                  xori         ra, a0, 1651
                  flt.s        a0, fs8, fs9
                  fadd.s       ft6, fs0, ft7, rmm
                  srli         a1, a1, 3
                  flt.s        s11, fa3, ft10
                  ori          s0, a6, -1889
                  fsgnjn.s     ft3, ft3, fs10
                  nop
                  rem          tp, t2, s5
                  slt          t4, a4, a2
                  srli         a4, t1, 1
                  fsgnjn.s     fs4, ft9, ft9
                  fsqrt.s      ft7, fa4
                  sra          t1, s3, s11
                  slli         a5, t1, 30
                  mulhu        a6, s9, s9
                  mul          a5, s6, t3
                  fsgnj.s      fa2, fs11, fa5
                  fsgnjn.s     ft0, fa2, fa0
                  sub          zero, a0, a3
                  fclass.s     gp, ft6
                  remu         t3, t5, s9
                  remu         s6, gp, gp
                  xor          s7, s1, t2
                  and          s6, t2, t4
                  divu         a0, ra, s11
                  feq.s        s9, ft8, ft10
                  mulhu        s11, sp, s2
                  or           s8, s9, a5
                  fle.s        ra, fs6, fs0
                  andi         a5, t5, -1610
                  slli         s0, a2, 18
                  sltiu        a6, a3, -728
                  andi         s6, tp, -1348
                  slti         a3, a1, -1030
                  lui          s7, 439750
                  sub          s3, s9, a2
                  mulh         s1, ra, t1
                  mulhu        s0, a0, sp
                  fmul.s       fs11, ft2, ft11, rtz
                  fsqrt.s      fa5, fa0, rup
                  sltu         a3, a1, t3
                  fadd.s       fa0, fs0, fs6, rmm
                  andi         s7, t2, 765
                  fle.s        tp, fs6, ft8
                  mul          s4, s9, s2
                  or           a7, s1, t6
                  srl          a1, s9, a4
                  mulh         gp, a0, s7
                  nop
                  fmv.w.x      fa3, t3
                  fcvt.wu.s    a6, fs5, rdn
                  sltiu        s10, gp, -543
                  sltu         s11, a4, t3
                  fsgnj.s      ft7, fs5, fs10
                  fmv.w.x      ft1, a6
                  flt.s        a2, fs2, ft4
                  fmin.s       fa2, fa7, fs3
                  srl          zero, a1, t0
                  fmin.s       ft10, fa0, ft7
                  srai         s0, s6, 17
                  sub          s10, t0, s6
                  sra          t4, a5, t0
                  add          a6, tp, s8
                  divu         a6, s5, a6
                  srai         t2, s0, 11
                  fsub.s       ft7, fs1, fa0
                  mulhsu       a0, a0, a3
                  xori         s3, s4, 597
                  xori         t6, a2, 141
                  fsgnjn.s     fs0, fs0, ft9
                  fmin.s       fs1, fa7, ft0
                  slti         s9, gp, -595
                  fmul.s       ft5, ft11, ft11, rmm
                  sll          s11, zero, t0
                  div          t6, s10, tp
                  fcvt.wu.s    zero, fs10, rne
                  fdiv.s       fs9, fa5, fs0
                  fmv.x.w      t3, fs6
                  mulhu        a4, s10, s7
                  mul          a7, a3, a2
                  srl          s3, a1, s7
                  srli         a6, t0, 3
                  slli         a2, zero, 13
                  xor          a4, t6, s4
                  rem          s0, a2, t3
                  fmv.w.x      fa4, a7
                  xor          s3, s1, s1
                  and          s3, zero, s0
                  srl          a1, s0, s2
                  sll          t2, s3, a0
                  fmul.s       ft0, ft2, fa5, rup
                  auipc        a6, 986991
                  slt          s8, s9, t1
                  srl          a5, t0, ra
                  sltu         s2, sp, a3
                  mulh         t2, s1, t4
                  mulhu        s1, t3, t1
                  fmin.s       fs2, ft7, fa7
                  addi         s4, t3, 883
                  fmul.s       fs2, ft5, fs6, rmm
                  xori         s2, t3, -2040
                  fclass.s     t4, ft4
                  slt          s8, s6, s3
                  xor          t1, t1, a7
                  and          s7, t0, a3
                  fmv.x.w      a2, ft7
                  flt.s        a4, fs5, fs5
                  slt          s7, sp, t3
                  srli         t4, t5, 26
                  sltu         s6, s5, sp
                  addi         a6, a3, 566
                  addi         s11, gp, -1213
                  fle.s        t0, fs2, fs11
                  fmax.s       fa2, fs3, ft4
                  or           s0, s9, a2
                  fsgnj.s      ft6, fa7, ft4
                  srai         s9, gp, 6
                  sltiu        s6, s5, 561
                  fsgnj.s      fs4, ft5, ft3
                  rem          s0, t2, t1
                  fmin.s       fa4, fa4, ft0
                  slli         tp, s1, 25
                  fcvt.wu.s    t3, fa2, rmm
                  rem          t0, t2, a5
                  fdiv.s       fa3, ft11, ft11
                  lui          s9, 231077
                  fsgnjx.s     fs1, fs1, fs5
                  sltu         s7, s4, sp
                  fmv.x.w      t2, fa7
                  fmv.x.w      a7, fs0
                  div          a5, a1, t6
                  srli         tp, s2, 20
                  andi         a2, sp, 528
                  add          a2, a3, a7
                  fmv.w.x      fs3, t1
                  slli         a1, t3, 30
                  fcvt.s.w     fa1, zero, rmm
                  sltu         tp, s2, gp
                  fmv.x.w      s6, fs4
                  srl          s0, s5, a7
                  mul          s2, a6, gp
                  mulhsu       s11, a0, s6
                  srli         t6, a7, 31
                  remu         s4, t4, t6
                  flt.s        tp, fs6, fa6
                  or           a7, t0, gp
                  auipc        t3, 489408
                  fsgnj.s      fa2, fs5, fs11
                  fclass.s     t0, fa1
                  flt.s        zero, fa5, fa0
                  mulhsu       a2, t6, a0
                  fcvt.wu.s    s11, ft2
                  xor          a3, a0, s7
                  fsgnj.s      fs7, fs4, fa4
                  div          ra, s0, s1
                  fcvt.s.wu    fs10, s3, rdn
                  remu         a1, s10, gp
                  lui          a5, 140559
                  fsqrt.s      fs9, ft2, rtz
                  xor          s2, s3, sp
                  addi         s2, sp, 521
                  mul          s3, a2, s9
                  sltu         gp, s5, s6
                  mulhsu       t3, t2, ra
                  div          tp, s5, s7
                  mulhsu       t0, t5, s7
                  fmv.w.x      fa5, gp
                  fsgnjn.s     fa3, fa0, ft10
                  mul          a5, a4, t1
                  add          a1, t0, s9
                  ori          s2, s6, 66
                  lui          s10, 296334
                  andi         gp, s7, 1893
                  nop
                  xori         s11, s3, 823
                  mulh         a3, a2, s11
                  mulhsu       s10, t2, zero
                  srli         t2, s2, 26
                  slt          a5, t1, t0
                  fsgnjn.s     ft0, fs6, fa2
                  sll          a5, t3, a7
                  fmul.s       fs11, ft0, ft4
                  fmv.w.x      ft3, tp
                  fcvt.s.w     fs0, t1, rtz
                  fsgnjx.s     fs10, fs3, fs8
                  auipc        t4, 172742
                  srli         a4, a1, 30
                  nop
                  flt.s        gp, fs4, fs7
                  sltiu        t1, s1, -2007
                  srai         s8, s3, 7
                  fdiv.s       fa6, fs6, fa5
                  fmax.s       fs7, fs1, ft11
                  fsub.s       ft10, fs5, ft10, rtz
                  divu         t0, a2, t6
                  flt.s        ra, fs9, ft4
                  andi         s2, t1, 2016
                  fcvt.s.w     ft5, s7
                  sub          a4, tp, a5
                  rem          t2, ra, t1
                  slli         s3, s6, 20
                  mulh         s6, s4, a6
                  xori         a7, s7, -2037
                  and          s4, t1, t1
                  sub          t0, a6, zero
                  mul          a7, a1, t0
                  lui          t1, 406953
                  fmv.x.w      ra, ft11
                  andi         zero, zero, 387
                  ori          t0, t4, 1735
                  xori         t0, s5, 476
                  remu         s0, t5, s11
                  lui          a7, 536017
                  fsgnjx.s     ft8, fs3, fa4
                  fmin.s       ft0, fa0, ft5
                  fcvt.s.w     fs6, s3
                  xori         a7, tp, -1408
                  slti         t6, t1, 1369
                  srl          a3, a6, a1
                  lui          t2, 880518
                  xori         s11, a7, -1688
                  sltu         zero, t4, s1
                  remu         s8, s7, t0
                  fcvt.wu.s    tp, fs11
                  xori         t1, s9, 2000
                  sll          a5, s3, s1
                  addi         a6, s7, -573
                  nop
                  srl          a7, a3, s3
                  xor          a2, a3, t3
                  sub          a2, s0, a4
                  rem          a0, s10, t4
                  andi         s11, t5, -1575
                  fmv.w.x      fa4, a3
                  fmv.w.x      fa6, t6
                  sltiu        t3, t5, -75
                  fsgnjx.s     ft11, ft1, ft5
                  nop
                  ori          t1, a0, 1693
                  slt          s4, t6, a1
                  fcvt.s.wu    fs3, s1
                  and          t2, t1, s8
                  fmax.s       fa2, ft5, ft6
                  mulhu        t6, a6, s7
                  fdiv.s       ft7, ft11, fa5
                  fmax.s       ft10, fs5, ft9
                  sll          a3, t1, t2
                  nop
                  lui          s10, 818942
                  sll          s10, t3, a3
                  divu         s1, a6, zero
                  fsub.s       fa1, ft9, fs5, rtz
                  fcvt.w.s     t2, fa1
                  andi         a5, s0, -1490
                  feq.s        a1, ft7, fs5
                  mulhu        a2, s9, t3
                  auipc        a0, 286025
                  xori         s6, a7, -294
                  auipc        t1, 49309
                  feq.s        t2, fs10, ft5
                  srl          zero, zero, a1
                  fmin.s       ft3, ft1, ft1
                  auipc        t4, 362029
                  rem          a7, a1, a1
                  srli         zero, t4, 25
                  remu         s4, t0, s0
                  addi         s4, a5, -96
                  feq.s        t2, fs6, fs4
                  slt          s9, t6, s6
                  fcvt.s.wu    ft8, a6
                  slli         s2, s0, 2
                  fclass.s     t0, ft8
                  flt.s        a2, fs10, fa4
                  xori         a1, s4, -1762
                  and          s0, tp, s11
                  fsub.s       ft4, ft0, fs0, rup
                  fcvt.s.w     fa6, t2, rmm
                  xori         t4, t4, 580
                  fsgnjx.s     fs8, fa2, ft4
                  fadd.s       fs9, fa7, fs8
                  fmv.x.w      t6, fa0
                  fadd.s       ft2, ft3, ft10, rmm
                  auipc        a7, 78173
                  lui          t1, 848341
                  fcvt.s.w     fs11, s8, rmm
                  addi         s7, t3, 675
                  sltiu        s7, a2, -873
                  sra          s2, ra, gp
                  fsqrt.s      fa0, ft10, rup
                  srl          t1, t5, s1
                  ori          a6, t3, -195
                  fle.s        gp, ft11, fs6
                  fcvt.w.s     s0, ft0, rdn
                  sub          a7, s0, s8
                  fclass.s     a5, fs9
                  ori          t3, a3, -1300
                  sltu         s8, s0, a0
                  lui          t1, 33347
                  fmv.w.x      ft6, t5
                  xori         s9, a7, -998
                  andi         a6, a2, -1790
                  slli         t3, s10, 16
                  fle.s        s3, fs5, fs3
                  slli         s6, t5, 25
                  sltiu        a4, s8, 420
                  addi         s9, s9, 1390
                  add          s0, a3, s0
                  remu         t3, gp, t2
                  and          s4, s4, s8
                  lui          t4, 381320
                  srl          a7, s7, a2
                  fclass.s     s11, fs2
                  fsgnj.s      fa1, fs8, fa5
                  slti         a6, s9, 937
                  fsub.s       fa2, fs0, fa6
                  mulhu        s0, s10, ra
                  fadd.s       ft5, ft3, fa3, rtz
                  sub          s0, s7, a2
                  add          s11, a3, s4
                  fclass.s     t3, ft4
                  divu         a3, s10, a4
                  flt.s        s0, fa5, fs0
                  nop
                  fsgnjn.s     ft8, fs5, ft5
                  mulhu        s0, a2, a5
                  fsgnj.s      fs6, ft9, fa2
                  fmax.s       fa7, ft7, ft5
                  fcvt.s.wu    fs4, a1
                  sltu         a3, s1, a3
                  srai         a0, t2, 23
                  rem          a0, ra, a1
                  mul          s7, s10, s10
                  flt.s        s0, fs7, ft11
                  fsgnjx.s     fa2, fs3, fs9
                  slti         t6, s0, 504
                  fcvt.wu.s    a6, fa2, rne
                  remu         t4, tp, ra
                  lui          a4, 923938
                  fcvt.w.s     ra, ft6, rdn
                  fmv.w.x      fa4, a4
                  andi         s9, s4, -1824
                  fcvt.s.wu    fs9, sp
                  srai         s9, tp, 27
                  remu         s10, a7, t5
                  fsgnj.s      ft5, fs7, fs4
                  div          t1, t4, s6
                  fmin.s       fs0, fs1, ft5
                  fadd.s       fs0, fs7, fs9, rne
                  fsqrt.s      ft3, ft4
                  fcvt.s.wu    ft4, s10
                  fmax.s       fa4, fs2, fs9
                  fadd.s       fs3, ft0, fs2, rdn
                  slli         t6, t6, 29
                  fadd.s       ft11, ft3, fa5, rup
                  auipc        t2, 730842
                  fmax.s       ft6, fs6, ft9
                  andi         t2, gp, -447
                  mulh         s3, t1, sp
                  fsgnj.s      fa5, fs6, ft4
                  sltiu        s7, a2, 204
                  rem          a3, s11, t4
                  addi         tp, s7, -179
                  and          ra, s8, t5
                  fle.s        s0, ft5, fs1
                  nop
                  remu         s0, ra, gp
                  fmul.s       ft6, fs6, fa5
                  feq.s        t4, ft9, fs10
                  feq.s        a7, fs0, ft7
                  fmul.s       ft9, fa3, fs3, rtz
                  div          a7, s4, s3
                  fclass.s     t1, fa0
                  flt.s        a0, ft6, fa1
                  remu         s10, s6, s9
                  fdiv.s       fs5, fs1, fs2, rmm
                  sra          a0, a4, s11
                  slt          s11, zero, a4
                  slti         s1, s2, -1289
                  sub          s0, t2, a6
                  fmax.s       ft9, ft3, fs3
                  flt.s        zero, fs7, ft5
                  srli         a5, a6, 18
                  add          s9, s2, s7
                  slli         gp, a3, 20
                  fle.s        t1, fa6, ft8
                  or           s6, a6, zero
                  fmv.w.x      ft8, s3
                  slt          s2, s5, a7
                  andi         s9, s8, -1632
                  auipc        s2, 547594
                  andi         s4, s5, -35
                  auipc        s6, 659520
                  fsgnjn.s     fs5, ft0, fs7
                  fdiv.s       fs0, fa1, fs2, rne
                  mulh         gp, s10, a6
                  fcvt.s.w     ft5, a7, rmm
                  fadd.s       fa2, fs3, ft1, rmm
                  nop
                  fle.s        s4, fs6, fs0
                  and          s3, t2, s5
                  srli         a1, a0, 13
                  auipc        a5, 961986
                  nop
                  fmin.s       fs0, fs1, fs10
                  fsub.s       ft8, ft2, fs4, rmm
                  auipc        t4, 811184
                  addi         gp, t4, 1942
                  xori         gp, t1, -1618
                  fadd.s       ft0, fs10, ft10, rne
                  slt          tp, t4, t5
                  lui          t6, 847978
                  addi         t2, s1, -1179
                  mulhsu       a1, s6, s10
                  srl          a5, t6, s6
                  fcvt.s.w     ft4, t2
                  flt.s        t6, fs8, fs2
                  fcvt.s.wu    ft2, s1, rdn
                  sra          a1, s11, s2
                  mulhu        t6, ra, a7
                  fmv.w.x      fa6, a1
                  fmv.w.x      ft11, s2
                  fle.s        t2, fa1, fa1
                  nop
                  mul          t0, s2, s6
                  fle.s        tp, fa7, fs6
                  xor          a3, t4, a7
                  fadd.s       fs3, ft7, ft6
                  and          a7, s10, s5
                  fcvt.wu.s    t1, ft6, rne
                  flt.s        a1, fs3, fs5
                  srli         t6, t5, 9
                  divu         ra, a2, s4
                  mulhsu       a3, t6, a3
                  fadd.s       fs7, fa7, fa0, rtz
                  addi         s1, gp, -434
                  fle.s        ra, fs10, ft2
                  auipc        a2, 511347
                  sub          s10, a1, s5
                  srai         a3, a0, 0
                  srl          s0, s7, t0
                  mulh         s3, s0, s11
                  fcvt.s.w     fs1, a7, rne
                  fdiv.s       fa5, fs6, ft10, rne
                  fcvt.w.s     a2, ft3, rmm
                  lui          s0, 64733
                  sll          a0, s10, t1
                  addi         s0, a2, -1709
                  fdiv.s       ft6, fs6, ft0, rne
                  fclass.s     s8, ft6
                  srli         t3, t1, 6
                  fmin.s       ft7, ft9, fs0
                  xori         a5, a7, -1030
                  fmin.s       fa2, fs3, fs2
                  rem          a3, a0, s4
                  fmv.x.w      a0, ft11
                  fdiv.s       fs0, fs4, fs5, rtz
                  fmin.s       fs0, fs11, fs4
                  srli         s1, t5, 21
                  auipc        s8, 944911
                  fdiv.s       fs10, ft1, fa7, rne
                  fclass.s     zero, fs6
                  fsgnj.s      fa3, fa7, fs7
                  and          a4, t4, s8
                  mul          t2, a1, a5
                  add          a3, t4, t4
                  andi         t4, s2, -364
                  andi         a5, t2, -1372
                  fadd.s       fs7, ft6, fs2, rup
                  fmax.s       fs2, ft9, fa5
                  sub          t6, a4, s6
                  auipc        t6, 589275
                  mulh         t6, zero, t0
                  sll          a2, a1, s6
                  srli         a5, t6, 2
                  fsub.s       fs9, fs3, fs0, rdn
                  srai         s11, s6, 9
                  and          tp, s1, a5
                  and          t4, tp, a0
                  fsub.s       ft3, fs8, fa2
                  mulh         t4, t0, s1
                  fcvt.s.wu    fa3, t1
                  sltu         s9, a7, a5
                  fdiv.s       ft9, ft10, fa7
                  slli         tp, s6, 9
                  fsgnjx.s     ft3, fa5, fs1
                  srl          s3, a5, s6
                  and          s2, s10, t3
                  sra          t6, s7, a5
                  slli         a5, a7, 17
                  fclass.s     a7, fs3
                  fmul.s       fa2, ft9, fs5
                  fmax.s       fs10, fs4, ft6
                  fsgnj.s      fa5, fa1, fs1
                  andi         s2, a0, 1419
                  fclass.s     zero, fs10
                  fsqrt.s      ft1, ft9
                  fcvt.s.wu    fs3, zero
                  mulhsu       zero, s6, s6
                  sra          s11, s11, gp
                  rem          s8, a1, tp
                  addi         a7, s7, -1958
                  mul          s8, gp, tp
                  mul          s0, t1, s10
                  fsgnjn.s     ft6, ft6, fa6
                  lui          a7, 693666
                  fadd.s       ft4, fs3, ft2
                  fsgnj.s      fs3, fa4, fa1
                  fsgnj.s      fs0, fa5, fa2
                  fmin.s       ft1, fa5, ft7
                  mulhu        t2, s10, t5
                  div          s7, a4, s4
                  sub          a7, s9, s0
                  andi         s0, s9, 1825
                  srl          t1, a5, a7
                  fadd.s       fs0, ft10, fa6, rup
                  fdiv.s       ft4, fs8, fa1
                  or           a5, s10, a3
                  xor          s0, s4, zero
                  divu         ra, sp, gp
                  addi         s3, a4, 1829
                  fmv.x.w      a3, fa0
                  fle.s        s7, ft0, fs4
                  rem          a0, ra, zero
                  fsgnjx.s     fs7, fs10, fa2
                  fsgnjx.s     ft6, ft4, fs4
                  mulh         a7, gp, s11
                  add          a1, t0, s7
                  fadd.s       fs10, fs4, ft0
                  sltiu        s3, a2, 585
                  ori          s10, t4, 45
                  mulhu        s1, s0, t3
                  slt          s7, t0, s0
                  sltu         a3, s5, s0
                  fcvt.s.wu    fs6, tp, rmm
                  slt          a1, a6, a0
                  xor          a6, tp, s3
                  lui          s3, 530431
                  addi         tp, s1, -652
                  fsgnjx.s     ft0, ft7, fs11
                  and          zero, s10, s5
                  fmin.s       fa0, fs8, ft1
                  add          a2, s4, s5
                  mulhu        s2, s4, s7
                  or           t2, s6, s2
                  flt.s        s2, fa3, fs1
                  mulhsu       s6, t2, s5
                  rem          a1, t2, s8
                  feq.s        s2, ft5, ft11
                  nop
                  xor          a4, t3, a0
                  div          s9, s7, ra
                  fcvt.wu.s    t6, fa1, rmm
                  fmin.s       ft6, ft7, ft4
                  fsgnj.s      fs1, ft10, fs2
                  mul          tp, s2, s9
                  flt.s        s11, fa0, fa2
                  sra          a2, s10, sp
                  srl          t4, a7, a5
                  sltu         a7, a5, t6
                  ori          s4, s6, 1467
                  auipc        a2, 608581
                  fsub.s       fs1, fa0, fa2, rdn
                  ori          t4, s4, 673
                  fcvt.w.s     t3, fa1
                  auipc        a6, 650808
                  fmv.x.w      zero, fs6
                  addi         zero, t1, 1983
                  rem          s9, s4, s0
                  sltu         tp, a6, a2
                  fadd.s       fa4, fa4, fs2
                  feq.s        ra, fs10, ft5
                  sra          s8, ra, t3
                  srli         s8, s10, 27
                  ori          s4, zero, -1915
                  fcvt.s.w     ft8, s4, rtz
                  mul          s11, a6, a2
                  fcvt.w.s     gp, fa3
                  fmv.w.x      ft9, s4
                  rem          s11, a5, s2
                  fdiv.s       fs5, ft4, fs5
                  slt          zero, s3, ra
                  sltu         t1, s5, t4
                  mulh         a0, a2, s10
                  sltiu        s11, s5, 1162
                  srli         t2, s8, 13
                  xori         s6, a0, 811
                  divu         a7, s1, s4
                  xori         s11, s10, 492
                  fcvt.w.s     a1, ft7, rne
                  fmin.s       ft8, ft11, ft0
                  fmul.s       ft9, ft11, fa1
                  srli         s7, zero, 17
                  sltu         a2, a2, s5
                  sub          t1, sp, t4
                  fsqrt.s      fs2, fs9
                  sub          gp, a5, s3
                  slt          a0, gp, t2
                  xor          t2, t3, tp
                  add          s8, t5, a3
                  divu         t2, t1, ra
                  sra          a5, s4, s11
                  fcvt.w.s     a4, fa5, rmm
                  slti         s11, t4, 318
                  fdiv.s       fs7, ft3, ft9, rup
                  or           a5, gp, t0
                  srli         a1, ra, 5
                  sltiu        s7, s5, 1771
                  fclass.s     a1, ft8
                  feq.s        tp, fs4, fa1
                  fmin.s       ft5, fa7, fs4
                  xor          s2, t2, a5
                  feq.s        s6, fs2, fs3
                  sub          t6, t0, tp
                  flt.s        s0, ft5, ft1
                  nop
                  fle.s        t6, ft3, ft0
                  slli         s3, a0, 2
                  mulh         t6, tp, s3
                  fcvt.wu.s    a3, fa0
                  fcvt.s.w     fa2, a1
                  or           s11, s8, a5
                  fadd.s       ft10, ft8, ft10, rne
                  fsgnjx.s     ft10, fs6, fs6
                  divu         gp, t4, a7
                  fmax.s       fa3, ft6, fs5
                  fcvt.w.s     a3, fs3
                  fsgnj.s      ft8, fs4, ft4
                  mulhsu       s11, t2, ra
                  fdiv.s       ft7, ft9, fa6
                  remu         t2, a7, s3
                  slli         s10, t3, 6
                  andi         s9, t0, 394
                  fmul.s       fa0, fa7, fs11
                  sub          t3, a5, s6
                  xori         a6, a7, -136
                  add          t6, s1, s7
                  addi         s6, t5, -1024
                  lui          s10, 556541
                  slt          a3, s8, ra
                  slti         a2, a7, -1925
                  fmin.s       fs7, ft10, ft2
                  fmul.s       ft8, ft1, ft9, rne
                  sltu         s6, t6, a2
                  fsgnj.s      ft8, fs1, fa5
                  sltiu        s10, t0, 1975
                  fcvt.wu.s    gp, ft0, rtz
                  slt          a7, a6, s0
                  fadd.s       ft0, fs4, fs10, rup
                  fmv.w.x      fs8, t2
                  fcvt.s.wu    fs4, tp
                  mulh         s8, zero, s6
                  divu         a6, ra, s3
                  fmv.w.x      fs11, a7
                  sltu         a0, zero, t0
                  fcvt.wu.s    gp, ft11, rup
                  fcvt.w.s     ra, fs3
                  fmin.s       fa2, ft4, ft4
                  xori         t3, ra, -1061
                  xori         t6, a7, -878
                  slli         s9, zero, 21
                  nop
                  sll          t0, a0, s5
                  remu         s9, t3, t2
                  sra          t0, a2, sp
                  fsgnjn.s     ft4, fa4, fa7
                  fcvt.wu.s    a4, ft4
                  andi         gp, tp, -1340
                  addi         a5, a1, 881
                  mul          t3, s1, t4
                  flt.s        a5, fs9, ft11
                  srl          a4, s5, a4
                  fsgnjx.s     fs8, fa1, ft2
                  fmax.s       ft7, fs9, ft2
                  or           s8, s11, s3
                  mulhsu       tp, t3, s2
                  srai         s10, a0, 9
                  or           s11, zero, s0
                  fsqrt.s      fa7, fs4
                  fsub.s       ft1, ft10, fa3
                  fcvt.wu.s    s10, fs0, rdn
                  fmv.w.x      fs2, s10
                  srai         s6, a7, 23
                  mul          s9, s5, a3
                  slli         s6, a7, 20
                  mulhsu       t0, a1, zero
                  fsub.s       ft1, ft6, fa2, rdn
                  fcvt.s.wu    fs3, s4, rup
                  fsub.s       fa6, fs4, ft11
                  ori          s1, s8, -1103
                  fle.s        gp, fs6, fa3
                  fle.s        s9, ft5, fa1
                  sltu         s2, a0, s11
                  fsgnjx.s     fa5, fa4, ft5
                  auipc        s7, 39164
                  fcvt.wu.s    t6, ft2, rup
                  nop
                  fsgnjx.s     fs3, ft7, fs0
                  feq.s        s11, ft4, ft2
                  sll          s0, s4, ra
                  fadd.s       ft11, fa7, fa1, rmm
                  fmin.s       fs3, fs10, fa1
                  divu         s6, t6, zero
                  srai         a6, s11, 2
                  auipc        s10, 244857
                  fdiv.s       fs8, fs4, fa6
                  ori          ra, s3, -313
                  mulhsu       tp, gp, a1
                  sll          zero, s2, t0
                  auipc        t3, 604848
                  sltiu        zero, a4, 955
                  sub          s0, a0, t6
                  mulhu        t1, t6, s9
                  div          s8, a7, zero
                  mulh         t0, s2, s3
                  fcvt.s.w     fa6, s1
                  remu         s9, s7, ra
                  fcvt.wu.s    s2, fa5
                  add          zero, s8, s9
                  feq.s        s3, fs9, fs5
                  and          s2, t4, a0
                  mulh         s9, gp, t3
                  remu         a0, a6, s9
                  fle.s        t4, fa2, ft2
                  or           a4, t1, s3
                  srli         t3, s4, 11
                  fmul.s       ft1, fa7, ft1
                  lui          s11, 799750
                  rem          t2, t3, t6
                  fmv.w.x      ft2, zero
                  fmv.w.x      fs11, a4
                  remu         t1, s11, t6
                  fsub.s       fa7, ft10, fa1, rne
                  sltiu        s6, s2, 174
                  or           s1, a2, sp
                  lui          a0, 884420
                  fcvt.wu.s    zero, fs1, rtz
                  add          gp, t0, t1
                  fcvt.s.w     fs10, a4
                  sra          s0, s11, s11
                  xori         t0, s10, -1031
                  mulhu        gp, s3, a3
                  fsub.s       fa6, ft1, fs4
                  sltu         t3, t2, s9
                  fsub.s       fs7, fs0, fs5, rup
                  mulhsu       tp, t5, s0
                  fsqrt.s      fs10, fs8, rtz
                  fsgnj.s      fs8, ft10, fa4
                  sll          s4, t3, s4
                  sra          s6, s7, a4
                  fsub.s       fa6, fa7, fs10, rdn
                  slti         gp, t3, -240
                  mulhsu       a4, s6, t6
                  slt          s6, a0, a0
                  add          s6, s8, t0
                  srli         a3, t4, 1
                  fcvt.s.w     ft3, s5, rmm
                  slti         a3, a3, -800
                  fmv.w.x      fs8, s5
                  or           t3, t0, a6
                  feq.s        a3, ft9, ft0
                  fadd.s       ft5, fa3, fa0
                  srai         t3, s7, 22
                  sub          a6, ra, gp
                  addi         t3, s7, 1274
                  fsub.s       ft5, fs10, ft7
                  div          s11, a5, tp
                  fcvt.s.w     ft5, ra, rdn
                  xori         a1, t1, 127
                  fsgnjx.s     fs7, fs7, ft0
                  srai         gp, s10, 9
                  feq.s        s1, fs9, ft2
                  rem          t3, tp, a7
                  auipc        s10, 320180
                  fmv.x.w      ra, ft4
                  sub          t4, ra, s8
                  fmul.s       fa6, fs5, fs5
                  fcvt.w.s     s2, fa6
                  fcvt.w.s     t2, ft0, rup
                  or           a2, t6, s8
                  slti         s8, t1, 1565
                  fsub.s       fa7, ft11, fs11
                  fmv.w.x      ft6, s10
                  fclass.s     zero, fa5
                  sltu         ra, a6, a5
                  sltiu        a7, a0, -588
                  fcvt.wu.s    t1, fs2, rmm
                  fsgnjx.s     fs0, fs0, ft11
                  feq.s        s3, ft8, fs6
                  fsgnjn.s     ft3, fa2, ft6
                  fcvt.wu.s    s10, fa3
                  fsub.s       ft8, fa5, fs9
                  fsub.s       fs0, fs7, fs11, rdn
                  add          ra, t6, s0
                  fmul.s       ft1, fa1, fs6
                  fsub.s       ft9, fs6, ft5
                  remu         t3, s7, s2
                  feq.s        zero, fa7, fs4
                  addi         s0, a6, -1095
                  fsub.s       ft2, fs6, fa1
                  fsgnjx.s     fs0, fs1, ft8
                  mulhu        s9, s0, t4
                  fle.s        a1, fa3, ft11
                  mul          s7, t2, s1
                  slti         t6, t5, 1582
                  fsub.s       fs9, fs10, fs7
                  sub          a6, s5, sp
                  fmax.s       fs0, ft8, ft2
                  fdiv.s       fs11, ft1, fa2
                  fadd.s       fs3, fs11, ft6
                  xor          s6, s0, s9
                  fsgnjn.s     fs6, fs6, ft0
                  nop
                  fsgnjx.s     fa4, fs9, fa7
                  fsub.s       fs3, ft6, ft7
                  fadd.s       fs5, fs3, fs11
                  flt.s        s0, fs10, fa6
                  xor          s2, s5, t5
                  div          s6, a6, a1
                  divu         s10, gp, t1
                  auipc        tp, 237745
                  mulhu        a6, t1, t5
                  xori         ra, gp, 882
                  addi         s4, gp, -1558
                  fadd.s       ft2, fa5, ft1
                  srl          a4, a2, a1
                  fsgnj.s      fs8, fs8, ft6
                  and          a1, a1, s4
                  slli         a7, s7, 4
                  mulhu        s2, a1, s9
                  mulhu        s3, a0, a2
                  srai         a6, sp, 10
                  fcvt.s.w     fa4, zero
                  xor          a5, s0, t0
                  mulhsu       zero, s6, s11
                  mulhu        s4, a7, a0
                  sra          s3, a7, s6
                  sltu         a7, a6, a5
                  sub          a4, t3, a5
                  sltu         t4, s6, s4
                  fmin.s       fa2, fs6, fs11
                  mulhu        s10, t0, gp
                  fsgnjn.s     ft1, ft4, ft1
                  addi         s2, s7, 882
                  fmax.s       fs8, fa7, fs11
                  sub          s4, gp, gp
                  srli         s2, t5, 31
                  andi         gp, t2, -1458
                  slti         t1, tp, 30
                  add          s3, a0, a0
                  srli         t1, t1, 12
                  fadd.s       fs11, fs1, ft11
                  fsqrt.s      fa6, fs4, rup
                  srl          zero, a4, a6
                  slti         gp, t2, 797
                  sltu         s4, t4, s10
                  sra          a2, a5, s1
                  slt          t6, ra, a7
                  divu         a6, s3, a2
                  srli         t3, s5, 14
                  ori          a5, t4, 1589
                  fmul.s       ft0, fs7, ft4
                  slti         t6, tp, 1368
                  auipc        zero, 614975
                  fclass.s     s11, fs11
                  sll          a5, s8, a3
                  andi         s2, t4, 1255
                  sra          s6, t1, a5
                  and          t6, a7, s9
                  nop
                  mulh         ra, a3, s0
                  fcvt.w.s     s2, ft8
                  sll          a0, t3, a3
                  srai         a3, zero, 9
                  fsub.s       fa1, fa6, ft2
                  mulhu        t4, ra, t6
                  fclass.s     a3, fa1
                  flt.s        s4, ft10, fs3
                  srai         a3, s4, 26
                  sra          s1, zero, a5
                  remu         zero, a3, t3
                  sltiu        t6, tp, 1873
                  sltu         s2, a1, sp
                  add          s11, a1, t6
                  lui          t1, 533843
                  fclass.s     s10, ft1
                  rem          a0, t4, a5
                  mulhsu       a3, s6, a6
                  sub          s9, s4, a7
                  slt          s3, ra, t3
                  ori          s3, t2, -1399
                  fadd.s       ft11, fs10, fs1
                  fcvt.s.w     fs4, t0
                  srai         a1, s1, 9
                  srl          s8, a2, s7
                  fcvt.w.s     s3, fs8, rne
                  div          a7, s11, s11
                  nop
                  fmul.s       fs10, fa0, ft3, rmm
                  or           t4, s1, zero
                  or           t3, s8, s3
                  fmul.s       fa4, ft1, ft10, rdn
                  srai         s10, s9, 18
                  sub          t3, a1, a5
                  srai         t4, t3, 7
                  fmin.s       fs1, fa4, ft7
                  sra          zero, ra, a0
                  mul          s10, t6, s2
                  xori         a3, s2, -835
                  sll          a6, tp, gp
                  xor          gp, ra, a3
                  fclass.s     a4, fs6
                  fmax.s       ft1, ft0, ft2
                  add          s4, a3, zero
                  fcvt.s.w     fs5, s8, rup
                  fmv.x.w      t6, fs6
                  srl          a5, zero, a3
                  fsub.s       ft5, fs11, fa5
                  fmv.w.x      ft4, t1
                  mulhsu       s10, s8, tp
                  fcvt.w.s     a2, ft9, rtz
                  mul          gp, s1, s8
                  fdiv.s       fs6, fs3, fs7
                  fadd.s       fs10, fa4, ft1, rtz
                  sra          s6, s8, s6
                  mulhsu       a7, a0, s8
                  slt          s8, t3, a1
                  fcvt.s.wu    ft5, a7
                  sltiu        s8, t1, 794
                  mul          a6, a2, s11
                  slti         a2, a7, 1822
                  mulh         t3, t2, s4
                  mul          s11, t4, a3
                  fdiv.s       fs4, ft5, ft10, rne
                  sltiu        t0, a0, 633
                  slt          s9, t6, t1
                  fadd.s       fa7, ft4, fa7, rtz
                  fsgnjx.s     fs7, fs10, ft10
                  fmv.x.w      t2, ft9
                  fmax.s       fa4, fs10, ft4
                  or           a2, a7, s1
                  mulhsu       a7, a7, s4
                  auipc        t6, 482256
                  div          a2, s10, ra
                  fdiv.s       fa0, fs6, ft6, rne
                  xor          tp, sp, a4
                  slti         s8, s1, -1102
                  sll          a2, a6, t6
                  flt.s        t3, fs4, ft2
                  sub          a3, ra, s3
                  mulh         a2, sp, a4
                  fmin.s       fa0, fs11, fs1
                  mulh         t3, t5, s11
                  div          t1, a4, ra
                  sltu         a4, sp, s9
                  fsgnjx.s     fa0, fs11, ft10
                  flt.s        a7, ft11, ft0
                  fcvt.s.w     ft1, gp
                  mulh         tp, s9, t1
                  sltiu        t3, t6, -1563
                  ori          tp, t4, 1175
                  srli         t6, s0, 21
                  rem          a7, tp, ra
                  srl          t3, s3, s5
                  div          a2, s0, a6
                  fcvt.s.wu    fs2, s1, rmm
                  slt          a0, a0, t2
                  fsub.s       fa3, ft0, fa4
                  fsub.s       fs6, fs4, fs10
                  fmul.s       fa3, ft7, ft5
                  fsqrt.s      ft6, fs8
                  fclass.s     t6, ft1
                  fmv.w.x      fs4, t3
                  fmin.s       ft5, fs0, ft1
                  xori         a4, zero, 678
                  fadd.s       ft3, fs9, fs10
                  mulhu        s9, s0, zero
                  xor          a3, s3, a4
                  slti         a3, a5, 759
                  fmax.s       ft7, fa2, fs7
                  rem          t4, s1, s5
                  fmv.w.x      fa1, t3
                  fcvt.wu.s    a5, fa6
                  auipc        s0, 394293
                  mul          s0, t2, zero
                  fdiv.s       fs5, fs6, fa3, rne
                  auipc        a6, 480427
                  mulhu        ra, s0, t0
                  or           t0, t5, t3
                  fsgnj.s      fa5, ft6, fa6
                  fadd.s       fs4, fs10, ft7, rmm
                  andi         s1, tp, -1163
                  feq.s        s8, ft5, ft6
                  rem          s4, ra, s10
                  fmax.s       ft10, ft8, ft10
                  rem          s0, t3, a3
                  srli         s3, s7, 13
                  add          t3, t0, gp
                  fsub.s       fa0, fs11, fs2
                  fmul.s       fa7, fs5, fs8
                  srl          s6, tp, a0
                  fsgnjx.s     fa1, ft11, fs5
                  xor          t4, a1, s1
                  fcvt.s.wu    fs7, t6
                  remu         s4, gp, a4
                  or           s1, s2, s6
                  fclass.s     t4, fa6
                  div          a2, s6, tp
                  div          gp, s3, t3
                  feq.s        t3, ft6, fs10
                  fadd.s       ft5, ft4, fs1, rne
                  rem          a4, s0, a5
                  fmv.w.x      fs1, s7
                  auipc        s0, 128164
                  auipc        s6, 794453
                  div          s1, a4, s1
                  remu         a1, s0, a6
                  fsqrt.s      fa5, fa0
                  add          s6, s7, s3
                  fmin.s       fa2, ft7, fs9
                  fmin.s       fs7, ft5, fs6
                  slt          tp, a0, s2
                  fmax.s       fa5, ft8, fa5
                  fdiv.s       ft11, ft3, ft1
                  xori         s3, s7, 1978
                  fcvt.wu.s    a7, ft9, rne
                  srai         a5, a0, 0
                  fmax.s       fa7, fs10, fa3
                  fmv.w.x      fa7, s10
                  mulhu        s4, a1, a0
                  fclass.s     t0, fa0
                  slti         s11, s2, 68
                  fadd.s       ft1, fa3, ft4
                  xor          zero, a4, t5
                  fcvt.s.wu    ft0, zero
                  fsqrt.s      fa7, fa5, rdn
                  mul          gp, tp, s3
                  slti         tp, t5, -1664
                  fcvt.s.wu    ft11, t3, rmm
                  fsgnjn.s     ft11, ft2, fa4
                  fsgnj.s      fs7, fa3, fs0
                  auipc        a2, 139661
                  xori         a5, t0, -1385
                  ori          t1, s7, -101
                  fsgnjn.s     fs1, fs2, ft10
                  addi         t3, s11, 1332
                  mulhsu       t0, s9, s8
                  ori          s3, ra, 1550
                  fmv.w.x      fs9, t0
                  fclass.s     s9, ft3
                  lui          s2, 1042462
                  sltu         a3, t3, s0
                  srli         a3, zero, 26
                  lui          a0, 721110
                  slt          s8, a2, a2
                  mulhsu       a5, a6, zero
                  fsgnjn.s     fs9, ft3, fa3
                  div          a3, s7, t3
                  slli         s0, t6, 14
                  fsgnjx.s     ft6, ft3, ft10
                  fcvt.wu.s    s3, fs8
                  and          t3, zero, s11
                  fadd.s       ft11, fa5, ft0, rmm
                  fmv.w.x      fs2, gp
                  fcvt.wu.s    s1, fs11, rmm
                  ori          gp, s7, -456
                  sra          a6, t1, s6
                  mulhu        a0, s0, t3
                  sub          a7, a7, t5
                  addi         s4, s3, 1042
                  div          s7, s0, s3
                  fcvt.w.s     t0, fs6
                  and          s2, s8, s7
                  fcvt.s.wu    fs1, s2, rup
                  add          a0, s2, s10
                  andi         s7, s5, 2005
                  fdiv.s       ft11, fa6, ft9
                  add          t4, s8, a6
                  remu         a6, a2, s1
                  add          a2, a4, a0
                  fsub.s       fa5, fs5, ft4
                  fcvt.wu.s    tp, fs1, rdn
                  divu         t2, t0, s4
                  xor          s9, t6, a0
                  fmul.s       fs10, fa5, fs0, rtz
                  fclass.s     ra, fs7
                  xor          t3, a1, s9
                  divu         gp, t1, a7
                  divu         t4, t5, t0
                  sltu         a5, t1, a3
                  fsgnjx.s     fs11, fs5, fs2
                  auipc        ra, 4135
                  feq.s        s4, fa1, ft2
                  div          ra, a0, a7
                  fdiv.s       fa6, ft9, fs3, rup
                  sll          a5, t5, t0
                  slti         ra, t4, 1146
                  srai         t6, sp, 0
                  xori         t0, s1, -1045
                  fsgnj.s      fa5, ft0, ft2
                  fdiv.s       ft0, ft9, ft9
                  xori         a2, t3, 743
                  sub          a2, a2, s6
                  sra          a1, a6, a3
                  slt          t6, a5, t6
                  fmv.w.x      fs6, sp
                  mulhsu       a4, s8, t6
                  mulh         s4, a1, t0
                  fmv.w.x      fs10, zero
                  fdiv.s       ft4, ft6, fa5
                  xor          t4, sp, s9
                  lui          s6, 19553
                  xori         s0, a7, -1377
                  fsqrt.s      ft6, fs3
                  feq.s        ra, fa0, ft8
                  lui          s10, 665159
                  sltu         s11, s2, s1
                  srl          s10, t5, s2
                  fclass.s     t1, fa5
                  slt          s10, sp, sp
                  sub          s2, s8, a5
                  rem          a4, tp, s7
                  and          s1, a3, t2
                  remu         s9, a4, t6
                  xor          a4, s2, s4
                  slt          s4, t4, gp
                  fsgnj.s      fs4, fs2, ft3
                  fcvt.s.w     fa3, s7
                  mul          t1, s3, t3
                  sra          s0, t3, s1
                  sltu         s9, gp, s10
                  feq.s        a6, fs3, ft8
                  divu         tp, s1, s5
                  fclass.s     s1, ft0
                  ori          t0, s3, 498
                  fmax.s       fa1, fs0, fs11
                  div          s3, t3, s2
                  fcvt.s.w     fs0, s9, rmm
                  fdiv.s       fs10, ft5, fs9, rtz
                  div          t6, t1, zero
                  slt          s0, s10, gp
                  fmv.w.x      fs1, a1
                  slli         s1, t4, 21
                  sltu         t4, s0, t2
                  fsgnjn.s     ft1, fs0, fs10
                  fdiv.s       fa3, ft5, fs6, rtz
                  add          a3, s4, a2
                  mulhsu       s0, s8, a0
                  rem          gp, s4, s6
                  fsub.s       ft10, fs2, fa4, rdn
                  mul          s1, t5, a6
                  rem          t1, a6, gp
                  ori          t6, a6, 1863
                  fmul.s       ft2, fs5, fs11
                  fmv.w.x      ft2, s6
                  fmul.s       fs1, fa7, fa3
                  fcvt.s.w     ft9, s4
                  slti         s11, t2, -1945
                  divu         a6, a3, s8
                  andi         s4, t2, 194
                  fmv.x.w      t3, fs8
                  sub          ra, s0, a4
                  slti         a0, t2, 1865
                  flt.s        s0, fs6, fa3
                  fsqrt.s      fa5, ft8, rtz
                  sub          a0, a1, s9
                  slti         s11, s7, -401
                  and          t4, sp, s6
                  div          s7, t4, a2
                  sll          s0, a5, s9
                  fmin.s       fs8, fs11, fs2
                  fsgnj.s      fs9, fs4, fs9
                  fsqrt.s      fa2, fa0, rne
                  fmv.x.w      s8, ft3
                  add          ra, s6, zero
                  slt          gp, a3, a6
                  fmax.s       fa3, fa3, fs4
                  xor          s3, a7, s1
                  mul          s10, zero, t5
                  sub          gp, sp, s5
                  divu         s0, sp, a2
                  sll          s8, t4, s11
                  flt.s        s2, ft6, ft0
                  mulhu        tp, sp, t5
                  xor          t2, a4, t3
                  slt          a3, s3, t2
                  fmul.s       fa7, ft4, fs0, rmm
                  srl          t3, t2, s8
                  divu         gp, s2, a7
                  xor          s0, s4, s3
                  mulhsu       a3, s3, ra
                  andi         t4, zero, -937
                  fle.s        s2, fa0, fa7
                  add          s8, t6, a5
                  fmax.s       fs8, ft8, fa7
                  mulh         a6, s8, t0
                  fcvt.s.w     fa0, s2
                  ori          s11, s3, 209
                  sra          s11, a2, s7
                  fmv.w.x      fs5, ra
                  sra          t0, t1, s1
                  sra          t4, t1, s0
                  sltu         a6, zero, a4
                  srl          a3, s1, s0
                  mulhsu       s1, s3, a7
                  mulhu        a6, s6, s6
                  sub          s8, t5, t3
                  rem          s3, t0, t0
                  fclass.s     zero, fa4
                  or           a0, a0, s3
                  auipc        s3, 119708
                  sra          t4, s11, t6
                  flt.s        s9, ft7, ft6
                  nop
                  fclass.s     s9, fa4
                  slli         s7, t2, 13
                  sra          t4, s11, t2
                  div          t3, t6, s0
                  fadd.s       fa1, ft9, ft7, rdn
                  add          t0, t5, s7
                  and          a2, s11, s9
                  xori         t4, t3, -989
                  remu         t1, t2, a7
                  fsub.s       fs8, ft9, fa6
                  srl          s7, t6, t2
                  fsqrt.s      ft3, ft7, rdn
                  fadd.s       fs4, fs7, fa2
                  fmin.s       fa7, ft6, fs8
                  fdiv.s       fa6, fs6, fa7
                  fmin.s       fa3, fa0, fs9
                  sub          s8, s8, s9
                  slt          s10, s4, s6
                  mulh         gp, s7, s1
                  srai         s9, s9, 3
                  rem          t2, t2, s5
                  srl          gp, a4, a3
                  fsqrt.s      ft0, fs9, rne
                  fsgnjx.s     fs6, ft10, ft11
                  fcvt.s.wu    fa2, a0
                  rem          a3, s8, s2
                  divu         a1, t4, t0
                  fmv.w.x      ft6, t0
                  addi         a0, t5, 623
                  addi         a1, a2, 30
                  srl          t2, s0, s4
                  fsub.s       fs2, fs0, fs5
                  mulh         ra, sp, a6
                  fsub.s       fa5, ft7, ft10
                  fle.s        a2, ft7, fa7
                  mulh         t1, a1, s8
                  fdiv.s       fa4, fs5, fs11, rup
                  add          a1, s0, s7
                  srai         a3, s9, 0
                  fdiv.s       ft11, fa3, ft2
                  fclass.s     s2, fa6
                  lui          s4, 994731
                  sltu         t1, s5, a6
                  mulhu        s1, a0, a3
                  fcvt.wu.s    a4, ft9, rtz
                  fmul.s       ft5, ft4, fa2
                  sra          t6, s0, t0
                  slt          s10, sp, zero
                  add          a7, t0, s10
                  fcvt.w.s     t2, fa0, rup
                  xor          s7, s2, a0
                  flt.s        zero, fs7, ft0
                  or           s9, a4, gp
                  sll          t2, zero, s10
                  fclass.s     s9, fs5
                  andi         s11, t5, 188
                  fsgnjn.s     fs4, ft4, fs6
                  divu         gp, s7, a7
                  divu         s1, s10, t5
                  addi         s6, s11, 1591
                  feq.s        s8, ft6, fs10
                  srai         a3, t0, 4
                  sltu         t0, ra, s6
                  slti         t2, a0, 2003
                  slt          s4, t2, s3
                  fcvt.s.wu    ft11, s5
                  xor          a6, zero, s10
                  fsgnjn.s     fs6, fa3, fs11
                  fmax.s       ft7, ft3, fs3
                  fsgnjx.s     ft11, fa5, ft10
                  div          t4, s3, s2
                  sub          s10, s10, t4
                  fmin.s       ft0, ft3, fs9
                  fsqrt.s      ft1, ft7
                  ori          s6, s9, 1802
                  xor          s6, s11, s7
                  fle.s        gp, fs6, fs6
                  fdiv.s       fs0, fs4, ft8
                  nop
                  sll          s7, s10, a4
                  fmv.w.x      ft7, tp
                  auipc        t1, 670532
                  sltiu        t0, s3, -1448
                  fmin.s       fs3, fs8, ft5
                  and          t6, s11, t4
                  fsqrt.s      ft7, ft2, rup
                  sll          s2, s0, s0
                  fmin.s       ft6, ft6, fa4
                  addi         t6, a3, -439
                  xori         s2, a0, -1553
                  sll          t2, s4, t0
                  mulhsu       t0, gp, t2
                  nop
                  fcvt.s.wu    ft0, a0, rne
                  fsgnjx.s     fs11, fs1, fs10
                  fcvt.wu.s    s3, fa4
                  fsgnjx.s     ft8, fs1, fs4
                  ori          gp, s2, 43
                  fsgnj.s      fa1, ft4, fa5
                  slti         s3, t3, -971
                  slli         s3, s5, 25
                  fmax.s       fs0, ft2, fa4
                  xor          a3, s7, s6
                  fsub.s       fs4, fa5, fs3
                  sra          t3, sp, s0
                  fcvt.s.w     ft7, t1, rdn
                  fadd.s       fa6, fa6, fs5, rne
                  fcvt.wu.s    a3, fa1
                  fadd.s       fs11, ft7, ft8, rmm
                  sltiu        s4, zero, 741
                  sra          s7, tp, s11
                  fcvt.s.wu    fa1, a5, rmm
                  fadd.s       fa7, fs3, ft4, rmm
                  slli         gp, s3, 17
                  fmv.x.w      t6, fs2
                  fmul.s       fs9, fa1, fs7, rdn
                  sltiu        s8, s3, 357
                  fmax.s       ft3, ft0, fs1
                  sltu         s2, t4, a3
                  sra          a7, a4, s11
                  or           s2, a5, t2
                  divu         s6, s4, s7
                  addi         s9, s11, -47
                  nop
                  or           a3, t2, s3
                  slt          a5, a2, s9
                  sltiu        a6, s1, -1772
                  srl          tp, s10, ra
                  fsub.s       fs2, fa5, ft11, rdn
                  and          a7, a6, a7
                  and          s2, t2, a4
                  fcvt.w.s     t3, ft5
                  div          t6, a6, t0
                  sub          t0, a4, tp
                  fsgnjx.s     fa1, ft10, fa0
                  flt.s        a7, fa4, ft9
                  slt          s10, a2, s7
                  fsgnj.s      fa2, fs6, ft2
                  srl          s7, s1, a6
                  mulhu        t3, t5, t1
                  fmul.s       ft1, ft6, ft8, rne
                  fmul.s       ft3, fa2, fs7, rne
                  fsgnjx.s     fa2, fs11, fs2
                  fmax.s       ft11, fs5, fa1
                  remu         s3, tp, sp
                  slti         t6, a3, -1404
                  fcvt.wu.s    a0, fs9
                  mulhu        t0, s9, t3
                  slti         a5, s11, -1733
                  xor          t3, t3, t0
                  fsgnj.s      fa2, ft3, fs10
                  andi         s7, a1, -732
                  fsgnj.s      ft8, ft5, ft9
                  sltu         a7, a2, a3
                  fsgnjn.s     ft10, fs4, fa7
                  mulhsu       t1, t1, t3
                  mulhu        tp, t2, a6
                  lui          t6, 322530
                  sltiu        zero, a0, -1278
                  fle.s        s11, fa7, fs8
                  fmv.x.w      a6, ft3
                  srai         a3, a3, 26
                  mul          zero, s3, t4
                  sll          gp, t4, ra
                  fmv.w.x      fa0, s10
                  divu         s0, s2, s11
                  sll          a0, a3, s0
                  sll          s2, s10, a5
                  fmul.s       fa4, fs8, fs5
                  sra          t0, sp, s3
                  fsgnjn.s     fs1, fs4, fs9
                  sltiu        s8, s9, -125
                  fmul.s       ft10, fa1, ft7, rup
                  mulhu        ra, t2, tp
                  fmv.w.x      fa1, a1
                  nop
                  sltu         t6, t0, s9
                  divu         t4, s4, s9
                  slt          s1, gp, a4
                  srai         t0, s9, 1
                  divu         a0, t2, tp
                  add          a0, a3, a1
                  fsgnj.s      ft11, ft11, ft4
                  divu         s3, s6, ra
                  slli         s4, s3, 9
                  slti         gp, s2, -1875
                  fdiv.s       ft5, fs11, ft4, rdn
                  fadd.s       fa6, fa7, fa3, rne
                  slt          s3, s7, t0
                  fsub.s       ft7, ft2, ft0, rne
                  fcvt.wu.s    s11, fs6, rne
                  fsgnjx.s     ft0, fs3, fs3
                  sub          s6, a5, gp
                  sub          s1, a2, t5
                  xor          ra, a1, s11
                  srai         tp, zero, 10
                  mulh         s2, a1, t4
                  fcvt.w.s     s4, fs3
                  add          s3, s10, tp
                  feq.s        t6, fs1, fa2
                  div          zero, s4, ra
                  feq.s        t4, ft1, ft10
                  fsqrt.s      ft6, fs11, rup
                  flt.s        s6, fs9, fs2
                  fclass.s     s10, fs10
                  div          gp, gp, ra
                  fmul.s       fs0, ft6, fs3, rdn
                  fcvt.wu.s    t6, fs2
                  sll          t0, s0, a0
                  sub          a2, t4, s5
                  fle.s        s2, ft4, ft5
                  auipc        a3, 808548
                  auipc        ra, 653337
                  srl          t0, s10, ra
                  slli         zero, a6, 11
                  fcvt.s.w     fs5, s6, rmm
                  div          s9, s10, a2
                  addi         gp, tp, -732
                  fdiv.s       fa2, ft2, fa5, rmm
                  sltu         s9, t2, s5
                  divu         s11, s8, t4
                  fsgnj.s      ft7, fa6, ft7
                  mulhsu       a7, s3, s0
                  fcvt.wu.s    a6, ft4
                  nop
                  srai         a0, gp, 8
                  feq.s        a1, ft2, ft2
                  andi         s2, t6, -336
                  fsub.s       fa7, fs3, fa5, rup
                  flt.s        t0, fs4, ft0
                  fsgnjx.s     fa0, ft6, ft3
                  srl          ra, a2, s7
                  fdiv.s       ft9, ft2, fs1
                  mulh         a6, s0, t1
                  sub          s7, s8, t3
                  fmv.x.w      s3, ft9
                  fcvt.wu.s    s7, fa5, rmm
                  remu         a1, a2, s6
                  or           s9, s4, a1
                  mul          tp, s5, a5
                  or           s9, t4, t1
                  fsgnjx.s     fs2, fa3, fs7
                  remu         t2, t5, sp
                  addi         a0, s8, 672
                  remu         t2, t6, a6
                  fsgnjn.s     ft5, fs0, fa2
                  addi         tp, s7, 1524
                  srai         s2, a5, 3
                  srai         a6, s6, 10
                  slli         gp, a6, 22
                  sltu         zero, s0, t3
                  fcvt.s.wu    fa2, a4
                  fsgnj.s      fa1, fa0, ft1
                  xori         a2, a2, 990
                  srli         zero, s10, 2
                  fdiv.s       fa5, fa1, fs9
                  fmin.s       ft0, ft0, ft10
                  flt.s        s7, ft7, fs4
                  fsqrt.s      fa0, fs4
                  mulhu        s3, s11, s4
                  fmax.s       fs8, ft9, fs4
                  mul          s8, s5, a3
                  remu         t6, a2, t0
                  mul          s7, s1, t6
                  xor          a0, s3, s6
                  fcvt.s.w     fs4, t0, rup
                  fsqrt.s      fs1, fs8
                  xori         a4, s10, 924
                  xor          s2, t4, sp
                  slti         s6, a4, -476
                  mul          s3, t2, s5
                  fcvt.s.w     fs8, s5
                  fle.s        t6, ft3, fs4
                  fsub.s       fa4, fa2, ft9, rdn
                  slli         s8, s6, 19
                  sub          s0, s5, t1
                  fle.s        t4, fa1, fa3
                  sub          t3, t4, ra
                  add          a2, t4, sp
                  fsgnjx.s     fs8, fs9, fs9
                  sub          zero, t6, a6
                  lui          zero, 845616
                  fsub.s       fs10, fs0, fa3
                  fcvt.wu.s    tp, fs2
                  fclass.s     t3, fs8
                  srai         ra, s2, 26
                  srai         s6, t6, 2
                  auipc        a0, 74949
                  xor          a2, t5, s5
                  sll          t3, a7, s10
                  fmin.s       ft9, ft5, ft10
                  fmin.s       ft4, ft4, fs7
                  sll          t4, a3, s0
                  fsgnjx.s     ft10, fs5, fs2
                  auipc        a2, 584935
                  addi         zero, sp, -2005
                  and          a1, s11, s4
                  fmv.w.x      fs0, t2
                  fcvt.s.wu    fa4, tp
                  slti         t1, s4, 1595
                  rem          a6, s0, s0
                  sll          s6, s2, s8
                  srli         tp, a3, 3
                  div          tp, s2, s6
                  fsgnjx.s     fa3, ft5, ft5
                  andi         t4, ra, -1145
                  sll          a6, s9, ra
                  sltiu        gp, s3, -1272
                  xor          tp, a3, a5
                  mulhsu       a0, s10, s2
                  div          a6, s11, a4
                  srai         a0, t5, 17
                  sra          s1, s5, s0
                  fsub.s       fs1, fa1, ft3, rup
                  fsgnjx.s     fa3, fs10, fs4
                  xor          a6, t3, s4
                  fmv.x.w      s10, fs1
                  sltu         a6, a2, t6
                  nop
                  fcvt.s.w     fs4, t1, rup
                  remu         t1, s11, s5
                  sltu         t1, a4, a6
                  mulh         a6, t2, tp
                  fcvt.wu.s    a7, ft6
                  fle.s        a0, ft7, ft2
                  feq.s        s1, ft6, fs9
                  fmv.w.x      fs6, a6
                  or           s4, s3, t2
                  ori          ra, s1, -1856
                  remu         s0, s2, s11
                  fsub.s       ft9, ft7, fa0, rne
                  auipc        a2, 916712
                  fmin.s       fs1, ft3, ft9
                  rem          t0, s4, s4
                  fcvt.s.wu    ft1, a2
                  fcvt.wu.s    s8, ft8, rtz
                  ori          t4, a4, 2011
                  fmv.x.w      t1, fa5
                  ori          a0, a2, 1944
                  slt          t6, s1, ra
                  nop
                  fdiv.s       ft1, ft1, ft9
                  fmv.x.w      zero, ft7
                  flt.s        t4, ft6, fs2
                  slti         s0, t5, -1166
                  sub          s4, tp, s4
                  fsub.s       ft4, fa1, ft8, rne
                  ori          s2, zero, -418
                  auipc        a7, 144862
                  add          t1, a4, t1
                  srl          a7, s1, s9
                  add          t1, s0, s8
                  fcvt.wu.s    t4, ft5, rne
                  slt          s0, t1, a6
                  fmin.s       fs11, ft9, fs0
                  addi         t4, t0, 1022
                  fle.s        ra, ft10, fs11
                  fcvt.wu.s    t0, fa1, rdn
                  sll          a6, t1, s2
                  srl          a7, zero, s6
                  div          a2, gp, s2
                  fmul.s       ft2, fs3, fs3
                  fsub.s       fs5, fa7, fs9, rdn
                  div          a6, s4, t4
                  addi         t4, s4, -1208
                  ori          s7, s4, 1627
                  fsub.s       ft7, fs2, ft3
                  slli         t1, a1, 19
                  sra          s11, a7, a1
                  sltu         a1, sp, ra
                  slli         gp, t1, 18
                  fmin.s       ft7, fs10, fs2
                  mulhsu       a7, s10, s11
                  fsgnjx.s     ft2, fs11, ft10
                  fsgnjn.s     ft11, ft11, fs3
                  fsqrt.s      fa6, fa2, rmm
                  sltu         a1, sp, s11
                  xori         a5, ra, 1415
                  lui          t4, 731209
                  mulhsu       s7, s1, t0
                  addi         t3, t2, -334
                  fmul.s       fs9, ft0, fs7, rne
                  slli         s3, t0, 28
                  srai         a2, s5, 10
                  ori          t0, zero, -201
                  feq.s        a2, ft6, fa0
                  fsqrt.s      ft2, fs6
                  fsqrt.s      ft4, fs3
                  fcvt.s.wu    ft6, s9, rdn
                  fmv.w.x      ft7, t5
                  mulh         gp, s2, a5
                  mulh         s8, s3, a4
                  srai         ra, s10, 30
                  fsub.s       ft2, fa5, ft7, rdn
                  fdiv.s       fs8, fs9, ft0
                  nop
                  srl          a0, t1, s6
                  fmin.s       ft7, fs10, ft7
                  mulhsu       a1, a3, s5
                  mulh         a5, a4, ra
                  fsgnjx.s     ft8, fs10, fa0
                  fsgnjn.s     fs7, fa3, fa4
                  sltiu        s1, s0, 878
                  remu         s2, t4, s9
                  fclass.s     a7, fs8
                  fmin.s       fa7, fa1, fa1
                  fcvt.s.wu    fs5, sp
                  slli         gp, t3, 14
                  fclass.s     zero, fs6
                  fdiv.s       ft6, fa1, fs3, rmm
                  fdiv.s       fs5, ft8, fs8, rmm
                  sltu         t6, t4, s1
                  addi         a5, s10, -1421
                  fcvt.s.wu    fs0, t3
                  fcvt.s.wu    fs5, t2
                  sltiu        a1, s0, -1904
                  fmin.s       fs0, fa4, fa5
                  ori          s3, s4, 328
                  fcvt.s.w     fs0, sp
                  srai         s3, s10, 5
                  fsub.s       fa7, fa6, fa1, rne
                  xori         tp, sp, -1858
                  ori          a1, t4, -1698
                  sll          a4, t2, t1
                  fcvt.wu.s    t3, fs0
                  lui          gp, 563297
                  fsgnj.s      fs5, ft11, ft2
                  sltu         s7, a7, sp
                  fcvt.wu.s    a2, fa2
                  and          a3, t0, s9
                  srl          s1, s8, a2
                  srai         t3, s5, 1
                  fle.s        tp, fs9, fs3
                  lui          t3, 324136
                  rem          a3, a6, a5
                  sub          s4, a7, zero
                  remu         s4, s3, s8
                  fsgnjn.s     ft5, fa0, fs3
                  fsqrt.s      fs3, ft7
                  fsgnjx.s     fs10, fs11, fa2
                  feq.s        s3, ft9, fs8
                  srai         t4, a7, 22
                  lui          a7, 53883
                  fsgnjn.s     fs7, fs9, fs4
                  fdiv.s       fa1, fs2, fs8
                  rem          s1, s10, a0
                  fmax.s       fa2, fs8, ft9
                  fdiv.s       ft10, fs6, fs8
                  divu         s1, t3, a3
                  addi         s7, s1, 1789
                  nop
                  addi         s8, gp, -757
                  xor          s6, s8, a0
                  slt          s0, s10, s4
                  fcvt.wu.s    t0, ft2
                  fcvt.wu.s    s9, ft1
                  sra          a7, a6, a1
                  remu         a3, s11, s0
                  fcvt.w.s     s11, ft3, rtz
                  fsub.s       ft8, ft0, ft8, rtz
                  fsub.s       ft5, fa7, fs3
                  mulhu        t0, s11, a4
                  rem          s10, a3, t1
                  slti         a4, s10, -610
                  fsgnj.s      ft11, fa6, ft3
                  remu         ra, zero, tp
                  xor          s10, s10, t5
                  mulhu        s0, t6, t4
                  ori          s9, gp, -1178
                  slt          t4, s8, s8
                  rem          s7, t3, a1
                  fmv.w.x      fa0, a1
                  fcvt.s.wu    fs5, s3, rtz
                  fcvt.s.wu    fa7, a3
                  flt.s        a1, ft6, fs3
                  or           s6, ra, a3
                  add          t2, zero, a3
                  sll          s8, s8, s6
                  srai         s4, a5, 15
                  add          s1, a5, ra
                  fmv.x.w      t3, fa0
                  fmv.x.w      s1, fs2
                  fmax.s       fa3, fa7, fs4
                  nop
                  fsgnjn.s     fs7, ft2, ft7
                  mulhu        tp, s5, t6
                  fle.s        a5, fa1, fs4
                  ori          a3, zero, -1291
                  fle.s        gp, ft2, fa0
                  and          t1, sp, s7
                  mulh         s8, a7, a6
                  sll          s7, s4, s6
                  mulhu        s10, t0, s3
                  srli         t1, s11, 13
                  fcvt.s.wu    ft10, s8
                  fcvt.s.wu    ft4, a6
                  fsgnj.s      fs10, ft11, fs1
                  fle.s        s3, ft11, ft11
                  fcvt.w.s     s2, ft10
                  fmv.w.x      fa2, s5
                  fcvt.s.wu    fs8, s6
                  slli         a0, s5, 7
                  fsgnj.s      fs4, fs2, fa0
                  mulhsu       s1, a2, s9
                  fclass.s     s8, ft0
                  mul          s9, s0, a2
                  flt.s        s3, ft6, fs11
                  and          zero, s11, s1
                  fcvt.wu.s    s3, ft6, rdn
                  mulhu        t1, s6, a3
                  ori          s2, s5, -516
                  andi         a3, s9, 633
                  mulhsu       t6, s2, ra
                  lui          s10, 774286
                  nop
                  ori          s7, ra, -1318
                  xori         a5, s4, 885
                  sltiu        t6, s0, 640
                  fmv.w.x      ft6, t5
                  flt.s        t0, fs3, fs1
                  fcvt.s.wu    fa1, s7, rdn
                  fsqrt.s      ft11, ft1
                  sra          t3, s8, a1
                  fsgnj.s      fa7, fs6, ft9
                  slti         s2, s11, 1174
                  fsgnjx.s     fs1, ft1, ft1
                  sub          t3, t3, a0
                  fcvt.s.wu    fs6, a4, rtz
                  fsgnj.s      fa0, fa4, fs9
                  fdiv.s       ft5, fs2, fs4, rup
                  fmv.x.w      tp, fa4
                  sub          s0, t5, s1
                  auipc        t6, 401672
                  srai         zero, t4, 21
                  feq.s        s2, ft8, fs0
                  auipc        a3, 1010784
                  feq.s        t1, fs10, fa5
                  fdiv.s       fs5, fa5, fa2, rtz
                  and          t3, a3, a4
                  flt.s        a6, fs3, fs9
                  fcvt.wu.s    gp, fs7, rup
                  fadd.s       fs3, ft10, fa5, rdn
                  divu         s10, t0, s8
                  fmin.s       ft0, fs7, fs9
                  flt.s        t2, fs11, fs6
                  slt          t4, t1, a3
                  mulhsu       s2, s8, zero
                  addi         t3, a0, -1224
                  and          s7, a1, a1
                  fmin.s       fa7, ft7, fs4
                  fcvt.w.s     t0, ft11
                  fmax.s       fa6, ft3, fa0
                  auipc        a6, 309609
                  flt.s        a5, ft11, fs7
                  fdiv.s       fs7, fa4, fs0, rup
                  fadd.s       ft0, ft7, ft0, rup
                  divu         zero, a4, zero
                  slt          a4, t3, a7
                  addi         s6, t2, 1812
                  srli         a6, t3, 22
                  sll          a4, t0, t6
                  fsqrt.s      fa7, fs4, rmm
                  or           t3, t5, t3
                  fcvt.s.wu    ft3, s10, rtz
                  mulhsu       a4, a3, t2
                  slti         a2, s10, -348
                  lui          t3, 370633
                  sub          a4, a1, s8
                  slli         gp, tp, 21
                  srai         t2, s2, 27
                  or           a4, t2, a0
                  auipc        s4, 904561
                  fcvt.s.w     ft11, a6
                  ori          a7, s11, 1251
                  fmax.s       fs8, fa1, fs9
                  fsub.s       fa4, ft6, fa4
                  or           s10, a1, s3
                  andi         tp, t4, -79
                  xor          s6, t1, tp
                  lui          s2, 476419
                  sltiu        s8, s6, 1559
                  feq.s        s9, fa2, fs6
                  nop
                  or           s7, t0, gp
                  sra          s0, s6, t3
                  and          tp, sp, tp
                  fsqrt.s      fs11, ft10, rmm
                  sltiu        zero, a3, 1829
                  rem          t6, s8, t6
                  andi         a2, a0, -1786
                  fclass.s     s8, fs6
                  fsub.s       fs1, ft7, fs8, rne
                  mulh         t6, a1, t4
                  fcvt.w.s     t4, ft2
                  mulhsu       s6, t5, t2
                  fclass.s     a6, fa7
                  fadd.s       ft3, fa4, fs3
                  mul          t4, zero, t0
                  fcvt.s.w     fa2, a4, rmm
                  rem          t1, a7, s10
                  sltiu        gp, s5, -1986
                  mulh         a0, s4, s7
                  fcvt.s.w     fa7, t5, rtz
                  fclass.s     a2, fa0
                  sltu         a5, sp, a7
                  fle.s        s1, ft11, fs10
                  fdiv.s       fa3, fs0, fa1, rne
                  ori          a5, s3, -740
                  mulhu        s6, t1, sp
                  sltiu        s3, a1, -1112
                  sltu         a6, s11, a1
                  div          s3, gp, s9
                  fmul.s       fa4, ft5, fs11
                  fsub.s       ft1, ft4, ft2
                  lui          t6, 729805
                  divu         s8, t3, s7
                  slti         s6, a3, 275
                  fsub.s       fs3, fs4, fs2
                  fcvt.wu.s    s10, fs11
                  sltiu        t4, a3, 808
                  sltu         s11, s9, s4
                  fle.s        s8, fa3, ft9
                  nop
                  slt          t3, ra, t6
                  fmv.w.x      ft8, tp
                  fle.s        zero, fs11, fs4
                  fmv.x.w      s3, ft0
                  nop
                  or           t0, zero, a5
                  fclass.s     s8, ft7
                  fadd.s       fs4, fs4, fa5, rmm
                  sra          a3, s5, a2
                  ori          s8, a3, 1544
                  or           s11, s9, s5
                  slli         t1, a4, 1
                  divu         t1, t1, s11
                  fle.s        zero, fs7, fa7
                  slli         a4, t5, 23
                  fcvt.wu.s    ra, ft5, rup
                  sra          a6, s5, t1
                  fmv.w.x      fs8, s0
                  addi         s8, t5, -2003
                  mulh         a6, s9, a5
                  addi         t4, a1, 1094
                  srai         tp, s10, 15
                  fsgnj.s      fs7, ft11, fs10
                  fcvt.s.w     ft9, a2
                  fsub.s       fs1, fa6, ft6, rtz
                  add          t4, sp, gp
                  remu         zero, s9, s6
                  fsub.s       fs0, ft6, fa6
                  fdiv.s       fs2, fs11, fs1, rne
                  fmv.x.w      t4, fs4
                  slti         s6, sp, -1446
                  lui          tp, 745547
                  flt.s        t1, fa4, fa7
                  mulh         a4, zero, a6
                  fle.s        a1, fa4, ft7
                  fmul.s       ft8, ft1, fs4
                  fclass.s     s3, ft0
                  fmul.s       fs1, fa2, fs9
                  mulh         s0, s11, s0
                  slt          s3, a3, s6
                  fsgnj.s      ft1, ft7, ft3
                  srl          t3, s10, s2
                  addi         s0, s5, -326
                  fdiv.s       fs9, fa1, ft4
                  fsgnjn.s     fa4, fs4, fs5
                  fsqrt.s      ft7, fs10, rdn
                  mulhu        t6, t0, s11
                  ori          tp, s8, -259
                  xor          a5, zero, s10
                  ori          s0, s10, -1547
                  div          ra, s3, a5
                  ori          s1, a4, -96
                  xor          t1, a7, s0
                  fcvt.s.w     fa0, s11
                  divu         t6, zero, a4
                  auipc        t4, 870470
                  flt.s        t4, fs1, ft5
                  feq.s        tp, ft7, fs6
                  fdiv.s       fa3, ft4, fs10, rne
                  mulhu        a1, t3, s7
                  rem          t6, s3, s4
                  divu         s3, a7, tp
                  fcvt.s.w     ft1, s2, rup
                  remu         t4, s10, s10
                  div          a7, a4, t1
                  nop
                  fsqrt.s      fa2, ft8
                  addi         a6, s8, -1760
                  xori         gp, a7, -1660
                  lui          t0, 867805
                  slt          s1, a3, a6
                  add          a6, a1, s2
                  fsgnjn.s     fs3, fs5, fs6
                  sub          a4, a6, a7
                  div          a3, t2, a1
                  fle.s        a7, fa0, fa7
                  srli         gp, a1, 2
                  add          a2, a7, a6
                  slti         a2, s3, -285
                  flt.s        a6, fs8, ft0
                  sub          a0, s2, s8
                  fdiv.s       fa0, fs10, ft8, rtz
                  srl          ra, s1, a4
                  fmin.s       fs3, fs10, fa4
                  xori         a5, t5, -364
                  divu         s4, a3, s11
                  auipc        s10, 857204
                  rem          s3, a4, s6
                  auipc        a6, 375083
                  lui          s1, 784125
                  slt          s11, s7, s1
                  fsgnjn.s     fs6, ft9, fa7
                  and          t2, t4, t6
                  rem          s2, s1, s6
                  sll          a3, gp, a0
                  mulh         gp, t6, s0
                  fmax.s       fa5, ft5, fa0
                  fdiv.s       fs7, ft4, ft4, rmm
                  fcvt.w.s     tp, fs3
                  mulh         a3, sp, a2
                  srai         a0, a3, 29
                  or           s0, t6, a7
                  flt.s        a6, ft4, ft1
                  ori          gp, t6, -1545
                  fdiv.s       ft4, fs7, ft0, rtz
                  fmv.x.w      s3, fa6
                  sll          s1, s6, s9
                  addi         s9, t6, -1596
                  xor          gp, s1, s8
                  fle.s        gp, fs3, ft5
                  remu         t4, a7, s10
                  remu         t6, s8, a1
                  mulhu        t0, s0, a2
                  sltu         t2, a4, t5
                  divu         t0, s6, tp
                  sltu         t2, a0, a0
                  fclass.s     s3, fs1
                  xori         tp, s7, -717
                  sltu         a7, t1, s0
                  fsub.s       ft5, fa0, ft5
                  mul          t1, t4, t0
                  sltu         a7, gp, a2
                  fmax.s       fs6, ft9, fs5
                  fadd.s       fs8, fs6, fa6
                  and          t0, t5, t3
                  xori         t6, sp, 56
                  fsgnjx.s     fs10, fa6, ft3
                  xor          zero, s6, a0
                  add          a0, t0, s1
                  fcvt.w.s     t0, ft8
                  fmax.s       ft9, fa0, fa5
                  slti         gp, s3, -539
                  fadd.s       fa5, ft7, ft9
                  add          s4, sp, a3
                  fmin.s       ft7, ft9, ft1
                  nop
                  xori         t0, s0, -817
                  feq.s        a7, fs6, fs10
                  fsgnjn.s     fa0, ft5, fs0
                  fmul.s       fs3, fs11, fa2
                  fsgnj.s      ft8, fs1, fs10
                  fmv.x.w      t2, fs1
                  slt          a0, sp, sp
                  fsqrt.s      ft10, ft0, rdn
                  lui          a3, 163318
                  slt          s0, tp, s8
                  slti         zero, a7, 1219
                  xor          s11, gp, tp
                  fsub.s       ft0, fs4, fs3, rup
                  fcvt.s.wu    fa0, a0
                  mulhsu       ra, a5, t2
                  fsgnjn.s     ft3, fa3, fa1
                  srli         t4, a4, 18
                  div          s10, t4, s2
                  mul          a0, s2, s4
                  srai         s11, s1, 25
                  fadd.s       ft8, fs5, ft0, rdn
                  rem          s10, s11, a1
                  mulhsu       t1, t3, t2
                  sltu         s0, t0, sp
                  sra          s2, s6, s9
                  srl          a0, s3, s2
                  sltiu        t1, s7, -2043
                  add          s7, s4, t0
                  mul          s9, t2, a3
                  fsgnjx.s     fs11, fa1, fa7
                  fsgnj.s      fs6, fs11, fa3
                  xori         a0, s10, 1764
                  fcvt.s.w     fa5, s10
                  div          a3, s11, s5
                  xori         s0, t4, 848
                  fle.s        s10, ft1, fa4
                  sll          t6, a3, s5
                  fcvt.s.w     fa4, t4
                  slli         a1, s8, 9
                  fcvt.s.w     fs4, t1
                  feq.s        t0, ft5, fa2
                  and          t2, t3, s5
                  fmv.w.x      fa6, s1
                  fle.s        s9, ft6, ft6
                  fcvt.s.wu    fs10, s9, rdn
                  fcvt.w.s     s3, fa7
                  srl          s2, s4, t0
                  mulh         a4, zero, t0
                  fmul.s       fs11, fs3, ft11
                  fclass.s     t6, fs4
                  fadd.s       fa4, ft7, fa5
                  fsgnjx.s     fs11, fa2, ft3
                  sltiu        s4, a3, -1332
                  andi         s8, a3, -1159
                  fmul.s       ft9, fs9, fa4, rup
                  slt          s7, s10, t6
                  srl          t1, s8, s6
                  divu         t2, s2, s6
                  flt.s        s10, fs1, fs11
                  srli         a2, a6, 7
                  fclass.s     a1, ft3
                  mulhu        gp, s6, s11
                  fcvt.w.s     s9, ft7, rtz
                  ori          s3, s4, -1680
                  fcvt.wu.s    gp, fa5, rmm
                  ori          t1, s9, 91
                  lui          t1, 670664
                  fsgnj.s      fa4, ft7, ft9
                  divu         s1, a7, gp
                  fcvt.s.wu    ft9, t3, rmm
                  fsub.s       fa4, fa1, fs6
                  sra          a3, a1, s6
                  slti         s8, s5, -1875
                  and          s2, s3, a7
                  fsgnj.s      ft3, fs9, fa2
                  rem          a1, s7, s1
                  fmul.s       fs9, ft6, ft3
                  nop
                  sltu         a4, s9, s1
                  fsub.s       fs2, ft1, ft9, rmm
                  fcvt.wu.s    t6, fs6
                  mul          ra, s4, s11
                  mul          s3, s2, a7
                  xori         s8, t1, -755
                  xori         t3, a0, 682
                  fmax.s       fa2, fs3, fs2
                  fsgnj.s      fs2, fs0, ft10
                  rem          a2, t0, sp
                  add          t0, t4, t0
                  fmin.s       ft3, ft10, fs10
                  ori          s0, s3, 299
                  slt          t0, sp, s0
                  sltiu        t2, ra, 324
                  mulhsu       a2, s11, t3
                  mulh         tp, s3, a5
                  add          a3, s11, t3
                  fsgnjx.s     fa7, ft6, ft7
                  mulhsu       s8, a3, s3
                  fcvt.w.s     s11, ft1
                  fcvt.s.wu    fa6, tp
                  fcvt.wu.s    s4, ft0
                  add          s1, t6, t6
                  xori         s6, s5, 1019
                  srl          s6, t0, a4
                  sub          s3, a5, tp
                  and          s4, gp, a1
                  srai         a4, tp, 13
                  sra          ra, s9, s9
                  fmax.s       fs11, ft9, fs6
                  flt.s        a1, fa5, fs3
                  sltu         a3, a5, t4
                  fclass.s     t3, fs5
                  sltiu        s4, zero, -1033
                  fmv.x.w      t0, ft4
                  srli         ra, zero, 4
                  srai         t1, s8, 29
                  srl          s6, t1, t4
                  fmul.s       fa0, fs11, fs10, rdn
                  add          t1, s10, ra
                  fsqrt.s      fa0, fa4
                  slti         s6, t4, -578
                  sltu         a4, s10, tp
                  divu         zero, s1, t6
                  slt          a3, a7, s4
                  fmv.w.x      fa1, s3
                  fcvt.wu.s    s11, fa3, rne
                  remu         t2, a0, s3
                  auipc        t4, 67384
                  feq.s        s2, fs11, ft4
                  ori          s0, s10, -427
                  mulhu        a3, tp, s0
                  addi         a6, t2, 1798
                  remu         t6, a6, gp
                  and          s2, a3, sp
                  srl          t2, t2, a0
                  feq.s        a2, ft10, fa2
                  fmax.s       fs4, fs8, ft1
                  andi         t0, a4, 2038
                  auipc        t4, 704427
                  mulhsu       s0, s1, t0
                  mulhu        t1, a4, s1
                  addi         s3, ra, -1075
                  sltiu        t0, s3, 2031
                  mulhu        s10, s5, s0
                  mulh         a6, s9, a6
                  feq.s        tp, ft0, ft6
                  mulh         t6, s11, s10
                  fsgnj.s      ft3, ft7, fs1
                  srl          t6, s8, t2
                  sra          a6, s3, t5
                  sltiu        gp, t5, -775
                  andi         s3, t3, -1438
                  fadd.s       fs7, fs8, fs2
                  div          s11, sp, a2
                  or           t2, tp, t4
                  sub          t3, t1, t5
                  divu         s6, s1, s5
                  mulh         tp, t1, s8
                  addi         s10, s11, -1498
                  xor          t4, sp, s5
                  sub          a1, s1, a4
                  fmax.s       fs7, fs11, ft10
                  sltu         ra, s2, sp
                  fsgnj.s      fs8, fa7, ft8
                  mulhsu       a1, t2, s8
                  fclass.s     s7, fs7
                  mulhsu       a5, s2, s4
                  fsqrt.s      ft6, fs11, rmm
                  and          t0, s6, a4
                  lui          a5, 7573
                  andi         a6, s8, 1895
                  fmv.w.x      ft5, s4
                  fmul.s       fs2, ft1, fs8, rtz
                  fcvt.s.wu    fs10, a0, rmm
                  xori         a5, a1, -1688
                  flt.s        a4, fs10, fs1
                  srl          ra, s5, s10
                  addi         zero, s5, 935
                  fcvt.s.wu    fs1, s9
                  remu         a7, s3, t5
                  slli         s6, t5, 4
                  fmv.x.w      tp, fa2
                  xori         a0, t5, -1210
                  fclass.s     t6, fs10
                  srl          a6, a3, t1
                  srai         gp, a3, 15
                  mulhsu       s7, a5, t4
                  mulh         t6, t2, a3
                  or           s6, a5, a5
                  remu         a0, a5, t2
                  fadd.s       fa1, ft2, fs4
                  addi         t6, gp, 1839
                  fsgnjn.s     fs6, fs8, ft2
                  and          a5, s9, t6
                  lui          a6, 430858
                  sub          t4, s9, t6
                  fsgnj.s      ft5, ft6, ft10
                  fle.s        s2, fa2, fa4
                  mulh         s9, s9, s7
                  srai         t3, a1, 18
                  sltiu        a0, s3, 1511
                  fclass.s     ra, fa7
                  sltiu        a7, s5, -759
                  fcvt.w.s     s9, fa1
                  fsgnjn.s     fs4, fa7, fs0
                  srl          t6, a7, a5
                  add          gp, s10, t3
                  sltiu        a3, s10, 1620
                  and          s11, a5, ra
                  srai         zero, s2, 22
                  lui          s1, 1033884
                  sltiu        s4, s5, -475
                  lui          a1, 815909
                  sra          s2, zero, s11
                  fsqrt.s      ft0, fa6, rup
                  fsgnj.s      ft2, fa2, ft11
                  div          a4, a1, s7
                  addi         ra, s9, 1595
                  fcvt.s.wu    ft2, a3
                  xori         s3, s4, 1261
                  fcvt.s.wu    ft10, s4, rdn
                  auipc        t3, 797071
                  srl          t6, s7, s9
                  sra          ra, t2, a7
                  mulh         s1, gp, t0
                  fcvt.s.w     fa3, a7
                  mulhu        t4, t1, a0
                  slli         a1, gp, 24
                  fdiv.s       ft5, ft0, fs1, rne
                  srli         a7, s7, 19
                  srl          t3, a7, gp
                  and          s4, a4, a3
                  sra          t2, a4, a7
                  add          s4, t6, a6
                  slti         s3, a0, 1713
                  fmax.s       fs9, fs1, fa3
                  srai         a3, s8, 24
                  fmv.x.w      s3, ft10
                  fmul.s       fs3, ft9, fs11, rtz
                  lui          s6, 975041
                  mulhu        a4, s8, a5
                  fdiv.s       fs2, ft5, ft11, rne
                  lui          t6, 227302
                  and          t1, zero, gp
                  and          s0, a4, t6
                  fadd.s       fs3, ft2, ft11
                  divu         a1, s1, t3
                  sra          a5, a2, s7
                  fmul.s       fa6, ft0, fa2
                  fcvt.w.s     a5, fs4
                  mulhu        tp, zero, t0
                  fmin.s       fa1, fa3, ft6
                  fcvt.s.wu    ft0, ra
                  fsgnj.s      fs9, fs4, fa4
                  ori          gp, a7, -332
                  feq.s        a6, fs7, fa6
                  lui          t2, 748897
                  mulh         gp, a5, gp
                  fsgnj.s      fs9, ft4, ft9
                  fsgnjn.s     ft11, ft6, fs7
                  sra          s4, a3, s5
                  fcvt.w.s     gp, fa4
                  mulhu        t0, s7, gp
                  fmv.w.x      fs10, t5
                  fmax.s       ft3, fa4, fs10
                  srl          tp, t0, s7
                  fcvt.w.s     a6, fs11, rdn
                  sltiu        t0, a5, -1049
                  remu         tp, a6, s0
                  fcvt.wu.s    t6, ft7
                  fcvt.s.w     fs10, a6
                  fsgnjn.s     ft4, ft2, fa7
                  fmv.x.w      s3, ft4
                  fsgnjx.s     fa0, ft7, ft8
                  sll          a3, a2, s8
                  ori          s3, s2, -1097
                  fadd.s       fa6, ft4, fa6, rdn
                  srl          a5, a3, s6
                  ori          a3, a0, -989
                  ori          s7, a6, 267
                  fsub.s       fs1, fs1, ft6
                  srli         a2, t3, 20
                  sltu         s7, a0, s2
                  sra          t0, a0, s11
                  mulh         t3, s1, t5
                  fdiv.s       fs4, ft10, fa2
                  ori          t1, gp, -1450
                  sra          a0, s1, ra
                  fmax.s       fa1, fs5, ft1
                  fsqrt.s      fa4, ft3
                  fmax.s       ft8, fs8, fs10
                  fsgnjn.s     fs9, fs4, ft9
                  andi         a0, s8, -1627
                  fsgnj.s      fs7, ft6, ft10
                  rem          s2, s1, a4
                  fcvt.s.w     fa0, sp
                  mul          s7, s1, a3
                  fsgnjn.s     fs3, ft0, fs0
                  fle.s        a7, ft5, fs9
                  or           s4, a1, a7
                  sltu         s2, gp, s11
                  fmax.s       fs10, fa2, fs3
                  fmv.w.x      ft10, s8
                  remu         a1, t2, t5
                  fsqrt.s      fs4, ft11, rup
                  fmv.x.w      s8, fa1
                  slt          a5, a1, t0
                  andi         s1, s8, -368
                  slti         t6, s2, -1445
                  fsgnjx.s     ft11, fa5, fs10
                  addi         s7, s3, -1935
                  slli         a3, a7, 27
                  and          a2, a1, ra
                  sra          zero, t1, s0
                  mulh         t2, tp, a2
                  fmin.s       fa6, fa6, fa0
                  mul          s11, t6, s0
                  fclass.s     a4, ft0
                  fadd.s       fs2, fa1, fa3, rne
                  slli         a6, t3, 31
                  andi         s4, s8, -1644
                  fclass.s     a0, fs4
                  fcvt.s.wu    fa2, a2
                  fsub.s       fa2, fa1, fs1, rtz
                  addi         t1, s7, -1895
                  xor          s0, a2, s1
                  feq.s        t4, ft0, fs11
                  feq.s        t1, fs1, fa0
                  fsgnj.s      ft2, ft11, fa0
                  mulhsu       a3, gp, gp
                  fle.s        t0, ft8, fs4
                  andi         s8, s3, 372
                  sltiu        s6, t2, -1923
                  xori         s9, s0, -812
                  rem          tp, t6, ra
                  addi         a2, s2, -1910
                  auipc        tp, 793463
                  remu         tp, sp, s3
                  fmul.s       fa6, fs8, fs1, rdn
                  or           t3, s0, t3
                  fdiv.s       ft0, fs0, fs0, rtz
                  sll          a5, s1, s5
                  add          s1, gp, s5
                  fmv.w.x      ft3, gp
                  fmax.s       fs10, fs10, fa5
                  sltiu        a4, t1, 1929
                  fmin.s       fs4, fa2, fs8
                  addi         t2, s6, -850
                  auipc        s9, 227262
                  lui          s3, 901870
                  xor          s9, s9, s2
                  div          a2, a0, t6
                  add          s7, s0, t1
                  rem          s0, a7, t5
                  or           ra, tp, s1
                  nop
                  divu         s2, a1, s10
                  flt.s        s2, fs5, fs11
                  fle.s        a7, ft1, ft1
                  srl          t2, s2, a4
                  fcvt.wu.s    a2, fs1
                  andi         t1, a5, -1151
                  sra          s8, s3, t6
                  divu         s2, s0, s6
                  rem          t0, a5, t1
                  mul          a2, s6, tp
                  sll          a1, a5, a0
                  lui          a1, 727534
                  mul          s8, t6, sp
                  fmax.s       fs7, fa4, ft9
                  sltiu        a2, s11, 855
                  lui          tp, 299538
                  mulhsu       s1, s5, a5
                  xor          a7, t6, s8
                  sub          a5, s11, s8
                  rem          a5, a4, t0
                  slti         s4, s1, -752
                  lui          s6, 242790
                  mulh         t4, zero, a7
                  and          t1, s5, t2
                  xor          s8, a3, a6
                  xori         a5, zero, 535
                  fmv.w.x      fs3, a2
                  srai         s4, s10, 3
                  sll          s9, s2, s8
                  ori          s10, gp, -573
                  add          s10, s3, a5
                  fsgnj.s      fs1, fs8, fa1
                  fcvt.s.w     ft9, t3, rtz
                  mulhu        s11, a4, t5
                  xor          a3, t3, zero
                  or           s3, s7, a0
                  or           a3, s10, s4
                  fcvt.s.wu    fs5, a5, rne
                  and          s10, sp, s3
                  mul          s10, a4, t3
                  srli         a6, t1, 21
                  fcvt.wu.s    s7, fs3, rmm
                  divu         t6, a4, s10
                  mulhu        s2, t0, sp
                  slt          t6, a7, s7
                  mulh         s0, s0, sp
                  fmax.s       fs6, fa3, ft8
                  mulh         ra, a3, a5
                  add          s4, a5, zero
                  sltu         t2, ra, s10
                  fcvt.s.wu    fa3, t0
                  mulh         gp, sp, s5
                  sub          a2, s3, s2
                  sll          t3, t5, ra
                  fmul.s       ft7, fs0, fs5
                  fcvt.wu.s    s0, fs11, rdn
                  feq.s        s7, ft6, ft2
                  addi         a7, s8, -607
                  rem          tp, t2, s11
                  feq.s        t0, fs7, fa0
                  mul          ra, s3, s8
                  and          gp, tp, s2
                  andi         a5, s0, -83
                  fsgnjx.s     ft9, ft6, fs4
                  fsgnjx.s     fa0, ft4, fa5
                  fsgnjn.s     fs7, ft2, ft2
                  fmul.s       fa0, ft4, ft7
                  sltiu        s7, a5, 605
                  ori          s11, s1, -672
                  remu         tp, s10, a2
                  slli         a2, s3, 15
                  fmul.s       fs6, fa1, fa1, rdn
                  remu         a5, a0, s1
                  sll          t3, s4, tp
                  fsub.s       ft3, ft3, fa4, rmm
                  fcvt.s.w     fa2, s1, rmm
                  fsgnjx.s     fa2, fs6, ft10
                  fdiv.s       ft11, fs5, fs5
                  mul          t2, t5, t5
                  divu         a4, ra, t4
                  srli         s11, t5, 7
                  xori         s2, tp, 217
                  remu         s10, t1, t4
                  fmv.w.x      ft3, ra
                  fclass.s     t3, fs3
                  fcvt.w.s     t6, fs2, rdn
                  fcvt.wu.s    t0, ft10, rup
                  fmul.s       fa3, ft7, fs11
                  mulhsu       zero, s1, t1
                  sltu         a4, s11, s7
                  andi         a0, a2, 156
                  mulhu        a3, s0, zero
                  ori          t6, a0, 1063
                  flt.s        a1, fa0, fs6
                  srli         a7, s5, 14
                  xor          s6, a6, s5
                  fdiv.s       ft0, fs4, ft5
                  fcvt.s.w     ft3, a7, rdn
                  fadd.s       fs6, ft3, ft7
                  sub          s11, s11, a4
                  fle.s        s0, fs11, fs4
                  slli         s1, t4, 15
                  fsub.s       ft2, fs3, ft5, rtz
                  sll          a4, t2, tp
                  fmax.s       fa3, fa6, fs11
                  feq.s        a7, fa2, fs7
                  fsub.s       ft8, ft2, fs4, rup
                  fcvt.wu.s    s7, ft4
                  fsqrt.s      fs4, fa6
                  add          tp, s4, s9
                  fsub.s       fa5, ft4, fs6
                  auipc        a2, 148230
                  add          s2, s1, zero
                  mulh         s10, s2, s2
                  srli         s6, t6, 3
                  mulhsu       a4, zero, s4
                  fsub.s       ft0, fs3, ft1
                  mulh         s9, sp, s3
                  fsub.s       fs1, ft3, ft0
                  slti         s11, zero, -1320
                  fcvt.w.s     a4, fs10, rtz
                  div          a4, a5, s1
                  sub          gp, s10, s11
                  add          a4, s3, s6
                  fcvt.w.s     a0, fs5
                  fmul.s       ft4, ft3, fs4, rup
                  fadd.s       ft8, fa4, fs2, rdn
                  fdiv.s       fa2, fs7, ft4, rup
                  rem          a0, s3, t6
                  div          s3, s11, a5
                  fcvt.wu.s    gp, fa4
                  mul          s11, tp, a4
                  fcvt.s.wu    ft3, t0, rup
                  fsqrt.s      fs7, ft3, rne
                  sltiu        a6, s11, 1080
                  auipc        t3, 961046
                  remu         s9, s2, sp
                  lui          t0, 239494
                  andi         a3, sp, 379
                  and          s8, sp, t6
                  xori         gp, s10, -368
                  fadd.s       fa1, ft11, fs1
                  sll          s1, a1, sp
                  fcvt.s.wu    fa7, t6
                  fadd.s       fs6, fs2, fa2
                  feq.s        a5, fs5, fa2
                  fcvt.s.wu    fs8, s6
                  div          a5, s5, s1
                  add          a5, t2, s9
                  feq.s        t0, fs8, ft5
                  nop
                  fle.s        s4, fs3, ft4
                  add          a6, s3, a5
                  mulh         a5, a6, s1
                  ori          t3, a6, 801
                  and          s10, t6, gp
                  fsgnjx.s     fs0, fs8, ft2
                  fdiv.s       ft2, fa2, ft11, rtz
                  srai         tp, tp, 17
                  mulhsu       t6, ra, s1
                  fcvt.s.wu    ft11, s2, rmm
                  lui          t4, 600793
                  fmul.s       ft7, fs7, ft6
                  addi         t2, a0, 1076
                  slti         s0, t6, 1798
                  fmin.s       fs4, fs3, ft7
                  fcvt.s.w     ft3, a1
                  remu         t4, t4, a4
                  fmv.w.x      fa4, t2
                  flt.s        tp, ft3, fs4
                  sra          zero, tp, zero
                  sub          t3, s6, a2
                  div          a2, t5, a1
                  fsgnjn.s     fs5, fs8, fs0
                  fcvt.wu.s    t3, ft10, rne
                  sra          a7, a1, zero
                  fmv.w.x      fs3, s3
                  mulh         a4, s4, zero
                  fsgnjx.s     fa3, ft0, fa5
                  fsub.s       fa6, fs5, ft7
                  fclass.s     s1, fs2
                  fsqrt.s      fs11, fs2
                  fmin.s       fs10, fa7, ft4
                  xori         s6, t5, -1992
                  flt.s        s6, fa2, fs6
                  fclass.s     a7, fs10
                  fcvt.w.s     s10, fs5, rdn
                  sltiu        a7, gp, -1090
                  fsgnjx.s     fa5, fs6, fa6
                  sub          s10, s1, zero
                  fmv.x.w      a4, ft11
                  fdiv.s       ft0, fs9, ft3, rne
                  or           t3, tp, t5
                  rem          s4, s8, s4
                  slti         a6, ra, -1533
                  mulh         a0, t0, zero
                  fclass.s     t6, ft9
                  lui          t6, 348907
                  slli         s9, a1, 27
                  fmul.s       fa6, fs3, fs0, rdn
                  sub          t3, a4, a2
                  xori         a5, s8, 902
                  addi         a4, t3, 13
                  fcvt.s.w     fs4, a6, rdn
                  feq.s        s6, ft1, fa7
                  sll          ra, s9, s5
                  lui          a7, 20498
                  nop
                  add          s0, ra, s1
                  feq.s        s0, fs11, fa2
                  addi         t2, s8, -260
                  fdiv.s       ft5, fa1, ft6
                  slt          s3, tp, t4
                  xor          a6, s6, s8
                  fmv.w.x      fs5, a4
                  fsqrt.s      ft9, fa1
                  sra          a7, s3, s2
                  or           a1, t0, t2
                  xori         s11, tp, 1696
                  div          s8, s9, a1
                  fsgnjn.s     fs2, fa0, ft10
                  remu         a0, gp, t4
                  fadd.s       ft4, ft7, fs0, rup
                  fmv.x.w      s11, fs2
                  fsub.s       fa5, fs0, fa0
                  fcvt.s.w     fs7, a4, rdn
                  srl          gp, a4, tp
                  fmul.s       ft2, fa1, fs2
                  addi         tp, ra, 2023
                  nop
                  addi         s11, s7, -1390
                  flt.s        s3, fs6, ft2
                  fmul.s       ft9, fs5, fa7, rne
                  fcvt.s.w     fs10, s5
                  srl          gp, s7, a6
                  fadd.s       fs11, ft7, fa5, rtz
                  andi         s9, tp, 1266
                  srai         t6, zero, 31
                  fcvt.s.wu    fs5, s0
                  and          s3, t6, s8
                  fsub.s       fs9, ft6, fa2, rne
                  slti         zero, s6, -1564
                  srl          s2, s4, a5
                  addi         t1, s9, 1783
                  srl          tp, t4, s8
                  ori          s10, t0, 1752
                  and          zero, zero, s2
                  srl          ra, t1, a2
                  fmv.x.w      s10, fa0
                  or           t6, s5, ra
                  lui          a6, 675180
                  slti         a5, t0, 1792
                  slli         s2, a0, 6
                  add          a0, s4, tp
                  fsgnjx.s     fa0, fa7, fs4
                  div          s2, a7, s9
                  fcvt.wu.s    t6, fs8
                  lui          a2, 131028
                  fcvt.wu.s    tp, fs6, rtz
                  mul          a7, s10, t5
                  div          s8, t5, s3
                  fsgnjx.s     fs1, fa6, fs0
                  xori         a1, t4, 1080
                  fsub.s       fs1, fs10, fa2
                  fsub.s       fs0, ft0, fs0, rmm
                  fsgnj.s      fa5, fa3, fs9
                  or           tp, a1, s8
                  fadd.s       fs4, fa0, fa4, rup
                  sub          a7, t1, a4
                  fsgnj.s      ft8, ft10, fs2
                  auipc        s4, 707104
                  add          s7, s9, t0
                  fsgnj.s      fs7, fa0, ft3
                  fmul.s       fa1, fs1, fa7
                  fdiv.s       fa1, fa3, fs10, rmm
                  srai         s10, s2, 4
                  fsgnjx.s     fs3, fa3, ft9
                  nop
                  fsub.s       ft6, ft8, ft8
                  fsqrt.s      fs6, ft9, rdn
                  fclass.s     s11, fs2
                  fmax.s       fa3, fs4, fa2
                  mul          a1, t0, t0
                  div          s1, ra, s9
                  fcvt.wu.s    s7, fa2
                  fadd.s       ft2, fs8, fa5, rne
                  fmv.w.x      fa0, s11
                  slti         t2, s4, 392
                  mulhsu       a7, s11, t3
                  div          a2, t2, a7
                  xori         t0, a5, 2027
                  add          s4, t3, s9
                  fcvt.wu.s    t6, fs4
                  remu         s9, a1, s6
                  slti         s10, t0, 908
                  rem          s11, t2, a7
                  slt          s8, t2, a4
                  fadd.s       ft8, ft2, fs10, rne
                  slti         tp, sp, 114
                  fcvt.s.wu    ft2, t1
                  feq.s        a0, ft9, fs11
                  divu         s1, gp, s6
                  srl          s6, a1, t0
                  sll          s0, t4, s3
                  add          tp, s3, s0
                  xor          s6, s3, s4
                  xor          t1, a2, gp
                  xor          t3, a0, a1
                  divu         a1, s0, s11
                  fdiv.s       fs9, fa6, fs2, rne
                  andi         t4, sp, 1888
                  fdiv.s       ft5, fs4, ft7
                  fsgnjx.s     fs4, fs10, fs2
                  remu         s11, t2, s0
                  slli         s10, ra, 16
                  nop
                  sltiu        t2, s4, 538
                  flt.s        a0, ft10, fs4
                  remu         a4, s5, t3
                  fmv.x.w      a1, fs11
                  sub          s7, gp, t4
                  flt.s        t4, fs1, fs8
                  add          t4, s1, s10
                  lui          a3, 399336
                  fmv.x.w      s1, ft11
                  auipc        s2, 471180
                  divu         t3, s6, t0
                  or           a2, s9, t1
                  fsgnjn.s     ft6, fa3, fs4
                  ori          s2, s1, 1788
                  sltiu        zero, t4, -1046
                  srli         zero, a3, 28
                  ori          s1, sp, 1166
                  slt          t3, s9, ra
                  xori         a2, t0, 964
                  fcvt.s.wu    ft1, s8, rup
                  fadd.s       fs2, fs8, fs7
                  sll          t6, a6, t4
                  mulh         s6, t2, t4
                  fsgnjn.s     fa6, ft3, fs9
                  fcvt.wu.s    a2, ft10, rne
                  fmv.x.w      s3, ft7
                  sltu         s10, a1, gp
                  sll          t4, sp, tp
                  fmv.w.x      fa7, t3
                  add          s10, tp, t2
                  slt          s2, a5, s8
                  fmul.s       fa3, ft5, fs8
                  fsgnjx.s     ft1, fs8, fa2
                  mul          ra, ra, s3
                  ori          a1, s5, -250
                  slli         s2, s3, 17
                  rem          s10, s7, zero
                  mulh         t3, s4, a3
                  srai         a1, s8, 17
                  ori          a0, a4, 1131
                  srl          a7, a5, t4
                  srai         s1, zero, 3
                  srai         s9, s1, 7
                  mulhsu       s11, s5, t6
                  fmin.s       ft1, ft0, ft8
                  fmv.w.x      ft10, sp
                  sra          s8, s1, ra
                  fsgnjn.s     ft6, ft7, fa3
                  slti         zero, a6, 707
                  fclass.s     gp, fs5
                  sll          a0, a1, a6
                  fcvt.wu.s    a0, ft8
                  sra          a6, sp, a0
                  and          s2, a7, zero
                  sub          a5, s0, s0
                  nop
                  slt          s8, s1, s10
                  fmul.s       fs2, ft6, ft7, rup
                  slli         ra, a6, 20
                  fmul.s       ft4, fa5, fa0
                  fmul.s       fs0, ft2, fs3
                  fmin.s       fa6, ft4, ft11
                  mul          a5, a0, a5
                  fclass.s     s9, ft11
                  mulh         a7, t2, t5
                  sub          a6, s1, s11
                  andi         gp, s2, 1747
                  fsqrt.s      fs11, fs8, rne
                  fcvt.s.w     fa4, t2
                  xor          a7, tp, s6
                  fcvt.wu.s    a5, ft7
                  sltiu        t4, s2, -1102
                  mulhu        tp, s6, a6
                  fsub.s       fa6, fs9, fs6, rup
                  slli         s3, t0, 12
                  fcvt.s.wu    fs5, ra
                  srl          s10, a1, a2
                  fcvt.s.wu    ft7, a1, rne
                  feq.s        a1, ft7, fa5
                  divu         a5, t2, ra
                  lui          a2, 770964
                  sltu         a0, s11, a6
                  sub          t0, s3, a7
                  divu         s7, s8, s9
                  fsub.s       fs6, ft3, fs7, rne
                  slt          s6, s0, s1
                  or           t3, s11, s0
                  srli         a7, s11, 11
                  feq.s        s1, fs11, ft7
                  xor          gp, s3, a6
                  srli         s2, s2, 18
                  fcvt.w.s     t1, ft11
                  fsgnjn.s     fa7, fa2, fs5
                  fsub.s       fa3, ft3, fa5
                  div          a2, a0, a5
                  sll          s3, s6, t1
                  sra          t4, t6, s2
                  fdiv.s       ft7, fa5, ft4, rdn
                  sub          a0, a1, a3
                  slt          a5, gp, a5
                  sub          gp, a3, t5
                  fle.s        a7, ft7, fs2
                  flt.s        s0, ft0, fa3
                  auipc        t4, 909751
                  fsub.s       fs7, fs7, fs10, rdn
                  fsgnj.s      fs11, ft9, fs0
                  srli         s11, s5, 26
                  fmul.s       ft10, ft7, ft5
                  div          s4, s8, s11
                  fmin.s       fs5, ft8, ft3
                  ori          s10, a6, 858
                  rem          t2, s5, s3
                  srl          a3, s2, gp
                  fcvt.s.wu    fa6, s7, rtz
                  sltu         s6, s11, t1
                  fcvt.s.wu    fa6, t2, rdn
                  srli         ra, a7, 28
                  srai         a6, gp, 18
                  ori          s8, t6, 1674
                  fcvt.w.s     s6, fs2, rdn
                  feq.s        s10, ft2, ft8
                  fsub.s       ft5, fs7, fs4, rmm
                  fcvt.s.wu    fa0, s3
                  fcvt.w.s     a1, ft8, rtz
                  addi         s8, s5, -1220
                  fle.s        a7, fs6, fs0
                  srai         ra, s9, 18
                  sub          t6, s0, t4
                  fmax.s       fs5, fs10, fs2
                  nop
                  ori          a5, t3, -269
                  or           a3, a7, s3
                  slt          zero, s4, s1
                  fcvt.s.w     fs0, tp, rmm
                  xori         s6, gp, 525
                  sll          a1, a3, t3
                  and          t4, s1, s8
                  fmv.x.w      a4, ft7
                  flt.s        s3, fs7, fs7
                  srl          a0, t6, s7
                  fcvt.wu.s    t6, fs8, rmm
                  addi         zero, a5, -2034
                  srli         a0, s8, 3
                  fsqrt.s      ft10, fs6
                  andi         s9, sp, 896
                  slli         tp, a7, 0
                  div          a6, ra, s3
                  fle.s        a4, ft4, fs10
                  fsgnjn.s     ft9, fs2, ft6
                  div          zero, a1, s4
                  fcvt.wu.s    gp, ft11, rup
                  sltiu        s7, zero, 585
                  div          a1, t4, a5
                  fmv.w.x      ft2, t6
                  fsgnjx.s     fa6, fs0, fa5
                  sltu         tp, gp, s10
                  fmax.s       fa4, ft8, ft11
                  addi         gp, a2, 1933
                  remu         s11, t0, ra
                  mulhu        gp, s2, s4
                  divu         tp, s2, t2
                  xor          t0, s7, s7
                  and          a6, t3, t4
                  srai         t0, t1, 5
                  fcvt.s.w     fs7, t2
                  xor          s0, s4, a5
                  sltiu        a3, s1, 689
                  fmin.s       ft5, fa6, fs8
                  srai         tp, a6, 27
                  fcvt.s.w     fs5, s1
                  xor          a4, ra, a4
                  slli         zero, t4, 30
                  fdiv.s       ft7, fs11, fs0
                  fmv.x.w      s10, ft4
                  srli         s3, a7, 27
                  addi         a7, s8, 25
                  fmv.x.w      s10, ft9
                  sltiu        s11, s4, -1003
                  srli         t2, s10, 16
                  rem          gp, t4, a4
                  fmv.x.w      s7, fa7
                  feq.s        a6, ft9, ft6
                  srai         s0, a4, 27
                  sra          s9, t1, t0
                  div          a3, t3, a2
                  ori          tp, s9, -1976
                  fcvt.s.w     ft5, sp, rmm
                  mulhsu       s10, s5, a6
                  mulhu        s0, t6, s0
                  xori         t6, s8, 573
                  fmul.s       fs6, ft3, ft7
                  srl          s4, a4, sp
                  sltiu        ra, t0, 922
                  sub          a3, s7, s2
                  xori         tp, t0, -960
                  fsgnjx.s     ft10, ft8, fs4
                  mulhu        s3, tp, t0
                  xor          a7, t1, a2
                  sub          s4, zero, a7
                  fadd.s       fs7, fa3, ft3
                  fadd.s       ft3, fa1, fs8, rne
                  srli         tp, a7, 10
                  fcvt.s.wu    fs7, t6
                  addi         t0, a6, -1074
                  andi         s3, a5, 1729
                  srli         a0, t5, 19
                  sll          t0, t5, s11
                  divu         s11, t3, a5
                  rem          t3, sp, ra
                  srai         ra, t2, 20
                  fsub.s       fs5, fs5, fa2, rdn
                  fcvt.wu.s    t0, fs3, rup
                  fsgnjn.s     fa4, ft10, ft10
                  and          s4, a1, s9
                  sll          zero, s0, a3
                  xor          tp, zero, s4
                  fmv.x.w      t4, fs8
                  srl          a6, t3, sp
                  flt.s        t1, fs5, fa0
                  mul          s2, s6, t6
                  slt          tp, s6, t4
                  add          a4, t3, s11
                  srl          s6, t0, a2
                  ori          t6, a4, -554
                  fmv.x.w      a7, ft1
                  slli         s11, a3, 5
                  fsgnjx.s     fs5, fs8, fs3
                  srai         ra, s6, 24
                  fcvt.s.wu    fs7, a7, rup
                  fcvt.s.wu    fs6, zero
                  mulh         s2, sp, s4
                  sltiu        t1, a1, -20
                  fsgnjn.s     fa3, ft1, ft3
                  fcvt.s.wu    fs10, t3, rdn
                  srai         a3, t5, 10
                  fle.s        s7, ft6, ft9
                  flt.s        t0, ft2, ft1
                  div          t0, s11, zero
                  divu         t6, t5, a3
                  ori          gp, s2, -1537
                  nop
                  srai         t0, gp, 11
                  or           s7, s9, t4
                  fsub.s       fa1, fa2, ft7
                  ori          s0, s6, 832
                  srli         s0, s8, 14
                  sub          a4, s7, s2
                  xori         s4, s10, 543
                  auipc        a2, 351899
                  mulhu        a5, s1, t6
                  fsgnjx.s     ft0, fs11, ft0
                  remu         a0, t5, t1
                  feq.s        s6, fa1, fs6
                  remu         s6, a1, a3
                  flt.s        t2, fs4, fs4
                  slti         a5, t6, 1859
                  and          a4, a1, s2
                  fmul.s       ft7, fa7, ft5
                  add          t6, a4, s2
                  ori          a5, s7, -1030
                  lui          a3, 835380
                  fclass.s     a4, ft9
                  sltiu        a7, s5, 694
                  div          s8, a3, a1
                  xor          t1, s6, t4
                  fsgnj.s      ft0, fs0, ft10
                  fmin.s       ft5, fa0, ft2
                  fsqrt.s      ft3, ft7
                  fclass.s     a0, ft7
                  mul          s11, s2, sp
                  divu         tp, s4, t2
                  mulhu        t4, sp, a5
                  flt.s        s10, fs9, ft10
                  srl          a3, s9, s0
                  auipc        s4, 801910
                  mul          t0, s4, s3
                  fsgnjx.s     fs0, fs1, ft8
                  slli         s4, s5, 17
                  fmv.w.x      fs5, s4
                  flt.s        s1, ft7, ft5
                  fsgnjx.s     fa7, fs1, ft6
                  sltu         s0, t0, s1
                  sub          a0, t1, sp
                  mulhsu       s8, a5, s5
                  slti         a0, a3, -467
                  sub          t1, s11, a3
                  and          s2, s7, s6
                  andi         a3, t4, 1457
                  mulh         t3, t5, a0
                  slt          t3, a6, sp
                  fsqrt.s      ft11, fa1, rup
                  sltu         a3, sp, a4
                  fdiv.s       ft11, fa6, fs1
                  fsgnjn.s     ft2, ft3, fa7
                  add          zero, t3, s9
                  andi         s2, t6, 371
                  fcvt.wu.s    t3, ft6, rdn
                  ori          s1, t3, -1019
                  fsqrt.s      fs0, fa0, rup
                  sltiu        a5, a0, 438
                  fmv.x.w      a4, fs10
                  lui          tp, 855694
                  mulhu        gp, ra, s6
                  mul          s4, t2, a6
                  nop
                  addi         t0, t2, -191
                  sra          s1, s8, t6
                  fmax.s       ft10, ft0, fs8
                  sra          s0, t5, t4
                  mul          s9, s6, t6
                  fle.s        s0, fs0, fs3
                  sltiu        s7, gp, 1755
                  fcvt.w.s     s4, ft8
                  sll          t2, s0, a0
                  sll          s8, a1, gp
                  sub          s10, s8, sp
                  srl          s8, a2, s7
                  sra          tp, t0, s0
                  fsgnjx.s     fa2, ft4, ft11
                  fsgnjn.s     fs9, ft3, fa2
                  sltiu        t6, s0, -760
                  fcvt.s.wu    fs11, s9
                  fsqrt.s      fs3, ft11, rne
                  nop
                  fsub.s       fa4, fa2, fa7
                  addi         s8, gp, 270
                  fmul.s       ft1, fs2, fa7
                  slli         a5, s10, 13
                  fmin.s       ft9, fs3, ft2
                  fsqrt.s      ft4, ft5
                  andi         a5, s2, -1324
                  fle.s        s2, ft3, fs8
                  fdiv.s       ft0, fa5, fa1
                  mulhsu       s4, ra, a4
                  feq.s        a3, ft1, fs11
                  andi         a3, a2, -97
                  fcvt.wu.s    s0, ft4
                  add          s8, tp, gp
                  sll          a3, s0, t0
                  sltu         a2, t0, t6
                  fcvt.w.s     s4, ft0
                  slt          a7, a6, s5
                  lui          a0, 176775
                  fsgnj.s      fs4, fa3, fs4
                  sll          a1, t3, t6
                  and          tp, a3, a0
                  fcvt.s.w     fs9, t2, rtz
                  fmul.s       fs10, fa4, fa4
                  lui          s11, 163874
                  mulhsu       s3, sp, a6
                  sltiu        s4, a1, 1382
                  fsgnjn.s     ft10, fs10, ft5
                  andi         s10, t0, -65
                  remu         a7, t4, s6
                  fcvt.wu.s    a4, fa3
                  slti         tp, s5, 179
                  and          a4, s8, s8
                  fsgnjx.s     fa0, fs10, fs11
                  and          zero, gp, s3
                  fmax.s       ft7, fa1, ft5
                  nop
                  andi         a4, tp, -1495
                  addi         t4, a4, 1185
                  fmax.s       fs10, ft3, fs6
                  fsub.s       fs1, fs9, ft3, rup
                  srli         s1, s8, 1
                  fmul.s       fs4, ft10, fa5
                  mulhsu       zero, a2, a3
                  srli         gp, s7, 23
                  sub          t1, a5, sp
                  andi         gp, t1, -1592
                  sltiu        tp, s7, 834
                  fmax.s       ft10, ft10, ft5
                  fadd.s       fs10, fs5, fs7
                  srli         s1, tp, 25
                  mulhu        s10, t2, s10
                  srl          s7, a2, t1
                  fmv.w.x      fs1, a3
                  rem          t3, a0, s5
                  nop
                  fclass.s     gp, fa5
                  fmul.s       fs3, fs5, ft10
                  add          tp, a7, a7
                  mul          s3, t5, s2
                  and          a0, s1, s8
                  fsub.s       fs11, fa5, fs9, rdn
                  srli         t6, t3, 22
                  slt          a1, sp, s5
                  fmin.s       ft11, ft5, ft2
                  slti         ra, t6, -397
                  xori         s0, a1, -852
                  feq.s        t6, fs6, ft2
                  slli         s8, s1, 29
                  srl          a2, t3, s3
                  flt.s        s8, fs5, ft11
                  rem          s7, t2, sp
                  srl          a7, s9, ra
                  la x21, test_done
                  jalr x0, x21, 0
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
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_2:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_3:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_4:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_5:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_6:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_7:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_8:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_9:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_10:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_11:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_12:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_13:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_14:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_15:
                  addi x30, x30, -4
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

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
                  sw  x2, (x30)
                  add x2, x30, zero
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
                  add x30, x2, zero
                  csrr x5, 0x341 # MEPC
                  csrr x5, 0x342 # MCAUSE
                  li x14, 0x3 # BREAKPOINT
                  beq x5, x14, ebreak_handler
                  li x14, 0x8 # ECALL_UMODE
                  beq x5, x14, ecall_handler
                  li x14, 0x9 # ECALL_SMODE
                  beq x5, x14, ecall_handler
                  li x14, 0xb # ECALL_MMODE
                  beq x5, x14, ecall_handler
                  li x14, 0x1
                  beq x5, x14, instr_fault_handler
                  li x14, 0x5
                  beq x5, x14, load_fault_handler
                  li x14, 0x7
                  beq x5, x14, store_fault_handler
                  li x14, 0xc
                  beq x5, x14, pt_fault_handler
                  li x14, 0xd
                  beq x5, x14, pt_fault_handler
                  li x14, 0xf
                  beq x5, x14, pt_fault_handler
                  li x14, 0x2 # ILLEGAL_INSTRUCTION
                  beq x5, x14, illegal_instr_handler
                  csrr x14, 0x343 # MTVAL
                  1: la x21, test_done
                  jalr x1, x21, 0

ecall_handler:    
                  la x5, _start
                  sw x0, 0(x5)
                  sw x1, 4(x5)
                  sw x2, 8(x5)
                  sw x3, 12(x5)
                  sw x4, 16(x5)
                  sw x5, 20(x5)
                  sw x6, 24(x5)
                  sw x7, 28(x5)
                  sw x8, 32(x5)
                  sw x9, 36(x5)
                  sw x10, 40(x5)
                  sw x11, 44(x5)
                  sw x12, 48(x5)
                  sw x13, 52(x5)
                  sw x14, 56(x5)
                  sw x15, 60(x5)
                  sw x16, 64(x5)
                  sw x17, 68(x5)
                  sw x18, 72(x5)
                  sw x19, 76(x5)
                  sw x20, 80(x5)
                  sw x21, 84(x5)
                  sw x22, 88(x5)
                  sw x23, 92(x5)
                  sw x24, 96(x5)
                  sw x25, 100(x5)
                  sw x26, 104(x5)
                  sw x27, 108(x5)
                  sw x28, 112(x5)
                  sw x29, 116(x5)
                  sw x30, 120(x5)
                  sw x31, 124(x5)
                  la x21, write_tohost
                  jalr x0, x21, 0

instr_fault_handler:
                  add x2, x30, zero
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
                  add x30, x2, zero
                  lw  x2, (x30)
                  addi x30, x30, 4
                  mret

load_fault_handler:
                  add x2, x30, zero
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
                  add x30, x2, zero
                  lw  x2, (x30)
                  addi x30, x30, 4
                  mret

store_fault_handler:
                  add x2, x30, zero
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
                  add x30, x2, zero
                  lw  x2, (x30)
                  addi x30, x30, 4
                  mret

ebreak_handler:   
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x2, x30, zero
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
                  add x30, x2, zero
                  lw  x2, (x30)
                  addi x30, x30, 4
                  mret

illegal_instr_handler:
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x2, x30, zero
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
                  add x30, x2, zero
                  lw  x2, (x30)
                  addi x30, x30, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x5, 0x300 # MSTATUS;
                  csrr  x5, 0x304 # MIE;
                  csrr  x5, 0x344 # MIP;
                  csrrc x5, 0x344, x5 # MIP;
                  add x2, x30, zero
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
                  add x30, x2, zero
                  lw  x2, (x30)
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
