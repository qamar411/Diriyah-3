.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x15, h0_start
jalr x0, x15, 0
h0_start:
                  li x14, 0x40001120
                  csrw 0x301, x14
kernel_sp:        
                  la x4, kernel_stack_end

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
                  li x14, 2147483648
                  fmv.w.x f0, x14
                  li x14, 2155445440
                  fmv.w.x f1, x14
                  li x14, 2139095039
                  fmv.w.x f2, x14
                  li x14, 4286578688
                  fmv.w.x f3, x14
                  li x14, 2152886
                  fmv.w.x f4, x14
                  li x14, 2151251962
                  fmv.w.x f5, x14
                  li x14, 7329092
                  fmv.w.x f6, x14
                  li x14, 92255556
                  fmv.w.x f7, x14
                  li x14, 2147483648
                  fmv.w.x f8, x14
                  li x14, 2153042344
                  fmv.w.x f9, x14
                  li x14, 3895667736
                  fmv.w.x f10, x14
                  li x14, 2222152877
                  fmv.w.x f11, x14
                  li x14, 2147483648
                  fmv.w.x f12, x14
                  li x14, 0
                  fmv.w.x f13, x14
                  li x14, 2139095039
                  fmv.w.x f14, x14
                  li x14, 4286578688
                  fmv.w.x f15, x14
                  li x14, 2139095039
                  fmv.w.x f16, x14
                  li x14, 7083099
                  fmv.w.x f17, x14
                  li x14, 4286578687
                  fmv.w.x f18, x14
                  li x14, 5503385
                  fmv.w.x f19, x14
                  li x14, 3336770091
                  fmv.w.x f20, x14
                  li x14, 1177111415
                  fmv.w.x f21, x14
                  li x14, 2139095040
                  fmv.w.x f22, x14
                  li x14, 4286578687
                  fmv.w.x f23, x14
                  li x14, 3365989
                  fmv.w.x f24, x14
                  li x14, 2139095041
                  fmv.w.x f25, x14
                  li x14, 2153499057
                  fmv.w.x f26, x14
                  li x14, 2139095040
                  fmv.w.x f27, x14
                  li x14, 4286578688
                  fmv.w.x f28, x14
                  li x14, 2994145627
                  fmv.w.x f29, x14
                  li x14, 2139095040
                  fmv.w.x f30, x14
                  li x14, 4017156788
                  fmv.w.x f31, x14
                  fsrmi 4
                  li x0, 0x0
                  li x1, 0xa23bda59
                  li x2, 0xe59b11de
                  li x3, 0x0
                  li x5, 0xf21c607c
                  li x6, 0x80000000
                  li x7, 0x0
                  li x8, 0x0
                  li x9, 0x80000000
                  li x10, 0xf1f45156
                  li x11, 0x9
                  li x12, 0xf289f00e
                  li x13, 0x0
                  li x14, 0x0
                  li x15, 0x80000000
                  li x16, 0xd4197a44
                  li x17, 0xb
                  li x18, 0x5
                  li x19, 0x7
                  li x20, 0x9
                  li x21, 0x6
                  li x22, 0xa4d3f646
                  li x23, 0x0
                  li x24, 0xf
                  li x25, 0xd79efe6
                  li x26, 0x80000000
                  li x27, 0xf4c97a7f
                  li x28, 0xd
                  li x29, 0xc
                  li x31, 0x0
                  la x30, user_stack_end
main:             and          a2, ra, t4
                  fsub.s       fs6, fa3, fs10, rtz
                  remu         s2, s7, t4
                  rem          t6, a4, sp
                  addi         s9, s8, 987
                  mulhsu       s8, t4, s5
                  lui          s3, 336048
                  rem          t1, s10, gp
                  remu         zero, zero, t4
                  sra          s0, t2, t4
                  fmin.s       fa7, ft1, fa6
                  fclass.s     s9, fs9
                  xori         t4, s9, 1244
                  sub          s1, ra, s8
                  fmul.s       fa1, fs9, ft3, rmm
                  fsgnjn.s     fs4, fa0, fs4
                  xori         a6, s11, -80
                  fmax.s       fs5, fs3, ft9
                  xori         s7, s7, 1731
                  mul          zero, sp, a6
                  fsqrt.s      fs0, ft8, rne
                  mulhsu       s8, s1, ra
                  or           a1, s0, t2
                  mulhu        s4, t1, s3
                  feq.s        s1, ft11, fa3
                  slli         s5, s0, 7
                  and          s6, a5, a7
                  fcvt.s.w     fa4, t4
                  xor          t2, a6, a7
                  add          s7, t4, zero
                  ori          t1, a4, 444
                  or           sp, s4, t6
                  addi         t0, zero, -343
                  fdiv.s       ft9, ft11, ft0
                  srai         a7, t0, 27
                  fle.s        t2, fa3, ft0
                  rem          sp, s5, gp
                  xori         zero, t0, -1801
                  slt          s1, t2, a0
                  and          a7, a2, t0
                  fmul.s       ft3, fs7, fs9, rne
                  fsgnjx.s     ft3, fs0, fa7
                  fcvt.w.s     s8, fs11, rdn
                  fmin.s       fs3, ft11, ft11
                  remu         t3, gp, a5
                  srli         a0, zero, 30
                  mul          s0, s6, s1
                  sra          s5, s8, t5
                  fcvt.s.wu    ft11, t2
                  xori         t6, sp, -879
                  fclass.s     t2, ft0
                  srl          t6, a3, s11
                  slti         a2, s6, -1906
                  fcvt.wu.s    t4, ft9, rup
                  fsgnj.s      fa4, ft8, fs10
                  divu         a3, s4, s1
                  auipc        t1, 137977
                  auipc        a7, 965572
                  fsqrt.s      fa7, ft11
                  and          s9, gp, s4
                  div          s11, t6, s8
                  srai         ra, a1, 20
                  mulhsu       s2, s3, a3
                  divu         gp, a5, s7
                  mul          gp, a2, s7
                  fclass.s     t3, fs10
                  fle.s        s1, ft8, ft7
                  xori         s1, s7, -1126
                  sub          t4, s9, ra
                  feq.s        a0, ft11, ft8
                  fadd.s       ft5, fa0, fs4
                  fdiv.s       ft1, fs2, fa5
                  mulhu        ra, t3, t2
                  fmul.s       fs1, fa6, ft10, rne
                  rem          a3, t3, gp
                  addi         s3, a0, 475
                  fmax.s       ft8, fa2, ft4
                  add          a1, a5, s6
                  fcvt.wu.s    s7, fs6, rup
                  slti         s5, a4, 164
                  fcvt.s.w     fs4, t2
                  addi         t3, t5, -1922
                  fmax.s       fs5, fs1, fs4
                  srli         t2, t6, 31
                  andi         s5, s0, 111
                  fsgnj.s      ft2, fa6, fs2
                  divu         a6, s7, tp
                  fsgnj.s      fs5, ft4, ft0
                  sltu         t2, t3, s4
                  addi         sp, s10, 1252
                  fmv.w.x      fs10, t2
                  mulhsu       t3, t5, a7
                  fclass.s     s4, ft10
                  fcvt.wu.s    a4, fs9, rtz
                  mul          a7, s9, a4
                  addi         a0, s6, 1638
                  slli         s11, t6, 0
                  srai         a4, t3, 21
                  slli         a6, a3, 7
                  mul          a7, a4, a0
                  div          a7, s2, t2
                  fadd.s       ft6, ft0, ft3
                  fmul.s       fa4, ft4, fs5, rdn
                  addi         a3, t5, -1059
                  sub          t1, s4, ra
                  feq.s        a3, fa6, fs1
                  fcvt.w.s     a6, fa3, rne
                  fcvt.s.wu    ft2, gp
                  fcvt.s.w     ft1, s11, rmm
                  fmul.s       ft4, fs1, ft0, rtz
                  auipc        ra, 910425
                  fcvt.s.w     fa5, zero, rtz
                  auipc        s2, 522563
                  fadd.s       ft11, ft2, fs7
                  fsgnjx.s     fa5, fs0, fa0
                  fsgnjx.s     ft6, fs11, fs7
                  fmul.s       ft9, fs1, fa6, rup
                  slli         s7, s3, 18
                  addi         gp, s5, 1024
                  fmv.w.x      ft3, a4
                  sra          s10, a2, s10
                  fcvt.wu.s    sp, fa2, rtz
                  slt          s1, t5, s11
                  mulh         s10, a4, s10
                  add          t3, t3, a4
                  fclass.s     s6, fa6
                  fmin.s       fs5, ft0, fa1
                  fcvt.s.wu    ft3, s1, rtz
                  nop
                  srl          t6, t3, sp
                  fcvt.wu.s    s7, fa1
                  mulh         zero, a3, s4
                  slti         s3, s9, 820
                  rem          s6, t3, tp
                  fadd.s       ft2, fs8, ft2
                  fadd.s       ft11, fa7, fa4
                  sub          a0, s6, tp
                  andi         ra, s1, 727
                  add          s11, t4, s9
                  sra          s10, s3, t4
                  fmin.s       fs5, ft1, fs5
                  fmin.s       fs11, fa4, ft1
                  srli         t3, a7, 29
                  sltiu        sp, a6, -933
                  fsgnj.s      ft10, fs1, ft5
                  sll          a7, s5, t0
                  mulh         t2, a4, s0
                  xor          s5, gp, s4
                  nop
                  fcvt.wu.s    t0, fa0
                  or           a4, s5, s6
                  lui          a0, 382433
                  mulh         gp, sp, t1
                  addi         s0, a1, 1975
                  mulh         a4, s11, a6
                  andi         ra, s7, 751
                  ori          t3, t6, 1890
                  fcvt.wu.s    t2, fs7, rup
                  lui          s9, 284505
                  fmin.s       fs2, fs4, ft2
                  addi         a4, a7, 87
                  nop
                  slti         a3, sp, 1473
                  feq.s        a1, fa3, fs6
                  fmv.x.w      t6, ft4
                  srl          gp, s11, s2
                  nop
                  fmv.x.w      s5, fa6
                  slt          t3, a6, a2
                  fmv.x.w      a2, ft10
                  fcvt.s.wu    ft9, sp
                  slt          s6, t5, a2
                  ori          a2, s11, 1225
                  fsgnjn.s     ft11, fs9, fs0
                  srl          a2, s9, t2
                  mulh         t1, s10, s2
                  fsgnjn.s     fs8, fs3, fa6
                  fsgnjn.s     fa4, fs11, fa7
                  and          a2, sp, a2
                  mulh         t6, s1, a2
                  mulh         a6, s5, a6
                  xori         s6, a7, 583
                  div          t6, s1, s5
                  auipc        s3, 339887
                  mul          t4, a6, zero
                  fmul.s       ft9, fs1, fs4, rmm
                  nop
                  sll          s8, a7, s8
                  or           s11, a2, t4
                  mulhu        t4, s11, s3
                  fcvt.s.w     fs2, t1
                  slli         s2, s1, 1
                  fadd.s       fa2, fa0, fa5
                  add          s0, s5, s5
                  fmax.s       fs9, ft4, fa0
                  fle.s        t3, fa0, fa7
                  srli         t3, s1, 4
                  and          s4, a2, s7
                  feq.s        t0, fs11, fs8
                  fsub.s       fs1, ft0, fa3, rne
                  xori         a7, t4, 609
                  rem          t0, s5, s0
                  flt.s        a0, fs8, fs10
                  or           s2, t3, t0
                  fcvt.wu.s    a3, fs8, rup
                  fsgnjx.s     fs11, ft4, fa6
                  sub          a1, a5, t3
                  sra          s9, s9, s3
                  addi         s9, a1, -505
                  fsgnj.s      fs1, fa7, ft0
                  sll          s7, t5, t2
                  nop
                  mul          gp, a4, a3
                  auipc        t3, 907975
                  slti         s1, s6, 1725
                  fmin.s       fs10, fs7, fs0
                  sra          t0, s11, ra
                  slti         a0, s8, 326
                  mulh         s2, t6, gp
                  mul          a6, a1, s4
                  slt          t3, s5, a2
                  srli         s0, s9, 9
                  sra          t6, s4, zero
                  xori         zero, t3, 382
                  fcvt.s.wu    fs4, s4, rmm
                  fsgnjn.s     fs11, ft2, fa6
                  mulhsu       a6, t4, t4
                  fle.s        t3, fa0, fa7
                  fmv.x.w      t6, fa6
                  sub          t1, s10, a1
                  lui          gp, 69699
                  fsgnj.s      fs1, ft11, fa1
                  fdiv.s       fs5, fs7, fs2
                  fsgnj.s      fa6, fs8, ft4
                  div          s10, a4, a3
                  ori          s9, s6, 598
                  ori          a0, s10, -754
                  xori         s8, s4, 1484
                  lui          gp, 928113
                  xor          s10, t4, a6
                  add          s7, s5, t4
                  fcvt.s.wu    fa5, ra, rmm
                  xori         s0, s9, -2041
                  mulhu        t0, s0, t5
                  mulhsu       t6, a0, s5
                  fcvt.wu.s    s8, fa4, rne
                  fclass.s     s5, fa1
                  slti         s2, s7, -1593
                  fmv.x.w      t3, ft6
                  srli         a1, s4, 15
                  fmax.s       ft0, fs11, fa2
                  feq.s        a1, ft3, ft2
                  fdiv.s       fa2, fs2, ft5, rne
                  div          t4, zero, s9
                  fadd.s       ft0, fa1, ft7, rup
                  xori         s4, s7, 796
                  fmax.s       ft4, fs3, fs0
                  mulhsu       s9, s8, t4
                  srl          t6, a3, t5
                  srli         s8, tp, 25
                  srli         a7, s4, 1
                  fdiv.s       ft1, fs1, fa1
                  fcvt.s.w     ft3, gp, rne
                  slt          t0, gp, ra
                  xori         a3, tp, -155
                  xori         s3, gp, -346
                  fdiv.s       ft3, ft8, fa1
                  fdiv.s       fa1, fs10, fs2
                  fle.s        s9, fs9, ft11
                  sll          t1, a7, a6
                  and          t3, s8, t1
                  ori          s10, tp, 536
                  andi         t3, t3, -502
                  ori          t6, s7, 107
                  sub          t1, a5, s5
                  srai         t4, a0, 15
                  fsub.s       fa0, ft5, fa0, rmm
                  nop
                  fmv.x.w      t3, fs9
                  srl          t4, tp, tp
                  or           t2, t0, a6
                  auipc        a1, 918731
                  mulhsu       a3, s5, t4
                  nop
                  srli         s6, s0, 21
                  ori          a3, zero, 162
                  fsqrt.s      fa1, fs5
                  slti         t6, s8, 1134
                  fcvt.s.w     fs3, s3, rtz
                  srl          t6, s10, zero
                  fmax.s       fs4, ft7, fs1
                  auipc        a1, 319816
                  fsub.s       fa0, fa5, fs10
                  xor          gp, t0, t0
                  ori          s7, t1, 1231
                  slti         a6, s5, 279
                  fadd.s       fs10, fa5, fs4, rdn
                  mul          sp, gp, s4
                  fmax.s       fs2, ft7, fa6
                  fsgnj.s      ft5, fs3, ft6
                  fsgnj.s      fa4, fs8, ft1
                  fmin.s       ft10, ft7, fs10
                  add          a1, ra, s6
                  add          s7, t2, s4
                  fcvt.w.s     s10, ft9, rmm
                  fadd.s       fs5, fs0, fa0, rne
                  sltu         s5, a4, s7
                  fsub.s       ft8, fs7, fs11
                  fcvt.s.w     fs8, zero
                  mulhsu       s10, a2, zero
                  slt          ra, t2, a5
                  mul          a6, a7, t4
                  fsqrt.s      fa1, fs6
                  addi         t3, t4, 1530
                  fsgnjx.s     ft9, ft5, fs3
                  mulh         zero, s3, t1
                  sub          s11, s1, a0
                  fcvt.w.s     zero, fs6
                  srai         t0, s8, 14
                  fsqrt.s      fs11, ft10, rup
                  fmv.x.w      t1, ft3
                  mulhsu       s4, a4, ra
                  srai         s4, sp, 20
                  mul          a2, a5, sp
                  fcvt.wu.s    s11, fs8
                  slt          a7, tp, tp
                  fmv.w.x      ft4, s3
                  fmv.w.x      fa5, s2
                  slti         t0, zero, 192
                  div          s11, s9, s8
                  slt          sp, s10, s10
                  ori          s8, s6, -1994
                  mul          a3, a5, s8
                  slt          s2, zero, s3
                  fcvt.wu.s    t0, fs4
                  srl          s4, s9, a7
                  fsgnjx.s     ft3, ft4, ft6
                  sltiu        zero, t0, 1241
                  fclass.s     a3, fs9
                  mul          a0, a0, t3
                  fcvt.s.w     ft6, s9, rup
                  slt          s3, s3, t5
                  xor          sp, t5, a3
                  div          s7, a2, zero
                  lui          s1, 37497
                  srli         s11, t4, 13
                  or           s2, s8, s2
                  sltu         t2, s6, a6
                  auipc        s8, 12729
                  sra          s8, tp, a2
                  sra          s8, zero, tp
                  sltu         s9, s2, s8
                  fsqrt.s      fa5, fs3
                  rem          t0, t6, zero
                  fle.s        t2, fs1, ft2
                  mulh         s10, t2, t5
                  rem          s4, t1, tp
                  add          a1, s4, s10
                  divu         a3, s7, a4
                  fadd.s       fs1, fs1, fs1
                  fcvt.w.s     t3, fa1
                  sra          s0, t5, s6
                  fmv.x.w      gp, fa7
                  mul          t2, tp, t4
                  srl          t4, a7, a4
                  xor          zero, t2, a0
                  or           s8, s4, s5
                  fclass.s     s3, fs8
                  srl          ra, s0, s2
                  srl          t1, tp, s10
                  mulh         s4, a2, zero
                  fmv.x.w      ra, fs4
                  fdiv.s       fs0, ft1, fa2
                  xor          s5, t5, t2
                  div          t3, a6, a1
                  ori          a7, t1, 1362
                  slti         s2, s4, -428
                  feq.s        s8, fa6, fs9
                  mul          zero, t6, s9
                  sra          t2, s6, a0
                  slt          s6, t3, a1
                  xori         s3, t5, -1892
                  fmv.w.x      ft3, s6
                  andi         a1, t6, 598
                  fadd.s       ft0, ft1, ft1
                  or           s2, a4, ra
                  fmax.s       ft5, ft8, fs2
                  fsgnjx.s     fa0, fa6, fs9
                  fcvt.wu.s    zero, fa3, rtz
                  slt          s10, a1, s10
                  slti         s8, t2, 1479
                  and          t2, s5, t2
                  fmv.x.w      gp, ft10
                  divu         s8, s5, zero
                  xor          s6, s7, s7
                  fdiv.s       fa5, fa6, fs0, rdn
                  divu         a6, s8, t4
                  fsgnjx.s     fa1, fs2, fs2
                  auipc        ra, 779667
                  srl          t6, ra, t2
                  sltiu        a2, a7, -720
                  fcvt.s.w     fs1, t5
                  nop
                  fsgnj.s      ft0, fs11, fs5
                  srl          t0, s3, s1
                  fle.s        a2, fa4, fs8
                  fcvt.s.wu    ft5, sp, rmm
                  nop
                  fmul.s       ft10, ft0, fa4, rtz
                  sra          s8, s7, a0
                  srl          s6, a7, a6
                  fmv.w.x      fa2, s3
                  slt          a3, t1, t3
                  and          t2, s7, t3
                  mulhu        zero, t3, a5
                  remu         s6, a6, s0
                  mulh         a4, s7, s3
                  fle.s        s7, fs11, fs10
                  mulhu        ra, ra, s10
                  divu         zero, t4, a1
                  slti         s7, zero, 576
                  srli         t0, s11, 15
                  fmv.x.w      a4, fs10
                  sll          s7, t5, ra
                  srai         gp, t3, 0
                  fadd.s       fa2, fs1, fs7, rmm
                  fadd.s       ft10, ft2, fs7
                  sltiu        t6, s6, -2021
                  srl          s7, t2, s10
                  or           s9, zero, a5
                  fsgnjx.s     fs6, fa1, fs1
                  xor          s10, a1, s3
                  slti         ra, a4, -593
                  sll          a2, a6, gp
                  mulh         t0, a6, a6
                  srl          gp, ra, t0
                  or           a4, t4, a0
                  sra          s11, s10, a2
                  fadd.s       fa6, fa4, ft0
                  xor          ra, s10, a7
                  xor          ra, ra, s3
                  mulhu        t2, a1, s0
                  or           ra, a2, a3
                  fcvt.w.s     sp, ft8, rup
                  fsqrt.s      fs7, fa0
                  mul          gp, tp, a6
                  and          s0, t3, s8
                  slt          s7, t2, s3
                  mulhsu       s10, a2, sp
                  mulhsu       s8, s4, zero
                  slt          s8, t6, s11
                  fsub.s       ft0, fs8, ft1
                  feq.s        s5, fs3, ft7
                  sltiu        gp, t1, 1591
                  fsgnj.s      fs8, fs11, ft7
                  sltiu        s0, a0, 1335
                  srai         t0, a3, 16
                  sltiu        sp, a0, 1066
                  add          s6, sp, s8
                  flt.s        gp, fs3, fs8
                  fsqrt.s      ft3, ft6
                  mulhsu       s11, a7, a4
                  sra          t1, tp, s2
                  sltu         t4, tp, t4
                  fsqrt.s      fs7, fs8
                  fadd.s       fs2, fa5, fs9, rne
                  add          a0, ra, sp
                  rem          a6, t5, a0
                  fmv.w.x      fs6, s7
                  fclass.s     s1, fs11
                  lui          a1, 206712
                  fmul.s       fs10, ft2, fs2
                  sltu         s0, s9, t3
                  nop
                  ori          s7, gp, 1761
                  fcvt.wu.s    s10, fs7, rup
                  mulhu        gp, a1, a5
                  fcvt.s.w     ft2, s4, rne
                  lui          a7, 728919
                  feq.s        s4, fs11, fs0
                  feq.s        a1, fs1, fs11
                  fsub.s       ft3, ft7, ft5, rup
                  or           a6, s7, s6
                  ori          a6, s3, -1979
                  fmv.x.w      t6, ft0
                  add          t0, t5, s9
                  fle.s        a4, ft6, fs10
                  rem          a0, s9, s11
                  ori          t3, zero, -781
                  fclass.s     s3, fs2
                  srli         t6, a0, 25
                  sll          a4, t0, s10
                  sra          s0, t4, t1
                  auipc        s9, 420257
                  fmin.s       fa4, ft11, fs10
                  ori          zero, t3, -1933
                  sub          s9, t0, a3
                  rem          s4, s8, a5
                  fdiv.s       fs1, fs5, fs10, rup
                  fmax.s       fa4, fa7, fa6
                  mulhu        t0, a1, gp
                  fmin.s       ft1, ft4, fs8
                  fcvt.s.w     ft9, s3
                  fsub.s       ft5, fs5, ft10
                  fadd.s       ft8, ft2, fa7, rup
                  flt.s        s9, ft1, fs4
                  fsub.s       fa5, fs8, fs3
                  fsgnjn.s     ft4, fa6, fs10
                  mul          s7, s8, a0
                  andi         t1, s5, -469
                  sub          t1, a2, a0
                  nop
                  mulhsu       t0, s0, s7
                  fclass.s     s0, fa2
                  mul          ra, ra, a6
                  add          a1, s9, zero
                  srl          zero, s0, a4
                  sll          a2, a7, s1
                  andi         s9, s11, 787
                  sltu         a0, s3, s5
                  sub          t4, tp, s10
                  fcvt.s.wu    ft5, s3
                  fsqrt.s      fs8, ft2, rtz
                  remu         a7, gp, tp
                  ori          a4, ra, -61
                  rem          s6, a5, ra
                  fsgnjx.s     fa4, ft6, fa4
                  fsgnj.s      fa4, fa3, fs0
                  srai         s4, t3, 2
                  sltu         s11, zero, s4
                  srl          sp, s7, zero
                  feq.s        s0, fs3, fs5
                  ori          gp, t2, -2021
                  fmax.s       fs1, fs9, fs3
                  mulh         t0, s9, t5
                  srl          a0, zero, s9
                  fdiv.s       fa2, ft4, ft8, rtz
                  and          a7, a2, a3
                  srai         s5, a5, 12
                  mulhsu       sp, t4, a2
                  srl          s5, s0, a2
                  or           s7, a2, zero
                  flt.s        s2, fa0, ft4
                  fsqrt.s      fs5, fs4
                  fle.s        s1, ft1, fs6
                  mulh         s9, t2, sp
                  sub          t1, a3, a0
                  divu         s3, s5, a5
                  xori         s1, t2, -718
                  remu         s11, a3, tp
                  fmin.s       fa4, ft5, fs7
                  sll          sp, a2, s2
                  feq.s        s1, fs0, fs1
                  div          s8, zero, a5
                  fsgnjx.s     fs3, fs8, fs5
                  srai         ra, t0, 13
                  mul          gp, a1, tp
                  fmv.w.x      fs10, a0
                  fsgnjn.s     fa7, fs1, fa4
                  or           zero, t3, t2
                  fsgnjn.s     fs11, ft0, ft3
                  divu         s0, s8, a0
                  sra          s5, t4, a1
                  fmin.s       fs1, ft10, fs4
                  fclass.s     s11, fa7
                  mul          t4, t5, a5
                  srai         t2, a0, 15
                  divu         gp, a5, a5
                  flt.s        a3, ft2, fs11
                  fdiv.s       ft3, ft4, fs3, rmm
                  auipc        t2, 732017
                  srl          s5, t3, s11
                  sll          s6, s10, s6
                  flt.s        s9, ft11, fs6
                  fmax.s       fs4, ft5, ft11
                  xor          a7, s3, t3
                  slt          gp, a1, a2
                  fcvt.wu.s    s9, fs4, rmm
                  mulhu        sp, s9, a6
                  srai         a1, s11, 8
                  fcvt.w.s     s6, ft5
                  fmin.s       fs6, fs10, fs7
                  fsgnjx.s     fs11, ft8, ft4
                  mul          s4, s1, a5
                  addi         s1, t1, -1233
                  auipc        s3, 411624
                  fdiv.s       fa0, fs4, ft1
                  and          ra, a6, t6
                  nop
                  sra          t2, sp, a3
                  mulh         s5, a2, t5
                  fcvt.s.w     fa4, s3, rtz
                  mulhsu       s8, t0, s0
                  ori          t0, a7, -954
                  sub          a4, ra, s7
                  sltiu        s5, s3, -817
                  ori          t3, sp, 1558
                  fle.s        s4, ft11, fa6
                  and          ra, a7, s3
                  fcvt.s.wu    fa1, s2, rmm
                  fsub.s       ft0, fa2, fs8, rne
                  or           s2, s5, s6
                  slti         s7, a0, 93
                  or           a2, zero, a0
                  xori         s3, tp, 771
                  fmv.w.x      fa4, s4
                  sra          a2, s9, a7
                  fmul.s       fs0, fs7, fa6
                  slt          s9, t1, sp
                  mulhsu       s9, tp, s2
                  rem          s0, sp, a3
                  mulhsu       a3, a4, s4
                  xori         a7, t1, -1603
                  mulhsu       a3, t4, t6
                  fcvt.wu.s    a3, ft7
                  fmv.w.x      ft6, s4
                  fsgnjn.s     fa7, ft5, fs2
                  fcvt.s.wu    ft8, s2
                  ori          zero, tp, 1350
                  fadd.s       ft2, fs10, fa0
                  add          a2, zero, sp
                  fsgnj.s      fs10, ft3, fs9
                  remu         t1, s4, a0
                  srli         s5, t6, 16
                  fsgnj.s      fs10, fs0, fs10
                  mulhu        t1, t4, s5
                  fsub.s       ft9, fa5, fa7, rne
                  div          t1, a1, gp
                  fsgnjx.s     ft3, fs7, fa4
                  auipc        s4, 1026568
                  addi         s0, t3, 134
                  slti         t3, s1, 1433
                  fcvt.wu.s    t3, ft6
                  fcvt.w.s     s2, fa2
                  sll          a1, t6, s0
                  nop
                  slti         zero, s11, -1318
                  mul          s6, a4, s9
                  srl          s4, a5, s4
                  fsgnjx.s     ft9, ft6, fs4
                  sltiu        s7, s4, -1977
                  div          a0, s5, s10
                  fle.s        ra, fs2, fa2
                  sll          gp, a3, a4
                  xor          t6, t0, s8
                  fmul.s       fs4, fs11, ft11, rdn
                  fclass.s     gp, ft11
                  sltu         s2, s11, s11
                  rem          s10, s9, t4
                  rem          t6, zero, t6
                  slti         t1, t4, -502
                  xor          s0, s8, s1
                  ori          t0, sp, -1827
                  fmax.s       ft11, fs6, fa7
                  mul          s3, a1, s8
                  flt.s        s11, fa3, fs9
                  addi         t1, t4, -1006
                  divu         s8, s8, gp
                  xori         a4, a5, 1593
                  fsub.s       ft7, fs5, fs2, rdn
                  or           zero, gp, a5
                  fadd.s       fs0, fs5, fa0, rup
                  slti         s11, a7, 1933
                  sra          s9, s6, s2
                  fcvt.wu.s    t3, fa3
                  fclass.s     t6, ft11
                  auipc        s4, 798033
                  fsub.s       ft8, ft4, fs5
                  lui          s4, 931115
                  ori          s2, t1, -395
                  fdiv.s       fs8, fa1, fa1, rne
                  feq.s        s10, fa3, fa0
                  add          a3, s1, s2
                  fdiv.s       ft10, ft3, fs1
                  fmax.s       ft6, ft8, fs7
                  fsub.s       fs11, fa6, ft2, rtz
                  srl          t6, a2, s8
                  divu         s5, a3, s11
                  mulh         a6, a3, a0
                  fmul.s       ft4, fs0, ft4, rmm
                  flt.s        s2, fa6, fa2
                  sltu         s6, s11, a2
                  andi         a1, s1, 1408
                  srai         s10, t2, 31
                  add          s7, gp, a5
                  srl          s0, t2, t4
                  remu         sp, tp, t5
                  fsqrt.s      fs10, ft11, rmm
                  sub          a4, s0, t5
                  srl          s5, a6, s3
                  mulh         s5, tp, s5
                  fcvt.w.s     s1, ft3
                  remu         t3, a3, s5
                  ori          s9, tp, -624
                  fadd.s       fa7, ft0, ft1
                  fsgnjn.s     fs11, fa5, ft1
                  feq.s        s5, fs3, fa1
                  sub          a2, s0, s4
                  xor          t0, t3, s10
                  addi         a4, s10, 63
                  fmv.x.w      s9, fs11
                  fmv.x.w      t1, ft2
                  sub          t4, t4, a5
                  sltu         s6, s10, t0
                  sltiu        t2, s5, 334
                  andi         zero, a1, -1670
                  fmax.s       fs5, ft5, fa4
                  nop
                  mulhu        t2, zero, s7
                  fsub.s       ft9, fa7, ft2, rdn
                  or           s11, t1, gp
                  fcvt.wu.s    s9, fa0
                  fcvt.s.w     ft11, tp, rne
                  mulhsu       s2, s4, a0
                  fsgnjx.s     fs3, fs5, fs5
                  srl          gp, a4, a7
                  feq.s        sp, fa5, fa5
                  fle.s        a0, ft0, ft1
                  fcvt.wu.s    s4, ft10
                  slti         a3, s6, 509
                  flt.s        a7, ft2, ft2
                  fcvt.s.w     ft4, s4
                  fcvt.s.wu    ft6, ra
                  srl          t0, sp, s3
                  xori         s10, t3, -1121
                  srl          s3, a3, s4
                  slt          s8, sp, s8
                  sra          t2, a3, ra
                  fsub.s       fs8, fa4, ft11
                  and          a0, zero, s10
                  and          t6, s5, s2
                  slt          s6, s8, s9
                  sub          s11, s1, s7
                  divu         a7, s0, a4
                  fsub.s       ft3, fs4, fs9
                  feq.s        s1, ft8, fs4
                  sub          s6, a5, t3
                  fcvt.s.w     fs5, s6
                  mulhu        s11, s4, s10
                  mulhu        a6, s11, s7
                  mul          zero, t2, s2
                  feq.s        t4, fa5, fa6
                  sra          ra, t6, s5
                  or           t6, s8, s5
                  srl          s0, tp, zero
                  mulhsu       s0, a0, s2
                  fmax.s       fs8, fa5, fs11
                  fmul.s       fs4, ft11, ft3
                  srl          s1, s10, s2
                  fmax.s       ft2, fs10, fs5
                  rem          a2, s3, s7
                  fsub.s       fa1, fs1, fs3
                  sll          t6, s11, a6
                  fcvt.wu.s    sp, fs8
                  feq.s        t2, ft0, fs6
                  srl          s3, s3, a7
                  ori          a7, a4, -1516
                  addi         s8, gp, -1172
                  add          s6, a7, s5
                  fsub.s       ft6, ft6, ft4
                  feq.s        a0, fa0, fs6
                  mulhsu       t3, a1, t5
                  slti         a6, gp, 1598
                  xori         s0, t5, 1607
                  xor          s2, s8, s11
                  mulh         ra, s3, s2
                  fsub.s       ft9, ft7, fs0
                  nop
                  ori          s3, s0, 856
                  fmax.s       fs6, fs10, ft5
                  divu         s1, a1, t3
                  ori          a7, a7, 18
                  srl          s6, s7, sp
                  srli         ra, s11, 14
                  fsgnjx.s     fs10, fa0, fs8
                  srl          a1, a1, s0
                  feq.s        t1, fs4, fa7
                  fcvt.w.s     a1, ft5, rdn
                  feq.s        s7, fs7, fs0
                  fsgnjn.s     fs7, ft7, fs10
                  addi         t0, s2, 370
                  add          a2, a6, a7
                  divu         t1, s10, sp
                  fclass.s     s1, fa0
                  srli         a6, a1, 8
                  ori          a7, t3, -1767
                  fmul.s       ft0, ft3, ft5
                  fsgnjn.s     fs5, fa5, fa4
                  fcvt.w.s     s6, fs4
                  fmul.s       fa2, fa6, fs4
                  fmul.s       ft2, ft11, fs5, rup
                  mulhsu       s4, t0, zero
                  mulhsu       a4, a4, zero
                  slti         s8, s4, -449
                  andi         zero, s10, -359
                  slt          s8, s8, a0
                  fclass.s     s4, fs11
                  mulhsu       t2, ra, t6
                  slti         s5, s1, 74
                  fmax.s       ft10, fs11, ft11
                  or           t6, t2, s8
                  andi         a2, a3, 1369
                  sub          a1, t2, t1
                  flt.s        ra, ft3, ft0
                  fclass.s     s7, ft5
                  andi         a2, a3, -1295
                  mulhsu       s2, a1, s1
                  fclass.s     s3, ft5
                  fmv.w.x      fs6, a6
                  xor          s3, a2, s10
                  fdiv.s       fs7, fa3, fa0
                  fle.s        s11, fs4, fa5
                  remu         a1, s3, sp
                  srli         s5, a7, 2
                  fclass.s     t0, fs2
                  auipc        a0, 878287
                  fmin.s       ft0, ft8, ft8
                  mulhsu       s1, t2, s1
                  or           t2, a2, t3
                  fsgnjx.s     fs10, fa1, fs3
                  div          s7, s6, s10
                  slli         t6, s1, 3
                  xori         t4, s4, 2021
                  fsqrt.s      fs10, fs1
                  fmv.w.x      fs3, a1
                  fcvt.w.s     t4, ft5, rne
                  fcvt.wu.s    a4, fs1
                  slt          t1, a2, s7
                  srli         t1, t1, 12
                  feq.s        t6, fs1, ft10
                  mulh         t3, t1, zero
                  sub          ra, t6, s11
                  andi         s3, s10, -1529
                  sll          s0, a6, t0
                  fcvt.w.s     ra, ft1
                  fmv.x.w      t2, ft2
                  feq.s        s3, fs11, fs8
                  addi         a4, s0, 1709
                  srai         s11, a6, 12
                  fcvt.wu.s    t4, fs11
                  fsqrt.s      ft2, fa7, rdn
                  and          s1, s6, t4
                  fclass.s     s10, fs5
                  fmax.s       fa7, ft6, fs5
                  fsqrt.s      ft4, fa7, rdn
                  nop
                  sltu         a6, gp, sp
                  fsgnjx.s     ft9, ft1, ft10
                  fle.s        s4, fs9, fs2
                  nop
                  fcvt.wu.s    s2, ft9, rup
                  slt          t2, zero, sp
                  mulh         zero, s6, zero
                  sltu         a2, s6, s2
                  fmax.s       fs11, fs9, ft1
                  sra          a7, tp, a2
                  fmv.w.x      fs9, s11
                  mulh         s2, s3, t2
                  lui          t2, 112061
                  sltu         a7, a0, a6
                  or           gp, zero, a0
                  div          s5, t6, ra
                  flt.s        t0, fs5, ft0
                  slli         a7, gp, 5
                  xori         a1, t0, -1804
                  fcvt.wu.s    s0, fs5
                  auipc        t1, 877482
                  flt.s        s11, fs3, ft2
                  srl          s1, s10, ra
                  divu         t2, a6, a4
                  remu         a1, t0, a5
                  fmv.w.x      ft4, s9
                  div          a1, ra, t6
                  slt          s2, a3, t5
                  sltiu        a6, t6, 1102
                  fclass.s     s3, ft1
                  fsgnjx.s     ft6, fs11, fa7
                  mulh         ra, a0, a7
                  mulhu        gp, s9, tp
                  fsgnjx.s     ft10, ft6, fs3
                  sll          s8, s2, t4
                  div          s2, sp, s5
                  fclass.s     ra, fa4
                  rem          t4, t2, s10
                  flt.s        t3, fa6, ft11
                  fmin.s       fs4, ft6, ft5
                  fmv.x.w      s10, ft5
                  mulhu        s1, a4, a4
                  lui          s10, 688042
                  fsgnj.s      fa6, fs8, fa1
                  xor          a3, ra, s0
                  mul          s2, s6, a7
                  fmul.s       ft8, ft6, fs8, rtz
                  slti         sp, a0, -1785
                  auipc        zero, 161818
                  sra          sp, a3, s11
                  remu         t6, a7, s6
                  fcvt.s.wu    ft1, a6
                  slli         a1, a5, 20
                  sltu         t0, s6, t3
                  srl          s11, s1, s0
                  fsgnjn.s     fs10, ft8, ft7
                  fmin.s       fs4, fs1, ft5
                  sra          s2, t5, s5
                  and          t3, a3, t5
                  ori          t4, t1, 123
                  fsgnjx.s     ft10, ft7, ft9
                  fcvt.w.s     s10, fs0
                  rem          t3, ra, s7
                  ori          ra, s5, -833
                  fadd.s       fs1, ft3, fs9
                  fcvt.s.wu    fs7, a5, rup
                  fsgnj.s      ft5, fs10, fa4
                  fadd.s       fs0, fs5, fa0, rdn
                  ori          s7, a6, 681
                  slli         a0, t3, 24
                  xor          t0, s6, tp
                  slli         a6, s2, 12
                  fmax.s       fs10, ft2, ft0
                  auipc        t2, 86537
                  and          s9, t1, a0
                  nop
                  xori         t0, s6, 832
                  remu         s3, zero, s6
                  fdiv.s       fs1, ft6, fa1
                  fcvt.wu.s    s3, ft5, rup
                  mulh         a6, t6, s6
                  mulhsu       s8, a0, s3
                  mulhsu       zero, a2, s7
                  div          t0, t4, s6
                  fsub.s       fa0, ft1, fs7
                  fsgnj.s      fa1, ft8, ft10
                  fmax.s       fs10, ft4, ft11
                  sll          ra, s6, ra
                  xor          a1, t5, gp
                  slt          t2, a7, t0
                  mulhu        s8, s5, a5
                  feq.s        s10, fa0, ft10
                  fclass.s     a7, ft7
                  fmv.x.w      t3, fa1
                  div          s11, s6, s6
                  ori          s10, t5, 426
                  mulhsu       sp, tp, t6
                  feq.s        s9, fa6, ft10
                  fadd.s       fa0, fa6, fs1, rmm
                  rem          ra, a7, ra
                  fmv.x.w      sp, fs6
                  fmv.w.x      ft4, s6
                  divu         a1, a4, a0
                  div          a1, t4, ra
                  mulhu        sp, a7, a4
                  mul          t2, tp, ra
                  fdiv.s       fs6, fs2, ft7, rne
                  fdiv.s       fs4, fa4, ft4
                  fsub.s       fs8, fa6, ft1, rtz
                  div          s0, s3, a0
                  fcvt.wu.s    a7, ft6, rmm
                  fmax.s       fa6, fs1, ft0
                  srai         t0, t1, 7
                  or           s5, sp, t4
                  divu         t6, t1, s2
                  xor          gp, t2, t2
                  fsgnjx.s     ft8, fs6, ft9
                  xori         sp, a2, -144
                  lui          a3, 963745
                  andi         s2, t3, -1021
                  auipc        a3, 423180
                  slt          s3, s9, a2
                  sra          s10, a3, a7
                  fcvt.wu.s    a2, fa2
                  rem          t1, t6, t3
                  fcvt.s.wu    fa6, s8
                  fcvt.wu.s    s7, fs7
                  mulhsu       t1, s8, a2
                  rem          s1, tp, s2
                  mulh         s0, t4, s5
                  sltu         a0, ra, t0
                  sra          a3, s0, zero
                  fmul.s       ft1, fa2, fs5
                  or           t3, t1, a0
                  andi         a2, s3, -1182
                  andi         gp, s9, 618
                  fmul.s       fs9, fa3, fs5
                  xori         a7, t2, -1539
                  addi         s5, a2, -1371
                  fadd.s       fa1, fa3, ft1, rmm
                  slli         s9, s2, 30
                  flt.s        s4, ft5, fs11
                  fsgnjx.s     ft2, ft0, fs7
                  nop
                  fmv.x.w      gp, fa5
                  sra          t2, t2, s3
                  fclass.s     s0, ft8
                  fmin.s       fs6, fa1, ft1
                  fcvt.s.w     fs6, a0
                  slt          s11, a7, t3
                  fcvt.w.s     t2, fs10
                  andi         t2, s4, 544
                  mul          s0, a5, t6
                  mulh         a0, s7, s7
                  and          s0, a5, s6
                  ori          s8, a2, 1083
                  xori         a3, a3, 2027
                  sltiu        s4, s6, 694
                  xor          gp, s6, t2
                  mulhsu       s11, ra, t5
                  nop
                  fmv.x.w      a6, ft6
                  slti         t3, a7, 1477
                  fsgnjx.s     fs11, fs11, fs5
                  fsgnjx.s     fs3, fs0, ft9
                  fsgnjn.s     fs6, ft5, fs3
                  srl          a1, gp, s6
                  fadd.s       fs3, ft8, fs4
                  lui          t3, 722491
                  fmul.s       ft5, fs2, ft5
                  rem          a2, a3, a4
                  srli         s8, s9, 29
                  srli         a1, sp, 19
                  and          s0, sp, a4
                  srli         s3, gp, 0
                  sll          s8, a7, a6
                  srai         s4, ra, 0
                  flt.s        s4, ft2, fa3
                  sub          a4, a0, t3
                  slt          s10, a0, s0
                  or           s3, zero, a7
                  mulhu        s2, t2, sp
                  remu         s5, s9, s11
                  sra          zero, a3, s0
                  fmul.s       fa4, fs4, fs11
                  divu         s1, t4, sp
                  fadd.s       fs8, fa2, fs1, rmm
                  fmv.x.w      a0, fs4
                  fmv.w.x      fa0, a3
                  fsgnj.s      fs4, fs8, fs4
                  xor          a4, t5, a6
                  slti         t2, t3, -248
                  addi         ra, ra, -55
                  fle.s        s4, fs8, ft1
                  fcvt.s.w     fs8, s5, rne
                  slli         s9, tp, 30
                  mul          ra, s3, a7
                  fmax.s       fs2, fs0, fs9
                  feq.s        a4, ft8, ft2
                  andi         t1, a3, -220
                  sltu         a3, t2, s2
                  xor          t3, s8, s11
                  fclass.s     s6, ft3
                  fsqrt.s      ft3, fa3
                  add          a3, s9, s0
                  flt.s        ra, fs8, fs3
                  srai         t0, s9, 28
                  remu         ra, a0, t5
                  fclass.s     a7, fa7
                  fdiv.s       ft3, fs11, ft3
                  sll          s6, a4, a4
                  fmv.x.w      t6, ft3
                  feq.s        s1, fa1, fa6
                  nop
                  fmin.s       fa5, ft9, fs11
                  fle.s        ra, fs0, fs1
                  fmv.w.x      fs2, zero
                  divu         gp, s7, s4
                  fcvt.w.s     t4, fs2, rne
                  fmv.x.w      s9, fa0
                  sltu         s6, s3, gp
                  fsub.s       fa4, fs5, fs8, rup
                  divu         s0, s8, s1
                  mulhu        sp, a5, a6
                  mul          s6, s10, s2
                  mul          a3, s6, t1
                  mulh         s6, a0, a1
                  fmul.s       fa6, fa1, fa5
                  slt          sp, a0, s4
                  fle.s        a4, fs11, fs3
                  and          t2, a4, a6
                  fsgnjx.s     ft11, ft9, ft1
                  andi         a2, tp, -1944
                  fcvt.s.w     fa7, t1, rmm
                  fmv.w.x      fs5, s5
                  fmv.w.x      fa7, t5
                  fcvt.s.w     fs5, s4, rdn
                  add          sp, a3, s6
                  fclass.s     t3, ft8
                  fmul.s       fa5, fs8, fa7
                  fsub.s       ft10, fs8, ft4, rup
                  and          a0, s10, s9
                  andi         s4, gp, -1621
                  fcvt.wu.s    a3, ft8
                  andi         s10, a0, 1945
                  div          a3, a4, a5
                  mul          s1, t3, a2
                  fsgnjx.s     fa1, fs2, fs0
                  auipc        s11, 392648
                  mulhu        t1, tp, a7
                  mulhsu       t6, a5, s0
                  divu         s10, t3, a7
                  sub          gp, s1, s11
                  fdiv.s       fa3, fs4, ft6, rup
                  fcvt.wu.s    a6, fa5
                  and          t2, s5, gp
                  slt          t1, a5, t6
                  slli         t3, a7, 25
                  andi         ra, s5, -78
                  mulh         s7, t4, a4
                  fclass.s     s11, fa5
                  or           s2, a0, s10
                  fsgnjx.s     fs2, ft9, fs10
                  fdiv.s       ft2, fs2, fs7, rtz
                  fle.s        a3, fs7, ft1
                  mulhu        s5, a4, gp
                  andi         t1, s0, 822
                  div          s8, s6, s0
                  mulhsu       s3, t2, s0
                  sltiu        t4, s11, 46
                  fsqrt.s      fs11, ft7
                  fcvt.s.w     ft7, s5, rdn
                  feq.s        t6, ft3, fa0
                  fmv.w.x      fs6, s8
                  fmax.s       fs7, ft10, ft3
                  fmax.s       fa3, fa6, fs5
                  slt          s3, s9, sp
                  remu         sp, s10, t4
                  slli         s3, t0, 19
                  srai         s8, s5, 25
                  slli         s8, s9, 27
                  sub          s1, gp, a1
                  fsgnjn.s     fs3, fa0, fs3
                  mulhsu       s9, ra, t3
                  fmul.s       fa0, fs10, fs9
                  fadd.s       fa1, ft8, fs11, rdn
                  and          t2, a0, a6
                  andi         s0, s10, -1134
                  fsgnjn.s     ft11, ft10, fs8
                  fsqrt.s      fs8, fa1
                  add          t1, s9, ra
                  slti         t3, s5, 762
                  mul          s4, gp, s10
                  rem          a0, s1, s10
                  fcvt.w.s     a3, fs10
                  fdiv.s       fs0, fs1, ft9, rmm
                  xor          a1, a0, t5
                  addi         s8, sp, -940
                  slt          gp, t3, s2
                  sltu         t3, zero, s10
                  addi         t3, ra, -270
                  fsub.s       ft11, fs3, ft0, rmm
                  add          s1, t3, s3
                  fmv.w.x      fs5, t1
                  sra          gp, a4, s9
                  srli         a1, s3, 15
                  sltu         t0, s8, s6
                  srl          s0, s6, t1
                  fadd.s       fs4, ft1, fa7, rup
                  andi         t6, t2, -884
                  addi         s7, s8, 503
                  fmin.s       fa5, fa1, fa2
                  mulh         gp, s1, ra
                  srli         s11, s8, 7
                  rem          gp, t2, s0
                  xor          s4, s1, t4
                  sll          s11, tp, t6
                  fsgnj.s      fs8, ft10, fs6
                  div          a6, s9, s8
                  sltiu        t6, t1, 928
                  slti         ra, gp, -1536
                  fsgnjx.s     fs6, fa1, fa1
                  fle.s        s11, ft4, ft1
                  sltiu        a7, a7, -1477
                  mulhsu       a3, s7, a0
                  slli         a1, a1, 23
                  addi         t0, a0, -546
                  sltiu        t6, a4, 78
                  fcvt.s.wu    ft11, s10
                  sll          s7, s9, s4
                  srli         s11, ra, 7
                  sltu         t4, s5, s10
                  slli         t1, t0, 30
                  srli         s0, a2, 24
                  fsub.s       fa3, fs7, ft10, rtz
                  mulh         s6, s9, ra
                  fclass.s     a0, fs9
                  fsub.s       fa5, ft4, ft1, rdn
                  addi         t2, t6, -872
                  rem          s3, ra, sp
                  srli         s4, s9, 1
                  fmin.s       fs6, ft10, fs0
                  srai         s0, a1, 7
                  fdiv.s       fs9, fs4, fs3, rdn
                  andi         s2, t3, -1226
                  fcvt.s.w     ft9, s7
                  remu         t0, t3, s5
                  slli         a2, s7, 25
                  mulhu        t2, zero, zero
                  and          s11, t1, s11
                  fmv.x.w      ra, ft11
                  xor          gp, s5, t6
                  fdiv.s       fs10, fa2, ft1, rmm
                  fclass.s     a1, fs3
                  fdiv.s       ft6, fs1, fa6, rne
                  rem          a3, s9, s6
                  andi         s1, t5, -1020
                  feq.s        t6, ft10, fs10
                  xor          s10, a7, s7
                  sltiu        s8, a2, -410
                  mulhsu       a4, t4, a5
                  or           a1, ra, t4
                  mulhsu       s4, t1, t6
                  and          t4, a2, s5
                  sra          s3, s9, s2
                  fdiv.s       fa4, fa0, ft3
                  fadd.s       fs4, fs4, fa3, rup
                  mulh         gp, t4, a1
                  fsgnj.s      fs8, fs2, fs6
                  fsub.s       fs9, ft7, fs11, rup
                  div          s5, t2, t3
                  fmax.s       ft2, fs6, fa5
                  rem          s4, t2, a1
                  fsgnjx.s     fs2, fa6, ft9
                  add          t2, s0, s10
                  div          s11, s6, t4
                  mulhu        t3, zero, s4
                  fcvt.s.w     fs10, t6
                  remu         s6, a4, s7
                  fmin.s       fs1, fa7, ft11
                  fsqrt.s      fa1, fs3
                  slli         s5, t1, 9
                  fcvt.s.w     fa1, s3
                  flt.s        sp, ft1, fs8
                  rem          t4, s4, t5
                  fcvt.w.s     ra, fs6
                  addi         t2, t3, 613
                  sltiu        a3, s10, -1039
                  auipc        s5, 760950
                  flt.s        s3, fs11, fa4
                  fdiv.s       fs9, ft2, fa5, rtz
                  fcvt.s.wu    ft9, a4
                  fsgnjn.s     ft3, ft10, ft10
                  fsqrt.s      fa6, fa4
                  srli         s10, a7, 29
                  fmv.x.w      t4, ft5
                  nop
                  fcvt.s.wu    fs1, s2, rmm
                  div          a2, a1, t4
                  sra          ra, s1, a7
                  fsqrt.s      fa6, fa7
                  mul          s6, s2, s9
                  slt          s2, ra, a1
                  mulhsu       s11, s5, t2
                  fsgnjx.s     ft9, ft3, fs3
                  mulhsu       t3, s1, t6
                  xor          ra, s10, gp
                  sra          t2, s2, s0
                  rem          t0, sp, sp
                  add          s10, s0, t2
                  addi         s9, s4, 241
                  srai         s1, t0, 25
                  ori          s3, gp, -622
                  fmin.s       fs3, fs11, ft9
                  fcvt.wu.s    a0, fs8, rmm
                  fmin.s       fs1, fs10, fs10
                  fsgnjn.s     ft6, fs8, fs10
                  fdiv.s       ft3, ft6, ft3
                  fdiv.s       fs0, fa3, fs1, rup
                  fmv.x.w      a2, fs11
                  fsgnjx.s     fs4, fs5, ft7
                  fsgnjx.s     fs0, ft10, fa4
                  fadd.s       ft5, fs1, fs9, rup
                  divu         s11, s3, s8
                  srli         t1, a2, 9
                  fdiv.s       fs10, fs9, fa3
                  slti         a3, t0, -1990
                  fcvt.w.s     a0, ft3
                  fsgnj.s      ft4, fs4, ft10
                  or           a2, s0, a1
                  fsgnjn.s     fa5, ft1, fs4
                  mul          t0, s1, a4
                  auipc        t2, 1011343
                  fcvt.wu.s    a0, ft7, rne
                  addi         s9, s6, -101
                  fsgnjn.s     fa1, fs4, fa0
                  slli         t0, a4, 16
                  mul          ra, s2, t5
                  fcvt.w.s     t1, fs1, rtz
                  divu         a4, a6, s2
                  feq.s        sp, fs11, ft5
                  sltiu        s1, s2, 975
                  auipc        a4, 200308
                  fle.s        a3, fs6, fa0
                  sll          t2, s6, s2
                  srai         a3, t2, 22
                  sra          ra, s9, ra
                  fcvt.s.w     ft3, t1
                  fsgnjx.s     ft10, fa1, fa4
                  add          t4, t3, t3
                  fclass.s     t0, fa6
                  sll          sp, a0, s6
                  rem          s11, a4, s2
                  add          s9, a4, t0
                  fsgnj.s      fa5, fs2, fs8
                  fdiv.s       fs6, ft0, fa3, rup
                  mulhu        a1, a2, s9
                  nop
                  or           a3, s9, s3
                  div          t2, s0, a5
                  sra          t4, t1, s0
                  sll          s1, t4, a7
                  xor          s2, zero, tp
                  addi         t2, s4, 361
                  xori         a1, a7, 1422
                  add          t0, t3, a5
                  fmv.x.w      s10, fa4
                  fmv.x.w      s2, fa2
                  fsub.s       fs1, ft8, ft4
                  sra          s3, a7, t4
                  fsgnjx.s     fa0, ft1, fa1
                  and          a0, a6, t4
                  lui          a2, 926928
                  mul          t3, t3, ra
                  fsgnjx.s     fs9, fs5, ft11
                  remu         t3, a2, t1
                  ori          s11, s7, -1804
                  ori          s7, t3, -1256
                  fcvt.s.wu    fa0, s11
                  nop
                  fsgnjn.s     fa0, fs8, ft3
                  slti         a2, s2, 1134
                  mul          s7, sp, t4
                  fmv.w.x      fs2, s11
                  addi         a6, tp, -2040
                  sub          a0, s11, s3
                  fsqrt.s      ft2, ft7
                  sltiu        zero, a4, 457
                  slt          t6, s5, zero
                  divu         zero, tp, s6
                  fcvt.w.s     t6, ft8, rmm
                  slli         zero, a2, 21
                  srl          s7, a3, t5
                  divu         ra, s0, a1
                  sltu         sp, t4, a2
                  flt.s        a7, fs6, fa6
                  fsub.s       fa3, fa7, ft2
                  srai         s4, s7, 20
                  flt.s        zero, ft5, fa6
                  add          s7, t6, a7
                  fsub.s       ft7, fs6, fs7
                  lui          gp, 422245
                  addi         gp, t3, -398
                  sra          s8, tp, tp
                  add          s1, a2, a1
                  fmin.s       fa7, fs5, ft5
                  auipc        zero, 477756
                  srai         t2, t6, 7
                  fmv.x.w      a4, ft5
                  andi         t3, a2, -1660
                  fsgnjn.s     fs4, fs8, ft3
                  sll          s5, s4, s3
                  sll          s4, s3, s6
                  fcvt.w.s     a6, ft5, rdn
                  divu         s4, s0, a2
                  ori          s9, t1, 487
                  divu         t1, a3, s6
                  sub          t0, s2, s10
                  fdiv.s       ft2, fs3, ft0, rmm
                  fcvt.s.wu    fs8, s10
                  add          a6, zero, t3
                  xor          s0, t0, s0
                  slli         gp, s3, 29
                  fsgnj.s      fs9, fa3, ft11
                  mul          a3, a4, s6
                  sub          s2, s4, t4
                  fmv.x.w      s11, fs7
                  sltiu        a0, t4, -578
                  sll          s8, s6, s4
                  nop
                  mul          a3, a1, t5
                  fmin.s       fs6, fs10, fa0
                  xori         a1, s9, -651
                  fdiv.s       fs5, fs8, ft11, rmm
                  auipc        t0, 989443
                  fmv.w.x      fs5, t5
                  auipc        a7, 757056
                  fcvt.s.w     ft9, gp, rdn
                  auipc        s0, 70327
                  xor          t6, t5, zero
                  rem          t1, ra, s3
                  fcvt.wu.s    zero, fs1
                  mulhsu       sp, s7, t0
                  fsgnj.s      ft5, fa1, fa6
                  srli         s5, s8, 24
                  mulh         t1, gp, s11
                  sll          ra, s1, s4
                  fcvt.s.wu    fs5, s8
                  feq.s        t3, fa5, fa3
                  fmax.s       ft5, ft4, ft2
                  sltiu        s4, s8, -119
                  ori          s8, a1, -1779
                  div          s5, a4, s4
                  fmv.x.w      s5, fa0
                  fclass.s     ra, fa7
                  remu         s1, a0, a3
                  fmin.s       fs5, ft3, fa2
                  or           a3, sp, t0
                  nop
                  slli         t1, s10, 14
                  fmin.s       fa4, fa6, fa2
                  mul          t6, a1, t3
                  srl          zero, a6, a2
                  fle.s        s4, ft8, ft0
                  fcvt.s.wu    fa6, s9, rne
                  slti         ra, s10, 1509
                  mul          a2, a3, t3
                  or           t0, s5, a5
                  div          s6, s4, t4
                  fmin.s       fs11, fa4, fs11
                  fmul.s       fs5, ft0, fs6, rmm
                  div          a7, s3, s0
                  div          s10, s0, sp
                  div          s11, tp, s0
                  add          t1, s4, gp
                  srli         a3, s7, 8
                  fdiv.s       ft3, ft7, fs0
                  sltu         t2, t0, s5
                  feq.s        a4, ft10, fs8
                  mulh         a3, s2, t1
                  flt.s        s2, fa2, fs3
                  auipc        a1, 767039
                  fsgnj.s      fa3, fs0, fa5
                  fle.s        a2, ft7, fs9
                  lui          a0, 629213
                  fmul.s       ft9, fs2, fs2
                  fcvt.w.s     s0, ft11, rmm
                  sll          s8, s3, a2
                  addi         a7, t6, 980
                  fsub.s       ft2, ft7, fa0, rup
                  fmax.s       ft9, fs7, ft8
                  ori          a0, s9, -982
                  srl          t2, a5, gp
                  sll          t6, s3, a7
                  fclass.s     t6, ft10
                  fclass.s     s2, fa0
                  nop
                  fadd.s       ft6, fs2, ft5
                  or           a2, t2, t2
                  and          a3, s3, t6
                  add          s4, a0, s11
                  fmin.s       fa1, fs2, fa4
                  fmv.x.w      t4, fs2
                  fdiv.s       fs4, fa4, fa1, rup
                  fadd.s       fs2, ft4, fs8, rmm
                  fclass.s     s5, fa1
                  xor          t6, s5, t2
                  divu         t6, a6, s5
                  add          s0, s5, s2
                  srli         s4, a2, 9
                  fmv.w.x      fs6, t2
                  fsgnjx.s     fs10, ft6, fa1
                  fmv.x.w      ra, ft4
                  fclass.s     a6, fa4
                  slti         ra, a0, 985
                  sra          s8, t4, zero
                  xori         a0, a0, 628
                  fsgnj.s      fs7, ft9, ft9
                  and          s7, t5, t6
                  fmv.x.w      s0, fs8
                  rem          s0, a2, s7
                  flt.s        a2, fs3, ft9
                  srli         a7, s0, 9
                  rem          s7, t0, a3
                  fmv.x.w      gp, fs3
                  fmul.s       fs3, ft6, ft0, rtz
                  fle.s        t3, fa6, ft1
                  srai         s11, t2, 7
                  feq.s        a1, ft2, fs5
                  lui          a1, 406270
                  div          s6, t6, sp
                  andi         s11, s8, -1749
                  and          s10, s2, gp
                  or           s3, a6, s2
                  sub          t3, ra, s3
                  fsgnjx.s     fs1, fs1, ft0
                  add          a2, s2, a3
                  nop
                  slti         s11, t6, -260
                  slti         t3, s5, -43
                  srl          t4, s2, t0
                  fmax.s       ft2, fs6, ft5
                  mulh         s0, tp, s1
                  or           t0, s9, a7
                  mulhsu       t2, a6, s6
                  mulh         s4, s5, s2
                  fmul.s       ft11, ft8, ft10
                  slti         a7, a2, 1848
                  or           t0, gp, t0
                  and          s9, t0, s4
                  feq.s        a6, ft8, fs11
                  nop
                  addi         a7, t6, -1526
                  flt.s        t6, ft0, ft9
                  sltu         a2, zero, sp
                  xor          s11, s9, a6
                  slli         a2, s9, 7
                  fcvt.w.s     a0, ft7, rtz
                  fclass.s     t4, fa6
                  mulh         s9, a6, a3
                  sll          s4, t6, s0
                  flt.s        s7, ft7, ft9
                  divu         s7, s7, a2
                  fsub.s       fs5, ft8, fs8, rne
                  srl          a0, s3, s5
                  fle.s        s7, ft5, fs2
                  srl          s10, a0, a1
                  slli         sp, a3, 16
                  fcvt.s.wu    ft7, a3
                  sra          s2, gp, a1
                  fsgnjn.s     fs7, fs8, fs4
                  fclass.s     s8, fs3
                  fadd.s       fs4, fs4, fa1
                  mul          t2, s9, s0
                  fsgnjn.s     fs8, ft9, fs9
                  divu         sp, gp, s1
                  fmax.s       ft5, fs5, fa6
                  fadd.s       fa7, ft4, fs4, rtz
                  fsqrt.s      ft0, fa5, rmm
                  mul          s0, t6, s8
                  fsgnjn.s     ft5, ft4, fs9
                  nop
                  fcvt.wu.s    a1, ft0, rtz
                  fcvt.w.s     t2, fs8
                  flt.s        t0, fs6, fs10
                  fsgnjn.s     fa3, fs5, ft10
                  and          s8, a7, a6
                  fsub.s       fa7, fs11, fs3
                  slti         s0, s2, 1423
                  mulh         s9, s8, gp
                  srl          s8, t4, a2
                  fsub.s       fs3, fa1, fa4
                  andi         s0, zero, -1458
                  addi         s11, ra, 837
                  srai         t4, s0, 2
                  sll          s3, s11, s7
                  fsub.s       ft1, ft0, fs5, rne
                  slli         s8, t6, 4
                  lui          a0, 277680
                  flt.s        a6, ft10, ft3
                  flt.s        a1, fa2, fa0
                  fmv.w.x      ft2, a5
                  srli         a2, gp, 2
                  fsgnj.s      ft6, fa7, ft8
                  fcvt.s.w     fs3, s2, rmm
                  sll          s2, s8, s4
                  fcvt.w.s     a7, fa7
                  fadd.s       ft7, fs9, ft10, rup
                  remu         gp, a3, gp
                  auipc        t4, 1044805
                  sltiu        gp, s11, -320
                  divu         s0, ra, a7
                  divu         a1, a6, gp
                  mulh         t2, a3, s10
                  xori         a0, t1, 900
                  fsgnjn.s     ft2, ft3, ft4
                  fcvt.s.wu    ft11, s2, rdn
                  fcvt.s.wu    fa5, a6
                  xor          a0, s10, sp
                  fdiv.s       fa5, fs7, fa1
                  srli         s4, s10, 15
                  and          a1, s1, a1
                  xori         s2, a5, -1235
                  fmul.s       fa3, ft3, fa3, rmm
                  rem          s2, t6, a1
                  fle.s        s0, fs0, ft2
                  fsgnjx.s     fa1, ft9, fs11
                  fsgnjx.s     ft3, fa1, ft5
                  add          a0, sp, t6
                  xor          s7, t1, s5
                  ori          t2, t1, 990
                  fsub.s       fa6, fs1, ft7, rdn
                  fclass.s     s2, fs1
                  sra          a2, a6, s4
                  auipc        t0, 392908
                  flt.s        a1, fa4, ft3
                  slti         s8, t3, -1008
                  div          t4, zero, s3
                  addi         s1, t3, -1102
                  divu         s10, a7, gp
                  srai         s10, a1, 5
                  addi         s5, t6, -1943
                  sra          t3, ra, a3
                  sub          a0, t0, tp
                  fcvt.s.w     ft7, a3, rne
                  slt          a4, t5, tp
                  rem          s3, gp, t4
                  xori         zero, s0, 1712
                  fmin.s       fs1, ft10, fa1
                  fmv.x.w      t6, fs8
                  sra          a6, s1, a0
                  srai         s5, s9, 15
                  fmv.x.w      s9, fs0
                  fadd.s       fs10, fs11, fs0, rup
                  fcvt.wu.s    a4, ft3, rdn
                  srli         s5, zero, 19
                  fmax.s       ft11, ft3, fs11
                  fmin.s       fa0, fs6, ft2
                  slti         t1, s9, 1110
                  remu         sp, s1, tp
                  sra          t4, gp, t1
                  fmin.s       ft11, ft4, fs0
                  div          s4, s5, t6
                  fsqrt.s      fa5, fs0
                  srl          a4, s7, gp
                  xori         a0, a1, 867
                  rem          a4, sp, s5
                  fmul.s       ft4, fs10, fs8
                  srai         s11, tp, 17
                  sltiu        s1, zero, 750
                  mul          a0, t5, s0
                  fsgnjn.s     fs9, fs8, fa5
                  fadd.s       fs1, fa3, fa0, rne
                  ori          s10, a3, 1310
                  feq.s        t6, ft10, ft1
                  slt          a6, a0, s6
                  sltu         s8, t6, a2
                  remu         t3, t2, t0
                  mulhu        a0, s4, s4
                  fsqrt.s      fs10, ft1, rup
                  fmul.s       ft9, fs5, fs1, rmm
                  fcvt.wu.s    s5, fs3
                  fsgnjx.s     fa4, ft3, ft0
                  sll          s5, t1, s0
                  fadd.s       ft1, fa5, ft4
                  mulhu        zero, tp, t4
                  sltiu        s11, a3, 214
                  slt          a1, s6, s0
                  fcvt.s.w     ft7, s2
                  remu         s7, a0, s0
                  divu         zero, a2, s8
                  remu         t4, t6, s3
                  fsub.s       fa0, fs10, fs4, rne
                  fclass.s     t1, fa7
                  srli         s0, t2, 8
                  fmax.s       fa0, ft2, fs6
                  fmv.x.w      s2, ft1
                  or           a2, s4, tp
                  feq.s        a3, fs10, fa0
                  fsqrt.s      ft9, fa3
                  fsgnjn.s     ft4, fs7, fs9
                  fmax.s       fs5, fa5, ft3
                  andi         sp, t0, -1339
                  ori          a2, s10, 1572
                  remu         s9, t2, a0
                  andi         sp, t4, -1560
                  fsqrt.s      fa3, fs2
                  mulhsu       t4, s7, s11
                  sltiu        s10, tp, 754
                  fadd.s       fa5, fs7, ft0
                  flt.s        t0, ft0, fs3
                  slti         a2, sp, 1474
                  divu         a0, s8, s10
                  divu         s2, t6, s2
                  ori          ra, s3, 1616
                  sll          s3, a2, s0
                  sra          gp, t6, s0
                  fdiv.s       fs7, fs9, ft11, rup
                  fdiv.s       fa1, fs2, fa2
                  srai         sp, t1, 19
                  andi         s8, t6, -672
                  div          s8, a7, gp
                  fle.s        sp, fs9, fs11
                  mulhsu       t3, a3, tp
                  fsgnj.s      fs3, fs3, ft3
                  andi         a6, t3, 656
                  and          t1, a1, t5
                  or           a7, s11, t5
                  fsub.s       ft9, fa7, fa3, rdn
                  add          t6, a4, s1
                  sll          t0, t6, a0
                  mulhsu       s11, s11, s6
                  fsub.s       fs1, fa6, fa2
                  fdiv.s       fs10, fa3, fa2, rup
                  remu         s11, s9, a0
                  fadd.s       fs8, ft8, fs0
                  fsgnjx.s     fs1, ft4, ft0
                  fclass.s     t4, ft6
                  and          s7, s7, s2
                  fsgnjx.s     ft1, fa7, ft1
                  ori          s4, s4, -1532
                  sltu         a4, a4, a6
                  fsqrt.s      ft6, ft8, rup
                  fsgnjx.s     fs10, fs10, fs7
                  xor          s8, s1, sp
                  fcvt.s.wu    fs10, s5
                  fsub.s       fs3, ft10, ft9, rdn
                  mulhu        t0, s1, s7
                  sltiu        a3, t3, 1960
                  fcvt.w.s     a0, ft2
                  fcvt.s.w     fs1, s4
                  addi         a4, zero, -1810
                  andi         a3, s4, 820
                  fcvt.s.wu    fs7, s2
                  mulhu        t4, s6, t0
                  fdiv.s       fs11, fa0, fs10
                  xori         s9, a1, 1501
                  or           a3, s6, a7
                  fadd.s       ft0, ft7, ft5, rdn
                  lui          t2, 710009
                  fcvt.s.w     fs5, gp
                  feq.s        a0, fs9, fs0
                  flt.s        a0, ft8, ft3
                  fmax.s       fs2, fs0, fs9
                  flt.s        gp, fa2, fs0
                  srli         s8, a5, 4
                  ori          a4, tp, 146
                  fadd.s       ft6, ft10, fa1, rdn
                  fmax.s       ft6, fs4, fa5
                  xor          s8, s8, zero
                  srai         s3, a3, 11
                  and          zero, s10, a0
                  slli         t1, ra, 13
                  auipc        a2, 965704
                  fclass.s     a7, ft4
                  fsgnj.s      ft11, ft0, ft1
                  remu         s8, sp, s11
                  fmax.s       ft10, ft10, ft2
                  fcvt.w.s     zero, fs8
                  slli         s2, t0, 23
                  ori          a1, s9, 13
                  and          a0, sp, t2
                  srai         ra, s8, 21
                  mul          a2, s11, a5
                  fcvt.w.s     t2, fs1, rdn
                  fclass.s     s6, fs1
                  xor          a7, s4, a1
                  fsgnj.s      ft7, fs3, ft10
                  fmul.s       fs3, fs3, ft5
                  mulhu        s7, a0, s4
                  nop
                  sra          s0, ra, t2
                  lui          ra, 8313
                  remu         a2, s1, a0
                  rem          s9, t1, a0
                  slt          ra, s11, sp
                  fsub.s       fs0, fa5, fs6
                  remu         s6, gp, a7
                  feq.s        a6, ft3, fs4
                  add          s8, s2, t0
                  fsgnjx.s     fa7, fs5, fa4
                  andi         s5, s3, -716
                  mul          s2, t4, s3
                  andi         t3, s4, 1109
                  fmul.s       fs11, fa2, fs6
                  add          t4, s5, a6
                  lui          zero, 29496
                  mulhu        s7, t0, a6
                  fcvt.wu.s    sp, fs9, rtz
                  sub          t1, s10, t1
                  div          a0, zero, s5
                  xor          t3, a7, s10
                  mulh         s9, t0, a6
                  fsqrt.s      fs9, fs3
                  slti         t0, ra, -1647
                  fdiv.s       ft7, fs1, fs8, rup
                  ori          a3, zero, 1502
                  fmul.s       ft9, fa0, ft2, rne
                  fmv.w.x      ft8, s3
                  fsgnjx.s     ft3, ft10, ft1
                  mulh         t2, s6, s1
                  div          s5, a3, t1
                  mulhsu       a0, s2, t2
                  feq.s        s0, ft2, ft0
                  remu         a4, s9, s6
                  andi         s0, s0, -180
                  fcvt.w.s     s6, fa4, rne
                  mulh         a2, s5, a6
                  lui          a0, 854947
                  remu         a1, a4, a3
                  mulhsu       t4, t0, a7
                  fmul.s       ft3, fs6, ft2
                  ori          sp, a0, -487
                  add          a1, t4, s7
                  fmul.s       ft7, fs5, ft2
                  fsgnj.s      fs5, fs11, ft6
                  srli         a7, ra, 25
                  fsqrt.s      fs11, fa3
                  lui          a0, 822298
                  fcvt.w.s     t6, ft1
                  sltiu        t0, s8, -1598
                  divu         zero, a3, t0
                  mul          sp, s9, s4
                  fsgnjx.s     ft0, ft2, ft6
                  feq.s        gp, ft6, fs10
                  mulhu        a2, t0, t3
                  divu         s4, a4, s0
                  fcvt.wu.s    zero, fs1, rtz
                  fsgnjn.s     ft4, ft8, fs6
                  srl          t6, s0, zero
                  fsgnjn.s     fa6, fa2, fa5
                  slt          s0, tp, zero
                  sra          a4, a4, s9
                  sltiu        t4, t1, 602
                  fmv.w.x      fs8, tp
                  xori         a3, s2, 1991
                  fsqrt.s      ft3, fs11, rup
                  lui          s9, 881058
                  mulhu        a3, a0, zero
                  slli         a2, gp, 2
                  slli         a7, t6, 6
                  fcvt.s.w     ft2, t4
                  fsqrt.s      ft7, ft3
                  lui          t4, 747826
                  srli         a2, s5, 6
                  feq.s        a6, ft0, fs10
                  rem          t1, s0, a2
                  fsgnjn.s     ft7, fs9, fs2
                  remu         t1, s8, t4
                  slli         t3, t6, 29
                  sra          a3, t0, a3
                  sltiu        a0, s2, -225
                  slti         s2, t6, 1987
                  slt          s3, t2, a7
                  srai         s1, s10, 5
                  slti         t0, s5, 1792
                  and          s8, s4, s5
                  mul          s5, sp, t4
                  fmv.w.x      ft4, t1
                  fmin.s       ft11, fa4, ft8
                  fdiv.s       fs0, fa0, fa3
                  mulh         s6, s0, s3
                  fcvt.w.s     t3, ft5
                  fcvt.wu.s    a7, ft10, rmm
                  fdiv.s       fa7, fa2, fs0, rmm
                  mulhsu       a1, tp, a7
                  slti         t3, zero, -430
                  fmin.s       ft10, ft2, fs2
                  feq.s        s11, fs10, fs11
                  remu         gp, t1, a3
                  mulhu        t4, a5, a5
                  remu         t1, a4, s3
                  sra          t3, s11, a3
                  fdiv.s       fs4, fs1, fs11
                  mul          s5, t6, a2
                  sra          s2, a7, a3
                  fle.s        ra, ft7, fs9
                  feq.s        s8, fa0, fa2
                  xori         a2, a5, -1177
                  fcvt.s.w     ft8, s11
                  mulhsu       s6, a3, s7
                  mulh         t3, ra, tp
                  fdiv.s       ft1, fa7, fa6, rup
                  fmin.s       fs5, fs6, fs9
                  divu         a0, tp, a5
                  fmax.s       ft0, fs0, ft0
                  addi         t6, s2, -2002
                  auipc        s0, 37825
                  fmv.w.x      fa6, s6
                  mulh         s6, sp, t5
                  auipc        t4, 221968
                  fadd.s       ft7, ft9, fs10
                  lui          t4, 872269
                  sltu         a3, s9, t0
                  fclass.s     t4, fs9
                  fsgnjn.s     fs7, ft0, fs5
                  fmax.s       fs5, fa3, ft5
                  and          t6, t4, s8
                  sra          t0, s5, tp
                  remu         a3, s5, a3
                  and          s7, gp, t1
                  sltu         t1, t5, a2
                  sltiu        zero, gp, -678
                  fcvt.w.s     a4, ft3
                  slti         t2, gp, -2016
                  fmin.s       ft9, fa6, fa6
                  srai         s10, t5, 21
                  add          s5, gp, s3
                  lui          ra, 106731
                  fmv.w.x      fa3, t2
                  slti         s4, s10, -577
                  div          a1, s2, t1
                  sltiu        s4, s11, -2034
                  mulhsu       s10, a5, a1
                  andi         s3, zero, 520
                  and          s11, t3, a0
                  fcvt.w.s     s11, ft4, rdn
                  fclass.s     a7, fa0
                  fcvt.wu.s    s7, fa0
                  div          t3, sp, s6
                  fcvt.s.w     fs6, t2
                  andi         sp, s11, 411
                  add          s5, t2, s7
                  mulhu        s9, s0, s11
                  fsgnjn.s     fa1, fs7, fa7
                  auipc        s9, 793873
                  auipc        s10, 1029173
                  fsgnjn.s     fs7, ft8, fa2
                  add          s8, gp, s0
                  sll          t2, a1, a1
                  fmin.s       fa7, fs8, fs5
                  fmin.s       fs10, fa5, fs2
                  fmul.s       fa4, ft5, fa4
                  flt.s        t6, fa7, fa3
                  srai         s7, s0, 11
                  fsub.s       ft5, fs0, fs9, rne
                  xori         s7, t3, 19
                  fmax.s       fs3, ft7, fs6
                  fclass.s     s6, ft11
                  srai         s1, gp, 12
                  mul          gp, ra, t1
                  fmax.s       fs8, ft4, ft0
                  xori         a7, t5, -119
                  fsub.s       ft9, fs4, fa4, rdn
                  or           s0, s6, t2
                  fmax.s       ft11, fs2, fs0
                  fsqrt.s      ft5, ft2
                  lui          zero, 983644
                  fdiv.s       fa7, fs0, ft7, rdn
                  mulhu        s9, a1, a2
                  fcvt.s.wu    fs2, t4
                  xori         zero, sp, 1111
                  fsgnj.s      fs1, fa6, fa2
                  remu         zero, s2, a1
                  fle.s        a7, ft8, fs8
                  srl          s4, s4, t0
                  fdiv.s       ft3, fs10, fa5
                  sltiu        a7, a3, -260
                  xori         sp, s6, 176
                  srli         s3, t2, 4
                  andi         a2, t5, -690
                  sltiu        t1, t2, 125
                  auipc        s1, 904444
                  fmin.s       ft9, fs5, ft4
                  lui          a1, 850374
                  sltu         a6, s8, t6
                  fmv.w.x      fs0, a1
                  fsqrt.s      fs6, ft3
                  div          t3, s4, ra
                  sltu         s11, a3, t6
                  fle.s        zero, ft4, ft10
                  fmin.s       fa4, ft8, ft6
                  div          s8, sp, s10
                  andi         s2, t3, 1963
                  fcvt.wu.s    t1, fs3, rne
                  rem          a2, s0, s5
                  fclass.s     sp, ft9
                  fmv.w.x      fa3, s9
                  mul          s10, tp, zero
                  fmv.x.w      a0, fs6
                  mulh         a7, a7, a3
                  slt          s10, sp, s9
                  and          s9, s8, s5
                  fsgnjx.s     fs2, fs5, ft1
                  srli         t0, s2, 14
                  fsgnj.s      fa4, fs7, ft3
                  fsgnjn.s     ft2, ft0, ft6
                  fclass.s     t1, fs5
                  fmv.x.w      a1, fs7
                  fcvt.s.w     fa6, s5
                  flt.s        sp, fs10, ft11
                  and          a4, s11, s8
                  fsgnjx.s     fs10, fs4, fa1
                  flt.s        s11, fs2, fs7
                  slli         a2, t4, 25
                  fmul.s       fa0, fs1, fs5, rmm
                  fmax.s       fa5, fs10, fs2
                  add          s2, s6, t3
                  slti         a2, s11, -1133
                  sub          a6, s8, s3
                  ori          gp, s10, -1051
                  mul          a7, s3, zero
                  fmv.x.w      gp, fa1
                  fsqrt.s      ft9, ft2, rtz
                  ori          s4, a7, 278
                  fmv.w.x      ft9, s5
                  fcvt.w.s     t1, fa4
                  srli         a1, s0, 12
                  rem          gp, a5, s9
                  slt          a3, s4, a5
                  mulh         zero, s0, t2
                  slt          t3, a0, a1
                  andi         a7, a7, -1792
                  fsgnj.s      fa7, fa1, fa6
                  sra          a4, s11, s10
                  nop
                  fcvt.wu.s    gp, ft10
                  srl          zero, a3, t2
                  flt.s        a0, fa0, fs4
                  nop
                  nop
                  fsgnjx.s     ft3, fa1, ft6
                  remu         t3, t4, s5
                  fmax.s       fs0, fa5, fa3
                  fmul.s       fs0, ft2, fa7
                  sra          ra, s10, a2
                  sll          a1, a0, t1
                  flt.s        s11, fs0, ft6
                  srai         a3, a2, 17
                  feq.s        s6, fs1, fs2
                  fcvt.s.w     fs1, s10, rtz
                  fclass.s     a0, fa5
                  sra          zero, s6, ra
                  mulhsu       s5, t5, t5
                  fsgnjx.s     ft4, ft7, fa6
                  fmax.s       fa4, ft9, ft9
                  or           sp, s4, s10
                  fsub.s       ft11, ft5, ft0, rdn
                  fsgnjx.s     fs6, fs11, fs6
                  fcvt.w.s     s11, fs10
                  fcvt.wu.s    a4, fs5
                  nop
                  fclass.s     gp, ft1
                  fle.s        t2, fs10, fa7
                  nop
                  fsgnjx.s     ft11, fs3, fs10
                  fmin.s       ft7, fa3, fs9
                  div          t0, s6, s3
                  fcvt.wu.s    t4, fa7
                  srli         zero, s9, 17
                  ori          ra, ra, 838
                  fcvt.wu.s    t4, fs7, rtz
                  srl          t4, tp, s10
                  sra          s2, a7, gp
                  mulhsu       s7, sp, t5
                  fcvt.wu.s    a0, fs11, rmm
                  sll          s4, t5, s2
                  fsub.s       fs7, fs7, fs5, rne
                  xori         a2, a6, -1317
                  fmin.s       fs6, ft1, fa1
                  sub          a6, t4, t1
                  sra          a6, t4, s11
                  rem          s1, s9, t0
                  andi         t0, t4, 1737
                  fmv.x.w      s5, fa0
                  and          t2, t6, tp
                  nop
                  mulhu        a4, s9, s7
                  fsgnj.s      ft9, fa2, fs7
                  fcvt.s.wu    fs11, t5
                  fmul.s       ft2, ft5, ft0, rdn
                  fclass.s     a6, fs5
                  divu         s0, tp, a2
                  fcvt.w.s     s8, fs11
                  sltu         a2, t4, a2
                  mulhsu       s9, t4, s4
                  fcvt.wu.s    a4, ft2
                  sra          s6, ra, a2
                  fcvt.w.s     a0, ft2, rne
                  xori         s7, s0, 924
                  fcvt.wu.s    zero, fs7
                  sltiu        a2, s0, 1194
                  or           gp, tp, s1
                  fclass.s     s3, fa2
                  sll          s5, s4, gp
                  mul          s7, s8, a4
                  fsgnjx.s     ft3, ft2, fa5
                  fadd.s       fa3, ft3, fs3, rmm
                  fadd.s       fs6, fa5, ft5, rup
                  fsgnjx.s     ft8, ft7, fs3
                  fsgnj.s      fs9, ft10, ft7
                  sltu         a4, s3, t1
                  fcvt.s.wu    fs10, s5, rup
                  mulhu        a7, t4, a7
                  srl          s0, s10, t3
                  sltu         a7, s11, s11
                  remu         s5, s10, a6
                  or           s7, a1, sp
                  ori          s10, s9, -394
                  fle.s        sp, fs9, fs2
                  fsgnj.s      ft11, ft4, fs7
                  divu         s5, s1, s2
                  mul          t3, s2, s9
                  fsqrt.s      fa1, fa4, rtz
                  fclass.s     sp, ft7
                  or           a6, a7, t3
                  nop
                  nop
                  lui          a7, 997507
                  addi         t1, t5, 726
                  srl          s1, ra, s2
                  srl          a7, tp, sp
                  fmv.x.w      s6, fs8
                  addi         zero, s7, -289
                  fle.s        s3, fs1, fs6
                  fmv.w.x      fa7, t1
                  divu         zero, s8, s11
                  fmul.s       fs8, ft10, fs4, rtz
                  fle.s        t6, ft4, fs3
                  ori          s6, s9, -663
                  xori         t6, t5, -1143
                  rem          gp, gp, zero
                  srai         s2, t4, 10
                  add          s6, t4, t0
                  flt.s        t0, fs3, fa5
                  srl          t4, s1, t6
                  rem          t4, a0, a1
                  mulhsu       s7, a5, t4
                  feq.s        s8, fa4, ft6
                  divu         s0, a4, sp
                  and          ra, a3, t0
                  fmul.s       fa1, fa2, ft8, rne
                  fsgnjx.s     fa1, ft2, fs7
                  divu         a2, a3, t4
                  mulhsu       s11, a2, s11
                  mulh         t3, zero, s10
                  fmv.w.x      fa1, a0
                  lui          s2, 289847
                  fclass.s     s5, fs7
                  fmv.x.w      t2, ft3
                  fle.s        s2, ft1, fs4
                  div          a0, s7, s9
                  fdiv.s       fs10, ft11, fa1, rmm
                  slti         s11, a5, 1982
                  fsgnjx.s     ft3, fs10, ft7
                  sub          t6, sp, t3
                  slt          a0, s1, t6
                  mulhsu       a0, s9, a7
                  andi         a0, s9, -780
                  fsqrt.s      ft11, ft4
                  sra          sp, a4, s0
                  fsgnj.s      fs9, fs1, fs11
                  sra          t2, sp, sp
                  fclass.s     a2, fa0
                  ori          s9, a2, -1875
                  fle.s        s2, ft4, fs10
                  slli         a4, s5, 3
                  srai         s1, a3, 16
                  slti         a6, t6, -917
                  srli         s7, gp, 14
                  andi         a0, s11, 1934
                  xor          s7, s10, s0
                  fdiv.s       fa0, fs3, fs0, rne
                  and          t4, zero, a2
                  add          ra, s4, a5
                  fdiv.s       ft6, fs4, fs1
                  xor          t6, t2, t3
                  add          s10, a7, s11
                  fclass.s     s2, ft1
                  feq.s        s7, fs0, ft5
                  sra          zero, a2, t0
                  xor          s5, a1, tp
                  add          s5, t1, sp
                  auipc        sp, 936344
                  fsgnjn.s     ft9, ft1, ft6
                  fsgnj.s      fa5, fs8, ft1
                  fmv.w.x      ft0, zero
                  fmax.s       fs4, fa5, fs11
                  mulhsu       a2, s4, gp
                  fsgnjn.s     fs10, ft4, fs0
                  mulhu        s3, s6, s5
                  fsqrt.s      ft9, fa7
                  lui          s6, 238528
                  fsub.s       fa7, ft5, fs4
                  sub          s5, a1, ra
                  add          t0, a1, zero
                  fmax.s       ft8, fa5, fs6
                  slti         t3, s10, -2004
                  fsub.s       ft3, fa7, ft1
                  fcvt.wu.s    a6, fs5
                  addi         t6, ra, -556
                  xori         a0, s11, -1954
                  fclass.s     t6, ft11
                  mulhu        s1, t4, s11
                  mulhsu       a4, s7, t0
                  addi         t6, a0, 2044
                  divu         s5, s11, a1
                  fmv.x.w      a4, fa2
                  fmv.x.w      zero, ft7
                  slti         s5, sp, -539
                  andi         s5, t3, -782
                  fsgnj.s      fs7, fs5, fs1
                  div          t6, a4, s4
                  mulh         s0, a0, s1
                  and          s10, a3, s9
                  and          t1, s8, t3
                  feq.s        s1, fs0, fa2
                  and          a4, s11, a0
                  fcvt.w.s     s0, fs10, rtz
                  slli         s4, s2, 25
                  mulhu        t2, s5, t5
                  sra          s1, t3, s11
                  fmul.s       fs2, fs4, ft8
                  fcvt.w.s     t0, fa0, rmm
                  rem          sp, s7, t1
                  fsgnjx.s     fa2, fs2, fs8
                  mul          a0, a4, s11
                  mulh         zero, a7, s9
                  fadd.s       ft6, ft2, ft5
                  remu         s11, t0, s1
                  srl          s5, s4, s8
                  mulh         a0, s1, s8
                  xori         zero, s7, -599
                  or           a2, s5, s2
                  mulh         t1, a3, a3
                  fsqrt.s      ft0, ft9
                  fmv.x.w      s11, ft0
                  fcvt.wu.s    t6, fa0
                  divu         a1, s3, a5
                  fclass.s     s9, fs3
                  fmul.s       ft8, fs1, fs3
                  add          s7, s7, t2
                  fsgnj.s      ft3, ft6, ft8
                  slt          t3, t5, s3
                  fsgnjn.s     ft8, ft1, fa6
                  fmul.s       ft4, fs10, fs0, rne
                  add          a6, s8, a1
                  add          a6, s1, sp
                  lui          t0, 508963
                  fle.s        s7, fs10, ft10
                  fcvt.s.w     fs6, s8, rtz
                  rem          s2, s7, s7
                  andi         s7, s10, -91
                  fmv.w.x      fa7, s9
                  xori         s6, a4, 970
                  fadd.s       fs0, fa1, ft10
                  fmin.s       fa5, fs8, ft2
                  or           s6, t3, sp
                  andi         t2, s7, -1604
                  fsub.s       ft9, fa6, ft10
                  fadd.s       fa4, ft9, fa7, rne
                  fmin.s       ft1, fs1, ft0
                  fclass.s     s2, fs4
                  lui          t3, 146421
                  fmv.w.x      fs11, t5
                  fmv.w.x      fa6, s5
                  sub          s9, t3, s2
                  ori          s4, gp, -76
                  or           s7, gp, s4
                  and          s2, sp, t0
                  fdiv.s       fs3, fs10, fa4, rup
                  fsgnjx.s     ft10, fs7, fs5
                  sltu         s4, a3, s3
                  fsub.s       fs6, ft1, fa0
                  fadd.s       fa3, fa7, fs7, rdn
                  rem          s8, zero, s2
                  fsqrt.s      ft3, ft1, rup
                  fmax.s       fs6, fs6, ft3
                  sll          a6, ra, t6
                  flt.s        a4, fs6, fs6
                  fcvt.wu.s    a3, fs2
                  fcvt.wu.s    s0, fa6
                  fsgnjn.s     fs11, fs1, fs5
                  fsgnj.s      ft9, ft8, fs9
                  fmul.s       fa2, ft1, ft2
                  fdiv.s       fa3, fs5, ft5
                  srai         s9, a3, 3
                  fmax.s       fs7, fs0, ft9
                  add          s11, a4, t2
                  fcvt.s.w     ft11, zero
                  xor          t4, a5, t3
                  sra          s2, a6, s10
                  slti         s4, s0, 1331
                  fmin.s       ft1, fa1, ft10
                  fmax.s       fs11, ft11, ft7
                  rem          t0, a2, tp
                  fsub.s       fs1, fs5, fa3, rtz
                  fmax.s       fs1, ft10, fs11
                  nop
                  and          t1, tp, s5
                  add          s11, s3, zero
                  fmin.s       fs9, fs9, ft8
                  fsub.s       ft0, fs7, ft10, rne
                  xori         s11, tp, 324
                  sub          a6, t6, s2
                  fdiv.s       fs6, fs7, fa3
                  xori         a1, s6, -1057
                  fsgnjn.s     fs6, ft8, fa0
                  xor          ra, sp, a5
                  sra          s4, a6, s2
                  fsgnj.s      ft4, fs11, fs1
                  xori         a1, t3, 81
                  and          a3, tp, s10
                  slti         s10, a1, -1334
                  srai         s4, s7, 19
                  sra          a3, t2, gp
                  sub          s3, a4, t1
                  srli         s2, s9, 28
                  sll          t3, s6, t2
                  sltiu        s6, zero, 1800
                  fcvt.w.s     a0, fa4
                  sub          s8, ra, ra
                  sub          s9, a1, a0
                  srli         sp, s8, 12
                  sll          s2, a5, s9
                  fcvt.s.w     fa0, s0
                  nop
                  fmax.s       ft7, fa5, fs7
                  andi         zero, s3, 1051
                  slli         s4, gp, 8
                  srli         t1, a4, 17
                  fsub.s       ft10, fs11, fs4
                  fcvt.s.w     fs9, t3
                  fclass.s     s10, ft9
                  fsub.s       fs4, fa7, ft1
                  mulhu        a2, s10, t5
                  sltu         s6, s10, s2
                  fmin.s       ft10, ft7, fs1
                  auipc        a6, 707179
                  add          ra, s8, sp
                  fmv.w.x      fs8, s7
                  add          a6, t2, a4
                  srai         zero, s9, 14
                  xor          a0, a5, zero
                  mulhsu       zero, s6, t6
                  xori         gp, s4, 1673
                  rem          s5, a2, s3
                  fcvt.w.s     s6, ft1
                  xor          t4, s4, s3
                  fmin.s       fs0, fs6, fa0
                  xori         a2, s3, 303
                  sra          s8, a2, t4
                  xori         s3, t1, -1582
                  fsgnjx.s     fs11, fa5, fa1
                  fsgnj.s      fa1, ft5, fs9
                  fmax.s       fs1, fs1, ft1
                  slli         s6, tp, 26
                  xori         sp, a0, 44
                  fcvt.s.wu    fa3, tp, rtz
                  and          s4, t0, s8
                  feq.s        a7, fa0, ft9
                  remu         t4, a5, s7
                  or           a2, s10, s11
                  add          s0, t0, gp
                  fmax.s       fs8, fs9, fa5
                  srai         s9, s6, 30
                  fmax.s       ft8, fs8, ft0
                  lui          s11, 322373
                  fcvt.wu.s    a3, fs9, rmm
                  nop
                  divu         s1, s9, s5
                  fcvt.w.s     t0, ft10, rtz
                  sra          s4, t5, t4
                  srl          a3, t6, s11
                  slti         t3, a3, 613
                  sub          sp, t6, s3
                  div          a7, s8, a1
                  sltiu        a7, t2, 1208
                  mul          a1, s9, s10
                  addi         t0, a5, 135
                  fmv.w.x      fa3, t1
                  div          t0, t0, t4
                  andi         s4, a6, 871
                  mul          t1, a6, a7
                  fcvt.wu.s    a6, fs4
                  addi         a3, a5, -1512
                  fcvt.w.s     ra, fs6
                  xori         s9, a7, 1723
                  fsgnjx.s     ft5, ft11, fs11
                  sltiu        a4, a4, 1734
                  fmv.w.x      ft9, s8
                  add          a7, a1, s5
                  auipc        s3, 732797
                  slli         zero, t3, 20
                  fcvt.s.wu    fs7, s3, rup
                  fcvt.wu.s    t2, fa3
                  fcvt.wu.s    t2, fa2
                  feq.s        a4, ft9, fs9
                  ori          zero, s1, 1078
                  sra          s4, t1, s2
                  and          s11, s7, a4
                  fsgnjn.s     fs2, fa3, ft5
                  sltu         ra, s3, a7
                  addi         s0, gp, 841
                  fmv.x.w      s9, fs7
                  add          ra, s2, s8
                  sltu         t4, ra, s9
                  xor          t0, s1, t4
                  fmv.w.x      ft4, a0
                  fcvt.wu.s    t0, ft2, rtz
                  fsqrt.s      fs1, ft3
                  fsgnj.s      fs0, ft1, fa5
                  fsqrt.s      fa1, fa5, rmm
                  fadd.s       ft6, ft1, fa0
                  slli         a2, a4, 29
                  srli         a2, a2, 22
                  ori          sp, a2, -1620
                  mulh         t1, a1, s9
                  slli         a4, s10, 26
                  sra          s1, s2, tp
                  ori          s9, gp, -249
                  fcvt.wu.s    t6, fs2, rne
                  srai         a7, s10, 20
                  fmin.s       fa2, fs9, ft10
                  feq.s        t2, fs8, fs10
                  sll          a4, a7, ra
                  slli         t6, a1, 1
                  fsub.s       ft9, fs6, fs8, rtz
                  lui          a1, 330007
                  slt          s6, a1, s3
                  sltiu        t1, a6, -1946
                  divu         s11, t6, s2
                  remu         s5, a0, zero
                  srai         s9, s5, 24
                  fmax.s       fs7, fs1, fs5
                  fsqrt.s      ft7, ft2, rdn
                  remu         s4, a5, s10
                  sltiu        a1, a2, 70
                  fmul.s       fa2, fa5, ft9, rdn
                  mul          s4, s1, a1
                  slti         t6, a1, 454
                  fcvt.s.w     fs10, s8
                  fsgnj.s      fa1, ft1, ft10
                  fclass.s     a2, fs5
                  fmin.s       fs0, ft7, ft4
                  fmin.s       fa0, fa7, fa7
                  remu         s2, s2, t2
                  fsgnjx.s     fs0, fs6, fs8
                  or           t0, ra, a2
                  remu         s4, a0, s4
                  fsqrt.s      fs9, fs1, rtz
                  srli         s8, s3, 24
                  fcvt.w.s     t6, ft5, rne
                  fsgnj.s      ft9, ft9, ft11
                  fcvt.s.wu    ft9, s6, rdn
                  feq.s        s7, fs5, fs0
                  rem          s6, t6, a1
                  mulhsu       t1, s4, s0
                  sltu         a7, s8, s10
                  fmax.s       fa0, ft0, fa3
                  fcvt.w.s     s9, fs2, rdn
                  fsgnjn.s     ft2, ft6, fs6
                  fcvt.s.w     fs10, s10
                  sltu         s7, t1, a0
                  or           a1, t5, s6
                  srai         s0, s10, 20
                  fmax.s       ft4, fs9, ft11
                  rem          s4, ra, t5
                  fmv.x.w      s9, fa0
                  mul          a4, zero, t6
                  auipc        a7, 144102
                  mulhu        a0, sp, a2
                  ori          s4, s8, 1905
                  fmax.s       fs10, ft10, fa5
                  sltiu        a0, t6, 1329
                  srli         ra, s1, 14
                  slli         s0, sp, 28
                  fmax.s       fa4, fs6, fa3
                  fcvt.s.w     fa2, s4
                  divu         a2, s7, s5
                  mulhsu       a4, a1, s7
                  srli         t6, t6, 23
                  fmv.x.w      ra, fs3
                  fcvt.wu.s    a2, fa0, rmm
                  fsub.s       fs5, ft6, fs7, rup
                  fcvt.wu.s    a7, ft0, rdn
                  and          ra, s2, zero
                  sra          t0, s10, s9
                  fle.s        s11, ft9, fa2
                  fsgnj.s      fs10, fa5, fa3
                  srl          s7, t0, a2
                  fdiv.s       fa0, ft10, fs3, rtz
                  mulh         a7, tp, s7
                  slti         s6, t1, 600
                  addi         t0, s5, 865
                  fsqrt.s      fa3, ft5
                  add          s10, tp, t6
                  srai         t1, tp, 11
                  fcvt.s.w     fs6, a0
                  fmin.s       ft5, ft6, fa0
                  ori          s9, t0, 825
                  nop
                  slti         s11, s9, 204
                  fsgnjn.s     fa1, fs1, ft4
                  rem          t6, s6, s2
                  div          a4, s5, t0
                  fsgnj.s      ft9, fs0, fa5
                  addi         s8, a0, 367
                  auipc        s8, 723656
                  sub          a1, a1, a4
                  nop
                  sltiu        t3, ra, 479
                  addi         zero, a6, 879
                  fcvt.s.w     ft3, s0, rdn
                  fcvt.w.s     t1, ft4
                  fadd.s       fs0, ft2, ft0
                  slt          s9, s7, s6
                  sra          s1, t0, a4
                  srli         s1, s11, 31
                  mulhu        t3, a0, t6
                  sub          a6, t1, s1
                  and          s8, s3, s8
                  fcvt.wu.s    zero, fs8, rdn
                  or           s0, s4, s8
                  fmin.s       fs6, fs9, fa5
                  add          t0, a0, a6
                  fle.s        a3, fs9, ft3
                  div          t0, s3, t5
                  srai         t6, s0, 5
                  slli         a7, s3, 14
                  mulhu        a6, t1, t4
                  remu         t0, a4, a5
                  fsub.s       fs6, fa2, fa6
                  divu         t4, t2, t6
                  fsqrt.s      ft7, fs8, rmm
                  or           a4, s4, a5
                  divu         a4, s8, a6
                  and          s10, s9, tp
                  srai         a3, t0, 28
                  sltiu        t4, s10, -48
                  mulh         s4, t4, s6
                  fclass.s     sp, fa5
                  sra          s10, a2, s9
                  srli         s6, a1, 25
                  ori          ra, s1, -1345
                  fcvt.wu.s    s1, ft1, rmm
                  addi         t3, a2, -873
                  fsub.s       ft2, fs1, fs9
                  auipc        ra, 61938
                  fsgnj.s      ft1, fs9, fs9
                  fadd.s       ft5, ft0, fs9, rdn
                  srai         sp, s7, 26
                  mul          s6, s6, a5
                  add          s4, s3, a6
                  fsgnjn.s     fs6, fs11, ft3
                  nop
                  sll          a0, s2, a4
                  slli         a4, a1, 26
                  slti         gp, a6, 1539
                  nop
                  srli         s2, s3, 15
                  xor          s1, t1, a3
                  xor          s9, s4, a2
                  addi         a7, tp, 51
                  add          sp, a6, t5
                  fcvt.s.w     fs1, gp, rne
                  srl          t0, sp, s5
                  slt          ra, a7, ra
                  fsqrt.s      ft6, fs11, rtz
                  sub          s3, t2, tp
                  srli         t2, t3, 0
                  fmv.x.w      s7, fa5
                  auipc        t3, 232425
                  addi         t0, s7, -247
                  sll          sp, s2, s9
                  remu         ra, s5, a6
                  sll          t3, a2, t4
                  fmax.s       ft0, fa4, fa6
                  srl          a0, s9, s11
                  divu         a2, t4, s4
                  divu         a3, s5, s11
                  lui          s2, 272244
                  nop
                  fcvt.s.wu    ft4, s3
                  fsgnjx.s     ft4, fs3, fa2
                  sra          t2, sp, zero
                  sltu         t1, s1, s2
                  slli         s10, a3, 18
                  fcvt.s.w     fs10, s9
                  sltu         a7, a3, zero
                  addi         s2, sp, 1217
                  fmv.x.w      s10, ft8
                  divu         t6, s0, gp
                  auipc        a1, 1043845
                  fadd.s       ft4, fa0, fa5, rmm
                  fadd.s       fs10, fa2, ft0
                  mul          s7, s0, s7
                  sltu         a4, s0, s5
                  fdiv.s       fs2, ft11, ft6, rup
                  fcvt.s.w     ft5, a5
                  divu         s4, s9, t1
                  xor          s11, t3, tp
                  mul          t4, s9, t3
                  slli         s10, s10, 22
                  nop
                  srl          s0, a5, s9
                  fmul.s       fs5, ft3, ft10
                  nop
                  mulhu        s5, s0, s0
                  srl          s4, s1, a3
                  fmul.s       ft8, fa7, ft8
                  sll          a7, s4, t6
                  add          s0, ra, a1
                  nop
                  addi         a6, s7, 602
                  add          s0, s9, a7
                  fcvt.s.w     fa6, s4
                  rem          s7, gp, t4
                  slti         t0, s2, -323
                  remu         zero, s10, s9
                  fsgnjx.s     ft6, fs4, fs3
                  fclass.s     t6, fs6
                  mul          a1, s11, t3
                  div          a4, a1, t0
                  fmv.w.x      fs11, s6
                  auipc        t6, 138548
                  mul          t4, t4, a4
                  sra          t1, s4, t3
                  srai         a2, t2, 14
                  fsub.s       fs1, ft11, ft11
                  slti         zero, t3, 46
                  sll          t3, t0, a2
                  nop
                  feq.s        s7, fs2, ft0
                  fcvt.s.w     ft2, s4, rne
                  remu         s7, a6, s10
                  fadd.s       ft6, fa2, fa2, rup
                  fsgnjn.s     fa3, fa5, fa0
                  fmv.x.w      gp, ft10
                  mulhu        t1, tp, s7
                  fclass.s     a7, fs5
                  fsgnj.s      fa5, fa3, fa4
                  sltiu        s0, a6, 1595
                  nop
                  slt          gp, a3, s11
                  rem          a7, t1, s10
                  auipc        s1, 295906
                  sra          sp, s0, sp
                  xori         s10, s9, 2013
                  remu         s9, sp, a0
                  addi         a2, tp, 1772
                  slt          sp, s7, gp
                  fmax.s       ft4, fs10, ft5
                  srli         t4, s8, 16
                  divu         a4, gp, s5
                  sltu         s4, zero, sp
                  srai         t6, s9, 13
                  fadd.s       fs9, ft6, fa3, rdn
                  fadd.s       fs1, fs9, fs9, rup
                  fmax.s       fa1, fs0, fs3
                  sltu         a6, gp, sp
                  remu         s11, a5, a7
                  mulhu        a0, s9, s3
                  fsgnjn.s     fa6, fa5, ft4
                  fsgnjx.s     fs7, fa7, fa7
                  mulhsu       t1, s1, a7
                  fsgnjn.s     fs2, fs7, ft2
                  flt.s        ra, ft7, ft3
                  fmin.s       fs0, fs2, fs6
                  fle.s        s9, fs4, ft6
                  fle.s        s1, ft4, ft0
                  divu         s10, a4, a5
                  div          ra, t6, s8
                  srai         s11, a5, 25
                  slli         s1, s4, 16
                  fmax.s       ft11, fa5, fs0
                  mulh         t6, t2, s6
                  div          t0, s2, s7
                  ori          t1, a5, 985
                  fclass.s     s6, fs4
                  fsgnj.s      ft8, fs2, fa2
                  fsgnj.s      fa7, fs9, fa6
                  feq.s        s5, fa1, ft11
                  lui          s5, 643139
                  slt          t3, t2, a6
                  fsgnjx.s     fa7, fa3, fs2
                  auipc        t3, 528211
                  add          a2, t3, ra
                  slt          s7, s4, gp
                  xori         s7, s8, 11
                  fclass.s     gp, fa4
                  mulh         t6, s10, a1
                  sub          t1, zero, s6
                  mulhu        t1, s5, s5
                  xori         a7, s2, -393
                  sltu         a7, t2, a6
                  sra          ra, t2, a7
                  fcvt.wu.s    s10, ft0
                  divu         ra, a7, zero
                  srai         a0, s6, 29
                  fsqrt.s      ft9, ft11, rdn
                  or           a4, tp, a3
                  fmax.s       fa3, fa3, fa3
                  xori         gp, s11, -1232
                  fmax.s       ft1, fs2, ft8
                  mulhsu       a2, t1, s9
                  mulh         a1, a3, t1
                  srli         s0, s11, 10
                  srai         a6, s9, 16
                  fmin.s       ft11, fs6, ft1
                  slt          ra, s6, tp
                  fclass.s     s3, fa3
                  srai         t2, s6, 1
                  addi         s10, s4, 365
                  fsgnjn.s     fa3, ft3, ft10
                  srl          s6, a0, s2
                  sub          t0, s9, s2
                  fmv.x.w      s5, fa2
                  feq.s        t2, ft8, fa4
                  fmul.s       fs6, ft11, fa1
                  sltiu        s3, tp, -807
                  fmin.s       fs2, ft0, ft2
                  andi         t6, s9, 569
                  divu         a7, t1, t4
                  divu         s6, s9, s9
                  auipc        s1, 125714
                  srli         a2, s10, 13
                  xori         zero, a1, -1703
                  addi         t1, a3, 1723
                  mulhu        a7, a7, s11
                  auipc        s3, 157133
                  mulh         s2, a1, gp
                  fmul.s       ft7, fs6, ft6, rtz
                  addi         s7, a3, 231
                  mulh         s1, a7, a6
                  remu         a7, s1, s11
                  sltiu        s7, t1, -1943
                  fadd.s       fa2, ft6, ft4, rdn
                  andi         zero, gp, -315
                  mulh         t0, a3, s6
                  xori         s6, a3, 1198
                  ori          t0, s1, -714
                  srli         gp, t6, 11
                  andi         a4, s1, -62
                  remu         s2, a1, a2
                  mul          s9, t4, t3
                  slt          s1, s7, t3
                  srl          s8, t2, a5
                  fdiv.s       fa3, ft1, fa0
                  fmv.w.x      fa5, a1
                  nop
                  fsgnj.s      ft7, ft0, fs8
                  fdiv.s       fa0, fs2, fs4
                  fadd.s       fs8, fa2, fs11, rne
                  or           s8, t5, a7
                  slt          a7, t4, s2
                  fmv.w.x      fs5, a4
                  mulhsu       s9, s10, s5
                  mulhu        t2, s11, gp
                  slti         s3, t5, -2021
                  fcvt.s.wu    ft0, a5
                  ori          s9, a7, -863
                  or           s2, a0, s10
                  fsqrt.s      fa3, fs2
                  fcvt.s.w     ft6, a6, rmm
                  rem          a4, zero, gp
                  slti         a3, s6, 761
                  or           t1, t2, t1
                  add          t1, s9, zero
                  sub          a2, s5, s3
                  mulh         s5, s0, s0
                  sll          t2, s3, s5
                  addi         s0, s3, -1638
                  sra          a6, s4, t1
                  rem          sp, gp, a4
                  sub          zero, s9, a5
                  divu         a0, s3, a0
                  mulh         s3, s8, s2
                  fmv.x.w      s7, ft6
                  andi         s6, t2, -1178
                  srli         ra, a2, 25
                  sltiu        s1, a7, 247
                  lui          gp, 657192
                  mulhsu       s2, t5, s5
                  fcvt.wu.s    s1, fa1
                  fsub.s       ft10, fa2, fs2, rmm
                  nop
                  sll          a3, t0, gp
                  fsub.s       fa4, fs8, ft8, rdn
                  fcvt.wu.s    a4, ft5, rdn
                  remu         t2, s2, tp
                  sra          a7, t2, s4
                  fcvt.w.s     s10, ft1, rdn
                  fcvt.s.wu    fs3, sp
                  srai         s11, s0, 10
                  addi         t3, s10, 474
                  div          s6, s4, s10
                  auipc        s2, 304846
                  fsqrt.s      ft9, fs2, rmm
                  fsgnjn.s     fs7, ft9, ft6
                  mulhu        s9, s5, t2
                  sltu         a2, t3, s6
                  xor          s6, ra, ra
                  fmin.s       fs9, fs2, ft0
                  fmul.s       fa0, fs4, ft4, rmm
                  lui          ra, 556210
                  andi         s2, t3, 1894
                  lui          s3, 54946
                  fsgnjn.s     fa6, ft1, fs0
                  fmv.x.w      zero, fa4
                  fsgnjx.s     fa2, ft9, ft10
                  auipc        sp, 616569
                  srli         a2, a3, 12
                  sltu         t1, t6, a6
                  fclass.s     t6, fs10
                  sll          s4, s11, t4
                  sltiu        a3, a1, 960
                  remu         a6, tp, t1
                  srli         s1, a5, 17
                  slt          s10, a1, sp
                  fcvt.s.w     fs0, s9
                  fsgnjn.s     ft9, ft9, fs0
                  fcvt.s.wu    ft5, a3, rup
                  sll          t2, t5, t2
                  sltiu        t0, t1, 878
                  sltiu        a1, ra, 1658
                  fdiv.s       ft10, fs5, fa6, rtz
                  feq.s        gp, ft0, ft2
                  sra          t0, tp, t3
                  div          t6, t4, a1
                  srli         s6, s6, 31
                  slli         a7, s2, 13
                  fclass.s     s4, ft7
                  xori         t4, a3, 52
                  sra          t3, a5, a0
                  srai         t0, s3, 15
                  fsqrt.s      ft8, fa2, rdn
                  srl          sp, s11, s7
                  fcvt.s.w     fs1, t1
                  div          t0, s10, a4
                  slli         a3, zero, 14
                  srl          a6, s4, t0
                  mul          s2, t6, a6
                  srl          t4, t0, s10
                  fsgnjn.s     fa1, fs3, fs5
                  feq.s        a7, ft8, ft1
                  fcvt.wu.s    s9, ft3, rtz
                  xor          s9, ra, s9
                  auipc        s8, 420560
                  fsgnjx.s     ft11, ft1, ft10
                  fsqrt.s      fa7, ft6, rtz
                  fcvt.w.s     a1, fs6, rtz
                  fmv.x.w      t0, fs11
                  fmv.x.w      s10, ft6
                  auipc        t1, 453789
                  rem          s6, s7, t4
                  fdiv.s       fs11, fs0, fa5, rup
                  xor          t1, a4, a3
                  flt.s        t2, ft8, fs0
                  addi         a6, s7, 327
                  fmin.s       fa4, ft9, ft3
                  fsgnjn.s     fs3, fa4, ft7
                  ori          s7, t3, 890
                  auipc        a1, 372766
                  fsgnj.s      ft1, fa2, fs11
                  slti         a2, a3, -1010
                  fmax.s       fs6, ft10, ft7
                  fsgnjx.s     fa0, ft7, fs0
                  slti         a4, a6, 1215
                  sub          sp, s1, s11
                  fle.s        s3, ft3, fa0
                  slti         s10, s11, 379
                  fsub.s       fa7, ft5, ft2, rtz
                  xor          s1, t5, a3
                  andi         s10, t2, 146
                  andi         a7, t6, 48
                  sltu         a4, s8, t0
                  fmin.s       ft2, fs10, fs8
                  slli         s7, s10, 21
                  fsgnj.s      ft9, ft10, ft11
                  slti         s4, s9, 1215
                  divu         t1, s10, a0
                  fmv.w.x      fa1, a0
                  add          s1, a6, a2
                  fmv.w.x      ft5, t2
                  mul          t2, a2, a6
                  fle.s        t0, fa6, ft6
                  sltiu        s5, tp, 176
                  andi         s6, s9, -1439
                  or           a1, t2, a6
                  mul          s3, a6, t2
                  fcvt.s.w     ft6, a6
                  fclass.s     s7, fs1
                  lui          s7, 29414
                  fdiv.s       ft5, fs1, ft9
                  remu         t6, gp, t4
                  xor          t6, ra, s6
                  fsgnjx.s     fa5, ft10, fa3
                  xor          sp, s10, t4
                  fsub.s       ft2, ft2, fs11
                  slt          a4, s4, a6
                  andi         sp, s3, 1402
                  fcvt.s.wu    ft6, s11, rdn
                  slti         sp, t5, -628
                  fcvt.w.s     s11, fs0
                  fsub.s       ft11, fa0, fs1, rne
                  sll          s1, a2, t4
                  fmul.s       fs11, fs0, fa1
                  mulhsu       s3, a7, a6
                  or           s3, a2, s3
                  fsgnjx.s     ft6, fs11, fa0
                  auipc        a6, 592439
                  srl          t2, a3, s5
                  div          t0, t4, a0
                  fsub.s       fs1, fa2, ft11, rmm
                  mulhsu       s2, t5, a7
                  fsub.s       ft0, fs6, ft3
                  fdiv.s       fs4, fa7, fs1, rup
                  slt          s6, s0, gp
                  fcvt.w.s     s4, fs1
                  fsgnjx.s     fa7, fs1, ft10
                  fsgnjx.s     fs1, ft4, ft0
                  srl          t2, a4, a2
                  fmin.s       fa3, fa5, ft3
                  mulh         t2, s0, t5
                  mulhsu       s2, t2, a4
                  srl          s9, s9, s9
                  mul          s5, sp, s1
                  slt          s6, t2, t2
                  add          s9, a2, t5
                  auipc        t3, 491441
                  fmul.s       fa4, fs2, fs0, rmm
                  slt          s11, t2, s3
                  fsgnjx.s     fs11, fs10, ft3
                  fsgnjn.s     ft7, fs7, fa5
                  lui          t6, 676166
                  fsub.s       fs2, ft2, ft1, rdn
                  fcvt.wu.s    s8, fa0, rup
                  xor          a4, t5, s7
                  slti         gp, a2, -390
                  add          a4, t4, s3
                  sra          a1, t2, s0
                  fcvt.s.w     fa1, t6, rmm
                  auipc        s10, 621506
                  sll          s3, gp, gp
                  fsgnjx.s     ft10, fa0, ft8
                  feq.s        t6, fa0, fa3
                  fadd.s       fa5, fa2, ft5
                  fmul.s       ft5, ft4, ft8
                  sltu         s8, sp, s5
                  slt          s0, a1, a5
                  divu         a2, t5, t3
                  and          zero, a7, s7
                  auipc        t4, 156267
                  fmul.s       fs7, fa7, fa4, rmm
                  mul          sp, s0, s0
                  sltiu        t1, t4, -1973
                  lui          s1, 854204
                  div          s11, a5, zero
                  sra          a7, a1, zero
                  srli         s7, s11, 25
                  slt          t1, a7, t1
                  sra          a6, t0, a1
                  slti         s8, s11, -1677
                  feq.s        s0, fs2, ft11
                  fmul.s       fs6, fa5, fs11, rup
                  xori         a6, t6, -1522
                  fdiv.s       fs7, ft6, ft8, rdn
                  add          t2, s11, a3
                  slti         a0, s0, 447
                  flt.s        s11, ft11, ft9
                  ori          t1, zero, -180
                  divu         s1, a5, a2
                  slti         s7, sp, -1552
                  slt          t3, s4, s7
                  sra          t4, a7, a4
                  mulhu        s3, s6, t1
                  sra          a6, a4, s9
                  feq.s        s4, fa7, ft8
                  sub          t3, a2, a5
                  or           t0, s0, t0
                  and          s7, s9, a1
                  fsgnjn.s     fa2, fs0, fs1
                  sltiu        ra, t3, -1472
                  add          s1, s3, s3
                  auipc        a7, 281062
                  rem          t3, tp, t5
                  add          t0, t3, s3
                  xor          a7, s0, ra
                  sub          a1, gp, t5
                  nop
                  mulhsu       s8, zero, s1
                  ori          ra, a3, 933
                  ori          s10, s10, 1962
                  flt.s        t0, fs11, fs4
                  fsgnj.s      fa0, fs1, ft0
                  mulhsu       s4, ra, s7
                  remu         a2, s0, s7
                  remu         t3, s5, s10
                  divu         t3, s7, s11
                  fmul.s       ft6, fa0, ft4
                  srl          s4, t2, s2
                  srli         t4, s11, 31
                  sltu         a4, t2, t2
                  fcvt.s.wu    ft2, s0, rmm
                  slti         s5, ra, -40
                  sra          s3, s11, a4
                  add          s1, t5, sp
                  lui          s3, 640377
                  fclass.s     t6, ft7
                  auipc        t4, 606258
                  xor          a7, t5, t0
                  sub          a2, a2, tp
                  auipc        a1, 27193
                  fdiv.s       ft10, fa7, fs9, rdn
                  feq.s        ra, fs11, ft0
                  fcvt.wu.s    s9, fs11, rup
                  srl          t0, a7, t1
                  slt          a2, a3, t6
                  fadd.s       ft5, ft5, ft1, rmm
                  fcvt.w.s     t0, ft5, rne
                  slli         s7, s6, 10
                  slt          s1, t4, t1
                  fsgnjn.s     fa2, fa1, fa5
                  or           t2, t6, a6
                  mulhsu       t0, zero, t2
                  fmin.s       ft8, fs5, ft9
                  feq.s        gp, ft1, ft6
                  srli         t4, s6, 22
                  fmv.x.w      a6, ft11
                  remu         s4, s2, t0
                  sltu         a1, a4, a5
                  feq.s        t2, fs2, fs5
                  fmv.x.w      t2, ft4
                  fmv.w.x      ft7, a1
                  add          a4, s1, t0
                  fmax.s       fs0, fs8, fa1
                  feq.s        s2, fa2, fs1
                  nop
                  mul          a0, s3, a1
                  srai         s0, t1, 12
                  andi         s3, s7, -1184
                  div          a1, a3, t0
                  sltiu        s10, s1, -126
                  or           a2, s6, t1
                  fcvt.s.wu    ft10, zero
                  fmv.w.x      fs2, a2
                  fmax.s       fs4, ft6, ft6
                  sll          s4, s11, t3
                  sltiu        s6, s1, 1981
                  fclass.s     ra, fa0
                  slti         t3, t4, -790
                  sltu         a6, s9, s11
                  mulhsu       t3, s0, s2
                  slli         s3, t6, 5
                  slti         s10, t2, -271
                  div          t3, a4, a4
                  fmv.w.x      fs11, s3
                  fsqrt.s      ft4, ft5
                  addi         ra, gp, -876
                  fmul.s       fs8, fs2, fs6, rup
                  auipc        t0, 492713
                  fmax.s       fa0, ft9, ft4
                  srai         t3, a5, 16
                  fdiv.s       ft0, ft6, fa7
                  feq.s        s2, ft11, fs2
                  fmax.s       fs9, fa6, fa1
                  fmv.w.x      fs5, s1
                  fmv.w.x      fs8, a3
                  feq.s        s7, fa2, fs8
                  slti         s7, s2, -1124
                  fsqrt.s      fa7, fs8, rtz
                  lui          a4, 389738
                  xori         t6, gp, 850
                  slti         t6, a0, 950
                  sra          zero, a1, t1
                  rem          s10, s9, a6
                  fsgnj.s      fa1, fs0, fs0
                  lui          s5, 88623
                  slli         t2, t6, 27
                  fdiv.s       fs9, fs2, ft10
                  mul          a7, t4, a4
                  fsub.s       fs8, fs6, fa1, rtz
                  fmv.w.x      ft9, t0
                  fadd.s       ft10, fa2, ft6
                  srl          sp, s8, t1
                  sltu         s9, gp, a5
                  fmv.w.x      ft0, t0
                  srl          s10, s11, s3
                  fmv.x.w      zero, ft2
                  mulhu        s8, t5, t6
                  slli         s9, t4, 2
                  xor          t6, t5, zero
                  srl          s5, a4, s0
                  sltu         s7, s10, s8
                  feq.s        ra, fa7, fs0
                  addi         t4, s6, -1893
                  addi         s9, a5, 1976
                  fsgnjn.s     ft7, fa1, fs1
                  srli         s7, a1, 8
                  xor          t3, a7, s3
                  fsgnj.s      fs5, fs5, fs5
                  or           t3, a4, t2
                  fle.s        s7, fs10, ft0
                  slt          a3, s5, s2
                  feq.s        a4, fa5, fa2
                  auipc        t3, 140020
                  or           s0, s1, s0
                  nop
                  sub          t3, a2, gp
                  fadd.s       ft11, fs1, ft2
                  fmin.s       fs0, ft7, ft10
                  nop
                  sltu         s6, t3, t1
                  mulh         s6, s10, t5
                  lui          a7, 770050
                  nop
                  or           t1, gp, ra
                  fsub.s       fa1, fa7, fs6
                  sll          s3, t3, s2
                  sub          a1, a0, a4
                  auipc        a3, 300861
                  xor          s5, s7, a5
                  divu         s6, s7, t4
                  mulhsu       s11, s0, t4
                  mulhsu       a3, s9, t1
                  srai         t4, a6, 5
                  mulhsu       t3, a2, zero
                  fle.s        t6, fs3, fs2
                  srai         s10, t5, 8
                  xori         s4, a2, 40
                  sub          t3, a3, s7
                  addi         a3, t3, -1984
                  fmul.s       fa5, ft2, fs6
                  srai         t4, sp, 16
                  fsqrt.s      fs5, fs3, rne
                  fdiv.s       fa0, ft5, ft0, rup
                  fclass.s     a4, ft10
                  fmul.s       fs10, ft0, fs2, rtz
                  sll          ra, t3, s0
                  addi         a4, t5, 1886
                  fadd.s       fs6, fs4, fs8
                  mul          a7, a3, t6
                  fsgnjx.s     fs8, ft1, ft10
                  feq.s        t4, ft4, fs2
                  fclass.s     zero, ft1
                  sll          a2, t2, s1
                  divu         a1, t6, a6
                  slli         sp, t3, 4
                  srai         s2, gp, 16
                  fsub.s       ft11, ft7, fs0, rne
                  sra          s10, gp, gp
                  sltu         t3, s3, t5
                  ori          a4, a6, 1552
                  slli         gp, s10, 11
                  nop
                  fadd.s       fs10, ft8, fs4, rmm
                  nop
                  srl          a3, t2, a7
                  fcvt.s.w     ft2, s10
                  or           a1, a5, s4
                  sltu         a2, a5, gp
                  srl          a1, ra, gp
                  fsgnjx.s     fa5, ft0, fs7
                  fcvt.s.w     fs2, s2
                  divu         sp, s8, t1
                  andi         s5, a4, -837
                  fsub.s       fs1, ft11, ft9
                  and          s1, a3, t2
                  fmul.s       fs11, fa2, ft1
                  fle.s        sp, ft1, fs7
                  mul          t3, s5, t0
                  mul          t1, t6, s5
                  ori          ra, a6, 1951
                  slt          s7, s4, a3
                  fcvt.s.w     fa3, a5, rdn
                  sll          s10, a1, a2
                  addi         t4, sp, -1196
                  divu         ra, a0, a5
                  srai         s11, s7, 28
                  srli         a3, s1, 2
                  fsub.s       fa2, fa6, ft8, rtz
                  nop
                  fcvt.s.wu    ft3, sp
                  addi         a1, a0, 1417
                  or           s5, s8, t1
                  mulh         s8, s9, tp
                  srai         s0, a5, 13
                  auipc        sp, 128403
                  mulh         s9, s1, s4
                  sub          s7, gp, tp
                  ori          s8, zero, -992
                  srli         t0, a5, 22
                  sra          s0, t1, a6
                  sra          zero, s9, s6
                  fcvt.wu.s    s2, fs0, rdn
                  fcvt.wu.s    a6, fa6
                  xori         a7, a2, -1371
                  mulhsu       s7, t4, a2
                  fsgnjx.s     fa1, fa5, ft1
                  fsqrt.s      fs10, ft3, rdn
                  or           s3, t4, a6
                  sll          s5, zero, s9
                  sra          t4, s2, a0
                  flt.s        s9, ft2, fa4
                  sltiu        s1, s11, -1959
                  sub          a1, s3, a0
                  mulhsu       s10, a0, t5
                  fcvt.s.wu    ft2, s5, rdn
                  fmv.w.x      ft10, t3
                  fcvt.s.wu    fa0, s3
                  fmax.s       fs4, ft11, fs4
                  fmul.s       ft9, ft9, ft7
                  fcvt.s.wu    fs6, a0
                  sub          s0, s9, s8
                  flt.s        a4, ft7, fs4
                  fcvt.w.s     s3, fa4
                  ori          s9, t6, 1035
                  add          t4, s10, s6
                  fcvt.wu.s    a3, fs10
                  mulhsu       a2, sp, a2
                  addi         s5, s7, -1361
                  mulhsu       a6, s8, gp
                  auipc        s5, 394931
                  fle.s        s0, ft3, ft11
                  rem          a1, t2, ra
                  auipc        t3, 139642
                  fle.s        t0, fs9, fs10
                  fsgnjn.s     fa2, fa0, fs1
                  fmv.x.w      s5, ft10
                  fsqrt.s      fa4, fs4, rmm
                  div          s10, a3, t6
                  div          s9, t6, a3
                  sltiu        a2, a5, 1287
                  sll          s0, tp, s0
                  feq.s        s9, ft8, fa7
                  auipc        gp, 987876
                  fle.s        a2, fs9, fa1
                  feq.s        a3, fs6, ft2
                  sltu         a6, a6, s8
                  srai         a4, gp, 31
                  fsqrt.s      fa4, ft3, rdn
                  fclass.s     a1, ft9
                  div          s11, a0, gp
                  slti         a6, s0, 428
                  div          s6, s11, a2
                  fsgnjx.s     fa2, fs6, fa5
                  slti         a4, t5, 1974
                  mulhu        t6, a4, zero
                  remu         s11, a4, s3
                  srai         t3, zero, 19
                  sll          s5, a5, t3
                  feq.s        a7, fs2, fa6
                  slli         a0, tp, 9
                  slti         s5, a0, 300
                  srai         t2, a1, 13
                  fcvt.w.s     s7, fs0, rdn
                  fsgnjx.s     fa6, fs4, fa2
                  mul          ra, a5, t6
                  fclass.s     s0, fa5
                  lui          s0, 136131
                  sra          a0, a7, s6
                  feq.s        a2, ft9, fs1
                  xori         t2, zero, 297
                  fsgnjx.s     fa0, fs8, ft11
                  mulhsu       a7, t3, a0
                  remu         s7, s4, s2
                  fcvt.wu.s    sp, fa3
                  srl          a7, s1, a1
                  feq.s        s6, ft9, fs9
                  fclass.s     s3, ft10
                  fmin.s       ft11, ft6, ft9
                  fsqrt.s      ft1, ft11
                  div          s8, a6, a3
                  sra          t0, a1, s3
                  sltu         s8, s11, a6
                  divu         zero, a3, s10
                  fmin.s       fa3, ft3, fa6
                  ori          s7, a7, 242
                  fmv.w.x      ft9, a2
                  fadd.s       fa4, fa6, fs1
                  remu         s8, tp, s11
                  fsgnj.s      fs9, ft3, ft2
                  fsub.s       ft1, fs6, fa6, rup
                  mul          s0, zero, s1
                  mulh         t1, t6, s7
                  lui          s11, 775975
                  fmul.s       fa7, fs2, ft11
                  fadd.s       fa1, fa5, ft5
                  fsgnj.s      fa2, fs11, fa2
                  fsgnjn.s     fs0, fa1, fa2
                  sra          t4, t4, s1
                  auipc        a0, 249211
                  slli         a1, s0, 19
                  remu         s2, t5, t2
                  fdiv.s       fs2, ft8, fa3, rup
                  div          zero, gp, a2
                  mul          s2, s10, a6
                  fmax.s       fs8, ft10, fa0
                  fsgnjn.s     fa1, ft6, fa0
                  fclass.s     t3, fs2
                  fsub.s       ft8, ft7, fa0, rup
                  flt.s        t1, fa3, ft3
                  xori         s6, t6, -1270
                  fcvt.wu.s    s2, ft3
                  or           ra, a4, s3
                  fadd.s       fs9, ft10, fs4, rne
                  remu         a4, t4, t3
                  srli         s4, tp, 8
                  sltiu        ra, s9, 292
                  fdiv.s       fa3, fs7, ft3
                  fadd.s       fa1, fa0, fa3
                  srli         t2, s6, 2
                  slti         t1, t0, -379
                  fmul.s       fs5, ft10, fa7
                  fcvt.s.wu    fs10, s9, rup
                  addi         s6, s11, -52
                  fmul.s       fs1, ft10, fa3
                  fmv.x.w      t1, fa3
                  fmv.x.w      s9, fa3
                  nop
                  mul          t0, t0, s2
                  addi         t1, t6, 111
                  sltu         a3, t1, a4
                  slti         s11, tp, 643
                  xor          t3, s9, s9
                  mulh         t4, s11, gp
                  fadd.s       fs11, ft3, fs6
                  slli         s8, a1, 5
                  xori         t2, sp, 810
                  add          t6, s9, t2
                  addi         s2, s10, 1316
                  slli         t2, s5, 7
                  mulhu        s5, a1, tp
                  srai         s8, a2, 4
                  add          gp, a7, ra
                  mulhsu       s11, s1, a7
                  nop
                  fcvt.s.w     fs1, a6
                  sltu         s7, s6, ra
                  sra          s7, a6, sp
                  flt.s        a1, fs6, fa7
                  sub          zero, a5, t3
                  fsub.s       ft8, ft10, ft4
                  auipc        a1, 1045021
                  or           ra, a2, a3
                  auipc        s7, 1006130
                  fsgnjn.s     ft1, fs7, fs10
                  fsgnj.s      ft11, ft2, fs4
                  fcvt.w.s     s2, fa1, rmm
                  fcvt.s.wu    ft5, s6
                  mulh         s1, s5, s2
                  sll          sp, s6, s6
                  fle.s        zero, ft9, ft4
                  lui          a2, 455984
                  mulhsu       ra, sp, s0
                  fmv.x.w      a6, fs3
                  mul          s9, s5, s9
                  sll          s11, s8, s11
                  fsqrt.s      fs11, fs1, rne
                  xori         zero, s1, -686
                  fsub.s       fa3, fs10, ft3
                  fsgnj.s      ft1, fa6, ft5
                  srai         s8, a3, 10
                  or           t1, s10, a6
                  fcvt.s.w     fs1, s6
                  fmv.w.x      fa5, s7
                  auipc        s11, 698808
                  mulhsu       s1, a3, s8
                  rem          ra, tp, a1
                  fmul.s       fs5, fs9, ft1
                  fsgnjn.s     fa3, ft1, ft1
                  srli         s5, a3, 14
                  srli         s5, t2, 1
                  fmax.s       ft8, ft7, ft6
                  xori         s10, s5, -431
                  sll          t6, a5, s11
                  sltiu        s2, s9, -1236
                  mulhu        a0, tp, s7
                  lui          a6, 681583
                  srai         s0, a5, 16
                  xor          s11, ra, s10
                  or           t6, s1, a7
                  mul          a6, sp, a4
                  addi         a6, s9, -279
                  or           s6, s9, s4
                  fcvt.wu.s    t3, ft9
                  feq.s        a3, ft1, fs9
                  srli         a2, gp, 3
                  feq.s        a0, fs4, fs1
                  xor          s8, a3, s8
                  fle.s        s2, ft0, ft0
                  fsqrt.s      fs11, fs9, rdn
                  div          s5, gp, a3
                  mulhsu       sp, s7, s8
                  xori         t1, a4, 399
                  rem          t6, a7, s8
                  srl          t0, ra, t1
                  slli         s0, s7, 18
                  sltu         s2, t5, gp
                  remu         s9, t6, a7
                  fmin.s       ft6, fs10, ft10
                  fsub.s       fa3, fs10, ft4
                  fclass.s     a1, ft8
                  sltu         s10, s9, ra
                  fcvt.w.s     s11, fs7
                  xori         s5, s5, -1401
                  fcvt.s.w     fs5, s7
                  rem          s9, a1, sp
                  fsgnjn.s     fs6, ft10, fs10
                  rem          a1, t0, s10
                  lui          s6, 466162
                  remu         s4, a3, a1
                  rem          a1, a7, a3
                  fmin.s       ft11, fs1, ft3
                  add          a0, t1, s7
                  fmul.s       ft8, ft2, fs9
                  slli         s4, s10, 26
                  fmv.w.x      fa0, tp
                  nop
                  sll          s4, a0, t0
                  div          s0, a6, t4
                  or           a0, a1, t1
                  sltiu        s5, a3, -1507
                  fmul.s       fs2, fs6, fs3
                  mulh         s0, s3, sp
                  nop
                  lui          s1, 102985
                  fmax.s       fs10, fs9, fs2
                  nop
                  sltiu        s0, s1, 1264
                  sra          t0, t3, t2
                  fmv.x.w      gp, fs1
                  fsgnj.s      fs0, ft11, fa4
                  flt.s        t3, fa5, ft3
                  fcvt.s.w     fs5, s5
                  div          s0, a0, a7
                  fsqrt.s      fs4, ft7
                  fle.s        zero, fs11, ft9
                  fmul.s       ft11, fs2, ft11, rdn
                  fsgnjn.s     fa7, ft3, fa5
                  auipc        t2, 822947
                  xori         a2, s2, 25
                  fmv.x.w      a0, fa2
                  sll          a6, s5, s11
                  xori         t3, s2, 1752
                  mulh         s1, t6, t3
                  sltiu        a4, s3, -288
                  fsub.s       ft10, fs11, fa4
                  fsqrt.s      fa0, fs4, rtz
                  or           s1, sp, s4
                  mulh         t2, s4, a4
                  and          a6, t3, s5
                  srli         a6, s5, 30
                  add          s5, t1, t2
                  mul          a4, s1, a7
                  srai         a4, a2, 25
                  fmv.x.w      t3, ft11
                  sub          sp, s6, tp
                  fcvt.wu.s    a0, ft0
                  xori         t6, s6, 854
                  fmin.s       fs3, fs0, fs5
                  rem          a0, s10, a7
                  fadd.s       fa0, fa1, fs4
                  fmax.s       fa2, fs2, ft10
                  nop
                  sra          a6, t5, t6
                  auipc        t1, 788465
                  fadd.s       fs10, fs4, fs4
                  feq.s        gp, ft2, fa6
                  sll          zero, s2, t2
                  div          s9, s6, s6
                  fcvt.s.wu    fs6, s1, rdn
                  fsqrt.s      ft6, fs6
                  fdiv.s       fa7, fs9, fa0
                  fmul.s       fa2, ft5, ft11
                  fsub.s       fs2, fs6, ft9
                  srli         s6, gp, 17
                  slti         s6, tp, 664
                  mul          t6, s11, gp
                  sltiu        ra, tp, -498
                  srai         s0, a1, 5
                  mul          s3, a1, s8
                  srli         s7, s1, 31
                  fsqrt.s      fa2, ft6
                  fsgnj.s      ft10, fa7, fa1
                  fmv.x.w      s3, fs1
                  fclass.s     a0, ft0
                  flt.s        t3, fs1, fa5
                  mulhu        s11, s3, sp
                  nop
                  mul          s2, t4, s1
                  srai         s0, s3, 10
                  srl          s10, s8, a1
                  slt          s6, t3, tp
                  mulhsu       gp, s11, t0
                  add          s9, t1, a1
                  nop
                  lui          t3, 741601
                  rem          s6, s1, s11
                  ori          a3, a2, 1918
                  addi         t4, tp, -1810
                  fcvt.w.s     s9, ft9, rup
                  fsqrt.s      fa2, fs1
                  nop
                  slt          a6, s1, s4
                  lui          sp, 742831
                  slt          t1, s7, t4
                  fdiv.s       fs1, fs7, fs7, rdn
                  rem          a7, a3, s5
                  auipc        t0, 354133
                  flt.s        a6, fs8, ft8
                  mulhu        s3, s6, a7
                  divu         s1, s10, zero
                  or           t3, t2, s9
                  auipc        s11, 201454
                  div          t4, s10, t6
                  divu         t2, tp, a3
                  fmv.x.w      a4, ft9
                  fcvt.w.s     t1, fa6, rtz
                  fadd.s       ft6, ft9, fa3, rdn
                  divu         s0, s10, t1
                  flt.s        a2, fs4, fa1
                  srl          t0, t1, t5
                  fle.s        t1, fs10, ft6
                  fcvt.w.s     a0, fa4
                  fadd.s       fa2, fa1, fs9, rtz
                  divu         t6, t1, t3
                  slti         s4, s9, -264
                  fclass.s     a7, fa7
                  sll          sp, s0, s1
                  lui          t4, 808600
                  sltiu        s9, s5, 1906
                  fmul.s       fs8, ft3, ft1
                  andi         t3, a6, 59
                  remu         s11, s4, s8
                  fsgnjx.s     fa3, fs5, fs6
                  fmin.s       fs4, ft1, fs11
                  feq.s        a7, fs2, ft7
                  slli         s7, s4, 27
                  mulhsu       t4, s11, s8
                  remu         a0, s2, ra
                  mulhsu       s1, sp, t3
                  sltiu        gp, a0, -1561
                  fdiv.s       fs11, ft4, ft11
                  remu         s0, gp, t0
                  xor          s9, s6, t4
                  flt.s        s6, ft0, ft7
                  sltiu        a6, t4, 992
                  and          s11, s5, sp
                  fmin.s       fs2, ft0, ft4
                  or           a0, s6, s7
                  fsgnj.s      ft11, fs11, fs5
                  addi         s6, a7, 1282
                  mulhu        a7, s2, a4
                  slli         s1, a7, 9
                  fmax.s       fa0, ft2, ft10
                  fmax.s       fs5, ft3, fs7
                  fsub.s       ft10, ft11, ft3, rtz
                  fmax.s       ft5, fa2, fa1
                  andi         s0, a2, 578
                  fmax.s       fs6, fs5, fs11
                  fcvt.wu.s    s2, ft9
                  fdiv.s       ft10, fs1, ft8
                  fcvt.wu.s    s5, ft2, rtz
                  slli         t1, a5, 9
                  sltu         s9, t0, a4
                  nop
                  slti         a1, s5, -1001
                  fsqrt.s      fa0, ft11, rne
                  sll          s8, t5, a4
                  addi         s1, a2, -172
                  auipc        a0, 244779
                  fcvt.s.w     fs0, a4
                  fmax.s       fa3, fa7, fa3
                  fsub.s       fa1, ft9, fs2
                  div          s4, s8, s3
                  fclass.s     a0, fs0
                  sll          s5, a3, s10
                  mulhu        t3, a5, t4
                  sll          s4, t5, s2
                  ori          zero, s2, -934
                  auipc        s2, 896315
                  lui          a7, 519005
                  slt          a4, a1, t4
                  mul          s1, t6, s7
                  fcvt.s.wu    fa2, s11, rmm
                  feq.s        t3, fs8, fa4
                  fsgnj.s      fa7, fa5, fs10
                  fmv.w.x      fa6, s1
                  nop
                  auipc        s4, 974607
                  srli         a6, t3, 28
                  srli         s9, t6, 25
                  slt          ra, zero, s2
                  mulhsu       s8, s5, s5
                  rem          a0, t3, a4
                  fsgnj.s      fa7, ft9, ft7
                  andi         a1, s9, 595
                  lui          s6, 170126
                  fmv.w.x      ft5, s6
                  fmin.s       ft4, ft8, fa2
                  flt.s        s9, fs3, ft7
                  sltu         ra, sp, s8
                  srli         s3, tp, 2
                  slt          t0, a7, a7
                  fsqrt.s      ft0, fa4, rtz
                  fclass.s     s0, fa0
                  fcvt.wu.s    s0, fs1, rmm
                  mulhsu       s2, s2, t5
                  fcvt.wu.s    s3, fs9, rne
                  mul          zero, ra, zero
                  fclass.s     t2, ft5
                  add          gp, s9, t1
                  mulhsu       a7, s8, t5
                  ori          t3, s4, 1177
                  fmin.s       fa1, fs9, ft3
                  sub          t2, a6, a1
                  andi         s7, s3, 1242
                  divu         t4, s9, a6
                  auipc        s0, 128283
                  sub          t4, t3, t1
                  nop
                  and          s4, t2, a5
                  fdiv.s       fa4, fa6, ft2, rtz
                  xor          s11, s9, s5
                  srai         a6, s0, 9
                  slt          s10, a5, s11
                  fmv.w.x      fs5, s11
                  fle.s        a0, fs1, fs6
                  fmin.s       ft1, ft3, ft11
                  lui          a6, 967107
                  fsgnj.s      ft11, fa6, fs1
                  divu         a0, gp, s11
                  srli         s1, s10, 16
                  fcvt.s.w     fa1, t6
                  fclass.s     ra, ft7
                  mulh         a4, t0, s5
                  fsgnjn.s     fa4, ft9, fs4
                  addi         a4, t6, 885
                  and          s1, a6, s0
                  fsgnj.s      fs4, fs8, fs2
                  slt          s2, a5, s8
                  and          s3, s2, zero
                  xori         ra, s2, 1210
                  sltu         sp, a6, s2
                  feq.s        a3, ft3, fs8
                  div          a4, s8, ra
                  fcvt.w.s     s10, ft3
                  fcvt.w.s     a0, fa3, rtz
                  divu         s7, s6, t5
                  lui          a6, 880090
                  slli         s10, a3, 20
                  nop
                  fcvt.s.w     ft11, t3
                  fsqrt.s      ft5, fa3
                  fcvt.s.w     fs4, a0
                  rem          t4, s4, t4
                  slli         gp, gp, 23
                  slt          a0, tp, a4
                  mul          s11, a4, s6
                  fle.s        zero, ft9, ft3
                  auipc        a6, 471971
                  mulhsu       t1, s5, a7
                  fclass.s     t6, ft5
                  fclass.s     ra, fa5
                  sub          a2, a2, gp
                  fcvt.wu.s    s7, fs11
                  auipc        t3, 426642
                  fmv.x.w      s7, fa2
                  sll          gp, s6, a6
                  sll          s11, t0, s3
                  feq.s        s1, ft2, fa6
                  nop
                  add          t0, s1, a3
                  remu         a6, s10, s6
                  fcvt.wu.s    ra, fa4
                  fsub.s       ft10, fs5, ft0, rne
                  fmv.x.w      a2, ft0
                  fmul.s       fs4, fs4, ft4, rne
                  div          s7, s0, t0
                  slt          a0, zero, tp
                  fcvt.s.wu    fs10, t3, rup
                  fmv.x.w      s1, ft7
                  flt.s        a3, fs10, ft9
                  srli         s9, s4, 19
                  fsgnjx.s     fs0, ft1, ft9
                  nop
                  fcvt.wu.s    zero, fa3, rtz
                  fadd.s       fs5, fs2, fa7, rtz
                  srl          s0, a0, t4
                  mulhu        a3, a1, s2
                  remu         a0, t5, t5
                  fdiv.s       fa7, ft3, fs3
                  slli         t4, s3, 13
                  fmax.s       ft9, fs0, fa0
                  fsqrt.s      ft3, fs1, rtz
                  addi         t0, gp, 1231
                  fdiv.s       fs2, fa0, fs8, rne
                  fsqrt.s      ft0, fs4, rtz
                  ori          a2, s4, -266
                  sub          s7, s6, a1
                  fmv.x.w      s5, fs7
                  sub          t6, s5, s5
                  slti         t0, tp, 1849
                  sltiu        s4, ra, 1603
                  nop
                  slt          gp, a5, a6
                  flt.s        ra, fa4, fa0
                  fcvt.s.w     ft1, t5, rne
                  sll          s9, t6, t5
                  fdiv.s       ft4, fs8, fa5, rne
                  fsub.s       ft4, fa0, fa5, rdn
                  add          s1, t2, a4
                  auipc        a0, 449963
                  mulh         sp, gp, t6
                  auipc        ra, 909109
                  fcvt.s.w     ft6, s5, rtz
                  srli         s8, s3, 20
                  fmax.s       ft2, fs8, fa2
                  add          t0, s10, zero
                  mulhsu       a0, a4, s10
                  feq.s        s9, ft6, fs11
                  fdiv.s       fa4, fs8, fa2
                  lui          s2, 283578
                  div          s2, a5, s3
                  xor          t0, a7, a1
                  fmul.s       ft4, fa7, ft6, rne
                  fmv.w.x      ft8, t4
                  fmv.x.w      s11, ft8
                  fsgnjx.s     fs1, fs8, fa0
                  fcvt.s.w     ft4, zero, rtz
                  rem          s3, t4, t2
                  fadd.s       ft2, fs1, fs0, rne
                  slli         ra, s8, 29
                  fsgnj.s      fs11, fa2, fs8
                  fclass.s     t2, fs10
                  or           s4, a0, t0
                  ori          ra, s3, -1064
                  fmax.s       ft8, fs4, fa1
                  sltiu        s9, a0, -1845
                  rem          a3, s9, tp
                  srli         t6, zero, 23
                  fsgnj.s      fs9, fa6, fa2
                  srli         s5, t0, 25
                  slli         sp, a0, 23
                  fcvt.w.s     a4, ft5
                  fle.s        t1, ft11, fs2
                  sub          zero, a2, t6
                  sub          s1, s4, a0
                  mul          s9, t0, s11
                  fle.s        s7, ft3, fs3
                  fsub.s       fa1, fs8, fs3, rup
                  srl          t4, s4, a1
                  divu         s6, gp, t3
                  auipc        s8, 147131
                  fmv.x.w      a4, ft11
                  fcvt.wu.s    s6, ft1, rmm
                  auipc        t4, 464650
                  nop
                  mulhu        a1, s9, t0
                  and          a6, t3, t1
                  fcvt.w.s     s1, fa2, rtz
                  sub          s0, t2, s7
                  mulhu        s8, a4, t5
                  slli         sp, a1, 7
                  sra          a7, tp, t1
                  flt.s        a3, fs3, ft4
                  fmul.s       fa1, ft4, ft4, rtz
                  andi         s9, a6, 1255
                  slti         a3, t4, -1554
                  slli         t6, s4, 18
                  addi         t4, s3, -409
                  rem          s8, a0, s0
                  fsgnjn.s     ft6, fa3, ft5
                  sra          s7, s9, t2
                  sra          zero, tp, t1
                  slti         t0, t3, 1657
                  xori         s9, tp, 1731
                  fclass.s     a1, fs1
                  fmv.x.w      a7, ft6
                  add          s9, t6, t6
                  srli         t6, t6, 8
                  slti         a1, a6, 1305
                  fsqrt.s      fs4, fs0
                  remu         s0, ra, a1
                  fmul.s       ft0, fs2, ft2
                  sltu         s10, s6, a2
                  srli         a3, t5, 14
                  rem          a1, s8, s1
                  sltu         s2, a6, s11
                  fdiv.s       fs4, ft6, ft3, rdn
                  nop
                  fmul.s       fs1, fs9, fs1
                  rem          s9, a3, s9
                  fcvt.s.wu    fs11, s6, rmm
                  auipc        t4, 323733
                  fsub.s       fs5, fa6, fa7
                  sltiu        s4, a3, 1976
                  fdiv.s       fa6, ft3, fs8, rmm
                  fmv.x.w      s9, fs8
                  fmv.x.w      a3, ft3
                  xor          s8, s5, t2
                  fcvt.w.s     ra, ft8
                  fmin.s       fs5, ft8, fs1
                  auipc        t4, 970774
                  sub          s6, a6, t2
                  fclass.s     s2, ft4
                  and          t4, s5, s9
                  mulhsu       t1, a5, s3
                  fmin.s       ft2, fa7, fa3
                  fclass.s     gp, ft9
                  lui          a1, 134430
                  andi         a4, s6, -51
                  fmv.x.w      s8, ft9
                  sub          a3, s0, s4
                  mulh         a4, a6, s3
                  auipc        a4, 20576
                  fmin.s       ft1, fs7, fs3
                  fclass.s     s5, fs3
                  fmv.x.w      a7, fs6
                  rem          s9, t1, a1
                  fclass.s     a7, fa5
                  sub          s0, gp, a4
                  fsgnjx.s     fs10, fa3, fs6
                  xori         sp, a6, -1357
                  fsqrt.s      ft0, fs0, rne
                  div          s7, s7, zero
                  srli         s1, t5, 20
                  fsgnjn.s     ft6, fs9, fa4
                  feq.s        a0, fs1, fa3
                  fle.s        s7, fa5, ft3
                  fmin.s       fs7, fa6, ft3
                  fmin.s       fa0, ft1, fa5
                  flt.s        s5, fs4, ft8
                  andi         t6, ra, 1773
                  fcvt.wu.s    s6, ft0, rdn
                  fcvt.wu.s    t0, fs3, rmm
                  slt          s11, a0, sp
                  sll          a3, gp, t4
                  lui          sp, 189250
                  sll          a2, s1, t2
                  remu         s11, a2, s0
                  fcvt.s.wu    fa3, t3, rdn
                  auipc        a0, 795754
                  div          a6, a3, t3
                  rem          s0, a6, t6
                  and          ra, a7, t1
                  auipc        s2, 45540
                  remu         s1, gp, s9
                  ori          a2, s0, 574
                  divu         sp, s7, a5
                  slti         s0, t6, -818
                  andi         a3, t0, 1078
                  addi         s5, a7, 764
                  fle.s        s3, ft2, fs9
                  flt.s        s4, ft3, ft8
                  fcvt.s.w     ft2, s8
                  div          a2, s9, s4
                  fsgnj.s      fs10, fa7, fs3
                  fcvt.s.wu    fs9, s1, rdn
                  mulh         sp, sp, a5
                  fmv.w.x      fs1, t5
                  addi         t3, t0, -855
                  sltiu        s0, a3, -1255
                  auipc        s7, 347960
                  fmul.s       ft3, ft3, fa2
                  fmul.s       ft11, ft5, ft11, rne
                  fsub.s       fs10, fs10, fa0
                  divu         a6, t2, a2
                  feq.s        s9, fs5, ft7
                  fsqrt.s      ft10, ft5
                  sra          s1, t5, s11
                  srai         s1, s6, 17
                  feq.s        s0, fs0, fs3
                  sll          s2, a2, s7
                  slli         t1, s7, 26
                  fdiv.s       fa3, ft7, fs0
                  fcvt.s.w     fa1, s10
                  remu         s1, t4, a7
                  fadd.s       ft2, fa1, fa7
                  sra          s11, s3, a0
                  sltu         s4, s8, a3
                  fmv.x.w      a1, ft1
                  srai         s9, s9, 9
                  nop
                  fadd.s       fs3, ft3, fa7
                  srai         s6, a2, 18
                  slti         s4, s10, 394
                  nop
                  lui          a0, 555859
                  fcvt.w.s     s5, fa3
                  fsgnjn.s     ft6, fa0, fs9
                  sra          a1, t6, t0
                  fle.s        zero, fa0, fs7
                  andi         zero, t1, -1427
                  mul          a6, s10, a7
                  xori         t3, s8, -660
                  fdiv.s       ft10, ft5, fa6
                  div          t0, s10, s10
                  fcvt.s.w     ft6, t3
                  fmv.w.x      fs9, gp
                  fcvt.s.w     fa2, s0, rmm
                  fcvt.wu.s    s9, fa2, rdn
                  feq.s        s2, fs2, ft7
                  nop
                  fmv.x.w      t0, ft6
                  fclass.s     a4, fs8
                  ori          s0, gp, 711
                  fle.s        sp, fa4, fs3
                  slli         s8, tp, 28
                  fcvt.s.w     ft8, a3, rmm
                  fcvt.wu.s    s4, ft2, rne
                  mulhsu       a0, t6, s10
                  fclass.s     ra, ft2
                  flt.s        ra, ft1, ft0
                  fmax.s       ft10, ft0, ft0
                  fsub.s       fs1, ft10, fa0
                  and          t2, a4, s6
                  mulhsu       ra, s6, t0
                  fmin.s       fs0, ft8, fs0
                  fmv.x.w      a7, fs0
                  fmax.s       ft8, fa7, ft2
                  fsgnjn.s     ft4, ft10, fa5
                  srl          t0, s6, s10
                  or           a2, s5, t6
                  nop
                  mulhsu       t3, s0, s5
                  srl          t0, s5, a1
                  sll          a4, gp, s5
                  fdiv.s       fa6, ft5, ft9
                  div          gp, a1, a1
                  mulhsu       a7, a1, s0
                  mulhu        a4, s10, s1
                  fmv.w.x      fs5, t0
                  fcvt.wu.s    a7, ft11, rmm
                  slti         s8, t6, 1165
                  andi         a4, a7, 1583
                  sltiu        a0, s1, 1567
                  mulh         a6, s4, gp
                  mulhu        s1, s11, s5
                  sltu         s9, t0, s0
                  fcvt.s.wu    ft10, a5
                  addi         s10, a0, 248
                  fmin.s       fs1, fa7, fa1
                  fcvt.wu.s    ra, ft11, rup
                  fcvt.s.w     fs3, a7, rmm
                  andi         s11, s6, 967
                  sub          t6, s11, t5
                  xor          a2, a3, s10
                  srl          a6, s2, t6
                  fsub.s       fs5, ft4, fa6
                  ori          ra, gp, 141
                  fle.s        a4, ft6, ft0
                  fmax.s       fs0, ft3, ft8
                  fmv.w.x      fs9, s9
                  sltu         s0, s1, a7
                  fsqrt.s      fs1, ft2, rmm
                  feq.s        s5, fa5, ft4
                  nop
                  sltiu        s2, t4, -82
                  fdiv.s       fs10, fa5, fa1, rup
                  addi         s10, ra, 2027
                  mulh         sp, tp, a6
                  fsgnjn.s     fs6, ft9, fs9
                  fsqrt.s      ft1, fa6
                  divu         t6, a1, s8
                  rem          t6, a1, t5
                  flt.s        s7, fs2, fs1
                  fsqrt.s      fs9, fa7, rne
                  slt          t3, s4, s0
                  div          a3, t6, t0
                  fcvt.wu.s    s10, ft8
                  addi         gp, a2, -1224
                  srl          s1, s3, a3
                  feq.s        a0, ft7, fa4
                  flt.s        s7, fs5, ft5
                  rem          s6, a1, a1
                  sltu         t2, s2, s7
                  mulhu        a4, s11, a7
                  divu         zero, s10, zero
                  fmin.s       fs9, fs5, ft1
                  fmv.w.x      fs2, s7
                  fsgnj.s      fs6, fs2, fs10
                  fadd.s       fa3, fs0, fs8, rmm
                  fmul.s       fs2, fs0, fa7
                  feq.s        s7, fs5, ft11
                  remu         t1, s5, ra
                  auipc        a1, 526159
                  fmv.x.w      s3, fs7
                  add          ra, a3, s11
                  fsgnjx.s     ft3, ft0, ft1
                  fsgnj.s      fs6, ft0, fs0
                  nop
                  divu         s0, a4, s6
                  xori         a4, tp, 1824
                  sub          gp, s9, gp
                  xor          s11, t4, zero
                  mul          zero, a5, a4
                  fsqrt.s      ft4, ft4, rdn
                  andi         s9, a3, -745
                  fmv.x.w      s8, fs0
                  xor          t3, ra, s4
                  addi         zero, t0, -1867
                  srai         a2, s11, 27
                  fmv.w.x      fs6, s2
                  sub          s8, s5, s8
                  lui          s2, 1032498
                  fmin.s       fa7, ft1, fs1
                  fsub.s       fa5, ft8, fs0, rup
                  fdiv.s       ft5, fs6, fa7, rtz
                  fcvt.s.w     fs6, a5
                  fsqrt.s      fa2, fs9
                  xori         t4, t5, -762
                  fmv.x.w      a7, fs9
                  andi         s0, t5, 1789
                  mul          a2, s8, a2
                  div          a0, a3, s10
                  slti         t0, s1, -1272
                  srl          s2, a4, gp
                  fcvt.s.wu    ft2, t0, rup
                  fadd.s       fs8, fs7, fs6, rne
                  fle.s        s9, fa1, fs2
                  rem          t6, ra, s6
                  fmin.s       fs1, ft3, fa2
                  sub          gp, zero, t1
                  fsqrt.s      ft10, ft5, rup
                  fmax.s       fa0, fs3, ft7
                  auipc        s6, 449702
                  sltiu        s1, a1, 371
                  slt          a6, s5, s6
                  srai         t3, a5, 17
                  nop
                  and          a0, s6, s8
                  andi         gp, t5, -594
                  srl          sp, s11, t4
                  slt          zero, gp, zero
                  div          s8, t1, zero
                  srai         t6, sp, 21
                  fcvt.s.wu    fs2, tp, rne
                  fcvt.wu.s    a3, ft4, rup
                  add          gp, s1, t2
                  ori          a1, s5, 723
                  fmv.w.x      fa1, t6
                  sll          a0, t1, s3
                  add          t6, t3, a6
                  ori          a0, a3, 1987
                  srl          s8, t5, ra
                  mulhsu       s9, ra, s6
                  fcvt.w.s     sp, fa7, rmm
                  feq.s        a3, ft3, fa3
                  mulh         sp, s8, a2
                  fclass.s     a0, fs6
                  and          t2, s2, t6
                  fsgnj.s      ft6, fs6, fs11
                  sltu         ra, s10, a7
                  andi         t0, sp, -1568
                  fsgnjx.s     fs1, ft8, ft2
                  and          s3, gp, t2
                  fsub.s       fa4, fa4, ft6
                  fsgnj.s      fs8, fa1, ft1
                  xor          s4, t2, a1
                  fmv.w.x      ft3, t6
                  fsub.s       fs3, fa5, fa5
                  feq.s        t6, ft2, fs5
                  fsgnj.s      fs3, ft10, fs11
                  fdiv.s       fs4, fa4, fs0
                  srl          a0, s10, t3
                  fmv.w.x      ft2, a5
                  fmv.w.x      ft6, a2
                  feq.s        s8, ft2, fs7
                  fsgnjx.s     fa5, ft6, fa4
                  mulhu        s6, a3, ra
                  mulhu        s3, t0, a5
                  nop
                  fsgnjx.s     fa5, ft9, ft2
                  slt          s11, s8, t0
                  xori         t3, s7, -270
                  fcvt.s.wu    fs6, s4
                  nop
                  rem          s4, sp, sp
                  fsgnjx.s     fa2, fs4, fs0
                  add          sp, s9, t6
                  fcvt.w.s     a0, fs2
                  sub          s5, s3, sp
                  addi         t2, a5, -431
                  addi         t4, s4, 37
                  divu         s3, a4, gp
                  fsqrt.s      fa5, ft6
                  xori         a1, a2, -1246
                  fcvt.s.w     fs1, t0, rup
                  slt          t4, s3, t0
                  srl          t1, a1, a6
                  fcvt.w.s     t3, ft0
                  auipc        sp, 576793
                  or           s7, s11, s2
                  fsgnj.s      fs3, fa4, fs1
                  sll          s3, t5, s2
                  sltiu        s0, s5, 1282
                  nop
                  fclass.s     t6, fs3
                  fclass.s     s1, fs1
                  srli         s3, a3, 24
                  fcvt.s.wu    fs3, s9
                  xori         s0, a2, -789
                  andi         s9, s11, -797
                  fmul.s       fs11, ft6, ft7, rtz
                  srai         a3, t5, 28
                  lui          a1, 612698
                  fsub.s       fs8, fa2, fs0
                  add          s6, a7, t1
                  mulhu        t2, a4, a4
                  fcvt.s.w     fs7, a2
                  fmax.s       fs7, ft9, ft1
                  fmin.s       fa5, ft2, fa5
                  fclass.s     gp, ft5
                  add          s10, a6, t4
                  andi         t2, a7, 1291
                  flt.s        t2, fs6, fs9
                  srli         s0, s0, 8
                  fmax.s       fa7, ft8, fs10
                  fmul.s       fs7, fs6, ft0, rdn
                  srl          s2, t3, t0
                  xori         t1, t2, 523
                  fmax.s       ft6, fs8, fs9
                  fmv.w.x      fa2, s11
                  fmv.x.w      t2, fs0
                  fmul.s       fa1, fs1, ft9
                  add          t4, s1, a6
                  fmax.s       fa7, fs2, fs10
                  fdiv.s       fa1, fs1, fs5, rup
                  mul          t2, t0, s2
                  ori          s5, t4, 16
                  feq.s        s10, ft0, fa0
                  auipc        a3, 648336
                  feq.s        ra, fa2, ft3
                  sltiu        s0, s2, 1462
                  fmv.w.x      ft1, a5
                  slli         s5, s7, 23
                  auipc        t0, 354909
                  div          s0, a4, t5
                  xor          ra, s2, s5
                  fmin.s       fs5, fs0, fa5
                  fsub.s       fs1, fs6, ft0, rdn
                  ori          a3, s3, 1653
                  fcvt.w.s     zero, fa5
                  remu         s11, s9, a4
                  divu         s4, t0, s9
                  slli         s11, s6, 22
                  fsub.s       fa5, ft7, ft4
                  auipc        s9, 150334
                  fmin.s       fs10, fs3, ft9
                  xori         s6, s9, -1921
                  fmax.s       fs8, ft8, fs1
                  auipc        t4, 22902
                  fsqrt.s      ft11, fa3
                  feq.s        s7, ft3, fa1
                  andi         s9, s11, -44
                  or           a4, a1, s11
                  fmul.s       fs0, ft5, fa0
                  fdiv.s       ft4, ft0, ft7, rne
                  mulhu        s2, a2, t3
                  remu         a2, t0, a6
                  fmv.x.w      s5, fs3
                  fcvt.w.s     a3, fa1, rtz
                  sub          t2, s4, s8
                  add          a0, a2, s2
                  fsgnjx.s     fa5, fs3, fa3
                  fmv.w.x      fs11, s6
                  fcvt.s.w     fa4, a4, rup
                  fsgnjn.s     fs10, fa7, fs11
                  srai         gp, s4, 1
                  sltiu        s10, t3, -990
                  lui          s2, 187937
                  fdiv.s       ft8, fs10, ft9, rne
                  fmax.s       ft10, fs8, fs3
                  fsqrt.s      ft4, ft3
                  fcvt.s.wu    fs0, a7, rtz
                  fmv.w.x      fs9, t2
                  fadd.s       fs4, fs0, fs11
                  ori          s11, s1, 1755
                  fmul.s       fs3, fs0, ft9, rne
                  and          t0, a3, t3
                  andi         a0, a4, -994
                  fmv.x.w      s11, fs6
                  slt          s1, a4, ra
                  fdiv.s       ft3, ft3, fs5
                  sub          t3, s2, t4
                  fcvt.s.w     ft1, t1, rmm
                  remu         t0, t0, s5
                  fcvt.s.w     fs9, a0, rne
                  and          a4, t0, s6
                  fcvt.s.w     fa4, t6, rtz
                  div          s10, s9, t3
                  lui          a7, 130805
                  fcvt.wu.s    gp, ft5, rup
                  fcvt.s.wu    fs11, t0, rdn
                  fcvt.s.wu    fa2, s11, rne
                  add          t1, t0, t2
                  nop
                  rem          s5, sp, t1
                  fsqrt.s      fs8, fa6, rtz
                  fcvt.wu.s    a4, ft7, rdn
                  rem          a0, t0, t4
                  sll          gp, gp, ra
                  add          s8, t6, a2
                  fsgnjn.s     fs5, fs1, ft4
                  div          s5, ra, a7
                  srai         a7, t2, 16
                  fsgnjx.s     fs2, fs1, fs6
                  auipc        a6, 166266
                  mulhsu       a7, ra, s8
                  fsgnj.s      fa3, fs6, ft10
                  remu         s0, a3, t0
                  srli         s10, s10, 30
                  fcvt.s.wu    ft9, t4
                  mulh         s9, a1, t2
                  fcvt.s.wu    fa2, a3
                  fclass.s     s8, fs11
                  mul          gp, a0, s0
                  slt          s5, s9, tp
                  andi         s4, t1, -101
                  mulhsu       a2, a4, s6
                  fle.s        s9, ft0, fa1
                  sra          t0, sp, a1
                  fcvt.s.w     ft2, t0, rtz
                  flt.s        s11, fs8, ft1
                  fmul.s       ft8, fa4, ft5, rmm
                  fsgnjx.s     ft0, fa2, fs0
                  lui          ra, 298116
                  fcvt.s.w     fs7, t2, rne
                  or           gp, gp, gp
                  and          s0, a7, s11
                  and          s2, s9, a5
                  fdiv.s       ft7, ft0, fa1
                  slti         s10, tp, -1360
                  or           t2, a0, a3
                  and          s9, ra, s9
                  fsqrt.s      fs1, fa7, rmm
                  fmax.s       fs10, ft5, ft6
                  fmax.s       ft11, fa7, ft1
                  mulhu        s0, s5, a6
                  sll          a0, t0, sp
                  remu         ra, s9, t2
                  fsub.s       ft9, fa1, fs6, rtz
                  fmv.w.x      fa2, s11
                  sra          a6, a0, s3
                  auipc        t1, 635925
                  auipc        s10, 851250
                  divu         zero, t0, s8
                  fsqrt.s      ft0, fs6, rdn
                  mulhu        s9, s8, s7
                  fcvt.w.s     s0, fs2, rtz
                  fcvt.wu.s    s7, fa6, rne
                  sltiu        a2, s3, 1094
                  flt.s        s0, ft3, ft4
                  div          a1, s5, a5
                  div          a4, a5, s6
                  slli         s10, a5, 26
                  remu         s9, s11, t6
                  xori         t3, a7, 217
                  sll          a1, s8, a3
                  fcvt.wu.s    s8, fa5, rmm
                  mulhsu       s1, t5, t3
                  srai         a3, s3, 1
                  mulh         t3, ra, tp
                  fcvt.s.wu    ft7, s9
                  xori         s4, sp, -750
                  fle.s        s4, fs7, fs10
                  ori          t0, gp, 1045
                  fclass.s     t3, fa5
                  and          zero, a0, a1
                  rem          t3, a1, s6
                  div          a2, t2, gp
                  fadd.s       ft6, fa5, ft8
                  nop
                  sub          a6, t1, t2
                  sltu         s8, a7, s8
                  xor          a2, s7, t3
                  addi         t3, t5, 1314
                  sltiu        s5, a4, 7
                  fcvt.wu.s    gp, fs1
                  sll          t1, a6, sp
                  andi         t3, t2, 467
                  fsqrt.s      fs11, fa0
                  fmv.w.x      ft9, t0
                  mul          a7, s5, a4
                  flt.s        t2, fs6, ft8
                  fmax.s       fa5, ft2, fs1
                  ori          a6, a2, -1729
                  fcvt.wu.s    s7, fa3, rne
                  slli         a0, zero, 31
                  addi         zero, s10, -420
                  slli         a1, t6, 10
                  mul          a0, t0, s4
                  and          s2, t3, t2
                  ori          t4, s6, 16
                  fmax.s       fs10, fa3, fa6
                  fsgnjn.s     fs4, fa6, ft3
                  slli         s11, s10, 5
                  sltu         a6, a6, a0
                  andi         t0, s4, -903
                  fle.s        s7, fa3, ft7
                  lui          s9, 177926
                  flt.s        s10, ft4, ft3
                  mulh         t1, a5, t3
                  slti         s0, gp, 151
                  div          a4, s11, gp
                  fmin.s       fa2, ft3, ft5
                  add          t1, t1, s10
                  mulhu        s10, a1, t4
                  mulhsu       s4, tp, gp
                  feq.s        s9, fs8, fa3
                  and          a1, s6, s9
                  ori          t2, s9, 1058
                  fcvt.wu.s    s0, fa1
                  mulhsu       zero, s9, t0
                  ori          s0, s6, 1878
                  fsub.s       ft0, fs10, fs1
                  nop
                  fmv.w.x      ft0, a1
                  mulhsu       sp, s5, t0
                  ori          a4, s8, 1553
                  rem          a0, s5, a5
                  srai         t2, a6, 17
                  sll          a6, s6, tp
                  flt.s        a0, ft10, fs1
                  or           t2, a5, s0
                  sra          s9, gp, a6
                  lui          t2, 24214
                  fmin.s       ft2, fs11, ft3
                  divu         a3, a3, sp
                  srli         ra, a1, 5
                  fmv.x.w      t6, fs0
                  fdiv.s       fs5, ft7, fa6, rup
                  fsub.s       ft4, ft6, fa7, rne
                  divu         s0, t1, a1
                  flt.s        ra, fs11, fa3
                  srai         s3, a3, 20
                  remu         s3, s4, a7
                  or           a1, a0, tp
                  fmul.s       fs10, fs3, fa6, rmm
                  xori         s6, a6, -1516
                  divu         s3, t2, t3
                  and          t6, s6, a0
                  fcvt.s.w     ft4, gp
                  fclass.s     a7, ft10
                  sra          a6, ra, a4
                  sub          zero, t5, s7
                  flt.s        s11, ft5, fs7
                  lui          s3, 689717
                  fcvt.wu.s    t4, fa1, rtz
                  flt.s        s4, fa1, fa2
                  flt.s        a3, fs5, fa3
                  add          s7, a4, t0
                  div          a3, sp, a6
                  fsqrt.s      ft1, fs10, rmm
                  sltiu        s5, a6, -609
                  xor          t2, t0, s1
                  flt.s        ra, fs4, ft9
                  fcvt.w.s     t1, ft5
                  fmv.w.x      fa1, a6
                  fmv.x.w      t2, ft8
                  slti         t3, s3, -1273
                  fsgnj.s      ft5, ft7, fa4
                  slti         gp, a0, 1503
                  fsub.s       ft5, ft4, ft2, rtz
                  remu         s0, s9, t1
                  divu         s11, a6, t6
                  divu         gp, zero, sp
                  srai         s1, t2, 17
                  rem          s0, zero, s9
                  mulh         t2, t2, s8
                  sltiu        ra, a0, -1318
                  fsgnjn.s     fs8, fa3, fs9
                  mulhu        s10, s0, s11
                  rem          s11, s3, a3
                  sltiu        t4, a1, -137
                  div          s1, t6, t2
                  feq.s        s7, fa1, ft9
                  slt          s0, t1, s2
                  lui          s10, 680475
                  sll          s3, s3, t1
                  andi         sp, a2, -1145
                  and          s5, s5, s4
                  slli         ra, s3, 8
                  or           s10, s7, s10
                  slti         s0, t6, -14
                  fdiv.s       ft5, ft8, ft6, rtz
                  srl          a2, s1, t0
                  fmv.x.w      sp, fs6
                  fsgnj.s      fa5, fs1, ft9
                  nop
                  sltiu        a6, s9, -1166
                  div          t4, ra, a7
                  sub          a2, t2, a2
                  fsub.s       fs7, fa7, ft5, rmm
                  nop
                  fdiv.s       fa3, fa0, ft7, rtz
                  fmv.x.w      s9, ft8
                  fsub.s       fa2, ft9, fa4
                  sltu         s3, t6, a0
                  fcvt.wu.s    a7, ft11
                  flt.s        s10, fa4, fs11
                  addi         t3, t6, -260
                  srl          t3, tp, s6
                  fsqrt.s      fs1, fs6
                  remu         s11, s5, t6
                  mulh         s5, t0, t1
                  nop
                  fcvt.s.w     fs0, s3
                  sltiu        t2, sp, -512
                  rem          a3, a4, tp
                  fle.s        s11, fa0, ft1
                  remu         a0, s2, s3
                  flt.s        a6, fa6, fa3
                  slt          t2, a5, a4
                  fmv.w.x      fa4, a3
                  flt.s        a2, fs3, ft6
                  xori         a0, s8, -1201
                  or           gp, a0, s2
                  mulhsu       t6, s9, s2
                  xor          s9, s1, t0
                  sra          s8, t2, s11
                  auipc        a6, 740220
                  mulhu        s9, t3, a3
                  lui          a0, 659655
                  addi         sp, t0, -1516
                  fmul.s       fs6, fs3, ft2, rdn
                  feq.s        s10, ft7, fs5
                  sub          a0, ra, a7
                  addi         a3, a4, 285
                  mulhsu       a6, s5, s8
                  srl          a1, a4, a3
                  remu         ra, t0, a3
                  flt.s        a0, fa4, fs5
                  fmin.s       ft2, fa3, fs7
                  ori          s5, sp, -718
                  divu         a3, tp, a0
                  fmv.w.x      ft4, a5
                  sub          zero, a3, t5
                  div          a4, s4, s2
                  fsgnj.s      ft5, fs5, ft8
                  xori         s6, zero, -1815
                  fsgnj.s      fa7, fs0, ft7
                  fmin.s       fa5, fs8, ft2
                  fcvt.wu.s    s9, ft6
                  mulh         sp, t2, s1
                  xor          s10, tp, s1
                  and          ra, ra, s3
                  srai         s10, s6, 5
                  slt          s1, s1, s9
                  rem          t6, s7, s11
                  fsqrt.s      ft5, fs5
                  fmul.s       fs1, fa3, ft10, rmm
                  fcvt.wu.s    gp, ft10
                  fsgnjx.s     fa7, fa7, fa3
                  fmv.w.x      fs5, s1
                  fmv.w.x      fs4, s4
                  fsgnjx.s     fa5, ft8, ft4
                  fcvt.s.w     ft5, a7
                  mulhsu       t0, s0, s7
                  slti         gp, s4, 256
                  lui          zero, 576494
                  flt.s        t2, ft4, fa6
                  sra          zero, a2, ra
                  fcvt.s.wu    fs1, s6, rdn
                  or           a2, s4, s6
                  fcvt.s.wu    ft3, s10
                  divu         s11, s8, s8
                  nop
                  auipc        s5, 345244
                  fsub.s       ft11, fs2, ft9, rtz
                  fcvt.s.wu    ft4, t0, rne
                  fsub.s       fa3, fs3, fs7
                  fle.s        s8, fs7, fa6
                  fclass.s     t3, fs6
                  flt.s        zero, ft5, ft2
                  add          a2, t4, a2
                  srai         a6, sp, 8
                  fmv.x.w      a3, fa4
                  remu         s7, s1, a3
                  srai         a0, a4, 17
                  slt          t0, sp, s11
                  srl          t0, s10, a7
                  addi         s3, a3, 1851
                  slt          s7, s5, a3
                  nop
                  remu         s8, zero, s1
                  fcvt.s.w     fs5, s11, rtz
                  fcvt.w.s     a2, fs2
                  mulh         s3, s9, s1
                  srai         s3, a4, 16
                  srli         s11, gp, 7
                  add          a0, s1, s9
                  srai         s5, t6, 29
                  sltiu        s7, s4, 97
                  xor          a1, a3, tp
                  andi         a6, a5, -444
                  srl          s3, a6, t2
                  fmax.s       fs0, fs5, fa1
                  fsgnjn.s     fa1, fa3, fs3
                  srai         s11, ra, 29
                  sltu         s1, s10, s0
                  flt.s        a6, fs11, fs10
                  fsqrt.s      fs1, ft6, rmm
                  mulhsu       s8, s2, a4
                  fmv.x.w      gp, ft5
                  mulhsu       s7, t5, s3
                  xor          a3, s11, sp
                  fadd.s       ft9, fa3, fs7
                  fmv.w.x      fs0, gp
                  sub          a4, a1, s2
                  sll          s3, s11, s0
                  xor          t2, s11, a5
                  fsgnj.s      fa5, fs4, fa4
                  sra          t0, s11, s11
                  sub          s2, t6, s8
                  fdiv.s       fs4, ft3, fa0, rmm
                  lui          a3, 197974
                  slli         a7, gp, 20
                  fmax.s       fs4, ft2, ft5
                  xor          s1, a6, s7
                  div          t6, s11, s3
                  sra          s10, s10, a0
                  fsgnjx.s     ft4, fa5, fa7
                  mulh         t0, gp, a4
                  sltu         s2, s3, s0
                  fmv.x.w      s1, fs6
                  fmv.w.x      fs0, s10
                  fcvt.wu.s    s0, fs1
                  nop
                  mul          s4, t3, t6
                  sll          t2, s9, a7
                  divu         t0, a0, zero
                  fmax.s       fa3, ft7, fa0
                  mulhsu       s8, sp, gp
                  fcvt.wu.s    a0, fs3
                  xor          gp, s11, a5
                  slli         s7, s2, 31
                  andi         a6, t0, 1334
                  mul          s7, t5, a1
                  mulh         s0, t3, t3
                  ori          a2, tp, 662
                  fcvt.s.wu    ft6, s11, rne
                  mulh         a4, t1, ra
                  srli         s8, s9, 11
                  auipc        s8, 765350
                  xori         a2, s2, 1528
                  div          t4, a6, a1
                  feq.s        s0, fs9, fs6
                  srl          ra, s7, a7
                  sll          a1, a6, gp
                  xori         a0, a6, -1734
                  or           s0, a3, t5
                  fdiv.s       fs10, ft7, fa2, rtz
                  or           t0, s8, s5
                  mul          sp, s5, t5
                  auipc        s1, 130475
                  nop
                  srai         t1, a5, 31
                  sra          a7, s7, a1
                  fmv.x.w      t0, ft5
                  remu         a1, s1, a7
                  slt          t6, s3, a1
                  fclass.s     a6, ft4
                  mulh         t2, s9, sp
                  fclass.s     t0, fa3
                  flt.s        s4, ft6, ft7
                  add          s8, t6, s8
                  fsqrt.s      fa6, fs9, rtz
                  sll          s7, s3, a5
                  slti         t1, a0, 64
                  srai         t6, s0, 17
                  and          a1, s10, s4
                  sub          s8, gp, s11
                  ori          s3, gp, -939
                  fcvt.wu.s    s3, fa3
                  sub          t3, a6, s3
                  fadd.s       ft6, ft8, fa4, rmm
                  fle.s        s5, fs7, ft11
                  remu         s1, t6, zero
                  flt.s        a3, ft3, fs11
                  add          s9, t2, s9
                  and          s2, t3, t6
                  or           s6, s1, t5
                  fmul.s       ft3, fs8, fa6, rtz
                  sltiu        a1, t5, 873
                  sll          t0, s11, sp
                  nop
                  auipc        s6, 445800
                  srl          t0, s8, t6
                  fmul.s       ft3, ft7, ft9
                  mulhu        a4, a2, tp
                  xor          a2, s3, t5
                  fcvt.s.w     ft4, a0, rup
                  sltu         t2, a6, a2
                  fsgnjn.s     fs5, ft0, ft2
                  or           s10, t5, a0
                  fcvt.w.s     a4, fs6, rne
                  sltiu        a1, a6, 1957
                  sltiu        s5, t5, 1668
                  xori         ra, s6, 1746
                  addi         s11, a6, 1583
                  lui          t4, 118955
                  xori         a3, a1, 793
                  fmul.s       ft0, ft6, fa4
                  fmin.s       ft9, fs1, fa1
                  slti         s11, s4, 937
                  sltu         s5, s2, t1
                  fsqrt.s      ft5, fa2
                  sll          s7, s0, a7
                  xor          a6, t1, a5
                  and          s1, t6, a5
                  fcvt.s.wu    ft5, s0, rup
                  fsgnjn.s     fa0, fa0, fa6
                  xor          gp, zero, t5
                  srli         s0, s3, 4
                  fclass.s     s3, fs7
                  sll          a0, t2, t5
                  sub          a4, s4, a3
                  srai         t1, s1, 4
                  fsgnjn.s     ft10, ft2, ft7
                  divu         a7, a1, a6
                  mulhsu       s10, s0, s6
                  slt          a7, t1, s11
                  sltiu        t4, s4, 89
                  srl          s1, s1, t2
                  srli         s0, s4, 10
                  fsgnj.s      fs5, fs10, fa3
                  fcvt.s.wu    ft7, s6
                  mul          t6, a4, ra
                  and          s11, s10, zero
                  fcvt.wu.s    s8, ft0, rup
                  xori         t6, s3, 1342
                  xori         t4, s2, -1067
                  srai         s2, a0, 10
                  mulh         t2, t2, a4
                  fsub.s       ft2, fa2, fs5, rtz
                  addi         s1, a2, -309
                  sltu         s5, t1, a6
                  srli         a1, a7, 25
                  and          s1, ra, t4
                  slti         gp, s7, 1121
                  fsgnjx.s     fs8, ft1, ft6
                  fmax.s       fa4, fs7, ft1
                  fmv.x.w      a4, ft1
                  xori         s1, s1, 88
                  fle.s        t4, fs9, fa5
                  fcvt.s.w     fs1, a5
                  sltiu        s0, a7, -1212
                  flt.s        gp, ft11, ft2
                  andi         s10, s6, 955
                  mul          a2, s11, zero
                  fcvt.s.w     fa0, s6, rtz
                  fmul.s       fa6, fs1, fa4, rdn
                  divu         s2, t5, t3
                  fcvt.w.s     a4, ft0
                  feq.s        s10, ft2, ft3
                  fdiv.s       fs7, ft6, fs1, rtz
                  sltu         a0, s6, t6
                  fdiv.s       fa0, ft4, fs6, rtz
                  fsqrt.s      fs0, ft1, rtz
                  auipc        s0, 841049
                  fmul.s       fs8, fs4, ft2
                  fmv.w.x      ft6, s9
                  fsgnjn.s     ft0, fa5, ft4
                  fmul.s       ft6, ft9, ft0
                  fmul.s       ft0, fs5, fs4
                  srai         t2, a0, 6
                  fclass.s     gp, fa1
                  fcvt.w.s     t1, fs2, rup
                  addi         t2, t1, -1089
                  remu         t2, ra, t3
                  fmv.w.x      ft9, t6
                  add          a3, t5, s0
                  srli         sp, a1, 0
                  sra          t0, sp, a4
                  sll          s0, s7, a7
                  sltiu        s5, s5, 1168
                  fadd.s       fa2, fa6, fs2
                  sltu         sp, t1, a0
                  fclass.s     s0, ft10
                  feq.s        s8, fa4, ft11
                  nop
                  fmin.s       ft4, fs11, fa6
                  mulhsu       s9, tp, sp
                  auipc        s7, 127039
                  fsgnjn.s     fa5, fs1, ft10
                  sltu         s5, a5, s1
                  fsgnjn.s     ft11, ft1, ft0
                  fdiv.s       ft1, ft7, fs11
                  mulhu        t1, gp, a2
                  mulh         a2, zero, tp
                  mulhsu       a3, zero, t5
                  fmul.s       fa0, fa5, ft11, rdn
                  mulh         s11, sp, s5
                  fmin.s       fa0, ft2, fs10
                  flt.s        a1, fa7, ft3
                  fmax.s       fs0, fs5, fa7
                  and          sp, s5, s0
                  div          a4, t2, s5
                  or           s0, sp, a5
                  srli         a1, zero, 26
                  feq.s        a2, ft8, fs3
                  lui          s4, 633382
                  fsub.s       fa4, fa5, fs11
                  div          a4, s11, t1
                  sltiu        t6, ra, -1994
                  fmul.s       fs3, fa4, fs8, rmm
                  slli         s1, s7, 21
                  remu         a1, t1, a5
                  fsgnjx.s     fa7, ft5, fs0
                  addi         s2, zero, -1246
                  fmin.s       ft0, fs8, fs2
                  sub          s6, s5, s9
                  srli         s6, t1, 22
                  fsub.s       fs7, ft8, fa0, rdn
                  nop
                  sub          s7, a0, gp
                  divu         s0, s10, s0
                  lui          s10, 259323
                  ori          t4, a1, -588
                  fsgnjx.s     fa5, ft10, ft2
                  feq.s        a3, fs3, fs8
                  slti         s5, t2, 653
                  xori         a7, a4, 1759
                  fcvt.s.w     fa3, t6
                  or           s3, s6, gp
                  slt          t3, s4, s4
                  fsub.s       ft8, fs1, ft1
                  sltiu        a7, sp, 805
                  srai         s2, t3, 7
                  mul          a2, s8, s9
                  fmax.s       fs4, fs10, ft5
                  fcvt.s.wu    ft5, a7
                  fsgnjn.s     ft10, ft11, fs3
                  rem          s11, s4, t2
                  andi         s9, zero, 1447
                  mulh         s0, a4, t6
                  nop
                  flt.s        zero, fs8, fa4
                  fcvt.s.w     fa3, t0
                  auipc        t1, 555871
                  fcvt.w.s     t3, ft0, rup
                  sra          a0, t3, t3
                  fadd.s       ft2, fs10, ft4, rtz
                  fsub.s       fa1, fs4, fa2, rne
                  fmax.s       ft4, fs3, ft2
                  fmul.s       fs10, fa2, fa2
                  auipc        s5, 991953
                  lui          zero, 610986
                  fmv.x.w      a3, fa3
                  nop
                  fsub.s       fs9, ft8, fs7, rne
                  xor          gp, a0, s3
                  sltu         sp, a0, gp
                  slli         zero, tp, 22
                  sra          gp, a5, a5
                  fsgnjx.s     ft2, fa6, fa5
                  fmax.s       ft11, fa1, ft11
                  xor          a7, s4, t4
                  srli         a0, a2, 22
                  xori         a1, tp, 1628
                  mul          zero, s1, t2
                  slti         t2, gp, 1500
                  fadd.s       fa5, fs5, fa1
                  srai         a7, t2, 5
                  mulh         s4, t3, a0
                  slt          gp, ra, t6
                  remu         a6, a5, a7
                  fsgnj.s      ft4, fa3, fs3
                  srl          a2, t5, a5
                  mulhsu       a1, s1, t1
                  auipc        s5, 353363
                  fcvt.wu.s    a7, ft2
                  sll          gp, s4, gp
                  mul          a1, s5, t3
                  andi         t3, a4, 753
                  fcvt.w.s     t4, fa2, rdn
                  andi         t3, tp, -504
                  fmul.s       ft9, fa2, fs9
                  fcvt.w.s     a1, fs1
                  fmin.s       ft7, ft2, ft2
                  sltu         a0, a0, a1
                  slt          a0, t2, t1
                  flt.s        a1, ft0, fs5
                  remu         s11, s11, s11
                  fmax.s       fs1, fa0, ft5
                  srli         t6, a2, 4
                  xori         s3, gp, -526
                  auipc        ra, 962630
                  divu         a2, s4, t1
                  sll          t4, s1, t2
                  flt.s        a7, ft3, fa7
                  fsub.s       fa0, fs5, fs0, rtz
                  rem          sp, s3, sp
                  sltiu        s2, a3, 1558
                  fmul.s       fs8, fa7, fs2, rdn
                  fsqrt.s      fa0, fs5, rne
                  srl          s10, a7, t2
                  rem          s8, s0, t3
                  mul          s6, s5, s4
                  ori          s0, a4, -999
                  fclass.s     sp, ft9
                  srl          t6, s1, gp
                  fclass.s     s1, ft9
                  fsgnj.s      fs3, fs3, ft6
                  auipc        s2, 436627
                  and          s4, sp, s8
                  auipc        a0, 31845
                  remu         sp, t5, t3
                  fsgnjx.s     fs11, ft8, fa4
                  sra          ra, zero, ra
                  fsub.s       ft1, fa3, fs6, rmm
                  srl          gp, s8, t4
                  fmul.s       fa6, ft1, fs9
                  divu         s0, s0, a6
                  feq.s        t0, fa5, fs1
                  fmul.s       fa1, fs9, fs4
                  addi         sp, s7, 355
                  fcvt.s.wu    ft10, t2
                  srli         s5, s4, 10
                  mulh         s8, s5, s1
                  nop
                  divu         s3, s3, sp
                  fsub.s       fs3, fs10, ft2
                  fsgnj.s      ft10, fs1, ft7
                  auipc        s7, 187543
                  fdiv.s       ft0, ft7, ft4
                  slt          a4, t5, t5
                  or           a6, zero, s3
                  xor          s2, t3, a1
                  fsgnj.s      ft1, fs10, fs9
                  sltu         a6, a5, a2
                  fsgnj.s      fa0, fs6, fs2
                  andi         s2, a6, 1806
                  fmax.s       fs4, fa1, ft3
                  fcvt.wu.s    zero, fs0, rmm
                  fmul.s       fa3, fa4, ft7, rup
                  fmv.x.w      t4, fs2
                  fcvt.s.wu    ft5, s9
                  xori         t2, ra, 416
                  fmul.s       fs7, fs2, fa1, rdn
                  divu         s5, t3, s5
                  srli         s9, s10, 28
                  auipc        s2, 95220
                  slli         t6, ra, 31
                  divu         s3, gp, a6
                  mulhsu       gp, a7, tp
                  fsgnjn.s     fa2, fa1, ft4
                  addi         sp, s6, 2044
                  fmv.w.x      ft1, s3
                  slli         s2, t2, 29
                  andi         s9, ra, -1076
                  sub          s11, a7, t1
                  fcvt.wu.s    a6, fs2, rtz
                  auipc        s10, 923027
                  fmin.s       ft10, fa0, fs7
                  mulh         a1, a0, s9
                  nop
                  fmin.s       fa1, fs10, ft5
                  fsgnjn.s     fs9, ft4, fa2
                  fmul.s       ft8, fa5, ft1, rne
                  fdiv.s       fs0, ft0, fs9
                  lui          t2, 563323
                  slli         s8, s0, 20
                  flt.s        s10, ft8, fs4
                  divu         t3, s5, s4
                  fadd.s       ft2, fs10, fs10, rtz
                  rem          ra, s8, s7
                  srl          a2, t4, a2
                  sub          s7, s10, a1
                  fmul.s       fa4, fa4, fs5
                  mul          zero, gp, tp
                  fsgnjn.s     ft4, fs11, ft9
                  xor          ra, a2, s11
                  fsub.s       fs11, fs0, fa0
                  fclass.s     zero, ft9
                  fcvt.s.wu    fa2, a2, rup
                  divu         zero, s2, a1
                  ori          a0, a4, 401
                  fclass.s     a7, ft11
                  or           s2, a4, t4
                  srli         s4, zero, 24
                  srai         t4, s7, 19
                  fsgnjx.s     fs10, fa6, fa4
                  fadd.s       ft6, fs3, fs4
                  slt          s1, a4, a4
                  andi         a0, a7, -1399
                  srli         gp, a5, 23
                  fsgnj.s      fs7, fs7, ft5
                  fmin.s       fa7, fs5, fa2
                  fsgnj.s      fa1, fs7, fs6
                  sub          t3, t0, s1
                  div          t6, t6, a1
                  fdiv.s       ft4, ft6, ft0, rup
                  fmin.s       ft2, ft11, fs7
                  fsgnj.s      ft8, fa2, fa7
                  flt.s        t2, fs3, ft0
                  fsgnjx.s     fa2, fs4, ft3
                  divu         a4, a2, t0
                  mulhu        a1, t0, t4
                  srai         s0, a4, 7
                  fcvt.w.s     t3, fs1, rtz
                  sra          s0, a6, s1
                  xori         s5, t5, 1690
                  sltiu        t0, a4, 444
                  sltiu        s7, ra, 959
                  fcvt.w.s     a2, ft8, rup
                  and          ra, s5, s1
                  sltiu        s1, ra, 958
                  addi         a1, s5, -941
                  nop
                  ori          a3, a0, -1576
                  nop
                  slti         sp, s7, 1572
                  fmv.x.w      t2, fs2
                  flt.s        s10, ft3, fs7
                  fmin.s       fa1, ft2, ft3
                  fmv.w.x      fa1, t6
                  fsgnjx.s     ft11, fs1, fa2
                  add          s3, t5, t2
                  srai         s0, s6, 19
                  fmax.s       ft10, fs10, ft0
                  flt.s        ra, fa3, ft3
                  add          s9, t1, a4
                  ori          a3, t6, 658
                  fmul.s       fs8, fa7, fs0, rup
                  feq.s        t2, fs4, fa0
                  fmv.x.w      s5, ft3
                  remu         t2, t3, t4
                  sra          s6, gp, s11
                  addi         s5, s5, 753
                  sub          s1, zero, s8
                  xori         a1, s3, -1769
                  sra          t6, sp, s1
                  slti         s6, s3, -1626
                  slti         a4, tp, 994
                  andi         t3, s6, -421
                  sltiu        a3, s6, 1525
                  xori         t3, t6, 1638
                  mulh         a3, a0, a0
                  and          a7, t1, s10
                  sltu         ra, sp, t2
                  fcvt.w.s     t3, ft2, rup
                  fclass.s     a2, fa2
                  div          s11, a2, s8
                  slti         gp, s3, 92
                  fmv.w.x      fs0, s5
                  mulhu        s6, t6, s9
                  fsgnjx.s     fs6, ft9, fa2
                  mulh         s2, t3, a1
                  fmin.s       fs6, fa2, fs0
                  slt          a7, s2, s3
                  fcvt.s.w     ft2, s8
                  xor          s2, sp, s5
                  srli         s10, gp, 3
                  sltu         s8, sp, t0
                  fmv.x.w      t3, ft11
                  fmul.s       ft1, fs0, ft4
                  mulh         a1, t4, t6
                  flt.s        s5, fa3, fs7
                  fsgnjx.s     fs7, fs4, ft1
                  fle.s        s3, fs7, ft1
                  mulh         s1, t4, t2
                  slti         t4, s8, -759
                  fcvt.s.w     ft6, t3
                  and          a1, t1, s10
                  slti         s2, t2, -542
                  auipc        t3, 995180
                  fcvt.wu.s    s5, fa5
                  sltu         t0, a4, s11
                  sltu         sp, sp, a7
                  and          s5, s6, s6
                  mul          s3, s1, a6
                  or           t2, t3, s3
                  andi         s7, a6, -280
                  fclass.s     s5, fs2
                  fle.s        a3, ft7, fs6
                  fsgnj.s      ft10, fs11, ft8
                  andi         zero, t4, 1198
                  fclass.s     a2, ft1
                  div          t3, t2, s5
                  div          sp, s11, a4
                  remu         ra, a6, t2
                  rem          t4, a4, a7
                  lui          s10, 11318
                  mulh         a4, s1, a7
                  or           sp, s7, sp
                  sra          t3, a7, t1
                  fsub.s       fa1, ft3, ft2, rup
                  addi         a0, a5, 54
                  fdiv.s       ft2, fa0, ft7, rne
                  fmax.s       ft11, fs2, fs1
                  xori         t1, a6, 1092
                  auipc        s0, 271202
                  sltu         s9, s1, s7
                  slli         t3, t4, 6
                  flt.s        gp, ft5, fa5
                  fmv.x.w      a0, fa2
                  fdiv.s       fs6, fa1, fa4, rmm
                  srai         a4, zero, 7
                  fsub.s       fs4, fs10, fs6
                  mul          s1, t4, t1
                  fmax.s       fs2, ft0, fa7
                  and          ra, s0, s6
                  and          s2, s2, tp
                  sub          s11, s10, s1
                  sll          s7, s2, a1
                  ori          gp, a0, -785
                  slt          s3, t4, t6
                  srl          a7, t0, s6
                  fsub.s       fs1, ft10, fa4
                  sltu         zero, s6, s10
                  sll          s4, a2, s9
                  fsgnjn.s     fs2, fs1, ft0
                  ori          ra, t1, -1233
                  fcvt.s.w     fs1, s0, rmm
                  fsgnj.s      fs5, fs1, ft0
                  slt          sp, t0, sp
                  srl          a4, s0, a7
                  add          s1, a3, s1
                  sll          s4, a6, a5
                  add          zero, s4, s4
                  fdiv.s       fa3, fa7, fa1
                  remu         s4, a0, s8
                  mulh         t2, s8, t4
                  xori         sp, s6, -742
                  mul          a6, a1, a0
                  andi         a0, t1, -691
                  sub          a6, zero, s8
                  or           s8, t4, s3
                  auipc        a6, 194589
                  fsgnj.s      ft8, fa1, ft10
                  or           s2, a2, a6
                  auipc        a3, 261437
                  fmul.s       fs1, fs4, fs4
                  slli         zero, s8, 4
                  fsgnj.s      fa7, ft2, fa3
                  fadd.s       ft6, ft11, fa4
                  fsgnjx.s     ft2, ft8, ft10
                  mulh         a6, s10, a7
                  fle.s        ra, fs8, ft8
                  fsgnj.s      fa5, fa4, fs2
                  and          t3, s4, s11
                  mulh         ra, s4, s6
                  flt.s        s1, fa6, ft11
                  fclass.s     s6, ft0
                  sub          s1, t5, t0
                  fcvt.w.s     s3, fs2, rup
                  mul          t6, s4, s6
                  fsqrt.s      fa2, ft7
                  mulhsu       a3, s0, a2
                  xori         s2, a3, -1166
                  sub          a4, t6, ra
                  mulhsu       s2, s2, s9
                  flt.s        s1, ft3, fa5
                  slti         a1, a4, -1116
                  srli         s6, a5, 30
                  sltiu        s2, s7, 1889
                  mulhu        a1, zero, t2
                  add          s3, s0, a4
                  fle.s        s8, ft6, fa5
                  rem          ra, s0, s11
                  sra          s8, t5, s0
                  xori         ra, s4, 507
                  mulhu        s0, t3, a2
                  nop
                  fcvt.s.wu    fs4, a0
                  xori         s0, s1, -601
                  fmv.w.x      ft1, t1
                  srl          ra, t6, s9
                  fcvt.s.w     ft8, s2
                  sra          s0, t3, t4
                  add          t4, a4, s8
                  sra          a3, s5, a2
                  srli         t6, ra, 30
                  slli         t4, ra, 9
                  fmin.s       fs5, fa4, fs6
                  nop
                  addi         s5, t5, -1626
                  fcvt.wu.s    t4, fs9, rdn
                  fadd.s       fa2, fa1, ft9
                  rem          t6, gp, s11
                  fmul.s       ft9, fs11, fs0, rne
                  sra          ra, a5, s0
                  ori          s11, a0, -1447
                  nop
                  fmax.s       fa1, ft0, fs2
                  remu         a2, s1, t6
                  fsgnjx.s     ft0, fs10, ft4
                  fclass.s     t3, fs6
                  fmax.s       ft8, fs1, fa7
                  fmv.x.w      s2, ft3
                  remu         s9, s9, a5
                  sltu         s9, t5, t0
                  slti         zero, a4, 1704
                  fmv.w.x      ft6, s2
                  and          s6, t6, a0
                  flt.s        ra, ft9, ft5
                  sra          s5, s7, s11
                  auipc        s1, 790040
                  or           s1, a6, t0
                  srli         s1, a6, 11
                  srli         s11, sp, 11
                  fcvt.w.s     s4, fa6, rmm
                  fclass.s     t1, fa1
                  add          ra, s0, s11
                  or           s2, t4, t5
                  ori          t1, tp, -463
                  andi         s8, ra, 953
                  flt.s        a7, ft3, fs0
                  sra          t2, s2, s3
                  fmv.x.w      sp, fa2
                  fdiv.s       ft2, ft7, fa5, rtz
                  fcvt.w.s     s3, ft11
                  and          s4, zero, t6
                  fmv.w.x      ft8, t5
                  fmv.w.x      ft1, a7
                  lui          s4, 359714
                  sltiu        zero, a7, 455
                  fcvt.wu.s    a1, fs11, rne
                  feq.s        s6, ft4, fs6
                  mul          ra, tp, a0
                  and          a7, s11, t0
                  fmv.x.w      zero, fs6
                  srli         t6, sp, 3
                  fcvt.wu.s    s11, ft4
                  fadd.s       ft5, ft1, fs7, rmm
                  srli         t6, t0, 17
                  slt          a4, tp, a4
                  xor          t3, a1, s1
                  fcvt.w.s     s11, fs6, rdn
                  xor          s7, a7, t3
                  div          t1, s7, t2
                  fsqrt.s      fa2, fs2
                  fmin.s       ft1, fs8, fs0
                  fsgnjn.s     fs1, ft1, fa5
                  srl          a1, s4, s2
                  andi         ra, t4, -1879
                  fmv.x.w      a2, fa1
                  fsgnjn.s     fs5, fs9, ft1
                  fmin.s       ft4, fs4, ft10
                  slli         s4, a0, 24
                  ori          gp, a3, -308
                  fsgnjx.s     ft4, fa3, fa4
                  mulhsu       a6, t4, s5
                  fcvt.s.wu    fa4, t2, rmm
                  auipc        a2, 239943
                  rem          s4, s4, s7
                  mulh         a0, sp, a2
                  sltiu        gp, s6, -1336
                  sub          t0, s5, s7
                  mulhu        a4, s2, t2
                  fmv.x.w      s1, fs0
                  sltiu        s5, t5, -1765
                  fsgnjx.s     fs5, fa1, fa6
                  fdiv.s       fa3, fa1, ft6
                  fmv.w.x      fs3, ra
                  add          s0, t0, t4
                  sll          sp, s4, t6
                  fclass.s     s3, ft8
                  lui          a3, 139342
                  fadd.s       fa7, ft6, fs5
                  slti         s4, s4, 875
                  add          s11, s4, s0
                  slli         s0, s8, 20
                  fmv.w.x      fa1, s1
                  rem          s4, t0, t6
                  lui          t6, 780213
                  srli         s0, s7, 27
                  fadd.s       ft0, fs9, fs10, rmm
                  fmin.s       fs11, ft0, fs5
                  sltu         s1, a5, a4
                  fclass.s     s6, ft9
                  sltu         s3, s8, a5
                  srli         s10, t0, 25
                  sra          t3, s2, s10
                  mulhsu       s0, t4, s4
                  fsgnjn.s     ft0, ft4, fs4
                  fdiv.s       fa6, ft2, fs3, rdn
                  slti         s5, t3, -610
                  fdiv.s       fa3, fs5, ft9, rne
                  remu         s10, s6, s3
                  fmv.w.x      fs4, ra
                  mulhu        gp, t4, a3
                  andi         t3, s5, 1943
                  rem          s7, a7, s3
                  div          ra, s6, a2
                  fle.s        t1, fs1, ft11
                  fmax.s       ft8, ft6, fa0
                  fmax.s       fs6, fa7, ft0
                  slt          s6, s1, a2
                  fadd.s       fa1, fs2, ft2, rtz
                  remu         s4, sp, zero
                  xori         t2, s1, 662
                  fdiv.s       fa1, fs4, ft8
                  lui          t1, 613314
                  addi         s2, sp, -544
                  fsgnj.s      ft11, fs1, fa1
                  ori          s3, s0, -681
                  xor          s6, s6, a5
                  srai         t3, s11, 0
                  ori          s2, s1, -149
                  fmul.s       fa5, ft8, ft3
                  fsgnjx.s     fa4, ft8, fa2
                  sra          t2, s0, t4
                  slli         a2, s1, 24
                  xori         a0, s10, -97
                  flt.s        s9, ft2, fa1
                  xor          s3, gp, s3
                  auipc        s2, 29313
                  fcvt.wu.s    a0, ft6
                  sub          a7, a0, s7
                  divu         t3, t0, t4
                  mulhu        ra, t1, gp
                  mul          zero, t4, t1
                  fcvt.s.wu    ft7, t0
                  fle.s        ra, fs8, fs10
                  div          zero, gp, a3
                  fmax.s       ft1, ft4, fa4
                  fmin.s       ft1, ft10, ft8
                  xori         a7, t2, 438
                  mulhsu       s6, a4, t6
                  fmul.s       ft10, ft1, fs7, rtz
                  fsqrt.s      ft8, fa0, rdn
                  fsgnj.s      fs6, ft1, ft2
                  ori          s4, t1, 725
                  fadd.s       ft0, ft11, fa1
                  fsqrt.s      fs5, ft8
                  lui          s4, 660643
                  fcvt.s.w     ft11, a4, rne
                  and          s7, s7, gp
                  slli         s4, s6, 15
                  mul          t3, a4, s7
                  mulhu        t4, s1, a4
                  fdiv.s       ft9, fs8, ft5
                  mulhu        a7, t5, zero
                  fmax.s       fa0, ft2, fa3
                  xor          s7, s3, s5
                  fcvt.s.w     ft5, s3, rmm
                  srl          t6, a7, s5
                  fadd.s       fs9, ft10, ft3, rup
                  rem          s0, a1, ra
                  fcvt.w.s     s11, fs5
                  rem          s10, a7, a3
                  sub          s11, t0, a7
                  mul          a3, s2, sp
                  divu         a1, a6, a4
                  fmax.s       fa5, fa5, fs7
                  mulh         a7, t1, tp
                  sra          a1, s10, a3
                  divu         t4, a1, s4
                  xori         t2, s5, -89
                  auipc        a7, 1000889
                  fle.s        t4, fa1, ft7
                  divu         t2, sp, a1
                  fle.s        s3, fa5, fa5
                  mulhu        t4, t0, s1
                  mul          s11, t3, s8
                  fmax.s       fs4, fa5, fs1
                  xor          a4, a4, t1
                  flt.s        t0, ft7, fs10
                  sll          s2, s7, s10
                  fmax.s       ft0, fs8, fa4
                  fmax.s       fs3, fa6, fs6
                  slti         s4, s2, 431
                  fcvt.s.w     ft4, t4
                  sra          gp, t0, s8
                  divu         s6, t6, a7
                  fcvt.wu.s    t3, fa6
                  nop
                  ori          s4, s6, -663
                  mulhsu       t1, a2, t0
                  srai         a6, s1, 10
                  ori          s0, a2, 1314
                  fcvt.s.wu    fa6, s9
                  fmin.s       fa2, fs5, fs8
                  addi         s0, a5, -41
                  fmv.w.x      ft10, sp
                  fclass.s     t3, fs2
                  nop
                  div          sp, s0, t0
                  flt.s        s3, fs2, ft1
                  slti         a2, s9, 680
                  fmv.w.x      ft2, s2
                  srai         t1, sp, 19
                  andi         t6, a0, 891
                  fsgnjx.s     fa0, fa7, ft2
                  srai         s10, s3, 6
                  fle.s        t2, fa2, ft11
                  lui          s10, 961513
                  fmv.w.x      fa2, s1
                  sltu         t2, t0, tp
                  sll          a1, s4, sp
                  fle.s        t4, ft2, ft0
                  fmul.s       fa6, ft4, ft3, rup
                  srai         t3, s4, 28
                  lui          t2, 1047924
                  nop
                  fsgnjx.s     fs8, fs11, fs4
                  fsgnj.s      fs4, fs3, fs3
                  addi         a3, s8, -1240
                  sll          a7, s9, gp
                  fmv.x.w      t6, fs11
                  feq.s        s3, fs5, fs7
                  fclass.s     s9, fs11
                  flt.s        t1, fa2, ft11
                  slli         s8, s1, 20
                  fsgnj.s      ft10, fs3, fs10
                  fmax.s       ft3, fa4, ft6
                  fcvt.wu.s    a1, ft11
                  fcvt.s.wu    ft1, gp, rmm
                  fsgnj.s      fs6, ft0, fs11
                  fdiv.s       fs11, fa3, fa7, rmm
                  fsgnj.s      fa0, ft5, ft7
                  sra          a4, t0, a3
                  and          t1, t3, s3
                  auipc        t4, 1044412
                  divu         s7, s7, s6
                  fmul.s       fa1, fs10, fa6
                  fmv.w.x      fa5, s1
                  fsub.s       ft0, ft1, fs6, rtz
                  fadd.s       fa4, ft9, fs10, rmm
                  fsqrt.s      fs5, fs10
                  mulh         s4, s11, t4
                  sltu         s7, s6, s9
                  divu         s8, sp, t4
                  mul          t0, a6, t1
                  sll          s0, s3, a2
                  fmul.s       fs5, fs9, fs0
                  auipc        a6, 579287
                  mulhu        s6, t5, s8
                  fmul.s       fs0, ft1, fa4
                  mul          s8, s0, s9
                  feq.s        s9, fs2, fs4
                  fcvt.s.wu    ft1, a1, rmm
                  and          a3, a5, s5
                  xor          gp, a7, gp
                  remu         t2, t3, s8
                  fcvt.s.wu    fa2, zero, rdn
                  feq.s        gp, ft1, fa0
                  feq.s        gp, ft11, fa4
                  fsqrt.s      fs11, ft7, rmm
                  fle.s        t6, fa3, ft11
                  slt          zero, tp, a0
                  fcvt.s.wu    fs4, t1, rup
                  fmv.w.x      fs5, s6
                  slti         t3, t0, -1978
                  fdiv.s       fa4, fa2, ft6
                  fdiv.s       ft10, fs7, fs7, rmm
                  slli         t0, t2, 19
                  fle.s        t3, ft11, fa6
                  xori         s6, s8, 281
                  sub          t6, a0, t2
                  sltu         s7, t6, s2
                  sltu         a1, a3, s8
                  xor          t1, s9, s0
                  add          s5, t6, tp
                  addi         s8, s4, -1033
                  slt          ra, sp, s7
                  fcvt.w.s     s7, fs10, rmm
                  rem          a6, s10, s7
                  mulhsu       s1, t2, ra
                  fcvt.wu.s    s6, fa6, rup
                  and          a2, s8, s3
                  sltiu        s11, t0, 960
                  mulhsu       s11, t1, a0
                  slt          a6, zero, s5
                  fsgnj.s      ft11, fa0, fa3
                  fsub.s       fs6, ft11, ft4, rmm
                  or           t3, a7, s11
                  srl          ra, a5, s11
                  srli         t3, t3, 6
                  fsqrt.s      fs9, fa5, rup
                  fsgnjn.s     ft3, fs5, fs4
                  sll          a3, gp, s0
                  srai         a4, a4, 2
                  mulhu        s1, t1, s0
                  fsgnjn.s     fs11, fa5, ft0
                  div          ra, s9, s8
                  slli         gp, a3, 24
                  fle.s        a6, ft4, fa3
                  mul          a6, a4, a3
                  flt.s        a7, ft9, ft5
                  fmv.w.x      fa7, t3
                  lui          t1, 227847
                  flt.s        a1, fa6, fs2
                  srli         a3, t5, 4
                  fcvt.s.w     ft2, t2
                  xori         zero, s7, -410
                  xor          t2, tp, a6
                  ori          s11, s7, -148
                  andi         s11, s5, -793
                  fcvt.s.w     fs11, tp
                  nop
                  sra          a7, ra, tp
                  xor          t4, t2, s8
                  nop
                  slt          a2, s10, s6
                  fmul.s       fs11, fs8, fs9, rmm
                  feq.s        gp, ft2, ft9
                  lui          s7, 996679
                  slt          gp, t3, t6
                  fmv.w.x      fs4, s7
                  fmv.w.x      ft4, s4
                  ori          sp, a4, -1610
                  srai         s5, s2, 4
                  feq.s        s0, ft2, fs5
                  slt          s11, s2, tp
                  remu         s0, zero, zero
                  or           ra, a0, a3
                  add          s10, zero, t3
                  fle.s        s7, ft1, ft7
                  xor          a3, a1, t5
                  fmul.s       fa1, fa0, fs5, rne
                  sub          s11, gp, t0
                  fcvt.s.w     fs9, a2, rne
                  fsqrt.s      fs8, fa1, rtz
                  fsgnj.s      fs9, fs9, fs9
                  slti         a0, s8, 1101
                  fle.s        a3, ft9, ft5
                  fmv.w.x      ft3, t5
                  fmax.s       fs8, ft3, ft4
                  slli         a6, a2, 26
                  sltu         s7, t0, s3
                  addi         a2, t0, 1966
                  fmin.s       fs9, fs7, ft4
                  or           s0, s1, zero
                  fsgnj.s      ft2, fs4, fs7
                  srai         s1, a5, 25
                  mul          s6, s9, t6
                  fadd.s       fa6, fs7, fs7
                  srai         s8, a2, 7
                  fsgnjn.s     fa1, fs6, ft4
                  feq.s        s9, fs9, ft11
                  fmul.s       ft9, fs10, fa0
                  divu         a0, a4, s8
                  auipc        s11, 602584
                  sltu         sp, t4, s2
                  add          t6, s11, zero
                  fsub.s       ft9, ft6, fa6, rtz
                  lui          t6, 874672
                  fsub.s       fa2, fa1, ft5
                  sub          a3, ra, sp
                  nop
                  slt          zero, s10, t1
                  addi         gp, t3, -860
                  mulhsu       s4, s0, s3
                  rem          t4, s9, s2
                  sra          a4, s6, s3
                  fmul.s       fs5, ft10, fs5, rne
                  fle.s        s8, ft0, fs7
                  nop
                  sltiu        s10, tp, -736
                  auipc        s3, 214433
                  div          s7, s0, a5
                  fadd.s       fa0, fs10, fs8, rmm
                  fmax.s       ft0, fa0, ft5
                  fcvt.s.w     ft7, s11
                  xor          zero, a1, a3
                  srl          s6, t5, a5
                  fcvt.s.wu    fa4, s11
                  slli         zero, s3, 20
                  fcvt.w.s     zero, fa6, rtz
                  fcvt.wu.s    sp, ft2, rtz
                  xor          s10, a6, s3
                  fcvt.w.s     s2, ft5, rup
                  fsqrt.s      fs7, fs6
                  div          a1, s3, t0
                  fsgnjx.s     fa4, fs10, fs0
                  fle.s        s7, ft9, ft9
                  mulh         t3, tp, sp
                  fle.s        s6, fa1, ft8
                  sltu         s4, a0, s4
                  fsub.s       ft11, fs11, fa7
                  fsgnjx.s     fa4, fs3, fs4
                  fmul.s       ft4, ft0, fa7
                  srl          a3, s3, a3
                  sltiu        a6, s9, -565
                  fsgnjn.s     ft6, fs2, ft6
                  mulh         a7, s8, tp
                  auipc        s3, 714685
                  slli         t2, s9, 27
                  fcvt.wu.s    a1, fs9, rmm
                  andi         a6, t1, 1308
                  flt.s        a7, ft11, ft5
                  fcvt.wu.s    sp, fa2
                  slti         t1, gp, -763
                  fsgnj.s      ft4, ft10, ft2
                  nop
                  sra          s4, s8, s2
                  nop
                  divu         s5, s11, t5
                  fsub.s       fs6, fa7, fa5, rmm
                  remu         t4, s11, s5
                  fmv.x.w      s7, ft10
                  nop
                  fsub.s       ft4, ft3, fs3
                  and          gp, t6, s8
                  fmax.s       fs6, fs9, fs8
                  div          s9, t4, a6
                  or           t3, t4, s9
                  fsqrt.s      ft10, fs11, rdn
                  flt.s        s6, fa5, fs6
                  fle.s        s9, ft10, ft11
                  divu         s6, tp, zero
                  xori         a2, s8, -1879
                  slt          a6, s9, ra
                  fdiv.s       fa4, fs8, fa6
                  or           s6, a0, s4
                  ori          s7, s7, 1822
                  feq.s        a4, ft9, ft4
                  fmul.s       fs3, ft3, fa7
                  remu         a6, a2, s9
                  divu         s0, t3, t1
                  fmv.w.x      fs1, s7
                  mulhu        t6, a3, t4
                  mulhu        t4, t3, t3
                  slt          t2, a7, s0
                  fsgnjn.s     fs10, ft9, ft2
                  rem          t4, s3, s4
                  add          gp, sp, a1
                  fsgnjn.s     fs0, ft0, fa1
                  fsgnjx.s     ft0, fa3, ft10
                  mul          s2, t3, s5
                  slli         zero, t0, 21
                  fdiv.s       ft0, fa3, fs3, rmm
                  fdiv.s       fs0, fs11, fs8
                  mul          t2, s7, t2
                  fsub.s       fs8, ft6, ft3, rup
                  fdiv.s       fa7, fa0, ft5
                  mulhsu       sp, a4, t1
                  fclass.s     t2, ft7
                  fdiv.s       ft9, ft10, ft9, rup
                  rem          a1, t0, ra
                  auipc        s10, 688044
                  add          gp, a4, s0
                  flt.s        s4, fs0, fs2
                  slt          s4, t2, s0
                  ori          s6, s10, -1699
                  fmin.s       ft8, ft9, fa4
                  mul          a4, gp, a2
                  fclass.s     a6, fs9
                  andi         s2, s9, -1434
                  fcvt.wu.s    s5, fs2
                  srl          a2, s7, gp
                  ori          s5, gp, -1410
                  srl          a3, t5, a4
                  fsub.s       fa1, fa7, fa6
                  fsub.s       ft3, ft4, fs0, rne
                  srli         t3, t0, 21
                  or           s10, s2, t6
                  fcvt.wu.s    sp, fa3, rdn
                  fcvt.w.s     s3, ft5
                  fmv.x.w      s0, fs4
                  and          t4, s0, s1
                  and          a1, t0, s5
                  nop
                  fadd.s       fs7, ft4, fa2, rtz
                  mulhu        s0, a1, a6
                  lui          s9, 413070
                  sltu         s2, a7, s2
                  xori         t3, t1, -23
                  fsgnjx.s     fa0, fs3, fs6
                  mul          a2, t5, a6
                  nop
                  fdiv.s       ft4, fa2, fs10
                  xor          s9, s0, a6
                  add          a4, t1, s4
                  fsgnjx.s     fs10, ft11, fs1
                  fcvt.w.s     s3, fa3, rup
                  sub          a0, s5, a1
                  ori          s7, gp, -1947
                  fmv.w.x      fs2, a5
                  xori         t2, a4, 1096
                  fdiv.s       fs11, fa0, fs7, rdn
                  mulhsu       a7, t3, a7
                  fclass.s     s6, fa0
                  addi         s0, s2, -1440
                  fadd.s       fs8, fa4, fs3, rne
                  fcvt.s.wu    fs4, t1
                  fsgnjn.s     fs7, ft8, ft8
                  fmul.s       ft3, fa5, ft6
                  fsgnjn.s     fa0, ft5, fa4
                  sltu         gp, zero, t3
                  fdiv.s       fs6, fs2, ft5, rup
                  fsub.s       ft6, ft10, fa2
                  addi         sp, gp, 2020
                  and          s4, gp, a2
                  fsgnjn.s     fa7, fs9, fs2
                  sll          sp, s4, tp
                  or           a0, a5, zero
                  and          a7, t4, s2
                  divu         s3, gp, a6
                  srai         gp, sp, 7
                  feq.s        t1, ft3, ft3
                  sub          s0, a5, a0
                  or           a6, a7, s2
                  fcvt.wu.s    a3, ft0, rmm
                  auipc        s0, 278758
                  sltu         s3, s0, s2
                  sltiu        s2, t4, -1516
                  divu         t4, s3, s8
                  fsqrt.s      fs4, fs1
                  slli         t0, t2, 4
                  remu         t6, s1, t3
                  srai         sp, s11, 7
                  fmax.s       fa7, fs9, fa3
                  srl          s11, s6, s1
                  feq.s        zero, fa3, fa1
                  fsub.s       fa5, ft0, fs3, rup
                  xori         s10, a6, 1059
                  fsgnj.s      fa0, ft10, ft6
                  fmv.w.x      fs11, s0
                  div          a6, s3, s8
                  slti         gp, a7, -1696
                  fsqrt.s      fa6, fs3, rmm
                  flt.s        ra, ft3, ft8
                  fclass.s     s9, fa4
                  mulhsu       s1, t4, s9
                  div          s0, sp, a4
                  sltiu        t1, t5, -110
                  fmin.s       fa3, ft0, ft6
                  ori          a4, t1, 1849
                  xor          s3, s9, s6
                  add          t3, t0, a1
                  flt.s        s8, fa0, fa3
                  sub          a0, ra, s3
                  flt.s        a2, ft11, fs0
                  fmv.x.w      s5, ft9
                  slti         a1, a7, 1702
                  addi         s6, s3, -875
                  fsgnjx.s     fa0, fs3, fa5
                  fdiv.s       fs0, ft6, fa6
                  addi         s4, zero, -1170
                  srai         a4, a2, 10
                  fsgnjx.s     fs1, fs0, fs6
                  lui          a1, 730447
                  feq.s        sp, fa3, ft6
                  fcvt.s.w     ft10, t4
                  srli         s6, s10, 4
                  sra          a0, s1, t5
                  sub          s2, gp, t5
                  sltiu        t4, s11, -1412
                  ori          t2, s3, 1832
                  auipc        gp, 465912
                  lui          s8, 750126
                  addi         a4, s11, -1115
                  mulhsu       t4, s6, t6
                  mulh         a4, a1, t0
                  fmv.w.x      fa3, s9
                  sub          t2, s8, a5
                  fadd.s       ft11, ft5, ft0, rtz
                  srli         a1, s2, 28
                  lui          t4, 643860
                  auipc        t6, 1042689
                  divu         a1, t5, t6
                  or           a0, t2, s1
                  fcvt.s.w     fa7, s11, rtz
                  fmin.s       fs1, ft10, ft6
                  mulhu        t0, gp, s7
                  auipc        ra, 689646
                  fcvt.wu.s    a2, ft4, rup
                  fmin.s       ft11, fs8, fs9
                  fmax.s       fs1, fs10, ft8
                  fsqrt.s      ft6, fs9
                  srli         a0, s1, 28
                  fmax.s       fs0, ft11, ft11
                  lui          s3, 977586
                  sra          zero, s10, s1
                  fsgnjn.s     fs2, ft1, fa6
                  fcvt.s.w     fs7, s2
                  fmv.x.w      s9, ft3
                  fsgnj.s      fa3, ft6, ft4
                  sll          a0, a2, s9
                  srl          a3, zero, ra
                  andi         a0, a7, 1053
                  feq.s        s3, fs9, ft5
                  sub          zero, a3, tp
                  xori         a6, t1, -1468
                  and          s8, a7, a5
                  fmv.x.w      s2, fa0
                  srli         t1, t0, 9
                  or           s4, ra, ra
                  xor          s7, a6, s5
                  sll          s0, s2, t3
                  mulhu        s4, a1, a6
                  feq.s        s10, ft7, fa0
                  fsgnj.s      fs1, ft7, fs8
                  ori          s0, t3, -663
                  mul          s9, s8, s3
                  fsub.s       fs4, fs2, ft3, rtz
                  nop
                  srl          s1, gp, s3
                  lui          s10, 654913
                  fmax.s       ft6, fa7, fs2
                  fsqrt.s      fs2, fs6
                  fdiv.s       ft9, fa2, fa0
                  fsub.s       fa2, ft8, fs8
                  fmv.x.w      t0, ft9
                  fsgnjn.s     fa5, ft3, ft2
                  flt.s        zero, ft4, fa0
                  srl          s5, s9, s3
                  fcvt.s.wu    fs7, a5, rmm
                  remu         a7, s6, s6
                  fmin.s       fs1, fs8, fs9
                  srl          t0, a3, zero
                  sll          s8, s2, s10
                  auipc        zero, 957774
                  fcvt.s.w     fs1, s5
                  divu         t2, t1, s8
                  or           s7, t1, s8
                  mulh         s7, a7, s6
                  divu         s2, a5, s10
                  div          s6, t4, t6
                  ori          s0, a2, -1034
                  ori          s6, s1, 1292
                  fcvt.s.w     ft1, s7
                  sra          s11, a0, tp
                  div          t2, s3, s6
                  add          s4, a3, a1
                  feq.s        s4, ft6, fs6
                  mulhu        s5, zero, a6
                  xori         s8, tp, -656
                  fle.s        gp, ft3, fa5
                  fsub.s       fs9, fa2, ft7
                  flt.s        s1, fs11, fs6
                  fcvt.wu.s    s1, ft6, rdn
                  feq.s        s4, fs6, fa5
                  fmv.w.x      ft7, s2
                  and          gp, s6, t1
                  fcvt.s.wu    ft11, zero, rne
                  xor          a1, t1, a1
                  lui          a1, 407992
                  slli         t1, a5, 13
                  fadd.s       fs5, ft11, ft11
                  fsgnjn.s     fa2, ft11, fs2
                  add          s8, t5, a2
                  fcvt.s.w     fs5, s5, rtz
                  sll          t4, s4, t1
                  fcvt.wu.s    s8, fa6
                  mul          t4, tp, s5
                  sra          s8, gp, s0
                  feq.s        s3, ft0, ft9
                  slt          t2, s3, t0
                  nop
                  slti         t4, a7, 94
                  fcvt.s.w     ft4, s5, rup
                  fadd.s       fs0, fs9, fa1, rdn
                  mul          s0, s11, a4
                  lui          sp, 621715
                  fcvt.s.wu    ft0, s7, rmm
                  sub          sp, a7, a3
                  fadd.s       fs11, fs9, ft7
                  and          s6, sp, a1
                  mulh         a2, t6, s4
                  fmax.s       fa5, fs0, ft11
                  addi         s7, t4, -897
                  fmin.s       fs6, ft4, ft9
                  lui          s11, 244738
                  sll          t4, a5, a1
                  fdiv.s       ft0, ft11, fs4, rne
                  xori         a2, sp, 1003
                  remu         a4, s8, s3
                  fcvt.s.w     fa2, t4, rmm
                  ori          s11, s7, -1256
                  mulh         t2, a3, ra
                  sra          t4, zero, t3
                  or           t6, gp, sp
                  fcvt.s.w     fa7, a6
                  fcvt.s.w     ft3, s6, rup
                  mul          gp, tp, s10
                  rem          a3, a0, a5
                  fsub.s       fa0, fs11, ft1
                  auipc        s3, 513262
                  sll          sp, gp, a0
                  sltiu        s8, tp, -773
                  fadd.s       ft11, ft5, fa0, rtz
                  slt          s2, t4, zero
                  fadd.s       ft2, fs11, fs8, rmm
                  ori          s8, sp, 899
                  fsqrt.s      fs11, fa2, rne
                  fadd.s       fa7, fs0, fa1
                  lui          zero, 658031
                  fsgnj.s      fa7, fs0, fs4
                  fdiv.s       fs10, fs2, ft6, rup
                  mul          sp, t3, s1
                  srli         t4, s0, 25
                  remu         s5, gp, s3
                  mulh         a1, s11, s8
                  remu         s5, t2, a6
                  lui          s0, 119393
                  fcvt.wu.s    sp, fs2, rtz
                  divu         a2, a2, sp
                  ori          t1, s8, -349
                  remu         ra, t6, a5
                  mulhu        t4, a7, s4
                  fcvt.s.wu    fs0, sp, rmm
                  and          zero, ra, t3
                  sll          s10, s4, s1
                  fcvt.w.s     s6, fs11
                  andi         a6, s4, -817
                  fmax.s       fs6, fa3, fa5
                  remu         t3, s4, s7
                  fsgnj.s      fa6, fa6, ft9
                  sra          sp, a1, t2
                  fmv.w.x      fa4, t5
                  xor          a3, s11, ra
                  xor          t3, a0, t4
                  fmv.x.w      s5, ft8
                  fsgnj.s      fa3, ft9, fa5
                  addi         s8, s6, 2037
                  fmv.w.x      fs0, sp
                  addi         s8, s3, 436
                  flt.s        s5, ft5, ft11
                  add          s6, s8, gp
                  fmin.s       ft8, fs6, ft7
                  fsgnjx.s     fs6, fs2, fs1
                  div          s10, tp, ra
                  fsub.s       fa5, fs7, ft11
                  ori          sp, t0, -1962
                  fmin.s       fa5, fa2, fa2
                  fmin.s       ft6, fs4, fs2
                  fle.s        s8, fs8, fs6
                  mul          sp, s7, s8
                  andi         t6, s3, 1049
                  mulhsu       s3, ra, a3
                  fcvt.s.w     ft11, t3
                  fcvt.s.w     ft11, t1
                  fmv.x.w      a2, fa4
                  fmin.s       fs3, ft10, fa2
                  srai         s0, s9, 8
                  auipc        ra, 372824
                  fsub.s       fs6, fs11, ft9
                  fmin.s       fs6, ft6, fs3
                  fmul.s       fa4, ft6, fa7, rne
                  mulhu        t3, s10, s1
                  fsub.s       fa5, fa0, fs3
                  andi         t1, ra, -963
                  flt.s        zero, ft4, fa3
                  sltu         a2, tp, s5
                  fmin.s       ft10, fs0, fs1
                  fsgnjn.s     fs3, fs6, fa6
                  sra          s5, t4, a7
                  slti         ra, s0, 861
                  fcvt.w.s     s11, fs8, rdn
                  fcvt.wu.s    s11, fs6
                  lui          a6, 868172
                  andi         t6, a2, 1193
                  slti         a1, a1, -979
                  auipc        a3, 486711
                  feq.s        s2, fa6, fs11
                  and          t2, gp, t0
                  sra          s1, zero, s5
                  slli         a0, ra, 29
                  sra          a4, t4, t5
                  fcvt.w.s     gp, ft3
                  xori         a0, s6, 1907
                  lui          ra, 959780
                  fcvt.w.s     t2, fa2
                  sra          a3, a4, a5
                  sub          t2, s8, a5
                  sub          t1, s6, a7
                  flt.s        t0, ft11, fa7
                  slli         s11, s3, 26
                  fmv.x.w      a7, fs11
                  slt          s5, s10, a5
                  srl          a3, s3, tp
                  fclass.s     t1, fa3
                  fmin.s       ft8, fa1, fa7
                  fmul.s       ft1, fs8, ft5, rne
                  lui          gp, 7710
                  ori          ra, s5, 1937
                  fadd.s       fa3, fa2, ft7
                  fle.s        s0, ft11, ft11
                  fsgnjn.s     ft8, fs6, fs2
                  mulhu        t2, t2, a4
                  fmin.s       fa5, fa1, fs1
                  slli         s3, t4, 2
                  mulh         t4, s5, s10
                  slli         sp, gp, 0
                  xor          s0, a0, a0
                  fmax.s       fs5, fs2, fs10
                  sub          t3, s11, ra
                  fmul.s       fs5, ft5, fa1
                  fdiv.s       ft10, fs3, ft6, rmm
                  fmul.s       ft7, ft10, ft0
                  feq.s        t2, fs8, ft8
                  fmul.s       fs9, ft4, ft5
                  fsub.s       ft6, fs9, fa2
                  nop
                  fmv.x.w      t3, fs4
                  fsgnjn.s     fs0, ft8, ft4
                  fsqrt.s      fs9, fs1, rdn
                  fmul.s       fa1, fs5, fs11, rtz
                  fsqrt.s      ft0, ft9, rdn
                  fsqrt.s      ft2, fs4, rtz
                  xori         zero, s8, -364
                  fcvt.wu.s    s10, fs10, rmm
                  mulh         ra, t4, sp
                  xori         a2, s8, 319
                  fsgnjx.s     ft2, ft6, fs8
                  fmax.s       fa5, fs6, fs9
                  fcvt.wu.s    sp, ft6, rne
                  auipc        s7, 630637
                  fadd.s       fa5, fa5, ft2
                  andi         t4, t4, 1666
                  fle.s        zero, ft6, ft9
                  and          a7, t2, s5
                  mulh         s7, gp, a2
                  xor          s7, gp, a3
                  remu         t4, a5, s7
                  ori          zero, a0, 587
                  div          s3, s8, s11
                  sltu         s10, t0, s3
                  fcvt.s.wu    ft1, s3
                  slti         t4, tp, 1219
                  sltu         s0, s0, s5
                  fcvt.s.w     ft10, s2, rdn
                  sra          a1, s4, s3
                  mulhu        sp, t3, s4
                  flt.s        a2, ft11, fa3
                  fsub.s       fa7, fa6, fs2
                  fsqrt.s      fs6, ft9, rdn
                  fsqrt.s      ft7, fs8, rdn
                  ori          s1, zero, -1221
                  srai         s8, s7, 23
                  fsqrt.s      fs10, fa6, rtz
                  lui          a7, 136732
                  fmax.s       fs10, fs7, fa5
                  fcvt.wu.s    a3, fa1
                  fsqrt.s      ft1, ft10, rne
                  mulh         a1, s10, s8
                  mulhu        s0, t3, s11
                  slli         s6, s10, 26
                  sra          t4, tp, s7
                  lui          t2, 236861
                  fmin.s       ft4, fs10, ft7
                  sra          a0, a4, t0
                  fle.s        s7, ft2, fs10
                  auipc        t4, 627600
                  sub          a3, s9, s8
                  flt.s        s9, fs0, ft2
                  fcvt.s.wu    ft6, a0, rmm
                  remu         ra, s9, a1
                  or           t0, a4, t3
                  fsub.s       fs4, ft4, ft4
                  and          s6, s4, t1
                  srai         a3, t3, 25
                  flt.s        a1, fs7, ft9
                  sub          gp, a1, s7
                  div          s5, t6, gp
                  remu         s4, s5, a0
                  srai         s1, gp, 24
                  auipc        t6, 173116
                  fsgnjn.s     fs5, ft1, ft2
                  fsgnjn.s     fa3, fs0, fs6
                  sltiu        t4, t0, -568
                  fcvt.s.wu    fs6, a2
                  fsgnj.s      fs5, ft5, fa6
                  xori         t0, t3, 103
                  srai         s11, a7, 31
                  fmul.s       ft4, fa6, ft8, rne
                  fmul.s       ft10, fs3, fs4, rne
                  fmax.s       fs0, ft4, ft9
                  or           s11, tp, t2
                  fcvt.s.w     fs2, a2
                  sub          a7, t1, a7
                  srai         s11, t3, 3
                  nop
                  lui          s0, 118275
                  divu         a1, s10, zero
                  mulhsu       a2, t3, a6
                  auipc        a1, 326535
                  fsgnjn.s     ft2, ft3, fs2
                  xor          s11, a2, a7
                  and          t2, a5, a4
                  fmin.s       ft9, ft0, ft7
                  fsgnj.s      fa2, ft6, fs5
                  sub          s1, a0, a4
                  fdiv.s       ft8, ft7, ft11
                  slli         s1, t2, 31
                  xor          s4, s11, t2
                  and          t4, s11, t6
                  div          s1, a1, s9
                  srai         s6, s8, 6
                  remu         s5, a2, t4
                  lui          s2, 452099
                  andi         ra, gp, 574
                  or           a2, sp, s5
                  fmin.s       fa3, ft10, ft8
                  fsgnjn.s     ft8, fs1, fs7
                  or           zero, s6, s2
                  ori          s6, s4, 715
                  feq.s        a1, fa4, fa0
                  slti         s10, s5, -1059
                  sub          s9, t1, s9
                  fsgnjx.s     ft0, fs3, fa4
                  lui          s8, 857547
                  sltu         a2, a5, a3
                  andi         s5, s5, 274
                  srl          a0, t2, t4
                  feq.s        t2, fs0, ft8
                  or           gp, gp, s3
                  xor          s0, a0, t6
                  ori          s7, a2, 23
                  srai         s10, a5, 9
                  fmul.s       fs8, ft1, ft3
                  srai         a3, a0, 28
                  fadd.s       fs11, ft8, ft3, rne
                  addi         ra, a3, -740
                  and          a3, s8, ra
                  fclass.s     s7, fa6
                  fdiv.s       fs6, fa6, fs3, rdn
                  divu         s2, zero, s7
                  fclass.s     s5, fa4
                  andi         zero, t2, 541
                  sub          gp, t5, s4
                  div          a2, a1, a4
                  remu         s2, a7, s7
                  fcvt.s.wu    fs4, s1
                  auipc        a7, 284882
                  fcvt.s.w     fa5, s8
                  xori         a1, s0, -982
                  slt          s9, sp, s4
                  fdiv.s       ft7, fa2, ft7, rmm
                  and          a1, s7, s4
                  addi         a4, s9, 1658
                  fcvt.s.wu    ft5, s7, rtz
                  fsgnjx.s     fs3, fs5, fs4
                  xor          a3, a1, s4
                  slti         s2, t6, -563
                  addi         zero, tp, -1298
                  fclass.s     t1, fs3
                  fdiv.s       fa3, ft0, ft7
                  rem          s10, s2, a1
                  nop
                  ori          t2, s9, -946
                  fsqrt.s      fs3, ft11, rup
                  fcvt.w.s     gp, fa1
                  sltiu        s3, s4, -608
                  mulhsu       s3, a4, s11
                  fclass.s     s10, fs11
                  rem          s8, zero, t6
                  add          ra, ra, s1
                  fsub.s       ft8, ft7, fa1
                  and          s8, tp, a7
                  add          a7, a3, s11
                  remu         s4, t5, t5
                  div          s0, tp, a2
                  slt          a3, t1, s11
                  slti         gp, a0, 1563
                  fsqrt.s      fa6, ft2
                  lui          a7, 804124
                  mulh         s1, s2, s4
                  lui          t0, 967487
                  sub          s8, a6, t6
                  fle.s        s5, ft6, ft1
                  sltiu        s5, a1, 974
                  fadd.s       fs2, ft11, fs4
                  srai         s11, a7, 20
                  fmin.s       fa5, fs6, ft1
                  fclass.s     zero, fa7
                  fsgnjx.s     ft4, fa5, ft1
                  slti         s7, s11, 1202
                  sltiu        t4, zero, 1831
                  sub          s2, ra, s2
                  sltu         t4, ra, s7
                  fmax.s       ft7, ft2, fa2
                  srai         gp, t3, 21
                  or           t0, s10, gp
                  fcvt.w.s     t6, fs7
                  fcvt.w.s     zero, fa1
                  srl          a0, sp, s11
                  srai         sp, gp, 9
                  ori          t1, a5, -1427
                  slli         a0, t5, 10
                  srli         t6, s4, 19
                  nop
                  fdiv.s       fs9, ft11, fs11
                  remu         a0, a5, s9
                  ori          t4, a2, 1192
                  fmin.s       fs0, fs4, fs4
                  ori          s6, a3, 1280
                  fadd.s       fs3, fs5, fa1
                  lui          ra, 729424
                  feq.s        a6, ft0, ft2
                  srli         a6, t5, 29
                  fcvt.s.w     fa6, s0
                  slt          gp, sp, zero
                  fmul.s       ft7, fs4, ft8
                  fle.s        s6, fa1, fa1
                  fsqrt.s      ft1, fs11, rmm
                  fadd.s       fa7, ft8, fa5, rtz
                  feq.s        ra, fs0, ft10
                  lui          a0, 182087
                  fmv.x.w      t4, ft8
                  fsqrt.s      fa7, fa5, rne
                  sltu         s7, ra, s9
                  remu         a0, zero, zero
                  fsgnjx.s     fa2, fa2, fs9
                  fadd.s       fa5, fa4, fs0
                  fsgnjx.s     fa1, fs2, fa4
                  nop
                  mulhu        t4, t2, gp
                  fcvt.s.wu    fa5, s8
                  feq.s        s2, ft6, fs10
                  andi         t6, tp, 242
                  fmv.w.x      ft6, a1
                  flt.s        a3, fs6, fs4
                  slli         a0, a2, 4
                  fmin.s       fa2, ft8, fa4
                  fsgnjn.s     fs5, fs4, ft5
                  andi         a4, a0, 1888
                  mulhu        a2, a6, s2
                  xor          a0, s3, a1
                  fdiv.s       fs2, fs1, ft1, rup
                  fsgnjn.s     ft1, ft7, fs11
                  addi         a1, a6, 1010
                  slt          t0, s5, a0
                  fsub.s       fs5, ft7, ft8
                  fadd.s       fa4, fa6, fa7, rmm
                  rem          s5, s9, t0
                  slt          a2, zero, a7
                  fadd.s       fs6, ft5, ft3
                  andi         t0, a4, 1475
                  fmv.w.x      ft2, a7
                  and          ra, a0, s10
                  ori          a7, tp, 1147
                  and          a4, s9, sp
                  srli         s0, a5, 4
                  sltu         s0, s8, t4
                  flt.s        s6, fa5, fa0
                  sltiu        s5, t5, -775
                  andi         s2, t0, 1589
                  mulh         s2, t1, a2
                  fmul.s       ft8, ft1, ft9
                  fcvt.s.w     fa5, s8, rmm
                  fadd.s       ft7, fa5, fa3
                  andi         t0, zero, 88
                  fclass.s     s0, fs2
                  flt.s        s4, fa7, fa2
                  fsub.s       fs0, ft2, fa7
                  fcvt.w.s     s10, fs11
                  fclass.s     s3, ft5
                  div          t1, s1, gp
                  auipc        s11, 238626
                  auipc        s5, 390963
                  sll          gp, a6, t0
                  fcvt.w.s     zero, fs7, rdn
                  fsqrt.s      fa2, fa1, rup
                  sub          s0, s10, s6
                  remu         gp, a5, gp
                  rem          t2, s10, s2
                  fmin.s       ft2, fs2, fs11
                  fmin.s       fs8, ft6, fs4
                  xor          ra, s11, gp
                  sub          s10, s9, s11
                  fmax.s       fa3, fs5, ft1
                  fcvt.wu.s    gp, fa4
                  ori          zero, s6, -1701
                  auipc        t4, 923223
                  div          s9, s7, a6
                  srl          a1, zero, t3
                  fsqrt.s      fs3, fs0
                  fsgnjn.s     fa2, ft1, fs6
                  nop
                  feq.s        sp, ft5, ft1
                  add          t1, gp, t3
                  fmax.s       fs2, fs3, ft3
                  feq.s        t2, ft3, ft1
                  sltiu        s2, s3, -1508
                  fadd.s       fa6, ft11, fs4, rdn
                  lui          s1, 348615
                  fmin.s       fs0, ft1, fa4
                  fcvt.s.w     ft5, s7
                  fmv.w.x      fs3, a0
                  sub          s3, a6, a4
                  fdiv.s       fs3, ft5, fs7
                  sra          a3, a2, a6
                  fsgnjn.s     fa7, ft7, ft10
                  fsgnjx.s     ft6, ft6, ft0
                  divu         t4, s7, s9
                  andi         a4, t4, 1084
                  nop
                  xori         s1, a5, -1350
                  fcvt.wu.s    s10, ft5, rtz
                  sltu         s11, s8, a6
                  fcvt.s.w     fs2, s3
                  andi         t4, a4, 1822
                  rem          gp, t6, s10
                  fsgnjn.s     ft9, ft2, ft9
                  fmv.w.x      ft8, t2
                  fsub.s       fa0, fs1, ft6
                  fmul.s       fs0, ft4, ft8, rdn
                  fmin.s       fs5, ft5, ft10
                  or           a2, t6, t2
                  rem          a7, a2, a0
                  fle.s        a2, fa7, ft0
                  fcvt.w.s     s8, ft5
                  ori          a0, a5, -1975
                  slti         s11, a7, 1939
                  addi         t2, sp, 565
                  and          a1, t6, tp
                  fsgnj.s      ft3, fs1, ft4
                  flt.s        a3, fs9, fs1
                  fclass.s     gp, fs3
                  mul          s0, gp, s10
                  slti         s10, s7, -552
                  fcvt.wu.s    a3, fs1, rtz
                  nop
                  fcvt.wu.s    s2, ft7
                  slti         t3, gp, 2023
                  mulh         a3, t2, s6
                  flt.s        t4, fs5, fa5
                  and          s3, a0, tp
                  flt.s        s2, fs11, fa7
                  fsgnjn.s     fs5, ft10, fs1
                  fcvt.s.wu    ft3, a1
                  srl          s9, a7, a5
                  slli         s5, t4, 16
                  fsgnjn.s     ft6, fa1, fa2
                  slli         a0, ra, 21
                  or           s9, a7, zero
                  fcvt.w.s     a4, fa4
                  xori         s11, a5, -1723
                  flt.s        s4, fa6, fa2
                  srl          a7, t4, s0
                  xori         t2, s1, -1994
                  addi         s3, s11, 1138
                  fsub.s       fa1, fs6, ft9
                  nop
                  fmv.w.x      ft0, t2
                  slli         t0, a5, 29
                  fsgnj.s      fa7, ft7, fs4
                  fcvt.s.wu    ft9, t1, rup
                  lui          s4, 213453
                  or           a6, s11, a0
                  or           s8, a0, ra
                  xor          s9, a1, s9
                  fmin.s       ft5, fs0, fs1
                  fle.s        zero, ft7, fs6
                  slt          t6, t2, tp
                  fcvt.s.w     ft5, t2, rup
                  sll          t6, s5, t5
                  div          a1, s3, zero
                  flt.s        t1, fs1, ft2
                  fclass.s     a6, fs6
                  srai         a4, a0, 5
                  addi         s1, zero, -150
                  fmv.x.w      s1, fa3
                  fsub.s       fa3, fs6, fs8, rup
                  flt.s        t1, fa6, fs5
                  mulhu        s8, s1, s1
                  fmv.w.x      ft5, s9
                  feq.s        t6, fs5, fs3
                  nop
                  fmul.s       fa2, fa5, fs7
                  fdiv.s       fs1, fa7, fs5
                  auipc        a7, 456164
                  sll          t4, ra, s9
                  add          sp, s2, a1
                  slti         s3, a3, -421
                  fcvt.s.wu    fa6, ra, rup
                  fcvt.s.w     fs8, s0
                  mulhsu       a6, sp, s11
                  and          t3, a1, t4
                  rem          s8, s11, t2
                  mul          t1, s4, a4
                  slt          a7, t0, s5
                  lui          s8, 166910
                  or           s9, sp, s8
                  xori         s11, a4, -371
                  mulhsu       t3, s1, a6
                  xor          s9, s10, s5
                  fmv.w.x      fa1, s6
                  slli         t1, s11, 26
                  fmin.s       fa5, ft1, fa6
                  fmax.s       ft3, ft10, fs0
                  sltu         s1, s10, s0
                  fsub.s       ft2, fs9, ft4, rdn
                  fmax.s       fa4, ft9, fs1
                  fsqrt.s      fs0, fs2
                  sra          a1, t3, s7
                  fmax.s       ft3, fs0, fa6
                  fcvt.w.s     gp, fs4, rtz
                  fcvt.s.wu    fa6, t4, rne
                  mulh         a6, s5, a0
                  slti         a3, s2, -1902
                  flt.s        t4, fs9, fs6
                  srai         s7, a1, 13
                  xor          t1, ra, s5
                  fsgnjn.s     fs9, fs6, fs0
                  fsqrt.s      fs5, ft10
                  slli         a7, t6, 6
                  rem          s1, a4, s0
                  sra          t2, a5, s7
                  slli         a1, a5, 8
                  fcvt.w.s     t6, fs11
                  add          zero, t5, zero
                  fadd.s       fs6, ft6, fs5, rne
                  slt          a0, a0, s5
                  lui          t0, 871068
                  rem          a7, s3, gp
                  fcvt.s.wu    fs2, sp, rne
                  mulhu        s0, ra, ra
                  divu         s11, s9, s7
                  lui          zero, 822020
                  fmul.s       ft8, fa0, fs3
                  and          ra, a6, s7
                  srli         ra, t1, 1
                  fsgnj.s      fs11, fs3, fa7
                  slli         a3, a6, 24
                  sll          a7, t0, s5
                  fsgnjn.s     fa6, fs1, fa7
                  slti         a7, a7, 1190
                  fcvt.wu.s    s7, fa4
                  add          t1, a2, sp
                  div          a4, s8, s5
                  ori          t0, t3, -504
                  or           t6, a4, zero
                  fsgnjn.s     fa7, ft6, fs7
                  add          s10, s10, s9
                  sll          a3, s2, a7
                  fdiv.s       fa6, ft3, fa6
                  mul          a4, sp, s10
                  add          a2, a4, a0
                  mulhu        a4, s4, s8
                  fsgnjx.s     ft5, fs9, fs3
                  andi         a3, t3, 1667
                  ori          s4, a6, 1901
                  sll          s0, t5, a1
                  fcvt.w.s     t2, fs7, rdn
                  or           s5, a4, t1
                  fcvt.s.w     ft8, t3
                  lui          s7, 16438
                  mulh         s9, zero, t4
                  slti         a4, s2, 1212
                  fsgnjn.s     fs3, fs4, fs0
                  fsgnj.s      ft3, ft10, fa4
                  mulhu        s11, s11, s5
                  fadd.s       fs2, ft7, fs4
                  sltu         s11, tp, t3
                  ori          s8, s4, 1547
                  fle.s        s10, fs6, fa7
                  mul          a4, a0, t2
                  fmin.s       ft1, fs0, ft1
                  slt          s1, a6, a6
                  fmul.s       fs9, ft11, ft4, rmm
                  sltu         s0, t2, a2
                  fsub.s       fs0, fa4, fs6, rne
                  fmin.s       fa6, fa3, ft6
                  sltiu        a0, a6, 1438
                  fcvt.w.s     a2, fa2, rdn
                  fmax.s       ft10, ft5, ft3
                  srl          a3, t1, s11
                  fcvt.wu.s    ra, fs1, rdn
                  fmin.s       fs6, fa4, ft1
                  fmul.s       ft0, ft1, fa0, rmm
                  andi         s2, a3, 895
                  lui          s9, 1030327
                  sltu         a6, s11, t1
                  slli         zero, s4, 6
                  fclass.s     t1, ft10
                  sub          gp, a4, zero
                  remu         a6, zero, sp
                  sltiu        t3, t3, 823
                  fsgnjx.s     fs7, ft8, fa2
                  rem          t4, a6, t0
                  feq.s        t1, fs4, ft8
                  divu         t4, t3, a6
                  mul          s8, a3, a7
                  mulhsu       a3, t5, a4
                  srl          t1, a7, sp
                  mul          s3, t5, s2
                  lui          s3, 683900
                  xori         t2, a3, 184
                  fcvt.w.s     s6, fa6, rtz
                  auipc        s10, 569790
                  add          a3, ra, s1
                  fsgnjx.s     ft10, fs6, fs11
                  fmin.s       fs2, fs10, ft7
                  fmv.x.w      sp, ft5
                  fcvt.s.wu    ft7, s0
                  fmax.s       fs4, ft9, fa5
                  fcvt.s.wu    fa0, tp
                  srli         t2, a1, 20
                  srl          t1, a2, s8
                  xori         t4, s0, 129
                  srl          s5, a1, sp
                  ori          s10, a1, 626
                  fsgnj.s      fa4, fs8, fs9
                  ori          gp, s9, -1726
                  add          zero, s10, s3
                  sll          s6, s8, t1
                  fcvt.s.wu    fs8, s1, rne
                  add          sp, a7, tp
                  slt          s5, t2, a6
                  or           s10, s4, t4
                  fcvt.wu.s    s9, ft2
                  rem          s2, sp, a5
                  ori          sp, a5, 1422
                  lui          t6, 1030105
                  slli         sp, a0, 12
                  flt.s        s10, fa7, ft8
                  sub          s1, s4, ra
                  sltu         s6, s4, s7
                  mulhu        a2, tp, t1
                  mulhu        a3, a6, zero
                  fclass.s     s7, ft10
                  remu         a1, s7, s4
                  fdiv.s       fs5, fs3, ft7, rup
                  fclass.s     a0, ft0
                  xori         a1, a6, -651
                  addi         sp, s6, 186
                  xor          s2, s0, s1
                  slli         a1, a7, 0
                  remu         t0, a7, s1
                  ori          s6, t6, 625
                  mulhu        s8, a7, gp
                  sltiu        a1, s5, 1848
                  rem          t3, s8, s3
                  fcvt.wu.s    t1, ft2, rdn
                  fmv.x.w      t0, fa2
                  fle.s        s1, fs8, fs9
                  sltu         sp, ra, a2
                  rem          s6, a4, a4
                  fsgnjn.s     fs7, fa1, fa5
                  flt.s        a7, fa2, ft9
                  mul          a4, sp, s2
                  sll          s6, s7, t0
                  srai         a6, a3, 22
                  fle.s        a1, fs5, fs2
                  auipc        t1, 441805
                  nop
                  srai         sp, a5, 6
                  fdiv.s       ft1, fs10, fa6, rmm
                  mulh         zero, t3, tp
                  srli         s11, a7, 19
                  fadd.s       fs11, fs6, ft10, rdn
                  fcvt.wu.s    s10, ft11
                  fsgnjn.s     ft7, fs0, fa5
                  flt.s        t0, ft8, ft9
                  mulh         s5, zero, s9
                  div          a4, t3, s4
                  fmax.s       fa7, fs2, fs6
                  xori         a2, a0, 1474
                  sub          a0, s7, s0
                  fsgnjn.s     fs10, ft8, fs9
                  fsgnj.s      fs2, fs11, ft2
                  auipc        a2, 523563
                  add          a3, s11, a0
                  slli         zero, sp, 7
                  mulhu        s4, tp, s9
                  fmv.w.x      fs5, s4
                  divu         a6, a5, s10
                  fmul.s       fs3, fa5, fa2, rup
                  xor          s1, s7, t3
                  fmv.w.x      fs3, t1
                  fsgnjx.s     ft2, ft1, ft10
                  fmv.w.x      fs7, t3
                  auipc        sp, 655482
                  xori         a0, t5, 773
                  sub          s11, t2, t6
                  srai         a3, s7, 2
                  slli         a2, a1, 28
                  srai         s11, s4, 27
                  xor          s1, s1, s1
                  sltu         a1, a1, s7
                  fsgnjx.s     fs10, fa2, ft11
                  fsub.s       ft6, fa1, ft3, rtz
                  sub          s3, a5, t5
                  fdiv.s       ft11, fs7, fs1
                  xori         sp, a0, -2017
                  add          t1, s8, t6
                  mulhsu       s9, s10, s4
                  fdiv.s       fs10, ft2, ft11, rup
                  fmv.w.x      fa5, s10
                  srli         ra, ra, 9
                  xor          t0, a1, a5
                  remu         t0, a0, sp
                  sltiu        s8, t5, 1075
                  feq.s        a0, fs11, ft10
                  fmv.x.w      t0, ft8
                  mulhu        s9, s3, ra
                  fsgnjn.s     fa5, ft6, fa7
                  divu         a0, s2, gp
                  auipc        ra, 178571
                  slt          s1, s4, ra
                  slti         s0, s2, -301
                  fsqrt.s      fs3, fs4
                  sltiu        s1, t0, -1452
                  fsqrt.s      fa1, fs0
                  fmin.s       fs1, ft10, fs10
                  sll          a1, a1, s5
                  add          s2, s6, a7
                  slti         s8, a4, -823
                  fcvt.wu.s    t6, fs6
                  feq.s        s1, fa1, fs3
                  feq.s        a0, ft2, fs4
                  fsub.s       fs5, fs10, fa7
                  div          t0, t0, a0
                  fcvt.w.s     s10, ft6
                  fmv.x.w      t6, ft8
                  sltiu        t4, s7, -1689
                  fdiv.s       fs10, fs4, fa4, rdn
                  ori          sp, t3, -88
                  fclass.s     t3, fs9
                  lui          zero, 236078
                  remu         a6, s1, s5
                  add          s6, t0, s5
                  fmin.s       fs4, ft7, fs3
                  fmul.s       fa2, fs7, fs7, rtz
                  srl          s3, a4, s0
                  fadd.s       ft2, ft9, fs1
                  div          s10, s6, a0
                  sltu         t4, t0, sp
                  and          s10, a5, a5
                  divu         t3, s1, s6
                  fmin.s       fs10, ft5, ft2
                  mulh         s6, s10, ra
                  xor          s0, t4, s5
                  sra          s9, gp, sp
                  fcvt.w.s     s11, fa2, rup
                  fsgnjx.s     ft8, ft5, fs5
                  fmin.s       ft3, fa6, ft10
                  fmul.s       fs2, ft10, ft11, rdn
                  fsgnjx.s     fa1, fa5, ft3
                  div          ra, s3, s1
                  fmax.s       fa1, fs8, fs3
                  fclass.s     t2, fs5
                  mulhsu       a0, s4, a1
                  remu         t1, t4, s3
                  fcvt.wu.s    s8, ft9, rup
                  fsgnj.s      ft1, fa2, fs2
                  srl          s2, s3, zero
                  fmax.s       fa6, ft9, fs8
                  mulh         a0, t4, s11
                  fclass.s     t1, fa4
                  mulhsu       sp, t1, t0
                  mul          gp, s8, s7
                  fcvt.s.wu    ft1, s3
                  mulhsu       t0, a0, tp
                  mulh         a2, a1, a3
                  sub          s7, s9, sp
                  fadd.s       fs1, fa4, fs7, rmm
                  add          t1, sp, s0
                  fcvt.wu.s    s3, ft11
                  fcvt.wu.s    t4, fa7
                  remu         s4, s11, a0
                  nop
                  addi         a4, t6, 702
                  lui          a7, 504259
                  or           sp, ra, s11
                  nop
                  slli         s11, a7, 25
                  div          a2, zero, s1
                  fcvt.s.w     ft4, t2
                  addi         s5, t5, -608
                  andi         a7, s10, -1182
                  srl          s7, t5, s5
                  fcvt.wu.s    s9, fs1
                  fcvt.wu.s    a2, fs10
                  fcvt.w.s     s9, fa6, rne
                  fcvt.wu.s    t4, ft8
                  fle.s        t6, ft3, ft1
                  ori          s0, t6, 564
                  fmul.s       ft2, fs3, fa2
                  feq.s        gp, fa7, fs5
                  fmin.s       fa3, ft7, fs8
                  sub          s10, t5, zero
                  fclass.s     s6, ft3
                  flt.s        s2, fs5, ft0
                  auipc        s2, 558796
                  fsub.s       ft6, ft10, fa1, rtz
                  fsqrt.s      ft11, fs1
                  fmv.x.w      t4, fs10
                  mulh         s8, s5, tp
                  srli         a4, t6, 17
                  fclass.s     s10, fa2
                  fmv.x.w      a4, fs8
                  fcvt.s.wu    ft3, t4, rtz
                  fmv.w.x      fa4, s8
                  addi         gp, t4, -1002
                  sub          a2, s6, s5
                  srli         s9, a5, 31
                  fdiv.s       ft4, fs2, fa3
                  xori         gp, t1, 203
                  fsub.s       fs5, ft2, ft4, rne
                  fsgnj.s      fs7, fa2, ft6
                  slti         gp, a5, -188
                  mulh         ra, s0, t0
                  mulhsu       a4, a4, s9
                  fsqrt.s      fs11, fs5, rdn
                  fsgnjx.s     fa7, fs0, fs4
                  fsgnjx.s     ft6, ft1, ft11
                  fsgnj.s      fa1, fs1, ft11
                  xor          s1, s6, s11
                  slt          t3, s3, s9
                  srai         t3, s2, 30
                  srli         a7, a6, 26
                  sltu         s0, s2, t4
                  sltu         s3, t6, s7
                  fsgnj.s      ft2, fs6, ft1
                  flt.s        t1, fs0, fs7
                  fclass.s     sp, fa0
                  slli         s2, a4, 11
                  flt.s        s10, ft9, fs8
                  add          s4, s1, s4
                  fcvt.s.wu    fs6, s2
                  mulhsu       t3, a3, zero
                  mul          t4, a1, a3
                  addi         a3, gp, -517
                  feq.s        t1, fa0, fa7
                  fsub.s       ft3, ft7, fs8
                  and          a4, t0, s10
                  sub          s4, a0, s11
                  fmv.w.x      fs2, s3
                  div          gp, s6, t1
                  div          s10, t6, s6
                  fmul.s       fs8, ft3, fs3
                  fle.s        a4, fs7, fa7
                  feq.s        a2, ft7, ft6
                  srai         a7, s11, 25
                  mulhsu       s11, s4, a1
                  sra          s4, s1, s4
                  fmv.w.x      ft8, s4
                  slti         s2, t1, -822
                  fle.s        ra, fs4, ft7
                  xori         s8, s6, -709
                  slt          a1, t0, s2
                  sll          a1, t5, s6
                  mulh         t0, t0, a1
                  and          t6, s7, tp
                  fle.s        s0, fs6, fa4
                  ori          zero, s5, 338
                  srai         s9, t0, 19
                  and          t3, s1, s2
                  srli         a1, s9, 29
                  slt          s6, s5, sp
                  mulh         gp, zero, s3
                  fsub.s       fs2, fs5, fs3
                  sltu         ra, s7, a3
                  mulh         gp, s9, sp
                  sll          s4, t6, a0
                  ori          sp, a1, -1575
                  fsub.s       ft5, fs2, ft1
                  and          t6, a3, a7
                  andi         a6, s6, -1576
                  div          s6, s1, a1
                  auipc        a1, 576956
                  srl          gp, s5, s1
                  xori         t0, t0, 876
                  auipc        s4, 241739
                  divu         t1, t6, a1
                  fsgnjn.s     fa2, fa0, fs0
                  mulh         t1, s2, a6
                  fsub.s       fa7, ft8, ft9, rne
                  sra          a7, s1, t3
                  flt.s        s1, fs0, fa2
                  add          t1, t4, s0
                  fsgnjx.s     fs3, fs10, fs2
                  and          t1, t1, s0
                  divu         s6, t4, t0
                  sub          s5, t5, s11
                  fcvt.s.wu    ft1, s0, rup
                  nop
                  remu         s8, a1, t5
                  add          t0, a4, zero
                  sll          t3, gp, a2
                  fmax.s       ft8, ft10, ft1
                  fsqrt.s      fa6, ft1
                  mulhu        s8, s11, zero
                  sub          sp, s10, s11
                  fadd.s       ft5, fa5, ft9
                  or           a7, t2, t1
                  feq.s        s8, fa1, fs6
                  lui          s11, 951317
                  divu         s9, tp, s1
                  mul          s3, s8, s3
                  fmv.x.w      t1, ft6
                  srl          gp, s8, a2
                  sra          t3, t6, a7
                  sra          sp, s9, a6
                  mulh         a4, tp, tp
                  sll          a4, t5, a2
                  mul          t3, ra, s11
                  fdiv.s       ft9, fs3, ft10
                  srai         s0, zero, 28
                  fmv.x.w      s6, fs2
                  srl          zero, s4, s3
                  fmul.s       fa0, fs6, fs2, rup
                  fsqrt.s      fa2, fa7, rup
                  divu         s4, sp, s1
                  fle.s        s0, fa5, fa3
                  fle.s        zero, fa1, fs5
                  rem          s4, t0, s10
                  sll          s6, t3, a2
                  fcvt.s.w     ft10, ra, rup
                  sltu         zero, a4, s2
                  ori          t3, a7, 356
                  mulhu        s4, t0, gp
                  add          a1, s2, a7
                  fcvt.s.w     fa0, sp
                  sltiu        sp, s0, 1116
                  fmv.w.x      fs6, a7
                  fmax.s       fs0, ft9, ft2
                  auipc        a6, 197063
                  srl          a0, a1, s5
                  addi         a0, t5, -1496
                  fmv.x.w      a1, fa0
                  slti         s4, a3, 1196
                  srai         t3, a0, 12
                  sltu         sp, s5, t0
                  fle.s        s7, ft9, fs8
                  fle.s        s0, ft0, ft2
                  feq.s        zero, fa2, fs10
                  addi         a6, a1, 53
                  or           t3, t5, t1
                  nop
                  fsgnjn.s     ft7, fa2, ft1
                  srai         s8, a2, 12
                  mulhu        s2, s6, a6
                  fsub.s       fa7, ft2, ft8, rmm
                  rem          t4, t5, a1
                  fdiv.s       fa4, fs4, fa2, rmm
                  slti         zero, s7, 1521
                  fcvt.s.w     fa1, sp, rdn
                  xor          gp, s6, a2
                  and          t2, s2, a1
                  lui          s5, 1009039
                  fle.s        s7, fs8, ft11
                  fcvt.s.wu    ft7, a6
                  sll          t2, a3, s6
                  fcvt.s.wu    fs11, s4
                  sll          zero, a1, a1
                  fmax.s       ft3, fa0, fa2
                  fcvt.wu.s    s2, fa6, rne
                  slti         s1, t3, 1394
                  slli         s9, s9, 10
                  feq.s        s3, ft4, fs6
                  mulhsu       a0, t0, s6
                  flt.s        s10, fs11, fs8
                  fdiv.s       ft4, fs3, fs4, rup
                  fmv.w.x      fa3, t5
                  or           s7, a0, s4
                  srli         gp, t1, 26
                  sra          t2, a4, t3
                  slli         t6, t2, 30
                  sltiu        s6, a4, 283
                  lui          t1, 700808
                  mulhsu       s11, gp, zero
                  xori         zero, a4, -1056
                  slli         t4, s10, 6
                  sub          sp, s6, a6
                  addi         gp, t0, 1513
                  xor          zero, s8, gp
                  mul          t6, a0, a3
                  sub          s4, a6, a1
                  sub          t6, sp, t0
                  and          s2, s5, ra
                  fle.s        a4, fs2, fa7
                  fsub.s       ft11, fs6, fs4
                  add          t0, tp, t5
                  rem          a0, s7, t0
                  divu         s1, a3, t2
                  fcvt.s.w     fa0, a0, rtz
                  xor          zero, s4, t6
                  fmv.x.w      t2, fs3
                  fcvt.w.s     s6, ft10
                  sra          s3, s4, gp
                  fmul.s       fa6, fs11, ft3
                  sub          a3, t3, s3
                  or           s2, s1, a5
                  addi         zero, gp, -744
                  or           s6, s2, s0
                  srai         s5, sp, 20
                  sra          t3, s5, a7
                  fmv.w.x      ft10, s5
                  fmax.s       fa0, ft2, fs10
                  fdiv.s       fa1, fa2, fs5, rne
                  sltiu        s6, s4, -47
                  nop
                  xor          t3, a1, a6
                  sltiu        a7, t6, -736
                  srai         ra, s7, 21
                  feq.s        s11, fa6, fs3
                  srl          a2, t4, s4
                  slti         s11, s5, -1655
                  fle.s        s11, fs10, ft11
                  slli         s8, s7, 16
                  sltiu        gp, a4, -165
                  sltiu        s1, s10, 1349
                  feq.s        s6, fs3, ft3
                  fmax.s       fs7, fa1, fa4
                  slt          s11, t1, s1
                  ori          ra, s11, -268
                  fmv.w.x      ft3, t1
                  sra          gp, s4, s2
                  fcvt.w.s     a6, fa7, rne
                  fadd.s       fs11, fa4, fa3
                  andi         s5, a3, 630
                  fsub.s       ft8, fa7, fs9, rne
                  mulh         s10, s3, s0
                  ori          sp, s11, -585
                  fmin.s       ft10, fs6, fs11
                  remu         s10, s6, s8
                  remu         t3, s8, s4
                  fmv.w.x      fa7, t2
                  rem          s4, s2, s4
                  slli         a0, a5, 10
                  divu         a3, a0, s4
                  lui          t6, 685900
                  sltiu        a0, t0, -140
                  and          sp, s9, s11
                  flt.s        t6, fa3, fa0
                  fsqrt.s      fs8, fa0, rtz
                  slti         s7, t0, 217
                  mul          s6, tp, t2
                  flt.s        t3, fs6, fs2
                  flt.s        s11, fa4, ft11
                  fle.s        ra, fa4, fs9
                  addi         s1, a0, -57
                  add          s8, t1, s10
                  fle.s        s2, ft6, fa6
                  rem          s7, a5, sp
                  lui          s5, 899343
                  mulhu        gp, t5, a3
                  sll          s8, a3, gp
                  feq.s        s8, ft6, fs9
                  ori          s7, s7, 299
                  div          s0, s3, s2
                  srl          s4, t0, a0
                  fmax.s       ft6, fa2, fa0
                  divu         a1, a6, t4
                  addi         t2, s3, -738
                  ori          a1, s8, 321
                  fcvt.s.w     ft4, s0, rne
                  fsgnjx.s     fa6, ft3, fs7
                  sub          gp, gp, t4
                  fsqrt.s      fs2, fs4, rup
                  addi         s10, s2, -1861
                  slti         a3, a2, -1291
                  mulhu        ra, s3, s6
                  sll          t6, s1, s9
                  fsqrt.s      ft8, fa4
                  nop
                  fmv.x.w      s9, fa0
                  fmv.w.x      ft1, t0
                  srl          s1, s4, s0
                  sub          s7, t6, s8
                  lui          t6, 845707
                  sll          s5, t4, a6
                  fmv.x.w      s9, fs11
                  fmax.s       ft9, fs11, fs6
                  flt.s        a1, ft8, fs7
                  srai         a7, s11, 27
                  sltu         s10, s0, a1
                  fcvt.s.w     fs0, t2, rup
                  sra          a2, t4, a0
                  fsgnjn.s     fa3, ft11, fs1
                  flt.s        t2, fs7, ft3
                  slt          t4, s4, s9
                  div          s1, gp, t2
                  fsgnjx.s     ft9, fa5, fs9
                  sltu         t3, s1, a7
                  fsqrt.s      fa4, fs4
                  fmax.s       fs8, fs2, fs1
                  fmul.s       ft8, ft10, fa7, rup
                  srl          a6, t1, zero
                  fmv.w.x      ft1, a5
                  sll          ra, t2, s10
                  fmin.s       fs9, ft10, ft7
                  fmin.s       ft7, ft11, fs0
                  and          a1, t4, t1
                  fmv.w.x      fs10, a2
                  fcvt.s.w     ft11, t2, rmm
                  fcvt.s.w     fa5, s2
                  fmv.x.w      s2, fa7
                  fsgnjx.s     fa2, fa1, fs7
                  auipc        s11, 571418
                  xori         s3, a0, -1882
                  addi         t3, s2, 1194
                  fdiv.s       fa1, fs9, fa4
                  xori         s2, t2, 338
                  mul          s1, a3, s4
                  remu         s1, gp, t1
                  sltiu        s11, zero, -540
                  xor          s1, a5, a2
                  sub          t1, a3, a5
                  srai         s3, s4, 23
                  fadd.s       fs8, ft1, ft0
                  lui          s0, 646749
                  sra          a2, tp, t2
                  slti         s9, s8, 540
                  flt.s        a1, fa2, ft4
                  remu         t0, sp, ra
                  fdiv.s       fs6, fa7, fs7
                  rem          t0, a2, zero
                  slt          t4, t1, t5
                  fmv.x.w      s0, ft1
                  ori          s7, sp, 1831
                  fsub.s       fs0, ft4, fa6, rmm
                  fcvt.w.s     s8, fs1, rdn
                  addi         s8, a0, -719
                  fcvt.s.w     fs5, s10
                  fsgnjn.s     fs2, ft10, fs4
                  srai         a7, s10, 22
                  srli         s4, s10, 12
                  and          s9, sp, s5
                  fsub.s       fs4, ft7, ft7, rne
                  div          s6, s0, t4
                  srli         s8, a1, 19
                  fcvt.wu.s    ra, fa3, rup
                  divu         s8, zero, s10
                  fadd.s       ft3, fs4, ft6
                  lui          gp, 993560
                  andi         t4, t1, 603
                  fcvt.s.wu    fa3, s11, rmm
                  fsgnj.s      fs9, fa7, fs0
                  fcvt.s.wu    ft7, a3, rdn
                  mulhsu       a1, s9, s6
                  mulhsu       zero, t2, a5
                  addi         zero, s5, 1319
                  slt          a3, s7, gp
                  xor          t1, s1, s4
                  sll          zero, t4, a2
                  fcvt.s.wu    fs2, a2
                  srli         s1, s6, 8
                  mulh         a3, a7, s11
                  addi         s6, s0, 1616
                  fclass.s     a2, fs6
                  divu         a3, s9, a5
                  xor          sp, s1, t1
                  divu         gp, a1, a5
                  fcvt.s.w     fs11, t0
                  addi         a3, a4, -255
                  fsgnjx.s     fs6, fa2, fs8
                  srli         s6, a1, 17
                  fsgnjx.s     fa5, ft10, ft3
                  fsqrt.s      fa7, fs8, rtz
                  sltiu        t0, a0, -1540
                  slti         a1, sp, -1503
                  sll          t4, ra, tp
                  feq.s        s10, fs1, fa6
                  or           t3, s5, zero
                  fmin.s       fs5, ft8, fs1
                  div          s3, a7, s7
                  mulh         s1, zero, a2
                  auipc        a6, 815584
                  fsub.s       ft1, ft4, fa2
                  fdiv.s       fa7, ft2, fs11, rup
                  ori          s8, t5, -1957
                  lui          zero, 906570
                  fcvt.wu.s    t0, fs1, rne
                  slli         s6, tp, 4
                  fcvt.s.w     ft7, zero
                  sll          zero, t4, s1
                  mul          s11, a6, t4
                  sll          s8, a6, a4
                  divu         s6, t5, sp
                  fsgnj.s      fs9, fs11, fs8
                  fclass.s     a6, ft5
                  srl          t6, a5, zero
                  sltu         s9, a3, t4
                  fle.s        a3, fa5, fs2
                  andi         t3, s1, 409
                  fdiv.s       fa1, fs10, ft4, rmm
                  auipc        s10, 387968
                  fsqrt.s      fs11, ft11
                  flt.s        s10, fs10, fs1
                  slti         s7, gp, 1293
                  fadd.s       ft1, fs8, fa7, rtz
                  mul          s11, a0, t2
                  fmin.s       ft4, ft7, fs11
                  remu         s3, a0, s4
                  fmax.s       fs1, fa5, fa1
                  flt.s        t1, ft5, ft8
                  sltiu        t4, a5, -1526
                  fsgnjx.s     fs7, fs1, fs2
                  fsgnj.s      fs10, fa2, fs11
                  remu         a4, a4, s4
                  fmax.s       ft1, ft1, ft5
                  fle.s        s7, fa7, ft3
                  divu         a7, s1, t4
                  andi         s5, s2, -1975
                  or           t0, a3, s4
                  rem          s1, t4, a3
                  fadd.s       fa0, fa5, fa7, rup
                  fsub.s       ft4, fa3, fs8
                  feq.s        s7, ft1, fs0
                  fclass.s     t6, fs10
                  mulh         s1, a7, a4
                  slli         a6, a4, 25
                  fdiv.s       fs1, fa6, fs5
                  mulhsu       t3, t2, s6
                  andi         a3, t1, -569
                  fcvt.s.w     fs9, a0, rup
                  sltiu        s0, a5, -1470
                  lui          sp, 275734
                  sll          s0, zero, s9
                  sub          a2, s8, tp
                  nop
                  fmul.s       fa6, fs8, fa3
                  nop
                  and          a4, t2, ra
                  xori         s0, a3, -1001
                  slti         s4, a0, -667
                  fclass.s     a1, fs5
                  rem          s7, a3, t2
                  add          s6, t2, gp
                  mul          s9, a4, s11
                  mulhsu       s6, t3, t6
                  srl          a6, a0, s6
                  fcvt.w.s     s7, fs6, rdn
                  fmin.s       fa5, ft6, ft0
                  xori         a6, s10, 143
                  fsub.s       fs7, ft9, ft8
                  andi         s6, a5, 1639
                  add          zero, s9, a4
                  srai         t1, s4, 12
                  div          a7, ra, a3
                  srai         s5, a6, 26
                  fclass.s     s1, ft8
                  fsqrt.s      ft6, fa6, rup
                  remu         s6, s6, t2
                  srai         t0, sp, 8
                  fmv.w.x      ft1, s5
                  addi         s7, s2, 845
                  and          s2, s7, a2
                  fmv.x.w      s6, ft8
                  mulhu        t3, t3, a0
                  flt.s        ra, ft2, ft3
                  slli         s2, a4, 28
                  fcvt.s.w     fa3, a7, rmm
                  slti         s0, a7, -1527
                  srai         s3, a1, 14
                  and          s11, t4, t4
                  srai         s3, s2, 12
                  fmul.s       fa2, fa5, fs9, rtz
                  fmv.x.w      s5, fa6
                  slli         s3, a3, 30
                  fmv.x.w      a3, fa4
                  srl          s0, ra, zero
                  srli         t2, a7, 9
                  fle.s        a6, fs10, fa1
                  lui          t3, 810143
                  fsgnjn.s     fa6, ft9, fa6
                  flt.s        a0, fs0, fa0
                  rem          s10, s2, a2
                  fle.s        a6, fs1, ft5
                  nop
                  fcvt.s.wu    ft6, t6, rmm
                  srl          s5, s4, a2
                  fsub.s       fs11, fs7, fs6, rup
                  fcvt.wu.s    s5, ft0, rup
                  mul          sp, a7, t6
                  fmul.s       fs6, fa7, fa6
                  feq.s        t3, ft0, fs4
                  fsgnjx.s     fs10, ft4, fs11
                  fmax.s       ft5, fa7, fa4
                  slti         s10, a3, 440
                  andi         s1, t4, -781
                  flt.s        zero, ft6, fa3
                  fmv.x.w      ra, ft6
                  lui          s7, 830671
                  fsqrt.s      ft11, ft0, rmm
                  fmin.s       fs1, fa7, fs1
                  srl          ra, a7, t5
                  feq.s        t0, ft7, fs5
                  and          s3, s4, t1
                  auipc        t1, 435200
                  fcvt.w.s     s3, fs9
                  sra          s4, t5, t3
                  srli         t6, s10, 26
                  nop
                  div          t1, a6, a5
                  fcvt.wu.s    s9, fs10
                  srli         zero, a2, 9
                  flt.s        t6, ft8, ft1
                  fmax.s       fs10, fs3, fs10
                  fsgnjn.s     fs1, fs8, fs5
                  sll          t3, zero, s10
                  fsgnjn.s     fs9, fs6, ft0
                  fmul.s       fs10, ft5, ft6, rne
                  srl          t2, tp, sp
                  add          a0, zero, ra
                  srl          s2, s6, s1
                  sltiu        a3, a6, -426
                  fmin.s       fa4, fa3, fa7
                  slli         s11, sp, 24
                  fcvt.s.wu    fs5, s1
                  fcvt.w.s     t2, ft2, rup
                  and          s3, sp, s7
                  fcvt.s.w     fs11, s0, rne
                  fmv.x.w      s7, fs0
                  mulhu        s7, a6, a3
                  sltiu        a1, t3, 8
                  rem          t0, s10, s11
                  fcvt.s.w     fs0, t3, rup
                  mulhu        t6, a5, t4
                  feq.s        a6, ft7, fs11
                  sra          a2, zero, s0
                  addi         a3, sp, 1569
                  mulhu        a0, s0, t4
                  remu         a1, s6, s1
                  fmax.s       ft2, ft4, fa3
                  srai         s5, a5, 8
                  sltu         t3, t2, t2
                  xor          t4, s5, a2
                  fcvt.s.wu    ft1, t4
                  slli         a7, t6, 17
                  srl          s2, s6, s5
                  mulh         t6, s10, a0
                  feq.s        t4, fa4, fs5
                  lui          t2, 508086
                  remu         s7, t3, ra
                  mulh         a1, a5, a2
                  slti         a4, zero, 1977
                  slli         zero, a1, 1
                  fcvt.wu.s    s6, ft6, rup
                  sub          s1, t1, a2
                  divu         t3, s11, s10
                  feq.s        a2, ft9, ft11
                  mulhu        s11, a0, a6
                  mulh         t1, ra, s5
                  ori          sp, a4, 247
                  add          t4, tp, t3
                  fcvt.s.wu    ft9, a5
                  fle.s        s5, fa1, ft9
                  sub          ra, ra, gp
                  sltu         s5, a1, a0
                  slt          s8, t2, t1
                  sra          sp, tp, a5
                  srli         a6, s5, 5
                  slti         sp, gp, -1360
                  and          s4, tp, t5
                  ori          s6, s0, 210
                  fle.s        s5, fs4, fa3
                  auipc        t3, 725886
                  fcvt.s.wu    fs3, a3
                  xor          t1, zero, a6
                  fsgnjx.s     ft5, fs4, ft0
                  fsqrt.s      ft9, fs9, rdn
                  fle.s        s1, fs4, fs5
                  fsgnjx.s     fs1, fs4, ft8
                  fcvt.wu.s    s8, ft7, rmm
                  auipc        t4, 804248
                  fsqrt.s      fa3, fa2
                  andi         t3, t3, 999
                  lui          a7, 190155
                  sub          t3, s4, t6
                  fmax.s       ft4, fs1, fa6
                  andi         s6, s9, 12
                  add          s10, t2, s1
                  fcvt.s.wu    fs10, s0
                  addi         s4, sp, -1628
                  fsgnjx.s     fa5, fa2, fa1
                  ori          a1, s3, -1236
                  or           t4, ra, t5
                  mul          s6, s2, s1
                  nop
                  rem          s0, s2, t0
                  srli         t3, tp, 29
                  sltiu        t2, s8, -1090
                  flt.s        ra, ft4, fs0
                  fmul.s       ft8, ft3, ft0
                  divu         s11, tp, a6
                  sll          t6, a4, s0
                  fle.s        a1, fs2, fs6
                  fmax.s       fa3, fa0, fs2
                  divu         t2, a7, a6
                  fsgnjn.s     fa1, fs2, fa0
                  mul          ra, zero, a5
                  fmul.s       fa0, fs1, ft3, rmm
                  rem          t4, sp, t3
                  slti         a0, t0, 1000
                  fsgnj.s      fa4, fa3, ft5
                  sra          t4, gp, s10
                  mulhsu       ra, a6, s6
                  mulhu        s3, s4, sp
                  fsgnj.s      ft7, ft11, fa3
                  fsqrt.s      ft3, ft5, rmm
                  divu         s11, t1, s6
                  sltiu        t3, zero, 225
                  fsgnj.s      fa3, fs11, fs7
                  sra          s7, s1, s6
                  fadd.s       ft1, ft3, fa6
                  div          s5, t2, tp
                  div          a4, t6, s3
                  fcvt.wu.s    s0, fs6, rmm
                  fsgnjx.s     ft3, ft5, fs6
                  flt.s        a3, fs10, ft7
                  srli         s7, s8, 14
                  sra          a1, a4, t2
                  srli         t2, a4, 9
                  nop
                  add          t6, a2, s6
                  mul          t1, s9, a0
                  fsgnjx.s     fs7, ft7, fs3
                  fadd.s       ft6, ft10, ft0, rmm
                  fmin.s       fs9, ft8, fs1
                  fmv.w.x      ft4, s11
                  fsgnjn.s     fa7, fs1, ft11
                  rem          s0, t4, a5
                  div          a6, a2, s3
                  mul          s6, s4, s10
                  srli         s10, s1, 22
                  fmin.s       fs4, ft0, ft3
                  fcvt.s.wu    fa2, s8
                  fle.s        t0, fa7, fs1
                  fmul.s       fa6, fa1, ft3
                  div          s0, a7, a4
                  srli         s2, s0, 27
                  sltu         s6, tp, s3
                  and          s10, a5, t0
                  fsgnjx.s     ft0, fa7, fs3
                  rem          sp, s1, s7
                  fcvt.s.w     fa1, s3, rtz
                  auipc        s2, 885117
                  fmin.s       ft1, fa0, fs9
                  slli         t4, tp, 8
                  fclass.s     gp, ft6
                  sltu         s9, gp, s9
                  lui          t2, 1026635
                  srl          s6, a4, s10
                  feq.s        s10, ft10, fs4
                  or           s4, t2, sp
                  fcvt.w.s     s8, fs4, rne
                  xor          a2, s4, s2
                  fsgnjn.s     fs10, fs6, ft9
                  nop
                  fmin.s       fa3, fs7, fs2
                  fsqrt.s      fs2, fa1, rtz
                  flt.s        t4, fa4, fs10
                  feq.s        a3, ft11, ft1
                  sub          s1, a1, s11
                  sltiu        s7, s0, -947
                  lui          s2, 215181
                  flt.s        s9, ft5, fs10
                  remu         s7, ra, a2
                  auipc        t2, 91203
                  rem          a7, s2, t5
                  fsqrt.s      fa7, fs6, rne
                  or           a2, zero, t3
                  fdiv.s       ft11, fs9, fa6
                  sra          t3, t3, t0
                  fle.s        s9, fs5, fa7
                  or           t4, s10, a6
                  fsgnjn.s     ft2, ft5, fs0
                  fadd.s       ft11, fs6, fs0
                  slli         t1, gp, 12
                  fsgnj.s      fa0, fs1, fs5
                  divu         t6, sp, sp
                  sltu         s10, tp, a4
                  fcvt.w.s     gp, fs9, rtz
                  fmul.s       ft1, ft8, fa2, rmm
                  fadd.s       ft2, fa2, ft10
                  fsgnj.s      ft1, ft1, ft7
                  xor          s4, s8, s3
                  addi         ra, t6, 1734
                  auipc        s1, 566498
                  mulhu        a0, t1, ra
                  fsqrt.s      ft4, fa7, rdn
                  sltu         s2, t6, t3
                  srl          s9, s3, a2
                  fcvt.s.w     fs5, t0, rmm
                  sub          a6, t5, t6
                  sltiu        s8, a0, -357
                  fmin.s       ft2, fa3, fa7
                  fmv.x.w      a4, ft3
                  fsgnjn.s     ft2, fs3, ft10
                  lui          zero, 513604
                  fsub.s       ft9, fa3, ft2, rup
                  xori         s10, s11, 92
                  mul          s3, ra, t1
                  rem          s5, s8, tp
                  fsgnj.s      ft0, fa5, fs2
                  fadd.s       ft3, fa3, fs8
                  feq.s        s9, ft10, ft0
                  fcvt.w.s     s4, ft6
                  fclass.s     s11, fs2
                  lui          s5, 992537
                  fmax.s       ft8, ft4, ft10
                  sltu         s4, a7, t5
                  fcvt.wu.s    t0, fs9, rmm
                  srai         zero, s2, 9
                  xor          s6, t5, t4
                  lui          s6, 503113
                  add          t0, a2, t3
                  xori         sp, a1, 1876
                  divu         s10, a5, t4
                  fmax.s       fs2, fa0, fs11
                  add          t3, a5, tp
                  mul          t1, s9, tp
                  andi         s8, t6, 1246
                  fsgnjn.s     ft7, ft7, ft7
                  sub          s3, ra, s9
                  mulh         t1, t6, s3
                  mul          s2, zero, sp
                  srli         t1, t5, 7
                  nop
                  divu         t6, ra, s4
                  ori          s10, s4, 69
                  or           a2, s5, s9
                  div          t6, s4, a0
                  or           gp, t3, zero
                  divu         a4, gp, t2
                  divu         s5, s9, s6
                  fsgnjn.s     ft4, fs3, fs8
                  sra          zero, t0, t0
                  srl          t2, t2, s9
                  fsub.s       fs11, fs10, ft3, rtz
                  srli         s10, t1, 11
                  fle.s        s11, ft4, fa2
                  or           t1, s6, s2
                  divu         s8, t0, s8
                  fsub.s       fa2, fa0, fa6
                  lui          s8, 868994
                  mulhu        a0, s9, s11
                  fcvt.s.w     fs5, a4, rne
                  nop
                  slt          ra, a6, t2
                  fcvt.s.wu    ft0, t4, rtz
                  sub          s2, t1, zero
                  sra          ra, a7, s2
                  fsgnjn.s     fs3, fa0, fa4
                  slt          s11, a7, a1
                  fmv.x.w      t3, ft4
                  feq.s        t3, fs8, fa7
                  divu         s11, tp, gp
                  ori          s4, a4, -1456
                  fcvt.s.wu    fa7, s9
                  flt.s        s8, ft11, fa7
                  slt          ra, s9, s1
                  mulh         t1, t4, zero
                  and          s10, a1, a3
                  sltu         zero, a3, s2
                  lui          s10, 934643
                  fclass.s     s11, fs11
                  fsub.s       fa7, fa3, ft9
                  sltu         s1, s7, a5
                  and          t0, t2, a7
                  or           s9, t6, s4
                  fcvt.w.s     s6, fs4, rdn
                  srl          s4, gp, a1
                  mul          s6, a6, t1
                  slti         s0, s6, 1455
                  fmv.x.w      s2, ft1
                  fmin.s       ft3, fs3, ft11
                  xor          zero, s5, t0
                  or           a6, s1, t5
                  mul          a6, t3, a1
                  fmv.x.w      t4, ft1
                  fmul.s       fs4, fs0, ft8
                  xor          s7, t1, t0
                  div          a0, s4, t5
                  addi         t1, t6, 1326
                  fsub.s       ft3, ft2, fs0, rmm
                  srl          a4, s6, s1
                  slt          t2, a4, t5
                  slt          s9, t2, s1
                  xori         zero, ra, 109
                  fcvt.w.s     a0, fs3, rup
                  srai         s1, s6, 8
                  auipc        s9, 15906
                  fmax.s       fa1, fs1, fs7
                  auipc        t0, 1021457
                  sll          s3, s1, t5
                  slti         s1, a7, -1872
                  mulh         s6, a5, t1
                  fmin.s       fa6, fa2, ft1
                  mulhsu       t6, t4, a0
                  fcvt.s.w     fs3, s0
                  div          gp, s11, gp
                  fmv.x.w      s1, fs5
                  fadd.s       fs1, fs2, ft3, rmm
                  mulhu        t3, s0, s3
                  sub          s11, a4, s9
                  fcvt.w.s     t1, ft1
                  fsgnjx.s     ft10, fs6, ft10
                  auipc        t3, 973075
                  fmv.w.x      fs2, s1
                  flt.s        t3, fs7, ft7
                  fmax.s       fs5, fs2, fa1
                  rem          a7, s1, ra
                  fcvt.wu.s    s6, ft5, rtz
                  slt          s0, t6, s5
                  flt.s        t6, fa1, ft10
                  and          s11, s8, t3
                  ori          t6, s2, 170
                  addi         a4, a0, -1907
                  fle.s        t3, ft6, fs8
                  xor          a2, ra, s7
                  xori         s7, s2, -40
                  fcvt.wu.s    s4, ft4
                  sltu         s7, zero, s10
                  fcvt.s.w     fa5, a1
                  sub          s4, a2, s8
                  mulhu        s1, a7, s8
                  sltiu        s4, t6, 60
                  fmul.s       ft4, ft10, fs1
                  srli         ra, a4, 24
                  fsub.s       ft2, fs4, fa4
                  fmul.s       ft9, fa2, ft2, rne
                  fdiv.s       fs4, ft7, fs8, rtz
                  slti         ra, s6, -974
                  sltiu        s5, t5, 232
                  sltiu        s1, a1, 1344
                  rem          s6, t1, s11
                  remu         ra, a7, a4
                  andi         ra, t3, -851
                  fsgnjx.s     fs1, fs3, ft10
                  sltiu        a0, s4, 411
                  add          s6, t5, s5
                  xor          s0, s1, tp
                  or           s2, t3, s11
                  flt.s        s11, ft3, fs8
                  fdiv.s       fs4, fa2, fs6, rdn
                  rem          t0, s1, a5
                  fmin.s       fa0, fs8, ft1
                  sltiu        s10, a7, -1243
                  sltu         s5, sp, gp
                  xori         s0, tp, 544
                  mulhsu       s1, s9, s2
                  mulhu        a1, t6, s10
                  xori         s9, a3, 1975
                  fle.s        s8, fs1, fs8
                  div          s5, s11, a4
                  fcvt.s.wu    ft8, t6
                  srai         sp, a6, 26
                  fdiv.s       fa0, ft0, fs5, rdn
                  fmv.w.x      fs3, t1
                  fsgnjn.s     ft1, fs10, fs11
                  or           t3, ra, s0
                  addi         sp, t3, -919
                  add          ra, s5, s11
                  xori         t4, s11, -1079
                  xor          t4, s3, a4
                  slt          s4, s7, tp
                  xori         a6, t1, -905
                  mulhsu       s7, s9, t0
                  fsgnj.s      ft0, fs7, fa2
                  fcvt.s.w     fs5, s4
                  fcvt.s.wu    fs7, t0, rne
                  fsgnjn.s     fa3, fs8, fa1
                  fcvt.s.wu    ft8, t0
                  fsgnjx.s     fs6, fa7, ft4
                  xori         t4, tp, 535
                  mulhu        s7, s0, t6
                  srai         s10, t1, 0
                  fsgnjx.s     ft1, fs9, fs5
                  slli         a7, s10, 15
                  fsub.s       fs10, ft7, ft2, rtz
                  mulhu        s9, t0, a0
                  flt.s        s1, fs11, ft11
                  fcvt.wu.s    s1, fs7, rtz
                  fcvt.s.w     ft0, a4, rmm
                  ori          a6, a0, 635
                  div          zero, t5, a0
                  fsub.s       ft5, fs10, fs11
                  fmin.s       fs1, ft10, fs3
                  andi         s11, a1, -10
                  fadd.s       fs11, fa3, ft0, rtz
                  slt          t1, t4, t6
                  slti         a0, a0, -1080
                  ori          s3, a4, 141
                  mulhsu       a1, t0, tp
                  sltiu        s1, a3, 1923
                  sll          s10, t0, t2
                  xor          s7, s4, a1
                  fsgnjx.s     fa6, fs7, fa6
                  divu         t4, sp, ra
                  mulh         a2, s2, a0
                  flt.s        t0, ft1, fs1
                  mulhsu       a7, t0, ra
                  srli         s7, s3, 16
                  and          a6, t4, t4
                  xor          s1, s3, t1
                  feq.s        s4, ft11, fs8
                  fcvt.wu.s    a2, ft9, rdn
                  sltu         a1, a3, s5
                  fmin.s       fs4, fa3, ft4
                  fmul.s       fs4, ft11, ft7, rne
                  sltiu        t0, a3, -1963
                  lui          a6, 107577
                  fcvt.wu.s    zero, fs5
                  mulhsu       gp, a6, a3
                  sltu         s8, s5, sp
                  rem          a3, t1, t4
                  fcvt.s.w     fa3, s11
                  slli         s9, a6, 2
                  fadd.s       ft5, fs3, fs2, rne
                  fcvt.wu.s    s3, ft2, rne
                  sltu         t2, s4, a7
                  fclass.s     t3, fs3
                  divu         gp, t4, zero
                  mulhu        t0, zero, zero
                  fcvt.s.wu    fs7, s8, rmm
                  mul          zero, s7, t3
                  xor          a6, tp, a0
                  divu         s10, t5, a1
                  rem          t6, gp, t4
                  fmax.s       fa4, ft2, fs9
                  sll          s7, s10, sp
                  srli         zero, s9, 25
                  div          gp, tp, t4
                  fmax.s       fs11, fa5, fs1
                  fmv.w.x      ft5, ra
                  fsub.s       fs6, ft11, fa4
                  sltu         a6, a5, a6
                  xori         t4, t1, 211
                  fle.s        s5, fa6, ft11
                  xori         a4, t6, -738
                  fclass.s     a0, fa5
                  fmv.x.w      s11, fa3
                  xori         t4, a7, -464
                  remu         a4, t1, tp
                  mulh         a7, s8, s11
                  div          s7, t6, t1
                  sra          a1, s1, s4
                  rem          a1, s9, t6
                  srl          t6, s5, a5
                  fsub.s       ft9, fa2, ft2, rtz
                  add          t2, s5, a5
                  fmax.s       ft9, fs6, ft0
                  mulh         a0, a3, s9
                  rem          ra, s0, s7
                  nop
                  sltiu        s7, t0, -756
                  sub          t0, zero, a0
                  mul          a6, tp, s5
                  slti         ra, a3, 1588
                  fmin.s       ft9, ft2, fs11
                  fcvt.s.wu    fs8, t6, rne
                  fmul.s       fs0, fs7, fs0
                  rem          s3, zero, a7
                  fadd.s       fs10, fs11, ft1, rmm
                  srli         t4, s0, 29
                  fsgnjn.s     fs7, fs1, fs10
                  fsgnjx.s     fs7, fs2, fa5
                  fmax.s       ft5, fs4, fs6
                  sltiu        t2, t4, 187
                  sltu         s10, tp, t2
                  srl          s0, tp, a7
                  div          s0, sp, s2
                  fcvt.s.wu    ft5, t0, rtz
                  fsgnjn.s     fa0, fs9, fa5
                  rem          s11, t1, t4
                  auipc        s1, 965704
                  fmv.x.w      ra, fa4
                  or           t0, ra, t1
                  fclass.s     t2, ft6
                  fcvt.wu.s    t2, fs9
                  slli         t0, s7, 3
                  fsgnjn.s     ft6, ft9, fs6
                  xori         sp, s1, -1313
                  sra          a0, a5, s1
                  srli         a2, gp, 1
                  slli         gp, s7, 18
                  remu         s9, zero, a7
                  srl          a2, s8, s8
                  mulhsu       s11, zero, a6
                  or           t1, t1, s3
                  fmv.w.x      fs6, t5
                  xor          s9, s10, t1
                  fmv.w.x      ft4, t2
                  fcvt.wu.s    sp, fs6
                  sll          a2, t6, s11
                  or           t4, a5, s7
                  nop
                  divu         t6, ra, t1
                  or           a3, s11, a3
                  fsgnjn.s     fs1, fa6, fs2
                  fcvt.wu.s    s1, ft2, rdn
                  sub          s10, s11, s11
                  mul          a2, a2, t6
                  fsub.s       fa1, fs2, fs8, rmm
                  srli         t2, t4, 7
                  andi         s8, s4, -2028
                  mulhsu       sp, a2, zero
                  fadd.s       ft0, ft0, ft4, rdn
                  mulhu        t0, s8, a7
                  sltiu        zero, sp, -1941
                  srl          a2, a7, s3
                  fsgnjn.s     fs9, fa5, fa4
                  slt          s6, gp, s10
                  mulhsu       t2, a5, ra
                  addi         a7, a5, -1409
                  sra          s7, s4, t1
                  feq.s        sp, ft3, ft11
                  fmul.s       fa2, fa7, fs5, rdn
                  feq.s        a3, ft9, fs5
                  and          s5, s5, zero
                  fmul.s       ft3, fs11, fs3
                  srli         s4, s0, 29
                  remu         t2, t5, s5
                  div          s6, a4, s10
                  sub          a6, s1, gp
                  srai         s10, tp, 15
                  divu         t0, s1, s9
                  srli         sp, s11, 2
                  div          a1, a1, s6
                  sltu         t2, s10, s8
                  fsgnj.s      fs10, ft8, ft2
                  sub          s5, s11, t2
                  fcvt.w.s     t0, fs8, rdn
                  auipc        a1, 555149
                  mulhsu       s10, s7, s8
                  ori          a3, a6, -1929
                  fdiv.s       ft10, fa1, fs4
                  div          s5, t5, t5
                  fcvt.wu.s    t3, ft11
                  fmv.w.x      ft6, t0
                  fsgnjn.s     fs4, ft5, ft7
                  slt          t4, s4, s6
                  rem          a4, s0, s7
                  fle.s        s6, fa3, fs10
                  slti         a4, a3, 524
                  sub          a2, sp, s3
                  sra          a0, tp, s3
                  mulhu        s6, s2, ra
                  fsgnjn.s     fa6, fs7, fa6
                  fcvt.s.wu    fa6, s7
                  fcvt.w.s     s5, ft9
                  fsub.s       fs4, fs0, fa4, rmm
                  sra          ra, sp, a6
                  fmin.s       fs7, ft3, ft9
                  fmv.x.w      s5, fa5
                  mulhsu       a3, s10, zero
                  fcvt.wu.s    t4, ft11, rdn
                  srli         s4, t4, 2
                  fsqrt.s      ft4, fs7
                  fle.s        s11, fs6, fs7
                  sltiu        s2, s2, 1563
                  nop
                  srl          s5, a0, a2
                  fsgnj.s      ft7, fs11, ft11
                  fclass.s     sp, ft3
                  div          s1, t5, s7
                  srli         t6, sp, 19
                  addi         s3, s9, 393
                  slt          t1, a0, a1
                  fcvt.wu.s    s2, fa0, rne
                  fmul.s       fs10, ft8, fs10, rmm
                  fmv.x.w      a6, fs1
                  fadd.s       ft7, fa0, ft8
                  mulhsu       s4, a5, a7
                  fmv.x.w      a6, fs3
                  fclass.s     s3, fa7
                  sll          a2, t0, a3
                  auipc        a4, 432593
                  and          s3, ra, a0
                  nop
                  and          s8, s2, a6
                  fclass.s     zero, fa0
                  sll          t3, a0, t2
                  mulh         s9, t5, s4
                  slt          a2, s1, t6
                  fcvt.s.w     fs0, s6, rdn
                  sra          a0, s7, s2
                  sltu         a3, s9, s0
                  mulhu        t3, t6, a2
                  fsub.s       fa3, fa2, ft4, rtz
                  fmul.s       ft3, ft6, ft6, rup
                  slt          s3, t3, gp
                  slli         s5, sp, 10
                  addi         t3, a6, -1180
                  mulhu        s10, t4, t0
                  mulh         a1, s8, gp
                  fsub.s       ft2, ft0, fa6
                  fmax.s       fs8, fs5, fa1
                  mulhsu       t0, s2, s4
                  fmax.s       ft3, fa6, fs1
                  fclass.s     s1, fa7
                  addi         t0, s8, -1067
                  fsgnj.s      fa2, fs0, fa7
                  sra          a2, t1, ra
                  fsub.s       fa4, ft10, fs4
                  or           t0, t6, t3
                  xor          s7, s6, s10
                  ori          s2, s9, 364
                  addi         sp, s5, 672
                  ori          a6, s10, -1039
                  or           a4, t0, s2
                  andi         s10, t1, 450
                  slt          t3, s8, s5
                  divu         gp, a4, ra
                  add          t4, s3, s2
                  auipc        a1, 432274
                  add          sp, s1, s6
                  mulh         t6, s11, s2
                  fcvt.s.wu    fa4, s4, rdn
                  fcvt.wu.s    ra, fs7
                  slti         a6, s6, -625
                  addi         t4, s5, -295
                  fsub.s       fs5, fs9, fs2, rup
                  rem          t1, t5, a7
                  auipc        t4, 804268
                  xor          s7, s5, s2
                  fdiv.s       fs10, fa6, fs2, rdn
                  ori          t6, t0, 1988
                  remu         t3, s5, a0
                  mul          t2, a0, s5
                  auipc        s10, 945131
                  fcvt.s.wu    fs7, t0, rmm
                  or           t0, zero, t5
                  fmax.s       ft0, ft6, fa0
                  add          zero, a4, s4
                  srl          a0, t4, s8
                  remu         s3, s6, sp
                  slt          zero, s6, s0
                  fmin.s       fs5, fs11, ft5
                  sub          s11, s5, a2
                  or           s2, s5, t3
                  sltu         s10, a5, t0
                  xori         s7, s0, 599
                  flt.s        s4, ft2, ft0
                  or           s2, s6, t1
                  fmul.s       fa1, fs4, fs2, rmm
                  divu         s5, s11, s2
                  fmul.s       fs6, fs10, fs0, rdn
                  nop
                  lui          s0, 1046362
                  ori          a1, s8, 371
                  nop
                  fmv.x.w      a1, ft0
                  fsqrt.s      fs2, fa6
                  fle.s        t1, ft4, fs8
                  and          s9, s9, s0
                  sra          s1, sp, t1
                  fcvt.wu.s    t4, fs9
                  sltu         s9, s9, tp
                  fmax.s       fs1, fa1, fa4
                  lui          t1, 957108
                  sltiu        ra, s4, 871
                  div          a1, sp, s4
                  feq.s        a0, ft9, ft5
                  ori          ra, t5, -545
                  remu         gp, t3, t2
                  fmax.s       fa4, fs5, fa3
                  fsgnjn.s     ft3, ft8, ft6
                  flt.s        t6, ft3, ft5
                  sll          t6, t3, s7
                  fsqrt.s      ft7, ft2, rdn
                  fsub.s       ft10, ft2, ft6, rne
                  fmax.s       fa0, ft4, fa7
                  or           a0, a6, s0
                  fcvt.s.wu    ft6, t5
                  or           t3, s4, a7
                  andi         sp, ra, -1261
                  srl          t4, a6, s2
                  fclass.s     a1, ft10
                  fmin.s       ft9, ft8, fs9
                  fmul.s       fs8, fs9, fs0
                  fadd.s       ft1, fa4, ft8
                  fle.s        s2, fs6, fs9
                  sltiu        a6, t5, 1830
                  fcvt.s.wu    fa6, s10, rmm
                  fadd.s       ft10, fa5, ft6, rtz
                  nop
                  ori          s10, t4, -146
                  fmin.s       fs10, fs8, ft1
                  flt.s        s9, fa4, fs3
                  srli         a4, s8, 10
                  fmul.s       fs4, fs0, ft0
                  slli         zero, tp, 1
                  fsgnjx.s     ft11, fs0, fa0
                  srai         s9, a4, 22
                  fsub.s       ft1, fa5, fa2
                  fmin.s       fs7, ft11, fs7
                  xor          s6, a5, a3
                  slti         t2, t3, -2034
                  fmv.x.w      s10, fs2
                  flt.s        s6, fs10, fa1
                  mulhsu       a1, s10, s10
                  fmv.w.x      fa3, a2
                  fcvt.s.w     fa4, gp
                  slli         a0, a6, 31
                  sltiu        a7, t3, 1030
                  fmin.s       fs3, fs6, ft6
                  andi         t3, a7, -1744
                  remu         a3, tp, a0
                  mulhu        a7, t3, s0
                  fle.s        a0, ft3, fs7
                  xori         s5, a2, -973
                  sll          s2, a5, s0
                  or           s10, t5, a6
                  fcvt.s.w     fs1, gp, rup
                  add          a1, tp, t3
                  srl          gp, t2, a6
                  fadd.s       ft3, ft2, fs4
                  divu         a2, s11, t6
                  fclass.s     t1, fs9
                  flt.s        s3, fs11, fs9
                  feq.s        a2, ft3, fs0
                  fsqrt.s      fa6, fa3, rdn
                  or           a4, s6, s1
                  ori          a2, s7, 1267
                  fmv.w.x      fs2, s6
                  sll          s0, t3, gp
                  srli         a0, t2, 23
                  fclass.s     s10, fa4
                  ori          a6, a1, 251
                  mulhu        a2, tp, gp
                  fclass.s     s4, ft3
                  fsgnj.s      fs0, ft8, fs7
                  fcvt.wu.s    s6, fs9
                  fmin.s       fa3, fa5, fa1
                  fcvt.w.s     t1, ft7
                  sltiu        s6, t1, -883
                  fmin.s       fs8, ft6, ft10
                  ori          a7, sp, -1296
                  or           s3, a2, s10
                  sltiu        gp, s8, -644
                  fdiv.s       fs5, ft1, ft1
                  divu         t0, s9, s9
                  add          s11, a5, s4
                  fsqrt.s      fa4, fs7, rdn
                  sub          a6, a0, zero
                  fmax.s       fs0, fa7, fs3
                  and          a4, s11, sp
                  fsgnjn.s     fa1, fs0, ft5
                  fmax.s       ft0, ft4, ft5
                  lui          s4, 387777
                  fcvt.s.w     ft2, t6
                  fsgnjx.s     ft5, fa7, ft8
                  fsub.s       fs9, fs6, ft4, rne
                  and          s9, t4, ra
                  fcvt.s.w     fs6, s2
                  mulhu        t2, zero, a7
                  sub          s6, zero, s2
                  fmax.s       ft4, fs4, fs5
                  feq.s        s3, fs10, fa1
                  and          s3, a0, zero
                  fadd.s       fs5, ft2, fa0, rup
                  fadd.s       fs7, ft8, ft9, rup
                  slli         s0, s10, 28
                  fmul.s       ft10, ft7, ft10, rne
                  slli         s10, s10, 4
                  div          a1, s9, a4
                  sra          a4, s1, s7
                  div          a6, a7, tp
                  fcvt.s.w     fa2, t4, rdn
                  divu         s8, s3, s11
                  srl          s7, s2, s8
                  andi         s7, ra, 65
                  auipc        gp, 724330
                  fmin.s       fs9, ft11, fa0
                  fclass.s     s6, fa1
                  fcvt.wu.s    t4, ft0
                  auipc        s0, 657313
                  mulhsu       t2, a4, s5
                  fcvt.wu.s    a6, ft9, rdn
                  ori          s5, s8, -149
                  xori         s6, s6, -858
                  xori         s9, s8, -1678
                  lui          t1, 851399
                  fmul.s       ft2, ft8, fa5
                  mulh         a1, t2, s2
                  fmv.w.x      ft9, t5
                  fsgnj.s      fs5, fs5, ft0
                  or           ra, gp, tp
                  slti         s5, s1, 855
                  srl          a2, t1, s0
                  addi         s7, a2, 2009
                  fmv.w.x      ft2, s6
                  srl          s8, a5, s10
                  fsgnjx.s     fs2, ft5, fs8
                  fmv.x.w      s4, ft1
                  fmax.s       ft4, ft4, ft0
                  sll          s1, sp, a5
                  sll          a6, a5, a0
                  fsgnjn.s     fs7, fs5, fa3
                  fmv.w.x      fs0, t2
                  slli         s2, t6, 21
                  auipc        a0, 55493
                  fsgnj.s      ft2, fs7, ft0
                  xori         s8, tp, 1913
                  mulhu        a1, a5, s5
                  remu         a4, s1, s9
                  srai         t1, zero, 4
                  sltu         a2, a4, s8
                  fcvt.s.wu    fs10, ra
                  fclass.s     s6, ft11
                  add          s7, zero, s1
                  fsgnjx.s     fs9, fs6, ft11
                  fsgnj.s      fs10, ft2, fs10
                  flt.s        s10, ft5, fs6
                  fsqrt.s      ft0, ft10, rmm
                  xor          s4, a7, t3
                  slli         a4, s11, 21
                  mulh         ra, gp, s7
                  srai         t2, t3, 28
                  rem          gp, s6, t1
                  fmul.s       fa5, ft4, fs7
                  add          t6, t1, t4
                  srl          t0, a2, s10
                  fsub.s       fa3, ft4, ft5
                  mulhu        s6, t0, a2
                  fcvt.s.wu    ft4, t3
                  slt          t6, s5, a1
                  sll          s7, s6, a4
                  fcvt.wu.s    zero, fa3, rtz
                  fmul.s       fa6, fa2, fs2, rtz
                  fdiv.s       fs5, fs6, fa3, rdn
                  mulhu        a3, t1, s0
                  fsgnjn.s     ft10, fs7, fa5
                  xor          s8, sp, s10
                  fsub.s       fs4, fs11, ft11, rne
                  fsqrt.s      fa0, ft1, rtz
                  fmv.x.w      a2, fs1
                  ori          a4, ra, 1357
                  srli         t1, s5, 7
                  sltiu        ra, t3, 182
                  fle.s        t0, ft11, fs8
                  fcvt.s.w     fs7, a7
                  fcvt.w.s     s8, fs10, rup
                  fmv.x.w      t0, fs2
                  fsqrt.s      fa1, ft6, rdn
                  fsub.s       ft1, fa2, ft10, rdn
                  nop
                  fadd.s       fs7, ft8, ft8
                  slti         s7, s0, 1574
                  and          s10, t4, s10
                  slti         zero, sp, -829
                  sltiu        a6, s3, 63
                  srli         t0, t3, 0
                  fsgnj.s      fs0, ft10, ft11
                  fmin.s       ft0, fs0, fs1
                  srli         s4, s5, 12
                  fsgnjn.s     fs2, fa2, ft10
                  feq.s        s7, ft1, ft7
                  mul          zero, s0, s2
                  slt          s6, a5, a1
                  remu         sp, gp, s0
                  fsgnjn.s     fa2, fs4, fs3
                  divu         s4, s9, s5
                  srl          t1, tp, s8
                  sltu         s7, t3, t6
                  fsub.s       ft1, ft0, ft11, rmm
                  xor          a4, t0, a6
                  fsgnjx.s     fs4, fa1, fa1
                  fadd.s       fa4, ft6, ft1, rtz
                  sltiu        t4, a6, -931
                  fle.s        gp, fs3, fa0
                  mulhsu       s11, s9, t3
                  fsgnjx.s     ft2, fa6, fa3
                  slt          s7, s0, s6
                  fcvt.w.s     a3, ft4
                  nop
                  fcvt.wu.s    s11, fs3, rtz
                  and          s5, a4, s9
                  fle.s        a2, fs7, fa7
                  feq.s        s3, fs7, fs5
                  ori          t4, s7, 870
                  srli         s10, a4, 6
                  slli         s2, a6, 31
                  sub          gp, zero, a4
                  fadd.s       fa1, ft1, fa5
                  flt.s        a6, fs2, ft0
                  div          s5, s4, t4
                  xor          a7, s1, tp
                  and          zero, s7, a7
                  fmin.s       fa3, fs5, fs0
                  feq.s        t3, ft11, fa2
                  sra          s11, zero, tp
                  fadd.s       ft2, ft3, fs0, rtz
                  mulh         t2, s4, zero
                  mulhsu       t3, gp, t2
                  fcvt.wu.s    a0, fs4
                  sll          s7, t4, tp
                  srai         a7, a2, 20
                  fcvt.s.w     ft6, t3
                  fmv.x.w      t0, fs1
                  mul          t6, t3, s2
                  fcvt.wu.s    t4, fa7, rne
                  mulhu        s3, s2, a1
                  fsgnjx.s     fs8, fs0, ft0
                  fcvt.s.w     fs10, t0, rmm
                  feq.s        a6, ft11, ft10
                  slti         s0, t0, 191
                  ori          a0, ra, 1436
                  andi         sp, t5, -1156
                  xor          s6, t1, sp
                  nop
                  lui          zero, 714469
                  sub          t6, a2, t1
                  feq.s        a6, fa2, fs3
                  fdiv.s       fa2, ft11, ft7, rtz
                  fmax.s       fs1, ft4, fa0
                  fmv.x.w      s0, ft10
                  mulh         s2, s8, s2
                  slt          s5, s0, a0
                  fle.s        zero, fa5, ft11
                  fmv.w.x      fa1, s4
                  fcvt.wu.s    sp, fs2
                  fcvt.wu.s    a7, ft8
                  addi         s8, s2, -1855
                  fadd.s       ft9, ft5, fs9
                  fsgnjx.s     fs8, fs3, ft9
                  addi         s7, a2, -787
                  mulhsu       gp, s9, s11
                  mulh         ra, zero, ra
                  srli         s3, s8, 23
                  sltu         s7, s5, t1
                  fclass.s     s2, ft11
                  div          t2, t1, s7
                  ori          t0, a2, -534
                  sltiu        a6, s0, -1543
                  slt          s6, s2, t4
                  fsgnjx.s     fa1, ft6, fa6
                  lui          s11, 170441
                  fsgnj.s      fs3, ft11, ft6
                  fcvt.s.wu    fs2, s1, rdn
                  srl          a1, s5, t3
                  sra          s4, t3, gp
                  fmax.s       ft11, fs11, fs9
                  fdiv.s       fs1, fs2, fs9
                  fcvt.w.s     s6, ft0, rdn
                  auipc        a1, 316002
                  mul          sp, a1, t3
                  div          gp, s2, s3
                  fmin.s       fa2, fa3, fs2
                  mulhu        a6, s8, a1
                  addi         a2, s2, 953
                  fdiv.s       fa4, fs10, ft4
                  auipc        s5, 747045
                  fcvt.s.w     fs2, s2
                  srai         s2, t2, 3
                  mul          ra, t1, t0
                  slli         t6, s9, 2
                  srl          s0, t6, t2
                  mulh         s1, s7, s10
                  and          a0, s1, a6
                  divu         s8, a5, a0
                  srli         s1, s1, 9
                  fclass.s     gp, ft3
                  lui          s1, 819561
                  slti         zero, s3, 725
                  fsgnjn.s     fs4, fa6, fa1
                  fsgnjn.s     ft11, fs4, ft10
                  fle.s        a7, ft9, fs1
                  fsgnjx.s     ft5, ft2, fa0
                  slli         s8, sp, 22
                  auipc        a6, 382132
                  fadd.s       ft2, ft2, ft2
                  xor          s3, a7, a0
                  fmin.s       fs0, fa0, ft10
                  lui          a3, 319866
                  xor          s11, s6, s1
                  andi         t3, s7, -1347
                  mulhsu       a3, s4, t3
                  fcvt.s.w     ft10, s5
                  andi         s11, t4, 186
                  fsgnjx.s     ft6, fs3, fa7
                  sltu         sp, sp, s7
                  addi         s3, s9, 2004
                  slt          s9, s6, s2
                  fmv.w.x      fs9, ra
                  fsgnjn.s     fs4, fs3, ft7
                  slt          a6, a6, s2
                  fcvt.s.wu    ft10, a4, rup
                  fdiv.s       ft8, fa5, fs2
                  fmv.x.w      t1, fa2
                  fmul.s       ft6, ft11, fs2, rmm
                  mul          t1, t6, a7
                  mulh         a6, a4, a4
                  addi         s9, a6, 1128
                  mul          s9, s0, s0
                  slt          s0, s0, a6
                  slli         s5, s3, 10
                  fcvt.wu.s    t0, ft8
                  fadd.s       fs3, ft5, fa6, rup
                  sll          t0, a6, gp
                  fsgnjx.s     fs1, fa1, fs9
                  fadd.s       ft6, ft0, ft1, rup
                  srli         a7, t4, 20
                  fadd.s       fs11, ft7, fa4
                  auipc        s0, 720651
                  fmv.w.x      ft2, s0
                  fsgnj.s      fs3, fs0, fs11
                  xor          t4, s0, t4
                  ori          t0, a7, -308
                  srai         t4, s7, 13
                  flt.s        sp, fa4, fs9
                  andi         a3, s8, -1645
                  slt          t2, zero, zero
                  lui          t6, 941699
                  fsub.s       fs10, fs10, fa1
                  fmv.x.w      s9, ft0
                  mul          ra, a5, zero
                  addi         a2, t3, -22
                  add          s3, s1, t2
                  or           s9, zero, a7
                  mulhsu       s6, s10, s8
                  xori         s9, gp, 529
                  fclass.s     t6, ft2
                  fmv.w.x      fa7, a6
                  fmv.w.x      ft4, s7
                  div          t6, s4, s4
                  sub          a6, t1, t4
                  fmax.s       fs6, fs4, fs1
                  sltiu        t3, a6, 448
                  xori         ra, t0, 1899
                  slli         t2, s6, 19
                  fsqrt.s      fa6, ft0, rdn
                  mulhsu       zero, t6, gp
                  slt          s3, t1, s2
                  fsgnj.s      ft11, fs3, fa5
                  auipc        s3, 112959
                  fmin.s       fa7, fs7, ft1
                  fdiv.s       fa2, ft11, fa1
                  srl          t4, a3, t5
                  sll          t2, s3, t3
                  andi         t1, t5, 740
                  flt.s        s8, fs0, fs0
                  slli         t3, s7, 30
                  fcvt.s.wu    fs1, gp
                  fmv.w.x      fs5, s9
                  flt.s        s11, fa0, fa1
                  mulhu        gp, a3, a4
                  sra          s2, a4, s3
                  fcvt.w.s     s3, ft7
                  fcvt.s.wu    ft0, a0
                  fsgnj.s      fa0, ft6, ft5
                  mulhsu       zero, a0, s0
                  flt.s        s9, fs7, ft11
                  fmv.x.w      sp, fa2
                  sltiu        t6, s7, -1359
                  fcvt.s.wu    ft4, a7, rne
                  or           t0, s6, s9
                  fcvt.wu.s    a0, fa6, rup
                  feq.s        zero, ft4, fa2
                  addi         s1, a2, 86
                  fsqrt.s      fs1, fa1, rup
                  fcvt.s.wu    fs10, t0, rne
                  sltu         a4, t2, s4
                  sll          s8, s2, a2
                  add          s1, a5, a2
                  fmv.x.w      s4, fs4
                  fcvt.s.wu    fs5, tp
                  fmin.s       fs4, ft2, fs10
                  or           t3, t2, a6
                  xori         s7, a5, 1240
                  fmin.s       fs10, fs9, ft1
                  remu         a7, t0, a4
                  feq.s        s1, ft7, ft3
                  xori         s9, t0, 1154
                  fdiv.s       fs0, ft5, fs5
                  fmin.s       ft1, ft1, ft5
                  sll          s3, gp, ra
                  srl          sp, a3, s8
                  and          zero, t5, t0
                  or           a0, sp, s2
                  fdiv.s       fs5, ft1, fs0, rtz
                  fmin.s       ft11, ft8, fa3
                  sub          s0, a1, s3
                  flt.s        a1, fs6, fs8
                  fmv.w.x      fs9, tp
                  fsgnjn.s     fs7, ft10, ft3
                  slt          gp, ra, t4
                  fsgnjn.s     fs9, fa0, ft9
                  fcvt.s.w     ft0, ra, rtz
                  rem          a4, ra, a7
                  xor          s3, s9, a6
                  fsub.s       fa0, ft4, fa7, rne
                  fsub.s       fs6, fs4, fs5
                  fcvt.w.s     ra, ft4, rdn
                  fadd.s       fs0, ft1, ft1
                  srli         gp, s5, 6
                  mulh         s2, t0, a1
                  fclass.s     a0, fs10
                  lui          s0, 909757
                  srli         t2, s0, 12
                  fsgnjx.s     fs4, fs8, fs2
                  fadd.s       fa2, fa2, ft1, rne
                  addi         a3, s5, -891
                  mulhu        a2, a5, s9
                  sltu         s4, t2, a6
                  feq.s        a7, ft10, fs7
                  slt          a4, s7, s7
                  fcvt.wu.s    s10, fs1
                  mulhu        s8, s4, t2
                  fcvt.wu.s    sp, fs9
                  sltu         s3, t6, sp
                  sltu         t3, a2, tp
                  sll          s1, s10, s0
                  mulh         s10, s4, s6
                  xori         a1, a7, 639
                  mulhu        t4, a6, ra
                  rem          gp, tp, s8
                  fle.s        s9, fa3, fs1
                  fsgnjx.s     fa1, fs0, fa6
                  mulh         s2, sp, tp
                  fcvt.s.w     fa1, s7
                  fcvt.wu.s    a7, fa6, rmm
                  fsgnjn.s     ft2, fs9, fs2
                  fmv.x.w      s1, fs10
                  fsgnjn.s     fs2, fs5, fa6
                  fsqrt.s      fs11, fa7
                  slti         a6, t0, -1226
                  sub          a0, a2, s4
                  srai         s1, t0, 4
                  fsqrt.s      ft0, fs7, rne
                  slli         s1, s0, 7
                  sltiu        s2, t4, 264
                  fcvt.s.wu    fs0, t0, rup
                  fsub.s       ft10, fs6, ft8
                  fmul.s       ft5, ft10, fs2, rdn
                  fmv.w.x      ft10, s10
                  sub          t0, sp, s5
                  fmin.s       fs4, fa6, ft2
                  sltu         s6, t5, t6
                  mulhsu       s0, a7, t2
                  fsgnj.s      fs5, fs6, fa4
                  sub          s4, s4, a1
                  flt.s        a2, fa4, fs11
                  ori          s7, zero, -1907
                  fcvt.s.wu    fs3, s7, rtz
                  slli         t4, s7, 12
                  fsqrt.s      ft0, fs3, rmm
                  remu         t0, s7, s0
                  slt          sp, s11, a4
                  srai         s6, s10, 15
                  fsgnj.s      fa2, fs6, ft11
                  rem          s8, s6, a2
                  fmax.s       ft9, fs10, fs8
                  fcvt.s.w     fs1, ra, rup
                  sltu         a1, t0, s2
                  fsub.s       fs9, fa2, fs8, rdn
                  divu         a7, s11, s1
                  fdiv.s       fs10, fa6, fs2, rne
                  xor          s0, a6, t3
                  divu         a7, t1, gp
                  sub          a3, s1, gp
                  xor          gp, gp, t4
                  sltiu        s7, t4, -1588
                  fmin.s       fs6, ft2, ft7
                  fcvt.s.wu    fs4, s9
                  add          t2, t6, a0
                  sra          t0, a1, gp
                  slti         gp, s8, 417
                  fmul.s       fs11, ft7, ft0
                  rem          ra, a3, s0
                  or           t2, t5, s4
                  sltiu        s0, t4, -490
                  divu         s4, gp, s10
                  mulh         t4, t0, ra
                  or           zero, s5, a0
                  addi         s9, gp, -1401
                  fsgnjx.s     fs3, ft7, ft5
                  flt.s        a7, fs3, fa1
                  addi         s0, a4, 1801
                  lui          sp, 352404
                  lui          a0, 996241
                  xor          zero, a2, a1
                  divu         s7, tp, s5
                  remu         s10, s6, s10
                  or           s11, ra, s11
                  mulhu        a4, s9, a5
                  ori          s7, s8, -1693
                  fcvt.w.s     s5, fs10
                  sra          s5, a0, a0
                  fmul.s       ft11, fa4, ft5
                  fmv.x.w      t4, ft2
                  fsqrt.s      fa7, fa4
                  fclass.s     s7, ft9
                  slt          a6, t6, t4
                  sll          s3, s6, t3
                  or           t3, s5, s2
                  fmv.w.x      ft0, s7
                  fcvt.s.w     ft5, t6
                  fsgnjx.s     fs0, ft5, fa4
                  fmul.s       fs0, fs6, ft5, rne
                  sra          t0, a0, s7
                  xori         s8, s10, 1259
                  srai         a6, a7, 10
                  or           zero, a6, a5
                  fmul.s       ft7, fs2, fs9, rmm
                  xori         ra, tp, 961
                  sra          s3, s10, a4
                  xor          t0, t4, s2
                  slli         gp, gp, 25
                  sltu         ra, zero, s10
                  fadd.s       fs10, fs10, fs1, rup
                  div          a2, a6, a5
                  addi         s10, ra, 1851
                  mul          t1, a1, s10
                  sra          s4, s6, s9
                  or           s0, s6, a4
                  and          s4, t2, ra
                  mul          t0, t2, a3
                  xori         t0, a4, 900
                  mul          t2, a1, a5
                  sltu         s11, s9, a3
                  fdiv.s       fa1, ft9, fa2, rtz
                  add          t3, zero, a3
                  srli         sp, s11, 15
                  fmin.s       fs3, ft4, ft8
                  mulh         s2, t6, s9
                  fcvt.s.w     fs1, t4
                  fsqrt.s      fa3, fs1
                  xori         t1, t2, 1819
                  lui          a4, 873903
                  fmv.w.x      fa6, s10
                  xori         a4, a2, -1163
                  flt.s        a4, fa4, fa7
                  remu         a1, s8, gp
                  fcvt.s.w     ft5, s4, rtz
                  srli         t0, a7, 22
                  xor          a6, s0, a3
                  slli         s11, zero, 15
                  mulh         a7, a7, ra
                  fmv.w.x      fa6, t6
                  xor          s7, t3, s2
                  slli         s8, s11, 28
                  fle.s        a3, fs9, fs7
                  sltu         s10, a0, s5
                  divu         zero, s10, sp
                  mul          a0, s3, tp
                  fmin.s       fs3, fa0, fs4
                  fsgnjx.s     fa6, fa5, ft6
                  fcvt.wu.s    s6, ft0
                  sra          ra, t3, tp
                  fmul.s       ft4, ft8, ft8
                  sra          gp, a3, s9
                  fsgnjx.s     ft6, fa0, fs3
                  srai         s8, s8, 23
                  srl          a6, t3, t6
                  fmul.s       fs11, fs2, fs2
                  xori         s6, t5, -1470
                  srli         t3, s1, 21
                  fclass.s     a4, fa5
                  nop
                  fsgnjx.s     ft4, ft3, fa6
                  sll          zero, t5, ra
                  ori          a7, s9, -1921
                  fsgnjn.s     ft4, fs1, fs10
                  slli         ra, zero, 24
                  lui          a6, 71834
                  nop
                  fmul.s       fa4, fs2, ft1, rne
                  rem          a7, s4, s11
                  sll          s6, sp, a4
                  rem          t4, sp, a0
                  fle.s        t2, ft0, ft10
                  xor          s2, t0, tp
                  fsgnjn.s     ft10, ft8, ft5
                  rem          s5, s10, gp
                  fmul.s       fs3, fs5, fs10, rdn
                  mul          a4, ra, ra
                  remu         sp, t2, zero
                  sll          s2, s8, zero
                  fsub.s       fa4, fs6, fa6, rne
                  fsgnjx.s     fs2, ft2, ft6
                  nop
                  fmv.x.w      s10, ft9
                  srl          s3, a5, t2
                  fcvt.s.wu    fs2, s8
                  and          s2, s10, t2
                  srl          s4, s1, tp
                  fmax.s       fs7, ft6, fs11
                  fsqrt.s      ft4, fa7, rup
                  fsgnj.s      ft7, fs4, fa0
                  slli         a0, zero, 17
                  sll          a7, s9, a5
                  fdiv.s       ft2, ft5, ft2
                  srai         t0, a1, 27
                  remu         t0, s9, gp
                  remu         t6, s1, s5
                  fcvt.w.s     t0, ft7
                  srai         a2, t0, 28
                  remu         a1, a3, s9
                  feq.s        zero, fa2, ft2
                  lui          t2, 544585
                  sll          sp, sp, a6
                  addi         a7, s2, -1127
                  feq.s        s9, fs10, fs6
                  fcvt.wu.s    t4, fs1
                  fsub.s       ft1, fs5, fa4, rdn
                  sll          s4, s8, t6
                  nop
                  fadd.s       fa3, ft10, ft1
                  fcvt.s.w     fa4, ra
                  add          s3, ra, s11
                  fclass.s     a1, fa1
                  srli         a7, s1, 29
                  fmv.x.w      zero, ft2
                  lui          a6, 973214
                  sll          s0, a3, t5
                  nop
                  add          a4, s6, gp
                  fsgnjx.s     ft1, fs5, fs2
                  slt          s0, t1, ra
                  sltu         gp, a2, a7
                  sltu         t2, a2, s6
                  fcvt.w.s     s1, ft2
                  feq.s        ra, ft0, fs5
                  fsqrt.s      fs11, fs1
                  fmul.s       fa5, ft6, fs6, rdn
                  fsub.s       fs10, fs7, fs3, rmm
                  sltu         t6, a1, a4
                  andi         s8, t3, 847
                  and          ra, zero, s10
                  nop
                  add          s3, s1, t3
                  fadd.s       fa7, ft7, fs1, rne
                  auipc        s1, 506138
                  srl          sp, s5, s9
                  fmax.s       fs11, fs2, fa2
                  div          s9, a2, a4
                  remu         sp, a2, t1
                  fmin.s       ft1, fa0, ft1
                  slli         s9, a0, 12
                  remu         a2, s9, a3
                  fsgnj.s      fa1, fs1, fa4
                  fmul.s       ft5, ft11, fs1
                  divu         a0, tp, a6
                  fcvt.s.w     fs4, a2, rtz
                  remu         a4, t1, t6
                  fcvt.wu.s    t6, ft1, rne
                  fsgnjx.s     ft10, ft6, fa5
                  fadd.s       ft4, fa4, fs3, rdn
                  srli         a6, t5, 10
                  div          s11, s7, s4
                  sub          a1, a2, t0
                  ori          a0, s9, -679
                  srl          t2, s10, a3
                  sll          a2, t3, a4
                  fsub.s       ft6, ft10, fs2
                  srai         a4, a7, 7
                  fmul.s       fs11, ft3, ft10, rtz
                  mulhu        a4, s6, s2
                  srli         a3, s9, 12
                  mul          t4, t4, a7
                  xor          sp, s10, s2
                  nop
                  andi         ra, s1, -604
                  mulhu        t6, t3, a6
                  fsqrt.s      fs3, fs9, rup
                  ori          t3, tp, -517
                  rem          a4, s1, a2
                  remu         t1, s4, s3
                  srai         s9, a1, 24
                  fclass.s     s3, fa1
                  lui          t6, 53414
                  fsgnj.s      fa5, fs0, fa7
                  nop
                  mulhsu       s6, a6, a5
                  fadd.s       fs10, fa0, fa0
                  fmax.s       fs9, fa0, fs6
                  fmul.s       fs9, fs0, ft0
                  fmax.s       ft10, fa3, fs1
                  fcvt.s.wu    fs7, t4, rne
                  sltiu        a3, a2, -1068
                  feq.s        a0, ft2, ft4
                  sub          s2, t0, tp
                  srl          a0, s2, s8
                  sltiu        zero, a7, 947
                  flt.s        s10, fa4, ft1
                  and          t4, a4, a7
                  mulh         s1, t1, s1
                  fmin.s       fs11, ft6, ft4
                  fsqrt.s      fs1, fs2, rdn
                  srli         a6, s2, 2
                  mulhsu       s1, s3, gp
                  and          ra, s3, a1
                  lui          t4, 487850
                  fdiv.s       ft3, ft5, fa4, rmm
                  srl          a0, ra, t5
                  sub          ra, a2, t0
                  fmin.s       fa3, fs9, ft0
                  mulhsu       t1, a0, t1
                  fle.s        s4, fs11, ft3
                  fmv.x.w      s6, fs1
                  fadd.s       ft5, ft5, fa6, rtz
                  fclass.s     ra, ft1
                  lui          t6, 804107
                  fcvt.s.w     fa1, a3, rmm
                  ori          gp, t2, -743
                  andi         t4, s9, 1355
                  nop
                  fdiv.s       fa5, fa1, ft5
                  lui          t3, 606290
                  nop
                  srai         t3, a6, 0
                  fclass.s     s2, ft1
                  slt          gp, s3, sp
                  xor          a1, a4, zero
                  fcvt.wu.s    ra, ft4
                  divu         s6, t6, a6
                  fsqrt.s      ft7, fs10
                  div          t2, a6, a0
                  fcvt.wu.s    s5, fa1, rdn
                  or           a7, s3, a4
                  mul          s6, a6, s11
                  add          t0, zero, a6
                  mul          t0, t5, s9
                  and          a7, t3, s3
                  rem          ra, s4, a3
                  srli         t3, t3, 31
                  fclass.s     t1, fs5
                  ori          zero, a3, -947
                  fsqrt.s      fa7, ft3, rtz
                  srl          t3, s6, a5
                  flt.s        s2, fs4, fs3
                  auipc        s5, 440485
                  slti         gp, zero, 654
                  flt.s        ra, ft2, ft4
                  ori          t3, s9, -22
                  fcvt.wu.s    a2, fa6, rtz
                  andi         t0, a1, 243
                  srl          s11, a4, s5
                  div          t3, s5, a3
                  mulh         a3, zero, s1
                  fcvt.wu.s    s11, fs11, rup
                  slli         gp, a7, 12
                  mulhu        a7, s4, a0
                  feq.s        s6, ft4, ft1
                  slt          s10, tp, s4
                  or           s5, a4, s5
                  fcvt.w.s     a3, fs2, rne
                  div          s10, zero, t3
                  slt          a7, a1, s5
                  auipc        s0, 373669
                  xor          s2, ra, s2
                  fmax.s       fa4, fa0, ft3
                  fdiv.s       ft6, fs6, ft8
                  slti         a3, t2, 1906
                  mulh         a7, a3, s7
                  srl          t1, t6, sp
                  ori          s11, sp, -1816
                  fmax.s       ft4, ft8, fa2
                  xor          t4, s9, a7
                  fcvt.wu.s    s7, ft6, rmm
                  fdiv.s       fs11, ft7, fa0, rmm
                  fadd.s       fs0, fs5, fs11
                  feq.s        s4, ft4, ft1
                  fle.s        t6, fs0, fs6
                  div          s7, t1, s9
                  and          s8, s3, a0
                  fclass.s     s2, ft0
                  lui          t2, 1028852
                  fadd.s       fa6, fa4, fs3, rdn
                  sltiu        s4, t5, -1200
                  fsub.s       fs6, fa6, fs0
                  and          zero, s3, gp
                  div          s3, s4, t0
                  div          ra, tp, s4
                  lui          a6, 708355
                  fmul.s       fa2, fs1, ft7
                  fdiv.s       fs1, ft2, fs6
                  andi         a6, s11, -1942
                  mul          sp, s4, s2
                  fmul.s       fs5, fa2, ft10
                  sub          t6, s5, s5
                  srli         s10, s7, 12
                  slt          s6, t4, a1
                  fadd.s       fs3, fs9, ft9, rtz
                  remu         sp, a1, s9
                  and          t4, s3, tp
                  fsub.s       fs10, ft9, fs11, rmm
                  flt.s        a2, ft2, fs9
                  slt          gp, tp, s10
                  lui          s3, 498682
                  feq.s        s10, fa7, ft11
                  srai         s8, s2, 10
                  fadd.s       ft7, fs6, ft1, rup
                  mulhu        s8, s11, a5
                  sra          a6, s9, a0
                  fcvt.w.s     s7, fa6, rtz
                  add          t1, a4, ra
                  mul          a4, s8, a5
                  fmv.w.x      ft10, s0
                  fdiv.s       fa7, fs6, fa4
                  sltu         s4, zero, s4
                  div          t2, s0, s2
                  lui          s0, 66583
                  mulhu        a4, ra, s2
                  fle.s        s0, fs5, fs9
                  remu         a7, tp, s5
                  fcvt.s.w     fa7, s8
                  ori          s8, t6, -919
                  fsqrt.s      fa6, ft1, rup
                  fmv.x.w      s1, ft0
                  or           t6, a5, t2
                  remu         ra, zero, a0
                  and          s9, gp, t0
                  nop
                  xor          s4, a6, s7
                  fmul.s       fa3, ft0, fs1
                  fmax.s       fs3, fa5, fs4
                  add          a1, a1, gp
                  flt.s        s9, fs0, fa0
                  fsub.s       fa1, fs10, fs9, rmm
                  nop
                  srai         t0, s4, 12
                  add          a2, s0, s6
                  mulhsu       t6, t4, tp
                  fadd.s       ft4, ft10, fa5, rdn
                  fmul.s       fa2, ft4, fs8
                  fle.s        s4, fs4, fs5
                  fmul.s       ft8, fa7, fa1, rmm
                  fmul.s       fa2, ft6, ft0
                  nop
                  fsgnjn.s     fa6, fs5, fs0
                  fmv.x.w      t3, ft5
                  fmul.s       fs0, fa0, ft5
                  fmul.s       fs10, fs0, fs3
                  fsgnjx.s     ft7, fa5, fa6
                  srai         a3, zero, 21
                  flt.s        t0, ft7, ft8
                  div          s10, s5, a1
                  fle.s        s4, ft10, ft3
                  slti         a3, ra, -1805
                  fcvt.wu.s    ra, ft1
                  fsgnjn.s     ft11, fs0, fa1
                  fmv.w.x      ft8, sp
                  fsub.s       fs5, ft10, ft7
                  mulh         s4, a7, sp
                  fcvt.s.w     fa4, a3
                  slti         s10, a5, 429
                  or           s10, a3, s5
                  fmv.w.x      fa7, gp
                  srl          a0, a2, s7
                  fmax.s       fa7, ft0, fa7
                  fmin.s       ft7, ft10, ft3
                  andi         t3, t2, -601
                  rem          s9, a5, s7
                  slt          a7, t2, a7
                  slli         a7, t0, 4
                  fdiv.s       ft10, fs0, ft1, rne
                  fmax.s       ft11, fa2, ft11
                  fmax.s       ft7, fa7, ft1
                  fsgnjn.s     ft7, ft7, ft9
                  fcvt.w.s     s8, fs1
                  fsgnj.s      ft4, fs2, ft2
                  slti         a2, s5, -19
                  mulhu        a7, a0, sp
                  mulh         a6, s0, t5
                  fadd.s       fs9, ft1, fs7
                  srl          a6, t3, t2
                  addi         s5, a5, -822
                  fmin.s       fa2, ft6, ft8
                  flt.s        a0, fa7, ft3
                  div          s2, s1, t5
                  xori         zero, a2, 366
                  srl          s8, t0, t6
                  sltiu        s11, t5, 1506
                  auipc        a3, 636813
                  fadd.s       fa0, fa5, fa7, rtz
                  srai         t1, t2, 23
                  srli         s3, s4, 5
                  fadd.s       ft3, fs5, ft10
                  fcvt.s.wu    ft8, a2, rdn
                  sltiu        s10, s5, 1151
                  slt          a4, s3, s2
                  fcvt.s.w     ft10, s1
                  fmin.s       fa2, ft0, fs9
                  andi         s9, a7, -882
                  flt.s        t2, fs5, fs9
                  andi         a1, t1, 1383
                  sub          s4, t2, a6
                  mulhu        ra, s11, s9
                  fsgnjn.s     fs3, fs8, ft2
                  fsgnj.s      ft9, fs0, fs10
                  lui          sp, 56610
                  fcvt.s.w     fs6, s7, rne
                  add          t2, s4, s8
                  fsqrt.s      fs10, fs0
                  ori          s3, s6, -1266
                  sltiu        s11, t4, -629
                  slli         s8, s6, 31
                  slt          a6, s5, s1
                  xori         s10, t6, 1410
                  srai         t2, s8, 14
                  fmv.w.x      fa7, t4
                  fadd.s       fa1, ft1, fa1
                  fsgnj.s      fa5, fa5, fs5
                  fmax.s       ft2, ft8, ft8
                  fcvt.w.s     ra, fs10
                  srai         s1, t6, 22
                  sltu         s4, t1, a6
                  fmax.s       ft6, ft11, fs1
                  mulhu        s6, zero, s6
                  mulhu        s11, s7, tp
                  srli         t4, s9, 8
                  xor          a4, a3, t5
                  feq.s        s4, ft9, fs5
                  fmin.s       fs10, fs8, ft10
                  fmul.s       fa2, ft2, ft2, rup
                  ori          a1, a5, -1992
                  srli         s2, s6, 7
                  fle.s        s9, ft2, fs9
                  sub          a7, s10, s1
                  sltu         t6, s1, a4
                  mulhu        a7, s9, a4
                  fsgnjx.s     ft11, ft9, fs7
                  xori         s9, t6, -234
                  fsub.s       ft7, fa4, ft3
                  sltu         s5, a1, s1
                  mulhu        t0, s5, t6
                  fcvt.w.s     sp, fs7
                  sra          s7, a1, zero
                  fle.s        a7, fs9, fs6
                  fmv.x.w      t0, ft3
                  mulh         t0, s8, t2
                  nop
                  xori         s9, a0, 9
                  sub          s8, s9, s2
                  mulhsu       s9, s11, t2
                  sub          s3, s8, t4
                  srai         t2, s11, 15
                  mulhu        t2, a0, zero
                  nop
                  fmul.s       ft9, fa5, fa2
                  sltu         s7, a7, a1
                  fsgnj.s      fs0, ft7, fs6
                  mulhu        s5, t0, tp
                  fle.s        t1, fa7, fs4
                  fsqrt.s      ft6, fa5, rmm
                  fsgnjn.s     fs11, fs3, fs5
                  fle.s        s5, fs2, fa4
                  andi         a2, s7, 137
                  fle.s        t2, fs4, fs1
                  sll          a0, t3, ra
                  or           t1, t4, zero
                  mul          s7, a4, t0
                  fsub.s       fs0, fa4, fs10
                  fsgnjn.s     fs7, fa4, fs5
                  fsqrt.s      fs8, fa6, rne
                  mulhsu       s1, t0, s8
                  andi         s6, t5, 798
                  mul          s3, s0, t3
                  fsgnjn.s     fs5, fa6, fa7
                  fcvt.wu.s    s1, ft10
                  feq.s        a3, ft8, fs2
                  srli         s1, a6, 3
                  remu         s3, ra, s5
                  sub          s11, s2, s8
                  div          t2, s3, a2
                  lui          s3, 643998
                  div          a4, t3, s4
                  fle.s        zero, fs6, ft2
                  srli         a7, a7, 13
                  slt          s11, t1, a0
                  mulhu        gp, a2, s0
                  fmv.w.x      fa6, t6
                  xor          s3, a2, a1
                  srai         s4, zero, 5
                  ori          s3, a6, 1451
                  fclass.s     s4, fs7
                  fsgnj.s      ft11, ft7, fa4
                  divu         t3, a2, t6
                  and          a3, s8, a0
                  div          a0, a1, s11
                  mul          s3, tp, s6
                  div          a2, s4, s4
                  divu         s3, a6, s1
                  fsgnjx.s     ft9, fs6, fa5
                  mul          t1, a5, a4
                  rem          t0, s6, a2
                  srl          t1, tp, a1
                  addi         a6, a6, 1632
                  fcvt.s.wu    fs4, ra, rdn
                  addi         s6, zero, 341
                  sltu         s8, tp, ra
                  or           a7, a0, sp
                  fcvt.wu.s    s7, fs5, rmm
                  sltu         t0, s1, t5
                  div          a6, s2, a0
                  mul          s3, s5, ra
                  fclass.s     t0, ft3
                  auipc        a6, 239771
                  xor          a2, s2, a1
                  fcvt.s.wu    fa6, a2
                  add          t3, a5, a6
                  fadd.s       ft2, fs9, ft5, rdn
                  flt.s        s2, fs6, fs11
                  fmax.s       fs9, ft0, fs7
                  srai         zero, s6, 1
                  andi         t4, s11, 955
                  fcvt.s.wu    ft2, t4
                  fle.s        s10, fs6, fa5
                  remu         s9, s6, tp
                  mulh         sp, t6, t2
                  remu         s0, s7, s3
                  xor          s10, s4, a2
                  fsqrt.s      fa2, fs1, rmm
                  sra          s7, s8, a6
                  fclass.s     s4, fs11
                  fsub.s       fs8, fa0, ft4
                  nop
                  feq.s        ra, fa4, ft8
                  div          s10, s4, t1
                  mul          t2, s4, s0
                  xori         s7, s7, -992
                  feq.s        a0, ft0, ft6
                  sra          sp, t2, tp
                  sltiu        s7, s0, -1097
                  fmv.w.x      ft5, a7
                  fsgnj.s      fs3, fs10, fs3
                  lui          a6, 214286
                  fclass.s     s2, fa0
                  fsgnjn.s     ft3, fs3, fa2
                  nop
                  sltu         s5, s11, sp
                  feq.s        a6, ft3, fa6
                  fmul.s       ft4, ft8, fs6, rne
                  slli         s11, s4, 14
                  or           s1, s9, sp
                  sltu         sp, t2, ra
                  nop
                  fmul.s       ft6, fa1, fa7
                  lui          s6, 412300
                  slli         s1, s4, 31
                  feq.s        a7, fs3, fs9
                  fmin.s       fs8, ft5, ft1
                  div          s2, t3, t1
                  mulh         a1, t1, a6
                  slti         s6, t3, -1692
                  mul          s6, s7, sp
                  fcvt.wu.s    a7, fs6, rne
                  andi         s4, s11, -100
                  and          s5, t0, a5
                  fsqrt.s      fs3, fs3
                  or           t3, s0, a1
                  fmv.w.x      fs9, s1
                  fsgnj.s      ft4, ft7, fs9
                  fmin.s       ft0, ft9, ft11
                  add          s1, t3, a4
                  mulh         t3, a2, t3
                  fcvt.s.wu    ft6, s3
                  fclass.s     s0, fs9
                  slti         a2, s9, 1002
                  sub          a0, ra, t6
                  srai         s1, zero, 16
                  fmv.w.x      ft3, t6
                  fmin.s       ft7, ft6, fs10
                  fmv.x.w      s10, fs4
                  fmul.s       ft10, fa2, ft6
                  fsgnjx.s     fa5, fa7, ft9
                  slti         s4, s11, -804
                  flt.s        s5, fa6, fs7
                  or           s1, s7, gp
                  feq.s        a4, ft11, fa7
                  sltu         t4, t1, t3
                  xor          ra, s6, s1
                  fmv.w.x      ft11, a4
                  feq.s        t3, fs5, ft5
                  ori          zero, s8, -63
                  mulhsu       a7, a5, gp
                  fsub.s       ft11, ft2, fs10, rdn
                  andi         a3, a6, -484
                  slti         s4, s0, -596
                  fcvt.wu.s    a3, ft4, rtz
                  addi         s9, a2, 1848
                  slli         a6, a7, 28
                  sll          s5, a5, s3
                  rem          t0, a4, t5
                  sltu         s5, a6, a1
                  fsqrt.s      fs4, fs11
                  flt.s        a1, fs10, ft3
                  fsgnj.s      ft9, ft8, fa1
                  fcvt.s.wu    ft5, t1
                  feq.s        s5, ft2, fs0
                  mul          gp, s8, s1
                  and          t0, s4, gp
                  fsgnjn.s     fs7, fs8, fa7
                  srai         a3, s0, 31
                  fcvt.s.wu    fa7, tp, rup
                  sra          s9, t0, a7
                  fle.s        s1, ft11, fs9
                  and          s0, s6, s6
                  mulhsu       t2, s3, s9
                  fmv.w.x      fa3, a2
                  xor          t1, s9, sp
                  flt.s        a4, fs4, ft0
                  fsgnj.s      fs6, fa1, fa7
                  sra          t4, a3, ra
                  srl          a4, a7, s5
                  fsgnj.s      ft1, ft1, ft1
                  auipc        s8, 346887
                  fadd.s       ft0, fs5, ft6
                  fle.s        t4, fa6, ft2
                  mulhsu       sp, t1, s2
                  ori          t3, a0, -377
                  fcvt.s.w     fa5, zero, rdn
                  or           sp, t4, tp
                  fcvt.s.w     fs11, s2, rup
                  fmin.s       ft5, ft7, fs0
                  sll          s10, a0, sp
                  fclass.s     s0, ft0
                  fle.s        s1, ft8, ft11
                  and          s0, s8, zero
                  div          a1, t0, t2
                  feq.s        s5, ft4, fa6
                  slli         s9, s7, 18
                  fsgnjx.s     ft11, ft7, fa2
                  fmv.w.x      ft0, tp
                  div          s4, ra, ra
                  fsgnjx.s     ft4, fs2, fs6
                  rem          s7, s6, s4
                  fsqrt.s      fa6, ft6
                  fadd.s       fa6, fs5, fa7
                  fcvt.s.wu    fa6, t0
                  srli         s0, s9, 26
                  remu         a6, a0, t6
                  fmin.s       fa5, ft11, ft7
                  fclass.s     sp, ft2
                  slt          a7, s8, t1
                  fmul.s       fa4, fs3, fs5
                  fcvt.s.wu    ft4, s6, rdn
                  fsgnj.s      fs3, ft11, fs3
                  addi         s3, t2, -1986
                  fle.s        s7, fs6, fa3
                  slli         a7, s8, 13
                  fmv.w.x      fs10, s9
                  nop
                  fcvt.s.w     fs1, s6
                  fle.s        s8, ft1, fs4
                  mul          a1, s5, s11
                  sub          s10, s11, s1
                  nop
                  srai         t6, s10, 30
                  rem          s7, t3, s8
                  fmul.s       fs3, fs4, fa0
                  fsgnjx.s     fa2, fs4, fs9
                  sra          a1, s1, s3
                  fsgnjx.s     fa6, fs5, ft2
                  addi         a7, s0, 1154
                  slli         s11, t3, 20
                  fdiv.s       fa1, fs1, ft8, rtz
                  fadd.s       fa2, fs8, ft7, rtz
                  fsqrt.s      fa7, fs1
                  divu         s8, s5, s0
                  srai         s1, s1, 29
                  slt          t1, a1, s0
                  fsgnjn.s     fs6, fs1, fs5
                  xor          ra, s11, t2
                  mulh         a4, zero, t5
                  fsqrt.s      fs2, fs11, rne
                  add          a4, s8, s4
                  fcvt.s.w     ft10, a5
                  fmin.s       ft10, fs0, ft1
                  feq.s        s8, ft5, ft0
                  fsqrt.s      fs7, ft4
                  fsgnj.s      fs2, ft1, fs11
                  feq.s        s8, fa5, fs7
                  lui          a6, 149315
                  and          s4, s4, a4
                  sub          a3, sp, s9
                  lui          t2, 307772
                  sub          s11, s3, a0
                  srl          t3, a1, zero
                  fdiv.s       fa5, fs4, fs9, rne
                  mulhu        gp, a1, t3
                  xor          a0, ra, a4
                  and          s11, sp, zero
                  fmax.s       fa2, ft4, fs11
                  mulhsu       s3, a5, a0
                  nop
                  sltiu        a1, s9, -1346
                  fsqrt.s      ft3, ft7
                  rem          s6, t1, s9
                  srai         s5, t5, 20
                  add          a1, t3, s4
                  mulhu        s9, s9, s9
                  fsgnj.s      ft5, fs10, fa2
                  div          sp, t3, s7
                  srai         t3, t1, 7
                  divu         sp, t4, a1
                  fcvt.w.s     a4, ft4
                  nop
                  fmin.s       fa5, fs10, fs11
                  fmv.x.w      gp, fs6
                  sltiu        t2, a5, 1433
                  addi         a2, zero, 953
                  srli         s10, a7, 3
                  auipc        s0, 116531
                  addi         s11, s6, -7
                  sltiu        s3, a2, -1892
                  remu         s10, zero, ra
                  div          t0, t6, a4
                  sltiu        s1, t4, -196
                  divu         a3, t2, s10
                  feq.s        t4, ft8, ft7
                  fsgnjx.s     fs3, ft3, ft1
                  fmv.w.x      ft1, tp
                  lui          ra, 423644
                  fclass.s     a2, fs1
                  slti         s7, s5, 1071
                  fdiv.s       ft5, fs1, ft1, rmm
                  ori          t0, tp, -568
                  fcvt.s.wu    ft1, a2
                  mulhu        a4, s3, s10
                  fcvt.w.s     a3, fs4
                  flt.s        s3, fs8, fs10
                  fsub.s       ft4, fs6, ft1
                  slti         a4, a6, 931
                  lui          s9, 644821
                  add          t4, a1, a5
                  fsub.s       fs5, fa3, ft9, rmm
                  fmul.s       ft6, ft3, ft10, rmm
                  lui          s0, 447004
                  fmin.s       ft5, fs6, fa7
                  nop
                  auipc        t2, 787045
                  sltu         t2, s9, t3
                  mulhsu       s6, a7, s8
                  mul          s7, a6, t5
                  sll          a1, s0, t4
                  sltiu        a0, s9, -1587
                  fdiv.s       ft5, ft4, ft2, rne
                  mulh         a0, s9, s3
                  nop
                  srli         s4, t2, 11
                  nop
                  xori         a1, a5, -694
                  or           s3, t3, t3
                  feq.s        a1, fs9, fs8
                  fcvt.s.w     fs4, s10
                  fmv.w.x      ft0, s0
                  mulhsu       sp, t6, s9
                  sltiu        t0, t4, -661
                  sltiu        s11, s0, -1559
                  fcvt.s.w     fa6, s8, rne
                  lui          s5, 116992
                  sra          a6, s2, a4
                  flt.s        a1, fa2, fs0
                  sra          sp, t4, t3
                  remu         t3, t1, s0
                  fclass.s     sp, fa5
                  fsgnjx.s     fa4, ft0, ft10
                  div          a3, s10, s9
                  remu         s10, sp, s2
                  mulhu        a1, gp, a1
                  sll          t1, a7, s1
                  sra          zero, t3, a0
                  flt.s        s4, fa4, fs1
                  fmax.s       fs8, ft10, ft11
                  fle.s        a1, fa1, fa5
                  nop
                  nop
                  slti         s10, s2, 979
                  andi         s8, tp, -2001
                  fadd.s       ft7, fa5, fs10
                  fdiv.s       ft7, fs9, fs1
                  mulh         a7, a0, s4
                  slli         s4, t6, 4
                  rem          t1, a1, a4
                  and          a0, gp, a1
                  rem          s6, s9, a7
                  fcvt.w.s     s5, fs2
                  fmin.s       fa6, ft0, fs6
                  sll          t3, s10, tp
                  sltiu        t0, t4, 1483
                  sll          a0, a6, gp
                  fmv.x.w      a0, fa3
                  and          gp, a4, s7
                  remu         s10, t4, zero
                  fmv.x.w      t3, fa3
                  or           a7, t3, s9
                  mulhu        a6, t3, t1
                  slti         ra, zero, 1717
                  fsgnjn.s     fa3, fa6, fa3
                  slli         s8, t4, 8
                  slt          t0, s10, s5
                  andi         a3, t5, -396
                  fcvt.wu.s    s6, ft6, rtz
                  fclass.s     s5, ft1
                  srl          a2, a0, s6
                  sra          gp, ra, s3
                  fcvt.w.s     sp, ft7
                  add          s1, ra, t6
                  andi         a0, s0, 1484
                  xori         s0, s0, -280
                  fclass.s     s11, ft2
                  fsgnj.s      ft4, fs3, fa5
                  feq.s        t4, fs1, fa2
                  fcvt.w.s     a1, fa4
                  and          t6, a5, zero
                  xor          s7, a2, a6
                  rem          s5, s8, t2
                  slli         t0, t4, 3
                  sra          s11, s10, a3
                  ori          a6, t2, 1252
                  nop
                  xori         t2, a6, 1803
                  feq.s        t0, fs1, ft4
                  mulhu        s8, tp, a3
                  fadd.s       fs4, ft0, ft10, rup
                  fsgnjn.s     fs9, fs2, fs8
                  fcvt.s.w     fa0, t4
                  divu         s10, s11, a4
                  sra          s6, s4, s10
                  mul          a6, gp, s0
                  fcvt.s.wu    fa2, s2
                  div          s6, ra, s8
                  flt.s        t2, fa0, ft10
                  slti         s4, s6, 636
                  fle.s        t3, fs8, fs4
                  ori          a7, s7, -972
                  fcvt.w.s     s7, fs8, rne
                  fsgnjn.s     fs0, ft4, fa4
                  add          zero, a5, zero
                  fmv.w.x      ft7, zero
                  srl          t0, t6, s1
                  fdiv.s       fs4, ft11, ft2, rtz
                  fmul.s       ft2, fa7, fa1
                  auipc        zero, 618562
                  xori         t1, ra, 1649
                  sra          t6, a6, s5
                  nop
                  mulh         t3, s0, a0
                  srl          s5, s4, a6
                  fcvt.w.s     a2, fs3
                  nop
                  add          s6, a6, a7
                  fsgnj.s      fs2, fa4, fa6
                  flt.s        s5, ft5, ft8
                  xori         s7, a7, 828
                  srl          a7, a4, s10
                  fmul.s       ft1, fa1, fs1
                  andi         t3, a5, 1376
                  fclass.s     zero, fs0
                  fsgnjn.s     fa0, ft2, ft8
                  fcvt.w.s     s11, fa7
                  div          s6, zero, ra
                  fsqrt.s      fs9, fs2, rmm
                  fcvt.s.wu    fa2, s4
                  fsgnjx.s     ft10, fs11, fs10
                  fmax.s       ft9, fs2, fs1
                  div          zero, tp, zero
                  srli         sp, t6, 5
                  sra          a0, s8, s9
                  sll          zero, a5, t5
                  addi         s1, t3, -14
                  addi         a0, a6, 2018
                  fcvt.w.s     t1, ft8
                  feq.s        t4, fa1, ft2
                  srli         s0, s1, 31
                  fmv.x.w      s8, fa5
                  mulhsu       a0, s7, s8
                  xor          a6, s10, s10
                  andi         sp, t3, -1139
                  xor          gp, a7, t1
                  srai         s6, s9, 1
                  sub          s4, t2, t3
                  or           s3, ra, t0
                  flt.s        t3, fs0, fs8
                  srli         s0, s8, 11
                  divu         t0, t6, t0
                  fmax.s       ft4, fs5, fs7
                  sltiu        s10, s11, -534
                  nop
                  div          s1, t2, s1
                  sltu         a0, s3, t5
                  srl          t3, tp, ra
                  fsub.s       ft3, ft9, fa6, rdn
                  mulh         t3, s3, a5
                  sll          a3, a0, t5
                  addi         a0, a5, 92
                  fclass.s     t3, fs10
                  srli         s3, s6, 9
                  sltiu        t4, s1, -431
                  mulh         s3, s0, a6
                  fcvt.w.s     s2, fs1
                  mulhu        ra, a6, s6
                  ori          t2, a7, -387
                  sltu         gp, t6, gp
                  srli         s0, a3, 31
                  xori         a1, a7, -1508
                  and          t4, a3, s1
                  sltu         gp, s6, t2
                  auipc        s8, 697058
                  fcvt.s.w     fa7, s4
                  fsqrt.s      fa3, fs8, rdn
                  srl          t6, s2, a0
                  fcvt.s.w     fs3, s11
                  sltu         s10, gp, s6
                  feq.s        a3, ft11, ft0
                  sltiu        t2, a3, 1951
                  mulhsu       t0, s4, a5
                  sltu         zero, s0, t3
                  sub          a4, s7, s9
                  fsgnjn.s     ft9, fs9, fs4
                  fsgnjn.s     fa0, fa0, ft1
                  andi         t2, t2, -216
                  slt          a3, a3, tp
                  mulh         s5, a4, t5
                  lui          a1, 368503
                  addi         s6, t1, 1297
                  fsgnj.s      ft0, fs1, fs2
                  fcvt.s.w     fs9, a2
                  mulh         a0, a7, s5
                  flt.s        t4, ft1, fs8
                  fadd.s       ft6, fa2, ft8
                  add          a4, t5, t2
                  mulh         a4, zero, s6
                  feq.s        s9, fs8, fa3
                  slt          a1, t0, t1
                  fmv.x.w      s0, fs4
                  fsgnj.s      fa5, fs7, ft6
                  fmax.s       fa3, ft1, fs8
                  fle.s        t6, ft7, ft4
                  fsqrt.s      fs6, ft8, rup
                  auipc        s5, 12154
                  slti         a3, a6, 333
                  ori          gp, sp, 916
                  xor          s4, ra, a6
                  xori         s4, s4, 558
                  fcvt.s.wu    fs7, zero, rne
                  nop
                  sltiu        a6, t1, -1373
                  fsgnjn.s     fa5, fa1, ft3
                  or           a3, t4, s11
                  fmin.s       fa0, fa7, fa5
                  fcvt.s.wu    fs6, s0
                  fsqrt.s      fa6, ft6, rup
                  sltu         a2, s5, s6
                  fmul.s       fa3, fs0, ft10
                  fclass.s     t3, ft11
                  mulhsu       a3, sp, a3
                  xori         a3, t5, 239
                  nop
                  mul          zero, s10, t6
                  fmv.w.x      ft2, a2
                  srl          s0, zero, tp
                  srl          s0, s9, s10
                  srai         a7, tp, 16
                  fsgnjx.s     ft0, fa1, ft9
                  andi         a0, t6, 1780
                  flt.s        s10, fs11, fs2
                  flt.s        zero, fa0, fa5
                  fmax.s       fa1, fs11, fa7
                  div          s3, s0, t3
                  fsub.s       ft11, ft3, ft3, rmm
                  slti         ra, a3, 1151
                  srai         s7, a4, 8
                  nop
                  slt          a2, t6, a3
                  fcvt.wu.s    t6, ft9, rtz
                  fsub.s       fs7, ft10, ft4
                  mulhsu       a7, s1, s0
                  flt.s        s9, ft7, fs11
                  feq.s        t6, ft11, fs11
                  fcvt.s.wu    fs2, ra
                  fcvt.wu.s    a7, fa4, rmm
                  srai         t0, sp, 9
                  sra          t0, a6, s7
                  xori         t0, gp, 1869
                  auipc        zero, 657042
                  mulhu        s2, a6, gp
                  add          s8, ra, s2
                  andi         s4, s7, 948
                  slt          s2, t3, t6
                  srli         t2, tp, 19
                  sltiu        s10, a6, -92
                  fsub.s       ft10, ft5, ft0
                  fsgnjx.s     fs7, fa6, fa4
                  xori         s6, s7, -106
                  fmax.s       fs4, fs2, ft2
                  fcvt.w.s     s6, ft8, rmm
                  sll          s3, s2, ra
                  fcvt.w.s     s8, fa5
                  and          s11, a7, t1
                  auipc        s9, 417855
                  fsqrt.s      ft3, fa3
                  lui          a1, 11185
                  rem          t3, t2, a4
                  srai         s10, s4, 20
                  remu         zero, a7, sp
                  xor          s3, ra, s10
                  feq.s        a3, fa1, ft9
                  slt          s8, t0, t4
                  mulhu        a3, a7, a1
                  add          a7, a4, a0
                  nop
                  sltiu        s8, s5, 935
                  rem          s4, s1, zero
                  fdiv.s       ft7, fs10, fs11
                  fcvt.w.s     s8, fs6
                  xori         s4, gp, 1134
                  fadd.s       ft11, fs7, fs4
                  fsgnjx.s     fs7, ft3, fs7
                  sra          s2, a5, t5
                  flt.s        t6, fs4, fa7
                  addi         s6, a3, -759
                  remu         s2, s2, a1
                  mul          a0, t3, t6
                  feq.s        s4, fs1, fs11
                  fmv.w.x      fa4, s9
                  fmul.s       ft7, fs7, ft9
                  fadd.s       ft7, fs2, fs7, rmm
                  sub          sp, s8, s5
                  srli         gp, s10, 18
                  xor          s10, a7, t1
                  fmv.w.x      fs4, s1
                  remu         s0, t4, t3
                  and          t1, a0, s7
                  remu         t4, a5, s8
                  fmax.s       ft7, fa4, ft5
                  fadd.s       fa1, fs1, fs3
                  remu         ra, s7, s6
                  auipc        t4, 711883
                  mulhu        a2, a7, s4
                  fsub.s       fs3, ft3, fs8
                  slti         a7, s11, 248
                  rem          s2, gp, s3
                  fclass.s     s7, fa2
                  srli         s1, s11, 5
                  sub          s2, a5, s0
                  fdiv.s       ft0, fs0, fa6
                  fdiv.s       fa7, ft4, ft0, rdn
                  mul          gp, s7, s4
                  rem          s6, s9, s6
                  fsqrt.s      ft6, fa2
                  xor          s9, s7, sp
                  fsub.s       fs10, fs8, ft1
                  lui          s1, 871361
                  fcvt.s.wu    ft3, s1
                  ori          t4, a2, -1546
                  div          s4, s11, s4
                  fmul.s       fs0, fs2, fs6
                  slti         s11, tp, 468
                  fmul.s       fs1, fs1, fa0
                  flt.s        s3, fs4, fa3
                  srl          s0, t1, tp
                  fsub.s       fs3, fs8, fs7, rne
                  or           a1, s7, t4
                  fcvt.s.w     fs6, t0, rmm
                  sltu         s0, a5, t3
                  slli         ra, a4, 8
                  feq.s        a1, ft7, ft5
                  srai         ra, t4, 21
                  sltiu        ra, t3, 574
                  fclass.s     a4, ft3
                  fmv.w.x      fs2, tp
                  slti         s1, s1, 1415
                  slti         s11, a2, 242
                  fsub.s       fa6, fa7, fs0, rup
                  fmv.w.x      fa4, t6
                  fmin.s       fa3, fs0, fs1
                  lui          s2, 90248
                  fcvt.w.s     t1, ft6
                  fclass.s     t1, fs9
                  fmv.x.w      a7, fa1
                  slli         a2, t2, 25
                  fcvt.w.s     s6, ft11, rup
                  fadd.s       ft4, fs2, ft5
                  add          a4, t1, t6
                  ori          a7, t2, 770
                  mulhu        s4, s6, tp
                  fcvt.w.s     a1, fs3, rtz
                  divu         a7, t5, a1
                  fsub.s       fs11, fa5, ft6, rup
                  fsgnj.s      fs1, ft11, fa7
                  srl          s3, s3, s6
                  fcvt.s.w     ft3, sp, rmm
                  fsgnjn.s     fs9, fa6, fs4
                  fmv.x.w      a4, fs9
                  or           a1, s9, a1
                  mulh         s6, s4, t6
                  srl          ra, s1, zero
                  mulhu        a6, zero, s7
                  slli         a6, s11, 25
                  xori         t3, s3, -522
                  addi         s5, s4, 1067
                  fmul.s       fs10, fa7, fs5
                  srli         t0, s3, 2
                  auipc        s8, 122111
                  or           zero, s9, s5
                  sra          t6, t6, s1
                  srai         a1, s9, 2
                  sltiu        s6, a4, -977
                  fadd.s       fa6, fs10, fa5, rmm
                  divu         s7, t1, a0
                  feq.s        s3, ft9, ft2
                  mul          sp, s11, sp
                  addi         t4, t1, -1444
                  slti         s1, s2, -47
                  mul          s6, a6, s0
                  fdiv.s       ft2, fs9, ft4, rmm
                  and          a3, s1, t4
                  fdiv.s       ft8, fa6, fs3
                  andi         s10, t2, -1167
                  sltu         a2, t6, sp
                  auipc        zero, 434820
                  fcvt.w.s     t1, fs3, rne
                  mul          s5, t6, ra
                  fmv.x.w      s6, fa6
                  ori          gp, a0, -1875
                  mulhu        sp, zero, t1
                  fsgnjx.s     fs8, fs0, fa6
                  mulhsu       a2, s6, t3
                  xori         t3, a5, -2002
                  nop
                  mul          s6, gp, s11
                  xori         a6, s7, -997
                  sub          t2, s11, a2
                  sll          a6, a7, a5
                  auipc        ra, 484811
                  flt.s        s9, fs6, ft7
                  or           s2, a5, s9
                  nop
                  or           s4, s3, tp
                  fdiv.s       fa4, fs11, fa7
                  sra          t0, s10, sp
                  andi         a4, t1, 1662
                  add          s2, s4, zero
                  mulhsu       t0, t6, ra
                  feq.s        t4, ft1, ft7
                  fmv.w.x      ft1, s6
                  or           s8, s11, t2
                  fsqrt.s      fa2, fa1
                  slti         s8, ra, 323
                  fcvt.s.w     ft3, a5, rtz
                  fsgnj.s      fs3, fa3, fs1
                  div          t2, t1, t4
                  srl          t4, t2, ra
                  xor          t1, zero, s1
                  rem          a0, s6, a7
                  fadd.s       fs2, ft7, ft9
                  andi         s6, s8, 1090
                  srli         a6, ra, 10
                  mulh         s10, s0, zero
                  remu         a3, s7, a6
                  xor          s11, t3, s8
                  srli         s4, t2, 4
                  andi         a0, t5, 1354
                  fsgnj.s      fa1, fs6, fs7
                  fmv.w.x      fs1, s10
                  fsgnjx.s     fa6, ft8, fs7
                  or           sp, tp, t4
                  and          t6, a0, a5
                  sll          s8, a2, s3
                  fle.s        a6, ft7, fs11
                  fadd.s       fa5, fa7, ft8
                  fsub.s       fa5, fa1, ft3
                  srai         s0, t6, 2
                  mul          t6, a3, s4
                  fsgnjn.s     fs5, fs8, fs3
                  fmin.s       ft4, fs0, ft10
                  fcvt.wu.s    s4, fa5, rdn
                  slt          t2, t5, s6
                  fadd.s       fs6, ft0, ft8
                  fmin.s       fa5, ft0, ft1
                  nop
                  fadd.s       fa1, ft9, ft1
                  xori         t4, s11, 1322
                  fmax.s       fs3, fs9, fs10
                  mulhu        t2, a1, t6
                  fcvt.s.w     ft2, s6
                  mul          a4, t4, t3
                  fmul.s       fs5, fa6, fs7, rtz
                  fcvt.wu.s    s6, fa1, rtz
                  mulhu        zero, t5, s6
                  fmin.s       fs8, fs2, ft4
                  slt          s4, t0, s10
                  slli         s10, a5, 24
                  sub          s5, sp, ra
                  slt          s9, a5, a3
                  mulhsu       t4, ra, gp
                  mulhsu       s11, t3, a5
                  fsgnjx.s     fa6, ft6, fs1
                  srai         t2, s0, 30
                  slt          s4, t3, sp
                  fmul.s       ft3, fs9, fa5, rup
                  fsqrt.s      fa4, fa5
                  slti         a6, s8, -715
                  lui          t4, 896177
                  and          ra, a5, s6
                  and          s2, t2, t1
                  slli         t6, s10, 12
                  mulh         s11, a3, s6
                  sra          s7, a5, a0
                  fsqrt.s      fa3, fs8
                  xori         a2, t3, -1654
                  fsgnj.s      ft11, fa7, fs8
                  mulhsu       t1, t6, s4
                  fdiv.s       fs8, fs5, ft0
                  fclass.s     s4, ft9
                  fcvt.s.wu    fa4, a6, rdn
                  slt          s2, a1, t0
                  sll          s7, s9, s9
                  div          s9, a4, t2
                  mulhsu       a3, a7, s6
                  fmv.w.x      fa7, gp
                  and          s6, a4, s4
                  auipc        a0, 100302
                  ori          s0, s0, 835
                  mul          t6, t6, s9
                  fsgnjn.s     ft7, ft4, ft3
                  nop
                  sub          a1, s8, t3
                  fcvt.s.w     fa4, s4
                  andi         s7, t4, -268
                  ori          a3, s11, 887
                  xor          s6, a4, t5
                  fadd.s       ft8, fa1, ft0
                  fsub.s       fa0, fs0, ft1
                  xori         s8, t6, -526
                  add          s11, t4, t6
                  fsgnj.s      fa5, ft0, fa3
                  sll          a7, s0, t0
                  slli         t1, s8, 4
                  fcvt.s.w     ft4, s5, rdn
                  sltiu        a0, a5, -426
                  remu         s5, s11, t1
                  srli         s4, t0, 11
                  fcvt.s.w     fs6, t5, rmm
                  remu         t1, t2, t0
                  sll          sp, s8, t1
                  fadd.s       fa1, fs1, fs11
                  slt          a4, s6, t1
                  mul          t0, s0, s4
                  fmax.s       ft8, fs6, ft10
                  fcvt.wu.s    a7, fa5, rtz
                  srl          s3, s2, a6
                  ori          s4, a2, -1576
                  fsgnj.s      fa3, ft0, fs1
                  flt.s        a1, fs2, fs11
                  div          ra, s9, a3
                  fadd.s       fa1, ft11, fa2
                  fsgnjn.s     ft6, fs6, fs0
                  remu         s6, t4, s6
                  fcvt.w.s     gp, ft2, rup
                  mulh         a1, tp, s10
                  sltiu        s8, t0, -1329
                  fle.s        gp, fa7, fa7
                  srl          s1, a7, s1
                  fcvt.s.wu    fa5, t6
                  sra          s4, s3, a4
                  sra          a3, a1, t6
                  fcvt.s.w     ft9, s9
                  fcvt.w.s     sp, fa5
                  srli         t6, t6, 20
                  fsqrt.s      fs11, fa2
                  fcvt.s.wu    ft1, ra, rmm
                  mulhu        s11, zero, ra
                  fcvt.s.wu    ft3, tp, rdn
                  srl          s5, s9, t2
                  fmv.x.w      t3, fs2
                  feq.s        s11, fs2, fs11
                  fmin.s       ft3, fa7, fa2
                  auipc        s3, 899460
                  sll          a1, s6, tp
                  divu         ra, t6, gp
                  remu         a2, a2, t2
                  mulhsu       gp, s2, s9
                  fmv.w.x      fs0, tp
                  slti         t6, s4, -708
                  fsqrt.s      fs9, fa3
                  add          s8, a2, zero
                  mulh         a6, s2, tp
                  fadd.s       ft4, fs2, fs3, rdn
                  srli         a1, s8, 5
                  fdiv.s       ft6, ft9, fs11, rne
                  addi         a2, s5, 914
                  fmax.s       fs0, fa0, ft0
                  remu         s11, t6, t3
                  and          t1, s5, t3
                  sltu         s4, s3, a2
                  fsqrt.s      fa5, fs10
                  slti         s7, a0, 965
                  add          s1, sp, sp
                  fsgnj.s      ft8, fs1, fs6
                  feq.s        t2, fs3, ft11
                  srli         a0, a4, 15
                  nop
                  mulhsu       s2, a1, t3
                  flt.s        s2, fs4, ft7
                  feq.s        a1, ft3, fs1
                  fmul.s       fa5, fs11, fa3, rup
                  or           t1, ra, a7
                  fcvt.s.wu    fs8, s4
                  ori          a7, s6, -1726
                  remu         zero, a2, s2
                  fle.s        t4, ft7, fa3
                  fmv.x.w      a1, fs6
                  fmv.x.w      s6, fs3
                  and          t6, gp, s0
                  fmin.s       ft11, fa0, fs10
                  slt          t0, s9, s5
                  fmin.s       fs4, fs2, ft8
                  slli         s11, t1, 25
                  lui          t4, 758593
                  fmv.x.w      t4, ft1
                  sltiu        a3, s11, -1268
                  slt          s11, zero, a4
                  sltu         s6, s2, s3
                  fmv.x.w      s2, fa0
                  nop
                  divu         t0, gp, t1
                  fcvt.wu.s    t4, ft6, rup
                  slti         s4, sp, -73
                  mulh         s9, a2, s11
                  xori         s0, a3, -1133
                  xor          a7, s0, s7
                  srli         s7, s8, 23
                  fadd.s       fs4, fs2, fa0
                  or           s10, s1, t5
                  fmax.s       ft10, fs5, ft5
                  auipc        s8, 559638
                  srli         s5, s8, 28
                  andi         s0, a1, 124
                  mulhsu       a0, tp, gp
                  fcvt.wu.s    a6, ft11
                  fsub.s       ft3, fa3, fa1, rmm
                  rem          s7, t6, t3
                  fclass.s     t0, fs8
                  lui          a4, 578231
                  slti         s11, a5, -1770
                  fle.s        t6, ft7, ft8
                  remu         t4, s2, t6
                  fsgnjn.s     fa2, fa5, ft9
                  fclass.s     a3, fs3
                  fadd.s       ft9, ft3, fs11, rtz
                  sra          s3, a4, t6
                  addi         s10, t0, 640
                  addi         sp, s11, 97
                  srai         a4, s7, 7
                  fadd.s       fs4, fa2, fa4
                  or           t1, a1, gp
                  flt.s        s3, fs6, fs5
                  mul          zero, a5, s0
                  fsub.s       ft5, fs3, ft0, rmm
                  fmax.s       ft8, fa3, fa1
                  feq.s        a2, fs9, ft5
                  feq.s        sp, ft9, fa6
                  or           a1, a2, s1
                  fclass.s     a4, fs10
                  fdiv.s       fa5, ft6, ft5
                  fcvt.wu.s    a3, ft6, rtz
                  fsgnj.s      ft1, fa1, fa4
                  div          s7, s3, gp
                  fcvt.s.w     fs10, a3
                  addi         t1, tp, 891
                  fcvt.s.w     fa0, a7
                  lui          t6, 780660
                  slti         s6, s11, 1074
                  flt.s        s2, ft11, fa3
                  fsgnjn.s     fs11, ft11, fs2
                  fclass.s     sp, fa3
                  mulhu        s1, zero, a6
                  nop
                  slli         gp, ra, 21
                  fmax.s       ft7, ft4, fs1
                  fmin.s       ft10, fs10, fa6
                  fadd.s       fs2, fs9, fs4
                  div          s7, ra, a2
                  add          a7, s8, tp
                  sra          a2, a2, t4
                  remu         s6, ra, s4
                  fle.s        zero, ft10, ft11
                  srai         a7, a4, 4
                  mulhu        a6, s7, gp
                  srl          t0, gp, s4
                  fmul.s       fa2, fs6, fa7, rup
                  auipc        t4, 361380
                  mulhu        zero, s8, t6
                  fsub.s       ft7, fa1, fs6, rup
                  fcvt.s.wu    ft8, s9
                  srli         zero, s1, 8
                  fclass.s     zero, ft11
                  mulhsu       t2, gp, a5
                  fclass.s     zero, fs7
                  nop
                  mul          s9, sp, s0
                  and          zero, s6, s3
                  fadd.s       fs5, fa6, ft2, rne
                  lui          s8, 827084
                  fadd.s       ft6, fs5, fs6, rmm
                  feq.s        t2, fs10, ft5
                  flt.s        s0, fa2, fs0
                  divu         s9, t0, t4
                  slt          t3, s2, s4
                  feq.s        t1, ft7, fa3
                  divu         s3, a6, t5
                  fmv.w.x      fa6, tp
                  fcvt.w.s     s6, fs5, rtz
                  mulhsu       zero, t3, s11
                  fsgnjx.s     ft11, fs6, fa6
                  fcvt.w.s     zero, fs7, rne
                  fmv.w.x      fa3, s8
                  fsub.s       fs7, ft0, fs7, rup
                  fcvt.s.w     fa3, t1, rmm
                  addi         gp, t0, -1582
                  xori         s0, t1, 1349
                  mul          s8, s9, t2
                  fcvt.s.w     fa1, t1, rtz
                  mulh         t2, a4, a6
                  slli         gp, a6, 17
                  sra          a3, gp, a3
                  flt.s        s2, fa2, fs5
                  andi         s11, t2, 288
                  fadd.s       fa4, fs10, fa1
                  mulhsu       a6, gp, a1
                  fmul.s       ft0, ft0, ft8, rdn
                  fsgnjn.s     fs0, fa6, fs5
                  fclass.s     s2, ft3
                  xori         s9, s9, -1746
                  divu         zero, s9, t3
                  xor          a0, s3, s10
                  mulhu        a6, a5, s7
                  fclass.s     a7, fs10
                  fmv.w.x      ft5, a5
                  fmul.s       ft8, fa3, ft5
                  fdiv.s       ft7, fs5, ft8, rtz
                  slli         a2, s1, 25
                  fmin.s       fs11, ft1, fa1
                  fsgnjn.s     fa4, ft7, fs5
                  sub          a2, s2, s6
                  fsgnjx.s     fa1, ft11, ft2
                  lui          t1, 363033
                  sltu         s5, tp, s5
                  sub          a6, s0, gp
                  sra          t0, t1, s8
                  auipc        t4, 145288
                  and          a3, tp, s0
                  divu         sp, a3, s8
                  remu         t6, s8, a1
                  xori         gp, a5, 1397
                  fle.s        ra, fa3, fs1
                  fle.s        s11, ft7, fa7
                  divu         a6, gp, s5
                  sltiu        s1, t2, 1431
                  xor          t6, s6, s0
                  fsgnjx.s     ft6, ft6, ft6
                  fmv.x.w      s10, fs0
                  srli         a6, t3, 13
                  fcvt.wu.s    s8, ft6, rne
                  fsgnjn.s     fs7, ft8, ft5
                  flt.s        s10, fa5, ft4
                  fmv.x.w      s2, fs11
                  fsqrt.s      ft8, ft1, rmm
                  fcvt.s.wu    fa6, s11
                  slti         a6, zero, -1392
                  fadd.s       fs2, fs4, ft11, rmm
                  and          t3, a3, a4
                  fmin.s       ft11, ft1, fa2
                  fcvt.wu.s    a7, ft8
                  fcvt.s.w     fa6, a1, rdn
                  srai         s8, a2, 23
                  addi         a0, s8, -41
                  feq.s        gp, fa4, fa7
                  sltu         s5, a5, zero
                  fcvt.s.wu    fa2, t5, rdn
                  fcvt.s.w     ft11, a7
                  feq.s        s1, ft9, ft10
                  fcvt.wu.s    s1, fs2
                  lui          s7, 779269
                  fclass.s     s2, ft6
                  feq.s        s2, fs3, ft10
                  srl          t2, gp, s5
                  sub          s8, a6, gp
                  fcvt.wu.s    zero, fs7
                  ori          s3, zero, -2010
                  fle.s        a7, ft2, ft5
                  flt.s        s5, fs9, fa4
                  remu         ra, a3, a2
                  srai         s0, s0, 24
                  nop
                  fmin.s       ft7, ft7, ft11
                  fmv.x.w      s4, fs2
                  mulhu        t3, s7, t4
                  mul          s4, t2, a7
                  or           t0, ra, a0
                  fadd.s       ft11, fa0, ft1
                  xor          s0, t2, a0
                  fsgnj.s      fa0, fs6, fs10
                  fsgnjn.s     ft6, ft11, fa4
                  slti         s5, a3, 1018
                  addi         s10, s0, -1245
                  xor          a0, s9, s9
                  mulh         s6, a7, s2
                  fsub.s       ft2, fa7, fs6, rup
                  slt          s4, a0, s4
                  srl          a3, s4, a0
                  andi         t3, t6, 1282
                  fmin.s       ft1, ft10, fa3
                  and          t1, s0, s8
                  fdiv.s       ft3, fs3, ft10, rne
                  fdiv.s       fs3, fa7, fs5, rmm
                  fcvt.s.w     fa1, t4, rne
                  xori         s7, s3, -641
                  fmv.w.x      fs4, a7
                  feq.s        s6, fs1, ft10
                  fcvt.wu.s    s10, fa4, rup
                  fsub.s       fa4, ft8, fs0
                  fsgnjn.s     ft10, fs1, fs3
                  mulh         a0, s3, s10
                  fsgnjx.s     fs6, ft4, fs7
                  fmv.x.w      s7, fa5
                  flt.s        t1, ft0, fa5
                  mulhu        t0, gp, a4
                  fsgnj.s      fs5, fa7, ft1
                  or           ra, a3, s4
                  nop
                  ori          s7, s11, 1603
                  mulhsu       t3, a0, s11
                  div          s2, ra, s5
                  andi         t2, t5, -1130
                  fmv.w.x      fs0, ra
                  auipc        s2, 88857
                  sra          s6, s0, a3
                  srli         s9, s7, 12
                  sra          a0, s7, a6
                  mulhsu       gp, t6, s6
                  divu         a2, s8, a6
                  mul          a3, tp, s11
                  nop
                  fmin.s       ft3, fs7, ft3
                  fcvt.s.wu    fs11, t1
                  fmax.s       ft3, fa6, ft4
                  xori         zero, gp, -1572
                  sltu         s5, s2, s11
                  add          t3, a7, s10
                  srli         a2, a3, 0
                  mul          a2, a7, s1
                  and          zero, s4, gp
                  addi         s3, sp, -1143
                  fmul.s       ft0, ft7, fa2, rne
                  sltiu        t2, zero, -1094
                  ori          t4, ra, 1741
                  add          s3, s2, a1
                  fmv.w.x      fa7, s1
                  mulhsu       s7, a7, zero
                  sltiu        t2, zero, -549
                  mulhu        t4, a3, t2
                  srai         a4, a5, 7
                  andi         s4, t6, -1204
                  nop
                  ori          a0, a0, 634
                  fsgnj.s      fa6, fs4, ft5
                  fadd.s       fs11, ft9, fs3, rup
                  divu         ra, s5, a7
                  sltiu        t1, a2, 1763
                  srli         t1, sp, 0
                  fmv.x.w      s10, fa4
                  remu         ra, s0, a4
                  addi         s9, gp, -1943
                  xori         a7, t1, -1189
                  mulhu        t1, tp, t2
                  srl          s2, t3, t2
                  fsqrt.s      fa4, fs3
                  add          t2, a6, s7
                  sltiu        s9, t0, 1795
                  fsgnjn.s     ft7, fa3, fa7
                  fcvt.s.w     fs7, zero, rup
                  sltiu        a7, t0, -1658
                  sll          s11, a6, s6
                  fmul.s       ft11, ft1, ft0, rtz
                  fcvt.s.wu    fs4, ra, rne
                  sltiu        t1, s10, 1021
                  slli         s7, s11, 10
                  fcvt.s.wu    fs1, s11, rmm
                  mul          t2, a3, a4
                  fle.s        s4, ft7, ft6
                  fsgnjx.s     ft10, fs1, ft1
                  add          s6, zero, s11
                  fmv.x.w      s1, ft10
                  fmul.s       fs7, fa5, fs1
                  rem          sp, s8, t2
                  nop
                  sltiu        s0, s3, 1334
                  flt.s        s6, fs0, fa4
                  fmax.s       fs0, fs1, fs10
                  fdiv.s       fs11, fs9, fa1, rtz
                  fsub.s       ft4, fs7, fs3, rne
                  rem          a3, a3, t1
                  sub          s5, s10, s4
                  ori          a4, s0, 504
                  srl          s5, s6, a0
                  sltu         zero, s11, s2
                  fsgnj.s      fs6, fs5, fa0
                  srai         s1, a7, 10
                  slt          s5, t0, a4
                  lui          t3, 736813
                  fsqrt.s      fs5, fs10, rup
                  lui          a3, 76964
                  feq.s        s9, fs8, fa3
                  fmax.s       fs1, fa0, fs0
                  flt.s        t1, fs3, ft10
                  xor          t6, a6, sp
                  fmax.s       fa4, fs1, fs10
                  addi         s11, t5, 1804
                  srl          s2, s8, gp
                  mulhsu       ra, s5, a2
                  fcvt.wu.s    a0, ft8, rtz
                  mulhu        s11, a2, a4
                  feq.s        t3, fs6, fs2
                  fclass.s     ra, fs1
                  sll          ra, t1, t2
                  sra          t1, t6, a3
                  mulhsu       a3, t2, a5
                  fadd.s       fs1, fs0, fs9, rup
                  xori         s2, gp, -1845
                  fclass.s     a2, fa5
                  ori          t0, s2, 1456
                  xori         zero, a5, -362
                  fmv.w.x      fs8, t2
                  divu         t4, a2, s1
                  xor          s1, s0, s4
                  rem          s4, sp, zero
                  and          t1, t1, s11
                  fmv.x.w      s7, fs10
                  sub          s9, t2, s9
                  slt          t0, a3, s1
                  fcvt.wu.s    s5, fs10, rmm
                  fmv.w.x      ft3, a0
                  fsgnjn.s     ft5, fs4, ft7
                  fmin.s       ft5, fa0, ft2
                  fle.s        t6, fa5, fs3
                  fcvt.s.wu    fs5, zero, rmm
                  add          sp, s4, t1
                  auipc        s11, 634530
                  remu         sp, t0, t3
                  mulhsu       a0, t0, zero
                  xori         a0, a0, 811
                  add          a3, s4, s11
                  fsgnjx.s     ft2, ft6, ft6
                  mulhsu       a3, s4, a5
                  fcvt.wu.s    s9, fa2, rdn
                  or           t0, t5, s8
                  or           s3, zero, s1
                  fcvt.w.s     a1, fa0
                  fcvt.w.s     s11, fs2, rup
                  mulhsu       s6, s7, s1
                  divu         t1, a6, a1
                  sub          a2, a2, t6
                  mulhsu       s5, s0, a0
                  and          a0, gp, zero
                  div          s5, a3, t0
                  fmv.w.x      ft1, tp
                  add          s9, s10, gp
                  div          a1, a7, s8
                  fsgnjx.s     fs10, ft6, fs7
                  xor          s8, a2, s1
                  div          gp, s5, s7
                  remu         zero, s9, a5
                  fmin.s       fs4, fs3, ft6
                  xor          t0, s6, s11
                  remu         a0, s10, a6
                  sra          s2, t4, a2
                  fcvt.wu.s    t2, ft10
                  fmv.w.x      fs11, sp
                  fsqrt.s      fa4, fs3, rdn
                  srli         t6, a3, 14
                  mulh         zero, s4, s7
                  flt.s        t3, fa0, fs7
                  andi         gp, s6, 1916
                  andi         t0, s7, 784
                  fmv.x.w      s10, ft4
                  divu         s10, s11, s10
                  and          gp, t3, t0
                  ori          s9, a1, -1714
                  sltiu        sp, a3, 1043
                  fsgnjn.s     ft3, fs6, ft9
                  sltu         s4, s6, s8
                  slt          s7, ra, t4
                  fmul.s       fs6, fs7, fs11
                  fcvt.wu.s    s2, ft11
                  add          a0, a6, a4
                  div          s7, t5, s1
                  lui          a2, 652466
                  fcvt.w.s     s6, fa3, rne
                  auipc        t6, 217883
                  fmv.w.x      fa2, s3
                  mulh         s0, a7, t0
                  flt.s        a6, ft1, fs7
                  fcvt.s.w     fs0, zero, rdn
                  add          a0, s9, a2
                  and          s8, s11, a7
                  fmax.s       ft10, fs10, fs7
                  fcvt.w.s     a0, fs11
                  slti         a1, a7, -1354
                  srli         s2, t0, 13
                  flt.s        t0, fs5, fs3
                  fsgnjx.s     fs2, ft10, fs11
                  fmul.s       ft2, ft6, fs11
                  addi         s10, s4, 1700
                  sra          s4, t4, tp
                  srli         s11, a4, 25
                  fsgnjx.s     ft11, fa6, ft11
                  fadd.s       fa7, ft11, ft5
                  fle.s        s5, fs5, fs2
                  sub          s8, a3, a0
                  slt          s3, zero, s7
                  fmv.x.w      s6, fa0
                  and          t2, s0, sp
                  mulhu        s10, s5, s0
                  mul          s2, a2, a0
                  srl          s4, t4, tp
                  fmax.s       fs3, fs11, fs9
                  lui          a2, 22817
                  sltu         s11, a3, s3
                  fmax.s       fs8, fa2, ft5
                  sra          t6, s10, s7
                  div          s1, ra, a7
                  srl          t6, a1, s2
                  sltiu        t4, t4, 1655
                  fmax.s       fa2, fs8, ft8
                  ori          a1, s11, -538
                  ori          s5, tp, -151
                  ori          s1, a4, -404
                  sub          t3, s1, t0
                  fsub.s       fa7, fs2, fa1
                  remu         ra, t3, s6
                  and          t1, a1, s11
                  mulh         s8, t0, a1
                  fle.s        s5, fs3, ft5
                  sra          sp, t3, s11
                  fcvt.wu.s    t4, fs8
                  feq.s        a7, fs6, fs4
                  divu         t1, t1, a3
                  sll          t0, t4, a4
                  lui          s7, 589766
                  fmul.s       fs10, fs6, fs8, rdn
                  fdiv.s       ft8, ft1, fs11
                  andi         a4, t5, -1202
                  fmul.s       ft1, fs5, ft11, rtz
                  fmv.w.x      ft6, s0
                  flt.s        s2, ft6, ft2
                  fmul.s       ft10, ft11, fs2
                  add          t4, s6, t3
                  sltu         gp, s4, t2
                  srai         s8, s9, 26
                  auipc        gp, 755963
                  sltu         t6, sp, a1
                  nop
                  fcvt.wu.s    t0, fs3, rne
                  xor          a0, t0, t6
                  fadd.s       fs3, ft0, fs2, rmm
                  or           s9, s5, a7
                  addi         ra, a2, -1868
                  mulh         t3, a5, t0
                  fmul.s       ft1, fs4, fa2
                  fclass.s     s8, ft3
                  fsgnj.s      fa2, fs10, ft4
                  la x15, test_done
                  jalr x0, x15, 0
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
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_2:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_3:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_4:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_5:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_6:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_7:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_8:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_9:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_10:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_11:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_12:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_13:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_14:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_15:
                  addi x4, x4, -4
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

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
                  sw  x30, (x4)
                  add x30, x4, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x4, x30, zero
                  csrr x14, 0x341 # MEPC
                  csrr x14, 0x342 # MCAUSE
                  li x5, 0x3 # BREAKPOINT
                  beq x14, x5, ebreak_handler
                  li x5, 0x8 # ECALL_UMODE
                  beq x14, x5, ecall_handler
                  li x5, 0x9 # ECALL_SMODE
                  beq x14, x5, ecall_handler
                  li x5, 0xb # ECALL_MMODE
                  beq x14, x5, ecall_handler
                  li x5, 0x1
                  beq x14, x5, instr_fault_handler
                  li x5, 0x5
                  beq x14, x5, load_fault_handler
                  li x5, 0x7
                  beq x14, x5, store_fault_handler
                  li x5, 0xc
                  beq x14, x5, pt_fault_handler
                  li x5, 0xd
                  beq x14, x5, pt_fault_handler
                  li x5, 0xf
                  beq x14, x5, pt_fault_handler
                  li x5, 0x2 # ILLEGAL_INSTRUCTION
                  beq x14, x5, illegal_instr_handler
                  csrr x5, 0x343 # MTVAL
                  1: la x15, test_done
                  jalr x1, x15, 0

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
                  la x15, write_tohost
                  jalr x0, x15, 0

instr_fault_handler:
                  add x30, x4, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x4, x30, zero
                  lw  x30, (x4)
                  addi x4, x4, 4
                  mret

load_fault_handler:
                  add x30, x4, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x4, x30, zero
                  lw  x30, (x4)
                  addi x4, x4, 4
                  mret

store_fault_handler:
                  add x30, x4, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x4, x30, zero
                  lw  x30, (x4)
                  addi x4, x4, 4
                  mret

ebreak_handler:   
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x30, x4, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x4, x30, zero
                  lw  x30, (x4)
                  addi x4, x4, 4
                  mret

illegal_instr_handler:
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x30, x4, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x4, x30, zero
                  lw  x30, (x4)
                  addi x4, x4, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x14, 0x300 # MSTATUS;
                  csrr  x14, 0x304 # MIE;
                  csrr  x14, 0x344 # MIP;
                  csrrc x14, 0x344, x14 # MIP;
                  add x30, x4, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x4, x30, zero
                  lw  x30, (x4)
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
