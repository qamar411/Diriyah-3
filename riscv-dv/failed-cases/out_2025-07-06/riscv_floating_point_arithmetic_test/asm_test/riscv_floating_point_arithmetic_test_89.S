.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x23, h0_start
jalr x0, x23, 0
h0_start:
                  li x26, 0x40001120
                  csrw 0x301, x26
kernel_sp:        
                  la x17, kernel_stack_end

trap_vec_init:    
                  la x26, mtvec_handler
                  ori x26, x26, 1
                  csrw 0x305, x26 # MTVEC

mepc_setup:       
                  la x26, init
                  csrw 0x341, x26

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x26, 0x3800
                  csrw 0x300, x26 # MSTATUS
                  li x26, 0x0
                  csrw 0x304, x26 # MIE
                  mret
init:             
                  li x26, 2139095041
                  fmv.w.x f0, x26
                  li x26, 0
                  fmv.w.x f1, x26
                  li x26, 684273234
                  fmv.w.x f2, x26
                  li x26, 4286578688
                  fmv.w.x f3, x26
                  li x26, 2147483648
                  fmv.w.x f4, x26
                  li x26, 2151028629
                  fmv.w.x f5, x26
                  li x26, 2139095040
                  fmv.w.x f6, x26
                  li x26, 7930734
                  fmv.w.x f7, x26
                  li x26, 2139095040
                  fmv.w.x f8, x26
                  li x26, 572667575
                  fmv.w.x f9, x26
                  li x26, 2147483648
                  fmv.w.x f10, x26
                  li x26, 2152585869
                  fmv.w.x f11, x26
                  li x26, 2149195508
                  fmv.w.x f12, x26
                  li x26, 2139095041
                  fmv.w.x f13, x26
                  li x26, 4286578688
                  fmv.w.x f14, x26
                  li x26, 2139095039
                  fmv.w.x f15, x26
                  li x26, 2151577952
                  fmv.w.x f16, x26
                  li x26, 2139095041
                  fmv.w.x f17, x26
                  li x26, 2139095041
                  fmv.w.x f18, x26
                  li x26, 4286578687
                  fmv.w.x f19, x26
                  li x26, 0
                  fmv.w.x f20, x26
                  li x26, 3007420569
                  fmv.w.x f21, x26
                  li x26, 4286578688
                  fmv.w.x f22, x26
                  li x26, 3371853881
                  fmv.w.x f23, x26
                  li x26, 266041592
                  fmv.w.x f24, x26
                  li x26, 2139095041
                  fmv.w.x f25, x26
                  li x26, 2139095041
                  fmv.w.x f26, x26
                  li x26, 3385243532
                  fmv.w.x f27, x26
                  li x26, 4286578687
                  fmv.w.x f28, x26
                  li x26, 4286578688
                  fmv.w.x f29, x26
                  li x26, 2139095039
                  fmv.w.x f30, x26
                  li x26, 2139095040
                  fmv.w.x f31, x26
                  fsrmi 1
                  li x0, 0x80000000
                  li x1, 0x70183800
                  li x2, 0xf30ab284
                  li x3, 0x80000000
                  li x4, 0x80000000
                  li x5, 0x0
                  li x6, 0x0
                  li x7, 0xb144c1ec
                  li x8, 0x0
                  li x9, 0xf0f381dd
                  li x10, 0x7
                  li x11, 0xf6066fed
                  li x12, 0x2f6eee1f
                  li x13, 0x80000000
                  li x14, 0x80000000
                  li x15, 0xd5474a52
                  li x16, 0xc
                  li x18, 0xdcf13544
                  li x19, 0xfce3b970
                  li x20, 0x0
                  li x21, 0x0
                  li x23, 0x1
                  li x24, 0xf14edac2
                  li x25, 0xf7538fab
                  li x26, 0xe3ece2da
                  li x27, 0x646845b6
                  li x28, 0x80000000
                  li x29, 0x52801788
                  li x30, 0x3
                  li x31, 0x0
                  la x22, user_stack_end
main:             sltu         s10, a7, tp
                  fsub.s       ft10, fa1, fs9
                  and          s0, t6, s1
                  fclass.s     t4, ft8
                  slli         a5, s11, 19
                  srl          t2, s9, s9
                  fcvt.w.s     a1, fa0, rup
                  xori         t3, s6, 1280
                  fcvt.s.wu    ft6, t4
                  sub          a1, s9, t0
                  fcvt.s.w     ft7, a1
                  xor          s11, s8, sp
                  fcvt.wu.s    zero, ft2, rne
                  slli         s0, a0, 23
                  sra          t2, a0, s4
                  or           gp, a7, gp
                  divu         t1, s2, t2
                  fsgnjx.s     fa0, ft3, fs7
                  srl          t6, s1, ra
                  fdiv.s       fs1, fs9, fs10
                  srli         a0, s6, 27
                  fsqrt.s      fs1, ft10, rmm
                  fsgnj.s      ft5, fs9, fs10
                  sltu         s10, t6, s4
                  sltu         zero, zero, zero
                  sltiu        sp, s3, -1557
                  divu         sp, s4, a5
                  fsub.s       fs9, ft0, fs0
                  sll          a2, s10, t6
                  srl          s4, s2, a4
                  sltu         s2, t6, t2
                  fsqrt.s      ft11, ft5
                  fmul.s       ft2, fs10, ft10
                  mulh         gp, t6, a6
                  fmv.x.w      s0, ft7
                  xor          a6, s9, s8
                  fmin.s       fa3, fa6, fa1
                  nop
                  slti         t0, a5, 540
                  sll          tp, s6, a3
                  mulhu        tp, a7, zero
                  fcvt.w.s     t0, ft2
                  fdiv.s       fs6, ft7, fa4, rtz
                  sub          s4, sp, t2
                  fadd.s       fa6, fa4, fa5
                  fsub.s       fa2, fa0, ft9
                  slli         s10, s8, 28
                  sll          t3, tp, s7
                  sltu         s11, s3, t3
                  slt          a6, sp, t0
                  fcvt.s.wu    ft9, t4
                  xori         t3, t2, -1030
                  fmax.s       fs6, fa3, fs2
                  sltu         a5, s8, s3
                  fsgnjn.s     ft8, fs3, fs7
                  fmin.s       fs7, fs3, ft6
                  nop
                  srl          s10, a5, t3
                  fmin.s       fa0, ft7, ft0
                  lui          t6, 594785
                  addi         s11, gp, 442
                  fcvt.s.wu    ft5, gp
                  mulhu        t3, s10, s6
                  xori         s4, t3, 1129
                  add          gp, s5, s8
                  slt          s0, a1, s7
                  fsgnjn.s     ft6, ft2, ft5
                  fmin.s       ft0, ft4, ft0
                  div          sp, s11, a2
                  andi         s0, ra, -1116
                  fadd.s       ft9, ft9, fa2
                  fmul.s       fs6, fs3, ft11
                  fmul.s       ft8, fs2, fa2
                  sra          s9, s4, t0
                  mulh         gp, t1, s6
                  fmul.s       fs2, fs5, fa1, rdn
                  sltu         s1, a7, s1
                  fdiv.s       fa7, fa7, ft5
                  auipc        a6, 707535
                  fmin.s       ft7, ft8, ft9
                  fmul.s       fs11, fs8, ft11, rtz
                  slt          t4, t1, s1
                  addi         s3, s2, 480
                  feq.s        a6, ft4, fs11
                  andi         t5, gp, 534
                  fclass.s     t0, fs3
                  xor          a4, a5, a3
                  fsgnjn.s     fs0, fs0, fs10
                  fsub.s       ft7, ft6, fs1
                  slli         s1, t3, 28
                  mulhsu       tp, t5, a2
                  and          t2, s0, s8
                  fdiv.s       fs2, fa3, ft6
                  sltu         t1, s4, t3
                  fsgnjn.s     fa1, ft0, fs1
                  fcvt.wu.s    a4, ft7, rup
                  fdiv.s       fs3, ft1, fa3
                  fmv.w.x      fa6, s6
                  ori          t6, t0, 13
                  fmv.x.w      s11, fa2
                  slt          a5, t5, sp
                  sra          a4, a5, a3
                  fdiv.s       fa3, ft0, fs5, rtz
                  sra          s0, s7, ra
                  xor          s3, t6, t2
                  rem          ra, t5, zero
                  rem          a3, a4, zero
                  div          t2, t6, t6
                  nop
                  addi         a5, s5, -1972
                  ori          t1, s2, -1746
                  auipc        s5, 368086
                  slli         a1, t5, 1
                  or           gp, t2, a3
                  nop
                  divu         zero, t3, s11
                  srai         s8, a4, 1
                  mul          s11, s8, a3
                  fmv.w.x      fs5, s9
                  div          t5, s8, sp
                  auipc        s9, 624346
                  rem          s10, gp, a5
                  fsgnjn.s     fs6, fs7, fs8
                  fsub.s       ft9, ft8, fa5, rne
                  srl          zero, sp, a5
                  xor          s10, s3, t6
                  flt.s        s8, fs11, ft5
                  fmax.s       fa5, fa6, ft8
                  slti         s10, s3, -30
                  addi         sp, gp, 487
                  or           a5, a2, a0
                  fdiv.s       fa1, fs7, ft4
                  mulhsu       t3, t3, s10
                  addi         a6, s9, -222
                  fmv.w.x      fs9, s11
                  fsgnjx.s     fs5, ft4, ft4
                  div          s1, s2, t0
                  fcvt.wu.s    s5, fa6
                  sltiu        ra, a3, 742
                  sltu         s3, ra, tp
                  xor          t4, s11, s10
                  div          s8, s7, tp
                  fmin.s       fa3, ft1, fa0
                  fsqrt.s      ft1, fs1, rmm
                  fclass.s     tp, ft1
                  srai         zero, a2, 31
                  sltu         t5, tp, s1
                  sll          t6, t1, t4
                  sll          gp, s3, t6
                  mul          s8, s7, s1
                  or           tp, a0, s4
                  rem          a5, a6, s0
                  feq.s        zero, ft0, fa2
                  add          s0, s0, s7
                  fdiv.s       fs11, fs9, fs8
                  slt          s0, a3, s4
                  mul          s3, a3, gp
                  fsqrt.s      fs6, fs0
                  mulh         s1, zero, a4
                  mulhu        a6, s0, a3
                  fle.s        t0, ft5, fa1
                  srli         a0, tp, 27
                  sltiu        t5, s7, 1162
                  sltu         s1, a4, ra
                  mulhu        s5, a7, t5
                  lui          a3, 329328
                  feq.s        s9, fa3, fs2
                  fmin.s       ft11, fs7, fa5
                  fsgnjx.s     fa3, ft3, fa2
                  fsgnjn.s     ft1, fa4, ft5
                  nop
                  slli         a5, s1, 11
                  slt          a0, t1, t6
                  fmul.s       fs2, fs2, ft8, rdn
                  and          zero, s4, s5
                  div          t5, ra, a1
                  mulh         a6, s3, s3
                  fclass.s     a3, fa2
                  sltiu        zero, s3, -3
                  xor          s5, s7, sp
                  fsub.s       fs6, fs9, ft7
                  flt.s        t4, fs1, fs10
                  slt          gp, a7, s1
                  addi         tp, t3, -883
                  slli         a2, a4, 23
                  fclass.s     t3, ft1
                  remu         a6, s6, t4
                  flt.s        s10, fa5, fs2
                  nop
                  nop
                  flt.s        s2, fs2, ft2
                  fmv.x.w      tp, ft3
                  fmul.s       ft5, fs3, fs1, rne
                  xori         sp, s9, -1878
                  sub          s4, s5, s9
                  fmin.s       ft2, ft2, fa2
                  fcvt.wu.s    gp, fs0
                  sltu         s1, t4, t2
                  fmv.x.w      s2, ft7
                  fmin.s       ft4, fa1, fs3
                  fle.s        a0, ft10, fa2
                  ori          a1, s0, 1146
                  xor          t2, s6, sp
                  sltiu        s9, zero, -1212
                  auipc        s11, 701284
                  fcvt.w.s     t2, ft7
                  remu         t1, s3, t6
                  and          a1, a6, s0
                  sub          s10, a2, t2
                  fmax.s       ft9, ft3, fs10
                  fmv.x.w      a0, fs1
                  addi         a2, s0, -512
                  ori          s8, t4, -424
                  sra          a1, s2, s7
                  mulhu        s2, s8, s2
                  andi         s9, tp, -1344
                  nop
                  fsgnjn.s     fa2, fa0, fa3
                  sll          s8, t1, s11
                  sltiu        s8, t3, 1641
                  fsgnjn.s     fs11, ft9, fa0
                  fclass.s     sp, fs8
                  fsgnj.s      ft1, fa4, ft10
                  sltiu        s4, ra, -1804
                  lui          zero, 17085
                  slt          t1, a6, ra
                  feq.s        ra, ft8, fs11
                  srl          t6, s4, s6
                  remu         tp, t2, s1
                  fclass.s     s1, ft11
                  sra          sp, gp, a1
                  fcvt.wu.s    t0, ft5
                  andi         s4, s10, 1874
                  fsqrt.s      fs11, ft4
                  fcvt.wu.s    s1, ft3
                  fdiv.s       fa2, ft3, fa1, rdn
                  divu         gp, s8, s11
                  srai         a6, s3, 23
                  srl          t0, ra, s6
                  mulh         a6, s2, t4
                  sltu         tp, sp, zero
                  srli         s1, a0, 12
                  slti         t1, sp, 475
                  or           t2, a7, t1
                  ori          t6, t1, -918
                  mulh         t5, s1, a3
                  lui          s9, 700958
                  srai         a0, s3, 14
                  andi         a5, t3, -503
                  fmin.s       ft10, ft3, fs0
                  sra          a2, a4, t4
                  andi         ra, a2, -142
                  srl          s0, s9, s6
                  slt          zero, tp, a6
                  fdiv.s       fa7, ft2, ft8
                  fmul.s       fa3, fa4, fa5, rtz
                  fsgnjx.s     ft8, fa2, ft5
                  mulh         s9, zero, s3
                  lui          t3, 807220
                  rem          s3, a6, t3
                  slt          s1, a2, t4
                  fcvt.s.wu    fa7, s11
                  nop
                  or           sp, zero, a1
                  fmax.s       fs11, fs8, fa2
                  sra          gp, s4, a2
                  sra          a5, s1, a3
                  slti         s4, a1, 939
                  fsqrt.s      fa7, fa7
                  slt          gp, a1, s3
                  fle.s        s2, ft6, fa1
                  fdiv.s       fs5, fa4, fa5, rne
                  fadd.s       fa1, ft5, ft4
                  sub          s11, s7, a6
                  add          t1, t5, s6
                  mulhu        s2, a6, s11
                  fmax.s       fs7, fa4, ft4
                  xor          s8, s10, a4
                  remu         a6, s8, a6
                  div          s0, s5, a2
                  lui          t0, 924144
                  mul          t1, t1, s7
                  sub          a5, a0, s10
                  sltiu        t2, sp, 1036
                  rem          s9, t6, tp
                  fcvt.s.wu    ft4, s0, rup
                  xor          sp, s9, a1
                  srli         a5, tp, 26
                  rem          t4, s11, a1
                  fsgnjn.s     fs0, fs2, fa6
                  fcvt.w.s     t2, fa3, rmm
                  sltiu        a2, s3, -1260
                  ori          a4, s2, 104
                  sra          s1, s8, sp
                  divu         a3, tp, s5
                  flt.s        a6, fs1, fs11
                  fsgnjx.s     fs10, fs5, fa6
                  slt          a6, s0, s9
                  slt          t1, t0, s6
                  slt          t4, a2, t4
                  sltiu        a6, a4, -700
                  fmv.w.x      fa5, t5
                  and          t2, s4, t4
                  fadd.s       ft7, ft2, fa7
                  srl          t5, s9, s1
                  slli         gp, s9, 16
                  srli         t4, t4, 0
                  sltiu        a4, t5, -996
                  andi         s8, a0, 697
                  or           a0, gp, t3
                  addi         t1, a2, 1554
                  andi         t3, t6, -90
                  fsgnj.s      ft0, fs5, fs9
                  ori          a5, gp, -431
                  mulh         s4, a6, t4
                  fcvt.wu.s    s0, ft0
                  andi         a0, s0, 1712
                  and          s11, sp, s10
                  sra          a0, s1, s8
                  fsgnj.s      fa2, ft8, fa7
                  nop
                  fcvt.s.w     ft2, a4, rtz
                  div          t1, t2, t5
                  fcvt.wu.s    sp, ft10
                  fdiv.s       ft3, ft5, ft2, rmm
                  fmv.w.x      ft4, s2
                  mul          a2, s8, a1
                  fcvt.w.s     tp, ft5
                  fmax.s       fs8, fa0, ft0
                  add          zero, t3, t1
                  fcvt.w.s     a5, fa2, rmm
                  fmul.s       fs11, fa6, ft8, rtz
                  mulh         s10, gp, s8
                  and          a6, t5, t5
                  fclass.s     s8, ft7
                  fcvt.s.wu    fs0, t1
                  fsub.s       ft6, fa4, fa4
                  xor          zero, s1, s8
                  ori          a2, s7, 287
                  mulhu        t6, t3, t0
                  fdiv.s       fs4, ft8, ft1, rtz
                  feq.s        sp, fs4, fs0
                  slt          t1, tp, s9
                  feq.s        t4, ft9, ft5
                  fdiv.s       ft6, fa2, ft1
                  remu         a3, a0, s8
                  ori          t4, a2, -1613
                  flt.s        s2, ft10, fs9
                  fle.s        a2, fa6, ft9
                  fmax.s       ft5, fs8, fa0
                  srl          s9, s7, s11
                  xor          a1, s8, a3
                  div          s5, gp, tp
                  div          t6, t0, s6
                  fle.s        t2, fs4, ft4
                  fcvt.w.s     s5, ft6
                  fclass.s     a4, fs4
                  lui          s1, 736153
                  mulh         t3, t0, a1
                  slt          tp, a2, t4
                  slt          t2, t1, t5
                  sra          t3, s9, t4
                  mulhsu       t0, s6, ra
                  fmv.x.w      a6, ft9
                  feq.s        s11, fs8, fs8
                  fclass.s     t0, fs3
                  sltiu        s0, sp, 1540
                  fcvt.wu.s    t2, fs7, rmm
                  slti         t0, s1, -41
                  sub          s2, a7, zero
                  nop
                  slt          s10, a0, tp
                  sll          zero, s7, s11
                  fadd.s       ft5, fs7, ft9, rdn
                  sub          s1, ra, s5
                  xori         a2, t6, -46
                  addi         sp, sp, -80
                  sra          s11, s0, t4
                  fsgnjx.s     fs11, fs5, fa2
                  fdiv.s       ft10, ft0, fa7, rup
                  fle.s        s1, ft0, fa1
                  fsgnjx.s     fs7, ft7, fs3
                  mulhsu       a5, t3, s2
                  xori         s1, s0, -459
                  feq.s        tp, ft9, fa5
                  fsub.s       ft10, ft0, fa2, rmm
                  fsgnjx.s     fa0, ft5, fs11
                  nop
                  sltu         tp, s5, s7
                  fsub.s       fa0, fs3, fa4
                  slti         s8, s9, 1304
                  ori          t5, a7, 1024
                  fadd.s       fs6, fs3, ft11
                  nop
                  xori         a4, s4, 90
                  sltiu        a1, ra, 505
                  mulh         ra, s1, t0
                  fmin.s       fa6, fs0, fa6
                  fclass.s     s0, fs2
                  fcvt.wu.s    t2, fs11, rne
                  mul          ra, tp, s5
                  fmv.w.x      ft8, s10
                  slti         a0, s6, 65
                  flt.s        s10, fs3, fa5
                  mulh         s4, s7, s7
                  srai         t6, s9, 6
                  mulh         t6, t0, a0
                  remu         tp, s10, t2
                  fsgnjx.s     ft8, fs11, ft0
                  add          a5, t2, a5
                  ori          ra, a5, 1526
                  andi         a0, t6, 566
                  srl          s2, a6, s8
                  sra          tp, t1, gp
                  fcvt.wu.s    a2, fa7
                  nop
                  divu         s11, t3, t4
                  flt.s        s0, ft3, fs4
                  lui          a3, 648296
                  mulhsu       sp, s8, s9
                  srli         sp, t0, 12
                  mulh         s10, t2, s0
                  addi         t0, a0, -245
                  fcvt.w.s     a4, fs1, rdn
                  feq.s        t3, fa1, fa4
                  slti         s1, s10, 1438
                  lui          gp, 353838
                  fmax.s       ft11, fa5, ft5
                  fmin.s       fs0, ft6, fs7
                  xor          t6, s8, zero
                  xori         t5, zero, 951
                  remu         t0, s4, a3
                  fmul.s       fs5, fs11, fa0, rne
                  mulhsu       a2, s0, t1
                  fsgnjx.s     fs11, fa7, ft7
                  fclass.s     tp, fa1
                  fmv.x.w      s2, fa4
                  xori         t2, t6, 1770
                  ori          a0, t0, -1142
                  fdiv.s       fs7, ft7, fa3, rtz
                  sub          a0, s10, s1
                  lui          tp, 514781
                  divu         gp, t4, s7
                  fmax.s       fa5, ft3, fs9
                  or           a4, sp, a7
                  slti         s4, s0, -1849
                  slt          a4, a3, a5
                  xori         t6, t1, -59
                  nop
                  fclass.s     a4, ft7
                  srli         s2, a5, 20
                  xori         a0, s11, -891
                  fcvt.s.w     fa6, s6
                  slli         t2, t6, 24
                  auipc        s4, 310825
                  feq.s        s10, ft7, ft11
                  flt.s        a4, ft4, fs2
                  fsqrt.s      ft0, fa2, rmm
                  remu         t6, s4, s5
                  fcvt.wu.s    a0, fa0
                  sra          sp, s0, gp
                  fclass.s     s1, ft5
                  fsgnjn.s     fs3, fa2, fs6
                  fmul.s       ft0, fa6, fs8, rne
                  or           a3, s4, sp
                  fcvt.s.w     fa1, s4
                  slli         t6, s9, 3
                  ori          s11, s1, -577
                  fsub.s       ft0, fs11, ft11
                  fsgnj.s      fa2, ft5, ft9
                  sll          s10, t3, s10
                  xori         a2, gp, -174
                  fdiv.s       ft6, ft10, fa0, rup
                  slli         a1, a1, 30
                  sra          a3, a1, s2
                  fsgnj.s      fs3, fs4, ft2
                  fmin.s       fs3, fa5, fa0
                  slti         t3, s11, 987
                  mulhu        s4, a1, gp
                  fsgnj.s      fs4, ft11, fa3
                  sltiu        tp, s0, -1140
                  sll          ra, gp, s8
                  nop
                  sltiu        s2, s11, -1009
                  fsub.s       fa1, ft6, fs6
                  mul          t2, a0, a2
                  xori         t5, s10, -86
                  mulh         s3, s1, a3
                  fsgnjn.s     ft4, ft5, ft8
                  sll          s0, s8, a7
                  fcvt.s.w     ft5, a3
                  auipc        s11, 857355
                  or           a1, t5, sp
                  div          t3, a7, a2
                  fdiv.s       ft8, ft2, fs8, rdn
                  srai         tp, s2, 10
                  fcvt.s.wu    ft4, zero, rmm
                  srl          t2, s6, a1
                  div          a5, s8, s2
                  fmv.w.x      fs4, t0
                  srl          sp, s7, s10
                  fle.s        t3, ft10, ft4
                  fdiv.s       ft5, fa0, fs0, rtz
                  fcvt.wu.s    s8, fa2
                  fle.s        t3, fs1, ft0
                  mulhsu       a2, s9, s2
                  or           s5, t1, zero
                  sll          s8, s7, tp
                  nop
                  fsgnjx.s     fs7, ft8, ft0
                  feq.s        t3, ft9, ft8
                  slt          t5, ra, s5
                  fsgnjn.s     fs0, fa6, ft8
                  or           s5, sp, t0
                  srai         t3, s2, 14
                  add          a3, a6, s5
                  remu         t5, s2, t2
                  ori          ra, s7, -438
                  slli         t4, t4, 22
                  auipc        s0, 8497
                  andi         a6, s6, 617
                  srli         t1, s1, 3
                  mulhu        gp, t0, t1
                  sll          s3, a7, s2
                  add          s9, a1, gp
                  fcvt.wu.s    s2, ft9, rmm
                  fmv.w.x      ft8, t4
                  fsqrt.s      ft8, ft11, rmm
                  fsgnj.s      fa3, fs2, fs5
                  fcvt.s.w     ft10, s5
                  feq.s        s10, fs0, ft10
                  sub          sp, t2, s3
                  sltu         s1, s6, s9
                  fsgnjn.s     ft1, fs1, fa4
                  fmax.s       fa2, fs5, fa5
                  sub          s11, s7, s2
                  andi         a6, s3, 567
                  andi         s5, a3, -1750
                  flt.s        t3, fs11, fa7
                  fsgnjn.s     fs7, ft11, ft0
                  auipc        s10, 704053
                  slt          s8, a7, a4
                  fsgnjx.s     fs4, ft0, fs11
                  fsqrt.s      ft10, fs4, rtz
                  fle.s        zero, ft8, fs9
                  fsub.s       fa2, ft7, fs2, rmm
                  fsgnjn.s     fs0, ft9, fs9
                  mulh         s2, gp, s4
                  fsub.s       fa2, fa2, fs9
                  fcvt.s.wu    ft11, ra, rmm
                  fsqrt.s      ft2, fa4, rmm
                  div          a5, t1, a6
                  fsqrt.s      ft6, ft8
                  fadd.s       fa5, ft2, fs5, rtz
                  slti         t1, zero, 1965
                  slti         t0, gp, -486
                  lui          a4, 167668
                  auipc        s11, 49406
                  fcvt.s.w     fs1, t6
                  xor          t4, a6, a7
                  fmv.w.x      ft1, s11
                  sll          a1, sp, sp
                  fcvt.wu.s    a4, fs4
                  add          a0, a6, a3
                  remu         gp, zero, s8
                  srai         s10, a3, 14
                  remu         a4, a4, s11
                  fmax.s       ft11, fa6, ft3
                  fadd.s       ft2, fs8, fs2
                  sltu         s4, t1, s0
                  fadd.s       fs2, fa5, ft11
                  rem          gp, zero, a4
                  fcvt.s.wu    ft9, t5
                  feq.s        gp, ft4, fa6
                  sltu         s8, zero, s2
                  xor          a5, a4, s3
                  xori         s3, a7, 86
                  sra          s5, t6, t4
                  fmul.s       fa6, fs7, fs0
                  sltiu        a6, a5, 1779
                  mulh         zero, a2, a0
                  xor          a0, s9, a7
                  srai         zero, t6, 3
                  ori          t5, t1, 330
                  sll          a1, t5, s2
                  fdiv.s       fs6, fa5, ft4, rdn
                  srl          a0, t0, s2
                  fsqrt.s      fs8, fs9, rup
                  sub          s8, s10, t4
                  addi         a0, sp, 1954
                  divu         t1, a4, t3
                  slti         s1, s4, 1477
                  fsgnjn.s     fs8, fa7, ft9
                  fsgnjn.s     fs11, ft11, fs4
                  sub          t5, a1, s8
                  fsqrt.s      ft3, fs4, rne
                  fcvt.wu.s    s3, fa7, rtz
                  fsgnjn.s     fa7, fs1, fs0
                  fadd.s       ft7, fa1, fs11
                  fcvt.wu.s    s4, fs7, rmm
                  sll          zero, s3, t5
                  mul          a1, a1, t1
                  fle.s        t5, fs5, fa2
                  flt.s        ra, fs2, fs5
                  fsgnjx.s     ft0, fa3, fs2
                  sll          t5, s2, t6
                  xor          t1, s1, a2
                  fmax.s       fs2, ft3, fs4
                  fmin.s       fs6, ft7, ft8
                  div          t1, s5, a0
                  feq.s        t0, fs0, fs7
                  fcvt.s.wu    ft9, a3
                  fcvt.s.wu    fa1, a7
                  fmul.s       fs3, fa5, fa7
                  fcvt.wu.s    a1, ft9, rne
                  mulhsu       t0, t4, s0
                  sltiu        s8, s10, 1235
                  fdiv.s       fa2, ft5, ft6
                  slti         a1, a4, 303
                  mulhsu       sp, gp, s4
                  andi         sp, a1, -1588
                  flt.s        zero, ft8, ft8
                  mulh         zero, a4, a6
                  fsub.s       ft7, ft6, ft8, rtz
                  div          sp, s1, s9
                  fsqrt.s      ft4, fs8, rmm
                  fcvt.s.w     fa3, a4
                  mulhu        s10, a5, s11
                  fclass.s     a4, ft4
                  sra          s1, gp, s2
                  srl          s2, a0, a0
                  auipc        zero, 48727
                  fmv.w.x      fs9, s1
                  fmax.s       ft10, fs2, ft10
                  lui          s4, 38673
                  fmul.s       ft11, fa7, fa3, rdn
                  mulh         t3, a7, a3
                  andi         s2, a7, -278
                  fsub.s       fs0, fs10, ft10
                  addi         s4, s2, 1460
                  fsgnjn.s     fs9, ft10, fs0
                  xori         t0, s0, -620
                  fmax.s       ft8, fa6, fa7
                  fmul.s       fs5, fa3, fs10
                  fle.s        t3, fa7, ft3
                  srl          t3, tp, s0
                  fcvt.s.wu    ft6, t5
                  sll          t1, t3, ra
                  divu         s8, s5, gp
                  slti         a2, s6, 406
                  fsgnj.s      fa2, ft7, fs9
                  srl          ra, s8, s3
                  flt.s        ra, fs5, fs11
                  fcvt.s.w     fs10, s7, rtz
                  sub          s4, a3, s11
                  rem          sp, t5, t5
                  fsqrt.s      fs1, fs10, rmm
                  auipc        a2, 802475
                  fle.s        s8, fs3, fa0
                  mul          a2, gp, s5
                  sll          t6, s10, ra
                  auipc        s9, 403612
                  slli         s4, t2, 27
                  sub          s4, s4, tp
                  fdiv.s       fa5, fs4, ft8, rmm
                  xor          t1, sp, t6
                  fcvt.w.s     s8, fa3, rmm
                  auipc        s5, 146553
                  sltu         s3, ra, s5
                  fcvt.w.s     a0, fs11, rdn
                  fle.s        s2, fa5, ft8
                  flt.s        t4, fa3, ft8
                  srai         s11, s9, 0
                  mulhu        tp, s11, s7
                  div          a4, a2, s2
                  fsgnjn.s     ft9, fs6, ft7
                  addi         s8, ra, 1219
                  lui          s3, 164933
                  addi         s0, t4, 347
                  add          sp, s8, s3
                  fsgnjn.s     ft6, ft2, fs10
                  slt          s11, t4, s5
                  slt          a5, s9, s4
                  fcvt.wu.s    s8, ft10, rtz
                  fmin.s       ft1, fs5, ft8
                  fmin.s       fs1, ft2, fa0
                  mulhsu       a1, a3, sp
                  flt.s        s5, fs9, fs4
                  div          s10, sp, gp
                  fdiv.s       ft6, fs7, fs1, rup
                  fmv.w.x      fs10, s11
                  lui          s3, 1043657
                  sub          t6, t6, s8
                  add          t3, s6, ra
                  slti         t2, s2, 1487
                  xor          s8, a5, a5
                  fmul.s       fa3, fs3, fs11
                  fmv.x.w      t1, ft9
                  xor          ra, gp, s4
                  srai         a4, t4, 16
                  lui          t2, 204962
                  xor          s8, s11, s9
                  fclass.s     s2, fa1
                  flt.s        s3, fa5, fs3
                  mulhsu       s10, t0, s7
                  or           s8, s4, s0
                  fsgnjn.s     fs2, fs2, ft1
                  sra          s9, sp, s11
                  mulh         s2, sp, tp
                  xori         t3, a4, -1619
                  auipc        s5, 56532
                  fmv.w.x      ft6, s2
                  fadd.s       ft11, ft3, fa4, rmm
                  auipc        s3, 345930
                  slti         s1, a0, -1589
                  slti         a4, a4, -1077
                  fclass.s     t3, fa0
                  slti         a3, a3, -153
                  slt          s4, a1, s0
                  and          s8, s5, s2
                  fcvt.s.wu    fa0, a3
                  slli         s2, sp, 30
                  fsub.s       fa4, fa7, fs1, rne
                  fcvt.s.wu    fs10, s7, rdn
                  fcvt.wu.s    a3, fs7, rtz
                  fle.s        s8, ft10, ft6
                  sltu         s11, a2, tp
                  remu         s9, t1, t4
                  auipc        a2, 999776
                  xor          t3, s5, t0
                  fdiv.s       ft5, fs8, fs3, rtz
                  fcvt.w.s     s1, ft7
                  addi         s11, s7, 580
                  fcvt.s.wu    ft6, t5, rup
                  fsub.s       ft5, ft11, fs11, rne
                  fsub.s       fs1, fa3, fs6, rmm
                  mulhu        t3, a2, s3
                  divu         gp, a2, a4
                  srli         gp, s0, 11
                  fsqrt.s      fs8, fs5, rdn
                  mulhsu       t4, a0, zero
                  addi         s3, s11, 736
                  fcvt.wu.s    a1, fs3
                  nop
                  div          s11, s4, tp
                  fdiv.s       ft8, fs3, fa7, rdn
                  feq.s        t0, fs11, fs0
                  fsgnjn.s     ft8, ft11, ft4
                  fcvt.s.w     fs3, s8
                  srli         zero, gp, 22
                  nop
                  div          a1, a4, gp
                  mulhu        a1, a6, t0
                  slli         t6, tp, 20
                  mulhu        ra, t3, s10
                  slti         a4, s2, -1222
                  auipc        a6, 693098
                  mulhsu       s0, s10, t5
                  xori         t3, t6, -1532
                  fmv.w.x      ft7, gp
                  sltiu        s5, gp, -479
                  fsub.s       fs6, ft5, ft5
                  mulh         s0, s9, a5
                  sltu         s8, s5, t0
                  mul          gp, t1, a3
                  srl          s3, a7, t5
                  slt          s10, a2, zero
                  nop
                  xor          a4, s11, t2
                  fdiv.s       fs2, fs10, ft7, rmm
                  feq.s        t2, ft11, ft0
                  fmv.w.x      ft4, t4
                  fcvt.w.s     t6, ft9, rmm
                  andi         ra, s3, -1719
                  lui          s3, 985226
                  fsgnj.s      fa3, ft2, fs2
                  or           a6, a2, a7
                  fclass.s     ra, ft4
                  or           t1, a5, s8
                  ori          s5, a6, 1458
                  fcvt.w.s     ra, fs10, rdn
                  fdiv.s       fs5, fs7, ft6
                  fsgnj.s      ft4, fs7, ft4
                  fdiv.s       fa4, fs7, fs8
                  fmin.s       fs3, fs1, fa5
                  feq.s        a6, ft7, fs2
                  and          t0, t2, ra
                  fsgnjn.s     ft4, fs1, ft8
                  slli         t5, s11, 17
                  fadd.s       fa0, fs11, fs0
                  xori         s5, s8, 842
                  xori         s0, s11, -1878
                  fsgnjn.s     fs5, ft4, ft9
                  mulhsu       s11, sp, s0
                  mulh         t1, t3, s7
                  srl          a6, sp, s8
                  sra          s0, s5, a0
                  fsgnjx.s     fs11, fs2, ft9
                  fsub.s       fs6, fa4, fs0
                  auipc        s10, 816976
                  auipc        tp, 986243
                  mulhu        a1, s0, gp
                  fmax.s       ft11, fs6, ft10
                  mul          s9, s1, a0
                  srli         s2, t2, 21
                  divu         s3, s10, t2
                  fmv.w.x      fs5, t6
                  fmv.x.w      tp, fs4
                  auipc        s2, 550571
                  remu         a5, a1, zero
                  feq.s        zero, fs6, ft8
                  fadd.s       ft5, ft0, ft11, rtz
                  mulh         a6, sp, s6
                  srli         s3, s0, 13
                  sra          s5, t5, a1
                  fsqrt.s      fs3, fs11, rdn
                  auipc        s9, 428495
                  fcvt.wu.s    ra, fs2, rtz
                  remu         s4, s1, sp
                  auipc        s8, 518419
                  mulhsu       t3, a3, s6
                  fsgnjx.s     fs1, fa2, fs11
                  feq.s        s9, fa5, fs10
                  mul          s5, t5, t0
                  fadd.s       fs9, ft4, fs3, rne
                  nop
                  rem          s1, t5, s9
                  divu         t5, t6, s8
                  fmv.w.x      fs5, t5
                  sll          a4, s10, s2
                  fcvt.w.s     s9, fs11, rtz
                  slt          s5, a3, ra
                  flt.s        gp, fs10, ft2
                  mulh         s4, s9, t0
                  rem          a2, a3, s9
                  fmul.s       ft11, fs10, fs6, rup
                  fcvt.s.w     ft11, a4
                  xori         s0, s2, 721
                  srli         s10, a2, 25
                  fmul.s       fs5, fs5, fa4
                  sll          t0, s0, t6
                  mulhsu       zero, tp, a2
                  slli         a5, ra, 31
                  add          s11, s2, a0
                  fcvt.w.s     a1, fs10, rne
                  fdiv.s       fs3, fa5, fs6, rup
                  xor          a4, a2, a2
                  fsgnj.s      fa7, ft10, ft9
                  remu         ra, t5, a6
                  mulhu        s3, s9, t1
                  srl          s2, t2, a2
                  fmin.s       fs11, fa4, fa1
                  addi         s0, s2, -103
                  sltu         a0, s2, t4
                  fsgnjx.s     fs6, fa0, fa5
                  fcvt.s.wu    fa7, s7, rmm
                  slti         s11, s10, 1002
                  xor          a6, s5, s4
                  fcvt.s.w     ft9, a1
                  mulhsu       t1, s10, t3
                  fclass.s     s3, fa6
                  fcvt.wu.s    a3, fs11, rmm
                  fcvt.s.w     fs2, t4, rne
                  fsub.s       fa7, ft7, fa6, rtz
                  fle.s        t6, fs4, ft1
                  fcvt.wu.s    t5, fs5, rup
                  fadd.s       fs2, ft3, fs7, rtz
                  fsgnjx.s     fa5, ft3, ft2
                  sltu         t0, s10, s6
                  fle.s        s5, fs3, fa3
                  div          s8, t4, t6
                  feq.s        s5, fs11, ft2
                  mulhu        t2, s10, t0
                  fle.s        s8, fs10, ft4
                  flt.s        t6, fs10, fs8
                  fcvt.wu.s    s5, ft1
                  sll          t5, s5, s8
                  flt.s        t1, ft6, fa3
                  slti         zero, s8, -1121
                  fsgnjn.s     fs0, ft8, fa0
                  sra          tp, ra, s1
                  fdiv.s       fs0, fa3, ft1, rtz
                  srl          a0, a3, s0
                  divu         s0, a3, s7
                  sll          tp, a1, tp
                  auipc        t1, 735006
                  slt          s4, a5, s2
                  sra          a2, t3, a7
                  fsgnjx.s     ft1, fa7, fs3
                  addi         t1, a4, -54
                  mul          t5, s8, s3
                  auipc        a2, 274059
                  and          gp, t4, a6
                  xor          a0, t4, a6
                  slli         a1, t2, 21
                  fsgnjx.s     fs8, ft2, fs4
                  fcvt.s.wu    fa1, zero, rtz
                  rem          s3, zero, a6
                  fsgnj.s      ft7, ft11, fs9
                  mul          t0, t6, gp
                  addi         s0, t0, -1511
                  slli         a5, s3, 20
                  addi         ra, s11, -1832
                  fcvt.s.wu    ft7, zero, rdn
                  slti         a6, s0, -727
                  fsgnjn.s     fa5, ft2, fa4
                  fmax.s       ft8, ft4, fs4
                  andi         s9, t2, 617
                  flt.s        t0, fs5, fs2
                  slli         s9, s10, 13
                  addi         a3, ra, 508
                  remu         s1, s0, ra
                  fcvt.s.wu    fa4, s11, rup
                  fsgnj.s      ft10, ft1, ft0
                  add          a6, sp, zero
                  div          a5, s7, s1
                  or           s10, s0, s1
                  nop
                  fsgnj.s      fs3, fa2, fa4
                  fsgnj.s      fa7, fs9, fs2
                  sra          t2, a1, gp
                  andi         t6, s4, 1134
                  fcvt.wu.s    t3, ft3, rdn
                  addi         a0, t0, 1353
                  feq.s        s1, fa7, ft6
                  xor          s2, s6, s4
                  xori         a2, s5, 252
                  feq.s        a2, ft8, ft3
                  fsub.s       fa5, fa7, fa0, rne
                  fcvt.wu.s    s2, ft2, rmm
                  remu         t0, t6, s7
                  ori          s8, s3, 26
                  mulhu        t4, tp, tp
                  srli         tp, s2, 22
                  srl          s0, s9, s7
                  sltiu        a1, s2, 41
                  slt          t3, a5, a3
                  lui          s9, 982295
                  srl          zero, t4, t3
                  slti         a2, a5, -1621
                  xori         s5, s11, -795
                  fsub.s       fs2, fa6, fa2
                  rem          s3, t5, tp
                  mulh         t0, s1, tp
                  fsgnjx.s     fs8, fs8, fs11
                  rem          a0, t0, s6
                  div          t5, a6, a3
                  srl          s2, s4, a2
                  rem          s5, sp, s6
                  sra          a3, s4, a4
                  remu         t2, s1, s1
                  srl          a0, s8, s10
                  nop
                  fsub.s       fs10, fs8, ft4, rmm
                  or           a5, a5, t0
                  slli         t3, t1, 0
                  fcvt.w.s     t2, fs10, rne
                  fsub.s       ft11, fs7, ft6
                  xor          tp, t5, s11
                  srli         a0, gp, 3
                  sltiu        t5, a7, -920
                  feq.s        a3, fs10, fa0
                  divu         s5, s8, s10
                  fsub.s       fs9, ft9, fa4
                  fsgnj.s      fs4, fa5, ft11
                  slti         a4, s8, -1687
                  nop
                  fcvt.s.wu    ft3, s3, rmm
                  add          s3, a3, a4
                  mulhsu       gp, a3, a3
                  fmul.s       fs7, fs4, ft7
                  remu         t2, t3, a5
                  sra          s11, s5, a0
                  fle.s        t5, ft11, fs4
                  fcvt.s.w     fs11, a5
                  srl          ra, ra, a2
                  feq.s        t6, fs9, fa5
                  slt          a6, zero, ra
                  srai         s10, a2, 8
                  mul          a4, a2, s0
                  sltu         s10, t5, a7
                  fmin.s       fs9, ft4, fs11
                  fdiv.s       fs9, fa7, fs5, rup
                  fcvt.s.wu    ft3, s9, rup
                  flt.s        a6, ft9, ft8
                  fdiv.s       ft2, fa5, fa3, rtz
                  andi         t0, tp, 773
                  fmv.x.w      s11, ft4
                  fmul.s       fs6, ft1, fs8, rtz
                  srl          a6, a6, a5
                  and          s2, s1, s9
                  fcvt.w.s     s2, ft7, rup
                  fadd.s       fa2, fa0, ft7, rtz
                  srli         sp, s6, 21
                  fcvt.s.wu    fa5, a5, rne
                  fadd.s       fs9, fs2, ft1
                  mulh         s9, a6, a0
                  add          s2, s4, zero
                  srai         s1, ra, 22
                  sltiu        s8, s2, 858
                  fmul.s       fs9, fa0, fa7, rup
                  slli         a4, a0, 26
                  fsqrt.s      fa6, ft11, rtz
                  slti         t1, s7, -557
                  mul          a4, s3, s8
                  fmul.s       fs8, ft2, fs3
                  fmv.w.x      fs9, a1
                  srli         zero, a4, 8
                  fsqrt.s      fs4, fa5
                  fsgnj.s      fs9, fa2, ft6
                  sra          s9, a7, s2
                  mulhsu       s0, t4, s11
                  xori         a3, a3, -258
                  fsgnj.s      fa3, ft11, fa5
                  mul          s9, s3, t1
                  or           a4, s0, s6
                  sub          tp, zero, t4
                  fsgnj.s      ft6, ft8, fs0
                  nop
                  rem          sp, a3, s0
                  remu         a3, t2, s3
                  fsgnjn.s     ft10, ft9, ft9
                  andi         s10, s11, 1736
                  fclass.s     a5, ft6
                  fmax.s       fs7, fa0, fs8
                  andi         t4, a5, -602
                  or           t0, a3, gp
                  fmul.s       fs8, fa0, ft6
                  fdiv.s       fa1, fs7, fs0, rtz
                  add          s4, t1, s3
                  lui          t4, 665028
                  sub          t6, s4, t1
                  flt.s        t6, ft7, fa5
                  remu         a1, zero, s11
                  fsub.s       fs8, fa4, fs5, rdn
                  fcvt.wu.s    s0, fs6, rup
                  fmax.s       fs3, fa6, fs6
                  xor          s8, s10, a5
                  sltiu        s9, tp, -1218
                  fclass.s     tp, fs1
                  fmin.s       fa4, ft9, ft3
                  fmin.s       ft1, fa5, fs0
                  fmul.s       fs7, fa4, fs1
                  fsgnjn.s     fs10, fa6, fa1
                  fcvt.s.w     fa3, t6
                  or           a3, s3, a5
                  fcvt.wu.s    a6, fs11, rtz
                  fadd.s       ft11, fa0, fa7, rne
                  sub          t0, t2, t1
                  remu         a6, t0, s3
                  slt          a3, s4, a3
                  mulh         a6, a7, t5
                  fadd.s       ft5, fs4, fs10
                  addi         t4, gp, -1377
                  lui          s8, 247009
                  fcvt.w.s     zero, ft3
                  fcvt.s.wu    ft9, s1
                  addi         t3, zero, 932
                  andi         s9, s4, 1248
                  or           t1, t4, t3
                  fclass.s     s2, fs0
                  fsgnjx.s     ft10, fa0, fa3
                  fsgnj.s      fa1, fs7, fs9
                  feq.s        a6, fa0, ft11
                  addi         s3, t1, 1221
                  div          tp, t2, a5
                  flt.s        sp, fs2, ft2
                  fcvt.s.wu    fa1, a7
                  rem          a4, t0, s3
                  sltu         t5, s9, t4
                  fcvt.s.wu    ft5, s0
                  fle.s        s11, fs7, fa7
                  sll          t0, t5, ra
                  add          a0, t2, t3
                  lui          t6, 245869
                  sub          ra, s7, s8
                  fcvt.w.s     a3, fs0
                  srli         s8, a3, 29
                  add          ra, ra, t0
                  ori          sp, t0, 686
                  fdiv.s       fs3, ft6, fa7, rdn
                  slt          a2, s1, s0
                  fmv.x.w      a6, ft6
                  and          s4, a0, t6
                  fsub.s       fs4, fs10, fa2, rup
                  sll          a1, s10, t1
                  flt.s        a3, fs11, fa2
                  fadd.s       fa1, fs4, ft7
                  lui          sp, 620397
                  srai         t0, a3, 13
                  slli         zero, s8, 28
                  add          s10, s10, t2
                  add          s2, a2, s7
                  remu         s2, a4, a0
                  fsgnjx.s     fs7, ft7, fs10
                  div          t3, s4, a1
                  fmin.s       fs11, fa6, ft8
                  fsgnjx.s     fs10, fa7, fs10
                  fle.s        a2, fa5, fa7
                  mulhsu       s4, sp, s7
                  nop
                  mulhu        t2, t3, t4
                  div          a2, s5, a5
                  add          s0, s4, a6
                  slli         t1, a6, 29
                  fle.s        zero, fs4, ft8
                  fsgnjx.s     ft11, ft4, ft4
                  srai         a3, s11, 4
                  lui          a2, 942378
                  or           s8, a5, t4
                  mulhu        s2, s1, t6
                  srli         s5, s7, 31
                  remu         s5, a7, a2
                  fcvt.wu.s    s11, fa1, rmm
                  slt          s8, a7, s11
                  sltu         tp, tp, s11
                  fle.s        a4, fs7, fs8
                  divu         a0, s2, s1
                  or           t2, a1, a3
                  add          a3, a7, t4
                  fadd.s       fs5, fs2, fa7
                  fmax.s       fs4, ft4, ft0
                  xor          a2, zero, a1
                  fdiv.s       ft2, fs11, fs6
                  and          a6, s6, t6
                  srai         s4, a1, 27
                  mul          t6, s8, tp
                  sll          t6, ra, ra
                  srai         a4, s5, 26
                  srai         a2, t0, 15
                  sub          s1, t6, s11
                  fmv.w.x      fs11, a5
                  fle.s        a6, fa0, ft8
                  lui          s11, 265697
                  fsub.s       ft5, ft7, ft2
                  sltiu        s2, a2, 1353
                  fmv.w.x      ft5, gp
                  sub          t0, t5, a3
                  divu         s1, s3, t2
                  fcvt.wu.s    a3, ft8
                  fmax.s       fa4, fs9, fs11
                  fsqrt.s      fs5, fs0, rmm
                  rem          a2, s0, zero
                  remu         a5, a5, a1
                  andi         a6, t5, -694
                  add          s5, a5, t5
                  srl          s11, s10, a1
                  nop
                  fle.s        t2, ft4, fs2
                  mul          t0, s2, t6
                  mul          a0, s7, s1
                  fmv.x.w      gp, fa4
                  andi         t0, t5, 1615
                  div          s2, a5, s5
                  div          t4, gp, a6
                  or           s9, t4, s2
                  ori          t1, a0, -1329
                  or           a4, s2, t0
                  slti         s11, ra, 86
                  sltiu        tp, s9, -1271
                  fsgnjn.s     ft6, fs9, fs6
                  addi         gp, s3, -261
                  ori          s8, t6, -1149
                  andi         t2, gp, -43
                  fmin.s       ft7, fs9, ft7
                  fsgnjx.s     fa0, ft3, ft4
                  andi         t6, s1, 102
                  sub          tp, a1, t4
                  fmul.s       fa1, fs3, fa3
                  sra          a5, s11, s2
                  slti         t6, a2, 939
                  srl          gp, s1, a4
                  fmin.s       fa6, ft2, fa4
                  fadd.s       ft0, fs9, fs6
                  srai         s11, s1, 17
                  feq.s        t4, fs2, ft8
                  fsgnj.s      fs8, fs9, fs0
                  sltu         a4, s11, t5
                  rem          s1, t6, a2
                  fmul.s       ft4, fs6, fs6
                  fmv.x.w      s11, ft1
                  fcvt.wu.s    s4, fs11, rne
                  fmv.x.w      a1, fs11
                  mulhsu       a5, s1, s1
                  feq.s        t2, fa2, ft3
                  xori         ra, a5, 1987
                  flt.s        a1, fs3, ft0
                  fsgnj.s      fs11, fa1, fs0
                  fmv.x.w      s3, ft10
                  srl          s4, a6, s11
                  andi         s4, t5, -153
                  fsqrt.s      fs0, fa2
                  slli         a0, s9, 19
                  fmin.s       fs8, fa0, fa0
                  fmv.w.x      fs2, s6
                  slt          t5, t1, a4
                  fdiv.s       fs1, fs0, fa2
                  xor          t2, t2, s6
                  fmul.s       fs11, ft9, ft4, rtz
                  mul          t4, gp, s0
                  ori          a1, s8, 1176
                  addi         zero, a4, 1148
                  auipc        t0, 116286
                  fsqrt.s      fs0, ft0
                  remu         t6, t1, a5
                  mulh         s9, s10, s6
                  feq.s        s4, ft0, fa5
                  slt          s1, t6, s8
                  add          gp, t5, t3
                  xori         s2, a0, -909
                  addi         a1, a5, -383
                  fdiv.s       fs10, ft3, fa1, rup
                  feq.s        s10, fs11, fa7
                  slti         ra, a5, -38
                  div          t0, t4, a6
                  mul          zero, ra, ra
                  rem          s1, t1, s11
                  fsgnj.s      fa7, fs2, ft7
                  fmv.x.w      tp, fa4
                  xori         tp, t4, 444
                  ori          s10, s6, 555
                  mulhsu       s10, a7, gp
                  fmul.s       ft3, fs1, fs9
                  auipc        a1, 828182
                  auipc        t5, 673625
                  fsgnjn.s     fa6, ft1, ft9
                  rem          t5, tp, t2
                  fmax.s       fa6, fs7, ft1
                  fmv.x.w      t3, ft3
                  and          s8, s0, ra
                  srl          t6, s0, s3
                  mul          zero, a4, s10
                  fclass.s     s0, fa7
                  fmul.s       ft9, fs6, fa3, rtz
                  fcvt.s.wu    ft2, t1, rmm
                  xori         a0, a3, -1700
                  fmul.s       ft8, fs4, ft6, rup
                  xori         s2, a3, 1754
                  mulhsu       gp, s1, s1
                  fclass.s     s11, fa1
                  addi         sp, s3, 664
                  add          tp, t1, sp
                  and          tp, a0, a6
                  rem          s4, t2, s10
                  sll          s4, s8, s10
                  fsqrt.s      fs5, fs11, rne
                  auipc        t0, 477433
                  fsub.s       ft1, fs11, fs5
                  fdiv.s       fs5, ft7, fs4, rdn
                  fcvt.s.wu    fs1, s4, rtz
                  mulh         s8, ra, t6
                  sltu         zero, a2, s7
                  divu         ra, a3, tp
                  and          zero, a3, s1
                  fsgnjx.s     fs5, fa2, fs4
                  mulhsu       s9, sp, zero
                  fcvt.s.wu    fs9, t4, rne
                  div          t6, a7, s5
                  or           s1, a2, s1
                  fle.s        gp, ft1, fs11
                  flt.s        ra, fs1, ft2
                  fclass.s     tp, fs10
                  slli         tp, t1, 20
                  mulhsu       a2, zero, s2
                  fcvt.wu.s    a5, ft11
                  fmul.s       fa7, fa5, ft1
                  fle.s        a2, ft8, ft8
                  mul          zero, t3, gp
                  fcvt.s.w     fs11, a5
                  fsgnj.s      ft10, fa0, fs11
                  feq.s        t2, fs8, fs0
                  fclass.s     t0, ft11
                  fcvt.w.s     s5, fa5
                  fsgnjn.s     fa1, fs1, fs6
                  sltiu        s0, s3, -1360
                  fcvt.w.s     s3, fs8, rmm
                  fsub.s       fs6, fs6, ft1
                  fsgnjn.s     ft6, fs10, fs8
                  xor          gp, s4, s11
                  mulhu        a3, s2, a4
                  divu         s5, s11, s11
                  fmin.s       fs1, fa7, fa0
                  feq.s        s3, ft5, ft7
                  fsgnjx.s     ft8, fa6, ft2
                  fcvt.s.wu    fa2, s1, rdn
                  fsgnjn.s     ft8, ft3, ft4
                  fsub.s       ft8, fs4, fs6, rup
                  fsub.s       fa0, ft5, fs1, rtz
                  fsgnjn.s     fa0, ft7, ft2
                  fmv.x.w      tp, ft9
                  mulhu        a5, s0, a0
                  mulh         t4, gp, a4
                  fsub.s       ft1, fs5, ft7
                  fmv.x.w      s0, fs9
                  sll          t2, s3, s9
                  xori         t1, a6, 1159
                  fsgnj.s      ft10, ft11, ft5
                  sltiu        a3, gp, -117
                  ori          s4, tp, 1588
                  remu         s1, t0, s6
                  fcvt.s.w     fs11, s6
                  sra          zero, gp, s1
                  slti         s5, s9, -18
                  sra          t2, a1, t0
                  sll          t6, s9, a6
                  sra          s3, gp, a6
                  fcvt.w.s     t5, ft1, rup
                  flt.s        t4, fa6, ft3
                  addi         t3, a0, 331
                  xori         s1, a7, 1797
                  sltu         t3, a2, a5
                  flt.s        s11, ft8, fa1
                  slli         s11, a1, 24
                  flt.s        s8, ft11, ft8
                  sltiu        sp, zero, 315
                  and          s8, zero, s11
                  mulhu        s11, a6, a4
                  fsgnj.s      ft3, ft1, fa2
                  fsgnjn.s     fa4, fa4, ft6
                  slli         s2, t5, 30
                  or           tp, s1, s11
                  fsgnjn.s     fs11, fs10, ft0
                  mulh         s10, s1, a5
                  srli         t5, a7, 12
                  remu         s8, zero, t6
                  xor          s0, s2, a1
                  fmin.s       ft5, fs3, ft0
                  sub          s11, gp, t2
                  sub          gp, a0, ra
                  lui          s5, 186709
                  andi         gp, s6, 756
                  sltiu        s8, a1, -251
                  andi         a0, a0, 265
                  xor          t3, a3, s1
                  fmin.s       fa1, ft1, fs2
                  fsqrt.s      fs8, ft7, rtz
                  slti         s10, s6, -84
                  mul          t4, t1, gp
                  auipc        a5, 711354
                  fsqrt.s      ft2, fs9, rtz
                  and          sp, t2, t5
                  mulhu        a5, a7, t5
                  ori          s3, s0, -1070
                  sltu         t1, t6, s3
                  fmul.s       ft4, ft1, fs1
                  fsub.s       ft2, ft5, ft10
                  fcvt.wu.s    s11, fs10, rne
                  xor          a5, s8, a2
                  fcvt.wu.s    s1, fa5
                  sltiu        a1, s7, -81
                  sll          tp, a7, gp
                  flt.s        zero, ft1, ft8
                  fdiv.s       fa2, fs0, fs10, rdn
                  feq.s        a1, ft9, fs9
                  fsqrt.s      fs3, fa7
                  srli         tp, s2, 18
                  divu         s9, a3, t1
                  fsqrt.s      ft10, fs4
                  fsgnj.s      fs6, fs10, ft11
                  ori          a0, t5, -702
                  slli         t5, s7, 0
                  fcvt.w.s     a5, ft8
                  slt          ra, tp, a1
                  mul          t0, s11, a0
                  srli         s10, s2, 3
                  mul          zero, s5, s2
                  sll          a1, a7, a1
                  rem          ra, s11, s10
                  fmax.s       ft6, fs10, fs3
                  div          t1, s10, s3
                  fsgnjn.s     ft9, fa6, fs10
                  auipc        zero, 191244
                  sltu         s9, t5, a4
                  srai         a5, a7, 16
                  sll          zero, a7, t1
                  addi         tp, s8, -1113
                  feq.s        s10, fs1, fa3
                  srai         a1, t2, 9
                  sltiu        s0, t0, 396
                  and          zero, a7, t6
                  sra          s10, s5, s6
                  and          t3, s5, s11
                  addi         a1, t4, -1896
                  srl          s2, t4, tp
                  mulhsu       t6, a1, t2
                  slli         s4, a6, 30
                  srli         s1, t0, 16
                  fsqrt.s      fa2, fs11
                  sltu         s1, s2, s9
                  rem          sp, s5, t4
                  lui          s11, 1032265
                  feq.s        a0, fs3, fs7
                  xor          gp, a7, s8
                  fdiv.s       fa1, fs11, fa6
                  fle.s        s1, ft7, fa7
                  addi         ra, sp, 607
                  fcvt.s.w     fs11, a5, rtz
                  mul          t3, t5, sp
                  slti         gp, t1, 1592
                  nop
                  fmin.s       ft9, fs8, ft3
                  fmul.s       fs10, ft4, fa5
                  fcvt.w.s     s3, ft4
                  slti         t0, s2, -370
                  remu         s2, s8, s7
                  nop
                  sltu         s5, a7, a2
                  fsgnj.s      fa2, fs5, ft3
                  xor          t0, s7, s1
                  sra          s10, a4, a1
                  remu         a4, a5, a0
                  slli         s5, s7, 19
                  mulhsu       zero, a3, zero
                  lui          s10, 306899
                  mulhsu       zero, a3, a4
                  or           s11, a4, t4
                  fcvt.s.w     fs7, s4
                  and          a5, s2, s10
                  feq.s        zero, ft8, fs10
                  fmin.s       ft5, ft8, ft10
                  mulh         s11, t6, s9
                  fsgnj.s      fa4, fa5, fa0
                  fsgnjx.s     ft11, fs4, fs5
                  srai         a4, s7, 20
                  fdiv.s       fa2, fa5, ft4
                  fcvt.wu.s    s11, ft6, rup
                  fsqrt.s      fa5, fa1
                  xor          a5, a1, s2
                  sltu         a1, a1, a5
                  remu         s8, t6, s9
                  mulh         s11, a2, t2
                  fmul.s       fs1, fs8, ft0, rmm
                  ori          a2, gp, -757
                  fsgnjn.s     fa1, fs11, ft8
                  fsqrt.s      fa0, ft3
                  slli         a4, gp, 6
                  fmin.s       fa3, fs4, ft10
                  mulhsu       s8, a6, s8
                  auipc        t5, 809014
                  mul          a6, a3, a2
                  feq.s        a1, fs6, ft7
                  sra          s8, tp, t6
                  sub          ra, t1, s10
                  andi         s11, t1, -495
                  sltu         a1, t1, a3
                  sub          s3, s8, a3
                  fmax.s       fs10, fa5, fa2
                  mulhu        ra, a5, t1
                  lui          s9, 824667
                  srl          s3, a6, tp
                  ori          t5, s1, -807
                  fclass.s     a2, fs2
                  srl          s4, s10, tp
                  sltiu        t0, t2, 490
                  sub          s4, a4, zero
                  addi         s1, s9, 236
                  slt          s1, s4, t5
                  fdiv.s       fs1, ft4, fa7
                  sll          t5, a6, s2
                  divu         s5, a2, s2
                  add          s3, t0, s0
                  fadd.s       fs1, fs11, ft5
                  and          a2, t4, s5
                  srl          s5, s0, t3
                  mulhu        a4, t0, ra
                  fsgnjx.s     fa0, ft1, fs11
                  rem          t5, t2, s0
                  rem          a6, ra, ra
                  xor          sp, a7, s2
                  divu         s0, a1, s4
                  flt.s        a3, ft9, fs5
                  fcvt.w.s     t0, fa1
                  div          a0, s3, t6
                  slt          s1, s6, a7
                  xori         a5, s11, 586
                  slt          a5, s10, s3
                  sltu         t1, s8, s0
                  mulhu        s9, tp, t2
                  fmv.w.x      ft8, s0
                  auipc        s9, 137113
                  lui          sp, 66582
                  auipc        s4, 649720
                  fsqrt.s      ft5, fa7
                  and          s11, s2, a7
                  sub          a2, sp, s7
                  and          a6, t0, a7
                  mulh         a5, a0, t5
                  feq.s        a4, fs1, ft9
                  fsgnjx.s     fs6, fa3, fs11
                  remu         s5, s5, ra
                  sll          t2, a2, s8
                  mulh         s9, t0, s8
                  rem          a6, t1, sp
                  fmul.s       ft8, fa6, fa1, rtz
                  fsgnj.s      fs2, ft5, ft8
                  slli         t2, ra, 0
                  slt          ra, ra, t0
                  andi         s2, s11, 815
                  auipc        t3, 268565
                  nop
                  andi         s4, a2, 243
                  mul          t0, gp, s6
                  ori          a5, sp, 809
                  sltiu        tp, a4, -337
                  fcvt.wu.s    s11, fs9
                  sll          s8, s0, s4
                  slt          zero, s7, s5
                  addi         t4, s2, -1289
                  srli         t2, ra, 18
                  sltiu        a3, s9, 714
                  fsgnjn.s     fa7, ft5, fa6
                  fcvt.w.s     a1, ft2
                  fcvt.w.s     s8, fs5
                  fcvt.s.wu    fs3, tp, rmm
                  lui          a6, 928557
                  and          s9, s11, gp
                  and          t1, gp, ra
                  fdiv.s       fs4, ft1, ft2
                  fsgnjn.s     fa0, fa4, fa6
                  srl          a4, s0, t2
                  mul          a1, s8, t6
                  nop
                  fclass.s     t3, fa7
                  slli         s0, t1, 8
                  fsub.s       fs1, fs4, ft7, rdn
                  srl          a3, gp, s2
                  srl          s5, s8, a6
                  fsgnj.s      ft5, ft6, fs5
                  fcvt.s.wu    fs8, s1, rup
                  mulhu        s4, s0, a3
                  feq.s        t0, fa5, fa4
                  srai         s5, sp, 0
                  fmv.w.x      fa1, t2
                  fsub.s       fs3, fa3, ft9, rdn
                  div          a4, s10, s7
                  fmin.s       ft0, fs3, fs5
                  sra          t3, zero, a5
                  fmv.w.x      fs6, s11
                  fclass.s     t3, fs8
                  fsgnjx.s     ft5, fs4, fa0
                  fsqrt.s      ft6, ft10
                  feq.s        t0, fa7, fs8
                  rem          t0, s7, s8
                  fclass.s     a6, ft8
                  sll          a0, t4, a1
                  feq.s        a5, fs7, fs2
                  fmax.s       ft6, ft9, ft0
                  fcvt.wu.s    t1, fa3
                  add          t2, s11, s11
                  remu         t4, s2, ra
                  add          s10, s9, a5
                  add          s4, t2, s10
                  xor          t4, a2, t6
                  fsgnj.s      fs10, ft9, ft6
                  mulhu        a3, a1, t2
                  fadd.s       fa7, ft5, fs3, rmm
                  mul          a1, s3, t2
                  slli         s11, s10, 24
                  divu         a0, gp, t6
                  fcvt.wu.s    a4, fa5
                  sra          t6, a7, a5
                  mul          s11, t4, s1
                  fsqrt.s      ft0, fs10, rtz
                  remu         s3, s4, a1
                  slt          t4, a6, a7
                  auipc        s2, 513927
                  and          a6, t3, s2
                  fdiv.s       ft6, fa1, fs1, rtz
                  fmul.s       fs0, ft9, fa4
                  fmv.x.w      t1, ft11
                  div          a6, s4, a6
                  fmin.s       fa7, fa5, ft9
                  srli         t4, a5, 21
                  srai         t0, t5, 9
                  divu         t4, s2, a1
                  mulh         t1, s4, s1
                  rem          t1, s7, tp
                  srai         s5, t0, 31
                  sltu         s11, a2, t4
                  fmv.w.x      ft6, t6
                  fmul.s       ft6, fa5, fs11
                  slt          s3, a7, s3
                  slti         a2, a5, 1584
                  mulhu        a5, zero, s1
                  slli         a5, t2, 19
                  fdiv.s       ft1, ft7, fs11
                  mul          a6, t5, a6
                  mulhu        a6, ra, sp
                  xor          a6, a5, s2
                  srl          a1, s7, a3
                  rem          a2, s5, s11
                  fmv.x.w      gp, fs11
                  fadd.s       ft9, fs11, fa6, rup
                  fclass.s     t1, ft10
                  fmax.s       fs5, ft3, fs2
                  srli         s8, s3, 9
                  mulhu        a1, t6, a1
                  fmax.s       fs4, fa1, ft5
                  fsgnj.s      ft2, ft9, ft9
                  fmax.s       fs1, fa6, fs8
                  fmv.w.x      fs8, s0
                  remu         t5, t6, gp
                  fdiv.s       fa5, fs3, ft1
                  fmul.s       fs4, ft11, fs9
                  slli         a5, a2, 11
                  sll          s3, ra, s11
                  fmv.w.x      ft0, s11
                  div          zero, a5, t3
                  andi         a4, ra, 1748
                  mulh         a3, t6, t1
                  fsub.s       ft2, fa0, fs3, rne
                  fcvt.s.wu    fa5, t2
                  fcvt.s.w     ft11, s10, rdn
                  ori          t3, gp, 43
                  fmv.w.x      fa1, t0
                  srli         s10, ra, 8
                  sll          t5, a2, a3
                  mulh         a1, s0, t3
                  sll          s11, a4, a1
                  sltiu        s1, a4, -395
                  sltu         ra, t4, a4
                  mulh         s10, s4, s3
                  div          t4, t6, t0
                  fsgnjn.s     ft9, ft5, ft5
                  or           s10, a6, a1
                  slti         s10, s11, 1922
                  slti         s2, s3, -1850
                  remu         s9, a0, s9
                  andi         t2, a6, 644
                  fsgnjn.s     fs1, ft8, fs1
                  andi         a6, a3, 973
                  and          a5, s1, a6
                  addi         t1, a1, 1694
                  remu         gp, a3, zero
                  fdiv.s       fs0, ft7, ft10
                  slt          t5, a4, tp
                  feq.s        s10, ft11, ft1
                  addi         a2, gp, 1916
                  sra          t4, s0, a6
                  slt          s10, t2, a4
                  fmax.s       ft11, fa2, ft4
                  divu         a2, t2, t0
                  fcvt.wu.s    s11, fs11, rdn
                  fcvt.s.w     fs2, s4, rdn
                  sra          t5, a6, a3
                  sub          s11, s6, t5
                  slli         s8, a0, 7
                  fcvt.s.wu    ft10, t6, rne
                  addi         s11, a3, 916
                  fcvt.wu.s    s3, fs5
                  fcvt.w.s     a5, fa6
                  sra          s11, a0, s2
                  fsub.s       fs3, fa7, ft11
                  addi         s3, t0, 1421
                  rem          s8, a7, t5
                  sra          a0, s10, zero
                  fadd.s       fs5, fs1, fs6, rmm
                  srli         s8, s2, 19
                  fsqrt.s      fa2, ft8
                  fsub.s       ft11, ft10, fs9
                  slti         t0, s5, 234
                  mulh         gp, zero, s0
                  fcvt.s.wu    fs11, s5
                  fmax.s       fs7, ft6, fa4
                  fmv.w.x      fs8, a7
                  xor          tp, tp, s7
                  slti         zero, zero, 1688
                  fsgnj.s      fa2, fs9, fs3
                  mulh         t5, s0, s9
                  srli         a2, s10, 2
                  fmin.s       fa5, ft0, fa0
                  sltu         s2, a6, t5
                  xori         t3, s6, -1598
                  fsgnjn.s     ft7, fs3, ft1
                  fsqrt.s      fa7, ft5
                  fsqrt.s      fa2, ft7, rdn
                  fmin.s       ft2, fs2, fa6
                  mulhsu       t3, t4, a6
                  fmax.s       fa6, fs2, ft0
                  div          s0, t6, s7
                  ori          t1, t2, -205
                  srli         gp, a4, 14
                  slt          tp, s3, a3
                  or           t5, gp, s0
                  fmax.s       ft6, ft2, ft4
                  fmin.s       fs11, ft11, fs2
                  fcvt.s.wu    fa3, a0
                  slli         a1, a3, 30
                  sltu         t2, a1, s6
                  fsgnjn.s     ft11, fs1, fs10
                  fmax.s       fa0, fa5, fs8
                  mulhu        s8, s3, s6
                  mulhsu       s11, s2, a3
                  ori          a1, s1, 575
                  sub          t2, t5, gp
                  mulh         s9, t1, t6
                  slt          t5, a4, t4
                  mulhsu       a4, t1, s2
                  fmin.s       fs4, fs10, fs7
                  feq.s        s8, fa3, fs3
                  srli         t3, s5, 21
                  div          s4, t4, t3
                  fdiv.s       fs5, fs5, fa3
                  add          t1, s8, tp
                  sll          s4, a5, gp
                  sltu         a5, a2, a6
                  xori         a6, s11, -593
                  slti         a1, a6, 1004
                  add          a6, s1, s2
                  lui          s9, 882514
                  srli         zero, a1, 21
                  lui          s3, 392744
                  remu         s9, a5, s3
                  srli         gp, a7, 8
                  sub          s2, t1, zero
                  sltiu        t2, s8, -1202
                  slti         a2, a6, -62
                  sra          a4, s4, a3
                  xor          s2, s11, s8
                  divu         ra, s4, s0
                  fsgnj.s      ft4, fa6, fs10
                  xori         a2, a4, 1112
                  srl          s11, s1, t6
                  fmin.s       fa2, ft5, ft4
                  sltu         s2, a6, a5
                  srai         a1, a6, 13
                  fcvt.s.w     fs1, a3
                  mulhu        s0, tp, ra
                  and          s10, t3, s0
                  fcvt.w.s     a6, fs7
                  sll          s8, ra, zero
                  feq.s        gp, fa5, ft0
                  fmax.s       fs1, ft4, fs7
                  remu         s11, a5, s7
                  xori         a6, s10, 564
                  fmin.s       ft4, fs8, ft2
                  fcvt.s.w     fs3, t6
                  fmax.s       ft9, fa7, fa6
                  fmul.s       ft7, ft6, fa1
                  andi         t4, s2, -1675
                  divu         a1, t4, s11
                  fclass.s     zero, fs7
                  sra          t5, t6, t6
                  slti         sp, s7, -136
                  slti         a2, s2, -543
                  nop
                  remu         t0, t2, t3
                  fcvt.wu.s    s11, ft9, rmm
                  fcvt.w.s     s4, fs4
                  rem          t4, s9, s3
                  fmin.s       fa1, fs7, fa7
                  fcvt.w.s     t1, fs0
                  lui          a2, 763294
                  fmv.x.w      a1, ft10
                  mulhu        ra, t2, t5
                  fsgnjn.s     ft4, fa7, fs7
                  fcvt.wu.s    s1, fs2
                  srl          a6, s11, s2
                  srl          t0, s5, tp
                  rem          s5, t6, s4
                  sltu         a3, t6, t3
                  add          s1, t4, t3
                  mulh         s3, gp, t0
                  sltiu        t1, s8, 1797
                  slt          a3, sp, a6
                  fsgnjn.s     fs3, ft4, fa1
                  ori          s5, s7, -216
                  xori         t0, s9, -1209
                  feq.s        s3, ft5, fa7
                  fcvt.w.s     t1, fs8, rdn
                  slti         a4, s0, 817
                  andi         a1, a0, -358
                  sub          a5, t4, t0
                  slti         t4, t2, -637
                  xori         s5, s1, -981
                  fmv.w.x      fs8, sp
                  srl          s9, s4, tp
                  fsgnjn.s     fa7, fs3, fs6
                  mulhu        t6, s1, a2
                  addi         t0, t1, -1992
                  fsqrt.s      fa5, fa0, rdn
                  slti         t2, t2, 358
                  xori         s2, s6, -492
                  div          s1, s5, s11
                  fmin.s       ft11, ft4, fa6
                  slli         s1, zero, 20
                  fsgnj.s      ft3, fa7, fa6
                  lui          t5, 434470
                  mulh         t1, a5, s7
                  fclass.s     t1, fs1
                  fsgnj.s      ft7, fs9, fa4
                  nop
                  srai         a6, s6, 11
                  mulh         s11, t2, gp
                  addi         s10, s5, -376
                  srai         t0, s8, 31
                  fmv.w.x      fs3, s7
                  div          s9, s10, s2
                  div          t4, a4, a1
                  fsgnjn.s     fs8, ft8, ft7
                  srli         a4, s0, 21
                  fmv.x.w      t0, ft5
                  fmv.w.x      fs7, s10
                  srai         s10, a2, 0
                  mulhsu       s1, tp, s1
                  srli         s8, ra, 26
                  fsub.s       ft5, ft3, fa2, rup
                  lui          t5, 772194
                  nop
                  lui          a1, 519237
                  lui          s1, 850477
                  feq.s        s2, fs2, ft10
                  fle.s        s5, fs4, fs0
                  srli         a0, zero, 28
                  div          a0, a5, s8
                  slti         s1, t1, 496
                  fsgnj.s      ft4, fa4, fs9
                  flt.s        a0, ft9, ft11
                  fsub.s       ft1, fs9, ft4
                  srl          a6, t4, a0
                  sra          s0, ra, s7
                  mulhsu       ra, t3, a3
                  sltu         t1, ra, s2
                  addi         t5, s1, -411
                  addi         ra, t2, -1917
                  div          ra, ra, a0
                  xor          s3, gp, ra
                  sra          s11, s7, s1
                  fclass.s     s8, ft10
                  slt          t2, s5, a1
                  fcvt.s.wu    fs1, s6, rtz
                  fmv.x.w      t1, fs4
                  sub          zero, s7, s5
                  slti         t4, s4, 613
                  fdiv.s       fa0, ft1, ft10, rup
                  fmin.s       fs5, ft8, fs5
                  divu         a2, a2, t1
                  rem          t5, s2, t0
                  flt.s        t1, ft10, fa3
                  srl          t0, ra, a2
                  auipc        a0, 60091
                  fsub.s       fs1, fs8, fs3
                  sra          a2, a5, s2
                  flt.s        a6, ft4, fa3
                  srai         s1, sp, 18
                  slli         a5, s10, 5
                  mulhu        t5, a6, s2
                  fsgnjx.s     ft7, ft8, ft4
                  fmv.x.w      sp, ft7
                  fmin.s       ft4, fa6, fs6
                  sltu         s10, t4, a3
                  nop
                  fsgnjn.s     ft7, fs8, fs9
                  fclass.s     t1, fa4
                  flt.s        s8, ft2, fs7
                  add          s5, t4, t4
                  fsgnjx.s     fs1, fs9, fs7
                  fsgnj.s      fa7, fs8, fs4
                  slti         ra, t6, 1452
                  addi         t6, a1, -554
                  div          t1, a6, t6
                  fmin.s       fs4, fs10, fs7
                  fsgnj.s      ft9, ft9, ft1
                  fmax.s       ft4, ft9, fs2
                  remu         s11, a3, t2
                  sltu         s0, s7, t5
                  fmin.s       fa6, ft0, fs9
                  sltu         s0, s8, s6
                  mulhu        gp, sp, a1
                  fmax.s       ft10, fs7, ft7
                  fmin.s       fa3, ft1, ft4
                  slt          s9, t4, t2
                  feq.s        s10, fa2, ft4
                  div          s3, a0, s11
                  remu         a4, a2, zero
                  mul          a0, s4, s7
                  sltu         s11, s4, t6
                  fmax.s       fa5, ft4, fs5
                  sltiu        a0, tp, 707
                  div          t6, s6, s2
                  fmv.x.w      t3, ft9
                  div          a0, s11, s11
                  mulh         s2, a3, s8
                  or           s11, a0, s11
                  fcvt.s.wu    fs8, t6
                  or           s5, gp, t0
                  fclass.s     a1, fs9
                  fadd.s       fa4, ft1, ft3
                  mulhsu       s11, s7, t2
                  fadd.s       ft8, fs1, fs5, rup
                  mul          s10, ra, s4
                  rem          tp, tp, t2
                  andi         t3, s2, 1594
                  ori          t0, a1, -878
                  andi         s4, s10, -881
                  fmax.s       fs7, ft8, fa2
                  fcvt.w.s     s2, ft3, rmm
                  fadd.s       ft6, fa4, fa7
                  or           s1, s1, s4
                  fsgnj.s      fs7, fa0, fa1
                  slli         a1, t1, 10
                  andi         t0, s4, -849
                  fdiv.s       ft10, fs5, ft7
                  fmul.s       ft5, fa3, ft5, rne
                  sra          a4, s8, s5
                  rem          sp, s10, ra
                  rem          zero, a0, s6
                  sra          t6, s11, a5
                  srai         s5, s11, 12
                  fsub.s       ft5, fa0, ft7, rmm
                  auipc        s2, 303132
                  sltu         a1, ra, ra
                  fmax.s       ft2, fs5, ft0
                  fcvt.s.wu    fa3, a7, rmm
                  fsgnjn.s     fs3, fs8, fs6
                  fcvt.s.w     fs8, s3, rne
                  slli         a5, s2, 30
                  divu         a1, a0, a1
                  fle.s        a3, fa0, fs9
                  ori          t6, a1, -2047
                  feq.s        ra, fs8, ft8
                  fclass.s     s3, ft11
                  fmv.x.w      t5, fs9
                  fsgnjn.s     fa0, fa0, fs2
                  remu         s9, sp, a0
                  fmv.w.x      fa6, tp
                  fle.s        a3, fs9, fs2
                  slli         a0, t6, 16
                  fcvt.s.w     ft8, sp
                  slt          ra, ra, s10
                  sub          zero, ra, a0
                  fmax.s       fs4, fs9, fs4
                  mulhu        s4, a4, s8
                  slti         tp, t6, 1130
                  srli         s2, a5, 20
                  fadd.s       ft2, ft9, ft10, rmm
                  auipc        s10, 697020
                  fle.s        s2, fs11, ft4
                  fsub.s       ft3, ft1, ft5
                  sub          s5, s1, s3
                  srli         s5, a1, 0
                  fle.s        a0, fs10, ft2
                  fmax.s       ft7, fa1, fs2
                  fcvt.s.wu    fs9, t0, rup
                  fmv.w.x      fa4, zero
                  divu         gp, s1, s4
                  sra          sp, t4, a3
                  mulh         t4, s4, t4
                  fcvt.s.w     fs0, s5
                  fadd.s       fa6, fs3, fs3
                  remu         t4, a3, gp
                  fcvt.s.w     fs6, s10
                  mulhu        s11, s0, t3
                  fadd.s       fs2, fs2, ft9, rne
                  and          s2, t0, ra
                  sra          ra, a7, gp
                  mulhu        a4, a7, s5
                  add          t4, a4, s10
                  sltiu        t0, ra, -901
                  fmv.w.x      fs4, sp
                  slti         gp, t0, -1739
                  slti         s2, s7, -560
                  slli         zero, a1, 10
                  sra          gp, t3, s11
                  mulhu        ra, gp, t0
                  fcvt.s.wu    fs6, s0
                  xori         t4, zero, -1602
                  srli         a1, t3, 19
                  sll          a0, a0, s8
                  addi         s9, t2, 1740
                  lui          s1, 987537
                  fsub.s       ft2, ft6, ft9
                  mulhsu       a3, s8, a2
                  mulhsu       s5, s9, tp
                  fcvt.w.s     t6, fs7
                  fcvt.w.s     s5, ft11
                  fsgnjn.s     fs10, fa6, fs1
                  fsgnjx.s     fs1, fa3, fa2
                  remu         s8, t5, s8
                  srli         s9, s7, 5
                  fcvt.wu.s    a1, fs4, rup
                  fmv.w.x      fa1, a1
                  srli         a2, s4, 6
                  div          sp, s0, s8
                  feq.s        ra, fs0, fs3
                  and          s10, a0, sp
                  add          s3, s7, s6
                  srai         t5, s5, 5
                  fcvt.w.s     s11, ft11, rne
                  fmul.s       ft10, fs2, fs0
                  ori          s5, s0, -1980
                  flt.s        t0, ft3, fa5
                  mulh         s2, a4, t3
                  fsgnjx.s     fa0, fs0, ft11
                  fcvt.s.wu    ft4, t1, rne
                  fmv.x.w      s10, fs5
                  fsgnjx.s     ft4, ft6, fs0
                  fcvt.s.wu    fs7, t0, rmm
                  fmv.x.w      t6, fs7
                  flt.s        a0, ft4, fs6
                  fsgnjx.s     fs8, fs10, fs8
                  andi         t1, tp, 1609
                  fsub.s       fs1, fa5, ft2, rup
                  and          s11, a1, s5
                  srai         s8, gp, 22
                  feq.s        a1, fa7, fs7
                  xori         s11, s0, -411
                  fsqrt.s      fa3, fs2, rdn
                  fsgnjn.s     fa3, ft5, fs11
                  sra          s10, s11, s3
                  mulh         tp, t5, s10
                  fmax.s       fa2, ft4, fa0
                  and          s8, a1, tp
                  fmv.w.x      fa0, s6
                  fcvt.s.w     ft3, s2
                  sll          a6, t1, s5
                  fcvt.s.w     ft11, ra
                  fsqrt.s      ft4, ft9
                  srl          t4, s7, a5
                  fmv.x.w      t6, fa3
                  div          s5, a7, t4
                  ori          tp, s11, -1622
                  mulh         t4, t2, zero
                  fcvt.s.wu    ft7, t1
                  slti         zero, s1, -933
                  addi         a3, s7, 656
                  fsgnjn.s     fs8, fa7, ft5
                  addi         s4, a1, -15
                  sra          s3, a0, s2
                  lui          ra, 992680
                  andi         gp, a3, 182
                  xor          a1, s5, a7
                  lui          gp, 95739
                  sltiu        a4, sp, -1196
                  fmv.x.w      t4, ft1
                  ori          s0, t4, 1957
                  fsqrt.s      fs5, fs10, rmm
                  fsgnj.s      ft1, fa4, fs1
                  srai         s3, ra, 7
                  mulh         s10, s10, a6
                  mulhsu       a5, s2, s9
                  slt          sp, s0, t6
                  fmv.w.x      fa1, t2
                  srai         a3, a3, 15
                  fmax.s       ft11, fs11, fa1
                  feq.s        t4, fs4, fs2
                  fmin.s       fa2, fs11, ft10
                  sltu         t6, t6, s7
                  sll          t6, s3, t0
                  fcvt.s.w     ft7, t0, rtz
                  fcvt.s.wu    fs3, t6
                  fcvt.wu.s    s3, fa1
                  fmv.x.w      t6, ft8
                  xori         tp, a2, -338
                  srli         s4, a7, 19
                  slti         a5, a5, 1272
                  xor          s2, s7, s5
                  flt.s        a6, fs4, ft10
                  mulh         t2, s11, tp
                  fcvt.w.s     s0, fs1
                  nop
                  fsub.s       fa7, fs11, fa1
                  addi         s10, t0, -83
                  addi         sp, a6, -1447
                  sll          s5, gp, gp
                  fsgnj.s      ft8, fs5, fa4
                  fsgnjx.s     fa3, ft6, ft4
                  fmul.s       ft5, ft0, ft7
                  fcvt.w.s     s2, fs0, rdn
                  sub          a2, t1, a0
                  fsqrt.s      ft4, fs9
                  slli         a0, s11, 25
                  fmax.s       ft8, fs10, fs9
                  fmul.s       fs0, fa2, ft2, rtz
                  fmul.s       ft6, fs1, ft1, rdn
                  fsub.s       ft1, ft4, fs1, rne
                  fcvt.w.s     a0, fa6, rne
                  divu         s9, s8, s1
                  ori          s4, t6, -1334
                  fsqrt.s      fa6, fa5, rmm
                  srl          s4, a6, t6
                  sra          t5, s6, s7
                  addi         t3, a2, -1960
                  fmv.x.w      tp, fs0
                  fsgnjx.s     fs3, fa4, ft7
                  fclass.s     gp, fs4
                  sll          sp, s8, s0
                  mulhsu       t5, gp, a6
                  mul          a0, ra, gp
                  flt.s        s4, fa1, fs11
                  sltiu        s9, a0, 2011
                  fcvt.s.w     ft5, a7
                  lui          a1, 541448
                  fmv.w.x      fs4, t3
                  sll          s4, a1, tp
                  rem          t2, a0, a4
                  mulhsu       s11, sp, t5
                  fmv.w.x      fa0, s9
                  divu         a2, zero, s8
                  sltiu        s11, a4, -536
                  rem          a6, s7, a2
                  fmax.s       fs2, fs9, ft4
                  addi         gp, a2, 984
                  nop
                  lui          s5, 738340
                  fclass.s     t4, ft1
                  addi         a2, s2, 1655
                  feq.s        s2, fa5, fa0
                  sltu         t1, gp, t6
                  mulhu        ra, a2, s6
                  add          sp, a5, a2
                  slti         s0, t5, 1938
                  slt          s4, a3, a7
                  mulhu        t3, t0, a6
                  nop
                  divu         a6, a3, a7
                  lui          t4, 815244
                  remu         a4, a3, s11
                  mulhsu       s11, tp, a3
                  sltiu        s10, t5, -400
                  srli         s8, a2, 29
                  and          t4, t4, t2
                  xor          s11, t2, s8
                  and          s8, t0, a7
                  rem          s11, a7, t2
                  sub          t1, s6, s4
                  fcvt.s.w     fa4, s9
                  fdiv.s       ft5, fs6, ft4, rdn
                  fsgnj.s      ft4, fa6, ft1
                  fcvt.w.s     t1, fs7, rup
                  mulh         t1, t5, a4
                  rem          s4, s0, t2
                  fsub.s       ft9, fs6, ft5
                  mulhsu       t6, a6, a5
                  sub          a1, sp, t2
                  fmv.x.w      a4, fa5
                  srai         t2, a6, 9
                  slti         a0, t1, -1996
                  fcvt.s.wu    fs3, a2
                  slti         s2, a1, -1013
                  fsgnjn.s     ft11, fs8, fa2
                  fmv.x.w      t6, ft3
                  fdiv.s       ft5, fa5, fs1, rup
                  divu         s8, s7, a1
                  fmul.s       fa7, fa6, ft7, rtz
                  remu         s4, a5, ra
                  andi         ra, ra, -314
                  fmv.x.w      t4, fs9
                  xor          a4, gp, t6
                  slt          t0, s4, s4
                  sll          a0, t1, s8
                  slti         tp, t2, -1121
                  add          a6, t2, a7
                  sltu         s9, t2, a5
                  fclass.s     s1, ft0
                  add          a6, tp, a3
                  fcvt.wu.s    a6, fs6, rtz
                  auipc        t6, 717368
                  fsgnjx.s     fs0, ft9, ft4
                  auipc        tp, 265255
                  sra          s3, s2, s2
                  fcvt.w.s     a6, fs2, rup
                  fmax.s       fa1, ft7, fs1
                  xor          t6, gp, s3
                  or           s2, a0, s0
                  fmul.s       fa7, ft8, ft4, rmm
                  mulhsu       s4, s4, s1
                  add          s2, t0, t1
                  sltiu        s8, s5, 1360
                  srli         t6, t0, 23
                  srl          a3, t2, a2
                  mulhu        s2, s1, s7
                  srl          a2, s0, s9
                  divu         s1, ra, s0
                  flt.s        t6, fs2, ft2
                  slli         ra, a6, 22
                  fmin.s       fs2, fs7, fs6
                  fle.s        a3, fs2, fs10
                  rem          s8, s11, s5
                  ori          zero, a7, 111
                  mulhsu       a2, a1, s8
                  fsgnjn.s     ft8, fs0, fs4
                  fmin.s       ft10, ft2, fa0
                  mulh         s11, t3, a3
                  mulhsu       a5, a6, s2
                  sll          a4, s7, s2
                  rem          s4, a7, a2
                  fmv.w.x      fs8, t5
                  slti         a5, a5, 743
                  slti         t5, ra, -1507
                  feq.s        s3, fa1, ft9
                  fclass.s     a2, fa1
                  fsgnjn.s     ft5, ft2, ft3
                  fcvt.s.w     ft10, tp
                  feq.s        s10, fs6, fa5
                  andi         s5, s2, -717
                  nop
                  fcvt.s.w     ft1, a2, rtz
                  fcvt.wu.s    t5, ft6
                  and          zero, a3, s4
                  and          t3, a1, t1
                  slti         s10, s6, 745
                  mulhu        t3, t3, s9
                  mulhsu       t4, t4, s9
                  slti         zero, s9, 208
                  feq.s        a2, ft6, fa7
                  rem          t0, s5, sp
                  fsgnjn.s     fs3, ft9, fs1
                  slti         a4, s7, 624
                  flt.s        gp, ft6, fa3
                  fsgnj.s      ft10, ft10, ft7
                  fclass.s     t1, fs5
                  srai         s9, t3, 16
                  or           s9, a5, s3
                  fcvt.w.s     a1, fa4, rne
                  feq.s        s3, fs0, fs8
                  fle.s        s4, ft3, fs4
                  slli         s8, s4, 5
                  mulh         s0, s9, s3
                  rem          a6, s0, a4
                  fcvt.wu.s    s9, fs6, rmm
                  sub          a5, s6, t5
                  fmin.s       fs9, fs7, fa3
                  fcvt.wu.s    s0, fa3, rtz
                  fsgnjx.s     fa2, ft6, fs9
                  fsgnjn.s     fa6, fa4, fa5
                  fclass.s     s3, fs9
                  mul          tp, a3, s1
                  fdiv.s       fs10, fa3, fs5, rne
                  fdiv.s       fa4, ft8, fs7
                  feq.s        s3, fa1, fs7
                  or           s11, t4, s11
                  sub          s0, s11, zero
                  sll          a5, s7, t0
                  fsqrt.s      fs1, ft10
                  fclass.s     s9, fa5
                  sltu         s1, s6, s10
                  fmv.w.x      fa2, t4
                  fmul.s       fs7, fa4, fa5
                  mul          s11, a4, s1
                  fsgnjn.s     fs9, fs1, fs4
                  fmax.s       ft1, fs6, fs10
                  xori         s9, zero, -1454
                  fle.s        t2, fs8, ft10
                  rem          s0, s1, a4
                  andi         gp, s5, -1844
                  xor          t0, s8, t5
                  mul          t3, a5, a0
                  fmin.s       ft9, fs0, fs7
                  fsqrt.s      fa6, fa5, rtz
                  fmv.w.x      fs8, tp
                  fcvt.w.s     s1, fa6
                  nop
                  sll          s10, sp, s2
                  fcvt.s.wu    fa4, t5
                  fsgnjx.s     ft8, fs8, fs3
                  sub          a4, a3, gp
                  mulhsu       a4, t3, t5
                  fmv.w.x      fa1, gp
                  xor          a4, a2, s9
                  sra          sp, a1, t0
                  fmul.s       ft11, ft3, fa5, rne
                  fmax.s       fs3, ft1, fs1
                  srl          s4, zero, gp
                  xori         t4, t0, 562
                  divu         t5, a3, ra
                  fmv.x.w      zero, fs10
                  xori         s4, s3, 869
                  ori          a2, s4, -377
                  fcvt.wu.s    t4, fs3
                  fmv.x.w      tp, fs0
                  fsgnjx.s     fs7, fs10, fs11
                  fmv.x.w      t5, ft9
                  fcvt.s.w     fa7, ra
                  flt.s        zero, fa7, fa0
                  mul          a4, s3, t3
                  addi         tp, a3, 1173
                  feq.s        tp, ft11, fs10
                  andi         s1, t5, 51
                  fcvt.s.w     ft8, t5, rtz
                  rem          t2, s0, t3
                  and          a4, a1, s6
                  fsub.s       ft3, ft1, fa2
                  xor          a0, zero, s11
                  feq.s        t6, fs1, fa2
                  slt          t0, a1, s8
                  xori         t0, s5, -70
                  fmax.s       fs0, fs8, ft9
                  fsub.s       fa7, fa3, fs5
                  mulhu        s3, s1, a1
                  slli         a2, t1, 27
                  sltu         tp, s7, t0
                  fcvt.w.s     t2, fs9
                  div          tp, t4, a1
                  mulhsu       s9, a0, s11
                  slli         a2, t2, 15
                  fsqrt.s      ft1, fs6
                  mul          ra, zero, sp
                  fsgnj.s      ft1, ft4, fs3
                  fdiv.s       fs2, ft6, fa7
                  mul          s8, t0, s0
                  fadd.s       fa5, fs10, fs11, rmm
                  andi         s11, a5, 1797
                  and          gp, a3, gp
                  fcvt.w.s     t4, fs10
                  xor          t4, s5, a6
                  div          s4, a3, t5
                  mulhu        t0, s7, s2
                  add          s1, ra, t5
                  fsqrt.s      fa3, ft10
                  add          t3, s0, t4
                  fmin.s       fs7, fa4, ft0
                  or           t2, s5, a6
                  mulhsu       t5, t0, s9
                  addi         t6, t2, -564
                  srli         a4, t5, 7
                  div          sp, s3, t6
                  xor          a5, t4, t6
                  srli         a0, s7, 12
                  fle.s        s4, fa4, fa6
                  feq.s        s1, ft3, fs0
                  mulh         s3, t1, s3
                  xor          zero, a6, s2
                  mulhu        a4, zero, tp
                  fsgnjx.s     fs8, fs7, fs3
                  fdiv.s       fs1, fs4, ft7
                  fmax.s       ft11, ft8, ft3
                  fsgnjx.s     fs0, fa3, fa3
                  xori         tp, ra, -501
                  srai         t0, a3, 19
                  mulh         s4, s5, s11
                  fmin.s       fa1, ft5, fa4
                  fadd.s       fs8, fs9, fs5
                  fmul.s       fa0, ft1, fs3, rne
                  fclass.s     a0, ft9
                  or           t4, s2, t4
                  nop
                  srli         s0, a3, 9
                  fcvt.wu.s    s1, fs10, rtz
                  or           s8, t2, a0
                  fmv.x.w      s11, fs3
                  fmv.x.w      t5, ft0
                  andi         t1, t4, 931
                  and          s0, s10, a5
                  srai         s11, s6, 29
                  srli         s11, zero, 2
                  rem          t0, tp, s11
                  fsub.s       fs6, fa0, fs10
                  fmv.w.x      ft6, a4
                  fmax.s       fs7, fs4, ft3
                  sltiu        s5, s9, -1722
                  sltiu        tp, s10, -970
                  rem          t6, s11, s1
                  feq.s        t3, fs3, fs3
                  fmax.s       fa2, fa1, fs8
                  fmax.s       fa3, ft1, ft11
                  srl          gp, zero, a5
                  fdiv.s       fs8, fs8, ft2, rne
                  xor          s8, a0, t6
                  fmax.s       ft11, fs8, fa6
                  mulhu        ra, tp, t6
                  andi         s10, a2, 79
                  fmv.x.w      ra, fs6
                  fmv.x.w      s8, ft9
                  fcvt.s.w     fs1, t6, rdn
                  flt.s        t0, ft8, fa3
                  lui          s2, 750525
                  sub          s10, s11, a0
                  xori         gp, s11, 325
                  fmax.s       ft7, fs4, fa0
                  fcvt.s.w     fa5, s7, rup
                  fsgnjn.s     fs8, fs8, fs6
                  fmax.s       fs9, fa2, fa0
                  sltiu        s5, a2, -1414
                  mulhu        s3, a1, s7
                  sll          s8, a6, a5
                  mulh         t6, a3, s11
                  fsub.s       ft8, ft10, ft10
                  fadd.s       fs1, fs2, ft10
                  sub          a2, t2, ra
                  mul          t3, gp, a3
                  auipc        a3, 311707
                  fclass.s     s0, fs10
                  fclass.s     s4, ft11
                  fcvt.s.w     fa2, s7
                  flt.s        s3, fs5, fa4
                  mulh         a1, t5, tp
                  fmv.x.w      t0, fs7
                  rem          a2, a7, a2
                  fcvt.s.wu    fs2, ra, rtz
                  mul          s0, s11, s10
                  slti         t1, ra, -901
                  fmin.s       ft10, ft0, fa7
                  feq.s        sp, fs8, ft11
                  remu         s1, t2, a4
                  fcvt.w.s     t2, fa6
                  sub          s2, t2, zero
                  fsgnjx.s     fa7, fa6, fs7
                  nop
                  fclass.s     zero, fa3
                  and          s3, ra, t0
                  fmul.s       ft10, fs5, fs0, rup
                  lui          a5, 801597
                  auipc        t3, 679061
                  sra          s10, a4, t3
                  fmax.s       fs3, ft11, ft8
                  fmv.x.w      t5, ft7
                  fcvt.w.s     t5, fa6
                  rem          t3, a2, a0
                  mul          sp, s9, a2
                  ori          a0, s6, 1214
                  sub          t2, s0, sp
                  mul          zero, s0, t3
                  remu         a4, s7, s2
                  flt.s        a0, fa5, fs9
                  and          a3, a1, s1
                  fadd.s       ft7, fs8, ft11
                  fdiv.s       ft10, fa0, fs11
                  and          s0, s1, s2
                  fcvt.w.s     t4, ft3, rup
                  fmul.s       ft8, fa2, fs0, rne
                  slt          s5, t6, t3
                  fmv.x.w      t3, fs5
                  lui          s2, 794644
                  fsub.s       fa6, fs0, fa0, rne
                  auipc        a0, 694701
                  fsgnjx.s     ft10, fs8, fa1
                  fsqrt.s      fa4, fs4, rne
                  fdiv.s       fa0, fs8, fs11
                  sltiu        s9, ra, 1734
                  fmv.x.w      a3, fs0
                  fmin.s       ft5, ft9, fs11
                  auipc        a1, 274884
                  auipc        s2, 525654
                  xori         t3, s1, -1848
                  slti         t1, t0, -1076
                  fmul.s       fs9, fs3, ft3
                  mulh         t0, s1, s4
                  sub          s2, t5, a4
                  lui          s2, 248637
                  fsgnjx.s     fs2, ft5, ft11
                  srl          s4, s1, a0
                  add          s3, s11, s7
                  xor          t1, t4, s10
                  fcvt.wu.s    s4, fa6
                  andi         a0, t1, -1292
                  fmul.s       fs2, fs10, ft0
                  sub          a0, t4, a1
                  flt.s        gp, ft9, ft6
                  fmul.s       ft1, fs10, fs3
                  fcvt.s.wu    ft1, t0
                  andi         a5, t0, 483
                  fsqrt.s      fs10, fa5, rup
                  flt.s        tp, fs10, fa0
                  sll          t6, s3, s5
                  div          s9, a5, s1
                  fle.s        a5, ft5, fs1
                  sub          s8, s7, gp
                  fcvt.s.wu    fs5, sp
                  xori         a0, t0, 1695
                  rem          t6, t4, s7
                  xor          t1, a0, s7
                  mulhsu       t5, s4, s8
                  srl          zero, t1, s4
                  fsqrt.s      ft5, ft10, rdn
                  fmax.s       fa7, fs1, fa4
                  remu         t5, a0, zero
                  and          s10, a6, s10
                  mul          a5, t0, a2
                  fcvt.wu.s    a6, fa6, rne
                  divu         a0, sp, t0
                  fadd.s       fa1, fa6, fs6
                  sltiu        s4, a7, -290
                  div          a3, a2, s2
                  xor          zero, s5, s0
                  xori         a4, a0, -1772
                  fsqrt.s      ft4, fa4, rup
                  fcvt.s.wu    fa0, gp
                  div          t3, t3, s5
                  slti         a0, zero, -916
                  fmv.x.w      s5, ft11
                  fsub.s       fs10, fs4, fs1
                  fmin.s       fa0, ft2, fs11
                  fdiv.s       ft8, ft8, fa5
                  divu         zero, s4, t0
                  mulhu        a4, a4, t1
                  slt          t0, s2, t2
                  slti         t5, a2, 1715
                  lui          s0, 680179
                  mul          s2, s0, t6
                  fmax.s       fs4, fs4, fs10
                  srl          s8, t5, s7
                  xor          s4, a2, s9
                  fle.s        gp, fs5, ft11
                  fclass.s     t1, ft3
                  mulh         s1, s2, sp
                  fdiv.s       ft8, fs2, fa7
                  divu         a5, s1, a4
                  ori          a6, a2, -1817
                  xor          s0, a3, s0
                  xor          a2, a1, ra
                  srli         s4, s4, 29
                  divu         tp, s1, s2
                  fmin.s       fs3, fa5, fs4
                  fadd.s       ft8, ft7, fs1
                  fmv.x.w      s11, ft11
                  fsgnj.s      ft10, fa4, ft1
                  feq.s        a5, ft5, fs5
                  slli         s8, a3, 24
                  mulhsu       sp, s6, sp
                  div          t6, a7, s8
                  fmv.w.x      fa0, t2
                  fcvt.wu.s    s1, fa1, rtz
                  fmul.s       fs9, ft7, fs11, rne
                  fmv.x.w      a5, fa4
                  fcvt.wu.s    s8, fs10
                  fmax.s       fs4, fs10, fs2
                  fmul.s       ft2, ft11, ft7, rmm
                  sll          s2, a5, s11
                  fmul.s       ft10, fs7, fa3, rmm
                  fdiv.s       fa6, ft8, fa7, rup
                  mul          s9, s6, gp
                  srl          a5, s4, a7
                  fdiv.s       fa2, fa7, fs9, rne
                  sra          ra, s3, a3
                  fmv.w.x      fs5, gp
                  srl          a2, s4, s1
                  fadd.s       fs4, ft10, fa5, rup
                  flt.s        sp, ft3, ft1
                  mulh         s8, s6, zero
                  fmv.w.x      fa4, a2
                  fmul.s       ft9, fa0, ft2, rmm
                  remu         tp, s3, a6
                  fmax.s       fs5, fs10, ft9
                  ori          s2, a7, -1532
                  fmin.s       ft8, fs4, ft4
                  lui          s8, 627351
                  andi         s9, a7, 231
                  slt          sp, t1, sp
                  and          gp, t4, t2
                  fmax.s       ft2, ft6, fa1
                  mulhu        s8, s2, a2
                  mulh         s11, a7, t4
                  mulhu        s4, s1, s6
                  fsub.s       fs2, fs2, ft2
                  fsqrt.s      fa2, ft5
                  srai         t3, s6, 14
                  sltiu        s9, t2, 751
                  andi         a3, a1, 1724
                  fdiv.s       fs1, ft1, ft8
                  mul          t5, s0, a4
                  fmv.x.w      s8, ft2
                  sll          t3, a1, s0
                  fdiv.s       fa1, fs1, ft3, rup
                  fdiv.s       fa7, ft0, ft9
                  ori          s2, zero, -987
                  remu         zero, s4, t5
                  rem          zero, t1, ra
                  fle.s        t3, ft9, ft4
                  fmin.s       ft2, ft8, fs8
                  fclass.s     s5, fs1
                  sll          ra, t3, t2
                  mulhsu       s1, a3, sp
                  div          a2, s9, a1
                  fclass.s     a0, fs9
                  fmv.w.x      fa3, t5
                  fsqrt.s      fs6, ft3
                  fclass.s     s4, fs5
                  xori         tp, a3, -1958
                  fmin.s       ft9, fs5, ft1
                  sub          a6, t3, s2
                  xori         gp, sp, -199
                  fdiv.s       ft6, fs8, ft0, rtz
                  fsgnjx.s     fs1, ft0, fs4
                  fdiv.s       ft5, fs2, fs2
                  div          t5, s4, tp
                  slti         a3, t6, 246
                  divu         t3, t2, s7
                  fmv.x.w      t3, ft5
                  and          s9, s9, t6
                  addi         a2, a2, 1760
                  srl          s10, a0, a1
                  or           a4, s8, a6
                  xori         t1, a3, 832
                  slti         s1, zero, -87
                  slli         s1, a5, 4
                  fsgnjn.s     ft4, fs8, fa3
                  fsqrt.s      ft8, fs2
                  fadd.s       ft5, fs7, fs0, rne
                  fcvt.wu.s    t2, fs0, rtz
                  andi         s10, s9, -465
                  sltiu        s2, t0, 1305
                  fdiv.s       fs6, fa0, ft9, rdn
                  auipc        a4, 585894
                  fcvt.s.wu    fa4, t1
                  sra          s10, s2, a5
                  fsgnj.s      ft5, fa0, fa1
                  fsgnjn.s     ft11, fs8, ft3
                  add          a3, t5, a0
                  remu         sp, s1, s10
                  lui          a5, 1038374
                  fadd.s       fs10, ft0, ft1
                  fsqrt.s      fs3, fa1
                  fsgnjn.s     ft9, fs8, fs9
                  slt          s11, gp, s7
                  fcvt.s.w     ft2, tp, rdn
                  fsub.s       fs4, ft7, fs10, rdn
                  lui          gp, 107188
                  sltiu        a1, a4, 1709
                  fcvt.w.s     a5, ft5
                  fsgnjx.s     ft0, ft6, fs7
                  andi         ra, s8, -1975
                  mul          a5, zero, a7
                  srl          t4, a5, s4
                  and          s8, sp, s3
                  sll          s8, t1, gp
                  fsub.s       ft5, fs10, fs1
                  srli         ra, a3, 7
                  fmul.s       fa2, fa4, fa0, rup
                  slt          t5, s4, s11
                  xor          t1, gp, gp
                  rem          a0, a4, s5
                  add          s4, s2, ra
                  fsgnjx.s     fa7, fs3, ft4
                  div          s11, s7, zero
                  sub          a4, tp, gp
                  sltiu        s10, s10, -842
                  feq.s        sp, fs9, ft10
                  lui          s5, 512513
                  auipc        s4, 320236
                  slli         a2, zero, 28
                  xor          sp, s5, a4
                  div          s8, s2, t4
                  sra          a4, s2, s2
                  mul          s9, a3, t6
                  mulhu        a6, a7, s5
                  slti         s5, a4, 282
                  fsqrt.s      ft1, ft1
                  srai         sp, a7, 5
                  slli         a0, s4, 23
                  srli         a4, a6, 2
                  fsqrt.s      fs7, fs6, rdn
                  fmin.s       fa3, ft3, fs9
                  feq.s        s5, fs1, ft1
                  sltu         s3, a0, t4
                  fcvt.s.w     fs4, t6
                  srai         t6, s11, 12
                  fcvt.s.w     fs6, a1, rdn
                  fmax.s       ft1, ft10, fa6
                  fcvt.s.w     ft1, t4
                  fmv.w.x      ft11, s11
                  mulh         a0, t0, tp
                  sub          ra, a6, s4
                  sra          s10, sp, zero
                  fmv.w.x      ft9, s3
                  fmv.w.x      ft2, t6
                  feq.s        a5, ft6, ft0
                  xor          tp, s5, t2
                  auipc        gp, 134282
                  srai         a1, t2, 24
                  lui          a6, 463248
                  sra          zero, s10, t0
                  srl          t5, s9, s7
                  andi         s2, a2, -579
                  fsgnjx.s     fs8, fa4, fa1
                  srl          t1, s8, s1
                  feq.s        t4, ft0, ft7
                  sll          t6, zero, a1
                  srai         t2, t0, 8
                  feq.s        t2, fs11, ft7
                  divu         t1, gp, s3
                  rem          sp, tp, s10
                  ori          ra, a0, 1691
                  fsgnjn.s     ft9, fs4, ft4
                  addi         t0, t0, -1145
                  sub          s8, ra, s10
                  fsub.s       ft11, fs11, ft1
                  fadd.s       fs3, fa0, fs10, rdn
                  srli         s5, a6, 19
                  fmv.x.w      ra, ft3
                  fcvt.wu.s    a2, fa1, rmm
                  fmv.x.w      s11, ft9
                  fclass.s     t0, fs11
                  fsqrt.s      fa4, fa7, rtz
                  fsgnjn.s     fs0, ft2, ft3
                  sll          t4, s8, zero
                  fcvt.w.s     a2, ft2
                  auipc        t4, 228994
                  andi         ra, a4, -1611
                  slti         a2, s11, 1743
                  lui          tp, 151054
                  mulhsu       s9, s11, gp
                  remu         s0, s4, a1
                  fcvt.w.s     gp, ft6
                  sra          a1, s10, s6
                  fsub.s       fa5, fa0, fa2
                  and          a3, t3, t0
                  fmin.s       ft10, fs1, fa0
                  fle.s        sp, ft6, fa1
                  fdiv.s       ft10, fa4, fa0, rup
                  fmul.s       ft9, fs11, ft3
                  div          t6, a0, t6
                  feq.s        a1, ft8, fa3
                  fsub.s       fa0, fs11, fa3
                  or           a6, sp, s4
                  mulh         s11, s1, a2
                  fmv.x.w      s11, fs0
                  mulhsu       zero, s7, s3
                  srl          s4, t0, s7
                  slli         a5, zero, 24
                  addi         a5, zero, 1359
                  flt.s        t6, fa4, fa1
                  slti         zero, t1, -1751
                  fsub.s       fs8, fa6, fs10, rdn
                  fcvt.wu.s    t3, fs6, rup
                  fsqrt.s      fa0, fa3, rmm
                  lui          s1, 207879
                  fadd.s       fs5, fa6, fa1
                  xori         gp, t2, -725
                  fmax.s       ft11, fs9, ft2
                  slli         a0, t3, 18
                  nop
                  mulhsu       s1, a2, gp
                  fdiv.s       ft3, fa3, fa5, rne
                  nop
                  sll          s2, t4, a3
                  and          s4, tp, sp
                  slli         s11, tp, 0
                  mulhsu       t6, a3, t5
                  sltiu        t6, a4, 1553
                  srai         s2, s6, 7
                  sltiu        t4, t2, 959
                  fadd.s       fa2, ft8, fs8
                  srli         s4, a3, 25
                  fmv.x.w      a1, fa4
                  slti         a1, gp, -1396
                  mulhsu       sp, s4, a0
                  xori         gp, s3, 1079
                  feq.s        s5, ft1, ft6
                  add          s5, t1, s2
                  divu         s11, a1, a5
                  fdiv.s       fs6, ft4, ft10, rmm
                  sltu         t2, s11, a2
                  fmv.x.w      a4, fs9
                  fadd.s       fs1, ft9, ft2
                  srli         a4, t1, 0
                  fcvt.s.wu    fs8, s9
                  xori         tp, s1, -1242
                  flt.s        s10, ft6, fa6
                  fmv.w.x      fs2, s4
                  fsqrt.s      fa1, fs8, rtz
                  ori          a2, t3, -1570
                  fadd.s       fs11, ft7, fa0, rup
                  srli         t1, ra, 18
                  auipc        a2, 68560
                  fcvt.wu.s    t1, ft9
                  fsqrt.s      fs7, ft2
                  feq.s        s1, fs3, ft11
                  fmv.w.x      fs9, s2
                  nop
                  andi         a5, a3, -1676
                  fcvt.s.wu    fs8, t1
                  addi         t2, s4, 1447
                  addi         a2, s11, -1463
                  slt          a5, s10, s9
                  fcvt.w.s     t0, fa7, rne
                  fcvt.s.w     ft0, a0, rup
                  fmax.s       fs11, fs10, fs2
                  fmul.s       fs2, fs9, fa2, rtz
                  fmul.s       ft10, fa7, ft4, rdn
                  nop
                  nop
                  mulhsu       t3, a4, a1
                  sltiu        gp, s2, 31
                  andi         gp, s7, 145
                  mulhu        t1, s0, s8
                  fsgnjx.s     fa1, fs0, fs8
                  slti         sp, t4, -1538
                  fsqrt.s      fa5, fa7, rtz
                  fsgnjn.s     fs4, fs3, ft6
                  fsgnj.s      ft6, ft8, fs9
                  rem          t1, a0, s11
                  xor          t2, a3, s0
                  fsgnj.s      ft7, fa2, fa7
                  add          s2, a5, s7
                  and          ra, tp, zero
                  srai         tp, a0, 1
                  slt          tp, a5, s10
                  srai         s5, sp, 16
                  sra          a3, s4, s10
                  ori          zero, a3, 283
                  remu         s8, t2, a6
                  flt.s        t0, fs2, fs4
                  srli         a2, s1, 14
                  fmax.s       fs3, ft1, fs8
                  remu         s8, a2, s11
                  sra          zero, a1, s9
                  fsgnjn.s     fa7, fs4, fs9
                  mulhsu       zero, a6, t3
                  xori         s0, s0, 1883
                  fcvt.w.s     a6, fs8
                  feq.s        s2, fs0, fs11
                  fmul.s       ft8, ft10, fs9
                  sll          s4, t6, t4
                  fcvt.s.w     fa4, t6
                  fsgnjn.s     ft4, ft8, ft2
                  fmul.s       fa4, fs3, ft1, rmm
                  slli         s0, a7, 29
                  fadd.s       fa7, fa1, ft2, rtz
                  mulhsu       ra, a6, gp
                  fsgnjn.s     ft5, fa0, fs7
                  lui          a4, 273887
                  fcvt.s.wu    fa2, a5
                  fadd.s       fs1, ft11, ft0
                  mulhsu       gp, t6, a4
                  sltu         t3, t1, a3
                  fcvt.s.wu    fs0, s2
                  fsgnjn.s     fa4, ft7, fa3
                  fclass.s     t0, ft5
                  slt          a3, t1, s1
                  fsqrt.s      fs7, ft11, rdn
                  divu         a4, a6, s4
                  and          s0, s9, t2
                  fmv.x.w      a5, fa2
                  lui          t2, 370368
                  fcvt.s.wu    fs9, t1
                  and          t4, s0, zero
                  sub          t1, tp, t2
                  fdiv.s       fa7, ft1, ft8, rdn
                  fadd.s       ft11, ft2, fa2, rmm
                  fmv.x.w      s8, fs10
                  or           ra, a6, t0
                  add          s2, ra, t1
                  fcvt.wu.s    a1, ft3
                  fsub.s       fs6, fs6, fa5
                  flt.s        s0, fs11, fs9
                  andi         s9, s3, -1474
                  mul          t2, t6, tp
                  slt          s10, s2, s7
                  sra          zero, t3, s6
                  xor          s2, t4, t4
                  fcvt.s.wu    fs7, a1, rup
                  remu         a6, t2, zero
                  fsub.s       ft7, fs11, fs11, rne
                  fsub.s       fs4, fa4, fa5, rdn
                  xor          sp, a2, t2
                  slt          t3, a4, tp
                  fmin.s       fs8, ft6, fs10
                  fmax.s       fa4, fs7, fs9
                  mulh         a2, a7, a7
                  mulhu        a1, t1, a0
                  divu         zero, s7, s8
                  sltiu        s0, a7, -403
                  ori          a5, zero, 498
                  fmax.s       fs2, fs6, ft7
                  fsgnj.s      ft9, ft3, fa0
                  flt.s        a1, fa4, fs9
                  or           s2, a0, s1
                  ori          s10, a3, -698
                  srli         s3, t4, 9
                  fmin.s       ft10, ft2, ft5
                  mulhu        zero, ra, s6
                  feq.s        a5, ft4, fa6
                  ori          s3, a5, 1923
                  fcvt.w.s     t6, ft6
                  nop
                  fcvt.s.wu    fs5, a7, rdn
                  lui          s5, 630703
                  feq.s        a6, fa6, fa5
                  mulh         s10, s4, t6
                  fdiv.s       fs0, fa0, fs0
                  mulhsu       a2, s5, a3
                  fmv.w.x      ft1, s11
                  sra          gp, a7, s7
                  fdiv.s       fs6, fs9, fs3
                  fcvt.w.s     ra, fs3, rup
                  lui          s1, 809359
                  fsub.s       fs7, fs1, fs11
                  andi         t6, gp, -435
                  fmv.x.w      s4, fa7
                  div          gp, s2, t5
                  ori          t3, t6, 1384
                  fsgnj.s      fs2, ft3, fa6
                  andi         t5, t1, -933
                  fsub.s       fs0, ft3, ft6, rdn
                  addi         a4, t0, -266
                  fsqrt.s      fa2, fs0
                  srai         t0, a3, 5
                  srli         a5, s1, 0
                  slli         tp, s4, 13
                  sub          a4, t0, gp
                  and          s2, s9, a5
                  slli         a4, s3, 11
                  mul          a5, s0, s0
                  div          zero, a4, a3
                  rem          t5, t0, a5
                  rem          s8, ra, s4
                  slt          s10, tp, a7
                  sltiu        s2, a4, 1588
                  sub          a4, s8, s7
                  sltiu        t0, t3, 335
                  fmv.x.w      t6, fa1
                  and          s0, t1, a5
                  fsub.s       fs5, fa4, fa1
                  fmv.x.w      sp, fa6
                  add          s11, t2, t6
                  sra          a5, s10, a3
                  slt          t2, t2, a5
                  flt.s        a0, fs11, ft0
                  fclass.s     t0, ft10
                  fcvt.s.wu    ft0, s11
                  fsqrt.s      fa0, fa1
                  fsgnjn.s     fs0, fs11, fs10
                  remu         t6, s9, s10
                  slt          s11, t2, ra
                  slt          t3, t1, s5
                  ori          t6, t5, 129
                  add          a2, t3, a6
                  fle.s        t2, ft6, fs2
                  divu         t4, tp, tp
                  auipc        s8, 565567
                  fclass.s     s9, ft11
                  nop
                  feq.s        a3, ft11, fa5
                  fcvt.s.w     ft3, zero, rne
                  xori         t6, s10, -1935
                  fcvt.s.wu    fa1, t4, rtz
                  mulhu        t2, s2, t3
                  fsub.s       fs9, ft9, fa0
                  mulh         a6, a3, a5
                  and          a0, tp, s10
                  addi         s2, s8, 1432
                  add          sp, gp, t6
                  fsgnjn.s     fa5, fs2, ft11
                  auipc        t4, 714535
                  mulhu        s9, ra, zero
                  fsqrt.s      fs8, fs2
                  fcvt.s.wu    fa7, tp
                  fsgnjx.s     fs11, ft1, fa6
                  sub          s5, ra, s9
                  fmul.s       fa6, ft2, ft6
                  feq.s        t0, fa6, fs2
                  flt.s        s5, fa2, ft6
                  fmin.s       fs10, ft4, ft3
                  and          t1, t2, s11
                  flt.s        s4, ft6, fa6
                  fmv.x.w      s5, fs11
                  fsgnj.s      fa5, fa3, fa5
                  ori          ra, a0, -1885
                  fsgnjx.s     ft10, fa1, fs9
                  remu         t6, s5, s5
                  sll          s4, s7, a0
                  sll          a2, sp, s1
                  slti         a5, t4, 1407
                  fsqrt.s      fs11, ft11, rtz
                  sltiu        a1, s3, -217
                  fmv.x.w      s2, ft10
                  auipc        a1, 678949
                  srai         s1, a7, 29
                  addi         a3, a7, -776
                  addi         a3, a0, 1235
                  fmv.w.x      ft11, s11
                  and          t5, t1, a2
                  or           a3, s3, a7
                  div          s0, s4, s5
                  fsqrt.s      ft6, fs1, rdn
                  and          a5, s2, a6
                  andi         a4, a1, 426
                  fcvt.w.s     t6, fs6
                  srli         sp, a7, 29
                  nop
                  addi         sp, s1, 1318
                  fsgnjx.s     fa2, fs7, ft7
                  remu         t2, s3, zero
                  sltu         t3, t5, t4
                  divu         sp, s7, a2
                  rem          a2, s11, t4
                  srli         a6, sp, 21
                  sll          s4, a6, t1
                  xor          s1, s5, t0
                  srli         a5, s8, 11
                  ori          tp, t5, -871
                  fdiv.s       fs2, fa1, ft2, rmm
                  fcvt.s.wu    ft6, s2, rdn
                  sltiu        a4, s10, 1963
                  fmv.w.x      fs9, t5
                  sra          sp, a6, t5
                  sltu         ra, t2, s4
                  srai         t6, s6, 9
                  fle.s        a3, fs6, ft2
                  fmv.x.w      s10, fs6
                  fsgnjx.s     fs4, fa4, ft2
                  fle.s        t6, ft6, fs8
                  slt          s3, a3, s9
                  div          t3, gp, a4
                  slti         t0, t0, 481
                  fmin.s       ft1, fs11, fs4
                  add          t5, t4, a3
                  mulhsu       a6, s1, s10
                  srli         a2, a0, 9
                  slt          s8, a3, t0
                  fmv.x.w      t1, fs0
                  div          a6, s2, s1
                  auipc        a4, 194307
                  xori         s5, s3, -1856
                  sll          a4, a2, a4
                  add          a3, s9, zero
                  sll          s11, a1, s10
                  fmul.s       fa2, fa6, fs9, rmm
                  fcvt.wu.s    t6, fs4, rtz
                  addi         t2, zero, -348
                  rem          zero, s0, s5
                  lui          s4, 344733
                  rem          s2, s1, a2
                  fle.s        t2, fs10, ft6
                  xor          zero, t2, a5
                  xor          a4, a4, s8
                  xor          a2, s6, zero
                  fsgnj.s      ft0, fa0, ft4
                  fsub.s       fa0, ft9, fs7, rtz
                  fmul.s       ft1, fa1, ft9
                  and          t0, t0, s3
                  div          a1, a1, a6
                  or           ra, a0, a4
                  fmax.s       ft1, ft11, fs5
                  fle.s        tp, ft2, fs11
                  srl          s0, t3, sp
                  andi         s1, t4, 688
                  xor          s2, a1, s0
                  sub          zero, t6, a0
                  mulh         tp, t6, s1
                  or           s5, a5, gp
                  fmin.s       fa3, fs5, fs11
                  mulhsu       a1, sp, a4
                  fsqrt.s      fa3, fs11
                  slt          t3, t2, a7
                  xori         t1, t4, 2037
                  sltiu        s4, t1, 993
                  sll          a2, t0, t6
                  fdiv.s       fs4, fs0, ft6, rtz
                  sub          a1, tp, t2
                  mulhsu       a3, s4, s9
                  slti         t4, a7, -1234
                  or           s4, t6, a7
                  slt          a5, zero, t1
                  slti         s9, sp, -1727
                  auipc        t1, 91962
                  fsub.s       ft9, fa7, fa1, rmm
                  divu         s9, a6, ra
                  fdiv.s       fa1, fs6, ft6, rne
                  fsgnjn.s     fs0, fa1, ft10
                  remu         s5, s1, ra
                  sra          t5, a4, a6
                  add          s9, t0, t3
                  fsgnjx.s     ft2, fs9, ft4
                  rem          a1, a0, s11
                  mulhsu       s1, sp, sp
                  sra          t5, s5, a7
                  fcvt.w.s     s8, ft2
                  fdiv.s       fa0, fs7, fa6, rdn
                  fcvt.wu.s    a0, ft0, rne
                  fcvt.s.wu    fs1, t1, rmm
                  andi         ra, t4, -2002
                  srl          s1, ra, s5
                  sll          sp, t0, a7
                  fmin.s       ft7, ft7, fs5
                  fsub.s       ft1, fs6, fa5
                  rem          sp, t1, s7
                  ori          t4, t0, -29
                  nop
                  slti         s8, t4, -29
                  fsgnj.s      fs1, fa5, fs1
                  addi         s1, t5, -1091
                  xori         s1, gp, 473
                  or           a4, a7, t1
                  sll          sp, s1, a7
                  nop
                  andi         a4, t1, -527
                  mulh         sp, tp, s2
                  fsgnjn.s     fs0, ft0, ft1
                  mulhsu       t2, t5, s6
                  xori         a4, a5, 369
                  fmv.x.w      s9, fs10
                  sltu         a6, t0, s3
                  fmin.s       fs4, ft10, fs5
                  div          a4, s3, a6
                  fadd.s       fa3, fa3, ft11
                  fcvt.s.w     fa2, s8, rtz
                  divu         a6, t6, gp
                  mulhu        t4, s10, a4
                  div          s10, a4, t5
                  sra          a5, s10, a5
                  slli         t1, gp, 19
                  fdiv.s       fs3, fs8, ft0, rdn
                  flt.s        sp, fs5, fa1
                  mul          t1, s9, tp
                  fcvt.s.w     fa7, ra
                  sra          zero, s8, s7
                  fmax.s       ft6, fs11, fa6
                  slli         a1, s4, 6
                  fmin.s       ft3, fs7, ft5
                  ori          t1, s6, 255
                  srl          t0, t5, s4
                  auipc        gp, 985302
                  add          a5, sp, zero
                  fdiv.s       fa6, fs11, ft11
                  fsub.s       fs8, ft3, ft8, rne
                  sll          s5, t6, a2
                  addi         a3, s5, 1691
                  srli         s4, t4, 3
                  fmin.s       fs0, fs11, ft2
                  and          sp, ra, a7
                  nop
                  fdiv.s       fs1, ft7, fs2, rne
                  sll          s9, s6, s11
                  fmv.x.w      a5, fs4
                  fcvt.s.w     fs2, s5
                  fcvt.s.w     fs5, s10, rup
                  fmv.w.x      fs4, s2
                  fsgnj.s      ft2, fa3, fs2
                  feq.s        s4, fs7, fs3
                  andi         a5, t3, -511
                  andi         s1, a4, 60
                  lui          sp, 451260
                  fdiv.s       fs8, fs9, fa6, rne
                  srl          sp, a3, a3
                  fsqrt.s      fa2, fa5, rne
                  fsgnjx.s     fa0, ft11, ft4
                  feq.s        a3, fs10, fs10
                  sub          s0, s7, a5
                  fsgnjn.s     fs9, fa0, ft8
                  mulhu        s11, s9, s2
                  sltu         a0, a1, s3
                  or           a0, gp, a5
                  sltu         s2, zero, ra
                  andi         t1, gp, 2027
                  fcvt.s.wu    fs2, a4
                  sra          t1, a6, a0
                  srai         s2, a4, 9
                  srai         a4, s7, 1
                  lui          s5, 703367
                  auipc        t0, 545782
                  div          a5, t6, s9
                  fsgnj.s      fs1, ft3, fs7
                  addi         s11, t0, -2033
                  fadd.s       ft10, fa2, ft6, rdn
                  addi         a2, tp, -1867
                  lui          t2, 119342
                  sll          a4, s8, a1
                  fsqrt.s      ft4, fs11
                  rem          s4, s1, t4
                  srli         a2, t0, 30
                  add          s3, a4, zero
                  feq.s        a6, fa2, fs7
                  fsub.s       fa7, fs0, fa3
                  nop
                  div          s8, a7, t2
                  or           t5, t0, t1
                  sra          a6, s10, t4
                  sra          t3, zero, a4
                  sll          ra, sp, sp
                  rem          s10, t0, s2
                  slli         s0, a0, 10
                  slti         tp, s6, -711
                  add          a6, t1, sp
                  srai         t6, s9, 2
                  fcvt.wu.s    t2, fa6, rne
                  fmv.w.x      fa0, t1
                  fmv.w.x      fa7, s1
                  fclass.s     a4, fa0
                  slti         a1, s10, -682
                  fmin.s       fs1, fa5, fa7
                  fclass.s     t0, fs4
                  fmin.s       fs2, fa4, ft1
                  nop
                  sltiu        gp, s0, -1058
                  fdiv.s       ft4, fs3, ft4
                  addi         zero, s9, -1913
                  fmv.x.w      s2, ft4
                  fsgnj.s      ft0, ft2, ft11
                  mul          t4, a6, s6
                  mulhu        s5, t1, a5
                  addi         s2, s11, 963
                  fmv.x.w      a2, fa7
                  xor          a6, zero, s3
                  sra          t1, a2, a1
                  fsgnjn.s     fs1, fa0, ft6
                  xor          s10, s9, s5
                  fadd.s       fs7, fs4, ft7, rup
                  slti         t0, a3, -1994
                  sll          s10, s1, t0
                  fclass.s     a2, ft5
                  sra          s2, s0, t2
                  fmul.s       ft4, fs10, fa4
                  lui          s8, 448079
                  fsgnjn.s     ft1, fs10, fa0
                  mulhsu       zero, a1, ra
                  mulhsu       ra, t3, a2
                  xori         a3, s1, -435
                  fsgnjn.s     ft2, ft8, fs0
                  or           s11, tp, t0
                  fcvt.w.s     s8, ft3, rmm
                  fcvt.wu.s    s0, fs2, rdn
                  remu         tp, s6, ra
                  addi         a2, s8, 138
                  fsgnjx.s     fs11, ft5, fa7
                  and          s9, s7, zero
                  slli         s4, sp, 2
                  xor          s3, a3, a2
                  fmax.s       fs2, fa4, fs6
                  fcvt.s.w     ft11, a4, rup
                  feq.s        a1, fs4, fs2
                  and          a6, tp, a2
                  slli         s2, a0, 21
                  auipc        s4, 35851
                  fmv.x.w      a6, fs5
                  mulh         t1, s6, s10
                  feq.s        t3, fa2, fs5
                  sra          s5, a7, s11
                  xor          a3, s5, a2
                  sub          s2, s3, gp
                  addi         t6, s4, 1072
                  srl          t1, a1, tp
                  srai         s3, a5, 21
                  fle.s        sp, ft7, fa7
                  fsub.s       ft6, fa5, ft6, rup
                  fmul.s       fs10, fs4, fa4
                  slt          a4, t3, s4
                  slt          t4, s7, t3
                  srl          t6, s9, gp
                  mulhu        a2, sp, a0
                  srli         t3, a6, 2
                  xor          s0, t2, a4
                  fmv.x.w      a6, ft4
                  fsgnj.s      ft8, fs7, fs3
                  rem          a3, s8, ra
                  xor          a3, sp, s6
                  nop
                  fsub.s       fs7, fs0, fa7, rne
                  sll          s1, t6, a5
                  fcvt.s.w     fa5, a2, rdn
                  fcvt.s.w     ft6, t2, rdn
                  or           s8, s4, s0
                  mulh         s8, ra, s10
                  sll          zero, a5, s7
                  nop
                  srl          s4, zero, tp
                  fsub.s       ft5, fa0, ft1, rup
                  fadd.s       ft10, ft5, ft5, rup
                  fcvt.s.w     fa1, s3
                  fle.s        t2, fa6, fs10
                  addi         a6, a1, 887
                  fsub.s       fs8, ft11, ft10
                  slli         s2, t0, 7
                  fmin.s       fs0, fs0, fs4
                  fsgnjx.s     ft9, ft9, fs10
                  slti         a6, s8, -1728
                  fdiv.s       fa6, fa2, ft5, rne
                  addi         sp, t5, -1464
                  slt          a0, a4, a4
                  remu         s2, t3, s10
                  fsgnjx.s     fa4, fa1, ft2
                  divu         a3, zero, s10
                  fmv.w.x      fa6, tp
                  fle.s        s9, ft0, fs3
                  sra          zero, s1, t1
                  fle.s        s1, fs11, ft8
                  or           sp, s5, s1
                  sll          s0, t5, s7
                  fsgnjx.s     fs9, fs4, fa7
                  div          t3, s7, s3
                  fsgnjx.s     ft10, ft6, fs11
                  divu         t3, t6, t6
                  slli         s8, ra, 25
                  fdiv.s       ft2, ft4, ft0
                  fmax.s       fa2, ft1, ft9
                  lui          s4, 594133
                  mulhu        a2, t3, a7
                  fadd.s       fs9, fa4, fs6, rmm
                  fle.s        t1, fs7, fs8
                  fcvt.w.s     zero, fs3, rne
                  fcvt.wu.s    a1, fs6
                  fmv.w.x      fa5, s8
                  xor          tp, s1, t5
                  or           t2, t3, s11
                  mulhsu       a2, a5, zero
                  slti         t6, t2, 1314
                  sltu         s0, zero, a2
                  lui          s2, 314046
                  fadd.s       fs10, ft11, ft8
                  sll          t1, ra, s4
                  slt          zero, s4, t5
                  lui          t6, 448365
                  addi         s9, s5, -694
                  flt.s        s4, ft6, fs5
                  add          s0, a0, s8
                  fmul.s       ft7, ft9, fa5, rne
                  fcvt.w.s     s0, fa5, rdn
                  ori          s10, s11, -1223
                  fclass.s     s8, fa0
                  addi         a6, t6, -739
                  fsgnj.s      fs1, fs5, fs11
                  fadd.s       ft1, ft2, fs10, rmm
                  and          t3, t1, t3
                  srai         s2, s9, 1
                  fclass.s     zero, fs7
                  xori         a6, a6, -704
                  fcvt.w.s     s10, fa4, rdn
                  xori         gp, s2, 342
                  xori         t6, a5, -704
                  fcvt.wu.s    a5, ft3, rmm
                  fcvt.w.s     s4, fs4
                  srli         s1, zero, 28
                  fcvt.s.w     fa6, a3
                  sub          s3, sp, t5
                  fsgnj.s      fs1, fa0, fs7
                  fcvt.wu.s    a1, fa5
                  srli         t0, s7, 29
                  addi         s4, s3, -1257
                  addi         t2, a4, -1939
                  slt          s2, t0, s4
                  divu         t1, a4, s10
                  rem          s2, a3, a2
                  fdiv.s       fs4, fa1, ft7, rne
                  fdiv.s       ft4, ft5, fs6
                  fdiv.s       fs8, fa7, fa5
                  flt.s        t1, fs3, fs2
                  sra          a4, t3, zero
                  nop
                  fcvt.s.w     fa1, s10
                  mulh         s1, a3, s0
                  remu         s0, s7, s2
                  xor          ra, s0, s7
                  fadd.s       fa2, fa3, ft2, rne
                  fcvt.w.s     s11, ft2
                  sll          t6, s4, a2
                  mulhsu       sp, gp, a7
                  fcvt.wu.s    a1, fa7, rmm
                  fadd.s       fs7, fs10, fs10, rup
                  nop
                  mulhu        s0, a7, a3
                  slt          t5, s3, t0
                  fsqrt.s      fs2, fa2
                  fadd.s       ft9, ft9, ft8, rne
                  addi         gp, s3, -1674
                  fdiv.s       ft4, fs9, fs10, rup
                  fcvt.w.s     s0, fa3, rdn
                  fmul.s       ft1, fa6, fa1, rup
                  fsgnj.s      fs3, ft8, fs10
                  xori         a6, s7, -1225
                  xor          s3, s0, a6
                  fsub.s       fs3, fs4, fs1
                  slli         s5, a2, 26
                  fsgnjn.s     fa7, fa3, ft3
                  rem          t1, a4, t2
                  nop
                  ori          a6, s10, 234
                  nop
                  fsgnjx.s     ft2, fs3, ft1
                  add          s3, a2, s1
                  feq.s        s2, fa4, fa5
                  remu         t6, a7, s4
                  mulhsu       a2, s6, s10
                  nop
                  ori          a2, a7, 1813
                  mul          sp, gp, t6
                  remu         a0, tp, s10
                  xori         s9, t5, 455
                  fclass.s     a0, ft3
                  slli         a6, s8, 23
                  sra          tp, gp, a1
                  fsgnj.s      ft9, fs8, fs2
                  fsgnjn.s     fs8, fa5, fs11
                  xor          t4, a0, t0
                  fmv.x.w      t4, fs10
                  sub          t0, s4, a0
                  fsgnjn.s     fs7, fs11, ft7
                  fadd.s       ft9, fa0, ft3, rdn
                  or           s5, s2, t6
                  xor          sp, a0, tp
                  sltiu        t3, ra, -1986
                  feq.s        a0, fs1, ft3
                  fcvt.wu.s    s10, ft3
                  fsgnjx.s     ft11, ft11, fs6
                  feq.s        a3, fs1, fs8
                  remu         s1, s7, s0
                  srl          gp, a1, s7
                  mulh         t0, s5, s6
                  flt.s        zero, fa6, fs10
                  fcvt.wu.s    t4, fa5, rtz
                  or           s4, s11, t0
                  sra          a1, s4, gp
                  and          s8, a2, t0
                  srli         s1, a2, 17
                  andi         a3, ra, -1478
                  fdiv.s       fs10, ft3, fa6
                  srli         t6, tp, 12
                  fsqrt.s      fs10, ft5
                  andi         s1, s1, 15
                  ori          gp, sp, -1052
                  mulhu        t5, s3, a4
                  remu         s3, gp, a7
                  feq.s        s11, ft2, fa4
                  fsgnj.s      fs2, fa4, ft11
                  fcvt.wu.s    s8, ft1
                  xori         tp, ra, -1107
                  fcvt.wu.s    tp, ft8, rmm
                  rem          a3, ra, a5
                  rem          ra, s8, tp
                  fadd.s       fa2, fs11, fs7, rup
                  or           a6, s2, t3
                  sltiu        s9, s9, -326
                  fmax.s       fa2, fa7, fs8
                  mul          gp, s7, ra
                  srli         s4, t1, 31
                  fcvt.wu.s    s8, fa3
                  fle.s        s1, fs7, fs5
                  slt          tp, a0, a3
                  fcvt.w.s     zero, fs6
                  mulh         zero, s2, t3
                  fmul.s       fa6, ft3, ft2
                  rem          s3, s5, t1
                  srl          a0, s2, t4
                  sltu         t3, t6, t4
                  lui          gp, 754594
                  ori          tp, s8, -1771
                  fmul.s       ft9, fs8, ft2
                  fmax.s       fa6, ft1, ft11
                  srl          t2, a3, s8
                  fcvt.wu.s    t5, fs4, rmm
                  mulhsu       a5, tp, t6
                  fle.s        t3, ft2, ft11
                  sub          a2, s10, s6
                  slti         a6, s1, 1333
                  div          ra, ra, a1
                  slti         s1, t4, 720
                  sub          t4, gp, s0
                  ori          a3, a7, 1257
                  slli         a6, s2, 29
                  fcvt.s.wu    ft8, s5
                  rem          t3, t2, t3
                  fcvt.s.wu    ft11, s1
                  fcvt.w.s     a0, fa5, rtz
                  fsgnj.s      fa0, ft10, fs11
                  fcvt.w.s     a0, ft8
                  fsqrt.s      ft2, ft10, rup
                  slli         t5, a6, 3
                  mulhsu       s0, s0, s8
                  sltu         t3, s7, t1
                  nop
                  fcvt.s.wu    ft9, t2, rmm
                  or           a3, a5, s0
                  andi         a6, s6, 267
                  mul          s11, t6, s5
                  andi         a3, s6, 514
                  sub          t1, a6, a1
                  fsqrt.s      fa2, ft1, rmm
                  andi         a1, s5, 1943
                  srl          a1, s1, a2
                  fmax.s       fs0, ft5, fs3
                  fmax.s       fs1, ft2, fa4
                  mulh         a5, a1, tp
                  add          a6, s10, gp
                  add          s9, t3, t1
                  srai         a5, s7, 13
                  fcvt.w.s     gp, fs5, rmm
                  fmul.s       fs8, fs0, ft0, rne
                  mulhsu       s3, a6, tp
                  srli         t4, a5, 17
                  andi         ra, ra, -1087
                  sltu         ra, a5, t2
                  fmax.s       fa7, fa3, fa1
                  xor          gp, sp, a3
                  fadd.s       fa5, fs2, ft11, rup
                  fdiv.s       fs10, fa5, fa3
                  xori         s5, t0, 1281
                  fadd.s       ft11, fs2, ft5, rdn
                  or           t5, zero, ra
                  remu         s0, t6, s3
                  fadd.s       fs0, ft7, fs9, rup
                  fsub.s       fs9, ft7, ft4, rdn
                  xor          s4, s3, s11
                  mulh         t1, a1, a7
                  fmax.s       fa7, fs6, ft9
                  ori          a2, s2, 1712
                  fadd.s       ft10, fs8, fa2, rne
                  srai         zero, t2, 8
                  feq.s        s11, fs0, ft2
                  sltu         t4, s10, t2
                  fmin.s       ft1, ft0, fa3
                  addi         ra, s9, -1516
                  feq.s        t5, ft0, fs10
                  mul          a0, a6, s4
                  fadd.s       ft2, ft8, fs0
                  slt          a5, t4, a4
                  fle.s        a4, ft11, ft9
                  addi         t5, s9, 1505
                  fle.s        s5, fs5, fa7
                  ori          s1, t6, 2040
                  rem          a3, t4, s2
                  lui          t5, 99481
                  srai         ra, s6, 6
                  fmax.s       fa3, fs11, fs7
                  andi         sp, s7, -751
                  addi         tp, s0, -302
                  ori          t6, s10, 554
                  fcvt.s.wu    fa3, zero
                  fsgnjx.s     fa5, ft3, ft10
                  fcvt.w.s     s1, ft8, rtz
                  mul          t0, a7, t2
                  fsgnjx.s     ft6, fa5, ft6
                  sll          gp, a4, s10
                  sub          t5, a5, s9
                  mul          s1, s11, a5
                  sub          s3, t1, t6
                  fsqrt.s      fa4, ft3, rmm
                  and          sp, tp, tp
                  feq.s        t4, ft9, ft0
                  sll          zero, zero, t4
                  addi         a3, s10, -1262
                  add          s10, t4, t2
                  sltiu        zero, s1, -1501
                  addi         t3, t4, -932
                  addi         a5, t2, 335
                  fle.s        s9, fs10, ft6
                  and          s0, a2, s5
                  mulhsu       a3, gp, gp
                  fsgnjx.s     ft11, ft11, ft9
                  mulh         t5, a5, zero
                  fmv.x.w      s5, ft8
                  slli         s1, zero, 21
                  auipc        a1, 33012
                  fclass.s     t6, fa3
                  fcvt.s.w     fs8, s3, rne
                  fsgnjn.s     fa4, fs3, ft3
                  mulhsu       a5, s3, s10
                  fmv.x.w      a5, ft10
                  fadd.s       fs1, fs4, fs11, rdn
                  sltiu        a0, t0, 188
                  add          a3, t4, ra
                  fsub.s       ft1, fs7, fs7, rup
                  fcvt.s.wu    ft6, s9
                  fmv.w.x      ft1, s8
                  mul          s10, t0, s9
                  fsqrt.s      ft9, ft9
                  slti         t3, s4, -814
                  fcvt.w.s     t3, ft7
                  srli         t0, t0, 29
                  slti         a6, gp, 1188
                  feq.s        s1, fa4, ft4
                  fadd.s       ft1, ft2, fa0
                  slt          t5, a4, s9
                  fmul.s       fa5, ft3, fs10
                  sra          s11, t2, s7
                  xor          t1, a2, a2
                  sll          s11, tp, a6
                  feq.s        s10, fa7, fa1
                  fsqrt.s      fa1, fa1, rdn
                  rem          a1, a5, tp
                  mulhsu       zero, s11, s7
                  rem          s11, s0, t4
                  sra          s10, s7, s3
                  lui          t1, 1025929
                  andi         t6, gp, 458
                  sub          a5, s4, s11
                  rem          s4, a5, a5
                  lui          s10, 736206
                  sll          t0, s8, t1
                  fmv.x.w      s8, fs8
                  fsqrt.s      fs9, fa1, rtz
                  sll          s10, s8, s11
                  fcvt.s.w     fa2, t5, rmm
                  sll          s0, s2, ra
                  xori         a5, s10, 85
                  fsgnj.s      fa4, ft3, fs1
                  srl          s1, t2, s7
                  fclass.s     s1, fs1
                  mulhu        s4, s5, s4
                  fadd.s       fa2, fs0, fs7
                  fsgnj.s      fs2, fs8, ft5
                  fadd.s       fs2, fs1, fa2
                  fsgnjx.s     fs5, fs10, fa1
                  fsgnjn.s     fa5, fa2, fa2
                  flt.s        a3, fs4, ft8
                  fcvt.w.s     s5, ft9, rdn
                  srl          ra, t6, ra
                  fclass.s     a0, ft5
                  mulhsu       t2, s7, t5
                  fsqrt.s      fs5, fs8, rmm
                  addi         a0, a7, 317
                  sll          sp, a5, zero
                  xor          t0, s7, a3
                  fsqrt.s      ft1, ft2
                  feq.s        a6, fs1, fa7
                  remu         s4, a3, zero
                  srli         sp, t6, 10
                  and          t6, s4, a6
                  addi         t5, s10, 1404
                  fcvt.s.w     fs3, s7
                  remu         a4, a5, s3
                  fadd.s       ft2, ft6, ft8, rne
                  or           s2, t6, s5
                  fle.s        t5, fs9, fs10
                  sll          t1, t0, s4
                  addi         s0, t4, -1768
                  or           s3, a7, t5
                  fdiv.s       ft3, ft1, fa0, rdn
                  auipc        zero, 55181
                  sra          t5, a0, a5
                  addi         s4, s2, -1495
                  fcvt.wu.s    t6, ft11
                  mulhsu       t1, s10, zero
                  xori         t5, a0, 566
                  fcvt.s.w     ft5, a7, rmm
                  fdiv.s       fa4, ft10, ft5, rne
                  fcvt.s.w     fa4, t2
                  slt          t6, t3, a0
                  flt.s        t2, fa2, ft2
                  mulh         t0, s7, a7
                  fmv.x.w      a6, fa4
                  fcvt.s.w     ft8, t5
                  srl          zero, s2, a5
                  divu         tp, tp, t4
                  fcvt.w.s     s3, fs4, rtz
                  fsgnjn.s     ft8, fa3, fa0
                  fcvt.s.wu    fa5, s4, rdn
                  mulhu        a2, s4, a6
                  fmv.w.x      fa4, a3
                  fcvt.s.wu    fs10, a5
                  add          t4, a4, ra
                  nop
                  nop
                  mulhsu       a2, s7, zero
                  mul          s8, t3, tp
                  fsgnjx.s     fs7, fa6, fa0
                  feq.s        t0, fs5, fs3
                  flt.s        s4, fs7, ft3
                  sra          t3, t5, a2
                  fmv.x.w      t6, fs7
                  slt          a0, tp, tp
                  nop
                  slt          sp, gp, a5
                  flt.s        t1, ft6, fa2
                  fcvt.s.wu    fa5, a5
                  fdiv.s       fa6, fs6, fs4
                  fmin.s       fs5, ft7, ft5
                  xori         s11, s8, 543
                  xori         s11, s11, 1267
                  slt          s1, tp, zero
                  fcvt.s.wu    fs9, tp
                  flt.s        s0, ft11, ft0
                  or           zero, s10, t5
                  sltu         t2, ra, s9
                  ori          t4, a3, 694
                  auipc        t4, 665394
                  fcvt.s.w     fs8, t0, rup
                  fcvt.wu.s    a3, fa2
                  sll          s3, a6, a5
                  mulhu        s5, ra, a3
                  fcvt.s.w     fa6, a4, rmm
                  addi         gp, s9, -1679
                  fsub.s       ft8, fa4, ft6
                  fcvt.s.wu    fs2, a5, rup
                  mulhsu       tp, s11, s7
                  div          a1, a5, s9
                  sub          t3, s1, s2
                  mulhu        a1, s7, t6
                  fmax.s       ft5, fa3, ft7
                  fsqrt.s      ft3, fa7, rmm
                  fmv.w.x      fa1, a5
                  ori          sp, s8, 1192
                  lui          s10, 928609
                  slt          ra, a6, s5
                  remu         a5, gp, a5
                  sub          t2, a1, a6
                  fclass.s     t0, fa7
                  sra          a0, tp, t6
                  andi         s5, a7, 761
                  fsgnjn.s     fa4, fs10, ft7
                  fmv.w.x      fa7, a2
                  fmv.x.w      s1, ft10
                  sltiu        a2, s2, 804
                  mul          a1, s2, s0
                  slli         t0, s4, 10
                  mulhsu       a5, a5, s11
                  mulhu        t3, s8, t1
                  srli         s1, t5, 27
                  fsgnj.s      ft4, fs3, fa0
                  fsgnjx.s     ft4, fs10, fs4
                  fsgnjn.s     ft6, fs8, fs9
                  ori          a3, s9, -536
                  fsgnjn.s     ft11, fs0, fs6
                  sltu         t5, a3, a2
                  add          t2, s8, a2
                  mulhsu       s11, t0, gp
                  fcvt.s.wu    ft3, t2, rup
                  sub          s1, a1, a1
                  xori         s10, s10, 467
                  addi         t5, s11, 328
                  fsub.s       ft11, fs5, fa0, rmm
                  fcvt.s.w     ft7, t5
                  sra          s2, zero, t1
                  fle.s        a3, fs11, fs0
                  fmv.x.w      t3, fa6
                  mulhu        tp, a7, s5
                  flt.s        s5, fs11, ft3
                  and          s4, a7, s10
                  fdiv.s       fs9, ft0, fs3
                  feq.s        s0, ft1, fs3
                  fsqrt.s      fs1, fs10
                  slt          gp, s0, a3
                  fmin.s       fa5, ft2, fa5
                  fle.s        s8, fs1, ft10
                  mulhsu       s11, a5, ra
                  flt.s        s11, fs0, fs5
                  remu         s5, a2, s4
                  fadd.s       ft10, ft8, fa4
                  fcvt.s.wu    fa4, s6
                  fsgnjx.s     ft7, fs11, fs4
                  fcvt.s.w     fs10, t5
                  fmv.x.w      a3, ft2
                  fcvt.w.s     s9, fs2, rup
                  fmv.w.x      fs2, a0
                  fsgnj.s      ft5, fs3, fs9
                  mul          a1, s2, a2
                  remu         s0, gp, sp
                  fmul.s       ft10, ft9, fs6
                  fcvt.s.w     fs10, s10
                  mulhsu       a0, s9, s10
                  sra          t3, a4, sp
                  slti         s2, a7, 1329
                  fsub.s       ft0, fs5, fs4
                  fmin.s       fa6, fa6, fs9
                  fcvt.s.w     ft8, s11
                  fclass.s     t0, ft9
                  and          t6, s7, a3
                  remu         a0, tp, s5
                  divu         t4, s3, gp
                  divu         t6, a3, s4
                  feq.s        zero, ft11, fs11
                  fcvt.s.wu    ft8, s2
                  add          s10, s0, t0
                  fsub.s       fa0, ft10, fs8, rmm
                  fmv.w.x      ft7, s9
                  fcvt.wu.s    s10, fs6, rne
                  auipc        a2, 630259
                  mul          s4, s8, t4
                  fmin.s       fa1, fa7, fa3
                  fclass.s     t2, ft1
                  sub          t3, ra, t1
                  fcvt.s.wu    ft8, s0, rup
                  or           s10, s3, ra
                  slli         s4, s1, 23
                  fcvt.s.w     fs10, s10
                  mul          s2, t5, s2
                  srai         a5, s4, 21
                  sll          a4, t4, sp
                  sub          sp, s7, s5
                  addi         s2, a6, -350
                  lui          t3, 293980
                  fmin.s       fa6, fs3, fa1
                  fmv.w.x      ft0, s5
                  sra          s9, s7, a6
                  srl          a4, ra, a7
                  fsgnj.s      fs3, fs0, fa4
                  flt.s        s0, ft3, fa0
                  feq.s        s5, fa3, fs11
                  xor          s1, t2, a2
                  or           s10, gp, a4
                  mulh         a2, a2, t3
                  sltiu        s4, a1, 1266
                  fcvt.wu.s    gp, fs5
                  or           s3, s5, t5
                  remu         s10, zero, a5
                  sltiu        t1, t4, 616
                  remu         s10, zero, s10
                  flt.s        a3, fs9, fs10
                  fcvt.s.wu    ft4, a4, rup
                  fsub.s       ft3, fs10, ft8, rne
                  slli         s0, ra, 12
                  fle.s        zero, fa6, fa1
                  nop
                  fsgnjn.s     fa2, ft9, ft4
                  fcvt.w.s     t6, ft10
                  fcvt.s.wu    fa3, s8, rne
                  fsgnj.s      fa0, fs7, fs0
                  auipc        s0, 337420
                  fcvt.wu.s    a6, ft9
                  mulh         a3, t0, a1
                  mul          t4, a1, t6
                  flt.s        t4, ft0, fs11
                  rem          s0, a1, a6
                  mul          s2, a3, s2
                  sltiu        s11, a1, -525
                  fsqrt.s      ft7, ft10, rup
                  fcvt.s.w     ft9, s5, rne
                  fmv.x.w      t2, fs6
                  add          s11, a3, t0
                  flt.s        t5, ft11, fs4
                  xori         a3, s6, -1090
                  fmax.s       fa0, ft11, fs0
                  fmax.s       ft9, fa2, fa2
                  remu         a4, t0, t0
                  sltu         a5, a0, s7
                  slti         t3, a5, 896
                  fclass.s     a3, ft3
                  fmv.w.x      ft10, t2
                  sltiu        a5, s10, -1867
                  divu         t5, s7, s8
                  fcvt.wu.s    s8, fs4, rne
                  divu         t6, s8, s2
                  flt.s        s9, fa5, ft11
                  mulhu        t2, t6, t4
                  sltu         s10, s5, gp
                  srli         a1, sp, 30
                  flt.s        a2, fa1, ft5
                  fmv.w.x      fs11, s9
                  slli         s8, s5, 23
                  fdiv.s       ft11, fa5, fa4
                  and          s11, ra, s6
                  fclass.s     gp, ft2
                  feq.s        s0, ft6, ft2
                  divu         t0, s10, t0
                  rem          t3, t3, t3
                  mul          a3, s11, s7
                  slli         s0, a0, 13
                  and          s4, t6, s8
                  sra          gp, s11, t6
                  divu         ra, t0, gp
                  feq.s        t1, ft10, fs3
                  mulhsu       t3, zero, s9
                  mulh         tp, s7, a4
                  fdiv.s       fs10, fa3, fs8, rmm
                  fdiv.s       fs6, fs9, fs0
                  mul          gp, s8, a4
                  and          t6, zero, t5
                  addi         t0, s4, 1435
                  fcvt.s.w     fa2, s10
                  fsgnjn.s     ft11, fa7, fs1
                  fmv.x.w      t3, fs5
                  fsgnjx.s     fa2, fs3, fa1
                  fcvt.s.w     fs10, s4
                  or           s9, s8, s11
                  fcvt.s.w     ft4, a2
                  fsgnjx.s     fs6, ft8, fs11
                  sub          a1, a0, a4
                  flt.s        s2, ft10, ft8
                  fmax.s       fs2, fa3, ft8
                  srai         t2, s4, 15
                  fsub.s       fs11, ft2, fa0
                  fsub.s       fs3, ft3, ft3
                  slt          a5, ra, t5
                  div          t1, gp, t3
                  add          t6, s2, a5
                  and          s10, a6, gp
                  fmul.s       ft6, ft3, fa4
                  srl          s11, s2, s2
                  rem          t4, a3, s7
                  fmv.w.x      fs4, t0
                  sub          sp, s4, s6
                  auipc        s9, 975898
                  lui          ra, 76257
                  slt          s5, t5, s7
                  or           a5, t5, s3
                  divu         zero, t4, a7
                  mul          a2, t6, t4
                  add          a2, s8, s11
                  fmin.s       fs9, fs1, fs6
                  srai         a3, a5, 18
                  fclass.s     a5, fs0
                  fclass.s     t1, fs9
                  fmin.s       ft11, fs1, fa4
                  mulhsu       s3, s2, s10
                  fcvt.s.w     fs7, s11, rmm
                  fcvt.s.wu    ft9, s5
                  ori          a3, sp, 271
                  fclass.s     a0, fs3
                  nop
                  fcvt.s.w     fs8, gp, rne
                  fclass.s     t2, fs2
                  mulh         a5, s1, s5
                  srai         s9, s6, 24
                  fmv.x.w      s1, fa7
                  srai         a5, t2, 19
                  fsqrt.s      ft11, fs10, rtz
                  srai         t2, a4, 19
                  srl          a2, t4, a5
                  auipc        s8, 195226
                  fmv.x.w      s1, ft3
                  div          t0, a2, s9
                  slti         s4, s10, -1842
                  and          tp, t6, zero
                  add          s8, a1, t1
                  xor          s0, ra, s2
                  xor          s2, t3, tp
                  fsub.s       ft3, fa6, ft8
                  mul          s8, a7, s1
                  mul          a6, a0, t2
                  feq.s        t4, ft0, ft5
                  lui          t0, 340408
                  fmin.s       fs4, ft4, ft9
                  fmv.x.w      gp, fa2
                  srli         tp, s11, 17
                  flt.s        gp, ft8, ft1
                  mul          a6, s5, ra
                  fsgnjn.s     ft10, fs8, fa6
                  mul          a3, t5, s7
                  fmv.x.w      zero, fs6
                  and          a5, s6, s11
                  xor          s4, s2, s5
                  feq.s        gp, fa1, ft9
                  flt.s        tp, ft0, fs8
                  feq.s        a1, fs8, fs4
                  slli         t5, a2, 15
                  sltu         t4, a7, t2
                  fsgnjn.s     fa6, fa3, fs0
                  fsgnjx.s     ft6, ft0, fs11
                  fmv.x.w      t0, ft5
                  fcvt.w.s     sp, fs3, rne
                  and          t1, s7, t1
                  fsgnj.s      fa0, fs6, ft0
                  addi         t4, a1, -877
                  mulhu        a2, s7, t3
                  div          s8, zero, s8
                  fsgnjn.s     fs0, fs2, fa2
                  div          s9, sp, t5
                  fsgnjn.s     fa4, ft2, fs1
                  fsgnjn.s     fs1, ft9, fa0
                  fcvt.w.s     s0, fs0, rup
                  srai         ra, a2, 24
                  fcvt.s.w     fa4, t1
                  remu         a1, a4, s10
                  flt.s        a4, ft4, fs11
                  fsgnjn.s     fa5, fa5, fs8
                  fmin.s       fs1, fa5, ft11
                  fsgnj.s      fs2, fa4, ft6
                  fclass.s     s11, ft11
                  fmax.s       ft5, ft0, fs11
                  sltiu        a0, a1, 1376
                  slli         t3, s0, 20
                  rem          a2, zero, t5
                  sra          s1, a4, ra
                  divu         t0, s2, sp
                  srli         t3, gp, 22
                  srai         s10, t5, 14
                  fcvt.s.w     fa6, a1, rtz
                  xori         s4, sp, 1219
                  sltiu        t0, t2, -833
                  slt          s11, gp, s6
                  slti         s8, s4, -398
                  fmul.s       ft1, fs9, ft2
                  sra          t6, s0, zero
                  ori          s10, s1, -1279
                  remu         t5, zero, a7
                  fmin.s       fa0, ft7, fa7
                  sll          a5, t1, a6
                  slt          t1, t3, s5
                  slt          sp, s0, s10
                  fcvt.wu.s    t3, fa0, rdn
                  fdiv.s       fa0, fs4, fs7
                  and          a3, t4, a5
                  slti         s9, t1, -641
                  slt          t6, s10, s3
                  mulhu        s11, s2, s1
                  auipc        ra, 971087
                  fle.s        t1, fs11, ft4
                  sltu         a6, s2, sp
                  fmv.x.w      s8, fs4
                  fmax.s       ft2, ft9, fs3
                  flt.s        s4, fa6, fa4
                  slt          a3, sp, a5
                  mul          tp, tp, t6
                  fcvt.w.s     t2, ft11, rne
                  sltiu        tp, s10, 760
                  fle.s        a0, fs8, fs4
                  fmv.x.w      t3, fs2
                  fsqrt.s      fa1, fs2, rdn
                  mulhsu       zero, t4, a1
                  fsgnjn.s     fs3, fs7, ft2
                  sra          a2, s6, s1
                  rem          t1, gp, a2
                  ori          a6, a3, -1350
                  fclass.s     t3, ft1
                  or           t5, s5, s11
                  srl          s5, s8, s8
                  srl          a5, s4, s1
                  mul          t2, s9, s5
                  fdiv.s       fa2, fa6, fs1, rdn
                  sll          s1, a4, a4
                  slt          s9, s10, zero
                  fsgnj.s      fs8, fa6, ft7
                  fmv.w.x      ft9, ra
                  sll          a1, s10, s10
                  remu         s2, zero, sp
                  remu         ra, t6, t0
                  fadd.s       ft2, fa4, fa6
                  andi         t3, t3, -6
                  fmin.s       ft1, ft6, fs2
                  fmul.s       ft10, fs7, ft2
                  sra          t5, ra, a1
                  or           a2, t0, s3
                  slli         ra, t5, 7
                  fsgnj.s      ft10, fs1, fs7
                  fsqrt.s      fa2, fs0
                  addi         s5, t6, 612
                  fsub.s       fs1, fs1, ft2, rmm
                  auipc        tp, 177950
                  fmin.s       fs11, ft6, fs6
                  remu         t6, t3, t1
                  slli         t4, a4, 15
                  slti         s0, a2, 1290
                  fle.s        t0, fs3, ft5
                  lui          t5, 442543
                  fsqrt.s      fa3, ft5, rtz
                  srai         s9, a4, 21
                  flt.s        s1, fa4, fa3
                  slli         s11, tp, 18
                  fcvt.w.s     s8, fa3, rdn
                  slli         s9, s0, 29
                  mulhu        a5, t5, a1
                  or           a1, t2, t6
                  andi         t5, t3, -444
                  div          s1, t6, zero
                  fmv.w.x      ft11, s1
                  sub          s0, a7, s11
                  srai         t0, ra, 15
                  srai         tp, tp, 18
                  and          a6, a4, a2
                  fsub.s       fs10, ft8, ft8
                  slli         a3, sp, 6
                  fsgnjx.s     fs0, fs9, ft2
                  slt          t5, a1, t4
                  lui          zero, 562970
                  divu         a6, a1, s4
                  slli         s5, s9, 5
                  fclass.s     a1, fs9
                  sra          a5, t6, a1
                  auipc        t4, 802749
                  or           zero, s4, a2
                  slt          t2, t2, a6
                  srl          s4, ra, s4
                  fcvt.w.s     t6, fs0, rtz
                  slt          a2, t3, a6
                  add          s8, a0, sp
                  flt.s        s2, ft7, ft7
                  fcvt.s.w     fa3, s9
                  remu         s2, s6, s9
                  ori          sp, a3, -1058
                  fadd.s       fs7, fs0, ft7, rmm
                  sll          s11, a1, s7
                  fdiv.s       fa4, fs2, ft4
                  ori          a6, a7, -591
                  div          gp, a7, s0
                  sltu         tp, ra, s8
                  fmax.s       fa3, ft10, fa7
                  srl          sp, t2, sp
                  nop
                  fclass.s     s1, fs1
                  nop
                  mul          t3, t2, t2
                  sltu         t4, a4, s6
                  fmul.s       ft6, ft3, ft8
                  add          a4, t3, t6
                  srai         zero, s6, 5
                  xor          t3, a2, s9
                  lui          s1, 231541
                  ori          t0, s2, -993
                  xori         s0, a1, 802
                  fsub.s       fa3, fa2, fa5
                  flt.s        t3, ft9, fa5
                  srli         s10, s4, 5
                  fmin.s       fs7, ft6, fs9
                  mul          a2, t4, a3
                  fsgnjx.s     fs11, fa3, fs11
                  fmv.x.w      s1, ft8
                  fcvt.s.w     fs9, s7, rdn
                  auipc        s8, 914867
                  fmax.s       fa4, fs3, fa2
                  fsgnjx.s     ft6, fa1, fa2
                  remu         s8, s11, s0
                  div          a5, a1, s9
                  srl          t3, s0, tp
                  add          t6, s10, t4
                  mulhu        a4, tp, s3
                  andi         s4, s1, 730
                  srli         sp, t3, 5
                  fsgnjn.s     fs11, ft0, fs2
                  andi         a1, tp, 142
                  nop
                  remu         a1, s11, t5
                  flt.s        a1, fs2, ft1
                  xori         s8, t0, 277
                  mulhsu       a1, s6, s2
                  or           a6, t5, zero
                  fcvt.w.s     zero, fs10
                  nop
                  fmv.x.w      s2, ft6
                  nop
                  fsqrt.s      ft5, ft7
                  lui          t1, 41503
                  sltiu        s3, a6, -1002
                  srli         a5, t3, 25
                  auipc        t0, 64949
                  sll          a0, t1, a7
                  nop
                  auipc        a5, 116895
                  slli         s1, tp, 7
                  sll          a0, s2, s9
                  fcvt.s.w     ft9, a2, rmm
                  fsub.s       ft3, fa1, fs5, rdn
                  fcvt.s.w     fa2, s1
                  divu         gp, a2, a5
                  fmul.s       fa7, fs10, ft7
                  and          ra, t4, t4
                  fmul.s       ft4, ft3, ft1
                  mulh         a5, t3, ra
                  and          a1, a4, s8
                  fadd.s       ft11, ft6, ft10
                  fcvt.wu.s    s5, fs1
                  sll          t3, a0, s4
                  flt.s        t0, ft9, fs7
                  fsgnjn.s     fs9, ft10, fs10
                  and          s10, t5, gp
                  feq.s        s0, ft1, fa7
                  divu         a6, s1, gp
                  srli         s3, s6, 0
                  mulhsu       s4, s4, s11
                  fmax.s       fs10, fs10, fa0
                  xor          s9, t5, s2
                  fsqrt.s      ft5, fa1
                  fmax.s       ft9, fs11, ft9
                  fmin.s       ft0, ft0, ft5
                  xor          t2, t5, s7
                  fsqrt.s      ft7, fs2, rne
                  feq.s        sp, fs9, fa7
                  fmin.s       ft11, fs7, fa0
                  mul          gp, gp, t4
                  slti         tp, a2, -447
                  fdiv.s       ft11, fs7, fa6, rne
                  slti         sp, s5, -1785
                  slti         s4, s11, 198
                  fadd.s       fs9, ft5, ft6, rmm
                  ori          a5, s5, -883
                  flt.s        a6, fs4, fs0
                  fcvt.s.w     ft4, a6
                  srl          a4, s0, a0
                  mul          gp, a1, s1
                  sll          ra, a6, gp
                  fmul.s       ft2, fs10, ft7, rtz
                  mulh         a5, t4, t3
                  slti         a2, s1, 846
                  fmv.w.x      ft1, t4
                  and          a1, s8, gp
                  fmax.s       ft7, fa5, fs9
                  fcvt.s.wu    fs0, t3
                  auipc        s4, 158270
                  fcvt.w.s     t6, ft7, rtz
                  mulh         s3, s0, gp
                  xor          t2, s11, a2
                  srai         s4, a6, 17
                  slti         s2, a5, -1147
                  mul          s0, s6, t0
                  ori          s8, a4, 846
                  fmax.s       ft3, fs3, fs6
                  fsgnjn.s     fa0, fs8, fa5
                  sll          t0, s2, t3
                  fmv.x.w      a0, fa5
                  fsub.s       fs11, fa1, ft4, rtz
                  auipc        a6, 1016063
                  slli         s10, s11, 3
                  srl          a6, gp, s4
                  fmin.s       fa4, fa1, fs5
                  nop
                  srli         a2, t5, 24
                  fmv.x.w      t3, ft4
                  fsgnj.s      fs11, ft9, fa1
                  xori         s8, t1, -1645
                  and          t2, s0, a6
                  fcvt.w.s     t5, fa3, rtz
                  div          s10, t1, s9
                  mulh         a4, s0, s3
                  fmul.s       fs0, fa0, fa1
                  fcvt.w.s     t1, fa3
                  xori         a4, gp, 1697
                  mulhsu       zero, s0, zero
                  feq.s        s10, fa3, ft1
                  fadd.s       ft5, ft5, ft8, rtz
                  and          a2, a5, t3
                  and          t2, tp, s2
                  fmv.x.w      t2, ft4
                  nop
                  sll          ra, a1, tp
                  lui          gp, 406258
                  addi         s1, s6, 1504
                  xor          t3, s0, s1
                  fcvt.s.wu    fs1, s3
                  auipc        tp, 678051
                  mulhu        t1, s9, t3
                  xori         s5, sp, -1683
                  flt.s        t6, fs1, fa6
                  fmv.w.x      ft11, ra
                  mul          a6, s4, a1
                  fmul.s       fa3, fs8, ft4
                  fmv.w.x      fa4, ra
                  ori          s9, s6, -1309
                  fcvt.s.wu    fs11, s4
                  srai         a0, s2, 27
                  feq.s        zero, ft9, fs3
                  fmul.s       ft7, ft4, fa5
                  xor          a3, s4, t2
                  fmul.s       fs1, fs2, ft0
                  fsqrt.s      fa6, ft4
                  fmax.s       fs2, fs0, fs10
                  slli         s1, t1, 3
                  lui          t6, 579210
                  sub          s5, s7, a2
                  srli         s8, a1, 2
                  and          t6, a3, t3
                  fmin.s       fs6, fs5, fa3
                  sra          t5, a4, a7
                  remu         t4, s7, s1
                  fmv.w.x      fs7, a3
                  sub          tp, sp, a5
                  sub          s2, s0, s1
                  remu         t6, s6, s3
                  sltiu        s9, s7, 1766
                  fmul.s       ft2, fs3, ft1, rup
                  mulhsu       tp, s10, t6
                  add          ra, gp, s3
                  flt.s        s9, fs6, fs4
                  andi         t1, a1, -130
                  fmv.x.w      t5, ft1
                  divu         s0, a2, t5
                  fclass.s     zero, ft6
                  fdiv.s       ft4, ft10, ft8
                  xor          ra, a4, a7
                  sll          t2, s0, a5
                  div          t1, t1, t6
                  sll          a1, s6, t3
                  fmul.s       ft1, fs0, fa0, rmm
                  sll          gp, s9, s7
                  lui          gp, 518867
                  ori          s0, t4, 741
                  srl          s2, t4, s0
                  remu         t5, a6, s10
                  fmv.x.w      a0, ft4
                  fsqrt.s      fs10, ft1, rtz
                  and          t5, s10, s3
                  fsub.s       fs3, fs2, ft4
                  remu         a5, t3, tp
                  sll          t1, ra, s9
                  fsgnjn.s     ft8, ft10, ft3
                  fmin.s       fa5, ft4, ft4
                  fsgnjn.s     fs3, fa6, ft3
                  fsgnjn.s     ft0, ft5, fa5
                  fcvt.s.w     fa7, s5, rne
                  fmv.w.x      ft9, t2
                  sltu         s5, s3, s1
                  fsgnj.s      fs9, ft8, ft11
                  sltiu        t0, a7, 689
                  feq.s        s4, fs2, ft8
                  fmul.s       ft9, ft9, fs6
                  fmax.s       fa0, ft9, fa5
                  fcvt.w.s     a0, ft0
                  sub          s2, s11, s3
                  fsgnjx.s     fa6, ft9, ft4
                  sltu         gp, s7, s1
                  rem          s4, t2, s0
                  fadd.s       fs2, ft9, fs2
                  sra          t3, t1, gp
                  addi         a6, t2, -1279
                  fdiv.s       ft11, fs9, fs7, rtz
                  fmv.x.w      s3, ft8
                  sub          sp, t0, s10
                  sltiu        t2, t5, -1721
                  nop
                  srl          zero, s10, gp
                  fmv.w.x      fs1, t1
                  rem          sp, s4, gp
                  fdiv.s       fs1, ft1, fs4, rtz
                  fcvt.wu.s    s11, ft5, rmm
                  fdiv.s       ft8, ft10, fs1
                  slli         a2, s5, 13
                  fdiv.s       fs0, fs11, fs6, rdn
                  fcvt.wu.s    t2, fa5, rup
                  fsgnjn.s     fa0, ft5, fs6
                  fcvt.w.s     s1, fs8
                  ori          s9, s4, -1820
                  fclass.s     s11, fs5
                  fsqrt.s      fs7, ft0, rmm
                  addi         s8, t1, -244
                  slli         a4, t2, 28
                  srai         t0, s3, 30
                  add          s1, ra, a0
                  sltiu        s0, s0, -2011
                  fsub.s       fs1, fs9, fs2
                  slli         a4, a2, 6
                  slti         gp, tp, -123
                  sltiu        s1, t4, 1222
                  slli         s11, sp, 15
                  addi         a1, s10, 203
                  fdiv.s       fa1, ft4, ft0
                  addi         s0, a2, -501
                  fcvt.s.wu    fs11, zero, rmm
                  fcvt.w.s     t4, ft10
                  feq.s        a0, fs10, fs4
                  fle.s        s3, fs6, ft4
                  fmv.x.w      a4, fa5
                  ori          sp, a6, -495
                  auipc        s10, 926084
                  fmax.s       ft2, fs5, ft0
                  and          a4, a5, sp
                  srai         s0, s8, 13
                  or           s8, t1, s7
                  fcvt.s.w     fa1, a5, rne
                  fclass.s     gp, ft5
                  fmax.s       fa6, fs7, fa3
                  sub          t5, a7, t0
                  fcvt.wu.s    a6, fa7
                  andi         a5, s3, 1788
                  fcvt.w.s     a2, ft11
                  mul          t2, a7, s5
                  auipc        tp, 641802
                  fmin.s       fa5, ft2, fs5
                  remu         gp, a3, a2
                  fmv.x.w      a6, fa5
                  feq.s        s4, fa5, ft10
                  nop
                  divu         gp, a2, a4
                  fsgnjx.s     ft4, ft4, fa6
                  divu         a5, s2, zero
                  sub          s1, s4, s4
                  fdiv.s       ft0, ft9, ft2
                  fcvt.s.wu    fa7, s9
                  fcvt.wu.s    t3, ft8, rup
                  flt.s        zero, fa2, ft7
                  add          t4, s7, a6
                  srli         a0, a1, 18
                  fmv.w.x      fa0, tp
                  fsgnjn.s     ft5, ft1, fa1
                  xori         a1, t5, -1486
                  sltu         a3, ra, a4
                  srl          t1, a5, a5
                  divu         ra, a0, t2
                  fclass.s     a5, ft10
                  srli         s4, s6, 18
                  lui          s10, 274115
                  mulhu        s1, s2, a1
                  fcvt.wu.s    s8, fa3, rne
                  ori          s10, a2, 1431
                  mulhsu       a2, gp, ra
                  auipc        s11, 401949
                  addi         a0, a7, 1854
                  fcvt.s.wu    fa3, t2
                  srai         t5, a3, 18
                  fcvt.w.s     ra, ft9
                  mulhu        s5, zero, s11
                  fsgnjn.s     fs3, fa1, fs0
                  fcvt.s.wu    ft11, gp
                  fmv.x.w      s3, fa2
                  andi         a0, a0, -1930
                  slti         s8, s7, -143
                  flt.s        a5, ft6, fs10
                  nop
                  fcvt.s.wu    ft8, s8
                  sub          zero, s6, s9
                  add          ra, gp, t5
                  srli         gp, s2, 1
                  mulh         t4, t3, t2
                  andi         t3, s1, 524
                  rem          a5, t3, t1
                  divu         sp, t2, a3
                  andi         s1, tp, 854
                  sll          a0, s7, s0
                  addi         a5, s9, 215
                  fdiv.s       fa2, fs11, ft9, rmm
                  fmax.s       fa3, fa0, ft0
                  srli         t6, a4, 15
                  addi         a0, gp, -1667
                  slli         s10, a3, 29
                  sub          a2, s11, a0
                  fmv.w.x      fs6, gp
                  slli         zero, sp, 2
                  andi         s5, a4, 1268
                  div          t5, a5, a1
                  fadd.s       fs3, fs10, ft5, rne
                  mulhsu       a6, t4, s9
                  fmax.s       ft1, ft3, fs1
                  fcvt.wu.s    a1, fa0
                  fcvt.w.s     s10, fs5, rmm
                  fmin.s       fs11, fs7, fa0
                  fsgnj.s      fs1, fa7, ft4
                  fclass.s     a1, ft11
                  feq.s        t2, fs8, ft8
                  addi         t4, t3, 1679
                  fmv.x.w      s4, fa4
                  fsqrt.s      ft3, fs11, rtz
                  fcvt.w.s     a5, ft0
                  srai         s3, a0, 3
                  fmv.x.w      t1, fs2
                  sltu         a3, ra, a6
                  flt.s        gp, ft10, ft4
                  divu         t5, a5, t1
                  sub          a3, t3, a3
                  sra          t0, t0, a3
                  mulh         s5, s2, s9
                  fsqrt.s      fs11, fs10, rne
                  div          s4, a2, a7
                  auipc        t3, 350335
                  xor          zero, s1, a6
                  srl          s9, s1, t4
                  fmv.x.w      a1, fs10
                  fcvt.s.w     fa3, t6, rup
                  fmv.w.x      fa0, gp
                  xori         a5, gp, -958
                  fmv.w.x      fs10, ra
                  mulhsu       s2, s1, zero
                  sltiu        t3, t0, 667
                  addi         t4, s8, -1216
                  flt.s        zero, fa3, ft1
                  mulhsu       a5, s2, s5
                  sll          s10, a3, s5
                  fmv.w.x      ft9, s11
                  rem          t4, t1, a7
                  fsqrt.s      fs8, ft6, rmm
                  srl          s10, a5, t5
                  fsgnjn.s     fs5, fa0, fs6
                  ori          a5, s3, 1079
                  fcvt.wu.s    gp, ft6, rtz
                  auipc        s5, 653418
                  fsgnj.s      fa1, ft7, fs11
                  fsgnjx.s     ft2, ft8, fs8
                  addi         tp, s2, 1492
                  ori          s3, a6, -855
                  auipc        a6, 131183
                  fsgnj.s      fs9, fs11, fa7
                  sltu         t6, a5, t1
                  fcvt.s.wu    ft10, t3, rup
                  sltiu        a3, a6, -1062
                  flt.s        a2, fs11, fs8
                  ori          tp, gp, 1449
                  fsqrt.s      ft7, ft2
                  mulh         s1, gp, t2
                  mulhsu       s8, t5, t5
                  flt.s        a3, fa5, fs4
                  xor          a6, t2, s0
                  fsgnjn.s     ft7, ft9, fa0
                  div          a4, t4, s10
                  fcvt.w.s     tp, fs8
                  mul          s3, s10, s10
                  auipc        a3, 268372
                  lui          s4, 719881
                  fcvt.s.wu    fs9, s0
                  sra          a6, s8, a5
                  fsgnj.s      fs5, ft8, fs0
                  fcvt.wu.s    t5, ft0
                  mulhu        t0, a4, a2
                  ori          a0, s0, -1866
                  sub          a3, a5, t2
                  srai         s3, s10, 17
                  fsgnjx.s     ft3, fs2, ft7
                  fcvt.w.s     s3, fs6, rmm
                  add          t6, a1, a3
                  nop
                  fmin.s       ft6, ft8, ft0
                  ori          s4, t1, 164
                  auipc        t2, 987985
                  sra          t6, t1, s10
                  mulhsu       s8, a0, t5
                  fadd.s       fs4, ft3, ft0
                  slti         a6, t6, -1965
                  xor          t0, a5, a2
                  fmin.s       fa5, fs4, ft9
                  fadd.s       fs5, fa4, fs0
                  remu         s8, s0, t1
                  fmin.s       ft11, fs3, fa1
                  auipc        a0, 795478
                  sra          sp, tp, s9
                  mulhsu       a2, t4, t2
                  sra          s11, a2, s10
                  add          t3, s10, s1
                  and          a5, a0, s0
                  srli         s10, s11, 6
                  add          ra, s5, t3
                  mulh         s2, a2, a2
                  mulhsu       s2, t6, tp
                  div          s8, ra, a5
                  add          t1, a7, s3
                  mulhu        a3, a1, s5
                  mulhsu       t3, a4, s8
                  and          a5, a3, s9
                  fadd.s       fs1, fs9, fs7
                  fclass.s     a3, fs3
                  mulhsu       s3, sp, s5
                  divu         s8, a3, s7
                  fsgnjx.s     fs1, fa4, ft5
                  fsub.s       fa3, fs4, fs9
                  fclass.s     s5, ft7
                  slli         a5, a4, 18
                  slli         tp, t4, 6
                  feq.s        t6, ft2, fs3
                  fmin.s       ft0, fs10, ft4
                  sltiu        t6, s2, -432
                  fsgnj.s      ft9, fs2, fa3
                  addi         s1, s0, 1038
                  fsub.s       ft5, fs9, fs0
                  fcvt.w.s     t2, ft0, rne
                  and          t0, a5, s6
                  fmv.w.x      fa1, t5
                  xori         t0, gp, 1692
                  auipc        s3, 108185
                  flt.s        s8, ft11, fa4
                  and          t6, t4, gp
                  div          s11, a0, s3
                  fsqrt.s      fa1, fs9
                  nop
                  slt          s1, s11, a0
                  or           t6, s10, s7
                  mulhu        t4, s11, tp
                  addi         s10, a0, -1417
                  andi         s8, s9, -1637
                  andi         t1, t1, 1879
                  srl          s11, s0, tp
                  fsgnjn.s     fs0, fs8, fa3
                  mulh         a2, s6, s2
                  slli         t0, a0, 2
                  ori          a5, gp, -656
                  fcvt.s.w     fs1, t1, rne
                  and          t0, a0, t3
                  or           a3, s6, a2
                  fcvt.wu.s    t1, fs1, rdn
                  sltiu        gp, t0, -1540
                  div          s9, a2, a2
                  fmv.w.x      ft4, a7
                  addi         s11, t2, 1891
                  andi         s1, zero, -45
                  fsgnjn.s     fa2, ft9, fa7
                  fmv.x.w      t5, fs8
                  flt.s        s2, fs9, fs8
                  fle.s        a0, ft1, fs3
                  auipc        s4, 444697
                  fsgnj.s      fs11, fs10, fs7
                  div          t0, gp, t6
                  sra          a6, a0, t1
                  mul          t2, a2, s8
                  lui          a2, 531774
                  sll          s1, ra, s5
                  srai         a4, s9, 2
                  fsgnj.s      fa3, ft4, fa6
                  divu         zero, a3, s0
                  fsub.s       ft9, fa2, fs1
                  mulh         t4, a1, s0
                  mulhu        zero, a1, tp
                  xor          a3, a2, t0
                  andi         t1, t5, -360
                  mulhsu       s10, t4, s0
                  div          s1, s0, t1
                  addi         sp, sp, 1923
                  xori         s10, t2, 1985
                  sra          gp, t3, a7
                  fdiv.s       fs5, ft2, fa2, rne
                  sll          tp, s4, ra
                  fsub.s       ft3, ft4, ft11
                  remu         s11, t4, t3
                  fcvt.s.w     fs2, a7
                  divu         s2, sp, a4
                  nop
                  fcvt.s.w     fs1, a2
                  fcvt.w.s     t2, fs10, rmm
                  slli         t5, t1, 30
                  fcvt.s.wu    fa4, s5
                  nop
                  fdiv.s       ft7, fs6, ft7, rne
                  mulhu        sp, a3, ra
                  srai         s11, s10, 9
                  fmax.s       ft5, ft11, fa4
                  slli         s11, s10, 29
                  fmin.s       fs9, fa0, ft8
                  fcvt.wu.s    t0, fs6
                  fsgnj.s      ft0, fa6, ft1
                  sll          a1, a7, t2
                  slli         a6, a6, 31
                  fclass.s     s8, fs5
                  and          s1, a1, s4
                  fsgnjx.s     fa7, fa7, ft0
                  fdiv.s       fs0, fs6, fa3
                  slt          s10, s5, s7
                  and          a1, a3, a1
                  remu         s10, a0, t3
                  fmax.s       fs11, fs10, fs8
                  fle.s        t5, fa0, fa0
                  fadd.s       fa7, fs0, ft7
                  remu         t6, t0, s11
                  andi         s8, a2, 1490
                  flt.s        t1, ft4, fs1
                  div          tp, s11, a6
                  sltiu        sp, t4, -1539
                  auipc        a1, 922420
                  fcvt.w.s     s4, fa3
                  add          a2, s10, t6
                  srli         t3, t2, 2
                  sub          s1, a7, s8
                  add          t0, t0, a1
                  sll          zero, s8, s11
                  feq.s        gp, ft6, ft2
                  fmax.s       fs6, ft7, ft1
                  fcvt.wu.s    t5, fa6
                  sltiu        s10, ra, -1204
                  nop
                  add          a4, s10, t5
                  rem          t6, t1, t1
                  fsgnjn.s     fa1, fs1, fs6
                  xori         a3, t1, 1005
                  fsgnjn.s     ft6, fs7, ft9
                  andi         a4, s7, -301
                  or           zero, s8, s2
                  flt.s        t2, fa5, fa5
                  ori          s0, zero, -1424
                  fmv.x.w      t0, ft6
                  remu         a4, gp, sp
                  fsqrt.s      fa4, fa7
                  fadd.s       fs5, fs3, fs7
                  or           s11, s10, tp
                  andi         s3, s1, 1000
                  fmin.s       fa3, fa5, fs4
                  sltiu        a2, s3, 987
                  nop
                  fsgnj.s      fa4, ft1, fs3
                  mulhsu       s8, t5, a2
                  remu         s4, s6, ra
                  sltu         s5, a6, s8
                  fsgnj.s      fs9, fa6, fs9
                  xor          s8, a3, t5
                  fmv.x.w      sp, ft5
                  fsgnj.s      fs0, fs6, fs7
                  ori          s8, zero, -917
                  feq.s        a4, fs4, ft7
                  fmin.s       fs8, fa5, fa7
                  sub          s5, tp, s7
                  fclass.s     a6, ft7
                  slti         a0, s1, -1887
                  add          t1, tp, s2
                  mul          s4, t2, s5
                  fcvt.wu.s    a2, fs2, rdn
                  nop
                  xori         s9, tp, 563
                  ori          sp, s6, 2047
                  srli         ra, s7, 9
                  andi         s2, t2, 46
                  fadd.s       fs0, ft7, fs7
                  fcvt.wu.s    s5, fs0, rdn
                  feq.s        a5, fa0, ft6
                  fdiv.s       fa4, fa4, fa2
                  or           ra, a2, t3
                  or           s3, t0, s5
                  nop
                  andi         a2, ra, -1812
                  rem          ra, zero, s9
                  add          s5, a0, a4
                  xor          t1, t0, a3
                  xori         t1, s1, 1695
                  fclass.s     a5, ft5
                  lui          t2, 588261
                  mulhsu       zero, t3, s3
                  fsub.s       ft6, ft10, fs6
                  and          a1, a3, tp
                  remu         zero, a4, s8
                  fsgnj.s      ft7, ft2, fs9
                  mul          s9, a2, t0
                  sub          t6, t6, s0
                  fmin.s       fs3, fs3, ft8
                  fsub.s       fa7, fa5, fa6
                  fle.s        a2, ft9, fs2
                  sra          a2, a2, gp
                  sll          a0, zero, s0
                  fsub.s       fa4, ft6, fa6, rup
                  fsgnj.s      fs5, ft9, fs7
                  flt.s        a1, fa2, fa3
                  nop
                  slli         a3, s7, 14
                  srai         t2, t5, 26
                  fcvt.w.s     t5, fa7, rup
                  fmax.s       ft11, fa0, fa1
                  sra          t0, t1, t3
                  slli         t0, t0, 8
                  sltu         s2, s3, s7
                  slti         s0, t1, 401
                  sltiu        t6, t4, -1875
                  fcvt.w.s     t5, ft4, rdn
                  fcvt.s.wu    fs6, zero
                  nop
                  srli         a3, a3, 15
                  fsgnj.s      fa5, ft2, fs0
                  fcvt.w.s     t3, fs7, rmm
                  nop
                  fclass.s     t4, ft7
                  nop
                  fmax.s       ft10, fs3, fs9
                  divu         t4, a6, a0
                  sra          s9, s6, a6
                  fmul.s       fs0, fs4, fs9
                  srli         t3, s8, 25
                  mulhsu       a1, s10, a5
                  slti         sp, t6, -99
                  srl          a5, ra, s3
                  fmul.s       fa5, fs0, ft9
                  auipc        s10, 400161
                  andi         s10, a5, 1619
                  or           a3, zero, t1
                  feq.s        s0, fs2, fa3
                  remu         s3, a0, s11
                  fcvt.s.wu    fa7, s0
                  slt          a4, s5, t2
                  sub          a6, t5, t2
                  fsub.s       ft4, fs0, ft7
                  sll          s5, t5, a3
                  andi         tp, gp, -1193
                  fclass.s     t1, fa6
                  sll          s11, s6, s6
                  slt          s0, t1, t6
                  flt.s        a4, fa5, ft1
                  xor          gp, t3, a5
                  fmul.s       ft5, fa7, ft0, rmm
                  sll          s2, s2, a7
                  srli         a6, s1, 19
                  fle.s        s3, ft10, fs10
                  slti         t0, a5, 124
                  or           s1, s3, s0
                  fsgnjx.s     ft3, fa4, ft7
                  slli         gp, t0, 24
                  feq.s        s0, fs8, fs5
                  fsub.s       ft6, fa2, fs11, rmm
                  sll          s3, s4, s0
                  nop
                  xori         t4, s10, 1555
                  xor          a2, t6, zero
                  addi         a3, s9, -1048
                  fmul.s       fs2, ft2, fs9, rne
                  fmv.w.x      fs2, zero
                  srli         zero, s5, 5
                  slti         tp, t0, 332
                  rem          t4, s5, a2
                  sra          ra, t0, a3
                  ori          a5, t6, 867
                  feq.s        t3, fa4, fs6
                  fmin.s       fs9, ft8, fs4
                  fsub.s       fs8, fs4, fs8, rtz
                  flt.s        s8, fs11, ft0
                  flt.s        t3, ft10, ft8
                  fcvt.wu.s    sp, fa1, rne
                  divu         s10, s10, gp
                  fcvt.s.wu    ft2, t6, rmm
                  mulh         t0, gp, s11
                  nop
                  lui          s11, 586598
                  fcvt.wu.s    zero, ft5, rmm
                  or           a2, a3, a0
                  srai         t1, a5, 18
                  mulhu        t4, a3, t4
                  fcvt.s.wu    fs8, tp, rmm
                  fmul.s       fs8, fs5, fs8
                  slli         a0, t4, 31
                  sltiu        t6, s11, -337
                  fmul.s       ft0, fa6, fs5
                  fsgnj.s      fs11, fs5, fa5
                  div          a5, s1, t5
                  sub          a2, zero, t0
                  auipc        s1, 567662
                  auipc        zero, 871964
                  xori         tp, ra, 1709
                  xori         a5, t2, 763
                  sltiu        zero, t1, -663
                  or           tp, s0, t2
                  and          t5, a0, a2
                  fsgnjx.s     fa7, ft0, fa2
                  slt          t0, t2, s11
                  mulh         t0, t2, s2
                  fmax.s       fa2, fa7, ft5
                  rem          s1, s6, s1
                  slli         s11, t4, 9
                  mulh         t0, a1, s1
                  or           a4, s1, t1
                  mulhu        s8, t2, zero
                  mulhu        s9, t5, sp
                  fdiv.s       fs4, fs10, fs0
                  mulhsu       tp, s11, a5
                  rem          ra, t3, t1
                  mulhsu       zero, s5, gp
                  srai         s2, s5, 29
                  addi         tp, t2, 454
                  fsub.s       fa0, fs0, fs10
                  sub          a1, t2, t1
                  fsqrt.s      fa2, fs4, rmm
                  addi         t1, a3, 1206
                  fadd.s       fa5, fa6, fa0, rdn
                  fcvt.s.wu    fa4, a2
                  fmv.x.w      a3, ft2
                  srai         s3, a5, 20
                  srl          gp, a4, s5
                  fsgnjx.s     ft9, ft8, ft0
                  fcvt.w.s     t0, ft4, rmm
                  mulhsu       a5, a2, a5
                  nop
                  slli         ra, a6, 9
                  fcvt.w.s     t3, fa5, rup
                  sll          s9, gp, a1
                  fsgnjn.s     fs4, ft1, fa6
                  auipc        a6, 475426
                  fcvt.wu.s    zero, fa3, rdn
                  addi         t2, tp, -105
                  fsub.s       ft4, fa7, ft1
                  mulh         s8, s3, a7
                  slt          t0, gp, s10
                  fmul.s       fa1, ft8, ft8, rne
                  sltu         s5, s0, a7
                  fcvt.w.s     a1, ft11, rtz
                  sltu         ra, s0, t0
                  fmin.s       fa0, ft5, ft10
                  xori         s5, sp, 1210
                  fadd.s       fs8, fs9, ft8
                  fdiv.s       fs6, fa3, fa5
                  fadd.s       ft10, fa0, ft5, rup
                  fsub.s       fa6, fs8, ft0
                  fclass.s     t1, fs9
                  fsub.s       fs10, fa2, fa4, rne
                  srai         a3, gp, 31
                  divu         s0, a3, a2
                  srli         t1, s7, 20
                  remu         s0, t4, s5
                  addi         t6, ra, 1667
                  div          t5, gp, t5
                  fcvt.s.wu    fs3, t6, rtz
                  rem          s8, s2, s9
                  fcvt.w.s     tp, fs0
                  sltiu        t3, a5, -297
                  xori         zero, t2, -180
                  fdiv.s       ft10, fa7, fa4
                  auipc        s3, 505569
                  sll          a5, a2, s4
                  srai         t6, ra, 20
                  sltu         zero, t4, a3
                  fmax.s       fs8, ft7, fa0
                  mulhu        t0, ra, t4
                  flt.s        s4, fs4, fs5
                  slti         t2, t3, -1166
                  auipc        t4, 212929
                  fsgnjx.s     fs3, fa4, fa5
                  mulhsu       a5, s11, s3
                  addi         s4, a7, -1157
                  fmv.x.w      a2, ft5
                  rem          ra, a0, t6
                  fmax.s       ft3, fs6, ft5
                  slti         s10, t3, 1929
                  mul          a1, ra, s6
                  mul          s2, sp, t2
                  fsgnjn.s     ft3, ft6, fa1
                  nop
                  fcvt.w.s     s10, fs7, rdn
                  fsub.s       ft1, ft3, fa5
                  xori         s1, t4, 1388
                  fcvt.w.s     s2, fs9
                  slt          s0, a3, tp
                  sra          zero, t1, a5
                  andi         a3, tp, 741
                  lui          s0, 500025
                  auipc        zero, 753499
                  xori         t3, t4, 320
                  xori         a6, a7, 154
                  fsub.s       ft0, ft5, ft0, rdn
                  fmv.w.x      ft6, sp
                  auipc        s10, 810465
                  div          ra, s6, a1
                  nop
                  srl          t2, s9, t3
                  mulh         gp, s11, s10
                  slli         s1, s9, 15
                  mulhsu       s1, ra, a6
                  addi         s2, a4, 1127
                  addi         s0, s4, -1825
                  fcvt.s.w     ft6, s8, rne
                  sra          t6, a4, s10
                  mulhu        t4, tp, t2
                  nop
                  auipc        s1, 514942
                  lui          a6, 812716
                  andi         s11, a2, -822
                  fmax.s       fs5, ft0, fs5
                  sltu         gp, a1, s2
                  sub          tp, t5, a1
                  slli         s4, gp, 0
                  slti         s0, s4, 683
                  fmul.s       ft9, ft8, ft11
                  slt          t6, zero, s1
                  mulhsu       a6, a2, zero
                  slt          s5, t0, a6
                  sll          a2, a1, t2
                  lui          a2, 412578
                  sltiu        s9, a6, 186
                  sub          zero, gp, s8
                  fcvt.w.s     t2, fs9, rdn
                  fsub.s       ft4, ft1, fa0
                  ori          t3, s10, -889
                  fmv.x.w      a2, fs11
                  or           t2, s5, s10
                  sltiu        t2, s4, -492
                  fclass.s     a4, fa0
                  sll          a3, s7, t6
                  fsgnj.s      fs0, fs8, fs0
                  xor          t0, s11, a4
                  nop
                  auipc        t5, 863479
                  div          s8, s3, s3
                  lui          s1, 756136
                  srl          s5, s10, s3
                  andi         t1, s9, 1268
                  sltu         s9, a3, a2
                  sra          s3, s10, tp
                  sltiu        s11, t0, 1777
                  fcvt.wu.s    a1, ft4
                  sll          t4, s6, sp
                  sll          tp, t1, t6
                  andi         a5, s1, -1563
                  fclass.s     t5, fa7
                  fsqrt.s      ft1, fs6, rdn
                  auipc        s0, 662644
                  fmul.s       fs10, fs9, ft4, rup
                  mul          zero, t5, t2
                  ori          a0, a6, 1666
                  lui          t2, 453281
                  srai         s8, zero, 15
                  srli         s9, a5, 2
                  xor          t1, s4, s3
                  srl          s0, s9, a1
                  addi         s9, s8, 948
                  fsgnjx.s     ft7, fa3, fs9
                  slti         gp, s9, 216
                  fmul.s       fs4, ft9, fa4
                  fsqrt.s      fa1, fs1, rmm
                  fsgnjx.s     ft5, ft0, fs10
                  div          t0, s3, ra
                  sltu         a3, a4, t1
                  fcvt.s.wu    fa6, ra, rtz
                  fcvt.w.s     s5, ft5
                  sll          zero, s11, sp
                  xor          ra, sp, t2
                  fcvt.w.s     s10, fa5, rne
                  nop
                  fsgnj.s      fs9, ft3, fs0
                  srli         s9, a2, 23
                  sltu         ra, s2, t4
                  fsgnjx.s     ft11, fs7, ft10
                  slli         s0, sp, 17
                  div          sp, t3, t4
                  fcvt.s.w     fa3, s5
                  fmin.s       ft4, ft9, ft11
                  divu         t1, s4, t1
                  slt          s11, t2, gp
                  auipc        tp, 904103
                  fsqrt.s      fs6, fa0, rne
                  srli         s8, gp, 7
                  fsgnjx.s     ft11, fa4, fs5
                  fmv.w.x      ft10, a4
                  sub          t6, a3, s6
                  xori         a4, s6, 1718
                  sll          sp, a1, zero
                  lui          a6, 422169
                  fcvt.s.wu    fa5, zero, rmm
                  srl          t5, a7, s0
                  slli         sp, s1, 5
                  nop
                  mulhsu       s9, zero, s10
                  fcvt.w.s     t0, ft3, rtz
                  mulh         a3, t3, gp
                  ori          s5, zero, 181
                  ori          s9, a4, -946
                  fclass.s     s10, fs11
                  or           sp, s3, s4
                  addi         tp, a5, -624
                  div          a1, a5, s11
                  xor          zero, t4, a1
                  remu         t4, s5, s3
                  andi         s11, s8, 308
                  sltu         a4, s10, s11
                  fsgnjn.s     fa1, fs3, fs6
                  slt          sp, a5, a6
                  sub          tp, s5, a1
                  andi         t4, gp, -811
                  fsgnjx.s     ft6, ft5, fa4
                  fmax.s       fs6, fs8, fa3
                  sltu         s5, t6, t0
                  fsqrt.s      fa3, ft5, rdn
                  remu         zero, s4, s8
                  slli         a1, a7, 0
                  sub          a2, s5, t3
                  div          t3, sp, s8
                  fcvt.w.s     sp, fa0, rtz
                  fclass.s     s2, fs11
                  fmv.x.w      a4, ft6
                  sltu         s8, gp, a5
                  srl          t3, sp, s0
                  divu         a1, t2, s0
                  fcvt.s.wu    ft5, a0
                  slt          s10, a2, s7
                  srli         s0, s0, 2
                  fmax.s       ft2, fs0, fs1
                  flt.s        a2, fa6, ft11
                  remu         s2, s2, t2
                  fclass.s     sp, ft10
                  mulhu        sp, s9, t0
                  div          a6, t5, t4
                  xori         s10, s9, -1199
                  fsgnjn.s     ft0, fa3, fs11
                  fsgnjx.s     ft8, fa7, fs4
                  fsub.s       ft9, fa6, fs1
                  fcvt.s.wu    ft6, a5
                  divu         s3, zero, t6
                  flt.s        s8, ft10, ft9
                  mul          s8, s11, s4
                  slli         t6, s9, 12
                  srl          s3, s8, a7
                  divu         t5, s11, sp
                  ori          tp, tp, 613
                  divu         a5, s10, t6
                  sltiu        s8, tp, 832
                  fsgnj.s      fs2, ft4, ft2
                  rem          a5, a1, t2
                  fsqrt.s      fs9, ft1, rmm
                  xori         a0, s8, 395
                  fmv.x.w      t2, fs7
                  sub          t2, s0, a0
                  feq.s        a2, fs1, fs7
                  fclass.s     s9, fa6
                  sll          a6, s11, s6
                  fcvt.wu.s    t5, fs10, rne
                  fadd.s       ft1, ft3, ft2, rne
                  fdiv.s       ft0, fa5, fa7, rdn
                  auipc        zero, 250721
                  and          s4, t4, a0
                  fsqrt.s      fs7, ft3
                  fadd.s       ft0, fs5, ft1, rdn
                  fclass.s     t3, ft5
                  fsgnjx.s     fs0, fa0, ft4
                  auipc        a2, 319181
                  fadd.s       ft3, ft8, fs8
                  srai         s10, t0, 1
                  fcvt.s.wu    fs3, a3, rtz
                  addi         a6, t2, 1613
                  sltu         ra, a2, a6
                  fsgnjn.s     fa7, ft1, ft6
                  slti         a0, s4, 1694
                  slti         a3, a1, 884
                  and          t1, s5, a5
                  nop
                  fsgnjx.s     ft0, fs1, fa1
                  flt.s        t3, fs8, fa0
                  fmin.s       ft3, ft6, fs3
                  lui          ra, 846822
                  fmin.s       fs8, ft1, fa3
                  divu         gp, t6, a5
                  feq.s        ra, fs6, fa5
                  fclass.s     s9, fs10
                  fcvt.wu.s    s10, fs5, rup
                  auipc        t5, 323991
                  fsgnj.s      fs11, fs6, fs4
                  fmv.w.x      fs0, a3
                  fle.s        t3, fa5, fs3
                  lui          t3, 318585
                  slli         s0, a5, 5
                  fcvt.w.s     a2, fs7
                  sub          s2, s0, s1
                  mulh         gp, t1, t5
                  xor          t2, ra, tp
                  sll          zero, s0, a7
                  fle.s        ra, ft4, fa3
                  nop
                  fclass.s     s1, fs4
                  xori         s10, s10, -558
                  fadd.s       ft5, ft9, ft1, rup
                  fsgnjn.s     ft9, ft11, ft10
                  add          a5, s1, a1
                  slt          s3, s8, t6
                  or           zero, a0, s1
                  auipc        a3, 137159
                  sltu         s11, s6, s7
                  div          a2, sp, zero
                  add          s5, t2, s7
                  fsgnjx.s     fs9, fs2, fs8
                  andi         a4, s10, 1955
                  mulhu        t2, s8, a6
                  fcvt.s.w     fs2, s0
                  fmv.x.w      a1, fa0
                  xori         a6, a3, -585
                  sltiu        s2, s7, -1410
                  fmv.x.w      s1, fs7
                  fadd.s       ft6, ft6, fs3, rtz
                  fmin.s       ft4, fs7, fa0
                  fcvt.w.s     tp, fa1
                  lui          t1, 755255
                  fcvt.wu.s    s8, fs11, rdn
                  slt          a6, s2, ra
                  fle.s        t2, ft7, fs5
                  srai         t0, s9, 26
                  addi         a3, a4, -1089
                  div          tp, t0, a4
                  srli         t4, t3, 14
                  nop
                  fcvt.w.s     a6, ft9
                  flt.s        tp, fs2, fs2
                  lui          s10, 699067
                  srli         t4, s11, 13
                  mulhsu       s1, t3, a2
                  sub          s2, s8, s6
                  fcvt.w.s     s11, fs10, rmm
                  srli         t0, t2, 25
                  xori         a3, s6, 1396
                  fsgnj.s      fs0, ft6, fs9
                  fmul.s       ft8, fs9, fs4
                  fsqrt.s      fs7, fs6
                  lui          s0, 133059
                  srl          a4, zero, s4
                  xori         a3, s11, 583
                  sra          t1, gp, s6
                  andi         a2, a1, -1671
                  remu         s4, s10, t2
                  addi         t3, a1, -1673
                  fsub.s       ft0, fs10, fs2
                  fmin.s       fs0, fa0, ft4
                  sub          a2, a6, tp
                  xor          a2, s10, a6
                  fcvt.s.wu    fs7, s2
                  flt.s        a2, fs5, fs0
                  ori          t2, t1, -507
                  sltiu        t0, a3, 1916
                  xori         zero, s5, -68
                  ori          s1, t3, 505
                  slt          s8, s1, gp
                  slti         t1, s0, -1127
                  fdiv.s       ft10, fs2, ft3, rup
                  fsqrt.s      fa2, ft1
                  xori         t3, a0, 1284
                  srli         s0, s8, 25
                  fsgnjx.s     fa5, ft2, fs2
                  fmax.s       fa5, ft5, fa4
                  nop
                  sub          t5, zero, t3
                  and          a1, t5, s5
                  remu         t6, t0, s5
                  fmv.w.x      fs11, a5
                  fsgnj.s      ft7, ft1, fs3
                  fclass.s     s2, ft10
                  fcvt.wu.s    t4, ft6, rmm
                  fcvt.s.wu    fa6, s6, rdn
                  fmul.s       fa0, fs10, fa2, rmm
                  add          s8, t2, s5
                  div          a5, a3, s9
                  fmax.s       fa1, ft11, fa0
                  auipc        s5, 420493
                  nop
                  ori          a1, s6, -47
                  xor          s5, t1, t2
                  andi         sp, zero, -1528
                  rem          t4, s4, s8
                  fmv.w.x      fs1, gp
                  fcvt.s.w     fa6, a1, rdn
                  andi         a6, zero, -207
                  lui          a2, 151131
                  or           s2, a1, a0
                  flt.s        a6, fa0, fa3
                  mulhsu       t4, s11, ra
                  rem          a2, s7, t2
                  div          s11, a5, a3
                  divu         a4, a2, s0
                  auipc        s2, 791158
                  mulh         t2, a4, t1
                  mulh         t4, t5, ra
                  xor          ra, a5, t2
                  fdiv.s       fs11, fa2, fa6
                  addi         a6, s3, -628
                  fcvt.w.s     a5, ft9, rne
                  fmax.s       fs7, fs1, fs5
                  fmin.s       ft6, fs4, fa5
                  fdiv.s       fs3, ft1, ft7
                  mulhu        a6, ra, ra
                  sub          a5, a4, t3
                  fcvt.s.w     ft1, s10, rne
                  rem          a6, t5, a0
                  lui          a6, 854299
                  flt.s        sp, ft3, fs4
                  fmin.s       fs5, fs9, ft9
                  and          a0, s6, s2
                  addi         s8, zero, -1459
                  fadd.s       ft7, ft8, fs4, rne
                  fclass.s     sp, ft11
                  fmv.x.w      t3, fs10
                  lui          a0, 435296
                  add          s10, s8, sp
                  lui          a2, 210808
                  or           a0, a1, t3
                  fsgnjn.s     fa4, fs8, fa2
                  nop
                  srai         t4, s5, 20
                  xor          t1, ra, t5
                  mulh         s1, s10, ra
                  fcvt.wu.s    s10, ft9, rmm
                  flt.s        a4, ft8, fa0
                  xor          s5, s10, s1
                  mulh         s9, s3, t3
                  ori          s4, t6, 936
                  srai         a1, a2, 7
                  fsgnj.s      ft5, fa3, ft5
                  slt          sp, tp, a6
                  fmv.w.x      fs1, t2
                  fmin.s       fs3, fa6, fa1
                  add          t2, t1, s4
                  fadd.s       ft5, ft4, fs10, rdn
                  fcvt.w.s     s2, ft11
                  fsgnjn.s     ft0, fa4, fs7
                  mulhu        a4, s11, t2
                  fsgnj.s      fs4, ft7, ft1
                  fcvt.s.w     ft3, s7, rmm
                  srli         t3, sp, 18
                  fmax.s       fs2, fa3, fa0
                  slli         s8, a0, 27
                  fcvt.s.w     fs10, zero
                  rem          t3, s8, s4
                  srai         a0, gp, 5
                  auipc        s4, 308985
                  slt          a1, s1, tp
                  addi         zero, sp, -1295
                  srl          t3, t1, s10
                  xor          a1, a3, gp
                  slti         gp, a1, -773
                  fclass.s     zero, ft8
                  fcvt.wu.s    s0, fs1
                  fmin.s       fa2, ft2, fs1
                  div          t2, t0, s10
                  and          s2, s11, s1
                  fsgnjn.s     fs10, fa0, fs8
                  mulhu        a1, a6, a6
                  mulh         tp, a3, s9
                  sltiu        s8, a0, -2026
                  nop
                  andi         a6, s0, 1574
                  slt          t5, t5, s11
                  andi         s3, s2, 1466
                  fmv.x.w      s8, ft3
                  fmin.s       fs3, ft6, fs3
                  andi         s11, t4, -435
                  div          s9, zero, s8
                  fsgnjn.s     ft6, ft6, fs7
                  fmul.s       ft3, ft8, fs11
                  fcvt.wu.s    tp, ft6
                  fle.s        s9, ft4, ft7
                  fcvt.s.w     ft9, a7
                  fclass.s     a0, fa5
                  ori          a2, zero, 333
                  xor          t6, a5, s10
                  mulhsu       t1, s2, s11
                  fsgnjx.s     fa0, ft4, fs9
                  andi         s11, sp, 6
                  and          a4, s1, t3
                  auipc        a3, 150266
                  slt          t1, s9, t3
                  andi         a5, s5, 1385
                  mulh         s5, s3, t2
                  lui          sp, 535332
                  mulhu        zero, t5, t2
                  mulhu        s3, t5, t5
                  auipc        ra, 228396
                  fsub.s       fa7, ft11, ft1, rmm
                  sll          s9, a3, a1
                  nop
                  rem          a5, gp, s7
                  flt.s        s2, ft1, fs6
                  mul          t5, a7, t6
                  ori          s0, a0, 661
                  mulhsu       a3, a6, s3
                  sltu         t4, t3, a5
                  or           s2, zero, t5
                  add          s8, s7, a1
                  fcvt.w.s     a3, fs5, rtz
                  fsub.s       fs5, ft4, fs0, rne
                  xor          t6, t1, a4
                  fsgnjx.s     fa6, fs1, fa3
                  or           s10, s10, s3
                  nop
                  flt.s        s8, fa7, ft4
                  div          gp, t0, a2
                  fmin.s       ft8, fs2, fa0
                  sll          a6, s8, t1
                  sub          s4, s11, a1
                  fdiv.s       fa5, fa1, fa3, rtz
                  mulh         t1, s9, s9
                  addi         gp, t4, 1810
                  fmul.s       fs1, ft11, ft1, rdn
                  flt.s        zero, fa2, fs4
                  fmv.x.w      s1, fs8
                  addi         t5, s2, 638
                  fmv.w.x      fs5, t1
                  sll          s8, t5, a4
                  fcvt.s.wu    fs3, ra
                  slli         s10, s11, 16
                  slti         zero, a7, 280
                  rem          t3, s8, t5
                  mulhsu       a6, a0, t5
                  fmv.x.w      s9, ft3
                  mulhsu       zero, s0, s6
                  fadd.s       ft5, fa6, fa4, rmm
                  srl          a5, s7, sp
                  fcvt.w.s     t1, fs4
                  srl          s1, s1, sp
                  add          t0, a6, a4
                  srli         a3, t6, 17
                  feq.s        zero, ft5, ft10
                  slt          t4, a5, a4
                  nop
                  remu         ra, a2, s10
                  xori         t6, a1, 41
                  sll          ra, s1, s3
                  lui          tp, 282893
                  fdiv.s       ft3, fa4, ft8
                  auipc        s10, 265357
                  addi         a5, s6, -317
                  add          s3, s5, t3
                  sub          s0, s0, a2
                  fsgnj.s      ft5, fs4, ft0
                  fmin.s       fs3, fa3, fs5
                  rem          a2, s2, tp
                  lui          t6, 899121
                  xor          t3, s11, a4
                  sra          sp, a1, a0
                  flt.s        t0, ft4, ft11
                  fsqrt.s      ft10, ft2
                  fmv.w.x      ft8, a3
                  xori         s4, a6, 786
                  srai         t6, s10, 13
                  fsgnjn.s     fs9, fa2, fs4
                  sltu         s5, s1, ra
                  andi         s4, a1, 1341
                  fcvt.s.wu    fs3, s10
                  srli         s10, ra, 27
                  fcvt.s.w     fs2, t0
                  feq.s        s10, fs0, ft0
                  srli         s4, s2, 14
                  srli         s5, sp, 21
                  fsqrt.s      fa7, ft3, rup
                  fadd.s       ft6, fa7, ft10
                  fle.s        s1, ft2, ft4
                  fsgnjn.s     fs5, ft2, fs5
                  fcvt.w.s     t4, fa2
                  sltu         a6, s8, zero
                  sltu         s4, s2, s0
                  ori          tp, a0, -456
                  ori          gp, t4, -594
                  flt.s        a6, ft6, ft6
                  slt          t0, s10, s3
                  fcvt.s.wu    fa4, s2
                  fsgnjn.s     fa0, fa5, fa7
                  fcvt.s.w     fa1, tp, rmm
                  fsgnjx.s     fa6, fs7, ft11
                  fmax.s       ft1, fs10, ft3
                  auipc        s5, 950526
                  addi         a2, a0, -1141
                  xori         t1, s9, -1509
                  sltu         t5, s4, s9
                  fmin.s       ft10, ft0, ft11
                  sltiu        s8, gp, 1186
                  feq.s        a6, fs10, fs7
                  divu         a5, ra, a6
                  nop
                  sll          a0, s2, t1
                  fcvt.wu.s    a1, fs4, rne
                  add          gp, zero, s3
                  add          s2, s0, s8
                  mul          t2, zero, s4
                  or           s11, s2, tp
                  xori         a1, s11, -54
                  xori         zero, s0, 1819
                  sltu         sp, a3, t5
                  mulhsu       s8, s11, tp
                  srl          t6, ra, a7
                  flt.s        a5, fs2, fa2
                  fsgnj.s      fa1, fa6, ft10
                  fcvt.s.wu    fs3, s11, rup
                  fsgnj.s      fs3, fa2, ft6
                  fsub.s       ft5, fs8, fa0, rmm
                  fcvt.s.wu    ft7, s11
                  fsqrt.s      fa1, fs10, rne
                  sll          gp, s0, a3
                  fmv.x.w      a5, fs3
                  fcvt.wu.s    s0, ft1, rmm
                  auipc        t6, 847269
                  lui          sp, 1005914
                  fsub.s       fs5, ft3, ft8
                  andi         tp, a7, -1171
                  fadd.s       ft10, ft4, ft7, rdn
                  mulhu        t4, s9, sp
                  fsgnjx.s     ft0, ft3, ft7
                  slti         t0, a3, -1443
                  srai         a3, t6, 27
                  fmv.x.w      a0, ft1
                  slli         s3, s7, 1
                  sll          a4, a1, tp
                  fmv.w.x      ft9, t4
                  fcvt.wu.s    a4, fa2, rdn
                  auipc        a5, 538240
                  flt.s        t4, ft11, fs11
                  feq.s        zero, ft10, fs8
                  ori          s9, s4, -217
                  sltiu        gp, s6, 1477
                  divu         s8, a5, a6
                  fclass.s     s10, ft7
                  ori          t5, s9, 1207
                  andi         s4, a5, 1438
                  lui          s10, 128137
                  sll          a4, a3, a7
                  andi         a3, t1, 394
                  fmax.s       fa7, fa5, fs1
                  or           s11, t1, s6
                  xori         a5, s3, -1074
                  sltu         s4, a6, a0
                  fmax.s       ft11, ft0, fs10
                  fsqrt.s      fs7, fa6
                  nop
                  xor          tp, a1, s1
                  xori         tp, s2, 1233
                  fsqrt.s      ft5, fa3
                  ori          s1, s1, 1608
                  fmul.s       fs11, fs3, fa1
                  div          t3, a6, s3
                  sub          t2, t6, a0
                  ori          zero, s4, 323
                  ori          a1, s9, -776
                  srli         s11, s6, 15
                  fsub.s       ft7, fs1, fs11
                  slti         t3, s9, 1614
                  fcvt.s.wu    fa2, a7
                  slti         s5, s0, 39
                  flt.s        t2, fs3, fa2
                  lui          t0, 1023412
                  sub          s4, s9, s0
                  div          a4, a0, s1
                  div          a5, s2, t4
                  xor          t6, a7, t5
                  and          s4, s5, a6
                  or           a0, sp, s3
                  andi         t0, s10, 478
                  fsgnjx.s     fs2, ft9, fs6
                  auipc        t0, 746025
                  fadd.s       fs3, ft10, fs5, rne
                  fmv.w.x      fs10, s6
                  remu         gp, s7, a0
                  srai         tp, s5, 20
                  fadd.s       ft7, fs11, ft1, rne
                  fadd.s       fa0, ft2, fa2
                  ori          zero, ra, 963
                  sll          a6, s11, gp
                  fdiv.s       ft8, fa3, ft0
                  fsgnjn.s     fa3, fa0, fs4
                  slti         t3, zero, -462
                  fmv.x.w      s1, ft7
                  nop
                  slt          sp, s3, a0
                  xori         a5, t1, -1157
                  sub          t0, s3, s11
                  xori         tp, s9, 2005
                  fcvt.s.w     fs4, t0
                  srl          s1, s6, a4
                  srai         sp, a3, 13
                  fsqrt.s      ft2, fa7
                  slli         zero, a3, 23
                  fdiv.s       fa1, ft7, fa2
                  fcvt.w.s     a6, ft9, rtz
                  sltiu        s10, zero, 297
                  mul          a4, s6, a3
                  fcvt.wu.s    a5, ft3
                  sll          a2, a2, s5
                  srli         sp, s6, 23
                  fsgnj.s      ft11, fs3, ft0
                  fcvt.s.w     fa1, s0
                  fdiv.s       fs2, ft11, fs4, rtz
                  slli         s5, t5, 7
                  fcvt.w.s     s3, ft4, rmm
                  fmv.x.w      t6, fa3
                  flt.s        sp, fs8, ft4
                  sltu         s11, a1, zero
                  or           s5, a5, t5
                  fdiv.s       ft1, fa2, fs5, rmm
                  fcvt.w.s     a6, ft5
                  feq.s        t3, fa2, fa4
                  fmax.s       ft7, ft10, ft8
                  sltu         t6, t6, s1
                  sra          s0, s10, t6
                  sll          a0, t0, a0
                  mulh         t2, s6, t6
                  fclass.s     s4, ft6
                  fsgnjx.s     ft1, fs7, fa0
                  nop
                  xori         s2, ra, -1043
                  slt          a0, ra, s10
                  sltu         a4, a3, a2
                  fsgnjn.s     fa4, fs1, fs2
                  sub          t6, t5, a2
                  addi         t5, t4, 34
                  fcvt.s.wu    ft1, a2
                  sltiu        a3, a6, 542
                  andi         s0, a2, -1514
                  sll          a4, s4, sp
                  nop
                  fmul.s       fs3, ft4, ft6, rne
                  fdiv.s       ft6, fs0, ft8, rmm
                  fadd.s       fs1, ft7, fa5
                  divu         t2, t6, t3
                  fmul.s       fa6, ft1, fa4
                  flt.s        t1, fs8, ft5
                  or           sp, t2, s8
                  nop
                  lui          a5, 598642
                  sll          a6, gp, a3
                  lui          s10, 727867
                  sltiu        a2, a6, -1127
                  fsgnjx.s     ft7, ft4, fs9
                  fcvt.w.s     t3, fa3, rup
                  fclass.s     t3, ft4
                  fsgnjn.s     ft2, fa5, fs3
                  slli         t6, a0, 23
                  add          tp, a4, s9
                  divu         zero, a7, s3
                  fsub.s       ft2, fs11, ft8
                  slli         s4, t6, 0
                  fsgnjx.s     fs10, fa3, fa4
                  feq.s        s2, ft10, fa5
                  fmul.s       ft9, ft4, fa3
                  feq.s        s10, ft2, ft9
                  fcvt.w.s     s8, ft9, rmm
                  slti         s10, s3, -762
                  slti         s2, tp, -1354
                  xor          zero, s1, s8
                  fcvt.s.w     fa2, s10, rdn
                  or           a6, s10, tp
                  srli         t0, s7, 27
                  divu         s0, ra, t3
                  divu         s1, t3, t4
                  feq.s        a3, fa1, fs2
                  and          gp, t5, s7
                  fdiv.s       fs7, ft10, fs7
                  xori         a3, t6, 1505
                  addi         s11, a4, 1476
                  addi         s5, a0, 666
                  fcvt.wu.s    sp, fs1, rne
                  fsgnjn.s     fa3, fs8, ft10
                  rem          a0, s9, t4
                  andi         t5, s3, 71
                  fadd.s       fa7, fs8, fs2, rup
                  slti         a5, s4, -153
                  divu         a1, t5, s4
                  srl          gp, gp, a3
                  fsgnjx.s     ft3, ft7, ft1
                  srl          s3, ra, s0
                  slt          t5, a5, t2
                  auipc        t0, 119242
                  fmv.w.x      fa7, s10
                  fsqrt.s      ft4, fs4, rne
                  addi         t2, a6, -808
                  fsgnj.s      fs0, fs1, fa3
                  slt          s0, a2, gp
                  fsqrt.s      fa5, ft8
                  mulh         t1, a6, a4
                  flt.s        tp, fa1, fs6
                  fle.s        s2, fs5, fa0
                  fsgnjn.s     ft3, ft7, fs10
                  and          a0, a5, a1
                  mulhsu       a2, zero, s11
                  fsgnj.s      ft3, fa7, fa6
                  ori          a4, s6, -1121
                  srai         a5, a5, 29
                  addi         s10, tp, -760
                  srli         s3, ra, 11
                  mulhsu       t1, a0, a7
                  fle.s        s8, fa6, ft9
                  divu         a0, t2, s8
                  fsqrt.s      ft10, fs6
                  fmv.w.x      fs7, a3
                  sub          s10, s3, t0
                  or           t0, sp, a4
                  fmv.w.x      ft3, s5
                  sub          gp, s9, a7
                  addi         s2, s2, 221
                  fmv.w.x      ft2, tp
                  fsgnj.s      fa5, fs7, fa0
                  srai         a1, gp, 18
                  or           s9, zero, s6
                  fcvt.s.wu    ft11, t4, rup
                  srl          a0, t3, s4
                  mulhu        t4, s1, s7
                  slli         t5, s0, 5
                  sra          ra, a7, t0
                  srai         s0, ra, 22
                  xori         s11, a6, -1040
                  or           zero, a2, t0
                  fsgnj.s      ft5, fs3, fa0
                  div          a2, t1, s3
                  fle.s        a6, ft8, ft10
                  slli         a4, sp, 11
                  addi         s0, a4, 498
                  fsqrt.s      fa0, ft10
                  auipc        s5, 96434
                  sll          a2, a5, s9
                  ori          s2, gp, 1881
                  slti         a6, t5, 439
                  div          tp, a7, a1
                  slt          a4, t4, a3
                  fcvt.s.w     ft9, t0, rdn
                  sll          t6, a2, s3
                  fadd.s       ft1, ft0, fs3
                  or           s0, s6, t6
                  addi         tp, t3, -1590
                  fcvt.wu.s    t6, ft6, rup
                  flt.s        t0, ft0, fa1
                  sll          t5, sp, t6
                  ori          ra, s3, 1236
                  srai         t0, tp, 0
                  srli         a1, zero, 7
                  mul          t5, t1, ra
                  slli         a5, a5, 26
                  auipc        a4, 924852
                  ori          s8, zero, -1784
                  sra          zero, a0, a1
                  sltu         s8, s5, sp
                  or           s3, tp, tp
                  fmv.w.x      ft6, s2
                  mulh         s1, s3, tp
                  auipc        s0, 541619
                  mulh         t0, s1, s1
                  sltu         s2, t4, a3
                  sltu         tp, t2, t5
                  fsgnjn.s     fa7, ft4, ft3
                  fcvt.s.wu    fs1, t1
                  addi         s5, s0, 172
                  fle.s        sp, ft7, fa2
                  mulh         sp, s7, t1
                  rem          t3, s3, a0
                  mulhsu       a6, a7, tp
                  fle.s        ra, ft5, fs4
                  fsgnjn.s     ft2, fa2, fs2
                  srl          t3, a4, a6
                  sll          a0, t4, s8
                  fdiv.s       ft5, fs2, fs9, rtz
                  fsgnjn.s     fa0, fa2, fs0
                  fmv.x.w      a3, ft6
                  addi         tp, t3, -1798
                  ori          a2, t5, -324
                  fsgnj.s      fs6, fa5, fs4
                  slli         tp, a2, 25
                  remu         s5, a7, s0
                  remu         a3, s1, tp
                  fadd.s       fs10, ft10, ft11
                  xori         a5, t2, 1957
                  fmul.s       ft5, fa6, ft9
                  xori         a2, a2, -455
                  sll          a2, a5, s8
                  sltiu        a0, tp, 1696
                  xori         s3, a0, 783
                  or           ra, s8, s7
                  fle.s        t4, fa2, fa6
                  sra          s10, tp, s11
                  fmul.s       fa2, fa1, ft6
                  fsqrt.s      fa2, fs0, rne
                  or           t1, sp, s4
                  sub          s11, s9, s4
                  or           a3, a6, a4
                  mulh         gp, s4, t5
                  fmax.s       fa5, ft2, fs4
                  sltu         a6, s9, a5
                  fsgnjx.s     fs4, fa7, fa2
                  fmv.x.w      t1, fs8
                  slti         sp, s3, 1921
                  slli         t3, t1, 15
                  sra          t2, zero, t0
                  mulhu        s1, a7, gp
                  addi         ra, sp, -851
                  andi         t3, s2, 905
                  slti         a0, a5, -422
                  fcvt.s.wu    fa3, a1
                  fmv.x.w      zero, ft11
                  srai         s8, a5, 16
                  fsgnjx.s     fa5, fa3, fa3
                  fcvt.wu.s    a1, fs0, rdn
                  xor          t5, a3, s10
                  sra          s3, s4, tp
                  slli         t0, a7, 8
                  srl          s0, s2, s5
                  srli         tp, s5, 23
                  slti         s5, a5, 372
                  fsgnj.s      fs10, ft7, fa7
                  slli         a6, a0, 5
                  fmin.s       fa5, ft9, fa6
                  addi         tp, t1, 157
                  srl          t5, t4, a1
                  xor          s11, a6, gp
                  sra          t5, t4, zero
                  fcvt.wu.s    a3, ft2
                  fmv.x.w      a0, ft9
                  srai         t6, s7, 3
                  rem          t6, t3, t5
                  fsgnj.s      fa6, fa2, ft0
                  addi         a0, a4, -58
                  sra          a1, t0, t2
                  addi         a4, s7, 812
                  xori         a4, t6, 1841
                  fcvt.w.s     zero, ft10
                  divu         s0, a2, t1
                  fsub.s       ft0, fs6, fs2, rdn
                  mulh         t6, t6, t3
                  mulhu        s10, zero, s6
                  slt          zero, s8, a4
                  fsub.s       fa7, fs1, ft7
                  div          a5, t4, t6
                  add          s10, sp, zero
                  fcvt.w.s     t0, fs3
                  fmin.s       ft9, ft1, ft8
                  ori          t0, t6, -810
                  fsgnj.s      ft0, fs4, fs5
                  srli         s8, s3, 15
                  fclass.s     a3, ft10
                  fsub.s       fs3, fs10, ft11, rup
                  fmin.s       fa5, fa5, fs9
                  srai         s3, s1, 7
                  div          s5, tp, a6
                  mulhsu       ra, t0, t4
                  sub          s3, t2, a2
                  xori         s0, a2, -1142
                  slti         s10, s5, 838
                  fmv.x.w      s11, fa6
                  rem          s0, tp, a4
                  fcvt.w.s     a0, fs0
                  feq.s        ra, fa4, ft4
                  xori         s8, s0, 975
                  div          s4, a5, a1
                  and          a3, s1, t3
                  feq.s        t3, ft7, fs10
                  fcvt.w.s     t1, fs9, rne
                  andi         t4, a0, 438
                  fle.s        s11, fs9, fs3
                  fmax.s       ft2, ft2, fs6
                  flt.s        a2, ft2, ft5
                  or           a3, s5, a6
                  mulhu        t6, a5, t6
                  fsgnjn.s     fa2, fs11, ft2
                  and          a6, s11, gp
                  fsgnj.s      fa6, fa7, ft10
                  flt.s        s5, ft11, fs9
                  sub          t0, s8, sp
                  sub          t3, s8, t5
                  xor          t3, a5, gp
                  srai         tp, t3, 11
                  add          tp, a0, t6
                  divu         s5, a0, s2
                  fle.s        zero, fa6, fs7
                  fmv.x.w      s2, fs7
                  srai         a1, a7, 20
                  mul          t3, s6, t2
                  srl          t0, a7, a4
                  rem          a4, a3, s5
                  fclass.s     gp, ft0
                  mulh         a6, tp, s8
                  mulh         s10, t2, a4
                  sra          s9, s6, t3
                  xori         gp, ra, 1128
                  fsqrt.s      ft1, fs2, rne
                  fcvt.w.s     s11, fa6, rne
                  mulhsu       t4, t0, a7
                  fle.s        a1, ft1, fs0
                  fcvt.w.s     s8, fs10, rne
                  sltiu        zero, s4, 1955
                  fadd.s       ft8, fs10, fa5, rtz
                  or           s9, s10, a7
                  addi         s8, t6, -1155
                  mul          zero, zero, zero
                  fsgnj.s      ft7, fs9, fs9
                  feq.s        t4, fs9, fs1
                  remu         a4, a2, t5
                  mul          a3, a3, s7
                  fsub.s       fa7, ft10, ft4
                  mulhsu       t2, t0, s3
                  fcvt.s.w     ft4, t0, rup
                  fclass.s     a0, fa3
                  fsgnj.s      fs7, fs3, ft7
                  mulh         s2, a0, tp
                  fmin.s       ft2, fa3, ft8
                  mulhu        s4, t1, a2
                  ori          a6, a5, -865
                  fsub.s       fa6, ft11, fs2, rdn
                  slti         s4, a7, 1662
                  auipc        s2, 445883
                  feq.s        t6, fs7, fa6
                  sra          sp, a5, a0
                  add          s3, s7, t2
                  fsgnj.s      ft8, fa7, fs2
                  sltiu        s0, s8, 1954
                  remu         t5, t0, t0
                  fmv.w.x      fs5, s0
                  rem          tp, t5, a7
                  srai         a4, t2, 26
                  add          s11, a1, s10
                  sub          t6, s6, s5
                  mulhsu       s11, a6, s11
                  fmax.s       fs8, fa5, fs1
                  mulhu        tp, a5, t1
                  slt          t5, s1, s9
                  fmul.s       fa0, fa5, fs3, rtz
                  div          t2, sp, a2
                  fcvt.w.s     a2, fs5, rup
                  fdiv.s       ft1, fa5, ft4
                  divu         s3, s6, gp
                  sltiu        a1, a0, 461
                  fmv.w.x      ft9, a4
                  fmul.s       fa4, ft6, fs5
                  fcvt.s.wu    fs7, s0, rup
                  mul          a0, zero, s7
                  fsqrt.s      fs0, fs8, rdn
                  sra          t5, sp, s11
                  lui          s10, 187409
                  divu         a5, s11, ra
                  sra          t5, s0, s7
                  and          gp, t2, t6
                  mulhu        gp, s5, ra
                  fmul.s       ft5, ft6, fs11, rdn
                  mulh         a5, a2, s3
                  fcvt.s.wu    fs2, s0
                  remu         t1, a0, t4
                  and          gp, t2, s9
                  fcvt.s.wu    ft10, a1
                  fclass.s     a5, fs9
                  fmv.w.x      fs2, a6
                  addi         t6, a6, 727
                  fmul.s       fa5, fs5, fs8
                  mul          t2, t4, s5
                  nop
                  fmv.x.w      t0, fs5
                  xori         a2, t5, 674
                  div          ra, a1, a3
                  xori         s1, a7, 484
                  fadd.s       fa7, ft1, fs9, rne
                  rem          a5, a4, s9
                  fle.s        a6, ft11, fs5
                  fdiv.s       fs6, fa5, ft0, rne
                  divu         t6, t4, s10
                  andi         s5, s7, 136
                  fdiv.s       fa7, fs10, fa2
                  divu         s4, s8, a7
                  fclass.s     ra, fs0
                  fclass.s     a0, ft4
                  fmul.s       fs5, ft3, fs5
                  fcvt.w.s     a1, fs2
                  fcvt.w.s     s8, fs6, rtz
                  and          s4, s10, s2
                  slt          t0, sp, s6
                  mulhu        s11, t3, a7
                  remu         t3, s1, t3
                  fcvt.s.w     fa5, t6
                  mul          s4, t4, a1
                  fmv.w.x      ft6, s5
                  remu         t5, a5, t0
                  andi         t2, s6, -1599
                  slt          s3, t1, a2
                  div          s1, a6, a5
                  sltu         a6, t2, a6
                  fmax.s       fs3, ft0, ft6
                  sub          a0, a5, s9
                  srai         t4, s10, 31
                  lui          s0, 668897
                  mulhu        gp, s1, a1
                  slli         t6, s11, 0
                  mulhu        a4, s5, s10
                  remu         a6, s10, a5
                  mul          a3, s7, t2
                  sub          s5, t4, a6
                  fmax.s       fs10, fs2, fa2
                  fsgnjx.s     ft0, fa5, fs3
                  and          s8, s5, s5
                  sub          a2, s0, t4
                  fsgnjn.s     fa2, ft3, fa7
                  sll          s5, s9, s4
                  fsub.s       fa3, ft11, fs1
                  srli         sp, s11, 21
                  mul          s9, sp, s11
                  remu         s2, s4, a7
                  fmv.w.x      fs2, ra
                  andi         s2, a7, 816
                  slli         zero, s7, 21
                  fcvt.wu.s    t4, fa2
                  fmul.s       fa4, ft5, ft11
                  add          s1, t3, t2
                  fsgnjx.s     fs1, fs0, fs7
                  fcvt.wu.s    t5, fa7
                  fmul.s       fs0, ft7, ft2
                  fmin.s       ft4, fs9, fs9
                  sltiu        s5, a2, 445
                  auipc        s4, 734877
                  andi         t0, a3, 378
                  sra          t6, a7, t6
                  fsgnj.s      ft7, fs2, ft3
                  addi         t5, a6, 1108
                  slti         s0, a1, 1454
                  nop
                  sltu         s3, t3, t2
                  add          ra, t2, a4
                  fcvt.s.wu    ft4, s0, rne
                  fsgnj.s      ft3, ft9, ft11
                  flt.s        s0, ft0, fs3
                  fsgnjn.s     fs1, fs0, fs3
                  fsgnjn.s     fs9, fs1, fs4
                  fmv.w.x      ft4, gp
                  fmul.s       ft11, fs11, fa6
                  slli         tp, s9, 8
                  nop
                  fcvt.s.wu    fa5, a1, rne
                  srai         s10, a2, 10
                  fsgnj.s      fa5, fs6, fa2
                  fmv.x.w      s9, fs8
                  mulhsu       tp, a6, a3
                  mulhu        s4, a5, s4
                  fle.s        a5, fs5, ft4
                  addi         s5, s11, 1705
                  slli         a1, a7, 27
                  addi         s8, s1, 968
                  fmul.s       ft0, fa0, fs10, rdn
                  feq.s        t1, fa3, fa7
                  auipc        a2, 325956
                  mul          s5, t3, gp
                  fadd.s       ft10, ft10, fs6
                  mulhu        a4, a7, a3
                  srl          t6, s9, t0
                  fcvt.s.w     fs9, ra
                  remu         s4, a4, gp
                  fsgnjx.s     fa2, fs4, fs7
                  feq.s        a4, fa2, fs3
                  ori          a5, s1, 1668
                  flt.s        a1, ft5, ft7
                  and          a6, s8, s8
                  sub          sp, t5, s8
                  nop
                  fmv.w.x      ft7, s1
                  fadd.s       fs6, fa3, fs11
                  mul          tp, s9, a3
                  lui          a5, 567446
                  fle.s        s5, fa1, ft4
                  remu         a6, ra, a3
                  fsgnjn.s     ft5, ft3, fa3
                  divu         a2, s9, sp
                  flt.s        s2, fs4, ft3
                  fcvt.w.s     s4, ft0, rup
                  sra          a1, a1, s4
                  fmul.s       fa7, fs4, fs8, rdn
                  fsgnj.s      ft3, ft8, ft3
                  sltiu        s8, s10, -1562
                  mul          s8, t1, s3
                  sltiu        t4, s2, -640
                  sltiu        a0, t1, -1582
                  divu         t1, a6, a2
                  fdiv.s       fs2, ft5, ft9, rup
                  sra          s0, zero, s4
                  sltiu        gp, t1, -1104
                  fmv.w.x      fs6, t2
                  fcvt.wu.s    a0, ft11, rtz
                  sll          s8, a6, tp
                  fcvt.wu.s    s5, ft0
                  or           s8, t6, s7
                  fcvt.wu.s    a0, fa0, rne
                  fsub.s       fa1, ft5, fa3
                  fcvt.s.wu    fa2, s4
                  fsgnj.s      fs2, ft11, ft11
                  sltu         s1, s9, s11
                  fmv.w.x      ft6, s2
                  andi         s4, a2, 1390
                  fsgnj.s      ft9, fs3, ft6
                  fsub.s       fs4, ft11, ft4, rmm
                  sll          a4, t2, s11
                  sra          s2, t5, s2
                  slt          t3, t6, t1
                  sra          tp, s8, t1
                  fcvt.wu.s    t1, ft3
                  mulh         s11, sp, s10
                  and          t6, a7, tp
                  fmin.s       fs5, fs2, ft1
                  fle.s        t2, fs0, fs2
                  mul          t5, s7, s6
                  remu         gp, zero, s5
                  fcvt.s.w     fs11, s3
                  srl          t4, a3, s1
                  fmin.s       fs11, fs1, ft1
                  srli         s9, t6, 24
                  fsgnjn.s     ft8, ft9, fa1
                  ori          t1, s1, -516
                  sltiu        t4, zero, 249
                  sra          a6, sp, zero
                  srli         s10, a5, 0
                  xor          s2, gp, s3
                  fclass.s     tp, fs0
                  fmul.s       fs2, fs8, ft4, rmm
                  fmax.s       ft4, fa3, fs3
                  fmv.w.x      ft10, sp
                  fle.s        gp, ft9, ft8
                  mulhsu       a5, tp, a7
                  mul          sp, t3, t6
                  fadd.s       ft2, fa7, fs8, rmm
                  fsqrt.s      fs10, fa6, rtz
                  sltiu        s11, s8, -1651
                  slti         s1, s4, -1294
                  fmin.s       fs2, fa0, fs5
                  srai         s4, sp, 18
                  fmul.s       fa3, ft5, fs10
                  flt.s        t1, fa4, ft4
                  divu         t0, s4, a0
                  fle.s        s3, ft6, fa4
                  fclass.s     zero, ft2
                  srai         t0, a7, 8
                  fcvt.wu.s    s5, fs11, rne
                  fsgnjn.s     fa5, fa2, fs10
                  fcvt.wu.s    s1, ft5, rmm
                  fmin.s       fa7, fa6, fa5
                  flt.s        t4, fa0, fa5
                  rem          ra, sp, t0
                  fcvt.s.wu    ft0, s3
                  slt          t3, t6, a3
                  fdiv.s       ft1, fs0, ft9
                  fmin.s       fa1, fs1, ft10
                  flt.s        tp, ft11, ft7
                  fmv.w.x      ft0, s3
                  fsgnj.s      ft7, fs6, fs2
                  mulhsu       gp, a6, s6
                  fcvt.wu.s    a1, fs9
                  slli         t6, a3, 11
                  andi         a5, a5, -1360
                  fsqrt.s      fs8, fs5, rup
                  or           s1, ra, s1
                  fle.s        s9, fs11, fs11
                  sra          s2, a7, t1
                  fsgnjx.s     ft11, ft8, ft2
                  xori         a1, a5, -1477
                  xori         t3, a3, 1653
                  fdiv.s       ft4, fa1, fs5
                  feq.s        sp, ft2, ft7
                  fcvt.s.wu    fs4, zero
                  fdiv.s       fa6, fs3, fa6, rmm
                  mulhsu       s4, s2, a1
                  ori          t6, a1, 882
                  mulhu        ra, zero, zero
                  mulhsu       s11, s4, s0
                  flt.s        t3, ft6, fa6
                  fcvt.wu.s    s8, fs7, rne
                  fmin.s       fa5, ft9, fa2
                  sltu         sp, a1, s5
                  fcvt.s.wu    ft11, t2, rdn
                  nop
                  fsgnjn.s     fa3, fs4, fs9
                  or           s10, t4, s1
                  fclass.s     t0, ft3
                  lui          a3, 95247
                  fcvt.s.w     fs8, a4
                  fsub.s       fa4, ft1, fa5, rtz
                  fcvt.w.s     s4, ft5, rne
                  mul          a6, s1, ra
                  fsgnjn.s     fs10, ft6, ft1
                  fcvt.w.s     sp, fs5, rtz
                  sltiu        t2, a4, 429
                  nop
                  andi         a5, t6, 57
                  sltu         tp, s11, s9
                  slt          a0, s1, s7
                  div          s8, s5, gp
                  fcvt.w.s     s9, fa7
                  mulhsu       ra, s8, a3
                  andi         t3, s10, 555
                  xor          s11, sp, s11
                  srli         s11, s5, 25
                  or           sp, gp, s3
                  nop
                  srl          t3, sp, a1
                  fcvt.s.wu    ft1, a5, rup
                  mulhu        s3, s4, t4
                  feq.s        a1, ft11, fa6
                  fclass.s     a2, ft0
                  slti         zero, s7, -1270
                  fmv.x.w      s8, ft3
                  remu         s0, t1, sp
                  fsgnjn.s     ft5, fa4, ft1
                  sub          zero, s7, t6
                  addi         a3, a5, -1938
                  fle.s        t6, fs3, fa0
                  nop
                  or           t5, t0, t3
                  fsgnjn.s     fs9, fs0, fa5
                  fadd.s       fa4, fs7, fa3
                  fcvt.s.w     ft5, s5
                  rem          s10, a0, s10
                  fsgnj.s      fs2, ft10, fs7
                  divu         a0, a6, s11
                  sra          s3, t3, t0
                  div          s3, a3, t2
                  remu         s1, t6, t2
                  rem          t1, s0, a4
                  rem          s9, t2, t3
                  and          a6, s5, t1
                  fle.s        a5, fs9, ft5
                  lui          a6, 923963
                  sltiu        t5, a6, 30
                  sra          a3, gp, t5
                  sra          t2, zero, s7
                  fmv.w.x      ft5, a7
                  ori          a2, a2, 1350
                  xor          t5, a1, s4
                  fmul.s       fa2, ft9, ft4, rtz
                  mulh         a1, t6, a6
                  mulhu        t5, s8, t6
                  fsub.s       fs4, fa5, fa6, rne
                  fsgnj.s      fs0, fs2, fa7
                  ori          zero, a6, -732
                  fmv.x.w      s4, fs7
                  fsqrt.s      fa4, ft10
                  fsgnjn.s     fs3, ft6, fs3
                  fmv.w.x      fs1, t3
                  and          s2, s8, a6
                  sub          t1, gp, a3
                  fsub.s       ft11, fa3, fa1
                  srai         t4, a6, 7
                  slt          s1, s10, s3
                  andi         ra, s3, 1120
                  feq.s        sp, fs8, ft5
                  fmv.x.w      gp, fa1
                  fsqrt.s      ft5, fa7
                  remu         a3, s3, s4
                  remu         a5, zero, t0
                  srli         s2, a1, 30
                  sll          t6, t1, t4
                  sltu         a5, t5, s10
                  fmax.s       fs1, fs8, ft5
                  auipc        a3, 366863
                  nop
                  fsqrt.s      fa5, fs5
                  fsgnjn.s     fa0, fs0, fa1
                  remu         tp, t3, s8
                  srai         s1, s3, 28
                  fcvt.s.wu    fa1, t1, rup
                  sub          t0, ra, t1
                  sltiu        ra, t2, -1626
                  slli         t3, s0, 8
                  ori          s4, a5, -451
                  fmv.x.w      a3, ft8
                  ori          s11, a5, -1102
                  sltiu        s3, s1, -664
                  auipc        s9, 341926
                  fsgnjn.s     fs6, fa2, fs5
                  slti         a6, t0, 1127
                  xor          s2, a5, t0
                  add          s8, ra, t3
                  or           a4, s5, s6
                  srli         s1, a4, 9
                  nop
                  mulhu        s10, s1, t0
                  sltiu        zero, a4, 1611
                  feq.s        t3, ft1, ft2
                  auipc        tp, 333218
                  nop
                  fcvt.wu.s    s9, ft3, rup
                  xor          t1, s2, t3
                  fsgnjx.s     ft7, fa3, fs10
                  addi         s5, s5, 1247
                  srli         t1, a5, 25
                  sltiu        s11, a6, 1919
                  auipc        t4, 1023119
                  addi         a3, zero, -205
                  fclass.s     s2, fs6
                  fsgnjx.s     ft8, ft11, fs3
                  flt.s        s9, ft5, ft0
                  sll          gp, t3, t6
                  fcvt.w.s     t3, fs1
                  mul          s0, a3, t0
                  fsgnjn.s     ft7, fs6, ft11
                  fmv.x.w      a4, ft6
                  feq.s        s5, fa5, fa4
                  fcvt.wu.s    a5, fs10, rdn
                  ori          s5, s10, -102
                  remu         a0, s1, tp
                  fcvt.w.s     zero, fa6, rup
                  addi         s9, t0, -1786
                  fmv.x.w      ra, fs10
                  fmul.s       fs8, fa3, fs4, rup
                  fadd.s       fs10, fs1, fa7
                  fcvt.s.w     fs6, t0
                  fcvt.w.s     tp, ft11
                  slli         a6, s5, 8
                  fadd.s       fs10, ft1, ft11, rmm
                  and          s2, t5, a4
                  fmv.x.w      a1, fs2
                  ori          gp, ra, -1150
                  rem          s9, s2, s4
                  ori          s4, s0, 486
                  auipc        a4, 465835
                  flt.s        t1, fa4, ft5
                  or           s9, s4, s11
                  sltu         s8, t5, a2
                  auipc        ra, 612861
                  sra          s3, s1, s0
                  fadd.s       fs2, fs0, ft7, rup
                  divu         t1, t1, s7
                  sra          s8, t3, t6
                  xor          gp, t6, s9
                  div          s10, a4, a7
                  fcvt.s.wu    ft6, s11, rup
                  mul          s9, a1, s11
                  fmul.s       fa1, fs8, fs6
                  sltiu        t2, a5, 1906
                  sltu         sp, s6, s0
                  fcvt.w.s     a5, fs11, rdn
                  fmv.w.x      fa0, tp
                  fsgnjn.s     fs2, ft0, ft3
                  xori         t2, zero, -1956
                  mulhsu       t4, s4, s7
                  divu         t1, a1, tp
                  mul          s5, a1, s8
                  fclass.s     a1, fa5
                  sra          t1, t0, t6
                  srli         gp, a6, 21
                  sll          gp, t0, t5
                  mul          s3, a3, a5
                  slti         a4, a4, -1483
                  fcvt.w.s     ra, ft1
                  ori          a5, s2, -1448
                  srai         t5, a0, 20
                  and          gp, s3, ra
                  mulhsu       a2, a2, s8
                  fsgnj.s      fs3, fa1, fs9
                  divu         a2, a1, s1
                  fsgnjx.s     fs3, fs3, fa1
                  fcvt.wu.s    t0, fs10, rdn
                  and          a5, t0, ra
                  fclass.s     s11, ft2
                  xor          s8, s2, s1
                  rem          a3, t3, t5
                  fcvt.s.wu    fs11, zero
                  slli         s0, a4, 14
                  or           t5, s2, s1
                  fsub.s       fs3, ft9, fs9
                  mul          t1, tp, t4
                  sub          sp, s8, s10
                  or           t6, gp, s3
                  fsgnjx.s     ft3, fs8, fs11
                  srl          tp, sp, a6
                  divu         sp, a6, s6
                  flt.s        a4, fs6, fs4
                  srl          a5, a0, tp
                  mulh         t3, t3, a5
                  fclass.s     t2, fs2
                  fcvt.s.w     fs0, s11
                  fadd.s       ft6, fs9, fa7
                  flt.s        a6, fs2, ft8
                  fcvt.wu.s    s11, ft0
                  flt.s        t2, fs9, fa1
                  div          s4, a6, tp
                  fmv.x.w      tp, ft7
                  mulhsu       s3, a0, s1
                  srli         s0, a5, 27
                  rem          a6, s5, s6
                  sltiu        s1, gp, -1005
                  feq.s        t2, fa4, fa2
                  flt.s        gp, fa1, fa0
                  sll          t5, s11, s11
                  mulhsu       t6, t0, t5
                  divu         a3, s3, t5
                  srl          sp, t0, tp
                  mulhu        tp, s2, s2
                  fmv.w.x      ft5, t0
                  fmul.s       ft6, ft11, ft10
                  sltiu        t5, s5, -1321
                  fcvt.s.w     fs0, s4, rup
                  sll          s5, s11, s11
                  fsgnjx.s     fs10, fs8, fs10
                  xor          sp, s9, t2
                  srl          zero, s7, s1
                  fmul.s       fs2, ft7, ft11
                  ori          a2, s8, -889
                  sll          a0, a3, s2
                  fmul.s       ft2, fa3, fs6, rmm
                  fsgnjn.s     fs10, ft8, fs10
                  mul          t5, s11, a3
                  fsgnjn.s     fs8, fa5, fs6
                  xor          t1, t4, ra
                  mulhu        a6, ra, s5
                  or           s11, t4, s5
                  xori         s11, a6, -759
                  fsgnjn.s     ft4, ft7, fs2
                  slt          t0, a7, s9
                  fadd.s       fa0, fs6, ft3
                  fmul.s       fs7, fs7, fa5
                  fmul.s       ft0, fs3, fa5, rmm
                  fadd.s       fs4, fa6, fs0, rmm
                  srl          a3, a5, a6
                  sltiu        t2, a5, -1510
                  mul          t6, s4, s5
                  mulh         s4, ra, s9
                  fcvt.wu.s    t3, fs1
                  slt          a5, a0, s8
                  mul          tp, tp, t2
                  lui          t3, 644803
                  fcvt.w.s     t1, ft3, rdn
                  sra          a0, s7, s10
                  fmin.s       ft7, fs10, ft3
                  fsgnjn.s     fs4, fa3, ft2
                  fmv.x.w      zero, fs4
                  fsqrt.s      fs9, fa1
                  div          t3, a1, s7
                  nop
                  srli         t4, s6, 3
                  rem          s10, gp, a3
                  sll          t0, s8, s2
                  fsub.s       ft7, fs6, ft11
                  divu         t1, a0, a1
                  fsub.s       ft9, fa6, ft5
                  andi         s1, a5, -289
                  sub          t1, s1, s4
                  fcvt.wu.s    s1, fs1, rtz
                  fsqrt.s      ft1, fa7
                  lui          a4, 56604
                  add          sp, s1, a0
                  add          t2, t3, a0
                  remu         a0, gp, a0
                  mulhu        s10, gp, s10
                  fmv.w.x      ft10, a4
                  flt.s        ra, fs9, fa4
                  srli         a5, a2, 11
                  fdiv.s       fs1, ft3, fa0
                  ori          s9, s6, -1538
                  fmv.x.w      a1, fa6
                  fsgnjx.s     fa7, ft9, fs2
                  mulhsu       tp, ra, gp
                  sll          tp, s5, s11
                  rem          s3, a6, s6
                  nop
                  srli         t4, t4, 27
                  add          zero, t1, s3
                  fcvt.w.s     a5, fa5, rup
                  nop
                  div          a2, a5, s9
                  srl          t2, a4, s8
                  mulhsu       s10, a0, s10
                  fdiv.s       ft10, fs9, fs0
                  nop
                  mul          t1, s1, s0
                  xori         a2, sp, 275
                  and          tp, t4, ra
                  srl          s9, t5, t2
                  addi         t4, sp, 1379
                  andi         s4, sp, -467
                  fdiv.s       fs9, ft1, fs7, rne
                  sra          a3, a5, tp
                  nop
                  srli         a5, gp, 29
                  fmul.s       ft8, fs6, fa0
                  fsgnj.s      ft2, fa5, ft11
                  remu         t6, ra, t1
                  fsqrt.s      fa5, ft9
                  sltu         s1, s4, a4
                  mul          s10, s3, s11
                  auipc        sp, 50198
                  sub          zero, t3, s10
                  fmv.w.x      ft5, a6
                  fcvt.w.s     s5, ft5
                  sltu         a2, t3, t5
                  fsqrt.s      fs9, ft10, rtz
                  mulhu        tp, t6, zero
                  fmin.s       ft1, fs5, fa4
                  lui          a6, 513654
                  and          s8, tp, t1
                  auipc        s1, 306680
                  fcvt.w.s     a1, fa4
                  fcvt.s.wu    fa5, sp
                  fcvt.wu.s    s2, fa6
                  fdiv.s       fs0, ft2, fa5
                  mulhsu       s5, s11, s9
                  mulh         a0, s6, s2
                  fsub.s       fa2, fs7, fs3, rne
                  mul          s5, a5, s5
                  add          t2, s7, s6
                  or           s5, zero, a5
                  mulh         t5, a3, t5
                  andi         sp, a0, -1645
                  mulhsu       ra, t0, t2
                  div          a6, t3, t4
                  srl          gp, s0, a7
                  andi         a3, t2, -1260
                  sltiu        s0, s1, -1506
                  fdiv.s       fa5, ft8, ft1, rup
                  rem          s4, s11, a6
                  fadd.s       fa7, fs0, fs4
                  fmv.x.w      t0, ft8
                  fsgnjx.s     fa4, ft11, fs0
                  sll          s2, a6, t5
                  remu         t1, ra, a6
                  slti         a0, a2, 107
                  fsgnjx.s     ft2, fs10, ft9
                  fcvt.s.w     fa0, s9
                  sltu         a2, s1, t6
                  fmax.s       ft4, fa0, fs11
                  fcvt.wu.s    s4, ft9
                  sll          s3, s0, gp
                  fadd.s       fa2, ft3, ft7, rdn
                  fsgnjn.s     fs5, ft3, fs8
                  xori         zero, s1, -1199
                  and          gp, a7, a4
                  fsgnjn.s     ft6, fa0, fs0
                  fmin.s       ft10, fs6, ft11
                  fsqrt.s      fs8, fs10, rne
                  fsgnjn.s     fs10, ft9, ft10
                  fmul.s       fs10, fa3, ft7
                  fcvt.s.w     ft7, s8
                  fsgnjx.s     ft4, ft9, ft2
                  sltu         t5, s7, zero
                  add          t6, s8, s9
                  slli         t6, zero, 26
                  divu         a3, s6, a1
                  divu         a5, sp, s7
                  sub          s0, s1, a1
                  sltiu        a1, a2, -312
                  fle.s        t4, fs1, fa0
                  sll          a1, t6, gp
                  fsub.s       ft4, fs11, fs7, rup
                  divu         s11, s5, tp
                  sltiu        s10, sp, 985
                  fcvt.s.w     ft9, t0, rmm
                  rem          gp, ra, a1
                  or           t5, t5, t2
                  slt          s0, s10, s1
                  fmax.s       fs4, fa1, fs1
                  srl          s2, s6, a4
                  fsub.s       ft1, ft11, fa0
                  mul          gp, tp, a5
                  sll          a4, a7, s7
                  feq.s        a3, ft9, ft9
                  fdiv.s       fa4, fa0, fs2, rmm
                  sra          s10, t6, a4
                  slti         a4, s5, 921
                  sltiu        a1, gp, 1746
                  flt.s        t0, fa6, fs3
                  fsub.s       fs7, ft1, ft7, rne
                  andi         sp, t5, 568
                  auipc        ra, 541814
                  fsgnjn.s     fa7, fs4, ft8
                  auipc        a6, 771041
                  fmul.s       ft4, ft0, fs6
                  srl          a5, s9, a5
                  fsgnjn.s     fa3, ft9, fa4
                  fclass.s     t2, fs11
                  fclass.s     s3, ft7
                  div          t5, s7, a1
                  nop
                  fmv.w.x      ft11, a6
                  addi         s10, s6, 798
                  fcvt.w.s     s2, fs9, rup
                  xor          a6, s10, a3
                  or           s2, sp, a3
                  mulh         tp, s11, t4
                  auipc        zero, 218356
                  auipc        a2, 115742
                  fsqrt.s      fs9, fs11
                  fmv.x.w      t1, fs1
                  fmin.s       fa4, ft4, fa3
                  fsgnjx.s     fa3, ft10, fs1
                  fmv.w.x      fa0, t6
                  xori         tp, t3, 1501
                  add          a4, a1, s8
                  slti         ra, t0, -1795
                  srli         a4, a7, 14
                  sltu         s9, t2, t2
                  fsub.s       ft7, fa6, fa6
                  divu         a4, s10, s11
                  remu         a5, t1, a7
                  mul          s5, s5, t5
                  fsqrt.s      fa1, fa6, rdn
                  and          s3, sp, t4
                  sltiu        sp, ra, 1733
                  fsqrt.s      ft0, fa4
                  mulhsu       s0, s9, ra
                  mul          t1, s3, a6
                  slli         a0, s9, 22
                  fmv.w.x      ft2, s4
                  fcvt.wu.s    a5, ft2, rtz
                  slti         sp, s2, 526
                  fmin.s       ft7, ft6, fs0
                  fmul.s       fa0, fs10, fa2, rne
                  fsgnj.s      ft9, ft3, fs4
                  fmul.s       fa6, fs11, fa3
                  fmax.s       fa1, fa0, ft9
                  rem          t0, s1, s6
                  sltu         s3, t3, s0
                  fcvt.s.wu    ft3, s8
                  andi         s8, a0, -1645
                  fmax.s       fs9, ft11, fs7
                  or           a1, s9, t2
                  and          a5, s3, a2
                  flt.s        t0, ft0, fa0
                  fsgnjx.s     fs5, ft5, ft0
                  auipc        s2, 59671
                  fmul.s       fs3, fa2, ft10, rup
                  slti         t2, s6, 1350
                  fclass.s     s3, fs8
                  fcvt.s.wu    ft0, t0, rmm
                  nop
                  and          s1, t6, t1
                  ori          a0, s3, -686
                  slt          zero, s4, s8
                  addi         s1, t5, -1498
                  rem          a3, s8, s4
                  flt.s        a4, fa5, fs6
                  andi         t4, s3, -122
                  mulh         a1, s6, t1
                  fsgnjn.s     fs4, ft10, ft1
                  ori          a0, s6, -817
                  fsqrt.s      ft5, fs4
                  fcvt.wu.s    ra, fs3, rmm
                  mulhu        s3, a4, s2
                  fclass.s     zero, fa5
                  sll          ra, gp, t3
                  fadd.s       fa6, ft8, fs3
                  srl          s1, s9, tp
                  sll          s2, a7, a3
                  ori          ra, tp, -1286
                  fle.s        gp, fs2, fs9
                  addi         t5, t5, -642
                  fadd.s       fa0, fs9, fs4, rtz
                  divu         a1, t6, s1
                  add          t1, tp, s2
                  nop
                  fmv.w.x      fs8, a6
                  flt.s        a3, fa1, fs10
                  sra          t2, t2, t4
                  sll          a0, s11, s3
                  xor          t2, t2, s0
                  div          t5, tp, gp
                  fcvt.s.w     ft2, gp, rdn
                  fcvt.s.w     fs3, s6, rmm
                  sll          a0, tp, t2
                  fmin.s       fs9, ft6, ft0
                  fcvt.s.w     fa6, s2
                  slti         s8, a1, 369
                  add          s10, s8, a5
                  lui          t1, 170084
                  sltiu        sp, s4, 1861
                  sub          t5, a7, s5
                  nop
                  fsqrt.s      fa0, fs7, rne
                  or           t4, s4, s9
                  remu         ra, ra, s9
                  sltu         s2, s5, a6
                  rem          t3, t1, zero
                  mul          s9, s0, t4
                  sll          a1, t4, a0
                  slli         s0, a5, 25
                  fcvt.wu.s    t2, fs0
                  fmax.s       fs10, ft0, fa5
                  fmax.s       fa0, fa1, ft2
                  flt.s        a6, ft7, fs2
                  feq.s        s1, ft8, fa2
                  rem          s5, s10, t4
                  flt.s        s10, ft5, fs5
                  fcvt.s.w     fs5, s9, rmm
                  or           tp, gp, a0
                  fmul.s       fa7, ft8, fs11
                  or           zero, t0, s4
                  fmin.s       fa0, ft1, ft0
                  andi         t0, s11, 1423
                  andi         a1, s3, -1306
                  sub          ra, a1, s6
                  fcvt.w.s     a2, ft6, rdn
                  fsqrt.s      fa6, fa7, rmm
                  divu         s9, tp, sp
                  fsub.s       fa5, ft2, fa4, rtz
                  mul          a1, gp, t5
                  fcvt.s.w     fs3, t2
                  mulh         s9, a2, t0
                  fmul.s       fa4, fa4, ft4
                  flt.s        t6, fs7, fs5
                  and          s4, t0, a0
                  and          s10, ra, s6
                  auipc        s1, 115348
                  slt          ra, s11, a5
                  addi         a6, s1, 1656
                  fadd.s       fs8, fa7, ft5, rdn
                  fmv.w.x      ft3, sp
                  slti         s0, t5, 470
                  slt          t4, t1, tp
                  fmin.s       fs9, ft3, fs5
                  mulh         a6, t6, s5
                  ori          t5, a1, 1220
                  fmax.s       ft7, fs6, ft11
                  fsgnjn.s     ft0, fs5, ft10
                  flt.s        a5, fs6, fa5
                  fmv.w.x      ft1, t5
                  fmin.s       ft4, fa1, ft8
                  fcvt.s.w     fs7, a3
                  mulh         a3, s6, a0
                  xori         t4, s0, 1285
                  sub          a5, t3, s2
                  nop
                  fcvt.s.wu    fs3, s6
                  sra          ra, a0, s4
                  xor          a6, gp, a4
                  sra          s4, s10, tp
                  fsub.s       ft0, fa1, ft9, rmm
                  fmv.x.w      t4, fa1
                  fsqrt.s      fa2, fs11
                  fcvt.s.wu    fs10, s10
                  lui          gp, 801829
                  fadd.s       ft2, ft11, ft2
                  divu         s9, s5, t4
                  srl          t1, s8, s2
                  fcvt.s.w     ft8, t0
                  fcvt.s.wu    fs0, s10
                  divu         t1, sp, s9
                  sll          a4, a6, a5
                  fcvt.s.wu    ft7, s6, rup
                  addi         sp, s5, 533
                  fmv.w.x      ft11, a4
                  sltiu        ra, s2, 1408
                  remu         a1, s9, zero
                  remu         s5, t5, a3
                  fcvt.w.s     t3, fs11
                  slti         s5, s10, 1131
                  fcvt.s.w     ft5, s1
                  fcvt.wu.s    a3, ft7
                  sra          tp, s5, s0
                  xori         s9, t4, -1321
                  srli         a4, ra, 14
                  sll          gp, t5, a1
                  mul          a6, a3, a6
                  addi         s5, tp, 593
                  or           s5, s6, tp
                  fcvt.s.wu    fa3, s3
                  sltu         s9, a7, tp
                  xor          a4, zero, s6
                  fmin.s       fs11, ft10, ft8
                  div          t3, zero, t1
                  sltiu        s8, s6, 20
                  fmax.s       fs10, fs9, fs0
                  xori         a0, s3, 1240
                  srai         a1, s10, 25
                  sltiu        s0, s6, 683
                  rem          s11, t3, t2
                  remu         a1, t3, sp
                  slt          t1, a2, t4
                  slti         s5, zero, -94
                  fmul.s       ft7, ft0, ft7, rne
                  sltu         a0, s2, gp
                  fmin.s       fs3, fs6, fs0
                  feq.s        s2, fs7, ft1
                  sltiu        s10, t6, -1898
                  fsgnjn.s     fa4, fs10, fs7
                  sra          a1, s10, s11
                  ori          t4, sp, -518
                  fsgnjn.s     fa1, ft2, ft5
                  addi         zero, s11, -1614
                  rem          sp, t3, a0
                  rem          t1, a7, a7
                  srli         s1, a2, 28
                  slti         s8, t4, 818
                  slt          a4, s10, gp
                  div          a1, s9, t6
                  fmin.s       fa0, ft5, fs8
                  div          s3, s1, a3
                  addi         a0, s4, 1791
                  sltu         s8, t6, t3
                  sltu         zero, sp, s4
                  fadd.s       fa2, fa2, fa3, rup
                  fmax.s       fa0, ft4, fs7
                  slti         gp, s7, 2035
                  fcvt.wu.s    s3, fa0, rup
                  slli         s8, s1, 16
                  fmv.x.w      ra, ft3
                  sltiu        ra, s11, 291
                  fmax.s       fa3, fs6, fa3
                  slt          a1, gp, ra
                  mulh         t0, a0, tp
                  ori          s0, s6, 1837
                  andi         s10, ra, 362
                  slli         a4, gp, 9
                  fsgnjn.s     fa0, ft6, fs8
                  feq.s        s0, ft6, fs5
                  sltu         a0, t6, t6
                  srli         t0, a1, 13
                  sltu         a1, a2, s0
                  feq.s        a6, fa5, ft3
                  fcvt.s.w     ft8, t0
                  rem          t5, sp, t0
                  fmin.s       fa6, fs4, ft2
                  slti         s1, a0, 1466
                  slt          s9, s1, s1
                  slti         s0, a0, -169
                  fmin.s       ft1, fs4, fs8
                  srai         t0, t5, 21
                  fcvt.s.wu    ft6, s4, rne
                  sltiu        s5, s5, 2034
                  andi         a4, t1, 730
                  xori         s2, s9, 1954
                  fcvt.wu.s    s5, fa0
                  srli         s1, t3, 16
                  flt.s        a6, ft4, fs0
                  fcvt.wu.s    t2, fa0, rne
                  xor          sp, s5, t5
                  flt.s        s9, fs11, fa7
                  fadd.s       ft8, fs8, fs8, rmm
                  remu         t3, t4, s5
                  ori          s2, a3, 1773
                  sltu         t5, t0, a4
                  or           s1, t1, a4
                  andi         a6, t5, -20
                  mulhsu       sp, s9, t1
                  slti         t5, s1, -147
                  or           a0, s1, a2
                  srl          t3, s10, tp
                  divu         sp, a4, s0
                  and          a6, t3, s9
                  fle.s        s5, fa2, fs11
                  fmax.s       fa7, fa4, ft1
                  srai         t5, s2, 12
                  mul          a6, a6, tp
                  srai         a1, s9, 2
                  addi         t3, s4, -332
                  fcvt.s.wu    fa1, ra, rne
                  remu         t6, s10, s9
                  fsgnjn.s     fa3, fa0, ft1
                  slt          ra, s1, s7
                  fmax.s       ft6, fs2, ft5
                  slli         s8, s3, 23
                  fsgnj.s      ft8, fs3, ft10
                  fcvt.s.wu    ft4, t1, rup
                  fclass.s     t1, ft4
                  or           t0, s1, t0
                  fsgnjn.s     fs0, fa4, ft9
                  sll          a1, a2, t2
                  flt.s        a0, fs0, fa1
                  lui          s2, 645377
                  srl          s4, tp, s11
                  fmv.w.x      fs2, t2
                  fsgnjx.s     ft8, fa1, fs3
                  xor          s4, s7, a1
                  flt.s        a6, fa0, fs4
                  sub          ra, t5, s10
                  fsub.s       fa5, ft2, fa0
                  fdiv.s       fs11, fa5, ft11, rne
                  srai         s0, zero, 14
                  auipc        a0, 953402
                  divu         a0, a4, a5
                  fdiv.s       ft0, fs11, fs11, rmm
                  fle.s        s10, ft11, fs9
                  or           s3, a5, a4
                  nop
                  fcvt.wu.s    s4, ft7
                  fmv.w.x      fs8, t1
                  fmin.s       fs9, ft8, ft10
                  feq.s        t2, fa3, ft6
                  lui          a0, 219339
                  fsgnjx.s     fa7, fs6, fs0
                  sll          t1, s8, tp
                  srai         gp, t1, 18
                  fclass.s     t4, fs8
                  fsgnjx.s     fs5, fs3, fs9
                  feq.s        a1, ft6, fs3
                  sub          t2, zero, s3
                  fsgnjn.s     ft10, fs2, ft9
                  fmv.x.w      a3, ft4
                  fdiv.s       fs9, ft9, ft10
                  or           a4, s6, a6
                  andi         s1, a6, -211
                  sub          s0, s1, a1
                  srl          s1, s4, a0
                  fsgnj.s      fa5, fa1, ft4
                  sub          sp, s4, s7
                  fsub.s       ft5, fs2, fa7
                  rem          t2, s10, tp
                  fsgnjn.s     fs9, ft10, fs1
                  flt.s        a2, ft5, fa5
                  sll          s3, t4, t1
                  mulhu        ra, a3, s4
                  fmul.s       ft8, ft2, ft4, rup
                  andi         s9, s1, -1538
                  andi         s8, s2, 40
                  fmax.s       fs10, fs3, fs10
                  or           s9, t6, s6
                  andi         s9, tp, 874
                  xor          s2, a2, s11
                  mulhsu       s9, t4, a3
                  divu         a1, s8, t5
                  fcvt.wu.s    s10, ft8
                  feq.s        a4, fa7, fs6
                  rem          sp, tp, s3
                  add          s0, s2, a0
                  fle.s        s10, ft1, fs10
                  sub          a5, a3, s8
                  fcvt.w.s     a1, ft0
                  div          a5, a1, gp
                  div          t2, t3, a3
                  rem          t4, gp, s7
                  sltiu        t2, s10, -418
                  mul          tp, s10, t6
                  fcvt.wu.s    a5, fs10, rne
                  fsqrt.s      fa3, fs4
                  sub          s1, tp, sp
                  add          t2, a4, t1
                  fclass.s     zero, fa1
                  fle.s        t5, ft2, fs3
                  or           s8, t2, s5
                  fmax.s       ft9, ft11, fs1
                  fsgnjn.s     fs7, fs2, ft0
                  sltu         s3, t5, gp
                  ori          a2, s11, -1145
                  lui          a6, 563374
                  mul          a4, s10, s3
                  nop
                  ori          s4, t1, -1627
                  fmul.s       fs9, ft8, fa2
                  sltu         s2, s7, a1
                  sltu         a6, s2, t0
                  sub          s0, ra, s3
                  fsub.s       fs6, ft11, fs6
                  fmin.s       fs2, fs7, fa0
                  fcvt.s.w     ft9, t1, rup
                  auipc        a1, 278114
                  sra          t3, s3, t2
                  lui          t4, 671759
                  fmul.s       fa7, fa3, fs8
                  div          t5, tp, a5
                  fle.s        a4, fs5, fs11
                  fle.s        gp, fs4, fs1
                  flt.s        a0, ft11, fs7
                  mul          t0, s3, s5
                  fmv.x.w      s11, fs5
                  fle.s        a5, fa3, fs7
                  fmin.s       ft2, fa5, ft2
                  srli         s0, t3, 29
                  slli         t6, a0, 23
                  sub          ra, a5, s10
                  fle.s        ra, fs1, fa2
                  fsgnj.s      ft1, ft6, fs3
                  fsgnjx.s     fa5, ft7, fa0
                  slt          s9, a1, t5
                  div          a3, a0, a6
                  srl          s3, a6, a5
                  fsgnj.s      ft9, ft3, ft2
                  nop
                  mulhu        t2, s10, a3
                  mul          s2, zero, t5
                  fsqrt.s      ft2, ft8, rmm
                  fsgnjn.s     ft10, ft8, ft9
                  auipc        t0, 872612
                  divu         t4, a1, zero
                  xori         s11, s9, -253
                  fcvt.w.s     a2, ft3
                  sra          s8, t3, a6
                  fmin.s       fs11, fs1, ft7
                  or           s11, s2, s3
                  fsub.s       fs5, fa3, ft10, rtz
                  slti         a2, s3, 1617
                  fsub.s       fa3, fa1, ft6
                  or           s2, s11, t2
                  fmin.s       fs9, fa7, fa4
                  fsqrt.s      fa6, fa2
                  fle.s        s11, ft9, fa0
                  sll          a6, t5, a3
                  fsgnjn.s     fs9, ft5, fa1
                  and          t4, a6, s9
                  fmin.s       fa2, ft9, ft8
                  srai         s8, s10, 10
                  srai         ra, s9, 18
                  fmul.s       ft0, fa0, fa6
                  mulhu        t4, s10, t3
                  fsgnjn.s     ft0, fs7, fa1
                  srl          s5, a4, a5
                  srl          s10, a2, t1
                  fsub.s       ft10, fa2, fs0
                  nop
                  andi         s9, a6, 884
                  fmv.w.x      fa7, tp
                  fmin.s       ft9, fs6, ft1
                  fmin.s       ft9, fs0, ft5
                  auipc        t4, 1017262
                  sra          s0, a1, s3
                  auipc        ra, 27594
                  sra          a4, a3, tp
                  xor          s8, gp, a5
                  divu         a5, s9, s6
                  srli         s11, t3, 31
                  sltiu        s11, a7, -1841
                  slli         a2, sp, 2
                  sltiu        t1, s6, 1352
                  slti         s0, s4, 448
                  fmax.s       fs6, fa3, fa5
                  rem          t0, t4, s6
                  divu         a0, s3, a5
                  sll          s0, s2, ra
                  fsgnjn.s     fs11, fs3, ft2
                  fmul.s       ft0, fs4, fs9
                  sll          gp, t0, a1
                  ori          a0, t5, 1
                  slti         a4, gp, 1258
                  fsgnjn.s     fa6, ft11, ft5
                  xor          a3, t4, a7
                  sltiu        a6, a4, -1817
                  or           gp, s1, a6
                  and          t5, a1, sp
                  fmul.s       fa3, fs2, fs10
                  fcvt.w.s     s9, ft4
                  fsgnjn.s     fs5, fa7, fa5
                  flt.s        s10, fs9, ft6
                  mul          s9, s9, zero
                  remu         s9, t4, s7
                  remu         s5, t4, s6
                  andi         tp, a6, 98
                  fadd.s       ft11, ft11, fa4
                  fcvt.s.wu    fs1, t6
                  mul          s4, s4, s2
                  srai         a2, s4, 10
                  srai         a0, s0, 6
                  feq.s        a3, fs4, ft4
                  sub          s5, s6, a7
                  ori          a5, a2, -1189
                  slli         gp, a1, 12
                  slti         s4, sp, -804
                  fmv.x.w      zero, ft2
                  srli         sp, s4, 2
                  fsgnjx.s     fs4, ft0, fa7
                  fcvt.s.w     fa5, t2, rmm
                  fsub.s       fs1, fs4, fa7
                  or           t3, s3, a1
                  lui          t6, 738393
                  mulhsu       t6, s5, s11
                  auipc        t3, 8596
                  xor          sp, s7, s4
                  or           s5, t4, s4
                  sub          a1, s9, s6
                  srli         tp, s10, 24
                  fmin.s       fs8, ft11, ft9
                  slli         s3, a2, 9
                  ori          t6, t0, -543
                  fle.s        s4, ft2, fs9
                  auipc        s9, 146570
                  fmv.x.w      a3, ft4
                  fclass.s     t5, fs1
                  fsgnj.s      fa6, fs5, ft8
                  feq.s        a2, ft5, fa6
                  fle.s        t3, fs2, fs7
                  divu         s10, t4, t2
                  sra          s3, s2, zero
                  srl          s5, a0, a3
                  mul          sp, t3, s0
                  mul          sp, sp, s3
                  sub          t2, a5, sp
                  and          s2, s2, ra
                  fcvt.s.wu    ft10, s5
                  fmin.s       ft3, ft9, ft7
                  mulh         t4, sp, t4
                  fsgnjx.s     fa3, fs6, fs2
                  sltu         a6, a3, s1
                  fadd.s       fs9, fs1, fa0
                  fcvt.w.s     s3, fa6, rtz
                  fcvt.s.wu    fs2, s4, rmm
                  fsgnjn.s     fa7, fs8, fa2
                  fclass.s     a5, fs4
                  fmv.w.x      fs3, t2
                  slli         s9, t0, 16
                  xor          s10, t4, t1
                  sll          s11, s10, gp
                  fsub.s       fs1, fs1, ft2
                  slt          t3, s0, t4
                  xori         ra, a6, -486
                  fmin.s       ft4, ft7, ft10
                  fcvt.s.w     fa6, s0
                  fadd.s       ft11, ft4, fs4
                  fadd.s       ft11, fa3, ft6, rne
                  sll          t4, zero, s11
                  mulhu        t3, a6, s2
                  mul          zero, a5, a5
                  srai         sp, a4, 6
                  fmin.s       ft11, fs5, fa4
                  fadd.s       ft10, ft2, fs1, rup
                  srai         t4, s2, 10
                  fmax.s       fa1, ft3, fs7
                  fmax.s       ft10, fs0, fa7
                  fmv.w.x      ft0, tp
                  slt          s9, s0, zero
                  sll          s3, t6, s6
                  fadd.s       ft9, fs11, ft0, rmm
                  div          s5, s1, s11
                  mulhsu       t1, sp, tp
                  or           a5, s10, a7
                  sltu         a6, t0, s10
                  sra          s2, tp, s9
                  andi         a1, s8, -1189
                  fsqrt.s      fs11, fs6
                  slti         t5, s0, 501
                  fsqrt.s      fa3, ft6
                  fmax.s       fs0, fs10, fa1
                  ori          s10, s2, -1344
                  srl          a4, a0, s5
                  remu         t2, a3, s1
                  fmv.w.x      ft3, gp
                  or           t5, a7, a2
                  nop
                  fcvt.s.w     fs2, a0, rne
                  fcvt.w.s     t6, fs11, rtz
                  sltu         t6, t4, s10
                  xori         a4, zero, -949
                  fsub.s       ft9, fa5, ft1, rdn
                  rem          s5, a4, a1
                  sra          t5, t1, s10
                  fmax.s       fs2, fa0, ft0
                  mul          a5, s10, a0
                  srli         s1, tp, 19
                  slli         t6, t2, 21
                  addi         t0, gp, 465
                  slli         a2, t2, 16
                  mul          t0, s10, a3
                  mulhu        t5, a5, a0
                  nop
                  sltiu        s3, t0, 72
                  sub          ra, sp, s11
                  fmin.s       fs2, ft0, ft10
                  fcvt.wu.s    sp, ft11
                  add          t2, gp, s11
                  fcvt.s.wu    ft11, gp
                  fsub.s       ft1, fs4, fa5, rup
                  addi         a4, t3, 4
                  auipc        zero, 338844
                  srli         t1, a4, 5
                  rem          ra, s11, s5
                  xor          a1, s1, a4
                  mulh         t4, a2, ra
                  fmv.w.x      fa6, a4
                  add          s8, t1, s7
                  srl          s1, s7, s9
                  fmax.s       fs4, fs8, fa0
                  and          s0, a2, zero
                  fcvt.wu.s    t6, fs6, rtz
                  fmv.x.w      s2, fs2
                  sra          s2, a3, a1
                  xori         a3, gp, 362
                  fmin.s       fs8, fs6, ft3
                  srai         t4, t0, 18
                  fsub.s       fs0, fa3, ft10, rup
                  fmax.s       ft1, fs11, ft8
                  remu         s1, a1, s2
                  fsgnj.s      ft9, fa7, fa5
                  addi         s10, s2, 754
                  fle.s        gp, fs9, ft4
                  fsqrt.s      ft5, fa5
                  lui          a1, 1000841
                  fcvt.wu.s    a1, fs10, rne
                  mulhsu       s10, a2, zero
                  sltiu        t0, a1, 491
                  fclass.s     zero, fs1
                  fmax.s       ft10, fs8, fa2
                  ori          s2, sp, -1842
                  mulh         s0, a4, s5
                  fsgnjn.s     ft2, fs1, fa3
                  mulhsu       a5, gp, s5
                  nop
                  remu         s3, t0, t6
                  fle.s        s5, ft9, fs11
                  fcvt.s.wu    fs9, t5, rdn
                  mulhsu       t6, s4, s9
                  sll          zero, tp, a3
                  and          s10, a3, a6
                  mul          t3, s2, s7
                  feq.s        s9, fs5, ft3
                  addi         t3, ra, -754
                  mulhu        t1, s5, ra
                  fsgnjn.s     ft5, ft8, ft11
                  fsgnjx.s     ft7, ft11, fa1
                  div          s3, a3, zero
                  fmul.s       ft11, fs4, fa7, rmm
                  fsqrt.s      fa1, fs9, rup
                  andi         ra, tp, -156
                  or           ra, a0, a1
                  or           s8, s5, s10
                  mul          t5, s7, a2
                  feq.s        t6, ft6, fs6
                  fsub.s       fa4, fa2, fa1
                  fle.s        sp, fs2, fa3
                  fsqrt.s      fs11, ft11
                  fmin.s       ft6, fs10, ft10
                  ori          s5, a3, -1331
                  fsub.s       fs4, ft6, fs5, rup
                  remu         t2, a2, s4
                  sll          zero, s9, s0
                  fcvt.wu.s    s4, ft3
                  slli         tp, s2, 29
                  or           t6, t4, s4
                  fsgnjn.s     ft6, fs0, ft0
                  sltu         t2, t6, a3
                  remu         tp, a4, t5
                  fclass.s     a3, fs2
                  slli         t1, tp, 17
                  sll          s5, t4, a0
                  rem          a6, a6, s7
                  fcvt.s.w     fs5, ra
                  remu         sp, a1, a4
                  auipc        ra, 510909
                  sltu         s9, sp, a1
                  srl          sp, s5, sp
                  sub          t1, a0, gp
                  fcvt.wu.s    t0, ft7
                  div          s8, a2, a4
                  srai         t3, s11, 27
                  fmul.s       ft8, ft2, fa0, rmm
                  srli         tp, zero, 0
                  mulhsu       t5, ra, a5
                  fsgnjx.s     fs1, fa1, ft7
                  fsgnj.s      fa5, ft0, fa2
                  sll          s8, a6, t6
                  add          s4, t6, t4
                  srai         t0, a2, 6
                  fsgnj.s      ft11, fs8, ft8
                  nop
                  fsgnjx.s     fs1, fs7, fs9
                  ori          s5, gp, 654
                  fclass.s     s0, ft4
                  fsqrt.s      fs10, fs2
                  fcvt.s.wu    fa5, s11
                  fsgnjx.s     ft2, fs10, fa3
                  mul          s8, sp, sp
                  sub          s2, s8, a5
                  fcvt.s.wu    fs5, a2
                  mulhsu       a1, a6, t0
                  fadd.s       ft2, fs8, fa4, rup
                  fsgnjx.s     fs0, fs4, ft8
                  fsub.s       fa3, ft0, fa7
                  fsqrt.s      fa6, ft6
                  fmv.x.w      a5, fs7
                  fclass.s     a1, fs11
                  fmv.w.x      fa6, s9
                  fcvt.s.w     ft6, s7
                  divu         a0, s6, s10
                  mulh         a1, a6, a1
                  srai         s9, s5, 10
                  feq.s        t5, fa5, fa3
                  mulhsu       s9, a1, a4
                  fcvt.wu.s    t2, fa7
                  fsgnjn.s     ft6, fs10, fa7
                  fmin.s       ft0, ft5, fa3
                  fsgnjn.s     ft1, fs11, fa3
                  mulhsu       t3, s11, gp
                  mulh         s1, a3, s3
                  fdiv.s       ft1, fs4, fa1
                  nop
                  remu         s2, sp, t2
                  srl          s0, s3, s11
                  div          a3, a5, s11
                  srl          tp, s2, s1
                  lui          s10, 1043790
                  fadd.s       ft10, ft8, fa4, rdn
                  ori          t5, s3, -917
                  srai         s8, t4, 8
                  fsgnjx.s     fs6, ft11, fs7
                  ori          tp, sp, -520
                  fsgnjn.s     fa4, fs4, ft10
                  xori         s8, s11, 1302
                  and          gp, a2, t0
                  or           a3, s4, a0
                  fsub.s       fs7, fs0, fa4, rup
                  div          s8, a6, s11
                  fcvt.s.wu    fa2, s10, rtz
                  flt.s        t2, fs8, ft4
                  xor          a3, t1, s4
                  fclass.s     a6, ft5
                  lui          t3, 896978
                  fmv.w.x      fa0, t1
                  sub          t2, a1, tp
                  xor          s9, t4, s7
                  fadd.s       ft3, fs1, ft10, rdn
                  sub          s2, a5, a0
                  fsqrt.s      fs10, fs7, rdn
                  fcvt.s.wu    fa7, s1, rdn
                  fdiv.s       fa3, fs11, ft3
                  auipc        s10, 625737
                  fclass.s     a3, fa7
                  fadd.s       ft5, fs4, fs6, rtz
                  lui          zero, 809328
                  sub          s8, t4, tp
                  slli         s9, zero, 23
                  sra          t2, sp, tp
                  fmv.x.w      s2, ft3
                  lui          a3, 112146
                  srli         t0, t0, 8
                  feq.s        t1, fa1, ft10
                  xori         s4, a2, -1027
                  fsgnjx.s     fa7, ft1, ft3
                  fmul.s       fa5, fa7, fs5, rtz
                  slt          s9, s4, a4
                  fmax.s       ft0, ft0, ft10
                  sub          gp, tp, s9
                  mulh         a2, s11, t4
                  fsqrt.s      fs7, fa5
                  sra          t4, a6, sp
                  xor          a0, t2, sp
                  fcvt.w.s     s1, ft3
                  fcvt.s.w     fs3, s5, rne
                  fclass.s     s2, fs0
                  xor          t1, a0, sp
                  sra          a6, s7, s8
                  fmv.w.x      ft8, t3
                  fsgnjx.s     ft10, fs2, fa4
                  srai         t2, zero, 11
                  sra          t6, t6, s9
                  div          gp, a6, a5
                  fsgnjn.s     fs3, fs7, fa2
                  mulhu        ra, gp, s1
                  add          a1, s10, s5
                  fclass.s     zero, ft5
                  fmax.s       ft3, ft7, fs0
                  fsgnj.s      fa4, fs4, ft3
                  srl          t5, a7, s3
                  add          a1, a6, s3
                  mulhu        t5, s7, t1
                  sltiu        t0, a3, -1405
                  fdiv.s       fs4, fs8, fs7
                  fsub.s       fs5, ft0, ft5, rup
                  sra          t1, t6, a1
                  fsgnj.s      ft1, ft7, fs10
                  fmv.w.x      ft6, s2
                  fcvt.s.wu    ft7, a7
                  fmul.s       fs1, ft10, ft5, rtz
                  remu         s4, a6, a4
                  sub          s3, a1, s9
                  fadd.s       fs0, fs8, fs6, rup
                  sra          s8, s9, s6
                  fsqrt.s      fs4, fs5
                  srai         a3, t2, 12
                  fsgnjn.s     ft6, fa4, fs9
                  sltu         s11, s1, s5
                  ori          ra, a6, -1165
                  srli         tp, s9, 14
                  sub          s2, tp, t6
                  sub          a1, s5, zero
                  fmv.w.x      fa6, s7
                  fmax.s       fa6, fs8, ft5
                  fcvt.wu.s    s0, fs8
                  fadd.s       ft11, fs11, ft6, rne
                  sltiu        s4, t2, 149
                  fmv.x.w      s3, fa5
                  srl          a2, t3, sp
                  sltu         a3, a7, t2
                  mulhu        t1, s1, a2
                  andi         a0, s8, 1437
                  slt          s9, t3, s8
                  srl          s0, s8, s8
                  andi         t2, s10, -1485
                  lui          t2, 133581
                  fdiv.s       fa6, ft8, fs5
                  sltu         t5, zero, tp
                  srl          s0, t2, t3
                  auipc        sp, 443169
                  sltu         t2, t1, t0
                  sltiu        gp, ra, -1960
                  fsgnj.s      ft2, ft10, ft8
                  lui          t5, 591846
                  ori          s3, t2, 1346
                  andi         sp, s1, 913
                  mulh         gp, a6, a1
                  ori          a1, t3, 1378
                  mulh         sp, t4, a7
                  fle.s        s3, fs7, ft11
                  lui          a0, 56800
                  sltu         t0, ra, s11
                  srli         a2, s9, 16
                  fsgnj.s      ft4, fs7, fs5
                  flt.s        tp, fs1, fs7
                  fadd.s       fa3, ft5, fa5
                  divu         s5, t2, s1
                  mulhsu       s2, s8, t4
                  or           tp, a1, t4
                  rem          ra, a4, zero
                  fmin.s       fa3, fa1, fs8
                  fdiv.s       ft1, ft9, fa4, rtz
                  fcvt.s.wu    fs6, s11
                  mulhu        a6, a1, sp
                  auipc        zero, 7659
                  sltu         t1, s2, t3
                  fmul.s       fs7, fs8, fs5, rmm
                  xori         s8, a1, 1850
                  mulh         t2, a2, t4
                  divu         zero, s9, sp
                  sltiu        s11, s11, -525
                  fsub.s       ft10, fs11, ft5, rtz
                  or           s9, tp, sp
                  slli         s0, s5, 4
                  fdiv.s       fs8, fa6, ft2, rup
                  xor          t5, s8, s9
                  srai         a6, t2, 21
                  slt          t1, gp, s0
                  sll          a6, t0, s3
                  mulh         s10, s11, a6
                  fcvt.s.w     fa0, s5, rmm
                  addi         sp, s10, 1827
                  fcvt.s.wu    fs1, t3, rdn
                  sltiu        a5, a1, 1944
                  remu         s4, s11, s8
                  xori         t6, s0, -1758
                  sra          t0, t0, a5
                  add          a5, gp, s2
                  div          a4, zero, a4
                  fcvt.wu.s    a2, fa0, rdn
                  fmul.s       ft2, fa7, fa4, rtz
                  fmax.s       ft7, ft0, fa1
                  fmv.w.x      fs3, gp
                  auipc        t4, 589862
                  mulh         t2, a3, a0
                  slli         zero, s9, 31
                  xori         t0, s6, 1244
                  divu         a5, a7, t3
                  fsqrt.s      fa4, fs2
                  sll          sp, s8, sp
                  fmul.s       fa2, fs8, fa3, rtz
                  fclass.s     a6, ft3
                  xor          gp, s4, s4
                  and          s5, gp, ra
                  sltiu        s4, s9, 1401
                  fsgnjn.s     fs4, ft2, fa1
                  divu         a4, t4, s5
                  fdiv.s       fs9, fs4, fa3
                  xor          t6, s4, t1
                  remu         sp, s4, a6
                  fmin.s       fs0, ft3, fs9
                  mul          t4, a2, t5
                  slt          t3, tp, t3
                  fsgnjx.s     fs6, ft9, ft6
                  remu         s1, s10, a7
                  or           a6, s3, s8
                  fcvt.w.s     a0, fa4
                  div          t4, t3, a3
                  fmul.s       ft2, fa0, fs1, rtz
                  slt          gp, sp, sp
                  or           s2, a4, a1
                  fle.s        s8, fa4, ft4
                  feq.s        s10, ft7, ft0
                  fmax.s       fa2, ft3, fs10
                  fmin.s       ft2, fs5, ft8
                  fsqrt.s      ft0, ft5
                  fmv.w.x      ft6, s9
                  and          t3, a0, s0
                  fmin.s       fs8, fs9, fa7
                  fmax.s       fs3, fa6, fa7
                  fsgnjx.s     fa0, ft5, ft9
                  add          sp, t3, gp
                  fsgnj.s      ft8, fs7, fs8
                  mulhsu       s0, t6, s6
                  fsub.s       ft6, ft8, fs4
                  and          ra, zero, t3
                  fsgnjx.s     fs2, fa2, ft11
                  slt          t6, gp, s3
                  and          s8, s5, t1
                  lui          a0, 685805
                  fmul.s       ft8, ft1, ft5, rtz
                  srl          a4, a1, a2
                  srli         t0, t0, 27
                  flt.s        s0, ft10, fs1
                  sltu         a1, t4, t0
                  lui          s3, 217060
                  ori          t5, a3, -1254
                  ori          a0, s10, -185
                  mulh         s4, s8, sp
                  mul          zero, a3, s7
                  mul          t3, ra, sp
                  sltu         s2, tp, t1
                  fsgnjn.s     ft5, ft10, fa4
                  fsgnj.s      fa1, ft11, ft6
                  sll          s5, a0, s1
                  sltiu        s1, ra, -1037
                  fmv.w.x      fs9, s8
                  flt.s        zero, fs9, ft3
                  sltiu        s10, tp, -1509
                  addi         a1, s3, 1133
                  lui          t2, 1021661
                  and          t1, s5, tp
                  feq.s        gp, ft2, ft3
                  fclass.s     a3, ft9
                  mulhsu       zero, sp, a4
                  divu         t0, a2, a0
                  fadd.s       fa2, fs7, fs9
                  fmul.s       fs10, ft2, fs11
                  fsub.s       ft2, fs4, ft5
                  andi         a6, t2, 1835
                  nop
                  flt.s        a6, fa6, ft10
                  fsqrt.s      fs8, ft5, rtz
                  fmul.s       ft4, fa3, fa5, rne
                  fcvt.s.w     ft8, a7
                  fsgnjx.s     fa6, ft9, fa1
                  fcvt.w.s     ra, fs1, rtz
                  slti         a2, a1, -43
                  fcvt.s.wu    fs2, tp, rdn
                  xor          t1, sp, a3
                  sra          s5, gp, a6
                  andi         s1, s0, -1053
                  andi         s9, s11, -920
                  fsqrt.s      fa0, fs10
                  fadd.s       fs2, fa5, fa0
                  srli         t3, zero, 26
                  fcvt.w.s     s10, fs0
                  fsqrt.s      ft6, fs8, rtz
                  ori          ra, s3, -1182
                  div          a6, s1, t4
                  fcvt.wu.s    t3, ft1, rmm
                  sub          t3, s4, s6
                  slt          s1, a3, t4
                  flt.s        s1, fa4, fs5
                  fcvt.s.w     ft9, t0
                  fcvt.s.wu    fs3, s4, rne
                  fmax.s       fs3, fa7, ft6
                  fmax.s       fs0, fs10, fa7
                  mul          t3, t4, t5
                  fmax.s       fs11, ft10, fs0
                  fle.s        s9, fa5, fa7
                  or           a0, t1, s8
                  fcvt.w.s     a6, fa2, rup
                  fcvt.wu.s    a1, fs11
                  addi         t3, zero, 896
                  fmul.s       ft0, ft5, ft11
                  mulhu        a4, t3, t6
                  xori         s10, s0, -1357
                  fadd.s       fa5, ft5, fa5, rtz
                  lui          s5, 97197
                  mulh         gp, s1, s2
                  slli         s9, t6, 16
                  mulhsu       s1, s11, a5
                  nop
                  sra          t1, t1, t3
                  fmv.w.x      ft11, a6
                  fmv.x.w      s10, ft11
                  ori          a6, s8, -1609
                  slli         t3, sp, 3
                  fcvt.s.wu    fs0, s5, rup
                  mulhsu       tp, gp, a2
                  feq.s        tp, ft9, fs6
                  fsgnjn.s     fs5, ft5, ft3
                  srli         t6, t0, 2
                  mul          t2, s3, t1
                  fsub.s       fa3, ft4, fa4
                  nop
                  srl          t5, t5, sp
                  fsgnjx.s     ft4, fa2, fs3
                  div          ra, t0, a6
                  divu         a3, sp, a1
                  flt.s        s4, ft7, fa1
                  fsgnjn.s     fs5, ft10, fs7
                  divu         s0, t0, a1
                  fcvt.s.w     ft0, sp, rup
                  fmax.s       fs9, ft5, fa1
                  feq.s        a1, ft11, fa3
                  fsub.s       fs0, fs10, fa7
                  fle.s        t0, fa5, fs0
                  fcvt.s.w     ft11, t5, rmm
                  fmul.s       fs10, fs7, fa5, rmm
                  sll          s0, s0, s0
                  fmv.w.x      fs2, t6
                  slt          s4, a6, s4
                  fsgnjx.s     fs1, fa0, ft2
                  and          sp, a5, s10
                  fcvt.s.wu    fa3, t2, rup
                  slli         sp, a1, 26
                  fcvt.w.s     zero, fa3
                  slli         a6, ra, 4
                  fmv.x.w      a2, fa3
                  fmin.s       ft5, fa1, ft6
                  divu         s5, t0, a7
                  slti         t4, t2, -1436
                  srl          s3, s3, s9
                  remu         s9, sp, s7
                  fmin.s       ft0, fs0, fs6
                  xor          t1, t6, s5
                  mulhu        s3, t0, s5
                  slti         ra, s5, -1567
                  xor          a6, s11, tp
                  fmul.s       ft3, fa1, ft1
                  auipc        t2, 1036275
                  auipc        t4, 642141
                  fmv.x.w      t0, ft6
                  fsgnjn.s     ft8, fa3, ft3
                  sltu         a1, t6, a5
                  slti         zero, s7, -1730
                  andi         t1, a5, -1458
                  fcvt.s.w     ft0, zero, rdn
                  slli         s10, t6, 20
                  add          t4, a7, gp
                  fsgnjx.s     fs7, ft0, fs5
                  mulhsu       a1, tp, sp
                  sltiu        gp, tp, 1860
                  sll          s9, s3, s10
                  div          t1, gp, s9
                  sltu         s9, a7, s3
                  xori         a4, t6, -1413
                  fsgnjn.s     fa4, ft9, ft5
                  mulhu        t0, s6, s0
                  srl          s8, s8, a2
                  lui          s4, 534661
                  srl          s10, s5, s9
                  fmax.s       fa7, fa2, fa2
                  fclass.s     t6, fa1
                  sltiu        tp, tp, -1462
                  fcvt.w.s     t6, fa1, rtz
                  fadd.s       ft3, fs6, fs11
                  fsqrt.s      fs5, fs2, rmm
                  fcvt.s.wu    fa5, a7, rdn
                  srli         t2, s2, 27
                  fclass.s     a3, ft6
                  fcvt.s.wu    fs7, s11
                  andi         a6, s10, 741
                  slti         s9, ra, -1545
                  addi         a2, a6, 506
                  fclass.s     s4, fs2
                  fmin.s       fa0, fa1, fs3
                  fcvt.wu.s    t3, ft10
                  mul          a5, a0, tp
                  srli         s0, tp, 23
                  fcvt.s.wu    ft4, a4, rup
                  fsgnjn.s     fs5, fs1, ft4
                  xori         a1, s9, 1212
                  slli         s4, s9, 24
                  nop
                  fsgnjn.s     fa3, fs9, ft11
                  sltiu        a3, t6, 1699
                  srl          t5, s2, t6
                  sltu         t1, gp, t6
                  remu         tp, s6, s3
                  sltu         t5, a0, s10
                  fmv.x.w      s8, fs0
                  fsgnjn.s     fa7, fa0, ft9
                  fmul.s       fa5, ft10, ft6
                  fsqrt.s      ft8, ft11, rne
                  sltu         gp, s7, a3
                  slt          s11, a4, a6
                  mulhsu       sp, s1, s7
                  fsgnjx.s     fa6, ft8, ft4
                  fmv.x.w      s4, ft5
                  ori          a0, s1, 689
                  srai         gp, a1, 24
                  srl          tp, tp, zero
                  div          zero, tp, s2
                  fsub.s       ft0, fs7, fs9, rup
                  andi         s11, t1, 571
                  fadd.s       fs9, fs2, ft5
                  lui          a3, 732585
                  mulhu        s1, s1, t4
                  mulhsu       ra, s2, a2
                  slt          s9, t0, zero
                  nop
                  and          s5, zero, a2
                  fcvt.s.wu    ft3, a4, rdn
                  sra          s10, a6, s8
                  div          a1, s2, s6
                  srli         a2, t0, 31
                  divu         s11, a4, t4
                  fmv.x.w      ra, ft11
                  remu         s11, t3, a4
                  divu         a6, tp, tp
                  fsgnjn.s     fs7, fa7, ft6
                  mul          t3, a2, a6
                  fcvt.wu.s    sp, ft7, rdn
                  div          t3, sp, a6
                  sll          a4, a6, s11
                  sub          t3, t1, a2
                  fcvt.w.s     t4, fs3
                  fmin.s       ft2, fs5, ft2
                  fcvt.s.wu    fs9, s3, rne
                  fcvt.s.w     ft2, t5
                  fcvt.s.wu    fs5, t2
                  feq.s        gp, ft4, fa6
                  fcvt.wu.s    gp, fa7
                  andi         s5, a6, 102
                  slti         sp, s3, -30
                  fclass.s     sp, fs6
                  auipc        a2, 78624
                  andi         s10, s7, -1639
                  ori          a5, s3, -167
                  mulhu        a4, gp, tp
                  sltu         s9, a3, tp
                  slti         s8, t0, 1543
                  srl          s2, t0, s11
                  feq.s        tp, fs3, fs2
                  slt          a0, s11, t4
                  slti         a4, gp, -1428
                  sltiu        s5, ra, -154
                  div          tp, sp, t2
                  fmv.x.w      s4, ft7
                  feq.s        a4, fa7, fs4
                  srai         s5, s7, 3
                  sll          s3, s3, s9
                  andi         t0, a0, -592
                  mulhu        s10, s8, t4
                  fsqrt.s      ft0, fs7, rtz
                  mul          zero, s3, t0
                  div          a6, s6, a1
                  sub          gp, a0, t1
                  sll          s3, s2, tp
                  rem          t2, t6, s7
                  feq.s        a2, ft2, ft4
                  fmv.w.x      ft1, t1
                  xor          t1, s8, t4
                  mulhsu       t1, a3, s3
                  fmv.x.w      zero, fa2
                  fsgnjx.s     ft8, fa4, fa5
                  fcvt.w.s     a3, fs8, rup
                  sltiu        s8, s8, -1061
                  mulhsu       ra, s2, s8
                  fsub.s       fs3, fs8, ft10, rmm
                  mulhsu       s1, t2, s10
                  fcvt.wu.s    a4, ft7
                  fcvt.s.wu    fs4, s0
                  nop
                  addi         s5, ra, -755
                  mul          s1, s0, a7
                  srai         t3, gp, 3
                  feq.s        s0, fa1, fs2
                  srli         s0, s7, 21
                  andi         a2, a7, 1288
                  sll          ra, t1, a1
                  fcvt.s.wu    ft10, a3
                  srli         t6, s2, 7
                  fcvt.w.s     s5, ft4
                  sltu         s10, s6, s0
                  fsgnjn.s     ft5, ft3, fs10
                  fsgnj.s      fa5, fs7, fs7
                  fclass.s     t4, fs2
                  srl          s5, zero, a3
                  srai         tp, a7, 23
                  sra          t2, a2, a1
                  fmul.s       fa6, ft7, fs11, rmm
                  mul          s10, s4, gp
                  slli         s11, t0, 3
                  lui          tp, 622008
                  fmv.x.w      s0, fa3
                  lui          s9, 430482
                  fmin.s       ft11, ft1, ft9
                  fdiv.s       fs3, ft8, ft10
                  srai         ra, t3, 23
                  and          t2, t0, t4
                  add          a3, t6, zero
                  auipc        s10, 73051
                  sltu         a2, a2, gp
                  fmv.w.x      fs7, a3
                  xor          a4, t5, ra
                  nop
                  srai         a1, t0, 22
                  fclass.s     t2, fa0
                  fsub.s       ft2, fa6, ft6, rup
                  fmul.s       fs4, ft6, ft1
                  lui          s5, 98738
                  div          s0, t3, gp
                  feq.s        a4, fs4, fs2
                  fcvt.w.s     s5, fs4
                  or           a4, t1, s4
                  fdiv.s       ft4, fs8, ft11, rne
                  andi         s8, gp, -1932
                  fsgnj.s      fs0, fa1, fa7
                  xor          a4, s3, t2
                  divu         t5, s5, t5
                  mul          s5, a5, a5
                  lui          s1, 732465
                  fcvt.w.s     s2, fa5, rup
                  sltiu        s1, s5, 1668
                  divu         tp, s1, a2
                  remu         a2, s9, a6
                  sltu         t4, ra, a3
                  fcvt.w.s     a4, ft3
                  sll          s4, t0, t5
                  fadd.s       ft4, fa6, ft1
                  fle.s        t4, fs2, ft1
                  flt.s        a0, ft7, ft9
                  sra          ra, a6, s1
                  addi         s3, s5, 875
                  fdiv.s       fa2, ft5, fa2
                  sub          a6, a4, t1
                  sll          t6, t4, tp
                  fcvt.s.w     ft1, s2, rne
                  lui          t4, 875923
                  sltu         t1, a2, t0
                  or           t2, t4, a3
                  sub          ra, s4, a0
                  sltiu        s1, s5, 1601
                  fmin.s       ft0, fs4, ft11
                  fsgnj.s      fs7, fs4, fa7
                  add          a4, s10, t3
                  fcvt.s.wu    ft1, t2
                  sltu         a6, a3, s9
                  slli         s1, a2, 26
                  addi         tp, tp, -244
                  remu         gp, s0, ra
                  fcvt.s.wu    fs1, s8, rdn
                  sltu         a4, zero, s0
                  div          t3, t6, a5
                  xori         s2, a5, -1239
                  slt          t1, a4, sp
                  slt          s9, t6, s2
                  nop
                  flt.s        t3, fa1, fa2
                  div          t3, s3, s11
                  sub          s2, a7, a4
                  fmul.s       fs0, ft7, fa5, rtz
                  srli         s3, tp, 23
                  sltu         t5, zero, s7
                  or           a0, s6, a0
                  srai         s2, ra, 5
                  fcvt.s.w     ft11, s0, rne
                  fmin.s       fs3, fs7, fs7
                  slti         a0, s11, 1260
                  sltu         s5, s4, s10
                  mul          s9, s10, s11
                  fcvt.w.s     a1, ft1, rmm
                  sltiu        a3, a1, -1139
                  mulhu        s3, t0, s10
                  slli         sp, sp, 13
                  fdiv.s       fs5, fs9, fs2, rup
                  fclass.s     s4, fa6
                  divu         a1, zero, tp
                  fadd.s       fa5, ft9, ft0, rup
                  fmv.x.w      tp, fs10
                  fmul.s       fs6, fs6, ft2, rdn
                  mulh         ra, s2, a0
                  sra          s3, s10, t1
                  sltu         gp, s9, t6
                  sltu         s2, s5, s4
                  sub          s9, s8, s9
                  lui          a1, 234642
                  fmv.x.w      a3, fa5
                  sll          zero, s0, s7
                  fle.s        s5, ft7, ft6
                  fdiv.s       ft10, ft8, ft0
                  fsqrt.s      fs5, fs0, rup
                  fcvt.s.wu    ft1, a4, rdn
                  mulhu        a6, gp, a2
                  sll          s3, s7, t6
                  mulh         t6, s7, zero
                  addi         a3, t2, 1720
                  divu         a6, s1, s6
                  fsqrt.s      fa1, fa6
                  feq.s        a3, fs2, ft5
                  slli         a0, zero, 12
                  auipc        a6, 453923
                  add          t2, a2, s7
                  fcvt.wu.s    a1, ft5, rup
                  fmv.x.w      s5, ft1
                  sra          a0, s9, s5
                  fcvt.s.w     fa6, s6, rmm
                  or           a0, s5, a0
                  div          a4, a0, a7
                  lui          t6, 110833
                  fsgnjn.s     fa3, fs1, ft10
                  or           t1, a3, gp
                  slt          s11, s7, ra
                  sra          s1, t0, tp
                  lui          t1, 692967
                  add          s9, ra, a3
                  flt.s        t2, ft1, fs9
                  sll          a4, s8, a7
                  slli         t3, ra, 19
                  div          t0, s8, s4
                  fsgnj.s      fa7, fa2, fs10
                  fdiv.s       fa3, ft6, fs9, rup
                  mulhsu       s2, s5, s7
                  fmul.s       fa6, fs4, fa0
                  xori         s10, t6, -74
                  xori         s10, s1, -1390
                  fsub.s       fs3, ft3, fa5, rtz
                  slti         s11, s10, 1390
                  sltu         a5, a5, s9
                  fmax.s       ft6, fs3, ft2
                  fmax.s       fs4, ft11, fa6
                  fsgnjx.s     fs8, ft7, ft0
                  mulh         tp, s2, a2
                  lui          s4, 1004600
                  sll          s5, s5, s6
                  fmv.x.w      t6, fa5
                  sltu         t5, a2, a4
                  sra          s3, t3, s1
                  slli         s11, a4, 2
                  fmul.s       fa5, fs7, fs4, rne
                  nop
                  or           ra, a2, s0
                  fsgnj.s      fa4, ft1, ft1
                  fmul.s       fs4, fa6, fs4
                  fsgnjx.s     ft1, ft10, fa4
                  fmv.w.x      fs8, a2
                  div          s3, a4, t4
                  or           t2, s4, s3
                  srai         t0, tp, 23
                  rem          t5, a7, gp
                  fmul.s       fa5, fs10, ft2
                  fclass.s     s0, fs7
                  fmin.s       fs0, fs8, ft0
                  sltiu        zero, tp, -1667
                  xor          s9, ra, tp
                  rem          tp, s10, a5
                  div          t2, a7, s7
                  fmv.w.x      fa6, s4
                  fmul.s       ft11, ft7, ft9, rup
                  divu         t6, t2, a1
                  fsub.s       fs7, ft1, ft10
                  sra          t4, a4, s7
                  fclass.s     a3, fa0
                  fsgnj.s      ft4, ft10, fs9
                  or           s4, a7, t3
                  divu         s0, s8, a3
                  ori          t6, a7, -1630
                  rem          t3, gp, a0
                  fcvt.wu.s    s1, fs8
                  fmin.s       fa7, fa2, fs7
                  fsqrt.s      ft6, ft1
                  fmax.s       ft7, ft9, fs9
                  fle.s        s10, fa2, fs11
                  divu         a4, s0, t5
                  fclass.s     s4, fa0
                  fsgnjn.s     ft2, fs0, fs9
                  fsqrt.s      fs4, ft9
                  mulh         a3, a3, s10
                  ori          t6, a0, 1705
                  mulhu        t0, s3, a2
                  addi         t6, a5, -896
                  and          t4, s10, zero
                  fsgnj.s      fs8, fa4, fs3
                  ori          zero, s5, -1790
                  slti         a0, a2, -1924
                  flt.s        s5, fs11, fa5
                  mulh         a5, s10, t3
                  ori          s4, gp, -476
                  fle.s        a5, fa2, ft0
                  mulhu        s4, s7, t0
                  fsub.s       fs6, fs2, fs3
                  nop
                  sltiu        sp, s5, -939
                  fsqrt.s      fs10, fa5, rmm
                  and          t1, s2, a3
                  fle.s        t0, fs10, ft1
                  mulhu        s3, sp, t2
                  fle.s        a0, ft7, ft0
                  fsgnjx.s     fs3, fa0, ft7
                  fmin.s       fs2, fs7, fs8
                  fcvt.w.s     s1, ft5
                  lui          a6, 916877
                  ori          zero, t5, 265
                  add          a0, t1, ra
                  slli         a5, t0, 14
                  slt          t3, sp, s11
                  sub          s2, a6, s8
                  fadd.s       ft9, fs10, fs2, rtz
                  sltiu        t0, s5, -1427
                  feq.s        a2, fa3, fa7
                  ori          s1, s9, 1407
                  div          t6, zero, t3
                  mul          s11, s6, sp
                  mulhsu       t5, t2, t3
                  mulhsu       t4, s6, tp
                  fmul.s       ft0, ft9, fs4
                  sub          a6, t5, t4
                  sub          a1, s3, s7
                  fle.s        a6, ft9, fs8
                  auipc        s9, 868914
                  fsgnj.s      ft10, fs6, fs5
                  fmin.s       ft7, ft5, fs6
                  sra          s2, s1, a6
                  fmax.s       ft6, fs7, fs4
                  add          t2, a7, a6
                  flt.s        tp, ft8, ft7
                  feq.s        a1, ft3, fa1
                  fcvt.wu.s    zero, fs10
                  fclass.s     s2, ft0
                  lui          t1, 351398
                  mulhsu       t0, a3, a5
                  xori         s4, s4, 370
                  fsgnjx.s     ft9, ft7, fa7
                  mul          ra, s3, gp
                  sltiu        a0, a7, 1923
                  slti         s8, s3, -1229
                  fmin.s       fs10, ft1, fa6
                  fsqrt.s      fs9, fa0, rdn
                  mulhu        s4, zero, s11
                  nop
                  fmin.s       fa2, fa5, fa1
                  fmv.w.x      fs4, gp
                  fmul.s       fs7, fs4, fs6
                  sltiu        tp, a1, -191
                  fmin.s       ft11, ft8, ft0
                  xori         s10, a5, 398
                  fmul.s       fs11, ft6, fs7, rdn
                  divu         s3, ra, s1
                  mulhsu       tp, a6, s1
                  fsgnjx.s     ft8, fs1, fs11
                  sltiu        s3, s1, -1173
                  fsgnj.s      fs3, fa7, fs0
                  divu         a6, a7, s2
                  nop
                  fclass.s     t6, ft5
                  srl          a0, zero, tp
                  fmv.x.w      t3, ft10
                  fmv.w.x      fa4, s1
                  sltu         s8, s9, tp
                  divu         s4, a4, a0
                  slli         s4, s4, 3
                  fsgnjx.s     ft8, fs9, fs5
                  sltiu        a6, t0, -1714
                  fsub.s       fs11, fs8, fs3, rup
                  div          s8, s2, s6
                  fclass.s     s4, fa5
                  fsqrt.s      fs0, ft10
                  auipc        a3, 359082
                  slti         a6, t5, 797
                  auipc        t4, 85016
                  remu         a2, s11, gp
                  fsqrt.s      ft3, ft8, rne
                  xori         a6, s11, 512
                  flt.s        t6, ft8, ft3
                  fmin.s       ft6, fs6, ft7
                  flt.s        t0, fs0, fs0
                  remu         s5, s1, s6
                  slti         t3, t2, 1822
                  sll          a1, a4, a4
                  fdiv.s       fs11, fa5, fs2
                  fclass.s     tp, fa3
                  sub          t5, a2, a7
                  fadd.s       fa2, fa6, ft11
                  ori          s9, a1, -239
                  srai         tp, a5, 19
                  fmv.w.x      fs1, a3
                  fclass.s     a4, fa1
                  flt.s        s3, fa0, fa2
                  fcvt.s.w     fs0, a2
                  xor          s10, t5, a5
                  sub          s2, s5, a0
                  fsqrt.s      ft3, fs5
                  slli         s8, s9, 0
                  div          ra, s0, tp
                  fle.s        a2, fs9, ft6
                  nop
                  fcvt.wu.s    s0, fs5
                  fadd.s       fa0, fs7, fs0, rdn
                  xor          t5, s0, s3
                  rem          a1, sp, s6
                  xori         zero, a7, -1523
                  srli         s8, sp, 9
                  fsqrt.s      fa1, ft9, rdn
                  fsgnjx.s     ft11, fs6, ft0
                  fcvt.s.w     fs11, s3
                  slt          s4, s6, t4
                  fcvt.s.w     fs2, t5, rup
                  fsgnjx.s     fa5, fs11, fs4
                  andi         a5, a3, 992
                  srli         s4, s9, 30
                  fmul.s       fs7, fs3, fa3, rne
                  rem          s8, s8, t5
                  fcvt.wu.s    a2, fs5, rmm
                  div          t5, a4, t3
                  xor          a5, t0, t4
                  fcvt.s.w     fa5, s7
                  nop
                  add          t3, sp, s10
                  mulh         t1, t3, gp
                  slt          zero, s1, gp
                  sub          gp, s3, s6
                  slt          t0, s8, s6
                  fmv.x.w      s10, fs4
                  sub          s5, t4, s1
                  flt.s        t3, ft8, fa2
                  fsqrt.s      fs6, fa7
                  fmv.w.x      fs5, s0
                  mulhsu       s5, s9, ra
                  addi         a6, a2, 86
                  nop
                  srai         t4, t6, 0
                  fmax.s       fs5, ft2, ft3
                  fcvt.s.w     ft8, s9
                  sltiu        a5, zero, 687
                  fmv.x.w      zero, fs7
                  fdiv.s       fs5, ft1, fs8, rne
                  mul          zero, t5, t1
                  mulhsu       t2, s11, gp
                  auipc        t1, 788337
                  flt.s        s0, fs6, fa2
                  fsqrt.s      fs7, fs10, rdn
                  sra          s10, s2, zero
                  fmv.x.w      s2, ft6
                  fsgnjx.s     ft5, ft3, fa5
                  xori         t5, s9, -354
                  addi         t6, a5, 542
                  sltu         s9, a0, sp
                  xori         s4, a3, -835
                  fsub.s       fs8, fs11, fs0
                  srli         t3, s2, 2
                  fmul.s       fa2, fa3, fs11
                  fmv.w.x      ft1, a0
                  sltu         a1, s2, a0
                  sll          t4, s2, t6
                  nop
                  sll          t4, s9, t6
                  feq.s        gp, ft6, ft4
                  fdiv.s       fs7, ft5, fs10, rup
                  srai         t0, t0, 0
                  srai         t0, a6, 22
                  sltiu        gp, a3, 1510
                  slti         a4, s7, -502
                  fsub.s       ft7, ft3, fs7, rdn
                  fmv.x.w      s11, ft5
                  fcvt.s.wu    fa4, a0
                  sll          a2, t1, a6
                  mulhu        t2, t5, a6
                  lui          t6, 528451
                  fmin.s       ft11, fs1, fs2
                  slli         t3, a6, 25
                  fadd.s       fa6, fs10, ft6
                  sltu         s8, t5, a5
                  fmv.x.w      s8, fs7
                  sll          s5, s4, a7
                  srli         t5, tp, 21
                  fmax.s       ft1, ft6, fs7
                  div          a5, tp, s2
                  fcvt.w.s     a6, fa0
                  nop
                  mulh         s10, s11, zero
                  fcvt.s.wu    fs2, t0, rtz
                  srli         t6, s5, 9
                  sll          a0, s7, s2
                  srli         ra, t5, 13
                  fmv.x.w      s8, fa3
                  fle.s        tp, fs10, fa1
                  xori         a2, ra, -874
                  nop
                  fcvt.s.wu    ft11, s7, rne
                  fcvt.wu.s    s9, fa7, rdn
                  mulh         t6, a4, s5
                  slli         a0, s7, 20
                  mulhsu       s5, s11, s10
                  slli         a1, s3, 10
                  slt          s5, s11, s7
                  and          a2, t1, t4
                  xori         a5, gp, -318
                  remu         a5, s3, s2
                  fcvt.wu.s    s8, fs5, rup
                  srl          s1, t5, s7
                  fadd.s       ft10, fa4, fs9, rup
                  xori         s9, t2, -1595
                  fcvt.w.s     a2, fs2, rdn
                  add          a4, t6, s6
                  andi         a2, a4, -1888
                  fcvt.s.w     fs0, s6, rdn
                  flt.s        a2, fa7, fs1
                  fmin.s       ft7, ft11, fa3
                  auipc        a2, 167044
                  xori         ra, a4, -310
                  or           t3, a3, s1
                  fmax.s       fs3, fa4, ft9
                  xor          gp, t0, a5
                  lui          s11, 531407
                  andi         t2, s9, 909
                  sra          t5, ra, s1
                  fcvt.s.w     fa1, ra, rmm
                  fcvt.s.w     fa4, a6
                  ori          s9, s8, 1928
                  mul          t5, s9, a3
                  fcvt.s.wu    ft8, a5
                  srli         t3, s4, 23
                  mulhsu       ra, a0, s5
                  fcvt.s.wu    ft0, a7, rdn
                  xor          a6, a6, t6
                  sltiu        sp, a1, 1970
                  flt.s        t2, ft1, fa3
                  addi         t5, gp, -1236
                  fcvt.wu.s    ra, ft1, rmm
                  fle.s        s8, ft8, fs9
                  fsqrt.s      fa1, fa2
                  mulh         tp, s11, t5
                  slli         tp, a5, 3
                  fsqrt.s      fs6, fs1
                  rem          s1, s10, t5
                  feq.s        s8, fs6, ft7
                  remu         zero, zero, s1
                  mulhsu       s4, t4, a5
                  srl          gp, s5, t2
                  sltiu        a4, a5, 321
                  fsgnjn.s     ft10, fs11, ft0
                  divu         ra, s1, s10
                  sub          s2, s4, t0
                  mulh         t6, a0, t5
                  sltiu        t1, s6, 668
                  rem          a3, a2, t4
                  fclass.s     a2, fa2
                  fcvt.w.s     zero, fa7
                  sltiu        a2, s8, 1892
                  fdiv.s       fs8, ft8, ft1
                  flt.s        s8, fa0, fs9
                  mul          t0, tp, s4
                  srai         s4, s11, 26
                  fmv.x.w      a2, ft5
                  fcvt.s.wu    ft5, s4
                  xori         t2, ra, -1780
                  addi         t6, a3, 865
                  sub          s4, s6, s1
                  fsub.s       ft0, ft3, ft2, rdn
                  lui          a5, 335640
                  fsqrt.s      ft0, ft11, rmm
                  fmv.x.w      s1, fs7
                  xori         a3, t0, -2047
                  remu         a3, a4, ra
                  fsgnjx.s     fa7, ft6, ft0
                  fle.s        s11, fs6, ft1
                  ori          s0, s9, -495
                  fdiv.s       fs1, fs7, fa0
                  fcvt.s.wu    fa2, s6, rne
                  andi         t5, s9, 873
                  fsgnjn.s     fs2, fa5, ft5
                  fmv.x.w      s9, ft0
                  xor          s2, a4, s6
                  ori          s11, s2, -641
                  fsgnjx.s     fa1, fs4, ft11
                  slt          s5, s9, gp
                  feq.s        tp, fa1, fs2
                  fadd.s       ft1, fs9, fs8
                  sltiu        t2, s10, 1967
                  mulh         a1, s10, t2
                  mul          t2, t5, gp
                  fcvt.w.s     s11, fa2
                  andi         a6, t6, -465
                  fadd.s       fa3, fs6, fs11, rtz
                  fsgnj.s      fs9, fs9, ft11
                  divu         a6, t2, s0
                  sra          s9, t5, tp
                  or           s0, s8, s0
                  sltiu        t2, a4, 1793
                  fclass.s     ra, ft10
                  fsgnj.s      fa5, fs4, ft7
                  fle.s        gp, ft4, fs6
                  fclass.s     zero, ft0
                  mulhsu       s3, ra, a4
                  div          a3, tp, gp
                  sltu         a5, s5, s1
                  fsub.s       fs0, ft10, fs10
                  sll          a5, s11, s8
                  mulhsu       t4, s8, s4
                  slli         s4, a7, 0
                  fcvt.s.w     fs9, ra
                  fmv.w.x      fa3, s4
                  slti         t4, a3, 1483
                  remu         s1, a1, s4
                  slli         t5, t0, 9
                  fcvt.s.wu    fa1, s5, rdn
                  divu         t1, t5, s7
                  sltu         t6, s2, a0
                  fsgnj.s      fs4, fa1, fs4
                  sltiu        s0, s3, -341
                  fmax.s       fs2, ft11, ft9
                  andi         s10, t5, -154
                  fsub.s       fs0, ft1, fa2
                  fsub.s       fs7, ft4, fs7
                  and          a4, t0, a7
                  mul          s2, t1, s1
                  fsgnj.s      fa5, fa3, ft4
                  xor          t4, a3, t2
                  addi         t5, s9, -1674
                  feq.s        s2, fs2, ft10
                  mulhu        zero, t0, t0
                  fmul.s       fs1, ft8, ft7, rdn
                  auipc        t0, 1045786
                  fclass.s     s8, fs11
                  fsub.s       ft1, ft1, fs11, rtz
                  rem          a0, t6, t0
                  fmax.s       fs8, ft2, fa6
                  mul          sp, s2, t5
                  sltiu        s10, a4, -1387
                  fsgnj.s      ft1, fs9, fs6
                  fsgnjx.s     fa6, ft7, fs3
                  slt          s0, t3, s6
                  srli         s8, t5, 10
                  fcvt.s.wu    ft2, a1, rdn
                  addi         a0, t3, -846
                  xor          ra, s5, a0
                  srl          t2, s1, s1
                  xor          s10, a2, s8
                  slt          a3, gp, s9
                  mulh         s0, a6, t6
                  fadd.s       fs11, ft8, ft2, rne
                  fsub.s       ft6, fs3, fa1, rtz
                  addi         a1, s4, -1197
                  fmax.s       fs0, ft5, fa0
                  sub          t2, a7, s4
                  fle.s        t6, fa3, ft9
                  remu         s3, a7, t3
                  sra          s8, s2, s11
                  fadd.s       ft3, fs11, ft10, rmm
                  mulh         a3, t6, a3
                  fcvt.s.w     fs5, s5
                  mulh         a1, s1, a2
                  fdiv.s       fs7, fs10, fs1
                  auipc        a1, 321580
                  and          s9, a2, t2
                  xori         s9, s8, 1035
                  srli         s8, s3, 18
                  flt.s        s4, ft9, fs1
                  rem          zero, gp, s5
                  fmax.s       fa1, fa6, fs1
                  srli         s9, s4, 22
                  fmax.s       fs10, fa7, ft4
                  addi         a1, s9, -1999
                  fdiv.s       ft7, fs0, fa2
                  srai         a3, a0, 23
                  nop
                  fcvt.s.wu    fs6, zero
                  fclass.s     t2, ft2
                  fle.s        sp, fs0, ft2
                  fsgnjx.s     ft7, fa2, fs6
                  remu         s5, a7, gp
                  addi         s11, s4, -1245
                  srl          t4, s6, t5
                  feq.s        s9, fs1, ft8
                  addi         ra, a3, 572
                  mulhsu       t1, t0, s2
                  auipc        t6, 978737
                  fmv.x.w      s4, fs4
                  slti         t6, a4, 204
                  feq.s        t3, ft6, ft8
                  auipc        s0, 679116
                  fmul.s       fs2, fs1, ft1, rtz
                  sub          t4, a4, a2
                  addi         ra, sp, 443
                  ori          t5, a1, 1020
                  fmax.s       ft3, fa5, ft6
                  slli         s5, s6, 31
                  sub          t0, t4, a4
                  slli         a1, s7, 7
                  srl          s4, a4, s11
                  mulhu        t5, s6, a6
                  rem          a2, a7, sp
                  flt.s        s11, ft1, fs2
                  lui          zero, 402491
                  fmv.x.w      a2, fs3
                  fsqrt.s      fa4, fs6, rmm
                  andi         s8, t3, -853
                  fsub.s       ft11, ft7, ft10, rne
                  auipc        a0, 211254
                  sub          a3, s7, t2
                  fclass.s     s0, ft4
                  slti         gp, s10, -1069
                  fmv.w.x      fs3, zero
                  xor          s3, a6, a6
                  div          s8, s3, s10
                  div          s2, t6, s7
                  xori         a1, a1, -1578
                  addi         a4, a7, -1018
                  fsgnjx.s     fs9, fa3, fa4
                  fsgnj.s      fs1, fa0, ft9
                  sll          t4, a5, t6
                  mulhu        s8, t1, t6
                  fsub.s       fa4, fa1, fs8
                  remu         ra, t1, t4
                  mulh         sp, s10, a4
                  sll          s0, s0, tp
                  remu         a1, a3, s8
                  fmax.s       fa1, fs0, fs10
                  mul          a3, zero, gp
                  mulh         sp, s11, s11
                  xor          s8, s10, s9
                  rem          t5, s6, a4
                  fcvt.w.s     s3, fa6
                  mulhu        s5, s10, sp
                  fcvt.s.w     fs6, gp, rdn
                  fsub.s       ft7, ft1, fs11, rtz
                  fclass.s     s10, fa0
                  or           a0, s5, ra
                  mul          s1, t6, a7
                  fmax.s       fa5, fa5, ft10
                  xori         s11, s10, -500
                  fsqrt.s      fs5, ft7
                  ori          t4, gp, 530
                  xori         s8, t6, 1270
                  fsgnj.s      fs11, fa0, ft11
                  fmv.w.x      ft10, a6
                  sltu         a0, s11, a3
                  sra          t3, t5, a4
                  sltiu        s5, s3, -380
                  srl          t0, a0, t3
                  srli         a2, t6, 27
                  remu         a0, s0, s6
                  fsub.s       ft6, ft3, fs11
                  sltiu        a0, s8, -971
                  fclass.s     s1, fa7
                  div          t0, t4, s9
                  slti         s5, s2, -1133
                  and          sp, sp, a3
                  xori         s8, zero, 8
                  divu         t4, s0, s1
                  rem          t5, s0, s1
                  auipc        s5, 851759
                  nop
                  div          s3, tp, s9
                  fmv.w.x      fs4, t6
                  slli         t6, s1, 3
                  fsub.s       fs4, fs0, ft4
                  auipc        t3, 665456
                  fsgnjn.s     ft0, ft2, ft2
                  flt.s        t6, fs1, fs4
                  fcvt.s.wu    fs6, a0, rup
                  auipc        s11, 1007176
                  mulh         gp, a6, s10
                  sra          s1, s6, a1
                  fmin.s       fa0, fa4, ft5
                  divu         a1, t3, t5
                  fmul.s       fs8, fa0, ft4, rmm
                  sub          t4, a5, s5
                  fsgnjn.s     fs0, ft7, fa6
                  mulhu        a1, gp, s4
                  fcvt.w.s     a2, ft4
                  rem          s11, s8, a1
                  add          s5, t6, s4
                  fsgnjx.s     ft9, fs6, ft9
                  fsgnjx.s     fs1, ft4, fa2
                  slli         s3, t4, 19
                  rem          zero, t0, s3
                  slt          a4, s7, tp
                  auipc        a2, 928737
                  ori          gp, tp, 1841
                  srl          s1, ra, a2
                  mul          a6, s8, tp
                  mulh         t4, a2, s6
                  flt.s        s4, ft0, fa3
                  fmv.x.w      a0, fs10
                  mulhsu       s10, s7, t4
                  addi         a3, tp, -42
                  fsqrt.s      fs5, fa2, rne
                  fcvt.wu.s    s9, fs11
                  fmv.w.x      ft0, s0
                  xori         zero, a5, 1096
                  fsgnj.s      fs7, ft9, fs7
                  lui          s5, 774046
                  srai         ra, a2, 7
                  xor          a5, s1, a2
                  sltu         s2, sp, t6
                  fmin.s       fs7, fs9, fa3
                  sltiu        tp, a4, 559
                  and          t5, s1, a4
                  srl          s2, a0, t4
                  fsub.s       ft10, ft7, ft4
                  mulhsu       s2, t5, s0
                  fsgnj.s      fa6, ft5, ft3
                  remu         s9, sp, a3
                  srai         zero, t0, 30
                  and          t1, sp, ra
                  feq.s        a3, fs9, fs5
                  fcvt.wu.s    t1, fa7, rdn
                  fle.s        t4, fa0, ft2
                  fmul.s       ft7, fs0, fs5, rne
                  slli         s9, t6, 8
                  and          t0, t1, s9
                  fadd.s       fa0, ft1, ft0
                  fsgnj.s      ft9, ft9, ft6
                  fcvt.s.wu    fs2, s9
                  slt          s4, s8, s11
                  ori          a1, t6, -1863
                  fmv.x.w      tp, fs0
                  fsgnj.s      ft2, ft4, fa2
                  and          a1, s1, a0
                  feq.s        s4, fa6, fs9
                  slt          ra, s9, t2
                  fsgnjx.s     fa3, fs8, fs1
                  addi         s0, t4, 1667
                  auipc        a2, 937010
                  fsgnj.s      fs4, fs5, fs8
                  fmv.x.w      a1, fa7
                  slt          s0, t4, gp
                  mulh         ra, t5, tp
                  add          a4, s1, a0
                  fsgnjn.s     fa0, fs5, fa1
                  srl          sp, s8, s2
                  sub          a1, s4, s8
                  fclass.s     a3, fs5
                  divu         s2, s8, s0
                  divu         t4, ra, sp
                  fadd.s       fs11, ft11, ft0, rne
                  slti         s9, s4, 611
                  add          s3, a1, s0
                  sub          s1, s0, a3
                  sll          a0, a7, s6
                  xori         s3, s7, -1115
                  srl          t6, a4, a2
                  fadd.s       ft1, ft11, fs11, rne
                  mul          a3, t5, s11
                  auipc        s2, 98066
                  add          a6, tp, t2
                  xor          a5, sp, zero
                  fcvt.w.s     t5, ft0, rup
                  fmul.s       ft7, ft1, ft4, rdn
                  fdiv.s       ft8, fa1, fa4, rdn
                  srli         s9, s0, 16
                  fmax.s       fa3, fs8, fa2
                  srai         a4, s5, 13
                  auipc        a6, 343236
                  fmul.s       ft1, ft10, ft6
                  div          s9, s1, a2
                  or           t4, t3, s2
                  fmv.w.x      ft6, s2
                  fmax.s       ft5, fa6, ft4
                  mulhsu       s3, sp, a7
                  fcvt.s.w     fs1, s8
                  sltu         ra, s7, s3
                  auipc        t5, 222480
                  slt          t0, a1, a0
                  fadd.s       fa1, fs3, ft5
                  ori          s2, t5, 496
                  fadd.s       ft8, fs2, fa3, rtz
                  addi         a0, s5, 2046
                  fadd.s       fa5, fs10, fs4, rup
                  xori         a5, s7, 693
                  ori          s8, s11, -852
                  fmv.x.w      a4, fa7
                  xor          t1, s7, t5
                  fmv.x.w      a0, fa4
                  add          t2, a7, t1
                  fcvt.wu.s    gp, fs5
                  sltu         a2, s10, s5
                  fcvt.wu.s    t4, fa3
                  slt          s4, t4, t1
                  flt.s        t1, fs4, fs4
                  fmv.w.x      ft10, a4
                  div          t5, sp, t6
                  andi         a1, a7, -1490
                  mulhu        a1, s1, s8
                  fsqrt.s      ft3, ft2
                  or           s8, a4, s6
                  fcvt.s.wu    fs5, gp, rtz
                  sll          a0, s10, t4
                  sltu         a3, a2, a0
                  fcvt.wu.s    t2, fa4, rne
                  or           a4, a5, t3
                  fsqrt.s      fs6, fs3
                  fsgnjx.s     fs7, fs3, fa1
                  xori         t2, s4, 1374
                  mulhsu       s11, t5, a6
                  and          s5, zero, a6
                  fcvt.w.s     a0, ft4, rmm
                  auipc        a6, 487028
                  srli         a1, s2, 0
                  fmv.w.x      fa1, a5
                  slli         gp, a4, 29
                  remu         t0, a1, a2
                  sll          tp, s4, t4
                  fle.s        a4, ft4, fs2
                  fle.s        a6, fs3, fa3
                  sra          tp, a5, s5
                  lui          ra, 759586
                  fmv.x.w      a6, ft7
                  sra          a2, zero, t0
                  sltiu        a2, s8, -590
                  fadd.s       fs9, fs1, fa4
                  mul          s9, a0, t0
                  slli         s3, t6, 26
                  add          t2, a1, a6
                  remu         t2, t0, gp
                  flt.s        t2, fa2, fs4
                  flt.s        a4, ft0, fa7
                  xori         s3, a7, -545
                  addi         gp, a0, -1960
                  sra          a6, a3, a1
                  sll          a5, a0, s10
                  fcvt.wu.s    a2, fa7, rmm
                  fsgnj.s      fs10, ft8, ft2
                  srl          ra, a3, s6
                  feq.s        zero, ft0, fa0
                  srl          t5, a6, a3
                  sltiu        t3, s4, 995
                  fsgnjx.s     fs5, fa7, fa0
                  sra          t3, s9, t0
                  sltiu        s0, s9, -1714
                  mulhsu       t4, tp, s4
                  remu         s5, s6, a3
                  fsgnjn.s     ft10, fs9, ft8
                  slli         a0, s0, 31
                  sra          a5, zero, s9
                  and          s5, s9, t3
                  sltiu        s5, t1, -1479
                  fclass.s     a1, fs10
                  fmv.x.w      ra, fa4
                  srai         a4, s3, 20
                  mul          s2, s10, a2
                  divu         t6, sp, t4
                  fcvt.w.s     a4, ft4, rne
                  ori          s1, ra, 422
                  feq.s        t2, fs1, fa5
                  fmax.s       fa5, ft6, ft0
                  srai         t2, s0, 21
                  slli         zero, a2, 0
                  ori          s0, s4, -1339
                  fsgnjn.s     fa6, fs0, fs7
                  div          a4, tp, s0
                  fclass.s     s5, fa1
                  divu         a4, s6, s1
                  xor          t6, a7, t0
                  fdiv.s       ft2, ft6, ft4, rdn
                  slti         tp, t6, -682
                  div          sp, zero, a0
                  mulhsu       gp, a4, t5
                  ori          s11, ra, 1080
                  fsgnjx.s     fs5, fs7, fs5
                  slt          gp, s10, s5
                  fadd.s       ft3, fs4, fa7
                  ori          s5, s4, 1756
                  slli         a3, s11, 18
                  fmul.s       fs5, fs3, fs1, rtz
                  fdiv.s       fs10, ft7, fs2, rup
                  fsgnjx.s     fs10, fa4, ft8
                  or           s3, s11, t4
                  div          gp, gp, a7
                  fcvt.s.w     ft8, s8, rtz
                  fsgnjn.s     fa0, ft11, fa7
                  fsgnjx.s     ft6, ft3, ft6
                  fcvt.s.wu    fa2, s5
                  div          s1, ra, s8
                  or           zero, a6, a3
                  fsub.s       ft4, ft7, fa6, rup
                  fmv.x.w      t4, fa2
                  sub          gp, t5, t3
                  mulhu        s4, s4, s9
                  sra          s3, a7, s7
                  mulh         t5, ra, t3
                  slli         a1, zero, 2
                  slti         s11, t0, -1540
                  fmin.s       ft5, fs5, fa7
                  addi         t1, t2, 367
                  fmin.s       fa7, fa1, ft11
                  xori         a3, a4, 265
                  sub          t2, t4, t0
                  sra          s10, a4, t4
                  fsgnj.s      fs8, fs11, fa3
                  slli         s5, s7, 2
                  fcvt.w.s     t1, fs9
                  feq.s        a3, ft2, ft4
                  or           a2, s8, zero
                  fadd.s       ft0, fa2, fs8, rne
                  fsgnjn.s     fa1, fs2, fs6
                  fadd.s       ft9, fa3, ft7, rne
                  addi         s11, t3, 1390
                  fmin.s       fa5, fs2, fs10
                  srai         gp, a0, 25
                  feq.s        s0, fa2, fs5
                  fmax.s       fs10, fs8, ft4
                  mul          gp, t0, a5
                  fmv.w.x      fs9, t1
                  fsgnjx.s     ft0, ft7, fs1
                  fsgnjn.s     fa3, ft2, fs11
                  sltiu        t2, a3, -403
                  fsgnjx.s     fa1, fa1, ft6
                  slt          t1, s5, t1
                  and          t3, s0, s7
                  sub          ra, a3, t0
                  addi         a6, zero, -1933
                  mul          t2, t3, s10
                  fsqrt.s      fs0, fs4
                  div          zero, s7, s7
                  and          ra, s7, s7
                  xori         t5, a7, 672
                  xor          a0, t4, t1
                  mulhsu       s8, a0, ra
                  nop
                  fsgnjx.s     ft8, ft7, fs0
                  xor          t1, ra, s5
                  add          tp, t0, a5
                  sub          a6, a1, a7
                  and          a4, t0, a1
                  sltu         a6, s4, s1
                  slt          t2, s5, s10
                  rem          s2, tp, tp
                  fsub.s       fa6, ft10, fa1
                  addi         s11, t2, -1726
                  remu         s2, s4, a2
                  fsgnj.s      fa5, ft2, fs2
                  divu         a3, s10, s11
                  srl          s2, s7, t1
                  fmin.s       fs8, fs1, fa1
                  xor          s5, a1, s10
                  fsgnj.s      fa6, fs3, ft8
                  srai         a2, tp, 25
                  fmul.s       ft5, ft2, ft6, rmm
                  auipc        ra, 765952
                  flt.s        tp, fa2, fs11
                  and          t2, a7, a1
                  fcvt.wu.s    tp, ft3, rdn
                  fmul.s       ft8, fs2, ft7
                  fmv.x.w      t1, fs10
                  fsgnjx.s     ft9, fs10, ft4
                  fdiv.s       fa6, fs3, ft7, rmm
                  sra          ra, s7, s4
                  fmul.s       fa3, ft8, ft2, rtz
                  fmin.s       fs11, fa2, fs2
                  fmv.w.x      fs6, a5
                  flt.s        a2, fa5, fs2
                  slti         tp, ra, 221
                  fsgnj.s      fs1, ft10, fs0
                  fmv.w.x      ft9, t0
                  mulhu        s8, a5, t5
                  or           t1, s3, s9
                  fsgnjx.s     fs8, fa2, fa4
                  feq.s        a0, fa3, ft1
                  slli         sp, ra, 3
                  andi         t0, gp, -1619
                  or           a5, s7, s1
                  fcvt.s.w     ft5, t0
                  fsgnj.s      fs10, fa7, fs1
                  add          s2, a1, a7
                  fle.s        t2, fs4, ft10
                  add          a0, s2, a3
                  fcvt.w.s     a2, ft5
                  mulh         a3, sp, s11
                  or           s5, s3, s9
                  fdiv.s       ft7, fa2, fs8
                  fcvt.wu.s    t6, ft2
                  fmax.s       fa0, fa0, fa0
                  ori          a3, sp, 589
                  fdiv.s       ft0, ft7, fa3
                  add          sp, a0, a6
                  or           s8, ra, s0
                  feq.s        a5, fs4, fs2
                  slti         s11, s7, -442
                  fle.s        zero, fs6, fs2
                  addi         t2, s5, 1459
                  xori         a1, s7, -335
                  fcvt.wu.s    s4, ft2
                  mul          zero, t4, t0
                  andi         a6, a3, -411
                  sra          t0, s9, t1
                  xori         t1, s2, -2040
                  slti         t5, tp, -1631
                  slt          a6, t3, a3
                  sra          a6, a7, a4
                  fsqrt.s      fa6, fs1, rne
                  fsgnjx.s     ft2, fs1, fs8
                  lui          s8, 105504
                  srl          t5, sp, s4
                  add          s2, a2, s10
                  fsgnj.s      ft3, fa7, fs10
                  div          a0, a6, gp
                  xor          t3, s2, s11
                  flt.s        s10, ft4, ft6
                  fsgnjn.s     ft1, ft6, fs11
                  fdiv.s       fs0, ft5, ft8, rne
                  sll          a3, a5, a4
                  srl          a3, a1, s0
                  fclass.s     s9, fs3
                  fmv.x.w      s11, fs0
                  fmv.w.x      fs6, s0
                  fadd.s       ft9, fa4, ft0
                  fmv.x.w      tp, fa1
                  xori         a1, s5, 554
                  nop
                  fsgnjn.s     ft0, fa7, ft4
                  slti         a2, t1, 1618
                  srl          t2, s9, s8
                  fcvt.w.s     sp, ft0, rne
                  divu         a6, s3, t5
                  div          ra, t5, gp
                  mul          gp, t3, a3
                  and          gp, t5, gp
                  mul          s5, s0, t2
                  sltiu        s8, a2, -661
                  fsqrt.s      fa0, fs8, rmm
                  feq.s        tp, ft8, ft5
                  or           t4, s7, t3
                  fcvt.s.w     fs5, s9
                  sltu         s3, s1, s8
                  divu         s5, a6, s8
                  feq.s        t3, ft3, fs0
                  sra          s4, zero, s4
                  add          a5, a4, a6
                  sub          t3, s4, s5
                  srai         s0, t6, 15
                  xor          a5, zero, tp
                  fdiv.s       ft2, fa2, fs9
                  sll          ra, s7, a2
                  mul          a0, t1, gp
                  xor          s5, a4, s0
                  fsgnjn.s     fs10, ft2, ft9
                  fmax.s       fs2, fa7, fa7
                  and          ra, a1, a0
                  fmin.s       fs4, fs3, fa6
                  addi         s2, s6, -624
                  fmax.s       fa0, fa1, ft5
                  fsub.s       fs11, fa4, fa1, rmm
                  sll          a1, s7, a0
                  srai         s8, a0, 11
                  divu         s2, t6, s1
                  fmin.s       fs7, ft4, fs3
                  and          ra, s9, s3
                  and          s10, s4, a3
                  sra          s9, a5, sp
                  fmv.x.w      t4, fs5
                  fsqrt.s      fs4, fa7, rne
                  fclass.s     t5, ft7
                  fclass.s     a6, ft2
                  add          a6, s7, s8
                  slt          tp, t4, s7
                  fmv.w.x      ft4, s8
                  andi         t4, s8, 796
                  fclass.s     t2, fa5
                  fadd.s       fs11, fs6, ft11, rmm
                  fcvt.wu.s    a4, fs8
                  fmin.s       fs5, fs7, ft11
                  fsgnjn.s     fa7, fs10, fs1
                  flt.s        s10, fs0, fs4
                  fmv.w.x      fs0, s0
                  rem          a3, t4, s9
                  auipc        sp, 716343
                  div          zero, a4, sp
                  remu         sp, a6, s3
                  fcvt.s.w     ft1, sp
                  fclass.s     t6, fs4
                  andi         t1, t2, -550
                  addi         s5, s6, -1429
                  sltiu        a5, t5, -1930
                  divu         t0, gp, zero
                  fsub.s       fa2, fs3, ft10, rtz
                  nop
                  ori          t6, tp, 1139
                  fclass.s     t5, ft4
                  fclass.s     s10, fs5
                  fsqrt.s      fa0, ft3, rne
                  fle.s        a6, ft8, fs10
                  sltu         a4, s5, s7
                  fle.s        t0, ft2, fs9
                  feq.s        s1, fa1, fa0
                  fcvt.w.s     a3, ft7, rtz
                  srli         t1, t5, 0
                  mulh         t2, gp, zero
                  fsgnj.s      ft3, ft10, fa5
                  flt.s        t1, fs3, fs9
                  and          t0, t3, s0
                  fsub.s       fa3, fs10, fs10, rup
                  fmul.s       fa3, fa3, ft0
                  fadd.s       ft7, ft0, ft4
                  flt.s        a0, ft10, ft8
                  fmin.s       fa1, fs3, fa5
                  ori          t3, ra, 563
                  lui          s2, 645826
                  fmin.s       ft0, fs6, fs9
                  lui          a0, 209145
                  fcvt.w.s     a1, ft0, rtz
                  sltu         t4, a4, a2
                  sll          s8, a0, t0
                  mul          t0, a6, t3
                  xor          ra, a3, sp
                  sra          a5, sp, a3
                  srl          s1, t5, a5
                  sltiu        s2, t5, -1847
                  fmax.s       ft6, ft8, fs11
                  fsgnj.s      fs5, fs2, ft11
                  fsgnj.s      fa3, fa0, ft7
                  fsgnjn.s     ft9, fs0, fa3
                  sltu         a2, s2, a6
                  sra          s0, t5, ra
                  div          a4, a5, t6
                  auipc        zero, 856115
                  sra          a2, t5, t6
                  or           t6, s3, s10
                  sll          a1, s9, s6
                  nop
                  fsqrt.s      fs5, fa4
                  fmv.x.w      s10, fs10
                  xor          t1, s11, s9
                  lui          s11, 940399
                  div          s0, t2, tp
                  fdiv.s       ft10, ft7, ft7, rtz
                  mulhu        s1, a4, a2
                  slli         t6, t4, 23
                  remu         s2, s3, s10
                  flt.s        s0, ft7, ft4
                  fcvt.s.w     fs0, a1
                  remu         s11, a0, s3
                  ori          t3, ra, -1309
                  fsub.s       fs11, ft2, ft1
                  sll          s10, a5, s8
                  xori         t1, s11, -613
                  sra          a4, s11, a0
                  fsgnj.s      fa7, fs3, fs2
                  sub          t0, t2, t5
                  ori          tp, s1, 1430
                  sltiu        a6, s2, -1511
                  fcvt.w.s     s1, ft1
                  sltiu        a5, s10, 165
                  rem          a5, s10, t6
                  fmin.s       fa4, ft8, ft6
                  addi         s1, s10, -132
                  mulhsu       a2, s3, t0
                  xor          t2, t3, s2
                  fcvt.s.wu    fs1, a5
                  fmv.x.w      a0, fs1
                  feq.s        t5, ft2, fa1
                  fmax.s       fs3, ft9, ft6
                  fsgnjx.s     fs2, ft9, ft9
                  fmv.w.x      fs4, s5
                  mulh         s3, a7, s4
                  fcvt.s.wu    fs0, s4
                  mulhsu       s11, a5, t2
                  xor          t4, s8, ra
                  rem          a2, s7, gp
                  fdiv.s       fs6, fs3, fs3
                  mulh         s8, s7, s6
                  fmin.s       ft6, fs11, fs6
                  flt.s        s3, fa3, fs0
                  fsgnjn.s     ft5, fs8, fs8
                  xor          t5, t4, s4
                  sltu         s3, t6, s6
                  slt          t4, a7, t6
                  rem          a4, a3, s9
                  sltu         a1, a1, tp
                  fcvt.s.w     fs11, s8, rne
                  flt.s        sp, fa7, fs2
                  divu         t4, a0, s5
                  lui          s1, 609592
                  fsgnjx.s     fs5, ft1, ft2
                  sub          a6, a6, t6
                  mulhsu       s0, sp, s0
                  fsgnjn.s     fa7, fa2, fs5
                  fcvt.w.s     ra, ft4
                  div          a2, s0, t3
                  xor          t0, s1, tp
                  fsgnjn.s     ft1, ft3, fs2
                  fmul.s       ft11, fa7, ft0
                  fmv.x.w      zero, fs11
                  fcvt.s.wu    ft6, a5
                  fcvt.s.w     fs5, tp
                  fle.s        a1, ft8, fa5
                  sltu         s0, zero, tp
                  mulhsu       t3, a5, s11
                  fdiv.s       ft5, fa2, fs3, rne
                  nop
                  fmv.w.x      fs3, gp
                  fsub.s       fa3, ft7, fa6
                  fle.s        s1, fa7, ft8
                  sltiu        sp, a5, 1324
                  feq.s        t5, fs6, ft3
                  mulhsu       a6, s7, s10
                  slli         s5, t1, 28
                  slt          t5, s6, t1
                  srai         a1, a4, 6
                  sltiu        gp, a6, -1038
                  add          t2, s3, s11
                  addi         s8, s8, -149
                  mulh         s5, s1, ra
                  sub          a3, sp, a3
                  mulh         s1, s8, s11
                  mulhu        s4, a3, tp
                  feq.s        a1, ft11, fs8
                  mulhsu       s10, s10, t0
                  sll          t5, t0, s9
                  fmin.s       fa3, fs0, ft8
                  divu         gp, t4, a4
                  sltiu        t4, a0, 1957
                  fmv.w.x      fa2, a4
                  mulh         t6, t2, t3
                  auipc        s10, 853208
                  fcvt.s.wu    fs9, a0, rtz
                  mulhsu       t3, s3, s0
                  sltiu        s3, s10, -1234
                  fmv.w.x      fa2, t5
                  add          ra, t1, s8
                  ori          s0, s3, -1372
                  slti         a5, s9, 1268
                  fmv.x.w      a1, fs7
                  add          s0, ra, s11
                  fcvt.s.w     fs0, zero, rne
                  fsgnjn.s     fa0, fa4, ft11
                  sltiu        s10, ra, 2007
                  slt          s10, ra, s3
                  divu         s10, zero, s2
                  mul          a6, a6, s11
                  fsqrt.s      fs8, ft1
                  sltiu        a0, t5, 1109
                  srai         s10, t4, 2
                  divu         t2, s9, t2
                  fadd.s       fs10, fs4, ft7
                  divu         zero, s11, a0
                  sll          t4, t3, t6
                  nop
                  remu         zero, a1, s9
                  fmax.s       ft0, ft9, ft5
                  fsqrt.s      ft11, fs8, rdn
                  sub          a1, sp, ra
                  sll          s2, s8, a7
                  fmv.w.x      fa7, a4
                  fcvt.s.wu    fa4, gp
                  mulhsu       s5, s2, a1
                  fsub.s       fs4, fs1, ft11
                  fmv.w.x      fa2, s7
                  sltiu        t4, t6, 1328
                  fmv.w.x      fa0, t4
                  fsgnjx.s     fs11, ft3, ft9
                  feq.s        a6, ft1, fa3
                  mulh         t1, s1, s6
                  andi         s8, ra, 284
                  sll          s4, a7, s7
                  sltu         t5, s0, a6
                  sltu         s4, s0, s0
                  ori          t3, t3, 790
                  auipc        s8, 988421
                  fsgnjx.s     ft3, fs3, fa3
                  fadd.s       fs2, fs9, fs9, rtz
                  addi         a6, a6, -685
                  fmax.s       ft11, ft5, fs1
                  lui          ra, 66682
                  fcvt.w.s     zero, fs8, rmm
                  fmv.w.x      ft10, s0
                  addi         a4, s9, 641
                  sra          a5, s10, s9
                  flt.s        s10, ft11, fa4
                  mulhsu       t1, ra, s0
                  rem          a2, t2, a4
                  fsgnjx.s     ft4, ft6, ft1
                  mulhu        s1, a1, s7
                  andi         t0, s6, -412
                  nop
                  fmax.s       ft8, ft10, fs10
                  mulh         a6, a6, t0
                  lui          gp, 647115
                  sll          s5, tp, s11
                  fcvt.s.w     fa2, a1, rne
                  rem          a6, t4, s10
                  fmv.w.x      fs10, s11
                  nop
                  mul          zero, gp, s0
                  sltu         t3, a1, a5
                  sll          s2, a5, s6
                  sltiu        s3, a6, -1490
                  fcvt.wu.s    s5, fa0
                  sub          s8, a5, t5
                  mulhsu       t1, s0, s5
                  mulhu        s10, a3, s0
                  xori         s2, s0, 1924
                  fle.s        t5, ft11, ft6
                  fsgnjx.s     ft0, ft8, fa0
                  fmv.w.x      fa5, zero
                  slt          s2, s2, t5
                  mulh         t0, a0, a5
                  slti         s10, a4, -799
                  fdiv.s       fs3, fs7, fs9
                  srli         a4, s0, 17
                  fsgnj.s      ft7, fs3, fa7
                  fmv.x.w      s0, fa7
                  div          a0, a4, a7
                  fsqrt.s      fs9, fa2, rdn
                  sll          s0, t4, t6
                  mul          t6, a7, t3
                  feq.s        a6, ft5, ft9
                  fsgnjx.s     ft1, fa6, ft10
                  mulhsu       s2, s9, a1
                  srli         s2, t2, 29
                  fadd.s       fa3, ft4, fs5
                  nop
                  div          t5, t6, s3
                  and          tp, s6, t3
                  sltu         t6, s6, s8
                  andi         t6, tp, 1177
                  and          a4, s1, a1
                  sll          a5, t2, s9
                  fsub.s       fa3, fs1, fa1
                  fadd.s       fa2, ft9, fs11
                  divu         s0, t5, a4
                  nop
                  srli         t3, s5, 12
                  slli         sp, s11, 27
                  and          zero, tp, a2
                  nop
                  fsgnjn.s     fa2, ft1, fs3
                  slli         a2, a6, 3
                  sll          s5, t1, a3
                  fcvt.s.w     fs7, a1
                  srai         t3, s10, 23
                  fsqrt.s      fa1, fs7
                  and          tp, s2, a0
                  sltu         t1, a4, s7
                  divu         a0, s1, s9
                  fsgnjx.s     ft8, fa6, ft10
                  remu         t1, a6, gp
                  slli         a0, s0, 12
                  sll          s0, ra, s10
                  fadd.s       fa0, fa2, fs0
                  and          a0, s9, ra
                  fsgnjn.s     fs9, fs5, fa3
                  fadd.s       fa1, fs8, ft3, rup
                  add          t2, a4, t2
                  fcvt.w.s     a1, ft0, rtz
                  sltu         a3, t5, s11
                  fmul.s       ft5, fa1, fa6, rmm
                  ori          s9, t4, -1230
                  fcvt.s.wu    fs7, s0
                  fmv.w.x      ft11, s2
                  fcvt.s.w     ft2, a5, rne
                  fsqrt.s      fs7, fs10, rup
                  fadd.s       fs6, fa1, ft2
                  add          a3, s9, a4
                  fsqrt.s      ft9, fa5
                  fsgnjn.s     ft3, ft1, fs7
                  fclass.s     zero, fa7
                  andi         t5, s11, 399
                  fmv.x.w      s2, fs6
                  mulh         s1, s5, zero
                  slti         s10, s10, 123
                  lui          s10, 202549
                  slli         s5, a0, 22
                  auipc        t5, 556503
                  fmul.s       fa3, ft6, fs3, rtz
                  fmin.s       fs7, ft7, ft2
                  xori         s3, s11, 764
                  flt.s        zero, fa4, fa4
                  lui          tp, 217706
                  sltiu        t5, s7, 1281
                  feq.s        zero, fa7, ft7
                  fsqrt.s      fs2, fa5, rmm
                  srai         s11, t4, 8
                  fdiv.s       fa4, ft7, fs9
                  or           gp, tp, a2
                  xor          sp, a2, a5
                  remu         a6, a6, s5
                  div          s3, s9, a6
                  xori         s10, s11, -1910
                  fcvt.wu.s    t0, fs7, rtz
                  fclass.s     a6, fs1
                  mulh         ra, a7, t2
                  fmv.w.x      ft9, t3
                  remu         t4, ra, t0
                  mulh         sp, s11, t4
                  add          s1, a5, s5
                  fcvt.s.w     ft6, s8, rup
                  fle.s        s8, ft6, ft2
                  sltiu        gp, tp, -1178
                  feq.s        s3, fa4, fa1
                  srli         a0, s4, 3
                  fcvt.s.wu    fs2, a3, rmm
                  fcvt.wu.s    t1, fa6
                  sltiu        s1, a5, -223
                  fmul.s       fs3, ft8, fs2, rmm
                  lui          s4, 316979
                  fsqrt.s      fs11, fa5, rmm
                  fsgnjx.s     fa2, ft5, fs1
                  mulhu        a1, a7, tp
                  rem          a3, s7, s6
                  fcvt.wu.s    t3, fa7
                  flt.s        s2, ft8, fs1
                  srl          a3, a0, t2
                  xor          t0, s9, s6
                  mulhsu       s3, t3, ra
                  mulhsu       a2, ra, tp
                  fmv.w.x      ft11, a3
                  sll          t3, t5, zero
                  mulhsu       a1, s8, a5
                  slti         s3, t0, -610
                  fcvt.wu.s    s11, fs11
                  andi         ra, ra, -789
                  fcvt.s.wu    fa5, a6, rup
                  nop
                  sll          t1, s2, a3
                  fcvt.w.s     t1, ft5, rdn
                  fcvt.s.wu    fs9, t0
                  fcvt.s.w     ft5, t1, rmm
                  andi         s10, t1, 538
                  mul          zero, t6, tp
                  fsub.s       ft6, fa0, fs5
                  fmin.s       fs10, ft0, fa7
                  slt          a1, s7, ra
                  div          s4, s3, s0
                  andi         ra, t2, 1431
                  srl          t5, a7, t0
                  remu         t6, sp, t2
                  sltu         ra, a2, t6
                  sll          sp, a5, sp
                  or           a6, a1, s9
                  fmv.w.x      fa6, a4
                  mul          t5, s1, s6
                  add          zero, t6, a2
                  fsub.s       fs3, fs2, ft2, rup
                  mulh         a0, s2, tp
                  fsgnjn.s     fs6, fs8, fs7
                  fdiv.s       fs3, ft5, fs1
                  fclass.s     t0, ft6
                  mul          a0, tp, tp
                  fsgnjn.s     fs9, ft8, ft11
                  addi         tp, a7, 312
                  rem          s3, ra, s4
                  remu         s1, t0, ra
                  feq.s        t0, fs8, ft1
                  srli         gp, t4, 11
                  sra          s4, t2, a2
                  fmax.s       ft10, ft6, ft8
                  fmv.w.x      fa5, t1
                  slti         t5, zero, -1253
                  fmv.w.x      ft7, s8
                  addi         s0, s8, -1396
                  fsgnjx.s     ft4, fs1, ft4
                  feq.s        tp, fs5, fa6
                  nop
                  fmv.w.x      ft6, sp
                  slti         t1, t5, -1527
                  fsgnj.s      fa0, fs10, fa5
                  xori         t1, s4, -370
                  fmv.w.x      fa1, s3
                  srai         a0, sp, 17
                  fsgnjn.s     fa0, fa6, ft0
                  remu         ra, a3, a5
                  fmv.x.w      a1, ft10
                  sll          s9, s11, gp
                  remu         s0, zero, t2
                  fcvt.w.s     gp, fa1, rmm
                  slt          zero, a0, s2
                  add          t1, s8, a2
                  srai         t0, t6, 31
                  mul          s0, s7, s2
                  or           zero, tp, s4
                  fsqrt.s      ft5, fs10, rtz
                  sub          ra, s5, a4
                  nop
                  sra          t4, t4, t5
                  lui          s10, 472282
                  sltiu        gp, t5, 280
                  addi         t4, t1, 1354
                  sll          t0, zero, s9
                  fsqrt.s      fs9, fa0, rmm
                  auipc        sp, 178322
                  fadd.s       fs11, fs2, ft1, rtz
                  remu         sp, a0, s1
                  fmv.w.x      ft6, s2
                  nop
                  mulhsu       a3, t2, s4
                  fsub.s       fs2, fs4, fa5
                  fsgnj.s      fs5, fa3, fa6
                  div          a1, a6, a3
                  rem          t6, a1, a5
                  fclass.s     a5, fs1
                  and          tp, s4, a6
                  sll          t3, t1, s2
                  fcvt.s.wu    ft9, sp
                  mulhsu       t6, zero, s10
                  srl          a6, a0, s10
                  fmv.x.w      a2, ft7
                  fsgnjx.s     fs4, fs2, ft10
                  sll          zero, a3, a7
                  remu         s10, t4, t6
                  andi         sp, a6, 165
                  rem          a5, s6, a2
                  mul          s0, zero, s7
                  fmax.s       ft8, ft9, fa2
                  fcvt.w.s     s0, ft0
                  feq.s        a3, fs3, ft0
                  fcvt.s.w     ft5, zero
                  fsqrt.s      ft9, fa4
                  fadd.s       fs5, fs3, ft1, rtz
                  divu         s1, a1, t6
                  srli         a2, s2, 30
                  and          s4, s10, t1
                  mulhsu       s2, s8, a1
                  div          s0, s11, t2
                  ori          gp, s4, 685
                  xori         s10, t1, 800
                  andi         t0, s4, -1955
                  mulh         t0, t5, a5
                  flt.s        s1, fs9, ft1
                  rem          s4, s9, a2
                  divu         zero, tp, s7
                  fmin.s       fs8, fa5, fa6
                  nop
                  or           t6, sp, s7
                  nop
                  add          t4, s0, s3
                  or           s4, tp, a5
                  fcvt.wu.s    t0, fa3
                  divu         gp, sp, ra
                  fadd.s       ft11, fa6, fs2
                  slli         s4, s2, 1
                  srai         a2, t6, 17
                  srl          zero, ra, sp
                  fadd.s       ft11, fs11, fa3, rup
                  sll          t1, a6, t2
                  sltu         a1, s11, a0
                  and          s5, a7, a5
                  addi         t1, t4, 1729
                  fsub.s       fa0, fs9, ft0, rmm
                  sltiu        t4, a3, -1597
                  fsgnj.s      fa4, fs4, fs4
                  mulh         gp, s10, a1
                  sra          t5, t6, t1
                  fmax.s       ft2, ft7, ft7
                  fsgnjx.s     fs5, ft4, fa7
                  flt.s        a5, fa5, fa6
                  lui          s8, 897168
                  or           s0, t1, s0
                  fsgnjx.s     fs2, fs2, ft2
                  sll          tp, s1, s10
                  srl          s5, zero, a7
                  srl          a4, a3, a0
                  sub          s10, a0, gp
                  auipc        ra, 598406
                  fsgnjn.s     fa0, fa3, fs0
                  ori          tp, s2, 509
                  or           gp, s6, a1
                  fsqrt.s      fa3, ft10, rup
                  mulhsu       s11, s6, a7
                  remu         a5, s4, s10
                  fsgnjn.s     fs1, ft4, ft5
                  sub          zero, a0, ra
                  fsgnj.s      ft10, fs9, fa7
                  andi         t5, ra, -392
                  fsgnjx.s     fs0, fs4, fs0
                  sltu         s0, t6, s8
                  divu         gp, s11, a0
                  sltiu        t3, t5, 1887
                  sltiu        a4, a3, 1822
                  slti         s8, a4, -1834
                  mul          tp, s1, tp
                  or           ra, s4, t1
                  mul          t5, sp, t6
                  slli         a2, s0, 14
                  fle.s        a1, fs5, fs9
                  fsgnj.s      fa4, fa0, fs4
                  fsub.s       fa2, ft4, fa3, rmm
                  mulhu        a5, zero, a6
                  fadd.s       fa7, fa5, ft2, rdn
                  fle.s        a1, fa5, ft6
                  fmv.x.w      a2, fa6
                  fadd.s       ft9, fa0, fs9, rdn
                  slt          a5, gp, s9
                  mulhu        s8, s3, a6
                  srli         s11, ra, 20
                  slti         s10, t1, 472
                  slli         s2, t6, 17
                  feq.s        s8, ft6, fs3
                  sra          t0, a2, s8
                  or           s8, a4, a5
                  fcvt.s.w     fa6, t0
                  fsgnjn.s     fs11, fs10, fa6
                  mulh         t5, s0, s7
                  or           t0, ra, s10
                  fsub.s       ft2, ft8, fa7
                  divu         a2, a1, s5
                  or           a6, t0, a4
                  fsgnj.s      fs9, fa0, fs6
                  srli         t3, s8, 18
                  fmv.x.w      s2, fs6
                  fcvt.wu.s    ra, fa5
                  feq.s        a0, fa0, ft8
                  fmin.s       fs8, ft2, fs8
                  fmin.s       ft11, fs4, fs8
                  lui          s10, 68729
                  srai         t0, s8, 14
                  srai         sp, gp, 20
                  nop
                  rem          t1, s10, tp
                  fsub.s       fa1, fs2, ft11, rdn
                  slt          s8, a7, s8
                  sra          zero, s6, sp
                  divu         a4, t6, a5
                  ori          s9, s10, -1705
                  slli         s9, gp, 20
                  slt          t5, t1, a0
                  slli         zero, s4, 0
                  fsgnjx.s     ft8, ft5, fs9
                  nop
                  fcvt.s.wu    fs6, zero
                  addi         tp, s1, 500
                  xori         s2, a2, -898
                  fmul.s       ft9, fs8, fs11, rtz
                  div          t6, s6, ra
                  xori         s9, t4, -990
                  srai         t1, s7, 9
                  fcvt.wu.s    s11, fa6
                  fsqrt.s      fa0, ft10, rmm
                  sltiu        sp, s4, 88
                  flt.s        t5, fs2, fs0
                  fsgnjx.s     ft1, fs2, fa0
                  rem          a3, t3, s9
                  fsgnjx.s     fs7, fa3, ft0
                  fsgnjn.s     fa2, ft11, fs0
                  sltiu        t1, s1, -1482
                  mulh         t4, sp, a2
                  sra          s9, sp, s6
                  sub          t4, s5, s5
                  fmv.w.x      ft10, s10
                  fdiv.s       ft4, fs4, ft2
                  fmul.s       fa7, fa1, fs4, rmm
                  rem          s9, s1, s10
                  fadd.s       fs7, fa6, fa6, rup
                  sub          s5, s6, a7
                  srl          a5, a7, s9
                  fsgnjn.s     fs0, ft8, ft6
                  flt.s        t1, ft11, fs4
                  div          a3, s3, s11
                  fmax.s       fa2, fa4, fs5
                  divu         tp, s3, s0
                  auipc        a0, 769927
                  mulhsu       sp, t0, s9
                  sll          s11, a2, ra
                  fmax.s       fs6, fs2, ft9
                  ori          zero, s3, 1021
                  mulhsu       t0, s8, s6
                  srai         t6, t5, 20
                  fdiv.s       fa6, ft1, ft6, rdn
                  fsgnjn.s     fs10, fs0, fa2
                  xor          t6, a7, t4
                  fmul.s       ft7, fa6, fa0
                  slt          t3, s9, tp
                  fmv.w.x      fa6, s10
                  xori         s11, zero, -1304
                  slli         zero, a1, 6
                  and          t2, t6, s9
                  fadd.s       ft2, ft11, fa4, rup
                  mulhsu       s1, a1, s1
                  fcvt.s.wu    fa4, s1, rup
                  feq.s        t2, ft11, ft4
                  fclass.s     t2, fs9
                  fsgnjn.s     fa5, ft7, ft11
                  flt.s        a6, ft4, fa7
                  divu         a5, s11, a4
                  fmv.x.w      sp, ft4
                  lui          s4, 282549
                  fmax.s       ft7, fs4, ft4
                  xor          t3, s3, t2
                  fsqrt.s      ft10, ft3
                  add          t5, a5, t3
                  nop
                  lui          t3, 405646
                  fsgnjx.s     ft9, ft3, fs9
                  and          a1, t2, s9
                  fmv.x.w      s10, fs4
                  slli         s11, a4, 0
                  fle.s        s3, fs2, fa2
                  xori         zero, s8, -991
                  fsqrt.s      fs10, ft0
                  add          t4, s7, a3
                  xor          t6, t5, a4
                  sra          a3, s3, sp
                  fmul.s       fs7, fs2, fa1
                  fsub.s       fs6, fa0, ft1
                  fcvt.w.s     s9, fa4
                  mul          a6, t5, s11
                  fsgnj.s      ft4, fa4, ft2
                  fadd.s       fs2, fa3, fs8
                  fclass.s     s5, fs9
                  mulhsu       t6, s6, a6
                  addi         s0, s8, -1749
                  slt          gp, s4, t0
                  xor          s4, s5, s8
                  mulhu        t0, zero, t3
                  ori          a2, t3, -1400
                  add          gp, t4, t6
                  sra          a1, a6, s1
                  auipc        s4, 718602
                  slli         s10, a5, 19
                  fcvt.s.wu    ft6, a4
                  fsub.s       fa2, ft8, ft10, rmm
                  and          t3, a0, a7
                  divu         t0, a3, s4
                  addi         a4, ra, -2005
                  mulhu        s5, s2, ra
                  fclass.s     s10, ft3
                  mulh         s0, t2, tp
                  or           s2, a3, a0
                  lui          a4, 322327
                  sll          t6, s3, a3
                  fmul.s       fa2, ft9, fa1
                  mulhu        t3, s9, s9
                  fcvt.s.wu    ft0, t6
                  fmul.s       ft0, ft1, fa0, rup
                  sra          t5, s11, a4
                  auipc        s0, 630728
                  fcvt.s.w     ft6, s9
                  slli         a6, a4, 22
                  fadd.s       fs9, ft0, fs11, rne
                  sub          gp, gp, a4
                  fsgnjn.s     ft7, fa3, fa1
                  fsgnjn.s     ft5, fa6, fs8
                  fmin.s       fs10, fa2, ft9
                  sub          t6, s8, a6
                  slli         a4, s4, 28
                  fmv.w.x      ft2, t4
                  and          s9, s11, t5
                  fsqrt.s      ft8, fs1
                  fcvt.s.w     ft9, t1
                  or           s0, sp, s5
                  slti         s2, s5, -807
                  fsgnjx.s     fs3, ft7, ft10
                  mulhu        a0, t2, s1
                  srai         t4, t4, 14
                  fsgnj.s      ft6, ft1, ft3
                  fcvt.s.wu    ft7, s11
                  rem          a3, a0, s4
                  fsgnjn.s     fs4, fa4, ft8
                  fclass.s     a6, fa5
                  or           a2, t5, a0
                  fdiv.s       ft5, fa6, fs7
                  fsgnjn.s     fa3, fa0, fs8
                  fsqrt.s      fs1, fa3
                  mulhu        a4, ra, a1
                  fsub.s       fs10, fs10, fs9
                  sll          a2, a6, t1
                  mulh         s10, s8, a7
                  sltu         s11, s10, t0
                  mulhsu       s0, t6, ra
                  and          a5, s11, t3
                  flt.s        gp, fa0, fs6
                  fle.s        t1, ft11, fs1
                  sra          s5, t1, s2
                  fadd.s       fs1, fs2, fs11, rmm
                  lui          a2, 57748
                  slli         a0, t1, 27
                  fsqrt.s      fs0, ft0
                  fcvt.wu.s    a5, fa4
                  flt.s        sp, ft4, ft0
                  slli         a2, s10, 7
                  sll          a1, a2, s7
                  nop
                  fsqrt.s      fa3, fs6
                  mulhsu       s4, t4, t2
                  andi         gp, a6, 773
                  lui          t6, 206511
                  fsub.s       fs1, ft8, fs8
                  srai         s1, a6, 27
                  fmax.s       fs3, fs0, fs7
                  mulh         a4, s8, a3
                  or           zero, tp, s10
                  sll          s2, s3, t4
                  xor          zero, ra, a1
                  sltiu        gp, t6, 1322
                  slti         a5, t5, -1847
                  slt          t2, t3, zero
                  mul          s9, a2, a5
                  lui          t6, 925536
                  ori          s4, a4, -1843
                  fclass.s     a5, fs8
                  fcvt.w.s     s11, ft9
                  sub          s5, a5, s0
                  fcvt.w.s     t6, fa2
                  srl          s10, s11, s2
                  ori          t6, zero, -712
                  mul          t4, a3, s0
                  ori          t5, a0, -261
                  fcvt.s.w     fa2, a3, rtz
                  fadd.s       fs3, ft2, fa4
                  fsgnjn.s     fs3, fs8, fs7
                  srli         t6, s8, 20
                  sll          t1, a4, t4
                  fsgnjn.s     ft6, ft11, fa1
                  slti         s10, s6, 1446
                  fsgnjn.s     ft11, fa3, fa6
                  remu         zero, sp, s4
                  fmv.w.x      ft11, s4
                  nop
                  rem          t3, ra, s3
                  rem          a5, s0, t2
                  fclass.s     tp, ft0
                  div          s5, ra, a2
                  fsgnj.s      fs5, fa6, fs2
                  add          t0, a5, t1
                  mulhsu       a1, s7, ra
                  fsqrt.s      fs0, fa0
                  nop
                  flt.s        s4, ft7, fa1
                  lui          a0, 508864
                  sltu         t0, s4, a5
                  lui          s4, 187678
                  fcvt.s.wu    fs7, t0
                  div          t0, a3, s10
                  auipc        t0, 650855
                  fmv.x.w      t5, fs1
                  sltu         a2, a1, s8
                  slti         t3, s3, -1275
                  fsgnj.s      fs10, ft5, ft5
                  fadd.s       fs3, fa4, ft9
                  mul          a0, t1, s6
                  srl          a0, t3, s9
                  fsgnjx.s     fs0, fa1, fs11
                  fcvt.wu.s    s4, fs8
                  xor          t1, t0, s1
                  div          s10, a7, tp
                  nop
                  fsgnjx.s     fs1, ft1, fs3
                  sra          s9, s7, t5
                  fmin.s       fs3, fa1, ft1
                  fcvt.s.w     fs11, a2, rne
                  fcvt.s.wu    fs5, t2
                  fmax.s       fs3, fs11, ft3
                  srli         t1, a1, 24
                  fmax.s       fs11, fs2, ft0
                  fcvt.s.wu    fa6, s3, rmm
                  fcvt.wu.s    a4, ft10, rup
                  fmin.s       ft4, ft3, fs9
                  sub          sp, tp, a4
                  fmv.w.x      fs7, s4
                  addi         s5, s7, -1182
                  sub          s0, s0, s9
                  fsgnjn.s     ft5, fa4, fa7
                  and          a2, a3, t6
                  or           ra, s2, t4
                  mulhu        s11, s2, s4
                  fsgnjn.s     fa4, ft0, fs10
                  rem          a3, tp, a6
                  flt.s        s3, fa5, fs9
                  slti         s10, t5, 1268
                  fle.s        s9, ft6, fs10
                  auipc        s9, 920875
                  xori         a6, a0, -1449
                  fsgnjn.s     fs3, fs1, ft8
                  fmul.s       fs11, ft5, ft10, rtz
                  slti         s10, s3, 806
                  slt          s9, a1, ra
                  xor          s10, s0, s6
                  add          t1, s10, t6
                  xori         zero, a7, -760
                  sll          s4, tp, s10
                  feq.s        zero, fa5, fs4
                  fclass.s     sp, fa4
                  mulh         t6, s7, ra
                  divu         t0, t5, a3
                  fcvt.w.s     zero, fa2, rmm
                  rem          s11, a0, t1
                  fle.s        s8, ft9, fa0
                  srl          s8, s11, sp
                  flt.s        t3, fs4, fa6
                  ori          gp, s4, 391
                  mulhu        s8, a6, s9
                  auipc        a3, 542403
                  remu         s3, s10, t0
                  sra          s0, s4, a3
                  fsgnjn.s     ft10, fs10, fa3
                  lui          t3, 597845
                  fcvt.s.w     fs2, t1, rtz
                  lui          s10, 73718
                  slti         gp, t3, -922
                  mul          a5, s11, sp
                  fcvt.w.s     a2, fs10, rtz
                  slti         t2, s0, 261
                  and          t0, a6, a3
                  ori          a5, t3, -713
                  fcvt.w.s     a0, ft2
                  andi         s8, a3, 1188
                  auipc        s5, 654630
                  fclass.s     s2, ft2
                  mulhsu       a0, t1, s4
                  fsub.s       fa0, fs7, fa0
                  slli         tp, s4, 9
                  remu         s3, sp, a1
                  fsgnjn.s     ft3, ft6, fs2
                  fsub.s       ft5, fs1, fs9
                  fsub.s       fa7, ft6, ft6
                  fmin.s       ft9, fa0, ft11
                  srli         gp, a5, 29
                  fle.s        a5, ft11, fa5
                  fclass.s     a4, fs5
                  fsgnjn.s     fs10, ft6, fs2
                  fle.s        t1, fs11, fs6
                  ori          t0, a6, -1188
                  slt          a2, s6, s6
                  fmin.s       fa3, fa2, ft3
                  rem          t2, a2, a1
                  fcvt.w.s     t2, ft5
                  add          s10, a4, ra
                  sll          a0, a4, t6
                  sub          a4, s0, s4
                  xor          tp, t6, a2
                  flt.s        a4, fs1, ft6
                  srai         a6, s6, 6
                  sub          t4, s1, ra
                  mulh         s11, t0, a2
                  divu         s1, gp, a1
                  ori          s11, a2, 1430
                  sra          zero, s10, s4
                  slt          ra, s0, ra
                  fcvt.s.wu    fa2, tp
                  fmul.s       ft5, fs6, ft8
                  mulh         t1, tp, sp
                  or           s5, a2, t0
                  fclass.s     a0, fa6
                  xori         s0, s1, 1389
                  or           a2, t6, s6
                  feq.s        a3, fs7, ft11
                  mul          t6, t4, a0
                  fadd.s       fa6, fs5, fs3
                  fmin.s       fs1, fa1, ft7
                  nop
                  sltu         a5, s11, t1
                  addi         s0, s6, 962
                  fdiv.s       ft7, fa5, ft0
                  fadd.s       ft10, ft5, fs5
                  fsqrt.s      fs10, ft0
                  flt.s        a0, fs6, ft5
                  feq.s        t0, ft1, ft5
                  slli         s3, zero, 7
                  fcvt.s.w     ft4, s10
                  lui          t6, 342565
                  slli         s4, a4, 20
                  fdiv.s       fa0, fa3, ft7, rmm
                  divu         s3, s8, s1
                  fcvt.s.w     ft10, s0
                  fcvt.s.wu    fs4, gp, rne
                  auipc        a5, 705299
                  fmul.s       ft8, ft1, fs1, rne
                  mulh         s2, s2, t0
                  and          a6, a5, s3
                  lui          s4, 823558
                  sltu         t4, s3, s3
                  mulhsu       s5, t1, s4
                  rem          t1, s6, t3
                  fmul.s       fa5, fs6, fs1
                  rem          t0, s4, s6
                  fadd.s       fs5, ft3, fs10, rtz
                  fmin.s       ft0, ft5, fa2
                  feq.s        s3, ft9, fs0
                  feq.s        t1, ft0, ft10
                  fadd.s       ft10, fs2, fs2
                  fmul.s       fs9, ft1, fs8, rup
                  fsgnjn.s     fs1, fs1, fa0
                  fcvt.wu.s    a0, fs2
                  sltu         t3, tp, tp
                  slti         s10, a4, 872
                  fsgnjx.s     fa1, ft9, fs1
                  fmin.s       fa4, fs1, ft3
                  fcvt.s.wu    fs10, s9, rmm
                  fsub.s       ft4, ft4, ft5, rtz
                  fmin.s       fs1, fs11, fs1
                  nop
                  sltiu        s9, s8, 268
                  fcvt.s.w     fa1, a1
                  fsqrt.s      ft0, fa5
                  ori          a5, s8, -1314
                  mulhu        t3, t4, s1
                  mulhsu       s1, s9, sp
                  or           t4, t2, t0
                  fle.s        gp, fa2, fs7
                  sll          tp, a5, s6
                  fsgnjn.s     ft6, fa5, ft6
                  fmin.s       fa6, fa0, ft4
                  nop
                  fmv.x.w      ra, fa2
                  fcvt.wu.s    sp, ft10, rtz
                  fsgnjx.s     ft5, fs0, fs9
                  fadd.s       fs2, ft6, fs9, rtz
                  lui          s9, 576185
                  fmax.s       fa1, fs3, ft0
                  sltu         t5, a4, a7
                  mulhsu       s11, sp, gp
                  sltu         s1, a6, s6
                  srli         t5, a7, 16
                  rem          a2, tp, ra
                  slti         a2, t5, -1941
                  nop
                  fcvt.s.w     ft6, s3
                  fcvt.w.s     s3, ft3, rmm
                  fsqrt.s      fs3, fa2, rne
                  sll          s3, t2, s2
                  fmv.w.x      fs0, t3
                  fmul.s       ft1, ft0, fs1
                  fmin.s       fa3, fa3, ft0
                  fmul.s       ft3, fs11, fs5
                  fcvt.w.s     s11, fs8
                  xor          t3, a4, sp
                  fsgnj.s      fa3, fs9, fs3
                  fsgnj.s      fs1, ft7, fs6
                  feq.s        t4, fa1, ft0
                  mulhu        a4, t0, s3
                  fmax.s       fa5, fs11, ft4
                  slli         t0, a6, 3
                  fdiv.s       fs5, fs6, fs11, rne
                  xori         a1, t3, 247
                  feq.s        tp, ft4, fs5
                  fle.s        gp, ft4, ft10
                  auipc        s2, 918824
                  divu         a2, t2, t1
                  nop
                  div          t2, t3, s0
                  fle.s        s11, fs1, fa5
                  add          s8, a6, s8
                  mulh         a3, a5, a2
                  slli         sp, a5, 15
                  feq.s        a1, fs9, fs2
                  rem          s10, a1, s1
                  fle.s        t3, fa3, ft3
                  fmv.w.x      ft8, t2
                  and          a3, t2, t0
                  divu         t6, s2, ra
                  addi         s2, s4, -760
                  fsgnj.s      fa3, fa6, fs1
                  srai         t0, t3, 7
                  xori         sp, s2, -376
                  fcvt.s.w     ft9, s11
                  fmv.w.x      ft11, zero
                  addi         s2, a1, -663
                  fsgnj.s      fa3, fs6, ft11
                  slli         sp, s5, 21
                  fmin.s       fa3, ft3, ft8
                  fmv.w.x      fs6, a3
                  auipc        s5, 354383
                  fmv.w.x      fs2, sp
                  fsgnj.s      fa0, fs2, fa0
                  mulh         a1, t2, t3
                  fclass.s     a1, fa1
                  fcvt.s.wu    ft2, t4, rne
                  fsub.s       fs6, ft4, fa2, rdn
                  fclass.s     s8, fs10
                  feq.s        s3, ft3, fs4
                  fcvt.w.s     s10, ft1
                  xor          a1, a7, s9
                  feq.s        s3, fs11, ft7
                  fadd.s       ft10, ft0, ft6, rmm
                  fsgnjn.s     ft11, fs2, fa4
                  fmin.s       fa3, ft5, ft3
                  sra          t4, s11, s1
                  sub          a6, s10, s10
                  fcvt.s.wu    ft3, s4, rmm
                  mulhu        s11, zero, a1
                  lui          gp, 1046113
                  mulh         s10, a3, s2
                  divu         a4, t4, t5
                  mulhu        s9, s9, a0
                  or           gp, t1, a0
                  srai         sp, s7, 10
                  fsgnjx.s     fa0, ft2, fs7
                  fsgnjx.s     ft2, fa1, ft4
                  fsgnjx.s     fa0, fs7, fa3
                  fmul.s       fs9, ft0, ft11, rmm
                  sub          t4, t2, s4
                  fcvt.s.w     fs1, s9, rtz
                  divu         s10, t1, tp
                  srl          zero, a7, a0
                  or           t1, tp, a5
                  feq.s        t2, fs10, fs3
                  fle.s        t0, fs11, fs0
                  fmv.w.x      fs8, zero
                  lui          t2, 765961
                  nop
                  rem          s2, t3, t3
                  srli         s5, t1, 15
                  fle.s        ra, fa0, ft10
                  or           s5, zero, a5
                  fcvt.s.w     fa2, s2
                  fsgnjn.s     fs5, fs9, ft8
                  rem          a0, t3, a6
                  addi         t3, zero, -1863
                  rem          a4, s3, a3
                  feq.s        a4, fa4, fa7
                  nop
                  andi         t0, tp, 661
                  ori          tp, zero, -80
                  nop
                  mulhsu       a2, t2, t1
                  slli         a4, s9, 30
                  fclass.s     s3, fs0
                  fsgnj.s      fa7, ft10, fs0
                  mulhu        a5, t1, t4
                  fsqrt.s      fs8, fs2, rmm
                  sltiu        s11, a7, 608
                  fmul.s       fa6, ft10, fs4, rmm
                  rem          gp, a3, s7
                  sra          s0, t1, zero
                  sltiu        s4, s0, -802
                  fcvt.wu.s    t5, fs0, rmm
                  fcvt.w.s     a4, fa6
                  sltiu        a3, t2, -1387
                  fcvt.s.w     fs10, s11
                  add          t4, t1, a5
                  mul          s2, t6, sp
                  fcvt.s.wu    fs8, zero, rdn
                  fmv.w.x      fs8, s5
                  auipc        ra, 798751
                  sltu         t1, a2, t0
                  fsgnjn.s     ft6, ft2, ft11
                  fmul.s       fa6, fs2, fs10
                  fcvt.s.wu    ft10, s1
                  sltu         t6, a6, gp
                  and          ra, s4, t3
                  add          t1, s0, s1
                  xori         s10, a0, 856
                  div          s0, s0, a5
                  srli         a0, a3, 31
                  mulhsu       t3, s10, t1
                  fcvt.w.s     sp, ft10
                  fsqrt.s      fa2, fs4
                  fmv.w.x      ft5, t5
                  auipc        s5, 495859
                  mulh         a2, s2, gp
                  fcvt.s.w     fa2, a6, rdn
                  srl          t2, a6, a2
                  fcvt.w.s     t2, fa2, rtz
                  and          t1, a4, s4
                  nop
                  nop
                  slti         s1, a7, 1151
                  xor          s4, t1, t0
                  fadd.s       fa1, ft6, fa3
                  andi         ra, s8, 643
                  sub          a1, t5, s6
                  addi         t0, s5, -534
                  xor          a0, a6, t0
                  auipc        a4, 521242
                  xori         s11, a2, 1270
                  fmax.s       ft8, ft0, fa2
                  sra          zero, s1, sp
                  fsgnjn.s     ft9, fa1, fa4
                  addi         s2, s6, 1186
                  lui          ra, 276168
                  fmin.s       ft5, ft10, fs7
                  andi         s4, tp, 1333
                  fsub.s       ft5, fs11, ft9
                  fsgnj.s      fa4, fs7, fa7
                  sltu         s5, s5, a3
                  divu         a2, zero, gp
                  fsgnj.s      fs9, fa2, fa0
                  remu         a0, sp, a5
                  fcvt.s.w     ft11, s6, rup
                  fdiv.s       fa0, ft10, fs8, rdn
                  andi         tp, a2, 313
                  fcvt.s.w     ft6, a7
                  xori         tp, a0, -924
                  srai         a6, t1, 3
                  sltiu        t1, tp, -1962
                  fsqrt.s      ft6, fa0, rdn
                  addi         t2, s0, -334
                  divu         gp, a7, s4
                  or           s3, t2, t4
                  remu         a1, zero, s6
                  fmin.s       fs11, ft10, ft3
                  fadd.s       ft0, fa6, fs0
                  slli         t1, a7, 13
                  fcvt.s.w     ft9, t0, rdn
                  mulhu        a3, s2, ra
                  slti         s4, s10, 1081
                  or           sp, s10, ra
                  mulhu        zero, s7, t0
                  fsgnjx.s     fa6, fs9, ft3
                  srl          s3, s10, t1
                  flt.s        a0, fs4, fa7
                  srli         s10, a1, 23
                  fdiv.s       fa0, ft1, ft8, rdn
                  div          t1, a6, a6
                  fsgnjn.s     fs2, ft0, ft9
                  xor          s5, t3, s4
                  sltu         a2, s10, gp
                  slti         s8, s4, 500
                  fsgnj.s      ft5, fs0, ft11
                  fcvt.s.w     fa0, s9, rne
                  flt.s        t2, ft3, fs7
                  rem          t4, s8, s3
                  lui          a4, 316080
                  xor          s5, s10, s9
                  fsgnjn.s     ft6, fs2, fa7
                  fle.s        a5, fs10, fs8
                  slti         a6, t6, 1590
                  feq.s        s8, ft1, fs4
                  fcvt.s.wu    ft6, a3, rmm
                  nop
                  fmv.x.w      s9, fa5
                  remu         a0, t0, zero
                  srai         s11, s9, 27
                  add          t1, tp, a4
                  xor          t3, s3, gp
                  fsgnj.s      fs5, fa0, ft0
                  nop
                  srli         t3, t1, 27
                  nop
                  slt          s3, s9, gp
                  nop
                  sra          s3, t4, s11
                  sub          a2, s10, s11
                  fsgnj.s      fa3, ft11, ft11
                  mulh         s4, s11, s7
                  addi         gp, t6, -594
                  div          t3, a7, s3
                  fcvt.w.s     s0, ft6, rmm
                  rem          s9, t4, sp
                  add          gp, ra, a2
                  slt          a1, a1, t5
                  sltu         s1, s8, s1
                  feq.s        s11, ft2, fs5
                  slli         a1, tp, 24
                  and          s3, t0, gp
                  fclass.s     s2, fs2
                  or           a1, a7, a2
                  sltu         gp, t4, s6
                  xori         s5, s0, -604
                  slli         t4, tp, 7
                  sra          a4, a3, s2
                  or           tp, t4, ra
                  fcvt.wu.s    sp, fa5, rdn
                  fmv.w.x      fs4, a7
                  nop
                  slti         t6, a7, -11
                  mulhu        s9, s6, a6
                  and          t2, s7, a2
                  sub          s3, a3, s0
                  fclass.s     s1, ft11
                  fle.s        a0, fa6, ft9
                  fclass.s     s4, fs9
                  nop
                  fclass.s     s3, fs10
                  fcvt.s.w     ft2, t3
                  srli         s10, a3, 26
                  remu         t2, s4, s1
                  mulhu        s0, sp, s9
                  mulh         ra, s2, a5
                  slli         t1, s10, 23
                  addi         s2, a5, 106
                  add          a3, ra, s7
                  fadd.s       fs6, fa6, fs1
                  srai         gp, s2, 12
                  lui          s0, 109493
                  fsub.s       fs11, ft0, fs10, rne
                  fle.s        t4, fa4, ft8
                  flt.s        s3, fs6, ft2
                  auipc        s9, 566065
                  fmul.s       fa2, fs8, fs4
                  slt          a3, a0, s11
                  and          t0, s0, a5
                  fclass.s     ra, ft5
                  ori          a5, a4, -1733
                  sra          s9, t2, s1
                  fmax.s       ft3, fs7, fs11
                  fmv.x.w      ra, fs8
                  andi         t5, s9, -1865
                  fsgnjx.s     fs9, ft3, fa2
                  fmin.s       ft4, fs6, ft6
                  andi         a6, a7, 318
                  feq.s        a6, fs6, fa7
                  srl          s11, t0, s4
                  slt          a1, a2, a7
                  sll          s5, t3, s3
                  div          s11, s10, a1
                  nop
                  addi         s5, s2, -579
                  srai         s2, s4, 23
                  fsub.s       ft9, fs3, fa3
                  divu         s0, t6, s3
                  or           s11, a4, a5
                  fclass.s     t1, ft1
                  lui          s4, 501340
                  fmax.s       ft7, fs8, fa7
                  fsqrt.s      fa6, fa1, rdn
                  slti         t0, t3, -1120
                  fsub.s       fa3, ft9, ft2
                  srli         t5, t6, 27
                  rem          s0, a3, t4
                  mul          a2, s0, s5
                  lui          t6, 521447
                  fcvt.s.w     fs9, s3
                  fsgnjx.s     ft4, fs7, fs9
                  fmv.x.w      t3, fa7
                  or           s10, t0, a0
                  andi         s4, s6, -1085
                  div          ra, a2, tp
                  fcvt.s.wu    ft0, s1, rmm
                  add          gp, s2, s7
                  fcvt.wu.s    sp, fa7
                  sltu         t2, t0, a1
                  fsgnjx.s     fs4, fa2, fs1
                  nop
                  sra          a1, a5, t4
                  ori          s3, a4, 112
                  auipc        s3, 373170
                  remu         s10, s7, t3
                  andi         a4, s0, 952
                  and          a3, a3, a3
                  divu         a0, s3, t1
                  addi         s3, s1, 539
                  add          s11, s7, s3
                  fsgnjn.s     ft2, fa3, ft2
                  rem          t4, a0, s7
                  addi         s8, s6, 1927
                  srai         s9, s5, 14
                  srli         s10, a4, 31
                  xor          a3, sp, a7
                  and          sp, s11, s6
                  fmax.s       fa5, fs6, fa6
                  sub          a4, s7, s3
                  remu         t6, t6, tp
                  slli         t6, t1, 7
                  fdiv.s       fa5, fs9, fs9
                  sll          t2, s8, s7
                  mulh         a0, s9, gp
                  or           t5, a4, a4
                  srai         s2, a3, 28
                  slt          tp, s0, s10
                  fcvt.s.w     fs10, t0
                  divu         s9, a4, t3
                  fmax.s       ft6, ft0, ft8
                  fsgnjx.s     ft7, ft7, fa1
                  remu         s0, a2, s10
                  flt.s        a3, ft4, ft7
                  slli         sp, s7, 21
                  or           a1, a1, t0
                  remu         t1, a4, t4
                  sltu         a2, t0, s11
                  mulh         s2, s7, a1
                  slt          a2, s2, t1
                  nop
                  fmul.s       fa5, ft11, fs2
                  la x23, test_done
                  jalr x0, x23, 0
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
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_2:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_3:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_4:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_5:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_6:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_7:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_8:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_9:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_10:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_11:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_12:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_13:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_14:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_15:
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

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
                  addi x17, x17, -4
                  sw  x22, (x17)
                  add x22, x17, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x17, x22, zero
                  csrr x26, 0x341 # MEPC
                  csrr x26, 0x342 # MCAUSE
                  li x16, 0x3 # BREAKPOINT
                  beq x26, x16, ebreak_handler
                  li x16, 0x8 # ECALL_UMODE
                  beq x26, x16, ecall_handler
                  li x16, 0x9 # ECALL_SMODE
                  beq x26, x16, ecall_handler
                  li x16, 0xb # ECALL_MMODE
                  beq x26, x16, ecall_handler
                  li x16, 0x1
                  beq x26, x16, instr_fault_handler
                  li x16, 0x5
                  beq x26, x16, load_fault_handler
                  li x16, 0x7
                  beq x26, x16, store_fault_handler
                  li x16, 0xc
                  beq x26, x16, pt_fault_handler
                  li x16, 0xd
                  beq x26, x16, pt_fault_handler
                  li x16, 0xf
                  beq x26, x16, pt_fault_handler
                  li x16, 0x2 # ILLEGAL_INSTRUCTION
                  beq x26, x16, illegal_instr_handler
                  csrr x16, 0x343 # MTVAL
                  1: la x23, test_done
                  jalr x1, x23, 0

ecall_handler:    
                  la x26, _start
                  sw x0, 0(x26)
                  sw x1, 4(x26)
                  sw x2, 8(x26)
                  sw x3, 12(x26)
                  sw x4, 16(x26)
                  sw x5, 20(x26)
                  sw x6, 24(x26)
                  sw x7, 28(x26)
                  sw x8, 32(x26)
                  sw x9, 36(x26)
                  sw x10, 40(x26)
                  sw x11, 44(x26)
                  sw x12, 48(x26)
                  sw x13, 52(x26)
                  sw x14, 56(x26)
                  sw x15, 60(x26)
                  sw x16, 64(x26)
                  sw x17, 68(x26)
                  sw x18, 72(x26)
                  sw x19, 76(x26)
                  sw x20, 80(x26)
                  sw x21, 84(x26)
                  sw x22, 88(x26)
                  sw x23, 92(x26)
                  sw x24, 96(x26)
                  sw x25, 100(x26)
                  sw x26, 104(x26)
                  sw x27, 108(x26)
                  sw x28, 112(x26)
                  sw x29, 116(x26)
                  sw x30, 120(x26)
                  sw x31, 124(x26)
                  la x23, write_tohost
                  jalr x0, x23, 0

instr_fault_handler:
                  add x22, x17, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x17, x22, zero
                  lw  x22, (x17)
                  addi x17, x17, 4
                  mret

load_fault_handler:
                  add x22, x17, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x17, x22, zero
                  lw  x22, (x17)
                  addi x17, x17, 4
                  mret

store_fault_handler:
                  add x22, x17, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x17, x22, zero
                  lw  x22, (x17)
                  addi x17, x17, 4
                  mret

ebreak_handler:   
                  csrr  x26, 0x341
                  addi  x26, x26, 4
                  csrw  0x341, x26
                  add x22, x17, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x17, x22, zero
                  lw  x22, (x17)
                  addi x17, x17, 4
                  mret

illegal_instr_handler:
                  csrr  x26, 0x341
                  addi  x26, x26, 4
                  csrw  0x341, x26
                  add x22, x17, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x17, x22, zero
                  lw  x22, (x17)
                  addi x17, x17, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x26, 0x300 # MSTATUS;
                  csrr  x26, 0x304 # MIE;
                  csrr  x26, 0x344 # MIP;
                  csrrc x26, 0x344, x26 # MIP;
                  add x22, x17, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x17, x22, zero
                  lw  x22, (x17)
                  addi x17, x17, 4
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
