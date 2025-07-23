.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x27, h0_start
jalr x0, x27, 0
h0_start:
                  li x31, 0x40001120
                  csrw 0x301, x31
kernel_sp:        
                  la x7, kernel_stack_end

trap_vec_init:    
                  la x31, mtvec_handler
                  ori x31, x31, 0
                  csrw 0x305, x31 # MTVEC

mepc_setup:       
                  la x31, init
                  csrw 0x341, x31

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x31, 0x3800
                  csrw 0x300, x31 # MSTATUS
                  li x31, 0x0
                  csrw 0x304, x31 # MIE
                  mret
init:             
                  li x31, 2139095039
                  fmv.w.x f0, x31
                  li x31, 2139095041
                  fmv.w.x f1, x31
                  li x31, 3114402971
                  fmv.w.x f2, x31
                  li x31, 2147483648
                  fmv.w.x f3, x31
                  li x31, 2143289344
                  fmv.w.x f4, x31
                  li x31, 4022236503
                  fmv.w.x f5, x31
                  li x31, 0
                  fmv.w.x f6, x31
                  li x31, 2266805943
                  fmv.w.x f7, x31
                  li x31, 2147483648
                  fmv.w.x f8, x31
                  li x31, 4286578688
                  fmv.w.x f9, x31
                  li x31, 4286578687
                  fmv.w.x f10, x31
                  li x31, 4286578688
                  fmv.w.x f11, x31
                  li x31, 4286578688
                  fmv.w.x f12, x31
                  li x31, 2141872824
                  fmv.w.x f13, x31
                  li x31, 2147483648
                  fmv.w.x f14, x31
                  li x31, 2139095039
                  fmv.w.x f15, x31
                  li x31, 2139095039
                  fmv.w.x f16, x31
                  li x31, 2147483648
                  fmv.w.x f17, x31
                  li x31, 4286578688
                  fmv.w.x f18, x31
                  li x31, 2147483648
                  fmv.w.x f19, x31
                  li x31, 2147483648
                  fmv.w.x f20, x31
                  li x31, 2149641647
                  fmv.w.x f21, x31
                  li x31, 3232243459
                  fmv.w.x f22, x31
                  li x31, 0
                  fmv.w.x f23, x31
                  li x31, 4286578688
                  fmv.w.x f24, x31
                  li x31, 2147483648
                  fmv.w.x f25, x31
                  li x31, 2148749063
                  fmv.w.x f26, x31
                  li x31, 2490737328
                  fmv.w.x f27, x31
                  li x31, 2147483648
                  fmv.w.x f28, x31
                  li x31, 3919962
                  fmv.w.x f29, x31
                  li x31, 2147483648
                  fmv.w.x f30, x31
                  li x31, 2139095041
                  fmv.w.x f31, x31
                  fsrmi 4
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0x8
                  li x3, 0x80000000
                  li x4, 0x0
                  li x5, 0xdee7eaf1
                  li x6, 0x0
                  li x8, 0x6c7ea02
                  li x9, 0x0
                  li x10, 0x0
                  li x11, 0x9103007d
                  li x12, 0xc509269f
                  li x13, 0x80000000
                  li x14, 0xf0de8356
                  li x15, 0x0
                  li x16, 0x80000000
                  li x17, 0xf
                  li x18, 0x0
                  li x19, 0x18691582
                  li x20, 0x2
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x24, 0x80000000
                  li x25, 0x0
                  li x26, 0x80000000
                  li x27, 0x0
                  li x28, 0xf6389ac5
                  li x29, 0x0
                  li x30, 0xfc0b71a2
                  li x31, 0x9fc606eb
                  la x23, user_stack_end
main:             sra          a4, s6, t0
                  divu         s0, zero, s8
                  fsqrt.s      fa5, ft10
                  fdiv.s       fs3, fa1, fs7
                  mulh         gp, tp, t1
                  or           s1, s0, a0
                  sra          a3, t2, t0
                  fdiv.s       ft9, ft10, ft9, rmm
                  mul          s9, a0, a5
                  fnmadd.s     ft7, fs3, fs9, fs8
                  fmin.s       fs1, fa7, fs2
                  sltiu        t0, a1, 900
                  fmv.w.x      fs1, a4
                  div          s9, gp, sp
                  slt          a7, s5, t4
                  fnmsub.s     fs0, ft7, ft7, fs0
                  sltu         t0, a0, t6
                  xori         s5, a4, -2020
                  sltiu        a2, gp, 1568
                  srli         a1, s2, 7
                  sub          tp, s9, sp
                  div          a2, t4, a1
                  slli         t6, s6, 2
                  fsgnj.s      ft6, ft11, fs6
                  sltu         s8, t4, s2
                  sltu         s5, a1, t3
                  ori          a3, s1, -1409
                  fnmsub.s     fs7, ft0, fs4, fs3, rtz
                  or           tp, s10, t0
                  nop
                  srli         a7, a5, 17
                  fsgnjx.s     fs11, fa6, fa0
                  nop
                  fnmsub.s     ft0, ft5, ft8, ft3
                  auipc        a0, 802280
                  auipc        a1, 900107
                  fmin.s       ft7, fs10, fs5
                  or           a3, t5, s0
                  fnmadd.s     fs7, fa4, ft6, ft8
                  feq.s        s9, fs3, ft7
                  fadd.s       ft7, fs1, ft11, rne
                  mulh         t5, a5, s2
                  srai         s2, a4, 13
                  and          a2, a3, s2
                  div          t1, tp, s9
                  sll          s6, ra, t1
                  fsub.s       fs7, ft1, fa4
                  xor          t5, a5, a2
                  srai         s0, s2, 4
                  fmv.x.w      s4, ft2
                  rem          a1, a4, t4
                  fnmadd.s     ft10, fs2, fs11, fs11
                  fmadd.s      ft8, fa4, fs5, fa2
                  fsgnjx.s     fs11, fs4, ft3
                  fsgnjx.s     fs3, fs8, ft11
                  xor          s2, s5, t1
                  div          t6, a7, s7
                  fcvt.wu.s    zero, ft4, rtz
                  feq.s        gp, fa4, ft0
                  fcvt.w.s     s6, ft8
                  slti         s0, a1, -664
                  fmul.s       fa7, ft4, ft8, rup
                  and          t5, s4, t5
                  lui          t5, 752659
                  mul          s5, s3, s4
                  fnmsub.s     fa3, fs7, ft9, fa0, rne
                  feq.s        s5, ft11, ft3
                  slt          t5, s5, ra
                  fdiv.s       fa3, fs5, fs8, rne
                  fmax.s       fs7, ft11, fa4
                  xori         a5, s5, -1830
                  fmsub.s      fs0, fs6, fs1, fs2
                  sltu         sp, a3, t1
                  fle.s        s5, fs11, ft2
                  fnmadd.s     ft3, fs6, fs7, fs1, rdn
                  flt.s        s5, fa5, ft9
                  fsub.s       fa2, fa1, fs9, rtz
                  fsgnjn.s     ft7, ft9, fs3
                  fcvt.s.w     ft11, t5
                  fsgnjn.s     fs9, fs1, fa7
                  nop
                  fcvt.s.wu    ft8, zero, rup
                  srli         s0, a4, 2
                  fsgnjx.s     fs9, fa3, fs2
                  lui          a5, 646148
                  fcvt.s.w     ft2, s10
                  sub          s9, ra, t4
                  fsqrt.s      fs0, fa7, rmm
                  sltiu        a5, zero, -630
                  fle.s        a1, fs8, ft3
                  fnmadd.s     fs4, ft9, ft1, fa1
                  nop
                  slli         a3, a5, 0
                  srl          sp, t5, a7
                  fnmsub.s     fs11, fs11, ft8, fs5
                  fsub.s       fs3, ft9, fs5, rtz
                  fmin.s       fs2, fs1, fs10
                  fnmsub.s     ft11, fa2, fa4, fa2, rne
                  fmin.s       fs4, fa5, fa6
                  fmadd.s      fa2, fs6, ft4, ft2
                  sltu         s5, a4, t5
                  or           gp, t0, t3
                  add          s10, s6, a2
                  nop
                  mul          s1, s9, zero
                  xori         a4, s1, -376
                  fmadd.s      ft7, fa3, fs1, ft8, rtz
                  feq.s        tp, fa5, ft3
                  fcvt.s.wu    fa2, tp
                  fnmsub.s     fa2, fs1, fs8, ft3, rdn
                  fmv.w.x      ft9, a5
                  fclass.s     s9, fs1
                  sra          t5, gp, t1
                  sra          s6, s5, t5
                  fsgnjx.s     fa0, fa5, fs9
                  andi         a0, s9, 305
                  feq.s        a6, ft10, ft2
                  fcvt.s.wu    ft3, s2
                  mulhsu       sp, s4, s4
                  andi         t4, a5, -2016
                  fsub.s       fs4, fs7, ft11
                  sltiu        t0, s9, 112
                  divu         a1, s2, gp
                  fsub.s       fs5, fs9, ft6
                  srl          s5, t2, s5
                  slt          s0, s5, t1
                  ori          t5, s10, -1649
                  or           a7, s6, s0
                  slli         s1, a0, 14
                  slt          s8, t4, t6
                  fadd.s       fa0, fs0, fs6, rup
                  and          s4, a3, s3
                  srl          a5, s1, s9
                  fsub.s       fs11, fs11, fa0
                  fclass.s     s0, fs1
                  rem          s5, a4, s3
                  fle.s        s4, ft8, ft11
                  fnmadd.s     fs2, fs6, fs9, fs6
                  fadd.s       fa5, ft5, ft5
                  sll          s0, t4, t2
                  addi         gp, gp, 1899
                  srl          t5, s4, s6
                  fnmadd.s     fa7, ft2, fa5, fa4
                  divu         a1, a2, gp
                  sra          s6, t2, ra
                  slli         s6, tp, 29
                  add          s6, a7, s8
                  div          s2, s4, a4
                  fsgnj.s      fa1, fs0, ft0
                  andi         a6, t2, -1668
                  fcvt.wu.s    gp, fa1, rdn
                  fcvt.w.s     t1, fs10, rne
                  fsgnjn.s     fa2, ft9, ft2
                  ori          tp, t1, -794
                  mulhu        t3, t6, t6
                  div          a7, a0, s11
                  srai         a2, s2, 8
                  mulh         t6, a4, s11
                  fle.s        t0, ft1, fs0
                  addi         t4, a4, 387
                  ori          tp, s0, 1449
                  mulh         s0, ra, s3
                  and          a3, s0, s0
                  xori         a4, s5, 1911
                  mulh         s3, t3, s1
                  sltu         zero, a4, ra
                  fmadd.s      fs9, ft10, fa4, fa0, rdn
                  fnmsub.s     fs7, ft4, fa5, ft8
                  fcvt.s.wu    fs8, s1, rup
                  sltu         t4, t6, a4
                  fcvt.s.w     fa5, t3, rne
                  divu         t5, gp, tp
                  fsub.s       ft0, ft11, fs0, rne
                  fcvt.s.w     fa7, s11
                  slli         tp, ra, 24
                  fmin.s       fs5, fa4, fs8
                  mul          a4, s7, s9
                  srl          a5, a7, s8
                  flt.s        s10, fa3, fa6
                  mulhu        t6, t2, t1
                  fdiv.s       fs3, fa3, ft9
                  nop
                  fmax.s       fs8, ft0, ft8
                  fdiv.s       ft11, fs7, ft2
                  fnmsub.s     fa4, fs11, ft5, ft7, rmm
                  fsqrt.s      ft1, ft9
                  fnmsub.s     ft3, fa2, ft2, ft6, rtz
                  fcvt.wu.s    t5, fs3, rdn
                  fmin.s       ft10, fs5, fs0
                  fcvt.wu.s    s3, fs11
                  fmv.x.w      t4, ft4
                  fclass.s     tp, fa7
                  fcvt.s.w     fs8, s7, rup
                  mulhsu       t1, s0, a1
                  fmul.s       fs0, fa0, ft2, rdn
                  fsub.s       ft2, fa6, ft6
                  fsgnjx.s     ft7, fa1, fs5
                  ori          t1, s9, 34
                  slt          a0, s2, t0
                  mulhu        a6, s7, t4
                  mulhsu       a3, s8, s1
                  slti         t3, s3, -266
                  fsqrt.s      ft1, fa7, rup
                  add          t4, s2, s0
                  fnmadd.s     ft0, fs2, ft5, fs4, rtz
                  fmsub.s      ft10, ft8, fa5, fa1, rne
                  mulhu        a2, s9, s7
                  fsgnjn.s     ft1, fs6, fs11
                  sub          tp, a5, a3
                  sll          t4, t2, s1
                  fsgnj.s      fa3, ft11, fs0
                  fcvt.s.w     ft11, t3, rtz
                  fcvt.s.wu    ft10, t1
                  mulhu        sp, t3, a7
                  fclass.s     s4, fa4
                  andi         t6, a7, 572
                  fsub.s       fs8, ft2, fs3, rne
                  fmin.s       fs4, fa7, fa3
                  srli         t3, s7, 21
                  fsgnjx.s     fs7, fa3, ft0
                  mulhu        t4, t3, a1
                  fcvt.wu.s    s10, fa3
                  lui          a0, 803317
                  fcvt.s.wu    ft6, a0, rtz
                  xor          s4, a5, a2
                  fmin.s       fa2, fs5, fs11
                  fsub.s       fa7, fs6, ft2
                  fnmsub.s     fa4, fs10, ft3, fs4, rdn
                  fclass.s     s9, ft11
                  auipc        t6, 900809
                  fmax.s       fa7, fs2, fs4
                  fsub.s       ft10, fs0, ft8
                  andi         s5, a4, -1650
                  flt.s        a4, fa4, fs6
                  srli         a0, s8, 21
                  xor          ra, a3, t1
                  xori         t3, sp, 2031
                  flt.s        a3, fa1, fs11
                  nop
                  xori         t3, s0, -294
                  mulh         a6, t0, sp
                  feq.s        s10, fa1, fa4
                  fsgnjx.s     fs2, fa5, fa7
                  sltu         a7, s9, s8
                  fnmsub.s     fs1, ft6, ft8, ft6, rup
                  sra          a0, s8, t5
                  and          zero, t6, s0
                  fnmadd.s     ft7, ft8, ft1, fa2
                  fcvt.s.wu    fa3, s4, rup
                  flt.s        s0, fa4, fa7
                  mulhsu       a7, a1, s2
                  fmv.x.w      s9, fs6
                  mulhsu       ra, a1, s6
                  fcvt.s.w     ft6, a7
                  slli         a1, sp, 19
                  fcvt.s.w     fs10, ra, rtz
                  sub          a6, a3, s4
                  remu         a0, tp, s0
                  srl          zero, t0, a4
                  fle.s        s0, ft1, fs2
                  fmul.s       ft11, fa7, fs7, rmm
                  fmax.s       fs11, fs6, ft7
                  fadd.s       fa7, fs10, fs10
                  fmax.s       ft3, fs11, fs5
                  lui          a1, 1047899
                  fcvt.w.s     a0, ft10, rup
                  fsgnjn.s     fs3, ft6, ft4
                  fmv.w.x      ft5, a2
                  fcvt.s.wu    ft2, s10, rdn
                  fmadd.s      fs1, fs7, fs8, fa7
                  fsgnjn.s     fa7, fs7, fa7
                  slti         s5, t3, 436
                  mul          s5, sp, gp
                  rem          tp, gp, s11
                  slli         t1, tp, 20
                  fmax.s       fs2, fs9, ft8
                  srli         s3, s7, 17
                  lui          a6, 659158
                  fsqrt.s      fs5, fa1
                  fmax.s       fs4, ft5, ft0
                  fsub.s       fs6, ft5, fa4, rdn
                  div          a7, s5, a1
                  ori          tp, tp, 580
                  slli         zero, s4, 29
                  auipc        a2, 397274
                  xori         t3, a4, -1200
                  slti         sp, a7, -719
                  lui          t4, 983516
                  fmadd.s      fa4, fs5, fs5, fs5, rne
                  fnmadd.s     fs5, fs7, ft8, fs10, rup
                  slt          a5, a0, t1
                  fmul.s       fs0, fa0, ft5
                  fmax.s       ft9, fs1, fs9
                  xor          ra, a7, s0
                  mulh         a2, t4, a1
                  fcvt.w.s     t5, fs10, rup
                  addi         t6, t4, -1081
                  sub          a7, a7, a0
                  srl          s4, a7, s8
                  xori         s1, s4, 1318
                  fmin.s       fa5, fa7, fa2
                  remu         a2, zero, s11
                  fsqrt.s      fa4, ft3, rup
                  slti         a6, s7, -979
                  fadd.s       ft9, fs4, fs4, rmm
                  fmv.w.x      ft1, a5
                  or           s9, zero, s3
                  nop
                  or           t1, a5, s2
                  ori          a3, t0, -134
                  slli         s3, zero, 18
                  fsqrt.s      fs9, ft2, rdn
                  fnmsub.s     ft3, ft9, fs2, fs4
                  xor          s9, a6, a5
                  slli         zero, t1, 7
                  fmv.x.w      t4, fa1
                  remu         s9, a7, a1
                  fmv.w.x      fs9, a6
                  feq.s        s9, fa5, fa6
                  addi         a3, s4, -633
                  fcvt.wu.s    s3, fs2
                  fmsub.s      fa6, fs10, ft5, fa7, rne
                  remu         s1, gp, a6
                  fmv.x.w      t3, ft10
                  fmin.s       fa7, fs5, fs1
                  mulhu        tp, t5, s8
                  mulh         a1, tp, s2
                  sltiu        t6, a0, -1147
                  fdiv.s       ft11, ft6, ft11
                  slli         t5, s3, 1
                  nop
                  fnmadd.s     fs1, fs6, fs11, fs0
                  ori          t3, s6, 1965
                  addi         t4, a4, 905
                  div          t6, s4, t4
                  fmv.x.w      a2, fs9
                  fmadd.s      fa3, ft10, ft8, fs2
                  or           t6, t5, a6
                  fmin.s       fs10, fa3, fa2
                  srl          a2, s0, zero
                  fcvt.s.w     ft8, t2, rdn
                  flt.s        t3, ft4, fa0
                  sra          sp, a1, t4
                  fcvt.s.w     fs11, t6, rne
                  and          t3, s0, tp
                  fmsub.s      fa4, ft2, fa3, fa4, rup
                  fmul.s       fs8, ft0, ft9, rne
                  mulh         a7, s6, a2
                  fadd.s       ft2, ft10, ft8, rne
                  and          ra, a1, s1
                  divu         t0, t4, t2
                  fclass.s     t5, fa5
                  mulh         t1, s3, t3
                  lui          s2, 110468
                  fmv.x.w      t6, fs1
                  fdiv.s       fa5, fs4, ft10
                  mulhu        sp, a7, sp
                  ori          s2, t6, -401
                  fle.s        t6, ft11, fs5
                  sltu         sp, s8, zero
                  sltiu        s6, t2, -801
                  auipc        s2, 748801
                  divu         s8, s11, s10
                  xori         s4, a5, -831
                  fcvt.w.s     sp, fs10
                  sltiu        s2, s5, 19
                  fsgnj.s      fs7, fs5, fa1
                  fadd.s       ft6, ft7, ft6, rmm
                  mulhu        ra, s7, a6
                  and          a1, s1, s0
                  fmax.s       fa5, ft3, fs8
                  remu         s8, s11, t0
                  auipc        t0, 180374
                  sltiu        s5, t2, 965
                  fcvt.s.wu    ft2, t6, rmm
                  fmv.x.w      t5, ft11
                  fcvt.s.w     fs6, a7
                  fmsub.s      ft4, ft0, fs11, ft3
                  fmul.s       ft10, ft1, ft2, rdn
                  lui          s6, 729722
                  nop
                  mulhsu       s10, s4, s10
                  mulh         t4, t1, s2
                  feq.s        t1, ft3, fa7
                  fcvt.s.w     ft2, tp, rup
                  divu         s3, s8, s6
                  sltu         s9, t6, s9
                  fsub.s       ft4, fa6, fs5
                  mulh         s4, t1, s0
                  remu         a0, a7, a1
                  or           gp, s2, s0
                  feq.s        t5, fs1, fa5
                  sll          a6, a4, s8
                  slli         t5, s1, 28
                  fclass.s     zero, fs2
                  fmax.s       ft1, ft2, fa2
                  fsub.s       ft6, fs8, fs1, rmm
                  fclass.s     s2, fa7
                  rem          a3, t4, tp
                  sub          a7, s10, t2
                  srli         t6, ra, 9
                  or           s4, t5, sp
                  fadd.s       fs11, ft8, ft5
                  feq.s        tp, fs2, fs3
                  fcvt.s.w     fa2, s9
                  fsgnjn.s     ft9, ft2, ft5
                  fsgnjx.s     fa5, fs0, fs2
                  lui          s1, 374973
                  fmul.s       fs10, fs8, fa2
                  div          s4, s3, gp
                  fmsub.s      fs4, fa4, ft7, fs0
                  fcvt.s.w     fs10, s0, rtz
                  and          s4, t2, s10
                  fclass.s     a0, fa1
                  remu         sp, s8, s7
                  mulh         t3, s2, a2
                  or           a1, s1, a0
                  slt          sp, t3, s11
                  nop
                  nop
                  auipc        t5, 823067
                  fsgnjx.s     fa5, ft9, fa7
                  xor          s0, a2, s7
                  fsgnjn.s     fa7, fa1, fa4
                  fsqrt.s      fa4, fa2
                  fsgnjn.s     fs2, fs4, ft1
                  or           a3, t6, t4
                  srli         t3, s10, 0
                  fmin.s       fa6, fs10, fs5
                  fnmadd.s     fs9, fs0, fa1, ft7
                  fmv.w.x      ft7, s1
                  fle.s        t4, fa1, fs0
                  fmin.s       ft1, fs2, fs8
                  xor          t3, t2, tp
                  sra          s6, t2, s4
                  sub          t3, s8, a1
                  fsgnj.s      fs5, fa4, fs2
                  fmv.x.w      t0, fs9
                  auipc        sp, 861106
                  fmadd.s      ft6, ft11, ft7, ft7, rup
                  fmsub.s      fa6, fs11, ft7, fa7, rdn
                  mul          a1, a3, tp
                  sltu         s3, a7, s9
                  divu         s9, tp, a3
                  srai         s0, t2, 8
                  fsgnj.s      ft4, fs1, fs6
                  add          s3, s2, sp
                  sra          s2, a4, s10
                  remu         t0, t4, s4
                  fcvt.s.wu    ft8, gp, rmm
                  srai         t1, t1, 31
                  mulh         a7, gp, t6
                  divu         t6, s11, s10
                  nop
                  sll          s2, s0, t3
                  fsgnj.s      fs6, fs6, fs10
                  sra          a3, a6, t2
                  fsqrt.s      fs5, fs7, rtz
                  divu         s5, t4, a6
                  slti         t1, s3, -1993
                  mulh         a6, t1, a4
                  add          a6, a3, s1
                  slti         gp, t6, -8
                  nop
                  feq.s        s5, fs0, fs2
                  fsgnj.s      ft2, fs7, fs6
                  divu         t1, a0, a2
                  srli         s0, s9, 3
                  divu         s2, s3, gp
                  or           a7, s11, a7
                  xori         s1, gp, -286
                  nop
                  fsgnj.s      fs9, fs10, ft0
                  fmax.s       fa2, fs9, fs2
                  fcvt.s.wu    ft8, tp, rmm
                  fmv.x.w      ra, ft9
                  remu         t6, t2, s5
                  fcvt.w.s     gp, fa1
                  xori         t3, a7, 311
                  srli         t3, t5, 28
                  sub          t3, t6, s9
                  sltu         t0, t4, a7
                  fsgnj.s      ft0, ft2, fa1
                  fle.s        t4, fa3, fs4
                  mulhu        a7, t6, t3
                  fclass.s     a4, fa1
                  sra          a7, t1, a4
                  xor          a3, s6, a1
                  srai         t5, a4, 2
                  flt.s        t6, ft3, fa2
                  mulh         tp, s4, s6
                  slt          a3, t5, t6
                  feq.s        t3, fs10, ft4
                  lui          a7, 814068
                  sub          s0, a3, a6
                  add          s4, t1, s5
                  addi         a7, s10, -1206
                  srai         s2, tp, 13
                  sltiu        a0, a6, 1215
                  fmsub.s      fa1, ft3, ft2, fs5
                  remu         t6, t6, s2
                  fsgnj.s      fs6, fs1, fs7
                  fcvt.w.s     zero, fs3, rup
                  fnmsub.s     fa3, fs1, fa6, ft0, rmm
                  sltiu        sp, a6, 1282
                  slli         gp, a7, 5
                  sub          a5, a4, a5
                  fmadd.s      ft3, fs6, fa4, fa0
                  fdiv.s       fa4, fs5, fa3, rtz
                  fnmadd.s     ft6, ft6, ft9, ft0
                  fsgnj.s      fa0, fa6, ft0
                  rem          s3, s10, a4
                  slti         s9, gp, 1540
                  sra          s6, a0, a0
                  sltu         a2, a6, t2
                  slli         gp, a1, 9
                  andi         a3, a1, -115
                  fnmsub.s     fa7, fs0, ft2, fs11, rdn
                  srai         t6, a6, 28
                  fle.s        s3, fa4, fs5
                  fnmsub.s     fs5, fa2, fs7, fs10
                  remu         s8, s6, a6
                  slt          a0, a5, t4
                  feq.s        a6, ft5, ft3
                  nop
                  sra          s8, a5, zero
                  sll          t3, s7, t6
                  remu         gp, tp, a7
                  or           sp, s8, t6
                  fcvt.s.w     fs3, ra, rdn
                  fmin.s       fa6, fs4, ft0
                  fnmadd.s     fs1, ft11, fa0, fa6
                  feq.s        a7, fs6, fs2
                  mulh         a7, t6, a4
                  slti         s10, s5, 1000
                  fmv.w.x      fs11, s7
                  remu         t0, a7, gp
                  sll          t5, a1, t0
                  fmadd.s      ft10, fs9, fs9, ft9
                  srli         t1, s9, 4
                  fmsub.s      ft6, fs0, ft8, fs3, rdn
                  mulh         t3, t2, a5
                  mul          a6, a0, a7
                  auipc        t3, 387305
                  sub          t0, s4, s7
                  mulhsu       t0, s9, s3
                  addi         t6, s10, 720
                  srli         a6, t1, 12
                  divu         t6, a4, t2
                  fsqrt.s      ft3, ft5
                  fmin.s       fs8, ft7, fs8
                  fmv.x.w      s6, fs0
                  slt          ra, t5, t1
                  nop
                  and          t1, t5, a0
                  fdiv.s       fs9, ft1, ft8, rmm
                  fle.s        t6, fa4, fs0
                  fadd.s       ft10, fs6, ft6, rup
                  addi         sp, a0, -1983
                  fmadd.s      ft3, fa1, fa0, fs2
                  ori          zero, s5, 526
                  ori          s5, ra, 482
                  mulhsu       s6, s11, t0
                  fmul.s       fa4, fs0, fa7, rup
                  divu         s5, a2, t0
                  fmin.s       ft1, fs3, fa0
                  divu         t6, a0, sp
                  sltu         s3, t6, s8
                  fmsub.s      fa6, ft5, ft10, ft7, rdn
                  slt          t4, s1, zero
                  fmsub.s      fs6, fa4, fs4, ft3
                  fsqrt.s      ft8, ft10
                  sra          a6, t1, s5
                  fnmadd.s     ft0, ft5, ft4, ft6
                  add          s5, a7, t2
                  flt.s        t3, fa3, fs2
                  xor          t4, sp, t4
                  fsqrt.s      ft3, fa4
                  fmv.x.w      s3, ft8
                  div          s6, a5, s1
                  addi         t4, s4, 1251
                  andi         s3, s11, 204
                  sltiu        s10, s4, -1490
                  fsgnjn.s     ft3, fa4, fs11
                  fnmsub.s     fa1, fa7, fa5, ft7
                  divu         a2, s4, s9
                  xori         s4, t3, -1269
                  feq.s        a5, ft3, fs9
                  fmv.w.x      ft0, t5
                  sra          s3, t2, s4
                  slli         t4, ra, 20
                  fmin.s       fa2, ft9, ft7
                  srli         a1, s0, 14
                  lui          s0, 1047571
                  fmin.s       fa0, fa3, fs4
                  add          s8, t5, a1
                  fmin.s       fs11, ft3, ft7
                  slti         t6, a4, 760
                  auipc        s1, 292939
                  fcvt.wu.s    s6, ft9
                  nop
                  lui          s6, 341957
                  mulhsu       a0, a6, s2
                  slt          sp, s10, s10
                  nop
                  feq.s        gp, fs10, ft7
                  srli         s5, t6, 22
                  fmax.s       fa4, fs1, ft4
                  mulh         t1, s8, s11
                  fmv.w.x      fa5, zero
                  fcvt.wu.s    tp, ft10, rmm
                  srai         s10, t2, 31
                  auipc        a0, 414602
                  feq.s        a7, fs1, fs6
                  divu         sp, t0, s2
                  remu         a3, s0, a6
                  sra          a3, a5, a0
                  fdiv.s       ft1, ft1, ft4, rne
                  sll          s6, s8, a7
                  sra          s4, sp, t0
                  auipc        ra, 465964
                  fdiv.s       fs2, ft11, fa2, rtz
                  fle.s        s1, ft7, ft9
                  fmin.s       fa1, ft3, fs9
                  or           s9, s10, a3
                  mulhsu       a2, a1, a5
                  flt.s        sp, fa6, fs7
                  xor          zero, t1, tp
                  sltiu        s9, gp, -1476
                  fclass.s     sp, ft6
                  fmv.w.x      fa0, s3
                  srai         s10, tp, 22
                  fnmadd.s     ft8, ft11, ft2, ft7
                  auipc        a4, 1024351
                  sll          sp, zero, s11
                  mulhu        s8, s3, s9
                  fnmadd.s     fs4, fa1, ft9, fa7
                  fsgnjn.s     fs11, fs9, fs6
                  fsgnj.s      ft1, fa7, fs6
                  remu         ra, s0, tp
                  slt          a6, s11, s6
                  fadd.s       ft10, ft5, ft0, rdn
                  fnmadd.s     fs7, ft2, ft9, fa4, rmm
                  fmsub.s      ft2, ft7, fa4, fs4
                  fsqrt.s      fs2, fa6, rne
                  slt          sp, t0, t4
                  sll          sp, a6, s8
                  mulh         sp, a0, t4
                  fdiv.s       fa7, ft1, ft7
                  nop
                  sub          a6, a4, a0
                  fmv.x.w      s9, ft9
                  srl          a1, t3, t1
                  remu         s9, s11, s11
                  fclass.s     a0, fs0
                  fclass.s     a1, fa1
                  fdiv.s       fs1, fs9, fa5
                  fcvt.w.s     a4, fs11
                  add          s6, t6, s1
                  fnmsub.s     fs11, fs1, ft1, fs9, rne
                  fsqrt.s      fs6, fs6, rtz
                  rem          t3, a1, s9
                  mul          tp, s4, a6
                  feq.s        gp, ft0, ft1
                  rem          a3, s2, s5
                  fsqrt.s      fa0, ft6, rtz
                  srl          a3, s7, s10
                  sltiu        s3, t4, -713
                  fdiv.s       fs2, fa5, fa1
                  mulhu        s6, a2, a0
                  divu         t6, s5, t0
                  fmin.s       fs2, fs8, ft9
                  add          ra, a6, t0
                  or           s1, a3, s11
                  fsgnjn.s     fa6, fs4, ft2
                  slt          s5, s1, t0
                  slti         a2, s4, 1087
                  fmsub.s      ft1, fa6, ft8, ft10
                  fsgnj.s      fs1, fs8, ft11
                  lui          t6, 810029
                  fsgnjx.s     ft11, ft8, fs2
                  divu         sp, s9, t4
                  ori          t6, a2, 503
                  fnmsub.s     fa7, ft7, fs11, ft4, rmm
                  fadd.s       fa7, ft1, fa0
                  slt          a1, sp, t3
                  fnmsub.s     ft11, ft3, fs3, ft3, rdn
                  fcvt.s.w     ft1, s8
                  fsqrt.s      fs6, ft4, rne
                  srli         zero, t3, 5
                  fclass.s     s2, fa5
                  fdiv.s       fs2, ft9, ft11, rtz
                  fadd.s       fs9, ft1, ft5, rdn
                  fnmadd.s     ft10, fa4, ft8, fs0, rne
                  fcvt.wu.s    a0, ft2, rdn
                  sll          s4, t6, t5
                  slli         sp, s6, 7
                  mulhu        gp, s10, s5
                  fmax.s       fs8, ft4, fs6
                  fsgnjx.s     fs6, fs1, ft8
                  mulh         s4, s10, s8
                  fmsub.s      fs2, fa6, fa6, fs4
                  div          s2, t6, s7
                  fmv.w.x      ft9, t0
                  addi         ra, t1, -629
                  fsgnjn.s     fs0, fa3, ft4
                  fcvt.wu.s    t4, ft3, rtz
                  srli         s5, s3, 2
                  fle.s        a5, fs10, fa0
                  sll          s8, gp, s4
                  xori         a3, t1, 399
                  fcvt.s.wu    fs7, t4, rmm
                  fcvt.w.s     a3, ft6
                  ori          a1, s0, -1540
                  div          a0, s6, s1
                  fmv.w.x      fs1, s5
                  flt.s        s6, ft0, ft1
                  fcvt.w.s     t5, fa5
                  mulhsu       t1, t3, s7
                  slli         a0, gp, 5
                  fdiv.s       fs8, fs7, fs7
                  xori         s0, a2, 1937
                  nop
                  fmv.w.x      ft6, zero
                  slli         s5, zero, 4
                  sra          a1, t2, s2
                  slt          s5, s1, t0
                  fmv.w.x      fa1, tp
                  slli         s4, s9, 1
                  fmadd.s      fs6, ft5, ft5, fa0
                  fsgnj.s      ft5, fa7, ft4
                  mulh         s8, s7, a0
                  sra          s10, s1, s6
                  fmadd.s      fs4, fa7, fs4, ft2, rup
                  fmul.s       fa1, fs8, fa5, rmm
                  fadd.s       ft8, fs0, fs2, rdn
                  mulhu        s3, zero, gp
                  fnmadd.s     ft6, fs4, fa7, fa7, rne
                  auipc        t1, 545070
                  sltu         a1, s5, ra
                  fmul.s       fa1, fs2, ft10
                  slti         a3, s1, 381
                  fsgnj.s      fs6, fa4, fs10
                  andi         s3, t5, -522
                  fsgnjx.s     fa4, fa6, fs8
                  fnmadd.s     fs2, ft0, ft10, ft2, rup
                  fsqrt.s      fs1, fs10
                  slti         s5, a0, -294
                  andi         t3, a6, 1648
                  rem          s8, s2, a3
                  fmul.s       fs3, fs9, fs3
                  mulh         a3, t3, a7
                  fmin.s       ft6, fa2, fs10
                  srli         s1, sp, 6
                  flt.s        gp, ft2, ft8
                  or           s10, s7, a7
                  srl          zero, s1, zero
                  fcvt.w.s     a6, ft0
                  fnmsub.s     fa3, fs7, fa6, ft9, rtz
                  flt.s        a1, fa0, fs4
                  add          zero, ra, a7
                  div          t3, s0, t3
                  andi         t4, t2, 1040
                  fsqrt.s      fs11, fs7
                  mulhu        gp, tp, t6
                  fcvt.s.w     fs3, a2, rup
                  ori          s8, a7, -1028
                  fcvt.w.s     s9, ft4, rdn
                  fmadd.s      fs4, ft11, fa5, fs3
                  fnmadd.s     ft7, fs7, ft10, ft10, rdn
                  slt          t5, t1, a2
                  fmv.x.w      s5, fa3
                  fcvt.w.s     tp, fs2, rne
                  slli         zero, s8, 24
                  mulhsu       t1, s2, a7
                  lui          s10, 978671
                  fclass.s     s4, ft3
                  sll          ra, s3, s10
                  fclass.s     ra, fs9
                  xori         t4, t1, -568
                  fsub.s       fs2, ft11, ft9, rmm
                  lui          a1, 558833
                  sltiu        s8, s3, 955
                  fmax.s       fs1, ft3, fs7
                  slli         a2, a4, 1
                  sub          t4, a6, a2
                  fdiv.s       ft3, fa2, fs1, rtz
                  sltu         ra, a7, a2
                  xori         gp, sp, 1325
                  rem          a0, s4, a3
                  xori         t5, s10, 1395
                  fdiv.s       ft8, ft0, fa5
                  slti         t3, a6, -1712
                  feq.s        zero, ft0, fs0
                  flt.s        s6, ft4, fs9
                  sll          t4, t3, a6
                  lui          a0, 641624
                  fsgnjx.s     fa3, fs5, ft6
                  fmul.s       fs11, ft4, fs11
                  fmv.x.w      s9, ft10
                  mulhsu       a5, a3, t0
                  mulh         a4, s9, s9
                  fmv.x.w      t6, ft7
                  and          t1, tp, a2
                  remu         a4, t3, s3
                  fmv.w.x      ft2, s1
                  fsgnjn.s     fs0, fs2, fa2
                  rem          s1, t2, t3
                  fmul.s       fs9, fs8, ft10, rne
                  mulhsu       s6, s11, s9
                  ori          s5, s0, 218
                  mulh         t4, a0, a1
                  sra          t5, a2, s1
                  xori         a6, s10, 1069
                  fmin.s       fs1, ft6, fs1
                  fmin.s       fs11, ft11, fa0
                  auipc        zero, 856929
                  mulhsu       a2, s3, t0
                  ori          a5, zero, 1265
                  fadd.s       fa6, fa3, fa6
                  xori         a1, s11, 1556
                  slli         a5, s9, 3
                  fcvt.s.w     fa0, sp, rmm
                  fmsub.s      fa2, fs8, fa6, fs3, rdn
                  fnmadd.s     ft5, fs9, fa7, fa2, rne
                  or           t5, s7, sp
                  mulhu        a2, a4, a4
                  and          s4, a3, s0
                  srli         s10, s9, 24
                  fdiv.s       ft4, fa1, ft6, rdn
                  fdiv.s       fs8, fa1, ft8
                  lui          t4, 92485
                  srl          s4, a3, t5
                  fmin.s       ft8, ft9, fs8
                  fcvt.s.wu    fa2, s2, rdn
                  slli         t0, s3, 0
                  fmv.w.x      fa3, tp
                  fcvt.s.w     fa0, s3
                  nop
                  fsgnj.s      fs3, fs0, ft3
                  sub          s2, t6, s0
                  fsqrt.s      ft1, ft10, rmm
                  fmul.s       fs1, ft7, fa7, rmm
                  fmin.s       fa4, ft2, fs11
                  fcvt.s.wu    ft1, a3, rtz
                  ori          t6, tp, 1885
                  xori         s1, a2, -202
                  sltiu        s0, s1, -68
                  rem          tp, t0, a5
                  xori         a4, t0, 1929
                  auipc        tp, 55232
                  fsgnj.s      fs9, ft8, ft5
                  fsub.s       fs7, ft5, ft8
                  addi         s3, ra, 1199
                  fmsub.s      fa1, fs2, fa1, ft1
                  mulhsu       s4, s3, a4
                  mulh         a5, s8, t2
                  srl          s0, zero, s11
                  fsub.s       ft9, fa3, fs8
                  ori          s4, zero, -1425
                  andi         a4, s2, -247
                  slli         a1, s2, 19
                  slli         s2, s7, 13
                  fmul.s       fs9, fs9, fs3, rmm
                  add          gp, s0, t6
                  sltu         s5, a1, s1
                  srai         s5, sp, 1
                  feq.s        s0, ft9, ft7
                  fcvt.s.w     ft7, s2, rdn
                  fnmadd.s     fs7, ft10, ft0, fs9
                  mulhu        t3, a7, a2
                  fcvt.s.w     ft8, t4
                  sltiu        a5, gp, -593
                  feq.s        s2, ft1, fs8
                  fmul.s       fs5, fs9, fs5
                  xori         gp, gp, -1631
                  fmv.x.w      t6, fa4
                  divu         s0, s4, s6
                  fcvt.w.s     s5, ft9
                  fcvt.w.s     a3, fs3, rup
                  sltu         a0, zero, s1
                  srl          s9, s0, t5
                  sra          s4, t3, a4
                  mulhsu       a6, a7, a3
                  add          s10, t2, s4
                  mulhsu       s0, s9, s1
                  flt.s        s8, ft3, fa6
                  xori         tp, s6, -126
                  fsqrt.s      fa6, ft6, rtz
                  fcvt.wu.s    t4, ft1
                  fsgnjn.s     fs0, ft3, fs9
                  fdiv.s       fa1, ft3, fs1, rmm
                  xori         a7, tp, 629
                  fmv.x.w      t1, ft4
                  addi         s0, gp, 1683
                  sltiu        t5, s11, 1030
                  addi         a6, s0, 1138
                  fmadd.s      fa1, fs1, ft7, fs4
                  sltu         t4, s0, s7
                  add          s6, s9, a3
                  sltu         t0, s2, a4
                  mulhsu       a3, a2, a6
                  nop
                  add          s10, s8, a2
                  mulh         t6, s9, s10
                  and          t4, ra, s9
                  flt.s        a7, fs8, fs9
                  fmul.s       ft1, fa2, ft10, rmm
                  fmin.s       fs9, fa5, ft4
                  or           s1, sp, t1
                  fsqrt.s      ft8, fs0, rne
                  auipc        tp, 278952
                  fcvt.s.wu    fs3, t2, rne
                  fadd.s       fs11, fs7, fs6
                  mul          t6, t6, sp
                  fmin.s       fs4, ft6, fa1
                  fdiv.s       fa6, ft1, ft6
                  fmax.s       ft8, fa4, fa3
                  fmin.s       ft0, fa7, fs1
                  lui          a0, 593902
                  xori         s9, s3, -1425
                  div          s3, s2, a6
                  fmsub.s      fa5, fs2, fa4, ft8, rne
                  fsub.s       fs3, fs5, fs4, rne
                  fcvt.wu.s    a1, ft2
                  rem          s9, t6, s9
                  and          t5, s5, t4
                  slt          s6, s7, t5
                  and          t5, t4, t6
                  mulh         t4, a5, t0
                  fcvt.s.wu    fa2, t1, rne
                  fnmadd.s     ft0, fs5, fs0, fs9
                  div          a7, a1, s6
                  nop
                  srl          s1, a2, a2
                  rem          s2, a0, s0
                  fcvt.s.w     fs10, zero, rup
                  mulhu        t6, a4, a0
                  remu         a3, s9, t0
                  addi         s6, ra, -1635
                  fsgnjx.s     fs10, fa1, fs2
                  fcvt.wu.s    t4, fa3
                  slti         s10, t1, 504
                  mulh         a7, a2, a2
                  fsub.s       ft4, ft9, ft1, rdn
                  fmsub.s      ft7, fs2, fs1, fs3, rne
                  rem          t4, t0, zero
                  or           a5, s11, gp
                  fsgnjn.s     fs10, ft4, ft8
                  sll          gp, t1, t0
                  fle.s        s0, ft2, fa5
                  flt.s        s5, fs2, fs9
                  div          t3, a2, t4
                  lui          sp, 356532
                  sltu         s3, s5, t2
                  div          s8, tp, a7
                  slt          a5, a4, s6
                  slt          a2, a7, sp
                  fmin.s       fs6, ft11, fs3
                  auipc        s10, 629843
                  sub          t0, a4, ra
                  fmadd.s      fs2, fs2, fa7, ft6, rtz
                  auipc        a5, 868356
                  fsgnj.s      fs7, ft11, fs7
                  add          t0, a5, a6
                  slli         t6, ra, 17
                  fsqrt.s      ft5, fa0
                  fle.s        t3, ft6, fs4
                  fmv.x.w      t4, fs3
                  add          ra, a6, sp
                  sltiu        a6, s3, 503
                  fadd.s       ft5, fs8, fs10
                  mulhu        s9, t1, t6
                  fsqrt.s      ft7, ft2, rdn
                  fcvt.s.w     fs9, a1
                  remu         s6, t3, ra
                  sra          a3, a0, sp
                  ori          t3, a0, 358
                  fclass.s     t4, fs11
                  fsgnjn.s     fa5, fs0, ft11
                  slt          s3, a3, s10
                  lui          ra, 827590
                  slt          sp, a2, a0
                  fadd.s       fs6, ft9, fa2
                  fnmadd.s     fs10, fs11, fs0, fs3
                  xor          a3, zero, t3
                  mul          a6, s4, s5
                  fadd.s       fs0, fs2, fa0
                  fcvt.w.s     a5, fa6
                  fle.s        t0, fa2, ft10
                  mulhu        t5, zero, s1
                  sltu         t3, s8, t6
                  slti         s5, s6, -638
                  fmsub.s      fs6, fs11, fa2, fs0, rtz
                  fdiv.s       fa5, fs9, ft1, rup
                  andi         gp, s1, -1802
                  mulhsu       s3, a1, t6
                  fmax.s       fa7, ft11, ft6
                  slti         gp, a1, 638
                  fle.s        s5, fs11, fs11
                  fsub.s       fs11, fa4, fa5, rup
                  fcvt.s.w     fs4, s2, rup
                  fclass.s     gp, fs5
                  fmadd.s      ft8, fs3, fs2, fs7
                  sra          t0, s9, t3
                  xor          s1, s10, t4
                  slt          tp, s9, s10
                  fmsub.s      fs6, ft10, fa3, fs1
                  fcvt.wu.s    s4, fs6, rup
                  srli         ra, tp, 21
                  auipc        s0, 254724
                  fmsub.s      fa6, fa2, fs7, fs2
                  andi         a6, gp, -1563
                  fcvt.s.wu    ft0, gp
                  fsqrt.s      fs1, fs4, rne
                  divu         a0, zero, a4
                  fmul.s       fa1, fs9, fa1, rtz
                  srli         t0, s9, 7
                  fdiv.s       ft5, fs1, fs3
                  fmv.x.w      s5, ft2
                  or           t5, tp, s3
                  fsgnjn.s     ft6, fs9, ft10
                  fclass.s     a7, fa7
                  srli         a0, ra, 3
                  slli         t5, t6, 19
                  fnmadd.s     fa6, ft0, fa0, fs8
                  andi         s4, s4, -1725
                  auipc        a3, 537501
                  fsub.s       fa5, fa1, fa0, rmm
                  and          s5, zero, t1
                  fcvt.w.s     sp, ft11, rne
                  divu         s1, a2, a4
                  addi         s2, sp, 1602
                  fcvt.w.s     s1, ft6
                  sub          s0, s5, ra
                  fsgnjn.s     fs5, fa0, ft11
                  fmul.s       ft8, fa7, fa4
                  ori          s9, s8, -1777
                  rem          s1, s2, a5
                  fcvt.w.s     a4, ft4, rdn
                  slli         s5, t5, 3
                  fcvt.s.w     fa4, sp
                  srli         t5, s1, 7
                  sll          s10, s4, a4
                  fmin.s       fs3, ft5, ft8
                  fmsub.s      ft3, fs8, fs5, fa5, rne
                  fmul.s       fs10, ft0, ft5
                  divu         a1, s8, s5
                  fmin.s       ft0, fs2, ft1
                  sltu         a6, s6, s9
                  or           t5, t5, a7
                  srai         s5, t3, 29
                  slli         a4, a4, 6
                  sub          t5, t6, t0
                  fcvt.s.wu    fs9, s8
                  addi         a1, t3, -1764
                  sll          gp, tp, a6
                  fsgnj.s      ft3, ft8, ft4
                  divu         a4, s0, s1
                  sll          a7, a3, s3
                  slti         s6, ra, 1600
                  sll          s6, t6, s5
                  div          a3, s9, zero
                  fcvt.w.s     a5, ft3
                  ori          t6, t3, 162
                  fsgnjx.s     ft10, fa1, ft8
                  fnmadd.s     ft1, fa0, fs9, ft3
                  fsgnjn.s     fa3, ft3, ft10
                  lui          s2, 249216
                  fsgnjn.s     fa1, fa0, fs8
                  fmv.w.x      ft6, a7
                  slli         s3, a5, 5
                  add          a2, t0, t5
                  fmsub.s      ft8, fs6, fs3, ft11
                  fle.s        s9, ft1, ft11
                  mul          s4, a4, a5
                  xori         s2, ra, 2
                  rem          s6, s8, zero
                  mulhu        a2, s0, s1
                  srli         s8, t2, 23
                  rem          t0, zero, t6
                  fle.s        s10, fs9, fa3
                  srai         a5, s6, 21
                  fnmsub.s     fs4, fa1, ft5, ft0, rup
                  fmv.w.x      fs6, s0
                  slti         zero, sp, -1621
                  fdiv.s       fs8, fs11, ft2, rup
                  fmul.s       ft10, ft0, fs6, rtz
                  fadd.s       fa0, fs5, fs3, rne
                  slli         t4, sp, 14
                  fmv.x.w      a7, fa4
                  mulhsu       gp, a2, s0
                  fdiv.s       fs1, ft6, fa4, rdn
                  addi         s10, zero, 305
                  nop
                  addi         s0, s11, 711
                  mul          a5, a1, t5
                  fle.s        a7, ft4, fs4
                  slli         t6, s8, 7
                  remu         s6, a7, s7
                  fmax.s       fa7, fa5, ft11
                  addi         a3, a2, 1511
                  sltu         s6, s11, t6
                  feq.s        tp, ft6, fs3
                  auipc        gp, 937975
                  slti         sp, t3, -1575
                  fcvt.w.s     gp, ft1, rne
                  fnmadd.s     ft7, ft2, fs0, ft2
                  auipc        a3, 841815
                  fsub.s       fa2, fa6, fa1, rtz
                  fle.s        s5, fs0, fa1
                  flt.s        t5, fs8, ft0
                  fsgnjx.s     ft1, fs2, ft4
                  fmv.w.x      ft0, s3
                  flt.s        sp, fa2, ft3
                  sltu         sp, tp, s4
                  xor          s1, s6, a2
                  fmin.s       ft5, fs5, fs0
                  mul          t1, t2, ra
                  mulh         s5, a5, sp
                  fle.s        t0, ft7, fs6
                  slt          sp, s11, t3
                  sltiu        ra, a0, 525
                  sub          s5, s5, s3
                  fcvt.s.wu    fs6, s4, rup
                  ori          tp, s6, 1632
                  fcvt.s.wu    fa1, t6
                  or           t1, a7, a7
                  fnmadd.s     ft1, ft2, fa6, ft2, rmm
                  sltiu        s3, ra, -131
                  fnmsub.s     fa1, fa6, ft2, fs6
                  sll          s10, a0, a2
                  fdiv.s       ft4, fa1, fs10
                  sltu         a1, s5, t3
                  fsub.s       fs5, fs1, fa4
                  auipc        a6, 459052
                  andi         ra, t6, 1932
                  mul          s10, a3, t1
                  remu         t0, sp, s10
                  fmv.w.x      ft4, s1
                  fdiv.s       fs2, fs8, ft7
                  nop
                  fclass.s     a7, fa0
                  sra          s5, a2, s1
                  sll          s9, s0, a2
                  sltu         s5, gp, a1
                  fmadd.s      fs5, ft2, fs4, ft9
                  ori          a2, s10, 1191
                  fmv.x.w      zero, fs0
                  fmin.s       ft6, ft9, ft9
                  flt.s        s4, ft4, fa0
                  lui          t0, 587881
                  or           s1, s9, t1
                  addi         tp, t3, 1618
                  fmv.w.x      fa2, a0
                  flt.s        ra, fs6, ft11
                  fnmsub.s     ft7, ft0, fa0, fs8
                  slti         s1, a7, 530
                  mulhu        a7, sp, a3
                  lui          a2, 306267
                  sub          s0, s4, ra
                  fcvt.s.w     fs11, t1
                  mulh         t5, a4, a2
                  fsgnjx.s     fa3, fs1, fs7
                  sub          s1, a0, a4
                  add          s2, a7, s11
                  srl          s3, zero, gp
                  fmin.s       fs0, fa4, fa6
                  fdiv.s       ft3, fs3, ft11
                  fmin.s       ft4, fs4, fa6
                  fnmsub.s     ft11, fa7, ft7, fa7
                  mulhu        s0, t0, t6
                  fsgnjn.s     fs1, ft9, fa6
                  fcvt.wu.s    t3, ft10
                  add          s6, t2, zero
                  fsub.s       fs2, fs4, fs8
                  srai         t4, ra, 27
                  flt.s        s4, fs0, fa4
                  remu         s1, gp, zero
                  mulhsu       a1, a2, t4
                  sra          s2, a5, s4
                  sub          s4, s9, a6
                  srl          s2, t2, ra
                  fcvt.wu.s    s0, ft9, rmm
                  sub          t6, zero, a7
                  fsgnjx.s     ft10, fa0, fs8
                  fdiv.s       ft3, fs6, fa5, rdn
                  fsqrt.s      fs11, ft2
                  rem          s2, zero, ra
                  fsgnj.s      fa1, fa5, fa1
                  fmin.s       fa7, ft6, fs9
                  addi         s1, s8, 1609
                  rem          s9, a4, a0
                  mul          t3, a5, a0
                  fmin.s       ft4, fa1, ft9
                  xori         t6, s1, 548
                  nop
                  xori         s2, s11, 2038
                  mulhsu       s2, tp, s10
                  fcvt.s.wu    ft6, a7, rmm
                  srli         s0, s10, 10
                  auipc        a0, 260802
                  fadd.s       fs1, ft6, ft2
                  or           ra, tp, s1
                  xor          t5, s5, s5
                  mulh         a7, s11, s3
                  mulhsu       t4, s9, a5
                  srl          s2, s6, a4
                  fnmadd.s     fs8, fs0, fa7, ft2, rne
                  ori          a1, t2, -196
                  fsgnjx.s     ft4, fa6, ft11
                  divu         s2, s2, t6
                  slt          a3, t0, a4
                  flt.s        t1, fs1, fs3
                  nop
                  fnmsub.s     ft7, fs0, ft6, fs1, rtz
                  srai         zero, s0, 13
                  xor          s6, s10, t5
                  sll          zero, ra, t1
                  feq.s        s10, ft6, fs8
                  fle.s        t3, ft11, ft6
                  fadd.s       ft11, fs6, fs5
                  fmadd.s      ft5, fa3, ft2, fs5, rmm
                  flt.s        s10, ft5, ft0
                  fnmadd.s     fs7, fs7, ft10, ft5
                  slt          s0, t6, tp
                  fsqrt.s      fs3, ft9, rdn
                  slti         s10, ra, -872
                  fcvt.wu.s    s9, fs8
                  fmv.x.w      a5, ft5
                  fmul.s       ft4, fs9, ft1, rdn
                  sub          s6, sp, s2
                  feq.s        zero, ft10, fa1
                  fsgnjx.s     fa3, fs3, fa4
                  fcvt.w.s     t6, fa4
                  srli         s3, s4, 17
                  and          s9, t4, a5
                  fmax.s       fs11, ft1, fa1
                  fcvt.w.s     t0, fs6
                  lui          s1, 624553
                  ori          t4, s11, -1775
                  srli         s8, sp, 3
                  fnmadd.s     fs3, ft5, fa1, fa0, rne
                  xor          s1, s4, t4
                  remu         s2, s8, t3
                  slli         a3, ra, 13
                  fnmadd.s     fs4, fs3, ft6, ft5
                  fcvt.s.wu    ft9, s3
                  fcvt.w.s     s10, ft1
                  fnmadd.s     fs8, fa2, fa6, fs9
                  fdiv.s       ft0, fa7, fa2
                  ori          t6, s6, -1488
                  fmax.s       fa2, fs11, ft7
                  srli         a6, s10, 23
                  fclass.s     a5, ft1
                  fsgnjx.s     fa3, fs1, fs11
                  fsgnjx.s     fa2, fs7, fa2
                  xori         a2, ra, 2042
                  fcvt.s.w     fa6, t0
                  mulh         s3, a6, t6
                  flt.s        s8, fs11, fa4
                  fmin.s       ft3, fa7, fa4
                  slti         s10, t6, -1722
                  fcvt.s.wu    fs10, t6
                  sub          s2, t6, s10
                  mulh         s6, t6, a6
                  add          a4, s8, s11
                  fsub.s       fs3, fs10, fs11
                  mulhsu       s1, a1, s4
                  fcvt.wu.s    t6, fa5
                  remu         s4, t2, t2
                  fsub.s       fs2, ft2, fs10
                  fsub.s       ft11, ft5, fa1
                  fnmadd.s     fa1, fa3, ft8, fs10, rdn
                  sub          s3, a5, s7
                  rem          s3, s1, s11
                  mul          t6, t5, s1
                  remu         s2, t5, ra
                  mulhsu       a1, t1, t0
                  fsgnjn.s     fs9, fs5, ft7
                  fle.s        t0, fa2, ft2
                  slti         a5, s7, 68
                  fmul.s       ft9, fs3, fs11, rdn
                  slt          ra, s8, s0
                  fsgnj.s      ft2, fs4, ft11
                  fmax.s       fs7, fa4, fs0
                  fcvt.w.s     s3, fs11, rtz
                  fmax.s       fs8, fs6, fs11
                  mulh         t4, t4, s7
                  mulh         s10, s0, a5
                  fcvt.s.wu    fs11, sp
                  fnmsub.s     fs7, fs8, fs9, ft8, rmm
                  fclass.s     zero, fa1
                  fsgnj.s      fs7, fs7, fa5
                  fcvt.s.w     fa6, a5, rtz
                  fle.s        ra, fa7, ft9
                  divu         ra, sp, gp
                  fadd.s       fa2, ft8, fa3, rne
                  lui          a7, 50574
                  add          s1, s6, s3
                  fcvt.s.w     fs9, t6, rup
                  xori         s1, a0, 1833
                  and          tp, s9, s8
                  fmv.x.w      t4, fa0
                  srli         a5, s0, 30
                  and          s5, a5, a7
                  add          a6, sp, t5
                  sub          s10, s6, s11
                  fmin.s       fa1, ft8, ft6
                  addi         gp, t6, -1657
                  flt.s        s0, fs5, ft0
                  slli         s1, ra, 26
                  auipc        s5, 911706
                  fsgnjn.s     ft11, ft4, ft7
                  fmin.s       fa7, ft3, fs4
                  fle.s        s2, fs8, ft7
                  div          s8, t0, t0
                  fclass.s     s10, ft2
                  fmsub.s      fs11, ft0, fs8, ft8
                  sltiu        a1, s0, 1234
                  fsgnj.s      ft1, ft7, fs1
                  flt.s        t5, fa3, ft6
                  ori          gp, t2, 1410
                  sub          s8, s11, a5
                  slli         a6, ra, 0
                  fmsub.s      fs9, ft6, ft9, ft11, rtz
                  srai         a6, s8, 9
                  sll          s9, a4, a7
                  fcvt.s.w     fa2, t5
                  fmv.x.w      t6, fs10
                  fcvt.s.wu    fs4, a2, rmm
                  fsgnjn.s     fs3, fa0, fs6
                  flt.s        gp, fs1, fs1
                  fmul.s       ft2, fs9, fs0
                  addi         a1, a7, -726
                  slt          tp, s1, s11
                  fcvt.s.wu    ft0, a1
                  nop
                  fnmsub.s     fs5, fa0, fa2, fa5
                  fmax.s       ft11, fa5, fa3
                  div          s6, a1, s7
                  fmul.s       fs1, ft0, ft1
                  srli         gp, t6, 27
                  feq.s        s3, fs2, fs2
                  srai         s2, t6, 24
                  addi         s1, tp, -1129
                  fmsub.s      ft1, fs3, ft5, fs8, rtz
                  or           a7, a0, s8
                  fnmadd.s     fs0, ft8, fs4, fa0
                  fmax.s       fs9, fa6, fs10
                  lui          s5, 856550
                  srli         sp, t2, 17
                  fcvt.s.w     fa0, s5
                  fmax.s       ft6, ft2, fa4
                  div          s4, s10, ra
                  sll          t3, a3, tp
                  fcvt.s.wu    fs8, zero, rne
                  fmul.s       ft5, ft10, ft4, rmm
                  fcvt.s.wu    ft6, sp, rup
                  flt.s        a3, fa1, fs9
                  slli         s0, s11, 4
                  sll          s3, s0, a2
                  mulhu        sp, sp, t3
                  fdiv.s       fa2, fa1, ft1
                  sra          s2, t4, a4
                  divu         a4, sp, t3
                  fsqrt.s      fs11, fs8
                  mulhsu       a1, t1, s5
                  and          a1, a6, tp
                  feq.s        tp, fs0, fs7
                  divu         a6, t0, t3
                  and          a7, s5, zero
                  add          gp, s2, s5
                  srli         tp, s10, 7
                  fnmsub.s     fa4, fs8, ft10, fa1
                  fmv.w.x      fs6, t6
                  slti         a6, t1, -249
                  div          a7, s6, s1
                  divu         s6, a5, a7
                  remu         s4, s9, t5
                  xori         tp, ra, -414
                  lui          a1, 719843
                  fcvt.s.wu    fs7, t6
                  xor          t5, t0, s7
                  rem          t0, t2, s8
                  fsqrt.s      fa2, fs9
                  slli         s5, ra, 25
                  or           a6, t5, sp
                  sub          t5, t3, a3
                  fcvt.wu.s    t4, fs8
                  fnmadd.s     fs5, ft1, fs5, fa1, rdn
                  mulh         zero, s10, s11
                  sra          s3, t4, t4
                  fsgnj.s      fs9, ft8, fs1
                  fsgnjx.s     fs5, fs5, ft2
                  fle.s        s2, ft2, fs7
                  srl          gp, a4, t5
                  lui          tp, 683252
                  andi         a2, a0, -46
                  fmin.s       fa7, fs0, fs7
                  fcvt.s.w     fa4, s11, rne
                  slt          t1, s7, zero
                  fcvt.s.wu    ft1, s0
                  nop
                  xor          t0, t3, a5
                  feq.s        a3, fs5, fa6
                  sltiu        tp, s8, 596
                  feq.s        s6, fs10, fa1
                  sra          a0, s0, s1
                  xori         zero, t0, 186
                  fnmsub.s     fa4, fs4, fs0, fs4, rtz
                  slt          s5, s8, t3
                  nop
                  lui          zero, 1015316
                  xori         s3, s9, 1240
                  fcvt.w.s     s10, fa6, rdn
                  ori          t5, s2, 2028
                  div          s3, t6, s2
                  andi         ra, s3, 1328
                  fsgnjn.s     ft4, ft4, fa1
                  fadd.s       fa7, ft4, fa6, rtz
                  sra          t1, tp, a2
                  fcvt.w.s     ra, fa5
                  div          ra, s3, t4
                  fsqrt.s      fs9, fa7
                  fclass.s     a6, ft6
                  div          a3, a2, s3
                  fmax.s       ft1, fs5, fs3
                  sra          s4, t2, s10
                  sra          a0, a1, a3
                  slti         s0, s4, -955
                  fle.s        t4, fs8, fs3
                  sltiu        s2, a7, 1634
                  sll          sp, t1, a7
                  slti         s0, zero, -1210
                  fsub.s       ft11, fs1, ft3, rup
                  fmsub.s      ft0, fa4, fs10, fa2
                  fadd.s       fa4, fa1, fs10
                  fcvt.wu.s    s9, fs1
                  srli         s6, t3, 17
                  fmul.s       fs2, fa7, fa5, rtz
                  fcvt.w.s     a4, fa0
                  sltiu        s9, gp, 964
                  feq.s        a3, fs0, fa1
                  lui          a6, 189722
                  slt          s0, t1, sp
                  sltiu        t6, a3, 1411
                  flt.s        t5, fs1, fa1
                  flt.s        gp, ft0, fa5
                  feq.s        s1, ft0, ft11
                  lui          a7, 123821
                  fnmadd.s     fa0, fs5, fs2, fa5
                  fmul.s       ft11, ft1, fs5, rmm
                  fmv.x.w      a0, fa4
                  rem          s0, a6, s6
                  fnmadd.s     ft11, fa7, ft3, fa3
                  xori         sp, t5, 1262
                  slti         t0, s3, -1990
                  auipc        s2, 248996
                  feq.s        a3, ft9, fs6
                  xori         t0, t4, 1423
                  fsgnjn.s     fs2, fa5, fs3
                  sub          a6, s0, s0
                  fsub.s       fa1, ft5, fa0, rmm
                  fcvt.s.w     fs9, s11
                  addi         s0, s11, -783
                  fmv.w.x      fa6, t0
                  andi         a2, s2, -1112
                  slli         s4, t4, 31
                  mulhu        a4, t2, s2
                  fmax.s       fs5, fs8, fa0
                  fcvt.s.wu    ft7, a1, rdn
                  and          t4, a7, a1
                  ori          t1, t3, 1914
                  fdiv.s       ft10, ft5, ft11, rne
                  fdiv.s       fa3, fa7, ft1
                  andi         t5, tp, 1313
                  mulhu        s8, s3, ra
                  fmax.s       fa6, fs11, ft9
                  fdiv.s       fa2, ft8, ft10
                  fadd.s       fs0, ft11, fs7
                  fsgnjn.s     ft1, fa5, fa2
                  sll          ra, ra, t0
                  fmin.s       ft2, fs5, ft7
                  auipc        t4, 831598
                  mulhsu       a0, a2, t3
                  fcvt.s.wu    ft4, a2, rtz
                  slli         s8, a7, 2
                  fnmsub.s     ft11, ft9, fa4, ft10, rmm
                  fclass.s     s9, fa1
                  fmadd.s      ft8, fs4, fs1, fa1
                  feq.s        a0, fa4, fs8
                  fmv.w.x      fa7, a3
                  srai         t4, a5, 0
                  fcvt.w.s     a3, fa5
                  remu         s5, t1, a7
                  sub          t6, a6, s3
                  fcvt.s.w     ft10, sp, rmm
                  and          s4, s8, s7
                  auipc        s9, 630063
                  sltu         t0, t2, s8
                  slli         t0, t2, 6
                  mulhsu       t3, tp, s9
                  fmax.s       fs1, fa4, fa0
                  fmin.s       fs10, fa1, ft0
                  nop
                  feq.s        tp, fa6, ft5
                  fcvt.s.w     fa5, s0
                  fcvt.s.w     fs7, a6, rup
                  fmv.w.x      fa0, s7
                  ori          s5, t3, 26
                  fcvt.s.w     fa3, t0, rdn
                  or           a2, a3, s5
                  addi         s4, s11, -2044
                  slli         gp, t0, 20
                  mulh         s8, sp, t3
                  fmv.x.w      a1, fs8
                  fnmadd.s     fs11, fa2, fa1, ft8
                  fsgnj.s      ft4, fa0, ft10
                  fmadd.s      fs4, ft6, fs9, fs6
                  fnmadd.s     ft4, fs3, fs6, fs10, rne
                  mulhu        s8, t1, s1
                  sra          a0, a5, a6
                  fsgnjx.s     ft6, fs7, fs8
                  fnmadd.s     fa5, ft10, fs6, ft0
                  sra          a1, s4, tp
                  add          t6, s9, a4
                  fadd.s       fa7, fs3, fs7
                  slti         a6, s3, 1249
                  fnmsub.s     fa5, fs11, ft10, fa0, rne
                  fmul.s       fa0, ft0, ft8
                  fcvt.wu.s    ra, fa0, rdn
                  sll          s9, a6, t3
                  fmv.w.x      fa7, a6
                  mulhu        zero, sp, s4
                  fmul.s       ft2, ft8, ft3, rtz
                  divu         tp, tp, a4
                  mul          t0, t2, s4
                  xori         t6, s0, -2034
                  fmadd.s      fa3, fa2, fs7, ft2, rne
                  fcvt.wu.s    a4, ft1, rmm
                  feq.s        ra, ft2, fa0
                  fdiv.s       ft1, fa1, fs9, rne
                  xor          a1, a6, s2
                  fsgnjx.s     ft5, ft0, ft9
                  fclass.s     s2, ft5
                  fmv.w.x      ft8, s4
                  nop
                  fsub.s       fs3, ft11, fa0
                  sra          t5, s7, t1
                  lui          gp, 667942
                  auipc        a4, 368804
                  fcvt.w.s     s4, ft9, rmm
                  fadd.s       fs5, ft1, fa5
                  fmv.w.x      ft7, s3
                  fmax.s       ft7, fa3, fa3
                  lui          t0, 893696
                  sra          t0, t6, t6
                  remu         s3, a7, t5
                  add          s3, ra, t5
                  fnmadd.s     fa4, fs3, ft6, fs8, rup
                  or           t1, a3, s0
                  fmin.s       fa0, ft10, ft10
                  sltu         a0, s10, t5
                  mul          t4, t5, t4
                  srli         a6, s7, 25
                  or           a7, s4, s9
                  slt          sp, gp, s6
                  rem          t5, t4, s7
                  fadd.s       fs7, ft4, fs11, rup
                  fadd.s       fs1, ft3, ft1
                  mulh         s3, a0, a1
                  fmin.s       fa3, fs4, ft7
                  fsqrt.s      ft2, ft6, rup
                  fmsub.s      fa5, fs2, ft6, fs6
                  rem          a0, a1, s6
                  addi         a2, sp, 990
                  div          s9, s11, s11
                  fcvt.w.s     zero, ft0
                  fclass.s     s3, fa5
                  srl          s9, zero, a3
                  srli         s8, a6, 9
                  mulhu        s0, gp, s2
                  rem          s2, a6, s6
                  fmul.s       fa3, ft8, ft8
                  ori          ra, s9, 1307
                  srai         t5, a4, 11
                  fnmadd.s     fa2, fs9, ft1, ft6, rdn
                  sra          ra, zero, gp
                  feq.s        a0, ft8, fa3
                  srai         t6, sp, 7
                  fdiv.s       fs11, fa2, fs2, rtz
                  fmax.s       ft10, fs10, ft11
                  nop
                  sra          gp, s7, s7
                  nop
                  fsgnj.s      ft9, ft1, fa4
                  fcvt.s.w     ft11, sp, rmm
                  fclass.s     zero, fs6
                  srai         tp, ra, 27
                  fcvt.s.w     ft8, t3, rup
                  fdiv.s       ft3, fs1, fa7
                  fsqrt.s      fa2, fs9, rtz
                  slt          t3, t1, s8
                  xori         s9, s3, 1159
                  fsub.s       fs6, ft1, ft7
                  flt.s        a5, ft6, fa3
                  mulhu        ra, s0, s9
                  mulhu        zero, s2, a7
                  sll          ra, zero, s10
                  fnmadd.s     ft9, ft5, fs10, fa2
                  fcvt.wu.s    s2, ft6
                  lui          s10, 560171
                  nop
                  fadd.s       fs10, ft4, ft7, rmm
                  flt.s        tp, fs0, fs8
                  fcvt.s.wu    ft7, s11, rdn
                  sra          tp, t3, s11
                  remu         a1, s2, s11
                  fadd.s       fs11, ft9, ft0
                  srai         zero, a1, 24
                  fdiv.s       ft10, ft7, ft5
                  fclass.s     a6, fa5
                  flt.s        s6, ft0, fs1
                  srai         t6, zero, 6
                  add          s0, s7, s2
                  sra          s1, t4, s2
                  and          s10, s5, t4
                  fmadd.s      fs3, ft0, fs7, ft11
                  mulhsu       a2, t6, s1
                  fmadd.s      ft10, ft1, ft0, fs4, rmm
                  fsgnj.s      ft5, fs6, fa3
                  slli         t3, s10, 2
                  fmax.s       fs4, fs4, ft5
                  fcvt.s.w     ft4, a7
                  slt          t1, s0, s2
                  fle.s        s1, ft2, fs2
                  lui          t0, 417893
                  auipc        t5, 66095
                  sltu         t3, a3, s10
                  srai         t5, a5, 0
                  srai         t4, s7, 19
                  fcvt.wu.s    ra, fs6
                  srli         t4, t4, 23
                  addi         a3, a1, -2001
                  andi         a4, s6, 1755
                  fsub.s       fa3, fa6, fa0
                  slli         s0, ra, 10
                  sltiu        s2, t2, 774
                  fdiv.s       fa1, fa6, ft3, rmm
                  flt.s        t4, fs3, fs0
                  and          t5, t3, t6
                  slt          s1, s11, t0
                  fcvt.s.wu    fa7, a0, rmm
                  fmv.x.w      a5, fa1
                  andi         s4, a5, 271
                  fsqrt.s      fs2, fs6, rne
                  fmax.s       ft6, fa3, fa5
                  fsqrt.s      fs7, ft9, rup
                  slt          zero, tp, t1
                  fcvt.s.wu    fs3, s0, rtz
                  slli         t4, a0, 7
                  div          gp, s6, s1
                  add          s0, tp, s9
                  fsgnjx.s     ft2, fa4, fs8
                  sub          gp, s3, t0
                  fmin.s       fa7, fs6, ft9
                  sub          a0, t3, s7
                  add          a5, tp, t2
                  fmsub.s      fs4, ft7, ft10, fs11
                  slli         a1, a0, 15
                  add          t1, s11, s4
                  andi         sp, a5, 1548
                  fcvt.s.w     ft9, sp, rup
                  fle.s        t1, fa2, fa6
                  mulh         s3, a6, t5
                  mulhu        tp, s0, t6
                  fnmsub.s     ft11, ft2, fs8, ft6, rup
                  remu         a6, t5, tp
                  srli         t0, ra, 20
                  feq.s        tp, fa0, ft10
                  fsub.s       fa2, fs2, fa0
                  and          t3, t2, t5
                  mulh         a6, s6, gp
                  mul          ra, a7, t5
                  slli         s0, sp, 15
                  srl          s5, t5, s7
                  slli         a4, s10, 31
                  fmsub.s      fa3, fa4, fa6, fs9, rtz
                  divu         s2, a5, t3
                  fmv.x.w      s4, ft7
                  ori          s4, s0, 99
                  sub          zero, s9, s9
                  nop
                  fmax.s       fa1, ft9, ft3
                  remu         a5, gp, s7
                  feq.s        s8, fs5, fa0
                  slli         a5, gp, 8
                  srai         gp, t6, 8
                  fclass.s     zero, ft0
                  andi         a1, a1, 457
                  fsgnj.s      ft6, fs6, fa6
                  fmsub.s      fa7, fa7, ft7, fs11, rup
                  fcvt.s.w     fs6, a2, rmm
                  lui          t3, 834613
                  andi         a7, s4, -609
                  sub          a2, s2, a2
                  xor          t0, t2, t6
                  srl          a6, s4, t0
                  fcvt.w.s     s4, ft8
                  lui          s6, 156039
                  fdiv.s       ft2, ft5, fa0, rdn
                  ori          ra, gp, 1911
                  slli         s3, s0, 17
                  sub          t0, t0, a3
                  fadd.s       ft1, ft1, ft6, rne
                  fle.s        s5, fa0, fa3
                  slli         a3, t4, 8
                  auipc        s4, 879255
                  lui          s6, 18019
                  fclass.s     s6, fs0
                  lui          sp, 869458
                  fmadd.s      fa4, fs1, fa1, fs9
                  rem          gp, s6, t2
                  andi         s6, a5, 1208
                  fsgnjn.s     fs3, fa5, fa6
                  fsqrt.s      ft8, fa0
                  div          a3, a7, zero
                  mulh         t1, zero, zero
                  sltu         a2, a6, s0
                  fmin.s       fa3, fa3, fa4
                  mulhsu       a2, t5, sp
                  feq.s        zero, fa3, fa2
                  slli         a3, tp, 2
                  mul          t0, t1, tp
                  feq.s        t0, fs2, ft2
                  divu         zero, t4, a7
                  rem          s10, zero, t4
                  or           t5, s1, s2
                  and          t4, t0, a7
                  fmin.s       ft8, fa7, ft11
                  fsub.s       fa3, fs3, ft3
                  mulhu        ra, gp, a0
                  fsgnjx.s     fs2, ft8, ft4
                  remu         a6, t1, s7
                  mulhsu       s3, s9, ra
                  fcvt.s.w     fa0, a0, rtz
                  fcvt.s.wu    fs0, s6, rtz
                  mulh         s1, a6, t5
                  div          t1, s1, t6
                  lui          a4, 657606
                  fcvt.s.w     ft9, s3, rtz
                  fsub.s       ft5, fa5, ft5, rmm
                  fle.s        t3, fs3, fs2
                  mulh         a6, t1, s6
                  mul          s0, t4, s3
                  fmul.s       fs4, fs5, fs11
                  xori         s10, t0, -1587
                  fsub.s       fs6, fs7, fa6
                  srl          s2, s2, t0
                  nop
                  fmul.s       ft9, ft11, ft8
                  mulh         t3, s11, s8
                  fle.s        s1, fs9, fa7
                  fsub.s       fs1, fa1, fa2
                  addi         tp, a1, -1957
                  xori         a4, sp, 849
                  sltu         s10, t4, a3
                  fle.s        t5, fs3, fa2
                  sra          t5, a6, s6
                  sltiu        s10, a1, -551
                  fsub.s       fa4, ft3, fa2
                  rem          s1, s3, a7
                  nop
                  slli         s6, t1, 2
                  rem          a2, s3, a5
                  sub          t5, s5, t2
                  fsub.s       ft0, fs7, ft4, rtz
                  or           s6, t2, s11
                  divu         a3, a1, a4
                  and          s4, tp, t4
                  fmv.x.w      t1, fa5
                  auipc        tp, 840644
                  fmin.s       fs10, fa2, ft10
                  sub          t6, t3, a6
                  fnmadd.s     ft8, fs7, fa7, ft9, rup
                  fcvt.w.s     a2, ft3, rup
                  or           a1, a6, s8
                  fmadd.s      ft3, ft7, fs4, fa3
                  fcvt.s.w     ft10, t1, rmm
                  nop
                  add          t4, a3, s11
                  auipc        sp, 778833
                  fmadd.s      fs10, fa5, fa3, fa0, rmm
                  fcvt.w.s     s3, fa6
                  fdiv.s       fa3, ft2, fa7, rmm
                  mulhu        s1, s5, s5
                  fmin.s       fs11, fa0, fa3
                  fmv.w.x      fa3, a3
                  fmax.s       fa6, ft3, fs3
                  fcvt.w.s     s9, fs7, rtz
                  or           a7, a6, a2
                  fmul.s       ft10, fs10, fa7
                  fmv.x.w      t5, fa7
                  fsgnjn.s     fs3, ft10, fs1
                  mulhsu       a4, a6, t0
                  fmv.w.x      fs10, a6
                  sll          a5, a6, s8
                  mulh         s5, s10, s10
                  auipc        t0, 182399
                  and          s2, s0, sp
                  fmadd.s      ft8, ft4, ft6, fs6
                  slli         s9, t1, 4
                  lui          t1, 349651
                  fmv.w.x      fa1, s9
                  fmadd.s      fs9, fa5, ft1, ft5
                  or           gp, t6, t5
                  fmul.s       ft3, fa0, ft2, rup
                  fmsub.s      ft1, fa2, fs9, ft6, rne
                  srli         s2, s8, 25
                  divu         a0, a0, s10
                  xori         t6, s2, 455
                  lui          s10, 24747
                  mulh         t6, a3, s5
                  mulh         ra, t0, tp
                  or           s6, a2, t2
                  srai         s0, a4, 10
                  fcvt.w.s     s5, ft4
                  xori         a2, a0, 1989
                  remu         t5, a0, t5
                  or           a1, s6, s8
                  sltiu        t4, a5, -1814
                  fsqrt.s      fa6, fa5, rne
                  fmadd.s      fa2, ft8, ft2, ft2
                  sltu         s0, sp, tp
                  fcvt.s.w     ft10, s8
                  sra          s10, s10, a5
                  fcvt.w.s     a7, fa2
                  fmv.w.x      ft11, s10
                  mul          a7, sp, s5
                  mulh         a6, a7, s10
                  fcvt.wu.s    s5, fa6
                  fmax.s       fs10, ft0, fa2
                  fmv.x.w      s2, fa7
                  ori          s9, a1, 977
                  mul          s9, s6, a2
                  fmv.x.w      gp, ft7
                  fcvt.wu.s    t5, fs2
                  fsqrt.s      ft1, fs1, rne
                  fnmsub.s     ft10, fs7, fa4, fs8
                  fclass.s     tp, ft1
                  fmv.w.x      fs10, tp
                  slti         s8, s4, -841
                  fmax.s       fa1, ft10, ft6
                  add          s2, s8, ra
                  srli         t5, s2, 22
                  fsgnjx.s     fa4, fs11, fa5
                  fsub.s       fs0, fs6, fs8, rup
                  addi         a7, s10, -1956
                  addi         s1, s11, -561
                  fsqrt.s      fs0, ft0
                  sltiu        s1, s6, 1808
                  fnmsub.s     fs7, ft7, ft3, ft6
                  auipc        s8, 1007558
                  div          s3, s10, t6
                  or           t0, a2, s8
                  mulh         s2, s1, s10
                  slli         s6, t4, 2
                  srai         s2, a2, 19
                  fmadd.s      fs8, fa5, fs1, ft9, rne
                  addi         sp, a3, -1863
                  addi         a0, sp, -1953
                  sra          a4, s9, t0
                  or           s8, s4, t3
                  xor          t5, s10, s6
                  fsqrt.s      ft4, ft8
                  fsgnjn.s     ft2, fa1, fs1
                  or           t6, a4, a6
                  sll          s1, t5, s5
                  fsgnjn.s     fa1, ft0, ft4
                  nop
                  slti         a7, t2, 351
                  fcvt.s.w     ft11, s2, rmm
                  fmv.w.x      ft1, gp
                  fcvt.wu.s    ra, ft7
                  srl          ra, a5, sp
                  sltiu        s1, s0, 1223
                  srl          s10, a0, tp
                  fnmadd.s     ft0, fs10, fa2, fs2
                  srli         s4, s2, 28
                  nop
                  fcvt.s.wu    fa7, a2
                  sltiu        t5, a0, 263
                  add          t5, tp, s3
                  fnmsub.s     fa0, fs4, fs7, ft11, rdn
                  fle.s        a2, fs7, ft6
                  xor          t6, a3, s9
                  fcvt.s.w     fa7, a0
                  addi         a4, s8, 1455
                  rem          t3, s3, a1
                  fnmsub.s     ft10, ft9, fa4, ft7
                  fadd.s       fa6, ft3, fs1
                  ori          s0, s10, 1206
                  fdiv.s       fs2, ft8, fs10
                  fdiv.s       fs4, fs3, fa5, rup
                  mulh         s9, t0, ra
                  fsgnjn.s     ft5, fs11, ft2
                  nop
                  fmul.s       ft1, ft4, ft0
                  feq.s        s5, fs2, ft9
                  lui          s4, 957831
                  xor          ra, s4, s3
                  srli         sp, a2, 25
                  feq.s        a2, fa2, fs6
                  fclass.s     t6, fs11
                  slli         t0, s5, 17
                  slt          a5, s2, ra
                  remu         s1, t5, s0
                  fnmsub.s     ft8, fs5, ft11, ft6, rdn
                  fcvt.s.w     fs4, ra, rtz
                  fmv.x.w      a0, ft11
                  mulh         a5, s0, s11
                  fmadd.s      fa7, fs1, fa6, fs10, rne
                  flt.s        tp, fs7, ft3
                  fmul.s       fs9, fs9, ft9, rup
                  fmadd.s      fs11, ft4, fs4, ft9, rdn
                  remu         s3, t6, ra
                  fmadd.s      ft1, ft5, fs0, fs6, rtz
                  remu         sp, zero, s0
                  mul          ra, s3, a4
                  divu         t3, s10, a5
                  nop
                  fmul.s       fs0, fa7, fs0, rmm
                  fsgnjn.s     ft4, fa6, fa2
                  mulhsu       s8, a7, a0
                  feq.s        t0, ft0, ft1
                  or           s2, a3, s10
                  remu         t0, t0, a5
                  sltiu        a0, s8, -729
                  sltu         zero, t3, s7
                  flt.s        s4, fa3, fs1
                  slt          tp, t1, a0
                  sub          tp, t6, t6
                  fadd.s       ft6, ft8, fs10
                  feq.s        a4, ft11, fa7
                  fclass.s     s9, ft10
                  lui          s10, 28455
                  fsub.s       fa3, fa1, fs8, rne
                  fsub.s       fs2, fa3, fa0, rmm
                  fmv.x.w      s8, fa6
                  sltiu        t6, t3, 57
                  xori         s2, s3, 1208
                  srli         t0, s2, 10
                  remu         a7, ra, s5
                  addi         tp, a4, -94
                  rem          a6, a7, a5
                  ori          t1, a7, 1025
                  fmsub.s      fa1, fs2, ft11, fs1, rtz
                  mulh         a6, s0, t1
                  lui          s3, 802106
                  mulhu        s4, t2, a0
                  sub          a3, t1, t1
                  div          sp, tp, s9
                  fcvt.s.w     fa6, s6
                  fcvt.s.w     ft5, s4
                  feq.s        t4, fa2, ft6
                  fcvt.s.w     fs2, s5, rup
                  andi         s3, s3, 410
                  fnmadd.s     ft8, fs0, ft6, fa0, rup
                  slti         s1, s8, -1799
                  srli         t0, zero, 16
                  fnmsub.s     ft7, fs4, ft0, ft7
                  mul          gp, s1, tp
                  mulhu        s1, s1, sp
                  fadd.s       fs0, fa5, ft8
                  fmax.s       ft9, fs5, ft4
                  mulhsu       t5, t1, a3
                  fmul.s       fa7, fs8, fs5
                  and          a1, t5, s3
                  fsub.s       fs1, fa7, fa6, rup
                  fcvt.w.s     sp, ft0, rne
                  sltiu        s0, t2, -1473
                  fnmadd.s     ft2, fa6, fs11, ft8
                  fsqrt.s      fs9, fs6
                  mulh         tp, s0, tp
                  remu         a3, s8, a2
                  mulhsu       s3, t5, s1
                  fsub.s       ft7, fs2, fa2, rne
                  fsqrt.s      ft10, fs9
                  sltiu        a2, s6, 1614
                  fsgnjx.s     fa7, fa2, fa0
                  fcvt.wu.s    t1, ft8
                  srl          s1, t3, s2
                  lui          a0, 496918
                  fmv.x.w      tp, ft4
                  and          s6, t5, s3
                  mul          s1, s11, s4
                  fsgnjx.s     ft0, fs11, ft4
                  fmin.s       fs1, fs8, fs7
                  slli         a5, s3, 25
                  mulhsu       a6, s1, s6
                  lui          t6, 1044724
                  remu         t1, s3, s0
                  slti         s0, t4, -1343
                  lui          t4, 322768
                  fsgnjn.s     fa5, fa7, fa5
                  xori         t0, s2, -759
                  srl          a7, t3, t6
                  sltiu        tp, t4, -128
                  xori         a3, t0, 1887
                  fmsub.s      fs7, fs6, ft1, fa3, rtz
                  andi         s2, s1, -1541
                  andi         sp, a5, 310
                  sll          a7, t3, t4
                  sltiu        a3, s0, 2020
                  sltu         t1, gp, a6
                  fmin.s       ft9, fa2, ft0
                  fsub.s       fa1, fa3, ft1, rdn
                  fle.s        a2, ft11, fs9
                  sll          s10, t6, t5
                  mulh         a1, s0, s7
                  fcvt.s.wu    fs11, zero
                  fnmsub.s     fs7, fa0, fa7, fa0
                  mul          gp, t0, ra
                  andi         a3, a7, -997
                  fmsub.s      ft9, ft11, fs8, ft2
                  add          tp, a4, s2
                  fle.s        s2, fs6, fa3
                  xor          t6, s11, a6
                  mulhu        s4, a6, a7
                  fnmadd.s     ft10, fs2, ft5, ft4, rtz
                  fnmsub.s     fa4, ft0, fa1, fs6
                  fcvt.w.s     a6, ft4, rmm
                  fcvt.s.w     fs6, tp
                  fmsub.s      fa3, fs1, ft2, ft11, rdn
                  fsgnjx.s     fa7, fa1, fs7
                  srl          t5, zero, t6
                  fmv.w.x      ft0, s7
                  fmul.s       ft0, fs1, fa3, rne
                  divu         s10, ra, a6
                  addi         s8, t2, -1602
                  fmin.s       fs2, fs10, fa0
                  fnmsub.s     fs11, ft3, ft6, ft1, rdn
                  slti         s2, a0, 1020
                  fmadd.s      fs3, fs10, fs10, fa7
                  fmsub.s      fs11, fs9, fa7, fa1, rmm
                  div          ra, ra, a5
                  sra          s10, s9, s8
                  fnmadd.s     ft2, ft9, fs3, ft6
                  feq.s        ra, fs7, fs4
                  sltiu        tp, a2, 133
                  fmsub.s      ft1, ft5, fs8, ft6
                  srl          s10, a1, t4
                  addi         t5, a7, 59
                  sll          s3, s5, t0
                  fclass.s     a0, fa0
                  addi         a5, s6, 1507
                  fsgnjn.s     ft2, ft7, fa0
                  fmadd.s      fs7, ft6, ft6, fa2
                  fdiv.s       ft0, fa6, fa7
                  mul          a1, s10, s9
                  lui          t1, 317856
                  auipc        a4, 491544
                  slti         a0, a6, -670
                  fdiv.s       fs6, fs6, ft3
                  fnmsub.s     fs5, fs5, ft4, fs3
                  srl          a7, t6, t6
                  sltu         t1, s10, t4
                  nop
                  fsub.s       fs4, ft4, ft2
                  srai         zero, s1, 18
                  mul          t6, t0, a3
                  ori          ra, t1, -720
                  srai         a1, zero, 27
                  addi         a1, s3, -1235
                  fmul.s       fa2, ft0, fs8, rdn
                  fmax.s       fa3, fs3, fa4
                  fnmadd.s     ft6, fa4, fa1, ft11, rup
                  sub          s3, a2, ra
                  or           sp, s5, tp
                  srai         a3, a4, 15
                  fcvt.s.w     ft4, s5, rmm
                  fsqrt.s      fs1, fs8
                  andi         a4, t0, -2027
                  slli         s9, zero, 23
                  fmul.s       fa4, fs2, ft2
                  sra          a0, a2, t1
                  srl          tp, s5, a6
                  fmsub.s      fa4, ft11, fa6, ft2
                  xori         a4, s3, 951
                  slli         s9, s7, 6
                  mulhsu       sp, a3, t3
                  xor          sp, t1, s7
                  mulh         s1, a0, t4
                  rem          s4, t5, s0
                  xori         s6, s7, 109
                  fcvt.s.w     fs4, t1, rmm
                  rem          s4, s9, s11
                  fmin.s       ft11, ft8, fa0
                  add          sp, s7, t5
                  lui          s4, 712841
                  sra          t6, s5, s8
                  sub          t0, zero, s2
                  fclass.s     t5, ft11
                  rem          a2, s9, t1
                  fmadd.s      ft10, fa4, ft4, ft1
                  divu         a6, s11, a7
                  fsub.s       fs7, ft2, ft8, rtz
                  fadd.s       ft6, fs9, fs2, rdn
                  xor          s5, a6, s3
                  fcvt.s.w     ft7, gp, rup
                  sub          t3, a0, t4
                  fcvt.w.s     a1, fs2
                  div          a6, t5, gp
                  xori         s8, a2, -1383
                  fmsub.s      fa5, fs2, fa2, fa1
                  div          s2, a0, s11
                  flt.s        s8, ft1, fs1
                  fsub.s       ft10, ft3, fs6, rne
                  fsgnj.s      fs1, ft1, fs2
                  fsub.s       fs4, fs7, fa2, rmm
                  fcvt.s.wu    ft4, t5
                  fsqrt.s      ft1, fa4
                  ori          a3, t2, 198
                  and          ra, a1, s1
                  fmul.s       fs9, fs6, fs1, rup
                  lui          t1, 955229
                  div          a3, ra, s8
                  fsqrt.s      ft4, fa7
                  sltu         s5, zero, t4
                  or           s1, t4, t2
                  fnmadd.s     fa1, ft11, fs7, ft3, rmm
                  fmv.x.w      s2, fa0
                  fclass.s     s1, fs9
                  addi         a0, a6, 588
                  fmul.s       ft2, ft0, ft9, rmm
                  divu         tp, zero, s5
                  mul          ra, ra, a2
                  xori         a7, a3, -498
                  sltiu        a3, sp, 1101
                  fle.s        a5, fa1, ft4
                  srl          s10, a3, s4
                  fsgnj.s      ft4, ft4, ft2
                  fcvt.wu.s    t1, ft1, rmm
                  xori         t3, a4, -1928
                  xor          t0, sp, s9
                  sll          a1, t4, s0
                  fsub.s       fs11, fa0, fa0
                  feq.s        s4, fs9, fs8
                  fmin.s       ft3, fs3, ft9
                  mulhsu       s8, t3, t5
                  slli         s1, s10, 31
                  srli         a0, s2, 24
                  slli         s8, a1, 3
                  srli         a0, t6, 27
                  fsub.s       ft6, fs7, fs9
                  fmadd.s      ft10, fs9, fs7, fa6
                  sra          t1, s5, t4
                  ori          zero, s0, 634
                  flt.s        s3, fs8, fs0
                  sltiu        s0, s0, -1175
                  srai         s1, t2, 28
                  sll          s10, a5, s7
                  fsgnjn.s     fa0, ft10, fa2
                  remu         s5, a5, a1
                  mul          sp, tp, t0
                  add          t6, s11, a0
                  lui          s9, 19609
                  srai         gp, a1, 11
                  fclass.s     a1, ft2
                  fmax.s       fa6, fs2, fs9
                  nop
                  addi         zero, a0, -1236
                  fmax.s       fs6, fs4, fs3
                  addi         ra, a6, -1179
                  fcvt.s.w     ft4, a5, rdn
                  fsgnj.s      fa4, fa3, ft0
                  xor          tp, s10, s5
                  fnmsub.s     fs3, fs8, fs9, fa4
                  fsgnjn.s     fs8, fs4, fs5
                  and          a2, s2, a4
                  auipc        a6, 156697
                  add          s1, a1, s6
                  fmul.s       fa1, ft3, ft6, rup
                  remu         t3, t6, s8
                  fmax.s       fs5, fs2, fs2
                  sub          a3, a4, s5
                  fmsub.s      ft1, ft9, fs8, ft5
                  sltiu        s10, sp, -1626
                  fsub.s       ft7, fa3, fa3, rdn
                  fsqrt.s      fs0, ft5
                  sub          sp, t1, s7
                  srl          a1, s4, a1
                  nop
                  div          t0, t1, a5
                  fsqrt.s      fs5, fs7
                  sub          s6, s8, t5
                  fsgnj.s      ft7, ft10, fa2
                  lui          s2, 321482
                  auipc        a1, 341617
                  sltiu        a6, s10, 2031
                  fcvt.wu.s    t4, fa1
                  fsqrt.s      fs2, ft3, rne
                  srli         t0, s8, 30
                  fmax.s       fa7, fa1, fs5
                  and          s0, a6, s5
                  ori          s3, t0, -1970
                  fcvt.w.s     a2, fa0, rne
                  fdiv.s       fs8, ft10, fs11, rne
                  sub          t5, s0, tp
                  sltu         s1, a7, s10
                  flt.s        t5, ft5, fa2
                  slti         t1, s5, -526
                  andi         gp, s1, -1134
                  mulh         s0, zero, t4
                  xori         t5, s0, -534
                  srli         a1, a1, 16
                  fmin.s       fs5, fs2, fs9
                  and          gp, t4, t6
                  flt.s        s0, fa3, fa0
                  fmul.s       fs10, fa3, fa3
                  fle.s        a3, fa2, fs9
                  fmsub.s      ft3, fs7, ft3, ft4
                  sub          s2, t5, s9
                  sltu         a0, tp, s5
                  fcvt.s.w     fa4, s3
                  nop
                  fcvt.wu.s    s2, ft5
                  addi         s5, s2, -749
                  fdiv.s       fs4, fs6, fs6
                  fsub.s       fs1, ft1, fs10
                  fcvt.s.w     ft7, s4
                  addi         gp, a4, -1775
                  mul          s3, a4, t0
                  fnmsub.s     ft9, ft1, fs9, fs3, rup
                  fcvt.s.wu    ft6, zero, rdn
                  sltiu        s1, s3, -1829
                  remu         sp, s0, a6
                  ori          s4, t5, -24
                  fcvt.w.s     a2, ft7, rne
                  fmv.w.x      fa4, s0
                  fsub.s       ft6, fa3, fs5
                  fmax.s       fs10, ft8, fa7
                  srl          a0, s1, tp
                  remu         a6, s10, t4
                  sll          zero, s3, s3
                  auipc        t1, 660299
                  fsub.s       fs1, ft9, fs11
                  fmul.s       fs5, fs2, fs9, rtz
                  fle.s        t0, ft7, fa6
                  remu         s3, s9, a0
                  slt          s4, t5, s4
                  xori         a7, ra, 319
                  fmadd.s      ft6, ft1, fs1, ft4
                  fmax.s       ft11, fs3, ft5
                  feq.s        t5, fa4, fs6
                  andi         s8, s8, 1354
                  fnmsub.s     fs10, fs1, ft11, fa6, rmm
                  xor          ra, t2, s5
                  lui          t3, 91775
                  fadd.s       ft11, ft4, fs4, rup
                  fle.s        a1, fs0, ft3
                  fsgnj.s      fa1, fs0, fa4
                  and          zero, s9, a2
                  fcvt.w.s     tp, ft8
                  fmadd.s      ft2, ft7, fa0, fa5, rtz
                  srl          s0, s2, s1
                  feq.s        s5, ft9, ft7
                  div          a2, t0, a6
                  mulhsu       a2, a4, zero
                  fmax.s       fs5, fs6, ft0
                  fmin.s       ft6, ft10, ft6
                  fclass.s     s2, fa6
                  nop
                  sltu         t5, s9, s5
                  srai         s8, s4, 0
                  sltu         s9, s4, s3
                  nop
                  fsgnjx.s     ft8, fa6, fs11
                  fcvt.w.s     t5, fs1, rup
                  fclass.s     t1, ft1
                  fmin.s       ft2, fs5, ft6
                  add          a0, s11, tp
                  sltiu        ra, t1, 1587
                  fmv.w.x      ft2, t2
                  fcvt.s.w     fs10, a7, rmm
                  slli         gp, s4, 28
                  xor          a7, s10, s10
                  divu         s1, a1, gp
                  ori          t3, t5, -1147
                  or           t6, s7, s9
                  fsgnjn.s     fs6, fs6, ft6
                  slti         t0, a2, -1671
                  feq.s        sp, fs0, fs10
                  sub          tp, a3, s3
                  divu         t6, a3, t4
                  feq.s        t6, fa2, ft1
                  flt.s        t4, fs10, fs5
                  sra          a6, a0, s1
                  and          sp, t4, t4
                  xori         s10, t3, -551
                  fcvt.s.w     fs11, s2, rtz
                  feq.s        t5, fs4, fs2
                  sub          a1, s8, s4
                  div          s4, a1, s4
                  fsgnjn.s     ft5, fa4, fs5
                  rem          s6, t0, t3
                  fmin.s       fa4, fs5, ft8
                  fcvt.s.w     ft0, gp
                  fnmadd.s     ft4, fa7, ft3, fa4, rmm
                  div          t1, zero, s2
                  fsqrt.s      fa2, fs1
                  ori          s3, t1, 1735
                  fsub.s       fs2, fa7, fs7, rtz
                  fmadd.s      fs5, fa4, fs1, ft7
                  addi         t0, a3, -559
                  fadd.s       fs8, fa0, fs11
                  lui          t0, 731963
                  divu         t3, a4, gp
                  fle.s        a7, fa1, fs0
                  or           t6, s6, s10
                  fmsub.s      ft5, ft11, ft8, fa6, rup
                  or           s6, ra, a3
                  fsgnj.s      fa5, fs5, fa3
                  slt          t1, t3, s0
                  lui          s2, 256748
                  fsqrt.s      fa3, ft2
                  fsgnjx.s     ft11, fs8, fa2
                  fcvt.s.wu    ft10, s9
                  slli         t5, t5, 8
                  fclass.s     sp, fa1
                  mulhsu       s2, t4, s7
                  fsqrt.s      ft0, ft5
                  mulhu        a4, tp, s9
                  mulhsu       gp, t4, t4
                  fmsub.s      fs9, ft5, fa2, fa3, rtz
                  srli         t5, a3, 16
                  flt.s        s2, fs3, fa3
                  fcvt.wu.s    a7, fs2
                  fmul.s       ft5, fs11, fa1, rup
                  sra          s1, t1, s3
                  fcvt.s.wu    fa7, gp, rtz
                  slli         sp, s3, 1
                  fclass.s     s0, fa4
                  auipc        s6, 19031
                  nop
                  lui          a4, 321957
                  and          s2, s3, gp
                  sll          a3, s11, a1
                  sra          s5, tp, s5
                  flt.s        a1, fa5, fa3
                  andi         t0, s5, 1092
                  fnmadd.s     fs8, ft6, fs7, fa2, rdn
                  fnmsub.s     fs6, ft9, ft5, ft1, rtz
                  fmax.s       fa0, fa7, ft10
                  fmin.s       fs9, ft2, ft5
                  fsgnjn.s     fa0, ft4, fs1
                  fnmadd.s     fa1, fa6, ft0, ft6
                  fnmsub.s     fs7, fa3, fa1, fa4, rup
                  divu         t3, s3, gp
                  nop
                  mul          s0, a4, s8
                  slli         s9, t5, 20
                  fcvt.wu.s    a7, ft2
                  fsgnjx.s     fs8, fs8, fa3
                  div          s10, a0, sp
                  fcvt.wu.s    s4, fs2, rmm
                  nop
                  or           t5, s5, a2
                  fsgnjx.s     fa2, fs9, fa3
                  fmv.x.w      s5, fa0
                  fcvt.s.w     fs6, t3
                  fmv.w.x      fs4, a1
                  fcvt.s.wu    fs11, a3, rdn
                  feq.s        t5, ft0, fa2
                  sra          ra, s10, s9
                  sltu         tp, s1, tp
                  sub          s10, a4, tp
                  fmadd.s      fa1, ft3, ft3, ft9, rne
                  fdiv.s       ft5, fs6, fs3
                  srai         t3, a2, 13
                  slti         s8, s9, -634
                  fcvt.wu.s    ra, ft9
                  fcvt.wu.s    t5, ft1, rmm
                  feq.s        a2, ft8, fa5
                  addi         t5, a5, -517
                  fclass.s     a2, fa5
                  fmv.w.x      ft4, t1
                  fdiv.s       fs6, fs3, ft4, rmm
                  addi         s5, ra, 1074
                  fcvt.s.w     ft6, s2
                  rem          s1, s2, a2
                  sltiu        t6, a1, -461
                  fmul.s       fs3, fs11, ft0, rne
                  sltiu        a2, ra, 681
                  srli         s2, s3, 13
                  nop
                  fdiv.s       ft8, fa1, fs3
                  srl          a6, a5, s0
                  sub          a7, t2, s6
                  rem          t0, t0, s0
                  lui          gp, 111852
                  sra          a0, a1, a7
                  fmsub.s      fs11, fs6, fa3, ft0
                  and          a6, s7, a3
                  fsub.s       fs5, ft4, ft1
                  fdiv.s       fs2, fs1, fs6, rmm
                  rem          a2, t5, s11
                  div          t3, tp, a0
                  fle.s        t3, fs0, ft5
                  fmv.w.x      ft2, s2
                  fmsub.s      ft9, fa4, fs9, ft10
                  addi         s3, a6, -1132
                  fcvt.wu.s    s6, ft8
                  srl          a2, a4, s7
                  srli         s3, zero, 28
                  fadd.s       fs2, fs1, fa3
                  mulhsu       s8, s9, a0
                  slti         sp, t5, -19
                  fadd.s       fa2, fs6, fs5
                  and          s0, s6, a6
                  feq.s        t3, ft1, fa0
                  fdiv.s       ft5, fs7, fs0
                  fmsub.s      ft9, fa3, fs2, fa4, rmm
                  slti         a2, a0, -918
                  or           a1, t1, a3
                  addi         gp, zero, 319
                  add          a3, t0, a5
                  fnmsub.s     ft6, ft9, fs10, fs3, rne
                  auipc        s4, 763552
                  divu         s6, t3, s1
                  fclass.s     t6, ft4
                  fcvt.s.w     fa6, a4, rdn
                  fnmsub.s     fa7, fs11, fa6, ft7
                  sra          tp, s10, t0
                  div          zero, s2, t6
                  rem          a1, s8, zero
                  fmv.w.x      fs9, a6
                  mulh         a4, s6, a2
                  flt.s        a7, fs5, ft7
                  mul          a7, tp, s11
                  fsub.s       fa6, fa4, fs6, rne
                  and          gp, zero, a2
                  srai         a0, a0, 25
                  slli         a7, t0, 22
                  fmsub.s      fa6, fs5, fa3, ft4, rdn
                  slt          a5, a3, s2
                  fmax.s       fa4, fa7, fs11
                  sub          tp, a6, s0
                  sltiu        a4, a4, -307
                  srai         s6, a6, 14
                  and          a3, s9, a0
                  fsgnjn.s     fs5, fs9, ft4
                  fnmadd.s     fs2, ft8, ft5, fs5
                  addi         s10, a7, 568
                  ori          s6, zero, 1401
                  and          ra, t0, gp
                  fsgnjn.s     fa6, fa0, ft9
                  fnmsub.s     fs11, ft4, fa3, fa3
                  fmv.w.x      fs5, s11
                  divu         s8, s2, s5
                  fcvt.wu.s    a6, fa7, rtz
                  rem          t6, s3, t4
                  fcvt.s.wu    fa3, s2, rmm
                  remu         s6, a3, t1
                  lui          s5, 599219
                  fclass.s     gp, fs7
                  fcvt.s.wu    fs3, s10, rmm
                  fclass.s     s4, fs7
                  fmax.s       ft8, ft11, fa2
                  fsub.s       ft0, fs7, fs2
                  sra          s8, gp, t0
                  fmax.s       fs6, ft2, ft0
                  fmadd.s      fs6, ft11, fs3, fa2
                  divu         s2, t5, t1
                  srli         a1, zero, 8
                  fsgnjx.s     fa4, fs0, ft8
                  fmax.s       fs2, fs2, ft6
                  fsgnj.s      fs7, ft9, fs1
                  addi         a5, t3, 505
                  mulhsu       s8, s6, a6
                  fsgnj.s      fa6, fs1, fa0
                  feq.s        sp, fa4, ft10
                  fsgnjn.s     fa3, fa1, ft3
                  remu         s5, gp, a2
                  xori         gp, t0, 623
                  xor          s5, a6, s1
                  lui          ra, 569662
                  auipc        sp, 641869
                  sll          ra, a1, s3
                  addi         s4, s9, 66
                  fsgnj.s      ft1, fs0, fs4
                  fadd.s       fa1, fs11, ft11
                  fcvt.s.wu    fs11, tp, rtz
                  or           t1, ra, a2
                  rem          t3, t2, s1
                  lui          t0, 321793
                  auipc        zero, 398051
                  fnmadd.s     fa3, ft10, fs3, ft2, rup
                  fle.s        tp, fs9, fs3
                  sltu         t4, s1, s11
                  feq.s        t6, fs6, fs5
                  sll          tp, s10, s1
                  sub          a3, s1, sp
                  fcvt.s.w     fa0, t5
                  slli         s5, s2, 22
                  mulh         t4, t6, tp
                  fmax.s       ft0, ft9, ft2
                  fcvt.s.wu    ft9, s7
                  fmul.s       fa5, fs5, fa7
                  fmsub.s      ft0, fs7, fa7, fs4
                  srai         s3, t1, 27
                  fdiv.s       fa6, fa1, fa5
                  fcvt.s.wu    fa0, ra
                  slt          zero, s5, a0
                  lui          s3, 860646
                  fsgnj.s      fs8, fs3, fs10
                  fmv.w.x      fs0, s4
                  mul          a6, s4, t3
                  flt.s        a7, fs8, ft1
                  fclass.s     a1, ft10
                  fmadd.s      fs10, fs5, ft8, fs5
                  fnmadd.s     fs7, ft5, fa3, ft7, rne
                  fmul.s       fa0, fa7, fs11
                  fcvt.wu.s    s9, fs10, rup
                  xori         s5, t1, 1828
                  fmin.s       fs9, fa2, fa6
                  mul          zero, a6, t6
                  fcvt.s.wu    ft1, t5, rdn
                  srli         a0, t0, 28
                  fmv.w.x      fs3, a7
                  ori          zero, s3, 785
                  fnmsub.s     fs0, ft0, ft5, fs4, rmm
                  fcvt.wu.s    tp, ft1, rmm
                  fmsub.s      fs0, fa6, ft11, ft5
                  sll          sp, t2, s6
                  or           t4, s11, ra
                  fmul.s       fs8, ft4, fs10, rdn
                  srl          a4, s10, t2
                  flt.s        s10, fa4, fs8
                  xor          ra, t0, t6
                  fsgnj.s      ft3, fa5, ft5
                  rem          s6, s4, s1
                  fclass.s     a7, fs8
                  and          a4, tp, s6
                  srli         s2, a3, 14
                  or           t0, a5, s4
                  fmax.s       fs4, fs0, fa4
                  sltu         a5, t3, s5
                  srai         s2, a2, 10
                  fsgnjx.s     ft3, fa6, ft5
                  fle.s        s1, ft6, fs2
                  ori          a4, t2, -721
                  srli         s10, a3, 16
                  fnmsub.s     fs6, fs4, fs4, fs3
                  fclass.s     t3, fs2
                  fsgnjx.s     fa2, fa0, fs8
                  fsgnj.s      fs8, fs11, ft11
                  fmsub.s      fs8, ft1, fs4, fa0, rmm
                  ori          t3, s6, 305
                  fmv.x.w      a7, fs1
                  addi         a7, s6, 751
                  div          t1, a5, ra
                  flt.s        s4, ft10, fa2
                  fmv.w.x      fs1, zero
                  mulhu        s2, t4, s1
                  fnmadd.s     ft7, ft9, fs4, fs10, rdn
                  fle.s        a7, fs2, fs11
                  div          sp, gp, a5
                  sltiu        s4, t5, 84
                  addi         s8, t1, 1333
                  auipc        t3, 391302
                  mul          a1, s5, s1
                  sra          s6, s6, t1
                  fcvt.s.w     fa5, a1
                  slli         a0, s1, 12
                  addi         s4, tp, -2015
                  fmsub.s      fa5, fs1, fa2, fs3
                  auipc        sp, 553748
                  fsqrt.s      ft6, fs7, rne
                  sltiu        sp, s11, -1304
                  fnmadd.s     fs5, fs11, ft6, fa2, rup
                  mul          s10, a6, s2
                  mulhsu       t5, s9, a5
                  slli         a2, ra, 8
                  srai         s3, t2, 1
                  feq.s        a6, fa0, fa4
                  feq.s        a4, fs11, ft9
                  mulhu        a0, t2, zero
                  srl          t5, t6, a7
                  or           t1, s11, s8
                  or           a5, t3, s2
                  fnmsub.s     fs11, ft4, ft3, fa6, rne
                  srli         s9, s1, 27
                  flt.s        s6, fa0, fs8
                  fmin.s       fa2, ft1, fs11
                  addi         t4, gp, -957
                  fnmsub.s     ft11, ft5, fa2, ft5
                  fsgnjn.s     ft6, ft6, ft4
                  fcvt.w.s     s5, fa5
                  srl          s8, ra, gp
                  fcvt.s.wu    ft8, s5, rmm
                  fsgnjx.s     fs9, ft5, ft8
                  fmsub.s      ft6, fs4, fs4, ft1, rne
                  sltu         s8, gp, s0
                  fadd.s       ft10, fa7, fa7
                  mulhsu       zero, t1, s11
                  auipc        zero, 52912
                  xor          t0, t2, t3
                  fadd.s       ft6, fa2, ft6
                  mulhsu       a5, a2, t5
                  or           a4, a1, zero
                  addi         t0, t4, 1115
                  sra          zero, s1, a4
                  add          s0, t0, a0
                  fadd.s       ft7, ft9, ft5, rdn
                  fsgnjx.s     fa4, fs10, ft5
                  auipc        a5, 926965
                  lui          s3, 182330
                  remu         gp, a7, zero
                  slt          s2, a5, t3
                  mulh         t6, t6, ra
                  fsgnjx.s     ft7, fa0, ft8
                  xori         s4, s5, 55
                  slli         t5, a1, 9
                  nop
                  sltu         a6, a6, s11
                  andi         t3, s3, 361
                  fnmsub.s     ft2, ft6, fs7, fa1
                  fmax.s       ft7, ft11, fs2
                  fsgnj.s      ft6, ft4, fa5
                  remu         a5, s8, s10
                  rem          s9, s11, a5
                  fmax.s       fa2, fs0, fs1
                  fnmadd.s     fs4, fs1, ft7, ft10, rup
                  sltu         s0, sp, a0
                  fmin.s       fa5, ft8, ft7
                  xor          a4, t2, a4
                  slt          a4, a3, a3
                  srai         a1, s10, 21
                  addi         a1, tp, 705
                  fsub.s       ft2, ft7, ft11, rup
                  fcvt.s.wu    fa6, a0
                  fmadd.s      ft6, ft11, fs1, ft8, rdn
                  ori          a2, a1, -1914
                  andi         s2, t4, 1062
                  srl          s5, sp, a1
                  fmul.s       ft8, fs11, fa0, rne
                  nop
                  addi         s0, a0, -180
                  sra          a2, a6, a2
                  remu         a0, a6, t2
                  fnmsub.s     ft9, fs10, fs4, fa5, rup
                  fmax.s       fa3, ft9, fs11
                  rem          t3, s0, s7
                  fmadd.s      fs3, ft7, fs3, ft2
                  addi         s10, s11, -40
                  xori         t3, a3, 13
                  fmul.s       fs5, ft5, ft0
                  mul          a3, t4, t1
                  fnmsub.s     ft3, ft8, fs10, ft11, rtz
                  feq.s        ra, fs4, fs4
                  sll          t3, t1, s8
                  sub          s1, t0, s3
                  add          a2, s4, a0
                  lui          s8, 86631
                  sub          t1, zero, t5
                  add          t3, s0, tp
                  fclass.s     zero, ft10
                  fsub.s       fs5, ft5, ft11
                  add          s3, a2, a5
                  fmsub.s      fs11, fa3, fs1, ft1, rdn
                  fcvt.w.s     a2, fs2
                  fmul.s       ft2, fs3, fs5
                  fmul.s       ft4, fa7, ft8
                  add          s0, t2, t1
                  fsgnjx.s     fs9, fa4, fa5
                  and          sp, t0, t5
                  auipc        a3, 190387
                  fle.s        s5, fa0, fa6
                  fclass.s     t6, ft2
                  mulhsu       t3, sp, t1
                  fcvt.w.s     t1, fs8, rdn
                  fnmsub.s     fs4, ft10, ft0, ft9
                  xori         zero, t2, -312
                  mulhsu       a0, t4, t2
                  remu         t3, s2, t5
                  fcvt.s.wu    ft3, t6
                  srli         s10, a7, 22
                  fnmsub.s     fa7, fs2, fs5, fs4, rup
                  div          s6, a0, a0
                  andi         ra, s10, -1298
                  fmv.w.x      fs1, a0
                  lui          s0, 169175
                  divu         a4, s1, ra
                  fsgnjx.s     fa5, ft10, ft7
                  fcvt.w.s     s4, fs2, rtz
                  fsub.s       ft2, ft3, fa2
                  fmax.s       ft5, fa1, fs3
                  div          a5, s0, a4
                  fadd.s       fs3, fs0, fa3
                  fmin.s       fs3, ft7, ft0
                  feq.s        sp, fs7, fs8
                  mulhsu       a6, a1, gp
                  nop
                  and          s5, sp, s10
                  fcvt.w.s     a5, ft3
                  fmv.x.w      a0, fs5
                  fmadd.s      fs3, fa5, ft2, fs0
                  fcvt.s.wu    fs4, sp
                  fnmsub.s     fs10, fa0, ft1, fa5, rtz
                  slt          t4, t5, t5
                  fsub.s       fa2, ft7, fs0, rup
                  fmsub.s      ft3, fa0, ft2, ft0, rtz
                  fsgnjn.s     fs3, ft8, fs1
                  fsgnjx.s     ft3, fa4, fs6
                  fclass.s     s0, ft10
                  lui          t4, 554770
                  fnmadd.s     ft0, fa4, fs8, fa3, rdn
                  fle.s        t6, fs6, ft1
                  fsgnjn.s     ft8, fs2, fa7
                  fsgnj.s      fs5, fa0, ft2
                  srai         s6, gp, 6
                  remu         t0, t5, a6
                  fsub.s       ft9, fs5, fs11, rtz
                  div          sp, a5, t1
                  remu         s3, ra, t5
                  fcvt.wu.s    s3, ft4, rup
                  feq.s        s9, fs8, fs6
                  mulh         s6, s3, s0
                  fsgnj.s      ft1, ft11, fs3
                  nop
                  sltiu        a0, s11, 1797
                  fmv.w.x      fs3, s7
                  nop
                  mul          t6, gp, a2
                  xor          s2, s7, s8
                  fmin.s       ft1, fa0, fa6
                  fmv.x.w      s4, fs3
                  xori         a2, s11, 1638
                  sra          zero, s2, s6
                  feq.s        t4, fs6, ft5
                  slti         t5, tp, -798
                  fcvt.wu.s    s6, ft11, rne
                  srl          s5, sp, s1
                  fmsub.s      fs0, fs7, ft7, fs6
                  rem          t0, t2, ra
                  slt          t1, a7, a6
                  fcvt.wu.s    a7, ft0, rmm
                  slti         s3, s8, 644
                  fmv.w.x      ft10, s3
                  fmul.s       fs11, fs0, fs3, rup
                  add          a2, s4, tp
                  fmv.w.x      fs10, ra
                  xori         a5, a5, -2026
                  sltiu        t4, t5, -1658
                  feq.s        a0, fs6, fa0
                  xor          t4, s3, zero
                  fmv.w.x      fs8, a1
                  add          a0, s5, ra
                  fdiv.s       fa2, ft9, ft6, rtz
                  mul          a7, a5, a1
                  auipc        a4, 152453
                  sub          s1, s0, zero
                  mul          gp, tp, tp
                  remu         s6, s6, t6
                  fdiv.s       ft1, fs7, ft3, rmm
                  fmsub.s      ft0, fa1, fa2, fs5
                  divu         sp, a5, t5
                  slli         s1, a6, 16
                  fcvt.wu.s    s5, fs3
                  fsgnjx.s     ft7, fs7, fa2
                  add          sp, s11, s2
                  sltu         a7, a2, a5
                  remu         t4, s4, a3
                  fmsub.s      fs10, fs6, ft6, fa0, rup
                  and          a7, a2, tp
                  mulhu        t6, t0, t4
                  sltu         a4, s2, s1
                  fcvt.wu.s    s5, fa6
                  fmax.s       ft6, ft1, fs10
                  fadd.s       fs10, fs2, ft0
                  fnmsub.s     fs7, ft6, ft7, fs11
                  rem          ra, ra, ra
                  or           s8, t0, s7
                  mulh         t4, tp, s0
                  fmadd.s      fa1, fs9, fa7, fs11, rtz
                  fadd.s       fs6, fs5, ft1
                  divu         t5, gp, a4
                  fsqrt.s      ft5, fs7, rne
                  sltu         s5, a5, zero
                  fmin.s       fs9, ft3, fa3
                  rem          zero, t5, s10
                  fdiv.s       ft0, fs11, fs2
                  sltu         s8, a7, s6
                  srli         t1, s10, 18
                  andi         sp, t6, 815
                  fmv.x.w      s1, fs0
                  divu         a4, a6, s9
                  add          a1, a4, s8
                  nop
                  fsgnjn.s     ft9, fs8, fs5
                  fcvt.wu.s    t5, fs7, rtz
                  divu         a5, ra, sp
                  sltiu        s6, t6, 96
                  srai         tp, a6, 18
                  addi         s10, t0, -1521
                  fmin.s       ft8, ft1, fa2
                  fcvt.wu.s    t6, fs8
                  or           ra, t2, s0
                  and          sp, gp, t3
                  rem          t3, a2, a7
                  nop
                  fle.s        t3, ft1, fs3
                  fcvt.wu.s    s9, fs8, rdn
                  fsgnj.s      fa2, fs7, ft9
                  fcvt.s.w     ft10, a4, rne
                  sub          a1, s4, s7
                  nop
                  slt          a2, gp, s5
                  auipc        s1, 435830
                  slli         s9, a0, 27
                  auipc        a5, 212795
                  xori         s2, sp, 1019
                  xor          a3, a7, t3
                  div          s10, a6, s8
                  xor          ra, s10, t1
                  divu         a3, t0, s5
                  sra          t1, s4, s9
                  fmsub.s      fs5, ft3, fa7, fs4, rtz
                  ori          a0, s7, 1034
                  auipc        t5, 425518
                  ori          gp, a0, -1311
                  div          t3, sp, t5
                  lui          s3, 604124
                  sub          s4, s11, a4
                  fcvt.s.w     fa4, t2
                  nop
                  fnmadd.s     ft7, fa5, ft4, fa1, rdn
                  sltu         t4, a4, a4
                  addi         a6, t0, -804
                  sll          s10, t2, t0
                  nop
                  slti         s10, t5, 1976
                  ori          s8, s5, -750
                  addi         tp, s10, 1747
                  sub          s3, a7, a7
                  fmadd.s      fa6, fs2, fa0, fs1
                  addi         s3, t2, -388
                  or           a6, t2, s1
                  sll          gp, s1, gp
                  div          a3, t3, t5
                  lui          a0, 136876
                  sll          gp, t0, a6
                  sltu         t3, ra, s9
                  xori         t4, a5, -90
                  mulhu        sp, a3, s1
                  sltu         t0, s5, t0
                  fsgnj.s      fa5, fs5, fs9
                  or           a2, a7, t6
                  slt          s1, tp, s2
                  fsgnjx.s     fa3, fs9, fa7
                  addi         s6, s2, 1001
                  fclass.s     t5, fs7
                  srli         ra, a5, 12
                  fnmsub.s     fs11, fa6, ft8, fa2
                  feq.s        a7, fs10, fs2
                  fmul.s       fa4, ft11, fa5, rtz
                  fsqrt.s      fs8, fa7, rne
                  fnmadd.s     fa0, fa0, fs1, fs0, rup
                  feq.s        t0, ft4, fa5
                  or           t6, t1, s4
                  divu         zero, s11, a1
                  fadd.s       fa3, fs3, fa2
                  srli         a5, t0, 20
                  fmin.s       fa7, ft4, fa5
                  sltu         s10, s11, s7
                  divu         s10, ra, a0
                  feq.s        a2, fs10, fa0
                  div          a4, s11, t5
                  fcvt.wu.s    s6, fs3, rmm
                  fcvt.wu.s    s0, fa6, rne
                  fnmadd.s     fs5, fs5, fs8, fs4
                  fmin.s       ft2, fa4, ft3
                  fcvt.s.wu    ft11, s8
                  fnmadd.s     fa7, fa5, ft8, fs11, rne
                  fmax.s       fs2, fa1, fa4
                  nop
                  fmv.x.w      sp, ft4
                  remu         gp, t3, t2
                  and          zero, s3, s0
                  remu         s10, zero, s0
                  fsgnj.s      ft0, ft4, ft11
                  mul          a4, zero, s5
                  fmv.w.x      ft4, s4
                  fmul.s       fs2, fa2, fa1
                  srli         s10, t0, 0
                  xor          a7, t3, s6
                  mulhsu       zero, tp, a4
                  fsub.s       ft11, ft1, fa3
                  fsgnj.s      fs1, fs0, fs10
                  fle.s        s10, fs8, ft9
                  sltiu        a5, s2, 1568
                  fcvt.wu.s    t1, ft11
                  slt          s8, t3, a6
                  fcvt.s.w     fa7, a5
                  fadd.s       fs7, ft6, ft9
                  fmin.s       fs5, fa0, ft8
                  xori         t3, a3, -1224
                  fdiv.s       fa7, fs7, fs7, rmm
                  fmul.s       fa0, fs4, fs2
                  divu         t1, s3, t3
                  sll          a0, t3, s9
                  fsub.s       ft9, fs10, ft5, rtz
                  fnmsub.s     fa5, fs9, fa7, fs4, rup
                  fmax.s       fs6, fa4, ft9
                  sltiu        s4, s2, 964
                  rem          t3, t3, s1
                  fmv.w.x      fs7, a0
                  fnmsub.s     ft10, fa4, ft10, fs3, rup
                  remu         a0, t3, sp
                  mulh         s2, s8, a2
                  sub          t3, a5, tp
                  slli         s5, t4, 12
                  slti         s6, a7, -1389
                  divu         t1, tp, a7
                  srli         s10, a2, 14
                  fmax.s       fs10, fs2, fa1
                  fnmsub.s     ft5, fa7, ft0, fs3
                  srli         zero, s1, 24
                  sra          s3, zero, s4
                  andi         a0, s11, 1044
                  fmin.s       fa6, fs0, ft5
                  fmv.w.x      fa4, t4
                  fcvt.wu.s    t3, fs5
                  srl          s2, a4, t0
                  slli         a7, a6, 21
                  fcvt.w.s     a2, fs6, rmm
                  mulhsu       t6, sp, t2
                  xor          a6, a2, t3
                  divu         t0, a6, t3
                  fle.s        s6, ft0, fa7
                  fclass.s     s9, ft5
                  fdiv.s       fs7, fs3, fs9, rmm
                  auipc        a7, 948040
                  xori         t5, s4, 1087
                  fdiv.s       fa0, fs11, fs6, rne
                  fmsub.s      ft4, fa4, fs0, ft2, rtz
                  fsgnjx.s     fa4, ft8, fs7
                  xor          sp, a1, a6
                  and          t6, t6, a4
                  fadd.s       fs0, ft7, ft6, rne
                  fmsub.s      fa3, fa4, fa3, ft7
                  sltu         t1, a5, t2
                  fnmsub.s     fa5, ft4, ft3, ft6, rne
                  remu         s0, s8, a6
                  flt.s        t4, fa4, ft6
                  fadd.s       ft7, ft2, ft0, rmm
                  fmv.x.w      a5, fs10
                  fadd.s       fs5, ft10, fs2
                  sll          a6, t5, t6
                  fmul.s       ft2, ft9, ft6, rup
                  fmv.w.x      ft0, a2
                  lui          a0, 380772
                  srl          a4, s9, tp
                  fsqrt.s      fa7, fs3
                  mul          a4, s10, s6
                  sub          t0, sp, a4
                  ori          a7, a6, 1403
                  andi         zero, s6, 971
                  lui          ra, 206869
                  div          s6, a5, s6
                  rem          s0, t3, sp
                  fnmsub.s     fs9, fs11, fa0, fs5
                  fnmsub.s     fa2, ft10, fs7, ft3
                  remu         t4, s8, a2
                  mulhsu       s8, s7, a3
                  lui          ra, 352713
                  fcvt.s.wu    fs10, t0, rdn
                  fmadd.s      fs9, fa7, fs3, fa4, rup
                  mulhu        tp, s5, zero
                  add          a0, s10, a2
                  andi         t0, a2, -753
                  ori          sp, t4, 1140
                  remu         t4, t0, sp
                  fsgnj.s      ft1, fa0, ft1
                  slli         tp, s4, 4
                  addi         s9, s0, 1522
                  fmsub.s      fa4, fa1, ft7, fs2, rne
                  fmsub.s      fs9, fs11, ft4, ft0
                  sltiu        t5, s7, -523
                  fsgnjx.s     fa5, fs7, ft10
                  fsgnjn.s     fs10, ft11, ft8
                  fle.s        a6, fa4, fs9
                  fcvt.s.wu    fs7, s9, rmm
                  or           t4, t4, a2
                  xor          a0, s7, s1
                  srai         t5, t6, 20
                  fnmadd.s     fa3, ft10, ft0, fs2, rdn
                  rem          a6, a4, t0
                  andi         s10, t6, -835
                  mulh         s6, s9, a7
                  mulhsu       a4, a6, a3
                  fcvt.wu.s    s9, fa7, rmm
                  fdiv.s       fs10, fa7, fs3
                  fmv.x.w      sp, fa1
                  srl          gp, s11, t0
                  sltiu        t5, s8, -857
                  fmadd.s      fs10, fa5, ft9, fa0, rmm
                  mulhu        s1, a4, a5
                  fsgnjx.s     fs10, fs7, ft2
                  fcvt.wu.s    s0, ft8
                  fsub.s       fs9, fa6, fa1, rmm
                  sra          a7, t5, s5
                  slli         zero, s11, 4
                  sra          s3, t2, a7
                  add          t1, s6, a0
                  addi         s3, a0, 726
                  mulhu        a3, s8, s10
                  fmv.x.w      t3, fs10
                  fmv.x.w      ra, fa7
                  slt          t3, gp, t6
                  flt.s        s2, ft6, fs4
                  fcvt.wu.s    sp, fs8
                  addi         zero, gp, -1431
                  sra          s6, a4, s3
                  fmadd.s      ft6, ft10, ft5, fs0, rtz
                  sub          a4, s3, s5
                  div          a1, tp, s8
                  fmin.s       fa4, fs0, fs2
                  lui          gp, 74601
                  fnmadd.s     ft6, ft7, ft4, fa5, rdn
                  mulhsu       a6, s6, sp
                  auipc        s3, 507780
                  add          a7, s10, a0
                  sltiu        s2, a0, -911
                  fsqrt.s      fs5, fa2
                  fsgnjn.s     fa0, ft8, fs0
                  fmv.x.w      zero, ft0
                  srl          s3, sp, a0
                  fclass.s     a3, ft1
                  fcvt.s.w     fs2, s5
                  fcvt.w.s     s4, fs7
                  slt          gp, s6, t0
                  fcvt.s.w     fs8, t3
                  fsqrt.s      fs11, fa0
                  fcvt.wu.s    s1, ft9
                  fnmsub.s     fs7, ft6, fa7, fa1, rup
                  fmsub.s      ft1, fs9, fs6, fs0
                  addi         t4, s9, 1543
                  fsub.s       fa1, fa3, fs10
                  mulhu        a5, a6, gp
                  fmv.x.w      tp, ft11
                  fmadd.s      fs0, fs3, fa7, fs10, rtz
                  flt.s        t1, fa4, fa0
                  fmv.x.w      a6, ft7
                  add          a3, t6, t1
                  fnmadd.s     fs0, fa5, fa4, fa7
                  or           a7, a3, t3
                  fadd.s       fa2, fs8, fa3
                  sltiu        a6, s2, 1330
                  lui          a2, 673066
                  fsgnj.s      ft1, fa2, fa7
                  auipc        gp, 881387
                  fsub.s       fs1, fs8, fs9, rmm
                  ori          s3, a1, -910
                  fmv.x.w      t4, fa7
                  fsgnj.s      fa4, fa1, fa7
                  fmax.s       fs5, ft9, fs8
                  srli         s6, ra, 16
                  slti         a7, s8, -882
                  and          s10, ra, zero
                  sltu         a3, s1, s9
                  srl          s6, t1, s1
                  mulhsu       a4, a0, s10
                  slli         s9, gp, 18
                  srai         t5, s5, 0
                  slti         sp, a0, 1791
                  fadd.s       ft11, fa4, ft3
                  divu         s1, a6, a4
                  srli         s5, s0, 11
                  fsqrt.s      ft7, fs11, rmm
                  sltiu        s1, tp, 1990
                  feq.s        s0, fs10, ft1
                  fcvt.s.w     fs5, s2
                  srai         a2, t4, 31
                  andi         a5, s0, -1305
                  or           t0, a3, a1
                  fle.s        t3, fs11, fs8
                  fnmsub.s     fs9, ft10, fa1, fs10
                  fle.s        a4, ft5, ft9
                  fle.s        t5, fs10, fs2
                  div          a3, zero, s5
                  div          s0, s5, a3
                  mulh         t1, t1, s9
                  andi         t4, s4, -1258
                  sra          a6, t6, s1
                  remu         s3, s6, s7
                  xori         tp, t3, 500
                  fsub.s       ft9, ft11, ft7
                  fnmsub.s     ft6, fs3, ft3, fs3
                  fnmsub.s     ft11, fa0, ft7, ft10
                  addi         s1, s1, 1516
                  fdiv.s       fs0, fs6, fs3, rdn
                  ori          s5, s11, 370
                  mulhsu       sp, s8, gp
                  fle.s        a7, fs4, fa2
                  addi         s1, a6, 1945
                  fadd.s       ft0, fs10, fs9
                  fmv.x.w      s4, fs11
                  or           a5, a0, a7
                  mulhsu       s4, sp, tp
                  rem          sp, t0, t5
                  srai         t3, a3, 11
                  fdiv.s       fs1, fa7, ft6, rdn
                  fmul.s       ft2, fs8, fs4, rup
                  srl          t3, gp, a7
                  fcvt.s.wu    fs3, t0
                  add          a3, s3, tp
                  fmul.s       fs0, fs3, fa2
                  ori          a3, t6, -469
                  feq.s        s0, ft10, fa0
                  div          a2, t6, t2
                  fmadd.s      fs2, fs3, fs10, fs1, rmm
                  fmin.s       fa5, fs3, fs10
                  fmul.s       fa2, ft3, ft2, rdn
                  mulhsu       s4, s10, s9
                  fmadd.s      fs11, ft11, ft1, fs1
                  mul          zero, s10, a2
                  mulhu        gp, t0, t0
                  fadd.s       fs4, fa6, ft7, rup
                  fcvt.wu.s    s2, ft4, rdn
                  nop
                  fnmadd.s     fs8, ft5, fs5, ft9
                  fmsub.s      ft8, ft9, fs3, fs8, rtz
                  srli         a5, a2, 8
                  remu         a7, t1, a5
                  add          s3, t6, gp
                  auipc        s6, 541795
                  fle.s        ra, ft2, ft10
                  ori          s5, t2, -2007
                  fcvt.s.wu    ft10, t6, rmm
                  fsgnjx.s     fa2, fa2, fa0
                  fsgnj.s      fs4, fa2, fs11
                  ori          a6, t2, -430
                  mulhu        s4, s6, a6
                  lui          s0, 1013178
                  div          a4, t3, zero
                  slli         a5, sp, 28
                  fclass.s     a2, ft7
                  fsgnj.s      fs7, fs4, ft8
                  sll          s5, a5, a1
                  mulhsu       a0, s3, s6
                  and          a2, a6, s3
                  fmv.w.x      ft9, ra
                  xori         tp, t2, -35
                  srai         s0, s8, 5
                  slti         ra, s9, 1427
                  mul          a0, s7, a3
                  xori         a3, t2, 39
                  remu         a6, s2, s8
                  divu         a3, s4, a3
                  sltu         t4, t5, ra
                  fle.s        sp, fs8, ft2
                  div          a2, zero, s2
                  sltiu        t6, zero, -845
                  mulhsu       a7, s0, t3
                  rem          a4, sp, s3
                  fmul.s       fs9, ft7, fs2
                  mulh         t5, ra, zero
                  fmin.s       fs7, fs1, ft4
                  and          s5, a0, sp
                  sra          s2, tp, s9
                  mulh         s1, s9, s3
                  mulhsu       s4, t6, a2
                  fcvt.s.wu    fs6, s4
                  rem          t0, a0, a4
                  fsgnj.s      fa4, fs10, fa5
                  sltiu        s4, s8, -1734
                  add          gp, t5, s7
                  andi         tp, s7, 187
                  nop
                  sub          t3, s4, t0
                  fclass.s     s4, ft2
                  divu         a5, s7, a0
                  feq.s        a1, fs10, fs3
                  or           s1, sp, s8
                  mulhu        s10, a4, s11
                  fmax.s       fa7, fs10, fs1
                  fsgnj.s      fs9, fs6, ft2
                  fcvt.w.s     a5, fs3
                  auipc        s1, 70600
                  sra          a3, s4, a0
                  rem          tp, t3, a3
                  fnmsub.s     ft10, ft7, ft9, fs9, rup
                  fsgnjx.s     fs4, ft5, ft1
                  fnmadd.s     ft8, ft5, ft6, fa7
                  srai         t0, s3, 28
                  xori         s10, a2, 642
                  addi         s8, s5, 1718
                  sltu         zero, a6, sp
                  lui          tp, 951673
                  feq.s        a7, fs4, fs3
                  srli         s0, a0, 10
                  fadd.s       ft1, fa4, ft7, rtz
                  fdiv.s       ft3, fs7, fs6, rup
                  fsgnjx.s     ft8, fs11, fa3
                  fcvt.s.w     fa1, sp, rne
                  sll          gp, s5, s2
                  fsgnj.s      fs4, ft5, fa5
                  and          s5, s6, s0
                  add          a7, t2, gp
                  rem          t1, s3, s10
                  fcvt.w.s     a0, ft9, rtz
                  lui          t0, 228420
                  sub          ra, s5, s2
                  slli         t5, t1, 6
                  mulhu        a5, t6, s7
                  fnmsub.s     ft1, ft6, fa7, fa1
                  mulhu        s10, s10, s1
                  remu         s3, t0, s7
                  ori          a5, s6, 1209
                  xor          a2, tp, a1
                  srl          s0, s10, a6
                  fadd.s       fa7, fs10, fa6
                  add          t0, a0, s6
                  xori         s8, s5, 868
                  srli         s4, t0, 16
                  fsub.s       fa1, fa6, fs3, rup
                  slli         t5, t2, 10
                  slli         a1, t0, 9
                  fadd.s       fa3, fa5, fa5
                  xor          a2, t4, t1
                  fmin.s       fs5, ft7, fs6
                  fmadd.s      fs4, fa6, fs11, ft10
                  rem          ra, a6, s11
                  srl          s2, ra, a1
                  slt          s5, a3, t2
                  fsub.s       fs7, fa7, ft6
                  or           a1, s9, a6
                  srai         a6, s8, 17
                  sll          s5, zero, t2
                  fmv.x.w      s1, fa7
                  fmv.x.w      zero, fs6
                  slli         sp, t6, 7
                  fmax.s       ft4, fa6, ft7
                  fmax.s       fa5, fs2, fs9
                  sra          s1, t5, a4
                  fmv.w.x      fa2, s10
                  or           a4, t5, t3
                  fsqrt.s      fs5, fs10, rup
                  fmsub.s      fs2, ft0, fs0, ft5, rup
                  mulhu        a2, a6, a2
                  add          t6, t4, a0
                  fmv.w.x      ft0, s5
                  fdiv.s       ft3, ft10, fs6
                  srl          t0, s10, s5
                  div          t1, s6, s9
                  addi         t5, zero, -676
                  andi         t1, t6, 1741
                  feq.s        t1, fa1, fs7
                  rem          t3, ra, s3
                  sub          s3, a4, t3
                  sltu         s2, a5, t0
                  fmsub.s      ft10, fs1, fs0, fs6
                  add          s8, t0, s5
                  auipc        gp, 120507
                  srl          sp, t6, s3
                  sltu         s3, a4, s1
                  fcvt.w.s     gp, fs4, rne
                  sltu         t0, s4, ra
                  sltiu        a7, a2, 1090
                  fmv.x.w      s6, fs3
                  fsgnjx.s     ft4, ft5, fs2
                  lui          zero, 312494
                  slt          t4, zero, sp
                  sltu         s3, s6, s2
                  fsgnjn.s     ft0, fa2, ft0
                  fmadd.s      fs10, fs9, fs4, fs8, rup
                  fcvt.wu.s    s2, fs4
                  ori          a2, ra, -1250
                  sltu         a1, s3, s7
                  sltiu        s9, a7, -118
                  and          tp, s9, s10
                  fmv.w.x      ft10, s2
                  slti         a2, ra, 1003
                  fmv.x.w      s8, fs9
                  div          s1, s10, s2
                  srli         a3, t3, 29
                  srai         t4, s0, 19
                  fcvt.w.s     t1, fs2
                  or           t4, s6, a4
                  sub          s0, t0, s2
                  slti         a5, t5, -1433
                  xori         s8, t1, 855
                  slt          s9, a4, s8
                  divu         s4, a3, a7
                  srl          s3, t6, a1
                  or           s3, s5, a4
                  fnmsub.s     fs11, ft5, ft0, ft4, rup
                  fclass.s     s4, fs11
                  feq.s        zero, ft5, fs6
                  srai         t6, t6, 31
                  fsgnj.s      fa2, fa3, fa0
                  sll          a0, s11, s10
                  fnmadd.s     ft0, fa3, fa6, fa4, rtz
                  fmul.s       ft11, fs4, ft8, rup
                  fadd.s       fs1, ft1, ft4, rup
                  fcvt.wu.s    ra, fs2, rup
                  srai         gp, sp, 0
                  fmax.s       fa7, ft1, fs8
                  ori          s1, gp, -1092
                  remu         a4, t1, a1
                  mulhsu       s10, zero, sp
                  fcvt.w.s     ra, fs11, rne
                  xori         a1, tp, 1321
                  fsgnjn.s     ft10, ft0, ft0
                  feq.s        a5, fs8, fs4
                  auipc        s1, 893242
                  fmin.s       fs3, fs11, fs4
                  fcvt.w.s     s6, fs9, rup
                  fmv.w.x      fa4, t6
                  slli         t6, ra, 4
                  ori          ra, zero, -1465
                  srai         a1, a7, 12
                  slti         s4, t5, 606
                  fsub.s       fs9, ft9, fa1, rup
                  srli         t5, t3, 24
                  flt.s        a7, fa0, ft6
                  flt.s        t1, ft7, ft6
                  fnmadd.s     fa4, ft5, fs2, fa6, rdn
                  and          s6, s0, a2
                  feq.s        s9, ft6, fs8
                  fcvt.s.wu    fa0, s5, rdn
                  sub          s9, s4, zero
                  fmax.s       ft8, ft5, fs7
                  nop
                  fadd.s       fs6, fs8, fa5, rne
                  divu         a2, t1, a1
                  andi         s1, t6, -262
                  fsgnjn.s     fs1, ft2, ft6
                  fsqrt.s      ft6, fa0, rdn
                  mul          t3, s10, a0
                  fadd.s       ft11, ft5, fs4
                  slt          a4, t0, s3
                  fnmadd.s     ft10, fs8, ft3, fs6
                  sltu         a4, a1, s10
                  sub          sp, s8, s5
                  fsgnjx.s     fa7, fs11, fs0
                  flt.s        s4, fs3, ft2
                  sra          a3, t6, t4
                  nop
                  sll          s9, s11, s4
                  fcvt.s.w     fa0, gp, rup
                  sra          a6, t5, t1
                  fdiv.s       ft2, fs11, fs8, rmm
                  fsub.s       ft5, fs10, ft1, rup
                  srli         t5, a1, 23
                  sll          s1, s1, t3
                  rem          t4, t0, t6
                  srai         s8, tp, 15
                  remu         a0, t6, ra
                  mulh         t3, sp, s10
                  fsub.s       fa6, fa3, fs9, rne
                  fnmsub.s     fs0, fs7, fs5, fa6
                  fmax.s       fa7, fs6, ft8
                  mulh         t3, s5, t5
                  or           a2, a0, s10
                  rem          ra, t3, a2
                  and          ra, t5, s3
                  remu         gp, s9, sp
                  fle.s        s8, fs0, fa6
                  fmsub.s      fa4, fs9, fa1, ft3
                  andi         s9, s0, 516
                  fsgnj.s      ft4, ft8, fs10
                  fsqrt.s      fs3, fs4, rtz
                  fcvt.s.wu    fs3, t4
                  and          a7, t1, a4
                  add          s10, tp, s4
                  fsgnjn.s     fs10, fs1, fs7
                  xori         a4, t5, 289
                  fcvt.w.s     s2, ft1
                  fsgnj.s      ft1, fs3, fa7
                  lui          t0, 419128
                  fcvt.w.s     s10, fa6
                  or           t6, t4, a0
                  fadd.s       fa6, fa0, fa2, rdn
                  fmsub.s      ft1, ft11, fa7, fs11, rne
                  mulhsu       ra, s2, a4
                  fle.s        s8, fa1, fs4
                  slli         s4, sp, 19
                  mulh         t4, zero, a0
                  slli         ra, s4, 30
                  fsqrt.s      fa6, fs0
                  fsqrt.s      ft6, fa1
                  auipc        gp, 160808
                  divu         a1, s7, s4
                  mulhsu       ra, a6, s0
                  srai         s3, s9, 18
                  and          s0, a0, s11
                  fsgnjn.s     fa4, ft11, fa3
                  fmadd.s      fa2, fs9, ft7, fa4, rtz
                  fmadd.s      fa0, fs9, fa1, fa1
                  sll          a6, s8, s6
                  mulhu        s0, s0, s10
                  mulhsu       s10, s2, s4
                  fadd.s       fa1, fs5, ft9, rne
                  srai         a7, s4, 10
                  remu         tp, t2, zero
                  srli         a3, s1, 29
                  slli         a0, ra, 14
                  sll          a4, s6, s7
                  nop
                  fsqrt.s      ft4, fa4
                  fdiv.s       fs3, ft3, fs9, rmm
                  xor          zero, t1, a3
                  nop
                  fclass.s     t1, ft0
                  fle.s        a1, ft11, fa0
                  srli         s10, t4, 12
                  sltu         s0, zero, s9
                  fmadd.s      fa4, ft8, fs5, fa0, rdn
                  fsqrt.s      fs5, fa5
                  srl          s8, a1, a3
                  fclass.s     s2, fs11
                  sub          a7, a5, a7
                  mulhu        s3, s4, a3
                  sll          s4, t2, tp
                  feq.s        a5, fs7, fa5
                  nop
                  or           a6, s6, a2
                  and          a7, s6, t5
                  feq.s        t1, fs10, ft0
                  slli         t0, s2, 16
                  fmsub.s      ft11, ft7, fs1, fa7, rne
                  fmin.s       fs11, fa5, ft8
                  fmax.s       fs4, ft4, fa3
                  nop
                  fsgnjn.s     ft3, fs6, ft0
                  fdiv.s       fa0, fa0, fa6
                  addi         s9, s8, -302
                  and          t5, s8, a7
                  fcvt.wu.s    t1, ft7, rmm
                  or           a6, gp, a6
                  fdiv.s       ft0, fa7, fa2, rtz
                  addi         sp, a4, -205
                  mulhu        s2, t5, a5
                  fclass.s     gp, fs0
                  ori          t4, s4, -741
                  addi         a7, a4, -1097
                  sub          t6, tp, s3
                  lui          s0, 550166
                  ori          a4, a7, -739
                  remu         t1, a5, a0
                  fclass.s     t1, fa3
                  slli         sp, a6, 14
                  xori         s10, s4, 1633
                  fmadd.s      ft1, fa4, ft6, ft7
                  rem          zero, t3, s6
                  sra          s0, t5, a7
                  sub          s6, s9, s8
                  mulhu        s4, tp, a3
                  sltiu        s0, s7, -51
                  fmul.s       fs9, fs2, fs5
                  slli         a4, t0, 23
                  sra          s0, t3, t4
                  fmadd.s      fs5, fs0, ft5, ft9
                  fdiv.s       fs11, ft6, fa5, rne
                  fcvt.w.s     gp, ft3
                  ori          gp, a2, 71
                  andi         a1, t4, -299
                  fsqrt.s      fs3, fs7, rtz
                  auipc        s1, 62472
                  fdiv.s       fs10, fa3, fa3
                  andi         a6, s0, -1889
                  fmv.x.w      zero, fa0
                  fsgnj.s      fs0, fs1, ft5
                  fnmadd.s     fs1, fs4, fs8, fs9
                  andi         ra, a7, -1191
                  auipc        t6, 132428
                  fnmsub.s     fs8, fs3, fs0, ft11, rdn
                  feq.s        a5, fa2, ft9
                  mul          s4, a1, s8
                  xor          s0, a5, s3
                  fcvt.w.s     sp, ft8
                  sltiu        a4, a6, -1840
                  fcvt.wu.s    t0, fs8, rdn
                  or           s8, s4, s11
                  remu         t0, s0, sp
                  divu         a5, s10, t1
                  flt.s        a2, ft11, fa1
                  sll          t0, t5, t5
                  srl          t4, t4, s7
                  remu         a4, s0, a4
                  mulhu        s1, s8, ra
                  fsub.s       fa5, fs10, ft4
                  nop
                  mul          gp, t0, a2
                  sub          a7, s0, sp
                  fdiv.s       fs9, fs2, fs6, rtz
                  add          s3, zero, s10
                  lui          t3, 321772
                  sub          zero, s0, s9
                  mulhsu       s4, s0, s9
                  fcvt.wu.s    s5, fa1, rtz
                  fmv.x.w      sp, fs1
                  slti         a2, a1, 1562
                  srai         a7, a0, 2
                  slli         zero, t0, 25
                  mulh         s6, a0, t1
                  xori         s1, s3, 918
                  fdiv.s       fs10, ft11, fs1
                  mulhu        a6, t3, a3
                  fmv.x.w      s6, fs1
                  sub          s1, s2, a0
                  nop
                  auipc        tp, 623546
                  fmv.w.x      ft9, t4
                  mulhsu       tp, s3, t5
                  fsgnjn.s     fs9, ft7, fa4
                  slti         a6, a5, 23
                  fmin.s       ft6, fa2, fs10
                  fmsub.s      ft5, ft7, ft1, fs0
                  srai         s1, s0, 30
                  srai         s5, s9, 12
                  fclass.s     s1, fs8
                  sltu         t1, ra, s7
                  rem          a6, a0, t5
                  mulhsu       s6, zero, sp
                  fmv.w.x      fs1, a7
                  xor          t4, t4, t4
                  fmadd.s      fa1, ft11, fa5, ft7
                  sltu         t4, a7, s4
                  fcvt.wu.s    a5, ft11, rne
                  fsub.s       fs1, fs8, ft4
                  srai         s6, tp, 8
                  rem          t0, s2, gp
                  mul          s3, s6, t0
                  fcvt.w.s     t1, ft8, rup
                  auipc        a4, 609453
                  mul          s9, a4, ra
                  addi         a2, s10, -801
                  fcvt.wu.s    s0, fs6, rne
                  lui          gp, 572204
                  lui          a6, 274146
                  fcvt.s.wu    fs10, s10, rdn
                  fcvt.s.w     ft7, s8, rtz
                  fcvt.s.w     ft8, ra
                  fsgnj.s      ft6, fa0, ft7
                  div          t0, a6, ra
                  fsgnjn.s     fs5, fs8, ft4
                  sra          a6, s7, a2
                  fmv.x.w      t3, fa7
                  add          s0, s8, a6
                  fmul.s       ft11, ft1, fa7
                  fmsub.s      ft9, ft10, fs0, ft9, rne
                  fmin.s       ft4, ft6, ft8
                  fdiv.s       fa2, fa5, fa3, rne
                  divu         s3, zero, s9
                  andi         sp, a7, 183
                  fmsub.s      fa5, fs1, ft0, ft9
                  slti         zero, s7, -492
                  fsub.s       fa2, fa7, ft6
                  flt.s        a4, fs3, fs3
                  fsgnjx.s     fs1, fa6, fs8
                  fclass.s     a6, ft11
                  fle.s        sp, ft6, ft4
                  fsgnj.s      ft4, fa5, ft7
                  fclass.s     a2, fs2
                  sra          s8, a0, ra
                  fle.s        zero, fa4, ft11
                  fmv.w.x      fs4, a5
                  fcvt.w.s     s0, fa1, rup
                  fnmsub.s     fa4, fs10, fa6, fs1
                  mul          t3, t2, s2
                  sub          t3, zero, sp
                  or           s6, t3, s4
                  mulhu        t6, s2, tp
                  or           s1, t0, gp
                  fmax.s       fa2, ft7, ft8
                  fmadd.s      fa3, fs0, ft4, fa1
                  flt.s        ra, fs0, ft0
                  fcvt.s.w     fa2, t2
                  fnmadd.s     fs0, fa3, ft4, fs2, rup
                  mulhsu       a4, s2, s2
                  andi         s5, s1, 1736
                  fclass.s     a4, ft9
                  srli         a5, s11, 11
                  fmul.s       fa2, fa4, ft9
                  fmv.w.x      ft1, s6
                  rem          a0, s7, t4
                  fcvt.s.wu    fs6, a6
                  sra          s0, a2, t2
                  sub          zero, s3, t1
                  fcvt.w.s     t6, ft0, rtz
                  xori         tp, s0, -971
                  fcvt.w.s     a7, ft4
                  andi         gp, s8, -445
                  srai         t1, a4, 14
                  sll          t5, s5, t5
                  or           s6, t1, a0
                  fsgnjn.s     fs1, ft6, ft7
                  fle.s        tp, fs5, ft5
                  mulhu        a6, t3, a0
                  slti         s6, a6, 1883
                  fsgnj.s      fa1, ft2, fs9
                  fmv.w.x      fa4, a2
                  div          s3, s2, t5
                  xor          s9, s3, a4
                  xor          s9, s11, a7
                  fnmadd.s     fs10, fs10, fa6, fs4
                  remu         s1, gp, t1
                  fnmsub.s     fs4, fa7, ft7, fs2, rne
                  fcvt.w.s     t5, fs6, rdn
                  remu         ra, tp, s11
                  addi         s5, s3, -1932
                  fsqrt.s      fs3, fa3
                  slt          a1, s4, a2
                  mulhu        s5, s4, a1
                  mulhsu       s2, s6, tp
                  fmin.s       ft3, ft4, ft7
                  fmv.w.x      fs4, s8
                  mul          a6, a0, s1
                  sll          t3, a7, zero
                  fmv.x.w      a4, ft8
                  srli         ra, a7, 29
                  slti         zero, a4, -1028
                  fsgnjx.s     ft8, fa0, fs4
                  lui          zero, 710601
                  fsub.s       fa2, fa5, ft2
                  or           t4, ra, s11
                  fadd.s       fs1, ft10, ft11, rdn
                  sub          tp, a6, t0
                  and          s3, s5, t6
                  auipc        ra, 858616
                  fdiv.s       fa3, fa2, fa5
                  fmin.s       fa1, fa6, fa3
                  xor          t1, t3, sp
                  xori         sp, t0, -1281
                  slti         a7, ra, 203
                  fcvt.w.s     t0, fa2, rmm
                  fdiv.s       fs0, fa4, fs0, rup
                  fsqrt.s      fa5, ft0, rup
                  srl          a7, t1, s2
                  addi         ra, tp, 479
                  divu         s2, t5, s0
                  fmadd.s      fs6, ft11, fa0, ft2, rmm
                  srli         t6, s7, 2
                  fcvt.s.wu    fa1, t2
                  and          s9, a1, ra
                  fsgnjn.s     fs5, ft8, fa4
                  auipc        a7, 598488
                  slli         a5, s11, 15
                  div          a3, s10, s2
                  lui          s9, 942708
                  fsub.s       fs7, fs4, ft3, rtz
                  auipc        s10, 746347
                  feq.s        a5, fs9, ft3
                  remu         t5, t4, s2
                  mulhu        s6, s10, s7
                  xor          t0, t6, s10
                  xori         s3, t6, -813
                  fclass.s     a3, ft3
                  slti         a0, s10, -1874
                  fcvt.wu.s    a2, fa4
                  sltiu        a5, a5, 1887
                  slli         s9, a6, 9
                  sltu         a6, a0, s9
                  nop
                  fsgnjn.s     ft3, ft3, ft2
                  fsgnj.s      fa1, fa5, fa7
                  rem          zero, s4, a1
                  add          tp, s1, s0
                  xor          sp, a7, gp
                  div          t1, zero, t0
                  fcvt.s.wu    ft8, t3
                  mulh         a1, t1, s8
                  mul          a0, s7, s3
                  fmsub.s      ft10, ft2, fa6, fs3
                  fmin.s       ft8, fs3, fa4
                  fcvt.s.wu    ft3, s2, rup
                  fmadd.s      fa7, ft7, fs4, fs1
                  fsub.s       fa5, fs6, fa3, rup
                  fmadd.s      ft5, ft1, ft9, fa2
                  fcvt.wu.s    ra, ft9, rmm
                  fsub.s       fa5, fs8, ft7, rne
                  andi         t3, ra, 1060
                  fsub.s       ft7, fa5, fs5
                  fsgnj.s      fa7, fs11, ft5
                  remu         t5, a2, a4
                  fcvt.s.wu    fs3, s1
                  sltiu        s5, a6, -889
                  mulh         a7, s1, t2
                  fsub.s       ft10, ft2, fa4, rdn
                  mul          a0, s1, s5
                  fclass.s     s1, ft6
                  sltu         a4, s3, ra
                  div          tp, s0, s1
                  xor          t5, s11, a1
                  xori         t0, a2, -692
                  fsqrt.s      fs2, fa6, rup
                  or           a6, t2, a4
                  xor          t4, s0, s0
                  fsqrt.s      fs1, ft7
                  fmax.s       fs1, ft4, fa3
                  fsqrt.s      fs10, fs0, rup
                  flt.s        a1, ft1, ft4
                  div          a6, gp, gp
                  and          s8, t5, tp
                  srai         s6, s3, 4
                  fsgnjx.s     fs6, ft6, ft1
                  fmv.x.w      s5, fa5
                  mulhu        a7, s2, s1
                  ori          s10, t5, 456
                  mulh         a0, t3, s0
                  addi         a1, t6, 240
                  div          t4, a4, t4
                  fcvt.wu.s    a4, fs6
                  xor          s2, s5, ra
                  srli         s1, t1, 1
                  fsgnjn.s     fa3, ft7, fa5
                  mul          a6, s8, s2
                  fcvt.s.wu    fs3, s7
                  sll          s2, s1, gp
                  fcvt.w.s     s3, ft6, rmm
                  mulh         s6, a7, s11
                  slli         t5, t0, 5
                  andi         s5, a0, -395
                  remu         tp, s6, t1
                  divu         s10, s0, t1
                  sltiu        t3, a7, -1751
                  fcvt.w.s     s4, fs1, rmm
                  addi         s6, s10, 400
                  fmv.x.w      t1, ft3
                  fclass.s     s4, fa1
                  fnmadd.s     ft0, ft11, fa5, ft6, rne
                  fmadd.s      ft0, ft4, ft4, fa1, rtz
                  ori          s10, a7, 415
                  slt          a7, t5, tp
                  andi         s0, gp, -183
                  srli         sp, s4, 13
                  ori          a0, s0, 1406
                  mulhu        s2, t0, a0
                  mul          sp, s2, s4
                  srai         s4, s9, 15
                  fnmsub.s     fs8, fa6, ft5, fs0, rtz
                  or           s2, s3, s6
                  fsgnjn.s     fa1, ft5, ft4
                  div          a2, s1, a7
                  remu         a2, t1, t1
                  srl          a6, a2, t0
                  fcvt.s.w     ft9, t0
                  fnmadd.s     fa1, fs11, ft7, fs4, rmm
                  slli         t5, a3, 18
                  sub          s8, a5, zero
                  slti         s10, a0, -1147
                  srli         s0, s4, 23
                  fcvt.w.s     s5, fa7, rmm
                  nop
                  and          t3, a7, tp
                  lui          t1, 374596
                  fsgnj.s      fa0, fs9, ft2
                  srli         zero, s8, 26
                  flt.s        s5, fa1, fa5
                  flt.s        s0, ft0, ft4
                  fnmadd.s     fs9, ft4, ft6, fa1, rup
                  fsgnjn.s     ft5, fa6, fs2
                  fnmadd.s     fa6, ft9, fs1, ft6
                  sra          t1, t4, s5
                  fmax.s       ft11, fs5, fs10
                  auipc        s2, 145154
                  fsgnj.s      fa4, ft3, ft9
                  fmax.s       fs8, ft1, fa4
                  add          gp, tp, s0
                  fmadd.s      fs6, ft9, fa4, fs8
                  sltiu        a0, t4, -1504
                  slti         s4, t1, -1148
                  and          s1, tp, a0
                  fsgnj.s      ft3, fs9, fs9
                  fadd.s       ft7, fs9, fa7, rdn
                  fmadd.s      fs1, fa1, fs3, fs4, rtz
                  srl          t3, t6, a1
                  slti         sp, ra, -398
                  flt.s        zero, fs9, fa4
                  ori          a5, s4, 1135
                  sub          t6, t4, s7
                  fnmsub.s     fa0, ft6, fs2, fs7, rup
                  addi         t5, t5, -215
                  xori         t0, s11, 339
                  fdiv.s       fa1, fs2, fs9
                  rem          a5, a5, t3
                  fle.s        t0, fs7, ft6
                  andi         a5, t6, -216
                  fmin.s       fa2, ft4, fa2
                  fcvt.wu.s    a4, fs9, rup
                  fmv.w.x      fa0, a3
                  fnmadd.s     ft8, ft5, ft6, fs8
                  add          s1, s11, t5
                  sll          s1, s4, t2
                  addi         s0, sp, 423
                  slt          tp, a0, a6
                  remu         t4, t3, gp
                  xori         t5, zero, 266
                  fcvt.wu.s    t1, fa7
                  xor          s0, a1, a6
                  mulh         a6, a3, zero
                  sub          t4, gp, a3
                  divu         a1, a7, a4
                  rem          s8, t6, s0
                  mulhsu       s9, s2, s9
                  fmul.s       ft2, ft3, ft6, rne
                  rem          s10, s4, s7
                  andi         t1, s4, 591
                  mulh         tp, s3, a3
                  slt          s6, t5, a4
                  sltiu        a4, a1, 293
                  fle.s        s2, fs2, ft0
                  fadd.s       fa0, ft10, ft11, rtz
                  xor          t4, a7, ra
                  fdiv.s       fs11, ft6, fa3, rmm
                  or           a3, s5, gp
                  fmv.w.x      fs3, a7
                  sltu         a7, s11, t0
                  feq.s        a4, fa2, ft11
                  sll          t0, s2, s3
                  mulhu        gp, s4, s8
                  srli         t6, t6, 29
                  fsgnjn.s     ft0, fs7, ft11
                  andi         s3, s4, -296
                  fadd.s       fa7, ft8, ft6, rdn
                  fcvt.w.s     a4, fs3
                  fmax.s       ft4, ft6, fs5
                  fclass.s     t1, fs5
                  sltiu        tp, s7, 930
                  sltiu        a0, t4, 1903
                  fle.s        t5, fs9, ft6
                  mulhsu       s8, s1, t3
                  fmul.s       fs10, fa6, ft10, rne
                  fmsub.s      fs4, fs2, fs8, fa2
                  fmadd.s      ft7, fs6, fa7, fa6
                  and          a6, t2, s11
                  mulhsu       s6, ra, s11
                  rem          zero, zero, a4
                  xori         s3, s2, 1361
                  andi         s0, a6, -292
                  fle.s        a0, fa6, fs0
                  srli         a6, s7, 16
                  or           s2, s3, s5
                  add          a4, tp, a5
                  sltiu        s3, t5, -528
                  fmsub.s      ft8, fs8, ft9, ft8, rdn
                  fle.s        s4, fa6, ft6
                  fsqrt.s      ft5, ft7, rdn
                  fle.s        zero, fs7, fa1
                  sub          t5, a6, ra
                  fmsub.s      fs3, fa6, fa0, fs6, rup
                  mul          s6, s8, s2
                  sub          t6, sp, a4
                  feq.s        t4, fs5, fs10
                  srli         s10, a6, 7
                  add          tp, s6, a7
                  mulh         s6, t0, s4
                  fcvt.w.s     s9, fs9
                  flt.s        t0, fa4, fa7
                  fcvt.wu.s    s8, ft5, rmm
                  fsgnjn.s     ft10, ft3, ft8
                  sltiu        a0, sp, -2004
                  sltu         s3, s8, a3
                  fmul.s       ft11, fs8, fs11
                  srli         zero, s1, 19
                  mulh         s9, t0, s8
                  flt.s        s10, fs8, fs3
                  remu         sp, s0, s9
                  fdiv.s       ft8, fs9, ft2, rdn
                  fcvt.s.w     fs1, s6
                  fsgnj.s      ft5, fs4, fa3
                  or           s6, tp, a6
                  srli         s9, a7, 9
                  slli         s0, a5, 25
                  sra          s0, s7, s5
                  and          t1, s1, ra
                  divu         tp, s7, a1
                  fadd.s       ft8, ft8, fs4, rne
                  feq.s        s2, fs0, fs1
                  fmax.s       fa0, ft1, ft8
                  fmsub.s      fs8, fa2, fa0, fa7, rdn
                  fmin.s       fa5, fa5, fa3
                  mul          s9, zero, t2
                  auipc        t5, 785514
                  fsub.s       fa0, fs10, ft5
                  rem          a0, tp, t1
                  slt          tp, s0, t3
                  nop
                  and          t3, a7, tp
                  fdiv.s       fs1, fa2, fs2
                  srl          t5, t4, s0
                  lui          s9, 610084
                  fsgnjx.s     fa5, ft10, fs2
                  mul          s5, a4, t0
                  feq.s        sp, ft9, fs9
                  fnmadd.s     ft9, ft6, fa7, ft6
                  srli         t3, t4, 21
                  nop
                  and          ra, s11, ra
                  fsgnjx.s     fa2, fa3, fs8
                  andi         s3, s9, -1497
                  slt          s0, s8, t0
                  mulh         a6, a4, a6
                  and          s3, t2, t1
                  xori         t5, gp, 603
                  remu         s3, s2, ra
                  mulhsu       s0, t0, ra
                  fmadd.s      fs2, ft4, fs11, fs5
                  add          a2, ra, s10
                  fmul.s       fs5, fs0, ft3, rmm
                  fsgnj.s      ft8, fs5, ft3
                  auipc        gp, 192670
                  flt.s        t1, fa0, fa6
                  slt          ra, a3, s5
                  fmsub.s      ft2, ft7, fa4, fa3, rmm
                  xor          a3, a7, a0
                  mulh         s2, a6, a2
                  slt          s0, a5, t2
                  ori          t6, s11, -1827
                  fle.s        zero, fa0, fa5
                  xori         gp, s5, -1078
                  srl          gp, ra, zero
                  fcvt.w.s     s3, ft5, rtz
                  slt          a5, s0, s10
                  fadd.s       ft9, ft1, ft1
                  fsub.s       fs0, ft9, fs5, rtz
                  sra          a5, a4, s11
                  or           a7, a4, s3
                  mulhsu       s3, tp, a1
                  srli         t5, t6, 13
                  or           s3, s6, a7
                  fcvt.wu.s    t6, fs8
                  srli         s6, s7, 2
                  mul          t6, a6, a2
                  fsqrt.s      fa5, ft5, rtz
                  sll          a3, t4, a4
                  fnmadd.s     fs1, fs1, fa6, fa5, rmm
                  fnmsub.s     fs10, fa5, fa2, fa5
                  and          s1, ra, tp
                  fcvt.s.w     fa4, a1
                  div          a0, s5, t4
                  nop
                  slti         sp, s3, -243
                  fsgnj.s      ft6, ft9, ft3
                  srai         s8, tp, 20
                  mul          a4, tp, t5
                  xori         t3, zero, -994
                  feq.s        s4, fs1, ft0
                  fcvt.s.w     fa4, a7, rup
                  and          t6, t6, tp
                  sra          s4, tp, t5
                  fmsub.s      fs1, fs11, fs5, fs4, rup
                  fmsub.s      fa3, ft3, ft9, fs7, rup
                  auipc        zero, 770164
                  flt.s        tp, fs3, fs5
                  fclass.s     s0, ft10
                  fadd.s       fs10, fs5, ft8
                  addi         a4, a7, 582
                  fnmsub.s     ft8, fs8, ft11, fa0, rtz
                  srai         a5, gp, 18
                  slli         tp, t1, 3
                  fadd.s       fs0, fa1, fs1
                  fsqrt.s      fa5, fs5
                  fsqrt.s      ft3, fa2
                  fmul.s       ft8, ft11, fs11, rmm
                  fmadd.s      ft7, fa7, fs8, fs11
                  fclass.s     s8, fs11
                  fsqrt.s      ft9, ft6
                  add          s0, s4, t6
                  div          a1, a0, s5
                  slt          s10, t0, s1
                  fmadd.s      ft8, fa4, fs1, fs8
                  sub          gp, a0, s1
                  mulh         s3, a2, t6
                  xori         t4, s1, 1308
                  sll          gp, tp, a2
                  sltu         gp, s2, s8
                  sltiu        t1, s6, 1209
                  fle.s        a2, ft11, fs0
                  mulh         t3, s4, t0
                  divu         s2, a6, a1
                  sltiu        ra, s9, -69
                  sll          s6, s5, a1
                  fclass.s     t5, fs6
                  addi         s8, a3, 963
                  or           t6, s9, a6
                  andi         t6, s7, -1275
                  mulhsu       s2, a3, zero
                  fmadd.s      ft7, fs9, fa6, ft5
                  nop
                  auipc        s0, 367205
                  fsub.s       fs11, ft6, ft11
                  srai         s8, a3, 16
                  fmul.s       fs1, ft8, ft6, rdn
                  fcvt.s.wu    fs1, s5, rup
                  add          s4, t5, s8
                  and          zero, ra, a3
                  xor          a3, t4, tp
                  nop
                  fadd.s       fs3, ft4, ft1, rne
                  fle.s        s0, fs2, ft9
                  sltu         sp, t5, s3
                  rem          t1, tp, s7
                  fsqrt.s      ft2, fa3
                  rem          s1, a4, t2
                  mulhsu       t1, t6, a4
                  fcvt.w.s     s10, ft5
                  fsgnj.s      fa7, fa4, fa5
                  auipc        s4, 602993
                  fsgnjn.s     fs11, fa6, ft2
                  divu         a4, gp, s2
                  fadd.s       fs1, fs2, fs7
                  sra          s3, t2, s11
                  sll          t1, gp, s11
                  sub          s10, a2, s8
                  or           a2, a2, s3
                  addi         t5, a2, 1934
                  or           sp, a3, t6
                  or           t5, a3, t6
                  slli         s5, sp, 21
                  mulhu        s1, s2, s3
                  flt.s        t4, fa1, fs3
                  lui          t5, 38453
                  mul          s6, s8, a1
                  slli         a5, s8, 9
                  feq.s        gp, ft11, fs7
                  div          a0, s2, t6
                  flt.s        a6, fa6, ft5
                  fcvt.w.s     t3, fs10, rtz
                  andi         a1, s9, 629
                  mulh         s6, s10, a2
                  feq.s        t3, ft3, fa6
                  addi         s8, s4, 187
                  nop
                  auipc        ra, 677751
                  mul          s3, s3, t6
                  fle.s        tp, fa5, fs2
                  fcvt.s.w     fs6, s3
                  slti         tp, s8, 582
                  fsgnjx.s     ft6, fa3, fs11
                  slt          t6, s7, s1
                  srai         s8, t4, 3
                  fdiv.s       ft3, fa3, fa0, rtz
                  mulh         a7, s5, gp
                  div          s1, zero, a0
                  srai         t3, tp, 20
                  fsgnjn.s     ft10, ft4, fa6
                  fmv.w.x      ft5, a0
                  srli         a7, a1, 3
                  fdiv.s       fs1, fs3, fs11, rmm
                  andi         a5, t2, 1961
                  fclass.s     s2, ft5
                  lui          s4, 658744
                  fmv.x.w      t5, ft8
                  andi         s4, s4, 166
                  sub          ra, s9, a7
                  fsub.s       fa0, fa3, fs3
                  sltiu        a6, tp, -176
                  and          s2, gp, s9
                  lui          gp, 858064
                  sltiu        ra, s8, 845
                  remu         a6, s4, t6
                  nop
                  andi         s1, s8, -4
                  rem          s5, s10, s7
                  fmul.s       fs5, ft0, ft5
                  flt.s        s10, fs2, fs2
                  xor          t3, t1, s10
                  srl          a0, a2, a4
                  ori          t0, s7, -615
                  fcvt.w.s     a3, fs11
                  fcvt.s.w     ft3, ra
                  div          a3, a4, s3
                  mulhsu       sp, s2, s3
                  add          t0, s11, s8
                  fnmadd.s     fs1, fs1, ft6, ft11, rmm
                  fsgnjx.s     fs0, ft0, fs2
                  nop
                  fmv.w.x      ft5, s10
                  fcvt.w.s     t6, fs10
                  fnmadd.s     fa3, ft2, fa1, fs8
                  rem          s8, s2, sp
                  xori         a2, s6, 1213
                  sra          gp, s5, s6
                  fmadd.s      fs10, fs0, fa5, ft6, rup
                  fmv.w.x      fa1, t0
                  fmv.x.w      s1, ft5
                  or           a4, s4, a5
                  fsgnjn.s     fs5, ft0, fa3
                  sra          sp, s8, t3
                  fsqrt.s      ft8, fs8, rdn
                  fcvt.wu.s    t0, ft2
                  slti         s8, a1, -1805
                  fsqrt.s      ft5, ft5, rne
                  fmv.x.w      zero, fs2
                  sra          s8, gp, zero
                  slli         ra, a3, 25
                  div          s1, a4, a1
                  fmul.s       fs3, fa2, ft10, rdn
                  fmul.s       fa2, ft0, ft10, rdn
                  mulhsu       s0, t2, s4
                  fcvt.w.s     a4, fs4, rmm
                  addi         s2, s3, 375
                  fmax.s       fs7, fa5, ft3
                  slli         gp, gp, 10
                  sll          a5, ra, a5
                  add          a4, a1, a1
                  auipc        t6, 768720
                  fsqrt.s      ft1, fa4
                  and          s10, gp, a3
                  fmv.x.w      s9, fa3
                  mul          a2, s6, t1
                  remu         s10, s6, sp
                  sltu         t6, s3, s11
                  fmin.s       fa6, ft10, fa5
                  fmv.w.x      fa1, gp
                  fmv.x.w      t0, ft6
                  addi         s5, s2, -801
                  srli         a5, a5, 22
                  lui          s4, 436214
                  lui          t1, 553204
                  sltiu        s3, gp, -1544
                  sra          s3, t4, s1
                  fnmadd.s     fs9, ft7, fs7, fa4, rne
                  fdiv.s       fa0, ft8, ft6
                  fmul.s       ft2, ft2, ft2
                  fmv.w.x      ft11, a3
                  mulhsu       t1, a2, t2
                  and          s10, zero, zero
                  fmax.s       fs11, ft4, ft1
                  auipc        a2, 603456
                  andi         a2, s3, -1492
                  sub          s9, sp, s10
                  fmv.w.x      fa3, s8
                  fle.s        a7, fa7, fs0
                  fnmadd.s     fa0, ft0, fs10, ft9
                  mul          sp, s3, gp
                  srl          a1, a3, s4
                  or           t4, t3, tp
                  fmin.s       ft4, fa7, fa2
                  srli         a4, t6, 24
                  and          s0, t0, s8
                  mul          a5, a0, t2
                  srl          s1, zero, gp
                  fnmadd.s     ft3, ft2, fs11, ft0
                  fmsub.s      fs8, fa6, fa5, fs4
                  and          s1, s1, s2
                  sll          s4, sp, t1
                  ori          a4, s1, 60
                  nop
                  srai         zero, a3, 31
                  fsub.s       fa5, ft2, ft8, rup
                  flt.s        a4, fa2, fs2
                  mulhu        sp, s4, t0
                  fmv.w.x      fs4, sp
                  sltu         a0, t6, t5
                  fmin.s       fa1, ft11, ft2
                  nop
                  sltiu        t1, a1, 1130
                  srl          sp, s9, sp
                  add          a5, s6, a7
                  andi         s10, s3, -1800
                  srai         s4, zero, 7
                  add          t4, t2, s7
                  fle.s        a4, ft4, ft1
                  fdiv.s       fs4, ft7, fs8, rdn
                  div          t3, s8, t1
                  fmax.s       fa0, fs8, ft1
                  mul          s9, s3, s5
                  divu         s2, t0, s5
                  srai         a2, t2, 27
                  addi         zero, ra, 1588
                  fle.s        s3, ft0, fs0
                  fmv.x.w      s6, fa7
                  sltu         s1, s10, t5
                  or           a4, s8, t6
                  and          gp, sp, ra
                  fsgnjx.s     fs1, fs7, ft0
                  addi         t5, s3, -1699
                  mul          a5, t1, a4
                  auipc        s8, 395276
                  and          s2, t6, a4
                  fmul.s       fa4, ft8, fs5, rup
                  mulhsu       a0, s6, a6
                  add          a1, a4, gp
                  srli         t4, gp, 27
                  fsgnj.s      ft0, fs2, fs5
                  fadd.s       fs0, ft3, fa6, rmm
                  sltu         tp, s9, s2
                  fle.s        s6, ft7, fa5
                  fclass.s     a2, ft2
                  ori          s5, ra, -1614
                  slli         s1, t6, 17
                  fsgnjn.s     fa7, ft10, fs3
                  rem          s3, t1, t3
                  sra          s5, s5, a3
                  ori          s6, a0, -1181
                  feq.s        t3, fa4, fs11
                  fmul.s       fa6, ft11, fa0, rtz
                  fadd.s       fs9, fs8, fa2, rtz
                  nop
                  lui          sp, 554699
                  xori         t1, s3, 1453
                  div          ra, t0, a5
                  fmadd.s      fa4, fa5, ft9, ft3
                  lui          t0, 188760
                  mulhu        s8, a7, s5
                  fadd.s       fa7, fs1, ft8
                  rem          tp, gp, ra
                  fclass.s     s1, fs6
                  or           a5, tp, a2
                  fcvt.wu.s    a4, ft9
                  fsqrt.s      ft8, fs3, rmm
                  fsqrt.s      ft11, fs1, rmm
                  fmv.x.w      s8, ft6
                  xori         a0, s1, -932
                  mulh         a4, s0, t6
                  xor          a7, s4, a2
                  andi         a2, s0, 648
                  fsub.s       fs1, fs3, fa2, rup
                  sra          t0, s0, t1
                  fmin.s       ft7, fs1, fs1
                  auipc        a0, 970202
                  andi         a3, zero, -1991
                  rem          s5, t0, t4
                  fsqrt.s      fs11, ft9, rtz
                  add          s6, s8, t3
                  and          a7, s8, s9
                  auipc        a7, 286015
                  lui          a0, 556946
                  fmax.s       fs0, fa2, fs9
                  slli         s9, s10, 4
                  fmadd.s      fa4, fs3, ft3, ft2, rne
                  sub          a5, s2, t1
                  fdiv.s       fs10, ft9, ft6
                  mulhu        s6, tp, gp
                  sll          gp, a6, s1
                  divu         t0, a0, s8
                  div          a1, t4, zero
                  fdiv.s       fs1, fs11, fs10
                  sltiu        t1, s8, 781
                  sltu         a1, a5, ra
                  fnmadd.s     fs3, ft0, ft5, fs6, rtz
                  feq.s        a2, fa1, fs11
                  fmsub.s      fa4, fs8, ft10, fs7
                  fcvt.wu.s    s4, ft2
                  and          zero, t5, sp
                  srli         a0, s8, 14
                  fnmsub.s     fs10, ft4, ft4, fs1
                  fmax.s       ft6, ft5, ft0
                  fmax.s       fs11, fs3, fs3
                  srli         t0, a7, 22
                  xori         gp, t1, -434
                  mulhu        s9, a0, sp
                  fsgnjx.s     ft9, fa1, fa3
                  fmul.s       fa4, fs5, ft6
                  fsgnj.s      fs4, fa5, fa1
                  flt.s        ra, ft5, fs1
                  addi         s1, s8, -265
                  fmax.s       ft5, ft0, fs9
                  flt.s        a7, ft2, fs3
                  fsqrt.s      ft10, fa1
                  srai         t4, gp, 23
                  srl          s1, gp, s10
                  auipc        t3, 783345
                  auipc        a7, 806352
                  fclass.s     a4, fa7
                  lui          a1, 841913
                  or           s6, s2, s11
                  fsgnjx.s     ft10, fs4, fa5
                  auipc        t5, 208237
                  fmul.s       ft8, fs11, fa0
                  fmul.s       fs11, ft7, ft0, rdn
                  fmul.s       ft7, fs7, ft4, rne
                  fclass.s     a4, ft6
                  fcvt.w.s     s0, fs7, rmm
                  divu         s9, t5, a6
                  mulh         t4, t3, t1
                  nop
                  slli         gp, a3, 13
                  mulhu        s1, t6, zero
                  sra          t3, t2, tp
                  srl          a3, a5, a0
                  fcvt.s.w     fa1, s4
                  xori         sp, t2, -2007
                  fcvt.s.wu    ft8, sp, rne
                  fcvt.wu.s    s2, fa2
                  fnmadd.s     fs4, ft7, ft8, fs6
                  fsub.s       fs10, fa6, fs3, rne
                  fnmsub.s     fa6, fs1, ft10, fs3, rdn
                  mulhu        a1, t6, s5
                  and          gp, s3, s0
                  flt.s        s4, ft6, fs7
                  fmul.s       fs0, fs3, ft2, rup
                  sltiu        t5, s9, -515
                  fclass.s     s0, fs3
                  fdiv.s       ft2, fa3, fs10, rup
                  andi         a6, ra, -1342
                  xor          a1, a3, a0
                  slli         s6, a3, 19
                  srai         a6, s11, 18
                  remu         s2, a1, a5
                  sll          a1, s10, s2
                  sra          s2, t6, t2
                  fdiv.s       ft4, fs2, ft8, rmm
                  srl          t3, t2, a6
                  fle.s        s5, ft2, fa6
                  ori          s3, s3, -1535
                  auipc        a1, 577348
                  xor          s0, t3, s3
                  srl          a5, a5, t4
                  fmin.s       fa2, fs10, ft0
                  xor          t3, tp, tp
                  or           t1, a5, s10
                  fcvt.s.wu    ft0, s0
                  feq.s        a5, fs0, ft4
                  srl          s6, t4, a6
                  fsub.s       ft6, ft0, ft7, rtz
                  fclass.s     t3, ft8
                  sub          t6, t4, s3
                  add          s8, a1, t4
                  and          s3, a5, s3
                  fsub.s       fa2, fs0, ft7
                  fcvt.s.w     fa7, t5
                  fnmsub.s     fs11, fs8, ft5, fa3, rtz
                  divu         s9, s7, s2
                  lui          a4, 685276
                  sll          sp, t0, t2
                  mul          s3, sp, a1
                  fmv.x.w      t0, fs3
                  and          s9, t1, s6
                  srl          t3, s1, s9
                  slt          a4, t5, ra
                  sltiu        t6, a2, -203
                  fadd.s       fs6, fs0, ft2, rmm
                  div          t3, s2, t4
                  mul          a5, sp, s8
                  mulhsu       s6, a5, t1
                  fmv.x.w      s6, fa0
                  slt          t6, a2, s6
                  fsgnjx.s     ft11, ft1, fs11
                  fcvt.wu.s    a2, fa2, rtz
                  flt.s        t0, ft3, fs8
                  srl          s10, ra, t5
                  divu         s5, s8, a0
                  addi         tp, a1, 1705
                  fsgnjx.s     fa4, ft3, fs7
                  fle.s        zero, ft2, fs5
                  feq.s        a1, ft0, fa0
                  slt          zero, s3, t1
                  fsgnjn.s     ft2, ft1, fs2
                  sltiu        a6, s3, -1013
                  fnmsub.s     fs4, fa5, ft1, ft0
                  slli         s1, a0, 17
                  fmax.s       fa3, fa7, fs2
                  fsgnjx.s     fs10, fa1, fs7
                  ori          a1, tp, 1346
                  fsqrt.s      fs10, ft0
                  fclass.s     ra, fs3
                  mulhsu       t5, t5, s10
                  sltiu        t4, s4, -1750
                  fsgnjx.s     fs5, ft6, fs8
                  div          a2, s3, t0
                  fmin.s       fs0, fs1, ft10
                  divu         t0, t0, s1
                  ori          a0, s1, 578
                  slli         s6, a7, 2
                  fclass.s     t4, ft7
                  divu         tp, a3, s6
                  sub          a1, t2, gp
                  and          s3, a7, a0
                  fsqrt.s      fs0, fs5
                  fdiv.s       ft8, fs8, ft2
                  fmv.x.w      t4, fa6
                  xor          sp, s0, s3
                  xor          s10, a3, s0
                  slli         s3, gp, 28
                  fsqrt.s      fs6, fs6, rdn
                  mulhu        a6, sp, sp
                  mulh         a1, a2, a2
                  fadd.s       fa2, fs9, fa7, rdn
                  fcvt.wu.s    s3, ft2, rne
                  fcvt.s.w     fa6, t0, rne
                  addi         s9, t2, -1739
                  or           s9, a4, s9
                  srai         s5, t1, 6
                  fadd.s       ft3, fa0, fs2, rne
                  sltiu        s10, a3, 86
                  mulhu        t3, t5, s6
                  srl          s9, t5, s8
                  fmul.s       fs11, ft4, ft8
                  mulh         sp, s7, s4
                  fsgnj.s      ft10, fa7, fs2
                  srl          t1, a1, t4
                  fclass.s     s4, ft6
                  fmul.s       fa6, fs2, fs7, rmm
                  remu         a2, a0, t0
                  fmv.w.x      fs0, s11
                  fsgnj.s      fs10, fs5, fs9
                  fsgnj.s      fa2, fa4, fa5
                  divu         a5, a6, s11
                  flt.s        a0, ft1, ft11
                  fmv.w.x      fa5, s1
                  fdiv.s       ft7, fa5, ft10
                  fcvt.s.w     ft1, a3, rne
                  fsgnjx.s     fs4, ft0, ft0
                  fnmadd.s     fs9, fa5, ft3, ft5, rne
                  fmsub.s      fs3, fs11, fa2, fa2, rtz
                  fmin.s       ft2, fs0, fs0
                  fadd.s       ft7, ft3, ft11
                  srl          s10, s10, a7
                  auipc        s10, 74155
                  fsqrt.s      ft4, ft6
                  divu         ra, s4, s5
                  fmadd.s      ft6, fs5, ft2, fa6, rtz
                  and          a0, a0, s5
                  srai         a7, s1, 17
                  auipc        a3, 464648
                  fcvt.wu.s    t4, ft9, rdn
                  slli         a5, s7, 0
                  fle.s        s8, fs11, fa1
                  and          t5, s9, s4
                  sub          a4, sp, s2
                  mulhsu       s4, s3, s1
                  fmax.s       fs7, ft1, ft8
                  flt.s        s10, ft5, fs9
                  mulhu        s5, zero, a0
                  fcvt.wu.s    gp, ft9
                  fmv.x.w      t5, fs6
                  fmin.s       ft4, fs10, ft5
                  fsgnjx.s     fs6, fa4, ft1
                  fmin.s       ft2, ft9, fa3
                  fclass.s     t0, fa5
                  mulh         s5, a1, t2
                  fmin.s       fa0, ft5, fa7
                  fmax.s       ft8, fs5, ft4
                  fcvt.w.s     a1, ft5
                  fcvt.w.s     a1, ft11
                  fadd.s       fs8, fa3, fs5, rtz
                  mulhsu       s2, s10, a1
                  feq.s        gp, fs3, fa5
                  fadd.s       ft8, fa7, fs1, rne
                  andi         s0, t1, 1726
                  fmin.s       ft9, ft0, fs11
                  srli         s9, s10, 0
                  fcvt.s.wu    fa3, gp, rup
                  div          s9, t1, s3
                  div          s4, s5, a5
                  fmv.x.w      s1, fa6
                  fsgnj.s      ft9, ft2, fs11
                  div          a0, t5, t4
                  fmv.w.x      ft10, s0
                  fnmadd.s     ft4, ft6, ft0, ft6
                  andi         t1, t3, 462
                  sra          t5, a0, s10
                  fmadd.s      fa5, ft7, fa3, fs2, rne
                  srl          a1, s8, s4
                  slti         s6, a6, 617
                  srli         a6, t6, 9
                  remu         s1, a4, s5
                  sra          s10, s6, a7
                  mulhu        s9, s5, a5
                  xor          a3, s9, tp
                  fadd.s       fa2, fs5, ft3, rup
                  fsgnjx.s     fa2, fs2, fs2
                  fmsub.s      fs5, fs1, fs5, ft8
                  fcvt.s.wu    ft4, t4, rtz
                  fmax.s       ft3, ft10, fs4
                  fadd.s       fa0, ft10, fa6, rdn
                  flt.s        s9, ft4, fa3
                  xor          s8, s1, a2
                  fdiv.s       fs6, ft5, ft6
                  fsub.s       fs8, fs6, ft3, rup
                  fcvt.wu.s    a6, fa6
                  slli         t6, s10, 13
                  divu         a0, s3, s8
                  fmv.w.x      fa4, sp
                  slli         t1, t6, 26
                  fclass.s     a1, ft10
                  rem          t3, a0, a0
                  fcvt.s.wu    ft1, zero
                  mulh         s5, t6, s9
                  fclass.s     a3, ft6
                  auipc        tp, 564639
                  fnmsub.s     fs6, fa4, fs7, ft1
                  fadd.s       fs1, ft11, ft1, rmm
                  fcvt.wu.s    sp, fs0
                  flt.s        zero, ft3, fs1
                  xor          s8, s0, s5
                  mul          t1, tp, a7
                  sll          t0, t6, a5
                  fadd.s       fs7, fs1, ft8, rtz
                  remu         s6, zero, t2
                  fnmsub.s     fa2, fs5, ft6, fs7, rtz
                  fmsub.s      ft1, fs9, fs7, ft5
                  fmax.s       fa3, fs6, fs10
                  mulhsu       s3, t2, a5
                  fsub.s       fs1, fa6, fs9
                  fclass.s     tp, ft7
                  fnmsub.s     fs3, fa1, fs2, fs4, rdn
                  mulh         s4, s1, tp
                  remu         s8, s1, s2
                  sll          a0, s11, s11
                  fcvt.wu.s    gp, ft1, rtz
                  fmsub.s      fa6, ft2, ft11, fs1
                  div          s3, t2, a7
                  auipc        a4, 547444
                  srai         a3, t5, 31
                  sltu         s2, s4, a5
                  fcvt.wu.s    t4, ft9
                  mulhu        s3, s5, s11
                  fdiv.s       ft10, fa1, fa2
                  mulhu        a7, s5, gp
                  srl          t1, gp, s7
                  fclass.s     zero, fa6
                  slti         a2, a6, 1482
                  mul          s3, t5, a0
                  fsgnj.s      ft0, fs7, fs1
                  sub          s3, s8, s1
                  mulhu        a3, a4, zero
                  fmadd.s      ft10, fs0, ft2, ft10
                  slti         tp, s5, 1323
                  fdiv.s       ft2, ft8, ft6
                  fdiv.s       fs4, ft3, fs9
                  fmul.s       fa0, fs7, fs3
                  slt          s1, a6, s2
                  fnmadd.s     fs9, fa7, ft0, fs7, rdn
                  auipc        a0, 333319
                  fcvt.w.s     s2, ft1
                  lui          s9, 725332
                  fmin.s       ft1, fs2, ft10
                  fnmadd.s     ft10, ft3, fa7, ft8
                  fle.s        s5, fs2, fs2
                  rem          t5, a7, t5
                  lui          a1, 780211
                  fmadd.s      fs9, fa7, fa3, fa1, rne
                  fcvt.s.wu    fa6, ra
                  mul          tp, a0, s4
                  xor          a1, a7, s1
                  fmul.s       ft2, fa7, fa1, rtz
                  fsgnjx.s     ft5, ft7, fa7
                  mulh         s1, s5, ra
                  fsqrt.s      ft7, ft10
                  srl          t6, t2, a3
                  mulh         a2, s5, t0
                  mul          s0, s4, a7
                  srai         a7, t6, 30
                  add          a3, a2, s3
                  srli         a3, gp, 17
                  sub          a1, t1, tp
                  fmadd.s      fs6, ft0, ft1, fa0
                  fmax.s       fs10, fs3, fs3
                  fmadd.s      fs6, fs1, ft2, fa6, rdn
                  fmin.s       fa0, fs11, fa4
                  fmsub.s      fs7, ft3, ft7, ft2
                  fcvt.s.w     ft4, a5, rmm
                  flt.s        s2, ft8, ft10
                  srai         s3, a2, 19
                  feq.s        t0, ft9, ft3
                  fmin.s       fa2, fa4, fa7
                  xor          s6, s8, t2
                  fmv.x.w      ra, fs11
                  fmv.x.w      t3, ft0
                  slt          t6, t6, zero
                  slli         t4, s9, 27
                  fsgnjx.s     ft4, fa5, fa2
                  sra          t0, s11, s3
                  mulhu        t5, s0, s7
                  nop
                  mulhu        t4, s10, tp
                  slli         a7, s6, 3
                  fcvt.s.wu    fa1, s11, rne
                  mulhsu       a2, a3, s10
                  fmul.s       fs7, ft9, fs11, rdn
                  ori          gp, t6, 96
                  andi         s9, s5, 105
                  fsqrt.s      fs0, ft4, rmm
                  or           t0, t3, t2
                  andi         s2, a1, -732
                  fmadd.s      fs0, fa4, fa3, fa7, rmm
                  lui          a6, 175211
                  add          s3, s3, s4
                  sll          ra, t3, a1
                  nop
                  fsgnjx.s     ft10, ft10, fs11
                  rem          a3, ra, t6
                  lui          a4, 933016
                  nop
                  fsub.s       ft2, fa4, fa5, rtz
                  fmsub.s      fs11, ft8, fs3, fs5, rup
                  fsgnj.s      ft6, fs11, fs4
                  fnmsub.s     fs8, fs0, fs2, fs7, rmm
                  ori          a7, a5, -1083
                  andi         t4, t2, 333
                  fclass.s     a2, ft5
                  slti         a0, a4, -2002
                  fcvt.w.s     s4, fs1
                  fcvt.s.wu    fs1, s0, rne
                  fmv.x.w      a4, ft9
                  remu         a0, s3, t6
                  andi         a1, s9, 928
                  srai         t1, tp, 13
                  fmin.s       fa4, fs9, fs6
                  mulhsu       s6, t5, s1
                  fmv.w.x      fa0, s8
                  slti         s10, s8, -940
                  fsqrt.s      fs0, fs5
                  fnmsub.s     fa0, ft0, fs7, fs7
                  mulhsu       tp, a5, s10
                  srli         a7, zero, 29
                  fcvt.w.s     a3, fa3, rmm
                  xori         a4, s6, 1502
                  fcvt.s.wu    ft2, t6
                  andi         s4, s11, 1577
                  add          s2, a6, s9
                  fcvt.w.s     a1, ft11, rne
                  fsqrt.s      ft3, fs8
                  fsqrt.s      ft8, ft2, rtz
                  auipc        a4, 114650
                  flt.s        s4, fs9, fa4
                  fsub.s       ft9, fa1, ft5
                  nop
                  fsub.s       ft11, ft9, fa2, rdn
                  sltiu        a6, ra, -251
                  nop
                  sra          t0, sp, t5
                  mulhu        a0, sp, s11
                  addi         s6, t2, 583
                  fmadd.s      fa3, fs11, fa7, ft5, rup
                  flt.s        a2, fa6, fs11
                  divu         zero, t1, a2
                  and          a5, s10, s7
                  fmv.w.x      fs5, a5
                  fmul.s       ft10, fa3, ft8, rup
                  div          a7, t5, a7
                  mulhu        s2, tp, a3
                  fsgnjx.s     fa3, ft5, ft0
                  flt.s        s9, fs1, ft4
                  add          tp, tp, s9
                  fmv.w.x      fa5, gp
                  fsgnjn.s     fs1, ft11, ft11
                  fclass.s     t6, fa4
                  srai         zero, s8, 1
                  fadd.s       fs8, ft1, ft5
                  fcvt.s.w     fs5, t2
                  fadd.s       fs0, ft7, fs5, rmm
                  fdiv.s       fs0, ft6, fs6
                  ori          s8, a6, -524
                  mul          gp, a0, s10
                  andi         s10, s1, -695
                  or           a1, t6, t4
                  fsgnjn.s     fa1, fs2, fs3
                  fclass.s     a6, fa1
                  srl          a3, a1, t5
                  andi         t4, s5, 1998
                  add          s0, t4, s8
                  slli         a4, s6, 11
                  fle.s        a4, fa3, fa6
                  fdiv.s       ft8, fa3, fs1, rtz
                  fmv.x.w      t4, fs11
                  sub          s6, s3, s8
                  mulhsu       s3, a1, ra
                  div          t0, a5, s4
                  fsgnjn.s     fa0, ft5, fs5
                  addi         s0, t2, -1191
                  fdiv.s       fs7, ft4, fs8
                  srl          a3, s8, s8
                  sltu         t5, t6, s7
                  fle.s        sp, fa4, ft5
                  srai         a4, a1, 9
                  div          s1, s9, t0
                  slti         s3, s2, 313
                  xor          a1, t4, s11
                  fmv.x.w      a1, ft6
                  fadd.s       fs3, fs10, fs6, rdn
                  fcvt.w.s     s1, fa1, rdn
                  fsgnj.s      fa0, fa6, fa0
                  fcvt.s.wu    fs5, gp
                  fmsub.s      ft8, fs6, fs3, fs4
                  lui          t1, 21901
                  slti         a6, a7, -1261
                  fmv.x.w      a2, fa1
                  fclass.s     gp, ft1
                  add          t0, t2, sp
                  andi         t5, s11, -131
                  fmv.x.w      a5, ft6
                  rem          sp, s1, a5
                  xor          ra, s5, t4
                  sra          t5, a0, t6
                  auipc        gp, 691956
                  div          s3, s6, tp
                  fsqrt.s      ft6, fa1
                  sra          a3, a1, a2
                  srl          s1, s5, t3
                  slli         s1, ra, 31
                  fmax.s       fa7, ft11, fs4
                  fle.s        s8, ft5, ft3
                  lui          a3, 997661
                  auipc        a5, 109448
                  fsub.s       fa2, fs9, ft6
                  slt          a5, s6, s11
                  fmin.s       fs6, fa1, fs3
                  feq.s        s1, ft2, fa1
                  fle.s        s8, fs8, ft8
                  nop
                  fcvt.s.w     ft3, t2, rtz
                  feq.s        a2, ft6, ft0
                  fle.s        s1, fs8, ft11
                  fsgnj.s      fa3, fs8, ft4
                  fmv.x.w      a6, ft1
                  nop
                  fsqrt.s      fs8, fs10, rmm
                  fsqrt.s      fa4, fa7
                  srli         gp, t4, 29
                  fclass.s     s10, ft10
                  and          a6, s6, sp
                  fmul.s       fs0, fs2, fs3
                  slli         s3, t0, 13
                  srl          a6, a6, s9
                  add          s6, s8, a0
                  fclass.s     tp, fs5
                  fmax.s       ft10, fs9, ft8
                  srai         a5, s3, 30
                  fmax.s       fs4, fs1, fs1
                  sub          a0, tp, s0
                  fcvt.w.s     a7, fa6, rne
                  fsgnjx.s     fa2, fs0, fs10
                  div          tp, t0, a7
                  feq.s        a1, ft10, fa4
                  fcvt.s.wu    fs7, t4, rdn
                  fmadd.s      fa5, ft0, ft9, fs9, rup
                  divu         sp, t1, zero
                  fmadd.s      fa2, fa0, fa0, fs10
                  slli         sp, gp, 18
                  fsqrt.s      ft0, fs3
                  auipc        a5, 435412
                  fsgnj.s      fa7, fs5, ft10
                  fmin.s       ft9, fa4, fa0
                  nop
                  xor          s10, sp, s10
                  fmv.x.w      t3, fa4
                  feq.s        s5, fs6, ft1
                  nop
                  fmin.s       ft5, fs8, fs3
                  lui          a3, 406765
                  srai         t6, s1, 1
                  fmsub.s      ft11, fs1, ft4, fa4, rdn
                  fmax.s       fa0, fa0, fs8
                  fmul.s       fa7, fs0, ft5
                  rem          gp, s2, s6
                  fcvt.w.s     s8, fa2, rup
                  or           a5, s7, s8
                  ori          tp, s2, -1279
                  andi         a5, s11, -1012
                  fsgnj.s      fs4, fs2, fs0
                  flt.s        s6, fs5, ft5
                  sub          t1, t3, s4
                  feq.s        t3, ft6, ft10
                  feq.s        s0, fs11, fs2
                  sltiu        a2, tp, 1470
                  rem          s9, s8, s4
                  mulhu        t0, t4, zero
                  addi         s6, gp, 328
                  fle.s        s2, fs5, fs6
                  fnmadd.s     fa7, fa0, ft1, fs7, rmm
                  nop
                  xori         gp, s9, -1975
                  nop
                  mulhu        t6, a0, a6
                  fmadd.s      ft9, ft9, fs11, fs1
                  fmsub.s      fs3, ft9, ft1, fa1, rmm
                  sltiu        a3, s5, -1747
                  fsgnjn.s     fa0, ft11, fs10
                  fnmadd.s     fs8, fa4, ft3, fs0
                  srai         t4, s9, 1
                  sltiu        s4, s3, -1322
                  fcvt.s.wu    fs2, s6, rtz
                  fmax.s       ft4, ft8, ft1
                  fmv.x.w      t3, ft5
                  fmv.w.x      fa1, a0
                  fcvt.w.s     t6, fs2, rne
                  slli         ra, tp, 0
                  feq.s        s9, fs7, ft8
                  fsub.s       ft6, fa7, ft7
                  remu         a3, a2, a7
                  nop
                  and          s6, t1, s2
                  fmax.s       ft9, ft1, fs11
                  fnmsub.s     ft8, fs10, fa2, fa2, rmm
                  fcvt.wu.s    s5, fa6
                  flt.s        t6, fs1, ft1
                  andi         a7, s6, 249
                  fmadd.s      fs2, fs9, fa4, fa0, rmm
                  fadd.s       fa1, fa5, ft3
                  srl          s2, s2, t4
                  fle.s        a4, ft5, fs10
                  fnmadd.s     fa5, fa5, fs5, ft1
                  fmin.s       fs5, ft8, fa4
                  feq.s        a0, fa6, ft1
                  fmv.x.w      a5, fa4
                  feq.s        a4, fs9, ft1
                  div          s4, t6, a5
                  fclass.s     a2, ft6
                  sltiu        t6, s3, -1127
                  mulhsu       s5, t2, ra
                  and          s6, s0, sp
                  fmul.s       fs11, ft10, fa2
                  feq.s        s0, ft11, ft3
                  fmin.s       fa2, fa5, fs1
                  nop
                  fadd.s       fa4, fs7, fs8, rdn
                  fdiv.s       fs4, fa3, fs7, rne
                  slt          a2, a0, t1
                  nop
                  fadd.s       ft11, ft8, ft7, rmm
                  fcvt.s.wu    fa3, s0
                  mul          gp, a4, s3
                  ori          a5, s4, -780
                  fcvt.s.wu    ft8, a6, rup
                  sll          t6, s0, s9
                  sltu         t1, t5, s2
                  fcvt.s.w     fs7, tp
                  add          s0, s3, s8
                  srl          a3, a6, s7
                  sll          ra, t5, t4
                  fnmadd.s     ft7, ft9, ft5, fs3
                  fmin.s       fs5, fs10, fa7
                  fcvt.wu.s    s2, ft2, rdn
                  fcvt.s.w     ft9, a7
                  mulh         t1, a4, t2
                  nop
                  divu         s8, sp, ra
                  mulh         gp, s10, sp
                  or           t4, a4, ra
                  mulhsu       s6, a4, s3
                  addi         a4, a6, 1076
                  add          a4, t2, s4
                  fadd.s       fs0, fs9, ft6, rup
                  mulh         s4, s0, s1
                  fcvt.s.wu    fa2, a7, rdn
                  fmsub.s      ft3, fa6, ft11, ft6
                  sltu         a3, s6, s7
                  lui          s4, 118818
                  lui          a2, 249810
                  fmadd.s      ft2, fs1, fs6, ft9
                  fnmadd.s     ft7, ft9, ft2, ft10, rdn
                  fmv.x.w      a6, fa2
                  fcvt.wu.s    t5, fs11
                  fsqrt.s      fs7, ft3, rne
                  fcvt.s.w     fs5, a7, rne
                  sltu         zero, t4, ra
                  fsqrt.s      fs11, fs5, rne
                  fclass.s     a1, ft9
                  or           s8, t6, s3
                  fsqrt.s      ft8, ft7, rdn
                  srli         s3, a0, 12
                  fnmsub.s     fs7, fs7, fs2, fs7
                  fmul.s       fs1, fs9, fs3, rdn
                  sltiu        zero, gp, 864
                  addi         gp, t0, -1199
                  mulhsu       a4, sp, t6
                  fmin.s       fs11, ft2, ft3
                  fnmadd.s     fs3, fa1, fs4, fs10
                  fdiv.s       ft5, fa2, fs0, rmm
                  fmin.s       ft2, fa1, ft9
                  slt          a2, sp, a3
                  mulhsu       tp, t2, s9
                  fmv.x.w      t0, ft2
                  fcvt.w.s     s5, ft8
                  and          t1, s6, s1
                  fnmsub.s     fs2, fa5, fs9, ft2
                  fsub.s       fa2, fs6, fs0, rmm
                  mul          t5, a3, a1
                  rem          t4, s2, s9
                  sltiu        ra, a3, -968
                  fmin.s       ft11, fs5, fa1
                  fmv.x.w      a2, ft2
                  fmv.w.x      fs3, s4
                  fsgnjn.s     ft1, ft7, ft9
                  fmax.s       fa0, fa6, fs2
                  fdiv.s       fa2, ft10, fa7
                  fnmadd.s     fa4, ft10, fa0, fs3
                  fmul.s       fs8, ft9, ft5, rup
                  xor          s2, a0, sp
                  xori         s0, a5, -982
                  fsub.s       ft1, fs11, ft1
                  flt.s        t5, ft7, ft2
                  fmv.w.x      fa6, t2
                  nop
                  sltu         s6, a4, tp
                  fmax.s       ft1, ft8, fs3
                  fnmsub.s     fs0, fs8, fa2, ft6
                  divu         zero, t5, a1
                  sltu         s2, gp, s6
                  fdiv.s       ft4, ft2, fs8
                  sltiu        a2, a3, 65
                  fmv.x.w      a5, fs0
                  mul          s10, s9, s6
                  fsgnjn.s     fa6, fs2, fs4
                  andi         t3, t2, -2036
                  fsgnjn.s     ft2, fa1, ft7
                  fsgnjx.s     fs4, ft0, ft9
                  fmin.s       fa2, ft3, fs0
                  fmul.s       fs4, ft7, ft6, rup
                  add          t5, a1, a2
                  fmul.s       fa1, fa7, ft2, rmm
                  add          s3, s8, t1
                  div          t6, a2, a2
                  xor          s10, s7, s0
                  fnmsub.s     fs4, fs11, fs2, fa0, rne
                  fadd.s       fa7, fs8, ft7, rdn
                  fsub.s       fa4, ft3, fs11
                  mulhu        t4, s7, tp
                  flt.s        zero, ft8, fa4
                  andi         s6, gp, 1300
                  fle.s        s9, fs4, fs1
                  fsgnjn.s     fs6, fa0, fs10
                  fsgnjx.s     ft5, fa4, fs6
                  feq.s        tp, ft5, fs0
                  andi         a4, a0, 1578
                  sltiu        t5, t6, 1200
                  fmsub.s      ft6, fs0, fs0, fs9
                  andi         a1, a6, -490
                  slti         t5, gp, -1915
                  xor          s10, sp, t2
                  feq.s        a0, ft2, fs6
                  sra          s10, a3, s8
                  srai         t3, a5, 17
                  fdiv.s       fa5, ft7, ft7, rmm
                  xor          s5, a5, zero
                  lui          s2, 589464
                  fsgnjx.s     ft1, fs11, fa4
                  mulhu        a0, zero, t1
                  xor          s0, tp, s0
                  nop
                  fcvt.s.wu    fs8, a0
                  mulh         tp, s8, t6
                  sltu         a5, s9, a3
                  slli         a7, a3, 27
                  fmv.x.w      s6, fa4
                  auipc        s6, 52989
                  fcvt.s.w     fa2, t4, rtz
                  slli         s10, s7, 13
                  auipc        a5, 130923
                  srli         tp, s11, 18
                  flt.s        t3, ft0, ft5
                  fnmsub.s     fa3, fs5, ft11, fs3
                  nop
                  xor          a4, a3, s5
                  divu         a5, s3, zero
                  slti         t4, a5, -1208
                  fcvt.w.s     s3, fa3, rtz
                  fclass.s     a3, fa7
                  fmadd.s      fa2, ft8, ft5, fs4, rdn
                  srli         s1, t5, 26
                  fclass.s     s4, fs9
                  mulhu        a5, s7, a2
                  xor          s0, a1, s5
                  mulhsu       a2, s6, tp
                  fsgnj.s      ft0, fs7, ft7
                  or           s5, a4, a2
                  mulhu        a1, s6, t0
                  flt.s        a1, fa2, fs2
                  rem          s10, a6, s11
                  srl          t4, s8, s5
                  fmadd.s      fa7, fs4, fs6, fs2, rdn
                  mulh         s10, t4, s9
                  addi         a3, ra, 1846
                  srli         s5, a6, 29
                  fsub.s       fs6, ft3, ft8
                  mul          s4, a6, s10
                  ori          a6, a3, 36
                  addi         s4, a0, -1447
                  add          a7, t0, s2
                  mulhu        zero, t4, t5
                  addi         s5, t5, -1515
                  fsgnjx.s     fa5, fs5, fa6
                  slt          s2, t0, s8
                  feq.s        a0, fs3, fa4
                  sub          s3, s4, s11
                  fmv.w.x      fs8, t3
                  rem          t5, sp, ra
                  sltiu        s3, s9, -1301
                  mul          t0, gp, a7
                  mulh         t0, zero, a5
                  divu         t1, s8, t2
                  srai         t4, s5, 1
                  slt          t1, t6, t6
                  fcvt.s.wu    ft6, t1, rdn
                  or           gp, a6, t5
                  sll          a6, a6, t2
                  sub          t5, sp, a4
                  fnmsub.s     fa3, fs3, ft11, ft10
                  fsqrt.s      fa6, ft1, rdn
                  andi         gp, t6, -117
                  slli         a4, a2, 4
                  addi         sp, t2, 784
                  xori         s4, s0, -921
                  slt          a5, tp, ra
                  srai         t1, t0, 17
                  fcvt.s.wu    ft11, a4, rtz
                  sltu         t5, t0, t2
                  flt.s        tp, fs4, fs6
                  fadd.s       ft2, ft6, ft7
                  fmin.s       fa4, fs5, ft5
                  mulhu        s2, gp, a1
                  xor          s3, gp, s3
                  ori          zero, sp, 1119
                  sltu         s2, a1, sp
                  feq.s        s0, fa7, ft9
                  rem          ra, ra, zero
                  fmv.x.w      a6, ft2
                  fmin.s       ft7, fs2, fa4
                  fcvt.w.s     gp, fa1, rtz
                  or           s6, s8, s6
                  add          ra, a0, ra
                  fmsub.s      fs7, fa1, ft5, ft10
                  xori         s1, t1, 789
                  fmax.s       ft7, ft4, fa7
                  fcvt.s.w     fa1, s8
                  feq.s        s9, ft11, fa5
                  fmul.s       fs5, fa6, fs5, rtz
                  fsgnjn.s     ft7, fa7, fa3
                  slt          t3, s0, s2
                  fmv.w.x      fa6, t6
                  mulhu        s2, s0, t0
                  fcvt.wu.s    t3, ft9, rmm
                  fmadd.s      fs8, fs6, ft1, ft5
                  fmin.s       fs4, fa2, fa5
                  fmax.s       fs6, ft6, ft2
                  mulh         s9, s3, s3
                  addi         s2, tp, -337
                  fmadd.s      fa1, ft0, fs8, ft10
                  srai         s5, s5, 23
                  div          s8, s0, a7
                  fcvt.s.wu    fa2, s11
                  andi         tp, s3, 782
                  sltiu        s4, zero, 1146
                  slli         a1, s3, 8
                  andi         s8, t5, 518
                  fmul.s       fa1, ft8, fa3, rmm
                  fclass.s     sp, ft2
                  fsgnjn.s     fs6, fa1, fs9
                  divu         ra, sp, a6
                  srli         t0, t5, 9
                  andi         t3, s11, 1797
                  fle.s        tp, fs0, fs5
                  and          s2, a2, a1
                  auipc        a4, 400227
                  fnmadd.s     ft11, fs9, fa5, ft10, rmm
                  fsgnjx.s     ft4, ft7, ft2
                  fmin.s       fs10, ft2, fs6
                  fmax.s       fs0, fs0, fa3
                  nop
                  divu         a7, sp, t0
                  sltiu        t6, t6, -946
                  fmadd.s      ft5, fs8, ft8, fs7
                  fcvt.s.wu    fs2, a2
                  and          a4, s4, t2
                  sra          zero, s8, t3
                  add          s2, a5, s7
                  slli         s8, t0, 15
                  mulhu        a7, s3, ra
                  fdiv.s       ft10, fa6, fs11, rup
                  slli         a0, t1, 29
                  fsgnjn.s     fs7, fa2, ft0
                  srli         a6, s2, 1
                  fclass.s     t5, fs10
                  add          s10, t5, gp
                  feq.s        s1, fa3, fs5
                  add          ra, sp, t2
                  fmsub.s      fs1, fa7, fa5, ft1, rtz
                  fsgnj.s      ft3, fs8, ft6
                  fmv.w.x      fa2, s1
                  fmax.s       fa5, ft3, fa1
                  lui          a2, 52
                  fcvt.s.w     fs2, a4, rdn
                  fle.s        ra, fs2, ft1
                  fmax.s       fs0, ft1, fa7
                  andi         s5, ra, 811
                  fclass.s     a0, fa6
                  auipc        t3, 1020412
                  fcvt.s.wu    fa3, sp, rtz
                  and          t5, t5, zero
                  addi         t5, a1, 1472
                  mulh         a5, a6, t0
                  fcvt.s.w     ft1, a7
                  sra          ra, s2, t3
                  sra          s8, s3, a0
                  sltu         sp, s6, t5
                  fnmadd.s     fa1, ft0, ft1, fs5, rne
                  rem          a4, a1, t3
                  sltiu        s5, a1, 800
                  fclass.s     s9, fa7
                  srli         gp, s0, 28
                  srai         s8, s11, 27
                  fcvt.s.wu    fs11, a3, rne
                  slti         t4, a1, 491
                  auipc        s9, 788470
                  fmax.s       ft1, ft1, fa6
                  fmv.x.w      a5, fs3
                  fcvt.s.w     fs6, s10
                  nop
                  srai         s5, a4, 7
                  addi         s4, s7, -293
                  lui          a0, 966443
                  fnmsub.s     fs5, fs7, fs7, ft5
                  addi         a1, t1, 739
                  mulh         s1, a0, s3
                  fmadd.s      fs9, ft6, ft6, fs10, rne
                  xori         s1, t3, 718
                  fcvt.w.s     ra, ft5, rne
                  fnmadd.s     ft1, ft8, ft0, fa0
                  fle.s        a3, ft2, ft4
                  addi         t4, a5, -852
                  fmul.s       fs7, ft6, fs0
                  xor          t4, t1, sp
                  fdiv.s       fa3, fs2, fs11
                  div          tp, t4, s8
                  slti         s4, tp, -817
                  or           a0, gp, a1
                  xor          tp, s3, s8
                  srai         a5, sp, 29
                  sltiu        s9, s2, 1159
                  mulhsu       zero, a1, tp
                  fmv.w.x      ft9, t4
                  fmv.x.w      t6, fs7
                  sub          zero, t3, a3
                  fnmsub.s     ft2, ft1, fs5, fs11, rdn
                  feq.s        t0, fs4, fa4
                  addi         zero, a4, 1081
                  fmin.s       fs6, ft9, fs4
                  fsgnjx.s     ft11, fa3, fs7
                  or           ra, t1, sp
                  mulhsu       a2, a4, s1
                  sltiu        tp, t5, 1767
                  feq.s        a4, fa2, fs7
                  rem          t4, s9, s6
                  mul          ra, t6, tp
                  sltiu        t4, a4, 178
                  addi         a3, s6, -720
                  nop
                  mul          a1, a3, s2
                  andi         t5, t1, 1922
                  fclass.s     s3, fa3
                  fle.s        a7, ft7, fs2
                  fcvt.s.wu    ft11, s5
                  sra          t3, s4, a4
                  fmsub.s      fs7, fs4, ft11, fs8, rmm
                  or           ra, t6, t0
                  fsqrt.s      ft0, ft3
                  flt.s        a7, fa7, fs5
                  fmadd.s      ft6, fa5, ft10, fa3, rdn
                  fsqrt.s      fa0, ft7
                  sltiu        a6, a6, 1670
                  auipc        t3, 916455
                  and          s6, t1, a2
                  fcvt.w.s     a7, fs1
                  fcvt.s.wu    fs0, s11
                  addi         t1, t1, -1094
                  fsgnj.s      fs5, fa2, ft1
                  remu         t4, s9, s2
                  xor          t1, t1, s2
                  and          s6, s5, sp
                  feq.s        s8, fs1, ft1
                  fadd.s       fs6, fs1, fa5
                  or           t4, t0, s9
                  mul          a5, a6, a2
                  auipc        a4, 836788
                  or           a0, s9, a7
                  fmsub.s      fa3, ft8, ft2, fs8, rtz
                  fmv.w.x      ft7, t2
                  andi         t6, t6, -1255
                  fsgnjn.s     fa2, fa5, fs9
                  mulhu        t3, ra, t3
                  fmul.s       fs2, fa6, ft9
                  add          a5, s0, s8
                  fsgnjn.s     fs3, fa4, ft7
                  fsgnj.s      fs8, ft2, fs10
                  fdiv.s       fs2, fa2, fs4
                  fmv.w.x      ft0, ra
                  slti         t0, a3, -1962
                  fmul.s       ft9, ft1, ft6
                  fnmsub.s     ft0, fs5, ft7, ft10
                  lui          s1, 193211
                  fclass.s     a4, fa7
                  fmul.s       fa5, ft10, ft9, rmm
                  fcvt.w.s     s2, fa5
                  fcvt.s.wu    fs4, t0
                  fnmadd.s     fa1, ft11, fs0, fs4, rmm
                  fsub.s       fa3, ft7, ft7
                  fcvt.wu.s    t1, fa4
                  slt          s4, t1, a5
                  mulhu        t4, a7, t3
                  xor          tp, a0, t4
                  sltiu        a5, s9, -1701
                  div          ra, a6, a2
                  fle.s        s0, fs1, fs0
                  addi         s1, t1, -1401
                  sltu         ra, t6, ra
                  div          a7, s0, a3
                  andi         t4, s8, 692
                  fclass.s     a4, ft2
                  fclass.s     s4, ft5
                  fdiv.s       fs2, ft9, ft1
                  div          s6, s11, s11
                  flt.s        a5, ft8, ft11
                  fadd.s       fs2, fs5, fs10, rdn
                  sub          zero, s1, t6
                  mulhsu       ra, a0, t2
                  slti         s8, t1, 780
                  srl          a3, ra, a1
                  fmul.s       ft2, ft9, fs5, rdn
                  fcvt.w.s     a3, fs3
                  slli         ra, a6, 13
                  fsgnjn.s     fa2, ft8, fa0
                  sra          s3, a7, s9
                  slli         s6, t6, 7
                  fmv.x.w      s0, ft3
                  fmv.x.w      s6, ft2
                  divu         s0, a2, ra
                  fadd.s       ft3, ft4, ft7
                  rem          s3, a4, t6
                  fmadd.s      fa4, ft6, fs8, fs10, rmm
                  fmul.s       fa6, ft11, fs11, rne
                  mulhsu       s2, a6, t6
                  ori          sp, a0, 1233
                  div          t6, s1, a6
                  fmax.s       ft9, ft7, ft9
                  fcvt.s.wu    fs9, a2, rdn
                  addi         s3, s1, -1668
                  and          a7, sp, a4
                  fsgnj.s      ft4, fa4, fs9
                  xor          tp, a2, s9
                  fcvt.s.w     ft11, t6
                  ori          s3, s7, -1624
                  andi         s5, t5, -300
                  fle.s        tp, fs6, fs7
                  fnmadd.s     fs5, ft7, fa7, fa3
                  fsgnjn.s     ft2, ft11, ft11
                  slt          s4, sp, t2
                  div          s5, s7, s3
                  fsub.s       ft11, ft1, ft2
                  xor          s4, a1, s8
                  ori          s9, ra, 399
                  fmax.s       fs6, fs3, fs10
                  addi         t3, a7, -1374
                  sltu         a7, a4, s11
                  mulhsu       a5, a7, t3
                  fdiv.s       fs10, fs9, fs3, rup
                  fmv.x.w      a7, ft4
                  fnmsub.s     ft3, ft9, fs5, ft9, rdn
                  fdiv.s       fs2, fs0, ft2, rup
                  addi         a2, s1, 1276
                  nop
                  mulhu        a4, a4, gp
                  fcvt.s.w     fs7, ra, rmm
                  mul          sp, s3, s4
                  fsgnjn.s     ft5, fs10, fa5
                  fadd.s       ft5, ft7, fs1
                  divu         s8, s8, ra
                  fcvt.w.s     t6, fa1
                  fsgnjn.s     fs5, fs9, ft1
                  fcvt.w.s     s1, fs7
                  mulh         a7, s9, a7
                  fsub.s       ft6, fa2, fs6, rne
                  sub          a3, s9, a1
                  srai         tp, s10, 27
                  sub          t1, s5, s10
                  add          t1, sp, t2
                  remu         a2, s3, ra
                  fle.s        a2, ft4, fs3
                  srli         a1, s7, 25
                  fnmsub.s     fs10, fa6, fs0, ft5
                  xor          s5, s2, t1
                  xor          s9, a3, t5
                  fnmsub.s     fs6, fa2, fa0, ft10
                  sub          t3, s5, t1
                  sub          s10, s5, a4
                  fsgnjx.s     ft3, fa1, fa5
                  rem          a7, s5, s8
                  fmv.w.x      fs6, s0
                  sltu         s1, a5, a5
                  fsgnjn.s     ft10, ft6, ft0
                  div          a3, t3, t1
                  fmv.w.x      fa1, sp
                  sltu         gp, a0, t2
                  slt          tp, sp, t3
                  fle.s        s2, fa1, ft3
                  fmsub.s      ft11, fs9, fa2, fs0
                  feq.s        a4, fa4, fa7
                  addi         a1, a5, -206
                  mulhsu       s4, s4, s1
                  fmin.s       fs0, ft8, ft3
                  fle.s        t1, fs4, ft5
                  fmv.x.w      a4, fs8
                  srai         s1, a7, 12
                  sub          ra, s9, gp
                  nop
                  nop
                  fcvt.s.w     ft11, zero, rup
                  add          gp, s6, s1
                  sltu         gp, t0, t2
                  fnmadd.s     fa4, ft0, ft11, ft11, rmm
                  fsqrt.s      ft2, ft5, rne
                  sltu         gp, a4, t3
                  sll          t5, a5, s8
                  auipc        a6, 47129
                  slti         t3, ra, 1518
                  andi         t6, a6, -8
                  fadd.s       fs0, fs1, fs11, rdn
                  feq.s        ra, fs10, fa7
                  lui          t0, 773254
                  slli         t0, s8, 29
                  fsub.s       ft3, fs8, fa3, rtz
                  sltu         t1, a4, tp
                  srl          t1, ra, t1
                  fmadd.s      fa5, ft6, ft10, fs9
                  fsub.s       fs2, fa6, ft6
                  mulh         t1, s9, s0
                  fnmadd.s     fa4, ft10, fs3, fs8, rne
                  fmv.w.x      ft6, s0
                  xori         a6, t5, -1583
                  fmsub.s      fa5, fs0, fs2, fs10
                  fclass.s     s8, ft7
                  slli         a2, s0, 13
                  feq.s        t3, ft3, ft0
                  addi         t0, t6, -567
                  fdiv.s       ft4, fs8, fs11, rup
                  or           a0, s7, tp
                  flt.s        zero, ft6, fa1
                  add          a5, a3, a0
                  fcvt.s.wu    fa5, s1
                  div          tp, t3, t6
                  rem          zero, s6, t1
                  remu         s9, t3, t4
                  xor          t3, s10, zero
                  add          a3, t0, s4
                  xori         a0, gp, 1019
                  nop
                  fmax.s       ft10, ft8, fa6
                  srli         t0, s0, 24
                  rem          zero, ra, t6
                  fclass.s     t4, fs8
                  fsgnj.s      ft3, ft8, ft3
                  div          s9, t3, t5
                  fmadd.s      fs1, ft9, fs10, ft9
                  srai         gp, a5, 22
                  mulh         a7, s2, s9
                  rem          s10, s5, s0
                  add          a6, t5, s9
                  remu         a6, s11, s0
                  sltiu        s3, s1, -1578
                  mulh         s0, s6, a2
                  auipc        sp, 184826
                  nop
                  fmax.s       fs8, fs7, ft3
                  or           t0, a7, a7
                  fsgnjn.s     ft1, fs4, fs0
                  addi         s10, t2, 969
                  fdiv.s       ft4, fa5, fs11
                  fle.s        s8, ft10, fa7
                  fmax.s       ft5, ft1, ft10
                  srl          t5, t0, a3
                  fnmadd.s     fa7, ft11, fs2, ft1
                  fmv.w.x      ft11, zero
                  fclass.s     s5, ft10
                  fcvt.wu.s    sp, ft3, rdn
                  fmv.x.w      t4, fa1
                  sltu         a0, a5, a1
                  fsqrt.s      fs0, fa2, rdn
                  add          a7, a3, s0
                  fadd.s       fs11, fa3, fa6, rup
                  mulhsu       t3, s1, tp
                  sra          ra, s9, s4
                  srli         t3, s8, 12
                  xori         a4, s6, -1890
                  fmsub.s      fs9, ft5, fs4, ft3, rdn
                  sltiu        t5, t1, 1060
                  addi         a3, s7, 1567
                  fcvt.wu.s    a6, ft11, rup
                  mulh         s5, s3, t1
                  nop
                  fmax.s       fa6, fs2, fa6
                  mul          zero, a6, s0
                  srai         s1, a0, 25
                  fclass.s     zero, fa3
                  xor          s10, a4, a3
                  xor          s9, t4, ra
                  rem          s0, s7, t5
                  sra          s3, s9, t3
                  fsub.s       ft8, ft0, ft10, rmm
                  fdiv.s       fa6, ft0, fs5
                  fadd.s       fs9, ft1, fa7, rup
                  addi         s9, s10, -480
                  fmv.x.w      s5, ft3
                  fcvt.s.w     fs3, t0, rdn
                  fcvt.w.s     s5, fa0
                  fclass.s     zero, ft1
                  fcvt.w.s     a0, ft9, rmm
                  srl          s1, s11, t1
                  feq.s        s3, fs2, fa3
                  remu         sp, t6, t1
                  mulhsu       a0, t0, s8
                  divu         t0, t5, s9
                  ori          a1, a0, -1081
                  rem          t5, t5, s7
                  fadd.s       fa7, ft1, ft7, rne
                  fsgnjn.s     ft5, ft0, fs0
                  fmv.w.x      fs5, a2
                  fnmadd.s     ft8, fs1, fa6, fa4, rmm
                  fnmadd.s     fs2, fs3, fs8, ft1
                  lui          a2, 939008
                  xori         a3, sp, -243
                  andi         s5, s0, -1002
                  remu         a1, s1, s9
                  sll          s3, s9, s6
                  fadd.s       fa0, fs3, ft4, rne
                  fmadd.s      fs2, ft8, fa7, ft9, rdn
                  sub          zero, a3, t5
                  add          s1, a6, s8
                  sltiu        s2, sp, 709
                  fmul.s       ft8, ft9, ft1, rtz
                  fsgnjx.s     ft5, fs8, fa4
                  div          s10, a4, zero
                  feq.s        ra, ft10, fs3
                  sltiu        a2, t2, -1381
                  fmax.s       fs3, ft10, fs9
                  fmadd.s      fs10, fs4, ft7, ft0
                  sra          s4, t6, a2
                  flt.s        tp, fs3, ft0
                  feq.s        s10, ft4, fs2
                  fmv.x.w      s0, fa3
                  rem          s3, tp, a6
                  srl          a1, tp, a3
                  mulh         ra, sp, a4
                  xori         s4, a4, -1908
                  and          t5, a6, tp
                  fsgnj.s      ft11, fa7, fa0
                  fmsub.s      ft8, fs10, ft11, fa2
                  slli         a4, gp, 23
                  fadd.s       fs7, fs4, fs0, rup
                  xori         a4, s2, -730
                  or           s3, t1, s8
                  mulh         s1, a4, t1
                  ori          a4, sp, 1208
                  fmv.w.x      fa0, s7
                  flt.s        sp, fa1, fs3
                  fmv.w.x      fs5, s5
                  mulhu        zero, t2, s7
                  fnmsub.s     fs6, fa6, ft2, ft2, rmm
                  fsqrt.s      ft8, ft3
                  divu         s4, s9, t2
                  and          ra, a0, s2
                  fmax.s       fa6, fs5, fs5
                  sltu         sp, a0, a3
                  mulh         s10, a5, t6
                  slli         s5, s7, 9
                  add          s8, a1, a4
                  sltiu        sp, s10, 1452
                  fsgnjn.s     fa4, fs2, fs10
                  slli         zero, a3, 12
                  fnmadd.s     fa1, fs7, ft0, ft5, rtz
                  fsqrt.s      fa5, ft6
                  add          s0, s4, a0
                  ori          s0, t2, 773
                  fcvt.w.s     a6, fa6, rtz
                  nop
                  ori          a2, s7, 1109
                  mulhu        zero, a2, a0
                  or           t1, s6, t6
                  slt          a7, s0, t3
                  addi         a1, a2, -503
                  addi         a2, t2, 1617
                  auipc        t0, 657535
                  slli         tp, a5, 12
                  div          t4, gp, gp
                  mulhu        s0, sp, s10
                  slti         t5, s2, -562
                  fmin.s       ft2, fa3, fa4
                  div          a2, s6, s7
                  nop
                  div          s1, s2, a0
                  mulhsu       s3, s0, a3
                  fsqrt.s      ft6, fs10, rtz
                  fcvt.s.wu    ft6, s3, rne
                  xori         t0, t1, -1132
                  fmin.s       ft10, ft10, fa2
                  fmadd.s      fs8, ft8, fs5, fs9, rdn
                  fmadd.s      ft1, fs9, fs8, fs6
                  div          s2, a3, a3
                  xori         s10, t6, 1846
                  fsgnjn.s     fa0, fs1, fa6
                  fmv.w.x      ft8, t3
                  fmin.s       fa4, fa2, ft11
                  fsgnjn.s     ft1, fa1, fs1
                  fnmadd.s     ft7, fa6, fa0, ft5, rne
                  sra          t6, s8, tp
                  srai         s2, s9, 21
                  fadd.s       fs8, ft2, ft7
                  feq.s        t1, fa4, fs0
                  fclass.s     s6, fa1
                  slt          s6, a0, s3
                  fmadd.s      ft11, fa3, ft9, fs7, rtz
                  sltu         s3, a6, s7
                  or           s3, t3, t1
                  fcvt.s.wu    fs5, t0
                  fcvt.s.w     ft0, gp, rne
                  slti         sp, s5, 1529
                  fsgnjx.s     fs8, fa5, ft2
                  auipc        s4, 265976
                  flt.s        s3, fa4, fa1
                  auipc        s2, 1004443
                  div          t0, a0, a0
                  fmsub.s      ft1, fs0, fa3, fs4, rne
                  add          t0, t2, s6
                  and          s2, a6, zero
                  andi         a4, t2, -702
                  mul          s4, t6, s4
                  mul          s4, s8, s10
                  lui          a2, 937477
                  slli         s0, a7, 31
                  nop
                  fmin.s       fs7, fs10, ft6
                  fmv.x.w      s4, ft10
                  auipc        t1, 49947
                  rem          s4, s2, t6
                  mulhu        t3, a5, t3
                  mul          s8, zero, a2
                  fmin.s       fs5, fs10, ft5
                  addi         t6, s5, -768
                  srai         s2, t1, 23
                  lui          s4, 766488
                  nop
                  mulhsu       a2, t4, s8
                  fcvt.w.s     a0, ft2, rup
                  fmin.s       ft3, fs7, ft2
                  mulh         s0, s0, s6
                  divu         sp, s6, s0
                  fsgnj.s      fs5, fa2, fs10
                  fmax.s       ft11, fs9, ft3
                  lui          t1, 236245
                  addi         t5, gp, -1023
                  fsqrt.s      fs0, fs9
                  fmin.s       ft1, fs0, fa5
                  fcvt.w.s     ra, fa0
                  and          a6, a2, s9
                  lui          s6, 191103
                  xor          s6, s0, a1
                  or           s0, tp, s0
                  mulhu        t0, a2, a0
                  mulhsu       t5, s11, a0
                  ori          gp, s8, 460
                  andi         a2, t2, -757
                  feq.s        s8, fs1, ft2
                  andi         t5, s2, 2025
                  rem          t0, s6, t4
                  mulh         tp, s9, s1
                  fnmadd.s     fa5, fs3, ft0, fa4, rdn
                  xor          s4, a2, s6
                  sub          a4, a1, s2
                  slti         a1, s1, 551
                  fsub.s       fa3, fs6, fs6
                  sub          a6, tp, ra
                  fmin.s       fs7, ft4, fs10
                  fmadd.s      fa0, ft2, ft11, ft3
                  srli         s1, gp, 31
                  sltiu        a2, s3, -1889
                  rem          a1, s4, a6
                  fnmsub.s     fa7, ft1, fa4, fa4
                  fsqrt.s      fs0, fs4, rne
                  srli         s10, t1, 30
                  divu         s4, s7, t2
                  fle.s        tp, fa0, ft9
                  nop
                  ori          t5, s8, -1443
                  fdiv.s       fs7, ft2, fa0
                  fcvt.s.w     fa1, tp
                  srai         s6, s10, 11
                  fcvt.s.wu    fs3, a7
                  sltiu        t3, a1, 224
                  fmv.x.w      zero, fa0
                  addi         s6, s9, 1086
                  sub          sp, a3, t0
                  ori          a2, s10, -497
                  srl          a7, s8, s8
                  sltiu        a3, a0, -1370
                  fnmadd.s     fs11, fs1, ft1, ft5, rdn
                  fsqrt.s      fs7, fa4
                  and          t4, a7, a2
                  mulhsu       s9, s4, s8
                  auipc        a0, 48173
                  slli         zero, t5, 25
                  slti         s1, ra, 1087
                  ori          ra, tp, 1393
                  and          t6, gp, zero
                  fsqrt.s      fs1, fa3, rtz
                  fadd.s       fs6, ft8, ft5
                  divu         a7, a5, s11
                  div          s10, s2, s1
                  fle.s        t0, fa7, fa6
                  fdiv.s       ft1, fs5, fs1, rtz
                  auipc        t4, 574339
                  rem          s1, t1, s7
                  xor          s4, s7, s10
                  fmin.s       fs8, fs8, ft2
                  fcvt.s.wu    fs9, zero, rdn
                  sub          a3, sp, a1
                  fsgnj.s      fs0, fa2, ft1
                  xori         s10, t5, 1376
                  ori          s3, s7, -239
                  srli         s6, sp, 1
                  srli         s2, s9, 24
                  slti         s1, a2, 1775
                  fadd.s       fs4, ft1, ft8
                  sll          t6, t2, ra
                  feq.s        s8, fa3, fa6
                  addi         s1, t0, -1405
                  fsgnjx.s     fs10, ft1, fs11
                  fcvt.w.s     s2, fs9
                  xori         a3, a5, 1861
                  sub          tp, t3, t6
                  mulhu        a6, sp, a4
                  sll          s0, t4, s8
                  slli         s9, t6, 0
                  mulhu        a4, a6, s4
                  fdiv.s       fs9, ft11, fs11, rmm
                  auipc        t1, 888352
                  andi         tp, a3, 1691
                  sll          s2, a4, s9
                  xori         a1, a3, -1325
                  div          zero, gp, a1
                  fsgnjn.s     ft3, ft7, ft10
                  sra          sp, a6, a0
                  andi         s8, s7, -1789
                  mulhu        a5, s8, zero
                  nop
                  slti         s8, a6, -583
                  fle.s        s2, ft3, ft1
                  fadd.s       ft10, fa0, fs10
                  fsqrt.s      fa6, fs2, rtz
                  fsqrt.s      fa1, fs9
                  flt.s        tp, fa4, ft1
                  addi         a6, s3, 92
                  and          a6, t1, s7
                  remu         a3, sp, s2
                  divu         gp, t4, s6
                  and          t6, a2, s10
                  fcvt.w.s     s0, fa1
                  fsgnjx.s     fs9, fs9, fs0
                  fmadd.s      fs4, ft1, ft7, fa6, rmm
                  srli         ra, s9, 19
                  sltiu        s1, t4, -797
                  sltiu        sp, s4, 861
                  rem          s1, a3, t1
                  add          s2, ra, a7
                  fadd.s       fs2, ft3, ft1, rdn
                  sra          a2, ra, tp
                  fmv.w.x      fa5, t6
                  sltiu        sp, a4, -508
                  fmax.s       fs4, fs0, ft6
                  fmv.w.x      fa6, s1
                  xori         zero, t1, -1143
                  andi         s3, a4, -1419
                  remu         t4, gp, s8
                  fsgnjn.s     fa0, fs10, ft10
                  fle.s        s1, fa7, ft7
                  fsub.s       fa3, fa4, ft2
                  lui          a3, 26145
                  sll          s8, sp, s10
                  remu         a4, s4, s5
                  fmv.x.w      t3, fs11
                  lui          t6, 765575
                  srl          tp, s9, s8
                  sltiu        gp, a1, 1490
                  fmax.s       fs8, ft3, fs1
                  sltu         a3, a1, a2
                  fmv.w.x      ft2, s5
                  or           s9, s11, s1
                  fmv.x.w      a3, fa1
                  fmv.w.x      ft8, s10
                  srl          s5, t5, ra
                  mulh         s6, a2, a5
                  sltu         s3, sp, t4
                  mulhsu       s8, s11, gp
                  fclass.s     s1, fs0
                  fadd.s       fa2, fs8, fs3, rmm
                  addi         a5, a5, 552
                  fmul.s       fs10, fa7, ft10
                  fle.s        s6, fs7, ft6
                  fmsub.s      fs6, ft0, fa3, fs3
                  fsub.s       fa5, fa5, fs5, rne
                  fmadd.s      ft10, fs1, ft7, fa3
                  mulhsu       a5, s1, t2
                  sltu         s2, a1, s2
                  sll          s1, s4, a5
                  fsgnjn.s     fa6, fa2, fs1
                  fmax.s       fa1, fa0, fs6
                  ori          t6, s7, 1345
                  mulh         a5, t6, t5
                  feq.s        s5, fs5, fs6
                  mulhu        t4, s1, s11
                  add          s1, s6, s4
                  srli         t3, a6, 5
                  slli         t4, t5, 4
                  mul          s1, t4, t6
                  xori         s10, t0, -1700
                  mul          t3, s1, a1
                  nop
                  divu         s6, s4, a5
                  fnmadd.s     ft2, ft4, ft2, ft11
                  xor          a3, t1, t1
                  or           s0, t0, s1
                  sltu         t5, s10, s4
                  or           s2, a0, a2
                  mulhsu       s6, a4, a0
                  rem          t6, s4, s10
                  lui          s8, 100106
                  fcvt.wu.s    s10, ft8
                  fmv.x.w      a7, fa2
                  slti         ra, s7, -900
                  srli         s0, s1, 12
                  fcvt.s.wu    fs9, zero
                  fcvt.w.s     t6, fs10, rup
                  mulhu        t0, sp, sp
                  fmin.s       fs0, fs3, fs4
                  sltiu        s8, s3, 827
                  flt.s        s1, ft0, ft4
                  ori          s0, s10, -1431
                  srli         a5, s4, 13
                  xori         s0, s11, -371
                  fmv.x.w      a7, fs3
                  slli         a5, t5, 12
                  srl          sp, s1, ra
                  sltiu        a7, zero, -1749
                  fmin.s       ft7, fs4, fa2
                  auipc        t6, 1031731
                  flt.s        gp, fa0, fs7
                  fmul.s       fs2, fa2, fs3, rmm
                  sub          s0, gp, a1
                  slli         a0, a0, 2
                  xor          zero, s4, s7
                  fsgnjn.s     ft4, ft11, fs4
                  fsub.s       fa4, ft5, fs11
                  fmv.w.x      fs6, s1
                  xor          t5, ra, a3
                  rem          s10, sp, s5
                  fsgnjx.s     fs1, fa6, ft8
                  mulh         t3, s1, s3
                  mulh         zero, a0, s8
                  fle.s        a6, fs8, ft10
                  sra          a4, t2, s1
                  fmsub.s      ft3, ft10, ft4, fa3, rup
                  fcvt.w.s     sp, ft9
                  add          t5, s5, t3
                  and          sp, a6, s9
                  ori          a1, t6, 1386
                  fclass.s     t5, ft0
                  fcvt.w.s     ra, fs11
                  fsgnjx.s     fs1, fs0, ft10
                  addi         a4, t6, 59
                  fsgnjn.s     fa0, ft6, fs9
                  remu         a1, s0, zero
                  mul          gp, s10, s1
                  fadd.s       fs6, fs10, fs6, rdn
                  fcvt.wu.s    a6, fa4, rtz
                  rem          zero, a4, a3
                  and          a6, s2, a6
                  fcvt.s.wu    ft7, s2
                  fmax.s       fs3, fs1, fa6
                  sll          a2, a4, s7
                  fmadd.s      fs0, fs4, ft3, ft3, rtz
                  slti         t1, a4, 851
                  remu         tp, s4, a1
                  auipc        s9, 917290
                  fsub.s       fs7, fs1, fs4, rup
                  remu         t1, t1, s9
                  remu         t5, s2, zero
                  fcvt.s.wu    fa4, a7, rdn
                  slti         ra, s6, 465
                  fcvt.wu.s    s2, fs5
                  slli         a7, t4, 3
                  fmin.s       fs3, ft1, fa3
                  flt.s        t4, fa3, ft11
                  sub          t5, s10, t2
                  fsgnj.s      ft6, ft5, fs4
                  sltu         s10, s5, gp
                  xori         a4, s4, 1238
                  fmsub.s      fs11, fa7, fs10, fs6, rne
                  fle.s        s1, fs1, fs6
                  fmsub.s      fs11, ft8, ft0, fa7
                  feq.s        a0, fa6, ft9
                  flt.s        a3, ft1, fa6
                  sra          a2, a5, a4
                  fadd.s       ft7, fs4, fa2
                  addi         s10, t5, -1817
                  fnmadd.s     fa6, ft0, fs1, fs7
                  fsgnj.s      fa0, fa6, fa4
                  srl          a4, s6, s6
                  fsgnjn.s     fa4, fs5, ft9
                  fmv.w.x      fs0, a6
                  fcvt.s.w     ft10, a6, rne
                  rem          ra, s9, s4
                  rem          a7, s11, s0
                  fcvt.w.s     s2, fs1
                  slti         t0, a6, 47
                  addi         t0, t0, 354
                  remu         a7, s4, a7
                  addi         t6, a4, 1266
                  fcvt.s.wu    ft10, s2, rne
                  sltiu        tp, s9, -855
                  fsgnjx.s     fs7, fs5, fs7
                  remu         s3, s4, a4
                  fmin.s       fs7, fs7, fa4
                  fsgnjn.s     fa4, fs9, fa5
                  fnmadd.s     ft3, ft7, fa1, fs5
                  ori          s1, t1, -93
                  srli         s0, ra, 7
                  or           a2, gp, s6
                  div          ra, s4, sp
                  div          s8, ra, s3
                  fdiv.s       fs9, ft9, ft10
                  fmsub.s      fs0, fa3, fs11, ft10, rtz
                  mulhu        t4, s4, a7
                  fcvt.w.s     t3, fa0, rdn
                  fcvt.w.s     s8, fs11, rtz
                  fle.s        a0, ft10, fa4
                  xor          s8, s6, gp
                  fadd.s       fa6, fs6, ft1
                  fmv.w.x      fs5, a0
                  sub          tp, t1, s5
                  mul          s1, s11, a2
                  xor          tp, a6, t1
                  nop
                  or           a7, s2, sp
                  mulhu        a0, s6, a0
                  mul          s5, s11, t3
                  fclass.s     s4, fs0
                  sub          t3, s6, sp
                  mulh         s0, t4, ra
                  sltiu        s3, a3, -1557
                  lui          s3, 239486
                  fmul.s       fa4, fa1, ft11
                  mulhsu       zero, a1, a1
                  mulh         t3, s7, s10
                  div          t0, a0, t6
                  xor          s8, ra, ra
                  sltiu        s6, s1, 1359
                  srai         a4, t6, 5
                  remu         t0, s5, t0
                  and          gp, a2, s0
                  remu         a5, tp, t1
                  or           s10, s7, sp
                  fnmsub.s     fa4, fs4, fs5, fs8, rmm
                  fsgnjn.s     ft10, fa2, fs10
                  srl          s6, a4, zero
                  sub          a6, s6, s11
                  add          s6, a5, a7
                  sra          a1, tp, t4
                  fnmadd.s     fs2, ft6, fs11, ft7, rup
                  fcvt.s.wu    ft9, zero
                  srl          s4, s8, s6
                  mulhsu       a5, sp, s5
                  fsqrt.s      fa0, fs2
                  div          a1, a3, ra
                  nop
                  lui          s6, 602982
                  fnmadd.s     ft2, ft0, fa6, ft9
                  fmul.s       ft1, ft4, fs6
                  ori          t3, a0, 429
                  add          t3, t2, sp
                  mulhsu       s3, s5, a5
                  sltu         a2, s7, zero
                  fmv.w.x      fa3, s0
                  sub          t1, t0, t4
                  auipc        t6, 624717
                  fcvt.s.wu    ft7, a6
                  xor          a6, a5, s4
                  flt.s        s6, ft9, fs6
                  fcvt.s.wu    fa4, a2, rne
                  add          a0, sp, tp
                  feq.s        a1, fa0, fs0
                  fmadd.s      fs8, fs6, ft9, ft5, rmm
                  slti         t0, a1, -405
                  fmadd.s      ft10, ft3, fa0, fs1, rne
                  fsgnjx.s     fa4, fs0, fs4
                  fcvt.s.wu    ft9, s8
                  slli         a7, a6, 11
                  sltu         s2, a6, tp
                  mulhsu       t1, a7, zero
                  fsgnjn.s     fa7, ft0, ft9
                  fcvt.w.s     t0, ft6
                  fcvt.s.wu    ft4, s8, rmm
                  flt.s        s8, fs3, fs7
                  fcvt.wu.s    t1, fs11, rdn
                  ori          a5, gp, 390
                  srl          ra, t5, s0
                  sra          a2, a1, a1
                  fsgnjx.s     fa3, fs8, fs1
                  mulh         a7, a0, t1
                  fmin.s       fa7, fs2, ft3
                  fnmadd.s     ft9, ft6, fs2, ft11
                  fle.s        a4, fs8, ft9
                  nop
                  sltiu        a3, a2, 1183
                  sub          a0, a0, s6
                  addi         a7, ra, -433
                  fnmadd.s     ft10, ft10, fs7, ft7, rdn
                  fmadd.s      ft4, ft8, ft7, ft5
                  ori          a7, sp, -38
                  add          a1, s7, a5
                  ori          a4, t4, -130
                  flt.s        tp, fs4, fs3
                  sltu         a3, a5, s3
                  fclass.s     s10, ft4
                  flt.s        t5, ft10, fs10
                  srai         a0, s4, 9
                  auipc        gp, 694278
                  fnmadd.s     ft6, ft3, ft4, fs7, rmm
                  or           a3, a0, a0
                  mulhsu       sp, a6, a4
                  fle.s        a6, ft1, fs1
                  sltu         sp, a4, tp
                  xor          a2, s11, s11
                  feq.s        gp, fa1, ft6
                  nop
                  fmul.s       fa4, ft7, ft10
                  xor          t4, s9, s3
                  fmin.s       fa5, fa5, ft10
                  srli         sp, t3, 2
                  slti         sp, a3, 217
                  or           a4, zero, s9
                  fmadd.s      ft11, fa0, fa4, ft6
                  fmv.x.w      t1, fs9
                  srl          a4, s5, t3
                  mul          a4, t2, t1
                  mulh         a6, a1, a2
                  nop
                  mulhsu       a3, s10, t6
                  mulhu        s5, s8, a5
                  mulhsu       s4, ra, a7
                  srl          s5, s2, s9
                  fle.s        sp, ft8, ft11
                  andi         a2, t4, 1248
                  fmul.s       fa4, fs0, ft4
                  fcvt.wu.s    s0, fa5
                  mulhsu       a4, s1, t1
                  rem          t3, a4, s1
                  or           s2, ra, a2
                  fmax.s       fs1, fa3, fs1
                  sltiu        a1, zero, 1313
                  mulhu        t5, t1, s0
                  fnmsub.s     fs2, fa2, fa3, fa7, rdn
                  rem          s6, s1, zero
                  xori         t5, a1, 1148
                  mul          t3, s7, t1
                  srai         s5, t6, 12
                  srli         t3, s4, 5
                  fsub.s       fs11, fs4, fa2, rtz
                  fadd.s       ft8, fs8, fs3, rup
                  and          a7, t1, a0
                  fmax.s       fa3, fs4, ft0
                  fcvt.s.w     ft9, a3
                  xor          t4, a4, s11
                  fmsub.s      ft10, fs11, ft5, fs3, rtz
                  fmax.s       fs6, fs11, fa4
                  fle.s        a7, fa1, ft7
                  sra          t5, s9, zero
                  auipc        t0, 118790
                  fdiv.s       fa2, fa7, ft2
                  fcvt.s.wu    ft2, a0, rup
                  and          t6, t1, s5
                  andi         a3, a1, 1709
                  fnmadd.s     fs6, fs2, fs6, fs5, rtz
                  andi         s1, t6, 1027
                  sra          a7, s11, s3
                  fmul.s       fs3, ft0, fs3
                  rem          t1, a3, t2
                  fdiv.s       fa2, ft9, fs1, rdn
                  fnmsub.s     fs7, fa3, fa5, ft2
                  fcvt.s.w     fa1, t0
                  sltu         a6, s4, a1
                  div          a4, s2, t1
                  fcvt.s.w     fa6, s9, rtz
                  mulhsu       a1, s10, s6
                  fmv.w.x      ft8, s6
                  srai         t4, t1, 30
                  mulhsu       s2, a0, s9
                  slli         s10, tp, 16
                  xor          t3, a2, tp
                  sltu         a1, s7, t6
                  mul          s4, s7, t1
                  slli         s8, t3, 21
                  flt.s        t0, ft7, ft9
                  or           s0, a5, t3
                  fdiv.s       fa0, ft11, fa5, rne
                  div          a7, t0, zero
                  sltu         a7, a7, s7
                  fsgnjx.s     ft10, fa7, fa7
                  add          a1, t6, t0
                  auipc        s1, 654219
                  fsub.s       fa4, ft2, fs6
                  mul          t3, a6, a2
                  fcvt.s.wu    ft6, s1, rdn
                  fle.s        t1, ft8, fs7
                  sub          gp, s1, t5
                  xori         t3, s10, 606
                  fadd.s       fa3, ft0, ft9
                  andi         s5, t5, -529
                  fcvt.s.w     fs6, s1, rdn
                  add          a0, s3, t6
                  add          s3, a1, a0
                  or           s10, s6, s10
                  fadd.s       ft0, fa3, fa7
                  sub          t5, t2, s1
                  andi         t6, a5, 1003
                  mulh         t4, t0, s11
                  fcvt.wu.s    a1, ft1
                  srai         s0, s11, 28
                  mulh         a1, gp, a0
                  mulh         gp, s4, t5
                  sltiu        s3, ra, 1736
                  sltu         a1, tp, s2
                  add          a0, s2, s6
                  ori          s9, s6, 741
                  mulhsu       ra, s4, s0
                  fcvt.wu.s    t5, ft6, rdn
                  and          s10, zero, s9
                  fle.s        a6, ft6, ft1
                  slli         a4, s8, 7
                  add          a2, t1, s3
                  rem          s2, a7, ra
                  fmin.s       ft0, fa7, fs3
                  auipc        a6, 291861
                  nop
                  fnmsub.s     ft10, ft2, fs0, ft6
                  xori         t3, a6, 911
                  fcvt.w.s     a4, ft6, rdn
                  fmsub.s      fs11, fs11, fs10, fa7, rtz
                  fclass.s     zero, ft4
                  sll          a0, s9, s1
                  addi         a2, s3, -856
                  fcvt.wu.s    a2, ft10
                  fmin.s       ft0, fa6, fa3
                  rem          s2, a7, s4
                  fsgnjx.s     fa6, ft0, ft7
                  mulhu        a0, s6, t6
                  fcvt.s.wu    fa6, tp
                  xori         ra, a7, -1841
                  ori          a3, a3, 1436
                  addi         a4, t6, 226
                  srai         t4, s7, 5
                  fsgnj.s      fa4, ft9, fs9
                  fmin.s       fs6, fa0, ft11
                  fcvt.wu.s    ra, fs0
                  sltu         a4, a1, tp
                  fmax.s       fa4, fs11, fs0
                  fmv.w.x      ft7, a6
                  and          t4, s8, s1
                  srli         gp, a3, 26
                  ori          a1, s8, 1257
                  fcvt.s.w     fa7, s0
                  sra          t4, s0, a0
                  fsgnj.s      ft11, ft2, fa5
                  fmv.x.w      a4, fa3
                  srl          s2, s4, a6
                  andi         t5, s0, -1238
                  fcvt.s.wu    fs10, t6
                  fadd.s       ft3, fs5, fs10
                  fcvt.s.w     fs10, t5, rdn
                  fmv.x.w      a7, fa5
                  add          s6, s0, a4
                  flt.s        s5, fa0, fa3
                  nop
                  xori         s6, a6, -536
                  mulhu        t0, s2, s5
                  mulhu        a1, t0, s9
                  sltiu        sp, s7, -1030
                  fmadd.s      fa0, fs6, ft9, ft5
                  ori          s8, gp, 860
                  fmsub.s      fa6, fa7, fs6, fs4, rdn
                  fle.s        a5, ft1, fa1
                  fsgnj.s      fs9, ft11, fs11
                  fdiv.s       fs1, ft11, fs9, rne
                  slt          tp, gp, s9
                  remu         s1, a0, a6
                  remu         s3, a3, s3
                  sltiu        s1, t2, -1988
                  fmin.s       fa2, fs10, fs3
                  fmul.s       fa6, ft5, fs6, rtz
                  fcvt.s.w     ft10, a1, rdn
                  nop
                  div          gp, a0, s4
                  mulhu        a4, t1, a1
                  fsgnj.s      fs1, fs8, fs8
                  fsgnj.s      ft5, fs7, ft3
                  div          t3, t5, s0
                  fmv.x.w      a1, ft10
                  lui          s1, 165409
                  srli         gp, s10, 8
                  sra          t1, a0, s3
                  fclass.s     s8, fs3
                  mulhu        s4, s6, s9
                  sub          t3, s6, s0
                  fdiv.s       ft6, ft0, fa7
                  fnmadd.s     ft3, fs0, fs0, ft3, rtz
                  sub          s9, sp, a2
                  fsgnjn.s     ft9, fa5, fs7
                  mulhu        sp, a5, t1
                  srl          a0, s10, s5
                  fsgnjn.s     ft1, ft6, ft5
                  srl          a6, s6, t3
                  srli         sp, s9, 12
                  fmv.w.x      ft9, s4
                  fmul.s       fs11, fs4, ft3
                  add          s5, s9, a4
                  rem          t6, s1, s9
                  slti         t6, s8, 1194
                  fnmsub.s     fs0, ft7, ft0, fs2
                  div          a7, t1, s2
                  slti         a1, gp, -1692
                  sub          ra, t0, ra
                  fmin.s       fs5, ft3, fs5
                  fdiv.s       fs8, ft9, fa2, rdn
                  fmsub.s      fa1, ft2, fs2, fs3, rtz
                  fcvt.s.wu    ft7, t4, rne
                  divu         t3, s10, a5
                  flt.s        a0, ft10, fa7
                  divu         zero, a4, ra
                  mulhu        s0, t3, t5
                  mulhu        a0, a2, sp
                  mulhu        a4, s1, t2
                  sra          a2, a3, a7
                  nop
                  sll          s9, a6, gp
                  flt.s        t3, fs6, ft9
                  srai         s4, tp, 28
                  mul          t3, t2, t3
                  andi         s4, t1, 1160
                  fsgnjx.s     fa4, fa4, ft7
                  fle.s        a3, ft3, ft8
                  fdiv.s       fs0, ft11, fs0, rne
                  fsgnj.s      ft8, ft1, fa1
                  fsqrt.s      fs6, fs10, rtz
                  fcvt.s.w     fa7, a0, rdn
                  divu         a4, s4, t3
                  flt.s        a6, fs9, ft11
                  fnmadd.s     ft0, ft7, fs11, fs3
                  fmin.s       fs6, fs11, ft4
                  fmin.s       fa1, ft4, ft8
                  addi         a2, a3, -424
                  div          s10, s7, t1
                  mulhsu       a2, a2, s4
                  fmul.s       fs4, fs8, fs7, rne
                  fcvt.s.wu    ft4, zero, rmm
                  sra          a4, s1, t2
                  slli         a3, gp, 28
                  xor          t4, s5, gp
                  fmax.s       fa0, ft7, fs10
                  nop
                  xori         a0, t4, -375
                  sra          s8, s0, a5
                  fadd.s       fs9, fs3, fs2
                  lui          t6, 689408
                  fsqrt.s      ft10, ft9, rup
                  fmv.w.x      fa4, t1
                  addi         t3, ra, 1177
                  sltu         s0, ra, s6
                  fsqrt.s      fa0, fa7, rne
                  sll          a1, t5, s11
                  fsgnjx.s     ft2, fs3, ft10
                  xori         t6, zero, -176
                  auipc        a7, 490825
                  fsqrt.s      ft4, ft0, rmm
                  slti         a5, s7, 609
                  srl          t3, tp, t2
                  divu         t1, s8, s2
                  slti         a3, zero, 577
                  sll          a2, s6, t3
                  rem          s3, a4, s8
                  fmax.s       ft1, ft2, fs6
                  ori          s8, s11, 1913
                  fmax.s       fs11, fa3, ft10
                  fsgnjx.s     ft7, fs1, ft1
                  mulh         a2, t2, zero
                  xor          t4, a7, a0
                  remu         a2, a7, t1
                  fadd.s       ft0, ft2, fs4, rtz
                  slli         t3, a5, 24
                  fmin.s       fa3, fs11, fa7
                  sltiu        t5, t5, -633
                  and          t4, t1, s9
                  fmul.s       fs4, fa6, fa4
                  fdiv.s       ft9, fs10, fs11
                  add          a2, t4, sp
                  fcvt.s.w     ft7, t5
                  xor          a2, ra, gp
                  fsgnjn.s     ft11, ft5, ft1
                  fmsub.s      fa5, fs7, ft6, fs7, rup
                  xor          ra, s1, gp
                  slli         t3, a4, 7
                  fmv.w.x      fa0, sp
                  fsgnj.s      fs9, fs10, fs3
                  fsgnjn.s     ft1, fa4, fa7
                  slt          a1, s11, a2
                  fsgnj.s      fa0, fa5, ft4
                  fmv.x.w      a0, fs3
                  fdiv.s       ft10, ft5, ft7
                  sub          t0, t6, sp
                  srl          t0, a1, s3
                  fle.s        s9, fs8, ft3
                  fnmadd.s     fs6, fs6, fs7, ft1, rdn
                  or           ra, s9, a5
                  fmin.s       ft10, ft0, fs3
                  srli         a0, sp, 13
                  fnmsub.s     ft4, fs6, fa6, fa5, rne
                  fcvt.w.s     s2, ft11
                  fcvt.s.w     ft10, t4
                  fcvt.wu.s    a7, ft7, rmm
                  fcvt.w.s     a3, fs0, rmm
                  fcvt.s.w     ft10, a4, rmm
                  fcvt.s.wu    fa1, a1, rdn
                  fcvt.s.wu    fs4, a6
                  fmv.w.x      ft8, ra
                  fmin.s       fs2, fa6, ft11
                  rem          a4, gp, gp
                  sltiu        s1, t0, -1011
                  div          a4, t4, s9
                  slli         t0, s8, 5
                  remu         s10, s11, t1
                  fsub.s       fa6, fs10, ft3
                  sub          t5, s0, s3
                  xori         s8, t5, -1881
                  srai         sp, a5, 16
                  fle.s        sp, fs11, fs9
                  mul          a0, s8, a5
                  mulhsu       ra, tp, ra
                  mul          a4, t4, t6
                  fcvt.s.w     fs6, t4
                  fmax.s       ft11, ft9, fa0
                  srai         t3, t1, 25
                  sra          s3, s3, ra
                  fcvt.w.s     s5, fa7
                  and          s6, s7, t4
                  sltu         t6, ra, a1
                  feq.s        a0, fs2, fa6
                  srl          a6, t0, s2
                  xori         a7, t3, -189
                  fcvt.wu.s    t5, fs9
                  xor          t5, a1, s6
                  slt          s6, a5, zero
                  fnmadd.s     fs6, fs3, fs0, fa1, rdn
                  andi         t4, t0, -1400
                  auipc        t0, 127376
                  auipc        ra, 501318
                  mulhu        t3, s4, a5
                  fmv.x.w      a0, fs0
                  feq.s        a7, ft10, ft0
                  mulhu        a0, t4, s6
                  srl          t6, a5, t2
                  fmsub.s      ft0, fs11, ft6, ft9
                  sra          a1, s0, s8
                  remu         s6, a4, a1
                  slt          t5, gp, a0
                  fclass.s     sp, ft4
                  fcvt.s.wu    fs7, a5
                  srl          s6, s3, t3
                  slt          s0, tp, t1
                  sltiu        s8, s4, -484
                  fsub.s       fs7, fs3, fs1, rtz
                  mulh         s6, t6, s8
                  fmv.x.w      t1, fa1
                  fcvt.s.wu    fa7, t5
                  fcvt.s.w     ft10, t6
                  addi         s8, ra, 153
                  srli         t4, a7, 9
                  fmin.s       ft0, fs3, fa6
                  sltu         a6, a5, s2
                  fmv.x.w      tp, ft0
                  sll          a2, a5, t6
                  feq.s        s4, fs1, ft10
                  flt.s        a7, fa6, fa1
                  fmul.s       fa7, ft1, ft8
                  fsgnj.s      ft4, ft9, ft7
                  sra          a6, s3, s6
                  fmax.s       fs4, ft1, ft9
                  rem          s8, gp, s0
                  fmv.x.w      a1, fs1
                  remu         t1, s6, s5
                  fmadd.s      ft5, fs6, fs1, ft0
                  fcvt.s.w     ft7, t6
                  divu         t4, zero, a1
                  ori          s1, a5, 207
                  fmv.w.x      ft0, s5
                  slt          zero, zero, s7
                  ori          t1, s1, -1270
                  fnmadd.s     ft6, fs1, fa7, ft11
                  fle.s        ra, ft9, fs8
                  fsgnjn.s     fa2, ft5, ft3
                  ori          s2, t5, -1153
                  div          zero, zero, a5
                  fadd.s       fa6, fa0, ft10, rtz
                  nop
                  fsgnj.s      fs9, ft11, fs1
                  lui          t0, 453099
                  fnmadd.s     fs6, ft5, fs10, fs3, rmm
                  srai         s8, a6, 27
                  sltu         s2, s9, a0
                  fsgnjx.s     fs0, ft10, fs4
                  fmin.s       fs11, ft2, fs11
                  and          sp, sp, t0
                  xor          s1, a3, s11
                  fmax.s       ft9, fa5, ft6
                  fadd.s       fs3, fs5, ft1, rup
                  div          zero, s6, a2
                  addi         a7, gp, -1413
                  and          a5, t0, a3
                  srl          s5, zero, gp
                  feq.s        s0, fs7, fs4
                  fmsub.s      fs3, fs10, fs6, fa3
                  sll          s1, s4, t0
                  fcvt.s.w     fs0, tp, rup
                  sltu         a1, a5, t1
                  fnmadd.s     ft6, ft0, fs8, fa7
                  fnmsub.s     ft0, fa3, fa0, fa7, rtz
                  xor          t1, a0, t0
                  sltu         ra, a4, a2
                  srli         s2, a2, 1
                  slt          t3, s0, s3
                  fadd.s       ft0, fa4, fs4
                  ori          s2, t5, 1547
                  feq.s        a3, fs3, ft3
                  divu         a6, s0, a2
                  fle.s        s8, fa7, ft8
                  fcvt.wu.s    a4, fa5, rup
                  fmv.w.x      fa0, tp
                  fmv.w.x      ft7, s5
                  fsgnjx.s     fs4, fs9, ft5
                  div          t6, a3, a3
                  ori          t1, s4, 1467
                  slti         tp, t3, -361
                  fmul.s       fa6, fa3, fs7
                  add          a1, a7, s4
                  rem          a1, s1, tp
                  or           s1, s0, t6
                  fmv.w.x      fs8, s10
                  auipc        sp, 889653
                  fmv.x.w      a6, fs10
                  srli         s6, t1, 10
                  srai         t4, a1, 10
                  srai         s6, s7, 15
                  or           a3, s5, s7
                  srl          a3, s8, a5
                  fmsub.s      ft11, fs0, ft0, fa0
                  nop
                  fsqrt.s      ft8, fs4
                  xori         gp, s2, -1176
                  ori          ra, t1, 1702
                  sub          t0, t3, sp
                  fle.s        t0, ft8, ft8
                  slli         a1, s0, 14
                  sll          a6, zero, a2
                  slli         t4, s6, 21
                  xori         s3, a6, -709
                  andi         s0, s3, -910
                  fmul.s       fa6, ft8, ft0
                  fclass.s     a0, ft1
                  sltu         a1, a4, a3
                  mulhu        t4, s8, t2
                  mulh         t5, zero, a7
                  addi         s6, a1, 320
                  or           s8, a5, s0
                  addi         s10, a1, 90
                  sub          a7, s6, s1
                  fmadd.s      ft8, ft4, fs2, fs4
                  ori          s4, a2, -1517
                  flt.s        gp, fa1, fs11
                  fsub.s       ft4, ft10, fa7, rtz
                  sltu         t6, a0, s8
                  nop
                  sltu         a5, a1, a0
                  and          s9, t4, t5
                  fdiv.s       ft10, fa5, ft3
                  slt          a3, a2, t0
                  mul          s5, a5, a1
                  xor          ra, s10, ra
                  remu         a1, t6, s0
                  feq.s        s9, fa0, fs5
                  fcvt.wu.s    s4, fs0, rdn
                  mulh         a3, gp, a0
                  feq.s        s3, ft4, fs11
                  mulh         a1, gp, s11
                  addi         s0, sp, 1898
                  fmax.s       ft0, fa7, ft1
                  fmin.s       fa1, fa3, fs3
                  rem          ra, a0, s5
                  div          s4, t5, s4
                  mul          s1, t1, gp
                  fmax.s       fs4, fs1, fs3
                  fsgnjx.s     ft8, fa3, fa3
                  srl          s0, a3, s0
                  xori         s8, a4, -1073
                  nop
                  fsqrt.s      fa1, fa4
                  fsgnjn.s     ft4, fs2, ft5
                  fmul.s       fa4, fs9, fa0
                  fcvt.w.s     a0, fa7, rmm
                  fclass.s     a7, fs10
                  andi         s10, a0, -1848
                  fle.s        zero, fa4, fs1
                  xor          a7, s9, t5
                  andi         t4, a2, 1005
                  fdiv.s       fa1, ft3, ft4
                  fnmadd.s     fs6, ft9, fs9, ft9, rmm
                  srli         a4, a4, 6
                  fmv.x.w      s2, ft10
                  and          a3, a1, s3
                  sub          a6, a2, s6
                  fcvt.w.s     t4, fs0
                  fmax.s       fs3, fs10, fs11
                  feq.s        t5, fa5, fa7
                  fclass.s     t5, ft0
                  sltiu        s8, s11, 374
                  fsgnj.s      ft10, ft8, ft5
                  fsgnj.s      fs2, fs5, ft2
                  fle.s        gp, fs1, ft7
                  fsgnjx.s     fa0, fa2, fa0
                  sra          a4, s10, tp
                  sub          s9, s9, s8
                  divu         t1, s3, s10
                  and          a3, ra, s1
                  slti         a3, a2, 1546
                  fclass.s     sp, ft6
                  fsgnjn.s     fa3, ft7, ft3
                  fadd.s       fs4, ft5, ft6, rtz
                  fadd.s       ft9, ft5, fa6
                  fadd.s       fs11, fs7, fs2
                  slti         t5, t3, 744
                  fcvt.s.w     fs4, a6, rup
                  fcvt.wu.s    s9, ft7, rtz
                  xor          s3, tp, t2
                  srai         a5, s1, 10
                  fsub.s       fs10, fs6, fs8
                  srl          s10, t4, zero
                  slli         t6, a2, 27
                  fmv.w.x      fs8, s7
                  fle.s        a5, fa1, fs9
                  sltu         s9, t3, s8
                  sll          a5, t0, s5
                  fcvt.s.w     fs8, a3
                  andi         t3, t3, -1303
                  sll          t0, s11, t6
                  fnmadd.s     ft3, fs9, ft1, fs11, rdn
                  mul          sp, ra, zero
                  nop
                  divu         s8, s7, s7
                  srl          s2, s4, s2
                  fadd.s       ft11, fs3, ft5, rup
                  auipc        t0, 430241
                  mulh         a0, s0, ra
                  sra          a5, s2, s11
                  and          s8, tp, s9
                  fmv.x.w      s3, fs8
                  mul          tp, a5, a2
                  or           a0, sp, s2
                  fcvt.s.wu    ft6, t0
                  fsqrt.s      fs7, ft5, rmm
                  fsqrt.s      fs2, ft5
                  sltiu        s4, a5, -1429
                  fmul.s       ft4, fs2, ft5
                  fsgnj.s      fs7, fs9, fs1
                  sub          t4, s1, s0
                  fmv.x.w      s0, ft11
                  divu         a4, tp, s3
                  fcvt.s.wu    ft8, a6, rmm
                  ori          t6, s7, -1594
                  srai         a4, s2, 7
                  auipc        a2, 423691
                  fmax.s       fa2, ft10, fs7
                  slt          s5, s0, a3
                  add          zero, s8, ra
                  fle.s        a7, fa5, ft10
                  fsgnjn.s     fs0, fs6, fs0
                  fmadd.s      fs5, ft11, fs1, fs11
                  fclass.s     s0, ft5
                  divu         a7, s3, s11
                  lui          a0, 85184
                  fmul.s       fs3, fa1, fs6, rup
                  fadd.s       ft9, ft7, fa0, rup
                  fmadd.s      ft3, ft8, ft6, ft9, rne
                  rem          t4, sp, a7
                  divu         a7, ra, tp
                  slli         t6, s7, 9
                  fle.s        s9, fa7, fa4
                  ori          tp, t0, -932
                  fmadd.s      ft2, fs2, fs0, fs4
                  fsub.s       ft0, ft0, ft7, rmm
                  fnmsub.s     ft9, ft9, ft0, ft5
                  divu         s3, a7, gp
                  auipc        s6, 514454
                  slti         a1, s3, -169
                  fmsub.s      fa5, fa2, ft6, fa6, rtz
                  fcvt.wu.s    a1, fs9, rne
                  remu         t3, s10, a7
                  lui          a5, 492744
                  mulhu        s8, s5, s1
                  fmv.w.x      fs1, ra
                  rem          a7, a3, a0
                  fmadd.s      fs6, fs8, ft5, fs0
                  xor          sp, a3, a7
                  feq.s        s2, fs8, fs11
                  slli         s1, t4, 20
                  fnmadd.s     ft6, fa0, fa7, ft0
                  slti         t1, t3, 2005
                  feq.s        s4, ft0, fs9
                  fmv.x.w      a4, fs5
                  srli         s3, t4, 12
                  srli         s3, s3, 29
                  and          gp, tp, s0
                  or           zero, zero, s6
                  lui          s3, 564579
                  fmul.s       fs7, fs0, fs7, rmm
                  srai         gp, a5, 3
                  addi         t1, gp, 1705
                  fnmsub.s     ft5, fa5, ft2, fs2, rne
                  sll          s3, a5, sp
                  auipc        s6, 881626
                  xor          ra, s6, t2
                  andi         t4, t6, 952
                  fle.s        sp, fs6, fs3
                  fmul.s       ft5, fs6, fs7
                  nop
                  flt.s        a4, fa0, fa4
                  fsqrt.s      fs3, fa0, rmm
                  fsub.s       fa4, fs3, fa6
                  remu         s4, t0, t6
                  sub          a0, s3, t0
                  xori         t6, zero, -634
                  sll          s9, sp, t1
                  fle.s        s9, fs0, ft1
                  fmsub.s      fs8, fs6, fs6, ft0
                  slli         t6, s2, 30
                  remu         zero, t3, a6
                  slti         a7, a3, 84
                  mulhsu       s6, s0, s4
                  srai         gp, a2, 18
                  fsgnjn.s     fs5, fs11, fs3
                  lui          t1, 112695
                  fcvt.wu.s    s1, fa1
                  auipc        a6, 506775
                  fadd.s       ft0, ft1, ft6
                  mulhu        s4, a0, a0
                  fcvt.w.s     t5, ft1, rdn
                  slti         a5, t3, 1279
                  sra          gp, s2, t0
                  srl          s10, t6, a2
                  xor          s6, s6, t2
                  mulhu        s10, s6, a2
                  lui          t1, 964381
                  div          a7, a1, t5
                  or           zero, t2, sp
                  fmax.s       fs4, fs9, fs9
                  mul          gp, s3, s11
                  mulh         a0, a3, gp
                  fdiv.s       fs1, fa5, ft4
                  slli         t6, a0, 21
                  fnmsub.s     fs10, fs11, ft10, ft5, rdn
                  fmsub.s      fs5, ft1, ft1, fa6
                  auipc        sp, 698346
                  fcvt.wu.s    t1, ft11, rtz
                  remu         t0, gp, s7
                  sll          sp, a2, zero
                  fcvt.s.w     ft1, s0
                  xor          s9, s10, t0
                  fadd.s       fa7, ft4, fa1, rne
                  fcvt.s.wu    fs7, a0
                  fcvt.s.wu    ft0, a5
                  fdiv.s       fs8, fs6, ft7, rdn
                  fmv.w.x      ft0, a0
                  fmul.s       fa7, ft0, fa4
                  lui          s8, 961133
                  andi         a5, t3, 1777
                  slti         a0, t3, -1629
                  auipc        sp, 236699
                  rem          zero, gp, s0
                  lui          s0, 616554
                  sll          t1, t0, a0
                  fmax.s       fa3, fs4, fs0
                  fcvt.s.wu    ft7, tp
                  or           s3, s3, s7
                  fadd.s       ft10, ft0, ft2
                  mul          a5, s6, t5
                  fnmsub.s     fs8, fs11, ft1, ft3
                  sub          s10, t1, a0
                  fcvt.w.s     sp, ft11, rmm
                  fmadd.s      ft8, fs6, fs10, fs1
                  fnmadd.s     fs10, fs11, ft7, fa6, rne
                  fdiv.s       fs10, ft9, fs2, rmm
                  addi         t5, a4, 1625
                  mulh         a1, t0, t0
                  fmax.s       fa1, fa5, fs4
                  mulhsu       gp, s1, t5
                  ori          ra, ra, 1747
                  lui          s8, 731524
                  div          a5, t5, s6
                  fcvt.s.wu    fs6, s4, rne
                  ori          s2, t1, -1230
                  addi         s5, t2, 419
                  sltiu        s10, t0, 1557
                  fmax.s       ft3, fs3, ft8
                  or           s0, s1, a2
                  fmv.x.w      t4, fa6
                  xor          t4, t0, t2
                  flt.s        t6, ft0, fs7
                  and          a5, s8, t0
                  fcvt.s.wu    fa1, tp
                  mulh         ra, t5, t1
                  remu         gp, a1, t4
                  slli         a6, a3, 26
                  slt          t1, sp, t2
                  mulhsu       a1, a6, tp
                  xor          s3, t3, s4
                  fsgnj.s      ft9, fs4, ft11
                  flt.s        a3, fa1, fs10
                  sltu         s3, ra, s1
                  auipc        a4, 475170
                  mulh         s5, a2, t3
                  fmsub.s      fs9, fs7, ft7, fa0
                  mulh         a2, gp, s6
                  fmv.x.w      t5, fa6
                  xori         t4, t4, -477
                  fmv.w.x      fa4, s5
                  and          a0, t3, t0
                  slt          t1, s2, zero
                  mulhu        s9, t5, sp
                  fmadd.s      fa6, fa7, ft0, fs9
                  fmadd.s      fs1, fs11, ft3, fs3, rmm
                  slli         s0, t1, 13
                  xori         a3, a7, 1901
                  mulhsu       s0, t1, tp
                  fsqrt.s      fs6, fs2, rup
                  auipc        a0, 621874
                  sltiu        s9, s2, 1087
                  mul          a6, s11, s0
                  nop
                  slt          a0, t3, t0
                  fmin.s       ft2, fs0, fs10
                  fsgnjn.s     fs11, ft11, fs9
                  fmv.w.x      fs9, s8
                  auipc        t1, 46572
                  fcvt.w.s     a4, fs5, rup
                  fcvt.wu.s    s0, fa3
                  fcvt.s.wu    fa0, t5, rdn
                  lui          a3, 894946
                  mulhsu       s1, sp, s3
                  fsqrt.s      fa7, fs11
                  sub          s10, t4, s10
                  div          a7, a3, t2
                  div          a3, s0, s1
                  fmin.s       fa5, ft4, fs0
                  fsgnj.s      fa4, fs5, fs10
                  or           t4, t5, sp
                  fmul.s       fs2, ft6, fs2, rdn
                  remu         t1, s3, ra
                  fsqrt.s      fs6, fs2
                  fcvt.w.s     a1, ft11, rmm
                  sltu         a3, s1, t1
                  srai         a0, sp, 23
                  auipc        s10, 951436
                  slti         s0, s4, -1416
                  fsgnj.s      fa1, ft8, fs7
                  mulhu        a2, t5, s2
                  remu         t0, a7, s8
                  fle.s        s2, ft11, fa1
                  lui          t3, 857218
                  slti         a4, s5, -1875
                  mul          a1, t2, a5
                  flt.s        s8, fs3, fs1
                  sll          t6, a4, a3
                  fsub.s       ft0, ft4, ft6
                  fsgnjx.s     ft2, ft5, fs7
                  fmv.w.x      fs4, a6
                  add          s6, a2, a6
                  fmsub.s      fs5, fs6, fa1, fs6
                  or           gp, ra, s3
                  flt.s        tp, fa0, ft10
                  fsgnjx.s     fa1, ft10, fa5
                  auipc        s2, 224887
                  or           a0, t2, s1
                  fmax.s       ft2, fa1, fs5
                  slt          a5, zero, t6
                  sra          a1, s2, zero
                  mulhu        t0, a5, s3
                  lui          ra, 708365
                  srli         a3, ra, 7
                  fle.s        a7, fa0, ft11
                  ori          s4, t1, -893
                  fcvt.w.s     s9, fs6, rne
                  fsub.s       fs4, fs8, ft2
                  fnmadd.s     fs2, fs2, ft4, ft11
                  sub          s8, a3, t4
                  mulhsu       zero, s9, a4
                  sltu         a7, s10, s10
                  mul          zero, s4, t2
                  sltu         a1, s7, a6
                  add          s3, s7, s11
                  or           a2, tp, t1
                  fadd.s       fa4, fa7, fs3
                  add          s3, a0, a2
                  fmadd.s      ft8, fa0, ft11, fs8, rtz
                  and          a1, s2, s5
                  andi         zero, t2, -355
                  fmul.s       fs0, ft11, ft6
                  srai         s0, a7, 10
                  lui          s8, 327701
                  slli         a6, a0, 22
                  mulhu        a1, s8, s7
                  feq.s        s3, fs10, fs2
                  fsgnjn.s     ft7, fs8, ft1
                  sltu         s10, s5, a3
                  div          s3, a1, a2
                  fsgnj.s      fs1, ft10, ft4
                  lui          a2, 601308
                  fle.s        t0, fs0, ft2
                  ori          a3, t5, 1314
                  fsub.s       ft1, fs9, fa1
                  nop
                  sltiu        s6, s5, 1714
                  addi         t0, t0, -1506
                  fmin.s       fs0, fs8, fa6
                  fmsub.s      fa7, ft9, fs9, fa5, rtz
                  fclass.s     a4, ft5
                  flt.s        s9, ft6, ft5
                  mulhu        t0, t1, tp
                  rem          s8, s4, s11
                  fcvt.w.s     gp, ft7
                  fcvt.wu.s    a1, fs6, rmm
                  fnmadd.s     ft7, fs11, fs8, fs0
                  ori          s10, t0, 1536
                  sll          s5, a0, t1
                  xor          t5, s11, zero
                  sll          s1, t5, a6
                  or           tp, a7, t4
                  fsgnjn.s     fs2, ft11, ft4
                  fcvt.wu.s    s0, ft10
                  fsgnjx.s     ft1, ft10, ft10
                  fmin.s       ft10, fs4, fa6
                  sub          s5, t2, s0
                  srai         a6, s1, 5
                  xor          s6, zero, t3
                  fcvt.s.w     ft5, a6
                  srl          tp, t0, gp
                  fle.s        t0, fs9, ft10
                  fsub.s       ft5, fa7, fs11, rne
                  fcvt.s.w     ft6, gp, rup
                  xori         a1, tp, 891
                  mulhu        s0, a1, gp
                  fsgnjn.s     fa4, ft11, ft8
                  nop
                  sltiu        a7, a6, 781
                  fcvt.s.wu    fa1, a4
                  feq.s        t3, fs8, fs5
                  sra          t3, a5, t2
                  fle.s        a7, fs8, ft0
                  add          a3, s3, s9
                  fclass.s     s4, fs1
                  or           a7, t5, a4
                  fsgnjx.s     fs11, ft0, ft1
                  fsgnjn.s     fs9, fs2, fa5
                  ori          zero, a3, -1569
                  fsgnj.s      fs7, ft3, fa3
                  fsqrt.s      ft6, fs5
                  srli         s0, a1, 31
                  fmin.s       fs1, fs4, fs7
                  fnmsub.s     fa1, fs8, ft0, ft1, rne
                  srl          a1, s7, t0
                  fsqrt.s      fa7, ft5
                  fnmadd.s     fs3, ft11, ft11, fa7, rup
                  nop
                  fcvt.s.wu    ft7, a0, rdn
                  or           a1, t4, a7
                  fmul.s       fa4, fa1, fs4, rup
                  add          zero, t0, gp
                  fsgnjx.s     fa1, ft2, fs0
                  addi         a4, a1, 1607
                  mulhsu       a3, a0, t3
                  fadd.s       ft0, ft5, fs3, rtz
                  and          zero, a4, s4
                  fadd.s       fa5, fa4, fa0, rdn
                  remu         a5, s3, a0
                  mulhu        t4, a3, tp
                  mulhsu       s2, s1, s1
                  fsqrt.s      ft5, fa5
                  srl          s10, a5, s0
                  auipc        s3, 261871
                  slti         a2, a7, 1580
                  fmax.s       fs6, fa2, fs1
                  fcvt.s.w     fs4, s7, rdn
                  fsqrt.s      ft2, fs8
                  fdiv.s       fa3, fs10, fs3
                  fmadd.s      fa0, fs11, fs4, fa0, rne
                  srli         s9, t0, 15
                  fclass.s     s4, fa0
                  fsub.s       fs5, fa3, fs1
                  div          t6, s7, s6
                  srl          s2, a2, t0
                  nop
                  fcvt.w.s     s1, fa4, rmm
                  add          a0, a3, a3
                  srli         t0, t2, 19
                  fcvt.s.wu    ft0, s0
                  srai         t1, s0, 30
                  fnmadd.s     fa2, fs10, fs9, fs9, rdn
                  fclass.s     a3, fs5
                  fsqrt.s      fa3, fs10, rup
                  slli         a7, a6, 10
                  slt          zero, s9, s10
                  srai         gp, a1, 3
                  addi         t0, a7, -1467
                  fclass.s     a4, ft10
                  fdiv.s       fa2, fa3, ft1
                  xori         zero, a4, 600
                  mulh         s9, s10, s1
                  fcvt.s.wu    fs1, gp, rup
                  fadd.s       ft7, fs1, ft7
                  fmsub.s      ft2, fs4, ft5, fs3, rtz
                  xori         tp, s3, -1942
                  sub          a3, a0, s8
                  fcvt.s.w     fs8, a7, rdn
                  fmax.s       fa2, ft7, fa6
                  sub          s5, a1, s8
                  fsqrt.s      fs2, fs4
                  divu         s10, a0, t4
                  fle.s        a3, fa3, fs1
                  addi         s0, a2, 1703
                  fnmsub.s     ft0, fs2, ft1, fa0, rdn
                  fcvt.s.wu    fs1, a0
                  remu         ra, a0, s1
                  flt.s        s9, ft1, ft9
                  srai         s9, s4, 9
                  mulhu        s5, s9, s2
                  srai         a3, t4, 27
                  sll          tp, ra, s2
                  nop
                  fle.s        tp, fs2, ft1
                  and          s3, s6, t2
                  fsqrt.s      fs1, fs11
                  xori         s6, a1, 1015
                  add          s9, s9, s5
                  sub          a5, tp, s8
                  slti         t0, s3, -1369
                  mulhu        s4, a0, t1
                  ori          a2, t3, -943
                  add          t5, t2, zero
                  auipc        tp, 475152
                  ori          a4, s7, 1199
                  fsub.s       fa7, fs11, fa1, rdn
                  fadd.s       ft4, ft6, ft0, rup
                  fmadd.s      ft11, fs3, fa0, fs11
                  or           gp, a6, s1
                  mulh         s6, s2, s4
                  fnmadd.s     fs0, ft2, fs0, fa5, rmm
                  fcvt.s.wu    fs2, s8, rtz
                  mulh         s9, zero, t2
                  divu         a4, gp, s9
                  fsqrt.s      fs10, fs1, rmm
                  mulhu        s6, s2, a5
                  mulhu        s5, s1, ra
                  fadd.s       ft11, ft1, ft10, rtz
                  slt          a3, t5, t5
                  fmin.s       fs3, fs2, fs10
                  fcvt.s.wu    fs2, s8
                  fnmadd.s     fs8, fs6, ft3, fa3, rdn
                  slti         s5, zero, 886
                  mul          s1, s9, t5
                  fcvt.w.s     s9, fs3, rtz
                  fsqrt.s      fa5, ft4
                  srl          t1, t5, s10
                  fsgnjn.s     fs11, fs1, fa6
                  fcvt.s.w     fs3, a4, rtz
                  fcvt.s.wu    fs1, tp
                  fmadd.s      ft6, fs8, ft1, ft9, rtz
                  remu         s1, s7, s10
                  slli         sp, a1, 28
                  fmax.s       ft10, fs3, fs2
                  fsgnjx.s     fa7, ft1, fa2
                  srli         ra, tp, 17
                  ori          s6, t2, -1305
                  fsqrt.s      ft2, fs6, rtz
                  xor          a5, s3, s2
                  fnmsub.s     ft5, ft4, fa1, ft2
                  sltu         s4, s3, a7
                  xor          t0, t0, s0
                  fcvt.w.s     ra, ft7, rup
                  andi         t1, a1, -1770
                  add          a6, t0, a7
                  srai         a6, zero, 14
                  mulhsu       a4, s1, s4
                  fcvt.wu.s    gp, fa2, rtz
                  nop
                  sub          s6, s0, s4
                  fle.s        a7, ft2, fs11
                  fsgnjx.s     ft2, fs8, fa6
                  mulhsu       s6, t0, t6
                  fmv.x.w      a6, fa4
                  flt.s        s9, ft9, ft1
                  fcvt.w.s     s1, fa3, rmm
                  ori          t5, a0, -1356
                  fmul.s       fa4, fa2, ft10
                  mulh         sp, s5, s3
                  srli         s5, s11, 25
                  fmul.s       fa0, fa7, ft10
                  remu         a4, a1, a4
                  lui          s6, 335875
                  fcvt.wu.s    s0, ft5
                  sub          t0, s1, a7
                  fdiv.s       fa0, fs8, ft6
                  or           tp, s4, a0
                  fsub.s       fa4, ft9, ft4, rne
                  andi         t5, t1, -1568
                  addi         a3, tp, -1633
                  fmul.s       ft6, fs2, fa2
                  xori         s10, s7, 651
                  xori         t6, a7, 101
                  fcvt.w.s     t0, fa3
                  slt          s5, ra, ra
                  feq.s        a1, ft5, ft8
                  addi         s3, s2, -1752
                  mul          tp, t4, t4
                  mulhsu       a6, t0, s3
                  sltiu        ra, s0, 649
                  srl          t5, t3, s3
                  fcvt.w.s     s9, ft11
                  fmsub.s      ft10, fa4, ft5, ft6
                  or           a6, a1, s7
                  xor          gp, sp, s3
                  fdiv.s       ft5, ft5, fs1
                  fmv.w.x      ft7, tp
                  div          s2, s0, s7
                  srl          a6, s4, tp
                  mulhu        t5, a6, s6
                  fcvt.s.w     fa7, t6, rup
                  fsgnjx.s     ft8, fs0, fs3
                  rem          a4, zero, s0
                  add          s0, a3, a7
                  addi         zero, ra, -861
                  fle.s        s1, fs2, ft7
                  fmadd.s      fa3, fs0, fs7, fa5, rup
                  fsgnj.s      ft6, fs9, fa7
                  or           a7, tp, t5
                  add          zero, s3, t5
                  fcvt.s.wu    fa5, ra, rup
                  fcvt.s.w     ft11, t6
                  feq.s        a6, ft11, fa4
                  slli         s9, s8, 2
                  addi         tp, zero, -173
                  fsgnj.s      fs6, ft2, ft11
                  fmin.s       fa2, fs5, fa1
                  fmv.w.x      fa6, t2
                  auipc        t1, 1022653
                  flt.s        s2, ft8, fs6
                  ori          s6, s2, -524
                  div          s2, s1, s10
                  xori         t5, s7, 612
                  mul          a2, a1, a1
                  slli         tp, a3, 11
                  fsub.s       fa5, ft7, fa4
                  divu         s8, t5, a3
                  srl          ra, s0, s3
                  fcvt.w.s     s1, fs10
                  fcvt.w.s     s9, fa7, rmm
                  slti         s2, gp, 2033
                  fnmadd.s     ft5, ft0, fs2, ft6, rne
                  mul          t1, a1, a6
                  sltiu        a4, a2, -10
                  fcvt.s.w     ft7, sp
                  slt          s8, a2, a7
                  slti         s9, s10, 2037
                  slt          a1, sp, t2
                  slt          a0, t2, a2
                  div          a5, t0, t5
                  sra          t4, gp, t6
                  fmv.x.w      a5, fa2
                  fmsub.s      fs9, fs2, fs0, ft9
                  mul          s2, t3, s10
                  sra          t6, t6, a1
                  rem          s2, s6, s9
                  divu         s3, tp, t4
                  fmv.w.x      ft9, tp
                  fmul.s       fs7, fs3, fs6, rup
                  fmv.x.w      t0, fs2
                  andi         s6, a3, -361
                  and          s5, s5, t3
                  fmsub.s      fa4, fs10, ft10, ft9, rmm
                  lui          s2, 1000893
                  fmadd.s      fs10, fs0, fa0, fa3, rup
                  mulh         t4, a7, s5
                  auipc        tp, 83494
                  divu         s5, zero, ra
                  nop
                  and          a3, s10, gp
                  or           s9, a7, tp
                  mul          s4, tp, zero
                  fcvt.wu.s    a7, ft8
                  auipc        s5, 1037360
                  flt.s        t3, fs2, fs8
                  srai         s6, s9, 18
                  srai         t3, tp, 8
                  and          tp, s4, a2
                  sll          t1, t5, s2
                  andi         a6, s7, -1461
                  fclass.s     a0, fa0
                  slti         s3, s2, 1136
                  sra          t3, s3, s8
                  divu         t4, tp, s1
                  addi         s1, s11, -1846
                  fmadd.s      ft4, fs11, fa3, ft8
                  fsqrt.s      fs11, fs6, rmm
                  addi         zero, t4, -1774
                  add          s9, t1, s8
                  slti         a7, sp, 714
                  add          s8, t0, t2
                  fsub.s       ft8, fa4, fs8, rup
                  fclass.s     s8, ft5
                  fsgnjn.s     ft9, fa2, fa4
                  fmax.s       ft1, ft3, fa0
                  fmv.x.w      s9, ft1
                  flt.s        s10, fa4, fs10
                  slti         ra, a0, 1381
                  sltu         gp, ra, zero
                  fmsub.s      ft5, ft6, fs1, fa4
                  slt          s6, zero, a7
                  fmul.s       ft10, ft8, fa6
                  sll          s10, zero, s4
                  fmsub.s      fs1, ft7, fa3, fs6, rmm
                  slt          a2, a2, s2
                  fsgnjn.s     fs9, fs3, fa5
                  fnmsub.s     ft5, fs5, ft6, ft10, rtz
                  ori          a1, a4, -330
                  srl          a4, t3, zero
                  nop
                  mulh         t1, s5, s1
                  xor          s4, a6, s1
                  srl          a6, t4, s8
                  fcvt.wu.s    zero, fa1
                  mulh         s4, s4, t6
                  and          gp, t4, a1
                  fsqrt.s      fs8, fs10
                  remu         s2, ra, s11
                  andi         sp, s4, 1054
                  srli         t5, a4, 14
                  fmul.s       fa0, ft9, ft11
                  fcvt.wu.s    s4, fs9, rup
                  fmv.x.w      s6, fs11
                  xori         s0, s5, 1685
                  and          t0, t0, t1
                  and          t1, s2, a2
                  div          s10, s0, s9
                  auipc        s4, 580183
                  slt          a6, s8, tp
                  fadd.s       ft1, ft3, fa7, rne
                  srli         a5, s9, 18
                  fsgnjx.s     ft6, fa7, fs5
                  slt          a1, s7, t5
                  fsgnjn.s     ft2, ft5, fa7
                  fnmsub.s     ft6, fa0, fs2, ft1, rup
                  fsgnj.s      fs1, fa7, fa7
                  mulh         t5, t5, s10
                  mulh         s10, t6, a6
                  fcvt.s.w     fa6, t4
                  fmv.w.x      fa6, a0
                  fcvt.s.wu    fs9, t3, rup
                  fnmadd.s     ft10, fa7, fs11, ft5, rne
                  fmul.s       fs1, ft8, fs1
                  fcvt.w.s     t6, ft1
                  fmsub.s      ft4, ft1, fs5, ft2, rup
                  fmadd.s      fs10, ft4, ft11, fs4, rtz
                  lui          s8, 449408
                  fsgnjx.s     ft6, ft1, fs0
                  addi         a1, a6, -169
                  fmsub.s      fa4, fs8, fs7, ft6, rup
                  srli         t6, s7, 27
                  auipc        a3, 744735
                  sll          s10, s9, s1
                  xori         ra, a4, -272
                  ori          a1, s6, 912
                  fnmsub.s     fa1, fa2, ft2, fs4
                  fmadd.s      ft0, ft3, fa3, fa2, rtz
                  fsgnjn.s     fs8, ft2, ft7
                  fsub.s       fa6, fa5, fs0
                  addi         s10, t4, 923
                  fmax.s       fs10, fa2, fs5
                  fmsub.s      fs11, fs4, fs0, fa3
                  fcvt.s.w     ft1, ra
                  remu         a4, gp, a7
                  srai         a1, t5, 23
                  lui          s5, 754457
                  xori         a6, tp, 1709
                  sub          a7, s6, gp
                  andi         s2, a6, 1748
                  and          s1, gp, s0
                  slt          s3, s10, t3
                  fle.s        a6, fa4, ft10
                  mulhu        ra, s7, s0
                  fnmsub.s     fa4, fs7, fs5, ft8
                  sltu         sp, t5, s11
                  lui          gp, 38111
                  sltu         a5, s1, s6
                  feq.s        s2, ft6, fs0
                  lui          t4, 560940
                  sra          s9, zero, t3
                  mul          gp, t5, s9
                  srli         s4, s8, 25
                  sltiu        a4, a2, 2044
                  and          a5, s3, t0
                  slt          t1, zero, a0
                  xori         t3, s5, 369
                  fsgnjx.s     fa3, fs4, fs0
                  auipc        s6, 133650
                  fcvt.w.s     sp, fs11
                  slt          ra, t6, t1
                  xor          a0, s11, s11
                  sll          zero, t1, zero
                  fsgnjn.s     fs9, fa2, fs11
                  flt.s        t1, fs4, fs1
                  div          zero, s4, t5
                  fnmsub.s     fa1, fa7, ft5, fs1
                  feq.s        t1, fa3, ft6
                  auipc        s0, 546903
                  srl          a1, s2, s10
                  addi         t4, a5, -1480
                  ori          a0, t0, 1559
                  rem          s8, sp, s8
                  sub          a0, s4, s10
                  fmsub.s      fs4, fa7, fa7, ft1
                  fcvt.wu.s    tp, ft1
                  xor          sp, t1, gp
                  or           s1, a2, t2
                  feq.s        s1, ft7, fs2
                  fle.s        t1, ft1, ft9
                  ori          a5, t2, 462
                  div          s4, s7, a4
                  fnmadd.s     ft11, fs1, fa2, fs6, rne
                  fmax.s       fs6, fs3, fs3
                  or           a5, s9, a2
                  fsgnj.s      fs0, ft2, ft4
                  mul          tp, tp, gp
                  fmin.s       ft4, fs8, fa4
                  addi         ra, t5, 1262
                  sltiu        a3, t2, 1154
                  mulh         s6, ra, a3
                  fcvt.w.s     s9, fs7, rne
                  mul          s10, s2, s7
                  sltu         t4, s9, tp
                  ori          s10, zero, 1901
                  fmadd.s      ft9, ft11, fs10, ft1
                  flt.s        s2, fa1, ft6
                  xor          s8, t5, s7
                  auipc        s3, 735803
                  xori         a3, a5, -474
                  mulhsu       t4, s9, tp
                  fsgnj.s      fs6, fs0, fs4
                  fmul.s       fa6, ft2, ft5, rdn
                  div          t3, t1, t1
                  rem          s3, t0, s6
                  nop
                  xor          t1, s10, a1
                  srl          s4, a6, a3
                  flt.s        s1, ft11, fa3
                  fsgnjx.s     ft2, ft10, fs4
                  fadd.s       fs1, fa7, ft11
                  fsgnj.s      fs1, fa6, fa3
                  fadd.s       fs6, fa1, fa5
                  fadd.s       ft4, ft4, fs7, rtz
                  fmadd.s      ft8, ft0, ft5, ft9, rup
                  fclass.s     t0, fs6
                  fadd.s       ft5, fs0, ft0, rdn
                  slli         sp, a5, 24
                  slt          a6, s5, t6
                  div          s5, t3, s7
                  fmv.x.w      t6, fs9
                  fmin.s       ft9, ft10, ft4
                  fsgnjx.s     fa3, fs7, fa6
                  div          s8, s11, s10
                  lui          t5, 135372
                  mul          sp, t2, s8
                  fcvt.w.s     t5, ft4, rdn
                  srai         t1, s3, 31
                  sub          s8, s10, s1
                  addi         ra, a7, -757
                  sra          t4, s8, s1
                  mulhu        s10, sp, s7
                  fcvt.s.wu    fs6, zero
                  fsgnj.s      ft8, ft0, ft8
                  fadd.s       ft5, fs9, ft1
                  divu         sp, t2, a2
                  sll          tp, s9, s3
                  sub          a4, tp, sp
                  slt          ra, t1, a4
                  fsqrt.s      ft1, ft4, rne
                  fcvt.wu.s    a0, fa1, rtz
                  sltiu        t3, sp, 580
                  fmv.x.w      s8, ft4
                  fmv.x.w      zero, fa4
                  rem          a6, s11, a1
                  fsgnjx.s     ft6, fs10, ft11
                  xor          sp, a3, s5
                  flt.s        a3, ft6, ft3
                  xor          s2, t2, a1
                  lui          tp, 36398
                  mulh         s0, s2, a1
                  fsgnjx.s     fa2, fs6, ft0
                  sll          a6, a1, s7
                  sltu         a6, a6, s11
                  mulhu        s0, ra, a0
                  sltiu        s2, a6, -1969
                  slli         s4, t5, 21
                  div          t3, s2, s1
                  fnmsub.s     ft2, fa7, fs11, fs9
                  fcvt.s.wu    ft6, s9
                  slli         t3, s6, 18
                  fmv.w.x      ft10, a0
                  fmax.s       fs9, fa1, fs10
                  andi         t5, s1, 378
                  fmv.x.w      a2, fa1
                  mulhu        s10, a1, s4
                  fnmadd.s     fs2, ft1, fs8, ft9, rdn
                  mulhsu       a3, t0, t4
                  andi         tp, t5, -1840
                  xori         a5, gp, -211
                  srl          t0, tp, s8
                  slli         s1, t5, 25
                  fmadd.s      ft2, fs4, fs7, fa3
                  andi         s10, ra, -1059
                  srli         a6, a1, 6
                  andi         ra, a2, -1070
                  slt          a0, s3, t4
                  div          t4, s2, sp
                  or           tp, s11, t3
                  fnmadd.s     fs1, fs5, fs11, fs6
                  slli         s6, t4, 7
                  fmin.s       fs2, ft7, ft7
                  mulhu        a0, t5, s3
                  mul          s9, s10, s7
                  fsqrt.s      ft6, fs3
                  fmadd.s      fs7, ft11, fs1, fs6, rne
                  ori          s10, s8, -294
                  fle.s        s10, fs7, fs5
                  fnmsub.s     fs2, ft3, ft10, ft8, rup
                  fsub.s       fs10, fa2, fs5, rmm
                  fmsub.s      fs0, fs11, ft5, fs5
                  mul          s2, a5, s3
                  fcvt.w.s     a2, fs5
                  fdiv.s       fa6, fa0, fs11
                  fsgnjx.s     fa3, fa5, ft9
                  fmin.s       fs3, ft5, fs5
                  mulhsu       s10, zero, ra
                  fmadd.s      ft9, fs11, ft4, fa0, rtz
                  add          t4, a5, tp
                  fnmadd.s     fa5, fs10, ft10, ft6, rne
                  fcvt.s.wu    fs4, a1, rmm
                  fmax.s       fs11, ft1, ft7
                  lui          s1, 611600
                  fsgnj.s      fs4, fa1, fs11
                  fclass.s     a7, ft11
                  fmv.x.w      t3, ft11
                  xor          a1, s11, t5
                  fcvt.wu.s    t4, fs2
                  fsgnjx.s     fs8, ft3, fs0
                  fcvt.wu.s    a6, fs9, rup
                  fadd.s       ft2, fs0, fa3, rmm
                  fsgnjn.s     ft3, ft11, fs10
                  fmsub.s      ft6, fs2, fa4, fs9
                  fclass.s     a4, fa5
                  fsgnj.s      fs3, ft11, ft6
                  fmv.w.x      fs2, t3
                  mulh         a7, s2, s6
                  ori          s8, t5, 1516
                  fcvt.s.w     ft4, s1
                  fsgnjx.s     fa2, fa4, fs2
                  slli         s9, t4, 23
                  srai         t3, a2, 18
                  fmul.s       fa2, fs10, fa7
                  srl          t4, s0, gp
                  fsub.s       fa3, fa7, fa5
                  mulh         a6, s2, s1
                  slti         a3, s6, -495
                  fclass.s     a5, ft7
                  fmadd.s      ft0, fa1, fs8, fs7
                  fmax.s       ft2, fs5, fs6
                  remu         s9, s3, ra
                  sltiu        a0, t0, 1459
                  sltu         t3, t4, t2
                  fnmadd.s     fa1, fs10, ft4, fs0
                  andi         s6, s11, -569
                  fmv.x.w      a5, fs4
                  and          s3, s10, zero
                  fle.s        s2, fa6, fs5
                  sll          tp, s8, sp
                  srli         tp, s4, 27
                  divu         t6, t6, s4
                  mulhsu       t0, s1, a3
                  or           gp, s10, a3
                  slti         t5, s5, -1851
                  fmadd.s      fs3, fa3, ft4, fa6
                  remu         gp, s7, s4
                  fsgnjn.s     fs2, fa5, ft6
                  fle.s        a3, fa1, fa7
                  fsgnjx.s     ft1, ft8, fa7
                  fcvt.wu.s    t0, ft9, rdn
                  fnmsub.s     ft10, ft11, fs8, fs11
                  xor          t4, t5, sp
                  flt.s        s4, fs1, fs5
                  sll          tp, s11, s1
                  feq.s        a3, fs10, fs5
                  sll          a5, t4, s6
                  fcvt.w.s     t5, fa1
                  mulh         s2, a4, s10
                  divu         ra, s8, gp
                  fmul.s       ft6, ft8, fa6, rdn
                  fmin.s       ft9, fa6, ft7
                  nop
                  fmax.s       ft7, fs9, ft7
                  sra          a1, a4, ra
                  feq.s        gp, ft8, fs4
                  sltiu        s2, a0, -1925
                  fsqrt.s      ft4, fa2
                  addi         s5, s0, 1595
                  add          sp, t6, a1
                  fmul.s       fs0, ft4, ft1, rmm
                  srl          s6, s3, s11
                  fcvt.wu.s    a4, ft9
                  fmax.s       fs4, ft2, ft3
                  fmul.s       fa6, fs0, fs1, rmm
                  sltiu        t4, s2, -320
                  fcvt.w.s     tp, fa1
                  rem          s8, s0, zero
                  fnmsub.s     ft1, ft11, ft8, ft2, rne
                  fsqrt.s      fs4, fa7, rmm
                  fsgnjx.s     fs11, ft11, fs3
                  slt          a3, s3, a1
                  fmax.s       fa4, ft7, ft3
                  andi         ra, a1, 740
                  ori          s9, t3, -203
                  fnmadd.s     ft4, ft8, fs0, ft9
                  sra          s6, s2, a7
                  slli         s6, t4, 7
                  fadd.s       fs0, ft0, ft5, rmm
                  fcvt.s.wu    fa2, a2
                  fcvt.w.s     s1, fs8
                  flt.s        t4, ft5, ft2
                  fmin.s       ft9, fa1, ft7
                  divu         t5, a2, s4
                  fcvt.s.w     fa1, a4, rdn
                  fmin.s       ft5, ft6, ft11
                  and          t1, a6, a6
                  sra          gp, t2, t6
                  srai         s1, t0, 9
                  fsgnjn.s     ft6, ft8, fa6
                  feq.s        t3, fa5, fa2
                  fnmadd.s     fs0, fs7, ft4, fs8, rne
                  fcvt.wu.s    s5, fa1
                  sll          zero, a7, zero
                  fmul.s       ft4, fa1, ft2, rdn
                  add          a3, t2, t6
                  sub          s0, t0, a0
                  remu         a6, t0, s2
                  srai         t3, a2, 18
                  sltiu        a5, s6, 1243
                  lui          tp, 768071
                  sub          s9, sp, s7
                  lui          s1, 94428
                  mulh         t5, s4, s5
                  fmsub.s      ft3, fa3, fa6, fa7, rup
                  remu         a1, s0, s8
                  slli         a3, s8, 29
                  srli         s4, a1, 15
                  feq.s        a3, fs8, ft5
                  remu         gp, s4, s6
                  addi         a4, t4, -469
                  slti         a1, s2, -1338
                  rem          s5, s10, gp
                  fmin.s       ft0, ft3, ft2
                  fmv.x.w      a4, ft0
                  fsgnjx.s     fs5, fa7, fa4
                  rem          ra, t6, s4
                  slti         a5, zero, -351
                  fadd.s       ft5, fa3, ft7, rtz
                  sub          t1, tp, a6
                  fcvt.w.s     t1, ft4, rne
                  fmax.s       fs1, fa5, fa6
                  xor          a0, a7, s7
                  srl          sp, t6, t3
                  fclass.s     s5, fs3
                  fsub.s       fs11, fs9, ft8
                  mul          gp, a0, s3
                  fcvt.s.wu    fs1, a7
                  fmv.x.w      a0, fs4
                  divu         a2, s3, t4
                  divu         a7, t6, a7
                  fcvt.wu.s    tp, fa1, rtz
                  fsgnjn.s     fs2, fs4, fa3
                  rem          a2, t3, sp
                  sll          s4, s7, a5
                  auipc        t5, 739949
                  sra          s1, a4, t6
                  fmv.w.x      ft3, t1
                  fsqrt.s      fs6, fs5, rne
                  andi         t3, t5, -20
                  fmv.x.w      tp, fs10
                  fmax.s       fa6, fa4, ft5
                  fsgnjn.s     ft10, ft2, ft6
                  fadd.s       fa5, ft5, ft11, rup
                  fsgnjx.s     ft9, ft2, fs1
                  nop
                  addi         t6, a5, -82
                  fmv.x.w      s3, fa6
                  remu         t5, s4, ra
                  fsqrt.s      fs6, ft6, rtz
                  remu         tp, a3, a2
                  fclass.s     gp, fa7
                  fnmadd.s     fs9, ft5, ft2, fs2
                  srl          s0, zero, a3
                  andi         gp, t6, -1240
                  fsgnjx.s     ft1, fa7, fs9
                  mulhu        tp, sp, tp
                  fcvt.wu.s    a5, ft3, rdn
                  fadd.s       fs9, ft6, fs10, rmm
                  sltiu        s3, t2, 1062
                  div          s8, s1, s5
                  mulh         t4, s9, t3
                  mulhu        s9, t5, t4
                  srai         tp, s6, 5
                  fsgnjx.s     ft4, ft3, fa2
                  and          t6, t6, s9
                  fcvt.wu.s    s9, ft8, rmm
                  fadd.s       fa1, fs9, ft1
                  sltu         t0, a2, a5
                  flt.s        tp, fs5, ft4
                  andi         t1, a6, 804
                  rem          a5, t2, t3
                  ori          a1, a5, 271
                  sll          t4, s2, t5
                  fmul.s       ft10, fs7, ft6, rtz
                  fnmadd.s     fa7, fa2, fs9, fs10, rdn
                  fnmsub.s     ft7, ft1, ft4, ft10
                  fmul.s       fs3, fs5, ft11, rtz
                  srl          s2, a2, t3
                  remu         sp, s2, s4
                  divu         tp, a7, s7
                  or           ra, t3, gp
                  mulhu        s3, gp, a0
                  sll          s3, t6, t3
                  fsgnjn.s     fa6, fs0, fs0
                  fdiv.s       ft8, fa0, fs7, rup
                  div          s0, s10, s9
                  xor          t0, s7, s10
                  nop
                  remu         s4, s10, a2
                  fsgnjn.s     fs7, fs11, ft7
                  fcvt.s.wu    fa1, a6, rdn
                  and          s10, s5, gp
                  mulhu        a0, s5, t4
                  sra          a5, ra, s5
                  fle.s        t0, fa0, ft10
                  fsgnjx.s     fa2, fs3, ft8
                  xor          a2, sp, s5
                  fsgnjn.s     ft5, ft3, fs2
                  fnmsub.s     ft11, fs9, fs6, ft8
                  add          a7, t3, t3
                  slt          s1, zero, t5
                  feq.s        a1, fa5, ft10
                  fsub.s       fs0, fs2, fs11, rdn
                  mulhsu       t5, t3, s1
                  fle.s        a3, fs7, fa2
                  srai         s10, a4, 20
                  fsgnjn.s     fs7, fs0, fs3
                  fle.s        a2, fs7, fa3
                  ori          a3, t1, 191
                  fcvt.wu.s    zero, fs3, rdn
                  fcvt.w.s     s2, fs4
                  mulh         s0, s6, a2
                  auipc        s2, 1032873
                  fmul.s       ft6, fs9, fs8, rne
                  sltu         s4, s2, gp
                  flt.s        s8, fs10, fa1
                  mul          s6, s2, s6
                  feq.s        s6, fs0, fs9
                  slt          gp, s0, t0
                  fsqrt.s      ft4, fs0
                  fclass.s     s3, fa5
                  addi         t4, a4, 708
                  srl          s2, a2, t1
                  xori         gp, a6, -2012
                  sltiu        tp, a2, -847
                  fnmadd.s     fs10, ft1, fs0, fs11, rup
                  fcvt.wu.s    a4, fs9, rdn
                  fadd.s       fs0, fa6, ft1, rup
                  mulh         a2, zero, s6
                  slti         sp, a2, 1121
                  slti         t3, t4, 1246
                  mulhu        s2, s4, a5
                  mul          tp, a5, t4
                  sltiu        s1, s2, 432
                  fcvt.w.s     s6, ft5
                  lui          s9, 853447
                  fsub.s       fa5, ft8, fs0
                  andi         s5, t3, 1547
                  sltu         t5, t3, a1
                  sltu         gp, tp, gp
                  slli         s10, a5, 28
                  xori         t1, s11, -1039
                  fmv.w.x      fa3, sp
                  xor          s9, s1, s3
                  and          a2, t2, a0
                  fsgnjn.s     fa2, fa3, ft1
                  or           t5, t0, s11
                  rem          zero, a7, t1
                  auipc        a2, 453225
                  fmadd.s      fa1, fa2, fa3, ft7, rmm
                  fsub.s       ft3, fs8, ft10
                  ori          s2, ra, -57
                  fsgnjx.s     ft7, fa1, fs1
                  fclass.s     t4, fs6
                  fcvt.wu.s    sp, fa3
                  or           t5, s0, a2
                  feq.s        s8, fa1, fs5
                  or           a5, s9, a6
                  fnmadd.s     fs0, fa6, ft9, fa2
                  srl          t5, a5, s10
                  fmax.s       fa6, ft11, ft6
                  fcvt.wu.s    t0, fs9
                  xori         s8, t1, -1423
                  sub          a3, s6, t1
                  div          ra, t4, gp
                  mulh         s8, s11, t3
                  nop
                  add          s3, t3, s1
                  flt.s        a6, ft3, fa5
                  fle.s        a7, fs3, ft7
                  divu         a4, t5, t0
                  addi         t5, zero, 1832
                  remu         t4, s2, a4
                  fadd.s       fa0, fa3, fs1
                  fmv.w.x      fa2, t4
                  fsgnjn.s     ft7, fs8, fs10
                  slli         t4, s3, 16
                  slt          s2, gp, zero
                  fsgnjx.s     fa6, fs5, fs9
                  andi         s10, a4, -757
                  sltu         s8, a3, a7
                  fclass.s     s9, ft9
                  or           s5, a7, sp
                  fmsub.s      ft8, fs2, fs0, fs9, rdn
                  lui          tp, 145331
                  mul          s8, t3, s11
                  sltu         s6, s4, zero
                  fnmsub.s     fa5, ft7, ft5, ft7, rtz
                  fcvt.s.wu    ft11, sp
                  sll          a3, s9, s2
                  fdiv.s       fa7, fa2, ft5, rne
                  srl          tp, t2, sp
                  fnmadd.s     fs0, ft0, ft3, ft2
                  fnmadd.s     ft5, ft9, fa6, fs10
                  div          a6, s2, a0
                  fle.s        zero, fs0, ft11
                  fnmsub.s     fa5, ft9, fs8, fa3
                  xor          s8, a3, a7
                  add          t1, tp, t3
                  sltiu        t5, s3, 1330
                  fmin.s       ft5, fs4, fs5
                  sub          s0, s8, s8
                  fmin.s       ft2, fs5, fa6
                  fmax.s       ft6, fs1, fs5
                  and          sp, a1, zero
                  andi         a7, s9, -1791
                  addi         t1, ra, 443
                  fcvt.s.w     fa4, t2, rup
                  fmv.w.x      fa6, s2
                  ori          t0, gp, 2010
                  srai         t3, t3, 4
                  fnmadd.s     fa0, fs7, fa6, fa0
                  and          a4, ra, s9
                  srai         a3, t1, 12
                  fsgnjn.s     fs8, ft3, fs9
                  slti         s8, t6, -394
                  addi         gp, a3, 173
                  fmsub.s      fs6, fa7, ft0, ft11
                  fsgnj.s      ft9, fs7, fs6
                  srai         a0, t1, 28
                  xori         s8, s11, 165
                  srli         t5, a6, 5
                  slt          a3, a7, s3
                  fsub.s       fs9, ft8, fs11
                  fdiv.s       ft6, ft6, fa3
                  xori         t4, a0, 1070
                  slli         gp, sp, 19
                  mulhsu       t5, a7, tp
                  fmv.w.x      fa7, s8
                  fcvt.w.s     a1, ft10
                  fnmsub.s     ft10, fs8, fs6, fs9, rup
                  fmin.s       fs0, ft11, fa7
                  and          a7, s6, tp
                  sll          s2, a7, t4
                  slti         tp, s10, -607
                  nop
                  addi         t5, tp, -105
                  fcvt.s.wu    fs1, s0, rmm
                  slti         s3, a4, 1652
                  addi         t4, t5, -1134
                  and          s9, t5, zero
                  ori          a4, a3, -1476
                  fle.s        a0, fs4, ft9
                  sll          a1, s6, a3
                  fsgnjx.s     ft9, ft2, ft2
                  fmax.s       fa6, ft8, ft6
                  feq.s        zero, ft8, fa1
                  rem          t1, sp, s11
                  slti         t4, s3, -550
                  fsgnjn.s     ft1, fa4, ft11
                  sltu         tp, t1, s9
                  xori         s6, a0, 1982
                  ori          s6, s11, -1924
                  srai         s2, s10, 13
                  fmul.s       ft7, fa4, ft1, rmm
                  flt.s        zero, fs2, ft4
                  remu         s10, t1, s7
                  sltiu        s9, s4, 1296
                  fsub.s       ft8, ft8, fa5
                  or           a6, s7, s10
                  fadd.s       ft0, fs7, fs9
                  fclass.s     s6, fa6
                  fnmsub.s     fs10, fa4, fa6, fa2
                  fmv.x.w      t4, ft7
                  fsgnj.s      fa2, fs7, ft3
                  add          a4, t6, ra
                  divu         s4, a7, s4
                  fcvt.wu.s    s3, ft2, rdn
                  mul          a0, s1, t1
                  mulhsu       s5, tp, t6
                  fmsub.s      ft6, ft10, ft1, ft5
                  auipc        a5, 340874
                  fnmadd.s     fa5, ft9, fa0, ft0
                  nop
                  fcvt.wu.s    gp, fs11
                  mulhsu       a3, a6, a3
                  fmin.s       ft0, fa4, ft11
                  addi         s4, t5, 547
                  fsub.s       fs11, fa5, fs1
                  fnmsub.s     ft8, fs8, ft2, fs3
                  slli         t0, gp, 31
                  fmul.s       fs4, ft10, fs2, rtz
                  sub          a6, zero, gp
                  fcvt.w.s     s3, fs1, rup
                  fadd.s       ft4, fs1, ft2, rdn
                  fmadd.s      fa5, ft2, fa0, fs5
                  nop
                  div          gp, gp, s6
                  sltiu        s9, tp, 1965
                  ori          a1, a7, 1737
                  fdiv.s       ft5, ft6, ft10, rup
                  fcvt.wu.s    s2, fa2, rup
                  addi         s3, tp, 344
                  srli         gp, s0, 25
                  mulh         s9, t6, t5
                  mul          a2, s8, s9
                  slti         a2, s2, 1716
                  flt.s        a3, fs5, fs9
                  add          sp, s1, a4
                  slt          s2, a1, a7
                  add          t5, t1, s11
                  slli         s1, t3, 24
                  fnmsub.s     fs0, ft4, fs0, fa1
                  andi         a4, s9, 199
                  sltu         a6, s3, a0
                  srli         gp, t1, 26
                  xor          ra, t2, s10
                  or           t0, ra, gp
                  remu         s10, s4, s0
                  fmul.s       fs0, ft8, ft4
                  fmsub.s      fa6, fa7, ft4, ft5, rne
                  sltu         s4, s8, ra
                  fsgnjx.s     fa2, ft1, fs7
                  mul          a0, a3, s4
                  fmax.s       fs5, ft9, fs4
                  fsgnjn.s     fs4, fs11, ft2
                  fcvt.wu.s    s3, ft2
                  lui          t6, 918397
                  mulhsu       s4, ra, a5
                  mulhsu       s2, s10, a5
                  and          a2, s10, t2
                  xori         s10, s5, -1672
                  remu         s6, s9, t0
                  fsgnjx.s     ft1, fs6, fs11
                  fsgnj.s      fs8, ft10, fa5
                  addi         s6, t5, -1490
                  div          tp, s4, t5
                  fmadd.s      fs4, ft5, fs9, ft6
                  nop
                  fcvt.w.s     gp, ft1
                  divu         s10, s5, t2
                  rem          a2, t0, t1
                  slt          s4, s0, s10
                  fdiv.s       ft0, fs8, fs9, rup
                  fcvt.s.wu    ft4, a1, rup
                  fmul.s       fs1, ft4, fs8, rtz
                  mul          t4, a5, t6
                  fcvt.s.wu    ft9, t3
                  or           sp, t4, tp
                  mulh         gp, a1, s2
                  remu         s0, s8, t5
                  sll          t5, s1, s5
                  flt.s        gp, fa4, ft2
                  fdiv.s       fa1, ft6, fs4
                  xor          s0, a5, s11
                  or           a4, s9, s3
                  fcvt.wu.s    s3, ft8, rmm
                  andi         s1, t6, 1350
                  xor          s3, a2, tp
                  fadd.s       fs10, fa4, fs9, rup
                  fmv.x.w      s3, fa3
                  slti         t1, a0, -1273
                  mulhsu       a5, s7, t2
                  fmv.x.w      s3, ft6
                  lui          a4, 622843
                  flt.s        s5, fa3, fs2
                  fmsub.s      ft6, fs7, ft6, ft0
                  fmv.x.w      s6, ft5
                  fsqrt.s      fa5, ft0, rmm
                  ori          s4, s8, -1341
                  srli         a3, s1, 1
                  fcvt.s.wu    fa2, ra, rmm
                  rem          s1, s11, a6
                  slli         a2, s1, 31
                  mulhu        s6, t3, t3
                  fmv.w.x      fs4, a4
                  fdiv.s       fs7, ft0, fs9, rmm
                  fcvt.wu.s    a3, ft10, rtz
                  xor          s2, s0, a5
                  fsgnj.s      fa2, fs10, fa6
                  addi         a2, sp, -132
                  fsqrt.s      fa0, fa0
                  nop
                  fsqrt.s      fs1, fa5, rdn
                  srli         s10, s1, 1
                  fcvt.s.wu    ft7, s6
                  xor          s9, sp, tp
                  fmv.x.w      s8, fa0
                  fsub.s       fs2, fs10, ft4, rmm
                  auipc        a4, 1048115
                  fmadd.s      fs3, fs3, fs10, ft3
                  fmv.w.x      fa3, s4
                  srli         s9, sp, 3
                  fcvt.wu.s    a5, fs6
                  mulhsu       s2, gp, s1
                  addi         s8, s9, -2009
                  slti         t1, s10, 852
                  addi         s4, t3, -1716
                  nop
                  fdiv.s       ft3, fa3, ft5, rtz
                  fdiv.s       ft10, fs10, ft9
                  fcvt.wu.s    zero, fa3, rtz
                  andi         gp, t0, -1052
                  fmadd.s      fa5, ft1, fa0, fs9, rdn
                  fsgnjn.s     fs0, fs2, fa3
                  sra          s0, t2, s10
                  and          s5, s6, s1
                  fmax.s       ft3, fs10, fa1
                  divu         t0, t5, s9
                  fmax.s       fs1, fs8, ft7
                  feq.s        s4, ft1, ft6
                  slt          s2, a1, a1
                  fcvt.w.s     a2, fa2
                  or           ra, tp, a7
                  fsgnj.s      fs1, fa6, fs2
                  fsgnjn.s     ft7, fs0, fs10
                  fmin.s       ft8, fs9, fa4
                  or           a6, s6, a6
                  slt          t4, sp, t6
                  fmax.s       fs9, fs10, fa4
                  fadd.s       fa5, ft10, ft7
                  mulhu        a3, a6, tp
                  add          a1, a1, t3
                  add          s2, sp, a1
                  fsqrt.s      fs2, fs3
                  fmsub.s      fs0, ft6, ft6, fa7, rup
                  andi         t3, a0, -1864
                  fmadd.s      ft7, fs8, fs4, ft2
                  slti         t4, t6, -940
                  slli         t0, s0, 30
                  mulhu        s0, t3, s6
                  fsqrt.s      ft8, fs6, rdn
                  rem          s4, t3, t2
                  slti         s10, zero, -1861
                  srl          ra, s5, a2
                  or           s10, s8, s8
                  mulhsu       s8, sp, s11
                  fmadd.s      fs1, fa1, fs3, ft11, rtz
                  remu         a2, ra, a3
                  addi         a3, t0, -1929
                  or           a2, s0, t4
                  or           t1, ra, a7
                  fmv.w.x      ft2, a4
                  fmsub.s      ft4, ft10, ft6, fa2, rne
                  auipc        a1, 294061
                  fmsub.s      fs6, ft9, fs5, fa1
                  lui          a1, 473186
                  fmax.s       fs6, fa2, fs6
                  xori         s1, sp, 817
                  andi         s8, a0, 802
                  xori         ra, t3, -1316
                  rem          s2, s6, a4
                  fmax.s       fs2, fs1, ft9
                  sub          s0, tp, t2
                  and          ra, tp, s2
                  mulhsu       a4, s5, t3
                  srl          a7, a1, a1
                  feq.s        t1, fa1, fs3
                  div          s9, gp, zero
                  fcvt.s.wu    fa0, t6
                  fnmadd.s     fa4, ft9, ft4, ft8, rdn
                  fnmsub.s     fs2, fa7, fa6, ft6
                  fcvt.w.s     a6, ft10, rne
                  fcvt.wu.s    tp, fs9, rne
                  fcvt.s.wu    fs4, zero, rdn
                  slli         t1, s1, 20
                  sra          a5, s3, a7
                  srl          s10, gp, ra
                  lui          a4, 837766
                  fmv.w.x      fs8, t0
                  auipc        s9, 405807
                  srli         gp, s7, 4
                  fsqrt.s      fs5, ft6, rup
                  lui          t3, 158460
                  lui          s0, 277214
                  fcvt.s.w     fa7, t4, rup
                  slti         s3, a5, 1019
                  nop
                  srli         a3, a2, 3
                  sll          a2, tp, s1
                  fmv.x.w      a3, fa2
                  fmv.w.x      fa7, zero
                  fsgnjx.s     ft3, fs9, fa2
                  fnmsub.s     fa6, fs8, fs1, fs6, rmm
                  fmin.s       fs5, fs0, ft6
                  addi         sp, a2, 1130
                  fadd.s       fa2, fa3, ft6, rdn
                  remu         t5, a3, s5
                  or           a7, s10, s2
                  or           sp, t1, a6
                  sltiu        sp, t1, 332
                  or           a2, s2, t4
                  mulh         t6, zero, s7
                  nop
                  xor          a0, s11, a1
                  fmul.s       fs4, ft9, ft2
                  sub          tp, a1, a7
                  srl          t0, zero, s1
                  fnmsub.s     fa2, fs6, fs7, fs0
                  srl          s6, t5, a5
                  slt          s5, s11, s11
                  fmul.s       fa4, ft8, fs2
                  feq.s        s4, fs3, ft7
                  srai         gp, t3, 0
                  fcvt.s.wu    ft4, a3
                  fmv.w.x      fa6, zero
                  fsgnjx.s     ft6, ft11, fs0
                  fmul.s       fa1, ft10, ft2
                  fsgnjn.s     ft0, ft3, ft0
                  feq.s        a2, ft10, fa0
                  fle.s        zero, fa6, ft11
                  addi         gp, t0, -1827
                  mul          t5, t3, a0
                  and          zero, s0, a1
                  sltu         s2, t2, s9
                  fclass.s     a5, fa5
                  nop
                  xor          sp, a4, t2
                  fmul.s       ft4, ft0, fs8, rtz
                  slli         a2, s3, 6
                  fnmsub.s     ft7, ft9, fa0, fa6
                  fmv.w.x      fs3, s10
                  mulhsu       s1, a2, ra
                  addi         ra, a6, 991
                  fcvt.s.w     fs9, t5
                  srl          s2, s9, s1
                  fle.s        t6, ft11, ft2
                  fadd.s       ft0, fs2, fs5, rne
                  mul          t6, a7, t1
                  addi         s3, s0, -804
                  div          s8, a5, t6
                  slt          t3, s7, t1
                  lui          t4, 798490
                  mulhsu       ra, t0, s5
                  slt          s8, s3, a3
                  fmsub.s      fa3, fs4, fa4, fa3, rup
                  fmax.s       fa1, fs6, fs10
                  fadd.s       ft9, ft10, fa7, rup
                  fmv.w.x      fs10, t3
                  fcvt.s.w     ft6, s5, rmm
                  nop
                  remu         a4, t6, a7
                  fmadd.s      fs11, fs11, fs1, fs8
                  div          s3, a5, t1
                  fcvt.w.s     s6, ft11
                  fcvt.w.s     s6, ft2, rmm
                  fcvt.s.wu    fa1, t5, rne
                  mulhsu       s1, s8, a3
                  fmul.s       fs5, ft9, fs11, rdn
                  slli         t3, a0, 4
                  mul          a6, t1, s6
                  lui          s2, 824539
                  srai         ra, s5, 25
                  fsgnjn.s     ft8, fa5, fa7
                  fsgnjx.s     ft10, fs11, ft1
                  and          tp, sp, t0
                  slti         a7, t1, -289
                  fle.s        a0, ft0, fs1
                  fcvt.s.w     ft3, s0, rmm
                  sll          s0, s0, tp
                  div          tp, t1, t4
                  add          a4, t5, a2
                  rem          a3, a1, ra
                  xori         s9, a4, 724
                  fsub.s       fs6, fs9, fs10, rup
                  andi         t5, t6, -1330
                  fnmadd.s     fs2, ft1, fa0, fs7, rdn
                  srai         t5, a7, 26
                  fcvt.w.s     s8, fs7, rtz
                  fcvt.w.s     t4, ft0, rmm
                  srli         sp, a0, 6
                  mulhsu       s9, zero, s5
                  slti         a2, s10, -1119
                  xor          ra, t6, t4
                  slti         t1, t5, -1723
                  mulhu        sp, zero, s8
                  mulh         a2, gp, a5
                  xor          ra, t5, a1
                  fmv.x.w      s3, fs4
                  fcvt.w.s     a0, fs1
                  feq.s        a7, ft11, ft0
                  remu         a0, tp, s1
                  srl          s3, s5, tp
                  fmin.s       fs4, fs7, fs8
                  lui          s5, 639968
                  fmin.s       fs3, fa2, fa0
                  fclass.s     s1, ft3
                  divu         zero, a4, a1
                  sll          a0, t0, s11
                  fsgnjx.s     fs11, fa4, ft10
                  sra          a4, t6, a3
                  sll          sp, zero, gp
                  remu         s5, s4, s11
                  or           t1, a4, s7
                  auipc        a7, 885507
                  fmin.s       fs10, ft11, fa2
                  fcvt.s.w     fa1, zero
                  andi         a1, a7, -452
                  auipc        tp, 282137
                  or           a6, a6, t5
                  mulhsu       a0, gp, a2
                  mul          a7, s10, t5
                  sra          s6, t0, t2
                  and          t6, a6, t2
                  feq.s        s4, fs9, fs10
                  fsub.s       ft8, fa5, fs9
                  srl          ra, s1, s3
                  fsgnjx.s     fs2, ft1, ft6
                  lui          s6, 819534
                  fcvt.s.w     fs8, s4, rmm
                  fcvt.s.wu    fs11, a5
                  srl          a7, s9, s8
                  divu         a1, s0, s2
                  sll          t1, t1, sp
                  slli         sp, t0, 4
                  fsub.s       fs1, fs5, ft1
                  slti         a6, gp, 203
                  fnmsub.s     fa2, fa4, ft3, ft6
                  sra          s6, s1, ra
                  slti         a5, s4, -1831
                  ori          s5, s0, 182
                  fcvt.wu.s    t1, fa3
                  and          s3, s7, t4
                  fadd.s       fa3, fs7, fa2
                  or           t0, t6, t0
                  fsgnjx.s     fs10, ft2, fs7
                  srl          a3, s5, tp
                  fcvt.s.wu    ft9, ra, rtz
                  fmsub.s      ft0, ft3, fs6, ft6, rdn
                  srl          t3, a2, zero
                  fmul.s       fa5, ft3, fs8, rup
                  fnmsub.s     fa7, fs6, ft1, ft3
                  fmv.x.w      s0, ft8
                  sltiu        gp, s9, 253
                  mulh         s1, t2, s10
                  fcvt.wu.s    s6, fa0
                  fmul.s       ft1, fa7, fs7, rtz
                  fmin.s       fa4, ft3, ft10
                  fmadd.s      ft2, ft4, fs10, fa6, rdn
                  nop
                  div          t6, sp, a1
                  mulhsu       t6, s5, zero
                  fclass.s     tp, fs5
                  sltiu        zero, tp, -1798
                  div          t0, s0, t1
                  div          t4, s4, s11
                  fle.s        a2, ft1, fs0
                  add          s6, s9, t1
                  addi         s2, a5, -1382
                  or           t4, s6, a1
                  fmin.s       ft7, fs5, ft9
                  sub          a4, a7, tp
                  rem          s6, a1, t0
                  xor          zero, s8, s8
                  slti         s5, t6, 1494
                  fmax.s       ft6, fs7, fs8
                  fmsub.s      fs5, fs5, fa0, ft9
                  feq.s        s8, fs2, ft2
                  mulhu        s9, s1, a0
                  fsqrt.s      fs0, ft7, rdn
                  nop
                  fmadd.s      ft11, fs5, fa0, fs0, rne
                  srli         t4, a3, 10
                  fnmsub.s     fs5, ft1, ft10, fs3
                  and          s9, t5, a2
                  fle.s        gp, fs0, ft4
                  sub          t6, s2, s9
                  fle.s        a4, ft1, fs0
                  slli         a4, t5, 30
                  flt.s        s0, fs3, fs0
                  fadd.s       fs5, fs11, ft5, rtz
                  xor          t4, s0, a1
                  slti         t0, s10, 33
                  sra          sp, a5, s5
                  mulhu        t6, a4, t3
                  fadd.s       fs7, fs7, fs0
                  rem          s6, s1, s1
                  sll          a4, a0, s2
                  fsqrt.s      ft9, fs3
                  mulhu        t6, a0, t3
                  fcvt.s.wu    fs3, t2
                  add          zero, s0, s2
                  fsgnjx.s     ft7, fs4, fa7
                  slt          s5, t4, a2
                  sub          a5, s3, t4
                  sra          t0, t6, s10
                  fmadd.s      fa6, fa0, fs9, ft9, rup
                  mulhu        s4, s5, sp
                  sll          s2, a7, t2
                  remu         s2, a7, t5
                  andi         s3, a0, -610
                  fdiv.s       fa3, fs9, ft8, rdn
                  fnmsub.s     fa0, ft0, fs1, fs9, rtz
                  add          tp, zero, t0
                  fcvt.w.s     a2, fs4, rtz
                  fmadd.s      fa3, fs10, ft6, ft11
                  nop
                  fmin.s       fs4, fs1, ft7
                  fsgnjx.s     fs11, fa7, ft8
                  sll          t3, s8, s9
                  feq.s        a0, fs11, fs7
                  fsub.s       fa4, fa5, ft11, rtz
                  sltu         s6, t1, a7
                  fclass.s     a6, fs0
                  mul          a2, zero, s1
                  addi         a6, s5, -476
                  xor          ra, a1, s3
                  fmsub.s      ft5, fs11, fs1, fs8, rup
                  or           t5, a0, s8
                  fsgnjn.s     ft2, fa5, fs10
                  sub          a5, t0, t3
                  fle.s        zero, ft6, fs5
                  fcvt.s.wu    fs1, s0
                  divu         a3, s0, t5
                  sltu         s5, t4, t5
                  fcvt.wu.s    a7, ft11, rdn
                  andi         a6, s3, 1493
                  fcvt.w.s     sp, ft6, rne
                  addi         a6, t0, 126
                  fadd.s       fa5, fs0, ft7, rne
                  flt.s        a3, fa0, fa5
                  mulh         s1, t3, tp
                  fmul.s       ft5, fs9, fs2, rne
                  remu         t5, s11, t2
                  and          t3, s1, a2
                  and          tp, a2, t3
                  mulhu        s8, a7, ra
                  fmv.w.x      ft10, s6
                  mul          s9, t1, a4
                  fmv.w.x      fs2, s10
                  lui          t4, 12818
                  add          sp, a3, t5
                  fmv.w.x      fs10, zero
                  fcvt.s.w     fa3, sp, rne
                  fmul.s       fs1, fa3, ft1
                  mulh         sp, t0, a6
                  fcvt.s.w     fs2, s0, rdn
                  rem          sp, s9, a5
                  fmsub.s      fs5, fa1, fa6, ft10
                  srli         a6, a4, 31
                  fsgnj.s      ft0, fa6, fa0
                  xor          s10, s1, tp
                  andi         zero, t5, -242
                  slti         t0, a7, -1826
                  fmadd.s      ft0, fa7, fa0, ft9
                  slti         s10, t1, 1014
                  fmin.s       fs8, ft7, ft4
                  fsgnjx.s     fa2, fs10, ft2
                  fdiv.s       fs9, ft3, fs7
                  slli         a4, gp, 19
                  fcvt.wu.s    t3, ft4, rdn
                  fcvt.s.w     ft7, t6, rtz
                  remu         s5, s10, a3
                  fmv.x.w      t0, fs4
                  slt          a3, a2, t2
                  mulhsu       s3, t2, s2
                  fnmadd.s     ft10, fs1, ft9, fs9
                  fsgnjn.s     fa1, fs2, ft7
                  fsub.s       fa4, ft10, fs7
                  srai         a2, s0, 21
                  xor          gp, t1, a6
                  fcvt.w.s     s4, fs0, rtz
                  fcvt.w.s     tp, ft7
                  xori         s0, a1, 1600
                  fle.s        s3, fa1, fs6
                  fcvt.w.s     ra, fs3
                  fsgnjn.s     fa3, fa2, ft10
                  mulh         t3, zero, t2
                  flt.s        a0, ft0, fs10
                  add          a1, t3, a5
                  fmsub.s      ft6, fs6, fs11, fa7
                  divu         t5, s8, t2
                  fsqrt.s      ft4, ft3
                  xor          s4, t5, a7
                  fmin.s       fa7, fs8, ft10
                  fmv.x.w      s5, fa6
                  srl          t4, s11, s9
                  fnmadd.s     ft11, fa6, fs1, fs0
                  fmin.s       ft4, ft11, ft7
                  fsgnjx.s     ft10, fs4, fs6
                  fmadd.s      fs1, ft9, ft10, fa5
                  fcvt.wu.s    s5, fa0, rtz
                  mulhu        a0, a5, s10
                  fcvt.s.wu    fa6, s7
                  fle.s        a0, ft0, ft2
                  auipc        s0, 379481
                  fsqrt.s      fa4, fa7, rtz
                  add          a7, s7, a7
                  flt.s        t1, fa3, fs7
                  fdiv.s       fa1, ft4, fs1
                  fcvt.s.wu    ft4, a3, rdn
                  fmsub.s      ft10, fa6, fs9, fs7
                  fsgnjn.s     ft7, ft1, fs9
                  fmadd.s      fa2, fs0, fa4, fa6
                  mulhu        s9, s5, tp
                  rem          s1, t0, s8
                  fsgnjx.s     fa3, ft6, ft7
                  sub          a7, s7, s3
                  fsub.s       fs3, fa4, ft11, rup
                  fle.s        t1, fa3, fs9
                  slti         a2, a3, -1155
                  fsgnjx.s     ft11, fs11, fa7
                  feq.s        ra, fa1, fs3
                  mulh         s3, t1, sp
                  feq.s        t1, fa0, fs2
                  or           a7, tp, s2
                  andi         a1, s11, -723
                  ori          t5, s9, -1978
                  divu         t4, t1, a2
                  mulhu        s4, s7, s2
                  or           s1, s9, t3
                  fmadd.s      fs9, ft8, fs0, fa6, rup
                  fsgnjn.s     fs7, fs8, fs2
                  addi         t5, s9, -1864
                  sll          s10, tp, a3
                  fmin.s       ft7, fs5, fs5
                  slt          t1, a2, s9
                  feq.s        tp, fs11, fs0
                  xori         gp, a5, -617
                  fmv.x.w      t1, fa0
                  fsgnjx.s     ft9, ft5, fs8
                  mulhsu       a7, s10, s11
                  fmax.s       ft7, ft4, fs7
                  fsgnjn.s     ft5, ft8, ft6
                  add          zero, s6, t4
                  sltu         a2, gp, tp
                  div          tp, s7, a5
                  sltu         s4, t1, gp
                  fsub.s       fa5, ft2, fs3
                  fcvt.w.s     tp, fa2
                  fcvt.wu.s    s1, fs5, rmm
                  srli         t5, t0, 24
                  mulhsu       t4, s1, a3
                  remu         s5, t5, t3
                  or           zero, gp, s2
                  fle.s        ra, ft8, ft10
                  fmadd.s      fs4, fs8, ft7, fs7, rdn
                  sll          s6, s0, zero
                  sltu         s0, zero, t0
                  ori          t0, a5, 355
                  nop
                  fdiv.s       ft11, fa1, fa3
                  srai         a4, s10, 0
                  sltu         s8, t1, s11
                  ori          t5, a1, -1759
                  srli         s4, t4, 23
                  div          s4, ra, s4
                  sub          a5, s6, t6
                  addi         t6, s5, 561
                  sub          t3, s10, t2
                  srai         s2, s2, 1
                  lui          tp, 662683
                  fsgnjx.s     fs10, fs4, ft3
                  fmv.w.x      fa0, s8
                  flt.s        a4, fs3, ft1
                  sltiu        a3, a3, -388
                  fmax.s       fs7, ft8, ft0
                  fsqrt.s      fs6, fs9
                  fmv.w.x      ft11, s5
                  remu         t6, s4, sp
                  fnmadd.s     fs9, fa3, ft11, fs3
                  fmsub.s      ft2, ft10, fa5, fs6
                  sltu         gp, a3, s3
                  fsub.s       ft11, fa7, ft2, rup
                  fnmsub.s     ft9, fa4, fa0, ft8
                  fmv.x.w      s9, fs8
                  fmax.s       ft1, fs9, fa7
                  fsub.s       fa1, ft6, ft11, rtz
                  fclass.s     a5, fa0
                  auipc        zero, 369039
                  fmadd.s      ft10, fa5, fs7, ft10
                  sll          a4, s4, s3
                  fsgnjn.s     fa6, ft0, fs0
                  auipc        sp, 767804
                  fcvt.s.wu    fs7, a4, rup
                  div          s8, s2, a6
                  sub          a1, ra, a7
                  slti         s3, ra, -1350
                  mul          a0, s0, a5
                  fadd.s       fs2, ft7, fa7
                  feq.s        s3, fa2, ft10
                  xori         gp, s7, -412
                  fsgnj.s      ft1, ft0, fs6
                  lui          t3, 35010
                  mul          t5, s8, t3
                  fmadd.s      fa7, ft5, fs8, fs4
                  ori          t0, t4, 335
                  mulh         zero, tp, t6
                  fsgnjx.s     ft0, fs4, fs8
                  remu         sp, a7, zero
                  fcvt.w.s     s3, ft8, rne
                  fmadd.s      ft8, ft5, fs1, fs7, rmm
                  fcvt.w.s     s9, ft6, rup
                  fsgnj.s      fa7, ft4, fs7
                  srl          a0, t4, t2
                  mulh         a4, s9, t6
                  mulhsu       s10, s3, a6
                  fmv.w.x      fa3, t3
                  feq.s        ra, fs7, fs10
                  fmin.s       fa0, fs3, ft11
                  mul          a6, s4, s6
                  srli         a3, s3, 12
                  fnmsub.s     fa3, fa3, fs11, fs2, rtz
                  fadd.s       fs8, fs3, fa0, rmm
                  fmadd.s      fa3, ft9, fs8, fs8
                  srli         a1, t5, 22
                  fsgnjx.s     fs9, fs3, ft2
                  rem          ra, s1, s1
                  addi         s0, t3, 1950
                  ori          s10, s3, -200
                  fmv.w.x      fa0, zero
                  fmin.s       fs11, fs6, ft7
                  slli         t1, tp, 13
                  mulh         s4, s11, s6
                  mulh         tp, t0, t0
                  slt          a1, s8, gp
                  mulhsu       sp, s3, a3
                  fmv.x.w      a1, ft4
                  remu         s10, a1, t2
                  fcvt.w.s     s4, ft10
                  sra          a0, s4, a2
                  fmax.s       ft9, fa0, ft1
                  fmax.s       ft5, fs7, fa2
                  fsub.s       fa1, fs8, fa6, rmm
                  fmin.s       fa7, fs6, fs4
                  sltiu        a6, s3, -968
                  lui          zero, 954667
                  or           a3, s7, t3
                  divu         a1, t3, t3
                  slt          a5, s6, s5
                  fsub.s       fs3, fs9, fs5, rtz
                  and          s4, s8, gp
                  fcvt.s.w     fs9, s3, rup
                  mulhsu       t3, t3, a5
                  sltu         s5, t1, a6
                  sltiu        t5, a7, 1255
                  sub          ra, a3, tp
                  ori          s8, a6, 601
                  fcvt.w.s     a7, fs7, rne
                  fsub.s       ft11, ft10, ft4
                  fnmsub.s     ft11, fa0, ft2, ft9, rup
                  lui          s2, 683258
                  addi         s10, ra, -838
                  fclass.s     ra, fa5
                  fsgnj.s      fs4, fa1, fs9
                  sub          t1, gp, a5
                  fcvt.s.wu    fa3, ra
                  slti         t4, ra, 939
                  fmax.s       ft5, fa3, fa3
                  lui          t0, 164098
                  remu         tp, a7, s10
                  fsqrt.s      fa6, fa0, rne
                  nop
                  flt.s        s10, fs7, fs3
                  mulhsu       t0, t6, a0
                  fcvt.w.s     s2, fa0, rtz
                  fclass.s     tp, ft11
                  fcvt.s.w     ft7, tp
                  fnmsub.s     ft1, fa5, ft1, fa3
                  slti         a2, s11, 1990
                  xori         t0, tp, 68
                  srli         s8, a3, 19
                  fmax.s       fs5, ft11, fs1
                  fle.s        a1, ft2, ft4
                  fcvt.s.w     ft7, a7, rup
                  fadd.s       fs4, ft8, fa0, rup
                  fnmsub.s     fs6, ft9, fa1, fs11
                  addi         s10, t3, -1289
                  rem          gp, s8, t2
                  add          sp, a5, s11
                  addi         s4, a3, -1078
                  fcvt.w.s     s10, ft5, rmm
                  fmin.s       ft0, fs0, ft6
                  mulhu        ra, s11, s4
                  slti         s5, s10, -974
                  slti         s4, s2, 1330
                  fcvt.w.s     sp, ft4
                  fclass.s     a4, ft9
                  fsgnj.s      fs1, ft7, ft4
                  mul          a2, s11, tp
                  fcvt.wu.s    a2, ft0
                  lui          s6, 307514
                  fclass.s     t5, fa1
                  div          a4, s5, a6
                  fnmsub.s     ft6, fs10, ft3, ft7, rmm
                  auipc        s9, 191445
                  srai         t4, t3, 6
                  fsgnj.s      ft7, fs4, ft6
                  fsqrt.s      fa1, fs11
                  or           s4, t2, t3
                  fclass.s     tp, ft7
                  andi         a4, a5, -856
                  fsub.s       ft11, ft11, fs8, rdn
                  fmv.w.x      ft11, s5
                  fle.s        gp, ft0, fa4
                  fmv.x.w      s9, fa1
                  fclass.s     s10, fs0
                  sub          zero, gp, s0
                  fmul.s       ft3, fa6, fs11
                  sltu         a0, t2, t5
                  fcvt.wu.s    s1, fa3
                  ori          t5, t1, 1521
                  srai         s8, t4, 30
                  fsgnjn.s     fa2, ft4, ft9
                  fmv.w.x      fs1, s8
                  divu         a3, s7, s10
                  fmax.s       fs3, ft8, ft3
                  and          t1, zero, a5
                  andi         t1, a7, -1877
                  fcvt.s.wu    ft5, tp, rtz
                  add          a4, t3, a5
                  mulh         s0, t6, a7
                  slt          s6, ra, a1
                  srl          t1, s5, t1
                  auipc        s3, 81001
                  sll          s6, s1, s0
                  fmul.s       ft2, fs9, fs1
                  mulh         a7, tp, t6
                  fcvt.s.w     ft1, a0, rdn
                  fcvt.w.s     s6, ft5
                  div          s5, a3, tp
                  auipc        s0, 491617
                  fmv.x.w      a0, ft0
                  srl          t6, t5, t6
                  fdiv.s       ft2, ft1, ft3
                  fmul.s       ft4, fs5, ft8, rtz
                  fclass.s     s5, ft11
                  div          s4, s7, t5
                  xori         s1, tp, -1894
                  fcvt.s.wu    ft6, s4, rtz
                  fadd.s       ft1, ft2, ft0
                  fdiv.s       fs2, ft6, ft7, rtz
                  mul          t5, ra, tp
                  fmin.s       ft11, fa5, ft10
                  mul          s9, t2, s2
                  slti         t4, zero, -1702
                  fcvt.s.wu    ft11, a6
                  slt          a5, t6, a4
                  ori          ra, a3, 1182
                  xori         s5, t4, 257
                  addi         s0, a6, 1914
                  div          s2, t3, s10
                  xor          a7, s3, t3
                  xor          s1, a1, zero
                  remu         t6, a0, zero
                  fcvt.wu.s    a7, fa7, rdn
                  srli         a0, a1, 24
                  fadd.s       fs7, fa6, fa5, rtz
                  auipc        s5, 869532
                  fmsub.s      ft9, fs1, fs6, ft6
                  ori          s5, s10, 505
                  or           s3, sp, a0
                  sra          sp, sp, t2
                  fsub.s       fs10, fs3, ft7, rne
                  add          s1, s2, gp
                  fnmsub.s     fa7, ft3, fa2, fa4
                  fdiv.s       fs5, fa7, ft7
                  srai         t0, gp, 1
                  mul          gp, sp, s2
                  div          s10, a1, gp
                  addi         s5, t5, 906
                  fle.s        s1, fa2, fa5
                  rem          a7, a1, s7
                  fcvt.s.wu    ft2, s1, rdn
                  fsub.s       fs5, fa2, fs6, rtz
                  fcvt.s.wu    ft8, t1
                  sltiu        sp, ra, 1670
                  fnmsub.s     fs7, ft0, ft0, fs0
                  mulh         s1, a3, s8
                  fcvt.s.w     fa7, t6, rtz
                  fsgnj.s      ft8, fs5, fs0
                  and          s6, t2, s9
                  xor          s6, s5, s6
                  or           s8, s10, tp
                  divu         s10, t1, zero
                  rem          t6, s0, a3
                  srai         tp, tp, 1
                  add          t6, t0, t6
                  fnmsub.s     fa0, ft11, ft2, fa2
                  fcvt.s.w     ft6, t4, rdn
                  mulhu        ra, t0, a6
                  sll          t6, a1, t2
                  and          s4, s3, a1
                  fmsub.s      ft4, ft4, fs1, fa3
                  nop
                  fcvt.wu.s    s3, fa4, rtz
                  flt.s        s8, ft9, ft11
                  andi         s4, a7, 1919
                  fsqrt.s      fa4, fs9, rtz
                  fcvt.wu.s    s2, fa5
                  fsgnjx.s     fa6, fs4, ft9
                  auipc        t0, 361524
                  fmadd.s      fs4, ft4, ft7, fa3
                  xor          a7, s0, tp
                  fmin.s       ft3, fs6, ft8
                  fcvt.s.wu    fs3, s8, rtz
                  fmadd.s      fs3, ft7, fs8, fa0
                  fadd.s       fs8, ft11, ft8
                  xor          t0, t2, a6
                  mulhsu       s8, a7, s1
                  sra          t5, t5, t2
                  fsgnjx.s     ft0, fs0, ft1
                  mulhu        t3, a4, s1
                  fmsub.s      fa0, ft0, fs6, ft7
                  lui          a1, 260524
                  fsgnj.s      fs9, fs11, ft5
                  addi         s1, s9, 1232
                  fnmadd.s     fs7, fs0, fa2, ft8
                  flt.s        sp, fs5, fs0
                  div          ra, sp, s3
                  fclass.s     s0, ft7
                  ori          s1, t4, 1440
                  flt.s        s4, fs9, fa6
                  fsgnjn.s     ft4, fs4, fa1
                  fsgnjx.s     ft5, fa1, ft11
                  fle.s        a4, ft2, fa2
                  fclass.s     s8, ft5
                  flt.s        zero, ft3, ft11
                  fsgnj.s      ft2, ft7, ft2
                  ori          zero, a5, -1908
                  auipc        sp, 381397
                  remu         t6, t2, ra
                  lui          s1, 507962
                  fsqrt.s      fs2, ft3, rup
                  add          t3, s3, t6
                  auipc        s3, 348788
                  srai         a1, a6, 7
                  fmul.s       fs9, fa4, ft6
                  fmsub.s      fs4, ft11, ft1, fs2
                  flt.s        t1, fs11, fs11
                  fcvt.wu.s    a5, ft0, rne
                  andi         t5, t6, -1371
                  sub          t5, s0, a5
                  fmsub.s      fs3, fs4, fs8, ft6, rdn
                  xori         s5, a3, 351
                  auipc        a1, 415114
                  feq.s        a2, ft6, ft10
                  fdiv.s       fs8, fs10, fa7
                  srl          s8, s3, s10
                  mulh         a5, t4, a6
                  xor          s2, s10, t2
                  div          s4, s4, s1
                  fsgnjn.s     fs9, fs11, fa4
                  fcvt.w.s     s6, ft4, rne
                  or           a0, s1, s2
                  fle.s        t1, fs3, ft10
                  div          s2, s7, a5
                  mulhsu       s5, s1, s2
                  andi         a0, a2, 509
                  add          s2, sp, a4
                  mulh         t4, a5, s9
                  srl          t5, s10, s1
                  fmv.x.w      t3, fs0
                  addi         t0, s1, -2029
                  slti         s10, ra, -302
                  sra          gp, t6, t1
                  divu         sp, a5, tp
                  mulhu        s1, s9, a1
                  or           a3, t6, zero
                  fmax.s       fa5, ft5, fs7
                  fmin.s       fs5, fa7, ft11
                  fnmsub.s     ft10, fs4, fs2, fs11
                  slli         ra, s7, 5
                  mulh         t0, s5, s9
                  andi         s3, sp, 1816
                  fclass.s     t6, fa0
                  div          s6, s8, tp
                  remu         s3, s4, t0
                  fsgnjx.s     fs5, ft7, fs11
                  fsgnjx.s     fa6, fs5, ft0
                  slt          sp, s2, a3
                  mulhsu       s9, s11, s8
                  flt.s        a7, fs8, fa3
                  lui          t4, 993919
                  mulhu        t5, a7, a6
                  mulh         s5, t4, gp
                  flt.s        s1, ft0, ft3
                  fmax.s       fs6, ft2, fs3
                  nop
                  mulhsu       s8, t3, t1
                  nop
                  nop
                  mulhu        t3, tp, t5
                  flt.s        a3, fa0, fa6
                  feq.s        t3, fa0, fa7
                  lui          gp, 536466
                  fnmadd.s     fs10, fs10, ft9, ft6, rdn
                  srl          s8, ra, a5
                  xori         sp, a5, 547
                  sra          zero, s8, s3
                  mul          s0, s1, s1
                  lui          gp, 642838
                  fmv.x.w      s0, fs10
                  and          a4, s7, s10
                  xor          a0, s11, a7
                  fmv.w.x      fa6, tp
                  fcvt.s.wu    fa6, s9
                  fdiv.s       ft1, fa6, fs9
                  slt          s2, zero, s11
                  sltiu        tp, t4, -1527
                  feq.s        a3, ft11, ft5
                  add          a5, a6, s11
                  fmv.x.w      s10, ft3
                  fsgnjx.s     fs1, ft11, ft3
                  fadd.s       ft10, fa5, ft8, rmm
                  sra          s4, zero, s3
                  slt          a1, a6, sp
                  slti         a7, s11, 1059
                  fadd.s       fs10, ft3, fs0, rtz
                  fsgnjn.s     fs5, fs2, fs8
                  fmax.s       ft1, ft6, ft7
                  fsgnjn.s     fs7, fa2, fs11
                  slt          s3, gp, s8
                  fdiv.s       ft7, ft9, fs7, rdn
                  fcvt.w.s     t3, fa0
                  rem          t4, s3, s11
                  slti         s4, t6, -979
                  fcvt.s.wu    ft1, s11, rmm
                  xor          s2, a0, t2
                  slli         a2, s6, 10
                  fcvt.s.wu    ft11, a1, rup
                  rem          s1, a4, a2
                  or           t1, s9, t2
                  mulh         a2, s0, a7
                  fmax.s       fs0, ft9, fs3
                  xor          a7, t6, a5
                  fsgnjn.s     fs9, fs11, ft4
                  mulhsu       s8, s0, a2
                  xori         zero, t5, -255
                  and          t6, s1, s2
                  mulh         ra, gp, a6
                  mul          s8, s9, a3
                  srl          a7, sp, s1
                  sltu         zero, t0, s10
                  addi         t5, gp, 1870
                  fcvt.wu.s    s2, fs2
                  div          s5, sp, s1
                  fle.s        s5, ft6, ft2
                  andi         a1, a2, 1043
                  fmv.x.w      t4, ft1
                  sra          t6, sp, a2
                  remu         a3, a0, t4
                  fmin.s       fs8, fs8, fs4
                  srai         zero, ra, 13
                  fsgnjx.s     ft11, fa2, fs8
                  nop
                  fmv.x.w      s9, fa4
                  fadd.s       ft8, fa3, fa1, rtz
                  fmv.w.x      fs0, sp
                  fsgnjx.s     fs1, fs1, ft2
                  fadd.s       fa1, fs6, ft0
                  nop
                  fadd.s       fs3, fa7, ft1
                  fmin.s       ft6, ft9, fa2
                  and          t3, t5, s3
                  flt.s        a4, fa4, ft10
                  fcvt.s.w     fa3, s8, rtz
                  fmax.s       fs1, fa1, fa4
                  fadd.s       fs6, fa2, fs9
                  fmsub.s      fa2, ft4, fs2, fs0, rmm
                  fdiv.s       fs4, ft4, fa5
                  or           s5, s6, s2
                  sra          zero, s5, a1
                  fmax.s       ft3, fs4, ft9
                  fsub.s       fs4, ft3, fs10, rtz
                  fcvt.w.s     t1, fs7, rmm
                  fsgnj.s      fa7, fs1, ft2
                  ori          a5, s11, -1955
                  fsgnj.s      fa6, ft0, ft4
                  feq.s        s9, ft11, fs4
                  fcvt.s.wu    ft7, t6, rup
                  fcvt.wu.s    t5, ft6, rne
                  fsqrt.s      fs11, ft1
                  fadd.s       fs11, fs8, fs7
                  mul          s2, a4, a5
                  xori         a4, zero, 937
                  rem          a0, a5, t5
                  fsub.s       fa6, ft11, ft7
                  fnmsub.s     fs4, fa7, fa4, ft1
                  fmadd.s      fs4, ft8, fs3, fa2
                  mulh         a5, gp, s2
                  fcvt.wu.s    t5, fs0, rmm
                  fcvt.wu.s    gp, fa6, rmm
                  or           s9, a6, t4
                  addi         zero, s7, 57
                  div          a0, s0, zero
                  srli         s6, t1, 12
                  andi         s8, t6, -1969
                  slt          s9, a2, zero
                  srli         t5, s9, 28
                  sltiu        s2, s8, -2040
                  fmul.s       fa5, fs8, ft4
                  srli         s6, a3, 6
                  fcvt.w.s     a7, fs1, rne
                  or           s1, t0, zero
                  sll          s0, s3, a1
                  sltiu        t1, t5, -1080
                  fsub.s       ft0, fa1, fs6
                  mulhu        t3, s9, a4
                  fmv.x.w      a0, fs4
                  add          s0, sp, t4
                  sll          s6, a7, s1
                  srai         a7, t1, 5
                  and          a1, s10, s8
                  ori          s10, a1, 175
                  sltu         a1, t2, s1
                  srai         a0, s11, 18
                  andi         s4, a1, 483
                  fdiv.s       ft6, ft1, fs3, rtz
                  fmv.w.x      fs2, t0
                  fclass.s     s0, ft8
                  fsgnjx.s     ft11, fs6, fs10
                  fcvt.wu.s    t0, ft7, rtz
                  fmsub.s      fa0, ft2, fs11, fa5
                  fmv.w.x      ft9, a6
                  and          a2, a4, a5
                  xori         s2, a2, 95
                  fmv.w.x      fa0, a1
                  slli         ra, a4, 14
                  srai         s9, t5, 17
                  fnmadd.s     fs1, fs11, ft2, fs11, rmm
                  flt.s        s9, ft1, fa2
                  slt          s1, a0, sp
                  fnmadd.s     fs7, fs5, fs9, fs11, rne
                  srai         t5, zero, 18
                  nop
                  fcvt.s.wu    ft3, a5
                  fsqrt.s      fs8, fa2, rtz
                  ori          a5, s0, 1072
                  xor          a5, t6, s11
                  andi         a0, s8, 91
                  fsgnjx.s     ft2, fa2, fa6
                  fsgnjn.s     fs9, ft6, ft10
                  or           t0, s4, a3
                  lui          s5, 446493
                  divu         a2, s4, a4
                  lui          s1, 425240
                  fsqrt.s      fa3, fa1, rne
                  or           gp, s3, sp
                  slt          s8, s8, tp
                  fmax.s       fa6, fs1, fa1
                  fmv.x.w      a2, fs3
                  add          s5, tp, t3
                  fmax.s       fa7, fs4, fa5
                  feq.s        s5, fs1, fs3
                  fcvt.s.w     fa4, a1
                  sltu         tp, a0, t5
                  mul          t6, s3, s3
                  fsgnjx.s     fa0, fs4, ft4
                  xor          tp, s0, t4
                  fcvt.s.w     fs8, s10, rtz
                  divu         t3, t3, a6
                  fcvt.s.wu    fa2, a1, rdn
                  fsub.s       fs7, ft0, ft7
                  sltiu        a0, a0, 208
                  remu         a2, s0, t5
                  fsub.s       ft5, fa4, ft2, rdn
                  fmv.x.w      a5, fs9
                  or           s6, t3, a2
                  addi         s6, t5, -183
                  fmax.s       fs11, ft11, fs6
                  fsqrt.s      fs7, fa5, rdn
                  flt.s        s5, ft5, ft6
                  flt.s        zero, fs6, fs10
                  fmv.w.x      ft6, t5
                  and          s6, tp, t1
                  fmv.w.x      fa2, t6
                  sll          s3, s1, s4
                  auipc        s4, 117235
                  fdiv.s       fa2, ft8, fs1, rdn
                  mulhu        gp, a6, s2
                  nop
                  fcvt.s.wu    fs4, t4, rup
                  lui          a2, 1027406
                  sll          a6, a1, s5
                  fsub.s       ft0, fs3, fs4
                  srli         t4, s7, 1
                  fsgnjn.s     fs1, fs5, ft2
                  fsgnjx.s     ft10, ft11, fs9
                  fnmadd.s     fs11, ft5, ft7, fa0
                  sll          s8, s0, s6
                  nop
                  ori          s4, t6, 601
                  mulh         s8, a4, zero
                  fmin.s       fa4, fs9, fs1
                  srli         ra, s2, 17
                  fsqrt.s      fs4, ft2
                  xor          t4, sp, a0
                  mulhu        tp, t2, s6
                  fmin.s       ft10, ft9, ft10
                  ori          a0, a5, -954
                  slli         a5, a0, 29
                  nop
                  fcvt.s.wu    fs2, s9
                  fmadd.s      ft9, fa1, fa6, fs11
                  sra          gp, t2, s3
                  div          a6, a2, a0
                  fdiv.s       fs6, fs3, fs0
                  fmv.w.x      ft3, tp
                  srai         zero, a0, 19
                  sub          t4, s0, t6
                  fmv.w.x      ft8, s8
                  andi         a7, s2, 1929
                  and          t5, gp, a1
                  mulh         t3, t5, t2
                  fmsub.s      fa4, fa0, fs5, fs6, rmm
                  srli         a5, t5, 23
                  fsqrt.s      fs5, fs7, rdn
                  ori          a2, s8, 1017
                  fmadd.s      ft0, fs3, fa5, fa3, rtz
                  fmv.w.x      ft5, a7
                  mul          t5, s3, s10
                  fsub.s       ft8, ft8, fs7
                  xori         a6, t0, 1139
                  sltu         s10, s9, s8
                  fsgnjn.s     fa3, ft5, fs8
                  fcvt.w.s     t1, ft9, rne
                  remu         s5, sp, s8
                  or           s4, a7, a1
                  slti         tp, s8, 868
                  lui          s8, 895077
                  fcvt.s.wu    ft3, s3, rdn
                  fmv.w.x      ft3, t4
                  sub          a3, a6, t2
                  xor          s5, s11, a5
                  fnmadd.s     fa1, ft11, fs8, fs8, rtz
                  ori          a0, s1, 1602
                  div          s9, t1, s11
                  mul          a4, s5, t4
                  slli         t1, a5, 3
                  lui          s2, 497760
                  mulhsu       tp, s1, t3
                  fsub.s       fa2, ft0, ft1
                  lui          t6, 273410
                  fnmsub.s     fa1, ft5, fs5, ft2, rtz
                  slt          t1, t4, s2
                  srl          t6, s0, ra
                  sltu         t4, a5, a0
                  or           a5, t0, a3
                  fnmadd.s     fa0, ft8, ft0, ft0
                  lui          s8, 635209
                  sub          a6, ra, zero
                  auipc        a5, 643877
                  slti         a7, t1, -269
                  and          zero, sp, s11
                  srai         s6, a7, 5
                  xor          t0, a2, t1
                  nop
                  fnmsub.s     ft1, ft0, fs1, ft8
                  ori          t0, a2, 1929
                  srl          t6, s7, a7
                  rem          t6, s11, a4
                  fcvt.s.wu    fs1, sp
                  fcvt.s.w     fs10, a0, rne
                  xor          a4, s10, s4
                  auipc        t3, 143197
                  fcvt.wu.s    a5, fs7, rmm
                  slt          s1, zero, t3
                  sub          s1, a1, s10
                  sub          a1, t4, t3
                  sltiu        s3, a2, 977
                  auipc        t0, 202075
                  fmv.w.x      fs4, t4
                  fsub.s       ft4, fs11, fs2
                  and          a6, tp, s5
                  and          s5, t1, a4
                  xor          a4, a4, a0
                  feq.s        t3, ft11, fs0
                  slti         a6, s11, 1090
                  fclass.s     a2, fs3
                  fclass.s     s4, fs9
                  fnmsub.s     fs5, fs4, ft11, fs0, rne
                  rem          t6, s8, s10
                  sltiu        a5, s6, 1565
                  rem          t4, s2, s5
                  feq.s        t3, fa4, fs4
                  remu         t3, a0, s2
                  remu         t4, s4, t5
                  ori          t6, a2, 744
                  sub          a0, tp, t6
                  ori          t3, sp, 164
                  sll          t3, a1, a6
                  mul          gp, a2, gp
                  fadd.s       ft5, fa5, fs2, rne
                  or           sp, s2, s2
                  ori          s6, t6, 741
                  mulh         a7, t4, a6
                  div          gp, a7, a3
                  fsgnjn.s     fs3, fa3, ft6
                  mul          s2, s1, zero
                  fadd.s       ft7, ft5, fs10
                  sltiu        a5, zero, 927
                  feq.s        a5, fs9, fs6
                  xor          s5, s3, s7
                  sltu         a1, s4, s11
                  fsgnj.s      ft8, fs2, ft6
                  remu         t3, t1, zero
                  auipc        t3, 453386
                  andi         t6, s3, -1335
                  sra          s4, s2, t4
                  fsgnjn.s     fs3, fs1, ft5
                  fadd.s       ft1, fs11, fs11
                  fsgnjn.s     fs3, fs5, fs5
                  lui          t1, 354000
                  ori          a6, s3, 904
                  fsub.s       ft1, fa3, ft6, rdn
                  fsgnjn.s     fa2, fs9, fa3
                  fcvt.s.wu    fs3, t4
                  div          a6, t1, t5
                  sub          s4, a4, a3
                  add          s10, s9, s10
                  addi         s10, a3, 1144
                  auipc        s8, 437183
                  rem          t5, s7, a3
                  fcvt.w.s     s0, fs0
                  and          s2, t3, t5
                  fdiv.s       fs8, fa3, fs11, rup
                  fmin.s       ft0, fa3, fs7
                  fmin.s       ft10, fs4, fs3
                  xori         s6, s5, -1138
                  srl          s1, a1, t6
                  fcvt.wu.s    s4, fs5
                  fclass.s     a6, ft7
                  add          a4, s7, a3
                  mul          t3, t2, ra
                  fsgnj.s      ft4, ft8, fs11
                  fcvt.s.w     ft4, a5
                  mulh         zero, t0, t2
                  fmv.x.w      a6, fa0
                  fnmsub.s     fs11, fa1, ft7, fa1, rmm
                  srai         a0, s7, 8
                  fdiv.s       ft11, fa0, ft5
                  fmadd.s      fa1, fs10, fs6, ft2, rmm
                  fmv.x.w      t0, ft2
                  sub          ra, s8, s10
                  slti         s10, s5, -1006
                  fsgnjx.s     fa7, fs3, fa4
                  fmv.w.x      fs5, t3
                  fsgnjn.s     ft0, ft0, fs3
                  slli         a5, s2, 22
                  fmv.w.x      fs3, s4
                  sltu         s5, s0, s5
                  feq.s        t0, fs3, ft9
                  fmv.w.x      fs7, s10
                  fmin.s       ft2, ft6, ft1
                  fsgnj.s      fs9, ft0, fs9
                  fmsub.s      ft6, ft3, fa2, fs10
                  srli         t4, a0, 16
                  fsgnjx.s     ft3, fa5, ft2
                  fmul.s       fs4, ft0, ft3, rne
                  fmv.w.x      fa6, t4
                  fnmsub.s     fs3, fa1, fs10, fs7, rmm
                  divu         t3, a4, t3
                  lui          s2, 664579
                  fsub.s       ft0, ft5, fa5
                  fmul.s       fs8, fs5, ft7, rup
                  fcvt.w.s     a0, fa5
                  fnmsub.s     ft6, fs2, fs10, fs7
                  xori         t1, t1, 1354
                  add          gp, s5, a1
                  addi         t6, t6, -691
                  fcvt.wu.s    sp, ft0
                  fsqrt.s      fs0, fa6, rne
                  mulhu        a5, s0, a4
                  rem          s5, a7, gp
                  fnmsub.s     fs6, fs0, fs3, fs8, rup
                  andi         sp, s7, -1493
                  divu         a4, s9, a0
                  slli         zero, a4, 17
                  fmv.x.w      a0, ft11
                  fcvt.s.w     ft1, s2
                  xori         t4, t2, 1387
                  divu         t0, a5, s11
                  fsgnj.s      ft4, fs4, ft9
                  fsgnjn.s     ft2, fs5, ft4
                  fnmsub.s     fa0, fs5, ft4, fa3, rtz
                  fmv.w.x      ft0, t5
                  sltiu        s2, t3, 1537
                  lui          s5, 217956
                  fcvt.s.wu    fa4, t5, rup
                  ori          s5, a1, 1192
                  fmadd.s      ft1, ft2, ft3, fs11, rup
                  mul          gp, s11, t4
                  sub          s8, s6, a0
                  fsqrt.s      fs5, fa4
                  fsgnjn.s     fs7, fs5, ft9
                  auipc        a2, 697246
                  slli         a2, t3, 29
                  and          s9, a3, a7
                  fnmadd.s     fs10, fs8, fs10, ft2, rne
                  divu         gp, s4, gp
                  divu         s9, s7, s3
                  sra          s5, s4, a5
                  sra          s0, a0, t1
                  fnmsub.s     ft4, fa4, fs5, ft6, rup
                  sub          tp, s8, tp
                  fmv.w.x      fa5, s3
                  fsub.s       fs10, fs11, fs9
                  fmv.w.x      ft6, s2
                  slt          zero, s0, s9
                  nop
                  feq.s        s2, fs2, fs7
                  and          ra, t5, t6
                  fsgnj.s      fa7, ft10, ft9
                  slli         t5, gp, 11
                  fcvt.s.w     fs4, t3
                  fcvt.w.s     a6, ft2, rdn
                  fsgnjx.s     fa3, ft10, ft3
                  ori          s3, a6, -1903
                  feq.s        s3, fs8, fs5
                  sltu         zero, s1, t1
                  fcvt.s.w     fa2, a7
                  slti         a6, t3, -799
                  slt          t1, s8, s9
                  fnmsub.s     fa3, fa6, fs3, fa2
                  fsub.s       fa3, fs10, fs2
                  mulhsu       s0, t3, t3
                  fsgnj.s      fs0, fs5, fa3
                  fmv.x.w      a1, fs5
                  sltu         s2, tp, ra
                  fmul.s       ft6, fs1, fa1
                  or           a2, gp, s1
                  fmadd.s      fs10, fa0, fs1, fs5
                  fsqrt.s      ft8, fs9
                  fadd.s       fs10, ft9, fs5, rtz
                  divu         a1, s0, sp
                  divu         a1, s1, sp
                  sub          s8, s4, zero
                  sra          gp, s11, a2
                  slli         s5, gp, 9
                  rem          t4, s6, sp
                  ori          a0, s0, -1199
                  nop
                  flt.s        s9, fs10, ft3
                  slli         tp, a4, 10
                  add          t4, a2, s10
                  mulh         s8, s11, a6
                  fmadd.s      fa3, fa6, fa4, fa4, rtz
                  fmin.s       fs6, fs6, fs1
                  fclass.s     s9, fa7
                  srl          t4, a1, zero
                  andi         a2, a5, -150
                  srli         s6, s2, 26
                  fmax.s       ft11, ft0, fs0
                  sltiu        t3, a2, -519
                  ori          s10, s3, 489
                  sll          t1, tp, t4
                  fcvt.wu.s    ra, ft7, rmm
                  fcvt.w.s     t5, fa3
                  slli         s5, t1, 23
                  fcvt.s.w     ft8, t1, rup
                  fdiv.s       fs0, ft7, fs6, rmm
                  and          a1, t1, s10
                  fadd.s       ft7, ft4, ft0, rne
                  xor          s3, t2, s3
                  add          s5, a5, t5
                  fsgnjx.s     ft10, fa4, fs7
                  srai         tp, s6, 21
                  divu         a3, a0, t5
                  mulhu        t5, a5, t5
                  addi         t4, sp, 1223
                  srai         tp, s4, 9
                  fcvt.wu.s    s1, fs0, rtz
                  fmv.w.x      ft11, zero
                  sltu         t0, a2, tp
                  auipc        s8, 616644
                  feq.s        a3, ft4, fs4
                  fmv.x.w      s5, ft1
                  nop
                  fcvt.s.wu    fs2, gp, rmm
                  fsgnjn.s     fs2, ft7, fa1
                  auipc        s2, 127419
                  fmv.x.w      s4, ft10
                  sll          s0, s4, t3
                  fmax.s       fs10, fs0, ft4
                  remu         t5, s3, a6
                  mulhsu       s5, t5, a6
                  lui          a7, 404419
                  sub          s1, ra, t0
                  div          t6, s3, a5
                  remu         s8, s0, a3
                  fsub.s       fs9, fs2, fs11, rmm
                  fclass.s     a2, ft6
                  sub          s4, zero, a7
                  fsub.s       ft0, ft2, fa0, rmm
                  fmax.s       fa0, fa2, fa3
                  andi         s2, t2, -508
                  auipc        sp, 785472
                  fmv.x.w      t4, fa4
                  mul          s9, sp, t6
                  ori          s0, a0, -1671
                  andi         zero, s0, -1815
                  fmin.s       fs6, fs2, ft2
                  fmin.s       fs7, ft0, fs7
                  xor          s3, s2, s6
                  div          ra, gp, t4
                  sub          tp, s5, t5
                  fmin.s       ft3, fs2, fs10
                  fnmsub.s     fs5, fa2, ft8, fa6
                  add          t1, s11, s4
                  fmax.s       ft2, fa4, fa5
                  slli         ra, s8, 26
                  remu         t6, s2, a7
                  mul          t0, s1, s0
                  xori         s9, zero, 1591
                  fmsub.s      ft4, fs3, ft9, fs7, rmm
                  sll          s2, s2, s7
                  addi         t1, t6, 499
                  rem          s9, a5, s8
                  fadd.s       fa7, ft3, fs3
                  sltu         s3, s5, s11
                  sub          a3, t2, s8
                  fcvt.wu.s    t4, ft5, rtz
                  xori         t0, s9, 1195
                  sub          sp, s1, a2
                  mulhu        s0, t3, s0
                  sll          ra, a3, s10
                  divu         t5, s2, s3
                  srai         t6, a4, 13
                  fcvt.s.wu    ft4, a3
                  sltiu        s0, a6, 869
                  fsgnjx.s     fa4, ft8, ft1
                  sltiu        t4, s6, 358
                  slti         s4, s6, -1653
                  fsgnjn.s     ft2, fs2, fs0
                  slt          a0, gp, t0
                  flt.s        a3, fs8, ft2
                  divu         t1, s6, t5
                  lui          a5, 120718
                  xor          a0, s7, t3
                  fnmadd.s     fs8, ft0, ft11, fs0
                  fclass.s     zero, fs6
                  xor          a3, s9, s2
                  fcvt.s.wu    ft8, tp, rdn
                  fnmsub.s     fs1, ft4, fa4, ft0
                  sll          tp, s8, a0
                  remu         a5, s3, tp
                  sub          s3, zero, t1
                  srai         t6, t6, 24
                  flt.s        t5, ft10, fa1
                  fsgnjn.s     ft9, fa0, fs4
                  divu         a7, a0, sp
                  fcvt.s.w     ft9, s8, rne
                  fmv.x.w      t6, fa5
                  fdiv.s       fs7, ft11, fs0
                  ori          a0, s11, -498
                  fsgnj.s      ft4, fs9, fs4
                  fmv.x.w      s9, fa0
                  sltu         zero, gp, zero
                  sltu         a0, s7, a1
                  andi         s1, a0, 637
                  fadd.s       ft2, ft4, ft0
                  feq.s        t4, ft8, fa5
                  mulhsu       a6, s6, a0
                  fmv.x.w      a7, fa6
                  remu         a4, a1, a4
                  xor          tp, zero, s5
                  fmadd.s      ft9, ft2, fa3, fa2, rup
                  fmax.s       fa6, fs10, ft4
                  fsqrt.s      fs3, fa0
                  addi         t4, t0, 571
                  fmsub.s      ft9, fa7, fa5, ft7, rup
                  fmsub.s      fs8, ft3, fa4, fs7
                  xor          s2, t3, s2
                  fmul.s       ft11, fs10, ft8, rtz
                  mulhsu       zero, s0, t6
                  sub          t5, s6, s6
                  sub          s2, s3, a4
                  mulhsu       tp, s8, ra
                  sltu         a7, ra, a7
                  andi         t1, s2, 1407
                  xori         s5, s5, -1921
                  srai         s4, s1, 14
                  sra          s10, s3, s10
                  div          s9, s2, a1
                  rem          t4, s3, a6
                  addi         a4, ra, 623
                  ori          s3, s0, 643
                  mulh         a2, sp, s9
                  or           s8, s1, t2
                  add          a7, s9, t2
                  srli         gp, a1, 11
                  fmin.s       fa6, ft7, fa6
                  mulhsu       s8, zero, s0
                  div          s6, t5, tp
                  fsqrt.s      fs5, fs11
                  add          s1, a7, a5
                  div          s0, t4, gp
                  srl          t5, a3, t3
                  fmin.s       ft10, fa1, fs11
                  fadd.s       ft1, ft5, fa5, rup
                  div          zero, zero, t5
                  srai         s10, s9, 13
                  srli         t0, a5, 13
                  fmv.w.x      ft1, a5
                  and          s4, t5, a1
                  ori          a1, s6, -367
                  fcvt.wu.s    s8, ft7
                  ori          a0, t6, -784
                  fmul.s       ft8, ft11, ft10
                  fcvt.s.w     fa4, gp
                  addi         a4, sp, 1247
                  mul          s0, t5, s2
                  fmsub.s      fs5, fs10, fs10, ft1, rmm
                  srai         s10, t6, 31
                  lui          s9, 1014710
                  mulh         s4, s4, sp
                  fmin.s       fs6, fs4, fs3
                  sra          ra, t0, tp
                  sltiu        ra, t3, 1388
                  sltu         a7, zero, s2
                  fcvt.w.s     gp, fa6, rmm
                  rem          s4, sp, a6
                  and          a7, s3, a3
                  fcvt.w.s     t1, fs0
                  sltu         a6, tp, s1
                  srai         tp, tp, 8
                  fmadd.s      fs8, ft4, fs6, fa1, rdn
                  or           s4, s4, s8
                  fcvt.s.w     fa1, gp
                  fmv.x.w      sp, ft8
                  fcvt.wu.s    a2, fs10
                  xor          t4, t1, s0
                  fmadd.s      fa7, ft3, fs4, ft7, rtz
                  divu         s3, s10, s7
                  srli         a3, gp, 9
                  andi         s5, s9, 680
                  fmadd.s      ft1, ft4, fs6, fa5, rtz
                  ori          zero, ra, 762
                  and          s10, sp, a4
                  sll          t1, t6, t5
                  fcvt.w.s     s1, fa5, rdn
                  fcvt.s.wu    fs5, s7, rne
                  fnmsub.s     fa6, fs4, fa2, ft11
                  slt          a4, a0, t4
                  lui          s5, 396608
                  fsub.s       fa1, ft3, ft3
                  rem          s8, tp, a2
                  fcvt.s.wu    fs11, t1, rup
                  fclass.s     s3, ft2
                  xor          s9, tp, gp
                  fnmsub.s     fs1, fs1, ft6, fa0
                  div          s3, s0, a6
                  srl          s8, s5, s11
                  fsgnjn.s     ft2, ft2, fa3
                  fsgnjx.s     ft8, fa7, ft10
                  fsgnj.s      fs11, fa5, fs11
                  fsqrt.s      ft11, fa1, rmm
                  mul          s2, s2, a7
                  fcvt.s.wu    ft8, t1
                  fle.s        gp, ft10, ft7
                  fmv.w.x      fa6, a7
                  fmax.s       ft10, fa3, fs11
                  fdiv.s       fa6, fs11, ft11
                  slt          a2, sp, s2
                  mulhu        t4, s4, ra
                  fsqrt.s      ft2, ft7
                  addi         a3, a6, 683
                  addi         t4, t0, -1058
                  fmv.x.w      a5, ft11
                  flt.s        a4, fa6, fs6
                  sub          t5, t4, a4
                  auipc        s9, 844666
                  feq.s        a2, fs5, fs4
                  fmul.s       ft3, ft4, ft0
                  ori          a1, t6, 1462
                  srai         a4, tp, 2
                  nop
                  addi         s5, zero, -1237
                  lui          a5, 958978
                  slti         a3, s8, 2021
                  or           s8, s4, t0
                  divu         t1, a0, sp
                  sub          sp, sp, a4
                  mulh         s1, s0, s3
                  fsub.s       fs8, fa2, fs3
                  fmadd.s      fs2, ft11, ft10, ft0
                  div          s10, t5, a4
                  ori          ra, a1, -1099
                  and          s10, t0, a3
                  andi         s9, ra, 1982
                  fsub.s       fs5, fs2, ft0, rdn
                  mulhsu       s6, s8, a6
                  fmul.s       ft8, ft0, ft3, rmm
                  fle.s        s6, fs11, ft3
                  fdiv.s       ft5, fs11, fa1, rmm
                  xori         t1, s4, 1000
                  fle.s        a4, fs2, fs4
                  fdiv.s       ft8, fa3, fs11, rup
                  slli         a6, gp, 14
                  fdiv.s       fs9, fa6, fa4
                  mulh         gp, t0, t6
                  srli         a3, s3, 10
                  div          s4, a3, ra
                  mulhu        s4, s4, t3
                  andi         a1, s1, -952
                  fmsub.s      fs5, fs7, fa0, ft11
                  or           s5, ra, s9
                  remu         zero, t2, s1
                  and          ra, a1, s3
                  fle.s        a1, fs8, fs4
                  fmv.x.w      s5, fa7
                  lui          s4, 3019
                  fle.s        zero, fs6, fs10
                  div          a2, s5, sp
                  srli         s6, t3, 31
                  sra          s6, a5, t5
                  rem          a2, s0, s5
                  addi         a1, zero, -3
                  fle.s        a5, fs1, fa7
                  flt.s        a5, ft0, ft8
                  fmv.x.w      a4, fa6
                  mul          s6, s4, a2
                  addi         ra, s6, 174
                  fmv.x.w      t3, fa3
                  fdiv.s       ft8, ft10, fa4
                  lui          s5, 182983
                  fsgnj.s      ft11, ft5, ft9
                  sltiu        a7, s6, 1442
                  feq.s        zero, ft8, fs7
                  lui          ra, 86120
                  fsgnj.s      ft2, fs7, fa7
                  slti         ra, t5, -1713
                  sltiu        a2, t0, -1079
                  fsub.s       ft2, ft1, fs7, rtz
                  feq.s        s4, fs2, ft7
                  auipc        a2, 652621
                  fle.s        a3, ft1, ft7
                  mulhsu       ra, t2, s2
                  mulhu        t4, s5, tp
                  sub          a1, t4, s4
                  slt          s1, a6, s4
                  fsgnjx.s     fs8, ft11, fs2
                  fmv.w.x      ft8, s7
                  fmax.s       fs5, fs0, ft8
                  sltu         s6, t4, t5
                  sltu         gp, s8, a2
                  fmsub.s      fa6, fs9, ft6, fs4, rdn
                  slt          a5, a0, t4
                  sltiu        gp, t2, -668
                  addi         a1, s4, -1587
                  or           gp, a3, a7
                  rem          s6, t1, ra
                  slt          s8, t4, t1
                  fnmadd.s     ft3, fs8, fa6, fa7
                  fsub.s       fa6, fa0, fa7
                  rem          s0, a0, t6
                  fnmadd.s     fs8, fa5, ft7, ft4, rtz
                  fsgnjx.s     fs5, fs5, ft3
                  ori          t4, s9, 641
                  fadd.s       fs7, ft5, fs3, rtz
                  sra          tp, t5, s4
                  fsub.s       fa7, fs1, fs9
                  sltu         s2, a6, sp
                  srai         t0, zero, 20
                  and          s6, s6, a7
                  xor          tp, a3, s11
                  fcvt.w.s     s4, ft3
                  nop
                  mulhsu       s5, s3, a1
                  div          tp, s1, s0
                  srl          a3, gp, s5
                  fnmsub.s     fs8, fs11, ft11, ft2
                  fclass.s     a4, fa7
                  auipc        zero, 739108
                  fmv.w.x      fs1, a5
                  or           s1, a2, s0
                  fsqrt.s      fs9, fa1
                  slli         a0, t4, 14
                  mulh         s2, t5, s10
                  fsgnjn.s     fs10, fs0, fs6
                  slli         a4, s1, 29
                  fsgnjn.s     ft4, fa1, ft9
                  mulh         s2, t6, a0
                  fmsub.s      ft0, ft1, ft5, fs10, rdn
                  divu         t1, ra, gp
                  fclass.s     s5, fs0
                  fmadd.s      fs11, fs1, ft4, fa2, rdn
                  fmul.s       fs11, ft4, ft3
                  sltiu        t4, s3, -1562
                  fclass.s     tp, ft4
                  slli         t5, a7, 31
                  ori          s5, a2, 928
                  sra          t0, a1, s9
                  sll          s4, tp, tp
                  add          t0, tp, tp
                  fmv.w.x      ft9, s6
                  sub          a4, s7, s0
                  fmin.s       fs1, fs7, fa6
                  fmv.w.x      fs10, a4
                  fle.s        t4, ft8, ft4
                  fadd.s       fs7, fa4, fs9
                  fnmadd.s     ft3, fs8, fs3, fs11, rtz
                  fcvt.wu.s    tp, ft6
                  add          s8, t1, t2
                  xori         s1, t3, 708
                  div          s6, a7, a1
                  fsgnj.s      ft1, fa1, fa0
                  fsqrt.s      fs8, fs3, rtz
                  sub          s1, tp, s7
                  mul          s4, s3, s11
                  and          a4, a6, t6
                  sra          sp, s7, t1
                  fle.s        a0, ft9, fs11
                  fsqrt.s      ft5, fs7
                  fmax.s       ft6, ft2, fs11
                  auipc        s4, 1024129
                  slli         a5, a5, 18
                  fcvt.w.s     t1, ft11, rne
                  fdiv.s       ft2, fs5, ft1, rtz
                  slti         t0, s0, 1435
                  auipc        s5, 439331
                  fclass.s     s0, fa4
                  rem          s2, ra, ra
                  fmin.s       fa4, fa6, fs10
                  slli         t0, t1, 19
                  or           s5, s9, a0
                  fcvt.s.wu    fs10, ra
                  fmsub.s      ft9, fs6, fa5, fs10
                  sltu         zero, s7, a0
                  fmv.w.x      fa4, a1
                  rem          zero, sp, a7
                  srl          zero, a2, t2
                  mulh         s2, a2, tp
                  srai         s8, s10, 11
                  fmv.w.x      ft8, a3
                  fcvt.s.wu    fa6, t5, rne
                  srl          t3, t3, s9
                  srl          s1, a1, s5
                  fclass.s     ra, fa2
                  srai         t0, s8, 28
                  fadd.s       ft0, fa5, fs9, rtz
                  sra          s9, t1, s1
                  fcvt.w.s     sp, fs1
                  sll          s4, s6, t6
                  andi         sp, s11, -382
                  slt          s8, s9, a3
                  xori         t1, s4, -2026
                  fmax.s       fs7, fa7, fs0
                  srli         t3, a1, 13
                  xor          tp, s0, t4
                  rem          s6, t0, s10
                  slti         s2, s2, -483
                  srl          a3, s3, ra
                  ori          t4, s2, 1454
                  fmv.x.w      t3, ft8
                  fmv.w.x      fs9, a1
                  srl          t5, t4, s2
                  mul          a7, a3, a6
                  remu         s1, s5, s10
                  sll          ra, a6, gp
                  fadd.s       ft10, ft11, ft5
                  add          tp, t2, a3
                  sub          s1, a3, s10
                  remu         s10, a3, s8
                  div          s0, s6, a6
                  addi         a3, a3, -910
                  fadd.s       fs1, ft4, fs1
                  sra          a2, a1, s7
                  fmax.s       fs8, ft7, ft3
                  andi         zero, t5, -1393
                  srli         a5, gp, 21
                  fnmadd.s     fa1, fs0, ft1, fa2
                  fclass.s     s5, ft11
                  auipc        s8, 1045524
                  flt.s        s3, ft4, ft1
                  fcvt.wu.s    a7, fs9
                  fclass.s     sp, fs2
                  sltiu        tp, s11, 1421
                  fmax.s       fs0, fa7, ft6
                  fmul.s       fa5, fa3, ft9
                  ori          t3, t4, 81
                  fsgnjn.s     fa6, ft3, fa5
                  fcvt.w.s     s5, ft0, rtz
                  mulh         s9, t0, t2
                  srli         t5, t2, 0
                  fcvt.s.wu    fa1, s10
                  addi         zero, a5, 138
                  srli         s9, s8, 7
                  srl          s1, a4, t2
                  nop
                  srai         t4, s6, 23
                  fdiv.s       ft2, fs0, ft9
                  fsgnjn.s     fs8, fs5, ft4
                  divu         s2, a1, s8
                  sra          s6, t3, a0
                  srli         s5, s8, 25
                  slt          t5, a6, a5
                  fsub.s       fa1, fa0, fa6, rne
                  fdiv.s       fa7, ft11, ft10
                  fcvt.wu.s    a1, fa7, rdn
                  fsqrt.s      ft5, ft1
                  mulh         a7, s0, tp
                  fcvt.s.w     fa4, s8, rdn
                  fmadd.s      fs2, fa4, fs5, fs2
                  sll          tp, t4, s8
                  fsgnjx.s     fa1, fs4, fs10
                  sll          s9, t3, a4
                  sltiu        t4, s5, -721
                  fmsub.s      fs11, ft5, ft6, ft4, rmm
                  andi         s4, zero, 1192
                  fsgnj.s      fs11, fa0, ft5
                  remu         s1, s8, s6
                  mul          t1, s5, zero
                  slli         a6, t4, 10
                  fmsub.s      fs9, ft11, ft7, ft5, rup
                  ori          ra, t4, -255
                  slli         s5, s10, 17
                  mulhu        s0, t0, tp
                  sub          tp, s4, s3
                  mul          s10, t4, zero
                  fsgnjx.s     fs2, ft5, ft3
                  fmsub.s      fa4, ft9, fs5, fs8
                  xor          a7, t6, a1
                  mul          a4, a3, s8
                  auipc        sp, 611055
                  add          s4, t1, s7
                  srl          s5, t1, a4
                  fsgnj.s      fa2, fs7, fs1
                  mul          a1, s10, a4
                  sll          s1, s7, t4
                  rem          s9, s0, a6
                  ori          t4, zero, 868
                  addi         s0, a2, -1285
                  fmin.s       fs0, fs10, ft7
                  fdiv.s       fa4, ft2, fs10
                  sra          a7, s9, a5
                  sub          t5, t5, s9
                  remu         t6, tp, a5
                  fsub.s       fs0, fs2, ft5
                  slt          a1, s3, t1
                  andi         a3, a2, -2038
                  mul          s4, gp, s5
                  fnmadd.s     fs9, fa2, fs0, ft0
                  srli         tp, ra, 8
                  addi         s2, a0, 711
                  div          a1, a0, s11
                  sra          s9, s1, s10
                  flt.s        a3, ft3, fs11
                  slt          s10, a4, t1
                  slti         ra, a0, 1231
                  fclass.s     tp, ft3
                  mulh         a6, a5, tp
                  addi         a0, sp, -1961
                  fsgnj.s      ft1, fs1, fa5
                  slti         s10, s7, 411
                  addi         a4, a3, -52
                  andi         t4, s2, 487
                  auipc        sp, 354661
                  and          ra, a7, tp
                  slli         gp, s9, 30
                  fsgnjx.s     fa2, fa3, ft6
                  fnmadd.s     fs4, ft4, ft1, fa7
                  srai         s9, zero, 31
                  slti         ra, t1, 144
                  fmax.s       ft0, fa4, fa0
                  or           t1, a4, s10
                  mulh         s2, s0, s10
                  slti         a0, t6, 182
                  sltiu        t4, t4, 684
                  fcvt.s.wu    ft8, s2
                  rem          ra, t2, t1
                  fsqrt.s      fs5, fs4, rdn
                  fsgnjn.s     fa5, ft2, fa4
                  sub          a6, a5, t2
                  div          t1, a5, a4
                  fle.s        tp, ft1, ft6
                  mulhsu       s0, s0, a2
                  fmul.s       ft8, fa3, fa1, rne
                  mulhu        t1, a6, a7
                  sub          t6, a1, s7
                  mulhsu       t3, t1, a5
                  feq.s        t1, ft5, ft8
                  sltiu        t4, a2, 994
                  fmsub.s      ft11, ft3, fs9, ft2, rdn
                  fsqrt.s      fs0, fa5
                  fadd.s       fa1, fs0, fs0
                  flt.s        t1, fa6, ft5
                  feq.s        a7, ft7, fs2
                  slt          a4, a6, tp
                  sltiu        t5, ra, 1922
                  fmin.s       fs4, fa0, fa2
                  fsgnj.s      fs5, ft4, fa2
                  fcvt.wu.s    s1, ft10, rup
                  sltu         s0, t1, a2
                  sub          s8, t4, s2
                  fclass.s     a2, fs3
                  rem          gp, t1, gp
                  mulh         s3, s10, s8
                  rem          s0, tp, t2
                  lui          a3, 976991
                  flt.s        t1, ft7, ft1
                  sra          ra, a6, t4
                  nop
                  feq.s        ra, fs3, ft5
                  fmv.x.w      a0, fa2
                  mulh         s9, t3, t4
                  andi         zero, s0, -967
                  fcvt.s.w     fs7, t4, rtz
                  fsgnj.s      ft4, ft5, fa1
                  mulhu        a7, a2, t4
                  ori          t3, s3, 1724
                  xor          a5, s2, s0
                  fcvt.s.wu    fs2, t4, rtz
                  remu         a4, ra, s7
                  fsqrt.s      ft0, ft10
                  addi         s3, a0, 864
                  sll          t4, sp, zero
                  slti         a3, a1, 625
                  fsgnjx.s     fa2, fs1, fa7
                  fsgnjn.s     fs11, ft7, ft0
                  slli         s8, a3, 2
                  mulhu        s0, t1, s1
                  feq.s        tp, fa2, fs5
                  andi         t3, ra, 667
                  xori         a6, t3, 1767
                  fcvt.s.w     fs0, t6, rne
                  addi         a2, s8, -1148
                  fdiv.s       ft7, fa5, fs2, rup
                  fmadd.s      ft2, fs2, ft7, fa5
                  slt          a0, gp, t4
                  xori         a1, a6, -1182
                  fmul.s       fa3, ft0, fs7, rmm
                  slli         a6, t4, 2
                  addi         t4, ra, 1609
                  or           a1, s3, s6
                  fnmadd.s     fs4, fa6, fs0, ft2
                  fsgnjn.s     fs5, fa7, ft1
                  xori         a6, zero, 451
                  fsub.s       fs4, fs5, ft5, rup
                  xor          s5, s5, t1
                  fclass.s     a0, ft11
                  slti         t0, a4, -1995
                  fsub.s       fs1, fs8, fa0
                  fsgnj.s      fs7, ft10, fs6
                  rem          a4, s9, gp
                  div          ra, ra, a3
                  remu         t0, t1, ra
                  xori         t3, s11, 722
                  fsgnj.s      ft0, fs1, fa1
                  fmax.s       fs2, ft2, fs5
                  div          s6, gp, a1
                  fmv.x.w      s1, fs7
                  fsub.s       ft11, fs11, ft9, rmm
                  fmul.s       fs4, ft10, ft0, rtz
                  fmul.s       fs2, fa0, ft4
                  fsgnjn.s     fa5, fs1, fa1
                  divu         t3, s1, a6
                  sra          a3, s9, s7
                  xor          zero, s4, sp
                  lui          s10, 1000374
                  sra          a0, t0, t3
                  andi         s1, s8, -1671
                  srli         s9, sp, 8
                  fsub.s       ft4, fs8, ft8, rtz
                  mulhsu       t5, a6, a1
                  slli         s1, a5, 12
                  fmsub.s      fs10, ft8, fs1, ft0, rmm
                  nop
                  sltu         s8, t6, s9
                  fmadd.s      ft6, fa2, ft2, fs9, rne
                  sltu         ra, s3, a6
                  fnmadd.s     fs7, ft10, ft8, ft9
                  fsqrt.s      fs3, ft11
                  sub          a1, a6, s7
                  slli         a1, tp, 1
                  remu         t0, a7, s11
                  fnmsub.s     fa1, ft0, fa0, ft8, rmm
                  fmv.x.w      sp, fs1
                  fcvt.w.s     s0, ft4
                  mulh         t0, a2, s11
                  fcvt.s.w     fa1, a7, rne
                  auipc        t6, 901579
                  fmv.x.w      t1, fa4
                  rem          tp, t6, s9
                  fcvt.w.s     s8, fs10
                  xor          t6, a1, tp
                  fmsub.s      fa4, ft10, fs7, fs8, rdn
                  ori          a2, s4, 1500
                  rem          t6, ra, s9
                  fle.s        s4, ft6, ft1
                  fsub.s       ft3, ft5, fs1
                  fsgnjx.s     ft5, ft11, fs11
                  fcvt.s.w     fs4, a1, rup
                  fle.s        a7, fs1, fs2
                  fmax.s       fa1, fs8, fs6
                  fsub.s       fa5, ft6, fs5
                  sub          t5, ra, t0
                  lui          a6, 1007252
                  rem          s2, s3, s8
                  flt.s        t5, fs8, ft7
                  fsgnj.s      ft5, fs1, fa2
                  fmul.s       fs10, fa2, fs4
                  fmv.x.w      s4, fs11
                  add          s2, s3, tp
                  fcvt.w.s     a1, fs9, rup
                  nop
                  sub          a6, s10, a5
                  or           a3, zero, t4
                  fcvt.s.w     ft2, s5
                  srli         s1, s5, 6
                  addi         sp, s2, -1458
                  fmv.w.x      fa6, zero
                  fle.s        s8, fa1, fs11
                  add          tp, a7, s8
                  or           s1, gp, s3
                  flt.s        a6, fa0, fa2
                  fmv.w.x      fs1, t3
                  mulhu        s9, a3, s2
                  sltiu        a3, a4, 910
                  auipc        s8, 344737
                  fnmsub.s     ft10, fa7, fs8, fs0
                  fmin.s       fa5, fs2, fa5
                  xor          t6, t6, a3
                  fmax.s       fa7, fs6, fa2
                  fadd.s       fa7, fs8, fs9
                  mulh         zero, a0, s8
                  nop
                  fcvt.wu.s    s3, fs0
                  fadd.s       ft11, ft5, fs1, rdn
                  fmax.s       fs8, fs7, fs4
                  div          t1, s3, s11
                  xori         s2, s5, 1640
                  fmadd.s      ft2, fa3, fa6, fs3, rmm
                  mul          a0, t1, a5
                  fsgnjn.s     fa4, fa6, ft0
                  fsgnjn.s     fs2, fa7, fs1
                  auipc        t1, 796287
                  fmul.s       fs3, fa4, fs7
                  feq.s        s9, fs2, fs3
                  fcvt.wu.s    t1, fa3
                  andi         s10, ra, 1328
                  addi         a3, s3, 1881
                  flt.s        t0, fs6, fa1
                  fmv.x.w      tp, ft5
                  fle.s        a5, ft10, fa4
                  mulh         s1, s1, s4
                  fmul.s       ft8, fs9, fa4
                  fnmsub.s     fa6, fa4, fs8, fa5, rup
                  fnmsub.s     fs7, fa4, fs5, ft5
                  nop
                  fmv.x.w      a7, fa2
                  rem          t5, a1, sp
                  fmax.s       fs0, fa7, fs8
                  fsqrt.s      fs3, ft8
                  xori         s5, gp, 573
                  fsqrt.s      fs5, fa1
                  fmv.w.x      fa5, s2
                  fcvt.wu.s    a1, fs1, rup
                  rem          s2, a0, s0
                  sltu         t4, t2, s2
                  fadd.s       fs1, fs11, ft8
                  flt.s        t4, ft0, ft2
                  fmin.s       fs4, fa7, ft6
                  fsub.s       fs4, fs0, ft11
                  mulh         a7, s10, t0
                  srli         sp, a0, 18
                  fnmadd.s     fs4, fs2, ft10, fs11, rdn
                  fsub.s       fs9, fs3, ft4
                  remu         s3, a4, t1
                  auipc        a1, 318575
                  fdiv.s       fs2, fs5, fa7
                  fsgnjx.s     ft1, ft3, fs7
                  fmv.w.x      ft5, a0
                  div          s8, a4, s7
                  fmin.s       fa7, fa6, fa6
                  fmax.s       ft0, fs10, fs2
                  sra          s1, a4, s10
                  fcvt.s.w     ft8, t6, rtz
                  fadd.s       fs1, fs3, fs7
                  sub          s6, sp, s11
                  sltu         a3, s3, t4
                  or           s9, s4, t1
                  mulhsu       ra, s10, t6
                  auipc        a1, 215462
                  fmax.s       ft11, ft7, ft6
                  fmul.s       fs0, fa5, fa5
                  div          a0, s3, a1
                  mul          t1, a3, s10
                  sll          t4, t0, a2
                  fadd.s       fa3, fa5, ft0
                  remu         s0, t2, a6
                  srli         a7, a4, 2
                  fcvt.s.wu    fa5, t5
                  sub          s2, s4, a1
                  fdiv.s       fa4, fa4, fs11, rmm
                  mul          s2, s3, gp
                  andi         a1, s11, 561
                  fmv.w.x      fa4, t2
                  fnmsub.s     fa5, ft3, fa5, fa0, rup
                  sltu         a7, s6, s8
                  div          t3, gp, t5
                  xor          a5, s9, a3
                  fmv.w.x      ft10, t4
                  rem          s10, s5, s4
                  mulh         a1, s5, sp
                  xor          t0, s6, s4
                  sub          t0, s0, s2
                  add          gp, s2, ra
                  and          s2, a5, t3
                  ori          gp, t0, 1616
                  slti         s0, a7, -1529
                  fmadd.s      ft8, fs11, fa7, fa5, rup
                  fsgnj.s      fs4, ft2, fa0
                  mulhu        a4, a3, s11
                  fle.s        a4, fa2, fs1
                  fcvt.s.w     ft2, t0
                  addi         t4, ra, -758
                  slt          zero, a2, t1
                  fcvt.s.wu    ft9, s5
                  mulh         s4, t1, tp
                  or           s8, t1, sp
                  xori         s6, a0, -1463
                  or           s3, zero, a6
                  nop
                  ori          s5, t6, -1847
                  mulhu        s8, s0, a6
                  fsgnj.s      fs0, fs1, fa7
                  divu         t6, a0, t0
                  fcvt.w.s     t5, fa3
                  fcvt.s.w     ft3, t0
                  fmv.w.x      ft11, t2
                  slt          a3, a3, t3
                  addi         a2, sp, -839
                  fmul.s       fs10, fs10, fs7, rmm
                  srli         ra, tp, 9
                  or           s4, a1, t2
                  and          t5, s5, zero
                  fmadd.s      fa5, fs1, ft10, fs6
                  fle.s        t0, ft2, fs0
                  mul          t0, a4, s10
                  fclass.s     s3, ft4
                  slli         a0, s10, 23
                  fmv.w.x      fa3, t0
                  fcvt.s.wu    fa4, a7, rmm
                  fsub.s       fa0, fa7, ft8
                  mul          s3, t5, s2
                  fmadd.s      ft10, ft5, fa2, fs5
                  sub          a4, t4, sp
                  div          gp, s0, zero
                  add          tp, a2, t3
                  srai         t5, s11, 28
                  remu         t5, a6, s10
                  nop
                  fmax.s       fs10, ft0, fa3
                  slt          a2, a0, s11
                  fmul.s       fs0, fs1, fs11, rup
                  slli         s0, s9, 18
                  fnmsub.s     ft10, fs11, ft8, ft5
                  add          s1, a0, s11
                  sub          a3, s2, a4
                  andi         t0, s1, -761
                  fle.s        a4, fs2, fs5
                  mulh         t3, a0, s10
                  fmax.s       fs3, fs9, fa3
                  feq.s        zero, ft2, fa6
                  fadd.s       fa1, fa7, ft11, rtz
                  fclass.s     a6, fa2
                  divu         s10, a2, s6
                  slti         a7, s8, 1399
                  slti         t0, a6, 506
                  fnmsub.s     fa0, ft9, fs4, fs8
                  andi         a1, s6, -1563
                  fsqrt.s      ft2, ft9
                  and          t1, a7, a5
                  fsgnjn.s     ft4, fa5, ft2
                  fnmadd.s     fs5, ft2, ft10, fs7, rtz
                  lui          s4, 159470
                  div          a7, t5, zero
                  fsqrt.s      fa0, fa1, rne
                  divu         s4, a1, t5
                  ori          tp, gp, 1216
                  fcvt.wu.s    s9, fa7
                  andi         s9, t2, 220
                  fmv.x.w      a1, fa7
                  mul          s9, t6, s4
                  mulhu        a6, a6, t0
                  xori         t5, s6, -695
                  fsub.s       ft3, ft8, fs0, rne
                  sub          t6, s5, s11
                  fsgnjn.s     fs2, fs9, ft4
                  mul          s2, s3, s9
                  mulh         sp, a7, gp
                  ori          a2, a0, -1163
                  or           s10, s10, s3
                  fmv.w.x      fs7, s10
                  fnmsub.s     fs9, fs5, ft7, ft1, rmm
                  or           sp, s8, s8
                  fmsub.s      ft4, ft11, ft3, fs1, rup
                  fsub.s       ft5, fs9, fs0, rdn
                  remu         sp, s4, s8
                  fadd.s       ft7, fs0, fs5, rtz
                  sra          t6, s6, s10
                  mulh         s9, t4, t4
                  feq.s        a7, ft8, fs3
                  lui          s4, 925414
                  div          sp, s0, s3
                  fsgnj.s      ft0, fs11, ft8
                  fdiv.s       fa0, fs0, fs9
                  srai         s1, t1, 3
                  srli         t1, a4, 8
                  ori          t0, a3, -686
                  mulh         zero, s6, s5
                  fadd.s       ft0, ft3, ft2, rdn
                  mulh         s8, zero, a3
                  fsqrt.s      ft2, ft6
                  sub          a6, s2, gp
                  srl          gp, s2, s0
                  mulh         t3, t6, s0
                  fsgnjn.s     ft0, ft0, fs2
                  rem          t1, a3, s1
                  rem          a4, a6, t6
                  sltu         s5, s7, a6
                  xor          t5, a5, sp
                  mulhsu       t1, a7, s10
                  fcvt.s.w     ft11, a0
                  srai         zero, a0, 26
                  remu         tp, a5, t5
                  fsgnjx.s     ft7, fs7, ft10
                  fsgnjn.s     fa3, fa1, ft2
                  fcvt.w.s     s8, ft11, rtz
                  fcvt.s.w     ft10, s3, rtz
                  nop
                  fcvt.s.wu    ft11, a3
                  div          t4, s6, s10
                  fmv.x.w      a2, fs10
                  fnmadd.s     ft8, ft9, fs1, ft2, rup
                  addi         s1, s2, 410
                  slt          s2, a4, t3
                  addi         s5, s11, 786
                  addi         s5, t3, 357
                  div          s4, t1, s1
                  fmv.x.w      s6, fa1
                  rem          a4, t0, a0
                  auipc        t5, 278339
                  sltiu        t1, t5, 775
                  fadd.s       ft6, ft3, fs11, rtz
                  auipc        s9, 341424
                  flt.s        a2, fa1, fs9
                  fmsub.s      fa2, fs3, fs11, fs2, rtz
                  fclass.s     a1, fs10
                  srl          t6, a0, a7
                  fle.s        t5, ft10, ft6
                  mulhu        s1, s3, a4
                  div          t0, a4, s9
                  nop
                  rem          t6, a5, s10
                  fmin.s       ft9, ft7, fs8
                  fle.s        t6, ft5, fa2
                  srli         zero, tp, 10
                  fdiv.s       fs1, fs9, fs10, rup
                  fsgnjn.s     fa6, ft5, fs2
                  div          t5, gp, a5
                  and          t3, s7, s2
                  nop
                  mulhsu       a0, gp, t1
                  fadd.s       fs2, ft5, ft3
                  remu         s5, a5, a6
                  fmin.s       ft1, ft9, fs6
                  lui          sp, 987167
                  sltiu        tp, zero, 251
                  slli         s5, s5, 17
                  fdiv.s       ft9, ft9, fs8
                  fsgnjn.s     fs4, ft5, fs0
                  fmin.s       fs6, fs9, fa0
                  remu         s8, s2, s3
                  rem          a4, t4, a1
                  mul          s10, a2, a5
                  remu         s4, s1, sp
                  nop
                  fle.s        a3, fa7, fa3
                  sltu         s5, s11, s10
                  slti         t5, s8, 764
                  fmul.s       fs0, ft11, fa7
                  and          t0, t2, gp
                  sltu         a1, t0, gp
                  fmv.x.w      a6, fs1
                  andi         t3, t2, -232
                  fclass.s     s3, fa0
                  fsub.s       ft0, ft8, fa1
                  divu         t0, t0, s11
                  sub          a7, s3, gp
                  or           t4, s7, s3
                  sltu         t3, s2, s1
                  fnmadd.s     fa1, ft8, ft6, fa3, rne
                  fsgnj.s      fs0, fs2, ft9
                  auipc        t4, 14451
                  lui          s4, 735722
                  fsqrt.s      ft10, fa3, rtz
                  fmsub.s      fs2, fa6, fa0, ft1
                  sra          zero, t4, a6
                  sltiu        s0, sp, -1042
                  nop
                  andi         a1, a1, 1048
                  mulhu        sp, a4, zero
                  mulhu        s5, t3, a4
                  andi         t5, s1, 1245
                  fnmsub.s     fa1, ft1, ft6, fs8
                  fdiv.s       ft10, fs8, fs0, rne
                  fmul.s       fs5, fa7, ft0
                  fcvt.wu.s    s3, ft10
                  mulhsu       s8, s8, t0
                  remu         t0, a2, s2
                  mulhsu       t0, a7, a5
                  auipc        s0, 984650
                  andi         s9, t1, 1756
                  fnmsub.s     fs5, fa0, ft10, fa2, rmm
                  mul          a3, sp, s4
                  sll          a4, sp, ra
                  fadd.s       fs11, ft4, fa6
                  fmv.w.x      fs4, s7
                  xori         a1, a1, 1973
                  fadd.s       fa6, fa3, fs11, rdn
                  sll          s0, a0, sp
                  lui          a6, 1035337
                  fmadd.s      fs5, ft3, fs3, ft6, rup
                  fcvt.s.w     ft0, ra
                  slli         t4, a5, 7
                  fadd.s       fa0, fa2, fs10, rup
                  sub          sp, t1, a3
                  fcvt.wu.s    a1, fa5, rtz
                  srai         zero, s8, 5
                  fsgnj.s      fs6, fa6, fs8
                  fmax.s       fa0, fs5, fs6
                  fmin.s       fs2, fs7, fa3
                  sll          a4, a7, s1
                  mulhu        a3, s7, s11
                  andi         a3, a5, -1279
                  srai         s2, s7, 29
                  div          a6, s2, t4
                  xor          s6, a1, s4
                  addi         s1, a7, -855
                  and          s9, a6, s10
                  and          s6, s9, a3
                  fle.s        a5, fs5, ft1
                  la x27, test_done
                  jalr x0, x27, 0
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
                  addi x7, x7, -4
                  sw  x23, (x7)
                  add x23, x7, zero
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
                  add x7, x23, zero
                  csrr x31, 0x300 # MSTATUS
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 31
                  bne x31, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x31, 0x341 # MEPC
                  csrr x31, 0x342 # MCAUSE
                  li x21, 0x3 # BREAKPOINT
                  beq x31, x21, ebreak_handler
                  li x21, 0x8 # ECALL_UMODE
                  beq x31, x21, ecall_handler
                  li x21, 0x9 # ECALL_SMODE
                  beq x31, x21, ecall_handler
                  li x21, 0xb # ECALL_MMODE
                  beq x31, x21, ecall_handler
                  li x21, 0x1
                  beq x31, x21, instr_fault_handler
                  li x21, 0x5
                  beq x31, x21, load_fault_handler
                  li x21, 0x7
                  beq x31, x21, store_fault_handler
                  li x21, 0xc
                  beq x31, x21, pt_fault_handler
                  li x21, 0xd
                  beq x31, x21, pt_fault_handler
                  li x21, 0xf
                  beq x31, x21, pt_fault_handler
                  li x21, 0x2 # ILLEGAL_INSTRUCTION
                  beq x31, x21, illegal_instr_handler
                  csrr x21, 0x343 # MTVAL
                  1: la x27, test_done
                  jalr x1, x27, 0

ecall_handler:    
                  la x31, _start
                  sw x0, 0(x31)
                  sw x1, 4(x31)
                  sw x2, 8(x31)
                  sw x3, 12(x31)
                  sw x4, 16(x31)
                  sw x5, 20(x31)
                  sw x6, 24(x31)
                  sw x7, 28(x31)
                  sw x8, 32(x31)
                  sw x9, 36(x31)
                  sw x10, 40(x31)
                  sw x11, 44(x31)
                  sw x12, 48(x31)
                  sw x13, 52(x31)
                  sw x14, 56(x31)
                  sw x15, 60(x31)
                  sw x16, 64(x31)
                  sw x17, 68(x31)
                  sw x18, 72(x31)
                  sw x19, 76(x31)
                  sw x20, 80(x31)
                  sw x21, 84(x31)
                  sw x22, 88(x31)
                  sw x23, 92(x31)
                  sw x24, 96(x31)
                  sw x25, 100(x31)
                  sw x26, 104(x31)
                  sw x27, 108(x31)
                  sw x28, 112(x31)
                  sw x29, 116(x31)
                  sw x30, 120(x31)
                  sw x31, 124(x31)
                  la x27, write_tohost
                  jalr x0, x27, 0

instr_fault_handler:
                  add x23, x7, zero
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
                  add x7, x23, zero
                  lw  x23, (x7)
                  addi x7, x7, 4
                  mret

load_fault_handler:
                  add x23, x7, zero
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
                  add x7, x23, zero
                  lw  x23, (x7)
                  addi x7, x7, 4
                  mret

store_fault_handler:
                  add x23, x7, zero
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
                  add x7, x23, zero
                  lw  x23, (x7)
                  addi x7, x7, 4
                  mret

ebreak_handler:   
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  csrw  0x341, x31
                  add x23, x7, zero
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
                  add x7, x23, zero
                  lw  x23, (x7)
                  addi x7, x7, 4
                  mret

illegal_instr_handler:
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  csrw  0x341, x31
                  add x23, x7, zero
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
                  add x7, x23, zero
                  lw  x23, (x7)
                  addi x7, x7, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x31, 0x300 # MSTATUS;
                  csrr  x31, 0x304 # MIE;
                  csrr  x31, 0x344 # MIP;
                  csrrc x31, 0x344, x31 # MIP;
                  add x23, x7, zero
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
                  add x7, x23, zero
                  lw  x23, (x7)
                  addi x7, x7, 4
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
