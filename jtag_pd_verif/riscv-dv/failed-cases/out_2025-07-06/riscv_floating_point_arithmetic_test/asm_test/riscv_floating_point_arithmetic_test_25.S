.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x31, h0_start
jalr x0, x31, 0
h0_start:
                  li x19, 0x40001120
                  csrw 0x301, x19
kernel_sp:        
                  la x30, kernel_stack_end

trap_vec_init:    
                  la x19, mtvec_handler
                  ori x19, x19, 1
                  csrw 0x305, x19 # MTVEC

mepc_setup:       
                  la x19, init
                  csrw 0x341, x19

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x19, 0x3800
                  csrw 0x300, x19 # MSTATUS
                  li x19, 0x0
                  csrw 0x304, x19 # MIE
                  mret
init:             
                  li x19, 2139095040
                  fmv.w.x f0, x19
                  li x19, 742855357
                  fmv.w.x f1, x19
                  li x19, 2148536239
                  fmv.w.x f2, x19
                  li x19, 0
                  fmv.w.x f3, x19
                  li x19, 2139095040
                  fmv.w.x f4, x19
                  li x19, 2139095040
                  fmv.w.x f5, x19
                  li x19, 4042184181
                  fmv.w.x f6, x19
                  li x19, 2150978045
                  fmv.w.x f7, x19
                  li x19, 888096
                  fmv.w.x f8, x19
                  li x19, 2139095041
                  fmv.w.x f9, x19
                  li x19, 4286578687
                  fmv.w.x f10, x19
                  li x19, 1305204845
                  fmv.w.x f11, x19
                  li x19, 3684873139
                  fmv.w.x f12, x19
                  li x19, 0
                  fmv.w.x f13, x19
                  li x19, 2139095040
                  fmv.w.x f14, x19
                  li x19, 4286578687
                  fmv.w.x f15, x19
                  li x19, 2139095040
                  fmv.w.x f16, x19
                  li x19, 2139095041
                  fmv.w.x f17, x19
                  li x19, 1693903042
                  fmv.w.x f18, x19
                  li x19, 2139095039
                  fmv.w.x f19, x19
                  li x19, 4286578688
                  fmv.w.x f20, x19
                  li x19, 2139095040
                  fmv.w.x f21, x19
                  li x19, 2139095039
                  fmv.w.x f22, x19
                  li x19, 2139095039
                  fmv.w.x f23, x19
                  li x19, 360911379
                  fmv.w.x f24, x19
                  li x19, 144663064
                  fmv.w.x f25, x19
                  li x19, 2143289344
                  fmv.w.x f26, x19
                  li x19, 2139095041
                  fmv.w.x f27, x19
                  li x19, 4286578688
                  fmv.w.x f28, x19
                  li x19, 1765898005
                  fmv.w.x f29, x19
                  li x19, 1746159
                  fmv.w.x f30, x19
                  li x19, 3941679332
                  fmv.w.x f31, x19
                  fsrmi 2
                  li x0, 0xa
                  li x1, 0x0
                  li x2, 0x3
                  li x3, 0xba429650
                  li x4, 0x0
                  li x5, 0xff41d6c9
                  li x6, 0xbd6da8f
                  li x7, 0x2e802b58
                  li x8, 0x80000000
                  li x9, 0xf9b1f135
                  li x10, 0xbe854238
                  li x11, 0xd
                  li x12, 0x80000000
                  li x13, 0x0
                  li x15, 0x0
                  li x16, 0x87ba104a
                  li x17, 0x90af5001
                  li x18, 0x0
                  li x19, 0xe58a293b
                  li x20, 0x0
                  li x21, 0x3
                  li x22, 0x80000000
                  li x23, 0x6
                  li x24, 0xf554f3c6
                  li x25, 0x6
                  li x26, 0x7
                  li x27, 0xffa0eca3
                  li x28, 0x0
                  li x29, 0x80000000
                  li x31, 0x10c4b775
                  la x14, user_stack_end
main:             fsqrt.s      fs9, fs10
                  sra          s11, a5, a2
                  flt.s        t1, fs11, fa7
                  fsgnjx.s     ft7, fs3, fs10
                  sltiu        s1, s6, 1875
                  fmul.s       fa5, fs7, ft0
                  and          ra, t1, a2
                  fmax.s       fs8, fs8, fa0
                  fcvt.s.w     fa1, s4
                  rem          tp, s5, t3
                  fcvt.s.wu    ft8, a4, rne
                  fclass.s     a2, ft7
                  sltu         a1, s9, t3
                  fcvt.w.s     a2, ft2
                  fsgnjx.s     fs1, ft10, fs8
                  fclass.s     ra, fs7
                  fmax.s       fs10, ft4, ft5
                  div          a7, s6, s4
                  sub          s7, t3, t0
                  xori         s10, t1, 523
                  sub          sp, a6, s9
                  mul          s10, gp, s1
                  fcvt.wu.s    a5, fa4, rtz
                  srli         s5, t4, 27
                  fsgnj.s      fs1, fs6, fs11
                  fclass.s     s7, fs1
                  sltu         s7, t3, a0
                  slti         ra, a2, 1062
                  fsgnjn.s     fa1, fa1, fs4
                  slli         zero, sp, 22
                  sltiu        s5, a5, -1145
                  and          s9, s1, gp
                  slli         a3, a2, 19
                  sra          t1, s6, t5
                  fmin.s       fa5, ft0, fs11
                  fmv.x.w      s4, fs8
                  fsqrt.s      fa2, ft2
                  ori          s9, a1, -736
                  rem          t0, t1, a1
                  fsgnjn.s     fs11, ft9, ft10
                  srl          s8, a5, a0
                  srl          s7, a3, s11
                  fmin.s       ft3, fs1, ft3
                  add          s5, t1, t3
                  fsgnjx.s     ft6, fs2, fs1
                  lui          a1, 683613
                  fdiv.s       fs9, ft2, ft4, rtz
                  sll          t2, a4, t1
                  fsub.s       ft6, fa3, fs11, rmm
                  xor          t4, t5, t0
                  fdiv.s       ft7, ft2, fs3, rne
                  lui          s11, 772028
                  fmul.s       fa1, ft2, ft9, rne
                  feq.s        a1, fs2, fs2
                  fmv.x.w      a7, ft0
                  sltu         t1, s0, t6
                  xori         s10, t1, -578
                  fdiv.s       ft11, ft9, ft8, rmm
                  fdiv.s       fs9, fa0, ft5, rtz
                  sub          t1, zero, a3
                  ori          t0, s6, -1195
                  add          s7, s7, t3
                  fadd.s       ft2, ft1, fs3
                  fsgnjx.s     ft9, fs1, fs8
                  sll          s0, s11, t4
                  and          ra, t5, a0
                  slt          gp, ra, zero
                  fmv.x.w      a5, ft11
                  fmul.s       fa4, fs11, ft1
                  fmv.x.w      t4, fs1
                  srl          a6, s0, s11
                  fsqrt.s      fa7, ft9, rup
                  mul          zero, s6, s0
                  fmax.s       fa2, fa5, fs10
                  sltu         a5, a4, ra
                  fadd.s       ft3, fa1, fs11
                  fdiv.s       fs11, fs8, fa2
                  slti         s4, a0, -982
                  fcvt.s.w     ft8, t6
                  fmul.s       fs3, fa7, fs8
                  fmax.s       fs10, fs9, fs11
                  fsgnjx.s     ft5, fa4, fs9
                  fsgnj.s      ft2, ft0, fa5
                  fsqrt.s      ft2, fa2, rmm
                  sub          s10, a1, t3
                  mulhsu       a0, s7, s3
                  slli         a6, t4, 18
                  fsub.s       fs4, ft10, fs4
                  fdiv.s       fs7, fs7, ft9
                  fmv.w.x      ft11, t3
                  mulh         s6, a4, s6
                  or           t2, t4, s10
                  fmax.s       ft7, fa1, ft7
                  fle.s        a2, fs5, fa3
                  sra          sp, zero, a7
                  fcvt.s.w     fs9, s1
                  fsgnj.s      ft5, fs8, ft9
                  fmax.s       fa4, ft0, fa6
                  sub          a0, a1, s7
                  xori         zero, s7, -1229
                  feq.s        tp, fs2, fs8
                  fmin.s       fs8, fa0, ft5
                  flt.s        zero, fs5, fs9
                  andi         s0, gp, -2043
                  mul          a3, tp, zero
                  fcvt.s.w     fs5, t5, rtz
                  srai         s5, t5, 18
                  nop
                  sltiu        ra, s1, 205
                  fsgnjn.s     fs7, fs5, fa6
                  fmul.s       fs5, fs4, fa6
                  feq.s        sp, fs4, fa6
                  mulhsu       t1, tp, a2
                  fcvt.s.w     fs1, s6, rtz
                  srl          t3, s5, tp
                  fcvt.wu.s    a5, ft6
                  fsgnjx.s     fs10, ft5, fs10
                  lui          a5, 360818
                  fsgnj.s      ft2, ft7, fa4
                  xor          s6, t3, s10
                  mulh         s9, ra, t6
                  nop
                  xor          zero, a2, s8
                  fle.s        ra, fs4, ft6
                  or           s6, zero, zero
                  mul          s11, a6, t0
                  feq.s        s11, fa1, fa5
                  add          sp, gp, t3
                  fmul.s       fa6, fs1, fs10
                  sra          a1, s5, s3
                  slti         a7, a3, 1577
                  fclass.s     s9, fs7
                  fsqrt.s      fa7, ft0
                  flt.s        s5, fs0, ft11
                  rem          a7, s0, s4
                  remu         a2, t6, s5
                  nop
                  or           t0, t3, s9
                  fmv.x.w      a7, ft1
                  fmul.s       fs8, fs10, fa7, rdn
                  sll          t1, s9, t1
                  fdiv.s       ft11, fs8, ft3, rne
                  srai         a3, a7, 20
                  lui          sp, 964243
                  and          s2, s4, s11
                  fmv.w.x      fs6, s8
                  fsgnjn.s     fa7, ft8, fa0
                  fmv.x.w      s3, ft9
                  fadd.s       fa6, fs1, ft2
                  lui          s0, 605898
                  and          a2, a2, s6
                  fmul.s       fs6, ft11, fa3, rtz
                  fmul.s       fa3, ft1, fs5
                  fcvt.w.s     s6, ft11, rup
                  sltu         sp, zero, sp
                  slt          t2, a5, sp
                  slli         sp, a5, 23
                  fdiv.s       fs9, ft9, fs10, rmm
                  fle.s        s3, fs6, fa1
                  fclass.s     a5, ft10
                  fcvt.wu.s    t4, ft7
                  fmv.x.w      s11, ft1
                  sll          s4, ra, s2
                  add          t3, a3, t3
                  flt.s        s0, fs7, ft6
                  divu         a3, ra, s2
                  xori         ra, a6, -843
                  fdiv.s       ft11, ft4, ft6
                  and          s11, t6, sp
                  fmax.s       ft2, ft8, fs6
                  fcvt.w.s     s10, fa2, rtz
                  fclass.s     s6, fs1
                  fmax.s       ft7, fa2, ft10
                  fcvt.w.s     a0, fs6
                  auipc        s8, 352993
                  sltu         a5, s5, a0
                  slt          a6, s1, t3
                  fmul.s       ft6, fs8, ft3
                  addi         tp, s5, 1405
                  and          t3, t0, s11
                  fsub.s       ft6, fs9, fs11
                  sra          t4, t5, s9
                  mul          s5, t1, s2
                  fdiv.s       fs5, fs11, fs6
                  fcvt.w.s     s0, fa4, rmm
                  fsub.s       fs6, ft5, fs8, rmm
                  slt          a7, a3, a0
                  divu         t1, a6, a5
                  rem          s7, a4, a2
                  divu         s9, s10, s11
                  feq.s        t3, ft11, ft2
                  fcvt.s.wu    ft4, tp, rmm
                  fmin.s       ft4, fs2, ft9
                  sltu         t3, s8, a6
                  nop
                  srl          a5, gp, s7
                  fadd.s       ft4, ft5, fs9
                  fsgnj.s      ft6, fa6, fs7
                  slti         gp, t6, -1260
                  fdiv.s       fs11, fs11, ft10, rup
                  and          zero, s11, ra
                  fdiv.s       fa7, fa6, ft5, rmm
                  fsqrt.s      ft1, fs10
                  fle.s        s2, fa6, fs5
                  auipc        s6, 308376
                  flt.s        tp, fs7, ft1
                  fcvt.wu.s    ra, fs0, rne
                  feq.s        sp, fs10, ft1
                  nop
                  fcvt.wu.s    s5, ft4
                  fdiv.s       ft3, fs9, ft11, rdn
                  mul          gp, zero, t1
                  srai         s6, t6, 6
                  and          a3, a2, t5
                  fmv.w.x      fa2, a3
                  srai         sp, t4, 16
                  lui          s10, 878731
                  mul          s1, s6, a5
                  flt.s        s3, ft11, ft0
                  fcvt.w.s     t1, fs0, rne
                  add          s7, s6, t5
                  fclass.s     a2, ft7
                  srli         s5, t3, 18
                  fsub.s       ft5, fa3, ft11, rdn
                  xori         tp, ra, -1671
                  mul          t3, s6, s6
                  and          s1, s0, t0
                  fcvt.s.wu    ft2, sp
                  mul          s8, t0, t5
                  mulh         a3, t0, t0
                  slt          a0, ra, s9
                  sra          s2, sp, s3
                  sll          zero, t0, a5
                  slti         s10, a7, -782
                  flt.s        s9, fa2, fa6
                  xori         a5, a3, 943
                  feq.s        sp, fs1, fs7
                  slt          s0, t6, t0
                  xor          s5, t1, ra
                  flt.s        t4, ft4, fs10
                  fmul.s       fs6, ft6, ft0, rdn
                  addi         zero, a7, -551
                  mulh         a0, ra, gp
                  and          s5, gp, s4
                  and          a3, s1, a7
                  fmv.w.x      fa7, ra
                  fcvt.wu.s    s0, ft5, rmm
                  sltu         t4, a2, s6
                  feq.s        s1, fa4, fs0
                  rem          s7, gp, a5
                  fcvt.s.w     fs4, t0, rtz
                  flt.s        gp, ft4, ft11
                  fsqrt.s      ft7, ft0
                  fsgnj.s      fa4, ft6, ft4
                  feq.s        a7, ft4, ft3
                  lui          s1, 930783
                  fsgnjx.s     ft10, fs0, ft1
                  fmax.s       fs1, ft1, fa0
                  fle.s        t0, ft8, fs5
                  sltiu        t1, a6, -507
                  ori          s9, s10, -1962
                  fmul.s       ft4, fa7, fa4
                  or           t4, t5, s6
                  srai         s9, tp, 7
                  fmv.w.x      ft0, ra
                  xor          s4, s3, tp
                  sll          s4, s0, sp
                  or           a7, s10, t2
                  fcvt.s.w     ft7, a1
                  fsgnj.s      fs3, ft10, fs8
                  nop
                  fmin.s       fa0, fa7, ft1
                  and          s8, t3, a4
                  fmv.x.w      a2, fs1
                  srl          t4, sp, s5
                  fcvt.s.w     ft1, sp, rtz
                  xor          t4, s0, a2
                  mulhsu       t1, tp, a2
                  srai         s9, s7, 26
                  mulhu        t2, a0, t5
                  mulhsu       s7, s10, s5
                  fmv.w.x      ft11, s4
                  fmv.x.w      a7, fs11
                  fmul.s       fa7, fs4, ft3, rtz
                  fmv.w.x      fs10, a0
                  fcvt.wu.s    s2, fa0
                  fsub.s       fs3, ft11, fa1
                  fsqrt.s      fa5, ft2, rne
                  srli         tp, s6, 9
                  fsgnjx.s     fs4, fa5, ft11
                  auipc        s4, 580172
                  fmul.s       fa5, fs3, fs0
                  fmin.s       ft7, ft6, ft4
                  mulh         t4, s1, s0
                  fcvt.w.s     s11, fs7, rup
                  fle.s        s1, ft9, fs2
                  sub          a6, s0, s7
                  mulhsu       gp, a7, a6
                  fsgnj.s      ft10, fs4, ft10
                  fsub.s       fa0, ft1, fs5, rne
                  xori         s5, s0, 506
                  fsgnjx.s     fa5, ft1, fs7
                  fadd.s       ft7, ft11, ft0
                  sll          t4, s3, a1
                  or           tp, tp, s11
                  mulh         t2, a2, t6
                  andi         s2, gp, -1281
                  slti         a1, t6, 686
                  sll          s3, ra, zero
                  addi         gp, s4, 986
                  fadd.s       fs5, ft0, ft2
                  lui          a3, 1011069
                  fcvt.wu.s    s11, fa5
                  fmin.s       fs1, fa3, fa4
                  or           a6, s5, s0
                  fcvt.s.w     fa6, a7
                  ori          t2, t0, -428
                  mulhsu       s9, sp, s1
                  fadd.s       fa7, fa6, fa1
                  fsub.s       ft8, ft3, fs3
                  flt.s        t0, fs7, ft2
                  fcvt.w.s     s2, fs11, rdn
                  fsgnj.s      ft6, ft5, ft10
                  sll          sp, s5, a7
                  mulhsu       a1, t3, t4
                  slli         a3, s10, 7
                  ori          sp, s1, 604
                  fcvt.s.w     fa3, a2, rne
                  mulh         s2, s1, t1
                  or           s6, t3, t1
                  sll          s5, tp, t3
                  srai         s0, a0, 10
                  ori          s11, a6, -1308
                  fcvt.w.s     gp, fs0
                  fmul.s       ft2, ft2, ft9
                  fcvt.w.s     s11, fs11, rne
                  fmin.s       ft0, fa4, fa7
                  fmv.w.x      ft1, a6
                  slti         gp, s1, 1413
                  add          a1, s5, a0
                  addi         t2, s7, -2028
                  divu         a0, s4, t4
                  auipc        a2, 396769
                  divu         a7, s11, t0
                  mulh         s5, t4, s6
                  fcvt.w.s     s3, fs2, rne
                  srli         gp, t4, 6
                  fsqrt.s      ft3, fs8, rmm
                  fcvt.s.wu    fs7, s10, rmm
                  add          a6, a7, zero
                  divu         s10, a3, t1
                  andi         t3, s8, 796
                  fcvt.wu.s    s7, fa2, rup
                  fmv.w.x      fs10, t3
                  sll          s0, s7, s8
                  srli         a1, s7, 25
                  sub          t1, s5, a4
                  fmax.s       ft5, fa5, fs1
                  slt          gp, s4, s3
                  xor          tp, s11, a6
                  srli         t2, tp, 0
                  fsgnjn.s     fa6, fa5, ft1
                  slti         s6, s4, -1394
                  addi         t2, gp, -136
                  mulhu        t2, a3, s0
                  ori          a3, s3, 490
                  sltiu        a3, s8, -1416
                  add          tp, s6, t5
                  fcvt.w.s     s8, fs8, rtz
                  div          a7, t6, t0
                  sub          t1, s5, sp
                  fsqrt.s      fa1, fa2
                  divu         s3, sp, s1
                  andi         t1, a2, 595
                  or           s0, a3, zero
                  srl          s2, s3, t6
                  srai         a1, t1, 8
                  div          s6, a1, s4
                  fsub.s       fs6, ft8, ft10
                  slli         a2, ra, 16
                  sra          a1, t6, zero
                  fcvt.wu.s    s0, ft4, rtz
                  srl          a3, t5, t1
                  fcvt.wu.s    s6, fa2
                  nop
                  sub          s10, t0, a3
                  fsgnjx.s     fs4, ft5, ft3
                  srl          tp, ra, t6
                  fle.s        ra, fa1, fa4
                  nop
                  srl          s5, s5, s9
                  srl          a0, s9, a5
                  mul          s11, a6, t3
                  fcvt.w.s     a7, fs3
                  fsgnj.s      ft7, fs2, fa5
                  sltu         t1, s4, s1
                  nop
                  or           s7, ra, s4
                  addi         a0, s8, 1102
                  and          a7, tp, t6
                  feq.s        s10, ft8, fs10
                  div          a5, s7, gp
                  slti         t0, s11, -1606
                  fsub.s       fa3, fa2, fs3
                  slt          t1, t5, ra
                  sltu         a1, tp, gp
                  fcvt.wu.s    gp, fs1, rtz
                  lui          a0, 165222
                  mulh         gp, s11, s2
                  fclass.s     t2, ft4
                  div          a1, a6, t2
                  sll          s0, t5, s6
                  lui          s2, 978932
                  addi         s8, s8, 1277
                  fcvt.s.wu    ft7, t1, rup
                  sltiu        t1, sp, 1826
                  mul          a7, ra, a0
                  mulh         s4, s11, t3
                  srai         s1, s1, 22
                  fle.s        a5, fs7, fa6
                  flt.s        s6, ft0, ft8
                  flt.s        gp, fa2, ft7
                  xor          a0, s6, s10
                  srl          s2, s10, t0
                  fadd.s       fs11, fa1, ft6, rup
                  xor          s5, a4, s7
                  feq.s        s3, fs5, fa6
                  fmv.x.w      a0, ft11
                  remu         t1, tp, t2
                  sltiu        s11, t3, -426
                  div          a6, s10, s3
                  sltu         a6, s9, s4
                  sltu         s11, gp, tp
                  fcvt.w.s     s10, ft7
                  mul          a7, a0, a1
                  slt          zero, zero, s8
                  fcvt.w.s     sp, fs3
                  add          a6, a5, s6
                  fdiv.s       fa0, fs1, ft9, rtz
                  fcvt.wu.s    zero, fs1, rne
                  mulh         ra, gp, a2
                  fclass.s     sp, ft6
                  flt.s        t1, fs8, fs1
                  fmul.s       fa5, ft1, fa2
                  lui          ra, 973753
                  andi         t0, a2, -237
                  fsqrt.s      fs11, ft1, rne
                  slli         a7, s3, 3
                  fmv.w.x      fs1, a5
                  add          a7, s2, t2
                  fle.s        zero, fs11, ft7
                  fmul.s       ft6, fs8, ft3
                  fsgnj.s      fs11, fs2, fa3
                  sub          t1, ra, s8
                  nop
                  fmin.s       ft5, fs8, fs3
                  fsub.s       fs0, fa6, fs3, rtz
                  sll          t2, t0, sp
                  rem          s8, t6, t1
                  sra          a2, a5, t2
                  fcvt.w.s     gp, ft1
                  sltu         a1, a6, tp
                  remu         s1, gp, t4
                  mul          s6, s0, s1
                  fcvt.s.w     fs1, s7, rmm
                  fsgnjx.s     fs10, fs6, ft2
                  mul          t3, a0, s0
                  sub          t1, s3, s9
                  fclass.s     s11, fs1
                  xor          t2, a4, t3
                  fmv.w.x      ft4, s1
                  rem          a1, s6, s0
                  slli         a7, zero, 21
                  fsqrt.s      fa3, fa3, rdn
                  slti         s9, a6, 1508
                  fle.s        t3, ft10, fa4
                  flt.s        a3, ft0, ft6
                  rem          a7, s2, a5
                  sltu         s1, s4, s2
                  fsqrt.s      ft8, ft0
                  fmax.s       fs2, fa0, fs2
                  fadd.s       fs8, ft7, fa3
                  slti         s9, s7, -378
                  ori          s3, sp, 0
                  fclass.s     ra, ft5
                  sra          gp, gp, gp
                  fsqrt.s      fa6, fs10
                  div          tp, s1, gp
                  remu         a2, a3, t0
                  lui          a5, 1008643
                  fcvt.s.w     ft0, s11
                  and          s0, a6, a5
                  srl          t1, a0, gp
                  div          s3, a2, t0
                  sltu         a2, a1, a1
                  fmul.s       ft11, ft1, ft1
                  sltiu        a7, t6, -1898
                  sltiu        s9, t2, 1121
                  sra          s6, tp, s6
                  divu         zero, s10, s2
                  sub          zero, s10, s8
                  fsgnj.s      fs6, fs6, ft9
                  fsgnjx.s     fs8, ft0, fa6
                  fcvt.wu.s    zero, fa7, rup
                  fsub.s       ft3, ft9, fa7
                  fcvt.s.w     fs5, s8, rtz
                  fadd.s       ft3, fs2, ft11
                  fcvt.s.wu    fs2, a0, rne
                  fsgnj.s      ft8, ft7, ft0
                  srl          a1, gp, s2
                  or           a0, s7, a1
                  fmv.w.x      ft7, s1
                  fcvt.s.w     fa0, a6
                  fcvt.s.wu    fa1, s4, rmm
                  divu         s1, s5, sp
                  mulh         a0, a5, s7
                  fmv.x.w      s4, ft4
                  and          t3, t1, tp
                  fcvt.s.w     fs2, zero
                  fsgnjx.s     fs10, ft11, ft2
                  fsgnjx.s     ft4, fa4, fs0
                  mulhu        zero, a6, s8
                  fsqrt.s      ft0, fs7, rtz
                  div          s0, s3, t5
                  fcvt.w.s     s1, ft8, rtz
                  fclass.s     ra, fs3
                  mul          ra, a3, a0
                  xori         a0, s4, 1233
                  fsgnjx.s     fa6, fs9, ft0
                  sltu         s1, a7, s7
                  feq.s        s2, fa4, ft6
                  sub          t2, s7, s7
                  sltu         s10, s11, sp
                  fsub.s       ft7, fs11, fs6
                  fcvt.s.w     fa4, t6, rup
                  auipc        t2, 55249
                  fmul.s       ft8, fs5, fs0
                  lui          s2, 262914
                  andi         t4, t5, 1547
                  srli         s9, s0, 28
                  fdiv.s       ft9, fs3, fa6, rdn
                  fmul.s       fs1, fs9, ft3, rup
                  div          s11, a0, s10
                  fsgnjx.s     fs7, ft10, fs4
                  slli         s7, s5, 21
                  fmin.s       fa6, fs5, fs9
                  fmul.s       fa1, ft7, ft0, rdn
                  lui          s8, 365901
                  fcvt.w.s     a3, ft8
                  divu         s1, t4, zero
                  ori          s6, s4, -1563
                  add          t2, tp, t1
                  add          t0, ra, s11
                  remu         s9, a5, sp
                  sub          s6, sp, s5
                  fsgnjx.s     ft3, ft5, fa3
                  remu         a3, zero, a4
                  sll          s7, a5, s0
                  add          a3, t3, s2
                  fcvt.w.s     sp, ft9
                  fsgnjn.s     fa5, ft7, ft3
                  fadd.s       fs4, fs10, fs3
                  fmin.s       fs2, fa4, ft3
                  mul          s9, a3, tp
                  or           s0, s10, s4
                  fclass.s     s10, fa5
                  lui          gp, 898832
                  rem          s11, a5, s9
                  feq.s        t3, fs5, fs9
                  flt.s        gp, fs1, fa7
                  feq.s        a6, ft2, fa4
                  slti         a2, s10, 1377
                  fdiv.s       fs9, fs2, ft3, rmm
                  rem          s0, s6, sp
                  ori          tp, a7, 290
                  slti         a3, a3, 1724
                  nop
                  fsgnjn.s     ft11, fa0, fs8
                  lui          ra, 591839
                  slti         a5, s8, 343
                  sltu         a3, t6, a0
                  divu         ra, s2, s0
                  fsgnj.s      fs6, fs11, fa2
                  sltu         t0, tp, ra
                  fsub.s       ft0, fa6, fs4
                  sltiu        a5, s5, -841
                  fsqrt.s      ft7, ft2
                  fclass.s     a6, ft1
                  add          s9, t1, a5
                  fsub.s       fs8, fa3, fa7
                  fcvt.w.s     s6, fs7, rne
                  sub          s3, tp, s3
                  remu         a7, s9, zero
                  addi         t2, a0, 1635
                  fmax.s       fs11, ft10, fs8
                  mulhsu       tp, a6, a1
                  auipc        s7, 167800
                  fcvt.s.wu    ft2, t1, rup
                  srli         s4, s1, 31
                  srai         a7, s7, 8
                  div          t1, zero, tp
                  sra          a3, s1, s7
                  add          tp, a6, a5
                  nop
                  mulhsu       t3, s1, s7
                  flt.s        s9, fs9, fa1
                  mul          zero, t4, a2
                  srai         t0, s8, 29
                  divu         t2, s3, s4
                  fmv.w.x      fa3, t4
                  fsqrt.s      ft8, fa1, rdn
                  feq.s        a7, ft1, fa4
                  fsqrt.s      fs10, fs4
                  lui          a3, 654334
                  fcvt.s.w     ft4, s0, rdn
                  fmv.w.x      ft3, s8
                  fadd.s       fs8, ft4, fs6
                  slti         s5, gp, -1527
                  fsgnjx.s     fs2, fa1, ft10
                  add          s3, a5, sp
                  fsub.s       ft8, ft4, ft9, rmm
                  ori          s0, t0, -1636
                  nop
                  fcvt.w.s     s7, ft4
                  rem          s6, zero, tp
                  auipc        s11, 554050
                  auipc        s0, 985483
                  xor          s3, t0, gp
                  flt.s        a6, fa5, fa2
                  fmul.s       fs2, ft0, ft1
                  xori         t0, tp, 389
                  addi         a0, a6, -711
                  fmax.s       fa3, fa3, ft3
                  fcvt.s.w     ft7, a3, rdn
                  add          a6, t4, s1
                  or           s1, s9, t4
                  srai         t4, a5, 12
                  mulhu        s5, s11, s10
                  andi         s9, s11, -1401
                  fsgnjx.s     ft6, ft1, fs6
                  auipc        sp, 1010400
                  srli         sp, t2, 12
                  nop
                  mulhsu       s0, a7, a1
                  and          ra, s4, t6
                  auipc        t4, 280842
                  andi         t0, t5, -325
                  or           a7, t4, t6
                  sll          s10, s3, t0
                  sltiu        gp, t5, 117
                  mulh         zero, zero, a7
                  ori          s4, gp, 1335
                  fsub.s       fa0, ft1, fs5, rtz
                  sltu         a3, s5, s6
                  nop
                  divu         s5, t5, a3
                  mulh         s3, sp, a5
                  fmul.s       fa4, fa7, fa6, rup
                  xor          s1, s3, ra
                  fsgnjx.s     fs2, fa5, ft3
                  fsub.s       fs6, ft5, fs2
                  xori         t1, s6, 1161
                  rem          a5, s8, gp
                  addi         s10, s5, -867
                  ori          s5, t1, -167
                  srli         t1, a4, 9
                  fmax.s       ft9, fa1, fs9
                  fmin.s       fs9, ft0, fs7
                  lui          a0, 483715
                  fle.s        s11, fs9, ft8
                  slti         sp, a2, -655
                  sll          t4, s4, a6
                  fsgnjn.s     fs2, fs9, fs0
                  mul          s3, t0, a3
                  sub          t2, t0, s3
                  fdiv.s       ft9, fa1, fs7, rup
                  feq.s        s11, fs2, ft8
                  div          a6, s8, s4
                  ori          ra, s7, -1426
                  fsgnj.s      fs7, fa1, ft0
                  fsub.s       fa0, ft11, ft7
                  xori         s3, gp, -1793
                  fcvt.wu.s    s7, fs5
                  slti         t2, tp, 1718
                  ori          s5, gp, -549
                  fmv.w.x      fs3, ra
                  mulhu        s11, a4, a1
                  or           s8, s7, t4
                  xori         a6, tp, -1244
                  feq.s        a0, fs7, ft7
                  fsgnjx.s     fa2, fs1, fa2
                  fdiv.s       fs4, fs1, fs7
                  nop
                  slli         a2, t3, 2
                  fcvt.wu.s    s5, fs6
                  fsub.s       ft6, fa6, fs0, rup
                  fcvt.w.s     a5, fs1
                  srai         s6, t1, 10
                  mulhu        s9, s5, t6
                  nop
                  fsgnjx.s     fs11, ft1, ft7
                  lui          gp, 280809
                  andi         s7, a3, 210
                  remu         a0, s10, s11
                  fsgnjn.s     fs4, fs3, ft10
                  srl          a2, t2, zero
                  ori          t3, t6, -473
                  ori          t4, t6, 1012
                  divu         s3, s8, s9
                  xori         sp, t5, -883
                  andi         s6, a5, -510
                  fmin.s       fs8, fa5, fs4
                  sltu         a7, zero, a5
                  and          a7, t5, a0
                  fcvt.wu.s    ra, ft6
                  fadd.s       fa4, fs10, fs10
                  mulh         s10, t5, a0
                  fsgnjx.s     fs9, fs7, fs7
                  remu         a6, ra, a3
                  remu         a1, t0, s4
                  nop
                  feq.s        a1, ft1, fa7
                  xor          s2, a1, s8
                  fcvt.s.wu    fa6, s9
                  fcvt.s.wu    fa5, t3, rne
                  fcvt.wu.s    s8, fs10, rup
                  fmv.w.x      ft3, a6
                  fcvt.w.s     a7, fs8
                  ori          t2, t0, 1851
                  add          a7, tp, a4
                  mulhsu       s10, t5, s1
                  fadd.s       fa1, fa1, ft8
                  sra          a0, sp, a7
                  feq.s        s2, fa2, fs8
                  slti         a7, s4, -21
                  fcvt.w.s     s7, ft7
                  srli         s11, sp, 23
                  fsgnj.s      ft6, ft9, fs10
                  fsqrt.s      fs11, fs6, rup
                  srl          a1, s6, a6
                  divu         a0, t1, s3
                  sub          s10, tp, tp
                  fdiv.s       fa1, fs9, fa3
                  mulh         t3, t0, a1
                  slli         s10, t4, 29
                  div          a6, zero, t3
                  and          s2, ra, a2
                  sltiu        a5, s2, -1132
                  fcvt.s.wu    ft6, sp
                  fsgnjx.s     fs0, ft6, fs10
                  divu         a0, t6, t5
                  fmul.s       ft1, fs10, fs8
                  mulhu        sp, t2, ra
                  addi         t1, a6, -891
                  fsgnjn.s     fa1, fa6, fs5
                  srl          zero, a0, a6
                  fcvt.w.s     s2, ft10
                  srai         s10, t4, 21
                  remu         a0, s10, t1
                  fadd.s       ft7, ft11, ft5
                  auipc        s9, 243367
                  sll          ra, t1, s1
                  mul          a2, s7, a3
                  fle.s        t4, fa3, ft3
                  fmul.s       ft5, ft9, fa4
                  mulhsu       gp, s2, s2
                  sra          ra, s2, s7
                  and          s6, s3, a7
                  div          a2, a4, s6
                  ori          s2, a3, -1108
                  fdiv.s       ft2, fs0, fa4
                  slt          s2, s8, t5
                  ori          tp, tp, -477
                  div          a1, a0, s6
                  mulh         s4, s6, s7
                  fcvt.s.wu    fa4, s7
                  fcvt.s.w     ft2, s11
                  mulhu        s7, a5, t0
                  srli         gp, a5, 29
                  fsgnj.s      fs6, ft10, ft10
                  divu         s7, sp, s8
                  auipc        s3, 96729
                  fsqrt.s      fs8, fa2
                  fcvt.wu.s    ra, fs5, rne
                  fle.s        s9, fa0, ft0
                  srl          a2, sp, a0
                  addi         s9, s10, -609
                  auipc        s6, 1027695
                  slli         a7, t0, 25
                  sll          s5, a1, s7
                  fcvt.s.wu    fa1, s3
                  fadd.s       ft0, fa1, ft9
                  mulhu        s1, a1, t3
                  slli         t3, s9, 19
                  flt.s        a5, fs10, fa1
                  addi         a3, s4, -1688
                  or           a5, t3, s10
                  fsgnjn.s     ft6, fa6, fs11
                  slti         s11, t0, 236
                  mulhu        t2, s5, a1
                  fclass.s     a0, fa3
                  srli         sp, a0, 9
                  mulhsu       a0, s9, s9
                  fmv.w.x      fs6, t6
                  fclass.s     s4, ft9
                  addi         t4, s10, -1180
                  flt.s        t2, fa7, fs5
                  sltiu        t1, a1, -1592
                  fcvt.s.wu    fs2, ra, rne
                  fmax.s       fs4, fs5, ft6
                  fcvt.w.s     a6, fs4, rup
                  mul          a1, a1, s7
                  sra          t2, gp, s2
                  srl          t1, t1, a0
                  rem          t4, a1, a0
                  fclass.s     gp, fs8
                  fcvt.s.wu    ft8, t2
                  slt          s2, s7, a5
                  fclass.s     t4, fa5
                  fclass.s     s10, fa2
                  fsgnjx.s     ft4, ft4, fa0
                  fmul.s       ft9, fa7, fs0
                  lui          a5, 489156
                  andi         s2, t3, 300
                  rem          s3, s11, a7
                  srl          t1, a3, s5
                  addi         s8, gp, -841
                  flt.s        a5, fs11, ft4
                  sll          a5, t0, tp
                  or           t1, s0, gp
                  fmv.w.x      ft7, s11
                  fle.s        t3, fs6, ft3
                  remu         s2, s3, s6
                  fmul.s       ft11, ft1, ft11
                  mul          s10, t5, a6
                  div          s6, a5, s8
                  or           a6, s6, s1
                  sltu         t4, ra, a2
                  xori         s8, s4, 1383
                  fmin.s       fs0, fa3, fs6
                  remu         zero, a2, a3
                  addi         t0, t5, -194
                  slt          sp, a0, t5
                  remu         zero, s0, s4
                  nop
                  fcvt.s.w     fs1, gp, rmm
                  fsqrt.s      fa3, ft1
                  nop
                  fcvt.s.w     fa4, t3, rup
                  add          a1, s7, s0
                  srai         s10, tp, 25
                  sltiu        s2, zero, -1234
                  nop
                  nop
                  addi         a7, s2, 631
                  ori          a6, s9, 1864
                  fmax.s       fs7, fa7, fs11
                  fmax.s       ft4, fs5, fa7
                  fsqrt.s      fa4, ft10
                  auipc        t0, 647515
                  fmin.s       ft5, fs8, fs3
                  fmv.w.x      fs8, a0
                  remu         gp, s0, s4
                  fcvt.s.wu    fa1, t0, rup
                  fmv.x.w      s6, fa7
                  srl          s2, t0, s10
                  sltiu        s11, s9, -885
                  fcvt.w.s     s1, fs4
                  mulh         t4, a4, t0
                  fdiv.s       ft10, fs2, ft11, rne
                  mul          s11, a4, t4
                  fsqrt.s      fs7, ft10, rup
                  divu         s8, a5, a4
                  xori         a0, a1, -1457
                  divu         tp, s8, a1
                  xor          a0, s8, a3
                  fcvt.wu.s    zero, fs1
                  sltu         a0, t1, t5
                  sltiu        gp, s10, -668
                  xori         s10, s9, -201
                  sll          s8, a7, sp
                  xor          s8, tp, gp
                  fcvt.w.s     t1, ft9
                  fclass.s     s10, fs0
                  addi         a3, t2, 805
                  fmv.x.w      a2, ft6
                  or           t4, a6, a1
                  srl          s1, a3, a0
                  fmax.s       ft1, ft5, fs4
                  add          s2, s2, s6
                  slli         a5, s9, 25
                  sub          s5, t5, a2
                  fcvt.s.w     fs10, s2
                  sltu         s4, s3, a6
                  sltu         a7, a5, zero
                  sra          t2, t5, s8
                  fadd.s       ft6, fa4, fs4, rdn
                  or           s4, t0, t0
                  fmul.s       ft6, fs10, fa1, rne
                  add          t4, s6, s5
                  sltiu        t3, a4, 1318
                  sub          s8, zero, tp
                  fmin.s       ft10, fa0, ft9
                  slt          s3, tp, s10
                  fclass.s     a2, ft3
                  fcvt.s.w     fs9, gp
                  fsqrt.s      fs5, ft7
                  ori          a7, a3, -1365
                  fclass.s     a3, ft5
                  sra          a1, s8, s1
                  fcvt.s.w     fs10, sp, rdn
                  srli         a5, t0, 6
                  mulh         a7, zero, ra
                  fclass.s     ra, fs7
                  sltiu        s5, a3, 1109
                  mulhu        s0, t5, s9
                  remu         s11, s10, t5
                  xori         t4, ra, -534
                  and          t2, s5, a1
                  sltu         t4, t0, s2
                  flt.s        a7, fa1, ft7
                  srl          s4, a0, s0
                  fcvt.s.w     ft11, s7, rtz
                  fclass.s     s2, ft0
                  fmv.x.w      s7, ft2
                  fmv.w.x      ft3, gp
                  lui          a6, 472937
                  fcvt.s.w     ft2, t1, rdn
                  mul          a5, gp, t1
                  fdiv.s       ft2, ft5, ft9
                  slli         s2, s10, 17
                  fdiv.s       ft3, fs0, fs2
                  xori         s3, gp, -1535
                  add          s4, a2, t4
                  and          s5, a0, s6
                  srai         s4, t0, 6
                  mulh         tp, s8, a3
                  srli         t2, s0, 11
                  fmv.x.w      s2, ft7
                  slli         s5, t1, 8
                  srai         t1, s11, 13
                  fmv.w.x      ft5, s3
                  divu         s3, a4, s10
                  add          a5, tp, s11
                  slt          a7, t4, s7
                  slti         s8, t4, -2002
                  srai         s10, s4, 26
                  xori         s5, s8, -251
                  slti         s0, t1, 1870
                  remu         s8, s6, s2
                  auipc        t3, 115402
                  mulhsu       s5, sp, a5
                  fmax.s       ft2, fs0, fa0
                  fcvt.s.wu    fs7, s0
                  mulhu        a7, t3, zero
                  fsgnjx.s     fa1, ft0, fs11
                  fle.s        a3, ft7, fs8
                  sltu         ra, ra, s0
                  feq.s        s3, fs2, fs5
                  sltiu        s10, zero, 1269
                  fcvt.s.w     ft9, sp, rup
                  add          s0, zero, s7
                  srl          s1, a1, a4
                  remu         t0, ra, t5
                  fsqrt.s      fa7, ft8
                  sub          a6, s11, a5
                  slli         s7, s3, 3
                  fclass.s     s11, fs1
                  fmv.x.w      s10, ft2
                  sra          zero, s11, s10
                  flt.s        sp, fs7, fs5
                  slli         a7, zero, 20
                  sltiu        s4, tp, -1758
                  fsqrt.s      ft1, ft3, rtz
                  sub          s2, s8, t1
                  lui          s1, 550074
                  srli         s6, t3, 3
                  fcvt.w.s     s8, ft9, rtz
                  slli         s8, s11, 19
                  fmin.s       ft7, fs6, ft1
                  ori          sp, s9, -211
                  addi         s2, t1, 1605
                  sll          t4, s6, t6
                  fsgnj.s      fa3, ft9, ft8
                  fsgnjx.s     ft8, fa3, fs8
                  rem          t4, t5, a7
                  fmv.w.x      fs5, a1
                  fmul.s       ft3, ft6, ft9
                  fcvt.s.w     fs5, ra
                  fmv.w.x      fs7, tp
                  div          gp, s3, t6
                  fsgnjx.s     ft0, fs0, fs7
                  fcvt.s.wu    fs6, a7
                  mul          a5, s8, s3
                  fmin.s       fs4, fs3, ft6
                  fcvt.s.wu    fa1, a5, rdn
                  sll          a6, a5, s8
                  fmul.s       fa6, fs0, fs1, rne
                  lui          s1, 520648
                  xori         s0, s5, 1664
                  fsgnjn.s     fs5, fs9, ft10
                  fsgnj.s      fs11, fa5, fs7
                  rem          t1, sp, a6
                  nop
                  div          a7, t0, t3
                  rem          sp, gp, t0
                  slt          s5, a5, sp
                  mul          t4, a3, a3
                  sll          s4, s1, t1
                  flt.s        s10, fs3, fa5
                  fcvt.s.wu    fs4, t1, rne
                  fadd.s       ft2, fs1, fs2, rdn
                  remu         ra, t4, s8
                  fmv.x.w      sp, fs9
                  sra          t2, t3, a3
                  sll          s6, a3, a4
                  fcvt.wu.s    a6, fs8
                  srl          a2, s1, t6
                  fmv.w.x      fs9, a0
                  mul          a2, s9, s10
                  fmul.s       fs7, fs1, fa7
                  mul          s0, s8, a1
                  fcvt.s.wu    ft6, gp, rne
                  addi         s1, s6, 515
                  remu         s10, a3, t6
                  fle.s        s2, fs6, fs7
                  fdiv.s       ft11, ft5, fs6
                  sub          s0, s7, s6
                  fcvt.wu.s    ra, fs6, rmm
                  divu         a3, t1, s6
                  divu         a5, a5, s3
                  fcvt.s.wu    fa5, a7, rup
                  mulh         s4, t4, gp
                  fcvt.wu.s    ra, ft1, rtz
                  xori         a7, gp, -1937
                  fcvt.wu.s    zero, ft2, rne
                  fmax.s       ft8, ft4, fs3
                  remu         s9, sp, gp
                  fmax.s       fs9, fa2, fs1
                  divu         ra, s9, t4
                  fmv.x.w      s8, fa4
                  slt          a7, a5, s7
                  fmin.s       ft1, ft7, fs1
                  mulhsu       s4, a2, s8
                  fcvt.w.s     a0, fa5
                  fmv.w.x      fs1, a5
                  divu         s9, t3, t0
                  fadd.s       ft3, fs0, ft9
                  feq.s        a2, ft0, ft2
                  fcvt.wu.s    s0, fa3
                  srl          sp, s2, a3
                  mulhu        a3, s2, a4
                  fsgnj.s      fa0, ft6, fa7
                  and          a2, ra, tp
                  flt.s        ra, fs5, fa1
                  fclass.s     a1, fa1
                  fcvt.wu.s    s8, fs1, rdn
                  feq.s        s6, fs6, ft2
                  xor          a1, t3, s10
                  fsgnjx.s     ft7, ft0, fa5
                  fsub.s       fs5, fs2, ft11, rmm
                  addi         a6, a7, -283
                  fmin.s       fs3, fs11, ft4
                  xor          t0, zero, gp
                  sll          s8, sp, s5
                  ori          ra, a1, 1681
                  rem          a3, a6, s11
                  fcvt.s.wu    fs3, a5
                  feq.s        s11, fa1, fs11
                  ori          a6, s5, -767
                  sub          s2, a0, t0
                  fsgnj.s      ft6, fs0, ft5
                  div          a2, ra, a5
                  nop
                  sub          s7, t0, s2
                  slli         s10, s0, 1
                  sltiu        s2, a4, 309
                  slt          s2, a2, s5
                  feq.s        t2, ft5, fa6
                  fadd.s       fs5, fs11, fa1, rdn
                  fadd.s       fs0, ft0, fa3, rdn
                  or           t2, s8, t3
                  fsqrt.s      fs3, fs7, rne
                  srai         s10, s0, 18
                  slt          s9, t5, s3
                  and          t0, t1, a5
                  mul          s4, s0, s5
                  fsqrt.s      fa4, fa1, rup
                  slt          gp, ra, a1
                  lui          s0, 868986
                  fmax.s       fs10, fs11, fa6
                  fcvt.wu.s    zero, fs9, rne
                  andi         tp, ra, -587
                  or           sp, s0, s4
                  fmin.s       fa2, ft0, fa7
                  feq.s        s8, fs4, fs6
                  rem          s10, a0, a6
                  fmv.x.w      a6, fs1
                  xor          a7, s10, a0
                  slti         s7, a7, 679
                  div          s5, t4, s2
                  mulhu        t1, s3, s9
                  sltu         ra, a6, s7
                  fmax.s       ft9, fa4, fs10
                  and          ra, a1, s3
                  flt.s        s3, fs11, ft10
                  sll          s4, s2, a4
                  or           a7, s10, s10
                  nop
                  mul          s0, ra, a2
                  fdiv.s       fs1, ft5, fs4, rne
                  slli         t3, s7, 27
                  mul          a6, t2, s4
                  remu         s9, s7, s11
                  or           s8, a5, a7
                  fle.s        zero, fs4, fs2
                  srli         a3, t0, 31
                  mul          zero, s4, ra
                  fsqrt.s      fa3, ft0, rtz
                  fsub.s       ft11, ft5, fa6
                  or           t4, s5, s0
                  xori         s9, gp, 419
                  fadd.s       ft11, fs9, ft5, rtz
                  srl          s7, s11, s0
                  fle.s        s9, ft4, fs2
                  andi         s0, ra, 1007
                  sltiu        gp, t5, 45
                  add          s3, zero, s8
                  fsub.s       fa2, ft5, fa2, rne
                  xori         a0, a0, 1565
                  sltu         t1, gp, zero
                  fcvt.w.s     s7, fs6, rne
                  srli         s4, ra, 15
                  fmul.s       ft6, ft0, fa1
                  xor          a5, t2, tp
                  andi         t4, t2, -1496
                  sub          gp, t4, gp
                  flt.s        t1, ft0, ft10
                  xori         s8, s11, -1053
                  and          s0, gp, s3
                  and          s6, t6, s4
                  lui          s6, 562554
                  fmv.x.w      t0, ft10
                  sltiu        s11, a6, 1903
                  ori          t4, s2, 117
                  fadd.s       fa4, fs6, ft4, rtz
                  fmv.w.x      fa0, s11
                  fsgnjx.s     fs2, fs5, ft11
                  fdiv.s       ft11, fs7, fs5, rmm
                  fsgnj.s      fa5, fa0, ft8
                  srli         sp, t2, 8
                  srai         t4, s7, 22
                  mulh         s7, a4, t6
                  mul          s9, a4, sp
                  fle.s        s3, fs1, fs0
                  fsgnjn.s     fa1, ft3, fs0
                  mulh         a2, s11, a3
                  fcvt.wu.s    a3, ft7, rdn
                  andi         a3, a5, -829
                  slti         s9, a7, -1649
                  add          zero, s11, t6
                  andi         a2, gp, 77
                  feq.s        a0, ft10, ft11
                  add          t3, s8, a6
                  divu         t3, s9, a2
                  sltu         t1, a4, s6
                  and          t4, s7, s9
                  fle.s        a7, fs7, fs10
                  div          gp, a4, sp
                  mul          sp, a5, a6
                  fmin.s       ft4, ft5, ft4
                  sltu         s9, a2, a7
                  fdiv.s       ft0, ft10, fs6
                  xor          ra, a4, s2
                  fdiv.s       fa3, ft10, ft8, rtz
                  lui          s10, 491252
                  sra          s11, t2, s10
                  flt.s        s10, ft7, fs0
                  fcvt.w.s     s11, fs3, rtz
                  srli         s0, t0, 25
                  fmv.x.w      a7, ft3
                  ori          a7, ra, 1336
                  fsgnjn.s     ft3, fa6, ft7
                  fmax.s       ft3, fs10, ft11
                  sra          t2, a3, a0
                  mulh         a3, a7, s1
                  fmin.s       ft11, fs1, fa7
                  fmv.w.x      ft10, s2
                  addi         s5, ra, -1866
                  mulhu        s1, t2, a1
                  addi         t4, s8, -1220
                  fmv.x.w      a6, fs0
                  mulhu        s3, s8, s3
                  add          t3, s3, a1
                  srai         s3, s6, 31
                  fdiv.s       ft1, ft2, ft6, rdn
                  mulhu        gp, tp, s6
                  addi         s4, s2, 206
                  divu         s5, a0, zero
                  rem          a3, a3, a7
                  fsgnjx.s     fs4, fa2, ft5
                  addi         a7, s6, -30
                  fcvt.s.w     ft7, gp
                  ori          tp, a7, -1064
                  fcvt.s.w     fs7, tp
                  fcvt.wu.s    t2, fs11
                  mulhu        zero, a1, t1
                  fcvt.w.s     s7, ft3, rtz
                  mulhsu       s6, a2, t4
                  fadd.s       ft4, fs11, fs9
                  mul          a5, s0, ra
                  fsgnjn.s     fs7, ft6, fs10
                  sll          ra, s11, s6
                  slt          a3, s7, a3
                  fsub.s       fa1, ft5, fs3
                  xori         s10, gp, 1581
                  addi         ra, t0, -331
                  fadd.s       fs2, fa7, ft4, rtz
                  add          t0, s2, ra
                  sub          s6, s2, t4
                  sub          t1, s0, s8
                  flt.s        tp, fs6, fs2
                  fmin.s       ft4, ft8, ft10
                  addi         a0, a4, -547
                  or           s5, s2, t5
                  or           t0, t5, s4
                  fcvt.wu.s    a3, fs2, rne
                  lui          s3, 328032
                  sub          zero, a0, a0
                  fmul.s       ft1, fa4, ft7, rup
                  sll          s4, s4, a6
                  ori          a5, s11, -1296
                  mul          s9, s9, s6
                  fdiv.s       fa2, ft5, ft10, rtz
                  divu         s2, tp, t4
                  mul          gp, s7, a7
                  slli         a5, tp, 28
                  fle.s        a5, ft3, ft10
                  fmin.s       fs8, fs1, fs6
                  xori         t1, sp, -359
                  mul          s4, s4, s4
                  fsgnj.s      fa1, fa7, ft11
                  fclass.s     s4, fa1
                  add          s4, a0, a6
                  slli         s10, s8, 12
                  fadd.s       fa4, fs7, ft10
                  fmul.s       fs11, ft8, ft5, rmm
                  fmv.x.w      a7, fs2
                  fmv.x.w      s1, ft5
                  lui          t3, 875096
                  rem          s0, t5, t2
                  fcvt.wu.s    s3, fa1, rup
                  fmul.s       fs2, fs0, ft6, rdn
                  fsgnj.s      fa1, fs1, ft3
                  xor          gp, s1, s7
                  fcvt.s.w     fa6, t3
                  fclass.s     zero, fa7
                  fcvt.s.wu    ft5, s11, rdn
                  mulh         a0, tp, s4
                  fsgnj.s      ft8, fs2, fs0
                  mulh         t3, t2, a2
                  sub          s8, t2, ra
                  fcvt.wu.s    t3, fa2, rmm
                  xori         s6, ra, 1889
                  xor          s6, gp, s4
                  nop
                  srai         ra, s3, 23
                  fdiv.s       ft5, ft8, fs6, rne
                  slt          ra, t2, s10
                  srl          a0, t2, a2
                  mulh         s6, t2, a6
                  fle.s        s0, fs2, fs0
                  slti         s11, s1, -711
                  mulhsu       a1, a5, s4
                  xori         a2, s2, -1259
                  sub          s7, s9, t5
                  fsub.s       ft1, fs8, fa7
                  div          a1, t2, s4
                  fsgnj.s      fs4, ft7, fa7
                  mulh         t3, gp, a2
                  sltiu        t0, s0, -347
                  flt.s        a2, ft10, ft2
                  fadd.s       ft1, ft4, fs0
                  mulhu        sp, t5, s8
                  xor          a7, t0, t0
                  fmv.x.w      a7, fa5
                  mulh         t1, s9, s6
                  fcvt.s.wu    fs8, s2
                  fdiv.s       fs1, ft10, ft10
                  fdiv.s       fa4, ft7, ft7, rdn
                  fmul.s       ft2, fs1, fa1
                  fsub.s       fs9, fs10, fa0
                  rem          s11, t5, t4
                  fdiv.s       fs8, ft5, ft0
                  mulh         t4, a3, tp
                  sub          ra, t3, s10
                  sub          s8, zero, a2
                  fcvt.wu.s    t2, fs5
                  and          t2, t6, a5
                  fmv.w.x      fs6, s7
                  mulhsu       a1, gp, s7
                  fle.s        s11, fs1, ft2
                  slt          a2, ra, t5
                  slti         s3, a4, 792
                  sra          s7, gp, s8
                  ori          ra, a0, 632
                  fsgnj.s      fa3, ft9, ft5
                  rem          s4, s10, gp
                  div          s11, t5, ra
                  srl          s7, t4, s2
                  div          s5, s0, t0
                  or           t0, s8, s2
                  fmv.x.w      s9, ft5
                  feq.s        s8, fa0, fa3
                  fle.s        s4, fs10, ft3
                  sll          ra, a0, t4
                  xori         zero, s2, -1484
                  srai         s8, a1, 29
                  and          s1, sp, s6
                  fcvt.w.s     s8, ft10
                  fcvt.s.w     ft6, s2
                  add          s3, s7, s7
                  rem          sp, a5, s0
                  div          s11, s2, a1
                  fsgnjx.s     ft6, fa3, fs6
                  srl          sp, a3, t4
                  xor          gp, t5, a6
                  mulhsu       s11, sp, a2
                  sltu         s6, s5, a5
                  fmax.s       fs9, fs4, fa2
                  lui          sp, 786985
                  mulhsu       ra, a3, a7
                  fmv.x.w      sp, ft1
                  remu         ra, s3, a2
                  fcvt.s.wu    fa4, s3, rne
                  fcvt.s.wu    fa5, t1, rdn
                  nop
                  fmax.s       fa0, ft10, fa2
                  fmul.s       fa6, fs9, fs4, rup
                  fmv.w.x      fa5, a5
                  feq.s        s10, fs5, ft4
                  fclass.s     s9, ft4
                  feq.s        s7, ft6, fs3
                  xor          s9, s5, s1
                  feq.s        t4, fs9, ft9
                  lui          a2, 781848
                  fsub.s       ft4, fa0, ft2
                  rem          a6, s2, tp
                  and          s3, zero, a1
                  slt          a1, s8, s3
                  xor          t3, a6, s5
                  fsgnjx.s     ft0, ft9, fa7
                  fsgnjn.s     ft6, fs11, ft3
                  feq.s        a2, fs0, fs8
                  fmv.x.w      a1, fs1
                  div          a3, s1, a6
                  slli         s6, gp, 12
                  fdiv.s       ft6, fs2, ft11
                  srai         gp, s8, 25
                  fclass.s     tp, fa2
                  srai         s2, a6, 21
                  andi         t3, gp, -1788
                  fsgnj.s      fa6, fs4, ft7
                  srli         s10, a5, 4
                  fsgnj.s      fs9, ft10, ft6
                  sll          s6, t4, s11
                  rem          t1, tp, s2
                  fmin.s       ft2, ft7, fa7
                  nop
                  srl          s1, a2, a5
                  rem          s1, s2, a4
                  sll          s5, a4, t6
                  add          t0, a4, sp
                  fclass.s     t3, ft9
                  srl          s0, s8, t2
                  fclass.s     a6, ft5
                  srl          s2, tp, s8
                  sra          t2, zero, s3
                  div          a1, t0, a7
                  fsqrt.s      ft4, ft5
                  rem          s0, t0, tp
                  srai         s4, s4, 9
                  xor          tp, s7, s6
                  slt          s6, s10, sp
                  fcvt.wu.s    a2, ft1
                  fle.s        t1, ft9, ft1
                  sub          s4, s10, s5
                  and          s6, tp, s3
                  andi         s9, t3, 1658
                  fmul.s       ft3, ft1, ft5
                  slti         s8, t5, 5
                  xori         t1, t1, 2041
                  andi         zero, t2, 396
                  fcvt.s.w     fs10, t6
                  nop
                  sra          s8, a0, s6
                  slti         t0, sp, -1589
                  nop
                  sub          s2, tp, tp
                  fmin.s       ft2, fa2, fa4
                  fmv.w.x      fs10, s9
                  fclass.s     t3, ft11
                  slti         s4, t5, -1121
                  fcvt.wu.s    zero, ft8, rdn
                  and          s7, t4, s8
                  fmv.w.x      fs9, a2
                  divu         s0, a5, a7
                  div          a6, s2, sp
                  mulhu        tp, a4, ra
                  fcvt.wu.s    t0, fa6, rup
                  fcvt.s.w     ft7, s5
                  srli         ra, s4, 0
                  add          tp, a4, t2
                  srl          a2, a5, s1
                  mulh         s1, sp, s0
                  fcvt.s.wu    ft2, s4, rup
                  sub          s3, a2, s10
                  sltiu        s7, t5, 1363
                  srli         a0, a3, 5
                  fsub.s       fs4, fs4, ft8, rmm
                  divu         a0, s10, a0
                  and          gp, a1, gp
                  mulhsu       t2, t3, a6
                  srai         s11, t0, 17
                  fcvt.w.s     sp, fs7, rtz
                  and          s4, s2, a5
                  or           s11, s11, s10
                  fadd.s       ft2, ft7, fa6, rtz
                  sll          s3, s9, s3
                  fclass.s     tp, fa6
                  slli         gp, t4, 26
                  fcvt.wu.s    zero, ft5
                  sra          a2, t0, s11
                  fsgnjx.s     fa6, fa0, ft8
                  fadd.s       fs2, fs9, fs3, rup
                  slt          a1, s2, s6
                  sub          s4, s0, t1
                  xori         s7, zero, 417
                  lui          t0, 545084
                  slt          t3, a1, s5
                  div          tp, s7, t1
                  srli         a6, ra, 11
                  div          gp, sp, a7
                  sra          a3, s4, a3
                  sltiu        s10, t4, -92
                  fmv.w.x      fs3, t3
                  srli         s2, a3, 27
                  ori          t4, a7, -1562
                  slt          t4, a2, t0
                  addi         tp, s4, 1104
                  fsqrt.s      fs7, fs6, rdn
                  fsgnjx.s     fs10, fs1, ft10
                  fadd.s       fs11, ft6, ft10, rtz
                  and          s4, a7, sp
                  srli         s3, a3, 25
                  fsgnjn.s     ft9, fs7, ft8
                  slti         s6, s9, -1839
                  fmin.s       ft2, ft2, fs0
                  lui          a5, 227554
                  or           a5, s3, s10
                  xor          s2, t1, a7
                  mulhu        a2, tp, tp
                  fcvt.w.s     t1, fa7, rup
                  addi         s8, t4, 1848
                  fsqrt.s      ft1, fa0
                  nop
                  slli         sp, t1, 11
                  div          a6, s4, s3
                  slli         s4, t5, 18
                  sub          s11, s11, s9
                  and          s8, s2, t5
                  fsgnjn.s     fs6, fs11, fs0
                  sra          zero, s5, s10
                  or           s10, t1, a5
                  auipc        a0, 722233
                  sra          s5, s0, s6
                  fcvt.s.w     fs2, a2, rmm
                  andi         a0, t2, 178
                  fmul.s       ft1, fa2, fs1
                  mulhu        t2, s0, tp
                  fsgnjx.s     fa1, ft3, ft0
                  mul          s3, tp, s0
                  fdiv.s       fs3, fa2, fa4
                  and          a5, s8, s0
                  fmax.s       fs8, fs10, fs3
                  fsgnjx.s     fs3, ft6, ft3
                  feq.s        sp, fs11, ft10
                  or           s9, a2, a5
                  mulhu        t3, t6, a2
                  fdiv.s       ft1, fs10, fs3, rmm
                  fsqrt.s      fs0, ft8
                  slli         tp, t0, 14
                  add          ra, t5, a2
                  fmv.w.x      ft1, s1
                  sll          zero, a2, s11
                  divu         s4, s0, a7
                  fcvt.wu.s    t1, ft10, rup
                  add          t4, s4, t0
                  xor          s10, s6, t1
                  fmv.x.w      s2, fa2
                  slt          a3, s10, s3
                  mulhsu       t3, t2, a5
                  flt.s        a2, ft0, fs10
                  sra          ra, a3, s10
                  fsgnjn.s     fa3, ft6, ft10
                  auipc        s3, 218386
                  rem          t0, a4, zero
                  fmv.w.x      ft5, a4
                  mulh         s0, a0, s8
                  fle.s        a3, fs0, fa0
                  fle.s        t2, ft10, fa1
                  mulhu        s0, tp, sp
                  xor          s3, a3, s4
                  slti         a6, s1, -208
                  fdiv.s       fs3, fa2, ft7, rup
                  flt.s        tp, fa1, fs4
                  and          gp, t5, s8
                  srai         tp, s11, 2
                  sra          s1, t1, s4
                  sub          zero, s7, t0
                  fdiv.s       fs0, fa5, fa7
                  fcvt.s.w     ft4, a1, rmm
                  mulh         a1, t3, tp
                  fcvt.wu.s    t1, fs9
                  and          t3, a2, t6
                  fmul.s       ft9, fs11, fa6
                  fmax.s       ft11, ft1, fa2
                  sra          a5, s4, sp
                  remu         s1, s11, s0
                  slti         s1, sp, 807
                  fmul.s       ft4, ft9, fa4
                  add          t4, s5, s8
                  fmax.s       fs9, ft11, fs0
                  xor          a0, s1, a6
                  lui          sp, 340960
                  sub          s1, s7, s1
                  srl          gp, s0, t3
                  fdiv.s       ft8, ft5, ft9
                  ori          t4, s1, -1808
                  mulh         a7, s4, ra
                  srai         s4, s2, 16
                  divu         t3, t5, a6
                  fmv.x.w      t3, fs5
                  fadd.s       fs6, fs6, fs2
                  srai         t3, t6, 2
                  sra          t1, a1, a2
                  rem          t0, t1, s11
                  feq.s        s4, fs6, ft2
                  or           a6, gp, t3
                  add          zero, t6, s8
                  xor          t3, gp, sp
                  srl          s3, s8, s4
                  sll          gp, s11, a3
                  addi         s10, a6, 617
                  mulh         a3, a2, t1
                  fsub.s       fa3, fa6, fs9
                  fsub.s       ft0, ft9, fs3, rup
                  lui          t0, 852098
                  remu         s9, s7, s9
                  fcvt.s.wu    ft3, a5, rmm
                  fadd.s       ft6, ft9, ft9
                  slti         s5, a6, 893
                  mulhsu       zero, gp, s0
                  feq.s        s9, ft0, fa7
                  fmax.s       fs4, fa2, fs11
                  slt          a1, s5, a5
                  fcvt.s.w     fs3, s7, rup
                  srli         a0, s11, 24
                  auipc        s9, 107632
                  slli         a0, tp, 27
                  fcvt.w.s     s7, fs6
                  srl          s11, t1, a5
                  fsgnjn.s     ft3, fs8, ft6
                  fcvt.w.s     s2, ft1, rmm
                  fcvt.w.s     a1, ft10
                  sltiu        s1, t1, -556
                  fsub.s       ft7, ft4, fs4
                  ori          a2, s6, -240
                  fmul.s       fa7, fa6, fs6
                  fsub.s       ft11, ft1, fs1, rne
                  fsgnjn.s     ft4, fs8, ft1
                  addi         a3, s7, 835
                  sll          a2, tp, s6
                  sub          s0, a4, gp
                  sll          a3, s1, s10
                  mulh         sp, s8, s7
                  addi         gp, a2, -242
                  slli         a7, ra, 17
                  divu         ra, a0, t5
                  rem          zero, s2, s2
                  fdiv.s       ft2, fs0, fs7, rup
                  mulhu        s7, sp, t6
                  nop
                  fcvt.s.w     fa6, t0, rmm
                  xori         t0, a4, -7
                  fcvt.s.wu    fs0, ra
                  fmv.w.x      ft2, tp
                  fadd.s       ft2, fa2, fa0, rup
                  rem          ra, t5, s5
                  sub          t1, s2, t6
                  sub          t1, ra, a4
                  slti         s2, a2, 761
                  fmul.s       fs3, ft5, fs7
                  xori         tp, zero, 1088
                  sra          ra, a7, s0
                  sltu         a5, a6, s10
                  fmin.s       ft4, fs3, ft0
                  fmax.s       ft10, ft7, fa2
                  feq.s        ra, ft7, fa1
                  fcvt.wu.s    t2, ft6, rtz
                  andi         s0, a1, -844
                  nop
                  fdiv.s       fs11, ft3, fs1
                  fcvt.w.s     s5, ft1, rtz
                  sra          a0, t0, s5
                  fmv.x.w      s0, ft9
                  and          a2, s2, s1
                  fmax.s       ft3, ft3, fs7
                  fle.s        t2, ft10, fa6
                  fclass.s     a5, ft6
                  xori         sp, sp, -457
                  xor          a6, s2, s11
                  sub          s4, a3, gp
                  slli         gp, t0, 15
                  remu         gp, s4, t3
                  slt          a7, ra, sp
                  sltiu        zero, s10, 941
                  fsgnjn.s     fa6, fa4, fa7
                  nop
                  xor          s6, s0, a6
                  fmv.w.x      fs5, a1
                  fmin.s       fa6, fs6, fs3
                  ori          tp, s10, 740
                  feq.s        a0, ft11, fa3
                  fmin.s       fs11, ft4, ft11
                  fsqrt.s      fs0, fs11
                  fmax.s       ft6, fs2, fs5
                  srli         zero, t6, 4
                  sra          s6, a3, a7
                  xor          zero, sp, t1
                  srl          a3, a3, t3
                  fsqrt.s      ft5, fa4, rne
                  lui          t4, 449411
                  mulh         s1, s7, s0
                  xor          s3, s8, t5
                  srli         a1, s2, 24
                  ori          s0, t4, 786
                  mulhsu       s3, a1, a5
                  fcvt.s.w     fs7, a5
                  and          s5, s5, ra
                  fsgnj.s      ft2, fs1, fs7
                  xori         s0, a0, 1072
                  add          s8, s6, s6
                  ori          s10, ra, -1386
                  srai         s8, t6, 30
                  fclass.s     t2, fs3
                  rem          s2, t3, a3
                  fsgnjn.s     ft11, ft9, ft4
                  add          sp, sp, t2
                  slti         s0, t1, -1845
                  lui          tp, 561460
                  fcvt.s.wu    fs9, s1, rdn
                  sub          t4, t6, s6
                  sra          t3, s5, s9
                  mulh         t1, a7, a6
                  sra          t2, s2, t6
                  fcvt.wu.s    a0, fa2, rne
                  srai         s8, tp, 1
                  fsqrt.s      fs10, ft7, rdn
                  fmv.w.x      ft4, t1
                  sltu         a0, a5, s7
                  slt          s3, s1, a0
                  or           a2, t1, s4
                  fmin.s       fa2, fs2, fa2
                  sll          a0, s3, s0
                  fsgnjn.s     fa0, fs5, fs9
                  slli         s0, a3, 17
                  srli         a0, s10, 4
                  sltu         s6, a3, tp
                  fsgnjn.s     fs10, fs4, fs5
                  mul          s6, t6, zero
                  fsgnjx.s     ft7, ft4, fa2
                  ori          ra, t3, 1550
                  divu         s1, s0, t3
                  srli         t1, a2, 10
                  divu         s6, t2, a5
                  xor          s3, tp, t4
                  fsub.s       ft0, ft1, ft7
                  sub          t3, s9, a5
                  sra          s5, t5, s9
                  srli         s11, s8, 0
                  ori          s1, s4, 1045
                  sltu         s5, t1, sp
                  fsgnjx.s     ft7, ft3, ft10
                  xor          t1, s10, s4
                  fle.s        a1, fs0, fa0
                  fsqrt.s      fa2, fs7
                  srai         s4, t1, 10
                  sltiu        s2, t1, -80
                  fcvt.s.wu    ft2, gp, rup
                  srai         t4, s1, 28
                  fsgnjx.s     fs5, ft8, fa5
                  fcvt.s.w     fs0, s8
                  fsgnjx.s     fa3, fs5, ft10
                  add          s11, a4, sp
                  remu         sp, sp, a4
                  slt          gp, s7, a5
                  fcvt.s.wu    fs4, ra
                  mul          s11, s1, ra
                  fcvt.s.wu    fa6, ra
                  slli         s9, a0, 12
                  mul          s0, s0, t3
                  rem          s11, s8, a0
                  sltiu        a2, t0, 71
                  nop
                  rem          a1, gp, a3
                  fclass.s     t1, fa2
                  addi         a6, s11, 991
                  andi         ra, s9, -1981
                  sltu         sp, s1, a4
                  feq.s        s8, fs6, ft2
                  or           ra, a1, s5
                  fcvt.s.w     fs1, a6
                  mul          t2, s9, s1
                  or           s7, a4, t5
                  fmax.s       ft6, fs8, ft4
                  fcvt.wu.s    s4, ft9
                  flt.s        s7, ft4, ft9
                  and          s3, t6, gp
                  fmv.w.x      ft3, a2
                  srli         a6, s6, 29
                  fcvt.w.s     t2, ft6, rmm
                  andi         a5, ra, 1255
                  andi         sp, s9, 1990
                  or           t3, s1, s4
                  fmin.s       fs10, fa1, fa2
                  remu         s3, s3, t3
                  auipc        s6, 394436
                  fsgnjx.s     fs0, fs10, fs4
                  fdiv.s       fs11, ft7, ft3, rtz
                  fclass.s     s6, ft9
                  fcvt.s.wu    fa0, s11, rne
                  xor          sp, a2, gp
                  fsgnjx.s     fa3, fs6, ft3
                  sltiu        t0, s9, 1981
                  fmax.s       ft1, ft3, fs6
                  fclass.s     t1, ft1
                  fcvt.w.s     gp, fa7, rne
                  mulhu        s1, ra, s9
                  mul          s4, s11, t6
                  mul          tp, s5, ra
                  fcvt.s.wu    fa7, s10, rmm
                  srl          s5, s5, a0
                  fcvt.w.s     s0, fa4
                  slt          a3, s9, s6
                  srl          s7, s7, s6
                  xori         s10, t4, 608
                  fmul.s       ft11, fs10, ft4, rdn
                  sll          s1, ra, s6
                  divu         a0, s9, s3
                  sltu         gp, gp, tp
                  fadd.s       fs4, fs8, fa5, rup
                  flt.s        t4, ft9, fa3
                  fdiv.s       ft9, fs10, fa5
                  flt.s        s4, fs4, fs7
                  fcvt.s.w     ft0, s9
                  fsgnjx.s     ft11, ft11, ft2
                  divu         s11, a0, t4
                  mul          s4, a6, sp
                  add          t4, s1, zero
                  sll          s9, s3, s10
                  add          a2, a5, t2
                  mulhsu       s7, zero, s11
                  sra          s10, t0, s9
                  fadd.s       ft11, fa7, fs5, rdn
                  fcvt.s.wu    ft4, a6, rup
                  flt.s        s2, ft7, fs1
                  nop
                  fmin.s       fs6, ft4, fs0
                  andi         zero, s8, 1609
                  fdiv.s       ft7, fa0, fs1
                  mul          s5, s2, s5
                  ori          ra, a1, 1355
                  rem          s1, t4, s11
                  srli         a3, zero, 10
                  fsgnj.s      ft7, ft5, fa1
                  srli         s5, a1, 21
                  sltu         a6, t1, tp
                  fcvt.w.s     a6, ft7, rdn
                  mul          a0, s9, a6
                  lui          s4, 237212
                  lui          a3, 601965
                  fcvt.s.wu    fs3, t0, rmm
                  nop
                  nop
                  srli         tp, s9, 18
                  or           s8, s9, a5
                  fmul.s       ft6, fa6, ft11, rdn
                  fsqrt.s      fs8, fs7, rtz
                  fmv.w.x      ft0, s5
                  and          s0, s1, s4
                  sltu         a0, s10, s6
                  srl          s3, s11, tp
                  slt          s7, s6, a2
                  slti         s4, s6, 1390
                  fsqrt.s      fs1, fs3, rdn
                  sll          s0, a4, s0
                  slti         t0, t4, 305
                  fsqrt.s      ft0, ft10, rdn
                  fmv.x.w      gp, ft9
                  sub          sp, s8, t6
                  or           s5, s3, s10
                  mulhu        zero, s2, sp
                  ori          s7, s4, -875
                  fcvt.s.w     fa3, a6
                  fle.s        a7, fa6, ft9
                  slti         s0, s9, 379
                  fsgnjn.s     fa3, fs1, ft6
                  fcvt.wu.s    s2, ft6
                  fmin.s       fs2, fs5, ft6
                  fdiv.s       fa3, ft7, ft2
                  nop
                  mulhu        s11, s5, s3
                  fsgnj.s      ft10, fa3, ft8
                  sra          a0, s10, s6
                  or           t2, s10, s9
                  mul          a3, a1, s11
                  srli         a2, t1, 31
                  remu         t3, tp, t6
                  fsub.s       fs9, fa6, fs2, rdn
                  or           a6, s2, t0
                  fsgnjx.s     fs7, fa5, fa0
                  sub          a6, a5, t3
                  sltu         s6, a1, tp
                  flt.s        s9, ft3, fa7
                  fsqrt.s      fs6, fs9
                  rem          s2, s7, a1
                  fcvt.wu.s    a7, ft1, rtz
                  fcvt.s.w     ft0, a0
                  sra          a1, t0, t2
                  sra          sp, s6, s5
                  fcvt.s.w     fs6, tp, rtz
                  fadd.s       ft7, ft4, fs7, rdn
                  fsqrt.s      fs1, ft6, rup
                  add          s4, tp, s2
                  fcvt.s.wu    ft0, s2, rup
                  ori          s11, gp, 1384
                  fsgnjx.s     fs6, ft2, fs10
                  nop
                  divu         t3, s3, s8
                  feq.s        s5, ft3, ft8
                  fdiv.s       fa1, fs5, fs9, rmm
                  div          a2, s1, s7
                  sra          s9, zero, a4
                  addi         zero, t2, -495
                  slti         s5, s3, 881
                  srai         gp, t2, 16
                  mul          gp, a3, t0
                  mulhu        t0, t5, a4
                  slt          a5, a0, s7
                  andi         s10, ra, 1717
                  fmax.s       fa0, ft1, ft2
                  auipc        gp, 505959
                  fadd.s       fs3, ft11, fs4, rtz
                  fmin.s       fs9, fs9, fs3
                  fmul.s       ft5, ft9, ft11, rtz
                  fmin.s       fa0, ft8, fs0
                  or           zero, s8, t5
                  ori          s9, a5, -1624
                  srl          s11, t1, ra
                  nop
                  sub          a2, s6, s4
                  or           s0, t1, s8
                  sltu         a1, s2, tp
                  add          t2, s7, t6
                  mulhsu       t4, s1, s0
                  divu         s9, a3, a7
                  fmul.s       ft10, fs0, fs0
                  fcvt.s.wu    fs8, a2, rmm
                  srli         s2, a7, 22
                  add          s9, gp, s3
                  srai         s1, a7, 6
                  mul          gp, t2, s11
                  fclass.s     s7, ft0
                  lui          a2, 414045
                  xori         s4, s5, -1263
                  fle.s        s11, ft7, fs1
                  fmv.w.x      ft5, tp
                  flt.s        gp, ft10, fs1
                  feq.s        s3, fs9, fs2
                  fmv.w.x      ft6, s2
                  fclass.s     a2, fa7
                  fmax.s       fa1, fa2, fs8
                  fle.s        s11, fs4, ft4
                  slli         t1, s1, 29
                  nop
                  or           s8, a2, t6
                  slti         s8, s7, -811
                  addi         sp, a2, 738
                  sub          s4, a5, s1
                  mulhsu       t3, s2, t4
                  sra          a2, sp, a2
                  fsqrt.s      ft5, fa1, rne
                  div          gp, a1, s10
                  rem          t4, a4, t1
                  auipc        s3, 809853
                  sltu         s6, a2, s6
                  xori         s11, a4, -1290
                  fmax.s       fa1, fs0, fa5
                  fclass.s     tp, fs11
                  slli         a0, s0, 25
                  fsub.s       fa4, fs5, fs6, rtz
                  srli         a3, t0, 18
                  feq.s        tp, ft2, fs2
                  fmv.w.x      fs10, s6
                  addi         a1, s1, 1770
                  rem          a1, t0, s3
                  fcvt.s.wu    fs1, a0, rne
                  fcvt.w.s     s0, fs8, rup
                  fcvt.w.s     s7, ft8, rup
                  mulh         s8, a2, s7
                  fcvt.wu.s    t1, fa1
                  mulhu        a2, a2, t2
                  sltu         a1, s10, gp
                  nop
                  fcvt.w.s     tp, fs7, rne
                  fcvt.s.w     fa0, s1
                  sll          s6, a2, t5
                  srai         s8, a2, 10
                  rem          t1, s2, s2
                  fsgnjx.s     ft11, fs8, fs2
                  ori          a1, s10, -284
                  or           sp, s10, s0
                  remu         s0, s0, s7
                  sltiu        s0, s9, 1793
                  mul          a0, s6, s4
                  fcvt.s.w     fa2, a0, rmm
                  add          tp, ra, s1
                  fcvt.wu.s    s1, ft10
                  fsgnj.s      fs8, fa0, fs3
                  feq.s        a5, fs0, fs4
                  add          a3, t2, t4
                  fsub.s       ft4, ft1, ft11, rtz
                  fmul.s       ft5, ft2, fs8
                  xori         s8, t5, -1402
                  sub          s5, a7, s11
                  sltu         a1, s11, zero
                  fsgnj.s      fs3, ft5, fs9
                  nop
                  ori          ra, t6, 458
                  fsgnjn.s     ft2, ft5, fs4
                  sltiu        t2, s5, 750
                  lui          a0, 993319
                  add          a5, s7, a0
                  divu         a6, s1, a3
                  rem          a2, s6, t2
                  and          t4, s4, gp
                  fle.s        t0, ft4, fs10
                  fmv.x.w      s3, ft3
                  fcvt.s.wu    fs6, zero
                  sll          a3, a1, t3
                  nop
                  xor          s11, ra, a2
                  sub          t0, t4, s1
                  ori          t0, a2, 1881
                  slt          s7, t5, s1
                  sltu         t0, t5, a4
                  fmv.x.w      a6, ft6
                  fmax.s       ft2, fa5, fs2
                  fsgnj.s      ft3, fa7, fs4
                  auipc        t2, 607935
                  add          a7, a7, a6
                  srai         ra, t0, 24
                  sltiu        sp, a1, 1766
                  mul          ra, s4, tp
                  fsgnjx.s     ft4, fs10, ft7
                  slt          a7, s8, s11
                  add          s8, zero, sp
                  sltiu        a7, s4, -1138
                  andi         s7, s11, 171
                  fcvt.s.wu    ft11, zero
                  auipc        s7, 18297
                  fsgnjx.s     ft6, fs6, fs8
                  srli         s1, a5, 2
                  andi         s9, a0, 1957
                  mulhsu       s9, tp, a7
                  fle.s        s9, fa4, fs7
                  ori          s4, gp, 1965
                  remu         ra, gp, s1
                  and          s8, s9, s10
                  fmv.x.w      s11, ft2
                  sra          a0, a3, s5
                  slt          a3, s7, a1
                  xori         a6, s3, -922
                  fclass.s     s7, ft7
                  lui          t0, 559311
                  mulhsu       sp, s10, a3
                  xor          t0, s2, a6
                  fmv.w.x      ft1, s0
                  slti         a3, gp, -891
                  remu         s5, t5, s5
                  sll          s3, a3, s4
                  fsub.s       ft0, fa7, ft4
                  mulh         ra, s8, a0
                  sltu         zero, t3, s6
                  srli         s1, a1, 11
                  fsub.s       ft9, fs1, fs4
                  feq.s        zero, fa1, fs0
                  fmv.w.x      fa6, a3
                  fsgnj.s      fs5, ft11, ft1
                  sra          a1, t6, t4
                  fsqrt.s      ft11, fa1
                  sltu         s4, t3, s7
                  fmax.s       fa3, fa0, ft2
                  sltu         zero, t5, gp
                  mul          zero, a4, a5
                  sltiu        a6, s5, 799
                  mulhu        s2, t3, t4
                  auipc        s9, 951272
                  flt.s        s1, fa5, ft5
                  slti         a2, a6, 1427
                  slli         t0, s9, 20
                  fcvt.w.s     ra, fa5
                  addi         t4, s11, -1614
                  fcvt.s.wu    ft1, s5
                  remu         s8, sp, a2
                  fmin.s       fs10, fs7, fs1
                  fsqrt.s      ft4, fs5, rtz
                  fcvt.w.s     s10, ft6
                  mulhu        s0, s10, a0
                  sra          t3, t4, zero
                  sll          a5, a5, s11
                  sltiu        ra, t6, -1273
                  fsgnjx.s     fa6, ft7, fs3
                  srai         s6, s0, 13
                  fsqrt.s      fs2, fs10
                  fadd.s       fs8, fs11, fs11
                  divu         t1, s0, zero
                  fcvt.wu.s    s3, fs7
                  fmin.s       fa0, fs1, fs10
                  fdiv.s       fs1, ft2, fs5
                  srl          s2, gp, zero
                  sltiu        s9, t4, -152
                  fcvt.wu.s    a0, ft7, rdn
                  rem          s7, s8, s11
                  fcvt.w.s     s9, ft0
                  fsgnj.s      fs11, ft10, ft4
                  mulhu        ra, tp, s7
                  srl          s0, s11, s4
                  remu         s6, a1, a3
                  and          s6, sp, s1
                  mulh         t4, s4, s4
                  slli         s0, s2, 4
                  fmv.w.x      fa1, t5
                  fcvt.wu.s    a5, fa2, rne
                  addi         a3, gp, -238
                  sra          s8, gp, s0
                  mulhsu       s7, s3, t5
                  fcvt.w.s     s8, ft4, rup
                  fcvt.wu.s    s0, fs9
                  fle.s        s0, ft5, fs0
                  srai         s7, s4, 21
                  or           ra, s7, s1
                  fmv.x.w      s5, ft4
                  rem          a3, sp, a0
                  mulhu        tp, a0, a7
                  xor          s10, a5, s5
                  remu         t1, t5, zero
                  fadd.s       fs4, ft1, fa3, rup
                  sra          zero, a7, s6
                  mul          s5, a4, t1
                  fmul.s       fs9, fs9, ft7
                  fcvt.wu.s    t3, fs8, rne
                  fsqrt.s      ft9, fs4, rmm
                  slli         s7, s10, 21
                  add          a2, s10, ra
                  divu         s6, a5, a5
                  fcvt.s.w     ft0, s4
                  fmax.s       fa2, fa1, fs2
                  fcvt.s.w     fs1, s3, rmm
                  feq.s        sp, fs3, ft2
                  or           s0, a5, s11
                  fle.s        t2, fa2, fa4
                  fsgnjx.s     ft1, ft4, fs9
                  mulhu        tp, s2, ra
                  or           a7, t2, s10
                  fsgnjn.s     fa7, ft4, fa2
                  slti         s0, zero, -2041
                  xor          s9, t0, a2
                  xor          t2, a4, t0
                  slti         s4, a1, 206
                  andi         gp, s6, -1843
                  fle.s        a0, fs10, fa1
                  divu         ra, t5, s9
                  sra          s4, s0, a0
                  fcvt.wu.s    tp, ft8
                  slli         t0, tp, 22
                  fcvt.s.w     fs1, t1
                  addi         a0, a2, -308
                  lui          a3, 695954
                  fmul.s       ft5, fs2, ft11
                  mulh         t4, t4, s9
                  mul          s3, s3, t6
                  fsqrt.s      fs10, fs10, rtz
                  fmin.s       fa1, fs9, ft9
                  divu         a5, t3, s7
                  mulhu        a5, sp, t0
                  slti         a1, gp, 1415
                  mulh         s1, tp, t6
                  xori         s7, a5, 927
                  mulh         s6, s9, s11
                  srai         s6, s10, 28
                  fcvt.s.wu    ft9, t5, rdn
                  srl          s8, tp, gp
                  fsub.s       fa7, fs5, fs8
                  fdiv.s       fs7, fa7, fa2, rtz
                  fcvt.wu.s    tp, fs6
                  or           t3, a7, a0
                  fdiv.s       fs4, fa7, fa6
                  flt.s        s7, ft0, fs11
                  sltiu        s9, s9, 1998
                  flt.s        tp, fa1, ft6
                  remu         s1, a0, s6
                  fle.s        tp, ft8, fs5
                  feq.s        t3, ft2, ft1
                  mulhsu       s5, a6, zero
                  div          s6, s11, a0
                  fclass.s     zero, fa7
                  slli         t4, t4, 29
                  fsgnjn.s     fs6, ft5, ft7
                  add          t2, a5, s0
                  fmax.s       ft7, fa7, ft3
                  srl          s9, s8, a7
                  and          t4, a6, s5
                  fmax.s       ft3, ft3, ft2
                  fdiv.s       ft1, ft0, fa3
                  xori         s8, t1, -1913
                  mulhsu       ra, a7, a5
                  remu         a7, ra, s1
                  srl          t2, s8, t2
                  fsgnjx.s     ft6, fa4, ft11
                  xor          s4, t2, a7
                  divu         t3, s11, tp
                  fmin.s       fs5, fa5, fs11
                  fcvt.s.wu    fa2, zero, rne
                  fmax.s       ft1, fa1, fs8
                  divu         s3, a1, s5
                  sltu         ra, s4, t2
                  fsgnjx.s     ft7, ft4, fs5
                  xor          a0, a4, a7
                  or           s10, t5, zero
                  fsgnjx.s     ft2, fs1, fs1
                  slti         s5, t6, 900
                  and          gp, s4, gp
                  auipc        t2, 667393
                  feq.s        s9, ft8, ft9
                  fcvt.s.wu    fa4, s6
                  andi         zero, t6, 207
                  sub          gp, s10, t2
                  fsgnjn.s     fs9, fs0, ft3
                  fadd.s       ft9, fs3, ft1
                  fcvt.s.wu    fs6, tp, rne
                  div          s9, s11, a5
                  slti         s4, s2, 1934
                  feq.s        a5, fa2, fs8
                  sltu         s9, s4, t4
                  srli         s0, t5, 0
                  sltiu        gp, a4, -1332
                  fmax.s       fs7, ft10, ft10
                  div          s1, a4, t2
                  srli         s2, s8, 25
                  mulh         s11, s1, tp
                  slli         sp, gp, 14
                  fsgnj.s      fs6, fs11, fs1
                  fcvt.s.w     fs0, s7
                  sra          t0, s2, s11
                  div          a2, a7, t2
                  slt          a5, a2, a7
                  sll          a6, t4, s11
                  fmax.s       fs4, ft10, fa2
                  srai         s9, t3, 20
                  fmv.x.w      s7, fs2
                  xor          t4, t4, s1
                  mulh         s1, t6, s10
                  mulhu        a1, t2, a7
                  mulhu        s0, a5, a0
                  ori          s5, t0, 886
                  fsqrt.s      ft6, fs4, rmm
                  andi         s3, s4, 1836
                  mulhu        s5, t1, t5
                  add          zero, t0, a7
                  flt.s        s9, ft4, ft5
                  sub          s8, s6, a1
                  fmv.x.w      a5, ft9
                  fsgnjx.s     ft7, fs3, fa2
                  fle.s        s0, fs8, fs3
                  fcvt.wu.s    s2, fa5, rne
                  sra          t3, a1, s9
                  fcvt.s.wu    fs2, a4
                  sll          s11, t6, a6
                  lui          a5, 199004
                  mul          s1, s5, sp
                  remu         s8, t5, s10
                  fsgnjn.s     ft3, ft6, fa3
                  fsub.s       fs9, fs8, ft1
                  or           s0, s8, zero
                  srli         s2, s9, 20
                  or           t4, t1, a2
                  xor          t4, t0, a1
                  srai         a2, a2, 19
                  sltiu        t2, t0, -1024
                  fle.s        zero, fs7, fa3
                  feq.s        a5, ft8, fs9
                  add          s11, gp, s1
                  ori          s2, s1, 1298
                  srli         zero, t1, 20
                  fcvt.wu.s    s7, ft1, rmm
                  sra          s7, s4, s9
                  xori         a0, t6, -1416
                  and          a3, tp, s8
                  fsqrt.s      fs8, ft5, rtz
                  fsgnjx.s     fa4, ft8, fs1
                  fdiv.s       ft3, fs5, fs8
                  fmin.s       ft5, ft3, ft2
                  sltiu        ra, gp, 727
                  div          s2, ra, s5
                  fcvt.s.wu    fa4, t1, rup
                  srl          s9, a3, a1
                  or           a3, s10, tp
                  and          t3, s3, s7
                  xori         t4, a2, 284
                  slt          ra, s4, s1
                  nop
                  and          t2, t2, s1
                  sltiu        sp, t5, -922
                  mulh         t1, gp, a3
                  fsgnj.s      fa4, fs0, ft2
                  fadd.s       fa0, ft1, fs4, rmm
                  fcvt.wu.s    tp, ft4, rne
                  rem          t3, s0, t1
                  sra          a6, s4, t4
                  mulhsu       t4, a5, s2
                  sltiu        a1, t4, -406
                  fsgnjn.s     ft5, ft0, fs1
                  slli         tp, t3, 22
                  fmax.s       ft0, fs4, fs11
                  fle.s        s6, ft1, ft7
                  mulhsu       a1, t0, a2
                  xori         a5, s3, -214
                  fsub.s       fs9, ft1, ft3
                  fsqrt.s      fs9, fa0, rtz
                  flt.s        s9, ft1, fa3
                  sltiu        ra, ra, -694
                  fclass.s     s5, fa2
                  fle.s        t1, fs10, fs0
                  fsgnjx.s     ft2, fa2, fa6
                  mul          t3, tp, s7
                  rem          s9, s6, s9
                  fcvt.s.w     ft2, t2
                  fcvt.wu.s    s8, fs6, rup
                  flt.s        s11, ft0, ft1
                  sll          gp, s3, tp
                  srai         s4, s4, 19
                  or           s7, s5, sp
                  slli         t1, t5, 13
                  srai         a3, sp, 30
                  srl          a3, ra, ra
                  srli         tp, s10, 28
                  feq.s        s4, ft5, fs4
                  fadd.s       fa4, fa3, fa4, rmm
                  fcvt.w.s     s6, ft8, rup
                  sra          s8, a7, t5
                  fsgnjn.s     fs8, ft11, fa7
                  fsgnjx.s     fa4, fs2, fs9
                  fcvt.w.s     s10, fs0, rtz
                  feq.s        s3, ft10, fs11
                  fsub.s       ft5, fa3, ft2, rmm
                  nop
                  feq.s        t1, fs8, fa7
                  fmin.s       fs3, fs5, fs1
                  sra          t3, s10, s1
                  fcvt.w.s     t3, ft3
                  slli         a0, a2, 25
                  fsgnj.s      ft2, fa5, fs9
                  auipc        s3, 895021
                  fle.s        a5, fs6, fs10
                  flt.s        sp, ft6, ft11
                  sub          t1, t6, zero
                  rem          s4, gp, s8
                  feq.s        t4, fa7, fs0
                  fsub.s       ft1, ft4, fs9
                  mul          a1, a6, t3
                  srl          s4, a5, a3
                  remu         sp, s8, t2
                  fcvt.wu.s    s0, ft1
                  fclass.s     t4, fs1
                  fle.s        a5, fs4, ft4
                  andi         s0, tp, 1220
                  fsqrt.s      fa7, ft5, rup
                  fle.s        s9, fs1, fs2
                  div          tp, tp, a0
                  and          a2, a1, a4
                  lui          s1, 171175
                  fsgnjx.s     fs6, fa7, fs10
                  sltu         s5, s11, s10
                  auipc        a1, 330120
                  ori          ra, s7, 425
                  fle.s        a0, ft5, fa1
                  feq.s        s8, ft11, fa0
                  addi         s2, a5, -1269
                  fcvt.w.s     s6, ft8
                  rem          s9, a6, s1
                  sub          a2, t1, s2
                  fmv.x.w      s9, fs9
                  srl          a1, tp, a6
                  lui          t1, 95201
                  slt          a3, s3, s7
                  fmin.s       fs4, fa6, ft5
                  fle.s        a6, ft11, ft2
                  rem          s8, a4, t3
                  fmv.x.w      s8, fs8
                  mulhu        sp, a0, s0
                  sltu         a7, s3, a7
                  fcvt.s.wu    fs5, t6, rtz
                  fmv.w.x      fs5, a7
                  feq.s        t0, fa4, ft3
                  sltiu        t0, a3, 1471
                  fsub.s       fa1, fs0, ft10
                  or           s5, s6, t5
                  sltu         s4, s6, ra
                  fmax.s       fs7, ft5, ft6
                  mulhu        s6, a6, t0
                  mulhsu       a3, t6, t6
                  andi         gp, a3, 544
                  ori          t1, s0, 1873
                  sltiu        s0, a5, -1961
                  fmin.s       fs7, ft3, fs8
                  sll          t0, s8, a0
                  add          t0, s6, t2
                  mulh         sp, a1, a7
                  or           s1, t5, a7
                  fcvt.s.wu    fs9, a2, rtz
                  fle.s        t3, fa0, ft1
                  fle.s        t3, fs8, fs2
                  sll          s10, t0, a1
                  srli         a5, s10, 8
                  auipc        s11, 961323
                  fclass.s     s4, fa1
                  sltu         s0, a6, gp
                  sltiu        s3, s6, 664
                  fcvt.s.wu    fs4, a5
                  fdiv.s       ft10, fa3, fs6
                  remu         a6, t6, t5
                  mul          a6, s2, gp
                  fmv.w.x      fs8, a6
                  auipc        s8, 871938
                  slli         t1, t6, 17
                  fmul.s       fs8, ft5, fa3, rmm
                  fmul.s       fs0, ft4, ft5, rtz
                  fmin.s       fa5, ft5, fa4
                  fsub.s       fs9, ft7, fs1, rdn
                  fmax.s       ft5, ft1, ft0
                  divu         s5, s5, s3
                  fmax.s       ft5, ft10, fa7
                  fcvt.s.w     fs0, s2
                  xori         s0, s2, -1505
                  fcvt.w.s     a7, fa1, rne
                  srl          s4, s0, t4
                  fmax.s       fs5, fs2, ft0
                  xor          t4, s0, s11
                  lui          sp, 823316
                  slt          s5, s10, s1
                  sra          s0, s3, t0
                  srai         t2, t5, 18
                  auipc        s11, 767595
                  nop
                  fcvt.w.s     a2, fs6
                  fadd.s       fs8, ft11, ft8
                  fclass.s     s11, fs8
                  fsgnj.s      fa7, fs5, ft1
                  fcvt.s.wu    fa4, s7, rtz
                  rem          t2, a0, s11
                  remu         t0, a7, s3
                  fcvt.wu.s    a1, fs2, rdn
                  fsgnjx.s     fa3, fa5, fs1
                  srai         s6, t3, 3
                  slt          t1, s11, t6
                  fcvt.s.wu    fa6, s2, rup
                  ori          ra, tp, 1778
                  fmv.x.w      a3, ft0
                  fmin.s       ft0, fs6, fs2
                  flt.s        sp, ft8, ft10
                  fmv.w.x      fs3, s4
                  sltu         s10, a1, t6
                  fmin.s       ft11, fa3, fs3
                  sub          t0, t0, t2
                  sltiu        s4, a6, -1114
                  feq.s        sp, fs10, fs11
                  fmin.s       ft6, ft10, fs3
                  add          s2, s5, s11
                  auipc        a0, 696438
                  flt.s        a2, fa7, fs5
                  mulhsu       a1, t1, s5
                  fmul.s       ft1, fs7, ft8, rmm
                  fmul.s       fa1, fa5, fs9, rdn
                  fmv.x.w      s5, ft8
                  div          t1, t2, s6
                  fmv.x.w      s8, ft11
                  auipc        s1, 15499
                  srli         tp, t3, 31
                  fmv.x.w      s5, fs9
                  fcvt.s.w     fa5, a5, rtz
                  fsgnj.s      fs6, fs0, fs0
                  fsqrt.s      fa7, ft0, rdn
                  xor          s4, a7, s5
                  xor          zero, t2, t0
                  sltu         s9, s7, s7
                  sub          a3, a7, s9
                  sub          a7, s5, a3
                  sltiu        s6, t2, -19
                  fsgnj.s      fs5, fa0, ft1
                  fcvt.w.s     a1, ft0, rtz
                  mul          s8, t1, s2
                  mulhu        t3, t2, a3
                  mulhsu       s2, t2, t3
                  rem          t3, s11, a4
                  slli         s11, sp, 5
                  slli         t4, gp, 1
                  fmax.s       fa7, fa3, fs5
                  fadd.s       ft11, fs11, fs10, rup
                  mulhu        t1, s4, sp
                  lui          zero, 717399
                  fle.s        s5, fa2, ft0
                  lui          a7, 500678
                  andi         a2, a0, 1479
                  mulhu        a2, a3, s10
                  slt          a5, s11, t2
                  rem          ra, s2, s1
                  divu         a7, t4, s11
                  fmax.s       fs8, fa6, fs8
                  rem          s9, s3, a0
                  sub          s9, a5, s6
                  fmv.w.x      fs6, t3
                  fle.s        t1, ft8, ft6
                  sltu         s7, a7, s0
                  xor          a5, s2, a0
                  divu         a2, zero, s3
                  sltu         s10, t3, s3
                  slt          s9, a5, ra
                  fmv.w.x      ft6, a2
                  sra          sp, a5, s9
                  auipc        s4, 759333
                  fle.s        s1, fs11, ft2
                  sltiu        s11, a1, 1248
                  srl          s11, s1, s2
                  fmul.s       ft0, fs1, fs7, rne
                  sll          t0, t6, t1
                  fsgnjx.s     ft3, fa7, fs2
                  xor          s1, s4, tp
                  and          a2, s2, a6
                  fmul.s       fs9, fs11, ft2, rup
                  xori         t4, a2, -1294
                  fmin.s       fa1, fa3, fs6
                  fsgnjx.s     fa0, ft1, ft6
                  addi         s8, t5, -1720
                  fsgnjn.s     fa1, ft3, fa0
                  lui          t1, 450660
                  fle.s        t1, fa7, ft6
                  slt          s2, a1, s5
                  fsgnjx.s     fa2, fa2, fs7
                  srl          s6, t0, s6
                  slli         gp, ra, 28
                  slt          a1, s5, s3
                  div          t1, s6, a6
                  mulh         a0, t1, gp
                  fmax.s       ft3, fa4, fs8
                  sltiu        a1, a7, 1598
                  fcvt.w.s     t2, ft8
                  sub          a5, tp, s5
                  fsgnj.s      fa7, fs10, ft8
                  mulhsu       a0, s11, s2
                  fsgnjx.s     ft4, ft5, ft2
                  fsub.s       fs10, ft3, fa0, rne
                  fcvt.wu.s    a6, fs1
                  fcvt.wu.s    s6, ft10, rdn
                  rem          s3, a2, s3
                  xor          s1, a5, s4
                  add          a5, s3, t4
                  mulhu        ra, s8, gp
                  or           s11, s5, tp
                  fmv.x.w      a2, fs2
                  auipc        s11, 282810
                  or           s2, a4, s1
                  srli         s7, ra, 18
                  flt.s        s2, fa1, fs1
                  ori          t1, a4, 538
                  mul          sp, t4, zero
                  slli         sp, s1, 5
                  srai         a5, t5, 11
                  addi         a2, t6, -1059
                  sll          s4, t6, s10
                  fmin.s       fa1, fa5, fs1
                  fdiv.s       ft3, fa2, fs3
                  sltiu        t1, t6, -1976
                  fmin.s       fa2, fs5, ft4
                  mulhu        t0, a7, s9
                  mulh         s0, t4, a5
                  rem          a2, a2, s6
                  srl          ra, s4, s10
                  flt.s        s3, ft4, fa4
                  fcvt.s.w     ft10, s2, rtz
                  remu         s6, tp, s0
                  feq.s        a3, fa5, fs2
                  rem          tp, t3, s2
                  mul          s11, t4, s8
                  lui          a2, 499680
                  fmv.w.x      ft10, a6
                  andi         t2, s6, -978
                  fmv.w.x      fs1, s11
                  fcvt.wu.s    s0, ft4, rup
                  fclass.s     a1, ft10
                  flt.s        a5, ft6, fs10
                  sra          a0, zero, s8
                  fsgnj.s      ft2, ft6, fs11
                  fcvt.s.wu    fa0, t2, rdn
                  slli         s8, s2, 11
                  sltiu        zero, s5, -1912
                  mul          a2, s1, zero
                  ori          s9, a5, 1054
                  srli         s10, s6, 6
                  slli         t4, t1, 12
                  fmv.x.w      s4, fa7
                  sltiu        s9, gp, 1682
                  sll          t0, gp, t1
                  addi         a2, a1, 1139
                  sltu         t2, t3, sp
                  lui          a1, 914559
                  fmv.x.w      s1, ft10
                  feq.s        a1, ft6, fa3
                  div          ra, zero, s8
                  mulh         a3, t5, s2
                  srai         t4, s5, 21
                  fcvt.s.wu    ft2, tp
                  fadd.s       fs9, ft8, fs11, rtz
                  fcvt.s.w     fa3, t3
                  fcvt.s.wu    fa1, s5, rtz
                  fmin.s       fa2, fs6, ft5
                  fmax.s       ft1, fs3, ft6
                  sll          a3, s9, tp
                  fsub.s       fa3, ft8, ft10
                  xori         s3, a0, 1126
                  add          s2, t4, a0
                  fadd.s       fs3, fs6, fa4, rtz
                  slt          gp, s2, s6
                  fmv.w.x      fa7, s9
                  fsqrt.s      fs7, ft3
                  div          s7, t4, a5
                  fsqrt.s      fs9, fs7, rne
                  fadd.s       fs2, fs6, ft10, rup
                  or           s8, t0, gp
                  sub          a1, s0, s10
                  srai         a5, t3, 31
                  fcvt.s.w     fa7, a2, rmm
                  sll          zero, s3, a5
                  srai         s0, s3, 26
                  lui          a0, 804415
                  divu         s10, a1, a4
                  fmv.w.x      fs7, a0
                  fmax.s       fs7, fa1, ft4
                  fsub.s       ft1, fa3, fs3
                  add          s5, gp, gp
                  flt.s        zero, ft4, fs9
                  auipc        s11, 726887
                  fmv.x.w      gp, fa1
                  slti         s6, t0, -2027
                  mulhu        a0, a1, sp
                  auipc        t4, 13594
                  fsgnjn.s     fs5, fs1, fs7
                  sll          s11, t0, a0
                  fsub.s       fa3, fs3, fs5, rmm
                  fsub.s       ft3, fs10, ft7, rup
                  div          t1, t4, s7
                  srli         gp, s9, 9
                  div          s2, a7, s3
                  add          a3, a6, s4
                  ori          a5, t0, -912
                  fsub.s       ft3, ft4, ft1, rdn
                  flt.s        s3, fs9, fa2
                  add          s5, s8, s9
                  sra          t4, t1, s4
                  sub          a3, s5, a1
                  slli         s6, t4, 31
                  flt.s        s2, ft7, fs3
                  srai         s8, t4, 1
                  srli         s5, t0, 29
                  xor          a0, t3, s3
                  add          a2, t6, s11
                  mulhu        ra, s8, t0
                  andi         gp, zero, -1076
                  fsqrt.s      fs7, fs2
                  slli         a5, s9, 23
                  xor          a6, s8, s9
                  fsgnj.s      fs3, ft5, ft9
                  mulhsu       s9, t4, t3
                  mulhu        t1, s0, s6
                  fle.s        s11, fa5, fs10
                  fsgnjn.s     fs10, fa2, fs5
                  andi         s6, t1, 821
                  sll          sp, t5, s5
                  fmax.s       ft5, fa7, ft5
                  srl          s8, s2, t0
                  fsub.s       fs10, fa5, ft7, rup
                  sub          s11, s7, ra
                  add          t4, a3, a4
                  add          a0, a5, a2
                  fmin.s       fs8, fs3, ft11
                  slli         a1, a3, 30
                  sra          s11, s10, gp
                  fcvt.s.w     ft8, s2, rmm
                  sltiu        a2, t3, -907
                  div          s8, ra, t6
                  auipc        a1, 558653
                  srai         s5, gp, 16
                  slt          t3, t6, s10
                  mulhsu       t1, s6, a5
                  nop
                  fdiv.s       fa6, fs0, fa5, rdn
                  nop
                  fcvt.s.w     fs2, t3
                  fle.s        s6, fa3, fa3
                  mulhsu       s9, a4, ra
                  mul          a1, t3, a5
                  fcvt.w.s     t0, ft5
                  fsgnjn.s     fs7, ft1, fs8
                  srai         t0, s0, 14
                  fsgnjx.s     fs7, fa1, ft1
                  remu         s7, t3, a5
                  sltu         t3, ra, t4
                  fsgnj.s      fs11, fa6, ft11
                  fsgnj.s      fa7, ft7, ft7
                  fmax.s       ft6, fa6, ft11
                  sltu         s11, a7, s5
                  divu         s2, t1, s2
                  remu         s7, s7, s11
                  fsub.s       ft5, fa2, fa4
                  nop
                  fmax.s       ft9, fa6, ft1
                  sra          s10, s10, t5
                  fmin.s       fa3, fa7, ft3
                  fmul.s       fa5, fs7, ft8
                  rem          s7, t4, s5
                  fsub.s       fa5, ft10, ft4
                  mulhsu       t0, s10, s8
                  or           tp, t1, ra
                  lui          s7, 595374
                  sll          s3, s0, s5
                  slt          t0, a1, zero
                  lui          t0, 214235
                  fmin.s       ft2, fs7, fa2
                  lui          s11, 875241
                  srai         s10, s9, 15
                  sll          a2, t0, s3
                  fclass.s     t2, fa4
                  feq.s        tp, ft7, fs10
                  ori          t3, s6, 176
                  srai         tp, a0, 12
                  mulh         t0, s6, s3
                  fle.s        s0, fs6, fs8
                  fcvt.s.w     fa3, t0
                  div          a1, a0, s4
                  fsub.s       fs9, fa2, fs11, rup
                  sltiu        t3, t5, 816
                  fsgnj.s      fa1, ft4, ft4
                  mulhsu       s3, s1, a2
                  and          a6, s10, t1
                  fmin.s       fa2, ft9, ft7
                  sltu         s3, sp, a4
                  srl          a1, a0, t1
                  fadd.s       fa0, fa5, fs8, rdn
                  andi         s10, t0, -809
                  sltu         t1, a7, a4
                  fcvt.s.wu    fa5, s5
                  sra          s3, s3, a2
                  fle.s        s1, fa3, ft1
                  sub          s5, s2, a0
                  slti         t0, a7, 701
                  fmv.w.x      fs9, a6
                  remu         t3, sp, s5
                  fcvt.wu.s    a3, ft4
                  slt          s2, s10, s8
                  feq.s        t1, ft2, ft11
                  sll          a3, a0, s2
                  fsqrt.s      ft5, ft8
                  sra          t2, s10, a0
                  divu         s1, s0, s10
                  sltiu        s0, s5, -1637
                  sltu         s9, ra, a0
                  slli         t1, s9, 27
                  xori         s7, t6, -1847
                  fsgnjx.s     ft2, ft10, fs7
                  mulhu        ra, s4, s1
                  feq.s        t2, fs2, ft4
                  sltiu        s9, tp, -1047
                  mulhsu       a1, a6, a3
                  and          gp, s3, a7
                  fsub.s       ft11, ft8, ft3
                  fcvt.s.wu    ft3, s8, rmm
                  srl          a7, t6, a2
                  addi         a5, a2, 1025
                  addi         s8, t0, 1333
                  nop
                  fcvt.s.w     fa3, t6, rne
                  fdiv.s       ft5, fs5, fa0, rmm
                  fadd.s       ft1, fa5, fs8
                  fcvt.wu.s    s7, ft9
                  fsub.s       fa7, fs6, fa2
                  fclass.s     s2, ft5
                  divu         ra, a3, s6
                  fadd.s       fs0, fs4, fa3
                  fcvt.w.s     s7, ft6
                  sll          s7, t3, a5
                  divu         tp, s4, t0
                  xori         zero, a7, 324
                  add          s5, s3, a0
                  sra          a0, s7, t0
                  div          s5, a2, s5
                  fclass.s     s4, fs11
                  fsqrt.s      fs2, fa0
                  fsqrt.s      fs2, fs3
                  mul          s1, a5, s8
                  xor          s4, s10, s4
                  fadd.s       fs6, ft9, fs9, rtz
                  sltu         ra, s2, ra
                  flt.s        s4, ft1, ft11
                  slt          s5, s4, s5
                  feq.s        a0, fs4, fa6
                  or           a7, a5, s9
                  fsgnjn.s     fa5, ft2, ft10
                  srl          s10, s5, a1
                  fcvt.s.w     fs1, t4
                  fsgnjx.s     ft9, fa1, fs5
                  slti         s1, s6, 533
                  xor          s8, s4, a3
                  andi         ra, s8, -1062
                  fsgnj.s      fs3, fs3, ft2
                  sltiu        s6, t0, 1600
                  fmul.s       ft0, fs2, ft8, rdn
                  fmul.s       ft9, fa3, ft3
                  fmv.x.w      t4, ft7
                  mulhu        s0, s3, gp
                  fcvt.s.w     fs4, zero
                  fsqrt.s      fs5, fa4
                  andi         s3, s4, 1497
                  fdiv.s       ft5, fs3, ft4, rmm
                  addi         s3, s7, -1334
                  fmv.x.w      t1, ft7
                  fsqrt.s      fa2, ft9, rdn
                  slt          s10, s11, a5
                  ori          t3, t3, -739
                  fmin.s       ft6, fs4, ft6
                  sltu         t0, a3, t5
                  andi         s2, s4, -1371
                  slt          s7, s11, t6
                  fsgnjn.s     fs8, fs1, fa5
                  fmin.s       ft0, fa4, fs6
                  srai         s2, tp, 17
                  or           t0, a2, a7
                  addi         tp, zero, -761
                  addi         gp, ra, -143
                  fsgnj.s      fa4, fa0, ft7
                  srli         t1, ra, 14
                  fclass.s     zero, ft8
                  sll          a5, s9, s3
                  xori         s5, tp, 1085
                  flt.s        s3, ft7, ft10
                  auipc        s7, 577611
                  mul          s0, s4, ra
                  srli         t1, a6, 6
                  sltu         t0, s2, t4
                  lui          t3, 37929
                  fmin.s       ft6, fs3, fs4
                  sltu         a1, t3, s9
                  fmin.s       ft11, ft2, fs0
                  fcvt.s.w     fa1, sp
                  fclass.s     a5, fs9
                  fcvt.s.wu    ft10, s1, rne
                  fcvt.s.wu    fs1, t6, rmm
                  srli         a3, s1, 24
                  fsub.s       fa3, fa0, ft7, rup
                  auipc        s8, 558337
                  divu         gp, a1, s1
                  divu         a0, t1, t1
                  andi         a1, s10, 1232
                  remu         a0, t4, tp
                  fcvt.s.w     ft6, s5
                  sltiu        a0, t5, 602
                  fclass.s     t0, ft9
                  fmin.s       fs8, fa1, fs0
                  rem          zero, a7, s11
                  srl          s5, gp, sp
                  fdiv.s       fa6, fa5, fs3, rmm
                  fmax.s       ft5, fa3, ft2
                  auipc        s0, 368380
                  mulhu        zero, t3, s9
                  flt.s        t3, ft5, fs8
                  andi         t3, s0, 1429
                  flt.s        s8, fs2, fa7
                  fcvt.w.s     s9, ft3
                  fdiv.s       fs0, fs8, fs8
                  fmul.s       ft3, fa1, fs2, rmm
                  or           sp, a2, t4
                  sra          a7, s1, s0
                  sub          t1, a1, t1
                  auipc        a1, 769507
                  slti         tp, s3, -297
                  feq.s        a7, fs9, fs8
                  fsub.s       fs4, fa2, ft9, rtz
                  fdiv.s       fa3, fs0, fs4, rup
                  fcvt.s.wu    fs11, t0, rdn
                  mulhu        s10, s3, gp
                  or           gp, s8, ra
                  add          ra, t1, s10
                  addi         s7, a2, 1748
                  sltu         s9, t3, t0
                  or           gp, s10, t0
                  fdiv.s       ft11, fs8, fs9
                  fle.s        a2, fs11, ft1
                  fcvt.w.s     s7, ft9
                  fsgnjn.s     ft10, ft8, ft9
                  fmv.x.w      t0, ft4
                  fmv.x.w      s2, fs3
                  flt.s        a6, fa3, fa4
                  fsgnjx.s     ft3, fs11, fs1
                  addi         t0, a6, -1923
                  auipc        s0, 130405
                  ori          ra, s9, -733
                  fclass.s     s4, fa5
                  fclass.s     a1, fa7
                  add          zero, t2, s8
                  and          s0, s11, s8
                  xor          t1, a4, a5
                  fsgnjx.s     fs2, fs5, ft4
                  mulhu        a1, s11, s9
                  fcvt.s.w     fs5, s9
                  fdiv.s       fs8, fs5, fa7, rdn
                  fle.s        a6, ft6, ft1
                  ori          tp, s1, 708
                  slli         a6, a5, 14
                  mul          tp, s3, tp
                  nop
                  slli         s7, a7, 29
                  slli         a1, zero, 28
                  sub          a6, t4, ra
                  sll          s7, ra, tp
                  fmv.w.x      ft5, ra
                  mul          tp, s1, a7
                  fcvt.s.w     fa7, a2, rdn
                  slti         gp, s6, 222
                  mulhu        s3, s9, s0
                  fmul.s       fs5, fa7, fa3
                  srai         s1, s2, 12
                  fle.s        a3, fa2, fa3
                  sll          s9, t0, a4
                  slli         a1, s5, 10
                  slli         a3, a0, 29
                  mulhu        t0, t0, s2
                  fcvt.s.wu    ft0, gp
                  fle.s        gp, fa1, fs3
                  or           a0, t1, a3
                  xor          t4, a0, s9
                  fadd.s       fs11, fa0, ft2, rne
                  xori         t0, s1, 221
                  remu         s9, ra, s4
                  fdiv.s       fs8, fs3, ft3, rtz
                  mulhsu       a3, a0, a3
                  add          s3, t4, a1
                  fle.s        s1, fs0, fs2
                  fle.s        s4, fs7, ft0
                  div          s3, a3, tp
                  feq.s        a6, fa7, ft4
                  fmv.w.x      fs5, ra
                  add          a7, s2, gp
                  sltiu        tp, t6, 362
                  lui          t2, 413322
                  fsgnjn.s     fs6, ft10, fa7
                  nop
                  fmv.w.x      fs10, a2
                  fmin.s       fa6, fs9, fa4
                  fclass.s     a0, ft4
                  div          s10, s9, s3
                  slli         t2, ra, 31
                  fsgnjx.s     ft10, fs1, fs5
                  srai         s6, t2, 22
                  and          sp, t5, s11
                  fsqrt.s      ft1, ft3
                  and          s6, t3, t5
                  fmv.w.x      fs0, t5
                  mulhsu       sp, t6, a5
                  fsgnjn.s     ft4, fa6, ft8
                  xor          s6, t4, tp
                  fcvt.wu.s    tp, fs11
                  addi         s7, zero, 1174
                  addi         s9, s4, 600
                  fle.s        s10, fs8, ft8
                  mulhu        s6, s11, s8
                  fdiv.s       ft9, fa4, fa7
                  rem          s9, a0, sp
                  mul          s3, tp, s1
                  nop
                  rem          s8, sp, t5
                  mulh         a6, s2, s5
                  srli         a1, a0, 2
                  remu         t0, s0, t2
                  rem          tp, t1, ra
                  lui          gp, 649755
                  ori          ra, s5, -1978
                  fcvt.w.s     s0, fa4, rne
                  sll          s7, t6, s0
                  mulh         s6, a7, s2
                  auipc        s6, 302885
                  fsgnj.s      fs7, fs9, fs8
                  fadd.s       ft3, fa7, ft11, rdn
                  fsqrt.s      ft5, fs4
                  xori         a0, t1, -1355
                  fsgnj.s      ft6, fs5, ft5
                  fcvt.w.s     t0, fs1
                  xor          a2, gp, a2
                  auipc        a1, 117749
                  fsgnjx.s     ft3, fs10, fs5
                  xori         s7, t4, 1312
                  addi         t2, t4, -2006
                  lui          s5, 97503
                  xor          s0, a5, a1
                  mulh         s10, s8, ra
                  fadd.s       ft6, fa0, fa0
                  auipc        ra, 296847
                  slti         a2, a5, -36
                  add          s8, a2, t5
                  fmv.x.w      t4, ft4
                  fsqrt.s      fa7, fa3
                  mul          s0, s0, s7
                  srli         s11, s7, 30
                  fmin.s       fs1, fs11, ft1
                  fmul.s       ft0, fs5, ft1
                  fdiv.s       ft1, fa5, ft0, rdn
                  fmin.s       fa6, fa0, fa3
                  fdiv.s       ft5, fs1, ft0
                  mulhu        s7, s8, s7
                  slt          sp, sp, a6
                  fmul.s       ft6, fa1, fa3
                  div          s1, t1, a3
                  fmv.w.x      ft4, a4
                  sra          a5, t0, zero
                  and          a1, s6, a5
                  srl          a6, ra, a1
                  fcvt.w.s     s6, fa0, rtz
                  flt.s        s8, ft8, ft11
                  srai         a1, s2, 23
                  sll          s3, t0, a0
                  nop
                  mulhu        s0, t4, t3
                  ori          s0, a5, 1413
                  slt          s8, a4, a0
                  lui          s3, 281660
                  divu         s10, s10, a2
                  slt          s1, s7, s8
                  mulhu        gp, a1, a3
                  nop
                  fmv.w.x      fs7, s7
                  fadd.s       fa2, ft1, fa1
                  ori          ra, gp, 1506
                  fsqrt.s      ft3, fa4
                  sra          zero, a4, t2
                  fcvt.s.wu    ft3, tp
                  mulh         s3, s3, s11
                  fmv.x.w      s11, fs8
                  fadd.s       fs2, fa2, fs4, rtz
                  fdiv.s       fs8, ft0, fa7, rup
                  fcvt.wu.s    a0, fs3
                  slt          s10, a7, ra
                  rem          a2, s7, s1
                  mulh         s5, gp, s8
                  srai         s9, t6, 31
                  fcvt.wu.s    a5, fa1, rup
                  xor          s9, ra, s0
                  fmv.w.x      ft7, ra
                  xori         sp, a3, 1435
                  remu         zero, gp, a6
                  mul          zero, a5, t3
                  divu         s3, gp, a5
                  feq.s        t1, fa5, fs5
                  xor          t2, tp, a0
                  sub          s0, gp, s7
                  slli         a7, a1, 18
                  fcvt.s.w     fs10, s1
                  xori         t0, a1, -955
                  sra          t1, s4, a7
                  mul          a5, t0, s5
                  flt.s        zero, ft5, fa5
                  fsgnjx.s     fs11, ft2, fa2
                  fsgnj.s      fa1, ft2, fa0
                  remu         s9, s10, a3
                  fdiv.s       fs6, fa6, fa3
                  feq.s        a0, fs1, fs10
                  slt          a6, s2, t5
                  sra          a6, t1, s7
                  fcvt.s.w     fa4, s3, rtz
                  fcvt.w.s     s4, ft0
                  fsgnjn.s     ft1, fs0, fa1
                  mulhsu       t3, s8, s3
                  addi         zero, a0, 6
                  sltiu        s10, s3, 898
                  fadd.s       fs8, fa4, fa5
                  rem          s10, ra, s9
                  fsgnjx.s     fa7, fs4, fa0
                  feq.s        a5, ft7, fs2
                  divu         s3, s5, s5
                  flt.s        a3, fa3, ft5
                  fcvt.s.wu    fs11, a2, rtz
                  fsqrt.s      fa7, fa3
                  add          ra, t0, s4
                  fsgnj.s      ft6, fs3, fs10
                  slt          t3, t0, t0
                  sra          a7, a6, s2
                  flt.s        a1, fs10, ft7
                  mul          s4, s11, a0
                  fmv.w.x      fs8, a4
                  fdiv.s       fa7, ft2, fs6, rup
                  fmv.w.x      fa3, t0
                  auipc        sp, 1022199
                  divu         a1, a6, t4
                  and          s11, a1, a6
                  mulhu        s5, s7, t3
                  fle.s        t4, ft0, fa3
                  addi         zero, s11, -1686
                  xori         t0, sp, -1607
                  addi         s0, t1, -1610
                  div          a1, t3, s9
                  sltu         a2, s3, a5
                  and          s1, s2, s3
                  srai         a5, a6, 26
                  nop
                  fsgnj.s      fa4, fs3, fs8
                  mulhsu       s11, ra, a7
                  andi         s4, s9, -1138
                  slti         a0, a5, -1311
                  slli         a3, s5, 17
                  slti         a1, s5, 1059
                  fsgnj.s      ft3, ft9, ft2
                  slti         sp, a1, -1947
                  feq.s        s0, ft6, ft10
                  fdiv.s       fa4, ft2, fa3
                  and          s11, a3, s6
                  xor          t4, s4, s7
                  fmax.s       ft8, fa0, fs7
                  mulhu        t1, a5, sp
                  and          t2, a5, ra
                  fadd.s       ft4, fs2, ft5
                  fclass.s     t2, fa7
                  divu         a3, s8, a2
                  ori          s7, tp, -1855
                  add          s2, t2, a1
                  lui          gp, 136280
                  fle.s        ra, fs5, fs1
                  sra          a7, tp, s4
                  slli         s4, s4, 31
                  slli         a3, a4, 16
                  srl          tp, a6, s1
                  sll          a7, s8, s0
                  or           tp, a7, a3
                  xori         s2, sp, -1162
                  sub          t0, s3, zero
                  fmin.s       fa4, ft0, fs8
                  fadd.s       ft10, ft9, fa6
                  nop
                  xor          s4, s5, a0
                  rem          s9, a0, t0
                  mulhsu       sp, a2, t2
                  srl          a5, a5, s3
                  ori          s8, t3, 1828
                  rem          s5, a6, s7
                  nop
                  slli         s4, s11, 6
                  andi         s8, t1, 776
                  fcvt.w.s     t0, fs11
                  addi         s11, s10, -628
                  lui          a0, 980336
                  fmv.x.w      s2, fs7
                  rem          tp, s0, s7
                  div          zero, t5, t6
                  fsub.s       fs8, fs1, fs10
                  fsgnj.s      ft4, ft6, fs8
                  fsub.s       ft7, ft5, ft5, rtz
                  fsgnj.s      fs11, fs1, fa5
                  fsub.s       fs2, fa4, fs8
                  fmin.s       fs4, fs10, fa5
                  flt.s        s6, fs0, fa4
                  fsgnjn.s     fa4, ft9, fs2
                  fle.s        s11, ft11, fs7
                  srl          t2, s2, s11
                  fmv.w.x      ft10, s7
                  and          s11, s2, s10
                  fle.s        t3, ft7, ft7
                  fcvt.s.w     fs6, t3, rmm
                  and          a1, s3, sp
                  mulhu        s8, sp, s11
                  fcvt.w.s     t2, fs8, rup
                  fdiv.s       fs3, ft2, ft10, rne
                  rem          s2, t1, t5
                  fmv.x.w      s3, fa6
                  fmv.w.x      fa3, s9
                  fclass.s     a6, fs4
                  fadd.s       ft6, fs11, ft5, rup
                  sltiu        s0, s0, -1825
                  sltu         t2, zero, a3
                  sltu         ra, a1, t2
                  slli         s9, t1, 20
                  or           a6, a2, a1
                  remu         t1, a2, s4
                  fmv.x.w      s4, fa6
                  fcvt.wu.s    ra, fs11
                  fmv.w.x      ft10, t0
                  fcvt.s.w     fs4, gp
                  slli         s11, s4, 13
                  flt.s        ra, ft1, ft1
                  andi         s0, a7, -1463
                  divu         s3, t3, zero
                  nop
                  fle.s        a2, fs3, ft0
                  fclass.s     s5, ft11
                  fmv.w.x      fs9, zero
                  fdiv.s       fs6, fs11, fs10, rtz
                  xor          s10, a3, t5
                  fsgnjx.s     ft10, ft2, fs0
                  fmv.x.w      s4, ft3
                  slli         a3, s1, 19
                  srai         s3, s1, 13
                  fmv.x.w      s5, ft2
                  mulhu        s5, a2, s4
                  add          s3, s9, t5
                  fmv.x.w      s8, fs8
                  mulhu        tp, gp, a3
                  fsgnjn.s     fs9, ft4, fs4
                  fmv.w.x      ft1, s5
                  fmul.s       fs10, ft10, fa3, rup
                  fcvt.wu.s    a1, fa2
                  fadd.s       fs11, ft10, ft8, rtz
                  fclass.s     t1, fa5
                  srl          a2, s6, s11
                  add          a5, s10, s8
                  mulhu        a7, s5, s5
                  andi         s1, t2, 1633
                  srai         s1, s10, 25
                  fcvt.w.s     s8, ft10, rdn
                  mulh         gp, s0, t5
                  fclass.s     a2, fs10
                  fadd.s       fs7, ft0, ft10
                  sra          zero, sp, sp
                  fmv.x.w      a1, fs9
                  slli         s0, s10, 2
                  fmax.s       ft0, fs0, fa6
                  auipc        s2, 125555
                  fcvt.w.s     t1, ft9
                  fmv.w.x      ft6, t3
                  mul          s7, t4, s3
                  srai         a7, a4, 27
                  fmv.w.x      ft1, zero
                  mulhu        s2, t5, a4
                  fcvt.w.s     tp, fs4
                  fsqrt.s      fs9, fa4
                  fclass.s     s6, fa5
                  sra          s3, a2, s3
                  xori         s8, t4, 2026
                  fadd.s       ft9, fs3, fs8
                  feq.s        a3, ft9, fa0
                  srl          s1, gp, gp
                  sub          t3, t2, a2
                  fmv.w.x      fs5, t2
                  slli         a3, s1, 29
                  srli         s8, a6, 26
                  srai         t3, s6, 12
                  fcvt.s.wu    fa4, s0
                  sltiu        s9, s6, -1008
                  slt          s10, s9, zero
                  fmul.s       ft2, fs10, fa5
                  or           a6, a2, a1
                  fle.s        a0, ft3, fs5
                  fcvt.wu.s    s6, fs5
                  fmv.x.w      s10, ft11
                  slt          t0, a7, a1
                  fcvt.w.s     s4, fs8, rup
                  fcvt.wu.s    s9, fa3, rmm
                  xor          a1, t5, s7
                  sll          a2, a7, a5
                  fcvt.s.w     fs0, t0
                  sltiu        a1, ra, -172
                  sltiu        s10, s2, -1823
                  fmv.w.x      fs6, tp
                  xori         s1, gp, 236
                  fmin.s       fs0, ft8, ft5
                  feq.s        gp, fs7, fa6
                  flt.s        s11, fa7, fs0
                  feq.s        s9, fa7, fa0
                  sltu         tp, ra, a5
                  divu         s6, gp, s6
                  xori         a6, ra, 1692
                  slt          s0, s3, s4
                  remu         a1, gp, a7
                  or           s7, s0, a5
                  mul          s8, a6, a3
                  slt          a5, s4, gp
                  rem          s5, s9, s11
                  feq.s        a1, ft5, fa2
                  nop
                  xori         s10, t3, -1554
                  remu         s4, s1, s4
                  srli         s4, s6, 27
                  slti         t1, a2, -1709
                  fcvt.s.w     ft11, t1
                  fcvt.s.wu    ft7, zero
                  fmv.w.x      fs3, a0
                  srl          a0, ra, a4
                  fsgnj.s      ft2, ft11, ft9
                  mulh         s2, s0, s8
                  slli         sp, zero, 0
                  fcvt.wu.s    a6, fs7, rtz
                  slli         s6, s3, 25
                  fsub.s       fa1, fs10, fs7
                  fclass.s     t3, fs9
                  add          a6, s9, s11
                  fmax.s       ft1, ft5, ft9
                  andi         t0, a3, 160
                  fcvt.w.s     sp, ft5
                  auipc        s11, 1048358
                  xori         s4, a1, 1918
                  div          s8, a4, s5
                  fmul.s       ft0, ft1, ft1, rmm
                  fsgnj.s      ft1, ft8, fs10
                  fdiv.s       ft7, fa5, fs11
                  fsqrt.s      fa7, fs1
                  auipc        a6, 665174
                  nop
                  sra          s0, t6, a3
                  andi         gp, s1, 1862
                  or           zero, t5, t1
                  slli         s10, s4, 14
                  and          s1, a5, s5
                  flt.s        a3, fs2, ft5
                  sra          s8, s1, t1
                  srli         a1, a5, 7
                  lui          s10, 392554
                  fsgnj.s      fa3, ft3, fs8
                  fcvt.w.s     s4, fs0, rdn
                  srl          s8, s1, t0
                  fsub.s       fs11, ft3, ft6
                  srai         t1, a2, 4
                  fsgnj.s      ft2, ft1, ft4
                  fmv.x.w      sp, ft2
                  andi         zero, s2, -2032
                  mulhsu       a5, s0, a4
                  fsgnjx.s     ft10, fs10, fs8
                  andi         s3, s8, 688
                  fmin.s       fs1, ft11, fs7
                  sra          s5, a1, t6
                  fle.s        ra, fs10, fs5
                  divu         s3, t4, s3
                  mul          ra, a5, t3
                  fmax.s       ft9, fs4, ft11
                  lui          a1, 774994
                  fmax.s       fs0, ft3, ft9
                  or           s10, tp, a3
                  srai         t0, s2, 4
                  and          tp, t2, t2
                  divu         t3, a1, a0
                  fmax.s       ft10, fa0, fs6
                  fsgnjn.s     ft11, fs7, ft8
                  sltu         a7, t5, tp
                  slli         a0, t5, 8
                  slti         tp, s1, -1049
                  srai         a2, s4, 22
                  sra          s11, a7, t1
                  divu         a0, s3, s8
                  feq.s        s2, fa1, fs4
                  mul          s8, a4, s8
                  remu         a0, t5, s0
                  fcvt.s.wu    fa5, a0
                  slt          sp, s9, s9
                  sra          t0, zero, zero
                  and          s6, s9, a4
                  slt          t2, t2, s6
                  slti         a1, t4, -1194
                  slt          s0, t2, s7
                  fmin.s       fs3, fs8, ft10
                  srl          s4, zero, s11
                  fcvt.s.wu    fa5, t0
                  xor          a7, s11, s1
                  srai         a2, s6, 26
                  slt          s4, s6, t2
                  srli         t2, s11, 15
                  feq.s        a7, ft0, ft1
                  or           t2, a0, a2
                  mulhu        t1, t3, a0
                  srli         s0, t1, 19
                  xori         t3, s2, -809
                  sub          t3, s2, t1
                  mul          s10, s0, tp
                  mulhsu       a2, s8, s9
                  div          s0, a7, s3
                  xori         a3, s0, -803
                  sub          s5, s2, sp
                  slti         t1, t3, 1311
                  srai         s10, t4, 2
                  add          sp, t6, a4
                  xor          a1, s0, s1
                  rem          s11, a4, s6
                  fsgnj.s      ft10, ft2, ft1
                  fsgnj.s      fa1, fs2, fa5
                  sll          a7, tp, a5
                  mulh         s1, t5, t1
                  mul          s6, ra, s9
                  srai         s8, s6, 3
                  addi         s8, t0, -1758
                  fclass.s     s3, ft1
                  andi         gp, a5, -244
                  sltiu        zero, a6, -912
                  fmul.s       fa6, fs0, fs7, rmm
                  fsgnj.s      fa6, ft8, fs7
                  fcvt.s.w     fa7, tp, rne
                  fmv.w.x      fa4, tp
                  ori          zero, t1, -312
                  lui          s6, 179523
                  fdiv.s       ft6, ft2, ft5, rdn
                  fle.s        a5, fs11, fs10
                  srli         gp, a0, 25
                  fsgnj.s      fa6, fa2, ft11
                  or           tp, a6, a3
                  lui          gp, 662608
                  ori          t4, t4, -1773
                  sra          a1, t2, s6
                  fsub.s       ft9, fa4, ft4
                  or           s10, s11, t5
                  fmul.s       fs8, ft6, ft11, rne
                  fmul.s       fs8, ft7, ft11, rmm
                  mulhu        s10, t5, s0
                  fsqrt.s      ft6, ft5
                  nop
                  fsgnjx.s     ft2, fs4, ft1
                  sll          s10, t5, gp
                  fmul.s       fs3, fs4, fs4
                  and          s3, a3, a7
                  fle.s        a1, ft10, ft9
                  fle.s        t0, ft7, fs3
                  fsgnjn.s     ft5, fs3, fs10
                  lui          ra, 970611
                  remu         tp, s3, sp
                  srai         s4, s10, 17
                  fmv.w.x      ft5, t2
                  fcvt.s.wu    fs11, t4
                  xor          s2, t1, s11
                  lui          s0, 407871
                  fcvt.w.s     s7, fa3
                  fcvt.s.w     fa7, t3, rdn
                  srl          t4, s10, t4
                  srl          tp, s1, ra
                  remu         a6, sp, s9
                  auipc        s5, 514157
                  lui          s7, 291022
                  sltiu        ra, sp, 1863
                  sll          s6, s2, a6
                  fcvt.wu.s    s11, fs10, rne
                  slt          t3, s2, a4
                  fcvt.s.wu    fs8, s2
                  slti         s2, s0, 1576
                  auipc        s11, 485637
                  fsgnjx.s     fs11, ft4, ft8
                  remu         s3, gp, a0
                  fmax.s       ft7, ft1, ft11
                  div          s10, a1, s7
                  addi         s3, s6, 628
                  mulhu        s9, a6, a2
                  fmv.w.x      fs11, s11
                  divu         s4, s3, s4
                  div          t0, t5, a0
                  remu         s10, a3, a5
                  fcvt.wu.s    s3, ft5, rne
                  and          a5, a4, s5
                  feq.s        a1, ft3, fa6
                  add          t1, s6, t4
                  lui          a5, 216650
                  fle.s        ra, ft10, fs2
                  remu         s2, s0, t4
                  addi         s0, sp, -1254
                  rem          s2, a0, t3
                  fmv.x.w      t0, fs2
                  ori          s4, a3, 1121
                  sra          a3, s1, a1
                  fsgnjx.s     fa2, fs0, ft1
                  slti         tp, t0, -1028
                  fcvt.w.s     zero, fs6
                  fle.s        t2, ft7, fs11
                  fcvt.s.wu    fs1, zero, rdn
                  rem          s6, s6, a6
                  rem          a0, a6, s7
                  xor          s9, a7, s9
                  add          s5, s4, a2
                  fadd.s       fs1, ft11, fs11
                  fsqrt.s      fs5, fs2, rup
                  auipc        t0, 414548
                  feq.s        a0, ft0, fs9
                  feq.s        a5, fs8, fs3
                  remu         t4, s2, s10
                  fcvt.s.w     fa4, a5
                  srli         t4, s9, 28
                  slli         s7, t6, 26
                  lui          s4, 806130
                  andi         s7, s6, -1297
                  mulh         gp, s9, a4
                  fcvt.s.w     fa7, ra, rup
                  slli         s5, t3, 16
                  sll          s7, a6, t4
                  or           tp, s10, s0
                  addi         a1, s2, 606
                  fcvt.w.s     a0, fa4, rdn
                  slti         s0, ra, -344
                  feq.s        s7, fa0, fs7
                  sra          s1, t4, t4
                  fclass.s     gp, ft0
                  fsgnj.s      fa7, fa2, fs10
                  fcvt.w.s     s8, fs2
                  fsub.s       ft1, ft8, fs5, rmm
                  flt.s        sp, fa3, ft7
                  sub          s4, s7, s3
                  srl          t3, s8, a6
                  div          a0, zero, s1
                  fcvt.wu.s    s8, fs11, rdn
                  add          t3, t4, s2
                  sltiu        t3, s6, 202
                  fmin.s       fa1, fa5, ft9
                  srli         a0, t6, 1
                  slli         s4, zero, 17
                  nop
                  srli         a7, zero, 17
                  mulhsu       a7, s9, t5
                  srli         s11, s6, 30
                  fcvt.s.wu    fa6, s4
                  srl          s10, t3, t4
                  fmv.x.w      t1, ft11
                  fcvt.w.s     t0, fs1, rtz
                  mulh         t0, s7, tp
                  fsqrt.s      ft9, ft5, rdn
                  fmul.s       fs5, ft1, fs9, rtz
                  or           s10, s4, s1
                  fmax.s       fa0, fs8, ft9
                  auipc        s1, 715059
                  fsgnjx.s     fs5, fa7, fa1
                  nop
                  slt          ra, a1, a5
                  lui          s2, 960015
                  fsgnjn.s     fs5, fa3, ft7
                  fsqrt.s      ft3, fs10, rdn
                  nop
                  fmin.s       fs6, ft3, ft4
                  srai         tp, zero, 6
                  lui          t3, 248488
                  feq.s        s7, ft7, fs11
                  fsgnj.s      ft10, ft8, fa3
                  fsqrt.s      ft5, ft9, rdn
                  mulhsu       t3, a6, a3
                  remu         a1, s1, t5
                  feq.s        a6, fa4, ft2
                  fcvt.s.wu    ft0, a6
                  remu         t0, a4, s6
                  srli         s2, a2, 28
                  fmv.w.x      ft6, t6
                  fcvt.wu.s    a6, ft1
                  feq.s        gp, ft1, ft8
                  mulhu        a3, a1, s6
                  andi         a0, s7, -38
                  fsqrt.s      fs1, fs7, rup
                  xori         a2, a0, 1140
                  fsgnj.s      fs2, fa5, fa1
                  fsgnjn.s     fs3, ft3, fa3
                  nop
                  xori         a7, a4, 148
                  mulhsu       sp, s7, tp
                  mulhsu       s8, tp, s2
                  mulhu        s10, a2, s0
                  fsqrt.s      ft6, ft0, rtz
                  remu         a2, t1, s4
                  mulhsu       zero, s3, t4
                  fmul.s       fs6, fs0, fs8
                  fmul.s       fa1, ft10, fa3, rmm
                  or           s6, t1, a3
                  slt          gp, a3, s9
                  xor          tp, tp, a0
                  fmv.w.x      fs5, a3
                  fsgnjn.s     fa0, ft1, fs7
                  rem          a3, t1, gp
                  fmul.s       fa6, fa3, fs2, rdn
                  fclass.s     a2, fs2
                  fclass.s     s8, fs9
                  xor          s5, s9, t2
                  fsub.s       ft5, ft4, fs3
                  fmax.s       fa3, fa0, ft8
                  xor          s6, s11, s3
                  andi         s9, a2, 1477
                  feq.s        sp, ft11, fs7
                  remu         t0, s7, s1
                  fmax.s       ft10, fs5, fs7
                  sub          s6, t0, tp
                  fcvt.s.w     fs9, s1, rne
                  auipc        a2, 1000780
                  fsub.s       fa6, fs7, ft0, rdn
                  ori          s10, tp, -804
                  fsgnj.s      ft0, ft5, fs10
                  rem          a6, t0, a2
                  div          t2, t3, a1
                  fsub.s       fa2, ft2, fs8
                  or           s3, a2, s7
                  fdiv.s       fs3, fs6, fa6, rdn
                  fle.s        s11, ft8, fs6
                  mulh         a5, tp, zero
                  mulhsu       a7, s0, a7
                  mul          gp, a3, s4
                  fsgnj.s      fa0, ft9, fs10
                  flt.s        t4, fa4, fa0
                  fsqrt.s      fs4, fs1
                  fmul.s       fa4, ft10, fs6
                  slti         s5, zero, 1491
                  fcvt.wu.s    a1, fs9
                  fcvt.wu.s    s8, fa3, rup
                  sra          s5, s5, s3
                  fcvt.s.wu    ft2, s5
                  fsgnjx.s     ft2, ft2, fs4
                  mul          a5, s4, s8
                  sltu         s3, s11, t1
                  or           gp, a5, s5
                  or           a5, s1, zero
                  fmin.s       fs7, fs8, fs7
                  sra          t2, zero, s0
                  remu         a1, t3, a2
                  fcvt.s.wu    fs8, a7, rtz
                  fmin.s       fa3, fa1, fa5
                  mulh         s6, s7, s8
                  andi         s2, s8, -74
                  xor          t0, s5, zero
                  addi         a7, s5, 1649
                  addi         a3, zero, 1438
                  fmin.s       fa6, ft1, fs8
                  divu         s3, a4, a7
                  remu         a3, t2, s6
                  fmin.s       ft11, ft0, fs2
                  fclass.s     s10, fa7
                  xori         s0, s0, -1055
                  sll          s7, s5, a1
                  nop
                  mulhsu       s5, a5, tp
                  mul          gp, t6, s5
                  srai         t0, s0, 14
                  fsgnj.s      fs4, fa2, ft7
                  auipc        a7, 717290
                  sra          s3, a7, t2
                  fsgnj.s      fa4, fs7, ft4
                  nop
                  fadd.s       fs3, ft0, fs7
                  fcvt.wu.s    a1, ft8, rmm
                  remu         t2, s8, a0
                  fclass.s     s6, fs7
                  add          s6, a1, a2
                  feq.s        gp, ft3, ft1
                  sltiu        t3, a0, -1260
                  sltu         s2, a3, gp
                  fsgnjx.s     ft4, fa6, fs2
                  slti         s9, a4, 394
                  fadd.s       ft4, fs9, ft8, rtz
                  ori          a2, zero, 1692
                  mul          sp, a1, sp
                  remu         zero, t4, s6
                  srai         s5, t0, 18
                  feq.s        t4, ft7, fa6
                  fadd.s       ft7, fs9, fa5
                  fmul.s       fa4, fs10, fa2, rtz
                  fmv.x.w      tp, ft8
                  addi         s0, s8, 1833
                  fsub.s       fs8, ft9, fs8
                  xor          a6, s11, t1
                  flt.s        s1, fs7, ft0
                  srai         a1, a7, 2
                  ori          s8, s10, -1282
                  mulh         tp, s8, s11
                  mulhu        sp, t3, t4
                  div          sp, s9, a1
                  nop
                  fmul.s       fs1, ft8, fa2
                  fcvt.w.s     s1, ft9
                  sll          s8, a2, s2
                  sltu         s2, t6, t2
                  slti         s0, s9, -119
                  div          t0, gp, a7
                  mulhu        s4, s10, s3
                  divu         a5, s10, t4
                  fcvt.w.s     s11, fs11, rdn
                  fmv.x.w      gp, fs6
                  mulh         s2, t0, a0
                  srl          a5, s7, s6
                  fmv.x.w      s6, fs5
                  fle.s        a0, fa1, fs0
                  mul          s6, a3, s7
                  or           t4, zero, t3
                  divu         tp, s5, s4
                  andi         s1, s9, -809
                  andi         s5, s11, -2024
                  sll          s6, gp, t1
                  fcvt.s.w     fa1, a7, rdn
                  div          s11, t6, s10
                  fdiv.s       fs10, fa1, ft10, rmm
                  addi         s2, a2, -1275
                  nop
                  fcvt.s.w     ft4, zero
                  fsgnjx.s     ft8, ft3, ft11
                  srli         ra, zero, 31
                  fcvt.s.wu    fs8, s11
                  fadd.s       fs2, fa0, fs5, rmm
                  fdiv.s       ft2, fa7, fa6
                  divu         s8, a7, a1
                  addi         a5, t2, 930
                  mulhu        s9, tp, a1
                  add          t3, gp, ra
                  slli         s0, s10, 0
                  sltu         s5, t3, t0
                  andi         s6, s7, -1651
                  addi         t2, s2, -122
                  nop
                  sra          t2, s2, a1
                  auipc        a7, 931234
                  mulhu        a0, a5, t6
                  srl          tp, s4, t6
                  fadd.s       ft10, ft2, ft11, rdn
                  fsqrt.s      fa0, ft4, rup
                  mulhsu       t3, a4, t6
                  fsqrt.s      fa0, fa3
                  fsgnjn.s     fa0, ft1, fs1
                  fdiv.s       fa7, fa2, fa2, rmm
                  sltiu        a6, t2, -1151
                  fmax.s       ft7, ft3, ft5
                  fadd.s       fa3, fs10, fs8
                  sltiu        tp, a3, 1207
                  fmin.s       ft3, ft10, ft9
                  slti         a3, t2, 1739
                  feq.s        gp, ft2, fa7
                  fmin.s       fs2, fs11, ft7
                  or           a2, t3, s4
                  fsgnj.s      fs10, fs1, fs7
                  fsqrt.s      fs0, fa4
                  addi         s4, s2, -1819
                  slti         s7, s0, 1712
                  lui          s7, 214417
                  mulhu        a1, a4, s9
                  fsgnj.s      fs3, ft10, fa0
                  remu         s1, t4, gp
                  fsgnj.s      ft5, ft8, fa5
                  fcvt.w.s     a5, fs3, rdn
                  sltu         gp, t6, s11
                  mul          s11, t4, t0
                  remu         gp, t0, s8
                  fsgnjn.s     ft6, ft2, fs9
                  mulhsu       s6, a2, s4
                  fsgnj.s      fs5, fs8, fs1
                  mulhu        t2, a1, a5
                  mul          s4, s4, s11
                  fcvt.s.wu    fs7, t1, rdn
                  mulhu        s1, tp, t6
                  fsgnj.s      ft1, ft8, fs2
                  remu         s1, t6, zero
                  fmax.s       fs6, fa5, ft3
                  slti         t3, t3, 1828
                  div          gp, a3, a7
                  xor          a2, s4, ra
                  sub          t4, a0, s6
                  fcvt.w.s     s1, fs4, rne
                  sra          a6, a7, t6
                  fcvt.w.s     a2, fs10, rtz
                  and          t1, sp, t6
                  andi         s9, s3, 1960
                  auipc        s3, 348114
                  addi         ra, gp, -1653
                  fsgnjx.s     fa5, fs9, fa5
                  fmv.x.w      ra, fs7
                  fsqrt.s      ft8, ft8, rne
                  fsgnjx.s     ft6, ft3, fs8
                  fmax.s       fa6, fs3, fs4
                  fcvt.s.w     ft6, t4
                  srl          t3, gp, tp
                  sub          s0, a4, a6
                  mul          tp, s10, a2
                  fle.s        gp, ft6, fs6
                  sll          s11, gp, gp
                  fmv.w.x      fs8, a0
                  fsub.s       ft11, fa3, ft1, rdn
                  feq.s        s6, fa7, ft0
                  mulhsu       s11, s9, s5
                  add          ra, tp, a5
                  mulhu        s1, s9, a4
                  mul          a7, a5, s6
                  feq.s        a3, fs10, ft9
                  srl          a5, s8, a3
                  sltu         zero, t0, zero
                  auipc        s6, 659120
                  fsgnjx.s     ft3, fs5, fa2
                  fsgnjx.s     fa5, fs9, fs3
                  sra          s1, s9, a0
                  mulh         s7, s11, s3
                  add          a7, tp, a6
                  fmax.s       fs4, fs5, ft9
                  sltiu        t2, t2, 1636
                  fmul.s       fs5, fs9, ft9, rmm
                  sra          a6, t0, t3
                  fcvt.wu.s    s6, fa7, rup
                  rem          zero, gp, s1
                  slt          s9, a4, a0
                  or           gp, s5, zero
                  srl          tp, gp, a1
                  addi         s6, a5, 103
                  xor          sp, t3, s3
                  fle.s        a6, fa6, fs10
                  remu         a6, a7, s3
                  xori         a2, zero, -1712
                  xori         s9, t1, 1483
                  xor          a6, s0, a4
                  fdiv.s       ft3, fs10, fs8, rdn
                  andi         s0, s6, -1556
                  slli         s4, s1, 3
                  sub          sp, tp, tp
                  addi         ra, s7, 1620
                  slt          a1, t5, t1
                  xor          t1, s7, a6
                  divu         a1, t6, a4
                  fmul.s       fs10, ft6, fa7
                  flt.s        t1, fs0, fs7
                  flt.s        t1, fa5, fs10
                  fsgnjn.s     fs2, fa1, ft8
                  divu         a7, a3, t6
                  srli         a3, s6, 10
                  sltu         s11, s8, a5
                  fmv.x.w      s11, fa5
                  and          s7, t1, s11
                  fsgnjx.s     ft1, fs6, fa6
                  mulhu        ra, a3, s1
                  fle.s        sp, fs4, fa7
                  fadd.s       ft2, ft11, fa4
                  and          a5, tp, ra
                  add          sp, s1, s7
                  mulhu        zero, t5, tp
                  fcvt.s.wu    fa0, t2, rmm
                  srl          t3, a7, t3
                  mul          s10, s11, t1
                  slt          t3, t2, s5
                  fsgnjn.s     fa2, fa2, fs6
                  slli         t0, t5, 27
                  fsgnjn.s     fs1, fa2, ft4
                  andi         s0, a6, -1455
                  fadd.s       fa1, fs2, fs1, rup
                  andi         s3, s9, -1224
                  sltu         a0, zero, s1
                  sub          s10, s11, a6
                  fcvt.w.s     s9, ft5, rup
                  nop
                  fsgnjx.s     fa2, ft1, fs0
                  mulhu        a3, a3, s3
                  fadd.s       ft10, fa3, fs9, rtz
                  fcvt.wu.s    s10, fa4, rtz
                  flt.s        ra, ft1, fs6
                  addi         gp, a3, -384
                  fsub.s       ft7, fs2, ft2
                  fsgnjx.s     ft4, fs1, fa1
                  and          s3, a3, t4
                  fsgnjn.s     ft7, fs10, fa0
                  feq.s        t3, ft11, ft1
                  lui          s10, 34777
                  slt          a2, t6, s10
                  sltu         s4, t1, s8
                  ori          s5, s11, 1290
                  rem          a3, t0, s7
                  fclass.s     a3, ft3
                  fmul.s       fa3, fs6, ft3
                  div          a2, s11, a3
                  andi         s3, s9, 1302
                  fcvt.wu.s    a7, ft7
                  fadd.s       fs5, fa5, ft9
                  xor          sp, a4, sp
                  slti         t3, s8, -783
                  fsgnjx.s     fs11, fa5, ft10
                  sra          a7, gp, a0
                  fmax.s       fs1, fs5, fs9
                  fsub.s       fa2, ft8, ft7, rne
                  fcvt.s.w     fa1, t5
                  sltiu        s8, ra, 960
                  fdiv.s       fs7, fs2, fs5
                  fsgnj.s      fa3, ft6, ft3
                  lui          a5, 730465
                  mulh         sp, a0, s1
                  slt          a2, t6, a7
                  fsub.s       ft2, fa6, fa5, rmm
                  mulh         ra, ra, ra
                  addi         s4, t5, -869
                  fclass.s     s7, fs8
                  lui          ra, 1012812
                  fsub.s       ft5, fa4, fs0
                  fsgnjx.s     ft2, fa3, fa4
                  sltu         a5, tp, a6
                  lui          a7, 484765
                  add          t0, zero, s2
                  fcvt.s.wu    fa2, s1
                  fmin.s       ft9, fa6, fs4
                  srl          t0, s0, t3
                  sltu         s3, a3, a3
                  divu         s2, t2, t0
                  rem          s3, a3, t5
                  fle.s        s7, fs9, fa4
                  fcvt.s.wu    ft2, a7, rmm
                  fsgnjn.s     ft9, fs7, ft10
                  or           a1, a0, t0
                  fmin.s       ft10, fs7, ft2
                  srli         s1, sp, 22
                  mul          t2, t6, a1
                  mul          s10, t6, gp
                  fmv.x.w      t1, ft7
                  div          s9, t0, a1
                  fsgnj.s      ft0, fa4, fs7
                  remu         s5, s3, t6
                  fdiv.s       ft0, ft0, ft10, rne
                  slti         s8, a4, -1840
                  srl          s4, s5, s7
                  fsqrt.s      fa5, fs5, rup
                  mulh         a2, s10, a7
                  fsqrt.s      ft8, fa5, rtz
                  and          s5, t2, s5
                  fsqrt.s      ft9, fs5
                  divu         s2, t3, s4
                  fmul.s       ft9, fa0, fa6, rdn
                  fsgnjx.s     fs2, ft1, ft8
                  lui          s5, 791416
                  ori          a0, a7, 530
                  mulhsu       a2, s7, sp
                  xori         s7, s6, 1549
                  fadd.s       ft3, ft6, ft3, rne
                  xor          t1, ra, s6
                  slti         s7, s11, 992
                  add          s2, gp, s5
                  fmin.s       fa7, fa7, ft9
                  sltu         s2, a0, gp
                  add          t4, ra, s0
                  fmv.w.x      fs3, s10
                  fsgnjx.s     ft0, fs0, fa1
                  sub          ra, zero, zero
                  fsgnj.s      fa3, ft4, fa2
                  flt.s        s9, ft3, ft3
                  fmin.s       ft1, fa0, fs1
                  srai         a6, s6, 28
                  srl          a3, t2, t6
                  mulhsu       s2, s1, t6
                  div          a5, s3, a7
                  ori          a1, s10, 949
                  nop
                  fadd.s       fs3, ft4, ft11, rne
                  rem          t3, s0, s6
                  sltu         s7, a2, t5
                  fcvt.wu.s    s2, ft6
                  add          gp, ra, ra
                  auipc        s0, 870869
                  srai         a6, s0, 2
                  fcvt.wu.s    t2, fs4, rne
                  fmin.s       ft7, ft3, ft2
                  fmv.w.x      fs9, a6
                  sltu         a0, a0, s1
                  fsgnj.s      ft8, fs9, ft10
                  divu         sp, a6, sp
                  rem          a1, s10, t3
                  rem          a3, s7, a2
                  fmul.s       fa7, fs11, ft5, rup
                  fcvt.s.w     fs0, a0, rtz
                  fsgnjx.s     fa7, fs9, fs4
                  slti         a6, s8, -230
                  srl          t2, s0, s5
                  divu         s10, t3, gp
                  andi         t3, t0, 1092
                  srli         a7, s9, 29
                  slti         s7, a7, 1121
                  srli         s5, gp, 7
                  fcvt.wu.s    t2, ft0, rtz
                  andi         s1, t0, 1191
                  mulh         s9, a0, t5
                  fmin.s       ft1, fs7, fs5
                  fcvt.w.s     s7, fs1, rtz
                  feq.s        t1, fs0, fs10
                  fclass.s     a1, ft4
                  add          t4, s5, s0
                  nop
                  fmv.x.w      s1, fa4
                  slt          ra, t5, s3
                  xori         a7, t2, -307
                  fcvt.w.s     a0, ft7, rtz
                  div          s3, s4, s1
                  fsgnjn.s     fa7, fs2, fs6
                  xori         s9, s2, -822
                  fsub.s       fs10, ft0, ft10, rtz
                  srl          s8, a2, s2
                  srli         t1, t2, 5
                  div          s8, s7, a5
                  mulhu        s9, s3, zero
                  srai         t0, s10, 4
                  slti         t2, t3, -1450
                  sltu         a5, s5, t4
                  xori         s9, s3, -855
                  mulhsu       a6, ra, t3
                  addi         t4, s2, -214
                  srli         t4, s0, 27
                  slti         s8, t3, -270
                  fdiv.s       fs11, fs4, ft2, rmm
                  fsgnjn.s     fa7, fs0, fs7
                  fsqrt.s      ft3, fs1
                  and          t0, s10, a1
                  fsgnjn.s     fs4, fa5, fs3
                  fclass.s     t3, ft10
                  divu         t3, a5, a1
                  fle.s        zero, ft1, fs9
                  fcvt.wu.s    a3, fa5
                  remu         s4, s6, zero
                  remu         t2, ra, a4
                  fle.s        a0, fs5, fs11
                  fmv.w.x      fa2, s1
                  fmax.s       fa7, ft3, fa1
                  rem          s9, s8, a2
                  srl          s4, a7, ra
                  slti         s7, a3, 1351
                  fmin.s       ft8, ft7, fa0
                  mulh         s4, s8, s4
                  fmv.w.x      fs7, a5
                  fcvt.s.w     fa1, gp, rdn
                  fdiv.s       fa1, ft1, fa4, rne
                  fcvt.s.w     fa1, s3
                  sll          t4, a6, t2
                  mulh         tp, s6, t2
                  srl          zero, zero, zero
                  rem          a2, s4, s11
                  fmv.w.x      fs11, s10
                  xori         s9, s1, -1571
                  lui          s11, 260204
                  lui          a1, 976979
                  srl          s11, s0, s3
                  and          zero, a4, a0
                  slti         s6, s8, -1050
                  auipc        s1, 750680
                  sltiu        sp, ra, -28
                  and          s5, tp, t2
                  fsgnjx.s     ft10, fa6, fa6
                  mul          s3, t2, s0
                  fcvt.w.s     s10, ft10
                  or           s3, s6, a5
                  xor          a1, s6, t4
                  add          t3, s4, ra
                  srl          s5, s7, t2
                  mulhsu       s7, a4, tp
                  mulhu        s2, t0, tp
                  feq.s        t0, fs7, fa5
                  slli         sp, t3, 13
                  mulh         t3, a2, s8
                  srli         tp, s8, 27
                  or           t4, a4, s4
                  sltu         t2, a6, a7
                  divu         s4, a1, s6
                  xor          a1, t1, s7
                  fmax.s       ft10, fs9, ft1
                  fmax.s       ft8, ft6, fs0
                  mulhu        t3, t2, a5
                  fmul.s       fs7, fa2, ft10
                  xori         s8, t2, 870
                  divu         s4, zero, s9
                  add          s10, a2, gp
                  feq.s        a6, ft11, fa3
                  fsgnjn.s     fs9, fa7, fs1
                  slli         t3, a6, 3
                  div          s5, a1, t4
                  fcvt.s.wu    ft0, a6
                  fmin.s       ft2, ft11, ft8
                  fmin.s       fa0, ft1, fa6
                  fcvt.w.s     s3, fs6, rdn
                  fsqrt.s      ft2, ft0
                  div          t2, t1, s1
                  fsub.s       ft2, ft3, ft6
                  fsqrt.s      ft0, fs10
                  and          sp, a2, a6
                  slt          t2, s2, gp
                  fcvt.s.w     fs1, a0
                  flt.s        gp, fa7, fs0
                  nop
                  fclass.s     ra, fs0
                  add          a6, sp, s0
                  fsqrt.s      ft7, fs8, rmm
                  fmin.s       fa1, fa7, fs10
                  rem          s5, t0, s6
                  sll          a5, t0, zero
                  fadd.s       fs9, fs1, ft7
                  nop
                  remu         sp, s6, a6
                  slti         a2, t2, 1368
                  sll          a6, s9, t3
                  fcvt.wu.s    a3, ft3, rne
                  remu         s11, s4, zero
                  slt          s9, a1, t1
                  xor          ra, s10, s0
                  sra          s3, t5, s5
                  feq.s        a2, fs4, fa5
                  fsub.s       ft0, ft8, ft9, rup
                  xori         zero, t3, 618
                  sra          a1, a3, a2
                  add          s9, a4, zero
                  rem          s6, a6, tp
                  fcvt.wu.s    t4, fa2
                  slt          s6, a6, s0
                  sra          s3, ra, sp
                  or           s5, gp, t1
                  fmul.s       ft0, ft1, fs9
                  fdiv.s       fs4, fs7, fa6, rtz
                  flt.s        t1, fa2, ft2
                  fclass.s     t2, ft10
                  sra          s4, gp, tp
                  sltiu        s0, t1, 1159
                  fcvt.wu.s    a5, ft6
                  fmul.s       fs0, fa7, fa4
                  fcvt.wu.s    t3, ft7, rmm
                  xor          sp, tp, t4
                  srl          a6, ra, a7
                  sra          sp, a0, zero
                  sll          t1, s8, a7
                  or           sp, t3, s8
                  fsqrt.s      fs3, fs0
                  rem          t2, sp, a3
                  fsgnjn.s     ft0, ft9, ft8
                  sll          s2, a2, tp
                  fmul.s       fa1, ft7, ft11, rup
                  fsgnjn.s     ft11, fa4, ft2
                  fmin.s       fs3, fs7, fs8
                  flt.s        t3, ft8, ft11
                  mulh         t3, t2, s5
                  sll          a7, a0, s8
                  srli         a7, s8, 17
                  slti         a1, s3, -539
                  xor          sp, zero, s11
                  remu         t2, t1, s9
                  div          ra, a5, s9
                  slli         gp, t6, 0
                  rem          s2, tp, t3
                  or           a0, s7, t2
                  lui          a0, 554096
                  fmv.x.w      s9, fs7
                  div          a0, s7, s5
                  fadd.s       ft2, ft3, ft6, rmm
                  srli         s2, s1, 26
                  sra          gp, s6, a1
                  fclass.s     s2, fs1
                  mulh         zero, t6, a1
                  divu         a0, s7, t3
                  fmv.x.w      s5, fa2
                  fadd.s       fa6, fs4, fa2, rtz
                  srli         a6, a3, 20
                  fcvt.s.w     ft6, gp, rup
                  srai         tp, t6, 15
                  fmax.s       ft3, ft3, fa1
                  mulhu        a6, s4, s0
                  auipc        s1, 639134
                  srl          t3, zero, t1
                  fcvt.s.wu    fs5, zero, rne
                  fmul.s       fs8, ft9, fs8
                  or           a1, tp, s10
                  srli         a5, s1, 2
                  divu         s4, a0, s0
                  slli         ra, zero, 6
                  nop
                  fsgnj.s      fs11, ft9, fs7
                  divu         t3, s11, a7
                  srl          s11, t0, s7
                  srl          s1, tp, a6
                  addi         s4, t1, -826
                  fcvt.w.s     s5, fs8
                  xori         s1, t1, -1536
                  fmul.s       fa1, ft8, fs1
                  xori         s9, ra, 1036
                  divu         s0, s4, a5
                  mulh         s10, s6, a5
                  fmv.x.w      t0, ft10
                  fmv.x.w      s9, fs5
                  mulhu        t3, s3, a2
                  ori          a6, zero, 939
                  fdiv.s       fa3, fa7, fs7
                  remu         a2, t4, ra
                  fcvt.s.w     fs6, a6
                  fle.s        gp, fa1, fa3
                  fcvt.s.wu    fs1, gp
                  fsqrt.s      fs8, ft2, rtz
                  mul          s1, s3, tp
                  fcvt.wu.s    tp, fs8
                  mulhu        t3, zero, s8
                  feq.s        t3, fs10, ft8
                  flt.s        s0, ft7, ft9
                  fsgnjn.s     fs5, ft5, fa7
                  srli         t2, t3, 16
                  auipc        s2, 205417
                  fcvt.s.wu    ft6, s2, rne
                  addi         s7, t2, 128
                  remu         s5, s2, tp
                  sub          s4, t5, a4
                  sub          s2, s6, tp
                  or           s6, a5, s0
                  fsub.s       fa4, fa5, fs7
                  fmin.s       fs1, ft1, fs7
                  slt          a7, t3, s2
                  mulhu        tp, s8, t1
                  fsgnjn.s     fa7, ft1, fa6
                  slli         s11, s2, 12
                  sub          a7, s4, t5
                  nop
                  slt          t3, s2, t5
                  srli         t2, gp, 26
                  fsub.s       fs5, fs0, fs1
                  slt          s10, s10, s8
                  srl          sp, a7, sp
                  slli         sp, s4, 10
                  fsub.s       ft11, fa1, ft11, rup
                  xori         a7, ra, -1253
                  and          a6, s9, t0
                  xor          a5, a6, s8
                  fcvt.w.s     a3, fa6, rmm
                  mulh         a0, t0, a2
                  fsgnjn.s     fs1, fa2, fs2
                  rem          ra, s0, t3
                  or           a3, sp, s3
                  and          zero, a5, s10
                  addi         s3, a1, -1931
                  srli         s11, ra, 12
                  fsgnj.s      ft0, ft6, fs4
                  fmv.x.w      gp, fs5
                  andi         s3, s9, 1599
                  mulhsu       t3, t4, a4
                  fmul.s       ft6, fs9, fs7
                  or           s1, s4, tp
                  srli         s8, gp, 8
                  add          gp, a1, s4
                  remu         s5, s2, s7
                  fsqrt.s      fs1, fs3
                  ori          s5, a4, 346
                  fmv.w.x      fa4, t6
                  fmul.s       ft0, fs4, fa3
                  fsub.s       fs0, ft1, fs4
                  fmv.w.x      ft3, s0
                  fsgnjx.s     fa4, ft3, fs7
                  lui          t0, 888093
                  mul          a2, t4, s8
                  sltiu        t3, s6, -1419
                  addi         s4, t2, -1280
                  sltu         s5, s5, a3
                  div          s8, s4, a2
                  xor          s7, a5, a2
                  srli         s2, a3, 1
                  sll          s5, a6, s11
                  auipc        a7, 1014693
                  div          a7, a4, s8
                  fmax.s       fs5, fs6, ft4
                  remu         s3, t1, a7
                  addi         s5, gp, -967
                  sltiu        s8, s8, -1769
                  fmv.w.x      ft7, tp
                  mulhu        s2, s0, s6
                  div          t1, s0, a2
                  fadd.s       ft6, ft2, fa2, rtz
                  mulhsu       s1, gp, t0
                  fmin.s       ft3, fa1, fa0
                  sltiu        t1, gp, 100
                  fmin.s       fa1, fs6, ft1
                  fmul.s       fs2, ft7, fs6
                  fcvt.wu.s    s5, fa1
                  sltiu        s5, s6, -1736
                  addi         a7, s7, 668
                  remu         a6, a7, s7
                  fsgnjx.s     fa4, ft11, ft0
                  fadd.s       fa6, ft5, ft6, rmm
                  fmv.x.w      s10, fa1
                  andi         ra, a2, 649
                  fcvt.w.s     s0, fa3, rne
                  fdiv.s       fs3, fa7, fa3
                  sltiu        s7, t2, 977
                  andi         t2, a5, 1822
                  fmin.s       fs5, ft1, fs2
                  fadd.s       fa5, fa3, ft2, rup
                  nop
                  fdiv.s       ft0, fa4, fa7, rdn
                  sll          s0, t3, t6
                  fsqrt.s      fs0, ft0, rdn
                  fclass.s     s8, fa3
                  flt.s        s5, fs0, fs0
                  or           a0, ra, t5
                  fadd.s       fs8, fs9, fs11, rtz
                  sltu         s10, s8, s11
                  fsgnj.s      fa4, fs6, fs1
                  lui          s3, 849261
                  sltiu        t1, t1, -1990
                  mulhu        s2, t0, zero
                  div          ra, s8, s4
                  remu         a1, s0, a3
                  slt          t2, s2, a4
                  feq.s        a1, fa2, ft8
                  nop
                  fmul.s       fs2, fs6, fs5
                  fsub.s       fs1, fs8, ft3
                  fcvt.s.wu    ft0, a2
                  sltiu        s6, s10, 382
                  fcvt.s.w     fs1, t4
                  divu         a7, ra, a2
                  sltiu        s6, sp, -904
                  fmax.s       fs3, fa5, fa6
                  sub          s2, a1, t6
                  xor          s4, s2, s3
                  srl          t3, tp, s7
                  sll          t0, t2, ra
                  slli         s5, a7, 6
                  fdiv.s       fa3, fs11, ft5, rtz
                  fclass.s     s3, ft6
                  fcvt.wu.s    s5, ft4
                  fclass.s     t3, fa3
                  mulh         a2, a5, s3
                  fmv.x.w      s2, ft0
                  fdiv.s       fa1, fa1, fs10
                  and          a2, s3, a5
                  fmax.s       fs7, ft3, ft5
                  fle.s        t0, ft10, ft2
                  fcvt.wu.s    s5, fs4, rmm
                  slti         a5, sp, 1488
                  sra          t3, gp, s7
                  fadd.s       fs4, ft4, fs9, rmm
                  auipc        a6, 385947
                  fdiv.s       fs1, fa2, fa5, rne
                  div          a7, t0, zero
                  fmin.s       ft7, fs5, fs4
                  div          sp, a2, s9
                  ori          s8, s11, 476
                  fle.s        t4, fs0, ft8
                  sub          a1, a7, t1
                  fcvt.w.s     a7, ft3, rdn
                  fmv.w.x      ft0, t3
                  sltu         a7, t0, sp
                  add          s0, a4, s7
                  fclass.s     zero, fs8
                  xori         t2, s10, 536
                  fadd.s       fa1, fa2, ft2
                  fmul.s       ft7, fs4, ft3
                  fcvt.s.w     fa6, s10
                  and          s10, a0, t4
                  slt          a2, a2, s9
                  fsgnjn.s     ft11, fa2, fa6
                  xori         s3, s6, -1849
                  xor          zero, tp, sp
                  fsub.s       fa0, fs11, fa1
                  ori          a5, s1, -1261
                  fsgnjn.s     fa7, ft10, fs10
                  addi         s7, t6, 309
                  rem          sp, t6, s10
                  fmin.s       fs0, ft0, ft11
                  add          a0, a7, s1
                  xor          s7, s0, gp
                  add          s11, a2, s4
                  sltiu        sp, ra, -1732
                  fcvt.s.w     fa0, sp
                  divu         t2, a7, s2
                  rem          s2, s11, s4
                  ori          t1, s3, 1800
                  fdiv.s       ft11, ft2, fs4, rdn
                  fsgnjn.s     fs3, fa2, ft7
                  fmax.s       ft7, fs2, ft0
                  remu         s8, s5, s11
                  feq.s        t4, fa6, fs1
                  fmax.s       fs11, fs4, fs10
                  mulhsu       ra, t2, s1
                  fcvt.s.w     fs7, a5
                  slli         s2, s3, 14
                  fadd.s       fa0, ft4, ft4
                  srai         s9, a3, 28
                  fmax.s       ft3, fs11, fs2
                  mulh         gp, t0, s6
                  flt.s        s0, fs2, fa3
                  fmax.s       fs11, ft1, fa4
                  sll          s9, s3, a0
                  fcvt.s.wu    ft4, s8
                  feq.s        a7, ft11, ft10
                  div          a5, a3, s5
                  fsgnjx.s     fs9, fa2, ft0
                  sltiu        s2, s7, -1564
                  fmul.s       fs9, fs6, fs7, rne
                  fclass.s     a3, fa5
                  fcvt.s.w     ft9, a0, rne
                  sll          a3, s1, s4
                  srli         s7, gp, 30
                  xori         s10, s3, 2017
                  fmv.w.x      fs11, a0
                  srl          s2, a5, t4
                  addi         t1, a0, -1411
                  fsgnj.s      ft8, ft10, fs11
                  fclass.s     s8, fs6
                  slt          zero, a4, s7
                  srli         a2, s11, 21
                  ori          zero, sp, -702
                  srli         a3, s9, 25
                  fsgnjn.s     fs10, ft7, fa4
                  srli         s9, t6, 9
                  fcvt.s.wu    fs4, a1, rne
                  fcvt.s.w     ft2, ra
                  mulhsu       s1, ra, s9
                  mulh         a0, zero, a6
                  xori         a7, t5, 1058
                  rem          s4, s6, a0
                  rem          s2, t5, a4
                  and          a0, s3, s5
                  fcvt.w.s     a6, ft7, rtz
                  fcvt.w.s     t3, ft2
                  xor          a1, tp, s2
                  xori         a1, s1, 276
                  fsgnj.s      fa2, fa4, ft1
                  sll          a7, s6, s4
                  sra          zero, tp, s11
                  mulhu        a0, s3, gp
                  sltiu        t0, s6, 1618
                  div          sp, a1, s8
                  lui          s7, 136078
                  fcvt.s.wu    ft6, a4
                  fsgnjx.s     fs7, fs3, fs8
                  fcvt.s.w     ft7, a4
                  fsgnjx.s     ft5, fa4, ft11
                  fdiv.s       ft3, fs9, fa1, rmm
                  slti         t2, s9, 21
                  sltiu        a2, tp, -1520
                  fmax.s       ft0, ft1, ft6
                  fsub.s       ft6, fs4, fs4, rmm
                  slt          a2, a4, s7
                  sra          s11, s3, s0
                  srl          s2, s5, t3
                  auipc        a0, 244696
                  fsub.s       fa5, ft9, fs1, rne
                  fsgnj.s      ft6, ft10, fs7
                  sub          s4, s0, s11
                  ori          s1, a2, -2028
                  fmul.s       fa6, ft7, fa4, rup
                  addi         t3, a1, -1246
                  slt          s2, a2, s1
                  add          t2, t6, a1
                  xor          a3, s9, t6
                  slti         s4, s3, 574
                  mul          s5, t1, s0
                  fcvt.s.w     fa5, s2, rtz
                  add          t3, s1, a3
                  add          t2, t3, sp
                  flt.s        s2, fs1, fs5
                  addi         s4, tp, -1116
                  fsgnj.s      fs0, ft5, fs1
                  slti         s4, a6, -1965
                  fsgnjn.s     fs3, ft9, fs8
                  fmv.x.w      s6, fs10
                  fmax.s       fs7, ft2, ft3
                  fmax.s       ft4, ft7, fs7
                  addi         ra, s0, 1173
                  fmul.s       ft6, ft5, ft11, rmm
                  mulhu        ra, s10, a0
                  fcvt.w.s     s3, fs3
                  fmv.x.w      s9, ft11
                  sra          t3, gp, t1
                  fcvt.s.wu    fs11, tp
                  remu         s4, a2, s3
                  fcvt.w.s     s11, fs2, rmm
                  fsub.s       fa3, fa2, fs4, rdn
                  fclass.s     s1, fa0
                  fsgnj.s      fs6, ft6, fa3
                  flt.s        s4, fs10, ft6
                  add          a1, tp, a3
                  rem          tp, a3, a0
                  remu         a5, a7, s1
                  mulh         t2, sp, t6
                  auipc        s8, 606271
                  or           zero, s1, tp
                  and          a6, s7, s7
                  mulh         gp, s10, a2
                  slti         s2, a5, -489
                  andi         s5, s5, -1904
                  mulhsu       a3, a4, s2
                  fmin.s       ft1, ft6, fs7
                  slt          zero, s2, t0
                  fsgnjx.s     fs1, fs11, ft5
                  auipc        ra, 971377
                  add          a3, a7, s1
                  flt.s        t3, fs8, fa4
                  sltiu        a1, a6, 876
                  fmul.s       fs4, fs9, fs2
                  and          ra, t6, s6
                  fsqrt.s      fa2, fa4
                  fcvt.s.wu    fa5, a5
                  fsub.s       fs0, fs7, fa3
                  slti         t2, t6, -875
                  fcvt.s.wu    fs6, s3
                  sll          tp, t0, t3
                  fcvt.s.wu    fa7, s5
                  fdiv.s       ft6, ft3, fs7, rup
                  sltu         s6, t5, a1
                  srl          t4, tp, s0
                  fle.s        a6, fs4, fs3
                  rem          a7, s5, a0
                  and          a6, t3, t5
                  fclass.s     gp, fs7
                  fmin.s       fs11, fa7, ft8
                  fdiv.s       fa4, fs1, fs4, rtz
                  fsub.s       ft5, fs6, fa5, rup
                  or           zero, s1, t0
                  mulhu        s4, a0, gp
                  fmv.x.w      a1, ft8
                  fadd.s       fs8, fa3, fa7
                  slli         sp, s10, 12
                  remu         s9, s0, t2
                  srli         a7, s4, 13
                  xori         tp, s6, -783
                  ori          s9, sp, 230
                  fmin.s       ft4, fa7, ft1
                  slli         a1, s2, 12
                  srli         s5, a2, 27
                  fsgnjn.s     ft3, fs6, fs7
                  addi         t4, a3, 638
                  sub          t2, sp, zero
                  divu         s11, s9, gp
                  slt          s10, a6, s8
                  rem          s6, t2, ra
                  add          s9, s2, a0
                  fsub.s       fa0, ft4, fs8
                  sub          a2, a4, zero
                  auipc        t3, 886720
                  srli         a3, t6, 17
                  sltu         s8, s4, ra
                  fclass.s     s1, ft0
                  fadd.s       fa4, ft2, ft11, rmm
                  mul          a2, t1, t6
                  addi         s5, a3, -1339
                  mulh         s1, ra, s2
                  sub          s6, gp, s5
                  rem          s11, tp, tp
                  add          t4, sp, tp
                  lui          s5, 689726
                  fmax.s       fs4, fs10, ft7
                  xor          a1, t1, t6
                  fsgnjn.s     fs8, fa0, ft10
                  rem          a6, zero, a1
                  flt.s        s10, ft1, ft5
                  fle.s        s0, fs6, fs7
                  divu         s9, a5, s6
                  div          t2, s4, a3
                  lui          a1, 339373
                  fmv.x.w      s0, ft0
                  fadd.s       ft6, ft8, ft8
                  sltiu        ra, s1, -1109
                  fcvt.wu.s    a7, fs9, rdn
                  srai         t4, s11, 18
                  slli         a0, t0, 27
                  fcvt.w.s     tp, fa7
                  add          t3, a0, s1
                  xori         s9, t2, 1017
                  fle.s        ra, fs6, ft9
                  xor          s9, a3, t4
                  fsqrt.s      ft5, fs1
                  rem          t3, s8, s3
                  fcvt.s.w     fs3, s2, rne
                  slti         zero, tp, -1447
                  fcvt.w.s     a7, fa2, rne
                  or           s8, sp, gp
                  mulhu        t2, s11, s8
                  fmv.w.x      fa2, t3
                  and          a5, a4, t5
                  mulhsu       a0, a0, t5
                  fmv.w.x      ft2, a5
                  sub          s3, s9, a4
                  mul          ra, a7, t0
                  fsub.s       ft7, fs7, ft11
                  fsub.s       fs11, fs2, fs11
                  mulhsu       s6, a4, a7
                  fclass.s     s0, fs7
                  fcvt.w.s     t3, fs7, rne
                  fmv.w.x      ft0, s6
                  lui          s9, 523683
                  slt          a7, tp, t2
                  fcvt.w.s     s5, fs0
                  auipc        a3, 941674
                  ori          s3, s6, -132
                  fsub.s       fs6, fs5, fa4, rup
                  nop
                  fmax.s       fs11, fa6, fs3
                  and          t1, s7, s0
                  remu         t4, tp, s7
                  slt          s0, a7, t4
                  fmul.s       ft6, fa5, fa3, rdn
                  slt          tp, a7, t3
                  ori          s4, a5, 39
                  xor          sp, a1, s9
                  mulhu        a0, s6, s11
                  fmul.s       fs4, fa7, ft2, rtz
                  srl          s4, s4, t2
                  fmul.s       fa6, fa3, ft7
                  addi         tp, s3, 478
                  fsgnj.s      fa7, ft6, fs3
                  mulhsu       t0, a1, a7
                  fsgnjn.s     fa7, ft8, ft1
                  fmul.s       fs8, fs4, fs8
                  fmv.x.w      s11, ft10
                  fadd.s       fa3, fa0, fs1
                  add          tp, ra, s10
                  srai         s0, s0, 8
                  andi         s9, s3, -1433
                  fmv.w.x      fa5, a5
                  mulhu        sp, s5, t5
                  fsub.s       fs8, ft9, ft9, rne
                  sltu         s1, s2, s5
                  fsgnjn.s     fs9, ft3, ft5
                  andi         s8, a6, -1144
                  flt.s        s1, ft2, fa7
                  ori          a6, t5, -295
                  or           s9, t2, s8
                  feq.s        t4, ft11, fa3
                  mulh         tp, t0, a3
                  or           s8, t4, s4
                  fclass.s     a1, ft11
                  andi         a5, a0, -1969
                  fsgnjn.s     fs8, fs0, fs0
                  fsub.s       fa7, fs2, fs10
                  sub          s0, s9, t3
                  fcvt.s.wu    fa2, s6
                  srai         s0, zero, 5
                  fcvt.s.wu    fs7, a4, rne
                  fsgnjn.s     ft9, ft10, ft6
                  fsgnj.s      fs11, ft4, ft4
                  slli         sp, t5, 6
                  lui          s4, 310571
                  sub          s6, s11, t1
                  sll          s10, s10, a6
                  ori          a6, s3, 678
                  addi         t2, sp, 1306
                  slli         t2, s4, 26
                  rem          gp, a4, s4
                  andi         t1, a1, 1038
                  mulhsu       s0, s5, s10
                  auipc        tp, 292496
                  fcvt.s.w     fs4, s8
                  or           a5, t0, t4
                  fsub.s       fs6, ft3, fa5
                  fsgnj.s      fa3, fs3, fa6
                  flt.s        tp, fa6, ft9
                  fadd.s       ft9, fs11, fs0, rmm
                  add          s11, t1, s0
                  fmv.x.w      s9, fa6
                  sra          t1, s8, s3
                  mul          s8, s8, a4
                  fmv.x.w      a0, fs1
                  fsqrt.s      ft6, ft1, rne
                  rem          s7, s2, a6
                  slli         t1, a7, 9
                  mulh         t3, t5, t0
                  xor          t4, a6, s2
                  mulhu        ra, a5, s2
                  andi         a5, s10, 1996
                  fmul.s       ft11, fs5, ft2
                  sltu         s11, gp, s1
                  div          ra, tp, s7
                  srai         a6, s8, 20
                  fsqrt.s      fa2, ft10, rne
                  slt          s8, a4, s3
                  mulhsu       t3, a2, s7
                  fcvt.s.w     fs9, tp
                  fmul.s       ft8, fs1, ft2
                  auipc        ra, 601506
                  mulh         ra, a4, t0
                  mulhsu       s9, tp, t6
                  ori          a5, a2, 268
                  add          s3, a2, a4
                  fcvt.wu.s    s3, fa3, rup
                  addi         a2, t4, -415
                  sltu         t0, t6, t2
                  fcvt.w.s     a7, ft10, rup
                  mulhu        gp, ra, t3
                  div          s10, a3, s1
                  srl          s0, a4, tp
                  slti         s6, t0, 1607
                  fmv.x.w      ra, ft6
                  slti         a0, a6, 89
                  srai         s6, gp, 29
                  xori         a0, s5, 1616
                  fcvt.s.wu    ft11, a4, rdn
                  sra          t2, gp, tp
                  srl          s3, s1, s10
                  mulhu        zero, t3, t0
                  fdiv.s       ft4, fa0, fa5, rtz
                  fmin.s       fa0, fs5, ft11
                  divu         sp, t5, a6
                  xori         a5, s8, -603
                  fmv.x.w      s11, fs10
                  mulhu        s10, ra, a4
                  fdiv.s       ft7, fa7, fs1, rdn
                  feq.s        zero, fa1, ft4
                  fmul.s       fs3, ft4, fs6
                  fmv.w.x      fa2, s10
                  auipc        a5, 550888
                  lui          tp, 726268
                  fmul.s       ft0, fs9, fs2
                  srli         s1, sp, 24
                  fcvt.w.s     s2, ft6, rne
                  fle.s        s7, fa2, ft10
                  fcvt.s.wu    fa1, s3, rdn
                  fcvt.s.w     fa6, sp, rup
                  fadd.s       ft5, fs7, ft1, rup
                  srl          a7, tp, t6
                  rem          s5, t6, s11
                  or           s2, zero, s9
                  fmul.s       fs3, ft9, ft3, rtz
                  sll          gp, ra, s9
                  rem          ra, s7, s8
                  sltu         t4, s8, t4
                  divu         s5, a4, s1
                  mul          s7, zero, s10
                  fsub.s       fs2, fs4, fs11, rmm
                  andi         s8, a2, 777
                  sltiu        s6, sp, -1971
                  slti         s1, s9, 385
                  feq.s        s9, ft2, fa5
                  lui          s6, 134484
                  fcvt.wu.s    s1, ft6, rtz
                  lui          t3, 104894
                  fmax.s       ft0, ft2, ft7
                  fle.s        s8, ft10, fs10
                  auipc        t4, 943384
                  fmul.s       ft5, fs7, fs9, rdn
                  addi         s5, t6, 639
                  flt.s        s0, fa3, ft10
                  sltiu        gp, t3, 1711
                  or           a0, t6, a5
                  mulhu        a0, t3, s6
                  auipc        t4, 901004
                  fdiv.s       fs5, fa4, fa5, rmm
                  flt.s        s11, ft7, ft9
                  mul          a5, t1, s0
                  slti         s6, s7, 982
                  fdiv.s       fs9, fs8, fa1
                  sub          sp, s7, t4
                  add          s7, s7, t6
                  fmax.s       fs1, fa0, fs6
                  slt          s6, a2, s2
                  fmv.w.x      ft7, ra
                  feq.s        a3, fa4, ft5
                  divu         s1, a2, s0
                  srl          a0, a5, t1
                  fsub.s       ft1, fs1, fa5
                  remu         a5, s6, sp
                  fle.s        s0, fa5, fa3
                  slti         s1, s6, 553
                  sra          s2, s5, a0
                  nop
                  fmin.s       fs7, ft11, ft0
                  fmv.x.w      s1, ft8
                  divu         ra, t3, t3
                  ori          s4, t5, 1364
                  sll          s11, s4, a7
                  fmv.x.w      t3, fa6
                  sra          s10, t0, s2
                  divu         a2, zero, a7
                  mulhsu       t4, gp, a0
                  remu         s3, s4, s1
                  mul          s1, a0, t4
                  mul          ra, t2, tp
                  slti         s3, s6, -426
                  fsub.s       fa3, fa0, fa0
                  fmv.x.w      t3, fs2
                  fsgnj.s      ft0, ft1, fa7
                  sltu         t4, sp, a3
                  and          gp, a0, s3
                  slli         t2, s9, 9
                  flt.s        s4, fs10, fa7
                  or           a7, s8, t0
                  fcvt.s.w     ft6, t3, rne
                  feq.s        s10, fa2, ft0
                  div          zero, s0, t4
                  fmv.w.x      ft7, t0
                  remu         sp, t0, s5
                  ori          s6, s8, -232
                  xori         s8, s11, -568
                  div          s0, a4, s1
                  sll          ra, s8, t2
                  remu         s6, s11, s1
                  remu         s1, t5, a1
                  fcvt.s.wu    ft11, sp
                  sra          s3, s11, s0
                  ori          a2, s1, 1355
                  nop
                  add          t2, s1, s5
                  mulh         a7, s11, s10
                  divu         sp, sp, t0
                  mulhu        s1, a5, gp
                  divu         t3, a6, s3
                  lui          zero, 457617
                  mul          s4, t2, s11
                  sub          t1, gp, t5
                  slt          a3, ra, s0
                  mulhu        a2, s0, sp
                  fcvt.s.wu    fs3, s8
                  slli         a1, a0, 13
                  srli         s9, gp, 27
                  fcvt.w.s     s10, ft2, rdn
                  slti         s2, s6, -2008
                  fmv.w.x      ft10, ra
                  sll          s6, t0, a1
                  flt.s        t3, ft7, fa3
                  fmv.x.w      s6, fs11
                  sltiu        zero, t1, -930
                  xor          a6, gp, sp
                  fmv.w.x      fs11, s0
                  fsqrt.s      ft9, fa4, rup
                  fsub.s       ft8, ft0, fa5, rne
                  remu         s8, a7, s6
                  slti         a1, zero, 71
                  andi         t3, s11, -1693
                  ori          s0, s10, -932
                  and          s9, t1, s1
                  auipc        tp, 347268
                  sra          gp, zero, s11
                  mulhsu       a6, s10, s7
                  fadd.s       fs2, fa5, fa4
                  xor          tp, ra, t6
                  sltiu        s4, a7, -1578
                  fcvt.wu.s    a0, fa6
                  auipc        a6, 192604
                  fmax.s       fs0, fs8, fs6
                  fadd.s       ft3, ft0, fa0, rdn
                  slt          a6, s2, ra
                  addi         s9, s0, -372
                  sltiu        s6, t0, 1005
                  slt          t3, a4, s9
                  and          a5, s10, s11
                  fclass.s     t1, fs11
                  fmv.x.w      s9, fs10
                  sra          s11, t3, a3
                  fle.s        s1, fs8, fs6
                  srl          a7, a6, a3
                  mulhu        s5, t1, a1
                  fcvt.w.s     a1, ft9
                  ori          t2, t2, -1890
                  sltiu        t0, t3, -1594
                  fcvt.wu.s    s11, ft9
                  fclass.s     ra, fa0
                  srli         a1, sp, 29
                  mulhsu       s2, s4, a2
                  fsgnjn.s     fs7, fa0, fa7
                  fsub.s       ft10, fa6, fs2
                  fmv.w.x      ft1, s11
                  fsgnj.s      fs2, fs8, ft9
                  fdiv.s       fs5, ft8, fs4
                  slti         s10, a3, -910
                  fsgnj.s      ft4, ft1, fs4
                  fdiv.s       ft0, fs6, fa4
                  and          sp, t4, s10
                  fadd.s       ft1, fs10, fs7, rmm
                  addi         s11, a1, 317
                  fmul.s       fa5, fs4, fs11
                  fmul.s       fs5, fa2, ft7
                  fmin.s       ft11, fs2, ft1
                  slli         s8, s9, 13
                  nop
                  remu         s11, ra, a5
                  ori          t0, a3, 912
                  slli         a3, tp, 15
                  div          s10, ra, s11
                  fdiv.s       ft7, ft4, ft0, rdn
                  fmax.s       fs2, fs1, ft0
                  xori         a6, s6, -960
                  fcvt.s.wu    fs3, s1, rne
                  fmv.w.x      fs4, s2
                  sra          s7, s9, a4
                  sll          s10, s9, t5
                  slli         a2, t5, 15
                  andi         s6, t4, 1737
                  mul          a3, a2, s1
                  slti         t2, a2, 739
                  auipc        s7, 311555
                  div          a5, s4, s3
                  sub          s7, s5, a5
                  fcvt.s.w     ft0, a3
                  feq.s        a5, ft11, ft6
                  srl          s7, t2, tp
                  mul          sp, a0, s2
                  remu         s9, a3, s5
                  fcvt.w.s     a0, ft6, rdn
                  ori          s7, s8, -1831
                  rem          s7, t5, sp
                  slti         s6, s4, 1161
                  fsub.s       ft2, fa5, fs9, rtz
                  fsub.s       fa7, fa3, fa1
                  mulhu        t2, t0, t4
                  mulhsu       a6, s7, s9
                  srli         s4, ra, 16
                  flt.s        s6, fs4, fs2
                  sltiu        s4, t1, 1066
                  nop
                  mulh         sp, a2, ra
                  fsgnj.s      fs10, ft8, ft8
                  fcvt.w.s     s11, fs6, rup
                  andi         a3, t5, 1796
                  auipc        t2, 767302
                  fmv.x.w      t1, fa3
                  slti         a3, zero, -1334
                  div          s4, s1, t5
                  mulhsu       a7, s0, t5
                  addi         a5, s6, 1368
                  and          s4, a1, gp
                  fmv.w.x      ft10, s11
                  fcvt.s.wu    ft6, a1, rdn
                  srl          t0, t2, s9
                  srai         t0, ra, 29
                  fmin.s       fa5, fa4, fs4
                  slt          s7, t4, a2
                  fcvt.wu.s    s8, fs1, rup
                  auipc        s9, 855808
                  fmul.s       fa4, fs6, fs9
                  auipc        a3, 635605
                  ori          s11, t4, -786
                  fadd.s       ft6, fa6, ft2, rdn
                  fsgnjx.s     fs11, ft4, ft5
                  sltiu        s5, s6, -188
                  nop
                  slt          a0, a5, s2
                  srl          t4, t5, s1
                  slt          zero, s9, s2
                  fclass.s     s2, ft6
                  fcvt.wu.s    s10, fs8, rne
                  add          s11, a0, t6
                  mulhu        t4, a5, a5
                  flt.s        s4, fs8, fa5
                  and          s5, s6, s8
                  flt.s        a6, ft2, fs2
                  srli         zero, s0, 7
                  flt.s        s6, fa4, fs7
                  xori         s4, a3, 275
                  fadd.s       fa6, fs11, ft2, rup
                  srl          s11, s10, s4
                  fcvt.w.s     s0, ft3, rtz
                  mul          ra, ra, s9
                  slli         a1, a0, 12
                  feq.s        t1, fs3, fs3
                  fsgnjn.s     fa5, fa2, fs7
                  mulh         a5, s1, t0
                  srai         a0, t3, 10
                  sra          t3, t2, s10
                  flt.s        s8, fs3, fs3
                  fmin.s       fs1, fa7, fa4
                  sra          s11, s11, zero
                  flt.s        s5, ft10, ft11
                  srl          s10, s4, a3
                  xor          a7, a0, s8
                  rem          s9, a5, s1
                  auipc        s11, 54798
                  sltu         sp, tp, s5
                  fmax.s       ft3, fs1, ft2
                  flt.s        t4, ft1, ft3
                  fsgnj.s      ft3, fs8, fa2
                  lui          s2, 368056
                  fsub.s       ft11, fs11, ft3
                  srl          a1, a4, s3
                  ori          gp, a3, 344
                  fsgnj.s      fs1, ft6, fa7
                  flt.s        s8, fs11, ft6
                  lui          a0, 145106
                  mulhu        zero, gp, s6
                  nop
                  xori         t2, ra, -1879
                  fcvt.wu.s    t4, fs6
                  feq.s        s3, fs2, ft1
                  mulh         s2, tp, gp
                  sub          s5, a6, sp
                  fsub.s       ft5, fa4, fs1
                  addi         s5, gp, -1196
                  andi         a7, t4, 609
                  mulhu        s10, s2, s10
                  addi         s1, t0, 1302
                  flt.s        a3, fs8, fs8
                  sltu         s8, t5, a2
                  sltiu        a0, s2, -1047
                  slt          s10, t5, t4
                  fmul.s       ft4, ft3, fa7, rne
                  sub          s2, zero, gp
                  remu         a6, s5, s9
                  srli         s5, t1, 14
                  add          a7, ra, a1
                  fcvt.s.wu    ft2, a4, rne
                  fcvt.wu.s    ra, fs3, rdn
                  srli         s5, a2, 5
                  slt          s9, t3, t4
                  fle.s        a5, fs3, fs3
                  mul          a3, a7, a0
                  fmul.s       ft8, fs8, fs7, rup
                  ori          tp, a5, 1222
                  xori         t1, a5, 1141
                  fmin.s       fs5, fs6, ft3
                  srli         s6, s11, 4
                  nop
                  srl          a1, a7, s1
                  mulhu        a2, s1, t1
                  div          a6, a0, t0
                  fcvt.s.wu    ft9, s2, rdn
                  srai         a7, tp, 22
                  slti         a7, s3, 955
                  xor          a0, a6, sp
                  srl          s5, a5, sp
                  fcvt.s.w     fs4, t5
                  sll          t1, zero, t3
                  sll          a1, s1, a2
                  srl          s4, t5, tp
                  mulhu        ra, t6, a3
                  sltu         s3, s10, t2
                  fclass.s     a2, ft0
                  ori          a2, a1, -1788
                  fmv.w.x      ft8, s10
                  lui          s9, 849599
                  srl          s9, ra, ra
                  slti         s4, t1, 1950
                  remu         gp, t5, a1
                  andi         ra, a6, -1935
                  fmax.s       fa4, fs3, fs3
                  fadd.s       fa4, fs11, fs10, rdn
                  fsqrt.s      ft2, fs10, rmm
                  fcvt.s.wu    ft3, t5, rne
                  sub          a2, s9, a7
                  sll          a7, t2, a0
                  and          s3, t0, t5
                  ori          s3, a7, -784
                  srli         s10, a7, 19
                  remu         a3, a5, s1
                  srli         a3, a2, 25
                  sra          s3, s1, t4
                  fsgnjn.s     ft7, fs6, fs2
                  mulh         s7, a2, s1
                  mul          t1, t0, t3
                  srai         t2, ra, 17
                  fmul.s       ft0, fs11, ft6
                  ori          t4, a6, 1611
                  add          a3, s3, a3
                  fmul.s       ft11, fa7, ft6, rne
                  andi         t2, t1, 1759
                  feq.s        t3, fa4, fs0
                  fsgnjn.s     ft5, fs9, ft11
                  fmin.s       ft4, fs6, fs11
                  fsgnjn.s     fs3, fs8, ft7
                  fle.s        s7, fs6, fa5
                  fsub.s       fa4, ft4, fa5
                  div          s9, t1, sp
                  sltiu        a6, a1, -1032
                  sltu         s10, s5, ra
                  sltiu        ra, t3, 419
                  flt.s        s4, fa1, fs4
                  fcvt.s.w     fs11, s5
                  addi         ra, a1, 553
                  divu         a2, s11, a4
                  fsqrt.s      fs7, fa5
                  fmax.s       fs2, fs4, fs9
                  fsqrt.s      ft4, fs2
                  srl          t3, t3, a2
                  rem          s3, t0, t1
                  divu         a6, a4, s3
                  slti         t2, t4, 78
                  srai         a6, t3, 27
                  feq.s        s10, fa2, fs11
                  feq.s        s6, fs1, ft1
                  divu         t0, a0, a7
                  mul          a3, s8, a5
                  mulh         a1, s1, a6
                  addi         ra, s11, -558
                  srli         s7, a1, 23
                  and          t3, a7, a1
                  fcvt.s.wu    fs1, a0, rtz
                  slli         s9, t4, 18
                  fadd.s       fs2, ft4, fs9, rdn
                  addi         a1, t3, -498
                  mulhsu       zero, s3, t0
                  fadd.s       ft2, fs6, ft11
                  auipc        a6, 114120
                  fmin.s       ft4, fs10, fa6
                  fadd.s       ft2, fa0, ft8, rtz
                  srai         gp, a1, 31
                  fsqrt.s      fs2, ft4, rdn
                  or           s4, s0, s4
                  srai         a0, zero, 1
                  fcvt.wu.s    a5, fs11
                  sub          gp, a4, a7
                  fmax.s       fs4, ft0, fs2
                  fadd.s       ft0, fa5, fa0
                  fmv.x.w      s3, fa7
                  rem          s6, s2, a5
                  fsgnj.s      fs5, ft6, ft10
                  sltiu        s7, t1, -1251
                  or           gp, s1, s1
                  addi         a2, t0, -330
                  fmv.w.x      ft9, s6
                  auipc        s9, 873648
                  slt          tp, a2, s2
                  fsgnjx.s     fa1, fs6, fa6
                  flt.s        a7, fa6, ft9
                  remu         gp, s4, tp
                  ori          a5, a4, -1520
                  fcvt.s.wu    fa0, t0
                  fcvt.s.wu    fa3, t4
                  sll          t2, t0, s6
                  lui          s4, 555513
                  srli         gp, tp, 12
                  mulhu        t2, s3, a1
                  fsgnjx.s     fs10, fa7, fs10
                  mulh         a3, a2, s11
                  slli         s4, s8, 11
                  fsgnj.s      fs8, fa5, ft6
                  fsgnj.s      fa4, ft8, fs9
                  fcvt.s.w     fs9, s3, rdn
                  andi         s9, s7, 950
                  lui          a6, 260933
                  or           gp, s7, a3
                  srl          s0, t4, s8
                  auipc        zero, 23137
                  fmul.s       fa6, fa5, ft2, rup
                  sub          sp, t1, zero
                  fmul.s       fs9, ft7, ft1
                  srai         ra, s5, 24
                  sll          a1, t2, s9
                  fsgnj.s      fs0, ft6, ft7
                  srli         t2, a3, 1
                  fcvt.wu.s    sp, fs10, rmm
                  fadd.s       ft4, fs6, fs6, rmm
                  addi         s7, s8, -1322
                  divu         s8, t0, t0
                  feq.s        s6, fs8, fs3
                  slti         s2, s5, -1647
                  add          t2, s3, s11
                  fsub.s       fa7, ft2, fa4, rne
                  fmax.s       fa5, fa2, ft2
                  and          a6, s10, t5
                  fsgnjn.s     fs10, fs7, ft1
                  fcvt.s.wu    fs10, s4, rdn
                  or           s5, s5, t1
                  slt          a3, s7, s11
                  feq.s        a6, ft2, ft8
                  lui          t1, 265681
                  mulhsu       a0, t4, ra
                  nop
                  slli         s2, t4, 13
                  remu         zero, gp, s4
                  sltu         a2, a0, s5
                  fcvt.s.w     ft5, s11
                  andi         zero, a5, 417
                  fmin.s       fs7, fa0, fa6
                  xori         s7, a6, 957
                  mulhu        a1, a2, ra
                  fcvt.s.w     fs1, s8
                  fsgnjn.s     fs8, ft10, ft6
                  mul          a1, a6, a7
                  fclass.s     a6, fa7
                  mul          s8, a4, s10
                  fadd.s       fs4, fa3, fs6
                  slti         sp, tp, -1558
                  nop
                  fcvt.s.wu    ft11, ra, rmm
                  xor          zero, t4, zero
                  srai         s1, s10, 17
                  fsub.s       ft2, ft10, fs8
                  slti         sp, s8, -1534
                  fsgnj.s      ft0, ft10, fs8
                  nop
                  sltu         s3, s5, s9
                  rem          s11, s6, s6
                  fsgnjn.s     fs0, ft10, fs2
                  sra          tp, t5, a2
                  fmv.x.w      s4, fa5
                  xor          a0, s2, t0
                  fcvt.w.s     a2, ft7, rmm
                  srai         t4, s8, 0
                  mulhu        gp, t1, s5
                  auipc        t3, 810589
                  fcvt.wu.s    a2, fs2
                  slt          sp, a4, s3
                  xori         s11, a4, -832
                  feq.s        s6, fa2, fs9
                  srl          a5, s10, s3
                  fsgnjx.s     fs1, fa0, fs4
                  divu         tp, a2, s0
                  addi         a2, s5, -1092
                  auipc        s5, 174563
                  srai         s8, s7, 28
                  ori          t2, t5, 1793
                  fadd.s       fs7, fs6, ft1
                  fle.s        s6, fa7, fa7
                  fcvt.s.w     ft1, t4
                  fmul.s       ft3, fa0, ft7, rup
                  fmul.s       fa5, ft8, ft9
                  fcvt.s.wu    fa7, a6
                  fle.s        ra, ft0, fs7
                  slti         ra, gp, -274
                  div          s0, t4, t5
                  remu         a7, t6, s6
                  mulhu        s11, s0, t2
                  fcvt.wu.s    t3, fs2
                  auipc        s0, 646359
                  slt          a7, s4, a6
                  mulh         s11, s5, s9
                  fcvt.s.w     fa6, s10
                  fsgnjx.s     ft1, fa2, fa0
                  ori          s0, t5, 790
                  srl          s10, a3, s6
                  mulh         sp, t1, a3
                  fcvt.wu.s    a7, fs8, rmm
                  xor          s4, s8, zero
                  srai         s1, t6, 29
                  fmul.s       fa7, fa4, fs10
                  feq.s        a2, ft2, ft5
                  rem          s6, s1, a2
                  auipc        t0, 508293
                  mulhu        a7, ra, sp
                  fsgnjx.s     fs4, ft8, fs11
                  ori          s5, ra, -93
                  flt.s        s1, fa6, fs4
                  sub          a1, s10, t1
                  mul          s10, s6, a2
                  auipc        s9, 151875
                  slt          tp, a0, sp
                  fsgnjn.s     fs8, fa5, ft3
                  div          tp, s9, t2
                  fsqrt.s      ft3, fa6, rup
                  flt.s        t4, ft3, ft4
                  sltiu        t3, s10, -669
                  sltiu        s2, ra, -125
                  ori          s5, a1, -313
                  fmin.s       fs3, ft11, fs7
                  sltiu        s2, s11, -538
                  flt.s        s3, fs6, ft5
                  addi         s7, t5, 1063
                  fcvt.wu.s    tp, fs11
                  slti         a0, s1, 1556
                  sll          s2, a3, s8
                  fsgnjn.s     fs0, fa1, fa1
                  feq.s        s4, ft11, fa3
                  slli         s2, tp, 20
                  fmv.x.w      s7, fa3
                  fcvt.s.w     fs11, t4, rmm
                  addi         sp, a1, 1417
                  slt          a2, s8, a7
                  div          s5, s5, t4
                  fmin.s       fs6, fa3, ft9
                  auipc        s2, 578131
                  fmv.w.x      fs3, t6
                  rem          s6, a5, s7
                  divu         gp, tp, t3
                  flt.s        s9, fa6, fs8
                  div          s9, t6, s7
                  sll          gp, s10, s3
                  and          a1, a5, a1
                  lui          t3, 831718
                  fsgnjn.s     fs7, fa1, fs7
                  sra          s7, t4, t6
                  andi         gp, gp, -1018
                  fmul.s       fs6, fa5, fs6
                  mul          a5, s10, t5
                  flt.s        s3, fs10, ft8
                  fsgnj.s      fs8, fa0, fs6
                  srai         t4, s4, 23
                  sll          sp, s6, s2
                  fcvt.w.s     t3, fs7, rmm
                  fclass.s     a5, ft11
                  srli         t2, s7, 20
                  fadd.s       fs2, ft4, ft10, rmm
                  slt          s8, s1, ra
                  fmv.x.w      a5, fs0
                  fmax.s       fs1, fs6, ft0
                  fmv.x.w      t4, fs4
                  fmin.s       ft4, ft8, ft8
                  ori          s2, s1, -1404
                  xor          a1, t5, a2
                  slti         gp, s7, -1998
                  mulhu        t3, s3, s9
                  andi         a6, t5, 526
                  ori          a3, gp, -616
                  fsub.s       fs11, ft2, ft0
                  fsgnj.s      fa2, fa2, ft7
                  fcvt.wu.s    a7, ft0
                  lui          s1, 542235
                  ori          s7, s3, 1338
                  fmv.w.x      fa1, tp
                  fsqrt.s      fa6, ft7
                  add          s11, t6, a7
                  sll          s6, a2, s11
                  mul          a2, t5, s10
                  flt.s        s10, ft4, fs1
                  srli         zero, t1, 27
                  fmin.s       fs6, ft6, fs6
                  fsqrt.s      ft3, ft9
                  fle.s        t0, fs2, fs7
                  fle.s        gp, fs9, ft4
                  fle.s        a0, fa0, fs11
                  nop
                  fcvt.wu.s    t0, fs0, rmm
                  fmv.w.x      ft5, a3
                  mulhsu       s0, s8, t1
                  sra          s1, s7, s6
                  ori          gp, s1, -1397
                  fcvt.s.w     ft11, t3
                  andi         s7, s4, 184
                  andi         s9, s4, 49
                  rem          gp, s0, s10
                  srli         s8, a0, 15
                  feq.s        s2, fs4, fa7
                  auipc        a0, 983630
                  mul          s10, s0, a7
                  lui          s2, 681169
                  mulhsu       s11, a1, ra
                  fsgnjn.s     fa4, ft1, ft2
                  add          a6, a5, a0
                  fsgnj.s      ft2, fs3, fa1
                  sub          t2, tp, s7
                  slti         a5, gp, -760
                  auipc        s6, 610002
                  mulhsu       s10, s7, t0
                  auipc        zero, 489299
                  auipc        s10, 440662
                  fsgnjn.s     fs7, fs9, fs5
                  fcvt.wu.s    a6, fs2
                  andi         t2, a5, 663
                  xor          s5, s5, s7
                  sub          t3, s8, s7
                  fsub.s       fs1, ft10, fa0, rtz
                  fmin.s       fa4, fs3, ft10
                  ori          t1, s5, 232
                  remu         s2, ra, s1
                  xori         a5, t4, 873
                  rem          a0, s8, s10
                  fmv.x.w      gp, ft8
                  and          s9, t4, s5
                  fcvt.s.wu    ft10, s10
                  fsub.s       fs2, fa7, ft0
                  fsgnjx.s     fs7, fa5, fs10
                  divu         s2, zero, s3
                  slli         t1, s3, 28
                  slt          sp, s9, gp
                  sub          s4, s10, gp
                  flt.s        a0, fs6, fs3
                  or           t2, t4, t2
                  auipc        a0, 925053
                  div          s9, a2, s7
                  lui          t1, 637850
                  fsgnjx.s     fs10, ft1, ft9
                  fmin.s       fa0, ft5, ft5
                  nop
                  rem          s1, s11, s1
                  fsub.s       fs4, fa0, ft6
                  fsgnjx.s     fs4, fa6, fa6
                  auipc        sp, 780337
                  add          ra, s2, s3
                  andi         a6, a6, 1346
                  fclass.s     s11, fa6
                  feq.s        a1, ft2, fa0
                  sub          s7, s10, s3
                  fsqrt.s      fa4, fs0, rne
                  fdiv.s       ft10, fs4, fs8
                  sub          a1, a4, s5
                  lui          s2, 285591
                  fsgnjx.s     fs1, fs4, ft1
                  addi         s7, s10, -611
                  fmv.x.w      s11, fs11
                  slt          a3, s4, s10
                  rem          s0, s6, a2
                  srai         s6, s5, 18
                  fmul.s       fa4, ft11, fa5, rtz
                  fdiv.s       ft1, ft4, fa1, rmm
                  mulhsu       ra, sp, s6
                  mul          a1, t5, t3
                  sub          s7, ra, s8
                  sltu         s2, s8, t3
                  addi         tp, s2, 2022
                  srl          s9, a6, a1
                  mul          s11, ra, ra
                  slt          t1, t3, t0
                  fmv.x.w      a0, ft6
                  fsgnjx.s     fs8, fs0, fs2
                  slti         s3, t5, 1558
                  fsub.s       ft1, ft5, fa1, rup
                  div          s7, s3, t6
                  mulh         s6, a5, s4
                  mulhu        a3, s0, s2
                  mulhsu       sp, s4, s4
                  rem          a5, s4, ra
                  fsub.s       ft1, fa6, ft7, rne
                  mul          t2, s8, t6
                  auipc        s9, 683495
                  lui          s3, 988925
                  or           s10, s6, s0
                  mulhu        t1, s4, sp
                  fmul.s       ft8, fa4, fs6
                  fsqrt.s      fs9, ft9, rtz
                  rem          s8, s8, t4
                  fcvt.w.s     a0, fs9
                  fsgnjx.s     ft7, fs7, ft6
                  sltiu        tp, s6, 1606
                  sll          a3, ra, gp
                  sltu         s7, t2, t3
                  fdiv.s       ft8, fs10, ft7, rmm
                  fclass.s     s5, ft6
                  mulhu        s8, s7, s10
                  lui          s9, 276714
                  fmv.w.x      ft9, a1
                  fcvt.w.s     t4, fa7, rne
                  srl          t1, t0, s11
                  slt          a5, s3, a2
                  fsgnjn.s     fa5, fs8, fa1
                  fsgnjn.s     fa1, ft1, fa5
                  fclass.s     t4, fa7
                  add          tp, t5, a5
                  rem          s10, s8, t3
                  mulh         s8, s7, s0
                  divu         a3, zero, t5
                  fmv.x.w      s4, fs0
                  fmin.s       ft11, fa1, ft7
                  fcvt.w.s     gp, fs11
                  fdiv.s       ft2, ft8, fs6
                  fsgnjn.s     fa4, fs5, ft8
                  sra          t0, t6, s9
                  fcvt.wu.s    s4, fa4, rne
                  srl          zero, zero, s9
                  rem          s6, s0, s9
                  fclass.s     sp, fs10
                  fle.s        a6, fs10, ft8
                  sra          zero, t1, a2
                  flt.s        a5, ft9, ft10
                  fmin.s       ft8, fs10, ft3
                  sub          t0, t0, a3
                  fmv.w.x      ft7, zero
                  slli         t3, s10, 15
                  fdiv.s       fs4, fs4, fs11
                  sltiu        t1, s7, -1359
                  srli         s0, a0, 2
                  mulh         s11, s8, t5
                  sll          a7, a6, t2
                  slti         a3, a6, 54
                  or           sp, s3, s3
                  fsgnj.s      fs4, fs9, fs1
                  feq.s        s8, ft7, fs3
                  mulhu        t4, a5, ra
                  or           a7, zero, s9
                  fadd.s       fa4, fs6, fa2
                  fsgnj.s      fs3, ft3, ft0
                  fmv.x.w      t2, fs10
                  slt          a7, s8, s7
                  fsqrt.s      fa6, fa1
                  auipc        zero, 770864
                  fsgnjx.s     fs6, fs6, fs9
                  slt          s3, s4, s9
                  andi         a0, s2, -1742
                  remu         a0, s7, s4
                  fsub.s       fs4, fs3, ft2, rdn
                  fmv.x.w      s4, fa1
                  srai         t4, a2, 24
                  nop
                  or           s9, s9, sp
                  fsqrt.s      ft4, ft4, rtz
                  fmin.s       fa1, ft3, ft6
                  fadd.s       fa7, ft11, fs1, rtz
                  fmin.s       fa7, fa7, ft5
                  div          s10, s0, t4
                  fcvt.w.s     ra, fa5, rtz
                  sll          s2, s9, s11
                  slti         s10, s7, -607
                  auipc        s5, 245249
                  sltiu        s3, a7, -1820
                  nop
                  sltu         zero, a7, a0
                  mulhsu       s11, a3, s2
                  fmin.s       fa2, ft6, fs7
                  slt          s8, sp, t2
                  mulhsu       s7, s8, t2
                  sll          s8, t2, tp
                  xor          s5, t0, s8
                  mulhsu       gp, s8, s2
                  mulh         s0, s3, ra
                  fdiv.s       fs4, ft9, ft3
                  remu         s3, a0, a2
                  fmax.s       ft3, ft2, fs5
                  xori         s8, a0, -1770
                  fclass.s     t1, fa4
                  auipc        s10, 735587
                  nop
                  fsgnjn.s     fa4, ft9, fs6
                  auipc        sp, 719961
                  mulh         a6, sp, s11
                  fclass.s     s6, fs6
                  fsgnj.s      fs8, ft6, fa1
                  sra          t3, s7, s5
                  fmul.s       ft1, fs6, ft2
                  fclass.s     s1, ft8
                  fcvt.s.w     ft11, zero
                  addi         a1, a6, -264
                  andi         gp, s9, 412
                  remu         s0, a5, t5
                  ori          s3, t3, -952
                  ori          gp, ra, 1429
                  fsgnjx.s     fa3, ft8, fa7
                  fle.s        tp, fs5, ft10
                  fcvt.wu.s    a7, fa5
                  flt.s        s0, ft10, ft7
                  fmv.w.x      fa7, s9
                  fclass.s     t4, fa3
                  fcvt.s.wu    fa3, s6, rtz
                  andi         s11, sp, 270
                  slti         t0, s1, 1747
                  fle.s        s6, ft3, fs11
                  or           gp, t5, s9
                  addi         s6, t6, -599
                  and          a5, a2, a3
                  srl          tp, s5, a6
                  ori          s2, s6, 187
                  sltu         s7, t0, a4
                  sltiu        a7, s8, 895
                  sub          s6, a5, s0
                  fdiv.s       ft8, ft4, fs2
                  fmv.x.w      s10, fa1
                  fdiv.s       ft9, fs0, fa1, rdn
                  fmv.x.w      ra, fs0
                  mul          gp, a7, a2
                  div          s7, zero, a5
                  addi         t4, t3, 162
                  flt.s        a2, fs0, fs2
                  mul          t3, s0, s9
                  sll          a6, s11, s6
                  xor          s11, t0, a0
                  slti         s7, s5, 186
                  nop
                  fsub.s       fa0, fs2, fs10, rtz
                  fsub.s       ft6, fs9, fs3
                  fcvt.w.s     zero, fa0
                  xor          a3, t5, a2
                  fmax.s       fa7, fa0, ft0
                  mul          a1, a7, s11
                  sltu         s4, s1, a4
                  srli         gp, s4, 6
                  or           t1, s0, a0
                  addi         s9, zero, -613
                  sltu         sp, s9, a3
                  fclass.s     t2, fs5
                  fmin.s       fs3, ft5, ft3
                  slti         sp, s11, -889
                  fcvt.s.w     fs5, sp
                  feq.s        s0, ft1, fs7
                  fmul.s       fs9, ft3, fa7
                  fclass.s     zero, ft1
                  mulhu        s10, t2, s6
                  srli         a5, s8, 25
                  or           s8, tp, s0
                  slti         t2, ra, 497
                  sltu         t4, a5, s0
                  fdiv.s       fa2, fs8, fa0, rup
                  sltiu        a1, s10, 310
                  fmin.s       ft7, fs4, fs10
                  mulh         tp, a1, t0
                  slli         t0, a6, 26
                  fsub.s       fs2, ft10, fs2, rmm
                  fcvt.wu.s    s11, fa7
                  srl          a5, t1, s3
                  srl          ra, t2, s10
                  xori         s7, s7, -1493
                  fsgnjx.s     fa1, fa5, ft3
                  fmin.s       fa5, fs6, fs6
                  fmv.x.w      s6, fs1
                  slt          t4, a7, t5
                  or           a3, a0, s6
                  fsub.s       fs5, fa5, fs2, rdn
                  fadd.s       fs3, fs5, fa7
                  fclass.s     zero, ft9
                  add          s3, s0, a6
                  ori          a1, t3, -556
                  fmul.s       ft7, fa0, ft4
                  addi         t1, zero, 1919
                  and          s11, a1, s11
                  mulhsu       s9, s8, s2
                  srai         a2, s0, 14
                  fclass.s     ra, fa0
                  feq.s        t3, ft2, ft4
                  fcvt.w.s     s7, fs10, rup
                  rem          tp, gp, s8
                  slti         a3, s11, -1948
                  slti         a3, s5, -1263
                  srai         sp, s7, 31
                  add          gp, sp, t1
                  fcvt.w.s     s9, fa7
                  sltu         ra, t5, a1
                  slli         ra, a4, 24
                  srl          t4, s9, tp
                  mulhu        a6, s2, s11
                  fmv.w.x      fs0, s11
                  and          s2, s8, t5
                  remu         a6, a7, s4
                  mulh         zero, a6, a5
                  mulhsu       s8, t1, t2
                  addi         s1, gp, 1552
                  sub          s8, s4, s8
                  slti         s1, a6, -1715
                  divu         t4, a5, t2
                  fadd.s       ft9, ft10, fs10
                  fadd.s       fs2, fs10, ft11
                  flt.s        t0, ft1, fs5
                  fsub.s       fs5, fs6, ft1, rmm
                  fmv.x.w      s10, fs10
                  sltiu        s11, s6, -609
                  nop
                  ori          a2, t2, -1631
                  srl          s0, s6, a5
                  fcvt.wu.s    s1, fa1, rmm
                  fmax.s       fa6, fa4, fa7
                  fcvt.s.w     ft10, t6
                  feq.s        s3, fs5, fa3
                  fcvt.s.wu    ft8, t1, rtz
                  sltu         ra, a0, s3
                  auipc        s9, 558204
                  fsub.s       fs2, fs8, ft9, rne
                  auipc        s3, 836083
                  fsqrt.s      ft7, fa2
                  fcvt.s.wu    fs2, gp, rup
                  sll          a0, t1, a1
                  slli         t3, a4, 4
                  sub          s6, t4, s8
                  fmul.s       fs2, ft10, fs4, rdn
                  sltiu        s9, gp, -1601
                  and          s10, s3, a5
                  ori          t2, t3, -1077
                  sltu         s5, t2, t3
                  mul          s6, sp, s7
                  fsgnj.s      ft3, fs10, fs9
                  fcvt.wu.s    a1, fa3, rne
                  sra          s1, sp, a6
                  sltu         s8, a2, s9
                  fsgnjx.s     ft6, fs8, ft3
                  fsgnjn.s     fs10, ft1, fa5
                  fsgnj.s      ft10, fs3, ft6
                  fmul.s       ft9, ft11, fs6
                  mulhsu       sp, a3, ra
                  fsgnjn.s     ft5, ft5, fs8
                  fdiv.s       ft4, fs8, ft4, rne
                  mulhu        a5, t0, t4
                  fsub.s       ft7, fs8, fs11, rdn
                  fcvt.s.w     fa7, s9, rne
                  slt          t0, s8, s7
                  add          s7, ra, s6
                  mul          t3, zero, tp
                  fcvt.wu.s    s2, fs2
                  sub          ra, t2, t1
                  sll          t1, s10, s10
                  slt          s0, s2, t4
                  fsub.s       fs5, fs8, fs0
                  sltu         s11, t1, t6
                  fcvt.s.wu    fa5, s1
                  andi         s4, s6, 1263
                  div          s1, s0, a1
                  fle.s        a2, fs11, fs11
                  xor          s2, a1, ra
                  fsgnj.s      ft4, fs5, fs9
                  srli         s7, t5, 0
                  mulhsu       a3, t5, s8
                  mulhu        a6, s5, t2
                  fsgnjn.s     fa7, fa0, ft11
                  fmax.s       fa3, fa3, fa6
                  fcvt.w.s     s9, fs8, rtz
                  fcvt.w.s     a1, ft2, rup
                  sll          s1, a2, s2
                  sub          s2, s0, sp
                  fsgnjn.s     ft6, fa7, ft9
                  fsqrt.s      fa6, ft5, rup
                  fclass.s     s5, fs7
                  feq.s        a6, fs6, ft6
                  fdiv.s       fs11, fs7, ft8, rup
                  fsgnj.s      ft7, fs1, ft4
                  fmax.s       fs6, ft2, ft4
                  slti         t4, a1, -353
                  fsgnjx.s     ft4, fa0, fs3
                  fsgnjx.s     ft9, ft11, ft6
                  fmul.s       ft10, fa2, ft3
                  auipc        zero, 540908
                  fcvt.w.s     a3, fs0, rne
                  fcvt.w.s     ra, fs6, rmm
                  srai         tp, a6, 10
                  andi         s8, sp, -1121
                  mul          s8, a1, a3
                  fmul.s       ft4, fa2, fs10
                  fsqrt.s      fs6, fa5
                  add          s8, ra, s4
                  xor          s11, a0, a1
                  fsgnj.s      fs10, fs2, fs1
                  fmv.w.x      ft2, s2
                  div          tp, a3, a2
                  add          s3, s1, s2
                  add          s6, t1, s3
                  fcvt.s.wu    ft4, s9
                  mul          s8, zero, s9
                  srai         s5, t5, 23
                  fcvt.w.s     gp, ft11
                  or           s1, s3, a0
                  fmv.x.w      a6, ft6
                  fmin.s       fa0, ft3, fs6
                  remu         s8, s7, t6
                  fsqrt.s      ft11, fa1
                  flt.s        sp, fa4, ft1
                  fcvt.wu.s    t0, ft0, rup
                  fcvt.wu.s    tp, fs2
                  slli         s11, t5, 15
                  andi         s11, a1, 144
                  ori          a7, a7, -919
                  lui          a5, 808411
                  fle.s        a7, fs7, fa6
                  fsqrt.s      fa3, fa0, rdn
                  mulh         t4, s11, a0
                  auipc        s4, 10230
                  mulhsu       s0, t0, t5
                  sll          s11, s2, gp
                  fsgnj.s      ft8, fs4, ft11
                  fmv.x.w      t1, ft9
                  andi         s7, a7, -55
                  add          a2, a0, t0
                  fcvt.wu.s    s0, ft5
                  xor          zero, a6, s2
                  fmin.s       fs10, ft2, fa1
                  andi         s5, a6, 122
                  fclass.s     s3, fs9
                  feq.s        t0, fs0, fa4
                  xor          s9, tp, tp
                  fmv.x.w      ra, fa1
                  fdiv.s       ft5, fa3, ft8
                  fcvt.s.wu    ft2, s3, rne
                  div          tp, s9, s2
                  fsqrt.s      fs7, fa4
                  rem          s7, tp, sp
                  fcvt.wu.s    a2, fs2, rtz
                  fsqrt.s      ft2, fs2
                  fmv.x.w      t1, ft7
                  fcvt.wu.s    zero, fa4, rdn
                  fsgnj.s      fa5, ft0, fs8
                  sra          t3, s1, sp
                  ori          gp, a6, 602
                  fle.s        a1, ft0, fs1
                  fmin.s       ft2, fs8, ft6
                  sra          s5, s6, t1
                  and          a1, s8, s6
                  fclass.s     s3, ft8
                  mul          a6, s8, s4
                  fsub.s       ft7, fa6, fs2
                  auipc        s1, 290179
                  fcvt.s.wu    fs1, s8, rup
                  fclass.s     s2, fa1
                  srli         a5, a3, 27
                  sra          s8, s7, s5
                  srai         s10, s3, 10
                  fdiv.s       fa1, fa4, fs10, rup
                  mul          s11, s2, s5
                  rem          s3, a2, a1
                  sub          s4, a1, s8
                  fsgnj.s      ft9, fs6, fs0
                  fsqrt.s      fa4, ft0
                  sub          t0, s9, t3
                  sll          a7, a2, s3
                  xori         a0, s3, -1749
                  fcvt.s.wu    fa3, s0
                  fcvt.w.s     s4, fs11
                  andi         a2, a0, 2012
                  fmax.s       fs1, ft3, fs9
                  fsgnj.s      ft10, fa5, ft6
                  add          s5, s7, a5
                  fclass.s     t3, fs11
                  fmin.s       fs5, ft7, ft10
                  sll          a2, zero, a7
                  and          t3, a6, a6
                  mul          t4, a0, sp
                  andi         s11, a7, -1332
                  slti         s8, s3, -1334
                  slli         ra, t3, 1
                  fsgnj.s      fs11, fs9, fa7
                  srl          a5, a6, s11
                  flt.s        t2, fs5, ft2
                  addi         s7, a3, 2011
                  fsqrt.s      fa6, fs3, rne
                  slt          sp, t2, zero
                  add          gp, s7, t1
                  srli         s8, t5, 23
                  or           a2, zero, a1
                  sltiu        s3, s11, -1204
                  fcvt.s.w     fs9, ra, rmm
                  mul          t4, t3, s2
                  xori         s7, t6, -488
                  mulhsu       s4, s8, t3
                  xori         a1, s11, -1378
                  sub          s7, s7, s9
                  fcvt.s.wu    fa5, a4, rup
                  mulhsu       a1, a1, a4
                  rem          t2, tp, a4
                  xori         s3, a6, 2008
                  fadd.s       fa6, fs9, fa5, rtz
                  fsqrt.s      fa0, fa3
                  xor          s10, a0, a4
                  fsgnj.s      fs6, ft9, ft1
                  add          t4, a1, s2
                  fsub.s       fa3, ft10, fs10
                  mul          t2, a5, s6
                  fcvt.wu.s    t3, ft4, rup
                  mulhu        a3, t2, t4
                  slti         zero, s8, 135
                  fsgnj.s      fs1, fa3, fa0
                  mul          s3, s1, a5
                  fcvt.s.wu    ft7, s11
                  andi         a6, a1, -1649
                  slt          s0, s11, a0
                  andi         gp, t3, 1219
                  slli         t2, gp, 30
                  xor          a3, t5, a6
                  slti         t0, a2, -335
                  mulhsu       t3, s6, t3
                  fsgnjn.s     ft0, ft3, fs3
                  remu         s0, s11, t2
                  fcvt.s.wu    fs7, s8, rdn
                  mulh         gp, t3, t5
                  addi         gp, a4, -320
                  fdiv.s       ft5, fs3, fs5
                  fcvt.s.wu    fs6, a4, rup
                  fsub.s       ft5, ft6, fs2
                  add          a7, a5, s7
                  xor          a6, s11, s11
                  fmul.s       fa0, ft5, fs1, rmm
                  fclass.s     s9, fs6
                  feq.s        ra, fa2, fa6
                  xor          s1, s1, gp
                  srai         zero, tp, 5
                  fsgnj.s      ft11, ft8, ft10
                  sub          s6, a6, a1
                  nop
                  fsub.s       ft5, fa0, fa7
                  add          t2, tp, s3
                  nop
                  fle.s        a3, fs6, fa3
                  add          s7, s8, s3
                  nop
                  or           s10, s5, s1
                  srai         a2, a0, 29
                  lui          sp, 299310
                  sltu         t4, s1, s0
                  or           a3, sp, gp
                  and          gp, tp, tp
                  lui          t2, 276196
                  slt          s0, a4, t3
                  fsqrt.s      fa5, ft8, rmm
                  slli         t2, a2, 14
                  xor          s4, s7, a3
                  sll          a2, a7, t4
                  lui          a3, 48620
                  srli         gp, t3, 4
                  add          tp, s7, sp
                  lui          s5, 580388
                  fsgnjx.s     fa0, fs3, fs2
                  fsqrt.s      fa5, fa1, rtz
                  remu         s2, s9, s10
                  fmv.w.x      ft8, t3
                  feq.s        a0, fs3, fa3
                  fmax.s       ft4, fs2, ft4
                  auipc        a6, 266719
                  slt          t1, tp, t6
                  srai         t3, a1, 5
                  fcvt.w.s     a3, ft1, rtz
                  fsqrt.s      fa4, fs11
                  fclass.s     a5, fs5
                  srai         s4, t6, 28
                  fmv.x.w      s9, fs9
                  nop
                  remu         s2, t0, s6
                  fmv.x.w      s0, fs7
                  xor          s8, sp, t1
                  flt.s        s3, ft1, fs6
                  fdiv.s       fs7, fs3, ft0
                  fcvt.s.w     fa2, a4
                  fcvt.wu.s    a1, fa0, rmm
                  fadd.s       fa2, fs4, fs1
                  ori          sp, s0, -1418
                  ori          s11, t1, -656
                  addi         s10, a6, 708
                  mul          s11, sp, gp
                  and          s0, s7, s6
                  fcvt.s.wu    ft4, a5, rmm
                  mul          s0, sp, s10
                  sltu         gp, a7, s4
                  fsub.s       fs7, fa2, fs3
                  fclass.s     s9, fa7
                  mulhsu       s8, tp, tp
                  fsgnj.s      fa4, ft0, fa4
                  andi         s7, t5, -291
                  fle.s        s3, fs6, ft9
                  srai         s9, s4, 24
                  fcvt.wu.s    a1, fa4
                  fmv.w.x      fs2, t0
                  sll          s8, tp, s11
                  divu         t0, a4, sp
                  feq.s        s2, fs7, ft1
                  flt.s        a5, fa5, ft11
                  fmul.s       fa3, fs9, fs9, rup
                  fle.s        a1, fa1, fa1
                  div          a1, ra, sp
                  xor          s0, a7, s5
                  fmin.s       fs8, fa2, fa7
                  fsgnjx.s     fa3, ft7, fs11
                  srai         sp, s1, 0
                  fsqrt.s      fa5, fs7, rup
                  div          sp, sp, s1
                  addi         zero, a7, 1289
                  sra          s2, a6, gp
                  fsgnjn.s     ft6, ft0, ft2
                  fsgnjn.s     fa0, fa1, fa6
                  divu         sp, s2, s6
                  fsqrt.s      ft3, fs1
                  feq.s        s1, ft7, fa6
                  divu         s11, sp, a3
                  nop
                  mulhu        a0, s1, s7
                  fcvt.s.wu    fs1, a7, rdn
                  ori          ra, a7, 403
                  div          a7, t5, s9
                  sra          a2, gp, s4
                  srli         s5, t5, 4
                  fmv.w.x      ft0, tp
                  fcvt.w.s     a0, fa3, rne
                  flt.s        t4, fa0, ft10
                  mulh         a2, a6, gp
                  ori          a2, s4, -900
                  addi         a7, s8, -796
                  fsgnjn.s     fa7, ft11, fa0
                  xor          s3, s5, s11
                  srli         a2, a2, 9
                  fle.s        s4, fa4, ft5
                  slli         a7, t1, 15
                  fsub.s       fs2, fa7, fa1
                  addi         t2, zero, -219
                  fclass.s     s9, fa4
                  ori          s8, a0, -688
                  sra          s7, s5, s11
                  ori          t0, a5, -1568
                  mulhu        zero, t4, s2
                  fsqrt.s      ft3, fa3
                  auipc        s11, 908830
                  slti         s11, a4, 716
                  nop
                  lui          s7, 171323
                  sub          sp, s10, s3
                  fadd.s       fs5, fa5, fa0, rne
                  srli         a1, zero, 4
                  lui          s2, 286711
                  srl          a3, a6, t0
                  add          s3, s9, s2
                  fcvt.w.s     t3, fs2, rdn
                  fadd.s       ft6, fa3, ft0, rmm
                  or           a3, s3, s9
                  sub          a6, tp, t4
                  flt.s        zero, ft8, fs8
                  remu         gp, a1, t1
                  fcvt.s.w     fs9, s7, rne
                  fmax.s       fs1, fs3, fs5
                  flt.s        tp, fa2, fa3
                  or           zero, zero, t1
                  sltu         s8, gp, s8
                  and          t1, a6, s9
                  auipc        t4, 756794
                  srli         gp, s4, 12
                  slti         s3, s11, -1201
                  add          t4, s3, t3
                  nop
                  mul          t0, t2, t3
                  srai         s9, t2, 15
                  fadd.s       fa6, fs10, ft11, rmm
                  srli         s10, zero, 18
                  sltiu        s2, s10, -1166
                  remu         a2, t6, t2
                  xori         s7, a0, 119
                  srli         s1, s2, 25
                  mulhsu       s10, a5, t1
                  sltu         s8, s0, a6
                  slt          s2, a7, a4
                  mulhu        s5, gp, ra
                  slli         s7, s8, 5
                  fsub.s       fs8, ft11, ft3, rdn
                  fmul.s       fs2, ft10, ft0, rne
                  slt          s4, sp, s6
                  slt          a0, s8, a6
                  fcvt.wu.s    t2, fa5, rtz
                  slt          a0, a7, a1
                  mulh         t1, t4, a1
                  auipc        a2, 201649
                  addi         sp, zero, 561
                  rem          t1, a2, a3
                  fsgnj.s      ft8, fa2, fs5
                  fcvt.s.wu    ft2, a6
                  fmv.x.w      t1, ft8
                  slti         t2, a3, 1170
                  lui          a2, 3277
                  rem          a0, a4, s7
                  auipc        s1, 868094
                  fmax.s       fs0, ft7, fs2
                  nop
                  fsgnjx.s     ft10, ft5, ft6
                  fcvt.s.wu    fa2, s5
                  fclass.s     s11, fa1
                  xori         s3, s11, -1928
                  fcvt.wu.s    ra, fa2
                  fdiv.s       ft4, ft5, fa0
                  fcvt.s.w     fs5, a5, rdn
                  flt.s        a0, fs11, fa6
                  remu         s7, sp, s4
                  fcvt.s.w     ft7, a0, rdn
                  fmv.x.w      a6, ft6
                  mul          s8, s11, tp
                  and          s5, a0, s5
                  fsub.s       ft7, fs4, fa5
                  fmv.w.x      ft11, tp
                  ori          a2, s4, -167
                  sltu         s0, s6, s7
                  flt.s        s5, fs10, fa4
                  fsub.s       fa5, ft8, fa6
                  add          a2, a0, sp
                  fdiv.s       fs9, fa4, fa3, rmm
                  slti         sp, gp, 160
                  fdiv.s       fs2, fs9, fs5, rne
                  mulh         s5, gp, s3
                  fsgnjn.s     fs3, ft0, fa7
                  feq.s        s1, fa7, ft1
                  slti         t3, s10, 1745
                  sra          s9, t1, sp
                  sltu         a6, sp, s4
                  fclass.s     s0, fs0
                  fcvt.s.wu    fa5, s8, rdn
                  fsqrt.s      fa6, ft3
                  xori         s6, t4, -1689
                  or           s11, zero, s3
                  fmax.s       fs6, fs0, fs3
                  slt          ra, a4, t4
                  rem          t3, t5, t5
                  fadd.s       ft1, fa2, fs8
                  lui          t2, 105448
                  lui          sp, 864497
                  fsgnjn.s     ft5, ft2, fs7
                  or           s6, zero, tp
                  sltiu        zero, a7, -466
                  rem          a1, t4, t5
                  xori         a5, t2, -1912
                  srl          t1, t4, s1
                  srl          s6, a0, t2
                  add          s3, t4, s5
                  and          t0, a7, s4
                  fadd.s       ft6, fa7, fa4
                  slti         a3, a5, 653
                  ori          s5, a3, -953
                  and          a3, t1, zero
                  fsgnj.s      fs9, ft8, fa0
                  divu         gp, a4, s5
                  fcvt.s.wu    fa0, t6
                  sub          s3, tp, s8
                  fcvt.wu.s    s6, fs3, rne
                  sll          a6, t5, a1
                  mulhu        sp, tp, a1
                  div          t3, gp, t4
                  fsgnjx.s     fs1, fs0, ft8
                  fmv.x.w      s10, fa4
                  fle.s        s6, fs4, fs3
                  remu         tp, tp, a5
                  fcvt.wu.s    a6, fs2, rup
                  sltu         t4, a0, a3
                  addi         gp, s3, 608
                  sll          t3, a0, t1
                  feq.s        a5, ft6, fs3
                  fsgnj.s      ft10, ft3, ft0
                  sltiu        s8, s5, -2047
                  sltiu        a3, s1, -446
                  remu         s11, s1, a2
                  mul          t0, t3, a1
                  sll          s1, a5, zero
                  fsqrt.s      fa7, ft3
                  fmax.s       fs3, fa0, fs10
                  mulh         t3, t3, t3
                  srai         s3, t6, 19
                  fsgnjx.s     ft10, fa1, fs11
                  fmv.w.x      ft0, s5
                  fsgnjn.s     fa0, fs10, fa5
                  fcvt.s.w     fa7, s2
                  ori          s1, ra, -1618
                  fle.s        a1, ft1, fs1
                  sltu         t0, t1, zero
                  mulhsu       s0, t4, s10
                  remu         s11, a1, s6
                  remu         s11, s11, s10
                  fdiv.s       fs0, fs4, ft6, rne
                  fdiv.s       ft6, ft5, ft5
                  ori          s11, t6, -487
                  slti         a6, s9, 1653
                  fsub.s       fs4, ft10, ft7, rne
                  div          s11, zero, a4
                  auipc        sp, 11274
                  fsgnjx.s     fa0, ft6, fs0
                  srai         a2, a5, 9
                  mul          gp, a6, s6
                  xor          s5, ra, gp
                  rem          zero, s0, tp
                  sll          ra, a2, gp
                  rem          s5, a1, t3
                  fdiv.s       fs11, fa4, ft4
                  add          s6, s1, t5
                  sra          a2, s2, t3
                  mul          s0, t2, t5
                  mulhsu       a0, s1, t5
                  fcvt.w.s     t0, fs4
                  fmv.w.x      fs10, tp
                  fcvt.s.w     fs3, a6, rtz
                  nop
                  flt.s        a2, ft2, fa3
                  srli         a3, s8, 11
                  fmin.s       ft5, ft6, ft8
                  fadd.s       fa1, ft1, fa2
                  add          gp, a3, s1
                  xori         a2, s2, 620
                  fsqrt.s      ft11, fs5
                  rem          s6, s3, t0
                  fmul.s       ft8, fs11, fs1, rtz
                  fadd.s       fs4, fa5, ft7
                  sub          t3, t5, t2
                  xor          sp, s11, s0
                  nop
                  fmax.s       ft7, ft1, ft9
                  fmv.x.w      s5, ft9
                  fcvt.s.wu    fs9, tp
                  fsgnj.s      ft4, ft10, fs5
                  sra          s3, a7, t0
                  remu         s8, a6, s10
                  fle.s        sp, fs4, ft10
                  fadd.s       fs11, fa1, fa3
                  add          s2, s0, s10
                  add          a2, a4, zero
                  fmax.s       ft6, ft1, ft8
                  sltu         s1, s4, t6
                  andi         tp, s8, 289
                  fcvt.s.wu    ft6, gp
                  lui          s0, 119226
                  fcvt.s.w     fs4, t2, rne
                  mul          s11, t5, s9
                  lui          s6, 745275
                  srl          t3, tp, t4
                  fmv.x.w      s10, ft8
                  xori         s1, a0, -1220
                  lui          t1, 428990
                  fsub.s       fa6, ft3, ft7, rne
                  fmv.w.x      fs0, t1
                  srai         a2, t0, 16
                  fmul.s       ft11, fa5, ft9, rup
                  srai         ra, zero, 18
                  slli         a3, zero, 26
                  srli         a7, s4, 8
                  divu         s9, gp, s5
                  srli         s3, a2, 6
                  add          zero, s9, a4
                  mulhu        a5, a2, gp
                  mulhu        a2, a4, s4
                  feq.s        a3, fa1, fa2
                  fcvt.w.s     t2, ft2, rup
                  sltu         a1, a5, s4
                  slti         s2, ra, 1676
                  remu         tp, a4, s5
                  divu         gp, s7, s5
                  sub          t3, s0, gp
                  sra          a5, t1, t5
                  fcvt.w.s     a3, ft1, rmm
                  fcvt.wu.s    ra, fs8
                  divu         s2, s10, a1
                  fmv.x.w      s4, ft8
                  rem          s4, t2, gp
                  mulhu        t3, a6, t6
                  and          a6, a3, t0
                  fmin.s       ft7, ft5, ft6
                  fsgnjn.s     fs0, fa1, fs4
                  sltiu        t3, a6, -1261
                  mulh         ra, s9, a1
                  fclass.s     s3, ft4
                  mulh         s8, a3, ra
                  fsgnjn.s     fs5, fs0, fs5
                  nop
                  sltu         s8, a5, s5
                  and          a5, t0, s10
                  flt.s        a3, fs2, ft11
                  fle.s        zero, fa6, fs11
                  sll          s2, a1, t6
                  sltiu        a0, ra, 1131
                  fclass.s     zero, fa2
                  xori         t3, s5, -1879
                  fdiv.s       ft9, ft7, fs2
                  fcvt.w.s     t2, fa6, rdn
                  fadd.s       ft9, fs4, fs11
                  fclass.s     a5, ft4
                  fsqrt.s      fs6, fs1
                  andi         a7, a3, 1897
                  fmax.s       ft9, ft4, ft3
                  srai         s3, t4, 7
                  sra          s6, zero, t1
                  div          sp, a6, t6
                  slti         a7, a1, -1811
                  srl          a3, s11, a7
                  fdiv.s       fs7, fa3, ft7, rne
                  srli         s9, a7, 16
                  fle.s        t4, ft8, fa2
                  fsqrt.s      fa5, fs0
                  or           sp, s1, s1
                  fmul.s       fa3, fa4, fa3, rmm
                  mulh         s3, s9, t4
                  mulhu        s9, s2, a2
                  flt.s        s6, fs11, fa6
                  fsqrt.s      ft4, fa3, rne
                  fsub.s       fa6, fs11, fs3, rtz
                  feq.s        s10, fa6, fs5
                  fsgnjx.s     ft5, fs1, fa3
                  fcvt.s.w     fa1, t1
                  fmv.w.x      fa5, zero
                  fdiv.s       ft3, fs10, fs6
                  fadd.s       ft4, ft0, ft0, rmm
                  xor          s11, s0, s9
                  srai         s10, a5, 23
                  mulhu        s5, tp, s10
                  nop
                  fcvt.wu.s    a5, fs11, rup
                  feq.s        s0, fs6, fs10
                  sll          s3, s3, s6
                  flt.s        s1, ft8, fa4
                  and          t1, s11, a1
                  slt          s9, s2, s8
                  slli         a5, a6, 18
                  nop
                  fsgnjx.s     fs11, ft8, ft10
                  fle.s        t2, fa6, fs9
                  srli         a5, s4, 8
                  fcvt.wu.s    s3, fs4
                  fmul.s       fa4, fs1, fs8
                  mulh         s4, a7, t6
                  srai         tp, tp, 16
                  or           s8, t6, t4
                  rem          s6, t1, zero
                  sub          a2, t6, ra
                  fsgnjx.s     fa1, ft9, fa7
                  sub          tp, a5, zero
                  fcvt.s.w     fs9, a2
                  mulhu        t1, t1, s6
                  fmin.s       fs2, ft2, ft7
                  slt          sp, a1, a2
                  ori          gp, t5, 1539
                  fsgnjx.s     fs6, fs10, ft5
                  or           sp, s3, t0
                  fsqrt.s      ft4, fa0
                  sltiu        a1, s3, -636
                  mulhsu       a7, a0, s2
                  rem          t3, s0, a6
                  srli         s9, s5, 23
                  fsqrt.s      fs0, fa5, rdn
                  xori         s6, gp, -782
                  mul          zero, s6, s4
                  div          a5, a2, s5
                  ori          zero, s10, -203
                  divu         s6, a2, ra
                  fsgnjn.s     fs8, fs4, ft0
                  mulhsu       a5, t5, a6
                  feq.s        s5, fs11, fs11
                  fsub.s       fa0, fa3, ft3
                  fmv.x.w      a6, fs3
                  mulhu        s10, t5, s8
                  fcvt.s.w     fa7, a3
                  fsub.s       fs0, fs8, fs2
                  srai         gp, s1, 15
                  xor          t1, s6, a4
                  ori          s8, s5, 875
                  ori          s1, s1, 1572
                  sra          a0, s0, s3
                  sltiu        s5, s7, -76
                  fmv.x.w      t3, ft11
                  sltu         t3, s7, sp
                  flt.s        s6, fs8, fa6
                  slti         a6, a0, 517
                  add          a0, t2, s10
                  fsgnj.s      ft6, ft5, ft11
                  fmv.x.w      s7, fa5
                  addi         t0, zero, 1831
                  fmul.s       fs2, fs9, ft4, rmm
                  fsqrt.s      fa4, fs8
                  mulhu        s2, s10, s7
                  xori         tp, zero, 1711
                  fmax.s       fa7, fs5, fa2
                  and          s3, ra, s5
                  mulhu        a6, t6, s8
                  sltiu        ra, s0, 868
                  fcvt.s.wu    fs6, s2, rmm
                  xor          zero, a4, a2
                  and          t0, a6, s9
                  sltu         a2, t5, t6
                  andi         s3, tp, -1649
                  nop
                  divu         tp, a7, s2
                  nop
                  slti         s7, a6, 1515
                  divu         a5, s5, t6
                  slli         t1, a4, 24
                  nop
                  mul          a6, a4, s2
                  fdiv.s       ft6, fs8, fs11
                  xor          t0, s4, a2
                  and          a0, t0, t4
                  sll          s9, t6, s6
                  lui          s4, 965317
                  fle.s        a1, fs11, ft9
                  fle.s        s11, ft2, fa1
                  slli         t2, t1, 28
                  slt          a0, t1, s7
                  and          s9, t1, s2
                  fmax.s       ft0, ft7, fs5
                  div          s11, s3, a5
                  remu         s0, s7, s2
                  fcvt.s.wu    ft1, s2
                  mul          s2, s7, sp
                  add          tp, s5, tp
                  sra          a7, t4, t5
                  fcvt.w.s     a6, ft7, rdn
                  sra          a6, t6, s3
                  fmul.s       fs11, fs10, fs6, rne
                  srli         s9, s10, 11
                  fsgnjx.s     fs3, ft0, fs9
                  sra          zero, s3, zero
                  nop
                  addi         zero, s1, -637
                  slti         a3, s7, -328
                  fdiv.s       fs0, ft11, ft3, rmm
                  add          s3, s10, gp
                  mulhsu       s9, s3, zero
                  slt          t0, t2, t3
                  slli         t3, a6, 19
                  fcvt.w.s     t4, ft5, rne
                  flt.s        s8, ft3, fs4
                  xori         s11, t2, -1141
                  fsqrt.s      ft3, ft4
                  sra          a0, a0, s9
                  mulhu        tp, a7, sp
                  flt.s        zero, fs1, fa4
                  or           a5, s8, t2
                  sltiu        s11, zero, -513
                  nop
                  lui          t4, 378064
                  fmin.s       fs4, fs4, fa3
                  srl          s0, s8, a1
                  fmax.s       fa5, fa7, ft5
                  mulh         s1, s9, s0
                  ori          s5, ra, -314
                  nop
                  ori          a3, s6, 1765
                  srl          a3, a7, s11
                  fclass.s     a1, fs10
                  fsgnjx.s     fs0, ft8, ft4
                  mulh         sp, t1, s9
                  fmul.s       fs6, fs3, fa2, rtz
                  mulh         a7, t6, s2
                  slli         gp, a4, 30
                  rem          gp, a0, s3
                  fcvt.w.s     a3, fa1, rmm
                  nop
                  fle.s        t4, ft11, fa2
                  andi         s4, s9, -1618
                  fclass.s     a5, ft8
                  sltiu        t2, gp, 325
                  fmax.s       fa7, ft5, fs5
                  flt.s        s2, fs5, ft5
                  fadd.s       ft4, fa3, fa7
                  add          a3, s1, s6
                  srli         t2, gp, 10
                  slti         a6, tp, -1346
                  fcvt.w.s     s1, fs2
                  fclass.s     s8, fs5
                  fsub.s       ft5, fa2, fs4, rtz
                  flt.s        a5, fs3, fs7
                  fmul.s       ft5, fs7, fs2, rne
                  remu         s8, gp, t2
                  flt.s        a7, fs5, ft8
                  xori         a7, sp, 1740
                  fsgnj.s      ft5, ft9, ft1
                  fmv.x.w      t0, fs9
                  and          zero, t3, a6
                  sub          a5, sp, a1
                  remu         s1, s4, s11
                  divu         a7, s3, a0
                  remu         s10, s6, a1
                  fsub.s       fs3, ft6, ft7, rmm
                  fsgnjx.s     fa5, fs6, fs3
                  fle.s        s9, fa3, fs8
                  feq.s        s1, fa5, ft0
                  add          sp, s6, s2
                  srai         s11, a2, 31
                  or           s2, a0, a2
                  lui          t2, 673327
                  fcvt.w.s     s1, ft9
                  fsgnjx.s     fs3, fs3, fa3
                  sll          s8, s0, s7
                  fmin.s       ft3, fa7, fs11
                  fsgnj.s      fa3, ft3, fs1
                  fsgnjn.s     fs5, fs11, fs6
                  ori          gp, s5, -1780
                  fsub.s       ft1, fs5, fa6
                  fcvt.w.s     zero, fs10
                  fadd.s       fa5, fa0, ft7
                  fclass.s     a3, fs10
                  flt.s        s5, fs1, fs2
                  fsub.s       fs11, fa2, fs7, rmm
                  sltu         t4, s10, s6
                  mulhsu       t2, s0, s3
                  andi         ra, s4, -374
                  slti         s5, sp, 132
                  rem          s9, sp, a3
                  slti         tp, zero, 1364
                  addi         zero, zero, -1953
                  slt          zero, s7, s3
                  fsgnjx.s     fs1, fa0, ft11
                  mulhu        t4, s1, t5
                  andi         s7, t2, 1756
                  or           s3, t3, gp
                  mulhsu       gp, t5, a2
                  fmul.s       fs3, ft8, fs9
                  fsgnjn.s     fa4, ft3, ft8
                  fmul.s       fa1, fs11, fa6, rmm
                  fadd.s       fa3, ft11, fs8
                  auipc        s6, 813917
                  fsqrt.s      fa4, fs8, rtz
                  fsgnjx.s     ft7, fs11, fs9
                  fcvt.s.w     fa2, t6
                  slti         a0, a6, -1968
                  remu         s5, zero, s0
                  fsgnj.s      fs11, ft8, fs8
                  sub          a1, a3, s6
                  fle.s        a1, fa4, ft11
                  sltiu        t3, s9, 748
                  sltiu        tp, ra, 514
                  sltiu        s8, s8, -325
                  mul          s8, s11, a0
                  fle.s        t2, ft1, fs4
                  sra          s5, s9, s6
                  fsgnj.s      fs3, fs11, ft6
                  add          a6, a0, t3
                  xor          s6, t6, sp
                  sll          t4, s3, s11
                  fsub.s       fs2, ft6, fs6, rup
                  fsgnjx.s     ft1, ft10, ft6
                  srl          s0, t6, t4
                  fcvt.s.wu    ft11, gp, rmm
                  fcvt.s.wu    fs9, a2, rmm
                  sltiu        t3, t2, -1019
                  fclass.s     t1, fa0
                  sub          tp, s10, gp
                  or           t4, a6, s9
                  fsgnjn.s     ft4, fs11, fs7
                  mulh         s4, a7, t5
                  mulhsu       a3, a1, s1
                  xori         a5, s2, 579
                  and          s8, ra, tp
                  mulh         s7, t4, s7
                  div          a5, zero, t4
                  fmv.x.w      s8, fa2
                  slli         s3, t3, 14
                  slti         s5, s7, 253
                  fsgnj.s      fs0, fs8, ft9
                  fmax.s       fa1, ft2, fa7
                  slti         zero, zero, -326
                  fmin.s       ft8, fs4, ft10
                  fmul.s       fs6, fs4, ft10
                  fle.s        a1, fs0, ft11
                  addi         t2, a6, -370
                  fdiv.s       fs4, fa6, ft0
                  lui          t1, 401448
                  fcvt.s.wu    ft7, a4
                  flt.s        s0, fs5, fs1
                  and          t2, t6, a6
                  lui          t3, 889678
                  or           a0, s1, t2
                  divu         a0, a5, t6
                  add          a5, ra, t2
                  fmin.s       fa5, fs6, fs8
                  div          s5, t3, t5
                  add          a3, ra, s11
                  auipc        s9, 835338
                  srl          s3, s5, s7
                  addi         s2, a3, -1931
                  fmax.s       fa5, fs11, ft5
                  flt.s        a5, fs3, fs8
                  fclass.s     ra, ft10
                  fdiv.s       fs3, fs4, fa6
                  flt.s        t3, ft5, fs1
                  fmv.w.x      fs9, a0
                  sltiu        t0, s11, 1593
                  or           s10, s11, a5
                  fadd.s       fa6, fs7, fs3
                  srli         s2, s10, 2
                  mul          a3, tp, s1
                  sltu         s7, a4, gp
                  fmul.s       fa1, ft0, fs2
                  divu         sp, a7, sp
                  div          s8, zero, s2
                  fsgnjn.s     ft1, ft6, ft1
                  fmin.s       ft3, fs1, fs7
                  sltu         s1, sp, t6
                  xor          a0, t6, s4
                  divu         t2, t6, s5
                  srl          zero, s1, t3
                  fadd.s       fs6, ft8, fs9, rmm
                  fdiv.s       fs1, fa4, ft11, rtz
                  mulhu        s2, s10, s0
                  sltu         sp, sp, s3
                  fadd.s       fs4, ft1, fs7, rup
                  sltiu        s8, s11, -774
                  fmin.s       ft2, ft2, ft9
                  fmin.s       fa7, fs5, ft9
                  mul          s8, a0, t4
                  sltu         s2, t3, a7
                  fmv.x.w      t4, fa4
                  fmv.w.x      fa5, t3
                  flt.s        s1, fs6, ft6
                  sll          s8, t3, t6
                  mulh         a0, a6, t6
                  sra          s6, gp, t2
                  nop
                  mulh         a0, a5, a4
                  sll          s2, s6, ra
                  mul          s8, s7, s5
                  fadd.s       ft5, fa4, fa1, rmm
                  srli         t4, t0, 14
                  fadd.s       ft7, fs9, fa3
                  sub          a1, t5, a2
                  mul          zero, gp, s1
                  sub          a5, s6, a4
                  div          s9, t4, a1
                  nop
                  ori          s5, s2, 629
                  divu         sp, s10, t2
                  fmin.s       ft3, fs6, ft2
                  fcvt.s.w     fa2, a7
                  or           s6, a2, t3
                  rem          s4, s2, s8
                  fcvt.w.s     s10, fs4, rup
                  nop
                  flt.s        a6, fs5, fs2
                  fsgnjx.s     ft1, fs8, ft11
                  fsgnjx.s     ft11, fs11, fa7
                  sltu         s9, t5, t5
                  div          a3, s7, s11
                  fdiv.s       fs9, fs2, ft1
                  srl          s3, s4, a0
                  fsgnj.s      fs6, ft6, ft2
                  ori          gp, s3, 504
                  mulhsu       s8, t5, t1
                  divu         tp, s1, a0
                  fclass.s     t1, fa7
                  mulh         t4, a6, s6
                  fcvt.w.s     t3, fs6, rne
                  fsgnjn.s     ft0, fa2, ft11
                  div          a5, sp, s9
                  fsqrt.s      fs8, ft4
                  srl          a6, s10, s7
                  flt.s        a5, ft2, ft9
                  fsgnjn.s     ft3, fa4, fs5
                  mulhu        s3, a4, s7
                  mulhu        t3, a6, s5
                  srai         t0, s1, 17
                  slt          s1, s7, s9
                  srl          t0, t3, s11
                  or           s8, s10, s7
                  andi         a5, s7, 1674
                  srl          s3, ra, s0
                  mul          t0, t6, tp
                  feq.s        sp, fa7, ft10
                  fdiv.s       fs5, fa6, fs5, rdn
                  sll          a1, a1, a1
                  flt.s        t3, fa4, ft2
                  remu         a5, sp, t6
                  lui          a6, 435408
                  sltu         a7, s11, sp
                  add          s1, a0, t2
                  flt.s        t3, fs7, ft3
                  fdiv.s       fa2, ft4, fa0, rmm
                  addi         t0, zero, -2010
                  sltu         a7, t4, s8
                  fmv.w.x      fa1, s9
                  srai         sp, s7, 1
                  fcvt.s.wu    fs10, sp, rup
                  slli         s8, a5, 9
                  fsgnjn.s     fs5, fa6, fa2
                  srl          sp, s0, gp
                  fmul.s       fa6, ft5, fs8
                  remu         gp, t2, sp
                  feq.s        s5, fs3, ft9
                  add          s9, s9, a5
                  fcvt.w.s     t1, ft11
                  div          a1, a3, t1
                  mulh         s6, tp, sp
                  fle.s        s1, fs1, fa0
                  fcvt.s.wu    fa1, gp
                  slt          s2, t3, s11
                  fsgnjn.s     ft7, fs11, ft5
                  mulhsu       a6, s6, s7
                  fcvt.s.w     fs1, t2, rup
                  sub          s6, zero, a5
                  srl          a6, t0, gp
                  srai         s7, t6, 6
                  fsub.s       ft10, fa1, fs11, rmm
                  feq.s        a2, ft7, fs11
                  sub          s8, ra, s8
                  fcvt.s.wu    ft9, zero, rdn
                  xori         a3, a1, -522
                  fmin.s       fs11, fa3, ft4
                  fcvt.s.wu    fs2, tp, rmm
                  fsqrt.s      ft7, fs5, rdn
                  mul          a2, s5, s8
                  srli         t2, s0, 24
                  addi         t2, a3, 1649
                  ori          t4, s0, -1433
                  mulh         a5, a1, s7
                  fsgnjn.s     ft6, fa4, ft0
                  xori         s8, gp, -904
                  fsgnjx.s     fs1, ft6, fs2
                  sltu         s4, t2, a0
                  add          a7, t4, a4
                  nop
                  slt          a7, a5, a5
                  mulhsu       s11, sp, s10
                  lui          zero, 220227
                  mulhu        t3, s8, s10
                  fcvt.s.wu    fa5, s7
                  sltiu        s1, s6, -1062
                  mulhsu       s8, s1, s11
                  fsgnjn.s     fs5, fs9, ft9
                  feq.s        s3, ft0, ft9
                  fadd.s       fa1, ft10, fs11, rtz
                  fclass.s     a6, fs1
                  fsgnjx.s     fs11, ft4, fs11
                  srl          t3, s3, s4
                  div          gp, a3, t1
                  mulh         ra, s9, s6
                  slt          s8, a3, a7
                  fclass.s     a5, ft6
                  nop
                  slti         s2, s5, 852
                  fclass.s     a2, ft0
                  addi         sp, s7, -1117
                  fclass.s     sp, fa4
                  fclass.s     ra, ft9
                  fmv.w.x      ft0, a3
                  fclass.s     a2, ft7
                  xori         s11, s7, 915
                  fmax.s       ft3, fs7, ft3
                  fcvt.s.w     fs1, s9
                  rem          sp, s8, a1
                  fsub.s       ft6, fa3, ft11, rmm
                  mul          t0, s3, s11
                  xor          s2, a3, a0
                  fclass.s     gp, fs11
                  mulhu        a3, t0, s9
                  sltiu        t1, sp, 985
                  sltu         s11, t6, s3
                  auipc        sp, 158856
                  or           a3, a1, t3
                  feq.s        s5, fa1, ft10
                  fsgnjn.s     fs1, fs7, fa6
                  sltiu        tp, s1, -430
                  fcvt.s.wu    ft5, a5
                  srai         s9, tp, 16
                  sltu         s7, s7, tp
                  feq.s        a3, fa6, fs8
                  slli         s5, a5, 8
                  slti         s6, s11, 236
                  mul          zero, s3, t3
                  fmv.x.w      s0, fs4
                  flt.s        s10, fs10, fs6
                  fclass.s     a1, fa1
                  sltu         ra, t3, t5
                  mulh         s7, ra, a7
                  mulh         s8, a0, s4
                  sra          s3, s4, ra
                  auipc        s6, 331133
                  flt.s        tp, fs4, fa6
                  sra          a5, t0, a4
                  xor          t0, s5, s10
                  sub          a2, zero, gp
                  fmv.x.w      t0, ft1
                  nop
                  srl          a3, gp, sp
                  fcvt.s.w     ft11, s8
                  divu         s3, t1, gp
                  add          tp, s6, s10
                  mulhu        s4, a0, sp
                  fmul.s       fs3, ft11, ft7, rup
                  fsub.s       fa7, fa0, ft0, rne
                  ori          zero, ra, 1856
                  xori         t1, s3, -1407
                  addi         s2, tp, 1655
                  mulhu        a6, s10, t5
                  sll          s3, s1, t0
                  add          a0, s5, a4
                  auipc        a0, 281827
                  addi         t1, s8, 907
                  fsgnjx.s     ft6, fs8, fs0
                  remu         sp, a5, s10
                  rem          s6, tp, t4
                  fclass.s     zero, ft7
                  sll          s6, t2, t4
                  fcvt.w.s     s2, ft0
                  fcvt.wu.s    s8, fs6
                  sltiu        s2, a0, -1989
                  fcvt.wu.s    s0, ft2
                  rem          s0, s4, s2
                  div          a1, gp, s1
                  sra          t0, zero, s3
                  fsgnjn.s     fa6, ft4, fa6
                  sll          s9, sp, s7
                  fsqrt.s      fa3, fa7
                  sll          s7, a5, s2
                  addi         ra, a2, -1932
                  fsgnjx.s     ft8, fs5, fs7
                  mulhu        a0, a7, a3
                  fadd.s       fs11, fa7, ft8
                  lui          a1, 476061
                  flt.s        s10, fa0, ft5
                  fmul.s       fs5, fs3, ft4
                  remu         s4, s2, t3
                  and          s9, a7, s3
                  fcvt.s.wu    ft4, a6
                  and          s10, s4, s6
                  slli         t1, s3, 4
                  fcvt.w.s     s0, fs10
                  auipc        t4, 947293
                  or           s4, sp, a3
                  and          sp, tp, gp
                  fsgnjx.s     fa7, fa5, fs3
                  fcvt.s.wu    ft6, zero, rup
                  sltiu        a2, a3, -2048
                  fcvt.w.s     a1, fs8
                  fmax.s       fa3, ft8, fa2
                  sra          a5, a6, zero
                  slti         a0, t6, -1702
                  fsgnj.s      fa6, fs1, ft9
                  sub          a3, a4, t3
                  fadd.s       ft6, fa1, ft9, rup
                  fsgnjx.s     fa1, ft6, ft5
                  fmv.x.w      t2, fs2
                  fsub.s       fa5, fs1, fs8
                  fsgnjn.s     fs6, ft5, ft2
                  sltu         a7, a1, sp
                  fle.s        gp, fa4, ft5
                  srl          s3, a6, t5
                  srli         s8, t2, 8
                  and          t4, a7, s10
                  fmin.s       ft1, fa7, ft4
                  fmul.s       ft5, ft5, fa1, rup
                  slli         s7, a7, 26
                  srli         t3, t5, 2
                  fcvt.wu.s    s10, fa7
                  xor          s5, a1, a7
                  srai         a1, a1, 9
                  slli         s10, a3, 25
                  and          s8, s4, zero
                  auipc        t1, 529469
                  sub          t3, gp, a5
                  fclass.s     a5, fs7
                  mul          s7, t1, s0
                  nop
                  ori          t3, a6, 660
                  fmv.w.x      fa4, s8
                  and          t4, s6, ra
                  fcvt.s.wu    fs9, a3, rmm
                  sll          t4, t4, t5
                  fmin.s       fs2, ft1, fs6
                  xor          a7, s6, s4
                  rem          s5, s1, s5
                  fsgnjx.s     fs9, ft1, fs0
                  fsgnjn.s     ft6, fs8, ft7
                  fcvt.wu.s    tp, ft6
                  fsgnjn.s     ft9, fa4, fs10
                  fmul.s       fs9, ft8, ft9
                  ori          a3, s9, -261
                  fcvt.s.wu    ft7, t1, rne
                  fmul.s       ft11, fa2, fs9
                  mul          a0, a0, s5
                  slt          t0, a6, t4
                  sll          s7, t1, s1
                  add          s7, t6, t0
                  rem          t2, sp, a4
                  feq.s        s3, fa7, fa3
                  rem          s10, a2, zero
                  fcvt.wu.s    s0, fs1
                  srli         a7, sp, 13
                  fsgnjn.s     fa6, fs4, ft8
                  mulh         a6, a7, zero
                  lui          s9, 1015956
                  fcvt.s.w     ft10, s5
                  flt.s        a5, fs11, ft1
                  sltiu        s11, t1, 1779
                  fsgnj.s      fs4, fa6, fa1
                  fmv.x.w      t3, fs5
                  fsub.s       fs2, ft1, ft0, rdn
                  mul          zero, s0, sp
                  fsub.s       fs3, ft2, fa6, rtz
                  fdiv.s       fs1, ft10, fs7, rmm
                  rem          a5, t1, a4
                  mulhsu       a1, t0, t1
                  andi         a0, sp, 146
                  fcvt.wu.s    a3, ft1
                  sltu         sp, s3, s6
                  sra          s3, s1, a5
                  fdiv.s       ft5, ft10, fs6
                  feq.s        a2, fa2, fs1
                  fcvt.wu.s    a3, ft1
                  sltiu        t1, s2, -226
                  lui          s1, 242791
                  srli         a6, a1, 28
                  lui          t3, 539819
                  fcvt.wu.s    a5, fs6
                  mul          a7, s9, a6
                  fsub.s       ft7, fs1, fa7, rup
                  fmv.x.w      t1, ft2
                  mulhsu       a5, s1, s0
                  fsgnjn.s     fa4, fa1, ft7
                  fdiv.s       fs2, ft8, ft11, rup
                  or           t1, t1, a4
                  mul          a5, s2, a2
                  fmv.x.w      ra, fa2
                  srli         a2, a7, 4
                  auipc        s8, 513334
                  divu         s6, t3, sp
                  fclass.s     a3, ft0
                  and          s7, t4, s3
                  fcvt.w.s     sp, fa1
                  andi         a0, s0, -1664
                  remu         gp, a6, t6
                  srl          a0, s11, s2
                  feq.s        t4, fs10, ft3
                  ori          a3, sp, 979
                  sltiu        s3, s2, 1079
                  fclass.s     t1, ft6
                  remu         a2, t5, t3
                  fsgnjn.s     ft10, fa4, fs7
                  fmax.s       fs3, fs8, fs3
                  slli         a1, s10, 26
                  auipc        s3, 954620
                  andi         t4, t0, -1115
                  mulh         s7, s0, s7
                  fmul.s       fs9, ft0, ft5
                  and          t0, t1, a0
                  auipc        s10, 548254
                  fsgnj.s      ft6, ft2, fs2
                  fsqrt.s      fs2, fa4, rdn
                  slt          t3, t3, s6
                  sll          ra, s9, s0
                  fle.s        a1, fs5, fa3
                  fmax.s       ft4, ft10, ft10
                  fclass.s     a5, fs10
                  divu         s8, a7, tp
                  auipc        s1, 338764
                  sra          a2, tp, sp
                  xor          tp, s4, a0
                  srli         a7, sp, 13
                  fsqrt.s      ft2, ft7, rup
                  fsub.s       ft6, fa0, ft6
                  fsgnjx.s     fs7, fa6, fa0
                  auipc        t3, 766334
                  srai         tp, s8, 11
                  sltu         t4, a1, tp
                  fsqrt.s      fs4, fa0
                  fsgnjn.s     fa7, fa7, fa0
                  add          gp, s1, s11
                  ori          t3, t6, 1835
                  feq.s        a5, fa7, fs3
                  fmv.x.w      s10, fa4
                  sub          t0, zero, t1
                  and          t0, a0, s1
                  mulh         a2, s9, s7
                  feq.s        zero, ft4, fs8
                  fsub.s       ft3, ft11, fs1
                  add          s7, a0, s5
                  fmv.x.w      ra, ft4
                  mul          a5, s3, s2
                  ori          ra, sp, -1246
                  fmin.s       fs6, ft11, fs7
                  sll          sp, a3, tp
                  fclass.s     s0, fs1
                  slti         zero, a2, 1596
                  ori          tp, s6, 103
                  remu         a0, t4, s8
                  or           a3, t2, t1
                  fmv.x.w      s8, ft2
                  srli         a7, s1, 28
                  addi         a1, s6, -1017
                  mulh         s9, t6, s8
                  mulh         t0, a1, t2
                  fmv.x.w      t2, fa5
                  fsgnjn.s     fs10, ft4, ft9
                  xor          s2, s0, gp
                  andi         s10, gp, -819
                  addi         s9, ra, 1512
                  mul          s0, ra, a4
                  fcvt.s.wu    ft10, t3
                  divu         s2, t2, s1
                  fmax.s       fs10, ft8, ft1
                  xor          t2, s4, s4
                  ori          t2, s5, -1220
                  feq.s        a7, fa3, fs1
                  divu         ra, gp, a5
                  sll          s4, s7, a0
                  fle.s        t3, fs2, fa3
                  fsgnj.s      ft10, ft11, ft5
                  fmul.s       ft11, fs6, fs11, rdn
                  div          sp, a3, t0
                  rem          t1, t2, a5
                  fmul.s       ft0, fs9, fs11, rmm
                  xori         a1, tp, -795
                  feq.s        s9, fa1, fa1
                  nop
                  andi         s7, a3, -672
                  nop
                  sll          s9, s3, a1
                  sltiu        sp, s4, 1044
                  fadd.s       fa1, ft10, ft3, rne
                  mul          s9, a0, t5
                  fclass.s     s7, fs7
                  fmin.s       ft9, ft10, fa7
                  mulhu        s10, a0, s7
                  sltu         t1, s10, t5
                  fcvt.s.w     fs1, s11, rne
                  lui          s11, 527407
                  rem          s1, s8, s2
                  fsgnjx.s     fs9, fs8, ft10
                  srl          t4, a3, s9
                  fmin.s       fa0, fs10, fa5
                  fmul.s       fa1, fs3, ft4, rne
                  lui          sp, 442322
                  srli         tp, a1, 14
                  fmin.s       fa6, ft2, fs7
                  and          tp, s9, t5
                  fmax.s       fs0, fa7, fa7
                  nop
                  flt.s        t2, ft11, fa6
                  or           tp, gp, a5
                  and          a7, a4, s11
                  fle.s        a0, fs3, fs11
                  slti         t1, s11, 1017
                  fsqrt.s      ft6, fs3, rup
                  fdiv.s       ft11, fs10, fs7
                  fcvt.w.s     ra, fs6, rtz
                  fmv.x.w      s2, fa4
                  xor          s7, tp, s8
                  srl          s6, tp, a6
                  or           s11, a2, a2
                  fcvt.s.wu    fa1, zero
                  fcvt.s.wu    ft2, a3, rne
                  fsgnjn.s     ft10, ft6, ft6
                  fmul.s       fs7, fa3, ft1, rup
                  fdiv.s       fs6, ft3, ft3, rdn
                  remu         s2, s9, a2
                  nop
                  fadd.s       fs5, fa0, fa0, rmm
                  srl          a0, t2, a6
                  xori         t0, a6, -986
                  fsgnjn.s     ft9, fa7, ft7
                  rem          a2, s2, sp
                  sltiu        s11, t0, -1713
                  fle.s        a5, fa4, ft7
                  mulhsu       s2, s11, t3
                  slt          s3, s3, s8
                  fcvt.w.s     s0, fa6, rne
                  divu         sp, s5, s8
                  fmin.s       fs8, fs1, fs11
                  slti         a1, t0, -346
                  add          tp, a5, a0
                  add          a6, t1, t4
                  rem          s0, s3, a3
                  div          s8, t3, a2
                  fsub.s       fs8, ft1, fs7
                  slti         gp, s5, -52
                  fcvt.wu.s    s2, ft6, rne
                  srli         s11, a5, 3
                  sll          gp, s9, s7
                  mulh         s2, t3, s6
                  fsqrt.s      fa0, fa2
                  srli         s2, t1, 7
                  ori          s6, s3, 800
                  nop
                  fcvt.wu.s    zero, fa2, rne
                  sltiu        s8, t4, 1461
                  flt.s        s5, ft9, fa1
                  nop
                  fle.s        t0, fs10, fs8
                  mul          zero, s1, t6
                  fmul.s       fa3, fs3, fs1, rtz
                  fsgnjx.s     fa2, ft5, fs4
                  ori          a5, a3, -1995
                  flt.s        gp, fs0, ft7
                  slti         a0, s4, 1287
                  or           t1, a5, tp
                  sub          a1, s1, s1
                  feq.s        ra, ft9, fs3
                  fmv.w.x      fa1, a1
                  sltu         a2, sp, t4
                  div          a6, t1, zero
                  srli         t2, a6, 27
                  fle.s        t2, fs8, fs10
                  fmin.s       ft6, fa0, fs8
                  fsgnjx.s     fs5, fs1, fs0
                  fmv.x.w      s0, ft3
                  fsgnjn.s     fa1, fa7, fs6
                  xori         gp, s11, 1487
                  fmul.s       fs10, fs7, fa0, rdn
                  fsub.s       ft2, ft11, ft7
                  mul          s2, t5, s9
                  ori          a3, zero, 1158
                  nop
                  or           s0, s11, gp
                  fmax.s       ft5, fs0, fs11
                  fdiv.s       fs3, fs0, fa6
                  add          tp, t3, a6
                  xori         s3, ra, -855
                  sub          s7, t6, a7
                  fmul.s       fs6, fs7, fa5
                  mulh         gp, s5, t2
                  or           a7, s3, a5
                  mulh         a0, s4, s5
                  divu         sp, s0, zero
                  add          ra, s4, a1
                  fcvt.s.w     fa5, s5, rtz
                  sltiu        a0, ra, -1898
                  fdiv.s       fa2, fs10, ft2
                  srai         s7, s6, 14
                  addi         sp, s4, -1557
                  addi         a5, s9, 298
                  or           tp, a1, t2
                  fclass.s     a5, fs5
                  divu         t0, s5, s10
                  add          s3, t0, a3
                  fcvt.s.w     fa0, s10
                  srai         sp, t5, 19
                  slt          s9, a0, s9
                  mulh         t4, a1, t0
                  sub          a6, t4, a1
                  sltiu        s1, t0, -700
                  sub          tp, s2, a7
                  ori          s0, a6, 1966
                  divu         a7, a1, t0
                  srl          tp, gp, zero
                  fcvt.wu.s    s1, fs6, rmm
                  srai         t2, s4, 27
                  fsub.s       fs6, ft6, ft1
                  fclass.s     ra, fa4
                  or           s9, ra, s9
                  srl          a5, a6, zero
                  div          ra, s4, t2
                  addi         gp, s5, -78
                  divu         t4, s7, t3
                  slt          a1, s10, s4
                  fsub.s       fs4, fa5, ft7, rup
                  fdiv.s       fa2, fs8, fs5, rmm
                  rem          a6, s11, t4
                  xor          tp, a2, t1
                  fmv.x.w      s3, fs1
                  srai         s2, t2, 24
                  fcvt.w.s     s7, ft10, rtz
                  fdiv.s       fs7, fa3, ft8
                  fdiv.s       ft1, fs9, fs2, rdn
                  fclass.s     s5, fs8
                  div          sp, s6, s7
                  slti         s8, s1, -1279
                  fsub.s       ft3, fs6, fs9
                  add          a2, a7, a6
                  fcvt.w.s     ra, ft11, rtz
                  fsgnj.s      ft1, fs10, ft3
                  fsgnjx.s     fa5, ft9, fs10
                  srai         t1, a1, 30
                  and          a6, a3, a2
                  fsgnjx.s     fa2, fs5, fa4
                  fmv.x.w      s1, ft2
                  ori          tp, sp, -1338
                  and          a3, a4, a7
                  lui          s4, 256250
                  fadd.s       fs11, ft5, fs4
                  fsgnjn.s     ft9, fa1, fs8
                  mulh         s4, s10, t5
                  mulhu        t4, a1, t4
                  fmv.x.w      t4, fs8
                  fcvt.s.w     fs8, a1, rmm
                  sll          a5, a4, a6
                  srai         s9, s0, 25
                  slti         zero, t5, 17
                  fsgnj.s      fs9, ft4, fa3
                  srl          s8, s0, zero
                  srl          t4, s7, s7
                  div          s0, s7, s4
                  sra          a5, a1, t6
                  rem          a1, s10, s5
                  fsub.s       ft5, fs5, ft0, rmm
                  sltiu        s0, s6, 1191
                  srl          tp, s8, ra
                  sra          s4, t5, a2
                  fsgnjx.s     fa7, fs10, fs10
                  auipc        s9, 286870
                  andi         s8, t2, -1933
                  fdiv.s       fs6, fa2, fs9
                  fsgnjx.s     ft4, ft8, fa1
                  fsqrt.s      fs5, ft8, rtz
                  fsgnjx.s     ft7, ft7, fs9
                  fsqrt.s      fa6, ft3
                  auipc        s1, 395455
                  add          s7, a7, t2
                  fcvt.s.wu    fs2, a4
                  fdiv.s       fs1, fa2, fa6
                  sll          s11, sp, zero
                  fsqrt.s      fa7, fa5
                  fclass.s     s9, ft6
                  ori          t4, t5, -577
                  slli         t4, s7, 7
                  fsgnjn.s     ft11, ft11, fs8
                  slti         t3, s11, 1308
                  srl          gp, s3, tp
                  fmul.s       fa7, fs6, fs7, rtz
                  xori         s1, a1, -991
                  mulhu        s7, s0, a0
                  and          s6, ra, t1
                  fmax.s       fa4, ft8, ft6
                  ori          a1, s11, -775
                  rem          s1, s0, s3
                  fcvt.wu.s    tp, ft4, rdn
                  fmv.x.w      tp, fa3
                  addi         a0, s8, -97
                  fmax.s       fa1, fs7, fa2
                  andi         tp, s6, -1582
                  fmv.w.x      fs10, a4
                  fsgnj.s      fa7, ft7, ft4
                  ori          s7, s10, -1487
                  mulh         s0, s7, t2
                  fle.s        a7, fs0, fs1
                  nop
                  nop
                  fmin.s       fa5, fs1, fa3
                  sltu         s8, s9, a0
                  fcvt.w.s     s0, fa3, rup
                  lui          s3, 606509
                  div          s3, s7, a4
                  fmv.x.w      t1, fs11
                  mul          ra, t2, t4
                  fmin.s       fs0, ft1, fa0
                  mulh         s3, s9, s2
                  flt.s        a0, ft10, ft2
                  auipc        s6, 1035545
                  andi         s9, a7, -15
                  fsgnjx.s     fs2, fs3, fa3
                  sra          s2, t5, sp
                  fadd.s       ft7, ft5, fs8, rdn
                  mulhu        a1, tp, s6
                  flt.s        zero, ft11, fa3
                  fsgnjn.s     fa7, ft8, ft5
                  fsub.s       fs4, fs11, fs4, rdn
                  divu         s4, gp, s7
                  fcvt.s.wu    fs8, t0
                  add          t1, a0, s8
                  fclass.s     s0, fa4
                  mulhu        t1, zero, tp
                  rem          t2, s3, sp
                  div          s0, s10, a1
                  fsgnjn.s     fs11, ft11, fs9
                  fle.s        t3, fa1, fa0
                  slli         s11, t3, 13
                  slti         s5, a0, -1214
                  andi         a1, a5, 1237
                  srli         t0, zero, 8
                  sltiu        t3, t3, 914
                  slti         a7, s2, -175
                  add          s8, s3, t5
                  divu         s8, a4, a2
                  sll          s7, s7, a5
                  remu         a3, t0, t3
                  fcvt.s.w     ft11, s4
                  and          zero, a5, zero
                  and          tp, s5, s2
                  sltiu        t3, t4, -1228
                  fcvt.wu.s    s1, ft5, rmm
                  fcvt.wu.s    t4, fa2
                  add          a3, t2, a6
                  fcvt.s.wu    ft8, s10
                  sub          s1, a7, a1
                  slli         s11, s7, 14
                  fdiv.s       fa3, fa0, ft6, rmm
                  srli         zero, s7, 0
                  lui          ra, 754029
                  fdiv.s       fa4, fs7, fs10
                  flt.s        t3, ft5, fs2
                  fle.s        s8, fa2, fs1
                  fadd.s       ft3, fs7, fa1, rtz
                  fle.s        s7, ft3, fs10
                  add          zero, a5, a1
                  add          a6, s5, s4
                  auipc        sp, 940773
                  srai         a6, s5, 23
                  remu         t3, t6, s7
                  fadd.s       ft6, fs5, ft0, rne
                  remu         a3, t3, a7
                  auipc        s0, 204503
                  slli         ra, t2, 16
                  fsgnjn.s     ft5, fs5, ft2
                  fsub.s       fs11, fa4, fs6, rdn
                  fsub.s       fa1, ft11, fs6, rup
                  fsqrt.s      fa7, ft2, rup
                  feq.s        s11, fs8, ft2
                  andi         zero, t2, -1256
                  fmul.s       fs1, ft4, ft3, rtz
                  fsgnjn.s     ft3, fa6, fa3
                  fcvt.w.s     s7, fs3
                  and          s3, tp, sp
                  fcvt.s.w     ft6, a0
                  fdiv.s       fs3, ft0, fa7
                  fadd.s       ft7, fs3, ft1
                  divu         s0, s5, t5
                  xor          a6, tp, a4
                  sll          sp, t1, ra
                  auipc        s9, 10605
                  fmul.s       fs6, ft5, ft3, rne
                  rem          t0, ra, t5
                  divu         a7, s9, a2
                  fadd.s       fa4, fs9, fs3, rmm
                  mulhu        s2, t4, t5
                  fmv.x.w      t3, ft4
                  sltu         s5, s9, a3
                  sltu         t1, a0, a5
                  fcvt.s.w     fs2, t5, rne
                  fcvt.s.w     fs0, s1
                  divu         s6, a5, s3
                  fsgnjn.s     fs8, ft5, fs2
                  srai         sp, gp, 16
                  mulh         s3, s2, s10
                  fmv.w.x      ft1, s2
                  xor          t1, t0, s7
                  or           s5, s4, t1
                  srli         a1, t3, 10
                  or           s9, t0, a3
                  fmul.s       ft9, fs3, fs3, rmm
                  srai         ra, t1, 24
                  slli         s4, ra, 22
                  srai         a1, a2, 10
                  fmv.w.x      ft11, a7
                  auipc        s9, 948236
                  fsub.s       ft11, fs0, ft8
                  slli         s1, s1, 11
                  fdiv.s       ft4, ft10, fa5
                  slti         ra, t0, 418
                  lui          s4, 396755
                  fsub.s       ft9, fs6, fs7, rdn
                  divu         a6, t6, a3
                  add          s10, s9, s5
                  divu         t2, sp, t4
                  fsgnjx.s     ft9, fs10, fs11
                  div          a2, a4, t3
                  sra          t0, a2, t5
                  and          a6, t4, t2
                  feq.s        a5, ft3, fs6
                  sltiu        zero, s9, 1780
                  fsub.s       fs2, fa5, ft6, rne
                  fsqrt.s      fs4, fs8
                  mulh         zero, t0, a0
                  lui          s2, 752915
                  fclass.s     s0, ft5
                  sltu         a6, zero, a1
                  nop
                  or           s6, a5, tp
                  sltu         t4, s0, a7
                  fmv.x.w      s2, fs9
                  fsqrt.s      fs9, fs7
                  fsgnj.s      fa3, fs11, fs8
                  auipc        a2, 167637
                  srl          s6, t0, a1
                  or           a6, sp, t3
                  xori         a2, t3, -340
                  divu         s3, zero, s3
                  fle.s        s8, fs7, fa1
                  ori          t0, s7, -1997
                  slt          a6, t5, a6
                  flt.s        tp, ft1, fs7
                  xor          s3, a5, s4
                  or           s6, s11, a0
                  divu         a5, a2, sp
                  slli         s11, s6, 21
                  sll          t3, s8, s0
                  fmax.s       fs7, fa4, ft0
                  sra          a3, s3, s11
                  rem          s6, tp, zero
                  feq.s        s9, ft9, ft5
                  fmax.s       ft5, fa5, fs6
                  ori          s1, t5, -114
                  fsgnjx.s     fs8, fs0, fs9
                  auipc        a5, 21931
                  fmax.s       fs11, fa2, fs6
                  nop
                  sub          t2, tp, t6
                  sltiu        a2, s5, -42
                  fsqrt.s      ft1, fs11
                  mul          s2, t4, a7
                  fle.s        a7, fs2, fa4
                  sltu         s1, t0, ra
                  fmin.s       fs1, fs1, fs0
                  add          s1, a4, sp
                  fcvt.w.s     a3, fs9
                  fmv.x.w      zero, ft1
                  rem          s4, a7, a1
                  sll          s1, a6, gp
                  sub          s6, gp, s7
                  fadd.s       ft3, ft10, fs1, rdn
                  fcvt.wu.s    ra, ft7
                  fsgnjx.s     fs8, ft8, fa3
                  fcvt.s.w     ft1, a7, rmm
                  fmul.s       fs0, fa6, ft8
                  fsqrt.s      ft6, fa6, rne
                  fle.s        s10, fa6, fa2
                  fmul.s       fa6, fa5, fs6
                  nop
                  feq.s        a1, ft7, ft1
                  fsqrt.s      ft0, fa7, rtz
                  divu         a3, s5, t1
                  flt.s        ra, ft2, fs7
                  lui          t0, 898505
                  feq.s        tp, ft0, fa5
                  fclass.s     s4, fs3
                  feq.s        zero, fa7, ft7
                  sltiu        s2, a4, -1587
                  fmin.s       fa4, ft1, ft0
                  slti         ra, t6, 1086
                  fdiv.s       fs4, ft11, fs4
                  divu         zero, sp, t1
                  slli         s5, ra, 4
                  add          gp, gp, t4
                  fcvt.wu.s    s1, fs8, rtz
                  andi         tp, s9, 1699
                  fsgnjx.s     fs9, fs3, fs11
                  sltiu        tp, a1, 77
                  xori         t2, gp, -1696
                  fsgnjx.s     fa1, ft8, fs9
                  sltu         s4, t3, t0
                  fmv.x.w      tp, ft5
                  srli         t4, t1, 16
                  or           zero, s8, s5
                  sltu         t1, t2, s3
                  mulhu        a3, s3, a7
                  sll          s4, s5, t6
                  sra          s7, a5, gp
                  fcvt.s.w     fs3, sp
                  addi         t1, s10, 1708
                  div          t3, sp, a6
                  ori          a5, s3, -1229
                  slli         s8, a7, 25
                  and          a7, t0, s6
                  fcvt.s.wu    fs8, a5
                  auipc        s5, 998578
                  rem          zero, ra, s4
                  xori         a7, s1, -1269
                  fmax.s       fs8, ft8, fs11
                  fmin.s       ft8, fs5, ft3
                  divu         a2, a7, t0
                  fmv.x.w      a5, fa6
                  mulh         a5, s2, s0
                  rem          ra, ra, s6
                  mulh         a0, s10, s11
                  andi         t4, s9, 215
                  div          s11, s4, a2
                  fsub.s       ft10, fs2, ft6
                  or           a1, a6, t4
                  fle.s        t2, ft3, ft5
                  slli         gp, zero, 18
                  slt          gp, a0, t5
                  fmv.x.w      a2, ft4
                  fsqrt.s      ft8, fs0, rdn
                  fsgnjx.s     fa1, fa0, fs1
                  fmin.s       fs8, ft11, fa6
                  or           s7, a4, s4
                  slli         t3, s11, 8
                  fmul.s       ft7, fs11, fs7, rtz
                  fcvt.w.s     s11, ft10
                  sltiu        t1, zero, 747
                  sltu         s2, t6, s0
                  fmin.s       ft11, fa5, ft9
                  remu         s8, t5, s7
                  andi         s1, s6, -1213
                  fmul.s       fs11, ft3, ft6
                  slti         a5, s10, 320
                  mulhsu       t2, s6, a6
                  flt.s        s11, fa7, fa0
                  sltiu        t3, a2, -630
                  fcvt.s.w     ft11, a5
                  remu         s10, t4, tp
                  div          s1, a1, t0
                  flt.s        s2, ft11, ft1
                  feq.s        sp, fa7, fa5
                  div          tp, t4, s8
                  fmv.w.x      ft7, s8
                  fle.s        t3, fa5, fa0
                  sll          t3, s0, s9
                  andi         t3, s10, -1958
                  fcvt.wu.s    ra, ft3, rup
                  slt          s1, s7, s2
                  xor          s11, t1, t5
                  feq.s        a2, fs11, fa6
                  fclass.s     gp, ft0
                  mulhsu       s2, a7, s2
                  feq.s        a2, fs10, fs9
                  slli         a7, s6, 28
                  andi         s11, a1, 1739
                  fadd.s       ft4, fa1, fa4, rmm
                  fadd.s       fs0, fa5, fa4, rup
                  slti         t1, a3, -767
                  rem          t1, a0, s9
                  fmax.s       fs4, fs11, ft3
                  fmax.s       fs0, fs5, fs1
                  fmul.s       fs9, ft6, fa3
                  rem          t2, t0, a7
                  fsgnjn.s     fa5, fa3, fa7
                  divu         gp, s5, t0
                  rem          a6, t1, s8
                  rem          s6, t4, s1
                  feq.s        s10, fs3, ft7
                  fmv.x.w      s5, ft2
                  auipc        a2, 200995
                  fsqrt.s      ft0, fa2, rmm
                  andi         s0, s7, 1767
                  or           t3, a1, a3
                  feq.s        ra, ft3, fa5
                  and          s11, s7, t3
                  mul          a7, a3, a0
                  mul          a3, s2, t6
                  slti         t4, s8, -1036
                  fdiv.s       fs9, fa4, ft0
                  fmul.s       ft2, fs7, ft0, rmm
                  add          t4, sp, a1
                  xor          a0, s7, s3
                  fsgnjn.s     fs1, fa0, ft3
                  sll          s9, t5, s10
                  add          zero, t5, a5
                  or           a1, s7, s1
                  div          s10, s2, s3
                  remu         s8, s7, t3
                  slli         s3, t4, 5
                  fsgnj.s      ft5, fa4, fs6
                  fsgnjn.s     ft4, fs6, fa0
                  xori         s3, t5, -553
                  fclass.s     s1, ft2
                  fsqrt.s      ft10, ft4
                  rem          t1, s2, s9
                  lui          ra, 207230
                  sll          t0, t1, a4
                  ori          ra, a5, 1999
                  fadd.s       fa0, ft10, ft8, rne
                  srli         t1, t0, 16
                  fsgnjx.s     ft6, ft11, ft0
                  fle.s        s2, ft5, fa6
                  add          a6, s6, sp
                  xor          s7, t4, zero
                  xori         s10, s7, -1299
                  and          s4, tp, t1
                  sltu         s8, s2, s3
                  slti         s0, s5, -1567
                  fadd.s       fs7, ft1, ft9, rtz
                  slti         tp, s5, -558
                  fmv.w.x      fs6, zero
                  srl          gp, a3, t1
                  div          s1, a7, a5
                  fsgnjn.s     fs1, fs5, ft9
                  srai         ra, tp, 8
                  sll          s1, ra, t4
                  sub          a2, s4, t4
                  mulhsu       t4, t0, s2
                  fsgnjn.s     fs6, ft9, ft5
                  fsgnjn.s     ft9, fs9, fs10
                  addi         s6, a3, 625
                  mul          zero, t3, a3
                  sra          a3, t0, t3
                  fmax.s       fs2, ft0, ft5
                  divu         t3, a7, ra
                  addi         a1, a0, -1888
                  sub          s0, a5, t0
                  fcvt.w.s     s11, fa2
                  flt.s        a5, fs7, fa1
                  srai         s1, gp, 8
                  slt          a0, tp, a7
                  and          s8, a5, zero
                  fcvt.w.s     t4, fa4
                  fsgnj.s      ft6, ft10, fs2
                  mulhu        s5, s3, t1
                  fmv.w.x      fs10, ra
                  fmul.s       ft11, fs1, ft10
                  lui          ra, 162293
                  ori          t1, a0, -591
                  fcvt.s.w     fs11, a3
                  xori         t4, s8, 1493
                  fsqrt.s      fs9, ft0, rdn
                  fmv.w.x      ft7, a1
                  mulh         ra, s3, a2
                  sll          a5, zero, t3
                  fcvt.w.s     t2, ft3
                  and          gp, s3, a4
                  fdiv.s       fa3, ft5, fa4
                  or           t2, s11, s6
                  srl          t0, t0, a5
                  fmax.s       ft11, ft1, fa5
                  and          t3, a4, s11
                  fdiv.s       fs0, fa4, fa4, rne
                  flt.s        s11, fs3, fs2
                  andi         t3, s1, -1536
                  feq.s        s4, fs4, fa0
                  rem          s6, t1, t5
                  mulhsu       t3, t1, a1
                  fsgnjn.s     ft0, ft2, fs3
                  sra          a5, t1, s4
                  fadd.s       fs2, fs10, fs2, rup
                  divu         a1, s9, s2
                  fcvt.w.s     sp, fa2
                  fmul.s       fs1, fa5, fs10
                  mulhu        gp, s7, s7
                  fsgnjx.s     ft3, fs5, fs10
                  srl          s2, t5, s2
                  fsub.s       ft5, fa1, fs11, rne
                  fcvt.s.w     fs0, t3, rmm
                  fmv.w.x      ft6, a6
                  addi         a6, t3, 551
                  fclass.s     a2, fa5
                  divu         gp, a3, s7
                  slli         zero, a4, 2
                  andi         s11, t5, 401
                  sll          s6, tp, ra
                  sltu         a2, zero, a2
                  srli         s4, a2, 9
                  fcvt.w.s     s1, fs11, rup
                  fmv.x.w      s11, fa7
                  add          a7, s3, s5
                  sub          t2, sp, a5
                  srl          tp, t4, t0
                  divu         s9, a0, s5
                  mulh         gp, s3, a4
                  andi         a5, a3, -948
                  fsgnjn.s     fs4, fs6, ft10
                  slti         t0, gp, 1577
                  fdiv.s       ft0, fa3, fs2
                  fmul.s       ft8, ft1, fa2
                  fclass.s     gp, fa1
                  mul          s10, a7, s0
                  add          s6, s10, s11
                  fsgnjx.s     ft0, ft2, fs3
                  fcvt.s.w     ft0, s4, rdn
                  srli         s8, s5, 21
                  mulhu        a0, s7, t6
                  remu         s7, s9, s10
                  fsgnjn.s     ft1, fs7, ft4
                  fcvt.s.w     fs4, a7, rtz
                  rem          s6, s2, s1
                  fsgnjn.s     fs11, ft7, fs5
                  add          t0, gp, sp
                  ori          s7, s5, 258
                  flt.s        s2, fs3, ft0
                  rem          s4, s7, t5
                  srai         zero, ra, 11
                  mulhu        s6, s1, a1
                  fcvt.s.wu    ft1, a6
                  sll          s6, s1, a6
                  fcvt.w.s     s0, ft0
                  fle.s        s2, ft7, fs1
                  fmin.s       fs3, fs7, fa3
                  slti         a6, s6, -2043
                  fcvt.s.wu    ft7, t1
                  sll          s1, t5, s4
                  sltiu        s7, zero, 972
                  mul          s7, s8, ra
                  fsgnj.s      fa3, ft10, ft5
                  xori         t3, a4, -439
                  fmin.s       fa5, fa3, fs9
                  xor          s6, s8, s11
                  add          tp, s11, a3
                  xor          a2, a2, s8
                  mulhu        tp, ra, s1
                  remu         a2, s6, s0
                  mulhu        s1, a2, s4
                  slli         zero, s5, 7
                  fdiv.s       ft0, fs4, ft7, rup
                  fmax.s       fa1, fs2, ft2
                  fmul.s       fa2, ft0, fa0, rdn
                  ori          a7, ra, -1322
                  sra          s8, a3, t0
                  nop
                  xori         a7, ra, 1418
                  lui          t3, 532152
                  divu         sp, t1, zero
                  srli         s10, a2, 12
                  fmax.s       ft11, fa4, fa7
                  fmax.s       ft9, ft1, fs3
                  ori          s0, s8, -658
                  fmv.w.x      fs3, ra
                  andi         gp, s0, -1399
                  fsub.s       fa2, ft0, fs1, rdn
                  div          s1, s11, s4
                  fsub.s       fa6, ft5, fa6, rup
                  fcvt.w.s     s4, ft10
                  fsgnj.s      fs7, ft7, ft5
                  feq.s        t1, ft8, fs9
                  mulh         s10, a0, s8
                  fmax.s       fs6, ft10, ft4
                  fle.s        s11, fa3, ft1
                  or           s1, gp, s11
                  xori         sp, s3, 1854
                  mulh         s1, s8, a3
                  fadd.s       fs11, ft6, fs11
                  mulhu        a5, s7, zero
                  fmv.x.w      a6, fs5
                  slt          a0, s10, a6
                  andi         s6, a4, 1723
                  and          s11, ra, a4
                  add          s7, s11, a3
                  sll          ra, s9, s4
                  srl          sp, a1, tp
                  or           s1, t3, a0
                  div          zero, s10, s10
                  fmv.w.x      ft1, s4
                  sltu         sp, s3, s11
                  fmv.x.w      zero, fa6
                  fle.s        t1, ft9, ft2
                  fmv.w.x      ft3, s0
                  fadd.s       ft0, ft2, ft11
                  fdiv.s       fa2, fs6, ft0
                  slt          ra, s2, t2
                  nop
                  fsgnjx.s     fa7, ft10, ft4
                  andi         s2, a1, 1204
                  ori          s4, s5, 684
                  feq.s        a7, fa2, ft3
                  srai         s2, t2, 13
                  fadd.s       fs8, fs8, ft3
                  mulhsu       s1, s8, a2
                  sub          a5, ra, ra
                  sra          s1, sp, a3
                  fsgnjx.s     fs9, fs1, fs5
                  fdiv.s       fa7, ft4, fs4
                  feq.s        s9, ft3, ft0
                  sra          s3, t0, a6
                  sll          s7, s11, s1
                  fsgnj.s      fa2, fs2, ft2
                  auipc        a3, 964772
                  fsgnjx.s     fa3, ft4, ft0
                  add          t0, gp, gp
                  mulhu        t2, a3, a0
                  fsub.s       fs11, ft5, ft5, rup
                  fsgnjx.s     fs1, fs6, fs6
                  fsgnj.s      fa1, fs7, fa7
                  slli         t2, s5, 2
                  remu         s6, a0, t5
                  sra          a7, a0, s5
                  fmul.s       ft10, fs0, fa6, rmm
                  fle.s        a7, fs3, ft11
                  fmin.s       fa6, fs9, fs5
                  fsqrt.s      ft4, fs11, rup
                  fcvt.s.wu    fa6, s1, rup
                  fmax.s       ft0, ft9, fs2
                  sub          s10, a6, s10
                  remu         sp, t1, t1
                  sltiu        zero, s11, 1194
                  srli         s4, sp, 20
                  addi         s6, s11, 1115
                  slti         ra, a6, 357
                  divu         a2, t5, s11
                  add          t4, s10, zero
                  fmin.s       fa3, fa0, ft11
                  lui          t1, 707508
                  sub          s4, a0, s8
                  fadd.s       ft2, ft1, fa7
                  addi         s6, t3, 1835
                  addi         a5, a0, -559
                  div          s9, s3, t4
                  ori          a2, s5, -489
                  fmv.x.w      s8, fs2
                  fmin.s       fa5, fa5, fs2
                  fcvt.wu.s    s4, fs2, rtz
                  or           a3, t5, t1
                  andi         ra, a5, -1602
                  mulhu        s2, t2, sp
                  fclass.s     a0, fs8
                  fsub.s       ft3, fa4, ft1, rmm
                  fcvt.s.w     ft6, a5, rmm
                  sll          s0, a6, tp
                  feq.s        ra, ft6, fa0
                  ori          s8, s8, 501
                  div          a5, a7, a2
                  srl          a5, zero, s2
                  mulhsu       tp, ra, t6
                  fdiv.s       fa2, ft5, fa2, rup
                  fsqrt.s      fs4, fs0, rmm
                  sra          a1, s10, tp
                  sra          sp, t6, s8
                  mulh         t4, tp, a5
                  fmin.s       fs4, fs0, fs8
                  mulhsu       t2, gp, s7
                  and          ra, s1, a1
                  sltu         s11, s0, s4
                  srl          a5, s11, s10
                  sub          s6, t0, a1
                  or           s6, tp, s1
                  and          sp, a3, s3
                  mul          t4, s2, a0
                  mulh         s3, s10, a6
                  srai         s10, a4, 26
                  lui          s3, 65197
                  auipc        s7, 261116
                  sra          gp, t2, s2
                  sltu         t2, a6, s3
                  srl          s0, a3, t6
                  flt.s        s1, ft5, fs8
                  mulhsu       s5, t6, s9
                  slti         s11, a7, -484
                  fsgnjn.s     fa0, fa1, fa5
                  fdiv.s       ft11, fs4, fs11
                  sltu         s7, s1, ra
                  fsgnj.s      ft0, fs6, fs10
                  fsgnjx.s     fa0, fs10, fs9
                  div          a3, s3, s11
                  fmv.x.w      a6, ft6
                  remu         a0, a7, a0
                  remu         sp, t6, s1
                  fmax.s       ft4, fa7, ft9
                  remu         s11, s10, t6
                  and          gp, s1, a5
                  fdiv.s       fa6, fs0, fa6
                  add          a2, s5, s9
                  srai         t2, ra, 11
                  mulh         a5, s1, t0
                  slt          a2, ra, sp
                  rem          s5, t1, s2
                  and          a5, s4, s0
                  srl          s5, t6, s1
                  srli         sp, a0, 15
                  srli         a7, s5, 14
                  mulhu        s3, gp, ra
                  srli         a1, t6, 17
                  fsub.s       fs6, fa5, fa2
                  fcvt.s.w     fs11, t6
                  sltu         t1, s8, s5
                  flt.s        t1, fa4, fa4
                  fsgnjn.s     fs4, ft3, ft0
                  add          ra, s11, zero
                  srli         s11, a4, 30
                  slt          a5, s4, s1
                  sltiu        s5, s3, -326
                  ori          s9, gp, 1232
                  ori          s2, zero, 1462
                  slti         t4, s11, -1942
                  fclass.s     t2, ft6
                  fle.s        a1, fa0, ft2
                  mulh         a7, sp, s7
                  remu         t1, s0, s6
                  andi         s4, s6, -332
                  fmax.s       ft7, fs2, fs3
                  fmin.s       fa3, fa0, fa1
                  srai         s3, tp, 23
                  and          t4, s2, t4
                  xori         s10, s3, -1034
                  mulhu        a2, s10, t5
                  mul          s8, a0, gp
                  lui          a2, 201874
                  mulhsu       s11, s0, t6
                  div          t3, s8, t3
                  nop
                  lui          zero, 846409
                  mulhu        sp, s1, a2
                  fmax.s       fa1, ft7, fa5
                  fcvt.s.w     fs10, t0, rmm
                  xori         a6, a4, 2040
                  mul          t1, sp, t5
                  fmul.s       fs9, fs2, fs3
                  fsgnjx.s     fa7, fa7, ft3
                  fsgnjx.s     ft9, ft1, ft5
                  sll          s5, a4, ra
                  fmv.x.w      t0, fa0
                  sll          t0, s9, tp
                  mul          s5, a4, gp
                  xor          ra, a4, a1
                  fmv.w.x      ft0, sp
                  lui          s10, 709357
                  srli         s1, sp, 27
                  add          ra, s8, a1
                  mulhsu       a7, s5, sp
                  sll          s4, a1, a5
                  xor          t0, gp, a4
                  fmax.s       fa6, fa5, fs5
                  feq.s        s1, fs2, fa2
                  srl          s9, gp, sp
                  nop
                  fsqrt.s      ft4, fs8, rne
                  mul          a6, s3, s10
                  ori          sp, zero, -567
                  sub          s8, a1, s7
                  fcvt.wu.s    sp, fa7
                  and          a1, tp, s6
                  slli         s7, a4, 5
                  andi         s1, s9, 1838
                  sltu         s1, a7, a0
                  lui          sp, 394549
                  ori          t0, s5, -758
                  div          s5, s1, a5
                  fcvt.wu.s    s4, ft6
                  mul          s11, s4, a4
                  lui          s4, 119060
                  fsgnjx.s     ft5, ft7, fs7
                  feq.s        t2, ft1, ft7
                  srai         t2, t4, 23
                  xor          s1, a1, s10
                  fsgnjn.s     ft11, ft2, fa7
                  divu         t0, a4, s5
                  slli         gp, s0, 7
                  fsgnjn.s     fa6, fa6, ft0
                  rem          s8, t2, t5
                  fmv.x.w      a0, ft7
                  flt.s        s5, fa1, ft8
                  fmin.s       ft5, fs7, ft11
                  fmv.x.w      a7, ft8
                  rem          t4, a4, s5
                  slli         t3, t6, 8
                  slt          s6, s10, t4
                  or           t4, a5, ra
                  or           a0, a5, t4
                  fle.s        s3, fs10, ft10
                  and          gp, a5, a3
                  fsgnjn.s     fa6, fs0, ft2
                  fcvt.wu.s    s5, fa1, rtz
                  srl          s10, s5, s9
                  nop
                  fcvt.w.s     a0, fa1
                  mulh         s0, s6, a4
                  mulhsu       a2, s10, s5
                  nop
                  nop
                  xor          t3, a2, t6
                  add          a1, gp, s8
                  mul          s2, a0, gp
                  fle.s        s8, ft3, fs9
                  srai         a7, s11, 3
                  fsgnj.s      fa3, ft1, fa1
                  slti         s0, a0, -136
                  mulhsu       t4, t1, s4
                  and          s1, zero, t0
                  sub          s5, s2, t4
                  sub          tp, s11, a2
                  fclass.s     t0, fa4
                  fcvt.s.wu    fs0, a6
                  flt.s        sp, fs6, fa2
                  lui          t2, 263413
                  lui          gp, 1005504
                  fmv.w.x      fs4, a5
                  xor          s6, a0, s5
                  sra          s8, s3, t1
                  xor          s8, sp, t3
                  slti         s4, t4, -1529
                  fle.s        s0, fs9, ft10
                  fmin.s       fs4, ft11, ft0
                  xori         tp, s7, -606
                  sll          s10, t2, a1
                  divu         a0, a5, t2
                  fcvt.w.s     s11, fs7
                  mulh         s3, tp, a2
                  fmin.s       ft3, fa3, fa3
                  mulh         s2, s7, t4
                  and          s2, t4, s2
                  div          s5, s3, ra
                  fcvt.w.s     t2, fs10, rtz
                  mulhu        s2, gp, a6
                  fclass.s     s8, ft8
                  sltiu        t2, t1, -1478
                  divu         sp, s6, tp
                  fsqrt.s      fs4, ft0
                  fcvt.s.w     fa2, tp, rup
                  div          s5, s9, s6
                  auipc        s1, 347545
                  lui          ra, 946021
                  fmin.s       fa0, fa6, ft6
                  add          s2, t6, zero
                  sub          a2, a1, a4
                  fcvt.s.wu    ft11, t6
                  add          s9, a1, t1
                  slt          a1, t3, t5
                  andi         t0, a7, 1731
                  sll          t2, a0, t3
                  sub          s1, ra, a1
                  fsub.s       fs0, ft1, fs1
                  fadd.s       ft10, ft10, ft7
                  fsgnjx.s     fa5, ft6, fs10
                  or           a7, s2, s10
                  fcvt.s.wu    fs10, t1, rtz
                  divu         a7, a1, s10
                  slti         a0, t0, 1569
                  nop
                  mulhu        s1, t2, s0
                  xori         a1, s7, 1060
                  nop
                  mulhsu       t4, t3, sp
                  srl          a1, a6, sp
                  fadd.s       fa6, ft7, fa2, rne
                  fclass.s     tp, fa0
                  add          a0, a7, s10
                  fcvt.w.s     a6, fa5, rtz
                  sltu         a1, s4, zero
                  feq.s        t1, fs0, ft0
                  lui          s7, 197879
                  fcvt.s.w     ft3, s8
                  sltiu        s9, s1, -1610
                  fcvt.s.wu    fs7, gp, rmm
                  remu         a3, a2, a2
                  and          a6, t1, s9
                  feq.s        s1, fs4, ft3
                  fmv.w.x      fs6, a6
                  fle.s        t4, ft5, ft2
                  or           s5, t6, a0
                  fdiv.s       fs0, ft0, ft4, rdn
                  mulh         sp, s6, ra
                  fsub.s       fs2, ft2, fa6, rdn
                  sra          ra, s7, s7
                  fmin.s       fa6, ft7, ft4
                  srai         s5, a0, 27
                  fsgnj.s      ft11, ft9, ft3
                  fclass.s     s11, fs3
                  fmv.w.x      fs10, a3
                  andi         ra, s2, -795
                  fadd.s       fs8, fa1, fa6, rdn
                  sub          zero, s10, t3
                  andi         s8, a3, 1684
                  sltu         s9, a6, s9
                  flt.s        ra, ft10, fa3
                  srl          t4, s1, s7
                  srai         a3, gp, 7
                  nop
                  mulhu        a7, a3, a5
                  nop
                  fmv.x.w      t3, ft4
                  fcvt.wu.s    sp, fs1
                  fsub.s       fs8, ft3, ft10, rdn
                  fmv.x.w      sp, fs1
                  fadd.s       ft3, fa2, fs3, rdn
                  sll          s2, t4, s11
                  fmv.x.w      s4, fs2
                  mulhu        s0, s9, a6
                  fsub.s       fs11, fs1, ft6
                  fmv.w.x      fs8, a4
                  mulhu        a1, t3, a6
                  xori         t1, t6, -1357
                  divu         s0, s9, t2
                  mulhu        zero, s8, a1
                  fsub.s       fa6, fs2, ft2, rup
                  add          s7, ra, t1
                  fmv.x.w      t2, fs8
                  fmax.s       fs6, fs2, ft1
                  or           a2, s8, sp
                  sub          a3, s11, zero
                  mul          t2, s0, t5
                  srai         s0, t5, 3
                  fle.s        s4, fa3, fs10
                  fsgnj.s      fa7, fs8, fa0
                  auipc        s3, 1033989
                  fmul.s       ft10, ft7, fa1
                  sltiu        s5, t6, -1441
                  or           gp, zero, t2
                  srli         tp, a0, 26
                  sltu         zero, a7, t1
                  fle.s        t2, fa6, fa5
                  flt.s        ra, fa3, ft3
                  sltu         zero, a0, a1
                  sra          ra, t3, s3
                  slli         s9, s4, 13
                  flt.s        sp, ft3, fa3
                  fcvt.s.wu    fa5, gp
                  sltiu        tp, s0, 1797
                  fcvt.w.s     s10, ft6, rdn
                  fsgnjn.s     fs2, fs10, fs1
                  nop
                  mulhsu       t4, a4, s4
                  fmv.w.x      fa7, a5
                  add          a7, a6, sp
                  div          s4, s3, s5
                  and          s9, a6, t0
                  sll          s8, s2, gp
                  xor          sp, a2, tp
                  slti         t3, t6, 708
                  rem          a7, s6, sp
                  fsgnjn.s     fs2, fs8, fs5
                  fmul.s       fa4, fs10, fa4
                  nop
                  divu         s6, a0, a0
                  fcvt.w.s     tp, fa4, rup
                  sub          tp, s5, a2
                  or           a3, t3, t0
                  sltu         a0, sp, a2
                  fmv.x.w      s5, fa5
                  xori         t2, s7, 1734
                  slt          s7, gp, s3
                  mulhsu       s4, s0, ra
                  sub          s6, a5, a5
                  or           t1, ra, t0
                  nop
                  slti         s3, a0, 1774
                  slt          a2, a4, t2
                  sra          s8, a4, t2
                  fadd.s       ft3, ft4, fs9
                  slli         a6, gp, 31
                  xori         a2, t3, 538
                  fmax.s       fs11, fs7, fs1
                  sra          s4, s10, sp
                  fclass.s     gp, fa0
                  srli         zero, t2, 9
                  xori         a6, a2, -312
                  fcvt.s.wu    ft2, t5, rtz
                  and          a0, a7, s10
                  slli         a7, t2, 13
                  mul          gp, s8, s6
                  sll          gp, s7, s6
                  sll          s1, t4, s4
                  ori          gp, a5, -398
                  sra          a6, a3, s10
                  feq.s        s8, ft8, fs0
                  lui          s2, 279577
                  rem          s3, a1, t0
                  rem          sp, ra, s4
                  rem          t0, s2, zero
                  fclass.s     s8, fa0
                  mulhu        gp, s10, s1
                  auipc        tp, 23183
                  fcvt.w.s     a6, fa1
                  srai         a3, a0, 27
                  addi         s7, s5, -982
                  fle.s        a7, fa0, fa1
                  divu         ra, s6, s11
                  fcvt.w.s     s11, fs10
                  lui          a6, 135852
                  sltu         tp, s8, t5
                  xori         a3, t4, -1287
                  ori          a7, t1, -1989
                  slti         zero, a1, 859
                  srl          s6, t4, a2
                  feq.s        a0, fs3, ft1
                  fclass.s     tp, fs8
                  fsub.s       fs7, fs2, fs4, rup
                  sll          s10, zero, s9
                  div          s10, t2, t6
                  fsgnjx.s     ft2, fs10, ft0
                  fmin.s       ft5, fs0, ft1
                  or           s9, s2, a7
                  fcvt.w.s     a7, ft1, rtz
                  srl          a3, a1, t3
                  fsub.s       ft2, ft3, fs6
                  fsgnjn.s     fs4, fa7, ft7
                  mulh         s2, t4, t0
                  fmul.s       ft7, ft9, fs5
                  xori         s3, zero, -666
                  ori          t0, a3, -119
                  xor          a7, a7, ra
                  add          s9, s5, a1
                  sltiu        t0, s10, -197
                  slli         t1, t3, 26
                  sra          t2, gp, t4
                  mulh         s8, a7, t6
                  xor          a7, s11, t0
                  fclass.s     t4, fa4
                  xor          s0, t0, s8
                  fsgnjx.s     fs0, ft7, ft6
                  remu         a3, t0, a7
                  srai         s7, a4, 8
                  srli         t1, tp, 19
                  mul          s1, s4, s10
                  feq.s        a1, fa0, fs7
                  mulh         s2, t5, a0
                  fmul.s       fa2, fs11, fs10, rmm
                  mulh         s9, a7, a5
                  fclass.s     s11, ft2
                  flt.s        a2, fa3, fs9
                  mulh         a3, a4, t3
                  andi         s9, t5, 1331
                  flt.s        a5, ft5, ft10
                  xori         s3, a5, -1039
                  ori          t1, s9, -1699
                  nop
                  fcvt.w.s     zero, fa3
                  auipc        gp, 1021062
                  fmin.s       ft3, fs4, fs0
                  xori         s6, s5, -625
                  rem          t2, s5, s1
                  slt          gp, s0, ra
                  addi         t2, a1, 1710
                  fmin.s       fs11, fs3, ft8
                  fsqrt.s      fa3, fa4, rmm
                  addi         a0, s1, -72
                  srl          s6, s9, a1
                  srai         a0, a6, 3
                  fsqrt.s      ft4, ft7, rdn
                  fcvt.s.w     fs5, s1, rup
                  xori         s6, a0, -1559
                  srai         a3, a7, 5
                  nop
                  feq.s        s8, fs4, fs6
                  add          a3, s7, t2
                  fsgnjx.s     fa7, fs7, fa3
                  mulhu        s4, a0, t5
                  addi         a3, s8, 1660
                  fcvt.s.wu    ft7, t1
                  fcvt.s.w     fs4, a4, rdn
                  slli         t4, tp, 22
                  remu         a1, a3, s4
                  sltu         s9, t6, t5
                  fsqrt.s      fs2, fa1
                  fcvt.wu.s    ra, fs1
                  fcvt.s.w     fs7, a5, rdn
                  addi         s11, t4, -167
                  slt          s9, ra, t1
                  mul          a5, sp, a6
                  auipc        a1, 912259
                  srl          a7, s3, t3
                  fsqrt.s      fa4, fs4
                  sltu         a2, t5, a0
                  divu         s0, s11, zero
                  fclass.s     s1, ft7
                  ori          s9, a0, -1413
                  srli         a6, t6, 24
                  fmv.x.w      s0, fs4
                  fsqrt.s      fa3, ft9
                  and          a5, s3, s6
                  or           s8, s9, tp
                  rem          s9, ra, a7
                  srl          a6, t6, s8
                  addi         a3, s9, -1061
                  fmax.s       fa3, ft8, ft2
                  fsgnjn.s     fa5, fa0, fs10
                  sltiu        gp, s4, 1260
                  div          a6, s10, sp
                  lui          zero, 177675
                  flt.s        s4, fa7, fa5
                  auipc        s8, 59334
                  lui          a5, 105366
                  andi         ra, t1, 611
                  fadd.s       fs7, fa7, ft9, rtz
                  fmax.s       fs8, ft4, fs7
                  fmax.s       fa4, fs0, ft8
                  slt          sp, t1, s5
                  mulhu        s4, t2, gp
                  auipc        s1, 22591
                  sra          s11, a5, s5
                  fmv.x.w      a7, fs3
                  andi         t2, s2, 1257
                  fcvt.wu.s    s4, fs6, rup
                  fsgnjx.s     ft1, ft9, ft7
                  andi         tp, t1, 561
                  divu         a5, s1, zero
                  fsgnjn.s     fa4, fs9, ft6
                  fsub.s       fs9, fs5, fa5
                  sll          s4, a2, t6
                  slti         ra, t0, -652
                  or           s8, s3, t3
                  slti         a7, a4, -1584
                  slt          s4, t3, s1
                  fmv.w.x      ft7, a3
                  sltiu        s6, s4, 1306
                  xor          zero, s8, s5
                  nop
                  and          t1, t4, zero
                  fmv.x.w      t0, ft10
                  srl          s4, t5, sp
                  fsgnj.s      fa3, fs10, fa0
                  andi         s6, a3, -1515
                  srli         t3, a6, 1
                  rem          s7, t4, sp
                  mulh         sp, t2, a1
                  mulhu        a7, a3, s6
                  slli         t1, a3, 8
                  slli         s0, a5, 3
                  fsgnjx.s     ft11, ft2, fa5
                  fmv.x.w      gp, fa2
                  fadd.s       ft2, ft0, ft8, rtz
                  fcvt.s.w     fa1, sp
                  fsgnj.s      ft6, fs10, ft11
                  fclass.s     s7, fa0
                  rem          a5, t2, t5
                  lui          s3, 478343
                  remu         t1, s6, a0
                  ori          a0, s6, -1549
                  feq.s        s5, fa6, fa6
                  andi         t2, s8, -391
                  remu         tp, s11, ra
                  mul          s1, gp, s2
                  slt          s9, s0, s2
                  srai         s9, s9, 10
                  auipc        ra, 439148
                  or           s2, s5, sp
                  fadd.s       fs0, fa0, fa7, rmm
                  divu         t1, zero, s4
                  sra          tp, tp, s3
                  fmv.w.x      fa2, s2
                  rem          s4, s11, tp
                  flt.s        t2, fs0, fa6
                  sltu         s7, s0, t5
                  mulh         s6, t4, a3
                  fdiv.s       fs7, fs1, fs2, rmm
                  fmin.s       fa3, fa4, fa6
                  fcvt.s.wu    fa1, s3, rdn
                  sra          s3, s1, t2
                  mulh         a0, s6, ra
                  sub          s7, s0, s8
                  xori         t0, t6, -2011
                  mulh         s2, t0, ra
                  fmv.x.w      a1, ft9
                  and          s11, s8, sp
                  fcvt.w.s     s8, fs4
                  andi         s5, s6, 620
                  xori         s9, a3, 1210
                  flt.s        s0, fa7, ft1
                  slti         ra, a7, 746
                  srli         s0, t3, 27
                  fle.s        a6, fa5, fa0
                  fmv.w.x      fs9, s2
                  sub          t1, s1, s6
                  divu         s3, s8, ra
                  slti         s9, a5, 659
                  feq.s        t0, fs3, ft4
                  fsub.s       fa4, ft1, fa5
                  div          s1, a1, a0
                  nop
                  auipc        a0, 858406
                  ori          s8, a3, -367
                  sltiu        s10, s2, 1846
                  auipc        a6, 197701
                  fcvt.w.s     ra, fs3
                  sltu         s10, s3, s4
                  fclass.s     t3, fs2
                  ori          s0, s10, 2029
                  slti         t0, s7, 349
                  fsgnjn.s     fs10, fa3, ft9
                  mul          tp, a4, t1
                  addi         t1, a7, -422
                  sub          t0, a6, s1
                  mulhu        a5, a0, a0
                  fcvt.wu.s    s6, ft10
                  sra          gp, t5, a5
                  sltu         s2, zero, t6
                  fsub.s       fs2, ft8, ft9
                  xor          s4, s1, s10
                  xori         s2, t1, -722
                  fdiv.s       fs3, ft6, fa1, rne
                  fsqrt.s      ft7, fs7
                  xor          s8, t3, t3
                  srli         s11, a5, 8
                  ori          gp, gp, -417
                  fcvt.wu.s    s3, fs8, rtz
                  slti         a3, s8, 1150
                  mul          t2, t2, a6
                  fmv.w.x      fs7, s11
                  fcvt.s.w     fa1, s9
                  andi         t0, a0, 239
                  fsgnjx.s     fa7, fs3, ft10
                  fcvt.w.s     s4, fs2
                  fcvt.s.wu    ft6, t1, rdn
                  sll          a3, a4, a3
                  mulhsu       s0, gp, a6
                  sra          a0, s10, a5
                  fmv.w.x      fs9, s4
                  slt          t3, t6, s3
                  fcvt.w.s     s5, fs6
                  addi         a1, a5, -301
                  sll          sp, s11, t2
                  fmul.s       fa7, fs5, fs7
                  mulhsu       gp, a6, a3
                  fmin.s       fa1, fa0, fs2
                  andi         s7, s3, -1008
                  or           s7, a4, a4
                  div          s11, t5, s10
                  and          a5, t3, a4
                  div          a2, zero, t4
                  flt.s        s11, ft1, ft10
                  sub          a0, s2, s9
                  fcvt.wu.s    t4, fs6
                  xor          zero, tp, a4
                  fcvt.wu.s    ra, ft7
                  mulhu        a6, s7, gp
                  lui          s4, 223162
                  slli         a5, t3, 16
                  fclass.s     a2, ft7
                  fsgnj.s      ft9, fs4, ft9
                  mulh         a2, sp, s8
                  fcvt.s.w     fs1, a7
                  add          t2, s5, a5
                  fmv.x.w      s11, ft1
                  and          zero, a6, t2
                  mulh         a3, gp, s11
                  fmv.x.w      ra, fs8
                  fmax.s       fs8, fa4, ft7
                  or           s4, ra, s10
                  nop
                  auipc        zero, 506446
                  fadd.s       fs11, ft5, ft1, rdn
                  fmul.s       fs8, fa1, fa2
                  fcvt.wu.s    s6, fs0, rmm
                  slti         t3, a3, 464
                  fcvt.w.s     a6, ft1
                  div          a3, t6, s2
                  fsqrt.s      fs6, fa6, rdn
                  mulhu        a2, a1, a6
                  fdiv.s       fa4, ft0, fs1
                  mulhu        zero, s3, a5
                  fadd.s       fa4, fa0, ft2, rup
                  fsub.s       fa3, fs9, fs11
                  xor          a6, s0, s7
                  mulhsu       ra, s1, a3
                  fmv.w.x      fa1, t5
                  addi         s3, a5, -1418
                  sll          t3, a5, s4
                  slli         s10, t6, 2
                  srai         t1, a0, 6
                  fcvt.w.s     s9, ft3, rmm
                  fsqrt.s      fs4, ft5
                  or           a5, s3, a0
                  fcvt.wu.s    t2, fs7
                  fmin.s       fa1, ft9, ft9
                  fmv.w.x      fs4, a1
                  fdiv.s       ft3, fs5, ft3
                  add          t1, t0, t5
                  fdiv.s       fa5, fs4, fs4
                  div          s7, t0, s1
                  mul          a0, zero, t4
                  divu         s6, a5, t3
                  rem          t4, a1, gp
                  feq.s        s6, fa6, fs7
                  ori          s2, t5, 817
                  div          a3, a6, ra
                  fdiv.s       ft6, fa5, fa0, rdn
                  slti         a5, s9, -445
                  nop
                  fadd.s       fs5, ft10, fs10
                  srl          s2, s7, a4
                  srli         t0, s9, 18
                  divu         s3, a1, s5
                  fmv.w.x      fa6, a4
                  fcvt.s.w     ft9, a6
                  fmv.x.w      s8, fa5
                  slti         s10, t1, -1426
                  fcvt.wu.s    t4, ft4
                  sltiu        s11, t6, 856
                  slli         t0, s0, 17
                  xori         s9, s8, 8
                  fle.s        s0, fa2, fa0
                  mulh         sp, s0, s11
                  fmin.s       fa0, fa7, ft9
                  sub          t4, s1, s9
                  fadd.s       ft6, ft4, ft10
                  xori         s3, s0, 1984
                  andi         a3, tp, -945
                  fsgnjn.s     fs5, ft8, ft11
                  mulh         t0, s0, a7
                  mulhsu       t1, s4, a5
                  rem          t2, t4, gp
                  fsgnjn.s     ft7, fs3, fa7
                  ori          s9, tp, 1994
                  addi         s1, a3, -1624
                  fmv.x.w      t1, ft6
                  fsgnjn.s     fa1, fs3, fa4
                  feq.s        a2, fs7, ft7
                  slli         t2, tp, 22
                  fle.s        s8, ft10, fa4
                  nop
                  remu         a3, t5, tp
                  fmax.s       fs11, fs7, fa1
                  fadd.s       fs0, fs9, ft2, rmm
                  srai         t2, t2, 9
                  fclass.s     gp, fs0
                  slti         t0, a0, 1983
                  mulhu        a5, gp, s2
                  div          a1, s0, s9
                  ori          a3, s7, -1341
                  remu         t2, s7, t6
                  div          a7, a6, a1
                  mulh         a5, s2, s7
                  divu         t2, sp, a5
                  fdiv.s       fs2, fa4, fs2
                  fdiv.s       fa1, fa3, fs3, rup
                  fcvt.wu.s    a2, fs10, rtz
                  fcvt.wu.s    a1, ft4
                  div          s6, a2, a6
                  srai         s2, s1, 6
                  xor          a1, a4, a3
                  slli         s8, t6, 21
                  sltu         s7, s3, sp
                  div          s3, s7, s0
                  flt.s        s8, fa5, ft0
                  fsub.s       fa3, fa2, ft6, rne
                  fcvt.s.wu    fs4, s11, rup
                  xor          s11, gp, a1
                  slt          a1, a7, s1
                  srli         a2, a0, 0
                  fmul.s       ft10, ft5, fa7
                  fadd.s       ft5, ft11, ft7
                  auipc        s6, 559092
                  feq.s        s8, ft7, fa6
                  fclass.s     t3, fs11
                  fmin.s       ft4, fs3, fa4
                  andi         s6, a5, -583
                  mulhu        zero, s0, s5
                  add          s1, a6, s5
                  or           t2, s8, s9
                  auipc        a1, 305724
                  fcvt.w.s     sp, fs10, rup
                  fcvt.s.wu    ft3, t3
                  auipc        sp, 389947
                  sub          a2, a4, sp
                  fmul.s       ft8, ft0, fa6
                  fsgnj.s      fs6, fa2, fs2
                  slli         s3, t1, 21
                  addi         t0, s7, 483
                  flt.s        a7, ft2, fa4
                  slt          zero, s1, a5
                  fle.s        s10, fs11, fa0
                  xori         t4, a1, 1157
                  lui          t2, 1039689
                  sll          a5, s0, s10
                  flt.s        a0, fa3, ft1
                  mulhsu       tp, a4, s5
                  fcvt.s.w     ft5, s7
                  nop
                  fmv.w.x      ft3, s0
                  divu         ra, a2, s9
                  rem          t3, s9, a6
                  fmax.s       ft5, fa4, fa0
                  fadd.s       ft4, ft4, fs4, rmm
                  fadd.s       fs9, fa3, ft9
                  fmax.s       ft3, fa7, fa0
                  auipc        a7, 121323
                  fsgnj.s      fa0, fa1, fa1
                  remu         s8, s2, t0
                  slli         s9, a6, 16
                  fadd.s       ft7, fs8, ft8
                  fcvt.s.w     ft1, s7, rmm
                  rem          s6, s10, a6
                  divu         s9, s0, s10
                  addi         t4, zero, -649
                  fclass.s     a1, fs8
                  divu         t3, zero, t5
                  andi         s4, s10, 1679
                  slli         s7, a2, 16
                  fle.s        s11, ft0, fs11
                  fsgnjx.s     fa0, fa2, fs4
                  flt.s        s6, ft10, fa0
                  fcvt.w.s     s7, fs9, rdn
                  fcvt.w.s     t2, fa6, rdn
                  mulhsu       t1, s2, s9
                  fcvt.wu.s    ra, ft9, rtz
                  slli         a3, t1, 4
                  auipc        t2, 724592
                  sltu         t3, s3, s0
                  fmv.x.w      s1, fa1
                  srli         a2, a4, 8
                  add          a6, s11, s3
                  srai         s2, a2, 27
                  mul          t2, gp, a3
                  mulhsu       t4, s9, t3
                  fmul.s       fa6, fs6, ft7, rtz
                  remu         s7, t1, t5
                  fsgnjn.s     fa6, fs0, fs9
                  fsgnj.s      fa5, fs3, fa6
                  divu         a1, a3, s0
                  flt.s        a7, ft3, ft3
                  flt.s        s2, ft10, fs11
                  xor          s8, t4, a5
                  mulh         t2, t4, s8
                  rem          a1, s8, s1
                  srli         a2, s10, 14
                  slt          a1, s3, t2
                  srai         a6, s10, 21
                  sll          t2, s3, t2
                  mulhu        t3, s0, tp
                  fcvt.wu.s    a6, fs10, rmm
                  auipc        s11, 1001687
                  fcvt.wu.s    s11, fa6, rtz
                  srl          t0, gp, tp
                  mulh         s2, s0, a1
                  ori          t0, s10, 336
                  fcvt.s.w     fs8, s1, rmm
                  fcvt.wu.s    t4, ft0, rne
                  slli         a6, sp, 5
                  fmv.w.x      fs1, t6
                  lui          s10, 1007864
                  slli         s10, s11, 30
                  sub          a7, t1, a1
                  srl          a6, s8, s6
                  xori         s4, tp, -1394
                  fadd.s       ft10, fs5, ft2
                  srai         a5, s4, 23
                  slli         s9, a7, 6
                  rem          a0, s2, sp
                  auipc        a6, 555607
                  sll          s10, a3, a7
                  xor          s2, sp, gp
                  sra          s6, a2, a3
                  div          ra, a1, s3
                  andi         s9, a0, -999
                  fcvt.w.s     t0, ft2
                  fsgnj.s      fa3, fa6, fa4
                  andi         s8, a4, -1058
                  slt          t2, a6, a5
                  mulhu        a1, a5, t4
                  mulhsu       a3, s10, t4
                  mul          t4, s3, s1
                  nop
                  mulhu        t0, s8, s6
                  slli         a6, gp, 5
                  addi         s6, s4, 439
                  fclass.s     gp, ft4
                  fsqrt.s      fs4, fa0
                  fmv.w.x      ft3, s1
                  srai         s0, s2, 26
                  xori         a6, a6, -960
                  sltu         s11, s5, s9
                  fmax.s       fa0, fs3, ft11
                  nop
                  slti         a2, t5, -369
                  sltiu        a7, sp, 1192
                  sra          s10, a2, ra
                  fmv.x.w      ra, fs7
                  fsgnjx.s     ft5, fs5, fs8
                  xori         t1, s3, 1772
                  fcvt.wu.s    s2, ft7
                  fmul.s       ft1, fa1, ft0, rtz
                  nop
                  fmv.x.w      a1, ft5
                  div          zero, a7, s9
                  fsgnjn.s     fs1, fs2, fa0
                  xori         s2, sp, -187
                  feq.s        s4, fa7, fa3
                  fcvt.wu.s    s2, ft4
                  fmin.s       ft4, fa2, ft9
                  mul          s2, a2, s0
                  ori          ra, s0, -1954
                  fle.s        s0, fs7, fa7
                  fclass.s     a7, ft6
                  sra          t1, tp, t1
                  fsgnjn.s     fa2, fa7, ft1
                  fmv.w.x      fs9, a7
                  fadd.s       ft7, ft2, fs2
                  slt          a7, s0, s0
                  fsub.s       fs4, fs2, ft0, rdn
                  sll          s1, tp, t4
                  or           s2, a1, s6
                  nop
                  fadd.s       fa3, fs6, fs2, rne
                  addi         a3, t6, 1803
                  srai         a6, a7, 24
                  fsgnjx.s     fs10, ft11, fa5
                  flt.s        t1, fa1, fs0
                  fmin.s       ft9, fs6, ft1
                  fmv.x.w      t4, ft8
                  mulh         tp, a1, sp
                  feq.s        t0, fs2, fa6
                  fcvt.s.wu    fa1, a3
                  fcvt.w.s     s6, fs0, rne
                  sltu         t1, s5, a4
                  sltiu        s6, a1, -326
                  and          t4, s10, t2
                  and          s6, sp, s2
                  fmv.w.x      ft9, a7
                  srli         t0, s2, 25
                  sltiu        s1, a4, -1716
                  sltiu        a7, s10, 1049
                  fmax.s       ft8, fa6, fa7
                  nop
                  fsgnjx.s     fs3, ft6, ft9
                  fcvt.w.s     s4, fs6, rup
                  rem          s9, gp, s5
                  xor          a1, t6, s10
                  srai         s9, t4, 29
                  fsgnjn.s     fs6, fs0, fa3
                  fmul.s       ft1, fs4, ft9
                  auipc        s5, 469438
                  sra          a5, t6, t4
                  xor          a7, s3, a6
                  fsub.s       fs11, fa5, ft2, rdn
                  fsgnj.s      fs3, ft3, fs10
                  fcvt.wu.s    t1, fs8
                  fmul.s       fa5, ft0, fs9
                  auipc        zero, 759019
                  and          a2, a7, zero
                  rem          a6, a7, s8
                  fsgnjn.s     ft1, fs10, fs9
                  and          gp, s9, zero
                  srai         t2, a4, 14
                  fmax.s       fa0, fs10, fa7
                  mul          a6, a3, t1
                  ori          s4, t6, 126
                  fdiv.s       fa0, ft6, fs8
                  sltiu        s11, a7, 1524
                  fsgnjn.s     ft1, ft11, fa0
                  sll          s11, t6, t4
                  fcvt.w.s     s2, ft3, rup
                  flt.s        s11, ft11, fs6
                  fclass.s     s4, fa3
                  xori         zero, s0, -1967
                  fmin.s       fa2, fs2, fs10
                  div          s9, s0, zero
                  xor          s4, a5, s10
                  sltu         s3, s0, zero
                  mulh         zero, ra, sp
                  fsgnjn.s     ft8, ft9, ft4
                  fmin.s       fa0, ft5, fs11
                  fsub.s       fs4, fs10, fs10
                  fcvt.s.w     fs10, s5, rne
                  fmv.w.x      fs2, ra
                  fdiv.s       fs5, fa2, fs2
                  srai         s3, a3, 1
                  fdiv.s       ft4, fa7, fa7
                  div          zero, a7, a6
                  sll          a3, a0, tp
                  fsub.s       fs1, fa5, fa4
                  andi         s4, t1, 1746
                  fclass.s     ra, ft3
                  addi         s8, ra, -1024
                  addi         s1, t0, -1953
                  fcvt.wu.s    s4, fa5, rup
                  fle.s        s9, ft0, fs3
                  fcvt.s.wu    ft11, a1, rtz
                  addi         ra, zero, 186
                  or           s3, zero, a5
                  add          s11, a4, zero
                  fmv.w.x      fs3, t0
                  remu         s7, s10, s5
                  sll          s9, s8, sp
                  fsgnjx.s     fs6, fa2, ft3
                  sra          a7, zero, s5
                  fsgnjx.s     ft9, fa1, ft8
                  andi         s5, s1, 150
                  mulh         s10, s3, t2
                  fcvt.s.w     ft8, s0
                  fsgnj.s      ft7, fa0, fa1
                  fsqrt.s      fa3, fs6, rup
                  fmv.w.x      ft7, s7
                  mul          s0, t5, gp
                  fsgnjn.s     fs7, fs10, fa2
                  remu         s7, t0, s3
                  add          t0, sp, t6
                  fsgnjx.s     ft0, fs0, ft2
                  mul          s9, a0, t4
                  lui          t1, 417709
                  slt          zero, s8, a5
                  sll          s3, t5, a1
                  srli         a5, s3, 6
                  sll          s8, zero, t5
                  mulhu        s11, s9, s4
                  slt          a2, a0, a1
                  slli         tp, ra, 2
                  fsgnjn.s     fs0, fs5, fa2
                  fcvt.w.s     a3, ft6
                  sltiu        s5, a6, 901
                  fadd.s       ft11, fs8, fa5
                  mul          t4, t4, s2
                  andi         s10, a0, 863
                  fcvt.s.w     fs2, gp
                  addi         a7, s4, 737
                  sltiu        ra, t0, -1392
                  fsgnjx.s     fa1, ft6, fa3
                  fsgnjn.s     ft6, fa5, fs9
                  add          a2, tp, s5
                  add          s0, a5, s3
                  fmax.s       ft6, fs0, fa2
                  fsqrt.s      fs1, fs6, rmm
                  nop
                  fsqrt.s      ft8, fs2, rmm
                  fcvt.w.s     s1, fa6
                  fcvt.s.w     ft2, s4
                  fmul.s       fs10, fa1, fs6
                  or           s11, s3, a0
                  fcvt.s.wu    fs0, a2
                  addi         s8, s11, 49
                  slt          a1, t3, s2
                  srli         s8, a3, 13
                  sltu         gp, t4, a3
                  sub          s8, s4, t5
                  srl          a7, s2, tp
                  mul          t4, a1, a2
                  fsgnjn.s     fs5, fs5, fs1
                  and          t1, a6, a7
                  slli         a0, a7, 11
                  rem          a1, a7, s4
                  fmin.s       fs7, fa0, fs8
                  fcvt.w.s     s5, fs11, rne
                  mulh         t1, t4, a4
                  fsub.s       ft7, fa1, fa3
                  ori          sp, s0, -1705
                  fmv.w.x      fa3, tp
                  andi         s11, a5, 322
                  auipc        a3, 681810
                  fsgnj.s      fa2, fs10, fa5
                  lui          a6, 881000
                  srl          a0, a7, a5
                  sub          t3, s11, s2
                  fsgnj.s      ft4, ft11, fs8
                  fmv.w.x      fs7, a1
                  nop
                  slt          a1, a5, s10
                  slti         a1, a5, -1752
                  fcvt.wu.s    a5, fa1, rne
                  sll          a2, a5, a5
                  auipc        s3, 272524
                  ori          a2, a5, -727
                  fmv.w.x      fs9, tp
                  fsgnjn.s     ft1, fs11, fa5
                  fmul.s       fa4, fa2, ft7, rmm
                  divu         s0, a6, a1
                  fmin.s       fa1, fa1, fs11
                  fclass.s     s2, fs9
                  mul          t4, sp, t5
                  feq.s        s6, fa1, ft10
                  fcvt.w.s     sp, fa3, rtz
                  srai         a2, ra, 21
                  mulhu        t3, s6, t5
                  fcvt.s.wu    fa7, s8
                  fmin.s       fa4, fa6, fs3
                  fsgnj.s      fa7, ft7, fa3
                  div          a7, a7, a1
                  slli         t3, s8, 3
                  fcvt.wu.s    ra, fs7, rmm
                  srli         a3, t4, 29
                  and          s2, t1, t5
                  mul          t1, s10, a1
                  addi         s1, t0, 43
                  fmv.w.x      fa3, a6
                  or           a3, a1, gp
                  divu         a0, s10, t0
                  sll          t1, a4, ra
                  fsgnjx.s     ft10, fa0, ft9
                  sra          ra, s4, a5
                  fsgnjn.s     ft9, fa5, fs11
                  mulh         a1, t1, s8
                  sra          s1, s9, s6
                  addi         s8, s8, 1834
                  srl          s2, zero, s7
                  rem          a0, s5, s3
                  fcvt.s.wu    fs7, gp
                  div          a2, a5, t5
                  remu         a0, t0, s1
                  xori         zero, tp, -435
                  sra          a3, sp, zero
                  mul          s7, tp, a1
                  fmv.w.x      fa7, s11
                  slt          t1, a0, a2
                  fmv.x.w      s1, fa0
                  mulh         tp, s3, s4
                  fcvt.s.wu    ft6, a3, rmm
                  xori         ra, s1, 1312
                  fcvt.s.wu    fs3, a0
                  fmv.w.x      ft9, s4
                  flt.s        s3, fs4, ft9
                  fsqrt.s      ft8, fs9, rmm
                  fdiv.s       fa1, fs10, fs7
                  xor          s7, sp, s2
                  add          s10, t3, t5
                  fmv.w.x      fs7, a3
                  slt          s2, sp, s5
                  fadd.s       fa7, fs6, fs5
                  fadd.s       fa5, fs8, fa0, rmm
                  srai         t3, sp, 10
                  fmax.s       fa5, ft7, ft1
                  fcvt.s.wu    fs11, s4
                  srai         s2, t6, 8
                  fsgnjn.s     fa6, fs0, fs8
                  fcvt.wu.s    s2, fa6, rdn
                  fmv.x.w      s9, fa7
                  fmv.w.x      fs3, s0
                  fcvt.w.s     s8, fa0
                  xori         t4, t2, 359
                  fadd.s       fs9, fs2, ft2, rmm
                  fclass.s     a1, fs1
                  fsub.s       fs9, ft11, fs11, rup
                  slli         s3, t3, 24
                  fsub.s       fs1, fa2, fa2, rup
                  or           a7, s4, a4
                  sltiu        s0, t3, -884
                  sltu         zero, a3, ra
                  fmul.s       ft11, ft9, fa5, rne
                  feq.s        s2, fa6, fs7
                  divu         s1, sp, t1
                  mulhu        t1, s4, a7
                  sltu         gp, s9, gp
                  fmin.s       fs4, ft8, fs11
                  sltiu        a0, t1, 1735
                  xor          t4, a2, t1
                  fsub.s       fs3, fs5, fa4, rne
                  fmin.s       ft9, fs9, fs10
                  fsgnjx.s     fa0, fa2, fs8
                  fclass.s     s5, ft11
                  remu         ra, s5, s10
                  addi         a7, s1, -1201
                  fcvt.w.s     a6, fs11
                  sltu         s2, gp, t5
                  fcvt.s.w     fs11, s10
                  mulh         s0, t1, a3
                  slt          s4, s3, t5
                  fdiv.s       ft1, fs10, ft4
                  addi         tp, a2, -579
                  fsgnj.s      fs4, ft4, fs6
                  mulhu        zero, t5, t2
                  lui          a2, 654950
                  flt.s        t1, fs4, fs11
                  addi         a3, s8, 1656
                  fsgnjx.s     fa4, fs7, ft4
                  addi         s0, a7, -1837
                  slt          a2, s6, s4
                  fcvt.s.wu    fs11, a1, rdn
                  fcvt.w.s     s2, fa0, rmm
                  mulhsu       t1, s8, s6
                  fmax.s       fs7, fs5, fs10
                  ori          ra, s2, 1132
                  fsgnjx.s     fs6, fa2, fs11
                  fmul.s       fs9, ft1, fs0, rdn
                  slti         s10, s8, 3
                  div          s3, s5, ra
                  div          s4, zero, t3
                  fsub.s       ft10, ft1, ft11, rtz
                  fadd.s       fs6, fs6, fs9, rtz
                  fclass.s     t0, fs9
                  ori          t1, s9, 1544
                  fmax.s       fs8, ft7, fs9
                  sltiu        s9, sp, 1341
                  addi         a0, a2, -402
                  sll          a3, zero, s2
                  remu         s10, t3, s4
                  and          a0, s1, s5
                  mulh         a7, s10, s6
                  sra          s6, zero, t5
                  addi         s3, tp, -795
                  feq.s        s0, fs6, fs8
                  fsgnjn.s     ft7, ft10, fa5
                  div          s10, gp, t4
                  mul          t3, s5, s8
                  fsgnj.s      fs6, fa6, ft11
                  or           a0, s9, s2
                  xori         s4, s3, -1932
                  and          a2, a4, sp
                  slt          a6, t4, s3
                  fmv.w.x      fa7, a6
                  fsgnjn.s     ft10, fs1, fs11
                  fcvt.s.w     fa6, t2, rtz
                  mulhsu       sp, sp, t2
                  nop
                  mulhu        s11, a1, s0
                  add          tp, s0, a4
                  fcvt.s.w     fs3, t5
                  fle.s        s10, fs7, fs0
                  ori          s11, s7, 1978
                  mulhsu       t1, a0, t3
                  auipc        s7, 310426
                  sra          a6, s10, s1
                  mulhsu       s0, t4, a5
                  mulh         s1, s10, ra
                  fcvt.w.s     a1, ft2
                  div          s6, s7, t5
                  nop
                  fsgnj.s      ft4, fa5, fs4
                  fsgnj.s      ft7, fs2, fa0
                  mul          s6, a0, sp
                  mul          s2, s11, a4
                  rem          zero, s4, t4
                  and          s0, s3, t0
                  fsqrt.s      fs6, fs6
                  ori          s6, t0, -1077
                  fcvt.s.wu    fs7, t4, rne
                  sltu         t1, s4, s10
                  auipc        zero, 898734
                  remu         s2, s2, a3
                  fle.s        s1, ft1, fa7
                  fsgnj.s      ft5, fs9, fa3
                  slli         a7, s3, 10
                  div          s11, a0, zero
                  srl          a0, s0, a6
                  slli         s10, ra, 17
                  fadd.s       ft8, fs6, ft11, rne
                  flt.s        s11, fs8, ft4
                  auipc        s6, 138210
                  feq.s        a2, fs4, fa0
                  and          s4, s3, s9
                  fmv.w.x      fs5, sp
                  fcvt.s.wu    fs8, t3
                  fcvt.w.s     a3, fa5
                  fcvt.w.s     zero, fs2, rdn
                  fmv.w.x      fa0, gp
                  fsgnj.s      fs1, ft1, ft11
                  xori         s8, tp, 917
                  fmax.s       ft10, fs1, ft7
                  xori         a2, a1, 1201
                  feq.s        s4, ft1, ft8
                  fle.s        a1, fs3, fs9
                  fmv.w.x      fa1, a2
                  fsgnj.s      fs11, fa5, fa6
                  fcvt.wu.s    s1, fs7, rdn
                  slli         s3, a3, 24
                  ori          a6, ra, -180
                  slli         zero, ra, 2
                  addi         a7, a1, -1862
                  mulhsu       a2, t6, s3
                  fadd.s       ft1, ft7, fs10
                  fcvt.s.w     ft5, s8
                  sra          a5, s8, tp
                  feq.s        s2, fs5, fa6
                  mulh         a7, sp, a6
                  and          s1, t4, a2
                  div          s9, t2, tp
                  fcvt.wu.s    ra, fa7
                  xori         sp, s6, -1107
                  xori         s4, s3, 231
                  mul          a5, a2, t3
                  fmv.w.x      ft0, a1
                  xori         t0, s11, 1153
                  fsgnj.s      ft0, ft8, fa5
                  slli         s6, s0, 12
                  slti         ra, s2, -649
                  slli         t4, a2, 6
                  fdiv.s       fa1, fa7, ft11
                  andi         a7, t4, 841
                  lui          s4, 997801
                  fmax.s       fs0, fa7, fa3
                  fcvt.w.s     s1, fs3, rtz
                  fcvt.w.s     t2, fa7
                  fclass.s     s1, fs0
                  srli         a6, t0, 20
                  andi         sp, s6, -40
                  fmin.s       ft3, ft1, fa3
                  sub          s6, sp, s5
                  fsgnjn.s     ft5, fa0, ft11
                  fsub.s       fa2, ft6, fs9
                  slli         tp, s6, 11
                  slti         gp, ra, 180
                  fmin.s       fs3, ft4, fs5
                  fmv.w.x      ft4, t3
                  xor          t0, a5, s11
                  fcvt.s.w     fs2, s5
                  fsgnjn.s     fa0, ft2, ft0
                  fmv.w.x      ft4, zero
                  fclass.s     a6, fs6
                  feq.s        t0, fs6, fs1
                  sub          t3, s8, s3
                  mulhu        a1, s0, s10
                  xor          s0, s11, t5
                  xor          a6, t2, s5
                  fmul.s       fa3, fa2, fs1
                  fsgnjx.s     fa1, fa6, fa1
                  remu         s2, s8, s10
                  mulh         a1, ra, a0
                  sll          s10, t3, gp
                  fcvt.wu.s    a3, fa5
                  nop
                  fle.s        gp, fs0, fa3
                  mulhu        a1, s6, sp
                  divu         s7, a6, a6
                  slt          s5, s8, a5
                  fmv.w.x      fa1, t2
                  mulhu        t3, s5, t4
                  add          s9, t1, s4
                  sub          s7, s9, ra
                  mulhsu       tp, zero, a4
                  sra          a2, s11, tp
                  auipc        s3, 112845
                  fsgnjx.s     ft8, fa1, fa1
                  srl          s4, s2, s5
                  nop
                  fle.s        t2, ft4, fs5
                  auipc        s6, 776031
                  feq.s        t2, fs4, ft2
                  slt          s9, a4, t4
                  add          s10, a2, a3
                  sltiu        zero, t3, 1076
                  fsgnj.s      fs9, fa0, ft11
                  fle.s        t1, fs4, fs5
                  nop
                  fmv.w.x      fs3, a6
                  lui          a0, 896539
                  fsgnjx.s     fs10, ft0, ft8
                  fdiv.s       fs7, ft3, fs11, rup
                  fdiv.s       fs8, fs6, ft4, rmm
                  slti         a0, s5, 1602
                  fcvt.s.w     fs3, s7, rtz
                  mul          a0, gp, s4
                  fsgnjn.s     ft0, fs4, fs6
                  mulhu        sp, s6, t3
                  nop
                  fsgnjx.s     fa5, fs7, ft11
                  div          ra, a4, t5
                  fsgnjn.s     fa1, fa2, fa0
                  fsqrt.s      fs2, fs0, rup
                  srai         s9, a1, 5
                  ori          a0, s1, -1786
                  fmin.s       fa3, ft1, fs9
                  srai         s9, t5, 25
                  add          a1, t5, s10
                  divu         a7, a2, t5
                  fdiv.s       fs6, fs5, fa5, rmm
                  auipc        sp, 942728
                  fsub.s       ft2, fa7, fa7, rne
                  srli         t3, sp, 12
                  xori         s5, a6, 1701
                  fmul.s       ft7, fs3, fs8, rne
                  xori         tp, t6, -526
                  fsgnjx.s     fa3, fa3, fs1
                  fmv.w.x      fs0, a6
                  mul          s5, tp, s8
                  fmax.s       ft2, ft4, fa0
                  remu         t1, t2, a6
                  fsub.s       ft4, fa0, fa6
                  xor          t2, a7, t6
                  fle.s        gp, ft8, fs1
                  fmul.s       ft6, fs5, fs4
                  fmin.s       ft7, fa3, fs1
                  sltu         s8, t5, s1
                  xori         t2, a6, 550
                  add          s3, t5, t4
                  sll          s6, s9, s0
                  sltu         t2, a6, s0
                  fcvt.w.s     tp, fs9, rup
                  fcvt.s.wu    fa1, a5
                  fle.s        s2, ft11, fa2
                  add          s1, a6, zero
                  xor          a5, s0, s7
                  mul          t1, t5, s7
                  nop
                  addi         s8, s1, 1053
                  fmax.s       ft9, ft6, fs8
                  sltiu        t1, a4, -1219
                  sra          s9, s5, s10
                  auipc        s5, 315779
                  slli         s11, s4, 1
                  sltiu        sp, s0, 1933
                  sll          s8, a3, a3
                  fclass.s     s3, ft4
                  rem          t0, a5, s7
                  srli         s2, sp, 6
                  ori          ra, s0, -1021
                  sltu         zero, t0, a6
                  fdiv.s       fa0, ft1, fs2
                  fsub.s       fs4, ft1, fa2
                  sra          a0, tp, tp
                  mulhu        a0, s7, t5
                  fcvt.wu.s    s11, fs8
                  fcvt.w.s     sp, fs2
                  remu         tp, a1, a5
                  mul          a2, t5, t6
                  auipc        a2, 117801
                  feq.s        gp, fa6, ft0
                  srai         a3, s6, 10
                  fsgnjx.s     fs11, ft10, fs6
                  fle.s        a0, fa6, ft8
                  nop
                  andi         s6, sp, -1368
                  sub          s8, s5, t1
                  slli         ra, gp, 9
                  mul          s2, s6, s9
                  fle.s        s10, ft8, ft3
                  fsgnjn.s     ft8, ft11, fa1
                  fsgnjn.s     fs8, fs8, fa7
                  flt.s        a1, fs1, fa3
                  fmul.s       fa7, fa4, fa6, rdn
                  sub          t2, a7, t1
                  fadd.s       fa3, fa7, fs0, rup
                  fmv.w.x      ft9, a0
                  slli         s6, s9, 19
                  fcvt.w.s     s3, ft8
                  div          s5, a1, t6
                  ori          s3, s8, 508
                  fdiv.s       fa3, fa3, fs0, rtz
                  fsqrt.s      fa5, ft11, rmm
                  mul          t1, s9, s7
                  slti         a0, t6, -1278
                  slti         t3, a5, 898
                  ori          t4, s1, -1258
                  sltu         s2, s11, s9
                  rem          a5, gp, t4
                  or           t3, t0, s1
                  divu         t4, s5, s3
                  addi         s4, a6, -344
                  xori         t4, a2, -1002
                  fadd.s       fs3, ft9, fs10, rdn
                  fmax.s       fa3, fa0, fa2
                  srl          ra, t2, s0
                  fsgnjx.s     fa4, fs8, fs0
                  fmv.x.w      s10, fa5
                  div          a2, s11, a7
                  lui          s7, 194504
                  ori          s0, s6, -1294
                  div          s0, s10, s9
                  srai         s3, s10, 8
                  fcvt.wu.s    s6, fs2
                  fsub.s       fs9, fs2, fs2
                  add          s6, zero, sp
                  or           a7, t3, s7
                  fsgnj.s      ft4, fa2, ft4
                  sltiu        a7, s0, -433
                  lui          tp, 873786
                  fmv.w.x      fs2, s5
                  slli         a3, a7, 15
                  fclass.s     s6, ft10
                  fmul.s       fs6, fa0, fa0, rne
                  sltu         t1, s8, tp
                  remu         zero, a0, a5
                  andi         t1, a1, 865
                  fdiv.s       ft10, fs2, ft10
                  feq.s        s0, ft7, ft1
                  mulhsu       tp, s9, s1
                  fadd.s       ft10, fs11, fs0, rup
                  mulhsu       t4, s10, t2
                  mulhsu       tp, t5, t2
                  fclass.s     s2, fs3
                  and          s3, a0, t1
                  fclass.s     t2, fa6
                  srli         s8, t1, 0
                  flt.s        s6, fs6, fa3
                  fadd.s       fa2, fs7, fa4, rtz
                  fmax.s       fa3, ft8, ft4
                  and          a6, a6, a1
                  sub          a1, t6, s10
                  mulh         t4, t1, gp
                  flt.s        zero, ft10, ft6
                  or           s3, s5, s4
                  fmin.s       ft5, fa3, ft4
                  fclass.s     s7, fs0
                  sra          a6, t4, s2
                  sltiu        s11, s0, 1910
                  remu         tp, t5, s5
                  addi         t2, t0, 1176
                  sub          sp, s5, s7
                  sltu         s4, t5, t0
                  fmul.s       fa6, fs11, fs5, rmm
                  sltu         s5, s2, s6
                  slti         t4, s3, 140
                  fsgnj.s      fa3, fs10, fs11
                  div          s6, s3, tp
                  fdiv.s       fs7, fs10, ft11
                  fadd.s       ft5, fa4, ft9, rdn
                  divu         t4, t2, tp
                  fcvt.s.w     fa3, t5
                  or           t1, sp, t3
                  feq.s        s3, fa2, ft8
                  slti         ra, s1, 180
                  fsgnj.s      fs10, fs0, fa4
                  fmax.s       fa2, ft6, fs8
                  lui          s11, 193351
                  divu         s3, a1, t1
                  addi         s9, s6, 1305
                  fcvt.s.w     fa0, s1, rtz
                  fsgnj.s      fs7, fs0, ft3
                  nop
                  add          s1, t1, ra
                  fle.s        s11, fs5, ft0
                  feq.s        s3, fs0, fs3
                  fmv.x.w      a3, ft1
                  xori         s2, ra, 1666
                  fsgnjn.s     fs5, ft7, fs4
                  fcvt.wu.s    tp, fs6
                  fmv.w.x      ft7, t2
                  srai         s9, a6, 2
                  mulhsu       a1, ra, s4
                  rem          zero, a0, s4
                  auipc        a5, 172854
                  slli         sp, a6, 18
                  xor          t4, s1, a7
                  xor          zero, s7, t4
                  sltu         s5, s5, a0
                  ori          t2, a3, -6
                  fmul.s       ft6, ft3, fs7, rne
                  feq.s        zero, fs0, fa3
                  srai         a0, a2, 28
                  fsqrt.s      fs8, fs1
                  divu         a7, s2, s8
                  fsgnj.s      fs3, ft3, fa5
                  mul          s9, zero, a7
                  lui          tp, 93062
                  remu         s2, a6, s10
                  mulh         tp, s3, t1
                  remu         a7, s4, a5
                  slti         a7, a5, 583
                  fcvt.s.wu    ft8, sp
                  fsub.s       fs7, fa2, fa4, rdn
                  srai         a1, s4, 22
                  divu         a1, a4, t3
                  fmul.s       fs9, fa4, ft0, rdn
                  slli         a6, a4, 18
                  fsgnj.s      fs10, fa4, fs10
                  div          s0, t6, s3
                  fmin.s       ft4, fs7, fs7
                  xor          s3, a5, a3
                  fcvt.w.s     s9, fa1, rmm
                  fsqrt.s      fs5, fs7, rne
                  fsqrt.s      fa5, fs6, rtz
                  fcvt.w.s     s2, ft7
                  andi         s2, a6, 156
                  fdiv.s       fa7, fa5, fs11
                  mulhu        t4, a4, a7
                  fmul.s       fs0, fs11, fa5, rne
                  fsgnjn.s     ft8, ft8, fs7
                  and          s7, t0, a6
                  mulhsu       gp, sp, s10
                  addi         t0, t6, 44
                  xor          s5, zero, s5
                  sra          s10, t0, s0
                  feq.s        s7, fs7, ft4
                  auipc        a5, 765847
                  fcvt.w.s     s4, fa5
                  addi         s6, s9, 1793
                  fsub.s       fs5, fs0, fs5, rdn
                  slt          gp, s2, gp
                  fsgnj.s      fa0, fa0, ft4
                  sltiu        t4, t1, 797
                  add          s6, s2, a3
                  fcvt.s.w     ft8, s8, rmm
                  slti         a1, t1, -720
                  fsgnjn.s     ft1, fs9, fs0
                  fsgnjx.s     fs9, fs9, fa6
                  and          s6, t6, sp
                  fsqrt.s      fs10, ft6, rtz
                  mulhsu       s5, s8, s3
                  fdiv.s       fs8, fa0, fs9
                  fsgnjx.s     fs8, ft9, fs5
                  xori         a2, a7, 837
                  divu         a0, t2, s7
                  fsub.s       fs3, ft8, ft1
                  fle.s        t4, ft3, fa5
                  sll          s4, a4, t1
                  fsgnjn.s     ft2, fa5, fa3
                  sltiu        s10, a3, -1469
                  div          t2, t3, s3
                  fmin.s       fs3, fa2, fs6
                  mulhu        s1, t1, s8
                  slli         a2, s3, 1
                  div          t2, s7, t6
                  or           t2, s1, ra
                  mulh         tp, s1, a5
                  xori         t1, a7, -343
                  mulhu        t4, s2, ra
                  fmv.w.x      ft11, s10
                  xor          a2, a5, s8
                  div          s2, s2, gp
                  add          s10, t5, t5
                  fcvt.s.w     fs8, s8, rmm
                  fcvt.wu.s    s2, fs2
                  mulh         a5, zero, t0
                  rem          s0, s1, a6
                  nop
                  fmax.s       ft5, ft8, ft0
                  andi         a0, s3, 954
                  fmax.s       ft0, ft6, ft2
                  fclass.s     a6, ft10
                  feq.s        a6, ft0, fs3
                  remu         t4, t0, s6
                  fmv.x.w      gp, ft11
                  slti         gp, s3, 1180
                  fsgnjn.s     fa0, ft3, fa2
                  and          s11, s2, s9
                  fsub.s       fa7, ft10, ft2
                  lui          t4, 832691
                  andi         s1, t0, -89
                  fcvt.s.w     fs1, s10
                  divu         zero, a6, s5
                  sll          zero, a5, s11
                  mulhsu       a5, t4, a2
                  srli         s6, a0, 19
                  sll          a2, a5, a7
                  fcvt.w.s     t3, fs7
                  slti         s9, t2, 891
                  slti         s6, s4, 1885
                  mulh         s0, a6, t5
                  fsqrt.s      fs0, fa5
                  slt          t0, s0, s2
                  xori         a0, ra, 1547
                  mulhsu       s4, s10, tp
                  divu         s8, a0, a5
                  fcvt.wu.s    t0, fs6
                  fmv.x.w      zero, fa5
                  slli         a3, a4, 26
                  flt.s        s8, ft9, ft5
                  sltiu        t2, s1, -190
                  xor          s10, s9, t5
                  fcvt.w.s     s9, fa2, rtz
                  or           t0, zero, a0
                  fdiv.s       fs2, fs1, ft3, rup
                  slt          s1, s1, s8
                  divu         a6, sp, s1
                  feq.s        sp, ft9, fs5
                  fsgnj.s      ft3, fa0, fa7
                  fmv.x.w      s8, ft9
                  mulhu        s8, t1, a4
                  nop
                  fcvt.s.wu    fs6, s7
                  sltu         s9, s5, s5
                  fsgnjn.s     fs8, fa1, ft7
                  slti         ra, s4, 2043
                  srli         s1, s1, 2
                  slt          s6, a6, s8
                  divu         zero, s4, t4
                  slt          a3, t3, t4
                  mul          ra, tp, t6
                  fcvt.w.s     a6, fa2, rup
                  fle.s        zero, fs7, fa1
                  slli         s0, t1, 18
                  fmv.w.x      fs2, t3
                  remu         t1, s2, gp
                  srl          t3, s0, t5
                  mulhsu       a0, s1, s4
                  fmax.s       fs10, ft9, ft1
                  auipc        ra, 273084
                  srai         s2, a3, 28
                  fcvt.s.wu    ft8, s0
                  sltiu        s0, ra, 1195
                  sll          s7, s10, tp
                  feq.s        s10, fs1, ft8
                  fsgnjn.s     ft1, ft4, ft1
                  and          s10, a4, s3
                  mulhu        s6, s1, s2
                  auipc        sp, 348962
                  andi         gp, a3, 1201
                  addi         s6, t1, 1410
                  div          t3, t1, ra
                  fcvt.s.wu    fa3, a6
                  ori          s0, a3, 1767
                  sub          s2, a7, t3
                  andi         a2, s7, 1583
                  lui          s11, 623375
                  and          s10, a4, s9
                  fmin.s       fs6, fs4, fa6
                  ori          s7, t1, -451
                  slt          a5, a2, s6
                  fsqrt.s      ft8, fa6, rtz
                  sltiu        a6, s5, -1899
                  flt.s        s8, fs7, ft1
                  fcvt.s.w     fa5, s8, rtz
                  mulhsu       s9, a7, zero
                  fsub.s       fs8, ft10, fs10
                  fadd.s       ft11, fs3, fa2, rup
                  addi         tp, t0, -786
                  fmv.x.w      ra, fs0
                  or           sp, t4, s8
                  srli         s7, s11, 26
                  sltiu        a2, s5, 1522
                  fdiv.s       fs6, ft9, fa4
                  addi         s8, a2, -987
                  remu         a3, zero, t6
                  or           t2, t3, a5
                  mulhsu       a2, t2, s2
                  fmv.x.w      a0, ft10
                  fdiv.s       fs10, fs1, fa6, rup
                  lui          a6, 626201
                  add          a6, t3, s5
                  xori         t4, t2, 1598
                  fcvt.s.w     fs10, s11
                  divu         s8, tp, ra
                  sll          s5, t0, a6
                  addi         t1, a2, 1480
                  sltiu        t1, t1, 1136
                  fle.s        a7, fs0, ft9
                  mulhsu       s5, ra, s1
                  fcvt.s.wu    ft0, s10
                  fmul.s       ft3, fa2, fs8, rne
                  fmax.s       fs3, fa2, ft9
                  and          s5, a4, s3
                  fsub.s       ft2, ft0, ft5, rmm
                  sll          a1, t6, t2
                  fdiv.s       fs3, ft3, fs0
                  div          sp, tp, t6
                  add          a2, t3, s8
                  mul          zero, t4, zero
                  sra          s8, s4, tp
                  srai         sp, s5, 27
                  sra          t4, a2, t4
                  fsgnj.s      fs7, fa7, ft9
                  fmv.x.w      t4, fa0
                  fmax.s       fs11, ft11, fs11
                  fcvt.wu.s    s0, fa1
                  andi         a1, s6, 305
                  fle.s        t1, ft6, fa2
                  add          t1, sp, zero
                  fmin.s       ft11, ft2, fs3
                  fmul.s       fa0, fa5, ft2
                  fcvt.s.w     fa2, t4
                  lui          a6, 512051
                  fsgnjx.s     fa2, fs10, ft8
                  remu         s11, s0, sp
                  and          a5, a6, t6
                  feq.s        t1, fa4, fs1
                  mulhu        t4, t4, s0
                  fadd.s       fa3, ft11, fs11
                  fmv.x.w      a7, ft8
                  xor          s4, a4, a6
                  fclass.s     s1, fs10
                  fmin.s       ft8, ft10, fs1
                  fsqrt.s      ft1, ft5
                  fcvt.w.s     s3, fs10, rup
                  fsqrt.s      fa7, ft10
                  fmax.s       fs3, fa0, fs7
                  remu         a0, zero, s3
                  fle.s        a6, ft2, ft10
                  lui          s9, 847544
                  fcvt.s.w     fa6, s3
                  mul          a6, a5, s7
                  fsgnj.s      fs11, fa5, ft6
                  fsgnjx.s     fs8, ft5, fs6
                  fmv.w.x      fs0, a2
                  remu         a1, t0, s5
                  add          t4, s4, a2
                  auipc        s1, 674811
                  auipc        s1, 9460
                  mulhsu       s3, s8, s7
                  sltiu        s5, a5, -2006
                  srl          a6, t0, tp
                  remu         t1, s11, s5
                  addi         t0, ra, -1162
                  fle.s        s8, fa7, fs7
                  sub          t4, s0, t0
                  slti         a6, s4, -546
                  fmv.x.w      gp, fs4
                  fmin.s       fs5, fs9, ft6
                  fsgnjx.s     ft3, ft9, fs5
                  or           s3, s1, gp
                  fcvt.s.w     fs0, s4, rup
                  lui          ra, 832964
                  fmv.x.w      a2, fa6
                  auipc        s3, 931075
                  xori         t3, s10, -1646
                  sra          tp, t2, t4
                  fcvt.wu.s    tp, fs10
                  fcvt.wu.s    s11, ft1, rdn
                  xor          t2, s9, s8
                  fadd.s       fa4, fs4, fs4, rtz
                  andi         a0, t3, 1135
                  fadd.s       fs0, ft2, fs11
                  mulh         a6, sp, s0
                  fcvt.wu.s    s1, fa7, rup
                  fdiv.s       ft10, fa0, fs1
                  rem          a3, tp, s5
                  fmax.s       ft5, fs1, ft8
                  fcvt.wu.s    t0, ft11
                  ori          s10, zero, 177
                  fadd.s       ft7, fa1, fa7, rmm
                  sltu         s7, t2, t3
                  div          s9, t0, s6
                  fsgnj.s      fs11, fs5, fa1
                  slli         s0, s3, 30
                  mul          a1, a6, s8
                  fsgnj.s      fs7, fs4, fs7
                  sll          a5, s4, a0
                  fcvt.wu.s    a7, ft5, rdn
                  srai         sp, s9, 12
                  sltu         s11, s0, s10
                  addi         s4, s4, -557
                  divu         t4, a7, s6
                  sltiu        s3, a6, 9
                  fcvt.w.s     s10, ft0
                  mulh         s11, s6, a2
                  flt.s        t4, fs11, fs10
                  sub          s0, a4, gp
                  fmv.w.x      fs10, s0
                  auipc        s4, 804361
                  fmax.s       fs6, fa0, fs11
                  slli         gp, s9, 1
                  slli         a5, a3, 6
                  slti         s4, sp, -1808
                  remu         s4, gp, s7
                  remu         t3, tp, s2
                  fcvt.wu.s    sp, ft6, rup
                  fclass.s     s5, ft4
                  fmul.s       fs7, fs6, fs2, rtz
                  srli         t4, t0, 0
                  mul          ra, t3, s3
                  and          s7, t0, t1
                  mulhsu       s5, s0, a0
                  mulhsu       s6, sp, s4
                  remu         gp, t4, t3
                  nop
                  fmv.x.w      s3, ft6
                  add          s3, t2, gp
                  auipc        t3, 82937
                  feq.s        sp, fs6, fa1
                  mul          tp, s2, a6
                  xor          sp, t1, s9
                  fmin.s       fs2, fa5, fs4
                  xori         t1, s1, -1189
                  fsgnj.s      fs10, fs6, fa3
                  fdiv.s       ft0, fs4, fs3
                  mulhsu       sp, t5, s3
                  fdiv.s       ft1, fa6, fs1, rmm
                  fsub.s       fa1, fs3, fs3, rup
                  slt          ra, t0, s4
                  slli         s11, a4, 13
                  xori         zero, a5, 607
                  fmul.s       ft11, fs10, fs1
                  nop
                  mulhsu       a3, a2, t3
                  addi         s1, s5, 253
                  fmv.x.w      s7, ft6
                  srli         zero, a2, 20
                  fle.s        s3, ft2, fa2
                  rem          zero, s6, a5
                  fmin.s       ft9, fa2, fa3
                  ori          ra, a2, -793
                  fdiv.s       fs6, ft10, fa2
                  mulhsu       s9, t0, t3
                  sub          a2, t1, s4
                  nop
                  and          s9, a3, s5
                  fcvt.s.wu    fs5, s4
                  sub          s7, s0, a3
                  fmax.s       fs8, fs0, fa0
                  lui          tp, 559397
                  div          tp, a0, s5
                  fsub.s       ft4, ft9, fs8, rne
                  fcvt.wu.s    s2, ft9
                  feq.s        s9, fs8, fs5
                  or           s7, sp, a3
                  flt.s        ra, ft6, fs1
                  srai         gp, s10, 9
                  ori          s3, ra, -331
                  fclass.s     s0, fa7
                  mulhsu       s9, tp, a1
                  xor          ra, t6, a3
                  fsgnjx.s     fs2, fa4, fs11
                  nop
                  rem          a2, a0, a7
                  fsgnjn.s     fs1, fa1, fs6
                  fmul.s       ft11, fs3, fs1
                  lui          t4, 295757
                  sll          t2, t3, a6
                  div          s4, a5, a1
                  slli         a3, s10, 9
                  fsqrt.s      fs6, fs4
                  addi         ra, s1, -252
                  sltiu        t4, s2, 1942
                  mulh         a6, s8, s8
                  fcvt.s.wu    fs4, s6
                  or           zero, tp, ra
                  flt.s        s10, fs11, fa2
                  remu         a7, t3, t4
                  sub          sp, s6, t2
                  sll          s4, s5, t6
                  fmv.x.w      a6, fs0
                  fcvt.w.s     t2, fs5
                  fcvt.s.wu    ft11, s1
                  auipc        sp, 919327
                  fsqrt.s      fs3, fs4
                  fle.s        sp, fa2, fa1
                  sll          sp, s10, s3
                  or           t2, s11, t3
                  nop
                  fsgnjn.s     fs4, ft0, ft2
                  lui          t4, 8980
                  fcvt.s.w     fs5, sp
                  fmin.s       ft2, fa1, fs5
                  or           a1, t0, t6
                  sra          s10, zero, ra
                  fcvt.w.s     s2, ft1
                  fsgnjn.s     fs2, ft1, ft6
                  mulh         t2, gp, s6
                  sra          s5, sp, s9
                  fsgnjn.s     fa2, fs1, fa7
                  andi         a7, a1, -1831
                  or           s11, t3, s3
                  remu         s6, ra, s6
                  fmv.x.w      s7, fs7
                  sll          s7, s8, t0
                  mul          s9, s3, t4
                  feq.s        ra, fs4, ft5
                  mulh         s2, s8, a0
                  fcvt.s.wu    fs2, a3, rne
                  fmv.w.x      ft5, s5
                  fle.s        gp, fa2, fa7
                  fsqrt.s      fa4, fs9, rtz
                  fcvt.s.wu    fa1, s10, rdn
                  fsgnj.s      fs1, fa7, fs8
                  fmv.w.x      fs8, s11
                  fcvt.s.w     ft10, a1
                  slt          t4, t5, sp
                  fmax.s       fa6, fs1, ft1
                  mul          s7, t4, a2
                  fsub.s       fa4, fs6, fa5
                  fmv.x.w      ra, ft8
                  fsub.s       fa1, fs4, fs1
                  andi         s6, s3, 1814
                  addi         a2, s5, 723
                  andi         a5, s11, 259
                  andi         a0, s10, -678
                  fmv.x.w      gp, fs2
                  remu         s10, gp, s0
                  fsqrt.s      fa2, fa6
                  fclass.s     s9, ft4
                  ori          t1, t6, -1613
                  or           t2, a1, s4
                  xori         s1, t3, -1494
                  fsqrt.s      ft9, ft1, rmm
                  fsqrt.s      ft7, fa5
                  lui          zero, 592238
                  sltiu        zero, t6, -1858
                  fmul.s       fs4, ft6, fs1
                  fclass.s     t4, ft1
                  slt          s5, a3, s1
                  ori          a5, s9, 643
                  xor          s5, ra, s9
                  div          sp, t2, s10
                  andi         s2, t1, 426
                  auipc        a2, 893808
                  feq.s        a5, fa3, fa1
                  lui          s3, 681016
                  mulhu        t1, a6, a3
                  fmv.x.w      s1, ft0
                  fcvt.w.s     t2, fa1, rdn
                  sltiu        s11, a0, -1503
                  auipc        s1, 579409
                  remu         t1, s6, a0
                  fmul.s       fa2, ft1, fa6, rup
                  or           s10, s7, sp
                  nop
                  remu         s2, a2, t0
                  fcvt.s.w     fa2, s1
                  and          tp, s11, ra
                  sub          s0, t1, a2
                  lui          tp, 225855
                  fsgnjn.s     fa7, fs8, fs8
                  div          a3, s0, t0
                  fcvt.w.s     s5, ft5
                  fsqrt.s      fs7, fs8
                  fmv.x.w      t0, ft10
                  nop
                  nop
                  fsqrt.s      ft11, ft1, rmm
                  or           s1, s5, s0
                  fadd.s       ft3, ft9, fs9, rdn
                  lui          a3, 103315
                  auipc        t0, 548989
                  fmin.s       ft9, fs8, fs9
                  div          a6, t0, t6
                  fsub.s       fa1, ft8, ft2, rup
                  sll          a0, s5, a2
                  srai         a5, t0, 11
                  fmin.s       fa2, fs9, fa4
                  divu         s9, sp, s3
                  and          s8, a2, a0
                  srli         s10, tp, 23
                  fcvt.s.wu    ft6, t0
                  fsgnjn.s     fs5, ft6, fs5
                  sltiu        a6, s8, 94
                  fcvt.w.s     gp, fa5, rtz
                  auipc        s1, 192985
                  sra          a7, tp, s0
                  or           s1, s6, tp
                  rem          a1, a7, s4
                  mulhsu       t1, t1, s1
                  addi         tp, s9, -1015
                  fcvt.wu.s    a5, fs4
                  xor          s7, t2, a6
                  fsgnjn.s     fs0, ft2, fs6
                  fmax.s       fs1, fs0, fs1
                  fclass.s     zero, fs2
                  srli         s3, ra, 26
                  fle.s        a7, fs3, fs7
                  auipc        t3, 983293
                  ori          a0, s0, 1383
                  fmax.s       fs9, fs3, ft1
                  add          tp, ra, t2
                  fmv.x.w      s9, ft10
                  fmin.s       ft1, fa5, ft10
                  div          sp, a4, gp
                  andi         s9, t2, 1977
                  mulh         s7, sp, t0
                  srai         s1, gp, 17
                  sub          gp, t0, s1
                  andi         s0, s10, 509
                  mulhu        a6, a5, a7
                  flt.s        s1, ft10, fs6
                  fcvt.wu.s    s10, ft1
                  andi         gp, s9, 1364
                  mulhsu       s1, s5, s0
                  divu         t4, s4, s10
                  feq.s        s5, fs11, ft8
                  fmul.s       fa5, fs11, fs3, rmm
                  sll          s10, s3, gp
                  fmul.s       ft2, fs5, fs10
                  rem          a6, a6, t3
                  add          s6, a7, s7
                  slti         a0, a6, -634
                  fmv.w.x      fs8, a2
                  feq.s        ra, ft8, ft3
                  fsgnj.s      fa4, fs4, fa3
                  fsgnj.s      fs8, ft4, fa6
                  lui          t0, 947722
                  sra          t3, s10, a4
                  mulh         a2, s1, s10
                  add          t1, t4, t2
                  nop
                  mul          s9, s5, gp
                  fcvt.w.s     t4, ft7
                  fcvt.s.wu    ft3, s4, rdn
                  mul          s11, t5, s2
                  fsqrt.s      fs6, ft10
                  fsgnjx.s     fs6, fs5, fs2
                  fmax.s       fs1, ft6, fs11
                  fsgnj.s      fs0, fa3, ft2
                  fsgnj.s      fa3, fs11, ft10
                  slt          a2, s2, s6
                  slt          s10, s11, s5
                  fadd.s       fs8, fs7, fa5, rup
                  sra          s3, a3, s0
                  fsgnjx.s     fa3, ft7, fs8
                  fsgnjn.s     fa2, fa0, fs2
                  mulhu        s9, s6, zero
                  divu         t3, zero, gp
                  fsub.s       fs2, fa1, ft0
                  fcvt.wu.s    s7, fa5
                  fcvt.s.w     ft6, zero
                  nop
                  xori         t4, s0, 912
                  add          a7, s8, t4
                  slt          a6, t1, a1
                  sra          s3, s5, s1
                  fmv.x.w      s5, fa6
                  srli         t3, s8, 13
                  xor          sp, t0, zero
                  xori         s3, t1, 386
                  fcvt.s.w     fs11, a4
                  and          s11, tp, sp
                  auipc        s1, 1004719
                  slli         s10, sp, 8
                  fmv.x.w      zero, ft0
                  mulhsu       s10, zero, t4
                  remu         a1, zero, s8
                  fcvt.w.s     s10, ft3, rmm
                  fcvt.s.wu    fa2, t1
                  addi         s4, s5, 66
                  mul          s9, a0, s7
                  sll          t1, t6, s1
                  fle.s        s5, fs9, ft3
                  addi         s4, s9, -889
                  slti         t2, s3, -1606
                  slt          s9, a0, a3
                  fclass.s     sp, fa2
                  sltu         s5, gp, tp
                  addi         zero, s9, 384
                  flt.s        a0, fa0, fs7
                  fcvt.s.wu    fa5, a2
                  flt.s        s8, fs3, fa0
                  mulhu        s4, s11, t1
                  slti         t3, sp, 1898
                  flt.s        t3, fs3, ft0
                  fcvt.w.s     t4, fa1, rdn
                  andi         s4, a3, -289
                  fmax.s       fs2, ft8, fa7
                  fmul.s       fs9, fs2, fs1, rtz
                  fcvt.wu.s    t0, fs7
                  fmul.s       fa7, fs2, ft11
                  mulh         a3, a0, t3
                  slt          a5, t2, gp
                  ori          t0, s1, -867
                  sra          s3, s2, sp
                  sltu         s4, s11, t1
                  srl          a5, s11, gp
                  nop
                  xor          t0, a7, s3
                  srli         s1, a4, 21
                  add          a1, t4, a7
                  slti         zero, t0, -1525
                  fmul.s       ft3, fs2, ft3
                  fcvt.s.wu    ft6, t4
                  fdiv.s       fs3, ft2, fs3
                  fmin.s       fa6, fs9, fs10
                  srl          a2, s11, a0
                  fclass.s     s4, ft3
                  andi         a6, s3, 1940
                  sltiu        a6, t3, -1243
                  sra          t2, a5, a5
                  fcvt.s.wu    ft8, a7
                  fcvt.wu.s    a6, fs6
                  fadd.s       ft6, fs11, fs2
                  srai         s10, tp, 29
                  andi         s5, s2, -1901
                  ori          t0, a7, 696
                  sll          a1, s4, s7
                  fmax.s       fa4, ft11, ft6
                  fcvt.w.s     t4, fs10, rtz
                  fdiv.s       ft8, fs6, fa7, rup
                  srli         a3, ra, 31
                  fsub.s       fs7, fs4, fs2
                  fsgnjx.s     ft3, fs1, fs8
                  fsgnjx.s     fa5, fa3, fa5
                  div          s5, s11, t4
                  flt.s        a5, ft2, ft5
                  sra          s11, gp, a5
                  or           sp, a3, ra
                  slt          a1, s7, a5
                  fsgnjx.s     fs10, ft4, fs3
                  ori          t3, zero, 1313
                  div          s1, t6, a5
                  auipc        s1, 430443
                  fsgnj.s      fs2, ft4, fs5
                  fcvt.s.wu    fs1, s4, rtz
                  fcvt.wu.s    t2, fa7
                  mul          a1, s6, s4
                  fsub.s       ft7, fa3, fa0
                  sltu         s0, ra, ra
                  auipc        s1, 24535
                  xor          t0, a0, s2
                  divu         ra, a6, t3
                  sub          gp, t0, s3
                  ori          ra, s5, -173
                  mulhu        a0, s4, t5
                  rem          a2, a1, ra
                  mulhsu       a2, sp, ra
                  slt          t0, a7, tp
                  auipc        s11, 164997
                  fadd.s       fs4, fs9, fs6
                  fmin.s       fs5, ft4, ft5
                  fcvt.s.wu    fs0, a1
                  sltiu        t0, tp, 1883
                  srl          a5, t3, s5
                  srl          a1, t5, tp
                  xor          s2, t1, t3
                  divu         t4, a6, zero
                  fmax.s       fa1, fs11, fa2
                  fsgnjx.s     fa7, ft11, fs9
                  fmax.s       fs8, fa0, fs4
                  sll          a1, s9, ra
                  feq.s        ra, fa0, fs4
                  fsub.s       ft2, ft0, ft5
                  srai         zero, a2, 14
                  fmv.w.x      fa6, t1
                  mulhu        s2, a7, s9
                  mul          s11, s7, s9
                  feq.s        s3, fs4, fs7
                  sll          s5, t5, s11
                  ori          s10, s1, -1218
                  fcvt.w.s     zero, ft4
                  fclass.s     t4, fs8
                  sub          s8, s6, t2
                  add          s3, t4, s8
                  srl          t4, s1, a7
                  fmv.x.w      s6, ft9
                  or           sp, s8, t2
                  lui          s5, 455994
                  fsgnjn.s     fs6, ft5, fa6
                  mul          a0, t3, a6
                  srli         s3, ra, 20
                  feq.s        a3, fs9, ft9
                  srli         s9, a3, 6
                  auipc        s7, 234013
                  slli         t0, t6, 28
                  fmv.w.x      fs6, t1
                  rem          t3, a3, s5
                  fdiv.s       ft6, fs9, fa6
                  fsgnjx.s     fs4, fs5, fs5
                  fsgnjx.s     fa2, ft11, fs8
                  fsgnj.s      fa4, fa0, fs1
                  and          s9, s1, a5
                  sll          a3, ra, a1
                  fmin.s       fa1, ft9, ft7
                  addi         s2, t5, -1500
                  slt          gp, t3, t0
                  fadd.s       ft0, ft11, fs11
                  ori          s3, s7, -1605
                  and          t3, s3, s7
                  srl          s7, s4, sp
                  feq.s        s6, fs6, fs5
                  or           s8, s8, a0
                  slli         t2, a2, 27
                  and          sp, t3, s3
                  rem          ra, s4, ra
                  fsgnjx.s     fs3, fa4, ft8
                  addi         s9, s0, 1836
                  mulhsu       s8, a6, t2
                  feq.s        a2, fa3, fs8
                  mulhu        sp, t2, s5
                  sra          t4, t6, a7
                  fsgnjn.s     ft3, fs0, fa1
                  sltu         t3, t2, t5
                  addi         zero, t6, -401
                  addi         t4, tp, 1469
                  sub          t2, a5, a3
                  mulhu        s4, t5, a6
                  srai         s9, tp, 19
                  sra          a0, s7, s1
                  rem          a3, t1, a2
                  and          tp, a3, a4
                  fmv.w.x      ft9, s6
                  fmv.x.w      t3, fa3
                  addi         a7, s7, 591
                  fcvt.w.s     t2, ft3, rmm
                  slli         t0, s6, 23
                  addi         s9, s6, -950
                  addi         t2, s3, 64
                  srai         t1, t2, 16
                  auipc        s11, 445359
                  sra          s6, a6, s3
                  sra          t0, s9, s10
                  andi         s8, s5, -1681
                  nop
                  fcvt.s.w     fs6, s9, rmm
                  lui          s0, 467875
                  fsub.s       ft11, fa5, ft7, rup
                  and          s10, s0, gp
                  srai         s9, s11, 28
                  fcvt.w.s     a3, ft10, rmm
                  add          s7, s1, s9
                  lui          a3, 868269
                  sra          a6, a0, s4
                  and          s10, s3, s6
                  or           a6, t4, s7
                  add          s5, a3, a3
                  div          sp, a4, s10
                  andi         s9, zero, 734
                  xor          t3, t1, s11
                  fsgnjn.s     fa4, fa2, ft11
                  fsub.s       fs7, fs1, fs6
                  fle.s        s11, ft3, fa0
                  fmax.s       ft10, fa3, ft8
                  ori          a3, a7, -1279
                  and          s5, s0, s7
                  mul          a3, a5, a5
                  srai         a5, a1, 14
                  flt.s        ra, fa0, fa7
                  nop
                  and          s1, t2, a7
                  fmul.s       fs4, ft3, ft5, rdn
                  srl          a2, tp, t3
                  fmax.s       fa1, ft1, ft9
                  remu         s2, a0, s1
                  divu         t1, t5, s5
                  srl          t0, s0, a0
                  nop
                  xori         ra, s5, -1586
                  andi         s3, ra, -790
                  mulh         s9, s5, a7
                  rem          s9, s5, tp
                  fsgnj.s      fs5, fs0, fa7
                  fmul.s       fa0, fs6, ft7
                  flt.s        t2, fs2, fa0
                  fmax.s       ft4, fs1, fs7
                  slli         s10, a7, 31
                  slti         a0, a6, -672
                  srli         t0, a4, 26
                  div          t2, s10, t2
                  mulhsu       sp, s1, s8
                  ori          a6, s4, 859
                  flt.s        a5, fs6, fa6
                  fmin.s       fs9, ft11, fs1
                  fsgnjx.s     fa7, fs3, fa6
                  or           a1, a5, s10
                  fmax.s       ft8, ft4, fa7
                  fclass.s     s1, ft9
                  fsgnjx.s     fs1, ft3, ft11
                  srai         s0, s2, 31
                  rem          t4, s7, s11
                  sltu         t0, sp, s2
                  auipc        a2, 1019663
                  add          a2, s11, a5
                  fmv.w.x      ft8, ra
                  auipc        s9, 598648
                  slt          s7, s7, tp
                  fcvt.s.wu    fa4, tp, rmm
                  slli         s8, a7, 22
                  feq.s        t0, ft8, ft8
                  fadd.s       fs10, ft3, fs3, rup
                  slti         a1, a7, -1048
                  sub          t3, s5, t6
                  fcvt.wu.s    zero, fs1, rtz
                  fdiv.s       fa5, fs8, fa1
                  srli         a3, s8, 15
                  slt          s10, a5, a1
                  fsgnjx.s     fa3, ft4, fa5
                  or           s0, s1, s10
                  sra          t2, t2, a0
                  add          s4, s6, a1
                  srli         a6, s9, 25
                  fsub.s       ft7, ft7, fa2
                  addi         a6, s7, 449
                  fcvt.wu.s    s9, fs5, rdn
                  mulh         sp, ra, sp
                  fsqrt.s      fs3, ft0, rtz
                  andi         sp, t4, 1896
                  flt.s        t0, fs11, fs1
                  lui          a7, 341065
                  andi         t2, s11, 961
                  fsgnjx.s     fa6, ft9, ft2
                  fmin.s       fa7, ft3, fa2
                  fmul.s       fs6, ft0, ft11
                  mulhsu       s7, s0, t4
                  feq.s        a1, fs8, ft4
                  nop
                  mulhsu       a1, s2, a6
                  remu         s11, sp, t2
                  fsqrt.s      fs6, fs9
                  fle.s        a2, ft4, fs3
                  xor          s10, a2, s3
                  feq.s        s7, ft5, fa0
                  fadd.s       ft8, fs10, fs0, rtz
                  auipc        sp, 885228
                  mulhsu       t2, s10, s5
                  fsgnjn.s     ft5, fs0, ft1
                  fcvt.s.wu    fs0, s2, rup
                  auipc        a3, 100574
                  sll          a2, t6, s9
                  mul          a1, s8, a2
                  or           a3, s7, a7
                  sra          s10, s7, sp
                  sltu         s8, a1, zero
                  remu         t3, s8, a7
                  fmin.s       fs9, fa2, fa4
                  and          a5, a4, s10
                  divu         t0, s5, s8
                  add          s10, a0, a0
                  mulh         s4, a5, s3
                  sra          ra, a6, s3
                  slt          t4, a1, s5
                  fadd.s       fs2, ft11, fs11
                  fdiv.s       fa0, fs0, ft11, rtz
                  fsub.s       fa2, fs3, ft7, rmm
                  fmv.w.x      fa4, s10
                  sltu         s4, t6, s6
                  mul          s2, s11, t5
                  fmv.w.x      fs11, ra
                  fmv.w.x      ft2, s8
                  fsgnjn.s     fa1, ft1, ft9
                  andi         s0, sp, 1064
                  fsqrt.s      ft8, fa0, rmm
                  fdiv.s       fs7, fa4, ft2
                  fsqrt.s      ft5, ft3
                  fcvt.wu.s    a6, ft3
                  fsub.s       fa4, ft3, fa0, rtz
                  sra          a2, t3, s8
                  auipc        s9, 333335
                  fsqrt.s      fs8, ft2
                  mulhsu       t1, s7, t0
                  div          ra, a7, t3
                  mulh         a5, gp, s0
                  xor          s0, a4, t0
                  fmv.w.x      fs2, s2
                  fcvt.s.w     fs11, s5, rtz
                  add          s10, t4, t4
                  fmin.s       fs10, ft3, ft1
                  sltu         t4, t3, s3
                  srai         s6, t1, 1
                  slti         gp, s11, -2046
                  slti         a2, a2, 580
                  fsqrt.s      fs7, fa7, rmm
                  fsgnjn.s     fa7, fs9, ft1
                  mulhsu       t1, a0, gp
                  mulhu        s10, s11, a3
                  srai         s9, s11, 1
                  fcvt.wu.s    s4, fs3
                  rem          s10, sp, a2
                  remu         a7, t3, a5
                  fsgnjn.s     fa3, ft11, ft10
                  flt.s        ra, fs5, fs3
                  ori          tp, a5, 1883
                  feq.s        t3, fs4, ft0
                  sltu         gp, a1, t0
                  srl          s8, s7, s7
                  slti         a5, s1, -1933
                  rem          gp, s4, ra
                  srai         s9, s7, 12
                  rem          t1, s7, tp
                  fdiv.s       fs7, fs5, ft5
                  fsub.s       fs6, fs11, fs5
                  mulhu        tp, t2, s9
                  sltu         a3, a2, s6
                  mulh         a3, a4, s0
                  fcvt.s.w     fs10, t5, rmm
                  auipc        t0, 966097
                  div          t2, s1, t5
                  mul          s10, t2, s4
                  sltu         a3, ra, t5
                  fmv.w.x      fa7, s1
                  fdiv.s       ft6, fa4, fa7
                  srli         t4, a4, 14
                  fsub.s       fs8, fs3, ft4
                  fsqrt.s      ft7, fs0
                  fmul.s       ft4, fa5, fs9, rne
                  fsgnjn.s     ft1, ft11, fs11
                  fsgnjx.s     fa7, fa2, ft1
                  mul          gp, s1, gp
                  fle.s        a1, fs2, fs0
                  slt          sp, s6, s3
                  fsgnjx.s     ft1, ft10, ft10
                  lui          s7, 481431
                  fdiv.s       ft3, ft3, fs9
                  la x31, test_done
                  jalr x0, x31, 0
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
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_2:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_3:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_4:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_5:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_6:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_7:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_8:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_9:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_10:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_11:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_12:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_13:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_14:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_15:
                  addi x30, x30, -4
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x342 # MCAUSE
                  srli x19, x19, 0x1f
                  beqz x19, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  sw  x14, (x30)
                  add x14, x30, zero
                  addi x14, x14, -128
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  add x30, x14, zero
                  csrr x19, 0x341 # MEPC
                  csrr x19, 0x342 # MCAUSE
                  li x6, 0x3 # BREAKPOINT
                  beq x19, x6, ebreak_handler
                  li x6, 0x8 # ECALL_UMODE
                  beq x19, x6, ecall_handler
                  li x6, 0x9 # ECALL_SMODE
                  beq x19, x6, ecall_handler
                  li x6, 0xb # ECALL_MMODE
                  beq x19, x6, ecall_handler
                  li x6, 0x1
                  beq x19, x6, instr_fault_handler
                  li x6, 0x5
                  beq x19, x6, load_fault_handler
                  li x6, 0x7
                  beq x19, x6, store_fault_handler
                  li x6, 0xc
                  beq x19, x6, pt_fault_handler
                  li x6, 0xd
                  beq x19, x6, pt_fault_handler
                  li x6, 0xf
                  beq x19, x6, pt_fault_handler
                  li x6, 0x2 # ILLEGAL_INSTRUCTION
                  beq x19, x6, illegal_instr_handler
                  csrr x6, 0x343 # MTVAL
                  1: la x31, test_done
                  jalr x1, x31, 0

ecall_handler:    
                  la x19, _start
                  sw x0, 0(x19)
                  sw x1, 4(x19)
                  sw x2, 8(x19)
                  sw x3, 12(x19)
                  sw x4, 16(x19)
                  sw x5, 20(x19)
                  sw x6, 24(x19)
                  sw x7, 28(x19)
                  sw x8, 32(x19)
                  sw x9, 36(x19)
                  sw x10, 40(x19)
                  sw x11, 44(x19)
                  sw x12, 48(x19)
                  sw x13, 52(x19)
                  sw x14, 56(x19)
                  sw x15, 60(x19)
                  sw x16, 64(x19)
                  sw x17, 68(x19)
                  sw x18, 72(x19)
                  sw x19, 76(x19)
                  sw x20, 80(x19)
                  sw x21, 84(x19)
                  sw x22, 88(x19)
                  sw x23, 92(x19)
                  sw x24, 96(x19)
                  sw x25, 100(x19)
                  sw x26, 104(x19)
                  sw x27, 108(x19)
                  sw x28, 112(x19)
                  sw x29, 116(x19)
                  sw x30, 120(x19)
                  sw x31, 124(x19)
                  la x31, write_tohost
                  jalr x0, x31, 0

instr_fault_handler:
                  add x14, x30, zero
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 128
                  add x30, x14, zero
                  lw  x14, (x30)
                  addi x30, x30, 4
                  mret

load_fault_handler:
                  add x14, x30, zero
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 128
                  add x30, x14, zero
                  lw  x14, (x30)
                  addi x30, x30, 4
                  mret

store_fault_handler:
                  add x14, x30, zero
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 128
                  add x30, x14, zero
                  lw  x14, (x30)
                  addi x30, x30, 4
                  mret

ebreak_handler:   
                  csrr  x19, 0x341
                  addi  x19, x19, 4
                  csrw  0x341, x19
                  add x14, x30, zero
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 128
                  add x30, x14, zero
                  lw  x14, (x30)
                  addi x30, x30, 4
                  mret

illegal_instr_handler:
                  csrr  x19, 0x341
                  addi  x19, x19, 4
                  csrw  0x341, x19
                  add x14, x30, zero
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 128
                  add x30, x14, zero
                  lw  x14, (x30)
                  addi x30, x30, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x19, 0x300 # MSTATUS;
                  csrr  x19, 0x304 # MIE;
                  csrr  x19, 0x344 # MIP;
                  csrrc x19, 0x344, x19 # MIP;
                  add x14, x30, zero
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 128
                  add x30, x14, zero
                  lw  x14, (x30)
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
