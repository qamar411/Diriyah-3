.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x14, h0_start
jalr x0, x14, 0
h0_start:
                  li x5, 0x40001105
                  csrw 0x301, x5
kernel_sp:        
                  la x10, kernel_stack_end

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
                  li x5, 0x1800
                  csrw 0x300, x5 # MSTATUS
                  li x5, 0x0
                  csrw 0x304, x5 # MIE
                  mret
init:             
                  li x0, 0x0
                  li x1, 0xf69e4c45
                  li x2, 0x80000000
                  li x3, 0xfe8e8c39
                  li x4, 0x0
                  li x5, 0x267993d4
                  li x6, 0xf0ea0bfd
                  li x7, 0x80000000
                  li x8, 0x8
                  li x9, 0xf
                  li x11, 0x80000000
                  li x12, 0x80000000
                  li x13, 0x0
                  li x14, 0x0
                  li x15, 0xf45bf1e9
                  li x16, 0x80000000
                  li x17, 0x80000000
                  li x18, 0x3
                  li x19, 0x5
                  li x20, 0x0
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x24, 0x3cca071a
                  li x25, 0xfde2a2f1
                  li x26, 0x80000000
                  li x27, 0x8
                  li x28, 0x0
                  li x29, 0x0
                  li x30, 0x80000000
                  li x31, 0x0
                  la x23, user_stack_end
main:             la           gp, region_1+258 #start riscv_load_store_rand_instr_stream_0
                  lb           a6, 217(gp)
                  lbu          s3, -136(gp)
                  lb           t1, 65(gp)
                  sh           zero, -104(gp)
                  lbu          s9, 153(gp)
                  srli         t1, t2, 12
                  sb           ra, 155(gp)
                  sb           s2, 0(gp)
                  sb           a2, -187(gp)
                  sb           a0, -59(gp)
                  c.sub        a5, a4
                  c.slli       a2, 13
                  xor          s10, t1, s1
                  slt          ra, s10, tp
                  c.srai       a2, 22
                  c.srli       s0, 16
                  sw           a7, -210(gp)
                  slli         s2, s4, 11
                  auipc        a7, 383574
                  c.addi4spn   a2, sp, 80
                  c.and        a5, a2
                  lhu          sp, 68(gp)
                  sh           s0, -158(gp)
                  andi         a2, t1, 1188
                  sb           s1, 129(gp)
                  c.xor        s0, a2
                  lb           a7, -160(gp)
                  mulhsu       tp, a1, s6
                  rem          s10, zero, ra
                  nop
                  lw           a6, 214(gp)
                  sltu         s6, s8, a7
                  div          s6, s10, t6
                  lh           a3, 200(gp)
                  sra          t5, a7, s10
                  ori          s6, s7, 1240
                  sb           t1, -103(gp)
                  mulh         t6, a2, t5
                  divu         s5, s0, a7
                  addi         sp, t1, 192
                  lb           t2, 82(gp) #end riscv_load_store_rand_instr_stream_0
                  la           sp, region_1+719 #start riscv_load_store_rand_instr_stream_2
                  sh           s5, 865(sp)
                  lbu          ra, 117(sp)
                  sb           s2, 399(sp)
                  lbu          a7, 1108(sp)
                  lh           t3, 1019(sp)
                  lb           s2, -258(sp)
                  sltiu        a2, s0, -1380
                  lbu          t2, -176(sp)
                  lb           zero, 304(sp)
                  lw           a5, -203(sp)
                  sb           gp, 1126(sp)
                  slli         t4, s10, 10
                  sll          gp, a4, a1
                  sb           t1, 353(sp)
                  lbu          a5, -34(sp)
                  c.or         a1, a3
                  sb           s2, -688(sp)
                  c.xor        a2, s1
                  xor          s2, gp, s10
                  c.nop
                  lw           t0, 997(sp)
                  lb           zero, 178(sp)
                  sb           gp, 308(sp)
                  ori          a5, a1, -2006
                  lb           s0, 492(sp)
                  lb           t6, -254(sp)
                  c.nop
                  c.or         a2, a0
                  andi         a7, tp, -1482
                  srl          tp, t3, a4
                  sw           s1, 845(sp)
                  and          zero, s3, t4
                  lbu          s1, 266(sp) #end riscv_load_store_rand_instr_stream_2
                  la           s1, region_1+1054 #start riscv_load_store_rand_instr_stream_7
                  slti         t2, s11, 1384
                  rem          s5, ra, s9
                  sb           zero, -171(s1)
                  c.and        a2, a5
                  sb           s4, 111(s1)
                  c.addi4spn   a5, sp, 576
                  c.add        s9, a4
                  lbu          gp, 205(s1)
                  andi         s5, s4, 547
                  auipc        t4, 226503
                  srli         ra, s3, 15
                  lb           s2, 9(s1)
                  addi         a3, a4, -1567
                  or           t0, s0, tp
                  mulhu        s3, s7, tp
                  sltu         s8, s9, s11
                  c.srli       a5, 3
                  lbu          a1, -64(s1)
                  sb           a5, 221(s1)
                  add          a3, a7, s8
                  lh           tp, -244(s1)
                  c.li         ra, -1
                  srai         a3, s3, 15
                  sh           a6, 0(s1)
                  lhu          s6, 210(s1)
                  lbu          zero, -70(s1)
                  c.li         s9, -1
                  c.andi       a5, -1
                  lui          t1, 391969
                  sll          a7, tp, s2
                  c.mv         tp, s4
                  srl          gp, s6, s2
                  lbu          t4, 9(s1) #end riscv_load_store_rand_instr_stream_7
                  la           a3, region_0+1729 #start riscv_load_store_rand_instr_stream_5
                  sb           t4, 13(a3)
                  c.addi       t0, 20
                  lb           s2, -3(a3)
                  sb           s5, 9(a3)
                  c.addi4spn   a5, sp, 896
                  c.slli       t6, 6
                  c.addi       tp, 11
                  lbu          s1, -10(a3)
                  lbu          s3, -11(a3)
                  lbu          a5, -6(a3)
                  lhu          a2, -1(a3)
                  c.sub        s1, a2
                  sh           a2, 5(a3)
                  sh           tp, 5(a3)
                  sb           a4, -4(a3)
                  lh           a2, 9(a3)
                  sb           s3, 12(a3)
                  lb           a2, -3(a3)
                  lbu          t5, 15(a3)
                  lh           s5, 3(a3)
                  sub          a1, s1, s6
                  lh           s2, 1(a3)
                  slt          s10, t6, t2
                  c.nop
                  sb           t0, -8(a3)
                  auipc        t0, 378942
                  lhu          gp, -11(a3)
                  or           t4, a0, gp
                  ori          s5, a3, -1920
                  or           a1, t1, s11
                  sw           a1, -13(a3)
                  lh           s4, -3(a3) #end riscv_load_store_rand_instr_stream_5
                  la           s3, region_1+1589 #start riscv_load_store_rand_instr_stream_1
                  c.nop
                  lh           a1, -1451(s3)
                  c.lui        s8, 13
                  lb           a3, -164(s3)
                  xor          a7, t3, gp
                  sw           t6, -585(s3)
                  lb           s1, -1523(s3)
                  c.sub        s0, s1
                  sltiu        s10, t5, 2002
                  c.add        a2, tp
                  mulhsu       s1, a3, t2
                  sub          t3, s0, s4
                  add          t6, t5, s0
                  lbu          a5, -290(s3)
                  sh           a2, -1125(s3)
                  c.addi16sp   sp, -16
                  lbu          t4, 138(s3)
                  c.srai       a3, 4
                  and          s2, s6, t5
                  andi         gp, s5, -470
                  sb           t6, -1290(s3)
                  nop
                  sw           s11, -913(s3)
                  xor          s2, t5, t1
                  lb           t6, -1017(s3)
                  ori          s2, s2, 1659
                  lh           a7, -53(s3)
                  c.slli       t1, 11
                  add          t1, s6, a1
                  sb           a6, -704(s3)
                  lbu          a3, 110(s3)
                  div          ra, a7, s3
                  lw           t6, -145(s3)
                  divu         t5, tp, a3
                  sb           t6, -1190(s3)
                  c.add        t1, a4
                  lb           s9, -1470(s3)
                  c.addi       s0, 3
                  srl          a6, t3, s2
                  lb           t5, -230(s3)
                  c.or         a3, a1
                  xori         a1, s8, 795
                  lb           a2, -119(s3)
                  lb           t1, -1554(s3)
                  lb           s9, -1323(s3)
                  auipc        s1, 71648
                  sh           a6, -1397(s3)
                  sb           s1, 0(s3)
                  lbu          s2, -414(s3)
                  sltu         t1, gp, s5
                  xori         s2, s8, 632
                  sw           t4, -225(s3)
                  lb           a3, -1023(s3)
                  lbu          s6, -605(s3)
                  slli         a1, a0, 24
                  andi         s2, t1, 1401
                  lb           a1, -123(s3) #end riscv_load_store_rand_instr_stream_1
                  la           sp, region_1+1462 #start riscv_load_store_rand_instr_stream_6
                  lb           s9, -15(sp)
                  slti         s1, t1, 87
                  sb           t2, 3(sp)
                  c.li         ra, 5
                  lbu          s1, 63(sp)
                  sb           a7, 35(sp)
                  lhu          tp, -30(sp)
                  lbu          t3, -2(sp)
                  lh           ra, -36(sp)
                  sb           a2, -21(sp)
                  lbu          gp, -32(sp)
                  lbu          t5, -1(sp)
                  c.sub        a3, a2
                  mulhu        a6, zero, a0
                  lh           a6, 18(sp)
                  lhu          t4, 28(sp)
                  c.addi       tp, -1
                  sb           s6, -43(sp)
                  sb           a4, 41(sp)
                  sw           s7, 22(sp)
                  c.addi       t5, 5
                  sw           t6, 10(sp)
                  c.srai       s0, 21
                  lbu          tp, -41(sp)
                  lh           s6, -22(sp)
                  lw           t3, -30(sp)
                  sb           a1, 59(sp)
                  lbu          t0, -11(sp)
                  sh           a5, -30(sp)
                  xori         a6, s0, 412
                  lb           t4, 35(sp)
                  sh           a4, -48(sp)
                  sb           s7, -56(sp)
                  c.mv         tp, s11
                  sb           a3, 55(sp)
                  lh           tp, 52(sp)
                  lbu          ra, -31(sp)
                  sb           s3, 47(sp)
                  mulh         a7, a4, s10
                  lhu          ra, -10(sp) #end riscv_load_store_rand_instr_stream_6
                  la           s8, region_0+882 #start riscv_load_store_rand_instr_stream_12
                  lui          t3, 289900
                  sb           s2, -16(s8)
                  lb           s1, 5(s8)
                  srl          s6, a1, ra
                  slt          t6, a0, s4
                  lb           s11, 13(s8)
                  lb           s4, -8(s8)
                  c.addi4spn   a1, sp, 288
                  lbu          a1, -11(s8)
                  lb           t4, -4(s8)
                  c.or         a2, a2
                  sll          t1, s9, ra
                  addi         s9, s9, -1558
                  sb           s3, -13(s8)
                  sh           t3, 0(s8)
                  sb           s3, -12(s8)
                  lbu          s2, -9(s8)
                  lh           t4, 16(s8)
                  div          t4, t0, s4
                  c.nop
                  remu         s1, s6, zero
                  c.or         a1, a1
                  c.li         gp, 0
                  c.add        t1, a0
                  sltiu        t6, a5, 1792
                  lb           s10, -16(s8)
                  sub          tp, a0, a5
                  c.or         a1, a0
                  addi         sp, s11, -1675
                  c.xor        s1, a2
                  mulh         s9, s11, s8
                  sb           sp, -13(s8) #end riscv_load_store_rand_instr_stream_12
                  la           sp, region_1+542 #start riscv_load_store_rand_instr_stream_9
                  sh           a3, -52(sp)
                  lhu          t1, 40(sp)
                  slti         s4, s4, -773
                  lb           s9, 17(sp)
                  slt          s0, t4, sp
                  xori         a7, a4, -557
                  c.sub        a3, a0
                  sb           a4, -53(sp)
                  rem          zero, s0, a4
                  sb           a5, 24(sp)
                  and          s9, gp, a1
                  lui          zero, 405490
                  sll          a2, t1, a3
                  lb           a6, -63(sp)
                  sub          s10, a2, a2
                  c.sub        s0, s0
                  sll          t6, a1, a3
                  sh           s10, -32(sp)
                  lui          t2, 671453
                  c.mv         s8, gp
                  c.nop
                  lb           t0, 19(sp)
                  sb           s5, -13(sp)
                  c.xor        a1, a0
                  auipc        t3, 138560
                  xori         t4, s2, 2023
                  mul          gp, s2, gp
                  lh           s9, -10(sp)
                  lw           t4, -38(sp)
                  mul          s6, t6, a5
                  andi         s6, a1, 1988
                  sb           a1, 17(sp)
                  sb           s2, 46(sp)
                  mulhsu       t2, a3, s11
                  sltiu        a3, s4, -1790
                  lb           t3, 62(sp)
                  lbu          gp, 57(sp)
                  or           t5, s8, a6
                  divu         t4, s9, a1
                  or           s8, t3, t2
                  lb           s4, -43(sp)
                  sb           t5, -11(sp)
                  sh           t5, -16(sp)
                  lb           s8, -19(sp)
                  srli         gp, s2, 8
                  lb           s0, -57(sp) #end riscv_load_store_rand_instr_stream_9
                  la           sp, region_0+649 #start riscv_load_store_rand_instr_stream_10
                  lbu          s1, 20(sp)
                  lui          s4, 648207
                  srl          a2, a2, zero
                  srli         t6, a3, 12
                  lbu          a5, 12(sp)
                  c.srai       a2, 31
                  c.li         s2, -1
                  sh           a5, -33(sp)
                  sb           s0, -42(sp)
                  sb           s1, 44(sp)
                  lbu          s9, 53(sp)
                  c.sub        a5, s1
                  sub          t2, t0, a7
                  or           s2, a2, s10
                  andi         t1, s2, -657
                  c.slli       s8, 9
                  lw           a2, 47(sp)
                  c.xor        a5, a3
                  xori         t1, t0, 1719
                  c.srli       s1, 9
                  ori          a7, t2, 1471
                  sltiu        s0, s2, 1476
                  c.and        a5, a2
                  sw           s1, 23(sp)
                  div          t3, s4, s1
                  c.nop
                  lbu          t2, 58(sp)
                  lb           a7, 56(sp) #end riscv_load_store_rand_instr_stream_10
                  la           sp, region_1+1150 #start riscv_load_store_rand_instr_stream_14
                  rem          t6, zero, t6
                  sh           t4, 12(sp)
                  lbu          t0, 51(sp)
                  mulhu        s1, a1, s2
                  srl          t6, t0, s1
                  sb           a1, -31(sp)
                  ori          ra, a3, -796
                  and          s3, a6, t1
                  sb           s5, 47(sp)
                  c.sub        a2, s0
                  mul          a5, s7, s3
                  sb           s5, 63(sp)
                  lbu          t5, -17(sp)
                  lbu          s5, 35(sp)
                  srli         a5, s5, 26
                  slti         a5, s0, 1610
                  sub          ra, s1, t6
                  auipc        s11, 688150
                  lb           t4, -25(sp)
                  sh           t2, -54(sp)
                  and          s0, tp, s5
                  lhu          a2, 50(sp) #end riscv_load_store_rand_instr_stream_14
                  c.xor        a2, a1
                  c.and        a1, a0
                  c.lui        t1, 22
                  beq          a2, t4, 14f
                  sra          s11, s8, s6
                  bltu         s11, s9, 7f
                  rem          a3, s5, t4
7:                c.mv         s10, a6
                  add          a6, t1, ra
                  c.bnez       a2, 10f
10:               nop
                  and          s4, t5, t6
                  sra          sp, sp, t0
                  c.srli       s1, 8
14:               mulh         a1, t6, s9
                  nop
                  lui          s8, 276215
                  slli         zero, tp, 23
                  andi         s3, t3, 696
                  auipc        sp, 958484
                  divu         t6, a3, s4
                  c.lui        a6, 2
                  nop
                  mulhu        s1, s11, s1
                  lui          a5, 968195
                  slli         s8, a5, 7
                  add          s10, t5, sp
                  rem          a5, s0, sp
                  c.mv         s2, s9
                  mulh         zero, t5, s0
                  mulhu        t2, t4, a3
                  mulhsu       s4, a0, t5
                  rem          a1, tp, a5
                  lui          s4, 446323
                  c.or         a1, a0
                  and          a1, s0, s1
                  c.beqz       s1, 44f
                  c.li         s6, -1
                  mulhu        s3, sp, s5
                  c.addi4spn   a5, sp, 496
                  auipc        s10, 1026620
                  add          s9, s11, a4
                  slt          t6, sp, s9
                  c.lui        t1, 15
44:               divu         zero, t5, s6
                  sltu         t6, s4, a7
                  srli         zero, s3, 6
                  sltiu        t4, a7, -878
                  c.bnez       a2, 64f
                  c.lui        t1, 9
                  c.and        s0, a1
                  la           sp, region_0+1659 #start riscv_load_store_rand_instr_stream_4
                  lbu          t4, -230(sp)
                  nop
                  auipc        a2, 604457
                  sw           s5, 125(sp)
                  nop
                  sh           a7, 181(sp)
                  lui          t5, 43344
                  lbu          a6, -98(sp)
                  sb           s11, 72(sp)
                  c.nop
                  mulhu        s10, s9, s8
                  lhu          s8, -181(sp)
                  sb           s8, 149(sp)
                  divu         s6, t6, sp
                  divu         s6, a3, s4
                  add          s0, a5, tp
                  lb           a2, -232(sp)
                  lhu          s8, -1(sp)
                  lb           a7, 52(sp)
                  sb           gp, 103(sp)
                  lhu          tp, 191(sp)
                  c.slli       t1, 29
                  c.srli       a2, 17
                  lb           s11, -177(sp)
                  mulhu        s1, zero, s10
                  xor          a5, a7, t1
                  lbu          a3, -96(sp)
                  c.srai       a2, 3
                  sub          t6, tp, s6
                  c.and        s0, s1
                  srl          t2, a7, s10
                  lbu          a2, 160(sp)
                  addi         s4, a7, -581
                  lbu          a6, -136(sp)
                  sltiu        t2, s1, 1846
                  sb           tp, 240(sp) #end riscv_load_store_rand_instr_stream_4
                  c.beqz       a2, 59f
                  remu         s10, s1, a0
                  andi         s10, zero, -872
                  c.add        s1, t2
                  c.lui        t3, 26
                  and          a1, tp, sp
                  and          t5, s6, s3
                  c.addi       sp, -1
59:               srli         a6, s4, 27
                  c.bnez       a3, 76f
                  mulhu        a6, zero, s10
                  srl          t3, a4, gp
                  slt          s2, a4, a5
64:               bgeu         t5, s2, 83f
                  c.li         a1, 21
                  c.addi       s3, -1
                  c.addi4spn   a5, sp, 544
                  c.li         gp, -1
                  c.nop
                  c.slli       t6, 24
                  c.beqz       a3, 72f
72:               c.nop
                  blt          a5, s5, 75f
                  and          t5, a3, s8
75:               sltu         s9, gp, s11
76:               c.slli       a2, 15
                  c.add        t4, s9
                  c.addi4spn   a2, sp, 560
                  bge          s2, s9, 92f
                  rem          t0, a3, s6
                  remu         a1, s1, t5
                  andi         a7, a5, 1015
83:               addi         a5, s7, -1261
                  or           a2, s6, t1
                  srl          a5, a0, s4
                  c.addi16sp   sp, -16
                  c.sub        a1, s1
                  c.sub        a5, a2
                  c.add        s4, ra
                  c.addi       s0, -1
                  srli         t2, a4, 31
92:               sltiu        t3, t2, -1496
                  c.mv         s5, t1
                  c.mv         s0, s9
                  c.sub        s0, a1
                  c.slli       t4, 23
                  and          s0, sp, a6
                  slti         s1, a5, 1331
                  c.addi4spn   s1, sp, 784
                  bltu         a2, a4, 103f
                  c.or         a1, s0
                  c.li         s11, 24
103:              c.addi4spn   a3, sp, 448
                  slti         s10, gp, -1382
                  c.or         s1, a0
                  bge          t0, zero, 116f
                  la           s4, region_1+445 #start riscv_load_store_rand_instr_stream_13
                  or           t2, t6, s5
                  sub          t3, gp, t4
                  lh           a5, -251(s4)
                  addi         s2, s3, -1185
                  lbu          a7, 78(s4)
                  lb           a7, -30(s4)
                  c.xor        a1, a5
                  mulhsu       t6, t5, s0
                  lhu          s11, 49(s4)
                  mulhsu       ra, a6, s6
                  lbu          s6, -40(s4)
                  lbu          t2, -2(s4)
                  lbu          t1, 118(s4)
                  c.sub        s0, a2
                  lb           t1, 26(s4)
                  srl          s2, a0, t5
                  lh           a7, 101(s4)
                  lb           t4, -94(s4)
                  srl          s5, s5, s0
                  slt          s3, t5, t1
                  addi         a2, s10, 1127
                  mulh         t3, s11, s2
                  rem          t3, s8, t2
                  c.or         a5, a3
                  slti         t4, a0, -871
                  c.slli       tp, 27
                  lbu          t2, -186(s4)
                  rem          s10, t3, t5
                  c.srli       a1, 5
                  lh           a7, -167(s4)
                  c.addi       s2, -1
                  lh           a2, -111(s4)
                  lb           s10, -130(s4)
                  lb           s3, -62(s4)
                  xor          gp, gp, a3
                  sw           a5, 99(s4)
                  c.nop
                  c.srai       a2, 19
                  lb           a6, -80(s4)
                  lbu          t0, -126(s4) #end riscv_load_store_rand_instr_stream_13
                  blt          s11, a3, 121f
                  div          zero, t3, t3
                  c.andi       a3, 2
                  la           tp, sub_2
                  slli         a1, s6, 12
                  sra          t3, s1, s7
                  mulh         a1, a4, s6
                  addi         tp, tp, 795
                  c.or         s1, a1
                  bgeu         t1, a0, main_j3 #branch to jump instr
                  addi         a6, t5, -1206
                  c.sub        a1, s0
                  c.addi4spn   a5, sp, 752
main_j3:          jalr         t1, tp, -794 #jump main -> sub_2
                  beq          t6, zero, 117f
                  c.sub        s0, a1
                  addi         sp, s11, 25
                  and          s10, s4, t5
                  srli         a5, t6, 17
                  bltu         t1, s9, 123f
116:              slli         t4, a4, 18
117:              sltu         s0, t4, s2
                  div          s5, s6, a1
                  c.mv         s0, s10
                  c.xor        s1, a3
121:              c.addi       s4, -1
                  c.nop
123:              c.nop
                  bge          t6, zero, 140f
                  add          a1, s3, s8
                  slt          a2, t1, s3
                  c.and        a5, a1
                  sltiu        t1, a6, 1196
                  c.nop
                  lui          t2, 723891
                  divu         a2, a6, s2
                  auipc        s1, 1007545
                  c.nop
                  nop
                  remu         sp, s1, a4
                  andi         a5, t5, 405
                  addi         a3, a2, -99
                  c.slli       s5, 20
                  c.srai       s0, 19
140:              c.sub        a3, a0
                  c.and        a2, s1
                  divu         t2, gp, s6
                  mulh         t2, a5, a4
                  andi         ra, t2, 1556
                  srai         tp, a2, 0
                  sltu         a3, a5, tp
                  mul          tp, t6, s0
                  bne          a3, a3, 158f
                  mulhu        s9, s3, ra
                  sltu         sp, s3, t3
                  srli         a7, t3, 6
                  sltu         t1, s4, sp
                  remu         s1, sp, s2
                  bne          zero, s1, 170f
                  c.or         s0, a1
                  c.and        a5, s1
                  mul          s6, s5, zero
158:              add          s2, a3, t0
                  c.sub        a2, a2
                  addi         tp, t0, 579
                  bgeu         t3, s2, 180f
                  rem          s5, s11, a0
                  xor          s9, gp, a7
                  add          t3, t1, sp
                  add          s4, t1, s0
                  lui          t6, 873951
                  c.addi16sp   sp, -16
                  srli         s0, a5, 4
                  c.srli       a1, 26
170:              slli         s6, a5, 26
                  mulhsu       tp, ra, t1
                  c.beqz       a1, 183f
                  bge          t2, a4, 184f
                  srli         s3, s4, 12
                  beq          s6, sp, 194f
                  and          s4, s10, s3
                  slti         a2, s2, -419
                  ori          ra, t4, 970
                  divu         s9, t6, sp
180:              ori          s10, a7, 889
                  blt          s8, sp, 196f
                  c.mv         gp, s9
183:              divu         s6, s2, sp
184:              c.addi4spn   a2, sp, 720
                  c.li         a7, 20
                  c.addi4spn   s0, sp, 592
                  c.and        s0, a1
                  mulhu        s10, s2, s10
                  slli         t4, a6, 8
                  sub          a6, s11, a4
                  c.lui        a3, 27
                  c.and        s1, a4
                  mulhu        t6, a6, s4
194:              sll          a5, s5, gp
                  sra          a3, s5, t0
196:              c.mv         gp, a3
                  c.lui        s4, 12
                  div          s4, zero, s11
                  c.srli       a5, 4
                  c.or         a3, a4
                  slt          t6, t5, ra
                  auipc        a2, 78498
                  blt          a2, s9, 221f
                  c.beqz       s0, 220f
                  bge          a4, a4, 212f
                  c.add        s1, s8
                  slti         t1, t3, -1785
                  bltu         t1, s10, 213f
                  slli         s8, s2, 11
                  c.li         t2, 10
                  c.nop
212:              mulh         t3, t5, s11
213:              bge          zero, s6, 230f
                  blt          a6, a2, 218f
                  auipc        s4, 640185
                  xori         a6, a1, -718
                  mul          t1, s2, s5
218:              bgeu         s2, tp, 226f
                  bltu         s9, s4, 230f
220:              remu         a2, t2, a7
221:              c.lui        a1, 21
                  srai         a6, s9, 6
                  c.srai       s0, 31
                  c.srli       a1, 7
                  andi         a1, s8, 533
226:              sltu         t6, a0, a7
                  or           s5, a1, a6
                  bge          s9, s7, 238f
                  c.addi4spn   a5, sp, 224
230:              mulh         s4, t0, t5
                  mul          sp, a3, t4
                  bne          s8, s9, 251f
                  c.addi16sp   sp, -16
                  c.srai       s0, 6
                  remu         zero, s4, s3
                  c.addi       t0, 25
                  sra          a6, t5, a3
238:              slti         a2, s0, -1454
                  c.addi16sp   sp, -16
                  slti         t6, a4, 281
                  and          a1, a5, a2
                  mulhsu       t1, a6, s11
                  c.xor        s0, a2
                  c.addi16sp   sp, 32
                  c.mv         s3, gp
                  c.slli       s8, 30
                  c.or         a5, a0
                  srai         s5, s0, 15
                  sll          s9, s9, t0
                  xor          t6, ra, a2
251:              c.addi4spn   s0, sp, 144
                  xor          tp, tp, s11
                  c.andi       a5, -1
                  bne          s6, a3, 267f
                  c.or         a1, s0
                  and          s9, s11, t4
                  c.srli       a5, 29
                  mulhsu       s6, t5, s2
                  c.andi       a3, -1
                  slti         ra, t0, -1046
                  sra          t6, t4, t1
                  div          a6, a7, s10
                  c.andi       a2, -1
                  auipc        t1, 596003
                  remu         s3, s11, a1
                  bne          s3, s6, 284f
267:              c.slli       t0, 27
                  c.and        a3, a1
                  c.srli       s0, 15
                  c.lui        s0, 25
                  c.lui        s9, 24
                  srai         s2, s3, 9
                  divu         s11, a0, zero
                  add          s2, s5, t0
                  c.addi4spn   s0, sp, 864
                  c.srai       a5, 23
                  mulhu        gp, a2, s6
                  mulhu        a5, ra, t5
                  c.xor        s1, a3
                  sra          s4, t3, ra
                  mulhu        a5, a6, a4
                  c.nop
                  div          s4, t3, a4
284:              and          t1, s6, sp
                  c.addi16sp   sp, -16
                  bgeu         a3, gp, 297f
                  xor          s4, t2, s8
                  div          s8, t6, t2
                  srli         t4, t0, 11
                  c.addi16sp   sp, -16
                  bge          s1, s7, 310f
                  sub          s11, tp, s9
                  srai         s2, a2, 20
                  c.addi       t0, -1
                  add          s8, t6, s10
                  c.srai       a2, 8
297:              slti         t3, tp, 643
                  srai         ra, tp, 28
                  c.mv         s3, t4
                  c.mv         s10, a6
                  slti         a6, a0, -1117
                  remu         t2, s5, s7
                  c.or         a3, a0
                  mulh         a5, t0, a4
                  bge          s11, gp, 306f
306:              and          s5, a3, a4
                  c.lui        gp, 9
                  add          s11, zero, tp
                  c.srai       a5, 15
310:              c.add        s9, a2
                  andi         s10, t5, 27
                  auipc        s11, 464237
                  c.and        s1, a4
                  div          s2, s7, sp
                  c.slli       ra, 13
                  xor          s2, s2, gp
                  c.and        a1, a1
                  c.andi       a2, -1
                  addi         tp, t2, 573
                  remu         s10, s10, s8
                  c.addi16sp   sp, -16
                  slli         t4, a1, 26
                  c.xor        a1, a4
                  c.sub        a3, s1
                  c.add        s2, a7
                  ori          s2, s9, -1321
                  c.sub        s1, a1
                  c.and        a2, s1
                  divu         s6, t3, a3
                  sltiu        a5, ra, 724
                  c.bnez       a1, 341f
                  mulh         s11, s8, a4
                  rem          s4, t3, t3
                  auipc        s11, 497244
                  or           t3, t3, s10
                  blt          t1, ra, 341f
                  slti         a1, s7, -1176
                  c.addi16sp   sp, -16
                  div          sp, t6, a6
                  c.lui        a7, 10
341:              mulhsu       s3, t6, t3
                  c.addi16sp   sp, 32
                  or           t0, a5, t5
                  c.sub        a5, a5
                  mulh         a2, s0, t6
                  slti         a3, s0, -1835
                  xor          t1, a6, t0
                  xor          t0, gp, a0
                  slt          t2, s5, s1
                  c.andi       a1, 10
                  c.li         ra, 26
                  slti         s11, a5, -1014
                  c.addi       a5, -1
                  c.nop
                  c.xor        a1, a2
                  srl          s9, t3, a7
                  c.addi4spn   a5, sp, 32
                  mulhu        a5, s2, a2
                  divu         s3, t1, s3
                  c.sub        a5, a3
                  slt          a6, a2, a6
                  c.addi       t3, 22
                  c.sub        a2, a2
                  c.srli       a2, 11
                  xor          gp, s11, t4
                  or           s8, t2, s4
                  beq          s6, sp, 378f
                  beq          s5, s1, 384f
                  c.addi       s9, -1
                  auipc        s11, 623894
                  bgeu         t0, s1, 387f
                  div          s1, t1, s7
                  slt          s1, s4, tp
                  c.addi4spn   s1, sp, 240
                  rem          gp, a2, s8
                  sub          a6, s11, zero
                  auipc        a6, 263146
378:              divu         a1, a4, tp
                  xor          gp, s7, a5
                  c.sub        a2, a4
                  sltiu        t2, a5, 1733
                  addi         s6, a4, -56
                  xor          a7, ra, s5
384:              sll          s4, s1, t4
                  or           t6, t6, s0
                  addi         a6, zero, -1299
387:              c.or         a1, a5
                  ori          zero, t6, -978
                  slli         a3, a0, 4
                  c.mv         a5, tp
                  c.bnez       s1, 399f
                  andi         tp, tp, 1837
                  sub          t6, a6, s5
                  beq          s4, s1, 395f
395:              sltiu        t0, a1, -224
                  xor          s2, ra, t0
                  xor          s6, tp, s9
                  c.srli       a1, 6
399:              c.addi16sp   sp, 80
                  bne          t1, t2, 414f
                  sub          a2, a4, a4
                  srli         s3, s5, 31
                  nop
                  c.beqz       s1, 408f
                  sub          t5, t2, s7
                  lui          sp, 181813
                  mul          s6, t5, s8
408:              or           a3, zero, s9
                  auipc        gp, 604812
                  c.slli       s2, 29
                  c.sub        a5, a2
                  addi         s1, s7, 546
                  mulh         s11, s2, t4
414:              divu         a6, a2, s9
                  mulhsu       sp, a2, s11
                  bltu         s6, sp, 418f
                  slti         t0, a2, 799
418:              c.addi4spn   a2, sp, 144
                  c.add        s0, s10
                  slli         s2, s4, 18
                  srli         a1, a1, 0
                  c.li         t6, -1
                  rem          s1, s0, s2
                  c.andi       a2, 21
                  c.bnez       a2, 442f
                  divu         zero, a3, t5
                  rem          zero, s0, s10
                  c.beqz       s1, 443f
                  beq          s2, s11, 448f
                  srl          s3, s0, tp
                  c.and        a2, a3
                  c.xor        a2, a1
                  or           a2, s0, a4
                  slti         t4, a5, -23
                  c.mv         s10, ra
                  mul          s2, gp, a0
                  mulhsu       a7, s10, t2
                  srai         a1, zero, 2
                  andi         s11, zero, 1426
                  or           t6, t4, a0
                  c.add        a2, s1
442:              nop
443:              div          s2, t0, s2
                  c.addi       a2, 24
                  divu         s9, a5, s1
                  or           a5, a2, a7
                  xori         a2, s3, -2039
448:              mul          s9, ra, t6
                  slt          s3, s8, t4
                  mulhu        a7, zero, s6
                  c.srai       s0, 21
                  c.addi       ra, 17
                  c.addi16sp   sp, 192
                  c.addi       s11, 10
                  sltu         s6, s10, sp
                  and          s0, t1, s8
                  c.nop
                  slt          a1, s11, gp
                  c.xor        s1, a0
                  sltiu        t4, s7, 1924
                  c.or         a3, s0
                  c.bnez       a1, 469f
                  or           tp, s2, s8
                  slli         s11, s7, 5
                  sra          t1, t4, a6
                  auipc        s6, 818745
                  or           ra, a2, s7
                  mulhsu       a6, s2, gp
469:              c.addi4spn   a2, sp, 64
                  c.nop
                  divu         a5, t5, s8
                  ori          ra, ra, 1070
                  ori          s3, t3, -863
                  srai         s5, t6, 0
                  c.addi4spn   s1, sp, 736
                  add          a7, s3, t4
                  auipc        t0, 235354
                  c.addi16sp   sp, 464
                  srli         s0, s6, 7
                  c.bnez       s0, 487f
                  srai         s5, tp, 17
                  bne          s1, a7, 498f
                  c.srai       s1, 22
                  sub          s10, t6, a4
                  sltiu        s4, a1, -959
                  slti         a7, t4, -30
487:              srai         s3, s0, 25
                  mulh         ra, s5, s7
                  remu         s6, sp, ra
                  c.beqz       a1, 498f
                  mulh         s1, s0, a3
                  remu         s2, s9, t4
                  nop
                  blt          s7, s8, 510f
                  srai         s5, a5, 22
                  sltu         s3, s10, a4
                  beq          s2, a7, 500f
498:              add          a6, tp, t5
                  c.mv         s9, t4
500:              c.sub        a1, s0
                  bltu         s8, gp, 503f
                  sltu         tp, a3, s3
503:              c.srli       a3, 10
                  c.addi       t2, -1
                  andi         a5, ra, -1973
                  srai         zero, a7, 0
                  mul          a2, t0, t6
                  beq          a2, a6, 524f
                  rem          ra, t3, s1
510:              srai         s4, s4, 27
                  mulhsu       zero, t3, t0
                  sltiu        gp, a6, -562
                  or           t3, a2, t1
                  mulhu        t1, s3, s4
                  xori         a5, t2, -17
                  andi         t3, t2, 1641
                  and          t2, a0, t3
                  c.add        t5, t4
                  addi         a6, zero, 1332
                  sltu         t0, s5, t6
                  blt          t0, ra, 537f
                  bgeu         a2, t0, 533f
                  c.li         s10, -1
524:              c.or         s1, a4
                  ori          t2, a1, 426
                  blt          s11, a6, 537f
                  lui          s6, 424514
                  srai         t2, a4, 31
                  slli         t5, s8, 9
                  c.bnez       s0, 546f
                  addi         a6, sp, -763
                  nop
533:              and          t4, a0, a1
                  sltiu        t5, s5, 1398
                  c.addi16sp   sp, -16
                  remu         s2, a2, s2
537:              sra          s8, s6, s1
                  mulhu        s0, t4, t5
                  c.and        a3, a3
                  c.sub        s0, s0
                  mulh         a7, a1, a3
                  div          tp, t2, a3
                  srl          s3, a7, t6
                  c.slli       t6, 6
                  mulhu        s8, t1, a1
546:              div          t0, s7, s10
                  or           s0, a7, s3
                  xori         s10, s0, -1884
                  c.bnez       a5, 565f
                  mulhu        t1, s2, s4
                  c.andi       s1, -1
                  c.andi       s1, 23
                  c.nop
                  mulhsu       a6, sp, a4
                  add          t1, s11, s6
                  beq          a0, a2, 567f
                  mulhu        t0, s5, ra
                  rem          s10, sp, s5
                  c.xor        a5, s0
                  bltu         t1, s9, 579f
                  mulhu        s10, gp, a6
                  remu         s6, s4, t0
                  c.li         a7, 9
                  srai         s2, s8, 18
565:              sub          s2, t0, a5
                  srli         a1, t4, 9
567:              sra          t3, s5, t3
                  sltu         sp, t0, s6
                  ori          s9, s4, -1503
                  c.srli       a1, 1
                  bge          s1, a1, 587f
                  and          t6, s9, s6
                  c.addi16sp   sp, 288
                  c.sub        a3, s0
                  mulhu        t0, t6, s5
                  add          s10, s0, s9
                  sub          t6, t2, t1
                  c.beqz       s0, 594f
579:              remu         s9, a0, a1
                  mulhsu       s1, a1, a4
                  bne          a2, t2, 589f
                  c.and        a3, a4
                  add          t6, a6, a4
                  c.mv         s11, s2
                  mulh         a1, a3, a3
                  srai         t3, a4, 12
587:              c.li         a3, 1
                  sltiu        s8, t6, 1763
589:              add          s5, s11, t0
                  addi         s4, s0, -1208
                  xor          sp, s10, t5
                  c.li         t5, -1
                  lui          s10, 369769
594:              c.xor        s1, s0
                  c.and        s0, a0
                  slli         a3, s3, 21
                  andi         tp, a1, 1114
                  auipc        tp, 273106
                  c.li         s6, -1
                  sll          s4, s2, a2
                  bge          t3, a4, 606f
                  mulh         s4, t3, a0
                  xori         s8, t2, -1260
                  and          a7, ra, a4
                  c.slli       t0, 28
606:              c.addi       s10, -1
                  nop
                  srai         a3, s0, 30
                  sub          s1, s9, s5
                  sltiu        s8, t0, 911
                  bne          a6, t2, 612f
612:              c.li         s8, 6
                  sub          t6, gp, a4
                  slti         t5, t0, -871
                  c.andi       a3, -1
                  c.andi       s0, -1
                  c.slli       s3, 28
                  c.addi16sp   sp, -16
                  or           s10, s1, s1
                  xor          s4, t3, a4
                  c.nop
                  remu         s9, s3, zero
                  c.xor        s1, a5
                  rem          t1, a2, s0
                  mulh         s9, t0, s7
                  slti         a3, t6, 1789
                  c.mv         s11, s11
                  c.and        s1, a1
                  lui          ra, 150335
                  bltu         t6, a6, 637f
                  or           s5, t2, a4
                  c.addi       sp, -1
                  ori          t4, t0, -764
                  sltu         t5, s10, a6
                  c.andi       s1, 21
                  c.addi       gp, -1
637:              addi         s9, t6, -2033
                  c.addi       a6, -1
                  mulh         ra, t1, a2
                  c.mv         s6, t4
                  bge          s8, s10, 643f
                  xor          s0, t4, t0
643:              mulhsu       a1, t2, s10
                  c.bnez       s0, 652f
                  bge          s5, a2, 659f
                  c.lui        s10, 7
                  remu         s0, t0, a5
                  andi         s9, t4, 1698
                  c.or         a2, a3
                  mulh         s0, s7, a7
                  bge          sp, a1, 666f
652:              c.srai       s1, 20
                  xori         t6, s6, -831
                  srli         t5, t4, 3
                  mulh         s0, a3, s5
                  c.mv         sp, s1
                  bltu         a6, gp, 674f
                  remu         a3, a3, t1
659:              add          s11, t3, s0
                  beq          a1, s9, 662f
                  c.nop
662:              blt          zero, a3, 665f
                  c.lui        t6, 25
                  c.srli       a2, 12
665:              slli         gp, s7, 28
666:              bne          a2, a6, 679f
                  srai         t2, s3, 29
                  andi         s2, a2, 905
                  sub          tp, s8, s8
                  c.andi       a2, 30
                  rem          s1, a6, s0
                  slti         s6, s3, -1551
                  xor          s9, s8, t1
674:              c.beqz       a2, 693f
                  sub          s1, a6, s7
                  bge          t1, s4, 684f
                  mulh         a7, s4, a4
                  rem          a1, s3, s8
679:              blt          t5, zero, 698f
                  beq          t3, s7, 687f
                  sll          t5, a1, s2
                  bltu         t4, ra, 692f
                  c.nop
684:              slti         s11, t4, 1420
                  andi         s0, a2, -361
                  c.addi4spn   s0, sp, 560
687:              c.srli       a3, 28
                  bltu         t5, t2, 692f
                  srl          t6, t1, s3
                  slti         a5, s6, 286
                  div          s8, a6, s9
692:              blt          s2, t5, 702f
693:              c.and        a3, a2
                  c.addi16sp   sp, -16
                  c.slli       s8, 22
                  mul          a2, s11, sp
                  c.xor        a3, a5
698:              addi         a2, t5, -1594
                  c.xor        a1, a4
                  c.andi       a1, -1
                  and          s9, a2, t3
702:              c.add        s11, a1
                  c.srai       a3, 29
                  xori         s6, s2, 586
                  srl          a2, t2, gp
                  c.and        a1, s1
                  c.addi16sp   sp, -16
                  c.xor        s0, s1
                  nop
                  c.srli       a3, 11
                  srl          s10, a1, s9
                  c.and        a1, a0
                  c.add        s11, a5
                  slli         a6, gp, 0
                  add          s11, s10, s8
                  srli         s2, ra, 1
                  c.srai       a2, 6
                  slti         a1, a0, -173
                  divu         t3, s2, s5
                  div          s4, s8, t6
                  slli         s0, s1, 18
                  ori          t2, t1, 736
                  and          a2, s9, s9
                  divu         t4, s10, t1
                  sltu         t6, a7, s10
                  c.sub        a3, a0
                  beq          s9, s10, 728f
728:              lui          s6, 576214
                  xori         a1, a6, 766
                  xor          s2, a2, s11
                  c.li         s5, -1
                  beq          t0, t3, 750f
                  c.sub        a2, a1
                  blt          t6, s4, 748f
                  srli         s0, s3, 8
                  mul          t6, a7, t5
                  nop
                  lui          s1, 905584
                  addi         t0, tp, 1669
                  mulhu        a6, tp, a6
                  c.beqz       a5, 748f
                  sub          a5, a5, t0
                  srl          t1, s9, a0
                  c.or         a2, s0
                  nop
                  bne          s11, s10, 765f
                  c.srai       a3, 24
748:              c.bnez       s1, 764f
                  mulhu        a7, tp, s8
750:              addi         t3, s6, -1322
                  sltiu        s5, a5, 1416
                  c.srai       s1, 13
                  sra          t3, s2, sp
                  sll          t6, s2, t1
                  sub          t4, gp, a2
                  and          s0, t3, a1
                  div          tp, tp, sp
                  c.beqz       a2, 766f
                  remu         a6, sp, a3
                  bne          t2, a2, 770f
                  ori          t2, a0, 1626
                  sltiu        a6, s10, 33
                  div          a2, s10, zero
764:              c.li         t2, -1
765:              beq          a2, ra, 778f
766:              sub          t3, sp, zero
                  c.beqz       s1, 786f
                  beq          a7, a3, 787f
                  blt          t2, s6, 787f
770:              nop
                  rem          s6, s6, a5
                  mulhu        s4, a1, t0
                  bge          s2, a0, 775f
                  xori         t3, a6, -746
775:              c.srli       a3, 14
                  andi         s11, s0, 1366
                  c.slli       t4, 6
778:              or           s0, s5, t6
                  c.slli       s6, 4
                  bne          t3, a3, 781f
781:              xori         a7, s3, -288
                  sub          s9, s9, s2
                  addi         ra, a3, 1651
                  blt          a7, ra, 788f
                  slt          a2, s3, s1
786:              xor          s3, s3, t0
787:              mulh         sp, s1, s7
788:              lui          gp, 288836
                  srli         s9, a3, 26
                  c.mv         a3, ra
                  add          t2, t3, t2
                  c.addi16sp   sp, 128
                  ori          t1, tp, 662
                  c.bnez       a3, 809f
                  mulh         a7, s3, s6
                  sub          a1, t4, s1
                  c.mv         t0, sp
                  c.andi       s1, 2
                  c.addi4spn   a1, sp, 80
                  lui          t3, 17368
                  xor          t5, gp, gp
                  auipc        gp, 752158
                  c.beqz       s0, 819f
                  c.andi       a5, 21
                  c.add        s10, sp
                  ori          t2, ra, -1092
                  c.addi16sp   sp, 176
                  c.srai       a1, 10
809:              c.srli       a1, 19
                  bltu         t1, t4, 826f
                  sra          zero, t2, s4
                  c.addi16sp   sp, 32
                  or           t1, a1, s7
                  slti         a6, a0, 519
                  blt          t0, s2, 823f
                  c.lui        a6, 6
                  c.mv         t6, a4
                  blt          zero, a3, 829f
819:              slt          s1, tp, s6
                  rem          s6, gp, gp
                  c.bnez       a1, 832f
                  c.addi       s0, 3
823:              add          t0, t4, gp
                  sra          s2, s6, t3
                  mulhsu       s5, t3, a0
826:              c.beqz       a1, 829f
                  sra          s9, s2, a5
                  ori          s2, t0, -769
829:              c.beqz       a3, 840f
                  c.beqz       a1, 838f
                  sltiu        s4, ra, 469
832:              ori          a5, s1, -446
                  or           a5, t5, ra
                  c.li         a6, 12
                  c.and        a3, a2
                  xori         t1, s10, 161
                  xori         t5, s10, 1592
838:              c.nop
                  bgeu         s7, s5, 849f
840:              xori         a5, t3, -1442
                  slli         a5, s5, 0
                  add          t0, t5, s8
                  add          s2, s11, t1
                  auipc        a5, 91840
                  c.beqz       s1, 847f
                  c.addi16sp   sp, -16
847:              blt          t1, s3, 863f
                  srai         s0, s11, 23
849:              bgeu         a7, t4, 854f
                  auipc        a3, 875681
                  slli         a3, sp, 14
                  c.sub        a3, s1
                  andi         s2, s8, -1634
854:              slli         a2, a1, 23
                  sub          a5, zero, s8
                  auipc        t4, 149195
                  c.mv         a3, sp
                  c.sub        a3, a1
                  sub          a2, gp, s1
                  bgeu         ra, gp, 877f
                  xor          s4, sp, s4
                  addi         a2, a7, -533
863:              xori         t3, a3, 1672
                  sltiu        t4, t6, -1098
                  slli         t3, t3, 17
                  c.nop
                  c.beqz       a5, 868f
868:              mulhsu       a1, a7, s7
                  bltu         s0, s11, 876f
                  remu         a6, s6, a7
                  bltu         a1, t2, 887f
                  bge          s0, zero, 879f
                  c.lui        t4, 3
                  mulhsu       s9, a6, s4
                  divu         s8, ra, t1
876:              c.lui        a7, 11
877:              srl          a3, ra, a3
                  slli         a5, a2, 20
879:              c.bnez       a5, 889f
                  c.bnez       a3, 896f
                  c.and        s0, s0
                  rem          zero, t0, s6
                  mul          s1, s11, a7
                  bge          t6, a1, 892f
                  bne          s3, t1, 896f
                  c.bnez       a5, 905f
887:              ori          a2, s4, 1884
                  bltu         s5, s3, 901f
889:              c.and        a2, a1
                  c.beqz       s0, 898f
                  slli         a5, s10, 11
892:              xor          sp, a2, s5
                  mulhu        s3, s11, s10
                  c.addi4spn   a2, sp, 816
                  c.addi16sp   sp, -16
896:              xori         t4, t6, -1133
                  div          s10, s7, s7
898:              divu         ra, zero, a6
                  lui          a7, 416331
                  bltu         t0, t4, 911f
901:              c.srli       a2, 26
                  sll          s6, ra, s6
                  div          t1, s9, a0
                  sll          sp, a5, gp
905:              lui          t2, 838466
                  slt          tp, a4, s4
                  c.addi       t4, 21
                  sra          s5, s3, s1
                  c.bnez       s1, 925f
                  blt          a7, a4, 926f
911:              c.srai       a5, 17
                  rem          ra, s10, a6
                  srai         a5, gp, 21
                  srli         t6, s2, 0
                  addi         a5, s9, 471
                  c.addi4spn   a2, sp, 128
                  c.srai       a2, 20
                  c.andi       s0, -1
                  mulh         tp, zero, sp
                  rem          tp, a2, gp
                  mulhu        zero, a1, s6
                  xori         sp, tp, 1224
                  divu         a6, s8, t5
                  c.beqz       a1, 943f
925:              slti         a5, s2, -329
926:              c.addi       a3, -1
                  slt          t2, t6, t5
                  c.xor        s0, a5
                  or           a1, gp, a3
                  add          gp, zero, gp
                  c.and        a5, s1
                  blt          s2, s10, 949f
                  ori          s3, a7, -577
                  sub          a2, a7, s0
                  remu         a6, tp, s1
                  add          t1, a7, s8
                  c.bnez       a3, 940f
                  mulhu        t0, a0, s1
                  slli         gp, s8, 0
940:              sll          gp, tp, tp
                  lui          s8, 1026684
                  rem          a7, s3, t0
943:              c.or         a2, a5
                  slli         t4, a4, 25
                  lui          t6, 53563
                  srli         s9, gp, 18
                  xor          t5, s9, s9
                  srl          s9, s6, a6
949:              ori          s0, s8, 289
                  xori         s10, t6, -1070
                  c.lui        t4, 16
                  add          s0, a7, sp
                  c.sub        a1, a4
                  slt          t2, a4, t6
                  srl          t3, a4, a3
                  c.srli       s1, 3
                  slti         zero, a0, -944
                  mulhu        a3, t2, t3
                  c.li         a5, -1
                  c.srai       a1, 7
                  or           a6, s7, ra
                  rem          t2, s6, sp
                  auipc        s6, 961099
                  sub          sp, t4, a7
                  xor          ra, s6, a4
                  mulhu        s5, a3, s1
                  div          a7, s6, s10
                  c.andi       a3, -1
                  c.srai       a2, 13
                  andi         t4, t4, 1908
                  sll          t2, a7, s10
                  c.lui        s6, 6
                  srli         s11, zero, 3
                  c.addi       s3, -1
                  rem          s3, s7, t5
                  c.addi16sp   sp, -16
                  auipc        s3, 561698
                  srl          tp, tp, s3
                  c.bnez       s1, 984f
                  c.bnez       a1, 987f
                  auipc        s8, 798889
                  mulh         s6, s3, s3
                  sra          s5, tp, a6
984:              addi         s4, a5, 1214
                  divu         a3, s1, t1
                  slti         t6, gp, 1138
987:              c.li         s5, 19
                  remu         s0, a6, s7
                  sra          s1, s2, t0
                  slti         t5, a5, -816
                  mul          a7, ra, t5
                  c.addi       s1, 7
                  c.and        a2, a1
                  mulh         a6, sp, s4
                  bge          a4, gp, 997f
                  bne          t6, gp, 1004f
997:              bne          a5, s11, 1013f
                  beq          a1, s11, 999f
                  slli         s1, zero, 19
                  addi         a3, sp, -1195
                  la           gp, sub_1
                  c.and        a2, a4
                  c.or         a2, s0
                  addi         gp, gp, 94
                  c.addi       sp, 6
main_j1:          jalr         t1, gp, -94 #jump main -> sub_1
999:              c.addi4spn   a5, sp, 208
                  bltu         s9, s9, 1002f
                  srl          a1, gp, s0
1002:             slti         t6, t6, 1404
                  bge          a3, s10, 1014f
1004:             c.addi       a1, 19
                  c.addi16sp   sp, 240
                  sub          a7, sp, t2
                  c.srai       a1, 23
                  c.srli       s1, 21
                  c.lui        a2, 16
                  c.lui        s2, 17
                  c.or         s1, a2
                  beq          t6, t0, 1013f
1013:             c.bnez       a3, 1031f
1014:             sra          t4, s3, a2
                  sll          ra, s1, s2
                  bge          a7, s6, 1020f
                  sra          a3, s10, a2
                  sltiu        s4, a7, 886
                  c.addi16sp   sp, -16
1020:             c.and        s1, s0
                  mulhu        s5, s5, t5
                  bge          s6, a2, 1037f
                  srli         a1, a0, 22
                  c.or         s1, a0
                  remu         t2, s10, s10
                  slti         t4, a1, 991
                  beq          s5, s11, 1043f
                  xori         s4, a3, -1975
                  bltu         ra, t5, 1048f
                  c.addi16sp   sp, 16
1031:             c.mv         a6, t3
                  rem          a1, a4, a4
                  xor          t3, s0, tp
                  mulhu        s0, t3, s11
                  c.slli       s8, 22
                  c.lui        a5, 4
1037:             c.and        a2, a2
                  c.or         a5, s1
                  mul          t5, t0, a4
                  blt          tp, s6, 1054f
                  slt          s6, s4, s2
                  sub          zero, t2, a2
1043:             c.bnez       s1, 1053f
                  beq          a2, a3, 1057f
                  bgeu         a7, a4, 1052f
                  blt          a1, s7, 1047f
1047:             remu         a3, ra, a7
1048:             c.sub        a5, a2
                  c.and        s0, a3
                  or           s9, a1, s0
                  sltiu        s9, a2, -1362
1052:             mulh         s3, a0, tp
1053:             slli         t2, t1, 29
1054:             sltiu        tp, ra, -470
                  slt          t0, t4, s2
                  div          a7, s1, s4
1057:             bge          s1, s1, 1060f
                  c.srai       s0, 16
                  add          ra, a1, t2
1060:             c.bnez       a2, 1076f
                  c.beqz       a1, 1077f
                  xori         a7, s4, -1340
                  bltu         zero, zero, 1079f
                  sub          a7, s6, s6
                  c.add        s1, a7
                  mul          a5, s3, a3
                  bgeu         s10, t1, 1068f
1068:             c.addi       s9, -1
                  c.beqz       s1, 1084f
                  c.lui        a6, 5
                  bge          a7, s6, 1087f
                  c.add        s5, s1
                  add          s6, t5, tp
                  c.andi       a5, 5
                  sra          a5, sp, s5
1076:             c.sub        a1, a1
1077:             auipc        s6, 272981
                  sll          s6, s1, tp
1079:             c.bnez       a5, 1093f
                  slli         sp, a3, 16
                  c.srai       s0, 14
                  sll          t4, t1, sp
                  add          s2, t5, t0
1084:             sll          zero, s9, s3
                  c.bnez       a5, 1102f
                  c.slli       t3, 7
1087:             srli         s10, s0, 31
                  c.add        t1, t0
                  and          a3, s9, s5
                  c.xor        s0, a4
                  c.lui        ra, 14
                  addi         s6, zero, 1457
1093:             c.sub        a3, a4
                  divu         t4, s10, s3
                  c.andi       a1, -1
                  xori         a6, s4, -1021
                  ori          a1, t3, 1810
                  slt          s5, a4, a7
                  div          gp, s1, s10
                  c.lui        t1, 19
                  mulhu        t6, tp, s7
1102:             srai         a2, t1, 23
                  sll          a7, s11, a0
                  c.mv         s1, s8
                  sltiu        s2, s2, 418
                  c.xor        a3, s1
                  xor          t0, a1, sp
                  lui          a3, 1018468
                  c.beqz       a3, 1111f
                  andi         s3, a7, -720
1111:             c.lui        s6, 10
                  c.add        s6, s11
                  mulhsu       ra, s1, a6
                  xori         a7, t6, 964
                  rem          zero, s10, s2
                  sltu         t0, zero, t6
                  c.addi4spn   a5, sp, 848
                  sltiu        a1, a5, -1940
                  bltu         a5, s0, 1130f
                  mulhu        t5, ra, s3
                  c.nop
                  c.addi16sp   sp, -16
                  sra          t1, s7, s7
                  mulh         a2, s0, t1
                  xori         a5, s7, 1117
                  remu         ra, sp, zero
                  c.li         tp, 28
                  auipc        s10, 204893
                  andi         s8, gp, -474
1130:             c.slli       s0, 8
                  divu         sp, tp, a1
                  nop
                  c.and        a3, a5
                  c.srli       s1, 18
                  c.nop
                  xor          t3, s5, s8
                  sltiu        a1, a2, 1944
                  rem          a6, s0, s2
                  and          a6, s6, gp
                  xor          tp, s10, t3
                  andi         s3, gp, -152
                  c.srli       a2, 17
                  c.beqz       s0, 1162f
                  rem          s6, sp, sp
                  slti         s0, s10, 1066
                  c.li         t4, -1
                  c.addi16sp   sp, 432
                  c.slli       s11, 9
                  mulhu        a3, a6, a2
                  c.mv         t5, s5
                  mulh         a3, s8, s7
                  remu         t2, s8, s10
                  andi         s10, zero, -234
                  c.srli       s0, 17
                  srai         ra, ra, 31
                  add          a1, t2, a7
                  sub          a2, s5, s0
                  lui          ra, 830383
                  c.nop
                  and          t2, a2, s6
                  xor          t0, s1, s5
1162:             c.addi4spn   a5, sp, 240
                  mulh         s3, ra, a0
                  div          s11, t4, s11
                  divu         a3, s10, a2
                  c.beqz       a3, 1177f
                  ori          a6, t0, -44
                  srli         ra, t2, 10
                  lui          a2, 516870
                  c.slli       sp, 29
                  c.addi4spn   s1, sp, 96
                  slti         s8, s11, 1948
                  c.and        s0, s0
                  c.bnez       a2, 1184f
                  c.mv         a1, s5
                  c.li         s9, 17
1177:             sltu         t1, s7, s11
                  c.addi4spn   s1, sp, 720
                  la           a5, region_1+444 #start riscv_load_store_rand_instr_stream_8
                  lb           t2, -15(a5)
                  sb           gp, -15(a5)
                  mulhsu       tp, a1, a6
                  mul          s9, s4, a3
                  c.slli       s4, 6
                  or           s3, a2, s8
                  lbu          t2, -12(a5)
                  slt          sp, t2, a7
                  c.srli       a2, 8
                  sb           a3, 9(a5)
                  lbu          t4, 7(a5)
                  c.andi       a1, 0
                  andi         s10, zero, 731
                  lb           ra, -9(a5)
                  lh           s6, -2(a5)
                  divu         s9, a7, a1
                  sb           a7, -1(a5)
                  srl          t3, a3, sp
                  lbu          gp, 1(a5)
                  ori          s6, s7, 1435
                  rem          s5, a2, tp
                  nop
                  sra          s8, s8, a6
                  sb           a6, 10(a5)
                  sub          s1, t1, s7
                  lui          t6, 265355
                  sb           a2, -15(a5)
                  xor          a3, t0, a7
                  lbu          sp, -1(a5)
                  sh           t3, 10(a5)
                  c.and        s0, a0
                  lb           s4, 5(a5)
                  mul          t1, s0, s1
                  c.andi       s0, -1
                  srai         a1, s4, 7
                  sra          s9, t5, s1
                  rem          s5, a7, a6
                  srai         a7, t6, 10
                  sb           s9, 2(a5)
                  and          t5, t5, s6
                  sb           a2, 15(a5)
                  divu         s5, s6, zero
                  lh           s0, -10(a5) #end riscv_load_store_rand_instr_stream_8
                  slt          t1, s2, t5
                  c.mv         t2, a7
                  c.srli       a1, 12
                  mulhu        s2, s1, s7
                  mulh         a6, s11, s3
1184:             srli         s11, a7, 0
                  c.addi4spn   s0, sp, 992
                  xor          s4, a3, s11
                  c.nop
                  c.or         a2, a2
                  add          t6, s3, s11
                  c.beqz       a1, 1206f
                  mulhsu       gp, ra, a3
                  c.addi4spn   s0, sp, 864
                  c.mv         t6, s8
                  c.add        a6, gp
                  slli         a1, s4, 3
                  or           a3, t1, a0
                  slli         s6, t0, 31
                  div          t3, t0, t6
                  mul          gp, zero, t6
                  sltiu        a2, s3, -1506
                  sub          s0, a0, s8
                  sltu         zero, t1, a0
                  c.xor        s1, a2
                  slli         s10, t5, 19
                  addi         t4, sp, -744
1206:             nop
                  bltu         s9, s11, 1215f
                  ori          s6, t1, -1971
                  c.li         gp, 28
                  bge          a0, a5, 1217f
                  c.sub        s0, a3
                  slli         sp, t6, 0
                  c.andi       a5, -1
                  bne          s2, sp, 1225f
1215:             c.bnez       a5, 1234f
                  bltu         s3, s8, 1234f
1217:             bgeu         t0, zero, 1227f
                  c.nop
                  sll          a5, a0, t1
                  slti         t1, sp, 685
                  ori          s0, a4, -2039
                  bne          zero, s8, 1224f
                  c.addi       t1, 10
1224:             bgeu         s1, s0, 1243f
1225:             xori         tp, a1, -492
                  c.srai       a3, 10
1227:             xor          s9, s9, a2
                  c.slli       s6, 24
                  addi         a7, s7, 28
                  bne          ra, a1, 1238f
                  slli         t3, a1, 21
                  la           s10, region_1+1931 #start riscv_load_store_rand_instr_stream_11
                  lb           s1, -23(s10)
                  c.li         s6, -1
                  c.lui        s0, 2
                  sw           a7, 1(s10)
                  lhu          s3, 51(s10)
                  slli         a2, s2, 29
                  rem          s11, a3, s9
                  c.nop
                  sll          t2, s10, a1
                  srl          s2, t1, s9
                  lbu          s0, 28(s10)
                  sb           s1, 58(s10)
                  sb           a1, 20(s10)
                  lw           a3, 9(s10)
                  remu         s11, a5, ra
                  srl          ra, s7, t2
                  auipc        t4, 840422
                  lb           s9, 60(s10)
                  c.add        sp, s10
                  srai         s11, t0, 24
                  c.and        s1, a5
                  slli         t5, gp, 29
                  lbu          s4, 15(s10)
                  sra          t1, t4, ra
                  or           s4, s2, a0
                  lh           s8, -63(s10)
                  c.mv         a7, a4
                  lbu          a6, 63(s10)
                  lh           s4, 29(s10) #end riscv_load_store_rand_instr_stream_11
                  and          s1, ra, s1
                  slli         s1, s8, 11
1234:             slti         a3, t0, -1006
                  divu         zero, s4, a7
                  rem          t0, gp, t0
                  xori         s9, a2, 1043
1238:             c.andi       a2, -1
                  srai         s0, s1, 6
                  mul          s5, s9, t2
                  bgeu         tp, t3, 1249f
                  xori         s5, tp, -1839
1243:             slt          t2, zero, a1
                  c.nop
                  c.addi4spn   a5, sp, 848
                  ori          tp, s0, -1846
                  sra          s3, sp, a7
                  c.bnez       a1, 1253f
1249:             sltiu        ra, a0, -1765
                  add          a5, s1, s6
                  c.or         a5, a1
                  div          s8, t0, t5
1253:             auipc        t2, 757603
                  srl          s11, t5, s0
                  sltu         s4, a0, a6
                  sltu         t2, t3, s4
                  c.bnez       s1, 1261f
                  blt          s3, ra, 1260f
                  bgeu         zero, t6, 1261f
1260:             remu         gp, a4, s4
1261:             slli         s6, t1, 4
                  c.or         s0, a3
                  sltu         s6, t1, s9
                  add          a3, s9, s4
                  srl          t0, t4, a7
                  c.addi4spn   a2, sp, 896
                  c.sub        a1, s1
                  andi         t3, s2, 990
                  mulhu        s10, a4, t1
                  bne          a4, a5, 1289f
                  c.slli       t5, 5
                  andi         s8, t6, 1599
                  sra          a3, a1, t3
                  blt          s0, s3, 1292f
                  mulh         s1, s6, s6
                  c.andi       a1, -1
                  c.srai       a3, 11
                  auipc        a2, 878740
                  or           t5, s3, t6
                  sll          a5, sp, s3
                  slt          t2, s4, t1
                  bne          t4, a2, 1283f
1283:             c.and        s1, a0
                  srai         s2, s7, 21
                  and          a3, a4, t2
                  add          s2, gp, ra
                  sra          t4, t5, a6
                  c.addi       t2, -1
1289:             rem          s2, t5, s7
                  nop
                  addi         s0, a0, 44
1292:             bne          t5, zero, 1311f
                  bltu         tp, s10, 1309f
                  slti         a2, s6, -1067
                  c.sub        a2, a2
                  auipc        t3, 250247
                  c.andi       a2, 15
                  c.slli       t5, 21
                  mulh         s8, a5, t4
                  remu         a3, ra, t4
                  slt          zero, s10, s8
                  mul          a6, s8, t1
                  mulh         t4, t3, a3
                  c.srai       a5, 5
                  c.nop
                  beq          sp, sp, 1317f
                  bltu         s2, a5, 1312f
                  c.and        s0, a4
1309:             mul          t2, a1, s1
                  sltiu        t5, a1, -1124
1311:             c.addi4spn   s1, sp, 736
1312:             srli         a6, t3, 18
                  c.andi       s0, 5
                  rem          a6, t6, zero
                  divu         s6, tp, t0
                  bgeu         sp, t5, 1324f
1317:             sll          s5, s1, a7
                  blt          a6, tp, 1329f
                  slti         t6, a7, -1423
                  c.addi       t5, -1
                  c.sub        s1, a2
                  xori         t1, t2, 1860
                  sra          a6, t2, a5
1324:             bltu         s6, t5, 1335f
                  xor          s1, sp, sp
                  c.mv         t4, s8
                  andi         a3, a2, -656
                  srai         s6, a4, 12
1329:             mulhsu       t6, ra, zero
                  c.addi16sp   sp, 400
                  sltu         s4, s6, s4
                  srli         t4, a2, 31
                  mulhu        gp, a5, s0
                  mul          ra, s1, s5
1335:             c.add        s2, t1
                  srli         s4, t2, 21
                  sltiu        ra, a2, -1749
                  or           s6, s11, s10
                  slt          s8, a3, tp
                  slti         sp, s11, 741
                  slli         s4, s6, 17
                  sltu         s8, s9, t4
                  c.and        a3, a5
                  remu         a1, s0, a3
                  bge          s7, s5, 1361f
                  c.sub        a1, a1
                  c.beqz       a2, 1357f
                  lui          t5, 75098
                  c.addi16sp   sp, -16
                  divu         t1, t1, s11
                  lui          t1, 13863
                  beq          s5, sp, 1360f
                  sltu         t6, s4, t5
                  c.slli       t6, 28
                  bgeu         s9, s10, 1363f
                  c.mv         sp, a3
1357:             c.addi       s10, -1
                  mulhsu       t3, a7, s6
                  div          s10, t0, a0
1360:             sll          a2, a6, sp
1361:             c.addi       t4, 26
                  addi         s5, tp, -1046
1363:             remu         t3, sp, s4
                  or           gp, a5, a5
                  mulh         t1, gp, tp
                  mul          t0, a6, a6
                  addi         a5, a6, -882
                  bltu         t5, t2, 1369f
1369:             xor          a1, t1, ra
                  rem          a7, s1, a4
                  c.srli       a2, 20
                  srai         t5, s10, 0
                  addi         a2, t1, -238
                  beq          s6, s4, 1390f
                  add          t5, s3, t1
                  mul          ra, t2, s5
                  c.li         sp, 31
                  and          t1, a2, a7
                  xori         s5, a1, -1005
                  mul          s6, s5, tp
                  c.srai       s0, 3
                  andi         a3, sp, 1513
                  slli         t2, s7, 21
                  c.or         s0, s0
                  sll          s8, s5, s11
                  c.and        s1, s1
                  c.mv         s11, a2
                  sll          a7, zero, s0
                  sltiu        s10, a6, 1678
1390:             sltiu        a5, a5, -1751
                  c.srli       a1, 23
                  xori         t3, s3, -15
                  c.sub        a5, a1
                  lui          s6, 380539
                  srl          t5, gp, s4
                  c.addi       s8, 8
                  mul          s1, s10, zero
                  c.addi       t0, -1
                  srl          a6, a1, s10
                  c.srli       a3, 25
                  nop
                  bge          s3, t6, 1417f
                  divu         a1, s0, zero
                  beq          s10, gp, 1423f
                  sub          t0, s10, a5
                  add          t1, s4, s11
                  c.xor        a3, a2
                  sll          tp, t3, t6
                  srli         tp, sp, 2
                  div          s5, t5, s1
                  bne          a5, s3, 1414f
                  sltiu        sp, ra, -54
                  lui          t0, 375128
1414:             c.srli       a3, 24
                  rem          a6, s11, a4
                  c.lui        a7, 6
1417:             bge          t2, s4, 1433f
                  xori         s4, s0, 1780
                  c.addi16sp   sp, 336
                  sltiu        s6, tp, 1908
                  c.srai       s0, 21
                  c.addi16sp   sp, 432
1423:             lui          t0, 151266
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  div          s6, s2, a6
                  c.and        a1, a1
                  c.beqz       a2, 1445f
                  c.slli       s2, 6
                  c.li         s3, -1
                  sltiu        t5, a6, -1769
                  mul          a6, a5, a2
1433:             addi         s9, a2, -542
                  srli         a1, s7, 5
                  c.and        a1, s1
                  c.addi       s0, 3
                  srl          a6, ra, s1
                  c.and        s1, s0
                  mulhu        s9, t6, a4
                  c.addi4spn   s0, sp, 608
                  srl          s11, t3, s10
                  c.bnez       a1, 1446f
                  sltu         gp, t1, t1
                  mulh         t4, s6, t1
1445:             c.or         s1, a4
1446:             c.sub        s1, a4
                  add          ra, sp, s2
                  c.xor        a3, a5
                  rem          t5, s10, s2
                  sra          ra, s8, t3
                  andi         a1, s0, -1264
                  mul          sp, a1, a0
                  mulh         s9, zero, t2
                  c.xor        a5, s1
                  remu         s3, t1, s3
                  mul          t6, a4, t5
                  c.srli       s0, 20
                  srai         tp, t2, 15
                  c.and        s0, a2
                  add          ra, a4, s6
                  sltu         t1, a5, s7
                  c.addi16sp   sp, -16
                  bne          s3, s11, 1477f
                  c.srai       a2, 29
                  sltiu        s4, t0, -1130
                  slti         a7, t4, 1386
                  c.bnez       a5, 1477f
                  c.addi       ra, -1
                  c.add        t6, t6
                  c.li         a3, 20
                  c.add        s4, s6
                  c.srli       a1, 9
                  addi         a1, s4, 450
                  slli         zero, a5, 21
                  rem          t6, s9, ra
                  c.sub        a5, a0
1477:             c.addi       t4, 20
                  c.bnez       a1, 1491f
                  sll          s3, t0, s5
                  la           s9, sub_2
                  addi         t6, t6, -1216
                  addi         s9, s9, -449
                  sltu         tp, s7, a4
                  c.add        s6, a4
                  blt          a6, s10, main_j2 #branch to jump instr
                  c.sub        a5, a0
                  srl          t3, t6, s7
                  add          t3, a0, s0
main_j2:          jalr         t1, s9, 450 #jump main -> sub_2
                  mulh         sp, ra, t6
                  srai         s10, s5, 21
                  srl          s8, s1, s9
                  bge          a4, t2, 1490f
                  sub          s8, s1, s4
                  remu         sp, t1, tp
                  bltu         s3, a4, 1493f
                  c.li         s1, -1
                  xori         t6, zero, 2009
                  c.xor        a2, a4
1490:             srai         s0, t4, 8
1491:             c.addi16sp   sp, 144
                  c.or         a5, a4
1493:             c.bnez       a1, 1509f
                  la           sp, region_0+1234 #start riscv_load_store_rand_instr_stream_3
                  lbu          zero, -4(sp)
                  sh           s2, -6(sp)
                  mul          s1, t2, gp
                  lb           t5, -7(sp)
                  lh           s10, 0(sp)
                  srl          t1, t3, a4
                  sltu         a5, zero, s4
                  sltiu        s1, a4, -1832
                  mulhsu       a3, s9, a4
                  c.nop
                  div          tp, a6, ra
                  mul          zero, s3, s1
                  sb           a3, 4(sp)
                  c.lui        t0, 22
                  and          t1, s3, t4
                  div          s10, s7, a0
                  xori         tp, zero, -153
                  lb           tp, 10(sp)
                  c.sub        s0, a4
                  lh           s3, 14(sp)
                  mulhsu       s11, s4, t5
                  auipc        tp, 491331
                  lb           s5, -5(sp)
                  andi         t0, ra, -1317
                  addi         s3, t4, -69
                  lb           a3, -5(sp)
                  sltiu        s9, s11, 1997
                  sh           s11, 0(sp)
                  auipc        t4, 450961
                  lbu          s11, -8(sp)
                  slt          s0, a4, ra
                  lbu          s6, -7(sp) #end riscv_load_store_rand_instr_stream_3
                  beq          s4, zero, 1499f
                  c.or         s0, a5
                  rem          a5, a5, gp
                  or           sp, sp, s3
                  c.add        a3, s0
1499:             beq          a7, a1, 1507f
                  auipc        s3, 366983
                  slli         t5, s11, 6
                  c.andi       s1, 27
                  sltiu        a1, ra, -1393
                  andi         zero, s10, 405
                  c.mv         s5, s9
                  lui          s2, 1032077
1507:             mul          s4, t2, a2
                  div          t0, a3, s5
1509:             nop
                  sra          t2, s2, zero
                  slt          t4, a7, s9
                  and          t0, t1, t0
                  c.sub        a5, a5
                  c.add        s3, tp
                  add          a3, s4, a2
                  c.lui        tp, 13
                  addi         t6, tp, 1122
                  andi         s1, t5, 15
                  beq          a3, t4, 1530f
                  bge          a0, t2, 1527f
                  sll          s11, a3, ra
                  c.addi16sp   sp, -16
                  slt          s4, s10, zero
                  c.srai       a3, 31
                  c.addi       t1, 28
                  mul          tp, t2, t1
1527:             bltu         s9, a5, 1537f
                  slt          t2, ra, s6
                  sll          s1, a4, s8
1530:             c.and        a3, a1
                  c.slli       t4, 22
                  srai         zero, s7, 6
                  mul          s9, a2, t4
                  beq          a5, s1, 1542f
                  andi         t5, s6, 1890
                  add          a5, s7, t6
1537:             c.andi       s1, 19
                  rem          t1, s7, t0
                  blt          s9, s4, 1555f
                  blt          s5, gp, 1556f
                  add          a6, a7, a1
1542:             remu         s5, t1, sp
                  c.or         a1, s1
                  sra          t3, sp, s11
                  rem          gp, t4, a7
                  sltiu        s11, s6, 426
                  rem          sp, s8, s2
                  sll          tp, s8, a0
                  c.srli       a1, 20
                  srl          a3, t2, t5
                  c.mv         t4, s10
                  andi         t4, a0, 1684
                  c.addi16sp   sp, 288
                  c.srli       s0, 31
1555:             c.slli       ra, 24
1556:             srai         a7, sp, 7
                  xor          gp, s1, s11
                  srl          s10, s7, s7
                  c.lui        t6, 15
                  mulh         s4, a5, t6
                  sltiu        t6, a1, 406
                  mulhsu       zero, s4, a1
                  mulhu        s10, a4, s8
                  blt          t6, a0, 1565f
1565:             xori         s5, gp, 978
                  c.lui        ra, 17
                  div          a6, t6, s1
                  slli         a5, s0, 9
                  sra          tp, t2, s2
                  bge          ra, gp, 1589f
                  ori          s8, gp, 1155
                  mulhsu       t3, a2, s5
                  c.srai       a2, 7
                  sra          s8, t1, t3
                  bge          t1, s5, 1579f
                  c.bnez       a2, 1594f
                  or           s10, s9, s2
                  c.srai       a2, 24
1579:             sltu         t4, a1, a3
                  c.andi       s0, -1
                  c.li         a2, -1
                  c.and        a5, a3
                  bgeu         a2, s9, 1597f
                  srai         s6, zero, 17
                  slt          s3, a2, tp
                  xori         gp, t2, 804
                  sltiu        zero, a6, 964
                  sub          a3, t4, s4
1589:             rem          a5, s9, s4
                  auipc        t0, 629903
                  and          s10, t1, a2
                  bgeu         tp, t1, 1594f
                  c.srai       s0, 6
1594:             srli         s6, s8, 15
                  c.lui        s8, 12
                  c.srai       a3, 16
1597:             mulhu        s8, t3, s1
                  c.mv         t4, a0
                  ori          s5, a7, 1569
                  bltu         s9, s7, 1619f
                  slt          tp, a0, a4
                  andi         sp, t1, 357
                  srli         t2, a3, 31
                  auipc        zero, 946479
                  c.addi4spn   s1, sp, 800
                  c.bnez       a2, 1623f
                  beq          t6, s6, 1623f
                  divu         t5, s6, a7
                  divu         s2, t1, a0
                  sub          s9, s1, s8
                  mul          t6, a0, s7
                  sll          a2, s4, s2
                  bgeu         s11, s11, 1628f
                  c.beqz       a1, 1633f
                  c.beqz       s1, 1628f
                  bne          t6, gp, 1627f
                  bgeu         s3, a4, 1627f
                  ori          a3, s7, 1721
1619:             sltiu        s4, s8, 1482
                  srai         s6, s0, 4
                  sltu         s10, t0, s5
                  blt          s2, t1, 1623f
1623:             mulhsu       sp, s6, zero
                  srai         s10, zero, 14
                  c.addi       ra, 15
                  c.mv         a3, gp
1627:             mulhsu       s3, a1, s11
1628:             ori          a7, t2, -141
                  lui          a2, 535403
                  bne          tp, a5, 1638f
                  c.mv         t3, s0
                  xor          a1, zero, a6
1633:             bgeu         s1, s2, 1649f
                  c.slli       t1, 16
                  add          a3, a3, s8
                  c.srli       a1, 2
                  sll          t4, t1, t4
1638:             beq          s0, tp, 1654f
                  c.srli       s0, 14
                  sltu         t2, a3, s10
                  c.addi4spn   a3, sp, 400
                  xor          a5, t5, gp
                  or           s2, ra, t3
                  c.bnez       a3, 1647f
                  c.slli       ra, 12
                  c.and        a3, a4
1647:             bne          a2, s4, 1658f
                  mulhsu       s5, a5, tp
1649:             add          a3, s0, s11
                  c.add        t2, s11
                  nop
                  c.li         t3, 9
                  remu         s10, s10, s7
1654:             c.beqz       a5, 1656f
                  c.bnez       s1, 1662f
1656:             c.xor        a1, a1
                  c.add        tp, a4
1658:             c.sub        a2, s0
                  c.or         a5, a4
                  c.beqz       a5, 1664f
                  or           a5, s5, s11
1662:             mulhsu       a3, sp, gp
                  srli         s9, s11, 12
1664:             lui          s10, 882199
                  c.xor        a2, a0
                  sra          s3, t1, tp
                  srl          s4, tp, t0
                  bltu         t4, s8, 1670f
                  bgeu         s4, a1, 1687f
1670:             c.lui        s4, 8
                  c.beqz       s1, 1682f
                  c.addi       s5, 10
                  c.nop
                  or           t0, gp, tp
                  c.addi16sp   sp, -16
                  c.addi4spn   a1, sp, 384
                  mulhu        t6, t2, a6
                  mulh         a6, gp, s11
                  c.andi       a1, 24
                  sltiu        a3, s4, -1803
                  nop
1682:             slti         s3, s11, -203
                  c.bnez       a2, 1699f
                  xor          s0, a6, t6
                  sra          tp, s10, t5
                  srai         s8, ra, 4
1687:             sll          a5, t2, s11
                  sltiu        a3, a3, 234
                  bne          s1, s10, 1705f
                  srli         gp, a1, 25
                  c.srai       a5, 2
                  mulh         a3, s3, s4
                  remu         tp, s8, a2
                  andi         a7, sp, -825
                  bgeu         s11, t1, 1711f
                  ori          s9, t2, 1402
                  c.add        t6, t1
                  nop
1699:             mulhsu       t3, s9, s5
                  lui          t1, 351229
                  c.or         s0, a4
                  mulhu        t4, t3, tp
                  c.addi       gp, 10
                  beq          t1, gp, 1711f
1705:             c.addi       t5, -1
                  c.lui        s4, 17
                  bne          a0, a3, 1709f
                  c.bnez       s1, 1724f
1709:             lui          t1, 478439
                  c.addi16sp   sp, -16
1711:             bltu         gp, gp, 1716f
                  c.srli       a5, 13
                  div          a7, s5, a7
                  c.addi4spn   a3, sp, 656
                  sltu         s10, a6, a6
1716:             c.or         a5, s0
                  bne          s4, t4, 1736f
                  c.addi16sp   sp, -16
                  rem          a2, a5, s6
                  divu         s8, s11, t0
                  divu         t3, sp, a5
                  mulhu        t1, s3, t3
                  bge          zero, s5, 1738f
1724:             c.and        a1, s1
                  and          s4, s1, s10
                  c.slli       a6, 15
                  or           s0, a5, s2
                  auipc        t0, 801430
                  c.andi       a3, -1
                  c.and        s0, a3
                  c.or         a3, s0
                  c.nop
                  andi         sp, sp, 1536
                  srli         tp, a4, 2
                  auipc        t1, 719232
1736:             c.xor        a1, s0
                  c.nop
1738:             lui          t6, 480669
                  c.srai       s1, 29
                  and          tp, t5, t3
                  c.lui        t6, 15
                  c.srai       a3, 17
                  nop
                  sll          s2, a1, s6
                  divu         s10, t1, t3
                  mul          s10, t1, t1
                  c.andi       a3, -1
                  bne          a7, a3, 1759f
                  srli         s4, t0, 12
                  ori          t2, s10, -2046
                  slli         s11, t2, 0
                  c.add        t6, s1
                  lui          s3, 265546
                  bgeu         sp, s2, 1755f
1755:             sltiu        t4, t5, 1177
                  divu         a6, t0, a1
                  bgeu         t5, s10, 1776f
                  mulh         a1, a0, a1
1759:             slli         t5, s5, 28
                  mulhsu       a1, tp, a0
                  xori         a5, tp, 1251
                  c.add        t2, s10
                  c.li         s4, 12
                  c.mv         ra, a7
                  c.bnez       a2, 1784f
                  slli         t4, s0, 3
                  remu         t4, s5, a1
                  blt          zero, a7, 1785f
                  c.xor        a5, a2
                  mulh         a2, a6, gp
                  sll          gp, a3, a5
                  c.mv         t1, ra
                  slt          a7, a4, a2
                  mulhsu       sp, zero, s3
                  c.addi16sp   sp, 400
1776:             div          sp, t2, s6
                  c.and        a5, a3
                  c.or         s0, s0
                  divu         t1, t2, tp
                  add          gp, a2, s10
                  c.andi       s0, -1
                  c.sub        s0, a4
                  c.nop
1784:             mulhsu       a7, s2, s4
1785:             c.nop
                  mulh         t1, t1, t5
                  xor          t4, t6, t3
                  sll          ra, t1, s10
                  remu         s9, t2, zero
                  or           s5, zero, s3
                  c.addi16sp   sp, -16
                  or           s11, a5, a2
                  sltu         a2, sp, s4
                  c.add        s1, ra
                  bge          zero, s7, 1806f
                  bgeu         a2, a0, 1810f
                  div          tp, t3, tp
                  ori          t6, s5, -1481
                  sltiu        s1, s6, -1153
                  c.addi4spn   a5, sp, 896
                  c.srli       s1, 8
                  slti         t6, s2, -259
                  mul          s4, sp, t2
                  slli         ra, s9, 12
                  xor          s5, s7, s4
1806:             div          zero, zero, t3
                  div          t3, s1, s4
                  c.srli       s1, 26
                  c.addi4spn   s1, sp, 32
1810:             slti         sp, s7, 1732
                  srl          t2, zero, a6
                  mul          a7, s6, s0
                  c.bnez       a5, 1820f
                  bne          sp, s8, 1822f
                  rem          s5, s3, tp
                  xori         s0, t6, -980
                  add          t1, s6, s0
                  div          s11, a7, t4
                  sltu         s2, a4, s6
1820:             andi         zero, a7, -1143
                  blt          t2, s0, 1831f
1822:             beq          a0, t6, 1835f
                  c.and        s0, a0
                  sub          zero, ra, s0
                  or           s2, ra, s2
                  c.srli       a1, 4
                  c.addi16sp   sp, -16
                  sll          t4, s10, t0
                  beq          t2, a5, 1830f
1830:             c.nop
1831:             mulhsu       t1, s6, t5
                  sll          t6, a1, a7
                  sltiu        s0, t0, 544
                  xor          a5, tp, s8
1835:             bgeu         s11, t2, 1845f
                  c.and        s0, a2
                  c.beqz       s0, 1853f
                  bgeu         s9, s6, 1841f
                  c.bnez       s0, 1847f
                  slli         s8, t2, 11
1841:             div          s11, t3, zero
                  remu         s10, s10, t5
                  c.addi4spn   a2, sp, 432
                  c.sub        a2, a5
1845:             bne          a7, s7, 1853f
                  blt          t3, s5, 1847f
1847:             c.addi       gp, -1
                  sub          gp, a0, t4
                  c.addi       t2, -1
                  sll          a1, t6, t5
                  bne          a1, a5, 1859f
                  c.srli       s0, 26
1853:             c.addi4spn   a2, sp, 80
                  sll          t2, t2, t4
                  slti         a1, t0, 820
                  remu         t2, t0, t1
                  sll          s4, t3, s4
                  rem          t0, a6, t6
1859:             c.add        s2, a5
                  beq          a6, s0, 1867f
                  beq          t4, a6, 1874f
                  divu         tp, s2, t5
                  c.bnez       s0, 1865f
                  c.or         s0, a3
1865:             divu         a7, a0, a7
                  remu         s1, a5, s6
1867:             auipc        a7, 814172
                  bge          a3, t2, 1884f
                  beq          sp, t5, 1871f
                  divu         s2, tp, t4
1871:             c.addi16sp   sp, 160
                  c.bnez       a3, 1888f
                  c.lui        gp, 25
1874:             c.or         s1, a2
                  bgeu         a7, a2, 1879f
                  c.andi       a2, -1
                  slli         a6, s3, 17
                  rem          t1, s6, a1
1879:             c.li         a7, -1
                  and          s8, t4, zero
                  bgeu         t3, t0, 1889f
                  c.xor        a1, a4
                  c.srai       a1, 14
1884:             blt          s5, s9, 1892f
                  blt          t3, t5, 1895f
                  mulh         a3, a2, t2
                  or           s3, s9, gp
1888:             mulh         sp, s10, s0
1889:             c.add        s0, s7
                  mulhsu       t6, a2, s3
                  c.lui        s5, 8
1892:             nop
                  beq          a4, s11, 1898f
                  mulhsu       tp, ra, s0
1895:             mulh         sp, gp, s4
                  c.add        s10, s8
                  c.xor        a2, a0
1898:             beq          t4, s0, 1913f
                  sra          ra, s0, s4
                  and          s6, s2, s1
                  bge          t5, sp, 1920f
                  bne          a7, s11, 1913f
                  rem          s2, t6, ra
                  xori         zero, s2, -111
                  c.slli       t1, 24
                  c.and        a2, s0
                  or           s10, s1, a3
                  add          s3, zero, s2
                  lui          a5, 161256
                  c.nop
                  ori          ra, a2, 1879
                  srai         t6, s8, 24
1913:             c.nop
                  blt          s4, s6, 1924f
                  rem          s1, t1, s3
                  c.mv         s3, s11
                  c.srli       a2, 1
                  addi         t0, s2, -372
                  bne          s11, s6, 1935f
1920:             remu         s2, s0, zero
                  c.addi       s10, 8
                  c.slli       s6, 18
                  bne          t4, a7, 1926f
1924:             mulh         t5, s11, s1
                  remu         s8, gp, t6
1926:             divu         s10, s7, s8
                  beq          t4, s11, 1946f
                  c.srai       a2, 3
                  ori          a3, t2, 326
                  xori         s8, s2, -1532
                  c.bnez       a3, 1942f
                  c.slli       s8, 19
                  srl          s0, ra, t1
                  sra          s3, t0, a1
1935:             srl          a2, s11, s9
                  sra          s0, s10, sp
                  remu         a5, s2, t2
                  mulhsu       sp, s9, t6
                  c.xor        a5, a5
                  c.and        a1, s0
                  c.or         a1, s0
1942:             c.mv         s10, t2
                  srl          t5, t2, s11
                  sltu         a1, t0, sp
                  ori          s4, t6, 327
1946:             c.srli       s0, 16
                  mulhu        t6, a4, s7
                  c.beqz       s0, 1967f
                  ori          a5, t5, 1897
                  sltu         s0, s8, t5
                  c.add        s9, s10
                  beq          s10, a0, 1966f
                  xor          t0, s10, s2
                  srai         t5, tp, 31
                  addi         s10, s11, -46
                  ori          ra, t3, 1893
                  lui          t5, 577526
                  c.lui        s6, 28
                  sltiu        s3, t6, 1981
                  c.nop
                  c.slli       t0, 26
                  lui          a3, 261980
                  sll          s2, s11, tp
                  bgeu         t0, s1, 1975f
                  lui          s9, 165721
1966:             rem          t2, s4, s9
                  la           sp, region_1+1414 #start riscv_load_store_rand_instr_stream_15
                  lb           t1, 7(sp)
                  mulh         s1, s8, s3
                  c.add        ra, t3
                  lw           t6, -10(sp)
                  lb           tp, -11(sp)
                  c.li         s6, 25
                  lbu          a6, -16(sp)
                  sra          s1, a2, a5
                  lb           t2, 3(sp)
                  sll          ra, t3, a0
                  c.nop
                  add          tp, a3, s2
                  and          tp, a7, s7
                  lbu          t0, -12(sp)
                  sll          s8, a4, a5
                  lb           a1, -12(sp)
                  lhu          s11, -2(sp)
                  lb           a7, 16(sp)
                  mulhsu       a2, t1, s3
                  lb           zero, -7(sp)
                  lbu          zero, -11(sp)
                  c.li         s3, 11
                  and          t1, tp, a4
                  sb           t2, 13(sp)
                  lhu          a1, 12(sp)
                  sltiu        s5, t1, 195
                  c.add        a2, s9
                  sltiu        ra, a4, -1668
                  lb           t2, 4(sp)
                  div          s1, s2, a7
                  lbu          s2, 15(sp)
                  sh           t3, 14(sp)
                  c.srai       a5, 17
                  sh           a2, 8(sp)
                  lw           t3, -2(sp) #end riscv_load_store_rand_instr_stream_15
1967:             auipc        t3, 638924
                  beq          t3, t3, 1984f
                  mulhsu       a3, s10, a0
                  mul          s1, zero, s2
                  slt          a5, zero, t0
                  c.li         s11, -1
                  c.lui        s4, 8
                  blt          zero, a1, 1990f
1975:             c.lui        s6, 7
                  c.addi16sp   sp, -16
                  c.addi4spn   a2, sp, 288
                  andi         t3, t6, 1258
                  blt          a2, s1, 1980f
1980:             c.nop
                  rem          s1, t3, s2
                  c.addi       a5, -1
                  xor          ra, a4, s8
1984:             andi         a1, a5, 1729
                  xor          s1, a3, a5
                  sra          t5, a2, s9
                  slli         a2, s1, 17
                  c.li         t3, 3
                  c.and        s0, a4
1990:             rem          s1, a0, tp
                  c.srli       a3, 1
                  sra          s1, s9, s10
                  div          s5, s7, sp
                  srai         a5, sp, 0
                  srli         sp, t5, 4
                  c.bnez       a1, 2014f
                  srli         a7, a0, 18
                  bge          s10, s0, 2005f
                  bgeu         tp, t6, 2016f
                  slli         s5, t0, 13
                  xori         a6, s7, -872
                  slt          a1, a1, s10
                  divu         gp, a1, t2
                  c.sub        s1, a4
2005:             bgeu         s3, zero, 2016f
                  xori         s10, s7, -362
                  bne          s9, s9, 2015f
                  sltiu        tp, t5, -821
                  slti         s10, t5, 92
                  c.add        s0, s1
                  rem          s4, s6, s5
                  c.xor        a1, a0
                  c.slli       s10, 4
2014:             remu         s5, a1, ra
2015:             c.or         a5, a3
2016:             c.mv         gp, a2
                  c.add        s10, t1
                  bltu         s6, t2, 2026f
                  remu         s2, sp, a7
                  bge          t4, t1, 2039f
                  c.or         s0, s0
                  remu         s10, a7, a0
                  c.nop
                  c.bnez       s1, 2042f
                  xori         s0, s0, 1122
2026:             mulh         s5, s2, s3
                  srai         t4, s11, 20
                  c.srli       a3, 28
                  c.bnez       a1, 2045f
                  bge          s11, s1, 2041f
                  srli         s8, s10, 30
                  auipc        s0, 577608
                  rem          s1, zero, s4
                  add          s5, s0, s2
                  bgeu         s3, tp, 2045f
                  c.sub        s1, s0
                  slti         a5, s2, 395
                  c.xor        a3, a4
2039:             srai         s9, s7, 15
                  beq          t3, s5, 2059f
2041:             c.or         a1, a2
2042:             xor          s11, s0, zero
                  srl          a3, t2, zero
                  sltiu        t1, a4, 796
2045:             bltu         zero, s10, 2049f
                  lui          t2, 1021990
                  srl          s6, a5, a5
                  c.addi16sp   sp, 400
2049:             c.slli       t6, 24
                  srli         a5, s1, 21
                  mulhu        a6, t3, t3
                  sltiu        a2, tp, -1072
                  c.addi16sp   sp, 32
                  c.nop
                  div          t5, s4, s11
                  and          t4, a5, tp
                  xori         s0, ra, 383
                  c.li         s3, 19
2059:             rem          t6, s5, a5
                  xori         zero, a0, -281
                  ori          s0, s1, -575
                  xor          t5, t4, a2
                  auipc        a6, 581016
                  mulhu        a1, a7, a3
                  sll          sp, t4, a3
                  c.and        a5, a4
                  c.addi16sp   sp, 208
                  mulhu        s3, tp, s9
                  bge          s1, a2, 2078f
                  c.srai       a3, 10
                  c.add        t5, a2
                  slt          t2, tp, zero
                  divu         t3, a0, t5
                  c.andi       a3, 3
                  bne          t1, s0, 2078f
                  bge          t2, s8, 2078f
                  div          sp, a1, t1
2078:             sltiu        a1, t0, 364
                  la x14, test_done
                  jalr x0, x14, 0
test_done:        
                  li gp, 1
                  ecall
sub_6:            bne          ra, a7, sub_6_stack_p
                  and          s8, t4, t1
sub_6_stack_p:    addi         s7, s7, -36
                  xor          t0, s4, t3
                  remu         s8, gp, s7
                  sw           t1, 4(s7)
                  remu         s9, s1, a1
                  blt          s8, a6, 8f
                  andi         s0, a4, 1732
                  bgeu         zero, a2, 20f
                  c.or         s1, a4
                  divu         t3, t1, sp
                  c.xor        a2, a5
                  xor          a6, t0, a6
                  c.beqz       a5, 20f
8:                slt          s2, s7, a5
                  c.nop
                  slt          s4, a3, a0
                  ori          tp, tp, 241
                  c.addi16sp   sp, 320
                  auipc        s1, 908844
                  c.li         t1, 24
                  slti         zero, t0, -1394
                  andi         t0, s10, 1150
                  xori         a1, a5, -2023
                  c.addi       tp, -1
                  sub          a6, t1, t0
20:               c.nop
                  bgeu         a0, s8, 26f
                  div          s11, s3, s1
                  remu         a1, a5, s1
                  c.slli       s10, 19
                  beq          t5, s4, 34f
26:               bge          s9, t4, 34f
                  andi         zero, t4, 246
                  mulh         zero, s1, zero
                  rem          t5, s0, zero
                  c.addi16sp   sp, 432
                  c.andi       a2, -1
                  slli         a1, sp, 20
                  c.andi       s1, -1
34:               c.xor        a1, a4
                  c.addi16sp   sp, -16
                  slli         s0, s8, 15
                  c.nop
                  bge          gp, t5, 53f
                  c.xor        a5, a3
                  bne          a0, a2, 46f
                  mulh         s5, s5, sp
                  c.addi       t0, 2
                  c.add        s11, s9
                  c.bnez       a2, 61f
                  srl          s11, a7, s4
46:               beq          ra, s10, 63f
                  c.and        s1, a2
                  c.addi16sp   sp, -16
                  sltu         t3, s4, s5
                  srl          zero, t5, t3
                  andi         s1, s11, 426
                  c.slli       t5, 12
53:               bgeu         s4, s6, 55f
                  mulhsu       a1, s10, s0
55:               lui          t5, 38318
                  auipc        s9, 267110
                  c.li         t3, -1
                  mul          s2, s0, a6
                  srai         t5, s4, 7
                  c.andi       a3, -1
61:               c.srai       s1, 13
                  srl          ra, t0, s10
63:               divu         s5, a3, s8
                  c.slli       t1, 2
                  c.srli       s1, 15
                  mulhsu       s4, t4, t6
                  sltiu        s9, a7, 836
                  sub          s10, zero, s2
                  lui          t6, 153442
                  andi         s11, t1, 1762
                  c.add        s3, t1
                  mulhsu       a2, t0, t1
                  mul          gp, t1, s3
                  div          t3, a0, ra
                  xori         gp, a3, 44
                  slti         a3, s0, -186
                  c.xor        a2, a3
                  xor          s4, t1, s5
                  c.add        a3, s3
                  beq          s4, s1, 94f
                  remu         a1, s8, t6
                  sltiu        s0, s0, 228
                  remu         s11, a1, gp
                  addi         t1, s5, -908
                  bltu         s3, sp, 89f
                  c.addi4spn   s1, sp, 944
                  c.beqz       a1, 103f
                  c.and        a2, a1
89:               srai         s3, a5, 3
                  xori         a6, t1, 512
                  lui          t5, 292554
                  c.addi16sp   sp, -16
                  mulhsu       s1, t5, a2
94:               beq          ra, t2, 103f
                  xori         a7, s7, 487
                  c.addi16sp   sp, 416
                  c.beqz       a1, 103f
                  slti         a2, s9, -1750
                  addi         a7, s4, -1898
                  sll          s1, s3, s10
                  xor          s3, a1, s5
                  mul          t1, s4, t6
103:              c.mv         s10, a6
                  lw           t1, 4(s7)
                  c.and        a1, a0
                  div          s0, a1, a5
                  divu         s1, s7, s4
                  c.addi4spn   a5, sp, 336
                  slli         t3, s3, 2
                  add          s8, t0, a2
                  addi         s7, s7, 36
                  sub          sp, t1, s2
120:              addi x28, x6, 0
120:              jalr x28, x28, 0
sub_10:           div          zero, a0, gp
                  addi         s7, s7, -16
                  rem          a2, ra, t4
                  sw           t1, 4(s7)
                  sltu         sp, s5, s11
                  c.mv         ra, t0
                  or           s10, s3, ra
                  slti         s6, a0, 1982
                  c.sub        a2, s1
                  add          t0, s2, gp
                  sub          gp, a6, ra
                  slti         tp, a6, 1032
                  slti         s10, s8, 619
                  c.li         s3, 5
                  nop
                  xori         sp, s5, -1758
                  c.addi4spn   a5, sp, 736
                  c.and        a1, s0
                  srl          a7, t1, s3
                  srai         s6, tp, 2
                  srli         s3, zero, 17
                  mul          s10, t5, a0
                  addi         t0, a4, 1176
                  c.or         a1, a4
                  lw           t1, 4(s7)
                  c.or         a2, s0
                  rem          s9, a1, s7
                  addi         s7, s7, 16
                  addi         t2, s6, 1677
                  div          a5, sp, s5
                  xor          ra, t5, s3
                  addi         gp, s9, 1220
                  c.slli       s11, 22
33:               addi x27, x6, 1
33:               jalr x27, x27, 0
sub_4:            c.li         s5, -1
                  bgeu         a5, a2, sub_4_stack_p
                  nop
sub_4_stack_p:    addi         s7, s7, -36
                  sw           t1, 4(s7)
                  mulhu        s10, a7, tp
                  la           s3, region_0+524 #start riscv_load_store_rand_instr_stream_4
                  lbu          s8, -11(s3)
                  lui          s8, 766981
                  sra          s0, t6, s7
                  rem          a1, a4, t0
                  lb           s0, -10(s3)
                  sb           tp, -10(s3)
                  c.andi       a5, 21
                  c.addi       s1, -1
                  add          t3, gp, s7
                  nop
                  add          s4, a6, t6
                  mul          s1, t5, sp
                  sh           s7, -8(s3)
                  lb           sp, 0(s3)
                  c.addi4spn   a2, sp, 784
                  remu         t1, s9, s10
                  andi         sp, a5, -711
                  sb           gp, 1(s3)
                  c.sub        a3, s0
                  auipc        s6, 730457
                  c.sub        s1, s0
                  sltiu        s5, s9, -186
                  lb           a2, 9(s3)
                  sb           a0, 4(s3)
                  addi         t5, gp, -566
                  lh           t5, -8(s3)
                  sb           s8, -6(s3)
                  auipc        tp, 120783
                  sw           t0, 4(s3) #end riscv_load_store_rand_instr_stream_4
                  la           s2, region_0+18 #start riscv_load_store_rand_instr_stream_0
                  sltu         t0, s3, a4
                  srai         zero, a3, 5
                  lb           s9, 136(s2)
                  srli         a7, tp, 23
                  lb           a7, -5(s2)
                  ori          s11, t1, 944
                  xori         s6, zero, -459
                  ori          t4, a7, -216
                  or           t1, s8, t3
                  rem          t2, a6, tp
                  ori          a2, s11, -679
                  sb           gp, 138(s2)
                  divu         sp, s4, sp
                  divu         a1, s0, t1
                  lhu          t4, 102(s2)
                  lbu          s8, 179(s2)
                  lhu          s1, -18(s2)
                  c.srli       a2, 29
                  c.and        a1, s1
                  or           t2, t0, s10
                  c.sub        a1, s0
                  lw           t6, -2(s2)
                  sb           a0, 58(s2)
                  sb           sp, 19(s2)
                  lbu          s9, -13(s2) #end riscv_load_store_rand_instr_stream_0
                  la           tp, region_0+1887 #start riscv_load_store_rand_instr_stream_1
                  srli         a7, t5, 31
                  c.xor        s1, a5
                  sw           ra, -1083(tp)
                  and          s2, t4, s1
                  sh           gp, -1501(tp)
                  c.addi       s4, -1
                  remu         t2, s7, s11
                  c.sub        a1, a2
                  remu         t4, gp, a1
                  lbu          s4, -1249(tp)
                  c.or         a5, a5
                  addi         s6, a7, -1070
                  addi         t6, s0, 245
                  c.xor        s1, a3
                  slli         a2, t4, 19
                  lb           s2, -1831(tp)
                  lb           s6, -388(tp)
                  sub          s6, t5, a1
                  sb           s1, -977(tp)
                  c.addi4spn   a2, sp, 896
                  lb           gp, -1032(tp)
                  srai         s3, s11, 23
                  sb           a4, -338(tp)
                  div          ra, s3, sp
                  sra          s9, t6, t4
                  srl          t1, s2, s1
                  lbu          s9, -1471(tp)
                  andi         s10, a6, 2020
                  slt          s6, a2, t1
                  lb           s9, -68(tp)
                  c.nop
                  sb           t0, -1874(tp) #end riscv_load_store_rand_instr_stream_1
                  la           sp, region_0+222 #start riscv_load_store_rand_instr_stream_5
                  slti         tp, t1, 1478
                  andi         s1, t2, -1558
                  addi         a7, s8, -1659
                  lbu          t1, -167(sp)
                  slti         t4, t4, 1466
                  remu         s4, s10, sp
                  lbu          a7, -128(sp)
                  remu         s10, tp, t5
                  slti         t5, a1, 248
                  mulhu        t6, tp, t1
                  sb           a7, 200(sp)
                  lbu          s4, 125(sp)
                  sb           t2, 233(sp)
                  lhu          s5, 24(sp)
                  sb           t6, -174(sp)
                  lb           s8, 217(sp)
                  lbu          zero, -125(sp)
                  div          s9, a2, a1
                  lbu          s5, -1(sp)
                  lhu          s8, 120(sp)
                  sb           a7, 41(sp)
                  sb           a0, -164(sp)
                  or           s6, t3, s3
                  lb           t1, -72(sp)
                  sh           a4, -146(sp)
                  sb           s1, 44(sp)
                  sb           tp, 104(sp)
                  sb           a0, 147(sp)
                  lb           a6, 188(sp)
                  divu         s9, a2, a2
                  c.slli       s10, 21
                  sltu         s2, t6, ra
                  sb           a0, -77(sp)
                  or           t4, a7, tp
                  remu         t4, gp, gp
                  and          t4, s6, tp
                  lh           t4, -144(sp)
                  divu         a5, s6, ra
                  slti         a5, s4, 1732
                  sb           a2, 115(sp)
                  lbu          a6, -77(sp)
                  add          zero, s7, s0
                  lb           s3, -88(sp) #end riscv_load_store_rand_instr_stream_5
                  c.add        t5, s5
                  bltu         a3, a0, 15f
                  slti         s11, t2, -1085
                  sra          t3, s5, ra
                  ori          s1, s8, 1579
                  c.srai       a2, 25
                  c.addi4spn   a3, sp, 192
                  c.addi4spn   a1, sp, 528
                  beq          t2, t0, 28f
                  sll          zero, s6, t3
                  divu         s3, t3, a4
                  c.srli       a1, 20
                  addi         a6, s11, 572
                  bge          s8, a5, 30f
                  c.slli       t5, 1
15:               bgeu         tp, s9, 34f
                  slt          a7, t6, a7
                  bltu         zero, a1, 18f
18:               c.sub        a3, a1
                  bge          t0, s6, 38f
                  sll          t0, gp, s8
                  srli         a5, t5, 1
                  c.and        s1, s0
                  add          s6, a2, gp
                  remu         a1, t5, sp
                  or           a7, s4, a7
                  sltu         a1, ra, sp
                  c.addi16sp   sp, 288
28:               auipc        t0, 429276
                  rem          t2, s1, sp
30:               srli         tp, t5, 15
                  c.slli       a7, 20
                  and          t6, s1, s5
                  sub          s2, s1, t5
34:               c.sub        a5, a2
                  c.nop
                  c.beqz       a2, 41f
                  c.add        t2, a4
38:               srl          zero, s11, a3
                  c.sub        s0, a5
                  rem          t5, s3, s9
41:               or           s3, s8, sp
                  c.addi4spn   a3, sp, 448
                  auipc        a1, 755480
                  c.andi       a3, -1
                  c.andi       a2, 5
                  c.mv         gp, s4
                  sub          t1, zero, s3
                  sltiu        s4, s2, -715
                  srl          s11, t3, s8
                  c.srai       s1, 2
                  sll          t0, s10, t2
                  mulh         sp, a5, t3
                  c.xor        a1, a5
                  c.mv         s11, a4
                  c.add        s10, s1
                  beq          zero, s1, 57f
57:               sra          s4, t4, s8
                  addi         s2, a6, 1704
                  bgeu         a1, a2, 66f
                  srl          t0, a2, t4
                  sub          s1, s1, s4
                  auipc        s3, 229648
                  c.sub        a5, a0
                  andi         ra, t1, -1485
                  sltiu        s6, s3, -265
66:               c.andi       a2, 3
                  beq          s4, t2, 81f
                  beq          s8, s5, 75f
                  c.beqz       a3, 72f
                  ori          a2, zero, -1587
                  sltu         t3, a6, t6
72:               c.mv         s1, t2
                  div          a6, a6, a5
                  sltiu        gp, t4, -1444
                  ori          s8, s3, 222
                  and          tp, s9, tp
                  c.li         t3, -1
                  la           a3, sub_8
                  c.add        t1, t0
                  andi         a2, sp, 1824
                  addi         a3, a3, 215
                  andi         t1, s5, 288
sub_4_j10:        jalr         t1, a3, -214 #jump sub_4 -> sub_8
75:               mulh         s0, a3, t2
                  c.andi       a1, 10
                  andi         t1, t4, 485
                  or           gp, ra, t3
                  c.nop
                  c.nop
81:               nop
                  mul          a5, t3, s7
                  c.sub        a5, a3
                  c.slli       ra, 9
                  rem          t4, gp, t5
                  bge          a2, gp, 105f
                  sltu         t1, sp, s5
                  c.slli       s3, 11
                  slli         s11, a0, 23
                  bltu         s6, sp, 102f
                  c.beqz       a1, 105f
                  xor          a7, s2, s11
                  srai         a1, zero, 0
                  mulhsu       a5, t6, t5
                  xori         a6, gp, -1361
                  c.srli       s0, 26
                  c.mv         a3, a6
                  addi         s2, s5, 1581
                  srl          s11, a3, sp
                  c.sub        s1, a1
                  srl          t2, s4, a1
102:              andi         t3, a2, -1497
                  div          t2, gp, zero
                  c.li         sp, -1
105:              add          tp, t1, a2
                  xori         s3, tp, -1702
                  xor          t0, t6, a4
                  c.srli       a1, 17
                  rem          s0, a2, s0
                  c.srli       s1, 11
                  bge          s0, t4, 122f
                  c.addi4spn   a3, sp, 992
                  c.li         a5, 25
                  nop
                  nop
                  slti         a2, t2, 1127
                  slli         s4, t0, 16
                  xori         s9, a0, -501
                  rem          a2, s1, t0
                  c.bnez       s0, 131f
                  c.srli       s0, 14
122:              nop
                  srai         t2, t0, 12
                  c.addi16sp   sp, -16
                  c.xor        a5, s0
                  sra          s2, t0, s0
                  mulhsu       s6, s2, s2
                  c.srai       a1, 17
                  remu         t3, s9, a6
                  blt          t2, s8, 149f
131:              and          a5, t1, s8
                  xori         s5, s10, -1769
                  c.addi16sp   sp, -16
                  c.lui        s5, 16
                  sltu         s1, a7, s9
                  mulh         a5, a0, t0
                  sub          a3, s5, a3
                  div          s3, s5, gp
                  c.srai       a2, 29
                  c.slli       t6, 4
                  mul          t4, t2, t6
                  slti         t4, a2, 1557
                  sll          t4, t6, s7
                  c.li         t3, -1
                  mulh         s5, s1, a6
                  c.addi16sp   sp, 32
                  srl          s1, t6, s4
                  auipc        s2, 761468
149:              c.beqz       a3, 165f
                  srli         a3, t2, 18
                  sll          zero, t3, t5
                  mulh         t2, s4, t5
                  or           s2, t3, s3
                  c.srai       a1, 1
                  c.and        a3, a3
                  c.li         a7, -1
                  rem          t4, s7, t6
                  lui          gp, 955389
                  beq          zero, a3, 177f
                  c.addi16sp   sp, -16
                  c.addi       s3, -1
                  ori          tp, s9, -890
                  srl          a6, s10, s5
                  bne          zero, sp, 168f
165:              bne          ra, t2, 169f
                  divu         s1, zero, t6
                  blt          t6, t1, 186f
168:              sub          a2, s0, s6
169:              xor          gp, ra, t5
                  div          t2, a7, gp
                  auipc        t1, 15656
                  rem          gp, sp, tp
                  c.andi       a3, 12
                  c.andi       a3, -1
                  rem          a5, s10, s5
                  c.lui        s1, 13
177:              andi         zero, s11, -1762
                  sltu         sp, a5, tp
                  sll          gp, a2, tp
                  slt          t5, s11, s1
                  c.andi       a2, 29
                  add          t6, s6, ra
                  bgeu         s9, t3, 203f
                  auipc        t1, 612333
                  and          a2, tp, t5
186:              bltu         s7, s9, 194f
                  and          t6, t4, s7
                  c.addi16sp   sp, -16
                  c.addi       s1, -1
                  sltiu        s5, s3, 1045
                  rem          s5, gp, t2
                  divu         zero, ra, zero
                  c.addi4spn   a3, sp, 368
194:              mulhsu       a6, ra, sp
                  mulhu        a1, a2, s11
                  c.addi4spn   s1, sp, 656
                  c.andi       s1, -1
                  mulhu        t4, t5, a6
                  mulhsu       t1, t1, s11
                  c.add        a7, sp
                  c.mv         t3, a2
                  c.bnez       a5, 210f
203:              rem          a1, sp, t6
                  slt          s5, ra, s1
                  c.sub        s1, a0
                  mulhsu       a1, a2, tp
                  mul          s1, a2, s0
                  slti         s4, tp, 915
                  c.sub        s0, a1
210:              slli         t3, t1, 5
                  sra          s3, tp, s9
                  c.srli       a5, 12
                  c.add        s8, t5
                  addi         zero, s1, -2030
                  divu         s6, a3, sp
                  mulhsu       t1, sp, s2
                  c.mv         a7, s3
                  srl          zero, t1, s5
                  nop
                  c.and        s0, a3
                  sub          s1, s7, s11
                  c.bnez       a5, 239f
                  bne          a6, a3, 242f
                  beq          s1, s7, 242f
                  mulh         s0, a7, t0
                  xor          a5, s6, ra
                  c.and        a5, a5
                  c.beqz       s1, 242f
                  c.slli       s5, 11
                  c.lui        a5, 18
                  c.addi16sp   sp, -16
                  c.or         s1, a0
                  c.or         s1, s0
                  mul          s11, s11, ra
                  sub          gp, a0, s8
                  ori          a6, s2, 1275
                  c.lui        t5, 25
                  c.xor        a3, a3
239:              srli         t3, s1, 20
                  c.nop
                  c.li         t0, -1
242:              andi         sp, t2, 270
                  c.or         a5, a3
                  c.lui        tp, 17
                  add          t6, s7, a0
                  slti         s4, t0, 396
                  c.xor        s0, a4
                  mulh         s11, t1, s5
                  c.sub        a5, a5
                  sltiu        s11, ra, 546
                  srl          t3, ra, s6
                  addi         s8, tp, 163
                  andi         gp, a7, -706
                  auipc        t2, 368853
                  andi         s4, t0, 266
                  xor          t3, t5, s6
                  sltiu        zero, s2, -1034
                  bgeu         gp, sp, 259f
259:              add          s10, zero, a1
                  slt          a3, a3, s0
                  and          a5, tp, s10
                  and          t0, s1, s2
                  sub          s11, t4, a1
                  slli         s1, a5, 2
                  andi         t4, s0, 1387
                  c.srli       a5, 10
                  c.andi       a1, -1
                  nop
                  c.add        s1, s3
                  c.addi4spn   a2, sp, 352
                  add          s6, a0, s0
                  add          s1, gp, a5
                  c.nop
                  auipc        gp, 755289
                  c.addi       a7, 25
                  slti         a7, a3, -817
                  c.add        a2, s11
                  c.add        s8, t2
                  c.xor        a3, a3
                  bgeu         s6, t0, 299f
                  c.or         a1, a2
                  c.mv         ra, t5
                  rem          t1, s6, a0
                  and          ra, s7, t5
                  mulh         t3, a7, s4
                  c.sub        a3, s0
                  or           a3, s1, s1
                  mulh         a7, a5, tp
                  divu         s9, a7, s9
                  sub          gp, s2, t0
                  c.addi4spn   a1, sp, 208
                  bgeu         a0, s2, 312f
                  srl          t3, s7, s3
                  c.li         t6, 14
                  sub          s1, s6, s7
                  auipc        s11, 294492
                  bgeu         s7, sp, 316f
                  andi         t1, a0, 394
299:              srli         zero, a6, 25
                  c.addi       tp, 20
                  c.add        t6, sp
                  c.nop
                  divu         a7, s11, s1
                  c.mv         gp, t0
                  mulh         s1, a0, a0
                  c.srli       s0, 13
                  mul          a1, a3, s1
                  c.beqz       a1, 309f
309:              c.srai       s0, 1
                  beq          a0, t2, 322f
                  nop
312:              remu         t0, t3, a0
                  add          t3, s2, s8
                  add          t6, t0, t2
                  c.li         a7, 13
316:              c.or         a1, a4
                  or           s3, a1, t6
                  srl          sp, a6, t3
                  c.srai       s1, 22
                  la           a5, region_0+910 #start riscv_load_store_rand_instr_stream_6
                  lh           a7, -8(a5)
                  lbu          a3, -2(a5)
                  div          tp, s1, s9
                  lh           t5, -6(a5)
                  lb           s3, -15(a5)
                  lh           t2, 8(a5)
                  sw           a7, -14(a5)
                  sh           sp, 8(a5)
                  c.addi16sp   sp, -16
                  lb           s2, -3(a5)
                  lh           t6, 0(a5)
                  sb           t4, -1(a5)
                  lbu          s8, 15(a5)
                  lb           a7, -5(a5)
                  c.lui        a1, 17
                  lhu          t5, 14(a5)
                  and          zero, s6, a5
                  mulhsu       a1, s5, gp
                  lhu          t3, 0(a5)
                  lh           a6, 12(a5)
                  slli         s3, s5, 16
                  c.mv         s2, t4
                  c.sub        a1, a3
                  slli         s11, s5, 6
                  lb           t2, 13(a5)
                  sll          s2, a4, s1
                  lui          s6, 591318
                  sh           ra, -14(a5)
                  lw           t2, 6(a5)
                  lb           t1, -4(a5)
                  rem          s9, a1, s9
                  lhu          s5, -2(a5)
                  lbu          s6, -3(a5)
                  lb           s4, 0(a5)
                  sb           s10, -14(a5)
                  lb           tp, -1(a5)
                  lh           s9, -14(a5) #end riscv_load_store_rand_instr_stream_6
                  c.mv         s0, t3
                  add          t0, a0, zero
322:              add          a2, s5, t0
                  c.mv         s8, s10
                  c.beqz       s0, 343f
                  add          s9, a6, tp
                  c.lui        t4, 2
                  c.li         sp, 9
                  divu         s6, a4, ra
                  c.nop
                  slli         t1, s5, 30
                  xor          a7, zero, t1
                  c.lui        s10, 15
                  blt          a0, s9, 347f
                  mulhsu       s8, a7, a1
                  sra          t6, a1, a4
                  c.nop
                  c.sub        a1, a2
                  c.bnez       s0, 354f
                  sra          s6, a5, s11
                  mulhsu       s11, s4, a3
                  srl          s2, s1, gp
                  srl          s4, a1, s10
343:              xor          a1, a5, t4
                  c.beqz       s1, 355f
                  bltu         tp, t4, 350f
                  and          s2, s9, a6
347:              rem          t4, t0, t3
                  bgeu         a7, t6, 362f
                  andi         t1, a4, -969
350:              c.bnez       a5, 358f
                  rem          s3, zero, a7
                  c.add        s4, ra
                  mul          s2, t0, t4
354:              slt          s4, gp, s2
355:              divu         a6, t5, a7
                  sll          a7, s7, s4
                  la           sp, region_1+593 #start riscv_load_store_rand_instr_stream_3
                  andi         s4, s4, -1337
                  lbu          a1, 238(sp)
                  nop
                  sw           a0, 111(sp)
                  ori          a1, a6, -150
                  sb           t2, 104(sp)
                  c.add        a2, t5
                  lbu          gp, 220(sp)
                  rem          s1, t6, s7
                  c.srli       a5, 16
                  lb           s0, 4(sp)
                  divu         s0, t4, a0
                  sh           s5, 137(sp)
                  sh           t4, 43(sp)
                  lbu          s8, 60(sp)
                  sb           t3, -248(sp)
                  c.or         s1, a3
                  addi         a2, s1, -1479
                  lbu          a3, 182(sp)
                  add          ra, s0, s8
                  lb           gp, 205(sp)
                  lh           s2, -135(sp)
                  divu         tp, t5, s6
                  auipc        t4, 924378
                  mulh         s6, a7, s0
                  c.srai       a3, 23
                  sll          t3, gp, t2
                  c.andi       a1, 3
                  sb           t1, 200(sp)
                  lb           s6, 21(sp)
                  sb           t3, 25(sp)
                  lbu          a3, 154(sp)
                  mulhsu       zero, s5, s5
                  sll          s4, a3, s6
                  lb           s0, 230(sp)
                  slli         a2, t0, 11
                  andi         t6, t6, 1100
                  sb           t0, 126(sp)
                  sltiu        s9, zero, -377
                  lb           zero, -179(sp) #end riscv_load_store_rand_instr_stream_3
                  sltiu        t1, s0, 676
358:              or           ra, t2, t0
                  sub          t2, a5, a7
                  c.addi16sp   sp, 336
                  c.srli       a3, 6
362:              divu         s9, t1, t0
                  slti         s3, a3, 762
                  slt          s6, a4, s9
                  blt          s2, s11, 382f
                  slt          a3, s0, s2
                  auipc        gp, 840095
                  mulh         tp, s8, sp
                  srai         a2, s11, 3
                  mulhu        gp, a3, t4
                  beq          a7, a5, 375f
                  rem          t1, a2, s10
                  or           tp, s6, t0
                  xor          tp, s2, a5
375:              slli         s11, a5, 10
                  divu         s3, t5, s5
                  sll          s11, s2, s10
                  c.srai       a1, 10
                  mulhu        s3, a7, s4
                  rem          a3, t6, s10
                  remu         a6, s10, s9
382:              c.and        a1, a0
                  and          s9, t2, s8
                  sub          a5, a2, t0
                  remu         s0, s7, s6
                  bge          s6, a6, 405f
                  c.add        a2, t3
                  srai         s5, s6, 13
                  div          s10, s7, gp
                  xor          s0, t4, s8
                  and          a1, t1, zero
                  mulhsu       a5, gp, t3
                  bltu         a0, s5, 410f
                  srli         a5, s8, 17
                  divu         t5, s3, a4
                  mulhsu       a1, s4, a0
                  bne          t5, a0, 411f
                  srai         s11, s8, 3
                  xor          zero, s4, zero
                  blt          a6, s10, 407f
                  bne          gp, a3, 404f
                  addi         s2, s0, -1754
                  beq          a0, s4, 410f
404:              c.add        a5, t2
405:              or           t3, gp, s11
                  or           s6, s9, a3
407:              or           ra, s11, ra
                  remu         s5, a3, s11
                  c.add        t2, s2
410:              bgeu         s1, ra, 428f
411:              add          t0, t5, gp
                  c.add        gp, s7
                  xor          a6, a3, s4
                  sub          ra, sp, s6
                  or           s6, s5, s4
                  addi         a7, sp, -839
                  c.sub        a3, a1
                  xor          t1, zero, gp
                  andi         s8, s1, -1573
                  c.nop
                  blt          t0, a6, 425f
                  srl          t4, gp, s8
                  c.nop
                  bne          a2, sp, 444f
425:              bgeu         zero, a5, 444f
                  beq          s2, s11, 444f
                  rem          s6, a2, s2
428:              c.beqz       s0, 439f
                  sub          s3, a2, t5
                  c.lui        s4, 4
                  srli         s3, a6, 22
                  c.addi       a6, -1
                  c.addi16sp   sp, -16
                  c.mv         s8, s8
                  sltiu        tp, sp, -89
                  c.beqz       a1, 455f
                  c.mv         a1, a6
                  bltu         t4, a6, 452f
439:              srli         s8, gp, 4
                  srai         s0, s4, 7
                  c.addi16sp   sp, 16
                  c.and        a3, a5
                  c.nop
444:              andi         gp, a2, -1709
                  c.sub        a2, s0
                  beq          t1, t4, 454f
                  mulh         s6, s5, tp
                  ori          a6, a6, -128
                  mul          a2, s5, s0
                  c.add        s10, s0
                  c.bnez       s0, 469f
452:              bgeu         t4, t0, 460f
                  c.bnez       s0, 467f
454:              c.nop
455:              remu         s10, sp, t2
                  c.bnez       a2, 464f
                  lui          a3, 618701
                  beq          sp, t5, 478f
                  c.sub        a1, s1
460:              sub          s2, a7, ra
                  auipc        s0, 257532
                  srli         s8, a1, 20
                  c.addi       a5, 24
464:              slt          s11, s9, a6
                  c.sub        s0, a1
                  auipc        t5, 1003404
467:              c.bnez       a2, 481f
                  andi         a7, s0, 646
469:              mulhsu       t1, a5, zero
                  remu         sp, a5, t6
                  c.lui        s3, 16
                  xori         ra, s9, 76
                  c.add        s11, s8
                  c.addi       a2, 20
                  mulhsu       t5, a6, zero
                  blt          tp, t5, 483f
                  c.srai       s0, 20
478:              c.sub        a3, a2
                  bge          s10, s9, 498f
                  xori         a5, t0, 453
481:              andi         s9, a0, -1495
                  auipc        s0, 400839
483:              bgeu         s7, a5, 495f
                  c.xor        s1, s1
                  c.or         a5, s1
                  div          t6, t0, t4
                  c.srai       s0, 1
                  beq          a2, s3, 504f
                  xor          s2, s0, a0
                  bne          t4, t1, 510f
                  c.or         s0, s1
                  lui          s11, 724684
                  c.bnez       s0, 512f
                  bne          a0, a5, 508f
495:              bne          a0, s0, 509f
                  andi         zero, a4, -94
                  la           a2, region_1+830 #start riscv_load_store_rand_instr_stream_8
                  lb           t1, 13(a2)
                  lbu          s2, 5(a2)
                  lbu          t2, -14(a2)
                  lhu          t4, 8(a2)
                  div          s1, s2, s4
                  sb           a6, -11(a2)
                  lw           t3, -2(a2)
                  lb           ra, 5(a2)
                  c.addi       s0, 27
                  c.sub        a1, a3
                  lb           s10, -1(a2)
                  sb           s2, 15(a2)
                  mulhsu       t5, s4, s3
                  xori         t1, a7, 578
                  mulh         s11, a2, s7
                  sh           s2, -8(a2)
                  mulhu        a7, s5, t2
                  lbu          t5, 12(a2)
                  c.li         s11, -1
                  and          a7, a4, t6
                  lb           s2, -9(a2)
                  lh           s11, 12(a2)
                  sh           tp, 14(a2)
                  or           t2, s8, t4
                  sh           s3, 6(a2)
                  sltu         a1, a1, s6
                  lh           t4, 0(a2)
                  lbu          s4, -11(a2)
                  lbu          s2, 10(a2)
                  lb           s0, 7(a2)
                  sh           s1, 2(a2)
                  c.srai       a3, 5
                  lb           s2, -4(a2)
                  lui          gp, 892139
                  sh           s4, 16(a2)
                  sw           t4, -14(a2)
                  sb           t5, -12(a2)
                  lb           zero, 2(a2) #end riscv_load_store_rand_instr_stream_8
                  c.addi4spn   s0, sp, 640
498:              srai         s8, a6, 11
                  sra          t5, a0, ra
                  blt          a3, t0, 511f
                  xori         t2, a1, -864
                  mul          a2, a3, a6
                  c.slli       s3, 22
504:              sltiu        a3, s4, -1096
                  remu         a3, s6, s11
                  srai         a3, zero, 13
                  nop
508:              bne          t2, s2, 527f
509:              xor          sp, a6, a5
510:              bgeu         s0, gp, 527f
511:              sub          t3, t3, a1
512:              slti         t6, gp, 1736
                  bne          t6, s4, 524f
                  sra          a7, s2, t3
                  c.xor        s1, a2
                  c.beqz       s1, 523f
                  add          sp, s1, s3
                  c.addi16sp   sp, 464
                  auipc        t5, 82429
                  bne          sp, s8, 538f
                  sltu         t4, a2, a5
                  sub          a5, s6, s4
523:              c.add        s6, s5
524:              c.andi       s1, -1
                  c.and        a3, a5
                  c.addi4spn   a1, sp, 224
527:              c.srai       a5, 3
                  blt          gp, t5, 532f
                  auipc        s3, 630716
                  c.nop
                  addi         t2, a5, -283
532:              sltiu        s11, ra, 1507
                  blt          s6, ra, 534f
534:              addi         a5, s7, 1679
                  beq          s2, s11, 554f
                  srl          a3, a4, t2
                  remu         s3, a2, s7
538:              xori         s2, s11, 298
                  c.add        t1, s0
                  c.mv         tp, a2
                  c.or         a2, a4
                  sltu         a1, t2, zero
                  c.and        a5, a5
                  and          a3, a6, s10
                  c.lui        t2, 27
                  c.slli       a2, 15
                  auipc        a7, 33757
                  c.and        a1, a1
                  srl          a3, s6, gp
                  c.xor        a5, a1
                  mulhsu       zero, zero, a5
                  xori         zero, s11, -342
                  sltiu        s10, t5, -410
554:              and          tp, s3, s11
                  c.and        a2, a2
                  lui          s0, 263507
                  c.beqz       s0, 561f
                  c.xor        s0, a1
                  c.nop
                  c.andi       a5, -1
561:              mulh         s6, t4, s10
                  remu         tp, zero, t6
                  remu         a7, s5, s6
                  or           a2, s5, a2
                  remu         s8, t4, a5
                  bgeu         a5, s6, 583f
                  c.nop
                  c.mv         s8, s4
                  ori          sp, s0, 1520
                  srai         s4, sp, 3
                  srai         sp, t3, 18
                  xori         sp, s11, -914
                  c.or         s0, a3
                  c.slli       t6, 3
                  auipc        s5, 782352
                  bne          t4, zero, 581f
                  ori          s3, a0, -1303
                  sra          a2, s8, zero
                  divu         ra, a2, t0
                  c.addi16sp   sp, -16
581:              c.addi4spn   a2, sp, 864
                  slli         a5, a0, 2
583:              c.addi       s6, -1
                  c.bnez       a3, 587f
                  bne          t4, s2, 604f
                  beq          t4, gp, 587f
587:              and          s3, a2, t3
                  mulh         zero, t4, s4
                  div          s3, t6, a5
                  sltu         a1, a2, s3
                  srli         s0, a2, 1
                  c.srai       a5, 28
                  divu         a6, a6, t6
                  bltu         s1, s10, 613f
                  lui          tp, 883338
                  divu         s11, s7, gp
                  c.addi       a6, 4
                  c.mv         t0, s1
                  blt          gp, gp, 618f
                  c.li         a7, -1
                  c.bnez       a3, 612f
                  c.addi16sp   sp, -16
                  addi         sp, zero, 1129
604:              c.bnez       s0, 605f
605:              c.slli       a7, 9
                  andi         s0, t4, 1415
                  sltiu        ra, gp, 44
                  beq          gp, t3, 609f
609:              mulhu        s3, t3, s0
                  xori         t1, s8, 284
                  mulh         a5, a1, t4
612:              c.lui        t5, 13
613:              c.lui        t5, 13
                  c.bnez       s0, 633f
                  and          gp, s0, s0
                  andi         t5, ra, 1959
                  c.lui        s3, 28
618:              divu         t3, tp, zero
                  rem          t3, s3, s8
                  and          t5, t1, a0
                  ori          t2, gp, 1010
                  c.beqz       a5, 629f
                  mulhu        sp, a4, t5
                  srai         s8, t6, 12
                  c.add        a3, s8
                  bgeu         s0, zero, 640f
                  slli         t4, t4, 24
                  sltiu        s4, gp, -346
629:              rem          s5, sp, s4
                  c.sub        a2, a5
                  slli         a2, a7, 19
                  c.sub        a3, a2
633:              srl          t4, a3, t3
                  divu         s2, a6, s0
                  srli         sp, s9, 3
                  slti         zero, t2, 508
                  srai         t2, s10, 28
                  c.add        s3, a7
                  sra          a1, a7, t4
640:              bge          s8, gp, 648f
                  rem          t5, a5, t3
                  nop
                  c.nop
                  c.nop
                  sltu         gp, zero, tp
                  divu         ra, s2, a6
                  bge          a1, ra, 654f
648:              mulhsu       t3, ra, s8
                  slli         s9, s5, 27
                  mulhsu       s6, s4, tp
                  srli         t0, t6, 31
                  bge          s1, s5, 671f
                  c.addi16sp   sp, -16
654:              nop
                  srli         t3, s10, 0
                  c.srli       a3, 23
                  sll          t0, zero, a5
                  remu         s8, t0, s11
                  xori         sp, s11, -1454
                  c.add        s6, a7
                  c.sub        a3, a0
                  c.addi       s8, -1
                  addi         tp, a6, -1496
                  c.lui        a5, 2
                  c.mv         a6, tp
                  bgeu         a2, t2, 670f
                  c.or         a1, s0
                  nop
                  srai         t3, s11, 6
670:              or           s5, s0, t3
671:              c.srai       s1, 26
                  c.addi4spn   a5, sp, 64
                  beq          s10, ra, 677f
                  divu         a1, t6, t0
                  bgeu         a5, s7, 694f
                  or           s8, sp, t4
677:              c.srli       a1, 20
                  c.bnez       a1, 683f
                  sub          zero, a3, a1
                  c.xor        s0, a5
                  ori          a2, s10, 1579
                  c.and        a2, a0
683:              c.addi4spn   s1, sp, 976
                  c.nop
                  c.addi       a1, -1
                  mul          zero, t0, ra
                  c.srli       a3, 5
                  c.or         a2, a4
                  mulhsu       t0, s3, a1
                  slti         t5, s2, 1083
                  c.lui        a3, 23
                  c.sub        a2, a4
                  c.sub        a3, a5
694:              c.addi4spn   a1, sp, 672
                  auipc        s5, 672250
                  c.addi       a5, 20
                  mulh         a6, a2, t1
                  slti         a5, gp, -1404
                  slt          s11, a2, gp
                  c.and        s0, a2
                  c.or         a5, a0
                  add          s4, s6, a2
                  divu         a5, s7, t2
                  c.srli       a5, 1
                  sub          sp, s1, a1
                  and          s9, tp, s4
                  c.nop
                  srl          s10, s7, a4
                  blt          s8, t5, 720f
                  blt          t1, a0, 729f
                  auipc        s4, 1537
                  slti         t5, s6, 595
                  srli         ra, a1, 26
                  c.andi       a5, 15
                  c.slli       t2, 4
                  c.or         s0, s1
                  bne          s11, a6, 733f
                  xor          s10, ra, s8
                  mulh         s0, s0, gp
720:              bge          a3, a7, 740f
                  srl          t2, s11, a6
                  bne          a2, a5, 736f
                  mulhsu       s0, t2, gp
                  mulh         s4, ra, s5
                  xor          s5, s7, t2
                  mulhsu       t1, s4, s11
                  c.and        a5, a4
                  and          s10, t5, gp
729:              divu         s9, t4, t3
                  c.lui        s3, 21
                  c.li         a6, -1
                  sll          ra, a6, zero
733:              c.slli       a3, 9
                  c.sub        s0, a1
                  bgeu         a2, a6, 753f
736:              c.xor        a2, a5
                  c.or         s0, a1
                  and          s9, t1, t5
                  c.nop
740:              c.li         sp, -1
                  c.lui        s4, 12
                  sltiu        s8, t3, -1552
                  xori         t6, a5, 1696
                  sub          t1, gp, t3
                  c.addi16sp   sp, 240
                  auipc        s3, 887212
                  slt          sp, a1, t2
                  slli         sp, a1, 22
                  mulhu        s8, t1, zero
                  auipc        a2, 979907
                  ori          a6, a3, 80
                  div          s9, a3, s11
753:              srli         gp, t3, 2
                  c.addi       s6, 12
                  c.addi       s6, 12
                  c.mv         s10, sp
                  rem          t3, t5, sp
                  bgeu         t2, s9, 775f
                  xor          a3, s3, a7
                  c.beqz       a3, 774f
                  srl          s11, sp, s4
                  srai         zero, s8, 16
                  lui          t0, 926230
                  bgeu         s0, sp, 782f
                  c.or         a3, a5
                  mulh         a1, zero, tp
                  ori          s9, t1, 1117
                  c.sub        s1, a4
                  c.bnez       s1, 789f
                  c.or         s1, s1
                  sra          a7, ra, s1
                  sltiu        s9, a5, 558
                  c.slli       t1, 28
774:              lui          s3, 211401
775:              sll          t2, s3, s1
                  c.srli       s0, 10
                  and          t5, s9, a1
                  srl          s6, a0, s8
                  add          t3, s10, ra
                  ori          t1, s0, -970
                  srli         sp, tp, 28
782:              slli         t1, a0, 30
                  c.addi16sp   sp, 464
                  c.bnez       a2, 801f
                  mulh         t6, zero, s6
                  c.addi4spn   a5, sp, 1008
                  bgeu         s2, ra, 806f
                  c.li         s5, 24
789:              lui          t3, 124965
                  nop
                  blt          a3, a3, 803f
                  mulh         s9, s2, tp
                  mulhsu       a3, s0, s9
                  c.lui        s5, 9
                  add          s10, a3, a2
                  slli         t6, a4, 6
                  beq          s6, s6, 811f
                  blt          t5, s10, 806f
                  c.nop
                  mulh         a5, a2, s6
801:              ori          s0, a6, 143
                  srli         s2, t0, 19
803:              c.add        t1, ra
                  ori          t0, s11, 1021
                  c.addi       s10, 27
806:              sub          a1, sp, t6
                  mulh         s4, a4, s7
                  srli         zero, s0, 29
                  sltu         s0, a2, t3
                  c.bnez       a1, 813f
811:              ori          s1, a2, 455
                  sltiu        s4, s8, 1291
813:              c.srai       s0, 21
                  c.bnez       a1, 817f
                  c.addi16sp   sp, 496
                  slli         t0, ra, 7
817:              slti         a1, t6, 863
                  bltu         s5, a1, 822f
                  c.addi16sp   sp, -16
                  or           a5, s2, s0
                  c.slli       a7, 17
822:              divu         s2, s4, s6
                  bltu         t2, a6, 835f
                  beq          s4, s5, 825f
825:              slti         zero, t2, -1028
                  c.sub        s0, a3
                  add          a3, sp, t1
                  or           ra, t0, tp
                  c.addi       a7, -1
                  blt          s2, t0, 847f
                  bge          a1, a2, 850f
                  c.bnez       a3, 851f
                  xori         t2, s11, -681
                  mulh         t5, s8, s5
835:              c.sub        s0, a1
                  xor          tp, t1, s9
                  add          s9, a6, s2
                  c.andi       a5, 8
                  slti         s11, t3, -1407
                  c.srli       a5, 17
                  slt          t4, s4, s3
                  sltiu        tp, zero, -1458
                  c.srai       a5, 2
                  bge          s9, t2, 852f
                  ori          a5, gp, -1123
                  c.srai       a3, 21
847:              mulhsu       t2, s4, t0
                  c.srai       a2, 3
                  ori          a3, s5, 767
850:              nop
851:              addi         t1, zero, -986
852:              c.mv         t4, a5
                  c.lui        a7, 22
                  rem          t1, s11, a6
                  c.addi16sp   sp, 496
                  div          t1, zero, s10
                  remu         zero, a1, tp
                  slli         t1, tp, 4
                  slli         s3, s9, 9
                  c.addi4spn   a2, sp, 528
                  bgeu         t0, t6, 880f
                  blt          tp, s9, 882f
                  c.sub        s1, s1
                  and          a6, t5, a2
                  and          zero, t5, t1
                  sltiu        s10, a0, 300
                  c.bnez       s1, 878f
                  srli         t4, s4, 11
                  bltu         s8, t1, 880f
                  c.sub        a1, s0
                  c.xor        s1, a2
                  and          s2, s4, s4
                  c.srai       a2, 20
                  bne          a4, ra, 893f
                  c.beqz       a3, 883f
                  ori          s5, a5, 26
                  andi         t5, s9, -979
878:              auipc        t1, 296107
                  ori          t5, t4, -500
880:              xori         t6, s10, 8
                  c.or         a5, a0
882:              slli         a6, t6, 5
883:              and          s9, a0, a1
                  ori          a5, t2, 976
                  srai         t5, a2, 25
                  mul          s0, s2, t0
                  c.addi       a7, -1
                  ori          a7, t6, 1015
                  lui          s4, 585032
                  divu         s8, s4, gp
                  srli         a5, s1, 5
                  bltu         ra, s2, 911f
893:              slli         t2, t0, 23
                  rem          sp, a3, s4
                  c.addi16sp   sp, -16
                  bne          s5, sp, 910f
                  srl          t1, a0, s11
                  c.addi       s11, -1
                  mul          t0, sp, s1
                  and          t2, sp, a5
                  sltu         s9, s5, t2
                  c.slli       s2, 13
                  slti         tp, a5, 1030
                  sltu         a5, t6, t0
                  sub          t0, sp, s0
                  ori          s6, s11, 1159
                  mulhu        s9, t0, t6
                  c.bnez       a1, 915f
                  remu         s1, a0, tp
910:              c.lui        s3, 10
911:              srli         a2, tp, 0
                  mul          s8, s9, s7
                  slli         tp, s0, 9
                  c.mv         gp, s3
915:              c.slli       s9, 10
                  mulh         s3, ra, s6
                  c.sub        s1, a1
                  mulhsu       t3, s8, a2
                  c.slli       s11, 19
                  andi         a5, s4, 850
                  xor          a6, a4, gp
                  rem          t0, ra, a3
                  c.srai       s0, 7
                  sll          sp, t4, s10
                  sub          t0, a6, a2
                  c.add        s11, sp
                  lui          t2, 143150
                  slti         s4, a6, 783
                  lui          a3, 891783
                  c.lui        t4, 29
                  sra          t4, s3, s7
                  mul          a5, a7, sp
                  slli         s10, s3, 9
                  srai         s1, a0, 26
                  c.addi4spn   a2, sp, 288
                  xori         t3, t2, -1766
                  xori         sp, s10, 153
                  sltiu        s10, s4, -1013
                  c.addi16sp   sp, -16
                  mulhu        zero, s5, s4
                  bge          t3, a0, 955f
                  divu         a1, a0, t4
                  ori          tp, sp, 115
                  c.xor        s0, a3
                  divu         t1, s1, t1
                  srli         s1, ra, 4
                  xori         s10, s0, 158
                  add          zero, gp, a7
                  srai         a6, s6, 1
                  bne          zero, s7, 968f
                  c.xor        a2, a0
                  srl          s6, s4, s2
                  c.srli       s0, 14
                  bltu         ra, s4, 972f
955:              nop
                  sll          gp, ra, zero
                  sll          tp, s9, t5
                  mulh         a3, a7, s6
                  divu         a6, a0, s4
                  rem          a6, t3, zero
                  beq          a5, zero, 980f
                  blt          a6, t2, 982f
                  nop
                  slti         s1, t5, 1958
                  c.bnez       s1, 981f
                  c.addi16sp   sp, 288
                  c.add        s8, gp
968:              and          s2, t4, s8
                  sub          a1, s6, a1
                  sra          a1, s9, s10
                  srl          t0, a4, s7
972:              c.addi16sp   sp, 48
                  auipc        a2, 1038341
                  slli         s0, a0, 22
                  bge          t6, t6, 976f
976:              c.srli       s1, 8
                  xor          s9, s9, ra
                  c.addi4spn   a2, sp, 912
                  mulh         zero, t0, zero
980:              c.beqz       s0, 994f
981:              srl          t3, t5, gp
982:              bne          s4, t3, 986f
                  nop
                  andi         s4, tp, 497
                  add          s6, s1, t5
986:              c.or         a2, a1
                  beq          s8, s9, 1004f
                  sll          s11, tp, s3
                  rem          tp, s8, s4
                  c.andi       a5, 14
                  mulhu        s8, ra, a6
                  sltiu        a1, t5, 1045
                  c.slli       tp, 24
994:              or           a7, s4, zero
                  c.srai       s1, 27
                  or           gp, a0, a6
                  c.addi4spn   a3, sp, 864
                  bltu         s8, s11, 1012f
                  or           s3, s7, s0
                  sltiu        s1, t2, 632
                  mulhsu       sp, tp, s6
                  mul          t3, zero, s0
                  nop
1004:             c.li         s4, -1
                  sra          t6, s7, s6
                  c.addi16sp   sp, 336
                  c.sub        s1, a0
                  sra          t0, a6, t6
                  sub          t6, a3, a4
                  sltu         s8, t4, sp
                  beq          s7, a0, 1018f
1012:             mulhu        t2, s0, a1
                  ori          s0, t4, 652
                  lui          a5, 349706
                  div          a2, s0, s2
                  c.beqz       a1, 1021f
                  xori         t5, a1, -1064
1018:             bgeu         ra, a7, 1022f
                  c.beqz       s1, 1020f
1020:             addi         a1, t1, 1177
1021:             c.and        s1, a2
1022:             srai         t1, tp, 18
                  sltu         tp, a1, a1
                  c.lui        a7, 1
                  addi         t0, s11, 1119
                  sltiu        t6, a1, -1204
                  and          a2, t0, s6
                  and          tp, s7, s4
                  c.srai       a3, 8
                  bgeu         t5, s9, 1035f
                  blt          s0, s3, 1050f
                  lui          sp, 500635
                  ori          s5, a3, 1966
                  add          t4, a7, s8
1035:             c.li         t5, -1
                  bne          s10, s4, 1037f
1037:             add          t4, t1, s3
                  sltiu        t3, tp, 1186
                  c.srli       a3, 11
                  and          tp, s7, a1
                  blt          a6, s4, 1052f
                  xor          s8, s4, t5
                  xori         zero, a4, -752
                  c.or         s1, s0
                  c.add        t2, s6
                  nop
                  beq          s4, t0, 1054f
                  xor          s8, s11, s4
                  bne          s11, s6, 1069f
1050:             sra          s4, zero, t6
                  addi         s0, a4, -580
1052:             or           s11, a1, s11
                  srli         t1, s8, 21
1054:             bge          a2, s5, 1062f
                  bne          s7, t5, 1072f
                  mulh         t1, s11, zero
                  lui          s2, 831738
                  divu         t0, s1, t5
                  blt          a3, s10, 1077f
                  divu         a6, s8, s5
                  slli         s2, s9, 22
1062:             c.sub        s0, a4
                  c.slli       a2, 17
                  c.addi16sp   sp, -16
                  sltu         s6, t1, s5
                  sltiu        t4, s1, 1111
                  nop
                  srai         t1, sp, 19
1069:             slli         a5, a1, 26
                  divu         s1, gp, t1
                  beq          t5, t6, 1089f
1072:             andi         s6, gp, -488
                  sll          sp, a7, a7
                  slli         t0, s11, 6
                  srl          a3, t2, a6
                  bltu         a3, ra, 1092f
1077:             c.addi       s1, -1
                  addi         a5, zero, 1389
                  and          t1, s11, s8
                  rem          s6, t3, t4
                  c.srli       s1, 27
                  divu         a3, t3, t0
                  c.addi16sp   sp, -16
                  c.xor        a2, a4
                  bne          t1, a5, 1104f
                  c.addi16sp   sp, 384
                  c.addi       s1, 26
                  div          a7, s8, t2
1089:             c.beqz       s0, 1108f
                  slli         s10, t0, 22
                  slti         t1, s1, 1192
1092:             c.sub        s0, a0
                  bge          a5, s3, 1107f
                  c.or         a1, a3
                  mul          a3, s6, t4
                  mulh         s0, a0, a2
                  c.bnez       s0, 1104f
                  sub          s1, s3, s4
                  c.nop
                  c.lui        t2, 21
                  sll          s2, t3, ra
                  mul          s10, t1, s6
                  srl          tp, zero, t2
1104:             mul          gp, a5, t5
                  addi         a7, tp, -713
                  beq          sp, s7, 1125f
1107:             c.and        s1, a2
1108:             bge          a7, t5, 1122f
                  c.andi       s0, 0
                  remu         t6, a7, s7
                  sltiu        tp, t4, 591
                  ori          t6, a5, -1009
                  la           s11, region_1+119 #start riscv_load_store_rand_instr_stream_7
                  ori          a3, a3, -558
                  sb           t5, 1248(s11)
                  sb           tp, 1541(s11)
                  lb           s8, 1505(s11)
                  lb           gp, 476(s11)
                  lb           a3, 1708(s11)
                  sb           s0, 262(s11)
                  sw           a5, 657(s11)
                  lb           t3, 1428(s11)
                  c.slli       tp, 22
                  lbu          s9, 230(s11)
                  lbu          s10, 40(s11)
                  c.add        s9, gp
                  lbu          t0, 56(s11)
                  sb           t3, 532(s11)
                  c.srai       s0, 18
                  sll          s1, sp, s3
                  lbu          tp, 1566(s11)
                  xor          t6, a2, t6
                  mulhu        gp, a3, s0
                  remu         a3, gp, a0
                  rem          t5, sp, a6
                  sb           a1, 516(s11)
                  lw           s2, 1101(s11)
                  lb           t0, 519(s11)
                  rem          s5, s8, s2
                  div          a2, s3, a5
                  lb           s6, 616(s11)
                  c.nop
                  c.slli       a6, 1
                  lb           s9, 1168(s11)
                  addi         a3, s0, -360
                  lw           tp, 181(s11)
                  c.srai       a2, 30
                  sb           tp, 1770(s11)
                  c.and        a3, a0
                  andi         t2, s4, 1298
                  and          a3, s5, a3
                  sb           ra, 520(s11)
                  addi         s9, t0, -1637
                  sb           s3, -116(s11)
                  lhu          s10, 1317(s11)
                  srai         s5, a1, 9
                  add          s9, s7, ra
                  auipc        zero, 51661
                  lbu          s10, 137(s11)
                  sb           s4, 150(s11)
                  lbu          a2, 850(s11)
                  mul          t1, s8, zero
                  sltu         gp, t2, s3
                  lui          t0, 735697
                  c.xor        a5, s1
                  lh           s1, 1727(s11) #end riscv_load_store_rand_instr_stream_7
                  c.lui        s1, 1
                  xor          s1, sp, s2
                  bne          s3, s11, 1129f
                  c.lui        s2, 21
                  xori         s10, s7, 267
                  c.srai       a3, 27
                  c.beqz       s1, 1123f
                  sll          s4, s11, s1
                  c.andi       s0, 24
1122:             c.sub        s0, a1
1123:             c.bnez       s1, 1126f
                  srl          s9, t3, a2
1125:             sra          gp, gp, a3
1126:             c.srai       a2, 23
                  c.addi16sp   sp, -16
                  slli         a3, a3, 20
1129:             c.xor        a5, a2
                  c.mv         t5, t5
                  beq          t3, s0, 1150f
                  mulhu        a3, t4, sp
                  divu         a6, t6, s4
                  addi         zero, a7, -1995
                  srai         s3, a4, 23
                  c.andi       a5, -1
                  xor          t3, a6, ra
                  srli         t6, a1, 15
                  blt          t1, s8, 1151f
                  c.addi16sp   sp, 448
                  and          a1, a3, s3
                  xori         s8, t1, -653
                  slt          t3, gp, a1
                  sub          a6, zero, a4
                  sltu         s10, s7, zero
                  c.xor        s1, a0
                  c.nop
                  bltu         s5, a3, 1167f
                  slti         a6, t3, 1237
1150:             blt          s4, a5, 1158f
1151:             mulhu        ra, s9, a4
                  c.add        a2, t6
                  c.srai       s1, 11
                  c.add        s5, s6
                  andi         ra, s0, 1876
                  c.srai       a5, 10
                  la           sp, region_0+477 #start riscv_load_store_rand_instr_stream_2
                  lhu          a3, 987(sp)
                  c.and        a1, a5
                  sb           s7, 654(sp)
                  srli         t0, s11, 13
                  lbu          s8, 910(sp)
                  sb           a5, 776(sp)
                  divu         a3, t0, t2
                  sb           t4, 424(sp)
                  c.srai       a5, 13
                  c.mv         t5, s0
                  srli         s0, tp, 25
                  sb           t5, 230(sp)
                  divu         tp, ra, a7
                  sb           a3, -51(sp)
                  sltiu        s0, s0, -259
                  lhu          a2, 67(sp)
                  lbu          s2, -94(sp)
                  sra          s2, s1, t2
                  lhu          t1, 1405(sp)
                  and          ra, gp, s7
                  nop
                  lb           t2, 808(sp)
                  lbu          a2, 1486(sp)
                  rem          s8, a2, s6
                  andi         t4, s0, -638
                  mulh         s5, a6, t6
                  slli         t1, a6, 2
                  lb           t1, -76(sp) #end riscv_load_store_rand_instr_stream_2
                  c.addi       s0, 14
1158:             remu         a2, t5, s8
                  c.li         s3, -1
                  c.srli       a2, 24
                  c.li         a3, 21
                  c.beqz       s1, 1176f
                  sltiu        s9, a4, 929
                  c.srli       a2, 10
                  rem          t3, ra, sp
                  addi         s10, t0, 1066
1167:             c.or         a2, a5
                  xor          s10, a0, a4
                  divu         s1, t6, a4
                  c.srli       s1, 18
                  mulhu        t1, s11, zero
                  srl          sp, a1, a6
                  slti         s5, s11, -225
                  slt          zero, zero, s3
                  sra          s3, a1, t0
1176:             c.addi       t6, -1
                  auipc        a5, 374812
                  c.nop
                  c.addi4spn   a5, sp, 416
                  or           sp, a6, t4
                  slli         a2, s1, 18
                  c.srli       a3, 29
                  lui          gp, 763343
                  slt          s10, a5, s5
                  c.addi4spn   s0, sp, 672
                  mul          t2, s3, t6
                  srl          s1, t4, a1
                  lw           t1, 4(s7)
                  c.and        a3, s1
                  mul          a5, a0, sp
                  addi         s7, s7, 36
                  c.or         a3, s0
                  xor          s10, t3, s5
                  slti         s10, s7, -349
                  slt          t4, a4, zero
1545:             addi x18, x6, 1
1545:             jalr x18, x18, 0
sub_9:            blt          a3, s7, sub_9_stack_p
                  c.mv         s1, s2
                  c.slli       sp, 16
                  c.mv         a6, a4
                  rem          a5, t0, t3
                  c.nop
sub_9_stack_p:    addi         s7, s7, -64
                  addi         t2, s0, -428
                  sw           t1, 4(s7)
                  sra          a5, a0, a3
                  c.li         s10, 22
                  andi         s3, s1, 471
                  c.li         a1, -1
                  sra          s8, t2, zero
                  auipc        a3, 234603
                  c.add        s9, s5
                  sub          t5, s0, a6
                  mulh         s8, s1, s10
                  c.andi       a3, -1
sub_9_j13:        jal          t1, sub_10 #jump sub_9 -> sub_10
                  srai         gp, gp, 15
                  andi         a3, gp, 520
                  slti         a2, s7, -491
                  bltu         t2, sp, 11f
                  c.srai       a2, 25
                  mulhsu       s9, t4, s2
                  bge          a4, gp, 20f
                  xori         a2, tp, -922
                  c.and        a1, a5
                  and          t6, ra, t3
                  xor          a3, s4, s0
11:               c.sub        a2, a4
                  remu         tp, t5, s4
                  add          sp, a4, tp
                  blt          s9, s6, 28f
                  beq          s0, s0, 28f
                  remu         t3, ra, t6
                  c.lui        t6, 31
                  c.srai       a5, 28
                  c.add        t2, a5
20:               sll          zero, a1, t0
                  c.and        a1, a5
                  sltu         s4, t5, s6
                  c.addi       gp, 17
                  c.mv         t4, t5
                  srl          t0, t0, a3
                  xori         s0, s5, 1782
                  andi         a1, t2, 485
28:               sub          s6, t3, a3
                  lw           t1, 4(s7)
                  mulhu        sp, t5, a6
                  c.srli       a2, 18
                  addi         gp, a2, -1025
                  addi         s7, s7, 64
                  slli         t6, s4, 28
55:               addi x27, x6, 1
55:               c.jr x27
sub_3:            blt          a1, zero, sub_3_stack_p
                  c.li         t5, -1
                  auipc        s10, 174476
                  c.li         s3, -1
sub_3_stack_p:    addi         s7, s7, -28
                  sw           t1, 4(s7)
                  c.mv         s11, a3
                  slli         t2, a2, 29
                  mulh         s8, s3, a5
                  sltu         t1, a6, s10
                  la           t5, sub_5
                  andi         sp, s10, 961
                  addi         t5, t5, 370
                  sltiu        s11, tp, -1159
                  auipc        s3, 202545
                  lui          t4, 1015547
                  lui          a2, 625971
                  c.slli       t6, 17
                  bltu         s1, a1, sub_3_j6 #branch to jump instr
                  c.li         s1, -1
                  or           a3, zero, s1
sub_3_j6:         jalr         t1, t5, -370 #jump sub_3 -> sub_5
                  mulh         sp, t0, a6
                  c.srli       a2, 4
                  lui          a1, 442990
                  c.addi       s8, -1
                  sra          t6, a1, t0
sub_3_j7:         jal          t1, sub_4 #jump sub_3 -> sub_4
                  xori         s6, s6, -1952
                  srli         a6, t2, 24
                  c.addi4spn   a1, sp, 976
                  add          a7, t3, gp
                  slli         s1, a0, 3
                  or           a5, s7, a5
                  c.lui        s1, 27
sub_3_j8:         jal          t1, sub_7 #jump sub_3 -> sub_7
                  c.sub        a1, a5
                  c.and        a5, a2
                  xor          gp, t2, a4
                  nop
                  sltiu        t4, s0, 562
                  slli         t5, ra, 18
                  c.addi4spn   a5, sp, 544
                  c.slli       s1, 10
                  mulh         gp, s11, s5
                  c.lui        s11, 8
sub_3_j9:         jal          t1, sub_6 #jump sub_3 -> sub_6
                  c.srli       a2, 10
                  c.andi       s1, -1
                  div          s11, sp, t2
                  sltiu        gp, a2, 1477
                  slt          a6, a5, zero
                  addi         sp, s5, -48
                  c.addi4spn   a1, sp, 48
                  ori          a7, t3, -1522
                  bltu         s1, s1, 19f
                  c.add        s2, t1
                  srl          a5, s0, ra
                  sltu         sp, s4, a2
                  bge          gp, ra, 15f
                  c.xor        a3, a3
                  c.addi4spn   a2, sp, 736
15:               srl          s11, a6, s3
                  addi         s2, sp, -630
                  mul          s5, s5, gp
                  c.or         s1, a1
19:               slt          a2, s9, a0
                  c.addi16sp   sp, 160
                  c.addi       sp, -1
                  bgeu         t5, tp, 25f
                  andi         a1, s7, 1869
                  c.nop
25:               ori          tp, s9, 914
                  andi         a5, a7, 1279
                  mulhu        tp, gp, s5
                  xori         s5, a6, -1507
                  mulhu        a1, a3, s4
                  lui          s2, 5680
                  bge          a5, t6, 41f
                  sll          a2, s3, tp
                  c.li         s11, -1
                  nop
                  slt          s10, s0, s2
                  sltiu        s6, sp, -390
                  c.slli       a6, 6
                  c.li         s3, 6
                  auipc        s10, 129329
                  c.srli       a2, 12
41:               mul          t2, s1, a5
                  srl          t3, a3, t3
                  div          s11, a4, a3
                  sltiu        a5, zero, -624
                  add          s1, a3, a2
                  srai         zero, s8, 24
                  c.srli       s0, 18
                  c.lui        a7, 20
                  c.and        a3, s1
                  lw           t1, 4(s7)
                  xor          s11, s6, a6
                  c.lui        s5, 6
                  c.srli       a2, 22
                  add          a6, t5, s2
                  c.addi16sp   sp, 80
                  addi         s7, s7, 28
                  div          a5, a1, tp
                  sll          s9, s2, t2
106:              addi x5, x6, 0
106:              jalr x5, x5, 0
sub_8:            srl          s9, sp, t5
                  and          tp, tp, zero
                  addi         s7, s7, -52
                  c.or         a2, a1
                  c.add        t4, t3
                  sw           t1, 4(s7)
                  andi         a6, t1, -765
                  la           s5, sub_10
                  addi         s5, s5, 405
                  div          tp, t2, t5
                  c.srli       a1, 4
                  bltu         s7, a7, sub_8_j12 #branch to jump instr
                  c.addi4spn   a2, sp, 992
                  rem          a5, gp, s0
                  c.andi       a5, 27
sub_8_j12:        jalr         t1, s5, -405 #jump sub_8 -> sub_10
                  slli         t3, t4, 22
                  c.bnez       a5, 18f
                  c.andi       s1, 24
                  auipc        sp, 418291
                  div          a5, a2, tp
                  bne          sp, tp, 8f
                  andi         s8, t3, 1861
                  srl          a2, t0, s11
8:                srli         t6, s2, 2
                  mul          t6, t5, ra
                  bge          s11, s2, 26f
                  c.addi16sp   sp, -16
                  bne          s10, s10, 20f
                  auipc        a7, 101943
                  nop
                  auipc        t4, 590049
                  c.sub        a3, a2
                  andi         zero, a7, 1920
18:               sltu         t6, s2, a6
                  c.beqz       s0, 33f
20:               ori          s11, a3, -945
                  srli         t4, a2, 17
                  slti         ra, s3, -1376
                  slti         t0, t4, 692
                  c.or         s1, a2
                  srli         a3, t6, 9
26:               c.and        a5, a2
                  blt          s4, t3, 38f
                  xor          t6, s5, s1
                  mul          t3, a2, t3
                  beq          t2, s8, 38f
                  mul          a6, tp, a7
                  c.sub        a5, a0
33:               nop
                  lui          sp, 654551
                  srl          s5, a2, a0
                  c.srli       s0, 16
                  slli         ra, s10, 8
38:               nop
                  lw           t1, 4(s7)
                  c.addi16sp   sp, -16
                  c.andi       a3, 5
                  c.nop
                  c.or         a3, s1
                  and          a2, zero, s5
                  sub          t3, a5, s5
                  xor          s8, s11, a6
                  c.srli       a2, 29
                  addi         s7, s7, 52
                  slt          t4, s4, t3
                  xori         t5, t2, 195
67:               addi x8, x6, 1
67:               c.jr x8
sub_7:            c.beqz       a5, sub_7_stack_p
                  c.or         a3, a3
sub_7_stack_p:    addi         s7, s7, -36
                  c.addi16sp   sp, -16
                  andi         s1, s0, 221
                  divu         t0, t3, a0
                  c.nop
                  sw           t1, 4(s7)
                  rem          s5, gp, tp
                  c.sub        a2, s0
                  slt          s11, gp, s2
                  c.nop
                  la           s9, sub_9
                  divu         sp, s3, s2
                  sub          t2, s11, a0
                  addi         s9, s9, 62
                  lui          sp, 960410
                  beq          a5, a7, sub_7_j11 #branch to jump instr
                  xori         a1, a3, 1062
                  c.addi4spn   a5, sp, 592
                  sub          s6, a5, s7
sub_7_j11:        jalr         t1, s9, -62 #jump sub_7 -> sub_9
                  ori          s11, s2, 650
                  c.addi       t5, 30
                  c.srli       s0, 3
                  add          s10, s9, zero
                  andi         s1, s5, 1491
                  bltu         s1, t0, 10f
                  mulhsu       tp, s1, s7
                  sltu         t0, s4, a2
                  xor          s10, a5, sp
                  bgeu         t6, s6, 10f
10:               c.li         s6, -1
                  slli         t4, t5, 0
                  xor          s8, s8, a5
                  mul          a6, t1, s0
                  lw           t1, 4(s7)
                  and          s1, t3, sp
                  rem          s5, gp, s11
                  rem          a6, a0, zero
                  c.addi4spn   a3, sp, 784
                  addi         s7, s7, 36
                  c.srli       a1, 28
                  c.lui        t5, 14
44:               addi x19, x6, 1
44:               c.jalr x19
sub_2:            bgeu         ra, a5, sub_2_stack_p
                  c.add        sp, s5
sub_2_stack_p:    addi         s7, s7, -12
                  and          s4, s7, a4
                  sw           t1, 4(s7)
                  srai         gp, a3, 3
                  add          t6, a2, s6
                  la           sp, region_0+645 #start riscv_load_store_rand_instr_stream_4
                  sb           s0, 570(sp)
                  lbu          s8, -443(sp)
                  sra          s10, t5, s8
                  c.andi       a1, -1
                  sltu         s9, a5, s7
                  sub          t3, s4, s9
                  xori         a3, t5, -1503
                  lbu          t6, -451(sp)
                  lbu          zero, 1235(sp)
                  lb           s3, 1115(sp)
                  lb           s8, 616(sp)
                  slli         s4, s9, 30
                  c.srai       a2, 31
                  lbu          ra, 504(sp)
                  c.andi       a3, 19
                  lh           s10, -577(sp)
                  lb           s3, 81(sp)
                  slt          a1, t6, a2
                  lb           t5, 885(sp)
                  lb           zero, 63(sp)
                  lb           t0, -382(sp)
                  sh           t6, 1229(sp)
                  sb           s7, -331(sp)
                  add          t1, s2, sp
                  divu         a2, s10, a6
                  sltu         gp, s9, t1
                  nop
                  ori          s3, t0, 283
                  rem          s10, t5, a2
                  c.lui        a2, 29
                  sb           t5, 524(sp)
                  slli         gp, s7, 4
                  lw           s0, -565(sp)
                  lbu          a6, 453(sp)
                  c.and        a3, a3
                  lbu          s1, -28(sp)
                  lbu          t0, 370(sp)
                  nop
                  mulhu        t4, s1, t5
                  lw           s10, -45(sp)
                  sll          s6, s4, t2
                  or           s2, a6, s0
                  ori          zero, s4, -759
                  c.li         t3, -1
                  c.li         s2, 1
                  c.andi       s1, -1
                  srai         a5, a3, 13
                  xori         s9, t4, -235
                  c.sub        s1, a5
                  sb           a3, -351(sp)
                  sb           s4, -288(sp) #end riscv_load_store_rand_instr_stream_4
                  la           a5, region_1+54 #start riscv_load_store_rand_instr_stream_0
                  slti         s1, t5, -1696
                  c.add        a7, a3
                  auipc        t3, 237686
                  lb           s3, 59(a5)
                  c.li         s6, 4
                  andi         t0, gp, -2035
                  lbu          sp, -18(a5)
                  lhu          t2, -26(a5)
                  lb           t5, -12(a5)
                  srl          a1, zero, ra
                  c.srai       s1, 7
                  sb           s8, 52(a5)
                  xori         a2, t4, 1492
                  c.add        s9, s5
                  c.and        a2, s1
                  mulhu        s6, s4, gp
                  lb           a2, -35(a5)
                  srli         t4, s11, 18
                  sll          s1, s4, s8
                  lbu          s9, 9(a5)
                  c.srli       s0, 21
                  xori         s11, t4, -925
                  c.addi4spn   a2, sp, 864
                  sra          s6, tp, t3
                  c.srai       a3, 8
                  lbu          s0, 63(a5)
                  lbu          t1, -9(a5)
                  sra          s10, t1, a4
                  lh           ra, -40(a5)
                  c.mv         a7, s10
                  lbu          t4, -20(a5)
                  sub          s2, ra, a5
                  sb           t4, -44(a5)
                  lb           gp, -8(a5)
                  lbu          s2, -1(a5)
                  sh           zero, -18(a5) #end riscv_load_store_rand_instr_stream_0
                  la           s1, region_1+807 #start riscv_load_store_rand_instr_stream_3
                  c.li         t6, -1
                  lb           s5, 27(s1)
                  mulhsu       s3, t0, s7
                  lbu          a7, -17(s1)
                  lb           a2, 15(s1)
                  lbu          a5, 27(s1)
                  sb           s9, -11(s1)
                  lw           s3, -15(s1)
                  c.addi4spn   a2, sp, 752
                  rem          s6, s6, a2
                  c.or         s0, s1
                  sb           a3, 3(s1)
                  lhu          s5, 7(s1)
                  lbu          a2, -62(s1)
                  sh           s3, 43(s1)
                  sb           s1, -40(s1)
                  slt          t5, t3, t2
                  lb           gp, 41(s1)
                  lbu          t0, -10(s1)
                  lb           a1, 54(s1)
                  xor          t6, s1, s8
                  sra          s11, a2, t1
                  sb           s7, 50(s1)
                  auipc        tp, 625408
                  lb           s2, -13(s1)
                  lb           sp, 10(s1)
                  c.sub        a5, a4
                  c.srai       a1, 22
                  sb           s5, -16(s1)
                  lbu          sp, -34(s1)
                  c.li         s6, -1
                  div          t4, s10, s4
                  sltiu        sp, sp, 623
                  lbu          s10, -25(s1)
                  sb           a1, 18(s1)
                  c.xor        a3, s1
                  sb           zero, 9(s1)
                  c.xor        a3, s0
                  lbu          a7, -15(s1)
                  lhu          a7, -57(s1)
                  and          s8, zero, s1
                  c.nop
                  c.andi       a3, 13
                  lb           a7, -1(s1)
                  sb           t4, 18(s1) #end riscv_load_store_rand_instr_stream_3
                  la           sp, region_1+1618 #start riscv_load_store_rand_instr_stream_5
                  lbu          tp, -32(sp)
                  lbu          s9, -36(sp)
                  sb           s6, 28(sp)
                  lbu          s11, 57(sp)
                  c.srli       a2, 20
                  lbu          t3, -21(sp)
                  sb           t0, 48(sp)
                  c.add        s1, s5
                  c.andi       a3, -1
                  divu         t0, s9, a1
                  lbu          a7, -42(sp)
                  lhu          ra, 52(sp)
                  lhu          gp, 64(sp)
                  lb           a7, -10(sp)
                  lb           a3, -56(sp)
                  lw           s9, 50(sp)
                  xori         zero, s0, -1886
                  lhu          s6, 20(sp)
                  sb           t0, -57(sp)
                  sb           gp, 2(sp)
                  lbu          s3, -8(sp)
                  sh           t6, 42(sp)
                  add          s5, s5, s6
                  sltu         a2, s8, s0
                  lhu          s10, -10(sp)
                  lb           a1, 17(sp)
                  sh           t2, -36(sp)
                  sub          gp, s5, t1
                  slli         s5, t6, 30
                  lbu          s0, 35(sp)
                  sh           a1, -40(sp)
                  divu         a3, a7, t4
                  sb           t0, -35(sp)
                  lh           s10, 58(sp) #end riscv_load_store_rand_instr_stream_5
                  c.addi16sp   sp, -16
                  xor          s1, ra, a2
                  div          s4, t6, tp
                  bgeu         a2, sp, 17f
                  div          s0, a1, s9
                  sltiu        s4, tp, -1122
                  blt          a7, t4, 15f
                  srl          a2, s3, t5
                  c.beqz       a5, 12f
                  c.nop
                  srai         t5, a3, 6
                  divu         t4, s5, t4
12:               c.lui        s6, 28
                  sltu         t4, s4, t6
                  c.or         s1, a0
15:               sub          a1, s11, s6
                  mulhu        t0, a1, a3
17:               c.bnez       a3, 32f
                  sub          t3, sp, a7
                  or           t0, t1, gp
                  xor          s6, a2, a3
                  bne          s0, t6, 29f
                  div          tp, zero, s1
                  slt          s0, s4, s1
                  c.bnez       a2, 34f
                  srai         s1, s11, 12
                  remu         zero, a4, s4
                  bge          tp, a5, 42f
                  auipc        t1, 1032976
29:               c.xor        a2, a0
                  rem          a6, t0, t3
                  beq          tp, s4, 48f
32:               mulhu        t1, s4, t6
                  blt          zero, s2, 37f
34:               auipc        s0, 488675
                  lui          a1, 357669
                  c.and        a5, a5
37:               add          t4, t2, ra
                  c.add        s0, t0
                  blt          sp, gp, 57f
                  la           gp, sub_3
                  andi         s6, a4, 897
                  addi         gp, gp, 365
                  c.li         ra, 25
                  bne          ra, s11, sub_2_j5 #branch to jump instr
                  divu         s5, a5, a3
                  c.slli       s2, 30
                  c.addi       t2, 28
                  c.addi       t2, -1
                  c.add        s9, t2
sub_2_j5:         jalr         t1, gp, -365 #jump sub_2 -> sub_3
                  lui          s5, 1028894
                  xor          t1, t2, t1
42:               ori          t3, s8, -1383
                  c.xor        a3, a2
                  sltu         s0, s4, s4
                  mulhu        s10, a2, s9
                  bgeu         s0, a4, 63f
                  div          a1, s1, sp
48:               auipc        t6, 706017
                  c.add        a2, ra
                  andi         s2, s4, 1028
                  and          t2, sp, sp
                  bgeu         s9, zero, 66f
                  slti         s1, a6, -650
                  bne          s4, t1, 65f
                  bgeu         t6, a7, 59f
                  addi         gp, t2, 1538
57:               c.andi       a3, -1
                  c.or         s0, a1
59:               sltiu        s3, s4, -908
                  and          gp, s11, t0
                  c.lui        t2, 9
                  beq          t5, s7, 69f
63:               c.or         a5, s0
                  blt          a7, s9, 67f
65:               c.li         a5, 5
66:               c.nop
67:               sltu         t4, s3, s10
                  c.srli       a2, 19
69:               c.li         a1, 4
                  blt          a4, s10, 72f
                  div          t4, s10, a3
72:               c.and        a1, a4
                  c.bnez       a1, 74f
74:               remu         s0, a2, a2
                  and          t1, s6, t2
                  c.xor        s0, a5
                  rem          t6, s5, gp
                  ori          a6, ra, -1108
                  slli         s4, a0, 26
                  slti         s1, a6, 334
                  srli         t6, t0, 29
                  sub          s10, s10, tp
                  and          tp, sp, ra
                  c.or         s0, s0
                  srli         s3, t6, 11
                  nop
                  sra          t5, t0, a3
                  c.slli       s1, 28
                  c.bnez       a1, 93f
                  la           s2, region_1+1917 #start riscv_load_store_rand_instr_stream_1
                  divu         s1, t1, s0
                  addi         s3, s3, -492
                  lb           a6, -1526(s2)
                  sb           a6, -1100(s2)
                  auipc        s9, 5963
                  lw           a6, -1837(s2)
                  sb           s11, -1074(s2)
                  lbu          a1, -1803(s2)
                  sh           zero, -1831(s2)
                  xori         s9, t3, -318
                  sh           s4, -195(s2)
                  or           t1, t4, a2
                  auipc        a6, 434188
                  sb           t5, -1823(s2)
                  lhu          t2, -1471(s2)
                  lhu          ra, -843(s2)
                  lbu          a1, -268(s2)
                  mulhsu       t6, t3, ra
                  lh           t2, -331(s2)
                  lbu          t6, -863(s2)
                  sb           s9, -1424(s2)
                  sb           t6, -1160(s2)
                  sb           s10, -1103(s2)
                  sb           a2, -769(s2)
                  sb           t5, -648(s2)
                  srai         s8, s1, 27
                  lbu          s4, -959(s2)
                  sltu         a3, t6, s8
                  sh           s4, -921(s2)
                  c.addi16sp   sp, 288
                  sb           s1, -272(s2)
                  lbu          zero, -634(s2)
                  lb           sp, -198(s2)
                  lb           s11, -1705(s2)
                  lbu          t2, -1558(s2)
                  lb           s10, 68(s2)
                  sh           a4, -1749(s2)
                  lbu          t5, -1304(s2) #end riscv_load_store_rand_instr_stream_1
                  c.and        s1, s0
                  xori         a6, t3, 679
                  c.slli       t6, 23
93:               c.nop
                  xor          s9, a0, ra
                  srli         a5, a1, 4
                  andi         sp, s2, 886
                  divu         ra, s9, s5
                  addi         zero, t5, -859
                  div          s6, s4, s2
                  c.andi       a2, -1
                  c.slli       s9, 20
                  divu         s9, tp, t3
                  slt          s0, a5, t2
                  c.mv         t4, gp
                  c.addi16sp   sp, 320
                  c.sub        a3, a4
                  c.xor        a1, a4
                  bne          s0, tp, 109f
109:              or           t0, t2, s2
                  addi         ra, s2, 2001
                  rem          ra, t0, t3
                  mulhu        a5, gp, a0
                  slti         s3, s9, -451
                  and          a6, t5, t1
                  blt          s1, t1, 117f
                  sltiu        a5, s8, 525
117:              rem          t4, zero, a7
                  sra          a6, tp, zero
                  rem          t5, s1, s2
                  slt          s10, a0, t1
                  ori          ra, s5, 923
                  c.xor        a3, a0
                  blt          s3, a4, 140f
                  or           s2, gp, zero
                  bgeu         s1, a6, 129f
                  slli         s4, gp, 11
                  bltu         t1, s0, 132f
                  addi         s11, s1, 1921
129:              sltu         a1, sp, a0
                  ori          t2, tp, -681
                  bne          t5, s4, 132f
132:              remu         s10, s6, a0
                  srli         a6, s4, 18
                  addi         gp, s10, -1313
                  sll          a7, t4, t3
                  remu         s9, t6, a0
                  c.bnez       a2, 144f
                  slti         gp, a4, 1900
                  rem          s9, t6, s4
140:              lui          a7, 9127
                  slti         a3, s2, 88
                  nop
                  c.andi       s1, -1
144:              blt          s4, t3, 154f
                  andi         s2, s1, -1971
                  slli         t6, a6, 13
                  c.addi16sp   sp, 48
                  xor          a5, s10, sp
                  slli         a6, t3, 9
                  mulh         t5, a0, s6
                  c.andi       s1, -1
                  c.addi4spn   a2, sp, 32
                  add          t2, s10, a1
154:              lui          s6, 927024
                  slli         a7, t5, 20
                  xori         t2, s5, 800
                  bge          s7, a5, 172f
                  div          s10, s4, a5
                  sub          t3, t3, a2
                  mulh         s5, s1, s1
                  sltu         s10, s10, a5
                  c.srai       a3, 6
                  c.and        a1, a3
                  divu         t1, gp, a4
                  remu         s6, s6, s1
                  srai         a2, a7, 1
                  and          a3, a6, s7
                  sra          s2, s3, zero
                  mulh         s6, a4, s1
                  slt          t2, s4, a1
                  srl          t6, s10, t6
172:              c.mv         a2, tp
                  c.mv         a5, t0
                  div          a7, a7, zero
                  rem          s0, s6, a6
                  divu         t6, zero, s11
                  sll          t1, s6, t1
                  srai         a1, s11, 16
                  mul          a7, s4, tp
                  srli         a2, s1, 28
                  blt          s5, s1, 182f
182:              c.slli       a7, 22
                  andi         a5, a6, -19
                  blt          s9, t5, 197f
                  c.andi       s0, -1
                  remu         s3, s3, s3
                  addi         s6, t2, -994
                  beq          s6, s11, 192f
                  and          s1, t4, a3
                  c.add        t5, gp
                  or           ra, a0, ra
192:              lui          t1, 688332
                  srli         a7, t2, 9
                  c.slli       tp, 11
                  bltu         a5, s0, 213f
                  sub          ra, a5, t5
197:              nop
                  xor          t0, a1, sp
                  srli         t2, s7, 29
                  bge          gp, a7, 204f
                  mulhu        a7, t2, t4
                  nop
                  div          t2, s10, s0
204:              mulhu        t5, t1, a6
                  ori          a3, s11, -750
                  c.addi4spn   s0, sp, 592
                  mulhsu       s1, a0, s6
                  c.or         a1, a0
                  slli         a5, s3, 7
                  c.and        a2, a2
                  slt          t5, t3, t0
                  and          a1, sp, s7
213:              mulhu        t2, t4, a5
                  div          s8, a3, a5
                  c.srai       a2, 30
                  add          s6, a0, s0
                  andi         s0, a2, 1268
                  addi         t0, t2, 1382
                  mul          t0, a5, gp
                  c.and        s1, a3
                  c.lui        gp, 1
                  c.xor        s1, a0
                  c.xor        a3, a0
                  c.andi       a5, 28
                  srai         t0, s10, 15
                  nop
                  and          s2, a6, s0
                  c.srai       a2, 24
                  add          t2, a4, a1
                  sltiu        s10, s0, 679
                  c.add        ra, s7
                  srli         s2, s0, 31
                  c.srai       a1, 26
                  slli         t3, sp, 30
                  srl          a5, a6, zero
                  sltiu        a2, a0, 1684
                  ori          gp, a4, 1059
                  c.addi16sp   sp, -16
                  c.and        a1, a3
                  addi         ra, a2, -1686
                  c.xor        a5, a3
                  c.and        a3, a0
                  bne          t2, s9, 253f
                  sltu         t5, t5, t1
                  bltu         a6, a0, 249f
                  remu         a7, t0, zero
                  c.nop
                  c.or         s0, s0
249:              slli         a6, s0, 20
                  c.bnez       a2, 267f
                  c.andi       a5, -1
                  sltu         t0, s0, ra
253:              bge          s0, a3, 261f
                  bne          s0, tp, 269f
                  sra          t6, zero, s5
                  mul          s3, s8, s5
                  srl          s9, t5, s6
                  xori         s5, a6, -683
                  c.bnez       a2, 270f
                  mul          a3, s0, s4
261:              blt          t4, s8, 278f
                  c.and        s1, a3
                  mulhu        a1, s11, t5
                  bltu         t1, sp, 271f
                  andi         s6, s5, 971
                  addi         gp, zero, 1867
267:              beq          zero, s0, 280f
                  c.li         a7, -1
269:              c.mv         gp, a3
270:              c.add        a7, s1
271:              c.sub        s0, a4
                  ori          s10, a1, -1773
                  xor          s8, ra, a6
                  c.nop
                  rem          s0, t0, a6
                  bgeu         s10, t1, 291f
                  c.xor        s1, a0
278:              div          t5, s6, ra
                  srai         s9, s10, 23
280:              bgeu         a7, s9, 295f
                  and          t5, t6, tp
                  addi         t3, s0, -1686
                  xori         t5, t5, 1944
                  xori         s10, a0, -1845
                  nop
                  div          a7, t1, s1
                  mul          s6, zero, s7
                  beq          s4, s1, 305f
                  srli         zero, s2, 28
                  c.addi       ra, 29
291:              nop
                  c.beqz       s0, 293f
293:              remu         a7, t3, s3
                  xori         s10, s11, -371
295:              xori         sp, s8, 551
                  slti         s11, a1, -1280
                  c.nop
                  sra          s4, ra, sp
                  c.and        a3, a5
                  slti         sp, tp, 695
                  c.li         t1, -1
                  ori          a1, s8, 479
                  xor          sp, tp, a2
                  blt          a3, s11, 318f
305:              and          t4, t0, t1
                  c.lui        s4, 14
                  and          gp, tp, t3
                  mulhu        s10, a2, s4
                  sltiu        s2, t2, 793
                  srli         a6, s9, 10
                  bgeu         s7, s10, 321f
                  slti         t0, s3, 375
                  slli         ra, s9, 28
                  bltu         a4, sp, 315f
315:              srli         ra, s0, 3
                  c.sub        a3, a0
                  c.sub        a2, s0
318:              or           s6, a4, s10
                  c.addi4spn   a5, sp, 848
                  mul          sp, s3, tp
321:              mulh         s6, s10, tp
                  ori          gp, s10, 78
                  c.li         t2, -1
                  xori         a7, t0, 9
                  bge          s0, s0, 327f
                  sltu         sp, s4, a1
327:              or           s5, s4, t5
                  sltu         s3, a4, gp
                  c.slli       s2, 23
                  srai         ra, a7, 7
                  c.srai       a1, 31
                  sra          s6, s5, a1
                  c.sub        s0, a5
                  bge          s10, t6, 338f
                  c.sub        a3, a2
                  mulhu        t3, t4, a2
                  sra          s10, a1, s3
338:              slti         t6, zero, 1031
                  sltu         t2, ra, gp
                  mulhu        s4, s2, s2
                  c.xor        a2, a3
                  c.slli       s3, 7
                  bltu         t6, a0, 352f
                  c.bnez       a2, 349f
                  c.bnez       a5, 348f
                  c.addi4spn   s1, sp, 576
                  rem          a3, t5, s8
348:              slli         t3, s1, 26
349:              divu         s0, t0, s10
                  c.andi       a1, 24
                  c.mv         s11, a5
352:              sll          t3, s7, t1
                  c.sub        s0, a1
                  mulh         t5, sp, t4
                  mulhu        t6, s6, sp
                  sltiu        s10, s9, 467
                  c.xor        s1, s1
                  c.add        ra, a0
                  mulhsu       t0, t3, t0
                  srai         t2, a4, 12
                  mulh         t0, s11, s6
                  c.beqz       s1, 376f
                  c.bnez       s0, 364f
364:              div          t6, a4, s8
                  bge          s9, s0, 372f
                  c.nop
                  xori         tp, a5, 483
                  c.xor        s0, a4
                  mulh         a6, t5, t6
                  slli         s8, s3, 31
                  ori          a2, a0, -162
372:              blt          t0, a2, 374f
                  c.addi16sp   sp, 480
374:              c.srli       s1, 15
                  bltu         a2, sp, 376f
376:              sltiu        s5, s10, 1812
                  c.mv         s2, s10
                  slli         a6, a1, 19
                  c.or         a3, a2
                  and          zero, s1, t4
                  xori         a3, s9, 1906
                  lui          s2, 711387
                  srl          s3, t6, s2
                  c.beqz       a3, 388f
                  c.srai       a1, 22
                  c.sub        s0, a0
                  srl          t1, t3, a1
388:              c.li         a5, -1
                  lui          a2, 503174
                  sll          s11, a2, ra
                  c.bnez       a5, 401f
                  or           a5, t6, a1
                  c.andi       a5, -1
                  mul          t5, s3, a1
                  c.and        a5, a0
                  sltiu        a5, t6, -858
                  la           sp, region_0+278 #start riscv_load_store_rand_instr_stream_2
                  mulhu        tp, a6, s11
                  lhu          s10, 124(sp)
                  and          s5, s7, zero
                  slt          t3, s7, a2
                  sh           a6, -190(sp)
                  c.slli       tp, 3
                  sb           s11, -77(sp)
                  lbu          t4, 68(sp)
                  sb           gp, -167(sp)
                  addi         gp, t4, -1672
                  lbu          t3, -35(sp)
                  addi         s10, s4, 70
                  c.add        s11, s10
                  andi         a1, a1, 1812
                  sb           s6, -11(sp)
                  c.or         a3, s0
                  lb           s6, 236(sp)
                  mulhu        t6, s8, gp
                  sb           s9, -93(sp)
                  and          ra, s4, s0
                  c.and        s1, a5
                  c.or         s1, a2
                  mulhsu       t6, t2, a3
                  sra          a6, a3, a1
                  sh           a3, 162(sp)
                  sltiu        s3, s4, -414
                  lui          s2, 230863
                  andi         gp, s2, 1647
                  andi         a1, t5, 19
                  lh           s5, -192(sp)
                  lb           s3, 189(sp)
                  sltu         gp, a2, a1
                  sltu         a6, t4, t3
                  lh           s8, -212(sp)
                  sb           s11, -17(sp)
                  lb           s10, 174(sp)
                  xori         s9, a1, 14
                  c.slli       t3, 24
                  sh           t4, 22(sp)
                  lhu          s4, 80(sp)
                  sb           s5, 223(sp)
                  sb           a5, -137(sp) #end riscv_load_store_rand_instr_stream_2
                  mulh         s4, a7, a4
                  c.bnez       a5, 402f
                  mulhsu       a7, s0, t6
                  div          t4, s5, s5
401:              slti         tp, s6, 1355
402:              rem          a1, s8, s3
                  c.bnez       a5, 407f
                  div          s3, gp, s9
                  c.srai       a5, 15
                  c.srli       s1, 26
407:              c.addi4spn   a3, sp, 704
                  c.andi       s0, -1
                  andi         s11, zero, 1772
                  beq          a2, a0, 412f
                  addi         s0, a5, 786
412:              rem          s10, zero, ra
                  ori          s11, gp, -1031
                  or           sp, a6, s10
                  bgeu         t0, a4, 418f
                  blt          tp, t3, 429f
                  ori          s10, a3, 1246
418:              blt          t6, a3, 419f
419:              andi         s4, t1, -632
                  c.srai       a5, 6
                  c.andi       a3, 25
                  xor          s3, a4, s2
                  bltu         t1, s7, 427f
                  c.beqz       a5, 438f
                  slli         t4, t3, 9
                  andi         s0, ra, 1121
427:              ori          t0, sp, -1604
                  c.srli       a3, 11
429:              srli         a3, gp, 9
                  sub          a5, t5, a1
                  c.and        a5, a1
                  and          gp, t3, tp
                  c.nop
                  bltu         t3, s9, 439f
                  slti         a2, s2, -376
                  slti         tp, a2, 1247
                  bltu         s10, s6, 452f
438:              srai         t5, t2, 10
439:              mulh         s10, a7, t0
                  c.lui        a2, 17
                  c.bnez       a5, 458f
                  divu         s3, sp, a7
                  srai         gp, tp, 0
                  srai         t3, s0, 9
                  sltu         t0, t0, a3
                  bne          t4, a5, 447f
447:              or           a5, a5, s5
                  c.addi16sp   sp, 48
                  c.beqz       a3, 451f
                  sltiu        s4, s1, 879
451:              bge          a1, s4, 452f
452:              srli         s10, a0, 2
                  slli         s3, s8, 1
                  div          a5, tp, s10
                  xori         s10, s0, -1551
                  div          t3, s2, s9
                  c.nop
458:              sub          s1, tp, t6
                  c.or         a1, s1
                  xor          a1, s3, t3
                  mulhsu       zero, gp, s9
                  c.bnez       a2, 469f
                  sub          a7, t3, a0
                  c.addi16sp   sp, 16
                  blt          s5, s2, 476f
                  bltu         t1, zero, 484f
                  srli         s6, a6, 15
                  bltu         a0, a5, 472f
469:              and          t5, s4, s0
                  xori         ra, gp, -1399
                  rem          s3, a6, s9
472:              mulhsu       s10, t5, t3
                  beq          t2, t0, 474f
474:              bltu         s5, t5, 478f
                  mulhu        sp, t2, a1
476:              div          a5, a0, s8
                  mul          s2, s2, t4
478:              mulhu        t5, a3, s3
                  c.andi       a5, 31
                  c.add        s3, s1
                  lui          gp, 935074
                  andi         ra, a7, -1405
                  bgeu         s1, s5, 500f
484:              bltu         t6, s6, 499f
                  c.addi       t0, -1
                  bgeu         a0, a2, 495f
                  c.li         s0, -1
                  mulh         t3, a5, t3
                  c.srai       a2, 24
                  beq          s11, t6, 498f
                  rem          t6, s10, a5
                  beq          tp, s9, 506f
                  sltu         a3, t0, t1
                  c.and        a3, s1
495:              c.sub        a2, s0
                  c.mv         t3, t2
                  nop
498:              add          s3, a7, gp
499:              c.andi       a1, -1
500:              rem          s5, t0, t3
                  sub          s8, a5, a3
                  slli         s6, t0, 4
                  c.sub        a3, s1
                  c.slli       a3, 29
                  c.addi16sp   sp, 128
506:              remu         a7, s4, t4
                  nop
                  c.addi16sp   sp, 432
                  lui          t2, 192842
                  c.and        s1, s1
                  rem          ra, s1, t6
                  blt          zero, s11, 519f
                  c.beqz       s0, 530f
                  rem          s9, a2, s9
                  c.mv         s5, t0
                  c.addi16sp   sp, 288
                  sltu         s5, s1, a1
                  mulh         zero, a4, s4
519:              auipc        tp, 438035
                  sltiu        zero, s0, -925
                  auipc        gp, 883413
                  andi         a7, ra, 1416
                  addi         s2, s3, -79
                  srl          s11, s8, tp
                  and          s8, s6, s4
                  c.nop
                  sll          s11, t0, s1
                  div          sp, a0, t0
                  remu         s10, s3, a5
530:              c.slli       s6, 22
                  c.addi4spn   a5, sp, 896
                  remu         zero, t2, gp
                  rem          ra, a1, t6
                  nop
                  c.addi16sp   sp, -16
                  c.beqz       s1, 546f
                  and          t4, t4, s4
                  nop
                  nop
                  lui          s11, 467765
                  andi         a2, t4, 1960
                  c.li         a5, -1
                  beq          zero, s0, 558f
                  c.bnez       s0, 545f
545:              bltu         a6, t4, 562f
546:              mulhsu       sp, s4, a0
                  c.and        a3, a2
                  c.or         s1, a1
                  c.andi       s0, 16
                  srli         s3, t1, 0
                  xor          a3, s9, sp
                  c.or         a3, a3
                  c.bnez       a3, 557f
                  xor          t1, s0, a4
                  bltu         s6, s11, 566f
                  slli         s4, t6, 15
557:              c.slli       a2, 19
558:              mulh         t6, t5, a7
                  c.nop
                  c.beqz       s1, 575f
                  mulh         ra, s2, t1
562:              addi         sp, t1, -884
                  sll          a5, s10, s0
                  rem          t5, t2, s6
                  remu         s11, a2, a4
566:              c.addi16sp   sp, -16
                  bge          s11, s3, 571f
                  add          t2, t3, a5
                  slt          s11, t0, s9
                  mul          s6, s0, a0
571:              div          ra, s0, t4
                  or           a5, a2, a0
                  c.srli       a3, 30
                  c.lui        s5, 26
575:              mulhsu       ra, s8, a5
                  mulhsu       zero, a7, a0
                  c.add        s10, s5
                  divu         a2, zero, t5
                  div          s1, zero, gp
                  beq          s5, s5, 582f
                  slti         s11, tp, -1672
582:              bgeu         a3, t4, 597f
                  mulh         s9, s8, t3
                  mulhsu       gp, s9, a5
                  and          s4, s11, t3
                  c.add        s8, t4
                  andi         t3, t1, -212
                  slli         a6, a6, 3
                  c.beqz       a2, 597f
                  c.nop
                  and          tp, zero, t6
                  srai         s6, zero, 21
                  sltiu        s8, s2, 1714
                  lui          tp, 807919
                  slli         a2, s5, 31
                  c.add        s6, s6
597:              bltu         a6, a7, 607f
                  c.mv         a2, a3
                  srl          s1, t5, a3
                  c.and        a3, a3
                  beq          a3, s5, 604f
                  sltu         s11, s2, s3
                  blt          s0, t0, 608f
604:              add          a1, tp, s1
                  bltu         t4, a7, 606f
606:              c.addi4spn   a2, sp, 848
607:              c.beqz       a2, 614f
608:              srl          s3, s1, t4
                  bltu         a1, s5, 619f
                  c.or         s1, s1
                  c.addi       a3, -1
                  beq          s6, a5, 626f
                  xor          t0, t1, s9
614:              c.lui        a7, 14
                  addi         s6, a6, -693
                  sub          a5, a7, a6
                  div          t5, a0, a3
                  add          gp, s9, s3
619:              c.addi16sp   sp, -16
                  c.slli       gp, 11
                  andi         ra, zero, 1826
                  c.sub        a2, a3
                  c.li         s2, -1
                  c.addi       t5, -1
                  andi         sp, t0, 109
626:              c.srli       a3, 8
                  ori          s4, tp, 490
                  sra          a1, s0, zero
                  c.bnez       a2, 636f
                  and          s3, t4, a4
                  xori         t1, s7, -1374
                  add          t0, t1, a2
                  c.addi4spn   a2, sp, 880
                  and          t6, a7, s3
                  bltu         t6, zero, 649f
636:              srl          s6, t3, tp
                  c.and        s0, a4
                  blt          s0, s9, 642f
                  slti         s2, t5, -1122
                  div          t4, s11, a2
                  c.addi4spn   s0, sp, 800
642:              srli         s4, t4, 4
                  rem          s11, t4, s4
                  c.srli       a3, 14
                  c.lui        s8, 6
                  sltu         t5, t2, t6
                  ori          s6, s5, -755
                  srli         s4, s3, 29
649:              nop
                  xori         a7, a2, 1168
                  c.mv         ra, sp
                  sll          a1, ra, a5
                  c.or         a3, a0
                  c.mv         a1, s0
                  sub          t3, t4, a7
                  sltu         s11, t5, t3
                  add          a3, s0, t0
                  c.andi       a3, 0
                  sltiu        s10, t2, -1554
                  sll          sp, s11, t1
                  ori          s8, a3, -1511
                  c.mv         s2, s4
                  nop
                  mulhsu       s3, t5, a3
                  c.and        a2, a4
                  slli         s11, t2, 14
                  c.addi       t3, -1
                  c.li         ra, 28
                  or           t2, sp, t2
                  mulh         s8, s1, s0
                  divu         t0, t1, a7
                  nop
                  c.li         s9, -1
                  mulh         s2, s5, a2
                  slti         t2, a2, -1513
                  mulh         s4, a2, zero
                  c.and        a2, a1
                  c.beqz       a3, 680f
                  c.li         s2, -1
680:              sltiu        s8, sp, -1873
                  srli         s3, zero, 27
                  bne          s5, t1, 695f
                  auipc        a6, 118258
                  sltu         s3, a3, s9
                  mulh         a5, s2, t4
                  srli         s6, t1, 31
                  c.addi16sp   sp, -16
                  or           a5, zero, s3
                  c.bnez       a1, 706f
                  c.beqz       a5, 708f
                  c.or         a3, a4
                  blt          a3, s10, 701f
                  sra          a7, s10, a5
                  c.bnez       a5, 698f
695:              c.or         a3, a0
                  bne          t0, t2, 697f
697:              add          a6, ra, a6
698:              slti         a5, s1, 1883
                  bltu         t6, ra, 714f
                  c.mv         s11, a0
701:              div          a1, s2, s10
                  auipc        sp, 603935
                  xori         t6, s10, 1972
                  add          t5, gp, s6
                  ori          sp, s11, -1025
706:              nop
                  c.mv         a2, s7
708:              c.srli       s0, 3
                  c.mv         t2, t6
                  ori          s6, s1, 1254
                  c.beqz       s0, 728f
                  mul          s9, s9, ra
                  c.and        a3, a4
714:              add          a6, s5, t6
                  srai         tp, a1, 5
                  div          s0, gp, s4
                  bne          s1, s8, 718f
718:              c.mv         s8, s10
                  srai         s1, t2, 9
                  c.sub        s0, a3
                  rem          t4, a7, s4
                  or           s1, a1, t1
                  c.li         s2, -1
                  nop
                  bne          a6, a7, 729f
                  add          gp, t3, gp
                  srai         s5, s7, 14
728:              c.addi       a1, -1
729:              slt          s8, a3, s11
                  remu         a2, s8, gp
                  blt          gp, ra, 746f
                  c.addi       ra, -1
                  slti         t4, s1, 1290
                  slt          ra, t2, tp
                  and          s5, t0, s11
                  xor          s10, s9, s2
                  bltu         tp, t2, 741f
                  bne          a2, a2, 753f
                  c.li         s11, -1
                  c.srai       s0, 27
741:              slli         a2, a2, 17
                  andi         a2, a2, -129
                  c.nop
                  srai         s9, s11, 30
                  c.bnez       a2, 756f
746:              slt          t6, s0, ra
                  slti         s4, s3, -1093
                  c.slli       a1, 14
                  remu         t5, zero, t6
                  c.nop
                  bltu         a0, s4, 756f
                  c.beqz       a3, 761f
753:              div          s8, t0, s4
                  c.or         a5, a0
                  sltu         t0, s10, s3
756:              c.li         t6, 16
                  c.nop
                  slt          t2, s0, tp
                  slti         a7, s2, -1174
                  div          s5, s8, t1
761:              mulhu        a6, sp, s9
                  lui          s6, 397149
                  c.sub        s1, a5
                  sub          zero, s4, s2
                  lui          t2, 120290
                  xori         a1, s7, -198
                  c.and        s1, a2
                  srli         s3, sp, 27
                  mulhsu       s9, a4, sp
                  rem          t4, tp, s1
                  and          sp, s6, a6
                  srli         a5, s7, 21
                  c.or         s0, a2
                  sra          s10, s11, zero
                  lw           t1, 4(s7)
                  sll          t2, s8, s1
                  addi         s7, s7, 12
                  c.xor        a5, a1
1049:             addi x30, x6, 0
1049:             c.jalr x30
sub_5:            c.nop
                  addi         s0, t6, -762
                  c.nop
                  bne          t1, a7, sub_5_stack_p
                  c.addi       tp, 3
                  c.li         a3, -1
sub_5_stack_p:    addi         s7, s7, -60
                  srli         a5, s0, 16
                  slti         s0, a0, 62
                  sw           t1, 4(s7)
                  c.addi4spn   s0, sp, 848
                  sra          a3, tp, t5
                  la           ra, region_1+50 #start riscv_load_store_rand_instr_stream_0
                  sw           zero, 138(ra)
                  divu         s4, a4, a1
                  auipc        s1, 96336
                  c.srai       s0, 28
                  lh           t5, -8(ra)
                  c.xor        s1, a2
                  c.add        t0, tp
                  c.nop
                  and          tp, a3, t0
                  lh           sp, 186(ra)
                  sw           t1, 98(ra)
                  andi         t3, tp, 467
                  lbu          a1, 227(ra)
                  c.nop
                  xori         a5, t2, 207
                  lbu          a2, 35(ra)
                  or           a1, t6, s3
                  sb           s3, 256(ra)
                  or           a7, t4, a2
                  c.li         s1, -1
                  sw           a4, 190(ra)
                  sh           s5, 68(ra)
                  andi         s10, a7, 1216
                  srl          s6, s8, t1
                  c.lui        t3, 31
                  sub          s6, s2, gp
                  lh           s3, -48(ra)
                  ori          zero, s1, -832
                  addi         t3, a5, 635
                  c.addi4spn   a3, sp, 224
                  slti         s6, t0, 568
                  lbu          s8, 130(ra)
                  mul          s1, s5, gp
                  lbu          s10, -42(ra)
                  c.sub        a2, a3
                  xori         s0, s7, 1414
                  sb           s7, 119(ra)
                  lb           s2, -13(ra)
                  lh           a6, -26(ra)
                  auipc        a5, 1015173
                  lh           s6, -32(ra) #end riscv_load_store_rand_instr_stream_0
                  and          s1, s11, s4
                  bltu         s9, s0, 16f
                  c.srai       s0, 31
                  nop
                  or           a1, t0, s9
                  c.bnez       a5, 17f
                  c.slli       sp, 27
                  rem          a7, t0, a1
                  c.addi       s6, 14
                  bge          s4, a2, 29f
                  c.addi4spn   a1, sp, 624
                  c.srli       a2, 6
                  divu         a5, a3, s3
                  add          a1, a3, a7
                  sltiu        t2, t6, -1580
                  lui          s3, 730598
16:               andi         a5, a0, 958
17:               c.addi16sp   sp, -16
                  c.li         gp, -1
                  rem          s9, s6, t1
                  c.sub        a1, s1
                  sltiu        t6, a6, -307
                  bge          s11, s5, 30f
                  sub          t0, s11, s9
                  blt          t3, a1, 36f
                  bge          sp, s10, 43f
                  andi         t2, s2, -598
                  c.andi       a2, 3
                  slti         t1, s4, -1118
29:               c.slli       s1, 13
30:               addi         ra, s9, -406
                  c.addi       t1, -1
                  c.mv         a6, s7
                  srli         a2, sp, 26
                  sra          s3, a3, s9
                  blt          s6, a7, 50f
36:               c.xor        a3, a5
                  bltu         ra, s11, 44f
                  c.lui        s9, 8
                  mul          s6, sp, s10
                  remu         t6, tp, s0
                  c.and        a1, a2
                  slti         s4, zero, -975
43:               lui          sp, 717435
44:               mul          s1, a4, s4
                  c.and        a3, a0
                  and          s8, t1, s2
                  c.add        sp, s6
                  nop
                  c.addi4spn   a2, sp, 608
50:               sub          s11, s0, s6
                  c.beqz       s1, 68f
                  c.sub        a5, a2
                  sub          s2, t0, s1
                  mulhsu       s4, t5, s1
                  c.li         a5, 1
                  mulhu        t2, t3, sp
                  mulhu        s5, t6, s1
                  srli         sp, s7, 5
                  add          s8, a4, gp
                  c.srli       s0, 11
                  c.sub        a1, a0
                  c.mv         s9, tp
                  mulh         s11, s1, t4
                  beq          s11, a7, 76f
                  c.addi       s2, -1
                  c.mv         s3, t6
                  c.nop
68:               c.lui        s4, 5
                  rem          s4, s0, t5
                  divu         s11, a3, s5
                  slti         s0, a5, 890
                  bltu         s5, a4, 73f
73:               remu         a7, t4, s0
                  c.sub        a1, a2
                  c.mv         gp, s6
76:               slli         s5, s2, 3
                  mulh         s11, s1, s11
                  c.mv         s10, s0
                  c.and        s1, a0
                  c.slli       s8, 1
                  andi         t1, a6, -779
                  sltiu        s5, s3, -1715
                  bltu         gp, s10, 85f
                  slti         a7, s9, -427
85:               c.or         s1, s1
                  sub          a6, t1, a2
                  div          s6, s1, sp
                  c.and        s1, a5
                  c.beqz       a5, 100f
                  sltu         s6, a5, a1
                  c.sub        s1, a2
                  sltiu        a3, a7, 850
                  c.addi       s9, 18
                  sll          a7, s7, a2
                  sra          s4, a0, t5
                  c.or         a1, a3
                  slti         s0, a1, -44
                  bgeu         a0, zero, 100f
                  c.lui        s10, 19
100:              sra          s9, a6, s7
                  c.andi       a3, -1
                  ori          sp, s6, -1805
                  blt          t4, s6, 109f
                  mulh         t5, tp, t6
                  c.li         a6, -1
                  slli         t1, s7, 2
                  c.andi       s1, 4
                  slli         t4, a0, 24
109:              lui          t0, 521100
                  c.srli       a3, 13
                  slti         t5, s6, 255
                  c.nop
                  or           s6, a5, a4
                  divu         sp, tp, ra
                  c.and        a5, a3
                  remu         t1, t0, a7
                  or           tp, s10, s5
                  c.andi       s0, -1
                  ori          gp, a2, -1908
                  c.addi       t5, -1
                  c.sub        a5, a2
                  srli         a1, a1, 2
                  slli         zero, s7, 15
                  c.addi16sp   sp, 64
                  slt          s5, a0, s5
                  mulh         ra, t4, s5
                  sub          a2, a1, t3
                  srl          a3, a0, t0
                  or           gp, s4, t6
                  remu         s0, s7, a0
                  addi         t2, t0, 332
                  xor          t3, sp, t5
                  xor          s5, s9, t0
                  sltu         s4, t6, a3
                  c.addi       t5, -1
                  remu         a3, s5, s1
                  sll          s8, a2, sp
                  c.bnez       a5, 157f
                  or           t4, a1, gp
                  sub          t6, s0, a6
                  sltiu        a5, s11, -435
                  c.mv         gp, s2
                  bgeu         s10, a0, 152f
                  c.addi4spn   s1, sp, 528
                  c.xor        a2, a4
                  slti         t6, s5, -838
                  slt          t1, t3, a0
                  nop
                  blt          gp, a5, 161f
                  c.or         s0, a5
                  c.addi4spn   a1, sp, 880
152:              andi         s2, a3, -520
                  slti         t2, s3, 482
                  c.xor        a3, a0
                  c.mv         a5, t1
                  andi         t5, a3, -426
157:              c.srai       a1, 8
                  c.srai       s0, 1
                  bge          a3, s11, 172f
                  sra          s0, s9, t1
161:              c.nop
                  mulh         s6, a4, t0
                  c.lui        a6, 25
                  c.andi       a5, 21
                  sub          a7, t6, s10
                  srli         s5, a3, 1
                  srai         a2, s9, 15
                  c.sub        a1, a1
                  sll          s1, a4, t1
                  rem          s5, t5, a0
                  c.slli       s6, 31
172:              div          s0, s6, a2
                  c.slli       gp, 9
                  c.add        gp, s10
                  bltu         a7, s6, 190f
                  sub          gp, s9, a5
                  slt          a6, s1, s10
                  srai         s1, zero, 30
                  slti         t0, a4, 928
                  and          a6, a6, s4
                  c.xor        a3, a2
                  slti         s2, s6, -1857
                  addi         sp, s8, 1553
                  bltu         a6, zero, 185f
185:              mulh         s10, s9, s4
                  bne          s10, ra, 192f
                  sltiu        t2, sp, -134
                  sltu         t3, s10, a2
                  xori         s1, a3, 1988
190:              blt          s1, s4, 210f
                  c.and        a3, a2
192:              c.addi16sp   sp, -16
                  blt          s10, t3, 197f
                  mul          t6, t0, s0
                  nop
                  c.lui        s3, 31
197:              andi         a3, a3, 124
                  nop
                  sll          s3, s2, s11
                  sub          s4, s2, a2
                  mulh         s6, sp, s4
                  remu         sp, s2, s9
                  auipc        s6, 792185
                  c.lui        s4, 14
                  bge          a2, ra, 212f
                  c.or         a1, a3
                  remu         s4, a7, a5
                  c.li         s10, 6
                  slti         a2, zero, -786
210:              mul          a3, s1, t1
                  add          t1, s4, a6
212:              lui          a7, 309033
                  auipc        s9, 239527
                  auipc        s5, 438726
                  div          a6, s2, s1
                  c.and        s1, a5
                  srl          t0, t4, s6
                  slti         s2, ra, -728
                  c.slli       t4, 10
                  or           t0, s6, s4
                  xori         t2, s2, 1481
                  c.andi       s1, 20
                  c.add        s3, s7
                  blt          s4, a1, 232f
                  srai         s1, a4, 0
                  c.sub        s0, s0
                  c.nop
                  xori         s0, a7, 752
                  and          a7, t2, s5
                  xori         t3, sp, -664
                  srai         s11, sp, 5
232:              mulhsu       t6, s7, t4
                  or           a6, s11, ra
                  divu         tp, s9, a6
                  xor          s2, t5, t2
                  sltiu        t0, s3, -203
                  c.nop
                  lw           t1, 4(s7)
                  div          a7, s6, t2
                  addi         s7, s7, 60
                  c.sub        a5, s0
296:              addi x21, x6, 1
296:              c.jalr x21
sub_1:            divu         s0, t4, a2
                  beq          t1, s5, sub_1_stack_p
                  mulh         t2, s3, s3
                  c.slli       s5, 3
sub_1_stack_p:    addi         s7, s7, -36
                  add          tp, t2, t2
                  addi         s1, a2, -1294
                  or           t0, t6, a6
                  sw           t1, 4(s7)
                  c.andi       a1, -1
                  rem          s6, s6, a6
                  la           s1, region_1+1428 #start riscv_load_store_rand_instr_stream_2
                  srai         t3, s11, 5
                  sb           a3, -5(s1)
                  mulhsu       ra, s0, t2
                  c.lui        t2, 3
                  sb           s6, -15(s1)
                  lbu          t4, 5(s1)
                  slti         a7, tp, 1729
                  and          s10, s3, s6
                  xori         a5, t3, 1315
                  lui          sp, 426913
                  c.sub        a5, s1
                  lb           t2, 3(s1)
                  c.or         a3, a3
                  slt          s3, a3, tp
                  remu         t3, s5, zero
                  lbu          tp, -13(s1)
                  sh           t6, -10(s1)
                  srl          s0, sp, a4
                  sb           t1, -16(s1)
                  c.nop
                  sb           gp, 16(s1)
                  sll          s4, s7, a3
                  c.addi       a5, 6
                  lbu          s0, 13(s1)
                  lhu          s11, 4(s1)
                  rem          t1, a5, s0
                  lb           s5, 15(s1)
                  c.or         a5, s1
                  lh           s5, -2(s1)
                  c.sub        a1, a0
                  rem          s8, s1, a2
                  lhu          a5, 16(s1)
                  sh           s7, 2(s1)
                  sll          s8, ra, s5
                  c.li         s0, -1
                  c.lui        s8, 19
                  slli         s2, a6, 2
                  lbu          s2, 5(s1)
                  nop
                  lbu          s9, -11(s1)
                  sw           a7, 0(s1)
                  c.or         s0, s1
                  rem          t0, t3, t5
                  lb           ra, -7(s1) #end riscv_load_store_rand_instr_stream_2
                  la           sp, region_0+919 #start riscv_load_store_rand_instr_stream_1
                  add          gp, s6, t2
                  lb           s8, 21(sp)
                  lb           a7, -52(sp)
                  sltiu        s6, a7, 256
                  c.addi       s11, -1
                  c.or         s1, a5
                  sb           s2, 30(sp)
                  c.and        a1, a5
                  lui          a2, 874615
                  divu         s11, a6, a6
                  c.sub        a1, a1
                  c.srli       a2, 7
                  auipc        gp, 433065
                  lb           gp, 1(sp)
                  xor          gp, s9, t4
                  lbu          t3, 12(sp)
                  sb           s10, -13(sp)
                  srai         t4, s11, 17
                  c.lui        a3, 6
                  c.srli       s0, 1
                  xor          s8, s9, a3
                  lbu          s2, 13(sp)
                  c.li         a5, 22
                  srl          s8, a1, a2
                  auipc        t4, 490858
                  ori          t2, t6, 1302
                  lh           tp, 9(sp)
                  lbu          ra, 42(sp)
                  andi         s10, a1, 215
                  c.and        s0, a4
                  c.xor        a2, s1
                  div          s9, t2, s5
                  mulhsu       s1, s7, s10
                  lh           s11, 63(sp)
                  c.andi       a1, -1
                  sb           t0, 35(sp)
                  sltiu        t1, gp, -1185
                  mulh         s3, a1, s5
                  lb           tp, 1(sp)
                  lhu          s8, -31(sp) #end riscv_load_store_rand_instr_stream_1
                  divu         s10, a5, s2
                  srl          gp, s9, s5
                  sub          s10, s7, s4
                  add          a6, s4, s5
                  c.xor        a5, a5
                  c.srli       a2, 27
                  add          s2, s4, tp
                  c.nop
                  xori         ra, a3, 846
                  c.srai       s0, 11
                  mul          s2, t2, tp
                  c.srai       a5, 2
                  slt          s4, t2, t6
                  mulhsu       sp, s5, t1
                  bne          t4, s10, 15f
15:               c.mv         s5, s10
                  nop
                  blt          a2, a7, 32f
                  c.and        s0, a0
                  c.mv         s10, t1
                  sub          a5, s5, a1
                  sub          t5, a1, t4
                  mulh         t1, tp, zero
                  mulhu        t1, gp, ra
                  c.addi16sp   sp, 16
                  mulhu        s9, s9, a6
                  rem          s10, a2, s5
                  c.addi       t5, 16
                  srli         ra, s3, 9
                  mulh         t3, s6, a3
                  c.and        s0, s0
                  rem          sp, a0, ra
32:               xor          s8, s4, s5
                  ori          s1, a4, 146
                  lui          sp, 58673
                  c.sub        s0, a1
                  c.lui        t0, 22
                  c.bnez       a5, 45f
                  srai         s2, tp, 25
                  mulhsu       s11, a7, sp
                  c.add        s2, a7
                  c.sub        a5, s1
                  c.beqz       a1, 47f
                  c.and        a3, a0
                  rem          sp, ra, zero
45:               slli         a2, a7, 4
                  xori         t1, s6, 719
47:               mulhsu       t2, s4, s9
                  c.beqz       a3, 56f
                  remu         gp, zero, t3
                  rem          a1, a4, s2
                  srl          s1, a6, t6
                  rem          a7, s4, a7
                  c.bnez       s1, 60f
                  bltu         zero, s4, 67f
                  add          tp, a0, tp
56:               c.add        sp, s0
                  xori         s11, t6, 1319
                  andi         a2, ra, -1285
                  srli         s0, s2, 10
60:               divu         t6, t4, a7
                  nop
                  c.srli       s0, 23
                  c.and        a2, a3
                  add          s0, a7, a6
                  nop
                  srai         a2, s2, 8
67:               mulh         s10, s1, a0
                  sra          s5, gp, t1
                  slt          gp, s11, a3
                  addi         zero, s11, 1130
                  c.li         s10, -1
                  srl          s1, ra, zero
                  c.xor        a5, a3
                  bltu         a4, t2, 82f
                  addi         a2, gp, 1335
                  slli         tp, sp, 27
                  c.li         s0, 3
                  auipc        t2, 670171
                  auipc        zero, 221829
                  srl          s11, gp, a7
                  c.bnez       s1, 93f
82:               c.slli       s6, 27
                  add          a5, a3, s9
                  bgeu         sp, s4, 90f
                  c.add        s5, t4
                  mulh         s8, s1, t0
                  xor          tp, tp, ra
                  bge          a5, s6, 92f
                  add          t5, ra, a5
90:               bge          ra, s3, 109f
                  beq          s8, s6, 98f
92:               addi         a7, s4, 659
93:               slli         s10, s11, 28
                  c.xor        a5, a2
                  div          t5, tp, s2
                  c.srli       a1, 21
                  add          t0, s9, s6
98:               c.nop
                  sra          sp, s9, s5
                  divu         t0, s3, s11
                  c.srli       a1, 25
                  slli         t3, a4, 3
                  xori         a6, gp, -1952
                  mul          t1, s10, t3
                  c.slli       a5, 25
                  xor          a6, zero, s2
                  lui          ra, 355301
                  blt          ra, s7, 115f
109:              xori         gp, a5, -1604
                  xor          t6, sp, ra
                  c.sub        a1, a4
                  sltiu        s10, a6, -879
                  rem          s1, t2, s4
                  or           s11, s2, s10
115:              srai         s4, a6, 19
                  xori         t5, s8, 279
                  mulhsu       t6, s9, tp
                  c.xor        a2, a2
                  c.addi       s6, 14
                  sltiu        s8, s3, -1246
                  div          s5, a3, a4
                  sltu         a7, s4, t1
                  c.srai       a2, 9
                  c.bnez       a5, 135f
                  sll          a2, a1, t1
                  auipc        ra, 367664
                  xori         a2, s5, 950
                  sub          a5, s2, a5
                  rem          s9, zero, s9
                  srl          s10, s9, t1
                  xori         s8, s1, -2037
                  bne          a2, sp, 143f
                  bgeu         tp, a4, 143f
                  sub          s2, sp, sp
135:              c.andi       s0, 10
                  c.or         a5, a3
                  blt          zero, a7, 145f
                  c.add        tp, a6
                  c.or         s1, a4
                  div          a6, s2, t4
                  rem          a3, s0, s7
                  c.bnez       a3, 151f
143:              c.slli       t4, 30
                  nop
145:              c.bnez       s1, 148f
                  c.xor        a3, s0
                  srai         t5, a2, 15
148:              slli         t5, zero, 30
                  sra          t5, s0, a5
                  xor          sp, s0, s8
151:              c.mv         s9, t5
                  mulhu        zero, tp, t4
                  mulhu        ra, t1, s1
                  sub          s0, s8, a4
                  c.and        a5, a0
                  c.mv         t5, t1
                  c.beqz       s1, 177f
                  c.andi       s1, 31
                  c.mv         t0, a7
                  andi         t2, a2, -1151
                  bge          s10, s6, 181f
                  c.srai       a3, 9
                  c.nop
                  remu         s8, a6, a2
                  auipc        s10, 196873
                  c.slli       s1, 25
                  bge          s1, t2, 179f
                  mulh         t6, s1, a7
                  c.li         s10, -1
                  slti         a7, s7, -1299
                  mul          t4, s0, s9
                  c.or         s0, a1
                  blt          s11, s11, 193f
                  c.and        a3, a1
                  c.xor        s0, a4
                  rem          sp, t2, zero
177:              c.addi16sp   sp, 320
                  c.addi       gp, 30
179:              auipc        s4, 647338
                  bltu         a4, s3, 184f
181:              c.slli       t4, 1
                  sll          t3, s8, a3
                  auipc        t5, 646572
                  c.slli       s6, 23
                  la           t4, sub_3
                  addi         t4, t4, 580
                  c.addi4spn   a2, sp, 928
                  mulh         s11, a1, s2
                  c.add        t1, s10
                  slti         a2, a4, -1742
                  auipc        s8, 611201
                  srl          t1, a7, a2
                  blt          a0, s11, sub_1_j4 #branch to jump instr
                  divu         sp, s3, zero
sub_1_j4:         jalr         t1, t4, -580 #jump sub_1 -> sub_3
184:              c.sub        a1, a2
                  bgeu         s1, s8, 193f
                  c.nop
                  c.bnez       s0, 188f
188:              c.or         a2, a5
                  xor          a2, a2, sp
                  ori          s0, s4, -1270
                  lui          s11, 981910
                  or           sp, a2, a0
193:              c.and        a3, s1
                  add          a6, a0, s11
                  mul          s8, t5, t5
                  c.mv         t1, a5
                  c.bnez       a2, 199f
                  xori         s0, t6, -1239
199:              c.lui        tp, 1
                  bge          s2, t3, 203f
                  addi         t0, s9, 1094
                  bltu         s2, s7, 203f
203:              srai         s8, a7, 25
                  c.mv         s8, a1
                  sll          a5, s9, s11
                  c.mv         s0, s5
                  andi         s9, s5, -420
                  or           t4, s1, s11
                  c.or         s0, a4
                  sll          s0, s11, t3
                  c.addi       t5, 28
                  sra          t5, s0, s7
                  or           a7, t5, t3
                  sll          tp, t5, gp
                  div          s4, s11, s3
                  slt          a2, s2, zero
                  c.addi16sp   sp, 224
                  slti         sp, s2, -961
                  c.andi       a3, -1
                  and          s11, sp, a2
                  c.srai       a1, 25
                  rem          t5, a7, s5
                  c.andi       a5, -1
                  sub          s11, a1, t6
                  bge          s9, a0, 240f
                  addi         t4, s3, 1838
                  andi         sp, a5, -1804
                  srl          s4, s0, t4
                  c.nop
                  mul          s8, s5, sp
                  mul          a3, t0, tp
                  c.sub        a3, a5
                  or           s6, a3, t4
                  nop
                  sra          s10, t4, s10
                  c.or         a3, a5
                  bge          s10, a4, 243f
                  srli         t4, s7, 30
                  c.andi       a3, -1
240:              c.mv         tp, s5
                  c.bnez       a2, 249f
                  slti         s1, t5, -1038
243:              div          zero, a6, gp
                  bne          s3, s1, 252f
                  rem          t2, s6, s9
                  srli         tp, a3, 4
                  c.addi16sp   sp, -16
                  srai         a3, a0, 3
249:              sub          tp, t0, ra
                  c.sub        s1, s1
                  c.srli       s0, 1
252:              sltu         t1, s7, a3
                  c.andi       a5, -1
                  mul          sp, t2, s11
                  lui          a5, 489241
                  bne          t5, zero, 266f
                  divu         s11, s5, sp
                  bge          t0, s5, 261f
                  c.xor        a5, s0
                  sltu         a3, a0, s11
261:              andi         t5, s5, 1504
                  c.xor        a2, a0
                  add          s6, a7, t5
                  divu         s0, t2, zero
                  srl          s10, s3, a3
266:              srai         t1, t1, 0
                  mulhu        s9, a5, a7
                  sub          t3, s5, gp
                  slti         s1, a3, -1915
                  c.or         a2, s1
                  c.andi       a3, -1
                  c.or         s0, a4
                  divu         s1, s8, gp
                  sll          s8, gp, t4
                  lui          a5, 247152
                  blt          gp, s1, 296f
                  xor          s4, s2, s11
                  div          s1, tp, a0
                  srl          sp, t5, s2
                  slli         s5, a7, 4
                  c.slli       s2, 27
                  mul          a2, a1, s11
                  and          t4, s2, t5
                  div          s8, zero, s10
                  mulhsu       s11, a6, tp
                  xori         tp, s9, -1691
                  srl          s9, s6, t1
                  srl          t3, s7, t1
                  srai         ra, s3, 1
                  lui          t2, 483042
                  sltiu        a1, t5, -1711
                  and          a3, sp, a6
                  c.srai       a1, 21
                  srli         s8, t2, 23
                  remu         t6, t6, zero
296:              c.or         a3, a3
                  c.lui        t1, 11
                  mulhsu       ra, t2, t2
                  mulh         t6, s5, s7
                  c.and        a5, s1
                  xor          sp, t1, s3
                  lui          t2, 72985
                  slt          t5, s10, a7
                  mulhu        s0, t4, s4
                  addi         tp, a0, 23
                  nop
                  or           t5, ra, ra
                  mulhsu       t5, t0, t2
                  sltu         a6, zero, a6
                  rem          s5, tp, gp
                  blt          s1, s0, 318f
                  and          s2, a0, s11
                  c.lui        a2, 17
                  c.or         s0, s0
                  or           sp, a4, a1
                  c.addi16sp   sp, 384
                  or           s5, s11, gp
318:              ori          zero, s11, 1520
                  srli         s9, a3, 22
                  slli         a6, tp, 6
                  div          s6, a5, s5
                  andi         zero, a2, 511
                  mul          a6, s9, s8
                  add          tp, s2, s6
                  slti         t2, s10, 1345
                  xori         t1, s0, 1884
                  divu         a6, tp, s4
                  bgeu         a3, s10, 332f
                  nop
                  c.or         s0, a5
                  mulh         t4, s8, t0
332:              bne          a6, zero, 344f
                  c.xor        a1, a3
                  slli         s4, tp, 3
                  c.addi       t2, -1
                  c.xor        s0, a2
                  mul          a3, s8, a6
                  mulhsu       t3, s8, a7
                  c.add        s0, s9
                  mulh         t2, a1, t2
                  mulh         a7, a0, s5
                  bltu         tp, s11, 353f
                  c.mv         t1, s7
344:              slt          ra, s0, a3
                  mulhu        a1, t3, s10
                  c.mv         s3, s4
                  lui          s3, 953965
                  xor          tp, t3, s11
                  c.addi16sp   sp, 416
                  sltiu        tp, sp, 339
                  nop
                  rem          t3, s4, a6
353:              c.or         s1, s0
                  rem          s6, tp, s10
                  c.addi4spn   a3, sp, 416
                  c.srai       a3, 14
                  c.lui        a3, 20
                  bgeu         ra, zero, 359f
359:              c.srli       a3, 13
                  c.lui        t0, 27
                  slli         s3, s8, 1
                  add          t0, ra, a5
                  slli         a2, s11, 23
                  sub          s1, sp, s10
                  bne          s7, s10, 367f
                  slt          a3, tp, s4
367:              or           ra, s11, t0
                  mulhu        t2, s7, a6
                  bgeu         s0, s4, 374f
                  rem          gp, t6, tp
                  c.srli       a1, 23
                  c.nop
                  c.srai       s1, 12
374:              bge          a3, t6, 387f
                  remu         s6, s11, s0
                  and          s4, s6, s8
                  mul          s4, s8, gp
                  blt          ra, a1, 397f
                  sltu         s11, a1, t5
                  c.lui        tp, 25
                  mulh         s9, a6, s3
                  slt          s6, s1, s6
                  srai         s10, zero, 3
                  auipc        sp, 439479
                  andi         a1, t6, 1428
                  c.addi16sp   sp, 384
387:              xori         s2, a6, 143
                  c.slli       t0, 23
                  blt          s1, sp, 392f
                  c.bnez       a3, 394f
                  c.sub        s1, s0
392:              c.srai       a5, 11
                  slli         t4, s0, 10
394:              srai         a2, s6, 24
                  sltiu        gp, t5, 880
                  c.addi       a7, -1
397:              c.andi       a5, -1
                  sub          a7, a1, t5
                  c.nop
                  mulhsu       t4, tp, a7
                  xor          t6, sp, a7
                  c.xor        s1, a0
                  c.beqz       s0, 411f
                  c.and        a5, a3
                  c.lui        s9, 16
                  srl          zero, s8, s7
                  srli         a7, s6, 27
                  srai         ra, t4, 10
                  c.addi       a1, -1
                  c.bnez       s1, 418f
411:              xor          s2, s9, zero
                  xori         s11, s0, -1592
                  beq          a2, tp, 414f
414:              xor          a3, a4, s2
                  bge          t2, a7, 422f
                  xor          t1, t0, s5
                  sll          sp, a3, s3
418:              c.mv         s11, sp
                  mulhu        t2, a4, gp
                  rem          a6, s4, zero
                  div          s1, s4, s1
422:              remu         s2, s7, zero
                  c.add        a6, t0
                  srl          s10, s4, ra
                  blt          s2, t1, 437f
                  divu         s0, t3, t6
                  sltiu        zero, a4, 91
                  sra          a7, s6, zero
                  div          s10, s2, t5
                  c.xor        a3, a2
                  xor          t4, a2, a3
                  bltu         s9, ra, 452f
                  srl          s2, a3, s5
                  or           s5, s5, a6
                  c.nop
                  blt          s8, s5, 456f
437:              srai         a2, sp, 23
                  c.slli       s10, 6
                  c.lui        s10, 10
                  xori         s6, s6, 2021
                  c.nop
                  slt          tp, s7, s9
                  c.srli       s1, 7
                  c.and        s1, a2
                  and          t3, sp, a2
                  c.sub        a3, a5
                  c.xor        s1, a3
                  c.addi       ra, 14
                  c.addi       a5, 25
                  or           t5, gp, s9
                  bltu         a6, t1, 452f
452:              bgeu         s9, a4, 460f
                  slli         a1, s9, 29
                  c.andi       a5, -1
                  c.lui        a3, 14
456:              auipc        zero, 960899
                  bne          s1, gp, 464f
                  or           t6, sp, s0
                  blt          a6, t0, 470f
460:              slli         t6, s7, 24
                  sltu         s2, t5, ra
                  mulhsu       s11, t4, s2
                  mulhu        s2, t0, t4
464:              mulhsu       s9, sp, sp
                  c.beqz       a5, 474f
                  andi         s5, t2, -2023
                  bgeu         s8, a7, 474f
                  c.addi16sp   sp, -16
                  xori         s3, a5, 1819
470:              c.slli       ra, 28
                  xor          s9, t2, a0
                  la           sp, region_1+1681 #start riscv_load_store_rand_instr_stream_0
                  lbu          s0, -42(sp)
                  sb           t2, 42(sp)
                  lbu          zero, 16(sp)
                  sb           a7, -42(sp)
                  sh           s3, -57(sp)
                  lbu          a2, -23(sp)
                  lbu          ra, 46(sp)
                  divu         s10, s4, a1
                  srl          t6, s8, s6
                  sh           s1, -45(sp)
                  andi         s8, a7, -853
                  c.nop
                  lb           a6, -25(sp)
                  addi         s5, t4, 91
                  lw           t1, -53(sp)
                  lb           ra, -24(sp)
                  lbu          gp, -15(sp)
                  lbu          s2, -8(sp)
                  sb           t3, 30(sp)
                  sb           t6, -47(sp)
                  lh           t5, -29(sp)
                  lbu          a2, -58(sp)
                  lh           s9, 13(sp)
                  c.nop
                  sra          s8, s7, s7
                  sw           t0, -25(sp)
                  lbu          a1, -1(sp)
                  or           t2, s5, a1
                  sb           s0, -14(sp)
                  sb           t4, -53(sp)
                  nop
                  sb           s0, -50(sp)
                  slti         zero, t4, 1897
                  sb           a2, 14(sp) #end riscv_load_store_rand_instr_stream_0
                  c.beqz       a3, 481f
                  slti         a7, ra, 1759
474:              c.li         s5, -1
                  sltiu        s10, sp, 1493
                  blt          t4, t0, 477f
477:              mulhu        a6, a7, a4
                  addi         s4, t5, 1209
                  c.nop
                  bge          zero, s9, 484f
481:              div          t1, t5, s2
                  auipc        t6, 719682
                  c.beqz       a5, 484f
484:              xor          s4, a0, s2
                  slti         s0, a5, 1061
                  c.andi       s1, -1
                  xori         t4, t0, -962
                  c.li         tp, 16
                  lw           t1, 4(s7)
                  addi         s7, s7, 36
                  mulhsu       s8, a2, t3
636:              addi x30, x6, 0
636:              c.jalr x30
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .region_0,"aw",@progbits;
region_0:
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf
.section .region_1,"aw",@progbits;
region_1:
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf, 0xd0d1d2d3, 0xd4d5d6d7, 0xd8d9dadb, 0xdcdddedf
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
.word 0x40414243, 0x44454647, 0x48494a4b, 0x4c4d4e4f, 0x50515253, 0x54555657, 0x58595a5b, 0x5c5d5e5f
.word 0x60616263, 0x64656667, 0x68696a6b, 0x6c6d6e6f, 0x70717273, 0x74757677, 0x78797a7b, 0x7c7d7e7f
.word 0x80818283, 0x84858687, 0x88898a8b, 0x8c8d8e8f, 0x90919293, 0x94959697, 0x98999a9b, 0x9c9d9e9f
.word 0xa0a1a2a3, 0xa4a5a6a7, 0xa8a9aaab, 0xacadaeaf, 0xb0b1b2b3, 0xb4b5b6b7, 0xb8b9babb, 0xbcbdbebf
.word 0xc0c1c2c3, 0xc4c5c6c7, 0xc8c9cacb, 0xcccdcecf
.section .amo_0,"aw",@progbits;
amo_0:
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
.word 0x20212223, 0x24252627, 0x28292a2b, 0x2c2d2e2f, 0x30313233, 0x34353637, 0x38393a3b, 0x3c3d3e3f
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
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_2:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_3:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_4:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_5:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_6:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_7:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_8:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_9:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_10:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_11:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_12:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_13:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_14:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_15:
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

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
                  addi x10, x10, -4
                  sw  x23, (x10)
                  add x23, x10, zero
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
                  add x10, x23, zero
                  csrr x5, 0x341 # MEPC
                  csrr x5, 0x342 # MCAUSE
                  li x26, 0x3 # BREAKPOINT
                  beq x5, x26, ebreak_handler
                  li x26, 0x8 # ECALL_UMODE
                  beq x5, x26, ecall_handler
                  li x26, 0x9 # ECALL_SMODE
                  beq x5, x26, ecall_handler
                  li x26, 0xb # ECALL_MMODE
                  beq x5, x26, ecall_handler
                  li x26, 0x1
                  beq x5, x26, instr_fault_handler
                  li x26, 0x5
                  beq x5, x26, load_fault_handler
                  li x26, 0x7
                  beq x5, x26, store_fault_handler
                  li x26, 0xc
                  beq x5, x26, pt_fault_handler
                  li x26, 0xd
                  beq x5, x26, pt_fault_handler
                  li x26, 0xf
                  beq x5, x26, pt_fault_handler
                  li x26, 0x2 # ILLEGAL_INSTRUCTION
                  beq x5, x26, illegal_instr_handler
                  csrr x26, 0x343 # MTVAL
                  1: la x14, test_done
                  jalr x1, x14, 0

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
                  la x14, write_tohost
                  jalr x0, x14, 0

instr_fault_handler:
                  add x23, x10, zero
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
                  add x10, x23, zero
                  lw  x23, (x10)
                  addi x10, x10, 4
                  mret

load_fault_handler:
                  add x23, x10, zero
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
                  add x10, x23, zero
                  lw  x23, (x10)
                  addi x10, x10, 4
                  mret

store_fault_handler:
                  add x23, x10, zero
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
                  add x10, x23, zero
                  lw  x23, (x10)
                  addi x10, x10, 4
                  mret

ebreak_handler:   
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x23, x10, zero
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
                  add x10, x23, zero
                  lw  x23, (x10)
                  addi x10, x10, 4
                  mret

illegal_instr_handler:
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x23, x10, zero
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
                  add x10, x23, zero
                  lw  x23, (x10)
                  addi x10, x10, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x5, 0x300 # MSTATUS;
                  csrr  x5, 0x304 # MIE;
                  csrr  x5, 0x344 # MIP;
                  csrrc x5, 0x344, x5 # MIP;
                  add x23, x10, zero
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
                  add x10, x23, zero
                  lw  x23, (x10)
                  addi x10, x10, 4
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
