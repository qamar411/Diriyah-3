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
                  li x7, 0x40001120
                  csrw 0x301, x7
kernel_sp:        
                  la x6, kernel_stack_end

trap_vec_init:    
                  la x7, mtvec_handler
                  ori x7, x7, 1
                  csrw 0x305, x7 # MTVEC

mepc_setup:       
                  la x7, init
                  csrw 0x341, x7

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x7, 0x3800
                  csrw 0x300, x7 # MSTATUS
                  li x7, 0x0
                  csrw 0x304, x7 # MIE
                  mret
init:             
                  li x7, 3660477
                  fmv.w.x f0, x7
                  li x7, 4286578688
                  fmv.w.x f1, x7
                  li x7, 2139095040
                  fmv.w.x f2, x7
                  li x7, 2143289344
                  fmv.w.x f3, x7
                  li x7, 2147483648
                  fmv.w.x f4, x7
                  li x7, 2147483648
                  fmv.w.x f5, x7
                  li x7, 2139095041
                  fmv.w.x f6, x7
                  li x7, 2143289344
                  fmv.w.x f7, x7
                  li x7, 300407971
                  fmv.w.x f8, x7
                  li x7, 2147483648
                  fmv.w.x f9, x7
                  li x7, 2143289344
                  fmv.w.x f10, x7
                  li x7, 143749313
                  fmv.w.x f11, x7
                  li x7, 1232188026
                  fmv.w.x f12, x7
                  li x7, 4286578688
                  fmv.w.x f13, x7
                  li x7, 2139095040
                  fmv.w.x f14, x7
                  li x7, 2139095039
                  fmv.w.x f15, x7
                  li x7, 4286578687
                  fmv.w.x f16, x7
                  li x7, 0
                  fmv.w.x f17, x7
                  li x7, 2147483648
                  fmv.w.x f18, x7
                  li x7, 12255636
                  fmv.w.x f19, x7
                  li x7, 2149956244
                  fmv.w.x f20, x7
                  li x7, 4286578687
                  fmv.w.x f21, x7
                  li x7, 4286578687
                  fmv.w.x f22, x7
                  li x7, 0
                  fmv.w.x f23, x7
                  li x7, 4286578688
                  fmv.w.x f24, x7
                  li x7, 3404963443
                  fmv.w.x f25, x7
                  li x7, 4286578687
                  fmv.w.x f26, x7
                  li x7, 4286578687
                  fmv.w.x f27, x7
                  li x7, 2155826102
                  fmv.w.x f28, x7
                  li x7, 2139095041
                  fmv.w.x f29, x7
                  li x7, 2147483648
                  fmv.w.x f30, x7
                  li x7, 4286578688
                  fmv.w.x f31, x7
                  fsrmi 3
                  li x0, 0x80000000
                  li x1, 0x0
                  li x2, 0x0
                  li x3, 0x0
                  li x4, 0x6
                  li x5, 0xffc9809b
                  li x7, 0x80000000
                  li x8, 0x0
                  li x9, 0x0
                  li x10, 0xf
                  li x11, 0xf55b4d40
                  li x12, 0x0
                  li x13, 0xd8625195
                  li x14, 0x80000000
                  li x15, 0x2
                  li x16, 0x80000000
                  li x17, 0xa
                  li x18, 0x716723f4
                  li x19, 0x7
                  li x20, 0x80000000
                  li x21, 0xf7f73209
                  li x22, 0xff1e33b7
                  li x23, 0x0
                  li x24, 0x3e392ae1
                  li x25, 0xc
                  li x26, 0x1
                  li x27, 0x0
                  li x29, 0xa60dffbf
                  li x30, 0xe
                  li x31, 0x80000000
                  la x28, user_stack_end
main:             mulh         t4, s10, a3
                  mulhu        t4, a3, t0
                  slti         a7, t1, 1231
                  sltiu        zero, a6, -1943
                  rem          s0, s9, t1
                  auipc        s1, 648650
                  fsqrt.s      fa4, ft5, rup
                  fmul.s       fa2, ft2, ft9
                  sub          gp, sp, s6
                  mulh         t0, s9, s10
                  or           t6, s5, t5
                  div          a7, t0, a2
                  sll          t5, a2, t4
                  feq.s        s8, fs7, fs2
                  fle.s        s2, fa4, ft10
                  fmv.w.x      fs8, a0
                  fmax.s       fs4, fs9, fa3
                  feq.s        s2, ft9, fs9
                  auipc        a7, 555042
                  fsqrt.s      fs10, fs9, rtz
                  fdiv.s       fs11, fs7, ft2, rmm
                  fmv.x.w      s1, fs9
                  andi         ra, s4, -365
                  slli         a7, s0, 26
                  fsqrt.s      fs7, fa4
                  mul          a1, s10, t3
                  slli         gp, ra, 25
                  feq.s        s4, fs9, fs4
                  fsgnjn.s     ft4, ft9, fa6
                  rem          a0, s0, t5
                  fmv.w.x      fs4, t0
                  and          ra, a6, t2
                  fmv.w.x      fs8, t6
                  fsqrt.s      ft10, fs7, rmm
                  flt.s        a1, fs2, fs2
                  ori          s4, t2, -1355
                  fsgnjx.s     fs6, ft3, ft10
                  nop
                  fmax.s       ft1, ft11, fa6
                  fcvt.w.s     s4, ft7
                  srl          s5, t0, a5
                  sltiu        s6, s7, -512
                  nop
                  fmv.x.w      t2, ft6
                  fsub.s       ft1, fs2, ft7
                  fadd.s       fa2, ft8, fa5, rne
                  fcvt.s.wu    fs7, a7
                  sltu         s9, s10, tp
                  fsgnjx.s     fs2, ft10, fs11
                  fsgnjn.s     fa0, fa7, fa4
                  fsgnj.s      fs2, fa0, fs11
                  fmul.s       fs3, fa7, fs4
                  fmv.w.x      ft7, a6
                  remu         tp, s5, t6
                  feq.s        ra, fs4, fs5
                  add          a4, s3, s5
                  lui          zero, 528607
                  flt.s        s9, ft0, ft11
                  add          t2, s0, s1
                  fdiv.s       fs8, fs11, fs3
                  fsub.s       ft6, fa4, fa6
                  andi         t2, zero, -79
                  slt          a6, s0, a0
                  sltu         a2, t4, t0
                  sltu         s3, t0, s3
                  fsqrt.s      fa1, fa4
                  andi         s6, t6, -742
                  fcvt.s.wu    fs6, a5
                  xori         a7, t1, 396
                  fcvt.w.s     a7, fs9, rmm
                  lui          a3, 671285
                  mulhsu       s6, t6, a2
                  feq.s        t2, ft8, fs3
                  fcvt.w.s     t5, fs6, rup
                  fdiv.s       ft5, ft0, fs4, rne
                  mulhu        a1, s9, s1
                  remu         s2, t6, s11
                  fmax.s       fs4, fs3, fa7
                  ori          t6, t1, 1375
                  fadd.s       ft2, fs2, fs11
                  xori         t6, zero, 1994
                  mul          t0, a5, s2
                  addi         t5, a6, -1889
                  mulh         s11, zero, s7
                  auipc        a7, 717101
                  rem          t2, s11, a1
                  div          a4, s6, s2
                  ori          a0, t0, -902
                  srl          t2, s11, s1
                  fsgnjx.s     ft4, fs7, ft8
                  fmin.s       fa2, fa4, ft7
                  nop
                  xor          s3, s6, t2
                  fsgnjx.s     ft10, ft5, fs1
                  fle.s        s7, ft7, fs2
                  feq.s        s1, ft4, fs7
                  mulhsu       t6, a6, t0
                  lui          s4, 574450
                  fcvt.s.w     fa0, t2, rmm
                  fsgnj.s      fs8, ft7, ft3
                  sra          a4, t1, sp
                  fsgnjx.s     fs8, fa0, fa6
                  fcvt.w.s     a6, ft8
                  mulh         a0, a1, s9
                  fsgnjn.s     fs1, fa5, fs11
                  fcvt.s.w     fa7, s3
                  fsqrt.s      fs5, ft9
                  fcvt.w.s     s3, ft4, rmm
                  remu         t0, s6, zero
                  fmax.s       ft2, fs2, ft10
                  mulh         s5, t3, t4
                  slti         s3, s4, -32
                  div          t2, t3, s11
                  mulhsu       a6, a0, s3
                  slti         t0, s4, 1048
                  fclass.s     zero, fs7
                  or           t6, s7, a7
                  fsgnjn.s     fs10, fa5, fa2
                  fsub.s       fa7, fs1, fa7
                  fcvt.s.w     fa2, s5, rup
                  mulhu        t2, s4, s5
                  fmax.s       ft10, ft4, ft4
                  fmax.s       fs5, fs0, fa5
                  and          s0, tp, s9
                  slt          t4, gp, a2
                  mulh         a2, a5, s7
                  sub          s0, s2, s0
                  xor          s1, ra, a1
                  sll          a2, s2, gp
                  fsqrt.s      fs0, ft10, rup
                  slt          t2, tp, t6
                  rem          t6, gp, t4
                  mulh         s10, ra, s9
                  fcvt.s.w     ft9, a7, rmm
                  sltiu        t0, t3, 1355
                  flt.s        gp, fs7, fa2
                  fsgnjx.s     ft2, fa7, fs4
                  srai         t4, s0, 16
                  xor          t5, ra, t6
                  mulhsu       zero, s10, s9
                  srli         sp, gp, 12
                  feq.s        t0, fa7, fs5
                  xori         s7, s5, 1565
                  slt          s6, s6, sp
                  addi         zero, s8, 1200
                  mulhsu       t6, a3, a0
                  slli         a3, s1, 17
                  fmax.s       fs2, ft7, fs10
                  ori          s0, s8, 1353
                  srl          a3, t5, s4
                  and          s1, a0, s10
                  add          s11, a3, a0
                  fcvt.wu.s    a4, ft1
                  mulh         a3, t3, zero
                  fsgnjx.s     fs5, ft4, fs5
                  auipc        tp, 784577
                  fsgnjx.s     fa4, ft6, fs6
                  mulh         s9, s3, tp
                  fadd.s       fs0, fs8, fa2, rne
                  fmin.s       fa2, fa3, fa3
                  fsqrt.s      ft3, fa3
                  fcvt.w.s     s6, fs10, rmm
                  fmin.s       fs7, ft0, fs1
                  fcvt.s.wu    fa1, t6, rtz
                  mulh         ra, t4, s10
                  add          s3, s11, t3
                  slti         s2, s9, -1666
                  fmax.s       ft2, fs11, ft1
                  srai         a7, s1, 23
                  fmv.x.w      s2, ft10
                  fmv.w.x      fs11, t2
                  srl          a1, a3, a4
                  feq.s        s5, ft3, fs4
                  sra          t6, t6, s4
                  rem          a2, s5, a7
                  andi         ra, t0, 208
                  sltiu        t6, t6, -2003
                  fcvt.w.s     s2, ft11
                  fsqrt.s      ft2, fa5, rtz
                  fsgnjx.s     ft2, fa2, ft4
                  fcvt.s.wu    fa7, a5, rup
                  addi         tp, t3, 216
                  fclass.s     t2, ft9
                  srl          ra, t5, sp
                  fdiv.s       ft0, fa1, fs8
                  div          s0, s8, a0
                  fcvt.w.s     t5, fs10
                  fmv.w.x      ft10, s4
                  srai         s2, s11, 3
                  fsgnjx.s     fa0, ft11, ft1
                  fcvt.w.s     t6, fs0
                  divu         a3, a2, t5
                  fcvt.wu.s    t5, fs11
                  lui          s5, 92225
                  flt.s        s0, ft11, fa5
                  sltu         s1, a5, s9
                  srl          a3, s10, s6
                  rem          s3, a4, a0
                  feq.s        s8, ft1, ft4
                  lui          s0, 935239
                  remu         s1, a7, sp
                  auipc        s3, 1014768
                  sltiu        s8, s8, -923
                  srl          gp, s7, a2
                  fsub.s       fa6, fa2, ft0, rne
                  mulhu        s2, t3, t2
                  sltu         a4, s0, gp
                  divu         gp, s1, t5
                  fcvt.s.wu    ft8, tp
                  fmin.s       fs4, ft6, ft1
                  slt          t5, sp, a3
                  fadd.s       fs11, fs2, fa5, rdn
                  addi         s7, s8, -137
                  mul          a3, s3, zero
                  sll          ra, gp, ra
                  fsub.s       fs5, ft3, ft2, rne
                  divu         s0, s0, a2
                  fmax.s       fs5, fs10, fs6
                  fmv.x.w      a1, fs10
                  fcvt.w.s     s6, ft11, rne
                  xor          tp, ra, s5
                  fmv.w.x      ft6, a0
                  auipc        s3, 750737
                  auipc        t5, 238613
                  or           a0, a3, a0
                  fmv.x.w      s11, fs3
                  sll          s7, a7, s9
                  andi         s10, s2, -1297
                  srai         zero, ra, 26
                  addi         s3, t5, -323
                  flt.s        t4, fs9, ft9
                  slli         zero, gp, 17
                  auipc        s7, 604963
                  sltu         s8, s11, s8
                  fcvt.wu.s    zero, fa1, rtz
                  xor          a7, t6, a2
                  addi         s10, t2, 742
                  fcvt.w.s     a6, fs9, rup
                  flt.s        a2, ft10, fs5
                  mulh         s6, s3, s11
                  srli         a3, s4, 2
                  slli         gp, s1, 6
                  slli         t4, gp, 1
                  fcvt.w.s     t0, fa5, rtz
                  sltiu        s6, t1, -119
                  auipc        tp, 396627
                  feq.s        s4, fs5, fs3
                  rem          gp, s5, a0
                  or           s1, a1, zero
                  fdiv.s       fs11, ft11, fs9
                  mulhu        s11, a3, s3
                  add          s9, a4, a5
                  flt.s        s4, fs1, ft0
                  sra          t5, s1, s4
                  divu         s1, t1, a6
                  slt          s1, a4, s3
                  slti         s10, s9, -1115
                  fdiv.s       fa0, fs9, ft9, rdn
                  rem          a2, t4, tp
                  flt.s        a3, fa2, ft6
                  fsqrt.s      ft7, ft6, rdn
                  fsgnjn.s     ft1, fa3, fs3
                  srai         s0, a6, 1
                  fadd.s       fa0, ft0, fs4
                  fsgnj.s      fs10, ft0, fs2
                  mulhsu       s8, sp, a7
                  fle.s        s8, ft5, fa7
                  and          ra, a7, s3
                  fsgnjn.s     ft5, ft2, fs10
                  fmul.s       ft8, ft2, ft0, rmm
                  and          zero, s2, s2
                  fcvt.w.s     zero, fs5
                  rem          a2, a7, t0
                  fmax.s       fa5, ft4, fa4
                  srl          a4, a3, s0
                  mulh         gp, sp, s5
                  sltiu        s5, ra, -1052
                  fmin.s       ft5, ft9, fs10
                  auipc        t0, 824666
                  auipc        t2, 32734
                  fmin.s       ft1, ft7, ft1
                  fsgnjn.s     fs2, fs4, fa2
                  addi         a4, s7, 1892
                  srai         a3, t1, 4
                  fcvt.s.wu    ft3, t2
                  slt          s11, t2, s8
                  fclass.s     a4, fa5
                  and          a3, t0, tp
                  fmul.s       fs10, ft3, ft11, rne
                  fsgnjn.s     fa6, fs0, fa7
                  xori         t5, a3, -1400
                  fcvt.w.s     s1, ft11, rmm
                  auipc        t0, 439838
                  sltiu        t0, a2, 1065
                  srli         t6, s0, 6
                  flt.s        s5, fs1, fs5
                  fmv.w.x      ft10, a1
                  fmv.w.x      fs2, a4
                  fcvt.w.s     s9, ft1
                  fsgnjx.s     fs9, fs10, fa7
                  fmin.s       fs1, ft0, fa3
                  or           t0, s3, t3
                  flt.s        ra, ft8, ft11
                  sub          s8, s5, s5
                  lui          s2, 313506
                  fadd.s       ft3, ft8, fs11, rmm
                  auipc        a7, 9277
                  fmin.s       ft6, fs10, fa5
                  mulh         t0, s10, s1
                  sra          s8, s2, s8
                  rem          ra, tp, a2
                  lui          tp, 1044733
                  fmv.x.w      s3, fs8
                  srli         t4, zero, 16
                  andi         a6, s7, 1063
                  fle.s        s5, fs0, ft3
                  remu         s10, sp, a7
                  fmv.w.x      fa1, t2
                  fsgnj.s      fa6, fs8, fs5
                  fmul.s       fs7, fs10, fs7, rmm
                  add          a7, t1, a2
                  fsgnj.s      fa7, fs0, fs3
                  andi         s4, s7, 928
                  fclass.s     s4, fs1
                  and          s6, t6, a4
                  fsgnjn.s     fa7, fa4, fs1
                  srli         s0, t0, 14
                  fsgnjn.s     ft5, fs5, ft7
                  remu         s7, s10, t4
                  srli         zero, s9, 1
                  sltu         s8, sp, s9
                  mulh         t5, gp, t2
                  sll          a1, s6, t2
                  srl          s2, sp, s4
                  fsqrt.s      fa1, fs9
                  srl          a0, s1, s2
                  addi         t4, t2, -337
                  fsqrt.s      fa0, fs10, rtz
                  fcvt.s.wu    fa4, s9
                  nop
                  mulh         t6, a6, tp
                  fsgnjx.s     ft4, ft8, ft10
                  sub          s7, a2, s0
                  and          t4, s2, t1
                  feq.s        t5, ft7, fs3
                  srl          zero, s9, a0
                  fadd.s       ft3, ft2, fa6, rtz
                  fmv.w.x      fs0, s5
                  fsgnj.s      fa7, fs9, fs11
                  mulh         a7, s9, s2
                  mulhsu       s7, a0, a5
                  xori         s5, a2, -1775
                  srl          t4, s5, a3
                  srl          ra, a2, a6
                  mulhsu       s0, a6, a0
                  auipc        s5, 577886
                  mul          a6, s4, t4
                  fsgnj.s      ft3, fa7, ft8
                  sra          s10, s9, zero
                  add          a3, tp, a5
                  flt.s        t5, fs9, fa1
                  nop
                  or           s8, tp, s4
                  fmul.s       ft3, ft11, fa2
                  sll          s4, s9, s8
                  feq.s        s9, fa2, fa0
                  slli         s2, t6, 7
                  fadd.s       ft9, ft0, fa3, rdn
                  fadd.s       fa6, fa3, ft8
                  mulhu        t6, s6, t1
                  nop
                  fsgnj.s      ft1, fs10, fa5
                  feq.s        s0, fa0, ft2
                  fmin.s       fa7, fs9, fs3
                  addi         s7, a3, 1984
                  fmin.s       ft7, fa0, ft9
                  and          s3, s6, gp
                  xor          s11, s9, a3
                  sll          s2, s8, a6
                  sltu         sp, a5, t1
                  sltu         zero, a3, t1
                  fcvt.w.s     a2, fs2, rdn
                  mulhu        t0, s4, a7
                  fdiv.s       ft11, ft1, ft3, rup
                  fmin.s       ft2, ft5, fa0
                  fsgnjx.s     fa0, fs6, fa4
                  fsgnjn.s     fa1, ft7, ft1
                  fmax.s       fa7, fa6, fs10
                  fmv.x.w      sp, ft1
                  fmv.x.w      t0, ft0
                  srl          s8, s3, t5
                  add          a7, t3, t1
                  sltiu        s3, s2, 1465
                  add          s6, s0, s4
                  fmin.s       fs2, ft6, fs10
                  lui          t6, 943910
                  remu         t2, a3, s2
                  fmin.s       fs5, fs0, fs1
                  div          tp, t6, a7
                  slti         a6, t5, -403
                  fle.s        zero, fa7, ft5
                  andi         s0, s5, -1978
                  add          a4, a0, a5
                  fcvt.w.s     s4, fa6
                  slt          s4, a3, t5
                  sub          t2, a3, s2
                  flt.s        zero, fs3, ft7
                  fadd.s       ft5, ft3, ft3
                  xor          a0, t2, s4
                  slli         a7, a4, 30
                  andi         s6, a0, -901
                  fdiv.s       ft6, fs10, fs0, rtz
                  fadd.s       fa3, fs3, fa4
                  mulhsu       a6, s8, s5
                  fmin.s       fs7, fa3, fa7
                  auipc        s1, 206420
                  fdiv.s       fs0, ft6, ft1, rmm
                  fmv.w.x      fs7, a4
                  srl          a1, s8, zero
                  flt.s        s9, ft3, fs3
                  xor          a3, s0, t5
                  auipc        ra, 798576
                  fmul.s       fs9, fa6, fs4, rne
                  nop
                  srli         a1, t6, 19
                  and          zero, s0, tp
                  fmv.x.w      a0, fa7
                  fcvt.s.wu    fs3, t6, rtz
                  fcvt.s.w     fa6, s1, rmm
                  fsgnjn.s     fa1, fs4, fs5
                  lui          t4, 779277
                  sll          s9, gp, a1
                  fmv.w.x      ft0, a0
                  fclass.s     tp, fa7
                  remu         s0, t1, s7
                  srli         s8, a7, 9
                  mulh         s5, s2, s10
                  sltu         s7, zero, a7
                  rem          zero, s8, s4
                  fsgnjx.s     fa1, ft11, ft8
                  xori         t6, ra, -1777
                  fmv.x.w      t0, fs10
                  fadd.s       fs8, fs10, fs5
                  fadd.s       fs3, fa7, fs4
                  fsgnj.s      fs10, ft2, fs6
                  or           ra, a5, s3
                  srli         t0, s8, 12
                  flt.s        a0, ft10, fa7
                  fmv.w.x      ft2, a1
                  sub          s3, s1, a4
                  fsgnjx.s     fs1, fs2, fs9
                  xor          s3, t0, s11
                  ori          s10, s10, -1615
                  sltiu        s3, s8, 1161
                  fsqrt.s      fs5, ft1, rup
                  andi         t2, a6, 1847
                  ori          s0, a4, -1815
                  fcvt.s.wu    fa1, a5
                  div          a4, s6, t2
                  auipc        a3, 519273
                  fsub.s       ft1, ft1, ft9, rne
                  fsub.s       fs6, fa4, fs9
                  slli         a1, tp, 12
                  mulh         t6, a3, ra
                  fmin.s       fa6, fa5, fs2
                  sub          s1, a4, s7
                  slli         a1, a0, 3
                  fsqrt.s      ft0, fa1
                  fdiv.s       fs11, fa2, fs6, rtz
                  fsub.s       ft8, fa5, ft11
                  feq.s        s2, ft8, fs1
                  fmin.s       fs9, fa0, fs3
                  flt.s        s4, ft9, fs5
                  sub          s1, t4, t5
                  ori          s4, s3, 1984
                  srai         t0, s4, 18
                  divu         s8, s8, t2
                  mul          zero, s11, a2
                  slt          t5, s0, gp
                  fle.s        t6, ft3, fa4
                  flt.s        t2, fa1, ft6
                  lui          t5, 618990
                  fle.s        sp, fa1, ft0
                  srai         s0, t4, 2
                  sra          s1, a6, t6
                  xor          tp, a7, s1
                  sltiu        a3, t1, -742
                  fmv.x.w      s4, ft3
                  mul          s5, a7, t0
                  sltiu        a1, s0, 329
                  fmv.x.w      t5, fa0
                  mulh         s10, t3, a4
                  fmv.x.w      s3, fs3
                  fdiv.s       ft6, fs5, fs2, rmm
                  auipc        t2, 145520
                  fmv.x.w      s10, fs8
                  fmax.s       fs8, fs10, ft7
                  or           s2, a2, a4
                  ori          s2, sp, 504
                  addi         sp, t5, -1732
                  mulhsu       s10, s11, s7
                  sltiu        t5, a7, 1348
                  auipc        gp, 343958
                  fsgnjn.s     fs3, fs5, ft1
                  fcvt.s.wu    ft3, s8, rmm
                  srli         s5, gp, 31
                  feq.s        s8, fa4, ft11
                  fsgnjn.s     fa1, ft11, fa3
                  flt.s        a1, fa4, fs11
                  nop
                  sltu         s11, sp, s1
                  mulh         s1, a5, s0
                  addi         s2, a3, -1774
                  fmul.s       ft3, ft11, fa6
                  fsqrt.s      fs1, fs9, rtz
                  and          a1, a4, s2
                  slli         tp, t3, 8
                  fmin.s       fs1, fa6, fs1
                  xor          ra, ra, t4
                  sltiu        a3, a1, -290
                  fmv.w.x      fs3, s11
                  rem          t2, s8, t3
                  mulh         s0, s0, a1
                  fcvt.wu.s    gp, ft6
                  srli         zero, a0, 27
                  addi         s5, t3, -463
                  fcvt.wu.s    s0, fs10
                  andi         ra, s2, 18
                  fsqrt.s      fs5, fs1
                  fcvt.wu.s    t5, ft5
                  fsgnjn.s     ft11, fs9, fa7
                  nop
                  auipc        a4, 402251
                  sra          tp, s9, s3
                  fmin.s       ft7, fs0, fs2
                  and          s7, ra, s6
                  slti         s6, a2, -531
                  fmax.s       fa1, fs3, fs3
                  and          s0, s11, gp
                  andi         t5, zero, 1918
                  slli         s6, a5, 13
                  fclass.s     tp, ft8
                  xori         s2, s8, -588
                  divu         t5, s10, a7
                  add          s2, s7, a3
                  slti         s7, s4, -483
                  slli         t5, s1, 24
                  fcvt.s.w     fa3, s5, rmm
                  mulhu        a4, s4, a3
                  fle.s        t2, ft6, fa1
                  fmv.w.x      ft10, s10
                  feq.s        sp, fa4, fa6
                  mulhsu       a6, s2, tp
                  fle.s        t4, fs5, fs1
                  andi         ra, t4, -282
                  fmax.s       fs3, fs10, fa5
                  fsqrt.s      fs8, fa0
                  add          s4, a5, a6
                  remu         t0, t4, s7
                  sltiu        ra, s7, -1323
                  fmv.x.w      s6, fs8
                  fmv.x.w      t2, fs2
                  fcvt.s.w     fs7, ra, rtz
                  add          sp, s8, sp
                  slti         ra, a2, 667
                  and          zero, a5, s10
                  mulhu        s2, a4, a3
                  fsgnjx.s     ft8, ft9, fa5
                  xor          s11, s9, a4
                  fsub.s       fs11, fa7, fs9
                  and          s10, a2, t1
                  nop
                  xori         a7, t2, -818
                  fcvt.wu.s    t5, ft6, rne
                  feq.s        tp, ft3, ft8
                  srai         s8, sp, 21
                  srli         s2, a7, 12
                  addi         zero, a7, -680
                  fsqrt.s      fa3, fs3
                  slli         s0, a3, 3
                  fsgnjx.s     fa5, fs9, fa3
                  sltu         t2, s0, sp
                  xor          t0, t1, zero
                  auipc        a2, 63790
                  remu         s6, s6, t3
                  add          t5, a2, s4
                  fmul.s       ft7, ft2, ft9, rup
                  ori          sp, s0, 872
                  slli         s11, t5, 10
                  mul          s10, a4, s9
                  fdiv.s       fs9, ft1, fa4
                  fclass.s     a0, ft8
                  remu         a4, a6, s1
                  rem          a4, a6, t2
                  fadd.s       fa1, fs1, fs11, rdn
                  or           sp, a4, a5
                  remu         t4, t6, s1
                  fmv.w.x      fa6, a0
                  feq.s        t2, ft6, ft3
                  sub          a7, t0, s0
                  flt.s        a2, fs1, fs9
                  fmv.w.x      ft9, s4
                  or           s7, t1, t2
                  slt          gp, t1, s0
                  fsgnjx.s     ft4, fa1, ft8
                  fmv.x.w      gp, ft10
                  mul          a1, s7, a0
                  flt.s        s8, ft6, ft2
                  divu         s2, s10, ra
                  ori          s5, t1, -694
                  fcvt.wu.s    s8, ft1, rne
                  fmul.s       ft3, fs7, ft9
                  fmin.s       ft6, fs4, fs5
                  xori         t0, s0, -1446
                  sltu         sp, s7, t3
                  srli         a2, a4, 6
                  auipc        s0, 1039614
                  divu         s5, a6, zero
                  fmv.x.w      s5, ft7
                  lui          a6, 222629
                  flt.s        a7, ft1, fs2
                  xor          s9, s1, t4
                  fmax.s       fs1, fa5, fa4
                  fcvt.wu.s    t5, ft4
                  fcvt.s.w     ft0, s9, rne
                  fcvt.w.s     gp, ft2
                  or           a2, s11, s2
                  and          t2, a5, t2
                  mul          a0, a0, t1
                  add          zero, s4, s8
                  or           tp, t6, s11
                  srli         t4, t4, 24
                  slli         a7, s4, 30
                  fcvt.w.s     t4, fs10, rne
                  fadd.s       fs11, fs5, fa4
                  fmin.s       fa0, fs4, ft4
                  fadd.s       ft10, fa2, fs3
                  feq.s        a7, fs3, fa3
                  fmv.x.w      s9, fs8
                  srli         a4, s8, 2
                  fclass.s     s3, ft8
                  srai         s2, a7, 18
                  lui          tp, 211522
                  srl          s11, t6, a2
                  mulh         a1, s4, s7
                  addi         s4, s10, -731
                  div          a3, gp, a5
                  div          a4, a6, gp
                  fmv.x.w      t5, fs1
                  add          s6, a7, a0
                  fsub.s       ft4, fa7, fs6, rmm
                  andi         zero, a6, -1636
                  slti         t2, a7, 505
                  fsgnj.s      fs0, fs6, ft9
                  addi         s1, sp, 1145
                  mulhu        s8, t1, a0
                  sltiu        s5, a4, 997
                  fcvt.s.wu    fa6, t5, rmm
                  auipc        s10, 1001141
                  fmax.s       fa1, fs3, fs11
                  srl          a2, s11, ra
                  srli         t0, a4, 29
                  sltiu        t5, t2, 29
                  mulhu        s1, a5, a4
                  fsgnjn.s     fs9, fs8, fs10
                  div          tp, tp, t3
                  srli         tp, t6, 30
                  and          s4, s0, t5
                  mulhsu       s9, gp, t4
                  srai         t2, s11, 7
                  or           s4, t4, t3
                  xor          gp, s4, a4
                  sltu         a3, s9, s7
                  sll          s9, s10, tp
                  sub          s3, t6, s11
                  xor          zero, s11, t5
                  fsqrt.s      fs7, ft8
                  or           a0, s11, a7
                  lui          ra, 414661
                  srli         s1, zero, 25
                  fsgnjx.s     fa0, ft8, fa0
                  rem          ra, s4, t0
                  sra          s4, s2, a5
                  fdiv.s       ft7, fs9, ft11
                  fmv.x.w      s8, fa6
                  fsgnjx.s     fa6, ft9, fs1
                  slli         a7, zero, 13
                  slt          a2, s1, t0
                  fadd.s       fa4, fs0, fa4, rmm
                  flt.s        s10, fs8, ft9
                  fadd.s       ft11, ft7, fa6
                  srl          s11, t4, s9
                  sltiu        s4, s1, 200
                  sltu         a7, a2, s8
                  add          s0, a6, gp
                  fle.s        s8, fa5, ft8
                  or           a4, a3, a2
                  sub          tp, a6, a1
                  sll          ra, s1, s1
                  rem          s6, t4, s7
                  rem          s7, a5, t4
                  andi         a2, gp, -1368
                  fmax.s       fs9, ft5, fs9
                  sub          t4, sp, tp
                  mulhu        a3, tp, t2
                  fmin.s       fs3, fs7, ft9
                  lui          s3, 492609
                  nop
                  slti         a2, a2, -1409
                  nop
                  fcvt.wu.s    s5, fs2, rdn
                  mulh         ra, t1, s0
                  remu         t0, a4, s3
                  and          t5, s6, s8
                  fmv.x.w      a4, fs0
                  fsub.s       fs10, fs2, fa1, rne
                  xor          a6, sp, gp
                  fcvt.s.w     ft11, s7, rup
                  sub          s10, t3, ra
                  fsgnj.s      fs9, fs6, ft0
                  sub          s9, s3, s8
                  auipc        a7, 265259
                  sll          s6, tp, gp
                  slli         t4, t5, 13
                  fcvt.s.w     fs0, s2
                  srl          s0, s10, t0
                  fmv.x.w      sp, fa5
                  or           t5, t2, t2
                  feq.s        s3, ft8, ft7
                  fmax.s       fs3, fs10, fa6
                  fsgnjn.s     fs7, fs4, ft7
                  fmul.s       ft5, ft0, fs6
                  sra          t2, s10, a4
                  fsgnjx.s     fs1, ft9, fs3
                  mul          s10, t5, t3
                  xori         sp, t0, 424
                  andi         s7, s7, -223
                  ori          a2, zero, 17
                  fmin.s       fs8, fs8, ft4
                  ori          s8, s3, 494
                  nop
                  fclass.s     s4, ft1
                  fcvt.s.w     ft9, zero
                  divu         a4, a6, zero
                  sltiu        s9, a3, 850
                  mulhsu       s8, s6, a5
                  sltu         s0, t3, gp
                  fmax.s       ft10, ft6, fs10
                  lui          s10, 643220
                  fclass.s     sp, ft11
                  add          t0, s0, t5
                  sra          s6, gp, s6
                  lui          a3, 113508
                  lui          s10, 60886
                  fclass.s     s3, fs10
                  fmv.w.x      ft2, a5
                  flt.s        a7, ft1, ft6
                  srl          a4, s4, s5
                  mulh         t0, s7, a3
                  fsgnjx.s     ft7, fs8, ft5
                  srai         s11, s11, 9
                  sub          sp, s7, a5
                  xori         ra, a5, 234
                  fcvt.w.s     a4, fa7
                  fsub.s       ft9, ft10, fs2
                  add          a4, t5, t5
                  addi         a2, t6, -657
                  or           t4, s5, s11
                  slti         s5, a7, 1240
                  or           s0, sp, t0
                  auipc        s2, 130150
                  flt.s        zero, fa5, fa6
                  sltu         t0, a4, s9
                  and          t5, s3, s6
                  fmv.x.w      tp, fa0
                  slti         a2, s9, -299
                  fmin.s       ft5, ft11, ft5
                  xor          a2, a2, zero
                  fclass.s     s5, fa1
                  fdiv.s       ft9, fs10, fs9
                  div          s4, s1, a5
                  srai         s0, t4, 7
                  sll          a2, a3, s8
                  fmax.s       fs0, ft6, ft2
                  auipc        ra, 550171
                  fdiv.s       fs1, ft4, ft0, rdn
                  sltu         tp, s7, s1
                  div          sp, t4, t3
                  fmul.s       fa3, fa1, fa2
                  add          s6, t4, s1
                  mulhu        a4, zero, s11
                  fclass.s     a7, ft5
                  or           s8, t1, t4
                  auipc        a4, 775403
                  sltiu        a0, s11, -574
                  lui          a3, 243190
                  fmin.s       fa5, ft3, fs1
                  feq.s        s7, fs10, fa1
                  feq.s        s4, fs0, fa6
                  fadd.s       ft3, fs4, fs8
                  auipc        a7, 227160
                  fmin.s       fs4, fs2, fs6
                  srl          zero, sp, s10
                  slti         s6, s0, -1617
                  div          a6, a2, sp
                  fsgnjn.s     fa4, ft0, ft7
                  feq.s        s2, fs4, ft1
                  add          a0, s10, zero
                  fmax.s       ft2, ft5, fs9
                  fcvt.s.wu    fs3, s1, rmm
                  slli         s9, s2, 18
                  xori         s9, s0, -559
                  sub          s8, t4, a7
                  fcvt.s.w     ft5, s0, rmm
                  mulhsu       s10, s9, s11
                  fsgnj.s      fs0, ft1, ft7
                  feq.s        ra, fa6, fa4
                  mulhu        t2, s5, s7
                  divu         zero, s8, s11
                  feq.s        s1, ft5, fs1
                  remu         s3, t6, t2
                  fsub.s       fs9, fa7, fs2, rne
                  flt.s        a1, fs7, ft8
                  xor          a6, a1, ra
                  fle.s        s1, fs6, fa3
                  fsgnjn.s     fa5, fs1, fs11
                  fsgnjx.s     fa5, ft6, fs1
                  sub          s8, t0, s2
                  auipc        s6, 581319
                  nop
                  slti         s11, sp, 1774
                  fmul.s       fs1, fa1, fa4
                  nop
                  fdiv.s       fa1, fa5, ft9, rmm
                  slli         gp, s4, 9
                  fcvt.s.wu    ft6, a6, rdn
                  sub          s7, t5, a3
                  lui          ra, 177136
                  srai         a2, gp, 11
                  fle.s        s4, ft3, fs7
                  sra          t6, s10, gp
                  mul          a3, t0, s2
                  divu         s0, a5, a0
                  fcvt.s.w     fs11, s8
                  addi         a3, zero, 1430
                  fsgnjx.s     fa1, fs9, fs4
                  fsgnjn.s     fs3, fs2, fa4
                  rem          s1, s9, sp
                  sltiu        t2, t1, 515
                  srli         t0, s11, 16
                  mul          a4, tp, t5
                  fmv.w.x      ft1, s4
                  fmul.s       ft1, fs2, fs8, rmm
                  andi         a2, s6, 1515
                  and          gp, t3, s6
                  lui          s6, 756617
                  xori         a1, t2, -1750
                  add          a0, s10, s2
                  feq.s        s5, ft7, fa2
                  fsgnjn.s     fs9, ft8, fs9
                  srli         s10, tp, 24
                  fcvt.wu.s    a7, fs11
                  slli         zero, ra, 4
                  fcvt.wu.s    t6, fs9, rdn
                  fmul.s       fs2, fa5, fa1, rdn
                  fadd.s       fs10, fs7, fs5, rdn
                  sltiu        ra, t0, -298
                  remu         a0, ra, s0
                  andi         s9, s0, -1752
                  addi         zero, a3, -32
                  fdiv.s       fs0, fa2, fa7, rtz
                  addi         s3, s5, 633
                  fcvt.w.s     sp, fa0
                  ori          s8, s0, 586
                  xor          s11, a7, gp
                  slti         s8, s10, -1970
                  slli         s10, s10, 0
                  fmul.s       fs0, ft9, fs11, rdn
                  and          t4, a1, s6
                  fcvt.s.wu    fs10, a7, rtz
                  sra          s10, s0, t3
                  andi         s9, a7, 1540
                  srli         s6, sp, 28
                  ori          s2, s10, 1226
                  fclass.s     s6, ft0
                  feq.s        zero, ft5, fs11
                  xor          t2, s6, t1
                  mul          t6, tp, a7
                  or           s10, s6, s2
                  fmax.s       fs2, ft3, fa6
                  mul          t5, t4, s5
                  feq.s        s0, fs9, ft5
                  srl          a3, a0, s7
                  fadd.s       fs1, fa5, fs0, rne
                  ori          s7, s7, -1831
                  lui          a4, 577056
                  fmul.s       fs10, fa4, fa7, rmm
                  mulhsu       a0, s1, s4
                  srl          s8, s7, a0
                  lui          t6, 498024
                  fadd.s       ft9, ft3, fa3, rup
                  fmax.s       fa3, ft8, ft8
                  div          a0, a4, a3
                  sltu         t0, sp, a4
                  srli         a2, t1, 14
                  slt          tp, t6, zero
                  auipc        s6, 643817
                  ori          s6, ra, -103
                  rem          s11, s3, t1
                  fsgnjn.s     ft9, fa2, fa2
                  fcvt.wu.s    s2, ft0
                  xor          t2, zero, zero
                  fdiv.s       ft3, fs3, fs2
                  divu         a6, s5, s0
                  lui          s11, 77280
                  flt.s        s3, fa1, ft1
                  fdiv.s       ft5, fs3, ft7, rup
                  andi         s4, zero, 1035
                  slti         zero, ra, -820
                  srai         t5, t4, 5
                  fsgnjx.s     fs0, fs10, fa3
                  slt          t6, ra, t2
                  fcvt.s.w     ft10, t3, rne
                  rem          a4, s6, s6
                  div          s7, t2, s4
                  fcvt.s.wu    ft0, s6
                  fmv.w.x      fa3, a6
                  divu         s4, t4, zero
                  fsqrt.s      ft11, ft8, rup
                  srli         t4, s3, 15
                  flt.s        gp, ft0, ft2
                  fmax.s       ft0, fa7, ft3
                  sll          zero, zero, a5
                  fmv.w.x      ft7, s8
                  sltu         s4, sp, a6
                  and          ra, s6, a5
                  sra          t2, sp, a7
                  feq.s        a1, fa2, ft8
                  remu         a0, s1, s7
                  fcvt.w.s     a3, fa6, rne
                  sub          s11, a6, s1
                  rem          t2, ra, t5
                  fcvt.w.s     zero, fs4
                  nop
                  lui          s10, 922613
                  nop
                  fsgnj.s      fs10, fa5, fs7
                  rem          s4, ra, a6
                  xori         s10, s7, -671
                  fmax.s       fs11, fa4, ft0
                  nop
                  feq.s        t4, ft8, ft1
                  srai         s0, t3, 5
                  mulhu        s6, s5, a2
                  srli         s2, zero, 4
                  fmv.x.w      a7, ft3
                  fclass.s     s6, ft10
                  andi         ra, s2, 706
                  sltiu        a0, s4, -1499
                  fmv.x.w      s9, fs5
                  feq.s        s11, fa3, ft6
                  fmv.w.x      fs1, s6
                  fcvt.s.w     ft3, t3
                  addi         s2, gp, -1969
                  fcvt.w.s     s3, fs3, rtz
                  flt.s        a6, fa7, fa5
                  lui          t0, 620456
                  mulh         t4, a3, s5
                  xori         a2, s2, -1335
                  fcvt.wu.s    s5, fs4, rup
                  divu         gp, s5, s4
                  divu         s0, a1, t5
                  fcvt.s.wu    fs1, s2, rdn
                  divu         s4, s10, t4
                  srai         s11, ra, 0
                  fcvt.s.wu    fs1, a2
                  divu         t6, s8, s4
                  fcvt.s.w     ft5, s11, rmm
                  fcvt.w.s     s8, fs6, rup
                  fmv.x.w      s6, ft7
                  fmax.s       ft0, fs11, ft10
                  xori         a0, a3, -1969
                  or           s5, gp, s9
                  fmv.w.x      fs8, t6
                  fclass.s     t6, fa2
                  fmul.s       fs4, fs4, ft1, rmm
                  fmax.s       fa7, fs7, ft9
                  fsub.s       ft10, ft3, ft11
                  fmv.x.w      t0, fs5
                  or           a0, gp, t0
                  sub          a6, a7, s6
                  mulhsu       t2, a6, a3
                  fcvt.w.s     s3, fs8, rne
                  add          s4, t2, s5
                  fsgnjn.s     ft11, ft4, ft8
                  or           ra, a2, s0
                  fcvt.wu.s    s11, ft1
                  div          a1, a2, s6
                  divu         s8, a7, sp
                  xor          a4, s9, s10
                  addi         a6, t4, -476
                  sltiu        s5, zero, -568
                  fmul.s       ft9, fs2, fa4
                  xori         s2, a7, -437
                  div          sp, a2, t0
                  xori         a1, a0, -290
                  fmv.x.w      zero, fa0
                  srai         t2, a0, 25
                  slli         a4, t4, 1
                  addi         s4, a7, 542
                  fsgnjn.s     fa3, ft7, fs8
                  fmax.s       ft9, fs0, fa2
                  slti         s8, ra, -1208
                  srl          a6, a6, ra
                  feq.s        t0, fs7, ft11
                  lui          t4, 688174
                  fsub.s       fs4, ft7, fs1
                  fcvt.s.w     fa0, s2, rmm
                  fmul.s       fa6, fs7, fs5, rtz
                  fmul.s       fa7, fa1, ft4, rtz
                  slt          zero, t0, s6
                  fcvt.wu.s    s7, ft1, rup
                  sub          s10, s2, s6
                  fclass.s     zero, ft3
                  mulhu        a6, t5, s6
                  sub          sp, s2, t2
                  fmv.x.w      s10, fa4
                  fcvt.w.s     s8, fs0, rdn
                  sub          s11, a1, s3
                  sub          a2, s10, s8
                  fmv.w.x      fs8, s5
                  srl          t0, gp, s0
                  fcvt.w.s     s7, fs6, rmm
                  fsqrt.s      fa0, fs8, rdn
                  fsgnjn.s     fs1, fa2, ft10
                  andi         a1, t5, 881
                  rem          a6, s1, a4
                  fmin.s       fa0, fa3, fs8
                  sub          a3, a4, s7
                  sub          t4, t2, s5
                  fsqrt.s      fs9, fs5, rdn
                  or           s3, t1, tp
                  mulhu        s7, s2, tp
                  auipc        s10, 783717
                  fmax.s       fs8, fs3, ft9
                  fsgnj.s      ft4, ft11, fs1
                  sub          s1, a3, s9
                  fclass.s     a2, fa3
                  sltu         a0, gp, s1
                  fle.s        zero, fs2, ft7
                  fadd.s       ft11, fa1, fs11, rdn
                  fsgnjn.s     ft5, fs1, ft1
                  fcvt.w.s     s3, fa0, rup
                  mulhsu       a7, a5, s1
                  remu         a3, a3, t2
                  fsub.s       fs2, fs3, fs5
                  fsgnjn.s     ft8, ft6, fs4
                  slt          s3, t5, s6
                  sll          t5, sp, s5
                  srl          s8, s6, t5
                  slli         s9, sp, 27
                  srli         s8, ra, 6
                  fdiv.s       fs8, fs2, ft11
                  fmul.s       fa5, ft8, ft10
                  fmv.x.w      s5, fs6
                  sltiu        t0, a5, 862
                  or           a1, zero, t2
                  sll          a1, t5, s10
                  flt.s        s6, fs7, ft7
                  nop
                  fcvt.s.wu    fa6, a2
                  fmul.s       ft1, ft3, fa1, rne
                  fcvt.w.s     s4, ft2, rne
                  fmv.w.x      fs6, a0
                  xor          t4, tp, s9
                  xori         s10, sp, 1672
                  fmin.s       fa7, ft10, ft7
                  srai         s3, t5, 2
                  fsqrt.s      fs2, ft3, rne
                  slti         a2, a5, 424
                  slt          ra, zero, sp
                  rem          tp, a7, a7
                  fcvt.w.s     a0, fa7, rup
                  or           t0, a2, sp
                  srl          zero, t2, t2
                  div          t6, t3, s9
                  add          s1, s4, zero
                  sub          s3, sp, sp
                  xori         gp, s10, -1413
                  add          t0, zero, ra
                  sll          a0, a4, a5
                  ori          a0, s10, -1654
                  fcvt.wu.s    s11, fs2
                  sub          zero, sp, s3
                  ori          t2, zero, 1627
                  fsqrt.s      fs1, fa6
                  sltu         t5, a3, s9
                  addi         t4, ra, -1389
                  fsub.s       ft5, fs11, fs6
                  mulh         t4, t5, a5
                  ori          a6, t4, 944
                  sub          a4, a3, zero
                  srl          a2, s5, a7
                  divu         a7, sp, gp
                  mul          s2, s11, s6
                  fmax.s       fa6, fa6, fs8
                  fmv.w.x      fs5, a6
                  xori         s2, t1, -763
                  fmin.s       fs7, ft6, fs11
                  mul          zero, ra, s7
                  sll          s8, a4, t5
                  sra          a7, s11, t5
                  rem          a4, a4, s2
                  fmv.w.x      fs4, gp
                  fsqrt.s      fs6, ft4
                  srl          s6, a2, a2
                  lui          gp, 356508
                  mulhsu       s10, s11, a5
                  fmv.w.x      fs8, a2
                  srai         sp, t2, 6
                  slt          gp, s11, t4
                  fle.s        s7, ft0, ft7
                  addi         s1, a3, 1229
                  xori         a3, a6, 1088
                  fcvt.s.w     fs2, a2, rtz
                  rem          t2, t2, sp
                  fmv.x.w      a4, ft0
                  sltiu        gp, s9, -320
                  slli         t6, s7, 6
                  fsgnjn.s     fs6, ft11, ft10
                  slti         s2, t0, 1018
                  lui          s5, 894290
                  add          s11, ra, s8
                  fsgnjx.s     ft8, ft7, fa5
                  fcvt.s.wu    fs5, a1
                  or           a3, s6, sp
                  fcvt.wu.s    s11, fa1, rtz
                  mulh         s4, tp, t6
                  remu         a0, ra, s9
                  mulhsu       s0, zero, s10
                  sltiu        s1, t2, -470
                  flt.s        t5, ft11, fa0
                  fsqrt.s      fa3, fs3, rdn
                  srli         s6, s10, 11
                  fmul.s       fs1, ft9, ft10, rup
                  fadd.s       ft4, ft11, fs8, rne
                  remu         s3, t3, tp
                  andi         a3, s0, 602
                  and          a2, zero, a6
                  fmin.s       ft0, fs4, fs4
                  feq.s        a0, fs3, fs4
                  sra          a4, s3, t0
                  andi         s3, s9, -611
                  fadd.s       ft4, fs11, ft10, rne
                  lui          s11, 940203
                  fclass.s     s4, ft9
                  fmv.w.x      fs11, t3
                  addi         s9, t0, 371
                  fcvt.wu.s    t5, fs9, rdn
                  divu         a6, s6, sp
                  fdiv.s       fa5, fs10, fa3, rmm
                  xor          a3, a3, s5
                  fsqrt.s      fs4, ft4, rup
                  fcvt.wu.s    s0, ft8, rup
                  or           a1, a3, s9
                  fmv.x.w      a6, fa5
                  fsqrt.s      ft6, fa1, rne
                  fmv.w.x      fs6, s7
                  fadd.s       fa5, ft9, fs10
                  fmin.s       fs10, fa6, fa6
                  mulhsu       s10, s7, t1
                  fmv.w.x      ft1, a2
                  xor          s8, s4, a3
                  fadd.s       ft3, ft11, ft7, rmm
                  xor          s8, a7, a4
                  divu         a1, s11, a0
                  xor          t6, gp, s5
                  mul          s1, s6, t5
                  sltu         s11, s7, a0
                  feq.s        s1, ft8, ft6
                  ori          s10, a2, 967
                  fmv.x.w      s6, ft0
                  srl          s11, sp, a2
                  andi         t2, s1, 1722
                  nop
                  mulhsu       gp, s5, t0
                  fcvt.s.wu    ft7, s3, rmm
                  feq.s        s7, fa0, fs10
                  sll          t0, s2, s8
                  fcvt.s.w     fs5, s4
                  fmv.w.x      fs11, a1
                  sltu         zero, sp, s0
                  addi         t4, s10, -109
                  flt.s        s10, fa3, fs6
                  sll          a7, t1, s5
                  divu         s3, s6, a1
                  fmul.s       fa5, ft11, fs1, rmm
                  fcvt.s.wu    fs5, s2, rup
                  slti         sp, a6, -868
                  slti         s7, t1, 1735
                  ori          gp, s8, -1145
                  fcvt.w.s     s9, ft7, rmm
                  flt.s        a0, ft8, fs1
                  slli         s10, s11, 26
                  divu         s6, a5, a2
                  fmax.s       fa6, fs6, fa6
                  slt          s8, a6, t0
                  slti         t0, s7, -197
                  divu         s8, s0, s11
                  feq.s        a4, fa2, fa2
                  sltu         t2, sp, s2
                  srli         s1, sp, 11
                  fle.s        ra, ft11, fs10
                  fclass.s     a2, ft3
                  fmv.w.x      fs7, s1
                  xor          s11, a1, a7
                  fclass.s     s0, ft4
                  srl          tp, s1, s4
                  fmv.w.x      ft10, t2
                  ori          s11, t3, -1454
                  xori         s9, t6, -1704
                  flt.s        t6, fa1, ft11
                  divu         zero, a7, s3
                  lui          s1, 62147
                  fadd.s       fa2, fs4, ft4
                  auipc        a6, 415445
                  fmin.s       fs9, ft1, ft8
                  mulhu        sp, zero, tp
                  xori         t6, a1, -534
                  fcvt.s.w     fa7, s5, rmm
                  xor          t5, tp, s10
                  add          a2, s2, t6
                  fcvt.s.wu    fa3, a5
                  xori         s11, s8, 661
                  fcvt.wu.s    gp, fa6
                  remu         tp, s8, a1
                  add          s1, gp, s9
                  or           zero, s10, a4
                  fsgnjx.s     ft9, fa0, ft5
                  ori          sp, t3, 901
                  srai         t2, s9, 31
                  sltiu        a7, a7, -713
                  feq.s        s2, ft4, fs6
                  or           s1, s7, a4
                  fsqrt.s      fs10, ft5, rtz
                  xor          a2, a3, t0
                  mul          ra, t6, tp
                  fcvt.w.s     a7, fs8, rmm
                  sltiu        a0, s11, -1205
                  srai         a0, ra, 7
                  fadd.s       ft0, fs7, fs0
                  fdiv.s       fa4, fa5, ft6, rup
                  srai         a2, a5, 13
                  srli         s5, a2, 10
                  fsgnjn.s     ft2, fs1, fs9
                  fsqrt.s      fs7, ft10, rup
                  or           a0, a5, t0
                  fsqrt.s      fs0, fs0, rup
                  fmax.s       fs7, fs10, fs11
                  fdiv.s       fs9, fa2, fs7, rne
                  fcvt.s.wu    fs7, s0, rne
                  and          s7, s0, tp
                  xori         a2, a3, 1500
                  mulhsu       s7, a6, t4
                  nop
                  mulh         t2, s10, s9
                  fmin.s       ft4, fs4, fs10
                  nop
                  fdiv.s       fs2, fa6, fs9
                  divu         a1, a2, t2
                  xori         s3, tp, 416
                  add          gp, s1, a7
                  fcvt.wu.s    t4, ft5, rdn
                  fsgnjn.s     ft2, fs8, ft3
                  fmv.w.x      ft5, a0
                  divu         a1, s2, t5
                  mul          s7, tp, zero
                  fsqrt.s      ft0, ft8
                  and          a2, a6, s1
                  mul          s0, s6, s9
                  flt.s        a1, fa5, fa7
                  srai         s6, s7, 4
                  add          s8, a5, t4
                  fle.s        s7, fa3, ft6
                  slt          a6, s8, a4
                  mul          gp, s8, a6
                  fcvt.s.wu    fs1, s1, rup
                  mulhsu       ra, a3, t1
                  mulh         s9, s11, s8
                  slli         s0, s11, 24
                  fsub.s       fa5, fs7, ft9, rmm
                  fmin.s       fs1, fs2, fs3
                  nop
                  fmin.s       ft7, fs7, fs1
                  add          s10, s4, a6
                  and          a3, a1, a0
                  sltiu        s8, s9, 556
                  auipc        s6, 718597
                  and          t6, a7, t3
                  slt          s9, a3, s1
                  div          t0, t6, zero
                  fcvt.s.wu    ft8, gp
                  fsgnjn.s     fs0, fa5, ft3
                  fle.s        a3, ft2, fs3
                  mul          s11, a6, s2
                  mulhu        a1, a1, t1
                  and          a2, a3, a0
                  srai         a3, s7, 3
                  fcvt.s.wu    fs5, s10, rmm
                  sra          s0, gp, a6
                  mulhsu       a4, t4, t6
                  fcvt.s.wu    fa7, s5
                  fmv.w.x      fs2, s4
                  sltiu        s8, s4, 458
                  fsgnj.s      fs6, ft6, fs3
                  sll          a3, s4, gp
                  fadd.s       ft10, fs7, ft6, rtz
                  sltiu        a0, s8, -367
                  xori         a6, s5, 1940
                  fcvt.s.w     ft0, t2, rtz
                  add          s2, t4, t5
                  fclass.s     a6, fs6
                  rem          s5, s4, t6
                  xori         a4, a1, 1346
                  and          sp, t6, t5
                  fdiv.s       fa7, ft3, ft2, rtz
                  mulhu        a2, a3, t6
                  mulh         a3, a2, t2
                  sra          a2, tp, t2
                  remu         s1, s3, s10
                  xor          s6, s9, s0
                  add          s5, a4, a5
                  xori         a3, s9, -157
                  fcvt.s.wu    fa2, a0, rne
                  fdiv.s       ft0, ft3, fa7, rmm
                  div          t4, s5, s4
                  sltu         t5, s9, zero
                  slt          s2, t4, s3
                  flt.s        s2, fs8, fs5
                  slti         tp, t0, -777
                  or           a6, a7, t3
                  srl          t0, s7, s9
                  div          t2, t0, tp
                  addi         s4, t1, -1906
                  fadd.s       ft10, fa0, fs5, rne
                  srli         s3, t4, 5
                  sltu         s11, ra, t4
                  flt.s        s6, fa7, fa4
                  fsqrt.s      fs2, ft11
                  xor          a0, s5, gp
                  lui          s6, 169687
                  fsgnj.s      ft9, fs1, fs1
                  fsgnjn.s     fa0, ft11, ft5
                  fle.s        a4, fa1, fs1
                  sra          zero, t2, a0
                  and          zero, t1, s0
                  div          a7, t6, s2
                  sll          s6, s8, t2
                  fmul.s       ft4, ft4, ft1, rdn
                  fmv.x.w      gp, ft1
                  fdiv.s       fa1, fs4, fa6, rne
                  nop
                  nop
                  slli         a0, s4, 29
                  mulhu        t0, s5, a1
                  fle.s        tp, ft1, ft2
                  ori          s2, a1, 207
                  mulhsu       s10, t1, s11
                  add          s3, s11, a3
                  slti         sp, zero, -1611
                  nop
                  flt.s        a4, fs7, fs1
                  slt          s1, s1, t0
                  fmv.w.x      fa7, a4
                  xor          ra, t0, a5
                  fsgnj.s      fs4, ft8, fa4
                  fmv.w.x      ft4, a4
                  fsgnjn.s     fs5, ft9, ft9
                  lui          s9, 20077
                  auipc        a4, 248399
                  auipc        s0, 573497
                  sra          t6, s4, s10
                  fsgnjx.s     ft4, fs4, fs7
                  mulh         t4, a2, s3
                  div          a0, s1, a2
                  fclass.s     s8, fa1
                  srli         s4, t5, 6
                  fsgnjx.s     fs6, ft1, ft10
                  mulhu        t0, s5, ra
                  mulhu        a2, a0, t1
                  addi         a2, s5, -965
                  sltu         s3, a1, t2
                  fsgnjn.s     ft9, ft1, ft2
                  ori          s5, zero, 538
                  mulh         s3, s1, s5
                  fle.s        t2, ft1, ft5
                  fcvt.s.wu    fa3, s3, rtz
                  fcvt.s.wu    fs3, gp, rdn
                  slli         t0, s7, 30
                  remu         a7, s4, s7
                  add          a7, t0, a1
                  sub          s4, a7, a3
                  sra          s6, a3, a7
                  fcvt.s.w     fs6, tp, rne
                  fcvt.w.s     a1, fs11
                  fmax.s       fs0, fa6, fa2
                  auipc        a6, 517379
                  srli         s0, t2, 31
                  mulhu        tp, s2, s1
                  fsqrt.s      fa1, fs5, rne
                  fclass.s     t2, fa3
                  fadd.s       ft7, fa0, ft10, rmm
                  srai         s6, t5, 6
                  ori          a6, s3, -1956
                  srai         s10, t2, 13
                  xor          tp, t6, zero
                  or           a6, a0, a7
                  fcvt.s.w     ft3, a5, rdn
                  mulh         s6, s1, s0
                  fmax.s       ft10, ft0, fs11
                  nop
                  mulhu        s8, s9, tp
                  fle.s        t2, fa2, fs7
                  xor          ra, t5, zero
                  div          s1, s11, s10
                  fadd.s       fa7, ft7, fa2
                  fcvt.wu.s    s3, fa6
                  sra          s11, t3, t6
                  remu         s4, s8, s4
                  fcvt.wu.s    t4, fs0, rmm
                  fdiv.s       ft11, fs8, fa3
                  rem          t2, s4, a7
                  mulh         a4, t5, t5
                  mulhu        s1, s4, tp
                  nop
                  slti         s8, t3, -1584
                  sltiu        a1, s1, -1890
                  sra          a7, s3, s3
                  slti         a1, s3, 803
                  slt          s9, s4, s10
                  fmul.s       fs1, fs11, fs3, rdn
                  slt          a3, s5, s2
                  fmv.w.x      fs11, s6
                  mulhsu       t4, a2, s1
                  fsgnjx.s     fs8, ft2, ft9
                  and          s10, t2, a0
                  srli         s11, tp, 9
                  fcvt.s.w     ft10, tp
                  or           a3, s8, zero
                  divu         t0, s2, t2
                  srl          tp, a2, s1
                  fcvt.s.wu    fs1, tp
                  mulhsu       s3, a3, s4
                  div          s4, s2, t6
                  feq.s        s8, fa4, ft9
                  fle.s        a0, ft10, ft11
                  auipc        s4, 862403
                  fmax.s       fs2, fa4, ft6
                  xor          s0, a5, a4
                  mul          s1, sp, s1
                  srli         t4, gp, 9
                  add          t6, gp, a2
                  fsgnjn.s     fa4, fs4, fs4
                  fmv.x.w      a4, fa4
                  fmv.w.x      ft11, sp
                  fmax.s       ft3, fs5, fs8
                  feq.s        t5, fs1, fs10
                  fcvt.s.wu    fa0, s3, rtz
                  fsgnjn.s     ft11, ft6, fs1
                  flt.s        a0, fs4, ft6
                  divu         s2, s4, s3
                  fmax.s       fs10, fs11, fa7
                  fcvt.s.w     fs2, a7, rmm
                  ori          a4, zero, -1544
                  fmv.x.w      t6, ft4
                  ori          zero, t4, -1787
                  srai         t4, s5, 22
                  flt.s        ra, fs10, fa3
                  fmax.s       fa2, fa5, ft3
                  flt.s        s6, fa3, fa7
                  fcvt.s.w     fs5, s8, rmm
                  divu         s7, s4, a5
                  and          a1, a7, t3
                  fadd.s       fa0, ft3, fs7
                  addi         t2, gp, -420
                  fcvt.s.wu    ft6, s10, rne
                  auipc        s1, 856190
                  srl          ra, sp, t1
                  lui          tp, 740436
                  fcvt.s.w     ft6, t0
                  auipc        s5, 520740
                  mulhsu       t6, s1, t1
                  fsgnj.s      fa1, ft1, ft11
                  ori          t6, a0, -1351
                  and          sp, t1, a1
                  fcvt.s.wu    fs4, s10, rdn
                  addi         a2, s2, 1014
                  mul          a3, gp, t4
                  fsgnjn.s     fs4, fa0, fs7
                  slli         s1, s0, 10
                  slt          a0, s2, t4
                  slli         a4, a6, 8
                  srai         s7, s4, 24
                  fcvt.s.w     ft3, zero
                  srli         a4, s7, 30
                  ori          s11, s4, -103
                  fsqrt.s      fs10, ft11
                  sub          s0, t0, t6
                  addi         s10, s11, 692
                  rem          a2, s4, t1
                  srl          a1, a0, a7
                  mulh         a6, s5, s7
                  fmin.s       fa4, ft3, fs5
                  sltu         s7, s3, t5
                  sub          s11, ra, tp
                  and          t2, t2, t3
                  fcvt.w.s     t0, ft9
                  mulhsu       t6, a3, t4
                  mulhsu       s11, t0, s0
                  mulhu        s6, a0, a1
                  fsgnjn.s     ft1, fa1, ft7
                  fle.s        tp, fa5, ft9
                  sra          s9, t3, s7
                  fmax.s       ft9, fa1, fs6
                  fmin.s       ft9, fs0, fs9
                  nop
                  sll          ra, a7, a6
                  sltu         a6, t0, a1
                  fsqrt.s      ft10, fs5
                  fsgnjx.s     fa4, fs1, fa1
                  fcvt.wu.s    s10, ft10
                  fmv.w.x      fs11, s9
                  auipc        ra, 691301
                  rem          s4, s2, s8
                  fsgnj.s      ft0, fs6, fa5
                  mulhsu       zero, s7, s7
                  sltu         a4, zero, s7
                  remu         a3, t0, t3
                  addi         a7, t4, -1694
                  addi         sp, a5, 925
                  xori         a6, zero, -754
                  auipc        s10, 577695
                  fsqrt.s      ft2, fa6
                  auipc        a4, 593221
                  sltiu        a0, a0, -949
                  addi         zero, gp, 629
                  mul          zero, t3, a5
                  fmv.x.w      t2, fs8
                  srl          s4, a1, t0
                  nop
                  or           s8, t2, t0
                  fmul.s       fs7, fs0, fs2
                  or           a3, t3, s2
                  fsgnjn.s     ft9, fs10, fs9
                  fadd.s       fa4, ft2, fa5, rup
                  sltu         s2, t4, a6
                  rem          t0, t3, s2
                  srli         t2, zero, 11
                  fsub.s       fs5, ft0, ft10, rne
                  fmv.x.w      s11, ft11
                  andi         a6, t4, -1767
                  fle.s        a2, ft11, ft3
                  slti         s7, s6, -1403
                  divu         s1, s7, s4
                  sltiu        s10, t4, 1595
                  slt          t5, t2, t4
                  slt          a0, s8, s10
                  sll          s9, t1, zero
                  sll          t5, gp, s6
                  fcvt.s.wu    fa2, a1, rtz
                  fcvt.s.wu    ft11, s11, rmm
                  nop
                  srai         s2, s11, 27
                  srl          t0, s11, s5
                  fclass.s     t2, ft9
                  and          a0, s8, t1
                  mulhu        a2, s3, t1
                  mulhsu       a2, a0, s0
                  remu         s8, gp, s8
                  addi         t2, a5, -1785
                  fcvt.s.wu    fa7, s2, rmm
                  mulhu        s5, s3, a5
                  ori          a2, a4, 136
                  fcvt.wu.s    ra, fa2, rmm
                  fsgnj.s      ft3, ft1, fa6
                  srl          t2, a1, t0
                  fsgnjx.s     ft2, ft6, fs0
                  sub          s8, a5, a6
                  fsqrt.s      ft2, fs3, rne
                  or           t6, a4, s2
                  xor          a6, sp, tp
                  fmul.s       ft1, ft6, ft4, rdn
                  andi         a7, a4, -684
                  srl          a0, a1, sp
                  slti         a1, t6, -144
                  andi         a1, s6, 713
                  slt          s6, a7, t6
                  nop
                  fmax.s       fs4, ft10, ft8
                  sltu         s7, sp, s4
                  fadd.s       ft4, fs6, fs2, rmm
                  ori          a2, ra, 1371
                  fcvt.w.s     a7, fs4, rmm
                  ori          s8, s5, -1768
                  or           s6, s6, s6
                  divu         s6, a4, a5
                  fcvt.wu.s    a0, fs0
                  slt          s9, s3, a1
                  fcvt.w.s     sp, fs4, rne
                  fcvt.s.wu    fa1, s10
                  fmv.w.x      ft6, gp
                  mulhu        s2, s4, a0
                  mulhsu       a0, a2, s3
                  flt.s        t6, fa1, fa3
                  divu         s6, a4, s7
                  xor          t0, t0, s10
                  srli         t4, s2, 15
                  fcvt.s.w     fa7, a7, rtz
                  fcvt.w.s     s5, fa2
                  sll          t6, a6, a1
                  fsub.s       fs8, fs2, ft7, rdn
                  fcvt.s.w     fa3, sp
                  mulh         s6, a1, t4
                  fsub.s       fs3, fa3, fa7
                  flt.s        t0, ft10, fs3
                  fsub.s       fa4, fa7, fa3, rmm
                  sll          s8, a4, tp
                  mulhu        t2, gp, s0
                  fmul.s       ft0, fs5, ft6, rne
                  slti         s7, sp, -1311
                  sra          s7, gp, t2
                  srl          s7, s5, s5
                  slt          sp, a5, t3
                  and          s4, t0, s9
                  slt          a6, s9, s11
                  fsgnjn.s     ft5, fa7, fs5
                  andi         gp, s9, -833
                  mulh         a3, t1, a3
                  fclass.s     sp, fa5
                  slli         s11, s7, 4
                  fmv.w.x      fa7, ra
                  srl          a2, t6, a7
                  mulhsu       t2, s8, t3
                  sltu         a6, t2, a3
                  fmax.s       ft2, fs10, ft8
                  and          s10, a3, sp
                  feq.s        s3, fs1, fs10
                  srl          t5, s5, gp
                  sll          s5, s8, s10
                  fsgnj.s      fs2, ft9, fa1
                  slti         s1, t4, -155
                  slli         a3, s10, 22
                  ori          s0, s8, 501
                  fdiv.s       fs7, ft6, fa2, rdn
                  fsub.s       fa5, ft5, fs10, rdn
                  addi         zero, a1, 1933
                  xori         s2, s1, -1007
                  fsgnjn.s     ft4, fs7, ft4
                  sltu         s7, a5, s5
                  srl          gp, zero, t1
                  fmv.w.x      fa1, tp
                  fmax.s       fa5, ft9, ft4
                  fsgnjn.s     fa1, fs5, ft11
                  divu         s7, s11, s0
                  mulhsu       a2, a1, t4
                  srl          s9, s9, a6
                  sra          t5, a6, s5
                  srli         a2, a6, 22
                  srli         s6, zero, 30
                  fcvt.wu.s    zero, fs4
                  slt          gp, s4, a3
                  andi         s8, zero, -1970
                  fadd.s       fs7, ft3, fs9
                  xori         a7, s11, -1648
                  slti         a2, t1, -647
                  srli         tp, s0, 12
                  fsgnjx.s     fs2, fs0, fa0
                  divu         t5, s0, ra
                  fmin.s       ft9, fa3, fa2
                  fmax.s       ft3, fa2, fs6
                  fle.s        t6, fs1, fs4
                  fsqrt.s      ft5, fa4
                  fcvt.s.wu    fa1, a6, rdn
                  fcvt.s.wu    fa5, s7, rne
                  srli         t2, s4, 5
                  auipc        s0, 524889
                  srli         s0, s0, 13
                  fdiv.s       fs9, fs5, fa3, rup
                  fle.s        s7, fs10, ft10
                  divu         s7, s6, s1
                  fdiv.s       fa5, ft8, ft5, rne
                  srli         t5, s6, 27
                  fadd.s       fa3, fs1, fa1
                  remu         s9, tp, s9
                  sub          t2, tp, s9
                  fdiv.s       ft9, fs9, fa2
                  srai         s4, t1, 31
                  and          s8, a2, a7
                  fmin.s       fa7, ft5, fs4
                  fmax.s       fs2, fa2, fa4
                  sub          s2, sp, s1
                  srai         s2, ra, 24
                  srai         a4, ra, 24
                  ori          s9, t6, 1870
                  and          t5, a6, s6
                  sll          s5, s10, t6
                  div          s7, a6, s8
                  mulhsu       a2, s6, a4
                  slti         s9, a3, 1304
                  flt.s        a4, fa6, ft2
                  rem          s10, s6, s0
                  fclass.s     s1, fs11
                  fmax.s       fs2, fs11, fa4
                  fadd.s       fs1, fs3, ft1
                  slli         t4, s4, 7
                  fcvt.w.s     a1, fs4
                  xori         a4, zero, 1215
                  fmax.s       ft2, ft2, fs8
                  fsgnjx.s     ft2, fa7, fa5
                  fcvt.w.s     ra, fa0, rdn
                  divu         s6, s4, sp
                  mulhu        a1, a4, t3
                  lui          ra, 511718
                  fmul.s       fs3, fs4, fs7, rne
                  fsgnjn.s     fa1, fa6, ft6
                  fsgnjn.s     fs6, ft3, ft7
                  div          a0, a3, s8
                  nop
                  slti         s6, a2, -504
                  fcvt.s.wu    fa5, a0
                  divu         ra, a6, s0
                  fclass.s     a7, ft5
                  srl          s11, zero, t0
                  div          s6, s9, s11
                  fcvt.s.wu    ft0, tp
                  fmv.x.w      s11, fs4
                  sltiu        t5, a1, -1759
                  andi         t2, t3, 1563
                  fclass.s     a0, ft4
                  addi         s1, zero, 962
                  andi         s8, a0, 735
                  rem          sp, gp, s4
                  feq.s        t2, ft1, ft2
                  mulhsu       a7, t0, a4
                  fmv.w.x      ft8, t4
                  remu         s7, a0, a0
                  rem          s4, s6, s3
                  ori          sp, a2, 1149
                  fle.s        tp, fs5, fs3
                  fmax.s       fs7, ft6, fs7
                  fsqrt.s      fa4, fs5
                  divu         s2, s10, zero
                  mulh         sp, t1, s0
                  andi         a1, s5, 1440
                  fsgnj.s      fa3, ft7, fs9
                  fmv.w.x      fs6, s9
                  fclass.s     s5, fs10
                  fmv.x.w      tp, fa3
                  sub          s3, s6, t4
                  fmv.x.w      s2, ft4
                  slli         a3, t3, 24
                  fadd.s       fs8, fa1, fs8, rtz
                  auipc        tp, 619307
                  srai         s3, t1, 27
                  xor          a1, s1, s6
                  mul          t6, a5, t1
                  fle.s        gp, fs10, ft4
                  sltu         s1, t6, s4
                  fclass.s     s11, fs7
                  srli         s10, s9, 1
                  fmin.s       fs10, fa4, ft11
                  ori          s10, a0, -639
                  mulhu        s1, t3, s0
                  srli         sp, a2, 31
                  sll          s2, a4, tp
                  fcvt.s.w     fs5, s9, rne
                  divu         s4, t4, s9
                  srl          s7, zero, s11
                  sra          s10, s11, t0
                  fcvt.w.s     a4, ft1
                  flt.s        ra, fs6, ft8
                  feq.s        s11, ft4, ft11
                  sltiu        gp, a4, -997
                  fadd.s       fa5, fa6, fa2
                  xor          s1, a5, t0
                  fsgnj.s      ft9, ft3, ft8
                  flt.s        sp, ft7, fs2
                  slli         gp, zero, 22
                  srai         a4, s9, 23
                  fsgnjn.s     ft1, fs3, ft10
                  sltiu        s1, s10, -1905
                  fcvt.s.wu    ft2, s0
                  add          t2, s2, s7
                  div          s2, a7, s7
                  flt.s        a7, ft1, fs3
                  auipc        s4, 46368
                  sltu         t2, s4, s6
                  fcvt.s.wu    fa3, s8, rne
                  srai         t5, a6, 8
                  fsgnj.s      ft2, ft8, fs8
                  xor          s9, a0, s6
                  fsqrt.s      ft2, fs1, rtz
                  div          sp, s3, sp
                  fcvt.s.w     ft9, t1, rtz
                  fcvt.w.s     ra, fs10
                  fcvt.s.w     fa6, zero
                  fsgnjx.s     fa0, ft8, fs6
                  addi         gp, a3, -271
                  or           s4, t1, s0
                  slt          a3, s5, s4
                  fmv.x.w      s5, ft9
                  fsgnjn.s     ft10, fs6, fs5
                  auipc        a2, 152005
                  fmv.w.x      ft1, t0
                  mulhu        s6, a5, a4
                  mul          t0, ra, s7
                  xor          s5, tp, s10
                  sltiu        s3, a5, -1669
                  sll          s5, t3, t3
                  mul          s5, s5, gp
                  fsqrt.s      ft6, ft9
                  sltu         s8, s10, s8
                  addi         s6, t4, -1036
                  fmin.s       fs4, fa3, fs4
                  add          zero, s9, a6
                  andi         s0, s2, -433
                  xori         s7, ra, -719
                  lui          a1, 1044694
                  or           a6, s8, s9
                  srli         t6, zero, 4
                  lui          a2, 31852
                  nop
                  fsqrt.s      ft4, fa7, rdn
                  lui          zero, 185251
                  fsqrt.s      ft2, ft3, rtz
                  fsgnjx.s     fs3, fa5, fa2
                  feq.s        s5, ft8, fs9
                  sltu         s8, t0, s4
                  fle.s        t4, fs10, ft0
                  fcvt.wu.s    s7, fa3, rtz
                  fsgnj.s      fs0, fs6, fs10
                  xori         tp, s2, -870
                  sub          a6, zero, a2
                  fmv.w.x      ft9, s3
                  auipc        a3, 53506
                  add          a6, a4, a4
                  fsgnj.s      fa7, fa6, ft3
                  rem          s7, s9, s6
                  or           s0, sp, s9
                  sll          t2, a2, a6
                  sll          s4, s5, s1
                  fsqrt.s      ft9, fs5, rup
                  remu         gp, t3, sp
                  sltu         a3, a1, t4
                  fmax.s       fa2, ft7, ft10
                  xori         s4, t3, -1101
                  mul          s8, s9, ra
                  and          a4, s8, zero
                  fsub.s       fa7, ft6, ft10
                  andi         s2, s2, -546
                  nop
                  fmv.w.x      fa1, t5
                  flt.s        a7, ft0, fa3
                  fmax.s       fa4, fa5, ft4
                  nop
                  srl          a1, t0, s0
                  fmin.s       fs0, ft8, ft6
                  addi         t5, t1, -511
                  lui          s11, 722244
                  add          t2, s9, s11
                  andi         s3, s3, 1775
                  ori          a1, a6, -891
                  andi         a7, s3, -1789
                  fle.s        s2, fs3, fa3
                  andi         s0, s10, -983
                  remu         s2, s5, s11
                  slt          s5, t5, sp
                  slti         t6, t6, 544
                  add          s1, sp, t3
                  mulhsu       s10, t1, s0
                  srl          s5, a5, a2
                  sra          s11, s4, t0
                  srl          a3, a7, s4
                  or           t6, a2, gp
                  div          ra, t0, a0
                  and          a0, a7, t0
                  fadd.s       fa5, fa1, fa6, rne
                  fmv.x.w      s10, ft1
                  fdiv.s       fa0, fs7, fa1
                  slli         sp, ra, 17
                  sltiu        a6, a6, -382
                  lui          ra, 292451
                  auipc        tp, 408588
                  ori          s9, sp, -1833
                  and          tp, s0, t6
                  add          sp, tp, s7
                  fsub.s       ft11, fa0, ft0, rup
                  sltu         a0, t2, gp
                  fcvt.wu.s    a7, ft5
                  fsqrt.s      fs11, fa4
                  mul          a4, a6, zero
                  fmul.s       ft3, fa0, ft5
                  xor          s8, s7, s8
                  fmin.s       fs9, fs11, fs5
                  divu         s3, t6, t4
                  lui          t5, 677418
                  fclass.s     a6, ft4
                  and          s10, a2, zero
                  srli         a6, t2, 26
                  sltiu        s10, s11, 1821
                  fmul.s       fa5, fs0, fs2
                  fmax.s       fs4, ft9, fs9
                  mulhu        ra, s8, s2
                  slli         tp, s4, 27
                  fmax.s       fs6, ft8, fa5
                  fsgnj.s      fs2, fa1, ft10
                  feq.s        a2, fs7, fa5
                  auipc        s0, 324580
                  fdiv.s       fa1, fa1, fa3
                  mulhu        zero, s9, t4
                  fsgnjn.s     ft10, fs10, fs10
                  fle.s        a7, fa6, fs4
                  divu         s0, s1, a0
                  feq.s        a3, fs6, fa3
                  mul          t4, s1, ra
                  mulh         a4, a4, s4
                  slt          gp, a3, tp
                  fsgnj.s      ft5, fa5, ft8
                  addi         s4, s2, -399
                  add          a2, t5, a0
                  srli         s4, a1, 28
                  andi         s3, s4, 1985
                  fclass.s     t5, fa6
                  and          t4, a6, t3
                  slli         s5, a1, 14
                  fmin.s       ft10, fs10, ft9
                  srl          a3, t4, a3
                  fdiv.s       ft2, ft0, fa0
                  nop
                  fmul.s       fs4, fs9, fs3, rtz
                  fcvt.wu.s    t0, ft10, rup
                  slti         a3, a4, -1713
                  fcvt.wu.s    t6, fs0
                  nop
                  lui          s6, 1036556
                  fdiv.s       ft5, ft3, ft3, rmm
                  fle.s        t0, ft11, ft1
                  srai         tp, s8, 18
                  fcvt.wu.s    s5, fa0, rne
                  mul          a1, a4, s8
                  sltu         tp, tp, s11
                  fcvt.wu.s    sp, fa2
                  srai         t6, s9, 18
                  sltu         s5, t5, s0
                  feq.s        gp, fa7, fs4
                  mulhsu       s0, a0, a5
                  fdiv.s       fa3, ft3, fs2
                  fcvt.s.wu    ft1, a0, rmm
                  addi         zero, sp, 830
                  srli         t0, a7, 1
                  divu         s5, tp, ra
                  nop
                  fcvt.w.s     s6, ft8, rdn
                  mulhu        s9, s2, tp
                  fmv.w.x      fs2, gp
                  andi         s9, a5, -1121
                  lui          s1, 558531
                  fdiv.s       ft2, ft9, fa2
                  fmul.s       ft10, fa2, fs4
                  auipc        s0, 800894
                  sltu         a0, a5, tp
                  sub          s7, t2, zero
                  srai         a6, t3, 20
                  addi         t4, a4, 1594
                  fle.s        t0, fa7, fa6
                  flt.s        ra, fs2, ft10
                  fsgnj.s      ft4, ft3, ft7
                  srli         s8, t4, 27
                  remu         s7, gp, s1
                  mul          a2, s9, s8
                  sltu         s3, s3, t2
                  fsgnjn.s     ft2, fs10, fa0
                  rem          s1, s8, zero
                  addi         s4, s11, 1616
                  mul          a7, s5, s11
                  add          t5, s10, a6
                  fcvt.s.wu    ft9, ra
                  fcvt.s.w     fa2, s5
                  slt          s9, s5, sp
                  fdiv.s       fa3, fs6, fs2
                  srl          s8, a2, s2
                  slli         s2, zero, 22
                  sltu         t0, s1, zero
                  fclass.s     s4, fs6
                  fle.s        gp, fa1, fa7
                  fsgnj.s      fs1, fs11, fs9
                  slt          s11, s3, s7
                  fclass.s     s9, ft5
                  ori          s6, a6, 1412
                  fcvt.wu.s    s4, fs3
                  andi         t0, t4, -646
                  fmv.w.x      fa0, s9
                  fmax.s       fa2, fa6, ft2
                  sub          sp, t3, s11
                  xor          s1, t0, s5
                  fclass.s     a4, ft6
                  fsgnjn.s     fs2, ft2, fa7
                  rem          s10, s10, s1
                  slti         t4, s8, -962
                  srli         sp, a3, 22
                  feq.s        s5, ft0, fs8
                  sltiu        zero, a1, 255
                  addi         ra, a3, -1943
                  srl          s10, t5, t0
                  fadd.s       ft0, ft5, fs11, rne
                  fdiv.s       fa0, fa3, ft9, rtz
                  srl          s9, a4, s6
                  rem          s2, a4, a6
                  fcvt.w.s     ra, ft4
                  fadd.s       fs7, fs11, fa1, rtz
                  fmin.s       ft5, fa6, fa6
                  mulhu        a1, a0, s0
                  andi         s3, a5, -1462
                  fsgnjn.s     fa1, fs3, fs4
                  fcvt.s.wu    ft5, a2
                  slti         s9, a5, 932
                  fcvt.wu.s    gp, ft1, rdn
                  sltiu        s2, sp, 859
                  fsgnjx.s     fa3, fa1, fs1
                  sub          a0, a3, s1
                  sltu         s11, sp, s3
                  sra          gp, a3, s8
                  fsgnjn.s     fs9, fs1, fa0
                  fdiv.s       fs2, fa1, ft11, rdn
                  srl          s8, a1, gp
                  and          s9, s11, s0
                  fsqrt.s      ft4, ft6, rne
                  fmin.s       fs3, fs10, fa4
                  fadd.s       fa1, fa7, fs11
                  feq.s        s9, ft3, fa4
                  srli         t5, s1, 16
                  or           s0, a7, s5
                  fmv.w.x      fs2, sp
                  fcvt.s.wu    ft5, s6
                  mulhsu       s1, ra, s2
                  fcvt.s.wu    fs5, t1, rmm
                  fcvt.wu.s    s8, ft10, rne
                  slli         a2, s9, 26
                  div          a7, a0, s8
                  slti         s4, s1, -1
                  fmv.x.w      s11, fs6
                  feq.s        a1, ft9, ft5
                  slti         ra, s5, 1283
                  fclass.s     s3, fs4
                  fcvt.wu.s    sp, fa2
                  fclass.s     a6, ft5
                  sub          s3, s9, a0
                  fsgnjn.s     ft10, ft8, ft0
                  fadd.s       ft8, ft8, fs3, rmm
                  divu         a1, s10, t1
                  div          t0, s3, t5
                  fclass.s     t6, ft7
                  ori          s2, t0, 1650
                  sltu         s4, a7, zero
                  fsub.s       ft7, ft6, fs10
                  add          s1, a6, s0
                  mulh         t0, tp, t3
                  xori         t6, t6, -1989
                  andi         t0, s5, -242
                  div          t5, t5, a1
                  fcvt.wu.s    s0, fs9, rdn
                  xori         s5, t2, -1100
                  fmv.x.w      a4, fs1
                  fsgnjx.s     ft9, ft4, fa4
                  auipc        s8, 784410
                  mul          s9, gp, a7
                  fle.s        t2, fa6, ft3
                  sltiu        s4, s0, -1935
                  add          t6, zero, s10
                  fcvt.wu.s    s7, fa3, rmm
                  sltu         s11, a2, t4
                  xori         t6, s7, -1118
                  fcvt.s.wu    fs1, a6, rup
                  mul          a7, t3, gp
                  fcvt.s.w     fs0, s3, rup
                  fmv.w.x      fs7, s3
                  srai         s7, t2, 9
                  fmin.s       fs8, ft8, fa6
                  mulhu        sp, t6, t3
                  mulhu        a4, a7, t4
                  fsub.s       fa4, fs9, fs10, rmm
                  andi         ra, s0, -1787
                  srli         s0, s0, 16
                  fcvt.s.wu    fa0, s2
                  nop
                  sltu         s6, t2, a0
                  andi         t2, s6, 140
                  fcvt.w.s     a0, fa4, rup
                  xor          s7, t0, t6
                  auipc        s8, 509214
                  fadd.s       fs7, ft5, ft7, rup
                  feq.s        gp, ft9, fs4
                  auipc        a0, 1040892
                  sra          t5, s0, sp
                  divu         tp, t4, zero
                  fcvt.wu.s    s10, ft9, rup
                  fdiv.s       ft9, fs0, fs6, rmm
                  fmin.s       ft10, ft5, ft11
                  nop
                  remu         s7, a1, a4
                  mul          s1, tp, s6
                  slti         t2, ra, 557
                  fsqrt.s      fa7, ft0
                  add          s0, s1, s1
                  and          t0, sp, t1
                  add          s5, tp, gp
                  fcvt.wu.s    gp, fs1
                  fsub.s       ft11, ft7, fa7
                  slli         a7, t4, 27
                  addi         s2, a3, 753
                  fmv.w.x      fs6, s11
                  fsgnjx.s     fs10, fs6, fs3
                  sll          s5, t3, s7
                  fle.s        t4, ft10, fa7
                  fsub.s       fs9, fs9, ft10
                  fdiv.s       fa7, ft3, fa3, rtz
                  fsgnj.s      ft11, ft4, ft4
                  fadd.s       fs8, fs11, fs7
                  lui          gp, 508991
                  fmv.x.w      s9, ft10
                  fsub.s       ft2, fs8, ft2
                  fcvt.s.w     ft11, a5, rmm
                  add          a0, s9, t2
                  fmv.x.w      s5, fa4
                  fdiv.s       ft6, ft8, ft5, rdn
                  mulhsu       s10, s7, tp
                  or           s10, gp, s6
                  fadd.s       fs10, fa7, fa5, rup
                  fsub.s       fs4, ft7, fs4, rup
                  div          s7, s9, a7
                  rem          s7, s4, s4
                  fmax.s       fa4, ft6, ft2
                  fmv.x.w      s7, fs7
                  mulhsu       a7, zero, t0
                  lui          a6, 14088
                  ori          s1, gp, 888
                  lui          gp, 887270
                  remu         s11, s0, s11
                  mulhsu       ra, t2, s3
                  fmv.x.w      a1, ft4
                  div          s6, s5, a4
                  rem          sp, a2, s2
                  divu         s1, t5, a5
                  sra          s11, tp, t3
                  and          s7, ra, a6
                  fcvt.s.w     ft11, t1, rdn
                  mulh         zero, s8, a6
                  xori         s7, s6, -1207
                  srai         s2, s10, 5
                  fsub.s       ft8, fa7, fs5, rtz
                  sra          s4, t0, s1
                  sltu         zero, s10, s11
                  rem          a4, s10, a0
                  slti         t2, s7, 1306
                  mulhsu       t0, s7, a4
                  sll          gp, tp, s11
                  fcvt.wu.s    s0, fs0, rdn
                  flt.s        s8, ft7, fa2
                  flt.s        t4, fs3, ft7
                  xori         a7, s10, 1486
                  fcvt.s.wu    ft9, t5
                  fcvt.w.s     t5, ft1
                  fdiv.s       ft0, ft6, ft4, rtz
                  fsqrt.s      fs7, fa7, rup
                  sra          a1, s10, t3
                  fdiv.s       ft7, fs3, fs8, rdn
                  slti         s10, t5, 756
                  rem          t2, t1, t1
                  fmin.s       ft2, ft11, ft11
                  or           ra, sp, t5
                  fcvt.s.w     fa3, a7, rdn
                  sub          a2, ra, a6
                  fsgnjx.s     fs2, ft7, ft7
                  and          a3, a7, ra
                  fdiv.s       fs5, fa3, ft5
                  add          s8, s11, t3
                  sltu         a4, s1, t4
                  fcvt.wu.s    t6, fs7
                  fsgnjn.s     fs0, fs6, fa1
                  nop
                  andi         gp, s2, 1521
                  slli         a2, gp, 8
                  mulh         t4, a3, ra
                  andi         a0, t2, 1696
                  fcvt.w.s     ra, fa7, rtz
                  sub          s9, t4, s6
                  auipc        s0, 238255
                  fsgnj.s      ft2, fs1, ft7
                  fdiv.s       fs0, fa6, ft4
                  or           t0, s2, t0
                  fcvt.s.w     fa7, t0
                  srl          t2, t0, s0
                  and          a3, s4, s1
                  fcvt.s.w     fs4, s3, rup
                  sra          zero, a7, s1
                  fsgnj.s      ft10, ft9, fs2
                  mul          a0, t0, s7
                  divu         a3, s8, s6
                  sll          a4, s1, t2
                  fsgnjx.s     ft0, fa0, fs0
                  auipc        zero, 793907
                  rem          gp, a4, s5
                  divu         t6, s6, a5
                  fadd.s       ft11, fs2, ft6
                  addi         s5, a5, 815
                  ori          s10, t0, 157
                  slti         s9, s10, 642
                  nop
                  fcvt.s.wu    fa4, a4, rtz
                  fsgnjx.s     fa1, ft4, ft5
                  xori         a3, s3, -323
                  sltu         a4, a0, s5
                  fsgnj.s      fs3, fs5, ft4
                  srai         t6, a7, 22
                  mulh         ra, s0, ra
                  fclass.s     a6, fs11
                  sra          tp, s7, t6
                  fmv.w.x      ft7, t4
                  feq.s        s9, fa5, ft2
                  sll          s10, s2, a5
                  mul          s4, s8, t6
                  slt          gp, t6, sp
                  fmul.s       fs7, fs9, fa6, rne
                  srl          s11, s10, a3
                  fcvt.wu.s    s1, fs4, rup
                  fmul.s       fs7, ft11, fs0
                  fcvt.s.wu    fs5, a5
                  fcvt.wu.s    sp, fa0, rup
                  sltu         s3, gp, a6
                  add          tp, s0, a5
                  mul          gp, a3, s8
                  xori         t4, s1, -674
                  fclass.s     s0, ft7
                  sub          s8, a1, ra
                  fcvt.s.w     ft8, s8
                  lui          sp, 715375
                  fmul.s       fa0, ft10, ft3, rne
                  div          a2, t0, a6
                  ori          a2, s5, -970
                  andi         zero, tp, 1348
                  fsgnjn.s     ft5, fa2, fs5
                  fsgnjn.s     fa3, fs11, fs2
                  fcvt.w.s     sp, fa7, rmm
                  sltu         zero, a6, sp
                  xor          a3, gp, s9
                  xor          s10, t2, a7
                  divu         s9, s7, t5
                  fmv.w.x      fa3, a1
                  rem          s1, s5, t1
                  fcvt.s.wu    ft5, t4, rmm
                  fadd.s       fa1, fa0, fs11, rne
                  mulhsu       a2, a7, tp
                  fcvt.s.w     fs1, s6
                  fcvt.s.w     ft0, tp
                  fcvt.s.wu    fs1, s11
                  feq.s        s1, fs10, fa7
                  fcvt.w.s     s1, ft2
                  fdiv.s       ft3, fa6, fs8, rne
                  xori         zero, s10, -522
                  and          s0, ra, gp
                  xor          t4, a0, tp
                  fdiv.s       ft5, ft4, fs2
                  lui          sp, 147831
                  fcvt.s.wu    fa6, a7
                  lui          s11, 19060
                  rem          s11, t1, s4
                  div          s5, s11, s10
                  slti         t5, gp, 580
                  fdiv.s       fs7, fs7, ft5, rtz
                  srli         t2, s0, 24
                  fmul.s       ft8, fs1, fs6, rdn
                  div          s9, s1, a5
                  mulhsu       s10, a3, s6
                  fclass.s     t4, fa7
                  slti         a0, sp, 731
                  fsgnjn.s     fa2, fa5, fs4
                  or           a6, s3, a2
                  sub          a2, sp, t2
                  fmax.s       fs2, ft2, fa1
                  mulhsu       sp, s1, t0
                  mulhu        s4, s5, ra
                  fmax.s       fs9, fs2, ft1
                  mulh         s1, a0, a2
                  srl          s10, zero, a7
                  addi         zero, s7, 404
                  flt.s        s10, fs4, fs11
                  fadd.s       fa4, ft9, ft3
                  fmv.w.x      ft6, s0
                  mul          sp, a3, a7
                  mulh         s3, a5, t0
                  fmax.s       fs2, fs6, fa3
                  xori         s9, t5, -1849
                  fsgnjx.s     ft7, fs1, fs2
                  fsgnjx.s     ft8, ft7, fs4
                  or           zero, zero, s1
                  rem          s9, a2, sp
                  sll          s10, s7, gp
                  fmin.s       fa0, ft10, fa5
                  srl          ra, a7, s1
                  fsgnjn.s     ft2, ft2, fa0
                  sltiu        t4, t4, -1195
                  fcvt.s.wu    fs9, t2, rmm
                  fsgnjx.s     ft3, fs7, ft0
                  fdiv.s       ft7, fs10, ft9
                  fmul.s       ft8, fs8, fa3, rne
                  srli         s4, t6, 16
                  ori          gp, a7, -742
                  auipc        a7, 108534
                  flt.s        ra, fs1, fs7
                  srl          s8, a1, s10
                  and          a7, t4, zero
                  fmax.s       ft3, ft11, ft10
                  sra          a6, a3, sp
                  srl          a6, s2, s0
                  sll          t4, tp, s9
                  sltu         ra, t0, tp
                  and          a3, t6, s3
                  sll          sp, s5, ra
                  mul          a6, gp, t0
                  sra          s10, s1, s4
                  sltiu        s3, t6, 1809
                  fsgnjx.s     fs3, fs8, fs2
                  auipc        s1, 157421
                  fdiv.s       fs1, fs1, fs8, rup
                  mul          s10, s7, t5
                  xori         s11, a7, -718
                  srai         s3, t4, 9
                  fclass.s     s3, ft9
                  fle.s        s7, fa2, ft11
                  sltiu        t6, s11, 1304
                  fcvt.w.s     t2, fs11
                  srai         a0, t6, 1
                  sll          tp, s1, s0
                  mulh         t2, s3, t5
                  ori          sp, sp, 1421
                  ori          s8, s5, 1455
                  fsgnjn.s     ft7, fs6, ft6
                  feq.s        s6, ft1, fs5
                  fadd.s       fs2, fa5, ft5
                  fmin.s       ft7, fs9, ft0
                  sltu         a2, t5, t4
                  fmv.x.w      s4, fs10
                  fmax.s       fs6, fs5, fa1
                  slti         s2, tp, -545
                  fmax.s       ft5, fs5, fs1
                  fmax.s       fs3, ft4, ft8
                  fcvt.wu.s    s1, fa4
                  divu         s6, s11, t0
                  fsgnjn.s     fa6, ft2, fs9
                  fadd.s       ft4, ft2, ft8
                  flt.s        a4, ft9, fs7
                  divu         s5, a5, s2
                  divu         zero, s7, s8
                  or           s2, t0, s7
                  xori         t4, a5, 172
                  addi         a3, tp, -2007
                  andi         a7, a5, 438
                  lui          t6, 680291
                  mulhsu       a0, tp, s7
                  fmin.s       ft3, ft11, fa6
                  fcvt.s.w     fa3, s3, rmm
                  add          a6, s10, gp
                  fmv.x.w      a4, ft6
                  lui          a1, 948982
                  fsgnjn.s     fa1, fs9, fs5
                  remu         t2, s2, s1
                  slli         a3, a7, 25
                  and          sp, s0, a3
                  xor          t4, s10, t1
                  addi         tp, sp, -1978
                  andi         t5, s11, -1335
                  nop
                  fsgnj.s      ft0, fs10, fs10
                  fmin.s       ft6, ft6, fa5
                  flt.s        gp, ft7, fa2
                  lui          a1, 1022877
                  or           tp, t4, s3
                  nop
                  fsgnj.s      fa5, ft10, fa7
                  divu         t4, a7, t4
                  sltu         s7, a4, t0
                  fcvt.s.wu    fa4, zero
                  sltiu        s2, s1, -378
                  div          s8, t1, zero
                  mulhsu       a6, s11, s1
                  fdiv.s       ft6, fa5, fs11
                  srli         s0, t2, 31
                  fmin.s       fs0, ft0, fa4
                  sub          a0, a7, t1
                  auipc        a6, 924286
                  nop
                  xor          s5, t2, s3
                  slt          ra, a0, t4
                  mulhu        s5, s10, s2
                  fsub.s       ft8, fs0, fs4
                  fadd.s       fs4, fs7, fa7, rne
                  rem          s3, t3, t5
                  sll          t5, a1, s6
                  sltiu        a3, t6, 1693
                  add          s5, s8, a7
                  fsub.s       fa1, fa3, ft3, rdn
                  slti         gp, t0, 681
                  fcvt.s.w     fs9, a1
                  fsgnjx.s     ft2, fs3, fa6
                  auipc        s8, 234897
                  srl          s6, a2, t2
                  slti         a4, a5, -108
                  div          s8, s2, a2
                  fmin.s       fa4, fa6, fa2
                  mul          s4, a3, a2
                  sra          a1, a3, a5
                  fsgnjn.s     fs10, fs6, ft3
                  addi         t6, s6, -28
                  fsgnjn.s     ft7, fs5, ft10
                  remu         sp, a2, s2
                  srl          t5, sp, ra
                  fclass.s     s1, fs4
                  fmv.w.x      fs2, s8
                  fmv.x.w      s10, ft10
                  mulhu        sp, a5, t0
                  feq.s        a2, ft2, fs10
                  fadd.s       fs3, fs0, fa5, rne
                  fmax.s       fa2, fs6, ft8
                  auipc        ra, 192839
                  fle.s        a1, ft7, fa0
                  xori         gp, gp, -1896
                  fcvt.w.s     t0, fs2, rup
                  fle.s        t0, fa7, fa5
                  andi         a0, ra, 369
                  ori          s6, a7, -1848
                  sltu         s10, gp, a0
                  mulh         a7, t2, a2
                  mulhu        s3, tp, s5
                  srl          a7, tp, s2
                  divu         t6, a3, ra
                  fmul.s       ft2, ft1, ft9, rdn
                  xor          s5, a6, a4
                  mulh         a1, s2, a0
                  flt.s        ra, fs6, fs6
                  fsgnjn.s     fa1, ft5, fs5
                  div          t4, a7, a7
                  fmax.s       fa2, ft5, fs9
                  fmv.w.x      fs11, ra
                  fcvt.s.wu    ft3, ra
                  sub          a7, a4, s4
                  fclass.s     a7, fa6
                  add          gp, s5, t5
                  fsub.s       fs11, fs2, ft10, rmm
                  fadd.s       fa1, fa5, ft11
                  addi         t0, a7, -1871
                  fcvt.wu.s    s0, fa3
                  srli         ra, t0, 2
                  mulhu        t4, t5, t0
                  slti         s9, s9, 1120
                  addi         s8, a4, -1567
                  mulh         gp, t3, t2
                  mulhsu       s1, a4, s4
                  andi         gp, t2, 2002
                  fsqrt.s      fa2, fa2
                  fle.s        a1, fs0, fa6
                  feq.s        a6, fs4, fs2
                  or           t5, s5, zero
                  srli         s9, t5, 14
                  sltu         a2, s9, a2
                  fsgnjx.s     ft7, ft9, fs5
                  srli         a0, s10, 9
                  feq.s        s5, fs9, ft6
                  sltiu        a1, s8, -864
                  fsgnjn.s     fs5, fa7, fa0
                  lui          s8, 1038645
                  fmul.s       fa1, ft7, fs9
                  fcvt.wu.s    t6, fs11, rne
                  srli         a3, t0, 5
                  sltu         zero, s5, a4
                  fcvt.s.wu    fs9, s5
                  fadd.s       ft3, fa3, ft1
                  fdiv.s       fa6, fs10, fs11, rdn
                  fmv.w.x      ft9, s5
                  feq.s        s2, fa5, fs5
                  add          a4, s7, a7
                  xor          t5, ra, t2
                  slti         s8, a0, -562
                  srl          ra, s10, gp
                  slli         s8, s2, 16
                  fsqrt.s      ft7, fs2
                  fsgnjx.s     ft5, ft5, fs8
                  fcvt.w.s     s7, ft10, rmm
                  feq.s        t6, ft5, ft2
                  flt.s        s9, fs5, ft3
                  mulh         s5, ra, t2
                  divu         s2, s3, a6
                  and          s0, ra, t1
                  fmin.s       fs3, ft11, ft10
                  fcvt.s.wu    ft9, a3
                  fsqrt.s      ft3, ft1
                  mul          t6, sp, sp
                  fmv.w.x      ft1, t2
                  rem          s5, s9, t0
                  sra          t6, t6, a2
                  fmv.x.w      gp, fs10
                  fsgnjx.s     fa0, fa0, fa4
                  andi         zero, s3, -282
                  fcvt.s.w     ft10, ra, rtz
                  slti         s0, s9, -974
                  ori          s10, s9, 643
                  srli         s3, t0, 1
                  xor          s3, s3, s2
                  xor          tp, zero, t1
                  mul          t6, t3, a3
                  sltu         a7, t4, a6
                  divu         t5, s0, t5
                  fmv.x.w      s6, ft11
                  mulhsu       s8, a7, a4
                  fmin.s       ft1, fa5, fs9
                  srl          s6, tp, s0
                  or           t0, a6, s10
                  slt          s4, s5, s7
                  feq.s        ra, fa4, fa6
                  auipc        s1, 162882
                  fmv.w.x      fa3, zero
                  srl          gp, a0, s3
                  or           s4, t0, s11
                  fsgnj.s      fs9, fs0, fa6
                  fsqrt.s      fs1, ft3
                  slli         s4, s8, 21
                  addi         t0, zero, 140
                  mulhu        t2, a7, s0
                  lui          a4, 681494
                  remu         s4, a2, a2
                  mulhsu       t0, s5, a5
                  fsub.s       fs0, fs1, fa7, rup
                  or           s7, t1, t3
                  slli         gp, t5, 14
                  sub          s9, t3, a6
                  mul          a1, a5, a6
                  sltu         s0, t6, ra
                  slli         s1, a5, 17
                  srl          sp, a5, a2
                  fmv.x.w      zero, fs10
                  mulhsu       t6, zero, s11
                  fsub.s       fa5, ft1, fs9
                  div          a4, tp, s1
                  sra          a3, t1, s1
                  nop
                  fcvt.w.s     t5, ft10
                  fmv.w.x      fs2, s7
                  andi         s9, zero, 1867
                  fdiv.s       fs3, ft10, fa7, rup
                  mulh         a2, t2, s10
                  fsgnjx.s     fs10, fs3, ft2
                  fmv.x.w      a0, ft11
                  sra          a2, s5, a6
                  srai         zero, t3, 0
                  srl          t4, tp, s10
                  fmv.w.x      fa7, s7
                  fcvt.wu.s    tp, ft3, rup
                  fmv.x.w      a6, ft5
                  mulh         s9, a7, a3
                  divu         gp, zero, s7
                  rem          s8, a5, a6
                  sll          s6, t6, t2
                  fsub.s       ft5, fs8, ft1, rne
                  srl          s10, t6, t5
                  fsgnjx.s     ft6, fa4, fs5
                  lui          a7, 71504
                  feq.s        s9, fs9, ft5
                  fmv.x.w      t6, ft5
                  fclass.s     ra, ft4
                  fsgnj.s      ft6, fs0, fs2
                  sltu         t4, t4, s9
                  fcvt.wu.s    a2, ft3
                  srl          t4, s4, s5
                  xor          s1, s7, a7
                  addi         a2, t0, 1182
                  mul          a4, s2, gp
                  mul          s11, s11, t2
                  fcvt.s.w     fa6, t1
                  srl          a1, t6, a3
                  ori          t2, a4, 1047
                  fcvt.s.wu    fa7, a6
                  fmv.x.w      s0, ft8
                  rem          s2, s2, s10
                  fdiv.s       fa6, fa6, fs8
                  fcvt.s.w     fs8, ra, rtz
                  andi         s8, t1, -553
                  fcvt.s.w     fs6, t6
                  sltu         t5, s1, s6
                  srai         gp, a7, 28
                  auipc        a0, 156939
                  slti         s7, t6, -990
                  sltiu        s3, s11, 908
                  fmv.x.w      s10, ft1
                  xori         s0, s9, -1399
                  slli         a1, zero, 11
                  add          s8, a2, s3
                  fcvt.s.w     ft1, s10
                  slt          a3, s3, a7
                  fmin.s       ft6, fs2, ft11
                  and          a4, s6, t2
                  nop
                  sub          s11, a4, a1
                  auipc        tp, 956193
                  or           a4, s6, t2
                  fadd.s       fs5, fa0, fs10
                  sll          s11, s8, a7
                  feq.s        s3, ft7, fs11
                  rem          t4, tp, a3
                  fle.s        s7, fs0, fa0
                  fadd.s       ft4, ft3, ft3
                  lui          s7, 775686
                  fsqrt.s      ft5, fs8, rtz
                  addi         gp, gp, -952
                  fcvt.w.s     s7, fs3
                  fcvt.wu.s    s7, fs6, rne
                  divu         a4, s7, s4
                  mulhu        s1, s8, t6
                  sltiu        s7, a3, -1191
                  mulh         a0, a7, a1
                  or           a3, a4, t4
                  fsqrt.s      fa7, ft8
                  fcvt.s.w     fa2, s11, rtz
                  fsgnjn.s     ft7, fa6, fs1
                  sra          gp, s10, t3
                  remu         s3, s9, t1
                  xori         s9, a1, -1726
                  fsgnj.s      ft1, ft11, fa6
                  srai         s0, a4, 17
                  sra          a4, s11, s1
                  sltu         t6, zero, s1
                  sltu         a6, s8, s0
                  addi         s8, t0, -2041
                  sub          a6, a2, a1
                  sltu         s10, a7, s9
                  fle.s        a4, ft3, fa7
                  fcvt.s.w     ft2, s0, rmm
                  sltiu        s7, t6, 1233
                  flt.s        sp, fa2, ft4
                  fmul.s       ft8, fs3, fa1, rtz
                  fsgnjn.s     ft2, fa7, ft1
                  fdiv.s       ft7, fs8, ft4
                  fcvt.wu.s    s4, fa0
                  fle.s        t6, ft2, fs11
                  fmax.s       fa6, ft1, ft8
                  fsgnjn.s     ft2, ft4, fs4
                  fsqrt.s      ft3, fs3
                  fle.s        s3, ft0, fa7
                  fsgnj.s      fa3, fa7, fs4
                  rem          s3, a4, s11
                  ori          ra, a3, 201
                  xor          s2, t5, t6
                  rem          s7, s9, t3
                  fmv.w.x      fs4, s10
                  mul          s8, ra, ra
                  mul          a4, s1, s6
                  mulh         a1, s3, s7
                  fmax.s       fa3, ft9, ft4
                  fsgnj.s      fa0, fs0, fs5
                  fsqrt.s      fa0, ft8
                  auipc        t5, 343591
                  fsgnjx.s     fs9, fa4, fs5
                  fmin.s       ft2, ft1, ft8
                  fsub.s       ft9, ft6, ft10, rmm
                  flt.s        s7, fs8, ft4
                  slti         s6, a3, 1763
                  mulh         a1, a7, s9
                  mulh         tp, s6, a6
                  rem          s9, s4, s9
                  fcvt.s.w     ft10, tp, rup
                  feq.s        s4, fs0, ft5
                  fsgnj.s      fs4, ft10, fs3
                  slli         zero, a5, 17
                  fsgnj.s      fs1, ft9, fs3
                  xor          tp, t0, s4
                  fsgnj.s      ft1, ft11, ft9
                  divu         s2, t5, t1
                  andi         t6, t6, 1261
                  mulh         s11, a0, a2
                  sub          t4, s5, s10
                  fadd.s       fs2, fs6, fa6
                  sra          s3, a2, s3
                  auipc        s2, 582776
                  fmv.x.w      gp, fa5
                  xor          s2, t1, t0
                  xori         a3, gp, -1874
                  fcvt.s.w     fs10, sp, rup
                  fsqrt.s      fs9, ft4, rne
                  rem          sp, a3, s5
                  xor          s7, a5, t2
                  fle.s        zero, fa4, fs4
                  or           ra, t5, ra
                  fsub.s       ft7, fs4, fs6
                  rem          t0, s4, s11
                  sll          gp, ra, a6
                  fsgnj.s      fs3, ft10, fs5
                  fadd.s       fa0, fs6, ft3
                  fle.s        s4, fs1, fs8
                  fmax.s       fs4, ft4, ft3
                  sltu         t5, s2, gp
                  mulh         a7, sp, a5
                  fcvt.wu.s    a6, fs4
                  fsqrt.s      fa0, fa6, rdn
                  fmax.s       fs4, fa3, ft9
                  sub          s8, s8, a0
                  xori         a0, gp, 104
                  srl          t5, zero, a0
                  slt          a3, ra, s3
                  xori         a7, t5, 750
                  slt          s1, s2, a0
                  fmax.s       fs6, fs11, ft1
                  addi         ra, s2, -1101
                  or           s0, t3, a6
                  fmv.x.w      s6, fs2
                  lui          s4, 42403
                  fsgnjx.s     ft0, ft7, ft0
                  div          a3, a0, t0
                  fsgnjn.s     ft0, fa1, ft4
                  mul          s4, a7, s1
                  addi         t4, tp, -254
                  fdiv.s       fa5, fa7, fs0, rtz
                  or           s9, s6, s6
                  fcvt.s.wu    ft11, gp
                  mul          t6, s8, s10
                  sll          t4, s2, s10
                  feq.s        s10, fs2, ft9
                  fclass.s     s9, fa0
                  fmin.s       fs3, fs7, fa5
                  auipc        s0, 510567
                  sra          s0, s11, t3
                  srli         a6, a0, 11
                  fsgnjn.s     fa2, fs1, fa6
                  fcvt.s.w     fa6, t5, rup
                  andi         tp, s3, 273
                  fsgnjn.s     fs2, fa0, ft6
                  nop
                  fcvt.s.w     fs3, a0, rmm
                  fcvt.s.w     fs9, t5, rtz
                  sltiu        t6, ra, 201
                  ori          tp, s8, -1857
                  sltu         a4, s6, a0
                  fadd.s       ft0, fa3, fs1, rmm
                  xor          t6, t4, s3
                  fcvt.w.s     s2, fa0, rmm
                  fadd.s       fs7, fa1, ft10, rtz
                  fclass.s     s2, fa0
                  fmax.s       fa6, ft5, fs2
                  fcvt.s.wu    ft1, s7
                  fmul.s       fs1, fa7, ft1
                  fsqrt.s      fa7, ft11
                  srl          s1, t3, s3
                  fmul.s       ft9, ft6, fa2, rup
                  mulhu        s11, s0, s5
                  fsqrt.s      fs0, fs3
                  fle.s        a1, fa4, ft2
                  mulh         a3, s4, ra
                  addi         t2, a7, 1555
                  srli         s5, a1, 24
                  sltu         ra, s4, tp
                  mulhsu       s6, t2, t6
                  fsqrt.s      ft11, fa7
                  fcvt.w.s     a6, ft0
                  srai         t5, a6, 30
                  fle.s        a7, fa7, fa5
                  slli         s8, a1, 31
                  fmin.s       fa1, fs1, fa0
                  slli         s3, t6, 3
                  fsqrt.s      fs0, ft5, rtz
                  feq.s        a3, fs5, ft10
                  slt          s6, t5, s0
                  fclass.s     zero, ft5
                  fcvt.s.w     fs9, a0
                  or           s3, a5, a7
                  andi         t2, t1, 1912
                  auipc        t5, 851753
                  addi         s6, s8, -1682
                  srl          s6, t0, s6
                  fsqrt.s      fs9, fs3
                  ori          a4, s3, 1445
                  fadd.s       fa7, fa3, fa2
                  fmv.x.w      s3, fs3
                  fcvt.s.w     fa5, s1
                  mulhu        zero, tp, a0
                  and          t4, a7, t5
                  fclass.s     sp, fs3
                  srai         a4, tp, 12
                  fsgnj.s      fs8, fs7, ft2
                  and          t0, zero, tp
                  flt.s        s8, ft11, ft3
                  fle.s        s5, fs6, fa4
                  mulhsu       s11, t0, t6
                  flt.s        s5, ft2, fs8
                  lui          s4, 882664
                  fadd.s       fa2, fa2, ft0, rup
                  fcvt.s.w     fs5, s9
                  srli         sp, s9, 2
                  fle.s        s11, fa4, fs4
                  lui          s10, 792325
                  xori         ra, t2, 1847
                  sub          s11, s1, s4
                  sltiu        a2, tp, -1667
                  mul          a0, t6, tp
                  slli         t5, t5, 6
                  fsub.s       fs0, fa4, fs9
                  fle.s        t0, fa6, ft2
                  sll          s5, t6, a3
                  fcvt.w.s     s2, fa0, rtz
                  sltu         a1, s10, a5
                  fsgnjx.s     fa7, fs4, ft0
                  or           s8, t1, s5
                  mul          t4, a2, t1
                  sltu         s2, s9, gp
                  mulh         t6, tp, a4
                  fsgnjx.s     fa6, fa5, fs7
                  divu         s9, a7, s3
                  and          s8, s0, s6
                  auipc        s6, 680495
                  fcvt.wu.s    gp, ft6, rup
                  mulhu        s4, t1, s1
                  fsqrt.s      ft10, ft10, rmm
                  fmul.s       fs1, ft8, ft2, rne
                  fclass.s     s6, fs11
                  add          s0, sp, t2
                  mulh         s11, s9, t2
                  mulhu        a3, t3, t2
                  fcvt.s.w     ft1, a2, rdn
                  fmv.x.w      s7, ft11
                  srli         ra, s2, 5
                  slti         s11, s5, 1986
                  sltu         zero, s9, t6
                  rem          a3, tp, a0
                  sra          t6, a4, s0
                  fmax.s       fa3, ft2, fa2
                  fcvt.w.s     t6, fa2, rdn
                  slt          s7, t0, s3
                  sra          t4, tp, s9
                  mul          a1, s7, gp
                  fcvt.wu.s    t6, fs2
                  fclass.s     a0, fa1
                  addi         zero, sp, -1834
                  slli         tp, s1, 4
                  nop
                  fmv.w.x      fa4, t0
                  xor          ra, t4, a5
                  div          t6, s5, s1
                  slti         s6, a5, 657
                  fmax.s       fs4, ft9, ft6
                  sub          gp, a5, t0
                  fsgnj.s      ft6, fa7, ft9
                  fsqrt.s      fs11, ft9
                  srli         a7, s0, 28
                  srai         a6, s9, 6
                  fclass.s     s2, ft2
                  feq.s        a1, fs1, fs11
                  sltu         t5, ra, s5
                  slli         a0, s2, 16
                  fle.s        t5, ft5, fa6
                  mul          zero, s9, s4
                  lui          a3, 72745
                  lui          s3, 893973
                  fadd.s       ft2, fs0, fs11
                  ori          s1, t0, 1130
                  fcvt.s.w     fs2, s0
                  mulhsu       s7, t0, s3
                  sll          s2, a5, a2
                  fclass.s     s9, ft11
                  fsgnjx.s     fa0, ft7, ft1
                  sub          s2, t3, zero
                  srl          s2, a2, s5
                  slt          a6, tp, s9
                  rem          a4, a6, s7
                  fcvt.s.wu    ft6, t2, rne
                  slti         s3, t2, -1730
                  sub          t0, a6, s0
                  fadd.s       fa3, ft11, ft0, rdn
                  fcvt.wu.s    tp, ft5, rtz
                  mulh         s9, s4, s9
                  xor          a4, s3, a1
                  add          gp, ra, a4
                  fclass.s     a3, fs9
                  divu         s9, tp, t0
                  mulh         s8, t0, a6
                  lui          t2, 394775
                  and          s0, sp, a3
                  sub          a1, s10, t4
                  fadd.s       fs3, fa7, ft3
                  slli         zero, a1, 1
                  fcvt.w.s     s2, ft11
                  div          s9, a7, a0
                  lui          t2, 174216
                  mulh         t4, zero, t5
                  sll          s9, ra, a3
                  fclass.s     s1, ft0
                  fsqrt.s      fa2, ft9
                  remu         s2, s5, t5
                  slli         a0, a5, 22
                  mul          s4, t5, s9
                  fclass.s     a4, fs2
                  andi         a3, t2, 1286
                  xor          t2, t5, s10
                  mulhsu       s3, t6, s7
                  feq.s        s5, ft5, ft0
                  mulhsu       s2, s8, t1
                  fsgnjx.s     fa4, fs0, fa7
                  fcvt.w.s     gp, ft4
                  fsqrt.s      fs0, fs3, rmm
                  or           s7, s3, t5
                  fmax.s       ft10, fa2, fs8
                  fle.s        ra, fa5, fs9
                  fsqrt.s      fs1, fs2
                  fclass.s     s11, ft9
                  slt          a4, t3, sp
                  srai         t0, zero, 17
                  fdiv.s       fs8, ft1, ft7, rne
                  xori         a6, s6, 756
                  fmin.s       fa1, fa3, ft0
                  fmin.s       fs3, fs2, fa3
                  slti         a3, a1, -195
                  fmin.s       fa3, fa3, fa1
                  fsgnjn.s     ft11, fs0, ft7
                  fle.s        t4, fs8, ft5
                  rem          a1, ra, s11
                  fle.s        s9, fs10, ft8
                  mulhsu       a2, s2, s10
                  fsgnj.s      ft6, ft1, fa0
                  sra          ra, ra, a5
                  nop
                  fsgnj.s      ft0, fa7, ft10
                  fdiv.s       fs6, ft8, ft8, rmm
                  div          s2, s3, s5
                  addi         s6, s6, 1898
                  fsgnjn.s     fs9, fs3, fs1
                  and          s0, s5, s8
                  add          t0, s3, s11
                  fsgnjx.s     fa4, ft2, fa7
                  slti         s4, a6, 2022
                  srl          gp, zero, tp
                  addi         a0, t2, 1738
                  fmv.w.x      ft1, s2
                  rem          a0, a3, a2
                  fsub.s       ft6, fs7, fa6
                  rem          s7, tp, s1
                  fcvt.s.wu    ft8, s9
                  fadd.s       ft7, ft7, ft1
                  srl          s11, s6, s10
                  fcvt.w.s     t2, fs9
                  slli         s2, a3, 28
                  fcvt.s.w     ft2, t1, rne
                  fmv.w.x      fs1, s2
                  slti         s3, t0, 1516
                  divu         s11, a1, a3
                  sub          a4, ra, ra
                  fmin.s       ft7, fs3, fs4
                  fmv.x.w      s3, ft5
                  slli         s7, t2, 8
                  sltiu        s9, t3, 1569
                  fcvt.w.s     s5, fs5
                  fle.s        s2, fs9, fs1
                  fsgnj.s      fa0, fa1, ft9
                  sltiu        s1, s2, -1464
                  fclass.s     s1, fa4
                  mul          tp, t0, s0
                  fle.s        s3, ft0, fa4
                  fmv.x.w      a2, fs9
                  mul          s10, a0, s11
                  fsub.s       ft11, fa5, ft7, rtz
                  srai         gp, s8, 11
                  and          t2, s5, sp
                  fsqrt.s      fa2, fs9
                  fsqrt.s      fs8, fa5, rmm
                  flt.s        tp, fs3, fa0
                  fsub.s       ft2, fa5, fa4
                  fcvt.wu.s    s1, ft7
                  fsgnjx.s     fs8, fs8, ft5
                  fsgnjx.s     ft6, fs5, ft2
                  fmv.w.x      ft2, t0
                  divu         t4, t3, t6
                  sub          tp, s9, s11
                  srl          s9, sp, s11
                  fle.s        zero, fs9, fa6
                  lui          s10, 636701
                  slt          tp, s10, t2
                  fsgnjx.s     ft6, ft11, ft9
                  fsgnjx.s     fa3, ft4, fs7
                  or           a2, t3, s3
                  fmv.w.x      fs11, s4
                  fmv.x.w      t5, fs7
                  fcvt.w.s     s3, fs11
                  xor          t0, a5, a1
                  fmul.s       fs0, fa5, fs9
                  fmin.s       fs1, fs5, ft5
                  fcvt.s.wu    ft11, s9
                  fcvt.wu.s    s0, fa0, rup
                  ori          a2, a5, -1670
                  remu         t4, t4, ra
                  auipc        zero, 853968
                  sll          s9, t0, t4
                  fsub.s       fa7, fs8, ft9, rmm
                  or           s0, s8, t0
                  addi         s11, s4, -1626
                  add          sp, a6, t5
                  fsgnjn.s     fa2, fa4, fs5
                  slti         t5, s6, -1035
                  sltu         a2, a0, t4
                  sltiu        a2, a2, 969
                  div          t0, t4, s6
                  fadd.s       fs0, fs10, ft5, rup
                  fsqrt.s      ft8, ft8, rtz
                  fcvt.s.wu    fa4, tp, rup
                  xori         s1, s6, -668
                  sll          zero, s2, t3
                  sll          s10, s11, s8
                  fclass.s     s3, ft2
                  xor          t6, a4, t4
                  feq.s        s2, fs7, fs2
                  add          t0, t0, a0
                  srai         zero, t2, 13
                  fdiv.s       fs10, ft4, ft2, rdn
                  andi         t4, t3, 1709
                  div          s6, s6, sp
                  fsgnjx.s     fa3, fs11, fs7
                  flt.s        a0, ft1, fs8
                  srli         a0, s5, 8
                  fmv.w.x      fs8, a6
                  divu         s9, s5, a5
                  feq.s        s0, ft2, fs5
                  or           a3, s7, a1
                  slli         a7, t1, 24
                  srai         s3, s6, 10
                  fdiv.s       fs4, fa3, fa7
                  addi         t2, s8, -420
                  slti         s6, s3, -902
                  feq.s        t5, fs1, fs10
                  div          ra, s4, s3
                  fdiv.s       fs8, fs4, fs6
                  mulh         s10, t3, a2
                  fmv.w.x      fa1, a2
                  srl          s6, a0, s8
                  and          s0, a0, a5
                  mul          a0, s3, s0
                  srli         tp, s8, 13
                  rem          s3, a2, s11
                  fsgnjx.s     ft5, ft7, fs0
                  lui          a4, 733481
                  divu         t2, a7, s2
                  fcvt.w.s     s7, ft6, rdn
                  fcvt.s.w     ft10, s6
                  mul          a6, t6, ra
                  fsgnj.s      fs11, ft6, ft4
                  div          zero, a2, t4
                  add          a3, a1, a4
                  srli         s7, zero, 0
                  addi         tp, t4, -1216
                  sltiu        s9, s4, 1872
                  lui          tp, 784779
                  divu         s10, t6, s4
                  remu         s3, a7, t0
                  fsub.s       ft2, ft7, ft0
                  fdiv.s       ft1, ft6, fs8, rup
                  mulhsu       t2, sp, t4
                  fclass.s     a3, fa5
                  addi         t4, a6, 473
                  nop
                  slti         s9, s7, -1869
                  andi         gp, gp, 1940
                  sll          gp, t2, t1
                  andi         a4, sp, -633
                  rem          s7, a6, gp
                  fmin.s       ft9, fs6, ft7
                  mulh         gp, a7, t3
                  xori         a0, s2, -624
                  fmv.x.w      gp, fs0
                  srai         t2, a3, 14
                  addi         s5, s2, -1525
                  fmul.s       ft5, fa5, ft1
                  remu         sp, s5, ra
                  srli         t2, s4, 13
                  add          zero, s11, a0
                  fdiv.s       ft7, fa2, ft8
                  fcvt.w.s     s4, fs9, rup
                  fcvt.wu.s    a1, fs3, rtz
                  flt.s        t0, ft6, ft8
                  mulhsu       s6, sp, a4
                  lui          s6, 933855
                  xor          s7, s11, s3
                  fmv.w.x      ft4, a6
                  srli         s9, s0, 30
                  srli         t2, t5, 26
                  fmv.w.x      fs5, t2
                  addi         s7, a2, 1679
                  fmax.s       ft5, fa5, fs7
                  srai         a3, t2, 21
                  srai         s0, zero, 0
                  fmax.s       fa2, ft6, fa2
                  fmin.s       fa3, fa5, fa2
                  fsgnjn.s     fs4, fs4, fs10
                  fsqrt.s      fs3, fa6, rmm
                  sltu         s0, a4, tp
                  srl          ra, s0, a3
                  fmax.s       ft10, ft11, fs2
                  slti         tp, gp, -1859
                  sra          a2, tp, s10
                  fsub.s       ft11, fa0, ft7, rup
                  fcvt.s.w     ft2, a2, rmm
                  div          s0, t4, a7
                  andi         t2, s9, -263
                  fclass.s     t6, fs4
                  slti         s8, a0, -1203
                  mulhu        a4, s7, a5
                  srl          a4, s3, t4
                  srl          gp, a5, a4
                  fmv.x.w      s2, fs11
                  add          sp, s9, s8
                  fmax.s       ft7, ft8, fs1
                  fcvt.s.w     fs8, s10
                  fsgnjn.s     fs11, fs7, fa5
                  sra          t0, s5, t1
                  feq.s        a2, fs11, fs9
                  and          s5, t3, t1
                  fmv.x.w      ra, fs10
                  remu         a2, s9, s3
                  fmin.s       ft2, fa4, ft3
                  fcvt.w.s     s9, fa0
                  fcvt.s.wu    fa2, t3
                  feq.s        t6, fs2, fs5
                  srl          s8, s11, zero
                  mulhsu       s11, s0, a5
                  fcvt.s.wu    fa6, a1, rtz
                  fmax.s       fs0, ft10, ft11
                  fmin.s       fs5, fa2, fs8
                  fcvt.s.w     ft11, a0, rup
                  slt          a6, s10, s7
                  mul          s7, a1, s10
                  srl          a6, ra, gp
                  fsub.s       fa1, ft10, ft3, rtz
                  fmax.s       fa5, fa0, ft0
                  fadd.s       fs9, fa1, fa7, rdn
                  fclass.s     s7, fa5
                  divu         a6, a6, sp
                  slti         s3, s4, 1425
                  add          sp, t6, s2
                  fcvt.s.wu    ft1, a1
                  fclass.s     s5, ft4
                  slti         t2, s7, -1054
                  and          s4, a5, t3
                  ori          s0, s4, -799
                  srli         s2, a4, 22
                  addi         s6, s1, -1036
                  remu         s0, a6, s4
                  fsqrt.s      fs10, fs0, rmm
                  mulhsu       t5, s3, a7
                  slt          s4, t1, a7
                  slli         t5, s8, 28
                  addi         t5, gp, -1716
                  feq.s        t2, ft4, fa2
                  fsqrt.s      ft4, fa4, rne
                  sltiu        s4, s1, -1435
                  fdiv.s       fa0, ft3, fa6
                  sll          t2, zero, ra
                  fdiv.s       fs5, fs9, ft4, rdn
                  mul          a1, s5, t5
                  fmax.s       fa3, ft4, fs3
                  fsgnjn.s     fs10, ft10, fa2
                  divu         a2, zero, ra
                  slt          s5, s2, s1
                  sub          a1, t1, zero
                  fsgnj.s      ft10, fa7, fs10
                  rem          sp, t4, t4
                  fmv.w.x      fs9, s1
                  fcvt.wu.s    t5, fa6
                  fcvt.s.w     fs2, s2
                  add          t6, a0, a3
                  auipc        gp, 974305
                  flt.s        s5, fa1, ft5
                  fcvt.wu.s    t0, fa4
                  or           t5, a0, s2
                  fcvt.w.s     a2, ft5, rup
                  sll          t0, s9, s5
                  remu         a3, s6, a4
                  feq.s        s8, fs11, ft8
                  andi         s8, a0, -1138
                  lui          gp, 734569
                  srl          t6, s11, t0
                  srl          a4, t4, t5
                  fcvt.w.s     s10, fs3
                  slti         t6, sp, 1402
                  mulh         a2, s11, t1
                  fsgnjx.s     ft3, fs6, ft6
                  fcvt.s.w     fs8, gp, rmm
                  fsgnj.s      fs8, fa3, fs6
                  rem          t2, t0, s10
                  fmv.x.w      s8, fa3
                  mulhsu       s3, sp, gp
                  fle.s        s0, fs4, ft4
                  sub          a3, s9, s1
                  fsqrt.s      fs9, fa6, rdn
                  sltiu        s7, s8, -1073
                  fsgnjn.s     ft7, fs10, ft10
                  divu         t4, gp, s7
                  fmv.x.w      ra, fs10
                  xor          s0, s9, s9
                  sra          s10, a6, sp
                  fadd.s       fa6, ft1, ft5
                  remu         t2, s8, ra
                  fsqrt.s      ft10, fa5
                  fcvt.wu.s    s9, ft1
                  lui          s7, 724311
                  nop
                  slt          t4, t2, sp
                  mulhsu       t2, s0, t0
                  fmin.s       fs7, fa1, fs7
                  div          s1, a3, zero
                  remu         gp, s8, t6
                  sll          a6, s11, sp
                  rem          s7, t0, a2
                  fsub.s       ft7, ft9, fa0, rtz
                  fmv.x.w      t5, fs11
                  fmin.s       fa0, ft0, fs3
                  sra          s2, a0, tp
                  div          a3, zero, t6
                  fmul.s       fa7, fs6, fs11, rtz
                  divu         a7, t0, t3
                  fle.s        t4, ft1, ft10
                  sub          s1, a4, t5
                  fadd.s       fs4, fs6, fa6
                  nop
                  addi         zero, a2, -409
                  and          ra, s11, gp
                  fmv.x.w      t5, ft1
                  add          s7, a2, s10
                  nop
                  slti         s11, a6, -1834
                  slti         a2, gp, -1686
                  sll          tp, t6, t1
                  xor          ra, gp, a4
                  mulhsu       ra, a6, sp
                  slti         t6, t6, 546
                  flt.s        s10, fs10, ft4
                  fmv.x.w      s11, ft3
                  remu         s10, sp, s1
                  ori          s5, t1, 1901
                  fcvt.w.s     s2, ft4
                  fsub.s       ft1, fa0, ft10, rne
                  xor          s10, s9, a7
                  mulh         ra, s2, a6
                  and          s3, a0, a2
                  fmin.s       ft8, fs5, ft0
                  fdiv.s       ft5, fs0, ft6, rdn
                  andi         s1, a2, 1417
                  fmul.s       ft0, fa3, fa7
                  slti         sp, t4, 920
                  srl          s9, s0, s10
                  divu         s4, s0, s11
                  addi         a0, t2, 204
                  fdiv.s       fs4, fs0, fa1, rne
                  andi         t4, a5, 1930
                  fcvt.s.w     ft8, s0
                  and          a0, a7, s1
                  sltiu        s11, s0, 442
                  fle.s        t4, fs6, ft7
                  remu         gp, s3, a2
                  fsub.s       ft3, ft11, fs3
                  div          tp, s9, t0
                  srl          a3, t1, t4
                  fclass.s     s8, fa3
                  fcvt.s.wu    ft9, t2, rmm
                  fsub.s       fs11, ft1, ft10
                  srl          s7, a6, s5
                  fclass.s     sp, fs2
                  mulhu        s5, a0, a7
                  mulhsu       a3, s2, s0
                  xor          zero, zero, a5
                  mulh         s4, t1, gp
                  sltiu        a1, t3, -1518
                  fcvt.w.s     ra, fa5
                  sltiu        s3, t0, 153
                  remu         s10, ra, t6
                  slt          a3, s6, a1
                  slti         s4, tp, -589
                  srl          a2, tp, a7
                  slt          s4, t2, gp
                  divu         a4, a3, s5
                  or           a1, a1, s10
                  fmax.s       fs9, fs4, ft6
                  addi         t0, a7, -405
                  fdiv.s       fs10, fa1, ft10, rmm
                  divu         t6, s9, s2
                  fle.s        s3, fs9, fs2
                  or           a6, a2, s0
                  sll          s8, a7, s2
                  srli         t2, s5, 17
                  fdiv.s       fa1, ft5, fs4
                  fmv.x.w      sp, ft0
                  srli         t5, a3, 16
                  srl          a3, t4, ra
                  sll          s10, s7, a0
                  fsgnj.s      fa0, ft1, fa3
                  addi         ra, ra, 977
                  fadd.s       fs5, fa3, fs7, rdn
                  andi         a3, a1, -1582
                  remu         s6, t6, sp
                  auipc        gp, 409657
                  andi         s8, a0, -1826
                  add          t4, s5, ra
                  auipc        t4, 411279
                  feq.s        zero, fs5, fs0
                  sll          t4, t3, a0
                  mul          s10, t3, a7
                  fmv.w.x      ft7, s7
                  auipc        t2, 568879
                  xori         t2, t6, 354
                  sra          s2, s0, s6
                  sll          s0, s7, t3
                  sll          t5, s10, s10
                  div          a0, s6, s2
                  srl          t6, s2, a6
                  mulh         s4, t0, sp
                  sll          sp, a7, sp
                  divu         s6, s11, s2
                  sll          s1, s1, a7
                  fcvt.s.wu    fa1, ra, rdn
                  sll          s7, t0, s8
                  mul          tp, a5, t2
                  fcvt.s.wu    fa0, s0
                  lui          a6, 319210
                  add          tp, s2, s1
                  andi         a2, a2, -921
                  andi         sp, s10, 552
                  div          t0, s8, s0
                  fsgnj.s      fa2, fs1, fa1
                  srli         tp, gp, 16
                  fle.s        s8, fa6, ft1
                  fcvt.s.w     fs5, gp
                  fmv.x.w      tp, fs6
                  fsgnjn.s     fs7, fa7, fa4
                  sltu         a0, a0, s2
                  remu         t5, t4, s6
                  fcvt.s.w     fs5, ra, rdn
                  srl          s0, s3, s4
                  fmul.s       fa4, fa1, fs5, rmm
                  sll          a0, a5, s5
                  fcvt.s.w     ft7, a6, rne
                  mulh         s1, a2, t6
                  slli         s11, a0, 28
                  srli         s11, s10, 5
                  fsgnjn.s     fs8, fa7, ft2
                  xor          s4, t4, a5
                  fadd.s       fs5, fa3, ft3
                  fmul.s       fs8, fa1, fa1, rmm
                  mul          t4, s0, t2
                  feq.s        t2, fa1, ft6
                  mulh         s10, t5, t2
                  and          t6, a6, a4
                  fclass.s     s6, ft4
                  rem          s4, t3, a6
                  fmin.s       fa4, fs11, ft9
                  auipc        ra, 626646
                  slt          s10, s11, s1
                  fmul.s       ft5, fa4, fs6
                  fle.s        s10, fa2, fa6
                  ori          s9, sp, -523
                  fsgnj.s      fs10, fs5, fa2
                  mulh         s2, t4, s8
                  and          tp, zero, s10
                  srl          ra, t5, s8
                  srai         s10, t1, 3
                  mul          a2, t0, sp
                  lui          t0, 707080
                  slti         a4, gp, 371
                  add          s2, s2, s10
                  fmv.x.w      s0, ft6
                  fsgnjn.s     fa5, fa2, fs4
                  sll          t4, a6, zero
                  or           t2, a1, a4
                  fcvt.s.wu    fs4, s9
                  srli         s8, a5, 22
                  sltiu        s8, s9, 1664
                  fsgnjx.s     fs4, ft0, ft1
                  fsgnjn.s     fa0, fa5, fa7
                  srl          a0, s11, t2
                  fsgnjn.s     fa0, fs10, ft6
                  srai         s2, a5, 27
                  fclass.s     tp, fs7
                  fsqrt.s      fa4, fs0, rup
                  or           a3, s2, s9
                  fle.s        ra, fs5, fs2
                  auipc        t2, 230233
                  mul          t4, s5, t6
                  remu         s1, gp, s3
                  fcvt.s.w     fs11, gp
                  auipc        t2, 144558
                  srli         s7, sp, 24
                  fcvt.s.wu    fs6, a6, rdn
                  slti         s8, s7, 1293
                  nop
                  remu         a7, s9, s11
                  divu         sp, sp, s2
                  srli         t4, t3, 8
                  auipc        sp, 290879
                  xori         s6, t5, -852
                  fmv.w.x      ft1, s3
                  flt.s        a0, fs10, ft2
                  nop
                  fmul.s       ft4, fs11, fa6, rtz
                  xor          s6, s10, s5
                  fmul.s       ft10, fs9, ft2
                  fsgnjx.s     fa4, fs11, ft6
                  srli         a0, a6, 4
                  fdiv.s       ft3, fa7, ft11
                  or           tp, s3, s2
                  fsgnj.s      fa2, fs2, fa2
                  sub          a0, a3, s6
                  fmax.s       fs7, ft6, fs4
                  fsqrt.s      fs2, fs3
                  nop
                  remu         s6, gp, s9
                  srl          a7, a2, a3
                  fcvt.wu.s    s1, ft6
                  srli         s11, t1, 20
                  srl          s5, t6, s9
                  sra          s7, gp, s11
                  addi         a6, a2, -1515
                  sra          s2, a5, a7
                  fmv.x.w      s8, fa3
                  fcvt.s.wu    ft9, a5, rtz
                  fcvt.wu.s    a2, fs10, rdn
                  srl          tp, s2, ra
                  ori          ra, t3, -1843
                  or           a2, a0, t6
                  fsgnj.s      ft10, fa6, fs5
                  mul          sp, t4, a4
                  or           sp, s6, s4
                  sra          a2, gp, sp
                  feq.s        t5, fa3, fs7
                  fcvt.s.wu    ft0, s1
                  sll          a0, a1, gp
                  and          t6, s3, t1
                  xor          t0, sp, a7
                  fsgnj.s      fa2, fs2, fs6
                  fmv.w.x      fs1, t3
                  fadd.s       fa0, fs7, fa0, rup
                  fle.s        s3, fs3, fs3
                  fadd.s       ft5, ft6, fs7
                  remu         a2, sp, t1
                  fmv.x.w      a0, fa2
                  or           s6, t5, t2
                  or           gp, a2, s8
                  xor          t4, a0, tp
                  div          t6, t1, t6
                  divu         a6, t6, s11
                  xor          t0, s9, a1
                  fmin.s       ft5, fa6, fs7
                  fcvt.s.w     ft9, a6
                  fmax.s       fa4, fs6, fs3
                  fcvt.s.wu    ft6, zero
                  fle.s        ra, fs3, fa3
                  fmv.x.w      a6, ft7
                  sltiu        sp, a4, -1842
                  slli         t2, t1, 4
                  sra          a1, t5, a1
                  div          gp, s10, s10
                  fmul.s       ft10, ft6, fa6, rne
                  mulhsu       s11, sp, s1
                  mulhsu       s4, t6, t1
                  fdiv.s       ft10, fa6, fs6
                  fsqrt.s      ft3, fa2, rne
                  remu         a4, a6, t6
                  fmv.x.w      a2, ft6
                  mul          a4, t6, s7
                  auipc        a2, 942693
                  fsgnjx.s     ft0, ft0, ft11
                  fsgnjn.s     fs5, ft3, fs8
                  fcvt.wu.s    s3, ft6
                  div          a6, ra, a3
                  fle.s        s5, fs1, ft2
                  sltiu        ra, sp, -691
                  mulh         t2, a5, sp
                  fcvt.s.w     ft3, ra
                  fsgnjx.s     fs4, ft5, fa0
                  sll          gp, s6, a7
                  fmin.s       fa1, fs11, ft4
                  rem          t0, ra, s0
                  and          ra, a7, a3
                  mulhu        s8, t4, zero
                  sll          s3, s7, a4
                  sra          a4, a5, s7
                  fadd.s       fs9, fa6, fs4
                  srl          s5, a1, s7
                  fmv.w.x      fs5, t2
                  fsgnjn.s     ft5, fa0, ft1
                  feq.s        s8, fs8, ft1
                  xor          s9, a1, a3
                  sltu         s1, a2, s0
                  addi         a2, a7, -711
                  feq.s        a1, fa7, fs1
                  div          s2, s2, gp
                  div          s2, t5, t6
                  fsub.s       fa3, fa1, fs10
                  div          s8, s11, t3
                  fcvt.wu.s    t5, fs7, rdn
                  slti         s9, t6, 1186
                  ori          ra, s11, 785
                  fsgnjx.s     fa5, fa3, fa3
                  or           sp, gp, t3
                  fcvt.w.s     t0, ft4
                  xor          ra, gp, s7
                  fsqrt.s      fa0, ft6
                  fmv.w.x      fs0, a3
                  auipc        s5, 197413
                  fdiv.s       fa3, fs3, fa6, rup
                  lui          s1, 904225
                  slt          zero, t3, s8
                  add          s4, a2, a4
                  fle.s        a0, fa1, ft10
                  feq.s        a7, fs4, ft3
                  fsgnjx.s     fs3, ft0, fs4
                  lui          a7, 824113
                  fmv.w.x      fs3, t6
                  sltu         sp, ra, s5
                  slti         a4, a1, 500
                  fsub.s       fs0, fs7, ft0, rtz
                  mulh         a6, a3, a5
                  ori          t0, a6, 1453
                  srl          s11, sp, sp
                  sltu         s11, s4, s1
                  fsgnjx.s     ft8, fa0, fs4
                  sltiu        tp, a0, -132
                  fmv.x.w      s4, ft10
                  feq.s        tp, ft6, fs8
                  xor          a6, s8, a5
                  fadd.s       fs0, ft5, fs3
                  mulh         s0, s10, tp
                  auipc        t5, 903517
                  feq.s        t6, fa2, fa1
                  slt          s6, sp, sp
                  mulh         s10, a6, t0
                  sll          a2, a1, a0
                  and          s5, t3, a0
                  feq.s        s9, ft7, fs11
                  add          a2, s11, zero
                  fcvt.w.s     t6, fs2, rtz
                  fadd.s       ft0, fs3, ft7
                  xor          a3, a4, a7
                  fcvt.s.wu    ft3, a3
                  sub          sp, s3, t5
                  fsgnjn.s     fs5, ft7, fs9
                  fcvt.s.wu    ft2, a2, rup
                  fmv.x.w      tp, fs1
                  fcvt.s.wu    fa4, s7
                  mulhsu       sp, s9, s11
                  lui          s5, 270100
                  fle.s        s8, ft7, ft3
                  fmul.s       fs8, fs4, fs5, rtz
                  feq.s        a1, fs6, fs10
                  sll          s3, t4, zero
                  fsqrt.s      ft2, fa6, rup
                  lui          gp, 226198
                  mulhu        gp, a4, t5
                  fcvt.wu.s    t5, fs5
                  ori          gp, a5, -1947
                  andi         t4, t5, 434
                  fmul.s       fs0, fs2, fs6, rne
                  mul          s9, a5, s4
                  sltu         a3, s7, s1
                  slt          a6, t3, t5
                  or           t0, s9, t3
                  fsqrt.s      fa2, fs8
                  srli         t0, s4, 28
                  fcvt.s.wu    fa4, s2
                  sll          s0, ra, zero
                  fmv.w.x      ft7, a7
                  slli         s11, a7, 11
                  and          t4, t2, a7
                  remu         s7, t5, a7
                  rem          t2, s7, s0
                  fsgnjn.s     ft6, fa7, fs10
                  fadd.s       fs4, fs11, fs2, rdn
                  sltu         t2, t3, gp
                  srai         s11, t2, 8
                  fsub.s       fa0, ft7, fa5
                  auipc        s7, 516499
                  fmv.w.x      ft6, t5
                  srli         t6, s9, 1
                  rem          ra, s2, t4
                  auipc        s6, 484513
                  nop
                  fsqrt.s      ft0, fa3, rtz
                  sltu         a1, s2, a5
                  div          s7, t1, t5
                  fsqrt.s      ft9, fa0, rdn
                  mulh         s7, a7, t5
                  mulh         t5, a6, s8
                  auipc        s10, 194405
                  fsgnjn.s     ft7, fa5, ft4
                  slli         s3, s8, 1
                  xor          a7, s11, t0
                  mulhsu       t2, s4, s0
                  sub          a6, s2, s9
                  mul          s2, t2, s5
                  ori          t5, t0, 1199
                  fle.s        tp, fa3, fa6
                  sll          t5, s7, t4
                  fsgnj.s      fs8, fs11, ft10
                  div          s11, sp, a5
                  add          s5, s6, s3
                  feq.s        a3, fs4, ft11
                  remu         s10, zero, t0
                  fcvt.s.wu    ft4, s4, rdn
                  fmax.s       fa1, fa7, ft5
                  fsgnjn.s     ft8, ft5, ft6
                  sll          a0, t0, a4
                  auipc        ra, 630254
                  ori          s2, s10, -974
                  flt.s        ra, ft4, fa5
                  fmax.s       ft5, ft8, fa0
                  fsgnjx.s     fs2, ft7, ft4
                  fadd.s       fa4, ft3, ft2
                  srl          s11, t1, tp
                  divu         zero, a0, s6
                  fsgnjn.s     fa6, fs10, ft10
                  divu         a1, s7, s7
                  rem          s5, gp, a3
                  xori         a0, t3, -1475
                  fsub.s       ft9, ft11, fs3, rmm
                  fcvt.w.s     sp, fa7, rdn
                  mulhsu       s0, zero, s1
                  fmul.s       fa1, fs3, fs9
                  mul          a7, zero, t4
                  flt.s        s6, fs7, fs9
                  sub          tp, a4, s9
                  remu         s3, t1, a7
                  nop
                  fmin.s       ft3, fs3, ft2
                  sltiu        s4, a3, -1325
                  add          a3, t0, s4
                  sll          zero, s1, t2
                  fadd.s       fa0, ft9, fs11
                  fmv.x.w      t0, ft2
                  fdiv.s       ft1, fs6, fa4, rtz
                  mulhsu       s9, t6, a6
                  and          s4, a7, t1
                  slti         s10, t1, 430
                  srli         s2, s7, 10
                  fsgnjn.s     ft1, fa5, fs3
                  sltu         s5, gp, t0
                  fmv.w.x      fa7, sp
                  auipc        t5, 222282
                  fmv.x.w      a1, fa6
                  srai         t6, s8, 19
                  fcvt.s.wu    fs5, s4, rne
                  rem          s6, t2, t0
                  nop
                  fmv.w.x      ft8, s5
                  feq.s        s11, fa0, fa3
                  mulhsu       s3, a1, t3
                  fmv.x.w      s11, ft11
                  mul          t5, s1, a7
                  flt.s        s1, fs10, fs0
                  ori          s8, a1, -1448
                  sra          a3, t1, gp
                  fsgnjx.s     fa1, fa6, fs10
                  flt.s        s8, fs9, ft9
                  fcvt.s.wu    ft11, a7, rdn
                  slli         s5, a5, 14
                  lui          a3, 252027
                  fsgnjn.s     fs8, fs4, fs11
                  fcvt.s.w     fs5, s10
                  xori         a2, s11, 729
                  fcvt.s.w     fs4, a1
                  rem          s6, t0, s6
                  div          s0, sp, s6
                  srli         s0, t4, 13
                  mulh         s3, tp, s7
                  divu         s0, t0, s9
                  divu         tp, t2, t2
                  div          s2, s6, a3
                  auipc        s5, 823314
                  or           s8, ra, s7
                  slti         tp, t2, 1995
                  slli         t2, s11, 27
                  fcvt.wu.s    t2, ft9
                  slt          a0, t5, a4
                  sll          tp, s3, s7
                  fsqrt.s      ft9, fa6
                  remu         a1, s6, s10
                  sltu         s2, t6, a4
                  fcvt.wu.s    s7, fs6, rtz
                  fdiv.s       fa3, fs11, fs4
                  andi         s7, s8, 372
                  slti         a3, s5, 285
                  divu         a1, t5, s8
                  fdiv.s       fs4, fa4, ft1
                  mulhsu       a3, s3, s7
                  slli         sp, t2, 12
                  fclass.s     s0, fs1
                  feq.s        a3, fs6, fa5
                  fmul.s       fs11, fa7, ft2, rup
                  addi         a7, s11, 1278
                  or           s8, t2, a4
                  srli         s11, t1, 29
                  fcvt.s.w     ft1, s11
                  flt.s        s9, fa2, fs1
                  slt          s0, s3, s11
                  mulhsu       t0, t1, zero
                  auipc        t0, 597172
                  fsgnjn.s     fa4, ft5, ft4
                  or           s5, s3, t6
                  fadd.s       fs4, ft2, fs9
                  sub          t2, t5, s0
                  fle.s        gp, fs11, fa7
                  fsgnj.s      fs5, fa6, fa2
                  fmax.s       ft7, fs8, fs7
                  fsqrt.s      fa7, fs3
                  div          s4, t3, s3
                  flt.s        s1, fa4, fs6
                  sltiu        a1, a4, 1776
                  fcvt.s.w     fs10, t6, rup
                  slli         sp, a2, 29
                  fadd.s       fa0, fa4, ft3, rne
                  fcvt.w.s     s8, fs8
                  fsqrt.s      ft3, ft10, rmm
                  addi         s3, a3, 1221
                  mulhu        s0, a0, s8
                  fsgnjx.s     fs2, fa2, ft8
                  fcvt.s.w     ft10, gp
                  srl          a4, t2, zero
                  fadd.s       ft8, ft9, ft6
                  ori          s2, s2, -1425
                  sll          tp, s4, a3
                  fcvt.w.s     s5, ft7
                  fle.s        a6, fs9, ft0
                  mul          s11, a7, t4
                  srai         s11, s11, 14
                  sub          t2, s9, s9
                  div          a2, s2, t0
                  mulhsu       ra, s4, s11
                  feq.s        s10, fs6, ft4
                  fle.s        s0, ft2, ft2
                  fmul.s       ft5, fs1, ft5
                  fcvt.s.wu    fa6, t5, rmm
                  and          a3, a1, a4
                  addi         s5, s6, -238
                  fcvt.w.s     s6, ft0
                  mulhsu       a4, a1, gp
                  auipc        a0, 803945
                  mulhsu       s7, zero, s4
                  fsgnj.s      ft9, fa7, fs2
                  mul          s6, s3, a6
                  fmv.x.w      s10, ft8
                  flt.s        sp, fs7, ft0
                  srl          s6, a2, sp
                  fdiv.s       fs7, fa0, ft6, rne
                  fmul.s       ft4, fs4, fs2
                  and          t6, tp, s3
                  feq.s        s6, fa3, fa2
                  rem          s1, s7, t5
                  slli         a3, s0, 12
                  sub          a3, t5, s3
                  ori          s3, t1, -1121
                  nop
                  xor          a1, t5, t1
                  or           s8, s11, s2
                  nop
                  feq.s        s2, ft1, ft9
                  fmv.w.x      fs0, s1
                  divu         s5, s7, s9
                  fmin.s       ft2, fs2, ft9
                  mul          s9, a5, s7
                  sltu         s6, s8, s4
                  auipc        sp, 354128
                  fle.s        a1, fs8, ft4
                  slli         s6, gp, 6
                  srli         t6, t2, 0
                  fclass.s     s1, ft3
                  fcvt.s.wu    fa6, t0, rdn
                  fmax.s       ft10, ft4, ft7
                  andi         a7, a3, 2037
                  andi         t2, s3, 1006
                  or           s3, s1, s7
                  srai         zero, t3, 4
                  fcvt.s.w     ft7, s9
                  mulhsu       s9, s0, s11
                  sra          t2, t5, s6
                  mul          s5, tp, a4
                  sub          t6, ra, t5
                  srl          a0, t3, s1
                  andi         s0, a0, 1972
                  srli         s7, s11, 2
                  flt.s        zero, ft2, ft4
                  sra          s6, s7, t1
                  srai         s10, t5, 1
                  fmv.w.x      ft0, a7
                  fsqrt.s      fs7, fs3
                  fsub.s       ft11, ft9, fa3, rne
                  fdiv.s       fa3, fs11, ft10, rup
                  xori         t2, s8, -689
                  fmul.s       fs11, fs6, fs7, rup
                  fle.s        sp, ft10, fs8
                  mulhsu       s1, sp, s6
                  fmv.w.x      fa4, s3
                  fclass.s     gp, fs2
                  sltu         s9, s6, s10
                  sltiu        a6, s1, 1561
                  mulhu        s11, a1, t5
                  fsqrt.s      ft0, fa1, rtz
                  lui          gp, 183360
                  andi         s10, s3, -1256
                  fsqrt.s      fs10, ft10
                  fclass.s     t6, fs10
                  fcvt.wu.s    s5, fs10, rne
                  srl          s11, a7, t1
                  fcvt.s.w     ft11, a7, rdn
                  slli         s9, t6, 2
                  srai         ra, t0, 21
                  add          s4, ra, s0
                  fmul.s       fs11, ft10, ft6, rmm
                  fcvt.s.w     fs1, a3, rne
                  srl          t4, t3, a0
                  fsgnjx.s     fa5, fs0, fs6
                  xor          t0, s5, s0
                  fsub.s       fs11, ft5, fs6
                  lui          tp, 840201
                  fmv.w.x      fa7, a0
                  addi         tp, s1, -1459
                  andi         a2, a4, -1573
                  xor          t2, ra, a5
                  fsqrt.s      fs9, fa4
                  slt          sp, a2, s7
                  sll          s6, zero, s10
                  andi         t5, t6, -1002
                  andi         s7, s2, 405
                  sub          a3, a7, a1
                  slli         gp, sp, 8
                  auipc        a1, 339043
                  ori          s7, a5, -1315
                  fmv.x.w      s8, fa1
                  fmv.x.w      ra, fa3
                  fdiv.s       ft1, fs0, ft10, rtz
                  fmul.s       ft6, fs11, fs4
                  or           s10, s2, s3
                  fcvt.s.w     fa1, zero, rdn
                  fle.s        a1, fs1, fa3
                  fcvt.wu.s    s6, fs10, rne
                  fle.s        t6, fa6, fs9
                  sltu         a0, t2, a1
                  fsgnjx.s     fs11, ft11, ft5
                  andi         s11, a3, 526
                  mulh         sp, s6, s0
                  flt.s        a1, fs9, fa1
                  mulhu        gp, s5, a6
                  and          a1, a1, ra
                  remu         s5, t4, t3
                  sll          s5, a6, sp
                  add          t2, s9, s0
                  fclass.s     s7, ft7
                  sltu         a3, s0, s9
                  fmv.x.w      s7, ft4
                  fcvt.wu.s    a1, fs8
                  xori         a6, s6, -1456
                  fmv.x.w      s10, fa2
                  slti         s11, s1, 2015
                  mulhsu       a6, ra, t6
                  lui          t5, 625340
                  fcvt.wu.s    t6, fs6
                  nop
                  fadd.s       fs9, fa4, fa7
                  fmul.s       fa6, fa0, fa4
                  add          s3, a0, a5
                  add          t0, a0, a7
                  fcvt.s.wu    ft9, a7, rmm
                  fmax.s       fs3, fa2, ft0
                  add          a1, s7, a4
                  lui          s7, 526730
                  or           zero, t3, s1
                  divu         ra, a1, zero
                  mulhu        s7, t3, t6
                  sll          a1, s6, s7
                  fsgnjx.s     fa4, fa7, fs6
                  fdiv.s       fs7, fa3, ft4, rdn
                  srl          s0, s10, s7
                  auipc        zero, 54393
                  flt.s        s2, ft10, fs10
                  fsqrt.s      fs6, fs11, rdn
                  add          s7, t4, a2
                  add          s10, a4, tp
                  divu         a2, s7, a7
                  xori         s10, t0, -1313
                  fdiv.s       ft4, ft8, fa0, rdn
                  srli         s4, ra, 21
                  sltiu        a4, tp, 642
                  addi         t4, s4, -342
                  and          a4, a7, gp
                  fdiv.s       ft11, ft4, ft1
                  fle.s        s6, fs8, fa7
                  srli         ra, s5, 24
                  srai         s6, s10, 15
                  div          t6, a3, t1
                  fsgnjn.s     fa7, ft1, fa0
                  nop
                  fmv.x.w      tp, fa3
                  fsgnjx.s     ft3, fa4, ft4
                  srli         a0, a7, 4
                  fsgnjn.s     fs0, ft11, fs8
                  lui          a4, 909753
                  fcvt.s.wu    fs9, t0
                  srli         s0, t0, 0
                  fle.s        s6, fa2, fs0
                  fmin.s       fs1, ft11, fa2
                  fmv.x.w      gp, fs5
                  sub          gp, t1, sp
                  auipc        s4, 910882
                  fsgnj.s      fa0, ft9, ft3
                  auipc        s11, 863197
                  fcvt.wu.s    a1, fs6, rmm
                  slt          t6, t3, sp
                  fcvt.s.w     ft8, s0
                  fmin.s       fs7, ft5, fs3
                  fclass.s     s1, fs6
                  fdiv.s       fs11, fa2, fs0, rdn
                  fsgnj.s      fa7, ft7, fa1
                  slt          a3, t1, a3
                  fmv.x.w      s5, fs9
                  xor          t2, a4, s11
                  fsgnj.s      ft4, fs11, fs2
                  fcvt.s.w     fa3, t6, rne
                  fcvt.s.w     ft2, a7, rup
                  andi         t6, s7, -354
                  fcvt.s.wu    ft4, s10
                  fsqrt.s      fs4, fs8, rdn
                  fcvt.wu.s    s8, ft11, rdn
                  srli         s5, t2, 21
                  or           tp, s1, t1
                  slt          a0, gp, a2
                  fmv.x.w      gp, ft1
                  add          s4, a0, s8
                  divu         a4, ra, s3
                  and          a1, s2, gp
                  fsgnjx.s     ft8, fa0, fs11
                  sltu         t4, a0, t4
                  slt          a6, t3, s1
                  fsub.s       fs4, fa0, ft2, rdn
                  lui          zero, 225575
                  srai         s4, gp, 1
                  fcvt.w.s     a1, fs5
                  feq.s        a7, fs0, fa6
                  fcvt.w.s     s3, fs2, rmm
                  addi         s5, s7, 842
                  fmax.s       fa1, fs5, ft3
                  fsub.s       ft0, fs0, fa4
                  fcvt.s.wu    ft8, s9, rtz
                  fsqrt.s      fa3, ft11
                  slti         s7, s5, -1455
                  sub          s11, sp, a7
                  sltiu        a0, s7, 1520
                  addi         a6, tp, -387
                  fmv.x.w      a0, ft1
                  fsqrt.s      fs0, ft6, rup
                  fmin.s       ft0, fs9, ft11
                  sll          gp, t4, s11
                  fcvt.s.w     fa3, a5
                  fcvt.s.wu    fa2, t0
                  fmul.s       ft10, ft10, fs9
                  andi         t2, gp, -503
                  mulhsu       a6, a2, ra
                  remu         a3, a1, tp
                  divu         s5, a6, t0
                  slti         sp, s4, 991
                  fmv.w.x      fs4, s9
                  fmin.s       fs1, fs11, fa3
                  remu         zero, gp, t5
                  fcvt.s.wu    ft7, s7
                  divu         t4, t2, a1
                  rem          s8, t5, zero
                  fmin.s       fa5, fa0, ft10
                  fadd.s       fa7, fs3, fs7, rtz
                  divu         s1, a1, ra
                  fle.s        s4, ft7, ft4
                  fdiv.s       ft0, fs0, fs5, rmm
                  andi         s2, s3, -1835
                  fcvt.w.s     a6, fa0
                  auipc        gp, 713156
                  fcvt.w.s     t2, fs10, rne
                  sltiu        a1, a4, 1444
                  fcvt.s.w     fs1, s9, rdn
                  fcvt.s.wu    fa0, a0
                  fmin.s       fs3, fa5, fs1
                  slti         s11, t5, 373
                  addi         s9, s8, -1578
                  fmin.s       ft2, fs2, fs7
                  andi         a1, s8, 1904
                  fsqrt.s      fa1, fs6
                  xor          t4, s2, s0
                  addi         sp, t5, -1076
                  sub          s0, s3, s11
                  mulhsu       s8, a6, s1
                  add          t2, a6, a4
                  mulhsu       s10, a1, t2
                  fsgnj.s      ft8, fa5, ft8
                  fle.s        tp, ft8, fs10
                  fsgnjn.s     fa0, ft6, fa3
                  xor          t4, t6, a5
                  fcvt.s.wu    ft11, t6, rne
                  xor          a6, a5, s2
                  fsgnjn.s     fs9, ft8, fs2
                  fcvt.s.w     fs5, a7, rtz
                  mulh         s0, s7, t5
                  fdiv.s       ft6, fs5, fs5
                  addi         s0, a0, 1698
                  srl          s1, s5, tp
                  feq.s        a2, fs4, ft4
                  sll          s5, s10, s11
                  mulhsu       a1, t3, s9
                  rem          sp, t1, s1
                  fsgnj.s      fs7, ft3, fa3
                  flt.s        s6, fa0, fs3
                  sltiu        s2, t0, -1005
                  rem          s6, t0, a5
                  andi         ra, s2, -363
                  feq.s        tp, ft3, ft3
                  sra          s10, t4, s2
                  fle.s        a2, fs8, ft1
                  sra          t0, t3, t2
                  fsub.s       ft3, ft11, fa6
                  mulh         a4, a7, a6
                  fcvt.wu.s    t4, fs10
                  andi         s6, t2, 1928
                  fle.s        s10, fs1, ft3
                  fmul.s       fs10, ft11, ft9, rup
                  sltu         s7, s7, a0
                  mulh         a6, s9, t4
                  sltiu        tp, s4, -524
                  sltu         t6, ra, s6
                  sltiu        a0, s1, 1885
                  slti         t4, a2, -1257
                  sll          zero, t0, a2
                  sra          t2, t1, s7
                  fcvt.wu.s    a3, fs9, rmm
                  srl          s3, a5, t0
                  fle.s        a0, fs5, ft8
                  mulh         s8, s11, a6
                  lui          s10, 723914
                  fsub.s       fs4, ft3, fs7, rtz
                  feq.s        a6, fs3, fa5
                  fcvt.s.wu    ft1, a5
                  sltu         t0, a4, t2
                  sra          s7, a5, t3
                  fsub.s       fs2, fa5, fs0, rdn
                  fsgnj.s      fs6, fa5, fa2
                  fsub.s       ft4, fa1, fs6, rdn
                  auipc        t2, 656967
                  slti         s8, a7, -2034
                  flt.s        s8, fs11, fa6
                  fsgnj.s      fs2, fs11, ft7
                  mul          s3, s7, gp
                  xori         a4, s5, -1254
                  fcvt.wu.s    s0, fa5, rdn
                  fcvt.s.w     fa6, a4, rdn
                  fadd.s       ft2, ft2, fa6
                  flt.s        a0, fs8, fs9
                  ori          zero, s4, -977
                  feq.s        gp, fa0, fa7
                  remu         t0, t3, t0
                  and          s5, s2, a7
                  remu         a3, tp, sp
                  srli         s5, s10, 1
                  ori          s0, zero, -1661
                  fsgnjn.s     ft3, ft3, ft1
                  add          a3, a0, t5
                  nop
                  slli         t0, a4, 6
                  lui          s2, 739569
                  fmul.s       ft4, ft10, ft5, rdn
                  fle.s        s4, fs11, ft4
                  fmin.s       fa3, fa1, fs11
                  fmul.s       fs2, fa3, fs11, rtz
                  lui          tp, 184877
                  rem          a0, s6, tp
                  sltu         s5, t5, a3
                  nop
                  sub          a3, s5, a0
                  remu         s8, a0, s3
                  sltu         t2, t4, s3
                  lui          a2, 110382
                  srai         s0, t6, 6
                  auipc        ra, 502145
                  slli         t0, sp, 31
                  xori         a7, t6, 1407
                  fadd.s       fs2, ft0, fs6
                  fadd.s       ft3, fa0, fs5, rtz
                  ori          a3, t1, -849
                  fmul.s       fs7, fa3, fa2, rne
                  divu         s7, tp, t4
                  srai         s7, s8, 22
                  sll          a2, a6, a3
                  andi         ra, sp, 1177
                  fmax.s       ft2, fs11, fa7
                  srai         a2, tp, 3
                  mulh         a6, s10, t3
                  add          sp, s4, s7
                  sltu         s10, t3, ra
                  fcvt.w.s     a6, fs3, rup
                  add          s10, s6, t6
                  slt          a7, a0, s2
                  sub          a6, tp, a5
                  fmul.s       ft3, fa3, fa0, rtz
                  feq.s        a0, fs11, fa1
                  slli         t0, a5, 4
                  fmv.x.w      a3, fs1
                  or           a1, t5, t6
                  slti         sp, t6, 523
                  fcvt.wu.s    a4, ft0
                  xori         a2, t3, -1287
                  xor          tp, s2, t5
                  fsqrt.s      ft8, fa5, rtz
                  slli         gp, s9, 11
                  slti         s6, a7, 1908
                  auipc        gp, 320511
                  fsgnj.s      fa0, ft3, fa4
                  ori          a2, s8, 1774
                  fadd.s       ft2, fa5, ft8
                  fcvt.wu.s    t4, fa5
                  srli         a7, a2, 16
                  fsgnjx.s     fs11, fa4, fs3
                  slt          s7, a1, s1
                  sub          s2, ra, tp
                  add          a2, s4, s7
                  slti         s6, a5, 358
                  feq.s        s10, fs6, fa2
                  mulhu        t4, a2, s4
                  mulhsu       s11, t4, s2
                  slti         s3, s11, -4
                  fdiv.s       fs9, ft0, fs0
                  and          sp, ra, s4
                  fle.s        s4, ft4, fa6
                  fsgnjn.s     fa5, ft6, ft11
                  mulh         s4, s3, tp
                  feq.s        s6, ft10, ft0
                  fmax.s       fa6, fs1, fs2
                  remu         s9, s2, t1
                  ori          t2, s10, 1958
                  fmin.s       ft6, ft2, fs4
                  flt.s        t5, fs1, ft6
                  srli         s7, t3, 14
                  fsgnjn.s     fs4, ft4, fa3
                  auipc        tp, 660610
                  rem          t4, a0, t5
                  ori          s6, a0, -969
                  fclass.s     a4, fs1
                  fdiv.s       fs4, fa3, fa1, rdn
                  flt.s        s6, ft11, ft6
                  ori          s2, a2, -1873
                  sub          a1, t6, t5
                  sll          s1, a4, a1
                  flt.s        s1, ft7, ft11
                  fcvt.s.w     fs5, s3
                  auipc        gp, 571320
                  fsub.s       fs11, fs0, fa5
                  and          a2, zero, t0
                  slli         s9, t0, 23
                  sll          t0, t0, ra
                  fsgnj.s      ft8, ft9, ft4
                  fsgnjn.s     ft7, ft7, ft3
                  fmv.x.w      t6, fs5
                  fmv.x.w      t6, fa0
                  fsqrt.s      ft8, fa0
                  xori         ra, t5, 225
                  rem          s1, s5, a6
                  xori         sp, s0, -1995
                  remu         sp, t4, a7
                  lui          s2, 148093
                  fsqrt.s      fs5, fa4, rdn
                  mulhu        sp, sp, t1
                  fmin.s       fa5, fa3, ft7
                  nop
                  fdiv.s       fs0, ft10, ft2, rmm
                  sltiu        s10, s10, 596
                  addi         t0, a7, -1422
                  fmin.s       fs0, fs3, fa6
                  xori         s7, a7, 1953
                  sltiu        a0, t3, 1435
                  fsqrt.s      ft6, ft1, rtz
                  fcvt.s.wu    ft0, s7
                  mulh         s1, ra, a0
                  fsgnjx.s     fa2, fa0, ft3
                  srli         s0, t4, 29
                  lui          s1, 1027504
                  slli         s11, s4, 3
                  fmv.w.x      fs8, gp
                  fclass.s     sp, fs4
                  fmv.x.w      tp, fs2
                  sra          a4, a2, a3
                  auipc        s1, 870931
                  sub          t6, sp, a0
                  fmv.w.x      fs10, t0
                  slli         a7, t4, 4
                  srl          a4, a2, s10
                  slt          a1, a6, s9
                  fcvt.wu.s    a7, fs9
                  srl          s11, s4, t5
                  flt.s        s7, fs5, fs9
                  sra          a0, t0, s9
                  remu         s7, s5, s0
                  fmv.x.w      a7, ft11
                  add          a3, a0, s6
                  sltu         s3, s8, a2
                  sltu         t6, t3, a7
                  sltiu        a2, s1, 288
                  flt.s        a0, ft11, ft8
                  mulhu        s6, s10, t2
                  fcvt.w.s     s11, fa4, rup
                  fmax.s       ft8, ft4, fa1
                  fsqrt.s      fs3, fs6, rup
                  slti         s3, gp, -1314
                  fmv.x.w      s0, fa2
                  sltiu        s5, zero, 397
                  sll          a0, s3, gp
                  fdiv.s       fa4, fa7, fa7, rup
                  sra          tp, s4, a5
                  sra          a0, t1, t2
                  fsqrt.s      fa2, ft7, rmm
                  fmv.w.x      fs8, zero
                  slli         a0, a5, 18
                  ori          s2, s7, -1267
                  fmv.x.w      t0, fs4
                  remu         a1, s2, a2
                  fsgnjn.s     ft8, ft7, ft10
                  andi         a6, t2, -55
                  fcvt.s.wu    ft6, t1
                  slti         t0, a7, -44
                  divu         t5, s6, s5
                  rem          t4, t5, a3
                  and          t0, a2, s8
                  remu         s10, s9, t0
                  xor          s7, s0, t6
                  fmin.s       fa2, fs4, ft2
                  srli         s5, sp, 21
                  xori         a2, a5, -991
                  fcvt.wu.s    tp, ft11, rtz
                  fdiv.s       fs1, ft0, fa4
                  fadd.s       fs1, fs11, ft6
                  nop
                  slti         a3, s11, -357
                  or           zero, s4, s8
                  remu         t5, a5, a4
                  andi         gp, t2, -351
                  sub          s10, sp, s10
                  auipc        a7, 750791
                  slt          s10, gp, a4
                  sll          s5, a7, ra
                  fdiv.s       fs7, fs9, fa7, rne
                  srai         t6, s6, 6
                  fcvt.s.w     ft0, t3, rne
                  divu         a4, a0, sp
                  fsgnj.s      ft0, ft10, ft9
                  sub          s8, s10, s11
                  andi         s0, a0, -175
                  flt.s        t5, fs9, fs9
                  auipc        a3, 582263
                  mulhsu       s6, t6, t3
                  fsqrt.s      fs5, fa3
                  andi         t2, t0, 1673
                  fmul.s       fa1, fs7, ft10
                  fadd.s       ft1, ft5, fa7, rne
                  or           zero, a0, a6
                  sra          s9, a2, a5
                  fcvt.s.wu    fa0, t6, rdn
                  sltiu        ra, s8, -1584
                  fcvt.wu.s    t0, fa7, rmm
                  fmv.w.x      ft1, s0
                  slt          a1, sp, tp
                  fcvt.w.s     tp, ft10, rtz
                  rem          s6, s3, ra
                  and          s3, a6, t1
                  mul          t0, a4, s7
                  srli         t0, sp, 10
                  fsgnj.s      ft5, fa7, ft4
                  and          t4, a3, s10
                  fmv.w.x      fs0, s11
                  auipc        s0, 122417
                  srli         t2, s2, 7
                  ori          t2, t3, 506
                  fsub.s       fs3, ft9, fs11
                  fmv.x.w      a7, ft11
                  divu         s8, sp, s5
                  feq.s        sp, fs3, ft8
                  sub          s11, s0, s5
                  rem          t4, s0, s8
                  nop
                  ori          s8, s0, -603
                  fcvt.s.wu    fs8, t1, rmm
                  fclass.s     s5, fa0
                  mulh         ra, s10, s1
                  fle.s        tp, fs3, fa7
                  add          s3, a0, s9
                  flt.s        s1, ft5, fa4
                  fmv.w.x      fa6, t2
                  fdiv.s       ft3, ft8, fa2, rup
                  fcvt.s.w     fa1, a0, rmm
                  mul          s2, t1, s9
                  div          a2, t2, s4
                  fmax.s       ft9, ft5, fa6
                  mulhsu       gp, s11, t0
                  fmin.s       ft5, ft8, fs10
                  fsgnjn.s     fs5, ft6, fa7
                  slli         a3, s10, 24
                  fmul.s       ft11, ft5, fa1
                  div          s1, s3, s7
                  rem          a6, zero, s4
                  fmax.s       fa3, ft10, ft3
                  and          gp, t5, zero
                  andi         s0, t0, 1998
                  srl          s7, a7, s1
                  fsgnj.s      fs10, fa2, ft11
                  and          gp, sp, t5
                  mulhsu       s5, t6, s4
                  fle.s        s0, fa7, ft1
                  fmax.s       ft0, fs11, fs7
                  feq.s        gp, ft11, ft4
                  and          s8, t3, t5
                  fmul.s       ft11, fa1, fs10
                  fmul.s       ft9, ft4, fa5, rmm
                  ori          s4, a2, 1289
                  feq.s        gp, fs10, fs3
                  or           s6, s2, tp
                  add          a7, s3, s7
                  fcvt.w.s     ra, ft2
                  fmin.s       ft0, fa7, fs5
                  fsgnj.s      ft4, ft1, ft5
                  sll          s11, gp, a4
                  or           t2, ra, t1
                  fmin.s       fs5, ft5, ft11
                  slti         gp, t6, 185
                  feq.s        s11, fa4, fa3
                  srai         t6, tp, 0
                  slli         a1, gp, 20
                  ori          s2, t0, -1395
                  divu         s6, s5, a0
                  fmv.x.w      a0, ft10
                  xor          a1, a2, s6
                  add          s8, a3, s3
                  xori         s0, a2, -221
                  sltiu        s8, sp, -1088
                  fmv.x.w      s2, fs9
                  fmul.s       fs5, fa2, ft3
                  feq.s        t5, fs1, fs5
                  mulh         s2, s9, s1
                  mulh         s2, a1, t6
                  fmax.s       ft5, ft7, fa4
                  sub          gp, t5, t1
                  fmax.s       fs0, fa6, fs7
                  flt.s        s9, ft7, ft4
                  srai         ra, a2, 16
                  fdiv.s       fs2, ft9, ft5, rdn
                  slli         a6, gp, 2
                  flt.s        a2, fs6, fa2
                  or           t5, a4, a0
                  fcvt.s.wu    fs4, t1
                  lui          s8, 443388
                  add          a2, s7, s6
                  remu         gp, a1, s9
                  xor          s8, s6, a2
                  slti         s4, s2, -815
                  fle.s        sp, fs1, fa0
                  fle.s        ra, ft1, ft11
                  nop
                  remu         s7, a3, a6
                  div          gp, t1, s2
                  nop
                  slt          s9, s9, t5
                  slt          s0, t4, zero
                  fsub.s       fs5, fs2, ft6, rup
                  fdiv.s       fs4, ft11, fs11, rup
                  srai         a1, t6, 28
                  sltiu        s6, s1, 1296
                  feq.s        t2, ft8, fa0
                  andi         a1, s3, 58
                  fclass.s     t2, ft0
                  xor          s0, s11, a5
                  fcvt.s.wu    fs1, s0
                  auipc        s2, 803315
                  mulhsu       a4, t3, t6
                  ori          s3, a0, 520
                  fmv.x.w      s5, fs2
                  fsgnj.s      ft6, fa4, fa3
                  fmin.s       fs5, fa3, ft10
                  fmul.s       fa7, fs9, ft5, rne
                  sltu         s9, s2, t3
                  sub          s11, zero, gp
                  lui          a3, 926622
                  rem          s6, ra, s9
                  fclass.s     a2, fs4
                  slti         s8, t5, 305
                  mulhu        t2, tp, t0
                  flt.s        t5, fs10, fs10
                  fmv.w.x      ft7, s3
                  lui          t0, 799370
                  sra          s5, t3, zero
                  fcvt.w.s     sp, fa6, rmm
                  sub          ra, s7, s7
                  srai         s4, a4, 9
                  fmv.w.x      ft0, a4
                  srli         s8, t1, 19
                  fsgnjn.s     fa6, fs0, fs6
                  feq.s        tp, ft5, fs1
                  lui          a4, 16433
                  fdiv.s       ft3, fa5, ft3
                  mulhu        a0, gp, a6
                  fsgnjn.s     fs11, fa6, fa7
                  lui          s10, 248515
                  ori          t4, a5, 1272
                  srl          sp, s3, t4
                  fmv.x.w      a3, fa3
                  slti         s9, t5, -252
                  fle.s        s6, ft6, fs11
                  lui          a7, 647319
                  fsgnjn.s     fs5, fa5, fs11
                  fsgnj.s      fs10, fa4, fs6
                  sltu         s7, s4, zero
                  fsgnj.s      fs1, fs6, fs6
                  or           a6, a1, s11
                  fcvt.s.wu    fs0, s0
                  mulh         s6, ra, s4
                  andi         zero, s0, 1270
                  add          gp, a6, a2
                  fadd.s       ft0, fs6, fs3, rtz
                  fsub.s       ft4, fs9, fa7, rmm
                  mulhsu       t5, s7, s0
                  fclass.s     a0, ft5
                  fmv.w.x      fs9, sp
                  feq.s        gp, fa2, ft7
                  and          a4, gp, s10
                  sub          a3, t5, a4
                  fsqrt.s      fs7, fs4
                  slli         s1, t5, 9
                  xori         s9, a3, 254
                  or           s7, t3, t0
                  srai         t2, a6, 15
                  sltu         sp, s9, s6
                  or           a7, tp, t1
                  fcvt.s.wu    fs5, tp, rne
                  sub          a2, a7, s8
                  fclass.s     a0, ft4
                  divu         s5, s8, t3
                  srli         s11, t2, 1
                  fmv.w.x      fa4, s9
                  srai         a2, a2, 11
                  fsgnjn.s     fa7, ft7, fa5
                  fmv.w.x      fs3, s4
                  mulhsu       gp, ra, t3
                  divu         ra, t6, t1
                  fdiv.s       fs2, fa5, fs2
                  srl          s4, a6, s5
                  auipc        s6, 275232
                  mulhu        a1, s1, s4
                  nop
                  auipc        a2, 557566
                  and          s4, a1, s9
                  slli         s0, a0, 5
                  sltiu        zero, s5, 116
                  sub          a2, t2, s1
                  sub          s0, t5, s6
                  fsqrt.s      fs3, fa1
                  slli         tp, s8, 27
                  fclass.s     s4, fs4
                  fsqrt.s      ft6, fa0
                  nop
                  add          t4, t6, s6
                  addi         tp, s3, -39
                  fcvt.s.w     ft9, s3, rdn
                  fmv.w.x      ft4, s4
                  andi         tp, s5, -723
                  lui          s4, 1005312
                  fcvt.wu.s    tp, fs0
                  fle.s        t6, fa2, ft0
                  flt.s        gp, ft5, fs4
                  sltu         a7, s3, s8
                  lui          s1, 675209
                  andi         t6, a5, 254
                  slt          s1, s2, a3
                  fdiv.s       ft6, fa1, fa0, rtz
                  flt.s        s4, ft7, ft9
                  fcvt.s.w     ft9, t4
                  mulhu        s4, s2, s10
                  srli         s11, t5, 7
                  flt.s        zero, ft5, ft3
                  flt.s        s5, fa2, ft9
                  fcvt.w.s     t6, fs4
                  fdiv.s       fa7, ft0, fs10
                  mul          s5, s2, ra
                  mulhu        s7, s2, s6
                  fsgnj.s      fs3, fs6, fa0
                  rem          zero, t0, t1
                  fclass.s     a0, fa7
                  flt.s        ra, fa2, fs2
                  and          a0, s2, a2
                  srli         a0, t3, 2
                  fcvt.wu.s    t5, fs0
                  divu         s4, s11, t5
                  sub          a1, s5, s10
                  flt.s        s8, fs8, fa4
                  auipc        s7, 434196
                  andi         s0, s8, 1734
                  fsgnjn.s     ft5, fa5, ft8
                  ori          s3, sp, 741
                  fsub.s       fs4, ft7, fs8, rdn
                  fmv.x.w      gp, fa2
                  fclass.s     ra, fs7
                  fdiv.s       fs10, fa1, fs8, rdn
                  fsub.s       fs10, fs10, fs9, rtz
                  fmax.s       fa6, fa4, fs10
                  xori         s5, t5, 476
                  sub          sp, a3, t6
                  add          s4, t5, a7
                  remu         s4, s2, s9
                  nop
                  fsub.s       ft4, ft2, fs10
                  feq.s        s10, fa6, ft1
                  remu         t0, s3, a0
                  xor          s6, t5, t3
                  xor          tp, s2, s0
                  feq.s        t2, fs7, fs2
                  fsub.s       ft7, fs6, ft11
                  mulh         s2, s11, s1
                  andi         a1, tp, -65
                  srai         s1, a3, 2
                  mulhsu       s7, t4, s1
                  flt.s        zero, fs5, fs2
                  rem          ra, a3, s11
                  fmv.x.w      s8, fs9
                  fsgnjx.s     fs1, fa3, ft5
                  sra          s6, a4, s0
                  divu         a6, s5, ra
                  fdiv.s       ft1, fs11, fs4, rne
                  mulhu        a1, t4, s3
                  or           s2, gp, s0
                  lui          t0, 827330
                  fcvt.w.s     a4, fa2
                  mulhsu       s8, a6, ra
                  fsgnjx.s     fa6, fs3, ft11
                  srai         s5, zero, 12
                  fsgnjn.s     fs7, ft3, ft6
                  sra          t0, s11, s10
                  andi         a2, a0, 1510
                  rem          tp, t6, t4
                  fsub.s       ft3, ft4, ft2, rne
                  sltu         a7, t3, a6
                  lui          s0, 468759
                  divu         s6, s4, s9
                  slli         s7, a4, 22
                  and          s1, gp, s8
                  sll          s0, t4, t5
                  ori          s2, sp, -250
                  mulhsu       ra, a0, tp
                  divu         ra, s10, a6
                  fsgnjx.s     fa2, fa5, fs5
                  fcvt.s.wu    ft5, s9, rtz
                  slli         sp, s3, 21
                  fcvt.w.s     t0, ft0
                  sltu         s8, a5, t1
                  andi         s5, t2, 101
                  flt.s        s0, ft9, ft4
                  xor          gp, s3, s0
                  fmax.s       ft6, fa5, fs10
                  remu         a3, s11, a4
                  fsub.s       fs4, ft10, fs8, rup
                  flt.s        s3, fa0, fs11
                  or           a2, a7, s5
                  xor          a3, a0, a5
                  div          t5, tp, s11
                  fmul.s       ft6, ft9, fs3, rdn
                  fcvt.s.w     fs3, t4, rdn
                  srli         s1, s11, 10
                  fsgnjn.s     ft5, fa7, fs1
                  ori          a1, t2, -978
                  fsub.s       fs4, fa7, fs4, rdn
                  xori         t4, a4, 2029
                  fclass.s     s10, ft2
                  fmin.s       ft9, ft0, ft1
                  sltu         s3, s9, t3
                  slti         s2, s11, -698
                  sltu         s10, tp, t3
                  rem          t5, t6, zero
                  fcvt.s.wu    fa6, t5
                  fcvt.s.w     fs8, t3, rup
                  addi         gp, a7, -225
                  rem          a2, zero, s10
                  srl          t6, t4, s9
                  addi         t4, s5, -655
                  sub          t0, a3, t0
                  srl          a1, s0, t0
                  slti         s4, s6, -816
                  add          s10, s7, a4
                  srli         s8, s10, 1
                  fsgnjn.s     fs4, fs5, fs2
                  add          a1, t6, t2
                  slt          s7, s5, a3
                  addi         sp, zero, -1287
                  fdiv.s       ft4, fa7, fa6
                  fmv.x.w      s5, fs2
                  sltu         gp, s5, a4
                  slti         t0, zero, 630
                  sra          s11, ra, a0
                  sltiu        t2, t0, 1323
                  slli         tp, s0, 6
                  srli         t5, s4, 18
                  feq.s        a0, fs2, fa3
                  andi         gp, s9, 1093
                  fsqrt.s      fa4, fa7, rne
                  sra          t6, ra, s2
                  fmax.s       fa5, fa7, fa5
                  fcvt.s.wu    ft5, s8, rdn
                  or           sp, a0, t4
                  remu         a0, sp, s9
                  mulhsu       a2, s9, tp
                  or           t4, t5, s6
                  div          s1, a1, s0
                  rem          s8, s1, ra
                  fmv.x.w      s5, fa3
                  slti         s0, gp, -1287
                  add          a3, a4, s0
                  xor          zero, t0, a5
                  fle.s        s10, fs1, ft4
                  fcvt.w.s     a2, fa2, rtz
                  fmul.s       fa3, fs9, fs5
                  sll          a6, s8, s2
                  fmv.x.w      s6, fs4
                  fcvt.w.s     gp, fa4
                  div          gp, t2, tp
                  fsqrt.s      fa1, ft10
                  andi         t5, a7, 1175
                  auipc        a2, 914099
                  fmv.x.w      s6, ft0
                  andi         s8, a5, 453
                  flt.s        a7, ft6, ft0
                  and          s9, a4, a0
                  fmul.s       fs4, ft9, fs4, rne
                  andi         s4, s4, -2006
                  fsgnj.s      ft10, fa4, fs5
                  slt          s7, s3, t5
                  feq.s        s3, fs9, fs7
                  xori         t5, s6, 469
                  fcvt.s.w     fs2, s7
                  fmin.s       ft2, fs5, fs0
                  addi         s1, a6, -502
                  addi         zero, t3, 1873
                  slt          s10, t1, s3
                  slt          s8, t1, a7
                  xori         s7, t6, -257
                  feq.s        a3, fs6, fs7
                  fle.s        tp, fs9, fs6
                  auipc        s0, 876922
                  fsgnjx.s     fs3, fs10, ft10
                  fmax.s       ft7, ft4, fs6
                  srl          a0, s4, t4
                  xori         a3, a7, -445
                  div          s3, a2, a5
                  add          ra, zero, s6
                  lui          gp, 630257
                  lui          s11, 1002573
                  sll          t5, ra, s10
                  fadd.s       fs11, fs7, fs9
                  slti         s10, t4, -94
                  auipc        a2, 365265
                  add          s8, a7, a3
                  xori         gp, s3, -1722
                  add          s3, t3, s5
                  or           t0, a6, t3
                  fcvt.wu.s    a7, ft5, rdn
                  add          s11, s9, s1
                  sll          s6, t1, zero
                  rem          t6, s2, t5
                  divu         a4, t0, s6
                  sub          s2, ra, s1
                  fle.s        t4, ft11, fa3
                  sll          s2, s4, s10
                  fsgnjx.s     ft6, ft0, ft4
                  flt.s        s10, ft1, fa6
                  and          s0, zero, a1
                  ori          s1, a6, -941
                  srl          t5, t0, s7
                  feq.s        a7, fs10, fs4
                  fsgnjn.s     fa7, fs6, fa0
                  slli         t4, a2, 27
                  sltu         s10, a2, tp
                  slli         t2, a5, 25
                  fsgnj.s      fs10, fs11, fa1
                  fmax.s       fa3, fa0, ft4
                  fcvt.s.w     ft2, s3
                  remu         a6, t5, s3
                  fmul.s       fa7, fa5, fs3, rtz
                  fsub.s       ft6, fs4, fa0
                  sub          s9, a0, gp
                  mul          s10, zero, t3
                  flt.s        gp, ft7, fa3
                  fadd.s       ft4, ft3, ft1, rne
                  sub          s6, a2, a6
                  fsqrt.s      fs11, fa1
                  feq.s        s2, fs8, fs2
                  fmul.s       fs1, fs0, ft2
                  sltu         s3, gp, t0
                  sra          t2, t1, s2
                  feq.s        gp, ft3, fs5
                  fcvt.s.w     fs11, gp
                  fsub.s       fs11, fs0, fs5
                  mul          ra, s5, a1
                  remu         s10, s7, s1
                  fcvt.s.w     fs0, a0, rup
                  div          sp, a7, s6
                  slti         a2, s0, 89
                  flt.s        t5, ft1, fa0
                  sll          a4, s4, s1
                  remu         t0, t4, s0
                  fdiv.s       fs6, fs6, ft4
                  mulhu        ra, s7, tp
                  srli         s4, a7, 30
                  fdiv.s       fa2, ft8, fs10, rne
                  mul          zero, t1, s1
                  fsgnj.s      fa3, ft2, fs11
                  lui          a6, 4288
                  fclass.s     a3, fs10
                  feq.s        a3, fs7, ft0
                  srl          s7, s8, gp
                  fcvt.s.wu    ft1, s4
                  or           s7, tp, a5
                  xor          a0, s3, t2
                  feq.s        a1, fs10, fs6
                  fmv.x.w      s11, fa3
                  slt          t5, s10, tp
                  and          t2, t1, s1
                  slt          gp, a0, s5
                  fsgnj.s      fa5, ft5, ft8
                  mulhu        t0, sp, s6
                  fmv.w.x      ft4, a1
                  lui          a2, 22377
                  nop
                  sub          t6, t6, s9
                  fsgnjx.s     fa2, fs1, fs6
                  fcvt.s.wu    fs7, tp
                  fcvt.w.s     a3, fs4
                  andi         ra, s3, 1928
                  fcvt.wu.s    s10, fa2
                  fsgnjx.s     fa2, ft10, ft0
                  fmax.s       fa6, fs3, fs5
                  auipc        s1, 693822
                  mulhu        a6, tp, s1
                  mulh         t6, a7, s11
                  sub          a0, t2, gp
                  xor          a3, a5, a3
                  andi         a0, s3, 1349
                  fmax.s       fs2, fa3, ft2
                  or           a4, s10, t5
                  fmv.x.w      a7, ft2
                  sub          t0, s0, t6
                  srl          s7, a2, t4
                  srli         t4, s4, 31
                  fsgnj.s      ft2, fa5, ft11
                  fsub.s       ft8, fs5, ft6
                  fsgnjx.s     ft5, fs0, ft0
                  and          sp, s2, a4
                  fcvt.s.w     fs5, s4
                  mul          ra, a0, a4
                  divu         s6, s4, t3
                  fmv.w.x      fs9, t0
                  srl          zero, s6, s9
                  feq.s        s0, ft5, ft7
                  xori         s3, t2, 1688
                  ori          ra, t1, -1780
                  fle.s        t2, fs5, fs11
                  xori         a1, s1, 1254
                  slt          ra, a7, s9
                  mulh         s8, zero, s1
                  mul          s6, t0, a3
                  slt          t4, t3, t3
                  srai         s7, gp, 18
                  fsgnj.s      fa0, fs4, fa5
                  fcvt.s.wu    fs6, t1, rtz
                  fmax.s       fs0, ft2, ft6
                  fmax.s       fa7, fs2, ft7
                  fsqrt.s      fs6, ft8
                  nop
                  andi         t5, gp, 1603
                  fle.s        a1, fs2, fa5
                  fcvt.w.s     t2, fs7, rtz
                  mulh         s1, s6, s7
                  slli         s0, a6, 26
                  fmax.s       ft1, ft8, ft0
                  slt          t6, s2, tp
                  divu         t6, a4, t0
                  fsgnjx.s     fa4, ft4, ft6
                  slt          zero, a4, a1
                  srai         s9, a7, 3
                  rem          a6, a3, s11
                  div          a1, a5, a3
                  mul          s2, ra, sp
                  nop
                  fmax.s       fs5, fs2, fs6
                  lui          t2, 920546
                  mulhsu       tp, a1, t5
                  auipc        s6, 151922
                  fmul.s       ft7, fs1, ft2, rmm
                  or           ra, s8, gp
                  nop
                  fmax.s       fs3, fs8, fa3
                  sra          t6, s7, s0
                  remu         t0, s10, a5
                  sltu         s0, t2, a5
                  sltu         s6, s1, t3
                  feq.s        ra, fa0, ft1
                  sltiu        t6, a7, -2047
                  srli         s4, t5, 30
                  divu         s1, s2, a5
                  div          a0, zero, a6
                  and          t4, t3, s1
                  flt.s        a2, fs5, ft5
                  xori         s8, s7, -274
                  fmin.s       fs10, fs5, fa6
                  remu         zero, s0, a6
                  fcvt.s.wu    fs2, a0
                  mulhu        s5, gp, s1
                  fmax.s       ft8, fs2, ft1
                  xor          gp, s7, a4
                  mulhu        zero, t4, a6
                  addi         s11, t6, -1995
                  remu         a6, a0, s10
                  srli         s1, t2, 4
                  rem          s2, t2, gp
                  feq.s        s9, ft11, fs1
                  mulh         s11, s8, ra
                  srl          s10, s11, t2
                  fadd.s       ft5, fs8, ft8, rne
                  auipc        s10, 247523
                  fle.s        a3, fs11, ft8
                  fdiv.s       fs1, ft3, fa0, rmm
                  slt          s0, gp, t0
                  fcvt.s.wu    fa0, s8, rdn
                  andi         t5, t3, -768
                  fmax.s       ft2, fs7, fs8
                  remu         t0, a6, t5
                  sltu         t6, s7, t6
                  sltu         a2, a1, s9
                  sub          s1, sp, a4
                  sra          a4, s2, t5
                  fsub.s       fs6, ft4, fs0, rdn
                  flt.s        ra, ft9, ft10
                  feq.s        t6, ft3, fs4
                  sltu         a0, a3, s9
                  fcvt.s.w     fa4, s10
                  sub          s11, t4, ra
                  fmin.s       fa0, fa4, ft4
                  fcvt.wu.s    ra, fa7
                  xor          t4, t1, a4
                  mul          sp, s11, s10
                  mul          zero, t3, t6
                  andi         t6, tp, -184
                  and          a3, s1, t4
                  slti         t4, t1, 831
                  remu         s10, s6, s4
                  slti         s9, s9, 786
                  andi         t6, s2, 549
                  mul          s1, s6, t1
                  fcvt.wu.s    s0, fs3, rdn
                  addi         t5, sp, 887
                  sub          tp, s0, s3
                  fsub.s       fs5, ft7, fa4
                  mulhu        t2, a1, a3
                  mulhu        a6, a5, t6
                  and          s9, a4, a3
                  slti         s4, s2, -738
                  sltiu        t6, t3, 1378
                  mulh         a7, s9, s7
                  fcvt.wu.s    s4, ft6, rdn
                  fsgnj.s      ft1, fs0, fs2
                  and          a1, s1, zero
                  fcvt.wu.s    t0, ft2, rdn
                  srl          a2, t1, t6
                  and          a4, sp, a7
                  fdiv.s       fs5, fs6, fa3, rtz
                  fdiv.s       fs6, ft11, fs4
                  fmv.x.w      a1, fs9
                  mulhu        s6, ra, zero
                  feq.s        s8, fs0, fs9
                  srai         a1, a7, 27
                  ori          a0, t6, 1026
                  fdiv.s       fs5, fs11, fa7, rdn
                  sltiu        a1, a2, -1345
                  fmv.w.x      fs7, a3
                  srli         t4, t0, 22
                  xori         s2, s10, -1568
                  srai         sp, a7, 25
                  fsgnj.s      fa0, fs6, ft6
                  sltiu        a0, s3, -967
                  fmv.w.x      fa0, zero
                  sra          a2, zero, ra
                  flt.s        a1, ft0, fa6
                  fmv.w.x      fs6, a5
                  slti         t6, s1, 362
                  fsgnjn.s     ft3, ft3, fa2
                  sra          a0, sp, a6
                  fcvt.s.wu    fs3, tp, rup
                  slt          ra, gp, s2
                  slti         s11, a6, -810
                  mulh         a0, a6, gp
                  or           s10, s3, s11
                  or           sp, s0, zero
                  slt          s0, a4, s4
                  or           s7, s2, tp
                  sll          sp, t1, zero
                  fclass.s     s6, ft5
                  srl          ra, sp, s6
                  slli         zero, s9, 13
                  add          s2, a3, t2
                  xor          t6, s11, t3
                  andi         s7, s7, -1618
                  mul          a3, t0, s0
                  fsgnj.s      fs2, fa2, fs5
                  and          sp, t2, sp
                  sra          a2, s1, ra
                  fclass.s     a4, ft8
                  sll          zero, gp, a3
                  mul          s3, s4, a1
                  fsub.s       fs6, fs1, ft3, rtz
                  fclass.s     s0, ft2
                  fcvt.s.wu    fs7, s3, rup
                  remu         s6, s7, s2
                  flt.s        zero, fs8, fs3
                  fmv.x.w      a4, ft6
                  fsqrt.s      fs3, fs3, rne
                  mulhsu       a0, gp, a6
                  flt.s        a3, fa0, fs0
                  fcvt.s.w     fa1, s11
                  flt.s        s3, ft3, fs5
                  rem          s5, zero, a5
                  fsub.s       fs5, ft10, ft10, rtz
                  fsgnj.s      fs5, fs4, fa5
                  fmv.x.w      a7, fs10
                  fsqrt.s      ft7, fs5, rup
                  ori          sp, s8, 1249
                  divu         a4, s2, s10
                  fsgnjn.s     fs10, ft1, ft8
                  fcvt.s.wu    fs11, t4, rup
                  mulhsu       s6, s0, s6
                  fsgnjx.s     fs5, ft6, fs7
                  flt.s        zero, ft10, fs0
                  add          s10, s9, s6
                  slt          a4, t2, t5
                  sltu         zero, a5, a6
                  sra          s7, t1, a2
                  fle.s        zero, ft9, fs2
                  and          zero, zero, a7
                  mulhu        s3, s10, a6
                  mulhsu       gp, s9, zero
                  fsqrt.s      fs0, fs0, rdn
                  fdiv.s       fs8, fa5, fs6, rne
                  fsgnjn.s     fs11, fs3, fs10
                  fdiv.s       fs3, fa7, fa0, rmm
                  slli         gp, s3, 0
                  fle.s        t5, fa5, ft4
                  fmv.w.x      fa7, zero
                  sra          t4, a5, zero
                  lui          s4, 339400
                  fsgnj.s      fs2, ft2, fa7
                  fmax.s       fs2, fs11, fa4
                  nop
                  xori         t4, t0, 1099
                  slli         t0, s10, 4
                  nop
                  divu         s7, zero, ra
                  div          gp, tp, t1
                  nop
                  fcvt.w.s     s9, fs0
                  fmv.x.w      s10, ft8
                  slti         s1, t2, 76
                  nop
                  srli         s0, t5, 23
                  slli         s0, s11, 20
                  or           a0, t4, a0
                  rem          a0, tp, zero
                  fsqrt.s      fa3, fa5
                  remu         s1, a7, s2
                  remu         a1, ra, t2
                  xori         s2, t6, -335
                  fcvt.s.w     fa1, s3
                  addi         s0, s1, 567
                  fle.s        a6, fs6, fa0
                  and          a2, gp, t3
                  xori         ra, s10, -426
                  andi         ra, t5, -837
                  sltiu        s7, t2, -1623
                  remu         s9, t6, s8
                  sltu         t6, s3, s6
                  fmul.s       fs4, fa0, fs9, rmm
                  slli         s9, t1, 17
                  addi         s11, t3, 380
                  lui          a2, 659609
                  slti         s6, a3, -1111
                  auipc        s3, 125324
                  ori          s0, gp, -94
                  xori         t2, s0, 652
                  mul          a4, a2, s4
                  mul          ra, a0, a3
                  ori          s8, s9, 456
                  fle.s        s6, ft0, fs10
                  fle.s        s5, ft10, fs10
                  lui          s10, 505504
                  divu         a3, s7, s9
                  srai         s9, t4, 27
                  div          s10, s2, s2
                  fsgnjn.s     fs2, fs0, fa4
                  mulhsu       zero, a4, s5
                  flt.s        s4, ft4, fs1
                  mulh         tp, s1, t2
                  fadd.s       fs11, fs0, ft5
                  addi         a0, a5, -1363
                  sub          a6, t0, s0
                  sub          a3, sp, t4
                  mulhsu       s0, a3, zero
                  xori         s7, s10, 1473
                  fmv.w.x      ft0, a0
                  and          t2, t6, a0
                  fsub.s       fs2, fa7, fa3
                  or           a2, a2, a3
                  slli         tp, t1, 17
                  slti         s0, s10, -653
                  fmul.s       ft8, ft2, ft2, rmm
                  fmul.s       ft4, fa0, ft7
                  sll          t2, s0, s10
                  srai         t0, s1, 16
                  xor          s8, gp, s2
                  srl          ra, s0, s6
                  fmv.x.w      t0, ft2
                  remu         a1, t4, s2
                  fclass.s     s2, ft6
                  ori          a4, a5, -891
                  divu         a3, a5, t0
                  slt          a6, t5, t2
                  srai         t2, a5, 11
                  fsgnjx.s     fs4, fs11, fs2
                  and          tp, s9, t3
                  fmv.x.w      a1, fa2
                  slti         t4, s6, 244
                  flt.s        t2, ft8, fs3
                  mulh         s6, s7, s1
                  xor          s5, t5, s5
                  fmul.s       fs1, ft9, fs5, rup
                  fmv.w.x      fa5, s7
                  fsgnjx.s     fs3, ft9, fa6
                  sub          ra, s2, s9
                  rem          t5, s3, t3
                  fsqrt.s      ft7, fa1, rtz
                  mulhu        zero, s0, zero
                  fle.s        s8, ft8, fa4
                  fsgnjx.s     fa4, fa3, fs5
                  fmul.s       fs0, fs5, fa5
                  mulhsu       s9, s10, a5
                  mul          s7, s4, a5
                  divu         a0, a2, a5
                  fcvt.wu.s    s8, fs0, rtz
                  addi         a4, zero, -1536
                  srli         a4, a7, 31
                  fle.s        gp, fs8, ft10
                  sub          t4, t4, t5
                  fadd.s       fs0, fs6, ft4
                  div          s0, t1, s7
                  fclass.s     s2, fs3
                  fsgnj.s      ft6, ft8, ft0
                  sub          s8, a5, zero
                  fsgnjn.s     fa0, fs2, fs2
                  fadd.s       ft2, ft2, fa2
                  sub          tp, s2, s2
                  div          s0, t2, t5
                  divu         t4, s4, zero
                  fadd.s       fa1, ft0, fs11
                  lui          s11, 730351
                  andi         s3, t3, 545
                  ori          gp, t5, -660
                  fmv.w.x      ft11, a7
                  fcvt.wu.s    s5, fa1, rne
                  remu         s0, s11, s3
                  sltiu        s0, s8, -920
                  fcvt.w.s     a2, fs5, rne
                  remu         s6, a4, s5
                  fsgnjn.s     fs10, ft6, fs2
                  sra          a1, a7, a1
                  slli         a1, s6, 16
                  xor          a4, s1, s5
                  sltiu        a0, a5, -1319
                  and          tp, s10, t5
                  sub          s3, s6, a6
                  fcvt.s.w     fs9, s8, rtz
                  addi         t0, a5, -1388
                  fdiv.s       ft2, ft1, fs10
                  nop
                  mulh         t2, a1, s11
                  ori          s8, t3, -999
                  fmul.s       ft5, ft8, ft6
                  fsgnjn.s     fs10, fa5, ft7
                  lui          a0, 34503
                  fadd.s       fs11, fs1, fs6, rdn
                  ori          s3, t0, 1123
                  mul          gp, ra, a7
                  remu         a2, a4, ra
                  fsgnj.s      ft8, fs5, fs6
                  divu         t2, s6, s7
                  slli         s8, t3, 12
                  slli         sp, ra, 30
                  sltiu        a0, s10, -563
                  sra          t4, s11, t1
                  fadd.s       ft0, fs11, fa7
                  fsqrt.s      ft10, ft4, rne
                  xor          a1, s4, t3
                  flt.s        t4, ft4, ft1
                  mul          a3, s10, s7
                  xor          s3, ra, s10
                  sltu         ra, s5, s0
                  mul          a6, a6, s3
                  andi         s7, a6, -443
                  fsgnjn.s     fs6, ft7, fa3
                  fcvt.s.w     fs4, s4
                  fmul.s       fs0, fa0, fs9, rmm
                  mul          s10, gp, zero
                  mul          ra, a0, a0
                  addi         s5, t6, -1052
                  sltiu        s0, s1, 61
                  fdiv.s       fs1, fs3, ft6
                  srai         a3, t6, 30
                  nop
                  fle.s        t5, fa0, ft0
                  and          s1, t0, a2
                  fadd.s       fs2, fa6, fs8
                  feq.s        a0, ft6, ft3
                  feq.s        s4, fs6, ft2
                  or           s7, s7, s8
                  div          t4, tp, a5
                  add          s11, a7, zero
                  or           t4, a3, zero
                  mulhu        a3, zero, a5
                  slli         a6, t4, 9
                  ori          tp, t3, -1669
                  srai         s10, ra, 7
                  srli         s9, s7, 2
                  fsqrt.s      fa0, ft2
                  xori         s1, s9, 1030
                  fsqrt.s      fa1, fs11
                  fmax.s       fa5, fs0, ft2
                  andi         t0, a5, 1407
                  ori          s0, s8, 1719
                  fcvt.s.wu    fa0, t2, rup
                  slti         a1, t5, -1925
                  mulhsu       s9, t6, s10
                  fmin.s       fs4, fa1, ft8
                  slli         t6, s4, 4
                  fadd.s       fa4, fa1, ft2
                  add          s3, sp, t3
                  div          sp, t4, a0
                  add          tp, s9, s1
                  fmv.x.w      t6, ft0
                  fclass.s     s3, ft7
                  mulh         tp, t3, t1
                  fmul.s       ft6, ft9, fa5, rdn
                  sra          a4, s0, t0
                  srai         t2, s6, 4
                  flt.s        t2, fs10, ft4
                  fcvt.s.wu    fs5, zero
                  sll          a3, gp, gp
                  mul          tp, t5, a4
                  fcvt.s.w     fa1, a2
                  xori         s6, t3, 203
                  srli         gp, ra, 21
                  slt          a6, s4, s4
                  fsqrt.s      fa6, fa4, rtz
                  remu         gp, a1, a0
                  sub          s7, s2, a4
                  div          t5, a0, s1
                  mul          a3, s3, sp
                  sub          s0, t0, s4
                  fsgnj.s      fa7, fa1, ft0
                  fcvt.wu.s    a7, fs11
                  and          t5, a0, a7
                  sltu         a6, zero, t0
                  fsqrt.s      fs7, fs2, rtz
                  nop
                  or           t6, zero, t2
                  remu         s1, t5, s8
                  mulhu        t6, a4, s11
                  lui          t4, 216553
                  flt.s        s3, ft1, fs7
                  mul          a0, s0, t6
                  fsgnjx.s     ft4, fa0, ft2
                  addi         tp, a0, 1476
                  fmv.w.x      fs1, s10
                  slt          s4, t4, tp
                  fsub.s       fs1, ft11, fa1
                  fmin.s       ft11, fa7, ft9
                  feq.s        t5, fs5, ft6
                  rem          s7, t6, s3
                  fmv.w.x      fs11, s7
                  srli         t5, a0, 8
                  mulhu        s3, t6, a6
                  feq.s        s11, fs1, ft1
                  srli         a3, s10, 8
                  add          t0, s0, a6
                  fmv.w.x      fa0, s2
                  fmv.x.w      a0, ft9
                  mul          s6, t1, ra
                  auipc        s7, 109552
                  sra          tp, t3, t5
                  fmul.s       fa0, fa7, fa6
                  sub          s7, a1, a3
                  auipc        zero, 380165
                  srli         t5, s7, 7
                  sltu         s9, s4, s3
                  mulh         t0, s7, s3
                  addi         s3, s8, 753
                  and          sp, a4, t2
                  auipc        a0, 40155
                  sll          a0, s9, s0
                  fclass.s     s0, ft11
                  and          gp, s2, a0
                  sll          s3, s8, zero
                  fmv.x.w      a6, fa5
                  fclass.s     a2, fs4
                  fmax.s       ft4, fa7, fs8
                  fmv.x.w      s2, fs6
                  nop
                  ori          gp, t0, -877
                  fdiv.s       fs9, ft8, fa3, rtz
                  fsub.s       fs8, ft3, fs4
                  fadd.s       fa7, fa7, ft11, rmm
                  fmax.s       ft11, fs4, ft11
                  fclass.s     a0, fa6
                  flt.s        s10, fa1, fa3
                  fclass.s     t6, fa5
                  div          t5, s3, s4
                  fdiv.s       fs5, ft11, fs0
                  sltiu        t6, sp, -1248
                  mul          a2, s1, t3
                  mulh         a7, a7, t6
                  or           a7, a7, a2
                  add          a4, s1, a2
                  fmax.s       fs5, ft7, fs10
                  srli         s5, zero, 5
                  divu         a2, t6, tp
                  fmin.s       fs1, fa1, ft6
                  mulhu        t5, a5, s3
                  mulhu        s0, a1, s7
                  slli         s11, s7, 30
                  fcvt.s.wu    ft5, a7
                  mul          a4, s7, t6
                  slt          a0, s11, t3
                  auipc        a4, 206192
                  fcvt.s.w     ft7, s8, rne
                  fdiv.s       fs7, fa5, fa2, rtz
                  fclass.s     s8, fa6
                  feq.s        s8, ft8, fs3
                  nop
                  xor          s8, t5, a5
                  feq.s        s6, fs3, fs6
                  fmv.w.x      fs8, tp
                  slti         s7, t3, -1868
                  fmul.s       fa7, fa7, ft5
                  fsgnjx.s     ft4, fs6, ft0
                  fsub.s       ft7, fs2, ft11, rmm
                  divu         a6, t2, s1
                  nop
                  fmul.s       ft2, fs11, fs10, rup
                  remu         a4, ra, s4
                  xor          a0, s6, a4
                  fmv.x.w      s7, ft8
                  rem          a2, ra, s7
                  rem          s2, t4, t1
                  flt.s        zero, fa3, ft2
                  slt          s2, s2, a5
                  rem          gp, s5, a5
                  divu         a1, s6, s6
                  fsqrt.s      ft7, fs2
                  fcvt.wu.s    s8, ft8
                  slt          a7, s8, s4
                  fsub.s       fs10, ft10, fa7, rne
                  fcvt.w.s     a0, fs9
                  sll          a3, s0, tp
                  fmul.s       ft0, ft2, fa1, rne
                  auipc        tp, 1003932
                  lui          gp, 50656
                  slli         a7, a2, 21
                  fclass.s     s7, fa2
                  xor          s9, a0, a2
                  xori         sp, s4, -512
                  fmul.s       fa4, ft8, fa4
                  sll          a2, t6, a5
                  fsqrt.s      ft7, fs10, rne
                  nop
                  lui          gp, 362523
                  srli         ra, s11, 1
                  srl          a3, s10, a4
                  fsqrt.s      fa7, fs4
                  nop
                  fmax.s       fs9, ft3, fa3
                  addi         t5, a3, 904
                  xori         t0, a1, -814
                  andi         t2, a0, 577
                  fcvt.s.wu    fs7, s6
                  fsub.s       fs10, ft6, fs7, rtz
                  flt.s        a1, ft7, fa7
                  lui          a2, 992624
                  fmul.s       fs7, fa4, fs9
                  rem          t2, t5, s1
                  sra          s6, tp, t3
                  fcvt.w.s     s9, fa3, rne
                  and          s5, s11, t1
                  divu         t6, a1, gp
                  fadd.s       ft3, ft6, fa2
                  andi         t0, t3, 1229
                  fadd.s       ft8, ft5, fs0, rup
                  addi         tp, s1, 723
                  mulhu        t0, s6, a4
                  fmax.s       ft9, ft3, fs5
                  fcvt.s.w     fa0, s4
                  fle.s        s9, fa3, ft7
                  fsgnjx.s     fa0, fs4, fs7
                  fdiv.s       ft8, ft9, ft3
                  mulhsu       s7, a3, a3
                  fmv.w.x      fs0, t3
                  fsub.s       fs1, fa3, fs9, rmm
                  sra          s1, s3, t0
                  nop
                  fdiv.s       ft2, fs1, fa0
                  slt          t5, s4, s5
                  sltiu        s6, a2, -623
                  fsgnj.s      fa5, fs5, fa0
                  remu         s8, t0, s8
                  sltu         s1, sp, s11
                  fcvt.s.w     ft10, a5, rdn
                  xori         t4, a4, 381
                  srl          t2, t1, a5
                  feq.s        s0, fa5, fa1
                  slli         t2, t4, 13
                  mulhu        t6, s10, t0
                  lui          a7, 892657
                  lui          tp, 636662
                  fsgnjx.s     ft8, ft7, ft10
                  auipc        s4, 799610
                  sub          s7, ra, a5
                  sll          a0, a2, t3
                  lui          s4, 419371
                  andi         a3, s2, -1325
                  sra          a3, t5, a4
                  fsgnjn.s     ft0, fa4, ft7
                  srli         s4, ra, 25
                  div          gp, tp, sp
                  fsub.s       fa6, ft0, fa6, rdn
                  fdiv.s       fs5, ft8, fa7, rtz
                  srli         s8, tp, 30
                  xor          a4, gp, s2
                  fcvt.s.w     fa0, s4, rup
                  fsgnjx.s     fs7, fs8, fa6
                  mulhu        a7, s8, a2
                  slli         a6, ra, 7
                  slti         s8, a3, 1177
                  srli         s1, t4, 17
                  nop
                  sltu         a2, s3, a0
                  flt.s        a0, fs1, ft2
                  fcvt.wu.s    s6, fa3, rne
                  fcvt.s.w     fa4, a3
                  auipc        s0, 614238
                  nop
                  xori         s3, s7, 1339
                  div          s7, s3, s9
                  feq.s        s7, ft3, ft0
                  fcvt.wu.s    zero, fs4
                  sltiu        tp, s4, 869
                  fmin.s       ft8, fs10, fa7
                  xor          s1, s10, s2
                  sltu         a0, t3, s1
                  ori          t6, tp, 1359
                  div          s5, ra, s11
                  div          t6, a0, t2
                  srai         s6, s10, 12
                  or           s2, s2, tp
                  fcvt.wu.s    t0, fs2
                  xor          a4, t6, t5
                  fsgnj.s      ft8, fs1, fs8
                  sll          a1, a0, t4
                  fmax.s       fa4, fs9, ft10
                  remu         s9, s10, t3
                  fcvt.s.w     fa4, s3
                  mul          t4, s8, a4
                  div          a4, zero, t6
                  mulh         a3, t5, s0
                  div          t4, s10, s7
                  lui          s2, 638579
                  sltu         s5, ra, s1
                  fmin.s       fa4, ft4, fs1
                  fadd.s       fa4, fs0, fs3, rup
                  slt          ra, s1, s9
                  slli         a6, s7, 31
                  fle.s        s4, fs4, fs11
                  fmv.x.w      zero, ft5
                  srai         s3, a5, 22
                  xor          a2, t0, a1
                  mulh         a3, s8, a4
                  fmv.x.w      a4, ft0
                  mulh         t2, s11, s10
                  feq.s        t6, fs1, ft4
                  fmin.s       ft11, ft2, fs8
                  fadd.s       fa5, fs7, ft8
                  nop
                  srli         t0, s6, 20
                  lui          t4, 275548
                  slli         s5, tp, 5
                  ori          t2, t1, 1855
                  mulhsu       tp, s7, a7
                  fclass.s     a0, fa0
                  fmax.s       ft8, ft3, fa3
                  flt.s        a6, fs4, fa7
                  xori         s1, s8, 1736
                  mulhsu       s2, s8, s3
                  sltiu        t6, a6, 1947
                  flt.s        s6, ft5, ft11
                  lui          t0, 825862
                  flt.s        zero, fs9, fa2
                  fmv.x.w      t4, fs4
                  fsub.s       fa1, fa3, fs11
                  feq.s        t6, ft11, ft0
                  and          t2, s7, s7
                  fle.s        t2, fs7, fs7
                  fadd.s       fa6, ft10, fs10, rne
                  mulhsu       s7, a6, gp
                  andi         a6, sp, -1471
                  fsqrt.s      ft3, fs6
                  sltiu        tp, a6, -460
                  mulhsu       a1, s10, gp
                  and          a4, zero, s5
                  fcvt.w.s     s9, ft0
                  sra          a6, s8, ra
                  remu         t4, s2, ra
                  fsgnj.s      ft8, fs2, fs2
                  or           sp, s5, t6
                  fsqrt.s      ft6, fs9, rtz
                  addi         s3, a2, -296
                  andi         a6, a2, 222
                  fle.s        t5, fa1, ft11
                  sra          s9, a2, t3
                  fadd.s       fa1, fs11, ft0
                  feq.s        zero, ft1, fa3
                  fcvt.w.s     a0, fs7
                  fmax.s       ft0, ft6, fs8
                  fsgnj.s      ft4, ft6, fa0
                  sra          tp, s4, s0
                  fsgnj.s      ft10, ft9, fa2
                  fcvt.s.w     ft0, s2, rne
                  srl          t2, ra, zero
                  div          s0, s10, s6
                  mulhsu       s0, s6, ra
                  slt          a1, a1, a4
                  srl          s1, ra, t3
                  or           gp, a4, s5
                  fcvt.s.w     fa7, s4, rmm
                  sll          s0, t0, t0
                  addi         zero, zero, -220
                  sra          sp, t0, sp
                  remu         a7, s2, s7
                  fsqrt.s      ft11, fs11
                  or           s1, zero, sp
                  mulhu        s4, s9, a4
                  sll          zero, s10, s5
                  fadd.s       ft3, ft10, fs4, rup
                  fmul.s       ft5, fa4, fs1
                  add          s10, zero, a7
                  slt          ra, s0, a4
                  feq.s        zero, fs0, ft0
                  fdiv.s       fs3, fs0, ft8, rmm
                  sll          t5, s2, s10
                  fsub.s       fa0, ft11, fs8
                  fsgnjn.s     ft10, ft7, fs0
                  ori          t2, s2, -940
                  srai         a6, s6, 9
                  nop
                  slt          s9, s5, a3
                  lui          a3, 233517
                  srli         t0, s6, 12
                  flt.s        s6, ft2, fs2
                  xor          s5, s7, s9
                  slt          s10, t2, a0
                  mulhsu       ra, a3, s5
                  mulhsu       s10, a2, a1
                  flt.s        s2, fa6, fa7
                  fcvt.s.wu    fa3, a2
                  slt          t4, a2, s4
                  flt.s        t2, fs2, fa3
                  sltiu        s4, a0, 6
                  mul          s5, gp, a0
                  ori          ra, zero, 2042
                  fmul.s       ft11, fs1, fs0
                  srl          t5, s0, t6
                  flt.s        s4, ft7, fs10
                  sltiu        s0, s5, 1963
                  srai         s9, t2, 26
                  remu         s5, t2, t0
                  srl          a3, t6, t6
                  fsqrt.s      fa0, fs1, rup
                  addi         s7, a5, -1305
                  fmv.x.w      s8, fa3
                  fsgnjn.s     fa7, ft0, ft2
                  srl          a2, a2, s2
                  feq.s        t2, fa0, fa1
                  slli         t2, s9, 29
                  and          s1, s8, gp
                  addi         s2, a7, -973
                  fcvt.s.wu    fa3, a4
                  slt          s9, a7, a0
                  fle.s        gp, fa3, fs4
                  auipc        zero, 1019145
                  mul          s10, s10, t2
                  fmv.x.w      a6, fa1
                  fmv.w.x      ft6, a5
                  auipc        t4, 466721
                  slti         ra, sp, -228
                  srli         tp, t5, 5
                  fmv.x.w      s3, ft2
                  fadd.s       fs4, fs11, ft3, rup
                  xor          s5, tp, s8
                  xor          s11, s3, t0
                  fsqrt.s      ft2, fa7
                  fcvt.wu.s    a6, fa6
                  feq.s        s4, ft11, fa3
                  xor          s9, a1, s11
                  fmv.x.w      a7, ft11
                  slli         s10, a0, 31
                  remu         t0, a0, s3
                  andi         a4, t1, -1098
                  div          ra, a6, s4
                  fmv.w.x      fs0, gp
                  sltu         s7, s3, t4
                  fmv.w.x      ft8, s11
                  divu         s0, t3, s9
                  fdiv.s       ft10, ft10, fs1
                  fsgnj.s      fs5, fa0, ft11
                  rem          s5, s7, s5
                  fdiv.s       fs2, ft2, ft8, rmm
                  fsgnj.s      ft5, ft4, fa5
                  sltiu        a3, a6, 1969
                  nop
                  mulh         t6, tp, s0
                  xor          t0, a3, tp
                  fcvt.s.wu    fs5, s11, rmm
                  fsgnj.s      fs10, fs5, ft1
                  feq.s        t2, fs0, fs7
                  divu         s1, a3, s9
                  slti         s10, t3, -1500
                  sltiu        s2, gp, 68
                  slti         s0, s9, -474
                  mul          a0, t5, sp
                  fclass.s     t6, fs10
                  add          a2, t0, s8
                  mulhu        s2, s6, a3
                  fmv.w.x      fs11, zero
                  andi         s8, t3, 1574
                  remu         s5, sp, t1
                  or           ra, t5, s7
                  xor          s7, s2, t0
                  sra          s8, s5, sp
                  auipc        a2, 501518
                  andi         a0, s3, 1745
                  fmv.x.w      sp, ft10
                  fsgnjx.s     fs3, fs5, fa0
                  fsgnj.s      ft4, fs6, fs0
                  andi         a3, ra, 19
                  fcvt.wu.s    a0, fs0
                  slt          s4, a1, a1
                  mulh         s10, gp, t3
                  fcvt.w.s     t2, ft10, rup
                  div          a3, s0, s11
                  feq.s        a6, ft9, fa7
                  divu         t2, a3, a7
                  fmax.s       ft6, ft5, fs8
                  fmv.x.w      ra, fs9
                  xori         s3, s11, -189
                  sll          s0, s6, t6
                  fmul.s       fa3, fs0, fs3, rup
                  flt.s        a2, ft11, fs9
                  srai         s7, s7, 21
                  feq.s        ra, fs6, ft3
                  fdiv.s       ft7, ft1, ft5
                  fcvt.s.wu    ft1, s10, rtz
                  nop
                  div          s1, zero, a6
                  sra          s11, gp, t3
                  mulhu        s5, gp, a6
                  fcvt.s.w     ft10, s5
                  slti         a4, tp, -85
                  ori          t4, gp, -264
                  xor          gp, a4, t0
                  fmv.x.w      a7, fa4
                  or           t5, s10, a6
                  fdiv.s       fa7, ft9, fs3, rmm
                  nop
                  addi         s0, s9, 1524
                  remu         t4, t0, t2
                  fsqrt.s      ft6, ft5
                  lui          a3, 454575
                  mulhu        a6, s5, s10
                  mulhu        tp, s1, a4
                  add          a3, sp, s10
                  fmv.w.x      fa3, t5
                  fadd.s       fa5, fa3, fa3, rtz
                  sltu         s9, a6, a7
                  mulhsu       s3, t0, a1
                  fmul.s       ft0, ft0, fs3, rdn
                  slti         t0, a2, 171
                  fmv.x.w      s10, ft6
                  fmv.w.x      fs3, s11
                  mulh         t6, s5, t5
                  fsub.s       ft5, fs7, fs6
                  fsub.s       fa3, fa5, fa6, rtz
                  mulhsu       a1, a3, sp
                  fdiv.s       ft8, fa0, ft0
                  fadd.s       fs3, fs2, fs0
                  nop
                  fclass.s     s10, fa5
                  fclass.s     sp, fa3
                  nop
                  andi         s4, a7, 2008
                  fsgnjn.s     fa2, fs3, fs4
                  sltiu        sp, s0, 1734
                  fsgnj.s      ft7, fs6, fs0
                  fmin.s       fa6, fs7, fa4
                  sll          s8, s3, s5
                  fclass.s     a0, ft4
                  srli         a0, zero, 5
                  slti         s2, s8, 268
                  and          a1, t5, t6
                  fsgnjn.s     ft6, fa2, ft4
                  rem          t6, zero, s2
                  slli         t2, a5, 5
                  add          s9, a3, a5
                  mulh         a2, s2, a5
                  sltiu        a7, s5, -1837
                  xori         s8, a2, 1395
                  fcvt.wu.s    t2, fa3, rtz
                  sltu         a4, s6, ra
                  srai         a2, s11, 9
                  add          s1, s10, gp
                  mulhsu       a0, s8, a7
                  sra          s0, a2, s8
                  add          a6, t1, a6
                  fmax.s       ft4, fa4, fs9
                  nop
                  fmul.s       ft6, fa7, fa2
                  remu         t6, s3, ra
                  lui          t5, 619412
                  mulhsu       t0, gp, ra
                  fsqrt.s      fs6, ft6
                  remu         t6, s1, t6
                  mul          tp, t3, tp
                  fsgnj.s      ft2, ft10, fa6
                  addi         a7, t4, -1922
                  fmv.x.w      t5, ft0
                  fcvt.s.wu    fa4, sp, rup
                  add          a4, s6, a4
                  fsgnj.s      fs0, ft2, ft3
                  srai         sp, a6, 31
                  fmax.s       ft7, ft5, fa6
                  flt.s        tp, ft11, fs9
                  sra          gp, tp, a2
                  mulhsu       s9, s1, s7
                  slti         t6, s7, 2027
                  xor          s9, s7, a7
                  mulhu        ra, a5, s3
                  divu         s3, t0, t2
                  mulhsu       s11, t6, a1
                  mulhu        ra, s4, s5
                  add          s6, t4, a7
                  and          sp, a6, t5
                  fsgnjx.s     fa6, ft4, fa0
                  addi         a0, s7, -406
                  fmin.s       fs2, fs7, fs2
                  fsgnj.s      ft10, fs4, ft2
                  nop
                  or           s8, s0, s3
                  srli         s4, a4, 30
                  srl          s4, gp, tp
                  mul          sp, a5, a3
                  srai         ra, a5, 19
                  fsgnj.s      fa7, fa2, ft1
                  fmax.s       ft0, fs2, fs4
                  remu         zero, t6, s4
                  mul          a4, t4, s0
                  fcvt.s.wu    fs11, a4, rup
                  fsub.s       ft2, fs6, fs1
                  fclass.s     s7, fs4
                  sub          s4, zero, s1
                  xor          t0, a0, s2
                  srai         s4, a2, 22
                  srai         zero, s8, 2
                  slti         s6, t3, -2014
                  srl          ra, tp, s1
                  fsgnjx.s     fa5, fa6, ft3
                  fle.s        a4, ft9, ft1
                  fsgnj.s      fs11, ft4, fa4
                  add          gp, s7, a0
                  sltu         s11, t1, t1
                  div          s4, s2, s2
                  addi         t5, zero, -786
                  nop
                  sub          s5, s4, tp
                  fmv.x.w      s7, ft0
                  slli         s6, t4, 31
                  fcvt.w.s     s4, fa5
                  fmv.w.x      fa4, t3
                  fsgnjn.s     ft10, fs3, fa2
                  or           s2, gp, s5
                  fdiv.s       fa7, ft1, fs9, rup
                  fsgnj.s      ft3, fs2, fa3
                  fcvt.s.wu    ft7, s10
                  fsgnjn.s     ft3, fs6, ft6
                  sra          s5, t4, s11
                  srai         s11, s9, 13
                  fmv.w.x      fs11, s2
                  fsgnjn.s     fa3, fa3, ft5
                  xori         t4, s4, -187
                  xor          s9, s0, s7
                  fclass.s     ra, ft1
                  nop
                  mul          a2, t0, t5
                  lui          s0, 170309
                  fsgnjx.s     ft6, fa6, fs9
                  sra          s6, s7, s5
                  sll          sp, a6, t4
                  add          t2, gp, s4
                  fclass.s     s10, ft8
                  mulhsu       s3, t6, sp
                  fsgnjx.s     fa0, ft2, fs5
                  fsgnj.s      fs9, fs2, ft1
                  feq.s        s7, fs0, fs5
                  mulh         ra, s3, zero
                  feq.s        t2, ft5, fa7
                  remu         s10, t2, s8
                  fmin.s       ft10, fa6, ft8
                  fsgnjn.s     ft11, fs7, ft11
                  mulhsu       s4, s9, s8
                  lui          zero, 836353
                  fsgnjn.s     fs4, ft3, fs2
                  lui          a1, 589050
                  fsgnjx.s     fa2, fa3, ft5
                  fdiv.s       ft1, fa1, fs11, rdn
                  lui          s2, 201190
                  fcvt.s.w     fs1, ra
                  srli         s7, a3, 28
                  fcvt.w.s     s4, fs8
                  fcvt.s.wu    ft5, t3, rne
                  sltiu        s0, s6, 573
                  ori          s2, t5, -68
                  divu         a2, sp, t5
                  feq.s        a6, ft7, ft6
                  rem          s8, s1, s3
                  and          s9, a3, s11
                  sra          s9, a6, s4
                  slli         s5, sp, 26
                  or           a3, tp, s0
                  divu         a7, t5, t4
                  fsgnjn.s     fa3, fa7, ft9
                  fsgnj.s      ft6, ft5, fs11
                  fcvt.s.wu    ft5, t6, rne
                  nop
                  fsgnj.s      fa6, fs5, fs10
                  auipc        tp, 501513
                  xor          t2, gp, t0
                  srl          s8, t0, a0
                  feq.s        t5, fs7, fa4
                  slti         s4, s10, -299
                  fclass.s     s10, fs5
                  fcvt.s.w     fs6, s1
                  flt.s        s5, ft4, fs3
                  fclass.s     s3, fs7
                  sltiu        a0, s6, 1102
                  andi         s5, s3, 995
                  fsgnjx.s     fs5, fs2, ft8
                  flt.s        s1, fs8, ft1
                  xor          t0, s8, s7
                  div          s6, s2, ra
                  fsgnjn.s     ft8, fs3, ft11
                  auipc        s1, 565078
                  mul          a1, a2, a5
                  slt          s5, t0, s7
                  fdiv.s       ft10, ft0, ft7, rup
                  mulhu        s10, s8, t6
                  divu         s4, s8, t4
                  slli         s7, a2, 9
                  mulhu        s0, t3, s9
                  mul          sp, s2, s10
                  slti         t4, zero, -1531
                  fcvt.w.s     s2, fs1, rdn
                  and          t2, s6, a0
                  sltiu        t2, gp, -112
                  slti         zero, t1, 95
                  lui          s9, 190731
                  flt.s        zero, ft6, fa4
                  fmul.s       ft11, fa7, fa7, rmm
                  andi         tp, s9, 137
                  lui          s3, 281696
                  rem          s4, t3, t3
                  fcvt.wu.s    s3, fs10, rne
                  srli         gp, t0, 19
                  or           zero, s8, s5
                  fcvt.w.s     s3, fs1
                  or           s2, t5, s11
                  xori         s8, t6, 94
                  auipc        gp, 645293
                  fdiv.s       fs9, fs5, ft4, rmm
                  rem          s11, gp, t6
                  srai         s8, t5, 10
                  fclass.s     t2, fs8
                  slt          a2, t0, t6
                  slli         a7, tp, 25
                  fdiv.s       fa7, ft10, fa4
                  slli         s9, s7, 7
                  fmin.s       fa1, ft4, ft6
                  feq.s        t2, fa1, ft8
                  feq.s        a0, fa0, fa3
                  fcvt.s.w     ft10, t3
                  fadd.s       fs5, ft3, fs11
                  sltiu        a7, a1, -892
                  fmin.s       fs11, fs8, fa3
                  add          t0, t0, s7
                  mul          a6, a7, s10
                  srli         t2, t6, 28
                  fcvt.s.w     fs10, s8, rup
                  sll          a3, a3, s6
                  fsgnj.s      ft0, fa0, fs3
                  fclass.s     a7, fa7
                  divu         t0, s4, a3
                  fsqrt.s      fa2, fs6, rup
                  srl          a7, tp, t4
                  div          a6, zero, t4
                  fmv.w.x      ft4, s10
                  sub          s4, s1, gp
                  remu         t2, t1, a5
                  fmax.s       ft8, fa4, fs9
                  srl          sp, sp, t5
                  mulhu        zero, s7, t2
                  sll          gp, a7, s11
                  feq.s        s8, ft6, ft9
                  and          a2, a5, t4
                  sltu         s2, a0, t1
                  divu         a6, t2, t5
                  fcvt.w.s     s2, fs1
                  fsgnjn.s     fa4, fa6, fs4
                  fsqrt.s      ft7, ft2, rup
                  slli         a7, t3, 16
                  andi         t0, tp, 1140
                  xori         s4, t1, 1205
                  mulhu        gp, a2, t1
                  auipc        a2, 764434
                  fsgnjx.s     fa3, ft3, fs10
                  fdiv.s       fs4, ft0, fa3
                  srli         a1, a3, 23
                  fsgnj.s      fs4, fa2, fs3
                  fsub.s       ft6, fa3, fa1, rup
                  srli         a3, t1, 0
                  sll          a3, tp, s3
                  mulhsu       s9, s3, t2
                  rem          a3, s7, a3
                  fmin.s       fa4, fs0, fs9
                  fadd.s       fa6, ft0, fa6
                  fmul.s       ft5, ft11, fa7, rne
                  add          s10, sp, s2
                  or           s4, t2, a4
                  nop
                  addi         s7, s6, 1458
                  xor          s9, a6, gp
                  fsgnj.s      fa0, fs1, ft5
                  div          s7, tp, a0
                  and          sp, tp, a4
                  mulhu        gp, gp, s0
                  mulh         s9, t3, s7
                  sll          t6, s8, s10
                  mulhsu       t0, s8, t5
                  slti         t6, s8, 1009
                  fsgnjx.s     fs10, fs10, ft7
                  and          s4, s9, s1
                  srai         s5, s4, 27
                  fle.s        t5, ft6, ft11
                  auipc        tp, 595066
                  sub          s2, s10, a3
                  rem          a3, t5, t5
                  xor          ra, t2, s11
                  mul          s7, tp, s6
                  andi         t4, s11, 1998
                  fmax.s       ft8, fs4, fa6
                  slti         a6, s3, 1406
                  or           s5, tp, s3
                  slli         s2, a3, 2
                  flt.s        sp, ft5, fs7
                  fsqrt.s      ft2, fs11, rmm
                  div          s9, a4, sp
                  fcvt.s.wu    fa2, t6
                  fmax.s       ft10, fa2, ft3
                  fsgnjx.s     ft2, fa0, fs1
                  mul          s10, a3, a6
                  fcvt.s.w     ft6, gp, rmm
                  fmin.s       ft2, fs0, fa1
                  fmin.s       fa3, fa0, fa4
                  fcvt.w.s     t2, fs11, rne
                  addi         a7, s7, 2040
                  fsgnjx.s     fa5, fa4, fa6
                  fcvt.s.wu    fs10, t6
                  sub          s2, s4, s4
                  slti         s11, sp, -1347
                  auipc        t6, 712506
                  addi         t6, t4, -801
                  fcvt.s.w     fs4, t2, rup
                  xor          s2, s5, a4
                  fmv.w.x      ft0, t6
                  fmax.s       ft0, ft8, ft3
                  or           s4, zero, s0
                  and          s3, t2, s10
                  fmin.s       fs4, ft9, fs5
                  slt          a6, s11, gp
                  sltiu        s1, t2, 288
                  mulh         s11, s7, s4
                  flt.s        t2, fs0, fa0
                  rem          a0, s6, s4
                  auipc        t0, 7361
                  srli         zero, t2, 17
                  mulh         s11, s2, ra
                  mulhsu       t4, sp, t6
                  fsgnj.s      fa3, fs5, fa3
                  sub          s1, sp, t2
                  fsub.s       ft4, fa1, ft11, rup
                  remu         a6, ra, t3
                  auipc        s11, 146817
                  add          gp, a3, a3
                  fcvt.w.s     a1, fa7
                  fmv.x.w      s1, ft0
                  feq.s        s8, fs5, fa2
                  fcvt.s.wu    ft6, s3, rmm
                  slti         s2, s4, 1441
                  sll          t0, s5, s9
                  mulhsu       ra, s0, a4
                  sub          a3, t1, t5
                  feq.s        ra, fa6, ft8
                  ori          a2, t3, -249
                  fmin.s       ft4, ft5, fa2
                  ori          zero, a5, -424
                  flt.s        ra, ft9, ft9
                  fsqrt.s      fs6, fs3
                  fmin.s       fa4, fa4, fa7
                  fmin.s       fs0, ft5, ft7
                  xor          a6, s11, s4
                  lui          s10, 922567
                  andi         t0, a4, -900
                  mulhu        a1, s2, a5
                  fle.s        t2, ft9, ft4
                  nop
                  fcvt.w.s     gp, fa2
                  fmin.s       fs1, fa0, fs9
                  mulhu        a0, a2, s2
                  fcvt.s.wu    fa3, a7, rtz
                  mul          s1, t4, sp
                  mul          s8, a4, a1
                  fcvt.s.w     ft9, s0, rtz
                  ori          a3, s2, 2038
                  fsgnj.s      ft0, fa0, fs8
                  lui          s1, 1005442
                  fmin.s       ft11, ft6, ft4
                  fcvt.s.wu    ft9, zero
                  fmul.s       fa4, ft7, ft9, rtz
                  fsgnjx.s     fs6, fs1, ft3
                  add          t4, t3, gp
                  divu         t5, a6, s7
                  fclass.s     s2, ft7
                  sltu         t4, ra, a2
                  and          t2, s3, a0
                  fcvt.s.w     fa0, tp, rne
                  fmax.s       fs3, fa1, ft9
                  mul          a1, a6, s3
                  srli         a3, s10, 18
                  fmin.s       ft0, ft10, ft9
                  remu         a7, s9, s10
                  andi         s7, s2, 508
                  fmv.x.w      s8, fa1
                  fmv.x.w      s11, fs8
                  fsgnj.s      fs4, ft7, fs3
                  fsgnj.s      fa3, ft0, fs7
                  andi         s3, zero, -912
                  mulh         a2, s7, s7
                  fdiv.s       fa1, fs11, fs6
                  mulhsu       s6, a2, a1
                  mulhsu       s0, s9, s11
                  auipc        sp, 961347
                  fcvt.w.s     s8, ft2
                  fmin.s       ft4, fa4, ft5
                  fadd.s       fa4, ft2, fa1
                  fsgnjx.s     ft4, fs5, fs0
                  or           s5, a1, a0
                  and          a7, ra, zero
                  fsqrt.s      ft2, ft9, rdn
                  mul          s0, a7, s7
                  xor          s2, t6, zero
                  srai         s2, a3, 19
                  remu         s11, s9, s4
                  lui          sp, 850553
                  flt.s        gp, ft1, fa4
                  feq.s        ra, fs8, fs3
                  fsgnjx.s     ft7, ft1, fs7
                  flt.s        sp, fs11, fs2
                  fsub.s       fs0, fa1, fs2, rmm
                  fcvt.wu.s    s11, fs11, rne
                  or           ra, s8, t1
                  fsgnj.s      fs6, fa4, ft8
                  auipc        zero, 272230
                  fcvt.wu.s    s5, ft6, rup
                  slli         s1, ra, 20
                  auipc        s0, 231248
                  mul          t6, t4, s10
                  xori         sp, tp, -1643
                  ori          s1, t1, 414
                  feq.s        s1, fa7, fa7
                  fmin.s       ft8, fs1, fa1
                  div          t0, tp, s10
                  mulh         s5, t1, gp
                  fcvt.w.s     a4, ft11
                  fadd.s       fs9, ft10, fs1
                  andi         s10, ra, -179
                  fmax.s       ft7, ft3, ft11
                  sll          a3, t5, zero
                  srai         a7, t3, 16
                  flt.s        s5, ft6, ft10
                  fadd.s       fa2, ft9, ft3
                  addi         s3, s0, -941
                  fsgnj.s      ft6, fs3, ft3
                  fsub.s       fa2, fs6, ft7
                  fsgnjx.s     fa4, fa2, fa0
                  sra          s10, s5, a3
                  srli         s7, sp, 30
                  or           a4, t3, sp
                  fsgnjx.s     ft4, fs2, ft2
                  fclass.s     s3, ft7
                  fsgnjx.s     ft10, ft1, fs10
                  mulh         s7, s3, s2
                  slt          t2, tp, s2
                  slti         s7, a6, 818
                  fmul.s       fs0, fs5, ft3
                  srli         s9, a7, 19
                  fsgnj.s      ft8, fs7, ft9
                  fcvt.s.w     ft2, t0
                  remu         a3, a1, tp
                  sll          s3, tp, t0
                  srl          s9, s9, sp
                  sra          a3, a0, t4
                  auipc        gp, 34735
                  auipc        a6, 914344
                  ori          t5, a5, 53
                  div          a1, a6, a6
                  lui          s4, 118489
                  sltiu        s10, t6, 216
                  fcvt.wu.s    s11, fa7
                  feq.s        ra, fa0, fa7
                  sltu         s0, a7, s2
                  nop
                  fsgnjx.s     fs5, fs2, ft0
                  mulh         a3, t0, a1
                  andi         s6, s2, -138
                  auipc        a1, 781944
                  fsgnjx.s     fa7, ft0, fa1
                  sltu         a2, s6, a4
                  fcvt.wu.s    a1, ft10
                  fmv.x.w      t4, ft0
                  fsgnjn.s     fs6, fs11, fs5
                  fcvt.wu.s    t5, fs1, rdn
                  sltu         a1, t0, a1
                  add          a6, t5, a2
                  sll          sp, s9, s7
                  remu         sp, ra, ra
                  fcvt.s.wu    fa4, a2
                  srai         a6, gp, 10
                  slt          s9, zero, t6
                  mul          t2, a1, t6
                  fsgnjx.s     ft0, fa5, fs5
                  fsgnjx.s     fs4, fa6, ft10
                  sub          sp, tp, t2
                  ori          t0, t6, -722
                  fsgnjx.s     fa1, fs0, fa3
                  fclass.s     s0, fa0
                  xori         t4, s7, -1982
                  fsqrt.s      fs5, ft5, rup
                  fmv.w.x      fa3, a3
                  ori          s8, s3, 965
                  addi         s10, s0, -1422
                  fcvt.s.wu    fa1, t6, rtz
                  sll          s6, s10, t0
                  fsqrt.s      fs2, ft9, rne
                  sub          s10, a5, s3
                  xor          s5, t5, a7
                  divu         a7, s10, a7
                  divu         t4, s5, s7
                  sub          a6, sp, t3
                  srl          t5, s2, s1
                  fmv.x.w      t0, ft10
                  rem          a1, s9, zero
                  mulhu        a2, zero, t5
                  fadd.s       fa7, ft8, ft0
                  divu         s2, s7, ra
                  sltu         s11, s6, s0
                  divu         a6, s3, tp
                  div          s2, t1, t0
                  fadd.s       fs6, ft7, fa4
                  fle.s        t5, fs10, fs1
                  remu         s10, a4, t0
                  srai         s8, t1, 27
                  sltu         a7, s0, s6
                  flt.s        s8, fs1, ft9
                  fmul.s       ft2, fs1, fs7, rup
                  fmv.w.x      ft4, s11
                  nop
                  fcvt.s.w     fa1, a6
                  add          t6, s2, s4
                  fcvt.w.s     s8, fa4, rdn
                  fsqrt.s      fa6, fs7
                  slti         s1, t3, 1561
                  mul          t6, s9, t0
                  slt          s6, t6, a3
                  fmin.s       ft3, fa5, fs1
                  fsgnjn.s     ft10, ft11, ft7
                  mulhsu       zero, t0, s2
                  srli         s2, s3, 1
                  fadd.s       fs2, fa2, fs7, rne
                  fmv.w.x      fs3, sp
                  or           a0, sp, t6
                  fcvt.s.wu    fa6, t4, rtz
                  srli         a0, a4, 19
                  and          t5, a6, t5
                  fsgnjx.s     ft0, ft11, ft9
                  sll          t2, t0, s1
                  mulh         a0, t6, s5
                  fadd.s       fs7, fa1, ft5, rmm
                  lui          s0, 919510
                  divu         a4, a6, a7
                  mulhsu       a6, a1, s3
                  ori          s3, a5, 1009
                  nop
                  slti         tp, t1, -1546
                  fle.s        t0, ft4, fa3
                  sltiu        s9, t1, -986
                  fsqrt.s      ft4, fa5
                  slli         t6, t0, 0
                  mulhu        t5, a5, t6
                  mulh         t2, gp, tp
                  slli         a6, tp, 2
                  feq.s        s2, fs10, fs7
                  fmv.x.w      t5, ft11
                  mulhu        a2, t1, a7
                  fmul.s       ft9, fa3, ft8
                  fadd.s       ft4, fs5, fa3, rtz
                  and          a6, a4, tp
                  auipc        ra, 44144
                  slti         a2, s11, -1903
                  slli         s10, gp, 18
                  fmin.s       fa3, fs10, fa2
                  fmin.s       ft4, ft10, ft7
                  fmax.s       fs10, ft6, fs0
                  add          t5, t2, s11
                  fle.s        a2, fs8, fa0
                  sra          a2, s2, a3
                  fmul.s       fs8, ft10, ft2, rup
                  mulh         s3, s10, sp
                  andi         sp, s9, -1821
                  sltiu        tp, a6, -991
                  fcvt.w.s     s10, fs3
                  add          a6, s9, t2
                  fmin.s       ft7, fa6, fs4
                  fsub.s       fs11, fs6, fs2
                  sltiu        s1, ra, 1923
                  fclass.s     s10, ft4
                  flt.s        s9, fs11, ft0
                  sltu         s2, a5, zero
                  sll          s9, a2, a5
                  fmin.s       fs2, ft0, ft9
                  fclass.s     t5, ft6
                  srai         a6, t2, 28
                  sll          t2, s1, s4
                  fsqrt.s      fs0, ft1
                  slli         s5, t0, 5
                  xori         a3, t2, 1354
                  sltu         zero, ra, a4
                  fsub.s       fa0, fs2, ft3
                  mulhu        s1, s5, t1
                  fmv.x.w      s4, ft2
                  fmv.x.w      a6, fs4
                  slli         a4, t5, 14
                  divu         s9, a2, s9
                  srli         s10, s10, 8
                  slt          a4, a5, a7
                  divu         s7, s11, ra
                  auipc        a7, 804247
                  fmul.s       fs8, ft6, ft6
                  sltu         t4, t5, t2
                  xor          s11, gp, a4
                  feq.s        t5, ft11, ft4
                  fsgnj.s      fs8, fs3, fa2
                  srli         s1, s2, 10
                  mulhu        s7, gp, t5
                  sltiu        t4, s2, 87
                  feq.s        a4, fs10, fs4
                  fmul.s       ft8, fs8, fa4
                  srl          s1, a4, tp
                  fsgnjx.s     fa7, fs0, fa4
                  fmul.s       fa0, fa0, fa4
                  and          a3, a1, t0
                  fsgnjx.s     ft8, fs7, fs11
                  mulhsu       s5, s5, s3
                  slt          tp, sp, t3
                  fcvt.s.w     fa0, a2
                  addi         a7, a5, 1256
                  div          a0, t3, zero
                  fmv.x.w      a6, fs4
                  sltiu        s10, s11, -628
                  xor          s9, a4, s10
                  nop
                  slti         tp, s8, 1696
                  fsgnjx.s     fs11, fa7, fs2
                  mulhsu       a3, t2, s11
                  fmv.x.w      s6, fs0
                  fmul.s       fa6, fa5, fa0, rdn
                  auipc        gp, 659713
                  fmv.w.x      fa0, t2
                  fmax.s       fs0, ft6, fs11
                  and          sp, a1, a2
                  divu         a7, a7, zero
                  xor          s5, t6, a4
                  fclass.s     a4, fa6
                  srl          t2, a6, s10
                  and          t6, a4, tp
                  add          t0, a4, s4
                  or           a1, a5, a2
                  srai         zero, t0, 29
                  sub          t2, s10, a2
                  and          s5, s3, s9
                  mul          t4, tp, t3
                  fmv.x.w      a4, fs3
                  mulhu        s3, s11, t5
                  fsqrt.s      fs10, ft8, rmm
                  fsub.s       fa5, ft10, fa4
                  fcvt.s.wu    ft2, s0
                  fsgnjn.s     fs6, fa1, ft1
                  fsub.s       ft9, fs0, ft9, rtz
                  lui          s2, 205477
                  srl          ra, s11, t0
                  fsgnjx.s     fa1, fs4, ft11
                  xor          s4, s5, zero
                  fmax.s       fa4, fs11, fa3
                  slti         s5, a3, -1396
                  sll          a4, sp, t0
                  fadd.s       fs4, fa7, ft0
                  srl          t2, s10, s8
                  divu         sp, ra, t3
                  lui          s7, 95684
                  nop
                  addi         a7, s3, 1260
                  mulh         gp, s0, t1
                  rem          s9, ra, a1
                  srl          s1, t2, s9
                  feq.s        s9, fa0, fs3
                  fmv.x.w      a6, fa5
                  feq.s        zero, ft7, fs10
                  fcvt.wu.s    t6, ft1
                  fadd.s       ft6, ft1, ft3
                  fmv.w.x      fa1, sp
                  fsqrt.s      fa1, fs7, rmm
                  mulhsu       t4, s7, zero
                  sll          a3, s9, tp
                  sra          s5, sp, t2
                  srl          gp, a6, s2
                  mulhu        a7, t5, s3
                  fle.s        t0, ft2, ft1
                  xori         t5, sp, 14
                  slli         t0, s1, 1
                  fsgnjx.s     ft1, ft0, fa0
                  sltu         s8, a6, s0
                  fmul.s       fa3, fs0, fa6
                  fmax.s       ft6, fs1, fs1
                  sra          sp, tp, ra
                  xor          t4, s11, a5
                  srli         s0, t3, 12
                  srli         s0, a0, 27
                  rem          s6, t6, a4
                  fsub.s       fs8, ft2, fs5
                  slt          t0, s11, t5
                  slli         t2, a0, 27
                  fmv.w.x      fs1, t2
                  fcvt.w.s     sp, ft6, rne
                  mulh         s3, s9, t5
                  remu         s3, zero, a6
                  flt.s        s5, fa7, ft3
                  xori         gp, s1, 1741
                  fsgnjx.s     fa3, fs10, fa4
                  fsub.s       fs1, fa3, ft5, rtz
                  and          t6, s11, s9
                  fclass.s     a3, fs5
                  sub          gp, sp, s5
                  nop
                  mul          a2, s5, a6
                  fsqrt.s      fs0, fs6
                  fclass.s     s6, fa5
                  ori          s1, t4, 509
                  lui          s5, 280726
                  and          a3, a1, t4
                  auipc        s7, 134581
                  slli         a3, s7, 23
                  nop
                  fmv.x.w      s8, ft7
                  fcvt.s.wu    fs4, a2
                  srl          a7, ra, s10
                  fadd.s       ft10, fs6, ft7
                  or           a3, zero, s11
                  fsqrt.s      ft1, ft9, rmm
                  srl          t6, s5, s7
                  fsgnjn.s     ft8, ft6, fa6
                  remu         s9, sp, a4
                  sra          a4, s11, s11
                  fclass.s     s9, fs3
                  fclass.s     sp, fs5
                  mulh         s11, ra, ra
                  srl          gp, t2, t4
                  sltu         s6, t1, s1
                  sltu         s6, t5, t3
                  fadd.s       ft1, ft8, ft6, rup
                  fadd.s       ft4, ft4, fs5
                  auipc        a3, 58018
                  slt          s11, a0, s7
                  xori         ra, t4, 1348
                  fsgnjx.s     fs8, ft10, ft6
                  add          s5, s4, a1
                  fcvt.s.w     fs3, s8, rdn
                  fadd.s       ft0, fs0, fs5, rne
                  remu         tp, sp, a6
                  rem          a3, s3, s0
                  flt.s        t0, fs2, fa3
                  fcvt.s.w     fa4, t5, rtz
                  fmv.x.w      s7, fs0
                  slti         a7, t0, -954
                  fadd.s       fs1, fs0, fa6
                  mulh         s2, gp, s3
                  sra          t6, t2, tp
                  rem          s5, s5, a3
                  fdiv.s       ft4, ft0, ft3
                  addi         s0, a6, 1631
                  auipc        t5, 625259
                  fle.s        sp, fs6, fa3
                  slt          s8, s3, t1
                  add          a3, a4, s2
                  slt          a7, s8, t5
                  sltiu        sp, s6, 26
                  sub          s2, a1, tp
                  mulhu        s7, t4, tp
                  fsgnjx.s     fa6, fs2, fs7
                  fmul.s       fa4, fa4, ft2
                  sltiu        s1, s11, 1409
                  srl          s4, a3, a6
                  sub          s10, t0, s0
                  fdiv.s       ft11, fs8, fa3
                  nop
                  rem          a3, t1, s11
                  or           a1, s2, s5
                  srl          t6, s11, gp
                  nop
                  fmv.x.w      a1, fa2
                  add          tp, a2, t2
                  srli         a2, s7, 10
                  sltu         t5, s0, s9
                  fsgnjx.s     ft3, fa3, ft11
                  srai         a1, t2, 30
                  mul          s2, a7, s4
                  sll          a4, s1, a5
                  fcvt.s.w     fa6, a6
                  feq.s        t6, fs5, ft8
                  and          s9, a0, s6
                  divu         a7, s5, gp
                  xor          s7, s0, a2
                  andi         s8, s8, 885
                  div          gp, t5, s7
                  lui          a3, 542000
                  mul          s11, a5, t1
                  fle.s        gp, fa3, ft9
                  fdiv.s       fa5, fs5, fa4, rne
                  slli         s3, a3, 5
                  or           zero, t5, tp
                  fcvt.s.wu    ft3, s1, rup
                  flt.s        a1, fa7, fa1
                  fcvt.w.s     t6, fs8, rmm
                  add          t2, a1, t6
                  xor          zero, tp, s9
                  fdiv.s       fs2, ft9, fs0
                  xor          s4, s6, s9
                  div          t0, t0, s11
                  lui          zero, 336034
                  ori          ra, t6, -1681
                  fsub.s       fs10, ft10, ft7
                  fcvt.s.w     fs11, t3, rtz
                  slli         a6, s6, 0
                  fmul.s       fs2, fs4, ft9
                  mulh         s3, s5, ra
                  remu         s2, s6, t5
                  fsqrt.s      ft1, fs6, rup
                  fcvt.s.wu    ft11, a1, rup
                  divu         a0, s4, a5
                  slli         a0, t0, 19
                  fcvt.s.wu    fs8, s6
                  and          t0, ra, a1
                  rem          a7, s0, s7
                  slt          zero, t2, a7
                  slt          s8, s5, s2
                  fsub.s       fs7, fa6, fs9, rup
                  fmv.x.w      t2, fa4
                  flt.s        t4, ft8, fa2
                  remu         t2, a1, sp
                  divu         s4, t4, a6
                  mulh         s1, s7, s10
                  lui          zero, 983361
                  fmv.w.x      fa6, sp
                  nop
                  srai         a7, a0, 15
                  remu         a0, tp, a6
                  sra          gp, tp, t1
                  sub          t0, t0, ra
                  flt.s        s0, fs2, ft3
                  mulh         s11, s0, t6
                  srli         a7, tp, 3
                  fmv.x.w      a1, ft11
                  sltiu        t5, s11, -244
                  sltu         tp, s7, s9
                  mulhu        tp, s4, s3
                  and          a3, a5, s9
                  fclass.s     s0, fa0
                  sra          s11, tp, ra
                  ori          t6, s1, 1949
                  xor          s6, a1, a5
                  fmv.w.x      fs2, t5
                  fsgnjn.s     ft8, fs9, fs2
                  andi         s2, zero, -279
                  fcvt.wu.s    a4, ft9, rup
                  fclass.s     a4, fs6
                  xori         zero, t3, -285
                  xori         t6, s3, -1785
                  fle.s        t5, fa1, fs9
                  srl          a0, a5, t3
                  fmax.s       fa3, fa0, fs6
                  mulhu        t0, s5, s7
                  sub          t2, s0, t2
                  lui          s3, 961156
                  slti         a7, s2, -1048
                  fsgnjx.s     fs0, fs9, fs11
                  mulhu        s5, sp, tp
                  auipc        gp, 550508
                  sub          s2, s11, t0
                  rem          s6, s0, s1
                  fdiv.s       ft9, ft5, ft10, rmm
                  mul          s10, ra, t6
                  srl          s9, a6, s2
                  lui          s10, 332852
                  nop
                  fsqrt.s      fa0, ft6
                  srl          a2, t2, s10
                  sltu         a6, a2, s7
                  fsub.s       ft1, ft6, fs2
                  fmul.s       ft5, ft0, fa4
                  mulhu        t0, s7, s2
                  sltiu        s9, t0, 1989
                  xori         gp, a2, 1125
                  lui          tp, 1045916
                  mulh         a0, s1, a2
                  sra          s7, ra, a1
                  flt.s        s7, fa3, fs9
                  sltiu        tp, a1, -1140
                  fsqrt.s      ft11, ft9, rtz
                  fmax.s       fa7, fa6, fa4
                  rem          sp, t0, sp
                  srl          s3, s8, s10
                  or           s1, ra, a7
                  or           a1, t0, t2
                  mulhu        t0, s10, a7
                  xor          s10, s4, t1
                  fadd.s       fa4, fa5, ft8
                  addi         s8, t3, 763
                  andi         s3, a1, 1484
                  sub          s4, s5, a6
                  srai         s5, a2, 24
                  fmin.s       ft5, fa4, ft1
                  fsub.s       ft4, fa6, fs8, rup
                  nop
                  feq.s        a3, ft5, ft5
                  nop
                  fcvt.w.s     s5, fs2
                  mulhsu       a6, s3, a6
                  mul          s6, t2, tp
                  fmv.x.w      a3, fa6
                  sub          s3, a6, t1
                  fmax.s       fs6, fa7, ft0
                  fmv.x.w      s9, ft0
                  srl          ra, tp, t5
                  sub          gp, a7, s4
                  srl          s2, s5, t1
                  rem          a4, tp, s2
                  mulhu        a0, a2, s4
                  feq.s        s3, fs10, ft3
                  auipc        a4, 833761
                  lui          s6, 547514
                  feq.s        t4, ft3, ft6
                  mulhsu       zero, s10, s7
                  divu         s9, t3, a6
                  flt.s        s1, ft7, fs7
                  sll          s10, a7, s4
                  fmul.s       fs5, fa2, ft10
                  fsgnjx.s     ft9, fs10, fa5
                  nop
                  fsub.s       fa3, fs7, fs3
                  add          s10, s11, a4
                  fmin.s       fa2, fa2, fs8
                  srai         s9, s3, 10
                  fle.s        s7, fa2, fs4
                  srli         ra, a0, 0
                  slti         s10, tp, 869
                  slti         a6, tp, -1155
                  fsgnj.s      ft9, fs3, fs2
                  sra          a4, s4, a4
                  fsgnjn.s     fa4, fa1, ft5
                  div          t4, s9, a3
                  fdiv.s       fa0, fs2, fa3
                  sltu         t2, a3, a7
                  fsgnj.s      fs8, fa2, fs5
                  srli         t0, t1, 30
                  feq.s        a4, ft6, ft11
                  lui          s1, 64641
                  feq.s        s7, ft6, ft0
                  slt          s10, tp, s2
                  lui          s3, 302929
                  fle.s        s2, fs3, fa0
                  remu         s2, zero, s0
                  fcvt.s.w     fs1, a4, rmm
                  divu         t5, s1, s6
                  slli         s9, a2, 17
                  slli         a4, t6, 3
                  fsub.s       fa5, fs5, fs6, rtz
                  fsgnjn.s     ft10, fa3, ft7
                  andi         s0, t6, -816
                  add          a1, zero, s7
                  andi         a1, s7, 565
                  fmax.s       ft1, fs7, fa3
                  fsub.s       fs0, ft8, ft11
                  fadd.s       fs1, fs11, fs2
                  sub          t4, a3, a7
                  xor          a7, a7, t6
                  slti         zero, s0, 1462
                  srai         s8, t4, 10
                  feq.s        ra, fs1, ft1
                  fmv.w.x      ft4, a5
                  fsub.s       fa0, fs8, fa5
                  ori          s1, s2, -1714
                  fadd.s       fs6, fa6, fa5, rmm
                  fsub.s       fs5, ft10, fs5, rtz
                  div          s7, s3, t1
                  mulh         a6, s3, s0
                  addi         t2, s7, -376
                  fdiv.s       ft7, ft5, ft2
                  flt.s        t4, fs0, ft2
                  fmax.s       fa4, ft3, fa4
                  feq.s        a2, fs7, ft11
                  addi         s3, a4, -1992
                  sub          s1, a0, a0
                  slli         s5, a0, 19
                  sltu         t5, a6, ra
                  fadd.s       fs9, fs0, fa0, rne
                  xori         s10, a1, 274
                  sll          s10, sp, t4
                  fsgnj.s      fs5, fa0, fs11
                  divu         s0, s4, a2
                  fmin.s       fs1, ft11, fs11
                  auipc        a6, 330458
                  fcvt.s.w     fs10, s8
                  fmin.s       fa2, fa6, fs4
                  lui          ra, 1020482
                  fcvt.s.w     fa3, a6, rmm
                  fadd.s       fa3, fs8, fs10, rdn
                  fcvt.wu.s    s10, fa2, rup
                  sll          tp, a1, a1
                  sltiu        gp, zero, 1991
                  sltu         s0, tp, s1
                  mulhu        zero, t5, gp
                  sub          ra, s4, a0
                  mul          s6, s9, t1
                  fsqrt.s      fs6, fa4, rmm
                  mul          a6, a2, ra
                  fsgnj.s      fa2, fs2, fs0
                  mul          t4, gp, t6
                  fdiv.s       fs7, ft11, fa4
                  sra          t5, a6, a6
                  fclass.s     a4, fa3
                  sltiu        t2, t6, 1062
                  fsub.s       ft3, fa0, fs2, rup
                  and          a2, s10, t1
                  sll          ra, a5, a3
                  sra          s7, s2, s3
                  ori          t5, tp, -548
                  fsgnjx.s     fa1, ft9, fa7
                  mul          s0, t6, t3
                  fmul.s       fs1, fs9, ft11, rdn
                  sll          zero, a0, t0
                  divu         a0, a7, t2
                  xor          s3, s5, a0
                  srl          tp, s4, t6
                  srl          gp, a1, sp
                  auipc        s1, 257141
                  or           zero, s5, a1
                  sub          s4, s0, a6
                  andi         a3, zero, 1236
                  fdiv.s       fs4, fa2, ft0, rup
                  nop
                  mulhu        ra, s10, s7
                  or           a2, t0, s10
                  fsqrt.s      fs11, fa5
                  fcvt.wu.s    gp, ft1, rmm
                  or           ra, t2, s10
                  fmax.s       ft0, ft10, ft8
                  div          gp, s7, a0
                  fadd.s       fa7, ft5, ft11
                  mulhsu       tp, t6, s3
                  fadd.s       fs2, fa7, ft5, rdn
                  fcvt.w.s     ra, ft7, rup
                  fsqrt.s      fa0, ft8, rtz
                  sll          s10, a2, a3
                  fsub.s       ft6, ft4, ft9, rdn
                  xori         s11, sp, 1074
                  slt          s7, s2, tp
                  fcvt.w.s     a1, fa7
                  srl          a0, t2, s1
                  sltu         s3, zero, s1
                  mulh         t4, s2, sp
                  fsgnjn.s     fa1, fs8, fs7
                  slli         zero, s6, 4
                  fcvt.s.w     fa0, tp
                  sltiu        s11, s0, 528
                  slli         zero, s1, 27
                  fsub.s       fa6, ft8, ft3, rtz
                  srli         t5, a7, 1
                  divu         t4, t4, gp
                  fcvt.w.s     s5, ft7
                  mulhsu       t2, s6, s7
                  xori         s11, s6, 11
                  or           ra, s0, s9
                  sra          s7, ra, s10
                  fcvt.s.w     fa2, s10, rup
                  slti         s5, t3, -413
                  fsqrt.s      ft8, ft4
                  fsub.s       ft7, fs11, fs8
                  srl          ra, a6, s5
                  feq.s        s3, fs9, fa2
                  sub          a7, s6, s9
                  mul          t5, s3, s11
                  mulhu        t2, t1, gp
                  xor          s0, t0, a1
                  mulhu        a4, zero, ra
                  div          tp, s0, s1
                  fclass.s     sp, fa1
                  fcvt.s.wu    ft5, tp, rtz
                  fsgnjx.s     fs8, ft11, fa2
                  div          s2, s6, s2
                  fclass.s     a6, fs2
                  mulhu        s8, a0, t5
                  fadd.s       fs0, ft5, fs0
                  sltiu        gp, s7, -583
                  sra          t4, s3, s4
                  fdiv.s       ft3, fs10, fs4, rtz
                  add          s8, a1, s7
                  sub          t0, s10, s10
                  slt          zero, a7, s11
                  fmul.s       ft7, fs5, fa3, rup
                  fsub.s       fs9, fs0, fs4, rne
                  fle.s        a3, fs7, fs6
                  sltu         ra, s9, t5
                  mulhsu       t6, s0, s10
                  or           s11, a6, s1
                  sll          a2, tp, a6
                  fsgnj.s      ft9, fs1, fs9
                  fsgnjx.s     ft1, ft1, ft10
                  mulhsu       t4, s6, a4
                  slli         s1, a3, 31
                  addi         t4, a5, 844
                  addi         zero, a0, -69
                  fmv.x.w      a1, fs7
                  slt          s10, s6, t6
                  xori         s8, a3, 942
                  addi         zero, ra, 1358
                  fsgnjx.s     fs11, fs8, ft6
                  add          zero, s1, s10
                  remu         s9, t1, s10
                  srli         s6, a7, 29
                  addi         sp, s6, -1388
                  rem          a0, s2, t3
                  sltu         s9, s1, s11
                  lui          a7, 433540
                  rem          s4, s1, t6
                  sra          a0, a2, t1
                  sub          s10, tp, s5
                  fcvt.s.wu    fa2, s0
                  nop
                  add          a0, t2, s2
                  sub          zero, a0, t2
                  fsgnjx.s     ft9, ft11, ft8
                  fmul.s       fa2, fa4, fs7
                  srli         t0, a1, 13
                  fcvt.s.wu    fs8, a2
                  addi         ra, s8, 1757
                  addi         gp, a7, -1365
                  fdiv.s       fs2, ft5, fs11
                  fsqrt.s      fs3, ft3, rmm
                  fsqrt.s      ft1, ft1
                  fsqrt.s      ft4, fs8
                  slli         s2, t5, 29
                  flt.s        s1, fa3, fa4
                  fmax.s       fs0, ft7, fs8
                  mulhu        a3, a7, a1
                  add          t4, t0, a4
                  fcvt.w.s     s6, fa6
                  fsgnjx.s     fs7, ft1, fs6
                  feq.s        s9, fa4, fa1
                  sll          gp, zero, t6
                  fclass.s     s2, ft8
                  slli         sp, sp, 19
                  fcvt.wu.s    t0, ft1, rmm
                  fmax.s       ft2, fs1, ft4
                  xor          gp, s2, s9
                  fmv.x.w      s8, fa0
                  fcvt.s.wu    ft3, a2, rdn
                  slti         gp, a5, -821
                  sltu         gp, s8, s6
                  sll          a4, t4, a5
                  fcvt.wu.s    s10, fs1, rup
                  auipc        t4, 531933
                  fmul.s       ft1, fa7, ft10, rmm
                  xor          s7, gp, s5
                  slt          a7, s9, t4
                  auipc        zero, 555800
                  fadd.s       fs3, ft2, fs5
                  slli         a2, t5, 23
                  slli         ra, t0, 30
                  fmin.s       fs8, fa0, ft11
                  srli         a3, s9, 8
                  divu         s1, s9, t6
                  fle.s        a7, fs0, fs8
                  and          s2, s7, t6
                  auipc        s11, 1038900
                  slt          t2, t6, t2
                  div          s3, a1, a4
                  remu         a3, a4, s10
                  flt.s        t4, fs3, fs1
                  fsgnjn.s     fs4, fa6, fs1
                  mulhu        t2, s3, a6
                  auipc        tp, 105356
                  fsqrt.s      ft10, fs4
                  remu         s0, a5, t2
                  sra          s8, a6, a0
                  fsub.s       fa1, fs3, ft6, rmm
                  fsqrt.s      ft10, fa4
                  fsqrt.s      fs4, fs4
                  xori         ra, t3, 179
                  divu         s5, s5, s5
                  fmul.s       fs0, fa2, fs1
                  fsgnjx.s     fa7, fa7, ft8
                  fcvt.s.w     fa7, s9, rmm
                  fdiv.s       fs6, fa6, ft5
                  lui          s1, 408778
                  ori          a7, a2, 938
                  div          a4, a4, s11
                  add          s11, a6, a7
                  add          sp, s9, a0
                  remu         t2, s10, t1
                  fle.s        zero, fa2, fs7
                  fmin.s       fs8, fs11, ft4
                  sltu         zero, a7, a6
                  fmax.s       fs10, ft4, fa7
                  slli         s10, t5, 4
                  andi         s9, t3, -2021
                  fadd.s       fs10, fs1, fs2
                  divu         a4, sp, tp
                  slli         a6, s7, 6
                  mulh         a0, a7, a4
                  fadd.s       fa5, ft4, ft8, rne
                  fdiv.s       fs6, fs11, fa3
                  slti         s11, a3, 710
                  andi         ra, a4, -639
                  slli         zero, gp, 2
                  sltiu        t6, a4, 384
                  fcvt.wu.s    s10, ft3, rtz
                  mulhsu       a0, a3, a4
                  sltu         a4, zero, a1
                  div          t5, a2, t6
                  sltiu        s6, s9, 1874
                  fle.s        s11, fs1, fa4
                  fsgnjn.s     ft6, ft5, fs0
                  fdiv.s       ft7, fs4, fs5
                  div          t6, s11, a0
                  srli         t2, s8, 27
                  fcvt.s.wu    fs8, s3, rdn
                  fcvt.wu.s    a6, fa5
                  fmax.s       fs0, fs1, ft7
                  fadd.s       fs6, fs2, ft10
                  fsqrt.s      ft3, fs2
                  mulhu        a1, t3, ra
                  sll          s3, t2, ra
                  xor          a2, gp, s10
                  fmv.x.w      s7, ft2
                  fcvt.w.s     tp, ft0, rdn
                  fmv.w.x      ft9, gp
                  andi         s5, s8, 1006
                  fcvt.s.wu    fs6, s9, rmm
                  fmul.s       fs1, ft11, ft11
                  fcvt.s.wu    ft6, s2
                  slli         a1, s6, 21
                  sra          s11, gp, s9
                  or           t6, t3, s5
                  fdiv.s       ft11, ft4, ft3, rne
                  fcvt.wu.s    s3, fs1
                  auipc        s6, 157771
                  sltiu        a6, a1, 1540
                  srai         tp, a1, 0
                  sltu         a0, s0, t5
                  fsqrt.s      fs5, fa3, rne
                  fcvt.s.wu    ft11, s4, rup
                  fdiv.s       ft3, ft3, ft11
                  srl          ra, zero, t6
                  xor          ra, sp, a2
                  slli         s5, a6, 26
                  fcvt.wu.s    s2, fa6, rmm
                  sltu         a0, t3, t1
                  and          s8, s0, t3
                  fcvt.s.w     ft1, s6
                  add          s7, t3, a0
                  feq.s        s9, fa3, ft2
                  fcvt.w.s     gp, fs2, rmm
                  slt          s11, a2, s4
                  fsgnjn.s     fa2, ft8, ft1
                  fsgnjx.s     fs1, fs7, fs4
                  addi         s11, s8, 1343
                  slt          a1, a4, tp
                  sra          t6, a6, zero
                  mulhu        s8, s9, t5
                  fle.s        sp, ft8, fa4
                  fcvt.w.s     s5, ft8
                  addi         a3, a1, -1902
                  remu         s10, a6, s6
                  nop
                  fmax.s       ft3, fs2, fa1
                  fmul.s       fa0, fa7, ft4, rmm
                  remu         a0, a1, a3
                  srai         a6, s1, 24
                  and          t4, s6, a6
                  sltiu        t5, t6, -1818
                  fle.s        s3, ft5, ft3
                  and          s2, t6, s6
                  ori          a0, s6, 2014
                  sub          t6, t5, zero
                  slt          s0, s6, s2
                  fsgnjx.s     fa5, fa4, fs7
                  sub          s6, t2, s1
                  nop
                  srli         s8, a3, 26
                  fcvt.wu.s    s1, fa7
                  mulh         a6, s0, s3
                  mulh         s10, a5, tp
                  sltiu        s8, s2, -1084
                  srl          s1, t4, s4
                  fsub.s       fa5, ft9, fa7, rne
                  mulhsu       s10, a4, s0
                  lui          s10, 612267
                  sra          tp, s5, s3
                  fcvt.wu.s    s8, fs2
                  divu         s8, t4, t1
                  fadd.s       fa6, fs8, fa2, rtz
                  fle.s        s6, ft7, fa1
                  remu         tp, a2, a6
                  sll          s7, a5, gp
                  add          s4, a5, a2
                  and          tp, a3, zero
                  sub          a0, t5, s10
                  fcvt.wu.s    a7, ft10, rmm
                  fmv.w.x      fa2, a1
                  sll          t4, a5, zero
                  fcvt.s.w     fs5, s0
                  nop
                  mulhu        a7, t5, s8
                  xor          a0, tp, s3
                  nop
                  fmv.x.w      a0, fs5
                  fmul.s       fa0, fa7, fs7
                  or           s3, s9, t4
                  rem          s0, s2, s4
                  sra          t2, sp, sp
                  fmax.s       fa0, fs2, fa4
                  and          t2, s0, a6
                  sra          a6, a2, t6
                  fsgnjn.s     ft9, ft0, fs0
                  fmax.s       fs6, ft3, fs9
                  div          s10, s6, s2
                  fcvt.s.wu    fa2, a3
                  fmax.s       ft2, fa4, fs4
                  rem          s7, s5, a2
                  fmv.w.x      fa3, a4
                  fmul.s       fa1, ft11, fa3, rdn
                  remu         a1, s4, a3
                  slli         t6, t6, 7
                  fsgnjx.s     fs10, fa6, ft0
                  mulhu        t6, t0, zero
                  sra          sp, a1, s1
                  mulhu        s8, s8, a4
                  srl          a1, s10, s2
                  fcvt.wu.s    s10, fs10
                  slt          a4, a0, t6
                  or           s9, sp, s9
                  fsgnjn.s     fs0, fs10, fa5
                  and          a1, s0, a2
                  sll          s0, s9, a0
                  fsqrt.s      fa4, fa3, rdn
                  sra          a2, t4, s7
                  rem          a3, t5, s5
                  fsgnjn.s     ft4, fs9, ft1
                  fsgnj.s      ft4, fs3, fa6
                  fcvt.w.s     tp, ft8
                  fmax.s       fs5, ft6, fa0
                  srl          t6, s2, gp
                  slti         s1, s6, 1787
                  fmul.s       fs11, ft1, ft1
                  fcvt.w.s     s2, ft10, rne
                  slt          a4, s11, t3
                  sltu         s0, tp, t5
                  fsgnj.s      ft0, fa7, fs3
                  fclass.s     s0, fs5
                  xori         t4, s7, -1998
                  mulhsu       s5, a0, ra
                  fdiv.s       ft2, fs5, ft11, rdn
                  srli         a0, t1, 29
                  fsgnj.s      fs7, fs11, fs3
                  sub          zero, s5, a2
                  fclass.s     a1, fs3
                  xori         s6, s6, 1697
                  div          t5, a1, s0
                  mul          s0, s7, s7
                  fcvt.w.s     s6, fa5
                  fcvt.s.w     fs9, a7
                  add          s0, zero, s10
                  fcvt.wu.s    a0, ft9, rdn
                  fsub.s       ft4, fs10, ft8, rup
                  srl          t4, ra, t0
                  fsqrt.s      fs8, fs1
                  fcvt.w.s     t2, fs0, rtz
                  fcvt.s.wu    fa4, s9
                  fmin.s       fs4, fa0, ft4
                  fmul.s       ft3, fs8, fa2, rdn
                  fmin.s       ft8, fa2, ft6
                  sltiu        s7, s4, 1714
                  ori          s8, a2, 1696
                  srl          t5, s2, t5
                  feq.s        t6, fa3, fs4
                  rem          s2, a0, s1
                  sra          sp, s3, s3
                  sltiu        a7, gp, 151
                  mulh         s1, a4, t2
                  sra          a6, t0, zero
                  sll          a7, s10, s8
                  fmax.s       fs4, fs9, ft6
                  fmv.x.w      t2, fs3
                  sll          a7, gp, ra
                  or           gp, s5, a0
                  srl          a6, t2, s7
                  fle.s        t6, ft6, fs11
                  fdiv.s       fs4, ft1, ft1, rup
                  addi         t4, a2, 1184
                  fcvt.w.s     s9, fa2
                  addi         s6, a4, 325
                  sra          s2, s3, s11
                  slti         a2, ra, -1056
                  fdiv.s       fs2, fs0, fs9, rup
                  nop
                  andi         a2, t1, 1508
                  fmin.s       ft9, fs6, fa1
                  srl          a7, a2, a7
                  slt          gp, s2, a7
                  slti         a3, s3, 513
                  sra          s11, t2, zero
                  lui          s5, 346159
                  feq.s        a1, fa0, fs11
                  add          ra, a0, s11
                  fdiv.s       fs6, ft9, fa5
                  mulhu        gp, t0, s4
                  div          t2, a1, a3
                  fsgnjx.s     fs6, ft11, fs3
                  fmul.s       ft0, fs2, ft2, rup
                  fclass.s     s9, fs5
                  or           tp, a4, a5
                  nop
                  or           zero, s11, s0
                  fsgnjn.s     ft6, fa4, fa6
                  srli         s8, s8, 10
                  flt.s        s5, fs7, fs9
                  fmv.x.w      sp, fs2
                  fadd.s       ft1, fa4, fs6
                  fcvt.s.w     fs5, t1, rdn
                  xori         t0, s3, 1270
                  or           s9, a6, t4
                  xori         t5, zero, -1362
                  flt.s        gp, ft9, ft11
                  fcvt.w.s     t0, fs9, rmm
                  div          a6, t4, a0
                  fsgnjx.s     ft7, fa4, fs5
                  lui          zero, 759501
                  slli         zero, a4, 24
                  sub          a2, a5, a6
                  sltiu        s10, s4, -495
                  fsgnj.s      fs11, fs8, fs1
                  xor          a1, s9, t6
                  rem          s9, s6, ra
                  fsub.s       fs8, fs6, ft5
                  mulhu        a0, zero, s0
                  srai         s4, a4, 19
                  slt          s7, t4, gp
                  slti         t4, s11, 1088
                  fclass.s     t5, fs5
                  sra          a4, a3, t5
                  flt.s        ra, fs3, fs0
                  srai         s10, s8, 9
                  fsgnj.s      fs5, fs0, ft3
                  xor          a1, tp, a7
                  fcvt.s.w     fs3, t3
                  div          s8, a5, t6
                  sub          t6, t3, a2
                  sltu         s10, s8, a0
                  xori         ra, a3, -1517
                  fle.s        s7, fa5, fa5
                  fle.s        s2, fs1, fs0
                  slti         s1, tp, 632
                  slti         s2, s11, -513
                  xori         s7, s4, -1674
                  mulhsu       t2, s4, t2
                  fmin.s       fs2, fs11, ft7
                  srl          gp, gp, s1
                  lui          s1, 366512
                  sll          a7, a0, a7
                  ori          t4, s3, 385
                  andi         a0, s2, 1153
                  sltiu        s3, a6, -1394
                  slli         a6, s5, 23
                  lui          a4, 427319
                  mul          t4, t3, zero
                  divu         sp, zero, t4
                  xor          a0, s4, s3
                  and          a3, s0, s8
                  auipc        t4, 1013780
                  fsgnjx.s     fs10, fs1, fs1
                  flt.s        s7, ft8, ft2
                  fsub.s       fs3, fa2, fs4
                  fcvt.w.s     a1, ft10
                  fmax.s       fs6, ft11, fa2
                  ori          s11, s9, 284
                  fle.s        a1, ft10, fs8
                  div          s0, s1, s8
                  div          zero, s0, s7
                  fsgnjx.s     fa3, fa0, ft10
                  fmul.s       fs11, fs7, fa4, rdn
                  fmin.s       fa5, ft4, fa4
                  divu         s8, sp, a3
                  or           s5, s1, tp
                  auipc        s0, 108073
                  fmv.w.x      fs0, s6
                  fsgnjn.s     ft9, fs10, fa6
                  fadd.s       fs2, ft9, fs10, rne
                  and          t5, ra, a4
                  sra          tp, t6, a5
                  fclass.s     tp, ft11
                  fsgnjn.s     fs2, ft8, fa2
                  srai         s8, s1, 16
                  nop
                  fsub.s       ft1, ft5, fs7
                  mulh         s4, gp, a7
                  xor          t2, sp, s8
                  fcvt.s.wu    fs4, a2, rne
                  fmv.w.x      fs1, t5
                  auipc        s2, 814218
                  divu         a2, s2, a5
                  srai         a3, a7, 20
                  fmv.w.x      ft4, t4
                  fsub.s       ft8, ft0, ft2, rdn
                  auipc        s4, 521398
                  srl          t6, ra, s7
                  slli         a6, t1, 21
                  mulhsu       zero, gp, a3
                  fmin.s       ft11, ft0, ft7
                  fmax.s       ft7, ft0, fs11
                  mulhu        s10, s2, s2
                  slti         a1, gp, -131
                  sub          a4, a6, s1
                  flt.s        s0, ft4, fs6
                  fcvt.s.wu    ft9, t1, rmm
                  ori          t5, a2, 1332
                  addi         a2, s8, 1863
                  sll          t6, t4, tp
                  fsub.s       fs5, ft4, ft7, rtz
                  srli         a7, s8, 11
                  mulhu        t0, s11, a7
                  slt          t6, a4, t0
                  feq.s        a3, ft2, ft3
                  fsgnjx.s     fa0, fs4, fs8
                  fmv.w.x      fa7, a4
                  fmv.w.x      fs4, s5
                  fmul.s       fa5, fa6, fa7
                  srl          a6, zero, s5
                  sll          t2, t5, s7
                  mulhu        s11, t2, s5
                  and          tp, t1, s6
                  fclass.s     s4, fa1
                  fcvt.s.wu    ft2, s0, rup
                  srl          a3, s10, s2
                  div          t5, s10, gp
                  xor          a7, s2, t1
                  srai         s4, s11, 18
                  fcvt.wu.s    s8, fs1, rmm
                  xor          s1, gp, tp
                  remu         s5, a7, t1
                  auipc        a2, 341617
                  fcvt.s.w     fa1, s8
                  fmul.s       fs8, fs9, fs1
                  mulh         a6, a6, s2
                  srli         s8, s8, 6
                  fmax.s       fa2, fa3, fa1
                  mulhu        t6, s8, t3
                  auipc        t5, 514478
                  sltiu        s11, s0, -1042
                  sll          s2, sp, s11
                  sra          s11, sp, a4
                  fmv.x.w      s11, ft5
                  fsgnj.s      fs11, fs1, fs4
                  fmax.s       fa7, ft2, fs8
                  flt.s        s8, fs7, fs6
                  remu         ra, s9, s10
                  fsgnjx.s     fa7, fs3, fs5
                  or           t5, a1, t5
                  add          s4, a4, s5
                  fsub.s       fs10, ft7, fs9
                  andi         s0, a5, 1116
                  feq.s        ra, fa3, ft2
                  auipc        s0, 1004626
                  mul          a2, gp, ra
                  fsub.s       ft7, fs4, fs5
                  rem          t2, a7, tp
                  auipc        a3, 853933
                  srli         t2, t1, 2
                  nop
                  fmv.x.w      a7, fa1
                  lui          a3, 924372
                  slt          sp, s6, s8
                  sra          t0, t4, a2
                  srl          a3, t3, t1
                  fmul.s       ft1, fs10, fs3
                  mulhsu       t4, s3, s2
                  srl          a4, a4, t0
                  fcvt.w.s     a3, ft10, rdn
                  sll          a6, t5, t0
                  remu         s1, s7, a3
                  fsqrt.s      ft5, fs6, rtz
                  fclass.s     s4, fa4
                  xori         a6, s5, 512
                  andi         s6, a0, -163
                  srai         t2, s1, 4
                  rem          s5, s8, a1
                  mulhu        s9, s8, t2
                  fcvt.s.wu    ft3, ra
                  auipc        s0, 58974
                  auipc        a7, 658499
                  mulhsu       a6, s4, a7
                  rem          ra, tp, a4
                  fmul.s       fs3, fa0, fs9, rmm
                  fcvt.s.wu    ft5, a4, rne
                  fcvt.s.w     fs10, s6, rup
                  fmv.x.w      s9, ft5
                  xor          s3, a6, zero
                  fcvt.s.w     fs9, a3, rmm
                  lui          t6, 981917
                  add          s9, a5, a7
                  div          s7, s7, s5
                  fcvt.s.w     fs3, s1
                  andi         sp, t2, -1129
                  fmv.x.w      sp, fs8
                  xor          a2, s1, t6
                  rem          t6, t1, s0
                  feq.s        t0, fs6, fs6
                  sub          t0, t0, a3
                  div          a2, s10, a3
                  xori         zero, t1, 2004
                  xor          tp, tp, s3
                  rem          s7, a0, s2
                  remu         s5, t0, a7
                  slli         s10, t5, 19
                  nop
                  fdiv.s       fa4, fs8, fs0, rup
                  slt          s3, a5, s8
                  rem          s4, s9, s9
                  fsgnj.s      fa2, fs5, fa0
                  fmin.s       fa5, fs6, ft3
                  slli         s1, a1, 31
                  fcvt.s.w     ft9, s3, rup
                  sltu         s11, a2, t2
                  xori         a3, tp, 1978
                  andi         s0, s4, 798
                  fcvt.w.s     t2, ft2, rup
                  fle.s        t0, fa3, ft1
                  div          t6, t3, sp
                  fcvt.s.w     fa5, zero, rne
                  fadd.s       fs6, fs2, ft6
                  fsub.s       fs6, ft10, fs11, rup
                  fadd.s       fs8, fs9, fs9, rdn
                  fclass.s     zero, ft9
                  sltu         gp, a7, ra
                  mulh         t4, t2, sp
                  fsgnjx.s     fs7, fs8, fs1
                  feq.s        zero, fa5, fs8
                  feq.s        ra, fs11, fs6
                  fsgnjx.s     fa3, fs10, fs5
                  mulhu        a3, t0, a2
                  divu         ra, s2, s3
                  auipc        a3, 588899
                  rem          a7, s7, s6
                  rem          s6, s4, s7
                  mulhu        s3, gp, a3
                  fmv.w.x      fa2, s9
                  feq.s        t4, ft10, fs0
                  fmul.s       fa6, fa6, ft5
                  fmax.s       fs9, ft4, fs7
                  or           tp, s7, t4
                  fadd.s       fa0, fa0, ft2, rtz
                  slli         sp, s11, 7
                  divu         a7, a6, t2
                  and          a1, s9, sp
                  sll          s10, s0, s5
                  fle.s        s11, fs2, fa4
                  xor          s10, a3, sp
                  fmv.w.x      fa5, s8
                  fsgnj.s      fa2, ft7, fs5
                  fmax.s       fs5, fs4, ft1
                  fdiv.s       ft2, fs0, ft7
                  fsgnjx.s     ft4, ft2, fa0
                  divu         s8, gp, s9
                  fcvt.w.s     t4, fs11
                  fcvt.w.s     gp, fa5
                  rem          s10, s5, t6
                  fmax.s       ft6, fs2, fs10
                  ori          s10, t6, 1471
                  addi         s1, s11, -1654
                  slli         s3, a6, 24
                  fle.s        a4, ft8, fs7
                  sll          sp, t2, a6
                  fsub.s       fs5, fs6, ft9, rtz
                  fsub.s       fa2, fs0, ft8
                  slt          sp, s5, t4
                  fsub.s       fs11, fs11, fs5
                  lui          a2, 465402
                  sltu         t2, t5, gp
                  fdiv.s       ft11, fs8, fs1
                  sltiu        sp, a4, 1765
                  sltu         s10, s1, a2
                  divu         t5, t4, s10
                  fmin.s       ft7, fs8, fs3
                  remu         zero, a3, a5
                  fmax.s       fs4, fa4, ft10
                  lui          t4, 93695
                  feq.s        s11, ft6, fs11
                  nop
                  ori          sp, a6, -1794
                  mulhu        s3, s4, ra
                  xori         s9, a7, 1451
                  mulhsu       s7, a4, tp
                  lui          sp, 983900
                  fle.s        s4, fs10, fs3
                  xori         s3, s11, 911
                  add          s10, s5, t4
                  fcvt.wu.s    s1, ft4
                  slli         a4, t2, 11
                  or           s11, s4, t0
                  fle.s        s10, ft1, fs3
                  fsub.s       ft5, fs8, ft9, rdn
                  divu         s4, s2, s4
                  flt.s        s9, fa7, fa7
                  fmin.s       fa0, fs8, fs8
                  slli         s6, s7, 17
                  sltiu        a2, a7, -540
                  fcvt.s.w     fs11, a3, rne
                  slli         a1, t2, 4
                  fadd.s       fs0, ft11, ft8, rne
                  xor          s2, t6, a3
                  fcvt.w.s     s3, fs1, rup
                  ori          s0, s8, 1485
                  fcvt.s.w     ft3, a1
                  fmv.w.x      ft5, t6
                  addi         a1, t1, -423
                  fsqrt.s      ft5, fs8
                  xor          s0, a6, a0
                  mulh         a1, a4, a5
                  fmax.s       fa2, fa5, fs0
                  slt          t0, s8, s6
                  flt.s        ra, fs10, fs5
                  ori          s1, s8, -1896
                  sltiu        s10, a0, -428
                  sltiu        a7, sp, 379
                  sll          sp, a5, a2
                  rem          a7, sp, zero
                  addi         s1, a3, -184
                  mul          a7, t2, a5
                  rem          s4, s11, s4
                  fle.s        s4, fs5, ft5
                  nop
                  srl          tp, s3, t1
                  auipc        zero, 397023
                  fsgnjn.s     fa7, fs4, fa3
                  mulh         s11, t0, s5
                  fcvt.s.wu    fs6, t0
                  fadd.s       fs5, fa5, fs1, rne
                  fle.s        s2, ft5, ft0
                  fsub.s       fs5, ft2, ft9
                  fmv.x.w      s1, ft1
                  feq.s        s11, ft4, fs0
                  fsub.s       ft1, fs4, fs1, rdn
                  fadd.s       fs2, fs3, fa0
                  fsgnjx.s     fa5, ft8, fs7
                  sub          gp, a0, s5
                  fcvt.w.s     a7, fs4
                  slli         a7, s8, 2
                  mulhu        s5, t4, zero
                  mulhsu       s10, s0, s4
                  div          a3, t4, gp
                  fmax.s       ft1, fs11, ft9
                  rem          a3, gp, s11
                  slli         ra, a6, 8
                  sra          tp, t5, a1
                  fmv.x.w      s10, fa4
                  andi         a6, t5, -223
                  and          t6, s5, t5
                  fclass.s     t0, ft7
                  flt.s        s7, fs2, fs5
                  andi         s4, a7, 773
                  remu         s1, a2, a2
                  srai         gp, zero, 27
                  xori         a6, a0, -1195
                  fmin.s       fs8, fa1, fs5
                  remu         a7, s6, t1
                  fcvt.s.wu    fs6, s1
                  fcvt.s.w     ft1, s6, rup
                  fmax.s       ft9, ft4, fa5
                  fsgnj.s      fs8, fa2, ft3
                  addi         s4, a4, -1351
                  sltiu        ra, s0, -1939
                  slt          s8, t3, a0
                  fmin.s       fa7, ft4, fa3
                  srl          s1, t4, a2
                  sltu         sp, a4, tp
                  fcvt.s.wu    fs3, a2
                  add          t4, t6, s10
                  andi         s6, s9, -1850
                  mulhsu       s0, s4, zero
                  fsub.s       ft11, ft11, ft5, rup
                  mulhu        s4, s5, gp
                  sub          s7, t2, ra
                  fcvt.s.wu    ft4, a3, rtz
                  srl          sp, a7, t6
                  sltu         a4, t5, a2
                  and          s5, s1, t4
                  add          s9, s4, a0
                  sltu         s6, s2, a0
                  add          s11, s6, s2
                  fsgnjn.s     fs7, fs4, fa3
                  srl          s10, s11, zero
                  fadd.s       fs4, fa6, ft7
                  add          t0, s3, a1
                  sra          s9, sp, s9
                  mulhsu       t2, s9, t0
                  slli         gp, t3, 23
                  fsub.s       ft3, ft4, fs3
                  slti         s0, gp, 1435
                  div          s1, s6, ra
                  mulh         a7, s4, s1
                  fsgnjx.s     fs10, fs3, fs5
                  xor          t6, s0, a2
                  lui          t0, 117042
                  slli         t2, t6, 23
                  xori         a2, sp, 820
                  sltu         a6, t4, a7
                  nop
                  fsgnjx.s     fs1, ft0, ft1
                  or           a7, s8, a6
                  div          t0, tp, t5
                  mulh         t5, a6, a3
                  auipc        zero, 203789
                  fle.s        s0, fs7, fs0
                  add          s10, t2, s4
                  xor          s0, a7, a0
                  feq.s        a7, fs10, fa5
                  auipc        gp, 162413
                  auipc        a2, 997676
                  xori         s7, zero, 305
                  fadd.s       fa6, fa5, fa2
                  slt          s0, s6, t6
                  fsgnj.s      fa0, ft4, fa2
                  fclass.s     s6, ft7
                  fmax.s       fa6, ft4, fs7
                  or           s10, a2, s5
                  xori         t6, s3, -366
                  fmul.s       ft8, fs8, ft11
                  mulh         t6, s2, t5
                  fcvt.w.s     t2, ft3
                  mul          s3, s9, a4
                  slti         s10, a1, -1125
                  fsgnjx.s     ft5, ft7, fs11
                  sub          a0, a4, t3
                  fcvt.wu.s    a1, fs5, rtz
                  flt.s        s4, fa4, fa7
                  remu         a7, s10, t4
                  fmul.s       ft0, fa2, ft6
                  xori         t0, s5, 2045
                  or           s10, a0, s4
                  fsub.s       fs1, fs6, fs0, rtz
                  rem          s0, s6, s9
                  add          tp, s9, gp
                  mulhsu       a1, s5, a5
                  auipc        t0, 252375
                  fmul.s       fs1, ft7, fs9
                  slti         s5, t1, -83
                  div          gp, a7, gp
                  mulhsu       a7, s3, a3
                  fsub.s       fs9, fs4, fa6, rmm
                  lui          zero, 207446
                  fcvt.wu.s    s9, fs1
                  mulh         s0, s0, s5
                  fsqrt.s      fs3, ft6, rdn
                  sll          tp, sp, a0
                  slt          s3, gp, s2
                  fmv.w.x      ft4, t1
                  mul          sp, s6, t1
                  srl          s11, t2, s0
                  fcvt.wu.s    a6, fa7
                  fsqrt.s      fs7, fa6, rmm
                  rem          s8, s9, s5
                  feq.s        s1, fs5, fs11
                  fmul.s       fs5, fs10, fa0, rup
                  divu         a6, s9, s6
                  fsgnjn.s     ft10, ft10, ft4
                  remu         s6, t2, s11
                  or           a2, a7, t2
                  sltu         s3, sp, s6
                  fsgnjn.s     fs4, fs2, ft1
                  fcvt.s.w     fs8, t3
                  fmv.x.w      s5, ft0
                  and          gp, s10, a0
                  slti         ra, a6, -343
                  mulhu        s1, zero, s1
                  mul          tp, tp, s9
                  fsqrt.s      ft9, ft0, rup
                  fmax.s       ft10, fs4, fa4
                  or           s8, s8, s5
                  fmul.s       fs11, fs5, fa7
                  fmul.s       fs6, fs0, fa1, rne
                  fmv.w.x      fa3, s5
                  sra          zero, t3, a7
                  slli         t4, ra, 26
                  srl          s5, t4, s10
                  srl          a7, s9, t5
                  fcvt.wu.s    s11, fa7, rtz
                  fsgnjn.s     fa4, ft1, fa7
                  add          s11, a4, a7
                  srl          a3, a4, s2
                  fmin.s       fs2, fs0, ft8
                  feq.s        t5, fs8, fs4
                  fcvt.w.s     a7, fs7, rup
                  rem          a4, s5, tp
                  fsgnj.s      fa4, fa7, ft9
                  xor          t6, t0, s11
                  add          a2, s8, t3
                  sltu         a6, a4, a7
                  rem          s0, a6, t1
                  fdiv.s       fs5, fs0, fa1
                  fsgnjn.s     ft6, fs7, ft5
                  flt.s        s8, fs8, fs10
                  mul          s8, gp, sp
                  sltiu        t2, a6, -1678
                  sll          s1, t0, t5
                  mulhu        s8, t3, s2
                  lui          s2, 93216
                  fcvt.w.s     s1, fs5, rdn
                  divu         t2, s1, ra
                  fcvt.w.s     zero, fs0
                  fclass.s     a0, fs7
                  fsqrt.s      ft3, fa5, rmm
                  sltiu        t0, s1, 1344
                  mulh         tp, s7, a5
                  fsgnj.s      fs9, fs8, fa3
                  div          a0, s0, s8
                  mulh         s0, a1, t0
                  fdiv.s       fs3, fs6, fs7, rup
                  srli         a2, s6, 15
                  fclass.s     a1, ft9
                  fcvt.wu.s    a7, fs9, rup
                  add          t5, t1, a2
                  slli         sp, s9, 17
                  div          ra, a6, s4
                  or           tp, t4, tp
                  fmax.s       fs3, ft9, ft1
                  xori         s2, t2, 1546
                  auipc        s2, 169694
                  sra          a0, s7, t0
                  sub          a4, t2, zero
                  srli         zero, a3, 15
                  sltiu        sp, s5, 139
                  sltiu        gp, a4, 619
                  fmv.x.w      a3, fs4
                  flt.s        t0, ft1, fa6
                  mulh         t4, t0, s4
                  remu         s8, t1, t0
                  fsgnjx.s     ft2, ft10, ft1
                  addi         s6, s11, 390
                  fadd.s       fa6, fa2, ft6, rtz
                  fle.s        s2, ft6, fa5
                  srai         a0, s6, 27
                  xor          s10, a7, t6
                  fmv.x.w      zero, fs0
                  slti         s3, tp, -411
                  fcvt.wu.s    s8, fs11, rne
                  addi         s2, a1, -1711
                  fsgnj.s      ft3, fs5, ft6
                  auipc        gp, 90142
                  addi         s9, s0, -731
                  divu         zero, a2, s2
                  auipc        s11, 907603
                  sra          a2, t2, s0
                  fsgnj.s      ft7, fs0, ft9
                  and          t6, a6, s3
                  xori         s0, s3, 1321
                  fcvt.s.w     ft5, t6, rup
                  fsgnjx.s     ft4, ft1, ft6
                  fmul.s       fs1, fs3, fs6
                  sub          t6, ra, a3
                  fcvt.w.s     s10, fa7, rtz
                  srai         tp, s3, 10
                  srli         a4, t0, 16
                  slti         a6, s4, -1449
                  srl          ra, a7, s2
                  slti         s9, t1, -1283
                  add          s5, sp, a6
                  flt.s        a1, fa7, ft9
                  remu         s5, a1, sp
                  fsgnj.s      fs0, fa5, ft11
                  fsgnj.s      ft7, ft6, ft9
                  fcvt.w.s     t6, fs4, rtz
                  srai         s6, a7, 19
                  fmv.x.w      s10, fs1
                  srl          ra, a7, a7
                  fmv.w.x      fa0, a0
                  fsgnj.s      fs10, fa5, ft2
                  rem          zero, s5, t6
                  fdiv.s       ft8, fs9, fs3, rne
                  sltu         s5, s7, s0
                  feq.s        s1, ft3, fs2
                  fsgnjn.s     ft5, fa7, ft9
                  fclass.s     s9, ft0
                  fsqrt.s      ft6, fs6
                  lui          s7, 655062
                  lui          a0, 283715
                  sub          s11, s3, a0
                  fmax.s       fs1, fa3, fa2
                  fmin.s       fa2, ft2, fs11
                  fclass.s     s7, fs7
                  sltiu        zero, t1, 1459
                  and          a6, s1, ra
                  fsqrt.s      ft11, ft8, rne
                  fsgnj.s      fa5, fs11, fs6
                  div          s10, s9, a7
                  sra          a6, t0, s10
                  fmax.s       fa0, fs9, fs1
                  fsgnjx.s     fa0, ft3, ft2
                  lui          gp, 871406
                  add          tp, s3, sp
                  andi         s1, s0, 1374
                  slli         s6, a3, 8
                  xori         a2, s9, -1501
                  nop
                  fsgnjn.s     ft4, fs7, ft3
                  divu         t5, s7, s1
                  fdiv.s       ft0, fs6, fa7
                  fadd.s       ft7, fs3, fs10
                  auipc        tp, 227386
                  auipc        s5, 603907
                  or           s5, zero, sp
                  fmul.s       ft10, ft1, fa3
                  mulh         s11, t1, t3
                  fmax.s       fs3, ft10, fs2
                  fmax.s       fs1, fs11, fa1
                  fcvt.s.wu    fs8, s2, rmm
                  mul          gp, a7, a4
                  fmv.x.w      s7, fa3
                  slti         t2, s1, -399
                  fdiv.s       fa1, fa2, fa6, rdn
                  srl          s11, s6, s6
                  sltiu        s9, t4, 1105
                  fsqrt.s      ft6, ft4
                  auipc        s3, 584923
                  ori          s7, tp, -836
                  fle.s        s6, ft7, fs6
                  slt          t2, ra, s1
                  addi         s0, s1, -2035
                  sltiu        s0, a3, -1656
                  srli         s7, a5, 5
                  flt.s        t6, fs8, fa4
                  fcvt.w.s     s7, fs7
                  andi         s0, ra, 1808
                  srli         s3, t1, 12
                  mulh         a3, s5, t2
                  sll          s1, s5, s8
                  slt          s4, t5, a1
                  ori          s0, s0, -888
                  fmin.s       fa1, fs8, ft7
                  feq.s        s4, ft1, ft8
                  fcvt.wu.s    s10, fa1
                  slti         a1, t2, 828
                  flt.s        a6, fs5, fs0
                  fmax.s       ft3, fs11, ft1
                  slli         s5, a7, 1
                  sltu         t2, s7, s7
                  xor          t4, t4, t1
                  sltiu        a2, a7, -1918
                  auipc        s6, 39630
                  fsgnjx.s     ft9, ft1, ft9
                  rem          t2, s6, ra
                  srai         s6, a4, 26
                  fmv.x.w      a2, ft10
                  fcvt.w.s     s11, ft7, rup
                  feq.s        s9, fa0, fa3
                  sltu         a7, s9, t0
                  mulh         ra, a3, tp
                  nop
                  srai         s10, tp, 26
                  fsub.s       fs1, ft4, fa4, rne
                  fsub.s       fa4, fs3, fs8
                  fcvt.w.s     t6, fs4
                  feq.s        s10, fa1, fa0
                  mulh         s4, s5, a0
                  slli         t5, a4, 6
                  feq.s        t0, fa3, fs7
                  sub          a1, s9, t6
                  add          a7, s7, ra
                  fsgnjn.s     fa0, fa4, fs0
                  remu         s1, t5, s4
                  srl          t2, s0, a2
                  fclass.s     a4, ft11
                  srli         s6, sp, 21
                  and          t0, s0, a0
                  srai         t6, t4, 16
                  fmin.s       fa3, fs3, fa2
                  fcvt.w.s     s0, ft4
                  fsqrt.s      fa7, ft4, rmm
                  sltiu        s8, s0, -346
                  fclass.s     s8, ft6
                  slt          a3, a1, a5
                  rem          s0, s5, gp
                  add          a2, zero, a7
                  slli         s8, t6, 6
                  fle.s        s10, ft10, ft3
                  sltiu        ra, s6, 1880
                  fcvt.w.s     a1, fa3
                  srli         s7, s5, 29
                  xor          a1, s9, s1
                  mulh         ra, t4, s7
                  srli         sp, s11, 12
                  flt.s        s0, fs1, fs9
                  fle.s        a3, fa6, fs7
                  mul          t6, a6, a1
                  remu         s5, s2, a7
                  fdiv.s       ft1, fa6, fa1
                  fadd.s       ft10, ft3, fs9
                  feq.s        a2, ft8, ft10
                  srli         zero, s7, 9
                  flt.s        s7, fa2, fs1
                  and          a0, s2, s7
                  fmv.x.w      s3, ft10
                  add          sp, s1, a1
                  sll          a3, tp, t0
                  andi         s2, tp, 778
                  sltu         s5, t0, t0
                  addi         s8, s7, -549
                  ori          ra, a6, -171
                  remu         a6, t3, s6
                  fmv.x.w      s1, fs0
                  sltu         ra, a3, a3
                  fmin.s       fs0, fs10, fs6
                  mul          s9, t4, sp
                  slti         ra, t3, -1680
                  or           a4, s1, s0
                  sra          t5, s4, a3
                  add          t0, s2, t5
                  nop
                  sltu         s2, t5, tp
                  fle.s        gp, fs1, ft8
                  fcvt.wu.s    s10, fa4
                  and          s8, s4, s2
                  fcvt.s.w     fs3, a5
                  slt          t4, s2, s10
                  lui          s9, 780065
                  fcvt.s.wu    fs8, s3, rne
                  mulhsu       t2, a6, s0
                  srai         s5, s11, 9
                  mulhsu       s2, ra, a0
                  fle.s        s11, ft3, fs6
                  mulhsu       s11, a1, t3
                  mul          a4, t0, gp
                  sll          a2, s9, t0
                  xor          s3, s5, s4
                  fmul.s       fa7, ft9, ft2
                  fclass.s     a2, ft6
                  fmv.x.w      s4, ft8
                  fcvt.s.w     ft8, zero
                  xor          s7, a4, t4
                  xori         s11, t2, -982
                  fadd.s       ft3, fa2, fs10
                  ori          t4, t0, 1672
                  fcvt.s.wu    fa2, gp, rne
                  mulhsu       ra, a6, s9
                  mul          s0, s11, a4
                  fsgnj.s      fs11, ft8, fa3
                  fsgnj.s      ft6, ft4, ft3
                  sra          t4, s10, t2
                  fcvt.s.w     fa4, t2, rtz
                  fmax.s       ft4, fs4, fs5
                  srai         s4, s8, 12
                  mulhsu       a4, tp, s5
                  addi         s2, s7, 1850
                  srl          a1, a7, s3
                  fadd.s       fa0, ft8, fa4, rne
                  mul          t6, s7, s4
                  mulhsu       s10, t3, a4
                  divu         a4, s2, sp
                  fclass.s     s3, ft2
                  slt          t5, tp, s1
                  srl          t0, a2, t1
                  fadd.s       ft6, ft4, fs4, rmm
                  fmax.s       fa2, fs6, fs6
                  slti         a3, t5, 1176
                  fadd.s       fs8, fa2, ft11
                  fmv.x.w      t2, fs9
                  slt          t6, ra, s10
                  xor          s8, t3, t3
                  divu         s8, s11, sp
                  nop
                  mulh         s9, a3, t4
                  or           s2, s2, t3
                  or           s11, t6, s8
                  fcvt.wu.s    s1, ft10
                  sra          s2, s6, a4
                  fmax.s       ft5, fs0, ft2
                  fcvt.wu.s    gp, fa3
                  ori          a6, t6, -939
                  fmax.s       fa3, ft0, fs4
                  fcvt.s.wu    fa6, s7, rup
                  sub          s9, a7, ra
                  fsgnjn.s     fa0, fa5, ft9
                  and          a0, t6, s4
                  fmv.w.x      ft6, s1
                  xor          a4, a1, t1
                  sltiu        s1, t0, -909
                  sltiu        t2, s4, 417
                  and          s1, a4, ra
                  srl          ra, t4, a5
                  div          a2, s10, a2
                  sltiu        a2, s2, 1455
                  fclass.s     tp, fs3
                  feq.s        a3, fs10, ft3
                  sub          s6, a0, t0
                  fcvt.w.s     s9, ft10, rup
                  flt.s        a4, ft9, fa1
                  fclass.s     s2, fs4
                  fmv.x.w      t5, ft2
                  sra          gp, a7, s1
                  remu         s11, a4, ra
                  remu         zero, s0, a6
                  addi         a6, s2, -1418
                  divu         ra, s6, a2
                  ori          gp, gp, 1051
                  srai         t0, s8, 2
                  xor          s1, a7, a4
                  remu         s8, s3, a3
                  xori         a7, gp, -1861
                  fdiv.s       fa7, ft0, ft2
                  fmv.x.w      a4, ft9
                  sll          s2, s10, ra
                  andi         a0, s8, 683
                  fsqrt.s      ft5, fa2
                  fcvt.w.s     s10, ft6
                  fcvt.w.s     ra, ft7
                  fdiv.s       ft3, ft1, fa1, rup
                  divu         s10, s6, a6
                  fmin.s       ft3, fs4, fa7
                  fsgnj.s      ft5, fs6, ft7
                  fsgnj.s      fs0, fa5, fs1
                  srli         a1, tp, 13
                  fcvt.w.s     s11, ft5, rtz
                  fdiv.s       fs5, ft9, ft7, rdn
                  srli         gp, a7, 4
                  fsub.s       fs6, fa7, fs10, rdn
                  fle.s        a3, ft9, ft5
                  sltiu        s6, a6, -1047
                  rem          s4, s10, s9
                  fcvt.s.wu    ft1, a0, rdn
                  fdiv.s       fs7, ft3, ft8
                  sltu         ra, s6, a6
                  fsqrt.s      fs7, ft6, rmm
                  divu         s3, a4, zero
                  fmax.s       fa1, fa2, fs11
                  mulhsu       s7, a5, a7
                  fle.s        zero, ft0, fa2
                  sltu         s6, a2, s5
                  srli         t2, ra, 12
                  srli         s5, t4, 26
                  remu         zero, t3, s0
                  fsub.s       fa3, fs4, fa4, rdn
                  xori         s11, s8, 100
                  fclass.s     a7, ft6
                  slti         gp, t5, 1190
                  fle.s        s7, fs0, fs11
                  nop
                  ori          t4, gp, 13
                  divu         t2, a6, s9
                  fsgnjx.s     fs7, fs7, fa3
                  andi         s1, s11, -1612
                  rem          gp, a3, s0
                  divu         t0, tp, s8
                  remu         s0, s8, s4
                  fmul.s       fs1, fs0, fs4
                  nop
                  srli         a3, sp, 29
                  fsgnj.s      ft3, fs6, fs4
                  fsgnjn.s     ft1, ft3, ft4
                  fdiv.s       ft8, ft5, ft6, rtz
                  lui          a0, 750554
                  sll          s2, gp, t5
                  or           a3, s8, s1
                  mulhsu       t5, s9, t4
                  flt.s        s4, ft2, ft8
                  nop
                  fcvt.s.w     ft2, a0, rne
                  fmv.x.w      sp, ft3
                  srli         s10, s2, 0
                  fadd.s       fs0, ft11, fa2
                  sra          a1, s4, ra
                  addi         t4, s2, -1554
                  divu         tp, s9, a0
                  fclass.s     a6, fa2
                  sltiu        tp, s9, -79
                  fle.s        s1, fs11, fs9
                  and          t0, s9, s9
                  rem          sp, a2, tp
                  divu         s11, s8, a1
                  fclass.s     s8, fs8
                  fcvt.s.wu    ft4, gp, rtz
                  fclass.s     t2, fs8
                  mulh         t6, t1, t4
                  auipc        s4, 539852
                  slt          t5, t1, s11
                  xor          a0, a4, s9
                  sra          s10, t6, sp
                  fsub.s       ft3, ft7, fa4, rdn
                  srai         s11, s0, 21
                  srli         a0, t5, 25
                  auipc        tp, 23132
                  add          a6, a6, tp
                  add          a1, sp, s10
                  srl          t4, s1, t0
                  lui          sp, 372012
                  and          s8, s0, a7
                  fmul.s       fa6, ft8, ft0
                  fle.s        s2, fs5, fs5
                  and          s1, zero, a7
                  mul          a2, s10, s6
                  slt          sp, a3, s0
                  fcvt.wu.s    t4, ft11, rtz
                  sra          ra, a6, t0
                  auipc        s7, 519299
                  add          a3, a5, s3
                  mulh         t0, s7, a2
                  fsgnj.s      fs6, fs4, ft5
                  slli         a4, s4, 9
                  slt          s4, s10, a6
                  slti         s4, s6, -615
                  fmin.s       fs3, fs6, ft3
                  sra          t4, s2, t5
                  fmul.s       fa2, ft1, ft5
                  srai         s6, s2, 3
                  srl          a3, t4, a6
                  sltiu        s7, a5, 1262
                  addi         t0, a7, -1744
                  fclass.s     a2, fs8
                  fsgnj.s      fs1, ft5, fa1
                  mulhsu       ra, sp, t0
                  fcvt.wu.s    s5, fa0
                  srl          sp, s9, sp
                  remu         a4, t2, a5
                  fclass.s     gp, ft8
                  rem          s8, ra, s5
                  fclass.s     s5, ft10
                  and          a2, a1, a3
                  fadd.s       fs5, ft3, fa2, rdn
                  divu         s9, t1, t1
                  sub          t6, gp, a6
                  fdiv.s       fa3, fs5, fs5, rtz
                  xori         s1, t6, -1487
                  mul          t0, s3, a5
                  fclass.s     a3, fs2
                  xori         s1, zero, 140
                  feq.s        t2, fs8, ft0
                  fmv.w.x      fs4, s2
                  mulhu        s1, s10, t5
                  fmul.s       ft10, ft6, fs0
                  fmv.w.x      ft7, a0
                  auipc        sp, 417195
                  addi         t6, s1, -457
                  auipc        a7, 1044512
                  mulh         t0, s10, t6
                  slli         ra, s4, 30
                  srli         s9, s9, 0
                  sltiu        s7, s4, 1829
                  slti         ra, s10, -1462
                  or           a7, a6, gp
                  feq.s        t0, fa7, ft6
                  sltiu        zero, a3, -1174
                  nop
                  fsgnjx.s     fa5, ft5, ft8
                  and          s7, t4, t3
                  sltu         s11, a6, s8
                  srl          t0, s0, a1
                  srli         s7, tp, 8
                  or           s0, s7, t3
                  fmv.w.x      fa5, t0
                  nop
                  fsgnjn.s     ft8, fa6, fs3
                  mulhu        a2, a5, t1
                  fadd.s       fa4, ft11, fa2
                  and          tp, s0, t3
                  flt.s        s8, fs4, ft5
                  add          s2, s10, s8
                  and          t5, t0, t1
                  add          s11, s4, s1
                  sub          s6, a5, a6
                  sltiu        a6, t6, 1181
                  srli         s8, a6, 6
                  fle.s        t4, fs8, ft4
                  sltiu        tp, tp, -684
                  mulhu        t4, s1, a5
                  or           s11, a4, s11
                  mulhu        t2, sp, t3
                  fsqrt.s      ft5, fs11, rtz
                  fsqrt.s      fs7, ft3
                  fcvt.s.w     fa5, s3
                  sltiu        t2, s0, 42
                  fcvt.wu.s    a4, fs9
                  or           zero, t4, s2
                  sltu         s7, t5, s7
                  remu         s8, t4, tp
                  fmin.s       fs10, fs1, fs7
                  mulh         a4, t4, a6
                  fmin.s       fs11, ft2, fs7
                  fmv.x.w      t6, ft11
                  andi         t4, t0, 660
                  fsgnj.s      fs3, fa5, fa2
                  addi         gp, s2, -5
                  slti         a7, s2, 1281
                  sltiu        t0, s8, 1078
                  auipc        t2, 242184
                  xori         a4, tp, -1867
                  fcvt.s.wu    fs2, s11, rup
                  fsub.s       fs7, fs4, fa4, rup
                  slt          s6, s5, t6
                  fsub.s       fs2, fa3, fs0
                  fcvt.s.w     fs0, a6, rne
                  or           t6, sp, ra
                  fmin.s       fa1, fs11, ft9
                  and          sp, s5, s11
                  mulhsu       tp, s1, s8
                  div          a3, t2, s0
                  fmax.s       ft7, ft3, ft6
                  slli         s0, a6, 16
                  mul          t4, ra, s8
                  sltu         t4, gp, s2
                  fcvt.wu.s    s8, fs6, rtz
                  fmv.w.x      fa3, s7
                  fle.s        s10, ft1, fa4
                  or           s1, s11, a7
                  or           s9, t5, zero
                  mulh         s6, a7, s4
                  andi         s10, ra, 61
                  feq.s        s2, ft7, fa6
                  lui          t5, 257925
                  andi         a1, s5, 1013
                  sltu         s11, s10, tp
                  remu         s11, a3, s5
                  fcvt.s.wu    fa3, gp
                  divu         sp, s7, a5
                  mulhu        s3, s2, t1
                  sub          s7, t0, s8
                  ori          s7, t2, -1595
                  fle.s        t2, ft4, ft10
                  rem          a1, t2, t2
                  fmul.s       ft5, fs8, fa3
                  fmax.s       ft11, fs5, ft7
                  rem          s9, ra, s4
                  sltiu        s4, s3, -360
                  slli         a2, t1, 15
                  mulhsu       s5, s6, s11
                  slti         s9, s8, 11
                  feq.s        s6, fa7, ft7
                  sra          s8, t3, tp
                  ori          a7, t0, 1471
                  slt          s5, s9, a2
                  srai         s3, s11, 22
                  div          s8, zero, s8
                  nop
                  ori          s4, sp, -1772
                  xori         a4, a3, -1238
                  addi         a0, t5, 1226
                  xor          t5, zero, sp
                  and          gp, s4, tp
                  divu         gp, t5, t5
                  or           t5, sp, t5
                  slti         a3, t5, 1064
                  auipc        t0, 652368
                  sra          a0, a7, s7
                  slti         s7, s10, -1037
                  fsub.s       ft1, fs0, ft9, rup
                  fdiv.s       fs4, fa4, fs1
                  srai         t6, t1, 5
                  sltiu        a7, s4, 1092
                  div          t4, t0, tp
                  andi         a6, s0, 1695
                  srai         s6, s9, 18
                  fsub.s       ft5, fa5, fs9, rup
                  xori         a1, a4, 525
                  slli         t2, ra, 4
                  fdiv.s       fa6, fs0, fs5, rmm
                  fcvt.s.wu    ft11, s4
                  sra          t6, t1, s7
                  div          s0, s7, a0
                  srli         s11, tp, 30
                  fcvt.w.s     s8, fa3
                  srl          s3, t0, s4
                  ori          s2, tp, 1435
                  slt          a4, s8, s4
                  fsgnjn.s     fs7, fs6, fa1
                  sra          a4, a5, s4
                  fsgnjn.s     ft1, fs4, ft5
                  fclass.s     s8, fa3
                  fsub.s       fs1, fs4, fa2
                  slti         t6, a1, 1574
                  fdiv.s       fa5, fs5, fs8, rup
                  feq.s        ra, fs2, ft10
                  fmax.s       fa2, fs11, fs6
                  srl          t0, a1, t5
                  add          s9, s7, s10
                  sra          t2, t1, a5
                  add          sp, t4, s3
                  slti         ra, t2, 1973
                  srai         a7, s6, 15
                  fcvt.s.w     fs2, gp
                  fclass.s     a7, ft11
                  fcvt.s.w     fs11, t4, rdn
                  fsqrt.s      fa1, fa3
                  sll          a7, s10, s11
                  sub          s3, a5, t5
                  fsub.s       ft6, fs10, ft10, rne
                  fmv.w.x      ft11, s2
                  mul          s7, a2, a2
                  srli         t5, t3, 7
                  divu         a0, s9, a5
                  fmin.s       fs0, ft7, fs3
                  srli         ra, a5, 25
                  nop
                  feq.s        ra, ft3, fa2
                  sltu         a0, s4, s7
                  srl          a1, s8, sp
                  ori          a7, s5, 1396
                  fcvt.s.wu    fs4, a1
                  sra          a0, a7, a7
                  nop
                  sub          t0, t3, a1
                  sll          s4, s11, s10
                  sll          s6, a2, a2
                  and          s3, s8, t0
                  and          s11, sp, t6
                  lui          t5, 2842
                  or           sp, s10, s1
                  fsgnj.s      fs10, fa7, fs10
                  flt.s        s11, fs3, fa4
                  divu         s11, s1, gp
                  lui          s8, 948286
                  remu         s10, t3, tp
                  fsgnj.s      fs2, fs0, fs6
                  fle.s        ra, fs3, fa3
                  mulhu        t4, a1, a0
                  mul          a2, t2, gp
                  fmv.x.w      t2, ft4
                  fsqrt.s      fa3, ft7, rmm
                  fadd.s       fa2, fs5, fs4, rne
                  fsub.s       fa1, ft8, ft11, rdn
                  fclass.s     s10, ft1
                  fcvt.s.w     fa6, s1, rdn
                  mulhsu       a0, a2, s2
                  fsgnj.s      ft9, fs4, fa2
                  or           gp, t2, a7
                  sltu         a3, zero, a4
                  fcvt.s.w     ft1, s2
                  slti         a4, t2, 1250
                  mulh         a0, s5, t4
                  fsub.s       ft5, fs2, fs7
                  divu         t6, s11, s5
                  and          a3, gp, t5
                  fmv.w.x      fs11, sp
                  nop
                  sltiu        t0, sp, -509
                  fcvt.s.wu    ft1, s4
                  fmv.w.x      ft11, t0
                  fsgnjn.s     ft2, fa6, ft11
                  fsgnjx.s     fs9, fa7, ft1
                  sra          a7, s6, s9
                  srl          tp, gp, s1
                  addi         a3, a1, -491
                  andi         s10, s11, 336
                  mulhu        a4, s0, s3
                  slt          s10, s4, a6
                  mulhsu       s6, s9, a0
                  sltu         t0, a5, t3
                  fcvt.s.w     ft9, a3, rtz
                  srl          sp, s2, tp
                  mulhsu       a4, zero, s5
                  divu         a3, t4, s2
                  slti         zero, s0, 37
                  fcvt.w.s     s9, ft0, rtz
                  fdiv.s       fa7, fa6, ft3
                  xor          sp, tp, s8
                  xor          t4, s1, t3
                  xori         t4, t2, 496
                  sltu         a0, a7, gp
                  fclass.s     a7, fs11
                  mulh         a1, s11, s10
                  or           t2, t6, s9
                  sra          t4, s9, a4
                  mulh         s9, s2, s0
                  nop
                  or           zero, tp, a6
                  sll          s5, s6, a6
                  add          a0, a2, a2
                  xori         s2, sp, 145
                  flt.s        s1, ft6, fs3
                  xor          s0, a4, a5
                  sll          a4, s4, t2
                  mulhu        s1, s8, t1
                  fsqrt.s      fs9, ft2
                  addi         a2, s10, -413
                  nop
                  slt          a7, s5, s8
                  sub          t2, a4, s7
                  fle.s        a2, ft10, fs7
                  auipc        t0, 510013
                  remu         s9, s8, a2
                  fmv.x.w      s2, ft11
                  rem          a3, a0, a4
                  fdiv.s       fs11, ft8, fa3
                  divu         s0, s8, sp
                  fcvt.wu.s    s6, ft3
                  fmin.s       fa7, fa0, fs3
                  remu         a1, s0, s8
                  fcvt.wu.s    a1, ft2
                  mulhu        s1, ra, s1
                  divu         t0, a7, s4
                  fclass.s     t4, ft0
                  sltiu        s2, s2, -495
                  fmin.s       fa3, fs7, ft3
                  slli         s11, t3, 21
                  xori         a6, sp, -911
                  fdiv.s       fs10, ft2, ft2, rtz
                  sub          t2, s6, zero
                  fcvt.w.s     s7, fs5
                  srli         s6, t0, 2
                  divu         a4, sp, s10
                  nop
                  fmin.s       fs6, fa6, ft8
                  fsub.s       fs3, fs0, ft8, rdn
                  rem          t2, a2, ra
                  sub          s10, s0, s6
                  srl          a7, a0, s1
                  mulhsu       s4, gp, a7
                  remu         a6, a3, s0
                  mulhu        a2, s0, s3
                  fclass.s     s6, fa2
                  fdiv.s       fs7, fs9, fs11, rdn
                  sub          gp, s11, s7
                  fsqrt.s      fs1, fs3
                  sltu         a4, t6, t1
                  andi         s4, t4, 626
                  fmv.w.x      fa6, tp
                  fmul.s       fa0, ft7, fa0, rne
                  fclass.s     a0, ft3
                  fsgnjn.s     fa1, fa1, ft4
                  fcvt.w.s     s7, fs9, rmm
                  fsgnjn.s     ft10, ft7, fa3
                  mulh         a6, s5, t1
                  fsgnjn.s     ft6, fa6, ft10
                  fsgnj.s      ft2, ft11, ft0
                  sltu         gp, a0, a4
                  fsub.s       ft6, fa3, fs2
                  divu         s10, gp, s0
                  sub          a6, s2, t5
                  fadd.s       fs3, ft0, fs3, rup
                  fsqrt.s      fs2, fs0
                  slli         s8, t4, 30
                  slti         t5, t5, -1904
                  fclass.s     t6, fs0
                  srl          a3, zero, s0
                  fsgnj.s      fa0, fs8, fs5
                  mulhu        a6, tp, s0
                  fsgnj.s      fs3, fs7, fs1
                  ori          zero, zero, 1803
                  fmul.s       ft5, ft6, ft8
                  mulhsu       s8, t4, a1
                  andi         a0, s5, 26
                  fmv.w.x      fa2, s11
                  sra          a0, sp, s9
                  srl          s8, s10, sp
                  sltu         zero, a7, s2
                  fsgnj.s      ft7, ft4, ft3
                  fsgnjx.s     fa7, ft10, fs1
                  remu         a6, t2, t4
                  sltu         a2, t3, a5
                  fmin.s       ft0, fa2, ft2
                  sltu         s1, t6, tp
                  sra          t5, s3, t0
                  fsgnjx.s     fa7, ft5, ft7
                  fsgnjx.s     fs2, ft3, ft8
                  andi         a7, a0, 1477
                  andi         s9, t1, -1026
                  rem          zero, s0, t1
                  div          t2, a7, t0
                  slt          t0, a1, s6
                  sub          s6, tp, a2
                  andi         s11, gp, 714
                  xori         a0, s10, -212
                  srai         t5, t3, 1
                  fdiv.s       ft0, fs5, fa4, rmm
                  mul          sp, a2, s1
                  fsgnj.s      fa3, fa3, fs0
                  sltu         s0, s2, s6
                  auipc        a3, 753228
                  fsqrt.s      fa3, ft10, rdn
                  mulhsu       a4, a5, s6
                  mul          a3, s2, s5
                  slli         ra, s1, 27
                  mul          s1, t2, s8
                  fmul.s       fs5, fa0, fs0, rmm
                  rem          a7, s7, a1
                  sub          s5, s11, a6
                  add          a4, s10, s0
                  fmax.s       ft3, fs4, fa3
                  xori         s4, t5, 280
                  add          t2, s1, a7
                  ori          s5, s1, -656
                  add          a2, t5, a2
                  fsub.s       fa0, ft0, ft5, rup
                  addi         a1, a6, -204
                  fmv.w.x      ft6, ra
                  xori         a3, t1, 399
                  sltu         s9, a6, zero
                  fsgnjx.s     fs11, fs3, fs11
                  auipc        s3, 457177
                  srl          s4, gp, a1
                  fsgnjx.s     ft7, fa4, fs4
                  fsgnjn.s     ft7, ft5, fs5
                  andi         s5, s9, -1506
                  srli         s5, a3, 3
                  fcvt.wu.s    zero, fs2, rdn
                  slt          t5, zero, s6
                  slli         gp, zero, 7
                  add          a7, zero, s4
                  fsqrt.s      ft11, fs9, rup
                  srl          t2, tp, s3
                  srl          t2, s8, t6
                  fdiv.s       fa2, fa1, fs10, rup
                  fmv.w.x      fs6, s6
                  div          t6, a1, gp
                  ori          s0, a0, 1585
                  fmv.x.w      a2, fa6
                  fmin.s       fa3, ft0, fs11
                  remu         s5, t6, s9
                  fmv.w.x      ft1, t1
                  rem          t2, zero, t5
                  xor          s4, a4, s6
                  auipc        gp, 208506
                  fdiv.s       fa4, ft8, fa6
                  mulh         a2, sp, t2
                  slti         a4, t1, -1073
                  srli         ra, s10, 2
                  fsgnjx.s     fa5, fa4, ft9
                  fdiv.s       ft9, fa2, fs7, rne
                  xori         a3, s6, 492
                  srai         a1, tp, 15
                  mulh         s0, ra, a7
                  fsqrt.s      ft3, ft7
                  fmv.x.w      s3, fs8
                  mulhsu       s5, sp, a6
                  fmv.w.x      fs7, s11
                  add          t6, gp, s5
                  fcvt.s.wu    fs3, s7
                  srli         a3, ra, 18
                  fcvt.s.w     fa7, s8, rtz
                  sltu         s8, a1, s4
                  fcvt.s.w     fa6, t1
                  xor          s8, s1, t3
                  mulhsu       t4, s8, s5
                  srl          a3, tp, t1
                  sltiu        t0, a4, 531
                  fsgnj.s      ft11, fs7, ft2
                  fmv.x.w      s2, ft3
                  flt.s        s4, ft9, fs5
                  sltu         s8, s2, t3
                  slt          gp, ra, ra
                  srli         zero, a3, 9
                  slti         a4, a3, 783
                  fclass.s     zero, ft10
                  fcvt.s.wu    ft10, a0, rne
                  fsgnjx.s     fa4, fa2, fs2
                  andi         s3, t3, -1907
                  sltu         a0, s7, t5
                  feq.s        s7, fs6, ft9
                  fmax.s       fa5, fs10, fs5
                  fmv.w.x      fa0, t5
                  sltu         ra, t0, t5
                  and          ra, a3, ra
                  auipc        sp, 515481
                  fsub.s       fs0, ft10, fs9
                  fcvt.wu.s    s11, ft3, rdn
                  fmin.s       fa3, fs2, fs9
                  mulh         a3, a1, s5
                  lui          t2, 412449
                  fmv.x.w      a4, fs4
                  fmax.s       fs6, fs6, ft9
                  fle.s        ra, ft4, fs3
                  fsgnj.s      ft9, ft1, fa6
                  fcvt.s.wu    ft11, s6
                  addi         s4, s4, -98
                  xori         sp, t4, -768
                  fclass.s     s2, fs8
                  srli         s2, s11, 13
                  srai         a3, s3, 21
                  fcvt.wu.s    s8, fa7
                  fsqrt.s      fs1, ft10, rtz
                  feq.s        s1, fa6, fs5
                  fcvt.w.s     s5, fs0
                  xor          tp, zero, t3
                  rem          s1, t3, s9
                  fmul.s       fa5, fs7, fa4, rne
                  addi         s10, a2, -1743
                  sll          s7, s5, a3
                  fsqrt.s      fs5, fs10, rne
                  fcvt.wu.s    ra, fs1
                  fmul.s       ft4, fs11, fs4, rne
                  fcvt.wu.s    a7, ft2, rmm
                  ori          gp, s9, -1572
                  slt          s0, s9, tp
                  lui          s4, 285446
                  ori          a6, a1, -815
                  fmax.s       ft7, fs7, ft11
                  mul          s10, s5, t1
                  fmv.w.x      fs0, gp
                  fmax.s       ft0, fs7, fa7
                  sra          s9, t2, s1
                  slt          s6, s8, s0
                  sub          s2, a2, a6
                  flt.s        s2, fa4, fs8
                  sra          a7, a2, s10
                  flt.s        sp, fs2, fa4
                  fmax.s       ft6, fs11, ft6
                  xor          t4, tp, s7
                  fsub.s       fa1, ft7, fs4
                  fsgnjn.s     fs3, ft8, fs1
                  fmul.s       fs6, fs6, ft2, rmm
                  div          s1, s4, a1
                  flt.s        a1, fa4, fs3
                  fsgnjx.s     fs4, ft5, ft4
                  fdiv.s       fa5, ft6, fs7
                  fmv.x.w      s7, ft7
                  fdiv.s       ft1, fs0, ft3, rdn
                  mulhsu       a1, gp, t4
                  flt.s        zero, fa3, fs3
                  nop
                  slli         s6, s9, 17
                  srl          s11, s8, s10
                  fmul.s       fs4, fs4, ft5
                  fmv.x.w      t6, ft11
                  fsgnjx.s     fs0, ft4, ft6
                  fdiv.s       ft8, fa6, fs4
                  fmin.s       ft5, fa2, fs10
                  xor          t0, t4, a0
                  srai         s3, gp, 7
                  feq.s        s5, fs0, fs9
                  fmin.s       fa6, fs9, ft7
                  sltu         a6, s10, t1
                  feq.s        s4, fa5, fs11
                  fmv.w.x      fs2, a3
                  mul          s6, a4, t3
                  fcvt.wu.s    s8, ft7, rup
                  fsgnjx.s     ft0, fs2, fs11
                  lui          t5, 924758
                  slti         s2, zero, -1691
                  lui          tp, 753386
                  lui          a7, 260593
                  mulhsu       ra, t4, s8
                  auipc        s11, 101242
                  fcvt.s.w     ft6, t2, rmm
                  andi         a0, tp, 151
                  fmv.w.x      fa6, s4
                  mul          s7, tp, t5
                  rem          s6, s8, tp
                  sll          s5, t1, a2
                  srai         s0, s0, 30
                  sltiu        a0, s8, -1474
                  remu         s8, a1, s8
                  flt.s        a6, fa1, ft6
                  fadd.s       ft0, fs10, fs3, rdn
                  fcvt.wu.s    sp, fs0, rup
                  sra          s4, s5, t4
                  fcvt.s.wu    ft0, s1, rdn
                  sltu         s8, s8, s0
                  fmv.x.w      s10, ft10
                  remu         s10, t5, s3
                  fmul.s       fs3, ft4, fa5, rne
                  xor          s11, t4, ra
                  srai         a7, t3, 4
                  xor          s0, t0, s8
                  mulhsu       t6, s1, a1
                  slti         t6, s9, -1018
                  srai         s3, s1, 13
                  fmv.w.x      ft3, sp
                  sub          s10, s5, t1
                  remu         zero, a0, gp
                  auipc        s2, 916212
                  xori         s7, sp, -440
                  divu         t2, t4, s7
                  flt.s        s8, ft8, ft1
                  mulhsu       a1, zero, a0
                  div          s1, a3, s10
                  fsub.s       fs2, ft5, ft7, rup
                  mulhsu       a4, gp, s0
                  fcvt.wu.s    a1, ft4, rdn
                  sltu         a4, s11, s3
                  fmv.x.w      gp, ft3
                  mulhu        a4, sp, s3
                  fadd.s       fs6, ft11, fs0, rne
                  fsgnjn.s     fs10, ft7, ft1
                  nop
                  fsqrt.s      ft8, ft11
                  fmv.x.w      tp, ft2
                  xor          s2, s9, s2
                  andi         s1, t6, 864
                  add          gp, gp, a7
                  fsgnj.s      fs7, fa1, fs3
                  srli         t6, t0, 20
                  feq.s        s3, fa1, ft6
                  fle.s        gp, fs0, fa7
                  slti         tp, s0, 1267
                  sltiu        s2, a3, -1456
                  fsgnjx.s     fa0, fs6, ft1
                  fsgnjx.s     ft0, fs8, fs3
                  sltu         a3, a4, zero
                  fmul.s       fs7, ft8, ft4, rtz
                  fsgnjx.s     fa4, fs7, fa5
                  mulhsu       t4, s5, a1
                  fsgnjn.s     fs11, fa3, ft6
                  feq.s        s0, fs5, ft8
                  fcvt.s.wu    ft6, s2
                  remu         s10, s11, sp
                  fclass.s     s3, ft2
                  sltiu        a4, zero, 1461
                  flt.s        s2, fs7, fs11
                  nop
                  fsgnj.s      fs6, ft9, fs0
                  auipc        a2, 807226
                  fsgnj.s      fs2, ft7, fs2
                  add          a0, s1, t4
                  fsgnjn.s     fs7, ft7, fa3
                  fle.s        s7, ft1, ft6
                  fcvt.w.s     s10, fa4, rne
                  slli         a4, s4, 14
                  fmax.s       fa0, ft6, fa3
                  sub          s4, s1, t4
                  mulh         a1, a2, a3
                  fsqrt.s      ft7, fs0
                  mulh         zero, zero, s11
                  rem          s7, a4, ra
                  and          t6, gp, gp
                  mulh         s5, sp, s9
                  fsqrt.s      fs5, fs9, rtz
                  sll          s6, t2, s4
                  fmax.s       fs8, fa2, fs2
                  slli         s9, t4, 2
                  div          s9, s2, s9
                  and          gp, ra, a4
                  auipc        s7, 221541
                  fmul.s       fa7, fs6, fa7, rup
                  fdiv.s       fs8, fa7, fa4, rdn
                  srai         s2, a4, 28
                  fdiv.s       ft8, ft9, fa6
                  fclass.s     s11, ft3
                  feq.s        s0, fs6, ft1
                  fmax.s       fs2, ft8, fs11
                  or           s9, a1, a1
                  sra          s0, s0, s0
                  xor          a6, a3, s5
                  xori         s9, a5, -285
                  fsgnjn.s     ft10, ft5, fs10
                  add          a0, t3, s5
                  slli         t4, t6, 3
                  sll          sp, s8, s3
                  flt.s        t2, ft1, fa1
                  sll          s8, s3, s8
                  slli         tp, ra, 10
                  or           a1, tp, sp
                  srai         s7, s0, 0
                  fclass.s     tp, ft4
                  ori          gp, s9, -873
                  fsgnjn.s     fs4, ft10, fs11
                  fcvt.wu.s    a2, fa6, rup
                  fsub.s       fa4, ft0, fs6, rtz
                  fmin.s       fa2, ft2, fa2
                  fmax.s       ft4, fa3, fa6
                  mulhu        s9, t5, s6
                  lui          t2, 793682
                  sltiu        zero, a0, 1455
                  remu         zero, t1, a6
                  fsgnjn.s     ft3, ft6, ft4
                  div          gp, s11, zero
                  fsgnjn.s     fs5, fs1, fa3
                  mulh         s4, s3, s8
                  sltiu        s7, a6, 694
                  fmv.x.w      t0, fa4
                  div          s0, a0, t5
                  xori         s11, a2, 1232
                  divu         s4, a2, sp
                  fsqrt.s      fa4, fa2, rmm
                  sltiu        a0, s5, -852
                  sra          sp, s7, t6
                  ori          s8, gp, 1569
                  fadd.s       ft3, fa6, fs3
                  auipc        sp, 249680
                  andi         a7, s4, -561
                  fsgnjn.s     ft0, fa3, fs4
                  slli         t4, s7, 12
                  sltu         a3, a3, s0
                  sll          tp, gp, a1
                  sub          t2, a3, ra
                  fmax.s       fs4, fs6, ft4
                  fmin.s       ft8, fa5, fs2
                  remu         s5, a4, a2
                  ori          a0, t3, 1043
                  sub          s4, s7, t6
                  fmin.s       ft1, fa0, ft4
                  div          a3, t0, zero
                  slt          a6, t0, s3
                  ori          a3, s9, 91
                  add          t6, ra, s10
                  fmax.s       fs8, fs9, ft3
                  sra          s3, s6, a2
                  srai         t4, s1, 5
                  fsgnj.s      fa7, fa3, fa4
                  fsqrt.s      fs0, fa1
                  fsgnj.s      fa3, fa0, ft5
                  fsqrt.s      ft1, fs6
                  slti         a7, a4, -168
                  srai         a7, a3, 23
                  srli         t5, t2, 13
                  fmin.s       fa6, ft2, fs8
                  rem          s5, t3, t2
                  mul          t6, sp, a7
                  srli         zero, s10, 3
                  fsgnjx.s     fs3, fs6, fs3
                  fsgnjx.s     fa4, ft7, fs9
                  add          s4, s2, gp
                  mul          s1, a0, s7
                  mulh         a4, s6, t1
                  sub          sp, t3, t3
                  rem          sp, s6, s8
                  fmin.s       fs10, ft3, fa6
                  fcvt.s.wu    fs1, a5
                  fmv.x.w      a0, fa0
                  srai         s7, a0, 20
                  flt.s        t2, fa0, fs9
                  and          t4, a1, s9
                  sub          gp, s2, a1
                  sra          ra, s8, s10
                  divu         s3, a3, s9
                  slt          a2, t1, s5
                  fmul.s       fs11, ft1, ft7
                  mul          gp, s6, a0
                  flt.s        a2, fs3, fa0
                  auipc        a2, 899092
                  fsgnjx.s     ft11, fs6, fa0
                  fcvt.w.s     s4, ft10
                  srl          s11, s2, s1
                  fmax.s       ft3, ft10, fa3
                  mulhsu       a2, s7, a4
                  slli         gp, t2, 31
                  mul          a3, s3, s9
                  rem          s3, s5, s5
                  fsub.s       ft1, ft2, ft2, rup
                  and          s11, s4, s11
                  mulhsu       tp, a2, a3
                  fcvt.wu.s    a2, ft9, rmm
                  fsqrt.s      ft10, ft4
                  fmax.s       fa5, fa3, ft10
                  rem          a7, t2, s5
                  fsqrt.s      ft9, ft4
                  fcvt.s.wu    fa1, a1, rdn
                  mulhsu       s9, s11, s0
                  xor          a6, s1, s8
                  fle.s        s4, fa5, fa2
                  slli         ra, s11, 22
                  fdiv.s       ft3, ft10, fa3
                  fmul.s       ft3, fa6, fa3
                  fsgnjx.s     fs6, ft5, fa3
                  fmv.x.w      s0, fs8
                  andi         s6, s2, 1728
                  fdiv.s       fs1, fs5, fa4, rne
                  fsgnjn.s     fs9, fa3, ft8
                  lui          a3, 400962
                  addi         a2, a0, 307
                  sltu         t0, s8, s0
                  fsqrt.s      fs5, fs5, rmm
                  fmul.s       ft5, ft7, ft1, rdn
                  fsub.s       fa2, fa7, ft1, rdn
                  fsgnjn.s     ft8, ft7, fs0
                  fadd.s       fa2, fs0, fa3, rup
                  fmv.w.x      fs10, t6
                  slt          s7, zero, s9
                  srl          s6, a1, a7
                  fmv.w.x      fa3, gp
                  addi         s11, t1, 1367
                  mul          t6, s11, s6
                  andi         a1, s6, 1265
                  and          s2, ra, sp
                  remu         t4, a5, a3
                  rem          t6, s4, t3
                  divu         t6, a6, s0
                  fsub.s       fa4, fs10, ft10, rdn
                  fcvt.w.s     t4, fs10, rtz
                  mulh         a4, s6, a3
                  fmax.s       ft6, ft9, fa1
                  remu         s8, gp, s2
                  fsgnj.s      fa3, fs6, fa1
                  sltiu        a7, s4, -1750
                  sra          a4, t3, a3
                  divu         zero, s5, t6
                  mulh         s5, a5, zero
                  fmul.s       ft10, ft6, ft4, rtz
                  fsgnjx.s     ft5, fa5, ft4
                  fcvt.w.s     s5, ft1, rmm
                  fsgnj.s      fa7, ft8, ft1
                  sll          t5, s2, s6
                  sltiu        t4, s8, -1847
                  slt          zero, t6, t3
                  mulhu        a0, s1, t0
                  srai         zero, s0, 4
                  and          t2, s11, a6
                  slli         a6, s7, 31
                  fcvt.s.wu    fa2, s3, rne
                  or           s8, a0, s4
                  fsgnjn.s     fs8, fa2, ft11
                  ori          a2, s2, -1053
                  fsgnjx.s     fs11, fs2, fa4
                  sltu         t4, t1, zero
                  fcvt.s.wu    fs7, s2
                  fsgnj.s      ft9, fa5, fa4
                  add          s0, a2, zero
                  slt          s8, s7, a5
                  fle.s        s5, fs4, ft7
                  fcvt.w.s     t4, fs11
                  nop
                  fadd.s       fa7, fa5, ft11
                  sll          s7, t0, tp
                  fmax.s       ft7, fa1, fs4
                  fsqrt.s      fa3, fs0, rne
                  remu         a3, tp, a3
                  slt          s3, t3, s6
                  sltiu        a3, a7, -863
                  addi         zero, gp, 1756
                  xori         a1, s2, -1151
                  fdiv.s       ft7, ft0, ft11, rup
                  mulhu        gp, a7, a3
                  remu         a0, s0, t3
                  slt          s10, s8, a0
                  fmul.s       fa2, fa2, ft5
                  add          s10, t1, a1
                  srli         a0, s11, 31
                  slti         a3, s8, 2005
                  fcvt.wu.s    a6, ft3
                  fsgnjn.s     ft11, ft9, ft3
                  fsgnjx.s     fa7, fs8, ft11
                  div          zero, s6, t3
                  rem          t5, s8, s0
                  mulhsu       t4, s5, a1
                  fmv.w.x      fs0, s4
                  slli         tp, t1, 4
                  srli         s7, t0, 20
                  fmin.s       ft9, fa0, fa4
                  srl          sp, s5, ra
                  xor          s7, a2, s10
                  fcvt.w.s     s5, fs7
                  xor          sp, a2, t5
                  remu         t4, a4, t1
                  nop
                  fcvt.s.w     fs9, s1
                  fmul.s       fs8, fa1, fa2
                  xor          ra, s0, t1
                  fmax.s       ft8, fs2, fa0
                  srli         s8, t5, 15
                  lui          s0, 834784
                  mul          s0, a2, s10
                  fcvt.wu.s    s3, ft7
                  fmin.s       ft6, fa3, ft4
                  xor          t4, s0, s2
                  fmax.s       fs1, fs9, fs7
                  slt          a4, s6, a6
                  fcvt.s.w     ft11, t1
                  fsgnjn.s     fs10, ft4, fs6
                  fmv.x.w      s2, fs2
                  rem          zero, s9, s11
                  xori         s2, gp, -993
                  slt          a4, s10, t2
                  srli         s9, tp, 30
                  div          a0, t5, s7
                  fsgnjn.s     fs1, fs0, ft6
                  fsgnjn.s     ft2, fs3, ft3
                  slli         s8, s10, 21
                  slti         s4, a0, -812
                  nop
                  andi         s10, s11, 1889
                  srl          a3, a2, s7
                  mulhu        s11, t6, s11
                  or           ra, a0, s10
                  xor          s8, s2, t6
                  slli         a1, a0, 30
                  fmax.s       fs1, fs9, fs3
                  rem          sp, s1, t6
                  fcvt.w.s     s9, fs3
                  sltiu        tp, tp, 1038
                  feq.s        s1, ft0, fs3
                  divu         s4, t0, s10
                  flt.s        s10, fs8, ft9
                  slli         sp, t4, 14
                  slt          s0, s4, s5
                  and          ra, zero, t5
                  fmv.w.x      fs11, s10
                  fsgnjx.s     fs10, fa2, fs7
                  fmax.s       fs6, fa7, fs4
                  fsgnj.s      fs8, fs7, ft8
                  fle.s        gp, ft8, ft6
                  fclass.s     s11, ft0
                  mulh         a3, t6, s5
                  sll          a3, zero, s5
                  fsgnjn.s     fs6, fa3, ft3
                  fmin.s       fs4, fa0, ft11
                  and          a2, t1, a7
                  fadd.s       ft9, fa0, fs0, rmm
                  rem          a3, a2, s10
                  srl          s3, a6, t1
                  add          s9, s3, s8
                  or           tp, a7, t6
                  fsgnjx.s     ft10, ft3, fs8
                  mulhu        s7, a6, s10
                  fle.s        s9, ft8, ft7
                  srai         a7, t1, 21
                  srli         a7, s8, 2
                  addi         ra, s8, 366
                  sltu         t6, a1, a4
                  fmin.s       fs5, ft10, ft0
                  fsgnj.s      ft1, fa7, ft6
                  mulh         a7, a4, a5
                  fmv.x.w      s2, ft4
                  andi         s11, t1, 1860
                  fmax.s       fs4, fs8, ft3
                  feq.s        a7, fs11, fa4
                  xor          s9, t6, s9
                  fmin.s       fs10, ft5, ft9
                  mul          s4, a4, s0
                  sub          a2, a1, a6
                  add          ra, ra, t2
                  lui          s5, 856135
                  ori          s4, sp, -1330
                  fcvt.w.s     a7, ft5
                  addi         s1, sp, 438
                  fsub.s       fs8, fa3, fa2
                  xor          a1, s1, a5
                  fsub.s       fs9, fs10, ft4, rdn
                  mulhsu       a2, s1, t5
                  sltu         s6, s6, a6
                  xor          s9, t3, a4
                  fmv.x.w      s3, ft4
                  remu         s0, a0, a7
                  srai         a3, a4, 28
                  and          tp, s8, zero
                  sltiu        s0, t1, -357
                  lui          t0, 291694
                  fmul.s       fs6, ft10, fs10, rdn
                  xori         t0, a3, 1389
                  fsgnjx.s     fa1, fa1, ft2
                  or           t0, s7, a6
                  slli         sp, t4, 5
                  rem          gp, s2, a4
                  feq.s        s0, ft6, ft10
                  xor          s0, s6, tp
                  flt.s        ra, fa0, fs6
                  sll          s8, sp, zero
                  fcvt.wu.s    a7, fa1
                  fmax.s       ft4, ft6, fs6
                  fclass.s     gp, ft8
                  auipc        s4, 606332
                  or           s8, s2, zero
                  flt.s        a6, fa6, fs6
                  srl          s5, a4, a6
                  fclass.s     s10, fs1
                  xori         s1, t1, -1118
                  sra          s8, a4, t5
                  add          a4, t2, zero
                  nop
                  and          t4, s2, tp
                  ori          t4, a5, 1187
                  auipc        s0, 1012095
                  nop
                  slt          s2, s5, t2
                  addi         t6, sp, -752
                  ori          a1, s7, -739
                  auipc        t4, 442420
                  mulh         s5, a3, a5
                  fcvt.s.w     fa1, gp, rmm
                  fsgnjn.s     fs6, fs9, ft1
                  srli         s7, a3, 8
                  xori         s0, t4, -2034
                  fsqrt.s      fs4, ft3
                  fadd.s       fs10, fa1, fa4
                  fcvt.s.wu    fs0, a1, rne
                  fcvt.s.wu    ft0, a1, rne
                  auipc        s6, 962693
                  fsgnjn.s     fs9, fs4, fa2
                  fle.s        s1, fa4, fs9
                  nop
                  rem          s6, a7, t2
                  slli         a4, t4, 18
                  mul          s3, a5, s2
                  fclass.s     a7, ft7
                  slli         a3, a5, 10
                  slli         tp, t4, 20
                  srl          a1, a6, gp
                  or           s10, s5, t6
                  slti         s6, s9, -228
                  xor          s9, a4, t5
                  div          s8, s3, s5
                  andi         a7, s2, -1302
                  fsgnjx.s     fs10, fs5, fs6
                  fcvt.s.wu    fs0, a1
                  srai         t4, s11, 21
                  sll          t0, t4, s11
                  or           a4, t5, t2
                  add          s4, t2, s3
                  fsgnjx.s     fs2, fs10, fs3
                  andi         s8, s7, 556
                  fcvt.s.wu    fs0, t1
                  sltiu        zero, sp, 74
                  fsgnjx.s     ft9, ft2, ft4
                  fclass.s     s9, ft5
                  sra          t2, ra, a1
                  fdiv.s       fa4, fs9, ft2, rdn
                  xori         a6, s5, -1721
                  divu         s1, s0, s0
                  ori          s5, ra, -1555
                  nop
                  fcvt.s.wu    fs4, t6
                  fle.s        sp, fa0, fa4
                  fmv.w.x      fa5, a4
                  addi         s9, gp, 1026
                  lui          a1, 974074
                  sll          t5, s9, t5
                  slt          s7, tp, a6
                  sltu         s2, s8, a3
                  div          s8, t1, s0
                  fadd.s       fs10, fs9, fs5
                  sltiu        ra, s10, -1368
                  fsqrt.s      fs4, fs2, rtz
                  slt          s3, a2, a4
                  sll          t6, t2, tp
                  fsgnjx.s     fs0, fs4, ft5
                  srl          a6, s8, sp
                  srl          s4, s10, s9
                  andi         s7, gp, -40
                  div          s3, s9, s9
                  sub          s3, s5, s8
                  feq.s        s6, ft8, fs11
                  auipc        t6, 732940
                  fcvt.w.s     s1, fa7, rup
                  mulh         a6, tp, t0
                  fmv.x.w      a7, fs7
                  sub          a2, s9, zero
                  sub          a1, sp, gp
                  fcvt.s.wu    ft10, t5
                  fcvt.s.wu    ft11, t5, rne
                  nop
                  fmv.x.w      s7, fs6
                  fmax.s       ft11, fs1, fs2
                  mulhu        a4, a3, a0
                  xor          sp, t1, s8
                  rem          ra, s9, s7
                  remu         a3, s6, s3
                  flt.s        sp, ft8, fs1
                  fmax.s       fa3, fs7, ft5
                  feq.s        zero, ft2, ft3
                  mulhsu       s2, t2, s9
                  fadd.s       fs11, fa3, fa6, rne
                  fsqrt.s      fa7, ft11, rdn
                  rem          a6, a4, t1
                  fmv.x.w      s4, ft0
                  fdiv.s       fs1, ft7, fa6
                  fmul.s       fs3, fa4, fs8, rmm
                  flt.s        s11, ft0, ft5
                  slt          a2, s2, s2
                  sra          t2, t5, s3
                  remu         a0, a2, t2
                  fmax.s       fa5, fs5, ft0
                  rem          gp, s11, sp
                  auipc        s2, 9970
                  rem          s10, s11, a7
                  fmv.w.x      ft2, t4
                  sll          a2, t6, s6
                  mul          ra, a7, s3
                  fcvt.wu.s    t5, fs10
                  fmv.w.x      fs10, s4
                  slli         a4, a3, 5
                  slt          a4, a3, t6
                  xori         zero, t2, -698
                  divu         s11, t0, a3
                  fcvt.s.wu    fa1, tp, rtz
                  sra          tp, s2, s1
                  remu         s7, s9, sp
                  div          ra, ra, t2
                  sub          s10, t5, zero
                  fdiv.s       ft9, ft0, fs2, rdn
                  ori          sp, s8, 655
                  fsub.s       fa6, fs3, fs2, rmm
                  feq.s        t5, fs2, ft11
                  srli         a0, a7, 21
                  sltiu        t2, s11, -1103
                  fcvt.s.w     fs1, t4
                  ori          s1, a4, 1529
                  slli         sp, t1, 26
                  fmin.s       fs5, fa3, fa3
                  fmax.s       ft1, fs6, ft5
                  fmin.s       fs0, fa2, ft7
                  div          tp, a6, s2
                  nop
                  rem          t0, a2, tp
                  addi         s2, s2, -157
                  sub          t4, t1, a4
                  lui          s8, 729436
                  mulhsu       s8, s4, a6
                  fmax.s       ft9, ft7, fa2
                  andi         s4, s0, 1352
                  remu         a3, s11, a7
                  fcvt.s.w     ft7, t1
                  fcvt.s.w     fs9, s2, rdn
                  feq.s        s8, fs8, fs0
                  fsgnjx.s     ft3, fs4, fa1
                  andi         gp, a7, 1075
                  fmv.x.w      ra, ft6
                  mulhu        s5, gp, ra
                  fsub.s       fs0, ft1, fs1, rmm
                  fsqrt.s      fs11, fa1, rtz
                  xori         zero, t0, 526
                  mulhsu       s10, s7, s5
                  addi         s8, s0, 1359
                  slti         t4, s11, -1125
                  fmax.s       fs0, ft0, ft5
                  divu         t5, a0, a4
                  ori          a7, s0, -292
                  fsub.s       ft6, ft9, ft3
                  fsub.s       fa3, fa2, ft1, rup
                  and          t6, t2, a1
                  srl          gp, s1, s6
                  slti         t5, gp, -1467
                  slli         ra, s11, 22
                  or           s8, a7, t5
                  fadd.s       ft5, ft11, fs7, rmm
                  sltiu        s10, a7, -1671
                  and          t0, tp, s11
                  mulhsu       s10, s4, s5
                  mulh         s11, ra, sp
                  xori         a1, t1, 1581
                  or           t2, a6, t5
                  fsqrt.s      fa7, ft2
                  sll          ra, a1, s3
                  andi         s8, s9, -1226
                  mul          t0, gp, s10
                  mulh         s9, t1, sp
                  rem          s3, t5, a0
                  add          gp, a2, s6
                  feq.s        a4, fs11, fa6
                  sub          s10, a5, s6
                  fcvt.wu.s    s10, fa6
                  xor          a1, a6, s10
                  nop
                  fsub.s       fs1, fs2, ft5, rup
                  fcvt.s.w     fs0, s10, rup
                  sltu         tp, s0, s7
                  fmv.w.x      ft1, tp
                  fcvt.wu.s    a4, fs11
                  fsqrt.s      ft3, fs5
                  fmv.w.x      fa2, s6
                  fmv.w.x      ft9, a5
                  mulhsu       t2, t5, a7
                  div          t2, s5, s2
                  fcvt.s.wu    ft4, t3
                  remu         s2, t1, ra
                  nop
                  fclass.s     a0, fs0
                  addi         s4, s10, -1726
                  fdiv.s       ft2, ft7, fa3
                  fcvt.wu.s    zero, ft4
                  div          zero, zero, t6
                  addi         s0, s2, 1844
                  srai         s7, a2, 15
                  fclass.s     s2, ft0
                  fclass.s     s6, fa3
                  fcvt.s.w     ft6, a3
                  srl          tp, a7, zero
                  ori          s5, s8, -1649
                  slt          t2, t1, t2
                  sra          s11, t3, zero
                  add          s6, s11, s3
                  flt.s        tp, fs11, fa6
                  xor          t4, sp, a6
                  ori          t2, a7, -1038
                  nop
                  srl          sp, s0, s2
                  feq.s        t6, fs9, ft8
                  add          ra, s6, s0
                  fcvt.w.s     a1, fs5, rmm
                  sltu         s0, gp, s7
                  fsgnjn.s     ft7, fa5, fs3
                  sltiu        ra, s0, 1086
                  fdiv.s       ft1, ft8, fa1
                  mulh         s2, s5, sp
                  fmin.s       ft6, fa7, fa7
                  flt.s        s5, fa4, fs4
                  div          s3, s9, a6
                  fadd.s       fs3, fs5, fs8, rne
                  fsgnjn.s     ft4, fs6, ft0
                  andi         gp, s9, 109
                  div          s9, t2, s10
                  fcvt.w.s     a7, fs6, rup
                  fcvt.wu.s    ra, ft6, rmm
                  rem          a6, s11, sp
                  lui          t0, 623164
                  fcvt.s.wu    fa5, s1, rup
                  fadd.s       ft3, ft8, ft11, rmm
                  slti         a6, s2, 1353
                  mulhu        s7, t1, a4
                  slti         s3, s8, -854
                  sll          s9, s2, s0
                  fle.s        t0, ft4, fa4
                  fcvt.wu.s    s3, fa4, rtz
                  fcvt.wu.s    a1, ft1
                  fmax.s       ft1, ft9, ft7
                  srai         a2, a6, 20
                  fmax.s       fs11, fa4, fs9
                  srl          s8, s4, s8
                  fdiv.s       fa5, fa1, ft4, rtz
                  fsub.s       fa3, fs9, fs2, rup
                  lui          a7, 505121
                  feq.s        s7, fa7, fs3
                  mul          t5, s2, s4
                  xori         t0, s2, 1247
                  mulhu        s8, sp, t3
                  mul          gp, s11, t4
                  fsgnj.s      ft4, fa7, fs3
                  xori         s5, gp, 425
                  fsgnjx.s     fs5, fs10, fs7
                  fadd.s       ft9, ft9, fs0, rup
                  div          sp, s9, zero
                  fle.s        s5, fs6, fa5
                  div          s0, s4, t6
                  fle.s        t6, fa6, fs0
                  mulh         s9, a0, s5
                  srl          tp, tp, s9
                  slli         s9, s7, 26
                  fsgnjx.s     fa2, ft9, ft8
                  fmul.s       ft5, fs3, fs10, rdn
                  auipc        t6, 76233
                  andi         a2, s5, 180
                  srl          s9, t2, a0
                  fmin.s       fs8, fa6, fs10
                  feq.s        s0, fs2, fs11
                  and          s3, s11, t3
                  fcvt.wu.s    s0, ft8, rup
                  remu         a2, a0, a3
                  rem          a4, t1, s6
                  flt.s        t6, ft3, fs4
                  fmv.w.x      ft4, s6
                  fcvt.wu.s    s0, fa1
                  fsgnjx.s     fa7, ft11, fa5
                  divu         s1, a5, t5
                  sub          s7, a5, s9
                  and          t5, ra, a2
                  feq.s        sp, fa5, fs8
                  andi         s9, s4, -937
                  srli         a4, s9, 28
                  mul          zero, s4, a4
                  auipc        a6, 13620
                  slt          zero, s10, a7
                  sltiu        s5, s5, -891
                  fsqrt.s      fa1, ft7, rup
                  xor          s10, zero, a0
                  andi         ra, gp, -1779
                  fcvt.wu.s    a0, ft0
                  fmax.s       fa1, fs1, fs11
                  fsqrt.s      ft7, fs4
                  fsgnjx.s     fa7, ft5, fs9
                  xor          tp, a7, s5
                  slti         a2, s6, 1640
                  fcvt.w.s     s6, fa3
                  rem          s4, s8, t3
                  auipc        t2, 131086
                  slt          tp, s4, gp
                  fadd.s       fa5, fs7, ft1
                  xori         t0, a2, 788
                  slt          a2, s9, t3
                  divu         zero, a0, t0
                  fmin.s       ft0, ft5, ft9
                  rem          a1, t0, zero
                  fadd.s       fs6, ft7, ft8
                  fcvt.wu.s    t0, ft5, rmm
                  xori         a2, a4, -872
                  fsgnjx.s     fa0, fa5, fa2
                  auipc        sp, 769333
                  rem          a7, sp, t5
                  fsgnjx.s     ft7, fs3, ft9
                  fsqrt.s      fa4, ft8
                  fmul.s       fa7, ft8, fs5, rne
                  fdiv.s       ft6, fa0, ft6
                  xori         tp, t0, 49
                  fmul.s       fs10, fa3, fs9
                  srl          gp, gp, zero
                  mulhu        a6, gp, s9
                  or           gp, a7, zero
                  fcvt.w.s     t6, ft8, rup
                  fmv.w.x      ft8, gp
                  and          t5, s8, tp
                  xori         a3, s4, -869
                  remu         t2, s0, ra
                  fmin.s       fs7, fs4, fs6
                  fcvt.s.w     fs6, s1
                  fadd.s       fa3, ft2, ft2
                  fcvt.s.wu    fa3, s10
                  fsub.s       ft9, ft3, ft6
                  fsgnj.s      ft0, ft8, fs9
                  lui          a1, 1012494
                  feq.s        s9, fs9, fs9
                  fcvt.wu.s    s7, fs7
                  andi         tp, s5, 1594
                  mulhsu       t2, s7, s6
                  fmul.s       ft4, ft2, fa5
                  fadd.s       ft0, fa3, fa4
                  fcvt.w.s     gp, ft10, rmm
                  xori         s11, a5, 1317
                  mulh         a7, zero, s11
                  remu         ra, zero, a7
                  xori         t2, sp, -730
                  flt.s        s8, fs5, ft2
                  or           t2, zero, a4
                  fsub.s       fs9, ft10, ft10
                  remu         s7, sp, ra
                  fcvt.s.wu    fs2, s9, rup
                  mulh         a4, a0, t6
                  slti         tp, a3, -1266
                  fcvt.s.w     ft1, a4
                  ori          a2, a7, -991
                  fsgnjx.s     fs8, fs2, ft9
                  fsgnj.s      ft8, fs4, ft0
                  mulh         zero, t0, t6
                  fmin.s       fs10, ft0, fa3
                  or           a0, s11, s4
                  feq.s        s2, fs6, fa3
                  add          s8, s8, a2
                  sub          a3, s6, t1
                  divu         s11, sp, a5
                  addi         tp, s11, 1807
                  xor          ra, a5, s10
                  nop
                  divu         s7, s5, a3
                  fcvt.w.s     gp, ft6
                  fsgnjn.s     fa6, fs11, fs9
                  fdiv.s       fa7, fs1, fa6
                  auipc        s8, 616408
                  fle.s        a0, ft11, ft0
                  fdiv.s       ft8, fs4, ft0, rne
                  ori          s1, ra, 1403
                  sub          gp, tp, t6
                  fclass.s     s5, ft4
                  sll          s10, s2, a3
                  divu         sp, a5, a3
                  rem          s3, a0, a4
                  slli         a7, a4, 1
                  auipc        s5, 696242
                  fcvt.s.w     ft11, s7, rtz
                  fmin.s       fa2, fa7, fs6
                  auipc        s2, 411690
                  mul          a3, s7, a2
                  fcvt.s.wu    fs11, s5
                  xori         a4, s5, 153
                  fmv.w.x      fs11, s4
                  srli         a0, t4, 24
                  andi         s5, a4, -152
                  div          t2, zero, s2
                  srai         sp, tp, 0
                  fmin.s       fa1, fa6, ft8
                  fdiv.s       fa1, fs8, fa2
                  ori          s9, t5, 933
                  fmv.x.w      a6, ft8
                  fmv.w.x      ft8, s5
                  fcvt.w.s     s5, fa0, rmm
                  fcvt.w.s     a1, ft4
                  nop
                  and          a1, s5, s9
                  sltu         t2, s11, a5
                  xor          s10, s7, s7
                  fsgnjx.s     fs9, fs7, fs9
                  addi         a4, s2, 61
                  fle.s        a0, ft3, ft8
                  sltu         s11, s2, ra
                  divu         s9, t3, t5
                  slti         ra, s11, -1940
                  fsqrt.s      fs5, ft9
                  fmv.w.x      ft0, t2
                  fle.s        s9, fs4, ft6
                  xor          s8, s11, s11
                  srli         a3, ra, 22
                  mulh         t0, s4, a6
                  xor          a3, s0, s9
                  fcvt.wu.s    t4, fs2
                  divu         sp, s5, a2
                  slti         zero, zero, -1506
                  lui          s1, 169532
                  sub          a6, a2, t6
                  or           ra, zero, t4
                  srli         a3, s9, 9
                  or           gp, a1, t3
                  or           t2, s6, a5
                  fsub.s       ft0, ft0, ft9, rdn
                  fcvt.w.s     a0, fs10
                  mul          s5, t5, s10
                  and          t0, t4, s4
                  xori         s7, s10, 2002
                  auipc        s4, 206174
                  andi         t0, t4, 156
                  feq.s        s3, ft5, fs2
                  or           s7, a7, s10
                  andi         gp, s2, -882
                  and          a0, s2, t6
                  divu         s11, s0, s1
                  srl          t2, t6, gp
                  sub          s7, s3, a2
                  fmax.s       fa7, ft4, fa4
                  slti         a4, t2, -1235
                  div          s2, a0, a5
                  fadd.s       fa2, ft10, fa2, rmm
                  div          s4, a4, t3
                  flt.s        s0, fs7, ft8
                  fmul.s       fs9, ft4, fa3, rne
                  sll          a7, tp, sp
                  xori         t4, a3, -1692
                  fadd.s       fs9, fs11, ft11, rdn
                  feq.s        zero, fs3, ft8
                  nop
                  andi         gp, ra, -1999
                  sub          s0, ra, a2
                  fmul.s       ft7, ft1, ft1, rup
                  feq.s        a6, ft6, fa6
                  fcvt.s.wu    fs9, tp
                  slti         t5, s7, 539
                  lui          s9, 224506
                  mul          s0, s3, sp
                  fsub.s       fs4, fa7, fs5, rup
                  addi         a1, s5, 1480
                  fmv.x.w      s3, fs1
                  and          s6, s10, s0
                  add          zero, t6, a6
                  fmul.s       fa2, fa7, fa6
                  fadd.s       ft0, ft0, ft10
                  sub          s10, a4, s4
                  slli         tp, a0, 1
                  lui          ra, 171305
                  srai         s11, a2, 0
                  srai         a6, t3, 0
                  add          t6, t6, a7
                  ori          s9, zero, 976
                  sltiu        s5, s10, -5
                  mulhsu       s8, s8, a1
                  sra          tp, a5, t0
                  mul          t2, s5, t2
                  ori          s9, s5, -1486
                  remu         a4, s10, t5
                  fcvt.wu.s    s2, fs8
                  fmin.s       fs7, fs4, fs8
                  remu         s9, s2, s2
                  srli         s0, a4, 31
                  fmul.s       fs8, ft0, ft8
                  andi         a6, t3, 1688
                  auipc        ra, 768781
                  or           s6, gp, t3
                  flt.s        sp, ft0, fa6
                  sltiu        zero, gp, 254
                  fcvt.s.wu    fa2, s5
                  sub          s9, a5, a6
                  mul          t6, t0, ra
                  sltiu        a0, zero, 1292
                  mul          s2, a4, a6
                  fmv.w.x      fa3, a0
                  fcvt.w.s     a0, ft4, rne
                  fmin.s       ft1, fa3, fs0
                  fle.s        a3, fs0, fs11
                  fle.s        t4, fs8, fs1
                  mulhu        gp, tp, a4
                  sltu         t0, zero, s6
                  or           t6, s10, a0
                  slli         a2, tp, 26
                  fmv.w.x      ft1, s9
                  fsgnj.s      fs2, ft10, ft11
                  slli         s0, t0, 19
                  fcvt.w.s     s5, ft11
                  divu         a6, a6, s3
                  fcvt.s.w     fs3, s10, rup
                  sll          s1, t3, s9
                  fle.s        ra, fa6, fs7
                  add          s11, t1, t6
                  feq.s        a1, fa3, fs9
                  sll          ra, zero, a4
                  remu         s3, s9, tp
                  fadd.s       fs1, ft9, fs3, rup
                  fsgnjn.s     fs7, fa0, ft11
                  ori          a4, s4, -960
                  fsgnj.s      ft1, fa3, ft0
                  slli         a4, s6, 9
                  add          t5, a1, s4
                  fsgnj.s      fs7, fs2, fs2
                  fsgnj.s      fs4, ft3, ft9
                  srli         s11, a0, 1
                  and          t2, a5, gp
                  sltiu        zero, s1, 427
                  sll          s7, gp, tp
                  auipc        t0, 136920
                  xor          gp, s3, a5
                  fle.s        a3, fs9, fs2
                  fclass.s     a2, fs6
                  fmin.s       fa0, fa5, fs7
                  fmv.x.w      s1, fs5
                  sra          t4, s4, t6
                  or           t5, s11, a0
                  fadd.s       fa4, ft8, ft5, rne
                  add          t6, t0, s11
                  rem          sp, a4, a0
                  and          zero, a1, t1
                  fcvt.s.wu    ft7, sp
                  auipc        tp, 362267
                  mulhsu       a0, t4, t6
                  srl          t2, a4, a2
                  fsgnj.s      fa1, fs9, fa1
                  fclass.s     sp, ft6
                  fcvt.s.wu    fa0, a4
                  fsgnjn.s     ft10, fs2, fs4
                  fmv.w.x      ft5, a5
                  div          s0, t3, t4
                  fcvt.s.w     ft4, s4, rup
                  fdiv.s       fa0, fa2, fa1
                  sll          t0, s8, s11
                  fmul.s       ft8, fs9, ft1
                  flt.s        s4, ft8, ft9
                  add          ra, a0, s1
                  fmul.s       ft9, fs2, ft6
                  flt.s        a6, ft7, ft4
                  xori         s4, t6, 1442
                  nop
                  fcvt.w.s     a2, ft2
                  mulh         s4, s2, s2
                  fdiv.s       fs4, fs3, fs0
                  and          t4, s1, a7
                  fcvt.w.s     s8, fa4, rup
                  sra          s5, s9, s2
                  fmv.w.x      fa6, a5
                  add          t0, gp, a5
                  fclass.s     tp, fa3
                  sltiu        zero, a4, -519
                  fsgnj.s      ft2, fa7, ft5
                  auipc        t0, 563819
                  div          s2, s11, s2
                  and          s6, t4, s3
                  andi         t2, s10, 852
                  fadd.s       fa2, fs9, fs7
                  div          t2, s6, s11
                  fcvt.s.wu    ft3, a0, rmm
                  fdiv.s       fa0, ft5, fs7
                  fclass.s     s2, fs4
                  feq.s        a3, fs11, fa6
                  xori         a7, s0, -616
                  fsgnjx.s     ft4, fs7, ft8
                  fsub.s       fs3, fa0, fs1, rup
                  fsub.s       ft6, fs4, ft6
                  div          s5, a6, s0
                  fmax.s       fs3, fs8, fa5
                  fmv.w.x      ft8, s10
                  auipc        s2, 305004
                  remu         s3, t4, t0
                  mulh         ra, t2, a6
                  fsgnjx.s     fs7, ft9, ft1
                  fle.s        a6, fs9, fa7
                  fsgnjn.s     fs8, fs7, fs4
                  fsgnjx.s     fs9, ft6, fs3
                  fmv.x.w      zero, ft0
                  fsgnj.s      fa6, ft4, ft10
                  or           ra, tp, a6
                  srai         s7, a3, 12
                  fadd.s       fs10, fa0, ft8
                  rem          a7, a6, a7
                  fadd.s       fs4, ft4, ft1
                  mulhu        s8, a5, s7
                  andi         s8, tp, 634
                  fcvt.s.w     fa2, tp
                  slt          a6, s4, t0
                  fdiv.s       fs9, fs5, fa5, rne
                  fclass.s     t5, fa1
                  mul          s0, zero, s3
                  mulhsu       ra, s0, t6
                  fcvt.s.wu    ft11, t2
                  srl          tp, s1, a1
                  auipc        a4, 965450
                  mulhsu       s9, s5, tp
                  lui          a4, 89419
                  andi         gp, s11, 1369
                  fsgnjx.s     ft8, ft4, fa2
                  fsgnjx.s     fs10, fs6, ft1
                  fclass.s     s4, fa2
                  addi         s1, a1, 1241
                  fcvt.wu.s    a2, fs6
                  fmv.w.x      ft4, s1
                  fmin.s       ft3, ft0, ft10
                  fle.s        s4, fs2, fs1
                  mulh         a0, sp, s4
                  mulhu        tp, t0, s8
                  fclass.s     s9, fs0
                  srl          t4, t3, tp
                  fsub.s       fs11, fs0, ft9, rdn
                  fcvt.wu.s    a0, ft7, rup
                  fsgnj.s      ft5, ft11, fs2
                  add          sp, s3, a6
                  and          t5, s7, sp
                  addi         s0, s11, 1141
                  srli         sp, a3, 4
                  srli         s11, a2, 15
                  fdiv.s       ft7, fa2, fa7
                  addi         s10, s8, 1404
                  fcvt.wu.s    a0, fa1, rdn
                  sltu         a3, s3, t1
                  lui          a2, 158396
                  nop
                  fmax.s       fa7, ft0, ft1
                  srai         a4, a5, 12
                  mulhsu       a2, s10, t1
                  sltiu        a1, ra, -557
                  slt          s7, s5, s3
                  sltu         s4, a2, t6
                  fmax.s       fs2, fa7, ft11
                  and          s7, s5, t6
                  slt          ra, a5, t0
                  andi         a3, t4, 261
                  div          a3, s1, t3
                  mulhu        t6, s2, sp
                  fsgnj.s      ft10, ft7, ft10
                  slli         s2, s10, 0
                  add          t6, s2, a1
                  fsgnj.s      ft2, fs9, ft0
                  sltiu        t2, s3, -1522
                  srli         s11, t3, 15
                  slti         t5, t3, 769
                  fdiv.s       ft7, fs2, fa4
                  sll          s0, t1, s9
                  srli         sp, s2, 1
                  fadd.s       fa0, ft3, fa7, rup
                  xori         s8, s6, -2003
                  fle.s        a2, ft8, fa0
                  sll          a4, s6, a6
                  srl          ra, zero, a6
                  and          s9, s9, t4
                  fmin.s       ft10, ft1, ft7
                  fle.s        s6, ft5, ft4
                  fcvt.w.s     s0, fs10, rmm
                  fle.s        s9, fs10, fa3
                  xor          s6, sp, s8
                  lui          sp, 346879
                  lui          a0, 1010718
                  slli         s11, s5, 6
                  mulhu        a6, t5, s5
                  fcvt.wu.s    a3, fs11, rdn
                  srli         ra, gp, 25
                  fsub.s       ft9, ft4, fs11, rtz
                  fcvt.s.w     ft2, zero, rmm
                  mulh         s10, s3, t2
                  sra          a4, t6, s11
                  slt          s4, t1, gp
                  sra          s0, a0, s10
                  addi         s5, a6, 971
                  fle.s        s8, ft3, fa6
                  slli         s2, a4, 23
                  sub          ra, gp, t1
                  auipc        s3, 755294
                  lui          a4, 452943
                  mulhu        s2, a4, a1
                  rem          s9, a5, a7
                  srli         a3, s2, 12
                  fsgnjx.s     fs6, fa4, ft1
                  fdiv.s       ft10, fs2, fs11, rup
                  and          t2, s2, s6
                  ori          s9, s1, -1004
                  xor          s5, s2, sp
                  div          s11, ra, ra
                  fsub.s       fs1, ft1, fa4, rdn
                  slti         s7, s1, 1929
                  fclass.s     gp, fa6
                  fcvt.wu.s    s7, ft1
                  fcvt.wu.s    s4, fa2, rup
                  flt.s        t6, fs8, ft5
                  srli         a2, t5, 28
                  sltu         s9, t1, a4
                  sll          a7, s2, gp
                  mulhu        s6, a7, a5
                  xor          t0, s0, a6
                  fsgnjx.s     fs2, fs6, fa0
                  slti         s10, s7, 276
                  fmax.s       fa0, fa1, ft8
                  fmv.w.x      fs6, a4
                  slli         s1, s7, 27
                  srli         tp, s1, 5
                  divu         s9, a1, t6
                  fsgnjx.s     ft1, ft8, fs4
                  slt          zero, a2, t2
                  and          a2, a0, a1
                  sra          t2, zero, a5
                  sub          s8, zero, s7
                  slt          t6, t6, t5
                  andi         zero, s2, -215
                  add          t4, s2, tp
                  div          t6, t3, s8
                  slt          a1, sp, a4
                  srli         s1, s2, 1
                  rem          t6, s4, a2
                  slli         s8, s10, 14
                  mul          s8, a1, zero
                  fle.s        ra, fs10, fs6
                  div          t4, t2, s3
                  or           s10, a0, a2
                  fsgnjn.s     fa7, fa4, fa5
                  sub          a7, sp, t0
                  fclass.s     sp, fs5
                  xor          s5, gp, a6
                  srl          s5, t5, zero
                  fle.s        a0, fa4, fs9
                  fadd.s       fa7, ft2, fa5, rmm
                  fsgnj.s      fa5, fa0, fs11
                  fsub.s       fs3, fa6, fs9
                  auipc        s3, 667497
                  srl          a6, ra, s6
                  fmv.w.x      fa4, a3
                  fclass.s     a1, ft11
                  auipc        t5, 761186
                  sub          s9, a5, a1
                  addi         s8, s7, -407
                  andi         t5, zero, -1511
                  srai         sp, s10, 15
                  sll          t4, sp, s10
                  slli         a1, zero, 7
                  fmax.s       ft5, fa2, fs9
                  slt          a0, a0, a1
                  xor          s9, s11, a1
                  sltiu        a7, s6, 1096
                  or           a4, t1, a4
                  fsqrt.s      fs10, fs9
                  sltu         s6, a4, a3
                  rem          a6, t4, t1
                  fcvt.w.s     gp, ft9, rmm
                  fcvt.wu.s    s10, fs0
                  feq.s        a4, ft7, fs0
                  add          s7, t2, gp
                  mulhu        zero, a3, s8
                  slli         s0, gp, 10
                  fmul.s       fs11, fs2, fs3
                  addi         a3, t1, 979
                  xori         s7, s1, -1150
                  sra          a2, t4, s8
                  lui          s3, 49296
                  nop
                  addi         t2, a3, 1153
                  srli         gp, a3, 19
                  nop
                  mul          s3, s10, gp
                  sll          t0, t6, t5
                  auipc        s8, 214219
                  ori          s9, a3, -1972
                  fdiv.s       fa1, ft3, ft1
                  fsgnjx.s     fs4, ft0, fa0
                  slti         s6, tp, 249
                  ori          t6, ra, 233
                  slli         sp, s11, 7
                  xor          s11, a2, a0
                  fmv.x.w      a2, fa6
                  sub          a2, tp, ra
                  remu         s0, s8, a5
                  addi         sp, t1, 1571
                  srl          ra, s5, a7
                  addi         a7, sp, 1636
                  fcvt.wu.s    s9, fs3, rmm
                  fmul.s       ft8, fs0, fa2
                  xor          s9, a2, s8
                  slli         t5, s2, 27
                  or           a1, s4, s10
                  divu         t6, t4, a7
                  fmax.s       fs8, fa2, ft2
                  fsgnjx.s     ft7, fa5, fs5
                  fmv.x.w      a1, fs6
                  srl          s8, s0, s6
                  fcvt.wu.s    gp, ft5
                  mulhu        a7, s11, a1
                  fcvt.s.wu    ft7, a2
                  feq.s        t2, ft4, fs9
                  mulhsu       a0, t0, t1
                  lui          zero, 346633
                  srl          s10, t4, s3
                  fsgnj.s      fa4, ft4, ft3
                  fmv.w.x      fs11, t4
                  mulhsu       t4, a3, t1
                  remu         s3, t2, t4
                  fcvt.s.w     ft10, t1, rup
                  fsub.s       ft0, fa6, fs10
                  fcvt.w.s     zero, ft1
                  fcvt.s.wu    ft1, s1
                  auipc        a3, 995407
                  sltiu        sp, a0, -347
                  fsub.s       ft3, fa6, ft8, rdn
                  fadd.s       ft6, fs0, ft8
                  sll          t4, a4, s5
                  sll          a1, a2, ra
                  ori          s1, s4, -1709
                  addi         t2, s8, 1036
                  mul          s0, a1, s7
                  fmax.s       fa1, fa1, fa4
                  slti         sp, s3, -1043
                  andi         tp, ra, -132
                  remu         a1, s9, s3
                  mul          s5, s2, a5
                  fmin.s       fs3, ft11, fs8
                  fmv.x.w      sp, ft9
                  add          a2, t4, t6
                  and          gp, s10, a4
                  srli         s2, a0, 24
                  srai         s4, a5, 22
                  srl          s4, ra, s5
                  divu         s8, t0, s6
                  feq.s        t4, fs10, fa2
                  sltiu        a2, t3, 1767
                  ori          s6, a0, 137
                  slti         t0, a2, 594
                  srl          sp, s11, sp
                  slt          s3, s11, a2
                  fmv.x.w      s3, fs3
                  mulhsu       s11, s0, t3
                  mulhsu       a7, a7, t1
                  slti         s7, a3, 945
                  mul          zero, s11, a7
                  fcvt.w.s     t0, fs4
                  fsub.s       fs8, ft5, fs3, rne
                  addi         s2, s10, 352
                  or           t5, a7, gp
                  fmul.s       ft10, fa6, fa5, rmm
                  fmv.w.x      ft8, a3
                  fle.s        s3, fs8, fs2
                  rem          s9, s11, s6
                  auipc        s6, 497755
                  fsgnjx.s     fs4, fs3, fs9
                  lui          s1, 196899
                  divu         gp, t1, gp
                  fcvt.s.wu    fs7, a1, rup
                  xori         sp, zero, -951
                  rem          s7, s8, sp
                  divu         s5, s8, s1
                  fcvt.w.s     gp, fs7
                  andi         s6, a2, 72
                  sub          s8, gp, t5
                  andi         a7, t2, 322
                  or           gp, t4, s5
                  srai         s9, a7, 19
                  fsub.s       fa2, ft9, ft6, rmm
                  srai         a3, s4, 24
                  auipc        t5, 1028623
                  xori         s3, a4, -1957
                  slli         s1, a6, 24
                  slli         s3, t3, 10
                  slti         a4, a6, -942
                  sub          tp, s7, t2
                  mulhu        tp, a2, s6
                  flt.s        s2, ft3, fa7
                  fmul.s       ft4, ft8, ft0, rne
                  fmv.x.w      s0, fs0
                  add          a4, a6, a7
                  fsgnj.s      ft11, fs4, fs2
                  fsub.s       ft9, ft7, fs0
                  feq.s        s6, fa0, ft5
                  remu         t2, zero, a0
                  or           s2, s8, t3
                  mul          a0, s1, t0
                  fcvt.s.w     fa2, t6, rtz
                  feq.s        a2, ft5, fs3
                  fadd.s       fs4, ft3, fs2
                  fcvt.s.w     fs11, t6, rup
                  rem          s1, s7, ra
                  srli         s7, s11, 28
                  sub          t6, a4, s7
                  srl          a4, s8, s10
                  nop
                  slt          s11, s0, t1
                  fmul.s       ft5, fs5, ft0, rne
                  mulh         s9, s1, t2
                  fdiv.s       fa1, ft9, fs1, rne
                  fsgnjx.s     ft6, ft10, ft11
                  mulh         s7, s0, t5
                  feq.s        s9, ft7, fa0
                  add          t4, sp, tp
                  fcvt.s.wu    ft3, a0, rdn
                  srli         s6, a6, 31
                  fmax.s       fs7, fs1, fs0
                  fcvt.s.w     fa4, s6
                  fmin.s       ft4, ft7, ft11
                  sll          t2, a5, a0
                  addi         t0, t2, -1953
                  andi         a0, s7, 392
                  fclass.s     tp, fa6
                  fsub.s       fa7, fs9, ft8, rdn
                  fsgnjn.s     ft0, fs1, fa7
                  fcvt.s.wu    fs8, t1, rne
                  fcvt.s.w     fa4, sp, rdn
                  fclass.s     s0, ft9
                  fcvt.s.w     fs3, s1, rup
                  mul          s3, s0, s10
                  fmv.w.x      ft5, t1
                  fclass.s     t5, fs2
                  and          zero, t6, a5
                  sltu         s4, a6, t4
                  fclass.s     sp, fa5
                  fclass.s     zero, fs3
                  feq.s        s8, ft11, ft11
                  addi         s8, s2, 1461
                  or           a6, s9, a7
                  auipc        t2, 520456
                  fcvt.s.w     fa5, a2, rmm
                  mulh         s6, tp, s11
                  fsgnjx.s     ft5, fa3, fa1
                  divu         s3, s7, t6
                  fsgnj.s      fa1, ft3, fa2
                  div          s4, tp, s11
                  srl          ra, ra, s7
                  fmv.x.w      t6, ft10
                  and          s0, sp, gp
                  divu         a2, gp, s10
                  xori         s3, s11, -897
                  fle.s        s3, ft5, fs9
                  fcvt.s.w     ft3, t2
                  fcvt.s.w     fs6, gp
                  fcvt.s.w     fs1, a5, rmm
                  addi         a4, s5, 130
                  srai         s4, s4, 7
                  fcvt.w.s     sp, ft9
                  lui          s3, 90184
                  srli         s0, s6, 30
                  fdiv.s       ft1, ft11, ft3, rmm
                  nop
                  fcvt.wu.s    s5, fa7
                  sltiu        a1, gp, -1022
                  fclass.s     s3, ft2
                  fcvt.s.wu    ft8, t2
                  xor          t0, a6, s5
                  remu         a7, sp, t1
                  flt.s        a2, fs4, ft4
                  sltiu        t5, t4, -612
                  fmin.s       ft11, ft3, ft4
                  ori          s9, a7, -660
                  srli         a7, t0, 9
                  fcvt.w.s     s4, fs0, rup
                  nop
                  nop
                  nop
                  fadd.s       fs6, fa7, ft7, rdn
                  sra          s0, s3, a4
                  ori          s3, s10, -796
                  fdiv.s       fa5, fa0, ft7, rmm
                  fcvt.wu.s    s0, fs8
                  divu         s5, s5, t5
                  fcvt.s.w     ft7, t1, rtz
                  mulh         s2, a0, t5
                  fdiv.s       ft8, fa6, fa4
                  ori          a0, t1, -516
                  andi         t2, t0, -181
                  sll          s11, s3, s4
                  remu         t2, t4, t3
                  andi         s4, zero, -1315
                  fclass.s     s9, fs5
                  fclass.s     s2, ft1
                  fcvt.s.w     fa2, a0
                  feq.s        s10, fs10, ft3
                  fadd.s       fs2, fa1, fs10
                  fmin.s       fs3, fa5, fs9
                  mulhu        tp, t4, s6
                  flt.s        s7, fa5, ft6
                  xori         t2, ra, 1919
                  fclass.s     ra, ft2
                  addi         s3, a4, 384
                  fmin.s       ft1, fa2, fs9
                  sltiu        s7, s11, 1329
                  fle.s        a0, fa5, ft10
                  sltiu        t6, t2, -580
                  sltu         t2, s1, s2
                  fcvt.s.w     fa4, s8, rdn
                  sltu         a7, a5, a7
                  srai         s5, ra, 15
                  auipc        s2, 994675
                  xori         s1, a6, 347
                  srli         s11, ra, 26
                  sra          a2, a5, gp
                  fmul.s       fs6, ft0, ft2, rtz
                  and          s7, sp, t6
                  mul          t5, t5, a0
                  mulh         a0, a5, s10
                  div          s3, a2, s3
                  sub          a3, a5, s8
                  nop
                  fcvt.wu.s    s3, fa1, rtz
                  fmin.s       ft10, fa1, fa6
                  fle.s        s8, fs9, fs2
                  rem          s11, a3, t6
                  fmin.s       ft5, fa0, ft11
                  srli         a1, s11, 27
                  addi         s8, t0, 1047
                  divu         s1, s2, a1
                  andi         a2, s7, -1949
                  fsgnjx.s     ft3, ft7, ft0
                  slli         a6, s6, 2
                  sra          t0, a2, a4
                  or           a6, a2, s8
                  flt.s        sp, ft3, fs4
                  divu         s0, s1, s3
                  rem          s11, s6, zero
                  sll          t2, sp, s0
                  xori         a1, s1, -1478
                  fclass.s     zero, ft2
                  srli         a0, a7, 21
                  fsgnjx.s     fs8, fa5, fa7
                  fmv.w.x      fs0, s11
                  or           s7, t1, tp
                  fclass.s     s5, ft6
                  mulhu        gp, a6, zero
                  fclass.s     ra, fa3
                  fle.s        zero, fa2, fs10
                  nop
                  flt.s        t4, fs1, fs5
                  srai         s3, a4, 10
                  lui          s0, 981608
                  and          ra, a4, s7
                  fcvt.s.wu    fs7, tp, rne
                  lui          tp, 866220
                  fadd.s       fs2, ft0, ft8, rtz
                  fcvt.w.s     s0, ft8
                  lui          s9, 818416
                  fmv.x.w      tp, ft4
                  sltiu        a6, a2, -1644
                  srl          s11, s5, a1
                  divu         sp, s4, s10
                  sltu         s9, s8, a7
                  xor          a1, a0, t4
                  fadd.s       fa6, fs7, ft1
                  sra          gp, a4, t3
                  fsgnjn.s     fs10, fs4, fa3
                  mulhsu       s6, s8, s4
                  sll          t2, s11, a5
                  fmv.x.w      s7, ft1
                  div          t2, t0, s4
                  fle.s        a3, fa1, ft5
                  sll          a0, s10, s11
                  sll          s0, s5, tp
                  fmin.s       ft0, ft8, fs6
                  addi         sp, s2, -1514
                  sll          a3, s0, s3
                  mulhsu       s2, s0, t1
                  fmul.s       ft6, fs10, ft10, rdn
                  fsgnjn.s     ft5, fs11, fa7
                  fsgnjx.s     ft3, fs7, fa0
                  sll          s0, s11, t4
                  fmv.x.w      a7, fa6
                  fcvt.s.wu    fa6, t6
                  sltiu        gp, s3, 1060
                  xor          s1, gp, t1
                  fmul.s       ft7, fa4, fs5, rtz
                  fmv.w.x      ft1, s0
                  sltu         a4, a2, t6
                  fcvt.w.s     t4, fs9
                  fmin.s       fs3, fa1, ft3
                  fmv.x.w      s4, fa5
                  ori          t0, s6, 2023
                  fmv.x.w      t4, fa5
                  addi         s4, ra, 1232
                  fcvt.w.s     s0, fs11, rdn
                  add          t5, s7, a7
                  fmax.s       fa3, fs2, fs0
                  rem          s5, s11, s2
                  fdiv.s       fa1, fs9, fa4
                  fsgnj.s      fa6, fa2, ft5
                  fcvt.wu.s    s10, fa0
                  fmv.w.x      fa7, s2
                  mulh         t6, s5, a1
                  fcvt.s.w     fa6, t5
                  auipc        s9, 1045717
                  srl          ra, ra, ra
                  mulhu        a4, zero, s8
                  fclass.s     s8, fa1
                  remu         s2, a0, s5
                  sltu         gp, t6, t6
                  fcvt.wu.s    a1, fa3
                  nop
                  and          a1, t3, a5
                  or           s5, s4, t2
                  and          s11, t4, t4
                  sltiu        gp, s5, -863
                  fsqrt.s      ft0, fs4
                  slti         t0, tp, 760
                  and          t6, t3, s11
                  fmin.s       fa4, ft8, ft10
                  fsgnjx.s     fa1, fa7, ft0
                  fsqrt.s      ft6, fa5, rdn
                  mulhu        t6, a3, ra
                  slti         a3, a7, -1941
                  fdiv.s       fa5, fa6, ft2
                  fmax.s       fa2, ft1, fa1
                  fsgnjx.s     fs8, fa3, ft0
                  fsqrt.s      fs0, fs1
                  lui          a3, 43031
                  mul          a1, a0, sp
                  fcvt.wu.s    ra, fa3, rdn
                  fadd.s       fs3, fs0, ft6, rne
                  fmax.s       ft11, fa1, ft1
                  fmv.x.w      a2, fa4
                  fcvt.s.w     fa5, s1
                  mulhu        a6, t1, ra
                  fcvt.wu.s    ra, ft2
                  slti         a6, a0, 1009
                  sra          s7, ra, s4
                  fcvt.s.wu    ft0, t0, rmm
                  sll          s6, t2, s3
                  fsgnj.s      fs8, fs6, fs7
                  sll          s10, a1, s7
                  mul          t4, ra, a7
                  remu         a7, t2, a5
                  srli         a1, s9, 23
                  fcvt.wu.s    a0, fa6, rdn
                  flt.s        s0, ft5, ft2
                  fcvt.s.wu    fa0, a5
                  feq.s        a3, fa0, fs11
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
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_2:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_3:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_4:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_5:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_6:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_7:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_8:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_9:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_10:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_11:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_12:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_13:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_14:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_15:
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
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
                  addi x6, x6, -4
                  sw  x28, (x6)
                  add x28, x6, zero
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
                  add x6, x28, zero
                  csrr x7, 0x341 # MEPC
                  csrr x7, 0x342 # MCAUSE
                  li x30, 0x3 # BREAKPOINT
                  beq x7, x30, ebreak_handler
                  li x30, 0x8 # ECALL_UMODE
                  beq x7, x30, ecall_handler
                  li x30, 0x9 # ECALL_SMODE
                  beq x7, x30, ecall_handler
                  li x30, 0xb # ECALL_MMODE
                  beq x7, x30, ecall_handler
                  li x30, 0x1
                  beq x7, x30, instr_fault_handler
                  li x30, 0x5
                  beq x7, x30, load_fault_handler
                  li x30, 0x7
                  beq x7, x30, store_fault_handler
                  li x30, 0xc
                  beq x7, x30, pt_fault_handler
                  li x30, 0xd
                  beq x7, x30, pt_fault_handler
                  li x30, 0xf
                  beq x7, x30, pt_fault_handler
                  li x30, 0x2 # ILLEGAL_INSTRUCTION
                  beq x7, x30, illegal_instr_handler
                  csrr x30, 0x343 # MTVAL
                  1: la x15, test_done
                  jalr x1, x15, 0

ecall_handler:    
                  la x7, _start
                  sw x0, 0(x7)
                  sw x1, 4(x7)
                  sw x2, 8(x7)
                  sw x3, 12(x7)
                  sw x4, 16(x7)
                  sw x5, 20(x7)
                  sw x6, 24(x7)
                  sw x7, 28(x7)
                  sw x8, 32(x7)
                  sw x9, 36(x7)
                  sw x10, 40(x7)
                  sw x11, 44(x7)
                  sw x12, 48(x7)
                  sw x13, 52(x7)
                  sw x14, 56(x7)
                  sw x15, 60(x7)
                  sw x16, 64(x7)
                  sw x17, 68(x7)
                  sw x18, 72(x7)
                  sw x19, 76(x7)
                  sw x20, 80(x7)
                  sw x21, 84(x7)
                  sw x22, 88(x7)
                  sw x23, 92(x7)
                  sw x24, 96(x7)
                  sw x25, 100(x7)
                  sw x26, 104(x7)
                  sw x27, 108(x7)
                  sw x28, 112(x7)
                  sw x29, 116(x7)
                  sw x30, 120(x7)
                  sw x31, 124(x7)
                  la x15, write_tohost
                  jalr x0, x15, 0

instr_fault_handler:
                  add x28, x6, zero
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
                  add x6, x28, zero
                  lw  x28, (x6)
                  addi x6, x6, 4
                  mret

load_fault_handler:
                  add x28, x6, zero
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
                  add x6, x28, zero
                  lw  x28, (x6)
                  addi x6, x6, 4
                  mret

store_fault_handler:
                  add x28, x6, zero
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
                  add x6, x28, zero
                  lw  x28, (x6)
                  addi x6, x6, 4
                  mret

ebreak_handler:   
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x28, x6, zero
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
                  add x6, x28, zero
                  lw  x28, (x6)
                  addi x6, x6, 4
                  mret

illegal_instr_handler:
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x28, x6, zero
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
                  add x6, x28, zero
                  lw  x28, (x6)
                  addi x6, x6, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x7, 0x300 # MSTATUS;
                  csrr  x7, 0x304 # MIE;
                  csrr  x7, 0x344 # MIP;
                  csrrc x7, 0x344, x7 # MIP;
                  add x28, x6, zero
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
                  add x6, x28, zero
                  lw  x28, (x6)
                  addi x6, x6, 4
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
