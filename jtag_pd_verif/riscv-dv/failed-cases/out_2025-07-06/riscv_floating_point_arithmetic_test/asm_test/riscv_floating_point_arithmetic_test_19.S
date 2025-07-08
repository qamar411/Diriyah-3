.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x30, h0_start
jalr x0, x30, 0
h0_start:
                  li x10, 0x40001120
                  csrw 0x301, x10
kernel_sp:        
                  la x27, kernel_stack_end

trap_vec_init:    
                  la x10, mtvec_handler
                  ori x10, x10, 1
                  csrw 0x305, x10 # MTVEC

mepc_setup:       
                  la x10, init
                  csrw 0x341, x10

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x10, 0x3800
                  csrw 0x300, x10 # MSTATUS
                  li x10, 0x0
                  csrw 0x304, x10 # MIE
                  mret
init:             
                  li x10, 4286578688
                  fmv.w.x f0, x10
                  li x10, 206284938
                  fmv.w.x f1, x10
                  li x10, 0
                  fmv.w.x f2, x10
                  li x10, 3572542
                  fmv.w.x f3, x10
                  li x10, 3304496980
                  fmv.w.x f4, x10
                  li x10, 2139095041
                  fmv.w.x f5, x10
                  li x10, 2143289344
                  fmv.w.x f6, x10
                  li x10, 6672430
                  fmv.w.x f7, x10
                  li x10, 2139095041
                  fmv.w.x f8, x10
                  li x10, 2139095040
                  fmv.w.x f9, x10
                  li x10, 4286578688
                  fmv.w.x f10, x10
                  li x10, 4286578687
                  fmv.w.x f11, x10
                  li x10, 2139095041
                  fmv.w.x f12, x10
                  li x10, 3394950621
                  fmv.w.x f13, x10
                  li x10, 4286578687
                  fmv.w.x f14, x10
                  li x10, 2984646
                  fmv.w.x f15, x10
                  li x10, 2147483648
                  fmv.w.x f16, x10
                  li x10, 2139095040
                  fmv.w.x f17, x10
                  li x10, 4215301089
                  fmv.w.x f18, x10
                  li x10, 2139095039
                  fmv.w.x f19, x10
                  li x10, 2139095040
                  fmv.w.x f20, x10
                  li x10, 2143289344
                  fmv.w.x f21, x10
                  li x10, 2139095039
                  fmv.w.x f22, x10
                  li x10, 3117797877
                  fmv.w.x f23, x10
                  li x10, 2139095041
                  fmv.w.x f24, x10
                  li x10, 2139095039
                  fmv.w.x f25, x10
                  li x10, 2139095039
                  fmv.w.x f26, x10
                  li x10, 2139095041
                  fmv.w.x f27, x10
                  li x10, 3108208389
                  fmv.w.x f28, x10
                  li x10, 2139095039
                  fmv.w.x f29, x10
                  li x10, 2143289344
                  fmv.w.x f30, x10
                  li x10, 2139095039
                  fmv.w.x f31, x10
                  fsrmi 4
                  li x0, 0x2c842a31
                  li x1, 0x0
                  li x2, 0xc
                  li x3, 0x0
                  li x4, 0x80000000
                  li x5, 0x0
                  li x6, 0x80000000
                  li x7, 0xfdff6a40
                  li x8, 0x7
                  li x9, 0xd10ea59c
                  li x10, 0x2592ed83
                  li x11, 0x80000000
                  li x12, 0x80000000
                  li x13, 0x0
                  li x14, 0xfdc8080b
                  li x15, 0xbc75eb75
                  li x16, 0x80000000
                  li x17, 0x80000000
                  li x18, 0x80110f2f
                  li x19, 0x1
                  li x20, 0x0
                  li x21, 0x11846c5f
                  li x22, 0x0
                  li x23, 0xc
                  li x24, 0x26819cbf
                  li x25, 0x0
                  li x26, 0xd194ccac
                  li x28, 0xf3f0124e
                  li x29, 0x5
                  li x30, 0xfaf23392
                  la x31, user_stack_end
main:             sltu         s7, a1, gp
                  sll          sp, s6, a6
                  fsqrt.s      fa6, ft11
                  ori          ra, t1, -1433
                  fsgnj.s      fs9, ft5, ft10
                  fadd.s       ft7, ft1, ft8
                  srai         s9, s4, 2
                  fsgnjx.s     ft4, fs7, fa5
                  sra          gp, s3, t5
                  fmv.w.x      fa0, s11
                  ori          s10, s7, -876
                  div          s8, s0, a2
                  feq.s        s0, fa7, fa6
                  fsgnj.s      ft7, fa4, fs7
                  flt.s        a1, ft3, ft3
                  fsgnjx.s     fs2, fs2, ft3
                  fcvt.s.w     ft4, s5
                  xori         zero, s8, 1860
                  fle.s        tp, fs7, fs7
                  add          s5, s3, s1
                  fsgnjn.s     ft1, ft9, fa0
                  xori         a6, s7, 1531
                  xor          a6, s6, zero
                  fmin.s       fs10, ft10, fs10
                  sltu         s2, s0, s11
                  fadd.s       fa5, fa4, ft11, rne
                  fdiv.s       fs9, fs5, ft4, rtz
                  srli         s9, t0, 18
                  sltu         t1, t4, t1
                  lui          tp, 426533
                  add          a6, a0, s9
                  sltu         t2, s8, s9
                  divu         s9, a0, a4
                  fdiv.s       fa1, fs2, ft10, rmm
                  fcvt.w.s     s1, fs1
                  sll          a0, zero, s2
                  srai         a4, a3, 12
                  fmul.s       ft6, fs3, fs11, rup
                  mulhu        s7, s3, a2
                  flt.s        gp, fa3, ft10
                  auipc        sp, 332893
                  slli         t1, s6, 0
                  slt          a6, gp, t3
                  fsgnjx.s     fs10, fs11, fs0
                  sltiu        a3, s2, -1222
                  srl          a7, s2, t0
                  fcvt.s.w     fs2, s1, rup
                  xori         s2, s2, -1282
                  sra          s1, s4, s10
                  fmv.w.x      ft7, s3
                  fsgnjn.s     fs0, fs0, ft2
                  mulhu        t2, s3, sp
                  fsgnjx.s     ft0, fa4, fs4
                  fmin.s       fa1, fs1, ft9
                  fmax.s       fs9, fa3, fa6
                  mul          zero, a7, sp
                  or           s2, a5, t0
                  xori         s7, s8, -1379
                  sra          s7, s1, a5
                  mul          a6, s7, a7
                  sub          s6, t1, t2
                  slt          s9, a5, a5
                  slt          a5, a2, t6
                  ori          a3, t3, -680
                  srai         tp, gp, 14
                  lui          tp, 133043
                  or           tp, s1, t2
                  sltiu        s2, a6, -1916
                  feq.s        s3, fs0, fa6
                  or           t3, a1, s7
                  fmv.x.w      s8, fa4
                  xor          t0, a3, t4
                  fmax.s       fa6, fs1, fs8
                  sll          t2, zero, a1
                  fle.s        s3, ft7, fs6
                  auipc        s10, 405875
                  feq.s        zero, ft6, fs11
                  or           a2, s7, a2
                  slli         t2, zero, 14
                  srl          s9, a4, t1
                  fcvt.s.wu    fs4, ra, rne
                  xor          s9, s10, t4
                  srai         s10, a4, 19
                  addi         a6, t1, 1123
                  slti         ra, s4, -1312
                  flt.s        a7, fs2, ft8
                  mulhsu       tp, s6, s10
                  sub          s0, t5, a1
                  nop
                  fsub.s       fa5, fa7, fa0, rdn
                  divu         s0, s10, t2
                  feq.s        s0, fa0, fa7
                  fle.s        a2, ft2, fs5
                  fcvt.s.w     ft3, s4, rup
                  fsgnjn.s     fs4, fs11, fs11
                  fmax.s       fa0, fa2, fa3
                  sub          s8, a3, t3
                  fmax.s       fs6, fs3, fs6
                  fmv.w.x      ft11, t2
                  srai         zero, s8, 11
                  xor          t4, a5, t1
                  flt.s        s5, fs7, fs1
                  ori          a7, t4, -27
                  xori         s8, s2, -519
                  fsqrt.s      fs1, ft11
                  add          a7, s2, s9
                  lui          tp, 645774
                  sub          a5, a7, s10
                  sra          t0, s7, t0
                  addi         s5, t3, 1037
                  lui          ra, 756846
                  sra          s5, s5, a3
                  fsqrt.s      fs2, fs11, rne
                  nop
                  sll          tp, t4, s11
                  divu         s7, a3, s6
                  sltu         s1, a2, t3
                  fsgnjx.s     ft1, fs2, fa3
                  flt.s        ra, fs8, ft3
                  sub          a3, t1, a2
                  fcvt.wu.s    t3, ft4
                  fmax.s       fa6, ft7, fs6
                  fmin.s       ft7, ft1, ft6
                  div          t3, a7, t5
                  srai         t4, a1, 7
                  mulh         tp, a4, a5
                  div          a1, a2, zero
                  fmv.x.w      a5, fa2
                  flt.s        s0, fs0, fs10
                  fmul.s       fs11, ft8, ft11, rdn
                  srli         a4, s1, 26
                  div          a0, t3, s9
                  auipc        t4, 183460
                  mulh         s2, a1, t2
                  fclass.s     a6, fa3
                  fsgnjx.s     ft0, ft3, fs9
                  andi         sp, a0, -274
                  fclass.s     s3, fs10
                  fcvt.s.wu    fs11, s0, rmm
                  fcvt.wu.s    zero, fs1
                  fmv.x.w      s2, ft10
                  mul          sp, s2, s7
                  rem          s1, s10, a2
                  fmax.s       ft11, ft1, fs7
                  fadd.s       ft0, fs6, ft0
                  fsqrt.s      fs2, fs3
                  fsgnjn.s     ft4, ft8, ft2
                  fcvt.s.wu    fs5, gp, rdn
                  mulhsu       ra, t2, a3
                  mulh         ra, a4, s10
                  or           s6, a1, s11
                  slti         a7, zero, 903
                  feq.s        a2, ft11, fs4
                  fcvt.s.w     fs7, a5
                  mul          t0, a0, ra
                  fmv.w.x      fa7, a1
                  fmul.s       ft4, fa5, fa6
                  srli         a2, s7, 24
                  addi         zero, s1, -953
                  fclass.s     a2, fs9
                  auipc        sp, 566525
                  slli         t4, s2, 7
                  divu         s2, a3, a4
                  fclass.s     t1, ft1
                  fmv.w.x      fa3, s9
                  fmv.x.w      zero, ft6
                  sltiu        s5, a7, 1286
                  sra          a7, a3, gp
                  or           s5, gp, t2
                  sll          s10, t2, t2
                  andi         a7, t0, 676
                  flt.s        s2, fs2, fa5
                  auipc        a1, 556899
                  fmul.s       fa2, fs7, ft6, rtz
                  sltiu        gp, s5, -246
                  andi         s0, sp, 1842
                  fsgnjn.s     ft1, fs8, ft1
                  fsgnjn.s     fs2, fa6, fs11
                  fmin.s       fa1, fa4, ft2
                  fmul.s       ft6, ft3, fs3
                  sltu         t3, s11, a3
                  srl          s3, s2, s9
                  div          s7, s8, s7
                  andi         s1, a0, 1316
                  sltiu        s1, a1, 1111
                  fmin.s       fa1, ft7, fs5
                  lui          tp, 90764
                  fclass.s     s9, fa2
                  slt          t3, a2, a3
                  sltu         a5, zero, s3
                  and          a5, s9, s1
                  fmv.w.x      fa5, s2
                  slli         s8, s10, 7
                  mulhu        a0, a0, sp
                  fsgnj.s      ft3, ft0, ft11
                  fle.s        t1, fs1, fs4
                  xori         s3, gp, -1608
                  slli         s9, t4, 0
                  fsgnjx.s     fa7, fs8, fs3
                  sll          ra, zero, s7
                  fcvt.wu.s    s6, fs11, rup
                  fadd.s       fa5, fs8, ft6
                  rem          a0, a2, s10
                  fle.s        s9, fa6, fa0
                  or           t0, a2, a1
                  sltu         zero, s9, s9
                  fsub.s       ft4, fs4, ft2, rtz
                  fadd.s       fa2, fs2, fs6, rup
                  add          a1, t1, t1
                  fadd.s       ft1, fs11, fs5
                  rem          s2, t1, s10
                  xor          a4, zero, tp
                  fmax.s       fa2, ft9, fa3
                  fmax.s       ft1, fa7, fs1
                  fmul.s       fa4, ft5, ft0, rup
                  rem          s4, a7, ra
                  slt          sp, s6, s10
                  fsgnjn.s     fa6, ft8, ft6
                  slt          sp, a3, a2
                  sra          t0, s6, s6
                  srai         a4, t0, 18
                  fsqrt.s      fs1, fa4
                  remu         s5, s7, tp
                  sltiu        s8, sp, 408
                  xori         s3, s5, 1931
                  srl          t1, a0, a6
                  remu         s6, s3, s0
                  fadd.s       ft4, fs11, ft11
                  fmin.s       fs11, ft10, fa6
                  fmax.s       fa6, fa7, fa0
                  fsqrt.s      fs3, ft6, rne
                  fsgnjn.s     ft3, fa5, ft2
                  xori         s9, t2, 1175
                  rem          a2, t0, a4
                  fmax.s       ft8, fs5, fa3
                  feq.s        a2, ft0, fs10
                  fsgnjx.s     fs11, fs6, fa1
                  mulh         s2, s6, a5
                  fcvt.s.wu    fa6, a4, rtz
                  flt.s        s10, fa7, fs4
                  fdiv.s       fs10, fa3, fa2
                  fdiv.s       ft1, ft11, fs6
                  fsqrt.s      fs7, ft6
                  and          a4, zero, a3
                  fcvt.s.w     ft6, s9
                  srl          t3, a1, s9
                  fle.s        s2, fa5, fs0
                  ori          s7, t2, -122
                  flt.s        s8, fs4, ft11
                  sltiu        s8, zero, -539
                  fcvt.s.w     ft5, s10, rtz
                  auipc        a7, 625772
                  srli         a2, a1, 21
                  sll          a3, s1, s6
                  mulhsu       gp, a0, s5
                  fmin.s       fa1, ft3, fs0
                  fcvt.s.w     fa3, zero
                  mulhu        s1, a6, a6
                  auipc        t2, 748641
                  fcvt.w.s     t0, fa3, rdn
                  fsgnj.s      fs7, ft2, fa5
                  slt          a5, s10, tp
                  fdiv.s       fs9, ft0, fs6
                  fcvt.s.wu    ft8, t5, rne
                  fclass.s     s10, fa7
                  remu         s3, s3, s11
                  mulhsu       tp, tp, s0
                  fsqrt.s      ft3, fa3
                  fclass.s     t2, ft9
                  ori          s5, t6, -1086
                  fcvt.wu.s    zero, fs9
                  mulhsu       a6, s6, a2
                  fsgnjn.s     fs1, fs2, ft2
                  mul          s4, s11, s1
                  div          t4, a5, ra
                  fsgnjx.s     ft5, fa2, fs8
                  xori         s5, s9, 1180
                  sltu         a0, s1, sp
                  srai         s7, a5, 16
                  fcvt.s.w     fs2, s10
                  fmax.s       fs5, fa5, ft4
                  fsgnjx.s     ft9, ft6, fs10
                  add          s3, t1, t4
                  xor          s7, s4, t2
                  fcvt.s.wu    ft1, tp, rmm
                  fsgnjn.s     fs2, fa4, fa7
                  div          s10, t0, t6
                  nop
                  or           a0, s2, s1
                  fsgnj.s      ft1, ft9, fs11
                  addi         t3, sp, 1926
                  fadd.s       fs4, ft1, ft6
                  mul          a5, t5, t0
                  ori          s2, s6, -171
                  fmin.s       fa5, fs8, fa2
                  sltu         s6, s0, s2
                  sra          tp, s2, a3
                  div          a2, t1, tp
                  fmv.w.x      fs9, a4
                  fle.s        s6, fa5, ft5
                  fmin.s       ft3, fa7, fs5
                  fsgnjn.s     fa4, fa6, ft3
                  addi         s9, s6, 1032
                  addi         s0, gp, -585
                  fmul.s       fa4, fa2, fs2
                  sra          s1, a2, s8
                  mul          t0, t1, gp
                  fcvt.wu.s    s5, ft5, rmm
                  fdiv.s       fa1, ft11, fs4
                  slti         t4, s3, -1189
                  ori          s5, s2, -1016
                  fmax.s       fs0, fs2, fs5
                  fle.s        s9, ft11, fs5
                  fmin.s       fs6, fs3, fa4
                  sll          s4, a2, s3
                  mul          s3, t2, t4
                  sll          a5, t6, t3
                  fmin.s       ft5, fs5, ft4
                  fcvt.wu.s    a5, ft9
                  remu         s5, s7, s10
                  addi         a5, t4, 669
                  lui          sp, 1039252
                  divu         s5, s7, a0
                  fsgnjn.s     ft4, fs7, fs6
                  fcvt.s.w     ft5, tp, rtz
                  sltiu        a6, t4, 1708
                  feq.s        s9, ft1, fs10
                  fsgnjn.s     fa3, fa0, fs9
                  fmv.x.w      a7, fs1
                  fcvt.w.s     a3, fs11
                  fmul.s       ft3, fs7, fa6, rne
                  fmax.s       ft11, fa7, fs6
                  slti         a3, a7, -609
                  mulh         zero, s5, s3
                  sub          a5, a7, a3
                  fdiv.s       fa6, fa5, fs1, rne
                  fmin.s       ft11, fs1, ft3
                  srl          a4, t2, s8
                  xori         s5, t6, 93
                  andi         tp, a7, 273
                  add          t2, t3, t0
                  feq.s        a7, fa4, fs3
                  div          zero, s11, s3
                  fcvt.s.w     fs4, ra
                  remu         s2, t2, gp
                  sltu         t4, s0, s3
                  mulhsu       a2, t3, a1
                  fmin.s       fs9, ft0, fs8
                  auipc        s1, 311978
                  fcvt.w.s     t2, fs8
                  fsub.s       fa0, fs9, ft4
                  or           s3, sp, t6
                  srai         s8, s8, 13
                  divu         t4, a5, s9
                  sll          s4, s3, s7
                  srai         a0, s7, 17
                  fmv.w.x      fs8, a1
                  and          s9, s10, t4
                  fsqrt.s      fa2, fs7, rup
                  sub          s5, a2, a7
                  fcvt.s.wu    ft10, s7, rdn
                  and          t3, a0, a3
                  flt.s        t3, ft10, fa2
                  add          zero, s4, s4
                  mulh         a1, s11, tp
                  mulh         t2, sp, t5
                  fcvt.w.s     s9, ft10, rmm
                  rem          t1, t4, t2
                  fadd.s       ft8, fs6, ft4
                  nop
                  addi         s6, a5, 3
                  fsgnjx.s     fs9, fs7, ft0
                  or           t3, a1, a2
                  mul          s5, t0, s9
                  slli         zero, a3, 26
                  fdiv.s       fa6, fs11, fs9
                  fmv.x.w      sp, fs3
                  addi         t1, a0, 1617
                  flt.s        s6, ft0, fs2
                  fmax.s       fs4, ft4, fs0
                  fsqrt.s      fa2, fs8, rup
                  fmax.s       fs2, ft10, fs0
                  mulhu        a2, s6, a6
                  mulhsu       s8, a2, a5
                  fsub.s       ft4, fa1, ft4
                  fsub.s       fa5, fa2, fa5
                  srl          a0, ra, s2
                  fmin.s       fs2, ft3, ft10
                  fmul.s       fs10, ft9, fa5, rmm
                  addi         s5, s2, 321
                  fmin.s       fa1, fa2, ft3
                  slli         a3, tp, 12
                  auipc        t1, 673645
                  ori          a1, a0, 398
                  mulhsu       a3, sp, s2
                  fsqrt.s      fa4, ft5
                  srli         t3, sp, 6
                  andi         t4, s6, 1513
                  auipc        sp, 602267
                  mulhsu       t2, sp, a4
                  mulh         a1, a5, gp
                  rem          s6, sp, s9
                  fcvt.s.wu    ft4, s6
                  sra          s9, tp, a3
                  mulh         t2, a3, a6
                  sll          t0, a0, s1
                  fle.s        a6, fa5, ft9
                  slli         s8, s11, 16
                  or           s10, s2, s2
                  slt          s10, s9, s0
                  sra          a6, t4, zero
                  fmul.s       fa0, ft2, fs9
                  sll          t0, t5, s7
                  fclass.s     s1, fa2
                  fadd.s       fs8, fs9, fa7
                  lui          s1, 620163
                  andi         t3, s9, 2013
                  mulhsu       a3, s0, ra
                  slli         s2, s2, 2
                  slti         tp, s10, 63
                  sltiu        a2, s11, -1050
                  fsgnjx.s     fs1, ft11, fs11
                  fcvt.wu.s    s3, ft8
                  remu         a2, a7, t5
                  slli         s1, t3, 14
                  fcvt.wu.s    gp, fs3
                  mulhu        a4, gp, t6
                  sltu         sp, a3, s10
                  srai         t1, t1, 25
                  fle.s        a6, fa4, ft4
                  srl          s2, s8, s6
                  mulh         a4, zero, s1
                  fsqrt.s      fs11, ft7
                  fmul.s       fs10, ft10, fs8, rmm
                  mulh         gp, t6, s5
                  mulh         a2, s2, t0
                  slt          sp, s6, ra
                  remu         a3, s1, a3
                  fcvt.s.wu    fs8, s9
                  fsgnjn.s     ft2, fs5, ft11
                  srli         s6, a0, 4
                  fsgnj.s      ft4, fs0, fs4
                  fcvt.w.s     t4, fs4
                  srai         t3, s3, 27
                  div          s9, a1, zero
                  lui          a4, 900258
                  remu         a5, s6, tp
                  fsub.s       ft11, ft0, fs11
                  mulhu        a1, s7, a2
                  and          s9, s11, s9
                  div          s3, t2, tp
                  fmin.s       fa4, fa3, ft0
                  sra          s10, s11, s9
                  nop
                  divu         tp, tp, s4
                  fsqrt.s      fa2, ft1, rup
                  andi         s1, a7, -1366
                  fmin.s       ft5, fs5, fs6
                  fmv.w.x      ft0, a1
                  fsgnjn.s     fa1, ft4, ft10
                  and          s10, s6, s5
                  divu         s8, a5, a0
                  add          s5, s8, s10
                  fmin.s       ft11, ft9, fa6
                  fsgnjn.s     fa2, ft9, fs1
                  mul          a1, s8, a3
                  mulhsu       gp, t2, a3
                  slli         a7, a6, 15
                  rem          a4, s0, gp
                  div          a6, s5, t2
                  sltiu        a1, s6, 569
                  mulhu        sp, s8, t5
                  fmax.s       fs4, fs4, fa5
                  feq.s        a2, fa4, ft7
                  divu         s0, s4, s10
                  fcvt.w.s     a0, ft10
                  rem          s3, t0, s2
                  fmv.x.w      a7, fa0
                  ori          s9, t5, 1271
                  mulh         s3, a1, t2
                  fcvt.s.w     ft0, a6
                  div          s6, s9, t4
                  fsgnj.s      ft6, fs2, ft5
                  remu         t1, a5, s4
                  ori          a6, a0, 1285
                  sltu         s8, t6, s11
                  fmv.x.w      s10, fs8
                  fsub.s       fa5, ft9, ft1
                  fmv.w.x      ft5, s4
                  sltu         t3, a5, t3
                  fmv.x.w      t1, fs11
                  flt.s        s5, ft11, ft0
                  rem          a4, gp, s1
                  lui          s5, 514519
                  fmul.s       fs8, fa4, ft7, rup
                  fsgnj.s      fs6, fs1, fa5
                  fdiv.s       ft11, fs2, fa2, rtz
                  fsgnj.s      fa6, ft9, fs8
                  rem          t4, s6, gp
                  slti         ra, a5, 33
                  flt.s        s7, fs11, fs2
                  fsub.s       fs8, ft3, ft0, rmm
                  addi         s0, ra, -664
                  mulhu        s8, t4, a4
                  or           s6, s4, a1
                  sltiu        t4, s4, 324
                  addi         a7, a0, -35
                  addi         s7, a2, 1750
                  slli         s8, t2, 24
                  sra          a0, s8, s0
                  srai         a4, s5, 22
                  xori         t3, a1, 126
                  fmv.w.x      fa3, s11
                  sra          t2, s1, a3
                  slli         a4, t2, 10
                  addi         s1, t5, 1488
                  fcvt.w.s     s9, ft5
                  fdiv.s       fs10, ft10, ft7
                  fsgnjn.s     ft5, fs9, fs11
                  fsqrt.s      ft4, fs8, rdn
                  srl          a2, t6, a1
                  sltiu        a5, a1, -912
                  add          t2, s9, t6
                  fsqrt.s      fa0, fa0
                  or           t4, sp, t2
                  lui          s0, 252975
                  sub          s10, a6, t4
                  rem          a7, a0, a1
                  remu         a1, s4, a5
                  fle.s        tp, ft10, fa5
                  fcvt.wu.s    s10, ft5, rmm
                  flt.s        s6, fa7, ft6
                  fsgnjx.s     fa6, ft2, fa7
                  fsgnj.s      ft9, fs6, fs10
                  nop
                  fmax.s       fs9, ft4, ft8
                  andi         zero, s6, 1301
                  mul          a4, a1, a0
                  and          a3, gp, a5
                  srai         a5, a0, 18
                  fsub.s       fa3, fs3, fa3, rup
                  slti         s2, tp, 1937
                  remu         gp, sp, tp
                  fcvt.s.wu    ft8, s5
                  auipc        s0, 639433
                  sra          gp, s10, s2
                  ori          a3, t1, -959
                  sll          tp, t1, s2
                  feq.s        s2, fa3, fs7
                  fmv.x.w      a6, fs3
                  fmv.w.x      fs11, a1
                  xor          t4, t1, s9
                  sub          s2, t6, t2
                  mulhu        s10, t0, s8
                  addi         s4, zero, -990
                  slt          tp, a0, a7
                  lui          s7, 569134
                  mul          a1, gp, t0
                  fsqrt.s      ft4, fs2
                  sra          zero, s6, t6
                  slli         a7, a3, 15
                  sub          a2, t2, s6
                  or           s5, t0, sp
                  remu         t3, a4, s10
                  fdiv.s       fa7, fa0, ft4, rtz
                  fclass.s     s1, ft11
                  fadd.s       fs6, fa1, ft5
                  addi         a4, t2, 266
                  lui          s5, 705746
                  sra          s4, t2, s9
                  fcvt.s.w     ft4, s1, rne
                  fmax.s       fs2, ft5, fs5
                  add          s9, t5, sp
                  sltu         s7, s4, a7
                  mulh         s8, t0, s8
                  or           sp, a3, t6
                  fle.s        s0, ft10, ft8
                  fcvt.w.s     s8, fa1
                  fsgnj.s      ft9, fs4, ft4
                  mulhsu       a3, t3, t1
                  fsqrt.s      fa1, fa6, rtz
                  fdiv.s       fs5, ft6, fa3, rmm
                  fcvt.s.wu    ft11, zero
                  flt.s        s4, fa2, ft0
                  fdiv.s       fa1, fa4, ft9, rup
                  fmul.s       fs6, ft9, fa3
                  sltu         s5, s7, a5
                  xori         s3, s5, 149
                  slti         s6, t2, 1043
                  divu         gp, t5, t1
                  addi         a2, sp, 1367
                  sub          s9, t4, sp
                  div          a4, t0, a7
                  fsgnj.s      fs7, fa0, fs6
                  fcvt.s.wu    fs6, sp
                  remu         tp, zero, tp
                  fcvt.wu.s    ra, fs5, rtz
                  xor          s0, s5, ra
                  mulhu        a7, a5, s7
                  div          s1, t2, s3
                  xori         s7, s9, 1169
                  srai         t0, a1, 13
                  or           s10, t3, a5
                  fclass.s     s10, fs0
                  slti         a0, s9, -546
                  slli         s5, s7, 8
                  sltiu        tp, s0, 1065
                  addi         s6, s9, -1662
                  fsgnj.s      fs7, fs1, ft1
                  flt.s        s10, fa5, ft6
                  fsqrt.s      fs6, fs3
                  mul          s0, a0, a3
                  fmv.x.w      gp, fs6
                  fmul.s       fa4, ft5, fs7
                  mulhsu       s4, s8, t3
                  mul          a4, gp, t4
                  fcvt.s.w     fs2, t2, rdn
                  sltu         a3, s2, a5
                  fsgnjn.s     fa2, ft6, ft6
                  fmv.w.x      fa5, s6
                  srl          s6, tp, t0
                  or           s8, t5, a0
                  fdiv.s       ft7, ft3, fa4, rtz
                  fclass.s     s0, fs1
                  fle.s        a4, fa1, fs1
                  rem          a6, s11, a3
                  slt          a4, a4, t4
                  div          s8, s1, zero
                  mul          s10, ra, zero
                  nop
                  sra          a4, s1, s9
                  slti         a3, s1, 1365
                  mul          gp, a6, a3
                  xori         sp, sp, 568
                  sub          tp, s8, s0
                  fmax.s       fs5, fs3, fa0
                  flt.s        a2, fa2, fs0
                  srl          a1, a1, a0
                  add          s2, s9, t6
                  fcvt.s.w     ft5, a5, rmm
                  fclass.s     a5, fs4
                  fmul.s       fs9, fa0, fs0, rne
                  fmin.s       fs10, fs1, ft4
                  ori          a5, s5, 464
                  mul          s4, s6, s3
                  fcvt.wu.s    s2, ft3
                  sll          s1, s10, a7
                  mulhu        s8, t3, t5
                  mulhu        s2, s8, a7
                  sub          a0, a5, a7
                  sltu         a1, a6, s11
                  fsgnjx.s     fa5, fa4, fa0
                  fsgnjx.s     ft8, fa5, ft3
                  sub          s1, a2, t6
                  andi         t4, s4, -56
                  xori         t1, s4, 1300
                  fcvt.s.wu    fa5, s10
                  fdiv.s       fa4, fa3, fs6, rne
                  fsgnjx.s     ft2, fs11, ft4
                  xor          s2, tp, t4
                  mulhu        t1, gp, s4
                  fsgnj.s      fs10, fs8, fa5
                  sub          tp, a5, t2
                  fsqrt.s      fa4, ft7, rne
                  fle.s        zero, ft4, ft2
                  fcvt.s.wu    ft6, a6, rne
                  divu         sp, s5, s10
                  fcvt.s.wu    ft6, s6
                  fmul.s       fa4, fa7, fs7
                  div          s5, s9, t1
                  nop
                  fcvt.w.s     t2, fs6, rmm
                  fmul.s       fs7, ft1, ft0, rtz
                  mulh         a3, s3, s3
                  div          a5, gp, sp
                  rem          s7, t4, s7
                  slt          gp, s4, a7
                  sltu         a1, sp, t1
                  slt          a6, t1, a7
                  fcvt.wu.s    a5, fs5, rmm
                  xor          a5, t4, a6
                  fcvt.w.s     s10, fs9
                  nop
                  andi         s4, ra, -117
                  fsub.s       fs11, fs6, fs3
                  fdiv.s       fa1, fa1, fs5, rmm
                  srli         s7, s1, 22
                  and          a0, a4, a3
                  fmv.x.w      s1, fs3
                  fle.s        s6, fs7, fs7
                  fadd.s       fs8, ft2, fs1, rne
                  lui          s10, 292960
                  slli         s9, a1, 25
                  lui          a3, 489138
                  slt          t0, s10, s0
                  xor          ra, a2, s4
                  fsgnjn.s     ft10, fa1, fs0
                  mul          t2, a3, t6
                  or           s0, a7, s1
                  sltiu        t1, t0, -1716
                  fmin.s       fs4, fs11, ft11
                  srl          s9, s4, s1
                  slti         a0, s8, 2010
                  srl          s4, a2, s4
                  srl          s6, s7, a6
                  add          a1, t5, t1
                  xori         s8, s3, -838
                  fadd.s       fa0, fa5, ft10, rmm
                  xori         sp, gp, 183
                  srli         tp, s9, 0
                  and          gp, s5, tp
                  fclass.s     s6, ft4
                  fcvt.w.s     a7, ft0, rup
                  nop
                  mulh         s3, a4, a4
                  fcvt.w.s     s3, fs11, rne
                  lui          s2, 1041180
                  fmv.x.w      t4, fs8
                  remu         sp, t1, a1
                  flt.s        s0, ft4, fs5
                  div          tp, s7, t5
                  fsqrt.s      fs4, ft0
                  sub          s7, t6, s1
                  mulh         a2, sp, a2
                  fsub.s       fs10, fs9, ft7, rmm
                  sltu         s4, a3, t0
                  fsgnj.s      fa3, fs7, fs1
                  slti         gp, s9, 237
                  slti         t2, t6, 2025
                  fsqrt.s      ft6, fs11, rne
                  fcvt.s.w     fs2, s4, rne
                  ori          a4, s2, -1828
                  xor          s1, s9, zero
                  flt.s        sp, ft8, fs5
                  div          t0, s1, s4
                  sll          a0, t1, t4
                  sltiu        s1, a3, -485
                  fsqrt.s      fa6, fs2, rne
                  auipc        a6, 1010622
                  fmv.x.w      s4, fa7
                  fmv.x.w      t3, fa5
                  nop
                  fcvt.w.s     a0, ft10
                  mulhsu       t3, t1, a3
                  and          a0, s9, zero
                  fle.s        s8, ft9, fs5
                  feq.s        t3, fs5, fs10
                  sltiu        s3, tp, 36
                  fclass.s     zero, ft5
                  slti         s9, tp, 1964
                  divu         t0, s9, s6
                  fcvt.s.wu    fs4, sp
                  mulh         s6, t1, s8
                  sra          t0, a4, a4
                  fmul.s       fa4, fs3, fa6, rne
                  fcvt.s.w     fa6, s9, rmm
                  fcvt.s.w     fs5, gp, rtz
                  fsqrt.s      fs9, ft11
                  ori          a5, a0, 419
                  fsgnj.s      fs4, fs6, ft11
                  slt          t3, s6, s5
                  fsgnjn.s     fa3, fs11, fa1
                  fmax.s       fa7, fa1, ft1
                  fmv.x.w      a1, fs7
                  sltu         t0, a3, s0
                  fcvt.w.s     sp, fs7, rmm
                  mulh         a3, t4, a0
                  fcvt.wu.s    tp, ft7
                  fle.s        gp, ft6, fa5
                  fsgnjx.s     ft2, ft11, fs9
                  fdiv.s       fa7, fa6, ft1
                  mulhu        s1, sp, a4
                  ori          a0, a3, 1099
                  andi         s10, a7, 2024
                  nop
                  fcvt.wu.s    a6, fs10
                  slli         s2, s8, 5
                  ori          s7, a5, 658
                  mulhsu       a3, s5, a4
                  fle.s        gp, fa6, ft0
                  rem          s10, t2, s4
                  addi         s3, a6, 659
                  fcvt.s.w     ft3, s11, rmm
                  fmax.s       fs8, fs9, fs10
                  sub          tp, gp, s10
                  xori         s7, a4, -1271
                  sltiu        s6, s10, -1569
                  fsub.s       fs7, fs6, ft8
                  sub          a7, s9, sp
                  fcvt.w.s     s0, fs4
                  srli         ra, t6, 24
                  fcvt.s.w     ft6, s5
                  mulhsu       t4, s7, s2
                  sltu         a2, s11, s4
                  nop
                  slli         a1, a7, 22
                  auipc        a7, 703278
                  xor          s3, s8, s9
                  fle.s        a2, ft10, fs11
                  srli         s7, a7, 7
                  nop
                  srli         a0, a2, 15
                  xor          a1, a3, s6
                  and          s3, ra, a7
                  fmv.w.x      fs2, s8
                  fsqrt.s      ft2, ft6, rup
                  sltu         a7, tp, s9
                  fadd.s       fs3, fs0, ft8, rne
                  srl          zero, t6, a3
                  fsgnjn.s     fs8, ft0, ft1
                  fsgnjx.s     ft3, fa3, ft0
                  fmv.w.x      fa2, s3
                  fmv.x.w      ra, fa3
                  fadd.s       fa4, ft0, fs4
                  and          s10, t1, s3
                  divu         t4, a2, s5
                  slli         a7, t2, 16
                  fcvt.s.wu    fa5, s2
                  fcvt.w.s     ra, ft1, rne
                  andi         zero, t4, 22
                  fcvt.s.w     fs5, a6
                  or           a6, s10, a6
                  fmul.s       fa6, fs2, fa4, rdn
                  nop
                  ori          a6, a2, 1379
                  add          a3, ra, t2
                  fle.s        a7, ft7, ft9
                  sltu         t3, t5, s6
                  slt          a4, s10, s0
                  fadd.s       fs5, ft1, fa7, rup
                  fsgnj.s      fs6, ft10, fa0
                  addi         s0, s1, 531
                  fle.s        zero, ft7, fs7
                  fmax.s       fs6, fa3, ft1
                  sltu         s2, a3, s8
                  slt          s1, s6, zero
                  fmv.x.w      a6, fa6
                  mulhu        t4, s8, s7
                  sra          tp, sp, s8
                  mulhu        a2, s6, t5
                  or           zero, sp, t5
                  fcvt.wu.s    t2, ft9
                  fsub.s       fa3, ft5, ft7
                  fmul.s       fa6, fa1, fs4, rdn
                  add          gp, tp, a3
                  nop
                  fsub.s       ft0, ft9, fs10
                  addi         s1, t0, -1541
                  fsqrt.s      fa5, ft10
                  srai         s6, t5, 1
                  and          s10, s2, a1
                  xor          a0, t2, zero
                  remu         ra, a5, a2
                  feq.s        s4, fa5, fa7
                  sltu         t4, s4, sp
                  fmv.x.w      a3, fa1
                  slti         a0, a4, -1697
                  rem          a2, s5, s9
                  fcvt.s.w     fs9, a2
                  fmv.x.w      sp, fs4
                  sll          s0, s4, s8
                  addi         s8, s9, 1528
                  fmul.s       fs8, fs4, fs7, rup
                  fmv.w.x      fa4, a6
                  andi         sp, ra, 617
                  xori         t0, zero, 1983
                  lui          s4, 927632
                  srl          t0, a5, s2
                  sltiu        s7, ra, -114
                  lui          s3, 401396
                  add          a6, t2, s9
                  mulhu        s10, a1, s4
                  fmv.w.x      ft10, s3
                  nop
                  flt.s        zero, fa3, fa5
                  sltiu        s8, s5, -1411
                  auipc        t0, 802905
                  fmv.x.w      t1, ft1
                  slt          zero, zero, s1
                  div          s6, a3, zero
                  div          s9, s4, t4
                  slli         sp, t1, 6
                  fclass.s     sp, fa3
                  auipc        t0, 310289
                  fcvt.s.wu    ft4, s4
                  flt.s        t3, ft0, ft0
                  fcvt.wu.s    a4, ft7
                  mulhu        s7, ra, a6
                  fmul.s       fs5, fs7, fa4
                  fsgnjx.s     fs7, fs5, ft0
                  lui          ra, 247782
                  feq.s        a1, fa0, fs4
                  mulh         t0, t4, t3
                  fcvt.w.s     a1, fs8, rtz
                  rem          s9, a6, a3
                  fsgnj.s      fs10, fa2, fs10
                  fcvt.s.w     fs1, a4, rmm
                  mulhu        a7, s7, t3
                  divu         s1, s6, ra
                  fsgnjn.s     fa1, fs7, fa3
                  mulhu        s6, a0, s9
                  fclass.s     s0, fs5
                  lui          s4, 961069
                  rem          t0, s4, s6
                  fsub.s       fa4, fa6, fa0
                  fsgnjx.s     fs3, ft7, ft10
                  fcvt.w.s     a3, fa1, rdn
                  sub          s2, s10, a7
                  slli         a3, s0, 23
                  fcvt.w.s     gp, fs2
                  fmul.s       fs6, fs0, fa7, rup
                  sltu         s10, s5, a5
                  mulhsu       a7, s5, a5
                  rem          s9, t5, s5
                  srai         s6, s3, 26
                  srli         t1, t4, 17
                  sra          a3, t5, gp
                  fdiv.s       fs9, ft8, fa3
                  mulhu        tp, a1, t0
                  fsqrt.s      ft0, fa6
                  fsgnjx.s     ft3, fs8, ft6
                  fmin.s       ft4, fs7, ft1
                  fle.s        a3, fa5, ft9
                  sra          a0, a0, s1
                  fsgnjn.s     fs8, fa1, ft3
                  ori          s3, s3, 430
                  fsub.s       ft1, ft4, fs0, rup
                  fcvt.s.w     ft10, t6
                  fclass.s     t0, fs7
                  fmv.w.x      fa4, s3
                  fcvt.wu.s    tp, fs0, rne
                  srai         ra, a6, 4
                  slt          s1, t5, s5
                  fle.s        t3, ft7, fa7
                  fsgnjn.s     fs5, fs10, fa0
                  xori         a2, t3, -301
                  addi         s0, t2, -549
                  fclass.s     a3, ft9
                  fmul.s       fs9, fa3, fs10
                  srl          a4, t2, t2
                  lui          t2, 851259
                  remu         s3, a6, t1
                  fle.s        a2, fa1, fa3
                  fcvt.w.s     s3, fs4
                  fmv.x.w      a6, fa4
                  fmin.s       ft9, fs7, fa4
                  fmv.w.x      fa1, tp
                  sltiu        t3, a2, 1174
                  flt.s        tp, ft10, fs10
                  fsgnjn.s     fa1, fa7, fs0
                  div          s10, s11, tp
                  fmul.s       ft1, fa0, fs10
                  fmv.x.w      a1, fa1
                  srl          a2, t1, s9
                  srli         a3, a1, 16
                  div          s7, t6, t2
                  fle.s        t2, ft9, ft10
                  sll          s0, t3, s8
                  flt.s        t4, ft2, ft5
                  fdiv.s       ft0, fs6, fs1
                  fclass.s     a3, fs9
                  fmv.w.x      ft2, s0
                  addi         s2, a6, -1837
                  addi         a6, a6, 1638
                  slli         ra, s10, 31
                  flt.s        a4, fs11, fs1
                  fsgnj.s      fs5, fs6, fs8
                  fcvt.s.wu    ft11, s10
                  xor          s1, s9, s6
                  sra          gp, s0, s3
                  andi         a0, s4, -1179
                  mulh         a2, t2, t2
                  srli         a7, s11, 23
                  fsqrt.s      fs1, fs11, rne
                  mul          t2, t1, zero
                  andi         t0, t6, -1683
                  add          s3, t2, t1
                  fmv.x.w      a4, ft3
                  fsqrt.s      fs7, fs10, rmm
                  srli         a2, a2, 29
                  fmul.s       ft6, fs7, ft1, rne
                  ori          s2, a7, 1351
                  fdiv.s       ft9, ft10, ft3, rdn
                  fcvt.s.wu    fa3, s0, rne
                  fcvt.s.w     fs0, a4
                  fmv.w.x      ft0, t6
                  fdiv.s       fa1, fa2, fs6
                  flt.s        s3, ft5, ft8
                  feq.s        s6, fs6, fs4
                  srli         a2, tp, 12
                  sltiu        ra, s2, 1964
                  fcvt.w.s     s9, fa0, rtz
                  addi         a3, ra, -1095
                  sltiu        t2, t6, 388
                  ori          s5, t1, -1645
                  mulh         t4, s5, s6
                  ori          tp, s7, -1414
                  slt          a1, s8, t2
                  fmax.s       fs10, ft2, ft11
                  addi         gp, s9, 567
                  fmul.s       ft10, ft7, fs3
                  fcvt.s.w     fs7, s4, rmm
                  srli         t2, a0, 22
                  or           a6, t2, zero
                  fmv.x.w      s1, fs2
                  fsgnjx.s     fa2, fs5, ft9
                  srl          a2, a1, t4
                  slti         zero, s1, 571
                  fcvt.wu.s    t0, ft2
                  rem          s2, t6, ra
                  slti         ra, s11, -1711
                  fmv.x.w      s8, fa4
                  fmv.w.x      fa0, t6
                  divu         s4, s9, s9
                  fmv.x.w      s8, ft5
                  ori          s4, s11, 492
                  divu         a7, t1, t4
                  fcvt.s.w     ft2, a1, rdn
                  sub          a6, a3, a7
                  rem          t2, s10, sp
                  addi         s9, t3, -133
                  auipc        t1, 1035380
                  mul          s4, a7, s10
                  auipc        a0, 61894
                  fsgnjn.s     ft8, fa5, ft8
                  fcvt.s.w     ft8, a1, rmm
                  fsgnjn.s     fs9, fa5, fs7
                  fsqrt.s      ft6, fa5, rup
                  slti         s8, t3, 220
                  add          t2, a1, a5
                  remu         a1, a7, ra
                  srl          s6, s10, s0
                  add          s0, s7, gp
                  sll          s3, zero, gp
                  sra          s7, t1, a7
                  xor          ra, a5, s1
                  rem          a1, a7, a4
                  srl          t1, a7, sp
                  nop
                  flt.s        tp, fs3, fa2
                  fmv.x.w      gp, ft9
                  mul          s6, s9, t5
                  sub          s5, s2, s10
                  fsgnj.s      fs10, fs6, fs8
                  sub          a5, s7, s2
                  feq.s        a4, fa1, fa3
                  fadd.s       fs4, ft5, ft5, rtz
                  fsgnj.s      fs1, fa4, fa4
                  mulh         a6, s2, s11
                  fsgnjn.s     ft1, fs3, ft9
                  fclass.s     sp, fs0
                  ori          a4, s5, -131
                  sltu         tp, s9, a5
                  fsgnjx.s     ft8, fs4, ft11
                  fsgnjx.s     fs5, ft0, ft7
                  mulhu        tp, a0, s9
                  fadd.s       fs4, fs5, fs7
                  srli         sp, t1, 26
                  and          t0, t3, t6
                  mulhsu       s5, s10, s2
                  sltu         s1, t2, t4
                  fmv.w.x      fs9, s10
                  fadd.s       ft3, ft6, ft6
                  fsqrt.s      ft10, ft8
                  add          a1, s0, t3
                  mulh         zero, a2, ra
                  mulh         s2, s4, s6
                  mulhsu       gp, t5, s3
                  ori          zero, t4, 938
                  sltiu        s10, s1, 493
                  feq.s        a2, fs7, fs4
                  mul          s9, ra, s10
                  fmv.x.w      a7, fa3
                  sll          s4, a4, zero
                  fsqrt.s      ft11, fa4
                  fmax.s       ft3, fa6, fa7
                  fdiv.s       ft3, fs9, fa0, rne
                  fsqrt.s      fs2, fs4
                  mulh         t2, t2, zero
                  fcvt.s.wu    ft4, a4, rup
                  fcvt.wu.s    sp, fs6
                  fclass.s     a5, ft3
                  mulh         t4, a6, t2
                  nop
                  fsgnjx.s     ft4, ft6, fa6
                  srl          s5, a6, s3
                  fmul.s       fa1, fa2, ft5
                  mulhsu       ra, ra, t3
                  slli         t0, s0, 13
                  fle.s        s0, ft4, fs2
                  divu         a0, a6, s0
                  sltu         s4, s1, t3
                  fsgnjx.s     fs0, ft6, fs10
                  fsqrt.s      fs0, ft1
                  addi         a2, s0, 392
                  fadd.s       ft0, fs7, fa2, rdn
                  fle.s        s10, fs4, fs5
                  sltu         t4, s8, t2
                  sll          s7, s1, a4
                  fsqrt.s      fs11, fs0, rtz
                  flt.s        gp, ft10, fa1
                  rem          s8, t5, zero
                  and          sp, s11, a2
                  fle.s        a2, ft0, ft6
                  fmul.s       fa2, fa1, ft2
                  ori          a2, a6, -1065
                  fdiv.s       fs6, fa1, fa6, rdn
                  xori         s7, s11, 199
                  fsgnj.s      ft2, fa0, fs10
                  div          a5, s5, s5
                  xor          s5, s8, a2
                  flt.s        ra, fs5, fa4
                  rem          t2, s0, s7
                  srai         t0, sp, 20
                  fcvt.wu.s    ra, ft3
                  fdiv.s       ft8, ft0, ft1, rtz
                  sra          t4, s6, s4
                  mul          s0, s9, a3
                  srl          a7, a1, t5
                  fmax.s       fs8, fa1, fs11
                  fclass.s     a1, fa5
                  sltu         s5, s8, a1
                  xori         t0, gp, 200
                  fmv.x.w      t1, fs9
                  add          sp, s7, a4
                  srl          s5, t0, tp
                  sll          s7, a0, a3
                  mul          a4, s10, t6
                  fmax.s       fa6, ft2, fs11
                  fmv.w.x      ft11, s6
                  slli         s2, a0, 10
                  fle.s        s7, fs0, ft7
                  xor          t0, t4, s2
                  fsub.s       ft10, ft0, ft5
                  sra          s7, tp, a0
                  xori         a6, t2, 1653
                  fmv.x.w      gp, fs11
                  mulh         sp, s7, t3
                  div          s1, s11, s8
                  mul          s9, a7, s6
                  fcvt.w.s     s6, ft0, rne
                  mulh         s6, ra, t1
                  mulh         t2, gp, t1
                  divu         t4, s0, sp
                  sra          gp, s7, s3
                  divu         s4, sp, a5
                  rem          t3, s10, t0
                  xor          gp, a3, s7
                  lui          s9, 103515
                  auipc        s10, 367113
                  sltiu        s4, zero, 906
                  fsub.s       fs1, fs5, fa0, rdn
                  fcvt.wu.s    s9, ft4
                  flt.s        s2, fa2, fa7
                  andi         gp, s4, -1174
                  mulh         s1, s9, s4
                  divu         gp, a6, s1
                  mulhu        ra, a0, a4
                  slli         s2, t2, 11
                  fmv.w.x      fs0, a6
                  fle.s        a6, ft11, fs11
                  fle.s        a0, fs10, ft0
                  div          t3, ra, s8
                  lui          t0, 482193
                  fdiv.s       fa4, fs6, fs10
                  sra          s2, a6, a6
                  auipc        a7, 396732
                  fsqrt.s      ft10, fs5
                  sra          sp, t4, gp
                  mulhu        a3, s7, a7
                  addi         s0, a5, -1976
                  mulhu        s0, a5, a4
                  slt          a6, t3, s8
                  sra          gp, s11, t5
                  sra          s6, a4, s7
                  addi         ra, t1, 1223
                  fmax.s       ft11, ft4, ft8
                  srli         zero, a0, 3
                  xor          tp, t0, t5
                  fmax.s       ft3, fa2, fs1
                  rem          s6, a1, s0
                  fsgnj.s      ft8, fa7, ft8
                  srai         t3, s2, 20
                  mulhsu       s5, gp, s3
                  lui          s8, 127654
                  sltiu        t3, s11, -1492
                  auipc        t0, 203865
                  fsgnjn.s     ft8, fa0, fs4
                  nop
                  add          ra, ra, a6
                  divu         s8, t0, a5
                  fle.s        t4, ft9, fs7
                  nop
                  andi         zero, s6, 317
                  xori         s1, t2, 214
                  fle.s        gp, fs5, ft10
                  mulhsu       t4, s1, gp
                  nop
                  fmul.s       fs1, ft2, fs4, rtz
                  fle.s        s4, ft7, fa6
                  or           gp, s1, a2
                  fmax.s       ft1, fa1, fs5
                  addi         t3, t1, 1904
                  fsgnjn.s     ft8, fs10, fa6
                  sltu         a2, s8, a1
                  slli         t4, s0, 19
                  mulhu        s8, zero, s11
                  srl          s7, a7, sp
                  ori          s2, zero, -128
                  or           a4, t6, t2
                  fcvt.w.s     a0, ft11, rne
                  fdiv.s       fs6, fs9, ft11, rne
                  fcvt.wu.s    s2, fa6
                  remu         s8, t1, s3
                  addi         s6, ra, -1623
                  fmul.s       ft5, ft3, ft9
                  fmul.s       fa7, fa7, ft8, rmm
                  srl          a6, t1, t2
                  fcvt.s.wu    fs10, s8
                  fmv.x.w      a2, fa7
                  addi         t4, t4, -1569
                  srli         ra, zero, 23
                  nop
                  fsub.s       fs1, ft3, fs10, rmm
                  fsgnjx.s     fs4, fs1, fs6
                  fadd.s       fs0, fa0, fa2, rmm
                  ori          zero, s3, -1655
                  sll          s3, s1, s2
                  mul          zero, t3, s10
                  nop
                  divu         t4, s1, t4
                  srl          s6, t2, t6
                  fcvt.wu.s    a4, ft7
                  fsgnjn.s     ft6, fa1, ft0
                  fmin.s       fs2, fa2, fs0
                  fsgnjn.s     fs4, ft6, fs0
                  divu         a7, s3, zero
                  sra          t0, t2, t3
                  remu         tp, a7, gp
                  fsgnjx.s     ft4, fs8, fs6
                  fmax.s       fa1, fa1, fa7
                  flt.s        zero, ft3, fa6
                  div          a0, s5, sp
                  fle.s        gp, fa3, fa5
                  sra          a6, a7, s10
                  fmv.x.w      sp, fs9
                  ori          t1, t0, 916
                  fdiv.s       ft6, ft8, fs5, rne
                  nop
                  mulh         s9, s3, s4
                  xor          s2, a5, ra
                  fclass.s     s9, ft6
                  sra          zero, t1, t1
                  fmv.w.x      ft6, t4
                  sltiu        t1, zero, -578
                  flt.s        s10, fs0, fs2
                  fclass.s     ra, ft5
                  fmv.x.w      s2, fs7
                  srai         gp, s10, 22
                  fmin.s       fa6, fs3, ft5
                  addi         s8, s0, -145
                  auipc        s1, 972569
                  fmax.s       fa1, fs4, ft11
                  auipc        a7, 715286
                  fadd.s       fa3, ft7, ft2, rne
                  fsub.s       fa5, ft6, fa3
                  addi         a5, s3, -383
                  flt.s        a6, ft11, ft7
                  fclass.s     t2, fs11
                  flt.s        s6, fs4, fs9
                  div          s6, gp, t6
                  sub          a0, t1, t4
                  rem          s3, a4, s10
                  mul          a6, a0, s5
                  nop
                  fcvt.s.w     ft3, s5
                  mulh         a1, t5, s2
                  fmul.s       fs4, fs7, fs8, rne
                  fclass.s     s0, ft4
                  slti         sp, s4, -736
                  fcvt.s.w     fa2, a6, rtz
                  fmin.s       ft7, fa2, fa7
                  remu         s0, s2, s0
                  fmul.s       fs3, fa6, ft10
                  sll          s2, gp, s10
                  fdiv.s       fs6, ft10, fa5, rmm
                  fclass.s     a4, fs1
                  div          t3, t0, s11
                  fmax.s       fs1, fs1, ft0
                  mul          ra, gp, t1
                  fcvt.w.s     t1, ft9, rdn
                  mulh         s2, t2, t0
                  fdiv.s       fa2, ft3, fa6, rdn
                  slti         t0, s4, 1402
                  sll          a1, t6, tp
                  sub          s5, s2, s11
                  srl          s8, s5, t1
                  add          a7, s6, s6
                  fdiv.s       ft6, fs1, ft11, rup
                  addi         tp, s3, 231
                  or           s8, a1, a6
                  fcvt.wu.s    s10, fs1
                  auipc        a7, 283233
                  feq.s        s4, ft3, ft3
                  fcvt.wu.s    s2, fa0, rdn
                  mulhu        s0, a1, ra
                  slt          a7, t3, t4
                  srli         s2, a2, 15
                  srai         t3, t1, 5
                  fsub.s       fs3, fs7, fs3
                  remu         t0, a0, sp
                  fsgnjn.s     ft6, fs2, fs11
                  mulhsu       a7, gp, a6
                  slt          s0, a3, t6
                  nop
                  lui          a2, 364233
                  mulhsu       gp, t1, t4
                  srli         t2, a7, 7
                  srai         s9, a7, 5
                  fadd.s       fs9, fs4, fs1
                  fsgnjn.s     fs4, fs5, fa3
                  add          s6, t6, a4
                  mulhsu       s1, s5, tp
                  sltiu        s2, t6, -1194
                  fcvt.w.s     a4, ft11
                  flt.s        sp, fs2, ft6
                  fsgnj.s      ft11, ft0, ft2
                  srli         s0, t1, 21
                  remu         t3, t2, a3
                  xor          a3, t2, t3
                  slt          a2, a3, s0
                  fadd.s       ft0, fs4, fs5
                  div          zero, a1, s10
                  srl          a6, s11, a6
                  auipc        a4, 789524
                  fcvt.w.s     a5, fs6
                  fcvt.s.w     ft4, a6
                  slti         t3, s4, 1551
                  slli         a3, a6, 27
                  or           s2, t3, s7
                  divu         t3, s11, s9
                  remu         s7, s10, a2
                  fcvt.wu.s    s2, fs5, rne
                  flt.s        s7, ft6, fa2
                  sltu         a4, t1, s10
                  fcvt.w.s     a7, fa2
                  fcvt.s.w     ft6, t1, rdn
                  or           a1, s10, s8
                  remu         s7, s1, tp
                  fsgnjn.s     ft11, fa7, ft5
                  addi         a4, ra, -757
                  fadd.s       ft1, fs11, fa4
                  divu         s8, ra, s1
                  xori         a3, s5, -1798
                  fsgnj.s      ft11, fs1, ft7
                  fadd.s       ft3, fa2, fs6, rne
                  add          s0, s10, s7
                  lui          a4, 429620
                  fle.s        tp, ft2, fa1
                  srl          a5, t5, a5
                  mulh         ra, sp, ra
                  mul          s4, s10, t5
                  nop
                  addi         s9, gp, 575
                  fclass.s     s1, fs0
                  addi         s0, t2, 756
                  slt          a0, s7, s2
                  flt.s        s7, fa5, fa5
                  srli         s6, t0, 8
                  flt.s        zero, ft9, fs2
                  fle.s        s8, ft4, ft11
                  fcvt.wu.s    s6, ft9
                  fsgnjn.s     fa3, fs8, ft10
                  xori         sp, s0, -192
                  fmv.w.x      fa4, s1
                  fsgnj.s      fa3, ft9, ft11
                  xor          ra, sp, a2
                  sltu         a1, a4, s11
                  srai         t3, t3, 21
                  feq.s        s4, fa5, ft9
                  fsgnj.s      fs4, fa1, fs11
                  divu         s2, a4, s10
                  divu         ra, s4, a0
                  fcvt.s.w     ft2, s9
                  remu         ra, s6, s9
                  fsgnjn.s     ft1, ft0, ft6
                  div          a6, s5, a0
                  mulh         a1, s9, s0
                  slti         ra, s0, 1375
                  sub          t0, t6, s6
                  sll          a7, s5, a1
                  slt          gp, gp, s4
                  addi         s7, gp, -1218
                  sub          s3, a0, a7
                  div          a6, s5, s0
                  sub          zero, a6, a7
                  srli         a3, a4, 31
                  mulhsu       s8, t1, t1
                  lui          t1, 576186
                  fsgnjx.s     fs4, fa4, fs2
                  fsqrt.s      fa4, fs3
                  fcvt.s.wu    ft10, t2, rmm
                  auipc        t4, 429908
                  fadd.s       fs11, fs9, fa4, rdn
                  fcvt.wu.s    a6, fa4, rmm
                  divu         t3, s8, s6
                  xori         t1, s0, -195
                  lui          t3, 308196
                  slt          a7, a3, t4
                  add          a7, s11, a6
                  fsub.s       ft10, ft0, fs5, rdn
                  slti         t1, t0, -1107
                  xor          s2, a5, s10
                  fmv.w.x      fs3, sp
                  xor          t3, s1, a7
                  lui          s5, 474325
                  fsgnjn.s     fs11, fs4, fs8
                  srli         a1, t4, 19
                  and          t0, t2, s11
                  mulhsu       s10, t0, t4
                  slti         a4, t5, -71
                  slti         zero, s10, -1711
                  slli         t3, t5, 11
                  fsgnj.s      fa6, fs1, fs3
                  flt.s        zero, ft8, fs2
                  add          s7, t6, s2
                  slti         a5, a4, 1049
                  sll          a1, a2, s10
                  ori          t2, s2, 1353
                  ori          s0, s8, 231
                  srli         a2, s8, 2
                  fle.s        t2, ft8, fa7
                  sltiu        a4, s11, 625
                  and          a5, a6, t5
                  or           zero, a3, zero
                  fmax.s       fs10, fs0, fa3
                  xor          t4, zero, a7
                  mulhu        tp, zero, ra
                  fmul.s       ft11, fs10, ft3, rtz
                  fsqrt.s      fa0, fs9, rne
                  fmv.x.w      t3, ft3
                  or           s6, t4, a7
                  and          ra, gp, s2
                  xor          a4, a6, a2
                  fsqrt.s      ft2, ft7
                  slt          gp, s4, s4
                  fsqrt.s      fs1, fs6
                  fsgnjx.s     ft2, fa1, fa7
                  slli         t3, a5, 24
                  fle.s        t4, ft11, fa3
                  fcvt.s.wu    fs7, a2, rmm
                  sltiu        a3, a7, -1335
                  mulhsu       ra, t0, ra
                  add          t4, a6, s7
                  fcvt.w.s     s3, ft2, rdn
                  xori         s2, a4, 912
                  fsgnj.s      ft8, ft1, fs9
                  fcvt.wu.s    a2, ft1, rne
                  fadd.s       ft8, fs8, ft7, rdn
                  srl          t0, a5, s10
                  fcvt.s.wu    fa0, ra, rne
                  slti         s7, a3, -1841
                  fmax.s       fa3, fa4, fs8
                  or           a3, s11, a4
                  fdiv.s       fs4, ft11, fs10
                  fcvt.wu.s    a0, fs9
                  sra          s1, gp, a0
                  fclass.s     a0, fs8
                  sra          zero, s2, t5
                  fcvt.w.s     s7, fs8, rdn
                  divu         s2, s1, t1
                  rem          t3, t3, a4
                  addi         a3, s5, 1595
                  xori         s0, a6, -1802
                  srai         s4, s11, 24
                  fsqrt.s      fa1, fs7, rne
                  fcvt.w.s     t0, fs6, rdn
                  rem          s8, a7, t2
                  feq.s        s2, fs10, fs1
                  fmax.s       fs7, fs2, fs6
                  slti         s4, t4, -227
                  fdiv.s       fa1, fs3, fa3, rtz
                  sra          a2, a6, t0
                  sll          gp, a7, s0
                  flt.s        t4, fs10, fa2
                  fsqrt.s      ft6, fs11
                  sra          a0, a7, a7
                  xori         t4, s7, 1651
                  srai         s7, gp, 3
                  sltu         gp, s0, t3
                  slti         s7, tp, -1824
                  sll          gp, s11, s3
                  fcvt.s.wu    fs6, s6, rdn
                  srai         s9, t0, 2
                  mul          s9, a6, gp
                  fcvt.s.w     ft0, s1
                  fmv.w.x      ft5, t5
                  srai         s6, gp, 7
                  fmv.x.w      tp, fa4
                  div          s4, a0, s2
                  sll          a4, s4, sp
                  fdiv.s       fs2, fa7, ft6, rtz
                  fcvt.wu.s    s8, ft11
                  lui          gp, 787097
                  or           s6, a5, tp
                  sub          t4, a3, s1
                  auipc        s1, 599481
                  lui          s4, 894969
                  and          a5, t5, a4
                  divu         s4, s1, zero
                  mul          t2, s11, s6
                  remu         t0, t1, a4
                  add          tp, s11, t0
                  fclass.s     ra, ft10
                  ori          t4, ra, 56
                  fclass.s     a6, fs6
                  srli         a5, t6, 2
                  srai         a1, s7, 2
                  xor          s1, t6, s10
                  fdiv.s       fs3, fa5, fs4
                  fcvt.s.w     fa1, t4, rmm
                  fsqrt.s      fs11, ft4, rtz
                  mul          t3, t4, s11
                  mulh         t0, t3, a4
                  fmv.x.w      s8, ft10
                  rem          a6, zero, a0
                  andi         ra, s10, -1191
                  srl          a7, t1, a4
                  srai         s10, s7, 19
                  add          a6, s0, s5
                  fcvt.wu.s    s9, fs9, rmm
                  fcvt.w.s     t3, fa2
                  slti         tp, tp, 385
                  mulhsu       s0, s6, t1
                  slli         t4, a1, 12
                  andi         s4, gp, 1219
                  fsqrt.s      fs11, fa6, rmm
                  sra          a4, tp, a5
                  fcvt.s.w     ft1, s2
                  slt          a0, a3, s2
                  fcvt.wu.s    a0, ft2
                  fcvt.s.wu    fa7, t6, rtz
                  or           a7, t1, a7
                  slt          a1, sp, a6
                  remu         s0, t0, t4
                  fmul.s       fa2, fa6, ft6, rtz
                  fsgnj.s      fs4, ft0, fs2
                  sltu         s10, s1, s8
                  andi         a1, s8, -369
                  fmv.w.x      fs5, a7
                  feq.s        t3, ft1, fs10
                  fcvt.wu.s    s7, fa0
                  slti         a7, t2, -1256
                  auipc        a6, 302297
                  srl          a3, s4, ra
                  slt          t0, t0, a6
                  and          s2, a3, zero
                  srai         a2, a3, 4
                  slli         s7, s4, 29
                  sltiu        s0, t2, -2043
                  fsgnjx.s     fs4, fa0, fa4
                  sub          ra, s9, t1
                  div          tp, s1, a3
                  remu         t1, a2, t3
                  fsgnj.s      fs7, ft9, ft11
                  fcvt.s.wu    fs0, t5, rup
                  andi         tp, a3, 1606
                  fle.s        s5, fa4, fs7
                  fsgnj.s      fs0, ft2, fs11
                  slti         s1, s8, 701
                  sltiu        zero, a6, 371
                  div          a6, s6, s2
                  flt.s        s0, fa1, ft2
                  fsgnjn.s     fs1, fs5, ft7
                  lui          t0, 95432
                  xor          a2, a6, s8
                  add          s6, sp, t0
                  xor          a1, s10, a6
                  fdiv.s       fs2, fs2, ft1, rne
                  and          gp, ra, t3
                  add          s1, a7, s11
                  fsgnjn.s     fa3, fa7, fs1
                  srai         s6, a7, 26
                  fmax.s       fs8, fs5, ft8
                  slti         a0, a5, -235
                  andi         a4, a6, -974
                  fcvt.s.wu    ft7, a7, rdn
                  fdiv.s       fs3, fs11, ft3, rdn
                  srli         s10, t3, 20
                  xori         s9, s5, -1895
                  fsgnj.s      ft10, fa1, fa5
                  fmv.w.x      fa4, a0
                  fmin.s       ft6, ft11, ft2
                  fmin.s       ft4, fs9, fs11
                  fmin.s       ft1, fa2, fs2
                  fcvt.s.wu    fa0, s6, rne
                  nop
                  slti         s4, t2, 952
                  sll          s2, a6, s0
                  mulhsu       a6, a4, t6
                  sra          s4, s6, tp
                  xori         tp, a5, 1831
                  nop
                  addi         a7, t1, -429
                  fcvt.wu.s    a7, ft5
                  mul          a4, s8, s10
                  fmv.w.x      fs3, ra
                  srl          s10, s3, a7
                  fsqrt.s      ft11, ft11
                  srli         s7, s3, 15
                  lui          s1, 292155
                  feq.s        s10, fa2, fs11
                  slt          s2, s2, s3
                  fsqrt.s      ft10, ft6, rmm
                  srli         t3, s8, 26
                  fmul.s       ft10, fa7, fa3
                  sltu         ra, a2, t2
                  rem          a0, t3, t4
                  nop
                  srli         s7, t4, 23
                  fsgnj.s      fs3, fs11, fa7
                  xori         a3, gp, 1191
                  and          s8, a4, s9
                  fmax.s       fs7, fs6, fs4
                  slt          a3, a6, a7
                  add          gp, a1, s4
                  addi         t3, s5, -40
                  srai         s0, s4, 13
                  fmul.s       fs4, fa2, ft2
                  mulhu        a5, s7, s3
                  auipc        a2, 247625
                  fclass.s     s8, fs2
                  auipc        t2, 573874
                  nop
                  fmv.x.w      tp, ft3
                  mul          a4, a1, t4
                  fmv.w.x      fa5, tp
                  fmv.x.w      a6, ft2
                  fcvt.s.w     fa5, s9, rmm
                  andi         s3, s7, -1263
                  nop
                  fcvt.s.w     fs1, a6
                  fsgnj.s      fs4, fs0, ft9
                  slt          s10, s11, t1
                  sub          a5, s1, a1
                  slli         ra, a1, 4
                  srl          s0, t5, zero
                  slt          s5, a5, a0
                  fmv.x.w      s10, fa7
                  sub          a1, s7, s4
                  or           s2, sp, t0
                  fle.s        a7, fa0, ft5
                  feq.s        gp, fa3, ft10
                  fsub.s       fs9, fs1, fs0
                  fsgnj.s      fa7, fa1, fa0
                  fmul.s       ft2, ft0, fs10
                  mulhsu       s9, t6, t2
                  fle.s        t3, fs1, ft11
                  srli         s2, s1, 3
                  fcvt.s.w     ft4, t3, rup
                  fsgnjn.s     fa2, ft8, fs1
                  divu         s0, a5, a0
                  divu         s9, t4, t4
                  ori          a6, ra, 647
                  srai         s5, s3, 22
                  fmax.s       ft11, fs4, fs1
                  fsqrt.s      ft9, fa3, rup
                  auipc        s9, 46650
                  divu         t2, s5, s7
                  fclass.s     a3, fa1
                  mul          ra, s4, tp
                  or           a3, a0, a1
                  fsub.s       fs5, fa3, ft9, rtz
                  fclass.s     zero, fa0
                  fdiv.s       fa3, fs5, ft5, rtz
                  mul          a4, s8, a4
                  fclass.s     s1, fs6
                  srl          s5, a5, s4
                  ori          s10, s7, -1859
                  fsqrt.s      ft1, fs3, rup
                  lui          a2, 1007697
                  auipc        t1, 798893
                  xor          t2, a2, s7
                  divu         t2, gp, tp
                  sra          s7, a4, t2
                  auipc        s4, 490512
                  fsgnjn.s     ft11, ft2, fs11
                  ori          t1, zero, -229
                  fsgnj.s      fs10, fs0, ft2
                  fle.s        s5, fa5, fs5
                  ori          a6, a7, 1087
                  fmv.w.x      fa2, s7
                  auipc        t2, 69368
                  fcvt.wu.s    a1, ft9
                  and          s3, ra, s8
                  slli         a2, a1, 10
                  add          sp, s0, a1
                  add          t1, s11, gp
                  fmin.s       ft9, fs6, ft2
                  fmax.s       ft7, ft9, fs11
                  mul          t3, t1, sp
                  auipc        s6, 71205
                  fmv.w.x      ft9, a4
                  fsgnjn.s     fa5, fs0, fa0
                  nop
                  fle.s        t4, ft5, fa1
                  lui          a5, 89253
                  feq.s        tp, ft2, fa2
                  fmax.s       fa0, fa2, ft11
                  add          t0, a5, a0
                  fle.s        gp, fs6, ft8
                  fcvt.s.w     fs10, tp
                  fmin.s       ft3, ft11, ft0
                  div          s2, s9, t6
                  sll          a7, gp, a2
                  nop
                  slti         s1, t4, -1934
                  sltu         a7, a7, t1
                  fsgnjn.s     ft6, ft8, fs10
                  slti         s8, a6, 1795
                  fsqrt.s      ft6, fs9
                  sra          s10, a3, s7
                  sub          t3, sp, s10
                  lui          s5, 758053
                  mulhsu       a2, s2, s0
                  or           s9, s0, a6
                  fmul.s       fs10, fs11, ft0
                  srl          a2, a6, s8
                  divu         s8, a4, t6
                  sll          a0, s7, s0
                  lui          a1, 572527
                  auipc        zero, 269842
                  remu         s0, s2, t3
                  fsgnjx.s     fs11, fs3, fs6
                  xori         t3, s5, 1714
                  slli         s0, zero, 14
                  sub          s9, a3, sp
                  sltu         a3, s6, s1
                  add          t3, s1, s4
                  feq.s        s8, ft9, fa4
                  mulhu        a6, t4, s11
                  fcvt.wu.s    a6, fs9, rup
                  fsgnjn.s     fa7, ft8, fs4
                  sltiu        ra, t2, 1416
                  fsqrt.s      ft4, fa4
                  srl          t4, ra, a2
                  fmv.x.w      s9, ft10
                  fdiv.s       fs5, fa7, ft2, rne
                  and          zero, a1, zero
                  xor          a7, s4, t1
                  and          a1, s9, s1
                  fsub.s       fs0, ft3, ft1
                  add          t0, ra, zero
                  slt          ra, t1, s5
                  rem          tp, tp, s11
                  xor          s10, s4, s11
                  divu         t2, t2, s8
                  lui          s5, 711969
                  andi         a6, a0, 1534
                  srl          a7, tp, t5
                  sltiu        s9, a7, -53
                  nop
                  rem          s3, a0, t5
                  addi         sp, tp, -680
                  sltu         t2, a6, t4
                  fcvt.s.wu    fs10, t6, rne
                  addi         a6, t4, 853
                  xor          t1, a1, ra
                  slli         a2, gp, 26
                  addi         a5, s0, -248
                  fsgnj.s      fs8, ft9, fs0
                  fcvt.s.w     fs9, t4
                  fmax.s       fs9, ft11, ft2
                  auipc        s1, 796714
                  fmin.s       ft4, fa7, fa7
                  fdiv.s       fs1, fa5, ft0
                  fclass.s     sp, ft10
                  fmv.x.w      s3, fs7
                  flt.s        a2, fs8, ft0
                  fclass.s     gp, fs6
                  xori         s6, s4, 595
                  fle.s        t3, fa5, fs8
                  mulhsu       t1, a0, s7
                  fsqrt.s      fs5, ft8, rdn
                  fdiv.s       ft8, ft0, ft8
                  mulh         s5, s8, s2
                  mulhu        a1, a2, a7
                  andi         a3, s11, 1764
                  sub          sp, t1, s8
                  fclass.s     s2, fs9
                  nop
                  fsqrt.s      fs8, fa6, rtz
                  srai         a0, t2, 8
                  mulhsu       zero, a6, t3
                  div          s1, s9, ra
                  fcvt.s.w     fa1, a5, rdn
                  fcvt.s.w     fs4, t4, rne
                  fcvt.w.s     s9, fs3
                  mulhsu       s7, s1, a7
                  flt.s        s5, ft11, fa4
                  rem          s8, s8, s0
                  fsub.s       ft3, fs5, fs1
                  srl          a3, s6, s5
                  fcvt.s.wu    ft10, t1, rtz
                  rem          a1, ra, t1
                  or           s8, s8, s1
                  fsgnjx.s     ft3, ft6, ft6
                  auipc        t4, 402071
                  sra          a3, gp, t0
                  fsgnj.s      fs6, ft4, fa7
                  fsqrt.s      ft9, fs4, rtz
                  addi         s0, a5, 409
                  sra          sp, t3, gp
                  fmax.s       fs4, fa7, fa4
                  fsub.s       ft8, fs5, ft2
                  div          a7, s3, s5
                  ori          s3, t6, 458
                  div          s4, tp, t4
                  addi         tp, t0, -224
                  srai         t1, sp, 31
                  fclass.s     t0, ft9
                  lui          s7, 405272
                  flt.s        t3, ft5, fs7
                  div          t4, zero, tp
                  srl          a1, s8, t4
                  slti         s8, t4, 376
                  fcvt.s.w     fs5, a3
                  fsub.s       ft7, ft10, fa4, rtz
                  sub          s6, t1, a5
                  xori         a3, t2, 1844
                  feq.s        sp, fs6, ft9
                  sub          a7, t2, a5
                  lui          s5, 929093
                  srai         s6, a0, 29
                  xori         t2, t5, -1997
                  lui          s10, 943753
                  fmul.s       fs3, ft1, fs3
                  xor          a1, a0, tp
                  xori         t4, s2, -1424
                  fmax.s       fa7, ft7, ft0
                  rem          s7, sp, s6
                  fcvt.wu.s    s8, ft11, rmm
                  slt          s3, gp, a4
                  slli         t2, t6, 27
                  slli         gp, s7, 29
                  mul          s0, gp, zero
                  sltu         s1, s7, s9
                  sll          s0, s1, gp
                  fle.s        t1, fs10, ft3
                  slti         a3, t5, 1870
                  ori          t1, a2, 625
                  fmv.x.w      t1, ft5
                  sltiu        a5, s10, 1481
                  remu         t3, t1, a1
                  fsub.s       ft4, fa1, fs2, rmm
                  and          t1, a0, s8
                  fcvt.wu.s    s10, fs9, rup
                  lui          s4, 544332
                  srai         a4, t5, 30
                  fsub.s       fs6, fs8, fs5, rdn
                  sub          t4, a3, t4
                  srai         s6, s6, 2
                  feq.s        a1, fa6, ft10
                  sll          t0, t6, a7
                  fsgnjx.s     fs11, ft5, fs11
                  sub          s1, s0, t0
                  fcvt.s.wu    fa3, ra, rmm
                  div          s7, t5, gp
                  rem          gp, a3, s10
                  fmul.s       ft4, fa5, fa2
                  sra          s4, a7, zero
                  fmul.s       fa4, fa2, ft5
                  fsgnjx.s     fs11, ft2, fs0
                  remu         sp, ra, t1
                  slli         s1, t2, 16
                  fsqrt.s      ft7, ft1, rne
                  and          s2, s2, a2
                  slt          sp, zero, s1
                  fmin.s       fs9, ft10, fs4
                  slli         a7, t0, 31
                  and          s0, s5, s0
                  fsqrt.s      fs7, ft4
                  fsgnjx.s     fs10, fs5, fa4
                  srai         sp, t6, 2
                  sub          s2, a3, a3
                  mulh         zero, s0, a7
                  addi         a2, s0, -915
                  mulhu        s7, s9, ra
                  fcvt.w.s     a3, fs0, rne
                  fadd.s       ft6, fs0, fs11
                  fcvt.wu.s    s6, fs9
                  fadd.s       ft9, fs11, fa1, rtz
                  slli         a0, tp, 26
                  sub          a6, a7, s10
                  fsqrt.s      fs8, ft2, rup
                  fmul.s       fa1, fs9, fs10
                  fsub.s       fa6, ft6, ft2
                  nop
                  xori         t1, zero, -1
                  remu         s8, t0, s7
                  or           t3, a4, s8
                  auipc        a5, 366199
                  fcvt.s.wu    fs4, ra
                  fmul.s       ft4, ft6, ft11, rup
                  fle.s        a5, fa1, ft3
                  divu         s0, s5, t3
                  fcvt.wu.s    a2, ft2, rmm
                  remu         s9, t2, ra
                  fle.s        s10, fs2, fa4
                  remu         t0, t6, a4
                  fsub.s       ft1, fs6, fs11
                  fcvt.s.wu    ft5, a6, rmm
                  sltiu        t4, s1, 633
                  fmin.s       ft8, fa3, ft3
                  add          a3, t4, a1
                  mul          s5, t1, t2
                  xor          s6, s7, tp
                  fmax.s       fs3, fs3, fs4
                  fcvt.w.s     a7, ft10
                  sub          a2, a4, s2
                  xor          s6, a5, s0
                  divu         sp, s4, a4
                  fcvt.w.s     t3, ft10, rdn
                  fclass.s     gp, fs0
                  fadd.s       fs2, fs4, ft7, rne
                  fsgnjx.s     ft3, ft3, ft2
                  fcvt.wu.s    s3, fs9
                  fmv.w.x      fa2, t6
                  fmv.x.w      s7, ft0
                  fmin.s       ft2, fa1, ft3
                  fclass.s     t0, fs7
                  auipc        s5, 1029663
                  srai         s1, s10, 15
                  ori          a7, s5, 270
                  remu         sp, s0, a7
                  addi         t1, gp, -87
                  xor          t0, a7, zero
                  mul          tp, t3, t0
                  sltu         s9, s5, s6
                  div          s8, s3, t3
                  fclass.s     s2, ft3
                  fcvt.s.w     ft7, t1, rne
                  lui          sp, 608613
                  fsub.s       ft10, fs10, fs7
                  fsgnj.s      fs4, ft0, ft10
                  fmv.w.x      fa5, s8
                  sub          s6, gp, s3
                  fcvt.s.wu    ft8, s5, rne
                  fclass.s     a0, fs4
                  remu         s8, s8, gp
                  div          t1, t6, s3
                  nop
                  srai         s1, a4, 20
                  fle.s        s4, fa7, fa4
                  sltiu        s0, s10, -1376
                  lui          a3, 113577
                  fmv.w.x      ft10, s0
                  fadd.s       fs4, fs4, ft5
                  andi         a0, a3, -1346
                  fsqrt.s      fa5, fa4
                  fmv.w.x      fa4, a5
                  fsub.s       fs8, ft2, fs10
                  mulhu        ra, s4, a5
                  fcvt.w.s     s8, fa3, rup
                  slt          a2, a4, gp
                  fsub.s       fs5, fa7, fs1
                  andi         t3, t5, 496
                  fmul.s       ft11, ft1, fs8, rdn
                  srl          a2, s11, t5
                  mul          zero, sp, s2
                  srl          s4, a0, t1
                  divu         sp, s6, t6
                  fcvt.s.w     fa0, t4
                  fsgnjx.s     ft8, ft2, ft2
                  ori          s4, a4, 530
                  lui          a4, 972242
                  fmax.s       fs8, ft4, fs11
                  fsgnjx.s     ft6, fs0, fs2
                  fsgnjx.s     fa2, fa2, fa2
                  slti         s5, t3, 1342
                  ori          t2, zero, -1462
                  auipc        t0, 174762
                  fmax.s       ft6, ft0, fa1
                  mulh         a6, a3, a4
                  remu         zero, s3, s10
                  fcvt.s.w     ft6, a5, rdn
                  fclass.s     s6, fs4
                  srli         zero, tp, 15
                  or           s9, t2, s2
                  fsqrt.s      ft1, fs6
                  srai         t4, sp, 1
                  fcvt.s.w     ft2, sp
                  sub          a2, a3, a0
                  srai         s2, a5, 10
                  or           a1, s8, t3
                  fcvt.s.w     ft11, t2, rup
                  fcvt.w.s     s4, fa6
                  slli         a3, a7, 11
                  sra          a4, a3, t2
                  fclass.s     s10, fa5
                  fcvt.s.wu    fa4, tp, rne
                  fadd.s       fs8, fs6, fa0
                  fcvt.w.s     s8, ft4, rmm
                  sll          s3, zero, a6
                  xor          a6, zero, s1
                  slli         gp, s4, 16
                  fsgnj.s      ft1, fa7, ft0
                  slt          ra, t6, s2
                  fmv.x.w      s8, fa4
                  srli         a5, t0, 8
                  ori          a3, a0, -1805
                  remu         a6, t5, t1
                  add          a0, t2, t4
                  fadd.s       ft4, fa6, fa2
                  addi         a4, zero, -606
                  fsqrt.s      ft3, ft1, rdn
                  srai         a7, s9, 27
                  fmv.w.x      fs4, ra
                  andi         t3, sp, 1179
                  fcvt.s.wu    fs4, a1, rdn
                  lui          a7, 132143
                  fle.s        t3, ft1, fs6
                  fadd.s       ft8, fa7, ft6
                  slti         s1, s1, -1009
                  fmax.s       ft11, ft7, fs10
                  fmax.s       ft6, fa3, fa3
                  nop
                  fsub.s       ft10, fa6, ft5
                  fclass.s     zero, ft6
                  fadd.s       ft10, ft1, ft0
                  fsub.s       ft0, fs0, fs9, rtz
                  sll          s3, s9, s5
                  fsgnjn.s     fs2, fa3, fs5
                  fsgnjx.s     fa1, fs1, fa4
                  mulh         s4, gp, t2
                  feq.s        a5, fa5, fa7
                  srai         s1, gp, 5
                  auipc        s1, 326679
                  mulh         t4, a4, s4
                  fcvt.wu.s    a7, ft8
                  fsgnjn.s     fa1, fs3, ft2
                  slti         s2, s11, 291
                  flt.s        t2, ft7, fa6
                  sltiu        s1, s0, 889
                  divu         tp, s7, s5
                  fmul.s       fs0, ft3, fs1
                  lui          s8, 358999
                  sltiu        gp, s2, -566
                  div          s0, gp, s11
                  mulh         a3, sp, s6
                  feq.s        s5, ft7, fs4
                  sltu         sp, s7, s2
                  fsgnjn.s     fa3, ft8, ft0
                  and          t3, s0, s10
                  ori          a2, s7, 1595
                  fcvt.wu.s    s3, ft1, rup
                  lui          s0, 748690
                  and          t2, s1, s9
                  sltu         ra, t0, s9
                  fsgnj.s      fa2, ft7, fs9
                  rem          a7, a4, s6
                  fle.s        tp, fs5, fs11
                  xor          s7, s8, t5
                  fmv.x.w      t3, ft0
                  fadd.s       ft5, ft0, fa7, rdn
                  fclass.s     t4, fa0
                  sll          ra, a3, a1
                  sub          ra, t2, tp
                  fmv.w.x      fa5, a6
                  add          a2, s3, t1
                  flt.s        zero, fs3, fs0
                  divu         s8, s8, s8
                  fcvt.wu.s    a0, fs5
                  divu         s3, s11, sp
                  mulhu        a4, a6, t2
                  slt          s5, s9, s9
                  fmul.s       ft10, fa6, fs4
                  feq.s        s2, ft7, fs6
                  fclass.s     s7, ft7
                  or           ra, t0, zero
                  sltiu        s0, a7, -1317
                  or           t1, t4, s9
                  fmul.s       fa5, fa2, fs3
                  fsgnjx.s     fs3, fs3, ft6
                  mul          s2, a4, t6
                  flt.s        t3, ft0, fs8
                  mul          s10, t3, t5
                  mulh         s5, s5, a0
                  fcvt.wu.s    s3, fs6
                  divu         sp, a3, a7
                  srl          zero, s10, s3
                  mulhu        a4, ra, a5
                  sltu         s9, tp, s6
                  fclass.s     s3, fa6
                  and          s1, t4, a6
                  sra          a0, t5, t0
                  mulh         s1, s5, s9
                  srai         tp, s3, 3
                  fcvt.s.w     fs10, s8, rne
                  srl          ra, s0, t3
                  xor          t0, s5, a4
                  slt          t1, sp, s6
                  fsgnjx.s     ft2, fs4, fs8
                  mulhsu       a3, s11, t4
                  remu         a7, s5, s10
                  slli         a5, t6, 30
                  fsgnj.s      fa0, fa1, fa5
                  fsqrt.s      fa4, fs0
                  xor          sp, s4, a5
                  ori          s4, a0, 780
                  and          tp, s6, ra
                  fsgnj.s      fa2, ft8, fa6
                  fcvt.s.wu    fs5, a4, rup
                  slli         a4, tp, 10
                  fmax.s       fa2, ft5, ft6
                  fmax.s       ft9, ft8, ft10
                  lui          s8, 335348
                  fmv.w.x      ft8, a1
                  sll          t3, ra, zero
                  fmv.w.x      fs7, s9
                  sll          s0, s1, s5
                  and          s10, a5, s0
                  lui          a0, 379566
                  auipc        sp, 859835
                  fadd.s       ft3, fs1, ft11, rdn
                  fsgnjx.s     fa1, ft6, fa0
                  feq.s        s10, fa2, ft5
                  lui          a7, 977994
                  or           s7, s3, s8
                  fdiv.s       fa4, ft1, fa7, rne
                  remu         t1, s8, t6
                  mul          t0, s4, a4
                  or           a6, s5, t6
                  fsgnjn.s     fa0, ft9, fs8
                  fsub.s       ft6, fs5, fa2, rtz
                  div          s7, ra, t4
                  sra          s10, sp, s0
                  slti         a7, t0, 1527
                  sll          t0, a0, s9
                  fle.s        zero, fs8, ft11
                  sltiu        s10, s3, 302
                  xori         a1, a1, -435
                  sll          t3, sp, s1
                  fclass.s     t1, ft0
                  flt.s        t2, fa3, fa2
                  lui          a3, 591094
                  auipc        a0, 708571
                  feq.s        a3, fs0, ft8
                  fsub.s       fs10, fs4, fs6, rdn
                  ori          t2, s0, 1668
                  srai         a1, t1, 6
                  fcvt.s.w     fs5, a1
                  sltu         s2, a0, s1
                  auipc        s3, 752384
                  fle.s        s6, ft0, ft1
                  lui          s9, 707652
                  divu         t1, s4, t5
                  mulhsu       s4, a0, t3
                  sltu         s7, gp, a5
                  fcvt.w.s     s4, fs3, rmm
                  fsub.s       ft0, ft2, fs5
                  slt          s1, s3, t6
                  slt          a5, s5, t5
                  srai         gp, s0, 15
                  srli         t1, s2, 21
                  remu         s5, t6, t3
                  nop
                  fcvt.w.s     tp, fa3, rup
                  and          ra, s8, a3
                  mulhu        t3, s8, s1
                  srl          a4, a1, zero
                  fcvt.s.w     ft7, a5, rup
                  sltiu        a3, sp, -1642
                  fcvt.s.w     ft10, s1, rmm
                  fclass.s     a6, fs0
                  srl          a1, s10, s3
                  slti         s8, t3, -1508
                  fmv.x.w      t1, ft4
                  mul          s5, s2, t6
                  add          a4, gp, t5
                  sub          s1, ra, tp
                  fmv.x.w      a4, fa1
                  sra          a2, t6, tp
                  fmv.w.x      ft10, s7
                  fclass.s     a5, fa4
                  mulhu        s4, a6, t5
                  fsub.s       fs10, fa2, fa6, rne
                  fsgnjx.s     ft4, fs3, fa2
                  fcvt.wu.s    a3, fa3
                  fdiv.s       fs6, ft8, fs7, rup
                  fmax.s       fa0, fs2, fa5
                  rem          t4, a2, t6
                  lui          s2, 1002784
                  sub          a6, a0, s3
                  fmin.s       ft5, fs8, ft5
                  flt.s        sp, fs4, ft5
                  fadd.s       fa0, ft10, fa5, rmm
                  fcvt.w.s     t4, fs1
                  srai         s10, s8, 23
                  sltu         a6, s8, s10
                  sra          tp, s4, a3
                  remu         t3, s3, a6
                  fdiv.s       fa1, fs9, fs9, rdn
                  xor          t4, s4, sp
                  fmax.s       ft11, ft7, fa7
                  slti         a3, s8, 781
                  sltu         t3, s3, s10
                  remu         t3, s4, s0
                  srai         sp, gp, 26
                  fsgnjx.s     fs1, fa4, fs2
                  nop
                  lui          s6, 453840
                  fsqrt.s      ft5, fa2, rne
                  feq.s        s8, fa2, fs2
                  add          s7, tp, tp
                  srl          t4, a3, s4
                  fcvt.w.s     s9, fa1, rmm
                  mulhsu       s7, a5, t1
                  fmin.s       fa7, fs8, fs6
                  fdiv.s       ft9, ft8, ft3, rtz
                  fmax.s       fs2, ft6, ft6
                  slli         s4, t6, 30
                  xori         a3, s8, 599
                  fmax.s       fs2, fs9, fa3
                  lui          a7, 549859
                  fmul.s       ft8, fs3, fs9
                  add          s4, zero, a7
                  srai         a0, tp, 15
                  addi         t4, a6, -558
                  slli         s6, s5, 24
                  xor          s2, ra, gp
                  fsgnj.s      fa1, ft8, ft1
                  ori          s3, s0, 193
                  nop
                  mul          tp, a5, a5
                  add          s0, sp, s2
                  add          s5, s0, a1
                  feq.s        s0, fs2, fs8
                  fsub.s       fa4, fs3, fa0
                  feq.s        s4, fa0, fs3
                  fsub.s       ft0, ft1, ft0
                  fsgnjx.s     ft3, ft3, fa1
                  div          t2, s4, s6
                  fmax.s       ft3, fs7, fa1
                  fadd.s       fs4, fs7, ft0
                  sra          s5, a7, s4
                  sub          s8, s5, sp
                  feq.s        t2, ft6, fs10
                  sll          zero, a6, a6
                  divu         s7, s8, tp
                  xori         s3, s11, -1525
                  srl          a0, s8, s3
                  fadd.s       fa4, fs5, ft0, rup
                  fcvt.wu.s    a1, fs5
                  and          a4, s1, s1
                  fdiv.s       fs4, fs6, fs10
                  slti         sp, s10, -1270
                  andi         s6, t1, -929
                  fle.s        a2, fs4, ft3
                  srli         zero, s8, 0
                  fmv.w.x      fs10, zero
                  flt.s        a0, fa5, fs9
                  and          gp, a5, s0
                  fcvt.w.s     ra, ft3, rup
                  srl          a1, s5, s4
                  slli         s2, zero, 26
                  remu         s2, s8, s9
                  sll          t0, t4, t2
                  mul          s2, t2, t3
                  xori         a1, s10, 1731
                  mulh         s0, gp, a4
                  fdiv.s       fa4, ft4, fa6
                  and          t2, a3, a3
                  fmv.x.w      a3, fa5
                  fsgnjn.s     ft9, ft3, ft2
                  fsgnjn.s     ft4, fa0, ft3
                  ori          a3, a0, -138
                  fcvt.s.wu    fa0, s3, rup
                  sub          t3, gp, a7
                  fclass.s     t3, fa4
                  or           gp, s1, s5
                  srli         t1, zero, 29
                  rem          s5, s1, a0
                  auipc        s0, 801504
                  fsgnjx.s     fs6, fa1, fs0
                  sub          zero, zero, s6
                  lui          s2, 120445
                  fsgnjx.s     fs2, fa0, fa6
                  fle.s        t4, fa0, fs2
                  slti         t2, s4, -1273
                  ori          s5, a2, -909
                  fcvt.w.s     a3, ft1
                  slti         ra, t6, 1952
                  or           a4, t3, s7
                  flt.s        zero, fs10, fs1
                  flt.s        s2, fa1, ft6
                  xori         a0, a1, 1188
                  fsgnjx.s     fs8, fa6, fa2
                  fcvt.s.wu    fs10, t6, rup
                  divu         t0, a5, t0
                  andi         t1, a6, 1419
                  mulhsu       s2, t6, tp
                  nop
                  nop
                  sll          t0, t4, s6
                  fmul.s       ft11, fs8, fs11
                  fsgnjx.s     ft0, fs6, fs0
                  divu         a1, a3, a2
                  fle.s        gp, ft10, ft4
                  and          s2, t6, s11
                  fmv.w.x      ft8, a1
                  slli         a5, s9, 14
                  sltiu        t1, zero, 1310
                  mul          a6, zero, a4
                  fclass.s     s3, fa4
                  fcvt.s.wu    fs6, s6
                  ori          s8, s10, 1926
                  add          s4, sp, s6
                  fsqrt.s      fs11, fs7
                  fcvt.wu.s    a4, ft6, rtz
                  fsgnjx.s     fs6, fs3, fs11
                  or           s1, t6, t1
                  fsgnjn.s     ft0, fa4, fs6
                  mulhsu       s5, s9, s10
                  sltiu        t3, ra, 382
                  fsgnjn.s     fs11, fa2, fs7
                  divu         s0, a5, s2
                  flt.s        a4, fa6, fa4
                  slli         a3, s4, 0
                  xori         s7, s11, -1699
                  and          t2, s1, a5
                  fclass.s     a7, fa2
                  sltiu        s2, sp, -963
                  feq.s        a0, fa1, fs1
                  rem          s10, s8, t3
                  fmv.x.w      ra, fa5
                  fadd.s       fs11, fs11, ft4
                  fmv.w.x      fs6, s3
                  fsqrt.s      fs11, fa4
                  mul          a1, s2, a0
                  fsqrt.s      fs8, fa2
                  fsgnjx.s     ft4, fa3, fa1
                  fsub.s       fa2, fa7, fs2, rup
                  nop
                  ori          s3, s11, 109
                  sll          s6, t6, s6
                  mulhu        s7, s5, a1
                  lui          a2, 167608
                  andi         s10, t2, -707
                  fdiv.s       fs1, fa7, fs2
                  sltiu        zero, t3, -1651
                  sltu         a4, t6, s3
                  flt.s        s3, fs3, fa7
                  fcvt.s.w     ft4, a1
                  srli         s1, a1, 5
                  xor          s0, t0, a5
                  fcvt.s.wu    fs0, s10
                  fsgnj.s      ft10, ft7, fa1
                  fmul.s       fs2, fs9, fs3
                  fsqrt.s      fa2, fs11
                  flt.s        s3, fa1, fa5
                  sltiu        s8, a0, -1572
                  slt          s10, s0, s11
                  flt.s        t0, fa5, fa6
                  mulhu        s0, s5, s2
                  addi         a3, a0, -1886
                  nop
                  fsgnjx.s     fa6, fs3, fa2
                  rem          a2, gp, s0
                  fsgnj.s      fs2, ft2, ft8
                  slti         s2, s9, -252
                  fsgnjn.s     fs0, ft6, fa0
                  srl          a3, a5, zero
                  remu         zero, a7, s4
                  fmin.s       fs8, fs0, fa0
                  sub          t1, s5, s6
                  or           a6, s1, s4
                  fsgnjx.s     ft9, ft4, fs10
                  fsgnjx.s     fa1, ft0, fs11
                  fcvt.w.s     s0, fs8, rdn
                  fmv.w.x      fa4, a6
                  mul          s2, a3, gp
                  nop
                  fdiv.s       ft5, ft9, fa4, rdn
                  sltu         s0, t4, t5
                  srli         s10, t5, 15
                  fcvt.s.wu    fs8, t2, rne
                  fsgnjx.s     ft3, ft11, fs6
                  mulh         a5, s0, s6
                  srli         sp, zero, 14
                  fadd.s       fa5, ft5, fs1, rdn
                  add          s4, s8, a2
                  fmin.s       fs10, ft3, fs6
                  fmin.s       fs10, fa0, ft3
                  fclass.s     t3, ft3
                  sub          a2, t5, t0
                  fsgnjn.s     fa6, fs7, fa3
                  mulh         a4, s6, s6
                  srli         t4, s1, 1
                  sltiu        a6, s8, 1603
                  fsgnjn.s     fs8, fa3, fa0
                  fsub.s       fa2, fs6, ft6, rtz
                  srl          s4, s5, t6
                  fcvt.wu.s    gp, fs4
                  rem          s5, a4, s10
                  andi         sp, s0, -1689
                  fsub.s       ft0, fs9, fs2, rtz
                  fmul.s       fa0, fa1, fs4
                  slti         a3, s10, -1257
                  fle.s        gp, ft9, fa7
                  or           s8, t0, a4
                  sra          s5, s5, s10
                  addi         a6, s9, -1241
                  fmv.x.w      s7, ft4
                  mulh         ra, a2, zero
                  xor          a2, s6, t2
                  fadd.s       ft11, ft7, fa4
                  add          s1, tp, gp
                  fmv.w.x      ft3, s8
                  and          s5, a3, t3
                  lui          a2, 895947
                  add          tp, s10, tp
                  andi         ra, gp, 608
                  slt          s2, t6, s0
                  div          s4, t2, t2
                  srli         a6, ra, 3
                  fadd.s       ft4, ft4, ft8
                  fmv.x.w      t2, fs3
                  fcvt.s.wu    fs4, t1, rtz
                  fmv.w.x      fa7, s0
                  fsqrt.s      ft1, fs4, rmm
                  and          t4, s4, sp
                  fsqrt.s      ft1, ft7, rne
                  srli         s10, s7, 22
                  or           s3, a7, gp
                  and          s9, a4, s5
                  fcvt.s.w     fa7, s4, rdn
                  fsgnjx.s     ft7, fs11, ft4
                  andi         s2, t2, 706
                  fadd.s       fs5, fs9, fs11
                  slt          a7, s1, s7
                  mul          s1, a6, s11
                  sub          s10, s7, s5
                  fcvt.s.w     ft10, t4, rne
                  sltu         t1, t1, t0
                  fcvt.wu.s    a7, fs9, rup
                  nop
                  flt.s        a5, fs10, fs0
                  fsqrt.s      ft4, fs1
                  xor          a5, a3, t5
                  div          s1, ra, a3
                  slt          s2, tp, gp
                  xor          sp, s6, sp
                  fcvt.w.s     t4, ft1, rmm
                  slti         a4, a2, -1475
                  fsgnj.s      fs0, ft1, fs11
                  remu         gp, s3, s5
                  ori          s4, a1, 337
                  add          a2, t0, s9
                  fmv.x.w      tp, fa0
                  fmax.s       fa4, fa3, fa2
                  fsgnjn.s     ft10, ft4, ft1
                  fmax.s       ft3, fa0, fs1
                  fmv.w.x      ft6, s6
                  slti         s9, zero, -1915
                  sltiu        s1, a4, 1696
                  fmv.w.x      ft3, gp
                  mulhu        s9, ra, tp
                  sltiu        s1, s6, -1432
                  slti         a1, s0, 170
                  fcvt.s.w     fs3, s4
                  slt          a3, s4, s1
                  add          a0, t1, s8
                  fsgnj.s      fa6, fs6, fa2
                  srl          t3, t5, sp
                  slti         a1, s6, 724
                  fsub.s       ft1, ft3, ft2
                  addi         a2, ra, -1878
                  sltu         a4, a1, s3
                  sll          tp, a6, a1
                  fmv.x.w      t3, fa1
                  mulh         a3, t0, s2
                  srai         s7, a6, 10
                  slt          t0, s6, s0
                  ori          t1, s8, -526
                  fsgnj.s      fs8, ft9, fs7
                  mulhsu       a3, s4, sp
                  remu         a7, t0, s9
                  srai         s6, s0, 16
                  fmv.w.x      fs11, s7
                  fsgnjx.s     fa7, ft2, fa6
                  addi         s3, s9, 1536
                  slti         t0, s2, -1750
                  xor          a7, s3, s6
                  xori         tp, ra, -1126
                  slti         t1, t5, 302
                  mulh         a1, s4, zero
                  andi         a2, a5, 1608
                  fdiv.s       fs11, fa2, fa0
                  xori         t0, s10, -1708
                  fsqrt.s      ft0, fa7
                  fcvt.w.s     t1, ft1, rdn
                  fsub.s       ft5, fs11, fa2
                  slli         tp, t1, 7
                  and          s5, s3, t5
                  fsgnjn.s     fs2, fs2, fa3
                  sll          ra, s6, t6
                  fmv.x.w      tp, fs0
                  fcvt.w.s     s9, fs3
                  fcvt.s.w     fs5, gp, rdn
                  fcvt.s.w     ft0, t1
                  fmv.w.x      fa4, a0
                  fle.s        s1, ft5, ft9
                  sltiu        tp, t6, 856
                  srl          t4, ra, t5
                  andi         a2, a5, 493
                  remu         gp, a6, zero
                  fle.s        s10, fs1, fs10
                  fsub.s       fa5, fa0, ft3, rne
                  flt.s        a2, fs2, fs7
                  mul          t2, a7, t5
                  slt          gp, a3, a4
                  remu         t4, t5, a3
                  mulhu        s3, a7, s1
                  fcvt.wu.s    ra, ft7
                  sltu         a0, s4, s1
                  fclass.s     t2, fs0
                  fsgnjn.s     fs10, fs2, ft7
                  mulh         s1, s2, s6
                  mulh         s5, s4, a6
                  fcvt.wu.s    t4, fs4, rup
                  fsgnj.s      ft2, fa3, fs6
                  auipc        s4, 53116
                  and          t1, tp, t5
                  rem          a4, s5, s4
                  fcvt.s.w     fs8, t6, rmm
                  divu         s10, s2, t6
                  slt          t3, s4, a1
                  srai         s4, t2, 0
                  fsgnj.s      fs3, fs8, fs4
                  fcvt.s.w     ft10, s6, rtz
                  fclass.s     t4, fa3
                  slti         t4, a5, -293
                  fcvt.wu.s    a5, fs5
                  rem          a5, ra, s9
                  fcvt.s.wu    fa3, s4
                  fmin.s       ft7, fs10, fs3
                  fmin.s       fs1, ft8, fa6
                  sra          a7, gp, sp
                  auipc        s5, 53608
                  mul          a3, ra, t4
                  andi         zero, t4, 1475
                  fclass.s     s8, fs2
                  feq.s        s0, fs5, ft4
                  sub          t2, a7, t0
                  add          s6, t3, sp
                  xor          a2, s8, tp
                  div          a1, t6, t2
                  fsqrt.s      ft5, ft1
                  fcvt.w.s     gp, ft2
                  div          sp, t0, tp
                  mulhsu       s1, zero, s1
                  mul          a4, s7, ra
                  addi         a6, s3, 389
                  add          s9, ra, s2
                  and          a6, s0, a3
                  fle.s        a3, ft2, fs6
                  xori         a1, t6, -2040
                  xor          t0, gp, t1
                  addi         a0, s0, -1840
                  div          ra, s11, a0
                  andi         t0, t3, -1691
                  fmv.x.w      a1, fs0
                  slli         t3, s6, 29
                  srli         a5, s8, 31
                  fadd.s       fs1, fs1, fs4, rmm
                  fmax.s       fa7, ft8, fa6
                  sltiu        zero, t4, 1293
                  fsgnjx.s     ft6, fs1, fa7
                  mul          s1, s6, s8
                  fclass.s     a1, fs6
                  remu         ra, gp, sp
                  slli         a0, s11, 4
                  fclass.s     gp, fs9
                  fdiv.s       ft10, fa4, fa6, rdn
                  srl          s1, ra, s10
                  add          s8, t0, t4
                  fmax.s       fa4, fa6, fa6
                  flt.s        sp, ft10, fs9
                  divu         ra, gp, t3
                  fmin.s       ft10, fa5, fs0
                  fsub.s       fa2, fs4, ft9
                  mulhsu       ra, t6, a1
                  slti         s9, s5, 725
                  fle.s        t1, ft2, fs5
                  and          s7, s9, s7
                  remu         s0, s2, s8
                  auipc        s1, 259789
                  fcvt.s.w     ft11, tp, rtz
                  fcvt.w.s     tp, ft1, rmm
                  fmin.s       fs5, ft2, ft3
                  andi         a0, a5, 609
                  fle.s        s2, fs3, ft0
                  fclass.s     s5, fa3
                  sll          s10, zero, s8
                  rem          sp, a6, s0
                  mulh         s1, s6, t5
                  slti         t3, s7, 1424
                  nop
                  srli         t3, sp, 10
                  fcvt.w.s     zero, fs4, rup
                  sltu         a7, t5, zero
                  slli         s3, s10, 27
                  srai         gp, s4, 15
                  fsgnjx.s     ft2, fs10, fs5
                  srl          gp, gp, s2
                  mulh         s1, a3, s2
                  fadd.s       fa7, ft10, ft8
                  andi         s0, t6, -466
                  fmax.s       fa4, fs7, fs11
                  ori          t0, s11, 92
                  mulhsu       zero, s11, s4
                  mul          ra, s8, a5
                  add          a3, t3, a3
                  andi         a0, s7, -1819
                  or           t3, ra, s6
                  mulhu        s6, s7, s11
                  xori         t1, s2, 1673
                  sltu         s6, sp, a6
                  sltiu        a4, a6, 467
                  and          a0, t5, s3
                  fsgnjn.s     fs3, fa3, fs9
                  srai         a0, s5, 18
                  lui          a3, 69680
                  fcvt.s.w     fs6, zero, rup
                  fmul.s       fa5, fs8, fs11, rdn
                  auipc        a5, 701836
                  lui          s10, 56562
                  nop
                  srli         s5, s0, 30
                  fcvt.w.s     a6, ft0, rne
                  slli         zero, s3, 5
                  divu         a5, s8, gp
                  sll          s6, t4, s11
                  fadd.s       ft4, ft4, ft2, rup
                  or           a6, a0, s8
                  fcvt.w.s     s9, fa2
                  or           a0, a2, sp
                  sltiu        a7, t4, 159
                  xor          s6, a2, s0
                  srl          a6, t1, s2
                  mul          s8, s6, tp
                  fle.s        ra, fa7, ft7
                  fclass.s     a0, fa6
                  andi         t3, s6, 100
                  mulh         s9, t4, s8
                  fmul.s       fa5, ft0, fa3
                  flt.s        t1, ft6, fs8
                  sltu         s2, ra, s1
                  fcvt.w.s     s5, fs5
                  fsub.s       fs3, fs2, ft8
                  srl          s5, s10, s0
                  divu         s8, tp, s5
                  fadd.s       fs0, ft1, fs5, rdn
                  mul          tp, a3, s2
                  ori          a7, s1, -734
                  flt.s        s4, fs11, ft1
                  remu         t2, a7, s4
                  fsgnj.s      ft6, ft11, ft2
                  fadd.s       fs0, ft2, ft4
                  fsqrt.s      ft11, fa4
                  fdiv.s       fs0, fs8, fs4
                  fmin.s       fs1, fa5, fs4
                  divu         a0, s5, a3
                  addi         t1, t5, 1225
                  sub          a7, s10, gp
                  xori         s5, zero, 1486
                  fsgnjn.s     fs7, fa7, fs11
                  fsub.s       fa0, fa4, ft9, rmm
                  fsgnj.s      fa2, fa0, fs10
                  sltiu        s10, s4, 1571
                  fadd.s       fa0, fs8, fa5
                  sra          s4, s6, a4
                  feq.s        a1, ft8, ft0
                  sub          t2, s0, a5
                  add          s6, t4, t1
                  mulhu        t0, a3, a5
                  xori         gp, ra, -1938
                  fadd.s       fs4, fs11, fs8, rdn
                  lui          a5, 812619
                  fclass.s     zero, fs2
                  fcvt.wu.s    s5, ft11, rdn
                  fsgnjx.s     fs0, fs9, fs7
                  fmin.s       ft11, fa5, fs2
                  srli         s2, s10, 29
                  srl          a4, a6, a3
                  srai         s8, t0, 20
                  remu         zero, s11, s1
                  sub          sp, a0, s2
                  nop
                  rem          gp, a3, t0
                  mulh         a5, t1, t2
                  lui          s0, 97650
                  sub          t4, a1, a5
                  fcvt.s.wu    ft8, t0, rdn
                  rem          a0, s10, s5
                  mulh         s5, s6, ra
                  mulhsu       ra, s10, t0
                  mulhu        a6, s10, s11
                  fcvt.w.s     t2, ft1
                  fdiv.s       fa6, fs4, ft11, rdn
                  mulhsu       s8, a7, s8
                  mulhu        a2, ra, a3
                  fsgnj.s      ft3, fs10, fs8
                  mulhu        sp, ra, s10
                  fclass.s     s0, fs7
                  mulhsu       a6, a7, s5
                  sub          a2, a6, s5
                  fcvt.w.s     s4, ft2
                  fcvt.wu.s    a1, fs11
                  mul          a6, t5, a6
                  slti         s5, t3, -1773
                  nop
                  mulhsu       t2, t6, s0
                  fcvt.w.s     s8, fs4
                  and          s6, t6, t1
                  mulh         s3, t0, a4
                  srai         a5, a1, 10
                  xori         a1, a2, 1201
                  srli         t2, s10, 20
                  sltiu        a0, s8, -21
                  sltiu        zero, s1, -618
                  xori         a0, t4, 1291
                  rem          s8, s1, s5
                  fsub.s       fs6, ft2, fa5, rdn
                  or           s3, t4, s8
                  slli         s2, s5, 0
                  fcvt.s.wu    fa5, a7
                  fsub.s       fs2, fs6, ft0
                  sll          a2, a3, t1
                  fle.s        tp, fa7, fs5
                  fcvt.s.w     ft10, a5
                  add          gp, s5, a7
                  addi         s9, s8, 175
                  slt          a4, s7, s11
                  sltiu        a0, a1, -652
                  mulhsu       t1, s2, zero
                  slt          t1, s9, s3
                  ori          s9, t3, -1282
                  remu         gp, zero, ra
                  fadd.s       ft10, fs8, ft2
                  add          s10, s5, s7
                  fsqrt.s      ft2, ft2, rmm
                  sltiu        s9, t2, 1062
                  divu         a1, s4, s6
                  slt          a0, t0, s10
                  fcvt.wu.s    s3, fs4
                  fcvt.wu.s    a7, ft0, rne
                  fclass.s     sp, ft8
                  fcvt.wu.s    t0, fs4
                  fle.s        t1, ft0, ft8
                  srli         s8, zero, 15
                  xori         zero, s9, -1455
                  srl          t4, s6, s4
                  fcvt.w.s     sp, fs9
                  nop
                  slti         s0, sp, -1161
                  xori         tp, s2, 1228
                  divu         tp, ra, s0
                  fmax.s       ft0, fa4, ft11
                  fclass.s     a0, ft8
                  fcvt.wu.s    s9, ft11, rmm
                  fclass.s     t4, fa6
                  sra          s3, s6, s4
                  mulhsu       a1, s6, s1
                  divu         s2, ra, zero
                  and          s10, s6, s8
                  fmax.s       fa0, fa7, fs9
                  div          t2, s3, a7
                  slti         s2, s4, 1516
                  fclass.s     t4, fa0
                  fadd.s       fs2, fa0, ft8, rdn
                  fle.s        s6, fa4, ft0
                  fsgnjn.s     ft1, fa5, fs4
                  srl          sp, s2, t1
                  flt.s        s7, fa6, ft7
                  xor          s4, a6, a5
                  xori         a3, t4, 1709
                  rem          sp, s0, s8
                  mulhsu       gp, s5, t3
                  fclass.s     s4, fs3
                  xori         t0, t1, 1059
                  slt          sp, t6, s5
                  srai         t4, a1, 15
                  xori         gp, s3, 50
                  fmul.s       fa3, fs1, fa3
                  mulhu        t4, a2, ra
                  auipc        t4, 801002
                  fsgnjn.s     fa7, fs6, fa7
                  fle.s        a0, ft5, ft11
                  addi         t0, a6, -26
                  sra          t0, s5, s1
                  fcvt.s.w     fa2, t5, rne
                  remu         a3, a1, t1
                  fmv.x.w      s1, ft4
                  fmv.x.w      a6, ft5
                  mulhsu       t2, a0, t3
                  andi         s9, a6, -1140
                  sltu         tp, t5, t1
                  sltu         t0, s3, a0
                  mulhu        sp, s1, a4
                  fclass.s     t0, ft6
                  srai         s6, t4, 27
                  auipc        s6, 879637
                  auipc        s3, 534563
                  fcvt.s.w     fa5, t5, rne
                  slli         s2, s3, 10
                  fsqrt.s      fa3, ft2, rup
                  sltu         t2, a4, s7
                  fmv.x.w      a2, ft7
                  fsqrt.s      ft11, ft8, rup
                  fclass.s     s10, fs5
                  sll          t3, a3, ra
                  fcvt.wu.s    gp, ft1, rdn
                  fcvt.w.s     a4, ft0
                  andi         s3, s8, -1488
                  fmul.s       fs10, ft5, fa6, rtz
                  fcvt.wu.s    a2, fa6, rup
                  sltu         t3, a2, a3
                  srl          s2, a1, t2
                  fle.s        s1, fa2, ft5
                  xor          a2, tp, t5
                  srli         t1, s7, 10
                  mulh         s10, a7, t4
                  add          t0, s6, s3
                  mulhu        a4, t0, a5
                  flt.s        s3, fa4, fs2
                  slt          t1, gp, a2
                  rem          t4, s7, s9
                  fadd.s       fa1, fs1, ft1
                  fsgnjn.s     fs2, ft4, fs7
                  mulhu        s10, s3, s0
                  fsgnj.s      fa5, ft8, fs6
                  slt          t4, a3, a6
                  xori         s6, s1, 546
                  or           tp, gp, s0
                  fmax.s       fs5, fs4, ft0
                  xori         a5, t0, -875
                  fdiv.s       fs6, ft1, ft6, rtz
                  rem          s6, s5, s7
                  sra          s3, t3, a6
                  fadd.s       fs2, ft2, fs3, rdn
                  remu         zero, t4, t2
                  xori         s8, s1, -1412
                  srai         sp, t5, 10
                  feq.s        tp, fa0, fs3
                  xori         t1, a2, 1390
                  fmax.s       fs3, fs2, fs8
                  remu         t4, zero, s3
                  fsgnj.s      fs0, ft7, fs8
                  sra          s4, s0, s10
                  fsgnjx.s     ft2, fa5, ft11
                  mulhsu       a0, s7, a7
                  feq.s        t2, ft1, fa0
                  srli         t1, s11, 9
                  xor          s6, t5, s4
                  and          s4, gp, s11
                  fadd.s       fs3, ft11, fs11
                  mulh         tp, s7, s8
                  sltu         t1, gp, s0
                  ori          a2, a4, -1127
                  fmax.s       ft2, ft4, fa3
                  and          tp, t5, tp
                  mulhu        a2, s1, s8
                  sll          t1, a3, a7
                  xor          a6, s6, tp
                  fadd.s       fa1, fa5, fs3
                  nop
                  fcvt.s.wu    fs1, a4, rne
                  fsgnjx.s     fa3, ft11, ft1
                  sll          a6, s3, t5
                  fmv.x.w      t1, fa0
                  fle.s        sp, fs4, fs9
                  slti         a3, s9, 567
                  fdiv.s       fa1, fs8, fa4, rdn
                  fcvt.w.s     a1, ft3, rne
                  xori         a6, t2, 1377
                  mulh         t1, gp, s3
                  add          t0, t0, s7
                  nop
                  sll          s5, a5, a7
                  mulh         tp, s7, s3
                  fsgnj.s      fs4, ft8, fs7
                  sltu         gp, t4, s3
                  srai         s8, tp, 27
                  rem          s0, t6, a2
                  mulhu        a1, t1, s8
                  slti         a7, t2, -1823
                  sltu         s4, a0, a7
                  fsgnjx.s     fa6, ft4, fs8
                  fmv.w.x      ft10, a5
                  fcvt.wu.s    s10, fs3, rne
                  rem          a7, s8, a6
                  fsub.s       fs7, ft9, fs10
                  fsgnjx.s     fs9, fs11, fs0
                  fcvt.s.w     fa2, s6, rtz
                  xor          s8, t3, a1
                  srai         s6, zero, 28
                  rem          s8, a0, s7
                  slt          s1, gp, s9
                  fmv.x.w      t3, fs0
                  fmax.s       fa5, ft2, ft1
                  fcvt.w.s     s4, fs2
                  fmv.x.w      a2, fs3
                  div          s4, s10, t6
                  sltu         a5, s11, tp
                  mulhu        s5, s9, gp
                  lui          zero, 557033
                  mulhsu       t3, s9, s2
                  andi         t3, a7, -737
                  addi         tp, s10, -1102
                  slt          a3, a6, s5
                  add          s7, s9, s11
                  add          s9, a1, a3
                  auipc        t1, 276189
                  ori          s10, t6, -1896
                  mulhsu       a7, s10, t1
                  fcvt.s.w     fa7, t6, rdn
                  fle.s        tp, fs9, fs1
                  feq.s        s5, fa0, ft8
                  srai         s7, a0, 15
                  srai         a2, s2, 26
                  fmv.w.x      ft7, a6
                  fle.s        a1, ft4, ft10
                  fadd.s       fs5, fs10, fs9
                  nop
                  addi         a7, a6, -478
                  fdiv.s       fs5, fa1, ft9, rdn
                  srli         gp, s0, 27
                  fdiv.s       ft10, fa4, fa4, rmm
                  add          s0, s9, ra
                  srli         s10, a3, 5
                  lui          t4, 265250
                  srli         s10, a7, 22
                  and          s10, s2, s8
                  remu         s9, a4, s0
                  fle.s        s0, fs5, ft0
                  addi         ra, a0, 1646
                  div          ra, gp, t3
                  fmv.x.w      gp, fa7
                  sll          gp, t0, t0
                  and          s0, s5, s4
                  fmv.x.w      gp, fs10
                  fsqrt.s      fa0, fs2
                  mulhu        s5, a6, s2
                  fsqrt.s      fs6, fs10, rdn
                  auipc        sp, 281613
                  xori         ra, s9, 1155
                  xor          s6, s3, t4
                  rem          a0, a1, s8
                  remu         ra, t2, t2
                  add          zero, s11, zero
                  feq.s        tp, fs10, fs9
                  slti         a3, s8, -1161
                  fsub.s       ft1, fs3, ft11
                  slt          gp, a6, ra
                  fcvt.wu.s    s5, ft5
                  div          s4, gp, a0
                  div          a4, s6, gp
                  div          t3, t1, tp
                  fsgnjx.s     fs4, fs2, fa7
                  fmv.x.w      s0, ft8
                  fcvt.s.w     ft1, s3
                  fdiv.s       fs4, fs5, fs11
                  sra          a5, s4, s11
                  fmv.x.w      t1, fa3
                  remu         t3, s1, gp
                  slli         a5, s0, 24
                  mulh         t3, s3, s3
                  srli         tp, a2, 29
                  add          tp, s2, s11
                  fcvt.wu.s    a4, ft9, rup
                  sub          s7, ra, s5
                  auipc        s0, 937668
                  slli         tp, s11, 1
                  mul          s4, s0, s2
                  slli         sp, t2, 5
                  fsgnj.s      ft1, ft0, ft4
                  add          a4, a3, a0
                  xori         tp, t5, 1436
                  srli         a5, sp, 16
                  fmv.x.w      a2, ft7
                  fsub.s       ft10, fa0, fs1, rdn
                  sub          s7, t0, a2
                  lui          s9, 437122
                  srai         s6, s3, 0
                  fsgnjn.s     ft10, fa0, fs8
                  auipc        t3, 5374
                  xor          t4, s5, s6
                  sltiu        s2, zero, 628
                  fmv.w.x      fa6, t0
                  fle.s        t1, ft10, fa3
                  slti         a1, t5, 964
                  fclass.s     a4, fs8
                  mulh         s10, tp, s10
                  fsgnj.s      fa3, ft0, ft2
                  ori          t3, t4, -395
                  div          tp, s3, t2
                  sll          zero, gp, s10
                  xor          s8, t4, t3
                  mulhsu       a7, s6, s7
                  slt          t1, a0, s3
                  sltu         s8, s2, s2
                  add          a1, s4, s5
                  or           a7, tp, a5
                  rem          t4, s4, ra
                  fdiv.s       ft10, fs6, fs5, rdn
                  nop
                  fmax.s       fa3, fa6, ft10
                  fcvt.s.w     fa6, t5
                  add          t4, s2, s2
                  fcvt.s.wu    fs8, t1
                  add          a3, t2, a1
                  flt.s        s5, ft7, fa0
                  mul          s0, s2, s11
                  sltiu        s10, s9, -1646
                  auipc        gp, 533691
                  sltu         t1, s1, s4
                  sltu         s6, a2, s9
                  rem          s0, s5, s1
                  fsub.s       fa6, fs4, ft11
                  xor          s4, t4, t4
                  fmv.w.x      fs2, s6
                  fsgnjx.s     ft0, fa3, fa0
                  fadd.s       fa2, fa1, fs4
                  sltu         a6, sp, t4
                  remu         s1, t4, s7
                  fcvt.s.wu    ft8, t5, rtz
                  xori         t2, tp, -38
                  sub          s8, tp, s5
                  divu         sp, a4, a6
                  slt          t2, zero, tp
                  add          t3, a3, t4
                  xori         gp, t2, 1727
                  srl          a1, sp, t1
                  srli         t3, s1, 17
                  srli         s3, s3, 25
                  srl          a6, a0, t1
                  slti         s6, s0, -1093
                  fsgnjn.s     ft5, fs9, fa0
                  fmul.s       fs6, ft10, fs7, rmm
                  mul          s8, zero, a2
                  slli         a7, zero, 12
                  fclass.s     a4, ft1
                  flt.s        s0, fs4, fs9
                  sub          s0, zero, a0
                  fcvt.wu.s    a3, ft3
                  mulhu        a4, a5, s6
                  srli         gp, a3, 16
                  fsqrt.s      ft7, fs9, rne
                  fmul.s       fs10, fs8, fa7
                  fmul.s       fs10, fs4, fs6
                  mulh         s8, s6, s9
                  or           s1, sp, t2
                  addi         s2, t1, 1402
                  fcvt.s.w     ft11, s11
                  add          s8, s0, a5
                  fle.s        t4, ft10, fa3
                  add          s10, t1, a0
                  fmv.x.w      sp, ft11
                  nop
                  fsqrt.s      ft6, ft9
                  and          a3, t6, t6
                  sra          a7, t0, t4
                  fsgnj.s      fa2, ft6, fs3
                  fcvt.s.w     ft5, a3, rne
                  fadd.s       ft4, ft5, ft10
                  fadd.s       fs2, ft6, fs1
                  mul          a7, t6, t4
                  or           s2, zero, s9
                  remu         a4, sp, a7
                  fcvt.s.wu    fa2, t1, rup
                  slli         t2, s4, 28
                  feq.s        a7, ft1, fa0
                  mulhu        s4, gp, a6
                  sltiu        s7, zero, 21
                  remu         sp, s7, t5
                  or           t0, s11, t2
                  and          s6, s6, zero
                  srai         t2, ra, 18
                  sra          a0, s4, a3
                  fdiv.s       fa1, fs9, fs7
                  sra          s10, gp, s0
                  fdiv.s       fa4, fs5, ft5
                  sltiu        gp, a3, 1890
                  srl          a2, a4, s6
                  ori          s0, gp, -1379
                  fmul.s       fs4, fs11, ft8
                  sll          s10, a7, s6
                  fcvt.w.s     s10, ft5, rdn
                  fsqrt.s      fa3, fs6
                  xori         sp, a2, 945
                  xori         s3, a7, -648
                  andi         a0, a4, -163
                  fle.s        a7, fs1, ft8
                  remu         t3, a5, t5
                  fcvt.s.wu    fs3, t3
                  srli         s0, s11, 30
                  fsqrt.s      fa5, fs10, rmm
                  mulhu        a3, a5, a3
                  fcvt.w.s     a4, ft10, rmm
                  fadd.s       fs9, fa1, ft0
                  xor          t4, s11, s11
                  fmax.s       fa2, fs6, ft2
                  addi         a3, gp, 1940
                  sltiu        s4, a7, 309
                  remu         a0, s9, tp
                  fdiv.s       fa7, ft4, fs4, rmm
                  ori          s5, s9, 90
                  ori          ra, a1, 0
                  fdiv.s       ft8, fs6, fs4, rdn
                  fsgnjn.s     fs3, fs1, fa0
                  fmul.s       ft8, fs10, fa0
                  sll          zero, s0, t1
                  fsgnj.s      ft11, fs8, fs2
                  sltu         a6, sp, t0
                  feq.s        t2, fa7, fs8
                  sll          a6, s0, s10
                  remu         s6, a2, t5
                  fcvt.s.w     ft2, s3, rdn
                  srai         a2, s8, 14
                  auipc        t2, 138327
                  fdiv.s       fs5, fs6, fa0
                  andi         a0, t5, -344
                  mulh         t1, s3, s10
                  fclass.s     s6, fa0
                  sra          tp, s0, a2
                  mulhsu       s3, t4, t3
                  and          t2, s6, a6
                  and          s0, s11, a2
                  and          s7, s4, t4
                  sltiu        a5, sp, 206
                  lui          s5, 107094
                  fcvt.s.w     ft0, a5, rtz
                  fsqrt.s      fa4, ft11, rtz
                  mulhsu       s5, s0, s5
                  rem          tp, a3, t3
                  fsqrt.s      ft2, fs10
                  srl          a1, a5, a2
                  sltu         t3, sp, s3
                  mulh         s5, s1, a0
                  fdiv.s       fs0, fs0, fa2, rtz
                  lui          zero, 1820
                  sltiu        gp, t2, 1334
                  mulhu        t3, ra, a4
                  rem          a2, s8, ra
                  sltu         t3, a7, ra
                  xori         s4, s8, 1952
                  srli         s10, s0, 9
                  slli         s4, s11, 0
                  slli         t0, t5, 31
                  fmv.w.x      fs11, s9
                  flt.s        a7, fs1, fa7
                  or           s4, a7, s4
                  sltiu        t2, s1, -1022
                  fsub.s       ft9, fs1, fa4, rtz
                  fle.s        a3, ft8, fs10
                  fsgnjx.s     fs4, fa5, fs1
                  flt.s        s8, ft9, ft5
                  srli         t2, zero, 23
                  feq.s        a6, ft3, fs10
                  fcvt.s.wu    ft10, a5
                  sra          s0, a7, s9
                  fsgnjn.s     ft10, fs11, ft7
                  feq.s        zero, fa4, fs6
                  fsqrt.s      fa7, fs11
                  mulhsu       t3, s1, s1
                  fmax.s       fs8, fs6, ft10
                  sra          a4, s4, ra
                  fmax.s       fs8, ft3, fs9
                  mulh         t2, s7, tp
                  nop
                  nop
                  fadd.s       fs9, ft9, fs10
                  fmv.x.w      tp, fs7
                  fcvt.s.w     fs2, s5
                  fcvt.s.w     ft5, a4, rdn
                  fle.s        s3, fs10, fa6
                  sll          tp, t5, t2
                  slt          s2, tp, ra
                  srli         a4, s9, 30
                  feq.s        s6, fs4, fs3
                  sltu         s1, s3, s1
                  xor          s0, s9, ra
                  srl          zero, s4, t6
                  div          t3, t6, t4
                  add          t3, s8, t2
                  fmv.x.w      s10, ft5
                  fsgnjx.s     fa7, fs7, ft5
                  and          a2, t2, s5
                  or           t1, ra, t4
                  addi         s5, a5, 1085
                  divu         a1, t3, tp
                  mul          s8, t3, a5
                  fsqrt.s      fs5, ft0
                  sra          t4, a0, s10
                  sll          a6, s6, ra
                  auipc        t0, 999630
                  sltiu        a7, s5, 649
                  fclass.s     s10, fs1
                  mulhu        sp, s10, t0
                  fdiv.s       ft0, fs4, fs2
                  fsqrt.s      fs7, fa6
                  ori          sp, t6, 631
                  fclass.s     s0, fa6
                  slti         s9, t0, 106
                  slt          t1, s6, ra
                  fmul.s       ft0, fa7, fa3, rdn
                  fclass.s     a0, ft10
                  divu         s7, a0, s1
                  mulh         ra, s8, s4
                  srl          s8, s5, s4
                  srl          t0, a4, a3
                  slli         a5, t0, 30
                  fcvt.wu.s    a0, ft5
                  sra          zero, a4, s10
                  fmv.w.x      ft1, s8
                  and          s10, a3, a4
                  feq.s        s1, ft1, fs3
                  ori          s10, t1, 1144
                  xori         a4, a6, 336
                  sll          s2, a3, s9
                  or           s6, t5, s1
                  fle.s        s4, fs7, fa0
                  fcvt.s.wu    fa1, a2, rdn
                  and          s8, s6, s1
                  fmv.x.w      ra, ft8
                  nop
                  feq.s        a3, fs0, ft5
                  slli         s5, tp, 20
                  lui          a6, 124270
                  add          a3, t3, t2
                  sra          s6, t6, a6
                  auipc        a3, 340979
                  fmax.s       fs11, fs0, ft10
                  fcvt.s.w     ft6, s4
                  fsgnjx.s     ft11, ft10, fs6
                  and          zero, a7, tp
                  addi         a6, s5, 614
                  mul          s1, t6, a5
                  fmin.s       ft1, fs4, fs9
                  fdiv.s       fa1, ft1, fa1
                  and          a7, t6, s9
                  and          a6, a7, s7
                  remu         s8, s5, s11
                  fmv.w.x      ft1, s2
                  fcvt.s.w     ft3, s8, rtz
                  fsgnjn.s     fs6, ft7, fs3
                  sub          s4, sp, s5
                  xor          t0, ra, s8
                  fcvt.s.w     ft11, s3
                  fmul.s       fs5, fa2, fs1
                  sll          s0, a7, s4
                  or           a3, s3, s8
                  sra          a0, gp, s2
                  fcvt.wu.s    t4, fs10, rtz
                  remu         t3, a4, a4
                  fcvt.wu.s    a6, fs5, rtz
                  srl          t2, s11, gp
                  fmin.s       fs0, ft4, fs5
                  fsgnjx.s     fa4, ft7, ft0
                  sra          s8, t5, s1
                  div          s9, a3, t1
                  fadd.s       ft8, ft3, ft1
                  feq.s        s4, ft10, fa6
                  fdiv.s       ft8, ft5, fa0
                  fsgnj.s      fs3, fa7, fa3
                  auipc        a4, 420098
                  nop
                  srl          a1, t0, t2
                  or           ra, s6, a2
                  div          ra, gp, s3
                  fcvt.s.w     fs7, a1
                  sltiu        ra, t0, 1504
                  lui          sp, 413100
                  srli         s7, t4, 19
                  fmul.s       fs10, fs11, ft4, rmm
                  andi         t0, t1, -742
                  fsgnjx.s     fa2, fs3, fs8
                  fle.s        a3, fs8, fa5
                  auipc        s0, 245974
                  fsqrt.s      fa6, fa2, rne
                  fle.s        a6, fa0, fs10
                  and          t4, s2, s6
                  srl          t1, t2, s8
                  andi         s3, s11, -1431
                  mulhu        s8, t5, t5
                  fmin.s       fs4, fa4, ft10
                  slli         s3, s9, 27
                  fcvt.w.s     a5, ft1
                  add          s10, zero, s5
                  fdiv.s       ft7, fs9, ft0
                  div          a5, s7, s7
                  mulh         t4, s7, a0
                  srli         s9, a6, 30
                  and          zero, t5, zero
                  fdiv.s       fs10, ft0, fa4, rmm
                  fcvt.s.wu    fa0, s1
                  fcvt.wu.s    a3, fs5, rdn
                  slti         s8, a0, -1973
                  mulhu        a1, s9, tp
                  mulh         zero, a1, a5
                  remu         s3, t0, s7
                  lui          t2, 548446
                  addi         s5, s7, -1201
                  fsgnjx.s     fs1, ft9, ft10
                  flt.s        a6, ft10, fs4
                  sltu         s4, a7, s2
                  fmv.x.w      s10, fs4
                  mulh         s4, s7, s0
                  fcvt.s.w     fs3, zero
                  xor          s9, a7, s1
                  andi         a0, s4, -562
                  fcvt.w.s     s3, ft10
                  fcvt.s.w     fa7, s9, rup
                  sra          s5, s0, ra
                  fmul.s       fa5, fs2, ft7
                  sub          s8, s11, a5
                  divu         s4, t1, t5
                  nop
                  flt.s        s10, fs6, ft4
                  slti         s5, s4, -756
                  div          a6, t4, t5
                  remu         a7, t0, sp
                  addi         tp, a7, -320
                  fadd.s       fs6, ft10, fs8, rne
                  fmax.s       fs3, ft0, fs11
                  fmul.s       fs10, ft11, ft7, rmm
                  feq.s        s4, fa5, ft5
                  fadd.s       ft5, fs4, fs4, rup
                  sltu         s3, t2, a7
                  fmin.s       fs8, fa1, fa7
                  add          s2, zero, tp
                  fmv.x.w      s9, fa7
                  sltu         s1, s5, t2
                  rem          s3, a5, t4
                  and          a5, s0, s2
                  fsgnjx.s     fs6, fa0, fa3
                  flt.s        s0, fs0, ft11
                  fcvt.s.w     fs5, zero
                  mulh         s8, s10, s9
                  andi         s10, sp, 1874
                  srl          t4, a3, a3
                  auipc        gp, 597979
                  auipc        s3, 863882
                  sra          t3, s5, s11
                  fle.s        s8, fa4, ft9
                  fadd.s       fa4, ft11, fs0, rup
                  fdiv.s       ft10, ft1, fs11
                  fmv.w.x      fa5, s0
                  auipc        s8, 57163
                  fcvt.w.s     t0, fs5
                  ori          a7, a5, -596
                  feq.s        a1, fa3, fa1
                  fmv.w.x      fs5, s0
                  add          s0, gp, s0
                  sra          t4, a6, s0
                  lui          s2, 166353
                  andi         sp, tp, -1402
                  ori          a0, gp, 341
                  mul          t4, t2, t1
                  slli         s3, s11, 6
                  add          a2, s3, a5
                  fdiv.s       ft4, fs3, fs7, rdn
                  remu         a4, t6, t4
                  fadd.s       fs9, fs3, fs9, rup
                  fcvt.wu.s    s7, ft10, rmm
                  fcvt.s.wu    ft10, t1
                  andi         t0, s6, 11
                  nop
                  sra          s2, a7, zero
                  srli         t2, s7, 14
                  mulhsu       a3, tp, t2
                  fadd.s       fs4, ft3, ft5
                  srl          a4, s3, t4
                  fadd.s       fs9, fa5, fa7
                  fmax.s       fs10, fs8, fa1
                  sub          sp, a4, s7
                  fmv.w.x      ft3, a4
                  srai         s2, a7, 25
                  add          s0, tp, t2
                  sltiu        s2, t6, -1893
                  fsqrt.s      ft2, ft7, rmm
                  fcvt.wu.s    a1, fs9
                  srai         a5, s8, 9
                  fclass.s     s4, ft2
                  xori         s7, zero, 1566
                  remu         a6, ra, gp
                  fmv.w.x      ft7, t5
                  fmax.s       ft0, fs11, fa0
                  fadd.s       ft0, ft2, fa3
                  slt          s4, t1, s9
                  slli         a5, s11, 26
                  fsqrt.s      fs1, fa7, rdn
                  feq.s        t2, fa5, fs2
                  ori          s9, t4, -1897
                  fdiv.s       ft3, fa3, fs1
                  addi         s1, s7, -961
                  div          a6, gp, t5
                  fcvt.s.w     fa6, s3
                  fmax.s       ft3, ft0, fa7
                  divu         s4, s11, t3
                  fclass.s     s3, ft3
                  sltiu        s3, t6, 1145
                  sltu         a4, t4, s5
                  flt.s        s6, ft5, ft3
                  feq.s        t1, fa0, ft10
                  and          s3, s7, s5
                  fsgnjn.s     ft0, ft6, fs2
                  xor          s1, t3, s7
                  sll          s7, t3, gp
                  srai         s9, t1, 7
                  slt          a7, s7, ra
                  mulhsu       t4, s4, t2
                  slli         a2, s5, 13
                  xor          s9, a4, a2
                  fclass.s     zero, ft0
                  fcvt.s.w     ft6, s4
                  sub          s8, s1, t1
                  xor          t1, s1, sp
                  srl          t3, sp, s10
                  fmin.s       fs0, ft7, ft8
                  fadd.s       ft2, fs9, ft9
                  fmv.x.w      t3, fa1
                  fadd.s       fs2, fa1, fs5
                  feq.s        zero, fa2, fs2
                  slli         s4, a2, 29
                  sltiu        a5, a0, 442
                  ori          s5, t5, -365
                  slli         s2, a1, 19
                  flt.s        t4, ft3, fs1
                  fsub.s       ft7, fs1, fa4, rmm
                  fmin.s       fs0, fs7, ft7
                  fadd.s       fs10, ft9, fs10, rup
                  fsub.s       fa7, fs5, fa2
                  fsqrt.s      fs11, fa6
                  fcvt.w.s     s10, ft9
                  fsub.s       ft5, ft2, fs5, rne
                  sub          s10, t1, a7
                  lui          a6, 206642
                  fsgnj.s      ft6, fa7, fs8
                  nop
                  xor          a5, a3, t3
                  fmax.s       ft10, ft9, fa2
                  fmin.s       fs1, fs11, ft7
                  xor          a0, a4, a0
                  fcvt.w.s     s3, ft0, rup
                  lui          a0, 170871
                  fcvt.w.s     t0, ft3, rne
                  fcvt.s.wu    fa1, a3, rtz
                  andi         t4, s8, -47
                  flt.s        t1, ft10, fa5
                  fmv.w.x      ft3, a4
                  srl          s3, a0, s3
                  fsub.s       fs4, ft4, fs10, rtz
                  or           a1, t4, s10
                  fsgnj.s      ft8, fa2, ft9
                  rem          s1, s4, a3
                  mul          s9, a3, t1
                  fmax.s       fs5, fa1, ft3
                  fdiv.s       ft10, fa7, fs6
                  sub          ra, tp, gp
                  sra          s5, s10, a2
                  fsgnjx.s     ft6, ft6, fs9
                  sub          ra, zero, s0
                  sra          ra, t4, s3
                  mulh         a6, a7, t4
                  sra          s5, t1, s7
                  xor          t4, a1, a2
                  fcvt.wu.s    a5, ft5, rmm
                  fmul.s       ft4, ft1, fs7, rtz
                  fmv.x.w      a3, fs8
                  fadd.s       fa6, ft4, fs3
                  addi         s0, s4, -1827
                  fclass.s     sp, fs3
                  mul          a2, s5, tp
                  ori          a6, t0, -803
                  lui          s10, 12115
                  fmv.x.w      t3, fs8
                  fsgnj.s      ft5, fa7, ft9
                  or           tp, t5, tp
                  mul          zero, t0, s5
                  fclass.s     s3, ft3
                  mulhu        s8, s8, s2
                  slli         s6, a0, 22
                  fcvt.s.wu    fa5, a0, rmm
                  addi         a3, s3, -1706
                  slti         a6, a4, -91
                  xor          a7, s9, s0
                  andi         sp, t0, -430
                  fcvt.s.w     fs7, a2, rup
                  fle.s        a6, fa5, ft7
                  srai         sp, t0, 31
                  addi         ra, s0, 835
                  xor          a6, t6, gp
                  fsgnjn.s     fs1, fs5, fs9
                  fadd.s       fs9, ft3, fs3, rdn
                  fle.s        s0, ft11, fs9
                  mulhsu       a5, sp, gp
                  nop
                  srl          sp, sp, s10
                  fmin.s       ft1, fs10, fa0
                  lui          t2, 740636
                  fdiv.s       fs2, fa0, fa5
                  sub          s3, s8, zero
                  fcvt.s.w     fs10, s7
                  divu         a6, a5, a6
                  or           a6, tp, ra
                  fsgnjn.s     ft0, fa6, fs11
                  fclass.s     a6, fs1
                  fcvt.s.w     fs10, t1
                  fsqrt.s      fs8, fs3, rup
                  xor          a7, s7, ra
                  fcvt.w.s     a5, fs9
                  fmin.s       fa4, ft9, fa2
                  auipc        s5, 990472
                  nop
                  fadd.s       fs0, ft8, fs3, rne
                  mulhu        s9, s8, a6
                  flt.s        ra, fs5, fs2
                  fmul.s       ft7, fs0, fs4
                  mulhu        s6, sp, a0
                  sra          s7, t2, s5
                  fcvt.s.w     fa6, t6, rdn
                  fcvt.wu.s    t0, fs1, rmm
                  sub          a6, sp, a7
                  fle.s        a2, ft4, fs10
                  fsgnjx.s     fs11, ft6, fs7
                  fsgnjn.s     ft2, ft8, ft10
                  xori         gp, a2, -1417
                  fclass.s     s9, ft4
                  rem          t0, t1, s7
                  xor          zero, s8, s9
                  and          s5, a6, a7
                  div          sp, s2, gp
                  andi         a6, a6, 283
                  and          s3, s1, s5
                  fdiv.s       ft3, fs1, fa0
                  fcvt.s.w     ft0, s0
                  rem          s3, s7, zero
                  addi         s6, s2, 1695
                  xori         s1, a0, -256
                  sub          s2, a4, a7
                  fadd.s       fs4, fs8, fs11, rdn
                  srl          zero, t6, t5
                  fmul.s       fs2, fs3, ft10, rtz
                  xor          tp, s1, s2
                  fle.s        tp, fa0, fs6
                  mulhu        s1, t6, tp
                  addi         s3, t6, 341
                  xor          a7, a6, a6
                  fsqrt.s      fa6, ft1
                  fmax.s       fs6, fs10, ft7
                  rem          a6, s2, s6
                  fsqrt.s      fs0, ft11
                  mulhu        t0, s2, t1
                  sra          a3, t0, t3
                  mulhsu       t1, t0, a0
                  fmax.s       fs1, fa4, ft10
                  mulh         t1, s6, ra
                  sll          gp, t6, s4
                  ori          s2, sp, 1891
                  sltiu        s7, ra, 991
                  srai         t0, a2, 9
                  fsgnjx.s     fa5, ft0, fa1
                  fcvt.s.w     ft7, tp, rtz
                  sltu         a2, sp, s7
                  mulhsu       s1, t3, a3
                  fcvt.wu.s    t0, fa0
                  mulhsu       t1, s6, t3
                  slti         a5, s11, -848
                  or           s7, s3, ra
                  slli         t1, a7, 0
                  sll          sp, s7, s4
                  ori          a6, s3, -55
                  fadd.s       ft10, fa0, fs7, rmm
                  andi         a6, a7, 2046
                  mul          sp, a3, tp
                  fsgnj.s      ft6, fa6, ft10
                  andi         t3, a7, -1776
                  fsgnjx.s     fs6, fs0, fs4
                  flt.s        s3, ft2, ft5
                  fsgnjn.s     fa6, fs6, fa5
                  addi         s5, gp, -1508
                  slli         s9, tp, 26
                  sltu         s0, s6, s4
                  mulh         a5, a3, s0
                  sub          sp, t0, s1
                  flt.s        a2, ft10, fa3
                  fcvt.s.wu    fa6, s8
                  srl          t4, t1, zero
                  fmul.s       fs10, fs8, fa6, rtz
                  xori         s1, zero, 633
                  srli         s2, s10, 26
                  xori         a1, a5, 430
                  flt.s        a1, fa7, ft6
                  fsgnj.s      ft11, ft3, fs0
                  fcvt.s.wu    ft2, s6
                  fcvt.w.s     a3, fs9
                  slti         a0, s2, 784
                  srl          s4, t5, t6
                  andi         a4, ra, 555
                  add          ra, s1, sp
                  fadd.s       ft5, fs9, fa0
                  fmv.x.w      s0, fs9
                  srl          s5, s0, s10
                  addi         s6, a1, 37
                  ori          s7, a7, -1542
                  fsub.s       ft5, fa0, fa7
                  mul          gp, s5, t2
                  xor          sp, t0, a3
                  srl          t3, t0, a2
                  fcvt.s.wu    ft8, s0
                  slli         s8, a1, 27
                  slti         a1, gp, 1782
                  fsgnjx.s     fa6, fs7, ft10
                  flt.s        t0, ft0, ft6
                  mulh         t3, gp, s4
                  remu         a6, a7, s4
                  mulhu        a6, s11, gp
                  flt.s        a5, ft10, ft9
                  fcvt.w.s     a6, fs9
                  fmv.x.w      t4, ft0
                  nop
                  mul          s5, a1, s1
                  lui          s2, 1028547
                  fmin.s       fs4, fa1, fs10
                  srai         s10, sp, 7
                  div          gp, s10, s4
                  div          t2, s10, s9
                  fmv.x.w      a1, ft2
                  sra          t4, a1, t4
                  mulhu        zero, s10, a2
                  fcvt.s.w     fs10, s1, rne
                  addi         a5, s7, 167
                  sra          t3, a1, a5
                  rem          a3, s7, zero
                  fcvt.wu.s    a4, fs8
                  sll          s0, t1, tp
                  mulh         gp, zero, s10
                  rem          a4, s9, s0
                  mul          s8, a7, a3
                  fmul.s       fa6, ft7, fs1
                  slti         tp, t4, -404
                  slti         gp, t4, 301
                  srl          s7, s9, a5
                  fclass.s     sp, ft5
                  mulhsu       a4, a3, s1
                  fsgnj.s      fs1, fa4, fs10
                  fdiv.s       fs2, fa7, fa2
                  flt.s        a1, ft2, ft0
                  fsub.s       fs5, ft7, ft2, rup
                  sub          ra, s3, s2
                  and          a6, a2, s1
                  fsgnjn.s     fa5, ft3, fa3
                  fclass.s     sp, ft10
                  add          s4, s9, a2
                  slt          a4, ra, t1
                  mulhsu       a4, s10, a1
                  fcvt.s.wu    ft11, ra, rmm
                  flt.s        sp, fa5, ft8
                  xor          gp, s2, tp
                  mulhu        t3, t6, a2
                  xor          a0, s3, a2
                  rem          s7, a2, s8
                  mulhsu       s4, s10, t4
                  fsgnjx.s     fs6, fa7, fs2
                  mul          t4, t0, s11
                  fmul.s       ft11, ft7, fs8, rdn
                  sltu         a0, s8, s5
                  fsgnj.s      ft9, ft5, ft10
                  nop
                  fmv.w.x      ft4, a2
                  fcvt.s.wu    fs8, a4
                  fmv.w.x      fa6, s9
                  add          a5, t5, s10
                  mulhsu       s0, sp, s8
                  feq.s        a6, fa2, fa2
                  sra          a3, s3, a0
                  mul          a3, a7, s0
                  rem          s3, zero, gp
                  slt          s9, a3, s0
                  fadd.s       ft4, fs5, fs3
                  divu         s2, gp, t6
                  lui          s10, 38004
                  addi         t2, s8, -462
                  remu         a7, t5, t1
                  flt.s        t1, ft5, ft11
                  fcvt.w.s     s3, fa4
                  sll          s3, a6, s10
                  lui          s1, 520126
                  remu         s6, s11, s9
                  sltiu        s10, zero, -858
                  fclass.s     sp, fa6
                  slt          gp, t5, s1
                  nop
                  feq.s        a6, fs2, fa4
                  mulhu        a6, a0, s10
                  fdiv.s       ft1, fs5, fs1
                  srai         a7, a7, 14
                  mul          t4, a6, t5
                  xori         gp, t5, 1662
                  fmv.x.w      a0, fs0
                  fsgnjx.s     fs3, fs3, fa7
                  srli         s0, a0, 22
                  nop
                  srai         t1, a2, 17
                  slli         s6, t2, 15
                  sra          s6, t4, a5
                  xori         a3, zero, -279
                  sll          t3, t6, s5
                  fcvt.s.wu    fs11, s0, rtz
                  fsgnjx.s     ft7, fs1, fa5
                  fsqrt.s      fa4, fs1, rne
                  fcvt.wu.s    s4, ft11
                  fsgnj.s      ft5, fa4, ft4
                  add          s0, s2, s4
                  fcvt.s.wu    fa2, t6, rdn
                  sra          a0, t2, tp
                  fcvt.wu.s    a1, fs11, rup
                  fcvt.s.wu    fa1, sp, rdn
                  lui          s2, 718957
                  add          s4, a3, a2
                  fsqrt.s      ft11, ft3, rmm
                  feq.s        ra, ft9, fs10
                  srai         a1, ra, 23
                  fcvt.w.s     t3, fa6, rup
                  sltu         t3, s3, s4
                  fle.s        s9, fs2, fa7
                  fmv.w.x      fs0, s3
                  fadd.s       fa5, ft2, ft5, rup
                  fsgnjx.s     fa6, fs5, fs6
                  and          s8, t3, s0
                  fle.s        s9, ft4, fs6
                  lui          s6, 1027342
                  slli         s7, t6, 10
                  sll          ra, s11, s7
                  addi         s5, t2, -613
                  slt          s10, t3, a6
                  addi         zero, tp, -990
                  sub          s1, t4, s5
                  fdiv.s       fs4, ft1, ft9
                  srli         a5, s7, 26
                  remu         sp, s8, a4
                  slli         s9, s1, 1
                  mul          s7, s10, t4
                  fsgnj.s      ft1, fs10, ft2
                  sub          t1, sp, s6
                  div          tp, t5, t6
                  rem          a5, s10, gp
                  fclass.s     a0, fs0
                  fcvt.s.w     fs8, zero, rdn
                  xor          a1, t0, t2
                  srl          a4, t0, s2
                  fmv.x.w      a4, ft6
                  flt.s        t3, fa2, fs5
                  mulhu        s6, t1, s4
                  add          s7, s11, a2
                  sll          s1, s0, a4
                  ori          tp, a1, -808
                  ori          s10, ra, -974
                  mulhu        s3, t3, s11
                  xor          s0, a0, t3
                  fsgnj.s      ft0, fa1, ft10
                  flt.s        s3, ft0, fs10
                  fcvt.wu.s    s4, fs10
                  xor          a2, t1, s3
                  auipc        t3, 921102
                  xori         s9, t6, -957
                  fcvt.s.wu    fs7, s8
                  fdiv.s       fa1, ft9, fa1
                  mulhu        t4, a4, t6
                  nop
                  and          sp, s7, t6
                  mulh         s3, s11, s5
                  xori         s2, s4, 37
                  sub          a6, t5, s9
                  sll          t0, s7, t0
                  fsub.s       fs0, fs7, fs4
                  rem          s8, s10, t4
                  fmul.s       fa3, fs8, fa3
                  mulhsu       a1, s2, s5
                  fcvt.wu.s    a3, fa0
                  srli         s5, s9, 6
                  fmin.s       fa1, fs7, fa5
                  slli         t4, s1, 4
                  srli         s5, a2, 12
                  xor          s9, s1, tp
                  srai         a4, a4, 17
                  fsub.s       fs6, fa5, fs10, rup
                  srl          s1, t4, tp
                  lui          sp, 466869
                  srai         s7, s6, 26
                  rem          gp, a6, t2
                  lui          s1, 958897
                  srai         a7, s3, 5
                  slli         t4, a7, 12
                  ori          t2, zero, -1535
                  mulh         tp, t2, t0
                  srli         tp, a0, 7
                  fsqrt.s      fs1, ft9, rup
                  fsub.s       fs11, ft7, fs7, rne
                  divu         zero, s10, s3
                  andi         s3, a5, -1619
                  fsqrt.s      fs1, ft7, rtz
                  ori          a1, a7, -53
                  fsqrt.s      fa2, ft6, rup
                  fcvt.w.s     a0, fa4, rup
                  rem          t2, t0, a1
                  and          a0, t1, s2
                  div          t4, t6, s1
                  sltiu        t3, t1, 1502
                  xor          s5, s6, a4
                  srai         sp, s1, 31
                  nop
                  fclass.s     s5, fs1
                  andi         gp, a6, -1763
                  fcvt.wu.s    s10, fs1
                  srli         a4, s11, 12
                  auipc        a1, 450838
                  slti         s8, s1, 957
                  fsgnjn.s     ft3, fa3, ft10
                  fmv.x.w      s10, fs1
                  fcvt.s.w     ft0, a0, rne
                  fadd.s       fa7, ft0, fs1
                  lui          a1, 346676
                  fdiv.s       fa2, fs11, fs0
                  fsgnjn.s     fa1, fa0, ft3
                  rem          ra, zero, s11
                  flt.s        ra, fs4, fs10
                  sltiu        s8, tp, -1614
                  fsgnjx.s     ft1, fa4, fs7
                  sub          s9, ra, a5
                  srai         t1, s8, 10
                  mul          a2, s9, s3
                  ori          a1, s1, -1918
                  auipc        s0, 538682
                  addi         s2, t3, 680
                  fsgnjx.s     fs5, fs0, fs9
                  divu         s8, a2, s6
                  fsgnjn.s     ft9, ft10, fs11
                  fsgnj.s      fs2, ft10, fa4
                  fmv.w.x      fa7, a1
                  fle.s        s7, fa7, fa4
                  feq.s        a4, fa6, fa1
                  lui          a0, 519831
                  slti         s6, a5, 1663
                  fmin.s       fs1, ft5, fa2
                  slti         s0, sp, -1852
                  fsub.s       ft8, fa2, ft1, rne
                  fcvt.s.wu    ft4, t6
                  fcvt.wu.s    s1, ft1, rtz
                  add          s5, s11, a6
                  lui          a2, 783902
                  ori          s3, zero, -1347
                  srl          t4, s11, a4
                  rem          t3, s1, s0
                  sltu         s3, gp, t0
                  fsub.s       fa3, ft9, fs11, rne
                  sltu         s10, t3, gp
                  xori         sp, a3, -619
                  fsgnjn.s     fs2, fs2, fs0
                  fcvt.s.wu    fs5, a4
                  addi         a2, s9, -59
                  fmv.x.w      sp, ft11
                  fsub.s       ft7, ft8, ft10
                  fmv.x.w      s9, ft11
                  mulhu        a7, tp, a7
                  sltiu        tp, s1, -1703
                  sll          a2, s1, s11
                  fmv.x.w      ra, fs2
                  rem          a1, t0, sp
                  srli         zero, ra, 29
                  fsgnjx.s     ft11, ft3, ft3
                  fcvt.w.s     s8, ft6, rne
                  fmax.s       fs5, ft6, ft10
                  ori          t4, a6, -915
                  or           s6, t6, s2
                  srli         ra, t2, 30
                  ori          a2, a2, -647
                  fsgnj.s      fs7, ft4, ft1
                  or           s4, s4, s1
                  fadd.s       fs6, fs1, fs3
                  sub          t0, s10, a0
                  nop
                  lui          a7, 364154
                  or           t3, s7, s9
                  nop
                  andi         s5, a3, -1273
                  slli         a5, t1, 24
                  or           s9, a3, a5
                  andi         s1, s10, -1554
                  fmin.s       fs1, fa4, ft0
                  fsgnjx.s     fa2, ft11, ft3
                  fmin.s       fs2, fa0, fa1
                  mulhsu       sp, t5, s1
                  fmin.s       fs11, fa1, ft7
                  srli         gp, s2, 10
                  addi         a0, sp, -1150
                  div          t2, gp, ra
                  feq.s        a5, fs0, fs4
                  fle.s        a6, ft7, fa1
                  fcvt.wu.s    s2, ft4
                  sltu         s10, s11, s11
                  fdiv.s       fa0, ft1, ft3
                  addi         a1, a6, 1990
                  fadd.s       ft8, fs9, ft4
                  rem          s3, a2, t0
                  mulhu        s5, a1, t0
                  auipc        s10, 479281
                  srai         zero, s8, 7
                  mulhu        s6, s4, a2
                  sra          ra, t1, s10
                  fsgnjx.s     fa5, fs6, fs9
                  fsqrt.s      fs8, fs6, rdn
                  fmax.s       ft7, fa0, fa4
                  fsgnjx.s     ft10, fs1, ft7
                  xor          a0, s10, s8
                  mulhsu       s7, a0, s6
                  nop
                  divu         s1, a5, a6
                  andi         a3, s7, 1021
                  xor          s9, tp, t6
                  sll          t2, gp, s1
                  feq.s        zero, fs0, fs5
                  fsqrt.s      ft6, fs10, rdn
                  divu         zero, zero, tp
                  fsqrt.s      ft3, fs8, rtz
                  fclass.s     t1, fs8
                  fsgnjn.s     fa3, ft9, ft2
                  fsqrt.s      ft11, fs8
                  fdiv.s       fs4, ft6, fa5
                  fle.s        s7, fa7, fa4
                  fsgnjx.s     ft9, ft2, fs10
                  srl          s9, ra, a5
                  feq.s        s5, fs7, fs8
                  remu         s7, tp, t1
                  fcvt.w.s     a4, fs2, rdn
                  fmin.s       fs6, fs11, fs10
                  slli         s9, a4, 22
                  srai         tp, ra, 5
                  sub          s7, a1, a6
                  nop
                  fsqrt.s      fa7, fa3, rup
                  srl          a7, t2, a5
                  fle.s        ra, fs2, fs8
                  fmv.x.w      t1, fa4
                  fsgnj.s      ft3, ft3, fs4
                  fcvt.wu.s    a0, fa6, rne
                  fadd.s       fa0, fs6, ft4
                  fcvt.s.wu    ft11, a1
                  flt.s        t4, ft2, fs11
                  fsub.s       fs6, fa6, fs11
                  or           gp, a0, t2
                  fsqrt.s      ft9, fs0
                  mulhsu       s10, s1, s9
                  sltiu        s8, t1, 1780
                  fcvt.s.wu    ft7, t4
                  fle.s        s0, fs1, ft11
                  fsqrt.s      ft9, fa5, rtz
                  fdiv.s       ft4, ft7, fs4, rdn
                  addi         t3, t4, 350
                  fcvt.s.wu    ft6, s1, rtz
                  srai         zero, t6, 25
                  sll          t1, s2, zero
                  flt.s        t3, fs5, ft0
                  ori          s1, s0, 886
                  fmax.s       ft1, fa6, ft5
                  fmax.s       ft6, fa4, ft10
                  xor          s5, t4, t0
                  srli         a1, tp, 1
                  fmin.s       ft5, fs2, fa7
                  nop
                  fmul.s       fa0, fs3, fa5
                  sll          a2, s3, a2
                  fdiv.s       ft5, ft8, ft10
                  slt          s4, a2, t5
                  slti         s0, s11, -2037
                  slt          a0, t2, t5
                  fmin.s       ft2, fs3, fa2
                  fcvt.wu.s    a4, fs8, rdn
                  mulhsu       s8, t1, tp
                  fsgnjn.s     fa5, fa6, ft5
                  auipc        ra, 352736
                  div          a4, tp, t4
                  slt          t0, s6, s4
                  fmv.x.w      s5, ft0
                  srl          s5, s0, zero
                  srli         s0, t5, 29
                  or           ra, t6, gp
                  remu         t0, s6, a3
                  lui          gp, 285991
                  mul          t0, s0, s11
                  fsqrt.s      fa2, fs0, rdn
                  sll          s9, s3, s2
                  fdiv.s       ft6, ft10, ft9
                  fsgnjn.s     fa5, fa3, fs4
                  mul          sp, t0, s4
                  nop
                  sll          s8, s2, s3
                  slli         s6, t4, 19
                  feq.s        s9, fa7, ft4
                  mulhsu       a0, s8, s1
                  slti         t1, tp, 765
                  fmax.s       fa3, ft4, ft1
                  fcvt.s.w     ft10, a0, rne
                  fmv.w.x      fs7, a1
                  fmin.s       ft1, ft2, fa0
                  xori         a1, zero, -1747
                  flt.s        s6, ft0, fs7
                  sltiu        s10, s5, -1261
                  flt.s        s0, fa2, ft2
                  div          t2, s6, s9
                  mulh         t4, t6, s5
                  remu         tp, t1, a1
                  divu         s10, a4, a1
                  srai         a6, s1, 15
                  srli         s10, tp, 30
                  sub          gp, a2, s5
                  fsub.s       fs5, ft10, fa6, rdn
                  fcvt.wu.s    a2, fa6, rup
                  mulhsu       a6, a3, t2
                  ori          a6, a0, -1832
                  fmv.w.x      fa7, t6
                  fle.s        gp, fa5, fa7
                  fadd.s       ft4, fs0, ft2, rdn
                  mulhsu       s6, s0, tp
                  slt          zero, zero, t4
                  fcvt.w.s     tp, fs7, rtz
                  remu         tp, s7, tp
                  sltiu        a3, s2, 388
                  sra          tp, s1, s2
                  fle.s        ra, ft6, fs2
                  nop
                  fcvt.wu.s    a5, fs2, rup
                  sll          a6, t0, s11
                  fmul.s       fs6, ft1, ft1
                  fsub.s       ft8, ft6, ft5
                  fsgnjx.s     fa1, fs9, ft7
                  mulhsu       s7, gp, t5
                  fsgnjn.s     fa1, fs7, fa1
                  sra          s8, s3, s2
                  fmv.w.x      fs10, t2
                  add          a7, t0, a4
                  nop
                  xori         s3, s3, -1329
                  sltu         a3, t1, s4
                  sltu         s7, t5, a6
                  fsgnjx.s     fs1, fs6, ft0
                  addi         t0, a7, 174
                  fmv.w.x      fs7, gp
                  fclass.s     a6, fs0
                  fmv.w.x      fa7, s3
                  or           sp, t3, zero
                  remu         t2, s2, gp
                  srl          s8, ra, s3
                  fsqrt.s      fa1, ft1
                  fsqrt.s      fa0, fs3
                  fcvt.wu.s    gp, fa5, rne
                  xor          ra, t4, s1
                  rem          t2, t4, a6
                  srli         s3, s11, 12
                  srl          a6, sp, a7
                  nop
                  srl          s2, a3, t2
                  fsgnjx.s     fa1, fs6, ft7
                  add          s0, ra, a6
                  sra          s1, zero, s2
                  fcvt.s.wu    fs9, gp
                  fmv.w.x      fs9, a6
                  fcvt.w.s     a2, ft6
                  xori         gp, zero, -2021
                  fdiv.s       ft0, ft10, fs6, rtz
                  fsgnj.s      fa0, ft1, fs8
                  flt.s        sp, ft0, fs4
                  fsgnjx.s     fs7, fs4, fs8
                  fcvt.s.w     ft10, s10
                  divu         sp, a1, a3
                  fsgnjn.s     fs5, fa4, ft5
                  fsub.s       ft11, ft0, fa0, rmm
                  sll          a1, s3, a1
                  fmv.x.w      a2, ft1
                  feq.s        s8, ft4, fs7
                  fcvt.s.w     ft1, s0
                  div          a5, zero, t2
                  fcvt.w.s     s3, ft9
                  remu         a2, s6, s8
                  sra          a0, t4, t3
                  fmax.s       ft7, fa2, fa6
                  ori          a1, a5, 670
                  fle.s        s0, fa4, ft3
                  and          t0, a1, s0
                  fsub.s       fs7, fa7, ft8, rup
                  fsgnj.s      fs2, fs0, fa1
                  sltiu        a7, s0, -1318
                  fmin.s       fs0, fa2, ft0
                  flt.s        t2, fs0, ft7
                  sra          s8, a5, t0
                  sra          gp, s3, a3
                  xori         ra, ra, 194
                  fdiv.s       ft7, fa4, ft6
                  rem          t2, s7, s5
                  lui          s3, 108880
                  or           t0, s1, a6
                  fmv.w.x      fa1, tp
                  nop
                  sub          a4, s8, s2
                  slti         a1, zero, -1197
                  srl          gp, s1, t2
                  sltiu        gp, zero, -767
                  fsqrt.s      ft5, ft0, rup
                  flt.s        t1, fs5, fs0
                  mulhsu       s0, t4, s11
                  fcvt.s.wu    fs11, a2
                  and          t3, s0, a6
                  sltu         tp, s9, t2
                  or           a5, a7, sp
                  addi         t1, s5, 1480
                  xor          sp, s4, sp
                  addi         s9, t2, 1588
                  and          a6, s9, s5
                  slti         s8, zero, 1341
                  sll          a6, a2, s11
                  divu         t3, s5, s7
                  ori          s8, s8, 1123
                  div          a5, a1, t3
                  add          a4, s0, s0
                  sltiu        s1, a4, 276
                  srli         t3, t4, 12
                  add          s1, t3, t1
                  andi         gp, a7, -569
                  add          gp, ra, gp
                  mulhu        s6, ra, a1
                  fmul.s       fa5, fs10, ft1, rup
                  fcvt.wu.s    sp, fa7
                  mulh         s10, a0, t0
                  lui          s3, 1019840
                  xor          ra, s5, t1
                  fmv.w.x      ft0, s7
                  fsgnjx.s     fs11, fs9, ft4
                  sltiu        t3, s11, -1132
                  srl          s3, t6, a5
                  mulhu        s1, s6, s11
                  fsub.s       fa3, ft3, fa4, rtz
                  fcvt.w.s     s5, fs1, rup
                  divu         s8, t5, tp
                  slti         s8, t5, 976
                  fdiv.s       fs1, fs9, ft8, rup
                  flt.s        t4, fa0, ft11
                  add          s6, s6, t1
                  ori          tp, t0, -538
                  fmin.s       ft8, fs2, ft10
                  sra          s2, a2, t2
                  mulh         a6, gp, gp
                  fsgnjx.s     fs3, fa4, ft3
                  mulh         s2, a6, s6
                  sra          s10, sp, s2
                  fcvt.w.s     t4, fs1, rdn
                  and          s6, a6, s8
                  ori          s5, a0, 1908
                  and          tp, s5, s8
                  addi         s3, s4, -401
                  fsgnjx.s     ft7, fa0, fs8
                  and          zero, a0, a2
                  add          s4, t3, s6
                  flt.s        s1, fs9, ft5
                  xori         s6, t6, -1776
                  andi         s7, s3, 190
                  fcvt.s.w     fs6, a5
                  fsgnjn.s     fs4, fa3, fa2
                  fclass.s     a7, ft9
                  xor          s8, ra, t1
                  add          tp, t2, t1
                  andi         t3, a3, 273
                  fsub.s       fa7, ft6, ft7
                  fsgnjn.s     fs1, ft6, fs10
                  lui          s9, 59988
                  slli         s7, a5, 11
                  srai         a2, s3, 17
                  fcvt.s.w     fs4, a0, rtz
                  fdiv.s       fs10, ft11, fs0, rne
                  divu         t4, t4, a6
                  fmin.s       ft11, fa2, fa1
                  or           s9, s11, s10
                  fsgnjx.s     fs0, ft8, fs1
                  sltu         a0, tp, t0
                  lui          a5, 330167
                  slti         a3, ra, -846
                  lui          s5, 1038699
                  or           a3, s0, ra
                  or           a3, t1, a1
                  sub          s1, a6, t4
                  andi         t3, a5, -1831
                  divu         s3, s11, t0
                  slti         a3, s11, -254
                  mulhu        sp, a4, a5
                  mulh         a4, t2, ra
                  sltiu        s7, zero, -1387
                  flt.s        t0, fa1, fs7
                  ori          s10, a7, 1689
                  flt.s        s0, fa0, ft8
                  fsgnjn.s     fs6, fa3, fs2
                  fmv.x.w      s1, fs0
                  slt          tp, t4, zero
                  sltiu        zero, s9, 521
                  or           a0, s3, s0
                  fcvt.s.w     fs11, gp, rdn
                  fmv.w.x      fa4, s10
                  lui          t4, 553033
                  slli         t3, s3, 29
                  xori         t0, a3, 1520
                  fcvt.s.wu    ft10, s7, rne
                  sub          a7, t4, s2
                  rem          s4, t0, s3
                  sll          a5, sp, tp
                  fcvt.w.s     gp, ft3
                  divu         s2, t6, t4
                  ori          zero, a3, 1693
                  auipc        t0, 411943
                  slli         s10, a4, 10
                  addi         a2, a1, 1989
                  nop
                  fsqrt.s      ft9, fs1
                  add          a4, a2, a6
                  lui          s9, 563131
                  fmax.s       fs6, fa2, fa5
                  slti         ra, t3, 171
                  sub          s8, t4, s6
                  sub          a7, t4, s10
                  add          a3, tp, s7
                  div          gp, t6, t0
                  flt.s        t1, ft0, ft3
                  andi         s4, t5, 1334
                  addi         s3, s11, -982
                  or           a5, s1, s0
                  fmin.s       fa2, fs8, fs9
                  slt          sp, s0, a4
                  slli         t0, a6, 28
                  sltu         sp, s5, s10
                  slli         t4, ra, 0
                  addi         s0, a3, -1470
                  and          s7, zero, zero
                  div          sp, s10, a3
                  srli         t4, a6, 28
                  rem          t4, s7, sp
                  slli         tp, a3, 28
                  lui          sp, 704189
                  fmin.s       fs5, fa1, fs7
                  fcvt.w.s     s10, fs7
                  divu         s0, a4, a1
                  andi         s7, t1, 431
                  and          a6, sp, ra
                  fadd.s       ft2, fs4, fs9, rne
                  ori          s1, t0, -776
                  rem          t1, a5, s1
                  fmin.s       fs6, fs3, ft11
                  fsgnj.s      ft9, ft8, fs3
                  fcvt.wu.s    t4, ft8, rdn
                  sltiu        s6, a1, -1127
                  fcvt.w.s     a7, fa4, rmm
                  add          a1, s0, t6
                  div          s5, zero, s0
                  add          sp, t0, t6
                  xori         t3, zero, 2031
                  sll          tp, t4, t1
                  fclass.s     s7, ft10
                  fsgnj.s      fs8, ft10, fs0
                  sll          a5, s7, a4
                  fclass.s     a5, fs4
                  flt.s        t1, ft0, fa5
                  srli         t2, a4, 26
                  lui          t1, 608778
                  srai         s8, s0, 16
                  fcvt.w.s     a3, ft7
                  remu         sp, s3, a1
                  mul          t2, a5, s0
                  srai         s1, s6, 23
                  fmv.w.x      fs4, s11
                  fdiv.s       fa1, fa2, fa0, rne
                  lui          a7, 398645
                  auipc        sp, 714816
                  fclass.s     gp, fa4
                  add          a6, s11, s3
                  fdiv.s       fa5, fs1, fs2, rmm
                  mulhu        s3, s1, zero
                  mulhsu       s1, a4, s0
                  fsgnjx.s     fa3, fs4, fa7
                  fsgnj.s      fa6, fs7, ft7
                  sltiu        s2, sp, -380
                  fcvt.s.w     ft9, s0
                  slt          s9, s0, s10
                  mulhsu       gp, s2, s0
                  rem          zero, a2, sp
                  divu         t2, s10, sp
                  fmv.w.x      fs8, a6
                  ori          s8, a3, 946
                  xori         a5, s2, 1723
                  fsgnjx.s     fs5, fa7, fs9
                  sra          s5, s2, sp
                  fmax.s       fs9, ft9, fa3
                  feq.s        s7, fs10, ft11
                  andi         sp, t2, 623
                  mulhu        s6, a7, a2
                  rem          s10, gp, t1
                  srai         s5, t6, 7
                  sltu         s4, sp, s3
                  addi         s5, a1, -247
                  mul          gp, t2, s10
                  fclass.s     tp, fs3
                  div          s2, s10, s8
                  fsqrt.s      fa7, ft10, rmm
                  fle.s        t3, fs7, fa2
                  fmax.s       fs9, fs10, fs5
                  ori          a2, a1, 232
                  sltiu        s1, ra, 2015
                  fmv.w.x      fa7, s1
                  add          a7, t2, t0
                  auipc        zero, 824972
                  fmv.x.w      s10, fa6
                  fdiv.s       fa4, fa0, ft1, rne
                  divu         s3, t1, s8
                  sltiu        a4, a4, -1709
                  addi         a7, s8, -1949
                  auipc        s10, 532440
                  and          s6, t1, s1
                  ori          sp, tp, -543
                  slt          s6, tp, gp
                  auipc        t0, 6222
                  sll          sp, a0, a1
                  fsub.s       ft1, fs10, fs9
                  divu         s9, s3, s0
                  fsub.s       fs2, fa1, ft8
                  nop
                  auipc        sp, 498577
                  mul          t0, t2, ra
                  andi         a2, s3, 2043
                  slti         t4, t4, -1198
                  divu         t4, a1, a4
                  remu         a1, a4, a7
                  fmv.x.w      s8, ft5
                  fcvt.s.w     fa2, s11
                  auipc        ra, 455840
                  divu         s10, s10, t5
                  slli         a7, a1, 29
                  fsgnjx.s     ft11, fa5, fs11
                  sub          a3, s11, ra
                  fsgnjn.s     ft9, fs2, ft3
                  fmul.s       ft6, ft5, fa1, rtz
                  mulhu        s3, s11, a5
                  sll          t3, s6, sp
                  sll          a5, s3, s10
                  fcvt.wu.s    a4, ft1
                  fmax.s       ft0, fa7, fa1
                  fle.s        a7, fs8, fs4
                  fadd.s       ft6, fs7, fa7, rmm
                  fle.s        s2, fa0, ft6
                  mulhsu       s5, sp, a1
                  fcvt.w.s     sp, fs9, rmm
                  lui          t0, 1045284
                  fle.s        a5, ft0, fa5
                  fsgnjx.s     ft0, ft10, fs8
                  feq.s        a2, fa5, fa0
                  fsqrt.s      fs2, fa2
                  fadd.s       fs8, ft6, ft7
                  fsgnj.s      ft8, fs1, fa5
                  add          s3, a2, s10
                  fmul.s       fa1, fs4, fa1, rdn
                  fmul.s       ft7, fs3, ft4
                  andi         t1, s7, -1326
                  fcvt.wu.s    tp, ft11
                  fsgnjn.s     ft7, fs4, fs6
                  nop
                  or           a6, a0, a6
                  ori          t2, a3, 1644
                  fle.s        s5, ft10, fs11
                  fdiv.s       fa7, fa3, fs6
                  fcvt.s.w     fs10, t1, rdn
                  sltiu        zero, t6, -728
                  mul          s5, s11, t4
                  sll          a1, a0, s5
                  andi         s2, s4, 1844
                  auipc        tp, 540930
                  nop
                  fsgnj.s      fa6, ft7, fs8
                  sub          s0, s11, t0
                  fmv.w.x      ft11, t5
                  slli         a5, a0, 7
                  fle.s        a6, fa0, fs7
                  fcvt.s.w     ft9, t1, rne
                  srai         s4, t5, 4
                  sltu         s6, t6, ra
                  andi         sp, s3, 388
                  fmin.s       fs2, ft11, fs6
                  sltu         t0, t5, a3
                  fcvt.wu.s    t0, fs5, rne
                  nop
                  slli         ra, sp, 25
                  auipc        sp, 303869
                  slli         t3, sp, 6
                  fclass.s     a7, ft10
                  sltiu        a6, t3, -945
                  remu         s7, s11, t1
                  fmul.s       ft10, fs3, fa0
                  fadd.s       ft3, ft6, fa3
                  fclass.s     s10, fa0
                  addi         a7, ra, 1348
                  remu         t0, a0, gp
                  mulh         gp, t5, s6
                  fcvt.s.wu    fs9, a1
                  sll          s5, t0, t5
                  fcvt.w.s     a0, fa5
                  fmax.s       fs2, fs10, fs9
                  fmax.s       fa6, ft3, fa7
                  fsgnjx.s     ft10, ft11, ft0
                  mulh         t1, s1, a5
                  addi         s2, a3, 1405
                  nop
                  remu         a4, s11, s11
                  srai         s6, a0, 21
                  mul          s6, s2, s0
                  fcvt.w.s     a1, fs7
                  mulhsu       a4, a0, s7
                  mulhsu       s8, a0, a1
                  slt          s10, a3, s2
                  or           s10, s11, sp
                  fadd.s       fs0, ft1, fa6
                  fcvt.s.wu    fa3, s11, rup
                  fcvt.wu.s    s7, ft9
                  fsqrt.s      fs6, fs3
                  sra          zero, a2, t4
                  fsgnjn.s     fs7, fa1, ft10
                  fmul.s       fa7, ft1, ft7, rne
                  fsgnjn.s     ft2, ft4, ft1
                  fcvt.wu.s    a6, fa7, rdn
                  fsqrt.s      fa0, ft10
                  or           t0, tp, t1
                  div          a1, s6, s2
                  feq.s        s0, ft11, ft2
                  andi         s9, a0, 771
                  or           a0, s5, t6
                  fmax.s       ft10, ft8, fs8
                  fle.s        t3, fa4, ft9
                  fcvt.wu.s    zero, ft5, rmm
                  fmin.s       ft0, fa3, fs10
                  sltu         t4, a3, s1
                  srai         s2, s9, 22
                  fclass.s     s9, fs10
                  ori          s5, s0, -1083
                  fle.s        s2, fa2, ft9
                  ori          s7, s5, 445
                  fcvt.s.w     fa2, zero, rmm
                  slt          s2, gp, a4
                  rem          a4, sp, a1
                  fdiv.s       fa7, ft10, ft8
                  mulh         t0, s10, t4
                  fsgnjn.s     ft6, fa0, fs8
                  fsgnjx.s     fa0, fs9, fs0
                  fadd.s       ft1, ft9, fs5
                  fcvt.s.wu    fa2, a7, rne
                  slli         s5, s1, 21
                  xori         a3, s7, 81
                  srli         t0, s0, 8
                  sub          s6, t4, t2
                  flt.s        ra, ft8, fs2
                  nop
                  feq.s        t3, fa2, fa1
                  slt          s9, s7, t5
                  and          a0, gp, a5
                  fsgnjn.s     fa6, fs3, fs11
                  mulhsu       t4, t4, t3
                  fmv.w.x      ft3, sp
                  fmv.x.w      s9, ft0
                  or           t2, s5, gp
                  fsgnjn.s     fs11, ft10, fa4
                  sltu         s4, s2, a0
                  or           t3, a1, a0
                  fsgnjx.s     ft7, fs6, fs1
                  mulh         gp, zero, t6
                  sra          t1, s7, a5
                  fmv.w.x      ft5, t6
                  fadd.s       fs0, fs11, ft6
                  ori          a4, t5, 1825
                  slt          t2, a2, s1
                  auipc        sp, 371236
                  srli         s0, t5, 21
                  fmv.x.w      a6, ft9
                  lui          s4, 120799
                  fsgnjn.s     ft6, fa4, fs7
                  mulhsu       gp, t6, t1
                  srli         t3, gp, 8
                  sltiu        s9, a2, 2018
                  mulhu        t2, a6, s10
                  feq.s        s5, ft7, fs0
                  fsgnjn.s     fa6, fa1, ft11
                  remu         a6, t6, s4
                  fsub.s       fs7, ft2, ft4, rup
                  fsqrt.s      ft3, ft4
                  fmax.s       fa3, fs9, ft9
                  fdiv.s       ft1, fa3, fa4, rne
                  xor          s1, a0, s10
                  srl          s4, s1, s3
                  slti         a5, a2, -505
                  sll          a4, s10, ra
                  srai         t3, t1, 10
                  sub          t0, s4, sp
                  xor          s2, s1, t2
                  auipc        tp, 820650
                  fclass.s     s3, ft11
                  fle.s        a3, fs0, fa0
                  divu         s2, a4, t3
                  rem          a3, ra, t4
                  fsub.s       fs1, fs11, fs0
                  rem          ra, a5, s10
                  mulh         a3, a6, s7
                  fsub.s       ft3, fs5, fs10
                  addi         s2, a7, -142
                  fmin.s       fs8, ft11, fs3
                  ori          s0, t0, 409
                  srl          t4, tp, a4
                  nop
                  slt          s0, a2, tp
                  sra          t4, a6, gp
                  fcvt.w.s     a3, ft6, rtz
                  andi         s9, a6, 606
                  flt.s        t0, fa7, fs9
                  addi         s10, tp, 1860
                  fsqrt.s      fs9, ft3, rne
                  feq.s        a6, ft2, ft4
                  srai         gp, s7, 31
                  auipc        t4, 963777
                  sra          t3, tp, s6
                  addi         t0, a2, -1698
                  auipc        s9, 133004
                  add          s1, a7, s10
                  fcvt.s.wu    ft7, s6, rdn
                  slli         s3, a5, 25
                  fcvt.wu.s    s9, fa5, rmm
                  lui          a3, 709633
                  fcvt.wu.s    s0, ft2, rdn
                  fmin.s       fa0, fa6, fs10
                  xori         gp, s7, -370
                  mulhsu       s4, s4, t5
                  feq.s        a0, ft8, fs7
                  flt.s        sp, fs10, fa0
                  andi         t1, t4, 1910
                  lui          s9, 78843
                  slti         a4, a4, 1551
                  nop
                  slti         a7, a7, -1248
                  mulh         zero, s6, t4
                  fcvt.s.wu    fa3, s9
                  fmin.s       fs3, fa3, ft10
                  remu         a1, t4, a0
                  flt.s        a3, fa6, fa7
                  or           a5, t1, t0
                  fdiv.s       fs3, fs4, ft11
                  fmv.w.x      fs6, a2
                  fsgnjx.s     fa1, ft4, fs7
                  div          sp, s6, zero
                  fmin.s       fa5, ft1, ft0
                  slt          sp, s7, s5
                  or           ra, sp, t5
                  and          s3, a7, ra
                  fsgnjn.s     ft9, fa6, fs2
                  fsgnjn.s     fa1, fs11, ft1
                  sra          s3, s6, s1
                  fsgnj.s      fa3, ft5, ft3
                  mulhu        s2, t5, a6
                  slti         a6, s10, 384
                  add          s10, a3, s10
                  slli         sp, s5, 0
                  div          a0, a2, s8
                  fadd.s       fa2, fs9, fs6, rmm
                  auipc        ra, 224416
                  sltiu        s8, s1, 99
                  fsgnj.s      fa2, ft0, fs5
                  auipc        t1, 233739
                  fmul.s       fs2, fs8, fs2
                  rem          s4, a5, s6
                  divu         a5, t0, s11
                  div          t4, t3, t2
                  sltu         t4, s1, s5
                  nop
                  sra          s3, a4, a3
                  andi         sp, a0, 961
                  fcvt.w.s     s10, fa3
                  divu         zero, s1, gp
                  mulh         a6, a0, a0
                  fadd.s       fs6, ft6, fs10, rtz
                  fmin.s       fs4, ft6, fa4
                  sltiu        t4, gp, 1378
                  fmv.x.w      s2, fs11
                  fmv.w.x      fs4, t2
                  mul          t4, zero, s5
                  sll          s3, s2, s2
                  ori          a6, zero, 403
                  fcvt.wu.s    t3, fs1, rne
                  fsgnj.s      fa2, ft1, fa2
                  flt.s        tp, ft11, fa6
                  xor          a3, t1, t1
                  ori          s6, a5, -57
                  srai         s3, s0, 18
                  auipc        gp, 428660
                  fmul.s       fs2, ft0, ft3
                  mulhu        s2, a0, s4
                  fmul.s       fs0, ft3, fa7, rup
                  fsgnjn.s     fs6, ft8, fs4
                  fdiv.s       ft4, fs1, ft2
                  fadd.s       fs7, fa3, fa6
                  sltiu        t0, s3, -639
                  fle.s        s0, ft11, ft6
                  fsgnj.s      fs4, fs3, fa2
                  rem          sp, s5, a1
                  addi         a5, t5, -272
                  div          a4, t4, tp
                  mulhsu       s0, s9, gp
                  div          tp, t0, t5
                  fadd.s       fa7, fs0, fa5
                  sltiu        sp, a5, -1949
                  srli         t2, s9, 10
                  fle.s        a3, fa1, fs11
                  sltu         a7, s6, s10
                  add          s5, gp, t4
                  sltiu        t1, s8, 765
                  fcvt.s.wu    fs1, t0
                  mulhsu       s0, s5, t4
                  and          t1, a1, tp
                  slli         s0, s5, 23
                  flt.s        t0, fs8, fs11
                  fmin.s       fs7, ft1, fs7
                  fsub.s       ft6, ft3, ft1
                  flt.s        s10, ft8, ft7
                  ori          s7, a5, -136
                  fclass.s     tp, fs9
                  fadd.s       ft0, fs6, fa4
                  xor          s6, s0, s4
                  remu         a1, t5, t4
                  srl          t2, s3, s8
                  sltiu        tp, a0, 157
                  srl          t0, t6, t6
                  add          t3, a4, a7
                  fclass.s     a5, ft1
                  slti         a6, t4, -478
                  fmv.x.w      gp, fs1
                  xori         ra, zero, -1085
                  sltiu        s4, a5, 1230
                  slti         s3, ra, -813
                  add          t0, t5, s11
                  or           ra, s6, s4
                  fmul.s       fs11, fs5, fa0
                  srai         s5, a2, 2
                  add          a2, zero, s0
                  fsgnjx.s     fa1, fa6, fa2
                  fcvt.s.w     fs9, a3, rne
                  slli         s7, a0, 25
                  fcvt.wu.s    a4, fa5, rup
                  fadd.s       ft4, fa1, fa3
                  fmul.s       fs9, fs9, fs11, rdn
                  mulhsu       a1, zero, a2
                  fsqrt.s      fa0, fs0
                  fclass.s     t2, fs0
                  fadd.s       ft0, fs2, ft1
                  feq.s        a6, fa1, fs3
                  fmax.s       ft10, fs6, fs0
                  fsgnjx.s     fa4, ft0, ft3
                  slt          t3, a3, s7
                  mulh         t0, t4, s6
                  fmv.x.w      tp, ft4
                  fcvt.s.wu    ft8, tp
                  sll          ra, t1, s0
                  fadd.s       fa0, fs0, ft1, rtz
                  mulh         s4, a2, s7
                  mulhu        s1, t6, a7
                  fmin.s       fs4, ft4, ft9
                  divu         a2, a7, a0
                  fsgnjx.s     fa7, fs11, ft4
                  lui          zero, 671369
                  sll          a2, sp, t3
                  fmv.x.w      s2, fs10
                  andi         a7, t5, 1881
                  flt.s        ra, fs2, fa0
                  fsgnjn.s     fa0, ft8, ft3
                  remu         a6, ra, t5
                  fcvt.s.wu    fs1, t3
                  lui          s10, 7111
                  sltu         a4, s4, a5
                  fsgnjx.s     ft3, fs5, ft9
                  mulh         a6, t5, a2
                  rem          s6, a7, t5
                  fcvt.s.w     fa7, s2
                  divu         s0, a5, t0
                  divu         tp, a7, s5
                  xor          s10, a3, a3
                  fcvt.s.wu    ft11, t1, rne
                  slti         t0, t4, 1291
                  mulh         gp, sp, s10
                  mulh         a7, t4, a0
                  feq.s        s5, fa7, fs9
                  slt          sp, a7, a5
                  fmul.s       fs9, fa4, ft11, rtz
                  mulhsu       a3, s1, t1
                  fmv.w.x      ft7, s0
                  fadd.s       fs2, fs0, fs1, rmm
                  srli         ra, s5, 24
                  fle.s        s3, fs5, fs0
                  srli         a5, t1, 29
                  fsgnjx.s     fs9, fa5, fs4
                  mulhsu       s10, s5, t4
                  slti         a1, s6, -271
                  xor          s6, ra, s0
                  mulhsu       s9, gp, t3
                  div          s4, s5, t3
                  fsgnjn.s     ft8, ft1, ft2
                  nop
                  nop
                  fsgnjn.s     ft11, ft4, fs5
                  lui          s8, 940530
                  fsub.s       ft7, ft4, fs3, rne
                  sra          s8, a7, t1
                  fmv.x.w      a4, fs0
                  div          s2, a7, a4
                  fsqrt.s      fa1, ft1, rtz
                  fcvt.wu.s    s9, fs1, rmm
                  sltiu        a0, t1, 1074
                  remu         a1, t3, s3
                  rem          a7, t2, a2
                  feq.s        zero, fa1, fa4
                  fmv.w.x      fa1, ra
                  sub          sp, gp, t3
                  slti         t2, s11, -1365
                  mulhsu       sp, t2, s11
                  lui          tp, 597480
                  mulhu        a2, s9, a2
                  fmv.w.x      fs10, s8
                  fcvt.s.w     fa5, t6
                  sra          a4, a0, t4
                  fmin.s       fa5, ft7, fa7
                  mulhsu       a0, a5, s5
                  mulhsu       a0, s7, s10
                  mulh         a2, a6, sp
                  fmax.s       fa4, fa1, fa0
                  add          s0, a3, s1
                  xori         s9, zero, -663
                  fmin.s       ft4, ft11, ft5
                  fsgnjn.s     fs7, fs1, fs5
                  fmv.w.x      fs8, s0
                  fcvt.s.w     fs1, gp
                  mul          gp, s10, a2
                  xor          t3, s5, s11
                  add          sp, t5, s6
                  feq.s        a4, ft6, ft5
                  fmv.w.x      fs0, s2
                  divu         s4, t1, t5
                  sra          t0, tp, s4
                  or           gp, s7, s9
                  srli         s7, s7, 31
                  fmin.s       fa6, fs10, fa2
                  fsgnjx.s     fa1, ft10, fs3
                  auipc        s2, 683732
                  slli         s9, s4, 31
                  fsgnjn.s     fa2, fa4, fs3
                  fcvt.wu.s    s1, fs2
                  mulh         s3, s7, s0
                  sub          a3, t6, s1
                  auipc        t1, 118052
                  flt.s        t0, fs11, fs0
                  or           s9, t2, ra
                  divu         t3, a0, s6
                  fmax.s       fs11, fs7, ft10
                  fmul.s       fa4, fa6, fa3
                  mulhsu       t2, a3, s9
                  sra          s9, zero, s11
                  fsgnjx.s     fs0, fa0, fa2
                  fclass.s     a0, fs5
                  and          s8, a6, a6
                  fmv.w.x      fa5, a5
                  fsgnjx.s     fs2, fa7, fs2
                  sltu         s1, s9, s10
                  fdiv.s       fs2, fs0, fa5
                  xor          s7, t2, a4
                  div          s8, t6, t0
                  fmv.x.w      a7, ft0
                  mulhsu       s10, a3, gp
                  fsgnjn.s     fs3, ft11, fa3
                  fadd.s       fs8, ft1, fa1
                  sra          t4, sp, t6
                  slli         zero, s9, 15
                  fsgnjx.s     fa2, fa4, fs0
                  remu         a1, s1, s2
                  sub          s0, s1, a7
                  fsgnjn.s     fa3, fa0, fs3
                  fcvt.wu.s    a6, ft9, rdn
                  xori         a3, a4, -310
                  fcvt.s.wu    ft1, s9
                  fmul.s       ft6, fa5, fa0, rmm
                  fsub.s       fs8, fs6, fs4
                  mul          s1, s4, s5
                  nop
                  slli         s8, t2, 29
                  fcvt.s.wu    fs0, a7
                  fclass.s     a3, ft8
                  and          s5, t2, s5
                  fcvt.wu.s    s3, ft10, rne
                  sltu         a3, t6, s5
                  flt.s        a4, fs6, ft2
                  fsgnjx.s     ft3, ft11, fs6
                  sra          zero, gp, s0
                  divu         s8, s7, t6
                  sub          s4, s11, s2
                  slt          ra, s10, sp
                  flt.s        t3, fa5, ft1
                  mulh         sp, t5, s1
                  fmv.x.w      a4, fa3
                  mulhu        s0, s9, t3
                  mulh         sp, tp, s1
                  auipc        t3, 862946
                  and          t0, t6, gp
                  srai         a0, a7, 25
                  fsub.s       ft5, fa1, fs5, rmm
                  fsgnjx.s     ft6, fs5, fs5
                  rem          t1, s10, a3
                  feq.s        s1, ft8, ft5
                  mul          tp, t0, s5
                  sra          a0, s0, s0
                  xori         sp, a5, -224
                  mul          gp, sp, t0
                  fclass.s     t3, ft6
                  feq.s        s0, fa5, ft6
                  sltiu        s6, s0, -1952
                  srl          s6, t3, s0
                  ori          a3, a1, -1754
                  srai         t0, sp, 0
                  sll          s5, s6, t5
                  fsub.s       fs6, ft6, fs3
                  fsqrt.s      ft9, fa3
                  remu         gp, zero, s1
                  mul          a4, t2, tp
                  fmul.s       fa5, ft1, fs8, rup
                  xor          a3, a6, s11
                  fcvt.w.s     gp, fs3, rup
                  fmax.s       ft2, fs11, fs4
                  add          a7, a4, s7
                  fmv.w.x      ft7, s1
                  feq.s        s7, fs11, fa5
                  and          s7, a2, t0
                  divu         t1, s2, a3
                  mulh         ra, s7, s6
                  fmax.s       fa6, ft3, fs10
                  fsgnj.s      fa0, ft5, fs6
                  srl          s7, s0, tp
                  sra          s0, s6, a1
                  mulhu        a2, a2, a3
                  fsgnj.s      ft8, fs3, ft8
                  or           tp, zero, s0
                  slt          a4, s1, a7
                  or           a3, s2, s8
                  ori          s2, s2, -1992
                  sltu         t0, s2, a7
                  srai         s1, t4, 13
                  lui          a7, 1003318
                  andi         s7, tp, 632
                  fmul.s       ft11, ft11, ft0, rup
                  fcvt.s.wu    fs3, tp
                  sub          t1, s8, s8
                  and          a5, a7, s8
                  addi         gp, a5, 604
                  rem          s2, t0, ra
                  andi         t2, s11, 1516
                  xor          a2, t1, ra
                  slt          s1, sp, s11
                  auipc        t3, 913121
                  mulhu        a4, a6, s4
                  fadd.s       fs1, fa2, fs7, rup
                  fmin.s       ft5, fs2, ft1
                  sra          t1, s3, s0
                  fcvt.w.s     t4, fs5, rdn
                  divu         s4, t2, s8
                  srai         s8, a4, 22
                  sltiu        a4, s1, 1819
                  mulh         a1, tp, a2
                  fmv.x.w      tp, fa3
                  mulhu        zero, a4, t6
                  slli         t3, t4, 2
                  fmul.s       ft8, fs3, fs7
                  nop
                  fcvt.w.s     t1, fs3, rup
                  fsub.s       ft4, fa2, ft6, rtz
                  fle.s        t3, fs4, fa4
                  fsgnj.s      fa7, ft1, fa2
                  feq.s        a1, ft1, ft8
                  srl          t1, s2, s4
                  fmv.w.x      ft3, t0
                  sltu         s8, t1, t3
                  slti         a7, t5, -2009
                  srli         s6, a0, 2
                  fle.s        a3, ft6, ft10
                  fmin.s       fa7, fa4, fa1
                  xori         s3, t3, -602
                  fmax.s       fa3, ft3, fa4
                  slt          s2, a4, t5
                  fcvt.w.s     t4, fs1, rtz
                  srli         a1, s4, 7
                  fle.s        a5, ft8, fa5
                  fcvt.s.wu    fa7, s5
                  sll          a7, t6, t5
                  fsgnjx.s     ft1, ft8, fa5
                  div          s10, s3, s7
                  fdiv.s       ft9, ft0, fs11
                  slli         t0, zero, 8
                  fcvt.wu.s    a3, fa6, rmm
                  srl          t2, t5, s2
                  auipc        t3, 89836
                  fadd.s       ft0, fa1, ft10
                  fcvt.s.wu    fs3, s5, rdn
                  sll          t1, a3, gp
                  fcvt.s.wu    ft8, ra
                  addi         s5, gp, 1128
                  srai         s2, a4, 19
                  slt          a0, t2, s6
                  xor          a0, t6, gp
                  mulh         sp, s2, s11
                  divu         a0, t3, s8
                  fle.s        s9, ft3, fs2
                  fcvt.wu.s    a6, fa3, rmm
                  mul          t2, t4, a0
                  fclass.s     t3, fs8
                  fadd.s       fa1, fa3, ft8
                  fsgnjx.s     fs7, fs7, fs10
                  divu         a4, s11, t0
                  div          s5, a3, t0
                  fcvt.s.w     ft0, t5
                  lui          a3, 78699
                  add          s5, a4, zero
                  mulh         s4, a5, a4
                  divu         s4, s4, s0
                  fcvt.w.s     t1, ft8
                  sll          zero, s9, a6
                  feq.s        t2, fa0, fs6
                  fmul.s       ft11, ft1, fs0
                  fcvt.s.wu    fa7, s9, rdn
                  mulhu        gp, s1, s5
                  fsqrt.s      fa0, ft9, rtz
                  fsgnjx.s     fs7, fs11, ft10
                  divu         a2, gp, t5
                  andi         s6, s2, 977
                  and          zero, s2, t2
                  srli         a7, t6, 16
                  ori          a2, s11, -433
                  lui          s2, 1008023
                  fsgnjx.s     ft11, fa1, ft5
                  slt          s10, t2, sp
                  or           a1, a4, s6
                  fcvt.wu.s    ra, fs6, rmm
                  nop
                  sub          a7, s1, gp
                  fsgnj.s      ft8, ft5, fs1
                  div          t3, t4, a5
                  sltu         t3, tp, t3
                  fmul.s       ft6, fs11, fs5
                  addi         s1, s9, 1326
                  fmv.x.w      a6, ft3
                  fsub.s       ft4, ft4, fs0, rmm
                  fcvt.s.w     fs4, s7
                  addi         s6, a6, -1875
                  fclass.s     s9, fs4
                  ori          t1, tp, 1790
                  mulhsu       t0, s5, a5
                  ori          zero, a6, 202
                  slti         s7, s11, 1473
                  fadd.s       ft2, fa5, ft3
                  srai         a4, s6, 6
                  sll          s6, s6, s5
                  fmv.w.x      fs0, s6
                  fadd.s       ft10, fs8, fs3, rmm
                  xor          s5, s7, zero
                  feq.s        s3, ft2, ft8
                  addi         a3, s5, -1446
                  slt          zero, tp, s7
                  fcvt.s.w     ft11, tp
                  divu         sp, a3, a1
                  nop
                  srl          s5, a2, a6
                  fcvt.wu.s    t2, fs3
                  nop
                  mulhsu       s1, s8, s1
                  mulhsu       zero, a3, t6
                  div          s2, t5, s7
                  mulhu        s10, t1, a3
                  remu         s8, a6, s4
                  ori          s8, t0, -1223
                  fadd.s       fs3, fa2, fs11
                  fmul.s       ft4, ft2, fs11
                  fclass.s     tp, fs9
                  andi         s5, s9, 1340
                  divu         a3, tp, t4
                  and          s4, s9, s8
                  flt.s        ra, ft2, ft2
                  fmax.s       fs2, ft0, ft11
                  fmv.w.x      ft10, s3
                  feq.s        s2, fa4, ft2
                  fsgnjn.s     fs11, fa0, fa6
                  fcvt.s.wu    fs9, a6, rup
                  sra          s2, a6, a0
                  sll          zero, t3, t5
                  or           sp, s7, t0
                  fsgnj.s      ft4, fa4, ft3
                  andi         t0, s2, 1746
                  mulhu        s1, t3, s3
                  slli         s2, t6, 10
                  fsgnjx.s     ft2, ft5, fs7
                  fsgnjx.s     ft0, fs0, ft3
                  fsgnjn.s     fa0, ft10, ft2
                  fmax.s       ft7, fs8, fa1
                  sub          s8, a2, a1
                  sltu         s10, s9, t3
                  andi         a7, sp, -869
                  srai         a7, s5, 16
                  fdiv.s       fs8, fa6, fs0, rup
                  slli         gp, s6, 24
                  lui          t0, 779043
                  div          s5, t2, t3
                  fcvt.s.wu    ft11, s2
                  fmv.w.x      fs10, s8
                  sub          s8, tp, s0
                  lui          gp, 904119
                  fmul.s       fs3, ft3, ft10
                  sll          t3, t6, s6
                  fcvt.s.wu    ft5, s5, rne
                  fadd.s       ft8, fs11, fs5, rne
                  and          a4, s0, a6
                  sltiu        s2, s1, -1446
                  fclass.s     s10, ft7
                  mul          s0, a2, a3
                  fmv.x.w      s7, fs8
                  mulhsu       s4, a6, s3
                  slti         s6, t0, -1511
                  fcvt.wu.s    s7, fa5
                  mulh         s9, a4, a3
                  add          a3, s4, s6
                  nop
                  xori         t2, t6, 1048
                  fmin.s       fs6, ft6, ft4
                  add          s5, s11, s11
                  fcvt.s.wu    fa2, s11
                  rem          t0, s5, s11
                  slli         ra, zero, 4
                  fsgnjn.s     ft0, ft9, ft3
                  fsgnjx.s     fa1, fs9, ft9
                  and          sp, s1, a5
                  fcvt.w.s     s9, ft9, rtz
                  srai         ra, a6, 16
                  fmax.s       fa7, fs0, ft10
                  fsgnjx.s     ft10, fs9, ft6
                  xor          s4, s0, s11
                  fmv.w.x      fa2, a2
                  auipc        s5, 434770
                  remu         s9, s9, a7
                  sub          s3, s11, s7
                  flt.s        s4, fs11, fs4
                  auipc        s10, 445169
                  fsgnjn.s     fs2, fs4, fs7
                  fsgnj.s      ft0, fs0, fs5
                  fcvt.s.wu    fa4, a7
                  fadd.s       ft5, fa2, fs4, rdn
                  mul          s10, tp, a4
                  fmv.x.w      a2, fa4
                  fsub.s       fs0, fa6, fs1, rdn
                  sll          a1, s6, s8
                  nop
                  add          gp, s9, s3
                  srai         s4, gp, 31
                  fmul.s       fs7, fa2, fs7, rup
                  div          t2, s2, a2
                  andi         s6, s4, -467
                  sltiu        t2, a0, -1680
                  mul          t0, s2, t6
                  mulh         s9, t1, s2
                  ori          a0, zero, 1875
                  fsgnjx.s     ft10, fs9, fs6
                  fmv.w.x      fs3, zero
                  slti         a5, a0, 169
                  srli         t3, a7, 29
                  mul          a4, s6, sp
                  mulhu        s9, s8, t4
                  divu         s5, s7, t2
                  fmv.w.x      fs10, s9
                  sra          ra, gp, ra
                  fcvt.s.wu    fs5, s1, rmm
                  sltiu        t3, a2, -1250
                  fcvt.w.s     ra, fa6, rdn
                  srl          s2, tp, a2
                  sltiu        t0, a1, 1313
                  xor          s0, a3, t4
                  fmv.w.x      fa3, a0
                  srai         s6, s4, 18
                  slli         t2, s2, 27
                  fcvt.s.wu    ft0, s9
                  fsgnjn.s     ft6, fs6, ft5
                  andi         s8, s7, -919
                  fcvt.s.wu    fs3, a6
                  sltu         ra, sp, a1
                  andi         t3, s7, -1570
                  srli         a3, s1, 29
                  fmin.s       fs2, fa5, fs4
                  fmv.w.x      fs4, a7
                  addi         s1, t6, 1161
                  fdiv.s       ft1, fs8, fs10
                  fclass.s     t4, fs3
                  srl          a1, s2, s3
                  fcvt.w.s     a5, ft4
                  fle.s        gp, ft2, fs8
                  sltiu        a2, s9, 375
                  fsub.s       ft11, fs9, fs10
                  fcvt.s.w     fs9, s5
                  fcvt.wu.s    a3, ft8, rup
                  ori          a3, a4, 1554
                  fclass.s     s7, ft7
                  auipc        s4, 1013009
                  fdiv.s       fa0, ft0, ft6
                  slli         s6, s6, 16
                  fadd.s       ft5, fs4, ft3
                  slt          tp, s9, gp
                  divu         s9, s10, s6
                  ori          s6, a6, 1349
                  andi         s3, s10, -243
                  fcvt.s.wu    ft11, zero
                  sltiu        a2, a2, -1307
                  fsgnjn.s     fs11, ft8, ft8
                  fclass.s     s6, ft6
                  remu         a5, a7, zero
                  sub          a3, a7, s10
                  fsgnj.s      fs6, fs10, fs11
                  fle.s        s7, fs5, fs6
                  flt.s        s4, ft6, fs11
                  fmv.w.x      fs7, zero
                  fsub.s       fs3, fs0, fs1
                  sra          t0, s4, zero
                  auipc        a4, 822571
                  xor          a2, a5, s10
                  mul          s5, s0, a4
                  ori          t0, a2, 1736
                  mulhu        t2, s6, t2
                  mulhu        s3, s11, a1
                  sll          s6, gp, gp
                  ori          a7, s3, 551
                  sll          a5, a4, s11
                  add          s8, sp, a5
                  srl          a3, t1, sp
                  lui          zero, 332342
                  srl          s6, a7, s5
                  srli         t1, t0, 6
                  sub          s8, a2, zero
                  feq.s        s8, ft8, fs9
                  add          s5, s6, s6
                  fsub.s       fa7, fa4, ft6
                  rem          a6, t0, s0
                  fclass.s     s3, fs4
                  nop
                  mulhu        a1, t5, gp
                  addi         s8, s0, 736
                  sltu         t0, a3, s4
                  fmul.s       ft5, ft4, fs5
                  sltu         t0, t1, s5
                  sra          s10, tp, s0
                  fsqrt.s      ft8, ft7, rmm
                  sra          t0, t3, gp
                  fdiv.s       fa7, fs6, fs3
                  or           s1, a2, s2
                  fsub.s       fa0, ft1, ft2
                  lui          a0, 480064
                  mulhsu       s9, s11, t2
                  mulh         s7, a4, a6
                  fsgnjn.s     fa3, fs2, fs2
                  fcvt.s.wu    fs5, s7, rne
                  slt          a5, t3, ra
                  fsgnj.s      fs0, fa0, fa5
                  lui          t4, 774277
                  fadd.s       ft9, fa3, fa3, rtz
                  fmin.s       ft7, fs7, ft6
                  fcvt.w.s     tp, fs5, rup
                  flt.s        s4, fs11, fa4
                  fcvt.s.w     fa2, tp
                  slt          a2, a7, a4
                  fcvt.w.s     s9, ft5, rdn
                  rem          s9, s5, t6
                  fcvt.s.w     fa4, s11
                  fadd.s       fs0, ft3, fa0, rmm
                  feq.s        s2, fa7, ft8
                  andi         t4, s1, -1372
                  fle.s        a6, ft1, fs5
                  sra          tp, a0, sp
                  mul          t3, s11, s8
                  fclass.s     a0, ft11
                  auipc        s0, 203391
                  mul          a2, s1, s8
                  ori          s9, s4, 830
                  fadd.s       fs6, ft5, ft4
                  fsub.s       ft1, fa1, fa5
                  srl          tp, s1, a1
                  mul          a5, a3, a6
                  fmax.s       ft9, ft5, ft6
                  sra          s1, s9, ra
                  fdiv.s       fs11, fs7, fa4
                  fmul.s       fs1, ft2, fs2, rtz
                  xor          ra, a0, t1
                  sra          gp, t6, a1
                  fmax.s       fa7, fs5, fs0
                  mulhu        s2, a2, t3
                  slli         s10, a1, 18
                  fle.s        s4, ft4, fa7
                  or           s9, s9, ra
                  andi         t0, t2, -834
                  fmin.s       fa4, ft8, fa7
                  fclass.s     a2, fs2
                  slt          s10, sp, s4
                  mul          zero, s11, a6
                  sll          gp, a6, s1
                  fcvt.w.s     s3, ft1
                  mulhu        s1, t2, t6
                  fmax.s       fa2, ft9, fs1
                  remu         s8, s3, t4
                  fmin.s       ft9, fs9, fs2
                  add          t2, t0, t3
                  mulhu        s1, s10, ra
                  sltu         a1, a4, t1
                  nop
                  fsgnjn.s     fs4, fa6, ft11
                  fsqrt.s      ft1, fa3, rmm
                  fmv.w.x      ft1, s4
                  srai         sp, s4, 4
                  fcvt.w.s     tp, fs8, rup
                  fcvt.w.s     a2, fs9, rmm
                  slt          t4, tp, s10
                  fcvt.s.wu    fs9, a7
                  fadd.s       fa7, fs5, fs10, rdn
                  and          a2, a1, a5
                  fsgnj.s      fs7, ft9, fa0
                  nop
                  sltu         s3, t5, a3
                  fmul.s       fa2, ft4, fa1
                  srl          s8, a5, s5
                  fcvt.s.w     fs2, ra
                  fle.s        a0, fs0, fs6
                  sltu         a1, a1, s10
                  fmin.s       ft0, fa1, ft3
                  fclass.s     s7, ft5
                  rem          a6, t2, s1
                  xor          a3, tp, tp
                  rem          a0, s8, s4
                  fcvt.s.wu    ft11, s10
                  lui          a4, 547225
                  slt          t0, s4, s10
                  feq.s        a0, fa7, fs5
                  srli         s4, a6, 11
                  addi         s7, a6, 270
                  fmul.s       fs10, ft5, fa0, rne
                  fsgnj.s      fa1, ft3, fs3
                  fdiv.s       fa3, fa1, ft3
                  auipc        s1, 875849
                  srai         s5, sp, 10
                  sub          t2, sp, a7
                  fsub.s       fs2, fs0, fs5, rtz
                  fclass.s     sp, fs7
                  fcvt.s.w     fs7, ra, rup
                  flt.s        s10, fs11, ft5
                  fcvt.w.s     s0, fa2, rne
                  fmin.s       fs5, ft5, fa6
                  mulhsu       a7, s8, tp
                  remu         s2, t0, s1
                  fadd.s       ft6, ft8, fa7, rdn
                  mulhsu       t1, s5, a3
                  fmax.s       fs7, fs2, fa0
                  lui          s8, 462091
                  fcvt.s.wu    ft10, t4, rdn
                  slti         a4, zero, -491
                  fsgnjx.s     ft3, ft10, fs3
                  divu         t3, s6, t6
                  fmul.s       fs9, fs0, ft3
                  mulh         a5, t3, s5
                  srai         s10, s9, 17
                  and          s10, s2, t1
                  slli         tp, s0, 30
                  feq.s        a6, fs2, fs10
                  srli         s10, zero, 0
                  rem          zero, t5, t3
                  slti         t0, t0, -1899
                  fcvt.w.s     t1, ft0
                  mulh         t2, s8, s0
                  srl          t4, s5, s9
                  sll          t0, ra, s2
                  lui          t4, 200794
                  or           a5, gp, s10
                  slli         s6, t1, 6
                  nop
                  fcvt.w.s     a3, ft8
                  sra          s4, t0, a0
                  mulhsu       a7, t4, a7
                  fsgnj.s      ft4, ft10, ft4
                  slli         a5, a3, 27
                  mul          s4, t4, a3
                  fmax.s       fa6, ft10, fs4
                  fadd.s       ft0, ft8, ft9
                  divu         s10, s1, s10
                  and          t4, t2, a6
                  xori         s4, t3, 160
                  and          a2, s11, t4
                  fsqrt.s      fs8, ft2
                  mul          zero, s11, s5
                  fsub.s       fs0, fs8, ft5, rmm
                  fsgnj.s      ft5, fs8, fs5
                  feq.s        t1, fs1, ft9
                  fcvt.s.w     fa7, s11
                  fcvt.w.s     a3, ft5
                  fsgnjn.s     fs10, ft11, fs10
                  fcvt.w.s     s6, fs7
                  fsqrt.s      fs9, fa6, rne
                  srai         s10, ra, 11
                  mulh         t1, s8, s5
                  fsub.s       fa7, fa5, fs9
                  srl          s4, a6, ra
                  mul          a6, s11, zero
                  fsgnj.s      ft7, fa5, fs2
                  ori          a7, s4, 1682
                  fcvt.w.s     s5, fa7
                  sub          a6, t0, t5
                  srl          a3, t6, t1
                  sltu         gp, a5, zero
                  fclass.s     s0, ft3
                  srl          t4, sp, t1
                  remu         a5, s3, s11
                  andi         a5, a1, -1929
                  and          tp, s2, s6
                  srli         t0, s9, 22
                  sltiu        t0, t1, 1359
                  fcvt.w.s     t0, fs8, rmm
                  mulhu        sp, a3, a7
                  sub          t0, a1, s9
                  fclass.s     s3, ft1
                  div          a4, s4, s5
                  fdiv.s       ft1, ft7, fa4
                  slti         t1, s5, 973
                  fadd.s       ft11, ft7, ft10
                  fmv.x.w      t1, fa3
                  andi         s8, t2, -782
                  divu         s8, s6, a4
                  fcvt.s.wu    fa1, s8, rmm
                  ori          ra, t1, -1778
                  feq.s        s10, fs11, fa3
                  sub          a7, t3, a7
                  fsgnjx.s     fs3, fs0, fs4
                  addi         a5, a5, 649
                  fcvt.wu.s    a4, ft11, rdn
                  div          s3, s10, sp
                  sub          a0, a0, a2
                  auipc        a2, 176188
                  fsqrt.s      ft3, ft3
                  fsub.s       fa6, fa5, fa5
                  fsub.s       ft5, fa7, fa3
                  fclass.s     t4, fs4
                  fle.s        a0, fa0, fs4
                  srli         s3, s4, 9
                  xori         sp, t5, -892
                  fcvt.wu.s    s0, fs4, rdn
                  add          a5, a7, t6
                  flt.s        a0, ft10, fs6
                  slti         gp, a2, -320
                  fmul.s       fa0, fa6, ft8
                  fcvt.w.s     sp, ft3, rup
                  srli         s0, s11, 6
                  remu         s3, t5, t2
                  fclass.s     gp, fa6
                  ori          s7, a5, -650
                  fle.s        s3, fs3, ft6
                  ori          gp, s1, 1201
                  srai         a5, gp, 12
                  fmax.s       fs10, fa3, ft11
                  mulhu        s5, sp, a6
                  flt.s        zero, ft9, fa7
                  srai         ra, s1, 8
                  xori         s8, t4, -237
                  fmv.x.w      s2, fs5
                  fle.s        zero, ft4, fs8
                  slti         zero, t3, 186
                  mulhsu       t2, s6, t4
                  xor          s3, s7, sp
                  fmv.w.x      fs3, s0
                  xor          ra, s8, gp
                  mulhsu       s5, a4, t3
                  addi         s10, s1, 31
                  slti         t4, s1, -1849
                  sll          a1, s4, gp
                  sll          a1, s0, s8
                  slt          a2, s4, a3
                  fsqrt.s      fs8, fa5, rup
                  fle.s        t0, fs5, fs11
                  fsqrt.s      ft1, fa3
                  fmv.w.x      fa2, tp
                  fdiv.s       fs0, ft8, ft8
                  fmv.w.x      ft7, s5
                  srai         s4, tp, 5
                  mulhu        s3, a1, s3
                  xor          a5, s3, s2
                  fcvt.w.s     s8, ft0, rmm
                  srai         tp, a6, 12
                  xori         tp, t6, -1443
                  div          a0, gp, zero
                  feq.s        s5, fs0, fs4
                  addi         s2, t5, -1610
                  fclass.s     s0, fs3
                  remu         t3, a5, t0
                  fle.s        t2, fs6, fs8
                  remu         a7, s7, t1
                  andi         s4, t3, 1106
                  mulh         t0, a0, s2
                  divu         s3, s8, s3
                  fcvt.w.s     a4, ft11
                  sub          a0, t3, tp
                  and          t0, t3, t6
                  rem          s6, a1, s6
                  remu         t1, gp, s0
                  fsgnj.s      ft4, ft2, fa5
                  fdiv.s       fs9, fs6, ft0
                  fdiv.s       ft5, fa2, fa7
                  remu         a4, s5, t5
                  slli         a6, a3, 5
                  fmax.s       fa4, fa2, fs1
                  mulh         t3, s3, t2
                  mul          s3, s2, s7
                  sltiu        s10, t4, -367
                  ori          s8, t1, -1464
                  fsgnjx.s     fs6, ft3, fa0
                  slti         sp, s3, 442
                  fclass.s     s1, fs7
                  auipc        s7, 34882
                  lui          t4, 978816
                  slli         gp, a6, 21
                  xor          sp, s9, gp
                  fcvt.s.w     fs1, zero
                  or           a6, t1, gp
                  srai         a7, s4, 12
                  sltiu        tp, zero, 1120
                  fsgnj.s      fa3, fs9, ft7
                  sll          s1, a7, s3
                  mulhu        a2, s2, t6
                  sll          t3, t3, s10
                  sub          s3, s2, t6
                  slti         s7, tp, 2016
                  slt          t2, s4, s4
                  fmv.w.x      ft9, gp
                  sltiu        s9, a6, 1682
                  andi         s4, t4, 1932
                  flt.s        a2, ft3, fa7
                  fsgnj.s      ft1, fs5, fa4
                  fmv.x.w      t4, fa6
                  sra          a1, s6, s2
                  xor          s4, t1, s6
                  sll          a7, sp, a6
                  sra          sp, sp, a6
                  srai         s6, a5, 6
                  fcvt.wu.s    a1, ft5
                  fsub.s       fs4, ft11, fs4
                  feq.s        s1, fa5, fs8
                  mulhu        s5, zero, a7
                  mulh         a0, gp, sp
                  sra          a1, t3, a1
                  nop
                  sll          t0, a3, t6
                  fadd.s       fs1, ft1, fs3, rmm
                  fmul.s       fs0, ft8, ft3, rdn
                  sra          s6, s11, a5
                  mul          a0, a2, s9
                  and          ra, a2, sp
                  add          s3, s5, s6
                  fcvt.s.w     fs11, s0, rne
                  sltiu        a1, a4, -989
                  and          s5, s5, sp
                  add          zero, t2, t1
                  srl          a6, s6, t1
                  sll          ra, a1, s0
                  addi         s4, a6, -1954
                  divu         a4, s5, a0
                  rem          s7, a2, sp
                  sltiu        s6, zero, 283
                  add          s10, s3, t6
                  nop
                  sltiu        a4, s11, 324
                  sra          t3, s3, t4
                  fmv.x.w      a4, fa7
                  slti         t3, t3, -1035
                  fdiv.s       fs8, fa2, ft8
                  mulh         s9, s6, a7
                  fmin.s       fs6, fa3, fa2
                  add          t1, tp, s5
                  fsub.s       ft2, fs2, fs4, rmm
                  mul          t0, s6, a2
                  div          a3, s2, s9
                  mulhu        tp, a5, s2
                  slti         s5, s5, -1316
                  feq.s        a4, fs1, fa2
                  xori         zero, a6, -1960
                  fcvt.wu.s    zero, fs6, rne
                  add          t3, s10, a1
                  nop
                  srl          s9, a7, gp
                  fdiv.s       fs2, ft6, ft9
                  fmv.x.w      s6, fs8
                  fcvt.w.s     t1, fs1, rdn
                  divu         t1, s8, t1
                  and          t4, s10, s9
                  fsub.s       fa1, fa1, fs6
                  fsgnjn.s     fs10, fs5, fa3
                  sll          a0, a6, t2
                  fcvt.wu.s    s0, fs7, rne
                  nop
                  fsub.s       ft4, fs6, fa6, rtz
                  fcvt.s.wu    ft4, s4
                  sltiu        a7, t0, 2046
                  mulhu        s10, t6, sp
                  xori         a2, a1, 1587
                  or           s8, zero, a2
                  ori          t4, t0, 1762
                  fcvt.w.s     s6, ft4
                  fsqrt.s      fa3, fa6
                  sra          a3, s7, zero
                  sll          sp, s9, sp
                  mul          sp, a2, s4
                  fcvt.s.wu    fa3, t6
                  slt          s5, s4, t3
                  lui          tp, 864733
                  slti         s4, s6, 1856
                  slli         s7, t5, 3
                  divu         zero, zero, a6
                  xori         s4, t2, -751
                  fmul.s       ft4, fs1, fa7
                  fmv.w.x      ft0, s8
                  div          a4, t1, t1
                  fcvt.wu.s    a7, ft0
                  fle.s        gp, ft8, fs2
                  fsub.s       fs7, fs10, fs11, rmm
                  add          tp, tp, t6
                  fcvt.wu.s    zero, fs8
                  fle.s        a0, ft9, fs3
                  remu         s6, s9, s11
                  slt          a1, a2, s1
                  srai         a3, s3, 7
                  fle.s        tp, ft5, ft8
                  remu         zero, s2, s8
                  sll          t2, t3, s6
                  mulh         s4, t2, a2
                  fcvt.w.s     t4, fa2
                  ori          s8, s6, -1969
                  mulhu        s9, a7, s6
                  fcvt.w.s     s2, ft10, rne
                  fadd.s       fs11, ft2, fs3, rup
                  add          s8, a1, s10
                  mulh         s7, t0, t5
                  and          s8, t4, s10
                  srli         t0, ra, 3
                  sll          gp, a5, t2
                  remu         t0, a7, t2
                  fsgnjx.s     fa7, fa2, fs3
                  fmv.w.x      ft7, zero
                  sltu         s8, t3, s3
                  fsub.s       ft0, ft11, fs2, rup
                  remu         a2, s4, s7
                  mul          a5, s4, s0
                  ori          a7, s5, 1691
                  fcvt.wu.s    sp, fs3, rmm
                  div          s10, s11, a1
                  slti         s5, s0, 1380
                  div          t3, s8, a4
                  fcvt.s.w     fs2, zero, rne
                  remu         s7, s0, s8
                  sll          s5, zero, s7
                  fcvt.s.w     fs0, a0
                  xori         zero, gp, -874
                  divu         a3, t4, s0
                  fmin.s       ft5, fs10, fs4
                  fmin.s       fs2, ft4, fa0
                  sub          s1, s3, s0
                  fmin.s       fs6, fa0, ft6
                  sltiu        zero, a0, 1922
                  sll          a0, t1, s10
                  sra          s5, s6, s4
                  slli         s9, a7, 17
                  fcvt.s.wu    ft3, s10, rmm
                  fclass.s     a1, ft8
                  fle.s        a7, ft6, ft2
                  fadd.s       ft0, ft7, fs8
                  xori         tp, s8, 173
                  fclass.s     s2, ft2
                  mulhu        s7, t3, a3
                  sltiu        a5, s10, -335
                  fmv.w.x      fs3, t6
                  and          s8, a5, s11
                  sll          a6, tp, zero
                  srli         s4, a2, 7
                  fmin.s       fs9, fs0, ft1
                  ori          s8, s5, 1877
                  div          s7, s3, a0
                  and          s5, s10, ra
                  sltiu        t1, a4, 1235
                  fsqrt.s      fs8, ft7, rdn
                  feq.s        tp, fa5, fs6
                  sra          s8, gp, s3
                  feq.s        ra, fs11, ft5
                  fsgnj.s      fa7, ft4, ft6
                  mulh         s6, a7, s3
                  flt.s        s6, ft10, ft9
                  flt.s        s4, ft9, ft2
                  mul          a6, s9, s11
                  lui          a2, 1010763
                  srli         s0, s4, 25
                  ori          a5, s10, -580
                  rem          s9, a3, a2
                  sll          a0, t6, a0
                  slli         s6, s3, 7
                  fle.s        a6, fs6, fs8
                  fsqrt.s      fs4, fa1, rtz
                  fcvt.wu.s    zero, fs1, rtz
                  fsgnj.s      fs3, fs0, ft3
                  xor          s8, a2, t0
                  fle.s        s6, fa6, ft3
                  ori          a1, s9, -1674
                  feq.s        s6, ft3, ft10
                  srai         a2, t1, 5
                  fsub.s       fs1, fa5, ft5, rtz
                  fmin.s       fa6, ft4, fa7
                  fmv.x.w      a7, ft1
                  sltiu        t1, t0, 1801
                  ori          t3, s5, 711
                  addi         s5, gp, -1200
                  feq.s        s8, ft6, fs7
                  divu         a0, s6, zero
                  div          a6, ra, s3
                  add          gp, t5, s10
                  feq.s        s6, fs10, fa3
                  fsgnj.s      ft6, ft9, fs3
                  fmul.s       ft7, fa3, fs6, rdn
                  sll          s9, a5, s5
                  slli         tp, t3, 10
                  fmin.s       fa1, ft2, fs8
                  sltu         sp, t4, a6
                  fcvt.wu.s    t3, fs10
                  fmv.x.w      s10, fs6
                  fdiv.s       ft7, fa3, ft5, rne
                  nop
                  fdiv.s       fa1, ft1, fa2
                  flt.s        s4, ft1, ft1
                  fdiv.s       fs2, fa7, fa5
                  fle.s        s1, ft0, fa2
                  xor          sp, a5, a7
                  div          a4, t6, a5
                  flt.s        s9, ft0, ft7
                  divu         sp, gp, s2
                  flt.s        s0, fs9, fs7
                  remu         ra, s10, zero
                  fmax.s       fs8, fa4, fa0
                  fsgnj.s      ft1, fa0, fs10
                  fadd.s       ft10, ft5, fs3, rmm
                  srli         a5, t3, 11
                  rem          s2, s1, tp
                  slt          a3, t3, a2
                  flt.s        s5, fa2, fs11
                  xori         s5, s3, 1399
                  mulhsu       t2, s2, s11
                  mulhu        a7, gp, s2
                  andi         a3, s3, 703
                  mul          a2, zero, t3
                  div          a1, a1, s10
                  sra          s2, t1, t0
                  fsgnjn.s     fs7, fa4, fs8
                  slti         t3, gp, -737
                  sltu         t1, s9, a7
                  remu         t1, a3, s9
                  fmax.s       fs7, fs1, fa6
                  fmin.s       ft7, fs10, fs5
                  fdiv.s       fs2, ft7, fs11, rmm
                  divu         s4, t4, a5
                  sltu         a1, a7, a7
                  or           a6, s7, a6
                  fmv.w.x      fa6, s5
                  divu         s7, a2, t5
                  rem          t1, a2, s6
                  flt.s        a2, ft7, ft6
                  fmul.s       ft4, fa1, fs8
                  div          zero, s4, t5
                  fsgnj.s      fs6, ft1, ft7
                  sltiu        a3, s2, 28
                  srai         t0, s1, 1
                  fle.s        s3, fa5, ft7
                  fmax.s       fa0, fa7, fs5
                  feq.s        s4, fs11, fs7
                  sltu         t2, s3, s8
                  fcvt.w.s     a3, ft6, rup
                  mulhsu       gp, t5, s8
                  lui          s10, 139511
                  fclass.s     s8, fs9
                  nop
                  fmul.s       ft8, fs5, ft10, rup
                  srai         t4, t5, 14
                  flt.s        a3, ft0, ft8
                  fsqrt.s      fa1, ft6
                  auipc        a7, 121908
                  fdiv.s       fs11, fs1, fa1
                  fsqrt.s      fa7, ft3
                  fle.s        a6, fa2, fs6
                  sltu         a2, s11, s9
                  fsgnjn.s     fa5, fs3, fa3
                  mulhu        s6, s9, s5
                  or           t4, tp, a1
                  fmul.s       ft5, fs7, fs6, rtz
                  sltu         s2, zero, t6
                  slt          a2, s7, s1
                  rem          ra, a7, a1
                  mulhsu       t2, s1, t3
                  or           s6, s6, t2
                  sra          tp, sp, s6
                  div          s10, a1, s3
                  fmax.s       fs7, ft9, fa3
                  fcvt.w.s     a0, fs3, rne
                  andi         a5, sp, 1272
                  and          t1, s2, a0
                  sll          a1, ra, s2
                  feq.s        a5, ft7, fa0
                  slti         t2, a2, 1114
                  fsgnjn.s     ft9, ft10, fs10
                  mul          a2, t6, a3
                  rem          tp, gp, a3
                  mulhu        a1, a5, s0
                  fmv.w.x      fa5, t6
                  addi         sp, s7, -1010
                  fclass.s     a5, fs11
                  slti         s4, t3, 222
                  and          a6, s5, a1
                  rem          a2, s10, a3
                  fsgnjn.s     fs4, fa6, ft9
                  xor          t1, t2, s2
                  fdiv.s       fs2, ft3, ft3
                  fmv.x.w      t3, fs3
                  xor          t0, s10, s0
                  flt.s        a7, fa6, ft7
                  add          t1, a1, a3
                  ori          s4, a5, 974
                  fclass.s     a0, fs4
                  or           t3, t1, s9
                  xor          s0, ra, t6
                  sltiu        s3, s10, 1502
                  div          s1, s0, tp
                  mulh         sp, s10, a0
                  and          s8, gp, s9
                  feq.s        s0, fs8, fs10
                  remu         s4, t1, s5
                  divu         a7, ra, s11
                  mulhsu       a3, s11, a5
                  srai         s8, a7, 27
                  xor          t0, a4, s3
                  slli         gp, t5, 10
                  slt          s0, s4, s4
                  slli         s4, s3, 26
                  slt          s6, a6, gp
                  lui          s10, 61209
                  slt          tp, s8, a4
                  or           s1, a2, t3
                  fmin.s       fs2, ft6, fs1
                  sra          gp, s5, t6
                  lui          s10, 274275
                  ori          s7, a4, 232
                  flt.s        s9, ft3, ft10
                  fsgnjn.s     fa4, ft3, ft9
                  rem          a1, a3, s0
                  sra          s5, s9, s8
                  fmax.s       fa5, fs9, fs1
                  xori         s3, s10, -1716
                  xor          gp, tp, a4
                  fsgnjx.s     fs6, fa3, ft0
                  add          a7, tp, t6
                  sltu         a4, s8, ra
                  ori          ra, t1, -406
                  fsgnjn.s     fs10, ft3, ft8
                  srl          t3, t5, t4
                  sltu         t2, a6, a3
                  fmv.x.w      s5, fa0
                  fsgnj.s      ft3, ft0, fs3
                  mulh         a0, a2, zero
                  sltu         s8, t6, s11
                  mulhu        t4, s7, s4
                  fmax.s       fs1, ft7, fa3
                  sub          s1, s6, t0
                  sltiu        s8, s1, 273
                  fadd.s       fs8, fa6, ft1, rne
                  sltu         s7, s6, a7
                  fmv.x.w      a5, fa6
                  addi         a2, t3, 970
                  fcvt.s.wu    fs0, t6, rdn
                  or           s1, tp, a1
                  rem          s7, s8, a4
                  fclass.s     s7, ft8
                  srli         zero, a0, 5
                  xori         s6, s3, -320
                  div          a7, tp, a2
                  sra          zero, a2, a7
                  fsub.s       fs0, fa2, fs6, rup
                  fclass.s     gp, fa7
                  srl          a5, s10, a1
                  fsub.s       fs9, fs0, fs1, rmm
                  fmv.x.w      s6, fa5
                  divu         s1, a6, s6
                  fmax.s       fa6, fs0, ft8
                  addi         s6, t1, 797
                  fdiv.s       ft7, fs11, ft5
                  feq.s        s5, fa0, ft10
                  fcvt.s.w     ft10, t3
                  div          s0, a4, s11
                  fmax.s       fs0, ft7, fs10
                  mulhu        a6, tp, s11
                  fle.s        t4, fs2, fs4
                  sll          s7, s9, sp
                  fle.s        t4, fa0, fs1
                  auipc        tp, 378492
                  mulh         t4, t5, a7
                  fcvt.s.wu    fs0, t6, rtz
                  and          s1, s7, t3
                  andi         ra, sp, 36
                  xor          a0, a0, a0
                  nop
                  divu         s1, sp, t6
                  nop
                  lui          t3, 207131
                  srli         s0, t6, 22
                  mulhsu       ra, t1, t5
                  fmv.w.x      ft8, a2
                  sltu         s3, t4, gp
                  sltiu        zero, a5, -315
                  sra          zero, t4, a7
                  fsgnj.s      fs9, fs2, fa5
                  div          s2, a7, t2
                  ori          s10, s6, 660
                  fmax.s       ft3, fa3, ft6
                  or           t1, a3, t3
                  sra          t1, sp, a4
                  slti         s3, t5, -1784
                  div          s3, a0, a4
                  fmv.x.w      s7, fa0
                  fmv.x.w      a5, fs10
                  fcvt.w.s     t3, fs11
                  fsgnj.s      fa0, fs2, fs9
                  fcvt.s.w     fs7, t0, rtz
                  fcvt.wu.s    gp, fa7
                  slli         zero, a5, 18
                  xori         a2, s10, -1424
                  fmax.s       fa1, fa2, ft2
                  sll          sp, t6, s6
                  mulhu        a7, s7, s11
                  fsqrt.s      fs0, ft6, rmm
                  fmax.s       fa2, ft4, fs11
                  sltiu        t3, a6, 93
                  fsub.s       ft5, fs2, fs6
                  sll          a7, s0, a3
                  fmax.s       fs10, fa7, fa7
                  fcvt.w.s     s9, fs4
                  xori         zero, a5, 1759
                  fcvt.w.s     t0, fs6
                  srai         s8, s7, 6
                  auipc        s2, 671504
                  sll          a5, t4, s3
                  andi         tp, t2, 1953
                  fsgnjn.s     ft6, fs7, ft7
                  srli         tp, t0, 8
                  srl          zero, tp, t1
                  add          ra, a2, t3
                  div          a7, t6, tp
                  slt          t3, a1, tp
                  fadd.s       ft8, fs1, fa6, rtz
                  fcvt.wu.s    s10, fa5, rmm
                  srai         sp, a3, 5
                  flt.s        t4, fa0, fa4
                  mul          t1, t2, a0
                  divu         s2, s1, a3
                  andi         s7, tp, 1329
                  xori         s1, s7, 157
                  fmin.s       fa0, fa0, fs1
                  fcvt.s.wu    fs4, s6
                  andi         s6, a4, -1156
                  sll          tp, s2, a7
                  fadd.s       fs0, fs1, ft4, rmm
                  srai         s0, t2, 26
                  fmv.w.x      ft0, zero
                  fmin.s       ft3, fs5, fa4
                  ori          zero, ra, -777
                  flt.s        zero, fs4, fs6
                  fmv.x.w      s10, fa0
                  fclass.s     s6, ft2
                  mulh         s6, s2, sp
                  mulh         a6, s1, s5
                  fsgnjx.s     fs1, fs8, ft7
                  andi         a7, s0, -349
                  sltu         a3, t1, sp
                  or           t0, a6, zero
                  auipc        sp, 747995
                  sltu         a1, t4, t2
                  fmv.x.w      s9, fs2
                  xor          a1, s8, s11
                  fcvt.wu.s    t3, fs8
                  fdiv.s       ft2, fa0, fs9
                  srli         zero, s0, 7
                  xor          s0, s3, a2
                  add          s9, a6, a6
                  auipc        a5, 337413
                  fmax.s       fs9, fs4, fs1
                  fsgnjx.s     fa5, fs0, ft8
                  fsgnj.s      ft10, fa1, ft2
                  fsgnjx.s     fs11, ft8, ft6
                  xor          s7, s9, sp
                  fadd.s       ft11, fa2, fa0
                  slli         s0, t5, 8
                  fsqrt.s      ft10, ft3, rdn
                  addi         s10, tp, -485
                  sra          a5, s11, t5
                  srl          s4, s11, s11
                  fadd.s       fs2, fa6, fs6
                  sltiu        s5, ra, -1959
                  fdiv.s       fa1, ft11, fs8
                  remu         a2, a4, a2
                  mulhsu       gp, s3, a1
                  slti         a5, t4, 1189
                  sub          s1, a4, t4
                  divu         s0, a4, s2
                  nop
                  fsgnjn.s     ft0, fs8, fs4
                  add          a6, t4, a6
                  slt          a0, s8, t4
                  rem          t0, t1, s11
                  or           s5, s2, s9
                  feq.s        a1, ft0, ft8
                  fmv.w.x      fs5, s2
                  srai         s1, zero, 18
                  fsgnjn.s     fs1, fs9, fs5
                  fsgnjx.s     fa4, fa7, fs3
                  fmax.s       fa0, ft5, fa0
                  srl          t3, s2, zero
                  fle.s        s4, ft0, fs10
                  mul          sp, a0, a0
                  fsgnjx.s     fs3, fa1, fs3
                  slli         s3, zero, 14
                  fsqrt.s      fs5, fa6, rne
                  fsgnjx.s     ft9, ft6, fa7
                  xori         gp, a6, -949
                  fsgnj.s      fs6, fs9, ft7
                  div          s0, s6, a7
                  slt          s10, a5, t4
                  sub          a4, zero, s3
                  fmv.w.x      fa2, s11
                  fmin.s       ft5, ft9, fs2
                  fcvt.wu.s    s7, ft7
                  add          s7, t0, s2
                  fdiv.s       fs8, fs8, fs10
                  fcvt.wu.s    t4, ft10
                  xor          sp, s7, a7
                  fcvt.s.wu    fa5, a7, rtz
                  fsgnjx.s     fs8, fs4, fs4
                  srli         s2, a3, 9
                  fsgnjn.s     fs8, ft8, fa1
                  sub          s9, a7, a4
                  divu         a7, sp, a4
                  mulh         s7, t0, a1
                  slti         s2, a5, -983
                  div          s3, s6, a4
                  div          a5, a4, a3
                  fadd.s       fs10, ft9, fa6
                  andi         tp, s11, 1934
                  sltiu        a5, s6, 295
                  andi         a6, t0, 1764
                  fmin.s       ft8, ft5, ft6
                  srai         t1, a4, 13
                  xori         t3, s7, -139
                  add          t0, gp, s4
                  sltu         a3, s10, a7
                  fcvt.w.s     s6, fa0
                  nop
                  xori         a6, t5, 277
                  slti         t1, s7, 1810
                  fcvt.s.wu    ft11, t1
                  mulhu        s8, zero, t4
                  ori          t3, s4, 278
                  feq.s        s3, ft6, fs10
                  div          t1, zero, gp
                  rem          a0, t5, s2
                  srli         t4, a3, 19
                  fmin.s       ft9, fs3, ft4
                  fmax.s       fs7, fs2, fa7
                  srl          a2, s8, s11
                  fcvt.s.wu    fs10, zero
                  fsgnjn.s     fs4, ft8, fs1
                  sltiu        a5, zero, 1632
                  div          s10, s3, t1
                  mul          t2, s6, t5
                  lui          ra, 92495
                  and          a2, t1, t1
                  fsgnjx.s     ft9, fs5, ft3
                  fmv.x.w      zero, ft3
                  or           gp, s1, a4
                  fadd.s       ft8, fs0, fa4
                  fsqrt.s      fs11, fa6
                  fdiv.s       fs9, fa2, ft11, rdn
                  sub          sp, s10, s7
                  slti         sp, zero, -1706
                  and          a4, ra, a6
                  nop
                  mulh         t1, s11, s11
                  fmax.s       fs11, ft10, ft8
                  sll          a2, s5, t2
                  fdiv.s       fa3, fs8, fa5
                  slti         s9, ra, -510
                  remu         a3, s9, t5
                  feq.s        gp, ft2, fs0
                  sub          tp, tp, ra
                  ori          t4, a3, -839
                  srai         zero, s2, 15
                  mulhsu       t0, a1, zero
                  fmax.s       fs2, fa7, ft3
                  lui          a7, 760537
                  srl          a1, a2, s5
                  nop
                  fcvt.s.w     ft0, t3, rtz
                  fcvt.s.wu    fs2, a1, rmm
                  fdiv.s       fa3, fs5, ft5, rmm
                  divu         s3, a7, a4
                  rem          s10, s0, t1
                  fmv.x.w      t3, fs7
                  mulh         t0, tp, s11
                  fsgnjn.s     fs9, fa5, fs4
                  lui          a7, 959615
                  fclass.s     t2, ft8
                  srai         s10, s7, 1
                  ori          t4, zero, 599
                  sltu         sp, a4, a0
                  srli         s6, t3, 31
                  fcvt.s.wu    fa3, s6
                  or           a6, s8, s6
                  xor          s10, s10, a1
                  srli         s5, s2, 27
                  fcvt.w.s     zero, ft6
                  andi         s1, a2, 1776
                  fadd.s       fs7, fs1, fa4
                  fmax.s       fs0, fs7, ft6
                  flt.s        s4, ft6, fa3
                  feq.s        gp, ft0, ft8
                  andi         s8, s1, 1955
                  divu         t4, s1, ra
                  div          t0, a7, a1
                  xori         s3, t5, -1985
                  andi         tp, a7, -1989
                  fadd.s       fs3, fa7, fa3, rup
                  fmax.s       ft9, fa0, ft7
                  add          s6, a5, a6
                  fdiv.s       fs1, fa7, ft4, rup
                  mulhsu       s4, s9, s9
                  fsgnj.s      fa1, fs8, fs10
                  srai         a3, a1, 5
                  fsqrt.s      fs10, fs9, rup
                  add          sp, a3, a4
                  sra          s6, s7, s3
                  fmin.s       fs10, fs8, fa7
                  auipc        a2, 343312
                  slt          t2, t5, s2
                  sltiu        a5, tp, 1444
                  xori         s3, zero, -1145
                  fclass.s     a6, fa1
                  fsub.s       fa1, fs10, fs5, rdn
                  fdiv.s       fs9, fs8, fs5
                  add          s3, gp, s7
                  fclass.s     s1, fa6
                  sll          s7, sp, a0
                  slti         t3, a2, 1754
                  mulhu        gp, a5, a5
                  add          t1, a1, t3
                  mulhu        s6, t5, tp
                  mul          tp, a1, s4
                  srl          ra, t1, s2
                  fclass.s     a6, fs6
                  flt.s        a0, ft11, fs6
                  fle.s        tp, fs4, fa6
                  fsub.s       ft10, fa0, ft8
                  feq.s        s9, fa4, ft7
                  sub          a2, a4, a3
                  fmul.s       fa0, fs2, ft0, rne
                  fclass.s     a3, fs4
                  fle.s        s7, fa6, fs1
                  fsgnjn.s     ft7, ft2, ft2
                  srai         s8, zero, 2
                  addi         s5, t3, -1021
                  flt.s        s6, ft0, ft8
                  xori         sp, tp, 221
                  or           s3, a3, a0
                  and          a3, gp, a6
                  fmv.x.w      a5, ft0
                  sub          gp, sp, a1
                  fsgnjx.s     fs10, fs4, ft10
                  ori          s9, t6, 315
                  xor          a7, s6, a0
                  fcvt.s.wu    fs3, t2
                  remu         a5, t6, s5
                  auipc        t2, 862118
                  fadd.s       ft0, fa5, ft4
                  mulhsu       s3, a3, s9
                  fsub.s       fa6, fa4, fs9
                  srai         a5, s7, 26
                  fmin.s       ft9, fs0, ft1
                  sll          tp, tp, s3
                  fsub.s       fa3, fs8, fa3, rmm
                  slli         tp, zero, 21
                  lui          t0, 226488
                  fclass.s     t4, fs9
                  srli         t2, zero, 29
                  andi         a6, a5, -1228
                  sltu         zero, a2, t5
                  fmv.x.w      s4, ft4
                  xori         s5, s4, -93
                  mulh         a5, s2, a0
                  addi         s10, t1, 1955
                  ori          s8, s9, -1169
                  fclass.s     a5, fs10
                  xor          sp, a6, s2
                  addi         zero, gp, 811
                  nop
                  fclass.s     a6, fs2
                  fmv.w.x      ft9, a5
                  fmv.w.x      fa1, s2
                  srli         t2, a2, 5
                  srli         a1, s0, 30
                  fmv.x.w      s1, ft11
                  fdiv.s       ft7, fa6, ft4
                  srai         a4, gp, 0
                  fdiv.s       fs7, fs7, fs3
                  fmv.w.x      ft2, s11
                  sltiu        a7, a2, 1249
                  addi         t3, ra, -1399
                  sltiu        zero, t5, -1907
                  sltu         t0, t4, s10
                  fclass.s     s10, fa3
                  sll          sp, s6, t1
                  slli         s2, t6, 28
                  nop
                  add          ra, s10, sp
                  ori          s4, ra, -845
                  addi         a2, a1, -617
                  fcvt.s.wu    fs3, tp
                  fcvt.w.s     t3, fs2
                  flt.s        ra, fs9, ft4
                  fsgnjn.s     fa4, fs2, ft4
                  mulhu        s9, s5, ra
                  slli         a7, s8, 30
                  flt.s        s6, fa0, ft10
                  sltu         s9, tp, s6
                  sub          s2, s7, s3
                  sltiu        t1, t2, 498
                  fmul.s       ft0, fs9, fs5, rup
                  nop
                  srl          s6, tp, s2
                  srai         s2, t3, 14
                  xori         gp, t0, 1198
                  xor          s0, a7, sp
                  sll          a4, t2, t4
                  xori         a3, s6, 1336
                  remu         zero, s2, ra
                  sra          t4, t2, a0
                  mul          a4, s5, s3
                  fsgnj.s      ft0, fs7, ft5
                  fclass.s     a1, ft1
                  fsgnjx.s     fs7, fa6, ft4
                  mulhsu       s9, s8, a6
                  rem          a3, t2, a0
                  sll          s3, t1, t2
                  fsgnjn.s     fa6, ft11, fs5
                  andi         s7, s9, 603
                  divu         t4, a7, s3
                  mul          s7, a3, a2
                  srli         s10, s1, 6
                  remu         t4, a1, s4
                  srli         a2, t2, 5
                  slti         s10, gp, -438
                  flt.s        s1, ft7, ft9
                  fcvt.wu.s    a6, ft1
                  srl          s3, t1, a0
                  feq.s        s2, fs3, fa4
                  divu         ra, t5, a1
                  fmv.w.x      fa0, t4
                  addi         a5, s6, 1397
                  slti         t3, zero, -1772
                  ori          a2, t0, 1255
                  mul          s0, s6, t2
                  mul          gp, a2, sp
                  nop
                  srli         a1, a1, 25
                  fcvt.s.w     ft3, t1, rmm
                  addi         a1, a7, -1853
                  fsqrt.s      ft2, fa0
                  fcvt.s.w     fa7, s7
                  fsgnjn.s     fa1, fs2, fa1
                  sub          a6, a5, a2
                  fcvt.w.s     t3, ft11, rtz
                  div          tp, s0, a0
                  sub          a5, s4, sp
                  flt.s        a1, fs5, ft8
                  fcvt.wu.s    t4, fa5, rne
                  fcvt.s.w     fa2, t4
                  fcvt.wu.s    sp, fs8, rmm
                  fsub.s       fs8, fs11, fs5, rne
                  mulhu        t2, s6, s11
                  sll          t0, s5, s9
                  srli         tp, s11, 31
                  fdiv.s       ft10, ft10, ft8
                  fmin.s       fs6, fa0, ft9
                  remu         t4, gp, s7
                  fcvt.s.w     ft6, a1
                  fmv.w.x      fs7, s8
                  srl          a5, t5, t3
                  sltu         zero, s4, s8
                  srl          t2, s8, gp
                  sra          t4, s6, a4
                  nop
                  ori          a6, t1, 611
                  fcvt.s.wu    ft0, t1, rdn
                  sra          s3, s11, a5
                  auipc        tp, 611072
                  lui          t2, 225516
                  rem          tp, a0, t3
                  auipc        a0, 224758
                  ori          gp, a0, 1161
                  or           a4, a4, s4
                  mulh         s1, a6, gp
                  ori          s8, s10, 439
                  sub          s7, a6, a6
                  fdiv.s       fs7, ft11, ft2
                  andi         s6, a5, -457
                  fsgnjx.s     fs6, fa0, ft5
                  flt.s        a0, ft8, ft4
                  divu         ra, s10, ra
                  rem          zero, s3, gp
                  slt          a4, a4, s2
                  fmul.s       fa2, ft2, fs1, rmm
                  xori         s9, a3, 1357
                  fclass.s     s1, ft10
                  slti         a6, a0, -101
                  fcvt.w.s     zero, fa5
                  mulhsu       gp, zero, t1
                  slli         s2, t5, 6
                  fmul.s       ft11, fs0, fs7, rdn
                  divu         a4, t3, sp
                  lui          a3, 987694
                  auipc        a4, 748468
                  rem          a5, t3, tp
                  fsgnjx.s     ft0, fs9, fs3
                  mulhu        a3, ra, t3
                  mulhu        s0, t4, zero
                  andi         ra, a2, -469
                  fmul.s       fs6, fs2, ft3, rup
                  fmul.s       fs9, ft7, ft3
                  slt          t0, zero, s3
                  flt.s        tp, fa3, fs8
                  xori         gp, s7, -1729
                  ori          a6, t4, 562
                  mul          a1, gp, s8
                  flt.s        zero, fa0, fa7
                  lui          t2, 975860
                  fadd.s       fs10, ft7, fs11, rtz
                  fmin.s       ft0, fs9, fs5
                  addi         a1, s9, -645
                  or           s2, s11, s1
                  fmv.x.w      s5, fs5
                  ori          a0, s7, -406
                  srli         sp, a0, 21
                  sub          s5, a4, t4
                  sltiu        s8, t4, 205
                  andi         ra, s5, -1100
                  slti         gp, a5, -595
                  sub          a2, a6, s2
                  flt.s        s6, ft10, fs0
                  remu         s3, s4, t4
                  fcvt.s.w     fs8, s9, rmm
                  slti         a0, a3, 786
                  srai         s10, a2, 15
                  slt          s6, s8, s0
                  slt          a7, s5, s2
                  fcvt.s.w     fs11, a7
                  fsub.s       fs4, fa1, fs2
                  fcvt.s.wu    fs4, sp, rtz
                  fmv.w.x      fa6, s3
                  mulhu        s2, s5, ra
                  fcvt.s.wu    fa3, s9
                  fmv.w.x      fs1, s1
                  fmul.s       ft3, fa1, fs11
                  lui          a0, 474929
                  addi         s0, t5, 1198
                  remu         t3, s10, t4
                  flt.s        t0, ft2, ft7
                  xor          t1, zero, a2
                  or           s7, a5, s3
                  remu         a3, s6, sp
                  addi         a0, s0, -1428
                  fsgnjn.s     ft11, ft10, fa5
                  mul          s3, a2, gp
                  ori          ra, s9, -553
                  slt          s1, s7, tp
                  fmin.s       ft8, fa0, ft4
                  sll          s1, t5, t4
                  andi         s1, s7, -676
                  add          gp, zero, a7
                  mul          s9, s5, s6
                  slt          s1, t0, t3
                  or           a3, t2, s0
                  mulh         a0, t6, a4
                  fcvt.s.wu    fs10, t2
                  fsgnj.s      ft7, fs10, ft3
                  lui          s4, 537701
                  slti         t4, t5, 576
                  add          s10, a0, t1
                  fcvt.s.w     fs10, t4
                  flt.s        s1, fa5, fa7
                  mulh         t1, t4, t4
                  fsgnjn.s     fs3, fa0, ft3
                  fsgnjn.s     ft4, ft4, ft7
                  sltiu        a6, t3, 369
                  fcvt.s.w     ft7, t4
                  xori         s0, a2, -1847
                  mulh         t2, zero, a1
                  divu         a4, t6, a2
                  remu         s0, s10, gp
                  ori          a6, s9, 983
                  add          t2, s5, s0
                  addi         s0, sp, 1386
                  sra          s2, s10, s6
                  slt          s1, a2, a5
                  fsgnjn.s     ft7, ft2, ft7
                  rem          t2, a5, a6
                  nop
                  mul          t2, t0, s0
                  fmin.s       ft7, fa0, fa7
                  fclass.s     s4, ft10
                  div          s8, a3, gp
                  srai         gp, sp, 20
                  auipc        t1, 19238
                  fcvt.s.wu    ft4, s4, rup
                  fcvt.wu.s    a2, fs11, rup
                  sub          s3, a4, a6
                  feq.s        a7, fs3, ft1
                  mulhsu       s8, s7, s2
                  flt.s        a1, ft7, ft4
                  fcvt.s.w     fs0, s6
                  andi         tp, t5, -729
                  slli         zero, a3, 18
                  ori          t1, a4, -1102
                  fsub.s       ft10, ft0, ft9
                  fdiv.s       fa5, fs7, ft9, rdn
                  sltu         a7, t5, s1
                  mulh         t3, s9, sp
                  fcvt.s.wu    ft6, t3, rdn
                  fclass.s     s0, fa7
                  fsgnj.s      ft4, ft7, ft5
                  feq.s        ra, fs9, fs3
                  fdiv.s       fs3, fs5, fa6
                  sltiu        a4, s7, 985
                  fsub.s       ft8, ft11, fs5, rmm
                  remu         t0, gp, s7
                  addi         s1, s5, -1945
                  feq.s        a2, ft0, fs9
                  sra          s7, a3, gp
                  auipc        a2, 78205
                  fmin.s       fs11, fs1, fs3
                  srai         t4, s8, 16
                  xori         s8, s6, 1346
                  fmul.s       fs3, fs1, fa3
                  fmul.s       fs0, fa2, fa0
                  add          s8, a0, s8
                  fmul.s       fa1, ft8, fs0
                  add          s3, s5, a1
                  sltu         a7, a0, s2
                  sub          s0, t1, s6
                  fclass.s     a5, fs4
                  fle.s        s6, fs1, ft5
                  slti         s9, t3, 1052
                  fcvt.w.s     a5, fs6, rne
                  slti         t0, gp, 317
                  fle.s        a3, fa5, ft10
                  fcvt.s.wu    ft5, s1
                  feq.s        a5, ft0, fs7
                  srli         zero, tp, 23
                  andi         a5, sp, -1394
                  srl          a1, t1, s11
                  srli         a4, s3, 30
                  fclass.s     a6, fs5
                  fle.s        a3, fs0, fa5
                  srli         a0, s3, 27
                  slli         a1, zero, 28
                  fmv.x.w      a2, fs11
                  fle.s        ra, fs3, fs0
                  xor          s5, s5, gp
                  mul          a4, a1, s10
                  fcvt.w.s     s0, ft5
                  srl          s0, a4, s1
                  slti         a5, s5, 493
                  slli         t0, zero, 27
                  or           tp, t1, t0
                  remu         zero, a0, zero
                  fadd.s       fs5, fa5, ft0, rtz
                  remu         a4, zero, zero
                  sltiu        a4, t5, -1493
                  nop
                  srai         s3, a1, 19
                  xor          a4, s8, t1
                  mulhsu       gp, a1, sp
                  ori          zero, a1, 1066
                  ori          t2, a6, 490
                  slt          t4, ra, s6
                  fsgnj.s      ft4, fa6, ft3
                  mulh         s4, sp, a4
                  srli         s1, s1, 21
                  fdiv.s       fs0, fa3, fs9, rne
                  or           s10, t0, t6
                  fsub.s       ft9, ft6, fa5
                  div          a2, s2, a6
                  sltiu        s1, a5, 897
                  fsgnj.s      fa2, fa5, ft9
                  fle.s        t1, ft10, fs11
                  mul          s3, a1, s0
                  fmul.s       fa0, ft9, fs5, rdn
                  or           tp, t5, a2
                  fcvt.wu.s    s3, ft1, rmm
                  mul          a3, s7, zero
                  fcvt.wu.s    s0, ft11
                  nop
                  remu         zero, ra, zero
                  mulhsu       a1, t5, t0
                  fdiv.s       ft7, ft9, fs0
                  andi         s2, s9, -1841
                  xori         s3, a0, 154
                  nop
                  fsgnjn.s     fs10, fs6, ft5
                  fcvt.s.wu    ft8, a2, rup
                  mulhsu       s5, t3, a0
                  mulhu        t0, s0, t2
                  mul          a5, a2, s11
                  fclass.s     s0, ft0
                  fcvt.w.s     ra, fa0
                  fsgnjn.s     fa5, ft8, ft9
                  auipc        a7, 572166
                  fcvt.wu.s    s1, fa3, rne
                  fsgnjn.s     fs5, ft10, ft4
                  addi         s1, t5, -1630
                  fsgnj.s      ft10, fa6, ft2
                  sra          gp, t1, a4
                  fsub.s       fs7, fs1, ft2, rdn
                  fmul.s       fs2, fs7, fa2, rup
                  fmin.s       ft2, ft4, ft3
                  mul          a6, a2, s2
                  auipc        t1, 745326
                  srl          a2, s1, s5
                  addi         s1, a7, -1239
                  fclass.s     sp, ft3
                  srli         s7, a6, 13
                  add          tp, s2, s0
                  fmax.s       fs10, fs4, fa1
                  or           t4, zero, t2
                  xor          a6, tp, a3
                  fmin.s       fa3, fa3, fs3
                  or           s0, t0, s2
                  remu         s1, sp, s3
                  mul          zero, t3, sp
                  fsgnjx.s     fs6, ft11, fs0
                  fle.s        t2, ft4, fs4
                  fsgnjx.s     fa1, fa0, ft7
                  fadd.s       ft2, ft8, fs4
                  lui          a1, 802922
                  sll          s10, zero, t6
                  sra          a2, tp, sp
                  fcvt.wu.s    t0, fs5, rtz
                  remu         tp, s6, a6
                  mulhsu       sp, sp, t1
                  mulhu        t4, t0, sp
                  slt          a1, a0, ra
                  srl          zero, ra, s6
                  feq.s        t1, ft6, fa5
                  fcvt.w.s     gp, ft11
                  fmul.s       fa7, ft2, fa1
                  fsqrt.s      ft9, ft4, rup
                  fadd.s       fs1, ft5, fs5, rmm
                  andi         a5, s3, -1797
                  mulhsu       s2, s0, s5
                  nop
                  slti         tp, s9, 1884
                  fcvt.s.w     fs7, s6, rmm
                  fsgnjx.s     fs11, fa6, ft6
                  andi         a5, s4, 444
                  xori         a6, gp, -1906
                  srl          t0, s1, s6
                  add          t2, a7, t3
                  fsgnjx.s     fs1, fa7, ft8
                  auipc        s2, 302858
                  add          s1, zero, a6
                  fle.s        gp, fs1, fa1
                  lui          s6, 442351
                  auipc        s0, 674056
                  nop
                  mulhsu       a5, s7, t6
                  ori          t0, t5, 1862
                  fsgnjn.s     ft8, ft9, fa2
                  flt.s        s0, fs3, fs9
                  nop
                  srai         s6, ra, 19
                  andi         s1, s3, 1491
                  fsub.s       fa2, fs0, ft7
                  andi         a3, t5, 965
                  fmv.x.w      s8, fa5
                  slt          s6, a7, gp
                  ori          a3, sp, -545
                  auipc        a0, 298808
                  fmul.s       fs8, fa5, ft8, rup
                  or           a2, s1, a1
                  xori         tp, t2, -1145
                  remu         t0, a4, t1
                  mul          t3, s10, a0
                  fclass.s     a6, ft7
                  mulhu        s8, s11, a5
                  nop
                  fle.s        s1, ft7, fs5
                  fsgnjn.s     fs9, ft5, ft11
                  fsgnj.s      fa4, fs6, ft7
                  xor          ra, s1, s11
                  fadd.s       fs7, fa5, ft5
                  fcvt.wu.s    s3, fs4, rne
                  sltu         s6, a4, a3
                  sltu         sp, a2, s4
                  fsgnjx.s     ft8, fs10, fa5
                  div          s7, s7, tp
                  xori         a3, sp, -750
                  ori          s9, t2, -938
                  srai         t2, a7, 0
                  sra          s4, gp, a3
                  andi         s1, a7, -867
                  fcvt.wu.s    s9, fs9, rtz
                  sra          s8, zero, s10
                  remu         a6, a0, s3
                  fdiv.s       fs0, fa6, ft11, rup
                  fcvt.w.s     s4, fa0
                  slti         t2, ra, 424
                  slt          a6, t3, s5
                  fmul.s       ft10, ft4, ft5, rup
                  fadd.s       ft3, ft3, ft2
                  nop
                  srl          s6, t2, s1
                  divu         t4, s3, s2
                  fcvt.w.s     a1, fs7
                  srai         a7, a5, 11
                  fcvt.w.s     a1, fs10, rdn
                  xor          a5, s0, sp
                  fcvt.wu.s    a4, fa1, rdn
                  srl          s9, a3, t4
                  fclass.s     s8, fa1
                  fcvt.wu.s    s4, fs4, rne
                  fcvt.s.w     fs2, t4, rtz
                  sltu         s0, t5, s4
                  fmv.w.x      fa7, s8
                  fmin.s       fs1, fa7, fs8
                  fsgnjx.s     fs3, fa6, ft9
                  srl          tp, s7, tp
                  fsgnjx.s     fa1, ft1, fs3
                  mul          a2, s9, s1
                  srai         tp, s6, 27
                  divu         s8, ra, t2
                  addi         t0, t4, -1601
                  ori          s9, t3, 1916
                  add          ra, a2, s9
                  fsgnjn.s     ft0, fs1, ft7
                  sll          gp, a2, s1
                  fmax.s       ft6, fa6, fs7
                  mulhu        a6, a3, t6
                  srli         a4, s4, 1
                  sltu         a3, t0, t2
                  flt.s        s3, fa5, fs6
                  and          s0, s11, tp
                  mulh         a4, s3, s8
                  fdiv.s       fs6, fa6, fs9, rne
                  srl          t0, tp, a1
                  fsgnjn.s     fs7, fa4, fs11
                  fcvt.s.w     ft9, a1
                  add          s0, s7, s8
                  mulhsu       a2, s8, tp
                  fsgnjx.s     fs11, fa6, ft10
                  fmin.s       fa6, ft5, fa6
                  fclass.s     a6, ft6
                  div          s2, t3, a3
                  fsqrt.s      fa4, fa4
                  sll          a2, sp, a6
                  rem          s7, a0, s7
                  feq.s        a4, fs8, fs6
                  rem          a2, s11, a0
                  mulh         s10, s7, a2
                  fdiv.s       ft2, fa3, fs7
                  nop
                  div          zero, s10, s2
                  fmin.s       fs8, fs3, fs2
                  fmin.s       ft2, fs9, ft2
                  addi         a3, t1, 172
                  fmin.s       fs9, ft9, ft5
                  sltiu        a6, s6, 702
                  feq.s        s8, fa7, ft3
                  xori         a6, s6, -1633
                  fclass.s     s5, fs0
                  rem          s2, s4, zero
                  remu         s10, a1, s2
                  mulhsu       s4, s5, a5
                  slt          s7, s2, s8
                  fle.s        a7, fa4, fa5
                  sll          a2, s2, s11
                  srli         t3, s5, 14
                  lui          ra, 654856
                  ori          tp, s11, -2040
                  sltu         s0, t1, s4
                  flt.s        a5, fs9, fa1
                  fmv.w.x      ft11, a5
                  auipc        a7, 186744
                  slt          a7, a1, s1
                  mulh         s9, a0, sp
                  mulhsu       s0, t5, s4
                  lui          t2, 890890
                  mul          s5, s9, s7
                  fsub.s       fs8, fa6, ft9
                  xori         tp, s7, 444
                  divu         a5, t5, s3
                  mulh         s9, a1, a1
                  fsgnjn.s     fs5, fs6, ft2
                  sll          a4, a5, a1
                  fadd.s       fs1, ft0, fa4, rne
                  mulhu        gp, t0, s8
                  fmv.x.w      s6, fs1
                  mulh         a6, t4, s7
                  fmv.x.w      t1, ft8
                  sltiu        ra, s5, -1080
                  sltu         a2, t2, t3
                  fsub.s       fs2, ft11, ft6, rmm
                  fsub.s       fs7, fs7, ft9
                  fmv.w.x      ft2, a5
                  auipc        a5, 882447
                  sub          gp, a7, sp
                  addi         a2, s4, -353
                  mulhsu       a4, s0, a6
                  addi         gp, a1, 1889
                  fmin.s       ft9, fs3, fs0
                  xori         s3, s9, 437
                  srai         s1, s10, 10
                  fsgnj.s      fs11, fa1, ft8
                  fadd.s       fs5, fs0, ft7
                  sll          a4, s1, t4
                  addi         a4, s0, -938
                  fsub.s       fs7, ft3, ft1
                  srl          sp, s2, a6
                  slt          s0, zero, t0
                  or           tp, t1, ra
                  slli         a7, a6, 23
                  sltu         s7, s5, t4
                  div          a6, a7, a7
                  fle.s        t3, fa0, ft2
                  rem          a6, s9, t3
                  fclass.s     ra, fs6
                  divu         s7, t1, s3
                  sltiu        t0, s2, 1895
                  fadd.s       ft3, fa5, fs5
                  fclass.s     a7, ft5
                  slti         t3, s6, -1354
                  sltiu        s8, t2, 1241
                  fsgnjx.s     ft4, fs4, ft1
                  slti         zero, a6, 270
                  xori         s1, a4, 1747
                  fadd.s       fs11, ft2, fa0, rne
                  mulhsu       s2, a1, s2
                  slt          s5, s10, gp
                  andi         a4, zero, 1545
                  fmv.w.x      ft6, a3
                  srl          ra, s9, t4
                  slt          s2, a6, s4
                  fcvt.w.s     a2, fs0
                  lui          a5, 280596
                  fmv.x.w      a0, ft2
                  addi         s6, s2, 1476
                  fsub.s       ft8, ft5, fa2
                  mulh         s2, s4, a3
                  slli         s0, s6, 25
                  remu         s7, s2, s2
                  remu         sp, s1, s6
                  lui          a0, 179625
                  rem          s0, a0, a1
                  xori         s4, t4, -922
                  sltiu        t4, a2, -1060
                  slt          a0, ra, a0
                  rem          t2, t1, ra
                  lui          s5, 126165
                  divu         a7, a5, s5
                  fmax.s       fs10, ft0, ft5
                  fle.s        a3, ft5, ft7
                  xori         s10, a3, -871
                  sub          zero, t5, s1
                  mulhsu       s4, s4, zero
                  fcvt.w.s     a7, ft7, rdn
                  fmv.w.x      ft4, s9
                  remu         gp, t0, a7
                  mulhsu       a3, t4, zero
                  slt          a1, a5, s10
                  srli         tp, a7, 7
                  lui          a6, 379087
                  flt.s        s7, ft1, fa1
                  fmv.x.w      tp, ft7
                  srl          ra, sp, s4
                  slt          s7, s7, s8
                  fsqrt.s      fs1, ft1, rne
                  fdiv.s       fs5, fa5, ft3, rne
                  sra          s10, t3, t1
                  fsgnjn.s     fs6, ft2, fa6
                  fcvt.w.s     s5, fs0, rdn
                  divu         s6, t2, s0
                  slli         s9, s9, 29
                  rem          s8, zero, t6
                  fsqrt.s      fs5, fa6
                  fmax.s       ft10, ft9, ft9
                  and          a1, t2, t6
                  auipc        s9, 392329
                  fmax.s       ft3, fa6, ft6
                  or           t4, a2, t3
                  fmul.s       fs11, fs5, fs4, rmm
                  sll          a5, s10, gp
                  xor          a3, t4, s3
                  and          s10, s10, zero
                  flt.s        s7, fs3, fa1
                  fmax.s       fa1, fa6, fa6
                  sltu         a3, t3, tp
                  flt.s        t3, fa0, ft9
                  fle.s        sp, fa7, fa1
                  addi         a1, a3, -115
                  ori          s1, a4, 120
                  add          s5, a6, t5
                  xor          s0, t1, gp
                  sll          s2, s8, s8
                  sll          s3, a4, zero
                  fsqrt.s      ft2, ft8
                  feq.s        s5, fa1, fs10
                  and          sp, t0, ra
                  fcvt.w.s     s5, fs0, rdn
                  mul          a5, s0, a7
                  srl          s3, s8, s9
                  slli         tp, s2, 21
                  mulhu        s5, t2, a1
                  fdiv.s       ft6, fa5, fs10
                  fclass.s     s0, ft3
                  slti         s5, a5, -768
                  fcvt.s.wu    fs1, s6, rtz
                  fcvt.wu.s    a1, ft5
                  fsgnj.s      fs6, ft5, fs3
                  remu         a1, gp, a4
                  slti         a3, a7, -236
                  sra          a4, s7, t3
                  rem          s1, t4, t0
                  addi         a2, s8, -48
                  fcvt.s.w     fs7, a6, rdn
                  slli         gp, s1, 2
                  rem          s7, t4, sp
                  add          t1, t6, t5
                  fsgnjx.s     ft7, fs2, fs8
                  sltiu        s5, zero, -667
                  fcvt.s.wu    fs10, tp
                  fmin.s       fs9, ft7, fs4
                  fclass.s     sp, fs4
                  srli         a6, a3, 8
                  sub          t4, t3, a4
                  xor          sp, s11, s9
                  divu         a4, s7, t6
                  divu         a3, tp, t2
                  sltiu        s8, a4, -2039
                  fdiv.s       ft11, ft9, ft1, rdn
                  fmin.s       fs11, fa5, ft3
                  fdiv.s       ft11, ft4, ft9, rdn
                  nop
                  fmin.s       fs5, fs4, fs2
                  fcvt.w.s     s4, fa7
                  srai         sp, t4, 1
                  fmv.w.x      fs9, a1
                  sra          tp, s11, tp
                  ori          a1, t2, 1799
                  mulh         a0, s4, t2
                  sra          s10, t4, t5
                  and          s2, t4, s0
                  mulhsu       t0, a1, s3
                  fcvt.wu.s    s6, fa6, rmm
                  fsub.s       ft9, fa2, ft5
                  add          s1, s6, s0
                  divu         t0, a7, t0
                  sltu         a0, a4, s5
                  fmin.s       ft3, fs6, fs8
                  fle.s        s10, ft6, fa3
                  fsgnjn.s     fa6, fa5, ft1
                  fadd.s       ft2, ft6, fa5
                  fcvt.w.s     tp, ft1, rne
                  mulhsu       zero, zero, s10
                  mulhsu       a2, s0, zero
                  or           a4, s3, ra
                  xori         t1, s2, -1387
                  fsub.s       ft9, fa1, fs10, rtz
                  fsub.s       fs0, ft5, ft7, rmm
                  slli         gp, s1, 18
                  fmv.w.x      fs2, gp
                  divu         t4, s2, a3
                  fle.s        s3, fs2, fa2
                  nop
                  fsgnjx.s     fs3, fa4, ft5
                  fcvt.s.w     ft11, t3, rdn
                  nop
                  fcvt.s.w     ft9, a1, rne
                  fsqrt.s      ft11, fs0, rne
                  slli         s8, s10, 23
                  fcvt.s.w     ft5, tp
                  nop
                  xori         s7, s3, -2021
                  fclass.s     a6, fs5
                  remu         s0, s4, s10
                  fcvt.s.wu    ft10, a3
                  feq.s        s1, fs7, fs3
                  slli         t0, t5, 25
                  mulhsu       s5, a6, t3
                  flt.s        s0, ft10, ft2
                  remu         s3, s4, a7
                  ori          ra, a7, 1155
                  andi         sp, s10, 1704
                  nop
                  fcvt.s.w     fs3, a0
                  and          tp, sp, s5
                  flt.s        a5, fs3, ft8
                  srl          a3, a4, a5
                  sra          tp, s4, a4
                  fsub.s       fa5, ft8, ft10, rup
                  fcvt.w.s     t2, fs11
                  slt          a6, a1, a3
                  feq.s        s0, fs1, fa4
                  sltiu        zero, t4, 726
                  sub          a6, t6, a3
                  mulhsu       t1, a2, tp
                  lui          zero, 535595
                  sltu         a2, a6, a6
                  lui          t0, 953454
                  remu         t3, t2, s4
                  slti         a6, s5, 1091
                  fmax.s       fs8, fs7, fs6
                  fle.s        s10, fs0, ft5
                  rem          t4, s4, s2
                  fdiv.s       fs4, ft9, ft1
                  auipc        s8, 461685
                  nop
                  xor          t4, s7, a4
                  andi         s9, a1, -162
                  remu         a0, a1, a7
                  sltiu        t0, a4, 1132
                  fsub.s       ft10, ft9, ft4
                  fmul.s       fs2, ft6, fs9
                  nop
                  mulhu        s6, s2, s10
                  divu         t3, s6, s11
                  fmin.s       fs9, fs8, fs6
                  mulhsu       a7, s10, a1
                  or           s9, t0, t1
                  nop
                  fmv.w.x      fa3, s10
                  mulh         ra, s1, ra
                  and          s8, t6, a1
                  fsqrt.s      fs2, ft5, rne
                  sra          s7, s5, t4
                  fmv.w.x      fa3, a3
                  sub          a7, gp, tp
                  feq.s        s8, fs9, fs11
                  xori         s10, t2, -1027
                  fcvt.s.w     fa4, a0
                  ori          zero, s2, -57
                  srl          s7, s3, s0
                  srli         s7, s2, 0
                  slli         s9, a2, 16
                  srl          s2, s3, s11
                  fcvt.wu.s    s2, ft6, rup
                  remu         a1, a4, t3
                  sll          tp, s2, tp
                  rem          t3, s6, t5
                  sltu         a6, s3, a6
                  or           a7, s5, s6
                  srai         t4, t0, 29
                  feq.s        gp, ft4, fs8
                  fmin.s       fa4, fa1, ft7
                  fcvt.wu.s    t1, fs7
                  sra          t0, s7, s8
                  fsub.s       fs5, fs10, fs8
                  and          s3, zero, s3
                  ori          a6, s1, 641
                  fclass.s     a0, ft4
                  srai         t2, tp, 21
                  fsgnjx.s     ft11, ft4, fs5
                  fdiv.s       ft0, fa5, ft1
                  sra          a5, s7, s3
                  fsub.s       fa4, ft7, ft4, rne
                  divu         a1, t6, t4
                  fcvt.w.s     s4, ft4
                  fclass.s     s1, fs9
                  fmv.w.x      fs7, t1
                  fsgnjx.s     ft7, fa2, fs7
                  fmul.s       fs8, ft9, ft7
                  rem          a1, s9, a4
                  auipc        a5, 624412
                  mul          s9, a1, t1
                  divu         t0, s3, t2
                  srli         t3, s3, 28
                  div          t0, t6, t5
                  fcvt.wu.s    s2, ft9, rup
                  srl          a7, gp, s7
                  fsqrt.s      fs0, fa3, rmm
                  rem          t2, s0, a4
                  ori          t2, a7, 261
                  flt.s        s5, fs2, ft10
                  mulh         a5, gp, s6
                  fadd.s       fs3, fs6, fs8
                  div          a5, sp, zero
                  slt          a2, zero, s0
                  fclass.s     tp, fa2
                  fmv.x.w      a2, fs5
                  or           a1, s4, s10
                  feq.s        ra, ft11, fs10
                  sub          s8, a5, a2
                  fcvt.s.wu    ft6, s5
                  fle.s        t3, fs7, fs3
                  auipc        t4, 486767
                  flt.s        ra, fs7, ft1
                  fcvt.wu.s    s4, fs9
                  fdiv.s       fa5, fa0, ft11, rne
                  fclass.s     s6, ft5
                  add          s1, t3, t4
                  add          t0, a7, t6
                  srl          s1, s0, a5
                  remu         tp, t2, t5
                  mulhsu       t2, a1, a4
                  mulh         s0, tp, gp
                  add          s2, t4, a0
                  fcvt.s.w     ft3, s10, rmm
                  mulh         a6, t2, ra
                  fsgnj.s      fa7, ft2, fa0
                  fmv.x.w      t0, fs2
                  nop
                  fsgnj.s      fa5, ft8, fa5
                  addi         s1, s8, 2041
                  remu         a5, t2, s11
                  fsgnjn.s     fa3, fs11, fa3
                  fle.s        ra, ft2, ft1
                  auipc        sp, 835717
                  slti         s10, tp, -949
                  slti         t2, gp, -638
                  fsub.s       fs6, fa1, fa6, rdn
                  div          s7, a1, s11
                  or           s0, t3, a1
                  srl          s3, a0, t6
                  fcvt.w.s     a5, fa4, rmm
                  ori          s0, a6, -354
                  fcvt.w.s     a6, ft2
                  slt          a1, zero, s5
                  fcvt.s.w     fa4, s1, rup
                  fmin.s       ft6, fa3, fa3
                  addi         s3, s5, 1640
                  fcvt.w.s     s4, ft11, rup
                  slt          a1, s7, a5
                  fmv.w.x      fa1, s6
                  srai         s8, s9, 17
                  flt.s        s4, fs6, fs3
                  flt.s        a7, fs8, ft10
                  mul          s10, s11, a0
                  auipc        s2, 639149
                  fsgnj.s      fa0, ft9, fa7
                  srli         t3, a5, 28
                  fcvt.s.w     ft4, s7, rtz
                  mul          t4, ra, a2
                  fmv.x.w      s4, fa0
                  fcvt.wu.s    a1, ft2
                  fcvt.s.wu    fs8, t0
                  fdiv.s       fa7, ft3, ft8, rtz
                  sub          sp, s2, s9
                  lui          sp, 905417
                  feq.s        s8, ft2, ft2
                  fcvt.s.wu    fs1, a2
                  fcvt.s.wu    fs0, s11, rdn
                  fclass.s     a5, ft10
                  fmax.s       fa0, fa7, fa5
                  fadd.s       fs0, fs4, fs3
                  auipc        s2, 483090
                  sltu         tp, s10, a6
                  remu         ra, s11, gp
                  div          a4, s8, gp
                  fcvt.s.w     fa3, s3
                  remu         s5, tp, t2
                  addi         s1, s5, -235
                  sltu         t4, s8, s1
                  div          s0, zero, s11
                  mulhu        a4, s3, s0
                  sltu         a5, s11, a1
                  fcvt.s.w     fa4, s5, rne
                  divu         s6, s7, s11
                  lui          t0, 966767
                  srl          a7, zero, s7
                  fsub.s       fs10, fa0, fa7
                  fmv.w.x      fa1, s8
                  slli         s3, t1, 18
                  slli         t0, s6, 18
                  xori         t0, t1, -596
                  fdiv.s       ft9, ft1, fa4
                  flt.s        s10, fs11, fs5
                  xori         t2, t6, -573
                  fcvt.s.w     fs11, s6
                  and          a0, a5, s6
                  fcvt.s.w     fa0, tp
                  fadd.s       fs11, ft1, ft3, rup
                  fclass.s     t1, fs2
                  auipc        s0, 187183
                  fcvt.wu.s    a2, fa6, rup
                  ori          s9, s0, -1912
                  fadd.s       fs6, fs3, fs6
                  remu         t4, zero, tp
                  sll          zero, t5, tp
                  divu         a3, t0, s11
                  fdiv.s       fs5, fa2, fs5, rup
                  fmin.s       fa1, ft9, ft10
                  fmul.s       fs11, ft4, ft7, rmm
                  slt          s8, s7, s1
                  slli         a1, a3, 27
                  mulh         a3, a7, s9
                  fcvt.s.wu    fs5, t6
                  mulhu        a2, t6, s3
                  fmax.s       ft2, ft8, ft10
                  add          s10, a1, t1
                  fmv.x.w      a5, fs4
                  auipc        zero, 293040
                  divu         zero, a6, s8
                  fdiv.s       ft0, fs7, fa0
                  fclass.s     ra, fa3
                  auipc        a2, 409416
                  slli         tp, t5, 17
                  ori          s3, a1, -70
                  srli         a5, s8, 0
                  fmv.x.w      s2, fs2
                  fdiv.s       ft1, fa5, fs5
                  sll          s7, gp, s2
                  auipc        s2, 1044187
                  mulhsu       s8, s11, tp
                  div          s7, t3, s11
                  srl          s2, s8, s6
                  fcvt.s.wu    ft5, ra
                  ori          t0, s7, 946
                  andi         a5, a4, 1829
                  div          a3, a7, a6
                  mul          s9, zero, t5
                  xori         zero, s0, -234
                  sltiu        a2, a3, -1126
                  fmax.s       fs6, fs1, fs9
                  mulhu        t4, sp, s3
                  div          t1, ra, s6
                  slli         a3, s3, 22
                  rem          a0, t4, t4
                  ori          s6, s5, 1840
                  fmv.w.x      fa3, s9
                  fdiv.s       fa0, fa2, fs4, rdn
                  div          ra, sp, t2
                  div          s3, s2, s5
                  and          a4, gp, s5
                  fmul.s       fa3, ft1, fs6, rdn
                  fsqrt.s      ft2, fa6, rmm
                  div          s0, zero, gp
                  lui          s0, 948062
                  sltu         t1, s8, s10
                  fsqrt.s      fa4, fa0, rdn
                  auipc        sp, 538460
                  rem          t4, s7, a1
                  fsqrt.s      fs0, fa3
                  feq.s        a2, ft4, fs7
                  feq.s        tp, fs6, ft4
                  fle.s        s10, fs4, fs4
                  rem          s9, s11, s11
                  and          zero, s11, s6
                  fmax.s       fs7, fa0, ft5
                  fle.s        t4, fs11, fa6
                  slti         a6, tp, -973
                  andi         a6, zero, 765
                  ori          s7, s11, 887
                  fclass.s     s10, ft7
                  fmul.s       fs7, fs0, fs3, rup
                  andi         a6, a1, 826
                  xori         a7, t3, 994
                  div          t2, a1, s2
                  divu         t3, gp, a0
                  fsgnj.s      fs1, ft4, fa7
                  fsgnjn.s     fs1, fs0, ft9
                  mulh         t3, zero, s4
                  and          s0, t3, a2
                  slt          s4, t6, s4
                  xor          zero, a3, t5
                  fcvt.w.s     s9, ft6, rdn
                  srl          sp, s10, t6
                  fmv.x.w      t4, fs10
                  srai         a6, a1, 12
                  lui          a2, 508939
                  divu         ra, s9, t3
                  xor          s10, a3, a4
                  rem          t4, s8, s3
                  sra          a0, s1, s1
                  sub          a7, a3, t2
                  or           sp, sp, t3
                  or           s1, a5, s1
                  sll          s6, tp, a7
                  fmv.x.w      s1, ft4
                  ori          s4, ra, 863
                  divu         t3, s2, gp
                  auipc        a7, 460305
                  sltu         a5, a3, s8
                  remu         gp, s5, s8
                  slli         a5, s2, 13
                  divu         a7, t4, s11
                  and          zero, s7, a4
                  xor          s10, t3, a6
                  fcvt.s.w     fa7, t1
                  fmul.s       ft3, fs5, fa6, rmm
                  slt          t4, s5, a1
                  sll          s8, a1, s6
                  fclass.s     a2, fs2
                  feq.s        a3, fa6, ft5
                  slt          s6, s11, s7
                  srli         a6, s11, 20
                  flt.s        t4, fs7, ft0
                  fclass.s     s9, fs7
                  fsqrt.s      ft6, fa2, rne
                  fsgnj.s      ft9, ft7, ft7
                  fcvt.wu.s    s7, fa3, rup
                  divu         s3, sp, s0
                  sub          s6, a7, s3
                  fsub.s       ft10, ft0, fs5
                  mulh         gp, ra, t1
                  mulhu        a2, ra, s8
                  sltu         a4, a0, a6
                  mulhu        s0, zero, s0
                  fdiv.s       fs6, fa7, fs1
                  sltu         a1, a0, a3
                  sra          s10, s1, a0
                  flt.s        s10, ft8, fa1
                  divu         s1, a1, s10
                  srl          sp, t4, a5
                  fcvt.s.w     fa4, a4
                  lui          ra, 1014227
                  slti         a1, s9, -85
                  add          t3, s1, s11
                  lui          s8, 898104
                  remu         s8, s2, s8
                  fcvt.wu.s    tp, ft10
                  nop
                  sra          t0, sp, a2
                  fmul.s       fa7, fs2, ft7, rtz
                  fcvt.s.wu    fa7, a7
                  auipc        s3, 247296
                  remu         s1, s8, t6
                  xori         a2, s10, -145
                  fmin.s       fa3, fa2, ft1
                  ori          a6, s5, 1228
                  or           s1, gp, s0
                  fdiv.s       fs4, fs5, ft5
                  sub          gp, zero, t0
                  fdiv.s       ft6, fs5, fs10, rne
                  andi         t0, a3, -53
                  fsqrt.s      ft2, fs10
                  sltiu        s10, gp, 1035
                  fmax.s       fa1, fa1, ft2
                  lui          t3, 507011
                  nop
                  nop
                  fcvt.wu.s    t0, fa6, rmm
                  fclass.s     sp, fa6
                  fmul.s       ft1, ft5, fs7, rup
                  fcvt.w.s     a4, fs8
                  mulhsu       t2, tp, ra
                  xor          a3, a0, a3
                  fsqrt.s      fs4, fs5, rtz
                  fsub.s       fs7, fa3, ft0, rup
                  srai         t2, s8, 25
                  fcvt.s.wu    ft2, t0, rmm
                  fmul.s       fs2, fs6, ft8
                  and          gp, a2, t5
                  nop
                  fmul.s       fa4, fa2, ft7
                  xori         tp, s10, 1488
                  xor          a0, s10, t6
                  sltu         s1, s1, t6
                  fmin.s       ft3, ft10, ft9
                  xori         s3, ra, 84
                  fmul.s       fs0, ft11, fs10
                  fmv.x.w      s2, fs2
                  addi         s4, s4, -380
                  srl          t0, a5, s2
                  sll          a5, s6, s11
                  and          gp, ra, a4
                  auipc        s1, 195422
                  fsub.s       ft2, fa5, ft3, rne
                  srl          t4, a0, t6
                  srl          t0, s10, s3
                  fadd.s       ft9, fs6, ft7
                  fmv.w.x      fs6, a4
                  mulhu        sp, t6, s9
                  sra          s10, s10, gp
                  sltu         a0, a3, t4
                  auipc        t2, 272252
                  fsgnj.s      fs8, fa5, ft6
                  ori          s4, s5, 1568
                  div          s0, a4, s1
                  fmv.w.x      fs3, t0
                  ori          s9, s7, -177
                  sll          a5, s1, ra
                  addi         a6, s1, 12
                  fle.s        a1, ft11, fs11
                  auipc        a7, 137101
                  fclass.s     s6, fs9
                  divu         a0, t1, a0
                  sll          s7, a7, a1
                  slli         s10, a4, 7
                  auipc        a2, 610789
                  add          s7, a7, a3
                  add          s6, t2, s3
                  sra          a6, s3, s5
                  mul          a6, s11, a0
                  fmv.w.x      ft5, s10
                  fdiv.s       ft9, ft6, fs9, rtz
                  mulh         ra, t6, t6
                  fmax.s       ft11, ft2, fs8
                  sra          s6, s9, zero
                  fsqrt.s      ft5, fs7
                  srai         s0, s1, 2
                  lui          a5, 681796
                  sll          a3, t2, t6
                  fsgnjx.s     fs8, ft0, fs9
                  div          a1, s4, a2
                  fadd.s       ft10, ft2, fa3, rne
                  ori          a2, t1, -1226
                  fmv.x.w      s7, ft11
                  lui          t4, 167797
                  srl          a7, a6, ra
                  fsgnjn.s     fs6, fs3, ft4
                  fdiv.s       fa5, ft6, ft0, rup
                  xor          t0, a7, t4
                  fmv.w.x      fs3, a7
                  addi         s1, a2, -661
                  sltu         zero, s4, gp
                  sub          ra, s9, tp
                  fcvt.w.s     t2, fa6
                  fsgnj.s      ft10, fs5, fs4
                  fadd.s       fs7, ft1, fs11
                  div          s10, s2, s9
                  feq.s        s6, fa5, fs1
                  fsub.s       fs2, fs4, fs9, rdn
                  fsgnjn.s     fa1, ft1, ft6
                  srl          a2, s2, a7
                  fmin.s       ft5, ft5, ft4
                  sub          a0, s5, t6
                  fsgnjx.s     fs11, fs10, fa6
                  mulhsu       t4, a3, s6
                  slti         s2, s8, 636
                  flt.s        a4, ft9, ft11
                  feq.s        t3, ft6, fs11
                  fle.s        s4, ft5, ft1
                  rem          t4, s8, ra
                  fcvt.w.s     s0, fa5, rup
                  addi         a0, t4, 1968
                  feq.s        s10, ft2, fa6
                  fsgnjn.s     fs4, fs1, fs10
                  fdiv.s       fs2, ft11, fs2, rtz
                  xor          a4, tp, s11
                  xor          s3, s1, s3
                  fmul.s       fa1, fa0, fa4, rmm
                  xor          a2, a7, s10
                  or           a2, a6, a2
                  mulhu        s7, s0, t1
                  and          s5, s8, s3
                  ori          tp, tp, -99
                  div          s8, s8, t2
                  srli         a2, s6, 30
                  fle.s        gp, ft7, fs2
                  fsgnj.s      fa6, fs6, fs1
                  fdiv.s       fa4, fa6, ft9
                  lui          a6, 583681
                  mulh         s9, a6, s1
                  sltu         t2, s11, t3
                  fsgnjn.s     fs4, fa7, fa2
                  fmax.s       ft5, fs11, fs1
                  ori          gp, a4, -803
                  slli         s10, t1, 17
                  mulhu        sp, ra, t4
                  or           a5, a0, s0
                  fcvt.wu.s    t1, fa7, rne
                  fmax.s       ft6, fs5, fs0
                  slli         a2, sp, 28
                  fsgnjn.s     ft4, fs7, fs8
                  fcvt.w.s     a5, ft7, rtz
                  auipc        a2, 507339
                  mulh         t1, a1, a1
                  fmv.w.x      fa5, t3
                  rem          t3, ra, sp
                  slli         zero, t0, 25
                  and          a6, s4, t3
                  fsqrt.s      ft1, fs10, rne
                  fclass.s     s7, fs7
                  sll          t3, s6, s3
                  mul          t3, a3, s0
                  div          s8, s1, s9
                  feq.s        s6, ft0, ft9
                  mul          s2, s0, sp
                  fsgnjx.s     ft9, fs6, fa0
                  mul          a3, s6, a0
                  slti         a2, t2, 190
                  sra          a1, s9, t4
                  fcvt.s.wu    fa5, s9, rup
                  fle.s        a3, ft7, fa2
                  sub          s10, a3, t3
                  slt          t3, s5, s2
                  and          t4, t2, s7
                  mulhsu       a6, s5, s8
                  sub          t3, a2, tp
                  slli         t2, s7, 28
                  lui          s6, 364746
                  fsqrt.s      fa4, ft1, rup
                  fcvt.s.w     fa1, tp
                  fcvt.s.wu    ft7, a5
                  flt.s        s5, fs0, ft5
                  rem          s3, t5, s0
                  fmv.w.x      fs11, s7
                  fcvt.wu.s    s8, fa2
                  srli         s9, s2, 25
                  div          s1, t5, a0
                  fmax.s       ft10, fs11, fa2
                  fcvt.wu.s    a5, fa5
                  remu         s4, t4, s6
                  lui          s9, 949243
                  mulhsu       s3, s0, t0
                  fmin.s       ft5, fs8, ft11
                  or           a1, a1, a5
                  mul          gp, s7, t5
                  flt.s        t3, fa4, ft9
                  srl          s4, a4, a5
                  and          t1, t2, s11
                  fadd.s       fa1, fs7, fs4, rup
                  add          t3, s10, s11
                  fcvt.wu.s    s5, ft8, rdn
                  srl          s0, s2, a4
                  fclass.s     s2, ft5
                  auipc        zero, 694055
                  fmax.s       ft7, ft9, ft11
                  or           s0, tp, a3
                  and          s10, t3, a4
                  xori         s1, a7, 1677
                  fsgnjx.s     ft6, fs1, ft11
                  fcvt.s.wu    fa4, s7, rmm
                  andi         s5, a6, -1975
                  fmax.s       ft10, fs0, fa0
                  fmv.x.w      tp, fa3
                  fcvt.w.s     a2, fa6, rmm
                  fsqrt.s      fs9, ft2
                  fsqrt.s      fa1, ft1, rtz
                  flt.s        a6, fs10, ft9
                  add          s7, a4, a7
                  fsgnj.s      fa0, ft8, ft4
                  ori          a7, a2, -1865
                  fcvt.s.w     fs9, s0
                  flt.s        s2, fa3, fa4
                  addi         ra, a4, 909
                  srli         s5, a0, 19
                  slti         a6, t5, 1720
                  fadd.s       fs5, fa6, fs3
                  lui          a3, 545970
                  fmin.s       ft6, ft3, fs11
                  fsgnjn.s     ft8, fs11, fa3
                  fcvt.s.w     fs2, s8
                  fadd.s       ft1, fa3, fa1
                  fdiv.s       fs8, fa1, ft10
                  fmv.w.x      ft9, s5
                  add          a2, s3, t3
                  fsgnjn.s     fs11, ft8, fs6
                  slli         a1, a2, 29
                  or           a0, t1, s7
                  fsgnjx.s     fa2, fs0, ft0
                  xori         a5, t6, 833
                  nop
                  fcvt.wu.s    s3, fa4
                  fcvt.w.s     t1, fs1, rtz
                  slli         t2, s8, 22
                  or           a3, t2, t3
                  fsqrt.s      ft3, fa1
                  slli         t3, a4, 21
                  fsgnjx.s     fs2, ft7, fa0
                  fle.s        a6, fs1, fs10
                  fcvt.s.wu    ft10, tp
                  fcvt.s.wu    fa4, t6
                  nop
                  remu         a0, s4, s6
                  fsqrt.s      fs4, ft3, rmm
                  srai         s8, s8, 20
                  sltiu        gp, a6, 828
                  slli         t0, t3, 3
                  auipc        a0, 524288
                  mulhsu       zero, sp, a5
                  flt.s        s9, fs3, fs4
                  fclass.s     a7, fa0
                  fclass.s     s4, ft4
                  sll          s5, t4, t5
                  fsqrt.s      ft9, fa2
                  xori         s3, t5, 1920
                  xor          s7, s6, s8
                  sltiu        s6, zero, 1293
                  fclass.s     s7, ft0
                  lui          t2, 715279
                  sub          s5, a1, s5
                  slli         a0, t0, 8
                  xor          t2, a7, gp
                  mul          s3, a5, t5
                  fsgnj.s      fa0, fs3, ft5
                  fcvt.s.wu    ft11, a4
                  fclass.s     zero, ft9
                  feq.s        t1, ft7, ft10
                  fdiv.s       ft6, ft10, fa7
                  ori          a6, a1, -1264
                  srai         a6, s9, 30
                  mulhu        a5, t1, a2
                  srai         s3, s3, 5
                  fcvt.w.s     s5, fs1
                  add          s9, a7, a2
                  mulhu        s9, t6, s9
                  fclass.s     t1, ft10
                  fsub.s       ft0, ft11, fs5
                  div          s4, zero, t1
                  srai         gp, t1, 20
                  fmv.w.x      fa7, a4
                  lui          s0, 297815
                  xor          s6, t0, a4
                  fsub.s       fa1, fa0, ft9
                  fle.s        t3, fs11, fs9
                  feq.s        tp, ft7, fs10
                  sltiu        s8, t4, 86
                  fsqrt.s      fa1, fa7
                  fcvt.w.s     tp, fs10, rne
                  fadd.s       fs1, fs4, fs3, rne
                  rem          zero, a1, t1
                  slti         s7, s6, 2026
                  srai         t3, t0, 28
                  fclass.s     a6, fs1
                  fcvt.wu.s    s4, ft10
                  mul          s3, s5, s11
                  fcvt.s.w     fs3, t3, rup
                  flt.s        a2, fs5, ft3
                  fdiv.s       fs1, fs5, fa7
                  fcvt.s.wu    fs7, s6
                  sll          sp, s2, zero
                  fcvt.s.w     ft4, gp
                  sll          a5, a7, t6
                  fcvt.s.w     fa4, a6
                  srl          tp, a1, t0
                  lui          s3, 579215
                  slti         s10, s4, 2005
                  fsgnjx.s     fs3, ft6, ft5
                  addi         a2, a4, 894
                  remu         s7, a6, gp
                  div          zero, a5, s1
                  remu         s10, t0, t6
                  fsub.s       fs11, ft8, fa2
                  fmul.s       fs8, ft4, fs4
                  div          t4, s3, a6
                  fadd.s       ft11, ft0, fs1, rtz
                  mul          s2, t6, a3
                  sub          a5, a5, t0
                  srai         s7, t1, 3
                  srl          t1, s7, s7
                  sll          t4, s9, t5
                  fcvt.wu.s    gp, fa0, rmm
                  add          t4, s5, s7
                  srl          s9, s5, sp
                  slli         a1, tp, 11
                  fsgnjn.s     ft0, fs3, fs9
                  fsgnjx.s     ft9, ft2, fa1
                  fclass.s     s9, fs4
                  ori          a2, s10, -1585
                  rem          t4, t2, s6
                  fmin.s       fa5, fs2, ft8
                  fsub.s       fs10, fa3, ft8, rtz
                  andi         s9, s4, 317
                  fsqrt.s      fa3, fa2, rdn
                  fsgnjx.s     fs3, fa0, fa1
                  srai         s3, a6, 25
                  slti         a1, s1, 1943
                  andi         sp, s3, -1006
                  divu         t2, t5, s6
                  fle.s        zero, ft0, fa7
                  srli         s5, a5, 25
                  div          t4, s7, s5
                  fmax.s       ft4, ft2, ft6
                  or           a0, t1, s9
                  feq.s        s2, ft6, ft10
                  flt.s        sp, fa4, ft5
                  fmax.s       ft10, ft2, ft10
                  divu         tp, gp, t0
                  srl          gp, t6, s2
                  srl          a2, s0, ra
                  feq.s        s9, ft5, fs9
                  or           ra, s3, a0
                  fsgnj.s      fs11, fa0, ft0
                  mulh         t2, t5, ra
                  fclass.s     t2, fa7
                  and          t2, t4, t6
                  sub          t2, s7, s9
                  fsqrt.s      fa6, ft4
                  mulhsu       a6, gp, a2
                  slli         t3, s4, 25
                  sra          s9, t2, t1
                  slt          ra, s11, s10
                  slt          a4, t4, s10
                  fle.s        sp, ft2, ft7
                  fsgnjx.s     fs9, ft8, ft9
                  slti         zero, t0, 1769
                  mul          s6, s9, a3
                  xori         a7, tp, -1957
                  slt          s9, t2, s3
                  div          a0, t3, zero
                  xori         a6, s0, -59
                  slt          s5, ra, a5
                  remu         s2, t5, t3
                  fmv.w.x      ft6, tp
                  divu         zero, a1, a0
                  addi         t2, s6, -1977
                  sltiu        ra, s2, 158
                  fsgnjx.s     fa2, ft10, fs5
                  fcvt.w.s     a1, fs3, rup
                  andi         tp, s11, 927
                  fcvt.s.w     fs6, t5, rtz
                  srai         a7, a5, 4
                  slti         s2, t2, 1423
                  srl          s1, sp, s11
                  fsgnjx.s     ft9, fa4, ft5
                  mulhu        s1, a5, t6
                  mul          s5, s8, t3
                  sub          t1, s7, t1
                  fcvt.s.w     ft0, s6
                  fle.s        a6, fs6, fs5
                  fmv.w.x      ft1, s9
                  fsgnjx.s     ft0, ft6, ft8
                  rem          t1, s2, s1
                  fcvt.wu.s    ra, fa1
                  fsgnjn.s     ft8, fa3, fa2
                  sra          t4, a4, t3
                  sltu         t4, tp, ra
                  fclass.s     t0, ft2
                  slli         sp, s2, 16
                  fsgnjx.s     ft10, fs1, fs6
                  fsgnj.s      fs5, fa5, ft0
                  remu         a6, s7, s2
                  sra          s8, s2, s9
                  addi         a6, s2, 1924
                  andi         s5, a2, -456
                  rem          t1, t5, s5
                  slti         a5, t3, 393
                  fmul.s       fs10, fs11, ft5
                  remu         tp, a2, ra
                  ori          zero, a7, -1791
                  fsqrt.s      ft5, fs3, rmm
                  srli         s8, s5, 3
                  fle.s        s6, fs3, fs9
                  fcvt.s.wu    ft10, a2, rmm
                  divu         t3, a2, s11
                  auipc        s10, 513104
                  andi         ra, a5, -471
                  mul          s0, s9, s11
                  mul          a2, a1, t1
                  fsgnj.s      ft3, fs10, ft0
                  xor          t0, s2, a7
                  fdiv.s       fs11, fa6, fs2
                  rem          t3, a0, zero
                  mulhsu       s6, a1, a0
                  fmv.x.w      s3, fs7
                  add          sp, s11, s3
                  feq.s        a4, fs7, fs0
                  ori          s9, s2, -292
                  sra          a2, s0, a3
                  fdiv.s       ft8, fa6, ft8, rdn
                  divu         s10, s7, s5
                  fmin.s       ft9, ft10, fa2
                  fsgnjn.s     ft0, fs4, ft9
                  addi         a1, a4, -969
                  and          s0, t4, sp
                  fmax.s       fs7, ft4, ft9
                  andi         a4, s6, -853
                  fmv.w.x      fa2, s6
                  fmul.s       ft2, fa4, fs3, rtz
                  fsub.s       ft7, ft4, fa4
                  and          zero, sp, sp
                  or           s7, a5, s6
                  nop
                  addi         tp, a2, 1813
                  fcvt.w.s     a2, ft5, rtz
                  div          a3, s9, a3
                  srl          s10, a6, t6
                  fle.s        s0, ft5, fs3
                  mul          a4, sp, s4
                  slt          s3, a0, tp
                  mulhu        a5, t6, t5
                  fsub.s       fs10, ft5, fa5, rtz
                  rem          a3, a5, a0
                  nop
                  slti         a2, s2, 191
                  sub          a1, s8, a1
                  fcvt.wu.s    sp, fs0, rne
                  srl          s5, a4, s0
                  slli         a6, t4, 30
                  add          s7, s2, t6
                  fcvt.s.wu    fs4, s5, rtz
                  srl          zero, s8, s8
                  mulh         t3, a0, tp
                  fmv.w.x      fs1, s4
                  and          s4, a4, s4
                  addi         s9, t0, -926
                  mulh         a7, s1, s0
                  sra          s7, a2, s5
                  slli         s9, s3, 27
                  addi         tp, t6, 862
                  fcvt.s.w     fs4, s3, rmm
                  fcvt.w.s     ra, fa4, rtz
                  rem          a2, t2, t5
                  srl          s2, gp, s8
                  fadd.s       fs5, fa3, fs10, rdn
                  fsub.s       fs2, ft1, fs3
                  sra          a7, zero, a7
                  srli         ra, s0, 0
                  xor          s3, s1, t6
                  mulhsu       s7, a3, a0
                  feq.s        ra, fa3, ft6
                  andi         t1, a3, 501
                  rem          ra, s2, t0
                  fsgnjn.s     fa3, ft0, ft11
                  fclass.s     t2, ft8
                  flt.s        zero, ft4, fa7
                  fsgnjx.s     ft1, ft8, fs5
                  fsqrt.s      fa3, fs7, rne
                  fcvt.w.s     s8, ft2
                  feq.s        s2, fs5, fs0
                  fclass.s     a3, fs9
                  add          s5, s11, t2
                  srai         s0, t3, 18
                  sltu         a3, s7, a4
                  xor          s2, gp, t4
                  sll          a2, t4, sp
                  fdiv.s       fs8, fs1, fs4, rtz
                  srli         s7, s8, 8
                  mulhu        s10, t3, tp
                  slti         a7, a6, 2027
                  andi         a2, a7, 1443
                  slli         a1, s5, 0
                  and          sp, s6, ra
                  divu         s8, s5, t0
                  sll          s7, t1, zero
                  fsgnjx.s     fa2, fs6, ft0
                  lui          tp, 494444
                  sltu         sp, a5, t1
                  fcvt.s.w     fa1, a5
                  xor          s10, s5, zero
                  slt          tp, s5, a1
                  fcvt.s.w     fa7, a0, rne
                  nop
                  flt.s        a1, ft10, ft3
                  fmul.s       fs1, fs6, fa5, rne
                  or           s10, tp, t1
                  fsgnjn.s     fa0, fa0, fs0
                  fsqrt.s      fs7, fa4
                  and          a4, tp, a3
                  sltiu        t2, s10, -1466
                  fdiv.s       fa3, ft5, ft6
                  fcvt.wu.s    s1, fa0
                  andi         gp, a2, 813
                  ori          s8, t0, -588
                  fadd.s       fs10, fs0, fa5, rdn
                  fle.s        s2, ft10, fs4
                  slli         ra, s2, 28
                  fdiv.s       fs4, ft8, ft2
                  sll          s6, a1, a4
                  fsgnj.s      ft8, fa3, fa1
                  fmax.s       fa4, fs9, ft3
                  rem          s1, s9, s4
                  slli         s1, s1, 2
                  xori         a5, s7, 1481
                  xor          tp, t5, t5
                  fmin.s       ft6, fa3, ft0
                  srl          t4, t1, s7
                  andi         t2, s0, 1398
                  srl          s8, gp, s10
                  fadd.s       ft11, fs6, fs10
                  srai         s8, t3, 3
                  srli         t2, t4, 18
                  fmv.w.x      fs10, s3
                  and          a6, a6, s9
                  mulh         s6, s3, s10
                  div          s6, s2, t5
                  fadd.s       fs0, fs5, fa5
                  auipc        s0, 246924
                  lui          s7, 849735
                  addi         a7, s3, -1517
                  fsgnjx.s     fs5, ft8, fa2
                  sra          ra, sp, a0
                  remu         s3, tp, zero
                  flt.s        s3, ft0, fs5
                  sra          s7, t0, s1
                  fcvt.s.w     ft8, s1, rmm
                  fsgnj.s      ft6, fs11, fs1
                  sub          a7, a6, s0
                  fcvt.s.w     ft11, t1, rmm
                  fmin.s       ft7, fs8, ft7
                  fsgnjn.s     fa4, fs9, fs4
                  fclass.s     s4, fa2
                  div          ra, s1, zero
                  sll          sp, s9, tp
                  addi         a7, gp, -1578
                  fcvt.s.wu    fs5, t3, rne
                  slli         ra, a7, 1
                  fadd.s       ft3, fa3, ft1
                  fadd.s       ft11, fa0, ft8
                  mulhsu       s8, s0, s5
                  mulhsu       s8, s11, s2
                  rem          s5, s2, a3
                  fsgnjn.s     ft1, ft11, fa0
                  nop
                  fsgnjx.s     ft6, fa5, fa6
                  auipc        a4, 783173
                  sub          a2, t4, s10
                  sltiu        tp, s3, 1416
                  xor          s10, a6, s1
                  fmv.w.x      fa1, s0
                  add          a0, t4, s7
                  sltu         a3, t5, ra
                  fcvt.s.w     fs8, tp, rdn
                  xor          tp, a3, s1
                  fmv.x.w      s9, fs1
                  fmul.s       ft9, ft4, fs8, rup
                  fsgnjn.s     fs4, fa6, fs8
                  addi         a4, ra, -1376
                  and          sp, s9, s11
                  fmv.x.w      s7, fs0
                  lui          a6, 73894
                  fmul.s       fs8, ft0, ft5, rup
                  slli         zero, sp, 22
                  mul          ra, a0, a2
                  sltu         a5, s7, s9
                  mulhsu       a7, gp, s0
                  srai         s0, t0, 16
                  mulhsu       a7, t3, s10
                  sltu         a1, a7, t5
                  feq.s        s0, fs0, fa1
                  ori          a0, zero, -1888
                  slli         s1, s7, 11
                  mulhu        a4, t2, zero
                  fmv.w.x      fa3, a5
                  feq.s        tp, fa4, ft10
                  xori         a0, s2, 1796
                  mulhsu       a5, a3, a5
                  auipc        s10, 850790
                  fsgnjn.s     fs9, ft6, ft9
                  mulhu        t4, s10, sp
                  nop
                  nop
                  lui          s5, 668590
                  slti         a7, s7, -1744
                  mulhsu       s0, t6, a7
                  sub          s3, s9, tp
                  fsub.s       fa0, ft1, fs4
                  slt          a3, t5, a1
                  fle.s        s1, ft0, fa3
                  div          t4, a2, s0
                  fsgnjx.s     ft2, ft11, ft3
                  fmv.w.x      fa4, t2
                  xor          t3, t5, s2
                  andi         s1, a1, 400
                  slt          s4, s8, a1
                  slti         a7, a6, 1058
                  fmv.w.x      fs11, a7
                  fsqrt.s      fa2, fs2, rmm
                  fsub.s       ft7, ft5, fs7, rup
                  mulhsu       a7, t6, a4
                  fcvt.wu.s    gp, ft8, rup
                  mulhu        s0, a5, t0
                  and          t1, s6, s1
                  fmul.s       fs8, fa6, fs3
                  slti         s9, a5, -2030
                  rem          gp, t2, a7
                  ori          s3, t0, -1059
                  srl          a1, a0, s7
                  fcvt.s.w     ft4, t4
                  fsgnjx.s     fa0, fs10, ft10
                  auipc        a7, 829213
                  fsgnjn.s     fa0, fa5, fa7
                  srl          s7, s0, s8
                  xor          a5, s7, zero
                  fle.s        a3, fs4, fs2
                  fsub.s       fa1, ft9, fa4, rne
                  mulhsu       a2, s2, t2
                  add          s8, a5, s2
                  div          s8, s1, s10
                  fcvt.wu.s    s0, fs1, rdn
                  fsqrt.s      fa2, fs4, rtz
                  srl          s8, t5, t4
                  fadd.s       fs3, fs10, ft0
                  slti         s3, s1, 406
                  addi         a2, a4, 1382
                  fclass.s     a5, fa7
                  nop
                  srai         zero, a5, 11
                  mulhsu       s5, s0, t5
                  sll          a1, a5, s10
                  addi         a5, sp, 1784
                  auipc        s4, 263271
                  andi         s7, t6, -44
                  sltiu        s8, a7, -929
                  fmv.w.x      fa5, s0
                  fmin.s       ft1, fs11, fs6
                  mul          s5, t2, t5
                  srai         ra, t0, 21
                  fsub.s       ft3, ft10, fs3, rup
                  flt.s        t1, fa5, fa4
                  srai         t0, a6, 0
                  feq.s        s1, ft5, fs10
                  mulh         s8, t5, s10
                  fle.s        s10, ft6, ft1
                  slti         a2, a6, -1632
                  divu         a6, a2, ra
                  fadd.s       fs2, fa5, ft11
                  div          t2, a6, zero
                  xori         a1, s2, -1660
                  sltiu        a3, sp, -1081
                  srl          a0, s1, t0
                  fmv.w.x      ft4, a0
                  xori         t4, gp, -884
                  and          a2, a7, s3
                  and          s0, a7, s9
                  nop
                  sll          a1, s4, s6
                  fadd.s       ft2, ft0, ft11
                  sub          s5, a5, a4
                  fmv.w.x      ft1, a2
                  slli         gp, s9, 24
                  sltu         s1, s9, s9
                  ori          ra, ra, 1150
                  fadd.s       fs0, ft1, ft0, rtz
                  fcvt.w.s     a5, ft4, rmm
                  divu         a4, a1, a3
                  auipc        t0, 222362
                  nop
                  and          zero, s8, s3
                  fmv.x.w      s6, fa1
                  slti         gp, ra, 1146
                  sltu         a1, a4, zero
                  sub          sp, s0, a6
                  fle.s        s4, fs1, ft3
                  slli         t2, a4, 2
                  divu         s4, s11, a6
                  or           t0, a3, sp
                  sub          a0, zero, a3
                  sra          t2, t3, s1
                  remu         t0, zero, s5
                  addi         t4, a7, 1709
                  ori          a0, s8, 1105
                  mulhsu       t3, s9, s4
                  nop
                  srai         a1, s8, 7
                  sub          sp, s3, zero
                  fsgnjx.s     fa6, fa2, fs7
                  div          t3, s9, s9
                  lui          s9, 163274
                  fmax.s       ft1, fa6, ft4
                  remu         t4, t4, a7
                  fcvt.wu.s    a1, ft10, rdn
                  fcvt.s.w     fs6, s10
                  fmv.x.w      ra, ft9
                  mul          zero, t2, t5
                  lui          zero, 913888
                  add          s5, s1, s11
                  andi         a0, a4, 192
                  mul          a0, a2, sp
                  rem          tp, t5, s5
                  nop
                  feq.s        a3, fs8, fa5
                  ori          sp, a3, 1004
                  sra          s8, t5, s8
                  fadd.s       fa6, fs6, ft0, rmm
                  mulhu        a7, gp, a2
                  sltiu        ra, s0, -681
                  mulhu        t3, a1, a4
                  fdiv.s       ft3, fs9, fa7, rdn
                  fle.s        a5, ft9, fa0
                  addi         a6, t6, 1173
                  lui          s4, 327442
                  and          s2, t3, t6
                  fmul.s       ft4, ft11, ft0
                  mulhu        zero, a3, s6
                  fmv.w.x      ft2, t6
                  addi         s7, t5, -182
                  srl          t3, t0, s0
                  fcvt.s.w     fs3, tp, rne
                  mulhu        s8, s3, t6
                  rem          s10, t2, t5
                  fcvt.wu.s    s10, fa1, rtz
                  fsgnjx.s     ft8, fs3, fs2
                  fsgnjx.s     fs11, fa4, fs5
                  fmin.s       ft11, ft9, ft7
                  remu         a6, a5, s8
                  srl          s1, s11, s3
                  mul          a4, s6, s11
                  slti         s6, gp, 888
                  sll          s8, a7, s7
                  slt          a0, s9, s5
                  divu         a7, t4, t6
                  fsgnj.s      ft10, fs5, fs4
                  slti         a3, s10, -912
                  srli         a6, t2, 14
                  fadd.s       ft3, ft10, ft2, rne
                  sub          s4, t4, tp
                  sltiu        a0, s11, 910
                  feq.s        t2, ft2, fs8
                  sltiu        sp, s0, -1603
                  slli         s2, a5, 7
                  fmax.s       fs8, fs0, fs6
                  xori         s1, s1, 631
                  srl          s3, a7, t6
                  fmax.s       fs2, ft4, fs0
                  mul          zero, sp, s2
                  divu         a7, a3, s1
                  sub          tp, s10, s7
                  sll          s3, a7, s9
                  fsgnjn.s     ft1, ft5, fa5
                  srai         tp, t0, 31
                  mulh         t2, s10, t1
                  srai         a0, s1, 25
                  nop
                  mul          t1, t6, ra
                  and          gp, ra, a6
                  srl          s5, tp, a2
                  remu         gp, ra, s3
                  slt          s4, tp, t5
                  fcvt.s.wu    fs0, gp, rup
                  mul          a3, a4, t1
                  mulhu        s3, a4, s8
                  add          s6, t4, s1
                  mul          t2, zero, s0
                  sltu         ra, s7, s6
                  fmul.s       fs1, ft2, fa5, rtz
                  fmax.s       ft9, fs9, fs3
                  sltu         a5, t5, s1
                  sub          t0, t6, zero
                  srl          a4, t6, s7
                  andi         s2, s0, 710
                  fdiv.s       fs6, fa6, fa5, rne
                  slt          t1, s11, s6
                  sub          s0, s6, a4
                  sra          t3, t3, s2
                  sltu         s2, s7, s1
                  feq.s        s10, ft10, fa7
                  sltu         gp, t3, s2
                  slli         a4, gp, 20
                  slli         tp, a6, 14
                  andi         a4, a4, 1696
                  fcvt.s.w     fs1, s1, rmm
                  fle.s        s10, ft10, fa6
                  fsub.s       fs3, fs8, fs2, rdn
                  slli         ra, ra, 12
                  fmin.s       fs0, fa5, ft9
                  srli         a6, t4, 6
                  fclass.s     t0, fs11
                  srli         t0, s5, 9
                  sltiu        s5, t1, 1740
                  remu         t3, gp, a6
                  fcvt.s.w     fs1, a7
                  sltu         zero, t0, s7
                  flt.s        a3, fa1, ft1
                  fsgnjx.s     fa2, fs0, ft3
                  sra          a2, s6, s8
                  fcvt.s.wu    ft10, zero, rne
                  fsqrt.s      fa4, ft11, rmm
                  xor          s5, s0, s5
                  srl          t1, t5, t5
                  sltiu        t3, tp, 1284
                  lui          a2, 914925
                  flt.s        s6, fa3, fs6
                  fsqrt.s      ft7, ft1, rdn
                  and          s8, s9, ra
                  flt.s        s8, fs5, ft1
                  fsgnjn.s     fs11, ft8, ft11
                  fsgnj.s      fs0, ft5, fs4
                  fsgnjx.s     fs5, fs3, fs1
                  sltiu        s10, t6, 296
                  fmin.s       fs4, fa4, fa4
                  feq.s        s4, fa4, fs0
                  fsgnj.s      fa1, fs2, fs10
                  fle.s        s6, fs10, ft5
                  div          s7, t4, s5
                  and          a3, t1, a7
                  fsgnjn.s     ft2, fs11, fs4
                  fmv.w.x      ft9, gp
                  fcvt.w.s     a3, fs3
                  mulh         s5, s11, tp
                  or           a1, sp, a5
                  sltu         s7, t5, t6
                  sub          a0, a3, s3
                  xori         sp, a7, -1214
                  xori         a6, t1, -1935
                  addi         a2, t2, -644
                  sltiu        a0, t3, 353
                  fcvt.w.s     ra, fa5
                  fclass.s     a7, fs8
                  srl          ra, s3, t4
                  or           zero, s3, ra
                  slli         a7, s2, 13
                  fdiv.s       fa7, fa2, ft9
                  srli         a4, a0, 6
                  sltiu        a3, s8, 1589
                  xori         s3, zero, 74
                  mul          t3, gp, a3
                  and          a6, s11, a3
                  nop
                  slt          zero, s0, a3
                  sltu         t0, s8, s2
                  fle.s        tp, fs0, fa2
                  flt.s        t2, fa7, fs2
                  fsqrt.s      fa7, fa4
                  auipc        zero, 117312
                  slt          a1, s0, t4
                  sub          s9, t4, s4
                  sra          s10, t4, sp
                  srl          a3, t1, s0
                  lui          a0, 228348
                  fmax.s       fs0, ft11, ft8
                  fsub.s       fs11, fs2, ft4
                  sltiu        s1, a6, 1014
                  sltiu        a5, s7, 223
                  srli         a0, s9, 3
                  fsgnjn.s     fs9, fs11, fa2
                  rem          s1, a2, s1
                  fdiv.s       fs0, fs2, ft8, rmm
                  ori          a2, a2, 1547
                  fsub.s       ft0, fs4, ft11, rmm
                  sll          s7, gp, t1
                  mulhu        ra, s1, a0
                  slli         a3, t2, 23
                  fcvt.w.s     s1, fa3, rne
                  mul          a6, t2, s7
                  fsqrt.s      fa2, fs1, rmm
                  fmax.s       ft6, ft4, fs3
                  mul          t2, s9, s4
                  xor          t2, t2, s4
                  fadd.s       fa3, ft10, ft0, rmm
                  fcvt.s.wu    fs0, t3
                  fmv.x.w      a3, fa1
                  fsqrt.s      ft10, ft0
                  mulhsu       s2, s8, s0
                  fcvt.wu.s    a6, fa4
                  sltu         ra, ra, a4
                  slli         t0, a0, 21
                  or           a0, t5, sp
                  fsgnjn.s     fs11, fa4, ft9
                  ori          zero, s6, 1600
                  srli         s3, s8, 14
                  auipc        t2, 74763
                  slt          zero, t2, t2
                  srli         ra, a4, 1
                  fcvt.s.w     ft2, a7, rup
                  fmax.s       ft4, ft0, fs3
                  remu         t1, s3, zero
                  nop
                  mul          ra, s4, sp
                  fsgnjx.s     fa4, fs7, fs1
                  sll          gp, s2, s3
                  fcvt.w.s     s7, fs7
                  div          ra, a3, sp
                  fclass.s     t2, fs8
                  fcvt.wu.s    a1, ft2
                  fclass.s     s0, fs6
                  feq.s        t2, ft5, fs0
                  fsgnjn.s     fa4, fs6, fa2
                  andi         s4, s4, -793
                  fcvt.w.s     t0, ft1
                  srl          s3, a4, s9
                  mulhsu       a1, s1, ra
                  auipc        s9, 564800
                  fsqrt.s      ft0, ft10
                  fsgnj.s      ft1, fs7, ft4
                  sltu         s3, a3, s7
                  or           a1, a0, a1
                  fcvt.w.s     zero, fa5
                  or           t3, a4, s11
                  fmv.w.x      fa3, s4
                  xor          a7, s5, s9
                  remu         t4, t3, s9
                  fcvt.wu.s    s6, ft5
                  sll          a6, zero, t3
                  ori          s1, a5, -585
                  sub          tp, s6, s6
                  fclass.s     a2, fs4
                  fclass.s     s4, fs8
                  mul          s7, s5, s6
                  sltu         tp, s4, s8
                  fsqrt.s      fs1, fs10
                  fcvt.wu.s    a7, ft7, rmm
                  slti         s1, s6, -99
                  div          a3, s1, t6
                  sub          s0, a6, s5
                  mulh         s0, tp, s2
                  srli         a2, s5, 27
                  fcvt.wu.s    a0, fs3, rtz
                  nop
                  nop
                  rem          ra, s6, ra
                  fcvt.wu.s    ra, fs4
                  divu         a4, a3, a0
                  sra          s0, t3, t0
                  sra          a6, s9, t5
                  sltu         t0, s5, s7
                  andi         s5, zero, 1208
                  fmul.s       ft2, fs7, fa1, rup
                  fmul.s       fa3, fs4, ft6, rne
                  div          a2, s3, zero
                  mulhu        s6, s6, s8
                  fsqrt.s      fs2, fs1, rtz
                  sltu         s3, gp, s11
                  srl          t3, s5, s7
                  lui          zero, 946097
                  lui          a1, 914999
                  mulh         ra, s8, s6
                  fdiv.s       fs9, fs1, fs9, rtz
                  srli         s4, a0, 14
                  sra          s7, s9, t2
                  andi         s3, a0, 17
                  add          t3, a7, t2
                  fmax.s       ft3, fs9, ft0
                  rem          s10, s5, t2
                  sra          s3, s2, s2
                  slli         ra, a6, 21
                  srli         a2, zero, 27
                  sltu         ra, s10, t0
                  sra          s10, sp, a2
                  fsgnj.s      ft11, ft7, fs3
                  ori          a4, t0, 276
                  fmv.x.w      s7, fs11
                  fsqrt.s      fs9, fs6, rdn
                  sra          s7, s6, s6
                  fmv.w.x      fs5, a0
                  slti         s6, t5, -644
                  fadd.s       fs4, ft10, fs5, rtz
                  fcvt.w.s     s7, fs0, rne
                  mul          t3, t5, t5
                  feq.s        s3, ft10, fa5
                  remu         a6, s7, a7
                  mul          zero, s2, s6
                  fcvt.s.wu    fa3, zero, rne
                  flt.s        a1, fs11, fs7
                  fmin.s       ft6, fa4, ft6
                  fcvt.wu.s    s6, ft4, rtz
                  fdiv.s       ft4, fs3, fa6, rne
                  xori         s5, t0, -1959
                  ori          a3, s0, -1702
                  slt          a2, a6, t4
                  fsgnjn.s     fa4, ft2, fs3
                  srl          a1, t5, s9
                  fclass.s     zero, ft0
                  lui          s4, 672975
                  sub          t2, a6, a5
                  fsgnjx.s     fs8, fa4, fa7
                  xori         gp, t2, -307
                  fmv.x.w      s3, ft10
                  fle.s        gp, fa5, fa6
                  fadd.s       fa5, fs4, fs4
                  fsub.s       fs10, fa0, ft9, rne
                  fsub.s       ft5, fs5, fs3, rne
                  srai         s7, s1, 23
                  fmax.s       fa6, ft9, ft11
                  fcvt.w.s     a2, fa5
                  sltiu        t3, a7, 1254
                  fcvt.s.w     ft3, t6
                  slt          s7, zero, s5
                  auipc        s8, 628618
                  fcvt.s.wu    fa4, ra
                  andi         s5, s0, 1087
                  mul          tp, t4, tp
                  fmin.s       fs2, fs6, fa1
                  slti         tp, t4, 1964
                  sub          s3, t5, s4
                  srli         t1, s10, 1
                  rem          zero, s10, a0
                  flt.s        s0, fs7, fa7
                  nop
                  fadd.s       fs7, fs3, fs5, rtz
                  slt          s6, s2, s2
                  slti         a4, t3, -442
                  sra          s9, t5, tp
                  xor          s9, s10, ra
                  sra          s8, a1, ra
                  fmv.w.x      fs8, s0
                  fmv.w.x      fs1, a2
                  mulhsu       t0, t3, s4
                  xor          s2, s4, a6
                  div          s7, s3, s4
                  fcvt.wu.s    t2, ft6, rne
                  fadd.s       ft8, fa7, ft8, rne
                  fle.s        s7, fs9, ft11
                  and          s1, t2, t1
                  add          a4, s0, a1
                  div          t0, gp, tp
                  mulh         s3, a2, t4
                  sub          a3, s3, t3
                  fmul.s       ft9, fa2, ft9
                  mulh         a6, a1, a7
                  div          a4, s6, zero
                  fmv.w.x      ft9, a6
                  sll          s6, a4, t1
                  fmv.w.x      fa2, a1
                  andi         s3, a6, -1107
                  fmax.s       fs7, fs4, fa3
                  fsgnj.s      ft10, fs9, fa7
                  andi         s3, sp, 1873
                  fsgnjx.s     fs11, fs9, ft8
                  andi         s4, gp, 281
                  divu         a3, t0, s9
                  xori         s0, s0, -693
                  sltu         t0, sp, zero
                  fclass.s     a2, fs10
                  fsgnjn.s     fs1, ft3, ft8
                  slt          s9, a2, s11
                  fle.s        tp, fa5, fa5
                  slti         a3, ra, -1549
                  fdiv.s       fa5, fa1, fa2, rmm
                  mulh         a2, t1, t4
                  div          s1, s1, s0
                  divu         t0, a6, s7
                  fsgnjn.s     fs8, fa6, fs11
                  flt.s        s10, fs8, fa7
                  fcvt.s.wu    ft3, t4
                  fdiv.s       fs5, fa7, fs10, rup
                  fmin.s       ft3, ft5, fs7
                  nop
                  sll          t1, s11, s0
                  fdiv.s       fa6, fs11, fs4
                  fsqrt.s      ft7, ft6, rup
                  mulh         tp, s3, s11
                  sub          s5, s2, a4
                  rem          s1, t5, s4
                  add          s5, tp, ra
                  fle.s        s10, ft2, ft5
                  mulh         a2, zero, s2
                  slt          a3, zero, s5
                  sltiu        gp, gp, -1387
                  slli         tp, t5, 22
                  remu         t4, a2, s11
                  div          t4, a1, zero
                  nop
                  auipc        t3, 586773
                  add          s4, tp, s1
                  sra          a5, zero, a0
                  auipc        s4, 821031
                  fdiv.s       fs11, fa5, fs3
                  fcvt.w.s     s7, fs5, rtz
                  xor          gp, t2, a2
                  sll          ra, t2, s9
                  mul          t2, s2, ra
                  fsub.s       fa7, fa4, ft2
                  fmv.x.w      s4, fs4
                  div          s3, t1, a2
                  remu         a1, a3, tp
                  remu         s6, s7, s4
                  or           s7, tp, s5
                  fle.s        s7, fs0, ft6
                  xor          t3, s9, s8
                  fmul.s       fs7, fs9, fs8, rup
                  fsgnj.s      fa6, fa6, fs11
                  fle.s        ra, fs8, fa4
                  and          t0, t2, s3
                  mulhsu       sp, tp, a0
                  add          t0, zero, a5
                  andi         tp, s10, 938
                  sltu         a7, t6, s10
                  auipc        a6, 61159
                  mulhsu       a4, a0, s5
                  srl          gp, tp, t3
                  sra          a2, s11, s0
                  mulhu        s8, tp, a6
                  divu         a5, s11, t3
                  mulhsu       s8, s9, s8
                  sra          tp, s7, t0
                  add          tp, ra, zero
                  nop
                  fmv.w.x      ft9, a1
                  auipc        s5, 947698
                  fsqrt.s      ft7, ft4, rmm
                  fmax.s       ft3, ft11, ft10
                  sltu         a6, s3, s3
                  remu         a3, t5, t0
                  fmax.s       ft9, fa6, fa5
                  fsgnjn.s     ft1, ft6, fa5
                  fmax.s       fs2, fs11, ft1
                  fmv.w.x      fa7, tp
                  div          s2, t5, sp
                  fsub.s       fa4, ft11, ft0, rmm
                  and          a6, a6, a3
                  fclass.s     a4, fs11
                  fmv.w.x      fs11, s6
                  mul          t3, s1, a4
                  mul          s5, a5, s0
                  srl          a3, s2, t4
                  sll          a0, a7, t0
                  remu         zero, gp, s11
                  srl          s7, a1, ra
                  mulhu        ra, s6, t3
                  fmul.s       fa0, fs1, fs10, rdn
                  xor          t4, s0, gp
                  rem          s0, s8, s5
                  sll          zero, s0, s8
                  addi         a0, a1, 1855
                  fcvt.s.wu    ft3, t2
                  fsqrt.s      ft10, fa6
                  mulhu        a1, s7, a3
                  remu         a7, t0, ra
                  fcvt.s.w     fa1, s4, rne
                  addi         t2, tp, -1770
                  fsgnjx.s     fs8, ft7, ft7
                  xor          s5, a4, s9
                  sltu         a5, a5, a1
                  fsub.s       fs3, fa6, ft5, rup
                  fdiv.s       fs5, fs7, fs3, rtz
                  fsgnjn.s     fa4, fs5, fs6
                  slti         a3, t3, -1845
                  and          zero, s2, t4
                  rem          a5, s10, t2
                  srli         gp, s1, 29
                  flt.s        s9, fs0, fs9
                  xor          a7, s5, s2
                  or           ra, t4, a1
                  mulhu        s7, s11, a4
                  fmv.x.w      gp, fs2
                  slti         zero, s0, 1295
                  fsub.s       ft0, fa0, fa7, rup
                  sltu         a1, a2, s3
                  slt          t3, s8, s7
                  fcvt.s.wu    fs1, t2, rne
                  rem          s7, t2, a6
                  mul          a1, s7, a0
                  sra          s5, a1, sp
                  sll          t3, t6, a0
                  fsgnjn.s     fa3, ft5, fs6
                  sub          t2, t5, s7
                  mulhsu       tp, t6, s1
                  fclass.s     t1, fs4
                  srai         s5, t6, 0
                  div          a5, t4, s0
                  fmul.s       fs6, ft2, fs3
                  fmv.x.w      a2, ft1
                  andi         t3, t6, -1991
                  sub          s7, a2, gp
                  fcvt.w.s     a3, ft2
                  mul          s10, gp, t6
                  fmin.s       ft5, fs6, ft5
                  and          s2, s10, a6
                  sltiu        a2, t3, 87
                  and          a4, t3, zero
                  addi         s0, a5, -1981
                  fcvt.s.w     fa2, a0
                  ori          s1, a6, -1896
                  xor          t2, s5, s10
                  fadd.s       fa7, ft8, ft5, rdn
                  fcvt.w.s     a0, fs9, rmm
                  and          t2, tp, s11
                  xori         a7, s5, 1230
                  fclass.s     a6, ft6
                  ori          s9, s8, -1345
                  andi         t3, t2, -1645
                  xori         t2, t0, 1631
                  mulhsu       s9, a2, s9
                  fcvt.wu.s    a2, fs5, rne
                  rem          tp, t4, t5
                  and          zero, s11, s2
                  fmul.s       ft7, ft6, fs2, rup
                  sltu         ra, a4, s4
                  fcvt.wu.s    s0, ft11, rmm
                  div          s2, a7, s3
                  and          s7, s2, a6
                  fcvt.s.w     ft4, s6, rne
                  fmv.x.w      t3, fa0
                  or           a3, t1, s5
                  fsgnjx.s     fs9, fs2, ft4
                  andi         a3, a5, -21
                  sll          a6, a3, t3
                  rem          t0, s2, t0
                  fmul.s       fs1, fs1, ft6
                  feq.s        s3, fs7, fa6
                  andi         t3, s4, -134
                  xori         a3, tp, -1995
                  fsqrt.s      ft9, ft6
                  sra          t0, t3, a2
                  sltiu        s3, a2, 359
                  fadd.s       fa2, fs8, fs0, rne
                  fadd.s       ft2, ft3, fa5, rne
                  addi         ra, t5, 1713
                  slli         t4, t3, 26
                  fmv.x.w      s7, fs2
                  fmax.s       ft10, ft11, fa6
                  divu         a7, s1, t6
                  andi         a0, t4, -1720
                  ori          s1, s1, 556
                  srli         s1, s9, 30
                  sra          t1, t0, a2
                  fmax.s       ft2, ft3, fs0
                  fcvt.w.s     s0, fa2, rne
                  andi         s10, gp, 630
                  sltu         t3, s11, s7
                  fcvt.wu.s    zero, ft9
                  fcvt.wu.s    ra, fa5, rdn
                  xor          ra, t0, s1
                  sll          s0, tp, a3
                  flt.s        tp, fa1, fs0
                  fsgnjx.s     fs6, fs10, fa5
                  fle.s        s7, ft6, ft4
                  auipc        s0, 194627
                  add          zero, s11, s10
                  fdiv.s       ft5, ft5, fa3, rmm
                  fmax.s       fs5, fs10, ft8
                  srli         s3, sp, 7
                  fsub.s       fs7, ft0, fa7
                  rem          t2, t1, zero
                  auipc        a6, 538981
                  flt.s        zero, ft8, ft6
                  mulh         s0, t0, a7
                  div          a1, s2, t6
                  fadd.s       ft7, fs0, ft7
                  slt          gp, t4, s1
                  slli         s0, s4, 27
                  sub          a2, a0, s8
                  mulh         a5, s9, sp
                  xor          s10, a3, t2
                  sltiu        a7, s10, 60
                  slti         s4, s1, -489
                  fsgnjn.s     fa1, fs3, ft6
                  fsub.s       fs5, ft2, fa3, rne
                  sltu         a0, tp, t2
                  fmv.w.x      ft6, s1
                  fdiv.s       fs4, fs7, ft2
                  fmin.s       fs10, ft8, ft11
                  add          s5, gp, t6
                  fdiv.s       ft10, fa4, fa1, rtz
                  fsgnjn.s     ft0, ft0, fs3
                  fmul.s       ft2, ft10, fs9, rup
                  fcvt.s.w     fs5, s7
                  fsgnj.s      fa3, fs10, ft0
                  fadd.s       ft2, ft1, fa4, rmm
                  andi         s9, s8, 429
                  fmin.s       ft1, ft10, ft5
                  fsqrt.s      ft7, fs0, rne
                  mulhsu       zero, s8, s9
                  xori         a4, t6, -1095
                  fsgnjn.s     ft4, fa1, ft0
                  sltiu        s2, s10, -851
                  fmax.s       ft4, fa6, ft11
                  or           s10, tp, s2
                  fsqrt.s      ft3, fs8, rtz
                  fdiv.s       fs11, fs10, ft7
                  addi         t2, a5, 675
                  fmul.s       ft1, fa3, ft2
                  add          t2, a2, a7
                  andi         a6, gp, 1731
                  mulhu        s0, a5, t6
                  fsgnjn.s     ft9, fs7, fs11
                  fmv.x.w      a4, fs7
                  nop
                  xor          a4, s2, s10
                  srli         gp, s11, 20
                  fsqrt.s      ft7, fa5
                  fmv.w.x      ft4, a3
                  fcvt.wu.s    a0, fa2
                  flt.s        s9, ft11, fa3
                  xori         sp, s7, -636
                  sub          a7, a5, gp
                  or           a5, s2, t4
                  mulhsu       gp, t0, tp
                  mulh         s1, s9, s9
                  rem          sp, t6, s11
                  sltiu        s4, s7, 1619
                  fmul.s       fs10, ft11, fs3, rne
                  slli         s3, t2, 15
                  fadd.s       fs0, fa6, ft5, rne
                  slti         s4, zero, 2027
                  andi         s0, s6, -981
                  fsgnjn.s     fs5, fs6, fs6
                  fadd.s       fs1, fa2, fs3, rne
                  add          a3, t3, t0
                  slli         s1, s9, 26
                  or           a7, sp, s7
                  fmul.s       fa6, ft1, fa1, rmm
                  div          s0, t4, t0
                  fle.s        a7, ft8, fs3
                  fmul.s       fs7, fa6, fs10
                  srl          s10, s4, t1
                  fmul.s       fs7, fs6, fs6, rtz
                  fle.s        s2, fs3, fs3
                  fcvt.s.w     ft10, s5, rmm
                  remu         gp, s8, a2
                  slli         t1, s1, 19
                  fsub.s       fs7, ft4, ft7
                  sub          a5, a7, s0
                  mulhu        a6, t0, s11
                  sltu         sp, a3, tp
                  lui          s9, 274005
                  slti         tp, s10, 1857
                  fcvt.wu.s    a0, ft8
                  slti         a3, sp, -221
                  ori          a6, t1, 1439
                  andi         sp, a1, -559
                  divu         s9, a1, s3
                  flt.s        a1, ft6, fs7
                  feq.s        ra, fs7, ft5
                  fmv.w.x      fa6, zero
                  auipc        a3, 379923
                  srl          s9, t1, a0
                  mulhu        gp, t1, a5
                  xori         s5, t2, 174
                  div          t1, ra, s11
                  fcvt.s.w     fa2, t1
                  slti         s2, t2, -125
                  mulhsu       s0, t1, t5
                  fclass.s     s7, ft8
                  xori         t1, s7, -121
                  rem          a6, s0, s1
                  sra          a0, t2, tp
                  fmv.w.x      fa6, t2
                  fmax.s       fs10, fs0, fa4
                  fmul.s       fs8, fs2, fs1, rtz
                  addi         s6, t2, -1930
                  sub          s7, s5, a4
                  mulhu        s9, a4, ra
                  slli         s6, t0, 28
                  nop
                  mul          s1, t6, s6
                  xori         a7, t4, 316
                  fmax.s       fs4, fa5, ft0
                  xori         a6, s6, -1349
                  fsgnj.s      fa3, ft10, fa5
                  and          t0, s5, a0
                  nop
                  fclass.s     t2, ft4
                  andi         zero, t0, -149
                  mulhu        zero, t1, s11
                  rem          a1, s2, s2
                  fsgnj.s      fs5, ft11, fs0
                  divu         s10, s6, s7
                  addi         s10, a7, 1997
                  fsgnjn.s     fa1, ft9, ft7
                  mul          t4, s2, s10
                  slti         tp, tp, 1167
                  srai         a2, t1, 19
                  divu         a0, a5, t5
                  xor          s7, gp, t1
                  add          s8, ra, ra
                  fmul.s       fs5, fa4, ft2
                  srl          a5, s3, a0
                  or           a6, a4, ra
                  fsgnjn.s     fs3, fa1, ft11
                  xori         s8, a1, -1474
                  addi         a2, s2, 869
                  fcvt.s.wu    ft9, gp
                  xor          a1, a7, a3
                  or           s0, a4, gp
                  and          a5, s1, t6
                  fcvt.s.wu    ft4, s3
                  or           t0, s10, a1
                  xori         a7, s1, -313
                  fadd.s       fs0, fa3, fs6
                  ori          a1, a0, -1432
                  lui          a4, 62381
                  add          s3, a4, a5
                  fclass.s     a4, ft4
                  sltu         a5, a5, s4
                  sltiu        t0, s0, 686
                  fclass.s     a4, fs4
                  fcvt.s.wu    fs11, t1
                  fle.s        s1, fa4, fs11
                  sltu         s6, zero, t6
                  fsqrt.s      ft5, fs1
                  fsgnj.s      fs4, fa1, ft1
                  fsgnjn.s     fs1, fs8, fs7
                  sra          tp, t1, zero
                  fmv.w.x      fs6, zero
                  sub          a5, a6, a3
                  fmax.s       ft9, fa4, ft6
                  fcvt.wu.s    s8, ft10, rtz
                  or           s2, a3, t3
                  sltiu        s5, s10, -1972
                  rem          s6, a6, t6
                  mulhsu       t1, s8, s8
                  sra          t2, a4, gp
                  rem          a5, s5, t6
                  fsub.s       fs9, fa5, fs9, rtz
                  feq.s        t0, ft5, ft6
                  div          t2, t4, s1
                  fsgnj.s      ft1, fa0, fs1
                  fmv.w.x      fa3, s7
                  sltu         s6, s0, a2
                  mulhsu       s5, s8, a0
                  sub          a0, a2, s2
                  feq.s        t1, fs2, ft9
                  slti         a6, s7, 27
                  fcvt.s.w     ft5, t0, rtz
                  fle.s        a6, ft8, fs1
                  mul          gp, tp, s7
                  mulhsu       s3, s1, s6
                  sltiu        a6, t0, -147
                  divu         s7, s10, t5
                  remu         tp, a1, t0
                  fclass.s     s0, ft3
                  sltu         gp, s0, s6
                  remu         a7, s2, a3
                  srl          s1, a5, a6
                  fclass.s     s2, fs3
                  sltu         t2, s11, a2
                  xor          s1, a5, t5
                  flt.s        ra, ft0, ft5
                  xori         a4, s4, 315
                  rem          a5, s8, zero
                  lui          t1, 244753
                  fle.s        s10, fs7, fs9
                  fadd.s       fs6, fs8, fs0
                  andi         s3, s9, 1046
                  slli         a1, tp, 10
                  ori          s9, a0, -1579
                  srli         gp, t1, 25
                  srl          a5, a1, t0
                  and          s6, s8, t2
                  remu         t4, a7, zero
                  srl          a7, s7, t3
                  fmax.s       ft8, fs11, fs4
                  and          s9, gp, t2
                  fsgnjn.s     fs8, ft0, fs1
                  add          a1, a2, a2
                  fadd.s       fs8, ft2, ft4, rdn
                  fcvt.w.s     zero, ft8
                  sltu         t3, sp, a2
                  fsub.s       ft10, fs0, fa4, rne
                  fmv.w.x      fs7, s0
                  fsgnj.s      fs2, fs9, ft11
                  sra          s4, s7, s2
                  sra          s8, a4, tp
                  srai         a2, s5, 6
                  srl          sp, tp, s1
                  fcvt.w.s     s5, fa7
                  mulhu        s10, s7, s2
                  mulhu        s9, s7, s8
                  lui          t2, 967446
                  fsub.s       ft2, ft11, fa3, rtz
                  remu         s7, t3, s3
                  remu         a7, gp, s2
                  auipc        t2, 574306
                  fmv.x.w      ra, ft11
                  fmv.w.x      ft0, t6
                  fcvt.s.w     ft2, t1, rtz
                  fsub.s       fa0, ft7, ft3
                  srai         s6, ra, 29
                  fsgnj.s      fs1, fs9, ft1
                  fle.s        s7, ft4, fs0
                  fcvt.s.w     fa1, s4, rdn
                  xor          a1, s1, ra
                  fcvt.w.s     s6, fs2, rup
                  lui          tp, 588438
                  fcvt.wu.s    s4, ft1
                  fdiv.s       fa2, ft5, fs8
                  sub          s7, s10, t1
                  xori         t3, a7, -666
                  div          a0, a1, tp
                  sll          s3, s9, a7
                  fsgnjx.s     fs10, fa7, fs1
                  and          s9, s0, gp
                  nop
                  mul          s3, s10, ra
                  fclass.s     a2, ft3
                  fsgnjn.s     ft11, fa3, ft6
                  sra          a5, t1, s10
                  mulhu        a1, s2, t1
                  and          t0, s0, s0
                  fmin.s       ft10, fa7, ft11
                  mul          s2, s6, a2
                  flt.s        s3, ft10, ft9
                  fsgnj.s      fa5, ft0, fs0
                  fsgnjn.s     fa4, fs0, ft7
                  slli         s4, a1, 2
                  fcvt.wu.s    a0, fs8
                  and          gp, t2, tp
                  fcvt.s.wu    ft10, t2, rne
                  ori          a7, t4, 1429
                  fmax.s       fs1, fa4, fs10
                  srai         t4, s1, 25
                  fcvt.s.w     ft3, t4
                  xori         t1, s10, 846
                  fcvt.wu.s    sp, ft8, rmm
                  fle.s        a0, fa6, fa5
                  fdiv.s       ft1, fa1, ft5
                  addi         a4, s10, 161
                  slti         tp, t1, 179
                  feq.s        ra, fa6, ft2
                  div          s8, t3, t2
                  sra          s3, t4, s6
                  nop
                  xori         t1, t1, -1467
                  auipc        t2, 193757
                  fclass.s     s2, fa3
                  sltiu        t1, t5, -1849
                  and          t0, s5, s6
                  fcvt.s.w     fa6, s9
                  fcvt.w.s     zero, ft0, rdn
                  srli         s2, a1, 25
                  slti         s1, gp, 358
                  srai         t0, s9, 11
                  feq.s        ra, ft0, ft7
                  add          a7, t5, tp
                  slt          t3, s10, t1
                  srli         s0, sp, 6
                  mulhsu       ra, a2, t5
                  fcvt.s.w     fa5, s10, rne
                  fcvt.w.s     a7, ft3
                  fmv.w.x      fa5, s10
                  fcvt.s.w     ft2, t3
                  flt.s        s1, fa3, fs0
                  sll          a1, s7, s0
                  mulhu        t1, s0, a0
                  feq.s        s3, fs3, ft9
                  sltu         s3, s6, s11
                  sub          t3, a1, tp
                  srai         s3, t1, 7
                  srli         ra, ra, 9
                  divu         t0, ra, gp
                  or           a0, a4, s10
                  addi         s7, s10, 1390
                  srl          s9, s2, t2
                  mulhsu       a3, sp, s10
                  lui          sp, 843978
                  xori         s1, s0, -736
                  auipc        zero, 127175
                  srai         t1, t3, 13
                  ori          a3, s8, -1111
                  fsub.s       fs10, fa3, fs1
                  and          s2, s7, s5
                  divu         t4, gp, t2
                  andi         t4, s1, -947
                  feq.s        s4, fs10, fa1
                  fmv.x.w      a7, fa3
                  fsqrt.s      fa2, fa6
                  divu         s7, tp, t6
                  div          t4, a6, s11
                  lui          a4, 935619
                  slt          t1, tp, t3
                  srl          t3, s0, t4
                  rem          s5, t1, s6
                  fmv.x.w      s5, fa7
                  and          t2, s7, a3
                  andi         s0, a6, -1499
                  ori          t4, a0, -114
                  sltu         a2, a5, t0
                  mulhu        a4, t0, a4
                  fsgnjx.s     ft8, fs0, fs0
                  lui          s5, 962848
                  fadd.s       fa6, ft9, fa4, rdn
                  srli         a6, t1, 16
                  sltiu        a1, t2, 1310
                  fadd.s       ft3, ft5, ft1, rup
                  divu         a4, ra, gp
                  sltiu        t0, gp, -1482
                  fmv.w.x      fs4, s3
                  slt          s8, s5, t2
                  srli         sp, a3, 23
                  flt.s        t0, ft6, fs1
                  sltu         t3, s10, a1
                  fsgnjx.s     fs6, ft10, fa1
                  fsgnjx.s     fa0, ft3, ft4
                  fclass.s     a4, fs7
                  remu         t2, s2, a7
                  srl          gp, t5, s0
                  srli         s2, a1, 26
                  flt.s        a5, fa0, fs0
                  fmin.s       fs5, ft1, fs10
                  or           t2, t0, t2
                  fsub.s       fa6, fa7, ft7
                  nop
                  fcvt.w.s     t2, fs6, rne
                  mulh         tp, t0, gp
                  add          t3, a2, a5
                  div          t0, s10, s1
                  fmin.s       fs5, fs2, fa5
                  or           ra, s8, s7
                  fadd.s       fa3, ft1, fs7
                  lui          s4, 1010960
                  remu         a3, t5, zero
                  fmul.s       ft6, ft3, ft1
                  fmv.x.w      t0, fa2
                  mulhsu       sp, s5, a2
                  div          s7, gp, s7
                  mulh         t2, a6, tp
                  remu         a5, sp, s3
                  fmv.w.x      fs11, s9
                  and          a1, t6, s9
                  mulhu        s2, t0, s5
                  fle.s        sp, ft4, fs7
                  srai         a6, gp, 31
                  fcvt.s.wu    ft10, s3
                  rem          gp, a6, a3
                  fmul.s       ft4, fs6, fs11, rdn
                  fcvt.s.wu    fa3, s0, rmm
                  flt.s        s1, fs7, fs10
                  fle.s        s6, ft8, ft11
                  rem          t1, a5, t1
                  sll          s0, s0, a7
                  mulhsu       s7, s6, t3
                  fmax.s       ft11, fa0, ft6
                  fle.s        s1, ft6, fa3
                  mulh         s4, s3, a2
                  fsgnj.s      fs11, fs4, ft9
                  fdiv.s       fa1, ft10, fs11, rtz
                  rem          s5, s9, gp
                  fsgnjn.s     fa5, fs11, fa7
                  fadd.s       fa3, fa2, fs6, rmm
                  fclass.s     a4, fs9
                  ori          a0, s3, 1925
                  sltu         t3, a7, s11
                  rem          a2, a7, s1
                  sltu         a5, s4, s9
                  mulhsu       t4, a2, gp
                  fcvt.w.s     t4, ft10, rmm
                  add          ra, t5, s6
                  srl          a4, ra, a4
                  or           t0, sp, s0
                  mulhu        a5, s10, tp
                  fmv.w.x      ft1, a0
                  fmax.s       ft11, fs6, fa3
                  fmin.s       fs4, fs5, fa3
                  fsgnjn.s     fs9, ft9, fs0
                  andi         s1, s2, -2043
                  sltiu        ra, a7, -604
                  mulhu        a1, gp, a4
                  fle.s        a7, fa4, fa4
                  fmax.s       fa0, fs0, ft8
                  sra          s7, s4, t4
                  fmin.s       fs6, fs5, ft4
                  feq.s        a5, fa3, ft9
                  xor          sp, s10, s3
                  fdiv.s       fs8, fs3, fs4
                  fdiv.s       fa1, fa4, fs1
                  fsgnjn.s     fs9, fa6, ft2
                  rem          a1, a6, ra
                  fmax.s       fa3, ft1, fs8
                  ori          a6, t0, -1102
                  fclass.s     s0, ft0
                  slti         t1, t5, -730
                  flt.s        s3, fa5, ft6
                  sll          a6, t3, s5
                  fsgnjn.s     fs8, ft0, fs4
                  divu         s6, s3, t1
                  sub          a3, s9, a2
                  fsqrt.s      fs6, ft10
                  ori          t1, s3, 1443
                  fmin.s       fs5, fa4, fs9
                  mulhu        a5, s7, s1
                  fsgnjx.s     ft8, ft3, fs5
                  slt          t4, a4, a0
                  rem          t2, s3, a7
                  addi         s4, a1, 505
                  fmv.x.w      t4, ft11
                  sra          tp, s6, t6
                  fmv.x.w      a7, fs7
                  divu         a7, ra, sp
                  andi         s0, a3, 190
                  sll          t0, a3, s8
                  slt          s0, s4, s9
                  srai         a0, ra, 6
                  mulhsu       s1, t2, s1
                  sltu         s1, s6, s8
                  lui          s0, 977588
                  fcvt.wu.s    s1, fs6, rdn
                  addi         a1, s3, -291
                  srl          sp, a3, t4
                  fmv.w.x      fa3, a7
                  feq.s        a6, ft1, ft1
                  fsub.s       ft1, ft2, ft3, rmm
                  fmin.s       fs9, ft10, fa0
                  nop
                  or           a4, s9, s0
                  sub          t3, t3, t5
                  sll          gp, ra, t0
                  sra          s2, s9, t5
                  feq.s        s6, ft1, fs10
                  mulhsu       a4, s3, t4
                  srl          ra, t5, a4
                  rem          gp, t6, s5
                  div          s5, s4, s1
                  sltu         t3, zero, t4
                  feq.s        s7, ft6, ft3
                  mulhsu       gp, s5, t5
                  nop
                  nop
                  fdiv.s       fa7, ft7, ft6
                  addi         a0, t6, -925
                  remu         a6, t1, a1
                  slli         s2, s9, 6
                  nop
                  mulhu        gp, s4, a0
                  mulhu        a2, s1, zero
                  sub          a6, t3, t0
                  fcvt.wu.s    s1, fa2
                  mul          gp, s9, s9
                  nop
                  fsqrt.s      ft2, ft10, rdn
                  fadd.s       fa0, fa7, ft11, rup
                  fmax.s       fs5, fs3, ft1
                  fcvt.w.s     s10, fs9, rdn
                  fmv.x.w      a5, fa5
                  fmv.w.x      ft8, t6
                  fmul.s       fs1, fs6, fa0
                  slti         s1, s8, 767
                  or           s8, zero, ra
                  lui          a4, 114425
                  sltiu        s2, s9, -1138
                  sub          a2, a2, s3
                  feq.s        s4, fs2, fa5
                  fcvt.s.w     fa2, t0, rtz
                  slti         sp, a6, 172
                  fmin.s       fs6, fa6, ft1
                  add          s6, a3, a1
                  slt          t0, s1, s6
                  addi         t4, t3, 1879
                  srli         a5, s1, 24
                  feq.s        t4, fs9, fs6
                  xori         a7, a4, 1564
                  fmv.w.x      ft0, s5
                  lui          t2, 58074
                  srli         a7, a3, 24
                  sll          zero, s1, s6
                  feq.s        zero, fa0, ft3
                  flt.s        a1, ft5, ft5
                  fsub.s       ft2, fa1, fa0
                  fmv.x.w      s10, ft8
                  lui          s4, 1003521
                  fcvt.w.s     s6, ft11, rup
                  mul          s7, tp, t0
                  mulhu        t3, sp, t4
                  fsqrt.s      fa2, fs10, rup
                  lui          s0, 464186
                  srl          s0, tp, s2
                  flt.s        s6, ft6, ft4
                  mul          t1, t5, s8
                  fle.s        t2, fa4, fs6
                  flt.s        s9, fs4, ft6
                  ori          s4, s0, -803
                  fadd.s       fs8, fs10, ft11
                  fcvt.wu.s    a2, fs11
                  fsgnjn.s     fa5, fs11, fs7
                  srl          s3, s6, s9
                  fmv.x.w      ra, fs10
                  sra          s9, t6, s5
                  fsgnjn.s     ft4, fs8, ft3
                  nop
                  divu         gp, zero, s0
                  fcvt.w.s     a6, ft8, rdn
                  and          a5, s10, s10
                  srli         s4, s5, 7
                  and          s2, sp, t3
                  auipc        s9, 406180
                  mul          s1, s3, t2
                  fsgnj.s      fa5, fa3, ft8
                  mulhsu       tp, a7, s2
                  and          a1, s1, t4
                  mulhsu       tp, t6, t2
                  addi         a4, ra, -184
                  fclass.s     s7, fa5
                  mulhsu       s9, s2, a7
                  srai         a3, s4, 19
                  flt.s        a5, ft8, fa0
                  mulhsu       s7, ra, t4
                  sltu         zero, s7, t2
                  andi         s8, zero, -1299
                  mulh         s5, gp, a3
                  fcvt.s.w     fa5, t6, rne
                  mulh         ra, zero, a5
                  or           s1, s4, s9
                  add          s5, ra, a3
                  flt.s        a1, ft4, fa2
                  slt          s6, zero, s4
                  remu         s3, a3, a7
                  fmax.s       fa5, fs3, ft11
                  fcvt.w.s     s3, fs8
                  andi         s3, t2, 1809
                  sub          t1, a2, a1
                  fcvt.s.wu    ft7, a4
                  fmv.w.x      fs10, s5
                  fclass.s     s2, ft4
                  div          s0, s10, a2
                  nop
                  feq.s        tp, fs2, fa4
                  div          gp, s3, s1
                  fsqrt.s      ft3, ft7, rup
                  divu         tp, a1, t5
                  xor          gp, t1, a1
                  div          a3, t4, s9
                  fcvt.wu.s    t1, fa6, rup
                  mul          t0, a2, t3
                  fcvt.s.wu    fs10, s6, rne
                  fmul.s       fs3, fs5, fs2
                  fdiv.s       ft1, fa0, fa1
                  sra          s10, s0, t0
                  fmv.w.x      ft2, a7
                  srai         s10, a6, 24
                  xori         tp, a2, -1099
                  srai         s7, a6, 12
                  srai         a2, s5, 3
                  flt.s        s8, fs1, fa6
                  auipc        t0, 286879
                  fdiv.s       ft1, fs2, ft9
                  fsub.s       fa5, ft10, fs6, rup
                  rem          tp, a4, s2
                  divu         t3, a2, a6
                  slt          s5, s0, s10
                  add          t4, t6, a0
                  fclass.s     t4, fs2
                  fcvt.wu.s    a6, fa6, rdn
                  lui          s9, 331863
                  slt          a2, a3, s0
                  div          t2, s11, tp
                  slt          gp, a2, t4
                  mulhu        a0, a5, s5
                  fdiv.s       fs0, fs9, ft10
                  mul          a0, tp, a4
                  srli         a2, sp, 12
                  srl          tp, a3, s9
                  sll          a7, s3, s0
                  ori          a4, s5, 1864
                  srai         s3, zero, 21
                  div          sp, s0, t0
                  fadd.s       ft10, fs11, ft1
                  fcvt.s.w     fa5, sp, rdn
                  fdiv.s       fs11, ft0, fa7, rdn
                  nop
                  slli         sp, a4, 30
                  fcvt.w.s     t2, fs10, rmm
                  fcvt.w.s     a1, fa0
                  mulh         t3, s8, s7
                  fsgnjx.s     ft3, fa4, ft11
                  nop
                  xor          a6, s9, a1
                  slli         a2, t2, 2
                  div          t4, s0, s8
                  mulhu        s2, s1, t0
                  xori         s3, tp, 857
                  sll          s1, t0, t0
                  addi         s7, s1, -365
                  fdiv.s       fs9, fa5, fs5, rtz
                  fcvt.s.w     fs6, t6
                  addi         t0, s11, 941
                  fcvt.wu.s    t0, fa7, rup
                  xor          ra, a1, s4
                  sra          s2, t6, t5
                  slti         gp, s7, 1604
                  rem          a5, s7, s1
                  andi         a0, a6, -1881
                  slti         s9, t2, 1779
                  srli         s9, s11, 14
                  slti         s1, a1, 885
                  fmv.x.w      a7, fs3
                  feq.s        a1, fs5, fa6
                  mulhsu       a5, s1, a6
                  fcvt.w.s     t1, fa0, rup
                  slti         sp, a7, 532
                  fmax.s       ft8, ft3, fs2
                  fcvt.wu.s    t4, ft4
                  lui          t3, 339264
                  sltu         s0, t4, a1
                  xori         t0, t2, -1350
                  fsgnj.s      ft8, fa5, ft10
                  divu         gp, s5, zero
                  fadd.s       fs1, fs5, fs4
                  fsqrt.s      ft2, fa2
                  lui          a5, 44164
                  or           ra, s9, s10
                  fmv.w.x      ft8, s5
                  auipc        s2, 223235
                  fsgnjx.s     ft4, fa1, ft4
                  fsub.s       fa2, fs8, fs9, rne
                  auipc        tp, 26461
                  ori          s4, a4, 259
                  fmul.s       fa4, fs9, ft0
                  srl          t3, s3, s7
                  sltiu        a4, t4, 1806
                  fmax.s       fa4, fa3, ft7
                  fcvt.w.s     s4, fs5, rdn
                  div          a0, s10, s2
                  remu         a7, t4, s10
                  feq.s        a7, fs1, fa6
                  fsgnj.s      ft6, fa6, fs9
                  add          s8, a0, a0
                  xori         t0, a0, -1648
                  srli         s8, zero, 26
                  lui          s5, 918386
                  sltu         a0, t6, s6
                  fmul.s       fa7, fa1, ft6, rne
                  andi         s2, t4, 117
                  srl          s3, a1, a4
                  fcvt.s.w     ft2, s3
                  and          t4, a2, s3
                  slti         s4, s8, -711
                  fmax.s       fa3, fs4, ft6
                  sll          zero, t1, t3
                  fmin.s       ft5, fs11, ft5
                  divu         t1, s8, s7
                  fsub.s       fs0, ft0, fs9
                  mulhu        gp, s10, t5
                  xor          a0, s6, s4
                  fsgnj.s      fa0, ft4, fs3
                  slti         s8, s0, 1355
                  auipc        t2, 846056
                  fmax.s       ft2, ft11, ft5
                  rem          s2, zero, s9
                  slt          a0, s1, a1
                  mulhu        s5, a7, tp
                  xori         t4, s7, 256
                  slli         t2, s10, 0
                  fsgnjn.s     fs4, ft1, ft1
                  sltu         ra, gp, gp
                  or           s1, t6, a0
                  lui          a4, 944511
                  nop
                  fcvt.s.wu    ft1, s6, rmm
                  fmin.s       ft6, fs2, ft8
                  div          ra, sp, s4
                  fsgnjx.s     ft9, fs0, ft8
                  feq.s        s2, fa4, ft0
                  fcvt.s.wu    fa6, a0, rdn
                  mulhsu       a0, t6, gp
                  slti         s4, s11, 1533
                  and          a0, a5, t4
                  and          s10, t5, a7
                  div          a5, a4, s6
                  slt          a0, t2, s11
                  sll          s6, s8, t6
                  ori          tp, t1, 2035
                  fmul.s       fs7, fs5, fa0, rmm
                  fcvt.s.wu    fs10, s8, rne
                  slti         a6, s8, -1935
                  fcvt.w.s     t2, fa3, rup
                  fmul.s       fs4, fs0, fs3, rup
                  fmv.x.w      a5, fs2
                  flt.s        t2, ft5, ft9
                  fsgnjx.s     fa6, ft5, fa4
                  feq.s        ra, ft4, ft10
                  slli         s4, sp, 19
                  mulhsu       s5, ra, s3
                  fadd.s       ft11, fs10, fs4
                  feq.s        a4, fa2, ft6
                  fmv.x.w      sp, ft8
                  fmin.s       ft3, fs6, ft4
                  fsgnjn.s     fs11, fs7, ft5
                  fsub.s       ft10, fs9, ft1, rmm
                  div          s4, s10, s0
                  slt          a4, a0, a0
                  sll          a1, a5, s7
                  fle.s        s0, ft9, ft7
                  divu         s9, t1, a2
                  fsub.s       ft3, fs3, ft0
                  fsub.s       ft0, ft4, ft6
                  fmv.w.x      ft2, a5
                  remu         a7, ra, sp
                  fmv.x.w      a3, fs8
                  andi         a3, a4, -943
                  mulhsu       a6, s10, s2
                  flt.s        s6, fs0, ft11
                  srli         t4, s6, 4
                  srli         zero, tp, 20
                  rem          t1, s7, s1
                  slti         zero, s4, 303
                  mul          s6, zero, tp
                  mulhsu       a0, tp, s11
                  fcvt.w.s     s8, ft5
                  mul          sp, a4, t6
                  fcvt.wu.s    a6, fa2
                  andi         a2, s0, 472
                  rem          a2, s5, s4
                  fmv.x.w      t0, ft1
                  mulhsu       s3, s4, sp
                  rem          a1, s0, s9
                  and          s4, t2, t5
                  addi         s9, a2, -447
                  fcvt.wu.s    s1, fa0, rmm
                  divu         t1, s11, s2
                  sra          s3, t6, t6
                  mulhu        t4, s3, sp
                  fcvt.s.wu    fs0, gp, rmm
                  fmv.x.w      t0, fa3
                  fcvt.w.s     a3, ft3
                  fcvt.s.w     fs3, sp, rmm
                  flt.s        s6, fa1, ft9
                  fmin.s       ft6, ft0, ft2
                  fsqrt.s      ft5, fs6, rmm
                  auipc        s0, 935704
                  sltiu        s8, sp, 1916
                  slt          s8, s10, s7
                  fle.s        t1, fs0, ft1
                  lui          t2, 119516
                  srl          tp, a2, sp
                  feq.s        s2, fa4, ft4
                  fmv.w.x      ft8, s6
                  nop
                  fdiv.s       ft4, fa5, fa6
                  sll          s1, t1, s10
                  sltiu        t3, s10, -1621
                  fsqrt.s      fa7, ft1
                  fmv.w.x      fa2, tp
                  sub          s8, s1, t4
                  sltu         zero, a3, s11
                  auipc        a3, 953830
                  sub          s4, s5, a4
                  flt.s        a3, ft5, ft4
                  xori         a5, ra, -213
                  sub          a3, s3, s7
                  fclass.s     s5, fa4
                  sub          zero, s9, a5
                  addi         s10, t4, 455
                  nop
                  fmin.s       ft5, fs0, fs10
                  fsub.s       fs4, fs10, fs3
                  or           t2, s10, t1
                  fcvt.w.s     s2, ft10
                  fcvt.w.s     tp, ft0
                  fle.s        t2, fs1, fa0
                  slti         s5, a2, 1211
                  slti         a4, t1, -1495
                  mul          s1, zero, t4
                  flt.s        s4, fa5, fs4
                  fsqrt.s      ft11, ft7, rdn
                  or           sp, t1, t4
                  fsgnjn.s     ft6, fs9, fs1
                  fsgnjn.s     ft7, fs0, fs5
                  feq.s        s10, ft2, fa0
                  sltu         s6, a5, a1
                  fcvt.s.w     fs8, t6, rmm
                  fmv.w.x      fs3, t4
                  mulhu        s3, s4, t4
                  andi         s1, a6, 68
                  mulhu        a1, t3, s3
                  sltu         s2, s1, s11
                  flt.s        a1, fs7, fa1
                  fadd.s       fa2, ft4, fa6
                  nop
                  fle.s        s10, ft7, ft1
                  fsub.s       fa1, fa5, ft3, rne
                  mul          a1, a6, zero
                  sltiu        s1, s4, -196
                  xor          a5, s5, a1
                  sltu         ra, ra, t6
                  sltiu        s6, t0, -1558
                  lui          t0, 1007231
                  fcvt.w.s     a5, fa6, rup
                  or           s8, t1, s6
                  andi         s0, a6, 971
                  fsub.s       ft3, fs2, fs9
                  add          t3, a3, t2
                  add          a6, t3, sp
                  div          s10, zero, s3
                  fsgnj.s      fs10, ft10, fa6
                  sll          gp, s8, s6
                  divu         t1, s3, s1
                  div          s0, s0, t4
                  srl          zero, s5, a1
                  fle.s        t2, fs7, ft3
                  ori          a5, s11, -815
                  fclass.s     sp, ft10
                  fmv.w.x      ft5, t3
                  srli         s4, t5, 24
                  fadd.s       fa5, ft0, fs11
                  fmax.s       fs0, fs11, ft9
                  and          a6, a1, t2
                  sltiu        ra, s3, 665
                  mulhu        t1, a1, t0
                  mulh         a5, t5, sp
                  fmax.s       fs1, ft7, fa0
                  fsub.s       fs5, ft0, fa0
                  sltu         a5, t2, t0
                  fmul.s       fa7, fa6, fs8, rup
                  fle.s        t1, ft2, ft8
                  mulh         ra, s4, a2
                  slt          a3, s10, s4
                  nop
                  fdiv.s       fa5, fs9, fs3
                  remu         a5, gp, s1
                  fmv.x.w      s6, ft3
                  fmv.x.w      t0, fa4
                  fclass.s     a0, ft3
                  sub          sp, tp, s6
                  sltu         sp, t5, a4
                  fmul.s       fa7, fs3, ft11, rmm
                  fsub.s       fs10, fs8, ft2
                  fsub.s       fs8, fs7, fa1, rup
                  sll          s3, a3, t5
                  flt.s        s2, fa4, fa5
                  fmul.s       ft5, fs6, fa7, rne
                  ori          a2, a1, 1837
                  sltiu        s7, a2, 904
                  or           s2, gp, s4
                  fclass.s     sp, fa2
                  fmin.s       ft4, fa2, fs1
                  fle.s        a5, fa4, fa4
                  fmv.w.x      fa0, gp
                  mulhsu       a4, t1, sp
                  or           gp, t6, tp
                  xori         a3, t0, 1576
                  fcvt.wu.s    t4, ft2
                  fmul.s       fs8, ft5, fa2
                  fcvt.w.s     a7, fa4
                  auipc        s3, 812463
                  fmv.w.x      fs1, a4
                  addi         s6, tp, 1545
                  fsgnj.s      fs6, fs6, ft1
                  mulhu        tp, a5, t3
                  ori          t1, s5, -284
                  fsqrt.s      ft11, ft11, rne
                  fclass.s     s1, ft10
                  slt          s3, gp, a2
                  fsub.s       ft0, fa0, fa5, rmm
                  fmv.x.w      s0, fa5
                  add          a3, t1, a5
                  srai         s4, s11, 22
                  srli         s2, a4, 17
                  mulh         t4, t6, t0
                  fsqrt.s      ft10, fa7
                  div          t3, s6, s8
                  sltu         zero, zero, a7
                  sltiu        s5, t3, 162
                  rem          tp, s5, t6
                  sltiu        s10, s1, 1244
                  fsgnj.s      fa1, ft2, fs5
                  feq.s        a3, fs8, fs8
                  fmul.s       ft5, fs0, fa6
                  addi         s5, s7, -578
                  fsub.s       fa4, ft1, ft1
                  feq.s        a1, ft6, ft10
                  and          s3, s8, s7
                  andi         s3, s5, -516
                  xori         a0, a0, 376
                  remu         a0, a4, a6
                  divu         t4, tp, s1
                  mulh         s8, a2, t4
                  fclass.s     a4, fs7
                  xori         a1, s11, 1535
                  srai         s1, s3, 23
                  fcvt.s.wu    fa2, a0
                  lui          a0, 124866
                  fcvt.s.w     ft7, s0, rtz
                  fmv.w.x      fa7, t1
                  mul          a7, a0, t3
                  sub          s10, s9, t5
                  slt          ra, t2, a2
                  remu         gp, s7, s5
                  fcvt.s.w     ft10, s4, rmm
                  fcvt.wu.s    a5, fs8, rmm
                  fsgnjx.s     ft6, fs9, ft0
                  sra          a4, s3, t1
                  nop
                  fsgnj.s      fs5, ft11, fs9
                  fcvt.s.wu    fs3, tp, rtz
                  mul          s3, ra, a0
                  slt          sp, s6, s1
                  fsub.s       fa3, fa2, ft0
                  add          s10, s5, s8
                  srl          t3, t2, sp
                  fmv.x.w      s8, ft9
                  fcvt.s.wu    fa4, t2
                  slt          s5, a3, a5
                  fcvt.s.w     fa0, s2
                  fadd.s       ft3, ft8, ft7
                  rem          a0, t0, s8
                  srai         s0, s8, 16
                  srli         t3, s5, 14
                  nop
                  fsqrt.s      fs5, ft3
                  sll          s9, t0, s8
                  srl          s6, ra, zero
                  mulh         a5, s2, gp
                  xor          s6, t3, a2
                  nop
                  fcvt.wu.s    s2, ft9, rmm
                  srli         a3, a1, 19
                  mulhsu       t3, s10, s9
                  andi         t1, s4, 508
                  addi         a0, a7, 1331
                  nop
                  sltiu        a3, s1, 733
                  ori          s8, tp, 880
                  mulh         sp, s2, t5
                  fsgnj.s      ft3, ft8, fs5
                  sra          a7, t1, s11
                  divu         s6, t5, t3
                  slli         s9, gp, 7
                  ori          a0, t4, 1126
                  fsgnjx.s     ft0, fs8, fa4
                  fdiv.s       fs1, fa7, fa1
                  fsgnj.s      fs6, fa4, fa5
                  remu         s2, ra, s9
                  sltu         a4, t1, s2
                  or           s10, a4, t3
                  fsqrt.s      ft10, ft2
                  feq.s        t3, ft6, ft2
                  andi         ra, t1, 488
                  mulh         s1, t6, a6
                  fcvt.wu.s    s6, ft2
                  fdiv.s       ft5, fa4, fs9
                  feq.s        s4, fs5, fs2
                  feq.s        s10, ft11, fs10
                  sub          s6, s5, s6
                  mulh         a7, a0, s11
                  fsub.s       fs9, ft0, fs3
                  mulh         sp, t4, s4
                  slti         t4, s1, -755
                  mulhu        t3, s3, s9
                  srai         s5, s11, 29
                  sub          s4, s9, t5
                  fcvt.w.s     s8, ft0, rmm
                  fclass.s     t0, fs1
                  srl          s1, t5, s6
                  addi         s6, zero, 1640
                  sltu         zero, s8, s0
                  ori          s2, a6, 924
                  slli         t0, s6, 8
                  ori          a3, t4, -495
                  div          s4, t5, t4
                  slti         zero, a0, 717
                  sltu         s5, t4, t0
                  auipc        s0, 659675
                  fadd.s       ft5, fs3, ft9
                  fsub.s       fs7, ft10, fs5
                  ori          a0, t2, -1056
                  remu         a2, a6, a4
                  flt.s        a3, ft9, fa1
                  add          a3, a6, ra
                  slti         a7, t4, -1569
                  fcvt.s.wu    fs4, zero
                  fsqrt.s      fs4, ft2
                  fsgnjx.s     ft2, ft4, ft5
                  xor          a1, s8, t3
                  mulh         sp, t3, a7
                  fsub.s       fs6, fs9, fs3
                  fsgnjx.s     fa5, ft3, fa5
                  fmax.s       fs11, ft9, fs11
                  nop
                  and          s0, a2, sp
                  fcvt.s.wu    ft3, ra, rne
                  fadd.s       ft10, fs8, ft11
                  div          s7, s2, a0
                  fcvt.s.w     ft9, s6, rdn
                  fdiv.s       fs5, ft10, fs1, rmm
                  fdiv.s       fa6, ft2, ft8, rtz
                  fsqrt.s      fs1, fs4
                  srai         s1, s5, 30
                  fcvt.w.s     s3, ft9
                  slli         s10, a7, 2
                  sra          zero, t1, ra
                  fle.s        a5, fa0, ft6
                  or           a0, s11, s11
                  or           t2, t2, s3
                  or           sp, a7, s6
                  fadd.s       fs11, fa0, ft8, rup
                  div          s8, tp, a0
                  slti         t1, s9, 1906
                  xori         t2, a7, 539
                  andi         a6, s8, -1729
                  srl          zero, s5, tp
                  fle.s        s2, fs1, ft8
                  lui          s3, 893219
                  fcvt.w.s     s6, fs3, rmm
                  srai         a1, t5, 13
                  sltu         a2, a3, a1
                  nop
                  fcvt.w.s     s8, fs6, rne
                  fsgnjx.s     ft4, fa3, ft2
                  sltiu        sp, s6, -2044
                  fcvt.w.s     s0, fs11
                  divu         t3, s10, a3
                  mul          s6, t6, s5
                  fdiv.s       ft8, fs11, fs1
                  fcvt.w.s     t4, fs3, rne
                  srai         t2, s2, 23
                  mulhu        a6, s0, s2
                  fmv.w.x      fs1, s9
                  fcvt.s.wu    ft11, a2
                  flt.s        a0, fs7, ft7
                  fsgnjx.s     fa1, fa7, ft3
                  fmul.s       fs3, ft7, ft6, rmm
                  sltiu        a0, sp, -1112
                  div          gp, t4, s6
                  remu         s8, a3, s11
                  add          a6, s8, t5
                  fclass.s     zero, ft2
                  fcvt.wu.s    a5, ft3, rtz
                  fadd.s       fa5, fa4, fs7, rup
                  andi         s3, a6, -1296
                  lui          a5, 586755
                  or           s3, s8, t2
                  srai         s8, t2, 18
                  fsgnjn.s     fs0, fa0, fs3
                  auipc        tp, 257656
                  and          tp, t6, t5
                  sltu         t0, a5, s10
                  feq.s        sp, fa0, fs3
                  add          a4, a2, tp
                  xor          t3, t0, t5
                  srai         gp, s7, 8
                  lui          s9, 50149
                  lui          s0, 958890
                  fle.s        s6, ft1, fa4
                  auipc        t4, 89275
                  mulhsu       s5, a3, sp
                  fmin.s       fa5, ft5, ft6
                  lui          s8, 666303
                  fcvt.s.w     ft4, t2
                  and          s0, a6, a4
                  nop
                  nop
                  sub          a7, gp, s6
                  fcvt.w.s     a7, fa0
                  fsub.s       ft7, fs10, ft7, rne
                  fsqrt.s      ft1, ft9, rup
                  flt.s        s5, fs9, ft3
                  flt.s        gp, fs5, ft3
                  srl          a0, t5, a4
                  fsgnjx.s     fs2, fs6, fa4
                  mul          a6, a3, s0
                  fle.s        t2, fs7, fs4
                  fmin.s       ft3, ft9, fs8
                  fadd.s       fs10, fs2, ft3
                  fcvt.w.s     gp, ft4, rup
                  mulhsu       a6, s11, a0
                  fmax.s       fa1, ft9, fs3
                  fcvt.s.wu    fa6, t1, rtz
                  srli         t4, s11, 27
                  sub          s8, t6, t0
                  andi         s7, t3, -1310
                  remu         s10, t0, gp
                  lui          a6, 1004650
                  fcvt.s.w     ft10, a5, rne
                  fmul.s       ft3, fa6, ft8, rup
                  fadd.s       fs3, ft1, fs8, rmm
                  xor          tp, s4, a0
                  fsub.s       fa1, fs3, fa2, rtz
                  flt.s        s9, fs1, fs5
                  mul          s8, s8, s5
                  fle.s        sp, fs10, fs8
                  slti         t0, a6, 236
                  ori          ra, a1, -1028
                  slt          t1, t4, a5
                  fmv.w.x      fs5, t5
                  add          t1, s0, s6
                  fsub.s       fs7, fa2, fs3
                  fadd.s       fs1, fa5, ft5, rdn
                  sltu         t1, ra, a7
                  feq.s        ra, fa6, ft2
                  flt.s        s6, fa1, fs5
                  fmv.x.w      a3, fa2
                  mul          a3, a3, t0
                  remu         a5, a6, a2
                  slti         ra, a5, 746
                  fcvt.s.wu    ft11, a4, rmm
                  sltiu        sp, s10, -1292
                  div          s7, t2, ra
                  fmax.s       fa3, fs9, fs4
                  fsgnjn.s     ft5, ft10, fa7
                  sltu         s7, gp, a7
                  srl          sp, t4, t6
                  fsub.s       fs8, ft1, fs6
                  fcvt.w.s     s6, ft9
                  fadd.s       ft5, fs2, fs2
                  fmv.x.w      tp, ft7
                  addi         a7, t1, -1957
                  lui          t3, 308141
                  mulhsu       a5, t6, s1
                  fdiv.s       fs3, ft3, fs4, rmm
                  add          a4, gp, t0
                  div          t3, s2, ra
                  andi         s0, tp, -109
                  fadd.s       fs3, fs0, fs1
                  srai         s2, s2, 19
                  slt          t0, s0, a0
                  fsgnjx.s     ft6, ft4, fs0
                  nop
                  fadd.s       fa0, fs8, fa6
                  sltu         a4, t4, s4
                  fcvt.wu.s    s4, fa2
                  nop
                  sll          t2, s6, a5
                  fadd.s       fa5, ft0, fs8, rup
                  fsgnjx.s     fs2, fs10, ft10
                  sra          a0, a5, t1
                  mulh         tp, t2, s9
                  sltiu        t3, a0, 1546
                  fmax.s       ft4, fa5, ft9
                  fcvt.w.s     tp, fs8, rdn
                  slt          s3, s4, t1
                  srli         a2, s0, 0
                  add          s9, a5, t5
                  slt          a3, zero, s7
                  fmin.s       ft11, fa4, fa3
                  ori          s4, a2, 1335
                  fsgnjx.s     fa7, ft11, ft3
                  divu         zero, sp, s10
                  fsub.s       ft0, fs3, fs3, rmm
                  fcvt.wu.s    s10, fs5, rmm
                  nop
                  srai         s10, t6, 14
                  div          a6, s3, a3
                  fmv.w.x      fs4, a3
                  div          s5, t0, a5
                  slli         ra, gp, 2
                  mul          a6, s6, t3
                  auipc        s0, 1007363
                  fadd.s       ft6, ft9, ft4
                  srl          s6, s10, s5
                  mulhu        gp, sp, s2
                  fclass.s     a2, fs11
                  addi         t0, s0, 1446
                  slt          t0, s7, s10
                  fmul.s       ft3, ft7, fs1, rmm
                  fmv.x.w      s1, fa6
                  fsub.s       ft10, ft3, ft3, rup
                  fcvt.s.w     ft2, s3, rne
                  fmax.s       ft7, ft3, fs1
                  srli         s8, s1, 5
                  fadd.s       fa7, ft9, fa2, rup
                  div          s8, t1, a7
                  srai         a4, s5, 16
                  or           a2, s4, s3
                  fsgnjn.s     ft7, ft10, ft10
                  fcvt.w.s     tp, fa5, rmm
                  divu         s8, s9, gp
                  nop
                  fsgnj.s      fa3, ft1, ft7
                  fcvt.w.s     a1, fs5, rdn
                  fsgnjx.s     fa2, ft8, fs5
                  fmin.s       fs0, fs10, ft8
                  fmv.x.w      s2, fa3
                  sra          tp, a0, a0
                  fcvt.s.wu    fs8, s7
                  fcvt.w.s     s9, fa3
                  fmv.x.w      s3, ft1
                  srai         t3, a7, 5
                  slli         t1, s0, 9
                  fsgnjn.s     fa0, ft4, fa6
                  fadd.s       fs2, fa7, ft10
                  sltu         a6, t3, a5
                  feq.s        a6, fa5, ft10
                  fsgnjx.s     fs8, ft1, fs4
                  slti         a7, t2, -1722
                  auipc        s2, 949332
                  flt.s        t4, fa1, fs6
                  or           s2, t2, s0
                  fsqrt.s      fs8, fa7
                  slt          s10, s2, s0
                  srai         s3, s3, 12
                  addi         a1, a7, 1568
                  fdiv.s       ft11, fa1, ft11
                  fsgnjx.s     ft11, ft6, fa7
                  xori         s4, t1, 1230
                  andi         s6, s11, 937
                  mulhu        s1, a2, gp
                  fcvt.s.wu    fs1, s6
                  fmax.s       fs9, fs6, fa2
                  fdiv.s       ft6, ft0, ft2, rne
                  auipc        t2, 427918
                  or           s10, tp, s6
                  srai         s0, zero, 30
                  add          s9, a4, t5
                  auipc        s7, 933318
                  mulhsu       ra, a4, a5
                  slti         s8, s8, -740
                  sltu         a3, t2, s7
                  remu         a7, a4, s11
                  fclass.s     sp, fs1
                  slti         s6, s5, -325
                  remu         ra, t0, s6
                  feq.s        a4, ft5, ft10
                  fcvt.s.w     ft5, t5, rtz
                  fcvt.s.w     fs2, a0, rne
                  div          s3, s8, a5
                  andi         tp, a1, -821
                  mulh         a6, tp, a1
                  ori          s3, s11, -1110
                  andi         t0, t5, 104
                  fsgnjn.s     fs5, ft5, ft11
                  sltiu        t1, ra, -1052
                  slli         t2, t5, 24
                  fdiv.s       ft2, fs1, fs10, rne
                  fdiv.s       fs0, fs8, ft3
                  fcvt.s.w     fs4, t6
                  addi         s8, s11, 1301
                  fcvt.wu.s    a0, ft1, rmm
                  add          s7, t5, t0
                  feq.s        s0, fs8, fa3
                  srl          tp, s2, t6
                  fle.s        s0, ft2, fs8
                  sltiu        s1, a3, -208
                  fsgnjn.s     fa7, fs1, fs0
                  add          t4, t0, s11
                  divu         zero, s3, a4
                  fclass.s     s0, ft4
                  fmul.s       fs11, ft8, ft9
                  andi         a0, s4, 1246
                  fmul.s       ft11, fa6, fs5, rtz
                  sltiu        s1, a7, 289
                  fcvt.w.s     gp, fs11
                  slli         s0, t2, 2
                  fmin.s       fs4, fs7, ft1
                  fsgnj.s      ft0, fa0, fs3
                  and          a4, t0, s3
                  srli         a3, t6, 14
                  slt          a2, s0, s8
                  fcvt.s.w     ft2, s10
                  xor          zero, a2, a1
                  feq.s        t3, fa5, fa0
                  sltu         a6, t3, a0
                  slti         zero, a1, -1535
                  slli         gp, s10, 14
                  fmv.w.x      fs3, s11
                  fcvt.wu.s    s9, ft0, rtz
                  addi         a1, s1, -956
                  fle.s        t1, fs2, ft0
                  fle.s        a7, fs3, ft11
                  srai         a3, s3, 11
                  fmin.s       ft8, fs7, ft4
                  slti         s5, t0, 1953
                  sltiu        a4, s1, 459
                  sltu         sp, s4, t5
                  fle.s        s4, fs6, fs2
                  div          a5, ra, zero
                  ori          a2, s2, -316
                  fmv.x.w      s0, fs1
                  mulhsu       s6, s1, gp
                  fcvt.wu.s    gp, fa5
                  div          sp, s3, s1
                  mulh         ra, s0, t3
                  divu         s7, a6, a5
                  srl          sp, gp, s1
                  ori          t0, s0, 335
                  mulhu        tp, t0, a1
                  srai         a5, a7, 17
                  divu         gp, s2, a7
                  mulh         s7, s5, t5
                  nop
                  feq.s        t0, fs1, ft2
                  fmul.s       fs3, fs2, ft3, rdn
                  sltu         s4, s7, tp
                  srai         s3, s1, 16
                  or           s2, a5, gp
                  remu         s1, a3, a1
                  remu         s8, a3, a0
                  srli         s10, t2, 3
                  fmv.w.x      fa3, s4
                  rem          t4, s10, s8
                  fsub.s       ft0, fs11, fs9
                  fcvt.s.wu    ft8, s8, rmm
                  srl          s10, a0, sp
                  slti         a1, s6, 1883
                  fclass.s     s4, fs7
                  fmv.w.x      fs5, s11
                  fsub.s       ft0, fa2, fs11, rne
                  fdiv.s       ft1, ft7, fs1, rmm
                  srai         t0, a7, 15
                  fsub.s       fa6, ft6, fa5, rtz
                  mulhu        t2, t0, t5
                  sra          s10, s7, a0
                  divu         s4, s8, a1
                  sltiu        a1, t5, 1418
                  divu         a4, t6, a7
                  srli         s4, s1, 9
                  flt.s        t2, fs5, ft1
                  slt          tp, sp, ra
                  fclass.s     s5, fs9
                  slt          s10, a6, t1
                  ori          t0, s9, -845
                  add          a1, ra, a5
                  sll          a1, s6, s7
                  srai         sp, a3, 9
                  divu         s1, s11, a0
                  xori         s5, s4, 592
                  add          s8, a5, t3
                  slli         s8, zero, 25
                  auipc        s3, 61526
                  srli         a7, s4, 3
                  xori         s8, a3, -1889
                  div          s5, tp, a2
                  rem          a0, a1, a2
                  fmax.s       fs0, ft9, fa0
                  fadd.s       fs2, fs7, ft11
                  rem          a7, ra, t3
                  div          a1, t0, sp
                  fcvt.s.wu    ft9, gp, rdn
                  lui          s1, 946980
                  or           a0, s0, s8
                  nop
                  div          a0, a0, a3
                  fmv.w.x      fa6, s1
                  fsub.s       fa1, fa1, ft0
                  sltiu        s3, t4, -1336
                  fcvt.wu.s    s9, ft4, rtz
                  fsgnj.s      fa7, ft2, ft5
                  fmin.s       fs4, fa5, fs6
                  fsgnjx.s     fa7, ft3, ft11
                  fcvt.wu.s    t3, ft6, rdn
                  div          a2, s4, t1
                  add          s10, t6, ra
                  mulhsu       ra, t4, a3
                  sltu         sp, gp, s5
                  fadd.s       fs6, fs0, fs1, rdn
                  andi         a4, t0, -2014
                  andi         s10, sp, -1049
                  fmin.s       fa7, ft5, ft11
                  fmv.w.x      fs8, t6
                  fcvt.w.s     t2, ft10
                  auipc        s10, 512407
                  xor          s8, s3, s10
                  fcvt.s.wu    fs1, a4, rup
                  fcvt.wu.s    a7, fs9
                  sltu         s4, t3, s3
                  mul          s10, t3, s5
                  flt.s        a4, ft3, fs2
                  sltiu        t4, a4, 258
                  or           t0, t0, t0
                  fle.s        s8, fa4, ft2
                  fmv.w.x      ft1, s3
                  srl          s9, s11, s4
                  fcvt.s.w     ft7, s0, rmm
                  fdiv.s       ft0, fs2, ft9, rne
                  fcvt.s.w     fs1, s5, rup
                  mul          gp, s9, a5
                  and          t4, s0, a2
                  fle.s        gp, ft7, ft1
                  remu         tp, t1, s9
                  fmax.s       ft5, ft6, fs11
                  or           t2, a0, t3
                  add          s8, t6, s0
                  divu         t3, s7, t3
                  fsqrt.s      fs7, ft11
                  sll          s1, t2, tp
                  srai         s2, t0, 16
                  fmax.s       fs5, fa1, fa2
                  fmul.s       fs11, ft4, ft5
                  mul          s4, ra, s2
                  srai         a5, s11, 22
                  fcvt.wu.s    a1, fa7
                  fcvt.w.s     s4, fa3
                  slti         s8, s5, -11
                  xor          t0, a3, tp
                  sltu         s7, a1, zero
                  fle.s        t2, ft3, fa1
                  fmv.x.w      a3, ft5
                  sltu         a2, t6, s6
                  fclass.s     t4, fa3
                  fle.s        s1, ft1, ft2
                  slti         s3, s5, -1922
                  andi         s10, t3, -744
                  div          a3, s10, t1
                  mulhu        t1, s9, s5
                  fsgnj.s      fs1, fa1, fa6
                  addi         a7, a5, -1889
                  fle.s        s2, ft4, ft10
                  sltiu        s0, a7, 985
                  fsub.s       fa2, fs6, fs8
                  sra          t3, sp, gp
                  fclass.s     s8, fa3
                  fclass.s     s6, ft9
                  rem          t0, a2, s10
                  andi         s0, t2, -1450
                  srl          s7, a5, s3
                  sltu         tp, t1, t5
                  sltu         a0, s0, a5
                  srl          t4, a3, t0
                  fcvt.wu.s    a2, fa6
                  xori         s5, s0, -1919
                  addi         a7, s8, -118
                  fsub.s       fs6, ft3, ft1
                  add          a7, ra, s6
                  fmax.s       ft10, ft0, fs6
                  mul          tp, a4, a2
                  add          a1, t3, a1
                  fadd.s       fa7, ft3, ft1
                  fmv.w.x      ft0, s6
                  add          s10, t1, t2
                  add          s9, s11, t5
                  fmv.w.x      fs3, a5
                  or           ra, s8, a0
                  fmv.w.x      ft6, t0
                  addi         s10, t4, -90
                  remu         s8, s3, gp
                  xori         t2, s8, 1049
                  fle.s        a4, fs10, fs4
                  fcvt.w.s     a7, ft7
                  fcvt.s.w     ft3, gp, rne
                  fadd.s       ft0, fs7, fs2, rne
                  fsgnjx.s     ft2, ft5, fs11
                  xor          s8, t6, s3
                  fsgnj.s      ft0, fa5, ft3
                  and          t1, t0, a1
                  mul          a5, tp, s5
                  flt.s        a3, fa7, ft8
                  andi         zero, s1, 176
                  fmul.s       ft6, ft4, ft9
                  fcvt.w.s     a3, ft6
                  fcvt.w.s     a5, fs1, rdn
                  auipc        s6, 1023312
                  sltu         sp, a4, s0
                  fmv.w.x      fs11, a5
                  slt          a5, t4, t5
                  mulhu        zero, s5, s1
                  fle.s        ra, ft7, ft2
                  fcvt.w.s     a1, fa6
                  srai         s6, sp, 15
                  sub          ra, s5, s9
                  ori          a7, a0, -235
                  mulhu        s1, t1, s3
                  sltu         s5, t0, a7
                  srai         s10, s1, 15
                  srli         a5, t5, 21
                  fsqrt.s      fs3, fs3
                  fsgnjx.s     ft7, ft9, ft0
                  fclass.s     s6, ft6
                  nop
                  and          t2, a1, s3
                  flt.s        s0, ft8, fa5
                  addi         a6, s8, 1839
                  rem          a3, a4, a4
                  lui          a2, 162626
                  fsqrt.s      ft11, ft3
                  mulhu        t4, a1, a5
                  sltu         a4, t0, a2
                  xori         a5, s0, -1769
                  xor          gp, s2, a3
                  fsgnjn.s     fa0, fs9, fs9
                  fmul.s       fs8, fa2, ft3
                  slt          a3, t2, t4
                  xori         s4, a2, -1145
                  rem          s6, s9, a3
                  mul          tp, tp, s11
                  fadd.s       ft8, ft11, fs2, rne
                  srl          s6, t4, sp
                  mulh         a1, s6, t4
                  add          t2, a3, t1
                  fmin.s       fs10, fs5, fa5
                  divu         s9, a4, s3
                  slt          t4, ra, a5
                  add          a6, t1, t3
                  fmv.w.x      fs9, s11
                  div          gp, s6, t6
                  srai         a5, t3, 8
                  add          gp, sp, s1
                  fmv.w.x      fa0, s7
                  feq.s        s2, ft1, fs5
                  feq.s        s5, ft11, fs1
                  fdiv.s       fs4, fs10, fa2
                  fsqrt.s      ft7, ft2, rup
                  mulhsu       s2, s0, a1
                  sltu         t4, a1, s9
                  fcvt.w.s     ra, fs5
                  fsgnj.s      ft2, fs6, fa1
                  lui          tp, 487040
                  mulhsu       a7, s7, s11
                  srli         s6, s9, 9
                  lui          a6, 246540
                  nop
                  fsgnj.s      fs2, fs8, fs6
                  remu         s0, s2, s7
                  mul          sp, t1, a4
                  slt          s3, sp, t6
                  srai         t4, zero, 1
                  fsgnjn.s     fs10, fs10, ft10
                  rem          t0, s3, t0
                  fcvt.s.wu    fa6, s3
                  auipc        gp, 674556
                  fclass.s     s1, fa3
                  fcvt.s.w     ft9, t1
                  la x30, test_done
                  jalr x0, x30, 0
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
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_2:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_3:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_4:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_5:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_6:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_7:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_8:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_9:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_10:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_11:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_12:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_13:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_14:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_15:
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x342 # MCAUSE
                  srli x10, x10, 0x1f
                  beqz x10, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

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
                  addi x27, x27, -4
                  sw  x31, (x27)
                  add x31, x27, zero
                  addi x31, x31, -128
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  add x27, x31, zero
                  csrr x10, 0x341 # MEPC
                  csrr x10, 0x342 # MCAUSE
                  li x18, 0x3 # BREAKPOINT
                  beq x10, x18, ebreak_handler
                  li x18, 0x8 # ECALL_UMODE
                  beq x10, x18, ecall_handler
                  li x18, 0x9 # ECALL_SMODE
                  beq x10, x18, ecall_handler
                  li x18, 0xb # ECALL_MMODE
                  beq x10, x18, ecall_handler
                  li x18, 0x1
                  beq x10, x18, instr_fault_handler
                  li x18, 0x5
                  beq x10, x18, load_fault_handler
                  li x18, 0x7
                  beq x10, x18, store_fault_handler
                  li x18, 0xc
                  beq x10, x18, pt_fault_handler
                  li x18, 0xd
                  beq x10, x18, pt_fault_handler
                  li x18, 0xf
                  beq x10, x18, pt_fault_handler
                  li x18, 0x2 # ILLEGAL_INSTRUCTION
                  beq x10, x18, illegal_instr_handler
                  csrr x18, 0x343 # MTVAL
                  1: la x30, test_done
                  jalr x1, x30, 0

ecall_handler:    
                  la x10, _start
                  sw x0, 0(x10)
                  sw x1, 4(x10)
                  sw x2, 8(x10)
                  sw x3, 12(x10)
                  sw x4, 16(x10)
                  sw x5, 20(x10)
                  sw x6, 24(x10)
                  sw x7, 28(x10)
                  sw x8, 32(x10)
                  sw x9, 36(x10)
                  sw x10, 40(x10)
                  sw x11, 44(x10)
                  sw x12, 48(x10)
                  sw x13, 52(x10)
                  sw x14, 56(x10)
                  sw x15, 60(x10)
                  sw x16, 64(x10)
                  sw x17, 68(x10)
                  sw x18, 72(x10)
                  sw x19, 76(x10)
                  sw x20, 80(x10)
                  sw x21, 84(x10)
                  sw x22, 88(x10)
                  sw x23, 92(x10)
                  sw x24, 96(x10)
                  sw x25, 100(x10)
                  sw x26, 104(x10)
                  sw x27, 108(x10)
                  sw x28, 112(x10)
                  sw x29, 116(x10)
                  sw x30, 120(x10)
                  sw x31, 124(x10)
                  la x30, write_tohost
                  jalr x0, x30, 0

instr_fault_handler:
                  add x31, x27, zero
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 128
                  add x27, x31, zero
                  lw  x31, (x27)
                  addi x27, x27, 4
                  mret

load_fault_handler:
                  add x31, x27, zero
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 128
                  add x27, x31, zero
                  lw  x31, (x27)
                  addi x27, x27, 4
                  mret

store_fault_handler:
                  add x31, x27, zero
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 128
                  add x27, x31, zero
                  lw  x31, (x27)
                  addi x27, x27, 4
                  mret

ebreak_handler:   
                  csrr  x10, 0x341
                  addi  x10, x10, 4
                  csrw  0x341, x10
                  add x31, x27, zero
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 128
                  add x27, x31, zero
                  lw  x31, (x27)
                  addi x27, x27, 4
                  mret

illegal_instr_handler:
                  csrr  x10, 0x341
                  addi  x10, x10, 4
                  csrw  0x341, x10
                  add x31, x27, zero
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 128
                  add x27, x31, zero
                  lw  x31, (x27)
                  addi x27, x27, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x10, 0x300 # MSTATUS;
                  csrr  x10, 0x304 # MIE;
                  csrr  x10, 0x344 # MIP;
                  csrrc x10, 0x344, x10 # MIP;
                  add x31, x27, zero
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 128
                  add x27, x31, zero
                  lw  x31, (x27)
                  addi x27, x27, 4
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
