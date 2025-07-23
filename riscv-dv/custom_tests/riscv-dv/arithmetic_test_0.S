.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x28, h0_start
jalr x0, x28, 0
h0_start:

kernel_sp:        
                  la x6, kernel_stack_end

trap_vec_init:    
                  la x11, mtvec_handler
                  ori x11, x11, 1
                  csrw 0x305, x11 # MTVEC

mepc_setup:       
                  la x11, init
                  csrw 0x341, x11

custom_csr_setup: 
                  nop

init_machine_mode:

init:             
                  li x0, 0x0
                  li x1, 0x60be9646
                  li x2, 0x5
                  li x3, 0x1
                  li x4, 0xdcb675d0
                  li x5, 0xd
                  li x7, 0xfcb5276d
                  li x8, 0xe540fec1
                  li x9, 0x80000000
                  li x10, 0x35674aae
                  li x11, 0x0
                  li x12, 0xbe731627
                  li x13, 0x8
                  li x14, 0xf09210d1
                  li x15, 0xe
                  li x16, 0x80000000
                  li x17, 0x73ceec1c
                  li x18, 0x29223fdc
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x21, 0x9
                  li x22, 0x7
                  li x23, 0x7
                  li x24, 0xaca64d6f
                  li x25, 0x80000000
                  li x26, 0x8
                  li x27, 0x3e8819c6
                  li x28, 0xff7358be
                  li x29, 0x80000000
                  li x30, 0x0
                  la x31, user_stack_end
main:             li           a2, 0x80000000 #start riscv_int_numeric_corner_stream_12
                  li           s9, 0xf72a4cc3
                  li           gp, 0x0
                  li           s7, 0x80000000
                  li           tp, 0xffffffff
                  li           s11, 0xffffffff
                  li           a7, 0x80000000
                  li           a0, 0xffffffff
                  li           s6, 0xffffffff
                  li           a4, 0x5989731a
                  mul          a7, s7, gp
                  remu         tp, s9, s7
                  add          a0, a7, a7
                  nop
                  mulh         a4, s9, tp
                  auipc        s6, 893471
                  sub          a4, s11, s6
                  mulhu        a7, a7, a0
                  mul          tp, s9, a2
                  auipc        tp, 486688
                  mulhsu       tp, s9, a0
                  mulhsu       s6, a2, a4
                  add          gp, a7, s7
                  divu         s6, a2, s7
                  lui          s9, 311517
                  nop
                  rem          tp, a7, gp
                  addi         gp, tp, -1962
                  mulhsu       s9, s11, a0
                  auipc        a4, 367042
                  mulhsu       s7, a7, a7
                  div          s9, s6, tp
                  lui          a2, 850900
                  divu         s7, a2, s11
                  mulh         s7, a2, a7
                  addi         gp, s7, -963
                  sub          s9, a7, gp
                  mulh         s9, tp, a7 #end riscv_int_numeric_corner_stream_12
                  li           gp, 0xffffffff #start riscv_int_numeric_corner_stream_0
                  li           s8, 0xffffffff
                  li           ra, 0x80000000
                  li           s7, 0x0
                  li           a3, 0x0
                  li           s5, 0x80000000
                  li           s3, 0xffffffff
                  li           a6, 0x80000000
                  li           sp, 0xffffffff
                  li           t0, 0x99ddeb9e
                  remu         ra, sp, s3
                  mulhu        a6, s7, s7
                  mul          s5, s8, s8
                  lui          sp, 377596
                  nop
                  auipc        ra, 106450
                  sub          t0, s5, gp
                  div          a6, a6, s8
                  sub          s8, a3, s8
                  mulhu        s8, ra, s8
                  mulh         ra, s7, s7
                  divu         s7, s3, gp
                  rem          s7, gp, a6
                  div          t0, a6, a3
                  rem          s7, gp, a6
                  auipc        s3, 355249
                  add          a3, s5, t0
                  mul          sp, s5, s3
                  add          t0, s5, s5
                  mulh         s7, s3, s8
                  auipc        t0, 237072
                  mul          s5, s5, s7
                  nop #end riscv_int_numeric_corner_stream_0
                  li           a2, 0xffffffff #start riscv_int_numeric_corner_stream_14
                  li           tp, 0xe2c35500
                  li           s10, 0x80000000
                  li           a4, 0xffffffff
                  li           s0, 0xb51508ed
                  li           s5, 0x80000000
                  li           t5, 0x80000000
                  li           s3, 0xa12f558f
                  li           s7, 0x80000000
                  li           s6, 0x0
                  rem          s5, s3, t5
                  sub          s3, t5, a4
                  auipc        s3, 723448
                  lui          a4, 395773
                  nop
                  mul          s3, s6, a2
                  mul          s5, s0, s7
                  rem          a4, s0, s10
                  mulh         s6, s7, tp
                  lui          s6, 509425
                  rem          t5, s5, s0
                  lui          s3, 603134
                  mulhu        s10, a4, s7
                  auipc        s3, 310046
                  mulhsu       a2, s10, s6
                  rem          s0, tp, s6
                  remu         tp, s3, s5
                  mul          s6, a2, s3 #end riscv_int_numeric_corner_stream_14
                  li           s10, 0x0 #start riscv_int_numeric_corner_stream_3
                  li           s9, 0x54b5a919
                  li           t5, 0x80000000
                  li           s5, 0x0
                  li           s1, 0xffffffff
                  li           a0, 0x911dae58
                  li           s2, 0x0
                  li           a6, 0x0
                  li           s6, 0x8a8883f5
                  li           a7, 0xc0869d6
                  nop
                  add          t5, s5, a0
                  add          s5, s1, s9
                  mulhu        s1, s6, a0
                  lui          s9, 768451
                  sub          t5, a0, s5
                  mulhu        s1, a0, s6
                  lui          s6, 889152
                  mulh         a7, s10, s1
                  lui          a6, 630013
                  mul          s1, s1, s1
                  mulh         s5, t5, s9
                  divu         s6, a7, s5
                  lui          a0, 921356
                  lui          s10, 117458
                  rem          t5, t5, s1
                  mul          s2, s10, t5
                  lui          s5, 132903
                  sub          a7, t5, s1
                  sub          t5, s2, a0
                  lui          s5, 708586
                  auipc        a6, 449688 #end riscv_int_numeric_corner_stream_3
                  li           s9, 0x9a9cb10a #start riscv_int_numeric_corner_stream_11
                  li           s0, 0x0
                  li           a5, 0x0
                  li           s3, 0x0
                  li           s1, 0xffffffff
                  li           a1, 0x1fff11df
                  li           s11, 0x80000000
                  li           t0, 0x295e7ce
                  li           a0, 0x0
                  li           t4, 0x69547280
                  rem          s9, t0, t0
                  add          s3, s1, s9
                  nop
                  mulhu        s11, a5, t0
                  mul          s11, a1, a0
                  mul          s11, s0, s9
                  div          s11, s1, s1
                  mulh         s11, a5, s1
                  mulhsu       t0, s0, t0
                  mulh         t4, s1, a0
                  mulhsu       t4, s0, s9
                  div          a0, s0, s11
                  mulhu        s1, t4, a1
                  mulhsu       s3, s0, s0
                  addi         s1, s9, 89
                  mulhsu       s3, t4, s11
                  mulhsu       s11, s9, s9
                  sub          a1, a0, a1 #end riscv_int_numeric_corner_stream_11
                  li           s2, 0x78e0ad0b #start riscv_int_numeric_corner_stream_17
                  li           a5, 0x80000000
                  li           s11, 0x0
                  li           t0, 0xffffffff
                  li           s4, 0xffffffff
                  li           t5, 0x0
                  li           sp, 0x3148b7e2
                  li           s3, 0x0
                  li           s0, 0xffffffff
                  li           s1, 0x80000000
                  add          sp, s1, sp
                  mulhsu       a5, s2, t0
                  lui          t0, 791969
                  mul          s2, t5, a5
                  mulhsu       s4, a5, s4
                  mulhsu       t5, s11, a5
                  mul          s1, s11, a5
                  mulhu        s3, t0, s0
                  mulhu        t0, s11, sp
                  mul          s4, s3, t0
                  remu         a5, t0, a5
                  nop
                  add          s11, s2, t5
                  divu         s4, s0, s0
                  mul          t0, t5, t5
                  remu         t0, s3, s4
                  mulhu        s3, s4, t0
                  addi         s3, a5, -1182 #end riscv_int_numeric_corner_stream_17
                  li           a7, 0xffffffff #start riscv_int_numeric_corner_stream_15
                  li           s11, 0x8fe934b6
                  li           gp, 0x2db89d46
                  li           s2, 0x80000000
                  li           a2, 0x765370e7
                  li           s10, 0x0
                  li           a6, 0x0
                  li           s0, 0xffffffff
                  li           ra, 0x0
                  li           s9, 0x0
                  div          s2, s9, s9
                  auipc        s9, 544191
                  mulh         s9, s0, a6
                  nop
                  remu         a6, s11, s2
                  addi         s9, s9, 665
                  auipc        s2, 70417
                  divu         s9, a6, gp
                  addi         a2, ra, -144
                  mul          s10, ra, a2
                  sub          gp, a6, s2
                  lui          gp, 127199
                  divu         s0, a6, s10
                  add          s11, ra, s2
                  mulhu        a6, a2, s11
                  rem          a7, s10, s0
                  sub          gp, a7, s11
                  rem          s0, a6, s11
                  rem          s9, a2, ra
                  auipc        gp, 812421
                  divu         gp, a2, s11
                  lui          s9, 116215
                  div          ra, gp, a2
                  divu         gp, s10, gp
                  mulhu        s9, s11, a6
                  divu         a2, ra, a7
                  lui          gp, 196876
                  nop #end riscv_int_numeric_corner_stream_15
                  li           ra, 0x0 #start riscv_int_numeric_corner_stream_10
                  li           a7, 0xffffffff
                  li           a3, 0xffffffff
                  li           a5, 0x0
                  li           s0, 0x7bf85524
                  li           s10, 0x80000000
                  li           s7, 0xffffffff
                  li           a0, 0x80000000
                  li           t5, 0x66a1a442
                  li           a1, 0xfbac59a9
                  sub          a3, a3, a5
                  mul          a1, a0, s0
                  rem          s10, a1, s0
                  addi         a3, ra, 299
                  addi         s10, s0, 1040
                  mulhu        t5, a0, s10
                  divu         a1, s7, a1
                  div          t5, a3, ra
                  addi         s10, a1, 23
                  lui          t5, 741189
                  sub          a3, s10, s0
                  mul          a7, a5, s10
                  divu         s7, t5, ra
                  addi         a0, s0, 1397
                  remu         s7, t5, t5
                  auipc        s10, 981804
                  div          a7, a1, s7
                  mulh         s0, s10, a1
                  div          s0, a7, s7
                  rem          a1, a0, t5
                  mulhu        a3, ra, s10
                  nop
                  addi         s10, a0, -1412 #end riscv_int_numeric_corner_stream_10
                  li           a4, 0x0 #start riscv_int_numeric_corner_stream_4
                  li           s8, 0x80000000
                  li           t0, 0x700355ac
                  li           a5, 0xc6e22ea8
                  li           s5, 0x60e1e4f2
                  li           gp, 0x80000000
                  li           a0, 0x66929298
                  li           s11, 0x6a62036f
                  li           s2, 0x80000000
                  li           a7, 0x80000000
                  remu         gp, s8, gp
                  auipc        t0, 880537
                  addi         a0, a4, -276
                  divu         a7, s11, gp
                  auipc        t0, 100628
                  mul          a5, s2, s11
                  mul          a5, gp, s2
                  divu         a7, t0, s2
                  div          gp, gp, a5
                  nop
                  nop
                  mul          s5, s11, s5
                  remu         a7, a4, s8
                  divu         a5, gp, s2
                  div          s11, gp, s5
                  add          a0, s11, s11
                  add          a7, a4, s2
                  add          gp, a0, s5
                  rem          s5, a7, s8
                  divu         a5, s8, a7
                  auipc        gp, 249058
                  rem          s11, s8, s2
                  sub          s8, s11, gp
                  mulhu        s11, s2, a7
                  mulh         gp, a4, s5 #end riscv_int_numeric_corner_stream_4
                  sltu         s11, s3, a5
                  rem          s0, a5, s9
                  addi         s10, s6, -265
                  lui          s7, 122398
                  c.and        a3, a1
                  slti         a4, a6, -217
                  mul          t4, t3, t3
                  srli         a2, s10, 25
                  mulhu        t4, s11, s9
                  sll          s8, sp, a1
                  slli         s11, t6, 20
                  mulhsu       s11, t6, a0
                  rem          a4, a5, t1
                  nop
                  c.andi       a2, 14
                  srli         a6, a0, 2
                  divu         ra, t6, s11
                  sra          t2, s8, a6
                  srli         s9, s7, 19
                  nop
                  c.add        s3, t1
                  or           a0, a6, s7
                  sub          a4, s11, s9
                  andi         a3, tp, 860
                  c.srli       a0, 26
                  c.srai       a4, 13
                  xori         a5, ra, 1265
                  xori         s2, s6, -153
                  andi         s10, s7, -1860
                  mul          s1, sp, s1
                  sltu         a0, s10, s3
                  mul          s7, s1, gp
                  xori         a3, zero, -1211
                  c.addi       s8, -1
                  xori         s2, s2, 1334
                  xori         s9, s0, 1186
                  nop
                  c.slli       tp, 4
                  c.andi       s0, 19
                  slti         ra, s3, -1820
                  srai         s8, t0, 5
                  sltu         a7, s1, s6
                  sltu         a4, gp, sp
                  sll          s4, s9, a2
                  mulh         a4, ra, a1
                  ori          a6, a5, -53
                  c.nop
                  c.addi       s4, -1
                  slti         a6, s11, -850
                  sltiu        a5, s1, -1533
                  mulh         a7, s6, s7
                  slli         a5, t2, 6
                  mulhsu       ra, a0, a1
                  li           t2, 0xffffffff #start riscv_int_numeric_corner_stream_5
                  li           s0, 0xffffffff
                  li           s4, 0x0
                  li           a3, 0x0
                  li           t5, 0x3ad677b3
                  li           s2, 0x80000000
                  li           sp, 0xffffffff
                  li           a5, 0x185d3095
                  li           s11, 0x0
                  li           s7, 0x80000000
                  nop
                  mulh         s11, a3, s7
                  rem          s4, s4, a3
                  rem          a3, s7, t2
                  div          a3, s2, a3
                  lui          s7, 520627
                  remu         s0, s4, s7
                  auipc        s0, 545520
                  lui          a5, 683009
                  mulhsu       s4, s7, s4
                  nop
                  divu         s7, t5, s2
                  mulh         s0, a3, sp
                  div          a5, s2, s11
                  lui          a3, 96683
                  mulhsu       s2, t2, s11
                  addi         s0, s7, 985
                  auipc        s0, 158753
                  divu         t5, s0, t5 #end riscv_int_numeric_corner_stream_5
                  srai         s0, a7, 14
                  sll          a6, tp, t5
                  remu         s2, s7, s3
                  c.li         s6, -1
                  sltiu        a1, t4, 1990
                  remu         a5, s4, a5
                  sll          a0, s1, t0
                  mulhsu       s3, t3, s7
                  c.li         s9, -1
                  mulhsu       a5, a4, a4
                  c.and        s1, a4
                  srl          a2, t1, s1
                  sltiu        a3, t4, -1818
                  or           zero, sp, t6
                  c.addi16sp   sp, -16
                  addi         gp, t1, -1314
                  c.lui        a1, 1
                  c.sub        s0, a1
                  srli         s7, s9, 2
                  ori          t5, t1, -1743
                  slti         a7, t5, 238
                  c.srli       a2, 12
                  slt          gp, t4, s11
                  auipc        s6, 723827
                  divu         s0, tp, s0
                  c.slli       sp, 15
                  andi         a1, s5, 1047
                  ori          s11, s9, 273
                  sll          a5, s5, s9
                  sll          ra, s9, t2
                  nop
                  srl          tp, t5, s3
                  c.slli       t4, 14
                  and          a6, t1, s9
                  c.li         s2, 5
                  slli         s9, s11, 27
                  c.addi       ra, 8
                  lui          tp, 833990
                  nop
                  addi         t0, a5, 85
                  c.li         s6, 6
                  c.mv         s10, t3
                  c.srai       s1, 24
                  c.srai       s0, 28
                  srai         a6, gp, 26
                  c.sub        s1, a5
                  sra          zero, s0, s2
                  mulh         t4, t2, t4
                  addi         s9, s6, -437
                  c.lui        t5, 14
                  slt          s0, s2, tp
                  remu         a1, a7, a5
                  add          s3, t0, tp
                  auipc        a2, 53111
                  mulhu        zero, s6, s2
                  and          s7, t4, s6
                  mulhsu       a6, s0, s2
                  c.and        a4, a0
                  or           a1, a0, a7
                  sltu         a1, a4, t6
                  auipc        s10, 747381
                  nop
                  slt          t0, t0, a4
                  mulhu        s2, s9, a5
                  sll          s0, s8, s10
                  srli         s5, t1, 31
                  c.li         s4, -1
                  srl          a7, s1, t3
                  andi         a1, a6, -1055
                  c.or         a2, a1
                  slti         a3, s6, -927
                  c.add        t4, t5
                  c.and        s0, a4
                  mulhu        tp, t6, t0
                  add          t2, a2, t1
                  remu         t4, a0, s1
                  srl          a4, a7, ra
                  c.xor        a5, a5
                  rem          s5, s7, zero
                  xori         a7, t5, 346
                  nop
                  c.addi       t4, 14
                  slti         zero, a6, 1992
                  mulh         a2, t1, s9
                  c.srai       a3, 16
                  srl          a6, s3, s8
                  ori          a4, s1, 2025
                  divu         ra, s3, s0
                  rem          a2, s8, t2
                  c.srai       a5, 25
                  c.addi16sp   sp, -16
                  nop
                  andi         s2, s0, 1855
                  slti         s6, s7, -452
                  and          a3, s5, s2
                  sll          s7, t4, t1
                  xori         a7, s9, -1220
                  c.addi       a7, -1
                  c.addi       s6, 22
                  c.and        a2, s0
                  c.add        a7, s4
                  sltu         t0, s8, t1
                  or           a2, s7, s10
                  c.srai       a1, 15
                  mulh         a7, zero, a1
                  c.srai       s1, 6
                  mulhsu       tp, a5, t0
                  sltu         a7, gp, a0
                  div          t4, t4, a0
                  sra          sp, s11, s11
                  andi         s2, a3, -325
                  c.andi       a4, -1
                  c.sub        s0, s1
                  ori          a2, s8, 1342
                  rem          tp, zero, zero
                  xori         s2, a7, -920
                  auipc        gp, 161713
                  srli         a3, a2, 5
                  div          a1, zero, t1
                  c.nop
                  add          a6, t0, tp
                  c.addi16sp   sp, -16
                  rem          t4, s10, tp
                  auipc        gp, 894562
                  slti         s3, s2, -176
                  c.lui        t5, 15
                  mul          s5, s6, s0
                  sltiu        a3, t2, -1057
                  c.or         a2, s1
                  c.srli       s0, 19
                  c.lui        a6, 13
                  c.lui        a6, 31
                  nop
                  c.mv         a1, s8
                  nop
                  sll          s4, a3, a1
                  divu         s0, s11, s2
                  div          a0, s9, s3
                  lui          a3, 245291
                  sra          gp, t6, a5
                  mulh         s0, t0, s0
                  c.slli       s0, 4
                  c.addi16sp   sp, 304
                  div          s8, s1, a0
                  srli         t4, a5, 22
                  remu         zero, a2, sp
                  c.lui        gp, 30
                  c.nop
                  remu         gp, t5, s8
                  slt          s2, gp, t6
                  c.slli       ra, 20
                  and          s2, s6, t0
                  mulhsu       a5, a6, a2
                  c.andi       s0, -1
                  add          a6, s4, t2
                  srai         ra, a6, 1
                  andi         s1, a4, 1543
                  sltiu        zero, a3, 646
                  c.add        a1, a0
                  c.mv         t5, a2
                  sltu         t4, t0, t6
                  xor          s6, t3, t3
                  div          a1, t6, t0
                  c.xor        a3, s1
                  mulh         a6, t3, a3
                  slli         s5, tp, 23
                  c.or         s1, a5
                  andi         a5, gp, 280
                  c.nop
                  div          s5, sp, a4
                  c.slli       s10, 31
                  c.addi4spn   s1, sp, 144
                  ori          gp, s11, -847
                  c.addi4spn   a5, sp, 320
                  sltiu        s9, s2, -405
                  mulh         s9, s2, s2
                  sub          zero, tp, a6
                  c.mv         a0, t4
                  c.addi       tp, -1
                  c.lui        s7, 7
                  add          sp, s0, t0
                  div          a6, a3, a6
                  c.xor        a0, s1
                  mulhu        a7, s10, s4
                  c.slli       t0, 12
                  mulhu        s1, gp, t0
                  slti         s9, s4, 512
                  c.add        a0, s6
                  srai         a0, a0, 30
                  c.li         a1, -1
                  xor          tp, a5, s1
                  srai         a1, s3, 20
                  or           s9, s11, a7
                  c.xor        s1, s1
                  sub          a4, a7, tp
                  sll          a4, s6, tp
                  c.li         a7, -1
                  rem          s7, a2, s3
                  slt          zero, ra, s5
                  c.andi       s1, 21
                  srai         s0, t6, 26
                  ori          s4, a2, -1899
                  xor          s1, s9, tp
                  mulhsu       t5, a6, t2
                  c.addi4spn   s1, sp, 976
                  c.addi       s8, 3
                  c.srli       a5, 20
                  c.addi       t5, -1
                  c.addi16sp   sp, -16
                  sra          zero, a5, s5
                  div          a3, s8, s2
                  divu         s4, a0, t4
                  nop
                  srl          t0, a2, t5
                  xor          s0, a7, t4
                  xor          ra, tp, s3
                  rem          s10, s5, t3
                  c.sub        a1, a3
                  andi         t0, s10, 739
                  c.xor        a1, a1
                  c.addi       a5, 12
                  sub          sp, a1, s11
                  c.add        s3, s8
                  slt          a7, t1, s11
                  c.addi       gp, 27
                  c.nop
                  sra          t2, a7, s0
                  srli         tp, s6, 6
                  mul          sp, t5, s10
                  c.or         s0, a4
                  c.addi4spn   s1, sp, 272
                  srli         ra, s0, 29
                  xori         a1, t1, 1945
                  c.and        a0, a1
                  c.li         s2, 7
                  sra          s6, t4, gp
                  andi         s4, s7, 559
                  mulhsu       a0, s5, s5
                  andi         a1, gp, -1866
                  c.or         a2, s1
                  rem          s1, a2, a4
                  remu         a2, t1, s11
                  auipc        t0, 136303
                  sltiu        s0, s2, 1823
                  sub          s4, a2, s11
                  c.sub        a4, a1
                  mulhu        a3, t6, t2
                  div          a0, t0, t6
                  mul          t2, s10, tp
                  c.add        ra, a3
                  c.srai       a0, 15
                  c.slli       ra, 13
                  xori         t2, a0, -1884
                  sltu         zero, zero, s8
                  xor          a3, s1, a6
                  nop
                  c.lui        s7, 10
                  or           s11, s4, s3
                  and          s4, sp, s5
                  rem          s2, s0, s10
                  or           a3, a7, a0
                  c.mv         t0, gp
                  c.xor        a2, a1
                  lui          s8, 592272
                  c.or         a1, s0
                  add          t2, s2, a6
                  c.xor        s1, a3
                  sub          a2, s1, s2
                  srai         s3, gp, 25
                  sub          s0, t3, s3
                  or           zero, t0, t0
                  andi         gp, t4, 203
                  c.srai       s0, 3
                  c.lui        a7, 20
                  c.andi       a0, 10
                  mulh         gp, s3, a1
                  mulhu        s1, t6, s3
                  c.xor        a0, a0
                  c.mv         s8, s4
                  div          zero, a0, t0
                  c.slli       s2, 18
                  c.lui        a5, 31
                  divu         a1, t2, t0
                  auipc        t4, 61292
                  sra          a0, a6, s6
                  slli         s1, a4, 27
                  ori          t0, t0, -833
                  sltu         a2, a3, a0
                  c.srli       a3, 25
                  c.slli       s8, 7
                  auipc        s11, 23184
                  c.slli       s10, 24
                  add          a4, zero, a5
                  remu         s3, s8, a3
                  nop
                  rem          t2, s7, a2
                  auipc        s2, 332794
                  srli         s1, s0, 5
                  c.addi16sp   sp, -16
                  and          a6, s0, a5
                  c.li         t4, 29
                  andi         tp, sp, -20
                  divu         a6, a6, a3
                  nop
                  mulhu        s5, zero, a2
                  c.srli       a4, 25
                  c.or         a1, a0
                  c.and        a2, a4
                  mulh         s6, t1, ra
                  slti         a2, s1, -676
                  nop
                  add          gp, zero, a7
                  c.mv         a0, s4
                  slli         t0, a6, 2
                  sltu         s2, t6, s7
                  xori         t4, a1, 1155
                  slli         s11, a6, 13
                  mul          a7, sp, t4
                  c.or         s0, a1
                  ori          s11, a5, 697
                  c.andi       a5, 6
                  xor          a1, t4, a1
                  mulhu        s1, s8, tp
                  remu         s6, s1, t4
                  c.srli       a3, 3
                  ori          a7, a0, 2017
                  mulhsu       s3, s7, t0
                  srl          t0, t1, a5
                  andi         a5, ra, -1359
                  slt          t5, t0, sp
                  c.addi4spn   a3, sp, 656
                  srai         a4, s2, 23
                  c.mv         tp, s8
                  srl          s10, ra, s1
                  mulhu        a5, t3, a0
                  slt          t4, a6, t6
                  and          s3, a3, t2
                  c.or         s1, a5
                  add          s1, t2, a5
                  c.srai       a0, 9
                  nop
                  c.xor        s1, a3
                  mulhu        s0, a3, s9
                  auipc        a4, 503112
                  and          t4, s1, sp
                  c.slli       ra, 2
                  or           s7, gp, ra
                  xor          zero, a7, s9
                  and          t2, s9, s4
                  ori          s1, s7, 699
                  remu         a1, t3, t3
                  xor          t5, s6, s6
                  addi         s4, sp, 53
                  c.xor        a0, s0
                  c.sub        a2, a3
                  c.lui        s11, 2
                  c.srai       a3, 4
                  sra          s1, a0, s3
                  c.or         s1, s0
                  sra          a4, t6, s10
                  slti         s0, t3, -679
                  auipc        s9, 150623
                  c.li         s2, 9
                  div          s10, t2, t6
                  c.srai       a2, 10
                  c.lui        s7, 16
                  mulhsu       a0, t6, a4
                  mulh         s7, a4, t2
                  addi         t0, t0, 938
                  c.mv         t5, t5
                  mulh         t0, t4, t4
                  sub          s5, s8, sp
                  c.or         s0, a5
                  c.or         a3, a2
                  xor          s2, t5, t1
                  c.sub        s0, a5
                  c.nop
                  slt          s11, t1, s1
                  xori         t5, a5, 716
                  c.andi       a1, 27
                  slti         s3, t4, -320
                  c.andi       s1, 9
                  auipc        ra, 447090
                  remu         s4, s10, t1
                  divu         ra, t5, s8
                  slli         t2, a3, 29
                  c.addi16sp   sp, 192
                  c.andi       a5, -1
                  mulhsu       t5, tp, a2
                  c.srli       a4, 10
                  mulhsu       s2, tp, s9
                  mulhu        s9, s3, a6
                  mulhu        tp, a6, a0
                  nop
                  c.and        s1, s1
                  sltu         s4, a0, t6
                  c.lui        s2, 7
                  c.and        a3, a2
                  c.addi4spn   a4, sp, 464
                  li           t5, 0x0 #start riscv_int_numeric_corner_stream_8
                  li           a4, 0x0
                  li           s2, 0x0
                  li           ra, 0x0
                  li           a5, 0xffffffff
                  li           s8, 0x0
                  li           a6, 0x80000000
                  li           a3, 0x34897f25
                  li           t2, 0x0
                  li           tp, 0xffffffff
                  mulh         s8, t5, s2
                  lui          s8, 244273
                  div          t2, a3, s2
                  nop
                  addi         tp, s8, -1394
                  mul          a5, t5, t5
                  mul          a6, a3, a4
                  mulhu        a3, tp, s2
                  div          a4, a4, t5
                  sub          a6, a5, t2
                  div          tp, t5, t2
                  lui          t5, 1002290
                  rem          a3, t2, a5
                  sub          a5, a6, a4
                  div          t5, a3, t5
                  mulhu        t2, t2, a6
                  auipc        ra, 722931
                  addi         t2, t2, -327
                  mulhu        t5, ra, a6
                  nop
                  sub          a6, tp, t2
                  div          a4, s2, a6
                  mulh         t5, tp, t2
                  remu         a3, t2, a4
                  rem          a6, t5, a5
                  lui          ra, 717796 #end riscv_int_numeric_corner_stream_8
                  sra          t2, s7, a6
                  sll          s5, t1, s8
                  srl          a3, a3, s5
                  c.addi4spn   a2, sp, 848
                  c.addi4spn   a1, sp, 752
                  c.addi       a6, -1
                  mulhsu       s8, t3, s5
                  c.xor        a1, a4
                  c.mv         tp, a5
                  c.addi4spn   s0, sp, 320
                  c.srli       a4, 5
                  c.and        a0, a5
                  c.addi4spn   s1, sp, 112
                  c.mv         tp, s11
                  sra          sp, t4, t4
                  xori         s9, a6, 1581
                  mulh         s3, a4, t5
                  mulhsu       s9, zero, t0
                  slli         s11, s3, 14
                  sltu         s7, tp, a1
                  c.or         a5, a1
                  slti         s3, s6, 439
                  sra          s0, t1, zero
                  slt          zero, a7, ra
                  c.slli       s7, 27
                  remu         t5, s10, t2
                  c.sub        a5, a4
                  slti         a7, s7, 761
                  c.add        s10, t0
                  xor          a1, s0, s11
                  c.andi       a1, -1
                  c.andi       a4, 27
                  or           a4, a3, s8
                  sll          zero, s4, sp
                  c.nop
                  c.or         a1, a2
                  c.xor        s0, a1
                  slti         a4, t4, -1062
                  sltu         s6, s1, a2
                  auipc        s6, 554449
                  addi         a5, t6, 716
                  c.nop
                  c.addi4spn   s0, sp, 784
                  xori         s2, t6, 7
                  sltiu        s2, a6, 1260
                  xor          t5, a4, s0
                  or           s1, t1, a6
                  c.and        a1, a4
                  add          a5, s7, t5
                  c.sub        a1, s0
                  c.nop
                  sltiu        s3, t5, -1070
                  slli         s8, tp, 11
                  c.addi16sp   sp, -16
                  divu         a1, t1, t6
                  c.mv         a6, s7
                  c.mv         s8, a3
                  xor          a4, a7, s7
                  c.xor        s0, a1
                  sub          s9, a6, s9
                  sltu         zero, s7, s7
                  sll          a0, s9, s8
                  add          s6, ra, a7
                  sltu         ra, s3, ra
                  c.srli       a4, 11
                  c.lui        a6, 10
                  c.addi16sp   sp, -16
                  auipc        t5, 396029
                  c.and        s1, a1
                  srli         a3, s10, 7
                  andi         t4, t6, -1967
                  c.srai       a1, 2
                  slti         s10, s5, -520
                  mul          s4, t3, s7
                  sll          a4, t1, t1
                  srai         t4, sp, 22
                  add          a6, s1, t0
                  c.nop
                  c.srai       s0, 1
                  rem          s5, t5, a7
                  div          a0, a3, gp
                  c.li         s10, -1
                  xori         a7, s9, -695
                  c.add        ra, t5
                  div          sp, t2, a3
                  c.addi16sp   sp, -16
                  andi         s1, a0, -2031
                  andi         a5, tp, 25
                  add          s2, a5, s0
                  slti         s8, s8, 1674
                  c.xor        s0, a1
                  sll          t5, t2, t4
                  c.srai       s0, 30
                  srai         s9, t3, 29
                  c.or         a4, a1
                  ori          t2, t0, -208
                  and          ra, s7, t6
                  srl          a2, s0, t3
                  xor          a6, t3, s0
                  slli         t4, s4, 29
                  auipc        s2, 117850
                  xor          ra, s11, a0
                  srai         a7, ra, 14
                  c.srli       a1, 6
                  c.xor        a4, s1
                  div          s4, t6, t3
                  c.sub        a0, a3
                  c.sub        a2, a5
                  c.addi16sp   sp, -16
                  mulh         a1, zero, t3
                  c.addi       s6, -1
                  c.add        ra, s5
                  remu         t4, tp, a5
                  mulh         s1, t4, t6
                  c.or         a1, a2
                  c.addi16sp   sp, 240
                  c.addi16sp   sp, -16
                  c.add        s8, t2
                  add          a6, s1, s11
                  c.addi4spn   s1, sp, 1008
                  andi         s2, s11, 1511
                  sltu         s7, zero, a5
                  remu         s4, a7, t3
                  and          a1, gp, s1
                  c.sub        a1, s1
                  srli         s3, t4, 9
                  sra          a4, t3, s7
                  srai         t2, t6, 19
                  c.srai       a0, 1
                  rem          s3, s8, zero
                  c.xor        a4, a3
                  srli         s11, a2, 23
                  c.mv         s10, s7
                  sltu         s9, t5, sp
                  auipc        s10, 500184
                  remu         a7, a7, t1
                  c.add        t0, t6
                  slti         t5, t5, 1999
                  mulh         s4, tp, zero
                  auipc        tp, 148770
                  auipc        tp, 536249
                  c.add        s6, sp
                  mulh         zero, s1, s7
                  mulh         gp, a2, a2
                  c.addi4spn   s1, sp, 576
                  divu         t2, t0, s2
                  srai         t0, s0, 2
                  srl          s4, s10, t6
                  sub          a7, s4, s9
                  c.addi4spn   a3, sp, 32
                  div          t4, s6, t4
                  c.li         s5, 2
                  sll          a5, t5, tp
                  auipc        s11, 992890
                  c.and        a2, a5
                  sub          s3, a4, t4
                  c.sub        a2, s1
                  addi         s1, s7, 629
                  remu         s2, zero, zero
                  andi         t2, sp, 954
                  slli         t4, s3, 2
                  rem          a5, tp, a1
                  and          s11, t6, t5
                  c.andi       a2, 18
                  srai         ra, t4, 6
                  andi         a5, a1, 1671
                  c.xor        a1, s0
                  c.sub        a1, a5
                  nop
                  mulh         s1, s6, a6
                  slti         s7, s6, 1638
                  srai         s10, s7, 4
                  auipc        s2, 635102
                  c.or         a3, a1
                  srai         t5, s2, 3
                  lui          s9, 450067
                  srl          t0, t5, ra
                  c.nop
                  c.li         a0, -1
                  lui          a7, 599554
                  sra          s8, t1, t6
                  c.addi4spn   s1, sp, 400
                  lui          zero, 249007
                  c.add        s7, t0
                  xori         s4, s3, 344
                  mul          a0, a4, s1
                  c.slli       s3, 15
                  nop
                  c.nop
                  c.or         a3, a3
                  divu         a2, s4, a6
                  c.srai       a2, 5
                  c.sub        a5, a2
                  slli         s7, t4, 9
                  add          ra, s10, gp
                  sub          t0, a2, s5
                  c.lui        t0, 29
                  slti         zero, s0, 1023
                  c.add        t0, tp
                  slt          a0, t2, t4
                  rem          s0, a0, a4
                  addi         s8, s10, 909
                  c.addi16sp   sp, -16
                  mulhsu       sp, s8, a1
                  c.addi       s10, -1
                  mulhu        t5, t0, s8
                  c.li         gp, -1
                  slt          a4, sp, s2
                  div          a5, s9, s10
                  lui          s10, 809906
                  sltiu        s1, a5, -1730
                  mulhu        t0, zero, a4
                  div          s4, s7, s9
                  c.srai       a3, 18
                  c.slli       s7, 1
                  xori         ra, a0, -177
                  sltiu        a2, t4, -1999
                  remu         t0, s6, s0
                  auipc        s7, 23773
                  slti         s7, tp, 1244
                  srai         a7, s0, 7
                  xor          t4, s8, ra
                  c.or         a5, s0
                  ori          ra, s4, -559
                  divu         ra, a0, a6
                  c.xor        a3, a5
                  c.addi16sp   sp, -16
                  sra          s4, a0, t0
                  remu         t4, a6, a5
                  remu         s11, tp, s1
                  c.mv         s8, t3
                  srli         a1, t2, 26
                  ori          t0, s1, -270
                  lui          a4, 479116
                  nop
                  c.srli       a3, 29
                  c.or         a0, s0
                  c.add        s4, s2
                  srli         zero, a7, 11
                  c.addi       a4, -1
                  xori         s9, tp, 42
                  c.mv         gp, gp
                  andi         a0, s3, -238
                  xori         s6, t4, 1415
                  c.srai       s1, 1
                  xori         t0, s8, -243
                  c.sub        s0, a0
                  mul          a0, s9, t2
                  mulhsu       s2, s1, a4
                  c.addi       a4, 2
                  sub          s9, a3, t1
                  sll          a6, ra, t3
                  rem          a0, a3, s1
                  c.add        a3, t6
                  c.sub        a2, s1
                  mulhsu       s10, sp, t2
                  c.addi16sp   sp, -16
                  c.and        a1, a0
                  c.srai       a1, 8
                  slli         s2, s6, 30
                  c.slli       t5, 7
                  c.li         s8, -1
                  slti         s1, s6, 1027
                  c.xor        a2, a4
                  c.lui        s7, 16
                  mulhsu       s5, sp, s7
                  c.addi4spn   a4, sp, 816
                  lui          tp, 199481
                  sltu         s2, s0, a3
                  mulh         s9, t2, sp
                  remu         s6, sp, a7
                  c.li         s1, 21
                  c.srai       a4, 7
                  c.lui        s7, 9
                  mul          s4, s11, s4
                  and          t5, a7, s6
                  ori          a5, s2, 159
                  andi         s0, t1, -1637
                  c.xor        a4, a0
                  sll          s10, t3, s3
                  c.or         a1, a4
                  divu         s7, s7, t6
                  mulhu        s5, s8, gp
                  nop
                  nop
                  sltiu        ra, ra, 2022
                  div          a6, s0, a4
                  mulhsu       t5, t1, sp
                  c.or         a3, a4
                  c.mv         s5, t1
                  c.addi       sp, 24
                  c.sub        a5, a3
                  c.li         a3, 15
                  sltiu        ra, t6, -713
                  c.xor        a0, a5
                  mulhsu       sp, a1, s6
                  slli         a3, t4, 29
                  li           a5, 0xffffffff #start riscv_int_numeric_corner_stream_7
                  li           ra, 0x0
                  li           s11, 0xe3e16d33
                  li           s3, 0xd3316957
                  li           tp, 0xffffffff
                  li           s8, 0x80000000
                  li           a4, 0xffffffff
                  li           s10, 0xffffffff
                  li           s2, 0x0
                  li           a0, 0xffffffff
                  addi         a5, s10, -1614
                  divu         a4, s3, a5
                  rem          s11, s10, a0
                  mulhsu       ra, a0, ra
                  divu         a5, ra, ra
                  addi         s11, s2, -502
                  add          s2, a0, s3
                  mulh         ra, s3, ra
                  mul          s2, s11, s3
                  rem          s10, s10, s2
                  mulhsu       a4, s8, a5
                  rem          s10, ra, a5
                  lui          tp, 1005969
                  nop
                  auipc        s11, 564184
                  mulhu        s10, ra, s8
                  nop
                  div          s8, s11, s3
                  mul          tp, tp, s8 #end riscv_int_numeric_corner_stream_7
                  c.srai       a2, 15
                  c.lui        tp, 17
                  mulhu        a1, s10, a4
                  nop
                  c.add        t5, s7
                  c.addi4spn   s0, sp, 192
                  c.sub        a3, s1
                  ori          a1, zero, 2
                  lui          t0, 760381
                  c.mv         a0, t6
                  or           s5, s1, s5
                  c.addi16sp   sp, -16
                  sltiu        a0, t5, 354
                  ori          s2, s4, 1204
                  sltiu        a0, s7, -1575
                  srai         a7, ra, 17
                  and          s7, a7, a5
                  add          s4, a3, a2
                  lui          s11, 987811
                  mulhsu       a3, s10, s0
                  auipc        tp, 56056
                  divu         s6, a2, s5
                  c.or         s0, a1
                  sra          ra, s10, s3
                  nop
                  ori          t2, s0, 1207
                  c.srai       a3, 10
                  slt          a4, zero, t5
                  c.sub        a3, s0
                  c.srli       a4, 24
                  c.lui        a7, 9
                  add          s5, a2, s1
                  div          t4, t3, s4
                  srl          s5, sp, a6
                  c.xor        s1, a5
                  rem          t4, s4, t2
                  remu         a6, s8, s2
                  rem          t5, t5, s3
                  c.xor        a4, a4
                  c.srli       s0, 3
                  c.li         t2, 14
                  c.and        a1, s0
                  c.addi16sp   sp, 400
                  lui          t5, 215529
                  slti         s3, s9, 465
                  c.mv         t5, s3
                  rem          s8, sp, t6
                  c.mv         a0, s5
                  nop
                  srli         s6, s2, 15
                  sll          a5, t4, a0
                  c.xor        a1, s0
                  sll          s0, s7, s2
                  srai         s5, s0, 22
                  c.andi       s0, -1
                  srl          a5, tp, gp
                  c.and        s1, a5
                  c.nop
                  c.andi       a3, 15
                  sltiu        a4, s1, -887
                  c.srli       a0, 13
                  c.add        t2, sp
                  c.andi       a1, 20
                  lui          a7, 274949
                  c.lui        a1, 3
                  sltu         a2, sp, t0
                  srli         ra, t0, 23
                  sltiu        s9, s1, -625
                  srli         s8, s0, 29
                  c.srai       a1, 4
                  nop
                  div          a0, t0, a2
                  addi         t0, a0, 873
                  sll          tp, t4, a0
                  xor          s10, zero, t1
                  or           s1, a3, a0
                  c.or         a4, a2
                  c.slli       a4, 18
                  c.nop
                  slt          s1, t4, s7
                  sll          a0, gp, t3
                  or           s3, s1, s4
                  c.addi4spn   a4, sp, 528
                  srli         s2, t4, 30
                  mulh         s2, a2, s10
                  add          ra, s8, s6
                  mulhsu       s9, a4, s9
                  slti         s9, a2, -812
                  sub          s0, s2, s7
                  slt          s6, a5, s4
                  nop
                  srli         s8, a0, 1
                  c.li         a0, -1
                  sll          a0, s2, s0
                  sra          t2, s3, a2
                  rem          a5, a5, s1
                  c.sub        a2, a2
                  c.andi       a5, 27
                  c.srai       a1, 1
                  and          s7, s5, a4
                  c.li         t0, 2
                  c.and        s1, a4
                  ori          s6, a3, 1674
                  sltiu        zero, a6, 1480
                  sra          a0, t2, sp
                  c.addi4spn   a3, sp, 784
                  c.srli       a2, 25
                  sra          t0, s8, s8
                  remu         s10, t4, t1
                  c.nop
                  c.or         a4, s0
                  rem          a2, tp, s11
                  slti         gp, a7, -1205
                  srai         s6, s1, 14
                  sltiu        tp, t4, 111
                  c.mv         s9, s1
                  sll          a0, tp, s10
                  add          s4, zero, s6
                  c.mv         tp, a7
                  divu         a0, a7, t6
                  c.addi4spn   a3, sp, 128
                  nop
                  nop
                  div          a4, a3, s4
                  c.addi16sp   sp, -16
                  xori         s11, zero, 1194
                  auipc        a7, 85470
                  slti         s10, t1, 1351
                  c.xor        a3, a2
                  xori         t4, a1, -653
                  c.add        a7, a2
                  sltiu        s7, sp, -1038
                  mulh         s5, tp, a2
                  add          s9, sp, a1
                  addi         t4, a1, 1893
                  sub          a0, a4, s3
                  slli         s11, s2, 0
                  c.addi       a7, 10
                  srl          a4, ra, a1
                  c.addi4spn   a2, sp, 720
                  c.srai       a3, 8
                  c.and        a2, a1
                  c.slli       a0, 1
                  slt          t0, a7, a1
                  sub          a5, t4, s8
                  c.lui        a0, 14
                  div          a0, s11, s6
                  slli         a0, tp, 20
                  sra          s1, a0, s11
                  nop
                  c.addi       tp, 7
                  c.xor        a1, a5
                  c.addi16sp   sp, 320
                  sub          s8, a7, s11
                  c.slli       a7, 11
                  divu         s9, t3, tp
                  c.addi       a5, -1
                  c.addi16sp   sp, -16
                  sltu         a6, t6, a1
                  c.sub        s0, s1
                  sll          s0, a0, a5
                  c.addi16sp   sp, -16
                  mulh         s2, a2, a4
                  add          s7, s3, a6
                  mulhu        t4, s4, a0
                  andi         a5, s1, -1211
                  xori         t4, s10, 1884
                  or           s8, s4, tp
                  slt          s11, t1, a3
                  slli         gp, t1, 2
                  c.addi       tp, 1
                  srai         s10, s6, 3
                  sra          tp, t0, a1
                  srai         a3, s2, 3
                  rem          s2, a5, t1
                  c.addi       s5, -1
                  c.lui        a5, 10
                  sll          s0, s0, tp
                  c.lui        s2, 28
                  c.mv         s7, s1
                  sltu         gp, s0, ra
                  and          a1, a3, t5
                  slt          s1, ra, t1
                  mul          s10, sp, t5
                  sltiu        a1, t3, 766
                  c.addi       t4, 31
                  c.addi16sp   sp, -16
                  xori         s10, sp, 1813
                  and          gp, zero, sp
                  c.add        s4, s7
                  srli         s9, s7, 19
                  or           a5, a3, t3
                  sltu         a0, a5, s4
                  andi         s0, t3, -19
                  c.srli       a5, 5
                  sra          a1, t5, s3
                  auipc        s0, 437178
                  addi         tp, t1, -1218
                  c.xor        a0, s1
                  slli         s7, sp, 17
                  mul          t0, t0, t0
                  remu         a2, s4, a4
                  c.lui        t0, 30
                  add          s11, s10, gp
                  c.mv         a1, a5
                  or           a7, t4, a1
                  c.slli       s10, 19
                  c.or         s1, s0
                  sub          s10, s0, t4
                  c.addi16sp   sp, 240
                  srai         s3, a4, 16
                  slt          s4, s5, zero
                  srl          a1, a5, s8
                  sra          zero, ra, t5
                  c.addi4spn   a3, sp, 832
                  and          s10, s9, a2
                  lui          s5, 442752
                  mul          s10, gp, a2
                  c.nop
                  div          t5, ra, s8
                  sll          a4, ra, a5
                  nop
                  addi         a4, s9, -2019
                  nop
                  remu         s11, s9, t6
                  sltiu        a4, t0, 200
                  mulh         s2, gp, ra
                  c.xor        a2, a2
                  sltu         ra, s4, s0
                  c.srli       a3, 29
                  c.srli       a1, 17
                  add          gp, zero, a0
                  c.and        s0, a3
                  lui          a4, 880124
                  slli         a0, s0, 8
                  sra          s11, a2, t3
                  nop
                  rem          a1, t4, s0
                  or           gp, a1, a1
                  c.srai       a4, 25
                  sub          t2, t5, t5
                  slli         a4, s8, 19
                  c.addi       s7, 5
                  c.and        s0, s1
                  mulh         a2, ra, zero
                  andi         sp, tp, 1639
                  add          t0, a3, a2
                  remu         s8, t3, a4
                  srli         s1, s8, 18
                  c.addi4spn   a4, sp, 816
                  sra          a5, tp, t1
                  or           s9, s4, s6
                  c.slli       s9, 12
                  c.addi       s11, 18
                  slti         s9, s4, -1077
                  slli         tp, a5, 29
                  mulhu        a5, a7, s10
                  c.or         a5, a4
                  c.and        a1, a4
                  c.xor        a1, a2
                  remu         t2, gp, a5
                  c.xor        a2, a4
                  rem          s6, a6, a7
                  sll          a5, a7, s3
                  addi         s4, ra, -2011
                  c.mv         a2, a6
                  slti         s9, s11, 1685
                  c.addi16sp   sp, -16
                  add          a4, s11, s7
                  nop
                  rem          a3, s9, s2
                  mulhu        s3, a1, s1
                  divu         s1, s4, s9
                  mulhsu       a7, s7, s7
                  sub          s9, a4, s9
                  slli         s3, s4, 0
                  c.mv         a4, sp
                  c.add        tp, tp
                  slt          t0, t1, s2
                  xor          s2, t1, s0
                  addi         a0, s7, 1663
                  mul          t0, s8, s5
                  auipc        a1, 98392
                  remu         a6, s5, gp
                  mulhsu       a2, s5, s7
                  c.srai       a5, 30
                  and          s0, a3, t4
                  c.andi       s0, 22
                  sub          t0, t0, a3
                  nop
                  mulhsu       s3, t2, t4
                  addi         a1, a2, -1527
                  ori          zero, s5, -194
                  c.sub        s0, a5
                  c.srli       a1, 20
                  slti         s3, zero, 558
                  mulhu        sp, t0, t1
                  sra          s0, gp, a7
                  sub          t5, a1, t5
                  c.add        s10, s5
                  ori          a1, t4, 1032
                  c.or         a3, a2
                  div          a6, a0, s10
                  c.xor        a3, a1
                  remu         a4, a6, t5
                  c.slli       s5, 2
                  add          t0, a0, s10
                  c.lui        a3, 3
                  andi         a5, sp, -1677
                  sll          s9, s7, a5
                  c.nop
                  c.lui        t0, 2
                  srli         s7, a0, 4
                  sltiu        t2, s3, -1060
                  divu         a7, s1, ra
                  xori         s2, t4, -1906
                  and          a6, a4, ra
                  ori          a7, t0, -622
                  or           t0, s5, a1
                  c.srli       a4, 20
                  nop
                  divu         s4, a3, tp
                  xor          zero, a2, a2
                  c.nop
                  and          t4, t0, a3
                  sll          s3, a6, s10
                  srli         s10, t5, 4
                  c.srli       a2, 19
                  c.slli       t5, 23
                  lui          tp, 418970
                  divu         s10, t2, s9
                  andi         a2, t3, -1779
                  c.slli       tp, 1
                  c.addi       s9, -1
                  remu         a3, s5, s2
                  c.addi4spn   a5, sp, 400
                  and          s0, s0, s11
                  sra          s4, a5, t3
                  sltu         gp, t6, a6
                  and          tp, t3, s10
                  srli         s0, t1, 12
                  remu         t4, a4, t4
                  c.addi16sp   sp, -16
                  andi         tp, s7, -1361
                  slti         s1, s7, 507
                  ori          a3, s1, 1749
                  srai         s8, s6, 21
                  srl          s7, t3, a5
                  mul          s6, s3, t4
                  sra          t5, t5, s2
                  nop
                  c.slli       ra, 24
                  lui          a0, 663510
                  srai         a5, s11, 26
                  rem          a4, a2, s4
                  ori          gp, a0, 1693
                  c.slli       s0, 19
                  and          s7, sp, a1
                  slti         s7, s8, -862
                  c.add        s11, s1
                  slti         zero, a6, -879
                  srli         s6, zero, 22
                  srl          a7, ra, t4
                  lui          s2, 154214
                  c.or         s0, a2
                  ori          a6, t0, 587
                  srli         tp, a0, 20
                  auipc        a2, 505118
                  c.srai       a0, 22
                  c.addi16sp   sp, -16
                  auipc        s11, 555506
                  sltiu        a3, a3, -1356
                  remu         t4, t2, s5
                  c.mv         s1, tp
                  c.addi4spn   a0, sp, 208
                  c.and        a0, a5
                  c.addi4spn   a0, sp, 400
                  c.lui        s8, 15
                  div          gp, gp, t5
                  srli         s7, s11, 1
                  srai         s5, s6, 22
                  mulhu        a2, a1, s4
                  remu         t2, t6, s11
                  mul          s9, s0, a2
                  srl          a7, s10, ra
                  remu         s1, s8, tp
                  slli         s9, s8, 19
                  remu         s1, t5, gp
                  or           zero, a2, s10
                  srli         a0, a0, 19
                  sltu         s8, s1, s3
                  srl          a6, a7, s0
                  slti         s7, ra, -1886
                  div          s3, a5, sp
                  c.addi16sp   sp, 304
                  sltu         tp, t0, s7
                  andi         tp, ra, -768
                  c.li         t4, 25
                  c.srai       a1, 25
                  nop
                  c.addi16sp   sp, -16
                  addi         ra, s1, -349
                  sltiu        zero, t6, -322
                  rem          s0, t0, sp
                  auipc        zero, 204934
                  sll          s5, t5, tp
                  slt          s10, s11, a4
                  sll          sp, gp, ra
                  nop
                  mulhu        s2, sp, s0
                  xor          sp, s6, a3
                  auipc        a0, 663777
                  c.sub        a5, s1
                  c.slli       tp, 23
                  remu         t5, s8, t5
                  sub          s2, a0, s7
                  c.or         a5, a5
                  remu         zero, s9, a1
                  c.srai       a0, 28
                  sltu         tp, s0, s3
                  div          s11, s8, s10
                  sub          s11, s5, a6
                  c.srai       a3, 11
                  c.srai       s1, 29
                  c.addi16sp   sp, 416
                  c.addi16sp   sp, 32
                  c.addi16sp   sp, -16
                  c.slli       s11, 15
                  c.sub        s1, a2
                  sltu         s4, t0, ra
                  srai         t4, ra, 0
                  add          s7, a2, a2
                  sltiu        zero, s6, 932
                  mulhsu       s8, t5, a7
                  slti         a5, gp, -826
                  nop
                  sra          s5, a7, s0
                  addi         s9, a1, -1362
                  addi         s8, t6, 1
                  slt          a5, t0, t2
                  srai         s11, a4, 10
                  add          s5, t6, t4
                  srai         ra, ra, 9
                  add          t2, a6, s3
                  sub          t2, t5, gp
                  slt          sp, s7, s7
                  c.andi       a4, 4
                  c.andi       a3, -1
                  sltiu        s0, s8, -456
                  mulhu        s6, t0, s6
                  add          a3, s10, s3
                  c.li         a3, 28
                  c.andi       a5, 17
                  mulhsu       ra, s6, t0
                  slli         a0, t6, 11
                  xori         gp, s0, -1513
                  c.addi16sp   sp, 480
                  and          s8, s10, s3
                  div          s4, s10, sp
                  div          zero, s4, s10
                  srl          zero, a5, s10
                  and          s4, a7, t5
                  sub          a0, s3, tp
                  andi         s6, t2, -1565
                  nop
                  c.srai       a4, 15
                  div          s11, tp, s1
                  c.andi       s0, 23
                  slt          s1, tp, zero
                  mulhsu       t2, t3, s0
                  and          t0, s1, s0
                  c.andi       a3, -1
                  c.lui        a1, 27
                  sll          s4, t0, s6
                  srl          a2, s7, t5
                  c.sub        s1, a4
                  xori         t2, a2, 1753
                  mulhu        s4, a3, ra
                  sub          s7, gp, gp
                  rem          t4, gp, t4
                  c.nop
                  sll          t0, gp, sp
                  c.lui        a7, 24
                  nop
                  auipc        ra, 776619
                  sltiu        gp, a2, 253
                  c.slli       gp, 5
                  c.li         s1, -1
                  c.slli       s11, 1
                  sub          s10, s7, t2
                  sra          ra, a3, s8
                  auipc        a2, 926557
                  c.addi4spn   s0, sp, 336
                  add          t4, a1, a6
                  divu         s4, s1, s5
                  nop
                  andi         s11, t0, 1236
                  div          s10, a5, s3
                  div          s4, t3, s1
                  ori          zero, s6, 1936
                  div          a6, s6, a2
                  mulhu        sp, a2, s5
                  slli         s0, gp, 23
                  c.lui        tp, 26
                  mulh         a4, a3, zero
                  div          a1, t2, s2
                  c.lui        ra, 15
                  c.andi       a5, -1
                  mulhsu       a2, t5, s6
                  c.li         s2, 4
                  c.addi16sp   sp, -16
                  c.add        t4, s6
                  slli         tp, s11, 1
                  c.slli       s8, 30
                  c.addi       s1, 24
                  c.addi16sp   sp, 32
                  lui          s8, 586477
                  c.nop
                  auipc        s11, 542745
                  nop
                  addi         a4, t2, 1968
                  and          s1, s2, s10
                  rem          t2, a7, s8
                  sra          s11, tp, s1
                  div          a4, tp, zero
                  c.addi       s1, -1
                  sltu         tp, a3, t0
                  c.addi16sp   sp, 304
                  c.srai       a4, 14
                  mulhu        gp, a4, a2
                  slti         s9, a2, 1489
                  nop
                  sltu         s3, t1, ra
                  sltu         a5, s1, s7
                  auipc        ra, 1012141
                  slt          t5, a7, zero
                  srai         a7, a7, 0
                  add          s0, a3, s9
                  c.addi4spn   a2, sp, 592
                  c.lui        tp, 5
                  slt          s1, s2, t2
                  c.or         a0, a3
                  sub          s6, a6, zero
                  sltu         gp, t5, s11
                  or           a7, t3, s3
                  div          s0, s8, a0
                  c.addi       s3, 12
                  lui          s0, 771468
                  and          a5, s6, ra
                  addi         s11, a2, 856
                  lui          t2, 466617
                  c.andi       a1, -1
                  c.or         s1, a1
                  sra          ra, sp, sp
                  ori          s10, a6, 1718
                  c.mv         tp, gp
                  c.sub        a2, a5
                  addi         s7, s0, 1135
                  div          s2, s4, a0
                  c.and        a0, s1
                  c.addi       s6, 30
                  c.addi       a7, -1
                  sltiu        t5, a1, -855
                  c.srli       a4, 3
                  srl          a2, tp, s1
                  mulhsu       s8, a3, s11
                  c.srai       a1, 7
                  divu         a7, tp, ra
                  mulh         a4, t1, t6
                  c.or         a4, s1
                  srli         s4, s2, 30
                  slt          t4, s8, a0
                  auipc        s5, 539037
                  c.andi       s0, -1
                  auipc        s4, 131211
                  xori         zero, s6, -1745
                  or           s5, t4, a1
                  xori         s3, t2, -1596
                  sll          tp, t6, a6
                  sub          a1, zero, tp
                  or           a5, a7, s8
                  slli         a4, s2, 23
                  c.addi4spn   a1, sp, 240
                  c.srai       a1, 26
                  c.srai       a0, 3
                  slt          s11, s2, a4
                  srli         a0, a5, 21
                  srli         a4, t2, 7
                  mulhsu       s2, s6, t2
                  lui          t4, 83386
                  srli         a6, t1, 10
                  slt          s2, t2, t2
                  c.slli       a5, 12
                  divu         s6, s1, s7
                  xori         t2, sp, -1114
                  xor          t4, s5, ra
                  c.srli       a2, 3
                  c.srli       a3, 30
                  c.lui        a5, 4
                  slt          a6, a1, s10
                  ori          s8, s9, -407
                  ori          s2, a0, 955
                  andi         s0, t1, 503
                  slt          s5, ra, s3
                  c.add        s1, a6
                  c.srai       a4, 19
                  ori          s5, ra, 167
                  c.and        a2, a4
                  c.and        a2, a3
                  c.or         s0, s1
                  srai         a1, a6, 18
                  c.nop
                  c.srai       a5, 25
                  or           gp, a4, s11
                  nop
                  sltiu        s10, s5, 1606
                  divu         ra, t4, a2
                  srli         s10, s11, 22
                  srli         s0, s6, 22
                  c.mv         a3, s6
                  c.mv         a5, s7
                  c.srli       a0, 2
                  remu         zero, a0, a3
                  addi         s4, tp, 1282
                  mulhsu       sp, a6, a0
                  mulh         t5, t1, t5
                  c.addi16sp   sp, 464
                  srl          a0, s6, a6
                  sra          a0, s9, s9
                  xor          a5, a1, a0
                  c.addi       a7, -1
                  div          t0, s9, tp
                  sub          s3, s0, t6
                  c.addi       a3, -1
                  c.nop
                  c.and        s1, a2
                  slti         a7, s3, 536
                  add          s5, t0, a0
                  c.nop
                  c.mv         a0, a2
                  mulhsu       a4, ra, a6
                  nop
                  slti         s8, s5, 2027
                  c.addi       s0, -1
                  nop
                  sll          s6, a5, a5
                  remu         s1, t5, a6
                  mulh         s1, s11, a2
                  div          a5, s11, t0
                  c.or         a0, a3
                  c.nop
                  sltiu        t4, zero, 1291
                  c.mv         s1, gp
                  remu         t0, s4, s3
                  add          a5, t6, a2
                  c.sub        s1, a5
                  slt          s11, s7, t0
                  c.mv         a0, s3
                  c.mv         s10, s7
                  c.xor        a5, a2
                  c.addi16sp   sp, -16
                  ori          ra, t0, 1377
                  auipc        s1, 927489
                  c.sub        a5, a1
                  c.addi       s11, 2
                  lui          s5, 272298
                  c.srli       a2, 18
                  or           s6, t5, ra
                  c.nop
                  slti         zero, a3, -209
                  c.li         a1, -1
                  mulhsu       s2, t3, s11
                  c.sub        s1, a1
                  slli         a2, a4, 14
                  auipc        sp, 609721
                  xor          a3, s9, s7
                  slti         s3, s2, -677
                  sltu         t2, zero, zero
                  div          t5, ra, s2
                  srli         t5, s9, 4
                  and          a5, a6, s3
                  sll          s10, tp, a0
                  c.mv         s1, s2
                  srl          a7, s8, s5
                  c.srli       a4, 31
                  c.lui        s4, 19
                  remu         a7, s6, t3
                  c.lui        a0, 10
                  c.or         a4, a0
                  add          t0, t1, a3
                  srl          s8, s9, s10
                  c.add        a5, s11
                  xor          t2, t3, gp
                  c.sub        a3, a5
                  srli         a6, s8, 21
                  remu         t2, s3, t3
                  c.xor        a3, a2
                  slt          s9, s4, gp
                  addi         s6, t2, -629
                  mulhu        s0, s5, s11
                  sra          gp, a5, s11
                  c.addi4spn   a1, sp, 784
                  xori         t2, s5, -163
                  divu         s11, t5, s2
                  c.addi4spn   a5, sp, 224
                  rem          t0, s0, s8
                  c.or         a0, s1
                  srl          a4, s4, s8
                  c.mv         s8, s7
                  xor          t2, a4, s7
                  c.li         s1, -1
                  divu         s3, a5, s11
                  lui          ra, 181357
                  c.xor        a3, a2
                  lui          tp, 523241
                  c.and        a3, a4
                  remu         t2, s8, zero
                  xor          ra, t4, t1
                  slti         a6, a5, 692
                  mulhu        s11, a1, s6
                  c.add        t0, s10
                  mulhsu       s3, s10, t3
                  sltu         tp, a4, a2
                  slt          s7, ra, s10
                  xori         t4, s9, 2010
                  c.srli       s0, 18
                  c.sub        a0, a4
                  c.add        gp, s6
                  or           s3, t1, a5
                  c.mv         t2, a3
                  c.xor        a4, a1
                  c.mv         s1, t0
                  sltu         t4, t1, a1
                  remu         s9, a4, s7
                  slti         a7, t5, -1151
                  c.mv         s6, sp
                  divu         s4, a0, t6
                  nop
                  c.or         a0, a2
                  c.li         sp, -1
                  ori          s4, a1, -605
                  divu         a6, s6, s10
                  c.slli       s11, 27
                  xori         a5, s5, 576
                  xor          s9, t1, t3
                  c.srai       a4, 2
                  c.mv         s11, a0
                  xor          s8, s2, s1
                  mulh         a7, s4, s2
                  c.add        a5, a4
                  c.srai       a4, 22
                  srai         a3, t1, 15
                  addi         s11, s1, -1337
                  srai         a5, s8, 6
                  slt          s3, t2, a4
                  c.or         s1, a3
                  srli         s9, s6, 6
                  c.xor        a4, a2
                  ori          sp, s4, -255
                  c.srli       a4, 1
                  c.srai       a0, 22
                  slt          s11, t5, s4
                  c.mv         s6, s3
                  auipc        a4, 470911
                  addi         s9, a6, 561
                  sltu         s8, t2, a2
                  c.andi       a5, 10
                  c.sub        a5, a4
                  c.srai       a3, 22
                  add          s10, t0, a1
                  auipc        a6, 1011516
                  nop
                  mulh         a1, s9, s0
                  or           a0, sp, s7
                  c.or         s0, a3
                  c.mv         s6, t6
                  mulhu        s0, t2, a7
                  addi         s7, a5, 504
                  srai         s0, a2, 16
                  remu         t4, t3, a4
                  c.andi       a2, -1
                  rem          a1, sp, s8
                  nop
                  c.and        a3, a4
                  slli         a5, s10, 28
                  c.xor        a2, a0
                  c.andi       s1, -1
                  srl          s9, a6, s2
                  c.lui        s4, 22
                  div          tp, t3, s11
                  srli         s8, t5, 3
                  c.lui        a1, 31
                  and          s3, s7, s7
                  slti         a0, a2, -241
                  srli         s9, s2, 23
                  auipc        t5, 505124
                  mulh         s6, a4, s5
                  c.or         a5, s1
                  sll          s10, t4, s3
                  lui          ra, 35239
                  nop
                  or           sp, zero, t3
                  or           s7, s8, s6
                  lui          s6, 551693
                  ori          a5, s3, 794
                  sltu         tp, a2, t1
                  sll          s3, a1, t0
                  slti         a0, s10, 879
                  xor          s7, s7, t6
                  sltu         s10, a0, sp
                  lui          a4, 230265
                  nop
                  ori          s4, a6, 581
                  c.nop
                  c.mv         t5, ra
                  sub          s5, s1, sp
                  or           s8, a5, s11
                  c.srli       a3, 6
                  c.slli       t5, 16
                  rem          ra, s7, t0
                  mulhu        s9, s4, a3
                  nop
                  c.addi4spn   a0, sp, 80
                  c.srai       s1, 26
                  c.slli       s0, 25
                  mulh         a2, sp, a6
                  slti         a3, s7, 797
                  slt          s7, t1, t3
                  divu         tp, s1, s7
                  add          a6, s0, s9
                  mulhsu       gp, a3, a2
                  c.addi       a0, 5
                  c.add        a1, s4
                  sra          t0, a1, s1
                  c.srai       a5, 24
                  c.addi       s3, -1
                  andi         s0, s11, -570
                  auipc        s2, 990422
                  sltu         sp, s9, a0
                  mulhu        s5, t6, a7
                  rem          s2, s5, s8
                  c.and        a0, a3
                  sub          s9, t1, s9
                  or           tp, a2, s7
                  remu         a1, s2, s9
                  xori         s6, s0, 0
                  lui          a0, 143663
                  xor          s7, a0, s0
                  xor          a1, ra, t3
                  add          zero, zero, ra
                  c.srai       a3, 19
                  sltu         s3, tp, t1
                  nop
                  add          s4, a1, a0
                  ori          s2, s6, 1949
                  c.mv         s6, t3
                  or           a3, t1, s7
                  mulh         t4, s7, zero
                  remu         t4, t3, t0
                  sltu         s10, a0, a7
                  slt          s6, s4, s2
                  sltu         t0, t5, a2
                  add          s2, s7, a0
                  auipc        gp, 597854
                  c.lui        s9, 28
                  sra          a5, tp, tp
                  auipc        s1, 94643
                  c.lui        s4, 22
                  remu         t4, t4, gp
                  srli         s5, s2, 18
                  c.nop
                  nop
                  c.addi4spn   s0, sp, 272
                  sltu         tp, a1, s11
                  sub          s6, s8, s0
                  sltu         t0, a4, s4
                  slli         s5, a1, 30
                  c.addi16sp   sp, -16
                  and          a0, a3, s5
                  c.and        a0, a2
                  c.or         s1, s0
                  c.srai       s0, 15
                  addi         s5, sp, 218
                  div          s8, t3, t4
                  c.mv         a1, t3
                  srli         s5, t0, 7
                  c.addi16sp   sp, 224
                  sll          a3, a1, s9
                  sltiu        tp, t2, 2012
                  sra          s10, t6, zero
                  mulh         s2, zero, gp
                  xor          s4, s11, t2
                  sra          t2, t5, t2
                  srai         a5, a1, 31
                  mulhu        a4, s11, a4
                  remu         s3, tp, s6
                  slli         s1, a0, 26
                  c.add        a4, t6
                  c.and        a3, a5
                  c.xor        a1, a1
                  div          sp, t3, zero
                  c.srai       a0, 16
                  mul          a0, a0, s2
                  c.or         a0, a1
                  add          s8, s0, ra
                  div          t4, t3, ra
                  sll          a7, t0, s0
                  c.sub        s1, a0
                  add          s5, a0, s3
                  or           tp, s11, t3
                  remu         a3, s3, a2
                  xori         s4, a2, 1193
                  c.li         a3, -1
                  sltu         s7, s0, a5
                  c.addi16sp   sp, 368
                  c.add        s8, gp
                  auipc        t5, 977026
                  c.nop
                  mulhsu       s11, s4, s2
                  c.or         s1, a5
                  slt          s3, s4, s3
                  srai         zero, t3, 7
                  c.lui        s5, 24
                  c.xor        a0, s0
                  sll          s0, gp, t0
                  c.addi4spn   a3, sp, 96
                  c.addi4spn   a0, sp, 176
                  andi         a2, s11, -18
                  slti         a7, t4, -1852
                  c.addi16sp   sp, 192
                  c.xor        a0, s1
                  add          s6, s6, a7
                  c.li         a4, 5
                  srli         s6, ra, 14
                  mul          a1, s0, t0
                  slti         a7, s3, 209
                  mulhu        s5, t3, a4
                  mulh         t5, a6, a1
                  c.xor        a0, a4
                  remu         a0, a2, s6
                  srl          ra, s2, s1
                  mulhu        a2, a2, t4
                  andi         a2, s8, -1307
                  mulh         t2, t5, t1
                  andi         t5, a1, 632
                  sltu         zero, ra, gp
                  srai         a0, s11, 3
                  c.sub        a2, a3
                  div          sp, a5, t1
                  mulh         a7, a6, a6
                  c.and        a5, a4
                  c.srli       a1, 2
                  nop
                  ori          a6, a2, 1488
                  mulhu        a6, a4, s4
                  sub          zero, t5, t4
                  c.addi4spn   a4, sp, 272
                  sra          s3, s2, s2
                  sra          s9, t2, s4
                  sra          s4, tp, tp
                  remu         zero, tp, t2
                  c.mv         a1, s9
                  mulhsu       t5, s7, t0
                  c.mv         t2, t2
                  sra          s2, t3, s1
                  divu         a3, s10, s10
                  c.li         t0, 9
                  divu         s6, s11, zero
                  sltiu        s5, gp, 569
                  ori          a4, a6, -1907
                  nop
                  mulhu        s6, s5, a2
                  c.addi       s11, -1
                  div          t4, s7, a7
                  rem          sp, t6, a1
                  c.li         tp, 12
                  lui          a4, 661953
                  lui          a6, 193073
                  c.addi4spn   a3, sp, 400
                  sltu         t5, zero, s0
                  mul          a0, s4, ra
                  xor          a1, a7, t5
                  and          a4, a0, t4
                  c.xor        a4, a3
                  c.add        sp, a1
                  c.srai       a2, 3
                  c.addi4spn   a2, sp, 240
                  c.xor        s1, a0
                  sub          t4, ra, s7
                  sub          ra, t6, gp
                  mulhu        s8, s2, a2
                  xori         s10, a1, -354
                  sra          s7, t3, a1
                  c.mv         t5, gp
                  c.sub        a4, a1
                  c.lui        s7, 19
                  c.addi       a5, -1
                  sltu         s5, sp, s3
                  c.srai       a3, 8
                  div          s9, s5, s4
                  addi         s4, ra, -738
                  sub          s2, zero, s4
                  lui          t5, 375357
                  ori          s2, s8, 683
                  sub          t4, t3, a6
                  c.addi4spn   a2, sp, 864
                  auipc        tp, 947210
                  sll          s1, s6, s6
                  auipc        t2, 634556
                  c.or         a5, a2
                  c.add        a0, a6
                  ori          t0, s6, 2019
                  mulh         t4, a7, a6
                  srl          t2, s1, t0
                  lui          gp, 689219
                  c.lui        t2, 22
                  sub          t0, s2, t5
                  sra          a1, s9, a5
                  slli         a1, a7, 12
                  or           t5, t4, s5
                  c.mv         s11, a1
                  rem          s2, s2, s6
                  sub          s5, s7, s10
                  sll          s5, s8, t4
                  c.addi4spn   a0, sp, 720
                  srl          s6, a2, t1
                  srli         a4, t4, 24
                  xor          a4, s11, t2
                  sll          t4, a7, s7
                  c.or         a0, s1
                  c.addi       t2, 13
                  andi         zero, t3, 391
                  c.srai       a4, 29
                  c.or         a4, a2
                  slli         s9, a2, 25
                  divu         a6, s8, a4
                  srai         s10, s10, 20
                  and          t4, zero, s4
                  addi         gp, s2, 860
                  slti         s7, s7, -1271
                  or           s9, ra, s3
                  remu         s8, a7, s7
                  sra          t0, a4, a5
                  mulh         a0, t1, s7
                  c.add        s11, a5
                  lui          a6, 59140
                  c.slli       t4, 7
                  c.slli       a1, 21
                  c.sub        s0, a5
                  mulhsu       a1, s4, s5
                  div          a4, zero, s8
                  srli         a2, s1, 1
                  c.mv         a2, t1
                  andi         a5, a3, -1762
                  div          t0, s11, s2
                  auipc        s2, 717327
                  c.mv         a5, s10
                  c.addi4spn   a5, sp, 800
                  c.nop
                  mulhsu       s7, s4, tp
                  ori          a0, a3, 765
                  rem          s10, s11, s1
                  auipc        s5, 948769
                  sltiu        ra, a0, 155
                  rem          s2, ra, s2
                  nop
                  c.andi       s0, -1
                  divu         t5, sp, tp
                  mulhu        s8, s4, s5
                  sub          s5, t1, t0
                  ori          a7, t6, 1997
                  rem          gp, s1, a2
                  c.lui        s11, 25
                  srai         s11, s1, 12
                  andi         a2, s9, 1368
                  slti         a6, s4, -246
                  and          s7, a2, a3
                  slti         a3, a6, 1046
                  auipc        s6, 240776
                  c.slli       a2, 7
                  c.addi4spn   a3, sp, 176
                  ori          a5, a2, 1775
                  div          zero, sp, t2
                  mulh         s11, s2, s2
                  sra          a4, t6, s11
                  c.addi       gp, -1
                  divu         a6, t5, ra
                  mulh         s3, t2, s10
                  div          s0, t0, gp
                  nop
                  div          gp, a2, s5
                  c.lui        s9, 2
                  div          s8, a6, t6
                  slli         a0, t1, 20
                  c.mv         s2, s5
                  remu         a7, t4, s0
                  c.addi4spn   a5, sp, 240
                  and          s4, t3, s4
                  c.sub        a0, a3
                  addi         s1, a2, 1442
                  srl          s5, s5, s6
                  nop
                  nop
                  srl          sp, a7, t0
                  c.andi       a3, 12
                  addi         a3, t1, -597
                  nop
                  divu         t0, a7, a5
                  c.slli       s3, 16
                  andi         a1, gp, -792
                  c.mv         t2, t0
                  sltiu        sp, a7, -1603
                  srai         s5, s8, 22
                  srli         s9, s7, 17
                  slli         a2, zero, 25
                  c.srli       a4, 25
                  c.nop
                  divu         a4, s6, sp
                  li           s9, 0xffffffff #start riscv_int_numeric_corner_stream_6
                  li           s1, 0x80000000
                  li           s10, 0x213dbf91
                  li           s7, 0x0
                  li           a2, 0x8f966d7a
                  li           s8, 0x992c7785
                  li           gp, 0xffffffff
                  li           a0, 0x80000000
                  li           ra, 0xcb47e861
                  li           a7, 0xffffffff
                  add          a2, s9, a2
                  lui          a0, 111235
                  mulhsu       gp, s8, s7
                  mulhsu       a0, a2, a0
                  rem          a7, s7, s10
                  rem          a0, gp, s8
                  remu         a7, a7, a7
                  rem          ra, s8, s1
                  mulh         a2, a7, s7
                  divu         a2, s8, a7
                  mul          gp, s7, s1
                  sub          s8, ra, a0
                  auipc        s7, 398341
                  addi         a7, s8, 1021
                  sub          a2, s10, s7
                  mulh         a7, s8, s1
                  mulh         s1, s9, s10
                  lui          ra, 373487
                  mulhsu       s1, s1, gp
                  mul          a2, ra, a2 #end riscv_int_numeric_corner_stream_6
                  c.nop
                  slti         a7, a6, -637
                  and          a0, t4, a3
                  c.li         s6, -1
                  c.addi4spn   a1, sp, 992
                  c.mv         t5, s11
                  c.addi       s6, -1
                  srai         a6, s4, 25
                  c.and        s0, a1
                  c.add        a2, a2
                  div          t4, t4, s11
                  c.slli       s1, 21
                  sltiu        t4, zero, -1955
                  srl          s8, s0, s4
                  c.nop
                  slli         t2, s9, 3
                  remu         gp, a4, t0
                  mulhu        s0, a0, s0
                  mul          a5, a7, s5
                  nop
                  sltu         a6, s7, gp
                  c.addi4spn   s0, sp, 144
                  ori          a2, s11, -155
                  and          tp, t2, s10
                  sub          s0, a0, t4
                  c.sub        a2, a4
                  c.mv         s9, t0
                  or           s11, s11, a4
                  sltiu        a4, t4, 1310
                  rem          zero, t1, s11
                  srli         ra, tp, 1
                  auipc        t0, 218911
                  c.andi       a4, 19
                  srli         a0, s11, 18
                  c.lui        a5, 25
                  c.li         s4, 9
                  c.slli       gp, 9
                  auipc        s3, 237116
                  c.addi4spn   a4, sp, 752
                  c.addi16sp   sp, 496
                  auipc        a6, 113626
                  mulhsu       s5, t1, t0
                  slti         a7, s0, -1963
                  div          s7, t0, ra
                  c.nop
                  c.xor        a4, a4
                  or           s6, t3, s2
                  sltiu        t2, s11, 558
                  srli         s9, a7, 22
                  c.add        a4, t6
                  mulhsu       t0, t4, s9
                  c.srai       s0, 25
                  c.and        a2, a4
                  c.andi       a2, 26
                  c.srli       a0, 26
                  srai         s0, a7, 8
                  slti         t4, t4, 1021
                  c.addi16sp   sp, -16
                  ori          a2, a3, 1480
                  div          s2, s5, a0
                  addi         tp, t5, -360
                  c.nop
                  c.andi       a0, 15
                  c.srai       a5, 23
                  mulh         tp, ra, gp
                  srl          a3, zero, s6
                  mulh         s6, t4, gp
                  auipc        a4, 809982
                  xor          t4, a7, a4
                  lui          a1, 217002
                  c.li         s10, -1
                  c.nop
                  slli         s9, a1, 16
                  mulhu        zero, a4, s2
                  c.li         s9, -1
                  sltu         s6, zero, ra
                  c.srai       s1, 23
                  sll          gp, t4, a4
                  c.li         a3, 20
                  c.addi4spn   s1, sp, 816
                  c.nop
                  slt          t5, s8, s0
                  mul          t2, s5, s9
                  xor          gp, t0, s4
                  auipc        t5, 426228
                  sltiu        s11, s0, -1736
                  or           ra, s2, t2
                  c.srai       a1, 31
                  c.srli       s0, 8
                  addi         s4, ra, 1728
                  c.srai       s1, 15
                  c.addi       a5, -1
                  or           t0, a2, s2
                  c.xor        s1, a5
                  mulhu        a2, tp, a6
                  c.srli       a3, 1
                  c.nop
                  srli         a6, t5, 3
                  or           sp, gp, a7
                  sra          ra, s6, s9
                  ori          s8, s11, 1816
                  c.andi       a5, -1
                  mulhu        s8, a6, t4
                  mul          a7, a7, a7
                  c.addi16sp   sp, 432
                  slt          a2, s9, sp
                  add          s1, t1, s4
                  c.mv         a3, s7
                  mulhu        ra, t4, a6
                  sub          t4, s11, t2
                  slt          s1, s11, t5
                  slti         sp, t4, 77
                  c.addi       s9, 2
                  add          sp, s3, t6
                  ori          a0, s4, 891
                  c.andi       a5, 30
                  slti         a7, t3, -1856
                  srl          s10, ra, a3
                  slli         s4, s1, 18
                  c.andi       a4, -1
                  mulhsu       s4, t4, t3
                  mulhsu       a7, s7, a4
                  lui          s6, 897625
                  c.add        a1, t2
                  c.srli       a2, 20
                  addi         zero, t5, -1607
                  sub          a6, s5, s6
                  c.and        a0, s0
                  ori          gp, ra, 616
                  divu         s0, a4, t6
                  c.sub        a5, s1
                  sra          tp, gp, s1
                  divu         a3, t6, a4
                  c.or         a0, a5
                  c.addi4spn   s1, sp, 464
                  lui          tp, 588961
                  slti         a6, ra, -701
                  rem          sp, a5, t6
                  slti         a4, a3, 1205
                  nop
                  srai         s8, gp, 8
                  div          s10, t5, a3
                  and          t2, a1, a7
                  c.and        s0, s0
                  c.or         a5, s0
                  or           s11, s11, a4
                  and          ra, s4, t1
                  c.srai       a0, 30
                  mulh         a3, s8, a6
                  mulhu        s6, zero, tp
                  c.addi4spn   s0, sp, 864
                  add          s10, s5, a6
                  slti         s3, a5, 1833
                  divu         s5, s5, s5
                  mul          t2, s1, a3
                  c.srli       s1, 1
                  ori          s7, s11, -1101
                  srli         s10, t2, 29
                  c.add        t2, s10
                  c.lui        a7, 3
                  srai         s2, a2, 21
                  c.lui        ra, 2
                  li           a7, 0xb055e4eb #start riscv_int_numeric_corner_stream_9
                  li           t5, 0x61b20898
                  li           t2, 0x80000000
                  li           s5, 0x80000000
                  li           s6, 0x80000000
                  li           s11, 0xffffffff
                  li           a4, 0x0
                  li           s9, 0x80000000
                  li           s4, 0x80000000
                  li           s3, 0x80000000
                  mulhsu       s9, a4, s9
                  add          s4, s3, s6
                  divu         s11, a7, a7
                  rem          a7, s11, a4
                  add          s11, s5, t5
                  divu         t2, s9, s5
                  mulhu        t2, s3, s6
                  mulhu        s11, s6, s11
                  divu         s9, a4, s3
                  nop
                  div          a4, s5, t5
                  mulh         s5, t5, a7
                  div          s11, t2, a7
                  rem          s11, s5, s3
                  sub          a7, s9, s6
                  remu         s3, s6, a7 #end riscv_int_numeric_corner_stream_9
                  sub          a3, zero, t3
                  and          s11, a5, a6
                  remu         t5, a4, a4
                  c.sub        a5, a5
                  c.nop
                  c.srli       s1, 12
                  sub          a3, a1, a4
                  nop
                  mulhu        s0, tp, t6
                  c.xor        a4, a3
                  c.and        a2, a5
                  c.li         tp, -1
                  c.srli       s1, 4
                  or           t2, gp, ra
                  c.lui        s11, 15
                  xori         a1, a1, -1856
                  nop
                  lui          t2, 227706
                  addi         a5, a3, 921
                  sub          s2, a0, s7
                  andi         a1, t0, 1467
                  div          s3, s6, s5
                  c.slli       s4, 31
                  c.and        a4, a4
                  lui          t4, 668553
                  andi         s2, s8, 269
                  auipc        s10, 895556
                  c.srli       a2, 21
                  c.lui        tp, 9
                  c.addi       a7, 31
                  mulh         sp, t6, s4
                  slti         sp, s1, 1083
                  mul          a5, s2, t5
                  divu         s5, t1, t2
                  mul          zero, t2, a5
                  sub          s3, t0, s6
                  mulhsu       t0, t2, s4
                  c.li         t5, 17
                  c.mv         s4, s8
                  nop
                  c.xor        s0, s1
                  c.lui        s6, 23
                  c.andi       a0, 19
                  slt          s4, s4, t6
                  c.mv         s9, a2
                  sub          a4, s6, t6
                  c.addi16sp   sp, -16
                  auipc        a3, 866766
                  c.sub        a3, s1
                  c.and        a3, a4
                  auipc        a5, 169879
                  c.add        s3, s5
                  c.andi       a0, 8
                  div          s7, a3, tp
                  ori          s9, t0, -679
                  c.srli       a4, 20
                  mulhsu       s3, a5, t4
                  c.addi4spn   a1, sp, 32
                  xori         a4, s8, -1334
                  rem          a4, gp, s1
                  remu         sp, s5, ra
                  c.nop
                  remu         a4, s6, a1
                  or           s8, a5, t2
                  lui          s11, 1033655
                  slt          a2, s4, s3
                  addi         a6, t0, 1055
                  srl          gp, a4, s6
                  add          a5, a4, tp
                  c.or         a0, a0
                  srl          s4, t4, a3
                  c.andi       a1, 8
                  c.slli       a5, 8
                  xor          s6, a1, t0
                  mulhsu       a5, a6, s5
                  addi         t4, sp, 973
                  c.srli       a1, 6
                  slli         s9, t0, 27
                  c.srli       a5, 12
                  c.addi4spn   a4, sp, 560
                  c.add        s4, s7
                  remu         tp, s1, s6
                  c.addi16sp   sp, -16
                  c.addi4spn   a0, sp, 80
                  srai         s1, s5, 1
                  addi         s5, zero, -1740
                  c.addi       s9, 19
                  c.xor        s1, a1
                  srai         gp, a3, 24
                  rem          s4, a4, t0
                  slli         s6, sp, 6
                  c.addi       s0, -1
                  c.andi       a4, -1
                  c.xor        a3, s0
                  srai         t0, sp, 15
                  srai         a7, ra, 5
                  nop
                  sltu         s1, s4, s5
                  slti         s8, a7, -2031
                  rem          s4, a6, a2
                  sltu         zero, gp, t5
                  c.andi       a1, -1
                  or           t0, s2, t4
                  srli         s2, a7, 18
                  c.addi16sp   sp, -16
                  sra          t2, s4, t5
                  c.addi       a0, 6
                  c.li         a2, 12
                  sltiu        t5, a3, -838
                  c.xor        a1, a1
                  ori          s9, zero, -86
                  nop
                  auipc        a4, 566839
                  c.addi       gp, 20
                  rem          t5, s10, a6
                  c.nop
                  sltiu        s9, a4, 808
                  c.srli       s1, 28
                  xori         a6, a4, -1186
                  c.addi       s0, -1
                  divu         tp, a6, s9
                  divu         a1, t0, zero
                  sll          s5, s7, a3
                  c.srli       a4, 30
                  mulhu        t2, s5, s7
                  lui          a3, 724831
                  c.addi4spn   a1, sp, 16
                  rem          s0, a7, a0
                  c.nop
                  rem          t5, gp, s0
                  add          s1, a1, tp
                  sub          s5, zero, t0
                  slt          t2, s11, s11
                  mul          a0, t5, a7
                  andi         s3, s8, 2019
                  mulhu        s2, t5, sp
                  c.srai       s0, 31
                  srli         a0, s0, 19
                  c.srai       a3, 10
                  xor          s10, s6, s0
                  addi         s2, a1, 2040
                  c.xor        a1, a4
                  ori          s0, s1, -514
                  mulh         a7, a0, a6
                  slt          sp, a0, t1
                  mul          s4, a6, s2
                  sll          t5, a3, t5
                  mulhsu       t5, s9, s5
                  add          a0, a3, s6
                  c.addi16sp   sp, -16
                  c.slli       tp, 23
                  srai         t2, a7, 9
                  lui          s3, 268226
                  andi         ra, s11, 245
                  c.addi16sp   sp, 48
                  sll          s4, s8, t0
                  auipc        a1, 469025
                  sra          a2, s1, ra
                  srai         a7, zero, 19
                  c.srli       a3, 2
                  ori          a4, t0, -1142
                  c.addi4spn   a3, sp, 784
                  c.xor        a4, a3
                  c.addi       s0, 20
                  slti         gp, s2, 245
                  remu         a5, s0, t5
                  c.lui        ra, 30
                  andi         gp, s7, 297
                  c.and        s0, a1
                  mul          s4, a3, gp
                  sltiu        a5, ra, -1120
                  sltiu        t4, a2, 222
                  c.xor        a5, a0
                  xor          a7, s3, t2
                  xori         a3, s1, -527
                  sra          gp, s3, s11
                  lui          s1, 194532
                  add          s1, a0, t0
                  sltiu        ra, s3, 1705
                  c.mv         s10, t5
                  c.addi       s8, -1
                  rem          tp, s3, a3
                  addi         s1, t1, -1702
                  auipc        s6, 860823
                  rem          zero, t5, a7
                  sltiu        a7, t6, 785
                  c.li         s2, -1
                  mulhsu       gp, a1, t1
                  c.lui        s8, 20
                  add          a5, s10, zero
                  xori         s11, a1, 1251
                  c.nop
                  c.andi       s0, -1
                  c.addi       s9, -1
                  and          t0, a7, s1
                  c.srli       s1, 8
                  andi         t4, s2, 1360
                  c.lui        gp, 25
                  c.addi       a2, 14
                  c.li         a6, 19
                  lui          a7, 976287
                  add          s7, t0, s8
                  rem          gp, s4, t0
                  srl          a1, s3, s9
                  mul          t5, gp, s8
                  nop
                  slli         tp, s3, 31
                  slti         tp, s7, 1803
                  c.mv         a1, a6
                  c.addi16sp   sp, 80
                  c.slli       s2, 9
                  c.srai       s0, 31
                  sltiu        a2, gp, 1704
                  slt          s11, a7, a6
                  auipc        t4, 212792
                  c.nop
                  ori          s11, t5, -780
                  ori          gp, s4, 813
                  mul          tp, a1, a4
                  c.mv         s9, s4
                  auipc        s6, 40746
                  c.lui        s7, 9
                  add          t4, s8, s11
                  auipc        s10, 131206
                  ori          t4, s2, 405
                  mulhsu       s9, s7, a5
                  sub          t5, s6, s10
                  sub          s10, t0, s5
                  addi         a7, a0, 195
                  c.addi       a1, -1
                  c.nop
                  srli         s2, ra, 28
                  mulhsu       a6, s5, a2
                  div          s7, sp, t6
                  addi         t0, a6, 717
                  and          s7, t0, s8
                  c.lui        s0, 28
                  divu         s3, t2, t5
                  mulhsu       s11, s8, s5
                  c.lui        a6, 20
                  nop
                  and          s5, gp, s5
                  andi         s11, s2, 102
                  srli         s4, a1, 23
                  divu         t4, a2, t2
                  c.xor        a4, a2
                  slli         s0, ra, 17
                  and          s4, t4, s8
                  c.srai       a3, 13
                  andi         zero, s8, -375
                  c.srli       a0, 28
                  rem          s2, t1, t4
                  ori          a5, s9, 1334
                  sll          a4, s0, t4
                  rem          s4, s6, s3
                  srl          s8, t5, a6
                  sltu         s7, s1, s3
                  c.srai       a1, 15
                  c.or         a0, a4
                  xori         ra, ra, 1430
                  xori         s0, s9, 1521
                  ori          a5, a1, 1623
                  c.nop
                  srai         a7, sp, 3
                  or           s9, t5, s5
                  addi         s3, s9, -1617
                  c.li         s6, -1
                  c.addi       a6, 6
                  slli         s3, s5, 10
                  srli         s2, t3, 28
                  and          s7, s9, s7
                  c.xor        s1, a0
                  c.sub        s1, s0
                  sltiu        s10, s7, -1218
                  srl          t5, t0, ra
                  and          s4, tp, s7
                  remu         s6, gp, zero
                  auipc        a4, 811113
                  andi         s11, a3, -1727
                  nop
                  div          t4, t0, a0
                  xor          t4, zero, s0
                  sub          a6, a7, s3
                  mulhsu       s9, s2, tp
                  and          s1, ra, ra
                  sll          s2, a2, t2
                  sltu         a5, sp, s3
                  srai         a6, s3, 16
                  add          gp, t1, a7
                  c.xor        a5, a1
                  mul          a1, a5, a5
                  c.xor        s0, a1
                  remu         zero, a3, ra
                  addi         sp, a5, -224
                  c.li         a7, -1
                  sra          tp, t1, s9
                  c.xor        a5, s0
                  rem          zero, s3, zero
                  c.add        ra, a1
                  sra          gp, t6, s5
                  nop
                  c.addi16sp   sp, -16
                  add          s9, t3, a1
                  rem          s4, a1, a6
                  c.lui        s1, 20
                  c.addi4spn   a1, sp, 560
                  c.nop
                  remu         a7, s6, zero
                  c.sub        a0, s0
                  c.or         s1, a0
                  mulh         t5, zero, a2
                  ori          a3, zero, 297
                  srai         s4, gp, 3
                  rem          t4, ra, t0
                  c.addi4spn   s0, sp, 144
                  lui          t5, 694304
                  div          a2, sp, s3
                  slti         s10, t2, -1681
                  auipc        t4, 542623
                  c.xor        s1, a0
                  nop
                  c.addi4spn   a5, sp, 736
                  or           s8, a0, s8
                  c.addi16sp   sp, 80
                  c.slli       a1, 29
                  divu         s7, a6, tp
                  srai         a2, s8, 4
                  c.addi16sp   sp, -16
                  xori         sp, t5, 1305
                  c.srli       a0, 25
                  xori         s11, t6, 86
                  mulhsu       s9, sp, s9
                  andi         s8, ra, -640
                  xor          a6, s3, t5
                  sltu         a7, a3, a0
                  and          s3, a5, s10
                  ori          s2, t3, -1519
                  slli         a0, s10, 9
                  c.add        s9, s11
                  nop
                  rem          t0, a1, t2
                  mulhsu       gp, s8, s10
                  c.and        a1, a5
                  srli         s9, t2, 26
                  mulhu        ra, s10, s7
                  c.andi       a5, -1
                  srl          s9, t6, t2
                  remu         s5, a2, s7
                  slli         s2, t1, 22
                  c.srli       a0, 17
                  remu         s1, s5, a7
                  mul          s3, s11, a0
                  rem          t2, a4, zero
                  divu         ra, t5, s5
                  div          a3, s6, a1
                  ori          s3, a2, -1453
                  c.andi       a4, -1
                  c.li         s10, -1
                  srl          a3, a1, a2
                  andi         a2, t3, -2005
                  sltu         a0, zero, s6
                  c.and        s1, a5
                  srai         gp, a4, 27
                  c.nop
                  li           s8, 0x80000000 #start riscv_int_numeric_corner_stream_18
                  li           a6, 0xffffffff
                  li           s0, 0x3f9b447e
                  li           s2, 0x80000000
                  li           s10, 0x80000000
                  li           s1, 0x80000000
                  li           tp, 0x591e6497
                  li           s7, 0x0
                  li           a1, 0xffffffff
                  li           a4, 0xffffffff
                  mulhu        tp, a6, s7
                  add          s7, s1, s1
                  mulhu        s1, a6, s0
                  rem          s1, s1, s7
                  divu         s2, a4, s1
                  mulhsu       s8, s0, s1
                  div          s8, s7, s7
                  lui          s7, 861759
                  nop
                  sub          s0, s1, a6
                  div          s7, s0, tp
                  add          s2, s0, s10
                  remu         s7, tp, a1
                  div          s0, s7, a6
                  add          s7, tp, a4
                  mulhu        s8, s7, a1
                  mulh         s8, s2, s10
                  remu         s10, s1, s7 #end riscv_int_numeric_corner_stream_18
                  slli         s4, t0, 9
                  div          s11, s6, t6
                  auipc        a2, 425217
                  sltu         a3, sp, t5
                  c.or         a0, s1
                  mul          s7, ra, t1
                  slli         a7, a0, 7
                  and          ra, s5, s5
                  div          s7, t5, a5
                  mul          gp, a4, a6
                  mulhu        t5, s6, a3
                  nop
                  c.addi16sp   sp, 16
                  xori         s10, a7, 1677
                  srai         s5, t1, 21
                  addi         t4, s5, -1302
                  c.srli       s0, 27
                  sltu         a3, ra, t5
                  remu         s0, ra, s10
                  c.li         s9, 8
                  or           gp, a2, s9
                  remu         tp, s9, s4
                  sltu         t4, s11, s6
                  c.and        a1, s0
                  c.lui        a4, 21
                  xori         s10, a2, 1854
                  divu         s4, a4, s9
                  and          gp, s11, a5
                  ori          s9, s3, 664
                  c.andi       a3, -1
                  sll          a4, s0, t2
                  c.lui        s1, 1
                  c.srli       s0, 23
                  c.addi16sp   sp, 400
                  c.xor        a3, a1
                  slti         s4, s11, -69
                  c.and        a5, a4
                  mulhu        zero, ra, a0
                  andi         s10, t3, -1544
                  c.or         a3, a2
                  c.addi16sp   sp, -16
                  mulhu        s2, t6, t1
                  rem          s4, s10, s5
                  mulhu        a2, t1, t2
                  remu         s7, t1, s6
                  and          a7, s6, s4
                  sltiu        zero, t1, -1922
                  c.li         t2, -1
                  sub          gp, s7, t0
                  andi         t5, a0, -1609
                  c.xor        a1, a3
                  divu         tp, ra, a3
                  mulh         t4, t5, s5
                  c.addi       a6, -1
                  nop
                  xori         a4, a0, 263
                  auipc        zero, 167475
                  mul          s6, t3, s6
                  c.or         s0, a5
                  slt          s0, t2, t1
                  c.addi16sp   sp, 256
                  rem          tp, sp, s1
                  c.sub        a1, a2
                  srli         t4, s8, 23
                  ori          s9, a7, 1861
                  or           s10, t2, tp
                  slti         s0, gp, -505
                  c.nop
                  sub          t0, gp, a7
                  divu         sp, a4, t1
                  c.sub        a1, a1
                  andi         s6, tp, -1363
                  ori          a4, t4, -849
                  c.or         s0, a4
                  srli         a4, s7, 23
                  c.nop
                  sll          tp, s8, a0
                  sll          gp, ra, a6
                  c.srai       s0, 28
                  c.srai       a1, 19
                  and          ra, s6, a7
                  c.xor        a3, s1
                  sltiu        s8, a1, -964
                  c.xor        s1, a4
                  mulhu        a7, t3, s10
                  srai         s6, s11, 10
                  addi         zero, zero, -1396
                  c.nop
                  lui          s11, 901648
                  divu         ra, gp, s8
                  or           s4, t6, t5
                  andi         t2, s2, -838
                  ori          a2, s10, 1866
                  srli         s1, t3, 18
                  slti         a6, t2, -1221
                  add          s3, s3, s9
                  c.mv         t5, s5
                  c.xor        a2, a0
                  addi         a7, t4, -1142
                  nop
                  c.lui        tp, 4
                  c.add        a7, t5
                  srli         a6, sp, 14
                  andi         gp, gp, -313
                  mulh         a2, s1, a5
                  mulhu        a3, a5, t6
                  sub          a3, a4, a4
                  addi         s8, s5, 560
                  add          s11, a3, zero
                  slti         ra, a2, -1668
                  srl          s0, tp, sp
                  and          t5, s6, a6
                  c.srli       s0, 31
                  c.mv         t5, t4
                  mulhsu       t5, a4, s5
                  c.nop
                  andi         gp, zero, 434
                  c.slli       s4, 2
                  slt          t4, s6, t0
                  xori         t5, s7, 1944
                  rem          gp, s4, t1
                  c.slli       a7, 2
                  c.srai       s1, 4
                  xori         zero, sp, 251
                  c.or         a1, a4
                  addi         s8, s7, 1517
                  ori          s2, s6, -373
                  c.add        s7, s5
                  sra          s1, a0, a5
                  srl          t0, t5, t2
                  c.add        s6, ra
                  c.nop
                  srai         a0, s0, 25
                  c.slli       t0, 22
                  rem          t5, sp, s8
                  sra          s6, s11, t2
                  c.lui        s2, 10
                  add          gp, t5, s11
                  c.slli       s6, 3
                  c.addi16sp   sp, -16
                  sll          a6, s1, a5
                  slt          s6, t6, s6
                  divu         s9, zero, s10
                  auipc        a2, 877891
                  c.mv         a1, gp
                  auipc        s5, 652439
                  c.add        a0, t4
                  c.nop
                  c.add        t4, s5
                  xori         a1, a3, -416
                  or           s11, s7, a5
                  c.srli       a3, 10
                  xor          s9, a7, s8
                  sll          s5, a1, s9
                  sltiu        s9, s0, -979
                  lui          gp, 268131
                  mulh         zero, t0, a7
                  ori          s1, a1, 461
                  ori          ra, s11, -1461
                  lui          s6, 470351
                  sltu         s10, t0, a5
                  c.srai       a1, 17
                  andi         s1, zero, -418
                  c.slli       a2, 31
                  mul          s5, a6, a0
                  ori          tp, t4, -1100
                  srli         a5, tp, 18
                  sra          ra, s9, s4
                  sll          t5, s9, a0
                  c.sub        a5, a2
                  c.sub        a4, a3
                  mulh         t0, s7, t2
                  sltu         a2, t3, t6
                  sra          s8, t4, a7
                  addi         s0, t1, 1526
                  addi         sp, t3, -640
                  sltu         zero, s4, a6
                  c.addi4spn   a2, sp, 832
                  add          a4, ra, t3
                  sra          a1, s5, a0
                  mulh         a3, gp, t3
                  srli         s3, s1, 8
                  c.lui        s8, 1
                  srli         a4, a5, 14
                  c.sub        a0, a1
                  addi         s9, a6, 1524
                  lui          s9, 837428
                  divu         s1, tp, t3
                  xor          t2, s2, a1
                  c.srli       a3, 12
                  c.xor        a4, a1
                  c.lui        t0, 19
                  c.andi       a5, -1
                  c.nop
                  nop
                  xori         a6, t4, 31
                  srai         t5, t2, 29
                  mul          a4, t2, s1
                  nop
                  lui          s0, 640609
                  srl          s4, a5, s3
                  c.lui        a0, 13
                  c.addi       t0, -1
                  slti         t0, s2, -448
                  c.or         a3, a5
                  and          t4, a1, t3
                  or           sp, t5, tp
                  remu         ra, s1, s0
                  mul          s6, s2, t5
                  c.and        a5, a0
                  c.addi16sp   sp, -16
                  ori          ra, t3, 952
                  c.nop
                  slti         s4, s5, 1951
                  c.andi       a4, -1
                  add          tp, s5, sp
                  div          s6, zero, t2
                  srai         ra, t2, 11
                  xori         t4, a4, 1119
                  remu         gp, s5, s5
                  sll          s11, a0, zero
                  remu         s11, t3, t6
                  c.srai       s0, 11
                  sltiu        s6, a5, -153
                  sltiu        s7, s2, 665
                  c.slli       a7, 10
                  c.nop
                  add          s4, s6, tp
                  addi         a7, a6, -693
                  c.add        a1, s5
                  mulhsu       tp, tp, ra
                  ori          a4, gp, 265
                  nop
                  divu         s6, tp, sp
                  c.mv         a3, a4
                  sra          t0, gp, s0
                  sub          a2, t2, t5
                  addi         zero, t6, -1335
                  c.li         s1, -1
                  c.lui        tp, 21
                  nop
                  ori          a3, s1, 931
                  and          a7, a0, t2
                  c.addi       a5, -1
                  remu         a5, s2, t2
                  xori         t5, s6, 1639
                  sub          s2, a6, s5
                  c.xor        a5, a4
                  andi         s2, t0, 127
                  srai         a0, s9, 28
                  ori          a6, ra, -1383
                  c.add        s9, t1
                  add          sp, ra, s11
                  c.lui        tp, 18
                  lui          a1, 902817
                  c.nop
                  sltiu        s1, t1, -1794
                  or           a0, a3, s0
                  c.or         a2, a2
                  lui          tp, 945445
                  remu         gp, s3, s8
                  andi         a3, s1, -1521
                  mulh         a6, s3, zero
                  srli         a2, a2, 24
                  slli         s2, s11, 12
                  xori         s5, a5, -502
                  sub          zero, sp, s1
                  slt          a4, s9, s8
                  slt          s5, a2, t0
                  mulhsu       a7, s3, a0
                  c.li         s6, 23
                  c.li         a1, -1
                  c.nop
                  divu         s4, t6, t2
                  c.lui        s0, 20
                  c.and        a0, a1
                  mulhsu       t5, a3, s0
                  andi         s10, a6, -1776
                  mulhsu       s2, gp, a2
                  nop
                  c.addi       s4, 28
                  slli         s10, s4, 28
                  auipc        a3, 731992
                  srli         s11, sp, 14
                  c.and        a4, s1
                  mul          a6, a1, s10
                  srl          zero, tp, a1
                  nop
                  divu         s7, s4, s5
                  ori          a0, a2, 1575
                  c.or         s0, a4
                  sltiu        s10, s0, 1227
                  sltiu        gp, t5, -127
                  slti         s5, s10, 1039
                  remu         t2, a1, gp
                  c.srai       a2, 19
                  sll          s0, a5, a7
                  mul          s6, s6, s4
                  mulh         a6, t0, s6
                  sltiu        a2, s9, 928
                  c.addi       sp, -1
                  nop
                  c.andi       a2, -1
                  ori          s5, tp, 1503
                  slli         s7, t6, 22
                  srl          zero, a5, t1
                  c.or         a5, a4
                  c.and        a0, a1
                  xor          s4, gp, s6
                  c.addi4spn   a4, sp, 432
                  xor          sp, a3, s6
                  mulhu        s3, zero, s5
                  c.or         a3, s1
                  slti         a0, s8, 567
                  c.addi16sp   sp, -16
                  slli         a3, t3, 18
                  and          a4, a3, a2
                  sra          zero, gp, s3
                  addi         s2, a7, -1028
                  sra          a3, s1, a0
                  lui          a1, 929973
                  c.sub        s0, s1
                  andi         t4, t3, 1371
                  mulhu        s4, a7, t2
                  rem          a5, t2, s11
                  ori          sp, t4, -487
                  sltiu        s7, a2, -624
                  remu         t2, a3, a0
                  c.srai       a0, 23
                  sll          sp, s7, t2
                  lui          s9, 381651
                  c.addi4spn   a4, sp, 32
                  c.andi       a3, -1
                  div          zero, tp, t3
                  slt          s2, ra, ra
                  c.addi       s11, -1
                  andi         a5, s4, -1610
                  c.slli       s8, 1
                  xori         a2, tp, -1474
                  c.sub        a1, a3
                  addi         s2, a0, -618
                  ori          a6, s9, 570
                  srl          s0, t2, a5
                  or           s7, s1, a3
                  sra          sp, a0, s10
                  slti         a4, gp, -626
                  c.srai       a1, 7
                  xor          t2, a3, s7
                  c.addi16sp   sp, -16
                  slli         a7, s4, 12
                  c.andi       a4, 10
                  c.srli       a2, 19
                  sltu         gp, tp, a5
                  c.sub        a1, s1
                  c.li         gp, 30
                  rem          a6, s5, a6
                  auipc        a1, 377256
                  c.xor        a3, a5
                  or           a0, t5, t3
                  mulh         zero, tp, t1
                  sll          s11, s1, t3
                  c.addi4spn   a4, sp, 320
                  slli         gp, sp, 12
                  xor          t0, s11, s3
                  sll          s10, s8, s0
                  mulh         a3, s3, s4
                  or           a2, gp, a3
                  addi         sp, t1, -969
                  sltiu        s0, t3, -1706
                  c.lui        t2, 6
                  sltu         sp, a0, s4
                  c.srai       a1, 22
                  c.slli       t2, 17
                  c.xor        a2, s0
                  xori         a4, a1, -1103
                  slti         t4, s0, 203
                  xor          s0, a7, s6
                  slli         a5, t0, 15
                  xor          s7, s2, s3
                  add          a7, s0, a0
                  c.li         s0, 19
                  mul          a1, t5, a2
                  srai         a0, s4, 31
                  divu         s10, s3, t1
                  slti         zero, zero, 1132
                  xori         s9, t3, 236
                  add          zero, a1, s6
                  sra          a4, t4, t3
                  c.and        a4, a3
                  mulhu        s8, s2, a2
                  divu         a5, gp, ra
                  mulhsu       s9, sp, a6
                  c.srli       a4, 3
                  c.nop
                  sltiu        s1, zero, 790
                  slti         ra, s8, -1846
                  or           s4, t0, s8
                  addi         s1, s9, -1113
                  c.slli       s5, 5
                  c.srli       s1, 3
                  slti         s2, s9, -1029
                  andi         zero, s7, -1649
                  sltiu        s11, s3, -1680
                  c.add        a6, t5
                  c.addi       a5, -1
                  auipc        a5, 929710
                  c.nop
                  slli         a1, a5, 31
                  c.xor        a0, a4
                  c.addi16sp   sp, -16
                  sltiu        zero, a1, 1311
                  divu         t5, t4, s1
                  srli         a5, ra, 19
                  xori         a5, a1, 18
                  and          s11, a1, a5
                  sltu         s4, a5, t1
                  sltiu        s6, t4, -1287
                  c.add        s11, s1
                  rem          s5, t5, t6
                  c.mv         a6, t6
                  c.addi4spn   a5, sp, 96
                  srl          s4, zero, a1
                  c.sub        a2, s0
                  rem          s3, s0, t1
                  c.andi       a5, 30
                  c.slli       s3, 21
                  xor          a5, a5, zero
                  c.srli       a3, 28
                  mulhu        t4, s7, a6
                  c.sub        a4, a0
                  nop
                  addi         a6, s10, 1505
                  sltu         zero, s3, ra
                  c.addi4spn   s1, sp, 448
                  c.mv         t0, a1
                  srli         a4, s1, 14
                  ori          s9, s7, 181
                  c.andi       s0, -1
                  c.sub        a2, a0
                  c.lui        a1, 15
                  mulhu        s2, s5, t0
                  xor          s3, t5, t4
                  srl          a4, t2, s2
                  rem          a7, a5, a1
                  c.srai       s1, 16
                  add          t2, s1, s0
                  c.addi       sp, 28
                  c.slli       t5, 19
                  addi         s10, t4, -1324
                  nop
                  mul          t2, t3, s4
                  c.srli       a3, 27
                  srl          s2, a7, a6
                  or           a1, gp, t0
                  mulh         a2, t2, s7
                  nop
                  lui          t2, 86408
                  c.lui        s10, 9
                  mulh         t4, s4, s3
                  slti         t0, t4, -381
                  c.srli       a4, 16
                  mulhu        a0, s9, tp
                  srl          s2, ra, s7
                  mul          s5, gp, s5
                  sltiu        s5, s9, 101
                  c.lui        gp, 21
                  c.slli       s6, 12
                  slti         a0, a5, 57
                  remu         a3, s7, t4
                  c.lui        t0, 27
                  and          a7, s5, t5
                  remu         s7, s1, t3
                  mulh         a4, t6, a6
                  mulh         gp, a5, tp
                  lui          s3, 791650
                  c.and        s0, a1
                  sra          a7, t2, s10
                  xori         s11, t2, 1290
                  slt          t5, a3, a5
                  remu         s10, s2, t3
                  c.nop
                  c.mv         s7, a3
                  and          s6, gp, s10
                  remu         s11, a7, zero
                  c.li         s4, -1
                  addi         s1, a3, -576
                  c.xor        a1, a0
                  srai         t4, a6, 19
                  slt          s3, t0, a2
                  add          zero, t2, sp
                  c.srli       a3, 8
                  c.mv         a7, t6
                  c.mv         s11, s4
                  c.slli       a1, 9
                  remu         a0, a3, s0
                  xori         s4, tp, 61
                  div          s0, t0, a1
                  c.and        a1, a5
                  srli         a7, s4, 23
                  slli         a1, t1, 26
                  div          s5, gp, a3
                  c.xor        a5, a0
                  c.and        a4, a2
                  andi         t5, a5, 1732
                  xor          t5, t1, t5
                  auipc        a3, 205399
                  nop
                  slt          s11, t4, a0
                  sll          t2, s1, s9
                  c.lui        s8, 23
                  sltu         gp, a4, sp
                  rem          s6, s8, a3
                  add          s1, s10, s5
                  andi         a3, t2, 975
                  addi         s8, a0, 1819
                  lui          sp, 703592
                  divu         sp, s7, s4
                  slt          s7, s3, a0
                  c.nop
                  addi         t4, ra, 1246
                  c.li         t5, 1
                  xori         a4, a5, -1375
                  mulhsu       s2, s2, sp
                  c.addi16sp   sp, -16
                  ori          t5, s9, 1607
                  ori          sp, a7, -41
                  slt          s4, a1, s9
                  div          a6, a0, s7
                  c.srli       a5, 25
                  c.srli       a4, 17
                  c.xor        a1, a5
                  mulhsu       s6, tp, ra
                  mulh         sp, t6, a6
                  sub          s5, s8, t6
                  mulhu        t2, s5, s10
                  nop
                  c.and        s1, a4
                  c.xor        a0, a3
                  divu         a7, zero, s2
                  c.srli       a2, 7
                  sltu         s0, s1, s10
                  auipc        s10, 748034
                  c.addi4spn   a4, sp, 976
                  andi         s4, t3, -862
                  c.sub        a3, s1
                  mulhu        t2, s6, a6
                  andi         t0, t6, -42
                  sltu         s5, s10, a5
                  c.li         sp, -1
                  divu         a5, s4, zero
                  c.li         a2, -1
                  c.or         s1, a1
                  c.slli       t4, 25
                  mulhu        ra, s3, s8
                  sra          sp, a1, s2
                  c.and        a5, a0
                  c.sub        a0, a4
                  c.li         a2, -1
                  c.addi       s7, 24
                  c.add        t5, s6
                  c.xor        a3, a3
                  c.slli       a1, 3
                  slt          s1, s10, t4
                  c.srli       a5, 1
                  rem          gp, a5, ra
                  c.srli       a1, 1
                  div          s3, s0, a6
                  and          a1, t4, s1
                  remu         sp, s3, t5
                  srai         t0, sp, 26
                  c.or         s0, a0
                  c.srai       s0, 10
                  sltu         t4, t1, t2
                  c.slli       sp, 22
                  divu         t5, t6, s7
                  remu         t0, a0, a3
                  remu         a4, s3, s10
                  c.lui        a3, 20
                  mul          s11, a1, a5
                  sub          sp, s10, a5
                  auipc        s10, 913514
                  c.sub        a1, a4
                  c.nop
                  c.xor        a3, a3
                  rem          s11, s5, s9
                  c.addi4spn   a5, sp, 64
                  add          s5, s2, s7
                  remu         s11, s9, t2
                  sltu         s6, s2, ra
                  ori          t0, sp, 1007
                  c.sub        a2, a5
                  mul          s2, t3, t3
                  srli         t5, gp, 6
                  auipc        a1, 513001
                  nop
                  c.or         s1, s0
                  sltiu        zero, s5, 1669
                  c.lui        t4, 12
                  or           s5, zero, sp
                  nop
                  sub          s2, sp, s10
                  sra          s3, a7, a2
                  auipc        tp, 861711
                  addi         tp, a0, -1014
                  sll          s2, t0, t6
                  mul          a6, s4, s11
                  sltu         gp, s5, gp
                  c.srli       a2, 26
                  c.or         a0, a4
                  lui          s3, 848227
                  c.lui        a4, 27
                  sltu         s3, t1, a5
                  c.andi       a0, 5
                  c.lui        s4, 1
                  c.lui        s11, 20
                  slt          a4, gp, a5
                  remu         a0, s6, ra
                  sltu         a2, s8, s7
                  sra          gp, t0, t3
                  or           a2, a3, a4
                  mul          a5, a6, s1
                  xori         tp, s10, 572
                  auipc        s0, 311090
                  or           a6, s4, t4
                  sll          a7, t4, t5
                  li           a5, 0x80000000 #start riscv_int_numeric_corner_stream_13
                  li           ra, 0xb7e6e050
                  li           a7, 0x80000000
                  li           s0, 0x80000000
                  li           tp, 0x80000000
                  li           s9, 0x0
                  li           t2, 0xa082e34
                  li           gp, 0x80000000
                  li           t0, 0xffffffff
                  li           s11, 0xfbb69baa
                  lui          s9, 156996
                  lui          s11, 694107
                  div          tp, t2, a5
                  mulh         ra, gp, t2
                  mulhu        a5, ra, s0
                  add          t2, gp, s9
                  remu         t0, ra, ra
                  addi         s9, t2, 1692
                  nop
                  addi         t2, s11, 1498
                  mulh         tp, ra, ra
                  remu         a7, gp, t2
                  rem          s9, ra, ra
                  addi         a5, gp, 920
                  nop
                  nop
                  mulhu        s9, s9, ra
                  lui          t0, 573468 #end riscv_int_numeric_corner_stream_13
                  c.addi4spn   a1, sp, 688
                  sll          s1, s2, s0
                  c.and        a2, s1
                  srl          t5, ra, ra
                  remu         a3, s8, a4
                  lui          a6, 167884
                  c.mv         s10, s4
                  xori         s11, a7, -313
                  slti         s4, s1, -1535
                  mulh         gp, gp, s0
                  div          s8, s7, s9
                  sra          gp, s11, ra
                  lui          s1, 376635
                  and          t5, s7, s9
                  c.addi       s4, 21
                  mul          a4, tp, t0
                  slli         s2, tp, 18
                  c.or         a3, a1
                  or           s3, ra, a2
                  c.and        a1, s0
                  c.sub        a3, a0
                  c.xor        a2, a4
                  c.mv         s4, s7
                  c.mv         a5, t6
                  and          t5, gp, a3
                  addi         t0, a5, -160
                  sll          gp, s6, a7
                  mulhu        s6, s7, a3
                  slli         s5, s11, 26
                  xori         s11, ra, 516
                  lui          s0, 813520
                  sll          s5, t6, a0
                  c.mv         sp, s0
                  rem          gp, a3, s1
                  c.sub        a1, s1
                  sll          a7, ra, t3
                  xori         t5, ra, -903
                  c.slli       tp, 6
                  c.and        s1, a2
                  or           t4, a7, s7
                  sub          a1, s10, s5
                  and          a3, ra, s0
                  c.addi16sp   sp, 496
                  rem          tp, s8, s8
                  srl          s2, s3, sp
                  lui          t0, 962711
                  slt          s8, t5, t6
                  lui          s6, 687660
                  srli         t4, a4, 14
                  c.add        s3, t4
                  andi         a3, t6, -1147
                  slli         s0, t5, 10
                  sll          t2, a2, a0
                  or           s5, s3, a1
                  c.mv         a6, t4
                  c.srli       a5, 3
                  andi         t5, t4, -1676
                  ori          tp, s1, 1056
                  c.lui        a1, 1
                  srli         s8, s3, 18
                  srli         a5, gp, 9
                  srl          a6, a6, s7
                  c.and        a0, a4
                  c.andi       a3, 0
                  mulhsu       t5, t2, a4
                  andi         s9, t0, -306
                  ori          a4, tp, -45
                  slli         s3, sp, 22
                  c.add        s3, s9
                  addi         s3, a2, -907
                  c.li         t2, -1
                  srli         s2, sp, 10
                  c.or         a3, a4
                  rem          t0, s9, t5
                  remu         s1, s9, s0
                  c.addi4spn   s0, sp, 960
                  mulhu        s8, s10, t0
                  mulhsu       a4, s1, zero
                  c.lui        s8, 18
                  sra          s6, t5, t1
                  or           a5, t5, a7
                  xori         t5, zero, 1224
                  andi         a6, a7, -1368
                  c.or         a5, s0
                  add          t0, s4, a3
                  sltu         zero, s9, a1
                  c.nop
                  slti         t4, ra, -1389
                  c.nop
                  add          s6, t6, a6
                  sra          s0, s2, ra
                  mulh         t0, s7, s8
                  srl          s7, tp, s11
                  or           s10, s7, sp
                  c.li         s2, 2
                  c.or         a1, a3
                  c.sub        a1, a4
                  andi         a3, zero, 2012
                  c.lui        a5, 11
                  addi         s3, sp, -1534
                  lui          a1, 179666
                  c.mv         t4, a1
                  sll          t4, s10, s4
                  sltiu        ra, s0, -223
                  ori          a3, a2, -1013
                  remu         a6, t3, t6
                  c.li         a2, 2
                  xor          s3, t6, t1
                  c.addi4spn   a1, sp, 48
                  c.nop
                  xor          s3, a0, a2
                  lui          s0, 858381
                  sll          s10, s8, s8
                  c.addi4spn   s0, sp, 656
                  c.nop
                  xor          s7, s11, a7
                  ori          t5, a1, -356
                  auipc        zero, 894197
                  mulh         s10, t3, a1
                  srai         s5, a7, 17
                  c.lui        t5, 21
                  addi         tp, t0, -1810
                  c.or         a3, a5
                  sra          s8, s2, s3
                  divu         a4, sp, zero
                  rem          a5, s8, t4
                  remu         a5, s10, s5
                  c.lui        a3, 16
                  mulhu        gp, s8, t1
                  sltiu        t0, t0, -824
                  div          t2, s11, s10
                  and          s4, a5, s7
                  mulhu        s3, t4, s11
                  sll          a5, a2, t4
                  c.srli       a1, 7
                  srl          s7, t3, s7
                  ori          a2, a7, 1333
                  c.add        s1, t1
                  c.slli       a0, 2
                  xor          tp, a4, t3
                  c.sub        a1, a3
                  sltu         t0, t0, s1
                  c.addi16sp   sp, -16
                  sra          a0, a4, s4
                  add          s3, gp, s11
                  addi         s0, t2, 1200
                  sra          t4, s8, s3
                  ori          t5, s6, 9
                  c.add        ra, t3
                  sltu         s5, s9, s2
                  addi         a3, a4, -1008
                  c.li         s7, -1
                  divu         s10, t6, sp
                  sra          ra, a2, s10
                  c.andi       a1, -1
                  sub          s0, s4, s1
                  c.li         s10, -1
                  mulhu        s5, a0, s10
                  c.or         a3, a1
                  sll          s1, gp, s0
                  slli         t0, s10, 2
                  nop
                  rem          s5, a1, a1
                  c.sub        a2, s0
                  srli         s11, s1, 24
                  c.srai       a0, 1
                  c.addi16sp   sp, 224
                  sltu         ra, s1, s9
                  auipc        sp, 1010578
                  c.addi4spn   a2, sp, 736
                  ori          tp, s3, 716
                  sltiu        s8, s4, -1468
                  mulh         s6, s11, s5
                  c.li         t5, 19
                  mulh         s5, s4, ra
                  srli         sp, a4, 18
                  slli         s8, sp, 11
                  remu         s1, s10, s6
                  mul          sp, a6, tp
                  rem          s1, a4, a0
                  sltu         s5, s4, s8
                  mulhsu       t4, s11, a5
                  c.and        a3, a2
                  div          a4, sp, s1
                  c.li         s7, -1
                  rem          s5, s8, s11
                  nop
                  srl          t2, s2, sp
                  nop
                  sltiu        s10, t0, 1985
                  lui          a4, 502276
                  c.srai       s0, 19
                  nop
                  c.and        a3, a4
                  mulh         s8, sp, t1
                  sltiu        s6, ra, -1319
                  srli         s11, t3, 31
                  c.nop
                  auipc        gp, 204602
                  andi         a6, t3, -1407
                  c.mv         a0, a3
                  and          a1, sp, s5
                  divu         s1, s6, gp
                  sltiu        s4, a3, 669
                  sub          ra, zero, s2
                  remu         s5, t1, s3
                  xor          s4, tp, a1
                  c.srai       a5, 6
                  c.addi16sp   sp, -16
                  and          a1, tp, s6
                  sltiu        s11, a3, 372
                  c.mv         t0, t2
                  c.li         s11, 14
                  xori         a1, s8, 657
                  srl          ra, t6, a7
                  div          a3, s11, s4
                  rem          s6, s1, t1
                  xor          gp, s6, a6
                  xori         a7, a7, 1461
                  mulh         a0, s6, s4
                  slti         ra, a5, 77
                  and          s4, gp, s2
                  srli         a4, gp, 19
                  mulhsu       sp, s3, s10
                  xor          s10, a5, s9
                  xor          s6, gp, s2
                  ori          a7, ra, -1069
                  mulh         a1, ra, s5
                  andi         a3, zero, 1538
                  mulhu        s10, gp, a6
                  remu         a3, s2, s9
                  c.nop
                  c.li         t5, 15
                  srai         sp, a7, 24
                  srai         s9, a0, 21
                  c.and        s0, a0
                  c.add        s1, a3
                  c.andi       a3, 17
                  div          s11, tp, t5
                  c.addi16sp   sp, -16
                  divu         t0, s8, t5
                  c.addi16sp   sp, -16
                  sltiu        s4, a0, -185
                  c.addi4spn   a4, sp, 848
                  slti         sp, s6, -605
                  mul          s5, a4, s10
                  slt          t2, s1, t4
                  remu         a6, s8, s6
                  c.andi       a3, 30
                  sub          s11, s1, s5
                  mulhu        a7, s0, sp
                  c.sub        s1, s0
                  sltu         a4, s4, a6
                  andi         t0, s10, 730
                  srai         a5, a3, 26
                  xor          s7, s1, s8
                  or           sp, t3, zero
                  divu         a4, t6, a1
                  sltiu        s0, s3, -183
                  c.add        s11, s10
                  auipc        tp, 318861
                  sltiu        a6, t4, 1624
                  sll          a5, ra, t3
                  c.mv         sp, a4
                  auipc        a1, 737035
                  divu         s6, s7, a5
                  mulhu        s7, s3, a6
                  nop
                  c.addi16sp   sp, -16
                  srli         s4, t6, 3
                  c.andi       a0, -1
                  c.or         a3, a4
                  remu         s5, t1, a3
                  c.srai       s1, 25
                  c.addi16sp   sp, -16
                  srai         ra, tp, 14
                  sub          s4, s7, t5
                  slt          t5, s8, a7
                  c.slli       a0, 24
                  srli         a4, s7, 12
                  c.and        s0, a1
                  nop
                  c.and        a4, a3
                  addi         s0, s11, 364
                  slli         t4, s4, 22
                  c.srai       a5, 22
                  lui          s3, 85725
                  ori          s9, t0, 458
                  and          t5, s0, s0
                  c.addi16sp   sp, 464
                  remu         a5, s1, a4
                  srl          gp, s4, s8
                  add          a7, s9, s10
                  lui          s5, 22822
                  c.and        a1, a4
                  c.add        t4, a6
                  c.nop
                  c.andi       a0, 28
                  mulhu        s6, s7, s1
                  remu         a4, s9, a1
                  or           s8, sp, s2
                  mul          a4, t0, s11
                  c.add        s9, tp
                  c.lui        s2, 28
                  srai         s7, s2, 11
                  remu         s9, s4, a4
                  remu         gp, tp, s2
                  andi         zero, s9, 1975
                  andi         a4, s9, -1316
                  mulhu        s6, s4, a3
                  slt          t0, a0, s5
                  addi         tp, t2, 1794
                  slti         s7, gp, -201
                  sll          s5, s0, a6
                  mulhsu       s4, s9, gp
                  c.addi4spn   a2, sp, 784
                  nop
                  xor          s0, t1, s1
                  remu         s8, a5, t0
                  remu         sp, s9, t5
                  slti         s5, a6, -171
                  add          s0, t4, t4
                  sub          s6, s2, a7
                  c.mv         s11, t0
                  addi         a3, t6, 646
                  mul          a6, t6, s2
                  c.addi16sp   sp, -16
                  c.lui        a6, 29
                  srli         s7, t2, 31
                  sra          a7, a5, s5
                  and          t5, a1, s9
                  c.sub        a3, a1
                  c.addi16sp   sp, -16
                  c.andi       a3, 21
                  xori         s8, t1, -1613
                  sra          zero, s7, t2
                  c.nop
                  c.slli       ra, 26
                  xor          s6, a2, a2
                  mulhsu       s4, s2, gp
                  xori         a0, t4, 336
                  sra          sp, a1, ra
                  mulhu        t2, a7, t4
                  c.add        s11, a4
                  nop
                  c.lui        s6, 10
                  andi         s3, s10, 1371
                  mul          s6, s11, t0
                  c.sub        a0, s0
                  c.addi4spn   a1, sp, 160
                  mul          s7, sp, a5
                  divu         t2, a1, s9
                  sltu         a2, a1, a1
                  c.andi       a5, -1
                  c.li         t2, 2
                  xori         gp, s7, 1607
                  c.addi       a1, -1
                  c.add        s9, s1
                  c.xor        a1, s1
                  sltu         a5, a5, ra
                  remu         tp, s5, s3
                  sltu         s7, tp, s8
                  ori          zero, t2, 1942
                  c.nop
                  srl          s10, s5, t0
                  c.slli       sp, 16
                  addi         s2, s0, -1526
                  c.addi16sp   sp, -16
                  c.or         s0, a5
                  c.srli       a2, 13
                  sltu         s8, t0, s0
                  addi         s11, tp, 1235
                  c.lui        s11, 30
                  c.or         s0, a2
                  sltu         t5, t1, t3
                  nop
                  c.slli       a3, 27
                  c.addi       a6, -1
                  c.lui        a0, 6
                  mulhu        s8, s10, s11
                  rem          s9, s4, a6
                  andi         a6, s10, -1237
                  nop
                  xori         s9, zero, 374
                  sub          s4, s9, t1
                  srl          s8, s3, s3
                  nop
                  auipc        sp, 506049
                  c.andi       a1, -1
                  divu         a5, s6, s7
                  divu         s11, t2, s6
                  c.nop
                  and          s9, sp, ra
                  srli         s4, s0, 11
                  slt          s9, s8, ra
                  mul          s11, t6, s3
                  c.xor        a5, s0
                  and          ra, a3, ra
                  sub          s9, s2, tp
                  mulhu        s11, gp, s9
                  c.add        t5, a6
                  c.srli       a5, 9
                  auipc        s3, 353256
                  c.or         s0, s1
                  sltiu        s11, s4, -1719
                  sra          s2, t1, s6
                  slli         t2, gp, 2
                  or           s5, zero, s5
                  nop
                  divu         t2, a5, a1
                  c.xor        a4, a1
                  c.mv         sp, s9
                  auipc        s2, 752331
                  srl          s7, t6, zero
                  mulhu        a5, s4, s3
                  sltu         s8, s1, s2
                  c.and        s0, a4
                  auipc        a7, 366148
                  rem          a0, t4, t1
                  mulhu        s0, t5, a4
                  and          s8, zero, a7
                  c.lui        tp, 16
                  srli         s3, t3, 1
                  c.andi       s1, 8
                  mulh         a3, ra, gp
                  mulhsu       a2, t3, s6
                  add          s8, zero, s0
                  or           a5, a6, t0
                  c.mv         s9, s3
                  lui          a3, 766208
                  c.or         a0, a0
                  srli         a5, t6, 28
                  sll          s2, s1, s6
                  c.addi4spn   a4, sp, 352
                  c.add        s2, s8
                  remu         a2, s4, s2
                  li           s8, 0xb08a17ed #start riscv_int_numeric_corner_stream_2
                  li           a5, 0x80000000
                  li           s7, 0x80000000
                  li           a1, 0xffffffff
                  li           s10, 0xffffffff
                  li           s3, 0xffffffff
                  li           s9, 0xffffffff
                  li           s0, 0x80000000
                  li           gp, 0xbd662256
                  li           tp, 0xa217257c
                  mul          s3, s8, s7
                  auipc        gp, 433187
                  divu         s9, s0, gp
                  mulhu        s10, s8, s8
                  lui          s9, 257259
                  mul          gp, s7, s0
                  add          s3, a5, a1
                  mulhsu       s0, s9, s7
                  auipc        s0, 431682
                  sub          s3, s0, s9
                  addi         a5, s8, 1917
                  mulh         s8, s3, s0
                  div          s0, s3, a5
                  lui          s9, 1027943
                  nop #end riscv_int_numeric_corner_stream_2
                  c.mv         ra, s11
                  sltu         s3, s6, a0
                  xori         gp, s11, -1184
                  c.sub        a3, a4
                  andi         s0, ra, -1628
                  sll          gp, a6, s3
                  c.xor        a4, s1
                  c.addi16sp   sp, 32
                  sltu         s9, a6, s6
                  c.addi       sp, 3
                  mulhu        s5, a2, t0
                  slli         s2, gp, 8
                  c.srli       a0, 16
                  c.sub        s1, a1
                  slti         a5, s8, -764
                  srai         s5, s5, 29
                  c.addi16sp   sp, 432
                  mul          gp, s8, s6
                  c.mv         s1, s3
                  c.srli       a1, 17
                  mulhsu       s4, a0, sp
                  mulh         s4, sp, a0
                  c.and        a2, a5
                  slli         t2, t0, 12
                  mulhsu       t4, s0, tp
                  div          t0, t0, s1
                  c.li         a6, 10
                  mulh         s7, s7, t2
                  add          zero, s3, s3
                  lui          s0, 739792
                  rem          a0, s2, a5
                  auipc        s11, 272262
                  xor          a4, a5, a0
                  mulh         s10, sp, t6
                  c.sub        a3, s1
                  and          s3, s10, t6
                  c.lui        a1, 16
                  c.nop
                  c.or         s1, a3
                  sltiu        a5, tp, 503
                  slti         t4, t3, 614
                  sub          s7, s7, s5
                  c.and        a0, a5
                  add          s4, sp, t4
                  c.lui        t4, 18
                  c.mv         s11, t3
                  nop
                  addi         ra, ra, -562
                  mulh         s0, gp, a0
                  sll          s4, a2, a4
                  c.sub        a3, a2
                  slt          s7, a2, gp
                  mulh         s6, t5, t3
                  c.andi       a3, -1
                  sub          s10, t0, a7
                  c.addi       a4, 24
                  div          a5, s5, zero
                  div          t4, s10, zero
                  c.xor        a3, a1
                  c.and        a4, a5
                  srl          t0, s5, s7
                  c.addi16sp   sp, 176
                  xori         a4, s10, 2043
                  divu         s9, a3, t6
                  sll          s0, a4, a3
                  divu         s1, t3, a7
                  c.and        a4, a3
                  c.lui        a0, 10
                  mulhsu       a0, s4, t0
                  c.slli       s7, 8
                  c.or         a2, s1
                  c.li         ra, -1
                  sltiu        a2, t6, 1624
                  sltu         a1, a3, s3
                  mulhu        s9, t0, a4
                  or           t4, s3, s1
                  c.andi       a2, 1
                  auipc        t0, 500357
                  c.sub        a4, a4
                  c.lui        s3, 12
                  c.addi4spn   s0, sp, 672
                  ori          s8, a3, 761
                  mulh         s4, t2, t6
                  srli         s7, zero, 25
                  c.andi       a4, 21
                  remu         s8, a3, s7
                  c.addi16sp   sp, 400
                  lui          s0, 437946
                  c.addi       s5, -1
                  addi         t5, t3, 441
                  c.srai       a0, 1
                  c.addi       s3, -1
                  or           tp, gp, t3
                  c.andi       s0, -1
                  c.nop
                  c.srli       s0, 9
                  xori         s10, s11, -1757
                  slti         s1, a4, 6
                  xor          s9, s0, s8
                  slli         t5, ra, 9
                  sltu         a2, s3, s9
                  c.nop
                  c.slli       s11, 29
                  c.mv         s2, s5
                  sub          a1, a4, t3
                  or           s3, ra, s3
                  srli         s6, a4, 29
                  sub          a6, zero, a4
                  c.srai       s1, 15
                  div          t2, s2, s5
                  slti         a5, t1, -32
                  c.xor        a3, a5
                  div          t2, a2, a6
                  div          zero, s2, a4
                  sll          a0, t4, t3
                  c.add        tp, s6
                  c.slli       s4, 27
                  c.or         a2, a3
                  mul          zero, t1, t0
                  c.addi4spn   a3, sp, 144
                  addi         ra, sp, -283
                  mulhu        s6, s1, a1
                  c.li         s7, 16
                  lui          s2, 141369
                  sub          a5, t2, s11
                  c.srai       s0, 5
                  xori         t5, s8, 1165
                  c.li         a6, 20
                  c.or         a1, a3
                  slli         sp, s7, 19
                  divu         s7, s2, a0
                  slt          a7, a3, t0
                  c.mv         s0, t3
                  c.mv         t2, a3
                  remu         s10, ra, t2
                  c.or         a5, s1
                  sltiu        s2, t4, 1991
                  srli         a3, a3, 6
                  c.srai       a2, 14
                  slt          zero, t5, a0
                  srai         ra, s6, 20
                  slt          zero, a2, gp
                  c.li         s0, -1
                  xori         zero, gp, 1600
                  xor          t4, a6, sp
                  ori          tp, t2, -292
                  mul          s10, s11, a7
                  mulhsu       s5, s8, s11
                  and          s3, t1, s11
                  rem          s2, ra, t5
                  addi         a6, zero, 661
                  rem          s11, ra, sp
                  c.or         s0, a3
                  c.srai       a5, 19
                  srl          s1, zero, s4
                  slti         t5, gp, 94
                  nop
                  auipc        a6, 1007572
                  c.srai       a5, 4
                  c.add        s7, ra
                  c.andi       s0, -1
                  addi         a6, s4, -1857
                  c.addi       s5, -1
                  ori          a4, s5, -1757
                  c.slli       s1, 26
                  mulhu        a3, s2, s1
                  srai         s11, a5, 28
                  c.andi       a4, 30
                  nop
                  mulh         t0, t2, a2
                  addi         a5, a3, -1308
                  xor          a3, a5, zero
                  c.nop
                  remu         s8, s7, sp
                  sra          t0, s11, s7
                  srai         a2, a4, 27
                  c.mv         s8, t6
                  mulhu        tp, s0, s10
                  ori          a6, t6, -1682
                  mulhsu       zero, ra, a3
                  mul          s11, s4, zero
                  c.nop
                  slli         s6, s2, 10
                  c.lui        a3, 3
                  lui          a3, 618873
                  mulhsu       s3, t3, a3
                  slt          a3, s0, s2
                  c.lui        tp, 3
                  c.sub        a3, s1
                  slli         a0, a1, 21
                  andi         s10, a0, 80
                  c.slli       t5, 27
                  c.slli       s4, 8
                  c.addi16sp   sp, -16
                  c.and        a3, s1
                  c.mv         a5, s7
                  c.andi       a3, -1
                  srli         s4, a0, 0
                  mulhu        a2, s3, s0
                  xor          gp, a2, a7
                  srli         a7, a1, 18
                  sltu         a0, gp, a6
                  rem          a6, t2, t0
                  xor          s10, a0, s9
                  add          s11, s7, s7
                  and          a2, s8, a5
                  divu         a0, a3, a5
                  c.srai       a5, 12
                  mulhsu       a0, s10, zero
                  c.addi16sp   sp, -16
                  addi         a5, t5, -1421
                  c.mv         s8, a4
                  c.xor        a1, s1
                  add          sp, s10, a2
                  mulhsu       s1, t5, t2
                  srli         a7, s0, 29
                  rem          s1, s6, ra
                  mulhsu       s9, a1, tp
                  srl          s0, t6, s8
                  c.srli       a1, 25
                  c.sub        a3, s1
                  and          sp, a7, s1
                  slti         s6, s0, 1790
                  mulhu        t0, s4, tp
                  c.sub        a2, a4
                  c.li         s7, -1
                  c.srai       s1, 7
                  andi         a2, a7, 48
                  c.srai       a5, 21
                  auipc        a2, 119358
                  mulhu        s0, s4, a6
                  and          s2, t2, s11
                  c.addi16sp   sp, -16
                  andi         s9, sp, -582
                  srl          s11, a3, t0
                  sll          t4, tp, s6
                  c.nop
                  c.li         t2, 20
                  srai         a1, s2, 21
                  rem          s11, a1, s9
                  slli         t4, a7, 1
                  c.and        a2, a0
                  and          t2, s6, a6
                  c.and        a5, s1
                  mulhu        s2, a3, sp
                  nop
                  c.nop
                  c.sub        a5, a0
                  c.nop
                  xori         a5, s6, 996
                  c.srai       a0, 20
                  and          ra, a7, s9
                  srai         s0, s11, 1
                  add          t4, a1, s2
                  div          s1, tp, t2
                  remu         s2, sp, s5
                  mulh         s4, t4, s10
                  c.xor        s0, a5
                  slli         a5, s6, 28
                  srl          s0, t2, s8
                  srl          t5, gp, s8
                  or           a6, s2, a3
                  srli         tp, a0, 24
                  divu         s1, s0, sp
                  c.slli       s8, 19
                  remu         tp, t3, s2
                  c.slli       a4, 4
                  div          s4, a1, a3
                  c.slli       a5, 5
                  c.and        a2, a1
                  addi         s11, t0, 127
                  sra          t5, t0, t5
                  sub          s6, s10, a4
                  c.addi       a6, 22
                  sra          gp, t4, ra
                  c.and        a1, s1
                  srli         a3, s1, 13
                  sra          s5, s5, s9
                  sll          gp, t1, s7
                  xor          s2, ra, t3
                  slli         a3, s5, 5
                  sll          a1, t0, a0
                  c.addi4spn   a0, sp, 128
                  mulhsu       t2, ra, s6
                  c.and        s0, a0
                  c.andi       s0, -1
                  srai         s0, s8, 26
                  sub          tp, s10, t3
                  nop
                  xori         a2, s9, -912
                  c.lui        a7, 19
                  lui          t2, 471400
                  slti         s4, s8, 1888
                  c.srli       a4, 20
                  srl          s7, t4, gp
                  nop
                  c.andi       s0, -1
                  slli         s0, zero, 10
                  or           s6, a4, s9
                  sub          a2, t2, t6
                  lui          tp, 650891
                  c.slli       s11, 29
                  andi         zero, t2, 421
                  c.slli       s6, 26
                  slt          t0, s6, s5
                  addi         s6, tp, 516
                  c.addi16sp   sp, 64
                  and          s0, a5, a7
                  c.lui        a4, 22
                  xor          s3, t4, ra
                  c.addi16sp   sp, 352
                  srli         s3, t0, 11
                  srai         t2, a5, 3
                  c.and        a3, s0
                  c.sub        a2, s0
                  slli         gp, s7, 14
                  sltiu        t0, t3, -1003
                  c.nop
                  c.addi       gp, -1
                  c.addi16sp   sp, 16
                  c.andi       a1, -1
                  c.sub        a2, a3
                  srli         a4, a6, 15
                  c.and        s0, a5
                  sltu         a7, s0, ra
                  c.mv         s3, s8
                  c.nop
                  c.sub        s0, a0
                  mulhu        a1, a6, t2
                  c.srli       s0, 3
                  divu         a0, s3, s5
                  srai         s5, s3, 19
                  c.srai       a5, 11
                  divu         s3, a2, t2
                  srai         t4, t0, 29
                  auipc        s6, 1006690
                  c.add        a3, t6
                  addi         ra, s7, 1637
                  or           sp, s9, s2
                  srli         a0, s0, 11
                  remu         s7, a4, t1
                  mulh         t5, a6, s4
                  div          s10, s7, tp
                  c.lui        s3, 11
                  srai         gp, t1, 8
                  lui          s3, 595359
                  slt          a4, s6, t6
                  mulhsu       s10, t4, s2
                  andi         s8, t2, 1905
                  srl          s4, s10, t1
                  li           s6, 0x80000000 #start riscv_int_numeric_corner_stream_16
                  li           s5, 0x0
                  li           t0, 0xffffffff
                  li           s10, 0x69ab1059
                  li           a4, 0xffffffff
                  li           a0, 0xe9b0611e
                  li           s11, 0x0
                  li           ra, 0xffffffff
                  li           a2, 0x20759cf2
                  li           tp, 0x80000000
                  add          t0, a2, t0
                  div          s5, a4, s5
                  mulhsu       s10, tp, a4
                  rem          a4, ra, a2
                  addi         t0, tp, 47
                  remu         a4, s5, s11
                  divu         a0, s11, s11
                  divu         tp, ra, tp
                  mulh         tp, tp, tp
                  lui          s11, 699373
                  div          s11, a0, s6
                  sub          a4, s11, a0
                  add          a2, tp, a2
                  addi         a0, a4, 918
                  mulhu        t0, a4, s10
                  sub          a0, s10, t0 #end riscv_int_numeric_corner_stream_16
                  mul          s7, a1, t5
                  mulhsu       t4, s4, a7
                  or           sp, s0, a1
                  c.andi       a0, -1
                  c.add        s3, t6
                  c.addi16sp   sp, 368
                  slti         s9, t4, -958
                  auipc        a3, 661437
                  c.and        s0, a1
                  c.or         a4, a5
                  c.addi       s3, 2
                  xor          a3, a2, a6
                  c.li         tp, 28
                  c.or         a1, a3
                  sltiu        sp, a7, 877
                  mul          a2, ra, t6
                  sll          t2, t6, a2
                  c.srli       a4, 10
                  add          t0, t6, s9
                  rem          a3, s1, s0
                  div          t2, s3, a3
                  srl          s3, t5, t4
                  auipc        a1, 317170
                  rem          a6, t6, s6
                  c.li         s8, 4
                  slt          tp, s0, zero
                  divu         a0, s11, s10
                  c.addi16sp   sp, -16
                  addi         tp, t1, 897
                  c.lui        s0, 20
                  remu         s8, s8, a0
                  c.add        gp, a4
                  auipc        t5, 686828
                  c.lui        s10, 10
                  mulh         s1, sp, tp
                  c.andi       a2, -1
                  rem          s8, s7, s5
                  c.li         s2, -1
                  c.addi4spn   a1, sp, 128
                  c.andi       s1, 4
                  xor          a2, a3, tp
                  div          s11, s8, a2
                  and          s9, s2, a4
                  andi         t5, s9, -1105
                  c.lui        s10, 9
                  c.slli       s5, 6
                  sltu         a0, t4, t1
                  c.and        a3, a5
                  c.sub        s1, s1
                  slt          s7, s4, s6
                  c.nop
                  mul          s7, gp, s5
                  sll          tp, a5, s9
                  xor          s3, s11, s1
                  c.xor        s1, s1
                  sll          s8, a4, zero
                  c.addi16sp   sp, 336
                  c.add        a5, a0
                  c.sub        a2, a0
                  c.srai       a0, 22
                  c.lui        s3, 7
                  slti         a2, sp, -309
                  sra          s10, gp, t5
                  c.srai       s0, 3
                  xor          s3, zero, s6
                  div          a3, s11, a4
                  c.mv         s11, a3
                  c.andi       s0, -1
                  c.srli       a3, 21
                  sltiu        s10, a6, 1130
                  rem          s5, a6, t4
                  c.li         a6, -1
                  lui          a1, 1036878
                  divu         s5, a3, s2
                  c.xor        a0, s1
                  slti         s3, tp, 1016
                  addi         sp, s0, -141
                  mulhsu       t5, s3, a7
                  nop
                  mulhsu       s4, a6, s9
                  c.addi4spn   a1, sp, 880
                  divu         a6, tp, a6
                  srl          s7, ra, t4
                  srl          a5, s3, t3
                  auipc        a0, 693609
                  sub          a6, a2, t5
                  lui          s2, 144154
                  c.srai       a2, 18
                  c.slli       t4, 4
                  xor          a7, s7, t3
                  c.add        ra, ra
                  or           s2, a7, a4
                  c.lui        t4, 1
                  c.xor        a4, a1
                  c.addi       s1, -1
                  addi         s7, t5, 495
                  mulhsu       s1, s3, s0
                  mulhsu       s9, s1, a4
                  c.srli       a2, 6
                  sra          ra, t0, sp
                  rem          t2, a6, ra
                  c.mv         a4, s5
                  c.sub        a5, s0
                  srl          gp, s4, ra
                  mulhu        a6, t5, s3
                  c.and        a0, a0
                  c.li         a6, 18
                  slt          a3, a6, t4
                  mulhu        a6, s5, zero
                  nop
                  mulhsu       a2, a0, s2
                  sra          s3, tp, sp
                  c.slli       s11, 9
                  c.and        a5, a0
                  sra          ra, t3, s11
                  remu         s1, a4, s8
                  sub          s9, sp, a4
                  ori          a7, a1, -981
                  or           a5, t6, a3
                  c.mv         a6, gp
                  xori         t4, t1, 6
                  divu         a2, s6, a3
                  c.sub        s0, s1
                  addi         a4, t0, -1638
                  c.mv         a2, s2
                  slt          sp, t1, s3
                  c.srai       a1, 23
                  ori          s2, a6, 1648
                  c.srai       a4, 16
                  srai         s7, t4, 8
                  ori          t0, s3, -1148
                  srli         a0, s9, 9
                  sll          s4, ra, t3
                  mulhsu       a7, a0, s5
                  c.addi16sp   sp, 128
                  c.slli       s2, 9
                  sltiu        a3, a7, 698
                  xor          s10, s0, t4
                  divu         s4, t1, t1
                  remu         s1, a5, t0
                  srl          t2, s0, ra
                  or           ra, a5, s7
                  mulhu        s6, t5, t4
                  remu         s5, ra, s1
                  c.srli       a1, 8
                  c.srai       s1, 15
                  lui          a2, 590197
                  c.add        s9, s9
                  c.addi       a1, 11
                  c.xor        a3, s0
                  c.and        a5, a3
                  addi         s5, a4, -1671
                  mul          s11, s0, s4
                  c.li         a7, -1
                  c.srli       a4, 11
                  c.addi16sp   sp, -16
                  c.li         t4, 7
                  c.srai       a4, 20
                  srli         s6, s0, 25
                  sll          s11, tp, s5
                  c.addi16sp   sp, -16
                  c.addi       sp, -1
                  c.or         a5, a4
                  andi         s6, t2, 1207
                  sltiu        s9, gp, 716
                  nop
                  slt          t4, a2, tp
                  lui          t2, 554739
                  mulhu        s1, s7, a4
                  c.and        a4, a5
                  c.andi       a4, -1
                  c.or         s1, a5
                  c.xor        s1, s1
                  c.srli       s1, 16
                  sltiu        a6, s6, 1649
                  c.or         s1, a1
                  auipc        a7, 150733
                  mulh         s11, a7, zero
                  c.addi       ra, 18
                  mulh         s1, a7, s9
                  slt          s0, t0, s9
                  rem          s8, a7, t3
                  slt          a0, a7, a2
                  or           a0, a7, a2
                  c.sub        a2, a1
                  c.addi4spn   a2, sp, 176
                  or           a0, t6, t2
                  and          a1, s4, s1
                  srli         t4, a0, 29
                  c.add        s0, t0
                  c.and        a4, a4
                  slti         t5, ra, 907
                  xori         sp, t0, 306
                  rem          s7, s4, a4
                  xor          a6, s3, a0
                  nop
                  addi         a2, s11, -1563
                  slti         t0, s8, -1780
                  sub          t5, a1, s1
                  c.sub        a3, a5
                  c.srai       a1, 29
                  xor          t2, t3, zero
                  sltiu        a1, a0, 288
                  sub          ra, s6, zero
                  srai         a1, a6, 19
                  c.addi16sp   sp, -16
                  c.lui        s10, 24
                  c.lui        gp, 29
                  c.li         t0, -1
                  ori          s10, t0, 1030
                  slti         ra, s10, -1085
                  srl          s10, t2, sp
                  c.srai       a1, 20
                  c.nop
                  c.sub        a0, a3
                  sll          gp, t4, s2
                  c.slli       t5, 27
                  c.or         a4, a0
                  sltiu        t0, a2, 57
                  rem          s6, a3, s7
                  c.mv         s4, t0
                  c.nop
                  and          a7, t4, t4
                  addi         s6, s4, -5
                  mulhu        ra, a0, t4
                  mulhu        zero, t1, a7
                  slt          t0, t6, s11
                  and          s11, t2, gp
                  srl          s3, tp, t5
                  c.nop
                  auipc        s6, 53047
                  c.add        s2, s10
                  c.xor        a1, s0
                  xori         a0, gp, -1360
                  nop
                  xori         s9, s11, -818
                  sub          a1, s0, t2
                  slt          zero, t6, s5
                  auipc        s9, 568005
                  sltiu        a1, t2, -40
                  xor          s2, a4, t3
                  c.addi4spn   s0, sp, 464
                  lui          s4, 408766
                  mulhu        a3, s7, s3
                  c.srai       a3, 26
                  c.srli       a2, 25
                  c.addi       sp, 30
                  xor          s8, t1, s4
                  srai         t2, tp, 12
                  c.lui        a3, 24
                  or           s6, a3, s1
                  c.add        s8, t1
                  xori         s2, t0, 1427
                  xor          a7, t4, s7
                  srai         a4, a0, 18
                  add          s0, t6, a5
                  c.addi16sp   sp, -16
                  mulhsu       sp, s5, a4
                  c.xor        a1, s0
                  c.addi4spn   a1, sp, 496
                  div          t4, s3, s7
                  c.srai       a3, 7
                  ori          s7, sp, 84
                  c.xor        a2, s1
                  mul          gp, a6, s2
                  c.and        a5, a4
                  remu         s10, t4, a7
                  sltiu        s4, a2, -809
                  c.and        a0, a5
                  slt          sp, gp, s2
                  c.add        s1, s1
                  mulh         a5, t3, t1
                  c.addi4spn   s1, sp, 304
                  ori          s11, gp, -1053
                  c.mv         s6, a6
                  c.lui        s9, 19
                  slti         s8, s8, -777
                  remu         a4, s1, a5
                  c.andi       a0, -1
                  c.addi16sp   sp, 80
                  divu         gp, s6, s11
                  nop
                  sub          s6, s0, a0
                  c.addi16sp   sp, 80
                  c.addi4spn   a3, sp, 608
                  nop
                  srli         zero, t3, 30
                  xor          s0, a1, t0
                  c.andi       a5, 10
                  c.xor        a0, a2
                  slti         s9, a4, 182
                  lui          a6, 200236
                  add          tp, s10, a7
                  divu         s6, t1, a1
                  divu         s10, a4, s5
                  c.and        a4, a5
                  c.addi4spn   a1, sp, 32
                  c.li         s1, -1
                  c.addi16sp   sp, 64
                  c.and        a3, a5
                  c.srai       a3, 15
                  sltiu        t5, t6, 1045
                  c.andi       s1, 10
                  sra          t2, s6, s2
                  sltiu        s1, gp, 434
                  sltiu        a5, a7, -560
                  divu         a1, s11, s0
                  slti         a4, tp, -893
                  sltu         a1, t2, t1
                  c.xor        a3, s1
                  add          zero, a4, tp
                  c.slli       s0, 28
                  c.add        ra, a1
                  c.lui        t0, 3
                  c.sub        a5, a2
                  lui          s8, 809189
                  mulhu        s7, a4, t3
                  slti         sp, s11, -1101
                  mulhsu       gp, t0, t2
                  c.mv         a7, s5
                  ori          s5, s1, 761
                  remu         s2, t2, s5
                  mulh         s0, s7, t3
                  xor          s0, s9, s6
                  slli         s0, a4, 30
                  xor          s9, t6, zero
                  ori          a2, s9, 1910
                  c.srai       s0, 2
                  slt          s6, s3, a7
                  c.xor        a3, a0
                  mul          s5, s3, a1
                  c.li         s8, -1
                  and          s7, s11, s7
                  sra          s5, t4, s7
                  c.or         a4, a0
                  or           s4, a4, s0
                  c.and        a5, a2
                  c.addi16sp   sp, -16
                  srli         s7, s3, 1
                  c.addi16sp   sp, -16
                  div          s5, a6, s0
                  mulhsu       t4, zero, a5
                  and          s1, s10, s3
                  xor          s11, s7, ra
                  nop
                  srai         s0, s0, 30
                  sra          s3, a6, a3
                  slli         tp, a1, 11
                  c.addi16sp   sp, 416
                  c.sub        a0, a5
                  c.add        t4, a6
                  srli         sp, s10, 29
                  srli         a2, a1, 20
                  mulh         s0, t4, t3
                  sra          a0, s10, t4
                  lui          zero, 927143
                  c.nop
                  slt          s5, s11, a2
                  add          s1, s3, s8
                  andi         gp, s10, 1563
                  srai         ra, s11, 3
                  c.add        t0, s4
                  c.li         t5, 15
                  sub          tp, s6, s4
                  lui          a4, 697128
                  div          s6, a4, s11
                  mul          s7, s9, t4
                  c.or         a4, a0
                  c.sub        s0, a2
                  mulhsu       t4, t1, t4
                  c.mv         s1, a3
                  xor          a5, a7, s9
                  mulhu        gp, t1, gp
                  c.nop
                  c.srai       a4, 15
                  c.xor        s1, a1
                  mulhsu       a7, a3, s1
                  slti         s2, a4, 1059
                  c.srai       a0, 2
                  xor          s11, t5, ra
                  and          s8, ra, a2
                  sub          t4, tp, a5
                  c.and        a4, a1
                  slli         ra, t1, 1
                  c.addi       s6, 25
                  mulhsu       sp, a6, ra
                  c.addi16sp   sp, 320
                  slli         ra, a3, 28
                  remu         zero, s0, s2
                  nop
                  mulhsu       zero, s6, a0
                  srli         t0, s8, 14
                  slt          a4, s1, t5
                  nop
                  sll          s4, t2, ra
                  c.addi16sp   sp, -16
                  auipc        s4, 1038383
                  c.addi       s10, 14
                  c.nop
                  c.or         s0, a1
                  sltu         s3, s6, gp
                  remu         a4, s7, sp
                  c.addi4spn   a1, sp, 656
                  slli         t2, sp, 6
                  div          s2, s4, a7
                  sub          t2, a5, s5
                  slli         s0, s7, 6
                  c.or         a4, a4
                  c.addi       s9, -1
                  sll          s10, t0, a6
                  c.srli       s0, 11
                  nop
                  slti         s7, t5, 289
                  srli         t0, s8, 9
                  slli         s8, s10, 19
                  addi         s9, t3, 247
                  slt          t2, t3, s8
                  sub          a3, a0, t1
                  c.addi       t4, -1
                  rem          s11, s4, s9
                  slli         s11, t0, 15
                  remu         tp, s8, t0
                  sltu         s1, t1, s9
                  divu         s0, s11, s8
                  div          a0, s5, a5
                  andi         s6, a5, 1353
                  c.and        a5, a5
                  sltu         s4, s4, zero
                  andi         t0, s8, 344
                  or           ra, s9, t6
                  xor          a0, s1, s10
                  c.addi16sp   sp, -16
                  lui          s3, 123516
                  remu         t0, s11, t3
                  and          t5, sp, s1
                  rem          s5, a6, s0
                  c.addi4spn   a0, sp, 224
                  c.xor        s0, a3
                  c.or         s0, a0
                  slt          s5, t5, s11
                  c.andi       a2, 11
                  c.li         a3, 25
                  mulhu        s6, s11, a7
                  div          s3, zero, s10
                  c.or         a3, a2
                  c.mv         a5, s2
                  andi         a4, s3, -955
                  addi         s8, t4, 112
                  c.xor        a4, a1
                  mulh         a1, s3, s11
                  div          s2, s8, a6
                  sll          sp, a1, s10
                  or           a4, t4, s10
                  c.add        sp, a2
                  slt          a0, s10, zero
                  srai         a7, s7, 7
                  divu         s11, t2, a0
                  mul          s4, s7, t1
                  mulh         a1, s10, tp
                  srli         s0, sp, 23
                  c.addi4spn   a5, sp, 208
                  mul          gp, s7, sp
                  div          a4, s7, a2
                  remu         gp, a7, a3
                  lui          s4, 126848
                  div          a4, sp, a4
                  remu         ra, s9, zero
                  sll          t2, s11, s1
                  mul          s5, t6, t6
                  nop
                  div          s0, tp, t2
                  c.srli       a3, 8
                  c.add        sp, t5
                  c.slli       t2, 22
                  xori         sp, tp, 1972
                  c.nop
                  addi         a1, t3, -918
                  slti         s5, s1, 534
                  c.andi       a5, -1
                  divu         a6, a1, a0
                  and          s3, a0, s5
                  andi         a1, t5, -1271
                  ori          s2, sp, 313
                  mulhsu       s10, s5, s4
                  lui          s6, 359634
                  c.sub        a1, a5
                  mulhsu       a1, t2, s4
                  lui          t5, 379916
                  c.addi16sp   sp, -16
                  c.andi       a1, -1
                  addi         s7, ra, -1729
                  c.andi       a3, 15
                  slti         s0, s5, -1672
                  ori          sp, s7, 368
                  xori         s6, a7, 92
                  c.nop
                  srai         tp, s8, 2
                  rem          s6, s4, a4
                  addi         s0, a6, 1493
                  li           s10, 0x284d400e #start riscv_int_numeric_corner_stream_19
                  li           s5, 0x1514d722
                  li           a3, 0xffffffff
                  li           s1, 0xffffffff
                  li           a6, 0x0
                  li           gp, 0x179695b5
                  li           s6, 0xffffffff
                  li           t4, 0x80000000
                  li           s0, 0xc05e6203
                  li           a2, 0xffffffff
                  mulh         gp, gp, t4
                  divu         s1, s1, s5
                  mulhu        gp, s1, s6
                  auipc        s1, 47787
                  auipc        s0, 643458
                  divu         s0, t4, gp
                  mul          a3, a6, gp
                  add          s5, t4, s0
                  add          a2, s0, s0
                  rem          s10, s1, a2
                  divu         s6, s0, s6
                  mulh         a2, t4, s10
                  remu         s5, s1, gp
                  add          gp, a2, a3
                  remu         gp, t4, s0 #end riscv_int_numeric_corner_stream_19
                  c.srli       a5, 2
                  sra          s1, gp, gp
                  mulhsu       s5, a0, s7
                  c.srli       a0, 17
                  mulhsu       s0, s2, s3
                  srl          ra, a5, s1
                  c.srai       s1, 2
                  slt          s1, s2, tp
                  mul          t0, t4, t6
                  xori         t2, a7, -908
                  mul          t2, t6, t3
                  c.or         a0, a3
                  divu         t2, t6, s9
                  div          a6, gp, t5
                  c.add        s11, t5
                  c.addi4spn   a4, sp, 384
                  c.li         t0, -1
                  nop
                  ori          s2, t1, 1929
                  ori          a1, s8, -653
                  rem          t2, t3, s5
                  c.xor        a1, a4
                  xor          t4, s5, t2
                  sltu         a6, s0, a0
                  c.srai       a2, 2
                  nop
                  rem          s6, tp, ra
                  remu         t2, a2, s4
                  c.add        s8, s2
                  sll          s7, ra, s9
                  slt          t4, t0, sp
                  sltu         ra, t5, s4
                  slli         s9, gp, 16
                  rem          zero, s7, a1
                  sub          a4, s10, sp
                  c.lui        a3, 1
                  mulhu        s2, a2, a4
                  slt          s8, s10, a1
                  auipc        sp, 924478
                  slli         s4, ra, 15
                  addi         sp, s3, 318
                  divu         s3, gp, tp
                  c.addi       a6, 13
                  srl          s7, t6, s8
                  srl          t2, sp, a1
                  slli         tp, ra, 2
                  c.li         a3, 11
                  c.nop
                  andi         s11, s2, -2009
                  c.sub        a2, a4
                  c.mv         s4, t5
                  c.mv         s2, s3
                  sll          a7, t6, s7
                  srai         ra, s6, 6
                  srai         a6, a7, 1
                  ori          ra, s10, 1223
                  srl          a1, s2, s6
                  or           s9, tp, a3
                  c.add        a7, s5
                  mulhsu       a5, a2, s4
                  c.xor        s1, a0
                  sltiu        a7, s5, 1814
                  c.and        s1, a4
                  slt          t4, s10, a1
                  auipc        s8, 847343
                  c.li         s7, 2
                  c.mv         ra, t4
                  c.andi       a2, 28
                  c.slli       a7, 19
                  sra          a2, gp, sp
                  srai         s1, s7, 29
                  srl          a7, s8, sp
                  srl          s3, s2, t0
                  mulhu        s1, a5, a5
                  c.srai       a3, 18
                  c.lui        s10, 4
                  addi         t4, t0, 742
                  div          s4, s11, zero
                  c.addi16sp   sp, 112
                  mulhsu       a0, t2, s7
                  lui          a4, 67614
                  andi         s6, s4, -1481
                  remu         s0, t4, s5
                  c.srai       a0, 29
                  lui          a2, 68393
                  c.srai       a2, 12
                  slt          s11, a4, s9
                  or           gp, a4, s4
                  srli         ra, sp, 24
                  nop
                  c.nop
                  c.srli       a1, 19
                  mul          t4, t1, s2
                  srl          sp, t0, t6
                  mulh         t4, a3, a3
                  slti         a7, t1, 1565
                  c.addi       ra, 2
                  slli         s6, a1, 16
                  c.addi4spn   a0, sp, 528
                  slli         ra, s8, 17
                  remu         t2, zero, t5
                  c.add        s6, a6
                  sra          gp, s9, t2
                  c.add        t2, ra
                  slti         a1, a2, -340
                  xori         s5, sp, 774
                  lui          a0, 607758
                  c.sub        s0, s0
                  sll          a4, t2, a1
                  xori         s0, a1, -1809
                  slli         s4, s2, 25
                  c.srai       a1, 13
                  c.and        a3, a3
                  slli         a4, s0, 22
                  c.and        a5, a4
                  slt          s0, a0, s3
                  rem          t2, t4, t1
                  sltu         s2, t2, s0
                  sltu         s5, t3, a7
                  mulh         gp, a6, ra
                  c.srai       a1, 13
                  c.li         a3, 1
                  c.li         s0, -1
                  c.lui        gp, 14
                  sltu         gp, t1, t5
                  or           t2, t3, t0
                  c.lui        s1, 29
                  mulh         s3, a4, a5
                  sltiu        a4, s11, 1062
                  c.xor        s0, a5
                  ori          zero, s3, -229
                  nop
                  c.slli       t2, 29
                  c.andi       s0, 26
                  c.andi       a3, 16
                  slli         a0, a6, 31
                  c.or         a3, s0
                  sltu         ra, a6, a2
                  c.addi4spn   a3, sp, 896
                  divu         t2, a1, zero
                  lui          t2, 729377
                  mulh         ra, s1, s0
                  slt          s9, t5, s9
                  mulh         t4, gp, s8
                  sll          s2, a6, a4
                  c.slli       a0, 20
                  mul          t0, ra, t3
                  c.lui        a4, 22
                  andi         s11, s9, -1061
                  addi         t5, s5, 111
                  c.addi       s11, 28
                  slli         tp, t0, 16
                  c.or         a5, a1
                  slt          s8, s4, s2
                  c.addi       tp, 18
                  or           s11, t0, t4
                  addi         s8, t6, -919
                  c.or         a3, a2
                  add          a3, t1, t3
                  c.addi16sp   sp, -16
                  srai         s9, s7, 24
                  ori          ra, a0, -1599
                  c.srli       a0, 18
                  c.sub        a4, s1
                  sra          s7, a0, a2
                  sltiu        a2, t0, -1832
                  c.and        a5, a0
                  and          a1, s5, t2
                  addi         s5, t5, 1615
                  c.srli       a0, 26
                  auipc        t4, 580333
                  c.slli       s2, 17
                  remu         a5, s10, t0
                  slti         a2, t6, 2026
                  c.xor        a5, a1
                  c.addi16sp   sp, -16
                  lui          sp, 1024850
                  xor          s4, t4, s0
                  srli         a4, a5, 13
                  c.andi       s1, -1
                  addi         s2, a1, -93
                  mulhu        t4, gp, sp
                  sltiu        a3, s6, -1852
                  c.sub        a2, a4
                  srli         a2, t4, 31
                  andi         t2, s5, 276
                  slli         tp, a0, 1
                  mulhu        t5, a4, s0
                  and          a1, a5, t3
                  sra          a4, a0, s4
                  or           gp, s10, t6
                  c.andi       a5, 25
                  c.nop
                  rem          s2, s4, t0
                  c.xor        a5, a1
                  remu         sp, a6, a0
                  addi         s0, a0, 838
                  xori         sp, a3, -983
                  lui          a7, 112467
                  div          s7, tp, t3
                  c.or         a1, a5
                  srli         t0, ra, 5
                  add          a6, s5, a4
                  and          a5, t5, s0
                  c.and        a5, s0
                  c.addi       s9, -1
                  c.or         s0, a4
                  remu         a1, s2, s8
                  c.mv         a3, s8
                  srai         s1, a0, 13
                  divu         tp, a1, s5
                  lui          s7, 160564
                  c.srli       a1, 14
                  c.addi16sp   sp, -16
                  c.addi4spn   s1, sp, 544
                  c.addi       s9, 16
                  c.add        t0, s2
                  mul          a3, a5, gp
                  sra          s11, s8, t1
                  xor          t2, a3, a5
                  sra          a4, t2, s10
                  srli         t4, s11, 24
                  srai         a4, a0, 26
                  slt          tp, a6, t4
                  nop
                  mulhsu       ra, s1, s7
                  c.addi4spn   s1, sp, 592
                  sltiu        a5, s2, 1435
                  auipc        zero, 58346
                  c.andi       a2, 13
                  sll          a5, s2, ra
                  or           a5, a7, t4
                  mulhu        t5, t0, a4
                  slt          s10, s2, s8
                  ori          a5, s5, 1588
                  mulhu        a4, s11, a1
                  c.li         s4, 30
                  sll          s3, sp, a7
                  srai         tp, a1, 24
                  srli         s1, t0, 21
                  mulhsu       a4, t5, s10
                  nop
                  andi         t5, a1, -1813
                  c.xor        a2, a2
                  c.and        a5, a4
                  c.xor        a4, a4
                  c.sub        a1, s1
                  xori         s3, s8, -1379
                  c.and        a3, a3
                  slli         a4, s6, 24
                  c.nop
                  divu         t0, a7, gp
                  c.addi4spn   a2, sp, 304
                  divu         t2, a1, s0
                  slli         t4, tp, 30
                  c.andi       a3, -1
                  sra          a4, ra, t3
                  c.addi       a0, -1
                  c.srai       a3, 9
                  c.mv         s5, t3
                  nop
                  xor          a4, a0, t4
                  sltu         a1, s7, gp
                  srli         s3, t4, 14
                  slli         s3, s2, 26
                  srli         a7, a4, 9
                  slt          ra, t5, s4
                  c.and        a4, a2
                  c.mv         a7, ra
                  slti         s2, t2, 1531
                  sra          s4, tp, sp
                  mul          s2, s10, a7
                  c.nop
                  lui          s10, 693158
                  mul          a1, a7, zero
                  c.srli       a1, 10
                  or           t0, a5, t4
                  c.add        gp, t0
                  c.srai       a3, 28
                  c.srli       a4, 25
                  rem          s3, a1, a6
                  mulhsu       s10, a1, t4
                  c.nop
                  sltu         s8, s4, s7
                  li           s5, 0x86ec6902 #start riscv_int_numeric_corner_stream_1
                  li           a7, 0x20832fb1
                  li           s6, 0x0
                  li           s11, 0x0
                  li           a5, 0x80000000
                  li           a0, 0x80000000
                  li           sp, 0x80000000
                  li           s9, 0x0
                  li           ra, 0x0
                  li           s0, 0xffffffff
                  add          a7, ra, a0
                  divu         s9, s6, s6
                  remu         s5, s9, s6
                  rem          ra, s0, a0
                  mulh         a5, sp, a7
                  mulhu        s9, s11, ra
                  add          a5, s6, s9
                  div          a0, s11, s5
                  mulhu        s0, ra, s9
                  mulh         ra, a7, a7
                  lui          sp, 512405
                  rem          s6, s9, a7
                  nop
                  nop
                  div          ra, s6, s5
                  div          s6, a5, s9
                  sub          ra, s0, s9 #end riscv_int_numeric_corner_stream_1
                  c.addi       ra, -1
                  srl          s7, t1, ra
                  c.addi4spn   a0, sp, 880
                  sltu         zero, a6, s2
                  or           s9, ra, a3
                  divu         s8, zero, s9
                  slt          a2, gp, t5
                  srl          s2, s2, s3
                  c.lui        gp, 8
                  lui          s10, 647573
                  xori         a1, s8, -1234
                  c.addi4spn   s0, sp, 720
                  c.addi16sp   sp, -16
                  c.or         a5, a4
                  add          a4, t2, t0
                  sll          t0, s0, t3
                  slt          a6, t1, t0
                  c.srai       a1, 11
                  c.and        s1, a1
                  mulh         s10, t6, s5
                  and          a2, a1, a6
                  srli         a2, t3, 0
                  mulhu        s1, a3, s6
                  mulhsu       s11, s11, gp
                  andi         a6, s9, 689
                  addi         sp, t6, -1453
                  c.lui        a0, 25
                  c.srai       a0, 14
                  sltiu        s1, s11, 736
                  xor          a1, sp, t6
                  c.addi16sp   sp, 112
                  or           s9, s5, s0
                  slti         zero, a2, -264
                  mulhu        sp, s4, s4
                  mulhu        a4, ra, t1
                  xor          t4, a4, s3
                  c.srli       a5, 3
                  c.andi       a4, -1
                  auipc        t4, 820945
                  c.or         a5, s1
                  c.add        s2, t0
                  mul          s9, s5, s6
                  c.mv         s4, t0
                  c.slli       tp, 20
                  mulhsu       ra, s7, s2
                  c.or         s0, a1
                  mulhu        gp, a4, s1
                  srl          s6, a5, s2
                  sltu         s8, s10, s7
                  nop
                  c.li         sp, 11
                  c.srli       a4, 21
                  c.nop
                  add          s8, gp, a0
                  and          a6, a3, s3
                  c.add        s6, a7
                  srai         s8, ra, 26
                  lui          a3, 472799
                  c.addi16sp   sp, 16
                  slt          zero, a7, s10
                  c.srli       a5, 27
                  slti         t5, a7, -51
                  or           zero, zero, a6
                  srai         gp, a6, 29
                  nop
                  c.add        a5, s5
                  c.add        a7, t5
                  srli         a3, a4, 12
                  addi         a0, gp, -1750
                  sltu         tp, a4, s0
                  slti         t5, t5, -1568
                  c.addi4spn   a2, sp, 784
                  c.addi16sp   sp, 128
                  c.andi       a0, -1
                  addi         sp, a1, -1043
                  c.li         s10, -1
                  xori         t2, t4, 772
                  c.li         gp, 25
                  sltu         s4, s8, zero
                  rem          tp, t5, a1
                  mulh         s10, zero, t3
                  c.addi       s6, 6
                  remu         zero, s10, t1
                  add          t0, a7, s7
                  mul          a3, a1, s11
                  add          s3, a4, s6
                  nop
                  c.srli       a0, 11
                  srl          t0, t3, s10
                  srai         a6, a5, 0
                  srai         a5, a1, 23
                  c.slli       s9, 9
                  slt          tp, t1, ra
                  and          t4, ra, a1
                  c.addi       t5, -1
                  c.add        s2, t4
                  add          s6, s6, tp
                  nop
                  addi         zero, gp, -189
                  c.addi16sp   sp, -16
                  slti         s11, t2, -1173
                  slli         a1, t6, 20
                  slli         s9, t5, 27
                  c.add        s11, gp
                  c.mv         s9, s0
                  c.srli       s0, 10
                  andi         a0, a7, 696
                  auipc        a4, 627384
                  slti         zero, s5, 1406
                  c.andi       a2, 10
                  sll          s10, a2, a2
                  divu         s5, gp, zero
                  xor          s10, t3, a3
                  xor          t0, a2, tp
                  andi         ra, s0, 138
                  div          s2, s4, t6
                  sra          a6, s11, t2
                  c.nop
                  c.xor        a5, a1
                  remu         ra, a6, zero
                  c.andi       a4, 14
                  c.add        t0, s9
                  rem          gp, s3, s10
                  srli         s8, a3, 14
                  c.and        s1, s0
                  div          s3, s3, a0
                  c.addi4spn   a5, sp, 832
                  xor          s7, s9, t1
                  srai         s1, t3, 6
                  or           t4, a0, a4
                  slti         a7, s11, -278
                  c.or         a0, a4
                  and          s7, t3, sp
                  mulhu        t2, t4, a4
                  mulhsu       zero, a4, t6
                  and          s8, s8, s0
                  auipc        tp, 289020
                  c.xor        a3, a5
                  mulhu        sp, s9, a3
                  c.and        a2, a2
                  srai         a4, t5, 1
                  divu         a3, tp, t2
                  mulhsu       a6, s9, a6
                  c.addi4spn   a3, sp, 688
                  c.addi4spn   s1, sp, 352
                  andi         s9, a0, -1217
                  c.xor        a0, a0
                  c.xor        a1, a3
                  c.and        s1, a5
                  mul          s9, s0, s5
                  ori          s6, tp, -722
                  sra          a6, sp, a6
                  or           gp, t5, a5
                  c.andi       a1, -1
                  sltu         sp, a3, t4
                  rem          a0, a1, s7
                  c.sub        s1, a3
                  rem          s10, a2, s0
                  c.and        s1, s0
                  sltiu        tp, sp, 1124
                  srai         s0, s7, 26
                  c.addi16sp   sp, -16
                  c.srli       a4, 14
                  c.addi4spn   s1, sp, 704
                  c.lui        t4, 29
                  mulhu        a7, s2, a3
                  add          a3, t2, t4
                  divu         a2, tp, s10
                  div          a1, t0, a1
                  c.andi       a2, -1
                  c.add        a2, s11
                  rem          a5, zero, t6
                  slt          s10, a4, sp
                  slli         t4, a1, 6
                  sltiu        t2, t3, 231
                  slti         a1, s1, 1007
                  c.addi16sp   sp, 96
                  rem          a0, t2, t5
                  slt          t5, s1, a7
                  sra          sp, a0, s5
                  c.andi       a4, 30
                  slti         s1, s4, 785
                  slti         ra, s11, -4
                  srai         t0, s0, 26
                  c.nop
                  c.li         a2, -1
                  c.and        a5, a3
                  ori          a5, s1, -1851
                  sra          s10, s0, s0
                  slti         a0, ra, 596
                  ori          s4, a6, -332
                  sra          t2, s1, a4
                  lui          a3, 182523
                  c.and        a1, s1
                  c.addi4spn   s1, sp, 1008
                  slti         t4, a0, 1213
                  sub          s10, a4, t6
                  andi         s5, a3, 261
                  c.andi       a2, -1
                  and          s11, t5, gp
                  divu         a1, a3, ra
                  andi         sp, zero, -1731
                  andi         t4, a0, 1454
                  srai         t5, gp, 25
                  srl          a5, s3, a0
                  c.srli       a0, 18
                  sltu         t2, t1, s11
                  and          a0, a6, t2
                  sltiu        s10, a1, 1296
                  div          s10, t3, sp
                  c.addi4spn   a5, sp, 192
                  srli         s0, gp, 17
                  mulhsu       a3, sp, t5
                  and          tp, t4, zero
                  rem          s9, s8, s0
                  c.addi4spn   a5, sp, 32
                  c.and        a2, a5
                  slli         gp, s3, 28
                  c.addi16sp   sp, 16
                  mulhu        gp, ra, a2
                  c.xor        s0, a5
                  mul          s5, s9, s5
                  and          s9, s8, t4
                  mulhsu       a6, a7, gp
                  xor          t5, s3, s2
                  sra          s3, s8, t1
                  add          a5, s10, t2
                  remu         a3, s6, t3
                  ori          s8, s11, -1515
                  sra          a0, s4, tp
                  c.xor        a0, a2
                  add          a0, a1, a2
                  sltu         a5, s2, t5
                  ori          t0, t1, 123
                  sub          zero, a3, a2
                  c.add        ra, s7
                  c.andi       a1, -1
                  mul          a7, a0, ra
                  sub          a2, s0, zero
                  sra          t4, s6, s3
                  rem          a3, tp, a0
                  c.and        a1, a1
                  add          t0, t3, a1
                  c.andi       s1, 3
                  sltu         a0, tp, s5
                  c.srli       s1, 25
                  xor          sp, s11, ra
                  sltiu        a5, s10, 158
                  divu         a2, t4, s6
                  srai         t4, t1, 2
                  lui          tp, 264470
                  lui          s10, 975156
                  or           tp, s0, t0
                  c.slli       s4, 29
                  c.add        s5, t5
                  and          s7, t2, t6
                  sub          t0, s8, s9
                  or           a7, t5, a1
                  add          s0, t5, t5
                  sltu         s2, t0, a4
                  mulhu        sp, s11, zero
                  xori         a7, t1, -1999
                  nop
                  c.addi16sp   sp, -16
                  slti         s4, zero, 1612
                  c.srli       a4, 26
                  slt          a6, s2, zero
                  sra          t0, tp, a5
                  srli         s5, t6, 26
                  c.srli       a3, 9
                  nop
                  mulhsu       a7, s1, a5
                  add          s9, s4, sp
                  rem          a5, a6, s2
                  sra          s7, s10, s2
                  add          s7, s9, a2
                  srai         s3, a1, 19
                  srai         a3, t5, 25
                  c.andi       a0, 0
                  mulhsu       s3, a4, a7
                  c.mv         a6, s6
                  mulhu        s3, zero, s4
                  sltu         t5, a2, gp
                  mul          s1, s4, s3
                  sltiu        s7, s5, 1489
                  srl          s3, t5, gp
                  c.slli       tp, 13
                  c.slli       gp, 22
                  c.add        s8, s3
                  xori         a3, a7, -684
                  divu         s11, a7, s1
                  rem          zero, a6, s8
                  rem          s6, s9, t3
                  sltiu        s1, s11, 751
                  sra          a3, zero, t5
                  c.add        t2, gp
                  c.and        a1, a2
                  c.srai       a3, 21
                  divu         t4, a2, a2
                  and          a3, a4, a0
                  divu         s6, s8, s2
                  lui          zero, 414453
                  addi         t5, s10, 1272
                  sltu         a5, s4, s7
                  andi         a6, ra, -1636
                  c.sub        a1, a0
                  mulhu        a6, t6, zero
                  c.lui        a4, 1
                  srai         ra, t1, 1
                  slti         a2, s0, 1679
                  and          t4, t5, s10
                  sll          s8, a7, s8
                  auipc        a0, 206949
                  xori         s1, tp, -781
                  remu         t4, t0, t6
                  c.andi       s1, 25
                  slli         gp, a7, 25
                  c.andi       a0, -1
                  slli         gp, t5, 24
                  slt          ra, s7, s7
                  auipc        a7, 483459
                  mulhsu       a0, a3, s7
                  xori         a5, a3, -475
                  slli         a4, t4, 23
                  xori         ra, zero, -1425
                  c.lui        a1, 17
                  sub          s4, s3, sp
                  c.andi       a0, 19
                  srl          s8, gp, a5
                  c.andi       s1, 20
                  addi         a1, s5, -323
                  slt          a7, sp, t4
                  xori         a6, s9, 1969
                  add          zero, s3, t1
                  xori         ra, s11, 1812
                  mulh         gp, s9, sp
                  c.sub        a1, s0
                  mulhsu       tp, s4, t1
                  c.sub        a1, a1
                  divu         tp, s10, t5
                  c.or         s0, a5
                  divu         s6, s10, t2
                  c.nop
                  divu         s1, s11, zero
                  srl          s2, t6, a6
                  ori          t5, t2, 1351
                  slli         a5, s8, 20
                  sub          tp, s7, s8
                  srl          zero, s11, s8
                  auipc        a6, 851330
                  c.addi4spn   a3, sp, 544
                  slti         a4, a1, -1071
                  srai         a2, ra, 18
                  c.nop
                  c.add        t5, gp
                  nop
                  mulhsu       s11, s10, s6
                  xori         a7, t6, 335
                  sub          a6, s7, t4
                  c.li         t4, -1
                  c.mv         tp, t3
                  c.slli       t4, 21
                  slti         ra, ra, 1831
                  c.srli       a5, 4
                  remu         zero, a1, tp
                  and          s11, t0, s11
                  c.and        a1, a1
                  c.sub        a0, a5
                  addi         a1, s11, -323
                  mulh         s6, s8, a2
                  add          s8, tp, tp
                  ori          s6, t5, 499
                  c.sub        s0, a3
                  c.addi16sp   sp, -16
                  c.srli       s0, 29
                  c.lui        a3, 2
                  c.or         a5, a1
                  mulhsu       s2, t4, s11
                  and          s11, s4, tp
                  mulhsu       s9, t4, s3
                  c.addi16sp   sp, 128
                  c.srai       a1, 11
                  c.or         a2, a5
                  slt          s3, s5, s6
                  c.or         a4, a5
                  sra          s11, s7, a5
                  lui          a7, 167240
                  c.mv         a6, a2
                  srai         a0, ra, 15
                  srli         gp, sp, 26
                  xori         zero, t3, 1049
                  sltu         s3, s6, a5
                  mul          s5, s3, t3
                  c.li         a5, -1
                  sltiu        s1, a3, 399
                  xori         s7, s3, -1303
                  c.addi16sp   sp, -16
                  c.or         a3, a1
                  mulhu        s8, gp, s2
                  slli         s6, a2, 21
                  mulhsu       t4, s2, t2
                  ori          s0, s5, -226
                  c.or         a5, s1
                  sub          zero, t1, sp
                  c.andi       a3, 2
                  auipc        s6, 104480
                  addi         zero, a4, 1089
                  c.lui        ra, 8
                  c.andi       a5, 22
                  c.srai       a0, 13
                  srl          s11, s7, s1
                  and          a0, t4, zero
                  or           a4, zero, t0
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
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_2:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_3:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_4:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_5:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_6:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_7:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_8:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_9:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_10:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_11:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_12:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_13:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_14:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_15:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
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
                  .option rvc;

mmode_exception_handler:
                  addi x6, x6, -4
                  sw  x31, (x6)
                  add x31, x6, zero
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
                  add x6, x31, zero
                  csrr x11, 0x341 # MEPC
                  csrr x11, 0x342 # MCAUSE
                  li x5, 0x3 # BREAKPOINT
                  beq x11, x5, ebreak_handler
                  li x5, 0x8 # ECALL_UMODE
                  beq x11, x5, ecall_handler
                  li x5, 0x9 # ECALL_SMODE
                  beq x11, x5, ecall_handler
                  li x5, 0xb # ECALL_MMODE
                  beq x11, x5, ecall_handler
                  li x5, 0x1
                  beq x11, x5, instr_fault_handler
                  li x5, 0x5
                  beq x11, x5, load_fault_handler
                  li x5, 0x7
                  beq x11, x5, store_fault_handler
                  li x5, 0xc
                  beq x11, x5, pt_fault_handler
                  li x5, 0xd
                  beq x11, x5, pt_fault_handler
                  li x5, 0xf
                  beq x11, x5, pt_fault_handler
                  li x5, 0x2 # ILLEGAL_INSTRUCTION
                  beq x11, x5, illegal_instr_handler
                  csrr x5, 0x343 # MTVAL
                  1: la x28, test_done
                  jalr x1, x28, 0

ecall_handler:    
                  la x11, _start
                  sw x0, 0(x11)
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  la x28, write_tohost
                  jalr x0, x28, 0

instr_fault_handler:
                  add x31, x6, zero
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
                  add x6, x31, zero
                  lw  x31, (x6)
                  addi x6, x6, 4
                  mret

load_fault_handler:
                  add x31, x6, zero
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
                  add x6, x31, zero
                  lw  x31, (x6)
                  addi x6, x6, 4
                  mret

store_fault_handler:
                  add x31, x6, zero
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
                  add x6, x31, zero
                  lw  x31, (x6)
                  addi x6, x6, 4
                  mret

ebreak_handler:   
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  add x31, x6, zero
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
                  add x6, x31, zero
                  lw  x31, (x6)
                  addi x6, x6, 4
                  mret

illegal_instr_handler:
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  add x31, x6, zero
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
                  add x6, x31, zero
                  lw  x31, (x6)
                  addi x6, x6, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x11, 0x300 # MSTATUS;
                  csrr  x11, 0x304 # MIE;
                  csrr  x11, 0x344 # MIP;
                  csrrc x11, 0x344, x11 # MIP;
                  add x31, x6, zero
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
                  add x6, x31, zero
                  lw  x31, (x6)
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
