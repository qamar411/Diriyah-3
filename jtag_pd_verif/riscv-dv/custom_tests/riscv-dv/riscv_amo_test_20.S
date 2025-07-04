.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x10, h0_start
jalr x0, x10, 0
h0_start:
                  li x5, 0x40001105
                  csrw 0x301, x5
kernel_sp:        
                  la x18, kernel_stack_end

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
                  li x0, 0xfedf1555
                  li x1, 0xcc7af805
                  li x2, 0x3
                  li x3, 0xc37bc699
                  li x4, 0x871b6dc2
                  li x5, 0xeef73f26
                  li x6, 0x5
                  li x7, 0x6f36d290
                  li x8, 0x8f179930
                  li x9, 0x0
                  li x10, 0x2
                  li x11, 0x338a24e
                  li x12, 0x80000000
                  li x13, 0x80000000
                  li x14, 0xa8aa6cbf
                  li x15, 0x80000000
                  li x16, 0xf9aa8ab2
                  li x17, 0xf3c61747
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x22, 0x3a8bd160
                  li x23, 0x80000000
                  li x24, 0xb65a1c48
                  li x25, 0x0
                  li x26, 0xe50555ef
                  li x27, 0xd
                  li x28, 0x75f1adb0
                  li x29, 0xf2063fe6
                  li x30, 0x0
                  li x31, 0x80000000
                  la x21, user_stack_end
main:             la           sp, region_1+1471 #start riscv_load_store_rand_instr_stream_0
                  addi         a1, sp, 853
                  sb           sp, 222(sp)
                  sb           a6, 309(sp)
                  xor          a3, s10, t4
                  sb           t1, -1466(sp)
                  lh           a5, -291(sp)
                  divu         t5, gp, a0
                  c.srli       a2, 13
                  lb           s3, -1340(sp)
                  lh           s1, -681(sp)
                  lb           zero, -1281(sp)
                  rem          a6, a2, t0
                  lbu          s0, 32(sp)
                  lh           s11, -1435(sp)
                  lb           s10, -1383(sp)
                  sb           s10, -717(sp)
                  sltiu        tp, a3, 1818
                  rem          a4, t5, a4
                  sb           s7, -659(sp)
                  mulh         s1, s4, s6
                  andi         t6, s5, -1952
                  lb           s10, 298(sp)
                  lb           zero, -1024(sp)
                  lh           s6, -1211(sp)
                  lb           t6, -626(sp)
                  lh           zero, -143(sp)
                  lh           s3, -1351(sp)
                  addi         zero, gp, 183
                  mul          t0, tp, tp
                  mulh         s1, s6, s1
                  lbu          a6, 230(sp)
                  lhu          a5, -177(sp)
                  lb           a4, -102(sp)
                  c.slli       a2, 18
                  lb           t4, 184(sp) #end riscv_load_store_rand_instr_stream_0
                  la           t2, amo_0+44 #start riscv_amo_instr_stream_0
                  la           s11, amo_0+8
                  la           a4, amo_0+60
                  la           t4, amo_0+40
                  c.addi16sp   sp, -16
                  c.addi       gp, 3
                  amoswap.w.rl  a2, s0, (a4)
                  amoswap.w.aq  s4, s11, (t4)
                  amoxor.w.aq   a1, sp, (t2)
                  amoadd.w      s9, s10, (a4)
                  amoadd.w.rl   s7, a5, (s11)
                  c.andi       s1, -1
                  xori         gp, t5, -1767
                  auipc        a3, 1046738
                  amoand.w.aq   t1, t0, (t4)
                  amomaxu.w.rl  ra, a1, (t2)
                  amominu.w.aq  s6, zero, (t2)
                  amominu.w     s0, a3, (a4)
                  slli         zero, a0, 7
                  c.addi4spn   s1, sp, 176
                  amoand.w.aq   a2, t4, (a4) #end riscv_amo_instr_stream_0
                  la           s8, region_1+1077 #start load_store_instr_stream_1
                  sb           s10, 782(s8)
                  la           t4, region_0+1040 #start load_store_instr_stream_0
                  lbu          a4, 437(s8)
                  lbu          t0, 702(s8)
                  lbu          t6, -351(s8)
                  lb           s1, 152(t4)
                  sb           t0, 677(s8)
                  lw           a6, -92(t4)
                  sw           sp, -213(s8)
                  sb           s3, 314(s8)
                  lbu          s4, -195(t4)
                  lb           sp, -446(s8)
                  lhu          zero, -827(s8)
                  lw           s1, -160(t4)
                  lbu          s7, 438(s8) #end load_store_instr_stream_1
                  sb           s8, 89(t4) #end load_store_instr_stream_0
                  la           a5, region_1+378 #start load_store_instr_stream_1
                  la           s0, region_1+1818 #start load_store_instr_stream_0
                  lbu          gp, 48(s0)
                  lhu          s10, 166(s0)
                  lbu          s6, 831(a5)
                  lb           zero, 627(a5)
                  sb           zero, -73(s0)
                  lb           zero, 46(a5)
                  lb           s1, -221(a5)
                  lb           s10, 107(s0)
                  lw           s9, 1274(a5)
                  sb           a4, -101(s0)
                  lbu          t3, -99(s0)
                  sb           a6, 737(a5) #end load_store_instr_stream_1
                  sb           s0, -91(s0) #end load_store_instr_stream_0
                  la           t4, amo_0+60 #start riscv_lr_sc_instr_stream_0
                  addi         sp, s4, 1345
                  c.sub        a4, a0
                  sub          a3, tp, s10
                  c.slli       s10, 19
                  xori         s7, a4, 1515
                  slti         zero, t3, 1819
                  c.xor        a3, a3
                  c.nop
                  lui          gp, 276334
                  andi         s6, tp, -1475
                  lr.w          s3, (t4)
                  c.add        s0, a3
                  sc.w.aq       t0, a1, (t4) #end riscv_lr_sc_instr_stream_0
main_2:           jal          t3, 2f
0:                c.jal        8f
1:                c.j          14f
2:                c.jal        9f
3:                c.jal        16f
4:                jal          ra, 15f
5:                c.j          11f
6:                c.jal        3b
7:                c.j          6b
8:                jal          s3, 5b
9:                c.jal        4b
10:               c.j          1b
11:               jal          ra, 7b
12:               c.jal        10b
13:               c.jal        12b
14:               c.j          0b
15:               c.j          13b
16:               c.addi16sp   sp, -16
                  la           a4, region_0+267 #start riscv_load_store_hazard_instr_stream_0
                  sb           t2, -32(a4)
                  lb           a7, -32(a4)
                  sb           zero, -32(a4)
                  sb           tp, -38(a4)
                  lb           t1, -45(a4)
                  lb           t3, -45(a4)
                  sw           sp, 37(a4)
                  sw           a7, 37(a4)
                  lh           zero, -43(a4)
                  lb           t2, 3(a4)
                  and          t3, t4, t2
                  lh           s3, 3(a4)
                  sh           s11, 3(a4)
                  sb           t1, 3(a4)
                  lbu          gp, 3(a4)
                  slti         t0, t4, -1267
                  lhu          t6, 3(a4)
                  lb           s7, -12(a4)
                  lbu          t0, -12(a4)
                  lbu          t6, -12(a4)
                  xor          sp, tp, sp
                  xor          s10, t1, a1
                  lbu          t6, -12(a4)
                  lb           gp, -12(a4) #end riscv_load_store_hazard_instr_stream_0
                  addi         s1, zero, 8 #init loop 0 counter
                  c.andi       s0, -1
                  rem          a6, a3, a1
                  sra          ra, t6, s5
                  sra          a4, s10, t1
                  xori         t4, ra, 1857
                  nop
                  c.srai       s0, 6
                  srli         zero, t0, 27
                  addi         t0, zero, -8 #init loop 0 limit
                  srli         sp, a0, 2
                  divu         a7, t0, a1
main_5_0_t:       c.and        a1, a5
                  addi         s1, s1, -8 #update loop 0 counter
                  srl          s4, s5, a0
                  c.addi4spn   a2, sp, 656
                  c.nop
                  mulh         s4, a4, a6
                  auipc        t6, 169239
                  c.slli       s8, 14
                  c.addi16sp   sp, 256
                  c.nop
                  bge          s1, t0, main_5_0_t #branch for loop 0
                  sll          a4, s5, ra
                  la           sp, region_0+1721 #start riscv_hazard_instr_stream_0
                  lbu          s10, 11(sp)
                  sltiu        s10, s9, 575
                  or           a5, s9, s10
                  lb           a5, -10(sp)
                  c.addi       a5, -1
                  lb           zero, -13(sp)
                  mulhu        s0, s0, s10
                  sll          s8, s0, s9
                  lbu          zero, -15(sp)
                  lb           zero, 10(sp)
                  sh           s8, -11(sp)
                  ori          s10, s10, 1698
                  slt          a5, zero, s10
                  c.slli       s10, 29
                  lb           s9, 8(sp)
                  lhu          s10, 5(sp)
                  c.add        s10, s10
                  c.xor        a5, s0
                  add          s8, zero, a5
                  sb           s9, -16(sp)
                  c.add        a5, s0
                  lb           s0, 12(sp)
                  slli         s0, s10, 22
                  sub          zero, s0, a5
                  lbu          zero, 13(sp)
                  lbu          s9, -10(sp)
                  slt          zero, s9, zero
                  sb           s0, -14(sp)
                  lhu          zero, -3(sp)
                  lbu          s9, 3(sp)
                  sh           s10, 13(sp)
                  lb           s0, 10(sp)
                  sltiu        s0, zero, -1252
                  c.slli       s9, 9
                  lbu          s8, 14(sp)
                  c.sub        a5, s0
                  sb           s8, 8(sp)
                  nop
                  mulhu        s9, s10, s0
                  c.andi       a5, -1
                  sb           a5, 12(sp) #end riscv_hazard_instr_stream_0
                  rem          s10, a5, sp
                  c.xor        a3, s1
                  mulhu        a4, a4, t0
                  nop
                  c.addi16sp   sp, -16
                  c.nop
                  or           a6, a0, t4
                  blt          a2, a0, 12f
                  sra          s3, a7, sp
                  mul          s11, s4, s3
                  srl          a1, t6, s10
                  c.and        s1, a3
12:               c.bnez       a2, 15f
                  auipc        a4, 213226
                  mulhsu       a2, t2, s10
15:               bge          t1, s2, 27f
                  c.lui        s0, 2
                  xori         s10, a0, 856
                  bltu         a1, s6, 35f
                  sra          s0, a0, t4
                  bltu         s7, s7, 40f
                  srai         s7, a7, 17
                  rem          s0, s11, gp
                  sll          a1, t1, zero
                  beq          s5, t3, 27f
                  andi         s0, zero, -839
                  or           s8, s0, tp
27:               c.addi       s7, -1
                  c.xor        a5, a2
                  c.andi       a4, -1
                  slli         tp, s2, 10
                  div          tp, a5, a4
                  addi         t5, s7, -199
                  c.slli       t0, 27
                  beq          s11, a1, 46f
35:               andi         zero, a2, 1822
                  addi         t3, zero, -1122
                  bgeu         s2, t5, 43f
                  c.beqz       a1, 49f
                  c.addi       a1, 26
40:               c.mv         t5, s5
                  c.addi       t5, -1
                  sll          s9, t6, a7
                  la           sp, sub_1
                  c.mv         s9, s8
                  addi         sp, sp, -930
                  xori         a2, s10, -354
                  srai         s6, s8, 20
                  mulhsu       s3, a2, s7
                  xor          a2, a0, gp
                  bge          a7, t6, main_j1 #branch to jump instr
                  c.addi       t5, 6
main_j1:          jalr         t3, sp, 930 #jump main -> sub_1
43:               xor          s11, a6, a3
                  c.or         a4, a0
                  auipc        s0, 101147
46:               c.bnez       a1, 56f
                  sltiu        s1, t3, -1436
                  slti         s7, s4, -972
49:               nop
                  sll          t1, t4, t5
                  c.bnez       a2, 63f
                  c.slli       t2, 23
                  xor          s9, s10, s8
                  c.li         s9, -1
                  add          t1, t2, t5
56:               srai         t4, s10, 30
                  addi         a7, s5, -126
                  c.mv         t6, s7
                  c.andi       a1, 17
                  lui          s9, 552579
                  div          t3, t6, s7
                  andi         s8, t0, 1877
63:               srli         s0, s11, 17
                  la x10, test_done
                  jalr x0, x10, 0
test_done:        
                  li gp, 1
                  ecall
sub_5:            bgeu         a3, s7, sub_5_stack_p
sub_5_stack_p:    addi         s5, s5, -64
                  lui          s10, 929482
                  or           sp, s3, s1
                  sw           t3, 4(s5)
                  mulh         t2, s8, t2
                  srai         s3, sp, 3
                  la           t3, region_0+1979 #start load_store_instr_stream_2
                  la           t5, region_0+109 #start load_store_instr_stream_3
                  la           s0, region_0+1874 #start load_store_instr_stream_1
                  lb           a1, 246(t5)
                  sh           s5, -10(s0)
                  lbu          gp, 0(t5)
                  lb           s3, 20(t5)
                  la           t0, region_0+544 #start load_store_instr_stream_0
                  lh           a3, -8(t0)
                  lb           a2, 129(t5)
                  lb           s3, 18(t3)
                  lb           a5, -2(t3)
                  lbu          s7, 34(t5)
                  sb           s2, -47(t3)
                  lbu          s11, -11(s0)
                  lh           s8, -81(t5)
                  lb           t2, 8(t3)
                  lb           s10, -62(t3)
                  lbu          zero, -1(t0)
                  lbu          t1, -13(s0)
                  lb           s3, 46(t5)
                  lb           t4, -15(t0)
                  lbu          tp, 9(s0)
                  lb           gp, 8(t0)
                  sb           s6, -22(t3)
                  lhu          s3, 137(t5)
                  lbu          gp, -3(s0)
                  lbu          s3, 2(s0)
                  lb           t4, -14(s0)
                  sb           s5, -16(t5)
                  lbu          zero, 9(t0)
                  lh           s4, 14(s0)
                  lbu          s8, -11(s0)
                  lh           t1, 57(t5) #end load_store_instr_stream_3
                  lbu          gp, -56(t3) #end load_store_instr_stream_2
                  lhu          t2, 2(s0) #end load_store_instr_stream_1
                  lbu          ra, 2(t0) #end load_store_instr_stream_0
                  la           t5, region_0+252 #start load_store_instr_stream_3
                  la           s8, region_0+1158 #start load_store_instr_stream_2
                  lbu          ra, -115(t5)
                  la           t1, region_0+1742 #start load_store_instr_stream_0
                  la           t3, region_0+332 #start load_store_instr_stream_1
                  sb           a3, -1(t1)
                  lb           a3, -3(t3)
                  lbu          s11, 7(t1)
                  lhu          t2, -230(s8)
                  lb           s11, -3(t3)
                  lb           gp, 241(t5)
                  lb           a3, -26(t5)
                  lb           s11, 0(t1)
                  sb           t1, -170(s8)
                  lbu          s11, -13(t3)
                  lbu          zero, 5(s8)
                  lhu          s10, 12(t3)
                  sb           a0, 10(t1)
                  lbu          a1, -11(t3)
                  lw           gp, 170(s8)
                  lbu          t2, -239(s8)
                  lbu          a1, -5(t1)
                  sb           s6, 626(t5)
                  lb           t6, 236(s8)
                  sb           t2, 1(t3)
                  lb           tp, -3(t1)
                  lb           s11, 1445(t5)
                  lb           s10, 243(s8)
                  lh           zero, 14(t3)
                  lbu          t4, 1536(t5)
                  lb           t4, -119(s8)
                  sh           t0, 10(t1)
                  lb           a7, -3(t1)
                  sb           s0, 37(t5)
                  sh           ra, -100(t5)
                  sb           t2, 49(s8) #end load_store_instr_stream_2
                  lb           t6, -49(t5) #end load_store_instr_stream_3
                  sw           a6, 8(t3)
                  lbu          s7, 13(t3)
                  sb           s6, -1(t3) #end load_store_instr_stream_1
                  lbu          a2, 12(t1) #end load_store_instr_stream_0
                  la           s10, region_0+1896 #start riscv_hazard_instr_stream_2
                  mulh         sp, s1, sp
                  mulh         a1, s1, s1
                  lhu          sp, 88(s10)
                  divu         a1, zero, ra
                  c.srai       s1, 12
                  lw           t2, -56(s10)
                  lb           s1, -165(s10)
                  c.nop
                  sb           zero, 99(s10)
                  c.and        a1, a1
                  lbu          sp, -190(s10)
                  lbu          ra, -252(s10)
                  c.nop
                  sra          t2, t2, sp
                  or           ra, zero, zero
                  sub          s1, s1, s1
                  c.and        a1, s1
                  lb           ra, 36(s10)
                  c.srai       s1, 7
                  lh           a1, -80(s10)
                  lbu          zero, -149(s10)
                  xor          zero, sp, ra
                  sb           zero, -148(s10)
                  slli         s1, ra, 16
                  lb           s1, -49(s10)
                  lhu          t2, -34(s10)
                  sh           s1, 84(s10)
                  sltu         sp, zero, zero
                  lb           s1, -245(s10)
                  ori          t2, ra, 887
                  lbu          a1, -101(s10) #end riscv_hazard_instr_stream_2
                  la           sp, region_1+1356 #start riscv_load_store_rand_instr_stream_0
                  lb           s0, 6(sp)
                  lb           ra, 5(sp)
                  lbu          t1, 15(sp)
                  sra          a3, s5, s4
                  lb           s1, -10(sp)
                  srli         t3, t5, 15
                  sb           s1, -13(sp)
                  lui          a7, 428243
                  lbu          a3, 10(sp)
                  slti         s8, s5, 1616
                  srli         tp, t0, 12
                  lb           s8, -11(sp)
                  slli         s11, t0, 27
                  sub          a4, tp, s5
                  c.or         s1, a2
                  c.nop
                  nop
                  lbu          s8, -9(sp)
                  c.srli       a1, 14
                  lb           a1, 9(sp)
                  sh           t0, 6(sp)
                  sh           s6, 2(sp)
                  lui          t1, 444787
                  lhu          t6, 14(sp)
                  lb           s11, 5(sp)
                  c.or         a4, a4
                  sb           t0, -13(sp)
                  c.mv         a7, a1
                  slt          tp, t4, gp
                  c.mv         ra, a1
                  slti         gp, s0, -1489
                  auipc        s8, 906578
                  lbu          s0, 15(sp)
                  lbu          a2, -10(sp)
                  srai         a3, a1, 14
                  c.lwsp       a1, 12(sp)
                  xor          s1, a2, s7
                  sh           s7, -4(sp)
                  mulhsu       s10, s8, zero
                  sll          s8, t5, a0
                  lbu          a5, 14(sp)
                  lb           s3, 9(sp)
                  mulh         s1, a1, s11
                  mulhsu       t5, s7, gp
                  nop
                  lbu          t2, 1(sp)
                  and          t1, a5, t6
                  lbu          a4, 13(sp)
                  c.and        a2, a0
                  ori          ra, s7, -1109
                  sb           gp, 10(sp)
                  c.slli       s7, 18
                  c.lwsp       a6, 4(sp)
                  lb           s10, 15(sp) #end riscv_load_store_rand_instr_stream_0
                  la           a5, region_1+861 #start load_store_instr_stream_1
                  la           tp, region_0+749 #start load_store_instr_stream_0
                  sw           s7, 187(tp)
                  lb           t4, -159(a5)
                  sh           s8, -215(tp)
                  lb           s9, -19(a5)
                  lhu          s0, 77(a5)
                  lbu          a1, 0(a5)
                  lb           a2, -76(a5)
                  sb           a4, 195(tp)
                  lb           a6, -112(a5)
                  sb           s3, -112(tp)
                  lb           a1, -191(a5)
                  sw           a4, -169(tp)
                  sb           s5, -254(a5) #end load_store_instr_stream_1
                  sb           s1, 64(tp) #end load_store_instr_stream_0
                  addi         t5, zero, -4 #init loop 1 counter
                  srai         a6, t1, 14
                  c.xor        a5, s1
                  addi         s7, zero, -12 #init loop 1 limit
                  sub          s8, s8, t4
sub_5_28_1_t:     rem          s9, a1, t1
                  addi         t5, t5, -2 #update loop 1 counter
                  c.sub        a3, a4
                  addi         t0, zero, -3 #init loop 0 counter
                  addi         tp, zero, 3 #init loop 0 limit
                  mulhsu       gp, a7, t6
                  rem          zero, a5, s3
sub_5_28_0_t:     div          s6, sp, a1
                  addi         t0, t0, 1 #update loop 0 counter
                  srl          t1, a7, sp
                  mulhu        s4, s8, s8
                  bne          t0, tp, sub_5_28_0_t #branch for loop 0
                  srai         a4, s10, 29
                  bne          t5, s7, sub_5_28_1_t #branch for loop 1
                  divu         s1, t5, s8
                  la           s9, amo_0+24 #start riscv_lr_sc_instr_stream_3
                  remu         t6, s11, a5
                  c.addi4spn   s0, sp, 272
                  srl          a1, s11, t4
                  c.lui        s1, 22
                  srli         t3, t0, 26
                  lr.w          t2, (s9)
                  mul          s8, ra, gp
                  auipc        a2, 940804
                  auipc        s3, 393416
                  c.li         s4, 23
                  sc.w.aq       s8, a5, (s9) #end riscv_lr_sc_instr_stream_3
                  la           s11, region_0+916 #start riscv_load_store_hazard_instr_stream_3
                  lb           s1, 3(s11)
                  add          a3, sp, t0
                  lb           t1, 15(s11)
                  sw           s2, 8(s11)
                  lw           a2, 8(s11)
                  sh           a0, 8(s11)
                  ori          zero, s4, -116
                  lb           a2, 8(s11)
                  lbu          s0, 8(s11)
                  sh           a0, 8(s11)
                  lw           s10, 8(s11)
                  lhu          gp, 8(s11)
                  andi         a2, t6, -1735
                  lbu          a4, -8(s11)
                  sh           s9, 8(s11) #end riscv_load_store_hazard_instr_stream_3
                  la           a6, region_0+790 #start riscv_hazard_instr_stream_1
                  lh           ra, 8(a6)
                  slli         s10, a3, 24
                  mul          t4, s0, a3
                  xori         s10, s0, -1772
                  c.lui        s10, 22
                  c.xor        a3, s0
                  srli         a5, t4, 22
                  lhu          s10, -4(a6)
                  c.lui        s0, 8
                  c.mv         t4, t4
                  sb           s0, -7(a6)
                  sw           a5, 2(a6)
                  c.li         ra, 9
                  slli         a3, s10, 13
                  c.slli       a5, 27
                  c.nop
                  addi         ra, s10, -200
                  sb           a3, 1(a6)
                  sb           a5, 4(a6)
                  lbu          t4, -15(a6)
                  c.sub        a5, a3
                  add          ra, t4, ra
                  lbu          a5, -15(a6)
                  sw           a3, -10(a6)
                  lui          a5, 835433
                  lw           s0, -10(a6)
                  lh           a3, 4(a6)
                  ori          s10, ra, 1309
                  mulhu        a5, t4, a5
                  c.lui        t4, 27
                  sub          s10, s10, a3
                  sltiu        ra, t4, 739
                  auipc        t4, 809693
                  sh           a5, 10(a6)
                  andi         s10, a3, 619
                  srai         s0, t4, 26
                  mul          s0, s10, t4
                  c.lui        ra, 24
                  nop
                  slli         a3, a5, 31
                  lh           a3, -2(a6)
                  c.li         a3, -1
                  sb           a5, 2(a6) #end riscv_hazard_instr_stream_1
                  la           sp, region_0+1806 #start riscv_load_store_hazard_instr_stream_2
                  sb           s10, -13(sp)
                  lh           a7, 28(sp)
                  lb           s7, 23(sp)
                  lbu          s8, 15(sp)
                  lb           t6, 15(sp)
                  lb           tp, 15(sp)
                  sh           s3, 44(sp)
                  lh           t1, 44(sp)
                  lbu          a5, 55(sp)
                  sh           t4, 4(sp)
                  sb           ra, -27(sp)
                  lbu          ra, 25(sp)
                  sb           s7, 9(sp)
                  lb           t4, -24(sp)
                  slti         t6, s9, -1300
                  lb           s3, 43(sp)
                  sb           t1, 43(sp)
                  sb           s11, -31(sp)
                  lbu          s0, 23(sp)
                  lb           tp, -60(sp) #end riscv_load_store_hazard_instr_stream_2
sub_5_14:         jal          t3, 24f
0:                c.j          18f
1:                c.j          23f
2:                c.jal        7f
3:                jal          t0, 27f
4:                jal          s3, 10f
5:                c.jal        26f
6:                c.jal        28f
7:                c.j          14f
8:                c.jal        3b
9:                c.jal        21f
10:               jal          ra, 17f
11:               jal          a7, 29f
12:               c.j          8b
13:               c.jal        12b
14:               jal          ra, 6b
15:               c.j          5b
16:               c.j          20f
17:               c.j          2b
18:               c.j          9b
19:               c.j          16b
20:               c.jal        11b
21:               c.j          4b
22:               jal          ra, 1b
23:               c.jal        13b
24:               c.j          0b
25:               c.jal        22b
26:               jal          ra, 25b
27:               c.jal        19b
28:               jal          gp, 15b
29:               add          s7, s11, ra
                  la           sp, region_1+705 #start riscv_load_store_rand_instr_stream_2
                  lbu          s11, -24(sp)
                  lb           s7, -142(sp)
                  lbu          s7, -174(sp)
                  lbu          a2, -184(sp)
                  lb           a3, 54(sp)
                  sb           s0, -101(sp)
                  lhu          t6, -251(sp)
                  lbu          s8, -208(sp)
                  lhu          s6, -59(sp)
                  lbu          s0, -91(sp)
                  lb           t6, 134(sp)
                  sb           t3, 83(sp)
                  lb           a6, -189(sp)
                  lb           tp, 66(sp)
                  mulh         s3, a4, t0
                  lb           s6, -32(sp)
                  srai         s7, a3, 8
                  c.nop
                  c.addi       a6, -1
                  sh           s9, -103(sp)
                  lbu          a6, 244(sp)
                  sb           s9, -245(sp)
                  srl          a7, a5, t6
                  ori          t1, t3, 1635
                  lb           s11, 224(sp)
                  sb           s11, 21(sp)
                  lb           a6, -64(sp)
                  srli         s10, s2, 3
                  c.addi       t3, 6
                  lui          s9, 968582
                  addi         t1, a4, 1549
                  c.xor        a1, s0
                  mulh         s4, t5, a6
                  lb           tp, -28(sp)
                  sb           t5, -122(sp)
                  slt          t5, a4, zero
                  c.add        t1, ra
                  sb           a0, 38(sp)
                  lb           t3, 22(sp)
                  c.add        s1, t4
                  c.xor        a5, s0
                  lw           t2, -145(sp)
                  lh           t2, 107(sp) #end riscv_load_store_rand_instr_stream_2
                  la           tp, region_0+1980 #start load_store_instr_stream_0
                  sh           s7, -1254(tp)
                  la           a1, region_1+1683 #start load_store_instr_stream_1
                  lbu          s7, -1023(tp)
                  lbu          a3, -1930(tp)
                  sb           s3, -14(a1)
                  lb           t0, 18(a1)
                  lbu          a3, -1169(tp)
                  lbu          t0, -9(a1)
                  sb           tp, -1174(tp)
                  lh           gp, 39(a1)
                  lhu          t3, -608(tp)
                  sb           s5, 60(a1)
                  lb           sp, -40(a1) #end load_store_instr_stream_1
                  lhu          t1, -360(tp) #end load_store_instr_stream_0
                  la           sp, region_1+1506 #start riscv_load_store_hazard_instr_stream_1
                  c.add        s10, t2
                  lh           t4, 22(sp)
                  sb           t2, 48(sp)
                  lhu          a6, 48(sp)
                  sb           t4, 14(sp)
                  sw           t0, -22(sp)
                  lw           a2, -2(sp)
                  lbu          a7, -12(sp)
                  lb           a1, -12(sp)
                  lhu          s0, -12(sp)
                  sb           s10, -33(sp)
                  sw           sp, 10(sp)
                  lhu          s10, 10(sp)
                  lbu          a4, 21(sp)
                  lbu          s11, 21(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           a3, amo_0+20 #start riscv_amo_instr_stream_0
                  la           s0, amo_0+28
                  amomaxu.w.aq  a5, s3, (s0)
                  amoadd.w      gp, t4, (a3)
                  amoand.w      t3, a5, (s0) #end riscv_amo_instr_stream_0
                  la           t4, region_0+676 #start load_store_instr_stream_1
                  la           t1, region_0+1729 #start load_store_instr_stream_2
                  sb           a4, -41(t4)
                  la           t0, region_0+1759 #start load_store_instr_stream_0
                  lbu          t2, -2(t4)
                  sb           s4, 16(t1)
                  lhu          tp, -5(t1)
                  lbu          s8, 15(t0)
                  lhu          s9, -40(t4)
                  sb           a4, 7(t0)
                  lbu          s3, 7(t0)
                  lhu          t5, 22(t4)
                  lbu          s8, 55(t4)
                  lb           ra, 4(t0)
                  sb           s11, 14(t0)
                  lhu          t3, 7(t1)
                  sb           zero, 4(t0)
                  lh           t3, -40(t4)
                  sh           a3, -34(t4)
                  lb           t6, -7(t1)
                  lbu          tp, -6(t0)
                  lb           s8, -3(t1)
                  lbu          a5, 6(t1)
                  lhu          s7, 11(t0)
                  lbu          s6, 59(t4)
                  sb           t4, 14(t1)
                  lb           a2, 63(t4)
                  sb           a0, -12(t0)
                  lh           s0, 1(t1)
                  lw           a6, -16(t4) #end load_store_instr_stream_1
                  sw           t5, -13(t1) #end load_store_instr_stream_2
                  lhu          a5, 7(t0) #end load_store_instr_stream_0
                  la           tp, amo_0+32 #start riscv_lr_sc_instr_stream_2
                  srli         ra, a6, 8
                  xor          t2, s3, t0
                  c.or         s1, s1
                  c.andi       a2, -1
                  c.addi16sp   sp, 240
                  c.and        a2, s1
                  lr.w.aq       ra, (tp)
                  c.andi       s0, -1
                  sub          t0, a2, a4
                  sc.w          s7, t4, (tp) #end riscv_lr_sc_instr_stream_2
sub_5_15:         jal          t3, 23f
0:                c.jal        7f
1:                c.j          22f
2:                c.jal        6f
3:                c.jal        13f
4:                jal          ra, 10f
5:                c.j          9f
6:                c.j          24f
7:                jal          ra, 15f
8:                c.jal        2b
9:                c.j          16f
10:               c.jal        0b
11:               jal          ra, 19f
12:               c.j          8b
13:               jal          ra, 11b
14:               jal          t1, 17f
15:               c.jal        18f
16:               c.jal        12b
17:               jal          ra, 21f
18:               c.j          14b
19:               c.jal        5b
20:               c.j          1b
21:               c.jal        20b
22:               c.j          3b
23:               c.jal        4b
24:               c.nop
sub_5_10:         jal          t3, 15f
0:                c.j          4f
1:                c.jal        11f
2:                c.j          14f
3:                c.j          7f
4:                jal          ra, 10f
5:                c.jal        18f
6:                c.jal        19f
7:                jal          t3, 20f
8:                c.jal        3b
9:                c.jal        12f
10:               c.jal        13f
11:               c.jal        9b
12:               c.j          6b
13:               c.j          5b
14:               c.jal        1b
15:               c.jal        2b
16:               jal          a7, 17f
17:               jal          t1, 8b
18:               c.j          16b
19:               c.j          0b
20:               xor          t6, s7, t4
                  la           s8, region_0+1288 #start load_store_instr_stream_0
                  la           s11, region_1+1523 #start load_store_instr_stream_1
                  lbu          s7, -135(s8)
                  lh           tp, -25(s11)
                  lbu          a1, -362(s8)
                  sb           s10, -50(s11)
                  lbu          t5, -912(s8)
                  lhu          zero, 17(s11)
                  sb           a7, -809(s8)
                  lb           a2, -1156(s8)
                  sb           s5, 2(s11)
                  sh           zero, 62(s8)
                  lbu          t2, -39(s11) #end load_store_instr_stream_1
                  lbu          a4, 243(s8)
                  lb           s4, -140(s8)
                  lhu          zero, 32(s8)
                  sb           s6, -1064(s8) #end load_store_instr_stream_0
                  addi         s0, zero, 9 #init loop 0 counter
                  c.srli       a5, 15
                  slt          t0, a2, t0
                  sra          tp, s11, a2
                  andi         a4, s11, -1347
                  c.addi16sp   sp, 32
                  sll          a3, zero, a2
                  c.mv         a5, a2
                  sll          t6, a5, a5
                  c.li         t4, -1
                  mulh         t6, s10, t3
                  slt          t5, s2, a2
                  lui          t2, 181269
                  xor          s11, t3, a7
                  mul          a3, a3, s11
                  slti         a1, tp, 1957
                  slt          t1, s1, a3
                  c.srli       s1, 4
                  c.addi4spn   a4, sp, 704
                  c.lui        s6, 19
                  sltiu        s1, s5, -298
                  addi         zero, zero, 0 #init loop 0 limit
                  auipc        gp, 773431
                  c.xor        a3, s1
sub_5_30_0_t:     mulhu        ra, t5, sp
                  sll          t5, s8, a7
                  c.lui        s9, 4
                  addi         s0, s0, -9 #update loop 0 counter
                  c.bnez       s0, sub_5_30_0_t #branch for loop 0
                  c.slli       s10, 2
                  la           s8, amo_0+24 #start riscv_amo_instr_stream_3
                  la           a7, amo_0+48
                  la           gp, amo_0+20
                  la           a6, amo_0+4
                  amomin.w      t2, t0, (a6)
                  amominu.w.aq  sp, s9, (a6)
                  amoand.w.aq   t0, a7, (a7)
                  amomax.w      s1, s10, (gp)
                  ori          s9, s7, -1469
                  amoxor.w      t6, a5, (gp)
                  andi         t3, ra, 1471
                  sltiu        t5, t4, 1253
                  amomax.w.aq   a5, s7, (s8)
                  amoand.w.rl   s7, s9, (a7)
                  amomaxu.w.rl  t1, sp, (gp) #end riscv_amo_instr_stream_3
                  la           t1, region_0+1592 #start load_store_instr_stream_0
                  lhu          t4, -16(t1)
                  la           a1, region_1+1332 #start load_store_instr_stream_1
                  lbu          ra, -456(a1)
                  lbu          t6, -16(t1)
                  lbu          t6, -1314(a1)
                  sb           a6, 27(a1)
                  lbu          s1, -25(a1)
                  sh           t0, 2(t1)
                  lbu          gp, -1219(a1) #end load_store_instr_stream_1
                  lb           s4, 11(t1)
                  sb           zero, 9(t1)
                  sb           s5, 4(t1) #end load_store_instr_stream_0
                  la           t5, region_1+481 #start riscv_load_store_hazard_instr_stream_4
                  srli         s8, s11, 29
                  lb           t2, 12(t5)
                  lb           t4, 12(t5)
                  lbu          t4, 50(t5)
                  lbu          a3, 50(t5)
                  divu         t2, s5, a1
                  lb           s9, 50(t5)
                  lb           a7, 50(t5)
                  lh           s8, -43(t5)
                  sb           s10, -43(t5)
                  lhu          s3, 55(t5)
                  lb           s1, -14(t5)
                  sb           s2, -14(t5)
                  sh           a5, -35(t5)
                  lbu          s11, -48(t5)
                  lb           s4, 45(t5)
                  lb           tp, -51(t5) #end riscv_load_store_hazard_instr_stream_4
                  la           sp, region_1+489 #start riscv_load_store_rand_instr_stream_1
                  sb           t3, -176(sp)
                  sb           t1, -116(sp)
                  c.sub        a1, a1
                  slt          a5, s6, s5
                  lbu          s9, 106(sp)
                  lbu          s8, -244(sp)
                  lbu          s8, -13(sp)
                  lh           s0, 81(sp)
                  lhu          gp, -135(sp)
                  lbu          t0, 76(sp)
                  c.mv         s6, s4
                  lb           a5, -19(sp)
                  lb           s3, 216(sp)
                  c.nop
                  xori         s7, t5, -500
                  or           a3, t5, a1
                  and          gp, s11, a0
                  and          a6, s9, s8
                  lw           a3, 211(sp)
                  c.nop
                  sb           a1, 102(sp)
                  lbu          a2, -192(sp)
                  lbu          t0, 196(sp)
                  lhu          s10, -161(sp)
                  sw           s0, -177(sp)
                  c.xor        a1, a1
                  lb           a6, -170(sp)
                  lhu          s6, -145(sp)
                  sb           s7, 110(sp)
                  lbu          a4, -72(sp)
                  sh           s3, -233(sp)
                  ori          a5, ra, -483
                  sb           a1, -21(sp)
                  and          s0, a7, s8
                  lbu          s9, 81(sp)
                  lhu          t3, 193(sp)
                  lbu          ra, 115(sp)
                  lbu          s7, 54(sp)
                  sw           s5, -93(sp)
                  sra          a1, s11, tp
                  lbu          a2, 216(sp)
                  lw           s8, 251(sp) #end riscv_load_store_rand_instr_stream_1
                  la           s7, amo_0+24 #start riscv_lr_sc_instr_stream_1
                  divu         a2, t6, s2
                  c.and        a2, a3
                  c.andi       a3, 18
                  mulhu        s6, gp, s3
                  andi         t4, a1, 1896
                  c.li         a2, 10
                  c.add        a2, tp
                  c.li         s4, -1
                  addi         t2, s10, -1405
                  lr.w          t6, (s7)
                  c.addi4spn   a3, sp, 16
                  sc.w.rl       a1, a6, (s7) #end riscv_lr_sc_instr_stream_1
                  la           sp, region_1+658 #start riscv_hazard_instr_stream_5
                  slli         s10, t1, 4
                  sltiu        s3, s3, -1649
                  lhu          a3, -426(sp)
                  xor          s10, s3, t0
                  lhu          a3, 1088(sp)
                  lb           s10, -187(sp)
                  xori         t0, s3, -796
                  sb           a4, 1286(sp)
                  lbu          s3, 173(sp)
                  sh           s10, 26(sp)
                  lbu          a4, -379(sp)
                  lbu          t1, 43(sp)
                  sb           a3, -315(sp)
                  lb           t0, 590(sp)
                  sltu         s3, a4, a3
                  sll          t1, s3, t1
                  lbu          a3, 1013(sp)
                  div          t1, t0, t1
                  andi         a4, t0, 857
                  sb           s3, 751(sp)
                  lb           t0, -107(sp)
                  lbu          t1, 53(sp)
                  sb           s3, 809(sp)
                  lb           s10, 116(sp)
                  slli         t0, s10, 26
                  sb           t0, 1227(sp)
                  addi         t1, s10, 603
                  sh           a3, -12(sp)
                  lb           a4, 481(sp)
                  lui          s10, 968063
                  and          t0, t1, t0
                  lh           a4, 790(sp)
                  lb           t0, -375(sp)
                  mulhu        t0, a3, t1
                  sh           a4, 1212(sp)
                  sb           a3, 331(sp)
                  lb           s10, 1275(sp)
                  sb           a3, 653(sp)
                  lb           s10, -157(sp)
                  addi         t0, s3, 86
                  lbu          t1, 942(sp)
                  sb           a4, 47(sp)
                  or           t1, t0, s10
                  sb           t0, 1213(sp) #end riscv_hazard_instr_stream_5
                  la           s4, region_1+746 #start load_store_instr_stream_0
                  la           a4, region_0+1411 #start load_store_instr_stream_1
                  lb           sp, 194(s4)
                  lbu          a6, -8(a4)
                  lbu          s3, 457(s4)
                  sw           s7, 45(a4)
                  lhu          t0, 566(s4)
                  lbu          a7, -41(a4)
                  lhu          a2, 80(s4)
                  sb           ra, 20(a4)
                  lh           s10, -61(a4)
                  sb           a5, 79(s4)
                  sb           s0, -132(s4)
                  sb           a2, -37(a4)
                  lbu          a2, -47(a4)
                  lb           s1, 1170(s4)
                  sw           t0, 53(a4) #end load_store_instr_stream_1
                  lbu          s3, 1095(s4)
                  lh           a3, 830(s4) #end load_store_instr_stream_0
                  la           a7, region_0+1208 #start load_store_instr_stream_1
                  la           t4, region_0+355 #start load_store_instr_stream_4
                  la           s11, region_0+614 #start load_store_instr_stream_0
                  lbu          ra, -416(s11)
                  lb           a3, -18(a7)
                  la           a6, region_0+1800 #start load_store_instr_stream_3
                  la           a1, region_0+1866 #start load_store_instr_stream_2
                  lbu          s7, 125(a6)
                  lbu          t3, 105(a1)
                  sb           a2, -143(a1)
                  lb           zero, -69(t4)
                  sh           sp, 128(s11)
                  lbu          s7, -50(a7)
                  lb           s3, -27(a6)
                  lb           a2, 255(a7)
                  lbu          a2, 198(a7)
                  lb           t0, 122(t4)
                  lbu          s1, -135(a1)
                  lbu          ra, 192(t4)
                  sh           a3, -480(s11)
                  lb           t0, -213(a1)
                  lb           s1, 75(a7)
                  lb           a3, -33(t4)
                  lhu          t6, -1710(a6)
                  lb           sp, -41(a1)
                  lhu          t2, 51(t4)
                  lb           a3, -523(a6)
                  lbu          zero, 373(s11)
                  lh           s9, -12(a1)
                  lbu          ra, -122(a7)
                  lb           s6, 188(t4)
                  lb           s10, 1079(s11)
                  sb           t0, -228(t4)
                  sb           tp, -1474(a6)
                  lbu          t2, 45(a7)
                  lbu          s7, -30(t4)
                  sb           ra, -177(a7)
                  lh           t5, -1126(a6)
                  lb           t1, -130(t4) #end load_store_instr_stream_4
                  sh           gp, -162(a1)
                  sh           a4, -98(a1) #end load_store_instr_stream_2
                  lbu          s0, -1143(a6) #end load_store_instr_stream_3
                  lbu          t1, 42(a7) #end load_store_instr_stream_1
                  sw           s0, 746(s11) #end load_store_instr_stream_0
                  la           s7, region_1+1490 #start riscv_hazard_instr_stream_3
                  lbu          t0, 41(s7)
                  sb           t2, -71(s7)
                  c.sub        a4, a4
                  xori         t2, t0, 822
                  lhu          t4, -2(s7)
                  andi         t4, t0, -1957
                  divu         a7, t2, t4
                  slli         t5, t0, 4
                  lb           t0, -159(s7)
                  c.and        a4, a4
                  sh           t2, 104(s7)
                  lbu          t2, 193(s7)
                  xor          t5, t5, t0
                  slt          t2, a7, t5
                  sub          t0, t4, t4
                  sub          t0, t0, a7
                  add          t0, t2, t4
                  ori          a4, t0, -1828
                  mulhu        a4, a7, a4
                  addi         t0, a7, -1543
                  c.addi       a7, 20
                  sll          t5, t4, t5
                  c.mv         t0, a7
                  xori         a7, a4, 227
                  mulh         t4, t2, t2
                  or           t4, t4, t0
                  divu         t0, a4, a7
                  lhu          t4, 86(s7)
                  sb           t2, 146(s7)
                  xor          a4, t5, a7
                  lhu          t4, -232(s7)
                  sb           t0, -206(s7)
                  and          t5, t0, t0
                  sb           t0, 159(s7)
                  divu         t5, t4, t0
                  c.li         a4, -1
                  sb           t2, -148(s7)
                  sb           t5, -87(s7) #end riscv_hazard_instr_stream_3
                  la           t0, region_1+116 #start riscv_hazard_instr_stream_0
                  sb           a7, 4(t0)
                  lbu          s1, -37(t0)
                  lb           t5, 41(t0)
                  lhu          t5, 26(t0)
                  slti         s1, s1, 197
                  c.and        s1, s1
                  xor          s1, s1, t5
                  mul          t5, t6, t6
                  sb           t5, -45(t0)
                  lhu          t5, 6(t0)
                  c.andi       s1, -1
                  sh           t6, 36(t0)
                  remu         s6, a7, t5
                  sb           a7, -61(t0)
                  ori          a5, t6, -1497
                  lb           s6, 57(t0)
                  sll          s6, t5, t5
                  sh           a7, 22(t0)
                  lbu          s6, 2(t0)
                  sb           t6, 17(t0)
                  lb           t5, -37(t0)
                  c.slli       t5, 15
                  sb           a7, -11(t0)
                  lbu          s6, 18(t0)
                  lb           t6, -20(t0)
                  c.xor        s1, s1
                  lh           t5, -34(t0)
                  sb           s6, -55(t0)
                  sb           t5, 33(t0)
                  lb           a7, -34(t0)
                  c.xor        a5, s1
                  sb           t6, 0(t0)
                  auipc        a5, 890980
                  mulhu        s1, a5, a7
                  lb           a7, -11(t0)
                  sb           a5, -24(t0)
                  lh           s1, -52(t0)
                  c.andi       s1, -1
                  sb           a5, 51(t0) #end riscv_hazard_instr_stream_0
                  la           gp, region_0+1663 #start riscv_load_store_rand_instr_stream_4
                  lb           s6, -14(gp)
                  lb           s1, -11(gp)
                  lh           s0, -1(gp)
                  rem          s6, t2, t2
                  lb           s0, -6(gp)
                  lb           sp, -12(gp)
                  lw           s10, 13(gp)
                  sb           s5, -4(gp)
                  sw           s5, -3(gp)
                  sb           a3, -2(gp)
                  lb           s11, 14(gp)
                  lbu          s7, -9(gp)
                  lbu          t0, -13(gp)
                  lb           s7, -6(gp)
                  c.and        a1, s1
                  add          s0, a6, s4
                  lbu          t0, 7(gp)
                  mulh         a1, tp, s9
                  lbu          t0, 10(gp)
                  lh           t2, 1(gp)
                  sw           s1, 1(gp)
                  sh           s1, -1(gp)
                  and          zero, s7, s8
                  lb           s9, -15(gp)
                  lbu          s11, -16(gp)
                  nop
                  divu         zero, s8, tp
                  lbu          t0, -14(gp)
                  c.addi16sp   sp, 304
                  sb           t5, 12(gp)
                  sw           s7, 5(gp)
                  lb           a3, 2(gp)
                  mulh         s7, tp, a7
                  srli         a2, a7, 1
                  andi         t1, s1, -608
                  lbu          a2, -14(gp)
                  c.li         t2, -1
                  lh           tp, 1(gp)
                  lw           a6, -3(gp) #end riscv_load_store_rand_instr_stream_4
                  la           sp, region_0+803 #start riscv_load_store_hazard_instr_stream_5
                  lbu          s9, 26(sp)
                  lb           t5, -39(sp)
                  lb           gp, -1(sp)
                  lb           t5, -1(sp)
                  sw           tp, -43(sp)
                  sltu         t0, a2, s5
                  lb           a3, -15(sp)
                  sb           s10, -15(sp)
                  sh           s11, -1(sp)
                  c.and        a2, a4
                  lhu          t4, -59(sp)
                  xori         s9, s8, -1263
                  sw           t0, 33(sp)
                  sll          ra, s6, s8
                  lui          s3, 960784
                  c.srai       a5, 29
                  lbu          a4, 59(sp)
                  lbu          s1, 59(sp)
                  lbu          tp, 40(sp)
                  lb           s3, 24(sp)
                  lb           s6, -41(sp)
                  sb           tp, -41(sp)
                  lb           zero, -14(sp)
                  lb           t0, 30(sp) #end riscv_load_store_hazard_instr_stream_5
sub_5_13:         jal          t3, 23f
0:                jal          gp, 27f
1:                jal          t1, 2f
2:                c.j          17f
3:                c.j          5f
4:                c.jal        14f
5:                c.j          8f
6:                c.jal        20f
7:                jal          ra, 22f
8:                jal          s1, 4b
9:                c.jal        7b
10:               jal          ra, 18f
11:               c.j          13f
12:               c.j          6b
13:               jal          ra, 12b
14:               c.jal        11b
15:               jal          ra, 30f
16:               c.j          24f
17:               c.j          0b
18:               c.jal        25f
19:               c.jal        15b
20:               jal          t1, 21f
21:               c.j          28f
22:               c.jal        1b
23:               jal          ra, 16b
24:               jal          ra, 3b
25:               c.j          19b
26:               c.j          9b
27:               c.j          10b
28:               c.jal        29f
29:               jal          s9, 26b
30:               c.addi4spn   a5, sp, 704
                  la           gp, amo_0+48 #start riscv_amo_instr_stream_2
                  remu         a3, tp, zero
                  amoadd.w      tp, s6, (gp)
                  mulhu        sp, s0, t1
                  amominu.w     tp, a6, (gp) #end riscv_amo_instr_stream_2
                  la           gp, amo_0+8 #start riscv_lr_sc_instr_stream_0
                  c.addi16sp   sp, -16
                  remu         a1, s6, a4
                  lr.w          a1, (gp)
                  rem          s7, t2, a5
                  mul          t1, a0, a3
                  sltiu        a6, s2, -694
                  srai         a3, a4, 21
                  div          s7, t4, a0
                  xor          s0, t3, t3
                  mulhsu       s3, a6, s0
                  srli         t6, t4, 11
                  sc.w.rl       t0, t3, (gp) #end riscv_lr_sc_instr_stream_0
                  la           t1, region_0+608 #start riscv_hazard_instr_stream_4
                  div          t3, a3, s7
                  lbu          a3, 6(t1)
                  c.sub        a3, a5
                  auipc        ra, 803147
                  srl          s8, t3, a3
                  sb           a5, 710(t1)
                  slli         a5, s7, 18
                  rem          a3, a3, a5
                  sb           ra, 995(t1)
                  c.li         s8, 24
                  sb           ra, 631(t1)
                  lhu          a3, -454(t1)
                  sb           a5, 820(t1)
                  c.mv         s8, s8
                  sra          a5, t3, a5
                  or           a5, ra, s8
                  c.and        a3, a5
                  add          s8, a5, ra
                  and          a3, s7, s8
                  sb           a3, 1366(t1)
                  srl          s8, t3, s7
                  sh           t3, 898(t1)
                  lbu          s8, -17(t1)
                  lb           a3, -357(t1)
                  mulh         s7, s8, ra
                  or           t3, a3, s7
                  divu         t3, ra, s8
                  mul          a5, a3, a5
                  ori          a5, t3, -1753
                  sb           ra, 345(t1)
                  nop
                  c.sub        a3, a3
                  c.lui        s7, 20
                  ori          a5, ra, 1233
                  sub          ra, a5, ra
                  c.sub        a3, a5
                  lb           s7, -559(t1) #end riscv_hazard_instr_stream_4
                  la           ra, region_0+74 #start riscv_load_store_rand_instr_stream_5
                  c.lui        a2, 9
                  lhu          tp, -16(ra)
                  lbu          s10, 16(ra)
                  lh           s7, -8(ra)
                  nop
                  lb           s11, -7(ra)
                  andi         s4, tp, 1234
                  lhu          t3, -10(ra)
                  mulh         t4, s10, a7
                  srl          t3, s5, a3
                  sb           a6, 1(ra)
                  lhu          s0, -16(ra)
                  c.xor        s0, a1
                  lbu          s3, 5(ra)
                  mulhu        a2, a1, tp
                  lh           s0, -12(ra)
                  lbu          s9, 2(ra)
                  sb           a3, -12(ra)
                  c.li         t0, 10
                  c.srai       a1, 25
                  remu         a5, t0, s3
                  slt          s7, gp, s11
                  sltiu        s1, s9, 143
                  sh           tp, -10(ra)
                  add          s4, t4, s5
                  lbu          s10, 11(ra)
                  c.addi       t3, 22
                  sh           a5, -16(ra)
                  andi         a1, s10, -2000
                  auipc        a7, 340990
                  rem          s9, a1, s0
                  mul          s8, s11, s3
                  auipc        s1, 623839
                  lbu          s6, 13(ra)
                  xori         t0, t4, -745
                  lbu          a6, 9(ra)
                  lb           s10, 6(ra)
                  rem          gp, s1, a2
                  srl          s7, a3, s10
                  c.srai       a2, 30
                  sb           t0, -12(ra)
                  lbu          s10, -11(ra)
                  sb           t0, 1(ra)
                  lui          a3, 329491
                  c.lui        s4, 31
                  ori          a7, sp, 610
                  mulhsu       s11, t3, a4
                  c.and        a3, a1
                  c.addi4spn   s0, sp, 576
                  div          t2, zero, t4
                  lbu          s10, 12(ra)
                  sb           t6, -16(ra) #end riscv_load_store_rand_instr_stream_5
                  la           s8, region_1+1716 #start load_store_instr_stream_2
                  la           t2, region_1+1991 #start load_store_instr_stream_1
                  lbu          s6, -1295(s8)
                  la           s11, region_1+1611 #start load_store_instr_stream_0
                  lb           zero, 28(s11)
                  sh           s10, -228(s8)
                  lbu          t5, -15(t2)
                  la           a2, region_1+1147 #start load_store_instr_stream_4
                  sb           a0, -924(a2)
                  lbu          t5, -41(s11)
                  la           tp, region_1+232 #start load_store_instr_stream_3
                  lb           a5, -6(t2)
                  lbu          a3, -13(tp)
                  lbu          s6, -11(tp)
                  sh           s6, -5(s11)
                  sw           t2, 1(t2)
                  sb           s2, 281(s8)
                  sb           s10, -346(s8)
                  sb           gp, -830(s8)
                  lbu          a6, -10(tp)
                  lb           a4, -20(s11)
                  lbu          t0, 13(tp)
                  lw           t3, -8(s8)
                  sb           a0, 823(a2)
                  sw           a5, 8(tp)
                  sh           t4, 16(tp)
                  lbu          a5, -1237(s8)
                  lbu          a3, 609(a2)
                  sh           t3, -4(tp) #end load_store_instr_stream_3
                  sb           s6, -3(t2)
                  sb           tp, -6(t2) #end load_store_instr_stream_1
                  sb           ra, -333(a2)
                  sb           t3, -57(s11)
                  lb           t3, -207(s8) #end load_store_instr_stream_2
                  sb           s3, -12(s11)
                  sb           s11, 248(a2) #end load_store_instr_stream_4
                  lbu          a5, -47(s11) #end load_store_instr_stream_0
                  addi         t0, zero, -8 #init loop 0 counter
                  c.srli       a3, 28
                  sltu         a1, s0, s10
                  c.lui        s4, 6
                  slli         s6, zero, 19
                  c.andi       a4, -1
                  addi         s9, zero, -6 #init loop 0 limit
                  c.sub        a3, a0
sub_5_29_0_t:     c.nop
                  c.xor        a4, a3
                  lui          gp, 877842
                  addi         t0, t0, 5 #update loop 0 counter
                  sltiu        s10, t6, -1244
                  srl          tp, s0, zero
                  xor          s6, a2, s1
                  srl          t5, t0, s11
                  c.sub        a1, a5
                  blt          t0, s9, sub_5_29_0_t #branch for loop 0
                  sll          a7, t5, s6
                  la           sp, region_1+1179 #start riscv_load_store_rand_instr_stream_3
                  mulh         a4, t3, zero
                  lb           ra, 6(sp)
                  lb           s4, 15(sp)
                  lhu          s7, -7(sp)
                  c.li         s8, -1
                  lbu          s7, 12(sp)
                  rem          t3, a5, a7
                  lh           zero, 3(sp)
                  lh           a4, 11(sp)
                  add          t4, ra, t0
                  mul          s3, t1, tp
                  lb           t1, 7(sp)
                  lb           a4, -16(sp)
                  sb           a7, 2(sp)
                  sb           t4, -8(sp)
                  sb           a5, -2(sp)
                  slli         a7, t0, 4
                  lb           s1, -2(sp)
                  lh           zero, 13(sp)
                  sb           s3, 2(sp)
                  lbu          s0, 5(sp)
                  c.addi       ra, 17
                  andi         zero, s11, 968
                  slt          ra, s11, s5
                  sb           a5, 6(sp)
                  sltu         a3, t5, t4
                  lbu          s10, 4(sp)
                  sw           a6, 1(sp)
                  lbu          a3, -6(sp)
                  sb           a2, 10(sp)
                  lb           t2, -4(sp)
                  lb           ra, -10(sp)
                  slt          a6, a0, s2
                  lb           t0, -8(sp)
                  c.add        a2, t2
                  sb           s4, 16(sp)
                  lb           t6, 14(sp)
                  lbu          t2, -4(sp)
                  sh           s8, -1(sp)
                  lw           a2, 13(sp) #end riscv_load_store_rand_instr_stream_3
sub_5_11:         jal          t3, 14f
0:                c.jal        4f
1:                c.j          2f
2:                c.jal        20f
3:                jal          t2, 11f
4:                jal          ra, 6f
5:                c.jal        17f
6:                c.j          3b
7:                jal          sp, 13f
8:                c.j          19f
9:                jal          gp, 18f
10:               jal          t1, 8b
11:               c.j          15f
12:               c.j          10b
13:               c.j          5b
14:               c.j          16f
15:               jal          ra, 7b
16:               c.jal        12b
17:               jal          ra, 9b
18:               c.jal        1b
19:               jal          ra, 0b
20:               slt          s0, s6, ra
                  la           a2, region_1+561 #start riscv_load_store_hazard_instr_stream_0
                  lb           a7, 58(a2)
                  sh           a1, 61(a2)
                  lb           s8, -44(a2)
                  sb           zero, -44(a2)
                  lbu          tp, -44(a2)
                  sb           zero, -5(a2)
                  lb           a4, -5(a2)
                  sb           a0, 51(a2)
                  lbu          t2, 32(a2)
                  sb           t4, 32(a2)
                  sb           tp, 60(a2)
                  c.lui        s3, 14
                  auipc        a4, 495735
                  lb           gp, 36(a2) #end riscv_load_store_hazard_instr_stream_0
                  addi         a1, zero, -6 #init loop 0 counter
                  addi         s6, t0, -1390
                  addi         ra, t6, -258
                  c.srli       a5, 31
                  sll          a3, a7, s4
                  addi         zero, zero, 0 #init loop 0 limit
                  c.and        s0, a0
                  div          s10, s0, t5
                  and          s3, a7, s10
                  auipc        s7, 836953
                  sltu         s11, t3, s10
                  div          s8, s5, a3
                  srli         s7, s2, 10
sub_5_31_0_t:     c.addi4spn   s1, sp, 800
                  c.srai       s1, 31
                  addi         a1, a1, 6 #update loop 0 counter
                  c.nop
                  sltiu        gp, t2, -2026
                  c.beqz       a1, sub_5_31_0_t #branch for loop 0
                  mulhu        gp, a5, t6
sub_5_12:         jal          t3, 13f
0:                c.j          3f
1:                c.jal        11f
2:                jal          ra, 1b
3:                c.jal        16f
4:                c.j          10f
5:                c.jal        14f
6:                c.jal        18f
7:                c.jal        8f
8:                jal          t5, 21f
9:                jal          t1, 17f
10:               c.jal        20f
11:               jal          ra, 6b
12:               c.j          7b
13:               jal          ra, 9b
14:               c.jal        19f
15:               c.jal        12b
16:               c.j          5b
17:               c.j          0b
18:               c.j          4b
19:               c.jal        2b
20:               c.j          15b
21:               add          ra, s2, a6
                  c.addi16sp   sp, -16
                  sub          zero, t3, s2
                  c.srli       a3, 29
                  srli         t4, a5, 19
                  and          a5, t3, t4
                  mulh         a2, sp, a4
                  c.sub        a5, a1
                  c.addi       gp, 19
                  lui          s3, 887136
                  slli         a7, s1, 13
                  xor          a7, t4, a3
                  and          s10, t3, sp
                  sltu         t6, s11, sp
                  bne          a7, s5, 14f
14:               srl          t5, s11, a6
                  c.beqz       s1, 25f
                  c.beqz       a4, 17f
17:               sub          a2, s9, t1
                  xori         t6, a5, -1808
                  c.addi16sp   sp, 336
                  slti         s1, s11, 255
                  mulhu        s6, sp, t0
                  c.addi4spn   a4, sp, 624
                  c.lui        t5, 7
                  rem          a1, s8, s4
25:               sll          gp, a3, s4
                  sll          s8, s6, tp
                  mulh         a6, t3, t1
                  c.andi       a1, -1
                  mul          s6, t4, t0
                  c.beqz       a5, 39f
                  xor          s11, s10, a5
                  c.bnez       a4, 47f
                  nop
                  c.beqz       a4, 48f
                  xori         s6, t4, 305
                  sll          s3, t6, t6
                  mulh         t3, a4, a3
                  slli         gp, s4, 18
39:               mulhu        s3, gp, a7
                  mulhsu       a3, s11, a1
                  xori         a4, a5, -1120
                  remu         s10, s10, s6
                  beq          s11, s6, 53f
                  slli         t0, a0, 10
                  add          s4, s4, ra
                  slli         t0, s11, 12
47:               c.addi       s7, -1
48:               auipc        t6, 1014283
                  sltu         ra, s10, a6
                  div          t0, gp, a3
                  mul          s3, s8, a4
                  c.lui        t3, 19
53:               c.srai       a5, 11
                  addi         t6, t2, -1724
                  mulhu        sp, tp, t1
                  andi         sp, s4, 480
                  ori          t0, t4, 2011
                  c.andi       a2, -1
                  c.mv         s8, t3
                  or           t1, tp, t3
                  auipc        s1, 66237
                  blt          tp, t1, 77f
                  c.bnez       a5, 73f
                  slt          s7, t3, a4
                  remu         a3, sp, zero
                  rem          ra, gp, t3
                  bge          gp, s1, 72f
                  c.add        a2, s5
                  c.srli       a3, 8
                  c.andi       a4, -1
                  mul          s0, s3, s11
72:               xori         s10, a5, -438
73:               slli         s9, a6, 14
                  sub          a2, t5, s3
                  c.slli       a3, 11
                  c.sub        a3, s1
77:               c.sub        s0, a3
                  add          t4, a4, zero
                  c.beqz       s1, 82f
                  c.slli       s9, 18
                  c.and        a5, a5
82:               c.slli       s4, 29
                  srai         a1, a0, 2
                  sltu         s0, zero, s5
                  blt          t5, a0, 105f
                  sltu         a2, t4, t6
                  nop
                  c.xor        a5, a2
                  c.li         a5, 31
                  mul          t5, s7, s3
                  lui          a4, 931774
                  auipc        gp, 59997
                  sub          a5, a4, a3
                  c.andi       s1, -1
                  c.nop
                  or           a7, t3, s5
                  lui          zero, 362354
                  c.and        a1, a3
                  divu         s3, s5, t1
                  blt          s2, tp, 110f
                  c.srai       s1, 3
                  bgeu         t4, a2, 112f
                  bge          s11, t0, 113f
                  slt          sp, t6, t6
105:              slt          s11, s10, s1
                  ori          gp, a0, 1474
                  mul          t6, a2, t5
                  addi         a6, t1, -1271
                  slti         s6, s4, -1558
110:              remu         s7, s4, s9
                  c.xor        a1, a3
112:              add          s4, s8, a2
113:              mulhu        gp, tp, t0
                  andi         s9, zero, 1282
                  c.addi       a1, 10
                  remu         s11, s0, gp
                  c.addi4spn   a4, sp, 368
                  mul          s8, tp, s4
                  c.li         t1, -1
                  divu         a6, t2, s2
                  or           t3, s3, s7
                  lui          s4, 108572
                  bltu         s9, a3, 128f
                  blt          s9, a6, 134f
                  ori          a5, t0, 1358
                  sltu         gp, a6, tp
                  c.li         ra, 16
128:              xor          a6, t0, s11
                  mulhu        t2, s5, a0
                  srli         a4, gp, 7
                  sltu         s11, s11, zero
                  sltiu        s9, t3, 1930
                  mulh         s11, t2, t3
134:              c.srai       a4, 16
                  c.mv         t4, a1
                  xor          zero, s2, s10
                  slt          ra, tp, a4
                  div          tp, a1, t6
                  or           a2, s6, t1
                  c.srai       a4, 3
                  xor          zero, s9, a4
                  addi         s8, gp, -593
                  sra          s1, s2, a0
                  c.addi4spn   s0, sp, 224
                  c.beqz       a4, 149f
                  slli         gp, s8, 15
                  sltiu        s6, a7, -31
                  bltu         a0, zero, 149f
149:              c.andi       a2, 16
                  srli         a7, s0, 17
                  sll          s10, a7, tp
                  bne          s9, t1, 172f
                  andi         s11, t6, -1817
                  andi         t3, s7, 1079
                  beq          s1, zero, 156f
156:              slti         s0, s0, -657
                  remu         t4, s9, t3
                  add          s8, t5, gp
                  slt          s10, a7, sp
                  mulhu        t0, s1, tp
                  remu         gp, a7, t0
                  c.andi       a3, -1
                  or           s4, ra, s1
                  srl          s7, t1, s11
                  bne          gp, s7, 174f
                  mulhsu       ra, gp, s1
                  c.addi4spn   s0, sp, 848
                  mul          tp, s3, s3
                  c.xor        s1, a0
                  mulh         s4, s2, t2
                  andi         a2, a3, -100
172:              bne          t2, t5, 183f
                  mulh         gp, zero, t1
174:              slt          t1, t1, gp
                  c.bnez       a3, 177f
                  sub          tp, zero, a2
177:              c.addi       s1, -1
                  c.lui        s1, 9
                  c.srai       s1, 10
                  c.add        t6, s11
                  c.li         t4, 31
                  sltu         s4, a0, a3
183:              bgeu         sp, a6, 192f
                  bne          a0, s0, 190f
                  c.bnez       s0, 198f
                  mulh         s3, s7, tp
                  bgeu         t0, s9, 193f
                  div          sp, t6, a5
                  bne          t4, s11, 197f
190:              c.srai       s0, 29
                  bne          a3, a4, 202f
192:              add          s7, a3, s2
193:              srli         s7, s0, 28
                  mulhsu       s8, a0, s11
                  addi         a4, s1, 421
                  slli         s4, gp, 19
197:              c.slli       s10, 12
198:              srli         a1, a2, 1
                  mulh         a2, a5, s11
                  auipc        t3, 375158
                  slli         s10, s6, 10
202:              c.lui        s7, 26
                  srli         s4, s10, 13
                  bgeu         s7, gp, 218f
                  c.bnez       s0, 225f
                  c.addi4spn   a1, sp, 816
                  c.slli       t5, 13
                  sra          a5, zero, s4
                  c.and        s0, a4
                  sll          a5, t5, s10
                  c.andi       a3, 19
                  c.add        s7, a4
                  div          ra, s8, s11
                  rem          t4, s2, a0
                  nop
                  slti         a2, a4, 1415
                  sltu         s0, a6, t2
218:              nop
                  c.mv         gp, t1
                  srl          s7, t0, s2
                  beq          tp, s3, 234f
                  bltu         t5, s9, 231f
                  add          a4, t4, a7
                  c.sub        s1, s0
225:              bgeu         s6, ra, 240f
                  c.li         s6, 26
                  c.nop
                  c.addi16sp   sp, -16
                  srli         t6, ra, 12
                  c.add        tp, a5
231:              xori         s4, s1, -1896
                  slli         a5, a7, 12
                  addi         t6, s9, 1894
234:              c.lui        t1, 27
                  bne          a6, a3, 240f
                  div          t2, t4, s8
                  srli         a7, s7, 21
                  auipc        s8, 190562
                  sltu         a4, sp, t5
240:              c.lui        a3, 22
                  andi         a3, a3, 478
                  slli         s8, t3, 20
                  bltu         t0, t1, 252f
                  c.srai       a5, 20
                  c.mv         a5, s3
                  andi         s10, t5, -1509
                  c.add        a7, t5
                  bgeu         a4, t5, 249f
249:              srai         s8, s8, 5
                  mulhsu       a3, ra, t2
                  c.xor        a3, a0
252:              bgeu         sp, s1, 253f
253:              and          t0, t0, a4
                  sra          t4, s7, a7
                  c.addi4spn   a4, sp, 624
                  rem          s3, a1, a7
                  c.add        t1, t2
                  auipc        s10, 726274
                  c.and        a2, a1
                  blt          t6, s7, 271f
                  bge          ra, a2, 281f
                  sll          zero, a1, s5
                  srl          t5, t0, s9
                  sll          s6, s11, s4
                  c.addi4spn   s1, sp, 192
                  bge          t3, a6, 276f
                  mulhsu       a2, s7, a6
                  c.li         s7, 7
                  div          t5, ra, a1
                  xor          t6, t3, t5
271:              c.addi4spn   a3, sp, 736
                  lui          s8, 357941
                  mul          t4, a7, t1
                  sltiu        a1, s3, 2023
                  slt          s7, s4, s9
276:              and          s3, t6, ra
                  sltiu        s10, s9, -369
                  c.xor        a4, s0
                  or           a6, a5, a7
                  ori          a6, a3, -443
281:              c.lui        t0, 31
                  c.srai       a3, 10
                  c.li         ra, 10
                  c.add        a4, s5
                  beq          zero, t6, 295f
                  rem          gp, t2, s3
                  srli         ra, a2, 15
                  div          gp, a6, s2
                  c.bnez       s0, 299f
                  rem          s0, a4, s11
                  bgeu         s7, s7, 301f
                  c.andi       a2, -1
                  auipc        t4, 978002
                  mul          t1, a0, a5
295:              c.bnez       a4, 296f
296:              c.add        a1, t6
                  c.add        t2, a4
                  slt          t3, t2, s2
299:              and          s9, tp, t5
                  xori         a4, s9, 966
301:              c.addi16sp   sp, -16
                  andi         s11, s0, 340
                  c.slli       a1, 24
                  blt          s0, s11, 312f
                  sra          zero, t5, a0
                  slli         s0, a6, 27
                  slli         a5, sp, 26
                  mul          s6, t6, a2
                  div          t6, t2, s9
                  nop
                  mulhsu       s4, a4, t3
312:              c.nop
                  sltu         t3, t4, a7
                  bltu         t1, s8, 318f
                  remu         a5, sp, s4
                  c.beqz       a1, 327f
                  c.srai       a3, 11
318:              srli         a2, s5, 21
                  sra          sp, t6, s5
                  blt          a1, a2, 326f
                  bgeu         gp, a6, 330f
                  sltiu        s9, t5, 671
                  addi         gp, s10, 816
                  c.addi16sp   sp, -16
                  c.andi       a2, -1
326:              sub          s7, sp, s6
327:              c.sub        a5, a4
                  c.addi16sp   sp, -16
                  c.xor        a2, a1
330:              nop
                  sra          s4, s9, s8
                  bge          s3, a0, 342f
                  c.and        a1, a2
                  c.addi       a4, -1
                  srli         tp, t0, 31
                  srl          a4, s1, a1
                  sra          s0, s7, sp
                  mul          t5, a0, a1
                  div          s0, a5, s11
                  beq          zero, tp, 342f
                  slli         s6, a3, 8
342:              slt          a1, tp, zero
                  c.addi16sp   sp, 416
                  c.and        a2, a0
                  c.addi       s7, -1
                  mulhu        s11, t4, s7
                  slti         s7, a1, 1942
                  c.addi4spn   a5, sp, 736
                  sltiu        gp, sp, 1452
                  ori          t0, s7, -23
                  and          s0, ra, s9
                  c.addi       s9, -1
                  bge          a0, s0, 354f
354:              sra          s10, a7, a0
                  c.addi16sp   sp, -16
                  c.nop
                  c.li         t6, -1
                  sub          s6, s3, s7
                  c.li         a2, -1
                  remu         s6, s8, s4
                  mulhsu       a2, zero, s4
                  lui          a5, 493820
                  c.beqz       a4, 373f
                  c.slli       tp, 12
                  div          t2, t5, s8
                  slli         s1, s4, 27
                  slli         s3, t5, 16
                  c.mv         s7, s11
                  srai         s4, s8, 29
                  sll          zero, t0, gp
                  or           s11, a5, s9
                  divu         a2, a2, ra
373:              bge          a7, a4, 379f
                  blt          a7, gp, 377f
                  bne          sp, a7, 385f
                  srl          sp, s7, ra
377:              xori         s3, t6, -1777
                  remu         gp, a3, s11
379:              c.addi       t5, -1
                  auipc        t2, 106499
                  c.slli       a7, 31
                  c.srli       a4, 22
                  xor          sp, sp, s11
                  c.slli       a1, 9
385:              mulh         t5, sp, s2
                  auipc        t3, 235671
                  addi         t0, s9, 1355
                  srli         s0, a2, 24
                  srl          ra, s9, s5
                  c.add        a2, s10
                  c.or         a2, s1
                  xor          s7, t5, sp
                  c.addi16sp   sp, -16
                  remu         a3, t6, t4
                  c.or         s1, a2
                  c.addi4spn   s1, sp, 80
                  or           a2, t3, a3
                  mulhu        a1, s4, s9
                  beq          t3, zero, 414f
                  xor          a5, s7, a5
                  mulhsu       s0, ra, s5
                  bltu         s11, a5, 407f
                  sub          s9, t5, t6
                  c.sub        s0, s1
                  c.mv         a6, sp
                  bgeu         a5, t1, 417f
407:              addi         a7, sp, 1521
                  c.xor        s1, a1
                  c.add        a5, s9
                  c.sub        s0, a3
                  srli         t5, s1, 7
                  mulh         s0, s11, a0
                  slli         t2, a5, 13
414:              xori         a1, t5, -1829
                  c.addi       s10, -1
                  c.add        sp, a7
417:              c.andi       a5, 10
                  div          t5, s9, s1
                  add          s10, a6, s5
                  mulhsu       t3, a5, s5
                  divu         t2, s9, s5
                  c.addi16sp   sp, -16
                  slti         t6, a3, 1872
                  mulh         ra, zero, t5
                  and          s0, s10, s9
                  c.beqz       a3, 439f
                  bge          ra, t6, 437f
                  mulhsu       s4, s7, s1
                  xori         t3, a5, 1284
                  bne          s10, a4, 438f
                  lui          s9, 99571
                  c.addi4spn   a2, sp, 704
                  auipc        t5, 386773
                  c.add        sp, s4
                  c.lui        t2, 17
                  c.addi16sp   sp, 112
437:              sltiu        t6, s7, 779
438:              c.sub        a2, a1
439:              nop
                  c.add        a4, a6
                  c.sub        a2, a2
                  andi         s9, s7, 1715
                  mul          s9, gp, t0
                  srl          t0, s8, s5
                  srai         s10, s10, 4
                  c.xor        a5, a0
                  divu         t2, s8, s11
                  bltu         s4, t3, 449f
449:              ori          a7, t2, -716
                  addi         a2, t2, -1760
                  c.addi4spn   a4, sp, 96
                  srai         a7, sp, 21
                  blt          s11, s2, 473f
                  c.slli       s0, 22
                  srli         ra, s0, 5
                  c.or         a2, a4
                  xori         s0, s6, 315
                  and          s7, t6, t5
                  slt          a6, zero, t4
                  c.andi       a1, 17
                  srai         a2, a4, 23
                  remu         t0, s7, s7
                  c.add        s8, t0
                  or           s4, zero, a1
                  c.srli       a1, 8
                  c.and        a1, a4
                  c.addi       tp, -1
                  c.add        s8, s3
                  mulhu        sp, a6, a7
                  c.srli       a2, 10
                  mul          ra, a0, tp
                  remu         t4, a5, a6
473:              c.lui        ra, 19
                  mulhsu       t6, t2, s1
                  div          a3, s2, s5
                  remu         a3, s4, s4
                  srli         a4, t4, 3
                  c.or         a2, a2
                  rem          s10, t5, zero
                  c.srai       a4, 16
                  or           t2, zero, a5
                  lui          s0, 468670
                  c.and        s0, a1
                  srli         t4, s2, 25
                  and          a4, a5, s7
                  andi         zero, t0, 1013
                  c.addi       ra, 23
                  c.add        a2, ra
                  bltu         s4, s6, 498f
                  bge          s9, s10, 495f
                  divu         s0, t4, sp
                  add          ra, a0, s6
                  xori         ra, s4, -1041
                  addi         gp, a2, -1083
495:              c.sub        a2, a3
                  xor          gp, t6, tp
                  c.lui        a2, 1
498:              c.and        a2, a4
                  sll          tp, t1, tp
                  c.lui        s6, 2
                  c.sub        a5, s0
                  mulhsu       t4, s5, tp
                  c.srli       a2, 10
                  c.andi       a3, 16
                  divu         a6, a1, t5
                  c.andi       a1, -1
                  c.and        s1, a1
                  c.addi4spn   s0, sp, 368
                  or           a5, tp, s8
                  xor          s7, t3, s1
                  c.lui        s10, 20
                  c.or         a4, a3
                  c.andi       a5, -1
                  bltu         zero, t1, 523f
                  add          a4, t6, s10
                  sll          ra, t0, a4
                  divu         s11, t2, s3
                  nop
                  sra          t4, t2, s6
                  slli         t6, t1, 20
                  mul          s8, gp, a0
                  remu         s0, t2, gp
523:              rem          a4, t2, s4
                  mul          t4, t0, t6
                  c.nop
                  c.xor        a3, s0
                  xor          a7, s6, ra
                  rem          t3, sp, gp
                  c.srai       a2, 21
                  c.addi4spn   a5, sp, 32
                  bge          gp, s0, 532f
532:              c.li         gp, 22
                  c.and        a5, s1
                  xor          gp, a6, sp
                  c.sub        a5, a0
                  add          a3, a6, zero
                  c.addi       tp, 16
                  add          s7, a5, s3
                  bne          t0, s4, 548f
                  mul          s1, s0, s9
                  srl          s3, s11, s2
                  srl          tp, s9, gp
                  slti         a2, s10, 1602
                  c.xor        a2, a4
                  xori         t1, s6, -1100
                  mulhu        s9, s9, s5
                  mulhu        s1, s4, s7
548:              c.bnez       a2, 563f
                  sra          s10, t4, tp
                  nop
                  div          ra, s2, t2
                  or           s7, s9, s5
                  sll          s7, s4, s9
                  mulhsu       t1, sp, t3
                  sltiu        t0, t6, -1250
                  c.addi       a5, 3
                  lui          s6, 659678
                  srl          a1, t6, a0
                  c.addi4spn   s1, sp, 592
                  c.addi16sp   sp, -16
                  c.nop
                  or           s11, a2, t2
563:              sub          t6, t5, t5
                  divu         s4, s2, a7
                  andi         tp, t6, 697
                  c.nop
                  srai         t4, s9, 3
                  sltiu        t4, t6, 715
                  or           tp, t3, a0
                  c.bnez       a2, 574f
                  c.nop
                  sub          t0, t6, t3
                  c.bnez       a3, 584f
574:              sub          ra, a0, sp
                  xori         t0, s9, 1999
                  c.or         a4, a4
                  c.and        s1, a0
                  sra          a6, ra, s3
                  slt          zero, t0, a2
                  bne          a4, s1, 581f
581:              srl          a3, a1, t0
                  sra          a7, s4, s0
                  andi         t2, t1, 158
584:              nop
                  c.addi16sp   sp, 320
                  rem          gp, s1, ra
                  mul          s4, t6, s5
                  sltiu        t0, a2, -1438
                  sltiu        s4, t0, 1710
                  c.addi16sp   sp, 160
                  sltu         zero, t0, s9
                  c.addi       t3, -1
                  div          t6, t0, a5
                  div          t0, s10, s4
                  c.add        s8, s3
                  sltiu        tp, s3, 870
                  c.and        a3, a4
                  srl          s7, a2, sp
                  bne          s1, gp, 609f
                  c.srai       a3, 11
                  andi         sp, t1, -1104
                  srl          s11, t4, a4
                  sub          s1, s5, a0
                  c.andi       a3, 8
                  and          a2, t5, a0
                  c.add        s7, t1
                  c.andi       a4, -1
                  blt          a1, s4, 618f
609:              bne          s3, a1, 612f
                  sltu         a3, t1, s10
                  bltu         zero, tp, 621f
612:              sltiu        t1, s3, 299
                  c.li         a5, -1
                  c.srai       s1, 19
                  divu         tp, t3, t4
                  ori          gp, s3, -1450
                  remu         s3, t5, s3
618:              srl          s10, s4, t0
                  remu         t4, s3, ra
                  c.and        s1, s0
621:              sltu         ra, a3, a6
                  c.beqz       a3, 624f
                  srl          a2, t6, a3
624:              remu         s10, s9, t4
                  c.xor        a4, s0
                  sra          a7, a1, s10
                  sltu         s1, s8, t3
                  mulhsu       s11, zero, t2
                  blt          s10, t4, 649f
                  xori         s10, t2, -1527
                  c.srai       a2, 2
                  mul          t4, s5, t3
                  mulh         t6, s7, s1
                  mulh         t5, s2, t2
                  slli         ra, t5, 5
                  sll          zero, a2, s0
                  c.addi4spn   a5, sp, 64
                  c.andi       a2, 31
                  slt          gp, s6, s2
                  c.bnez       s0, 646f
                  add          ra, t2, s8
                  c.or         a3, s1
                  c.andi       a5, -1
                  c.bnez       s0, 654f
                  add          t4, tp, t0
646:              slti         s6, s2, 868
                  beq          s4, s3, 662f
                  slt          ra, a4, a1
649:              c.beqz       a1, 663f
                  slti         s1, tp, 880
                  mulhu        s1, a2, s4
                  c.add        s9, ra
                  or           sp, s4, s3
654:              c.andi       a1, -1
                  nop
                  sub          s3, s11, s1
                  add          a5, s1, a4
                  mulhsu       t1, zero, ra
                  c.sub        s0, s0
                  c.or         s1, s0
                  sltiu        ra, a6, -295
662:              c.or         a3, a2
663:              slti         a6, t4, 1263
                  c.beqz       s1, 674f
                  slli         a1, t0, 24
                  mulhu        a7, s10, t0
                  bgeu         a2, t0, 673f
                  mulhsu       s7, t3, ra
                  addi         t3, t0, -1358
                  c.lui        a3, 11
                  c.bnez       a1, 681f
                  c.xor        a5, a4
673:              mulhsu       t5, s8, t5
674:              mulhu        tp, s0, a5
                  divu         s7, t6, a5
                  or           t0, s1, sp
                  c.srli       s0, 12
                  c.nop
                  c.xor        a4, a4
                  sll          a1, t4, t0
681:              lui          t1, 409715
                  c.addi4spn   a4, sp, 672
                  c.lui        s7, 27
                  c.or         a2, a2
                  sub          gp, s10, a5
                  c.bnez       s0, 687f
687:              sll          s9, s3, s8
                  or           s9, s3, ra
                  c.srai       a4, 11
                  divu         t1, t1, t4
                  c.andi       s1, 19
                  c.nop
                  c.bnez       a1, 698f
                  c.addi4spn   a3, sp, 208
                  c.li         s9, 22
                  xori         a7, s1, 1076
                  c.beqz       a4, 703f
698:              nop
                  auipc        s8, 816074
                  xori         s3, sp, 202
                  sub          t1, t3, zero
                  rem          t0, s7, t4
703:              ori          t3, a1, 1152
                  c.li         a6, 5
                  c.lui        s4, 28
                  mulhu        a1, a6, t0
                  sll          t1, a1, gp
                  mulhu        s0, s11, zero
                  c.xor        a2, a1
                  mulhsu       t1, s7, t0
                  lui          gp, 899890
                  ori          s3, s7, -740
                  xor          zero, t6, a3
                  beq          a7, s5, 724f
                  slli         a7, a4, 19
                  slli         t4, a2, 26
                  sub          a7, s1, tp
                  srli         a5, ra, 8
                  c.nop
                  xor          s9, a3, s11
                  bge          s8, s11, 726f
                  addi         t2, t3, 1877
                  div          t3, a0, a3
724:              and          t0, t1, gp
                  add          a1, t0, t1
726:              auipc        ra, 138203
                  c.beqz       a2, 728f
728:              or           t2, t6, a5
                  c.addi16sp   sp, 16
                  c.lui        tp, 17
                  div          t6, s0, ra
                  c.or         a4, a5
                  sltu         t4, t3, a5
                  sltu         t0, a0, s8
                  c.add        a7, sp
                  divu         s9, t2, t2
                  andi         s9, a1, 1699
                  c.addi       a4, -1
                  and          t6, a0, s10
                  bge          tp, tp, 744f
                  xori         s8, a6, -1735
                  andi         t2, ra, -1809
                  srl          t4, t2, t0
744:              bge          a1, s5, 758f
                  sltiu        t6, t6, -1585
                  c.add        s7, a3
                  c.lui        t6, 2
                  bge          s1, s8, 758f
                  mul          a4, s1, a1
                  andi         ra, s2, -919
                  c.slli       s1, 29
                  andi         zero, zero, -631
                  divu         s6, a3, s3
                  bne          s4, s5, 774f
                  slli         a5, a0, 17
                  blt          s10, s1, 766f
                  c.addi16sp   sp, -16
758:              beq          s11, a1, 768f
                  xori         s9, s6, -4
                  mulhsu       ra, s5, a5
                  xori         gp, s5, -76
                  c.mv         t3, a5
                  srai         t2, s9, 14
                  sltiu        a5, a7, 692
                  c.lui        a4, 18
766:              c.li         t6, -1
                  mulh         s9, s5, a3
768:              div          t6, zero, t2
                  mul          t6, s3, s9
                  c.bnez       s1, 780f
                  srli         s4, s3, 24
                  c.addi16sp   sp, -16
                  nop
774:              xor          s7, t3, t4
                  auipc        a1, 803844
                  xori         t1, s11, 747
                  c.nop
                  mul          s8, a0, s0
                  nop
780:              auipc        a1, 7287
                  c.beqz       a1, 796f
                  rem          s4, a6, s1
                  c.sub        s1, a2
                  c.addi4spn   a5, sp, 544
                  beq          gp, s9, 795f
                  srli         s4, t2, 6
                  auipc        ra, 703153
                  c.add        t6, s6
                  bgeu         a0, s4, 797f
                  c.or         a3, a3
                  mulh         s10, s4, zero
                  sub          t5, a6, t0
                  c.mv         a3, a4
                  c.li         t4, -1
795:              c.mv         ra, sp
796:              or           s1, t4, a7
797:              sub          a2, t5, s0
                  c.nop
                  c.addi16sp   sp, 48
                  mulhu        a2, a2, s6
                  sll          zero, s10, ra
                  blt          a7, t1, 804f
                  lui          t4, 966329
804:              sltu         a5, s6, a2
                  sltiu        s9, t0, 903
                  c.srli       a4, 2
                  bge          s6, t3, 817f
                  addi         t0, a1, -1887
                  c.or         a3, s0
                  mul          tp, s8, t3
                  bltu         s5, a7, 820f
                  auipc        t6, 903897
                  c.slli       a4, 22
                  c.lui        a3, 17
                  c.andi       a1, -1
                  c.andi       s0, -1
817:              add          s10, t0, a2
                  addi         s10, tp, -1869
                  c.nop
820:              c.addi       a7, -1
                  srai         t6, s2, 9
                  lui          a7, 513867
                  or           s1, s10, t1
                  la           a7, amo_0+32 #start riscv_amo_instr_stream_1
                  la           tp, amo_0+28
                  la           a2, amo_0+8
                  la           s8, amo_0+32
                  sub          s6, a1, t1
                  c.slli       s9, 26
                  amomax.w.rl   t5, t4, (a7)
                  divu         a6, a5, s5
                  slt          s1, a4, a4
                  amominu.w.rl  t6, gp, (a7)
                  amomin.w.aq   s7, s4, (a2)
                  mul          s9, s7, s10
                  amoadd.w      s9, ra, (s8)
                  amoor.w.aq    t1, s6, (s8)
                  amoswap.w.rl  s11, s0, (s8)
                  amoand.w.rl   a6, s10, (a7)
                  amomin.w      zero, a0, (a2)
                  amoor.w.aq    t1, s6, (a7)
                  amoadd.w.rl   s0, zero, (a2) #end riscv_amo_instr_stream_1
                  c.srai       a4, 8
                  xori         s3, a5, 1968
                  div          a2, s11, tp
                  auipc        a6, 529156
                  mulh         s8, t1, ra
                  mulhsu       gp, s11, s1
                  c.addi       t3, -1
                  slti         t2, s7, -772
                  bgeu         zero, s4, 837f
                  mulhsu       s6, ra, tp
                  xori         t6, s2, 1197
                  rem          s1, t4, t2
                  bne          t5, t4, 849f
837:              slli         t3, s11, 12
                  auipc        zero, 826665
                  remu         t1, s4, sp
                  srai         s6, s4, 21
                  c.slli       s9, 21
                  rem          tp, a5, sp
                  sll          a7, s8, a2
                  c.li         t1, -1
                  divu         a6, a6, t2
                  mulhsu       t5, s11, s4
                  c.and        a5, a2
                  blt          a3, t5, 863f
849:              c.nop
                  sltu         s7, s10, a6
                  and          s10, t4, s10
                  bne          s8, t4, 853f
853:              c.beqz       s1, 864f
                  and          a6, ra, t1
                  remu         s11, s0, t1
                  c.andi       s0, 18
                  c.lui        t0, 11
                  remu         zero, s9, a6
                  mul          a4, a4, a1
                  c.lui        a6, 2
                  mulh         s7, s3, ra
                  xor          s11, t6, s7
863:              c.srli       a3, 12
864:              bgeu         t5, s6, 884f
                  slti         s6, s3, 40
                  addi         a3, t0, 1025
                  rem          ra, a4, sp
                  sltu         t0, s0, s10
                  srai         tp, a6, 10
                  div          a7, sp, a5
                  c.srli       a4, 16
                  ori          s8, s9, 163
                  bltu         t1, tp, 879f
                  srl          t2, s4, s8
                  c.addi       ra, 17
                  c.mv         s3, s0
                  c.bnez       a2, 886f
                  c.xor        s0, a0
879:              sltiu        t1, s0, 814
                  c.lui        a2, 22
                  div          s9, a2, a7
                  bne          t0, t2, 883f
883:              srli         t5, t5, 16
884:              divu         s7, s7, sp
                  c.mv         s7, t0
886:              add          s9, t2, a4
                  beq          s6, t1, 896f
                  c.or         s1, a2
                  c.sub        s1, a1
                  c.lui        s0, 17
                  c.addi4spn   a1, sp, 16
                  slti         sp, a4, -1795
                  mulhsu       s10, a1, s5
                  lui          zero, 980176
                  blt          s5, a6, 896f
896:              c.or         a1, a1
                  bgeu         t4, t0, 908f
                  and          zero, t2, s4
                  xor          t0, s3, a7
                  sltu         a7, t6, a2
                  srai         gp, s11, 8
                  mulh         s9, zero, t5
                  remu         a5, a3, a4
                  c.nop
                  srl          a4, gp, s11
                  c.srli       a5, 25
                  c.andi       a2, 16
908:              remu         t0, tp, gp
                  ori          s0, tp, -1904
                  sra          t2, a7, s4
                  c.nop
                  slli         s6, a3, 1
                  remu         a2, t6, a6
                  auipc        sp, 942089
                  srai         s0, a6, 2
                  sll          a5, tp, s9
                  sll          s4, s7, gp
                  rem          tp, s7, s5
                  sra          ra, t3, s10
                  div          gp, t0, s10
                  mulh         a1, s10, t5
                  c.srli       a1, 15
                  c.andi       a5, -1
                  c.addi16sp   sp, 432
                  addi         a1, s4, 1141
                  sltu         tp, gp, s9
                  srli         t3, s6, 6
                  ori          t3, s6, -1664
                  c.and        a1, a1
                  c.bnez       a5, 933f
                  c.addi       gp, -1
                  c.addi16sp   sp, 144
933:              c.nop
                  add          s4, a3, a5
                  rem          gp, gp, a1
                  sra          s11, s6, t6
                  srl          t6, a0, t5
                  c.srai       s0, 18
                  divu         t5, a0, t1
                  c.li         sp, -1
                  xor          a6, zero, a1
                  mul          s9, a6, a5
                  bltu         t0, s4, 958f
                  remu         t0, sp, gp
                  mulhu        t3, s10, a6
                  c.or         a1, s1
                  bge          a4, a2, 962f
                  bge          t0, zero, 968f
                  c.beqz       a2, 969f
                  bgeu         s4, t0, 959f
                  remu         t4, a5, ra
                  sltu         s8, gp, s2
                  c.srai       s1, 13
                  div          a2, s6, s4
                  mul          s1, t5, s7
                  bltu         zero, s5, 969f
                  c.slli       gp, 12
958:              slli         s4, s8, 10
959:              c.mv         s3, a1
                  c.beqz       s1, 968f
                  c.add        s0, s9
962:              sra          t3, sp, t2
                  mulh         s9, t1, tp
                  c.sub        a3, a4
                  or           a7, t4, a3
                  c.slli       t2, 3
                  bne          sp, a5, 976f
968:              blt          ra, s11, 974f
969:              xori         t6, s1, 720
                  slti         t2, a7, 1195
                  c.add        t0, a2
                  mulhsu       s11, t0, s8
                  srai         s7, t1, 7
974:              remu         s4, t1, s6
                  c.mv         t6, t1
976:              ori          t0, s0, 966
                  c.addi16sp   sp, -16
                  srli         ra, t5, 2
                  srli         a2, a3, 6
                  add          t2, s3, tp
                  c.li         s11, 28
                  mulhsu       ra, s7, a2
                  srl          s7, a0, s3
                  bge          s6, s9, 998f
                  div          tp, t0, s11
                  c.addi16sp   sp, -16
                  lui          t3, 786417
                  sltu         sp, t2, t3
                  c.srai       s0, 8
                  bge          s3, a0, 1000f
                  srl          t3, t3, a7
                  mulhu        t0, a3, gp
                  c.addi16sp   sp, -16
                  srl          s0, s8, t2
                  div          s8, t4, s10
                  bltu         s2, sp, 1001f
                  sll          a5, s8, a6
998:              c.srai       a1, 20
                  c.addi       a4, -1
1000:             auipc        t6, 63775
1001:             srai         gp, gp, 3
                  c.and        a4, s1
                  slti         s3, zero, -1003
                  or           gp, a1, t4
                  remu         t4, s3, t2
                  c.slli       t5, 23
                  c.sub        a2, s0
                  mulhsu       s10, a1, t3
                  rem          gp, sp, t4
                  add          a4, t6, a3
                  or           a2, a6, t4
                  c.slli       s9, 1
                  beq          zero, a2, 1016f
                  lui          a2, 662301
                  mulh         s3, s0, a6
1016:             ori          a6, s10, -1713
                  sub          s11, a5, s5
                  add          t3, s4, a5
                  mulhsu       s9, a3, s6
                  c.li         a3, 8
                  add          t1, s1, s1
                  lui          s3, 1032105
                  div          s1, a5, t4
                  c.li         s11, 4
                  c.addi4spn   a5, sp, 176
                  divu         s1, a1, s1
                  c.srli       a1, 12
                  slti         t5, t4, -970
                  and          s1, t0, s7
                  lui          a6, 635947
                  bltu         t3, t6, 1041f
                  slt          s6, a5, ra
                  mulhsu       s6, t0, s7
                  blt          s9, t5, 1043f
                  auipc        zero, 573636
                  sltu         t3, s1, t4
                  c.bnez       a3, 1041f
                  nop
                  sra          a6, t3, t2
                  c.li         gp, -1
1041:             bltu         gp, s7, 1042f
1042:             sltiu        s10, s7, 646
1043:             c.lui        t2, 6
                  remu         t4, t1, a0
                  c.srli       s0, 1
                  andi         t2, s1, -1824
                  sltiu        s8, gp, -873
                  addi         s11, t0, 1851
                  div          tp, t6, s9
                  lui          ra, 853106
                  slli         t4, s4, 14
                  xor          ra, t2, t2
                  c.add        s8, tp
                  sll          t1, a6, t0
                  c.slli       a6, 10
                  slt          a1, s6, t6
                  beq          s7, s7, 1067f
                  c.addi       a5, -1
                  c.li         a3, 5
                  c.andi       s0, -1
                  mul          tp, s6, t0
                  bne          s5, s9, 1063f
1063:             c.addi16sp   sp, 496
                  auipc        s11, 117775
                  divu         s4, gp, zero
                  c.sub        a1, a4
1067:             mulh         a2, a3, s5
                  c.slli       tp, 26
                  add          t6, a4, s5
                  remu         t1, a1, ra
                  andi         a7, s7, -1962
                  sltiu        sp, t4, 2007
                  c.andi       a3, 10
                  addi         s7, t5, -1969
                  rem          s3, a5, a0
                  c.li         s4, 29
                  sltiu        a5, t5, -1694
                  c.andi       a2, -1
                  add          s9, zero, ra
                  srl          ra, s9, s7
                  c.addi       t1, -1
                  slli         a2, t1, 2
                  slti         s8, s6, 1552
                  slti         t0, s10, 74
                  c.srai       a4, 21
                  sll          s9, a3, s1
                  c.xor        a4, a0
                  auipc        s11, 913222
                  slli         s1, a7, 9
                  sll          a4, s10, s0
                  sll          a3, t2, t3
                  srai         t5, s9, 4
                  remu         a1, zero, a7
                  c.or         s0, a3
                  div          s1, gp, t5
                  ori          a2, t1, -1296
                  c.nop
                  bgeu         t3, gp, 1108f
                  c.add        t2, a5
                  remu         s9, t2, t2
                  c.addi4spn   a3, sp, 624
                  or           t6, s10, t6
                  c.addi4spn   a2, sp, 432
                  c.slli       a6, 6
                  xor          t6, a0, s7
                  bge          s3, a0, 1117f
                  c.andi       s1, -1
1108:             sll          s8, a5, s9
                  c.beqz       a1, 1110f
1110:             c.andi       a1, -1
                  beq          s7, s1, 1112f
1112:             srl          s8, t6, s11
                  c.mv         s9, s0
                  addi         s11, a7, -896
                  mulh         t4, t6, a3
                  srai         a5, s3, 28
1117:             bgeu         s11, t3, 1127f
                  mulhu        a6, s3, t6
                  mulhsu       s3, s1, t1
                  andi         a5, t3, 1962
                  sra          t6, zero, s5
                  nop
                  mulhu        a6, gp, a6
                  rem          a4, t4, s0
                  srli         a2, a0, 3
                  c.and        a2, s1
1127:             sra          a5, t5, ra
                  slt          a2, t2, s0
                  bge          t2, t4, 1134f
                  mulh         t2, tp, a7
                  sltu         s3, s2, s1
                  div          a5, tp, s3
                  bltu         s11, s6, 1139f
1134:             sltu         a1, s2, s8
                  srl          s3, a4, tp
                  c.srai       a5, 3
                  div          gp, a4, t6
                  rem          t4, sp, t6
1139:             div          t0, sp, t1
                  c.lui        t5, 23
                  bne          s5, ra, 1151f
                  sub          a3, sp, t5
                  c.mv         s9, s4
                  bltu         a4, s1, 1146f
                  srli         tp, s11, 10
1146:             c.andi       s0, -1
                  add          s11, s2, s11
                  lui          s9, 628981
                  slli         t1, t2, 15
                  divu         a5, s4, a0
1151:             xor          s3, sp, a5
                  c.addi4spn   s1, sp, 736
                  c.andi       a1, 26
                  la           a5, region_0+129 #start load_store_instr_stream_0
                  la           s7, region_0+918 #start load_store_instr_stream_1
                  sh           sp, 1241(a5)
                  lb           gp, 186(s7)
                  sb           a7, 1461(a5)
                  sb           s10, -252(s7)
                  lb           zero, 121(s7)
                  sb           t2, 1817(a5)
                  lh           t2, 1243(a5)
                  lh           tp, 104(s7)
                  lbu          s4, 1058(a5)
                  lbu          t6, 225(s7)
                  sb           s11, -51(s7) #end load_store_instr_stream_1
                  sb           a0, 24(a5) #end load_store_instr_stream_0
                  slli         a7, s8, 23
                  mulhsu       s0, t3, zero
                  beq          s10, a0, 1166f
                  slli         s8, a6, 23
                  srli         s10, s9, 31
                  blt          s10, s6, 1170f
                  xori         a5, a1, -969
                  c.and        s1, a1
                  c.add        tp, s8
                  bne          t6, a7, 1165f
                  and          s6, s1, a7
1165:             c.addi       t1, -1
1166:             mulhu        s8, s3, t3
                  c.beqz       a4, 1177f
                  c.mv         s8, a2
                  srl          zero, t1, s11
1170:             c.lui        s11, 21
                  sltiu        s0, s11, 644
                  sltu         s10, ra, t3
                  c.sub        a1, a2
                  c.sub        s0, s0
                  bge          sp, sp, 1181f
                  lui          a2, 442204
1177:             srl          s0, t2, t6
                  mul          s1, a7, s8
                  sra          t5, t1, s0
                  mul          s1, t2, sp
1181:             ori          a7, t2, -416
                  c.bnez       a2, 1186f
                  srai         s6, gp, 1
                  c.addi       tp, 27
                  c.nop
1186:             remu         s1, a6, s10
                  c.sub        a4, a2
                  bge          s5, s10, 1197f
                  sll          s8, s6, zero
                  and          s6, s1, a3
                  sltiu        s1, t3, 1049
                  mul          a4, s11, a6
                  slti         a3, t2, 1457
                  sll          t3, s6, s1
                  lui          s6, 287863
                  divu         sp, a6, a2
1197:             c.li         s0, 19
                  c.and        a5, a4
                  c.and        a3, a1
                  c.li         s0, 8
                  addi         a4, s5, 643
                  mul          gp, t5, a0
                  beq          s9, a7, 1223f
                  c.sub        a1, a3
                  c.and        a2, a2
                  c.srai       s1, 13
                  blt          t1, gp, 1217f
                  c.addi16sp   sp, -16
                  slti         a7, sp, -2018
                  ori          a1, s7, -247
                  ori          t0, a0, 191
                  sub          gp, s2, s4
                  c.srli       a3, 30
                  c.addi       s6, 27
                  xor          s0, t5, s10
                  auipc        s9, 344502
1217:             srai         s0, t1, 25
                  xor          a2, t0, s3
                  bgeu         sp, s10, 1224f
                  c.li         a2, -1
                  sra          t0, a3, s1
                  remu         gp, a0, s8
1223:             and          s9, t2, s10
1224:             bgeu         t4, a3, 1233f
                  c.or         a2, a1
                  auipc        a4, 228457
                  mulhsu       s6, a6, sp
                  div          t5, a4, a2
                  bge          a2, t1, 1239f
                  c.li         s1, -1
                  ori          s6, s3, 404
                  sub          s10, t5, ra
1233:             divu         s6, s8, s1
                  c.andi       a5, -1
                  c.and        a2, a3
                  andi         tp, t2, 346
                  sra          gp, s2, t2
                  c.xor        a5, a2
1239:             or           a1, s1, sp
                  ori          s1, s11, 1726
                  lui          s10, 589453
                  srl          a3, s0, tp
                  sub          s6, a5, s1
                  mulhsu       t6, s0, s10
                  rem          s9, s1, s0
                  andi         t2, a7, 560
                  div          t6, t5, a2
                  c.addi16sp   sp, -16
                  add          a2, t4, a0
                  c.srai       a1, 16
                  remu         a7, tp, a7
                  nop
                  srli         t4, a2, 27
                  mulhu        a6, a0, a7
                  mulhu        a3, s6, s0
                  slli         a4, s10, 19
                  bltu         t0, gp, 1270f
                  c.srai       s0, 16
                  c.nop
                  c.addi       t2, -1
                  c.beqz       a3, 1269f
                  xori         s0, a4, 657
                  sra          s4, ra, a5
                  addi         a5, s0, 2034
                  c.xor        a1, a3
                  xor          s8, s0, s5
                  sub          a2, a2, a0
                  and          s8, t3, s0
1269:             div          s9, s4, t1
1270:             div          a6, s2, a7
                  c.addi4spn   a1, sp, 560
                  sub          t3, zero, t2
                  sub          t6, t5, s6
                  slt          s9, s6, ra
                  xor          s6, a7, s1
                  srl          s6, a1, s0
                  c.srli       s0, 4
                  c.beqz       a1, 1279f
1279:             slti         a3, a2, -1361
                  slti         t6, zero, -1602
                  sra          sp, sp, s10
                  slli         a6, sp, 12
                  xor          zero, s9, tp
                  bgeu         t6, s11, 1294f
                  and          s6, s2, s4
                  rem          tp, a7, a7
                  mulhu        a4, t0, tp
                  add          t5, t3, s10
                  c.and        s1, a3
                  ori          a7, t2, -95
                  c.bnez       a1, 1302f
                  c.and        a3, a3
                  c.addi16sp   sp, 64
1294:             c.li         s11, 3
                  c.slli       t0, 4
                  srai         a2, s11, 19
                  srai         a7, a0, 22
                  c.mv         sp, s10
                  c.li         t1, -1
                  c.and        a3, a2
                  c.andi       s0, -1
1302:             addi         s11, a1, 642
                  and          a6, t1, a6
                  andi         t6, a5, 1274
                  remu         s10, a3, a2
                  c.nop
                  c.addi16sp   sp, 336
                  sltiu        ra, s3, 810
                  divu         s10, s10, s4
                  c.nop
                  srli         a1, s7, 4
                  beq          s5, s8, 1332f
                  sltiu        s0, sp, 474
                  c.nop
                  bltu         t4, zero, 1324f
                  bne          a0, a4, 1322f
                  srai         tp, t0, 24
                  c.sub        s1, a2
                  rem          a2, s0, t2
                  rem          a3, t3, t5
                  bgeu         a0, a6, 1331f
1322:             mulh         t0, s9, a3
                  div          s1, s3, s9
1324:             c.addi16sp   sp, -16
                  beq          ra, s10, 1339f
                  andi         t0, t1, 2009
                  srai         tp, a0, 27
                  srli         t3, s11, 9
                  slti         s4, s9, -80
                  srai         tp, t3, 29
1331:             ori          s7, t6, -2046
1332:             c.addi16sp   sp, -16
                  c.srai       s1, 28
                  addi         t2, s5, 1304
                  divu         sp, t3, s4
                  addi         a2, a4, -1453
                  srai         t3, tp, 20
                  c.addi16sp   sp, -16
1339:             andi         s6, a5, 285
                  lui          s1, 729631
                  and          s9, s6, t1
                  beq          tp, a1, 1343f
1343:             c.mv         tp, s9
                  srl          a7, t1, t1
                  mulhsu       s10, s1, ra
                  c.or         s0, s0
                  c.li         tp, 12
                  c.add        t5, s7
                  sltiu        s6, s2, 1522
                  c.add        ra, s3
                  sub          a2, s8, ra
                  srl          s3, a6, ra
                  add          a6, s7, t1
                  c.and        a4, a1
                  sltu         s3, a2, s2
                  and          s10, ra, t2
                  sra          s8, a2, a5
                  or           ra, gp, s5
                  xori         s0, s11, 78
                  slt          t3, a2, s4
                  c.add        t1, tp
                  xori         s4, sp, -1840
                  sll          t0, a5, s3
                  or           a7, s11, s4
                  c.addi16sp   sp, 304
                  addi         gp, s3, 1475
                  bge          s2, s7, 1377f
                  c.li         a4, 10
                  c.addi16sp   sp, 272
                  c.slli       t6, 10
                  blt          s0, sp, 1386f
                  c.andi       a1, -1
                  sra          a2, a3, t1
                  c.slli       t3, 17
                  beq          s3, s1, 1376f
1376:             add          a3, zero, s5
1377:             c.or         a2, a5
                  auipc        sp, 501497
                  c.sub        a1, s1
                  mulhsu       ra, s6, t5
                  bgeu         s8, t6, 1392f
                  sltiu        a3, s10, -1351
                  rem          s10, s2, gp
                  ori          s4, a0, -1898
                  addi         tp, a0, -1081
1386:             mulhu        t5, t5, t0
                  srl          tp, t1, s10
                  c.or         s0, s0
                  slt          tp, t4, gp
                  sra          a5, t5, t2
                  c.sub        a4, a1
1392:             rem          s6, s5, s2
                  blt          t3, a2, 1408f
                  mulhu        s11, s8, s1
                  srli         t6, s11, 10
                  c.lui        ra, 25
                  mulhsu       a5, sp, a5
                  sll          a7, ra, s8
                  sltu         ra, a2, t2
                  bne          a2, gp, 1401f
1401:             nop
                  c.slli       t3, 12
                  auipc        s11, 584080
                  c.addi16sp   sp, 336
                  nop
                  c.sub        a3, s1
                  addi         s9, t3, 479
1408:             c.or         a1, a3
                  mulh         a1, s3, s5
                  sltiu        a5, a1, -658
                  c.sub        s1, a3
                  ori          gp, s2, -1850
                  srai         t5, t6, 31
                  rem          a2, s11, a5
                  bgeu         a1, s9, 1420f
                  rem          s9, a2, s9
                  remu         s8, s4, s10
                  mulhsu       s1, s5, s0
                  srai         tp, s0, 31
1420:             c.addi4spn   a4, sp, 416
                  divu         a2, s6, a0
                  sll          a4, t4, s6
                  c.addi16sp   sp, -16
                  c.srli       a1, 17
                  mulh         a6, a7, s6
                  lui          a3, 358157
                  auipc        a7, 290543
                  divu         s11, s11, a0
                  c.addi       a5, -1
                  slti         s4, s8, -491
                  c.srai       a2, 14
                  bne          a3, s6, 1435f
                  slt          s10, t1, s6
                  c.nop
1435:             srl          ra, s5, gp
                  c.lui        a1, 3
                  c.mv         a6, s2
                  srli         zero, a2, 10
                  srl          ra, tp, s2
                  c.or         a3, a0
                  srl          s3, t2, s7
                  srli         zero, a7, 29
                  c.nop
                  c.mv         s6, a3
                  and          sp, a2, t1
                  beq          a4, s2, 1456f
                  srl          s3, s6, t3
                  c.mv         s6, s5
                  c.andi       s1, -1
                  c.srai       a5, 13
                  srli         a4, t5, 15
                  sltu         s1, s2, s5
                  blt          a4, s0, 1456f
                  add          t3, tp, a7
                  c.nop
1456:             c.sub        a5, a2
                  c.beqz       a3, 1477f
                  c.srai       a5, 1
                  sll          s10, a4, a3
                  blt          a4, t3, 1465f
                  mulh         a4, a1, t5
                  ori          a6, a4, -2009
                  sll          sp, a7, s10
                  sltu         s6, t2, s0
1465:             andi         s8, ra, -2024
                  mulhsu       s7, sp, s0
                  sll          s1, sp, a3
                  slli         a1, s8, 5
                  c.lui        a4, 18
                  divu         a5, gp, a5
                  beq          s10, a7, 1472f
1472:             blt          a5, t4, 1485f
                  or           sp, a3, t0
                  mulhsu       a3, s9, sp
                  and          s7, s6, a2
                  srl          a5, s5, a4
1477:             mulhsu       t3, s9, a1
                  c.add        t1, a3
                  remu         s7, t5, s5
                  srai         s1, a1, 9
                  mul          a7, s7, a2
                  c.beqz       a1, 1488f
                  bne          s7, s6, 1484f
1484:             c.andi       a1, -1
1485:             sub          t5, t6, s11
                  c.mv         s4, a4
                  mulh         a3, s8, gp
1488:             srl          a7, t6, ra
                  xor          t6, t3, t4
                  c.srli       s0, 20
                  c.and        a5, a5
                  c.or         a5, a5
                  andi         a5, s0, -647
                  c.lui        t0, 20
                  c.addi4spn   a4, sp, 304
                  xor          tp, s2, s9
                  c.and        a2, a2
                  c.srai       s0, 4
                  c.srai       s1, 28
                  mulh         t3, s0, s1
                  andi         s3, t0, -1980
                  addi         s3, s10, 1943
                  blt          a4, a5, 1511f
                  c.addi       a7, 12
                  slt          s6, sp, s5
                  slli         t3, a2, 4
                  c.li         t2, -1
                  xor          s1, a0, zero
                  slti         t1, s9, 1897
                  c.srai       a1, 9
1511:             mulhu        a2, a4, a7
                  c.sub        a4, a1
                  c.li         t0, 27
                  c.addi4spn   s1, sp, 416
                  mul          s10, a7, t5
                  c.addi4spn   a1, sp, 528
                  c.bnez       s1, 1523f
                  c.mv         s3, t2
                  sll          s8, tp, a4
                  c.addi4spn   s0, sp, 576
                  c.beqz       a4, 1530f
                  rem          s3, a6, t5
1523:             slti         s7, s1, -1076
                  c.xor        s0, a5
                  mul          s11, t0, s5
                  andi         a5, s5, -1010
                  c.nop
                  or           s4, t0, s10
                  or           s3, t3, t3
1530:             sra          s4, s6, t5
                  bltu         t3, s11, 1541f
                  beq          t4, s8, 1533f
1533:             slti         s9, t3, 1894
                  blt          gp, a1, 1544f
                  bge          a3, a7, 1544f
                  c.mv         t6, s9
                  or           s3, t2, t4
                  sltu         s11, a3, s9
                  c.li         s7, -1
                  sub          s8, s3, a3
1541:             slli         a4, t6, 28
                  c.andi       a5, 31
                  c.add        a6, s9
                  la           a5, region_1+427 #start load_store_instr_stream_0
                  sb           s6, 5(a5)
                  sh           a7, 3(a5)
                  lhu          s10, 3(a5)
                  lb           sp, -10(a5)
                  lb           s1, 8(a5)
                  la           ra, region_0+1167 #start load_store_instr_stream_1
                  lb           s1, -16(a5)
                  lh           s11, 1(ra)
                  lbu          s7, 48(ra)
                  lbu          s7, 12(a5)
                  lbu          t6, -14(ra)
                  lbu          s6, 28(ra)
                  lh           s11, 21(ra)
                  sh           a6, 13(a5)
                  lb           s6, 12(ra) #end load_store_instr_stream_1
                  lbu          t2, 11(a5) #end load_store_instr_stream_0
1544:             lui          s9, 610257
                  srai         tp, t3, 0
                  lw           t3, 4(s5)
                  and          a7, s7, a6
                  addi         s5, s5, 64
                  c.sub        a2, a1
                  rem          s1, a1, zero
                  mulh         a3, t3, s3
2824:             addi x29, x28, 0
2824:             jalr x29, x29, 0
sub_4:            c.nop
                  div          t4, a0, a6
                  addi         s5, s5, -40
                  divu         ra, s5, tp
                  sw           t3, 4(s5)
                  c.srai       s1, 2
                  mulhsu       s6, s1, s10
                  c.xor        a2, s1
                  or           a4, t1, s6
                  srli         a4, a0, 5
                  c.mv         ra, s3
                  mul          a7, t6, ra
                  la           s7, amo_0+48 #start riscv_amo_instr_stream_14
                  sll          a7, gp, s10
                  amominu.w.rl  t0, s8, (s7)
                  amoxor.w      t0, s3, (s7)
                  sltiu        s9, s11, 299
                  c.srli       a4, 19
                  amoxor.w.aq   a1, t0, (s7)
                  amoor.w       sp, gp, (s7)
                  nop
                  andi         s4, tp, 835
                  divu         s6, s8, a3
                  amoor.w       t4, t6, (s7)
                  amoadd.w.aq   a4, t6, (s7) #end riscv_amo_instr_stream_14
                  la           a4, region_0+753 #start load_store_instr_stream_3
                  la           sp, region_0+599 #start load_store_instr_stream_1
                  la           s8, region_0+1913 #start load_store_instr_stream_0
                  sb           a2, -256(a4)
                  lhu          s1, -13(sp)
                  sb           s6, -16(s8)
                  la           a3, region_0+443 #start load_store_instr_stream_2
                  lbu          t0, 261(a3)
                  lb           t3, 6(s8)
                  lb           t0, -4(s8)
                  sb           s1, -202(a4)
                  lbu          tp, -10(sp)
                  lb           a2, 8(sp)
                  sb           t4, 820(a3)
                  lw           t1, 15(s8)
                  lw           s9, 1093(a3)
                  lb           s6, 210(a4)
                  sb           s0, 11(sp)
                  sb           ra, 0(s8)
                  sb           t6, 4(s8)
                  lb           tp, 1256(a3)
                  sw           s4, -221(a4)
                  sb           s9, 1031(a3)
                  lhu          a7, -15(s8)
                  lw           s4, 969(a3)
                  sb           tp, -7(s8)
                  sw           a3, 7(a4)
                  lb           a5, 68(a3)
                  sh           s8, 43(a4) #end load_store_instr_stream_3
                  sb           s1, 1292(a3)
                  sh           t0, -11(sp) #end load_store_instr_stream_1
                  sb           a6, 209(a3) #end load_store_instr_stream_2
                  lw           s11, -1(s8) #end load_store_instr_stream_0
                  la           a4, region_0+1729 #start load_store_instr_stream_1
                  la           s10, region_1+1006 #start load_store_instr_stream_0
                  sw           s1, -13(a4)
                  lb           s9, -19(s10)
                  lbu          a2, -15(s10)
                  sb           ra, 24(a4)
                  sh           t4, 52(s10)
                  sb           t5, -4(a4)
                  sh           s5, 62(s10)
                  lb           tp, 9(a4)
                  lb           a7, 19(s10)
                  lw           t4, -21(a4)
                  sb           s2, -23(a4)
                  sb           a7, 57(s10)
                  sb           s0, 10(a4)
                  lbu          s8, -61(s10)
                  sh           s6, 57(a4) #end load_store_instr_stream_1
                  sb           s0, 3(s10) #end load_store_instr_stream_0
                  la           s3, region_1+833 #start riscv_hazard_instr_stream_16
                  lhu          t2, 11(s3)
                  add          t0, t0, t0
                  sh           t2, 63(s3)
                  srl          tp, t6, t0
                  andi         t6, tp, -1344
                  srai         s4, t2, 16
                  sb           t0, 50(s3)
                  add          tp, s1, s4
                  lui          t0, 783753
                  div          t2, s1, s4
                  slli         t0, tp, 27
                  lb           s4, 2(s3)
                  c.sub        s1, s1
                  c.nop
                  sll          s1, t2, s1
                  sb           t0, -54(s3)
                  rem          t0, s1, tp
                  sra          t0, s1, tp
                  sb           s4, -18(s3)
                  divu         t2, s4, t2
                  sb           t2, -5(s3)
                  srl          t6, s1, s1
                  lbu          t6, 15(s3)
                  c.sub        s1, s1
                  andi         t0, s4, 1585
                  srli         t6, s1, 10
                  lb           t2, -30(s3)
                  lbu          t2, -54(s3)
                  c.or         s1, s1
                  lhu          t0, 23(s3)
                  lb           s4, 20(s3)
                  sh           tp, -19(s3)
                  c.or         s1, s1
                  srai         t2, t0, 9
                  sb           t0, 32(s3)
                  c.and        s1, s1
                  lbu          s4, -15(s3)
                  lb           tp, 40(s3)
                  slti         t2, t2, -1675
                  c.srai       s1, 3
                  sra          t2, t2, s1
                  sb           s1, 13(s3)
                  add          s1, t2, s4
                  lbu          tp, 1(s3)
                  c.li         s1, 10
                  sb           s1, -35(s3)
                  sb           t2, -61(s3)
                  andi         t6, s4, 654
                  srai         t0, t6, 1
                  sh           tp, -51(s3)
                  sb           t2, -62(s3)
                  mulhu        t0, s4, t2
                  lbu          s1, -29(s3) #end riscv_hazard_instr_stream_16
                  la           a1, region_1+1145 #start riscv_load_store_rand_instr_stream_13
                  lb           a5, -10(a1)
                  lw           s1, -5(a1)
                  lbu          s11, -8(a1)
                  slt          t0, s5, a2
                  c.and        a2, a3
                  lb           s6, -13(a1)
                  lb           t3, 13(a1)
                  sh           s6, 1(a1)
                  mulhsu       s3, a0, t1
                  lhu          t1, -11(a1)
                  lhu          a4, -11(a1)
                  c.addi16sp   sp, 160
                  lw           s3, -5(a1)
                  rem          a5, t6, t5
                  div          s10, s0, t2
                  sb           s4, -1(a1)
                  lbu          s8, 10(a1)
                  div          s7, s4, s8
                  lhu          ra, 11(a1)
                  c.mv         s7, sp
                  lhu          t2, 1(a1)
                  sll          a3, t1, t2
                  slt          t1, a1, s6
                  lbu          t3, 0(a1)
                  slti         zero, t3, -555
                  lb           s11, -6(a1)
                  sb           t6, -12(a1)
                  sb           s11, 10(a1)
                  c.sub        a2, a1
                  srl          t4, s1, a6
                  lh           s10, -1(a1)
                  ori          a3, a6, 1908
                  xori         zero, t0, -969
                  remu         t0, s11, ra
                  sh           sp, 1(a1)
                  sb           a0, -2(a1)
                  lb           s6, -14(a1)
                  c.slli       a7, 16
                  lb           a4, 16(a1)
                  sb           s9, 14(a1) #end riscv_load_store_rand_instr_stream_13
                  la           s11, region_0+807 #start load_store_instr_stream_0
                  la           s6, region_1+1841 #start load_store_instr_stream_1
                  lb           a1, 2(s6)
                  lw           s3, -27(s11)
                  lb           s10, 4(s6)
                  sh           a6, -27(s6)
                  lbu          s3, 62(s11)
                  lb           zero, 36(s6)
                  lb           gp, 40(s6)
                  lb           gp, -61(s11)
                  lb           a7, 41(s6)
                  lw           a4, 49(s11)
                  lb           s9, -28(s6)
                  lhu          s9, -33(s6) #end load_store_instr_stream_1
                  sb           t2, 34(s11)
                  sb           s10, 8(s11)
                  lb           s9, 36(s11) #end load_store_instr_stream_0
                  addi         s3, zero, 8 #init loop 0 counter
                  remu         a4, s10, t4
                  xori         t0, a7, -915
                  sra          zero, s8, tp
                  c.srai       s1, 12
                  sltu         t5, a3, s5
                  divu         zero, s11, a1
                  mulh         t6, s11, t1
                  nop
                  addi         s0, zero, -12 #init loop 0 limit
                  c.mv         a7, a6
                  c.addi       t6, -1
                  c.slli       s6, 19
                  sub          gp, a0, s7
                  divu         s9, a4, sp
sub_4_110_0_t:    add          t2, a3, a0
                  sltiu        t2, zero, -969
                  c.srli       s1, 16
                  c.li         t6, -1
                  addi         s3, s3, -5 #update loop 0 counter
                  addi         t0, sp, 1406
                  c.xor        a2, s1
                  c.sub        a3, s0
                  bne          s3, s0, sub_4_110_0_t #branch for loop 0
                  sltu         t5, tp, t1
sub_4_49:         jal          t3, 6f
0:                jal          ra, 3f
1:                c.jal        11f
2:                c.jal        1b
3:                jal          tp, 5f
4:                c.jal        0b
5:                c.jal        12f
6:                jal          t1, 7f
7:                jal          t4, 13f
8:                jal          s7, 2b
9:                c.jal        15f
10:               c.j          9b
11:               jal          t1, 10b
12:               jal          t1, 8b
13:               c.j          14f
14:               jal          ra, 4b
15:               add          s0, a6, a3
                  la           s0, amo_0+4 #start riscv_lr_sc_instr_stream_10
                  sltiu        a1, a0, -1090
                  c.mv         ra, s1
                  c.nop
                  sltiu        sp, a7, -1551
                  slt          a5, t6, t3
                  srai         sp, zero, 4
                  mulhsu       s1, s0, t3
                  c.addi16sp   sp, 80
                  slt          s9, s6, s2
                  c.or         a3, s0
                  lr.w.aq       zero, (s0)
                  mul          t0, t3, a0
                  mulh         t4, s3, s7
                  sc.w.aq       t1, a6, (s0) #end riscv_lr_sc_instr_stream_10
                  la           tp, amo_0+56 #start riscv_amo_instr_stream_6
                  la           t0, amo_0+16
                  amomax.w.aq   a4, s6, (tp)
                  amoadd.w      ra, a6, (t0)
                  divu         s4, a0, t0
                  amoadd.w      s0, s0, (t0)
                  sltiu        zero, s7, 1011
                  amomax.w      s0, a3, (t0) #end riscv_amo_instr_stream_6
                  la           a5, region_1+1131 #start riscv_load_store_hazard_instr_stream_16
                  sh           s4, 1(a5)
                  lb           sp, 14(a5)
                  lb           s3, 14(a5)
                  lb           s3, 14(a5)
                  lb           t6, 14(a5)
                  sb           t6, 14(a5)
                  lbu          tp, 14(a5)
                  mul          tp, s6, t3
                  mulhu        a1, s5, a5
                  sb           t0, 14(a5)
                  sub          s4, a3, s3
                  mulh         s8, s11, s8
                  lbu          zero, 14(a5)
                  xori         t4, s4, 1426
                  sb           gp, 14(a5)
                  sb           s2, 14(a5)
                  sb           t4, 14(a5)
                  lb           s3, 14(a5)
                  lbu          a6, 14(a5)
                  c.mv         t4, a2
                  sb           s5, 14(a5) #end riscv_load_store_hazard_instr_stream_16
                  la           a4, region_1+757 #start load_store_instr_stream_2
                  la           t3, region_1+1130 #start load_store_instr_stream_1
                  lb           t1, -42(a4)
                  lbu          a2, -4(a4)
                  lbu          zero, 2(t3)
                  lbu          t1, 15(a4)
                  la           t2, region_1+1840 #start load_store_instr_stream_0
                  sh           t1, 2(t2)
                  lbu          sp, -13(a4)
                  lhu          a3, 8(t3)
                  lb           t5, 17(t2)
                  sb           gp, -32(a4)
                  lbu          s4, -470(t2)
                  lbu          a2, 3(a4)
                  lbu          s7, -1179(t2)
                  sb           s8, 53(a4)
                  lb           a3, 16(t3)
                  lbu          ra, 13(t3)
                  lb           s8, 49(a4) #end load_store_instr_stream_2
                  lb           s0, 4(t3) #end load_store_instr_stream_1
                  lbu          a5, -1251(t2)
                  lbu          a7, -885(t2) #end load_store_instr_stream_0
                  addi         s8, zero, -8 #init loop 0 counter
                  c.slli       sp, 2
                  auipc        a5, 431293
                  div          s0, t2, a5
                  c.srli       a2, 24
                  nop
                  sll          s4, s11, s1
                  c.mv         t6, t2
                  c.addi       gp, 16
                  addi         a4, zero, 0 #init loop 0 limit
                  slli         a7, a4, 14
                  rem          a6, s8, s1
                  remu         s4, s2, s7
sub_4_104_0_t:    andi         a6, s0, -1711
                  sra          t0, s7, s7
                  addi         s8, s8, 8 #update loop 0 counter
                  c.and        a1, a5
                  c.or         a1, s1
                  xori         sp, s1, -1767
                  xori         a1, s10, 407
                  slli         s0, a2, 26
                  slt          gp, t6, s6
                  sll          s3, zero, a6
                  andi         s11, s11, 976
                  slli         a5, a2, 20
                  beq          s8, a4, sub_4_104_0_t #branch for loop 0
                  sltiu        t6, a0, -1881
                  la           a4, region_0+1077 #start load_store_instr_stream_1
                  sb           zero, -120(a4)
                  sb           a0, -230(a4)
                  la           sp, region_1+392 #start load_store_instr_stream_0
                  lh           gp, 996(sp)
                  sh           s1, 217(a4)
                  lbu          s1, -114(a4)
                  lbu          ra, -108(a4)
                  lh           t2, 125(a4)
                  sb           gp, -154(a4)
                  sb           s10, 86(sp)
                  lbu          t3, -168(a4)
                  sb           s9, -145(sp)
                  sb           t3, -249(a4)
                  lbu          s3, 568(sp)
                  lb           t2, 629(sp)
                  lb           zero, -188(a4) #end load_store_instr_stream_1
                  lh           s0, 1384(sp) #end load_store_instr_stream_0
sub_4_48:         jal          t3, 8f
0:                c.jal        19f
1:                jal          a1, 5f
2:                c.jal        25f
3:                c.j          6f
4:                jal          ra, 9f
5:                jal          sp, 11f
6:                c.j          14f
7:                c.jal        1b
8:                c.jal        24f
9:                c.j          18f
10:               jal          t1, 0b
11:               c.j          12f
12:               jal          ra, 10b
13:               c.j          15f
14:               c.j          2b
15:               jal          ra, 21f
16:               c.j          13b
17:               c.jal        20f
18:               c.jal        23f
19:               c.j          3b
20:               c.j          7b
21:               jal          s10, 22f
22:               c.jal        17b
23:               jal          gp, 16b
24:               c.j          4b
25:               srl          s3, s2, s6
                  la           a3, region_1+1501 #start riscv_load_store_hazard_instr_stream_0
                  sh           t0, -27(a3)
                  lh           t2, -27(a3)
                  lb           t3, -47(a3)
                  lbu          t6, -18(a3)
                  sra          s11, s1, s6
                  lh           s4, 61(a3)
                  c.addi4spn   a5, sp, 976
                  lhu          zero, 5(a3)
                  lb           gp, 56(a3)
                  sb           t5, -4(a3)
                  lb           t4, -28(a3)
                  lb           s11, -28(a3)
                  lb           s4, 61(a3)
                  sh           a7, 61(a3) #end riscv_load_store_hazard_instr_stream_0
                  la           s1, amo_0+8 #start riscv_amo_instr_stream_11
                  la           sp, amo_0+52
                  la           t4, amo_0+12
                  xor          s4, s2, s1
                  amominu.w.rl  s8, s5, (s1)
                  c.li         s7, -1
                  sltu         a5, a3, t3
                  amoand.w      t0, t5, (t4)
                  c.xor        a1, s0
                  amomaxu.w     t6, ra, (t4)
                  andi         gp, s11, 1520
                  c.nop
                  amoadd.w.rl   a1, gp, (sp)
                  amomaxu.w     t1, a5, (sp)
                  c.mv         gp, t1
                  amomax.w.rl   t5, s2, (s1)
                  auipc        a4, 687309
                  amoor.w       t2, t3, (t4)
                  amomax.w.aq   a1, s1, (s1)
                  amomaxu.w.aq  a1, s9, (t4) #end riscv_amo_instr_stream_11
                  la           sp, region_1+1729 #start riscv_load_store_hazard_instr_stream_3
                  lhu          ra, 193(sp)
                  nop
                  c.and        a4, s1
                  lbu          gp, 193(sp)
                  lh           gp, 193(sp)
                  lb           a3, 193(sp)
                  sb           a5, 193(sp)
                  divu         s10, t3, a3
                  lhu          zero, 193(sp)
                  lbu          a4, 193(sp)
                  addi         t0, t0, -1590
                  sh           s1, 69(sp)
                  sb           a7, 69(sp)
                  c.addi       s6, -1
                  sh           s10, 69(sp) #end riscv_load_store_hazard_instr_stream_3
                  la           sp, region_0+1457 #start riscv_load_store_hazard_instr_stream_4
                  srl          s4, a5, t2
                  lh           s9, -755(sp)
                  lhu          a7, -755(sp)
                  lbu          tp, -566(sp)
                  lb           t2, -566(sp)
                  sb           a0, -566(sp)
                  lb           s4, -1392(sp)
                  sb           t1, -1392(sp)
                  lb           t3, -1392(sp)
                  lbu          a1, -1392(sp)
                  and          s11, s9, a5
                  lbu          tp, -1392(sp)
                  c.nop
                  lhu          t3, -1019(sp)
                  sh           t5, -1019(sp)
                  sh           a0, -435(sp)
                  lh           a4, -435(sp)
                  lbu          s3, -593(sp)
                  sb           t4, -1288(sp) #end riscv_load_store_hazard_instr_stream_4
                  la           t3, region_0+1777 #start load_store_instr_stream_0
                  la           a2, region_0+1282 #start load_store_instr_stream_3
                  lb           s11, 55(a2)
                  lw           tp, -849(t3)
                  la           sp, region_0+7 #start load_store_instr_stream_1
                  sw           s4, 2(a2)
                  lb           a7, 340(sp)
                  la           t1, region_0+391 #start load_store_instr_stream_2
                  sb           zero, -1758(t3)
                  lbu          a1, -61(a2)
                  lbu          t5, 170(sp)
                  sb           sp, 1848(sp)
                  lb           a4, 490(t1)
                  lb           s11, -468(t3)
                  sb           a5, 336(t1)
                  lhu          t4, 671(sp)
                  sh           s7, -1405(t3)
                  lhu          s1, -1523(t3)
                  lw           a6, 829(t1)
                  lbu          gp, 35(a2)
                  lb           a1, 598(t1)
                  sh           a7, 633(sp)
                  sb           a7, 1213(t1)
                  lhu          s3, 259(sp)
                  sb           a0, 57(a2)
                  lb           t0, -273(t1) #end load_store_instr_stream_2
                  sh           s3, -935(t3)
                  lb           s3, -58(a2)
                  lbu          s9, 1102(sp)
                  sb           zero, 1745(sp)
                  lbu          zero, -211(t3)
                  sb           sp, 63(a2)
                  lb           t2, 61(a2)
                  sh           s7, 1763(sp)
                  lb           s1, 47(a2)
                  lbu          t6, 1100(sp) #end load_store_instr_stream_1
                  lh           t0, -1203(t3)
                  lb           a5, -1014(t3)
                  sb           a3, 63(a2) #end load_store_instr_stream_3
                  sb           s7, -348(t3) #end load_store_instr_stream_0
                  la           ra, amo_0+8 #start riscv_amo_instr_stream_2
                  la           s10, amo_0+36
                  la           t1, amo_0+24
                  amoand.w      s3, t5, (t1)
                  amomin.w.aq   s6, a1, (s10)
                  amomax.w.rl   a5, t0, (s10)
                  mulh         t2, s9, s0
                  sltiu        a6, zero, 694
                  sll          gp, s8, s9
                  amoadd.w.rl   s11, a3, (s10)
                  amomaxu.w.aq  s8, zero, (ra) #end riscv_amo_instr_stream_2
                  la           sp, region_1+1104 #start riscv_hazard_instr_stream_5
                  lb           t1, -9(sp)
                  c.li         t0, 20
                  sltiu        s3, t1, 1295
                  c.lwsp       a1, 16(sp)
                  c.add        s3, t0
                  mul          a1, t1, a4
                  slli         a1, s10, 14
                  lbu          a4, -13(sp)
                  lbu          a4, -13(sp)
                  lbu          s10, -14(sp)
                  c.and        a1, a4
                  div          s3, s3, s3
                  lbu          t1, -9(sp)
                  c.xor        a4, a1
                  divu         a1, a1, a1
                  srai         t0, s10, 27
                  sb           t1, 6(sp)
                  mulh         s3, s10, t0
                  srai         s10, t1, 22
                  rem          t0, s10, s3
                  mulh         s10, a1, a4
                  c.swsp       a4, 8(sp)
                  srl          a1, a4, s3
                  c.xor        a4, a4
                  c.srli       a1, 7
                  addi         s10, s3, -1528
                  lb           t1, 13(sp)
                  sb           a4, -7(sp)
                  lb           t0, 7(sp)
                  c.slli       t1, 28
                  slti         a1, s3, -152
                  sltiu        s10, t0, 1880
                  sb           a4, 3(sp) #end riscv_hazard_instr_stream_5
                  la           sp, region_0+1160 #start riscv_hazard_instr_stream_3
                  lb           s7, -9(sp)
                  addi         s0, s0, 396
                  c.swsp       s0, 0(sp)
                  sb           s0, 15(sp)
                  sra          s10, t4, t4
                  c.srli       a1, 23
                  c.swsp       s0, 12(sp)
                  c.andi       s0, 4
                  andi         s10, ra, -475
                  sb           t4, 14(sp)
                  lb           s7, 15(sp)
                  srl          t4, s7, ra
                  mulh         s10, s10, ra
                  lh           ra, -12(sp)
                  slti         s7, s0, 287
                  lb           s10, -12(sp)
                  mulhsu       a1, s7, t4
                  c.and        s0, s0
                  andi         t4, s0, -113
                  xori         t4, s7, -1916
                  c.mv         s7, ra
                  add          s7, s10, s7
                  c.srli       a1, 13
                  c.and        s0, s0
                  lbu          a1, -14(sp)
                  sb           ra, -7(sp)
                  c.srai       a1, 4
                  lb           s7, -9(sp)
                  mulh         ra, ra, s7
                  sb           s7, -11(sp)
                  sb           t4, -10(sp)
                  lb           ra, -3(sp)
                  c.andi       s0, -1
                  sltiu        s0, s0, -1357
                  lb           t4, -5(sp)
                  c.addi       s10, 13
                  lb           s10, 2(sp)
                  lui          s0, 399362
                  remu         ra, ra, t4
                  c.slli       a1, 13
                  lbu          s7, -15(sp)
                  c.swsp       s10, 0(sp)
                  sh           ra, -6(sp)
                  lb           s10, -11(sp)
                  mul          s0, ra, ra
                  xori         s10, s7, 1589
                  lbu          s10, 1(sp)
                  c.srai       s0, 5
                  slli         a1, ra, 6
                  lhu          t4, -2(sp)
                  lbu          s0, -7(sp)
                  nop
                  lhu          t4, -6(sp) #end riscv_hazard_instr_stream_3
                  la           t6, region_1+1568 #start riscv_load_store_rand_instr_stream_14
                  c.addi16sp   sp, -16
                  add          zero, a2, ra
                  add          a6, s9, s3
                  lhu          t1, -18(t6)
                  lb           tp, -106(t6)
                  sb           gp, -66(t6)
                  c.slli       s1, 15
                  lb           s8, 109(t6)
                  xor          t2, ra, gp
                  lbu          a4, -235(t6)
                  slt          a2, zero, t0
                  c.lui        t1, 4
                  sb           a3, -251(t6)
                  mulhsu       a7, s8, a6
                  sra          t5, sp, t3
                  sb           s6, 85(t6)
                  xor          a1, s3, s4
                  lbu          t5, 181(t6)
                  sra          tp, s5, s0
                  sb           a4, 201(t6)
                  and          tp, a1, a6
                  sb           a1, -113(t6)
                  lh           zero, 106(t6) #end riscv_load_store_rand_instr_stream_14
                  la           t6, amo_0+56 #start riscv_amo_instr_stream_12
                  la           s9, amo_0+0
                  la           s7, amo_0+8
                  xori         gp, a4, -152
                  c.slli       t2, 21
                  c.lui        a7, 22
                  amoand.w.rl   a5, a7, (s9)
                  amomaxu.w.aq  s6, s3, (s9)
                  sltu         s1, s2, a0
                  amoor.w       s1, s0, (t6)
                  amoswap.w.aq  s1, a4, (s9) #end riscv_amo_instr_stream_12
                  la           a7, region_1+1043 #start load_store_instr_stream_0
                  la           s9, region_0+1114 #start load_store_instr_stream_1
                  lb           s7, 0(a7)
                  sb           s3, -9(s9)
                  sb           a2, -9(a7)
                  lhu          s11, 11(a7)
                  lbu          s0, 9(s9)
                  sb           s11, 15(s9)
                  sb           a6, 14(a7)
                  lhu          s1, -16(s9)
                  lbu          t6, -11(s9) #end load_store_instr_stream_1
                  sb           t5, -1(a7)
                  lb           sp, -8(a7)
                  sb           t3, -2(a7)
                  lb           t4, -10(a7) #end load_store_instr_stream_0
                  la           s8, amo_0+12 #start riscv_amo_instr_stream_5
                  add          t0, sp, gp
                  amoswap.w     a4, s3, (s8) #end riscv_amo_instr_stream_5
                  la           a7, region_1+1106 #start riscv_load_store_rand_instr_stream_15
                  ori          ra, t4, 1529
                  lh           s7, -1088(a7)
                  sb           tp, -899(a7)
                  c.addi16sp   sp, 32
                  lb           s0, 805(a7)
                  add          tp, a2, a4
                  c.addi       t5, 11
                  lb           zero, -8(a7)
                  slti         t6, a1, 1048
                  sh           s0, 246(a7)
                  sb           s4, 143(a7)
                  lhu          t5, -810(a7)
                  rem          s0, a7, s3
                  lb           t5, -328(a7)
                  srl          s9, a4, ra
                  lb           tp, 457(a7)
                  and          s1, t0, t2
                  c.nop
                  lb           t4, -243(a7)
                  andi         t6, a5, 1874
                  sw           s10, -782(a7)
                  lh           s11, -10(a7)
                  c.addi       s11, 31
                  lbu          ra, -631(a7)
                  sh           s4, -348(a7)
                  lb           s4, -279(a7)
                  lbu          s8, 448(a7)
                  lbu          t3, 846(a7)
                  lbu          s3, -952(a7)
                  c.add        t0, s7
                  sb           sp, -1090(a7)
                  div          s3, t5, a7
                  mulhsu       a4, t4, ra
                  ori          a6, s5, 1401
                  c.slli       a6, 3
                  c.li         s3, -1
                  sltiu        zero, a5, 665
                  lb           s11, 476(a7)
                  lb           t0, 747(a7)
                  c.sub        s0, a5
                  lbu          s3, 255(a7) #end riscv_load_store_rand_instr_stream_15
                  la           t5, region_1+1208 #start riscv_hazard_instr_stream_7
                  lh           s3, 114(t5)
                  c.srli       a2, 29
                  c.sub        a2, a2
                  c.sub        a2, a2
                  sh           t0, 14(t5)
                  lbu          t0, -70(t5)
                  sb           t0, -141(t5)
                  lbu          s3, -57(t5)
                  lb           a2, 225(t5)
                  sra          sp, t1, t0
                  auipc        t0, 991802
                  or           sp, a2, a2
                  sb           a2, -53(t5)
                  lw           a2, 64(t5)
                  lbu          a2, 85(t5)
                  lbu          t1, -102(t5)
                  lbu          s3, 213(t5)
                  lh           t1, -126(t5)
                  c.addi4spn   a2, sp, 64
                  sub          t0, t1, t0
                  sb           t1, -245(t5)
                  sh           s6, 182(t5)
                  lhu          s3, 220(t5)
                  lb           s3, 255(t5)
                  c.addi       s6, -1
                  lhu          a2, 242(t5)
                  addi         a2, a2, 569
                  sb           s3, 191(t5)
                  slt          a2, s3, a2
                  sb           t0, -167(t5) #end riscv_hazard_instr_stream_7
                  la           t4, region_1+475 #start load_store_instr_stream_0
                  sb           a1, 876(t4)
                  la           ra, region_0+1763 #start load_store_instr_stream_1
                  lbu          s1, 864(t4)
                  lb           sp, -1361(ra)
                  sb           s1, -1504(ra)
                  sh           s3, 313(t4)
                  sb           s4, 127(t4)
                  lbu          s0, 614(t4)
                  lh           s8, 541(t4)
                  lbu          a3, -328(t4)
                  lb           a4, -586(ra)
                  lhu          t0, -749(ra)
                  lb           t6, 47(t4)
                  sb           s0, -1567(ra)
                  lb           a3, 961(t4)
                  lb           s11, 32(ra)
                  sb           a0, -418(ra) #end load_store_instr_stream_1
                  lb           t3, -222(t4) #end load_store_instr_stream_0
                  la           sp, region_1+1786 #start riscv_hazard_instr_stream_15
                  c.slli       a6, 21
                  c.and        s1, s1
                  lbu          s1, -1344(sp)
                  c.srli       s1, 28
                  lbu          t0, -979(sp)
                  c.nop
                  lh           s1, -1454(sp)
                  rem          a3, s11, s6
                  c.sub        a3, a3
                  lw           s6, 210(sp)
                  lbu          t0, -1597(sp)
                  xor          t0, t0, a6
                  lbu          s11, -665(sp)
                  lbu          a6, -113(sp)
                  sltu         a3, a3, s11
                  lhu          s11, -1688(sp)
                  slti         s1, a3, -1034
                  sb           s6, -1271(sp)
                  sb           s11, -159(sp)
                  lh           s6, -152(sp)
                  sh           s6, -68(sp)
                  sh           a6, 104(sp)
                  lhu          t0, -520(sp)
                  lhu          t0, -638(sp)
                  c.li         a6, -1
                  lh           s11, -60(sp)
                  srai         s1, s6, 31
                  sb           t0, -892(sp)
                  divu         s1, s6, a6
                  lh           a6, -1632(sp)
                  and          t0, a3, a6
                  mulhu        a3, t0, s11
                  lb           a6, -177(sp)
                  sh           s1, -1494(sp)
                  sub          a6, t0, s11
                  c.or         s1, a3
                  sb           s11, -68(sp)
                  sb           s11, -1461(sp)
                  lh           t0, -924(sp) #end riscv_hazard_instr_stream_15
                  la           s1, region_0+672 #start riscv_hazard_instr_stream_9
                  lh           a1, 818(s1)
                  sb           t1, 765(s1)
                  lh           t3, -220(s1)
                  lb           t3, 1249(s1)
                  mulh         s0, a1, t1
                  c.and        a5, s0
                  srl          a5, a1, t3
                  sb           a5, -511(s1)
                  sb           a5, -296(s1)
                  sll          t6, t1, s0
                  lhu          s0, 298(s1)
                  lbu          a5, -647(s1)
                  sb           t3, -306(s1)
                  lh           s0, 108(s1)
                  lb           a1, -539(s1)
                  lb           a5, -290(s1)
                  lb           t1, 707(s1)
                  lbu          t3, -405(s1)
                  c.srli       a5, 12
                  srl          t3, s0, a1
                  lb           t1, 1302(s1)
                  c.add        t1, a1
                  slti         a1, t6, -639
                  divu         t3, s0, a5
                  lb           s0, 1080(s1)
                  lbu          t6, 689(s1)
                  sb           a5, 933(s1)
                  lui          s0, 400327
                  sb           a5, -619(s1)
                  divu         s0, t6, a1
                  mulhsu       t1, a5, a5
                  lw           t6, -504(s1)
                  sw           a5, 912(s1)
                  lbu          t3, 911(s1)
                  lui          t3, 671030
                  lbu          t1, 311(s1)
                  lbu          t3, 902(s1)
                  lb           a1, 1282(s1)
                  lw           a1, -12(s1)
                  sltiu        a1, t1, -1315
                  c.addi       t6, -1
                  sb           t1, 933(s1) #end riscv_hazard_instr_stream_9
                  la           s11, region_0+1944 #start load_store_instr_stream_0
                  la           s3, region_0+1521 #start load_store_instr_stream_1
                  lb           s10, 124(s3)
                  lbu          s1, -46(s11)
                  lbu          gp, -222(s3)
                  sb           zero, -42(s11)
                  lhu          t2, -143(s3)
                  lbu          s1, 20(s11)
                  lbu          a7, 72(s3)
                  lh           t5, 57(s3)
                  sb           a7, 47(s11)
                  lb           gp, -104(s3)
                  lhu          a3, 48(s11)
                  lbu          t6, -190(s3)
                  sh           s3, 42(s11)
                  lb           a7, -242(s3)
                  lb           s6, -54(s11)
                  sb           ra, 47(s11)
                  lbu          a5, -25(s11)
                  lb           s8, -246(s3) #end load_store_instr_stream_1
                  lh           s0, -46(s11) #end load_store_instr_stream_0
                  la           a2, amo_0+48 #start riscv_amo_instr_stream_7
                  la           t5, amo_0+8
                  amomax.w      s8, sp, (t5)
                  amoor.w.aq    s4, zero, (a2)
                  c.sub        s1, s1
                  amoadd.w.aq   s4, tp, (a2)
                  amomax.w.rl   t0, t6, (t5)
                  amomax.w      s4, s6, (a2)
                  amomaxu.w.aq  t2, a7, (a2)
                  amoswap.w.rl  s3, gp, (a2)
                  amominu.w     tp, a3, (t5)
                  amominu.w     s1, zero, (t5) #end riscv_amo_instr_stream_7
                  la           s9, region_1+686 #start load_store_instr_stream_0
                  sb           a2, 192(s9)
                  la           s1, region_1+202 #start load_store_instr_stream_1
                  sb           tp, -204(s9)
                  lb           s6, 229(s9)
                  sh           a2, 16(s1)
                  lbu          a5, -57(s1)
                  lbu          a7, -31(s9)
                  sb           t2, -31(s1)
                  lb           a6, -29(s1)
                  sw           s11, -34(s1)
                  sb           a3, 83(s9)
                  lh           gp, -44(s1)
                  lb           a3, 66(s9)
                  sb           a7, 3(s1)
                  sb           s1, 57(s1) #end load_store_instr_stream_1
                  lbu          s7, -9(s9) #end load_store_instr_stream_0
                  la           a7, region_1+1829 #start load_store_instr_stream_1
                  la           a4, region_1+299 #start load_store_instr_stream_0
                  sb           s9, -3(a4)
                  sb           a6, -58(a7)
                  sw           gp, -15(a4)
                  sb           s4, 13(a4)
                  sw           t6, 23(a7)
                  sb           a6, 0(a4)
                  lh           s4, -7(a4)
                  la           sp, region_1+1974 #start load_store_instr_stream_2
                  lbu          t0, 22(a7)
                  sh           s9, 2(sp)
                  lb           s10, -6(a4)
                  lbu          a3, -32(a7)
                  sh           a4, 12(sp)
                  lb           s8, 0(a7)
                  lb           s8, -12(sp)
                  lh           zero, 14(sp)
                  sb           tp, 14(a4)
                  sb           s7, -12(sp)
                  lbu          t1, -12(a7)
                  lbu          a6, 1(sp)
                  sb           a0, -4(a4)
                  sb           s8, -9(a4)
                  lbu          a1, 8(sp)
                  lh           s9, 21(a7) #end load_store_instr_stream_1
                  lbu          a2, 13(sp)
                  lbu          t6, 10(sp) #end load_store_instr_stream_2
                  lbu          a2, 11(a4) #end load_store_instr_stream_0
                  la           tp, region_0+1516 #start riscv_load_store_rand_instr_stream_12
                  sltu         t3, a0, sp
                  lb           t2, -219(tp)
                  c.srli       a5, 17
                  lw           t6, 208(tp)
                  mulh         s1, s10, a6
                  lh           s6, 78(tp)
                  lb           s8, -95(tp)
                  lbu          s4, -210(tp)
                  slt          zero, a6, a4
                  sb           a5, 134(tp)
                  c.xor        a4, a4
                  srli         t5, s1, 5
                  sltu         t2, s6, s1
                  sb           s3, 209(tp)
                  rem          s4, tp, s7
                  xori         a6, t1, 1633
                  c.addi16sp   sp, -16
                  sb           t2, 247(tp)
                  lbu          t6, -71(tp)
                  lbu          a6, 28(tp)
                  lui          sp, 759515
                  lh           t4, -86(tp)
                  c.xor        a2, a2
                  ori          a3, a4, 285
                  sb           a2, -95(tp)
                  slli         a5, s11, 26
                  lb           s0, 146(tp)
                  sh           a3, 122(tp)
                  nop
                  c.mv         t5, s5
                  sb           t0, 135(tp) #end riscv_load_store_rand_instr_stream_12
                  la           sp, region_1+749 #start riscv_load_store_rand_instr_stream_10
                  lbu          s9, 48(sp)
                  sh           s9, 29(sp)
                  remu         a3, ra, a6
                  c.srli       a1, 26
                  c.add        s1, a6
                  sh           s4, -63(sp)
                  or           s3, a6, s9
                  lb           s8, -59(sp)
                  c.xor        a2, a3
                  sb           a0, 36(sp)
                  sb           s10, 46(sp)
                  c.slli       a4, 23
                  sh           s8, 37(sp)
                  c.and        a1, a4
                  addi         s9, a2, -856
                  lbu          t6, 7(sp)
                  lb           gp, -52(sp)
                  div          s11, ra, sp
                  lb           s8, -63(sp)
                  lb           t3, 62(sp)
                  sh           s2, -23(sp)
                  sb           s4, 48(sp)
                  lbu          t6, -7(sp)
                  lb           a5, -12(sp)
                  lbu          s10, 2(sp)
                  lb           t4, 38(sp)
                  sb           s8, -42(sp)
                  sb           s7, 5(sp)
                  sh           s10, -47(sp)
                  nop
                  lb           s8, -57(sp)
                  lb           s9, 58(sp)
                  slt          t5, a6, a1
                  sra          t5, a0, t1
                  lui          t0, 418090
                  sw           sp, -33(sp)
                  sb           a3, -3(sp)
                  lbu          t0, -58(sp)
                  lbu          s4, -55(sp)
                  lbu          t5, -38(sp)
                  lbu          a5, 20(sp)
                  sb           zero, -63(sp) #end riscv_load_store_rand_instr_stream_10
                  la           t3, region_0+729 #start riscv_load_store_hazard_instr_stream_7
                  c.and        s0, a4
                  lbu          s4, 12(t3)
                  lb           t4, 4(t3)
                  lb           a4, 4(t3)
                  lbu          s3, 4(t3)
                  sb           s6, 4(t3)
                  addi         gp, t5, 1902
                  sb           a7, 4(t3)
                  c.mv         s3, s7
                  lb           zero, -12(t3)
                  and          zero, s4, t6
                  or           s6, ra, s7
                  lb           a3, -12(t3)
                  lb           a4, -12(t3)
                  lb           a2, -12(t3)
                  lbu          ra, -12(t3)
                  or           s0, s10, t0
                  sb           sp, 8(t3)
                  sb           s2, 8(t3) #end riscv_load_store_hazard_instr_stream_7
                  la           s0, region_1+982 #start riscv_hazard_instr_stream_18
                  sra          a2, a2, a2
                  c.srai       a2, 21
                  c.add        s7, s11
                  add          a2, tp, a2
                  lb           tp, 185(s0)
                  sb           tp, 235(s0)
                  slti         t3, s11, 426
                  nop
                  or           s7, tp, s11
                  lbu          tp, -125(s0)
                  lbu          s11, 169(s0)
                  sh           s7, -38(s0)
                  lb           t3, -184(s0)
                  sb           s7, -100(s0)
                  lbu          tp, 9(s0)
                  mulhu        gp, a2, s11
                  srli         a2, tp, 6
                  andi         s11, gp, 67
                  lbu          t3, -217(s0)
                  divu         s11, s11, s11
                  sra          gp, a2, s7
                  c.srai       a2, 7
                  div          gp, s11, tp
                  lb           s7, 9(s0)
                  and          t3, s11, s7
                  sw           s7, 110(s0)
                  mulhsu       s11, gp, tp
                  lb           a2, -247(s0)
                  sra          s11, tp, a2
                  c.mv         t3, s7
                  lb           t3, -43(s0)
                  remu         a2, gp, gp
                  lbu          a2, 89(s0)
                  sb           s11, 242(s0)
                  nop
                  mul          s11, a2, t3
                  lbu          t3, -183(s0)
                  lhu          tp, 130(s0)
                  lb           tp, 187(s0)
                  auipc        t3, 222643
                  lhu          a2, -62(s0)
                  lh           s7, 180(s0)
                  sb           s7, -93(s0) #end riscv_hazard_instr_stream_18
sub_4_37:         jal          t3, 12f
0:                jal          ra, 5f
1:                c.j          15f
2:                c.j          0b
3:                c.j          17f
4:                c.j          7f
5:                c.jal        4b
6:                jal          t6, 24f
7:                c.j          3b
8:                jal          t1, 21f
9:                c.j          1b
10:               c.jal        20f
11:               jal          ra, 23f
12:               c.j          16f
13:               c.j          9b
14:               c.jal        2b
15:               c.j          19f
16:               c.j          10b
17:               jal          t1, 13b
18:               c.jal        22f
19:               jal          t1, 8b
20:               jal          ra, 11b
21:               c.j          6b
22:               c.j          14b
23:               c.jal        18b
24:               c.addi       t2, -1
                  la           a2, region_1+939 #start riscv_load_store_hazard_instr_stream_13
                  lb           tp, -129(a2)
                  sb           t5, -230(a2)
                  sb           t1, -56(a2)
                  lbu          s1, -56(a2)
                  lh           s7, -65(a2)
                  lb           a6, -45(a2)
                  lhu          s6, -147(a2)
                  sh           t4, -147(a2)
                  lh           s9, -197(a2)
                  lb           ra, -197(a2)
                  c.srai       a1, 1
                  sb           s4, -197(a2)
                  lbu          t0, 91(a2)
                  sb           a1, 91(a2)
                  lb           a6, -76(a2)
                  sh           t4, -15(a2)
                  lb           a7, -174(a2)
                  sb           t1, -95(a2)
                  lbu          t0, -95(a2) #end riscv_load_store_hazard_instr_stream_13
                  la           sp, region_0+1038 #start riscv_load_store_hazard_instr_stream_19
                  lb           a6, -33(sp)
                  sub          a2, s4, s5
                  sb           s6, -33(sp)
                  lb           a1, -33(sp)
                  lhu          gp, -18(sp)
                  sw           s8, -18(sp)
                  lbu          ra, 13(sp)
                  sb           a2, 13(sp)
                  sb           s8, 3(sp)
                  addi         s7, t6, -1920
                  lbu          ra, 31(sp)
                  lb           a2, 57(sp)
                  lb           t0, 57(sp)
                  lb           s0, 57(sp)
                  sb           t3, 57(sp)
                  sb           t6, 57(sp)
                  lbu          s6, 57(sp)
                  or           t6, a6, t0
                  lb           s1, 57(sp)
                  lbu          t6, 57(sp)
                  lhu          a2, -8(sp)
                  c.mv         t5, t3
                  sb           t3, -8(sp) #end riscv_load_store_hazard_instr_stream_19
                  la           t3, amo_0+60 #start riscv_amo_instr_stream_0
                  c.mv         a7, t1
                  amomax.w.aq   a7, a4, (t3) #end riscv_amo_instr_stream_0
                  la           a4, amo_0+4 #start riscv_amo_instr_stream_1
                  la           s11, amo_0+40
                  la           a6, amo_0+60
                  la           a2, amo_0+44
                  amomax.w      t0, a6, (a6)
                  andi         s0, t3, 926
                  amomin.w.rl   s7, t0, (a2)
                  amoxor.w.aq   zero, tp, (s11)
                  srai         a3, s7, 8
                  lui          t2, 248377
                  mulh         gp, a5, s9
                  or           zero, sp, t3
                  rem          s1, s6, ra
                  c.sub        s0, s1
                  amoswap.w     s8, s9, (a6)
                  c.sub        a5, a1
                  amoand.w.rl   t0, zero, (s11)
                  amominu.w     a3, t4, (a4)
                  amominu.w.aq  s6, s6, (s11)
                  amomax.w.aq   s4, tp, (a6) #end riscv_amo_instr_stream_1
                  la           s7, amo_0+8 #start riscv_lr_sc_instr_stream_7
                  lr.w          s4, (s7)
                  sc.w          t3, sp, (s7) #end riscv_lr_sc_instr_stream_7
                  la           sp, region_0+1367 #start riscv_load_store_hazard_instr_stream_14
                  c.mv         a6, a3
                  lw           t4, 45(sp)
                  add          a1, t4, gp
                  nop
                  lw           tp, 45(sp)
                  lh           zero, 45(sp)
                  sh           s9, 45(sp)
                  lw           t3, 45(sp)
                  xor          tp, a3, a7
                  sh           a3, 45(sp)
                  lhu          tp, 45(sp)
                  lb           zero, 45(sp)
                  lui          s7, 169921
                  sltiu        t3, s4, -46
                  lbu          a2, 45(sp)
                  lw           a2, 45(sp)
                  lw           a2, 45(sp)
                  sh           s2, 59(sp)
                  divu         s6, a3, sp
                  sb           a4, 59(sp)
                  lhu          s6, 59(sp)
                  sb           t2, 59(sp)
                  sh           ra, 59(sp)
                  lhu          t1, 59(sp)
                  lh           s0, 59(sp)
                  lhu          tp, 5(sp) #end riscv_load_store_hazard_instr_stream_14
                  la           a6, region_0+1333 #start load_store_instr_stream_1
                  la           s0, region_0+647 #start load_store_instr_stream_0
                  sb           s3, -123(a6)
                  lb           s8, -162(a6)
                  sb           gp, -136(s0)
                  sw           s0, -139(s0)
                  lh           s10, 39(a6)
                  sb           t5, -208(s0)
                  sb           a4, -198(a6)
                  lh           a1, 89(a6)
                  sb           sp, 78(s0)
                  lbu          gp, 254(a6)
                  lbu          s6, 58(s0)
                  lbu          a3, -199(s0)
                  lbu          s6, 221(s0)
                  sb           ra, -210(a6)
                  sb           zero, -8(s0)
                  sb           t5, 100(a6) #end load_store_instr_stream_1
                  sb           a1, -134(s0) #end load_store_instr_stream_0
                  la           s3, region_1+247 #start load_store_instr_stream_3
                  la           a4, region_1+850 #start load_store_instr_stream_1
                  lb           t2, -9(s3)
                  lbu          s11, -7(a4)
                  la           a2, region_1+1233 #start load_store_instr_stream_0
                  la           t5, region_1+276 #start load_store_instr_stream_2
                  lw           s6, 10(a4)
                  lbu          tp, 745(t5)
                  lh           s8, 1464(t5)
                  sh           s11, 1(s3)
                  lb           s9, -43(a4)
                  lhu          sp, -3(a2)
                  sb           a3, 14(s3)
                  lbu          s10, 30(a4)
                  lbu          a6, -10(a2)
                  lh           t2, 11(s3)
                  lbu          s1, -185(t5)
                  lw           s10, 1700(t5)
                  lb           sp, -1(a2)
                  lbu          t2, -200(t5) #end load_store_instr_stream_2
                  lbu          gp, -11(a2)
                  lb           s8, -8(s3)
                  lb           s1, -27(a4)
                  sb           a4, 12(a4) #end load_store_instr_stream_1
                  sb           a7, 10(s3)
                  sb           a5, 16(s3) #end load_store_instr_stream_3
                  lb           tp, -12(a2) #end load_store_instr_stream_0
                  addi         ra, zero, -3 #init loop 0 counter
                  auipc        s1, 276745
                  addi         s9, zero, 19 #init loop 0 limit
sub_4_112_0_t:    lui          s3, 816534
                  srli         t0, s7, 21
                  addi         ra, ra, 9 #update loop 0 counter
                  bltu         ra, s9, sub_4_112_0_t #branch for loop 0
                  sra          a2, gp, t3
                  addi         a1, zero, -3 #init loop 0 counter
                  add          sp, s11, gp
                  c.mv         a4, a6
                  or           s4, a2, a7
                  addi         zero, zero, 0 #init loop 0 limit
sub_4_107_0_t:    xori         s11, t6, -161
                  divu         t1, t6, a6
                  mulhsu       t4, gp, a6
                  addi         a1, a1, 3 #update loop 0 counter
                  sub          a5, tp, s3
                  slti         t1, s0, -1032
                  c.li         ra, 8
                  add          s8, a6, sp
                  sltiu        tp, s11, -594
                  div          ra, s7, t5
                  c.addi       gp, 5
                  slt          t5, tp, s2
                  c.bnez       a1, sub_4_107_0_t #branch for loop 0
                  c.add        s3, s9
                  addi         a2, zero, 8 #init loop 0 counter
                  sltiu        a4, a6, -1901
                  c.andi       a3, 7
                  addi         zero, zero, 0 #init loop 0 limit
                  mulhsu       a3, a1, ra
                  c.srli       a5, 7
                  c.slli       a4, 1
sub_4_115_0_t:    c.andi       a3, -1
                  c.addi16sp   sp, 496
                  c.andi       a4, -1
                  addi         t1, t6, -1669
                  nop
                  nop
                  c.sub        a5, a0
                  addi         a2, a2, -8 #update loop 0 counter
                  sltiu        s8, t4, 1501
                  c.srli       a1, 13
                  sll          a1, t0, t0
                  c.or         a3, a2
                  andi         sp, a5, 1149
                  xori         t6, gp, -1967
                  c.andi       a5, -1
                  sra          ra, a2, a1
                  c.mv         t2, a7
                  c.srai       s1, 22
                  c.beqz       a2, sub_4_115_0_t #branch for loop 0
                  sub          ra, zero, sp
                  la           t3, region_1+1365 #start riscv_hazard_instr_stream_10
                  lb           gp, -48(t3)
                  divu         gp, ra, t2
                  lbu          ra, -97(t3)
                  add          ra, a1, a1
                  sb           s9, -218(t3)
                  sub          a1, a1, s9
                  lh           t1, 51(t3)
                  lh           gp, -191(t3)
                  sb           a1, 112(t3)
                  c.addi       t2, -1
                  c.xor        a1, a1
                  lb           ra, 18(t3)
                  remu         a1, t2, a1
                  c.mv         gp, t2
                  lhu          s9, -183(t3)
                  c.andi       a1, 20
                  c.mv         t1, s9
                  srai         ra, gp, 18
                  c.addi       t2, -1
                  sb           t2, -215(t3)
                  lbu          t2, 104(t3) #end riscv_hazard_instr_stream_10
                  la           t2, region_1+1250 #start riscv_load_store_rand_instr_stream_20
                  sw           zero, 294(t2)
                  lb           t6, -401(t2)
                  srl          s3, zero, a1
                  add          t6, gp, a5
                  divu         s0, s10, s11
                  mul          t5, s11, a0
                  c.xor        a1, a3
                  c.li         t6, 2
                  sub          s9, s10, t4
                  lh           tp, 408(t2)
                  c.andi       a5, -1
                  sub          s0, s1, a7
                  lbu          t0, -65(t2)
                  sub          s11, s1, sp
                  xori         a5, t3, -712
                  srai         t0, a6, 28
                  sh           t4, -42(t2)
                  and          a5, s1, t0
                  sb           a3, -629(t2)
                  c.slli       a1, 4
                  slli         a2, a6, 31
                  c.sub        a5, s1
                  nop
                  sb           zero, 666(t2)
                  andi         s7, tp, 204
                  mul          t3, a1, zero
                  sb           ra, 487(t2)
                  auipc        t1, 324077
                  c.li         a5, 9
                  c.addi4spn   a5, sp, 608
                  sh           gp, -684(t2)
                  c.lui        s10, 1
                  div          t5, t5, t1
                  c.srai       a2, 24
                  andi         t3, t5, 1585
                  addi         s8, a7, 1240
                  srl          s8, a2, s3
                  lbu          tp, -1025(t2) #end riscv_load_store_rand_instr_stream_20
                  la           s4, amo_0+40 #start riscv_amo_instr_stream_9
                  amoadd.w.rl   sp, tp, (s4)
                  amoor.w.aq    gp, t6, (s4)
                  amomaxu.w.rl  t1, s8, (s4)
                  amomin.w.aq   t4, sp, (s4)
                  amomax.w.rl   t5, t5, (s4)
                  c.addi4spn   a5, sp, 368
                  addi         t3, zero, 1460
                  srl          ra, s10, t5
                  c.mv         s3, s1
                  amoxor.w      tp, s7, (s4)
                  mulhsu       s7, ra, gp
                  c.addi       s0, -1
                  amomax.w.aq   s10, a6, (s4)
                  add          a1, tp, a3
                  amomax.w.aq   s11, s10, (s4)
                  amoswap.w.rl  a1, s5, (s4)
                  amomaxu.w.aq  sp, t4, (s4) #end riscv_amo_instr_stream_9
sub_4_40:         jal          t3, 11f
0:                c.jal        4f
1:                c.j          14f
2:                c.j          9f
3:                jal          gp, 10f
4:                c.j          5f
5:                jal          ra, 21f
6:                c.j          20f
7:                c.jal        17f
8:                c.jal        7b
9:                jal          ra, 3b
10:               c.j          24f
11:               c.j          8b
12:               c.j          1b
13:               c.j          2b
14:               jal          t1, 22f
15:               c.j          6b
16:               c.jal        13b
17:               jal          tp, 23f
18:               jal          sp, 12b
19:               jal          ra, 16b
20:               c.j          19b
21:               c.jal        18b
22:               c.j          15b
23:               c.j          0b
24:               c.add        s6, t1
                  la           s9, region_0+305 #start load_store_instr_stream_0
                  lhu          tp, -3(s9)
                  lhu          zero, 75(s9)
                  la           a5, region_1+1849 #start load_store_instr_stream_1
                  sh           t1, -93(s9)
                  sh           s10, -83(s9)
                  lb           a4, -82(s9)
                  lb           t4, -258(a5)
                  lh           s11, -715(a5)
                  lh           t1, -151(s9)
                  sb           ra, -937(a5)
                  lbu          s3, -243(s9)
                  lb           s11, 79(s9)
                  lbu          t1, -455(a5)
                  lb           s6, -14(s9)
                  lb           s11, -1754(a5) #end load_store_instr_stream_1
                  sb           a6, -71(s9) #end load_store_instr_stream_0
                  la           s11, region_1+751 #start load_store_instr_stream_2
                  la           gp, region_1+745 #start load_store_instr_stream_3
                  la           s9, region_1+978 #start load_store_instr_stream_1
                  la           a6, region_1+1016 #start load_store_instr_stream_0
                  sb           t6, 46(gp)
                  lb           a5, -573(a6)
                  la           s8, region_1+1788 #start load_store_instr_stream_4
                  sb           s10, 108(s11)
                  lbu          a7, -46(gp)
                  lbu          tp, -452(s9)
                  lbu          s6, -52(s8)
                  lbu          s3, 115(s11)
                  lbu          t6, 324(a6)
                  lh           a4, -116(s9)
                  lbu          a2, 213(s11)
                  sb           gp, -441(a6)
                  sh           s4, 33(gp)
                  lb           t5, 110(s11)
                  lbu          s10, -764(s8)
                  sb           t1, -557(s9)
                  lb           s0, -82(s11)
                  lb           s3, -167(a6)
                  lh           tp, 50(s8)
                  lbu          a7, 629(s9)
                  sh           a1, -1664(s8)
                  sb           s11, -469(a6)
                  sb           sp, -597(s8)
                  lhu          a3, -19(gp)
                  sb           s7, -90(s11)
                  sb           t0, 183(s9)
                  lbu          a7, 138(s11)
                  lhu          ra, 21(gp)
                  lb           t4, 392(a6)
                  lhu          t0, 20(s8)
                  lbu          t3, -64(gp)
                  lw           zero, 526(s9)
                  sb           s9, -135(s9)
                  lb           s1, -1286(s8)
                  lh           zero, 764(s9) #end load_store_instr_stream_1
                  sb           s3, -1673(s8)
                  sh           s10, 60(a6)
                  lbu          s4, -40(gp) #end load_store_instr_stream_3
                  lb           sp, 50(s11) #end load_store_instr_stream_2
                  sb           a5, 703(a6)
                  lhu          tp, -372(s8) #end load_store_instr_stream_4
                  lhu          a2, 192(a6) #end load_store_instr_stream_0
                  la           a6, region_1+607 #start load_store_instr_stream_0
                  la           s9, region_0+1681 #start load_store_instr_stream_1
                  lb           s11, 198(s9)
                  lhu          a1, -887(s9)
                  lh           s11, 7(a6)
                  sh           a7, -243(s9)
                  sb           s6, -987(s9)
                  sh           s10, -7(a6)
                  lbu          t5, -828(s9)
                  lb           t1, 254(s9)
                  lb           s10, 12(a6)
                  lw           s10, -669(s9)
                  sb           s0, -471(s9) #end load_store_instr_stream_1
                  lhu          ra, 1(a6)
                  lb           t5, 5(a6) #end load_store_instr_stream_0
                  la           sp, region_1+860 #start riscv_load_store_rand_instr_stream_8
                  slt          a4, a3, t6
                  lbu          t3, -175(sp)
                  sll          ra, a0, gp
                  sltiu        a6, t6, -1320
                  remu         a4, s4, a0
                  lb           s1, 904(sp)
                  sltu         t0, s0, sp
                  nop
                  lb           s3, 33(sp)
                  c.add        s3, s0
                  lb           s4, 401(sp)
                  lbu          s11, 993(sp)
                  slli         a7, s3, 1
                  lb           a3, -349(sp)
                  lb           ra, -656(sp)
                  add          s7, a1, s9
                  lbu          a3, 982(sp)
                  sltu         a5, s11, a4
                  sb           a1, -119(sp)
                  c.slli       t6, 6
                  lbu          t1, 250(sp)
                  lb           s10, -802(sp)
                  lbu          a6, -89(sp)
                  srl          s7, s2, t0
                  sb           tp, 660(sp)
                  sb           gp, 907(sp)
                  lb           s9, 937(sp)
                  sw           s8, 956(sp)
                  addi         t1, a7, -376
                  c.sub        a4, s0
                  or           a2, s5, s11
                  rem          a1, s2, t5
                  remu         a1, a6, t2
                  lbu          t4, -318(sp) #end riscv_load_store_rand_instr_stream_8
                  la           t1, region_1+926 #start riscv_load_store_rand_instr_stream_9
                  remu         sp, s11, sp
                  lbu          s0, -5(t1)
                  sltiu        a1, t4, -1356
                  c.mv         t5, a1
                  lb           t4, 13(t1)
                  lbu          s9, 1(t1)
                  lhu          s1, 16(t1)
                  lb           a4, -7(t1)
                  slli         a2, s3, 11
                  lw           zero, 14(t1)
                  lh           t2, -16(t1)
                  c.add        t6, s1
                  sb           s11, -12(t1)
                  lbu          s9, 9(t1)
                  sb           s4, 5(t1)
                  lb           t4, 12(t1)
                  lb           s1, -11(t1)
                  addi         s11, t4, -56
                  divu         s11, s0, s10
                  mulh         s0, a3, s10
                  lbu          s10, 9(t1)
                  c.addi4spn   a5, sp, 336
                  c.slli       a1, 9
                  lhu          t0, -6(t1)
                  sw           t5, -6(t1)
                  lh           zero, 14(t1)
                  lb           s8, -16(t1)
                  sb           t5, 10(t1) #end riscv_load_store_rand_instr_stream_9
                  addi         a2, zero, -7 #init loop 0 counter
                  slt          s6, t0, s11
                  rem          t5, t0, t3
                  srai         t3, t1, 29
                  addi         zero, zero, 0 #init loop 0 limit
                  rem          a1, tp, gp
sub_4_114_0_t:    c.addi       t5, -1
                  addi         a2, a2, 7 #update loop 0 counter
                  sub          ra, a5, s4
                  c.bnez       a2, sub_4_114_0_t #branch for loop 0
                  c.srli       s1, 2
sub_4_50:         jal          t3, 5f
0:                jal          ra, 7f
1:                c.j          6f
2:                jal          ra, 1b
3:                jal          ra, 10f
4:                jal          s6, 9f
5:                c.j          8f
6:                jal          ra, 3b
7:                c.j          2b
8:                jal          ra, 4b
9:                c.j          0b
10:               div          t4, t2, s7
                  la           s9, amo_0+40 #start riscv_lr_sc_instr_stream_12
                  div          s11, s3, a4
                  c.xor        a5, s0
                  c.and        a3, s0
                  srai         s10, s7, 4
                  or           a4, tp, s7
                  c.add        t1, a4
                  lr.w          a1, (s9)
                  sltu         a4, t5, s0
                  srli         t1, s9, 29
                  auipc        a1, 72006
                  or           s3, a0, a0
                  c.xor        a4, a4
                  add          s10, s3, a7
                  sra          a1, s11, t1
                  sc.w.aq       t2, t2, (s9) #end riscv_lr_sc_instr_stream_12
                  la           a6, region_0+983 #start load_store_instr_stream_1
                  lbu          a4, 286(a6)
                  la           s3, region_0+1649 #start load_store_instr_stream_3
                  la           s7, region_0+315 #start load_store_instr_stream_0
                  lh           s4, -65(a6)
                  la           t1, region_0+216 #start load_store_instr_stream_2
                  lh           s6, 9(s7)
                  lb           gp, 256(s3)
                  lw           gp, 8(t1)
                  lb           s0, 443(a6)
                  lbu          a4, 224(s3)
                  lb           s6, -8(s7)
                  lbu          s11, -15(t1)
                  sh           a2, -11(s7)
                  lb           s6, 16(s7)
                  lb           a3, -13(t1)
                  sw           s9, -755(a6)
                  lbu          t0, 92(s3)
                  lh           t0, -2(t1)
                  sb           ra, 143(a6)
                  sb           s3, 4(s7)
                  lbu          sp, 1(t1)
                  lh           s1, 10(t1)
                  sb           a3, 5(t1)
                  sh           t5, -145(a6)
                  lb           a4, -12(s7)
                  lb           s8, 722(a6)
                  sb           t6, 6(t1)
                  lh           zero, -457(a6)
                  sb           t5, 152(s3)
                  lb           a7, -11(t1)
                  sb           sp, 352(a6) #end load_store_instr_stream_1
                  lb           sp, 9(s7)
                  lbu          s11, 144(s3) #end load_store_instr_stream_3
                  lb           s4, 2(s7)
                  lb           s9, -16(t1) #end load_store_instr_stream_2
                  lb           a3, -4(s7) #end load_store_instr_stream_0
                  la           a7, region_0+1233 #start riscv_load_store_hazard_instr_stream_8
                  lb           a5, 46(a7)
                  xor          a6, s1, s1
                  sb           s6, 46(a7)
                  lbu          a1, 46(a7)
                  lb           a5, 46(a7)
                  srl          a1, s6, t2
                  and          a2, s7, t0
                  sb           t1, 46(a7)
                  lbu          t3, 46(a7)
                  lb           t2, 226(a7)
                  lb           t3, 226(a7)
                  lb           a3, -99(a7)
                  lbu          a4, -80(a7)
                  sll          s4, a7, s11
                  c.add        s7, a4
                  sb           s8, -80(a7)
                  srli         ra, s8, 14
                  sb           t2, -80(a7)
                  c.nop
                  sb           t6, -80(a7)
                  lb           t3, -80(a7) #end riscv_load_store_hazard_instr_stream_8
                  addi         a1, zero, 10 #init loop 1 counter
                  c.or         s0, a3
                  addi         a6, zero, -6 #init loop 1 limit
                  add          t4, s8, t2
                  c.or         s0, a3
                  c.add        gp, t0
                  c.srai       a2, 24
                  mul          a3, a2, s8
sub_4_111_1_t:    ori          t6, s6, -1356
                  c.addi16sp   sp, 272
                  c.slli       s3, 8
                  srai         a5, a6, 16
                  addi         a1, a1, -10 #update loop 1 counter
                  and          t2, zero, t3
                  addi         s8, zero, 1 #init loop 0 counter
                  c.addi       a3, -1
                  xori         t4, s0, 725
                  addi         s4, zero, -13 #init loop 0 limit
                  nop
                  c.srai       s0, 16
                  slt          gp, s6, a2
                  c.andi       s1, 26
sub_4_111_0_t:    c.sub        s0, a1
                  lui          t4, 104511
                  c.slli       a4, 24
                  addi         s8, s8, -7 #update loop 0 counter
                  auipc        sp, 577053
                  c.addi16sp   sp, -16
                  sub          t5, t4, ra
                  beq          s8, s4, sub_4_111_0_t #branch for loop 0
                  mulhsu       ra, a1, a4
                  c.nop
                  bge          a1, a6, sub_4_111_1_t #branch for loop 1
                  addi         a7, s8, 1378
                  la           s7, region_0+267 #start riscv_hazard_instr_stream_4
                  sb           t0, -14(s7)
                  c.addi       t0, 13
                  srli         t0, s6, 14
                  lbu          s3, -35(s7)
                  c.addi       t0, -1
                  sltu         s3, t0, t0
                  sb           a2, -25(s7)
                  lbu          t6, -52(s7)
                  lh           t6, 19(s7)
                  sb           t0, 6(s7)
                  mul          zero, t6, a2
                  mulh         t6, a2, t0
                  sb           a2, 60(s7)
                  add          s6, s6, t6
                  lbu          a2, 35(s7)
                  lbu          a2, -1(s7)
                  remu         t6, zero, a2
                  srli         s6, t6, 22
                  lb           t6, -60(s7)
                  rem          a2, t6, s6
                  c.srai       a2, 10
                  div          zero, s6, t0
                  c.nop
                  lhu          a2, 35(s7)
                  lbu          s3, 40(s7)
                  lh           t6, 29(s7)
                  lhu          t6, 45(s7)
                  lb           t0, -33(s7)
                  sltiu        a2, s3, -1437
                  lbu          zero, -25(s7)
                  sb           t0, 46(s7)
                  lb           t6, -2(s7)
                  lhu          s3, 31(s7)
                  sh           s6, 31(s7)
                  lhu          t6, 7(s7)
                  lhu          s6, -57(s7)
                  sb           zero, 56(s7)
                  lbu          s6, -32(s7) #end riscv_hazard_instr_stream_4
sub_4_43:         jal          t3, 1f
0:                c.j          12f
1:                c.jal        10f
2:                jal          t1, 0b
3:                c.jal        2b
4:                c.jal        6f
5:                c.jal        8f
6:                c.j          11f
7:                c.jal        3b
8:                jal          t1, 4b
9:                jal          t6, 5b
10:               c.jal        9b
11:               c.j          7b
12:               divu         a5, a2, t3
sub_4_55:         jal          t3, 7f
0:                jal          s4, 9f
1:                c.j          2f
2:                c.j          15f
3:                jal          s0, 10f
4:                c.j          17f
5:                c.jal        6f
6:                c.j          0b
7:                c.j          18f
8:                c.j          3b
9:                c.j          14f
10:               c.jal        16f
11:               jal          ra, 1b
12:               c.j          4b
13:               jal          ra, 19f
14:               c.j          12b
15:               jal          sp, 5b
16:               c.j          11b
17:               jal          t1, 13b
18:               c.j          8b
19:               rem          ra, s7, s1
                  la           sp, region_1+1947 #start load_store_instr_stream_0
                  la           t6, region_0+1434 #start load_store_instr_stream_1
                  sb           a0, -1761(sp)
                  lb           a1, -2(t6)
                  lbu          gp, 15(t6)
                  lb           zero, -16(t6)
                  lb           t2, -1320(sp)
                  lh           t0, 16(t6)
                  sb           t1, 1(t6)
                  lb           s6, -1732(sp)
                  sb           s6, 11(t6)
                  sb           a0, 5(t6)
                  lbu          a3, 9(t6) #end load_store_instr_stream_1
                  lbu          a6, -1348(sp)
                  lbu          s6, -619(sp) #end load_store_instr_stream_0
                  la           sp, region_1+1760 #start riscv_load_store_rand_instr_stream_16
                  lbu          a3, -2(sp)
                  srli         t1, s7, 11
                  sh           a0, -138(sp)
                  c.sub        s0, a2
                  mulhu        a2, sp, s6
                  sll          s11, s11, a2
                  lbu          a5, 135(sp)
                  sb           a2, -156(sp)
                  sb           t5, -46(sp)
                  lb           ra, -46(sp)
                  c.lwsp       s1, 44(sp)
                  srli         a1, s8, 14
                  lb           t0, 161(sp)
                  sb           ra, -251(sp)
                  lb           t4, 63(sp)
                  lbu          t2, 118(sp)
                  lbu          t2, 166(sp)
                  sb           s6, 63(sp)
                  c.or         a4, a0
                  lbu          a5, -49(sp)
                  lb           s0, -24(sp)
                  div          s3, a6, t4
                  andi         s6, a3, -907
                  sb           a0, -159(sp)
                  c.or         s0, a0
                  sltu         a5, gp, s4
                  lb           a6, -173(sp)
                  lui          s8, 975668
                  sw           s3, 144(sp)
                  lbu          a1, -221(sp)
                  sb           t4, 65(sp)
                  sb           tp, -187(sp)
                  c.srli       a4, 8
                  mul          t0, ra, sp
                  sb           gp, 97(sp) #end riscv_load_store_rand_instr_stream_16
                  la           gp, region_1+1612 #start load_store_instr_stream_1
                  la           t5, region_1+862 #start load_store_instr_stream_2
                  la           sp, region_1+1143 #start load_store_instr_stream_0
                  la           a2, region_1+47 #start load_store_instr_stream_3
                  la           t2, region_1+674 #start load_store_instr_stream_4
                  sb           s8, -6(a2)
                  lb           s1, -205(t5)
                  sh           t5, 8(t2)
                  lb           s3, 49(gp)
                  lb           t3, -8(a2)
                  lbu          t0, -97(t5)
                  lbu          s10, 2(t2)
                  lb           a4, 8(a2)
                  lbu          s8, -34(sp)
                  lw           a5, 0(gp)
                  lbu          a4, 0(a2)
                  sh           a3, 6(gp)
                  lbu          t0, -51(gp)
                  lbu          a7, -12(a2)
                  lbu          zero, -1(t2)
                  lb           s4, 42(gp)
                  sb           t3, -10(t2)
                  lb           a3, -9(t2)
                  lbu          t3, 0(t2)
                  lbu          s9, 16(t2)
                  sb           s1, 8(a2)
                  lhu          s0, -15(sp)
                  lb           s8, -7(gp)
                  sb           zero, -42(sp)
                  lb           t3, 252(t5)
                  sb           sp, 6(gp)
                  sb           a4, 9(a2)
                  lb           tp, -10(a2)
                  sb           a6, -46(t5)
                  sb           a0, 9(t5)
                  sb           gp, -11(a2) #end load_store_instr_stream_3
                  lb           s10, 9(t2)
                  lb           a3, -55(sp)
                  sw           t6, 198(t5)
                  lbu          s7, 22(gp) #end load_store_instr_stream_1
                  lbu          s0, 240(t5) #end load_store_instr_stream_2
                  sb           s10, -3(t2) #end load_store_instr_stream_4
                  lbu          ra, 48(sp) #end load_store_instr_stream_0
                  la           sp, region_0+1201 #start riscv_hazard_instr_stream_13
                  remu         a6, s0, s6
                  mulhsu       s1, s1, a1
                  lb           s6, -8(sp)
                  remu         a1, a1, s0
                  lb           a6, -3(sp)
                  mulhsu       a6, s0, t2
                  mulhsu       s0, a6, a6
                  lbu          s0, 14(sp)
                  c.srai       a1, 8
                  srai         s0, t2, 9
                  mulh         s6, t2, a6
                  xori         t2, t2, -1087
                  c.andi       a1, 9
                  lhu          s0, -9(sp)
                  c.or         a1, s1
                  lhu          a6, 7(sp)
                  slli         t2, s0, 25
                  lbu          a1, -8(sp)
                  mul          s1, a1, a6
                  lhu          a1, -15(sp)
                  addi         s6, a6, -1726
                  ori          a1, s6, -1827
                  mulhu        t2, a1, a6
                  c.slli       a1, 29
                  lbu          s6, 12(sp)
                  remu         t2, s6, t2
                  remu         s6, a6, a6
                  lh           s0, -11(sp)
                  lbu          s6, -12(sp) #end riscv_hazard_instr_stream_13
                  la           a5, region_0+1391 #start riscv_load_store_rand_instr_stream_17
                  mulh         a1, s9, a3
                  sltu         s6, s1, s5
                  div          tp, s7, t2
                  lbu          s11, -213(a5)
                  srli         t6, t0, 1
                  mul          t0, a5, t3
                  sh           s7, 91(a5)
                  lbu          a6, 222(a5)
                  mulhu        tp, a0, tp
                  sb           a2, -234(a5)
                  lhu          s10, 155(a5)
                  srl          gp, a0, t0
                  sb           s3, 206(a5)
                  sb           s2, -188(a5)
                  sh           a1, -43(a5)
                  slti         tp, ra, 443
                  mul          ra, a3, a4
                  xori         sp, a7, -1137
                  lb           tp, -90(a5)
                  and          s3, s0, sp
                  lhu          t2, 75(a5)
                  sh           t1, 19(a5)
                  slli         t2, a7, 30
                  c.li         t5, -1
                  sb           s7, -207(a5)
                  andi         t1, s0, -649
                  lb           s11, 242(a5)
                  rem          a2, t6, zero
                  mulh         zero, s10, sp
                  srli         s10, s7, 30
                  or           s3, a3, s4
                  sub          a2, sp, gp
                  slt          s7, a4, t1
                  andi         zero, s7, -1301
                  srli         a6, s0, 18
                  sb           gp, 66(a5)
                  lb           t5, 222(a5)
                  c.slli       t2, 31
                  mulh         s3, s0, a6
                  lb           t6, 45(a5)
                  slti         s1, tp, 1607
                  remu         t2, t3, s5
                  lb           s9, 135(a5) #end riscv_load_store_rand_instr_stream_17
sub_4_44:         jal          t3, 1f
0:                c.j          10f
1:                c.jal        2f
2:                c.j          11f
3:                c.j          8f
4:                c.j          0b
5:                c.jal        4b
6:                jal          ra, 5b
7:                c.j          12f
8:                c.j          6b
9:                jal          ra, 7b
10:               jal          t1, 9b
11:               c.j          3b
12:               mulhsu       s1, s7, sp
                  la           t0, region_0+1011 #start load_store_instr_stream_1
                  la           gp, region_1+573 #start load_store_instr_stream_0
                  lh           t5, -49(t0)
                  lb           zero, -49(t0)
                  sh           t5, -143(gp)
                  lbu          t3, 57(t0)
                  sb           t6, 55(t0)
                  lw           tp, -35(t0)
                  sw           t2, -141(gp)
                  lb           t4, -46(t0)
                  sb           t5, 16(t0)
                  sh           s8, -147(gp)
                  lbu          a1, 24(t0)
                  lbu          a2, 248(gp)
                  lb           s9, -38(t0)
                  lb           a2, -90(gp)
                  lb           a2, 32(t0) #end load_store_instr_stream_1
                  lb           t1, 192(gp) #end load_store_instr_stream_0
                  la           a2, amo_0+52 #start riscv_lr_sc_instr_stream_1
                  xori         t3, s2, 1406
                  mulh         tp, t5, s8
                  c.slli       s6, 5
                  c.srli       s0, 1
                  mul          s8, t1, t2
                  c.lui        a6, 9
                  sra          s8, a6, t4
                  mulhu        s4, t5, s7
                  mulhu        s3, s11, t6
                  lr.w          gp, (a2)
                  mulh         t3, s3, s2
                  sc.w.aq       s6, t1, (a2) #end riscv_lr_sc_instr_stream_1
                  la           gp, region_1+159 #start riscv_hazard_instr_stream_20
                  sh           t4, 63(gp)
                  addi         a2, t4, -443
                  auipc        s1, 642505
                  sltiu        t2, s7, -1657
                  andi         s1, s9, 923
                  sb           s9, 4(gp)
                  slti         a2, a2, -2040
                  or           s9, s1, s7
                  c.mv         s1, a2
                  srl          s9, s7, s7
                  lh           s9, -61(gp)
                  lh           s7, -5(gp)
                  and          t2, s9, t4
                  sra          t4, s7, s9
                  ori          t4, t2, -1108
                  lb           a2, -50(gp)
                  sltu         s7, s1, s1
                  sltiu        s1, t4, -2041
                  slti         s7, s9, -304
                  nop
                  sb           t2, 32(gp)
                  c.mv         a2, s7
                  sb           a2, -19(gp)
                  lbu          s7, 27(gp)
                  add          s1, s1, t2
                  lb           t4, 22(gp)
                  xor          s1, t4, s9
                  c.lui        s9, 6
                  slt          s9, s1, s9
                  nop
                  ori          s9, t4, -256
                  sb           s9, -25(gp) #end riscv_hazard_instr_stream_20
                  la           t3, region_0+161 #start load_store_instr_stream_1
                  la           tp, region_0+984 #start load_store_instr_stream_0
                  la           gp, region_0+361 #start load_store_instr_stream_2
                  lb           a5, -4(gp)
                  lb           s3, 5(tp)
                  lbu          t6, 8(gp)
                  lbu          s10, 2(gp)
                  lbu          a3, -12(tp)
                  lh           s0, 5(gp)
                  lh           s1, 949(t3)
                  sh           a5, 1379(t3)
                  lb           a7, -3(tp)
                  lbu          t1, -14(gp)
                  lh           t4, -15(gp)
                  lb           a1, -11(tp)
                  lbu          sp, 145(t3)
                  sb           a3, -16(gp)
                  sb           s5, 3(tp)
                  lb           s6, 6(gp)
                  lb           t1, -8(tp)
                  lbu          zero, 658(t3)
                  lb           s6, 6(gp) #end load_store_instr_stream_2
                  sb           s10, 7(tp)
                  lbu          s6, 572(t3) #end load_store_instr_stream_1
                  sh           s4, 6(tp)
                  lbu          s9, -11(tp) #end load_store_instr_stream_0
                  la           s10, region_1+896 #start riscv_hazard_instr_stream_2
                  srl          a3, a3, s7
                  lh           s0, -878(s10)
                  sb           a3, 87(s10)
                  c.andi       s0, -1
                  and          s1, s7, s11
                  andi         s1, s1, 1112
                  srai         a3, a2, 8
                  c.li         a3, 9
                  lh           a2, -642(s10)
                  mulhu        s0, a3, s11
                  nop
                  c.li         a2, -1
                  lb           s11, 638(s10)
                  xori         s0, s1, 1803
                  sb           s1, -179(s10)
                  xor          s11, a2, a3
                  lb           s0, 654(s10)
                  mulhsu       a3, a3, a2
                  c.srai       s0, 22
                  mulhsu       s11, s11, s7
                  c.addi       s7, 6
                  c.lui        s11, 30
                  slli         s1, s1, 13
                  addi         a2, s1, 110
                  c.lui        a2, 24
                  divu         s11, a2, s7
                  sub          a2, s11, s7
                  c.and        s0, s0
                  c.and        s1, s0
                  lbu          a3, 293(s10)
                  srli         s11, a3, 5
                  lb           a3, 353(s10)
                  lbu          s7, -890(s10)
                  srl          s1, s7, a2
                  lui          a3, 260797
                  c.addi       s0, 3
                  srl          a3, a3, s1
                  sra          s1, s0, s11
                  srli         s11, a2, 20
                  lh           a2, 954(s10) #end riscv_hazard_instr_stream_2
                  la           sp, region_1+1058 #start riscv_hazard_instr_stream_6
                  lb           a2, -59(sp)
                  srai         t1, t1, 18
                  lbu          t1, -81(sp)
                  lhu          t5, 38(sp)
                  sh           t1, -40(sp)
                  sh           t5, -234(sp)
                  lh           t4, -222(sp)
                  slt          s1, t4, s1
                  sh           s1, 44(sp)
                  sb           a2, 108(sp)
                  sub          s1, s10, t1
                  rem          t5, t4, t4
                  c.sub        a2, a2
                  rem          t4, a2, s1
                  c.nop
                  sll          t5, s10, a2
                  lbu          t5, -166(sp)
                  mulhsu       t4, s10, s1
                  sb           t1, -65(sp)
                  mulhsu       s1, s10, t1
                  c.and        a2, a2
                  c.addi       s1, -1
                  andi         a2, s10, 1497
                  c.lui        t5, 3
                  c.and        s1, a2
                  lbu          s1, -124(sp)
                  lhu          t1, -156(sp)
                  slt          t5, a2, t5
                  lh           a2, -162(sp)
                  c.srai       s1, 25
                  srai         t1, t5, 17
                  c.add        s10, s1
                  c.add        t5, a2
                  lbu          t1, 246(sp)
                  sh           t1, -212(sp) #end riscv_hazard_instr_stream_6
                  la           gp, region_1+1345 #start riscv_load_store_rand_instr_stream_7
                  sb           tp, 4(gp)
                  c.nop
                  lui          s1, 820889
                  add          a5, a1, s3
                  sb           zero, 6(gp)
                  xor          a6, t3, gp
                  and          a2, s0, a3
                  lbu          a4, -58(gp)
                  lhu          sp, -19(gp)
                  sb           a5, -28(gp)
                  lb           s9, 49(gp)
                  sb           ra, 12(gp)
                  srai         a6, a5, 19
                  add          a3, s6, s8
                  lb           tp, -51(gp)
                  mulhsu       t4, s2, s4
                  lbu          tp, -20(gp)
                  mulh         t6, ra, a5
                  lui          zero, 612
                  lbu          a2, -20(gp)
                  sb           t5, -20(gp)
                  srli         s3, a3, 4
                  sltu         a6, t2, t3
                  lh           a5, -41(gp)
                  lhu          a6, 51(gp)
                  lb           s1, 53(gp)
                  nop
                  sb           s1, -52(gp)
                  sb           sp, -48(gp)
                  lhu          t3, -29(gp)
                  lb           t2, -53(gp)
                  lbu          t4, -60(gp)
                  c.xor        s1, a5
                  lb           zero, 60(gp)
                  sb           s4, 4(gp) #end riscv_load_store_rand_instr_stream_7
                  la           a6, region_1+1383 #start riscv_hazard_instr_stream_0
                  lbu          a2, -1(a6)
                  c.lui        s10, 3
                  slti         ra, t3, 1015
                  nop
                  srai         ra, s0, 2
                  sh           s0, -11(a6)
                  remu         s8, s0, a2
                  divu         a2, s8, a2
                  nop
                  mulhu        s10, s8, ra
                  sb           a2, -9(a6)
                  mulhsu       t3, s0, t3
                  lbu          t3, 4(a6)
                  lbu          t3, 1(a6)
                  lb           s8, 10(a6)
                  lbu          s10, -10(a6)
                  sb           t3, 14(a6)
                  sh           ra, -9(a6)
                  srl          s8, s8, s10
                  lbu          t3, 11(a6)
                  c.slli       s8, 24
                  lb           s8, 3(a6)
                  c.and        a2, s0
                  sll          s10, s10, ra
                  sb           t3, 8(a6)
                  sb           ra, -4(a6)
                  c.mv         ra, a2
                  lh           s10, -13(a6)
                  lbu          t3, -1(a6)
                  sb           s10, 13(a6)
                  andi         s0, ra, 119
                  add          s0, t3, t3
                  slt          t3, ra, a2
                  lbu          a2, -1(a6)
                  c.and        s0, a2
                  or           s0, s8, t3
                  sltu         s8, s10, s0
                  sh           s8, -9(a6)
                  lb           s8, 3(a6)
                  andi         ra, ra, 506
                  lb           a2, -16(a6)
                  slli         a2, t3, 5
                  add          s10, s0, a2
                  lbu          t3, 8(a6)
                  lb           s0, 14(a6)
                  srl          ra, s0, ra
                  lb           ra, -9(a6)
                  rem          ra, s10, s0
                  c.sub        a2, a2
                  xor          s8, s10, ra
                  or           ra, t3, ra
                  lb           s10, 1(a6)
                  sb           t3, -16(a6) #end riscv_hazard_instr_stream_0
                  la           t4, amo_0+32 #start riscv_lr_sc_instr_stream_0
                  c.addi4spn   a2, sp, 240
                  lr.w          gp, (t4)
                  addi         t2, s3, 873
                  c.and        a5, a2
                  c.srli       s0, 1
                  ori          s0, s8, 18
                  lui          s0, 598347
                  c.li         tp, 18
                  sc.w.aq       t0, t0, (t4) #end riscv_lr_sc_instr_stream_0
                  la           sp, region_0+680 #start riscv_load_store_rand_instr_stream_1
                  sltu         tp, s11, a5
                  lw           s6, 192(sp)
                  sb           s8, -145(sp)
                  lhu          a4, 192(sp)
                  sb           t2, -118(sp)
                  sb           s9, -115(sp)
                  sb           s5, 122(sp)
                  lb           s11, 91(sp)
                  sh           t5, -180(sp)
                  lb           t1, 49(sp)
                  lhu          s7, 172(sp)
                  lbu          s7, -177(sp)
                  rem          s3, s7, t4
                  lb           gp, -60(sp)
                  lhu          t6, -58(sp)
                  ori          a7, t1, 444
                  ori          t0, s0, 1133
                  mulh         s7, s4, s0
                  mulhu        t5, s2, t6
                  or           s7, t2, s6
                  nop
                  lhu          s0, -208(sp)
                  lbu          t4, 82(sp)
                  c.slli       t2, 20
                  lbu          s3, -190(sp)
                  lbu          s4, -252(sp)
                  lh           t5, -62(sp)
                  auipc        a4, 594678
                  rem          a4, t4, s5
                  lhu          t3, -158(sp)
                  mulhsu       gp, ra, t0
                  lh           a4, -70(sp)
                  sh           s9, -192(sp)
                  lbu          s1, -87(sp)
                  nop
                  lbu          s4, -136(sp)
                  lb           t4, -207(sp) #end riscv_load_store_rand_instr_stream_1
                  la           t1, region_0+623 #start load_store_instr_stream_1
                  lhu          t2, 27(t1)
                  la           sp, region_1+1106 #start load_store_instr_stream_0
                  sb           a4, 74(t1)
                  lb           s4, 89(sp)
                  lb           gp, 14(t1)
                  lb           a5, 349(sp)
                  lb           t4, -176(t1)
                  sb           a3, 151(sp)
                  sh           t6, 159(t1)
                  lhu          t5, 684(sp)
                  lb           a6, -111(t1)
                  lb           t5, 174(t1) #end load_store_instr_stream_1
                  lbu          s11, -1047(sp) #end load_store_instr_stream_0
sub_4_52:         jal          t3, 25f
0:                c.jal        9f
1:                c.j          3f
2:                jal          t1, 17f
3:                c.j          26f
4:                jal          t1, 14f
5:                c.j          1b
6:                c.jal        5b
7:                jal          ra, 22f
8:                c.j          15f
9:                c.jal        16f
10:               jal          ra, 13f
11:               c.j          6b
12:               c.jal        8b
13:               c.jal        11b
14:               c.jal        20f
15:               c.jal        19f
16:               jal          s4, 24f
17:               c.j          12b
18:               c.jal        4b
19:               c.jal        0b
20:               c.j          23f
21:               c.j          10b
22:               c.j          18b
23:               jal          ra, 21b
24:               c.j          7b
25:               jal          t1, 2b
26:               nop
                  addi         s11, zero, 9 #init loop 1 counter
                  addi         t5, zero, 15 #init loop 1 limit
sub_4_109_1_t:    nop
                  addi         s11, s11, 7 #update loop 1 counter
                  addi         a1, zero, -8 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  slli         a2, s7, 19
sub_4_109_0_t:    mul          t1, s0, a6
                  addi         a1, a1, 2 #update loop 0 counter
                  c.bnez       a1, sub_4_109_0_t #branch for loop 0
                  blt          s11, t5, sub_4_109_1_t #branch for loop 1
                  c.xor        a4, a4
                  la           s7, region_0+1968 #start riscv_load_store_hazard_instr_stream_2
                  sh           s5, -1046(s7)
                  sb           a7, -1046(s7)
                  mulhu        tp, s7, t4
                  lbu          t0, -1722(s7)
                  lh           s6, -1722(s7)
                  lb           s8, -1722(s7)
                  sb           a4, -1722(s7)
                  sra          s8, s6, t2
                  sh           t0, -1722(s7)
                  sh           s7, -238(s7)
                  c.andi       s1, 2
                  lbu          a7, -238(s7)
                  lb           a5, -238(s7)
                  lb           ra, -238(s7)
                  c.or         a3, a0
                  c.srli       a1, 17
                  lhu          s8, -238(s7)
                  srai         s10, t6, 12
                  lbu          a5, -238(s7)
                  lhu          a2, -1098(s7)
                  lb           a7, -1098(s7)
                  c.li         s10, 6
                  sh           a7, -1098(s7) #end riscv_load_store_hazard_instr_stream_2
                  la           a2, region_1+1493 #start load_store_instr_stream_1
                  la           t1, region_0+448 #start load_store_instr_stream_0
                  sh           t2, 276(t1)
                  lbu          s11, -9(a2)
                  sb           zero, 8(a2)
                  sb           a2, 16(a2)
                  lbu          a5, 2(a2)
                  lb           a3, 832(t1)
                  sb           s10, -265(t1)
                  lb           a3, 145(t1)
                  sb           t3, 13(a2) #end load_store_instr_stream_1
                  lbu          ra, 797(t1)
                  lh           s1, -52(t1)
                  lb           gp, -413(t1)
                  lhu          a5, -246(t1) #end load_store_instr_stream_0
                  la           s7, region_0+1011 #start riscv_load_store_rand_instr_stream_2
                  ori          a6, s1, -1882
                  sh           gp, -157(s7)
                  sb           s1, 975(s7)
                  sb           a6, 638(s7)
                  sb           s8, 634(s7)
                  mulhu        t3, tp, s9
                  lui          s10, 78220
                  sb           a7, -188(s7)
                  lui          t2, 755459
                  lhu          zero, 311(s7)
                  sb           s2, 446(s7)
                  remu         a1, s9, t3
                  lb           s1, 488(s7)
                  c.srai       s0, 2
                  srli         gp, sp, 27
                  sb           s7, -332(s7)
                  c.or         a1, a4
                  mulh         s10, s6, s0
                  lb           a5, -785(s7)
                  addi         s9, t1, 709
                  sb           a3, 169(s7)
                  lbu          a2, 382(s7)
                  sb           s9, 410(s7)
                  sb           t4, -627(s7)
                  srl          zero, s11, tp
                  sb           t4, 119(s7)
                  c.xor        s1, s0
                  lui          t1, 612812
                  lb           t0, -722(s7)
                  lw           s0, -739(s7)
                  lw           s0, -655(s7)
                  c.lui        s8, 19
                  lbu          s8, -726(s7)
                  lb           tp, -51(s7)
                  c.andi       a4, 29
                  slt          s6, s1, s4
                  lbu          s9, 372(s7)
                  c.mv         s6, a1
                  lbu          t3, -493(s7)
                  slt          t4, s4, s11
                  lh           t1, 289(s7)
                  lbu          s9, -139(s7)
                  c.li         s10, 13
                  c.srli       a5, 20
                  c.xor        a4, a3
                  lbu          t4, 347(s7)
                  sub          a1, t2, s9
                  lbu          t5, -176(s7)
                  xori         a1, s0, -412
                  lbu          a6, -934(s7)
                  lbu          t2, 146(s7)
                  sub          a5, a0, s1
                  lb           ra, 632(s7) #end riscv_load_store_rand_instr_stream_2
                  la           s6, amo_0+56 #start riscv_lr_sc_instr_stream_14
                  lr.w          t3, (s6)
                  c.or         a2, a4
                  sc.w          t1, s8, (s6) #end riscv_lr_sc_instr_stream_14
                  la           s10, region_0+740 #start riscv_load_store_hazard_instr_stream_15
                  sw           s6, 124(s10)
                  sb           a4, 124(s10)
                  lhu          a3, 124(s10)
                  div          sp, t2, sp
                  lb           t1, 124(s10)
                  lbu          t5, 124(s10)
                  sh           a5, 124(s10)
                  lw           gp, 124(s10)
                  c.li         a3, 25
                  lbu          t3, 124(s10)
                  lbu          s11, 124(s10)
                  sb           t6, 124(s10) #end riscv_load_store_hazard_instr_stream_15
                  addi         t2, zero, 3 #init loop 1 counter
                  mulh         t1, t1, ra
                  add          s1, a4, a5
                  srl          s1, a1, gp
                  c.or         a5, s0
                  addi         s6, zero, -12 #init loop 1 limit
                  sub          a7, a2, s11
                  xori         a4, t2, 1563
                  c.addi4spn   a4, sp, 304
                  slt          t1, s1, t2
                  remu         zero, ra, s2
sub_4_100_1_t:    c.lui        a6, 6
                  mulhu        a3, sp, a2
                  c.srli       a2, 4
                  addi         t2, t2, -3 #update loop 1 counter
                  addi         s11, zero, 10 #init loop 0 counter
                  div          t5, s1, s7
                  addi         a1, zero, 10 #init loop 0 limit
                  nop
sub_4_100_0_t:    c.lui        t4, 18
                  nop
                  c.srli       a2, 30
                  xor          a6, s5, a5
                  addi         s11, s11, -9 #update loop 0 counter
                  mulhsu       s7, a2, t1
                  bgeu         s11, a1, sub_4_100_0_t #branch for loop 0
                  c.addi16sp   sp, 160
                  c.mv         a5, t0
                  beq          t2, s6, sub_4_100_1_t #branch for loop 1
                  c.addi16sp   sp, 176
sub_4_51:         jal          t3, 17f
0:                jal          ra, 6f
1:                c.jal        16f
2:                jal          t1, 14f
3:                c.jal        25f
4:                jal          ra, 10f
5:                c.j          1b
6:                c.jal        12f
7:                jal          ra, 4b
8:                c.j          21f
9:                jal          ra, 8b
10:               jal          t5, 20f
11:               jal          a1, 3b
12:               jal          t1, 13f
13:               jal          a3, 2b
14:               c.j          19f
15:               jal          ra, 9b
16:               c.jal        0b
17:               c.j          23f
18:               c.j          7b
19:               c.j          22f
20:               c.j          15b
21:               c.j          11b
22:               c.jal        24f
23:               c.j          5b
24:               c.jal        18b
25:               xor          t3, a4, s7
                  la           s9, region_1+631 #start load_store_instr_stream_0
                  la           s8, region_0+1852 #start load_store_instr_stream_1
                  lb           a4, 588(s9)
                  lbu          a7, -61(s8)
                  lh           t3, 987(s9)
                  sw           sp, -904(s8)
                  lhu          s0, -531(s9)
                  lhu          t0, -160(s8)
                  lb           a6, 519(s9)
                  lb           t2, -1849(s8)
                  lhu          a5, -174(s8)
                  lhu          s4, -591(s9)
                  lh           a5, -1548(s8)
                  sh           t1, 1077(s9)
                  sh           s3, -750(s8)
                  lb           a7, 1320(s9)
                  lbu          zero, -825(s8) #end load_store_instr_stream_1
                  lhu          s10, 885(s9)
                  lhu          t0, 1061(s9) #end load_store_instr_stream_0
                  la           sp, region_0+1134 #start riscv_hazard_instr_stream_1
                  divu         s6, t3, s6
                  lb           s6, 317(sp)
                  lw           s4, -186(sp)
                  mulhsu       s4, t3, s9
                  lb           s6, -828(sp)
                  c.or         a4, a5
                  ori          s4, a4, 546
                  lbu          s6, -1123(sp)
                  lhu          t3, -268(sp)
                  lw           a4, -610(sp)
                  lb           a5, -915(sp)
                  sb           s4, -985(sp)
                  srl          s6, s9, s4
                  xor          s4, t3, s4
                  sb           s6, -592(sp)
                  lbu          a5, 845(sp)
                  sw           a4, -930(sp)
                  rem          t3, s4, t3
                  lbu          s6, 792(sp)
                  lb           s4, 778(sp)
                  remu         a4, a4, s4
                  sb           a4, -659(sp)
                  lhu          a5, -40(sp)
                  lb           t3, -861(sp)
                  xor          a5, s9, t3
                  lb           a4, -1025(sp)
                  sb           s6, -15(sp)
                  lbu          a4, -1132(sp)
                  lw           a4, -314(sp)
                  lb           s4, 653(sp)
                  lb           t3, 81(sp)
                  lbu          a4, -897(sp)
                  c.lui        a5, 26
                  lbu          t3, 139(sp)
                  lh           a4, 268(sp) #end riscv_hazard_instr_stream_1
                  la           s8, region_0+927 #start load_store_instr_stream_1
                  lb           s6, -14(s8)
                  la           t0, region_1+1153 #start load_store_instr_stream_0
                  lb           s3, -30(s8)
                  lbu          a7, -1(t0)
                  lhu          s7, 31(s8)
                  lbu          a2, 8(t0)
                  lbu          s9, -6(t0)
                  sw           zero, -11(s8)
                  lbu          t6, -6(s8)
                  lb           a3, 6(t0)
                  lhu          ra, -7(t0)
                  lbu          ra, 3(s8)
                  lbu          t5, -4(s8)
                  sb           t2, 28(s8)
                  lb           ra, -2(s8) #end load_store_instr_stream_1
                  sb           t0, 12(t0)
                  sh           t3, -5(t0) #end load_store_instr_stream_0
                  la           s1, amo_0+24 #start riscv_amo_instr_stream_3
                  la           t1, amo_0+12
                  la           t4, amo_0+0
                  la           sp, amo_0+48
                  c.sub        a3, s1
                  c.lui        s0, 25
                  sra          a3, t2, s1
                  srai         s4, s2, 21
                  amoor.w.aq    gp, a7, (sp)
                  andi         s7, a4, 1547
                  amoand.w.rl   a7, s0, (sp)
                  amomin.w.rl   s6, s9, (s1)
                  amoand.w.rl   s11, a0, (t1)
                  amoand.w.rl   s10, s1, (sp)
                  amoswap.w     a6, a7, (sp)
                  amomaxu.w     s6, a7, (sp)
                  amomax.w.rl   s11, a6, (sp) #end riscv_amo_instr_stream_3
                  la           t1, region_0+930 #start riscv_load_store_rand_instr_stream_6
                  c.lui        t6, 23
                  ori          a5, s4, 1247
                  slt          t6, s4, t4
                  sb           s11, -186(t1)
                  c.lui        s4, 7
                  lbu          t0, -677(t1)
                  xor          gp, s7, t6
                  c.li         ra, -1
                  c.srli       a2, 24
                  sb           t4, -696(t1)
                  c.addi       a1, 17
                  lb           s9, -211(t1)
                  lb           t0, -787(t1)
                  sltu         tp, a0, t3
                  c.xor        a4, a1
                  remu         a1, tp, a5
                  sb           s8, 473(t1)
                  c.add        s6, s2
                  srai         t5, s0, 11
                  lh           a5, 294(t1)
                  sb           a5, 201(t1)
                  lb           a6, 773(t1)
                  lb           s0, -664(t1)
                  sb           s1, 488(t1)
                  lb           t2, -69(t1)
                  c.srai       a4, 1
                  lbu          a5, 505(t1)
                  sb           tp, -561(t1) #end riscv_load_store_rand_instr_stream_6
                  la           a3, amo_0+44 #start riscv_lr_sc_instr_stream_5
                  slli         s8, t5, 21
                  lr.w.rl       s6, (a3)
                  lui          a1, 641846
                  div          tp, t0, s6
                  c.addi16sp   sp, 208
                  c.lui        ra, 21
                  auipc        a1, 977224
                  remu         zero, sp, s0
                  remu         t0, s9, t6
                  nop
                  c.nop
                  slt          a2, a2, gp
                  c.lui        s9, 1
                  c.slli       t6, 9
                  sc.w.rl       zero, t4, (a3) #end riscv_lr_sc_instr_stream_5
                  la           t1, region_0+31 #start load_store_instr_stream_1
                  la           gp, region_0+1253 #start load_store_instr_stream_2
                  la           t6, region_0+1352 #start load_store_instr_stream_0
                  sb           t1, 134(t1)
                  sb           tp, -248(gp)
                  sw           s1, 227(gp)
                  sb           s0, -521(t6)
                  sb           a2, 229(gp)
                  sb           t6, 30(t1)
                  sh           a1, 203(gp)
                  sh           a7, 149(t1)
                  lb           s8, -6(gp)
                  sb           t0, -230(gp)
                  lbu          a2, -103(t6)
                  lbu          s7, 222(gp)
                  lbu          s6, 87(t1)
                  sh           t1, 562(t6)
                  lb           s1, -253(t6)
                  lb           s3, 106(gp)
                  sb           a5, 28(t1)
                  sh           t6, 209(t1)
                  sb           s1, -1317(t6)
                  sb           s4, 160(t1)
                  lh           s7, 243(t1) #end load_store_instr_stream_1
                  lbu          s10, -732(t6)
                  sb           a4, -30(gp) #end load_store_instr_stream_2
                  sb           tp, -1300(t6)
                  lbu          s9, -53(t6) #end load_store_instr_stream_0
                  la           s10, region_1+1449 #start load_store_instr_stream_1
                  sb           gp, 10(s10)
                  la           gp, region_0+445 #start load_store_instr_stream_0
                  lh           tp, 59(gp)
                  sh           s3, 3(s10)
                  lbu          s6, 12(s10)
                  lb           t0, -10(s10)
                  sb           s6, 18(gp)
                  lb           s0, -52(gp)
                  sh           s6, -3(gp)
                  lw           t3, 23(gp)
                  lh           a4, 15(gp)
                  lbu          sp, 8(s10) #end load_store_instr_stream_1
                  lw           s4, -37(gp) #end load_store_instr_stream_0
                  la           a7, region_0+1909 #start riscv_load_store_hazard_instr_stream_6
                  lb           a5, 47(a7)
                  sb           t4, 47(a7)
                  lw           t2, 47(a7)
                  sb           t2, -24(a7)
                  lbu          s1, -24(a7)
                  sb           a2, 22(a7)
                  sb           t3, 22(a7)
                  srl          s9, a5, s3
                  lb           a5, 63(a7)
                  lb           s10, 63(a7)
                  lhu          s4, 63(a7)
                  sw           a2, 63(a7) #end riscv_load_store_hazard_instr_stream_6
                  la           t1, region_0+1547 #start load_store_instr_stream_3
                  la           a4, region_0+1029 #start load_store_instr_stream_2
                  sb           a3, -97(a4)
                  la           s9, region_0+1710 #start load_store_instr_stream_0
                  lbu          s6, -60(a4)
                  lb           t4, 160(a4)
                  la           s8, region_0+1590 #start load_store_instr_stream_1
                  sb           a0, -871(s9)
                  sb           gp, 193(a4)
                  lhu          a3, -1124(s8)
                  lhu          gp, -181(a4)
                  sb           s4, -1151(s9)
                  lbu          s0, 317(s8)
                  lb           sp, -1108(s8)
                  sb           t2, -16(t1)
                  sb           s7, 162(s9)
                  lb           zero, -1(t1)
                  sb           tp, -556(s8)
                  sw           s1, 5(t1)
                  lbu          a5, -1659(s9)
                  lh           s1, -158(s8)
                  lbu          s4, -62(a4)
                  sb           tp, -407(s9)
                  lb           s7, -130(a4)
                  sb           s10, 12(t1)
                  sb           s2, -1633(s9)
                  sb           t0, 12(t1)
                  lb           t4, 168(a4)
                  sb           tp, -10(t1)
                  lb           s6, 325(s8)
                  sw           s2, -866(s9)
                  sb           s9, 2(t1)
                  sb           t4, -74(s8)
                  lb           s4, 327(s8)
                  lhu          s10, -552(s8)
                  lb           t0, -20(a4)
                  lhu          t6, -9(t1) #end load_store_instr_stream_3
                  lbu          s1, -570(s8) #end load_store_instr_stream_1
                  sb           sp, 182(s9)
                  sb           t3, 182(a4) #end load_store_instr_stream_2
                  lbu          t6, -1005(s9) #end load_store_instr_stream_0
                  la           tp, region_0+812 #start load_store_instr_stream_0
                  la           s11, region_1+522 #start load_store_instr_stream_1
                  lbu          zero, 49(s11)
                  sh           s9, 38(s11)
                  sb           t4, -29(tp)
                  lb           a3, 1(tp)
                  sw           s9, 22(s11)
                  lb           gp, 45(tp)
                  lbu          s6, 9(s11)
                  sh           a0, 64(s11)
                  lw           a7, -12(tp)
                  lb           s9, 48(s11)
                  sh           zero, -24(s11)
                  lw           s1, -40(tp)
                  lb           s8, -56(tp)
                  lb           a5, -40(tp)
                  lb           a1, 37(s11)
                  lb           a3, 1(s11) #end load_store_instr_stream_1
                  sb           s8, 43(tp) #end load_store_instr_stream_0
sub_4_42:         jal          t3, 21f
0:                c.j          14f
1:                jal          ra, 9f
2:                c.j          6f
3:                c.jal        19f
4:                c.jal        23f
5:                jal          ra, 17f
6:                jal          ra, 3b
7:                c.jal        5b
8:                c.jal        4b
9:                c.j          7b
10:               jal          ra, 13f
11:               c.jal        26f
12:               c.jal        11b
13:               c.j          1b
14:               c.jal        10b
15:               jal          ra, 18f
16:               c.j          15b
17:               c.jal        25f
18:               c.j          2b
19:               c.jal        12b
20:               jal          ra, 0b
21:               c.j          24f
22:               jal          s3, 20b
23:               c.j          16b
24:               c.jal        22b
25:               c.jal        8b
26:               mulhsu       t6, a4, t2
sub_4_53:         jal          t3, 13f
0:                c.j          2f
1:                c.jal        6f
2:                c.jal        4f
3:                c.jal        11f
4:                c.j          7f
5:                jal          tp, 0b
6:                c.jal        15f
7:                c.j          9f
8:                jal          t1, 12f
9:                c.j          3b
10:               c.jal        5b
11:               c.j          1b
12:               c.j          10b
13:               jal          t1, 14f
14:               c.j          8b
15:               c.andi       a5, -1
                  la           s0, region_1+1616 #start riscv_load_store_hazard_instr_stream_10
                  lbu          s1, -1603(s0)
                  lb           a4, -1079(s0)
                  sb           tp, -939(s0)
                  sb           s0, -1590(s0)
                  sb           s6, -1590(s0)
                  lbu          tp, -27(s0)
                  sb           a5, -211(s0)
                  lh           s9, 184(s0)
                  lb           s6, -334(s0)
                  lbu          s10, -334(s0)
                  lb           a4, -171(s0)
                  sh           a4, -742(s0)
                  mulhsu       s3, t0, s2
                  lbu          a1, -213(s0)
                  sb           t4, 158(s0)
                  lbu          a2, -1023(s0)
                  mulhu        ra, a5, a2
                  lhu          zero, 258(s0)
                  add          t3, tp, zero
                  sb           a0, 135(s0) #end riscv_load_store_hazard_instr_stream_10
                  la           s11, region_1+502 #start load_store_instr_stream_0
                  la           sp, region_1+76 #start load_store_instr_stream_1
                  sw           s7, -14(s11)
                  lw           gp, -8(sp)
                  lb           t5, -1(s11)
                  sb           sp, 1399(sp)
                  sw           s10, 1368(sp)
                  lbu          s3, 3(s11)
                  lhu          a6, 1724(sp)
                  sb           s4, 7(s11)
                  sb           ra, 11(s11)
                  lbu          a5, 164(sp) #end load_store_instr_stream_1
                  sb           s9, -3(s11) #end load_store_instr_stream_0
                  la           s0, amo_0+36 #start riscv_amo_instr_stream_8
                  amomaxu.w.aq  s11, a6, (s0) #end riscv_amo_instr_stream_8
                  la           t6, region_0+280 #start riscv_load_store_hazard_instr_stream_12
                  sb           s4, 53(t6)
                  lb           t5, 53(t6)
                  sb           a3, 53(t6)
                  lhu          a1, 34(t6)
                  lb           s10, 34(t6)
                  lh           a6, 34(t6)
                  lb           a7, 34(t6)
                  lb           s7, 34(t6)
                  lh           tp, -46(t6)
                  sh           t0, -46(t6)
                  srl          s8, t1, a3
                  sb           s8, -15(t6)
                  sb           a5, -15(t6)
                  lbu          gp, -15(t6)
                  sb           sp, -15(t6)
                  lw           t1, -12(t6)
                  lh           t4, -4(t6)
                  sb           s5, -4(t6)
                  sh           tp, -34(t6)
                  lb           a6, -34(t6) #end riscv_load_store_hazard_instr_stream_12
                  la           a7, region_1+1376 #start load_store_instr_stream_2
                  sb           a4, 37(a7)
                  la           t1, region_1+1774 #start load_store_instr_stream_0
                  lb           tp, 26(a7)
                  lbu          s6, -39(a7)
                  lbu          s10, -997(t1)
                  lbu          gp, -58(a7)
                  la           t2, region_1+641 #start load_store_instr_stream_1
                  sb           t5, -554(t1)
                  lbu          s10, 5(t2)
                  sh           s0, 3(t2)
                  lh           s1, -956(t1)
                  lh           a4, 20(a7)
                  sb           s9, -30(a7)
                  lbu          a4, -16(t2)
                  lh           tp, -264(t1)
                  sh           a2, -3(t2)
                  lbu          s0, 13(t2)
                  lbu          s11, -15(t2)
                  lh           a2, -34(a7)
                  lbu          s9, 14(t2)
                  lh           tp, -1448(t1)
                  lb           s4, 15(t2)
                  sh           a3, 178(t1)
                  sw           tp, -9(t2)
                  lbu          s6, -613(t1)
                  lb           t3, -59(a7)
                  lbu          gp, 2(t2) #end load_store_instr_stream_1
                  lb           s4, -49(a7)
                  sb           s9, -33(a7) #end load_store_instr_stream_2
                  sw           s9, -722(t1) #end load_store_instr_stream_0
                  la           s0, region_0+1149 #start riscv_load_store_hazard_instr_stream_20
                  lbu          ra, 160(s0)
                  c.sub        a5, a3
                  sb           s8, -170(s0)
                  sw           s4, 19(s0)
                  divu         gp, gp, a0
                  lw           a5, -225(s0)
                  lbu          gp, 24(s0)
                  c.lui        a3, 23
                  lh           s7, 33(s0)
                  lb           t5, -26(s0)
                  lhu          t6, -145(s0)
                  c.srai       a5, 30
                  sb           a0, -145(s0)
                  sb           t6, 51(s0)
                  and          s3, a4, s1
                  sb           t2, -109(s0)
                  remu         s8, t5, a5
                  lh           t0, -53(s0)
                  lbu          t2, 184(s0) #end riscv_load_store_hazard_instr_stream_20
                  la           sp, region_1+248 #start riscv_load_store_rand_instr_stream_4
                  lbu          a2, 1247(sp)
                  lhu          zero, 1348(sp)
                  mulhu        a3, t1, a0
                  sra          zero, s3, a5
                  divu         a1, s7, s8
                  addi         a3, a4, 921
                  mulhsu       t2, ra, a0
                  sb           a0, 978(sp)
                  lui          s7, 571568
                  sll          t2, a6, s11
                  c.or         s1, a3
                  div          s11, a3, t3
                  add          a1, s4, s3
                  slt          s3, s8, t4
                  rem          a4, tp, a7
                  slli         s3, s10, 2
                  c.srli       a3, 24
                  lb           s4, 1067(sp)
                  sll          a2, s4, t3
                  c.lui        a2, 13
                  c.addi       t1, 30
                  rem          t5, t5, a1
                  and          s10, s4, s8
                  andi         a1, zero, -1217
                  nop
                  mulhu        a3, tp, t0
                  slti         a4, s10, 1933
                  slti         a3, t1, -1276
                  lbu          gp, 1669(sp)
                  c.or         a4, s0
                  sb           a0, 1290(sp)
                  lb           t2, 1241(sp)
                  xor          t2, a4, t1
                  lhu          s0, 874(sp)
                  lb           t1, 63(sp)
                  lbu          s11, 381(sp)
                  lbu          s0, 179(sp)
                  sh           zero, 234(sp)
                  lb           s7, 1441(sp) #end riscv_load_store_rand_instr_stream_4
                  la           a3, region_0+1308 #start load_store_instr_stream_1
                  la           a1, region_1+1529 #start load_store_instr_stream_0
                  sb           s0, -16(a3)
                  sb           a0, 102(a1)
                  sh           s6, -127(a1)
                  lb           s10, 11(a3)
                  lw           ra, 227(a1)
                  lb           s3, 7(a3)
                  lbu          a6, -26(a1)
                  sb           s10, -8(a3)
                  lbu          a5, 14(a3)
                  lbu          s1, -11(a3) #end load_store_instr_stream_1
                  lbu          t4, -252(a1)
                  sb           t4, -160(a1) #end load_store_instr_stream_0
                  la           t2, region_1+940 #start load_store_instr_stream_1
                  la           ra, region_0+915 #start load_store_instr_stream_0
                  sb           s8, 1(t2)
                  lbu          t1, 2(t2)
                  lb           sp, -5(t2)
                  sb           a3, -142(ra)
                  lbu          tp, -640(ra)
                  sw           s4, -16(t2)
                  sb           ra, 15(t2)
                  lb           sp, -663(ra)
                  sb           s8, 482(ra)
                  lb           s10, 2(t2)
                  lb           s4, 564(ra)
                  sb           t3, 42(ra)
                  lbu          s11, 3(t2)
                  lbu          s3, -196(ra)
                  lbu          t6, 774(ra)
                  lb           a4, 3(t2)
                  lb           sp, 174(ra)
                  sh           s10, 16(t2)
                  lb           s10, 3(t2) #end load_store_instr_stream_1
                  sb           s9, -198(ra) #end load_store_instr_stream_0
                  la           s6, amo_0+4 #start riscv_lr_sc_instr_stream_8
                  c.slli       t6, 4
                  andi         a4, s0, -1777
                  c.srai       s1, 11
                  c.add        a4, t6
                  c.slli       s0, 26
                  xor          t5, s6, s1
                  or           s4, a0, s9
                  srl          zero, zero, s7
                  lr.w.rl       tp, (s6)
                  andi         a2, a1, 666
                  c.nop
                  c.add        s9, s9
                  mulhu        t2, a5, a5
                  c.or         a2, a2
                  sc.w.rl       a3, t2, (s6) #end riscv_lr_sc_instr_stream_8
                  la           sp, region_1+1046 #start riscv_load_store_hazard_instr_stream_11
                  sw           s8, -18(sp)
                  lhu          a6, -18(sp)
                  sw           sp, -18(sp)
                  sw           a5, -18(sp)
                  c.xor        a5, a3
                  lhu          tp, -18(sp)
                  lw           a3, -18(sp)
                  sh           s11, -18(sp)
                  lb           a3, -18(sp)
                  sb           s9, -18(sp)
                  sh           t5, -18(sp)
                  sltu         t3, a5, ra
                  lb           s3, -18(sp)
                  lbu          t3, -18(sp)
                  sw           a7, -18(sp)
                  lbu          s9, -18(sp)
                  lhu          s11, -18(sp) #end riscv_load_store_hazard_instr_stream_11
                  la           t2, amo_0+60 #start riscv_lr_sc_instr_stream_6
                  c.mv         s6, t3
                  lr.w.aq       a3, (t2)
                  slli         s7, a0, 8
                  sc.w.rl       s1, gp, (t2) #end riscv_lr_sc_instr_stream_6
sub_4_46:         jal          t3, 17f
0:                c.j          21f
1:                c.j          13f
2:                c.j          23f
3:                c.j          0b
4:                jal          ra, 10f
5:                c.jal        8f
6:                c.j          15f
7:                c.jal        18f
8:                c.jal        20f
9:                c.jal        2b
10:               c.j          16f
11:               c.j          7b
12:               c.jal        5b
13:               c.j          9b
14:               c.j          4b
15:               c.j          1b
16:               jal          ra, 11b
17:               c.j          12b
18:               c.j          3b
19:               c.jal        14b
20:               c.j          19b
21:               jal          ra, 22f
22:               c.j          6b
23:               c.andi       a4, 21
                  la           sp, region_1+98 #start riscv_load_store_rand_instr_stream_11
                  sltu         a2, s2, tp
                  lb           zero, -1(sp)
                  lhu          a2, -12(sp)
                  sub          t2, t4, a5
                  sh           s8, 14(sp)
                  sra          s8, s4, t1
                  lb           s1, 16(sp)
                  lbu          s0, -9(sp)
                  sb           t3, -8(sp)
                  sub          gp, t3, gp
                  add          s6, s9, a2
                  slti         s10, a0, 1636
                  sb           a1, 7(sp)
                  sb           t2, 11(sp)
                  lbu          t2, 1(sp)
                  div          s4, a7, t3
                  lb           t6, -16(sp)
                  mulh         s3, s9, s3
                  lbu          t4, 2(sp)
                  lb           a3, 1(sp)
                  c.or         a5, a4
                  lb           zero, 3(sp)
                  auipc        s6, 872095
                  xori         t2, sp, -904
                  addi         s7, a0, 1720
                  sb           a2, 10(sp)
                  c.add        t4, s2
                  c.slli       t3, 25
                  srli         tp, s6, 1
                  c.nop
                  sb           sp, -11(sp)
                  lw           s11, -6(sp)
                  sh           s1, -4(sp)
                  c.or         a3, s1
                  lbu          a7, -15(sp)
                  slli         t1, t4, 7
                  sb           t3, -11(sp)
                  c.and        a3, a1
                  lb           t1, -13(sp)
                  lb           a4, 5(sp)
                  add          t3, s1, a7
                  lb           s4, -5(sp)
                  c.xor        a2, a3
                  rem          t2, s2, s10
                  srli         s4, t3, 23
                  lbu          t2, -16(sp)
                  lb           a6, 3(sp)
                  sw           s4, 14(sp)
                  and          t5, s0, s4
                  lbu          a7, 13(sp)
                  divu         a1, s6, s7
                  lhu          s0, -12(sp)
                  srli         tp, s8, 30
                  c.or         a5, s0
                  c.addi       gp, -1
                  c.srli       a1, 3
                  c.nop
                  lbu          s0, 15(sp) #end riscv_load_store_rand_instr_stream_11
                  la           s11, region_0+815 #start load_store_instr_stream_1
                  la           t0, region_1+1221 #start load_store_instr_stream_0
                  sb           s4, 80(s11)
                  lb           t2, -72(s11)
                  lbu          a7, -20(s11)
                  sh           t3, 169(t0)
                  sb           s5, -47(t0)
                  lw           s1, 91(t0)
                  lhu          gp, 59(s11)
                  lw           t6, -53(t0)
                  sh           s3, -171(s11)
                  sb           s8, 94(t0)
                  lb           zero, -64(t0)
                  lh           s0, 171(s11)
                  lbu          ra, 224(t0)
                  lbu          t2, 96(s11) #end load_store_instr_stream_1
                  lbu          tp, 179(t0) #end load_store_instr_stream_0
                  addi         t5, zero, 10 #init loop 0 counter
                  c.addi       gp, -1
                  srl          s6, sp, a2
                  slli         s4, a1, 11
                  sltiu        zero, s11, 1357
                  slli         a5, a7, 2
                  addi         sp, zero, 10 #init loop 0 limit
sub_4_102_0_t:    and          gp, a6, a3
                  c.lui        t2, 5
                  addi         t5, t5, -9 #update loop 0 counter
                  c.or         a1, a1
                  xori         t2, s6, 1357
                  xor          tp, t4, t2
                  mul          s1, s8, t5
                  sra          t3, t6, zero
                  c.lui        t6, 26
                  or           s7, a4, a4
                  ori          s1, a0, 841
                  c.andi       a2, 4
                  ori          a4, a2, 713
                  c.add        tp, s1
                  andi         a7, t6, -1152
                  c.addi       s8, 3
                  bgeu         t5, sp, sub_4_102_0_t #branch for loop 0
                  ori          s0, a1, 1496
sub_4_39:         jal          t3, 10f
0:                c.j          15f
1:                jal          ra, 13f
2:                c.j          1b
3:                c.jal        14f
4:                jal          ra, 6f
5:                jal          ra, 7f
6:                c.jal        12f
7:                jal          t1, 11f
8:                c.jal        2b
9:                c.j          8b
10:               jal          ra, 5b
11:               jal          t6, 4b
12:               jal          ra, 9b
13:               jal          t3, 3b
14:               c.j          0b
15:               sra          t1, a4, s8
                  la           t0, region_1+827 #start riscv_load_store_rand_instr_stream_5
                  lbu          a4, -16(t0)
                  sb           a1, 0(t0)
                  mul          zero, t5, t2
                  c.addi4spn   a4, sp, 416
                  c.and        s1, a5
                  c.xor        a1, s1
                  auipc        s9, 814902
                  lw           s1, -11(t0)
                  slli         s1, t3, 6
                  sll          a4, tp, s1
                  sltiu        a6, s8, 1175
                  lbu          t2, 11(t0)
                  nop
                  sub          s6, t1, a0
                  lbu          sp, 4(t0)
                  sb           s6, 12(t0)
                  lb           s4, 11(t0)
                  xor          s8, s2, t3
                  sb           a2, 0(t0)
                  lb           s1, 0(t0)
                  lb           a6, -10(t0)
                  sb           s1, -6(t0)
                  lb           a4, 15(t0)
                  sw           a3, -15(t0)
                  lh           t6, 5(t0)
                  lbu          ra, -14(t0)
                  lb           t6, 14(t0)
                  c.srai       a2, 4
                  remu         t2, t1, t4
                  sh           ra, -5(t0)
                  sb           s11, -7(t0)
                  sb           a0, -4(t0)
                  lh           a5, -5(t0)
                  lb           s0, 12(t0)
                  lb           a7, -5(t0)
                  sb           a6, -5(t0)
                  rem          a3, a7, a5
                  lbu          zero, 12(t0) #end riscv_load_store_rand_instr_stream_5
sub_4_54:         jal          t3, 14f
0:                c.jal        13f
1:                c.j          8f
2:                c.jal        3f
3:                jal          s1, 0b
4:                c.jal        6f
5:                jal          a7, 18f
6:                c.j          1b
7:                jal          t1, 4b
8:                c.j          17f
9:                c.j          7b
10:               c.jal        11f
11:               c.j          5b
12:               c.j          2b
13:               c.j          10b
14:               c.j          12b
15:               c.j          9b
16:               c.j          19f
17:               c.jal        16b
18:               c.j          15b
19:               slt          s1, sp, t3
                  la           ra, amo_0+20 #start riscv_amo_instr_stream_15
                  amoswap.w     a5, s7, (ra)
                  amomaxu.w.rl  tp, s3, (ra)
                  amoswap.w.aq  s8, s4, (ra)
                  amoor.w.rl    s0, s10, (ra)
                  amoxor.w.rl   gp, t1, (ra)
                  amoor.w.aq    a1, t3, (ra)
                  amomax.w.rl   a4, s0, (ra)
                  amoand.w.rl   a3, s0, (ra) #end riscv_amo_instr_stream_15
sub_4_41:         jal          t3, 3f
0:                c.j          5f
1:                c.jal        7f
2:                jal          sp, 0b
3:                c.jal        1b
4:                jal          t5, 8f
5:                c.jal        9f
6:                jal          t1, 2b
7:                c.j          6b
8:                c.jal        10f
9:                c.j          4b
10:               mulh         a7, t4, s9
                  addi         s11, zero, 10 #init loop 1 counter
                  slli         s0, s8, 24
                  sub          s1, a1, ra
                  addi         t0, zero, 9 #init loop 1 limit
                  and          s10, t4, sp
sub_4_105_1_t:    c.add        a6, t3
                  c.addi4spn   a4, sp, 848
                  addi         s11, s11, -1 #update loop 1 counter
                  addi         s4, zero, 5 #init loop 0 counter
                  srli         s8, s11, 27
                  mul          gp, t6, s11
                  addi         t2, zero, -8 #init loop 0 limit
                  c.addi16sp   sp, 48
sub_4_105_0_t:    mul          s7, gp, a0
                  mulhsu       s9, a0, sp
                  sltiu        s9, a2, 1732
                  addi         s4, s4, -1 #update loop 0 counter
                  bge          s4, t2, sub_4_105_0_t #branch for loop 0
                  addi         s3, tp, -312
                  rem          a2, s8, zero
                  sll          s7, t2, s9
                  c.lui        ra, 20
                  andi         a2, a7, 966
                  bgeu         s11, t0, sub_4_105_1_t #branch for loop 1
                  divu         a1, zero, s9
                  la           a3, region_1+1714 #start load_store_instr_stream_0
                  la           s8, region_1+1806 #start load_store_instr_stream_1
                  lhu          ra, 198(a3)
                  lbu          a5, 136(s8)
                  sb           s0, -241(a3)
                  lb           gp, -58(s8)
                  lb           s4, 12(s8)
                  lbu          a6, 155(a3)
                  lhu          a2, -70(s8)
                  lb           a1, 131(a3)
                  sb           t4, -209(s8)
                  lbu          t1, -205(a3)
                  lb           t6, -105(a3)
                  sb           a6, -133(s8) #end load_store_instr_stream_1
                  lhu          a1, 22(a3) #end load_store_instr_stream_0
                  la           a5, region_0+756 #start riscv_load_store_hazard_instr_stream_1
                  lb           a6, 49(a5)
                  lbu          t3, -17(a5)
                  lbu          ra, 51(a5)
                  lbu          sp, 51(a5)
                  lbu          s6, 47(a5)
                  lbu          s0, -45(a5)
                  ori          t4, s7, -50
                  lb           s7, -45(a5)
                  sb           s1, -45(a5)
                  sb           gp, -45(a5)
                  lh           a1, 6(a5)
                  c.sw         s1, 32(a5)
                  lb           s11, 32(a5)
                  c.lw         a2, 32(a5)
                  lbu          t2, 32(a5)
                  lh           a1, 6(a5)
                  sh           tp, 6(a5) #end riscv_load_store_hazard_instr_stream_1
                  la           s6, region_0+1527 #start load_store_instr_stream_1
                  la           t4, region_0+1796 #start load_store_instr_stream_0
                  sb           t4, -23(t4)
                  lb           s1, 67(s6)
                  sb           tp, 8(s6)
                  sh           s5, 22(t4)
                  sw           a2, -123(s6)
                  lbu          s11, -19(t4)
                  lbu          s11, -221(s6)
                  lb           sp, -63(t4)
                  lb           ra, 139(s6)
                  lbu          t3, 151(s6)
                  lb           s8, 12(s6) #end load_store_instr_stream_1
                  lbu          s3, -58(t4) #end load_store_instr_stream_0
                  la           sp, region_1+1226 #start riscv_hazard_instr_stream_8
                  lb           s0, -24(sp)
                  sltu         s9, s0, a3
                  c.lui        s9, 1
                  sub          a2, t4, s9
                  slli         s1, a2, 6
                  lbu          a2, 41(sp)
                  c.nop
                  mulhu        t4, s0, a2
                  auipc        a2, 31034
                  sb           a2, -3(sp)
                  lw           s1, 42(sp)
                  c.lui        t4, 26
                  sll          a2, s1, s1
                  rem          s0, s9, s0
                  slli         a3, s9, 10
                  lbu          s1, 18(sp)
                  xori         s0, s1, 1923
                  lbu          s1, -28(sp)
                  lbu          a2, -25(sp)
                  lb           s9, 40(sp)
                  mul          a2, a3, s0
                  mulhsu       a2, a2, a3
                  mulhsu       s9, a3, t4
                  srai         s9, a3, 21
                  auipc        s0, 871308
                  lb           s9, 63(sp)
                  mulh         a3, s0, s1
                  lb           s0, 12(sp)
                  srl          a3, s1, s0
                  lb           a3, 43(sp)
                  divu         s1, s0, a3
                  sb           s0, -58(sp)
                  ori          t4, s9, -1279
                  lbu          s1, 53(sp)
                  lhu          s0, -52(sp)
                  sh           a2, 50(sp)
                  mulhu        s9, a3, s0
                  lbu          a3, -31(sp) #end riscv_hazard_instr_stream_8
                  la           s4, amo_0+36 #start riscv_lr_sc_instr_stream_13
                  divu         t2, a7, t6
                  slt          zero, s8, s2
                  slli         s7, t1, 15
                  lr.w.rl       a1, (s4)
                  and          t4, s9, s9
                  sc.w.rl       s10, t4, (s4) #end riscv_lr_sc_instr_stream_13
sub_4_47:         jal          t3, 26f
0:                c.j          18f
1:                c.j          8f
2:                c.jal        13f
3:                c.j          1b
4:                jal          t1, 9f
5:                jal          ra, 14f
6:                c.jal        17f
7:                jal          sp, 29f
8:                c.j          5b
9:                c.j          30f
10:               jal          ra, 15f
11:               c.jal        20f
12:               c.jal        28f
13:               c.j          10b
14:               jal          ra, 4b
15:               jal          ra, 0b
16:               jal          ra, 23f
17:               c.j          21f
18:               c.jal        22f
19:               jal          s4, 12b
20:               c.j          27f
21:               c.jal        11b
22:               c.jal        25f
23:               jal          s6, 24f
24:               jal          a2, 7b
25:               c.j          3b
26:               c.jal        19b
27:               c.jal        2b
28:               c.jal        16b
29:               jal          ra, 6b
30:               slti         a3, gp, -1962
                  la           a3, region_0+998 #start load_store_instr_stream_1
                  la           s1, region_0+1347 #start load_store_instr_stream_0
                  lb           s3, -8(a3)
                  lw           a1, 6(a3)
                  sb           a1, 8(s1)
                  la           t6, region_0+1459 #start load_store_instr_stream_2
                  lhu          t4, 10(a3)
                  lb           t2, 6(s1)
                  lb           t3, 13(a3)
                  lhu          s0, -17(s1)
                  lb           t1, -9(a3)
                  sh           gp, 0(a3)
                  lhu          a2, 11(s1)
                  lb           a5, -1141(t6)
                  lb           t5, 367(t6)
                  sb           a0, -56(s1)
                  lbu          a2, -1160(t6)
                  lhu          a2, -55(s1)
                  lb           s11, -30(s1)
                  lb           t3, -10(s1)
                  lbu          t0, -157(t6)
                  sb           s1, 12(a3) #end load_store_instr_stream_1
                  lb           sp, -491(t6)
                  sb           a5, 32(s1)
                  lb           s11, 205(t6) #end load_store_instr_stream_2
                  lbu          a6, -28(s1) #end load_store_instr_stream_0
                  addi         gp, zero, -5 #init loop 1 counter
                  and          ra, s5, t6
                  ori          s3, s1, -1042
                  c.mv         a1, t2
                  addi         s6, zero, 7 #init loop 1 limit
                  sra          s1, s2, s9
sub_4_103_1_t:    andi         t6, ra, -284
                  addi         gp, gp, 5 #update loop 1 counter
                  srl          s3, tp, t6
                  addi         t5, zero, 6 #init loop 0 counter
                  c.nop
                  nop
                  addi         s8, zero, 10 #init loop 0 limit
                  c.slli       s1, 17
sub_4_103_0_t:    and          s0, a6, s2
                  addi         t5, t5, 4 #update loop 0 counter
                  mulhsu       a4, t6, tp
                  nop
                  mulhsu       s0, s4, tp
                  c.addi       a5, 9
                  beq          t5, s8, sub_4_103_0_t #branch for loop 0
                  sra          zero, a6, a6
                  sll          t4, t1, a1
                  c.nop
                  blt          gp, s6, sub_4_103_1_t #branch for loop 1
                  srai         ra, s0, 31
                  la           s6, amo_0+60 #start riscv_amo_instr_stream_10
                  amoswap.w     a5, s1, (s6)
                  andi         s8, t2, -754
                  amoadd.w.rl   s4, s7, (s6)
                  c.or         a5, a0
                  and          ra, a7, ra
                  sltiu        t4, t1, 1998
                  amoadd.w.aq   a4, s9, (s6)
                  amominu.w.aq  a5, t0, (s6)
                  sll          gp, a4, zero
                  amoswap.w.aq  t1, a4, (s6) #end riscv_amo_instr_stream_10
                  la           ra, amo_0+12 #start riscv_amo_instr_stream_4
                  la           s11, amo_0+8
                  la           a2, amo_0+8
                  amomax.w.aq   s4, a5, (s11)
                  amoswap.w     s8, s2, (ra)
                  amoxor.w.aq   t0, a7, (s11)
                  amomaxu.w.rl  a7, t4, (a2)
                  addi         s10, s8, -1771
                  xori         a1, t2, -1424
                  or           a5, s2, a2
                  amoand.w.rl   t2, s5, (a2)
                  amoor.w       s3, s8, (s11) #end riscv_amo_instr_stream_4
                  la           s4, region_0+491 #start riscv_hazard_instr_stream_12
                  c.andi       a5, 23
                  lb           a5, 484(s4)
                  and          s8, s11, a5
                  mulh         a5, s11, t1
                  c.srai       a5, 12
                  lb           t1, 1506(s4)
                  sb           t1, 1123(s4)
                  c.addi       s8, 11
                  lbu          t1, -70(s4)
                  lb           s9, 1000(s4)
                  lbu          a1, 419(s4)
                  c.xor        a1, a1
                  lb           t1, 1474(s4)
                  lbu          a1, 1180(s4)
                  lhu          s8, -325(s4)
                  c.srli       a5, 14
                  lhu          s11, -437(s4)
                  c.xor        a1, a5
                  rem          s8, a1, s8
                  sb           a1, 468(s4)
                  ori          s8, s9, -427
                  sw           a1, 1269(s4) #end riscv_hazard_instr_stream_12
                  la           s8, amo_0+36 #start riscv_lr_sc_instr_stream_2
                  lr.w.aq       tp, (s8)
                  c.andi       a1, -1
                  sc.w          gp, gp, (s8) #end riscv_lr_sc_instr_stream_2
                  la           a7, region_0+1291 #start riscv_load_store_rand_instr_stream_3
                  rem          a5, s5, s3
                  sub          t1, s8, a2
                  lb           tp, 10(a7)
                  slli         t3, s2, 1
                  sb           gp, 1(a7)
                  c.addi       t2, 27
                  slt          s0, a7, sp
                  sb           t4, 5(a7)
                  ori          t0, t1, -1168
                  c.add        sp, s6
                  lb           a1, 9(a7)
                  lbu          s7, 10(a7)
                  div          t2, s9, s1
                  c.srli       s0, 17
                  lh           s4, -13(a7)
                  lhu          s3, -5(a7)
                  slli         t0, a6, 26
                  sb           s7, 3(a7)
                  lb           s3, -12(a7)
                  lb           s9, 8(a7)
                  c.slli       t1, 6
                  c.and        a3, s0
                  lb           t2, -7(a7) #end riscv_load_store_rand_instr_stream_3
sub_4_57:         jal          t3, 14f
0:                c.j          19f
1:                c.j          20f
2:                c.jal        18f
3:                jal          ra, 15f
4:                jal          a5, 11f
5:                c.j          17f
6:                c.j          16f
7:                c.jal        0b
8:                c.jal        4b
9:                jal          ra, 5b
10:               jal          t1, 2b
11:               c.jal        12f
12:               c.j          3b
13:               c.j          6b
14:               jal          ra, 7b
15:               c.j          10b
16:               jal          t1, 9b
17:               jal          tp, 1b
18:               jal          ra, 13b
19:               jal          t2, 8b
20:               c.nop
                  la           s4, region_1+1046 #start riscv_load_store_hazard_instr_stream_5
                  sb           a2, -309(s4)
                  sh           a4, 892(s4)
                  lbu          s6, 892(s4)
                  c.srai       a5, 1
                  sh           a1, 892(s4)
                  sh           tp, 892(s4)
                  andi         a5, s0, 930
                  sb           s11, 458(s4)
                  sb           gp, -875(s4)
                  xori         a3, t2, -164
                  lbu          a5, -875(s4)
                  lb           a2, 381(s4)
                  lb           t6, 661(s4)
                  lbu          zero, 661(s4)
                  c.nop
                  lb           s3, 661(s4)
                  lb           a6, 661(s4) #end riscv_load_store_hazard_instr_stream_5
                  la           a4, region_0+255 #start riscv_load_store_rand_instr_stream_0
                  xor          s0, t6, t1
                  sra          t4, a4, s2
                  lbu          sp, -1(a4)
                  srli         s0, zero, 3
                  sb           s2, -42(a4)
                  sb           a3, -43(a4)
                  lui          gp, 653462
                  c.srli       a5, 7
                  lbu          a2, 26(a4)
                  sb           s10, -6(a4)
                  div          ra, s6, a1
                  c.sub        a1, a5
                  andi         gp, tp, 1692
                  c.lui        s10, 1
                  srai         s6, tp, 31
                  c.srli       a3, 3
                  lb           s9, -25(a4)
                  lb           s9, 41(a4)
                  sll          s8, s0, t0
                  lbu          s7, 9(a4)
                  sltiu        t5, t0, 1540
                  c.slli       t0, 12
                  c.addi4spn   a2, sp, 48
                  sh           s11, 11(a4)
                  sh           t0, -43(a4)
                  c.nop
                  mul          t3, s10, t3
                  sb           s4, 46(a4)
                  lhu          zero, -41(a4)
                  lb           s10, 2(a4)
                  div          zero, s2, s11
                  sltiu        t2, a3, -461
                  lb           sp, 38(a4)
                  lb           s7, -62(a4)
                  sltu         t4, a7, s10
                  lbu          s9, 27(a4)
                  lb           tp, -64(a4)
                  srai         s7, s11, 17
                  c.sub        s1, a4
                  sb           s0, -13(a4)
                  lbu          a7, 42(a4)
                  sh           t4, 3(a4) #end riscv_load_store_rand_instr_stream_0
                  la           s6, amo_0+52 #start riscv_lr_sc_instr_stream_9
                  and          gp, ra, t6
                  sub          t4, s5, s6
                  mulhu        s9, s1, s3
                  andi         a6, a5, 444
                  mul          s0, sp, s0
                  sltiu        t4, a3, -1319
                  xor          t0, t5, t1
                  auipc        t6, 687698
                  ori          s0, t1, 148
                  c.addi       s9, 2
                  c.srai       a3, 8
                  slt          ra, ra, s2
                  c.li         gp, -1
                  lr.w.rl       s3, (s6)
                  c.addi4spn   s1, sp, 608
                  sc.w          a7, s10, (s6) #end riscv_lr_sc_instr_stream_9
                  la           sp, region_1+1770 #start riscv_hazard_instr_stream_17
                  div          t3, s0, zero
                  mulhsu       a4, zero, a3
                  xor          a3, a3, a3
                  lbu          t0, -14(sp)
                  slti         s0, t3, -1280
                  c.srli       a3, 23
                  c.slli       a3, 31
                  lb           zero, 1(sp)
                  mulh         s0, s0, zero
                  lb           t3, -10(sp)
                  sltu         t0, a3, zero
                  lhu          t0, -8(sp)
                  lb           a3, -1(sp)
                  sb           a4, 3(sp)
                  lb           a4, -7(sp)
                  lbu          t0, -1(sp)
                  c.and        a4, a4
                  sb           t3, 13(sp)
                  sltiu        t0, s0, 1299
                  lb           t0, -12(sp)
                  lb           zero, 6(sp)
                  slt          s0, t3, a3
                  lb           a4, -5(sp)
                  sh           zero, 2(sp)
                  c.sub        a3, a3
                  sub          a4, t0, t0
                  lb           t3, -16(sp)
                  lbu          s0, -15(sp)
                  srl          a4, zero, zero
                  lb           zero, 0(sp)
                  lh           a3, -6(sp)
                  lbu          t0, 1(sp)
                  lbu          a4, 3(sp)
                  sb           t0, 8(sp)
                  nop
                  and          a3, t0, a3
                  andi         a3, t3, -1366
                  c.lui        t3, 24
                  addi         t3, t3, 1434
                  lbu          a4, -10(sp)
                  lb           t3, -12(sp)
                  c.andi       s0, 2
                  mulh         s0, s0, t0
                  sra          a3, t3, zero
                  lh           s0, 2(sp)
                  lb           s0, 9(sp)
                  sb           a4, -5(sp)
                  c.lui        t3, 18
                  slti         t0, zero, -1549
                  sltu         zero, a3, a4
                  remu         s0, zero, s0
                  sw           t0, -14(sp)
                  sw           zero, -14(sp) #end riscv_hazard_instr_stream_17
                  la           sp, region_1+1540 #start riscv_load_store_hazard_instr_stream_17
                  lbu          t6, 15(sp)
                  lbu          a5, -5(sp)
                  lb           s4, 246(sp)
                  lh           t5, 246(sp)
                  c.srai       a1, 6
                  auipc        a6, 335297
                  lb           t1, 71(sp)
                  lbu          gp, 115(sp)
                  sb           s7, 115(sp)
                  c.add        t6, a4
                  lbu          a2, 115(sp)
                  lb           s6, 115(sp)
                  and          t2, t1, s8
                  div          a5, a1, t4
                  lb           t6, 71(sp)
                  sb           s0, -97(sp)
                  lb           t5, -130(sp)
                  sb           a1, -49(sp)
                  sb           sp, 91(sp)
                  lbu          s3, 91(sp)
                  sb           a6, 91(sp)
                  sw           s1, 228(sp)
                  lbu          s9, -38(sp)
                  auipc        s7, 740004
                  mulh         a1, s6, t2
                  sw           t5, 204(sp) #end riscv_load_store_hazard_instr_stream_17
                  addi         tp, zero, 9 #init loop 1 counter
                  addi         s9, zero, 10 #init loop 1 limit
                  c.slli       t0, 14
                  add          t1, sp, s11
sub_4_108_1_t:    xori         s4, gp, -463
                  sll          s4, s7, s6
                  addi         tp, tp, 2 #update loop 1 counter
                  addi         a1, zero, 6 #init loop 0 counter
                  c.srai       s0, 26
                  c.li         ra, 26
                  addi         zero, zero, 0 #init loop 0 limit
                  srli         s6, ra, 20
sub_4_108_0_t:    slti         a6, t4, 814
                  xori         gp, a0, -687
                  addi         a1, a1, -6 #update loop 0 counter
                  c.beqz       a1, sub_4_108_0_t #branch for loop 0
                  c.li         t5, 0
                  c.or         a4, s1
                  blt          tp, s9, sub_4_108_1_t #branch for loop 1
                  srli         s8, tp, 30
                  la           a6, region_0+1525 #start riscv_load_store_rand_instr_stream_18
                  slti         s7, s11, -29
                  lui          a1, 647552
                  mulh         a1, t4, a6
                  sb           a0, 96(a6)
                  divu         a2, s9, ra
                  lbu          a1, -415(a6)
                  sb           t0, -882(a6)
                  sb           a7, -437(a6)
                  lhu          a2, -1107(a6)
                  c.mv         t6, a6
                  sb           t0, -517(a6)
                  sb           s8, -1066(a6)
                  c.addi       s7, 1
                  lbu          t5, -296(a6)
                  lb           s0, -602(a6)
                  slti         s7, s8, -1741
                  lb           t1, -1141(a6)
                  lh           s9, -985(a6)
                  addi         s3, s9, -951
                  sb           s2, -123(a6)
                  lh           a5, 461(a6)
                  and          s4, s0, s5
                  c.sub        a4, a4
                  lh           s9, -1015(a6)
                  c.slli       a7, 31
                  sh           t1, -1323(a6)
                  addi         tp, t2, 1396
                  sh           sp, -719(a6)
                  lbu          s9, -1385(a6) #end riscv_load_store_rand_instr_stream_18
                  addi         t5, zero, 8 #init loop 1 counter
                  srli         s4, t3, 4
                  c.addi16sp   sp, -16
                  xori         a2, a2, 1976
                  slt          s3, a1, a4
                  c.slli       tp, 20
                  srl          gp, sp, t2
                  mul          s3, gp, s4
                  addi         ra, zero, 8 #init loop 1 limit
                  c.addi16sp   sp, -16
                  c.srli       a5, 26
sub_4_113_1_t:    slti         t6, t2, -783
                  c.mv         s10, a1
                  addi         t5, t5, -5 #update loop 1 counter
                  c.or         s0, a2
                  c.xor        a2, s0
                  addi         s9, zero, 3 #init loop 0 counter
                  add          s0, t4, a7
                  addi         t2, zero, 18 #init loop 0 limit
                  c.lui        a7, 2
sub_4_113_0_t:    c.nop
                  addi         s9, s9, 1 #update loop 0 counter
                  srli         s3, a1, 25
                  c.srai       a2, 15
                  xori         s6, t5, 719
                  beq          s9, t2, sub_4_113_0_t #branch for loop 0
                  c.or         a4, a3
                  mulhsu       s4, s0, a2
                  sll          zero, t2, s0
                  sltiu        t1, gp, -1202
                  c.and        a4, a5
                  sub          s4, a7, a2
                  bgeu         t5, ra, sub_4_113_1_t #branch for loop 1
                  xori         zero, s2, -605
                  la           s4, region_0+1666 #start load_store_instr_stream_1
                  la           ra, region_1+1802 #start load_store_instr_stream_0
                  sw           ra, -762(s4)
                  lb           gp, 0(ra)
                  sh           s5, -14(ra)
                  lb           s9, -561(s4)
                  sb           sp, 13(ra)
                  lbu          s3, -1472(s4)
                  lbu          t5, 8(ra)
                  sh           sp, -1308(s4)
                  lhu          t2, -4(ra)
                  sb           ra, -5(s4)
                  lb           a7, -703(s4)
                  lw           s1, -306(s4) #end load_store_instr_stream_1
                  sb           gp, 9(ra) #end load_store_instr_stream_0
                  sltiu        s8, a6, 41
                  c.addi       t4, -1
                  c.li         s4, -1
                  sra          t4, a2, s6
                  c.and        a4, a2
                  c.andi       a4, -1
                  beq          t4, s5, 9f
                  bge          zero, a7, 15f
                  divu         a2, t3, ra
9:                srli         t2, a1, 6
                  slli         a4, a7, 5
                  divu         a3, s8, s6
                  xori         a4, a0, -876
                  c.addi16sp   sp, -16
                  bne          gp, s9, 27f
15:               srli         s8, t5, 3
                  sra          tp, s3, a4
                  div          gp, sp, s11
                  div          t3, s5, s6
                  c.srai       a2, 2
                  rem          s0, a5, t2
                  c.addi       t4, 31
                  slt          s9, s3, t0
                  la           sp, region_0+1124 #start load_store_instr_stream_1
                  lbu          a5, 519(sp)
                  la           t6, region_0+1737 #start load_store_instr_stream_0
                  lb           s11, -486(sp)
                  lb           t5, 5(t6)
                  lbu          a7, 4(t6)
                  sb           s5, -4(t6)
                  sb           t1, -288(sp)
                  sw           t1, -532(sp)
                  lbu          a6, 12(t6)
                  lbu          a4, -201(sp) #end load_store_instr_stream_1
                  lhu          s1, -5(t6) #end load_store_instr_stream_0
                  mulh         zero, t6, t5
                  c.slli       s9, 21
                  lui          tp, 639201
                  srl          s0, tp, s7
27:               slti         a3, t2, -1001
                  bge          t2, t1, 29f
29:               nop
                  mulhu        t5, s8, t1
                  c.slli       t3, 13
                  c.sub        s1, a1
                  c.mv         t2, s11
                  xor          s4, s1, s1
                  blt          s1, t0, 48f
                  xor          a3, tp, ra
                  c.srai       a2, 4
                  nop
                  c.addi16sp   sp, 112
                  c.sub        a2, a4
                  sll          a6, t5, tp
                  c.and        a4, a1
                  beq          a3, a5, 58f
                  mulh         t6, t1, s9
                  c.slli       a1, 4
                  mulh         s3, zero, a5
                  bltu         s5, a7, 60f
48:               c.srai       a3, 18
                  remu         a3, s5, s4
                  c.beqz       s1, 61f
                  bgeu         a1, s10, 69f
                  sra          a6, t6, s10
                  c.addi       s4, -1
                  divu         t4, s6, zero
                  sll          t6, t4, tp
                  divu         t4, a6, s9
                  xor          s0, t6, a5
58:               or           s0, ra, a2
                  remu         t5, s6, s2
60:               bgeu         a1, s5, 71f
61:               c.sub        a2, a0
                  sltiu        t6, s0, 1934
                  sra          a7, a2, s11
                  mulhu        t4, t2, s4
                  c.xor        s1, s0
                  c.and        s0, s1
                  c.bnez       s0, 86f
                  c.andi       a4, -1
69:               sll          s10, s2, a4
                  c.srai       a1, 13
71:               c.srli       a1, 11
                  bltu         t1, a5, 89f
                  c.srli       a5, 20
                  srl          zero, a7, s8
                  srai         s3, s5, 13
                  add          a2, a6, s0
                  remu         s1, s9, a1
                  mul          s0, a0, s0
                  or           t4, s4, zero
                  sltiu        a1, tp, 1799
                  xori         s6, t5, 1327
                  mulh         t1, ra, a4
                  c.beqz       a1, 84f
84:               remu         ra, ra, a6
                  lui          ra, 998581
86:               c.add        a3, s11
                  nop
                  c.slli       a6, 25
89:               mulhsu       s9, a0, sp
                  srli         t5, a3, 0
                  sub          zero, a4, s2
                  srl          s9, gp, t5
                  mulh         zero, s8, s8
                  sll          a3, a3, t6
                  sll          t6, t2, s3
                  divu         t5, s3, s7
                  andi         t0, t2, 963
                  or           a5, a2, t3
                  sltu         s1, s5, s11
                  srli         sp, zero, 12
                  nop
                  la           a6, region_1+576 #start riscv_hazard_instr_stream_14
                  c.nop
                  lb           t6, 10(a6)
                  c.add        s1, a4
                  and          t6, t6, s6
                  slti         a4, a4, 173
                  srli         s6, a2, 11
                  c.addi       a2, 12
                  sb           s1, 2(a6)
                  lbu          s1, -15(a6)
                  lh           t6, -16(a6)
                  sh           a4, 6(a6)
                  lb           a2, 6(a6)
                  lh           a2, 6(a6)
                  c.srai       a2, 5
                  rem          s11, t6, a2
                  c.srli       a4, 9
                  c.addi       s11, -1
                  lbu          a4, -3(a6)
                  sb           a4, 1(a6)
                  auipc        s6, 104017
                  auipc        a4, 738316
                  rem          s11, s11, a2
                  sh           a2, 6(a6)
                  lbu          s1, 7(a6)
                  c.and        a2, s1
                  lb           a2, 12(a6)
                  sll          s11, s11, s11
                  c.li         t6, -1
                  slli         s6, s1, 0
                  mul          s1, a2, s6
                  srl          a2, s11, a4
                  c.slli       s1, 2
                  sb           a2, 10(a6)
                  lhu          s11, -16(a6)
                  sh           a4, -2(a6)
                  sub          s6, a4, a4
                  sltu         t6, s1, a2
                  c.slli       s11, 3
                  c.nop
                  lbu          a4, -11(a6)
                  lb           s1, -12(a6) #end riscv_hazard_instr_stream_14
                  bltu         a3, a5, 120f
                  c.beqz       a2, 120f
                  slt          a3, s4, s5
                  srai         ra, s10, 22
                  c.xor        a2, a1
                  c.srai       a3, 9
                  bltu         s1, a5, 128f
                  c.or         a4, a2
                  slli         a4, a3, 28
                  add          t5, s3, t4
                  c.or         a3, a4
                  c.addi4spn   a1, sp, 912
                  sub          s9, t1, s11
                  srai         s6, a4, 20
                  c.and        a3, a3
                  mulhu        t6, s5, a6
                  blt          a7, tp, 134f
                  sra          s10, zero, s8
120:              bltu         t6, a3, 139f
                  rem          s7, s2, t0
                  sltiu        t4, t6, 1823
                  div          a2, zero, s1
                  addi         s10, a1, -104
                  srai         t1, t6, 14
                  xori         s10, a2, -347
                  ori          a4, s6, 511
128:              c.bnez       a5, 142f
                  c.beqz       a3, 143f
                  addi         t4, a5, -1033
                  c.beqz       a3, 150f
                  bge          s10, s1, 136f
                  remu         s3, ra, s9
134:              rem          t3, t5, zero
                  srai         a5, s2, 0
136:              c.andi       a1, 26
                  beq          a6, s5, 143f
                  sra          s1, t5, a2
139:              sll          s4, a2, s7
                  bge          a1, a4, 152f
                  add          a3, t6, a3
142:              c.srai       a1, 30
143:              ori          t6, s6, -1549
                  auipc        sp, 458006
                  srli         a6, a2, 25
                  div          s1, s6, a1
                  c.slli       s0, 30
                  bgeu         gp, zero, 151f
                  c.or         s0, s1
150:              blt          a6, a4, 152f
151:              c.or         s1, a4
152:              beq          t4, sp, 168f
                  or           s10, a5, t6
                  bltu         t0, s7, 167f
                  mulhsu       a7, s11, zero
                  xor          t1, a0, s6
                  sub          t2, s10, t5
                  c.or         a1, a0
                  c.srai       a5, 8
                  c.sub        a5, s1
                  sub          zero, t3, a4
                  and          t3, s5, s10
                  c.and        a2, a3
                  nop
                  c.bnez       a2, 172f
                  bge          gp, a2, 184f
167:              c.nop
168:              c.and        a2, a2
                  c.add        s10, a7
                  or           a4, t0, t6
                  c.xor        a4, a3
172:              xor          a3, a1, gp
                  sltu         t1, zero, gp
                  sll          ra, s6, t0
                  blt          s0, s1, 181f
                  mulhu        s1, zero, t6
                  c.lui        ra, 27
                  c.bnez       a1, 182f
                  andi         s4, s3, -438
                  c.addi16sp   sp, -16
181:              auipc        s4, 725395
182:              auipc        t5, 141732
                  or           s11, ra, tp
184:              bne          s8, t1, 202f
                  c.beqz       a4, 188f
                  sltiu        a2, t6, 53
                  mul          t4, s4, t3
188:              andi         s11, t4, -370
                  sltiu        ra, zero, -879
                  c.srai       s0, 10
                  sltiu        t3, s10, -1302
                  c.bnez       a3, 210f
                  c.srai       s1, 5
                  slt          a6, s10, a2
                  slti         s11, s10, 1770
                  bltu         s7, s0, 209f
                  c.addi4spn   a1, sp, 400
                  or           a6, zero, s5
                  xori         s1, s5, -481
                  slti         t5, a5, 1564
                  blt          s9, s0, 214f
202:              srai         a5, s4, 3
                  mulhsu       t3, ra, a3
                  c.xor        s0, a5
                  c.slli       s3, 29
                  srai         a2, a7, 17
                  mulhsu       a5, t5, t0
                  srli         a5, ra, 10
209:              auipc        t6, 847764
210:              srl          s11, s10, a1
                  sltu         a3, t0, a6
                  mul          s8, a7, a6
                  c.or         a2, a5
214:              c.addi       s11, 16
                  c.addi       a4, 21
                  c.nop
                  blt          a1, a4, 236f
                  slli         s6, a2, 15
                  remu         s10, tp, t1
                  c.li         s9, -1
                  c.beqz       s0, 222f
222:              c.addi16sp   sp, 48
                  sltu         s1, a2, a4
                  bgeu         s1, a7, 226f
                  slt          ra, s9, t6
226:              xor          t4, s8, a6
                  xori         ra, a7, 1435
                  slli         t3, a4, 27
                  c.srli       s0, 13
                  auipc        s6, 109026
                  srai         s9, t1, 17
                  div          t6, t5, s1
                  sra          s10, s9, t2
                  c.mv         a1, s4
                  slti         t2, a1, -1453
236:              srl          zero, a6, tp
                  c.lui        s10, 25
                  add          a1, s7, s1
                  mulhu        s6, a4, t5
                  c.li         a6, 5
                  remu         s0, s5, t3
                  bne          a2, sp, 245f
                  c.add        a3, a0
                  c.addi4spn   a4, sp, 608
245:              sra          sp, a1, s8
                  c.and        s0, a3
                  mul          a1, s7, t1
                  srl          s6, s5, a2
                  srl          a2, t0, zero
                  bge          sp, s0, 263f
                  srai         a1, a3, 25
                  bgeu         t3, zero, 271f
                  c.srli       a1, 6
                  mulh         a1, s11, s9
                  divu         s1, s11, s10
                  c.addi       gp, 24
                  remu         s4, sp, a1
                  xor          a3, a3, s6
                  xor          s11, s0, a4
                  bne          t5, zero, 273f
                  c.lui        t3, 25
                  remu         a7, ra, s9
263:              bgeu         s0, t3, 283f
                  and          s4, s6, a1
                  sltu         s0, s6, ra
                  slli         a2, gp, 17
                  beq          t6, s11, 278f
                  c.beqz       a4, 280f
                  mul          a1, zero, s4
                  lui          s9, 572909
271:              blt          t1, s8, 282f
                  mulhu        s1, s10, t1
273:              bne          a2, t1, 289f
                  c.srli       a4, 31
                  rem          a6, t5, t0
                  auipc        a6, 749110
                  slli         a5, t3, 2
278:              sll          ra, t1, a1
                  bge          a0, s7, 287f
280:              c.beqz       a2, 299f
                  c.srai       a1, 11
282:              c.sub        a3, a0
283:              addi         ra, s8, -931
                  mul          gp, t0, s9
                  remu         s0, s11, tp
                  sub          s9, t5, a2
287:              slt          zero, t4, a0
                  mul          ra, a0, a4
289:              c.add        t4, s0
                  c.li         s9, 31
                  srai         s7, s3, 22
                  c.addi4spn   a4, sp, 1008
                  c.xor        a1, a0
                  sltiu        a4, a6, -560
                  bltu         s11, a2, 309f
                  sra          s3, t4, s10
                  slti         ra, a6, 1321
                  or           gp, s9, s3
299:              ori          t5, gp, 1962
                  c.lui        a4, 25
                  bgeu         s0, s1, 317f
                  bge          t0, s0, 319f
                  mulhsu       s10, gp, a1
                  bltu         t5, a6, 322f
                  andi         tp, s5, 645
                  slt          s1, t2, s8
                  rem          a4, t1, s11
                  andi         s3, a1, 77
309:              divu         s8, s9, t0
                  sltu         a6, s4, a2
                  c.and        a1, a1
                  sltiu        ra, s11, -229
                  div          a1, s5, t3
                  slt          a7, s6, a1
                  rem          a3, s4, s2
                  lui          t2, 861908
317:              c.xor        s0, a0
                  nop
319:              sltu         t3, t5, s9
                  slti         s4, sp, 2005
                  and          s11, t1, a0
322:              addi         a3, t2, 148
                  c.nop
                  c.add        t1, ra
                  c.add        s10, s3
                  remu         s4, tp, a2
                  addi         a5, gp, -1893
                  remu         t2, s1, s10
                  c.lui        gp, 9
                  add          s0, t2, t6
                  mulh         s1, a1, a2
                  auipc        s4, 102338
                  c.xor        a2, s1
                  c.li         s7, -1
                  xor          s11, s8, s6
                  ori          s1, s7, -1777
                  bge          t2, a6, 351f
                  bne          ra, t2, 355f
                  blt          t6, a5, 354f
                  add          t4, s1, s9
                  mul          a5, tp, s10
                  bge          ra, s9, 349f
                  bgeu         a5, s9, 344f
344:              c.add        t1, s3
                  divu         t0, t5, t0
                  auipc        s4, 153865
                  blt          a7, t6, 366f
                  blt          s1, s0, 367f
349:              c.lui        s4, 6
                  c.mv         t5, s1
351:              sltu         a2, t3, a5
                  ori          t5, a7, -2026
                  bltu         a4, s4, 359f
354:              bne          s7, s7, 358f
355:              c.srai       a1, 7
                  bne          t6, t1, 376f
                  sltiu        a7, a7, -1443
358:              beq          s1, a6, 374f
359:              slti         gp, a5, 1043
                  c.mv         a2, tp
                  c.add        s0, t4
                  srl          s9, s8, a4
                  srli         a7, t2, 3
                  sra          s10, t4, a0
                  bgeu         ra, s0, 380f
366:              div          s0, a3, s1
367:              mul          s0, t5, s7
                  andi         zero, s1, 879
                  or           gp, ra, s4
                  c.add        t1, t5
                  c.srai       a1, 17
                  ori          a7, a1, -886
                  c.addi       ra, -1
374:              sra          s1, t3, s1
                  bge          zero, s0, 386f
376:              nop
                  c.bnez       s0, 395f
                  c.addi       gp, -1
                  c.beqz       a2, 397f
380:              xor          t3, s2, s10
                  divu         a6, s0, a2
                  sltu         s6, s6, t0
                  slt          ra, a5, t0
                  c.beqz       a1, 396f
                  mulhsu       t0, t2, zero
386:              sub          s11, t0, t0
                  nop
                  c.slli       t4, 14
                  c.srli       a1, 15
                  rem          a4, a0, zero
                  c.bnez       a4, 409f
                  mulhsu       gp, s11, s10
                  sltiu        a4, t4, 1125
                  c.addi16sp   sp, 448
395:              and          s4, s2, t5
396:              blt          a4, t5, 397f
397:              divu         a2, t3, s4
                  c.bnez       a1, 414f
                  ori          a4, s10, 1400
                  sll          s11, zero, zero
                  sra          s9, s6, t6
                  sltu         a7, gp, a3
                  mul          a2, sp, t0
                  xori         s4, zero, 656
                  srli         s6, s7, 23
                  c.addi4spn   a1, sp, 128
                  mulhu        a3, a4, t2
                  nop
409:              c.lui        t2, 26
                  ori          t5, s3, 1157
                  lui          sp, 34123
                  mulhsu       t6, gp, a2
                  remu         ra, a6, t1
414:              c.slli       s3, 20
                  c.addi       s9, -1
                  c.add        t4, a7
                  sll          a4, a2, a3
                  c.beqz       s0, 432f
                  andi         s11, s2, -530
                  bltu         a7, a7, 427f
                  mulhu        t1, s9, t3
                  sltu         a6, s10, a0
                  addi         s4, t2, 399
                  beq          t4, a0, 427f
                  xori         t2, a0, -1533
                  c.add        tp, t4
427:              c.beqz       a2, 440f
                  lui          s0, 368340
                  bgeu         s2, s11, 443f
                  c.srli       s0, 15
                  slli         ra, s0, 7
432:              srl          s1, tp, s5
                  c.lui        s9, 6
                  xori         t5, a1, -1253
                  c.and        s1, a4
                  c.li         t3, -1
                  c.mv         s9, a0
                  c.li         a3, 6
                  mulhsu       tp, t2, s7
440:              c.sub        a5, a0
                  auipc        t4, 957443
                  c.srai       a1, 8
443:              sltiu        s0, s8, -1067
                  sub          s11, t1, s11
                  add          t1, a6, t5
                  beq          s1, s3, 459f
                  c.slli       a1, 25
                  srl          s11, sp, s5
                  c.xor        a5, a2
                  slti         a7, t3, 2030
                  c.srli       a1, 16
                  slt          a1, a0, t0
                  bne          ra, t3, 470f
                  bltu         s6, a0, 473f
                  ori          a1, s8, -318
                  addi         s8, t6, -1057
                  sltiu        s1, s10, -1070
                  c.slli       ra, 22
459:              c.srai       a2, 11
                  ori          a7, a1, 1953
                  bgeu         a2, a4, 463f
                  add          zero, t6, t5
463:              blt          s0, a4, 471f
                  ori          a2, s2, 928
                  sub          s9, s0, s10
                  nop
                  slli         a4, t6, 2
                  auipc        zero, 572277
                  c.li         a3, -1
470:              srli         s9, a1, 16
471:              c.slli       a3, 5
                  add          s9, a6, t2
473:              c.mv         s6, ra
                  sltu         sp, s9, s2
                  c.or         a5, a0
                  srai         a3, tp, 26
                  mul          t4, s7, s10
                  c.or         s1, a4
                  add          s9, t1, s0
                  ori          a7, s5, -1552
                  slli         t6, s8, 26
                  bgeu         s4, t1, 495f
                  c.beqz       s0, 484f
484:              c.beqz       a2, 495f
                  c.lui        a7, 21
                  slli         s9, a3, 15
                  remu         t1, a0, ra
                  sub          a6, a6, s4
                  c.and        a5, s1
                  add          a2, sp, gp
                  sltu         t0, s2, a7
                  or           s8, s9, s7
                  c.add        ra, t6
                  slti         t5, ra, -217
495:              c.addi       ra, 20
                  ori          a7, a0, -500
                  srli         gp, t5, 10
                  andi         t2, tp, 1055
                  bgeu         t6, t5, 512f
                  c.srli       a1, 4
                  bge          a4, s5, 518f
                  remu         ra, s3, t4
                  slti         a4, t0, 1161
                  div          s10, s7, tp
                  bgeu         a6, s6, 508f
                  c.nop
                  c.mv         s6, s1
508:              sltiu        sp, s6, 1812
                  c.sub        s0, a2
                  divu         s7, s10, a6
                  mulh         a1, t1, s4
512:              blt          zero, sp, 529f
                  rem          s3, s3, a3
                  c.bnez       s1, 533f
                  bne          s2, s4, 528f
                  nop
                  c.addi       ra, -1
518:              c.addi       t5, -1
                  c.li         s6, 22
                  c.lui        a1, 28
                  bltu         s10, t3, 524f
                  slt          a4, s8, s7
                  slti         s8, s11, 1226
524:              mul          s7, t5, t6
                  c.sub        a2, a0
                  div          sp, ra, s9
                  c.sub        a4, a4
528:              sub          t6, a0, sp
529:              or           s0, s10, tp
                  c.xor        a2, a2
                  c.beqz       a2, 544f
                  c.addi4spn   a4, sp, 576
533:              lui          t1, 544204
                  c.or         a3, a1
                  c.addi4spn   s0, sp, 208
                  xori         s9, t0, 1439
                  beq          s3, a4, 556f
                  c.addi       gp, 22
                  c.beqz       a3, 557f
                  c.addi       a7, 22
                  andi         t2, a6, 36
                  c.li         a3, 17
                  addi         sp, s1, -1922
544:              c.andi       a2, -1
                  srai         t3, s10, 28
                  c.li         a1, -1
                  slt          t4, a6, t3
                  c.andi       a4, 23
                  c.andi       a2, 26
                  and          t3, t1, t0
                  mulhsu       t1, s3, s7
                  c.or         a1, s0
                  sra          t3, t5, s9
                  sltu         a5, s3, s1
                  mulhsu       s8, s11, s2
556:              c.add        s0, gp
557:              div          t4, t2, t5
                  sltu         a2, a7, t3
                  c.srli       a2, 31
                  sltiu        a5, a7, 1487
                  add          a3, a5, s2
                  c.addi4spn   a4, sp, 528
                  srl          a4, a2, a6
                  lui          sp, 410166
                  mul          a5, ra, t1
                  sltu         t4, t1, s8
                  blt          s4, a0, 584f
                  c.addi16sp   sp, 336
                  and          zero, a7, s3
                  c.and        a3, a1
                  sub          zero, t2, s8
                  c.li         s1, -1
                  c.andi       a3, 22
                  lui          a6, 596319
                  c.xor        a1, s0
                  srai         a6, t6, 27
                  c.nop
                  ori          a1, s8, 586
                  mulhsu       t4, tp, a2
                  or           a4, sp, a6
                  bltu         gp, s8, 582f
582:              rem          s6, zero, s8
                  c.and        a5, a5
584:              slli         s11, a4, 6
                  c.srai       a4, 12
                  sub          t1, a2, a6
                  c.xor        a1, s1
                  mulhsu       s7, s1, a4
                  c.or         a2, a3
                  sub          a7, sp, ra
                  c.beqz       a2, 610f
                  c.srli       a5, 14
                  xori         a5, s8, 829
                  add          s0, s8, ra
                  div          ra, a4, s6
                  addi         a3, a7, 900
                  sra          s4, t3, sp
                  remu         s9, a1, tp
                  srai         t1, a7, 29
                  mulhu        s8, s5, a5
                  add          s1, s11, a4
                  c.or         a1, a2
                  sltiu        t4, s11, 947
                  lui          a3, 293498
                  sub          t3, a6, sp
                  sub          a5, s7, tp
                  c.or         a5, a4
                  blt          t5, a1, 621f
                  blt          s3, a1, 627f
610:              c.lui        a2, 15
                  c.mv         a7, a1
                  bltu         s7, s4, 625f
                  c.addi       a2, -1
                  xor          s7, t5, s4
                  add          s0, ra, s10
                  auipc        s0, 583200
                  c.and        s0, a3
                  auipc        ra, 781779
                  c.and        a5, a0
                  slti         s1, s1, 1343
621:              mulhu        t0, a0, sp
                  mulhu        s11, a0, a0
                  slli         t2, s0, 10
                  slti         s3, s4, 996
625:              sra          t4, sp, ra
                  sltiu        t2, s10, -1571
627:              c.add        a6, a6
                  c.mv         gp, a0
                  nop
                  srli         s0, t5, 29
                  c.sub        a4, a3
                  auipc        s10, 1044873
                  sltiu        a2, s6, 579
                  slli         s3, a3, 7
                  srl          tp, a4, s5
                  auipc        s6, 532187
                  c.addi       s6, -1
                  nop
                  bge          s5, s6, 659f
                  c.srai       s1, 25
                  c.nop
                  bge          ra, a3, 645f
                  srl          a7, s5, t6
                  c.bnez       s0, 655f
645:              srai         tp, t2, 12
                  c.srai       a2, 18
                  sltiu        s3, s5, 312
                  lui          a6, 884881
                  ori          t5, s1, 1029
                  c.nop
                  srai         zero, s5, 7
                  mulhu        s11, a1, s10
                  c.mv         s1, s9
                  c.sub        a5, s0
655:              bne          s9, a4, 671f
                  divu         t6, s9, t5
                  xor          t5, gp, t2
                  c.or         a5, a2
659:              c.srli       a1, 7
                  c.xor        a2, a2
                  sltu         a4, s9, sp
                  c.slli       s8, 24
                  xori         t3, s0, 1387
                  c.xor        a4, s0
                  mulhu        s6, t6, t4
                  bgeu         t5, s6, 673f
                  c.srli       a3, 27
                  c.slli       a5, 8
                  ori          t1, s8, 1309
                  c.srai       s1, 20
671:              c.lui        s4, 25
                  andi         s6, t3, -1974
673:              sltu         t6, t2, a3
                  lui          s10, 378176
                  c.sub        s0, a1
                  ori          t2, a4, -703
                  c.lui        tp, 2
                  slti         s0, zero, -21
                  sra          t4, t2, s9
                  bne          t2, a5, 696f
                  c.nop
                  bltu         s7, a5, 690f
                  divu         s6, a6, t2
                  nop
                  mul          t6, t6, s7
                  srai         tp, s0, 30
                  sub          s8, s10, s2
                  srai         s10, t0, 19
                  slti         t0, a4, 295
690:              bgeu         t5, t6, 708f
                  addi         s7, a4, -1633
                  c.li         t1, -1
                  lui          a3, 454351
                  sltu         t5, ra, a0
                  bne          a5, a3, 709f
696:              mulh         t3, t4, t0
                  mulhsu       a4, t6, t3
                  divu         t6, gp, t1
                  srai         s6, t3, 21
                  addi         s10, t5, 1585
                  c.addi4spn   a3, sp, 560
                  c.srli       s1, 19
                  xori         s3, s6, -1166
                  c.bnez       a4, 705f
705:              lui          s7, 246935
                  lui          s0, 845470
                  c.addi16sp   sp, 368
708:              c.xor        s0, s1
709:              c.sub        a5, a3
                  c.add        s4, s5
                  srli         a1, t0, 23
                  add          a4, s7, a4
                  c.lui        a6, 28
                  c.sub        a5, s0
                  mulh         s11, gp, a5
                  beq          a3, s11, 720f
                  ori          s0, a7, -1960
                  c.bnez       s1, 724f
                  c.mv         ra, tp
720:              c.addi       tp, -1
                  add          t0, s2, a7
                  nop
                  c.mv         t6, ra
724:              divu         ra, t0, tp
                  bge          gp, gp, 737f
                  rem          t2, s9, a7
                  lui          a6, 726831
                  bne          s5, t6, 743f
                  slli         s0, s8, 4
                  bltu         t5, s11, 741f
                  c.addi       s11, -1
                  sub          a6, a1, tp
                  beq          gp, gp, 735f
                  c.srli       a4, 29
735:              sll          s3, s8, t3
                  div          s1, zero, t0
737:              blt          t1, s11, 751f
                  c.addi       t1, 30
                  mul          a2, t6, a0
                  sra          s9, a7, t6
741:              c.or         s1, a0
                  and          a1, t6, s8
743:              srai         s8, s5, 11
                  bltu         tp, zero, 757f
                  c.beqz       a2, 762f
                  mulh         tp, t2, tp
                  or           t1, t3, t1
                  srli         a3, sp, 23
                  c.addi       a1, -1
                  slt          a2, t3, a1
751:              c.mv         t6, t0
                  or           a3, t5, s11
                  auipc        tp, 166365
                  sub          a6, s8, s11
                  andi         t1, s5, 1961
                  c.bnez       a1, 758f
757:              slt          t3, t0, s9
758:              c.sub        s1, s0
                  c.bnez       a5, 778f
                  add          zero, t1, a1
                  mulhsu       a4, t6, s1
762:              c.srai       a3, 2
                  or           t0, s1, t2
                  c.lui        a5, 2
                  c.sub        a5, a2
                  c.add        s9, a1
                  c.nop
                  add          t6, t5, s5
                  xori         a7, s8, 1587
                  or           a2, sp, s1
                  srli         s8, t2, 8
                  c.or         a3, a1
                  bge          t3, ra, 786f
                  divu         t0, s0, a2
                  c.xor        s1, s1
                  c.add        s1, s8
                  c.slli       s1, 23
778:              sltiu        a1, s11, 487
                  la           t1, amo_0+8 #start riscv_amo_instr_stream_13
                  la           s11, amo_0+12
                  slt          tp, s8, gp
                  div          tp, t6, s0
                  amoxor.w.rl   s8, zero, (t1)
                  amomin.w      t6, tp, (s11)
                  amomaxu.w.aq  s4, a1, (t1)
                  mulhsu       s6, s7, a2
                  amoor.w.aq    a1, sp, (t1)
                  sra          t6, a4, a6
                  ori          zero, a5, 502
                  amoxor.w.rl   a6, s2, (t1) #end riscv_amo_instr_stream_13
                  c.srai       a4, 21
                  div          t1, a6, sp
                  c.xor        s1, a2
                  sltiu        a3, s1, 1153
                  mulhsu       s6, t0, a0
                  remu         sp, s6, a3
                  bge          s7, s9, 803f
786:              c.lui        s1, 18
                  c.addi       s7, 20
                  c.addi       s4, -1
                  xori         ra, s0, 1436
                  bge          gp, a1, 810f
                  c.addi4spn   a2, sp, 336
                  bgeu         s7, s10, 808f
                  srl          s9, a7, s5
                  mulh         a4, t4, s3
                  rem          s8, s10, gp
                  auipc        s7, 387907
                  slli         s9, a1, 30
                  blt          s4, t5, 812f
                  c.add        t4, s3
                  slli         s8, a7, 18
                  nop
                  c.srai       a1, 13
803:              mulhsu       t1, s1, s11
                  add          a4, t2, tp
                  c.andi       a5, 17
                  c.bnez       s1, 824f
                  and          t3, tp, s11
808:              sub          s6, a1, s6
                  c.add        a5, t5
810:              or           t6, s1, ra
                  srl          a1, a7, a5
812:              or           ra, tp, t3
                  bltu         a4, s0, 826f
                  c.nop
                  slti         t3, s11, 1339
                  sltiu        ra, tp, -1250
                  sltu         ra, a6, s3
                  add          a2, s4, s0
                  auipc        s4, 629990
                  nop
                  c.and        a2, a0
                  bgeu         tp, a5, 828f
                  mulhu        a7, a3, t0
824:              mulhsu       a2, tp, s5
                  xor          s4, a3, s7
826:              srl          sp, s11, zero
                  bgeu         gp, a6, 841f
828:              blt          t3, zero, 846f
                  bltu         a3, t0, 846f
                  mul          t3, s3, s2
                  srl          a5, t2, zero
                  sll          s10, a2, s4
                  sltu         zero, t0, a4
                  lui          zero, 98561
                  div          a5, s1, a0
                  bge          s5, s10, 837f
837:              addi         gp, s2, 1800
                  c.addi       a4, -1
                  c.add        t4, t4
                  c.or         a3, a0
841:              c.addi       t0, -1
                  ori          tp, ra, 1251
                  sub          s0, a3, a0
                  c.li         s1, 5
                  sll          a3, s6, t0
846:              srl          t0, a0, s5
                  c.beqz       s0, 860f
                  sltu         t5, t2, t5
                  and          a1, a3, s2
                  c.bnez       s1, 853f
                  sltu         s11, a0, ra
                  sll          ra, t5, a7
853:              c.addi16sp   sp, 240
                  c.addi16sp   sp, -16
                  c.beqz       a4, 867f
                  addi         s0, s11, 797
                  blt          t0, t1, 865f
                  rem          sp, s7, a7
                  c.beqz       a4, 860f
860:              blt          s5, s0, 867f
                  blt          gp, a0, 880f
                  andi         s10, s8, 984
                  and          t2, t1, ra
                  remu         a1, s4, a0
865:              c.addi       s10, 30
                  andi         s9, s0, 1763
867:              srl          a6, tp, t6
                  c.addi16sp   sp, 208
                  c.sub        a5, s1
                  sltu         a6, s9, s2
                  mulhsu       s0, s6, s7
                  bgeu         t0, a2, 883f
                  srli         s9, s5, 6
                  mulh         ra, s2, s10
                  c.or         s1, s0
                  slti         a2, s1, -1417
                  sub          a7, s10, a2
                  sltiu        a5, s5, -733
                  c.xor        a5, a2
880:              xori         a7, s9, 1714
                  sll          s1, sp, t0
                  c.nop
883:              mulhu        s1, s4, s9
                  c.add        s4, s3
                  rem          a7, s11, s10
                  c.add        s8, a2
                  c.addi4spn   s1, sp, 240
                  srli         t5, sp, 12
                  c.li         s3, -1
                  c.sub        s0, a2
                  sub          s7, s3, sp
                  xor          a3, s10, s8
                  c.srai       a5, 26
                  or           t2, s7, t4
                  c.add        gp, t4
                  c.addi4spn   s1, sp, 720
                  c.xor        s1, a3
                  c.li         sp, -1
                  c.addi4spn   a4, sp, 432
                  c.srai       a3, 19
                  xori         t5, t3, -1247
                  c.addi4spn   a2, sp, 496
                  ori          tp, t1, 812
                  beq          s1, s0, 908f
                  xor          s1, a4, s1
                  srli         a4, a0, 31
                  c.li         s3, -1
908:              blt          a2, sp, 919f
                  c.slli       gp, 5
                  c.addi4spn   s1, sp, 880
                  c.addi4spn   a4, sp, 880
                  ori          a3, s3, -297
                  div          a2, s4, s7
                  addi         s0, s2, 3
                  srli         a4, a7, 4
                  bltu         s1, s10, 931f
                  xori         t6, a7, -1561
                  bge          a3, a5, 934f
919:              slti         t1, a0, -1052
                  c.addi4spn   a2, sp, 976
                  divu         t2, s0, zero
                  add          sp, s9, s5
                  xor          s3, s8, s4
                  add          s11, t6, a5
                  slt          gp, s3, t2
                  c.and        a2, a2
                  srl          t3, s11, s7
                  div          s7, a7, s7
                  c.mv         s7, s6
                  c.srli       s0, 6
931:              lui          t2, 453885
                  or           a3, t3, a0
                  c.addi16sp   sp, 224
934:              add          s11, a6, t5
                  srl          t1, s5, a7
                  xori         s1, tp, -1743
                  c.sub        a1, s0
                  bltu         gp, a7, 957f
                  rem          s7, s11, t0
                  sub          s1, a6, zero
                  mul          t3, s5, a3
                  xori         t4, s5, 406
                  bgeu         gp, s11, 946f
                  c.andi       a4, 12
                  c.lui        s6, 11
946:              sra          t0, s11, t4
                  sltu         t3, a2, s7
                  lui          s7, 579629
                  xori         zero, a4, -1783
                  xor          s3, a6, t3
                  bltu         zero, s11, 964f
                  c.addi4spn   a1, sp, 224
                  c.slli       a7, 18
                  addi         zero, s0, 123
                  c.slli       t3, 13
                  or           a7, a4, s3
957:              c.srai       a4, 11
                  and          s0, zero, t5
                  mul          t4, gp, a1
                  beq          s11, s6, 967f
                  divu         s0, s7, a3
                  c.nop
                  bgeu         a4, t2, 966f
964:              c.srai       a3, 16
                  blt          sp, a5, 983f
966:              nop
967:              rem          t6, t2, t4
                  slti         s6, t0, -33
                  c.slli       t1, 2
                  srai         a1, s5, 24
                  sltiu        a4, a4, -1299
                  sll          t2, s8, s10
                  c.xor        a1, a1
                  sub          s11, a4, a6
                  blt          t1, s10, 994f
                  sub          zero, t5, a3
                  c.bnez       a1, 990f
                  c.add        s1, s3
                  div          a3, t3, s3
                  xor          a5, s6, tp
                  mulhsu       a1, t1, tp
                  blt          t0, s7, 996f
983:              lui          s3, 238957
                  sra          s4, t4, s6
                  auipc        a5, 436422
                  c.addi4spn   a2, sp, 144
                  xori         t0, a3, 782
                  c.slli       t5, 3
                  rem          a2, s2, ra
990:              c.beqz       a1, 1009f
                  slt          s3, s10, t0
                  mulh         t0, a7, s5
                  addi         t1, s0, -1070
994:              sub          s6, t2, s9
                  c.lui        s1, 3
996:              mulhu        s0, sp, t2
                  ori          gp, t2, -1211
                  blt          s7, sp, 1017f
                  srl          a3, a5, t1
                  nop
                  c.addi16sp   sp, -16
                  c.li         sp, -1
                  sub          a5, t0, a2
                  mulhsu       a1, a3, tp
                  divu         t0, sp, sp
                  auipc        a7, 889015
                  c.sub        a3, s0
                  mulh         s11, t2, t4
1009:             c.andi       a5, 10
                  srli         tp, a6, 25
                  sll          a3, s11, t5
                  c.bnez       a4, 1020f
                  c.srli       a5, 9
                  sub          s6, s1, s5
                  beq          a5, a0, 1032f
                  sub          t0, a5, tp
1017:             remu         s10, t5, a5
                  c.and        a4, a3
                  sra          s6, sp, a6
1020:             beq          t4, t4, 1038f
                  slti         sp, sp, -177
                  auipc        a2, 566517
                  slli         t5, a7, 15
                  c.addi16sp   sp, 400
                  bge          a1, a5, 1038f
                  divu         s1, sp, t3
                  c.sub        a5, a3
                  c.add        t0, s8
                  mulhu        ra, s4, a7
                  sltu         sp, a2, s2
                  c.slli       s9, 17
1032:             c.bnez       a3, 1048f
                  slli         s10, s7, 13
                  c.xor        a1, a0
                  sltu         t5, t6, gp
                  nop
                  and          s11, sp, t1
1038:             xori         t4, t3, 1287
                  remu         ra, s11, a5
                  srli         a3, t2, 19
                  xor          t0, t2, a3
                  c.beqz       a3, 1058f
                  and          t3, s4, a0
                  c.addi       s6, -1
                  c.bnez       a2, 1056f
                  sltu         s8, t2, t5
                  c.slli       tp, 14
1048:             addi         gp, s10, -1432
                  mulhu        s4, tp, s3
                  bltu         s0, s4, 1064f
                  and          a4, a1, s11
                  ori          t5, s2, 552
                  sll          s1, zero, s11
                  and          tp, a5, s2
                  xori         s0, sp, 580
1056:             srl          gp, s8, s8
                  ori          t0, s0, -1634
1058:             nop
                  sltu         s11, s8, s1
                  xori         a3, a3, -1887
                  bltu         gp, s7, 1078f
                  c.li         t6, -1
                  c.srai       s0, 29
1064:             c.li         a1, -1
                  bge          s4, a6, 1067f
                  sltiu        t4, s7, -340
1067:             c.addi4spn   a2, sp, 864
                  addi         a6, gp, -277
                  bge          t2, s8, 1089f
                  nop
                  xori         tp, a5, -1307
                  addi         a1, zero, 4 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  mulhu        a5, t2, s11
sub_4_101_0_t:    divu         t4, a0, s11
                  sltu         s1, sp, t6
                  addi         a1, a1, -4 #update loop 0 counter
                  c.xor        a4, a3
                  remu         a6, s6, a4
                  or           a6, a5, s9
                  c.li         s10, 16
                  and          s6, a6, t5
                  c.bnez       a1, sub_4_101_0_t #branch for loop 0
                  srai         a4, tp, 26
                  srli         a1, t3, 21
                  slti         t0, a6, 194
                  bgeu         s5, t1, 1077f
                  sltu         a6, s6, s6
                  c.or         a3, a3
1077:             remu         s11, s8, s7
1078:             c.lui        s1, 7
                  div          a2, a3, s7
                  mulhsu       s1, t3, s9
                  bge          s11, t1, 1085f
                  beq          a6, a4, 1094f
                  bgeu         t2, s2, 1084f
1084:             c.xor        s1, a1
1085:             c.add        s0, a2
                  blt          gp, t4, 1087f
1087:             xor          t4, a3, a4
                  nop
1089:             c.lui        s1, 25
                  c.add        gp, s10
                  auipc        s11, 658760
                  c.bnez       a4, 1105f
                  slli         a2, t1, 27
1094:             add          ra, zero, a4
                  mulhsu       a1, t2, s9
                  mul          t5, a3, s3
                  div          a4, a7, a5
                  lui          t4, 763664
                  c.and        a1, s1
                  or           s3, s10, s8
                  c.addi4spn   a2, sp, 688
                  addi         a1, zero, -7 #init loop 0 counter
                  c.mv         s3, s6
                  c.and        a3, s1
                  c.addi       t6, 7
                  xori         t4, t2, 207
                  addi         s6, zero, 6 #init loop 0 limit
                  slti         gp, ra, -458
sub_4_106_0_t:    lui          a2, 112654
                  nop
                  addi         a1, a1, 4 #update loop 0 counter
                  c.addi16sp   sp, 32
                  bltu         a1, s6, sub_4_106_0_t #branch for loop 0
                  c.and        a5, s0
                  bge          a1, s8, 1117f
                  c.addi16sp   sp, 96
                  xor          s1, a0, a6
1105:             c.mv         a6, s11
                  add          sp, a5, a3
                  la           s6, amo_0+40 #start riscv_lr_sc_instr_stream_15
                  c.and        a1, s1
                  lui          t5, 682603
                  c.addi16sp   sp, -16
                  xor          t6, t1, t0
                  lr.w.aq       a2, (s6)
                  add          tp, a0, zero
                  c.addi16sp   sp, -16
                  lui          a3, 971330
                  rem          t3, a6, zero
                  c.or         s0, s0
                  nop
                  sltiu        ra, s0, 1113
                  sc.w.aq       t0, s0, (s6) #end riscv_lr_sc_instr_stream_15
                  c.addi4spn   a3, sp, 144
                  c.addi       s11, 26
                  c.srai       a3, 3
                  c.lui        s9, 28
                  remu         s10, t2, s10
                  c.add        tp, s1
                  srli         s9, s10, 31
                  andi         a7, t5, -48
                  c.sub        a4, a5
                  sub          zero, t2, sp
1117:             or           t4, s1, a5
                  c.andi       a1, 7
                  divu         s3, s1, tp
                  add          s9, gp, s6
                  andi         s4, s4, -918
                  c.addi4spn   a2, sp, 800
                  xori         s9, s3, 797
                  c.slli       ra, 26
                  slti         s3, a3, -1114
                  c.li         a6, 13
                  sub          s6, t3, a3
                  mul          t3, a3, t0
                  bne          s1, s11, 1135f
                  c.andi       a5, -1
                  sll          s8, a2, s1
                  or           t3, a7, t0
                  auipc        t5, 831226
                  lui          gp, 80698
1135:             slti         a4, gp, -266
                  mulh         a5, a7, s1
                  srl          a7, t5, a3
                  remu         t1, tp, a4
                  mulh         s8, s11, s2
                  c.li         a5, -1
                  c.srli       a1, 10
                  remu         t5, s7, a6
                  mulhu        tp, t2, s1
                  bge          s8, a6, 1155f
                  lui          a4, 975218
                  ori          a2, s11, 1700
                  auipc        s8, 811571
                  beq          t6, t4, 1166f
                  c.beqz       s0, 1157f
                  sltiu        zero, a6, -663
                  slli         s7, zero, 6
                  sltu         sp, s9, ra
                  c.srli       a1, 11
                  c.slli       s11, 31
1155:             c.srli       a3, 8
                  c.addi4spn   s1, sp, 640
1157:             c.li         a6, -1
                  c.andi       a5, 11
                  add          a4, a5, t0
                  remu         gp, a5, t4
                  sll          t2, sp, a6
                  c.nop
                  ori          s4, zero, -1740
                  bge          t1, s5, 1175f
                  c.srai       s1, 13
1166:             bgeu         a4, a3, 1179f
                  mul          t4, t1, ra
                  c.nop
                  andi         s7, s6, -556
                  c.nop
                  bgeu         s9, s11, 1182f
                  mul          s3, a2, s1
                  addi         t0, a3, -1583
                  c.nop
1175:             add          gp, s8, s0
                  c.lui        a6, 5
                  c.slli       tp, 22
                  remu         s3, s9, t4
1179:             slt          s0, t4, t1
                  c.beqz       a2, 1194f
                  c.or         s1, a5
1182:             beq          s11, s3, 1200f
                  c.and        s1, a3
                  srl          t6, s0, tp
                  c.addi       s6, 29
                  mul          t0, s10, s11
                  c.mv         a4, s11
                  srli         s1, t0, 3
                  c.andi       a3, -1
                  c.addi4spn   a1, sp, 80
                  c.xor        s0, a3
                  mulh         t5, s7, a1
                  bltu         s9, a6, 1194f
1194:             andi         t1, s5, 1958
                  c.add        t5, s1
                  xori         gp, a2, -68
                  mulhsu       t2, a4, a7
                  auipc        t0, 260248
                  sub          a1, a3, s9
1200:             c.andi       s0, 4
                  c.slli       t6, 29
                  andi         a2, s8, 1848
                  c.lui        t4, 21
                  auipc        a7, 556149
                  sltiu        s7, tp, 1799
                  slt          zero, s8, zero
                  srl          a5, s10, a4
                  slti         s4, tp, -1241
                  c.slli       t1, 20
                  c.add        a1, t1
                  xori         a2, s3, 1788
                  mulhu        s8, t3, s5
                  srli         s8, s6, 30
                  mulh         sp, s9, s11
                  mulhsu       ra, a0, a3
                  remu         a2, s11, s5
                  c.xor        a3, a4
                  xor          tp, s11, s9
                  and          ra, s1, a2
                  lui          a2, 442259
                  slt          zero, t4, s1
                  c.lui        a4, 15
                  auipc        gp, 382967
                  c.xor        a5, a4
                  c.addi16sp   sp, 224
                  sra          zero, sp, t0
                  mulh         ra, s7, s3
                  ori          s0, a7, 849
                  slli         a6, s5, 14
                  divu         s0, s4, t2
                  c.and        s0, a4
                  c.add        s8, a7
                  sub          s6, zero, t6
                  andi         s10, s1, 980
                  and          s4, a4, a1
                  c.addi16sp   sp, -16
                  andi         s10, a4, 88
                  blt          a2, t5, 1240f
                  sub          s10, t2, t6
1240:             c.li         t2, -1
                  c.beqz       s1, 1259f
                  or           a4, s10, a3
                  c.add        s11, s11
                  bne          t6, s7, 1251f
                  c.xor        a3, a2
                  mul          s1, a5, tp
                  div          a2, a5, a4
                  c.mv         a2, t0
                  c.xor        s1, a5
                  c.and        a1, a4
1251:             slti         a4, a6, -340
                  nop
                  c.addi4spn   a3, sp, 720
                  auipc        t6, 885397
                  c.sub        s1, s0
                  c.and        a4, a4
                  c.and        a5, s0
                  mul          s8, a5, a4
1259:             blt          a0, ra, 1272f
                  sub          t5, s9, t6
                  slt          tp, s0, s4
                  slt          s7, s2, a0
                  c.bnez       a1, 1267f
                  add          t1, a1, a4
                  remu         gp, s11, t5
                  c.nop
1267:             c.andi       s0, -1
                  divu         a5, a6, s8
                  srl          t1, a1, s11
                  divu         s0, s4, s1
                  xori         s4, t5, -1509
1272:             c.xor        a4, s1
                  c.sub        a3, a1
                  c.addi       s4, -1
                  c.bnez       a3, 1278f
                  slti         t0, s3, 648
                  and          s1, t2, gp
1278:             bltu         t1, t5, 1290f
                  addi         a7, t0, -825
                  sll          t3, a0, s4
                  ori          sp, a1, 686
                  auipc        sp, 910191
                  c.li         t1, 10
                  c.slli       t2, 21
                  bgeu         a2, s8, 1299f
                  c.or         a2, a1
                  lui          t1, 472606
                  bgeu         s9, t6, 1301f
                  lui          s1, 33079
1290:             c.beqz       a2, 1310f
                  c.addi16sp   sp, 384
                  and          a3, a5, t4
                  sll          gp, t1, ra
                  rem          ra, a7, tp
                  c.add        s4, a2
                  mulh         t3, tp, s10
                  c.or         s1, a0
                  slti         t3, tp, -1385
1299:             mulhu        a4, s6, s1
                  mulhsu       t6, a7, s3
1301:             and          a2, s8, s4
                  srai         s10, t6, 19
                  c.srli       a5, 27
                  c.sub        a5, a5
                  sub          s0, t5, ra
                  mulh         a4, t4, s11
                  sltu         ra, s2, tp
                  c.andi       a3, 14
                  sub          a2, t6, s4
1310:             srl          a7, s6, s7
                  c.or         s1, a5
                  andi         t2, t3, 1931
                  divu         t1, a1, s11
                  c.addi16sp   sp, 368
                  sub          a2, a7, a7
                  xor          tp, a7, s9
                  remu         tp, t4, s7
                  addi         a2, a1, -1388
                  srl          t6, s8, tp
                  c.slli       s3, 23
                  div          s9, a0, a2
                  bgeu         a5, a2, 1341f
                  xor          s9, s9, sp
                  blt          t3, s2, 1330f
                  c.addi       s0, -1
                  c.lui        s8, 5
                  c.sub        a5, a4
                  sltu         a3, s7, t4
                  beq          t4, s2, 1342f
1330:             or           t1, t0, sp
                  srl          a3, ra, a3
                  add          sp, a0, a4
                  c.addi       s8, 15
                  c.srli       a5, 2
                  or           t2, a6, s3
                  beq          s11, s6, 1352f
                  c.addi16sp   sp, -16
                  sub          a4, s1, s4
                  mulhsu       a3, zero, s3
                  andi         a1, zero, -831
1341:             nop
1342:             add          s11, gp, a3
                  c.addi       s11, 31
                  divu         s7, a0, t1
                  c.addi       sp, -1
                  sll          s0, s5, a5
                  slti         s11, t2, 1152
                  andi         a1, a5, 414
                  bge          t3, a7, 1364f
                  c.addi4spn   a2, sp, 352
                  slli         s9, a0, 12
1352:             mulhu        s1, s9, s5
                  mulh         s8, s0, s10
                  sub          s6, a4, s1
                  bne          gp, s10, 1356f
1356:             and          a5, sp, a6
                  add          t6, s1, s8
                  div          t1, s0, s1
                  bgeu         s9, a3, 1375f
                  add          a1, s11, s4
                  bne          t2, a1, 1380f
                  c.or         s1, a3
                  mulhu        t2, t2, a6
1364:             c.bnez       a1, 1381f
                  rem          s1, s6, gp
                  c.sub        a5, a3
                  nop
                  remu         s0, s8, t6
                  c.addi       s0, 2
                  sub          s9, a2, zero
                  remu         s1, a7, zero
                  c.andi       a1, 31
                  slli         s9, s3, 19
                  rem          t0, s8, s4
1375:             rem          t1, tp, a4
sub_4_38:         jal          t3, 14f
0:                jal          t1, 15f
1:                c.jal        2f
2:                c.j          9f
3:                c.j          4f
4:                c.jal        8f
5:                jal          ra, 12f
6:                jal          a3, 0b
7:                c.j          6b
8:                c.jal        11f
9:                c.j          10f
10:               c.j          7b
11:               jal          ra, 13f
12:               c.jal        1b
13:               jal          gp, 5b
14:               c.j          3b
15:               jal          s1, 16f
16:               c.andi       s0, 20
                  srli         t0, s10, 22
                  bne          s0, a7, 1395f
                  bne          t4, s2, 1397f
                  slli         s0, t6, 23
1380:             c.beqz       s0, 1383f
1381:             div          sp, s0, a2
                  bgeu         t4, s0, 1399f
1383:             lui          sp, 453892
                  xori         s1, t3, -945
                  andi         t2, s0, 659
                  mulh         s9, tp, s5
                  c.addi16sp   sp, 208
                  c.srai       a3, 10
                  c.xor        s0, a2
                  c.addi16sp   sp, -16
                  c.slli       t2, 10
                  and          s1, a3, t0
                  c.addi4spn   s1, sp, 496
                  c.andi       a3, 11
1395:             c.addi       tp, -1
                  c.sub        a4, a1
1397:             sltiu        gp, a5, -280
                  c.add        a1, a6
1399:             sltiu        s3, s11, -172
                  sub          t2, a1, a6
                  c.sub        a5, a1
                  bltu         a1, t4, 1417f
                  xori         sp, a4, 222
                  c.addi       s1, 10
                  c.slli       a1, 23
                  blt          sp, s10, 1412f
                  c.li         s10, 21
                  xor          s6, s2, a6
                  c.or         a1, a5
                  c.addi16sp   sp, 112
                  c.li         a2, -1
1412:             bgeu         s0, s2, 1426f
                  nop
                  remu         a2, t5, s3
                  c.or         s0, a1
                  bge          s11, s7, 1430f
1417:             beq          s2, a2, 1429f
                  xori         t4, gp, 91
                  ori          a7, t0, -1838
                  slti         a2, s0, -654
                  sub          t0, a5, t5
                  c.srai       a3, 24
                  addi         t5, t3, -537
                  c.beqz       a1, 1444f
                  xor          t0, s1, s5
1426:             or           ra, s9, tp
                  c.addi16sp   sp, 208
                  slli         s8, s7, 22
1429:             sltiu        t3, s5, 1745
1430:             addi         s7, a3, 1133
                  c.addi       t4, -1
                  auipc        s8, 125358
                  c.xor        a4, s1
                  auipc        s9, 3474
                  auipc        a3, 592007
                  c.srli       a4, 26
                  nop
                  c.lui        t4, 7
                  divu         gp, s2, sp
                  blt          s7, s4, 1453f
                  sub          sp, s4, a2
                  c.lui        tp, 8
                  c.srli       a3, 17
1444:             c.lui        tp, 23
                  nop
                  xor          a5, s11, ra
                  c.beqz       s1, 1466f
                  c.nop
                  nop
                  add          s0, s9, t1
                  sll          a1, s6, ra
                  add          s1, t5, s8
1453:             c.bnez       a5, 1466f
                  c.beqz       s1, 1461f
                  slt          a2, s5, s2
                  mulhu        s8, a2, a3
                  addi         s8, t6, -91
                  c.addi4spn   a5, sp, 288
                  mulh         t0, s2, s2
                  bge          s8, tp, 1477f
1461:             nop
                  c.and        a4, a5
                  c.beqz       s1, 1465f
                  rem          a2, t2, a2
1465:             mulh         t5, t3, s6
1466:             mulh         t2, sp, t1
                  slli         s4, ra, 5
                  slli         a6, s11, 18
                  c.add        a5, t0
                  sub          t2, s11, a5
                  add          s9, zero, s4
                  c.or         a5, a0
                  bgeu         s3, a6, 1492f
                  c.bnez       a1, 1487f
                  rem          t0, s5, s5
                  c.nop
1477:             xori         t5, gp, 568
                  c.add        t4, s10
                  mul          tp, a6, s7
                  c.addi       a3, -1
                  c.mv         s11, sp
                  srai         t4, s10, 27
                  remu         s1, s8, s11
                  c.or         s1, a1
                  rem          a6, t6, tp
                  c.lui        s4, 21
1487:             sll          s3, s11, s4
                  rem          t6, ra, s11
                  sub          t6, s2, t3
                  c.li         t5, -1
                  sll          s9, a2, t3
1492:             c.addi       t4, -1
                  c.add        a5, a1
                  srli         a2, t0, 25
                  div          s6, a4, t6
                  ori          s6, t1, -199
                  mulh         a2, s7, t1
                  mulh         a5, a4, s1
                  srli         ra, a5, 6
                  srli         a2, s10, 24
                  beq          a6, s1, 1520f
                  c.andi       a4, -1
                  c.srai       a1, 11
                  c.andi       a1, -1
                  c.nop
                  xori         t3, s5, -538
                  mulh         sp, ra, t3
                  mulh         t3, s5, ra
                  c.or         s0, a2
                  mul          t6, a5, s6
                  srli         t6, a0, 23
                  remu         s11, s1, s0
                  c.or         s1, a3
                  mulhsu       a5, a0, zero
                  divu         a2, a5, s2
                  remu         s4, a0, a6
                  c.sub        s0, a5
                  c.addi16sp   sp, 400
                  blt          a5, s7, 1535f
1520:             c.slli       a5, 2
                  c.slli       s1, 3
                  c.li         t5, -1
                  sub          gp, gp, a1
                  c.add        a4, t4
                  c.nop
                  c.bnez       s0, 1544f
                  blt          a1, a0, 1544f
                  slti         t4, s11, 1419
                  beq          t3, a1, 1533f
                  add          a1, t0, zero
                  c.slli       tp, 2
                  mulh         s7, a3, a5
1533:             c.addi16sp   sp, 304
                  sltiu        tp, s10, 1316
1535:             c.srai       a2, 15
                  divu         s8, a4, s6
                  c.nop
                  sltu         sp, s11, s10
                  c.mv         a6, a6
                  xori         zero, sp, 522
                  c.add        ra, s8
                  rem          s4, s2, t1
                  c.bnez       a1, 1556f
1544:             auipc        s9, 1031580
                  srl          s1, gp, a7
                  mulhsu       t0, s1, ra
                  c.bnez       s1, 1555f
                  c.and        a4, a3
                  auipc        s0, 966147
                  divu         t1, t0, s10
                  or           ra, t5, t4
                  xor          t3, s2, t3
                  sltu         t3, tp, t2
                  xori         a4, tp, 667
1555:             c.srli       a4, 31
1556:             c.slli       a4, 19
                  or           sp, s6, a3
                  and          a6, s11, s11
                  sll          s10, s10, a3
                  and          s1, zero, ra
                  c.beqz       a3, 1564f
                  sub          a1, t6, a5
                  srli         a3, s6, 16
1564:             sltu         s8, s2, a6
                  bne          tp, s1, 1583f
                  c.or         s1, s1
                  srli         a4, sp, 8
                  blt          a3, a6, 1579f
                  srli         s6, t1, 13
                  c.bnez       a4, 1586f
                  slli         s9, a6, 30
                  srli         zero, s6, 18
                  c.slli       tp, 31
                  c.and        s0, a4
                  andi         tp, tp, -1695
                  c.xor        a5, s1
                  c.sub        a4, a1
                  c.mv         a1, s5
1579:             mul          t4, t4, s2
                  bne          a1, t0, 1598f
                  add          s7, s10, a1
                  c.srli       a1, 1
1583:             sll          s8, s11, t4
                  lui          a6, 567317
                  sltiu        s6, a7, -522
1586:             sltu         s6, t4, s3
                  sltu         t4, s4, s5
                  c.nop
                  c.addi16sp   sp, 256
                  bgeu         a4, zero, 1601f
                  divu         s9, s1, s4
                  c.addi4spn   a2, sp, 128
                  add          t1, s10, a4
                  c.nop
                  c.li         s9, -1
                  srl          t0, a6, s11
                  srl          s10, t4, sp
1598:             srl          t4, s11, s8
                  auipc        t6, 730720
                  c.add        t3, s0
1601:             sra          t6, t0, a7
                  slli         sp, t6, 29
                  sub          s8, s10, s9
                  mul          s1, s6, s6
                  c.xor        s0, a4
                  divu         a4, zero, s11
                  c.addi       s11, -1
                  c.lui        t3, 5
                  remu         s7, t2, a4
                  nop
                  mulhu        a6, a0, t4
                  mulhsu       s10, s2, s7
                  c.sub        a1, a4
                  divu         s4, zero, t2
                  rem          t6, a3, s6
                  c.addi4spn   s1, sp, 160
                  sra          a1, ra, t2
                  remu         a2, s7, s6
                  and          a4, a4, t5
                  lui          ra, 899704
                  mulhsu       s9, gp, gp
                  divu         s3, a1, s0
                  xor          a7, s7, s8
                  c.bnez       a1, 1627f
                  c.xor        a5, a5
                  bne          t5, t4, 1627f
1627:             srl          t5, a7, s2
                  beq          s5, s10, 1629f
1629:             c.add        ra, s7
                  beq          t6, s5, 1636f
                  c.addi16sp   sp, -16
                  c.or         a1, a1
                  divu         a4, a0, s10
                  mul          s3, s0, gp
                  nop
1636:             bne          a5, gp, 1638f
                  and          s7, a7, t1
1638:             c.andi       a1, 27
                  div          s6, s4, t6
                  auipc        a1, 586151
                  andi         s6, a4, 1404
                  c.nop
                  bne          s1, s4, 1646f
                  c.sub        s1, s0
                  c.addi4spn   s0, sp, 560
1646:             c.nop
                  ori          s7, a7, 67
                  c.mv         a4, s1
                  c.andi       s1, 28
                  divu         s6, a5, s2
                  auipc        s7, 608488
                  lui          a6, 226955
                  bge          t2, a7, 1657f
                  xor          zero, a7, tp
                  mulhu        a6, t4, a6
                  srl          t4, a1, a2
1657:             sltu         a6, s3, t1
                  c.li         s0, -1
                  c.addi       s6, 6
                  mulhsu       s0, a0, s5
                  c.li         s4, -1
                  sltiu        t0, t5, 1982
                  sra          a4, s5, s10
                  addi         s4, s6, 1242
                  slli         t5, t0, 23
                  c.addi       t6, -1
                  c.nop
                  c.or         a1, a1
                  srai         t6, sp, 18
                  div          a7, a2, s4
                  and          s1, a1, t2
                  c.addi4spn   a3, sp, 928
                  slt          a1, s8, t1
                  c.nop
                  nop
                  sltiu        a7, a4, -1490
                  c.xor        s1, s0
                  ori          a2, a1, -78
                  bge          a0, s7, 1691f
                  c.bnez       a3, 1693f
                  c.slli       s3, 5
                  lui          s6, 970360
                  c.bnez       a5, 1684f
1684:             c.beqz       a4, 1700f
                  c.nop
                  c.li         t3, -1
                  sltiu        t0, s7, 1949
                  c.beqz       s1, 1706f
                  mulhu        t4, t5, t6
                  bge          s0, s1, 1707f
1691:             c.nop
                  srli         t1, s10, 12
1693:             c.mv         s10, a3
                  c.beqz       a3, 1705f
                  ori          gp, s6, 1623
                  bge          s7, t3, 1703f
                  c.add        a3, t2
                  c.slli       s10, 16
                  div          s3, a2, a4
1700:             bne          s2, s11, 1718f
                  c.addi       t0, -1
                  divu         s7, s6, s1
1703:             sll          s4, tp, a1
                  c.or         a2, a2
1705:             xori         t0, s9, 1633
1706:             c.beqz       a5, 1719f
1707:             addi         s8, t5, -591
                  slti         s1, a0, 392
                  nop
                  and          s0, s6, a3
                  c.addi4spn   a4, sp, 400
                  c.and        s0, a4
                  bgeu         a6, t6, 1714f
1714:             c.slli       s6, 29
                  c.srli       a4, 18
                  srai         t5, zero, 21
                  blt          t0, sp, 1732f
1718:             c.or         a3, a0
1719:             c.srai       a4, 26
                  srli         s6, t5, 16
                  c.addi16sp   sp, -16
                  and          t6, t3, s5
                  c.andi       a4, -1
                  bne          t1, s2, 1743f
                  add          t3, s9, a2
                  c.li         s11, -1
                  lui          a1, 192199
                  slli         t6, a2, 0
                  bge          a5, zero, 1748f
                  lui          s8, 323771
                  beq          s7, a1, 1745f
1732:             c.bnez       a3, 1750f
                  c.or         a2, a5
                  c.andi       a1, 19
                  c.srli       a3, 8
                  bne          s3, ra, 1747f
                  xori         a5, s3, -1829
                  mulhsu       a7, a5, t4
                  remu         a1, s4, s1
                  divu         t5, t6, a3
                  add          a5, s10, a2
                  beq          a7, s0, 1758f
1743:             addi         t6, a1, 807
                  sll          t6, a4, t4
1745:             c.srli       a3, 27
                  xor          a7, a5, zero
1747:             sub          s0, a1, t2
1748:             c.nop
                  sra          t0, s1, a7
1750:             srai         s4, gp, 17
                  mulhsu       s9, s8, s3
                  c.lui        t0, 3
                  or           a7, s4, s5
                  c.and        a3, a5
                  srai         a5, a5, 22
                  mulhu        t2, a0, a1
                  ori          gp, a4, -1410
1758:             c.beqz       a1, 1771f
                  c.and        a4, a1
                  xor          a1, a3, t4
                  and          s7, s8, s10
                  c.sub        s0, a0
                  div          s7, s1, a7
                  c.xor        a1, a0
                  c.lui        t3, 10
                  slt          t5, a5, t5
                  beq          a7, tp, 1775f
                  blt          a2, t3, 1781f
                  beq          s3, sp, 1786f
                  c.addi16sp   sp, 256
1771:             sltiu        a6, a2, -929
                  c.slli       s6, 6
                  div          s1, sp, s8
                  sub          s3, gp, s3
1775:             sltu         a5, a2, t6
                  c.andi       a4, -1
                  c.slli       a2, 18
                  srl          t5, s7, t3
                  ori          s3, s4, 1986
                  auipc        s3, 346868
1781:             c.mv         t1, s4
                  srl          a2, ra, gp
                  xor          tp, s8, a2
                  bgeu         a1, a0, 1798f
                  bgeu         s8, a6, 1804f
1786:             c.or         s1, a1
                  divu         a6, s10, a0
                  sltiu        s10, zero, -512
                  auipc        a2, 60902
                  add          a7, t1, a3
                  xor          gp, ra, a7
                  c.or         s0, a3
                  ori          a4, s2, -808
                  xor          s8, a3, t1
                  bltu         a1, a1, 1815f
                  srl          a7, s1, zero
                  andi         a1, s7, -994
1798:             blt          s8, s0, 1801f
                  remu         t1, s5, s4
                  srli         s4, ra, 0
1801:             slli         a6, s8, 20
                  c.and        a5, a3
                  c.lui        t4, 24
1804:             beq          t6, tp, 1810f
                  c.and        a3, a0
                  nop
                  remu         a6, sp, s2
                  c.srli       a5, 13
                  srai         s11, t4, 3
1810:             mulhu        a5, s11, s0
                  sll          a4, a3, a2
                  and          t6, ra, a7
                  divu         s4, ra, a1
                  nop
1815:             ori          s7, s4, 102
                  c.andi       s1, 15
                  rem          s10, s10, s7
                  beq          s8, a3, 1819f
1819:             slt          s3, s8, s0
                  beq          s11, s1, 1840f
                  c.beqz       s1, 1837f
                  c.or         s1, a3
                  blt          a5, a0, 1826f
                  c.slli       a7, 30
                  rem          gp, s0, t6
1826:             rem          gp, sp, s0
                  divu         a2, s0, t5
                  c.addi16sp   sp, 288
                  addi         t4, s3, 184
                  c.beqz       a1, 1833f
                  xori         a2, tp, 631
                  c.add        t1, a0
1833:             c.and        s0, a0
                  slt          a1, s9, t4
                  c.nop
                  blt          s1, gp, 1847f
1837:             c.beqz       s1, 1854f
                  sltiu        s6, s6, 2017
                  c.andi       a5, -1
1840:             c.mv         a5, t3
                  ori          a2, t2, 701
                  c.lui        s8, 3
                  xori         zero, t2, -1627
                  c.li         a7, -1
                  c.and        s1, a3
                  andi         gp, s8, -940
1847:             and          a6, s2, s11
                  c.sub        s1, a0
                  c.addi       s6, 16
                  remu         t1, a3, t0
                  mulhu        s4, s0, s7
                  slt          gp, t5, s5
                  ori          s4, s8, -216
1854:             and          t0, t0, s9
                  nop
                  and          tp, s1, s10
                  c.srai       a2, 30
                  c.nop
                  mul          a4, a6, t3
                  rem          t5, t6, ra
                  add          ra, tp, t0
                  sltiu        s11, a3, -395
                  nop
                  add          s4, t0, s7
                  andi         a1, t3, -287
                  sub          a4, s4, sp
                  add          s8, t0, a2
                  or           a2, a3, sp
                  xori         t1, s3, 1395
                  add          zero, s7, zero
                  c.or         a4, a5
                  divu         t1, t6, t0
                  c.mv         a6, s0
                  c.li         t6, 5
                  remu         s10, s5, s10
                  c.or         a1, a4
                  c.li         s4, -1
                  srai         t0, t5, 15
                  c.lui        s1, 5
                  remu         a3, a2, zero
                  c.srai       s1, 8
                  andi         a2, s9, -635
                  mulhu        t2, a4, s11
                  c.addi16sp   sp, 432
                  srl          a2, s11, s6
                  div          t3, s10, t4
                  mulh         s9, s8, s1
                  add          a1, t5, s1
                  c.bnez       s1, 1902f
                  c.srai       s1, 27
                  ori          s11, t0, -13
                  rem          a1, t4, t6
                  divu         s11, s5, t3
                  c.add        s1, t0
                  sra          tp, s8, a0
                  div          s7, s8, s11
                  rem          s9, s9, a4
                  c.and        a1, s1
                  mulh         s0, a3, a2
                  c.andi       a5, 24
                  sra          zero, t1, s10
1902:             mulhsu       s9, a5, t6
                  bltu         gp, t0, 1917f
                  sra          a1, a1, a4
                  c.nop
                  c.bnez       a2, 1925f
                  c.mv         ra, s2
                  c.srai       a4, 30
                  bltu         s0, a2, 1927f
                  bltu         tp, s4, 1929f
                  c.or         s1, a4
                  c.slli       s9, 23
                  auipc        tp, 55449
                  bltu         t4, a4, 1929f
                  srl          a5, s6, s1
                  and          t4, s10, a3
1917:             bgeu         ra, s10, 1931f
                  sll          t6, ra, s0
                  xor          t1, tp, a6
                  mulh         s4, t2, t5
                  c.andi       s0, 19
                  nop
                  c.addi16sp   sp, -16
                  bge          zero, s4, 1941f
1925:             c.xor        a3, a4
                  mulhu        sp, s11, s7
1927:             c.addi4spn   a3, sp, 752
                  nop
1929:             sra          gp, t0, zero
                  c.beqz       a1, 1937f
1931:             divu         a2, t1, s11
                  c.lui        a4, 4
                  slli         s1, s9, 15
                  c.lui        s9, 17
                  c.addi16sp   sp, 416
                  ori          s8, a2, 640
1937:             c.andi       a5, 4
                  nop
                  bltu         s10, t2, 1950f
                  srli         s11, s1, 29
1941:             addi         a4, sp, -1865
                  sltiu        t0, a5, 153
                  c.li         s8, 12
                  srai         s0, s9, 27
                  c.mv         ra, t2
                  rem          zero, s4, t5
                  c.li         s0, 30
                  xori         a5, s0, 113
                  c.mv         a1, t1
1950:             ori          ra, a5, -890
                  div          s4, ra, s0
                  div          ra, s8, t5
                  mulhsu       a3, s5, s0
                  andi         s1, gp, 481
                  c.slli       s7, 2
                  div          tp, t5, s6
                  c.srli       a3, 26
                  bgeu         t3, s5, 1977f
                  srli         s9, t6, 20
                  sll          s4, t6, s5
                  c.li         a2, 10
                  c.li         s6, -1
                  bge          a7, t0, 1981f
                  c.mv         s4, s3
                  or           s1, s1, s2
                  c.li         tp, -1
                  blt          a2, a6, 1985f
                  and          a3, a5, t2
                  c.bnez       s1, 1982f
                  slt          zero, tp, tp
                  c.lui        t2, 1
                  sra          s8, s5, s9
                  sltu         t4, s7, t0
                  c.slli       s1, 25
                  slli         s11, a2, 20
                  beq          s11, a5, 1980f
1977:             srai         t6, s9, 25
                  auipc        a4, 1000247
                  ori          s9, zero, -165
1980:             mul          t0, t2, a7
1981:             mulhsu       sp, s6, gp
1982:             srli         a4, t1, 9
                  bltu         t5, a2, 1995f
                  c.add        a1, t5
1985:             c.or         a5, s1
                  c.beqz       a5, 1988f
                  sra          s10, t3, tp
1988:             bltu         s10, a5, 2004f
                  mulhu        s1, gp, t2
                  c.or         a4, a1
                  c.lui        t1, 5
                  c.beqz       s0, 1993f
1993:             mulhu        s1, t3, a0
                  c.li         a2, 23
1995:             c.beqz       s0, 2008f
                  sltu         s9, a7, s2
                  nop
                  c.addi4spn   a1, sp, 800
                  c.nop
                  c.lui        s6, 3
                  xor          a1, t6, t1
                  lui          s3, 808086
                  add          a1, t0, t0
2004:             auipc        a2, 132163
                  c.srai       a3, 24
                  bltu         t4, a1, 2019f
                  mulh         a1, ra, s8
2008:             bge          t2, a4, 2016f
                  div          t3, t4, s5
                  sub          s10, s0, a7
                  sltiu        zero, a5, 716
                  lui          sp, 857386
                  bgeu         t0, a6, 2015f
                  c.slli       a3, 24
2015:             c.and        a2, a3
2016:             c.li         s0, 30
                  blt          a3, sp, 2031f
                  c.addi4spn   a1, sp, 944
2019:             c.addi16sp   sp, -16
                  lui          a7, 100754
                  sltiu        a2, s1, 808
                  rem          t3, t3, tp
                  c.xor        a1, a4
                  auipc        a7, 486525
                  and          a7, s4, s1
                  c.addi16sp   sp, 16
                  ori          a2, s1, -428
                  bltu         a2, t6, 2036f
                  sll          s0, t4, t0
                  c.lui        a2, 17
2031:             c.sub        a3, a3
                  c.add        s9, t0
                  slti         sp, a3, -460
                  c.addi4spn   a2, sp, 864
                  c.and        s1, a0
2036:             c.srli       a5, 28
                  nop
                  sltu         sp, a0, s3
                  bgeu         zero, a2, 2055f
                  c.or         s1, a3
                  beq          tp, s3, 2047f
                  c.addi       s3, -1
                  add          s3, tp, t0
                  and          t0, t5, t4
                  bge          a7, t5, 2048f
                  divu         a6, s1, s6
2047:             or           s9, s6, t3
2048:             sll          gp, a5, t5
                  beq          s7, t2, 2050f
2050:             add          s9, gp, a6
                  addi         t3, t5, 685
                  beq          s0, s3, 2067f
                  divu         t6, s8, ra
                  or           a3, a3, t1
2055:             sltu         s3, s0, t6
                  auipc        sp, 492284
                  xor          t1, a5, s0
                  divu         s1, t2, s5
                  mulhsu       a6, t0, gp
                  c.slli       a6, 3
                  xor          s8, s2, zero
                  beq          s9, t4, 2078f
                  xor          s9, t4, a2
                  sll          s0, sp, s10
                  sltiu        sp, a4, 53
                  beq          zero, sp, 2084f
2067:             add          sp, a5, t4
                  slli         a7, s4, 1
                  sltu         t4, s1, a2
                  c.andi       s1, -1
                  c.mv         t2, a3
                  and          t3, t2, sp
                  mulh         s10, s3, a2
                  beq          s4, s11, 2078f
                  c.addi4spn   a5, sp, 176
                  nop
                  srl          a3, a7, t5
2078:             nop
                  c.beqz       a3, 2098f
                  srli         a2, s1, 21
                  blt          sp, a6, 2098f
                  sltiu        t0, ra, 288
                  slt          t2, a6, s1
2084:             bltu         a0, s3, 2095f
                  c.beqz       a4, 2104f
                  andi         a1, t6, -9
                  c.addi       s9, 18
                  c.beqz       a3, 2106f
                  c.and        a3, a3
                  c.addi16sp   sp, -16
                  sltu         a2, t3, a3
                  c.add        a5, a3
                  mulhsu       tp, a7, t2
                  remu         tp, s9, s10
2095:             slti         a3, s6, -191
                  c.sub        s0, a1
                  mulhsu       s4, sp, zero
2098:             bne          s5, s4, 2099f
2099:             c.srai       a2, 19
                  div          a1, t0, a2
                  c.nop
                  addi         ra, a1, -1933
                  mulhsu       a2, t1, t0
2104:             remu         zero, s3, t4
                  lui          s7, 339090
2106:             divu         zero, gp, s8
                  srli         t1, t2, 0
                  ori          s6, zero, -114
                  sltiu        s10, gp, 1591
                  c.nop
                  bgeu         s10, ra, 2130f
                  c.lui        a1, 19
                  c.add        a2, sp
                  c.andi       a2, 14
                  remu         s7, a5, zero
                  c.or         a5, s1
                  beq          a2, t1, 2131f
                  sub          gp, s8, sp
                  c.and        s0, s0
                  and          s11, t5, zero
                  beq          a7, t6, 2124f
                  c.nop
                  c.mv         t4, t4
2124:             srl          s10, s4, s2
                  mulhsu       s11, s7, s3
                  and          a3, s8, s7
                  rem          s4, a6, a2
                  mul          s3, s7, t3
                  c.addi4spn   s0, sp, 480
2130:             c.srli       a1, 3
2131:             addi         s0, s11, -350
                  xor          sp, t4, t0
                  divu         s7, a1, a4
                  c.srai       s0, 8
                  mulh         s1, s6, s3
                  srli         t2, a3, 21
                  c.andi       a4, 31
                  and          a3, sp, s9
                  nop
                  sltiu        tp, tp, -1807
                  c.lui        a3, 7
                  srai         t1, a5, 7
                  la           a6, amo_0+8 #start riscv_lr_sc_instr_stream_11
                  slli         t1, s2, 1
                  c.srai       a5, 15
                  divu         a7, a5, s6
                  sltu         gp, a3, a2
                  andi         t3, s4, 1321
                  c.addi4spn   s0, sp, 128
                  lr.w.aq       a1, (a6)
                  sc.w          s8, a7, (a6) #end riscv_lr_sc_instr_stream_11
                  div          t1, t0, a0
                  mulh         a6, s2, sp
                  sll          s10, s11, t1
                  c.srai       a5, 20
                  beq          t2, s2, 2158f
                  addi         t0, a4, -1720
                  slti         zero, s1, -1605
                  c.or         a5, a2
                  beq          s8, a4, 2171f
                  lui          a7, 111701
                  auipc        a3, 943269
                  add          t4, s6, a1
                  mulhu        t0, gp, ra
                  nop
                  mulh         t1, tp, s3
2158:             or           zero, s0, a3
                  c.mv         a7, t1
                  remu         a3, a1, s6
                  c.mv         a6, t3
                  blt          s4, zero, 2169f
                  c.mv         s9, s7
                  c.lui        s7, 5
                  div          zero, zero, t6
                  divu         a3, t6, s7
                  and          a4, t3, ra
                  c.srli       a2, 4
2169:             mul          a7, s1, s0
                  andi         sp, t0, -405
2171:             c.sub        a4, a3
                  c.srai       s1, 23
                  sra          s0, t3, s5
                  c.lui        a5, 24
                  c.mv         s9, s2
                  mulh         s0, t3, t5
                  add          s6, a3, a2
                  nop
                  mulhu        s11, a6, a2
                  bgeu         t6, gp, 2193f
                  c.add        a7, a2
                  lui          zero, 283966
                  c.li         s11, 22
                  slli         a4, s4, 17
                  bge          a1, s6, 2198f
                  nop
                  c.nop
                  and          s6, a4, a5
                  c.beqz       a3, 2202f
                  slti         a5, s0, 1634
                  xori         s1, s11, 2022
                  bne          s11, s4, 2204f
2193:             srl          s8, a5, t1
                  sltu         t0, t0, a0
                  slti         t0, s3, -1951
                  bne          zero, a1, 2213f
                  srli         a5, a5, 17
2198:             nop
                  or           s7, s1, a0
                  c.li         tp, 3
                  srl          sp, s8, t5
2202:             c.or         a4, a0
                  nop
2204:             c.srai       s1, 26
                  c.bnez       a3, 2223f
                  c.li         s8, 8
                  bne          gp, t1, 2220f
                  srli         t1, a4, 21
                  remu         s10, a3, a2
                  sll          ra, s8, s0
                  c.sub        a2, a5
                  c.srai       a1, 27
2213:             c.addi16sp   sp, -16
                  ori          s1, zero, -346
                  bge          t2, s11, 2221f
                  mul          s1, s6, t1
                  mul          s10, s2, a1
                  divu         gp, t1, s7
                  srli         ra, t2, 10
2220:             c.mv         a1, t3
2221:             remu         s0, a4, s6
                  slti         t0, t0, -1949
2223:             sra          s9, a3, tp
                  c.mv         s11, a2
                  bge          t3, t2, 2243f
                  bltu         t1, s1, 2241f
                  c.srai       s0, 26
                  slti         t3, s1, 1776
                  divu         a5, gp, s7
                  c.addi4spn   a3, sp, 144
                  c.and        a5, a1
                  divu         t5, s11, s5
                  c.xor        s1, a4
                  c.lui        t1, 4
                  c.mv         a4, s8
                  c.li         s11, -1
                  blt          tp, s2, 2256f
                  slt          s9, s7, s9
                  c.addi4spn   a3, sp, 560
                  bltu         s1, s9, 2257f
2241:             bge          s0, s6, 2248f
                  slti         t3, s7, -748
2243:             c.addi4spn   a5, sp, 944
                  c.xor        s1, s0
                  xor          gp, t2, a1
                  srli         s9, ra, 4
                  mulhsu       t5, t5, s6
2248:             c.and        a5, s0
                  lui          s1, 898292
                  c.nop
                  srli         t5, a4, 23
                  auipc        t2, 834143
                  nop
                  c.srli       a4, 28
                  srli         ra, t6, 18
2256:             mul          gp, t1, s4
2257:             beq          tp, s8, 2274f
                  srl          s6, t0, a7
                  c.xor        s0, a2
                  andi         tp, s0, 1675
                  sltu         s10, s11, t2
                  sra          a2, s10, sp
                  c.beqz       a2, 2277f
                  ori          t1, a2, 1494
                  add          t6, t5, s1
                  srli         s9, t5, 16
                  c.slli       t3, 23
                  srai         t5, t1, 26
                  c.srai       a2, 22
                  sltu         s7, a0, s7
                  or           zero, s6, a1
                  c.slli       s6, 21
                  mulhu        t3, zero, s11
2274:             c.andi       a2, 21
                  c.xor        s1, a1
                  c.lui        a7, 25
2277:             beq          s10, s7, 2293f
                  divu         sp, t4, t4
                  slli         t2, a7, 23
                  bltu         s8, t2, 2281f
2281:             c.addi4spn   a3, sp, 992
                  c.nop
                  remu         s1, t4, a7
                  sltiu        t5, gp, 248
                  mulhu        t2, s3, s11
                  srli         a5, zero, 29
                  bltu         zero, s6, 2288f
2288:             sra          a4, a6, a4
                  div          s4, a0, t1
                  remu         t3, s11, s1
                  c.add        s10, s10
                  c.add        tp, s7
2293:             srl          tp, a3, t5
                  auipc        s4, 716462
                  c.addi       s10, -1
                  slt          a7, a0, a3
                  addi         s0, t0, 1303
                  xor          a3, s3, t4
                  srai         t5, t3, 1
                  c.li         gp, -1
                  slti         s7, t3, 1522
                  c.bnez       s0, 2315f
                  c.sub        a4, s1
                  c.or         a2, a2
                  or           a2, ra, s5
                  divu         s10, t2, s10
                  srli         s8, tp, 0
                  c.addi4spn   a1, sp, 112
                  c.nop
                  slli         s6, s11, 19
                  c.srai       a2, 29
                  divu         t0, s0, tp
                  srl          s6, a1, t5
                  c.srli       s1, 1
2315:             nop
                  lui          sp, 978132
                  or           tp, a3, s2
                  sll          ra, t1, s6
                  add          t0, a7, tp
                  c.bnez       a5, 2338f
                  c.addi4spn   a2, sp, 608
                  auipc        t6, 1015838
                  divu         t6, a5, t4
                  beq          a5, s3, 2344f
                  c.li         t1, -1
                  c.addi16sp   sp, 160
                  bne          t6, s9, 2346f
                  c.addi16sp   sp, -16
                  c.srli       a3, 28
                  mul          a6, ra, t1
                  c.slli       s1, 9
                  c.andi       a1, -1
                  c.beqz       a1, 2335f
                  beq          s11, t5, 2345f
2335:             or           sp, a5, a3
                  auipc        s7, 275075
                  c.lui        t4, 10
2338:             slt          s8, t2, a0
                  slti         a4, a2, -1701
                  bge          a4, ra, 2353f
                  c.mv         ra, s9
                  slli         gp, a3, 15
                  bne          s2, a0, 2346f
2344:             and          s4, s9, s7
2345:             mul          s10, t6, s8
2346:             andi         s3, gp, -1073
                  c.or         s1, a4
                  lui          ra, 792102
                  c.mv         a7, a1
                  c.xor        a3, a5
                  slti         a1, s5, 1026
                  lui          ra, 980156
2353:             c.addi       t6, -1
                  sltu         t0, a6, a5
                  auipc        sp, 176590
                  remu         t4, s3, s5
                  sub          t2, ra, a4
                  xor          zero, gp, s5
                  srl          t3, t5, gp
                  mulhsu       s6, t5, s2
                  sltiu        t0, t6, 536
                  bne          ra, t1, 2381f
sub_4_45:         jal          t3, 6f
0:                c.j          1f
1:                jal          t1, 9f
2:                c.jal        3f
3:                c.j          10f
4:                jal          t1, 2b
5:                c.jal        0b
6:                c.jal        8f
7:                c.jal        5b
8:                c.j          7b
9:                c.j          4b
10:               mulh         t1, a3, s3
                  c.bnez       a1, 2376f
                  sltu         t3, s4, t3
                  c.or         a2, s1
                  andi         s10, s7, 1256
                  srai         s1, t0, 24
                  and          s1, s4, s7
                  srl          s11, t4, s10
                  mulh         s6, a7, sp
                  c.li         tp, 22
                  c.addi4spn   a2, sp, 416
                  c.xor        a2, s1
                  c.bnez       s0, 2382f
                  c.and        s0, a1
2376:             c.addi4spn   a5, sp, 848
                  c.addi       t5, -1
                  sltiu        a7, s8, 1301
                  c.andi       s0, -1
                  or           t3, t5, gp
2381:             c.lui        t1, 25
2382:             rem          a7, s3, a1
                  c.srli       a4, 8
                  lui          s1, 106074
                  mulhu        zero, a2, s3
                  divu         a3, ra, s7
                  c.addi16sp   sp, 288
                  sub          s10, s11, s4
                  c.beqz       s0, 2402f
                  bltu         a6, s1, 2406f
                  bge          s9, a6, 2405f
                  sltu         a2, s11, a5
                  srli         a7, a1, 9
                  c.or         a3, a0
                  c.addi16sp   sp, 352
                  srai         s4, t0, 3
                  lui          s0, 268351
                  c.srli       s0, 16
                  sltiu        a7, t0, -5
                  c.sub        a2, a1
                  and          a1, tp, t2
2402:             sub          s6, t6, s11
                  xori         t6, zero, 717
                  mulhsu       t5, a5, t2
2405:             slti         t1, s2, -658
2406:             c.li         gp, -1
                  bge          s8, ra, 2425f
                  c.srli       a2, 21
                  c.li         s11, -1
                  c.or         a2, a5
                  c.addi4spn   s1, sp, 400
                  bne          s8, s8, 2416f
                  rem          a7, s4, a0
                  and          s8, s10, s7
                  sltu         s6, t1, s11
2416:             lui          a4, 410396
                  slt          sp, s7, a7
                  nop
                  c.addi       a4, 21
                  bne          s0, s0, 2423f
                  slt          ra, a3, s1
                  c.or         a2, a1
2423:             beq          s5, t6, 2435f
                  c.slli       t5, 23
2425:             lui          a4, 226284
                  bltu         t2, ra, 2437f
                  auipc        a1, 459861
                  srli         a2, a2, 3
                  beq          t3, t2, 2432f
                  xori         sp, a2, 1305
                  sltiu        a6, t3, 678
2432:             mul          a7, t3, a4
                  c.xor        s0, s1
                  blt          t5, t6, 2452f
2435:             mulhu        s8, a1, t4
                  xori         s10, s1, -976
2437:             xor          s0, t0, sp
                  bge          sp, sp, 2451f
                  beq          s4, t3, 2457f
                  sub          s0, t6, s9
                  mulhu        t0, gp, zero
                  andi         gp, a6, -187
                  lui          a1, 187392
                  bge          a5, t3, 2452f
                  c.addi4spn   a2, sp, 656
                  remu         tp, a0, a5
                  c.srai       s0, 26
                  slli         a3, t6, 30
                  c.addi16sp   sp, -16
                  mulhsu       s4, sp, a4
2451:             c.add        s4, ra
2452:             addi         a4, tp, -1934
                  c.slli       t0, 2
                  c.lui        tp, 22
                  mulhu        s10, s2, t6
                  c.srli       s0, 6
2457:             bgeu         a5, t5, 2477f
                  c.and        a5, s0
                  c.nop
                  addi         s0, s4, -1329
                  c.beqz       a1, 2474f
                  xor          zero, t0, a7
                  c.addi4spn   a1, sp, 224
                  c.sub        a2, a0
                  mulhsu       t2, s7, a4
                  bne          a5, s0, 2482f
                  c.addi4spn   a5, sp, 784
                  andi         s10, a6, 571
                  c.addi4spn   a1, sp, 144
                  and          zero, a3, tp
                  div          a4, a4, a0
                  c.nop
                  auipc        s6, 340383
2474:             sltiu        sp, s11, -653
                  mulh         s1, s8, a3
                  c.bnez       s0, 2492f
2477:             c.srli       a1, 17
                  lui          t3, 939346
                  xori         a3, s10, 999
                  c.beqz       a3, 2481f
2481:             c.lui        s4, 11
2482:             remu         t4, a6, a1
                  sltu         a7, s4, a0
                  andi         a4, t3, 1778
                  blt          s10, a4, 2504f
                  c.add        ra, s6
                  c.or         a3, a0
                  srai         gp, t0, 13
                  sltiu        t1, t1, -772
                  c.slli       t5, 31
                  c.lui        s8, 16
2492:             mul          ra, ra, t3
                  mul          t6, a0, t1
                  divu         a6, t2, s11
                  div          t6, s7, s11
                  srai         zero, s8, 9
                  c.li         s0, -1
                  c.bnez       a4, 2504f
                  c.addi4spn   s1, sp, 288
                  c.and        a2, s0
                  bne          a0, s5, 2515f
                  bne          s8, t5, 2519f
                  c.srli       s1, 11
2504:             andi         s10, t1, 264
                  c.sub        a5, s1
                  andi         s9, s6, -161
                  c.xor        a5, a5
                  or           s9, a4, s3
                  sltiu        s9, t3, -826
                  andi         t0, t2, -1858
                  c.mv         a1, a3
                  divu         ra, s8, a2
                  addi         s4, s0, -1193
                  c.xor        a4, a3
2515:             c.srli       s0, 19
                  andi         a2, t0, 741
                  mulhsu       a7, s2, s9
                  c.li         s4, 17
2519:             slti         a1, t4, -861
                  xori         t0, gp, 223
                  or           gp, a4, s7
                  div          s10, s1, s11
                  sra          s9, t0, s4
                  srai         s4, a0, 22
                  addi         s9, s4, 1129
                  c.slli       s3, 12
                  c.lui        s7, 1
                  andi         a5, a7, 1660
                  c.addi       a6, 23
                  andi         s0, t2, 1077
                  slt          ra, s2, t3
                  divu         s11, s5, t2
                  c.lui        a2, 3
                  c.andi       a3, 2
                  c.xor        s0, a4
                  or           t2, t2, t3
                  nop
                  xori         s10, s9, 1001
                  c.and        a1, a5
                  srl          t0, a6, sp
                  xori         s7, s9, -1980
                  sll          s10, t3, t4
                  c.sub        s0, a5
                  ori          s6, s2, -2015
                  andi         s7, t5, 705
                  beq          a6, t6, 2558f
                  andi         t2, s6, 1295
                  c.add        a6, t6
                  nop
                  mulh         a7, t3, a3
                  srli         t4, tp, 23
                  slli         ra, a3, 2
                  mulhsu       s0, t5, a2
                  c.andi       a3, 13
                  add          t4, s2, a5
                  divu         a7, s1, t2
                  c.add        t3, t1
2558:             c.srli       s1, 9
                  divu         s9, s5, s6
                  c.addi16sp   sp, -16
                  c.li         t4, 29
                  blt          t6, a2, 2573f
                  divu         t4, s3, s8
                  c.beqz       s0, 2582f
                  xori         t6, s9, 1889
                  sltiu        s11, s0, 626
                  slti         a6, t0, 1131
                  c.beqz       a1, 2569f
2569:             add          t1, s10, s0
                  c.addi       ra, 8
                  bltu         t6, a5, 2584f
                  auipc        s10, 336290
2573:             c.xor        a5, a4
                  slti         a5, t2, 1662
                  c.add        t3, a5
                  c.add        t1, t0
                  beq          gp, s8, 2594f
                  srl          tp, s5, zero
                  sltu         a6, s11, s7
                  c.bnez       s0, 2593f
                  c.addi16sp   sp, 416
2582:             nop
                  c.addi16sp   sp, 208
2584:             xor          s6, s5, s10
                  addi         s0, s5, 1002
                  c.srli       a2, 30
                  c.add        s0, a3
                  mulhsu       a1, s6, s10
                  sll          a7, zero, s8
                  c.addi16sp   sp, 336
                  mulhsu       a5, a2, t5
                  c.beqz       s1, 2611f
2593:             bge          sp, s4, 2597f
2594:             c.li         s11, -1
                  c.lui        a3, 26
                  bgeu         s4, s1, 2603f
2597:             remu         sp, t4, s10
                  c.add        t0, tp
                  addi         s11, s2, -404
                  xori         s9, s6, -1582
                  mulhsu       t3, t6, t6
                  addi         s10, zero, 1410
2603:             or           gp, s9, t0
                  bgeu         s7, a4, 2606f
                  c.xor        a5, a4
2606:             c.srli       a2, 5
                  sltiu        gp, a0, -1219
                  mulhu        s8, a3, s2
                  div          zero, sp, a3
                  srli         t0, t0, 18
2611:             c.mv         t1, t3
                  c.or         a5, s1
                  c.slli       s0, 27
                  c.nop
                  andi         tp, t1, -1074
                  c.mv         s9, t3
                  sll          t4, s5, a5
                  c.andi       a1, 16
                  srai         t1, a1, 16
                  addi         s1, t3, 1159
                  c.and        a5, a5
                  c.srai       s1, 25
                  mulhu        ra, a0, s2
                  xori         t3, t4, 1114
                  c.lui        s10, 21
                  c.mv         a5, s1
                  c.addi4spn   a4, sp, 32
                  c.xor        a2, a1
                  c.add        t3, t2
                  xor          t2, s4, s3
                  c.add        t5, sp
                  bgeu         s4, t3, 2651f
                  c.lui        a2, 31
                  mulh         zero, a1, a7
                  sra          t0, a1, a6
                  srai         s3, sp, 17
                  sltu         t4, tp, s4
                  lui          t6, 270039
                  c.srai       s0, 11
                  c.andi       a4, 0
                  c.srai       a4, 21
                  sub          a6, t3, s4
                  srli         t0, a4, 18
                  slti         s3, t1, -2004
                  mul          a2, a1, a6
                  divu         s1, a6, a0
                  slli         s9, t1, 3
                  c.mv         t3, a1
                  c.nop
                  xor          t3, s4, s3
2651:             ori          t3, tp, 748
                  c.nop
                  bne          s8, s1, 2656f
                  bge          s4, s0, 2665f
                  c.add        s6, t6
2656:             c.xor        s1, a2
                  nop
                  sltiu        a1, s6, 9
                  c.srai       a3, 9
                  ori          t5, s9, 88
                  sub          s4, t6, a6
                  auipc        ra, 297686
                  or           a3, s8, a0
                  bgeu         t1, t2, 2678f
2665:             c.addi       t4, -1
                  mulh         t2, s7, a0
                  bltu         s11, s6, 2682f
                  sltiu        a7, s10, 1531
                  c.mv         t1, s4
                  slti         a2, sp, -595
                  c.sub        a5, a5
                  xori         s0, a5, 404
                  c.addi       t5, -1
                  and          a7, t1, t2
                  c.slli       s8, 21
                  c.slli       t5, 27
                  lui          t4, 760299
2678:             addi         s9, a3, -606
                  beq          s1, a4, 2697f
                  lui          s9, 152822
                  slli         t4, t2, 22
2682:             add          a5, s7, s10
                  divu         ra, tp, a1
                  bne          a5, a6, 2696f
                  andi         a5, t0, -72
                  mulhsu       s3, t5, s5
                  c.addi       t3, 11
                  nop
                  bne          t1, ra, 2702f
                  slti         t1, s2, 136
                  srli         sp, s0, 19
                  c.mv         t0, tp
                  c.or         a3, a2
                  c.andi       a5, 8
                  slli         sp, s9, 18
2696:             mulhu        t3, a7, s3
2697:             c.slli       s0, 15
                  div          ra, t1, t6
                  andi         s9, zero, 1771
                  div          a1, s11, a1
                  c.nop
2702:             mulhu        s9, gp, s1
                  beq          t4, tp, 2722f
                  slli         a6, s5, 8
                  c.sub        s1, a4
                  c.addi4spn   a5, sp, 976
                  bltu         a2, a5, 2725f
                  c.addi16sp   sp, 288
                  addi         zero, s4, -1293
                  bge          s9, t5, 2712f
                  sltiu        s4, s2, -1455
2712:             bgeu         s2, t4, 2726f
                  c.addi16sp   sp, -16
                  c.slli       s6, 4
                  c.mv         sp, t0
                  or           t5, t6, t4
                  bltu         a6, t6, 2728f
                  andi         t4, s6, 1228
                  srli         t2, zero, 0
                  lui          s6, 211362
                  c.and        a2, s0
2722:             srli         a6, s2, 0
                  bltu         a4, s0, 2736f
                  c.srli       s1, 5
2725:             slli         a4, sp, 5
2726:             srai         t4, a2, 25
                  c.bnez       a2, 2728f
2728:             andi         gp, t6, -1296
                  c.slli       sp, 11
                  andi         a5, s9, -950
                  c.lui        a1, 16
                  or           t4, a7, s6
                  c.addi4spn   s0, sp, 960
                  mulhu        a4, a3, s1
                  bge          a7, s10, 2739f
2736:             c.addi       s11, -1
                  c.slli       s8, 23
                  divu         t1, sp, t4
2739:             c.addi16sp   sp, 352
                  addi         t6, a3, -1720
                  andi         a4, s11, 304
                  lui          s4, 510240
                  c.xor        a4, a1
                  c.and        a1, a5
                  bne          a4, t1, 2758f
                  sltiu        s1, t5, 1825
                  xor          sp, a0, s7
                  srli         s6, s4, 28
                  c.bnez       a5, 2767f
                  auipc        a7, 973454
                  c.or         s0, s0
                  slti         s0, a1, -152
                  rem          t2, t0, a6
                  div          s7, a5, a7
                  c.li         s3, 5
                  mulhsu       tp, s5, a4
                  addi         a6, s3, -1387
2758:             c.srai       s1, 6
                  mulhu        t2, a0, a5
                  bne          s3, s2, 2779f
                  srai         a2, t4, 10
                  bgeu         t0, a7, 2763f
2763:             beq          t3, s4, 2766f
                  c.li         t0, 4
                  c.bnez       a3, 2776f
2766:             slt          s6, a7, t5
2767:             div          gp, t2, s6
                  c.or         a5, a0
                  c.lui        t3, 14
                  c.addi       s7, 10
                  srl          s11, s7, tp
                  rem          s3, s11, a2
                  srli         sp, tp, 0
                  sltiu        sp, s5, 1110
                  addi         t4, a4, -1890
2776:             bne          t6, a5, 2779f
                  add          t3, a4, t0
                  slli         s6, s6, 15
2779:             c.or         a3, a1
                  c.or         a1, s0
                  c.andi       s0, 18
                  or           s0, a7, zero
                  bne          sp, sp, 2800f
                  lui          t2, 775431
                  mul          gp, gp, t0
                  auipc        t3, 138847
                  srli         a2, tp, 29
                  remu         t1, a5, a5
                  andi         t5, s6, -1840
                  remu         t2, a4, ra
                  lui          t6, 112266
                  slti         a1, a6, 66
                  mul          zero, ra, t0
                  slt          a6, t5, a5
                  mulhu        tp, zero, a3
                  auipc        a2, 729305
                  divu         a2, s1, a6
                  sub          gp, sp, t5
                  c.addi16sp   sp, -16
2800:             c.and        a1, a4
                  addi         s4, zero, 528
                  sll          s8, t0, tp
                  sra          t4, t4, a5
                  rem          a1, s0, a7
                  srli         t0, a0, 22
                  sltiu        s3, s4, 343
                  srl          s4, t4, tp
                  bltu         t5, s3, 2816f
                  rem          t5, a1, s8
                  add          sp, a6, t5
                  add          s3, s8, s5
                  c.add        sp, s5
                  mul          a7, s7, s8
                  divu         s8, s4, s7
                  srli         s0, t3, 30
2816:             auipc        t0, 1009062
                  c.lui        a1, 12
                  c.addi4spn   a1, sp, 816
                  c.srai       a5, 15
                  add          a6, tp, s5
                  bne          s7, t2, 2827f
                  c.add        s0, t4
                  mulh         a4, s8, s5
                  or           t5, s11, s1
                  c.li         t5, 5
                  sra          gp, s4, s10
2827:             addi         t2, a2, -333
                  c.nop
                  srli         tp, s0, 26
                  c.addi4spn   s1, sp, 960
                  bltu         s8, sp, 2851f
                  srai         tp, a1, 5
                  slt          ra, a4, s8
                  addi         s11, a2, -1883
                  add          s6, t4, s4
                  srli         t2, s2, 25
                  c.addi       s1, 31
                  and          sp, t1, t6
                  remu         a1, s6, a2
                  c.bnez       s0, 2856f
                  sltiu        s8, gp, 494
                  sltiu        t6, t3, -424
                  or           a7, t0, a4
                  sub          ra, t1, a6
                  c.slli       t2, 12
                  div          a4, s2, s1
                  mulhu        s10, t1, tp
                  la           a6, region_0+939 #start riscv_load_store_rand_instr_stream_19
                  lui          s10, 774430
                  lbu          s1, 8(a6)
                  sb           s10, 30(a6)
                  c.xor        a5, a5
                  andi         t1, s8, -1937
                  ori          s8, a0, 383
                  c.addi       s9, 3
                  lbu          t5, 40(a6)
                  c.xor        s0, a2
                  sh           t5, 3(a6)
                  divu         a2, s0, s3
                  sb           s4, 53(a6)
                  sb           t0, 53(a6)
                  mulhu        t2, s5, t0
                  lb           t1, -42(a6)
                  srai         s3, zero, 18
                  or           a2, s3, s6
                  sw           a3, 41(a6)
                  lw           s3, -63(a6)
                  lb           s4, 19(a6)
                  lbu          a4, 8(a6)
                  mulhsu       s6, s2, s0
                  sb           s10, -61(a6)
                  sh           s10, 35(a6)
                  lbu          tp, -63(a6)
                  sb           s3, -16(a6)
                  rem          zero, a0, s2
                  sb           t6, -36(a6) #end riscv_load_store_rand_instr_stream_19
                  and          zero, gp, a2
                  addi         ra, gp, -1468
                  srl          t5, a3, s7
2851:             ori          t2, s6, -1736
                  or           tp, s7, zero
                  mulh         tp, s8, gp
                  xori         t0, s4, 1139
                  lui          t1, 323539
2856:             srli         s9, t6, 3
                  slt          s6, s8, s5
                  c.nop
                  and          s4, a3, ra
                  c.lui        s8, 24
                  divu         sp, t6, s8
                  c.lui        t1, 7
                  slt          a6, zero, a6
                  c.slli       t4, 10
                  c.nop
                  srl          a4, t1, t0
                  bge          t5, a7, 2874f
                  c.or         s0, a5
                  mulhu        s9, s0, t5
                  slt          s1, sp, s1
                  c.srai       s0, 23
                  and          gp, t0, s7
                  mul          t0, s7, s4
2874:             addi         zero, s2, -1239
                  mulhsu       a1, t1, a6
                  c.slli       t0, 10
                  beq          s9, s3, 2890f
                  c.nop
                  bgeu         t0, sp, 2896f
                  c.srai       a1, 19
                  mulh         s0, s4, a6
                  c.nop
                  bne          a6, t0, 2898f
                  slli         a3, gp, 25
                  c.addi4spn   a1, sp, 448
                  or           t4, s6, a4
                  slt          t4, s5, s2
                  c.xor        a2, a2
                  slti         s10, s4, 490
2890:             c.sub        a3, a5
                  or           sp, tp, t4
                  slli         t0, t4, 21
                  srli         s0, sp, 1
                  c.nop
                  srai         s1, a2, 31
2896:             mulhsu       a1, t5, s5
                  sub          t3, a0, a0
2898:             lui          t2, 739022
                  add          s0, gp, s11
                  slt          s10, t4, a7
                  c.lui        gp, 24
                  bne          s6, sp, 2918f
                  srl          t5, s5, a2
                  c.beqz       s0, 2918f
                  c.add        t4, s2
                  c.srai       a1, 19
                  c.addi16sp   sp, 496
                  bne          a2, s4, 2927f
                  mulh         s7, tp, a1
                  c.addi16sp   sp, -16
                  c.add        t4, s0
                  mulhu        a3, s0, t4
                  sltiu        s4, t4, -398
                  add          t4, s1, s1
                  srli         s9, a1, 29
                  sltu         a2, t1, s6
                  xori         s6, s3, -1679
2918:             divu         s4, t0, a5
                  c.addi       t2, 22
                  xori         s11, t0, 1759
                  la           sp, region_1+702 #start riscv_hazard_instr_stream_11
                  sll          s8, s7, s8
                  lh           s10, 718(sp)
                  lbu          s7, 119(sp)
                  auipc        a7, 454819
                  auipc        s8, 837740
                  lbu          s8, -445(sp)
                  lbu          a7, 935(sp)
                  lbu          s10, 674(sp)
                  sb           s8, 517(sp)
                  lui          s10, 315853
                  lb           s10, -337(sp)
                  xor          s8, a7, t4
                  lb           a4, 955(sp)
                  lb           t4, -66(sp)
                  lhu          a4, 392(sp)
                  sra          s7, s7, t4
                  srai         s7, s10, 29
                  sh           s8, 726(sp)
                  sub          a4, s8, s8
                  slti         a4, a7, -1952
                  sw           a4, 846(sp)
                  slt          a4, a7, t4
                  sltiu        t4, s10, -1633
                  lhu          s10, 858(sp)
                  nop
                  lb           s10, 922(sp)
                  lbu          s8, 1126(sp)
                  mulh         s8, t4, a7
                  lb           a4, 45(sp)
                  sb           s10, 1175(sp)
                  lb           s7, -631(sp)
                  lbu          s7, 411(sp) #end riscv_hazard_instr_stream_11
                  nop
                  c.mv         s0, t6
                  sll          a6, t4, s8
                  c.mv         t6, s3
                  beq          a0, t4, 2942f
                  c.xor        s1, s1
2927:             slli         a4, s9, 4
                  mul          a6, ra, s6
                  c.addi16sp   sp, 288
                  c.xor        a2, a0
                  c.andi       a2, 27
                  mulh         tp, sp, t6
                  and          a4, tp, t3
                  c.addi       s9, 11
                  slli         s6, zero, 11
                  beq          t0, s7, 2947f
                  c.andi       a4, 16
                  c.bnez       a1, 2956f
                  c.and        a2, s1
                  srli         a6, t5, 26
                  c.srli       a5, 13
2942:             div          s4, sp, t1
                  addi         s1, s6, -873
                  c.add        ra, gp
                  rem          s1, s11, s8
                  c.andi       a2, -1
2947:             and          s8, t6, s6
                  srai         a2, a4, 3
                  slt          t0, s8, sp
                  add          t5, s6, tp
                  bltu         t6, t2, 2964f
                  nop
                  c.srai       a3, 21
                  mulhsu       t3, a3, zero
                  c.mv         t5, a5
2956:             c.mv         t4, t5
                  or           a7, s10, t1
                  and          a4, a3, s6
                  c.srli       s0, 24
                  sll          s3, s0, a2
                  c.andi       a1, -1
                  slti         a4, ra, 799
                  c.or         a2, a1
2964:             addi         s4, s7, 101
                  ori          s6, s2, -908
                  auipc        a1, 449787
                  divu         t0, a0, s2
                  bgeu         s1, tp, 2987f
                  c.slli       gp, 5
                  bne          t1, s0, 2987f
                  blt          t6, a1, 2983f
                  addi         sp, t6, 1841
                  slt          a4, t3, a6
                  add          t6, a6, a3
                  sltu         t1, s0, t2
                  and          a5, tp, s2
                  c.srli       a2, 13
                  sub          s1, s2, s11
                  remu         s4, a0, t0
                  c.xor        a2, a4
                  mulh         t6, s0, s2
                  sltu         a3, s11, s5
2983:             div          a6, s11, s1
                  lui          s4, 1037447
                  c.lui        gp, 8
                  andi         t2, s3, 607
2987:             sltu         a7, s4, s3
                  c.li         s10, 18
                  c.sub        a1, a2
                  andi         t1, gp, -1957
                  c.addi       t1, 1
                  andi         a4, t3, 1023
                  c.nop
                  c.bnez       s0, 3001f
                  mulh         a2, a3, s0
                  rem          a2, t4, s11
                  mulhsu       s0, gp, a3
                  add          s0, s5, gp
                  slli         t5, a6, 10
                  addi         t1, ra, -1003
3001:             sra          s6, s6, t3
                  sltu         a6, a4, sp
                  add          a7, s10, s9
                  c.li         s1, -1
                  and          t1, s1, t3
                  c.beqz       a3, 3019f
                  auipc        t6, 440679
                  mulhu        s9, sp, s10
                  xori         sp, t4, -2042
                  slt          s3, a5, s3
                  mul          s3, s10, s4
                  xori         t3, t4, -636
                  c.bnez       a1, 3031f
                  c.addi16sp   sp, -16
                  auipc        s9, 476243
                  c.sub        a3, a3
                  sltiu        a5, t6, 966
                  bne          s10, ra, 3037f
3019:             srai         t6, s8, 31
                  c.andi       a3, 25
                  bgeu         s1, s2, 3040f
                  mulh         s4, ra, t2
                  sub          a7, a6, zero
                  bgeu         t1, t1, 3028f
                  c.addi       s10, 13
                  c.xor        a3, s0
                  srl          t4, a6, t1
3028:             remu         t6, sp, s1
                  and          t0, t6, a3
                  c.addi4spn   s0, sp, 608
3031:             mulhsu       sp, s7, zero
                  ori          t2, t4, -1001
                  xori         s7, t1, 887
                  sll          a6, a7, s4
                  c.and        a4, a5
                  slti         t6, a3, 935
3037:             slli         s10, s7, 8
                  c.srli       a1, 25
                  nop
3040:             addi         t0, t5, -88
                  auipc        s3, 879632
                  rem          s4, t4, s11
                  sub          t1, tp, t4
                  slli         t1, s1, 11
                  slti         s11, t1, 939
                  sub          a1, t0, ra
                  rem          s8, s9, a3
                  bge          s5, a2, 3062f
                  sra          t0, a3, a3
                  c.andi       a4, -1
                  sltu         s6, s5, s8
                  srl          a7, s8, s4
                  sub          t6, gp, t6
                  c.addi16sp   sp, 240
                  bge          a5, s6, 3068f
                  remu         sp, ra, t1
                  mulhsu       s3, a3, s2
                  sub          a4, s6, a5
                  sltiu        t4, t6, 749
                  bgeu         s2, a2, 3071f
                  c.mv         gp, t1
3062:             mulhsu       s8, t0, s2
                  sra          a4, tp, t4
                  or           t0, a3, a7
                  c.srli       a2, 21
                  srl          s11, zero, a5
                  c.andi       a4, -1
3068:             sll          t0, s2, a5
                  srli         t3, s6, 4
                  bgeu         ra, t2, 3090f
3071:             c.srli       a1, 13
                  bgeu         s6, t1, 3090f
                  auipc        a5, 11265
                  mul          t2, s1, a0
                  c.li         t5, 9
                  rem          s0, s8, s1
                  remu         a4, a7, a2
                  c.and        a1, a5
                  slli         s0, a7, 12
                  c.addi4spn   a2, sp, 896
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  c.nop
                  c.and        a5, a0
                  rem          zero, a5, s2
                  c.xor        s0, a4
                  srl          a2, ra, a6
                  sra          t6, s0, s6
                  c.mv         s10, a4
3090:             blt          a1, t4, 3096f
                  c.mv         s3, a0
                  bgeu         a4, t0, 3095f
                  c.bnez       a5, 3101f
                  c.srai       s1, 1
3095:             c.nop
3096:             sub          s10, gp, s6
                  bltu         a3, sp, 3110f
                  mulhsu       s3, t0, s10
                  mulhsu       t5, a3, s10
                  rem          gp, a0, s9
3101:             mul          a7, s9, s6
                  bge          s2, a4, 3104f
                  c.slli       t2, 25
3104:             c.nop
                  xori         s11, s3, 1832
                  mul          s9, t0, sp
                  c.li         a4, 1
                  mulhsu       s9, t3, tp
                  c.beqz       a2, 3125f
3110:             sltu         a3, zero, zero
                  bgeu         t4, t2, 3127f
                  srl          a7, t4, a2
                  beq          a4, s8, 3116f
                  xor          a3, s10, s3
                  slt          a6, s4, t3
3116:             addi         s1, t5, -1514
                  c.addi16sp   sp, 48
                  add          s3, s7, t4
                  or           s3, a7, sp
                  c.addi16sp   sp, 144
                  c.bnez       a2, 3135f
                  xori         t5, t0, -1977
                  c.srli       a5, 26
                  c.xor        a3, s1
3125:             mul          gp, zero, s4
                  c.mv         a4, a7
3127:             c.slli       a2, 13
                  slti         a6, gp, 1128
                  mul          a4, a4, s2
                  blt          t6, s8, 3145f
                  slt          a5, a0, a5
                  addi         a6, t5, -753
                  c.or         a4, a0
                  c.slli       ra, 6
3135:             c.addi16sp   sp, -16
                  c.addi       s1, 12
                  c.sub        a3, s0
                  srl          sp, a2, t2
                  mulh         t3, t3, s10
                  mul          a7, s8, zero
                  c.li         t5, -1
                  mul          t1, a6, a5
                  rem          s10, a0, tp
                  sub          s10, a6, sp
3145:             rem          gp, s8, s11
                  c.xor        s1, a5
                  sub          a1, a1, a5
                  bne          a6, s4, 3149f
3149:             slti         a6, t6, -1812
                  c.beqz       a3, 3151f
3151:             c.lui        t4, 8
                  add          s4, a5, t2
                  nop
                  divu         ra, t1, zero
                  c.slli       s11, 3
                  c.li         t0, -1
                  xori         a6, s11, 483
                  slli         a6, tp, 31
                  c.addi       a3, -1
                  slti         a2, t1, -1638
                  c.li         s4, 17
                  c.sub        a4, a4
                  bge          s6, ra, 3171f
                  blt          s6, a7, 3177f
                  srl          s0, t6, t6
                  divu         a2, t3, s4
                  andi         a3, zero, 725
                  la           sp, region_1+553 #start riscv_hazard_instr_stream_19
                  lw           s10, 115(sp)
                  rem          ra, s10, a6
                  c.andi       a4, 1
                  c.srli       a5, 1
                  sltiu        a6, ra, -1081
                  lbu          ra, -191(sp)
                  c.sub        a5, a4
                  lb           s10, 68(sp)
                  xor          a5, ra, ra
                  lhu          a5, -255(sp)
                  c.srli       a5, 20
                  auipc        a6, 884012
                  c.slli       a4, 13
                  lb           a6, 141(sp)
                  lhu          s10, -229(sp)
                  sw           s7, -25(sp)
                  sh           s7, -1(sp)
                  c.srai       a4, 17
                  sw           a6, 251(sp)
                  sb           a4, 22(sp)
                  c.xor        a5, a5
                  lw           a6, 95(sp)
                  c.srai       a4, 27
                  div          ra, a6, a6
                  slti         s10, s7, 1730
                  lb           a6, 140(sp)
                  sub          ra, s10, s7
                  lbu          ra, 91(sp) #end riscv_hazard_instr_stream_19
                  sra          s6, s7, s9
                  c.nop
                  c.add        tp, s6
3171:             mulhu        s8, s10, gp
                  c.mv         t0, a3
                  div          a5, s2, zero
                  c.add        t0, a3
                  sll          zero, t4, t3
                  bltu         a6, s2, 3189f
3177:             xori         a6, a0, 1524
                  c.xor        a3, a5
                  beq          s1, s7, 3198f
                  blt          a7, a7, 3196f
                  c.nop
                  sltiu        a5, ra, -916
                  sll          a7, t0, ra
                  c.srli       a3, 18
                  bltu         ra, s5, 3187f
                  slti         s11, gp, -620
3187:             c.xor        a2, a4
                  c.xor        s0, a2
3189:             mul          t3, a7, s4
                  div          a4, t1, s0
                  blt          s0, ra, 3194f
                  beq          t0, t1, 3209f
                  and          s6, s10, gp
3194:             bgeu         s9, t0, 3212f
                  slli         a5, t2, 16
3196:             c.srli       a1, 20
                  srli         s8, a1, 17
3198:             xor          a5, a6, a4
                  sltiu        s3, t3, 1887
                  bltu         s4, tp, 3214f
                  xori         s11, s9, 143
                  bne          a5, ra, 3218f
                  sra          a7, ra, t2
                  bltu         s4, zero, 3216f
                  div          s7, a4, t5
                  bltu         a4, tp, 3212f
                  xori         s1, a4, -1210
                  c.andi       a5, 17
3209:             rem          a1, s6, s5
                  add          s3, s7, t1
                  divu         t0, s1, a7
3212:             c.srai       a5, 11
                  sltu         a7, a6, sp
3214:             sub          s3, s9, s10
                  mulh         a5, t0, t4
3216:             slt          tp, s11, s10
                  mul          gp, a6, a1
3218:             beq          s1, t1, 3229f
                  srl          a1, t5, a4
                  blt          a1, t3, 3235f
                  rem          sp, a5, zero
                  div          s3, s0, a2
                  andi         a4, sp, -1193
                  mul          s10, a5, t3
                  xor          sp, a6, s0
                  srai         s3, s6, 18
                  c.srai       a5, 29
                  beq          s11, t5, 3229f
3229:             c.slli       tp, 28
                  sltu         ra, t6, s3
                  srl          a6, s2, t2
                  sra          s4, t5, s6
                  c.or         a3, a0
                  slt          a5, s5, t1
3235:             addi         s3, t5, 276
                  c.slli       s3, 17
                  c.lui        s10, 27
                  andi         a4, t5, 274
                  c.mv         s6, sp
                  and          t2, a7, t5
                  c.nop
                  c.addi       ra, -1
                  c.addi       t2, -1
                  add          s6, sp, a0
                  or           a5, t4, t3
                  mul          t1, t5, t2
                  remu         a5, s2, a0
                  xori         tp, a3, 372
                  c.addi16sp   sp, 32
                  c.or         s1, a5
                  sltiu        s6, s7, -703
                  sll          t3, a5, t6
                  mulhu        t2, s5, s6
                  slti         a1, s6, 291
                  c.li         tp, 9
                  c.xor        a1, a4
                  srl          sp, a2, s10
                  nop
                  c.xor        a1, s0
                  ori          s11, s2, 315
                  c.lui        t5, 23
                  bltu         ra, ra, 3273f
                  bne          t6, s5, 3266f
                  c.beqz       a4, 3271f
                  c.srai       s0, 10
3266:             divu         a3, s9, a4
                  mulh         s9, tp, t6
                  mul          s11, sp, tp
                  mulhu        tp, a1, a7
                  remu         sp, t0, a4
3271:             c.mv         a5, t4
                  c.srli       a3, 15
3273:             bgeu         gp, zero, 3287f
                  slti         s8, a4, 2023
                  divu         a1, t6, s6
                  c.addi       a6, 6
                  c.sub        s0, a5
                  c.srai       s0, 30
                  c.srai       s0, 10
                  c.beqz       a3, 3299f
                  add          s8, a0, s5
                  remu         s6, s2, a4
                  nop
                  c.sub        s0, a4
                  c.andi       s0, 0
                  c.addi16sp   sp, 272
3287:             c.nop
                  bgeu         t4, s0, 3306f
                  c.or         a4, a1
                  mulhu        s3, t2, a4
                  ori          a4, a7, 1114
                  sll          a4, s8, s0
                  sra          zero, gp, a2
                  ori          s4, t4, 1985
                  mulh         s11, t3, s0
                  mulhsu       t4, s9, t1
                  xor          a1, s0, s11
                  c.srli       a4, 8
3299:             bne          s3, s3, 3312f
                  nop
                  bgeu         s2, s9, 3305f
                  sra          s8, s9, t2
                  c.or         a5, s1
                  remu         s7, t4, a4
3305:             c.li         s7, 2
3306:             andi         a2, s6, 1064
                  auipc        t0, 957818
                  bgeu         t1, sp, 3326f
                  blt          t1, t1, 3329f
                  xor          tp, a1, s10
                  c.slli       a3, 5
3312:             c.lui        s11, 9
                  nop
                  c.li         s10, -1
                  c.nop
                  sub          s10, t1, s1
                  mulh         zero, t3, t2
                  ori          s10, t3, 266
                  auipc        a1, 546869
                  srl          a4, t5, a3
                  srli         t5, a3, 10
                  addi         s9, s5, 102
                  sll          s8, s8, t6
                  bltu         sp, a0, 3337f
                  beq          s10, zero, 3344f
3326:             beq          s7, sp, 3343f
                  slti         s6, a4, 1130
                  lui          a6, 474216
3329:             c.xor        a1, s0
                  xori         a1, s8, -843
                  c.addi16sp   sp, 432
                  c.srai       s1, 7
                  c.xor        a5, a0
                  remu         t2, s10, a1
                  c.li         s6, 22
                  c.lui        tp, 1
3337:             c.xor        a5, a3
                  bne          s6, t6, 3339f
3339:             bltu         s9, zero, 3342f
                  slti         tp, s7, -1315
                  c.beqz       a1, 3361f
3342:             mulhsu       s10, zero, t4
3343:             sra          a2, t2, gp
3344:             c.bnez       s0, 3351f
                  andi         s8, ra, -364
                  c.li         a1, 13
                  c.nop
                  slti         a6, a3, 1249
                  c.or         a4, a5
                  addi         a1, s10, 204
3351:             c.addi4spn   a5, sp, 240
                  add          s4, a4, s10
                  add          s7, a7, s4
                  c.li         s10, 7
                  mulh         ra, s4, tp
                  lui          a7, 445440
                  c.add        a1, s11
                  c.slli       a2, 26
                  auipc        s3, 700365
                  blt          t4, tp, 3361f
3361:             mulh         t4, t0, a0
                  mulh         a5, s3, t0
                  bgeu         a1, a1, 3381f
                  c.and        a3, s0
                  c.lui        s8, 5
                  sll          a2, gp, zero
                  c.lui        s8, 31
                  nop
                  srli         t1, s5, 4
                  mulhsu       tp, a6, s1
                  sra          t0, t4, t5
                  c.add        s9, a0
                  lui          t1, 607335
                  rem          a7, s7, a4
                  divu         s7, a7, t4
                  slt          zero, a3, s4
                  lui          s10, 103299
                  addi         t3, t2, 549
                  c.addi4spn   a2, sp, 400
                  sltiu        s7, t6, -1670
3381:             c.andi       a1, -1
                  c.addi       a5, -1
                  c.lui        t1, 13
                  slt          s7, s9, t1
                  and          s6, s0, s10
                  mulhu        s10, s9, a1
                  remu         a2, ra, s10
                  c.bnez       a2, 3399f
                  ori          a1, s11, -1980
                  c.srli       a3, 11
                  c.srli       s0, 12
                  c.mv         s8, a3
                  or           a4, t3, t6
                  slti         a5, a5, 1706
                  beq          s3, a2, 3408f
                  sra          s11, sp, s11
                  c.beqz       s0, 3410f
                  nop
3399:             c.and        s0, s0
                  slti         a6, s11, 704
                  c.lui        t2, 5
                  c.srai       a2, 13
                  c.addi16sp   sp, 128
                  bgeu         s7, s9, 3410f
                  remu         t4, t4, a3
                  blt          ra, t0, 3410f
                  mulhsu       t5, s8, t2
3408:             srli         t3, t3, 12
                  c.beqz       a2, 3422f
3410:             c.srli       a3, 26
                  sltu         t1, a5, t4
                  blt          sp, s3, 3430f
                  c.andi       a1, -1
                  or           s9, s3, sp
                  c.andi       a2, 25
                  c.nop
                  ori          t1, a4, 1110
                  sra          t3, a7, t3
                  c.li         s4, -1
                  slt          s6, a3, s4
                  srai         zero, t0, 13
3422:             slli         a7, a5, 20
                  c.bnez       a1, 3437f
                  blt          t1, ra, 3441f
                  c.and        a5, a5
                  c.addi16sp   sp, -16
                  or           s10, t3, zero
                  c.addi       t2, 14
                  srl          a2, s10, s8
3430:             ori          s7, s2, -374
                  c.nop
                  c.li         a7, -1
                  nop
                  ori          ra, t6, -361
                  xor          t2, t1, zero
                  rem          s7, a1, a5
3437:             c.slli       t0, 15
                  sltu         s3, s1, tp
                  c.mv         a7, a1
                  lui          gp, 600763
3441:             addi         t2, a4, -1285
                  sltiu        ra, t4, 515
                  c.srai       a3, 2
                  slli         s11, s6, 0
                  mul          t4, s8, s6
                  beq          s8, t1, 3457f
                  c.beqz       a5, 3449f
                  la           s7, amo_0+32 #start riscv_lr_sc_instr_stream_3
                  lr.w.aq       s8, (s7)
                  sltiu        s11, a5, -1232
                  divu         t4, t0, s3
                  lui          a6, 144334
                  sc.w.rl       a3, t5, (s7) #end riscv_lr_sc_instr_stream_3
                  srai         s4, s6, 12
3449:             c.srli       a3, 20
                  mulhsu       s10, tp, a5
                  div          t1, a6, sp
                  c.lui        gp, 17
                  sll          t0, t6, ra
                  mul          a4, s11, s4
                  add          t2, s5, s5
                  c.bnez       a2, 3472f
3457:             mul          ra, s6, a4
                  bgeu         a6, zero, 3472f
                  c.beqz       s1, 3476f
                  c.and        a5, a5
                  slt          t0, s8, s5
                  ori          s10, ra, 1634
                  c.addi       gp, 17
                  rem          a2, a1, a4
                  c.xor        a2, s0
                  c.addi16sp   sp, 336
                  mulhsu       s11, a2, tp
                  blt          s0, zero, 3484f
                  blt          tp, s4, 3488f
                  c.andi       a3, 0
                  c.slli       s10, 18
3472:             ori          s3, t1, -1343
                  auipc        s8, 805606
                  sltiu        t6, a1, -418
                  or           s10, s6, sp
3476:             c.lui        t0, 24
                  bge          a1, zero, 3490f
                  sltiu        t2, t3, 1567
                  c.bnez       a1, 3491f
                  c.sub        a3, a0
                  mul          s11, a0, t1
                  c.beqz       a1, 3500f
                  c.addi16sp   sp, -16
3484:             div          s4, a6, s3
                  c.sub        a1, s1
                  beq          s1, s11, 3501f
                  auipc        ra, 910040
3488:             sltiu        a5, s3, 1421
                  div          t0, a4, t4
3490:             nop
3491:             c.slli       a3, 29
                  sltiu        gp, t6, -232
                  srl          a6, s6, s10
                  c.and        s1, a2
                  c.addi       gp, 17
                  c.andi       a4, 12
                  mulh         s7, t3, sp
                  c.srai       s1, 15
                  sll          a4, s9, a4
3500:             bge          s3, a0, 3503f
3501:             ori          s0, t3, 1937
                  c.srai       a5, 28
3503:             c.srli       a4, 28
                  sub          t1, a0, t5
                  slt          t0, a4, a6
                  c.add        sp, t6
                  c.sub        a3, a1
                  ori          a5, t3, 1812
                  addi         sp, t3, -1885
                  c.lui        gp, 16
                  c.slli       t4, 27
                  c.lui        a6, 12
                  c.addi       a3, -1
                  slti         t5, s3, 849
                  div          s10, t1, a7
                  c.sub        a3, a0
                  c.beqz       a5, 3536f
                  srli         tp, a1, 23
sub_4_56:         jal          t3, 11f
0:                jal          a3, 24f
1:                c.jal        4f
2:                jal          t1, 21f
3:                c.jal        13f
4:                jal          ra, 5f
5:                c.j          3b
6:                jal          t1, 20f
7:                c.j          17f
8:                jal          ra, 10f
9:                c.j          8b
10:               jal          ra, 12f
11:               c.jal        23f
12:               jal          ra, 7b
13:               c.jal        15f
14:               c.jal        9b
15:               c.j          14b
16:               jal          s4, 2b
17:               c.jal        0b
18:               c.j          19f
19:               c.jal        1b
20:               jal          ra, 16b
21:               c.j          22f
22:               c.jal        18b
23:               jal          ra, 6b
24:               sra          a6, t4, t4
                  add          s1, a6, a1
                  auipc        s11, 916364
                  c.addi16sp   sp, 368
                  srai         gp, t2, 14
                  addi         t5, t1, -1615
                  add          s8, a7, s9
                  sll          t1, s6, sp
                  c.addi       a7, -1
                  c.beqz       a3, 3546f
                  c.nop
                  c.srai       a1, 6
                  slli         t1, tp, 1
                  xor          a1, a0, s1
                  blt          s9, s9, 3540f
                  lui          s10, 82665
                  c.srli       a5, 22
                  c.addi       s8, -1
3536:             srai         t3, s1, 19
                  srli         gp, ra, 31
                  xori         gp, gp, -1635
                  c.addi       a5, -1
3540:             c.and        a2, s1
                  and          s6, t1, gp
                  remu         a7, a4, s10
                  mulhu        t6, gp, a6
                  andi         a6, s5, -406
                  beq          s2, gp, 3546f
3546:             sltiu        t2, s1, 1348
                  auipc        a5, 650636
                  sltu         gp, s7, t6
                  srli         s7, t5, 17
                  c.xor        a2, a0
                  c.srli       s1, 19
                  beq          s3, t2, 3568f
                  andi         s9, a7, -387
                  c.add        a4, a3
                  andi         a2, a6, -182
                  remu         t5, s3, s7
                  c.xor        a3, s0
                  mulh         t6, s9, t0
                  c.and        s1, s1
                  c.addi       t4, -1
                  rem          gp, ra, a7
                  add          a1, tp, a4
                  or           s7, t3, s7
                  c.xor        a2, a3
                  ori          sp, s6, -940
                  srl          sp, s4, s7
                  c.xor        a4, a4
3568:             c.slli       t1, 2
                  c.mv         s3, t2
                  beq          tp, gp, 3573f
                  c.li         a2, 31
                  slt          a3, t1, s0
3573:             c.lui        s6, 18
                  c.xor        s0, a1
                  auipc        s3, 81649
                  c.or         s0, a4
                  div          a4, a5, a1
                  c.nop
                  addi         tp, a5, -946
                  blt          s10, a3, 3588f
                  c.xor        a3, a2
                  c.addi       s8, 25
                  srl          a5, t2, t5
                  srl          s0, sp, s1
                  blt          t0, s5, 3599f
                  bne          ra, t6, 3604f
                  mulhu        s0, a6, s4
3588:             nop
                  sra          t6, s7, gp
                  srli         s10, s0, 3
                  c.mv         t4, s1
                  slli         s4, a0, 27
                  and          s11, tp, tp
                  c.sub        a5, a1
                  slti         a2, ra, 252
                  srli         s8, zero, 18
                  lui          a4, 597547
                  c.addi4spn   s1, sp, 480
3599:             lui          t5, 507315
                  auipc        s1, 350502
                  sll          t1, tp, t5
                  bgeu         a1, s3, 3621f
                  bge          s9, gp, 3616f
3604:             sltu         t3, a4, s9
                  c.nop
                  ori          a5, tp, 1363
                  srli         s10, s9, 25
                  slt          a7, t1, s10
                  mulhsu       a3, a0, a3
                  srli         a5, a3, 7
                  c.addi       s7, -1
                  bgeu         zero, gp, 3625f
                  slt          s4, s2, s8
                  slli         ra, a3, 11
                  c.srli       a4, 29
3616:             c.li         s7, -1
                  c.bnez       a2, 3631f
                  and          s11, t1, a4
                  mulh         t3, a3, s6
                  la           a5, region_1+45 #start riscv_load_store_hazard_instr_stream_18
                  lb           t6, -1(a5)
                  lw           s4, -1(a5)
                  lhu          sp, -1(a5)
                  c.and        a4, s1
                  lh           t3, -1(a5)
                  lb           t3, -1(a5)
                  mul          t2, zero, a2
                  c.srli       a1, 7
                  lbu          zero, -1(a5)
                  lhu          s3, -1(a5)
                  c.mv         t1, t2
                  lhu          a3, -1(a5)
                  c.srai       a3, 2
                  slli         s7, s11, 28
                  lb           s4, -1(a5)
                  lw           tp, -1(a5)
                  sh           ra, -1(a5)
                  lw           s6, -1(a5) #end riscv_load_store_hazard_instr_stream_18
                  and          a7, ra, s6
3621:             add          a3, t3, s4
                  c.sub        s0, a4
                  sra          s10, s5, t3
                  c.lui        s0, 31
3625:             bgeu         s8, s5, 3643f
                  auipc        s3, 189415
                  and          t0, s8, t2
                  mulhsu       t1, t2, s7
                  c.xor        a2, s1
                  andi         s11, s5, 731
3631:             srl          s6, t2, s8
                  mulhsu       s9, s8, t2
                  slli         t0, a6, 10
                  rem          t0, s8, t4
                  bge          s1, a3, 3648f
                  mulhsu       s10, a1, t5
                  sub          t2, s11, s8
                  c.addi4spn   a1, sp, 992
                  c.srli       a5, 5
                  div          t3, a1, a0
                  mulh         t3, s11, ra
                  bne          a5, sp, 3655f
3643:             c.mv         a7, a6
                  sra          s6, a7, a6
                  rem          s8, a7, s0
                  c.srli       a5, 12
                  c.li         a6, -1
3648:             c.and        s1, a2
                  bge          gp, t1, 3668f
                  c.lui        s3, 25
                  ori          gp, gp, 258
                  mul          a6, s8, a1
                  addi         a7, s5, -655
                  mulhu        a2, s11, a1
3655:             c.addi4spn   a2, sp, 640
                  auipc        a1, 290835
                  andi         a3, s9, -1377
                  mul          t2, s7, sp
                  bgeu         t1, s1, 3670f
                  mulhu        s10, a4, s11
                  bltu         a6, t0, 3665f
                  c.addi16sp   sp, -16
                  sra          a4, a6, s6
                  srai         a5, s7, 22
3665:             c.andi       a3, -1
                  c.or         a5, s0
                  ori          s6, a4, 1383
3668:             slt          t0, t4, a1
                  c.xor        a5, s0
3670:             sra          t6, s4, s11
                  ori          sp, s4, 1687
                  sltiu        s9, a3, -1701
                  slt          s9, s7, s6
                  mulhsu       a6, gp, s8
                  c.and        s1, a3
                  slli         s8, gp, 21
                  sub          s0, a4, a2
                  add          s10, s10, s2
                  c.srai       s0, 27
                  auipc        a3, 340320
                  c.srai       s1, 22
                  srai         s3, s9, 11
                  c.or         a2, a5
                  bge          a6, s9, 3687f
                  sra          t0, s5, tp
                  sub          t0, s11, a3
3687:             c.lui        a4, 31
                  beq          a3, s6, 3708f
                  c.slli       ra, 23
                  c.srli       a4, 24
                  bgeu         a5, sp, 3693f
                  c.sub        a3, a2
3693:             rem          s3, gp, s1
                  srli         s0, s3, 7
                  c.andi       a1, 18
                  bgeu         a1, t4, 3713f
                  auipc        t2, 164092
                  mulh         a7, t6, a6
                  remu         s3, a7, a1
                  blt          s6, t0, 3711f
                  srl          s3, a6, sp
                  c.lui        s0, 16
                  c.beqz       a5, 3719f
                  bge          a5, sp, 3705f
3705:             div          s4, t4, sp
                  c.or         s0, s1
                  xor          s10, t2, a3
3708:             c.mv         gp, s5
                  lui          s10, 543529
                  c.addi16sp   sp, -16
3711:             andi         a7, s11, 2001
                  ori          ra, s4, 769
3713:             add          s3, t5, a1
                  slti         a2, s10, 766
                  addi         s7, t2, 671
                  blt          t3, s7, 3731f
                  c.andi       a2, 29
                  div          t6, s11, a4
3719:             bgeu         s10, a3, 3720f
3720:             srli         s9, s1, 17
                  bgeu         t3, s3, 3733f
                  ori          t6, sp, 1369
                  srl          t6, a1, s4
                  slt          t6, sp, zero
                  srl          s10, t0, s4
                  mulhu        gp, s10, a5
                  sltiu        s4, a1, 1280
                  c.bnez       a4, 3747f
                  bne          t6, a0, 3736f
                  c.srli       a4, 7
3731:             mulh         a7, a5, t2
                  c.nop
3733:             c.xor        a3, a2
                  c.add        tp, s9
                  div          sp, a0, s10
3736:             slli         a5, tp, 13
                  bltu         a3, s1, 3743f
                  c.bnez       s0, 3756f
                  nop
                  beq          a2, a3, 3757f
                  c.add        t0, a1
                  xor          a1, s4, s11
3743:             nop
                  lui          s10, 707374
                  xor          ra, a4, s8
                  bltu         t6, s8, 3763f
3747:             slti         s10, t0, -1318
                  divu         a7, sp, t3
                  rem          t4, sp, s1
                  and          gp, s5, s11
                  bltu         a1, a5, 3767f
                  sltiu        a6, a2, -2042
                  bltu         a6, ra, 3764f
                  auipc        s1, 80213
                  srl          s9, sp, zero
3756:             sll          a1, s0, a7
3757:             slt          t4, s7, a3
                  srli         sp, t1, 7
                  divu         s10, a0, a1
                  c.and        s1, a4
                  slti         t4, s4, -2002
                  mulh         t0, s11, sp
3763:             slt          t4, t1, s1
3764:             div          s10, t4, s0
                  rem          s3, s10, t3
                  slt          a6, t1, t5
3767:             c.or         a2, a0
                  c.xor        a1, a3
                  c.slli       s11, 31
                  srl          t2, a1, zero
                  c.xor        a1, a5
                  c.mv         s6, gp
                  mulh         t0, zero, s0
                  bgeu         t2, s11, 3781f
                  lui          gp, 498023
                  c.add        sp, a6
                  c.mv         s7, a5
                  c.srli       a5, 25
                  c.beqz       s1, 3793f
                  c.xor        a3, a2
3781:             rem          s9, a4, a6
                  mulh         t3, t5, s4
                  c.slli       t6, 9
                  srl          a1, a6, t2
                  mul          ra, s4, a7
                  c.nop
                  slti         t3, a5, -1878
                  add          s6, t5, t5
                  srli         gp, a4, 25
                  bgeu         s6, t1, 3809f
                  remu         a2, a7, s11
                  sub          a4, s5, t0
3793:             bgeu         gp, sp, 3810f
                  c.mv         a2, s6
                  bge          t1, t1, 3808f
                  slti         a2, a0, -205
                  c.nop
                  rem          s6, s3, t0
                  c.srli       a1, 15
                  mulhu        s11, t3, ra
                  addi         s6, t0, 373
                  mul          s8, t2, s10
                  sub          t2, gp, a0
                  bltu         t4, a1, 3823f
                  mulh         a2, a4, t2
                  c.andi       s1, 5
                  srl          s1, a0, tp
3808:             c.addi16sp   sp, -16
3809:             slt          tp, s2, s0
3810:             lui          a4, 852498
                  c.and        a2, s0
                  c.mv         t5, s5
                  or           s1, ra, a6
                  sub          s11, a5, sp
                  mulh         a5, a7, t4
                  blt          zero, s7, 3834f
                  beq          s2, s4, 3835f
                  ori          a7, t6, -259
                  sub          a5, s1, s0
                  rem          s9, a7, t4
                  mulhsu       t4, s0, a3
                  slli         s11, a2, 12
3823:             mulhu        a4, sp, s6
                  rem          a1, t6, s3
                  div          s8, s2, gp
                  mulhu        t6, a2, t1
                  c.or         a4, a3
                  div          s8, a5, sp
                  c.xor        a4, a2
                  sltiu        a7, s3, -2041
                  c.mv         t3, gp
                  auipc        tp, 204598
                  rem          zero, s6, s9
3834:             c.srai       s0, 20
3835:             c.addi4spn   a3, sp, 992
                  ori          a1, a3, -987
                  c.addi16sp   sp, 192
                  slli         a3, s10, 22
                  xori         s3, t1, -1088
                  mul          s4, s10, t5
                  sltu         ra, s3, a1
                  c.xor        a4, s1
                  srli         zero, s0, 27
                  nop
                  sltiu        a3, a7, 905
                  c.lui        t4, 8
                  srai         t0, a1, 10
                  c.lui        s7, 8
                  rem          a5, t4, ra
                  sltiu        s11, gp, 52
                  bltu         t1, a7, 3853f
                  c.or         a2, a5
3853:             mulhu        s9, gp, t2
                  c.lui        a1, 29
                  sll          a2, s11, sp
                  c.bnez       a3, 3874f
                  addi         t4, s9, 2041
                  bge          a6, t6, 3859f
3859:             mulhu        a4, a7, s0
                  lui          tp, 593594
                  slli         s1, a6, 26
                  srl          s11, s11, a4
                  mulhu        t2, t2, zero
                  ori          tp, s10, -365
                  c.nop
                  c.mv         t4, tp
                  c.addi16sp   sp, 304
                  c.lui        a2, 5
                  bne          s5, t4, 3870f
3870:             c.nop
                  c.addi       t5, -1
                  mul          a2, sp, ra
                  srai         t6, s0, 28
3874:             xor          a6, ra, t1
                  slti         s3, s2, 1202
                  bgeu         a1, s9, 3895f
                  mul          t3, a3, t4
                  c.bnez       s1, 3892f
                  bge          a5, t0, 3892f
                  srl          t6, t2, t5
                  remu         s0, a6, a2
                  mulhu        s10, a0, gp
                  c.li         s10, -1
                  bne          a2, t6, 3895f
                  xor          t3, s0, a3
                  srai         s6, s0, 13
                  sra          t2, t3, s10
                  addi         a6, s6, 963
                  c.add        t1, a0
                  sub          s11, s7, t2
                  c.andi       a1, -1
3892:             beq          gp, s0, 3905f
                  sll          t0, a4, a1
                  sub          ra, s6, a5
3895:             c.slli       tp, 15
                  bge          a3, t6, 3908f
                  bgeu         a7, s1, 3917f
                  beq          s10, s8, 3902f
                  xori         t6, sp, 1424
                  sll          a1, a4, s6
                  c.sub        a5, s1
3902:             c.beqz       s1, 3910f
                  c.sub        s1, a2
                  xori         s7, s7, -835
3905:             c.lui        s7, 14
                  c.srai       s1, 22
                  div          tp, t6, s10
3908:             c.srai       s0, 23
                  srli         s11, a7, 28
3910:             c.nop
                  andi         a6, t0, -1717
                  bne          s11, t5, 3928f
                  sll          ra, t3, t3
                  remu         s4, gp, tp
                  nop
                  slli         t4, s3, 20
3917:             and          a2, t4, s8
                  bge          s7, a6, 3924f
                  add          ra, s3, a4
                  c.or         a4, a5
                  blt          s8, s7, 3936f
                  add          t3, s11, t0
                  sltiu        s10, t6, -1209
3924:             beq          a6, s2, 3937f
                  sll          s0, tp, a5
                  ori          t5, s5, -2039
                  c.xor        a4, s0
3928:             divu         t1, t0, t6
                  auipc        s6, 1040245
                  bltu         t0, a0, 3933f
                  rem          t1, s5, s5
                  c.add        s6, t5
3933:             sltiu        a5, t3, -65
                  slti         zero, s2, -951
                  c.andi       a2, -1
3936:             slt          s6, s0, s1
3937:             blt          s11, a5, 3940f
                  c.addi       a2, -1
                  bne          t3, t3, 3952f
3940:             xori         a4, t5, 180
                  sltiu        a4, s5, -897
                  c.addi4spn   a2, sp, 576
                  sltu         s0, s10, s5
                  auipc        a4, 838598
                  mulhsu       s9, s4, s7
                  bge          s4, s11, 3964f
                  div          a4, a1, s1
                  c.addi4spn   s1, sp, 240
                  c.or         a2, a5
                  c.xor        a5, s1
                  auipc        t0, 668171
3952:             c.and        a2, a1
                  auipc        a3, 864750
                  c.beqz       s1, 3957f
                  nop
                  rem          a7, t1, s7
3957:             c.andi       a5, 25
                  xori         t3, t5, 677
                  c.lui        a1, 13
                  mulhu        a2, a2, s11
                  addi         zero, gp, 829
                  c.srli       a5, 22
                  c.lui        s8, 15
3964:             c.xor        a4, a5
                  beq          a5, a0, 3966f
3966:             c.srai       s1, 10
                  lui          s9, 618999
                  srli         a1, a1, 4
                  c.sub        a4, s1
                  bne          a5, t6, 3984f
                  mulhsu       s7, sp, t5
                  c.andi       a4, -1
                  andi         a2, a4, 666
                  or           t3, t0, s2
                  c.sub        s1, a1
                  c.slli       a1, 27
                  c.beqz       a3, 3994f
                  c.li         a7, -1
                  bltu         s0, t1, 3990f
                  srli         a1, s0, 21
                  c.xor        a2, a3
                  addi         tp, a5, -459
                  srl          a3, t6, t6
3984:             sub          a6, a1, a2
                  mulh         s4, s9, tp
                  c.xor        a4, a0
                  c.andi       a1, -1
                  or           a2, a2, s4
                  c.srli       a1, 30
3990:             srl          tp, s1, t6
                  c.li         s3, -1
                  c.slli       s6, 8
                  c.add        t4, s2
3994:             c.addi4spn   s1, sp, 640
                  mulhu        zero, t6, s6
                  c.and        s1, a4
                  div          t4, s8, s5
                  srl          s7, a4, t0
                  blt          s6, t5, 4018f
                  c.mv         s8, s9
                  c.slli       tp, 9
                  c.sub        a5, a0
                  and          a6, s1, a1
                  srai         a4, t4, 22
                  div          ra, s0, a0
                  c.addi4spn   a5, sp, 96
                  xor          s6, tp, t6
                  remu         s8, a6, t1
                  lui          tp, 644168
                  c.li         s4, 22
                  mulh         s1, a4, s0
                  srli         t0, a0, 12
                  sltiu        t3, ra, -817
                  lui          t6, 832150
                  rem          zero, a3, a4
                  c.bnez       a2, 4036f
                  and          a6, t0, a3
4018:             sltiu        a3, s10, 1892
                  blt          s10, t4, 4037f
                  xori         zero, s7, 1631
                  c.sub        a5, a4
                  c.addi       s9, 22
                  bltu         zero, zero, 4027f
                  c.sub        a2, a4
                  andi         t2, tp, -1729
                  c.bnez       a5, 4044f
4027:             and          s1, s4, a1
                  bne          a2, t5, 4043f
                  c.mv         s4, t2
                  c.addi4spn   s0, sp, 848
                  nop
                  auipc        a4, 1037047
                  c.li         s7, -1
                  c.sub        a3, a3
                  slt          t6, a4, t2
4036:             c.addi16sp   sp, 304
4037:             slti         a5, t0, -361
                  xor          t0, s11, t4
                  slli         a2, t3, 0
                  bne          t5, a3, 4042f
                  c.lui        ra, 1
4042:             nop
4043:             sltiu        t2, t3, 1849
4044:             c.nop
                  auipc        a4, 418438
                  blt          a7, zero, 4047f
4047:             c.li         s1, 16
                  c.srli       a2, 13
                  and          s10, t4, s5
                  c.sub        s0, a1
                  ori          s7, t0, 1367
                  c.beqz       a3, 4068f
                  bltu         gp, a6, sub_4_j7 #branch to jump instr
                  mulhsu       a5, s1, t5
                  c.andi       a5, 27
                  c.addi4spn   a4, sp, 528
                  c.xor        a4, a1
                  or           s11, t4, zero
                  c.slli       t4, 22
                  or           s4, s7, gp
                  c.srli       s1, 14
sub_4_j7:         jal          t3, sub_5 #jump sub_4 -> sub_5
                  andi         t1, s1, -929
                  bgeu         s9, s5, 4060f
                  divu         t5, a3, s11
                  c.lui        t3, 31
                  add          a6, a4, s7
                  beq          a2, s1, 4061f
                  sltiu        t4, sp, -681
4060:             c.lui        s1, 9
4061:             bltu         t5, a2, 4080f
                  add          s0, s0, s0
                  beq          gp, a2, 4075f
                  bne          a2, a7, 4072f
                  c.nop
                  c.or         a3, a3
                  c.mv         a7, s2
4068:             c.srli       a1, 5
                  c.sub        a2, a5
                  sltu         t3, t2, a7
                  mulh         t1, s5, s3
4072:             srl          ra, s4, t0
                  c.mv         t6, a1
                  beq          s9, s7, 4091f
4075:             xori         t5, a6, -1662
                  c.srai       a2, 18
                  c.srli       a3, 26
                  c.lui        t4, 20
                  bge          s4, s10, 4090f
4080:             bltu         a4, t3, 4093f
                  c.and        a3, a5
                  divu         s4, t6, a0
                  c.nop
                  slt          a6, s3, s3
                  sltiu        t6, s10, 1957
                  mulh         t2, s4, t6
                  sll          t0, s10, s0
                  bge          a4, t5, 4101f
                  div          ra, t5, s11
4090:             srl          s10, a4, ra
4091:             sra          t2, s2, s8
                  sll          a5, a7, gp
4093:             and          s6, ra, s1
                  sltiu        sp, t6, -1645
                  addi         s8, a5, 984
                  c.andi       s0, 13
                  c.xor        a3, a5
                  sll          s1, a2, a0
                  c.addi4spn   s0, sp, 80
                  divu         t4, s2, t0
4101:             c.xor        a1, s1
                  c.bnez       a4, 4109f
                  slt          s10, t5, tp
                  c.and        a4, s1
                  c.xor        a5, a0
                  mulhsu       t5, a0, t0
                  c.slli       a5, 23
                  bge          t4, t1, 4124f
4109:             slt          a2, t5, a0
                  c.mv         t4, s11
                  c.nop
                  slt          t0, tp, s8
                  mul          t6, a6, a5
                  bne          a3, s8, 4128f
                  bltu         a4, t3, 4128f
                  divu         s10, a6, t3
                  bltu         a0, zero, 4136f
                  c.addi16sp   sp, -16
                  lui          a3, 589725
                  c.li         sp, -1
                  ori          s4, t3, 737
                  c.srli       a4, 29
                  c.beqz       a4, 4139f
4124:             or           s4, s11, t6
                  c.beqz       s1, 4137f
                  c.or         a1, a3
                  bne          sp, a2, 4128f
4128:             xor          s0, t5, t1
                  mulhu        t6, t5, a7
                  mulhu        s6, a5, ra
                  c.li         tp, -1
                  c.mv         a6, s4
                  add          s4, a3, t6
                  addi         s6, s4, -309
                  c.srli       s0, 11
4136:             div          ra, s1, tp
4137:             c.slli       a4, 25
                  mul          t0, s3, s5
4139:             c.or         s1, a1
                  beq          s9, t5, 4153f
                  beq          sp, sp, 4145f
                  mul          t1, t1, a3
                  ori          s4, s9, -460
                  auipc        s1, 938085
4145:             rem          t4, t3, a7
                  c.slli       sp, 7
                  bne          a2, a2, 4164f
                  c.slli       t3, 24
                  bltu         t2, t1, 4163f
                  c.srai       s1, 27
                  beq          a7, s4, 4165f
                  xor          s7, a6, s7
4153:             ori          gp, s1, -1389
                  sltiu        s7, s5, 331
                  bltu         s6, zero, 4174f
                  c.srli       s1, 28
                  bne          a1, s2, 4173f
                  andi         s6, s1, -297
                  c.sub        s1, a2
                  c.lui        a5, 5
                  sll          a4, t0, s11
                  bltu         a4, t0, 4180f
4163:             c.nop
4164:             or           tp, t4, t5
4165:             lui          a2, 730344
                  bne          t4, a7, 4185f
                  sltiu        t4, a2, 374
                  divu         s9, a0, s1
                  c.beqz       s1, 4171f
                  c.nop
4171:             srai         s6, a0, 28
                  c.slli       tp, 22
4173:             div          zero, gp, t4
4174:             c.xor        a3, s1
                  c.sub        s1, a1
                  c.xor        a4, s1
                  c.slli       a7, 10
                  mulh         t5, t4, a4
                  c.srli       s1, 1
4180:             sltu         zero, t1, s6
                  divu         s0, s2, s0
                  nop
                  add          s10, t1, s4
                  c.add        t6, t0
4185:             c.andi       a3, -1
                  c.xor        a4, a1
                  srli         a6, s0, 7
                  slt          ra, zero, s2
                  and          a4, s6, t4
                  divu         sp, a6, a4
                  srai         t2, a1, 3
                  c.srli       a5, 29
                  c.li         a5, -1
                  sub          s9, s8, t0
                  c.add        t4, t4
                  c.add        s9, sp
                  c.mv         t2, a0
                  rem          s7, ra, s8
                  and          tp, tp, s8
                  c.addi       s1, 5
                  bne          s2, s4, 4219f
                  xor          ra, gp, ra
                  sll          a4, a0, t4
                  andi         t4, s2, 181
                  mul          t3, a1, s9
                  bne          gp, a5, 4223f
                  c.andi       a5, 29
                  or           a6, s1, t4
                  srl          a7, t0, a0
                  and          a3, tp, s8
                  sll          t3, a5, t1
                  c.and        a2, a4
                  sra          a4, s9, ra
                  nop
                  nop
                  andi         s8, a2, -1803
                  c.bnez       a2, 4232f
                  c.lui        t3, 2
4219:             slli         s1, s2, 16
                  or           ra, t2, t6
                  c.srai       s0, 14
                  ori          s0, a5, -20
4223:             remu         s7, a7, t0
                  blt          a3, ra, 4244f
                  sltiu        t4, s0, -54
                  c.sub        a3, a5
                  auipc        ra, 509753
                  srai         a1, s0, 14
                  remu         t2, a6, s10
                  sub          sp, s3, s2
                  c.nop
4232:             bge          t5, a3, 4239f
                  c.mv         a2, s4
                  c.addi       a5, 5
                  remu         a5, a1, s4
                  slli         a1, t2, 20
                  c.add        a3, s4
                  mulhu        t4, t3, s5
4239:             c.andi       a1, -1
                  c.bnez       a5, 4259f
                  xori         s0, s0, -1605
                  mulhu        a3, s2, a2
                  auipc        t6, 878304
4244:             mulhsu       a3, a1, s7
                  rem          s3, s8, a6
                  andi         s3, s6, -1216
                  c.xor        a4, s0
                  mul          tp, t0, t5
                  mulhsu       t1, s7, a2
                  ori          zero, t2, 2029
                  slli         a3, t6, 5
                  bge          a7, a1, 4270f
                  xor          s3, tp, s11
                  c.add        s8, a2
                  or           a7, a4, zero
                  c.bnez       s0, 4267f
                  srli         s10, s3, 10
                  sub          s10, sp, a6
4259:             c.srai       s1, 1
                  bltu         t3, a5, 4261f
4261:             sll          s6, s4, a1
                  sra          s1, a1, tp
                  addi         a5, tp, -12
                  addi         sp, tp, 1182
                  xori         s6, tp, 1247
                  c.li         a4, 24
4267:             c.addi       t5, -1
                  sll          t1, s9, a5
                  c.slli       t0, 16
4270:             bltu         tp, s11, 4283f
                  div          a6, s4, a2
                  c.nop
                  c.mv         a7, s5
                  slli         s3, tp, 13
                  xor          zero, t2, a7
                  c.srai       a4, 31
                  c.nop
                  lui          t6, 816843
                  auipc        a6, 390173
                  c.addi16sp   sp, 496
                  c.xor        s0, a5
                  c.or         a1, a0
4283:             or           s4, s6, s1
                  auipc        s6, 606881
                  slli         s6, s8, 0
                  xor          s6, a0, a3
                  c.addi       a6, -1
                  mulhsu       s0, zero, s4
                  mulh         a5, s4, s10
                  mulhu        s9, a7, s6
                  slli         tp, zero, 23
                  rem          s3, gp, a4
                  mulhu        s4, ra, t3
                  lui          a2, 165850
                  lui          gp, 880896
                  beq          a5, zero, 4309f
                  srl          s7, t2, ra
                  slti         t3, a0, 1474
                  bge          t3, a3, 4312f
                  slt          s7, t5, t2
                  c.beqz       a4, 4304f
                  addi         s4, s5, -35
                  sltiu        s4, a2, -1692
4304:             mul          sp, a7, s11
                  bltu         t2, zero, 4313f
                  or           s3, s4, t5
                  bne          s5, t2, 4318f
                  c.nop
                  la           s1, amo_0+40 #start riscv_lr_sc_instr_stream_4
                  lr.w          a3, (s1)
                  c.li         s7, -1
                  lui          a3, 781843
                  xor          s3, gp, s10
                  add          a2, s8, s2
                  slli         s11, s4, 17
                  mulh         tp, s1, ra
                  c.sub        s0, a2
                  srl          t1, a3, gp
                  c.addi       s8, 18
                  slli         t2, a1, 7
                  andi         s8, s2, 1791
                  nop
                  or           s11, s4, s3
                  ori          a6, gp, -1813
                  rem          t0, a2, a1
                  sc.w          s0, a3, (s1) #end riscv_lr_sc_instr_stream_4
4309:             c.addi       s10, -1
                  c.li         t6, -1
                  c.or         a2, a4
4312:             c.nop
4313:             add          a5, t1, zero
                  bltu         a6, t4, 4320f
                  c.xor        a3, a3
                  slli         s11, a3, 25
                  mulh         a4, sp, zero
4318:             ori          t0, s1, -1465
                  ori          t5, t4, 1166
4320:             nop
                  c.add        s0, t5
                  c.li         a6, -1
                  bge          s4, s7, 4326f
                  xori         s6, a6, -93
                  add          s4, s11, ra
4326:             c.andi       a2, 15
                  addi         s9, s11, 1322
                  c.andi       a5, 22
                  c.add        t2, s3
                  c.and        a4, a1
                  c.addi16sp   sp, 304
                  c.or         a4, a3
                  blt          s3, a5, 4346f
                  c.addi4spn   s0, sp, 960
                  slt          a6, ra, s9
                  sub          s7, t2, a0
                  xori         t1, t2, 601
                  xori         a6, tp, -1616
                  srli         a2, tp, 25
                  remu         s8, a6, s6
                  c.andi       a3, 5
                  auipc        t3, 641804
                  slli         gp, t4, 13
                  bge          a5, t2, 4361f
                  c.andi       a2, -1
4346:             sltu         s0, a7, s3
                  and          t2, a1, gp
                  nop
                  c.or         a3, s0
                  c.mv         t5, t6
                  srli         s6, t6, 7
                  bltu         a1, a7, 4355f
                  c.lui        s3, 1
                  c.bnez       a4, 4370f
4355:             add          sp, t2, s3
                  bltu         a2, t5, 4364f
                  c.sub        s1, a2
                  srl          a4, t3, s1
                  mulh         sp, s2, a4
                  ori          s7, zero, -944
4361:             mulhsu       a7, a3, a3
                  bgeu         a3, zero, 4378f
                  ori          sp, a1, -1368
4364:             sra          s10, s0, sp
                  c.sub        a4, a2
                  ori          sp, a7, 262
                  c.sub        a3, a5
                  or           s4, a5, s1
                  c.srli       s0, 20
4370:             c.addi4spn   a1, sp, 384
                  srl          a6, t2, s6
                  blt          a4, s6, 4391f
                  c.li         t4, 6
                  addi         s1, a4, -651
                  remu         gp, s2, a5
                  c.and        s1, a1
                  rem          s10, s5, sp
4378:             c.andi       a2, -1
                  add          a2, a4, a5
                  lui          a4, 379805
                  slt          sp, gp, a4
                  ori          t6, a0, -1256
                  c.addi4spn   a1, sp, 208
                  sltu         a7, s5, s7
                  c.li         s1, 14
                  c.srai       a1, 25
                  nop
                  srli         a7, a3, 23
                  c.nop
                  lui          s11, 224248
4391:             add          s1, s3, a6
                  andi         a7, s0, -865
                  c.xor        a1, a2
                  bge          s11, s2, 4398f
                  c.srai       s1, 3
                  c.andi       a1, -1
                  rem          zero, a5, a5
4398:             rem          a2, s10, t6
                  c.and        s1, a2
                  nop
                  c.srli       a1, 7
                  srli         t6, s11, 19
                  auipc        a3, 214969
                  c.addi4spn   s1, sp, 496
                  div          tp, t1, a5
                  bge          s6, s2, 4421f
                  c.beqz       s1, 4424f
                  div          s8, t6, s0
                  auipc        a1, 875539
                  c.andi       a3, -1
                  bgeu         s0, a4, 4418f
                  c.srai       a1, 31
                  andi         t0, s3, 629
                  c.addi       a1, 15
                  c.srli       s0, 4
                  slti         a4, t4, -412
                  c.sub        a3, a1
4418:             andi         t0, s5, -1026
                  nop
                  c.srai       a3, 21
4421:             c.addi       a7, 19
                  c.add        t6, sp
                  auipc        s0, 91852
4424:             sll          t3, s4, s1
                  blt          s10, s6, 4426f
4426:             mulh         a2, a6, t3
                  xor          s3, sp, ra
                  mulh         a6, a5, s7
                  sra          s7, a7, s2
                  c.nop
                  sra          a7, s5, a3
                  xor          s1, s1, s0
                  c.addi4spn   a1, sp, 272
                  divu         t5, s7, t0
                  c.srai       a2, 1
                  c.andi       a2, 11
                  sltiu        tp, s0, 2035
                  xor          a1, gp, s7
                  or           t0, s6, t2
                  bltu         t3, t0, 4443f
                  c.or         a2, a2
                  mulhsu       a2, t3, s6
4443:             c.mv         s7, a2
                  c.lui        a2, 21
                  addi         s6, gp, 1629
                  c.srli       s0, 9
                  mul          s1, a2, s11
                  sltiu        t2, ra, -315
                  c.lui        t0, 17
                  blt          a4, sp, 4464f
                  remu         s8, a7, t5
                  c.lui        ra, 27
                  c.xor        a1, a2
                  c.bnez       s1, 4474f
                  addi         a7, t5, 1510
                  remu         s8, a5, a7
                  c.addi16sp   sp, -16
                  mulhu        t0, a3, s0
                  divu         s6, a3, s4
                  c.sub        a4, a4
                  nop
                  xori         a4, a0, -1824
                  remu         s1, a1, t5
4464:             andi         t1, t0, 86
                  add          a5, s3, zero
                  auipc        a3, 85186
                  bne          t2, s8, 4478f
                  mul          t3, s6, ra
                  sub          s10, s3, zero
                  sll          a6, s10, t4
                  mulhu        s0, t4, s9
                  sra          t3, a3, t2
                  bgeu         s6, a2, 4491f
4474:             mulhu        a2, ra, a5
                  srai         t1, a4, 15
                  slli         s3, zero, 7
                  blt          s11, s3, 4496f
4478:             c.bnez       s0, 4497f
                  slti         s1, sp, -1415
                  slli         t4, a2, 25
                  ori          a3, t6, -452
                  bgeu         a4, s8, 4495f
                  srl          a3, t2, s10
                  slt          gp, a0, s1
                  blt          t0, t0, 4503f
                  srl          s6, a0, a7
                  bge          s3, s0, 4489f
                  beq          s0, s11, 4501f
4489:             beq          s5, a3, 4500f
                  mulhsu       tp, s3, s2
4491:             slti         a3, a7, -506
                  mulhu        s9, s7, a2
                  srl          a3, t0, s5
                  sub          t4, a5, a2
4495:             slt          ra, s1, a0
4496:             c.srli       a3, 7
4497:             addi         s6, s8, -768
                  addi         t1, t4, -1429
                  auipc        s1, 105515
4500:             c.addi16sp   sp, 336
4501:             c.addi16sp   sp, -16
                  addi         s3, ra, 3
4503:             divu         a1, a0, a3
                  slti         gp, a6, -1791
                  c.slli       ra, 29
                  slt          a1, tp, a4
                  beq          s10, s8, 4519f
                  slt          t2, a0, t3
                  mul          a1, s9, s4
                  sub          s8, t0, t0
                  sltiu        s11, a4, 676
                  bge          t5, a3, 4530f
                  c.andi       a5, -1
                  divu         a4, s10, t6
                  c.beqz       a4, 4529f
                  slt          t0, a3, sp
                  slti         a4, t3, 1204
                  c.addi       t2, 27
4519:             remu         t0, ra, t2
                  bge          s5, t5, 4521f
4521:             bge          t2, tp, 4527f
                  mulhsu       s4, s7, t2
                  c.srli       a1, 18
                  sltu         t0, s0, t2
                  xor          a7, a3, a4
                  andi         a2, t2, 329
4527:             div          s4, a3, s6
                  c.srai       a5, 20
4529:             mulhu        s4, s3, a0
4530:             lui          s1, 400723
                  c.addi       s11, -1
                  c.beqz       a3, 4545f
                  andi         s3, s2, 1647
                  c.addi4spn   a4, sp, 800
                  andi         s11, s3, -1824
                  mulh         s4, s1, zero
                  slli         s1, zero, 29
                  c.or         a3, a5
                  blt          ra, a7, 4558f
                  c.bnez       s0, 4556f
                  or           t3, t3, s11
                  nop
                  c.addi4spn   s1, sp, 112
                  c.bnez       a5, 4546f
4545:             sra          t1, sp, s9
4546:             c.addi       ra, -1
                  bge          s4, s10, 4550f
                  mulh         s1, s1, s0
                  la           t3, region_1+322 #start load_store_instr_stream_0
                  la           s8, region_0+745 #start load_store_instr_stream_1
                  sb           t6, 33(t3)
                  lbu          s11, -62(s8)
                  sb           t3, 456(t3)
                  sb           a6, 20(s8)
                  lh           s6, -264(t3)
                  lb           t0, 58(s8)
                  lb           ra, -110(t3)
                  sb           s2, 52(s8)
                  lb           zero, 1268(t3)
                  lbu          ra, -52(s8) #end load_store_instr_stream_1
                  sb           s11, 484(t3)
                  sb           a7, -236(t3) #end load_store_instr_stream_0
                  blt          t6, gp, 4563f
4550:             c.srai       s0, 12
                  c.mv         gp, s5
                  blt          a7, s9, 4565f
                  mulhu        s3, a2, s9
                  c.xor        a2, a5
                  bne          a1, s6, 4573f
4556:             srli         sp, t4, 8
                  mulhsu       s9, s10, a7
4558:             c.bnez       s0, 4570f
                  mul          s0, t2, s4
                  c.add        s11, s5
                  or           a3, ra, s0
                  c.andi       a5, 12
4563:             bltu         a7, s6, 4574f
                  c.srai       a2, 20
4565:             c.bnez       a4, 4585f
                  c.sub        s0, a4
                  c.mv         t2, s3
                  mul          s9, s0, a2
                  c.nop
4570:             beq          s10, a6, 4586f
                  andi         a4, t6, 1485
                  sltu         a1, a2, s9
4573:             c.andi       a1, -1
4574:             mulhu        ra, a4, s8
                  c.srai       a5, 29
                  sltu         t2, t0, a7
                  c.lui        a1, 30
                  c.and        s1, a5
                  mulhsu       s9, a6, t5
                  slti         s1, gp, 195
                  bgeu         a6, a3, 4594f
                  sra          sp, s7, t2
                  or           s11, a5, a1
                  bne          sp, a1, 4597f
4585:             ori          t0, t2, 370
4586:             sltu         s11, tp, t2
                  mulhsu       s11, a3, s1
                  bge          sp, s8, 4601f
                  c.addi       t3, 1
                  divu         t1, tp, t6
                  c.srai       s0, 14
                  mul          s10, a1, a1
                  remu         t4, s6, t0
4594:             lui          t6, 411707
                  srai         a7, s5, 8
                  mul          s7, gp, a7
4597:             andi         sp, a2, -687
                  blt          s10, a3, 4599f
4599:             c.bnez       s0, 4618f
                  c.xor        s1, a5
4601:             c.sub        s0, a5
                  bge          t5, t0, 4620f
                  sra          zero, t2, ra
                  c.srai       a3, 20
                  c.addi16sp   sp, -16
                  bne          s11, a0, 4609f
                  andi         s1, s1, -875
                  c.slli       s3, 27
4609:             and          t3, t6, s11
                  c.slli       t6, 9
                  c.and        s1, a0
                  sltiu        a5, t0, -1057
                  divu         t1, s4, s0
                  c.mv         s7, s3
                  c.srli       a4, 11
                  sub          zero, a1, sp
                  addi         s10, t5, -223
4618:             beq          zero, a3, 4619f
4619:             xori         s1, t3, -2017
4620:             bltu         a0, s4, 4631f
                  bge          t0, s10, 4640f
                  remu         s1, t4, s6
                  nop
                  c.beqz       a1, 4628f
                  ori          s7, s8, -1328
                  c.addi       a7, 13
                  mulhu        s10, t4, s4
4628:             c.nop
                  div          s11, t5, t5
                  auipc        t0, 119670
4631:             c.addi4spn   s0, sp, 832
                  c.add        t2, a2
                  sltiu        s10, t1, -822
                  c.sub        a3, a1
                  slt          a5, s10, t3
                  add          a6, gp, s2
                  auipc        s6, 303185
                  bltu         a4, a7, 4652f
                  sll          s1, s6, s2
4640:             blt          gp, sp, 4648f
                  c.bnez       s0, 4658f
                  c.mv         a4, s6
                  mul          a2, s10, t2
                  andi         s7, ra, 1953
                  and          a4, t4, sp
                  c.sub        a1, a4
                  nop
4648:             slti         s9, t2, -50
                  slli         s1, t2, 2
                  sra          s7, s8, t2
                  rem          s10, s3, s6
4652:             c.nop
                  beq          a1, s7, 4660f
                  mulhu        zero, t6, s11
                  lui          a1, 965264
                  sltu         t0, a1, tp
                  mul          s11, a1, s5
4658:             blt          a3, ra, 4676f
                  lui          t5, 310493
4660:             sra          zero, s11, s3
                  mulhu        a6, t1, s5
                  c.lui        gp, 30
                  sub          ra, s8, t3
                  xori         s0, a6, -1987
                  srli         t6, tp, 10
                  slt          a3, s10, s9
                  auipc        s0, 513493
                  bgeu         a0, a3, 4674f
                  c.addi4spn   a5, sp, 960
                  bne          sp, a4, 4685f
                  blt          s2, t4, 4688f
                  bltu         a0, s3, 4684f
                  nop
4674:             addi         zero, t6, 732
                  c.addi16sp   sp, 320
4676:             slt          t2, tp, a7
                  sltiu        s8, a7, 326
                  srl          s11, t0, a2
                  c.bnez       a1, 4683f
                  c.addi16sp   sp, 16
                  and          t6, a4, s11
                  blt          s0, s9, 4684f
4683:             srai         zero, gp, 9
4684:             andi         a6, a7, -331
4685:             sll          a2, a0, sp
                  andi         zero, gp, 1814
                  c.addi4spn   a2, sp, 592
4688:             div          t2, ra, s9
                  xori         a3, s4, 319
                  lui          s1, 482095
                  mulh         sp, s2, tp
                  blt          a0, t3, 4708f
                  and          s9, a2, s8
                  slti         sp, s5, 340
                  c.srli       s0, 26
                  mul          t1, t4, t5
                  la           t3, region_1+784 #start riscv_load_store_hazard_instr_stream_9
                  sw           ra, 644(t3)
                  lh           s11, 644(t3)
                  c.addi16sp   sp, -16
                  lhu          a1, 952(t3)
                  lh           tp, 380(t3)
                  lb           t6, -335(t3)
                  lb           t0, -335(t3)
                  sltiu        a3, s3, -455
                  sb           a3, -261(t3)
                  srli         s7, s6, 4
                  sll          gp, zero, s4
                  lbu          s1, -261(t3)
                  lb           a2, -261(t3)
                  lbu          s9, -283(t3)
                  c.add        s8, t0
                  sb           a3, 637(t3)
                  lbu          a3, 582(t3)
                  sw           t2, -88(t3)
                  lb           t2, 238(t3)
                  lhu          s6, 238(t3)
                  c.addi16sp   sp, -16
                  lh           t2, 238(t3) #end riscv_load_store_hazard_instr_stream_9
                  sra          s4, t3, s5
                  bne          t1, s8, 4716f
                  sra          zero, s0, gp
                  c.li         s1, 13
                  blt          ra, s1, 4712f
                  divu         a4, a5, a7
                  ori          s3, t4, 741
                  c.beqz       a4, 4712f
                  bltu         s2, t1, 4712f
                  mul          t6, a4, t0
                  c.add        s7, t4
4708:             c.add        s8, s9
                  beq          s6, s2, 4722f
                  c.srai       s1, 29
                  mulhsu       sp, ra, s6
4712:             c.bnez       a5, 4725f
                  ori          s3, s3, 301
                  c.lui        t0, 3
                  auipc        a3, 835984
4716:             nop
                  rem          s0, a5, t5
                  div          t4, a6, a1
                  sub          t2, a2, a7
                  nop
                  sub          ra, t1, t0
4722:             sltiu        s11, s4, 625
                  mulhu        gp, zero, s9
                  slli         s6, s3, 15
4725:             srl          t5, tp, t6
                  slt          s0, tp, ra
                  c.addi       a2, 2
                  xori         t2, tp, -46
                  c.li         a4, 4
                  div          s3, t3, a7
                  sub          a4, t1, a0
                  and          s4, a0, gp
                  bltu         a6, ra, 4752f
                  or           sp, a3, s11
                  c.mv         s6, t3
                  ori          s6, a4, 1374
                  slt          s10, a3, t6
                  or           t5, s9, sp
                  sra          t1, s1, s9
                  c.or         a5, a3
                  slli         t0, a7, 21
                  lui          s3, 483650
                  srli         gp, s0, 17
                  sltu         s0, t2, s11
                  bgeu         a2, t4, 4764f
                  and          t1, t6, s0
                  sll          t3, tp, a0
                  c.andi       s1, 17
                  mulh         s9, a1, s5
                  c.addi16sp   sp, -16
                  srl          t2, s7, sp
4752:             c.lui        s1, 25
                  sll          s4, s2, sp
                  xor          t0, tp, t6
                  nop
                  mulhsu       t5, s11, s0
                  c.li         s4, -1
                  mulh         t2, t6, t5
                  addi         s11, t5, 1950
                  srai         s0, a3, 6
                  sra          s1, s4, s6
                  div          t3, t5, a7
                  mulh         zero, ra, s10
4764:             c.sub        a2, a0
                  mulhsu       t2, a3, gp
                  sltu         t5, a1, sp
                  bgeu         sp, s5, 4784f
                  xori         s7, t2, 1951
                  c.slli       a5, 30
                  sltiu        a1, s11, -1358
                  ori          t3, a4, 367
                  addi         a2, a0, 324
                  divu         t1, s9, s5
                  srai         t1, a3, 8
                  lui          t4, 476692
                  blt          s10, s11, 4791f
                  sra          s0, a4, a2
                  mulhsu       s7, a3, gp
                  rem          s8, s11, s3
                  c.beqz       s1, 4781f
4781:             sltiu        t2, s5, -694
                  bne          t5, tp, 4801f
                  mulhu        s9, s1, a1
4784:             lui          t2, 877786
                  c.lui        s9, 4
                  c.addi4spn   a3, sp, 672
                  slti         s4, a5, -742
                  mulhsu       a2, s8, a3
                  c.andi       a4, -1
                  c.and        a2, a0
4791:             remu         s3, a1, t2
                  nop
                  c.beqz       a2, 4794f
4794:             c.addi16sp   sp, 448
                  srai         s11, s3, 21
                  mulh         a2, s1, s7
                  c.nop
                  c.or         a1, a0
                  remu         sp, a2, s2
                  c.or         a3, a3
4801:             slli         s6, s2, 10
                  c.mv         s6, gp
                  xori         s0, a4, -1036
                  mul          s0, s11, a1
                  ori          s4, t6, 1909
                  c.addi16sp   sp, 368
                  c.addi16sp   sp, -16
                  bne          ra, s0, 4811f
                  c.bnez       s1, 4820f
                  bltu         s6, a1, 4816f
4811:             sltu         a3, s5, t5
                  c.lui        ra, 13
                  bltu         a5, a4, 4826f
                  mulh         t1, s11, a7
                  c.bnez       s0, 4833f
4816:             blt          s6, a0, 4819f
                  c.slli       tp, 3
                  slti         a2, a7, -1422
4819:             blt          t5, s7, 4837f
4820:             c.slli       gp, 19
                  xor          s9, s5, t5
                  xori         a5, a2, 1020
                  mul          a4, s0, ra
                  sll          s0, tp, s7
                  c.beqz       a5, 4838f
4826:             divu         t3, s4, zero
                  srli         tp, s8, 7
                  bgeu         t0, ra, 4842f
                  c.sub        s0, a3
                  divu         sp, zero, t1
                  mul          t5, s0, a3
                  bne          s9, a0, 4849f
4833:             nop
                  srli         s4, s8, 14
                  remu         a6, s10, ra
                  c.addi16sp   sp, -16
4837:             c.sub        s0, a5
4838:             sltiu        t5, s10, 1896
                  bltu         t5, t0, 4855f
                  addi         tp, s10, -203
                  xori         t0, a4, 1715
4842:             c.sub        a5, a5
                  or           a2, s0, a3
                  rem          t2, s5, tp
                  bne          s8, s10, 4859f
                  srl          tp, tp, t1
                  div          t2, s11, s11
                  auipc        zero, 1031552
4849:             andi         t0, s3, -648
                  c.andi       a1, 5
                  c.add        tp, a1
                  c.srli       a1, 8
                  c.addi4spn   a4, sp, 336
                  c.and        a2, a5
4855:             c.slli       s0, 12
                  andi         a6, s9, 439
                  c.srai       a5, 14
                  div          a3, a4, a6
4859:             c.li         t2, 23
                  c.or         s0, s0
                  add          s9, s11, t2
                  bne          t0, t2, 4882f
                  div          s7, a4, a4
                  c.li         sp, 7
                  xor          t5, s2, a3
                  c.add        s3, tp
                  beq          gp, a4, 4886f
                  bltu         a3, s7, 4886f
                  c.beqz       a1, 4882f
                  nop
                  mulhu        sp, gp, s8
                  sltiu        s1, a3, -1226
                  mul          s4, s1, t6
                  c.xor        s1, s0
                  c.and        a2, a0
                  bge          a6, t2, 4877f
4877:             and          t3, a6, s4
                  bge          t1, t1, 4892f
                  c.srli       a4, 27
                  c.add        s4, s3
                  addi         t3, s10, -633
4882:             andi         a7, t0, 1832
                  srai         sp, t5, 21
                  c.andi       a2, 18
                  bgeu         a6, a4, 4891f
4886:             slli         tp, ra, 21
                  xor          sp, a0, tp
                  mulhu        s9, a4, s7
                  addi         s0, a5, -1299
                  c.addi       ra, 22
4891:             addi         s10, s8, -1813
4892:             sltiu        s8, s11, 384
                  c.add        a6, a7
                  xori         tp, s0, -280
                  srli         a2, s0, 23
                  c.bnez       s1, 4913f
                  c.li         t1, -1
                  beq          t3, a6, 4909f
                  c.srli       a3, 4
                  beq          s5, s9, 4920f
                  c.xor        a4, a3
                  c.andi       a4, -1
                  c.add        s9, a6
                  c.addi       a3, -1
                  c.addi       s1, 31
                  andi         t4, s8, 1944
                  and          a1, s5, t4
                  c.srli       a1, 18
4909:             lui          s1, 777315
                  bne          s1, s10, 4927f
                  sltiu        s11, t1, -1157
                  sltu         zero, t5, a5
4913:             or           t4, tp, a4
                  srl          s7, t6, s3
                  c.li         a6, -1
                  mul          gp, a0, s1
                  slt          a7, s8, s3
                  c.li         t4, 14
                  mulh         tp, s9, s5
4920:             c.or         a4, a4
                  mul          a5, s1, t3
                  xor          tp, a6, zero
                  xori         t5, s11, 1306
                  mul          t1, a5, a0
                  c.li         t6, -1
                  or           s1, zero, t6
4927:             auipc        sp, 273220
                  c.nop
                  blt          ra, s9, 4944f
                  and          t1, ra, a0
                  add          tp, tp, s11
                  srl          a6, s0, a1
                  divu         a1, t1, s9
                  rem          s7, t3, a6
                  and          ra, s7, t4
                  bne          s3, t1, 4949f
                  sltu         s7, t4, t1
                  c.nop
                  bne          t3, a3, 4947f
                  nop
                  c.and        a3, a1
                  sub          t6, a3, tp
                  mulhu        a5, s2, s4
4944:             bne          t5, t0, 4945f
4945:             rem          zero, a6, a2
                  c.lui        a5, 31
4947:             remu         t4, s1, a4
                  slti         a4, a1, -74
4949:             mulh         ra, s0, s2
                  slti         a3, s9, 1444
                  xor          s3, s7, a4
                  mul          t2, t1, t0
                  sra          zero, s10, a3
                  mul          s10, s1, t5
                  la           tp, region_1+1658 #start load_store_instr_stream_1
                  lbu          s3, 4(tp)
                  la           sp, region_0+1262 #start load_store_instr_stream_0
                  lhu          a2, 10(sp)
                  lb           t3, 12(tp)
                  lb           gp, -9(sp)
                  sw           zero, 2(tp)
                  lbu          s9, 0(tp)
                  lh           t3, -2(sp)
                  lw           s7, 14(sp)
                  lb           s4, 8(sp)
                  lhu          t0, -16(sp)
                  lb           a1, 13(tp) #end load_store_instr_stream_1
                  sh           t4, 8(sp) #end load_store_instr_stream_0
                  bgeu         s6, s10, 4968f
                  sll          s9, a3, a4
                  srai         s3, t3, 31
                  c.beqz       s1, 4961f
                  c.addi16sp   sp, -16
                  c.addi4spn   s1, sp, 832
4961:             addi         ra, s4, 1456
                  c.add        a5, a7
                  mul          s8, t0, s7
                  beq          s8, a4, 4968f
                  c.addi16sp   sp, 32
                  c.and        a2, a4
                  lui          s7, 704858
4968:             blt          a6, s0, 4970f
                  sltiu        zero, a4, 1233
4970:             addi         s0, t1, 177
                  c.slli       a5, 3
                  auipc        s6, 855749
                  c.or         s0, s0
                  c.slli       s1, 25
                  lui          s0, 110057
                  divu         s10, gp, s10
                  c.beqz       a5, 4980f
                  c.andi       a5, 20
                  c.xor        a4, a1
4980:             c.and        a2, a4
                  andi         a1, a5, -816
                  c.addi4spn   a4, sp, 608
                  bge          s8, s3, 4994f
                  c.addi4spn   a5, sp, 912
                  slt          a7, ra, t5
                  sll          a6, t0, gp
                  c.andi       s0, -1
                  c.bnez       a1, 5007f
                  andi         s3, s11, 1360
                  blt          t2, s11, 5006f
                  c.xor        s1, a5
                  c.add        t2, a2
                  c.slli       a2, 6
4994:             c.li         t4, 11
                  c.and        a5, a0
                  c.andi       a3, 28
                  bgeu         t4, s3, 5015f
                  srl          t5, t5, ra
                  mulhu        t0, t3, a2
                  c.addi4spn   a3, sp, 64
                  blt          a0, s11, 5017f
                  c.xor        s1, s0
                  xor          s4, t0, s3
                  or           s9, sp, t3
                  sltu         t5, a3, zero
5006:             xor          a3, a1, s6
5007:             bgeu         t6, s5, 5026f
                  add          s4, a0, a1
                  lui          sp, 83967
                  c.nop
                  beq          t1, a2, 5025f
                  c.or         a2, a3
                  mulhu        a7, t3, a3
                  slti         s11, t0, -654
5015:             c.slli       a3, 23
                  srl          s4, zero, t5
5017:             xori         a7, a3, -936
                  and          ra, zero, s10
                  c.addi       a6, 19
                  mulh         t3, t3, a3
                  srl          t4, s2, s5
                  c.add        t0, t6
                  c.lui        a4, 3
                  divu         s0, a6, s0
5025:             mulhu        a5, zero, s8
5026:             sra          t3, t1, s2
                  c.mv         tp, s0
                  c.xor        s0, a0
                  c.slli       s3, 26
                  slti         s9, a1, -1554
                  c.addi16sp   sp, 256
                  c.or         a5, s0
                  and          t1, gp, s11
                  nop
                  sra          s6, a4, s1
                  or           s4, s2, a1
                  srl          t5, t4, a6
                  mulhu        a1, ra, gp
                  c.sub        s0, a1
                  c.and        s0, a4
                  c.li         a3, 14
                  c.addi16sp   sp, 192
                  srl          s10, t2, tp
                  c.bnez       a4, 5056f
                  srl          gp, gp, a5
                  mulh         t1, t4, ra
                  mul          s11, s6, s11
                  c.mv         s9, s4
                  srai         t0, s2, 19
                  sltiu        gp, s10, 719
                  c.sub        a2, a4
                  srai         sp, t4, 19
                  divu         s6, sp, a5
                  xor          a7, a6, zero
                  slli         sp, ra, 5
5056:             c.mv         sp, t6
                  beq          s4, a7, 5064f
                  c.sub        a2, a1
                  c.srai       a4, 2
                  rem          a2, a0, t0
                  andi         t1, s0, -37
                  c.nop
                  c.li         t0, -1
5064:             c.addi4spn   a5, sp, 944
                  sra          t6, s10, s5
                  divu         a7, t6, a2
                  mul          t2, t0, a3
                  c.nop
                  c.and        a1, a3
                  bltu         t1, t1, 5083f
                  c.mv         t3, s11
                  c.addi4spn   s0, sp, 192
                  c.beqz       a5, 5091f
                  c.lui        t4, 16
                  srl          a6, zero, a5
                  c.beqz       s0, 5093f
                  sltiu        s3, s4, 1530
                  slli         sp, s5, 16
                  srai         ra, sp, 19
                  mulhu        t3, sp, a0
                  c.nop
                  slt          t5, ra, s1
5083:             srli         s10, s2, 29
                  c.bnez       a1, 5102f
                  auipc        t3, 321628
                  c.srli       a2, 21
                  ori          a7, t3, -894
                  sra          s6, t6, s2
                  bltu         s3, a5, 5095f
                  sub          s11, s9, t1
5091:             bltu         t2, s3, 5107f
                  slti         s4, a7, 297
5093:             mulh         a1, tp, a4
                  nop
5095:             c.lui        s9, 15
                  mulhsu       a1, a0, a4
                  slti         s3, s10, 895
                  addi         t2, t0, 849
                  divu         a2, t2, a4
                  and          a6, s11, gp
                  beq          a3, s2, 5116f
5102:             sltu         t1, a2, t2
                  and          s11, gp, tp
                  c.andi       a1, 23
                  srl          s8, ra, a4
                  c.beqz       a3, 5122f
5107:             blt          sp, t2, 5120f
                  c.addi       s10, 2
                  c.lui        ra, 23
                  srl          tp, ra, zero
                  xor          gp, ra, t3
                  c.addi4spn   a5, sp, 640
                  or           s9, s9, t0
                  add          a4, t3, t0
                  c.xor        a2, a3
5116:             c.lui        s9, 7
                  slli         ra, a1, 5
                  or           s8, t3, a3
                  c.sub        a5, a1
5120:             c.or         a1, a1
                  divu         tp, s3, s3
5122:             c.and        a5, a5
                  rem          t1, a1, s4
                  xor          t1, sp, ra
                  mulh         s9, t3, a2
                  slti         sp, a5, 1578
                  or           t1, zero, s10
                  sub          a5, a7, s3
                  mulhu        tp, a5, s7
                  mul          s6, a0, s1
                  c.addi16sp   sp, -16
                  slt          t1, s10, a7
                  bge          a1, t0, 5146f
                  bltu         a1, a4, 5137f
                  sll          t3, s11, s10
                  auipc        tp, 1027541
5137:             c.mv         t0, s2
                  sll          s4, s8, s11
                  c.xor        a1, a4
                  andi         t0, sp, -363
                  slt          sp, s2, a1
                  sub          s10, a5, sp
                  nop
                  c.or         a5, a2
                  slli         s10, s2, 29
5146:             c.mv         s0, a7
                  c.xor        a1, s1
                  c.srli       s0, 29
                  c.slli       a7, 19
                  c.or         a4, a5
                  sltu         zero, a6, t0
                  srl          gp, t0, a4
                  ori          a6, s3, -566
                  sra          t4, s5, sp
                  c.addi16sp   sp, 208
                  sub          t0, t6, s4
                  mulh         s0, a4, a4
                  c.srli       s1, 9
                  sltu         zero, s4, s4
                  c.sub        a5, a2
                  divu         s4, s1, s10
                  c.addi4spn   s1, sp, 864
                  c.sub        a1, a2
                  srai         s9, s3, 21
                  c.addi       a1, -1
                  or           a1, s5, s11
                  sltiu        t4, t1, 417
                  c.nop
                  c.lui        t4, 19
                  div          t1, t4, t5
                  c.li         t1, -1
                  c.and        a2, a4
                  srai         s3, t1, 15
                  sll          gp, t2, s5
                  mulh         t0, s5, gp
                  c.lui        t4, 14
                  sltu         t1, s9, gp
                  xori         s9, a5, 970
                  c.li         t5, 21
                  or           sp, a4, s2
                  add          a4, s1, ra
                  xori         t3, s10, -1292
                  nop
                  srai         zero, t2, 17
                  c.or         a1, a1
                  mulh         t3, a5, gp
                  addi         a4, s3, -1097
                  c.addi       sp, 31
                  la           s11, sub_5
                  c.andi       s0, 16
                  c.srai       s1, 6
                  c.slli       t1, 14
                  addi         s11, s11, 48
                  srl          s7, zero, s1
                  sltiu        a2, a5, 917
                  sll          a2, s7, ra
sub_4_j8:         jalr         t3, s11, -48 #jump sub_4 -> sub_5
                  rem          a3, zero, s3
                  c.sub        s0, a0
                  auipc        t5, 624287
                  or           zero, t5, a6
                  sub          a7, zero, t4
                  remu         s11, s2, a5
                  mulhsu       a1, t1, a7
                  slli         t2, a7, 9
                  andi         t4, s2, 146
                  rem          zero, zero, s8
                  auipc        s1, 999601
                  ori          s7, a7, -76
                  la           t4, region_0+1620 #start load_store_instr_stream_2
                  la           s6, region_0+95 #start load_store_instr_stream_1
                  lbu          a6, -1193(t4)
                  sb           zero, 210(s6)
                  la           a2, region_0+1632 #start load_store_instr_stream_3
                  sb           s4, -627(t4)
                  la           ra, region_0+697 #start load_store_instr_stream_0
                  lbu          t2, 59(a2)
                  lb           a3, 187(s6)
                  lhu          a1, 30(a2)
                  lb           a1, -1029(t4)
                  lbu          zero, -8(ra)
                  sb           a4, -57(ra)
                  sb           s10, 229(s6)
                  lbu          s11, 339(t4)
                  lh           s11, -47(ra)
                  sh           a1, -30(a2)
                  sw           a6, -868(t4)
                  sh           s11, -504(t4)
                  lbu          tp, 67(s6)
                  sh           t0, 6(a2)
                  lb           a4, -6(ra)
                  lw           t3, 27(ra)
                  sw           sp, -11(s6)
                  lbu          a3, -31(a2)
                  lh           s4, -588(t4) #end load_store_instr_stream_2
                  lbu          a3, -30(ra)
                  lb           zero, 143(s6)
                  lb           s8, -30(ra)
                  sw           s10, 241(s6)
                  sw           zero, 27(ra)
                  lb           s8, -23(a2) #end load_store_instr_stream_3
                  sb           t3, -54(ra)
                  sb           a0, 233(s6) #end load_store_instr_stream_1
                  sb           zero, 44(ra) #end load_store_instr_stream_0
                  c.mv         s7, s5
                  slt          s11, a1, a4
                  addi         t6, s1, -575
                  srli         t2, t4, 4
                  c.mv         s7, s7
                  srai         s9, t5, 2
                  c.srai       a1, 12
                  addi         s6, t4, -1088
                  mul          t3, t0, s3
                  mulh         t2, a1, gp
                  bne          a0, s2, 5218f
                  bgeu         s11, s9, 5225f
                  c.addi16sp   sp, 384
                  mulh         a2, t3, t0
                  c.srai       a4, 3
                  addi         ra, gp, 1650
                  nop
                  sra          t0, gp, s1
5218:             c.lui        a4, 26
                  add          s7, s2, s5
                  and          s4, t2, t1
                  c.mv         t6, s8
                  mulhu        a3, a3, zero
                  c.nop
                  rem          zero, t5, s5
5225:             beq          t4, t6, 5227f
                  blt          gp, tp, 5244f
5227:             c.bnez       a3, 5246f
                  srl          a3, s5, t4
                  c.li         a5, 11
                  xori         s10, t2, 87
                  bge          t2, s11, 5249f
                  mul          t5, zero, tp
                  c.mv         a5, s5
                  slli         t6, s10, 3
                  bne          s2, zero, 5236f
5236:             add          gp, s3, s11
                  xori         s0, s10, -1854
                  c.andi       a2, 1
                  div          t6, sp, t5
                  ori          s6, a0, -961
                  lui          s10, 362270
                  c.or         s0, a3
                  c.mv         t1, a0
5244:             ori          s1, a6, -1434
                  c.srli       a2, 5
5246:             sll          a4, s10, a1
                  rem          a6, gp, sp
                  c.li         s11, 16
5249:             c.srli       s1, 20
                  mulhsu       s6, s6, a6
                  ori          t2, sp, -1948
                  c.mv         a2, a0
                  blt          t5, s0, 5254f
5254:             c.add        t3, s10
                  sll          t4, s5, s6
                  nop
                  div          t3, a2, ra
                  add          s11, s3, zero
                  divu         a2, s10, t6
                  c.lui        s6, 24
                  sra          a2, s1, gp
                  rem          a4, s1, s8
                  c.sub        s0, a1
                  sub          ra, t5, t5
                  c.or         a5, s1
                  slli         a6, a6, 21
                  beq          a2, t2, 5284f
                  c.nop
                  sll          ra, a1, s6
                  slli         ra, a6, 10
                  or           s10, tp, s7
                  slli         s10, s4, 27
                  blt          a7, t5, 5292f
                  xor          s11, a6, a0
                  and          tp, s6, a4
                  c.nop
                  c.slli       a6, 3
                  sltiu        t3, s7, -132
                  slti         a3, s11, 308
                  andi         a6, s0, -1720
                  c.addi       t0, 13
                  remu         a6, t1, t6
                  divu         s6, t3, s3
5284:             srli         gp, a5, 8
                  bgeu         tp, s1, 5297f
                  rem          a1, a2, a0
                  xor          s3, t1, t3
                  c.mv         tp, a5
                  sltu         s10, s1, a2
                  xori         s3, s5, -275
                  mulhu        s3, t1, s8
5292:             bge          s7, a3, 5311f
                  c.addi16sp   sp, -16
                  slt          t3, a1, gp
                  lui          zero, 50786
                  c.mv         t5, s2
5297:             c.mv         s4, a7
                  rem          t1, s0, s0
                  srli         s3, t6, 28
                  sltu         t6, tp, s11
                  mulhsu       a1, a6, t0
                  c.li         s10, -1
                  c.srli       s0, 21
                  addi         s6, t1, 400
                  c.mv         gp, a5
                  c.addi       t2, -1
                  divu         a6, t6, zero
                  mulhsu       s3, s1, s0
                  sltiu        a3, s7, -1834
                  blt          s11, t4, 5321f
5311:             blt          t6, s7, 5324f
                  beq          t3, t0, 5316f
                  bltu         s0, s4, 5324f
                  auipc        a1, 901202
                  srl          zero, s11, a5
5316:             mulh         s4, s10, t2
                  andi         a6, s9, -173
                  mul          t3, tp, zero
                  srli         a6, zero, 2
                  c.addi16sp   sp, -16
5321:             blt          ra, s3, 5324f
                  c.addi4spn   s0, sp, 496
                  slli         s11, a5, 25
5324:             srli         a7, t3, 23
                  c.addi       s10, -1
                  srl          s4, s3, s3
                  c.sub        s0, a0
                  srli         s6, gp, 7
                  mulhsu       a1, t1, s3
                  slli         a7, a3, 17
                  sll          a4, s9, t0
                  lui          s10, 966882
                  bgeu         s9, sp, 5347f
                  c.or         s0, a5
                  mulhu        s4, sp, s10
                  c.bnez       a2, 5343f
                  c.and        a1, a3
                  slli         a3, s3, 28
                  lui          ra, 388824
                  c.bnez       a1, 5353f
                  c.li         s4, 25
                  c.li         s4, -1
5343:             remu         gp, a7, t6
                  lui          a6, 403139
                  mulhsu       t3, a5, t2
                  sltiu        t6, s4, 362
5347:             xori         s11, zero, -501
                  c.srli       s0, 10
                  beq          t1, a5, 5369f
                  and          t6, a7, s7
                  c.xor        a1, a1
                  c.slli       a5, 10
5353:             divu         s10, t3, s10
                  bne          t0, ra, 5367f
                  remu         a5, s9, s5
                  andi         sp, a3, 1218
                  sub          s0, a0, sp
                  mulhu        s8, ra, s5
                  lui          t3, 667253
                  slt          s6, s11, a7
                  srli         s1, a4, 29
                  lui          t6, 445100
                  bltu         tp, a0, 5382f
                  div          t0, a3, s10
                  mul          ra, s11, a3
                  srai         s0, a4, 23
5367:             mulhu        s9, t6, gp
                  sra          s1, a0, t1
5369:             c.srli       s1, 29
                  srli         a5, ra, 10
                  c.srai       s1, 4
                  slti         sp, t0, 2039
                  bgeu         s3, t3, 5374f
5374:             mul          t1, s8, s9
                  c.and        s1, a4
                  mulh         s3, s1, sp
                  nop
                  c.add        a5, t0
                  c.addi16sp   sp, 288
                  c.addi4spn   a1, sp, 48
                  and          s3, a6, tp
5382:             c.nop
                  bgeu         a5, a2, 5402f
                  rem          s8, t6, gp
                  add          s3, t1, s9
                  xor          ra, s11, t0
                  mul          s6, s10, t1
                  sll          s10, s11, a5
                  c.mv         t4, s9
                  remu         sp, a3, ra
                  add          a2, a3, t5
                  xor          t0, s9, a2
                  c.mv         a6, s7
                  srl          t6, a1, zero
                  c.xor        s1, s0
                  c.or         s0, s0
                  mulh         t1, s7, s8
                  sltiu        s10, s5, -1289
                  xori         s1, tp, 160
                  rem          a6, s4, s5
                  c.mv         a2, t5
5402:             c.addi       a7, -1
                  c.bnez       a5, 5405f
                  c.li         gp, 15
5405:             sra          s0, s2, t5
                  remu         a3, a6, a2
                  addi         t5, zero, -1323
                  bltu         gp, s2, 5424f
                  mulhu        sp, s9, t2
                  c.nop
                  srl          ra, t0, t2
                  c.andi       a4, -1
                  c.add        s0, t4
                  andi         a7, sp, -794
                  bltu         ra, t6, 5419f
                  nop
                  lui          s6, 819988
                  sll          s0, s11, ra
5419:             c.beqz       s0, 5437f
                  bltu         t0, t2, 5437f
                  c.addi16sp   sp, 16
                  srai         a5, s0, 29
                  bge          tp, s6, 5435f
5424:             sltu         t6, zero, a5
                  slli         gp, s0, 25
                  blt          t3, t6, 5429f
                  auipc        a4, 668819
                  sra          s8, a1, t4
5429:             auipc        s3, 96621
                  xori         t3, s0, 253
                  blt          s11, t5, 5441f
                  rem          t6, sp, gp
                  sltu         s9, s2, s9
                  xori         a3, a3, 1519
5435:             xori         s7, t4, 594
                  slti         t4, s5, -498
5437:             mul          a2, s4, t2
                  srl          tp, s9, s7
                  c.addi4spn   a3, sp, 320
                  srai         t3, a7, 28
5441:             sltiu        tp, s7, -879
                  c.li         t6, -1
                  lw           t3, 4(s5)
                  slt          a5, a7, t5
                  auipc        t4, 600525
                  c.mv         a7, t2
                  addi         s5, s5, 40
                  srli         a4, sp, 15
9567:             addi x6, x28, 0
9567:             c.jalr x6
sub_3:            srl          a5, s6, s2
                  c.li         a7, -1
                  c.add        a5, s11
                  addi         s5, s5, -60
                  c.add        s9, s2
                  sw           t3, 4(s5)
                  srl          s11, s6, s10
                  addi         s9, s0, 1578
                  ori          s8, t2, 522
                  mul          t3, zero, s4
                  c.srli       a1, 18
                  c.and        a2, a3
                  c.slli       a1, 5
                  c.sub        s0, a4
                  mulhsu       t4, a1, ra
                  beq          s6, gp, sub_3_j5 #branch to jump instr
                  mul          a3, s9, t5
                  andi         s3, a0, -1965
sub_3_j5:         jal          t3, sub_4 #jump sub_3 -> sub_4
                  la           t6, amo_0+36 #start riscv_amo_instr_stream_4
                  la           t1, amo_0+16
                  amoor.w.rl    t3, t0, (t1)
                  amomin.w.rl   sp, s0, (t1) #end riscv_amo_instr_stream_4
                  la           sp, region_1+820 #start riscv_load_store_rand_instr_stream_3
                  c.srai       a4, 13
                  sb           s11, 13(sp)
                  sb           s6, 1(sp)
                  mulh         s6, t0, s8
                  sh           s3, 2(sp)
                  lb           a5, 1(sp)
                  slti         a6, a4, -1707
                  sb           s8, 3(sp)
                  sh           t5, 10(sp)
                  lbu          s7, -15(sp)
                  sh           a4, 14(sp)
                  lb           s8, -12(sp)
                  sb           a2, -1(sp)
                  srai         s4, s2, 30
                  c.li         tp, -1
                  and          a3, a2, s11
                  lbu          a6, 1(sp)
                  c.and        s0, a3
                  sw           t4, -12(sp)
                  srli         s8, t0, 7
                  auipc        gp, 942783
                  c.srli       s1, 13
                  lbu          tp, 7(sp)
                  sb           s11, -5(sp)
                  xori         a1, a4, -528
                  c.xor        a5, s0
                  lb           t1, -9(sp)
                  lb           t5, -6(sp)
                  sb           t3, 7(sp)
                  sb           s4, -5(sp)
                  lbu          s6, -8(sp)
                  lb           a2, -7(sp)
                  lbu          t2, 3(sp)
                  sll          t2, s3, gp
                  c.nop
                  lbu          t4, -5(sp)
                  sltiu        s10, t2, -1129
                  c.li         t6, -1
                  sra          t2, tp, s1
                  lb           s9, 5(sp)
                  c.mv         a2, s10
                  lbu          a1, -3(sp)
                  sh           a1, -2(sp)
                  lb           tp, -8(sp)
                  add          s11, s4, t5
                  sll          s1, a7, ra
                  lui          a1, 85722
                  sll          s9, t4, a1
                  and          a2, t5, s4
                  c.swsp       t4, 12(sp)
                  sw           t3, -16(sp) #end riscv_load_store_rand_instr_stream_3
                  la           sp, region_1+1890 #start riscv_load_store_rand_instr_stream_5
                  divu         a3, a6, t1
                  xori         s7, zero, 1784
                  sh           a0, -172(sp)
                  div          s4, zero, a7
                  divu         s8, sp, a6
                  c.nop
                  srl          t6, s4, t3
                  srl          zero, s4, s9
                  sb           s5, -141(sp)
                  sltiu        t5, s8, -213
                  sb           tp, 25(sp)
                  srli         s3, t5, 28
                  lhu          t0, -246(sp)
                  sb           s4, -245(sp)
                  xor          s11, tp, tp
                  sb           t0, 17(sp)
                  c.lui        s3, 3
                  remu         t3, t5, t3
                  lhu          s6, -154(sp)
                  lb           gp, -13(sp)
                  remu         a3, gp, zero
                  sb           a4, -62(sp)
                  sb           a4, -174(sp)
                  mulh         tp, t2, s4
                  sb           s4, 68(sp)
                  lbu          s7, 85(sp)
                  lbu          gp, -223(sp)
                  lb           t1, -126(sp)
                  lb           a7, -197(sp)
                  sw           s5, -154(sp)
                  div          s9, a5, s7
                  rem          s0, a1, s8
                  sb           a4, -117(sp)
                  lhu          a5, 46(sp)
                  sh           s3, 24(sp)
                  lb           ra, 77(sp)
                  add          zero, a4, sp
                  sb           a0, -57(sp) #end riscv_load_store_rand_instr_stream_5
                  la           a4, region_0+1100 #start load_store_instr_stream_0
                  la           s6, region_0+1261 #start load_store_instr_stream_3
                  la           s3, region_0+389 #start load_store_instr_stream_2
                  la           tp, region_0+1221 #start load_store_instr_stream_1
                  lh           a2, -3(s3)
                  sw           a7, -61(s3)
                  lh           s1, 531(s6)
                  lbu          t5, 121(a4)
                  sb           s3, -6(s3)
                  lbu          s7, -920(tp)
                  sb           t5, -14(s3)
                  lh           s10, 818(a4)
                  lb           s0, -1135(tp)
                  lhu          a2, 356(a4)
                  lb           s4, -196(s6)
                  lb           ra, -43(s3)
                  sb           s1, -368(tp)
                  lb           t4, 34(s3)
                  lh           s4, -56(a4)
                  lhu          a6, -56(a4)
                  sb           a5, -440(s6)
                  sb           t5, -97(a4)
                  lh           s7, -59(s3)
                  sh           tp, -581(tp)
                  lh           s8, -1036(a4)
                  lhu          t5, 270(a4)
                  lbu          a7, 783(a4)
                  lb           a2, -10(s3)
                  lb           t2, -48(s3) #end load_store_instr_stream_2
                  sb           a7, -578(tp) #end load_store_instr_stream_1
                  lbu          a1, -1158(s6)
                  lbu          a3, 590(s6) #end load_store_instr_stream_3
                  lbu          a1, -661(a4) #end load_store_instr_stream_0
                  la           s11, region_1+1166 #start load_store_instr_stream_1
                  la           a3, region_1+381 #start load_store_instr_stream_0
                  la           s1, region_1+1279 #start load_store_instr_stream_3
                  sb           s5, 116(a3)
                  la           a2, region_1+1371 #start load_store_instr_stream_4
                  lhu          s9, -238(s11)
                  lw           s7, -11(s1)
                  la           t3, region_1+1730 #start load_store_instr_stream_2
                  lb           s9, -34(s1)
                  sw           a4, 35(a3)
                  sb           a5, 114(t3)
                  lbu          sp, 47(s11)
                  lb           t0, -19(s1)
                  lh           a1, 179(a3)
                  lbu          zero, -20(a2)
                  lbu          a1, 12(t3)
                  sw           s2, -15(s1)
                  sw           s9, 66(t3)
                  lh           a7, -176(s11)
                  lb           s7, -13(s1)
                  sb           zero, -104(a3)
                  lbu          sp, 23(s1)
                  lb           t4, -79(t3)
                  lh           t4, -159(a2)
                  lh           t2, 216(s11)
                  sw           s8, 243(a3)
                  sw           gp, 238(s11)
                  lbu          a5, -193(t3)
                  sb           a1, -12(s1)
                  lbu          ra, -81(t3)
                  lw           a7, 89(a2)
                  sw           s6, 31(a3)
                  lb           a4, -48(a2)
                  lbu          s0, 113(s11)
                  lbu          s10, 188(a3)
                  sb           sp, 91(s11)
                  sb           s6, 3(a3)
                  lw           s0, -51(a2) #end load_store_instr_stream_4
                  sb           t6, -57(s11)
                  sb           s2, 91(s11) #end load_store_instr_stream_1
                  lw           t5, 66(t3)
                  sb           t3, 19(t3) #end load_store_instr_stream_2
                  lb           s8, -16(s1) #end load_store_instr_stream_3
                  sb           t5, 120(a3) #end load_store_instr_stream_0
                  la           sp, region_0+940 #start riscv_load_store_hazard_instr_stream_3
                  lb           t2, -3(sp)
                  sb           a1, 9(sp)
                  sb           s2, 9(sp)
                  c.addi       a3, 27
                  c.lwsp       s1, 12(sp)
                  lb           s10, -15(sp)
                  lbu          ra, -15(sp)
                  lb           s11, -15(sp)
                  c.and        a2, a1
                  srli         s1, t2, 9
                  c.swsp       s6, 8(sp)
                  sb           s4, 9(sp)
                  and          s3, t6, s1
                  c.lwsp       ra, 8(sp)
                  c.lwsp       a4, 16(sp)
                  c.nop
                  remu         t0, s5, a7
                  sb           a4, 15(sp)
                  lbu          s1, -1(sp)
                  lbu          t2, 15(sp)
                  c.swsp       t1, 8(sp) #end riscv_load_store_hazard_instr_stream_3
sub_3_27:         jal          t3, 18f
0:                jal          t1, 1f
1:                c.jal        17f
2:                c.j          22f
3:                jal          ra, 19f
4:                jal          s0, 3b
5:                c.jal        4b
6:                c.j          10f
7:                c.j          9f
8:                jal          ra, 7b
9:                c.j          23f
10:               jal          ra, 21f
11:               jal          t0, 14f
12:               jal          ra, 13f
13:               c.jal        5b
14:               c.j          12b
15:               c.j          2b
16:               c.jal        15b
17:               jal          t1, 6b
18:               c.j          0b
19:               c.jal        20f
20:               c.jal        16b
21:               c.jal        11b
22:               c.jal        8b
23:               mul          s11, s4, gp
                  la           t4, region_1+1761 #start load_store_instr_stream_1
                  lw           s10, -9(t4)
                  la           s6, region_0+1574 #start load_store_instr_stream_0
                  lbu          a1, 0(t4)
                  sb           s6, -12(s6)
                  lbu          s4, 2(t4)
                  lbu          a2, 3(t4)
                  lh           sp, 16(s6)
                  lbu          sp, -4(t4)
                  sb           s0, 11(s6)
                  sb           ra, 6(t4)
                  sh           a4, 10(s6)
                  lbu          s0, -7(t4)
                  lb           s0, -3(s6)
                  lbu          s9, -8(t4)
                  lbu          t0, 10(t4) #end load_store_instr_stream_1
                  sb           ra, 6(s6) #end load_store_instr_stream_0
sub_3_20:         jal          t3, 28f
0:                c.jal        15f
1:                c.j          13f
2:                jal          ra, 19f
3:                c.j          29f
4:                c.j          20f
5:                c.jal        4b
6:                jal          t1, 10f
7:                jal          t1, 17f
8:                c.j          16f
9:                c.j          12f
10:               c.jal        3b
11:               c.j          24f
12:               c.j          26f
13:               c.j          18f
14:               jal          t1, 6b
15:               c.jal        8b
16:               jal          ra, 1b
17:               jal          t0, 2b
18:               c.jal        23f
19:               c.j          5b
20:               jal          ra, 0b
21:               c.jal        11b
22:               c.jal        21b
23:               c.j          14b
24:               jal          s10, 9b
25:               jal          a7, 27f
26:               c.jal        7b
27:               c.j          22b
28:               c.jal        25b
29:               sll          s10, a2, a5
                  la           a5, amo_0+36 #start riscv_amo_instr_stream_5
                  c.add        s6, a6
                  amomaxu.w.rl  ra, s6, (a5)
                  c.mv         s1, a4
                  amomin.w.rl   zero, t3, (a5)
                  amomin.w.rl   s7, sp, (a5)
                  amomaxu.w.aq  a6, t2, (a5)
                  amoadd.w.rl   a3, zero, (a5)
                  amomaxu.w.aq  t6, s10, (a5)
                  amoor.w.aq    t4, s3, (a5)
                  srai         sp, a5, 30
                  amoor.w       a7, s11, (a5) #end riscv_amo_instr_stream_5
                  la           s3, region_0+1127 #start load_store_instr_stream_2
                  la           sp, region_0+1144 #start load_store_instr_stream_1
                  la           s10, region_0+155 #start load_store_instr_stream_3
                  lhu          a4, 143(s3)
                  la           s4, region_0+837 #start load_store_instr_stream_0
                  sb           s6, -111(sp)
                  lbu          zero, 48(s4)
                  sb           a1, 165(sp)
                  lw           t4, -61(s4)
                  lw           s6, 757(s3)
                  sb           s2, 212(s3)
                  lb           t3, -48(s4)
                  lbu          a7, -862(s3)
                  lhu          s6, 29(s4)
                  sb           s4, -65(sp)
                  c.swsp       s10, 12(sp)
                  sb           t6, -845(s3)
                  sh           gp, -411(s3)
                  lh           s6, 559(s3)
                  sh           t0, -1(s10)
                  lb           t3, -11(s4)
                  sb           t2, -44(s10)
                  lhu          a2, -867(s3)
                  lh           a2, 25(s10)
                  sb           s10, -161(sp)
                  sh           s5, -29(s10)
                  sb           a3, -177(sp) #end load_store_instr_stream_1
                  lbu          a5, -19(s4)
                  lb           t5, 47(s10) #end load_store_instr_stream_3
                  lh           zero, -763(s3) #end load_store_instr_stream_2
                  lh           ra, -45(s4) #end load_store_instr_stream_0
                  la           a3, region_1+725 #start riscv_load_store_rand_instr_stream_0
                  mul          a2, t3, s2
                  lui          s1, 161806
                  sw           a3, -9(a3)
                  lh           t0, 7(a3)
                  lbu          a6, -4(a3)
                  sb           tp, -6(a3)
                  c.li         s11, -1
                  lw           t6, 11(a3)
                  sh           s7, -7(a3)
                  lbu          zero, -6(a3)
                  sb           s0, -2(a3)
                  c.nop
                  sltu         s4, s5, a6
                  lbu          sp, 10(a3)
                  sb           a3, -4(a3)
                  lb           t3, 5(a3)
                  slli         ra, ra, 16
                  lw           tp, -13(a3)
                  lbu          sp, -11(a3)
                  srai         s4, s10, 11
                  slt          a4, zero, s5
                  addi         s11, s5, 1322
                  lhu          s1, 15(a3)
                  lh           a6, 3(a3)
                  and          gp, a6, t2
                  sb           s5, -4(a3)
                  c.mv         s11, s10
                  lb           t2, -2(a3)
                  sb           a7, -2(a3)
                  lh           ra, -7(a3)
                  lb           s1, -3(a3)
                  remu         t4, t6, s1
                  c.addi4spn   a5, sp, 448
                  lb           s0, -8(a3)
                  divu         a1, t6, s7
                  sra          t5, s7, t4
                  lh           a5, 9(a3)
                  lb           a4, 0(a3)
                  lh           s11, 13(a3) #end riscv_load_store_rand_instr_stream_0
                  addi         a4, zero, 4 #init loop 0 counter
                  addi         t6, zero, 12 #init loop 0 limit
sub_3_53_0_t:     c.sub        a3, a5
                  c.addi4spn   a5, sp, 800
                  addi         a4, a4, 4 #update loop 0 counter
                  beq          a4, t6, sub_3_53_0_t #branch for loop 0
                  c.addi4spn   a1, sp, 784
                  la           a4, amo_0+24 #start riscv_lr_sc_instr_stream_4
                  or           s9, t4, t6
                  c.srli       a3, 4
                  lr.w.rl       s3, (a4)
                  rem          t1, sp, ra
                  c.add        s8, s3
                  mulh         tp, a2, t1
                  c.sub        a2, s1
                  remu         t4, s6, s3
                  c.and        a1, a3
                  c.sub        a1, s0
                  sra          s7, s11, t3
                  sltiu        zero, a2, 291
                  srli         s0, a7, 10
                  sc.w.aq       t0, t4, (a4) #end riscv_lr_sc_instr_stream_4
                  la           s4, region_0+1865 #start load_store_instr_stream_1
                  la           a3, region_1+159 #start load_store_instr_stream_0
                  lbu          a7, -38(s4)
                  lh           sp, -3(s4)
                  sb           s0, -28(a3)
                  sb           s11, -2(a3)
                  lbu          tp, -42(a3)
                  lhu          s11, -19(s4)
                  sb           a3, -40(a3)
                  lb           a7, 47(s4)
                  sb           s9, 30(s4) #end load_store_instr_stream_1
                  lhu          a4, 31(a3) #end load_store_instr_stream_0
                  la           sp, region_1+1909 #start riscv_load_store_rand_instr_stream_2
                  sltu         s10, a7, a1
                  c.or         a4, s1
                  lbu          a6, -1909(sp)
                  sh           t4, -249(sp)
                  sb           a3, -1450(sp)
                  sb           a3, -435(sp)
                  c.li         a4, 25
                  lb           gp, -772(sp)
                  sb           sp, -816(sp)
                  lh           s3, -1517(sp)
                  add          s11, t4, s5
                  c.and        s0, a5
                  rem          t1, s6, s2
                  sra          s0, a0, a6
                  div          s4, s0, s11
                  c.or         a2, a4
                  sltu         t1, a3, t5
                  lw           a7, -1601(sp)
                  lb           a2, -506(sp)
                  srli         t0, s2, 14
                  divu         s1, sp, s8
                  sh           a6, -83(sp)
                  or           gp, s9, t5
                  c.lui        s4, 24
                  lb           a2, -1262(sp)
                  sh           s4, -1879(sp)
                  or           a4, a3, s4
                  srai         tp, s0, 6
                  srai         t6, s0, 27
                  c.lui        s6, 7
                  lb           ra, -844(sp)
                  lh           s7, -625(sp)
                  ori          t6, s8, -91
                  mulh         t3, s11, zero
                  remu         s3, sp, t1
                  sb           sp, -1093(sp)
                  c.addi       a5, 5
                  rem          a1, t6, zero
                  mulhsu       t6, s1, ra
                  mulhu        t5, s1, a0
                  mul          ra, zero, gp
                  lw           a4, -1509(sp)
                  lb           t1, -1768(sp)
                  mulhsu       s8, s1, s9
                  lhu          s9, -211(sp)
                  lb           a1, -952(sp)
                  sb           a3, -904(sp)
                  lw           s8, -789(sp)
                  c.nop
                  mulhu        a6, a0, a0
                  sb           t5, -576(sp) #end riscv_load_store_rand_instr_stream_2
                  la           tp, region_1+1374 #start riscv_hazard_instr_stream_9
                  lb           ra, 49(tp)
                  sh           a5, 50(tp)
                  lbu          s1, 20(tp)
                  lbu          s9, -27(tp)
                  slti         a5, ra, 1048
                  c.addi       a6, 6
                  lui          a4, 288534
                  lhu          a5, -12(tp)
                  c.nop
                  sb           a6, -11(tp)
                  lbu          a5, 51(tp)
                  sh           s1, -64(tp)
                  xor          s9, s9, a5
                  lbu          s1, 37(tp)
                  lbu          a4, 49(tp)
                  lb           a6, 60(tp)
                  lh           a5, -14(tp)
                  lhu          a4, 56(tp)
                  div          s9, a5, a5
                  mulhsu       s9, ra, s1
                  sb           a5, 27(tp)
                  slt          a5, s9, a4
                  lbu          ra, 52(tp)
                  sb           s1, -37(tp)
                  lb           s1, -57(tp)
                  lb           a6, -23(tp)
                  sh           a6, 44(tp)
                  srai         a6, ra, 23
                  lh           s9, -4(tp)
                  c.add        ra, a6
                  sb           ra, -64(tp)
                  sub          s1, a6, a4
                  lbu          s1, -16(tp)
                  lb           a4, -9(tp)
                  lbu          a6, -51(tp)
                  lb           s1, 29(tp)
                  lw           a5, -58(tp)
                  lb           s9, 45(tp) #end riscv_hazard_instr_stream_9
                  la           t5, region_1+1198 #start riscv_load_store_hazard_instr_stream_1
                  lw           a5, 62(t5)
                  lbu          s10, 62(t5)
                  lb           s1, 62(t5)
                  xor          s10, s10, zero
                  lw           s3, 62(t5)
                  andi         t4, t2, -1196
                  ori          t3, t6, -1
                  lw           a1, 62(t5)
                  sb           t2, 62(t5)
                  sb           a7, 62(t5)
                  sb           a5, 62(t5)
                  lw           s11, 62(t5)
                  lhu          a3, 62(t5)
                  sb           a3, 62(t5)
                  lh           s11, 62(t5)
                  lb           t4, 62(t5)
                  c.addi16sp   sp, 416
                  sh           sp, 62(t5)
                  remu         t2, a4, s4
                  lb           a6, 62(t5)
                  c.srli       a1, 21
                  sw           s5, 62(t5)
                  lh           s6, 62(t5) #end riscv_load_store_hazard_instr_stream_1
sub_3_21:         jal          t3, 17f
0:                c.j          16f
1:                jal          ra, 18f
2:                c.jal        6f
3:                c.jal        7f
4:                jal          t1, 11f
5:                c.j          4b
6:                c.j          0b
7:                jal          t1, 12f
8:                c.jal        2b
9:                c.jal        8b
10:               c.jal        14f
11:               c.jal        9b
12:               c.jal        5b
13:               c.jal        10b
14:               c.j          1b
15:               c.j          19f
16:               jal          ra, 15b
17:               jal          ra, 13b
18:               jal          ra, 3b
19:               or           t6, t2, a5
                  la           t1, amo_0+48 #start riscv_lr_sc_instr_stream_0
                  lr.w.rl       s4, (t1)
                  sub          gp, tp, gp
                  mul          s7, t6, a7
                  sc.w.rl       t0, a1, (t1) #end riscv_lr_sc_instr_stream_0
                  la           a7, region_1+236 #start riscv_load_store_rand_instr_stream_6
                  sltiu        t5, s1, -1772
                  xor          zero, s0, a6
                  lbu          tp, 58(a7)
                  lbu          a6, -57(a7)
                  mulhsu       tp, a2, s10
                  sltiu        s0, t2, 1521
                  addi         a2, sp, -1982
                  slli         a2, s11, 3
                  remu         tp, tp, a2
                  add          a4, a4, t2
                  lbu          s1, -17(a7)
                  andi         a5, t1, 1741
                  lbu          a5, 46(a7)
                  xor          a4, sp, t4
                  sb           a1, -57(a7)
                  lhu          a1, 8(a7)
                  divu         sp, s0, gp
                  lb           tp, 45(a7)
                  lb           sp, -45(a7)
                  c.srli       s0, 29
                  lb           gp, -42(a7)
                  mulh         t4, s2, a7
                  c.mv         a5, s0
                  lbu          a6, -22(a7)
                  sh           t4, 48(a7)
                  addi         t4, t6, 1814
                  slt          t0, t3, t4
                  c.nop
                  c.xor        a3, s1
                  lb           s7, 47(a7) #end riscv_load_store_rand_instr_stream_6
sub_3_25:         jal          t3, 10f
0:                c.j          14f
1:                c.jal        16f
2:                jal          ra, 11f
3:                c.j          18f
4:                c.jal        7f
5:                c.j          19f
6:                c.j          15f
7:                jal          t1, 26f
8:                c.jal        25f
9:                jal          t1, 13f
10:               c.jal        6b
11:               jal          ra, 23f
12:               c.j          3b
13:               c.j          4b
14:               c.j          9b
15:               c.jal        20f
16:               c.jal        5b
17:               c.jal        21f
18:               c.j          17b
19:               jal          t2, 0b
20:               c.j          22f
21:               c.j          24f
22:               c.j          2b
23:               c.j          8b
24:               c.jal        1b
25:               c.jal        12b
26:               c.add        s4, s5
                  la           s6, amo_0+0 #start riscv_amo_instr_stream_7
                  la           a6, amo_0+40
                  la           t4, amo_0+48
                  xori         s4, a0, -881
                  amomax.w      s8, s1, (s6)
                  amomaxu.w.rl  s10, s11, (s6)
                  mulh         t2, t6, s0
                  amomaxu.w     t5, a7, (a6) #end riscv_amo_instr_stream_7
                  la           gp, amo_0+44 #start riscv_amo_instr_stream_2
                  amoor.w.rl    s0, s5, (gp)
                  or           t1, a4, a2
                  amoadd.w.aq   s6, ra, (gp)
                  srli         t2, a3, 26
                  mul          s1, t2, a2
                  nop
                  amoxor.w.aq   s9, t2, (gp)
                  amomin.w      t4, s1, (gp)
                  div          s11, s1, s7
                  amomin.w.rl   t0, a3, (gp)
                  amoadd.w.rl   s0, s4, (gp)
                  amoadd.w      zero, a7, (gp)
                  amoor.w.aq    s7, gp, (gp)
                  amoadd.w      t3, s11, (gp) #end riscv_amo_instr_stream_2
                  la           a1, region_0+1745 #start riscv_load_store_rand_instr_stream_4
                  lh           t1, -703(a1)
                  c.or         a4, s0
                  remu         s7, s3, a7
                  c.xor        s1, a5
                  lb           t1, -1264(a1)
                  lbu          a4, 108(a1)
                  slt          a3, a0, a0
                  lbu          s1, -172(a1)
                  lbu          a2, -283(a1)
                  lb           s9, -1199(a1)
                  lbu          s7, -309(a1)
                  sb           s4, -1292(a1)
                  sb           ra, 109(a1)
                  sb           t3, -948(a1)
                  sb           zero, -712(a1)
                  nop
                  sltu         a4, a4, s2
                  and          gp, a4, s11
                  lb           s11, -1176(a1)
                  mulhu        a4, gp, t3
                  sh           s9, -1407(a1)
                  lbu          s8, -1698(a1)
                  sll          t6, s8, s10
                  sb           a0, -206(a1)
                  lb           s0, -936(a1)
                  lb           a7, -1102(a1)
                  sh           s3, -1055(a1)
                  lb           t5, -1732(a1)
                  lui          t3, 388149
                  lb           sp, -1083(a1)
                  lb           a2, -982(a1)
                  sll          s3, s2, a1
                  lb           a5, 160(a1)
                  lh           gp, -941(a1)
                  c.srli       a5, 13
                  lhu          s1, -1103(a1)
                  xori         t2, s8, 1255
                  lb           t0, -1366(a1) #end riscv_load_store_rand_instr_stream_4
                  la           t5, amo_0+0 #start riscv_amo_instr_stream_0
                  amomaxu.w.aq  t0, s11, (t5)
                  mul          s9, s0, t2
                  amoswap.w     a3, s7, (t5)
                  amoand.w      a7, a2, (t5)
                  remu         t4, t6, t2
                  and          a7, a5, t5
                  amoxor.w      s10, a4, (t5)
                  amoadd.w.rl   t3, s6, (t5)
                  ori          s7, s5, -1022
                  amoadd.w.rl   t0, zero, (t5)
                  amoadd.w.aq   t4, t3, (t5)
                  mulhsu       s6, s4, t1
                  xor          sp, s0, t6
                  amoxor.w      sp, a1, (t5) #end riscv_amo_instr_stream_0
                  la           sp, region_0+299 #start riscv_load_store_hazard_instr_stream_7
                  srl          t0, s0, s5
                  lb           s9, 6(sp)
                  sub          s8, gp, s6
                  lbu          a5, 6(sp)
                  sb           s3, -44(sp)
                  lbu          t0, -44(sp)
                  slli         s1, t1, 28
                  lb           a3, -44(sp)
                  slti         a5, a2, -1026
                  sb           t1, -44(sp)
                  lb           t6, -35(sp)
                  lb           t5, -35(sp)
                  lh           s4, -35(sp)
                  lb           gp, -35(sp)
                  sb           s7, -35(sp)
                  lhu          zero, -35(sp)
                  sb           t6, 61(sp)
                  lhu          t6, 61(sp) #end riscv_load_store_hazard_instr_stream_7
                  la           t0, region_0+636 #start load_store_instr_stream_1
                  la           s0, region_1+611 #start load_store_instr_stream_0
                  lbu          s8, -34(s0)
                  sb           t0, -15(t0)
                  lb           s6, 676(s0)
                  sh           s10, -68(t0)
                  lbu          s10, -249(t0)
                  lbu          s10, 1049(s0)
                  lbu          a5, 176(t0)
                  lbu          s8, -412(s0)
                  lb           t3, 1360(s0)
                  sb           t5, 110(t0)
                  lb           sp, -282(s0)
                  lbu          a3, 214(t0)
                  lb           s11, 47(t0) #end load_store_instr_stream_1
                  lbu          a5, -9(s0)
                  lw           t1, 1045(s0) #end load_store_instr_stream_0
                  la           a5, region_0+1658 #start riscv_load_store_rand_instr_stream_8
                  c.xor        s1, a4
                  mul          t2, a0, ra
                  c.srli       a1, 11
                  sh           t0, -24(a5)
                  sh           s5, 56(a5)
                  c.nop
                  lb           gp, -59(a5)
                  c.srai       a4, 3
                  rem          t0, t4, s3
                  c.srli       a3, 11
                  c.addi16sp   sp, 240
                  sw           s7, 2(a5)
                  lh           a4, 24(a5)
                  sh           a4, -42(a5)
                  sb           t0, 19(a5)
                  auipc        s11, 486700
                  sb           s6, 41(a5)
                  c.andi       a1, -1
                  add          t2, gp, s8
                  lb           a1, -1(a5)
                  mulh         t4, a5, a2
                  sh           s5, -56(a5)
                  lui          gp, 288671
                  lbu          gp, -9(a5)
                  lh           t4, -22(a5)
                  c.srai       a3, 17
                  lb           t2, 61(a5)
                  lh           s1, 50(a5)
                  lb           t6, 30(a5) #end riscv_load_store_rand_instr_stream_8
                  la           gp, region_0+585 #start riscv_hazard_instr_stream_2
                  sltu         zero, a6, a1
                  c.or         a1, a1
                  divu         a1, a6, a1
                  lbu          a6, 16(gp)
                  lb           a4, 5(gp)
                  lb           a7, 56(gp)
                  xor          a4, a7, a6
                  sltu         a7, a6, a6
                  sh           s4, 53(gp)
                  lbu          a1, 16(gp)
                  sb           a7, 21(gp)
                  sub          a4, s4, a1
                  auipc        a7, 374196
                  c.srli       a1, 14
                  c.andi       a1, -1
                  slli         s4, s4, 8
                  sub          zero, a7, a1
                  c.sub        a4, a4
                  c.srli       a1, 8
                  c.xor        a1, a4
                  lbu          zero, -52(gp)
                  and          zero, s4, a1
                  auipc        a1, 164273
                  lbu          a7, -26(gp)
                  c.and        a4, a1
                  and          a4, a6, zero
                  c.addi       a1, -1
                  lhu          a7, -51(gp)
                  c.mv         a7, a1
                  c.srli       a4, 16
                  lb           s4, -23(gp)
                  lb           a1, -39(gp)
                  c.nop
                  and          a6, s4, a7
                  and          zero, a1, a1
                  lh           a7, 3(gp)
                  c.lui        s4, 17
                  auipc        a4, 302680
                  div          zero, s4, a6
                  sh           zero, -5(gp) #end riscv_hazard_instr_stream_2
                  la           t2, region_0+295 #start riscv_load_store_rand_instr_stream_7
                  sb           t0, -61(t2)
                  sh           a5, 9(t2)
                  c.sub        a3, a1
                  lhu          zero, -17(t2)
                  lb           s8, -26(t2)
                  c.slli       s8, 24
                  add          sp, s6, sp
                  lhu          t1, -35(t2)
                  lbu          a1, -25(t2)
                  or           s8, s11, s3
                  divu         s9, t4, s10
                  sltiu        s6, gp, 2029
                  mulhsu       t0, a7, s7
                  sb           t6, -14(t2)
                  lb           zero, -43(t2)
                  or           t5, a7, t5
                  sb           t1, 45(t2)
                  rem          s10, s4, t1
                  srl          t4, s0, t1
                  sb           s10, 48(t2)
                  lh           s3, 53(t2)
                  c.add        s3, s10
                  sb           s2, 33(t2)
                  sub          a3, ra, s10
                  c.andi       a3, -1
                  slli         t0, s6, 15
                  mulhsu       t1, t0, s6
                  slli         t0, s4, 16
                  lh           a4, 43(t2)
                  sb           t1, 11(t2)
                  sll          a5, s11, sp
                  lhu          s1, -29(t2)
                  sb           t1, -50(t2)
                  lb           s11, 28(t2)
                  lw           a2, -7(t2) #end riscv_load_store_rand_instr_stream_7
                  la           s1, amo_0+12 #start riscv_lr_sc_instr_stream_6
                  c.add        s3, s1
                  and          t3, s8, a5
                  mulh         s10, s2, s1
                  lr.w.aq       s6, (s1)
                  c.li         s3, -1
                  sc.w.aq       t1, s10, (s1) #end riscv_lr_sc_instr_stream_6
                  la           sp, region_1+840 #start riscv_load_store_hazard_instr_stream_6
                  lh           a2, -46(sp)
                  nop
                  sb           s0, 224(sp)
                  sb           t3, 224(sp)
                  sub          ra, a7, t5
                  lhu          s6, 224(sp)
                  c.or         a4, a2
                  sb           a0, 151(sp)
                  sb           s5, 151(sp)
                  lbu          s0, 151(sp)
                  sb           a3, 81(sp)
                  lbu          s11, 81(sp)
                  or           gp, s5, t5
                  lbu          tp, -107(sp)
                  lb           t4, -107(sp)
                  lhu          t2, 218(sp)
                  sb           s0, 218(sp)
                  lb           t2, 218(sp)
                  lbu          s11, -42(sp)
                  divu         a3, s3, s9
                  slt          t1, a1, a6
                  c.li         a4, 3
                  lb           a5, -42(sp)
                  lbu          a6, 58(sp)
                  sb           s0, -91(sp) #end riscv_load_store_hazard_instr_stream_6
                  la           t3, region_1+1126 #start riscv_load_store_hazard_instr_stream_8
                  lbu          s1, -827(t3)
                  sb           t5, -827(t3)
                  lb           a7, -827(t3)
                  lbu          s6, -827(t3)
                  lb           s0, -827(t3)
                  mul          a1, s7, s7
                  sb           t0, -827(t3)
                  lbu          tp, -815(t3)
                  lb           t6, -815(t3)
                  lb           t5, -815(t3)
                  mulh         s3, t3, ra
                  auipc        s10, 544215
                  mulhu        ra, a2, ra
                  sb           s1, -815(t3) #end riscv_load_store_hazard_instr_stream_8
                  la           t3, region_0+1307 #start load_store_instr_stream_1
                  lb           s10, -114(t3)
                  la           s8, region_0+776 #start load_store_instr_stream_2
                  lb           s4, 497(s8)
                  la           gp, region_0+861 #start load_store_instr_stream_0
                  lhu          s11, -1(gp)
                  sb           tp, 10(gp)
                  lbu          a1, 26(s8)
                  sb           s2, -839(t3)
                  lb           s4, -16(gp)
                  lbu          zero, -194(t3)
                  lbu          a1, 371(s8)
                  sb           t1, -16(gp)
                  lbu          t2, -591(s8)
                  lb           s6, 440(t3)
                  sb           gp, 10(gp)
                  sb           t6, 385(s8)
                  lbu          a5, -868(t3)
                  lh           a4, 5(gp)
                  lbu          s6, 1024(s8)
                  sb           a5, 1135(s8)
                  sb           s6, 8(gp)
                  lb           s9, 601(s8) #end load_store_instr_stream_2
                  lbu          a6, -1168(t3)
                  lb           s4, 0(gp)
                  lb           tp, -114(t3) #end load_store_instr_stream_1
                  lb           s6, 14(gp) #end load_store_instr_stream_0
                  la           t0, region_1+647 #start riscv_load_store_rand_instr_stream_1
                  c.slli       sp, 28
                  lhu          tp, -203(t0)
                  lb           t2, 64(t0)
                  c.slli       sp, 28
                  remu         s3, s8, t1
                  lb           s7, -156(t0)
                  sw           t5, -103(t0)
                  c.sub        s0, a1
                  sra          a5, s0, s5
                  sb           s9, 220(t0)
                  lw           s7, 161(t0)
                  lb           a3, -250(t0)
                  lb           s6, -253(t0)
                  lhu          ra, -85(t0)
                  lb           s10, 74(t0)
                  lbu          t3, 231(t0)
                  sb           t1, 151(t0)
                  sb           sp, -218(t0)
                  lb           sp, -238(t0)
                  lui          a2, 180906
                  lw           t6, -151(t0)
                  lbu          gp, 253(t0)
                  sh           s10, 195(t0)
                  lbu          s9, -105(t0)
                  lb           gp, -120(t0)
                  sb           t5, 228(t0)
                  slt          s1, s4, a4
                  sb           s9, 184(t0)
                  c.mv         a6, a6
                  and          s0, a3, s6
                  divu         gp, t5, s6
                  andi         s3, gp, -1025
                  sb           s0, -227(t0)
                  lbu          a4, -186(t0)
                  lh           s10, 199(t0)
                  lh           a6, 255(t0) #end riscv_load_store_rand_instr_stream_1
                  la           a4, region_1+1774 #start riscv_hazard_instr_stream_3
                  sra          s0, t6, s0
                  lui          t6, 946855
                  lhu          s0, -8(a4)
                  sb           s1, 5(a4)
                  lbu          s0, -2(a4)
                  lbu          s0, 3(a4)
                  c.nop
                  lb           s0, 2(a4)
                  sb           s0, -13(a4)
                  lbu          t6, 1(a4)
                  mulhsu       s10, s10, s0
                  lhu          s1, -6(a4)
                  lbu          t6, 11(a4)
                  addi         t6, t6, -88
                  sh           s1, 4(a4)
                  c.srai       s0, 21
                  lh           s10, 4(a4)
                  lh           s4, 4(a4)
                  lbu          s4, 3(a4)
                  c.lui        s10, 20
                  lbu          t6, 2(a4)
                  sb           s9, 15(a4)
                  sb           s0, -5(a4)
                  addi         s1, s0, -1890
                  sh           t6, -10(a4)
                  andi         s1, s9, 1344
                  c.srli       s0, 21
                  lb           s4, 9(a4)
                  lh           s1, 12(a4)
                  lb           s9, 7(a4)
                  lb           s1, 6(a4)
                  ori          s10, s9, -809
                  slt          s4, t6, s1
                  lb           s4, 3(a4)
                  sll          s1, t6, s9
                  lhu          t6, 8(a4)
                  lhu          s0, 2(a4)
                  lbu          s1, -3(a4) #end riscv_hazard_instr_stream_3
                  la           a1, region_1+7 #start load_store_instr_stream_0
                  la           t0, region_0+51 #start load_store_instr_stream_1
                  lhu          a2, 59(a1)
                  lw           t3, -51(t0)
                  lw           t3, 21(a1)
                  sh           s3, 211(t0)
                  lh           zero, 31(a1)
                  lbu          tp, 126(t0)
                  lh           t6, 247(t0)
                  lbu          tp, 196(t0)
                  lh           a5, 59(t0) #end load_store_instr_stream_1
                  lb           t3, 12(a1)
                  lb           s9, 40(a1) #end load_store_instr_stream_0
sub_3_22:         jal          t3, 20f
0:                c.j          7f
1:                c.j          0b
2:                c.jal        21f
3:                jal          t1, 2b
4:                jal          ra, 14f
5:                c.jal        1b
6:                jal          ra, 16f
7:                c.j          12f
8:                c.jal        10f
9:                c.jal        8b
10:               c.j          4b
11:               c.j          3b
12:               c.j          13f
13:               c.jal        11b
14:               jal          ra, 17f
15:               c.jal        19f
16:               jal          t1, 5b
17:               jal          ra, 15b
18:               c.j          6b
19:               c.j          22f
20:               c.j          18b
21:               c.j          9b
22:               sub          a5, a6, a1
                  la           s11, region_0+1923 #start riscv_load_store_hazard_instr_stream_2
                  lbu          tp, -1779(s11)
                  lbu          t6, -1915(s11)
                  c.addi       tp, 5
                  sh           s9, -1915(s11)
                  sb           t2, -560(s11)
                  c.addi4spn   a1, sp, 928
                  sb           t1, -1050(s11)
                  andi         a5, s3, -744
                  lh           s4, 1(s11)
                  c.mv         t3, a3
                  srai         a3, s11, 14
                  c.srli       a5, 16
                  xor          gp, gp, s5
                  lb           s8, -1299(s11)
                  lbu          a7, -869(s11)
                  lbu          a4, -1646(s11)
                  sb           t1, -1272(s11)
                  lb           a1, -1094(s11)
                  sb           s11, -1014(s11)
                  lbu          tp, 16(s11)
                  lh           s10, -791(s11)
                  lb           t2, -333(s11)
                  lb           s6, -1270(s11) #end riscv_load_store_hazard_instr_stream_2
                  la           t4, region_0+1724 #start riscv_hazard_instr_stream_8
                  sb           gp, -1225(t4)
                  lbu          gp, 259(t4)
                  sb           t3, -1253(t4)
                  lb           t1, -1141(t4)
                  c.sub        s0, s0
                  sub          s11, t1, s9
                  slt          t3, gp, s9
                  sub          s11, t1, t3
                  sb           gp, -1658(t4)
                  sh           t1, -952(t4)
                  auipc        s11, 314265
                  lbu          gp, -253(t4)
                  c.nop
                  c.add        s11, gp
                  remu         s9, t1, s0
                  c.add        gp, s0
                  lbu          s11, -1163(t4)
                  sh           s9, 206(t4)
                  xor          s0, t3, s9
                  sll          gp, gp, s11
                  ori          s0, t3, 1398
                  lb           s9, -935(t4)
                  divu         s0, t3, t3
                  c.srli       s0, 12
                  lbu          gp, -1452(t4)
                  lb           gp, -1010(t4)
                  lhu          t1, -130(t4)
                  lbu          t1, 72(t4)
                  lbu          s11, -1660(t4)
                  lb           t3, -1495(t4)
                  srli         gp, t3, 14
                  lb           t3, -1231(t4)
                  lbu          gp, -1503(t4)
                  sltiu        t1, s11, 647
                  lh           gp, -342(t4)
                  c.add        s9, s9
                  lb           t1, -1581(t4)
                  c.srai       s0, 24
                  mul          t1, s11, t3
                  c.addi       t3, -1
                  lb           s0, -171(t4)
                  c.and        s0, s0
                  sh           t1, -658(t4)
                  c.and        s0, s0
                  lbu          s11, 223(t4)
                  addi         s9, gp, -610
                  c.lui        t3, 6
                  c.li         gp, -1
                  lhu          t1, -1250(t4)
                  ori          t1, t1, -832
                  lbu          gp, -432(t4)
                  lb           s11, 21(t4)
                  sb           t1, -1508(t4) #end riscv_hazard_instr_stream_8
                  la           a5, region_1+1449 #start riscv_load_store_rand_instr_stream_9
                  sw           s0, 27(a5)
                  ori          t1, t6, -1232
                  sb           s7, -16(a5)
                  sw           a3, -61(a5)
                  c.or         a4, a1
                  sb           a3, -32(a5)
                  lw           t5, 55(a5)
                  c.addi4spn   a3, sp, 912
                  lbu          s4, -50(a5)
                  c.andi       s1, -1
                  lb           t0, -52(a5)
                  lbu          s6, -12(a5)
                  lbu          a7, 52(a5)
                  lb           t0, -22(a5)
                  mulhu        a7, a2, t1
                  lb           a1, -44(a5)
                  sra          t4, s10, t4
                  lb           a6, 61(a5)
                  lh           s1, 31(a5)
                  lh           t4, 61(a5)
                  auipc        t2, 793403
                  lb           s7, 8(a5)
                  c.srai       a4, 12
                  sb           s7, -22(a5)
                  and          s10, a7, a6
                  sb           a0, -10(a5)
                  sb           ra, -50(a5)
                  lhu          a6, -17(a5)
                  rem          gp, s10, ra
                  sb           s1, -34(a5) #end riscv_load_store_rand_instr_stream_9
                  la           s8, region_1+928 #start load_store_instr_stream_0
                  la           s6, region_0+964 #start load_store_instr_stream_1
                  sb           tp, 11(s8)
                  lhu          sp, -104(s6)
                  lbu          a3, -13(s8)
                  sb           s5, -7(s8)
                  lb           a1, -182(s6)
                  lh           a5, 8(s8)
                  lbu          t4, -9(s8)
                  lb           s9, -242(s6)
                  lbu          a2, 13(s8)
                  lbu          t4, -77(s6)
                  lb           s3, -9(s8)
                  lbu          t1, 77(s6)
                  sb           s11, 79(s6)
                  sw           a7, -224(s6)
                  lb           t0, -12(s8)
                  sh           tp, -126(s6) #end load_store_instr_stream_1
                  lb           t6, 8(s8) #end load_store_instr_stream_0
                  la           t5, region_0+1592 #start riscv_hazard_instr_stream_4
                  div          a2, s10, s10
                  lbu          s4, -1502(t5)
                  lhu          s10, -1454(t5)
                  srai         a3, s10, 12
                  mulhu        s7, s7, a3
                  and          a3, s7, a2
                  sub          a2, s7, a5
                  xor          a3, s7, a5
                  c.lui        s10, 17
                  remu         s7, a2, a3
                  c.or         a2, a2
                  sb           s10, -1018(t5)
                  srai         s10, s4, 17
                  srli         s10, a3, 21
                  xori         a3, a5, -457
                  sb           s4, 263(t5)
                  lb           a2, 107(t5)
                  lbu          s10, 148(t5)
                  div          a2, s7, s10
                  lh           a3, -822(t5)
                  c.nop
                  lh           a2, -1384(t5)
                  lhu          a2, -798(t5)
                  slli         s4, a5, 4
                  mul          s4, s10, a3
                  lbu          s7, -339(t5)
                  srai         a3, a5, 28
                  lbu          s7, -162(t5)
                  mul          s4, s10, a5
                  and          a2, a5, a5
                  mulhu        s4, s7, s4
                  or           s10, s4, s7
                  lhu          s4, -1394(t5)
                  lb           a2, -1290(t5)
                  c.xor        a3, a2
                  c.li         a3, -1
                  sw           s10, -1496(t5)
                  srl          s10, s7, a2
                  sll          s4, a2, a3
                  lb           a5, -250(t5)
                  lbu          a3, -373(t5)
                  sb           a5, -1115(t5)
                  sw           s10, -264(t5) #end riscv_hazard_instr_stream_4
                  la           t5, region_1+1742 #start load_store_instr_stream_3
                  la           t3, region_1+70 #start load_store_instr_stream_0
                  la           s6, region_1+257 #start load_store_instr_stream_2
                  sb           t0, -802(t5)
                  la           s8, region_1+1883 #start load_store_instr_stream_1
                  sh           tp, 126(t3)
                  la           s9, region_1+905 #start load_store_instr_stream_4
                  lb           s1, -61(s8)
                  lb           a6, 184(s6)
                  lbu          s3, 131(s6)
                  lb           zero, 211(t3)
                  lb           a7, -1186(t5)
                  lbu          a7, 183(t3)
                  sh           s5, 63(s6)
                  sw           s5, -650(t5)
                  sb           ra, -10(s8)
                  sw           s11, -33(s9)
                  sh           a4, 118(t3)
                  sh           s7, -6(t5)
                  lbu          t0, -54(s8)
                  sb           s8, -47(t3)
                  sb           t6, 53(s9)
                  sb           s7, 183(t3)
                  lbu          a1, 155(t5)
                  lb           t2, 70(s6)
                  lb           a7, -1220(t5)
                  lhu          a2, 17(s8)
                  lb           t0, 53(s9)
                  lhu          a7, 203(s6)
                  sb           zero, -60(t3)
                  sh           s5, -5(s6)
                  sb           sp, 198(s6)
                  lb           a4, 160(t3)
                  lhu          s7, -11(s6)
                  lbu          s11, 8(s8)
                  lbu          t0, 80(t3)
                  lh           s4, -1448(t5)
                  sh           t0, -255(s6)
                  lh           a7, 3(s9)
                  lbu          a5, -60(s9)
                  lw           a1, 166(t5)
                  lbu          a3, 139(t5) #end load_store_instr_stream_3
                  sb           t0, 58(s9)
                  lh           t6, -61(s9) #end load_store_instr_stream_4
                  lbu          s7, 58(s8) #end load_store_instr_stream_1
                  lbu          a3, -244(s6) #end load_store_instr_stream_2
                  lw           ra, 110(t3) #end load_store_instr_stream_0
                  addi         a2, zero, 6 #init loop 0 counter
                  addi         a1, zero, -12 #init loop 0 limit
sub_3_54_0_t:     c.li         a3, 21
                  c.andi       a5, 18
                  addi         a2, a2, -6 #update loop 0 counter
                  c.xor        a3, a4
                  beq          a2, a1, sub_3_54_0_t #branch for loop 0
                  sltu         sp, s6, tp
                  la           s8, region_0+366 #start load_store_instr_stream_2
                  la           a4, region_0+1480 #start load_store_instr_stream_1
                  la           t3, region_0+1990 #start load_store_instr_stream_0
                  sh           a1, 8(s8)
                  lbu          s10, 41(a4)
                  lbu          a7, -758(t3)
                  lb           s6, -401(a4)
                  lhu          s9, -12(s8)
                  sb           s9, -8(s8)
                  la           a3, region_0+717 #start load_store_instr_stream_4
                  sb           t4, -739(t3)
                  lbu          sp, -20(a3)
                  lb           t5, 58(a4)
                  lbu          t2, -8(a3)
                  lbu          s6, 1(s8)
                  lh           t6, -1558(t3)
                  lb           s9, -53(a3)
                  lb           t0, 42(a3)
                  lbu          s6, 4(s8)
                  lb           a7, -34(a3)
                  lb           tp, -1293(t3)
                  la           s1, region_0+1414 #start load_store_instr_stream_3
                  lbu          t4, 1(s8)
                  lb           zero, -38(a3)
                  lh           gp, -696(t3)
                  lbu          s4, -6(s1)
                  lbu          zero, -145(a4)
                  sb           s10, -15(s1)
                  lhu          s11, 63(a3)
                  lbu          a7, -16(s8)
                  lh           t1, -27(a3)
                  lh           s0, 4(s1)
                  sb           s8, -406(t3)
                  lhu          t0, -15(a3)
                  lbu          t0, -9(s8) #end load_store_instr_stream_2
                  lb           t5, -1910(t3)
                  lbu          a7, -883(a4)
                  lbu          t0, 1(s1)
                  sb           a7, 44(a3) #end load_store_instr_stream_4
                  lb           a1, -207(a4)
                  lbu          t6, 5(s1)
                  lbu          t2, -587(a4)
                  sb           a1, -875(t3)
                  lh           s4, 8(s1) #end load_store_instr_stream_3
                  lb           s6, -806(a4) #end load_store_instr_stream_1
                  lb           s7, -879(t3) #end load_store_instr_stream_0
                  la           sp, region_1+381 #start riscv_load_store_hazard_instr_stream_5
                  lh           t1, 1(sp)
                  lui          s7, 980278
                  sb           a6, 1(sp)
                  lbu          a7, 1(sp)
                  lb           s3, 1(sp)
                  lh           t5, 1(sp)
                  lhu          s9, 1(sp)
                  sh           s0, 1(sp)
                  lbu          gp, 1(sp)
                  lb           t2, 1(sp)
                  sh           s0, 1(sp)
                  lbu          gp, 1(sp)
                  lb           ra, 1(sp)
                  lh           tp, 1(sp)
                  lhu          t1, 1(sp)
                  lbu          s11, 1(sp)
                  lhu          ra, 1(sp)
                  sh           s7, 1(sp)
                  lhu          a6, 1(sp) #end riscv_load_store_hazard_instr_stream_5
                  la           s0, region_0+921 #start riscv_hazard_instr_stream_6
                  or           s1, s7, a6
                  divu         s7, s1, zero
                  addi         a7, a6, -1147
                  sb           zero, 147(s0)
                  c.srli       a3, 2
                  slt          s1, a6, zero
                  mulhu        s7, a3, zero
                  mulhsu       a3, zero, zero
                  lbu          a7, -250(s0)
                  rem          s1, a6, s7
                  andi         a6, zero, 1767
                  lb           a6, -86(s0)
                  mulhu        s1, a6, s1
                  sb           zero, -14(s0)
                  divu         a7, a3, zero
                  sh           s1, -103(s0)
                  lbu          a6, 146(s0)
                  sra          s7, a3, a3
                  divu         a6, a3, zero
                  sll          s7, a3, s1
                  c.and        a3, a3
                  c.xor        a3, a3
                  nop
                  lhu          zero, -207(s0)
                  xor          a6, s1, a3
                  lb           a3, 86(s0)
                  nop
                  c.and        a3, s1
                  lbu          a3, -212(s0)
                  sll          s7, s1, a6
                  lbu          s1, -252(s0)
                  c.lui        a7, 30
                  sub          zero, a6, s7
                  lbu          s7, 126(s0) #end riscv_hazard_instr_stream_6
sub_3_19:         jal          t3, 7f
0:                c.j          2f
1:                c.j          11f
2:                c.j          6f
3:                c.j          12f
4:                jal          t1, 10f
5:                c.j          13f
6:                c.j          14f
7:                jal          ra, 4b
8:                c.jal        5b
9:                c.j          0b
10:               jal          ra, 1b
11:               c.j          3b
12:               jal          ra, 8b
13:               c.jal        9b
14:               addi         s3, t1, 1015
                  la           t0, amo_0+52 #start riscv_amo_instr_stream_6
                  amoand.w.aq   s1, t2, (t0)
                  c.nop
                  amomaxu.w.rl  s8, s3, (t0)
                  amomin.w.aq   a3, tp, (t0) #end riscv_amo_instr_stream_6
                  addi         tp, zero, 5 #init loop 0 counter
                  c.lui        gp, 18
                  sra          t6, t0, zero
                  slli         t1, a1, 7
                  c.addi4spn   a5, sp, 496
                  xor          a4, s1, s0
                  srli         gp, s10, 5
                  c.addi       t3, 3
                  c.add        t5, gp
                  addi         t0, zero, 19 #init loop 0 limit
sub_3_59_0_t:     nop
                  c.and        a2, s1
                  srai         t5, a3, 30
                  addi         tp, tp, 2 #update loop 0 counter
                  lui          ra, 259832
                  rem          gp, a7, t6
                  c.addi4spn   s0, sp, 384
                  c.add        sp, s0
                  mulhu        sp, s9, s8
                  lui          a1, 921366
                  srai         s10, t5, 14
                  mul          t6, s11, ra
                  mul          s3, s4, zero
                  addi         t6, a5, 1141
                  c.li         t1, -1
                  bltu         tp, t0, sub_3_59_0_t #branch for loop 0
                  remu         s7, a2, a6
                  la           s1, amo_0+8 #start riscv_lr_sc_instr_stream_5
                  c.add        t6, s1
                  lr.w.rl       t3, (s1)
                  c.addi       s6, 28
                  c.mv         s11, t4
                  c.addi4spn   a2, sp, 992
                  srli         gp, s4, 20
                  c.and        a1, a2
                  c.sub        a4, a5
                  c.sub        a3, a4
                  c.and        a1, a4
                  c.addi4spn   a4, sp, 80
                  auipc        s3, 937615
                  c.nop
                  andi         sp, t2, 932
                  c.addi       t5, -1
                  c.lui        a5, 2
                  sc.w.rl       s6, gp, (s1) #end riscv_lr_sc_instr_stream_5
sub_3_24:         jal          t3, 15f
0:                c.j          23f
1:                jal          t0, 2f
2:                jal          ra, 13f
3:                c.jal        8f
4:                jal          ra, 18f
5:                c.jal        17f
6:                c.jal        24f
7:                c.j          0b
8:                jal          ra, 21f
9:                c.j          11f
10:               c.j          7b
11:               jal          t1, 25f
12:               c.jal        5b
13:               c.jal        19f
14:               c.j          10b
15:               jal          t1, 3b
16:               jal          t1, 20f
17:               jal          ra, 16b
18:               c.j          28f
19:               jal          ra, 9b
20:               c.j          29f
21:               c.j          14b
22:               jal          ra, 4b
23:               c.j          27f
24:               c.j          12b
25:               jal          a1, 26f
26:               c.j          30f
27:               c.jal        6b
28:               jal          t1, 1b
29:               c.jal        22b
30:               rem          s6, s2, ra
                  la           a2, region_0+904 #start riscv_hazard_instr_stream_1
                  mulh         sp, t6, a3
                  sb           a3, 3(a2)
                  lbu          sp, -9(a2)
                  lb           sp, -3(a2)
                  c.srai       a3, 3
                  slt          t6, a1, s6
                  c.slli       sp, 28
                  c.slli       t6, 2
                  c.xor        a3, a3
                  lbu          t1, 1(a2)
                  lb           sp, 12(a2)
                  sh           sp, -16(a2)
                  slli         sp, sp, 18
                  c.srli       a1, 15
                  c.mv         a1, t6
                  sb           t6, -13(a2)
                  lb           sp, -7(a2)
                  c.li         t1, 3
                  xor          a3, sp, a1
                  sra          a1, s6, a3
                  sra          t6, sp, sp
                  lh           a1, -4(a2)
                  lbu          t6, 7(a2)
                  lw           s6, -12(a2)
                  c.addi16sp   sp, -16
                  c.srli       a3, 2
                  slti         t1, t1, 486
                  sw           a3, -8(a2)
                  lui          a1, 86159
                  c.srai       a1, 5
                  c.sub        a1, a3
                  lbu          a1, 9(a2)
                  remu         sp, a1, t6
                  c.slli       t6, 8
                  lh           s6, 2(a2)
                  sb           a1, -7(a2)
                  sb           sp, 7(a2)
                  c.or         a1, a1
                  lbu          a3, 16(a2)
                  lbu          a3, -2(a2)
                  lbu          sp, 5(a2)
                  addi         s6, a3, -521
                  sb           a3, 3(a2)
                  lh           a1, 4(a2)
                  mulh         t6, t1, t1
                  auipc        t6, 678256
                  lhu          a3, 2(a2)
                  lhu          t1, -6(a2)
                  c.li         t1, -1
                  lbu          a3, 6(a2)
                  c.andi       a3, 15
                  lhu          a1, 10(a2) #end riscv_hazard_instr_stream_1
                  la           a7, region_0+1597 #start load_store_instr_stream_0
                  la           t3, region_0+1771 #start load_store_instr_stream_1
                  lbu          s8, -14(t3)
                  lh           s7, -3(a7)
                  lbu          a3, 4(a7)
                  lb           t6, 4(t3)
                  lb           a1, -15(a7)
                  lw           ra, -13(a7)
                  lb           sp, -10(t3)
                  sb           a1, 10(a7)
                  lb           zero, -1(t3)
                  sb           s0, 14(t3)
                  sb           gp, -16(a7)
                  lbu          s0, 4(t3) #end load_store_instr_stream_1
                  sb           s6, -16(a7) #end load_store_instr_stream_0
                  la           t3, region_1+1506 #start load_store_instr_stream_1
                  la           gp, region_1+507 #start load_store_instr_stream_0
                  lh           t2, -6(t3)
                  lh           t5, 16(t3)
                  lb           s6, 24(gp)
                  lb           s7, -49(gp)
                  lh           s1, 2(t3)
                  lb           t2, -4(t3)
                  lb           a7, 20(gp)
                  lb           t5, 16(gp)
                  lh           a5, 0(t3)
                  lb           t6, -2(t3) #end load_store_instr_stream_1
                  lb           s11, -7(gp)
                  lbu          s11, 23(gp)
                  sb           s10, 10(gp)
                  sb           s8, 21(gp)
                  lbu          t0, -31(gp)
                  lh           s8, -39(gp) #end load_store_instr_stream_0
                  la           t3, region_0+294 #start riscv_hazard_instr_stream_5
                  c.mv         a2, a2
                  lbu          t4, 1(t3)
                  lb           t6, 8(t3)
                  srl          t4, a6, t4
                  xor          t6, gp, a2
                  slt          t6, gp, a6
                  div          ra, ra, a2
                  mulh         t6, a6, gp
                  lbu          gp, 13(t3)
                  lb           ra, -8(t3)
                  lh           t6, -16(t3)
                  c.srai       a2, 19
                  lb           ra, 13(t3)
                  lb           ra, 1(t3)
                  c.nop
                  sb           a2, 16(t3)
                  c.srai       a2, 12
                  slti         a2, ra, 524
                  lb           gp, -3(t3)
                  sltu         ra, t4, t6
                  auipc        ra, 939432
                  sltiu        a2, t6, -651
                  c.add        gp, gp
                  lb           t6, -14(t3)
                  sb           a6, -7(t3)
                  xor          t4, t4, ra
                  sb           a6, -15(t3)
                  c.li         a2, -1
                  lbu          t4, -2(t3)
                  c.sub        a2, a2
                  sh           a6, 2(t3)
                  lhu          a2, 2(t3)
                  sltiu        t6, a6, -949
                  slt          ra, gp, t4
                  sw           ra, -14(t3)
                  mul          gp, t6, gp
                  sb           t4, -3(t3)
                  sb           t6, -9(t3) #end riscv_hazard_instr_stream_5
                  la           t4, region_0+376 #start load_store_instr_stream_1
                  la           a6, region_1+720 #start load_store_instr_stream_0
                  lh           t2, -62(a6)
                  lb           a3, -579(a6)
                  sb           s1, 57(t4)
                  lh           gp, 56(t4)
                  lbu          gp, 22(t4)
                  lb           t2, 623(a6)
                  sb           t0, 12(t4)
                  sh           ra, -50(t4)
                  sb           s9, -62(t4)
                  lbu          s7, 3(t4)
                  sw           t0, 192(a6)
                  lb           sp, -17(t4)
                  lbu          ra, 9(t4) #end load_store_instr_stream_1
                  sb           s5, -187(a6)
                  lbu          a5, 1063(a6) #end load_store_instr_stream_0
                  la           t6, region_0+1335 #start load_store_instr_stream_0
                  sb           a5, 8(t6)
                  la           s10, region_1+1631 #start load_store_instr_stream_1
                  sb           s2, 2(s10)
                  lbu          a2, 0(s10)
                  lb           t2, -8(s10)
                  sb           s10, 2(s10)
                  lbu          s4, -9(t6)
                  lb           a6, 14(s10)
                  sw           s0, 13(t6)
                  lb           s1, -6(s10)
                  sb           s1, -15(s10)
                  lb           a7, 6(s10)
                  sb           ra, 7(t6)
                  lbu          s9, 0(t6)
                  lb           t5, -14(s10)
                  lhu          a4, 13(s10) #end load_store_instr_stream_1
                  lbu          t5, -5(t6) #end load_store_instr_stream_0
                  la           sp, region_1+359 #start riscv_load_store_hazard_instr_stream_9
                  andi         s9, t1, 378
                  lbu          t2, 4(sp)
                  sb           t4, 8(sp)
                  lbu          t6, 8(sp)
                  slti         a1, s10, -1220
                  lb           s7, -10(sp)
                  lb           s10, -10(sp)
                  srl          s6, s6, a2
                  lbu          s0, 13(sp)
                  sh           a6, 13(sp)
                  lb           t3, 13(sp)
                  sb           s10, 13(sp)
                  c.nop
                  divu         s8, s10, s5
                  sh           s1, 13(sp) #end riscv_load_store_hazard_instr_stream_9
                  la           s9, amo_0+8 #start riscv_amo_instr_stream_3
                  la           a4, amo_0+28
                  la           a5, amo_0+40
                  amoand.w.rl   t2, a2, (a5)
                  amomin.w.aq   gp, t6, (a5)
                  amoor.w.rl    ra, a4, (s9)
                  amoswap.w.rl  a6, sp, (a5)
                  amoor.w.rl    s4, t0, (a4)
                  amoadd.w      a2, t1, (s9)
                  amoxor.w.aq   s4, t3, (a4)
                  auipc        ra, 164658
                  amominu.w.rl  t6, s10, (a4)
                  amoadd.w      t1, s6, (s9) #end riscv_amo_instr_stream_3
sub_3_29:         jal          t3, 3f
0:                c.j          5f
1:                c.j          0b
2:                c.j          1b
3:                c.jal        4f
4:                c.j          8f
5:                jal          a3, 6f
6:                c.j          9f
7:                jal          t1, 10f
8:                c.j          2b
9:                jal          t1, 7b
10:               c.addi16sp   sp, 48
                  la           sp, region_0+1752 #start riscv_hazard_instr_stream_7
                  lui          a4, 63839
                  addi         t6, t6, 699
                  c.srai       a4, 24
                  sb           s6, 9(sp)
                  add          s6, t6, t3
                  rem          a4, s6, t3
                  sb           t6, 6(sp)
                  c.srai       a4, 24
                  and          gp, gp, s6
                  c.li         a4, 8
                  lb           tp, 5(sp)
                  ori          s6, s6, 310
                  srai         t3, tp, 3
                  remu         a4, a4, t6
                  lh           a4, -10(sp)
                  mulh         t3, s6, tp
                  add          a4, t6, t3
                  ori          a4, tp, -1953
                  lb           t3, 11(sp)
                  lbu          s6, -8(sp)
                  lbu          t3, -4(sp)
                  sltiu        t6, s6, -592
                  mul          tp, tp, t3
                  lbu          gp, 3(sp)
                  nop
                  srai         tp, s6, 1
                  c.andi       a4, -1
                  c.add        t3, tp
                  sb           tp, -11(sp)
                  add          t6, t6, gp
                  lh           s6, -14(sp)
                  remu         gp, t6, a4
                  div          tp, t6, tp
                  c.slli       gp, 28
                  sltu         a4, a4, t3
                  sb           s6, -7(sp) #end riscv_hazard_instr_stream_7
                  la           a2, region_1+257 #start riscv_hazard_instr_stream_0
                  lbu          s7, 4(a2)
                  lhu          s7, 1321(a2)
                  nop
                  sb           s7, -6(a2)
                  sltu         t3, s3, t3
                  lhu          a6, 941(a2)
                  sb           s7, 357(a2)
                  sub          s6, s7, s7
                  slli         a3, s7, 25
                  c.li         s6, -1
                  lb           t3, 316(a2)
                  nop
                  c.li         s6, 26
                  rem          a6, t3, s7
                  srl          s7, s7, s6
                  c.li         a6, -1
                  lb           s6, 34(a2)
                  c.addi       t3, -1
                  c.sub        a3, a3
                  addi         s6, s6, 1371
                  lbu          a3, 1305(a2)
                  ori          s3, s6, -1253
                  lb           s3, 960(a2)
                  mulh         s7, s6, s6
                  lb           t3, 1696(a2)
                  ori          s3, s7, 634
                  sltu         s3, s7, s6
                  lbu          a3, -172(a2)
                  and          s3, s3, s6
                  c.mv         s7, s6
                  ori          s7, t3, 38
                  c.srai       a3, 19
                  sb           a6, 1255(a2)
                  sb           s6, 613(a2)
                  lbu          s7, 1638(a2)
                  c.lui        a3, 1
                  srai         a3, t3, 7
                  c.srli       a3, 30
                  srai         a3, t3, 4
                  lw           s6, 263(a2)
                  c.and        a3, a3
                  c.or         a3, a3
                  lbu          a3, 1038(a2)
                  lbu          s7, -68(a2)
                  lw           s6, 231(a2)
                  xor          s6, t3, s7
                  lbu          a6, 1211(a2)
                  lbu          a6, 372(a2)
                  lb           t3, 129(a2) #end riscv_hazard_instr_stream_0
                  addi         a3, zero, 10 #init loop 0 counter
                  c.srai       a4, 15
                  c.addi4spn   a5, sp, 112
                  nop
                  divu         t4, s8, t4
                  c.and        a5, a5
                  addi         zero, zero, 0 #init loop 0 limit
                  add          tp, a3, a1
sub_3_52_0_t:     c.addi       s0, -1
                  c.or         a5, a4
                  sll          s6, s5, s0
                  addi         a3, a3, -5 #update loop 0 counter
                  nop
                  c.bnez       a3, sub_3_52_0_t #branch for loop 0
                  addi         a4, s11, 200
                  la           a6, region_1+490 #start load_store_instr_stream_1
                  la           s1, region_1+825 #start load_store_instr_stream_2
                  sb           t2, 261(s1)
                  la           t5, region_1+494 #start load_store_instr_stream_3
                  la           s10, region_1+1732 #start load_store_instr_stream_4
                  la           s8, region_1+631 #start load_store_instr_stream_0
                  lbu          t3, -16(a6)
                  sh           a4, -2(t5)
                  sb           s1, 232(s1)
                  lw           t4, -35(s8)
                  lh           s4, -475(s1)
                  sb           a6, -47(a6)
                  lb           zero, -587(s10)
                  lbu          a3, 121(t5)
                  lb           t2, 808(s1)
                  lbu          s6, 523(s1)
                  lbu          tp, -1479(s10)
                  lbu          gp, 63(s1)
                  sb           s4, -389(s1)
                  lw           a7, 5(s8)
                  sh           a2, 50(a6)
                  sh           a7, -45(s8)
                  sw           t1, 250(t5)
                  lbu          tp, 5(a6)
                  lbu          a3, -18(s8)
                  lb           a3, -1(a6)
                  sb           a2, 193(t5)
                  sb           t0, 43(s10)
                  sw           a4, -553(s1)
                  sb           t3, 206(t5)
                  sb           t3, -595(s10)
                  lbu          t1, 180(t5)
                  lw           s0, 49(s8)
                  lb           tp, -48(s10)
                  sh           a6, -640(s10)
                  lhu          t1, 144(t5)
                  lb           a2, 228(s10)
                  sb           a7, 8(a6)
                  sw           s10, -385(s1)
                  lbu          s9, -209(s10) #end load_store_instr_stream_4
                  sb           a4, 84(t5)
                  lh           s7, 40(a6) #end load_store_instr_stream_1
                  sb           s1, -588(s1) #end load_store_instr_stream_2
                  sh           t3, 96(t5)
                  sb           s10, -13(t5) #end load_store_instr_stream_3
                  lbu          t6, 52(s8) #end load_store_instr_stream_0
                  la           t4, region_1+430 #start riscv_load_store_hazard_instr_stream_0
                  lbu          a2, -25(t4)
                  lb           ra, -25(t4)
                  lbu          a5, -25(t4)
                  sb           zero, -25(t4)
                  sb           t5, -25(t4)
                  c.sub        a5, a0
                  sb           s0, -25(t4)
                  lb           s8, -25(t4)
                  sb           t2, -25(t4)
                  lbu          s6, -25(t4)
                  lb           t6, -25(t4)
                  lb           s0, -25(t4)
                  sb           a5, -25(t4)
                  lbu          a4, -25(t4)
                  divu         s1, a5, s7
                  sb           t1, -25(t4)
                  lb           a2, -25(t4)
                  sb           a3, -25(t4)
                  lb           a2, -25(t4)
                  lb           s0, -25(t4) #end riscv_load_store_hazard_instr_stream_0
                  la           s0, region_0+1023 #start load_store_instr_stream_2
                  la           s7, region_0+1438 #start load_store_instr_stream_1
                  sb           s5, 15(s0)
                  la           a6, region_0+186 #start load_store_instr_stream_0
                  sb           s8, -8(s0)
                  lbu          s4, -1333(s7)
                  lhu          gp, 1538(a6)
                  lh           t6, -220(s7)
                  lb           s1, -4(s0)
                  lbu          t2, -1099(s7)
                  sb           s3, -151(a6)
                  sb           t5, 14(s0)
                  lbu          zero, -14(s0)
                  sb           a6, -567(s7)
                  sb           sp, -14(s0)
                  sh           s3, -1398(s7) #end load_store_instr_stream_1
                  sb           a4, 13(s0)
                  lbu          ra, 11(s0)
                  lb           s4, 204(a6)
                  lbu          a3, 3(s0)
                  sh           a7, 966(a6)
                  lb           t2, -10(s0) #end load_store_instr_stream_2
                  lh           t5, 274(a6)
                  lb           a7, 129(a6)
                  lh           tp, 58(a6) #end load_store_instr_stream_0
                  addi         a4, zero, -10 #init loop 0 counter
                  c.addi4spn   s0, sp, 288
                  c.slli       s8, 18
                  mulh         s11, a3, s5
                  addi         zero, zero, 0 #init loop 0 limit
                  sll          s11, tp, t5
sub_3_57_0_t:     c.andi       a3, -1
                  sltiu        s1, t4, -319
                  c.addi4spn   s1, sp, 208
                  addi         a4, a4, 2 #update loop 0 counter
                  auipc        tp, 668497
                  c.li         s7, 31
                  mulhsu       ra, a4, gp
                  c.mv         a2, a0
                  c.bnez       a4, sub_3_57_0_t #branch for loop 0
                  and          a5, t2, s4
                  la           t4, region_1+1603 #start load_store_instr_stream_1
                  la           a2, region_0+1520 #start load_store_instr_stream_0
                  lw           s11, 153(t4)
                  sh           s0, -175(t4)
                  sh           s3, -206(a2)
                  lhu          t6, 170(a2)
                  lb           s1, -148(t4)
                  sb           a3, 219(a2)
                  sh           a1, -7(t4)
                  lb           s6, 39(t4)
                  sb           a2, -242(a2)
                  sh           s8, 0(a2)
                  lh           s6, -57(t4) #end load_store_instr_stream_1
                  lhu          s7, 64(a2) #end load_store_instr_stream_0
                  la           a5, region_1+1547 #start load_store_instr_stream_0
                  la           a4, region_1+1750 #start load_store_instr_stream_1
                  la           a7, region_1+1919 #start load_store_instr_stream_2
                  lbu          ra, 14(a5)
                  lbu          s11, -57(a4)
                  lw           a1, 9(a5)
                  lbu          gp, 15(a4)
                  lbu          t2, 39(a4)
                  lbu          a3, -125(a7)
                  lw           s7, 38(a4)
                  lw           t0, -15(a5)
                  sb           s6, 7(a4)
                  sb           s8, -244(a7)
                  lbu          s10, 0(a5)
                  sb           s0, 20(a4)
                  lh           s0, 13(a5)
                  sb           t6, 4(a5)
                  sh           s4, -10(a4)
                  lbu          t0, -246(a7)
                  lbu          s9, 11(a4)
                  sb           sp, -40(a7)
                  lhu          tp, -55(a7)
                  lbu          s1, -201(a7)
                  sb           t1, -239(a7)
                  sw           s11, -11(a5)
                  sb           a3, 0(a4)
                  lb           s3, -100(a7)
                  sb           s7, 5(a5)
                  lbu          t0, -180(a7) #end load_store_instr_stream_2
                  lbu          s7, 53(a4) #end load_store_instr_stream_1
                  sb           s10, -14(a5) #end load_store_instr_stream_0
                  la           sp, region_0+997 #start riscv_load_store_hazard_instr_stream_4
                  lh           a3, 487(sp)
                  lbu          a6, 566(sp)
                  lb           gp, -499(sp)
                  xori         a3, s11, -1334
                  lbu          s10, 193(sp)
                  sb           t2, 193(sp)
                  lbu          t2, 434(sp)
                  lbu          t5, 363(sp)
                  lbu          a4, 363(sp)
                  c.xor        a5, a3
                  lb           s11, -561(sp)
                  sh           ra, -561(sp)
                  lbu          s3, -561(sp)
                  lbu          s10, 690(sp)
                  c.add        a2, a6
                  sll          t4, t2, t2
                  mul          a1, s1, s5
                  lb           a5, -52(sp) #end riscv_load_store_hazard_instr_stream_4
sub_3_26:         jal          t3, 23f
0:                c.j          17f
1:                c.jal        16f
2:                c.j          7f
3:                jal          t1, 14f
4:                c.j          20f
5:                jal          ra, 24f
6:                c.jal        1b
7:                c.j          12f
8:                c.jal        21f
9:                c.jal        10f
10:               c.j          15f
11:               c.jal        6b
12:               c.jal        4b
13:               c.j          18f
14:               jal          t1, 11b
15:               jal          ra, 19f
16:               jal          t1, 9b
17:               jal          gp, 8b
18:               c.jal        3b
19:               jal          s3, 0b
20:               c.jal        13b
21:               c.j          5b
22:               c.jal        2b
23:               c.j          22b
24:               andi         s6, t3, 134
                  la           s10, amo_0+36 #start riscv_lr_sc_instr_stream_3
                  divu         sp, s5, s7
                  mulhsu       s11, s6, s1
                  c.addi       a1, -1
                  sltiu        a5, a2, 93
                  mulhu        t6, s8, ra
                  srl          s11, s11, t4
                  mulh         a4, s3, a5
                  or           a4, a2, s0
                  lr.w          a1, (s10)
                  ori          t0, s10, 1684
                  c.srai       s1, 16
                  sc.w.aq       tp, s11, (s10) #end riscv_lr_sc_instr_stream_3
sub_3_23:         jal          t3, 10f
0:                c.jal        11f
1:                c.jal        4f
2:                c.jal        3f
3:                c.j          12f
4:                jal          ra, 18f
5:                c.j          6f
6:                c.jal        8f
7:                jal          t1, 5b
8:                c.j          0b
9:                jal          t1, 15f
10:               c.jal        13f
11:               c.j          2b
12:               c.j          14f
13:               c.jal        7b
14:               c.j          9b
15:               c.j          17f
16:               c.j          1b
17:               c.jal        16b
18:               c.or         a2, a3
                  la           a6, region_0+1741 #start riscv_load_store_hazard_instr_stream_10
                  sb           t2, -119(a6)
                  lbu          s7, 230(a6)
                  sb           tp, 144(a6)
                  sb           a7, 144(a6)
                  lb           t0, -47(a6)
                  sh           zero, 21(a6)
                  mulhu        t0, a5, t4
                  lh           s3, -225(a6)
                  mulhsu       ra, s5, s5
                  lbu          t2, -225(a6)
                  lb           t1, -225(a6)
                  sh           a1, -133(a6)
                  lhu          t4, 225(a6)
                  c.addi4spn   s0, sp, 48
                  lbu          t0, 66(a6)
                  lbu          s0, 66(a6) #end riscv_load_store_hazard_instr_stream_10
sub_3_28:         jal          t3, 4f
0:                c.jal        18f
1:                c.jal        10f
2:                c.j          6f
3:                c.j          12f
4:                jal          ra, 14f
5:                c.j          22f
6:                jal          ra, 9f
7:                jal          ra, 1b
8:                c.j          0b
9:                c.j          15f
10:               c.j          21f
11:               jal          ra, 23f
12:               c.jal        8b
13:               c.j          3b
14:               jal          t1, 17f
15:               jal          t1, 19f
16:               c.jal        5b
17:               c.jal        16b
18:               c.j          2b
19:               jal          ra, 24f
20:               jal          t1, 11b
21:               c.j          20b
22:               c.jal        7b
23:               c.jal        13b
24:               c.nop
                  la           s11, amo_0+20 #start riscv_lr_sc_instr_stream_7
                  srai         s10, s2, 27
                  lr.w.aq       t5, (s11)
                  c.xor        a5, a4
                  sll          gp, ra, t1
                  srl          t6, s4, t3
                  c.nop
                  c.addi4spn   s0, sp, 80
                  c.srli       a1, 7
                  slti         a2, t6, -1611
                  mulh         zero, gp, s5
                  divu         s4, sp, s11
                  ori          s0, tp, 727
                  sc.w          s8, gp, (s11) #end riscv_lr_sc_instr_stream_7
                  la           gp, region_0+1287 #start riscv_hazard_instr_stream_10
                  c.mv         s7, s6
                  lb           s6, -2(gp)
                  andi         s10, s6, 110
                  sll          s6, s4, s4
                  c.xor        a3, a3
                  slti         a3, s6, 1763
                  lb           s4, -3(gp)
                  lhu          s4, 3(gp)
                  lw           s4, -15(gp)
                  lhu          s4, -3(gp)
                  lh           t2, 15(gp)
                  div          s7, s4, a3
                  ori          a3, t2, 2044
                  lbu          a3, -16(gp)
                  c.xor        a3, a3
                  lh           s4, 11(gp)
                  ori          s4, s10, 168
                  c.srli       a3, 21
                  c.add        s4, s7
                  lb           t2, 14(gp)
                  lb           s10, 11(gp)
                  sw           s7, -15(gp)
                  lw           t2, -15(gp)
                  sub          a3, s6, s10
                  sb           s10, -7(gp)
                  slti         s6, s10, -1028
                  srl          s4, t2, s7
                  c.nop
                  lh           s6, 9(gp)
                  c.slli       s10, 11
                  lhu          s10, -7(gp)
                  sll          s10, s10, t2
                  auipc        a3, 211482
                  lh           t2, 9(gp)
                  or           t2, a3, s6
                  c.or         a3, a3
                  c.add        s6, s7
                  c.srli       a3, 1
                  lbu          s4, -16(gp) #end riscv_hazard_instr_stream_10
                  la           s1, region_0+1503 #start load_store_instr_stream_1
                  la           s11, region_1+1201 #start load_store_instr_stream_0
                  lb           s9, -7(s1)
                  lb           a1, 6(s11)
                  lbu          s7, 16(s1)
                  lb           sp, -154(s11)
                  sb           sp, 0(s1)
                  sw           s5, -385(s11)
                  lbu          ra, -11(s1)
                  lbu          s4, -414(s11)
                  sh           a5, 3(s1)
                  lh           ra, -75(s11)
                  lb           s10, -15(s1)
                  lbu          s8, -6(s1)
                  sb           a1, -938(s11)
                  lbu          t5, -1(s1)
                  lhu          s10, -9(s1) #end load_store_instr_stream_1
                  lbu          s9, 498(s11) #end load_store_instr_stream_0
                  addi         a3, zero, 8 #init loop 0 counter
                  mulhu        s1, gp, zero
                  c.or         a1, a5
                  addi         zero, zero, 0 #init loop 0 limit
                  c.slli       s7, 7
sub_3_56_0_t:     add          s10, a3, t1
                  c.xor        s0, a1
                  addi         a3, a3, -8 #update loop 0 counter
                  mulhu        s1, s3, s1
                  sltiu        s0, t0, 1691
                  c.bnez       a3, sub_3_56_0_t #branch for loop 0
                  remu         a4, ra, a1
                  and          t4, t0, s8
                  ori          a6, a3, 34
                  c.xor        a5, a1
                  c.andi       a1, 11
                  beq          a2, s6, 8f
                  mulh         a3, s3, ra
                  and          s8, s7, a6
                  bltu         s5, a2, 8f
8:                c.sub        a5, a2
                  xor          gp, s5, a4
                  nop
                  remu         s10, s3, a0
                  c.bnez       a5, 20f
                  mul          t6, a1, s9
                  add          t2, gp, zero
                  ori          a3, t1, 1768
                  slli         t0, a6, 29
                  rem          t6, s11, a7
                  sltiu        t1, a0, -779
                  c.lui        t3, 12
20:               and          s1, t3, t2
                  c.and        a2, a1
                  srl          t6, a4, s8
                  c.addi       gp, 5
                  srl          t3, a5, ra
                  c.addi       s10, -1
                  bne          a6, tp, 36f
                  andi         s1, t1, -496
                  nop
                  slli         t6, a6, 31
                  srli         s10, tp, 23
                  remu         a3, a7, s3
                  rem          t0, s1, a2
                  and          a4, s2, s0
                  c.nop
                  srli         a3, s3, 23
36:               ori          t1, t1, 794
                  add          t3, zero, t0
                  c.srai       a5, 24
                  sltiu        s7, s11, 69
                  div          s0, sp, t3
                  sra          s9, s4, a2
                  addi         gp, s7, -353
                  slli         a4, t0, 7
                  c.addi16sp   sp, -16
                  c.lui        t3, 8
                  srl          t4, a6, a3
                  sltu         t0, a3, t3
                  div          a3, a6, a6
                  add          gp, t6, t4
                  nop
                  nop
                  mulh         tp, a0, gp
                  c.add        s11, t5
                  and          s3, t2, gp
                  c.li         a3, 28
                  c.addi4spn   a1, sp, 640
                  and          a7, s11, s6
                  slti         ra, a0, 868
                  c.and        a1, a4
                  bgeu         t2, t6, 63f
                  srli         s11, a5, 28
                  nop
63:               mulh         t4, a1, s10
                  c.mv         a7, t5
                  c.srli       a5, 2
                  mul          sp, t3, s9
                  sub          s7, ra, s8
                  c.slli       t1, 1
                  lui          a7, 695115
                  blt          sp, t2, 85f
                  bne          tp, t1, 79f
                  div          a4, t0, s0
                  c.sub        a2, a1
                  c.srli       s1, 20
                  divu         s7, s11, ra
                  bne          t0, a4, 91f
                  srli         gp, tp, 30
                  c.addi16sp   sp, -16
79:               rem          t3, s9, a3
                  lui          s10, 43718
                  addi         s11, s5, 574
                  c.addi4spn   a2, sp, 944
                  c.slli       s11, 3
                  sra          s4, s4, t1
85:               ori          s6, ra, 810
                  c.xor        a4, a3
                  c.xor        s1, s0
                  c.slli       s3, 6
                  c.bnez       s1, 102f
                  ori          t5, s9, -263
91:               bne          a4, s5, 95f
                  addi         a7, t0, -612
                  sll          sp, a0, a0
                  c.andi       s1, 17
95:               c.and        a3, a5
                  beq          s7, sp, 105f
                  slti         s8, a3, -1497
                  blt          t1, s0, 103f
                  bgeu         t5, zero, 107f
                  c.lui        ra, 6
                  c.addi4spn   a3, sp, 464
102:              sub          s1, a5, s11
103:              c.addi16sp   sp, -16
                  c.mv         a4, t6
105:              slti         s0, s4, 1800
                  srai         sp, s7, 22
107:              c.add        s7, s5
                  nop
                  c.lui        tp, 20
                  bgeu         a7, a5, 114f
                  c.addi16sp   sp, 320
                  c.lui        t5, 31
                  bge          s11, s10, 132f
114:              c.srai       a5, 31
                  c.andi       a3, -1
                  c.nop
                  mulhu        a5, s2, sp
                  c.addi       s8, 4
                  srli         s10, s10, 16
                  div          zero, a0, a4
                  mul          s6, s5, s8
                  sltiu        s11, s7, 152
                  c.slli       a4, 24
                  sltiu        t1, ra, -1125
                  srai         s4, t5, 25
                  add          t6, t3, t2
                  c.srli       s1, 27
                  xor          ra, s7, ra
                  sll          tp, a6, t5
                  divu         s4, t1, a7
                  c.addi16sp   sp, -16
132:              addi         ra, tp, 1653
                  c.and        s0, a1
                  sub          a4, s2, tp
                  or           s0, s1, t2
                  c.srai       a2, 29
                  bltu         zero, gp, 156f
                  c.li         a3, 25
                  c.srai       a4, 1
                  srli         t1, a2, 18
                  srai         s11, t2, 20
                  c.mv         s6, a4
                  bne          s6, s1, 144f
144:              sltu         s9, ra, t0
                  c.andi       s1, -1
                  mulhsu       s9, s10, a1
                  c.or         s0, a4
                  divu         a1, tp, a5
                  beq          t4, s7, 165f
                  c.lui        s7, 12
                  c.mv         tp, a2
                  c.nop
                  or           gp, a5, t3
                  mulhsu       s3, s11, a5
                  remu         s10, a3, a7
156:              nop
                  c.or         a4, s1
                  remu         s4, tp, t3
                  div          a3, ra, s1
                  xori         gp, s11, -28
                  and          t3, a6, t2
                  c.srai       a5, 8
                  la           t2, amo_0+16 #start riscv_lr_sc_instr_stream_2
                  rem          t0, a3, a3
                  srai         s7, s2, 4
                  slti         s8, s6, 1948
                  mul          t1, a0, s9
                  c.xor        a1, a5
                  c.addi       s6, 17
                  lr.w.rl       sp, (t2)
                  andi         a2, t4, 1767
                  xor          t0, a3, t4
                  nop
                  srai         s3, t1, 30
                  sc.w.rl       s6, a3, (t2) #end riscv_lr_sc_instr_stream_2
                  rem          t0, s7, t6
                  slt          tp, gp, s9
165:              c.addi4spn   a2, sp, 576
                  sltiu        a5, a7, 664
                  mulhu        s7, a6, t0
                  bne          s2, s0, 172f
                  lui          tp, 963419
                  c.li         s9, 16
                  mulhu        s9, s4, a4
172:              sltu         s8, t1, s9
                  c.srai       a5, 1
                  beq          s0, t0, 184f
                  rem          a5, s0, t1
                  xori         a1, s9, 1926
                  or           a2, s0, t0
                  c.or         a5, s1
                  c.add        t1, s0
                  c.addi16sp   sp, -16
                  c.nop
                  bgeu         s11, s6, 192f
                  c.or         s0, a2
184:              addi         a5, t2, -27
                  slt          a4, s1, a0
                  c.addi       t0, -1
                  lui          ra, 58183
                  sll          zero, s7, s4
                  ori          a5, t4, -1995
                  sub          a6, sp, a5
                  sll          gp, a4, t6
192:              c.srai       s1, 6
                  bge          s11, s9, 194f
194:              mul          s0, t4, a1
                  blt          t0, a3, 213f
                  sltiu        a5, s10, -816
                  c.xor        s0, a3
                  slli         t0, t3, 15
                  sll          a5, a3, t5
                  mulhu        s7, t2, s5
                  c.srai       s1, 7
                  div          sp, a0, t2
                  sra          a1, a5, t2
                  sltiu        a6, t4, -1591
                  or           t6, s3, t6
                  slli         tp, t3, 21
                  xor          s0, t4, s5
                  c.li         a1, 25
                  c.srli       s1, 28
                  divu         t4, a2, s10
                  sltiu        a4, t6, 246
                  blt          t6, s11, 229f
213:              c.mv         s7, s0
                  ori          tp, a2, -859
                  c.addi4spn   a3, sp, 64
                  mulhu        s8, t5, s7
                  srai         t5, a2, 11
                  mulhu        t1, s5, s4
                  srli         t3, s2, 22
                  and          t1, t3, s11
                  mulhu        tp, t2, a5
                  c.nop
                  c.and        a1, a5
                  remu         s0, t4, a7
                  mulh         zero, sp, s3
                  c.andi       a5, 1
                  slti         s8, s8, -606
                  mulh         t0, s1, t1
229:              and          a3, s3, a1
                  mul          a6, a7, s5
                  c.srli       a4, 2
                  bgeu         s10, zero, 241f
                  c.xor        a2, s1
                  srai         a3, a3, 30
                  c.addi       s8, 10
                  lui          s8, 205365
                  bne          s10, a2, 249f
                  bne          a4, s4, 255f
                  lui          t1, 704142
                  c.beqz       s0, 255f
241:              c.addi       s3, 23
                  beq          s4, a1, 243f
243:              addi         t3, s2, -2013
                  c.add        s8, a7
                  c.addi       s4, 8
                  c.addi4spn   s1, sp, 816
                  c.addi       tp, 8
                  and          s8, t5, sp
249:              mulhsu       a3, ra, a7
                  auipc        s10, 459667
                  bgeu         a1, s4, 260f
                  c.beqz       s1, 262f
                  c.or         s0, s0
                  andi         a1, zero, -933
255:              c.mv         s10, t3
                  mul          ra, s3, a1
                  c.li         a3, 12
                  nop
                  bne          s7, a4, 274f
260:              c.nop
                  c.srai       a4, 18
262:              blt          t6, tp, 266f
                  blt          s9, a1, 271f
                  slt          s9, s4, s8
                  nop
266:              andi         t1, gp, -674
                  bne          a6, ra, 286f
                  c.sub        a1, a1
                  addi         s10, a7, -720
                  c.addi16sp   sp, 496
271:              c.nop
                  c.addi16sp   sp, -16
                  remu         gp, t2, t5
274:              sub          s8, gp, t0
                  srli         a4, s5, 24
                  c.bnez       a2, 280f
                  sub          s1, s7, ra
                  c.add        s4, t4
                  blt          t1, s0, 298f
280:              or           a1, s0, gp
                  c.addi4spn   s1, sp, 576
                  bge          t3, t2, 300f
                  bgeu         a3, s11, 288f
                  mul          a5, s9, s7
                  c.xor        a4, a1
286:              sra          t0, gp, s7
                  or           t5, s11, t5
288:              c.or         a2, s1
                  bltu         a4, s10, 306f
                  slti         t0, t0, 297
                  sltu         t6, zero, t6
                  sltiu        gp, t2, 241
                  lui          zero, 67303
                  ori          a2, s3, -1857
                  slli         tp, t4, 8
                  c.srli       s1, 2
                  c.or         a4, a4
298:              slli         a7, t1, 3
                  andi         s11, a5, -1119
300:              beq          a1, a3, 313f
                  c.addi4spn   s0, sp, 240
                  la           t6, sub_4
                  c.add        t1, s11
                  addi         t6, t6, -185
                  mulh         t5, s6, s4
                  c.li         s0, 16
                  bltu         s2, t6, sub_3_j6 #branch to jump instr
                  ori          s9, gp, -1178
sub_3_j6:         jalr         t3, t6, 186 #jump sub_3 -> sub_4
                  mulh         s11, s6, s7
                  c.lui        s0, 14
                  srli         a1, s5, 4
                  c.nop
                  rem          a4, t1, s9
306:              c.srli       a2, 2
                  andi         t4, s7, 1124
                  c.mv         s3, a4
                  bne          s7, s2, 317f
                  mulh         s6, s6, s10
                  nop
                  bne          t1, t0, 322f
313:              mulhu        t4, s5, t0
                  srli         t3, s11, 1
                  c.addi       s7, -1
                  c.addi16sp   sp, 480
317:              andi         t3, t3, -556
                  c.lui        a2, 21
                  or           s9, t5, a2
                  add          s10, t4, tp
                  c.andi       a2, 30
322:              blt          sp, s6, 337f
                  c.beqz       a5, 333f
                  srl          t1, t1, s8
                  la           gp, region_0+634 #start load_store_instr_stream_1
                  lb           s7, -10(gp)
                  lbu          ra, -36(gp)
                  la           t4, region_1+646 #start load_store_instr_stream_0
                  sw           a3, -46(t4)
                  lb           a2, 1(t4)
                  sb           s5, 41(gp)
                  lhu          a1, 32(gp)
                  lbu          zero, 9(t4)
                  lh           s0, 38(gp)
                  lb           s6, -41(t4)
                  lbu          a6, 17(t4)
                  lbu          a1, 63(gp) #end load_store_instr_stream_1
                  lbu          a3, 30(t4)
                  lh           s11, 32(t4)
                  lbu          s10, 24(t4) #end load_store_instr_stream_0
                  auipc        s0, 443991
                  c.add        a5, a6
                  c.mv         s4, s8
                  c.andi       a2, 2
                  c.addi       s4, -1
                  sltu         gp, s9, a0
                  beq          t6, zero, 332f
332:              mul          a1, s4, a0
333:              sll          t1, a4, s8
                  c.andi       a3, -1
                  srai         s11, t2, 7
                  and          a5, a1, s1
337:              or           s1, s1, s2
                  c.srli       a1, 3
                  ori          s0, s5, -577
                  nop
                  mulhu        s7, a0, ra
                  c.slli       t0, 3
                  lui          sp, 1029557
                  c.sub        s1, a2
                  addi         s0, s11, 1680
                  ori          t3, s7, -1189
                  sltu         t0, s6, a5
                  sub          sp, a6, t3
                  c.lui        a5, 8
                  or           s10, t3, zero
                  c.lui        t6, 28
                  c.lui        t5, 28
                  nop
                  mulhu        t1, t0, a1
                  bgeu         s1, a3, 364f
                  xori         tp, s0, 1104
                  sll          a4, s9, a6
                  sub          s9, s8, a6
                  c.beqz       a3, 375f
                  c.srli       s1, 22
                  c.addi4spn   a2, sp, 624
                  sltu         s11, t4, a7
                  div          ra, ra, gp
364:              mulhsu       t0, a2, t2
                  c.addi16sp   sp, -16
                  div          gp, s0, s9
                  xori         a5, s2, -337
                  c.srai       a5, 7
                  c.beqz       s1, 370f
370:              c.srli       a1, 6
                  c.slli       s3, 14
                  c.srai       a3, 22
                  sra          a7, a7, a0
                  srai         gp, t3, 25
375:              mulhsu       a2, s9, s8
                  addi         t4, s7, -2002
                  c.sub        a3, s1
                  add          sp, t3, t4
                  sra          t6, t3, a3
                  c.mv         t0, sp
                  remu         t0, t2, a6
                  addi         s7, t1, 1124
                  c.and        s0, s0
                  ori          a2, a0, -239
                  lui          t1, 763982
                  c.mv         t6, t3
                  slt          s1, ra, gp
                  mulhsu       a3, s11, a1
                  nop
                  or           tp, t5, s2
                  rem          a3, s6, zero
                  rem          s8, s1, a6
                  c.addi16sp   sp, -16
                  c.nop
                  sub          s0, a1, a1
                  and          s4, a3, a6
                  bgeu         a4, s6, 414f
                  blt          t5, ra, 402f
                  xori         s8, s9, -43
                  sra          s10, t4, a1
                  divu         t4, t3, s10
402:              andi         s4, s4, -1415
                  c.srli       a4, 3
                  mul          a5, s2, a2
                  mulhsu       a7, t0, s8
                  sll          s3, s5, s8
                  auipc        a3, 875675
                  xori         a2, a7, 93
                  mulhu        t2, s3, t3
                  rem          a3, tp, t0
                  c.nop
                  divu         s6, a0, sp
                  c.add        a5, t2
414:              mulhu        a3, s7, a2
                  srl          t0, gp, zero
                  c.slli       a5, 16
                  andi         t4, s6, 1627
                  mulhu        sp, t1, s0
                  ori          s0, s5, 1321
                  slti         t3, a6, -157
                  sltu         sp, ra, t6
                  add          s3, s5, t4
                  sub          a2, t0, t6
                  auipc        s10, 549393
                  c.add        t0, a4
                  c.or         s1, a0
                  addi         s1, a5, -255
                  beq          t6, a6, 443f
                  c.mv         a1, a7
                  c.add        a3, tp
                  c.slli       t6, 3
                  sll          s9, s6, a3
                  c.andi       a2, 20
                  divu         t4, t0, t6
                  xori         s1, s9, -564
                  beq          t3, a5, 445f
                  c.srli       a4, 17
                  bge          a4, a0, 442f
                  c.bnez       a1, 451f
                  c.addi       s0, 22
                  srli         s9, s0, 15
442:              sll          s7, a4, gp
443:              add          s11, s7, ra
                  bltu         t2, s11, 445f
445:              bge          gp, s7, 446f
446:              c.andi       a1, -1
                  c.nop
                  bltu         s2, t4, 457f
                  add          s10, t6, s6
                  lui          a7, 861178
451:              ori          t4, s3, 1867
                  blt          a4, s0, 455f
                  c.li         s6, 24
                  sub          tp, a4, t6
455:              c.sub        s0, a5
                  sra          tp, a2, a7
457:              c.and        a5, a0
                  div          a6, s9, s9
                  c.add        t0, t6
                  bge          s2, t6, 468f
                  c.nop
                  srli         s3, a7, 8
                  bge          s4, s11, 478f
                  c.andi       a3, 13
                  bgeu         tp, a1, 466f
466:              sub          s0, t3, a0
                  mul          s1, t2, s0
468:              sltu         s10, t4, a0
                  sltu         s11, gp, s4
                  andi         s6, a1, -486
                  and          s7, t5, a0
                  la           t3, region_0+527 #start riscv_load_store_rand_instr_stream_10
                  c.andi       s1, -1
                  div          sp, s9, a0
                  sb           s0, 696(t3)
                  mulhu        zero, s6, s10
                  divu         t5, s7, s10
                  mulhsu       t5, t6, s5
                  c.or         a4, a4
                  lbu          gp, 1206(t3)
                  sb           a5, -294(t3)
                  rem          s7, t5, a5
                  sh           tp, -485(t3)
                  lbu          a6, 1257(t3)
                  mulhsu       s8, s0, a6
                  c.srai       a5, 2
                  auipc        t6, 524582
                  xor          s6, a3, a0
                  c.srai       s1, 16
                  slti         gp, tp, 1215
                  sb           t5, 1076(t3)
                  c.mv         a7, t5
                  c.li         s8, -1
                  and          s1, t2, s9
                  c.addi       s0, -1
                  sb           a0, 800(t3)
                  sh           t6, 155(t3)
                  sll          tp, tp, s1
                  mul          a5, s2, a6
                  mulhsu       zero, s11, a2
                  auipc        a1, 1020907
                  lb           ra, -304(t3)
                  lbu          a2, 714(t3)
                  lui          s8, 226733
                  addi         a2, t5, -1940
                  lbu          s8, -454(t3) #end riscv_load_store_rand_instr_stream_10
                  bne          s7, zero, 477f
                  add          s11, a7, a3
                  bgeu         a2, s11, 482f
                  slti         s10, a2, 758
                  c.sub        a5, a0
477:              mulhu        a2, t1, s3
478:              mulhu        a1, a2, a6
                  remu         t3, a3, a5
                  mulh         s1, a5, a2
                  rem          s7, ra, s2
482:              srl          sp, a2, s2
                  c.add        t6, a5
                  div          a5, t4, s7
                  slli         a5, s1, 27
                  bgeu         zero, a7, 505f
                  or           s9, t0, t1
                  rem          a3, s7, a4
                  bge          t1, a0, 498f
                  and          s3, zero, s3
                  xor          s3, a1, s1
                  c.or         a5, a2
                  c.xor        s1, s0
                  bne          a2, a5, 503f
                  srli         a2, t3, 5
                  ori          t3, s8, 1486
                  c.lui        t0, 3
498:              and          t2, t6, t0
                  c.beqz       s1, 515f
                  sltu         t2, a7, t5
                  srl          s1, s3, s7
                  c.beqz       a3, 519f
503:              remu         t2, t2, a0
                  remu         s4, t0, gp
505:              c.andi       s0, -1
                  nop
                  sltu         a1, s0, s9
                  remu         s8, gp, ra
                  c.nop
                  bne          a6, zero, 520f
                  bgeu         a4, t2, 515f
                  c.nop
                  c.srai       a5, 18
                  andi         s11, a4, 487
515:              or           a4, tp, t1
                  c.xor        a4, a0
                  sltu         s1, a3, a4
                  c.slli       ra, 10
519:              xor          ra, s3, t5
520:              mulhsu       gp, tp, a2
                  c.add        tp, s9
                  sub          a5, t4, s4
                  c.srai       a3, 21
                  c.li         a1, -1
                  c.andi       a4, 7
                  div          a1, t6, a5
                  sltu         s9, t1, s0
                  div          a6, s11, t1
                  lui          s1, 161026
                  c.addi16sp   sp, -16
                  srli         t1, gp, 16
                  rem          a6, s10, a6
                  and          a1, s8, s7
                  remu         s1, tp, sp
                  lui          s8, 252539
                  or           a2, s6, gp
                  c.bnez       s0, 549f
                  c.srai       s0, 1
                  mulhsu       tp, a6, s2
                  sltu         ra, s4, t3
                  and          a7, s5, s10
                  c.addi16sp   sp, -16
                  nop
                  remu         s9, t6, t2
                  bltu         a7, t6, 558f
                  c.addi       s10, -1
                  c.addi       s6, 16
                  auipc        s4, 951504
549:              c.beqz       a1, 550f
550:              divu         s11, t4, a4
                  bge          a4, s6, 555f
                  remu         s3, s1, a4
                  c.add        t3, s6
                  mulhu        s4, t3, a2
555:              c.lui        s6, 1
                  addi         s4, s7, 657
                  mulhsu       tp, a7, tp
558:              rem          gp, t4, a3
                  sltiu        s10, a3, 1939
                  sra          s9, zero, s10
                  sltu         zero, a6, s1
                  c.and        a2, s1
                  bgeu         s10, t2, 571f
                  ori          ra, a2, 1750
                  c.mv         s7, s4
                  bne          a1, s8, 570f
                  c.addi16sp   sp, 288
                  xori         tp, t6, -1779
                  c.srli       s1, 30
570:              bge          s4, a5, 580f
571:              bge          s5, t0, 572f
572:              divu         t4, a6, t3
                  auipc        tp, 581087
                  c.mv         t0, t6
                  c.bnez       s1, 584f
                  slli         s6, a2, 16
                  c.xor        a1, a1
                  mulhu        gp, ra, t0
                  divu         a7, s1, s11
580:              nop
                  srai         s10, sp, 21
                  xori         a7, s3, -587
                  bne          t6, s8, 598f
584:              slli         s6, a0, 2
                  bge          t4, tp, 586f
586:              c.beqz       a1, 594f
                  sra          a5, a7, s11
                  beq          s1, t2, 605f
                  c.andi       s0, 16
                  bgeu         s4, a0, 594f
                  c.addi4spn   a5, sp, 32
                  slt          ra, t6, t4
                  sll          s8, s4, s9
594:              remu         t3, s4, a7
                  c.addi16sp   sp, -16
                  andi         s1, s8, 1896
                  c.sub        s1, s0
598:              c.slli       s7, 22
                  sra          t2, a3, tp
                  blt          a2, s2, 619f
                  add          s0, s10, tp
                  c.li         t0, 10
                  c.nop
                  sub          t5, s9, s5
605:              ori          a6, sp, -92
                  c.srai       s0, 5
                  xori         s3, a0, -1620
                  srli         t4, t0, 27
                  bgeu         gp, a0, 619f
                  bne          s6, t2, 628f
                  blt          s9, t4, 626f
                  rem          s0, s3, ra
                  slti         t3, sp, -24
                  c.nop
                  remu         sp, tp, s11
                  c.srli       a5, 23
                  rem          t5, s3, t2
                  nop
619:              divu         s7, a2, s8
                  c.srai       s1, 22
                  slt          s1, a6, t4
                  c.lui        s1, 8
                  sltu         s1, s6, s4
                  divu         t6, sp, a1
                  c.or         s1, a4
626:              c.add        a6, gp
                  rem          t4, t1, sp
628:              slt          s4, s4, s5
                  blt          gp, a3, 632f
                  c.beqz       a1, 640f
                  sltiu        a2, a2, -1596
632:              sltiu        s3, s7, -1693
                  andi         s9, s0, 1372
                  xori         s3, s11, 1490
                  c.addi       a5, -1
                  c.addi       s3, -1
                  xor          a3, a5, gp
                  divu         gp, t3, s6
                  srai         s0, zero, 19
640:              sltu         a4, t5, s2
                  xori         t5, s8, -1593
                  c.beqz       s0, 660f
                  add          s11, s11, t0
                  sltu         t6, t3, t1
                  srai         t0, s4, 16
                  nop
                  c.slli       s6, 20
                  c.addi16sp   sp, 464
                  c.addi       gp, -1
                  rem          a4, a1, t3
                  c.li         t1, -1
                  c.slli       t4, 17
                  ori          a7, s3, -1362
                  c.mv         s8, a6
                  div          s3, tp, t5
                  bne          sp, t2, 673f
                  srl          a6, s3, t2
                  c.lui        t4, 13
                  c.li         tp, 9
660:              c.and        a2, a3
                  sra          t6, ra, t2
                  c.lui        s1, 20
                  blt          s9, t4, 675f
                  c.addi4spn   s1, sp, 592
                  slli         s11, s6, 12
                  auipc        a6, 498728
                  slti         s10, a7, -231
                  c.slli       a6, 6
                  c.li         s0, -1
                  xor          s0, a2, t5
                  beq          s1, gp, 674f
                  sltiu        a2, s7, 1122
673:              c.bnez       a3, 686f
674:              mulh         s1, a1, s2
675:              or           a5, gp, s7
                  c.addi       a3, 28
                  lui          s1, 680678
                  andi         s10, s6, 1856
                  bltu         t1, s0, 688f
                  c.bnez       a3, 684f
                  c.bnez       a2, 685f
                  c.add        a5, s1
                  auipc        t5, 703270
684:              sltiu        t0, ra, -1061
685:              bltu         a5, s11, 704f
686:              bge          s10, tp, 690f
                  bge          s10, s2, 688f
688:              blt          s6, t3, 697f
                  c.srli       a5, 4
690:              andi         s10, a2, 1262
                  srl          s7, s5, a2
                  sll          t5, t0, a2
                  sra          a6, s5, s5
                  sltiu        s9, s4, 958
                  c.mv         a5, a0
                  c.and        a3, s0
697:              slli         a7, s9, 28
                  c.xor        s0, a1
                  mulh         s3, s8, s2
                  c.sub        a3, a1
                  slti         t0, s3, -2021
                  c.or         a4, a0
                  c.add        t0, s1
704:              srai         t0, a0, 18
                  bge          t4, tp, 706f
706:              remu         s3, t4, s4
                  sra          s8, a0, t4
                  or           s7, a4, ra
                  slli         gp, gp, 21
                  and          ra, a1, sp
                  mulhu        a2, t6, a4
                  c.add        t1, a1
                  bgeu         s6, s6, 718f
                  remu         a3, t4, s0
                  sll          ra, t1, t6
                  lui          t0, 167137
                  c.andi       a4, 12
718:              srli         s4, a3, 23
                  srl          a3, t5, t4
                  or           s11, a4, sp
                  c.and        a5, s0
                  c.slli       a1, 2
                  add          a4, a3, s5
                  c.mv         t0, gp
                  divu         t2, a3, s6
                  mulh         s3, s2, t0
                  c.li         a3, -1
                  div          ra, s3, a6
                  nop
                  c.add        a6, s2
                  sra          s10, s6, zero
                  divu         s0, t2, t5
                  xor          s1, zero, a7
                  sltiu        t2, a2, -730
                  sub          a4, s5, s3
                  and          s3, s7, t5
                  blt          a4, t1, 753f
                  slli         s4, s6, 27
                  c.mv         gp, a3
                  nop
                  xori         a7, a3, 961
                  c.srai       a4, 26
                  slt          s1, s0, a0
                  bgeu         t3, t3, 745f
745:              c.andi       s0, 25
                  ori          t4, a6, -1805
                  c.srai       a3, 12
                  c.sub        a5, a2
                  xori         tp, t5, 663
                  c.nop
                  srli         s1, a1, 23
                  slti         s8, s9, 133
753:              addi         t5, s11, 1530
                  mulhu        ra, a5, sp
                  auipc        sp, 382484
                  c.addi       s7, 8
                  addi         a5, zero, -8 #init loop 0 counter
                  addi         sp, zero, 2 #init loop 0 limit
sub_3_58_0_t:     c.addi       tp, 16
                  addi         a5, a5, 10 #update loop 0 counter
                  bne          a5, sp, sub_3_58_0_t #branch for loop 0
                  lui          s1, 959037
                  c.mv         tp, gp
                  auipc        sp, 885618
                  c.addi4spn   a5, sp, 16
                  blt          t6, s2, 769f
                  blt          gp, s10, 762f
762:              addi         tp, t4, -254
                  c.addi4spn   a2, sp, 560
                  rem          a1, s5, t1
                  mulhu        t1, tp, s2
                  sll          s1, a1, s7
                  sltiu        s11, a7, -1172
                  c.sub        a3, s1
769:              c.add        t0, sp
                  slt          s0, s6, t0
                  slti         t0, a1, -1248
                  auipc        s10, 824077
                  addi         s9, t4, -456
                  nop
                  bltu         a3, s2, 785f
                  xori         s11, a4, -1894
                  ori          a4, s4, -548
                  or           a5, tp, a1
                  c.addi       gp, -1
                  c.nop
                  c.addi       t0, 11
                  mulh         s4, s10, s4
                  c.andi       a1, -1
                  div          s3, a0, a4
785:              c.add        s3, ra
                  c.addi4spn   a5, sp, 992
                  c.srli       a4, 7
                  bltu         s10, s9, 792f
                  c.lui        t2, 6
                  c.sub        a1, s0
                  blt          a5, t5, 806f
792:              div          s8, s7, t3
                  rem          ra, a0, sp
                  c.and        a4, a4
                  c.nop
                  add          a5, s3, s8
                  mulh         zero, a5, s5
                  c.sub        a4, a1
                  bltu         s8, s11, 809f
                  c.addi       a4, -1
                  mulhu        s9, zero, tp
                  c.srli       a3, 9
                  lui          a1, 746480
                  lui          zero, 673882
                  c.andi       a1, -1
806:              add          t6, s4, s7
                  c.or         s1, a1
                  c.and        a4, a3
809:              c.add        tp, t3
                  blt          t0, s5, 825f
                  div          ra, t1, a2
                  c.and        a4, a5
                  srli         s4, tp, 28
                  sll          t3, ra, s6
                  sltu         t2, s3, s5
                  c.and        s0, a5
                  la           s7, amo_0+20 #start riscv_amo_instr_stream_1
                  amoand.w      t5, s8, (s7)
                  amomaxu.w.aq  s11, s5, (s7)
                  amomin.w.rl   t2, s5, (s7) #end riscv_amo_instr_stream_1
                  or           s9, a4, t6
                  lui          s0, 152215
                  ori          s8, sp, 1193
                  sltiu        s8, s6, -1122
                  c.xor        s0, a1
                  sltiu        a5, a2, 459
                  xor          s4, t1, t3
                  bge          s6, t0, 832f
825:              mulhsu       a4, s1, t3
                  mul          zero, a4, a0
                  slli         s0, sp, 19
                  mulhu        s8, a0, a1
                  c.nop
                  blt          s6, t6, 845f
                  andi         a2, s2, 531
832:              addi         t1, t3, -1306
                  c.sub        a5, a0
                  lui          gp, 966195
                  c.li         a7, 12
                  xor          s0, s8, t5
                  nop
                  or           t6, s3, s4
                  c.beqz       a4, 847f
                  c.add        t1, t1
                  srai         t3, t3, 13
                  lui          a3, 40267
                  c.andi       a4, -1
                  mulh         s9, s0, t2
845:              c.andi       a5, -1
                  mulhu        tp, s1, s2
847:              c.mv         s3, s3
                  and          gp, t6, t4
                  slt          s10, a5, t4
                  mul          a4, s4, ra
                  bgeu         s7, s3, 868f
                  nop
                  beq          a7, s3, 872f
                  bne          a3, a7, 862f
                  c.srli       s1, 12
                  rem          a6, t2, a7
                  mul          t3, s7, a4
                  bne          a3, s1, 875f
                  beq          t6, t3, 860f
860:              blt          a2, s8, 869f
                  or           a4, s1, a5
862:              srli         t4, t0, 10
                  c.nop
                  auipc        ra, 488819
                  div          s9, s7, a5
                  bltu         s6, a4, 876f
                  c.bnez       a4, 877f
868:              sub          a6, s10, s6
869:              xor          t2, t0, a4
                  ori          t5, s6, 547
                  c.sub        s0, a3
872:              c.li         a6, -1
                  mulhu        t3, s9, s8
                  c.srai       a4, 9
875:              slti         s6, s6, 502
876:              c.addi       s7, 6
877:              c.add        t3, a7
                  c.slli       a6, 4
                  mulhu        s8, t4, t2
                  srli         s10, t1, 19
                  c.slli       s1, 27
                  srl          a2, s2, s2
                  slt          a6, tp, t2
                  sra          gp, s3, t4
                  srl          s10, t0, t0
                  c.bnez       s0, 899f
                  auipc        s4, 977462
                  beq          t5, s4, 892f
                  c.slli       s7, 18
                  c.xor        s0, a5
                  c.add        a5, sp
892:              c.li         t5, -1
                  bgeu         t1, a1, 902f
                  sub          s6, t1, a5
                  sra          a1, gp, a1
                  c.bnez       a4, 897f
897:              sub          tp, sp, a3
                  addi         t6, a0, 28
899:              and          a6, t3, s1
                  c.addi4spn   a3, sp, 1008
                  addi         s7, zero, 339
902:              remu         s7, s4, s7
                  c.li         t0, 17
                  c.addi       t3, -1
                  slt          t6, a1, a0
                  div          s6, a2, sp
                  c.sub        a1, s1
                  srl          a1, a0, s10
                  mulh         ra, s0, a6
                  sll          s8, a3, s10
                  c.srli       s0, 22
                  c.add        s9, s2
                  srli         zero, sp, 12
                  blt          t6, s4, 915f
915:              addi         s10, a0, 257
                  slt          s8, s8, gp
                  sub          s4, gp, s8
                  srl          a2, sp, s3
                  slti         s11, s7, 1058
                  sltu         s6, s3, t2
                  c.bnez       a3, 925f
                  sltiu        s0, a5, -164
                  bne          s7, s1, 932f
                  and          s0, t0, s8
925:              andi         sp, tp, -953
                  c.andi       a5, -1
                  addi         a5, t6, -70
                  xori         s6, t3, 1604
                  mulhu        sp, a7, s1
                  andi         a7, t6, 926
                  xori         ra, s11, 1564
932:              mulhsu       s0, t5, a0
                  bgeu         s3, a2, 952f
                  lui          t0, 437601
                  ori          t5, s5, -866
                  add          zero, a3, t4
                  c.sub        s1, a0
                  sltu         gp, a3, a4
                  c.xor        a3, a5
                  c.add        tp, a2
                  bge          s2, sp, 956f
                  xor          a4, a4, t5
                  auipc        t6, 446892
                  andi         s10, t2, 1961
                  blt          a3, s1, 949f
                  sltiu        t0, gp, -1766
                  c.sub        a4, a5
                  c.xor        s1, a4
949:              slt          t3, sp, a3
                  slti         t3, s3, 1665
                  or           gp, tp, t1
952:              beq          s2, a0, 962f
                  sra          s11, s4, a2
                  mul          t0, a6, s1
                  divu         t6, a1, a2
956:              beq          t0, a4, 973f
                  sra          a6, t0, s2
                  remu         zero, t4, t1
                  lui          ra, 62105
                  div          t1, s8, s8
                  nop
962:              c.addi       tp, 22
                  or           s6, a7, a3
                  bgeu         a2, s11, 982f
                  xor          a1, t2, tp
                  c.slli       s7, 30
                  srli         ra, s8, 26
                  nop
                  c.li         s10, 10
                  slli         s8, s3, 11
                  srai         a5, t0, 15
                  blt          s7, s1, 980f
973:              c.nop
                  sra          sp, a2, zero
                  mulhu        a7, s8, s5
                  xori         t0, s3, -356
                  and          tp, s8, t1
                  div          s0, ra, a0
                  xor          sp, s11, s11
980:              c.addi4spn   s1, sp, 832
                  sll          t2, ra, s6
982:              srai         t6, tp, 25
                  bgeu         a4, s4, 998f
                  bgeu         a7, s9, 992f
                  ori          s4, s8, 415
                  bne          a0, a2, 998f
                  srai         s3, a5, 25
                  c.add        s10, s6
                  mulh         t3, t4, s9
                  remu         gp, a7, zero
                  xori         s11, s10, -369
992:              sltu         s11, tp, s10
                  mul          a6, t3, gp
                  addi         tp, t5, -1844
                  c.sub        a5, a5
                  c.add        a3, a3
                  slti         s9, tp, 852
998:              bne          t0, t5, 1013f
                  c.and        s0, a2
                  mulhu        a3, t2, t0
                  c.nop
                  sub          s6, t2, a4
                  ori          s11, s6, -1442
                  or           t1, s10, a3
                  c.andi       a2, -1
                  c.andi       a1, -1
                  c.addi4spn   a2, sp, 816
                  bgeu         s2, a4, 1009f
1009:             mulhsu       s6, s5, t0
                  auipc        s4, 72169
                  auipc        t2, 287811
                  bne          s5, a7, 1028f
1013:             bne          s11, t3, 1018f
                  c.xor        a2, a2
                  bgeu         a0, s3, 1023f
                  xor          t2, s4, s0
                  c.addi16sp   sp, -16
1018:             xori         t4, t5, 514
                  c.addi16sp   sp, 48
                  mulhsu       s10, t6, s6
                  c.addi4spn   s1, sp, 144
                  addi         t0, sp, -1395
1023:             bge          gp, s6, 1042f
                  mul          s4, a6, s2
                  c.srli       a3, 10
                  mulhsu       zero, t2, a2
                  srl          zero, t2, sp
1028:             addi         t2, t3, -1764
                  sra          t5, a4, ra
                  sll          sp, sp, t5
                  srli         s4, sp, 7
                  c.sub        a2, s0
                  addi         t4, zero, -7 #init loop 0 counter
                  c.and        a5, a4
                  sll          s8, t2, a7
                  sub          s7, s4, t2
                  addi         t1, zero, -4 #init loop 0 limit
                  c.nop
sub_3_55_0_t:     c.andi       a1, -1
                  srai         ra, s8, 27
                  add          gp, a6, s5
                  c.mv         s8, a1
                  divu         a1, a2, t6
                  c.srai       a2, 19
                  rem          ra, zero, t2
                  addi         t4, t4, 2 #update loop 0 counter
                  sltiu        s6, tp, 242
                  c.add        t0, s3
                  c.xor        a4, a5
                  slli         t6, a1, 27
                  blt          t4, t1, sub_3_55_0_t #branch for loop 0
                  sub          t5, t3, s6
                  sra          a7, t0, a6
                  c.mv         s3, a7
                  sltu         s3, ra, a4
                  c.andi       a5, 18
                  c.addi16sp   sp, -16
                  xori         a1, s5, -1025
                  slti         t4, a1, 1884
                  mul          s6, s6, a7
                  bgeu         tp, s3, 1044f
1042:             mulhsu       ra, t1, s2
                  bge          s7, s4, 1047f
1044:             c.slli       tp, 10
                  beq          sp, s9, 1048f
                  add          a6, s3, s7
1047:             sra          s11, a0, t1
1048:             c.or         a1, s1
                  divu         s10, s1, s7
                  srl          tp, s7, a1
                  lui          t2, 413065
                  c.addi4spn   a2, sp, 880
                  mulhu        a6, s9, t2
                  rem          a7, tp, s6
                  c.mv         t6, t5
                  mulhsu       a3, s7, t1
                  div          sp, a6, s0
                  c.nop
                  nop
                  andi         s10, t6, -1562
                  or           s0, s11, s1
                  c.li         s0, 2
                  c.addi4spn   s1, sp, 160
                  auipc        a7, 671360
                  sub          a3, gp, t1
                  div          t5, s8, s0
                  c.li         s9, 22
                  remu         t1, a6, s2
                  or           a2, zero, t2
                  bltu         t3, s7, 1085f
                  c.sub        s1, a2
                  addi         a7, a0, 478
                  xori         tp, a7, -129
                  c.addi16sp   sp, -16
                  rem          a7, s9, s10
                  slti         s4, s0, 1736
                  c.addi16sp   sp, 160
                  sub          sp, s3, a2
                  or           t0, s10, s4
                  c.srli       a2, 1
                  ori          a2, zero, -484
                  bgeu         a3, s10, 1087f
                  srai         t3, t5, 6
                  c.addi4spn   a5, sp, 672
1085:             and          a5, t2, t1
                  c.xor        a1, s1
1087:             auipc        sp, 266683
                  c.sub        a2, s0
                  slti         a7, s11, 699
                  c.addi16sp   sp, -16
                  c.add        t1, s3
                  sltiu        t0, a3, 1195
                  bge          a0, s3, 1094f
1094:             nop
                  beq          zero, s6, 1105f
                  c.beqz       a5, 1097f
1097:             sltu         a4, s1, tp
                  mulhu        s3, s1, a0
                  bltu         s6, s4, 1100f
1100:             c.mv         s6, a3
                  sra          s8, sp, ra
                  c.sub        a2, a1
                  sra          s10, zero, s10
                  c.addi4spn   a3, sp, 304
1105:             xori         t0, t1, 40
                  and          ra, a6, a4
                  div          s0, t5, s9
                  or           s1, t0, zero
                  rem          s3, t1, tp
                  srl          a3, s8, tp
                  xor          a6, a2, t0
                  bge          t5, s0, 1121f
                  c.or         a5, s0
                  c.nop
                  div          gp, t5, s3
                  bltu         zero, zero, 1133f
                  c.addi       s6, -1
                  bne          s5, t1, 1127f
                  auipc        s7, 670773
                  srli         t2, t1, 31
1121:             auipc        a2, 113642
                  mulhsu       s3, a3, tp
                  mulh         t3, s11, s6
                  c.srai       a3, 28
                  xori         zero, s0, 567
                  add          t5, t2, s2
1127:             or           ra, a7, s3
                  c.add        a5, a1
                  c.mv         gp, s9
                  andi         a5, s0, 1919
                  sub          a7, t1, t6
                  c.add        t2, t2
1133:             mulhu        t0, s4, a6
                  bne          s4, t5, 1138f
                  addi         a2, a5, -787
                  ori          s8, s1, -1232
                  blt          t1, t5, 1145f
1138:             c.addi4spn   a5, sp, 144
                  andi         t1, s3, 1599
                  c.mv         a5, t0
                  blt          s6, s9, 1142f
1142:             c.addi       ra, 26
                  bgeu         a5, sp, 1153f
                  bgeu         s11, s3, 1156f
1145:             c.xor        a5, a5
                  c.srai       s0, 28
                  add          t6, s4, s4
                  sra          s1, a5, s3
                  c.srai       s0, 2
                  srl          t0, t2, zero
                  c.addi4spn   a5, sp, 464
                  div          s4, t5, t1
1153:             sub          s3, s5, a3
                  or           t4, t2, s11
                  mulhu        t1, t3, ra
1156:             blt          zero, a6, 1172f
                  blt          s10, s8, 1165f
                  mulhu        s0, s2, s9
                  c.and        a5, a4
                  c.addi4spn   a4, sp, 672
                  c.bnez       a1, 1170f
                  c.mv         t0, s0
                  rem          s8, t4, s2
                  ori          sp, s9, -1582
1165:             c.or         a2, a1
                  andi         zero, a3, -1163
                  srl          a1, s7, t2
                  slt          s6, s2, a0
                  addi         sp, a3, -1884
1170:             c.srai       a1, 24
                  xori         s10, ra, -454
1172:             lui          s7, 336413
                  c.add        s0, a4
                  sra          a4, s9, t6
                  c.mv         s10, s7
                  lui          a5, 739342
                  c.addi16sp   sp, -16
                  srli         tp, s4, 0
                  sltu         a2, a3, t5
                  c.xor        a5, a1
                  sltiu        t0, s8, -905
                  mulhu        ra, a2, ra
                  slt          a4, sp, t1
                  mulh         a1, tp, s5
                  c.slli       a5, 3
                  c.srli       a4, 3
                  c.add        s8, s3
                  c.and        a3, a3
                  add          zero, a1, tp
                  remu         t1, a1, t5
                  c.bnez       a1, 1209f
                  mulhsu       t3, gp, tp
                  c.bnez       a2, 1208f
                  c.andi       s0, 26
                  c.mv         a7, a1
                  slli         t3, a0, 12
                  srli         zero, s10, 9
                  beq          s4, s7, 1202f
                  srl          s8, a0, t5
                  divu         t1, s0, t5
                  xor          s11, t0, s11
1202:             sltu         a3, s10, t2
                  c.sub        s0, s0
                  sll          sp, sp, t5
                  c.mv         s4, tp
                  mulh         zero, t1, a5
                  c.mv         s8, s0
1208:             divu         s0, s2, t4
1209:             c.and        a1, a0
                  srl          ra, sp, s4
                  c.srli       s1, 4
                  c.lui        t3, 16
                  divu         ra, zero, zero
                  ori          t5, s10, -1107
                  c.and        a3, s0
                  mulhsu       t0, t3, s9
                  andi         a7, a4, 1462
                  c.add        a5, t0
                  auipc        t6, 744965
                  c.sub        a5, a2
                  add          zero, a1, s7
                  sra          t1, s2, t1
                  c.addi       a2, 26
                  bltu         s9, a2, 1232f
                  or           t4, a0, s5
                  sll          s11, a4, a1
                  c.addi16sp   sp, -16
                  c.srli       a5, 23
                  srai         s3, t4, 25
                  bgeu         gp, s7, 1234f
                  c.bnez       a2, 1250f
1232:             slti         zero, tp, 1339
                  c.nop
1234:             mulh         a4, sp, a6
                  sltu         s11, a6, t0
                  andi         gp, s0, -565
                  srai         s6, t0, 6
                  c.addi       a1, 17
                  divu         zero, s2, tp
                  sub          s3, ra, s7
                  sltu         ra, t3, s11
                  ori          s4, a7, 1832
                  slti         s4, a0, -875
                  add          a5, s1, s8
                  addi         t1, t5, -472
                  c.add        s9, t3
                  beq          s0, s6, 1260f
                  mulhu        s1, s9, t4
                  sra          s0, tp, zero
1250:             rem          s6, s3, s11
                  beq          a7, t3, 1261f
                  c.addi16sp   sp, 64
                  bne          s6, a0, 1270f
                  andi         t3, s1, 1462
                  c.addi4spn   a4, sp, 800
                  c.xor        a5, a1
                  slli         ra, t5, 3
                  and          t1, ra, a3
                  c.sub        a2, s0
1260:             sra          t2, a2, ra
1261:             srl          t3, t1, t3
                  lui          gp, 548366
                  c.mv         s11, a1
                  ori          a1, s7, -1308
                  c.xor        s0, s0
                  c.addi       a6, 21
                  srl          s9, a2, s8
                  mulhu        t0, s3, s8
                  srai         t0, s6, 9
1270:             bltu         s10, s10, 1274f
                  c.addi4spn   a5, sp, 656
                  nop
                  sltu         s0, a2, s4
1274:             sub          t4, tp, s10
                  c.srai       a5, 23
                  srai         sp, s10, 20
                  beq          s5, a3, 1292f
                  c.add        gp, s3
                  sub          s6, s2, s5
                  c.lui        ra, 24
                  slt          a4, t2, a1
                  sltiu        s6, t5, -5
                  c.bnez       a1, 1302f
                  div          s7, t5, a6
                  bne          t2, ra, 1304f
                  c.lui        s9, 10
                  andi         t1, a4, 1079
                  slt          tp, t3, s6
                  mulh         t4, t0, t5
                  blt          t3, s8, 1294f
                  slt          s9, zero, t3
1292:             xori         s0, t2, -1603
                  div          t0, a5, t6
1294:             ori          ra, tp, -302
                  c.li         a1, 14
                  c.and        a1, s0
                  sltiu        t0, a4, -932
                  c.add        s4, a4
                  c.and        a5, a0
                  c.sub        a4, a5
                  xori         t5, s8, -732
1302:             beq          s6, a4, 1303f
1303:             or           ra, t5, s3
1304:             mulh         s11, t0, s11
                  slt          s7, t4, t4
                  c.sub        s0, a3
                  c.nop
                  c.beqz       a3, 1317f
                  and          a3, gp, s3
                  slli         sp, a4, 20
                  div          tp, a1, a0
                  addi         zero, s2, 86
                  slt          t3, s2, a7
                  c.addi4spn   a1, sp, 832
                  xor          a4, s1, ra
                  c.nop
1317:             c.add        s1, s6
                  xori         s8, t5, -76
                  and          s4, a5, a7
                  c.or         s1, a3
                  and          a3, a7, t6
                  c.slli       s0, 13
                  div          s9, tp, s8
                  c.bnez       a4, 1329f
                  bge          s7, tp, 1329f
                  sub          s6, s11, s6
                  mul          t2, zero, s9
                  slti         gp, s9, 1453
1329:             remu         s4, t3, a7
                  c.slli       a3, 8
                  slli         s3, t4, 7
                  srl          t0, s4, s0
                  mulhu        s1, ra, s5
                  mulhsu       a2, t3, s7
                  nop
                  srl          s4, a7, s5
                  auipc        a7, 608767
                  slli         tp, s8, 19
                  bgeu         s0, s2, 1352f
                  divu         s3, s4, t0
                  bge          t2, s10, 1342f
1342:             sra          s10, gp, s1
                  add          t3, a7, s3
                  add          a5, a4, gp
                  xor          t6, ra, s7
                  c.slli       a6, 25
                  c.beqz       a3, 1362f
                  c.slli       t2, 27
                  mulhu        gp, s9, ra
                  c.srai       s1, 2
                  andi         a3, s8, -418
1352:             bltu         ra, s8, 1360f
                  mul          t3, a5, s6
                  c.addi4spn   a1, sp, 384
                  xor          t4, s6, s3
                  srai         s1, ra, 22
                  c.or         s0, a1
                  xor          gp, ra, t3
                  div          t2, t1, a0
1360:             ori          s7, sp, -1066
                  c.bnez       a4, 1370f
1362:             divu         t0, t0, s7
                  sub          s8, tp, s8
                  div          a3, a6, t1
                  mulhsu       t4, s1, t6
                  c.add        t5, a7
                  and          a1, t4, s7
                  and          t0, a0, zero
                  sll          a6, a0, a3
1370:             c.beqz       s1, 1378f
                  c.srai       a1, 6
                  mulh         ra, a1, a0
                  c.and        s1, a1
                  mulhsu       s6, t0, t5
                  sll          s8, t6, s6
                  lui          s6, 224405
                  c.add        s9, s5
1378:             slli         s3, a4, 28
                  slli         a7, s5, 4
                  c.srli       a2, 21
                  c.mv         s7, t0
                  sltiu        a6, a6, 846
                  c.addi4spn   a3, sp, 576
                  c.and        a5, a1
                  c.add        s11, s0
                  c.mv         s6, s8
                  remu         a3, t3, t6
                  c.add        a1, s0
                  ori          t4, s5, -638
                  slli         a7, s3, 27
                  srli         t2, ra, 8
                  slli         zero, tp, 21
                  c.mv         s3, a3
                  and          a4, s0, gp
                  c.addi16sp   sp, -16
                  c.mv         s8, tp
                  sltiu        tp, a7, -1687
                  bgeu         a2, t2, 1415f
                  blt          t6, t5, 1418f
                  bne          a1, a5, 1403f
                  c.add        s8, t3
                  c.and        a3, a4
1403:             slti         gp, s2, -1711
                  c.addi16sp   sp, -16
                  mulh         s3, s0, s11
                  c.mv         a3, a2
                  slt          a5, a3, s0
                  c.beqz       a2, 1423f
                  nop
                  bgeu         ra, a7, 1422f
                  c.slli       t4, 14
                  c.addi       s7, 14
                  c.slli       t1, 23
                  c.addi4spn   s0, sp, 64
1415:             sra          tp, tp, a3
                  c.addi16sp   sp, -16
                  c.nop
1418:             bge          t3, s9, 1426f
                  sltu         s3, s0, s2
                  mulhsu       tp, t5, tp
                  bge          gp, zero, 1437f
1422:             srl          gp, a1, s5
1423:             xor          a2, tp, t6
                  c.andi       a1, 22
                  c.srai       a2, 27
1426:             mulhsu       s4, tp, a4
                  rem          a3, gp, s0
                  sltu         t1, gp, a6
                  c.xor        a4, a5
                  slli         s8, a5, 29
                  addi         t2, s5, -754
                  div          t3, t2, s6
                  mulh         a5, a0, zero
                  c.srli       a3, 19
                  srai         sp, s3, 19
                  c.addi       gp, 2
1437:             divu         s11, s6, s0
                  andi         s7, s11, 559
                  and          s0, t0, s5
                  add          a6, s1, s4
                  slt          a2, s6, a5
                  and          t4, s11, s6
                  bne          t4, s1, 1453f
                  sub          a5, gp, t2
                  or           a7, t3, t0
                  c.addi       s10, -1
                  mulhu        s10, t4, s6
                  c.addi4spn   a4, sp, 880
                  bne          t6, s1, 1464f
                  auipc        s1, 983339
                  nop
                  srl          a4, a6, a6
1453:             andi         s9, t3, -49
                  and          s7, sp, s11
                  srli         t5, a2, 6
                  c.slli       t5, 20
                  c.andi       a3, -1
                  c.srai       a5, 28
                  mulhu        s4, tp, s10
                  mulhu        a5, s7, s2
                  bltu         s9, s6, 1465f
                  c.srai       a1, 6
                  rem          s6, s1, a4
1464:             andi         a3, s1, -2033
1465:             srai         s10, s6, 11
                  slti         t5, a4, -684
                  bltu         s8, s0, 1477f
                  c.addi4spn   a2, sp, 544
                  slt          ra, gp, zero
                  xor          t4, ra, a6
                  c.andi       s0, -1
                  c.add        s8, t1
                  sltu         a7, t2, s7
                  c.srli       a1, 5
                  and          a5, t1, s4
                  srai         a3, s10, 21
1477:             mul          a3, s9, a5
                  mulh         s3, t3, t4
                  srl          s1, s1, t6
                  c.addi16sp   sp, -16
                  srl          t0, s0, s5
                  c.or         a2, s0
                  sub          a7, a0, sp
                  c.addi16sp   sp, -16
                  rem          s8, s6, gp
                  srl          zero, sp, s9
                  slli         a3, tp, 11
                  c.andi       a3, 23
                  mulhu        t3, s4, sp
                  c.addi       s7, 20
                  srli         gp, t2, 0
                  c.or         s1, s1
                  div          t3, a1, t0
                  rem          ra, t2, s9
                  bne          s10, a2, 1505f
                  mulhsu       s6, t2, s2
                  slti         a1, sp, 1330
                  c.nop
                  c.sub        s0, s1
                  srai         s11, s7, 24
                  slti         a4, sp, -1537
                  c.li         s1, -1
                  c.xor        s1, a1
                  add          t5, tp, s10
1505:             slti         t3, s0, -41
                  srli         s10, a3, 6
                  beq          s10, s0, 1511f
                  add          t6, s8, a1
                  slli         t2, s6, 25
                  c.add        s1, ra
1511:             auipc        t3, 50408
                  bltu         a7, s10, 1530f
                  slli         t0, gp, 24
                  c.srai       a5, 24
                  c.addi4spn   s1, sp, 880
                  c.add        t2, t3
                  auipc        tp, 830645
                  c.bnez       a3, 1519f
1519:             and          t6, a3, a0
                  xor          s0, s10, t3
                  slti         s4, s0, -833
                  rem          t1, s3, s0
                  srli         a1, t1, 25
                  bltu         ra, s5, 1533f
                  c.add        s7, a7
                  c.addi       gp, -1
                  add          gp, t5, a3
                  andi         sp, t4, 471
                  c.xor        a3, a0
1530:             srai         a2, a7, 24
                  nop
                  or           s7, a5, t2
1533:             sll          s3, s5, s7
                  mulhu        s9, t3, gp
                  xori         gp, t3, -1539
                  remu         s3, s9, s10
                  c.add        a6, a1
                  c.sub        a5, a5
                  srl          a7, a6, ra
                  c.andi       a1, -1
                  c.andi       s0, -1
                  divu         a7, t5, s11
                  srli         s7, s4, 24
                  c.addi4spn   a2, sp, 608
                  c.srai       s1, 27
                  srli         s11, a2, 16
                  c.srai       a1, 29
                  divu         a4, s5, s11
                  c.li         s6, -1
                  xor          gp, tp, a0
                  bgeu         t4, t3, 1552f
1552:             sra          s4, s3, t5
                  srl          ra, s5, gp
                  auipc        t4, 372027
                  add          gp, tp, s9
                  c.addi       a6, -1
                  c.addi16sp   sp, 160
                  slt          ra, s10, a0
                  mul          zero, zero, t3
                  c.add        s1, s4
                  sll          t0, s5, t3
                  c.addi16sp   sp, -16
                  mulhu        gp, t4, t2
                  c.beqz       s1, 1581f
                  bltu         a2, s11, 1578f
                  c.slli       s7, 10
                  remu         s3, ra, a1
                  addi         a3, s3, 152
                  c.slli       a5, 3
                  ori          tp, s5, -1539
                  lui          s0, 884185
                  sra          s10, a2, sp
                  c.lui        a1, 16
                  c.nop
                  and          zero, t2, s4
                  mul          s9, a6, tp
                  remu         s1, t2, t4
1578:             c.slli       t3, 31
                  bgeu         gp, t3, 1580f
1580:             lui          s6, 187579
1581:             c.li         gp, -1
                  c.bnez       a4, 1590f
                  c.or         a1, a1
                  c.addi4spn   s0, sp, 176
                  c.andi       a3, -1
                  c.beqz       a1, 1603f
                  c.bnez       a3, 1591f
                  sll          zero, s5, t5
                  ori          sp, s2, -522
1590:             bltu         a2, s1, 1598f
1591:             sra          a1, t2, t4
                  sra          zero, s3, s11
                  srai         s4, t3, 10
                  xor          a4, s2, s7
                  blt          s5, s6, 1596f
1596:             bne          a0, s6, 1611f
                  c.addi       tp, -1
1598:             sll          gp, a1, gp
                  slt          t3, gp, s2
                  slti         tp, t3, 2040
                  and          a6, t1, s8
                  bltu         s9, s7, 1620f
1603:             mulhsu       a4, s0, a6
                  xor          zero, t6, s9
                  div          s7, t2, s8
                  mulhu        a4, s9, t1
                  c.addi4spn   a2, sp, 592
                  slli         a1, s2, 2
                  c.srai       a1, 6
                  srli         s8, t4, 14
1611:             srli         s8, sp, 27
                  c.mv         a4, t1
                  sub          tp, s8, a6
                  c.addi       s3, -1
                  c.srli       a1, 22
                  c.slli       s10, 20
                  slt          a2, tp, s10
                  blt          a3, t6, 1623f
                  c.addi       a1, 22
1620:             addi         a4, s7, 997
                  c.nop
                  sltiu        s3, t5, -990
1623:             c.andi       a1, 31
                  addi         gp, s0, 684
                  lui          gp, 437994
                  c.addi16sp   sp, 144
                  c.and        a4, a5
                  c.beqz       s0, 1637f
                  lui          sp, 724792
                  sub          s4, a2, s7
                  auipc        s6, 375805
                  lui          t2, 719217
                  add          tp, s1, tp
                  srl          tp, a6, gp
                  mulh         s6, t5, gp
                  addi         gp, t2, -1697
1637:             divu         a2, s10, t4
                  srli         a3, s4, 20
                  sltu         a6, tp, s1
                  c.xor        a4, a3
                  ori          a3, a3, -878
                  c.sub        a5, a3
                  and          t0, s6, a1
                  slti         t0, s8, 83
                  div          a1, t0, s4
                  srl          s8, s10, t1
                  c.andi       a1, 5
                  rem          gp, s3, t2
                  c.addi16sp   sp, -16
                  beq          a7, s4, 1660f
                  c.beqz       a1, 1661f
                  c.mv         s7, s7
                  c.add        s4, s3
                  c.xor        a5, a5
                  bgeu         s5, a2, 1663f
                  c.mv         s4, s2
                  slt          ra, a5, t5
                  sub          s8, s6, a1
                  c.addi4spn   a4, sp, 320
1660:             mulh         gp, s7, a6
1661:             c.beqz       a2, 1665f
                  sll          s6, ra, sp
1663:             and          s4, t4, s0
                  lui          s4, 409846
1665:             c.srai       a1, 17
                  bge          t3, s3, 1681f
                  bge          s1, a4, 1670f
                  c.addi16sp   sp, -16
                  blt          a1, s1, 1681f
1670:             auipc        a3, 894610
                  srl          a2, a6, t3
                  c.beqz       a5, 1676f
                  c.or         s0, s0
                  c.li         s7, -1
                  c.lui        t6, 21
1676:             blt          a5, s1, 1677f
1677:             c.add        t1, s3
                  c.andi       a1, 23
                  nop
                  slli         t1, a7, 9
1681:             c.bnez       a5, 1685f
                  c.sub        s1, a2
                  nop
                  c.slli       a3, 18
1685:             slt          a2, s1, tp
                  ori          t3, zero, -1834
                  c.addi4spn   a3, sp, 192
                  nop
                  c.srai       a1, 19
                  ori          a4, s8, -1428
                  beq          t3, t0, 1710f
                  c.xor        s1, s1
                  sra          s4, s11, tp
                  and          zero, s5, t0
                  divu         t5, s9, s8
                  lui          zero, 735898
                  auipc        s4, 67613
                  bne          t1, s9, 1707f
                  ori          s1, s11, 147
                  slti         ra, ra, -325
                  c.slli       ra, 2
                  add          s1, t2, s11
                  c.srli       s1, 8
                  bne          s5, s0, 1714f
                  bgeu         s2, a6, 1721f
                  xor          t3, s7, ra
1707:             c.slli       t3, 16
                  slli         a7, a7, 10
                  sra          gp, a5, s1
1710:             auipc        a1, 54902
                  add          gp, ra, s3
                  add          s6, t5, s11
                  div          s11, a2, t2
1714:             slti         s3, tp, 1033
                  c.nop
                  srai         ra, t4, 23
                  sltiu        s0, t0, 1269
                  andi         s4, a1, 1396
                  c.or         a3, a2
                  c.addi       a5, -1
1721:             add          t4, a4, s8
                  mulh         sp, s3, t6
                  divu         t4, a1, t6
                  sll          a1, t1, s9
                  slti         s4, s4, -1967
                  sltu         a4, s6, a2
                  sub          a7, a6, a1
                  c.beqz       a3, 1737f
                  and          t3, a0, s6
                  auipc        s4, 672853
                  div          t1, s1, ra
                  c.add        t3, s0
                  bge          s9, a6, 1750f
                  c.sub        a2, a4
                  c.and        a5, s0
                  and          t6, s5, a4
1737:             mulhsu       a2, t2, s11
                  srli         a2, s10, 12
                  c.srai       s1, 1
                  mulhsu       t6, t5, s3
                  c.or         a2, a4
                  add          s10, s5, s5
                  bltu         t1, s9, 1758f
                  andi         gp, a5, 735
                  c.srai       a3, 20
                  sra          a3, t1, a5
                  c.mv         sp, t6
                  and          a2, s3, s11
                  bltu         t1, a4, 1768f
1750:             divu         ra, s2, s6
                  lui          t4, 751451
                  sll          t4, a4, zero
                  slli         t6, a5, 8
                  srli         t4, s2, 8
                  sll          s1, a1, t6
                  xor          s0, t1, t1
                  srai         s10, s1, 29
1758:             sltiu        t1, t5, -35
                  c.add        s1, sp
                  la           t5, region_1+1958 #start load_store_instr_stream_0
                  lbu          s6, -51(t5)
                  lbu          gp, -187(t5)
                  sb           a3, -57(t5)
                  la           t0, region_0+1972 #start load_store_instr_stream_1
                  lb           a6, -237(t0)
                  sb           t2, -58(t0)
                  sb           t0, -77(t0)
                  sb           s5, -184(t0)
                  lb           tp, -173(t5)
                  sb           t5, -119(t0)
                  lbu          s7, 2(t0) #end load_store_instr_stream_1
                  sb           a4, -111(t5)
                  lb           gp, -115(t5)
                  lbu          a1, -201(t5) #end load_store_instr_stream_0
                  remu         a7, s0, s6
                  c.or         s0, a5
                  sub          a7, t6, s8
                  c.addi16sp   sp, -16
                  slti         t4, a1, -72
                  srai         s6, sp, 10
                  ori          tp, a6, 1652
                  mulh         s6, a5, s5
1768:             mulhsu       s6, gp, t5
                  and          a4, tp, s2
                  c.srli       a1, 22
                  c.addi4spn   a5, sp, 656
                  mulhu        t3, gp, a1
                  c.mv         s1, s2
                  c.li         t4, -1
                  c.addi4spn   a3, sp, 224
                  c.lui        s10, 13
                  nop
                  ori          tp, s8, 1068
                  and          sp, a0, t6
                  c.addi16sp   sp, 32
                  bltu         a7, a2, 1782f
1782:             mulh         s10, s10, s6
                  c.mv         s4, a4
                  ori          a7, gp, -245
                  mulhu        a7, s8, s7
                  nop
                  mulh         s10, a0, s5
                  mulh         gp, t3, a6
                  slti         s3, t4, 748
                  c.add        t6, a2
                  beq          a0, s6, 1795f
                  remu         zero, s5, a5
                  mulh         sp, s7, a5
                  andi         t2, a3, 1187
1795:             slt          a3, t4, a0
                  sub          a4, sp, t6
                  sra          t3, s1, gp
                  c.addi4spn   s0, sp, 912
                  xori         t5, tp, -1959
                  bgeu         gp, gp, 1804f
                  andi         a6, a2, -655
                  addi         zero, a3, -1179
                  auipc        t1, 636637
1804:             c.nop
                  auipc        t2, 961275
                  c.xor        a1, a1
                  c.sub        a4, s0
                  c.lui        s8, 15
                  bne          s8, a0, 1826f
                  bgeu         s3, s1, 1829f
                  c.or         a3, a4
                  c.mv         t2, t4
                  addi         t2, a4, 916
                  blt          t2, t2, 1817f
                  srli         s0, a0, 29
                  c.addi16sp   sp, -16
1817:             addi         a2, sp, -453
                  sltu         gp, t4, ra
                  srli         s9, a1, 23
                  sub          a2, t4, sp
                  and          s3, a3, s9
                  c.andi       a2, 6
                  c.add        ra, a4
                  and          s1, s8, zero
                  c.nop
1826:             lui          a6, 595592
                  xor          sp, tp, s8
                  mulhu        s8, s10, a0
1829:             c.addi4spn   a5, sp, 832
                  beq          a0, zero, 1839f
                  c.addi16sp   sp, -16
                  c.srli       a1, 2
                  lui          t0, 251529
                  bne          s1, tp, 1844f
                  beq          s6, sp, 1854f
                  c.lui        t3, 21
                  c.addi16sp   sp, 304
                  beq          s0, t2, 1853f
1839:             slti         s3, tp, -658
                  remu         s11, a6, s2
                  c.sub        a4, s0
                  c.slli       s6, 5
                  c.beqz       s0, 1844f
1844:             ori          s4, t0, 2006
                  andi         t6, gp, 1906
                  bltu         a1, s2, 1863f
                  bltu         s5, s5, 1857f
                  or           s10, a3, a6
                  xori         a6, s11, 1396
                  beq          s7, t1, 1863f
                  remu         zero, s4, a5
                  c.sub        a3, a3
1853:             c.slli       t5, 22
1854:             c.nop
                  c.bnez       a5, 1864f
                  mulhu        t3, ra, a5
1857:             mulhu        sp, zero, sp
                  c.nop
                  c.mv         s6, t0
                  bge          s11, tp, 1865f
                  bltu         s11, s8, 1873f
                  bne          a6, s2, 1866f
1863:             c.slli       t6, 9
1864:             sra          t6, s10, a6
1865:             c.add        s11, s3
1866:             bne          s0, s5, 1867f
1867:             c.xor        a5, a1
                  c.slli       a2, 3
                  sll          s4, t4, a1
                  c.srai       s1, 11
                  mulhsu       a2, s5, tp
                  slli         s10, a4, 15
1873:             xor          a3, a1, s8
                  and          tp, s6, t3
                  c.andi       a2, -1
                  bgeu         s11, a0, 1877f
1877:             c.nop
                  mulhsu       t0, s9, zero
                  c.li         a6, -1
                  sltu         s6, t3, t0
                  auipc        s4, 131153
                  beq          t4, t3, 1898f
                  slli         t5, s2, 26
                  c.xor        s1, s0
                  div          s7, s5, a5
                  c.xor        a2, a3
                  c.srai       a4, 20
                  sra          t0, s6, t1
                  c.andi       a2, -1
                  sll          a6, s11, a6
                  c.lui        s9, 31
                  ori          s11, a5, 711
                  add          s1, s2, s10
                  xori         a4, a2, -194
                  c.srai       a2, 31
                  mulhsu       t3, t4, s4
                  sltu         s0, tp, a3
1898:             or           t0, t0, a2
                  and          a6, a3, a6
                  rem          t4, sp, t4
                  srai         s4, t6, 22
                  xori         ra, a5, -1195
                  c.beqz       a4, 1911f
                  c.xor        s0, a2
                  mul          gp, s10, tp
                  mul          t3, s7, a1
                  blt          t5, zero, 1908f
1908:             slli         gp, t0, 7
                  c.srli       a5, 25
                  c.lui        s7, 4
1911:             divu         t4, sp, t5
                  xori         sp, s6, 2007
                  slti         a5, a6, -2032
                  slt          ra, s9, a5
                  c.addi4spn   a4, sp, 944
                  c.andi       a3, 7
                  c.addi       t5, -1
                  xori         a6, s7, -1142
                  c.addi4spn   s1, sp, 464
                  c.xor        a3, s0
                  srli         s4, s1, 22
                  xor          s7, s0, t4
                  xor          t4, gp, t6
                  sltu         s6, s7, s10
                  c.addi       a6, -1
                  addi         s11, a3, 76
                  xor          s6, a4, zero
                  c.li         gp, 11
                  and          a7, a6, s3
                  c.nop
                  mulhu        tp, zero, s3
                  c.beqz       a4, 1936f
                  andi         t5, gp, 1691
                  c.addi4spn   a2, sp, 416
                  c.add        s10, t1
1936:             xor          t4, s5, gp
                  c.add        s1, s4
                  sltu         s1, t2, s5
                  slti         t4, a5, 587
                  c.add        s4, a2
                  andi         t3, a2, -1054
                  remu         a6, zero, a4
                  mul          t5, gp, s0
                  sub          s6, s5, a5
                  beq          s11, s4, 1953f
                  blt          a1, t3, 1955f
                  andi         s11, s10, 287
                  c.mv         sp, t2
                  c.sub        s0, a0
                  c.nop
                  sub          a4, a5, t5
                  sltiu        a5, s7, 1620
1953:             or           s0, t4, s0
                  c.srai       a1, 29
1955:             bltu         t2, sp, 1965f
                  c.slli       t1, 13
                  mul          t5, s11, t1
                  c.lui        s1, 20
                  divu         t5, s3, a3
                  andi         a7, s1, -261
                  and          a3, t4, s7
                  bge          s0, a0, 1977f
                  c.lui        s10, 6
                  c.addi4spn   s1, sp, 816
1965:             c.bnez       a3, 1983f
                  blt          s0, s4, 1981f
                  c.bnez       a1, 1975f
                  c.srai       a1, 15
                  c.xor        a5, a2
                  sub          a6, t1, gp
                  rem          t1, s11, s6
                  c.addi16sp   sp, 208
                  add          a7, s8, a3
                  slli         s11, t5, 18
1975:             c.slli       t2, 12
                  c.srai       a3, 10
1977:             bge          tp, s1, 1986f
                  beq          a2, s5, 1981f
                  sra          t5, sp, a5
                  beq          t0, s1, 1984f
1981:             sub          s6, t4, t4
                  slt          s11, a4, s5
1983:             srl          s8, s10, gp
1984:             nop
                  slti         t4, s6, 1500
1986:             add          s9, a0, t6
                  c.bnez       a3, 2004f
                  c.xor        s1, a3
                  mulhu        s3, t2, s2
                  div          t1, s8, s0
                  c.or         a2, a1
                  c.li         t0, 17
                  ori          a5, sp, 1338
                  srli         s11, a1, 8
                  divu         t2, s3, s10
                  rem          t0, s3, a4
                  c.addi4spn   a4, sp, 80
                  mulhu        gp, s6, t3
                  mulhsu       s9, s5, s9
                  remu         a6, s7, s9
                  c.xor        a3, a0
                  addi         s0, s1, 142
                  c.srli       a2, 6
2004:             sltu         t3, s1, a6
                  or           s1, a2, t5
                  andi         zero, t6, 1630
                  c.add        s10, a3
                  sra          s4, s9, s1
                  sltu         s4, gp, s2
                  mulhu        a6, a6, t0
                  sltu         s1, t3, s3
                  c.beqz       a2, 2022f
                  divu         a6, t0, t0
                  slti         zero, a0, 1136
                  slt          t6, t5, s7
                  slti         s1, t3, -2043
                  srai         t2, s6, 29
                  sll          a3, t1, a4
                  slli         t2, a7, 24
                  c.slli       tp, 22
                  auipc        s3, 417586
2022:             sub          t5, zero, t3
                  c.addi       gp, -1
                  lui          tp, 847135
                  sltiu        s3, a6, -158
                  c.sub        a3, a2
                  c.sub        a5, a3
                  addi         tp, s1, 1867
                  c.sub        a3, a1
                  srl          t5, s4, a0
                  divu         a1, t3, t2
                  sll          t6, s4, ra
                  sub          t2, t6, t6
                  ori          a3, s5, 71
                  c.srai       s1, 28
                  c.and        s0, a4
                  andi         s9, tp, -1453
                  mulh         s8, s3, s6
                  mulhu        s10, t1, t5
                  srli         s0, t6, 5
                  c.add        s6, a0
                  xori         s6, t1, -1583
                  c.or         a5, a1
                  bne          t5, t1, 2054f
                  slt          s1, a7, t3
                  c.addi4spn   a1, sp, 208
                  auipc        s1, 641750
                  remu         ra, s4, s4
                  c.li         t2, 18
                  divu         s10, s3, s3
                  c.mv         t3, tp
                  c.li         t1, -1
                  and          s11, a7, a2
2054:             sltiu        s4, s10, -451
                  blt          s3, s4, 2063f
                  c.addi       a1, -1
                  lui          s4, 983877
                  auipc        t2, 996778
                  add          t6, s0, a2
                  sltiu        t3, s5, -880
                  sll          s4, t6, t0
                  c.andi       s0, 0
2063:             c.li         a3, 17
                  mulhu        t0, a2, s10
                  c.sub        a3, a5
                  mul          t4, s5, t6
                  auipc        tp, 147477
                  xori         s10, s1, -511
                  c.nop
                  or           t0, s1, s10
                  slli         ra, s0, 10
                  c.add        sp, t5
                  c.slli       s9, 29
                  c.addi4spn   a1, sp, 48
                  sltiu        zero, s3, -1538
                  c.and        a2, a4
                  mulh         s11, zero, s6
                  add          a4, s7, a7
                  c.srai       s1, 7
                  c.bnez       a2, 2081f
2081:             xor          s1, s3, t6
                  c.addi4spn   a5, sp, 624
                  add          s3, t5, a3
                  c.li         s4, 27
                  c.sub        a5, a3
                  c.addi4spn   a1, sp, 912
                  c.add        s1, s0
                  sltu         s9, t1, gp
                  c.add        s11, s2
                  c.srli       s0, 3
                  or           s8, s10, s8
                  mulhsu       a2, s10, t3
                  sltiu        t0, s9, -54
                  mulh         t4, a5, sp
                  mul          t2, t1, s0
                  slt          t2, t4, a7
                  c.nop
                  beq          a5, s3, 2117f
                  c.lui        s3, 7
                  xor          a6, t3, zero
                  c.li         sp, -1
                  c.beqz       a3, 2117f
                  mul          gp, s5, s4
                  nop
                  c.xor        a2, s1
                  bltu         zero, t5, 2107f
2107:             slli         t0, s6, 9
                  sltiu        ra, gp, 1348
                  c.addi       a5, -1
                  sll          s11, sp, s2
                  c.addi4spn   s0, sp, 32
                  xori         s3, zero, 141
                  mulhsu       s10, a7, t5
                  c.or         a4, a3
                  div          a7, a2, t5
                  nop
2117:             slli         s0, a5, 8
                  sll          s9, a5, s9
                  bge          s10, a7, 2131f
                  srai         t6, t3, 20
                  lui          a7, 401933
                  blt          a5, a3, 2140f
                  add          s9, tp, s8
                  c.nop
                  mulhsu       a4, t3, t5
                  c.lui        t5, 7
                  nop
                  bne          t5, tp, 2136f
                  srli         t3, s6, 0
                  beq          a6, s8, 2134f
2131:             mul          s11, a1, a6
                  c.sub        a3, s0
                  mulhsu       s1, a7, a6
2134:             slli         s4, s6, 4
                  c.mv         gp, t3
2136:             mulhu        gp, a7, t6
                  blt          s6, t2, 2154f
                  nop
                  blt          s2, a7, 2147f
2140:             c.li         s9, -1
                  srl          a2, s7, s3
                  c.lui        a5, 21
                  c.mv         s4, t6
                  c.addi       t5, -1
                  c.nop
                  c.li         ra, -1
2147:             sra          t0, t2, s5
                  bltu         t5, a0, 2152f
                  divu         s8, a2, s3
                  c.xor        a3, a4
                  c.nop
2152:             srli         s1, s3, 4
                  divu         a2, tp, t4
2154:             slt          a3, t3, sp
                  bne          tp, s7, 2164f
                  blt          a7, t0, 2157f
2157:             blt          a6, s4, 2158f
2158:             c.andi       a4, -1
                  c.xor        s0, a1
                  auipc        t2, 551284
                  c.srai       s0, 3
                  mulhu        a5, tp, s2
                  sltu         ra, s1, s6
2164:             c.lui        t2, 12
                  c.li         t5, 19
                  xori         tp, tp, -818
                  or           s11, a1, a4
                  slli         t3, t1, 9
                  bgeu         a0, a1, 2182f
                  c.addi       gp, 29
                  c.srli       a3, 16
                  c.addi       a6, 29
                  c.or         a4, s0
                  bge          ra, zero, 2189f
                  c.slli       t0, 3
                  c.addi4spn   a5, sp, 784
                  andi         a2, s10, -1019
                  bne          s4, s2, 2182f
                  slti         t2, t6, -1867
                  div          t5, tp, s6
                  ori          a3, zero, 290
2182:             c.lui        t2, 4
                  c.lui        t3, 13
                  c.li         a7, -1
                  c.add        a7, s6
                  c.add        s11, sp
                  slti         t3, sp, 2002
                  andi         t0, ra, 1014
2189:             blt          a3, s0, 2198f
                  c.beqz       s1, 2206f
                  c.addi4spn   a4, sp, 752
                  c.srai       a1, 27
                  c.add        gp, a0
                  slti         t3, ra, -945
                  c.slli       tp, 13
                  or           gp, a1, s8
                  c.addi       s1, 6
2198:             sltu         a5, a3, t6
                  c.sub        a2, a5
                  c.and        a1, a5
                  beq          s2, t1, 2216f
                  addi         a2, a3, -610
                  slt          s1, s11, t3
                  mulhu        s3, s10, a5
                  div          sp, tp, a1
2206:             div          t6, ra, s4
                  c.bnez       s0, 2212f
                  xor          t4, t6, s2
                  ori          s1, a7, 1121
                  c.bnez       a4, 2220f
                  slt          sp, ra, ra
2212:             sub          t4, sp, a5
                  bgeu         gp, t1, 2232f
                  bge          a3, a0, 2233f
                  mulh         s0, tp, s9
2216:             c.nop
                  bge          t5, s6, 2221f
                  and          a5, a2, s7
                  blt          a6, a6, 2236f
2220:             c.andi       a1, -1
2221:             rem          ra, s8, a7
                  c.li         s10, 27
                  sltu         t5, tp, s3
                  slt          a6, a1, s8
                  c.srai       a3, 30
                  ori          t2, t6, -237
                  and          sp, s9, ra
                  andi         gp, s5, -964
                  c.mv         tp, s11
                  bltu         a7, s11, 2235f
                  bne          a2, s6, 2232f
2232:             c.or         a1, a2
2233:             remu         zero, sp, s2
                  bge          a4, t1, 2243f
2235:             sra          s8, t4, s11
2236:             c.andi       a2, -1
                  c.sub        a2, a4
                  slti         t6, a0, -164
                  c.sub        s1, a3
                  bge          t1, a6, 2253f
                  c.addi       s7, 9
                  c.srai       a4, 31
2243:             divu         s9, a6, t2
                  nop
                  bltu         s0, s0, 2261f
                  xori         tp, ra, -887
                  andi         a6, gp, 699
                  c.bnez       a4, 2252f
                  c.andi       a1, -1
                  c.add        t2, t2
                  sll          a2, s5, a5
2252:             rem          s0, s2, t0
2253:             c.add        tp, s2
                  ori          t6, s1, 971
                  lui          t4, 373550
                  divu         a4, s6, t5
                  c.addi       t5, 2
                  c.bnez       s1, 2267f
                  c.mv         s8, s5
                  bge          s1, s1, 2277f
2261:             c.slli       s11, 10
                  slti         a5, a0, 340
                  rem          s9, a1, s0
                  srl          a2, a6, s10
                  beq          a1, s6, 2266f
2266:             sub          s9, a1, a0
2267:             c.mv         s3, tp
                  mulhsu       s7, s6, t6
                  addi         s1, t6, 1944
                  c.srli       s1, 20
                  c.xor        a4, a1
                  slt          t3, s3, a2
                  and          gp, s3, s7
                  auipc        zero, 449091
                  c.xor        a3, a3
                  xori         s3, s10, -421
2277:             xor          a4, t0, a0
                  c.addi       a2, -1
                  slti         s9, t4, 632
                  c.andi       a5, 1
                  xor          t0, t1, a2
                  bltu         sp, a0, 2297f
                  c.li         t6, -1
                  divu         a7, a1, a3
                  c.addi4spn   a5, sp, 176
                  or           a3, a7, t4
                  c.andi       a4, -1
                  c.add        s1, a3
                  sll          t3, s10, t4
                  c.addi       s7, -1
                  mulhsu       t1, t5, s10
                  c.nop
                  c.nop
                  c.beqz       a1, 2309f
                  sll          s4, a0, t2
                  c.lui        t2, 27
2297:             c.or         a2, s0
                  c.srai       a5, 16
                  c.nop
                  lui          s6, 273777
                  c.andi       s1, -1
                  and          a1, t4, s9
                  beq          s8, a4, 2311f
                  bne          t2, t4, 2313f
                  c.bnez       a3, 2308f
                  div          ra, t0, s11
                  slti         a1, a6, -1499
2308:             mul          s7, s8, s11
2309:             lui          a2, 96030
                  lui          t6, 250453
2311:             addi         a1, s6, -1705
                  c.lui        a6, 22
2313:             c.bnez       s1, 2323f
                  bge          a7, s3, 2332f
                  sub          s1, a6, s5
                  c.srli       s0, 7
                  nop
                  bgeu         t2, s10, 2319f
2319:             blt          s2, ra, 2338f
                  mul          zero, a5, t2
                  c.addi16sp   sp, -16
                  sltiu        t5, s5, 526
2323:             c.addi4spn   a5, sp, 464
                  and          t5, s1, a3
                  andi         t2, a3, 518
                  c.or         a5, a4
                  sltu         tp, a6, s6
                  c.addi       a7, 5
                  div          s3, a2, s11
                  bne          s3, t6, 2334f
                  mul          t0, a5, s8
2332:             andi         sp, a0, -1440
                  mul          s11, s10, s5
2334:             sll          t4, s3, a0
                  add          t4, s3, a5
                  c.srli       s0, 27
                  sll          t4, t0, sp
2338:             srli         a6, a3, 14
                  divu         a6, s6, s11
                  mul          s6, a0, t0
                  or           gp, sp, a5
                  c.srai       a5, 28
                  andi         ra, s0, 1034
                  or           a2, t4, t1
                  mul          s1, s3, s0
                  mulhsu       s3, t6, ra
                  sra          s8, zero, s8
                  and          s4, s5, t2
                  srli         s0, s0, 17
                  c.lui        t1, 29
                  c.sub        a5, s0
                  c.sub        a3, a4
                  c.and        a4, a3
                  xori         gp, s6, -598
                  srai         t5, a4, 23
                  c.xor        a5, a0
                  auipc        t3, 223093
                  mulhu        a7, s1, s2
                  srai         a3, s4, 31
                  c.addi16sp   sp, 48
                  c.or         a2, a5
                  mulhu        s0, t6, s6
                  divu         t4, a4, a6
                  c.beqz       s0, 2365f
2365:             bne          t2, a0, 2380f
                  sub          t3, t6, a7
                  divu         t6, t3, a3
                  c.nop
                  slti         t1, a6, 1499
                  beq          tp, s1, 2378f
                  bltu         ra, sp, 2375f
                  blt          s10, t3, 2382f
                  sltiu        s4, s4, 1893
                  and          s9, t5, zero
2375:             c.addi4spn   s1, sp, 272
                  c.bnez       a5, 2386f
                  xori         t0, s9, -1507
2378:             nop
                  mulhsu       a2, a1, ra
2380:             c.li         t2, 29
                  mulhu        a3, t2, t6
2382:             srl          s0, s9, a1
                  mulhsu       s10, s5, t0
                  sub          a4, a2, s5
                  blt          a3, a4, 2397f
2386:             sra          t6, sp, s5
                  add          a7, s4, s8
                  sra          a7, s9, s4
                  c.lui        t0, 3
                  c.xor        a5, a1
                  div          t4, a6, a5
                  srai         t4, a6, 24
                  c.xor        s1, a0
                  beq          zero, ra, 2402f
                  blt          a2, s7, 2405f
                  c.add        t5, s11
2397:             c.srai       a3, 9
                  srl          s10, s6, s11
                  add          gp, zero, s9
                  c.lui        s9, 21
                  addi         a6, t6, 781
2402:             add          s3, s11, s9
                  div          t2, a3, s5
                  c.beqz       a1, 2412f
2405:             srli         a6, s0, 10
                  c.addi16sp   sp, -16
                  blt          t3, a1, 2419f
                  mulh         s6, s2, s11
                  and          a7, a3, s11
                  ori          s3, sp, 597
                  slt          s1, a0, s2
2412:             rem          a7, gp, s10
                  c.nop
                  bge          s5, a3, 2431f
                  bne          a3, sp, 2430f
                  sltiu        s11, s8, -1311
                  c.slli       s0, 18
                  sub          s8, s2, t3
2419:             slli         s4, s10, 1
                  slli         t4, t0, 30
                  sub          a6, ra, sp
                  nop
                  bltu         t6, t2, 2441f
                  mulhsu       s10, t0, t5
                  mul          zero, s3, s7
                  add          a3, t4, a3
                  add          s6, a2, zero
                  sltu         s1, t3, s7
                  c.li         a2, -1
2430:             andi         t4, t2, 1255
2431:             andi         a2, a0, 1474
                  c.andi       a1, -1
                  mul          s8, s0, zero
                  bge          s10, t1, 2444f
                  mulhu        a3, s9, tp
                  div          s8, t4, s9
                  bne          sp, sp, 2445f
                  srai         t6, s11, 22
                  srli         t3, s3, 28
                  c.nop
2441:             c.or         s0, a2
                  remu         tp, ra, ra
                  divu         s6, s3, t4
2444:             c.add        t3, t0
2445:             srli         sp, t4, 2
                  sll          t3, gp, a5
                  remu         a7, t2, a5
                  c.slli       tp, 10
                  srl          t2, a4, a5
                  ori          t5, s9, 1798
                  nop
                  c.beqz       a5, 2456f
                  beq          a1, s9, 2462f
                  beq          a1, ra, 2473f
                  or           a4, s1, t5
2456:             bne          s10, s4, 2459f
                  add          t5, t4, s10
                  slli         s7, t0, 11
2459:             andi         t0, s10, -1858
                  c.slli       s6, 21
                  div          a5, gp, t3
2462:             and          s11, a7, a6
                  lui          a2, 626449
                  lui          t3, 38632
                  or           s9, t4, t3
                  c.xor        a4, s0
                  ori          s7, t5, -545
                  sub          s3, a4, zero
                  div          a3, t3, sp
                  c.mv         s9, t6
                  remu         a3, sp, a2
                  bge          a5, t1, 2487f
2473:             blt          s11, s8, 2488f
                  lui          t0, 940539
                  mulhu        s8, a5, s8
                  bne          t2, sp, 2492f
                  c.slli       s0, 18
                  slt          s9, t1, t3
                  c.beqz       s0, 2498f
                  slli         s10, a6, 8
                  bltu         s6, sp, 2482f
2482:             c.addi16sp   sp, 432
                  sll          s10, t0, s3
                  srl          t3, a3, s10
                  slt          t0, gp, s10
                  auipc        t0, 630283
2487:             sra          a6, t3, s7
2488:             andi         a2, a7, -528
                  mulhu        t2, t5, t6
                  c.nop
                  sra          ra, a2, t1
2492:             srl          t4, a4, s8
                  sltiu        s8, s9, -106
                  c.beqz       a2, 2502f
                  c.srli       a4, 2
                  andi         t5, a1, 1893
                  c.srai       a3, 22
2498:             slti         s3, t4, 143
                  sltiu        a4, t6, -1514
                  srli         a4, s9, 6
                  c.addi16sp   sp, -16
2502:             and          t4, gp, a0
                  sltu         s0, ra, s11
                  bne          t6, zero, 2521f
                  slti         t2, a1, -602
                  addi         s1, s8, -1997
                  sltiu        zero, gp, 1418
                  sll          t1, s1, s0
                  bltu         s7, t5, 2513f
                  rem          t4, s1, sp
                  mulh         t3, s10, gp
                  c.addi4spn   s1, sp, 96
2513:             c.mv         s3, t0
                  or           a7, a7, s0
                  mul          t4, a7, s7
                  and          s0, t6, s11
                  slti         s7, s9, 344
                  xori         s4, a4, -365
                  xori         t3, s0, 1591
                  slti         s3, a1, 1853
2521:             mulh         t0, t1, t4
                  lui          s3, 1026753
                  slli         s8, a0, 21
                  c.addi       s6, 22
                  sra          a3, s5, s4
                  sub          t6, s7, s6
                  c.andi       a1, 22
                  c.andi       a2, 20
                  ori          t1, tp, -332
                  bne          s10, a2, 2531f
2531:             c.add        tp, a6
                  xori         sp, s1, 1360
                  nop
                  or           t2, s3, tp
                  lui          tp, 438167
                  c.addi16sp   sp, -16
                  c.add        s8, t3
                  c.and        a4, a0
                  c.or         a2, a1
                  rem          t6, s10, s10
                  divu         t1, s4, s9
                  ori          s1, t2, -1586
                  sub          t5, s0, tp
                  beq          t4, a6, 2554f
                  c.mv         s9, t5
                  andi         a6, t1, -1132
                  ori          gp, s4, -123
                  lui          tp, 403093
                  c.addi       s8, -1
                  mulh         t4, t3, t5
                  addi         s8, a2, 984
                  addi         s1, sp, 1102
                  sll          s8, a2, a5
2554:             sub          s9, s8, t0
                  slti         s6, a3, -665
                  c.nop
                  remu         t3, gp, a5
                  sltiu        t6, a5, 1403
                  c.li         s0, -1
                  remu         s9, t1, a7
                  bge          s8, t4, 2566f
                  auipc        s10, 941768
                  c.addi16sp   sp, -16
                  c.lui        s7, 28
                  blt          a5, s7, 2566f
2566:             srai         t0, a2, 30
                  mul          a4, a2, s4
                  divu         t0, s3, a7
                  c.beqz       a3, 2578f
                  c.addi16sp   sp, -16
                  c.and        a5, a0
                  divu         sp, t4, t2
                  c.andi       a1, -1
                  blt          s7, a5, 2575f
2575:             c.sub        s0, a2
                  slli         t3, a1, 16
                  srl          t4, tp, t2
2578:             nop
                  sltiu        sp, s10, -23
                  xori         a4, a1, 808
                  slt          s11, s1, a6
                  c.li         s1, -1
                  sltiu        s1, s2, 2013
                  srai         s10, a2, 21
                  c.addi16sp   sp, -16
                  c.and        a3, s0
                  c.addi       s9, -1
                  sub          tp, sp, t3
                  lui          s1, 296404
                  mul          a7, a0, s4
                  bltu         s7, ra, 2595f
                  bge          t6, s10, 2601f
                  add          s7, a3, sp
                  c.addi       a6, 6
2595:             sltiu        t1, a6, -1572
                  c.srai       s0, 12
                  c.srai       a1, 25
                  c.nop
                  rem          t4, s7, a3
                  srl          a1, sp, s4
2601:             divu         a4, t3, t2
                  c.sub        a4, a4
                  c.srai       a5, 4
                  divu         s0, a1, a1
                  mulh         t3, t4, a1
                  c.li         t0, -1
                  c.beqz       a2, 2611f
                  or           s7, tp, tp
                  or           a5, sp, a4
                  bge          s0, ra, 2623f
2611:             c.add        a1, s6
                  c.lui        a7, 23
                  c.or         a2, s1
                  srl          s6, t1, s1
                  slti         a4, t1, 1238
                  srli         t2, s4, 27
                  c.andi       s1, -1
                  c.slli       a6, 22
                  bge          a0, s5, 2629f
                  mulh         a3, s6, a5
                  nop
                  c.srai       a3, 12
2623:             c.nop
                  addi         tp, tp, -1200
                  c.srai       a3, 11
                  addi         a6, s6, -1852
                  c.mv         s11, sp
                  mulhsu       t1, a4, s10
2629:             auipc        a7, 56979
                  c.andi       a5, 14
                  bne          ra, t5, 2650f
                  mul          a3, a4, zero
                  auipc        s9, 313161
                  c.li         t3, 20
                  xor          s11, a3, t5
                  bltu         t0, s3, 2641f
                  bne          t2, s11, 2645f
                  bne          t2, t2, 2639f
2639:             bgeu         s4, s10, 2640f
2640:             c.xor        a1, s0
2641:             c.and        s1, a4
                  divu         s9, a2, s2
                  c.li         s8, -1
                  bltu         a3, sp, 2661f
2645:             c.andi       s1, -1
                  c.srli       a3, 20
                  bge          t4, s0, 2655f
                  c.lui        t5, 19
                  bltu         a3, sp, 2664f
2650:             mulhu        s4, a0, a1
                  sltiu        a2, s7, 701
                  add          t2, a4, s3
                  srai         t4, t1, 15
                  add          s1, s4, a7
2655:             rem          t0, t1, s10
                  mulh         s1, a6, t0
                  bne          s11, tp, 2661f
                  c.nop
                  sub          t6, a7, s6
                  sltiu        s9, a2, 86
2661:             beq          a7, zero, 2680f
                  divu         t1, t4, t0
                  add          s8, s0, t2
2664:             c.xor        a1, s0
                  divu         t4, s9, s0
                  mul          a7, t1, s7
                  bge          a1, t4, 2676f
                  addi         s10, t5, 1936
                  c.srli       s0, 3
                  c.addi16sp   sp, 112
                  divu         t1, a1, t4
                  bne          s11, s5, 2675f
                  c.lui        tp, 7
                  add          s10, s7, s6
2675:             div          s3, t2, a3
2676:             nop
                  c.andi       a1, 13
                  sltiu        s0, s4, 780
                  c.mv         s8, s6
2680:             bge          a0, a1, 2695f
                  c.srli       a2, 30
                  c.beqz       s1, 2686f
                  blt          t1, t1, 2699f
                  divu         a7, ra, a2
                  sub          gp, s0, a7
2686:             c.bnez       s0, 2694f
                  divu         t6, s6, a3
                  c.and        s1, a2
                  rem          a6, s9, s1
                  xori         a5, a1, -178
                  sltiu        tp, sp, -885
                  c.nop
                  auipc        s8, 1028260
2694:             c.li         s9, 18
2695:             c.beqz       a1, 2707f
                  sltu         s9, t1, tp
                  mulh         t1, a1, a0
                  c.add        s4, t0
2699:             c.addi4spn   a5, sp, 496
                  srli         t4, s1, 19
                  mulhsu       a3, s8, a4
                  sltiu        a3, t6, -114
                  c.andi       a5, -1
                  rem          tp, s11, s0
                  c.xor        a3, a0
                  c.lui        s8, 3
2707:             srl          s8, t2, a5
                  sub          a5, t3, t4
                  slt          t5, s9, gp
                  addi         a6, s6, -1922
                  c.li         t1, -1
                  bne          s9, s10, 2713f
2713:             c.mv         t1, t2
                  c.xor        a3, a5
                  sll          t1, a5, a3
                  and          t5, t1, a2
                  ori          t2, s6, -640
                  lui          tp, 627765
                  c.mv         t0, s9
                  slli         t5, s4, 31
                  mulhsu       s9, t3, a6
                  mul          s8, t0, zero
                  c.addi4spn   a4, sp, 528
                  slti         ra, s1, 1413
                  rem          a1, s8, t4
                  c.addi16sp   sp, 48
                  c.addi16sp   sp, -16
                  div          a5, s0, t0
                  slt          a4, a7, t5
                  beq          a5, s1, 2748f
                  srl          a2, a5, s0
                  c.lui        a6, 12
                  sub          s8, s7, a5
                  srl          zero, a0, s8
                  sub          s7, a2, s6
                  and          s1, s11, a6
                  lui          s0, 363024
                  auipc        a6, 330372
                  c.bnez       s1, 2749f
                  bge          s10, t1, 2749f
                  c.lui        a6, 30
                  c.addi4spn   a1, sp, 832
                  c.addi4spn   a3, sp, 80
                  lui          s6, 610176
                  srai         s6, t6, 18
                  and          a3, s6, s1
                  bne          gp, t2, 2760f
2748:             addi         s3, ra, -1025
2749:             c.add        s1, a5
                  c.addi       sp, -1
                  nop
                  divu         s8, a2, sp
                  div          t2, s10, t2
                  c.xor        a1, a1
                  divu         a6, s3, t2
                  lui          gp, 1036009
                  slt          gp, t3, s11
                  c.srai       a2, 3
                  c.beqz       a3, 2768f
2760:             sltu         t5, s7, a0
                  bgeu         tp, t3, 2771f
                  sub          zero, t1, a6
                  c.andi       a2, -1
                  xori         s7, t1, 69
                  lui          a5, 24310
                  srli         ra, s4, 18
                  c.addi       t0, 14
2768:             sub          t4, zero, t1
                  c.add        sp, s9
                  beq          t0, s10, 2771f
2771:             slt          t5, t2, t0
                  c.slli       s0, 16
                  or           s10, a1, a1
                  div          ra, t6, s3
                  bltu         s0, s5, 2792f
                  c.addi       t0, -1
                  c.lui        t3, 9
                  mulhu        s9, s6, ra
                  mul          ra, s6, t0
                  andi         a2, s3, -391
                  c.bnez       a2, 2796f
                  c.and        s0, a1
                  divu         s9, s9, a3
                  mulhsu       t3, t3, ra
                  c.andi       s0, -1
                  c.sub        a3, a0
                  sltiu        s4, s1, 639
                  c.beqz       s1, 2792f
                  c.andi       s1, -1
                  c.slli       a1, 16
                  c.or         s0, s0
2792:             nop
                  c.sub        s0, a3
                  xor          s9, s1, a1
                  beq          s6, t4, 2799f
2796:             and          tp, gp, s3
                  mulhu        t2, a7, zero
                  srl          sp, s0, s1
2799:             srl          a6, s11, ra
                  andi         a3, s8, -514
                  sltiu        a3, s3, 298
                  xor          s6, s0, t2
                  ori          t0, s6, 1136
                  mul          t5, a1, s4
                  c.addi4spn   s1, sp, 320
                  c.addi       s6, 3
                  c.nop
                  xor          a4, t3, a3
                  sltu         t4, tp, ra
                  bge          zero, t4, 2825f
                  mulhu        a1, s9, ra
                  blt          a5, a0, 2822f
                  c.bnez       s1, 2823f
                  andi         s6, s5, 46
                  srl          s8, s9, t0
                  mulh         s9, t4, s6
                  lui          t5, 493430
                  addi         a1, tp, -1272
                  sll          s8, t2, a6
                  c.addi       t0, -1
                  add          s1, s3, t4
2822:             c.addi16sp   sp, 16
2823:             bge          zero, gp, 2827f
                  divu         t3, s3, t5
2825:             sltu         s4, s2, zero
                  xori         t2, t1, -1060
2827:             c.xor        s0, a0
                  mulhsu       gp, s2, a3
                  slt          t2, s10, a0
                  andi         t6, s8, 1233
                  c.addi16sp   sp, 336
                  c.beqz       a5, 2851f
                  div          s6, a5, t1
                  mulhsu       a2, sp, zero
                  c.addi4spn   a3, sp, 160
                  add          a2, s3, s3
                  bne          s0, sp, 2852f
                  bne          s4, s2, 2846f
                  mul          s8, s8, s3
                  c.lui        tp, 28
                  c.li         ra, -1
                  c.beqz       a5, 2847f
                  la           t1, amo_0+60 #start riscv_lr_sc_instr_stream_1
                  c.nop
                  mulhu        t3, ra, gp
                  divu         s11, ra, sp
                  lr.w.aq       ra, (t1)
                  c.or         s0, a3
                  sc.w.aq       s10, s4, (t1) #end riscv_lr_sc_instr_stream_1
                  xor          s7, s9, a1
                  c.slli       t3, 30
                  c.mv         t2, gp
2846:             beq          a3, t5, 2858f
2847:             c.mv         a4, s8
                  mul          s0, a1, a1
                  c.lui        t4, 17
                  c.srli       a5, 20
2851:             sra          a1, s0, s10
2852:             xori         a7, gp, 488
                  c.addi4spn   a1, sp, 736
                  c.addi4spn   a2, sp, 656
                  rem          s8, a1, t6
                  c.li         s6, 6
                  mul          s1, t4, s4
2858:             srai         s1, a0, 7
                  bgeu         s2, s7, 2866f
                  blt          s8, s8, 2861f
2861:             sub          s6, t5, t3
                  sub          a1, s3, t0
                  c.mv         a6, sp
                  blt          t6, s5, 2866f
                  beq          t3, a1, 2866f
2866:             divu         s9, a6, t5
                  andi         s11, s9, -625
                  lw           t3, 4(s5)
                  ori          sp, s10, -817
                  addi         s5, s5, 60
                  c.nop
5095:             addi x9, x28, 1
5095:             c.jalr x9
sub_1:            c.and        a5, a0
                  or           s6, t6, t0
                  addi         s5, s5, -44
                  c.and        a3, a2
                  or           a5, t1, s2
                  c.slli       t5, 11
                  sll          zero, t5, zero
                  c.andi       a3, 10
                  slti         s8, sp, -410
                  c.nop
                  sw           t3, 4(s5)
                  ori          s6, a4, -58
                  c.andi       a3, 0
                  c.srli       a1, 25
                  c.addi16sp   sp, -16
                  c.srli       a5, 14
                  bne          t6, t2, sub_1_j2 #branch to jump instr
                  c.addi4spn   a1, sp, 80
                  sub          a7, a6, a4
                  remu         t4, a2, s4
sub_1_j2:         jal          t3, sub_2 #jump sub_1 -> sub_2
                  add          a7, gp, a0
                  la           a3, sub_2
                  addi         a3, a3, -493
                  c.and        a5, a2
                  c.and        a2, a2
                  addi         t3, ra, -1679
                  rem          s0, zero, a4
                  mul          a4, s0, tp
                  rem          tp, t4, s9
                  xori         s8, t2, -1398
                  remu         s3, t6, a6
                  sub          a6, t5, a2
sub_1_j3:         jalr         t3, a3, 494 #jump sub_1 -> sub_2
                  c.addi16sp   sp, 272
                  c.or         s1, a2
                  lui          s9, 923621
                  c.sub        s1, a2
                  srl          s9, zero, s7
                  div          t2, ra, a4
                  c.or         s1, a2
                  lui          s3, 513981
                  srli         t4, s1, 11
                  c.lui        s10, 22
                  c.sub        s0, a1
                  c.add        tp, t3
                  c.addi4spn   a1, sp, 528
                  c.sub        a5, a5
                  c.beqz       a2, 25f
                  bgeu         s5, t4, 29f
                  and          t2, s3, t2
                  auipc        gp, 199891
                  bgeu         a7, tp, 28f
                  c.srli       s1, 21
                  srli         t0, t3, 20
                  mulh         s8, s10, s3
                  xori         s9, s9, -869
                  beq          t3, t5, 26f
                  slli         a4, a3, 26
25:               c.lui        t3, 25
26:               c.srai       a4, 5
                  srai         s1, a6, 28
28:               c.nop
29:               beq          a4, a1, 48f
                  srl          a4, a1, s7
                  bgeu         gp, t2, 36f
                  c.or         s1, s0
                  bne          gp, a4, 46f
                  c.nop
                  c.xor        s1, a3
36:               auipc        a1, 844192
                  c.slli       t3, 17
                  c.or         s1, a4
                  rem          zero, t0, t2
                  c.or         a3, s0
                  c.addi16sp   sp, -16
                  remu         t2, a5, s3
                  mulhsu       sp, sp, s0
                  c.addi16sp   sp, 288
                  srl          s9, s7, s11
46:               lui          a5, 170807
                  c.mv         t3, t4
48:               sltiu        t6, zero, -736
                  srai         a1, s8, 19
                  c.bnez       a4, 55f
                  mulhu        tp, s9, s6
                  srai         s10, s9, 28
                  c.bnez       s1, 55f
                  c.and        a1, a2
55:               c.andi       a2, -1
                  sll          s7, s1, a6
                  c.beqz       a2, 62f
                  c.srli       a2, 30
                  rem          t5, s6, a0
                  c.bnez       a5, 70f
                  sltu         a6, s4, sp
62:               sltu         a5, a3, a2
                  c.bnez       s1, 67f
                  sltu         t4, s9, t0
                  divu         tp, s7, a6
                  nop
67:               remu         ra, s8, zero
                  c.addi16sp   sp, -16
                  andi         t2, s0, 1049
70:               add          a2, a7, t1
                  lw           t3, 4(s5)
                  add          s10, s5, t5
                  slti         zero, ra, -1805
                  addi         s5, s5, 44
                  c.or         s0, a2
110:              addi x20, x28, 0
110:              c.jalr x20
sub_2:            bne          ra, s7, sub_2_stack_p
sub_2_stack_p:    addi         s5, s5, -60
                  c.li         a4, 22
                  sw           t3, 4(s5)
                  c.add        t5, t1
                  sll          t0, s10, t2
                  remu         s11, s5, a3
                  slt          t6, a1, a0
                  c.mv         a5, a7
                  srai         s11, t0, 8
                  nop
                  or           s7, t0, t6
                  c.srli       a1, 15
                  bge          a4, s9, sub_2_j4 #branch to jump instr
                  srli         s1, a0, 21
                  sltiu        s8, t1, 951
                  c.slli       t3, 31
sub_2_j4:         jal          t3, sub_3 #jump sub_2 -> sub_3
                  c.beqz       a3, 10f
                  andi         a3, s3, 986
                  sltu         s8, a3, t0
                  c.lui        a7, 31
                  or           t2, t2, tp
                  xor          s1, a1, t3
                  mulhsu       t6, s9, t4
                  srl          a7, s3, s4
                  srl          t0, sp, s7
                  addi         zero, s9, 1797
10:               c.and        s1, s0
                  c.srai       s0, 20
                  sra          s6, ra, a3
                  div          s4, s0, a7
                  divu         s7, s7, ra
                  lw           t3, 4(s5)
                  addi         s5, s5, 60
                  slt          sp, s10, t0
                  sub          s7, t3, a1
37:               addi x15, x28, 1
37:               c.jr x15
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
.word 0xb2df5c26, 0x9949e065, 0x981269f0, 0xa630ad43, 0x1fe71c1f, 0xb715659b, 0x1edc5533, 0xc78d8867
.word 0x6d3b31d7, 0x106ff22c, 0x5d42993e, 0x9c4ed6b7, 0x7f7d34ee, 0xad1fc5cc, 0x2f360d79, 0xf8b1be93
.word 0x7ab11f1e, 0xfb3f9673, 0xbd2e399c, 0xa8705a18, 0x3a0f2b3f, 0xa71e1105, 0x673d9100, 0xb1b27692
.word 0x1a868251, 0x1ecdbf0e, 0x5888c351, 0x5d3221dc, 0xe45c5ece, 0x6e2f8edb, 0xc622667f, 0x7e48bf72
.word 0x0f3104a4, 0x592f996f, 0xb94dc484, 0x07d73043, 0x52231ca2, 0x2e400ec0, 0x68deb892, 0xfa2d44b9
.word 0xb010bb11, 0xe1a55008, 0x5d82e4a5, 0x77ec32ca, 0x9d1a7fc0, 0x324c1080, 0xea36e8b6, 0x76c6a77f
.word 0x088e61e1, 0x3360ed44, 0x085b30b2, 0x281b8f12, 0xc44999db, 0x169856bb, 0xae51d556, 0x0fdcdcc7
.word 0xd25dfa93, 0x1db8396a, 0xd13b152f, 0x76fa7cc6, 0x20a16c43, 0x021c350c, 0x1925ac7b, 0xe71bf017
.word 0xb4a2c408, 0x34a897f1, 0xc666f33e, 0x8ad5acaf, 0x797cad39, 0xc052cf08, 0x2edd0fe9, 0xdc2718ff
.word 0x70472c4d, 0x2d2c72dc, 0xfe9aa0ea, 0x51101991, 0xfd4f17cf, 0xd952c820, 0x054feef5, 0x044f321d
.word 0x2ff1b717, 0xfcbd652d, 0xefd2e44e, 0x438b8ace, 0xb1f3eb21, 0xa1189dfe, 0x33a059f0, 0x226becca
.word 0xd5ba568f, 0x92f16061, 0x1df9bbae, 0xbbc3032b, 0x7763e90c, 0x6ad97db8, 0xe04143a7, 0x882e4e48
.word 0x33922a6a, 0x83c0fd82, 0x681f765a, 0xb23dc0dc, 0x652b900d, 0x082438fa, 0xc9c5f101, 0x326caba9
.word 0xabe88b92, 0x70475684, 0xf16205b2, 0xc2d3ca94, 0x184bae2b, 0x91d71bea, 0x0aa88ae7, 0xc438a344
.word 0x4c9bcb26, 0xdde7202d, 0x87c65749, 0x9f52101f, 0x017cc957, 0xdc41c613, 0x6ba9ab6e, 0x6bba8f6a
.word 0x9e740284, 0x897aa104, 0xa55d0dee, 0x5842e1a3, 0x80999b6e, 0xc1129805, 0x044b6f19, 0xbd3a759c
.word 0x4af57c60, 0xad624b04, 0x04050c46, 0xcf252de7, 0x5911f17c, 0x12eb6f08, 0xc0bc36f2, 0xf2bfc250
.word 0x96aaa117, 0x3cad491f, 0x9efb8912, 0x3a820114, 0x4f2cbaa4, 0xa76794df, 0xb43685e1, 0x30368804
.word 0xf0ec74af, 0x2d59a1fa, 0x4e0767b8, 0x6b61eeb7, 0x2e5bc265, 0x9ede2f2b, 0x522e56d0, 0xe34e60d7
.word 0xbed6960d, 0xc99ff0a8, 0xb801d3a2, 0x3ba049e4, 0xd403d9aa, 0xa27a4aa2, 0xb3cca9e3, 0xcf64b76b
.word 0xd6494240, 0x551dd134, 0xa7a2f43e, 0x709be149, 0x214c44c3, 0xba9a5d1a, 0xf36a4cd9, 0x72da63e5
.word 0x144c2a93, 0xb095a731, 0xdff875c2, 0x617aa34a, 0x9d7cde98, 0x5d6948c2, 0x4fab4b3d, 0xe5223332
.word 0xf5ab97da, 0x554f32e7, 0xe2842f7a, 0xec05eba8, 0x832ba66c, 0xbcfe30da, 0xcf271d86, 0xd2a72379
.word 0x0a6ab979, 0xf03c0853, 0xf0755e12, 0x11b8cc99, 0x4c1c26c9, 0x0b00bee0, 0x5b28ec42, 0x329a57d1
.word 0xcd5a384a, 0x96ac69cb, 0xae8ca790, 0x7334c25f, 0x3b18e0a6, 0xb9bdca30, 0x5f8d27e7, 0x83c37481
.word 0xb7f944b8, 0x1c11bf13, 0xd6adb000, 0xbc708364, 0x07c945cd, 0xb427b8b5, 0x8c662b11, 0x8e5f08aa
.word 0xd0bc32ee, 0x60b882b2, 0x7186f87b, 0x83097626, 0x73038aad, 0xb9c8fca0, 0x8848ae5d, 0xb66fe4e3
.word 0xe42d5f6e, 0xb86763e4, 0x1498de5d, 0x445fd860, 0x57b733df, 0x18caff92, 0x241c5364, 0x6fcd7a66
.word 0x11e765c7, 0x0dea6893, 0x1e32f249, 0x48d429f3, 0x55501020, 0x63367b71, 0x33d319a4, 0xa475233e
.word 0x0026c6b8, 0xe8162640, 0x3ebe1bdf, 0x124c8b51, 0xb41945d1, 0x5e9854bb, 0x3db384c4, 0x1182e27f
.word 0xf68f9b47, 0xf84d2159, 0x50e0b46a, 0xa1a5ff49, 0x72838a6b, 0xf7112bd3, 0xa3af297a, 0x3085dd84
.word 0xd9f2ddc8, 0xff6acc73, 0x622a133e, 0x7e854be3, 0x45d72c65, 0x9c12ff2b, 0x86dbaf36, 0x1461ef10
.word 0xbdaa0d7c, 0xa063f35c, 0x025bdb70, 0x203d6ab5, 0xfdbd0472, 0x86e0518a, 0x4dc4ea8d, 0xf8c910c9
.word 0x9aea3a5f, 0xb13e68f4, 0x5c11ed57, 0xfd2c0c57, 0x5e3435a8, 0x2bffa2de, 0x739d0a93, 0xb350e8c8
.word 0xb2c7c208, 0x5f41415d, 0x73195941, 0x44fa155d, 0x63533d99, 0xbbf11eaa, 0xcc8465e1, 0xee5a9e41
.word 0x6ed502e2, 0x5a182087, 0x03be02c1, 0xd3a87c63, 0xd7d010c5, 0x4858786d, 0x859edca8, 0x35538df7
.word 0x882ccde9, 0xe5763cb1, 0xdab0a4f5, 0x3eb7a381, 0x7bee7171, 0x05c3d8a8, 0x93417c48, 0x2e84348b
.word 0x0a0bdaeb, 0xbd4f2524, 0xcf1809ed, 0xb104124f, 0x63b908a9, 0x52bab9bc, 0xc94aadd6, 0x1a71bfed
.word 0xc1e66eaa, 0x25c21172, 0x6f0aae96, 0x04df0689, 0xc9e377bc, 0x6d696d65, 0x32c71cce, 0xf9e198e5
.word 0x4b5bcbda, 0x41ad7a5c, 0x2cb2c471, 0x660e3e81, 0xf5c9ad92, 0x41c893a1, 0x5fe4275d, 0x64806789
.word 0xa3a83168, 0xc56dc2f7, 0x6dfb0a77, 0x2c8a0d83, 0xefaf3ed3, 0xc48a3535, 0x086432fc, 0xf1094708
.word 0x3946fcce, 0xa524daaf, 0xd8abd1b3, 0x7189559e, 0xc78288bc, 0xcc52b5e6, 0x4381c6bd, 0xaaab68fb
.word 0x7796971e, 0xde53a644, 0xe5e7411c, 0x55a84dc2, 0xcebadf12, 0xf6108d96, 0xf1678f24, 0xbcbf5f3d
.word 0x2ad80c02, 0x4081abd0, 0x6a255bf8, 0x49eb580c, 0xb52f2c76, 0x19e2cb55, 0x7af12fba, 0xa49e09ba
.word 0x1c775415, 0x8b530660, 0x588d09f5, 0x430ef278, 0x7fc33853, 0xf876b1bf, 0x1cdf1fa4, 0x912a020f
.word 0x25914717, 0x0e9a9289, 0xbc7550e6, 0xf5b71f74, 0xfef2f254, 0x9e04e7df, 0x6e598f8e, 0x3d6fabea
.word 0x8ee84dec, 0x0d7efc46, 0x3cfa2be8, 0x47627dc6, 0x32306d02, 0x402980c0, 0x83c7e377, 0x8638073d
.word 0xc1479718, 0x598733bc, 0x78f03f9d, 0x6de8a7ea, 0x1ef75245, 0x15bbba6e, 0x33462e07, 0xf2267a5e
.word 0x2a2d4d8d, 0xbe820815, 0x986fc43c, 0x7891af65, 0x030afe52, 0xbdbbfa7c, 0x759e8952, 0x13d4fcd5
.word 0x045a74db, 0x62850dfb, 0xa0b946f2, 0xebfeb259, 0xdb3a9f1a, 0xd2fda74f, 0x5feab6ed, 0x2865a55d
.word 0x83dff70f, 0xecac318e, 0xcbf59337, 0xe12464bd, 0x9b04b1d6, 0x79351abf, 0xb4458838, 0xe8fd4ad0
.word 0x4bb80abb, 0xbe7d0cba, 0x4509178f, 0xa7676c9e, 0xcc07ff23, 0xd809cfd6, 0x899fbc1f, 0x72a32e6f
.word 0xc1a12c7a, 0xcf4395bf, 0xf8095e6c, 0x02fa2943, 0x52999504, 0xb0b9e2b9, 0x3f25346a, 0xea995a04
.word 0x1613560a, 0x69544934, 0xd703bb67, 0xada68b8e, 0x4f5765f3, 0x5d940108, 0x559cf8b4, 0x6d0f9f9b
.word 0x0f4eb85f, 0xd077a9de, 0xc21f0b0d, 0x645d53a3, 0x516d662d, 0x86202e7c, 0x22b6cc00, 0x90bc51c4
.word 0x441ff07b, 0xc9b5146c, 0x83a485f0, 0x029608b2, 0x2e9a7f48, 0x30b46e63, 0x94101628, 0x7fa3a513
.word 0xa411693d, 0x89a8f3b7, 0x713e8e30, 0xd309ce19, 0xcdc8c0a5, 0xac544439, 0x164eb7c9, 0x9c08b1a4
.word 0xa894da7e, 0x1701a575, 0xa6cf33b3, 0x73ab1dc1, 0x08d9da97, 0xe8642df2, 0x57141ddc, 0x7769e927
.word 0x6b953d81, 0x09395c36, 0xb5f9b0eb, 0x6fa8461c, 0x4301ddda, 0x3eaf8d1e, 0x57e40321, 0xa90b9eb8
.word 0xd85570b5, 0x8ba81e15, 0x2a9d5825, 0x2b49935a, 0x0b0f08a7, 0xc1299d9b, 0xcb087770, 0x359e7e52
.word 0x86d687e2, 0x1c99536d, 0x2b5f69ba, 0x50da7e79, 0x28a415ae, 0x6da226b7, 0x5a951047, 0x04efd73d
.word 0xa6013d90, 0x0fe22845, 0x675054b1, 0x2c9d3635, 0x29abba7d, 0xef1a72a3, 0x5da9425e, 0xafe39b40
.word 0xef98e514, 0x93f6e06a, 0x538a4f61, 0xff8a1a2a
.section .region_1,"aw",@progbits;
region_1:
.word 0x8b9c37ef, 0x81bcf643, 0x5f97d7d4, 0x036f7c0c, 0xd615cba9, 0xa95e6fc3, 0x8a4df4a5, 0x71524c75
.word 0x5aadbefa, 0x7a27882e, 0x9beef98e, 0xf3a323bb, 0xbb5d6145, 0x747c64e6, 0xc197ac52, 0x3838e6ad
.word 0x3dc5f1d5, 0xa1e14055, 0xd98120f0, 0x531073ea, 0xfd165fa1, 0x456518f9, 0x4752e9a7, 0xfa6e4f63
.word 0xf04753bf, 0xe5a4b6de, 0x5f1bac3f, 0x85a36502, 0xa93e3f54, 0x972a2d89, 0xdf91b9a9, 0xedf8f3fc
.word 0xb9ca6268, 0x7d0ff3b0, 0x4f5fd44a, 0xaeb37e7e, 0xb8788954, 0x46abf128, 0xed81d7f3, 0x263c5ef4
.word 0xf26d1536, 0x7b78f85b, 0x49ea9530, 0x9c84ed70, 0x6a3fbf0a, 0x82057953, 0x2f21974f, 0xc7990efd
.word 0x32b72d11, 0x1e8f4f7b, 0x2c635c59, 0xecc82e9a, 0x6160eb33, 0xeb37339e, 0x85e068d0, 0x5778ec11
.word 0x611859d9, 0xf1bea1ab, 0x40a7938c, 0xe9e07110, 0xbe3d8aa3, 0xb0a1d2b6, 0x5d7afdf4, 0x9b7d9c59
.word 0x93816211, 0x22b1f5d6, 0x804d0469, 0x683a5c75, 0x38c16997, 0x0c50eb8b, 0xc25ef257, 0x6fd60f80
.word 0xc215ebb4, 0x8c6e79b0, 0x72a03d79, 0x9f100496, 0xf0ee2695, 0xa746d08a, 0x79b57155, 0xefda3aa9
.word 0x8f96f299, 0xa36722bc, 0xd5ace403, 0x221f2c7b, 0x6f4de3dd, 0x46964cf3, 0x0758d707, 0x16dd1047
.word 0xd3875b00, 0xc1b3d253, 0x6de29f18, 0x764aa628, 0x92790158, 0x46330e14, 0x7901ae0e, 0x1ece4be7
.word 0xd53b3fc1, 0x7feaf3fc, 0x58b85c65, 0x8316d2a3, 0x2a09b431, 0xfb6f1123, 0x1c036b05, 0x8317fedd
.word 0xcadc467c, 0x98fc7dd2, 0x60298f38, 0x759b8749, 0xd106cef4, 0x9d711899, 0xd35b2d98, 0x7280733d
.word 0xd052c7d6, 0x9614f53c, 0xfee7bd3a, 0x0d0632e1, 0xa8064377, 0x784c1995, 0x3bf6b64b, 0x4b8168a2
.word 0x7200fb8c, 0x7478cb1c, 0xc2bdecfd, 0xb2fc67af, 0x84bfc4f3, 0xfe53b288, 0xcdecc98d, 0x2b8a3383
.word 0xbd0b6d70, 0x42aeae6c, 0xcec2716f, 0x8f6eb095, 0xa8e25b25, 0x0e946f18, 0x7b96a33e, 0x9dfc26b6
.word 0x7f81590f, 0xce621b91, 0x7fa7bbe5, 0x29037ca8, 0x7710ca45, 0xdcb815ae, 0x18b16d61, 0xe9f5c908
.word 0xf9eb7e97, 0x51790d33, 0xe1ccc7ea, 0x0d70dfb3, 0x75705351, 0xb3658586, 0x421d951f, 0x5e359ca8
.word 0xb20c306d, 0xd9ee11fc, 0xbdc928de, 0x83b2a21f, 0xb5d6b3d8, 0x67cffb13, 0x2dcace92, 0xd79feeb9
.word 0x6ae23b2e, 0x67dbdff1, 0x25574222, 0x9115a116, 0x79c664c2, 0xd351b388, 0xcf20b084, 0x081d4fc2
.word 0xd598f1d4, 0xf492ca0f, 0xeef69af1, 0x3f2287e6, 0x36d9f3ff, 0x134a4108, 0x2ad51e5d, 0x3482e41a
.word 0x976fc6ad, 0x940cbaa1, 0xf5324f78, 0xe2375100, 0x003ef110, 0x9010b75f, 0x0de10709, 0xbf599278
.word 0x6523a93b, 0xac4e4121, 0x3d07c28a, 0xf03e7478, 0x04515332, 0x70d28d32, 0xfe4cdad3, 0x64b2222e
.word 0x45aa9b16, 0x5b4e0e94, 0x79d6bd95, 0x7c30ec05, 0x00178917, 0xc698dd4c, 0xd066a7b6, 0xb16467b2
.word 0x4997aa75, 0x9ccfe5b4, 0x39fc8ad8, 0x03fe95b8, 0x7fac6a93, 0x9652db8f, 0xc6a37996, 0x98634edb
.word 0x7a92e781, 0xf9283337, 0x50f09af7, 0x0d2cafb0, 0x2d2605fb, 0xb6f35cc6, 0xa7c44d7a, 0xa9a25ee4
.word 0x335aef36, 0xa296ee86, 0x976d9d49, 0xfe1dccd7, 0xc579f9bb, 0xa21ffd6e, 0xc5926f18, 0x73ac331f
.word 0x604b9fd2, 0x6252704d, 0x3686cf7d, 0x407cfef4, 0x2582ed58, 0x1cd8e598, 0xd2e6d2f0, 0xe936b97b
.word 0x5d430af0, 0xdc9ea734, 0xe7e2c398, 0x4b448e83, 0x7294eee7, 0xcdaab4d2, 0x6349fceb, 0x88823302
.word 0x8d1b39ed, 0xb5079189, 0x4e7bf7d2, 0xaa54fa24, 0x181f0c29, 0x42d196b1, 0xcffd8fe9, 0x091b5fa3
.word 0x3ed20b2a, 0xed3960b9, 0x571843f8, 0x4c089464, 0x26529f2e, 0x782d5db6, 0xcb4de7d0, 0x55e2f5f7
.word 0xd75d8c53, 0x02bccdc0, 0xec0858fe, 0x5e5c647e, 0x13feeddf, 0x3729cd70, 0xd775192c, 0xe1c593f3
.word 0x10d84768, 0x2aa1ffa7, 0xee76daf0, 0x5dc7ed22, 0x52adaa9b, 0x61511edc, 0x70071cf8, 0x4ea163f9
.word 0xcb01873e, 0x8299e86c, 0x0137976f, 0xe87b89e6, 0xa938cab3, 0x67462f92, 0x7c0b1da1, 0x8c0e51db
.word 0xc69e6f7d, 0x9afab364, 0x55eef1a7, 0x19b5de60, 0x785c2837, 0x9b3e6a49, 0xc88e5c31, 0xb01aebf5
.word 0xaa4ee07a, 0xa80ed0a8, 0x71f60465, 0x2fd02142, 0x1169a64a, 0x9a93e4ef, 0xa0180e41, 0x9c4f4796
.word 0x2fef66ad, 0xad9a5713, 0x64cd214b, 0xefe95cac, 0x21cb9764, 0x04e0f428, 0xc09063ae, 0xade94ef6
.word 0x2aa19cb2, 0xb83e35f7, 0xc5f87ed8, 0x2541d2ec, 0xc0bb9053, 0xe38a5dc0, 0x75d8e162, 0x9639d241
.word 0x36c1aa9b, 0x9ec2f5e0, 0x932cb25a, 0xa99aca1a, 0x5c3ec821, 0xa1caa5e2, 0xe2f2fb3a, 0x76af29f2
.word 0x9f26bf6d, 0x458fa522, 0x7fcd7396, 0x50b8cc88, 0x510bc164, 0x7a86c00c, 0xc267463c, 0xad8f1258
.word 0xa22ab3f5, 0x5add37bc, 0x76627bb5, 0x012e66cb, 0x8ef6effd, 0x4cd3e770, 0x9e71b658, 0xaa126cf6
.word 0xf4d3f55b, 0x21631207, 0xf2034fa7, 0x0f174c88, 0x9a3391a6, 0x468bd5f9, 0x7a259a3d, 0x544f5015
.word 0xc180135a, 0xeae66472, 0x69da42a8, 0x09d97405, 0x7b725689, 0x83f4d058, 0xea8aed47, 0x79f557fd
.word 0xcbc726dc, 0x084c81a1, 0x253a28a5, 0xf5cba915, 0xee4fc813, 0x886b046c, 0x95ac7b5f, 0x10a75d7f
.word 0x6de7efe5, 0xb46142de, 0x09cd4d53, 0x897dfb49, 0x3b88f6cb, 0xdf748748, 0x0dd51313, 0xd64d907f
.word 0xcf62bc81, 0xce0371ee, 0xb5174a1e, 0x187f36be, 0x1c5d11e8, 0xdc1c311d, 0x9d9e6cb5, 0xf7032cc1
.word 0xa010e8eb, 0x1731b4f0, 0xf77359b7, 0xd4d6bb42, 0xda3d9065, 0x0cda771f, 0x09689771, 0xbbf6f832
.word 0x5eaa144e, 0xc8b49cea, 0xf37a9447, 0x927f20ce, 0x3a6eae68, 0xa1b929ea, 0x73caf58b, 0xf902964d
.word 0x3828f6d1, 0xdcb5627c, 0x2967ee4e, 0xfb6ff849, 0xd2c89d0e, 0x0ecf5439, 0xd70a50d0, 0x1b84277e
.word 0x4e5fd86a, 0xa93d7d1a, 0xc059b181, 0xf0a028da, 0x2b98bdb1, 0xf5f02172, 0x1b7bae8a, 0xc7bd5bd6
.word 0x2e2e4589, 0xd81a8732, 0x4fa49456, 0x89940116, 0xcc31efb5, 0xbcbadf2e, 0xa35154a6, 0x936d4484
.word 0x566d3bf7, 0x07810681, 0x55819db7, 0x4801b468, 0xafa1fb94, 0x737d4606, 0x32fc444c, 0xf53a2ebf
.word 0xa20f0a98, 0xa0214bac, 0xf151405c, 0x3b62ce27, 0x9e13bdd0, 0xb0503222, 0x594c9d47, 0xc2d5934b
.word 0x9a722517, 0x9f66eb4c, 0x4d0f49fa, 0x1a7d42ae, 0x9fe7d33e, 0x942f64c5, 0x8fe26352, 0xc4939efe
.word 0xe8405dc4, 0x5f497183, 0xce7a9a1f, 0x8ac935e1, 0x351453a2, 0x38140518, 0xa93d8c1c, 0x245d127a
.word 0x7e857db8, 0x0deeefca, 0x77aeaea8, 0x0376e073, 0x71e6b938, 0x0dd8aa7e, 0x938d2eb8, 0x992d245a
.word 0x451cf3ac, 0x4d61e8d7, 0x28811676, 0x1c80ce6c, 0xd6a9d669, 0x1b744b58, 0x47b4d82d, 0x91dd24bf
.word 0x32ab6890, 0xf4cf755b, 0xee3311b2, 0x5660ae23, 0x1a4703a8, 0x98c19b37, 0x9db450ae, 0xaba4992f
.word 0x11fb88b1, 0x77f8a2a1, 0x4ee0f6ae, 0xc68a3b31, 0x296e1935, 0xb6bef7be, 0xcf96ba0a, 0xcc17bd60
.word 0x1508f386, 0xde82b91e, 0x77f5d965, 0xc2964759, 0x06e3216d, 0xcae88d15, 0x1f790f3f, 0x5a69f32b
.word 0x7b9c9b15, 0xb1146390, 0xcf6a3443, 0xd7183fa6, 0x6d261819, 0x6aaed7f6, 0x8d71f458, 0xe1af3891
.word 0x42fbb083, 0x592fc54e, 0x9a32e3e3, 0x9446e28d
.section .amo_0,"aw",@progbits;
amo_0:
.word 0x5daca5d1, 0xdb2870ef, 0xae2b68c9, 0xfbe6109e, 0x6fed7d73, 0x2794464c, 0x67fa2db4, 0x5ac98384
.word 0x0f371dbe, 0xc86fd6f7, 0x6ebb3466, 0x044455e4, 0x2938b134, 0x53442f6e, 0x61b357eb, 0xd586e2f9
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
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_2:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_3:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_4:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_5:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_6:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_7:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_8:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_9:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_10:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_11:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_12:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_13:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_14:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_15:
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 0x1f
                  beqz x5, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

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
                  addi x18, x18, -4
                  sw  x21, (x18)
                  add x21, x18, zero
                  addi x21, x21, -128
                  sw  x1, 4(x21)
                  sw  x2, 8(x21)
                  sw  x3, 12(x21)
                  sw  x4, 16(x21)
                  sw  x5, 20(x21)
                  sw  x6, 24(x21)
                  sw  x7, 28(x21)
                  sw  x8, 32(x21)
                  sw  x9, 36(x21)
                  sw  x10, 40(x21)
                  sw  x11, 44(x21)
                  sw  x12, 48(x21)
                  sw  x13, 52(x21)
                  sw  x14, 56(x21)
                  sw  x15, 60(x21)
                  sw  x16, 64(x21)
                  sw  x17, 68(x21)
                  sw  x18, 72(x21)
                  sw  x19, 76(x21)
                  sw  x20, 80(x21)
                  sw  x21, 84(x21)
                  sw  x22, 88(x21)
                  sw  x23, 92(x21)
                  sw  x24, 96(x21)
                  sw  x25, 100(x21)
                  sw  x26, 104(x21)
                  sw  x27, 108(x21)
                  sw  x28, 112(x21)
                  sw  x29, 116(x21)
                  sw  x30, 120(x21)
                  sw  x31, 124(x21)
                  add x18, x21, zero
                  csrr x5, 0x341 # MEPC
                  csrr x5, 0x342 # MCAUSE
                  li x31, 0x3 # BREAKPOINT
                  beq x5, x31, ebreak_handler
                  li x31, 0x8 # ECALL_UMODE
                  beq x5, x31, ecall_handler
                  li x31, 0x9 # ECALL_SMODE
                  beq x5, x31, ecall_handler
                  li x31, 0xb # ECALL_MMODE
                  beq x5, x31, ecall_handler
                  li x31, 0x1
                  beq x5, x31, instr_fault_handler
                  li x31, 0x5
                  beq x5, x31, load_fault_handler
                  li x31, 0x7
                  beq x5, x31, store_fault_handler
                  li x31, 0xc
                  beq x5, x31, pt_fault_handler
                  li x31, 0xd
                  beq x5, x31, pt_fault_handler
                  li x31, 0xf
                  beq x5, x31, pt_fault_handler
                  li x31, 0x2 # ILLEGAL_INSTRUCTION
                  beq x5, x31, illegal_instr_handler
                  csrr x31, 0x343 # MTVAL
                  1: la x10, test_done
                  jalr x1, x10, 0

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
                  la x10, write_tohost
                  jalr x0, x10, 0

instr_fault_handler:
                  add x21, x18, zero
                  lw  x1, 4(x21)
                  lw  x2, 8(x21)
                  lw  x3, 12(x21)
                  lw  x4, 16(x21)
                  lw  x5, 20(x21)
                  lw  x6, 24(x21)
                  lw  x7, 28(x21)
                  lw  x8, 32(x21)
                  lw  x9, 36(x21)
                  lw  x10, 40(x21)
                  lw  x11, 44(x21)
                  lw  x12, 48(x21)
                  lw  x13, 52(x21)
                  lw  x14, 56(x21)
                  lw  x15, 60(x21)
                  lw  x16, 64(x21)
                  lw  x17, 68(x21)
                  lw  x18, 72(x21)
                  lw  x19, 76(x21)
                  lw  x20, 80(x21)
                  lw  x21, 84(x21)
                  lw  x22, 88(x21)
                  lw  x23, 92(x21)
                  lw  x24, 96(x21)
                  lw  x25, 100(x21)
                  lw  x26, 104(x21)
                  lw  x27, 108(x21)
                  lw  x28, 112(x21)
                  lw  x29, 116(x21)
                  lw  x30, 120(x21)
                  lw  x31, 124(x21)
                  addi x21, x21, 128
                  add x18, x21, zero
                  lw  x21, (x18)
                  addi x18, x18, 4
                  mret

load_fault_handler:
                  add x21, x18, zero
                  lw  x1, 4(x21)
                  lw  x2, 8(x21)
                  lw  x3, 12(x21)
                  lw  x4, 16(x21)
                  lw  x5, 20(x21)
                  lw  x6, 24(x21)
                  lw  x7, 28(x21)
                  lw  x8, 32(x21)
                  lw  x9, 36(x21)
                  lw  x10, 40(x21)
                  lw  x11, 44(x21)
                  lw  x12, 48(x21)
                  lw  x13, 52(x21)
                  lw  x14, 56(x21)
                  lw  x15, 60(x21)
                  lw  x16, 64(x21)
                  lw  x17, 68(x21)
                  lw  x18, 72(x21)
                  lw  x19, 76(x21)
                  lw  x20, 80(x21)
                  lw  x21, 84(x21)
                  lw  x22, 88(x21)
                  lw  x23, 92(x21)
                  lw  x24, 96(x21)
                  lw  x25, 100(x21)
                  lw  x26, 104(x21)
                  lw  x27, 108(x21)
                  lw  x28, 112(x21)
                  lw  x29, 116(x21)
                  lw  x30, 120(x21)
                  lw  x31, 124(x21)
                  addi x21, x21, 128
                  add x18, x21, zero
                  lw  x21, (x18)
                  addi x18, x18, 4
                  mret

store_fault_handler:
                  add x21, x18, zero
                  lw  x1, 4(x21)
                  lw  x2, 8(x21)
                  lw  x3, 12(x21)
                  lw  x4, 16(x21)
                  lw  x5, 20(x21)
                  lw  x6, 24(x21)
                  lw  x7, 28(x21)
                  lw  x8, 32(x21)
                  lw  x9, 36(x21)
                  lw  x10, 40(x21)
                  lw  x11, 44(x21)
                  lw  x12, 48(x21)
                  lw  x13, 52(x21)
                  lw  x14, 56(x21)
                  lw  x15, 60(x21)
                  lw  x16, 64(x21)
                  lw  x17, 68(x21)
                  lw  x18, 72(x21)
                  lw  x19, 76(x21)
                  lw  x20, 80(x21)
                  lw  x21, 84(x21)
                  lw  x22, 88(x21)
                  lw  x23, 92(x21)
                  lw  x24, 96(x21)
                  lw  x25, 100(x21)
                  lw  x26, 104(x21)
                  lw  x27, 108(x21)
                  lw  x28, 112(x21)
                  lw  x29, 116(x21)
                  lw  x30, 120(x21)
                  lw  x31, 124(x21)
                  addi x21, x21, 128
                  add x18, x21, zero
                  lw  x21, (x18)
                  addi x18, x18, 4
                  mret

ebreak_handler:   
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x21, x18, zero
                  lw  x1, 4(x21)
                  lw  x2, 8(x21)
                  lw  x3, 12(x21)
                  lw  x4, 16(x21)
                  lw  x5, 20(x21)
                  lw  x6, 24(x21)
                  lw  x7, 28(x21)
                  lw  x8, 32(x21)
                  lw  x9, 36(x21)
                  lw  x10, 40(x21)
                  lw  x11, 44(x21)
                  lw  x12, 48(x21)
                  lw  x13, 52(x21)
                  lw  x14, 56(x21)
                  lw  x15, 60(x21)
                  lw  x16, 64(x21)
                  lw  x17, 68(x21)
                  lw  x18, 72(x21)
                  lw  x19, 76(x21)
                  lw  x20, 80(x21)
                  lw  x21, 84(x21)
                  lw  x22, 88(x21)
                  lw  x23, 92(x21)
                  lw  x24, 96(x21)
                  lw  x25, 100(x21)
                  lw  x26, 104(x21)
                  lw  x27, 108(x21)
                  lw  x28, 112(x21)
                  lw  x29, 116(x21)
                  lw  x30, 120(x21)
                  lw  x31, 124(x21)
                  addi x21, x21, 128
                  add x18, x21, zero
                  lw  x21, (x18)
                  addi x18, x18, 4
                  mret

illegal_instr_handler:
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x21, x18, zero
                  lw  x1, 4(x21)
                  lw  x2, 8(x21)
                  lw  x3, 12(x21)
                  lw  x4, 16(x21)
                  lw  x5, 20(x21)
                  lw  x6, 24(x21)
                  lw  x7, 28(x21)
                  lw  x8, 32(x21)
                  lw  x9, 36(x21)
                  lw  x10, 40(x21)
                  lw  x11, 44(x21)
                  lw  x12, 48(x21)
                  lw  x13, 52(x21)
                  lw  x14, 56(x21)
                  lw  x15, 60(x21)
                  lw  x16, 64(x21)
                  lw  x17, 68(x21)
                  lw  x18, 72(x21)
                  lw  x19, 76(x21)
                  lw  x20, 80(x21)
                  lw  x21, 84(x21)
                  lw  x22, 88(x21)
                  lw  x23, 92(x21)
                  lw  x24, 96(x21)
                  lw  x25, 100(x21)
                  lw  x26, 104(x21)
                  lw  x27, 108(x21)
                  lw  x28, 112(x21)
                  lw  x29, 116(x21)
                  lw  x30, 120(x21)
                  lw  x31, 124(x21)
                  addi x21, x21, 128
                  add x18, x21, zero
                  lw  x21, (x18)
                  addi x18, x18, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x5, 0x300 # MSTATUS;
                  csrr  x5, 0x304 # MIE;
                  csrr  x5, 0x344 # MIP;
                  csrrc x5, 0x344, x5 # MIP;
                  add x21, x18, zero
                  lw  x1, 4(x21)
                  lw  x2, 8(x21)
                  lw  x3, 12(x21)
                  lw  x4, 16(x21)
                  lw  x5, 20(x21)
                  lw  x6, 24(x21)
                  lw  x7, 28(x21)
                  lw  x8, 32(x21)
                  lw  x9, 36(x21)
                  lw  x10, 40(x21)
                  lw  x11, 44(x21)
                  lw  x12, 48(x21)
                  lw  x13, 52(x21)
                  lw  x14, 56(x21)
                  lw  x15, 60(x21)
                  lw  x16, 64(x21)
                  lw  x17, 68(x21)
                  lw  x18, 72(x21)
                  lw  x19, 76(x21)
                  lw  x20, 80(x21)
                  lw  x21, 84(x21)
                  lw  x22, 88(x21)
                  lw  x23, 92(x21)
                  lw  x24, 96(x21)
                  lw  x25, 100(x21)
                  lw  x26, 104(x21)
                  lw  x27, 108(x21)
                  lw  x28, 112(x21)
                  lw  x29, 116(x21)
                  lw  x30, 120(x21)
                  lw  x31, 124(x21)
                  addi x21, x21, 128
                  add x18, x21, zero
                  lw  x21, (x18)
                  addi x18, x18, 4
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
