.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x15, h0_start
jalr x0, x15, 0
h0_start:
                  li x29, 0x40001105
                  csrw 0x301, x29
kernel_sp:        
                  la x16, kernel_stack_end

trap_vec_init:    
                  la x29, mtvec_handler
                  ori x29, x29, 1
                  csrw 0x305, x29 # MTVEC

mepc_setup:       
                  la x29, init
                  csrw 0x341, x29

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x29, 0x1800
                  csrw 0x300, x29 # MSTATUS
                  li x29, 0x0
                  csrw 0x304, x29 # MIE
                  mret
init:             
                  li x0, 0xf
                  li x1, 0x774f25b
                  li x2, 0x80000000
                  li x3, 0xd
                  li x5, 0x80000000
                  li x6, 0x80000000
                  li x7, 0x0
                  li x8, 0x80000000
                  li x9, 0xf79f5d72
                  li x10, 0x80000000
                  li x11, 0xbc7ce66d
                  li x12, 0xd
                  li x13, 0x714e6e82
                  li x14, 0xe
                  li x15, 0xf0937999
                  li x17, 0x3
                  li x18, 0xcf74544c
                  li x19, 0x0
                  li x20, 0x8fe9a0df
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x23, 0x0
                  li x24, 0x4
                  li x25, 0xc
                  li x26, 0xfe4ee381
                  li x27, 0x2ddc0da2
                  li x28, 0x80000000
                  li x29, 0xc6d58f0f
                  li x30, 0x9
                  li x31, 0xfe181522
                  la x4, user_stack_end
main:             la           sp, region_0+561 #start riscv_hazard_instr_stream_0
                  c.slli       t6, 14
                  sb           s9, 6(sp)
                  c.xor        s1, a4
                  lh           s9, 5(sp)
                  lb           s5, 10(sp)
                  lhu          s1, -7(sp)
                  lhu          t6, -3(sp)
                  lb           s1, -9(sp)
                  c.mv         t6, s9
                  and          a4, s5, s5
                  lb           s1, 6(sp)
                  sb           s9, 16(sp)
                  c.srli       s1, 17
                  lb           s1, -8(sp)
                  sw           a4, 11(sp)
                  sb           s9, -2(sp)
                  lb           a4, 12(sp)
                  lhu          s7, -5(sp)
                  lbu          t6, -8(sp)
                  c.nop
                  divu         s9, s7, s7
                  slti         s7, s1, 761
                  c.xor        a4, s1
                  auipc        s5, 920656
                  addi         s7, s5, 1252
                  mulhu        t6, t6, s5
                  sh           s9, -3(sp)
                  sb           t6, 16(sp)
                  lbu          s9, -10(sp)
                  srl          s5, s7, s9
                  lh           s5, -9(sp)
                  addi         s7, s1, -1118
                  c.xor        a4, a4
                  lhu          s1, 9(sp)
                  lb           a4, -14(sp)
                  div          s5, s1, s9
                  sb           s1, 1(sp)
                  lb           a4, -14(sp) #end riscv_hazard_instr_stream_0
                  la           s9, amo_0+12 #start riscv_lr_sc_instr_stream_0
                  sltu         a3, t3, s0
                  lr.w          s7, (s9)
                  mulh         ra, t2, t3
                  sc.w          a1, a0, (s9) #end riscv_lr_sc_instr_stream_0
                  la           s9, amo_0+48 #start riscv_amo_instr_stream_0
                  la           ra, amo_0+8
                  la           t1, amo_0+4
                  ori          a4, t4, 372
                  amoswap.w.aq  gp, s2, (ra)
                  add          s4, s1, t1
                  amoand.w      t6, t5, (t1)
                  ori          zero, a1, -879
                  amomin.w.rl   s4, t6, (t1)
                  amoadd.w.rl   s4, s4, (s9) #end riscv_amo_instr_stream_0
                  la           sp, region_0+1148 #start riscv_load_store_rand_instr_stream_0
                  divu         a4, s11, a7
                  addi         a4, zero, -1748
                  c.add        s8, gp
                  sb           s1, 300(sp)
                  lbu          s6, 652(sp)
                  c.add        t3, s2
                  lw           s2, -480(sp)
                  sh           a1, -504(sp)
                  sh           t1, 390(sp)
                  lbu          s3, -273(sp)
                  slt          a0, t6, gp
                  lui          s6, 636378
                  nop
                  c.li         t2, -1
                  add          a7, a2, tp
                  lh           gp, 818(sp)
                  lbu          s0, 618(sp)
                  lbu          s2, -993(sp)
                  c.add        s8, t2
                  lb           s2, -193(sp)
                  c.mv         s11, a1
                  c.srai       a3, 13
                  lbu          t0, 687(sp)
                  sh           t4, 322(sp)
                  or           a1, s3, s5
                  c.andi       a4, 26
                  lbu          s9, -344(sp) #end riscv_load_store_rand_instr_stream_0
                  la           ra, region_1+542 #start load_store_instr_stream_0
                  sh           a4, 154(ra)
                  la           t0, region_0+1249 #start load_store_instr_stream_1
                  lb           s7, -189(ra)
                  lbu          s9, -175(t0)
                  lbu          s9, -22(t0)
                  sh           s3, -160(ra)
                  lh           a2, -2(ra)
                  lb           s0, 179(t0)
                  lbu          a2, -74(ra)
                  sb           s4, -156(t0)
                  sb           sp, -14(ra)
                  lbu          s1, -232(t0) #end load_store_instr_stream_1
                  lbu          s5, 209(ra) #end load_store_instr_stream_0
                  la           s9, region_1+1207 #start load_store_instr_stream_0
                  la           t1, region_1+1372 #start load_store_instr_stream_1
                  lhu          s4, 253(s9)
                  sw           s6, 604(t1)
                  lh           s2, 23(s9)
                  lb           a3, -458(t1)
                  lb           t3, -243(t1)
                  sb           s2, 100(s9)
                  lb           t3, -367(t1)
                  lhu          a4, -180(t1)
                  lbu          zero, 582(t1)
                  sb           tp, 198(s9)
                  lb           s7, 165(s9)
                  lh           s3, 151(s9)
                  sb           s9, -186(t1) #end load_store_instr_stream_1
                  sh           t6, 187(s9) #end load_store_instr_stream_0
                  addi         a7, zero, -7 #init loop 0 counter
                  c.srli       a4, 8
                  rem          t6, a6, zero
                  lui          s3, 641052
                  c.add        gp, s10
                  sub          s8, s7, s4
                  c.slli       s8, 28
                  c.and        s1, a4
                  sra          t0, s2, s9
                  c.andi       s0, -1
                  or           s8, s5, a2
                  andi         a0, a0, -1669
                  c.sub        a0, s0
                  addi         a2, zero, 4 #init loop 0 limit
                  c.addi16sp   sp, -16
main_5_0_t:       c.lui        t2, 15
                  add          s3, s9, a7
                  c.srai       s0, 30
                  addi         a7, a7, 6 #update loop 0 counter
                  c.xor        s0, a4
                  c.lui        s11, 16
                  and          t1, a2, s9
                  mulhsu       t1, s8, ra
                  auipc        t6, 881054
                  divu         s9, a0, s0
                  blt          a7, a2, main_5_0_t #branch for loop 0
                  divu         s2, t6, a4
main_2:           jal          t6, 5f
0:                c.j          10f
1:                jal          ra, 11f
2:                c.j          9f
3:                jal          s4, 2b
4:                jal          ra, 0b
5:                c.jal        8f
6:                jal          ra, 7f
7:                c.jal        3b
8:                c.j          4b
9:                jal          sp, 1b
10:               c.j          6b
11:               c.mv         a1, a5
                  la           s10, region_1+1069 #start riscv_load_store_hazard_instr_stream_0
                  divu         a2, a3, t5
                  lbu          s2, -61(s10)
                  lb           s6, -4(s10)
                  lbu          t0, -4(s10)
                  lbu          ra, -4(s10)
                  sb           ra, -4(s10)
                  lb           t5, -59(s10)
                  auipc        ra, 293802
                  lbu          s8, -59(s10)
                  lb           a2, 10(s10)
                  lhu          s11, -3(s10)
                  lbu          gp, -3(s10)
                  lhu          a3, -3(s10)
                  sh           a1, -3(s10)
                  sb           gp, 50(s10)
                  sb           t5, -33(s10)
                  lb           t6, 36(s10)
                  sh           t4, -9(s10)
                  lbu          t0, -20(s10)
                  sw           t6, 11(s10) #end riscv_load_store_hazard_instr_stream_0
                  mulh         s11, ra, a2
                  c.add        a3, a1
                  c.lui        s1, 1
                  c.beqz       a2, 4f
4:                sltu         s2, s0, a3
                  c.or         a3, a0
                  bgeu         a4, gp, 11f
                  c.xor        a0, a5
                  lui          s3, 811812
                  sltu         s3, a7, s6
                  c.mv         ra, s8
11:               c.xor        a1, s0
                  c.slli       t1, 20
                  mulhsu       ra, tp, s8
                  c.lui        a7, 18
                  c.srai       s1, 4
                  c.srli       a2, 18
                  c.xor        s1, s0
                  addi         zero, s11, -235
                  c.sub        a4, s1
                  div          ra, t3, t4
                  c.addi4spn   a2, sp, 320
                  or           t1, tp, s4
                  c.mv         a2, t0
                  c.lui        s3, 16
                  c.xor        a3, a2
                  c.xor        a3, a0
                  beq          s5, gp, 33f
                  remu         s3, s1, t1
                  mulhu        a0, s0, gp
                  la           s1, sub_1
                  addi         s1, s1, 625
                  sltu         s2, s7, s9
                  bge          t3, gp, main_j1 #branch to jump instr
                  srl          a1, s7, a7
                  div          a4, tp, a5
                  c.li         s4, -1
                  mulhu        a0, s0, gp
                  c.srli       a1, 25
                  sltu         ra, sp, zero
                  mulhu        s7, a3, a7
main_j1:          jalr         t6, s1, -624 #jump main -> sub_1
                  c.xor        a1, a2
                  beq          a0, t3, 46f
                  bne          gp, a1, 48f
                  c.add        a0, gp
33:               c.bnez       s0, 48f
                  auipc        t4, 343453
                  c.addi       s11, -1
                  c.nop
                  sra          ra, s8, s9
                  c.slli       s5, 10
                  ori          t4, s3, 1404
                  c.addi       t2, 8
                  sll          a3, s2, a7
                  auipc        a3, 995232
                  c.mv         s8, s1
                  sltu         s6, s5, a2
                  bne          s1, sp, 48f
46:               c.xor        s1, a3
                  c.nop
48:               mulh         s4, s11, s7
                  la x15, test_done
                  jalr x0, x15, 0
test_done:        
                  li gp, 1
                  ecall
sub_2:            c.li         t0, -1
                  c.lui        s10, 6
                  sltu         s5, s9, a3
                  slt          s6, t5, t1
                  sltu         t0, a3, t0
                  xori         a0, sp, 1843
                  addi         tp, tp, -64
                  rem          t0, t3, gp
                  add          a2, s7, t4
                  c.xor        a3, s0
                  sw           t6, 4(tp)
                  sll          a2, tp, s4
                  la           s0, region_1+875 #start load_store_instr_stream_0
                  la           t1, region_1+556 #start load_store_instr_stream_2
                  la           gp, region_1+1928 #start load_store_instr_stream_3
                  sb           ra, -1786(gp)
                  lbu          a0, -6(s0)
                  lbu          t3, -95(gp)
                  sb           s11, 1180(t1)
                  la           s8, region_1+1504 #start load_store_instr_stream_1
                  lhu          zero, -6(s8)
                  lbu          s4, 0(s0)
                  sb           ra, 3(s8)
                  lbu          t5, -1035(gp)
                  lbu          a2, 11(s0)
                  lb           ra, -1053(gp)
                  sh           sp, -14(s8)
                  lw           s10, -1252(gp)
                  lbu          ra, -14(s0)
                  lb           a1, -703(gp)
                  sb           a0, -439(t1)
                  sb           t0, 4(s8)
                  sb           t5, -6(s0)
                  lhu          s9, 9(s0)
                  lhu          t3, -6(s8)
                  lh           s4, 1182(t1)
                  lbu          t0, -16(s8)
                  lh           t0, -15(s0)
                  lhu          s3, -1594(gp)
                  lb           a1, 769(t1)
                  lhu          s5, 756(t1) #end load_store_instr_stream_2
                  lbu          s7, 0(s0)
                  lbu          a1, 11(s8) #end load_store_instr_stream_1
                  lb           t5, -1899(gp) #end load_store_instr_stream_3
                  lbu          a7, -4(s0)
                  lbu          s2, 0(s0) #end load_store_instr_stream_0
                  addi         a3, zero, 9 #init loop 1 counter
                  c.sub        s1, a0
                  c.andi       s0, 20
                  addi         zero, zero, 0 #init loop 1 limit
                  ori          sp, s0, -1945
                  mulh         t3, a3, s3
sub_2_29_1_t:     c.add        t1, s0
                  remu         a7, s6, t6
                  addi         a3, a3, -9 #update loop 1 counter
                  addi         s8, zero, -7 #init loop 0 counter
                  mulhsu       s0, t5, ra
                  addi         t2, zero, -19 #init loop 0 limit
                  xor          t4, tp, sp
                  nop
sub_2_29_0_t:     remu         a7, s9, s10
                  c.mv         a7, tp
                  addi         s8, s8, -4 #update loop 0 counter
                  sltiu        t1, s0, -973
                  srl          s1, a6, s11
                  sra          a1, s9, a4
                  div          s4, s5, s9
                  rem          sp, s7, s2
                  bge          s8, t2, sub_2_29_0_t #branch for loop 0
                  xori         s10, s11, -812
                  lui          s1, 70534
                  sltu         a0, s3, gp
                  sll          gp, tp, t2
                  c.bnez       a3, sub_2_29_1_t #branch for loop 1
                  slti         s0, s7, -188
                  la           s4, region_0+832 #start riscv_load_store_rand_instr_stream_5
                  c.srli       a3, 6
                  auipc        s6, 845589
                  sh           s11, 720(s4)
                  lbu          a1, 29(s4)
                  sltiu        sp, tp, 1770
                  divu         s8, gp, s8
                  slt          gp, s2, a5
                  remu         t2, s3, a0
                  c.and        s1, a5
                  add          a2, s9, a1
                  lhu          s6, -204(s4)
                  slt          t4, t1, tp
                  lhu          s10, -342(s4)
                  lb           a7, 1048(s4)
                  slt          s10, a4, a0
                  c.add        t3, s5
                  c.xor        a1, a4
                  xor          s5, a4, t4
                  lb           gp, 146(s4)
                  lb           t5, 929(s4)
                  srai         s9, t4, 31
                  c.srli       a3, 28
                  c.addi4spn   a4, sp, 880
                  sltiu        t4, ra, -371
                  c.sub        a0, a0
                  lbu          zero, 47(s4)
                  sh           s1, 1164(s4)
                  c.add        s0, t0
                  sltu         s6, s6, tp
                  c.andi       a1, -1
                  div          s2, t6, zero
                  lhu          zero, 872(s4)
                  add          s11, s9, s5
                  sra          a0, a2, s2
                  xori         t3, s9, -999
                  lb           t0, 654(s4)
                  lhu          t2, -636(s4)
                  divu         t6, s2, a0
                  sll          zero, t4, t0
                  lbu          t6, -776(s4)
                  add          s6, zero, t2
                  c.srli       a4, 29
                  lh           s5, 520(s4) #end riscv_load_store_rand_instr_stream_5
                  la           sp, region_1+1193 #start riscv_load_store_rand_instr_stream_0
                  c.sub        a2, a0
                  lb           a1, 48(sp)
                  lb           s6, 36(sp)
                  lw           t3, 23(sp)
                  auipc        s3, 422094
                  sb           s3, -46(sp)
                  sw           s4, -1(sp)
                  c.xor        s1, a3
                  ori          a0, t3, 154
                  lb           t3, 41(sp)
                  lb           s7, 39(sp)
                  sltu         s9, s10, s4
                  sw           a5, 23(sp)
                  lui          a2, 791702
                  slti         a0, t3, 553
                  lbu          s0, 3(sp)
                  sb           s1, 35(sp)
                  srl          s6, t1, zero
                  mul          s2, s5, s9
                  lh           a0, 29(sp)
                  sub          s4, tp, a0
                  lb           s11, -50(sp)
                  lb           s8, -40(sp)
                  lh           s7, -43(sp)
                  c.add        a3, a3
                  mulh         ra, s7, s0
                  c.or         a0, a3
                  sb           gp, 39(sp)
                  c.andi       a3, 1
                  c.nop
                  c.addi       t6, -1
                  c.add        s5, s11
                  slt          s9, a6, a6
                  mulhu        s9, a2, a0
                  lb           gp, 18(sp)
                  sub          a1, s1, s9
                  lbu          s4, 49(sp)
                  lbu          s2, 41(sp)
                  divu         t1, t0, a7
                  lb           s9, 6(sp)
                  sw           gp, 19(sp)
                  lb           a3, 22(sp)
                  mul          a1, s2, s4
                  sb           a4, -57(sp)
                  slt          a3, s10, a1
                  sb           a4, -43(sp)
                  c.andi       s0, 1
                  sra          s0, s2, s2
                  c.slli       s7, 19
                  div          t6, t2, t3
                  sh           s11, 35(sp)
                  sb           s3, 8(sp)
                  sb           s9, 55(sp)
                  lh           s0, 21(sp) #end riscv_load_store_rand_instr_stream_0
                  la           a1, amo_0+16 #start riscv_lr_sc_instr_stream_1
                  lr.w          a4, (a1)
                  andi         t3, a6, 1544
                  srli         a2, t6, 20
                  ori          s5, a7, -1001
                  mulhu        s6, a6, tp
                  xori         a7, s3, 1195
                  divu         t0, s3, t6
                  mulhu        s5, t2, s7
                  c.xor        s1, a4
                  andi         s0, s8, 1331
                  c.srai       a3, 13
                  c.addi       s6, 3
                  and          a2, s3, s2
                  lui          s9, 324324
                  xor          a2, t5, t1
                  rem          a4, t3, s5
                  sc.w          t5, s4, (a1) #end riscv_lr_sc_instr_stream_1
sub_2_10:         jal          t6, 8f
0:                c.j          11f
1:                jal          ra, 3f
2:                c.j          16f
3:                c.jal        10f
4:                c.j          7f
5:                c.j          12f
6:                c.j          1b
7:                jal          ra, 6b
8:                jal          gp, 4b
9:                jal          t6, 0b
10:               jal          ra, 5b
11:               c.j          15f
12:               c.jal        14f
13:               jal          t1, 2b
14:               c.jal        9b
15:               c.jal        13b
16:               mul          a2, t4, s1
                  la           a2, region_0+366 #start riscv_load_store_rand_instr_stream_2
                  lbu          s6, 5(a2)
                  sb           sp, -1(a2)
                  lh           zero, -16(a2)
                  c.sub        a0, a1
                  addi         t5, tp, 178
                  sb           a0, 9(a2)
                  slli         t0, s10, 17
                  sra          t3, gp, s1
                  sb           t5, 0(a2)
                  srl          ra, s1, s8
                  div          t4, s0, s10
                  sb           s3, 11(a2)
                  lbu          t6, 15(a2)
                  sb           a2, 16(a2)
                  lhu          t1, -10(a2)
                  lb           t4, -5(a2)
                  auipc        gp, 75636
                  auipc        a7, 1017931
                  sb           t5, -3(a2)
                  sb           s7, 15(a2)
                  mulhsu       s1, t4, zero
                  slli         s7, t2, 26
                  sh           a6, 16(a2)
                  lbu          a1, -9(a2)
                  c.srli       s0, 22
                  lhu          s7, -2(a2)
                  add          a3, s8, t0
                  lbu          sp, -16(a2)
                  divu         s5, t1, a7
                  or           s4, a5, s6
                  xori         a1, a2, -103
                  lw           t1, 14(a2)
                  lbu          a7, -11(a2)
                  lh           zero, 12(a2)
                  c.andi       a0, -1
                  lbu          s6, 8(a2)
                  c.addi       t5, -1
                  sb           t5, -12(a2)
                  xor          t6, tp, s4
                  c.sub        s1, a4
                  sub          sp, s7, t2
                  mulhsu       zero, t4, t3
                  mul          t6, s4, t6
                  lb           a1, 2(a2)
                  sw           t6, 2(a2)
                  c.srai       s1, 21
                  sb           zero, 13(a2)
                  sb           t4, 1(a2)
                  xori         a1, s0, 337
                  nop
                  sw           a4, -10(a2)
                  or           a0, t3, s7
                  sb           a6, 9(a2)
                  divu         s4, a6, s0
                  sb           a7, -14(a2)
                  c.or         a3, a3
                  sh           s10, -12(a2) #end riscv_load_store_rand_instr_stream_2
                  la           a0, region_1+1471 #start load_store_instr_stream_1
                  la           a4, region_0+87 #start load_store_instr_stream_0
                  sb           s9, -24(a4)
                  lw           s3, 41(a4)
                  sb           a2, -1354(a0)
                  sb           a6, -26(a4)
                  lb           a2, -238(a0)
                  lh           t4, -933(a0)
                  sh           s7, 1(a4)
                  sb           s7, -1250(a0)
                  sh           gp, -39(a0) #end load_store_instr_stream_1
                  lh           gp, -3(a4) #end load_store_instr_stream_0
                  la           sp, region_0+410 #start riscv_hazard_instr_stream_2
                  rem          s4, s4, t0
                  sh           t0, 1100(sp)
                  mul          t0, t0, zero
                  nop
                  lh           zero, 420(sp)
                  srl          zero, s4, t0
                  sw           zero, 310(sp)
                  lbu          s2, 1453(sp)
                  sb           zero, -186(sp)
                  addi         t0, zero, 1069
                  andi         s4, zero, -1625
                  auipc        t0, 768893
                  add          s10, s10, zero
                  auipc        s10, 963722
                  c.and        a2, a2
                  sb           s2, 128(sp)
                  c.add        s2, s10
                  mulhsu       zero, s10, s10
                  lh           s2, -50(sp)
                  sltu         zero, t0, a2
                  sltiu        zero, s10, -744
                  lbu          s10, -44(sp)
                  c.or         a2, a2
                  lui          a2, 645243
                  c.sub        a2, a2
                  andi         t0, s2, 206
                  mul          s10, s4, s2
                  ori          s10, s10, -1296
                  rem          t0, s4, zero
                  ori          t0, t0, 433
                  lb           s4, 916(sp)
                  rem          t0, s2, zero
                  lbu          a2, 512(sp)
                  sb           a2, -395(sp)
                  c.add        s10, t0
                  sb           s4, 943(sp)
                  lb           zero, 115(sp)
                  lb           s4, 167(sp) #end riscv_hazard_instr_stream_2
                  addi         s0, zero, 9 #init loop 0 counter
                  sra          s7, a1, s3
                  remu         s8, t0, s10
                  addi         s3, zero, 11 #init loop 0 limit
                  slli         s2, t1, 1
sub_2_28_0_t:     lui          s6, 443278
                  addi         s0, s0, 1 #update loop 0 counter
                  slti         t3, a6, -1525
                  xori         a2, a0, -49
                  beq          s0, s3, sub_2_28_0_t #branch for loop 0
                  xori         t3, s7, 381
sub_2_14:         jal          t6, 10f
0:                jal          ra, 2f
1:                jal          ra, 0b
2:                c.jal        4f
3:                jal          a4, 7f
4:                c.jal        5f
5:                jal          t1, 8f
6:                c.jal        11f
7:                c.j          9f
8:                c.jal        6b
9:                jal          s0, 1b
10:               jal          s9, 3b
11:               ori          t3, s10, 975
                  la           s0, amo_0+0 #start riscv_amo_instr_stream_2
                  la           a1, amo_0+48
                  la           s3, amo_0+60
                  la           s5, amo_0+0
                  srai         t5, a5, 20
                  amomin.w      t6, a5, (s3)
                  amoswap.w     s11, s9, (s3)
                  amomax.w.aq   s2, t3, (a1)
                  amoxor.w      s9, t3, (s3)
                  nop
                  amoxor.w.rl   s7, s3, (s3)
                  amomin.w.rl   a3, s4, (s3)
                  amoadd.w      a2, s8, (a1)
                  amoadd.w.rl   s9, s8, (s5)
                  amoadd.w.aq   t6, a4, (s3) #end riscv_amo_instr_stream_2
                  la           gp, amo_0+32 #start riscv_amo_instr_stream_3
                  la           s9, amo_0+40
                  la           sp, amo_0+24
                  amomaxu.w.aq  zero, a0, (s9)
                  amomaxu.w.rl  s7, s11, (gp)
                  amoor.w.aq    t4, a5, (sp)
                  amoxor.w.aq   s4, zero, (s9)
                  sltu         s6, sp, s3
                  c.add        s0, s9
                  c.lui        a2, 21
                  amominu.w.rl  t3, s8, (s9)
                  slli         t5, zero, 20
                  amoor.w.rl    a4, s8, (sp)
                  addi         a3, t2, 1123
                  amominu.w     a4, a3, (gp)
                  amomin.w      s5, s7, (sp) #end riscv_amo_instr_stream_3
                  la           s9, region_1+635 #start riscv_load_store_rand_instr_stream_3
                  c.and        s1, a5
                  add          gp, a6, zero
                  sh           s2, 3(s9)
                  remu         gp, s4, a0
                  divu         t4, a2, s0
                  c.addi16sp   sp, -16
                  sb           s7, 2(s9)
                  sw           s9, -3(s9)
                  lh           s5, -5(s9)
                  sb           a7, 11(s9)
                  lb           s4, 0(s9)
                  mul          ra, s5, t4
                  sh           t3, 9(s9)
                  sh           s11, -9(s9)
                  srl          t5, s2, s5
                  lhu          zero, -1(s9)
                  lh           s2, 5(s9)
                  divu         s1, t5, s2
                  lb           s3, -8(s9)
                  c.xor        a0, a2
                  lb           a3, -16(s9)
                  lb           zero, 6(s9)
                  xori         s10, zero, -317
                  add          a4, zero, a0
                  lb           a7, 9(s9)
                  slli         gp, s9, 25
                  lw           a3, 13(s9)
                  sll          s10, t0, s0
                  lhu          a3, 3(s9)
                  lb           a7, 3(s9)
                  lh           t1, -7(s9)
                  sltiu        a1, a3, 749
                  c.addi16sp   sp, 192
                  lhu          a0, -13(s9)
                  lhu          s8, 13(s9)
                  mulhsu       t4, a5, a0
                  c.andi       a3, -1
                  lbu          t1, 2(s9)
                  lbu          s1, 0(s9)
                  lbu          s8, -12(s9)
                  sb           a6, -14(s9)
                  lbu          gp, 16(s9) #end riscv_load_store_rand_instr_stream_3
                  la           a0, amo_0+56 #start riscv_amo_instr_stream_0
                  sltiu        a7, s5, -1757
                  amoand.w      s10, a4, (a0) #end riscv_amo_instr_stream_0
                  la           s2, region_1+766 #start load_store_instr_stream_1
                  lb           s8, -11(s2)
                  la           a1, region_0+735 #start load_store_instr_stream_0
                  lbu          s8, 16(s2)
                  lb           s6, 2(s2)
                  lb           s9, -7(s2)
                  sb           t1, -92(a1)
                  lb           t2, -15(s2)
                  sb           s6, 16(s2)
                  lb           t0, -30(a1)
                  lb           s1, -7(s2)
                  lb           s10, 186(a1)
                  lbu          a4, 167(a1)
                  lbu          t3, -8(s2) #end load_store_instr_stream_1
                  lhu          a2, 205(a1) #end load_store_instr_stream_0
sub_2_12:         jal          t6, 14f
0:                jal          s4, 12f
1:                c.jal        3f
2:                c.jal        4f
3:                c.jal        13f
4:                c.j          5f
5:                c.j          1b
6:                c.j          2b
7:                c.j          8f
8:                jal          a1, 10f
9:                c.j          6b
10:               jal          ra, 15f
11:               c.j          7b
12:               c.j          16f
13:               jal          a2, 0b
14:               c.j          9b
15:               c.j          17f
16:               c.jal        11b
17:               slt          s4, a0, t4
                  la           sp, region_0+1662 #start load_store_instr_stream_0
                  lbu          s8, -11(sp)
                  la           a2, region_1+1637 #start load_store_instr_stream_1
                  sh           t2, -244(sp)
                  lh           s1, -191(a2)
                  sb           s10, 38(a2)
                  sb           s0, 200(sp)
                  lbu          s11, 233(sp)
                  lbu          t4, 46(a2)
                  lw           t3, -138(sp)
                  lbu          a1, -63(a2)
                  sb           tp, 195(sp)
                  lbu          a4, 255(a2)
                  lhu          t6, -5(a2)
                  lh           t6, 49(a2)
                  lbu          s10, -30(a2) #end load_store_instr_stream_1
                  lbu          t6, 69(sp)
                  lb           t2, -116(sp) #end load_store_instr_stream_0
                  la           s10, region_0+626 #start riscv_load_store_hazard_instr_stream_4
                  lb           a7, -49(s10)
                  sb           zero, -92(s10)
                  srl          s0, t5, t4
                  lbu          s7, -92(s10)
                  sb           s1, -92(s10)
                  lb           s4, 140(s10)
                  lh           ra, 140(s10)
                  sb           a1, 140(s10)
                  lb           s1, 125(s10)
                  lb           gp, 125(s10)
                  sb           s5, 97(s10)
                  c.srli       s0, 2
                  rem          t2, t2, a3
                  sb           s10, 97(s10)
                  lb           t1, 97(s10)
                  lb           t1, 97(s10)
                  sb           t2, 97(s10)
                  lb           t1, -65(s10)
                  lb           s3, -65(s10)
                  lbu          s1, 181(s10)
                  c.addi16sp   sp, 368
                  sb           a4, 181(s10)
                  sb           s7, 181(s10) #end riscv_load_store_hazard_instr_stream_4
                  la           s0, region_1+1785 #start load_store_instr_stream_1
                  la           ra, region_1+288 #start load_store_instr_stream_0
                  sb           s4, 39(ra)
                  la           s7, region_1+98 #start load_store_instr_stream_3
                  la           a2, region_1+73 #start load_store_instr_stream_2
                  lbu          t6, -75(ra)
                  lb           t0, 1017(s7)
                  lw           s2, 119(a2)
                  lb           gp, 1525(s7)
                  lbu          s4, 164(a2)
                  lbu          s2, 826(s7)
                  lbu          a0, -39(ra)
                  lb           s2, 27(ra)
                  lbu          s10, -36(s0)
                  sb           a5, 58(a2)
                  sb           tp, 581(s7)
                  lhu          s8, -43(a2)
                  lb           gp, 67(s7)
                  sh           zero, -228(ra)
                  lb           s10, 243(ra)
                  lhu          s9, 12(ra)
                  lb           t0, 20(s0)
                  lw           t5, 119(a2)
                  sh           a0, 1618(s7)
                  lb           a0, 133(ra)
                  lbu          s4, 40(s0)
                  sb           s6, 58(s0)
                  lbu          s9, 877(s7)
                  sb           sp, 220(a2)
                  sb           s11, -2(s0)
                  lbu          t0, 153(ra)
                  lb           zero, 16(s0) #end load_store_instr_stream_1
                  lbu          t3, 22(a2)
                  lbu          s4, 688(s7) #end load_store_instr_stream_3
                  sb           ra, -44(a2)
                  lb           s4, -29(a2) #end load_store_instr_stream_2
                  lb           t0, -135(ra) #end load_store_instr_stream_0
                  la           t1, region_0+130 #start riscv_load_store_hazard_instr_stream_3
                  lb           s4, -57(t1)
                  add          t4, s3, sp
                  lbu          t6, -46(t1)
                  lh           t0, -36(t1)
                  sb           zero, -38(t1)
                  lbu          s11, -43(t1)
                  mulhsu       zero, tp, s10
                  sb           a1, -43(t1)
                  c.or         s0, a0
                  lb           s1, -43(t1)
                  lbu          s2, -43(t1)
                  sb           t4, 41(t1)
                  lb           a4, 5(t1)
                  lb           a3, 28(t1)
                  xori         ra, t1, 201
                  lbu          zero, -31(t1)
                  divu         zero, t5, s5
                  lhu          a0, -60(t1)
                  lhu          s0, 28(t1)
                  c.srai       s0, 17
                  sb           s11, -23(t1) #end riscv_load_store_hazard_instr_stream_3
                  addi         s0, zero, 9 #init loop 1 counter
                  addi         s7, zero, 13 #init loop 1 limit
sub_2_31_1_t:     sltiu        a0, s8, -594
                  addi         s0, s0, 8 #update loop 1 counter
                  and          t1, a6, s4
                  addi         a4, zero, -10 #init loop 0 counter
                  addi         a2, zero, -3 #init loop 0 limit
sub_2_31_0_t:     c.add        a0, s11
                  div          a3, a6, zero
                  addi         a4, a4, 10 #update loop 0 counter
                  blt          a4, a2, sub_2_31_0_t #branch for loop 0
                  blt          s0, s7, sub_2_31_1_t #branch for loop 1
                  slt          t4, s5, zero
                  la           a3, region_1+1740 #start riscv_hazard_instr_stream_1
                  lbu          t4, -9(a3)
                  lbu          t4, -2(a3)
                  lb           t6, -13(a3)
                  srl          t4, t4, a0
                  c.li         t4, 7
                  lbu          a2, 16(a3)
                  div          a2, a0, t4
                  sw           s2, 16(a3)
                  sh           a2, 8(a3)
                  lb           s4, -9(a3)
                  nop
                  and          s4, t6, t4
                  nop
                  sb           s4, -9(a3)
                  sw           s2, 4(a3)
                  mulhu        a0, s4, t4
                  lb           a2, -10(a3)
                  c.add        a0, s4
                  xor          t6, a2, s2
                  lb           a2, 12(a3)
                  c.andi       a2, 9
                  c.or         a0, a2
                  sll          t6, a0, s2
                  andi         a2, a2, 1839
                  lb           t4, 1(a3)
                  lbu          t4, -2(a3)
                  c.lw         a0, 16(a3)
                  lbu          t4, -11(a3)
                  sb           a0, 3(a3)
                  sb           s2, 5(a3)
                  srli         s4, a0, 14
                  or           t6, a0, a0
                  lh           t6, 14(a3) #end riscv_hazard_instr_stream_1
                  la           s10, region_0+1402 #start riscv_hazard_instr_stream_5
                  lb           s2, -29(s10)
                  lh           s8, -554(s10)
                  c.xor        a3, a3
                  sra          gp, gp, a3
                  slt          gp, gp, s11
                  lh           gp, -178(s10)
                  sb           s2, -373(s10)
                  lw           s11, -1046(s10)
                  lhu          s2, -724(s10)
                  sb           s2, -839(s10)
                  sll          s8, s8, s2
                  c.srli       a3, 22
                  lb           zero, -1116(s10)
                  sw           a3, 230(s10)
                  lbu          s11, 305(s10)
                  sb           zero, -364(s10)
                  div          gp, s11, zero
                  sb           zero, 313(s10)
                  c.sub        a3, a3
                  lbu          zero, -1231(s10)
                  lb           s8, -765(s10)
                  lh           s2, -650(s10)
                  sb           s2, 78(s10)
                  sra          zero, s11, s8
                  c.and        a3, a3
                  sh           gp, -956(s10)
                  srl          a3, s8, s11
                  sb           s8, 490(s10)
                  addi         s8, s11, 1641
                  lbu          s11, -671(s10)
                  lb           s2, -3(s10)
                  sb           s2, -75(s10)
                  sw           s2, -802(s10)
                  c.add        a3, gp
                  lbu          s11, 193(s10)
                  c.nop
                  sb           s2, -1133(s10)
                  lb           s8, -1132(s10)
                  sw           a3, -790(s10)
                  sltiu        a3, s11, -1645
                  lbu          s2, 201(s10)
                  lh           a3, -1336(s10) #end riscv_hazard_instr_stream_5
                  la           t3, region_1+320 #start load_store_instr_stream_1
                  lh           gp, -10(t3)
                  la           s10, region_0+1833 #start load_store_instr_stream_0
                  sh           a7, 11(s10)
                  sh           sp, -30(t3)
                  lb           s9, 27(t3)
                  sb           s9, 10(s10)
                  sh           s3, -10(t3)
                  lb           t1, -55(t3)
                  lb           gp, 37(s10)
                  lbu          t5, -41(t3)
                  lh           s3, -61(s10)
                  sb           s9, -30(s10)
                  lh           s11, -35(s10)
                  lbu          t6, -62(t3)
                  sh           ra, -59(s10)
                  lb           s3, 44(s10)
                  lhu          s9, 46(t3)
                  sb           a4, -39(s10)
                  sb           a1, 61(t3) #end load_store_instr_stream_1
                  lb           s6, 9(s10) #end load_store_instr_stream_0
sub_2_11:         jal          t6, 0f
0:                c.j          4f
1:                jal          a2, 12f
2:                jal          ra, 5f
3:                c.jal        6f
4:                c.jal        2b
5:                jal          a2, 7f
6:                jal          ra, 13f
7:                jal          ra, 10f
8:                jal          t1, 14f
9:                jal          ra, 8b
10:               jal          s7, 11f
11:               c.j          1b
12:               jal          s4, 3b
13:               c.j          9b
14:               c.jal        15f
15:               c.slli       t5, 29
                  la           s9, region_1+1201 #start load_store_instr_stream_1
                  lb           s8, 120(s9)
                  la           s7, region_1+138 #start load_store_instr_stream_0
                  la           a1, region_1+1763 #start load_store_instr_stream_2
                  lbu          s11, 19(a1)
                  sb           a1, 481(s7)
                  lbu          sp, 90(s9)
                  sb           a3, 34(a1)
                  lb           s3, 1275(s7)
                  lb           s3, 49(a1)
                  lb           t4, 1734(s7)
                  lh           a0, 128(s7)
                  lbu          a3, -14(a1)
                  sb           s7, -61(a1)
                  sb           a0, 84(s9)
                  lb           a7, -63(a1)
                  sb           ra, 947(s7)
                  sb           gp, -20(s9)
                  sh           s7, 43(a1)
                  lh           t4, -51(a1)
                  sh           t5, 31(a1)
                  sb           ra, -206(s9)
                  sb           s1, 20(a1) #end load_store_instr_stream_2
                  lh           s2, 225(s9)
                  lb           t0, 1027(s7)
                  lbu          s5, -198(s9)
                  lb           s2, 165(s9) #end load_store_instr_stream_1
                  sh           zero, 882(s7) #end load_store_instr_stream_0
                  la           t0, amo_0+28 #start riscv_lr_sc_instr_stream_3
                  nop
                  c.addi16sp   sp, -16
                  c.slli       s2, 3
                  xor          s5, sp, zero
                  c.xor        s0, a1
                  andi         s5, a1, 1318
                  sra          t5, s2, a6
                  divu         ra, a0, sp
                  lr.w          s6, (t0)
                  remu         t2, t3, a6
                  srl          t2, s7, t0
                  sub          s5, a3, a4
                  sc.w.aq       t1, ra, (t0) #end riscv_lr_sc_instr_stream_3
                  la           sp, region_0+1650 #start riscv_load_store_hazard_instr_stream_0
                  sb           ra, 50(sp)
                  lhu          ra, 50(sp)
                  c.addi       s3, 10
                  slti         t4, s10, 115
                  sltiu        s9, a5, 440
                  lbu          s9, 50(sp)
                  sb           t6, 50(sp)
                  sh           s10, 50(sp)
                  c.lui        a1, 23
                  c.add        s5, a1
                  lw           t5, 50(sp)
                  divu         a1, a0, sp
                  c.andi       a3, -1
                  sw           s11, 50(sp)
                  lhu          a3, 50(sp)
                  lb           t3, 50(sp)
                  lw           a4, 50(sp) #end riscv_load_store_hazard_instr_stream_0
                  la           s4, region_1+26 #start riscv_load_store_rand_instr_stream_4
                  sra          t6, s6, a1
                  sb           a5, 277(s4)
                  sh           ra, 690(s4)
                  lb           t1, 941(s4)
                  lh           gp, 284(s4)
                  c.addi16sp   sp, -16
                  lb           s7, 389(s4)
                  lh           s8, 1704(s4)
                  c.li         s7, 17
                  c.andi       a3, -1
                  sb           a1, 1801(s4)
                  nop
                  lbu          s7, 1200(s4)
                  sb           t0, 479(s4)
                  c.nop
                  lh           t1, 740(s4)
                  sb           s3, 630(s4)
                  mul          zero, a1, zero
                  lb           t6, -9(s4)
                  srl          t3, a3, t0
                  slti         a7, t3, 940
                  lb           t3, 869(s4)
                  nop
                  lb           t5, 1609(s4)
                  lb           a0, 129(s4)
                  lbu          zero, 583(s4)
                  lbu          s9, 229(s4)
                  sb           s11, 802(s4)
                  remu         s7, t5, t0
                  lbu          s6, 1675(s4)
                  slli         t0, s9, 20
                  lbu          t3, 403(s4)
                  sw           a4, 1682(s4)
                  c.addi4spn   a1, sp, 640
                  srli         a1, t5, 29
                  lbu          a2, 1138(s4)
                  lw           t3, 1702(s4)
                  sra          s7, s10, a7
                  slli         s5, a1, 8
                  lh           ra, 920(s4)
                  srli         t5, a6, 8
                  lb           t5, 475(s4)
                  c.sub        a4, s1
                  sb           a5, 55(s4)
                  lhu          s10, 1086(s4)
                  lb           s3, 1079(s4)
                  lb           s10, 45(s4) #end riscv_load_store_rand_instr_stream_4
                  addi         s0, zero, -8 #init loop 1 counter
                  c.addi       s2, -1
                  c.add        a2, s4
                  c.mv         a4, a4
                  mulhu        s8, t1, gp
                  or           t2, s3, sp
                  add          t5, a1, a0
                  addi         a0, zero, -6 #init loop 1 limit
                  add          ra, s0, a4
sub_2_30_1_t:     c.mv         ra, a7
                  xori         gp, tp, 1147
                  c.addi16sp   sp, -16
                  addi         s0, s0, 9 #update loop 1 counter
                  c.srli       a2, 31
                  sub          s1, s2, t2
                  slli         sp, a0, 2
                  addi         a1, zero, -6 #init loop 0 counter
                  remu         t0, a3, s1
                  sra          s2, s1, t6
                  addi         zero, zero, 0 #init loop 0 limit
sub_2_30_0_t:     remu         t1, t6, a5
                  c.slli       t5, 18
                  or           s4, t3, s2
                  nop
                  addi         a1, a1, 6 #update loop 0 counter
                  auipc        t1, 1008510
                  divu         a7, a6, s5
                  c.beqz       a1, sub_2_30_0_t #branch for loop 0
                  auipc        s4, 301886
                  andi         s8, s4, 1396
                  c.and        a2, s1
                  mulhsu       ra, s0, gp
                  mulhsu       t2, sp, t5
                  blt          s0, a0, sub_2_30_1_t #branch for loop 1
                  c.mv         s5, a5
                  la           s0, region_0+1085 #start load_store_instr_stream_1
                  lhu          s6, 91(s0)
                  lbu          a0, -88(s0)
                  la           t3, region_1+1667 #start load_store_instr_stream_0
                  sb           t0, 34(s0)
                  sw           a6, 83(s0)
                  lb           s7, 166(t3)
                  sb           t1, -16(t3)
                  sb           s3, -26(s0)
                  lh           s11, -27(t3)
                  sh           s6, 141(s0)
                  lhu          t2, 41(t3)
                  lb           zero, 186(t3)
                  lbu          s11, 148(s0)
                  lhu          zero, 161(t3)
                  sh           s6, -183(s0)
                  lbu          s7, -212(s0)
                  lbu          gp, -33(t3)
                  lbu          s6, 48(s0) #end load_store_instr_stream_1
                  sb           s4, -226(t3)
                  lbu          t5, -221(t3)
                  lb           ra, -9(t3) #end load_store_instr_stream_0
                  la           s11, amo_0+28 #start riscv_amo_instr_stream_1
                  la           s0, amo_0+44
                  la           t1, amo_0+36
                  la           t4, amo_0+52
                  addi         s2, zero, 1849
                  amomax.w.rl   t0, sp, (s0)
                  amoadd.w.rl   gp, s3, (t4)
                  amomin.w      t3, t2, (s11)
                  amoxor.w.rl   t2, s8, (t4)
                  amomaxu.w.rl  s2, t6, (s0)
                  amomaxu.w.aq  a1, a1, (s0)
                  amoadd.w.aq   s10, a4, (s0)
                  amomaxu.w     t6, a4, (t4)
                  amoand.w.rl   a7, t6, (t4)
                  amomaxu.w.aq  s5, s0, (t1) #end riscv_amo_instr_stream_1
                  la           s9, region_1+1871 #start load_store_instr_stream_3
                  la           a3, region_1+372 #start load_store_instr_stream_0
                  la           ra, region_1+1952 #start load_store_instr_stream_1
                  sb           s10, -24(a3)
                  lb           t2, 2(s9)
                  lbu          s4, -255(a3)
                  sb           s3, -16(s9)
                  lbu          s11, -39(ra)
                  sb           a0, -4(s9)
                  la           a4, region_1+723 #start load_store_instr_stream_2
                  sb           tp, -59(ra)
                  lbu          s5, 71(a3)
                  sh           a5, -240(ra)
                  lb           t1, -27(a3)
                  lb           a2, 2(s9)
                  sb           s11, -7(ra)
                  lw           s5, -11(s9)
                  lbu          s1, -152(a4)
                  lb           t2, 220(a4)
                  sb           s3, -147(ra)
                  lbu          a7, 26(a3)
                  sb           a1, -6(a4)
                  lb           t4, 102(a4)
                  lbu          a2, 41(a3)
                  lb           s7, 43(a4) #end load_store_instr_stream_2
                  sb           t3, 141(a3)
                  lh           t1, -248(ra)
                  sb           zero, -173(ra) #end load_store_instr_stream_1
                  lb           a0, -129(a3)
                  lb           s1, -2(s9) #end load_store_instr_stream_3
                  sb           a4, 171(a3) #end load_store_instr_stream_0
                  la           t6, amo_0+8 #start riscv_lr_sc_instr_stream_0
                  c.or         s1, a0
                  xori         a3, t1, 1784
                  c.addi       t1, -1
                  c.srli       a1, 3
                  c.li         sp, -1
                  sra          s2, s8, tp
                  lr.w.aq       a1, (t6)
                  c.addi       s5, -1
                  sub          s11, t1, s11
                  slt          s3, a4, s4
                  rem          s7, s4, t5
                  lui          ra, 286545
                  sc.w.aq       s9, t2, (t6) #end riscv_lr_sc_instr_stream_0
sub_2_15:         jal          t6, 17f
0:                c.j          24f
1:                c.j          4f
2:                c.jal        21f
3:                jal          ra, 27f
4:                c.jal        25f
5:                c.j          7f
6:                c.jal        8f
7:                c.j          16f
8:                c.j          2b
9:                c.jal        6b
10:               c.jal        9b
11:               c.jal        15f
12:               c.j          28f
13:               jal          ra, 19f
14:               jal          s6, 11b
15:               jal          t1, 18f
16:               jal          ra, 0b
17:               c.j          10b
18:               jal          t5, 12b
19:               c.j          20f
20:               c.jal        23f
21:               c.j          3b
22:               c.jal        5b
23:               c.j          26f
24:               jal          ra, 1b
25:               jal          ra, 14b
26:               jal          ra, 22b
27:               jal          t0, 13b
28:               jal          a1, 29f
29:               mulh         ra, s10, a3
                  la           s3, region_1+1519 #start riscv_load_store_hazard_instr_stream_5
                  lb           a4, 231(s3)
                  sh           s3, 19(s3)
                  sb           tp, 186(s3)
                  lbu          t3, 186(s3)
                  lbu          s7, -8(s3)
                  lb           s7, -8(s3)
                  lbu          zero, -174(s3)
                  lw           gp, -39(s3)
                  sb           sp, -39(s3)
                  sh           s1, 91(s3)
                  sb           s4, 144(s3)
                  lb           t4, 144(s3)
                  c.mv         s11, s3
                  lbu          s8, 144(s3)
                  lbu          s0, 144(s3)
                  c.nop
                  lhu          a7, -109(s3) #end riscv_load_store_hazard_instr_stream_5
                  la           s2, region_0+797 #start load_store_instr_stream_3
                  la           gp, region_0+917 #start load_store_instr_stream_2
                  la           sp, region_0+118 #start load_store_instr_stream_4
                  sb           gp, 500(s2)
                  sh           a6, -17(gp)
                  lbu          s4, 188(s2)
                  la           s7, region_0+1882 #start load_store_instr_stream_1
                  la           ra, region_0+1158 #start load_store_instr_stream_0
                  sb           zero, -173(ra)
                  lbu          t1, 2(gp)
                  sb           t5, -4(s7)
                  lhu          s6, 31(gp)
                  sb           a2, -8(sp)
                  sb           s8, 1048(s2)
                  sb           s2, -5(s7)
                  lhu          s10, 443(s2)
                  lhu          s0, 78(ra)
                  lhu          s6, -39(gp)
                  sb           s3, 15(ra)
                  lbu          a4, -51(gp)
                  lbu          t2, -14(s7)
                  lbu          s5, -1(s7)
                  sb           s8, 3(s7)
                  lbu          a2, 460(s2)
                  sb           a0, 1(sp)
                  sb           t6, -67(ra)
                  sb           zero, 7(gp)
                  lb           t3, 215(s2)
                  lb           t1, -14(ra)
                  lbu          a4, -7(s7)
                  lb           s0, 11(gp)
                  sb           tp, -10(sp)
                  lb           t6, -189(ra)
                  lbu          s3, -180(s2)
                  lb           t4, -12(sp)
                  lbu          t0, 338(s2)
                  lb           s4, 205(ra)
                  lbu          zero, 5(sp)
                  lb           a0, -12(s7) #end load_store_instr_stream_1
                  lbu          a1, -5(ra)
                  lb           t4, -16(sp)
                  sb           s10, 546(s2)
                  lbu          zero, -14(sp)
                  sw           a1, -2(sp) #end load_store_instr_stream_4
                  sh           a0, 33(gp)
                  sb           s11, 50(gp) #end load_store_instr_stream_2
                  lb           a0, 22(s2) #end load_store_instr_stream_3
                  lb           s10, 78(ra) #end load_store_instr_stream_0
                  la           t4, region_0+1221 #start riscv_hazard_instr_stream_3
                  mulhsu       s10, s9, s9
                  rem          s1, s1, a4
                  lb           s6, -45(t4)
                  sltiu        s9, a4, -1795
                  c.sub        a4, a4
                  lb           s6, -46(t4)
                  rem          s9, t0, s1
                  lb           t0, -10(t4)
                  lb           s9, 18(t4)
                  sb           s1, -12(t4)
                  lb           a4, -6(t4)
                  c.add        s9, s10
                  c.xor        a4, s1
                  lhu          s1, -15(t4)
                  lw           s1, -13(t4)
                  lb           a4, 60(t4)
                  c.srai       s1, 4
                  andi         s9, s6, -1549
                  sw           s9, 31(t4)
                  rem          s1, t0, s9
                  lbu          a4, 38(t4)
                  slti         s10, s9, -396
                  lb           s6, 16(t4)
                  lbu          s1, 7(t4)
                  lbu          s9, 32(t4)
                  and          s10, a4, t0
                  lb           s6, 46(t4)
                  lb           s1, -63(t4)
                  sb           s1, 51(t4)
                  lb           s9, 11(t4)
                  xor          s1, t0, t0
                  nop
                  sb           a4, -62(t4)
                  sh           s1, -7(t4)
                  c.and        s1, s1
                  lui          s9, 529415
                  remu         s9, a4, s1
                  srli         s1, a4, 16
                  lb           s9, 42(t4)
                  sb           a4, 32(t4)
                  sb           s9, -23(t4)
                  sb           s1, -55(t4)
                  lbu          a4, -60(t4)
                  c.sub        s1, a4
                  sb           t0, -40(t4)
                  andi         a4, s10, -183
                  lhu          s6, 37(t4)
                  ori          s10, a4, -1934
                  lhu          s10, 45(t4) #end riscv_hazard_instr_stream_3
                  sltiu        t0, sp, -85
                  c.li         t4, -1
                  bltu         s5, s8, 3f
3:                auipc        a2, 376584
                  div          s3, s11, sp
                  addi         s3, t1, -910
                  srli         t5, s0, 10
                  bne          t6, a2, 9f
                  c.sub        a3, a1
9:                c.slli       t6, 13
                  add          s10, t6, s6
                  c.addi4spn   a4, sp, 48
                  c.and        a3, a0
                  or           s6, s3, t3
                  lui          s8, 762778
                  bgeu         s3, s11, 17f
                  bltu         sp, a7, 22f
17:               or           a1, a6, tp
                  sltu         s2, t3, t4
                  blt          s4, s3, 27f
                  ori          s11, s6, -365
                  sll          s7, tp, s0
22:               sltiu        t3, t0, -457
                  slti         t5, s6, -1166
                  divu         t3, zero, s10
                  c.lui        s5, 17
                  srl          s5, t5, s7
27:               c.beqz       a4, 31f
                  c.srli       a0, 17
                  slti         s8, a4, 1580
                  c.xor        s0, a3
31:               c.addi4spn   a0, sp, 592
                  mulh         t1, a4, t1
                  slti         s1, s9, -890
                  c.mv         gp, tp
                  c.bnez       a3, 38f
                  c.srai       a0, 8
                  beq          a7, a1, 49f
38:               c.add        s2, t4
                  c.beqz       a3, 59f
                  auipc        gp, 391133
                  ori          a2, s3, 435
                  nop
                  lui          s5, 1013704
                  c.mv         t1, s8
                  and          ra, t5, s2
                  bltu         s8, t1, 65f
                  sltu         s0, gp, t1
                  srai         s0, a1, 13
49:               slti         a3, s11, 745
                  bltu         s0, gp, 59f
                  addi         a4, s3, 1626
                  ori          s9, s6, 1752
                  c.bnez       a1, 59f
                  c.or         a2, a3
                  c.srai       s0, 7
                  beq          s10, a7, 62f
                  c.slli       a3, 12
                  slti         s3, tp, 1911
59:               auipc        gp, 289653
                  divu         s2, t4, s11
                  srai         a7, s1, 10
62:               nop
                  mulh         t2, gp, s1
                  srl          t0, s8, t2
65:               c.and        s0, s0
                  c.beqz       s0, 72f
                  sra          t6, t3, a2
                  bgeu         sp, t6, 84f
                  c.xor        a0, a0
                  nop
                  sltiu        s9, s0, 15
72:               blt          a5, tp, 90f
                  c.nop
                  c.nop
                  c.or         a1, a2
                  c.xor        a2, s0
                  c.and        a0, a0
                  div          sp, zero, zero
                  xor          s1, a3, s5
                  bne          s1, s6, 88f
                  c.beqz       a1, 97f
                  sll          t2, t5, a3
                  remu         s6, t5, s9
84:               c.bnez       s1, 101f
                  ori          gp, t5, 1198
                  lui          s11, 469066
                  add          gp, s7, a2
88:               andi         s9, s4, 1882
                  sltu         a7, a5, s5
90:               or           s3, a2, s6
                  c.bnez       a0, 92f
92:               c.mv         t5, t3
                  srl          s5, sp, s11
                  div          a7, a4, a5
                  c.andi       a3, 9
                  c.sub        a3, a2
97:               c.beqz       a1, 116f
                  auipc        a7, 32868
                  slt          s2, sp, a6
                  c.beqz       a0, 108f
101:              or           s5, s11, a0
                  srli         a1, a3, 29
                  slti         t1, s8, 200
                  remu         s3, s4, t1
                  remu         s6, t4, a6
                  sub          s0, a3, tp
                  auipc        s11, 339595
108:              c.srai       s0, 5
                  c.slli       a2, 18
                  or           s9, a7, s3
                  slli         a3, t1, 2
                  c.srai       a3, 2
                  c.addi16sp   sp, 416
                  addi         s1, a6, 966
                  addi         s8, t5, -351
116:              bgeu         a6, s4, 118f
                  c.bnez       a0, 124f
118:              c.nop
                  srli         t0, s9, 14
                  srli         t4, s10, 24
                  sltiu        t1, s6, 1705
                  slti         t6, s5, 1779
                  slli         a1, a6, 27
124:              c.nop
                  c.xor        a3, a0
                  srli         t0, t6, 10
                  remu         s8, a4, s2
                  bltu         s6, t1, 130f
                  c.or         a2, a1
130:              mulhsu       s7, a6, a5
                  srl          s11, s8, s5
                  c.addi       s2, 29
                  srli         s6, s4, 1
                  c.lui        a7, 24
                  srai         s8, t5, 2
                  c.mv         a2, s2
                  slt          t0, a5, t2
                  sll          a3, s6, s2
                  xor          t3, t2, sp
                  rem          s3, a6, a4
                  c.lui        ra, 16
                  blt          s6, t5, 157f
                  c.xor        a4, s0
                  bltu         s0, ra, 162f
                  add          s3, a2, a0
                  rem          t0, s9, s0
                  andi         t5, s7, -1501
                  xor          s9, s6, a3
                  blt          s7, a4, 155f
                  c.beqz       a1, 165f
                  sltu         s0, t1, a2
                  c.li         t6, -1
                  c.mv         s2, a3
                  c.addi16sp   sp, 96
155:              or           s10, a0, s3
                  srl          s7, t1, s0
157:              c.beqz       s1, 171f
                  sra          t4, a5, t1
                  c.or         a0, a1
                  xor          t2, s10, t3
                  bltu         t5, a4, 181f
162:              sltu         a0, s1, a3
                  bge          s2, ra, 175f
                  ori          a4, a0, -167
165:              andi         s6, zero, 79
                  mulh         a2, a5, a0
                  beq          s3, s8, 170f
                  rem          a0, a6, a4
                  c.xor        s1, a4
170:              srli         s7, s9, 6
171:              c.add        s0, a3
                  bltu         s8, s8, 173f
173:              srli         s7, s10, 15
                  c.addi16sp   sp, -16
175:              sll          t5, a5, sp
                  sltiu        s7, a7, 253
                  c.nop
                  or           ra, a7, a6
                  srai         t6, a4, 16
                  c.bnez       a4, 199f
181:              xor          t5, ra, zero
                  c.or         a0, a5
                  sll          zero, t0, s0
                  sll          s9, s4, zero
                  c.srli       s0, 30
                  sub          gp, a7, t5
                  c.srli       a0, 9
                  xori         a4, s2, -1737
                  sra          a1, t3, a1
                  auipc        a7, 651715
                  bltu         gp, s5, 197f
                  c.addi       s6, 11
                  remu         sp, ra, s2
                  srli         s0, a5, 13
                  c.sub        a0, a3
                  c.nop
197:              c.beqz       a1, 205f
                  c.andi       a0, -1
199:              sra          sp, a3, s11
                  rem          t0, a0, s2
                  srli         t1, a1, 16
                  div          a2, a7, s8
                  srai         s0, t2, 25
                  c.mv         a2, s11
205:              div          s6, t6, tp
                  c.srli       s1, 8
                  blt          s8, tp, 209f
                  c.mv         s0, s8
209:              c.addi16sp   sp, 96
                  c.slli       sp, 4
                  c.nop
                  c.sub        a0, a0
                  lui          t5, 309957
                  c.addi4spn   a1, sp, 784
                  mulh         a3, s2, s6
                  xori         s3, a1, 1189
                  c.srai       a0, 17
                  auipc        s1, 668603
                  mulhu        t3, t6, t4
                  mulhu        a4, t6, s0
                  divu         t5, t2, t2
                  c.addi       t6, 31
                  bne          s1, gp, 231f
                  c.add        a3, s8
                  c.nop
                  sra          t1, a6, a0
                  nop
                  srli         t5, t5, 2
                  divu         a0, s8, t6
                  add          s9, s3, s7
231:              c.slli       ra, 15
                  c.bnez       a4, 240f
                  mulhu        a2, a2, gp
                  mulh         t0, s7, t1
                  c.and        a0, a5
                  slti         a3, s10, -842
                  sltu         s6, zero, s3
                  xor          a1, t4, s1
                  srli         t2, s8, 5
240:              xori         s1, zero, -1382
                  c.beqz       a0, 260f
                  ori          ra, gp, 1263
                  slt          t6, a2, s2
                  lui          s2, 953423
                  c.li         s3, -1
                  bltu         s3, t6, 248f
                  lui          a7, 914323
248:              c.li         s11, -1
                  mulhsu       s11, gp, s3
                  c.addi4spn   a1, sp, 384
                  andi         ra, zero, -880
                  c.srli       a3, 25
                  and          t4, s3, s4
                  c.lui        s5, 3
                  remu         a3, t1, t0
                  bgeu         sp, a2, 258f
                  or           s3, ra, tp
258:              slti         s9, s6, 553
                  divu         s11, s2, s7
260:              rem          s2, t5, s6
                  blt          s6, a0, 267f
                  c.addi4spn   s0, sp, 944
                  ori          s6, t1, 747
                  c.addi4spn   a0, sp, 192
                  c.srai       s0, 13
                  c.mv         s4, s7
267:              c.xor        s1, a4
                  div          ra, s11, gp
                  and          t3, t1, a1
                  andi         ra, t3, -1852
                  nop
                  c.nop
                  blt          a2, a1, 275f
                  blt          s0, gp, 280f
275:              c.xor        a0, a4
                  mulh         a7, a0, t5
                  c.slli       s1, 22
                  c.srai       s0, 25
                  blt          a2, t3, 296f
280:              bge          s10, s8, 289f
                  slt          t6, t6, s2
                  c.add        t4, a7
                  bgeu         s0, s7, 298f
                  ori          t3, a2, 1573
                  c.srli       s1, 2
                  xori         zero, s2, 247
                  beq          s7, s11, 305f
                  lui          sp, 90957
289:              srl          s2, s0, s5
                  c.beqz       s1, 297f
                  ori          s1, s4, 154
                  c.slli       t6, 28
                  c.sub        a3, a0
                  bltu         s5, a5, 310f
                  slli         a4, ra, 5
296:              srl          t6, t2, s1
297:              c.addi       s6, -1
298:              slli         s9, s5, 11
                  slli         ra, s8, 20
                  sub          a3, a6, a3
                  slti         s9, s0, -1233
                  add          s3, a1, a4
                  add          a1, t3, a6
                  c.and        a2, a3
305:              xori         a0, s2, -1933
                  remu         t4, s1, a7
                  lui          ra, 845141
                  c.addi4spn   a1, sp, 704
                  auipc        s10, 760509
310:              mulhu        s3, a6, a3
                  c.bnez       s0, 317f
                  c.srli       a2, 4
                  c.srli       a0, 29
                  auipc        t2, 152703
                  c.bnez       a0, 331f
                  or           a1, a7, tp
317:              remu         a4, a7, a1
                  sll          s4, s7, sp
                  sub          ra, a7, a2
                  or           s9, t3, s11
                  addi         sp, t6, -326
                  srai         t1, s3, 19
                  or           t2, ra, t4
                  c.bnez       a0, 325f
325:              c.beqz       a4, 343f
                  mulhsu       t3, gp, gp
                  srai         t4, s1, 27
                  mulhsu       s8, gp, s11
                  c.nop
                  blt          s8, s5, 344f
331:              and          a4, s3, a3
                  div          t3, t4, a3
                  beq          t0, ra, 348f
                  c.beqz       s0, 338f
                  auipc        a2, 391399
                  xor          t0, s5, s8
                  xori         a2, a2, 846
338:              addi         t2, s3, 484
                  add          a7, a4, sp
                  beq          s6, a5, 346f
                  sll          a7, s5, s9
                  c.mv         t0, s3
343:              mulh         s0, zero, s6
344:              lui          s8, 524188
                  c.srai       a1, 28
346:              auipc        s9, 356132
                  c.srli       a2, 6
348:              c.add        a0, s8
                  srl          s8, a5, t3
                  srl          zero, a7, s4
                  mulhu        s3, s11, t2
                  or           s8, s10, t3
                  bge          t6, s9, 368f
                  c.xor        a4, a2
                  add          s3, t4, sp
                  auipc        a7, 166299
                  nop
                  c.addi       s5, 26
                  c.li         s10, -1
                  srai         s4, t3, 8
                  mul          t0, t5, s3
                  c.mv         s4, t0
                  sll          gp, s5, s1
                  bltu         s8, t2, 383f
                  c.xor        s0, s1
                  sltiu        s1, a0, -926
                  c.or         s0, a3
368:              add          a7, t4, a7
                  xori         t6, t6, -111
                  c.lui        s10, 31
                  c.addi16sp   sp, -16
                  or           s5, gp, s3
                  srai         a3, a0, 27
                  sra          t1, a2, s5
                  mulhsu       ra, t4, zero
                  c.lui        s9, 5
                  sltu         s9, t1, s11
                  c.and        a4, a3
                  bltu         s6, a2, 381f
                  c.nop
381:              rem          gp, t1, s4
                  sltiu        zero, s8, -1153
383:              c.addi4spn   a0, sp, 544
                  remu         s8, a5, a3
                  mul          a1, a0, t1
                  add          s10, a3, s10
                  srai         s11, tp, 29
                  c.slli       s11, 26
                  sll          s5, s9, sp
                  c.li         s0, 6
                  sltiu        t4, s9, 238
                  beq          a7, ra, 411f
                  sra          a1, gp, a6
                  xor          zero, s3, t0
                  and          t5, t1, zero
                  remu         s11, t1, s2
                  ori          s4, s10, 1735
                  remu         t5, s3, a0
                  sra          s11, t4, sp
                  andi         s9, a5, 139
                  c.lui        t5, 2
                  c.and        a3, a2
                  mul          s6, s11, s5
                  c.or         a2, a0
                  xor          t4, s9, a1
                  c.bnez       s0, 423f
                  sub          s4, t3, t4
                  mulh         gp, t2, sp
                  sltu         s2, a7, gp
                  slt          a4, a2, a4
411:              mulhsu       t0, t4, t4
                  sltiu        s3, s4, -820
                  auipc        sp, 206067
                  c.bnez       a2, 434f
                  sltu         zero, zero, s8
                  ori          t6, gp, -1449
                  bltu         tp, s8, 419f
                  c.and        a0, a2
419:              add          t1, s8, s6
                  c.srai       a3, 26
                  c.bnez       a4, 423f
                  remu         t4, s10, s2
423:              rem          t1, a5, s5
                  bgeu         a5, s0, 428f
                  c.addi16sp   sp, -16
                  bge          a2, tp, 432f
                  add          a0, s4, a7
428:              c.beqz       a4, 435f
                  c.lui        s9, 12
                  mulhu        t4, a2, s10
                  addi         zero, t2, 463
432:              c.sub        a2, a3
                  and          zero, s9, sp
434:              slt          t1, s5, t2
435:              bgeu         s0, t3, 438f
                  remu         s7, a5, s5
                  and          t2, a7, t6
438:              mulhsu       gp, s4, a7
                  or           t3, s6, t3
                  and          sp, zero, s8
                  mulhu        t4, zero, s4
                  bne          t6, t1, 458f
                  andi         s8, t4, -1151
                  bltu         a2, s10, 445f
445:              c.slli       s2, 11
                  c.slli       t2, 5
                  c.srai       s0, 7
                  mul          t1, s6, s5
                  and          s9, s2, a3
                  mulhu        t4, ra, s3
                  blt          s0, a5, 467f
                  mulhsu       t5, t4, a7
                  nop
                  la           t3, region_1+1758 #start load_store_instr_stream_0
                  lbu          gp, 18(t3)
                  lbu          a2, 9(t3)
                  la           s5, region_0+1162 #start load_store_instr_stream_1
                  sb           a5, -21(t3)
                  lb           s11, -125(s5)
                  lb           gp, -22(t3)
                  lb           ra, -65(s5)
                  lbu          sp, 59(t3)
                  sb           t4, -39(t3)
                  sh           ra, 32(t3)
                  sh           s3, 58(t3)
                  lh           s7, 56(s5)
                  lbu          sp, -253(s5)
                  lb           t1, 63(s5)
                  lbu          t0, -241(s5) #end load_store_instr_stream_1
                  lh           t0, 38(t3) #end load_store_instr_stream_0
                  c.add        sp, s5
                  rem          a3, t3, a2
                  c.addi       a1, -1
                  c.xor        a3, s0
458:              slti         t3, s6, 1301
                  c.nop
                  sub          t4, a3, a7
                  rem          s6, zero, a4
                  c.srli       a3, 31
                  and          s1, sp, ra
                  sll          s6, a2, s4
                  bltu         s7, s9, 471f
                  mulhu        sp, a4, s10
467:              c.srli       a1, 13
                  andi         sp, s2, 42
                  c.bnez       s1, 484f
                  sub          s4, s6, s9
471:              xor          t6, t1, ra
                  or           a0, zero, t4
                  c.mv         t5, t1
                  divu         s11, sp, a7
                  sltu         s11, a3, s11
                  xori         a3, s11, -1267
                  sltiu        gp, s10, 656
                  lui          s8, 522505
                  c.xor        a3, a4
                  c.li         s9, 20
                  sub          a4, gp, s1
                  c.add        s3, sp
                  nop
484:              xori         s2, t3, 1729
                  c.sub        a3, a2
                  c.addi4spn   s1, sp, 208
                  addi         t6, ra, 1575
                  c.srli       s1, 15
                  srl          sp, t2, a4
                  sltiu        s8, a6, -1434
                  xor          s4, s3, s10
                  c.srai       s1, 7
                  divu         s6, a4, a3
                  lui          sp, 978285
                  div          sp, sp, t6
                  bne          a1, s7, 510f
                  andi         zero, t0, 502
                  bgeu         a2, s1, 506f
                  mulh         s1, gp, tp
                  ori          s3, a4, -1352
                  c.xor        s0, a5
                  divu         s6, s7, s10
                  slti         gp, a5, -1716
                  mulhsu       zero, sp, a3
                  or           a2, a3, a0
506:              lui          s0, 220589
                  bne          s3, tp, 513f
                  slli         a0, a4, 15
                  c.nop
510:              mulhu        s5, s6, a6
                  c.srai       a0, 25
                  ori          gp, a4, 788
513:              lui          t2, 624940
                  c.and        a0, a0
                  blt          s11, t1, 523f
                  slt          t6, ra, gp
                  mulhsu       zero, a5, s0
                  srai         t2, s7, 28
                  div          s2, s6, s8
                  beq          s9, tp, 528f
                  rem          sp, a1, s7
                  c.xor        a4, a2
523:              c.lui        a3, 29
                  mulhsu       s9, tp, t2
                  c.srli       a4, 22
                  c.addi16sp   sp, 32
                  srl          t3, tp, s2
528:              sll          s5, tp, s5
                  nop
                  c.beqz       a4, 532f
                  lui          s10, 621592
532:              bne          a0, s7, 533f
533:              sll          t6, t3, t3
                  add          a3, s2, t4
                  c.bnez       a3, 547f
                  srai         a0, a5, 5
                  divu         s4, t6, s7
                  c.xor        a2, a2
                  c.beqz       a0, 557f
                  mulhu        s4, t3, a0
                  c.nop
                  xori         a0, s6, 718
                  mul          t3, sp, s7
                  c.srai       a3, 17
                  nop
                  bltu         t6, t5, 564f
547:              auipc        t2, 942124
                  slt          t5, s1, s1
                  mulh         s11, ra, s4
                  c.beqz       a0, 556f
                  beq          s4, s8, 560f
                  ori          a4, t2, 1290
                  and          s2, t6, s5
                  xori         s3, s1, 1665
                  c.sub        a3, a3
556:              beq          s4, t3, 562f
557:              ori          zero, s6, 1730
                  slt          s1, t0, t2
                  c.sub        a3, s0
560:              xor          s11, s9, a1
                  xori         a3, s0, 1270
562:              beq          ra, s6, 564f
                  c.and        a2, a5
564:              srai         a7, t5, 30
                  c.srli       a0, 11
                  c.andi       a2, -1
                  c.slli       a3, 25
                  mulh         s10, s10, t1
                  c.addi16sp   sp, 480
                  c.addi4spn   a3, sp, 688
                  addi         a2, sp, -1301
                  c.addi4spn   a2, sp, 560
                  c.srai       a0, 26
                  bgeu         s0, t6, 580f
                  c.mv         s3, t5
                  c.nop
                  remu         s9, t5, s3
                  mulh         s5, t3, s10
                  c.beqz       a1, 595f
580:              c.li         s3, 8
                  c.beqz       a0, 597f
                  blt          zero, sp, 597f
                  c.sub        s0, a2
                  andi         s4, a6, 1783
                  xori         a7, s1, -1745
                  andi         s10, s1, 1603
                  mul          a2, s1, s1
                  c.add        a3, a6
                  mulhsu       s10, s11, t5
                  c.addi16sp   sp, 48
                  remu         s6, s6, tp
                  sltu         s6, t3, s8
                  c.srli       a4, 27
                  sra          a3, a3, gp
595:              srai         s1, t1, 22
                  slt          s5, s7, s7
597:              c.lui        a1, 6
                  bgeu         t3, a6, 599f
599:              and          t0, a0, a2
                  c.add        s4, s9
                  c.add        ra, s6
                  lui          s11, 1046071
                  slli         s2, s11, 28
                  xor          t1, s6, s0
                  divu         s11, a6, t3
                  c.bnez       a0, 614f
                  nop
                  srl          t5, s2, s10
                  sll          t4, t3, a2
                  mul          t6, s7, s0
                  c.lui        t3, 2
                  ori          a2, gp, -304
                  bltu         a1, gp, 615f
614:              divu         a1, s3, s5
615:              bne          t1, s3, 623f
                  c.addi       gp, 12
                  c.srli       a2, 19
                  xor          t6, t1, s2
                  srli         t4, a3, 20
                  slti         a1, s1, 110
                  addi         t6, s2, 1998
                  c.bnez       a2, 628f
623:              c.lui        ra, 18
                  nop
                  beq          s10, s1, 632f
                  ori          s4, a3, 795
                  blt          t4, a0, 633f
628:              srl          sp, a1, s10
                  andi         s1, t3, -1360
                  remu         t6, tp, t6
                  and          a3, s5, s9
632:              slli         gp, s9, 8
633:              rem          a2, a3, s1
                  auipc        s4, 423245
                  bge          gp, s11, 654f
                  c.or         s0, a4
                  c.srli       s1, 7
                  xor          t0, a7, s7
                  c.lui        s9, 1
                  beq          a6, s7, 649f
                  sltiu        t3, a1, -1553
                  c.nop
                  c.and        s0, a1
                  xor          s11, sp, s2
                  srl          t5, s5, a0
                  c.bnez       a4, 650f
                  and          s11, t5, s5
                  lui          t2, 789671
649:              c.addi       s5, -1
650:              remu         s5, a7, s6
                  c.li         a7, -1
                  c.mv         s6, s4
                  c.or         a3, s0
654:              slt          a0, a0, s10
                  c.beqz       s0, 661f
                  srl          a1, a6, s0
                  bgeu         t2, a7, 663f
                  c.srai       a4, 8
                  c.lui        t5, 30
                  c.xor        a4, a5
661:              c.addi16sp   sp, 464
                  c.add        s9, s3
663:              c.addi       a4, -1
                  bltu         a0, s6, 666f
                  c.beqz       a0, 677f
666:              srl          s7, s0, tp
                  slli         a0, s0, 24
                  mulhu        a4, ra, s10
                  srli         a3, s8, 14
                  slli         a0, a7, 25
                  sra          s1, a1, a4
                  divu         a1, a2, s4
                  mulh         s0, t3, s11
                  bne          s6, s0, 688f
                  xor          s0, a6, s3
                  c.or         a3, s1
677:              bne          a0, tp, 696f
                  addi         ra, a4, -1410
                  rem          a1, s9, sp
                  sll          s3, s11, s11
                  mulhu        a3, s1, s8
                  remu         s8, s4, ra
                  c.addi4spn   a4, sp, 448
                  auipc        t5, 483523
                  sub          a7, s1, s1
                  div          gp, a2, t1
                  sltu         s3, tp, t6
688:              c.and        a0, a1
                  slli         sp, a2, 23
                  andi         s11, t2, -311
                  mul          a4, a6, s11
                  mulh         a0, s2, t3
                  srli         t1, ra, 26
                  sltiu        ra, ra, 688
                  remu         s0, t1, s6
696:              srai         zero, s6, 9
                  add          t1, t2, a0
                  mulh         ra, t6, s11
                  srli         a3, s6, 15
                  c.and        a1, a3
                  sll          t4, a2, s8
                  mul          gp, s10, t0
                  c.sub        a2, a2
                  c.add        a2, s2
                  add          s5, s4, s3
                  c.nop
                  bge          s0, s4, 709f
                  slli         s8, gp, 23
709:              and          s8, s9, t2
                  bgeu         t5, zero, 718f
                  srl          t1, a5, t5
                  beq          a3, t6, 730f
                  srai         t2, gp, 15
                  c.li         s10, -1
                  slti         s7, sp, -1138
                  slt          t3, t2, s7
                  sltu         s0, s11, a7
718:              add          t5, a1, a0
                  addi         a7, a0, -1230
                  auipc        a7, 536110
                  remu         a1, a0, s10
                  sll          a1, t5, s8
                  srai         a1, s9, 12
                  addi         t2, gp, -623
                  rem          s10, ra, a7
                  c.addi16sp   sp, 144
                  add          s2, s5, zero
                  c.li         s10, -1
                  bltu         s11, s10, 746f
730:              srli         a7, t1, 28
                  bltu         a0, t0, 732f
732:              c.andi       a0, 15
                  slt          t0, a0, s1
                  slt          s1, s8, a2
                  c.addi4spn   a2, sp, 160
                  c.nop
                  c.mv         s9, t1
                  c.mv         s3, s2
                  sra          a0, a5, a5
                  slti         a1, t2, 1387
                  xor          s8, t6, t2
                  la           s4, amo_0+48 #start riscv_lr_sc_instr_stream_2
                  sltiu        t2, gp, 654
                  c.mv         sp, s0
                  c.xor        s0, a4
                  or           a0, a6, a1
                  c.addi       a4, 12
                  ori          a4, ra, 1904
                  sll          s7, t6, s4
                  lr.w.rl       ra, (s4)
                  divu         s10, s11, s2
                  sc.w          t1, a2, (s4) #end riscv_lr_sc_instr_stream_2
                  c.bnez       a1, 762f
                  bgeu         a7, tp, 746f
                  ori          a4, s9, 994
                  div          t5, t6, ra
746:              c.add        t4, a2
                  bltu         zero, a1, 762f
                  sra          s11, ra, t4
                  c.or         a4, a2
                  bge          a5, s1, 768f
                  addi         s10, a7, -1280
                  mulhsu       s11, a6, a2
                  and          s11, tp, a3
                  bgeu         a4, t0, 758f
                  slli         a3, s2, 18
                  c.andi       a4, 30
                  c.xor        a2, s0
758:              sll          s9, t6, a2
                  slli         t3, a6, 17
                  c.andi       a2, 28
                  blt          a6, s3, 781f
762:              bgeu         a5, s6, 768f
                  sub          s2, t3, s0
                  and          gp, a3, a5
                  blt          s11, t6, 767f
                  auipc        a4, 657199
767:              xori         t3, s5, -1078
768:              c.li         sp, -1
                  div          s4, a2, zero
                  xor          t2, s4, zero
                  bgeu         ra, t5, 772f
772:              sltu         t0, s7, a1
                  mulhsu       a2, a7, s7
                  c.addi16sp   sp, 336
                  xor          a7, s7, s10
                  addi         s8, t6, -178
                  c.sub        a2, a4
                  c.bnez       a4, 784f
                  blt          s8, a4, 787f
                  xor          s0, t5, a3
781:              lui          t5, 241028
                  c.xor        s1, s1
                  and          t5, s10, a0
784:              slli         s3, ra, 5
                  blt          a1, a1, 788f
                  c.li         t2, 2
787:              slli         a3, s5, 20
788:              c.beqz       a1, 790f
                  sltiu        s11, a4, -1840
790:              mulhsu       s9, ra, s2
                  c.sub        a1, s1
                  sltu         s11, s3, a4
                  auipc        s4, 963613
                  c.add        s11, s2
                  c.add        s2, gp
                  bge          t3, ra, 812f
                  c.srai       s1, 13
                  mulh         sp, s11, a5
                  addi         s11, s3, 584
                  c.sub        a3, a2
                  remu         t4, a1, ra
                  addi         ra, t6, -1515
                  remu         s0, a2, s9
                  srl          a4, s5, ra
                  beq          s0, t4, 811f
                  sltiu        s4, t0, 378
                  or           s3, sp, t1
                  c.li         s4, 3
                  c.bnez       s1, 815f
                  c.andi       a4, 23
811:              srli         s1, t4, 20
812:              sltiu        s10, t2, 1321
                  addi         s10, tp, 665
                  beq          s1, t4, 828f
815:              xori         sp, a4, 479
                  xori         t1, t5, 566
                  sltu         s4, ra, t5
                  c.slli       a0, 27
                  slt          s10, t3, s3
                  slt          t1, a0, s10
                  sltiu        s2, s7, -1686
                  and          s2, s3, s0
                  slti         t0, s11, -532
                  blt          s7, a5, 841f
                  sltu         t0, a2, t5
                  andi         a7, tp, 738
                  addi         s11, s3, 413
828:              andi         t0, s2, -656
                  sltu         s0, t4, s2
                  sll          a7, t1, t5
                  slt          s5, t3, gp
                  c.and        a0, a2
                  nop
                  srl          s0, s9, s3
                  slt          a7, t2, t4
                  c.and        a2, a0
                  srai         t6, t6, 29
                  c.addi16sp   sp, -16
                  blt          a5, sp, 841f
                  or           gp, s6, s4
841:              mulh         s7, ra, a4
                  ori          t3, a7, -1211
                  c.add        s7, t0
                  c.andi       a3, 19
                  c.nop
                  c.addi4spn   s0, sp, 880
                  srl          a1, a7, t1
                  srl          s3, a5, a2
                  c.bnez       a0, 867f
                  c.beqz       a0, 862f
                  sub          t0, t1, a2
                  c.addi       s8, -1
                  c.lui        s4, 25
                  sub          s9, s3, a5
                  c.nop
                  or           t4, s8, t4
                  auipc        s10, 947691
                  or           a2, a7, gp
                  andi         gp, ra, 718
                  sra          s9, a6, a7
                  c.lui        s8, 29
862:              c.addi4spn   s0, sp, 352
                  div          s8, a0, gp
                  c.and        a0, a3
                  xor          s3, t0, s11
                  c.addi16sp   sp, 320
867:              and          t6, s1, sp
                  slt          s7, a2, a2
                  c.addi4spn   a3, sp, 432
                  c.bnez       s0, 871f
871:              srl          a1, a0, s0
                  mulh         sp, tp, ra
                  c.addi       a7, 16
                  mulh         s2, s1, a0
                  add          s5, a7, a0
                  c.addi4spn   a1, sp, 800
                  or           s2, s5, t4
                  blt          s0, s11, 886f
                  or           t4, sp, a4
                  c.nop
                  bne          a1, a7, 896f
                  ori          s0, s3, 1197
                  andi         s6, s5, -1484
                  c.addi       s3, 22
                  ori          s4, t0, -1194
886:              mul          ra, s0, a5
                  c.bnez       s1, 902f
                  bne          s7, a6, 906f
                  div          s6, a6, s0
                  c.sub        s0, a2
                  c.beqz       a4, 898f
                  sra          s6, s9, gp
                  c.mv         sp, tp
                  sub          t1, s5, s3
                  srli         t4, s11, 10
896:              srli         s4, t6, 1
                  bgeu         a0, t2, 913f
898:              c.srai       s0, 21
                  c.add        ra, a1
                  c.slli       t6, 3
                  sltu         s11, a6, s4
902:              lui          s3, 973847
                  and          sp, t1, a2
                  c.slli       a7, 31
                  c.addi16sp   sp, 400
906:              c.addi       t1, 7
                  c.add        t0, a2
                  la           t5, region_0+1029 #start riscv_hazard_instr_stream_0
                  lui          a4, 949466
                  sh           a4, -47(t5)
                  c.or         s0, a4
                  slt          s0, s0, sp
                  c.sub        a4, s0
                  c.nop
                  c.add        ra, s0
                  or           ra, s4, s0
                  srai         ra, a4, 13
                  c.lui        s8, 31
                  xor          s0, s0, s8
                  lb           a4, -108(t5)
                  andi         a4, s4, 1589
                  rem          s4, ra, sp
                  sb           sp, -247(t5)
                  sh           s0, 69(t5)
                  lbu          s0, -118(t5)
                  sra          sp, s0, s4
                  lbu          s8, -97(t5)
                  lb           s8, -39(t5)
                  lhu          s4, 213(t5)
                  nop
                  add          s0, s0, s8
                  c.sub        s0, s0
                  c.xor        s0, a4
                  addi         a4, a4, -550
                  sh           ra, -51(t5)
                  slt          s0, ra, sp
                  lbu          a4, -22(t5)
                  sb           a4, 60(t5) #end riscv_hazard_instr_stream_0
                  add          a0, a4, a2
                  srl          t3, a3, sp
                  srai         s2, sp, 19
                  sltu         s3, t1, a3
                  divu         t2, s8, ra
913:              c.mv         s11, a2
                  addi         sp, t0, -1413
                  bltu         s6, t2, 923f
                  sltiu        a1, t1, 1885
                  or           s11, zero, ra
                  srli         a2, tp, 14
                  c.addi4spn   a2, sp, 544
                  mulhu        s7, ra, a1
                  srl          zero, s8, a4
                  addi         gp, t5, -1568
923:              lui          t1, 679625
                  blt          sp, a5, 943f
                  mulh         a0, s5, s11
                  c.li         t3, 6
                  remu         a2, a0, t4
                  bne          t6, s11, 937f
                  c.srai       a4, 12
                  c.bnez       a2, 949f
                  sltiu        s10, a4, 510
                  mulhu        s0, a4, a7
                  bne          s8, s11, 939f
                  or           t2, t4, t1
                  c.sub        a4, a2
                  or           s8, a0, t4
937:              beq          t2, s4, 939f
                  c.or         s1, s1
939:              div          s6, s10, t5
                  sra          s6, tp, s5
                  bge          s9, s3, 949f
                  c.li         s2, -1
943:              auipc        a2, 862133
                  srl          s2, s3, ra
                  c.nop
                  c.srai       a4, 16
                  c.xor        s0, a3
                  c.or         a4, a1
949:              nop
                  blt          t6, a3, 970f
                  bgeu         gp, sp, 957f
                  lui          t6, 131058
                  c.add        a0, a5
                  srli         s0, zero, 8
                  c.mv         gp, t0
                  c.andi       a0, 24
957:              c.addi16sp   sp, 160
                  addi         a0, a5, 1764
                  andi         t3, gp, 1221
                  mulhsu       s7, sp, sp
                  auipc        t5, 43626
                  srai         s5, zero, 0
                  c.srli       s1, 18
                  c.beqz       a1, 978f
                  srli         t4, s0, 25
                  sll          s5, s4, a4
                  c.xor        a2, a0
                  addi         a1, t4, 131
                  or           s9, s8, gp
970:              remu         s3, zero, a7
                  andi         s11, zero, 1562
                  slli         s0, s1, 8
                  mul          s4, ra, s0
                  nop
                  mulhu        s0, a1, s0
                  sltiu        ra, a5, -1116
                  andi         s6, a3, 1904
978:              c.mv         s0, ra
                  c.addi16sp   sp, -16
                  c.add        s8, a1
                  sra          s3, gp, gp
                  c.slli       s1, 5
                  c.srai       a3, 2
                  auipc        t5, 987126
                  sltu         zero, s1, s1
                  c.and        a3, a1
                  c.srai       a1, 19
                  xori         s8, a6, -1234
                  c.srli       a0, 7
                  bltu         s11, a4, 996f
                  c.add        a0, s3
                  sll          s6, gp, a7
                  bne          a3, t0, 997f
                  c.addi       t2, -1
                  nop
996:              slt          s10, s6, a4
997:              c.xor        a4, a0
                  c.nop
                  c.lui        s3, 11
                  mulh         t3, t0, a7
                  bltu         a4, a6, 1003f
                  c.lui        s7, 23
1003:             c.li         s11, 8
                  c.srli       a0, 8
                  c.lui        a2, 4
                  nop
                  xor          t2, s6, s7
                  c.nop
                  remu         s7, s9, tp
                  c.srli       a3, 20
                  c.or         a1, a3
                  mulhu        s5, s0, tp
                  c.addi16sp   sp, 240
                  c.xor        s0, a2
                  nop
                  blt          gp, ra, 1022f
                  srl          s10, s8, t5
                  mulhu        a0, t3, t5
                  bge          a7, s5, 1025f
                  ori          sp, s3, 1833
                  or           s2, t0, t4
1022:             c.beqz       s0, 1030f
                  c.srai       s0, 10
                  c.bnez       s1, 1026f
1025:             c.lui        a0, 10
1026:             andi         a0, s11, 1494
                  c.or         s0, a5
                  and          t0, s2, s6
                  srl          s5, s2, a2
1030:             bne          sp, s4, 1049f
                  bge          a4, gp, 1033f
                  bne          t3, a6, 1038f
1033:             sltu         s2, s4, a6
                  nop
                  c.slli       s3, 30
                  sll          t0, t5, tp
                  mulhu        s5, sp, s4
1038:             ori          s2, a6, -609
                  c.nop
                  c.add        t3, tp
                  beq          s0, s11, 1057f
                  bltu         ra, a0, 1059f
                  div          s4, s11, s4
                  beq          s3, a4, 1062f
                  sub          s2, a6, a5
                  beq          t2, sp, 1058f
                  and          t5, a1, zero
                  rem          t0, s0, s4
1049:             slti         s3, ra, 546
                  sra          s7, a3, t3
                  slt          t4, s2, s8
                  bne          t1, a1, 1054f
                  auipc        zero, 910034
1054:             sltu         a7, a4, ra
                  mulhsu       t1, a3, s2
                  srai         t0, s0, 0
1057:             or           zero, s8, t2
1058:             c.srli       a0, 27
1059:             c.lui        s1, 24
                  la           a7, region_0+1925 #start riscv_load_store_hazard_instr_stream_1
                  mulhsu       a4, a4, s10
                  sb           s11, -25(a7)
                  sw           a3, -25(a7)
                  c.slli       t2, 7
                  lbu          t4, 26(a7)
                  sb           gp, 26(a7)
                  lbu          s10, -18(a7)
                  add          ra, zero, a4
                  sb           s4, -18(a7)
                  ori          s7, a2, 194
                  sb           t5, -18(a7)
                  lbu          a1, -18(a7)
                  sb           s6, -18(a7)
                  lb           a0, -18(a7)
                  sb           a2, -18(a7)
                  lb           s2, -18(a7)
                  lb           s8, -62(a7)
                  lbu          ra, -2(a7)
                  sb           s10, 52(a7)
                  sb           s9, 52(a7)
                  sb           s10, 52(a7)
                  sb           t1, 52(a7)
                  lb           t0, 52(a7)
                  lb           s8, 52(a7) #end riscv_load_store_hazard_instr_stream_1
                  c.add        s10, t4
                  c.add        ra, a1
1062:             sll          a1, t6, t6
                  c.li         s0, -1
                  sltiu        a2, s2, -51
                  c.andi       a1, 27
                  c.mv         a2, s10
                  srai         s0, t4, 14
                  c.sub        s0, a2
                  remu         zero, a5, t0
                  c.slli       s4, 5
                  c.and        s0, a3
                  bne          s4, a6, 1075f
                  addi         s2, t3, -491
                  add          s3, s4, s10
1075:             slli         a1, a7, 21
                  add          ra, ra, a4
                  bgeu         s10, t0, 1078f
1078:             sltu         s10, s7, s10
                  la           t4, region_1+660 #start riscv_load_store_hazard_instr_stream_2
                  sb           s0, -52(t4)
                  sh           a6, -28(t4)
                  lb           t1, -28(t4)
                  lbu          s0, -28(t4)
                  c.and        a0, a5
                  sh           s0, -28(t4)
                  lb           a1, -46(t4)
                  lhu          a2, -46(t4)
                  lui          s7, 709349
                  lh           a7, -28(t4)
                  sb           t4, -50(t4)
                  lb           s10, -15(t4)
                  c.srai       a0, 30
                  sb           a7, -15(t4)
                  lbu          zero, -15(t4)
                  sb           sp, -15(t4)
                  lbu          s8, -40(t4)
                  lb           s5, 8(t4)
                  sb           t6, 8(t4)
                  sw           a4, 8(t4)
                  divu         s6, a2, ra
                  remu         a4, a4, tp
                  lh           s10, 8(t4)
                  lh           t0, -14(t4)
                  sb           sp, -14(t4) #end riscv_load_store_hazard_instr_stream_2
                  mul          t2, ra, t6
                  auipc        s6, 141775
                  c.and        a2, a4
                  slli         sp, t6, 8
                  c.addi4spn   a1, sp, 224
                  c.addi16sp   sp, 32
                  divu         s3, a2, s8
                  srai         s4, t3, 17
                  ori          s3, s10, -1732
                  mul          t4, s10, a2
                  c.addi4spn   a3, sp, 864
                  auipc        t1, 206121
                  srai         t1, a6, 18
                  div          a2, a2, t5
                  c.mv         t1, a0
                  bltu         t3, s6, 1113f
                  c.addi4spn   s1, sp, 608
                  ori          s7, sp, 1174
                  mulh         s11, zero, a2
                  c.srai       a3, 1
                  slt          a1, s3, s6
                  beq          s3, t1, 1108f
                  slt          s6, s8, s8
                  remu         t1, s10, s6
                  c.or         a0, a2
                  c.xor        a4, a3
                  slli         a1, s6, 18
                  c.bnez       s1, 1124f
                  c.addi       a4, 8
1108:             c.li         s3, 5
                  srai         ra, t3, 14
                  c.addi       s10, -1
                  c.add        t6, t0
                  srli         s3, a2, 14
1113:             c.add        s10, a5
                  c.bnez       a4, 1129f
                  c.and        a1, a2
                  mulh         s8, gp, s7
                  lui          a2, 930289
                  c.lui        a7, 20
                  divu         a3, a5, s10
                  ori          t6, a3, -1430
                  blt          t4, ra, 1137f
                  mulhsu       a2, s8, t2
                  c.srai       s0, 13
1124:             slt          s10, a7, s9
                  c.add        s0, tp
                  srai         t6, s0, 26
                  mul          a1, a5, t6
                  c.add        s5, s11
1129:             c.nop
                  mulhu        ra, s6, gp
                  xori         t5, t3, -1931
                  nop
                  nop
                  blt          s0, s8, 1141f
                  rem          t0, gp, s9
                  ori          s11, t0, -1628
1137:             sltiu        s1, ra, 1507
                  srai         t1, gp, 5
                  c.srai       s1, 9
                  mul          t6, a5, t1
1141:             mulhu        s1, t2, s0
                  ori          s8, s3, 935
                  c.srli       a3, 8
                  div          gp, a6, s10
                  bgeu         a7, t2, 1154f
                  rem          s6, t2, s2
                  srl          s2, s5, s0
                  lui          t2, 220791
                  blt          zero, s5, 1164f
                  c.addi16sp   sp, -16
                  bne          t4, t5, 1152f
1152:             divu         s11, t4, a4
                  beq          s7, t4, 1161f
1154:             c.add        t6, t0
                  c.or         a0, a0
                  xor          sp, t4, gp
                  srl          t6, t4, s3
                  c.bnez       a2, 1165f
                  or           a1, s1, a5
                  c.slli       s5, 30
1161:             c.sub        a3, a3
                  c.addi4spn   s0, sp, 352
                  c.or         s0, a3
1164:             beq          s8, sp, 1170f
1165:             srli         t6, zero, 16
                  bne          a6, gp, 1178f
                  slti         a2, a7, -818
                  c.nop
                  slt          a0, a5, a5
1170:             c.add        s1, a1
                  lui          t0, 964482
                  srli         t6, gp, 22
                  lui          s7, 889541
                  beq          t1, s0, 1191f
                  c.add        t0, a3
                  div          t2, a0, a2
                  blt          t2, s9, 1192f
1178:             c.li         s3, 26
                  c.beqz       a1, 1194f
                  c.addi4spn   a1, sp, 112
                  lui          t5, 333197
                  andi         s2, t6, 1245
                  c.mv         t6, a5
                  slti         sp, t5, -1537
                  sub          t4, s4, t4
                  c.sub        a2, a0
                  slli         a1, sp, 26
                  div          s11, a1, a0
                  srli         s0, s8, 24
                  c.lui        a3, 28
1191:             srl          zero, a0, a6
1192:             slli         s4, a0, 16
                  slli         s4, s1, 11
1194:             andi         a4, sp, 1623
                  c.sub        a1, a0
                  slti         sp, gp, -1980
                  srai         s2, sp, 30
                  c.and        s1, a1
                  c.beqz       s1, 1201f
                  addi         sp, t5, 1857
1201:             mulhsu       a2, t2, sp
                  c.nop
                  and          a4, a2, s7
                  slti         sp, a4, -628
                  c.and        a0, a3
                  c.nop
                  c.srai       a2, 2
                  c.addi4spn   a3, sp, 64
                  xori         s4, tp, -676
                  sltiu        s4, t6, 1310
                  sll          t5, t2, s6
                  sub          a7, t6, s1
                  c.and        a0, a1
                  c.xor        s1, a1
                  srai         a4, s1, 0
                  srli         a3, a4, 23
                  rem          a4, a3, s7
                  c.mv         ra, a1
                  slt          s8, a7, a0
                  c.slli       s3, 11
                  slti         s5, a2, 858
                  rem          sp, s1, s10
                  mulhsu       s10, s9, t3
                  sltu         sp, s2, t6
                  c.beqz       a4, 1241f
                  slti         a2, s3, 665
                  c.sub        s1, a3
                  c.addi4spn   s1, sp, 112
                  c.andi       a2, 16
                  divu         sp, s2, t4
                  bne          a5, tp, 1250f
                  remu         s3, s8, s6
                  xor          a4, s8, t4
                  c.sub        a3, a0
                  mulh         s11, a1, s11
                  bne          s10, t5, 1252f
                  xor          t4, a3, gp
                  c.li         t1, 0
                  c.nop
                  slt          a4, s2, a6
1241:             c.sub        a3, a1
                  c.li         s7, 21
                  c.srli       a0, 9
                  c.sub        a1, a3
                  c.li         s4, 11
                  and          s11, sp, t4
                  c.bnez       a0, 1255f
                  c.li         t4, -1
                  c.srai       a4, 13
1250:             c.xor        s0, s1
                  c.nop
1252:             c.mv         a0, s1
                  or           a2, t1, s10
                  c.mv         t1, t0
1255:             ori          zero, s9, 1916
                  sltu         s1, t2, gp
                  c.nop
                  c.andi       a0, 8
                  c.beqz       s1, 1268f
                  bltu         a0, t2, 1266f
                  c.lui        s10, 5
                  add          t5, tp, s5
                  c.bnez       a0, 1281f
                  add          s0, t5, s9
                  rem          s2, a7, a3
1266:             bltu         s10, t6, 1268f
                  c.lui        t0, 2
1268:             slti         a3, gp, -1600
                  slti         a7, s9, 408
                  c.slli       s9, 23
                  mulhu        t4, s1, a6
                  mulh         a7, s3, t0
                  remu         t3, s1, t0
                  lui          s0, 771283
                  bge          t1, t4, 1278f
                  c.and        s0, a1
                  c.mv         s3, s8
1278:             bge          t4, a1, 1279f
1279:             mulh         ra, s7, a3
                  srli         t2, a6, 6
1281:             addi         sp, a5, -2044
                  c.or         a2, s1
                  c.nop
                  c.xor        s1, s0
                  c.srli       s1, 3
                  mulhsu       t1, s7, t3
                  mul          a7, s1, t1
                  nop
                  c.sub        a3, a3
                  mul          s11, t1, t1
                  bgeu         a4, zero, 1299f
                  mulh         t1, tp, tp
                  c.addi16sp   sp, 160
                  c.li         a4, 22
                  c.or         a0, a3
                  c.xor        a1, a2
                  c.add        s11, t1
                  slt          s9, sp, t0
1299:             bne          a3, s5, 1305f
                  lui          s0, 880247
                  mulhsu       s1, ra, t5
                  c.nop
                  sltiu        a2, s8, -114
                  c.slli       s8, 9
1305:             sub          t3, a3, a0
                  c.and        a0, a0
                  c.add        s0, gp
                  sra          a4, gp, t0
                  slt          s5, t3, t2
                  c.li         a3, 7
                  c.andi       a4, -1
                  c.addi16sp   sp, -16
                  c.and        s1, a4
                  auipc        zero, 1007126
                  sltiu        s6, sp, -1211
                  nop
                  sltu         t1, a5, s9
                  mulh         gp, a4, t4
                  c.addi       s1, -1
                  beq          s7, t2, 1334f
                  srai         s4, s2, 14
sub_2_13:         jal          t6, 3f
0:                c.j          17f
1:                jal          ra, 2f
2:                c.j          13f
3:                c.jal        0b
4:                c.j          10f
5:                c.j          14f
6:                c.jal        15f
7:                c.j          12f
8:                c.j          6b
9:                c.j          7b
10:               c.jal        5b
11:               c.jal        1b
12:               jal          s7, 18f
13:               jal          ra, 8b
14:               c.jal        19f
15:               c.j          9b
16:               c.j          11b
17:               c.j          16b
18:               c.j          4b
19:               mulhu        s0, t5, a5
                  c.slli       s3, 30
                  rem          t6, a1, s2
                  c.lui        s11, 22
                  sra          a7, t2, zero
                  c.addi       s5, 15
                  c.srli       s0, 3
                  remu         t0, s6, a0
                  c.xor        s1, a3
                  divu         gp, tp, tp
                  sltu         t5, s3, zero
                  c.addi16sp   sp, 464
                  c.andi       a1, 14
                  la           sp, region_1+1074 #start riscv_load_store_rand_instr_stream_1
                  sb           a1, -4(sp)
                  lhu          s8, 18(sp)
                  add          s8, tp, gp
                  slt          a7, a2, a3
                  sb           a6, 59(sp)
                  sltu         zero, a2, t0
                  sb           a2, 1(sp)
                  slti         t0, t0, -284
                  sb           sp, -51(sp)
                  sw           s3, 62(sp)
                  c.mv         s2, a2
                  c.add        t0, a2
                  lb           ra, 23(sp)
                  srai         s3, a0, 17
                  lb           s3, -44(sp)
                  lhu          s6, -14(sp)
                  sb           zero, 41(sp)
                  sltiu        t0, s3, -847
                  sb           a5, -59(sp)
                  lb           zero, -29(sp)
                  sb           a2, 40(sp)
                  sb           t5, 19(sp)
                  sll          ra, s3, s4
                  sub          s5, sp, a1
                  c.li         s1, -1
                  lb           s4, 13(sp)
                  lb           ra, -7(sp)
                  lbu          s0, -51(sp) #end riscv_load_store_rand_instr_stream_1
1334:             or           s7, sp, s1
                  beq          a0, t0, 1354f
                  c.andi       a0, 6
                  srl          t1, a0, sp
                  xor          s2, a7, s9
                  rem          t1, s7, t2
                  c.andi       a1, 16
                  slli         s11, s0, 7
                  c.sub        a1, a1
                  xori         a3, a6, 128
                  sra          s8, s8, s11
                  slt          s9, a5, s0
                  c.andi       a3, 14
                  c.bnez       a1, 1367f
                  c.bnez       a4, 1350f
                  slti         s1, s9, -13
                  la           t6, region_1+634 #start load_store_instr_stream_3
                  la           a7, region_1+1395 #start load_store_instr_stream_4
                  la           sp, region_1+97 #start load_store_instr_stream_2
                  sb           t2, -6(t6)
                  la           a1, region_1+1764 #start load_store_instr_stream_0
                  lbu          s2, 7(sp)
                  sb           s9, 33(t6)
                  sb           a3, -40(a7)
                  la           s6, region_1+435 #start load_store_instr_stream_1
                  lb           t3, -2(sp)
                  sh           s1, 65(s6)
                  lb           ra, -4(sp)
                  lb           s1, 44(a7)
                  lbu          ra, -51(a1)
                  lbu          a2, 39(t6)
                  lh           t5, 51(a7)
                  sb           s11, -146(s6)
                  lb           gp, -234(s6)
                  lbu          ra, 59(a1)
                  lb           a4, -219(s6)
                  sb           zero, 229(s6)
                  sh           s5, 1(a7)
                  lbu          gp, -48(a1)
                  lb           s10, 23(t6)
                  sb           a5, -6(sp)
                  lbu          s5, 13(a1)
                  lbu          a2, -48(a1)
                  lb           s11, -16(sp)
                  sb           s4, 58(a1)
                  lbu          t1, -1(t6) #end load_store_instr_stream_3
                  lb           a2, 218(s6)
                  lbu          t2, 6(a7)
                  lhu          s10, 195(s6)
                  lbu          t5, -47(a1)
                  sb           s4, -36(a7) #end load_store_instr_stream_4
                  lbu          s8, 7(a1)
                  lbu          a0, -239(s6)
                  sb           a3, 187(s6) #end load_store_instr_stream_1
                  sb           s3, 1(sp)
                  sb           gp, 9(sp) #end load_store_instr_stream_2
                  sb           s5, -27(a1) #end load_store_instr_stream_0
1350:             c.mv         gp, a2
                  mulhu        s7, s8, a7
                  sltiu        s11, s0, -1232
                  c.sub        a1, s0
1354:             add          a0, t1, s8
                  mulhu        a4, s3, ra
                  sll          a7, a0, t4
                  c.sub        s1, s1
                  bne          s8, a5, 1359f
1359:             c.beqz       a2, 1361f
                  or           s8, tp, a3
1361:             ori          a2, s3, 990
                  addi         zero, a3, -938
                  c.beqz       a2, 1369f
                  c.or         a4, a1
                  la           sp, region_1+744 #start riscv_hazard_instr_stream_4
                  lw           a3, 196(sp)
                  slli         a1, ra, 20
                  sh           s0, -558(sp)
                  lbu          t3, -493(sp)
                  sb           s0, -505(sp)
                  c.addi       s0, 15
                  c.andi       a3, 1
                  sh           a1, 836(sp)
                  c.swsp       a1, 72(sp)
                  mulhsu       a1, t3, s0
                  c.srai       s0, 17
                  remu         t3, a3, s0
                  slli         a1, t3, 9
                  sb           t3, -635(sp)
                  sh           ra, 340(sp)
                  auipc        a3, 353666
                  sb           ra, -471(sp)
                  ori          a1, a1, -1825
                  sb           a3, 413(sp)
                  lhu          t3, 484(sp)
                  c.srai       a3, 24
                  c.slli       s0, 29
                  c.or         a1, a1
                  lb           s2, 583(sp)
                  c.xor        s0, s0
                  sb           a1, -65(sp)
                  lbu          ra, 389(sp)
                  rem          s2, a1, ra
                  sb           s2, 1091(sp) #end riscv_hazard_instr_stream_4
                  c.addi4spn   a3, sp, 832
                  addi         s2, a6, -1992
1367:             c.beqz       a1, 1373f
                  sltiu        zero, a6, 1719
1369:             sltu         s3, t2, s1
                  slti         t5, a4, -996
                  c.addi       s4, 21
                  srai         s2, a3, 20
1373:             beq          s8, s4, 1377f
                  srli         a1, a1, 11
                  mulhsu       s1, sp, a6
                  srli         t6, t3, 30
1377:             c.addi       gp, 11
                  slli         a4, t5, 29
                  sub          a1, s1, s5
                  sub          t2, tp, t3
                  sra          t0, t5, t2
                  bge          s9, s2, 1400f
                  andi         s9, s5, -92
                  mulhsu       gp, gp, s11
                  bne          s8, s5, 1393f
                  bgeu         a3, t2, 1405f
                  sltu         s2, zero, zero
                  c.mv         s5, t4
                  c.or         s1, a4
                  add          t4, t6, s11
                  c.andi       a4, 6
                  sltiu        zero, t4, 1370
1393:             c.nop
                  bge          s5, a2, 1401f
                  slti         t4, a5, 893
                  c.xor        s0, a5
                  auipc        a3, 927333
                  divu         a7, tp, a6
                  bne          s1, a6, 1414f
1400:             mul          s3, a6, s7
1401:             bgeu         t0, gp, 1410f
                  andi         a2, s2, -1450
                  addi         s10, s11, 1127
                  blt          t6, s3, 1406f
1405:             sll          t4, s6, gp
1406:             c.bnez       a3, 1412f
                  slt          a0, t6, s11
                  c.srli       a3, 25
                  srl          s9, s5, t1
1410:             c.andi       a2, -1
                  blt          s10, s9, 1427f
1412:             c.xor        a1, a1
                  addi         t1, s9, 1083
1414:             rem          s7, s11, s7
                  c.add        s9, a2
                  ori          a2, zero, 976
                  sltiu        s8, t5, 817
                  add          s10, a5, s11
                  c.srai       a0, 26
                  c.and        a2, s1
                  c.mv         a2, t4
                  bltu         t6, sp, 1428f
                  sll          a4, s10, a2
                  c.or         a2, a3
                  div          t1, s6, s1
                  c.xor        s1, a0
1427:             c.lui        a2, 9
1428:             c.srli       a2, 29
                  addi         t4, a6, -1006
                  beq          a1, a7, 1450f
                  andi         zero, t5, 254
                  sltu         a0, s7, s3
                  auipc        gp, 52200
                  c.beqz       a0, 1452f
                  slt          gp, a6, tp
                  beq          s8, a3, 1438f
                  ori          s11, s0, -902
1438:             divu         a1, s9, a1
                  sll          s9, t1, sp
                  c.add        sp, t5
                  andi         t2, s9, -146
                  c.sub        a1, s1
                  divu         a1, t0, s3
                  div          s5, t6, a3
                  mulhsu       s4, s7, s3
                  c.li         s3, -1
                  remu         s10, s10, s5
                  addi         a0, s8, -321
                  mulh         a2, t1, zero
1450:             c.srli       a2, 6
                  srl          s0, t1, s0
1452:             srl          ra, t5, a5
                  xor          gp, a2, s8
                  bgeu         s10, ra, 1455f
1455:             lui          s5, 511524
                  blt          tp, a1, 1458f
                  remu         s10, a5, t4
1458:             c.srli       a4, 8
                  bltu         t6, s8, 1460f
1460:             c.lui        ra, 23
                  nop
                  c.xor        a0, a0
                  sub          a7, a0, tp
                  auipc        s0, 1010761
                  xori         s5, tp, 830
                  c.lui        s4, 26
                  srli         s5, tp, 17
                  slli         ra, a4, 2
                  c.mv         s7, sp
                  rem          s1, s8, a7
                  c.addi16sp   sp, 192
                  auipc        a2, 818911
                  xor          s4, s7, s6
                  c.and        a1, a0
                  add          t5, a3, ra
                  c.srli       a3, 17
                  rem          s9, a1, t4
                  blt          a4, s5, 1484f
                  mulhsu       s2, t2, a4
                  nop
                  xori         a2, a6, 728
                  rem          s8, s7, a2
                  srli         s1, tp, 29
1484:             mul          a1, zero, gp
                  slti         t2, s1, -936
                  addi         s1, s0, -1704
                  andi         t5, s10, 983
                  c.nop
                  c.xor        s0, s1
                  div          sp, s11, t0
                  c.addi4spn   a3, sp, 592
                  mulh         sp, t3, tp
                  c.xor        a1, a2
                  rem          a0, s1, s3
                  c.srli       a0, 11
                  ori          s2, a7, -1256
                  c.addi4spn   a3, sp, 672
                  sltiu        s3, s0, -1994
                  ori          s1, s11, -1034
                  andi         sp, t2, -48
                  c.beqz       a3, 1516f
                  bltu         a7, tp, 1505f
                  lui          s10, 1034820
                  c.and        s1, a4
1505:             sub          a3, zero, s9
                  c.slli       s3, 5
                  mul          a2, s5, a7
                  c.sub        a3, a0
                  c.beqz       a0, 1515f
                  or           s2, s0, s10
                  c.li         s8, 14
                  bltu         s2, s8, 1520f
                  nop
                  slt          a2, t2, t2
1515:             blt          s11, t3, 1517f
1516:             divu         a4, gp, a0
1517:             c.li         s3, -1
                  or           a3, a7, a4
                  srli         s5, zero, 27
1520:             srl          s2, t4, gp
                  c.andi       a2, 20
                  add          a4, s11, s10
                  srai         a1, a3, 8
                  c.addi4spn   a0, sp, 480
                  srli         a2, t0, 9
                  c.mv         t6, a4
                  sltiu        zero, t3, -810
                  sltiu        t5, t0, 1231
                  sub          sp, t4, t0
                  addi         s1, t5, 820
                  c.sub        a1, a4
                  nop
                  bne          s3, t4, 1541f
                  c.lui        s8, 14
                  c.xor        s1, a5
                  slt          a2, sp, zero
                  srl          s7, sp, zero
                  c.or         a4, s0
                  c.bnez       a2, 1545f
                  beq          t5, s2, 1556f
1541:             mulhsu       a3, s5, tp
                  srli         t1, a4, 3
                  c.mv         gp, a7
                  div          a7, s6, a4
1545:             c.mv         s5, gp
                  sll          t1, s6, s2
                  xor          a3, s4, s7
                  blt          gp, s3, 1566f
                  beq          t4, gp, 1561f
                  mul          gp, a7, a2
                  bgeu         s1, s8, 1565f
                  c.lui        s8, 4
                  mul          t4, s0, ra
                  slt          t1, zero, ra
                  c.andi       a3, 20
1556:             c.mv         s7, s3
                  c.addi16sp   sp, 352
                  c.xor        a4, a1
                  bge          sp, t0, 1576f
                  c.li         s0, -1
1561:             c.addi       a7, -1
                  c.and        a1, a4
                  c.bnez       a4, 1582f
                  slli         s9, gp, 14
1565:             c.or         a4, a3
1566:             c.srai       a1, 15
                  and          ra, tp, t4
                  c.sub        s0, a2
                  c.srli       a0, 30
                  mulhsu       t5, a6, t1
                  sub          zero, tp, a3
                  c.slli       s6, 25
                  c.add        a2, s8
                  c.add        t2, a6
                  and          a7, a7, t6
1576:             slti         a3, s6, 816
                  srai         s6, t3, 30
                  beq          sp, s0, 1582f
                  c.addi16sp   sp, 368
                  bne          s2, s6, 1594f
                  slli         gp, s11, 9
1582:             ori          a0, a7, 1307
                  xor          sp, s11, t2
                  beq          zero, t0, 1591f
                  nop
                  c.lui        s0, 11
                  slli         t5, s1, 20
                  mul          s9, s7, a7
                  div          a4, t4, s1
                  remu         t5, s11, t3
1591:             bgeu         t3, ra, 1610f
                  auipc        s10, 589981
                  c.li         sp, -1
1594:             add          t3, t3, s10
                  auipc        ra, 681666
                  c.li         s1, -1
                  blt          t5, t3, 1613f
                  auipc        zero, 153208
                  c.add        sp, a2
                  c.nop
                  bge          s5, zero, 1609f
                  auipc        t5, 628234
                  slli         a1, t5, 25
                  c.andi       a3, -1
                  bgeu         a2, t1, 1623f
                  sltu         t5, t6, t0
                  or           t1, s8, s3
                  c.andi       a1, 0
1609:             or           s0, t1, t5
1610:             c.addi16sp   sp, 176
                  c.add        t0, s11
                  c.li         s4, 14
1613:             c.slli       t1, 9
                  addi         s5, tp, -1285
                  or           zero, sp, t1
                  c.or         a1, a3
                  mulh         s3, s10, ra
                  bne          s6, t2, 1630f
                  c.mv         s5, s9
                  divu         zero, t1, s3
                  c.addi       s10, -1
                  slti         t2, s3, -933
1623:             ori          gp, a7, 1102
                  blt          gp, t2, 1630f
                  sltiu        gp, s4, 286
                  c.nop
                  slti         a7, s2, 224
                  mulh         gp, s0, a3
                  c.andi       s1, 27
1630:             srl          a0, s1, s0
                  sll          a4, s3, s11
                  slt          s10, t4, a7
                  lw           t6, 4(tp)
                  add          a0, s10, s3
                  and          t5, a2, s8
                  addi         tp, tp, 64
                  mulhu        t0, a4, ra
2924:             addi x5, x31, 1
2924:             c.jalr x5
sub_3:            slt          a1, sp, a1
                  blt          t2, s8, sub_3_stack_p
                  mulh         s8, s1, t5
sub_3_stack_p:    addi         tp, tp, -16
                  c.addi       sp, -1
                  slt          a4, a1, ra
                  sw           t6, 4(tp)
                  addi         a4, zero, 1922
                  slli         s3, s5, 30
                  c.xor        a0, a4
                  div          a1, tp, s1
                  la           t2, region_0+1807 #start riscv_load_store_hazard_instr_stream_5
                  lb           a2, 27(t2)
                  lb           s6, 110(t2)
                  or           s0, s0, ra
                  add          s1, s8, a5
                  lbu          s5, 39(t2)
                  srli         s11, a3, 31
                  lb           s5, 39(t2)
                  srli         t3, a7, 1
                  sb           t4, 131(t2)
                  lbu          s0, 14(t2)
                  lbu          t1, 66(t2)
                  sb           s11, 113(t2)
                  lbu          s7, 158(t2)
                  sb           a2, 158(t2)
                  sb           s0, 158(t2)
                  sw           s11, -223(t2)
                  lb           t6, 11(t2)
                  ori          a1, s0, -1479
                  lbu          s8, -34(t2)
                  sb           s2, 126(t2)
                  lb           ra, -245(t2)
                  lw           t0, -159(t2)
                  lbu          sp, -57(t2)
                  lbu          a3, 32(t2) #end riscv_load_store_hazard_instr_stream_5
sub_3_76:         jal          t6, 10f
0:                c.j          11f
1:                c.jal        8f
2:                c.jal        7f
3:                jal          ra, 1b
4:                c.j          12f
5:                c.j          3b
6:                jal          ra, 2b
7:                c.j          9f
8:                c.jal        6b
9:                jal          ra, 4b
10:               c.j          0b
11:               c.jal        5b
12:               srai         t5, t3, 3
                  la           s4, amo_0+36 #start riscv_amo_instr_stream_3
                  la           s8, amo_0+44
                  la           s3, amo_0+4
                  la           s5, amo_0+28
                  amoswap.w.aq  a3, zero, (s4)
                  c.nop
                  amomin.w.aq   s7, ra, (s8)
                  xori         zero, a5, 999
                  amomin.w.aq   t2, t5, (s5)
                  amoxor.w.aq   s2, t6, (s3) #end riscv_amo_instr_stream_3
                  la           a0, region_0+1314 #start load_store_instr_stream_0
                  la           t4, region_1+736 #start load_store_instr_stream_1
                  lbu          gp, -43(a0)
                  lh           t1, -200(t4)
                  sb           a5, 38(t4)
                  lb           s6, -159(t4)
                  lbu          s8, -1221(a0)
                  sb           zero, 675(a0)
                  sb           t2, 180(t4)
                  sb           s2, 185(t4)
                  lbu          t1, -416(a0)
                  lb           s8, -784(a0)
                  sb           gp, -99(t4)
                  lbu          s1, 221(t4)
                  lhu          gp, -58(t4) #end load_store_instr_stream_1
                  sb           ra, -483(a0) #end load_store_instr_stream_0
                  la           sp, amo_0+28 #start riscv_lr_sc_instr_stream_7
                  xor          gp, s1, a2
                  lr.w.aq       ra, (sp)
                  sc.w.rl       s1, t4, (sp) #end riscv_lr_sc_instr_stream_7
                  la           s7, amo_0+32 #start riscv_amo_instr_stream_15
                  la           sp, amo_0+0
                  amoadd.w      s11, s6, (sp)
                  amoand.w      a3, a4, (s7)
                  amoand.w.rl   a2, t3, (sp) #end riscv_amo_instr_stream_15
                  la           s4, region_0+854 #start riscv_load_store_hazard_instr_stream_1
                  lh           s3, 14(s4)
                  slti         t4, a2, -1869
                  sw           t5, 14(s4)
                  remu         s1, zero, t6
                  lbu          a7, 14(s4)
                  auipc        t1, 925713
                  sll          a2, tp, ra
                  sb           gp, 14(s4)
                  lbu          s11, 14(s4)
                  lhu          t1, 14(s4)
                  lhu          s11, 14(s4)
                  lb           a7, -14(s4)
                  sb           s0, -11(s4)
                  sb           s0, -11(s4)
                  lb           s5, -11(s4)
                  sb           s11, -11(s4)
                  c.andi       s0, 0
                  sb           a7, -11(s4)
                  sh           s4, 0(s4) #end riscv_load_store_hazard_instr_stream_1
                  la           t1, region_0+1752 #start load_store_instr_stream_0
                  la           a2, region_1+211 #start load_store_instr_stream_1
                  lbu          t3, -36(t1)
                  lb           s7, 412(a2)
                  lb           s6, 177(t1)
                  lh           a0, 128(t1)
                  lb           s9, 63(t1)
                  sb           s10, -78(a2)
                  lhu          sp, 67(a2)
                  sw           ra, 196(t1)
                  lb           a0, -60(a2)
                  sb           t2, -115(t1)
                  lbu          a4, 137(t1)
                  sb           s0, 56(a2) #end load_store_instr_stream_1
                  sb           a6, -137(t1) #end load_store_instr_stream_0
                  addi         a2, zero, 2 #init loop 1 counter
                  addi         t5, zero, 3 #init loop 1 limit
                  nop
sub_3_137_1_t:    c.li         a4, 29
                  addi         a2, a2, 10 #update loop 1 counter
                  addi         a0, zero, 10 #init loop 0 counter
                  sltiu        t4, a4, 2043
                  addi         s9, zero, 10 #init loop 0 limit
                  c.li         s7, -1
                  c.andi       a1, -1
sub_3_137_0_t:    mulh         s3, t6, a5
                  addi         a0, a0, -9 #update loop 0 counter
                  bgeu         a0, s9, sub_3_137_0_t #branch for loop 0
                  c.and        a4, a4
                  mulhsu       s2, t5, a0
                  bltu         a2, t5, sub_3_137_1_t #branch for loop 1
                  c.add        s4, tp
                  la           t0, amo_0+32 #start riscv_lr_sc_instr_stream_16
                  srli         t4, s8, 16
                  addi         s5, t6, -451
                  lr.w          s2, (t0)
                  sll          a2, t5, a4
                  c.mv         t2, t6
                  mulh         s2, a6, a4
                  slli         s1, t0, 22
                  c.srai       a2, 18
                  sltu         s4, s2, a1
                  sc.w.aq       a0, t5, (t0) #end riscv_lr_sc_instr_stream_16
                  la           s6, region_0+1082 #start riscv_load_store_rand_instr_stream_6
                  sb           s8, 17(s6)
                  sltiu        t1, a7, 1537
                  lbu          sp, 41(s6)
                  lbu          t5, -1(s6)
                  sltiu        s1, s5, -44
                  c.srli       a1, 27
                  lui          s0, 848454
                  c.andi       a4, -1
                  lbu          sp, -45(s6)
                  sb           a2, 21(s6)
                  lh           ra, -38(s6)
                  lbu          t0, -61(s6)
                  c.lui        a0, 3
                  lb           sp, 3(s6)
                  sb           s2, 50(s6)
                  divu         s8, ra, a1
                  lb           ra, 11(s6)
                  sb           s4, 2(s6)
                  lb           s10, -11(s6)
                  addi         t4, s1, -1381
                  lh           gp, 32(s6)
                  lhu          a3, -42(s6)
                  xori         a2, a1, -1178
                  xor          s10, t6, t6
                  sb           a1, -6(s6)
                  lb           s0, -1(s6)
                  c.or         a1, a4
                  lbu          t3, -4(s6)
                  c.lui        t0, 19
                  srl          t1, a6, a7
                  sh           a7, 40(s6)
                  mulhu        a3, a4, s5
                  lhu          sp, -24(s6)
                  sb           s5, -17(s6) #end riscv_load_store_rand_instr_stream_6
                  la           s8, region_1+736 #start load_store_instr_stream_1
                  la           t1, region_0+477 #start load_store_instr_stream_0
                  lb           s7, -16(t1)
                  lbu          s2, -3(t1)
                  lbu          t2, -513(s8)
                  sb           a0, 1142(s8)
                  lw           sp, -13(t1)
                  sb           t0, 200(s8)
                  lbu          s6, 9(t1)
                  sb           t3, 905(s8)
                  lh           s7, -422(s8)
                  sb           s8, -18(s8)
                  lbu          t3, 13(t1)
                  lbu          s10, 936(s8)
                  lw           a4, -9(t1)
                  sh           t4, -226(s8)
                  lbu          t6, 13(t1)
                  lb           s6, -13(t1)
                  lb           s6, 2(t1)
                  sb           s1, 336(s8) #end load_store_instr_stream_1
                  lb           s3, 14(t1) #end load_store_instr_stream_0
                  la           s4, amo_0+24 #start riscv_lr_sc_instr_stream_11
                  c.andi       s0, -1
                  c.srai       a4, 3
                  lr.w.aq       s2, (s4)
                  c.addi       sp, 21
                  slt          s5, t5, sp
                  mulhsu       s2, t3, gp
                  srai         t0, gp, 8
                  add          t3, s9, tp
                  sc.w.rl       s7, a0, (s4) #end riscv_lr_sc_instr_stream_11
                  la           t3, amo_0+60 #start riscv_amo_instr_stream_0
                  c.or         a1, a5
                  sll          t5, t1, s2
                  amomax.w.rl   t4, gp, (t3)
                  amoxor.w      s9, a0, (t3)
                  amoswap.w.rl  s9, a3, (t3) #end riscv_amo_instr_stream_0
                  la           t6, region_1+1116 #start riscv_load_store_rand_instr_stream_9
                  rem          t1, s0, s3
                  c.and        a3, a0
                  mulh         sp, s6, t3
                  sb           t4, -12(t6)
                  lb           a4, -16(t6)
                  lb           a7, 5(t6)
                  slt          s8, s8, t4
                  lh           a3, 2(t6)
                  srl          sp, s6, s8
                  divu         t3, t6, gp
                  lw           gp, 8(t6)
                  c.nop
                  lhu          zero, -2(t6)
                  sb           s6, 13(t6)
                  xor          s10, ra, sp
                  sltu         a3, a6, t3
                  sh           t5, -10(t6)
                  lbu          s10, 14(t6)
                  srai         a0, a0, 31
                  mul          a2, zero, s11
                  srl          zero, s7, s11
                  c.li         t4, 4
                  sw           t1, 16(t6)
                  lhu          s1, -6(t6)
                  sll          a7, s0, s6
                  c.addi16sp   sp, -16
                  sh           s10, 6(t6)
                  lb           s9, 15(t6)
                  lbu          s11, -15(t6)
                  c.andi       a0, -1
                  xor          t3, s9, ra
                  lhu          s4, 10(t6)
                  xor          s0, t4, t3
                  div          a2, s9, sp
                  lb           s7, -9(t6)
                  auipc        t4, 864153
                  nop
                  lbu          a1, -5(t6)
                  lb           s8, 9(t6)
                  lh           t5, -14(t6)
                  lb           s0, -4(t6)
                  c.addi16sp   sp, 96
                  slt          a7, s0, s9
                  lbu          s1, -1(t6)
                  slt          s6, a1, s1
                  lbu          s1, 5(t6)
                  lb           a7, 1(t6)
                  sub          s9, t2, a0
                  sh           t2, 10(t6)
                  c.addi       s0, 5
                  sw           tp, 8(t6)
                  sb           s3, 13(t6)
                  lhu          t3, 0(t6)
                  c.addi4spn   a4, sp, 688
                  lbu          s6, 5(t6) #end riscv_load_store_rand_instr_stream_9
                  la           s6, region_1+1420 #start load_store_instr_stream_4
                  la           s3, region_1+1899 #start load_store_instr_stream_3
                  la           t4, region_1+1037 #start load_store_instr_stream_2
                  la           a1, region_1+743 #start load_store_instr_stream_1
                  lhu          s9, -27(s3)
                  lbu          s7, -172(s3)
                  sb           s5, 42(t4)
                  lb           sp, -70(s3)
                  sh           a2, -93(a1)
                  lhu          s2, -245(s3)
                  sb           s3, 194(t4)
                  lh           a0, -147(s3)
                  la           s5, region_1+1549 #start load_store_instr_stream_0
                  lb           s11, 14(a1)
                  lbu          gp, -124(a1)
                  sb           s8, -56(s6)
                  sb           zero, 22(s3)
                  lh           gp, -167(t4)
                  lhu          a2, -19(t4)
                  lb           a7, 204(a1)
                  lb           a2, -232(a1)
                  lh           t6, 28(s6)
                  sh           a7, -255(a1)
                  lb           s7, 200(t4)
                  lbu          s8, -1437(s5)
                  sb           a4, 185(t4)
                  lh           a7, 75(s3)
                  lbu          t2, 90(a1) #end load_store_instr_stream_1
                  sh           t6, -1439(s5)
                  lw           zero, -349(s5)
                  lbu          s11, -750(s5)
                  lw           s4, -141(t4)
                  lbu          s9, 57(s6)
                  lb           a0, -792(s5)
                  sb           tp, 4(s3)
                  lbu          s0, 99(s3) #end load_store_instr_stream_3
                  lb           sp, -531(s5)
                  lbu          t5, -49(s6)
                  lhu          s10, 185(t4)
                  lb           gp, -109(t4) #end load_store_instr_stream_2
                  lbu          s10, -39(s6) #end load_store_instr_stream_4
                  sb           a1, 91(s5) #end load_store_instr_stream_0
sub_3_62:         jal          t6, 7f
0:                c.jal        10f
1:                jal          ra, 6f
2:                c.j          9f
3:                jal          ra, 2b
4:                c.jal        8f
5:                c.j          0b
6:                c.j          3b
7:                jal          a7, 4b
8:                jal          ra, 1b
9:                c.jal        5b
10:               c.lui        t5, 3
                  la           sp, region_0+887 #start riscv_load_store_rand_instr_stream_12
                  mulhu        s4, t5, a3
                  c.sub        a4, s0
                  sb           a1, -5(sp)
                  c.slli       t0, 22
                  ori          a0, a4, 783
                  lbu          t0, -7(sp)
                  lbu          s5, 14(sp)
                  sltu         t3, sp, a1
                  sh           t5, -1(sp)
                  c.lui        s1, 15
                  sb           s10, 9(sp)
                  sra          s9, t0, a2
                  lbu          a0, -12(sp)
                  c.nop
                  slli         s5, t0, 29
                  c.li         t1, -1
                  lb           zero, 5(sp)
                  andi         t4, t0, -302
                  slli         t2, t1, 12
                  divu         a1, a5, s2
                  c.or         a1, s1
                  c.lui        t0, 31
                  ori          t6, a6, -76
                  lb           a7, 10(sp)
                  lbu          zero, 5(sp)
                  sb           s11, 12(sp)
                  c.slli       t0, 31
                  lhu          a1, 13(sp)
                  lb           t3, -10(sp)
                  c.add        s11, s2
                  and          s5, t5, s4
                  add          ra, a2, t2
                  sb           a7, 2(sp)
                  andi         s8, a1, 440
                  c.xor        a4, a1
                  srl          a2, s5, a7
                  or           t0, s8, a4
                  sltu         s6, s7, t3
                  lb           a7, 2(sp)
                  c.slli       a7, 26
                  mulhu        s5, s4, s9
                  xor          a4, s8, tp
                  sltiu        s1, s0, -1678
                  xori         a2, s0, -1357
                  sb           a2, 0(sp) #end riscv_load_store_rand_instr_stream_12
                  la           sp, region_0+708 #start riscv_load_store_rand_instr_stream_5
                  c.nop
                  lbu          gp, 183(sp)
                  and          s3, t5, t0
                  sb           t3, -59(sp)
                  mulhsu       a1, ra, t4
                  sra          t0, s2, a2
                  sb           t2, -239(sp)
                  add          t6, a6, tp
                  lbu          a0, 183(sp)
                  lw           t6, 176(sp)
                  mul          t4, t5, s5
                  c.sub        a3, a5
                  c.or         a4, a3
                  sb           s3, 94(sp)
                  sb           t2, -253(sp)
                  ori          s7, s1, -824
                  c.add        a2, t3
                  slt          a1, a7, s8
                  c.srli       s1, 3
                  div          s9, t3, s5
                  lb           s11, -165(sp)
                  sb           s11, 161(sp)
                  nop
                  lb           t1, -221(sp)
                  or           t2, t5, t1
                  sb           s6, 223(sp)
                  sltu         s5, s11, a7
                  sb           t2, 107(sp)
                  lb           s2, 187(sp) #end riscv_load_store_rand_instr_stream_5
                  la           sp, region_0+480 #start riscv_hazard_instr_stream_27
                  sb           s0, 243(sp)
                  sb           t6, 587(sp)
                  sb           t0, 372(sp)
                  lbu          t0, 95(sp)
                  sb           t6, 311(sp)
                  c.srli       s0, 13
                  lbu          s0, -443(sp)
                  sltiu        s4, t0, -419
                  or           s0, ra, ra
                  lb           t0, 1177(sp)
                  lhu          a4, 846(sp)
                  lb           s4, -71(sp)
                  lh           s4, 1282(sp)
                  c.or         s0, s0
                  mulhsu       t0, a4, a4
                  sb           t6, -121(sp)
                  c.li         t6, -1
                  lbu          ra, -71(sp)
                  addi         a4, s4, 1450
                  sb           s0, 1330(sp)
                  sb           ra, 1194(sp)
                  sb           s0, 1114(sp)
                  sltiu        a4, s0, -1560
                  lb           a4, 775(sp)
                  sb           t0, -233(sp)
                  c.srli       s0, 15
                  lb           s0, 881(sp)
                  lh           s4, -430(sp)
                  lb           a4, 65(sp)
                  mul          s0, ra, s0
                  c.andi       s0, 30
                  mulhsu       ra, s4, ra
                  sh           t0, -72(sp)
                  rem          s4, ra, s4
                  lbu          s4, -23(sp)
                  srl          ra, s4, s4
                  lb           a4, 373(sp)
                  sw           s4, 1364(sp) #end riscv_hazard_instr_stream_27
                  la           t6, amo_0+60 #start riscv_lr_sc_instr_stream_14
                  sltiu        s2, a6, -1053
                  remu         s2, s1, t0
                  lr.w.aq       a7, (t6)
                  sc.w.rl       t3, s3, (t6) #end riscv_lr_sc_instr_stream_14
                  addi         a1, zero, -6 #init loop 0 counter
                  srai         zero, tp, 21
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 336
                  mulhsu       gp, t3, s11
                  addi         s3, zero, -2 #init loop 0 limit
                  mulhsu       s4, a0, t1
sub_3_146_0_t:    c.or         a3, a1
                  addi         a1, a1, 4 #update loop 0 counter
                  mulhsu       s8, a1, a6
                  bne          a1, s3, sub_3_146_0_t #branch for loop 0
                  sll          a7, t0, gp
sub_3_63:         jal          t6, 20f
0:                c.j          26f
1:                c.j          23f
2:                jal          ra, 8f
3:                c.jal        14f
4:                c.jal        10f
5:                c.jal        15f
6:                c.jal        2b
7:                c.j          12f
8:                c.j          3b
9:                jal          ra, 13f
10:               c.jal        11f
11:               jal          gp, 25f
12:               c.j          19f
13:               jal          s2, 7b
14:               c.j          24f
15:               c.j          29f
16:               jal          ra, 28f
17:               c.jal        5b
18:               jal          ra, 9b
19:               c.jal        22f
20:               c.j          16b
21:               c.j          18b
22:               c.jal        27f
23:               c.j          17b
24:               c.jal        1b
25:               jal          ra, 0b
26:               jal          t2, 6b
27:               c.j          4b
28:               c.j          21b
29:               sra          s9, a6, a0
                  la           sp, region_1+1858 #start riscv_hazard_instr_stream_13
                  addi         a2, t6, 1016
                  add          s6, s3, a2
                  addi         s1, s3, 3
                  lhu          t6, -284(sp)
                  lbu          s3, -453(sp)
                  sb           s1, -1244(sp)
                  sltu         s1, s6, s6
                  sub          s6, s3, s6
                  lbu          s5, -844(sp)
                  and          t6, s6, s3
                  c.srli       a2, 24
                  c.xor        a2, s1
                  mulhu        s5, s5, t6
                  mulhu        s3, a2, s3
                  xor          a2, t6, s3
                  lbu          a2, -1145(sp)
                  addi         s5, t6, -1376
                  c.add        a2, s6
                  c.slli       s1, 4
                  andi         a2, s5, -651
                  lui          s6, 25605
                  c.addi       t6, -1
                  c.srli       a2, 20
                  c.addi       s6, -1
                  c.or         s1, s1
                  sb           a2, -837(sp)
                  sb           s3, -357(sp)
                  sb           s5, -106(sp)
                  c.li         s1, 22
                  sh           a2, -1760(sp)
                  addi         t6, s6, -806
                  nop
                  sb           s1, -1085(sp)
                  c.lui        s1, 25
                  ori          s3, s3, 1943
                  or           s1, s3, t6
                  lb           t6, -1712(sp) #end riscv_hazard_instr_stream_13
                  la           t2, region_0+381 #start riscv_hazard_instr_stream_4
                  lbu          s9, -10(t2)
                  div          s0, t3, t1
                  lb           t3, 4(t2)
                  auipc        s9, 627212
                  sb           s0, -1(t2)
                  lb           s7, -4(t2)
                  lb           s9, 6(t2)
                  and          t3, s8, s9
                  and          s7, s0, s7
                  mul          t1, s0, t3
                  xori         t1, s7, 998
                  remu         s9, s9, t3
                  slt          t3, s9, t3
                  lb           t1, -14(t2)
                  lb           t3, 6(t2)
                  c.srai       s0, 11
                  ori          s0, s9, -1112
                  sb           s0, 10(t2)
                  sub          s9, s8, t3
                  slti         t1, s7, -843
                  lw           t3, -1(t2)
                  lh           s0, 5(t2)
                  c.andi       s0, -1
                  lb           s7, 16(t2)
                  c.xor        s0, s0
                  sltu         t3, s7, s9
                  mulh         t3, s8, s9
                  c.srai       s0, 18
                  lbu          s8, -16(t2)
                  lbu          s0, -6(t2)
                  div          s7, s9, s9
                  lbu          s7, 7(t2)
                  lhu          s9, -11(t2)
                  lb           s8, 14(t2)
                  and          t3, t3, s9
                  xor          s9, s9, s7
                  c.srli       s0, 29
                  c.lui        s0, 26
                  c.and        s0, s0
                  srl          s7, s8, t3
                  lui          t1, 130908
                  sh           s7, -7(t2)
                  sb           s7, -14(t2)
                  c.andi       s0, -1
                  divu         s9, s0, t1
                  srai         s8, s9, 20
                  lb           s9, 16(t2)
                  lb           t3, -11(t2)
                  sll          s7, s9, s7
                  lb           s0, 4(t2)
                  lb           t3, -7(t2)
                  lh           t3, -15(t2)
                  sb           t3, -10(t2) #end riscv_hazard_instr_stream_4
sub_3_56:         jal          t6, 17f
0:                jal          ra, 25f
1:                jal          a1, 12f
2:                c.jal        10f
3:                c.j          5f
4:                c.jal        27f
5:                c.jal        23f
6:                c.jal        9f
7:                jal          t1, 22f
8:                c.jal        11f
9:                jal          a0, 3b
10:               c.jal        0b
11:               c.j          19f
12:               c.j          13f
13:               c.j          18f
14:               c.j          1b
15:               c.j          7b
16:               c.jal        26f
17:               jal          t0, 14b
18:               c.j          16b
19:               c.jal        4b
20:               jal          t1, 21f
21:               jal          ra, 6b
22:               jal          t1, 24f
23:               c.jal        2b
24:               jal          t1, 20b
25:               c.jal        8b
26:               jal          ra, 15b
27:               c.andi       a4, -1
                  la           s9, region_1+210 #start riscv_load_store_rand_instr_stream_16
                  and          s8, a2, s3
                  remu         a2, tp, s4
                  sh           ra, 1056(s9)
                  lh           a7, 82(s9)
                  c.andi       s0, -1
                  c.or         a2, a2
                  divu         s3, a6, s9
                  addi         s11, s7, -1608
                  lbu          a4, 531(s9)
                  auipc        ra, 199549
                  sltu         s5, t3, s10
                  addi         zero, a4, 172
                  sltu         s3, a2, s7
                  sb           t1, 805(s9)
                  srli         s4, s10, 23
                  mulhsu       t0, s5, a1
                  lb           s7, -174(s9)
                  remu         s0, s0, s5
                  c.nop
                  sh           ra, 598(s9)
                  or           s1, a7, t1
                  sb           t4, 893(s9)
                  lb           t0, 4(s9)
                  slti         s3, s1, -383
                  lh           t1, 424(s9)
                  lb           t2, 1442(s9) #end riscv_load_store_rand_instr_stream_16
sub_3_64:         jal          t6, 17f
0:                c.j          18f
1:                c.j          16f
2:                c.jal        7f
3:                c.jal        8f
4:                c.jal        9f
5:                c.j          4b
6:                c.jal        1b
7:                c.jal        5b
8:                c.j          0b
9:                jal          ra, 3b
10:               c.j          13f
11:               c.jal        10b
12:               c.j          15f
13:               jal          s7, 14f
14:               c.j          6b
15:               c.j          2b
16:               c.j          12b
17:               jal          ra, 11b
18:               c.jal        19f
19:               sltu         ra, a7, a4
                  la           t4, region_1+134 #start riscv_hazard_instr_stream_18
                  sltiu        t5, a2, 2042
                  lb           a2, 195(t4)
                  sub          t2, a2, t5
                  sb           a2, 171(t4)
                  lb           s0, 92(t4)
                  c.li         a1, -1
                  div          a1, t2, t5
                  sb           t2, -31(t4)
                  xor          a1, t5, s3
                  c.add        s0, t5
                  lui          a2, 134065
                  lbu          s0, -15(t4)
                  xori         t5, a1, 1735
                  sltu         s3, s3, t5
                  lb           t5, -67(t4)
                  srli         a2, s0, 3
                  sb           t5, 149(t4)
                  slti         s3, s0, 160
                  lh           s3, 180(t4)
                  ori          s0, s0, -1507
                  c.xor        a2, s0
                  divu         s0, a2, t5
                  c.slli       t2, 20
                  remu         a2, t2, a1
                  c.sub        a2, a1
                  sh           a1, 196(t4)
                  lhu          a2, 210(t4)
                  sltiu        s3, a1, -253
                  lb           t2, 51(t4)
                  lhu          t5, 182(t4)
                  c.sub        a1, a1
                  lbu          a2, 26(t4) #end riscv_hazard_instr_stream_18
                  la           s1, region_1+1953 #start load_store_instr_stream_1
                  la           s7, region_1+1926 #start load_store_instr_stream_0
                  lb           s4, -170(s1)
                  la           t4, region_1+688 #start load_store_instr_stream_3
                  lb           a2, 59(t4)
                  lbu          a4, -9(s7)
                  lb           s8, -168(s1)
                  lbu          s2, -58(s7)
                  la           t2, region_1+553 #start load_store_instr_stream_2
                  sh           a3, -164(s7)
                  lh           s8, -200(s7)
                  sb           t2, 13(t4)
                  lbu          t0, -224(s7)
                  lhu          s11, -58(t4)
                  lb           a3, -38(t4)
                  lhu          zero, 17(t2)
                  lbu          a4, -51(t4)
                  lbu          a2, -237(s1)
                  lbu          t6, -40(t2)
                  sb           t0, 55(t4)
                  lb           a3, -168(s1)
                  sb           s11, -23(t4)
                  sb           s8, -112(s7)
                  lbu          s5, -37(t4)
                  sb           s2, 1(t2)
                  sb           zero, -4(t2)
                  lhu          s2, 26(t4) #end load_store_instr_stream_3
                  sh           gp, -33(t2) #end load_store_instr_stream_2
                  sb           a4, -108(s1) #end load_store_instr_stream_1
                  lbu          a2, -7(s7)
                  lbu          s11, 31(s7) #end load_store_instr_stream_0
                  la           sp, region_0+201 #start riscv_hazard_instr_stream_23
                  andi         s11, zero, -728
                  divu         t0, s6, s11
                  c.and        a3, a3
                  divu         s11, s7, t0
                  lbu          s11, -38(sp)
                  c.srai       a3, 10
                  srai         s7, zero, 26
                  srl          s6, zero, s7
                  xori         s6, s7, -806
                  sb           s7, -106(sp)
                  auipc        a3, 745229
                  srli         zero, zero, 14
                  c.li         t0, -1
                  c.and        a3, a3
                  mulh         s6, a3, t0
                  lbu          s6, 126(sp)
                  lb           zero, -75(sp)
                  lbu          s7, -118(sp)
                  c.mv         t0, s7
                  sb           s6, 6(sp)
                  lhu          s11, 221(sp)
                  ori          s7, s7, 493
                  c.srai       a3, 21
                  sb           s6, -136(sp)
                  lb           s6, 70(sp)
                  srl          s11, a3, t0
                  or           s6, s11, s6
                  lb           s6, -182(sp)
                  sltiu        zero, zero, 1193
                  slli         t0, a3, 24
                  c.li         s11, -1
                  lb           a3, 199(sp)
                  sltu         s7, t0, s11
                  sh           s7, 127(sp) #end riscv_hazard_instr_stream_23
                  addi         a3, zero, 3 #init loop 0 counter
                  slt          s5, s7, s1
                  c.lui        s5, 2
                  addi         t1, zero, 16 #init loop 0 limit
                  c.or         a0, a5
sub_3_152_0_t:    auipc        a1, 277056
                  c.or         s0, s1
                  sll          t2, s6, t1
                  addi         a3, a3, 5 #update loop 0 counter
                  auipc        t0, 410400
                  bltu         a3, t1, sub_3_152_0_t #branch for loop 0
                  c.srli       s0, 29
                  la           a2, region_0+1709 #start riscv_hazard_instr_stream_10
                  lbu          s7, -9(a2)
                  sb           sp, 2(a2)
                  lbu          ra, -2(a2)
                  lbu          sp, 1(a2)
                  lbu          a4, -8(a2)
                  sb           a7, 5(a2)
                  lbu          t5, 14(a2)
                  lbu          sp, -2(a2)
                  srai         ra, s7, 16
                  sb           sp, -10(a2)
                  sb           s7, -16(a2)
                  lbu          ra, 6(a2)
                  srai         s7, s7, 9
                  lw           a7, -5(a2)
                  remu         sp, a4, t5
                  lb           sp, -2(a2)
                  lbu          s7, -6(a2)
                  xor          ra, t5, sp
                  auipc        t5, 55062
                  sb           a4, 2(a2)
                  sw           s7, -9(a2)
                  sb           s7, -1(a2)
                  sb           ra, -12(a2)
                  xori         a4, a7, 1819
                  c.slli       ra, 31
                  c.lui        s7, 28
                  lw           a4, -5(a2)
                  lbu          sp, 6(a2)
                  c.or         a4, a4
                  or           ra, a4, a4
                  c.srai       a4, 20
                  lw           t5, 11(a2)
                  lbu          sp, 5(a2)
                  lb           t5, 4(a2)
                  and          s7, a7, a7
                  lb           t5, 12(a2)
                  lb           sp, -5(a2)
                  sb           s7, 4(a2) #end riscv_hazard_instr_stream_10
                  addi         t2, zero, -7 #init loop 0 counter
                  addi         t1, zero, 12 #init loop 0 limit
sub_3_138_0_t:    c.li         s7, -1
                  addi         t2, t2, 8 #update loop 0 counter
                  blt          t2, t1, sub_3_138_0_t #branch for loop 0
                  c.or         a1, s0
                  la           sp, region_1+681 #start riscv_hazard_instr_stream_2
                  sb           zero, -56(sp)
                  sw           a7, -237(sp)
                  lh           s4, -51(sp)
                  srl          a7, s5, s4
                  lh           a4, 255(sp)
                  sb           zero, -28(sp)
                  lb           s4, 78(sp)
                  lbu          a4, 62(sp)
                  lbu          s4, -30(sp)
                  c.slli       s4, 10
                  sltu         s5, s4, a4
                  mulhu        a4, s4, s5
                  lb           t0, -156(sp)
                  sw           zero, -113(sp)
                  divu         t0, a7, a7
                  sb           a7, -99(sp)
                  andi         s5, a4, -1125
                  slt          zero, a7, t0
                  auipc        a7, 212215
                  lbu          a7, 241(sp)
                  lbu          s4, 252(sp)
                  sra          a7, s4, s5
                  divu         zero, a4, s5
                  lb           a7, 225(sp)
                  lbu          zero, -20(sp)
                  lbu          s4, -176(sp)
                  sb           zero, -17(sp)
                  ori          a7, zero, -367
                  lb           a4, 40(sp)
                  c.or         a4, a4
                  sb           a4, -129(sp)
                  mulhsu       t0, s4, s5
                  srai         zero, s4, 12
                  sb           t0, -68(sp) #end riscv_hazard_instr_stream_2
                  la           a3, region_0+140 #start load_store_instr_stream_0
                  la           s2, region_1+1253 #start load_store_instr_stream_1
                  lh           ra, 60(a3)
                  sb           s2, -59(a3)
                  lhu          s6, -249(s2)
                  sh           s8, 10(a3)
                  lbu          t1, -332(s2)
                  lb           s6, 30(a3)
                  sb           s1, 80(s2)
                  sb           gp, -852(s2)
                  lhu          s9, -479(s2) #end load_store_instr_stream_1
                  lhu          s3, 64(a3) #end load_store_instr_stream_0
                  la           s8, amo_0+12 #start riscv_lr_sc_instr_stream_12
                  c.sub        a4, a1
                  srai         a2, ra, 16
                  c.srai       s0, 2
                  srl          t4, tp, a6
                  c.srai       a2, 21
                  auipc        t1, 766863
                  lr.w          s6, (s8)
                  add          a4, a2, s6
                  sc.w.aq       t6, s11, (s8) #end riscv_lr_sc_instr_stream_12
                  la           gp, region_1+519 #start load_store_instr_stream_0
                  la           t3, region_0+384 #start load_store_instr_stream_1
                  lhu          t4, 31(gp)
                  sh           s9, -24(t3)
                  lh           t1, -38(t3)
                  lbu          t0, 61(t3)
                  lb           t0, 4(gp)
                  lb           s3, -17(t3)
                  sb           a7, 50(t3)
                  sh           a1, 57(gp)
                  lbu          a0, -9(gp)
                  sh           a7, -24(t3)
                  sb           t0, 48(gp)
                  lb           t5, -55(t3)
                  lhu          a2, -25(gp)
                  lh           a3, -42(t3) #end load_store_instr_stream_1
                  lb           a3, 14(gp) #end load_store_instr_stream_0
sub_3_74:         jal          t6, 2f
0:                c.jal        5f
1:                jal          sp, 18f
2:                c.jal        13f
3:                c.j          11f
4:                jal          ra, 3b
5:                jal          t1, 19f
6:                c.j          17f
7:                c.j          14f
8:                jal          ra, 22f
9:                c.jal        0b
10:               c.j          20f
11:               c.j          21f
12:               c.j          24f
13:               c.j          9b
14:               jal          t1, 10b
15:               jal          ra, 1b
16:               c.jal        7b
17:               c.jal        8b
18:               c.j          16b
19:               jal          ra, 12b
20:               jal          s1, 23f
21:               c.j          15b
22:               c.jal        25f
23:               c.j          6b
24:               c.j          4b
25:               slti         s10, s3, -289
sub_3_77:         jal          t6, 14f
0:                c.j          24f
1:                c.jal        16f
2:                jal          ra, 3f
3:                c.j          11f
4:                c.jal        10f
5:                c.jal        21f
6:                c.j          0b
7:                c.jal        9f
8:                c.j          23f
9:                c.j          5b
10:               jal          ra, 20f
11:               c.jal        1b
12:               c.j          17f
13:               jal          a0, 4b
14:               c.jal        12b
15:               jal          t5, 28f
16:               jal          t1, 8b
17:               c.jal        6b
18:               c.j          26f
19:               c.j          15b
20:               c.jal        7b
21:               c.jal        25f
22:               c.jal        18b
23:               jal          ra, 27f
24:               jal          t3, 13b
25:               c.jal        22b
26:               c.j          2b
27:               c.jal        19b
28:               xor          a7, a5, a7
                  la           s4, amo_0+44 #start riscv_lr_sc_instr_stream_13
                  add          a2, a0, s0
                  remu         a3, s2, t4
                  c.and        a1, a5
                  mulh         sp, ra, gp
                  srai         s7, a2, 9
                  c.mv         s10, s2
                  lui          s10, 644037
                  remu         sp, a4, s2
                  andi         a4, a5, 658
                  xori         ra, t5, -1606
                  lr.w.aq       zero, (s4)
                  mul          a0, t2, zero
                  mulhu        s10, t1, s6
                  div          s6, s4, s9
                  c.addi       t0, 28
                  mul          s11, a2, a3
                  sc.w.rl       s3, a4, (s4) #end riscv_lr_sc_instr_stream_13
                  addi         a0, zero, 10 #init loop 0 counter
                  c.li         s2, -1
                  sub          s7, a3, s9
                  mulhsu       s3, s0, sp
                  c.add        sp, s1
                  c.slli       t1, 9
                  addi         zero, zero, 0 #init loop 0 limit
                  c.sub        s0, a1
sub_3_140_0_t:    c.or         s0, a2
                  addi         a0, a0, -5 #update loop 0 counter
                  c.nop
                  xor          a4, t6, a3
                  slti         s8, a4, -819
                  c.bnez       a0, sub_3_140_0_t #branch for loop 0
                  ori          s9, a3, 1496
                  la           s2, region_0+459 #start load_store_instr_stream_2
                  lb           t6, 151(s2)
                  la           s10, region_0+460 #start load_store_instr_stream_1
                  lb           s1, -23(s2)
                  la           a7, region_0+1177 #start load_store_instr_stream_0
                  lb           zero, 33(s2)
                  lb           t5, 188(s2)
                  lhu          s0, 553(a7)
                  lb           t6, 191(s2)
                  lb           t0, -206(s2)
                  lb           s9, -442(a7)
                  lb           s5, -78(s2)
                  sb           s10, -53(s10)
                  lh           t4, -805(a7)
                  sw           t5, -64(s10)
                  lb           s7, 64(s10)
                  lb           a0, -184(a7)
                  sh           s0, -6(s10)
                  lb           a0, -743(a7)
                  sb           s0, -55(s10) #end load_store_instr_stream_1
                  lh           ra, -681(a7)
                  lbu          a1, -34(s2) #end load_store_instr_stream_2
                  lhu          a1, -673(a7)
                  lbu          t4, 492(a7) #end load_store_instr_stream_0
                  la           t0, region_0+983 #start load_store_instr_stream_1
                  la           s9, region_0+747 #start load_store_instr_stream_0
                  lb           a3, 28(t0)
                  lbu          s6, -195(s9)
                  sb           a0, -38(t0)
                  lbu          t6, -176(s9)
                  lb           ra, 98(s9)
                  lbu          a2, 57(t0)
                  lbu          s4, -179(s9)
                  sh           t0, -41(s9)
                  lbu          s3, -40(t0)
                  sh           s11, -83(s9)
                  sh           a7, -231(s9)
                  lbu          s3, 25(t0)
                  lbu          s4, -191(s9)
                  lw           s1, -39(t0)
                  sh           t1, 23(t0) #end load_store_instr_stream_1
                  lb           s2, -237(s9)
                  lb           a2, -182(s9) #end load_store_instr_stream_0
                  la           s11, region_0+939 #start load_store_instr_stream_1
                  sb           a5, -15(s11)
                  sb           t0, -8(s11)
                  la           a0, region_1+167 #start load_store_instr_stream_0
                  lh           gp, 5(s11)
                  lbu          gp, -154(a0)
                  lbu          t5, 6(s11)
                  lb           t1, 132(a0)
                  sb           t3, -5(s11)
                  sw           s1, 45(a0)
                  lhu          s7, 1(s11)
                  sh           s6, -61(a0)
                  sb           s3, -4(s11)
                  lb           t4, 4(s11)
                  lb           t3, 4(s11) #end load_store_instr_stream_1
                  sh           a7, 91(a0) #end load_store_instr_stream_0
                  la           sp, region_1+946 #start riscv_load_store_rand_instr_stream_1
                  sb           s11, 259(sp)
                  srl          t2, s2, t5
                  lb           t4, 425(sp)
                  c.srai       a0, 6
                  c.or         a3, s0
                  sb           a6, 379(sp)
                  sb           s8, -240(sp)
                  c.lui        s4, 1
                  sb           gp, -255(sp)
                  sub          s6, s7, a0
                  lbu          a1, -419(sp)
                  lbu          s1, -755(sp)
                  c.addi       s3, -1
                  c.lui        s1, 26
                  sb           ra, -241(sp)
                  lbu          t4, 715(sp)
                  sh           s0, 514(sp)
                  mulh         t5, t3, s9
                  slti         s8, s4, 1356
                  sh           s7, -90(sp)
                  sltiu        s5, t2, 1771
                  lb           s6, -636(sp) #end riscv_load_store_rand_instr_stream_1
                  la           t2, region_0+1783 #start load_store_instr_stream_0
                  la           t1, region_1+1190 #start load_store_instr_stream_1
                  lb           t6, -2(t1)
                  lb           t6, 2(t2)
                  sb           ra, 10(t2)
                  lhu          s10, 2(t1)
                  lbu          a7, -5(t2)
                  sh           s5, -7(t2)
                  sw           s11, 6(t1)
                  sb           s8, 10(t2)
                  lbu          s5, 0(t1)
                  lbu          ra, -12(t1)
                  lbu          s8, -12(t2)
                  lb           a0, 5(t1)
                  lbu          a3, 16(t2)
                  lhu          a3, 4(t1)
                  sb           t6, 1(t2)
                  sh           s3, 0(t1)
                  lbu          a4, 16(t2)
                  sh           s5, 12(t1)
                  sb           s2, 16(t1) #end load_store_instr_stream_1
                  lbu          t3, 2(t2) #end load_store_instr_stream_0
                  la           a4, region_1+606 #start riscv_load_store_rand_instr_stream_24
                  sh           s7, -152(a4)
                  lb           a0, 165(a4)
                  sb           s6, -81(a4)
                  srli         a3, a3, 26
                  lbu          a0, -191(a4)
                  c.addi       s11, 31
                  c.srli       a2, 31
                  rem          a2, a1, s11
                  c.sub        a1, a3
                  addi         a0, s0, 1945
                  c.mv         a2, s2
                  slli         s0, a1, 20
                  lh           t3, 222(a4)
                  sb           s6, -63(a4)
                  div          s0, s7, t2
                  c.or         a2, a5
                  c.or         s0, a1
                  c.addi16sp   sp, -16
                  sb           ra, -13(a4)
                  lh           s8, 250(a4)
                  nop
                  c.mv         a1, a4
                  c.addi4spn   a0, sp, 672
                  nop
                  mulhu        zero, s10, gp
                  lb           s3, -199(a4)
                  lh           t0, 162(a4)
                  lw           t0, -246(a4)
                  lb           t0, -7(a4)
                  sh           s9, -130(a4)
                  lbu          a1, 126(a4)
                  lb           t5, -143(a4)
                  mulhsu       t3, a7, a3
                  c.slli       gp, 19
                  divu         t3, s10, t0
                  sb           ra, -75(a4)
                  remu         gp, s5, s9
                  sh           t6, -198(a4)
                  lb           a7, 184(a4)
                  lh           a0, -200(a4)
                  sra          t3, ra, s3
                  sh           s6, 200(a4)
                  sb           tp, -21(a4)
                  sb           t1, -58(a4)
                  lh           a7, -22(a4)
                  lbu          t0, 81(a4)
                  lb           a0, -201(a4)
                  sb           sp, 19(a4)
                  lw           t4, 46(a4)
                  lb           s6, -20(a4) #end riscv_load_store_rand_instr_stream_24
                  la           t0, region_1+1578 #start load_store_instr_stream_1
                  la           ra, region_1+458 #start load_store_instr_stream_0
                  lbu          a2, 7(t0)
                  lhu          s11, -58(ra)
                  lb           s9, 61(t0)
                  lhu          t2, 0(t0)
                  lh           s10, 162(ra)
                  lhu          s0, 112(ra)
                  lb           s5, -13(t0)
                  lbu          a1, 197(ra)
                  sb           s10, 10(t0)
                  lb           s7, -62(t0) #end load_store_instr_stream_1
                  lbu          a2, 188(ra)
                  sb           gp, 19(ra) #end load_store_instr_stream_0
                  la           s6, region_1+596 #start load_store_instr_stream_2
                  la           t4, region_1+1773 #start load_store_instr_stream_1
                  lb           a7, 1350(s6)
                  la           s3, region_1+883 #start load_store_instr_stream_0
                  lb           a3, 645(s6)
                  lhu          s8, 637(s3)
                  lb           s11, -334(s6)
                  lb           a3, 56(t4)
                  lhu          a0, 1100(s6)
                  lb           s5, 51(t4)
                  lbu          a2, 573(s6)
                  lbu          a1, -35(s3)
                  sb           t1, 14(t4)
                  lh           s1, 716(s6)
                  lb           s7, 16(t4)
                  lhu          sp, -231(s3)
                  lbu          a3, 361(s6)
                  sb           s1, 53(t4)
                  lb           a1, 1113(s6) #end load_store_instr_stream_2
                  lw           t6, 821(s3)
                  sb           s7, 14(s3)
                  lbu          s8, 31(t4) #end load_store_instr_stream_1
                  lbu          a3, -684(s3) #end load_store_instr_stream_0
                  la           s5, region_0+1059 #start riscv_load_store_hazard_instr_stream_26
                  lb           t3, 122(s5)
                  lb           ra, 122(s5)
                  sh           s4, 17(s5)
                  lh           a2, 17(s5)
                  sb           s1, 17(s5)
                  lbu          a0, 17(s5)
                  lw           s3, 17(s5)
                  sw           s7, 17(s5)
                  lbu          s4, 17(s5)
                  lh           s4, 17(s5)
                  sw           s5, 17(s5)
                  c.srai       s1, 27
                  lbu          s2, 240(s5)
                  c.srli       a3, 4
                  lb           t6, 240(s5)
                  c.andi       a4, 22
                  lb           ra, 240(s5)
                  lbu          a0, 240(s5)
                  sb           t6, 240(s5)
                  lbu          t1, 240(s5)
                  lb           s9, 240(s5)
                  remu         t2, a0, t2
                  lbu          s8, 240(s5)
                  lb           s10, 240(s5) #end riscv_load_store_hazard_instr_stream_26
                  la           a2, region_1+409 #start riscv_load_store_rand_instr_stream_4
                  lb           t6, 56(a2)
                  sw           s9, 31(a2)
                  divu         zero, t0, ra
                  sb           a7, -11(a2)
                  or           s1, s11, a3
                  sb           s5, -40(a2)
                  srl          t3, zero, s6
                  c.nop
                  lbu          sp, 34(a2)
                  lbu          s10, -11(a2)
                  lb           a7, 4(a2)
                  lb           ra, 29(a2)
                  and          t1, zero, gp
                  lb           s5, -3(a2)
                  mulh         a7, s11, zero
                  c.xor        s1, a2
                  mulh         a7, s1, a6
                  c.nop
                  mulhu        sp, s0, t5
                  nop
                  auipc        t1, 828909
                  sll          s11, t3, s9
                  sll          t5, t0, a5
                  lbu          s11, 61(a2) #end riscv_load_store_rand_instr_stream_4
                  la           ra, region_0+15 #start load_store_instr_stream_0
                  lb           a2, 11(ra)
                  la           s11, region_1+432 #start load_store_instr_stream_1
                  lb           s4, 43(ra)
                  lb           gp, 41(s11)
                  lh           t2, 24(s11)
                  sb           a3, 13(s11)
                  lbu          s8, 42(ra)
                  lb           t5, 39(ra)
                  lb           sp, -32(s11)
                  sb           t0, -24(s11)
                  sb           a1, -6(s11)
                  lhu          t5, 59(ra)
                  lw           s10, 48(s11) #end load_store_instr_stream_1
                  lb           a1, 48(ra) #end load_store_instr_stream_0
sub_3_57:         jal          t6, 4f
0:                c.jal        9f
1:                c.j          11f
2:                c.j          5f
3:                c.jal        18f
4:                jal          a3, 16f
5:                jal          ra, 7f
6:                jal          a2, 0b
7:                c.jal        17f
8:                c.j          3b
9:                jal          ra, 8b
10:               c.j          15f
11:               c.j          6b
12:               jal          ra, 21f
13:               jal          t1, 1b
14:               c.j          20f
15:               c.jal        13b
16:               jal          t1, 2b
17:               c.jal        19f
18:               c.j          14b
19:               jal          ra, 10b
20:               c.j          12b
21:               c.xor        s1, a2
                  la           a3, region_1+977 #start riscv_load_store_hazard_instr_stream_16
                  lh           t3, -55(a3)
                  lbu          s6, -31(a3)
                  lw           t5, -61(a3)
                  lbu          s8, -13(a3)
                  c.mv         s6, t5
                  sh           t0, 17(a3)
                  lbu          t2, -20(a3)
                  sb           t3, -29(a3)
                  lbu          ra, -42(a3)
                  lbu          s10, -50(a3)
                  sub          a0, ra, s2
                  lb           t3, -50(a3)
                  c.srli       a1, 13
                  sb           s3, -48(a3)
                  sb           t4, -48(a3)
                  srai         t0, t0, 10
                  lbu          t6, -48(a3)
                  sb           gp, -48(a3)
                  sb           gp, -48(a3) #end riscv_load_store_hazard_instr_stream_16
                  addi         t3, zero, 8 #init loop 0 counter
                  addi         t2, zero, 4 #init loop 0 limit
sub_3_156_0_t:    c.add        s1, tp
                  addi         t3, t3, -4 #update loop 0 counter
                  srli         s4, t5, 8
                  beq          t3, t2, sub_3_156_0_t #branch for loop 0
                  xori         t6, t1, -1861
                  la           s8, region_0+1070 #start riscv_load_store_hazard_instr_stream_20
                  sw           a6, 830(s8)
                  lw           a2, -354(s8)
                  lb           t2, -341(s8)
                  lbu          t6, -341(s8)
                  lbu          s9, -341(s8)
                  lb           s9, -199(s8)
                  sb           a1, -40(s8)
                  lhu          t6, -848(s8)
                  sh           sp, -848(s8)
                  lbu          s6, -848(s8)
                  lbu          s11, -381(s8)
                  c.sub        a0, a3
                  lb           t6, -181(s8)
                  lb           t0, -181(s8)
                  lb           a7, -29(s8)
                  lhu          sp, 928(s8)
                  c.addi       sp, 20
                  lb           t0, -521(s8) #end riscv_load_store_hazard_instr_stream_20
                  la           a2, region_0+859 #start riscv_load_store_rand_instr_stream_2
                  lbu          s4, 745(a2)
                  sra          a4, a2, s6
                  srai         t2, s6, 30
                  c.addi4spn   s0, sp, 240
                  c.addi       s4, 8
                  lbu          t3, -760(a2)
                  srl          zero, s5, gp
                  slt          s8, s3, a4
                  lhu          s10, 527(a2)
                  rem          t4, a0, t4
                  c.sub        s1, a0
                  lb           s2, -42(a2)
                  or           t2, a1, s10
                  c.addi       t5, 20
                  c.srai       s0, 27
                  xor          s10, gp, s0
                  sb           s6, 1050(a2)
                  c.add        t0, s6
                  xori         s10, s2, 1332
                  sb           t2, -616(a2)
                  sw           s0, 313(a2)
                  c.xor        s1, a0
                  sh           s8, -147(a2)
                  c.addi16sp   sp, 80
                  sll          s11, s10, s3
                  lbu          ra, 96(a2)
                  lbu          s4, -340(a2)
                  xori         gp, t0, -460
                  lbu          s4, -418(a2)
                  lb           t6, 404(a2)
                  lb           s11, 268(a2)
                  lh           s8, -195(a2)
                  lb           s9, -584(a2)
                  sra          s4, s5, s10
                  c.and        a0, a4
                  sb           t1, 340(a2) #end riscv_load_store_rand_instr_stream_2
                  la           s11, amo_0+4 #start riscv_lr_sc_instr_stream_20
                  lr.w.rl       sp, (s11)
                  sc.w          s2, s9, (s11) #end riscv_lr_sc_instr_stream_20
                  la           sp, region_1+1555 #start riscv_load_store_hazard_instr_stream_9
                  lh           a7, -41(sp)
                  lb           a7, -41(sp)
                  xori         t0, t6, 739
                  lhu          t2, -41(sp)
                  lb           s2, -41(sp)
                  lhu          s8, -41(sp)
                  lhu          s5, -41(sp)
                  lbu          s3, -41(sp)
                  sb           s11, -41(sp)
                  sh           t3, -41(sp)
                  c.srli       a3, 21
                  srli         s2, a3, 15
                  sltu         t2, a3, s11
                  lh           a0, -41(sp)
                  lh           t3, -41(sp) #end riscv_load_store_hazard_instr_stream_9
                  la           s10, region_1+1743 #start load_store_instr_stream_1
                  lb           s5, -1366(s10)
                  la           sp, region_0+617 #start load_store_instr_stream_0
                  sb           t2, 742(sp)
                  lbu          t3, 42(s10)
                  lhu          t5, -1395(s10)
                  lbu          a2, 102(s10)
                  lb           t2, -362(sp)
                  sb           t6, 206(s10)
                  lb           s11, -1152(s10)
                  lbu          t6, -420(sp)
                  sb           t0, 571(sp)
                  sb           s5, -409(sp)
                  lbu          s8, 1359(sp)
                  lb           s1, -1718(s10)
                  sb           a3, -174(s10)
                  lb           s7, 252(sp)
                  lb           t0, -353(s10) #end load_store_instr_stream_1
                  lbu          a2, -596(sp) #end load_store_instr_stream_0
                  la           t1, region_0+1127 #start riscv_load_store_hazard_instr_stream_27
                  sh           s3, 39(t1)
                  lbu          t4, 39(t1)
                  sb           a4, 39(t1)
                  lbu          s8, 21(t1)
                  sh           s9, 21(t1)
                  mul          a4, gp, t5
                  lhu          s9, 63(t1)
                  slli         s3, zero, 20
                  lbu          t0, -58(t1)
                  lbu          a2, 8(t1)
                  lb           s8, 8(t1)
                  lhu          t3, 19(t1)
                  lb           gp, -14(t1)
                  sb           t2, -8(t1) #end riscv_load_store_hazard_instr_stream_27
                  la           s6, region_0+159 #start load_store_instr_stream_1
                  la           s1, region_0+984 #start load_store_instr_stream_3
                  la           a3, region_0+1739 #start load_store_instr_stream_2
                  sb           s1, -40(a3)
                  la           s5, region_0+767 #start load_store_instr_stream_0
                  lbu          t4, 21(s1)
                  lhu          s0, -51(a3)
                  sb           s3, -134(s6)
                  lbu          s0, -36(s5)
                  sh           a2, 55(s5)
                  lb           s0, 35(s1)
                  lh           sp, -33(s5)
                  lbu          a1, 39(s1)
                  lb           s7, 25(s1)
                  sb           t2, -47(s6)
                  lhu          t0, -49(a3)
                  sh           s7, 31(s5)
                  sb           t4, 43(a3)
                  lbu          zero, 74(s6)
                  lb           s8, -19(s5)
                  sb           a6, 32(a3) #end load_store_instr_stream_2
                  lhu          a7, 125(s6)
                  lh           s8, -58(s1)
                  lb           s9, 9(s1)
                  lbu          t2, -4(s5)
                  sb           a7, -9(s1)
                  sb           s10, -9(s1) #end load_store_instr_stream_3
                  lbu          t4, -36(s6)
                  lbu          t6, 4(s5)
                  sh           s4, 63(s6) #end load_store_instr_stream_1
                  sb           s10, 3(s5) #end load_store_instr_stream_0
sub_3_68:         jal          t6, 11f
0:                c.j          9f
1:                c.j          2f
2:                c.jal        13f
3:                jal          ra, 23f
4:                c.j          14f
5:                c.jal        6f
6:                jal          gp, 3b
7:                c.j          8f
8:                jal          a1, 1b
9:                c.j          5b
10:               c.j          0b
11:               c.jal        12f
12:               c.jal        18f
13:               c.j          4b
14:               jal          ra, 19f
15:               c.jal        16f
16:               jal          ra, 7b
17:               jal          gp, 22f
18:               jal          ra, 15b
19:               c.jal        21f
20:               jal          ra, 17b
21:               c.j          20b
22:               c.jal        10b
23:               c.or         a2, s0
                  la           a0, amo_0+24 #start riscv_lr_sc_instr_stream_10
                  rem          zero, sp, t3
                  c.slli       ra, 8
                  sra          s7, t0, t2
                  c.sub        a1, a3
                  c.srai       a4, 9
                  mul          t5, t1, a3
                  srai         s6, sp, 13
                  add          s9, t5, sp
                  sll          s1, t5, s11
                  sltiu        s6, a5, 1128
                  lr.w.aq       a1, (a0)
                  c.andi       s0, -1
                  sc.w.rl       a1, t2, (a0) #end riscv_lr_sc_instr_stream_10
                  la           sp, region_1+575 #start riscv_hazard_instr_stream_21
                  srai         a0, t5, 25
                  lbu          t2, -252(sp)
                  c.slli       a3, 4
                  srl          a0, s0, t0
                  lbu          s0, 160(sp)
                  c.li         t0, 2
                  sll          s0, t0, a0
                  auipc        t2, 747759
                  sb           s0, 8(sp)
                  slli         t2, t5, 19
                  mulhu        t5, t0, a0
                  lb           t2, 107(sp)
                  lbu          t5, 29(sp)
                  lh           a3, -213(sp)
                  lbu          t5, -124(sp)
                  div          t2, s0, t0
                  mulhsu       t5, t2, a3
                  or           t0, a3, t2
                  sb           a0, 8(sp)
                  sltu         a0, t5, s0
                  xori         a0, a0, -1099
                  auipc        a3, 211670
                  sb           t0, 164(sp)
                  sh           t2, -225(sp)
                  sw           t2, 177(sp)
                  c.mv         t5, t5
                  lb           a3, 87(sp)
                  xori         t2, s0, -692
                  mul          t5, t2, a0
                  sb           t5, -130(sp)
                  div          s0, a3, t2
                  lh           a0, 235(sp)
                  addi         t0, a3, -1423
                  c.slli       t2, 28
                  remu         a0, s0, a3
                  sb           t5, -221(sp)
                  lui          t2, 198105
                  c.srli       a3, 24
                  lw           a0, -95(sp)
                  andi         t5, s0, 1896
                  lhu          t0, -223(sp)
                  lbu          t5, -6(sp)
                  c.li         s0, -1
                  lh           a3, 151(sp)
                  lh           t0, 51(sp)
                  lw           s0, 17(sp)
                  divu         a0, a3, a3
                  lbu          a0, 24(sp)
                  sw           t0, 125(sp)
                  sb           t5, -99(sp)
                  sra          a0, s0, t5
                  c.sub        a3, a0
                  lb           a3, -30(sp)
                  c.srli       a0, 26
                  sb           t5, 49(sp) #end riscv_hazard_instr_stream_21
                  la           t2, region_1+107 #start riscv_load_store_rand_instr_stream_10
                  lbu          s5, 82(t2)
                  lb           t4, 866(t2)
                  lb           a7, 570(t2)
                  lb           s4, 351(t2)
                  sb           tp, -78(t2)
                  srl          s9, t0, s4
                  srli         t0, t0, 22
                  lhu          zero, 513(t2)
                  lbu          a2, 0(t2)
                  mulhu        a7, zero, a7
                  c.or         a3, a2
                  c.andi       a0, 24
                  lb           a2, 1818(t2)
                  sw           t6, 1413(t2)
                  lh           s8, 1577(t2)
                  c.and        a3, a1
                  c.xor        a2, a0
                  or           a2, t6, a0
                  xor          a1, s3, tp
                  lui          s9, 466285
                  lw           s2, 1789(t2)
                  lbu          a0, 22(t2)
                  lbu          s1, 1523(t2)
                  sh           gp, 377(t2)
                  lbu          s6, 74(t2)
                  lhu          t4, 3(t2)
                  addi         ra, ra, -1563
                  lbu          a2, 875(t2)
                  sh           ra, 731(t2)
                  c.addi16sp   sp, -16
                  mulhu        a2, s2, a3
                  c.andi       a0, -1
                  nop
                  lh           a7, 469(t2)
                  sb           gp, -36(t2) #end riscv_load_store_rand_instr_stream_10
                  la           t5, region_0+1792 #start riscv_load_store_hazard_instr_stream_10
                  lb           s6, 181(t5)
                  sb           a6, 181(t5)
                  sra          s6, t3, t4
                  lb           s9, -203(t5)
                  sb           s11, -203(t5)
                  sb           t4, -203(t5)
                  c.srai       s0, 18
                  lb           sp, -203(t5)
                  sb           a6, -203(t5)
                  sb           sp, -201(t5)
                  lb           a7, -201(t5)
                  lbu          sp, 13(t5)
                  sb           s10, 13(t5)
                  c.xor        a2, a4
                  lbu          a1, 13(t5) #end riscv_load_store_hazard_instr_stream_10
                  la           sp, region_0+556 #start riscv_hazard_instr_stream_22
                  lbu          a4, -489(sp)
                  lbu          s10, 1413(sp)
                  c.xor        a4, a4
                  lb           a4, 266(sp)
                  lb           t6, 544(sp)
                  mulhu        t3, a4, t3
                  slli         s10, a4, 14
                  c.add        t6, s10
                  c.add        a4, t3
                  lbu          s4, 37(sp)
                  sb           t3, 7(sp)
                  nop
                  c.or         a4, a4
                  lb           s10, 133(sp)
                  lb           t6, 63(sp)
                  c.sub        a4, a4
                  lb           t3, 997(sp)
                  lhu          t6, 706(sp)
                  lbu          t3, -2(sp)
                  c.lui        a4, 18
                  sb           t3, -191(sp)
                  lb           a4, 1001(sp)
                  sh           a4, 440(sp)
                  c.mv         a4, t6
                  sh           s4, -484(sp)
                  lh           t3, -166(sp)
                  sb           s10, 1359(sp)
                  lb           t3, 377(sp)
                  lbu          ra, 444(sp)
                  lb           t6, 533(sp)
                  lbu          t3, 22(sp)
                  or           s4, s10, a4
                  lbu          s10, 37(sp) #end riscv_hazard_instr_stream_22
                  la           s1, region_0+1554 #start load_store_instr_stream_1
                  la           t3, region_1+62 #start load_store_instr_stream_0
                  lbu          s5, -7(s1)
                  sb           s1, 214(s1)
                  sb           s0, 1391(t3)
                  sb           sp, 148(s1)
                  sb           s8, 1771(t3)
                  lb           s7, -55(s1)
                  lbu          s2, 531(t3)
                  lbu          s4, 117(s1)
                  sw           s6, 42(t3)
                  sw           t0, 174(t3)
                  lb           gp, -61(s1)
                  lbu          s9, 1451(t3)
                  lbu          t2, 184(s1)
                  lb           s2, 389(t3)
                  lhu          s3, 1202(t3)
                  lhu          ra, 216(s1) #end load_store_instr_stream_1
                  lbu          s8, 1075(t3) #end load_store_instr_stream_0
                  la           sp, amo_0+28 #start riscv_lr_sc_instr_stream_8
                  sra          a7, s5, t6
                  c.sub        a2, s0
                  c.srai       s0, 28
                  sltiu        t1, s7, 125
                  c.xor        s0, a4
                  slti         s11, s8, 416
                  sll          s10, gp, t1
                  sub          gp, s7, t4
                  c.nop
                  ori          a4, gp, -201
                  and          s2, ra, tp
                  c.andi       a4, 16
                  lr.w.aq       gp, (sp)
                  c.addi       a4, 23
                  sll          s9, t0, s5
                  sc.w          s11, s7, (sp) #end riscv_lr_sc_instr_stream_8
                  la           sp, region_0+1867 #start riscv_load_store_hazard_instr_stream_25
                  c.slli       s9, 23
                  mulhu        ra, zero, t0
                  lhu          s11, -1267(sp)
                  sb           a7, -1762(sp)
                  sw           a4, -719(sp)
                  lhu          s7, -719(sp)
                  lb           s0, -1235(sp)
                  sh           s9, -1315(sp)
                  sh           a6, -1315(sp)
                  lb           gp, -1315(sp)
                  lb           t4, -1315(sp)
                  lw           s9, -1315(sp)
                  lhu          s10, -1315(sp)
                  lb           t4, -806(sp)
                  xor          s1, s7, a4
                  lbu          t5, -806(sp)
                  sw           a3, -443(sp)
                  lb           zero, -443(sp)
                  sw           s11, -443(sp)
                  sub          s10, t0, s1
                  lb           a3, -443(sp)
                  lhu          s5, -443(sp) #end riscv_load_store_hazard_instr_stream_25
                  addi         t0, zero, -1 #init loop 1 counter
                  or           a1, a5, s2
                  srli         a1, gp, 5
                  srl          s11, sp, tp
                  addi         s9, zero, -6 #init loop 1 limit
                  c.lui        s0, 21
sub_3_142_1_t:    c.addi4spn   a3, sp, 192
                  mulhu        s7, a6, zero
                  addi         t0, t0, -3 #update loop 1 counter
                  addi         a2, zero, -9 #init loop 0 counter
                  and          t3, a5, s2
                  addi         a4, zero, 20 #init loop 0 limit
sub_3_142_0_t:    c.xor        a1, s0
                  c.addi       a7, -1
                  addi         a2, a2, 1 #update loop 0 counter
                  c.lui        gp, 2
                  mul          s1, s10, sp
                  bltu         a2, a4, sub_3_142_0_t #branch for loop 0
                  divu         t3, t6, s3
                  sll          t3, s2, s4
                  sltiu        t4, a4, 1560
                  bge          t0, s9, sub_3_142_1_t #branch for loop 1
                  srai         t6, s2, 26
                  la           t1, amo_0+20 #start riscv_amo_instr_stream_17
                  la           s5, amo_0+40
                  amoxor.w.aq   t2, t4, (t1)
                  or           a1, s0, ra
                  amominu.w     sp, gp, (s5)
                  amomin.w.rl   a0, t0, (s5)
                  amoand.w      a4, a4, (s5)
                  amoswap.w.aq  s0, gp, (s5)
                  mulhsu       s11, t3, a4
                  amomin.w.rl   s6, t4, (t1)
                  mul          s7, t2, a7
                  amoand.w.rl   a2, a6, (t1)
                  amoswap.w.aq  ra, s10, (s5)
                  amomin.w.rl   s9, s1, (s5)
                  amominu.w.aq  zero, zero, (s5) #end riscv_amo_instr_stream_17
sub_3_52:         jal          t6, 11f
0:                jal          ra, 6f
1:                jal          t1, 12f
2:                c.jal        4f
3:                c.j          2b
4:                c.jal        13f
5:                c.jal        0b
6:                c.j          7f
7:                jal          ra, 10f
8:                jal          ra, 1b
9:                jal          ra, 23f
10:               c.jal        14f
11:               c.jal        9b
12:               c.j          19f
13:               jal          ra, 8b
14:               jal          ra, 24f
15:               c.jal        5b
16:               jal          ra, 15b
17:               jal          ra, 22f
18:               jal          t1, 21f
19:               c.j          17b
20:               c.jal        18b
21:               jal          ra, 16b
22:               c.jal        20b
23:               jal          gp, 3b
24:               c.nop
                  la           s1, region_1+339 #start load_store_instr_stream_1
                  lb           s5, -286(s1)
                  la           a2, region_1+1246 #start load_store_instr_stream_0
                  lbu          gp, 201(s1)
                  sb           a0, 134(s1)
                  lb           s7, 559(s1)
                  sh           t5, -244(a2)
                  sb           s6, 1014(s1)
                  lb           ra, 177(a2)
                  lbu          t6, -159(a2)
                  sb           s2, 1356(s1)
                  lb           t3, -192(s1)
                  lb           t1, -63(a2)
                  sb           t6, 1633(s1)
                  lbu          s4, 888(s1)
                  sb           gp, -16(a2)
                  lb           zero, 1461(s1) #end load_store_instr_stream_1
                  lbu          t5, 181(a2) #end load_store_instr_stream_0
                  addi         a0, zero, 10 #init loop 1 counter
                  addi         zero, zero, 0 #init loop 1 limit
                  sltu         s11, s0, s9
                  and          s2, t0, a7
sub_3_153_1_t:    addi         s4, t3, 36
                  addi         a0, a0, -1 #update loop 1 counter
                  addi         t3, zero, -8 #init loop 0 counter
                  sll          sp, s3, s5
                  addi         s8, zero, 3 #init loop 0 limit
                  c.and        a2, s1
sub_3_153_0_t:    auipc        s7, 87634
                  addi         t3, t3, 2 #update loop 0 counter
                  bltu         t3, s8, sub_3_153_0_t #branch for loop 0
                  c.beqz       a0, sub_3_153_1_t #branch for loop 1
                  sltiu        s4, sp, -630
sub_3_78:         jal          t6, 2f
0:                c.jal        15f
1:                c.j          12f
2:                c.j          4f
3:                jal          t1, 13f
4:                jal          ra, 8f
5:                jal          ra, 7f
6:                jal          s1, 0b
7:                jal          ra, 16f
8:                c.jal        6b
9:                c.jal        3b
10:               jal          t1, 14f
11:               c.jal        9b
12:               c.jal        18f
13:               jal          ra, 17f
14:               jal          ra, 5b
15:               jal          t6, 11b
16:               c.j          1b
17:               c.j          10b
18:               srl          s11, s0, t3
sub_3_69:         jal          t6, 14f
0:                c.jal        9f
1:                c.j          19f
2:                c.j          8f
3:                jal          ra, 21f
4:                c.j          25f
5:                c.j          3b
6:                c.jal        5b
7:                c.jal        12f
8:                jal          t1, 28f
9:                jal          ra, 17f
10:               c.j          20f
11:               jal          ra, 22f
12:               c.jal        6b
13:               c.j          7b
14:               c.jal        13b
15:               c.j          27f
16:               c.j          10b
17:               jal          ra, 16b
18:               c.jal        4b
19:               c.j          26f
20:               jal          t1, 24f
21:               jal          ra, 0b
22:               jal          t1, 18b
23:               c.j          2b
24:               c.j          15b
25:               c.jal        1b
26:               jal          ra, 23b
27:               c.jal        11b
28:               jal          ra, 29f
29:               srli         a1, s2, 19
                  la           s3, amo_0+4 #start riscv_amo_instr_stream_9
                  la           s7, amo_0+52
                  la           a4, amo_0+40
                  la           s10, amo_0+24
                  xor          a1, gp, s1
                  xor          a2, a5, s9
                  amomax.w.rl   s0, s9, (s10)
                  srli         s6, a2, 0
                  amoswap.w.rl  s11, s6, (s10)
                  amoxor.w      ra, ra, (s3)
                  srli         s8, s11, 10
                  slti         t1, s6, -790
                  slli         a3, t3, 6
                  amomin.w.aq   s1, s6, (s7)
                  amomin.w      a7, a0, (s3)
                  amoadd.w.rl   gp, zero, (s7)
                  c.and        a1, a0
                  or           s1, gp, t0
                  amoadd.w.aq   t3, sp, (s10)
                  amoswap.w.aq  t4, t5, (s3) #end riscv_amo_instr_stream_9
                  la           s6, region_1+1475 #start load_store_instr_stream_2
                  la           t3, region_1+1026 #start load_store_instr_stream_4
                  la           s9, region_1+1076 #start load_store_instr_stream_3
                  sb           s5, -64(s6)
                  la           t0, region_1+968 #start load_store_instr_stream_0
                  sb           s7, -30(t3)
                  lbu          s5, 130(t0)
                  lbu          a2, 32(t0)
                  sb           s11, -9(s6)
                  lw           s11, 200(t0)
                  sb           a5, -64(s6)
                  la           t2, region_1+1819 #start load_store_instr_stream_1
                  lb           a7, 125(t0)
                  lh           s10, 88(t3)
                  lb           s1, 195(s9)
                  sb           a1, 27(t3)
                  lh           s3, 50(s9)
                  lh           s11, -190(t3)
                  lb           a3, -72(t2)
                  lb           t4, -280(t2)
                  lb           sp, -130(t0)
                  lhu          a3, 55(s6)
                  lb           s2, -180(t0)
                  lbu          a7, -974(t2)
                  lb           s1, 32(s6)
                  lb           s11, 168(t0)
                  lbu          t4, 201(s9)
                  sw           s9, -204(s9)
                  lh           s0, 72(t3) #end load_store_instr_stream_4
                  lh           a7, -301(t2)
                  lbu          sp, 215(s9) #end load_store_instr_stream_3
                  lbu          a4, 5(s6)
                  lbu          zero, -16(s6)
                  lb           t4, 53(t0)
                  lbu          gp, -1022(t2) #end load_store_instr_stream_1
                  sb           tp, 34(s6)
                  lhu          t1, -1(s6)
                  lbu          ra, -40(t0)
                  lhu          a3, -37(s6) #end load_store_instr_stream_2
                  lbu          gp, -213(t0) #end load_store_instr_stream_0
                  la           t0, region_1+766 #start load_store_instr_stream_1
                  la           s3, region_1+673 #start load_store_instr_stream_2
                  lbu          s10, 832(t0)
                  sb           a0, 980(s3)
                  lh           s5, -423(s3)
                  la           a3, region_1+685 #start load_store_instr_stream_0
                  sb           a6, 1113(s3)
                  sw           t5, -566(t0)
                  sb           t3, 884(s3)
                  lbu          s6, -47(a3)
                  lh           s10, -159(s3)
                  lb           gp, 1115(t0)
                  lbu          t5, 0(a3)
                  lhu          s1, 9(a3)
                  lw           t3, -574(t0)
                  sb           t5, 39(s3)
                  sh           a5, 20(t0)
                  sb           s6, 480(s3)
                  lbu          s1, -40(a3)
                  lw           a7, 1186(t0)
                  lb           t3, 25(a3)
                  sb           a2, -546(s3)
                  lb           t1, 319(t0)
                  lbu          sp, 596(t0)
                  sb           t6, 952(s3) #end load_store_instr_stream_2
                  lb           a0, 539(t0) #end load_store_instr_stream_1
                  lb           a0, -24(a3) #end load_store_instr_stream_0
                  la           sp, region_0+1174 #start riscv_load_store_rand_instr_stream_15
                  lbu          t4, -165(sp)
                  lhu          s2, -1028(sp)
                  sb           a4, -715(sp)
                  sw           sp, -490(sp)
                  lbu          a4, 132(sp)
                  nop
                  lhu          a2, 168(sp)
                  xor          s3, sp, a2
                  c.add        s6, s6
                  sb           s6, -671(sp)
                  lbu          a2, 787(sp)
                  srli         t1, s0, 1
                  div          t2, s3, s4
                  sb           s5, 323(sp)
                  lui          s8, 520767
                  c.lui        a2, 27
                  andi         a0, a7, -1538
                  srl          t3, a7, a6
                  lbu          s1, 408(sp)
                  sb           s8, 229(sp)
                  lbu          a0, 784(sp)
                  sw           tp, 682(sp)
                  sw           sp, -262(sp)
                  srli         t3, s4, 30
                  sb           a3, 171(sp)
                  sb           s10, 314(sp)
                  lb           a3, 617(sp)
                  c.xor        s0, a1
                  or           gp, s11, s5
                  c.mv         s4, t2
                  lbu          ra, 421(sp)
                  slt          t6, s0, a2
                  sb           s6, 328(sp)
                  sb           a5, -340(sp) #end riscv_load_store_rand_instr_stream_15
                  la           t4, region_1+227 #start load_store_instr_stream_2
                  la           a7, region_1+827 #start load_store_instr_stream_1
                  la           s1, region_1+1960 #start load_store_instr_stream_0
                  sw           zero, -627(a7)
                  sb           s4, -154(a7)
                  lb           a4, -11(t4)
                  sh           ra, 10(s1)
                  lbu          s0, -15(s1)
                  sb           s1, -8(t4)
                  lh           s8, -669(a7)
                  sh           s5, -8(s1)
                  sh           t5, -363(a7)
                  lb           a2, -16(t4)
                  lb           t1, 459(a7)
                  lb           s6, 9(s1)
                  lbu          s9, 767(a7)
                  sw           s1, 13(t4)
                  lhu          s8, -201(a7) #end load_store_instr_stream_1
                  sb           gp, 13(t4)
                  sb           a5, 7(s1)
                  lbu          s2, 9(s1)
                  lbu          s0, 2(t4) #end load_store_instr_stream_2
                  lb           s0, 7(s1)
                  lbu          t2, -11(s1) #end load_store_instr_stream_0
                  la           a7, region_1+292 #start riscv_load_store_hazard_instr_stream_2
                  lbu          a2, 1241(a7)
                  lb           t4, 1493(a7)
                  lh           zero, -112(a7)
                  sra          zero, zero, s4
                  lbu          zero, 513(a7)
                  lbu          t6, 513(a7)
                  div          s0, s8, s10
                  sb           tp, 811(a7)
                  lb           s10, 1253(a7)
                  lbu          zero, 537(a7)
                  c.addi16sp   sp, -16
                  lbu          t0, 537(a7)
                  c.add        sp, t4
                  lh           s9, 1492(a7)
                  sh           s4, 1492(a7)
                  sb           s7, 10(a7)
                  lh           t3, 844(a7)
                  lh           a0, 844(a7) #end riscv_load_store_hazard_instr_stream_2
                  la           s0, amo_0+48 #start riscv_lr_sc_instr_stream_0
                  nop
                  mulh         s9, t4, tp
                  sltu         t1, s3, s3
                  sltu         t0, ra, s9
                  sll          s9, ra, s5
                  c.srli       a4, 24
                  c.addi16sp   sp, 352
                  slt          s1, t4, t6
                  nop
                  c.addi       s1, -1
                  c.addi4spn   a3, sp, 880
                  slt          a7, a0, ra
                  mulhu        ra, zero, zero
                  lr.w.aq       s3, (s0)
                  c.xor        a0, s1
                  srai         ra, zero, 20
                  sc.w.aq       a7, t3, (s0) #end riscv_lr_sc_instr_stream_0
                  la           a1, region_1+1458 #start load_store_instr_stream_0
                  la           t6, region_0+1207 #start load_store_instr_stream_1
                  lb           s7, -27(a1)
                  sh           t5, -9(t6)
                  lhu          s1, -21(t6)
                  lh           a2, -51(t6)
                  lw           a2, -166(a1)
                  sb           t4, 102(a1)
                  lbu          s7, -81(a1)
                  sh           a1, 23(t6)
                  lh           t4, 138(a1)
                  sw           a0, 122(a1)
                  lbu          a3, 4(t6)
                  lbu          s9, -9(a1)
                  sh           s9, -188(a1)
                  lb           a3, -34(t6) #end load_store_instr_stream_1
                  sb           s9, 55(a1) #end load_store_instr_stream_0
                  addi         ra, zero, -10 #init loop 1 counter
                  addi         a4, zero, 1 #init loop 1 limit
                  div          t4, s10, a7
sub_3_147_1_t:    nop
                  srl          s7, s3, s0
                  addi         ra, ra, 9 #update loop 1 counter
                  c.srli       s1, 18
                  addi         a0, zero, 6 #init loop 0 counter
                  or           gp, a2, a4
                  addi         zero, zero, 0 #init loop 0 limit
                  add          a2, t2, tp
sub_3_147_0_t:    c.add        a2, s10
                  mulhsu       t2, t0, a7
                  addi         a0, a0, -6 #update loop 0 counter
                  c.xor        a3, a2
                  c.add        s10, tp
                  xor          s7, s8, t5
                  c.beqz       a0, sub_3_147_0_t #branch for loop 0
                  c.addi       s8, -1
                  blt          ra, a4, sub_3_147_1_t #branch for loop 1
                  mul          s8, a6, a2
                  la           a1, amo_0+36 #start riscv_amo_instr_stream_7
                  la           s1, amo_0+48
                  mulh         s5, a4, t1
                  c.xor        a0, a2
                  amoand.w.aq   t0, a5, (a1)
                  auipc        s8, 276360
                  c.addi4spn   s0, sp, 384
                  sltiu        t3, tp, -1128
                  amoadd.w.aq   s10, t4, (a1)
                  amoand.w      s11, t5, (a1)
                  div          s2, tp, a5
                  amominu.w.aq  s9, s4, (a1)
                  amoand.w.aq   s10, sp, (a1)
                  amomax.w      t2, s2, (a1)
                  amoand.w      t0, s0, (s1) #end riscv_amo_instr_stream_7
                  la           t0, region_0+1324 #start riscv_load_store_hazard_instr_stream_14
                  c.nop
                  lbu          s0, -187(t0)
                  lb           a1, -187(t0)
                  lbu          sp, -187(t0)
                  lb           a2, -187(t0)
                  lbu          s5, -187(t0)
                  sb           a2, -187(t0)
                  divu         t3, s7, s7
                  srai         s7, ra, 4
                  c.slli       s9, 1
                  lbu          s3, -187(t0)
                  sb           a7, -187(t0)
                  lb           a3, -187(t0)
                  lbu          ra, -187(t0)
                  lb           a0, -187(t0)
                  lbu          a3, -187(t0)
                  lb           a1, -187(t0)
                  sb           tp, -187(t0)
                  lb           s9, -187(t0)
                  lb           s5, -187(t0)
                  auipc        s0, 532381
                  lbu          t3, -187(t0) #end riscv_load_store_hazard_instr_stream_14
                  la           a1, amo_0+52 #start riscv_amo_instr_stream_12
                  la           sp, amo_0+8
                  la           s9, amo_0+60
                  la           t1, amo_0+44
                  c.srli       a4, 31
                  amominu.w.aq  s7, zero, (sp)
                  amoswap.w     t6, a2, (s9)
                  lui          s4, 352119
                  c.nop
                  c.lui        t5, 23
                  c.sub        a0, a3
                  amomaxu.w     s2, s8, (s9)
                  c.srai       a4, 15
                  amomax.w.rl   t4, s1, (s9)
                  mulhu        s10, sp, gp
                  amomin.w      s0, s0, (t1)
                  amoxor.w.aq   a2, a3, (sp)
                  amomaxu.w.rl  s11, a6, (a1)
                  amomaxu.w.aq  t2, s3, (sp) #end riscv_amo_instr_stream_12
sub_3_71:         jal          t6, 2f
0:                jal          gp, 7f
1:                c.jal        3f
2:                c.j          10f
3:                jal          s10, 0b
4:                jal          ra, 13f
5:                c.j          9f
6:                c.j          4b
7:                c.jal        8f
8:                jal          t0, 11f
9:                c.j          12f
10:               jal          t1, 5b
11:               c.j          6b
12:               jal          t1, 1b
13:               c.or         a4, a0
sub_3_65:         jal          t6, 5f
0:                c.j          9f
1:                c.jal        3f
2:                jal          ra, 4f
3:                c.jal        2b
4:                c.j          6f
5:                c.j          7f
6:                c.j          8f
7:                c.j          1b
8:                jal          s8, 0b
9:                jal          t1, 10f
10:               c.jal        11f
11:               add          t1, tp, t6
                  la           s8, amo_0+24 #start riscv_amo_instr_stream_8
                  c.mv         t1, a4
                  c.sub        s1, a4
                  c.srai       a2, 2
                  amoswap.w.rl  s11, s0, (s8)
                  amoand.w      s10, tp, (s8)
                  amomax.w      t3, ra, (s8) #end riscv_amo_instr_stream_8
sub_3_70:         jal          t6, 21f
0:                c.jal        2f
1:                c.jal        6f
2:                c.j          23f
3:                c.jal        0b
4:                c.jal        18f
5:                jal          t1, 14f
6:                c.j          10f
7:                jal          ra, 15f
8:                c.jal        22f
9:                jal          a0, 19f
10:               jal          t1, 24f
11:               c.j          1b
12:               c.j          13f
13:               c.jal        11b
14:               c.jal        8b
15:               c.j          25f
16:               jal          ra, 20f
17:               c.jal        5b
18:               c.jal        9b
19:               jal          t1, 16b
20:               c.jal        7b
21:               c.jal        12b
22:               c.j          3b
23:               c.jal        4b
24:               jal          ra, 17b
25:               xor          s2, s11, a7
                  addi         s0, zero, -8 #init loop 1 counter
                  addi         t0, a4, -1179
                  auipc        s9, 719675
                  addi         zero, zero, 0 #init loop 1 limit
                  c.addi       t5, 12
                  xor          s5, t0, t3
                  addi         a7, t5, 396
sub_3_139_1_t:    and          s5, t4, a6
                  add          s10, s1, s4
                  sub          gp, t4, a5
                  remu         t4, a5, ra
                  addi         s0, s0, 8 #update loop 1 counter
                  addi         a2, zero, 8 #init loop 0 counter
                  slli         s1, a5, 8
                  xori         t3, a3, 217
                  c.addi       s9, 28
                  addi         a3, zero, -11 #init loop 0 limit
                  sub          s9, a6, s0
sub_3_139_0_t:    mul          s6, a2, s9
                  xor          s7, s3, s0
                  lui          s9, 484855
                  mulhsu       a1, ra, s11
                  nop
                  mulh         s7, a7, s10
                  c.add        s3, s8
                  sltu         a0, s7, s7
                  addi         a2, a2, -3 #update loop 0 counter
                  xor          s7, zero, ra
                  c.addi16sp   sp, 304
                  c.addi4spn   a4, sp, 144
                  bge          a2, a3, sub_3_139_0_t #branch for loop 0
                  remu         t3, s7, t1
                  c.bnez       s0, sub_3_139_1_t #branch for loop 1
                  c.and        a0, a2
                  la           t1, amo_0+52 #start riscv_lr_sc_instr_stream_1
                  mul          s9, a4, gp
                  lr.w.rl       zero, (t1)
                  sc.w.aq       s6, sp, (t1) #end riscv_lr_sc_instr_stream_1
                  la           s11, region_0+1471 #start riscv_load_store_hazard_instr_stream_0
                  lhu          s6, 151(s11)
                  lh           s10, -49(s11)
                  lbu          t4, -49(s11)
                  lb           a7, 45(s11)
                  lbu          gp, 140(s11)
                  sb           a1, -126(s11)
                  lbu          s6, -126(s11)
                  lb           s3, -126(s11)
                  mul          gp, s7, s0
                  sb           a2, -126(s11)
                  sb           zero, -126(s11)
                  lbu          a0, -210(s11)
                  lb           s1, -210(s11)
                  c.li         s7, -1
                  lb           s4, -210(s11)
                  lb           s9, -210(s11) #end riscv_load_store_hazard_instr_stream_0
                  la           ra, region_0+560 #start load_store_instr_stream_1
                  la           s7, region_1+1918 #start load_store_instr_stream_0
                  lbu          t3, 5(ra)
                  lb           t1, -44(s7)
                  lbu          s3, 5(ra)
                  sb           s7, -14(ra)
                  lb           gp, -7(s7)
                  lb           sp, -6(ra)
                  sh           t4, 22(s7)
                  lh           zero, 64(s7)
                  lb           s1, 3(ra)
                  lbu          a1, 0(ra)
                  lhu          zero, -16(s7)
                  lbu          a1, -15(ra) #end load_store_instr_stream_1
                  sb           s6, 37(s7) #end load_store_instr_stream_0
                  la           s4, region_0+852 #start riscv_hazard_instr_stream_11
                  lb           s5, 13(s4)
                  add          t6, zero, s5
                  c.slli       a1, 12
                  lb           a1, -9(s4)
                  lw           a1, -4(s4)
                  sra          a4, zero, t6
                  c.and        a4, a1
                  c.slli       a4, 15
                  sb           a4, 3(s4)
                  nop
                  sb           t6, 11(s4)
                  lhu          zero, 2(s4)
                  sra          t6, a4, a4
                  slti         zero, a4, 1571
                  lbu          t6, 0(s4)
                  sh           s6, -6(s4)
                  lb           a1, 1(s4)
                  remu         zero, zero, zero
                  c.addi       a4, -1
                  c.addi       a4, -1
                  sb           s6, -1(s4)
                  c.and        a1, a1
                  lb           s5, 11(s4)
                  sb           a1, -9(s4)
                  mulhsu       a1, s6, a4
                  sh           a4, -10(s4)
                  div          a1, zero, t6
                  lb           zero, -10(s4)
                  ori          t6, t6, 1399
                  slli         a1, s6, 10
                  sh           s6, 10(s4)
                  lbu          t6, 9(s4)
                  lui          s5, 705414
                  ori          t6, s5, -1597
                  lhu          t6, 12(s4)
                  andi         s5, a4, 1622
                  lbu          s6, 4(s4)
                  c.mv         s5, a4
                  mulhsu       t6, a1, t6
                  c.andi       a4, 12
                  lbu          s6, 1(s4)
                  sb           a1, -15(s4) #end riscv_hazard_instr_stream_11
                  la           sp, region_1+72 #start riscv_hazard_instr_stream_17
                  sltiu        a3, a0, 1073
                  slti         s3, t3, -227
                  sw           s7, 1716(sp)
                  lui          s7, 2834
                  lbu          s3, 1642(sp)
                  sra          a3, s3, s7
                  srl          t3, s7, a0
                  lh           s1, 674(sp)
                  c.andi       a0, -1
                  sub          a0, s3, s1
                  lh           a0, 1686(sp)
                  lui          s7, 815666
                  lb           t3, -53(sp)
                  lbu          a0, 1573(sp)
                  sh           t3, 936(sp)
                  lui          s3, 37859
                  lw           s7, -16(sp)
                  sb           s1, 61(sp)
                  c.xor        s1, a3
                  c.lui        s7, 1
                  lbu          s1, 1275(sp)
                  lbu          s7, 1018(sp)
                  sb           t3, 753(sp)
                  lb           a0, 1848(sp)
                  sb           s1, 659(sp)
                  sb           a0, 933(sp)
                  sb           s7, 851(sp)
                  sb           s1, 1646(sp)
                  lb           a3, 727(sp)
                  lb           s3, -26(sp)
                  divu         s1, t3, s7
                  sb           t3, 1214(sp)
                  lhu          a3, 1446(sp)
                  c.srai       a3, 13
                  sb           s7, 204(sp)
                  sb           s3, 1571(sp)
                  lb           a0, 730(sp)
                  lb           s1, 1099(sp) #end riscv_hazard_instr_stream_17
sub_3_55:         jal          t6, 7f
0:                jal          ra, 16f
1:                jal          ra, 0b
2:                jal          ra, 12f
3:                c.j          9f
4:                c.j          10f
5:                c.jal        8f
6:                c.j          17f
7:                jal          ra, 1b
8:                c.j          2b
9:                c.j          13f
10:               jal          t1, 15f
11:               jal          ra, 4b
12:               jal          ra, 14f
13:               c.jal        5b
14:               jal          sp, 6b
15:               c.jal        18f
16:               jal          ra, 3b
17:               c.jal        11b
18:               srl          a4, t2, a4
sub_3_61:         jal          t6, 15f
0:                jal          s6, 16f
1:                c.jal        10f
2:                jal          t1, 17f
3:                jal          s3, 4f
4:                c.j          2b
5:                c.j          7f
6:                c.j          8f
7:                c.j          6b
8:                jal          ra, 12f
9:                c.j          1b
10:               c.j          0b
11:               c.j          14f
12:               c.jal        3b
13:               jal          ra, 11b
14:               jal          ra, 9b
15:               jal          ra, 13b
16:               jal          t0, 5b
17:               sll          a0, s2, tp
                  la           a1, region_0+1515 #start load_store_instr_stream_1
                  la           s7, region_0+835 #start load_store_instr_stream_3
                  lbu          s11, -54(s7)
                  lh           s4, -157(a1)
                  la           a7, region_0+1957 #start load_store_instr_stream_2
                  lhu          t3, 79(a1)
                  sb           tp, -126(s7)
                  lbu          s2, 209(s7)
                  sb           a1, 10(a7)
                  lb           t4, -4(a7)
                  la           s8, region_0+991 #start load_store_instr_stream_0
                  lb           a4, 254(a1)
                  sb           zero, -215(s8)
                  sb           s11, -174(s7)
                  sw           s1, 45(a1)
                  lb           a3, 12(a7)
                  sb           a4, -12(a7)
                  lb           t3, 66(s7)
                  lh           s9, -61(s8)
                  lbu          s1, -168(a1)
                  lw           ra, 69(a1)
                  lb           t5, -6(a7)
                  lbu          s3, 184(s8)
                  lb           sp, -118(s7)
                  sh           s2, 211(a1)
                  lbu          a2, -189(s7)
                  lbu          t3, -12(a7)
                  sb           a3, -4(a7)
                  lbu          a2, -169(a1)
                  lb           t5, 9(a7)
                  lbu          t4, 242(s7) #end load_store_instr_stream_3
                  sb           s1, 242(s8)
                  sw           s1, -1(a7)
                  lbu          zero, 230(s8)
                  lbu          gp, -114(a1)
                  lb           t1, -10(a7) #end load_store_instr_stream_2
                  sw           a0, 21(s8)
                  sb           s3, -223(a1) #end load_store_instr_stream_1
                  sh           zero, -201(s8) #end load_store_instr_stream_0
                  addi         gp, zero, 7 #init loop 1 counter
                  ori          a1, a0, 364
                  srli         s5, zero, 24
                  slli         t6, s8, 20
                  addi         a7, zero, -9 #init loop 1 limit
sub_3_154_1_t:    c.mv         t3, s11
                  c.srli       a2, 13
                  addi         gp, gp, -8 #update loop 1 counter
                  sltiu        s3, zero, 664
                  addi         a4, zero, 9 #init loop 0 counter
                  c.lui        a1, 9
                  addi         t2, zero, 9 #init loop 0 limit
sub_3_154_0_t:    divu         a2, s2, t5
                  c.xor        s0, a5
                  addi         a4, a4, -6 #update loop 0 counter
                  bgeu         a4, t2, sub_3_154_0_t #branch for loop 0
                  beq          gp, a7, sub_3_154_1_t #branch for loop 1
                  add          s3, t0, a2
                  la           t1, region_1+1370 #start load_store_instr_stream_1
                  sb           t2, -380(t1)
                  la           s5, region_0+632 #start load_store_instr_stream_0
                  sb           sp, 164(s5)
                  lhu          zero, -748(t1)
                  lbu          a3, -153(t1)
                  sb           t1, -139(s5)
                  sb           a1, 79(t1)
                  lw           s9, 116(s5)
                  lbu          s1, -423(t1)
                  sb           s0, -141(s5)
                  sh           s7, -530(t1)
                  sw           s6, 212(s5)
                  sw           t6, 228(s5)
                  lh           t3, 380(t1)
                  lw           s3, -690(t1)
                  lhu          ra, 214(s5)
                  lw           t6, 582(t1) #end load_store_instr_stream_1
                  lb           t0, -136(s5) #end load_store_instr_stream_0
sub_3_51:         jal          t6, 1f
0:                c.jal        3f
1:                c.j          21f
2:                jal          ra, 11f
3:                c.j          15f
4:                jal          s10, 22f
5:                c.jal        14f
6:                jal          s10, 0b
7:                c.j          17f
8:                c.jal        13f
9:                c.j          4b
10:               jal          t0, 7b
11:               c.jal        10b
12:               jal          a2, 6b
13:               c.j          19f
14:               c.jal        23f
15:               c.j          8b
16:               jal          s1, 18f
17:               c.jal        9b
18:               c.jal        12b
19:               c.j          20f
20:               c.j          5b
21:               jal          ra, 2b
22:               c.jal        16b
23:               lui          s4, 879468
                  la           s1, region_0+740 #start riscv_hazard_instr_stream_1
                  lb           t4, 13(s1)
                  lbu          t6, 3(s1)
                  auipc        t4, 728702
                  sw           s4, -8(s1)
                  lh           t4, 16(s1)
                  divu         t6, s7, a1
                  lw           s10, 0(s1)
                  c.mv         s4, t6
                  auipc        a1, 702943
                  lbu          s7, 5(s1)
                  slt          s4, t6, t4
                  c.add        t4, s4
                  c.addi       a1, -1
                  c.mv         t4, t4
                  rem          s7, s10, s4
                  mulhu        s7, t4, s10
                  lbu          s7, -2(s1)
                  lh           s7, 14(s1)
                  c.lui        t4, 22
                  nop
                  add          s4, a1, a1
                  lb           t4, -12(s1)
                  c.srli       a1, 19
                  sh           t4, 2(s1)
                  lbu          a1, 3(s1)
                  rem          s10, a1, s4
                  c.sub        a1, a1
                  c.mv         s10, t6
                  mulhu        s4, t6, t6
                  addi         t6, s7, 1746
                  c.mv         a1, s10
                  div          t6, s7, s4
                  c.srai       a1, 19
                  lh           s10, -10(s1)
                  srl          s7, t4, s10
                  mulhsu       s4, s7, s7
                  auipc        s10, 399665
                  sb           s7, -9(s1)
                  mulhu        t4, a1, t4
                  c.addi       t6, -1
                  lb           a1, 12(s1) #end riscv_hazard_instr_stream_1
                  la           t1, region_0+1998 #start load_store_instr_stream_0
                  la           t4, region_1+1348 #start load_store_instr_stream_1
                  lbu          s7, -167(t1)
                  lb           t5, 34(t4)
                  sh           gp, -186(t1)
                  sw           t6, -66(t1)
                  lb           s8, -178(t1)
                  sb           tp, 185(t4)
                  sh           t3, -122(t1)
                  sb           t2, -169(t4)
                  lb           s11, -92(t1)
                  lhu          s1, -212(t1)
                  lb           a3, -93(t4)
                  lbu          s11, -74(t4)
                  lbu          s7, -194(t4)
                  sb           t3, 151(t4)
                  lw           t0, -10(t1)
                  sh           s7, 146(t4) #end load_store_instr_stream_1
                  lbu          a7, 0(t1) #end load_store_instr_stream_0
                  la           a7, region_1+710 #start riscv_load_store_rand_instr_stream_11
                  nop
                  lb           a4, 1047(a7)
                  and          a1, zero, s7
                  srai         a2, gp, 26
                  sb           sp, 631(a7)
                  c.addi16sp   sp, 496
                  lb           a0, -647(a7)
                  lh           s1, 426(a7)
                  c.li         t0, -1
                  sb           t0, 135(a7)
                  sw           a0, 1138(a7)
                  c.addi       t4, 19
                  sltu         t4, t4, t1
                  mulhsu       sp, ra, a2
                  mulhsu       t2, t0, s11
                  sh           a2, -402(a7)
                  c.and        a4, s1
                  sll          gp, a3, a5
                  sll          t4, a6, gp
                  sub          s3, gp, a2
                  andi         t5, a4, 683
                  sw           t0, 102(a7)
                  sra          a4, a1, s9
                  lh           t2, 368(a7)
                  sw           a1, 1046(a7)
                  lbu          zero, 157(a7)
                  mulhu        a1, a5, a1
                  c.and        s1, a3
                  lb           ra, 789(a7)
                  ori          t5, ra, -930
                  c.nop
                  c.nop
                  lb           s8, 183(a7)
                  lb           t3, -657(a7)
                  sw           s9, 210(a7)
                  sltu         s4, a5, gp
                  sll          t4, gp, a7
                  sra          t3, ra, s0
                  div          s0, s5, s3
                  sb           s8, 10(a7) #end riscv_load_store_rand_instr_stream_11
                  la           s2, region_0+1655 #start riscv_load_store_rand_instr_stream_21
                  sb           t6, -18(s2)
                  lbu          zero, -31(s2)
                  c.add        t2, s6
                  c.add        a2, t4
                  c.andi       a3, -1
                  c.add        a4, a1
                  lb           s10, -17(s2)
                  lh           t4, 23(s2)
                  lb           sp, -4(s2)
                  lb           s7, 58(s2)
                  andi         t0, a0, -1071
                  nop
                  and          s4, a1, s8
                  divu         t6, a6, zero
                  lb           s10, 10(s2)
                  c.add        s9, t2
                  lhu          s6, -43(s2)
                  lb           a3, 62(s2)
                  sll          s8, s1, tp
                  c.and        a3, a3
                  sb           tp, 28(s2)
                  slti         t4, sp, 732
                  sb           tp, 30(s2)
                  auipc        a4, 635370
                  slti         t2, s4, 299
                  lhu          s8, 43(s2)
                  sh           zero, -25(s2) #end riscv_load_store_rand_instr_stream_21
                  la           s3, region_1+1000 #start riscv_hazard_instr_stream_3
                  lhu          a7, -42(s3)
                  lbu          gp, -12(s3)
                  srli         a7, gp, 6
                  c.addi       a7, -1
                  addi         t2, a4, 1400
                  c.mv         t6, a0
                  lb           t6, -20(s3)
                  lw           a0, -8(s3)
                  sh           t2, 32(s3)
                  xor          a7, a7, t2
                  lbu          a0, 55(s3)
                  sltiu        a4, gp, 224
                  sw           gp, 16(s3)
                  lhu          a4, 58(s3)
                  xori         a4, a7, 1239
                  lbu          t6, 62(s3)
                  lbu          a0, 19(s3)
                  mul          t2, a7, a0
                  c.mv         t2, a7
                  ori          gp, a7, 1959
                  sb           a0, -45(s3)
                  sb           a4, -53(s3)
                  lb           t2, 25(s3)
                  sb           a0, 15(s3)
                  lbu          a7, -51(s3)
                  nop
                  srl          gp, gp, t2
                  mulhsu       t6, a7, t2
                  c.xor        a0, a4
                  sll          a7, t2, a7
                  lbu          a0, -3(s3)
                  lbu          a7, -42(s3)
                  sb           gp, -29(s3)
                  sb           a4, -5(s3)
                  sb           gp, 0(s3)
                  c.sub        a4, a4
                  lui          a0, 179867
                  lbu          a0, -50(s3)
                  sub          a4, a4, a0
                  c.addi       t2, 7
                  sb           t2, 16(s3)
                  c.lui        a4, 11
                  slt          a7, a7, a7
                  slti         a0, a4, 839
                  lb           a0, 61(s3)
                  lw           a0, -52(s3)
                  lhu          a7, -46(s3)
                  rem          a0, a4, t2
                  lb           t6, 1(s3) #end riscv_hazard_instr_stream_3
                  la           a7, region_0+1857 #start riscv_load_store_hazard_instr_stream_13
                  sltiu        sp, a6, -743
                  lb           t2, -551(a7)
                  c.and        s1, a4
                  sltu         sp, s1, a1
                  c.srli       s1, 9
                  mulhu        t1, s4, t0
                  lb           a3, -551(a7)
                  c.li         s10, -1
                  lh           a0, -551(a7)
                  srai         a1, s2, 15
                  lhu          t6, -551(a7)
                  lb           s6, -551(a7)
                  sb           t4, -1360(a7)
                  lb           s2, -1360(a7)
                  lbu          a1, -1360(a7)
                  lb           t0, -1360(a7)
                  sb           sp, -1504(a7)
                  lb           s8, -1504(a7) #end riscv_load_store_hazard_instr_stream_13
                  la           s4, amo_0+52 #start riscv_lr_sc_instr_stream_17
                  mul          t1, s9, a3
                  slli         s10, t1, 10
                  lr.w          s11, (s4)
                  mulhsu       s7, s7, s7
                  c.sub        a2, s0
                  c.lui        a2, 29
                  sc.w.aq       s2, s0, (s4) #end riscv_lr_sc_instr_stream_17
                  la           s4, region_0+123 #start riscv_hazard_instr_stream_15
                  lw           a3, 53(s4)
                  c.andi       s1, -1
                  sb           t0, 52(s4)
                  lbu          a4, 12(s4)
                  lb           s2, 40(s4)
                  slti         ra, s2, 2029
                  lbu          s1, -2(s4)
                  c.andi       a3, -1
                  c.li         s2, -1
                  c.addi       s2, -1
                  lbu          s2, -16(s4)
                  xor          a3, t0, ra
                  lui          t0, 52236
                  lbu          t0, 37(s4)
                  c.lui        a3, 26
                  sb           t0, 18(s4)
                  c.add        ra, ra
                  sh           ra, -13(s4)
                  c.and        s1, s1
                  lh           a3, -19(s4)
                  c.addi       a3, -1
                  c.nop
                  or           s1, s1, s2
                  sltiu        a4, ra, 405
                  sb           ra, -63(s4) #end riscv_hazard_instr_stream_15
                  la           sp, region_1+1211 #start riscv_hazard_instr_stream_7
                  rem          s8, s5, s5
                  lb           s0, -30(sp)
                  c.srli       a4, 30
                  xor          t1, s0, t1
                  sb           a0, -50(sp)
                  c.mv         a0, s5
                  c.slli       a0, 22
                  srl          s5, a4, a4
                  sltu         s0, a0, s5
                  sb           t1, -33(sp)
                  sub          a0, s5, s0
                  c.xor        a4, s0
                  c.or         a4, s0
                  lhu          s8, -9(sp)
                  lb           s5, -14(sp)
                  lbu          a4, 20(sp)
                  sb           s0, -29(sp)
                  lbu          t1, 12(sp)
                  lb           a0, 60(sp)
                  mulh         a4, s0, s0
                  div          s5, a4, s5
                  c.slli       t1, 28
                  add          s0, s8, a0
                  lbu          s5, 45(sp)
                  auipc        s8, 709672
                  slli         s8, t1, 13
                  auipc        s8, 903547
                  lh           s8, -43(sp)
                  c.xor        a0, a4
                  rem          a4, a4, s0
                  auipc        a0, 792760
                  c.addi       s5, -1
                  sb           a4, 55(sp)
                  or           s5, s8, s0
                  mulhsu       a4, a4, s8
                  c.mv         a4, t1
                  sltu         t1, s8, a0
                  c.sub        a0, s0
                  lb           a0, -62(sp) #end riscv_hazard_instr_stream_7
                  la           sp, region_0+733 #start riscv_hazard_instr_stream_9
                  lw           s10, -49(sp)
                  c.xor        a3, a3
                  and          s10, gp, s3
                  sb           s10, -28(sp)
                  c.addi       gp, -1
                  lb           gp, 16(sp)
                  sra          s3, s9, s10
                  sw           a3, 55(sp)
                  sll          t1, s3, t1
                  lb           s10, 36(sp)
                  lb           t1, -34(sp)
                  sll          t1, s9, s3
                  sb           s9, 12(sp)
                  lh           gp, 17(sp)
                  c.mv         s10, gp
                  c.andi       a3, -1
                  lb           s3, 54(sp)
                  lb           t1, -20(sp)
                  sh           s3, 13(sp)
                  c.lui        gp, 21
                  c.srli       a3, 31
                  lb           a3, 40(sp)
                  lh           gp, 1(sp)
                  sb           t1, -26(sp)
                  addi         t1, t1, 1852
                  lbu          s9, -20(sp)
                  sb           s9, -17(sp)
                  srli         a3, gp, 9
                  sh           t1, -37(sp) #end riscv_hazard_instr_stream_9
sub_3_50:         jal          t6, 15f
0:                c.jal        24f
1:                jal          ra, 5f
2:                jal          t1, 16f
3:                c.j          21f
4:                c.j          6f
5:                c.j          10f
6:                c.jal        17f
7:                c.jal        19f
8:                jal          t0, 4b
9:                c.jal        1b
10:               c.jal        30f
11:               c.j          20f
12:               c.j          0b
13:               c.j          8b
14:               c.j          25f
15:               c.jal        2b
16:               c.j          12b
17:               jal          s1, 3b
18:               c.jal        11b
19:               jal          t4, 23f
20:               c.jal        14b
21:               jal          ra, 28f
22:               c.j          13b
23:               c.jal        29f
24:               jal          t2, 27f
25:               c.j          9b
26:               c.jal        7b
27:               c.jal        22b
28:               jal          ra, 26b
29:               c.jal        18b
30:               c.andi       a1, -1
                  la           a7, region_0+1688 #start riscv_hazard_instr_stream_16
                  divu         a4, a4, a3
                  sb           t5, -1675(a7)
                  sb           s11, -354(a7)
                  srli         t5, a0, 13
                  c.or         a4, a0
                  lb           a3, -620(a7)
                  lhu          t1, -1114(a7)
                  sb           t5, -363(a7)
                  or           a0, t5, t5
                  lb           a0, 257(a7)
                  sb           s11, -1167(a7)
                  slli         a0, a4, 18
                  lb           t5, -1550(a7)
                  c.addi       t5, 21
                  lb           t5, -1321(a7)
                  sb           t5, 1(a7)
                  srli         t5, t1, 17
                  lb           t5, -622(a7)
                  lb           t1, -65(a7)
                  lui          s11, 806768
                  lbu          a0, -1614(a7)
                  lbu          a0, -243(a7)
                  lbu          t1, -386(a7)
                  lhu          t1, -974(a7)
                  lbu          a0, 9(a7)
                  lbu          a3, -1646(a7)
                  srl          s11, s11, a4
                  lw           a0, 64(a7)
                  slt          a4, s11, a0
                  c.and        a3, a3
                  lb           a4, -981(a7)
                  lb           a3, -1466(a7)
                  srli         a3, t5, 17
                  lb           t5, -813(a7)
                  andi         a4, a0, -335
                  lb           t5, -1489(a7)
                  lbu          a0, -1062(a7)
                  lbu          t5, 307(a7)
                  and          a4, a3, a3
                  sw           a0, -468(a7)
                  auipc        a0, 584935
                  lb           t5, -770(a7)
                  lb           s11, -489(a7)
                  sb           t1, 79(a7) #end riscv_hazard_instr_stream_16
                  la           s1, amo_0+20 #start riscv_amo_instr_stream_16
                  la           t3, amo_0+60
                  la           sp, amo_0+4
                  la           s5, amo_0+48
                  c.mv         a4, tp
                  amoxor.w.aq   s9, a5, (s1)
                  mulhsu       s8, s2, s3
                  amominu.w.aq  a3, ra, (sp)
                  addi         s11, sp, 825
                  andi         s10, s4, -1968
                  amomaxu.w.rl  s7, zero, (sp)
                  amomin.w.rl   s8, t0, (t3) #end riscv_amo_instr_stream_16
                  la           t6, region_0+389 #start riscv_load_store_hazard_instr_stream_6
                  and          s2, t2, s0
                  c.addi4spn   a2, sp, 208
                  lb           a4, 60(t6)
                  sb           a5, -108(t6)
                  srai         a4, s9, 1
                  lbu          s1, -98(t6)
                  c.andi       a3, -1
                  lb           s0, -98(t6)
                  lh           a2, -243(t6)
                  sh           s2, -243(t6)
                  lhu          s0, -243(t6)
                  lb           t1, -243(t6)
                  lbu          gp, 112(t6)
                  sh           t4, 225(t6)
                  or           s10, s1, a4
                  lb           s10, -72(t6) #end riscv_load_store_hazard_instr_stream_6
                  la           a4, region_0+1380 #start load_store_instr_stream_1
                  sb           ra, -12(a4)
                  lbu          a2, -21(a4)
                  la           s0, region_0+871 #start load_store_instr_stream_0
                  lb           sp, -55(s0)
                  lb           a3, -75(a4)
                  lbu          s2, -246(s0)
                  lb           s5, 225(a4)
                  sb           gp, 202(a4)
                  la           ra, region_0+383 #start load_store_instr_stream_2
                  lb           s7, 982(s0)
                  sw           t4, -11(ra)
                  sw           a0, -11(ra)
                  sb           s11, 177(a4)
                  lbu          t5, -6(ra)
                  lb           a1, -149(a4)
                  lbu          s9, -1(ra)
                  lb           s6, -9(ra)
                  lb           a0, 639(s0)
                  lbu          sp, -34(a4) #end load_store_instr_stream_1
                  sh           s3, 13(ra) #end load_store_instr_stream_2
                  sb           s2, 1010(s0)
                  sh           a2, 287(s0) #end load_store_instr_stream_0
                  la           a4, amo_0+56 #start riscv_lr_sc_instr_stream_5
                  c.nop
                  c.srli       a2, 19
                  xor          t3, s5, a6
                  c.mv         s2, a7
                  lr.w.aq       t4, (a4)
                  c.addi       a7, 31
                  auipc        a0, 958754
                  sc.w.aq       zero, t1, (a4) #end riscv_lr_sc_instr_stream_5
                  la           s4, amo_0+28 #start riscv_lr_sc_instr_stream_6
                  slti         s0, t1, -1958
                  lr.w.aq       a2, (s4)
                  andi         a3, t2, -1498
                  c.addi4spn   a4, sp, 800
                  lui          gp, 827084
                  c.xor        a0, s1
                  nop
                  div          ra, gp, s5
                  srai         s0, ra, 22
                  andi         s8, s5, -453
                  c.add        s2, s4
                  mulhsu       s5, a1, sp
                  ori          s8, t3, 952
                  rem          t4, s3, zero
                  c.mv         t2, sp
                  sc.w          s2, s10, (s4) #end riscv_lr_sc_instr_stream_6
                  la           s3, region_1+1882 #start riscv_load_store_hazard_instr_stream_18
                  lb           t2, -1(s3)
                  and          t5, s11, t1
                  lb           s8, -1(s3)
                  lb           gp, -1(s3)
                  lb           s1, -9(s3)
                  lh           s10, -16(s3)
                  lh           t4, -16(s3)
                  sh           t5, -16(s3)
                  sh           s9, 10(s3)
                  lb           s10, 1(s3)
                  lw           s8, 6(s3)
                  sb           t1, -5(s3)
                  lb           s6, -5(s3)
                  lb           gp, -5(s3)
                  lbu          s2, 2(s3)
                  lbu          gp, 9(s3)
                  sb           gp, 13(s3)
                  sb           s8, -1(s3)
                  lhu          zero, -4(s3) #end riscv_load_store_hazard_instr_stream_18
                  la           a1, region_1+285 #start riscv_hazard_instr_stream_19
                  c.li         t0, -1
                  sh           s8, 205(a1)
                  slti         t0, zero, -1231
                  sll          s0, t0, s0
                  sltu         s8, a2, s2
                  lbu          t0, 146(a1)
                  c.xor        a2, a2
                  sb           zero, 157(a1)
                  nop
                  mulh         s8, zero, a2
                  sb           zero, 151(a1)
                  slt          zero, a2, t0
                  sb           s2, 198(a1)
                  sltu         s2, a2, a2
                  andi         a2, t0, -496
                  c.and        a2, s0
                  c.and        a2, s0
                  slli         zero, a2, 15
                  add          zero, a2, s8
                  sra          s8, zero, zero
                  lbu          zero, -15(a1)
                  auipc        a2, 339852
                  c.srli       a2, 19
                  div          s8, s2, zero
                  nop
                  lb           s0, -194(a1)
                  lb           s2, -66(a1)
                  sb           s2, 35(a1)
                  auipc        s2, 607385
                  sb           s8, 239(a1)
                  sltiu        zero, s0, -629
                  sltiu        a2, t0, 1587
                  c.xor        a2, a2
                  lbu          s8, 71(a1)
                  and          zero, a2, s0
                  sb           s8, 62(a1)
                  div          zero, s0, s0
                  c.or         s0, a2
                  lhu          a2, 43(a1)
                  c.andi       a2, 17
                  lbu          zero, 128(a1) #end riscv_hazard_instr_stream_19
                  la           s7, amo_0+0 #start riscv_amo_instr_stream_2
                  c.addi       t5, -1
                  c.and        a3, a5
                  amoadd.w.aq   t1, a6, (s7)
                  amomaxu.w.rl  sp, ra, (s7)
                  amominu.w     gp, t4, (s7)
                  amoadd.w      s0, a6, (s7)
                  c.addi       a2, 10
                  amomax.w      sp, s11, (s7)
                  c.addi       s3, -1
                  amominu.w     t0, a3, (s7)
                  amomax.w      ra, s7, (s7)
                  amominu.w.aq  a4, s6, (s7)
                  amoxor.w.rl   zero, a7, (s7) #end riscv_amo_instr_stream_2
                  la           s10, region_1+1264 #start load_store_instr_stream_0
                  la           sp, region_0+495 #start load_store_instr_stream_1
                  lhu          t0, -4(s10)
                  sb           ra, -15(s10)
                  sh           a1, -11(sp)
                  lb           s9, 14(sp)
                  lb           s9, -1(s10)
                  lbu          t5, -14(s10)
                  sb           a1, -16(sp)
                  sh           s3, 1(sp)
                  lbu          s1, -7(s10)
                  lbu          s0, 11(sp)
                  sh           s0, 2(s10)
                  sw           s10, -7(sp)
                  sb           t0, 1(s10)
                  sb           a7, -8(sp) #end load_store_instr_stream_1
                  lbu          s7, 11(s10) #end load_store_instr_stream_0
                  la           sp, region_0+1932 #start riscv_load_store_hazard_instr_stream_8
                  sh           a1, -44(sp)
                  lb           s0, -44(sp)
                  sb           t3, -44(sp)
                  lh           s0, 26(sp)
                  c.mv         s5, s7
                  c.addi       s6, 10
                  lhu          s3, 26(sp)
                  slti         s9, s2, 316
                  c.mv         s6, a2
                  xori         s0, s10, -824
                  lhu          gp, 26(sp)
                  c.and        a1, s0
                  c.xor        s1, s1
                  sh           a0, 26(sp)
                  lb           gp, 47(sp)
                  lb           s8, 47(sp)
                  lb           s7, 47(sp) #end riscv_load_store_hazard_instr_stream_8
                  la           a0, region_0+1919 #start riscv_load_store_hazard_instr_stream_24
                  mulh         zero, s11, s2
                  sll          t1, tp, s4
                  sw           s2, -15(a0)
                  lh           t5, -9(a0)
                  mulhsu       s10, s0, a6
                  lw           ra, -15(a0)
                  sb           gp, -15(a0)
                  lbu          s7, -8(a0)
                  lb           a3, -8(a0)
                  lbu          s10, -13(a0)
                  lbu          t0, 11(a0)
                  lh           t6, -11(a0)
                  lhu          gp, -15(a0)
                  lbu          t5, 3(a0)
                  lhu          s11, 11(a0)
                  lbu          a1, 11(a0)
                  sub          s0, s0, t2
                  sh           s5, 11(a0)
                  sh           s9, 11(a0)
                  c.mv         t6, s3
                  lui          s7, 36987
                  lh           a3, -9(a0)
                  lbu          a3, -9(a0)
                  c.and        s0, a3
                  sh           s10, -9(a0) #end riscv_load_store_hazard_instr_stream_24
                  la           s0, region_0+303 #start load_store_instr_stream_0
                  la           s4, region_1+896 #start load_store_instr_stream_1
                  lb           s3, -119(s4)
                  lh           sp, 238(s4)
                  lbu          a2, -14(s0)
                  sb           a5, -253(s4)
                  lbu          s3, -49(s4)
                  sb           a1, -47(s4)
                  lb           a1, -130(s0)
                  sh           s1, -142(s4)
                  lbu          gp, -150(s0)
                  lbu          t0, 44(s4)
                  lh           t2, 136(s4)
                  lh           ra, -71(s0)
                  lb           t5, 82(s4)
                  lb           zero, -32(s0)
                  lhu          a0, 162(s4) #end load_store_instr_stream_1
                  lhu          t3, -225(s0) #end load_store_instr_stream_0
                  la           s2, region_1+1877 #start load_store_instr_stream_1
                  la           s3, region_1+108 #start load_store_instr_stream_4
                  la           t1, region_1+1609 #start load_store_instr_stream_2
                  la           s10, region_1+1906 #start load_store_instr_stream_3
                  sb           a7, -5(s3)
                  sb           s9, -25(s10)
                  lbu          s7, 0(s3)
                  la           a4, region_1+911 #start load_store_instr_stream_0
                  lhu          s8, 189(t1)
                  lb           t0, 2(a4)
                  lbu          a1, 77(s2)
                  sh           a7, -222(s10)
                  lh           a1, -16(s3)
                  sh           s9, 183(t1)
                  lbu          t0, -210(s2)
                  lbu          sp, 190(t1)
                  lbu          t5, -114(s2)
                  lbu          a3, -240(s10)
                  lw           a7, -142(s10)
                  sb           s6, -198(t1)
                  lhu          t6, -1(a4)
                  lh           t2, -117(s2)
                  sb           zero, -14(a4)
                  lb           s11, 91(s10)
                  sh           s5, -110(s10)
                  sh           s7, 23(s2)
                  lb           a1, 237(t1)
                  lbu          ra, -8(s10)
                  lb           t0, 4(a4)
                  lb           t2, -253(s2)
                  lb           s0, -63(s2)
                  lb           s9, 15(s3)
                  sb           t6, 3(a4)
                  lbu          a1, -7(a4)
                  lb           s11, 14(s3)
                  lbu          s7, -9(s2)
                  lb           a0, 9(t1) #end load_store_instr_stream_2
                  lb           ra, 9(s3)
                  sb           a5, 79(s10)
                  lbu          t2, 15(s3)
                  lbu          gp, 48(s2) #end load_store_instr_stream_1
                  sb           sp, 5(s3)
                  lhu          gp, 2(s3) #end load_store_instr_stream_4
                  lb           s9, -160(s10) #end load_store_instr_stream_3
                  lbu          s0, 7(a4)
                  lb           a3, 10(a4) #end load_store_instr_stream_0
                  la           a4, region_1+119 #start load_store_instr_stream_1
                  sb           s11, 1342(a4)
                  la           t4, region_0+1538 #start load_store_instr_stream_0
                  lb           ra, 35(t4)
                  lbu          sp, 764(a4)
                  lbu          t2, 1336(a4)
                  lb           s6, -27(t4)
                  lbu          t0, 622(a4)
                  sb           a2, 1696(a4)
                  lb           t3, -59(t4)
                  lb           t2, 1678(a4)
                  lbu          s4, 824(a4)
                  lh           s6, -38(t4)
                  lb           s7, 70(a4)
                  sb           ra, 210(a4) #end load_store_instr_stream_1
                  sb           gp, 35(t4)
                  lbu          a2, 61(t4) #end load_store_instr_stream_0
                  la           sp, region_0+238 #start riscv_load_store_hazard_instr_stream_3
                  lw           a4, 46(sp)
                  lb           a2, 46(sp)
                  lbu          a4, 57(sp)
                  sb           gp, 57(sp)
                  sb           a5, 57(sp)
                  srli         a4, a0, 11
                  sb           s7, 57(sp)
                  addi         t0, t0, 447
                  sb           a2, 57(sp)
                  lb           a0, 57(sp)
                  sb           s8, 57(sp)
                  lb           a3, 57(sp)
                  sb           t0, 57(sp)
                  andi         s3, s8, 1636
                  lb           s8, 57(sp)
                  sb           a7, 57(sp)
                  mulhu        t1, tp, s0
                  c.li         t6, 17
                  sb           t5, -50(sp)
                  sb           s2, -22(sp)
                  lb           a0, -13(sp) #end riscv_load_store_hazard_instr_stream_3
                  la           t0, region_1+406 #start load_store_instr_stream_2
                  la           t3, region_1+87 #start load_store_instr_stream_1
                  la           ra, region_1+1556 #start load_store_instr_stream_0
                  sb           t5, -105(t0)
                  sw           t3, 1737(t3)
                  lb           a3, 493(t3)
                  sh           t3, 198(t0)
                  lb           s6, 32(t0)
                  sw           s10, -1392(ra)
                  sb           t1, -81(t0)
                  lb           t4, 1090(t3)
                  lb           s4, -149(t0)
                  lb           gp, -1386(ra)
                  sb           s6, 994(t3)
                  lbu          a3, 640(t3)
                  lbu          s0, -1472(ra)
                  lbu          a1, 37(t0)
                  sb           a5, 834(t3)
                  lw           sp, -216(ra)
                  sh           s7, 248(t0)
                  sb           t1, 408(t3)
                  lbu          s8, -17(t0) #end load_store_instr_stream_2
                  lhu          a0, 21(t3) #end load_store_instr_stream_1
                  lbu          s9, 75(ra) #end load_store_instr_stream_0
                  la           s2, region_0+290 #start riscv_load_store_hazard_instr_stream_23
                  sb           s1, -2(s2)
                  sb           t4, -3(s2)
                  auipc        t5, 744705
                  lhu          a4, -14(s2)
                  lb           t4, 0(s2)
                  lbu          t1, -10(s2)
                  sb           a4, 11(s2)
                  lb           a0, 1(s2)
                  lh           t4, 2(s2)
                  sb           a7, 13(s2)
                  sb           t6, 13(s2)
                  sub          ra, s4, t1
                  sb           tp, -9(s2)
                  sb           s2, -9(s2)
                  lbu          a3, 15(s2)
                  lb           t1, 8(s2)
                  lbu          zero, 9(s2)
                  remu         s4, t1, t2
                  sh           a4, 16(s2)
                  sh           s2, 16(s2)
                  sh           a5, 0(s2) #end riscv_load_store_hazard_instr_stream_23
                  la           t1, amo_0+24 #start riscv_amo_instr_stream_14
                  la           t6, amo_0+56
                  la           s2, amo_0+4
                  la           s7, amo_0+60
                  amomaxu.w.aq  a1, a7, (t6)
                  amoor.w.aq    s0, t1, (t1)
                  slti         s0, s7, 1420
                  ori          s9, t3, 978
                  amominu.w     s8, t6, (t6)
                  amoand.w      a0, s6, (t1)
                  amoor.w.aq    t2, s2, (t6)
                  c.lui        a0, 24
                  amomax.w.rl   s6, a0, (t6)
                  amomin.w.aq   sp, t0, (s7)
                  amoor.w.aq    s6, a4, (t6)
                  amoxor.w      s5, zero, (t1)
                  amoand.w.aq   t5, t1, (t1) #end riscv_amo_instr_stream_14
sub_3_60:         jal          t6, 9f
0:                c.jal        12f
1:                c.jal        11f
2:                c.jal        7f
3:                c.jal        6f
4:                c.jal        15f
5:                c.jal        19f
6:                c.j          4b
7:                c.j          20f
8:                c.jal        16f
9:                c.j          10f
10:               jal          ra, 5b
11:               c.j          17f
12:               c.j          2b
13:               jal          t1, 0b
14:               jal          ra, 8b
15:               c.jal        18f
16:               jal          t1, 3b
17:               c.jal        13b
18:               jal          t1, 1b
19:               c.j          14b
20:               divu         a3, s6, t1
                  la           a7, amo_0+52 #start riscv_lr_sc_instr_stream_3
                  c.li         s5, 10
                  c.or         s0, a3
                  c.or         a4, s0
                  lr.w          t4, (a7)
                  addi         t0, s10, -1157
                  c.or         a0, a4
                  ori          s10, a7, -1047
                  rem          s9, t0, s1
                  c.lui        s0, 25
                  c.or         a1, a3
                  c.addi4spn   s0, sp, 624
                  c.mv         t6, s0
                  sc.w          s11, a5, (a7) #end riscv_lr_sc_instr_stream_3
                  la           a3, region_1+1742 #start riscv_hazard_instr_stream_14
                  sb           a0, 1(a3)
                  lbu          s6, 14(a3)
                  sb           a4, 9(a3)
                  sb           t5, 15(a3)
                  andi         t5, t3, 491
                  lbu          t5, 7(a3)
                  slli         t5, a0, 23
                  lb           a0, 3(a3)
                  lb           a4, -13(a3)
                  c.slli       a4, 15
                  sltiu        t3, s6, -1159
                  lb           s6, 7(a3)
                  srl          a0, s6, a0
                  lhu          a4, -12(a3)
                  div          t3, t3, a0
                  sw           s6, -2(a3)
                  lbu          a0, 16(a3)
                  rem          t3, s6, t5
                  lb           s10, 3(a3)
                  lb           a4, 0(a3)
                  sb           s6, -9(a3)
                  lbu          a4, -12(a3)
                  nop
                  sh           a4, -6(a3)
                  slli         t3, s10, 28
                  nop
                  sb           s6, 12(a3)
                  xori         t3, t3, -1814
                  lb           s6, 7(a3)
                  c.or         a0, a4
                  lbu          s10, 2(a3) #end riscv_hazard_instr_stream_14
                  la           a1, region_1+1599 #start load_store_instr_stream_4
                  la           t5, region_1+1138 #start load_store_instr_stream_2
                  sb           a0, 122(t5)
                  la           a4, region_1+1231 #start load_store_instr_stream_1
                  la           a2, region_1+265 #start load_store_instr_stream_3
                  la           s11, region_1+1593 #start load_store_instr_stream_0
                  lb           gp, 1318(a2)
                  sb           t3, -23(t5)
                  sb           s6, -14(s11)
                  lbu          s1, 39(a4)
                  sh           a2, 80(t5)
                  sb           t2, -44(a1)
                  lw           s6, 1607(a2)
                  sb           s5, -52(a2)
                  lh           s0, -11(a4)
                  lbu          gp, 0(a2)
                  lbu          s3, 38(s11)
                  lbu          a7, -26(a4)
                  sb           a6, 151(t5)
                  lw           t1, -33(s11)
                  lbu          gp, 1202(a2)
                  lhu          s4, -189(a1)
                  lbu          s9, -91(t5)
                  sb           s11, -24(a4)
                  lb           s1, 255(t5)
                  lb           a7, 29(s11)
                  sb           t6, 94(a1)
                  lb           ra, -37(a4)
                  lbu          t0, -62(a1)
                  lb           s0, 666(a2)
                  sb           a2, -182(a1) #end load_store_instr_stream_4
                  lb           t6, 1699(a2)
                  sb           t1, 24(a4)
                  sh           s10, -61(s11)
                  lb           s8, 21(s11)
                  lbu          t3, 48(t5)
                  sb           ra, -12(s11)
                  sb           t5, -23(a4)
                  lb           t3, 24(a4) #end load_store_instr_stream_1
                  lb           s2, 15(s11)
                  lbu          s4, 83(t5) #end load_store_instr_stream_2
                  sb           s5, 154(a2) #end load_store_instr_stream_3
                  lw           t3, -61(s11)
                  sb           s6, -2(s11) #end load_store_instr_stream_0
                  la           t4, region_1+744 #start riscv_hazard_instr_stream_26
                  lhu          t2, -12(t4)
                  lh           s3, -18(t4)
                  c.sub        a2, a3
                  lh           a3, 52(t4)
                  sh           s3, -38(t4)
                  rem          a3, s3, t6
                  remu         t6, t6, ra
                  mulhsu       ra, ra, a3
                  c.mv         t6, t2
                  sltiu        s3, ra, 1570
                  slli         a2, ra, 25
                  lb           ra, -26(t4)
                  sb           a3, 17(t4)
                  slli         ra, s3, 16
                  c.srai       a3, 17
                  sw           t6, -60(t4)
                  c.mv         a3, s3
                  auipc        ra, 615558
                  lh           a3, -48(t4)
                  lbu          ra, -11(t4)
                  or           a2, a3, t6
                  lhu          s3, 44(t4)
                  lb           t2, 53(t4) #end riscv_hazard_instr_stream_26
                  la           a0, amo_0+28 #start riscv_amo_instr_stream_10
                  la           t2, amo_0+4
                  la           s1, amo_0+8
                  amoand.w.aq   a1, sp, (s1)
                  amoand.w.aq   s11, s7, (a0)
                  amoswap.w.rl  s4, s5, (a0) #end riscv_amo_instr_stream_10
                  la           t6, region_1+1158 #start riscv_load_store_rand_instr_stream_25
                  lhu          t5, 24(t6)
                  lh           s0, 58(t6)
                  lb           s7, -56(t6)
                  sb           sp, 45(t6)
                  c.andi       a0, 14
                  sb           t5, -45(t6)
                  lw           s6, -6(t6)
                  lbu          s7, 41(t6)
                  lb           a1, -1(t6)
                  lhu          s5, -12(t6)
                  lbu          s8, 42(t6)
                  c.addi       ra, 3
                  lbu          a0, -59(t6)
                  c.li         s9, -1
                  srli         s2, t2, 6
                  sb           a6, -31(t6)
                  lb           a4, 3(t6)
                  lbu          t5, -41(t6)
                  lbu          s8, 63(t6)
                  lw           t3, -34(t6)
                  lbu          gp, -63(t6)
                  c.srli       a3, 9
                  c.add        sp, t6
                  sb           t3, 64(t6)
                  sra          a2, s5, tp
                  lhu          s2, 56(t6)
                  sb           s4, -31(t6)
                  c.slli       t1, 1
                  lhu          s10, 12(t6)
                  lb           s9, 5(t6)
                  lhu          s3, -38(t6)
                  and          a4, s3, s5
                  sub          s8, s5, s4
                  rem          s1, t0, a4
                  lbu          t5, 15(t6)
                  lbu          sp, 11(t6)
                  lbu          s8, -54(t6)
                  lbu          s4, 30(t6)
                  lhu          s6, 42(t6)
                  lbu          s4, -29(t6) #end riscv_load_store_rand_instr_stream_25
                  la           s8, region_0+179 #start riscv_load_store_hazard_instr_stream_22
                  lb           s10, 74(s8)
                  lbu          t1, 96(s8)
                  c.srai       a2, 3
                  lbu          gp, 96(s8)
                  lbu          sp, 96(s8)
                  lbu          sp, 186(s8)
                  lbu          s11, 186(s8)
                  lbu          t5, -168(s8)
                  lb           s1, -168(s8)
                  lbu          t4, 88(s8)
                  lbu          s0, -134(s8)
                  lbu          sp, -134(s8)
                  lb           a0, -134(s8)
                  remu         a2, a5, t2
                  lbu          a3, -134(s8)
                  sb           s8, -130(s8)
                  sb           s2, -130(s8)
                  lhu          t1, 191(s8)
                  sb           s11, 213(s8)
                  lh           gp, 213(s8)
                  sh           a3, 213(s8)
                  lb           t5, -172(s8) #end riscv_load_store_hazard_instr_stream_22
                  la           sp, region_1+194 #start riscv_hazard_instr_stream_5
                  lbu          t1, -187(sp)
                  sb           t6, -129(sp)
                  c.and        a3, a3
                  sb           t1, -150(sp)
                  lb           s7, -87(sp)
                  divu         t6, t6, s4
                  srli         s4, a3, 31
                  lbu          t1, 194(sp)
                  and          t1, s0, s4
                  lb           s7, -138(sp)
                  nop
                  lbu          s0, 31(sp)
                  lui          s7, 350501
                  lb           a3, -82(sp)
                  lb           s4, 84(sp)
                  xor          s0, s4, t1
                  lb           s0, 26(sp)
                  lbu          t6, 16(sp)
                  sra          a3, t6, s7
                  sb           a3, -9(sp)
                  c.mv         t6, t1
                  addi         t1, t1, 1227
                  lb           s7, -5(sp)
                  mulhsu       t6, s0, t1
                  lbu          t6, -104(sp)
                  lbu          t6, 118(sp)
                  sltiu        t1, t1, -1452
                  c.or         s0, s0
                  lbu          s4, -130(sp)
                  lhu          s0, 220(sp)
                  lb           s4, 98(sp) #end riscv_hazard_instr_stream_5
                  la           s1, region_1+1154 #start riscv_load_store_rand_instr_stream_17
                  lhu          sp, 24(s1)
                  c.xor        a4, s1
                  lb           a3, -203(s1)
                  c.lui        t0, 10
                  c.add        t5, s7
                  sb           t0, -83(s1)
                  mulh         gp, s0, s9
                  lh           t1, -182(s1)
                  mulh         t3, s1, t2
                  lbu          s4, 158(s1)
                  lbu          s10, 105(s1)
                  sb           a3, -13(s1)
                  slt          s10, ra, a4
                  lbu          s0, 85(s1)
                  rem          a4, s10, t4
                  lh           a3, 238(s1)
                  lh           s9, 256(s1)
                  c.lui        t4, 8
                  lb           a2, -66(s1)
                  mulhu        t4, s8, s2
                  c.or         a1, a0
                  c.nop
                  lb           s2, 184(s1)
                  sw           s1, -94(s1)
                  sb           gp, 110(s1)
                  add          a3, s5, s10
                  lb           s11, -17(s1)
                  c.srai       a1, 28
                  rem          t1, s9, ra
                  lhu          s4, -156(s1)
                  lbu          a1, -197(s1)
                  lbu          s5, -149(s1)
                  c.addi4spn   a3, sp, 64
                  sb           t1, -80(s1)
                  mulh         gp, s2, a2
                  sb           s8, 35(s1)
                  sb           tp, -145(s1)
                  sb           s10, -19(s1)
                  lhu          a1, -44(s1)
                  lb           s10, 64(s1)
                  mulhsu       t3, s8, s2
                  lui          ra, 602288
                  srai         zero, s11, 27
                  lb           s3, 252(s1)
                  lb           s7, -193(s1)
                  lbu          a0, -207(s1)
                  lh           s11, -52(s1)
                  sb           t1, 160(s1) #end riscv_load_store_rand_instr_stream_17
                  la           t0, region_1+1204 #start riscv_load_store_hazard_instr_stream_11
                  sb           gp, -67(t0)
                  andi         s7, s1, -1453
                  addi         s5, a4, -1060
                  sh           a5, -194(t0)
                  lbu          a2, -190(t0)
                  sltu         t1, a6, a6
                  lhu          t3, -198(t0)
                  lb           s9, 3(t0)
                  lbu          a4, 173(t0)
                  sb           s10, 159(t0)
                  sb           s9, 159(t0)
                  lbu          zero, 147(t0)
                  lb           gp, -46(t0)
                  lbu          s10, -79(t0)
                  lw           s9, 192(t0)
                  lbu          a2, 129(t0)
                  lb           s3, 193(t0)
                  sb           a2, 223(t0)
                  c.lui        s1, 18
                  lbu          s10, 223(t0)
                  lbu          zero, -153(t0)
                  sb           a0, -153(t0)
                  lh           s5, 104(t0) #end riscv_load_store_hazard_instr_stream_11
                  la           s5, region_0+1833 #start riscv_load_store_rand_instr_stream_7
                  lb           a1, 3(s5)
                  lh           t3, 5(s5)
                  lbu          ra, 0(s5)
                  sltu         t1, a0, s7
                  remu         a0, s2, tp
                  lui          s11, 674385
                  lb           a7, 4(s5)
                  c.lui        t3, 10
                  mulhsu       s3, a7, gp
                  rem          a7, s4, t5
                  sb           t4, 12(s5)
                  sb           a7, 14(s5)
                  c.or         a4, a4
                  auipc        zero, 159340
                  c.addi       gp, 24
                  c.or         a1, s1
                  xor          a2, a4, a1
                  auipc        t3, 229277
                  sb           t3, -11(s5)
                  sb           t4, 6(s5)
                  slt          a3, t0, s3
                  addi         s2, a4, 521
                  mulh         a2, s7, s4
                  sltiu        gp, tp, -789
                  c.andi       a2, -1
                  sb           a6, -11(s5)
                  c.lui        t0, 26
                  c.mv         s8, tp
                  sb           a4, 4(s5)
                  lh           ra, -11(s5)
                  c.lui        s8, 3
                  lb           gp, -3(s5)
                  slli         s10, s9, 25
                  sh           a7, -15(s5)
                  add          a2, a4, s7
                  lhu          sp, 5(s5) #end riscv_load_store_rand_instr_stream_7
                  la           ra, region_0+396 #start riscv_hazard_instr_stream_0
                  srl          s11, a4, t4
                  sb           zero, -35(ra)
                  mulhsu       zero, a1, t0
                  sw           s11, -4(ra)
                  lb           t0, -61(ra)
                  and          zero, a1, a1
                  slti         t4, s11, -319
                  lb           a1, -18(ra)
                  lw           t0, 12(ra)
                  sw           s11, -36(ra)
                  c.sub        a1, a4
                  lbu          a4, 3(ra)
                  auipc        zero, 275667
                  c.srli       a1, 11
                  sh           t4, 42(ra)
                  sb           t0, 7(ra)
                  sb           t0, -53(ra)
                  srl          a1, t0, a1
                  c.sub        a1, a4
                  lbu          a4, 17(ra)
                  lhu          t4, 26(ra)
                  sb           a1, -42(ra)
                  lbu          a4, 50(ra)
                  andi         a4, t0, -901
                  div          a4, t0, a4
                  sh           t0, 52(ra)
                  srli         a4, zero, 2
                  sb           t4, 6(ra)
                  lbu          s11, -54(ra)
                  sltiu        a1, s11, -496
                  sb           a4, 63(ra)
                  sb           a1, -31(ra)
                  lhu          a4, 20(ra)
                  lb           zero, 47(ra)
                  lbu          t0, -13(ra) #end riscv_hazard_instr_stream_0
                  la           s2, region_0+227 #start load_store_instr_stream_4
                  la           sp, region_0+760 #start load_store_instr_stream_1
                  sb           a7, -8(s2)
                  la           s8, region_0+1155 #start load_store_instr_stream_2
                  lb           t5, -500(s8)
                  sb           ra, 834(s8)
                  la           a3, region_0+1585 #start load_store_instr_stream_3
                  la           s5, region_0+1398 #start load_store_instr_stream_0
                  lb           t0, -897(s8)
                  lbu          t3, -53(s5)
                  lb           t2, -37(s2)
                  sh           t6, -496(sp)
                  lbu          s1, 26(s2)
                  lhu          t4, -29(s2)
                  lb           s7, -1353(a3)
                  lhu          s9, 19(s2)
                  lhu          t5, -25(s2)
                  lb           s7, -32(a3)
                  lbu          s0, 37(s5)
                  lb           s11, 87(sp)
                  lb           s3, 721(sp)
                  sw           a1, -62(s5)
                  sb           s9, 85(a3)
                  sb           s1, -370(sp)
                  lb           s7, 356(s8)
                  lbu          t5, 59(s5)
                  lhu          a4, 2(s5)
                  lb           s9, -570(sp)
                  lbu          t6, 448(s8)
                  lbu          t4, 1017(sp)
                  lbu          s0, 540(s8)
                  lb           s6, 541(sp)
                  lb           s10, -93(a3)
                  sb           s11, 350(s8)
                  lb           s10, -22(s2)
                  lbu          a4, -47(s5)
                  sw           s11, 304(sp)
                  sb           sp, -964(a3) #end load_store_instr_stream_3
                  lb           zero, -828(s8)
                  lb           a0, -446(sp) #end load_store_instr_stream_1
                  lb           t4, 13(s5)
                  lbu          t3, -59(s5)
                  sb           a5, 47(s2)
                  sb           a5, 760(s8) #end load_store_instr_stream_2
                  sw           t5, 17(s2) #end load_store_instr_stream_4
                  lh           t2, -44(s5) #end load_store_instr_stream_0
                  la           a4, region_1+302 #start riscv_load_store_rand_instr_stream_27
                  xor          s8, a1, a7
                  xor          s4, s8, s7
                  sltiu        s11, t4, 1526
                  mulhsu       a0, t6, ra
                  lb           s11, -2(a4)
                  sh           s4, -4(a4)
                  c.mv         a7, s3
                  lbu          t4, -1(a4)
                  c.andi       a1, -1
                  slli         t6, tp, 16
                  c.and        a0, a5
                  mulh         a1, a3, t6
                  lbu          t3, 7(a4)
                  div          zero, a6, t5
                  sb           t0, 5(a4)
                  srl          s9, sp, s4
                  lb           a3, -4(a4)
                  c.sub        a0, a0
                  srl          s5, zero, s1
                  lbu          s11, 5(a4)
                  c.andi       a0, 25
                  lb           t4, 16(a4)
                  lh           t0, -16(a4)
                  c.xor        a2, a5
                  c.li         t2, -1
                  c.andi       a0, -1
                  c.or         a1, s0
                  lbu          t0, -13(a4) #end riscv_load_store_rand_instr_stream_27
                  la           s11, region_0+955 #start load_store_instr_stream_1
                  lh           s8, 203(s11)
                  la           s7, region_1+1006 #start load_store_instr_stream_0
                  lw           t0, 209(s11)
                  sb           s6, 886(s11)
                  lbu          a0, 25(s7)
                  sh           t3, -591(s11)
                  lh           s8, 34(s7)
                  lbu          t5, 470(s11)
                  lw           a0, -43(s11)
                  lb           gp, 51(s7)
                  lh           s0, -42(s7)
                  lbu          s0, 52(s11)
                  sh           t0, 473(s11)
                  lb           zero, 37(s7)
                  lhu          a2, -18(s7)
                  lw           a3, -347(s11)
                  sh           gp, -485(s11) #end load_store_instr_stream_1
                  lbu          s10, 25(s7)
                  lh           s5, 48(s7) #end load_store_instr_stream_0
sub_3_66:         jal          t6, 4f
0:                c.jal        2f
1:                jal          t1, 13f
2:                jal          t1, 16f
3:                c.j          12f
4:                jal          t1, 25f
5:                jal          gp, 20f
6:                c.j          27f
7:                jal          s9, 24f
8:                jal          t1, 26f
9:                c.jal        0b
10:               c.jal        14f
11:               c.j          15f
12:               c.jal        23f
13:               jal          ra, 22f
14:               jal          a4, 21f
15:               jal          t6, 18f
16:               c.j          11b
17:               c.j          3b
18:               jal          t1, 7b
19:               c.j          6b
20:               c.jal        9b
21:               jal          t1, 19b
22:               jal          t1, 17b
23:               c.j          10b
24:               c.j          8b
25:               jal          ra, 5b
26:               c.j          1b
27:               srli         s11, sp, 0
                  la           a4, amo_0+20 #start riscv_lr_sc_instr_stream_19
                  lr.w          a1, (a4)
                  sc.w          t4, t0, (a4) #end riscv_lr_sc_instr_stream_19
                  addi         s1, zero, -6 #init loop 1 counter
                  mulhsu       s8, gp, s0
                  slti         t6, gp, -1150
                  c.srli       a2, 26
                  srl          t0, a6, ra
                  c.and        a2, a5
                  srli         t5, gp, 4
                  slti         a7, t0, 892
                  c.addi16sp   sp, -16
                  addi         a1, zero, 3 #init loop 1 limit
                  sltiu        s9, a0, 453
sub_3_148_1_t:    andi         s4, s10, 941
                  slli         s0, t4, 9
                  c.andi       a2, -1
                  remu         s6, sp, t2
                  addi         s1, s1, 9 #update loop 1 counter
                  c.li         a7, -1
                  addi         t2, zero, -3 #init loop 0 counter
                  addi         t3, zero, 8 #init loop 0 limit
                  sltiu        sp, s1, 795
sub_3_148_0_t:    or           a4, a0, s0
                  mul          a3, s5, ra
                  c.or         a4, a1
                  srl          t1, s1, ra
                  addi         t2, t2, 6 #update loop 0 counter
                  c.andi       a2, -1
                  bltu         t2, t3, sub_3_148_0_t #branch for loop 0
                  c.li         s4, 3
                  nop
                  c.mv         sp, s8
                  nop
                  beq          s1, a1, sub_3_148_1_t #branch for loop 1
                  or           s9, t1, s6
                  la           s9, region_0+486 #start load_store_instr_stream_1
                  la           t3, region_1+288 #start load_store_instr_stream_0
                  sb           s5, 1335(s9)
                  lbu          s3, 11(t3)
                  lw           s4, 634(s9)
                  sb           s3, 1492(s9)
                  sh           s4, -2(t3)
                  sb           zero, 8(t3)
                  lbu          ra, 1427(s9)
                  sw           t6, 1314(s9) #end load_store_instr_stream_1
                  lw           a3, 16(t3)
                  lhu          zero, -10(t3) #end load_store_instr_stream_0
                  la           s3, region_0+1225 #start load_store_instr_stream_0
                  sb           t0, 12(s3)
                  la           sp, region_0+408 #start load_store_instr_stream_1
                  lbu          t6, -203(sp)
                  lbu          t2, 16(s3)
                  lbu          t2, -217(sp)
                  lw           a1, -96(sp)
                  lhu          s10, 246(sp)
                  lbu          s2, -7(s3)
                  lh           t1, 15(s3)
                  sb           a0, -172(sp) #end load_store_instr_stream_1
                  sb           sp, -6(s3) #end load_store_instr_stream_0
                  la           sp, region_1+897 #start riscv_hazard_instr_stream_24
                  lhu          s3, -29(sp)
                  lbu          s0, 1(sp)
                  srli         a1, s7, 19
                  lbu          s9, 37(sp)
                  lb           ra, -56(sp)
                  lh           a1, -41(sp)
                  c.nop
                  xor          ra, s0, s0
                  lhu          s3, -3(sp)
                  lhu          s7, 25(sp)
                  c.andi       a1, 0
                  lb           ra, 49(sp)
                  slti         s7, ra, 427
                  lh           s7, 29(sp)
                  c.li         s0, -1
                  add          s0, s3, s0
                  slti         s3, a1, -1070
                  sb           s7, -34(sp)
                  lh           ra, -17(sp)
                  sltu         a1, s3, a1
                  sltu         s7, s0, s7
                  lbu          ra, -8(sp)
                  lb           ra, 54(sp)
                  lb           s9, 24(sp)
                  slli         s7, s3, 30
                  lhu          s0, -1(sp)
                  c.addi       s3, 9
                  sh           s3, 3(sp)
                  sb           s3, 60(sp)
                  lbu          s9, -45(sp)
                  sb           a1, 42(sp)
                  xori         s0, s0, -956
                  lh           s3, 35(sp)
                  lbu          s3, -10(sp)
                  c.nop
                  lb           s7, -7(sp) #end riscv_hazard_instr_stream_24
sub_3_54:         jal          t6, 1f
0:                c.j          10f
1:                c.jal        4f
2:                jal          t1, 0b
3:                c.jal        5f
4:                c.jal        12f
5:                jal          s2, 8f
6:                jal          s5, 11f
7:                c.jal        2b
8:                c.j          6b
9:                c.jal        7b
10:               c.jal        3b
11:               jal          ra, 13f
12:               c.j          9b
13:               andi         gp, s8, -1483
                  addi         s10, zero, -1 #init loop 1 counter
                  andi         s7, s0, 150
                  c.li         t4, 2
                  addi         sp, zero, -9 #init loop 1 limit
sub_3_144_1_t:    or           s5, t1, t5
                  c.srai       s1, 12
                  xor          s0, s7, zero
                  sltiu        s9, a7, -1865
                  ori          a2, s7, -383
                  mulh         t0, t2, s11
                  nop
                  ori          s6, a3, 630
                  and          t0, a3, a3
                  c.xor        a3, a4
                  addi         s10, s10, -2 #update loop 1 counter
                  mulhu        a3, gp, ra
                  addi         a4, zero, 10 #init loop 0 counter
                  c.srai       a3, 5
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_144_0_t:    nop
                  addi         a4, a4, -5 #update loop 0 counter
                  divu         s8, s8, s8
                  srl          a0, s3, a4
                  andi         s11, s1, -1146
                  c.add        a1, s4
                  c.beqz       a4, sub_3_144_0_t #branch for loop 0
                  auipc        ra, 942
                  bge          s10, sp, sub_3_144_1_t #branch for loop 1
                  div          gp, s11, a1
sub_3_58:         jal          t6, 17f
0:                c.j          10f
1:                jal          gp, 13f
2:                c.jal        3f
3:                c.j          8f
4:                jal          ra, 1b
5:                c.j          9f
6:                c.jal        2b
7:                c.j          5b
8:                jal          ra, 0b
9:                c.jal        18f
10:               jal          ra, 7b
11:               c.j          14f
12:               jal          gp, 19f
13:               c.j          6b
14:               jal          ra, 15f
15:               jal          s2, 12b
16:               c.j          11b
17:               c.j          4b
18:               jal          t5, 16b
19:               c.addi4spn   a0, sp, 384
                  la           s10, region_0+509 #start load_store_instr_stream_1
                  la           sp, region_0+922 #start load_store_instr_stream_3
                  lb           s0, 152(s10)
                  la           s2, region_0+78 #start load_store_instr_stream_2
                  la           t3, region_0+551 #start load_store_instr_stream_0
                  lb           s4, 449(sp)
                  sb           s3, -14(s2)
                  sb           s8, -78(s10)
                  lb           s3, -60(t3)
                  sh           a0, 1(t3)
                  lb           a2, -16(s2)
                  sw           t5, 75(s10)
                  sb           t3, 340(sp)
                  sb           t0, -24(t3)
                  lb           t0, 480(sp)
                  sb           s6, -65(s10)
                  lbu          a7, -203(s10)
                  lhu          s0, -496(sp)
                  lbu          a2, 9(s2)
                  sb           a1, 12(s2)
                  sb           s6, -39(s10)
                  sb           a6, 20(t3)
                  lh           t6, -538(sp) #end load_store_instr_stream_3
                  lb           t5, -22(t3)
                  lh           a7, -133(s10)
                  sb           s5, 120(s10) #end load_store_instr_stream_1
                  lbu          s4, -9(s2) #end load_store_instr_stream_2
                  lbu          a7, -2(t3) #end load_store_instr_stream_0
                  addi         t0, zero, -9 #init loop 0 counter
                  slt          s10, sp, s5
                  rem          t1, tp, a4
                  sll          t6, a3, tp
                  c.add        t1, tp
                  addi         a3, zero, 0 #init loop 0 limit
                  add          s5, s7, a6
                  xor          s6, t4, s11
                  divu         t6, t0, s9
                  c.xor        a1, s0
                  and          a0, t0, a0
                  xori         s4, s2, 912
sub_3_151_0_t:    c.addi4spn   a2, sp, 624
                  srli         s4, a4, 0
                  c.srli       a4, 21
                  c.lui        s8, 29
                  srli         a1, s5, 30
                  sra          s7, s6, s1
                  addi         t0, t0, 9 #update loop 0 counter
                  beq          t0, a3, sub_3_151_0_t #branch for loop 0
                  srl          gp, tp, a3
                  la           a4, amo_0+48 #start riscv_amo_instr_stream_6
                  amomaxu.w     a7, s7, (a4)
                  sltu         s7, tp, t6
                  remu         a2, t6, t5
                  amoadd.w      ra, a2, (a4) #end riscv_amo_instr_stream_6
                  la           sp, region_1+462 #start riscv_load_store_rand_instr_stream_18
                  slli         gp, s5, 30
                  divu         t4, a5, t6
                  c.and        s0, a3
                  sh           a7, 698(sp)
                  sb           s1, 471(sp)
                  lbu          t6, 191(sp)
                  lb           a3, -415(sp)
                  mul          gp, ra, s9
                  xor          ra, t6, t6
                  c.srli       s1, 25
                  lh           s10, 310(sp)
                  sb           a5, 669(sp)
                  mul          s8, s9, a4
                  c.or         a3, s1
                  lb           s2, -322(sp)
                  lui          a1, 969898
                  lbu          s0, 1017(sp)
                  or           s9, tp, s4
                  c.li         s3, 24
                  lbu          s1, -198(sp)
                  c.andi       s0, -1
                  lbu          s9, 1163(sp)
                  lh           s11, 312(sp)
                  remu         s6, t3, a1
                  ori          a3, a0, -639
                  lb           gp, 504(sp)
                  sw           a0, 70(sp)
                  auipc        ra, 1040318
                  sb           s0, 564(sp)
                  lb           t0, 673(sp)
                  lb           s4, 211(sp) #end riscv_load_store_rand_instr_stream_18
                  la           sp, region_1+1638 #start riscv_load_store_hazard_instr_stream_17
                  lb           s4, 64(sp)
                  lb           t3, 64(sp)
                  sb           s5, 64(sp)
                  lw           a0, -46(sp)
                  sw           t2, -46(sp)
                  sb           a1, -46(sp)
                  lbu          s9, -46(sp)
                  lw           t5, -46(sp)
                  lw           s11, -46(sp)
                  lb           a2, -46(sp)
                  lbu          ra, -46(sp)
                  lw           s6, -46(sp)
                  lhu          t0, -24(sp)
                  srai         t5, s3, 16
                  sb           t1, -24(sp)
                  sb           t1, -24(sp)
                  sh           t5, -24(sp)
                  lhu          t1, -24(sp)
                  lh           ra, -20(sp) #end riscv_load_store_hazard_instr_stream_17
                  la           ra, amo_0+12 #start riscv_amo_instr_stream_1
                  la           s5, amo_0+36
                  amoxor.w      s1, ra, (s5)
                  c.srai       a3, 4
                  amoand.w.aq   t6, a5, (s5)
                  andi         a7, t5, 607
                  c.add        s3, a4
                  amoadd.w.aq   t4, s11, (ra)
                  amoxor.w.aq   a3, tp, (s5)
                  amomin.w      s8, a3, (ra)
                  amomin.w      t1, t4, (s5)
                  amominu.w.rl  a0, a5, (ra) #end riscv_amo_instr_stream_1
                  la           sp, region_1+448 #start riscv_load_store_rand_instr_stream_13
                  c.nop
                  or           s8, s8, s10
                  mulhu        t0, s2, a0
                  sb           a1, 50(sp)
                  lbu          zero, -45(sp)
                  lw           s0, -180(sp)
                  remu         a2, a7, a5
                  lbu          s2, 201(sp)
                  lh           t2, -206(sp)
                  lb           a3, 123(sp)
                  and          s2, t4, tp
                  c.srai       a0, 11
                  mulhu        t0, s4, t5
                  xori         s2, t6, 1751
                  mulhu        zero, t1, s0
                  sb           a7, -43(sp)
                  addi         a1, s4, 1065
                  xori         s11, s4, 1749
                  sra          s0, a2, t2
                  lb           ra, 139(sp)
                  mul          t6, t5, s1
                  sltu         a0, s10, t6
                  slt          t0, s8, t3
                  div          t1, a0, s4
                  sltiu        ra, t5, -1003
                  remu         s11, gp, a5
                  c.mv         a1, s4
                  addi         s10, t4, 405
                  ori          t6, a0, 1567
                  sltu         a4, a1, s10
                  lbu          s8, 159(sp)
                  lbu          t3, -230(sp)
                  nop
                  andi         s1, t6, 1981
                  lbu          s0, -117(sp)
                  lbu          t1, 35(sp)
                  ori          t6, ra, 1082
                  lbu          a3, -147(sp)
                  lb           s2, -1(sp) #end riscv_load_store_rand_instr_stream_13
                  la           a1, region_0+97 #start riscv_load_store_rand_instr_stream_0
                  lbu          a3, 30(a1)
                  lhu          a3, 11(a1)
                  lb           s3, -44(a1)
                  mulhsu       zero, s5, s6
                  lb           s3, -39(a1)
                  c.srai       a2, 15
                  lbu          s1, -36(a1)
                  lb           t1, -13(a1)
                  lbu          t2, 22(a1)
                  lb           s6, -8(a1)
                  sh           a7, -5(a1)
                  lbu          s9, 21(a1)
                  lhu          s1, -45(a1)
                  sb           t3, 14(a1)
                  lh           a0, 59(a1)
                  lb           sp, -59(a1)
                  c.andi       s1, 31
                  sh           t6, -15(a1)
                  lhu          s4, -57(a1)
                  lhu          zero, 31(a1)
                  srai         t2, t3, 22
                  c.slli       t4, 29
                  lbu          s7, -42(a1)
                  lb           s10, -63(a1)
                  mulh         s3, s6, s2
                  slt          gp, s4, t6
                  mul          t3, ra, s11
                  c.addi16sp   sp, -16
                  c.srli       s0, 30
                  lbu          s2, 56(a1)
                  c.xor        a2, a1
                  lb           s9, 2(a1)
                  lhu          t0, -25(a1)
                  lb           s8, -6(a1)
                  sb           t1, 0(a1)
                  lb           a3, 53(a1) #end riscv_load_store_rand_instr_stream_0
                  la           gp, region_0+475 #start load_store_instr_stream_1
                  la           s2, region_1+870 #start load_store_instr_stream_0
                  lbu          a1, 14(gp)
                  lb           s9, -55(s2)
                  lb           t3, -5(gp)
                  lb           s10, 16(gp)
                  lh           s3, -7(gp)
                  lbu          a7, 186(s2)
                  lb           a3, 167(s2)
                  sb           tp, -144(s2)
                  sb           t1, -8(gp)
                  lbu          s5, -10(gp)
                  lbu          s10, 63(s2)
                  sb           a0, 211(s2)
                  lb           sp, 4(gp)
                  lbu          s3, -14(gp)
                  sb           s9, 1(gp)
                  lh           s5, -40(s2)
                  sb           a2, 225(s2)
                  sh           t5, 7(gp) #end load_store_instr_stream_1
                  lb           t1, 68(s2) #end load_store_instr_stream_0
                  la           s11, amo_0+8 #start riscv_lr_sc_instr_stream_2
                  lr.w.rl       a3, (s11)
                  c.slli       gp, 9
                  rem          a3, t1, a2
                  c.addi16sp   sp, -16
                  addi         s10, s2, 640
                  sltiu        s8, s3, 410
                  slti         t5, a7, -340
                  xori         t1, t5, -961
                  c.sub        s1, a3
                  sc.w          s8, a2, (s11) #end riscv_lr_sc_instr_stream_2
                  la           s8, region_0+1776 #start load_store_instr_stream_1
                  la           a1, region_1+757 #start load_store_instr_stream_0
                  lbu          ra, -1226(s8)
                  sh           gp, 1(a1)
                  lb           t4, -1434(s8)
                  lh           s4, 11(a1)
                  lhu          t2, -1096(s8)
                  lbu          ra, -15(a1)
                  sb           a3, 8(a1)
                  lbu          ra, 9(a1)
                  lbu          ra, 1(a1)
                  sh           t0, -1084(s8)
                  sh           a0, -1418(s8)
                  lb           a2, 2(a1)
                  lb           s0, 14(a1)
                  lbu          s5, -1513(s8)
                  sb           a1, -592(s8) #end load_store_instr_stream_1
                  lbu          s1, 7(a1) #end load_store_instr_stream_0
sub_3_73:         jal          t6, 4f
0:                c.jal        7f
1:                c.j          12f
2:                c.jal        1b
3:                c.j          5f
4:                jal          t1, 11f
5:                jal          t4, 0b
6:                c.jal        9f
7:                c.j          2b
8:                c.jal        10f
9:                jal          ra, 3b
10:               c.jal        6b
11:               c.j          8b
12:               xori         a3, s9, 351
                  la           s7, amo_0+60 #start riscv_lr_sc_instr_stream_4
                  lr.w          sp, (s7)
                  slli         ra, a5, 12
                  sltu         s5, s8, s0
                  mulhsu       t5, a7, a1
                  c.srli       a4, 6
                  sc.w.aq       zero, t5, (s7) #end riscv_lr_sc_instr_stream_4
                  la           ra, region_0+491 #start load_store_instr_stream_0
                  la           a2, region_1+296 #start load_store_instr_stream_1
                  lhu          s5, 2(a2)
                  lb           t3, 8(ra)
                  lb           t0, 58(a2)
                  lb           zero, 9(a2)
                  lb           s11, -7(ra)
                  lbu          s7, 7(a2)
                  lhu          s10, 24(a2)
                  lb           s1, 16(ra)
                  sh           t0, 9(ra)
                  lb           s9, 3(a2)
                  lbu          s3, -8(ra)
                  lb           a0, 3(a2)
                  sb           s11, -21(a2) #end load_store_instr_stream_1
                  sb           s3, 13(ra)
                  lb           s6, 12(ra) #end load_store_instr_stream_0
                  la           s3, region_0+738 #start riscv_load_store_rand_instr_stream_19
                  sh           a6, -16(s3)
                  mulhu        a1, a1, a5
                  divu         t2, a0, s2
                  lbu          gp, 33(s3)
                  c.add        a1, a4
                  lbu          t5, 5(s3)
                  c.srli       a0, 2
                  lh           s10, -56(s3)
                  addi         s8, sp, 241
                  lbu          s2, -60(s3)
                  lbu          s4, 19(s3)
                  c.nop
                  lb           a3, -31(s3)
                  lh           s8, 44(s3)
                  xor          s5, a5, s8
                  slli         t3, sp, 20
                  xor          s9, s7, s6
                  slli         s4, s4, 28
                  sltu         zero, s6, s3
                  sh           s5, -22(s3)
                  xori         a2, s7, -1156
                  c.lui        a1, 22
                  c.xor        a2, a2
                  c.mv         t6, t4
                  lb           t2, -25(s3)
                  sh           a4, -28(s3)
                  sh           ra, -6(s3)
                  div          s11, s5, a3
                  divu         t0, a4, a6
                  lui          s6, 181442
                  lui          ra, 829747
                  srli         t1, s5, 21
                  c.slli       a0, 10
                  xor          ra, s7, ra
                  lb           zero, -1(s3)
                  c.add        s8, ra
                  lh           zero, 12(s3) #end riscv_load_store_rand_instr_stream_19
                  la           t2, region_1+35 #start riscv_hazard_instr_stream_20
                  srai         s4, t0, 0
                  c.li         t0, -1
                  slt          s4, s9, s1
                  c.xor        s1, s1
                  lb           s1, 120(t2)
                  srai         s9, s6, 11
                  srai         t0, s4, 9
                  slt          t0, s1, s4
                  and          t0, t0, t0
                  c.sub        s1, s1
                  c.sub        s1, s1
                  sltu         s6, t0, s2
                  lbu          t0, 84(t2)
                  c.li         s1, -1
                  auipc        s4, 168039
                  srli         s1, t0, 0
                  nop
                  lbu          s6, 177(t2)
                  lhu          s9, 201(t2)
                  c.li         t0, 7
                  mulhu        s2, s4, t0
                  c.sub        s1, s1
                  c.sub        s1, s1
                  sra          s2, s2, s2
                  lbu          s9, -5(t2)
                  lb           s9, 6(t2)
                  lb           s9, 58(t2)
                  lbu          s2, 115(t2)
                  mul          s4, t0, s2
                  lbu          s6, 50(t2)
                  lw           s6, 141(t2)
                  lh           s4, 171(t2)
                  srli         s6, s1, 16
                  c.addi       s4, -1
                  lb           s4, -26(t2)
                  srli         t0, s4, 8
                  c.slli       s2, 15
                  srli         s6, s4, 23
                  srli         s2, s4, 30
                  sb           s2, 46(t2) #end riscv_hazard_instr_stream_20
                  la           s0, region_0+1665 #start riscv_hazard_instr_stream_12
                  c.srli       a1, 4
                  lbu          t4, -1214(s0)
                  sb           s4, 160(s0)
                  sra          a1, a4, t4
                  lb           a1, -1364(s0)
                  lb           a7, -1520(s0)
                  sb           a2, -32(s0)
                  xori         a1, a2, 1003
                  divu         t4, t4, a2
                  remu         a1, t4, a1
                  mulhu        a7, t4, t4
                  lh           s4, -867(s0)
                  ori          s4, a7, 1593
                  mulh         a4, s4, t4
                  sh           a2, -539(s0)
                  mulhsu       s4, a4, s4
                  c.xor        a2, a2
                  c.li         s4, 8
                  lw           s4, 35(s0)
                  or           a2, s4, a4
                  rem          a2, a7, a4
                  remu         t4, a7, t4
                  sh           t4, -657(s0)
                  addi         a7, a1, -464
                  lbu          a7, 174(s0)
                  c.and        a4, a1
                  srli         s4, a7, 31
                  sb           a4, -754(s0)
                  lbu          a1, -1400(s0)
                  lb           a7, 92(s0) #end riscv_hazard_instr_stream_12
                  addi         a1, zero, -9 #init loop 1 counter
                  c.lui        a7, 25
                  addi         zero, zero, 0 #init loop 1 limit
sub_3_157_1_t:    divu         t5, s2, a5
                  slli         t3, s11, 21
                  addi         a1, a1, 3 #update loop 1 counter
                  addi         ra, zero, 0 #init loop 0 counter
                  addi         a0, zero, -16 #init loop 0 limit
                  c.addi16sp   sp, -16
sub_3_157_0_t:    c.mv         s8, s1
                  addi         ra, ra, -4 #update loop 0 counter
                  remu         t4, t0, a2
                  mulh         t2, s10, s6
                  nop
                  bne          ra, a0, sub_3_157_0_t #branch for loop 0
                  c.srli       a3, 12
                  c.bnez       a1, sub_3_157_1_t #branch for loop 1
                  and          sp, s3, s1
                  la           a3, region_0+1832 #start load_store_instr_stream_0
                  lbu          a2, -9(a3)
                  lb           s10, 15(a3)
                  la           t6, region_1+688 #start load_store_instr_stream_1
                  lbu          a7, -3(a3)
                  lw           gp, 1300(t6)
                  lw           t0, -12(a3)
                  lbu          s2, -15(a3)
                  sb           t2, -153(t6)
                  lb           s5, 9(a3)
                  lbu          s6, -5(a3)
                  lb           zero, -6(a3)
                  lbu          s1, 645(t6)
                  lhu          zero, 14(a3)
                  lb           t1, 807(t6)
                  sb           a2, 1121(t6) #end load_store_instr_stream_1
                  lb           a4, -15(a3) #end load_store_instr_stream_0
                  la           s0, region_0+461 #start load_store_instr_stream_1
                  la           t0, region_1+1531 #start load_store_instr_stream_0
                  sb           gp, 198(t0)
                  lb           t1, 662(s0)
                  lhu          s10, -5(t0)
                  sb           ra, 300(s0)
                  lh           a4, -101(t0)
                  lb           s9, 1419(s0)
                  lb           s4, 1498(s0)
                  lbu          a7, -23(t0)
                  lw           s1, 783(s0)
                  sb           a4, 274(s0)
                  lbu          sp, -225(t0)
                  lbu          sp, 50(t0)
                  lbu          t4, 268(s0) #end load_store_instr_stream_1
                  lhu          s10, -61(t0)
                  lbu          s9, 36(t0) #end load_store_instr_stream_0
                  la           s9, amo_0+24 #start riscv_lr_sc_instr_stream_9
                  auipc        s1, 760236
                  c.li         s5, -1
                  lr.w.aq       s6, (s9)
                  c.srli       a4, 23
                  sltu         a7, t3, s9
                  c.addi4spn   a0, sp, 368
                  sll          s0, tp, a3
                  mulhu        s8, tp, a5
                  c.mv         s3, a4
                  sc.w          a4, s11, (s9) #end riscv_lr_sc_instr_stream_9
                  la           t3, region_1+1907 #start riscv_load_store_hazard_instr_stream_19
                  divu         s3, a0, tp
                  c.and        a1, a2
                  sb           a1, 3(t3)
                  sh           s5, 3(t3)
                  sb           a7, 3(t3)
                  lh           s11, 3(t3)
                  div          s5, s4, s0
                  lb           ra, 3(t3)
                  lh           s0, 3(t3)
                  sb           a6, 4(t3)
                  lb           s9, 4(t3)
                  lbu          t2, -5(t3)
                  sh           s1, -41(t3) #end riscv_load_store_hazard_instr_stream_19
                  la           sp, region_0+262 #start riscv_hazard_instr_stream_25
                  sb           t6, 72(sp)
                  lh           t6, 242(sp)
                  lbu          a0, 117(sp)
                  andi         s9, a2, 1269
                  lb           t6, 233(sp)
                  sw           s9, -66(sp)
                  lbu          a0, 34(sp)
                  lhu          s3, 158(sp)
                  sb           s3, 235(sp)
                  sltu         a2, t6, a2
                  lui          a0, 279494
                  lbu          a2, 65(sp)
                  sb           s9, -100(sp)
                  lb           s9, -93(sp)
                  c.or         a2, a0
                  sb           s9, -37(sp)
                  andi         a2, s9, -122
                  lb           s3, -49(sp)
                  lb           a2, 241(sp)
                  lh           a1, 76(sp)
                  c.srai       a2, 1
                  sb           s3, -53(sp)
                  c.and        a0, a0
                  sw           t6, -94(sp)
                  slti         s9, a1, 1403
                  addi         s9, s9, 1156
                  addi         a1, a2, 1944
                  lb           a2, 122(sp)
                  lbu          a0, 103(sp)
                  c.lui        a0, 20
                  slli         a2, a0, 15
                  lb           s3, 128(sp)
                  nop
                  c.addi       s3, 6
                  sh           t6, -180(sp)
                  c.and        a0, a1
                  sw           a2, -214(sp)
                  sh           a1, -16(sp)
                  add          s9, a2, s9
                  slt          a1, s3, a1
                  rem          a0, s9, a1
                  lb           a1, 167(sp) #end riscv_hazard_instr_stream_25
                  addi         s6, zero, -5 #init loop 1 counter
                  c.srli       s1, 21
                  addi         t6, zero, -14 #init loop 1 limit
sub_3_141_1_t:    auipc        s2, 202072
                  or           s2, a0, t4
                  addi         s6, s6, -9 #update loop 1 counter
                  addi         a4, zero, 6 #init loop 0 counter
                  c.and        a1, s1
                  sltiu        t4, s7, 578
                  sltu         ra, s10, a0
                  addi         s0, zero, 20 #init loop 0 limit
sub_3_141_0_t:    c.xor        s1, a1
                  c.andi       a0, -1
                  andi         s7, t2, -850
                  srai         t5, a2, 15
                  addi         s10, s7, -1348
                  c.and        a2, s0
                  addi         a4, a4, 7 #update loop 0 counter
                  addi         sp, t4, -242
                  beq          a4, s0, sub_3_141_0_t #branch for loop 0
                  bne          s6, t6, sub_3_141_1_t #branch for loop 1
                  sll          a2, t6, t2
                  la           t6, region_0+273 #start riscv_load_store_rand_instr_stream_22
                  lw           ra, 1571(t6)
                  sb           s3, 826(t6)
                  lbu          s1, 628(t6)
                  lui          a2, 154161
                  xor          ra, t5, s4
                  sra          t1, a7, s7
                  lb           ra, 1308(t6)
                  c.srli       s0, 13
                  c.addi4spn   a3, sp, 272
                  c.mv         s8, t2
                  lbu          s4, 889(t6)
                  lbu          a3, 628(t6)
                  c.add        a0, gp
                  mul          a7, s1, zero
                  addi         t1, a0, 1750
                  c.lui        s10, 8
                  lbu          s3, 1248(t6)
                  lbu          s9, -183(t6)
                  c.andi       a0, -1
                  sb           t4, 72(t6)
                  nop
                  slt          t4, a5, s2
                  lh           t3, 1571(t6)
                  add          s8, s0, s2
                  sra          s4, s5, s9
                  sltiu        t4, sp, -1524
                  c.and        a2, a2
                  lbu          a0, 1330(t6)
                  lbu          a1, 1687(t6)
                  lui          a0, 385869
                  sb           a7, 62(t6)
                  xor          t5, t4, tp
                  lbu          a4, -138(t6)
                  andi         s3, a7, 1858
                  lb           zero, -170(t6)
                  c.mv         a7, t0
                  lb           a3, 786(t6)
                  remu         s1, tp, s0
                  c.srli       a2, 12
                  lh           a3, 1331(t6)
                  sltiu        s11, ra, 1908
                  sltiu        s9, s11, -1720
                  sb           a0, 332(t6)
                  lbu          s11, 686(t6)
                  sh           s5, 1591(t6)
                  lb           zero, -29(t6)
                  sb           a5, 557(t6)
                  lb           s0, 524(t6)
                  slli         s2, zero, 28
                  c.and        s0, a3
                  sb           s0, 1658(t6)
                  lb           s0, -14(t6)
                  andi         a1, s3, 123
                  c.or         s1, s0
                  addi         t3, a4, 811
                  lbu          a1, 1262(t6) #end riscv_load_store_rand_instr_stream_22
                  la           s2, region_0+1295 #start load_store_instr_stream_0
                  la           t1, region_1+888 #start load_store_instr_stream_1
                  lb           a1, -808(s2)
                  sh           t6, -386(t1)
                  lbu          s8, -700(s2)
                  lbu          s8, -797(t1)
                  sh           s2, 529(s2)
                  lhu          zero, -390(t1)
                  lb           s10, -1274(s2)
                  lbu          gp, 82(t1)
                  sb           s5, -369(t1)
                  sb           a1, 490(s2)
                  lhu          sp, -260(t1)
                  lh           a4, -104(t1)
                  sb           a2, 83(s2)
                  lb           s10, -774(s2)
                  lbu          t6, 807(t1)
                  lhu          s7, 23(s2)
                  sb           a7, 437(t1)
                  sb           ra, 398(t1) #end load_store_instr_stream_1
                  sb           a6, 702(s2) #end load_store_instr_stream_0
                  la           s4, region_1+332 #start riscv_load_store_rand_instr_stream_20
                  lbu          s8, 2(s4)
                  rem          s6, a4, s9
                  sh           s5, -14(s4)
                  c.srli       a1, 30
                  sb           s4, 16(s4)
                  lb           ra, -11(s4)
                  srli         a3, ra, 26
                  lh           a3, 0(s4)
                  rem          a4, a6, s0
                  lb           s11, 7(s4)
                  add          s1, a6, gp
                  lbu          t6, -1(s4)
                  sh           t4, -6(s4)
                  slt          a7, a0, s9
                  lbu          gp, 10(s4)
                  lb           s0, 1(s4)
                  c.nop
                  sb           t3, 11(s4)
                  lb           a4, 15(s4)
                  addi         s9, t4, -690
                  nop
                  lb           s7, 2(s4)
                  rem          t1, zero, t4
                  lw           s8, -4(s4) #end riscv_load_store_rand_instr_stream_20
                  la           s9, region_0+952 #start riscv_load_store_hazard_instr_stream_15
                  sub          s3, s11, t4
                  sb           s1, -15(s9)
                  lbu          zero, -15(s9)
                  addi         t3, a5, -1304
                  lbu          s7, -15(s9)
                  srl          s6, a1, ra
                  lbu          t5, 53(s9)
                  lbu          s11, 53(s9)
                  lbu          s3, -46(s9)
                  lb           t1, 43(s9)
                  lbu          s10, 43(s9)
                  mul          t1, a6, s5
                  ori          a1, s1, 1702
                  lb           s3, 43(s9)
                  sb           t6, 43(s9) #end riscv_load_store_hazard_instr_stream_15
sub_3_72:         jal          t6, 12f
0:                jal          s5, 6f
1:                c.jal        3f
2:                c.jal        9f
3:                jal          ra, 8f
4:                jal          ra, 10f
5:                c.j          16f
6:                c.j          17f
7:                jal          gp, 5b
8:                c.jal        0b
9:                c.jal        11f
10:               jal          ra, 2b
11:               jal          ra, 1b
12:               c.j          7b
13:               jal          ra, 18f
14:               jal          a7, 13b
15:               c.j          14b
16:               jal          t1, 4b
17:               c.jal        15b
18:               c.mv         a7, t5
                  la           t0, region_1+1860 #start load_store_instr_stream_3
                  la           s6, region_1+386 #start load_store_instr_stream_0
                  sh           s0, -4(t0)
                  lb           s5, 5(t0)
                  la           a0, region_1+820 #start load_store_instr_stream_2
                  lbu          a4, 2(a0)
                  la           s11, region_1+560 #start load_store_instr_stream_1
                  lbu          t1, 1381(s6)
                  lbu          zero, -241(s11)
                  lhu          s1, -2(t0)
                  sb           s3, 125(s11)
                  lh           s10, 800(s6)
                  sb           a3, 12(a0)
                  lbu          sp, -13(a0)
                  lh           a1, -16(t0)
                  lb           s7, 1451(s6)
                  sb           s10, 729(s11)
                  lbu          s3, -7(t0)
                  sb           zero, -265(s6)
                  sh           a1, -2(t0)
                  lb           a2, 1415(s11)
                  lb           s3, -275(s6)
                  sh           s10, -94(s11)
                  sh           s10, -12(t0)
                  sb           s8, 12(a0)
                  lh           s3, 1028(s6)
                  lb           a4, -1(a0)
                  lhu          a2, 536(s11)
                  sb           s3, -9(a0) #end load_store_instr_stream_2
                  lbu          t5, 11(t0)
                  lbu          s5, 842(s11)
                  lhu          a7, 1466(s6)
                  sb           s6, 1383(s6)
                  lb           a4, 5(t0) #end load_store_instr_stream_3
                  lbu          s0, 735(s6)
                  lb           t1, 362(s11) #end load_store_instr_stream_1
                  lb           sp, -41(s6) #end load_store_instr_stream_0
                  la           s1, amo_0+0 #start riscv_amo_instr_stream_18
                  addi         s3, s3, -1944
                  amomaxu.w.rl  a7, t1, (s1) #end riscv_amo_instr_stream_18
                  addi         ra, zero, 10 #init loop 0 counter
                  sub          t1, s7, s6
                  addi         a0, zero, 18 #init loop 0 limit
sub_3_155_0_t:    sltiu        a1, s5, 754
                  addi         ra, ra, 4 #update loop 0 counter
                  bne          ra, a0, sub_3_155_0_t #branch for loop 0
                  sll          s10, s6, a3
                  la           t2, region_0+1389 #start load_store_instr_stream_3
                  la           a0, region_0+636 #start load_store_instr_stream_1
                  la           s5, region_0+278 #start load_store_instr_stream_2
                  lh           sp, -488(a0)
                  sb           s2, -25(s5)
                  la           ra, region_0+294 #start load_store_instr_stream_0
                  sb           a1, 84(a0)
                  sb           s8, 1189(a0)
                  lbu          s8, -3(ra)
                  lw           sp, 62(s5)
                  lbu          t5, 198(a0)
                  lb           a4, -220(t2)
                  lb           t6, -190(s5)
                  lbu          t4, 253(s5)
                  sh           s10, 1124(a0)
                  sh           s10, 81(t2)
                  sb           s3, 297(a0)
                  lbu          s10, -167(t2)
                  lh           sp, -4(ra)
                  sb           s6, -34(t2)
                  sb           t5, -199(s5)
                  lbu          s6, 653(a0)
                  lbu          t1, 53(s5)
                  lbu          s7, -224(t2)
                  lhu          a4, 145(t2)
                  lbu          gp, -9(ra)
                  sw           s10, -6(ra)
                  lbu          gp, -217(s5)
                  sb           s5, 1115(a0) #end load_store_instr_stream_1
                  sb           t6, 11(s5) #end load_store_instr_stream_2
                  lb           a1, -188(t2)
                  lb           s7, 37(t2) #end load_store_instr_stream_3
                  lbu          t0, 13(ra) #end load_store_instr_stream_0
                  la           s4, region_0+975 #start load_store_instr_stream_1
                  la           s9, region_1+645 #start load_store_instr_stream_0
                  lb           gp, -12(s9)
                  lb           s11, 12(s9)
                  lbu          s5, 22(s4)
                  lh           a1, 49(s9)
                  lh           t0, -207(s4)
                  lb           s11, -37(s9)
                  lhu          s11, 241(s4)
                  sb           gp, 58(s9)
                  lbu          s11, 148(s4)
                  lbu          ra, 43(s9)
                  lb           s11, 32(s9)
                  lb           a2, 182(s4) #end load_store_instr_stream_1
                  lb           t1, -32(s9) #end load_store_instr_stream_0
                  la           s4, amo_0+12 #start riscv_amo_instr_stream_19
                  la           gp, amo_0+16
                  la           t1, amo_0+8
                  amoxor.w      s1, t4, (t1)
                  amomax.w.aq   s3, s10, (gp)
                  slli         s10, a0, 28
                  auipc        s10, 994380
                  amoor.w       a4, s6, (t1)
                  amomax.w.rl   s3, s0, (s4) #end riscv_amo_instr_stream_19
                  la           sp, region_0+977 #start riscv_load_store_rand_instr_stream_14
                  lh           t0, -125(sp)
                  sltiu        t0, s7, 1419
                  sb           tp, 142(sp)
                  srai         s11, s7, 18
                  sb           a3, 207(sp)
                  c.li         s9, 9
                  c.and        a2, a2
                  c.addi       s11, 3
                  andi         t5, a5, 539
                  c.li         s11, -1
                  c.or         a0, s0
                  sltiu        s11, zero, -119
                  or           s1, t4, s4
                  c.add        t1, t4
                  ori          a0, a5, 1075
                  sh           sp, -151(sp)
                  lhu          s10, 15(sp)
                  lb           zero, 70(sp)
                  mulhsu       s0, s4, t6
                  sub          t1, a3, a6
                  auipc        t3, 93840
                  lb           t3, 96(sp)
                  lbu          s2, 10(sp)
                  div          t2, a7, a7
                  div          gp, t1, s10
                  c.lui        t5, 8
                  c.or         s0, a0
                  sltiu        a2, a3, 643
                  lb           s2, -182(sp)
                  c.add        a0, t6
                  lb           t4, 10(sp)
                  andi         s4, s3, 753
                  lb           s4, -109(sp)
                  sb           t0, -132(sp)
                  lbu          s10, -247(sp)
                  ori          t5, a0, 1304
                  sltiu        s10, a7, 1747
                  c.addi       s6, -1
                  sb           s1, 124(sp)
                  lb           s7, 104(sp)
                  divu         zero, t2, a4
                  xor          s4, s2, t3
                  sub          t0, zero, s3
                  lh           s1, 135(sp)
                  lhu          zero, 5(sp)
                  lhu          s7, -169(sp) #end riscv_load_store_rand_instr_stream_14
                  la           s11, region_0+1577 #start riscv_hazard_instr_stream_8
                  lhu          s0, -1235(s11)
                  lbu          t0, -843(s11)
                  lhu          t0, 25(s11)
                  c.andi       s1, 17
                  sra          s1, t6, a3
                  c.srai       a3, 5
                  and          t6, s0, t0
                  nop
                  lbu          s1, -795(s11)
                  c.srli       a3, 14
                  srl          s4, s1, s0
                  mulhsu       t6, t6, t0
                  c.addi       t0, 29
                  lbu          t6, -225(s11)
                  sw           t0, -829(s11)
                  sb           a3, 329(s11)
                  slti         t0, t0, 1812
                  mulh         a3, s0, a3
                  xor          a3, s0, t6
                  lbu          s0, -1291(s11)
                  sb           t0, -564(s11)
                  slti         a3, s0, -1400
                  lhu          a3, -301(s11)
                  c.lui        t6, 9
                  sh           s1, 181(s11)
                  lbu          s1, 139(s11)
                  sh           a3, 409(s11)
                  addi         s0, s0, 503
                  lbu          a3, -202(s11)
                  c.srai       s0, 24
                  sb           s4, -1232(s11)
                  c.li         s4, -1
                  lb           s0, -302(s11)
                  sb           a3, -781(s11)
                  slti         s0, a3, 689
                  srli         s0, a3, 29
                  lbu          s0, -304(s11)
                  lbu          s4, -1366(s11)
                  sw           t0, -993(s11)
                  c.li         s4, 15
                  c.andi       a3, -1
                  lb           t6, -1047(s11)
                  and          a3, s4, s1
                  slt          a3, s4, a3
                  slt          t0, t0, t6
                  sw           s4, 383(s11)
                  lb           t0, -149(s11)
                  lbu          s0, -1448(s11) #end riscv_hazard_instr_stream_8
                  la           t1, region_0+950 #start riscv_load_store_rand_instr_stream_23
                  sra          t5, ra, s4
                  sb           t3, -105(t1)
                  lh           t6, 34(t1)
                  c.li         a4, -1
                  lb           s3, 175(t1)
                  lui          zero, 553023
                  sb           s5, -219(t1)
                  nop
                  sb           s6, 229(t1)
                  or           a1, t4, s3
                  sb           a6, 92(t1)
                  xor          t4, s10, tp
                  sb           ra, -103(t1)
                  lb           a3, -241(t1)
                  c.mv         a7, t2
                  lh           s2, -230(t1)
                  mulhsu       t3, tp, a4
                  lh           s1, 122(t1)
                  sb           s4, 153(t1)
                  c.srai       a0, 20
                  lh           s0, -164(t1)
                  srli         a0, s11, 28
                  mulhsu       s10, tp, t6
                  sw           s8, -142(t1)
                  lbu          s3, -136(t1)
                  lb           t2, 42(t1)
                  lbu          s0, 59(t1)
                  lbu          t4, 133(t1)
                  lb           s11, 70(t1)
                  xor          s7, a1, t0
                  sltiu        s2, s7, 1782
                  andi         a3, s9, 548
                  lhu          s3, -212(t1)
                  lb           a2, 235(t1)
                  mul          a7, tp, s4
                  mulh         s8, gp, t4
                  lh           t0, 52(t1)
                  c.slli       a0, 17
                  mulh         s4, t3, s11
                  lb           a7, -6(t1)
                  mulh         a4, t3, t0
                  lbu          ra, -52(t1)
                  sub          a7, a0, s11
                  sb           s5, -230(t1)
                  lw           a0, -58(t1)
                  slli         s6, s6, 17
                  sh           s5, 56(t1)
                  srli         s6, t6, 7
                  c.xor        s1, a0
                  c.andi       a3, -1
                  slli         a1, s8, 21
                  xori         a2, s11, 684
                  c.lui        s0, 5
                  lb           t0, -179(t1)
                  lb           s1, 229(t1) #end riscv_load_store_rand_instr_stream_23
                  la           sp, region_0+1187 #start riscv_load_store_rand_instr_stream_26
                  c.or         a1, a3
                  lh           s3, -1(sp)
                  slti         t1, s4, 1920
                  sh           a7, 13(sp)
                  lb           s0, 15(sp)
                  divu         gp, tp, s5
                  lbu          s3, 5(sp)
                  lb           t0, 1(sp)
                  divu         t2, s8, zero
                  div          s7, a5, s11
                  slli         a1, sp, 27
                  c.andi       a1, -1
                  sb           s9, -16(sp)
                  sltiu        s5, s3, -84
                  lw           s4, -3(sp)
                  lb           a0, 10(sp)
                  srai         t4, a0, 22
                  sltiu        s5, a7, -1003
                  c.xor        a3, a2
                  slli         a1, zero, 14
                  sub          t0, s6, a5
                  remu         a1, t0, s6
                  add          t4, a4, t2
                  remu         t0, s8, t1
                  auipc        a7, 804766
                  c.mv         s3, s4
                  xor          a0, a4, gp
                  lb           s6, -2(sp)
                  and          s0, t1, gp
                  c.lui        s10, 9
                  sb           s8, -12(sp)
                  sll          a1, a1, sp
                  lh           a0, -9(sp)
                  lb           t4, 0(sp) #end riscv_load_store_rand_instr_stream_26
                  la           ra, amo_0+12 #start riscv_lr_sc_instr_stream_15
                  lr.w.aq       t0, (ra)
                  sc.w.aq       t4, s3, (ra) #end riscv_lr_sc_instr_stream_15
                  la           t3, region_0+838 #start riscv_load_store_rand_instr_stream_8
                  sltiu        s2, a7, 355
                  sb           a6, -55(t3)
                  sw           a1, -34(t3)
                  c.mv         s10, s4
                  sb           a3, 29(t3)
                  c.and        a4, a2
                  c.or         s1, a5
                  lui          s3, 994156
                  sub          s0, s7, s2
                  sb           t4, 7(t3)
                  slti         gp, s0, -874
                  lbu          ra, 59(t3)
                  sb           t5, -23(t3)
                  lhu          a7, 18(t3)
                  sb           a0, 61(t3)
                  sll          s8, t2, s0
                  srai         zero, s6, 16
                  c.addi4spn   a2, sp, 656
                  addi         s9, t4, 1229
                  sb           tp, 59(t3)
                  lb           s3, -3(t3)
                  sra          s10, a6, s10
                  lbu          s9, 59(t3)
                  auipc        s3, 39589
                  c.xor        a3, a0
                  ori          s0, a3, -175
                  lbu          a4, -43(t3)
                  sb           s9, 63(t3) #end riscv_load_store_rand_instr_stream_8
                  la           s2, region_1+1789 #start load_store_instr_stream_0
                  la           t4, region_1+496 #start load_store_instr_stream_2
                  sb           a4, 179(s2)
                  la           t3, region_1+1506 #start load_store_instr_stream_1
                  sh           a7, 188(t4)
                  sb           s3, -246(s2)
                  la           a3, region_1+607 #start load_store_instr_stream_3
                  lh           t6, -625(s2)
                  lb           s11, -13(t3)
                  lh           s4, -186(t4)
                  lh           s3, 36(t4)
                  lw           ra, -15(a3)
                  lbu          s9, 132(s2)
                  lbu          t1, 2(a3)
                  lbu          s9, 98(t4)
                  lb           gp, -1434(s2)
                  lbu          gp, 16(a3)
                  lbu          s1, -65(t4)
                  lb           gp, 9(a3)
                  lb           a7, -1134(s2)
                  sb           t1, -7(t3)
                  lbu          a7, -17(t4)
                  sb           t4, 1(a3)
                  sw           a0, 6(t3)
                  lb           t2, -82(t4)
                  sb           tp, -15(a3)
                  sb           s0, -376(s2)
                  sb           s7, -1614(s2)
                  lh           s10, -13(a3)
                  lb           a1, 243(t4)
                  lbu          s8, -15(t3)
                  lhu          t0, -12(t3) #end load_store_instr_stream_1
                  lw           t1, -15(a3)
                  lbu          a0, 21(t4) #end load_store_instr_stream_2
                  sb           sp, 12(a3)
                  sb           t3, -4(a3) #end load_store_instr_stream_3
                  lbu          t5, -694(s2) #end load_store_instr_stream_0
                  la           a1, region_1+853 #start load_store_instr_stream_1
                  la           ra, region_0+1104 #start load_store_instr_stream_0
                  lb           a0, -60(a1)
                  lh           t3, 8(ra)
                  lbu          a0, -246(a1)
                  lbu          a0, -3(ra)
                  lb           s1, -11(ra)
                  lbu          s10, 29(ra)
                  lb           a4, -21(ra)
                  lb           s9, -19(ra)
                  sb           s2, 131(a1)
                  lbu          a2, -22(ra)
                  lb           t2, -47(ra)
                  lb           gp, 156(a1)
                  lbu          s6, -65(a1) #end load_store_instr_stream_1
                  sw           s8, -48(ra)
                  lb           a4, -12(ra) #end load_store_instr_stream_0
                  la           s3, region_0+580 #start riscv_load_store_rand_instr_stream_28
                  c.and        a4, a0
                  sh           s9, 352(s3)
                  sra          zero, sp, a0
                  sb           s1, 675(s3)
                  c.and        s0, a2
                  lb           t0, 182(s3)
                  lbu          t2, -169(s3)
                  c.add        s7, a7
                  c.srai       a4, 16
                  lh           s2, -156(s3)
                  auipc        t4, 652594
                  sw           zero, 932(s3)
                  lh           t3, 1314(s3)
                  c.mv         s10, s4
                  add          s0, a7, ra
                  lb           s2, 583(s3)
                  sra          t2, t3, zero
                  lh           a2, 1106(s3)
                  lb           t2, -238(s3)
                  lb           t2, 910(s3)
                  ori          t6, a2, 1120
                  lbu          t6, 337(s3)
                  lw           t6, -440(s3)
                  c.slli       s5, 2
                  sb           s5, 168(s3)
                  sb           a0, 1087(s3)
                  lbu          ra, 95(s3)
                  addi         sp, a0, -1009
                  slt          s7, a4, t6
                  lh           s4, 970(s3)
                  sb           s6, -539(s3)
                  c.li         a0, 6
                  slt          s7, t1, s7
                  or           s11, t4, a6
                  sra          t5, s6, t4
                  lb           t0, 439(s3) #end riscv_load_store_rand_instr_stream_28
                  la           s2, region_0+749 #start riscv_load_store_hazard_instr_stream_4
                  lb           s11, 1233(s2)
                  sh           t0, 1233(s2)
                  lhu          t6, 757(s2)
                  lw           a3, 59(s2)
                  sw           t6, 59(s2)
                  sw           s2, 59(s2)
                  lbu          sp, 29(s2)
                  sub          t2, a4, a3
                  sra          s5, s8, sp
                  lb           s7, 1049(s2)
                  lui          s6, 942216
                  srli         s11, a7, 24
                  sb           a5, -176(s2)
                  lbu          t5, 26(s2)
                  c.lui        t2, 14
                  lb           t6, 26(s2)
                  lbu          s10, 638(s2)
                  lh           a1, 885(s2)
                  lbu          s10, -218(s2) #end riscv_load_store_hazard_instr_stream_4
                  slt          s7, t4, a3
                  c.andi       a4, 1
                  bge          a6, t2, 9f
                  bge          t5, ra, 17f
                  addi         t5, t6, -1021
                  addi         a7, t3, 471
                  lui          t5, 366693
                  beq          t3, t0, 22f
                  remu         s4, a5, s9
9:                mulhsu       s6, t4, s11
                  c.mv         s7, sp
                  c.srai       s1, 31
                  bne          zero, a4, 27f
                  sltu         a7, s5, s2
                  sub          t1, s3, t0
                  c.li         t3, 21
                  c.li         s5, -1
17:               c.addi4spn   a1, sp, 960
                  sltiu        t5, s1, -151
                  bne          s9, t1, 37f
                  c.slli       a0, 5
                  bltu         a6, gp, 40f
22:               mul          t1, s8, ra
                  srli         t6, s7, 29
                  c.addi4spn   a2, sp, 80
                  bne          sp, s9, 26f
26:               srli         t4, t0, 24
27:               divu         s9, s1, a4
                  c.sub        s0, a4
                  blt          s4, zero, 41f
                  and          t2, t5, a7
                  divu         sp, t1, s5
                  sra          a3, s9, gp
                  c.lui        s2, 17
                  srl          s7, a2, zero
                  mulh         t6, gp, s7
                  bge          s2, s3, 51f
37:               c.andi       s1, -1
                  c.mv         s7, a7
                  c.slli       a1, 27
40:               slt          t1, s9, gp
41:               mulhsu       s8, zero, t4
                  bltu         zero, s4, 48f
                  c.or         a3, a0
                  c.slli       a7, 20
                  c.bnez       a1, 49f
                  mulh         s9, s1, s5
                  c.beqz       a4, 55f
48:               remu         t4, s6, t1
49:               c.sub        a0, a1
                  beq          t1, a5, 51f
51:               srai         s5, s2, 2
                  add          s2, ra, a0
                  c.bnez       a1, 71f
                  c.xor        a1, a2
55:               c.and        a3, a4
                  xor          a4, s8, t0
                  sltu         s11, s2, t1
                  c.mv         t3, a2
                  ori          s7, t6, -1076
                  and          a7, t1, s10
                  c.addi16sp   sp, -16
                  c.lui        s6, 3
                  c.add        a0, t2
                  c.addi       t0, 20
                  c.xor        a2, a3
                  bgeu         ra, s4, 85f
                  c.bnez       s0, 84f
                  auipc        s11, 28932
                  c.addi16sp   sp, -16
                  nop
71:               beq          t6, t5, 80f
                  c.sub        a3, a5
                  c.bnez       a0, 82f
                  bge          s10, gp, 82f
                  sltiu        s1, t6, -488
                  c.xor        a3, s1
                  mulh         a1, a2, s7
                  c.addi16sp   sp, 144
                  c.srai       a3, 7
80:               c.add        sp, t6
                  or           a0, t3, s6
82:               divu         t5, ra, s3
                  c.add        s3, a2
84:               c.slli       s10, 26
85:               c.add        a4, ra
                  or           s11, ra, s9
                  remu         t3, a1, s2
                  c.mv         s4, sp
                  div          sp, sp, s3
                  srl          a3, a5, zero
                  c.addi16sp   sp, 128
                  sll          a3, s1, s1
                  bne          t6, a6, 94f
94:               c.nop
                  lui          s3, 326053
                  slli         t5, zero, 17
                  xori         t0, t0, -1769
                  auipc        s11, 888274
                  ori          s4, s9, -94
                  c.addi16sp   sp, 192
                  bltu         t5, ra, 109f
                  slti         t6, gp, 1966
                  remu         t4, s9, s3
                  bne          t4, t5, 116f
                  c.or         a2, a5
                  c.xor        a0, a3
                  srli         s11, a5, 7
                  sra          a4, a7, a2
109:              c.or         s0, a5
                  bge          a7, sp, 119f
                  c.addi16sp   sp, -16
                  slti         a7, a4, -1294
                  c.nop
                  xori         s4, a5, -376
                  divu         t5, t3, gp
116:              rem          s4, a3, t2
                  c.mv         s2, s10
                  c.li         t0, -1
119:              c.andi       s0, 5
                  or           t6, s3, t6
                  srli         s1, t0, 15
                  c.andi       s0, 13
                  c.slli       s8, 10
                  nop
                  sltiu        t4, a4, 450
                  c.andi       s1, -1
                  slti         s0, s3, -1462
                  c.srai       a4, 13
                  c.srli       s0, 18
                  c.addi       t4, -1
                  lui          s0, 732856
                  slti         a2, zero, -1985
                  blt          t6, s5, 137f
                  lui          s10, 798211
                  c.add        a3, s7
                  c.mv         a1, t6
137:              andi         a7, s8, -319
                  sub          a1, a0, a7
                  remu         ra, s0, s3
                  mulhsu       a0, a2, s9
                  rem          s4, a0, a5
                  c.addi16sp   sp, -16
                  divu         s9, t4, a0
                  c.addi4spn   a2, sp, 960
                  sll          s3, t4, t0
                  slti         a0, s1, 1609
                  nop
                  sra          a2, t0, s8
                  ori          s3, s5, 1554
                  slt          t6, t3, a0
                  div          t1, s1, a6
                  mulh         gp, a2, a0
                  sltiu        t3, t4, -721
                  c.mv         sp, s3
                  sll          t6, s9, a2
                  mulhu        s2, a7, s8
                  mulhu        s9, t0, t0
                  c.addi16sp   sp, -16
                  divu         t1, t0, sp
                  mulhu        t4, t1, s2
                  sltiu        s0, gp, -1290
                  sra          t1, s8, t4
                  c.nop
                  sra          gp, s5, zero
                  bltu         a5, s3, 183f
                  srli         a2, s3, 11
                  srai         t4, s10, 7
                  lui          s11, 247823
                  ori          s2, sp, 1513
                  c.addi       t2, -1
                  srai         s9, s6, 12
                  c.xor        s0, s0
                  xori         a7, a4, -1806
                  slt          s7, a2, a5
                  divu         t6, ra, a5
                  addi         s7, s1, 1250
                  slli         s8, a5, 31
                  c.addi16sp   sp, -16
                  srai         s7, a2, 14
                  sltu         a7, t3, zero
                  srl          t0, gp, s9
                  c.nop
183:              c.addi16sp   sp, 144
                  bge          a1, s3, 202f
                  c.slli       a1, 3
                  addi         s9, s10, 484
                  lui          t1, 278790
                  slli         s9, a0, 26
                  mulhsu       s9, s6, a2
                  addi         zero, tp, 1199
                  bgeu         a6, zero, 196f
                  mulh         t3, t6, t2
                  c.beqz       a4, 207f
                  c.li         t5, -1
                  sra          s10, a1, t1
196:              mul          zero, s2, a6
                  and          s10, t4, a2
                  remu         a4, t2, t1
                  sltu         t6, t6, t1
                  rem          t6, s8, s7
                  sra          gp, t1, t6
202:              mul          a1, s0, a5
                  c.srai       a3, 20
                  slti         t3, ra, -567
                  sltiu        s3, a3, -1275
                  rem          s6, t2, s11
207:              mul          s9, s1, a7
                  mulhsu       sp, t4, t5
                  auipc        s11, 372778
                  c.add        s3, a1
                  bltu         a3, t1, 225f
                  c.bnez       a0, 228f
                  c.addi       t4, 19
                  mulh         a0, t6, a5
                  c.addi4spn   s0, sp, 880
                  sltu         s9, t4, t2
                  remu         s6, a6, ra
                  c.sub        s1, a4
                  lui          s10, 763901
                  remu         gp, a3, a7
                  c.addi4spn   a2, sp, 688
                  c.addi       s8, 16
                  c.addi16sp   sp, -16
                  slti         t2, a7, -1584
225:              bgeu         a4, s8, 226f
226:              mulhsu       ra, zero, s6
                  or           t1, t6, s9
228:              slli         t5, zero, 27
                  add          a3, a0, t3
                  and          a4, s2, s9
                  slt          a4, t6, s11
                  rem          s4, zero, t1
                  c.slli       t6, 22
                  bge          ra, a2, 248f
                  and          t2, ra, a4
                  ori          s10, s0, -1957
                  divu         a3, s5, a4
                  slt          s9, s2, s4
                  c.lui        ra, 28
                  addi         a2, s10, -511
                  c.mv         s2, a1
                  c.xor        a2, a1
                  c.srai       s0, 12
                  sra          s6, zero, a6
                  mulh         t1, a3, zero
                  divu         t6, s0, s2
                  c.bnez       a2, 266f
248:              or           s5, s6, t0
                  sltu         s11, s2, s0
                  c.and        a1, s0
                  lui          ra, 361086
                  c.or         a2, a4
                  c.andi       a3, -1
                  xor          s3, s4, a2
                  andi         s8, a5, 1828
                  mulhu        ra, a6, t5
                  c.sub        s0, s1
                  sll          t6, s8, t4
                  c.srli       a1, 19
                  and          s10, t0, s11
                  or           s10, s3, a3
                  c.nop
                  mulh         s9, t0, zero
                  sltu         ra, t6, t3
                  and          a2, s3, a3
266:              ori          sp, s3, 100
                  xori         a2, a3, 1013
                  srli         s8, t0, 2
                  c.lui        ra, 4
                  c.slli       a7, 16
                  c.srli       a3, 20
                  c.add        t5, s7
                  c.lui        s1, 11
                  or           zero, s0, s4
                  c.andi       s1, -1
                  c.sub        a4, s1
                  srl          sp, a4, t4
                  blt          s0, a4, 283f
                  bne          s2, s11, 298f
                  bge          t0, s10, 288f
                  sltu         s2, t3, s11
                  c.lui        a1, 10
283:              sltu         a1, t1, t5
                  c.add        a1, s6
                  bltu         s7, a4, 286f
286:              slti         t3, s3, 972
                  nop
288:              lui          s4, 576353
                  xori         t6, a3, -1807
                  bgeu         a5, t2, 302f
                  add          s5, t4, s2
                  bgeu         a3, s1, 310f
                  mul          a4, s0, a3
                  and          s3, zero, zero
                  slli         t4, gp, 29
                  andi         s9, s9, 469
                  blt          t4, a4, 304f
298:              remu         s1, a4, s3
                  c.nop
                  mulh         s10, gp, s7
                  mulhsu       s4, t5, t1
302:              mul          s11, tp, s1
                  srai         s7, s8, 20
304:              beq          s3, a4, 322f
                  bgeu         sp, t6, 320f
                  addi         gp, zero, -805
                  c.sub        a4, a2
                  sll          s10, s3, a4
                  addi         zero, a7, 1932
310:              bgeu         s11, s2, 314f
                  beq          tp, tp, 323f
                  bge          a4, a4, 316f
                  bgeu         a2, a2, 314f
314:              c.li         s0, 16
                  c.add        gp, s7
316:              sltiu        s5, a6, 1059
                  sltiu        sp, a0, -494
                  mulhsu       s3, a7, gp
                  nop
320:              and          a2, a0, t2
                  c.beqz       a3, 336f
322:              slti         a1, s8, 639
323:              mulhu        t1, t0, s1
                  c.slli       s5, 6
                  remu         a1, t0, a4
                  c.srli       a0, 15
                  slt          a0, t5, tp
                  slli         s10, a1, 7
                  srai         s9, a6, 27
                  c.addi       t6, -1
                  rem          s6, s10, zero
                  bge          s7, zero, 347f
                  add          s1, t4, t1
                  bne          t6, t6, 348f
                  c.mv         t1, s11
336:              or           s8, a4, tp
                  c.srai       a4, 28
                  srai         s10, a1, 29
                  xori         t4, ra, 1094
                  xor          s10, t2, s11
                  c.li         t5, -1
                  slti         a0, s7, 763
                  rem          s7, s5, s1
                  c.add        s3, a4
                  divu         t4, a5, t3
                  andi         t6, a3, 294
347:              c.andi       a3, 10
348:              c.andi       a0, 25
                  bne          s5, s3, 363f
                  beq          s5, s11, 359f
                  divu         a3, s4, t4
                  xor          t2, s11, s11
                  blt          s1, t1, 371f
                  c.li         a3, 17
                  blt          ra, gp, 372f
                  or           s5, s7, s7
                  c.li         s7, -1
                  blt          s7, t0, 367f
359:              nop
                  c.slli       s8, 25
                  srai         t6, t1, 31
                  beq          a3, s1, 380f
363:              xor          gp, s6, a5
                  c.srai       a0, 2
                  c.andi       a1, 2
                  bge          s1, s7, 382f
367:              sltu         a0, t4, s1
                  c.and        a2, a5
                  c.addi16sp   sp, 176
                  mul          s5, a5, a3
371:              andi         s0, s3, -548
372:              c.mv         t1, t3
                  sltiu        s7, tp, -409
                  bne          t2, t0, 382f
                  mul          t0, sp, t6
                  c.srai       a4, 21
                  c.srli       a0, 10
                  srai         t1, s0, 2
                  bne          a2, a3, 385f
380:              mulh         t0, t0, s4
                  xor          a7, s0, a2
382:              and          s0, t5, t5
                  srl          sp, a4, s2
                  c.nop
385:              and          s9, t2, s4
                  divu         s4, t4, a6
                  c.mv         t3, a4
                  slli         t5, s5, 7
                  bne          s8, a6, 397f
                  srai         a0, a4, 14
                  sll          s5, a1, a4
                  sll          s3, t5, t5
                  div          s1, s4, s7
                  or           s9, a3, s4
                  c.nop
                  c.srli       a0, 10
397:              c.xor        a1, a0
                  c.li         sp, -1
                  blt          s7, s6, 408f
                  rem          a4, s5, s3
                  c.andi       s0, -1
                  mulhu        ra, a7, s10
                  sra          a1, sp, t6
                  div          a0, s1, a5
                  remu         zero, t6, s6
                  c.srai       a2, 13
                  c.sub        a0, a1
408:              div          t3, gp, t5
                  c.mv         s2, a0
                  c.li         a4, -1
                  srai         t6, a0, 30
                  div          t3, a6, s6
                  c.addi       t3, 13
                  sltu         gp, t2, s7
                  slt          gp, a6, a2
                  slt          t2, s3, a6
                  c.srai       s0, 19
                  slt          s7, t4, s0
                  c.sub        a1, a3
                  c.beqz       a4, 437f
                  sra          s1, sp, t2
                  sltiu        t1, gp, 108
                  bne          s8, a5, 438f
                  andi         gp, s7, -1839
                  xor          a3, s4, tp
                  bgeu         s1, tp, 430f
                  c.andi       a4, 9
                  c.add        s2, s9
                  xori         s8, s4, 991
430:              andi         a2, a2, -819
                  c.xor        a0, a5
                  ori          t3, sp, 2022
                  slt          t4, t5, s5
                  xori         zero, a5, -1365
                  auipc        t5, 81321
                  c.srai       a3, 27
437:              c.slli       a3, 9
438:              mulhu        s11, s3, s9
                  c.bnez       a0, 454f
                  c.beqz       s0, 458f
                  c.or         s1, a4
                  c.addi16sp   sp, 320
                  remu         s0, a2, s6
                  rem          a3, t3, a2
                  sll          ra, a4, a1
                  c.addi16sp   sp, -16
                  c.or         s0, a2
                  c.or         a1, a5
                  addi         s5, t4, 714
                  sra          t4, a1, t6
                  c.addi4spn   s1, sp, 976
                  mulhu        s4, a3, s2
                  c.li         gp, -1
454:              c.bnez       a0, 462f
                  xor          s1, a1, s0
                  bgeu         s5, t3, 468f
                  xori         a3, ra, -984
458:              srai         a0, a3, 31
                  addi         zero, s10, 26
                  ori          zero, s7, 1511
                  mulhu        s8, a3, a3
462:              beq          s4, tp, 467f
                  c.sub        s1, a0
                  bne          s6, tp, 470f
                  div          s6, s8, t4
                  bge          t2, tp, 485f
467:              div          a4, ra, sp
468:              bgeu         t3, gp, 469f
469:              srli         ra, a4, 16
470:              c.sub        s1, a0
                  beq          s2, s10, 475f
                  rem          t6, s3, t2
                  blt          s10, a6, 482f
                  c.and        a3, a5
475:              mulh         a3, a6, s11
                  c.sub        s1, a1
                  xori         s3, t5, -1734
                  sltu         a4, s2, t4
                  bgeu         zero, gp, 480f
480:              c.slli       s2, 3
                  c.andi       a1, -1
482:              sltu         t3, s11, s11
                  c.mv         gp, t3
                  or           a3, s2, s2
485:              bgeu         t5, s3, 499f
                  c.bnez       a3, 505f
                  srli         s11, s10, 19
                  c.addi16sp   sp, 128
                  c.bnez       s0, 503f
                  andi         zero, s6, -877
                  mul          gp, a0, a2
                  srai         a4, a1, 27
                  bne          t3, s7, 509f
                  c.li         s9, 30
                  xori         t1, a7, -1514
                  and          s0, t3, s5
                  remu         a3, s1, t4
                  andi         s0, t5, 1325
499:              sltiu        ra, t0, -564
                  c.or         s1, s1
                  c.beqz       a0, 519f
                  bgeu         s2, s9, 520f
503:              rem          t4, zero, t1
                  sll          s6, t6, s8
505:              sub          ra, a0, ra
                  bgeu         tp, s2, 507f
507:              divu         a3, s2, s3
                  c.slli       s2, 4
509:              c.beqz       a4, 518f
                  c.andi       a4, -1
                  beq          s10, a0, 526f
                  bltu         s8, t5, 520f
                  addi         a3, s4, 1353
                  bgeu         tp, s1, 523f
                  beq          s6, zero, 522f
                  lui          s1, 602121
                  c.li         sp, 1
518:              ori          s11, a7, 1141
519:              xori         t6, a2, -663
520:              xor          t4, a5, a1
                  mulh         t2, s6, a2
522:              beq          s1, s1, 534f
523:              c.xor        a3, a1
                  c.beqz       a2, 532f
                  andi         ra, a7, 394
526:              nop
                  c.mv         gp, t4
                  c.sub        a1, a5
                  c.add        s11, t3
                  xori         a7, a1, 981
                  mulhsu       t3, s6, s7
532:              c.lui        s3, 27
                  xor          gp, tp, a4
534:              bge          ra, s9, 552f
                  remu         s2, s3, s4
                  c.andi       a1, 12
                  c.add        s9, t5
                  div          sp, a0, s9
                  ori          a3, a3, -668
                  c.andi       s1, 24
                  c.add        t6, a2
                  bltu         a5, zero, 556f
                  andi         s3, s3, -158
                  mulhsu       a4, s10, a7
                  c.slli       t0, 22
                  mulhsu       t6, tp, a6
                  ori          s9, t6, 1018
                  c.bnez       a0, 549f
549:              c.andi       a1, 15
                  ori          a2, s4, -1017
                  c.srli       a4, 15
552:              bne          t3, a4, 570f
                  blt          a4, a5, 557f
                  bne          s2, a0, 573f
                  c.li         t6, 18
556:              sll          s8, s11, s7
557:              sltiu        t2, a4, 741
                  c.addi16sp   sp, -16
                  beq          s8, s3, 568f
                  c.slli       s4, 9
                  remu         a4, s4, a3
                  divu         s7, tp, ra
                  srli         gp, s1, 11
                  sra          s10, sp, s2
                  c.addi       s11, -1
                  c.li         ra, -1
                  c.xor        a1, a0
568:              c.and        s0, a3
                  bltu         tp, s1, 583f
570:              and          a1, a2, t1
                  c.beqz       a0, 589f
                  c.or         a4, a5
573:              srai         a3, s6, 23
                  c.add        a4, s11
                  addi         t5, s3, -827
                  xori         s0, a2, -898
                  c.li         s0, 23
                  c.nop
                  or           a0, sp, sp
                  bge          t5, t0, 588f
                  bne          t6, a7, 598f
                  c.sub        a1, a2
583:              add          t6, t6, a2
                  slt          t1, s10, t2
                  xori         zero, s5, 738
                  mul          s0, s0, a6
                  srai         s1, s2, 16
588:              remu         t0, zero, a3
589:              div          s5, ra, s6
                  mulh         gp, s11, a2
                  ori          s9, s9, 1430
                  c.addi16sp   sp, 304
                  slt          ra, s9, zero
                  sub          sp, s10, a7
                  mul          ra, tp, s6
                  bgeu         ra, t0, 615f
                  mulhsu       s10, gp, s2
598:              divu         t2, tp, t1
                  srai         a7, s6, 1
                  lui          a7, 615837
                  sltu         a2, s7, t6
                  auipc        s7, 305515
                  c.srai       a3, 3
                  sltu         sp, s4, t1
                  sub          a7, a3, s6
                  bge          s1, t6, 621f
                  mulhsu       zero, a0, t5
                  ori          gp, t3, -98
                  auipc        s2, 732374
                  c.addi       s7, -1
                  c.nop
                  nop
                  add          a7, ra, a7
                  c.lui        t1, 14
615:              sltu         s1, s6, s3
                  c.addi       s7, 27
                  c.nop
                  c.slli       t2, 26
                  bne          zero, t2, 627f
                  beq          s4, t0, 626f
621:              c.mv         t0, t3
                  bne          s2, s6, 627f
                  xori         t3, t0, -576
                  sltiu        s10, t1, -1631
                  c.beqz       a2, 629f
626:              mulhu        s7, a7, s8
627:              beq          s11, t0, 635f
                  c.bnez       a0, 642f
629:              c.addi4spn   a0, sp, 560
                  bltu         s4, s2, 646f
                  sltu         s0, s3, a4
                  c.or         a3, a1
                  srai         a7, ra, 8
                  mulhsu       a2, s2, s3
635:              srl          a7, s7, s1
                  c.lui        a4, 25
                  xor          a4, s1, t6
                  bltu         s0, a5, 647f
                  andi         s11, tp, 623
                  remu         a0, s11, sp
                  remu         t2, s10, a6
642:              mulhsu       t0, s2, s1
                  mulhsu       s7, t6, t1
                  c.bnez       a0, 651f
                  andi         s6, t5, -1644
646:              srai         t5, t5, 20
647:              xori         gp, gp, -105
                  c.slli       t5, 29
                  auipc        t3, 322338
                  mulhu        a0, s3, s0
651:              c.lui        s6, 26
                  blt          s1, t2, 667f
                  c.andi       a3, -1
                  addi         s2, a4, 1751
                  mul          t3, t0, a2
                  slt          t0, a3, s4
                  sll          a1, s2, a2
                  mul          t0, t2, t5
                  c.slli       ra, 16
                  mulh         t6, t6, t6
                  add          zero, s0, a4
                  mul          s11, s7, a4
                  remu         zero, t3, a3
                  c.slli       t2, 20
                  mulh         t0, s6, s8
                  sll          a7, tp, s2
667:              rem          s3, tp, zero
                  addi         ra, s4, 859
                  xori         a0, s9, -1179
                  mulhu        s4, s8, a3
                  add          a7, t0, gp
                  remu         t3, s9, t2
                  c.sub        a0, a5
                  slli         s10, t4, 31
                  bge          a1, t6, 684f
                  c.srai       a3, 20
                  add          a2, s11, gp
                  addi         zero, s6, 821
                  srli         ra, a5, 7
                  srli         s6, ra, 10
                  sll          t1, ra, a6
                  srai         zero, a4, 27
                  andi         s1, s9, 124
684:              sltu         s0, sp, t4
                  c.add        s3, s2
                  bltu         a3, a3, 700f
                  c.xor        a2, s0
                  c.addi4spn   s1, sp, 528
                  c.xor        a1, a3
                  bne          s7, s9, 691f
691:              c.mv         a0, t0
                  beq          tp, s6, 704f
                  slti         s4, gp, -1153
                  mulhsu       s9, s7, a4
                  mul          t0, s4, a5
                  sra          t5, s3, zero
                  ori          sp, s0, 1660
                  c.lui        a4, 27
                  c.add        s10, t0
700:              rem          t6, s2, sp
                  slli         a3, a7, 16
                  bltu         t6, sp, 703f
703:              bge          s2, s0, 715f
704:              sltiu        a4, t1, 1040
                  srl          s10, t5, a6
                  c.lui        s5, 3
                  slli         zero, t1, 13
                  xori         t2, s3, -894
                  c.srli       a0, 3
                  div          s8, s11, s6
                  mulh         s0, t4, tp
                  c.sub        a3, a0
                  c.addi       a1, 14
                  bltu         s11, a5, 732f
715:              and          s11, t5, s7
                  mulhu        t2, a4, a0
                  sll          s10, s2, a7
                  slli         a2, ra, 12
                  c.lui        a7, 6
                  c.sub        a2, s0
                  c.bnez       a0, 739f
                  c.srli       a3, 17
                  mulh         t0, s10, zero
                  c.or         a1, a3
                  c.nop
                  bne          t6, a0, 741f
                  c.bnez       s1, 741f
                  srai         s7, s8, 31
                  remu         s0, s9, a5
                  nop
                  ori          a2, s6, 1184
732:              c.or         a0, a2
                  mulh         ra, s4, t0
                  nop
                  sltu         gp, s6, s1
                  addi         ra, a5, -1598
                  bge          zero, t6, 742f
                  c.nop
739:              bltu         a7, a5, 746f
                  sltu         a2, s11, sp
741:              sra          ra, t0, gp
742:              sltu         s4, a3, a0
                  divu         zero, a3, t5
                  lui          s4, 555046
                  c.nop
746:              remu         a7, s8, s8
                  lui          s11, 57166
                  add          s2, a0, gp
                  or           a2, s8, a6
                  srli         a7, t5, 0
                  srli         a1, s0, 22
                  c.addi4spn   s1, sp, 352
                  auipc        t1, 250955
                  c.and        a2, a1
                  mulhsu       a0, s1, t5
                  mulhsu       s1, a6, s5
                  rem          s4, ra, t3
                  sub          t3, t4, s4
                  sltu         s9, s7, t4
                  or           a1, sp, a1
                  div          s4, a3, a4
                  bne          a4, a2, 771f
                  c.lui        ra, 3
                  rem          a3, s10, s4
                  and          s1, a6, t0
                  slti         zero, t0, -1623
                  srai         a4, a1, 10
                  c.addi16sp   sp, 304
                  addi         s10, s9, 1011
                  c.or         a4, a2
771:              add          s2, t4, a7
                  c.slli       t2, 14
                  srli         s6, a2, 14
                  c.srai       a3, 7
                  c.addi       s0, 10
                  slti         s8, s10, 743
                  c.nop
                  rem          a4, a6, s8
                  srai         t3, sp, 5
                  srli         ra, s0, 24
                  div          ra, gp, s9
                  c.mv         s8, t1
                  srli         s8, gp, 5
                  srl          s7, a5, ra
                  la           t2, amo_0+12 #start riscv_amo_instr_stream_5
                  amominu.w.aq  s10, t0, (t2)
                  or           gp, s7, t3
                  amomin.w.aq   a2, s8, (t2)
                  amoand.w.rl   s9, s10, (t2)
                  sltiu        s5, a6, -1930
                  div          s10, a1, ra
                  amoor.w.rl    t4, s4, (t2)
                  c.sub        s1, a0
                  amoadd.w      zero, t5, (t2)
                  sltu         s7, t1, s4
                  amomax.w.aq   s10, a0, (t2)
                  c.lui        a0, 9
                  amoxor.w.rl   s10, s0, (t2)
                  srl          a3, s6, gp
                  amoadd.w.aq   s10, a4, (t2) #end riscv_amo_instr_stream_5
                  rem          t1, t1, s0
                  c.xor        s0, a1
                  blt          a2, t4, 802f
                  mulhsu       t1, s0, gp
                  sra          ra, a6, s5
                  c.srai       s1, 11
                  beq          t2, a6, 795f
                  xor          gp, s10, s4
                  slti         s3, a6, -1409
                  slli         s6, s11, 8
795:              slli         s6, zero, 23
                  c.addi       s6, 20
                  addi         a7, s1, -1371
                  add          gp, a2, a7
                  sub          a7, a4, t3
                  c.beqz       s0, 809f
                  rem          t5, s9, s6
802:              auipc        t3, 248660
                  rem          s2, t2, a4
                  c.nop
                  and          a7, t3, s10
                  c.addi4spn   a0, sp, 592
                  xori         s2, a7, 1383
                  or           s2, t4, a4
809:              sltu         a3, s11, s11
                  div          ra, a2, sp
                  c.sub        a0, a3
                  slt          s4, a2, gp
                  andi         gp, zero, 604
                  c.bnez       a2, 822f
                  c.andi       a1, -1
                  sub          a2, s0, t6
                  div          s1, t3, a4
                  rem          s8, a6, s5
                  sub          s1, a2, sp
                  c.lui        t0, 25
                  c.srai       a3, 30
822:              c.mv         s1, t5
                  sltu         t0, a7, t2
                  div          s8, a1, t2
                  srli         zero, t6, 17
                  c.and        a2, a5
                  rem          s1, a1, s1
                  c.or         a1, a4
                  c.sub        s1, a1
                  mulhsu       t0, a5, s0
                  sub          t4, s2, tp
                  c.and        s0, a1
                  beq          a6, a4, 851f
                  c.li         sp, 10
                  c.sub        s1, s0
                  c.bnez       a4, 853f
                  c.nop
                  c.add        s6, s1
                  c.addi4spn   a2, sp, 928
                  mulh         a0, s3, s10
                  sltiu        s10, s3, -862
                  and          t1, a7, s5
                  c.li         s2, -1
                  c.li         a2, -1
                  c.addi4spn   s1, sp, 864
                  c.sub        a3, s1
                  andi         t4, s4, 842
                  c.beqz       a0, 862f
                  c.sub        a1, s0
                  addi         t3, s5, -2007
851:              c.andi       a3, 18
                  bne          t2, ra, 868f
853:              slt          s2, zero, t3
                  c.li         s2, 20
                  mulh         s3, s2, zero
                  c.mv         gp, ra
                  add          s6, a2, sp
                  c.bnez       a2, 867f
                  ori          s10, zero, 1343
                  c.mv         t0, a0
                  bgeu         a6, ra, 862f
862:              slli         ra, s2, 12
                  rem          s3, tp, a1
                  xori         s5, t6, -758
                  divu         t4, s7, t1
                  ori          s6, s0, 1949
867:              c.bnez       a3, 886f
868:              or           ra, t4, t2
                  c.nop
                  sra          sp, t1, s5
                  srl          s1, t0, s6
                  srli         t4, s6, 1
                  divu         t2, t2, s11
                  mulhu        s7, s6, t2
                  bne          a7, sp, 881f
                  bltu         a0, ra, 877f
877:              c.srli       a1, 13
                  divu         s4, s7, s8
                  c.beqz       a3, 891f
                  or           s3, t4, a0
881:              add          s7, a3, a4
                  rem          s9, s7, s9
                  srai         t2, t5, 20
                  slt          zero, s0, zero
                  c.add        t4, a6
886:              c.nop
                  srli         t5, t6, 22
                  c.srai       a2, 6
                  c.srai       a3, 6
                  c.addi       s5, 2
891:              c.srli       a0, 5
                  c.addi4spn   s1, sp, 336
                  slt          ra, zero, s4
                  c.andi       s1, -1
                  div          s0, tp, a2
                  c.li         gp, 5
                  c.or         a2, s0
                  srli         t6, gp, 14
                  bgeu         a6, s3, 907f
                  srl          t4, sp, t4
                  mulhsu       a2, ra, a1
                  c.andi       a1, 26
                  c.beqz       a2, 918f
                  bne          s0, a4, 922f
                  slt          t0, s11, s1
                  c.addi16sp   sp, 48
907:              srl          t6, t0, s3
                  ori          t4, a0, 928
                  c.and        a2, s0
                  c.addi16sp   sp, -16
                  c.li         t0, -1
                  c.and        a3, s0
                  c.srli       a4, 12
                  c.or         a2, a4
                  ori          s4, s4, 1972
                  remu         s9, a2, s7
                  c.xor        a2, a5
918:              andi         ra, s8, -1165
                  c.mv         s2, sp
                  lui          a0, 35958
                  c.addi       s7, -1
922:              c.slli       a0, 22
                  sub          s1, s9, a7
                  mul          t2, s10, a0
                  bltu         t0, s0, 943f
                  bne          gp, s3, 938f
                  bltu         s10, s7, 935f
                  c.srai       a3, 13
                  sra          s8, zero, t2
                  c.andi       a0, -1
                  c.addi       s3, 18
                  xori         t5, a0, -1623
                  c.and        s0, a1
                  c.slli       a4, 5
935:              sltiu        sp, t5, 1952
                  c.or         s1, a0
                  add          ra, s8, s0
938:              srai         t5, s1, 6
                  sub          s8, t2, t2
                  c.addi       s5, -1
                  c.lui        s2, 30
                  andi         s10, t2, 700
943:              c.lui        t6, 28
                  sub          a7, ra, s6
                  srai         a1, s0, 4
                  c.li         s8, -1
                  srai         s5, zero, 11
                  slt          a4, s9, ra
                  c.bnez       s0, 968f
                  addi         a3, t1, -788
                  addi         s9, a1, -221
                  slti         t6, s10, -531
                  mulh         ra, s1, t4
                  c.srli       a4, 23
                  auipc        s1, 22497
                  c.addi16sp   sp, -16
                  c.andi       a3, -1
                  mulhsu       s8, ra, s5
                  xori         s0, a3, -1455
                  remu         s6, a7, s8
                  slt          a4, ra, zero
                  c.beqz       a0, 963f
963:              beq          s0, s3, 977f
                  c.add        s2, s2
                  add          t6, a5, t2
                  c.lui        a7, 5
                  sub          gp, gp, a3
968:              c.andi       a4, -1
                  mulhsu       a0, gp, s10
                  bltu         a4, t1, 985f
                  sltu         a1, a5, s1
                  c.mv         s10, t3
                  bgeu         ra, s3, 977f
                  slti         s11, s8, 1631
                  c.sub        s0, a5
                  sra          s1, sp, a5
977:              c.srli       a2, 9
                  divu         t0, t3, sp
                  mul          s10, zero, t2
                  c.addi16sp   sp, 304
                  beq          a6, s3, 999f
                  beq          t5, gp, 1000f
                  sltu         t2, a3, t6
                  and          t4, s5, s7
985:              xor          s0, s8, t1
                  bgeu         s7, s0, 1000f
                  srli         t0, a2, 9
                  c.slli       a2, 31
                  mul          t6, s0, a5
                  c.addi       t1, 29
                  sra          s6, a2, s2
                  xor          t2, s5, t0
                  c.nop
                  nop
                  nop
                  c.slli       t3, 7
                  mulh         a0, a2, s2
                  auipc        a4, 206407
999:              c.lui        ra, 10
1000:             ori          a3, t1, 1735
                  srli         s10, gp, 13
                  xori         t0, s7, 706
                  sltiu        a3, t1, -1897
                  ori          a4, t5, -1474
                  add          s7, s11, s0
                  c.add        s10, t4
                  bne          t3, a1, 1019f
                  srli         s4, s8, 20
                  bne          s10, s5, 1023f
                  sltiu        s10, sp, 473
                  c.li         a2, 8
                  mulhsu       s7, s3, a0
                  ori          s5, s9, -71
                  xor          s8, s5, t6
                  srl          a7, s9, t4
                  c.andi       a2, 5
                  divu         s3, t2, t3
                  c.or         a4, s0
1019:             c.beqz       a2, 1028f
                  xor          s3, s6, zero
                  mulhsu       s10, a6, t5
                  beq          t3, a7, 1037f
1023:             c.addi4spn   a3, sp, 624
                  mulhsu       s4, t3, s1
                  andi         ra, s0, 1264
                  slli         s0, t5, 0
                  la           s4, amo_0+28 #start riscv_amo_instr_stream_11
                  la           a7, amo_0+52
                  amominu.w     s8, zero, (a7)
                  or           s10, s11, tp
                  c.srai       s1, 5
                  amoor.w       sp, a4, (s4)
                  c.slli       s10, 18
                  amomax.w.aq   s6, gp, (s4)
                  c.addi16sp   sp, 112
                  c.mv         s9, s8
                  ori          s1, s5, -133
                  amoand.w      t2, zero, (a7)
                  nop
                  amoadd.w.rl   gp, t0, (s4)
                  amoor.w.rl    s10, s2, (a7)
                  amoswap.w.rl  ra, t5, (a7)
                  c.mv         t4, a0
                  amomin.w.rl   s10, s8, (a7) #end riscv_amo_instr_stream_11
                  c.addi16sp   sp, -16
1028:             c.addi4spn   a1, sp, 816
                  c.mv         a0, gp
                  bltu         s11, t3, 1031f
1031:             sub          a0, zero, s9
                  bltu         ra, s10, 1033f
1033:             ori          s3, s3, 1013
                  ori          a7, a7, -745
                  rem          zero, s4, t2
                  c.addi       ra, 2
1037:             c.li         s0, 7
                  c.addi16sp   sp, -16
                  sll          s3, a3, t1
                  srl          s10, s9, t6
                  c.srli       a0, 27
                  slli         gp, ra, 16
                  bge          sp, s8, 1060f
                  addi         s2, zero, 357
                  c.addi       s5, -1
                  auipc        t1, 1010283
                  andi         s0, s11, 1255
                  c.lui        a2, 17
                  bge          gp, t5, 1068f
                  bge          a5, s6, 1066f
                  addi         t5, s10, 1350
                  or           a0, a6, s5
                  bltu         a5, s6, 1067f
                  sltu         s0, s4, t5
                  c.addi4spn   a1, sp, 16
                  add          s6, s2, zero
                  c.slli       t4, 29
                  rem          a4, t5, s6
                  or           s6, s2, s9
1060:             blt          t4, t3, 1069f
                  c.add        s7, t0
                  and          zero, a7, s7
                  auipc        t6, 917973
                  sub          t5, s3, zero
                  c.addi       a1, 8
1066:             c.add        a1, s3
1067:             mul          t6, a5, s4
1068:             bltu         s3, sp, 1075f
1069:             c.addi16sp   sp, -16
                  c.li         t5, -1
                  auipc        a7, 318200
                  c.mv         ra, a7
                  remu         gp, s7, zero
                  c.xor        a0, s1
1075:             c.andi       a2, 10
                  xor          s9, s3, s4
                  bne          zero, a3, 1085f
                  c.or         a3, s1
                  slt          s8, t2, a3
                  bgeu         s10, sp, 1089f
                  mulhu        a4, a2, a2
                  bltu         zero, t3, 1100f
                  c.addi16sp   sp, 64
                  c.andi       a2, 23
1085:             sll          a1, t1, t4
                  srl          t1, t3, t6
                  addi         ra, gp, 154
                  auipc        t6, 983257
1089:             add          s3, s0, t5
                  slli         a7, a2, 11
                  divu         t1, tp, a4
                  c.addi       s10, -1
                  xori         a0, t6, 662
                  bltu         s4, sp, 1113f
                  srai         s6, t6, 13
                  xor          s2, zero, s10
                  xor          s7, t6, t4
                  c.nop
                  c.add        t5, s4
1100:             c.andi       a3, 31
                  and          s2, s0, a2
                  c.slli       t2, 18
                  sra          a2, t3, s5
                  blt          a7, s8, 1105f
1105:             srli         t0, t3, 7
                  slt          a1, s8, s3
                  nop
                  srli         s4, s2, 19
                  remu         s5, t3, a4
                  c.slli       t0, 21
                  bltu         tp, t5, 1115f
                  c.andi       a2, -1
1113:             c.and        a0, a1
                  c.sub        a1, s1
1115:             bne          s11, t5, 1121f
                  sll          t2, a1, t2
                  andi         a3, t4, 936
                  rem          s6, tp, s5
                  c.add        s10, s0
                  sltu         a3, a4, tp
1121:             c.bnez       a4, 1129f
                  beq          s9, s5, 1130f
                  mulh         ra, s9, a3
                  sub          s6, a0, t4
                  mulhsu       t1, t0, t1
                  sra          a3, s7, s2
                  bne          t6, tp, 1145f
                  lui          ra, 914672
1129:             bne          s2, zero, 1133f
1130:             srl          a2, s2, s6
                  xor          s1, gp, tp
                  srl          t2, s5, a6
1133:             slti         s3, s10, 1260
                  auipc        t5, 558664
                  srli         s11, t0, 22
                  bltu         s0, sp, 1151f
                  beq          t5, a4, 1142f
                  remu         s6, t4, s6
                  and          t3, s10, a2
                  nop
                  c.andi       a4, 28
1142:             bne          s4, ra, 1157f
                  blt          t0, s4, 1155f
                  sub          s3, a7, zero
1145:             c.add        ra, tp
                  nop
                  xor          t5, t5, s10
                  c.addi4spn   s0, sp, 896
                  bltu         s8, tp, 1167f
                  sra          t2, a4, t2
1151:             c.nop
                  mul          a3, s10, a4
                  c.srai       a1, 19
                  slti         s7, a4, -1879
1155:             c.or         s0, a0
                  c.add        s4, a0
1157:             sltiu        s2, s3, -1370
                  c.nop
                  c.li         a2, 8
                  xori         a3, s5, 561
                  or           t1, a2, zero
                  c.slli       a4, 30
                  rem          t3, s5, s5
                  c.xor        a1, a3
                  c.xor        a3, a4
                  c.srai       a2, 1
1167:             slli         s10, t3, 7
                  c.add        s11, s0
                  slti         t1, a2, -109
                  sra          s3, s7, sp
                  sra          gp, s7, s1
                  c.addi4spn   a0, sp, 672
                  c.xor        s1, a4
                  sltu         s9, s3, a0
                  sra          sp, a7, a7
                  c.nop
                  c.or         s1, a0
                  and          ra, s5, s1
                  slt          a1, s8, s3
                  c.addi4spn   a1, sp, 320
                  c.xor        a4, a5
                  divu         gp, s7, sp
                  bge          s4, t3, 1187f
                  c.add        ra, sp
                  xor          s7, a4, a5
                  c.mv         a1, s8
1187:             or           s4, t0, s3
                  divu         s9, t2, s10
                  c.sub        a2, a4
                  c.addi16sp   sp, -16
                  c.mv         s0, tp
                  slli         t1, t4, 23
                  bne          a7, gp, 1211f
                  sll          zero, s10, a2
                  andi         t5, a0, 1084
                  c.lui        a4, 12
                  ori          a0, s3, 825
                  srai         zero, zero, 24
                  xor          s0, a4, s11
                  sra          sp, s9, s1
                  andi         a4, s6, 230
                  c.addi16sp   sp, -16
                  c.srli       a1, 24
                  srli         zero, s6, 22
                  c.srli       s1, 4
                  blt          a2, s4, 1221f
                  c.beqz       a4, 1215f
                  bne          a4, t4, 1217f
                  lui          a4, 525307
                  slli         s2, t1, 4
1211:             c.addi       s8, -1
                  blt          a4, t2, 1230f
                  rem          a1, t4, t3
                  c.li         t1, 26
1215:             c.add        s10, ra
                  auipc        a4, 529420
1217:             blt          s11, s9, 1225f
                  c.addi16sp   sp, -16
                  srl          ra, sp, s1
                  mulh         a4, s10, s2
1221:             c.lui        s9, 8
                  srli         sp, s7, 1
                  sltiu        t0, a0, 784
                  mul          s8, s0, s4
1225:             sltiu        a2, t5, 470
                  mulhsu       gp, s9, sp
                  c.xor        s1, a0
                  auipc        s6, 292978
                  mulhsu       s5, s7, s2
1230:             bne          s9, a6, 1235f
                  srli         sp, s1, 13
                  c.srai       a4, 31
                  xor          t5, a1, t1
                  mulhu        s3, t4, t5
1235:             mulhu        s6, ra, s10
                  rem          a1, s7, s1
                  mul          s8, s11, t2
                  slt          a1, s5, s3
                  c.nop
                  c.addi4spn   s0, sp, 384
                  c.andi       a3, 17
                  sub          gp, t4, tp
                  c.sub        s0, a5
                  bltu         t1, t6, 1258f
                  mulh         s6, s4, a3
                  c.lui        a1, 24
                  xor          t6, s6, a2
                  sltiu        s4, a1, -1315
                  addi         t0, ra, 358
                  sll          t0, s4, a7
                  c.beqz       s1, 1267f
                  c.srli       a2, 26
                  mulh         t5, s3, ra
                  sltu         a4, a6, zero
                  div          s2, s1, a0
                  remu         s2, s10, a1
                  mulh         s3, s2, a7
1258:             nop
                  c.srli       a1, 26
                  remu         a4, s11, t5
                  rem          s10, s5, s2
                  bne          tp, s2, 1276f
                  c.addi       t0, -1
                  rem          s11, a0, t4
                  ori          a4, a5, -924
                  c.addi       s7, -1
1267:             c.add        s9, s4
                  nop
                  xori         s5, s2, -1550
                  c.or         a1, s1
                  auipc        s9, 957798
                  c.sub        a2, s0
                  remu         sp, a1, s0
                  auipc        s2, 1030526
                  srai         a3, a4, 11
1276:             ori          s4, s1, -1313
                  and          t5, s5, a6
                  addi         a7, a0, -1175
                  sub          a0, t5, tp
                  c.and        a1, a3
                  blt          s6, t2, 1293f
                  sltu         gp, t4, t2
                  sra          s0, s8, t6
                  addi         a1, s10, -2004
                  slti         t5, s7, 1141
                  sll          s11, s3, ra
                  remu         s11, a7, a3
                  srl          s0, tp, s0
                  add          t6, a0, a5
                  srl          s10, t5, t1
                  c.mv         s8, gp
                  sltiu        t3, zero, 1113
1293:             c.xor        a0, a1
                  c.addi       a3, -1
                  srli         t3, t3, 27
                  sra          t2, t6, a6
                  remu         gp, s1, a2
                  ori          a1, a0, -1748
                  c.slli       s4, 21
                  and          s3, t4, s7
                  remu         t0, a1, s6
                  bne          a0, s1, 1321f
                  c.slli       s6, 17
                  lui          t0, 902872
                  sll          zero, s2, a1
                  c.slli       sp, 21
                  c.nop
                  slli         t1, t0, 9
                  bge          s11, s11, 1327f
                  c.li         t4, 27
                  remu         s7, a3, t1
                  beq          s10, s0, 1320f
                  c.beqz       a1, 1314f
1314:             srai         s10, s2, 23
                  bltu         s8, a0, 1327f
                  xor          s6, sp, a2
                  c.andi       s0, -1
                  c.slli       s3, 22
                  c.sub        s1, a5
1320:             mulh         gp, a2, a3
1321:             c.bnez       a3, 1327f
                  srl          a1, s8, t1
                  add          s0, tp, zero
                  bge          tp, gp, 1328f
                  mulh         t6, s8, sp
                  auipc        s5, 143334
1327:             srai         t2, s8, 20
1328:             c.slli       sp, 15
                  sub          s3, s2, s7
                  sll          a0, s11, t0
                  mulhu        zero, s4, s10
                  srai         s9, t6, 16
                  c.srli       a0, 2
                  remu         s7, a1, s10
                  c.addi16sp   sp, -16
                  addi         s5, sp, 402
                  add          s11, a3, s7
                  c.addi16sp   sp, -16
                  andi         t4, s5, -787
                  or           a0, s5, t3
                  c.srai       a4, 2
                  add          t5, a2, t2
                  slti         a4, s2, -1316
                  bne          t3, s5, 1362f
                  c.nop
                  bge          t3, s7, 1360f
                  xor          s7, t4, s0
                  c.beqz       a4, 1349f
1349:             nop
                  mulhu        a2, s11, tp
                  blt          a7, s7, 1352f
1352:             mulh         s6, a6, s1
                  or           ra, a3, sp
                  c.addi       a0, -1
                  lui          t6, 318785
                  beq          s4, a3, 1365f
                  c.addi16sp   sp, -16
                  lui          s2, 79327
                  srai         s10, a5, 11
1360:             c.addi16sp   sp, 224
                  c.and        s0, a4
1362:             slli         a4, ra, 19
                  c.mv         s10, a4
                  sll          t6, zero, t1
1365:             mulhsu       s3, a0, a2
                  c.mv         t4, a4
                  add          s5, zero, t3
                  c.nop
                  add          a4, t5, a7
                  c.li         a0, 10
                  or           a7, a2, s0
                  sll          t2, t2, a7
                  c.and        a0, s0
                  sll          t3, tp, a5
                  c.mv         s6, s3
                  xori         t1, s7, 1578
                  c.li         t3, 29
                  c.sub        a3, a4
                  andi         t5, a4, -1537
                  addi         ra, sp, 1073
                  rem          s2, s8, a5
                  add          s8, s2, t4
                  rem          zero, t2, a6
                  addi         s3, a4, -1177
                  c.srli       a3, 17
                  ori          ra, s10, 916
                  bgeu         s11, t0, 1394f
                  sra          s9, s11, a1
                  c.li         s6, 8
                  c.slli       s8, 19
                  c.xor        s1, a4
                  c.xor        s1, a3
                  c.and        a0, a5
1394:             slt          a3, zero, a1
                  srli         s10, t4, 18
                  mulhu        sp, a4, s7
                  divu         s1, s1, s2
                  slli         t1, s6, 17
                  addi         s11, a3, -383
                  c.addi       s10, -1
                  div          a3, s7, t3
                  add          s9, t2, s1
                  lui          zero, 641118
                  c.lui        a7, 8
                  srli         a4, s2, 25
                  addi         s1, zero, -1783
                  c.sub        a4, a3
                  slli         s8, s7, 14
                  add          a0, tp, t6
                  srli         zero, a5, 9
                  c.addi4spn   a0, sp, 96
                  c.or         s1, a2
                  mulh         s5, a3, gp
                  blt          zero, a4, 1423f
                  xor          s5, s2, s6
                  c.mv         a1, s9
                  c.and        a4, s0
                  c.xor        a3, a4
                  mul          s6, s7, s5
                  slli         s8, t6, 29
                  addi         s4, s6, 382
                  c.addi       gp, -1
1423:             c.or         a1, a5
                  bgeu         a0, a1, 1439f
                  addi         s6, t2, -587
                  bge          t0, s8, 1443f
                  bgeu         s9, s1, 1442f
                  and          s3, ra, tp
                  c.add        t0, s8
                  xor          s0, t1, t4
                  or           s11, a2, a2
                  sltu         sp, ra, s4
                  c.or         a3, s0
                  mul          s8, t3, zero
                  srli         a1, s6, 26
                  blt          s7, s4, 1455f
                  bgeu         t2, s0, 1446f
                  mulhsu       s0, zero, s7
1439:             xor          t3, a6, a1
                  srl          a7, a3, t0
                  c.nop
1442:             sltiu        t3, t5, 1323
1443:             nop
                  add          t1, zero, a3
                  sub          t3, s3, a2
1446:             bltu         a6, a0, 1458f
                  mulhu        t2, a5, s6
                  and          a4, s1, s0
                  srl          a7, t0, s11
                  sra          s7, t4, t4
                  andi         s8, s6, 726
                  c.xor        s0, s0
                  andi         t3, a7, 615
                  slti         zero, s8, -1071
1455:             sra          s6, a4, s3
                  slli         s0, s2, 13
                  sltu         a0, a7, a6
1458:             c.beqz       s1, 1476f
                  c.srli       a0, 22
                  mulh         zero, s10, t6
                  sltu         zero, t5, s9
                  c.mv         s8, t6
                  c.add        t1, s8
                  c.addi4spn   a4, sp, 176
                  srai         t0, s2, 29
                  andi         sp, t4, -817
                  srli         a0, a7, 10
                  c.li         t6, -1
                  c.lui        a7, 9
                  xori         ra, s3, -1912
                  c.and        a4, s1
                  mulhsu       zero, t0, gp
                  c.add        t1, t4
                  divu         gp, s6, s2
                  c.and        a0, a0
1476:             remu         s11, s5, a3
                  c.slli       t6, 18
                  sll          s0, tp, s6
                  c.mv         s11, t3
                  c.xor        a1, a0
                  sll          s0, s2, a1
                  lui          t5, 165167
                  mul          t4, t5, s6
                  sltu         sp, sp, a3
                  c.lui        a4, 22
                  nop
                  slt          s8, s8, a6
                  mulh         a7, a1, s4
                  slti         s2, t1, -1065
                  xori         zero, a3, -1821
                  bne          s7, a1, 1497f
                  beq          ra, t0, 1511f
                  c.nop
                  remu         s1, t5, s2
                  slt          t0, t5, s2
                  bgeu         a7, s10, 1510f
1497:             srli         t5, a0, 30
                  slt          a4, gp, s0
                  bgeu         sp, a5, 1500f
1500:             c.and        s1, s1
                  c.and        a3, a3
                  beq          s7, t5, 1520f
                  slt          ra, t3, a5
                  xor          s11, a4, s11
                  mulh         s9, s8, a0
                  c.xor        a4, s0
                  c.and        a3, a5
                  sltu         a0, s0, sp
                  c.add        s1, s7
1510:             bgeu         a7, gp, 1517f
1511:             c.nop
                  andi         a2, a3, 1634
                  ori          s1, s5, -803
                  andi         s7, s11, -488
                  srli         t4, t1, 4
                  and          zero, s8, t6
1517:             divu         s6, tp, s8
                  xori         t4, s9, 599
                  mulhsu       t0, a3, ra
1520:             c.srai       a1, 11
                  bge          s5, s1, 1536f
                  div          a1, a4, s7
                  slti         t1, t5, 1322
                  c.srai       s0, 17
                  or           s1, t1, t1
                  add          t3, s11, s5
                  bltu         a3, s9, 1542f
                  slt          t3, a6, a7
                  mul          a1, s4, a4
                  lui          a4, 796749
                  divu         t5, a3, s7
                  xori         s6, a0, -651
                  bge          a1, s11, 1547f
                  c.srli       a0, 15
                  c.addi4spn   s0, sp, 336
1536:             sra          a0, gp, a5
                  c.mv         s0, a4
                  xori         zero, s10, -178
                  nop
                  bltu         t5, a6, 1549f
                  c.srai       s0, 19
1542:             mulh         a2, s8, s1
                  beq          ra, t6, 1547f
                  or           s11, s8, s4
                  srli         a2, ra, 28
                  slt          a3, s3, s8
1547:             c.addi16sp   sp, 32
                  sltiu        a2, t1, -1974
1549:             beq          a0, t0, 1566f
                  lui          s11, 936705
                  c.sub        a2, a3
                  c.addi16sp   sp, 432
                  lui          a1, 42380
                  srl          a4, s0, s2
                  andi         t1, s10, -1239
                  bgeu         s8, s2, 1571f
                  nop
                  beq          a1, t5, 1577f
                  mulhu        a3, s3, t6
                  xor          s1, s2, a3
                  beq          sp, a6, 1569f
                  sltiu        s7, gp, -1751
                  c.mv         a7, s11
                  xor          s1, gp, a7
                  srai         a2, a5, 31
1566:             bgeu         zero, a3, 1582f
                  c.andi       a3, -1
                  or           a7, a2, s9
1569:             remu         sp, a2, t1
                  lui          t3, 642741
1571:             c.mv         a3, a1
                  and          t4, a0, t6
                  xori         s10, a3, 1234
                  remu         s4, a5, gp
                  auipc        t4, 269305
                  c.lui        gp, 1
1577:             xori         t3, s5, -735
                  divu         a4, s7, s11
                  c.srai       a3, 13
                  c.srli       a1, 14
                  c.add        s10, t0
1582:             c.beqz       a4, 1583f
1583:             sll          a2, t5, s11
                  bltu         a1, s6, 1598f
                  mulhu        s6, zero, t0
                  nop
                  c.and        a1, a1
                  bgeu         s3, s2, 1606f
                  srli         t5, a6, 30
                  lui          s2, 588576
                  mulh         gp, a7, s8
                  c.addi       s7, -1
                  add          s11, s8, t3
                  xori         a2, s5, -1161
                  c.srli       a0, 23
                  c.nop
                  lui          zero, 412731
1598:             xor          t5, zero, s9
                  bne          a3, s1, 1617f
                  mulh         t1, gp, sp
                  c.add        a7, a1
                  rem          t5, s5, t5
                  ori          t0, t2, -660
                  c.andi       a3, 11
                  div          t1, tp, t1
1606:             bltu         s0, s8, 1611f
                  c.andi       a1, 13
                  c.addi16sp   sp, -16
                  slli         t3, a6, 30
                  c.addi4spn   s0, sp, 592
1611:             c.li         t5, -1
                  mulhsu       s1, a2, s1
                  slti         s2, t2, 1101
                  xor          s11, s2, a2
                  c.bnez       a3, 1623f
                  bne          a7, s9, 1625f
1617:             beq          s4, a3, 1618f
1618:             c.andi       a4, -1
                  lui          s11, 467261
                  xori         s7, s6, -1719
                  slli         t4, s9, 18
                  div          s1, a2, a4
1623:             slt          s6, t1, t2
                  c.slli       a4, 24
1625:             auipc        t5, 354708
                  c.xor        a4, a5
                  nop
                  div          t0, t5, s2
                  c.xor        a1, a3
                  sub          s8, zero, t3
                  c.or         a1, a2
                  remu         s2, t2, s7
                  srai         s3, a7, 28
                  xor          s3, a5, tp
                  sub          sp, s11, a7
                  c.sub        a4, a0
                  remu         a2, ra, t6
                  c.lui        s1, 1
                  div          s6, a1, a1
                  c.andi       s1, 3
                  bgeu         s6, s5, 1653f
                  c.add        s1, t3
                  c.srli       a2, 14
                  mulh         a2, zero, ra
                  ori          t0, a4, 2019
                  divu         s11, t1, sp
                  c.add        a3, tp
                  divu         sp, ra, s11
                  srli         sp, t4, 8
                  rem          s9, t0, a5
                  auipc        s11, 78739
                  c.nop
1653:             sltu         s10, s7, s6
                  sll          t5, a6, zero
                  c.bnez       a4, 1659f
                  blt          a4, s5, 1664f
                  auipc        s5, 667693
                  c.or         a2, s0
1659:             slti         s1, a5, 740
                  bne          s6, s9, 1665f
                  slli         t5, ra, 22
                  auipc        t6, 252556
                  c.add        a3, s8
1664:             sltu         t1, s7, a7
1665:             bge          t1, a0, 1683f
                  slt          t6, s11, a3
                  lui          s9, 34251
                  sra          a7, ra, s11
                  slli         a4, s9, 19
                  c.bnez       a4, 1684f
                  blt          t4, t5, 1688f
                  c.addi       sp, -1
                  sub          t2, s6, a5
                  mulh         t4, s1, t1
                  mul          s10, t5, zero
                  c.sub        a2, a4
                  bgeu         t3, s11, 1678f
1678:             add          ra, a4, gp
                  nop
                  c.sub        a4, a4
                  c.addi4spn   s1, sp, 384
                  c.lui        ra, 18
1683:             c.slli       a7, 23
1684:             xor          t0, sp, a4
                  c.add        s3, s5
                  xori         zero, s6, 1152
                  c.beqz       a2, 1691f
1688:             c.addi4spn   a3, sp, 48
                  slt          t6, ra, s5
                  c.nop
1691:             slt          a2, a7, s3
                  slli         a7, t0, 13
                  mulhu        s5, tp, s4
                  c.and        a3, a0
                  auipc        s9, 482165
                  rem          s11, t5, s2
                  sra          a7, s5, a5
                  c.and        a4, a1
                  srai         s11, s9, 11
                  rem          t4, s0, tp
                  c.add        t6, s1
                  c.and        s1, a5
                  c.mv         s7, s1
                  c.addi       s10, 27
                  c.slli       t2, 3
                  srli         s8, t2, 9
                  srai         t6, a6, 2
                  bgeu         ra, a1, 1709f
1709:             ori          t5, t5, 1415
                  sub          s3, a5, t1
                  c.mv         a4, a0
                  slli         t5, zero, 11
                  remu         s7, a7, a6
                  c.li         s11, 25
                  mulh         s4, zero, a4
                  slt          s7, t5, s11
                  c.or         a3, s1
                  bltu         a4, sp, 1732f
                  mulhsu       s0, t5, s1
                  c.addi4spn   a2, sp, 16
                  c.srai       a4, 29
                  srl          s0, a6, t0
                  addi         s4, a0, 108
                  c.xor        s1, s1
                  slti         t0, tp, -110
                  add          s7, a1, a1
                  auipc        sp, 239646
                  c.andi       a0, 1
                  bltu         s4, s2, 1747f
                  mulhu        t3, s4, a0
                  c.add        ra, s6
1732:             beq          s11, t5, 1740f
                  c.srai       a4, 24
                  mul          a4, s2, s0
                  rem          s9, s5, s7
                  beq          t2, s5, 1745f
                  blt          s11, s3, 1755f
                  sltiu        s0, s10, -1191
                  sll          s9, zero, s0
1740:             blt          t5, t5, 1741f
1741:             auipc        a3, 689185
                  mul          t4, a1, t0
                  rem          sp, t3, a2
                  div          t2, sp, t4
1745:             bge          s0, s7, 1764f
                  sll          s3, a5, t4
1747:             c.add        s5, s7
                  c.beqz       a2, 1763f
                  slli         t3, t5, 6
                  srl          s1, a3, s10
                  and          sp, ra, t1
                  c.xor        a2, a5
                  addi         a0, a1, -112
                  sltiu        a3, a5, 1248
1755:             c.or         s0, a5
                  sub          s11, s4, zero
                  andi         t1, a6, -334
                  c.sub        a3, a3
                  mul          s0, sp, tp
                  remu         t2, s11, s4
                  c.beqz       a3, 1770f
                  blt          zero, s2, 1777f
1763:             c.slli       a2, 20
1764:             srai         a2, zero, 24
                  c.or         a1, a4
                  srli         t1, t4, 17
                  bne          t3, a2, 1782f
                  c.addi4spn   a0, sp, 944
                  c.sub        a3, a2
1770:             c.or         a2, s1
                  c.nop
                  xori         ra, tp, -360
                  srl          ra, a0, a5
                  sub          t4, s3, a0
                  bltu         ra, gp, 1794f
                  slt          s10, t6, a1
1777:             c.sub        a3, a5
                  lui          ra, 513954
                  add          s6, s6, a4
                  slti         t1, t1, -1602
                  srai         s11, sp, 23
1782:             c.srai       a4, 21
                  c.xor        s0, a3
                  sra          t6, a3, a7
                  c.beqz       a0, 1789f
                  div          s10, a2, a1
                  lui          s10, 721668
                  sltiu        t5, s8, 313
1789:             remu         t4, a1, a5
                  add          s7, s4, t0
                  rem          s7, s11, s6
                  sltu         zero, s2, s5
                  sltu         a3, s7, s6
1794:             c.srli       a1, 5
                  andi         s9, tp, -369
                  bne          t2, s10, 1814f
                  c.add        s7, s3
                  andi         t3, s4, 240
                  sra          a0, gp, t4
                  c.mv         t4, gp
                  c.addi16sp   sp, 336
                  c.srai       s1, 31
                  c.nop
                  bne          t4, s2, 1813f
                  nop
                  add          a7, s3, s2
                  slti         s9, s5, -1762
                  c.mv         s0, a7
                  auipc        s10, 725210
                  sltiu        s2, a5, -693
                  c.li         a7, 7
                  xor          sp, a2, a2
1813:             add          t3, s5, zero
1814:             c.slli       a7, 5
                  c.xor        a0, a3
                  sltiu        s9, s10, -1186
                  c.srai       a0, 9
                  slt          a0, a1, gp
                  blt          t4, tp, 1831f
                  remu         t5, t2, t4
                  c.mv         a4, gp
                  srai         a7, sp, 24
                  mulhsu       a2, s5, s4
                  mulhsu       s9, t5, s6
                  bge          t6, t6, 1839f
                  xori         t6, a4, 1660
                  divu         a3, a1, s0
                  srli         s6, s2, 30
                  slli         a1, a3, 8
                  c.andi       a4, -1
1831:             srl          sp, ra, s3
                  bne          a3, gp, 1840f
                  c.slli       s7, 17
                  divu         s11, a5, s8
                  xori         a1, a6, -1736
                  blt          a6, s4, 1848f
                  remu         s9, zero, t3
                  mulh         t2, gp, s1
1839:             c.slli       s1, 20
1840:             rem          gp, a5, a0
                  c.addi       s0, -1
                  c.beqz       a0, 1849f
                  bge          a4, t0, 1859f
                  c.xor        a2, s1
                  sll          s0, a4, zero
                  blt          s3, a3, 1854f
                  xor          a3, s1, tp
1848:             and          ra, sp, t6
1849:             and          s10, t5, tp
                  beq          s0, sp, 1856f
                  c.add        s5, a2
                  lui          s0, 904165
                  div          s2, s0, s6
1854:             c.li         s7, -1
                  bltu         sp, t5, 1863f
1856:             lui          ra, 300426
                  sltu         s7, t1, ra
                  bltu         t4, s3, 1859f
1859:             c.xor        s0, a5
                  sub          s0, a2, t1
                  mulhu        t5, t1, s6
                  bne          s8, t1, 1878f
1863:             blt          a1, s0, 1864f
1864:             auipc        t1, 134739
                  nop
                  c.li         t1, 7
                  mulhsu       a0, s0, s5
                  mulh         a4, a0, s0
                  sltiu        s0, s10, -1777
                  slt          a0, t3, s7
                  c.andi       a3, -1
                  c.slli       s8, 3
                  ori          ra, s6, -1157
                  sltu         a2, s6, t5
                  c.and        a4, a5
                  c.addi4spn   a1, sp, 304
                  or           s0, zero, s6
1878:             bltu         t2, s2, 1886f
                  mulhu        sp, s2, s7
                  remu         s7, t5, s8
                  mulhu        a1, sp, t0
                  c.xor        a4, a2
                  mulhu        s10, a3, ra
                  mulhu        s7, s4, s9
                  c.beqz       a2, 1894f
1886:             auipc        t3, 172298
                  bgeu         a4, t1, 1896f
                  xori         sp, sp, 760
                  mulh         a4, a2, t6
                  c.xor        a1, a2
                  rem          s5, zero, gp
                  c.andi       s1, -1
                  c.andi       s1, 21
1894:             blt          a6, zero, 1898f
                  slt          ra, tp, s11
1896:             mulhsu       s2, t1, s1
                  sll          ra, s9, sp
1898:             sra          ra, zero, s7
                  c.addi       s11, 31
                  c.xor        a1, s0
                  bge          s3, sp, 1907f
                  nop
                  rem          a1, t1, s11
                  nop
                  srl          ra, ra, s9
                  auipc        a4, 433482
1907:             ori          t1, a3, 1560
                  andi         t6, s7, -1746
                  xor          s1, a6, s3
                  c.srai       s0, 28
                  c.mv         t1, a2
                  divu         s2, s5, zero
                  slli         sp, s9, 28
                  c.li         sp, -1
                  c.or         a1, a2
                  c.addi16sp   sp, -16
                  c.li         t6, 8
                  andi         t4, s7, -931
                  c.xor        a0, a4
                  bgeu         a3, s1, 1935f
                  sll          s9, a4, zero
                  bgeu         tp, t1, 1926f
                  lui          s10, 436997
                  addi         a4, s0, -2020
                  sra          a1, ra, a3
1926:             sltiu        s5, s10, -349
                  srli         zero, t5, 20
                  sll          t0, s5, t0
                  c.beqz       a4, 1944f
                  c.xor        a0, s0
                  lui          s2, 67675
                  srli         a1, a7, 29
                  sltiu        ra, s8, -819
                  c.beqz       a4, 1951f
1935:             sra          s5, ra, tp
                  sra          a7, a2, s2
                  slt          ra, ra, s11
                  add          t0, s8, t1
                  c.lui        s1, 13
                  bne          ra, a2, 1958f
                  mulhu        s3, s3, zero
                  srai         s8, s7, 25
                  sub          t6, a7, s6
1944:             sltiu        s7, s3, -894
                  c.nop
                  c.add        s7, s5
                  c.nop
                  sltu         a7, s8, a1
                  mulhsu       ra, t4, a6
                  addi         ra, s6, -2012
1951:             add          a4, t3, s5
                  xori         s1, a6, -49
                  nop
                  auipc        t6, 50364
                  srli         s6, s5, 19
                  c.sub        a4, a2
                  slt          a2, gp, s11
1958:             auipc        s1, 270094
                  slt          sp, tp, a5
                  beq          s11, ra, 1974f
                  beq          s8, s0, 1975f
                  mulhsu       s6, s11, sp
                  c.bnez       a4, 1978f
                  blt          a5, t4, 1971f
                  c.add        s10, s1
                  c.sub        s0, a0
                  mulhu        a2, t2, s3
                  c.srai       a3, 8
                  sra          zero, s9, s8
                  and          sp, a2, a4
1971:             c.andi       s0, 25
                  c.slli       s3, 5
                  divu         s3, a3, zero
1974:             or           t4, t6, a5
1975:             beq          s2, t1, 1989f
                  mul          s8, a1, a3
                  c.srli       a1, 12
1978:             auipc        s6, 692834
                  add          a1, s6, a6
                  c.beqz       a4, 1999f
                  bge          s1, gp, 2000f
                  c.add        t2, a4
                  beq          zero, t6, 2001f
                  c.lui        a0, 7
                  sltiu        t1, s1, 395
                  mulhsu       s8, sp, s4
                  c.srli       s1, 7
                  c.sub        s1, a3
1989:             slti         t3, tp, 758
                  addi         a4, t2, 1700
                  srli         t1, tp, 14
                  c.addi       s9, -1
                  srai         t5, t3, 21
                  c.slli       s4, 14
                  rem          t3, t5, t3
                  bltu         s4, s9, 2014f
                  c.li         a0, 4
                  auipc        ra, 1024461
1999:             c.sub        a0, a4
2000:             blt          s7, a6, 2001f
2001:             sltiu        s1, t4, -1679
                  rem          s5, zero, ra
                  sltu         s5, t0, a5
                  mulh         t0, s0, s4
                  c.andi       a1, -1
                  sub          s4, a0, s1
                  c.beqz       a4, 2019f
                  c.bnez       a1, 2026f
                  c.xor        a0, a3
                  add          s7, zero, s6
                  sub          s4, a5, s6
                  sll          a7, t5, a2
                  remu         t4, s11, t5
2014:             divu         s7, s3, s1
                  c.sub        a1, a3
                  xori         zero, s10, -542
                  bge          s2, s2, 2029f
                  sll          s3, t3, tp
2019:             srl          s11, t1, s2
                  divu         s6, s6, s5
                  c.srli       a0, 4
                  lui          s11, 293559
                  srli         a4, s7, 20
                  c.sub        s1, a1
                  bge          a7, ra, 2030f
2026:             nop
                  c.sub        a0, a2
                  c.xor        a1, a3
2029:             remu         gp, t0, t3
2030:             lui          t6, 562031
                  slt          t1, a5, s3
                  c.addi       s8, 24
                  c.and        a0, a0
                  sltu         s6, ra, s1
                  slt          sp, s2, sp
                  c.and        s0, a2
                  mul          s5, s2, s9
                  mulh         sp, s2, s4
                  beq          s8, sp, 2047f
                  c.srli       a0, 26
                  nop
                  sub          a1, s8, a2
                  addi         s6, t6, -855
                  c.or         a4, a0
                  srai         s4, t6, 22
                  c.sub        a1, s0
2047:             div          sp, a0, a0
                  add          s6, s4, s1
                  and          s9, s6, s9
                  blt          s1, zero, 2059f
                  sll          s0, tp, s9
                  c.nop
                  c.addi4spn   a0, sp, 240
                  remu         s7, a3, t1
                  sub          s0, zero, a5
                  mulh         a2, ra, s7
                  remu         t4, s3, s1
                  c.addi       gp, 12
2059:             addi         a3, sp, 873
                  andi         s2, t6, 1196
                  lui          s7, 749707
                  c.addi16sp   sp, -16
                  c.lui        t1, 11
                  sltiu        zero, s0, -419
                  remu         s9, s6, a3
                  nop
                  sra          t2, s8, a5
                  divu         sp, tp, a4
                  c.addi4spn   a4, sp, 64
                  c.add        gp, t6
                  bgeu         s1, t2, 2089f
                  or           t4, s5, t1
                  mul          s8, t2, sp
                  add          s7, ra, t4
                  andi         s9, ra, -731
                  c.beqz       a2, 2088f
                  mulhsu       t0, a4, a2
                  c.xor        a2, a0
                  srl          ra, gp, tp
                  c.or         s1, a2
                  c.add        gp, a0
                  sll          s5, s11, s9
                  add          t4, s8, a7
                  c.sub        a2, a2
                  bne          s8, t4, 2086f
2086:             mulhsu       t6, s2, a3
                  bltu         tp, s1, 2088f
2088:             c.mv         s6, a4
2089:             nop
                  andi         t3, t6, -1339
                  remu         s7, t3, a3
                  addi         s10, s4, -37
                  c.and        a1, s1
                  srai         s7, s11, 19
                  srl          zero, s9, a5
                  c.addi4spn   s1, sp, 368
                  mulhsu       sp, gp, t2
                  xor          t6, t5, s9
                  div          s7, tp, a4
                  slt          s5, a3, gp
                  sltu         s3, s6, s4
                  c.andi       s1, -1
                  sub          s4, s4, t5
                  sub          s4, a5, zero
                  c.slli       s2, 14
                  blt          ra, zero, 2120f
                  blt          s2, t4, 2122f
                  blt          s1, s8, 2115f
                  and          s0, s8, s8
                  sll          s5, a6, s8
                  bgeu         s0, t5, 2129f
                  rem          a0, a1, s4
                  c.mv         s10, a4
                  mul          s8, a6, s4
2115:             bne          t5, s11, 2132f
                  c.addi       a1, 10
                  c.bnez       a4, 2135f
                  c.nop
                  xor          t3, t2, a6
2120:             mul          t5, sp, s1
                  add          t5, a2, tp
2122:             c.srli       a2, 14
                  c.srai       a4, 2
                  c.andi       a1, 7
                  sra          t5, gp, s3
                  c.li         t6, -1
                  bgeu         ra, a2, 2141f
                  ori          t5, s7, 25
2129:             or           t6, t6, t2
                  c.lui        s3, 23
                  c.andi       a3, 25
2132:             c.add        s0, t1
                  bgeu         ra, t1, 2151f
                  mulhu        ra, s1, t4
2135:             and          s5, a6, s1
                  srai         sp, a7, 27
                  c.srli       s1, 11
                  mulhsu       sp, zero, a4
                  c.addi       s9, 16
                  remu         s7, sp, t4
2141:             c.li         s5, 15
                  slli         s6, a5, 28
                  c.andi       a1, -1
                  c.addi4spn   a1, sp, 416
                  c.add        s4, a7
                  c.bnez       a0, 2161f
                  sra          s1, s9, a6
                  c.bnez       a0, 2163f
                  c.beqz       a1, 2168f
                  mulh         s6, t3, a1
2151:             rem          t5, t0, s5
                  divu         ra, t3, s7
                  addi         s10, s6, 538
                  sltiu        s9, t1, -469
                  c.xor        s0, a2
                  bltu         t5, gp, 2160f
                  c.or         a1, a1
                  c.mv         t1, s9
                  nop
2160:             c.srli       a0, 4
2161:             slli         t6, t3, 10
                  c.li         s8, 4
2163:             add          s6, a3, a2
                  c.slli       s6, 14
                  srai         s1, a0, 18
                  blt          zero, t4, 2175f
                  slti         ra, s8, -2026
2168:             bge          ra, tp, 2176f
                  sll          t5, t1, t0
                  nop
                  c.and        s0, a0
                  beq          t2, s10, 2180f
                  xor          a4, a6, sp
                  ori          t3, s10, -1721
2175:             beq          a2, s9, 2184f
2176:             xor          s11, a2, s2
                  nop
                  c.andi       s0, 10
                  and          t6, tp, s10
2180:             lui          a7, 469286
                  srai         s0, s8, 24
                  andi         s4, t4, 633
                  c.and        a2, s0
2184:             slt          a2, sp, s0
                  ori          zero, tp, -670
                  slt          s10, s8, a5
                  ori          a7, s11, -133
                  add          a4, t1, s9
                  c.and        a1, a5
                  bne          a2, s8, 2204f
                  add          a3, t1, a0
                  bgeu         t1, ra, 2196f
                  sltiu        t4, s2, 642
                  slli         s7, s2, 24
                  bgeu         a2, tp, 2207f
2196:             bne          a0, ra, 2197f
2197:             sll          t2, s9, t4
                  divu         s7, s1, s0
                  remu         s8, a6, s5
                  c.or         a0, s0
                  srli         a7, a0, 18
                  nop
                  sltiu        zero, sp, 497
2204:             or           s3, a6, s6
                  c.addi4spn   a3, sp, 304
                  mulhu        zero, tp, t4
2207:             div          a3, a2, a1
                  c.or         s0, a1
                  slli         sp, s4, 12
                  c.srli       a1, 5
                  c.beqz       a3, 2219f
                  bltu         s3, a7, 2217f
                  c.srli       a4, 23
                  sltu         t1, a3, t3
                  sll          t2, a6, s3
                  c.beqz       a4, 2235f
2217:             blt          ra, t2, 2226f
                  bne          s9, a2, 2224f
2219:             c.srli       a3, 12
                  c.srli       a3, 2
                  addi         gp, s4, 1932
                  bge          a0, s5, 2238f
                  c.srli       a1, 19
2224:             xor          t1, s4, t6
                  blt          t0, a1, 2244f
2226:             bltu         sp, gp, 2241f
                  slli         s4, a4, 4
                  add          s3, a1, t4
                  c.xor        s0, s0
                  srai         s8, ra, 7
                  c.nop
                  c.lui        t2, 15
                  c.and        s1, a3
                  c.mv         t1, s10
2235:             sra          t6, t2, s3
                  c.mv         s6, a6
                  sub          t6, s7, a2
2238:             and          t2, a1, s7
                  srl          sp, t4, s0
                  slti         a3, t2, -326
2241:             c.mv         s2, s2
                  c.beqz       s1, 2260f
                  mulhu        s9, t3, a2
2244:             bltu         s4, a2, 2259f
                  add          s5, gp, s10
                  addi         s10, a1, 1605
                  c.and        a1, s0
                  xori         a1, t0, 1592
                  bne          s4, a6, 2250f
2250:             c.sub        a3, a3
                  sltiu        a0, s5, 1353
                  or           s2, ra, s0
                  c.lui        a3, 23
                  mulhsu       gp, zero, sp
                  add          t1, s3, a5
                  or           a2, a1, s0
                  ori          sp, t0, -1345
                  slt          zero, s2, a3
2259:             c.sub        s1, a0
2260:             srli         a0, t0, 27
                  bltu         s7, zero, 2276f
                  bltu         a6, a1, 2271f
                  rem          t6, t4, a6
                  beq          ra, t1, 2268f
                  xor          s5, ra, t5
                  sub          a0, a0, s8
                  mulhsu       a3, t2, t3
2268:             sltu         t0, ra, s5
                  la           t6, region_0+598 #start load_store_instr_stream_1
                  la           s7, region_1+1748 #start load_store_instr_stream_0
                  sb           a6, -10(t6)
                  sb           t4, -14(s7)
                  lh           s10, 12(t6)
                  lbu          s5, 14(s7)
                  sb           s1, -3(t6)
                  lh           s6, 8(t6)
                  lb           a4, -11(s7)
                  lhu          s11, 14(t6)
                  lbu          gp, 1(s7)
                  sb           s8, 1(t6)
                  lb           sp, 9(t6)
                  sb           a1, 15(t6)
                  lhu          ra, 2(s7)
                  sb           a6, 3(t6) #end load_store_instr_stream_1
                  lb           s0, 9(s7)
                  lb           s11, 1(s7)
                  lb           sp, -15(s7)
                  lb           t1, 11(s7)
                  lbu          s11, 5(s7) #end load_store_instr_stream_0
                  c.bnez       a1, 2275f
                  bltu         t4, t3, 2274f
2271:             c.slli       t5, 23
                  c.srli       a4, 21
                  c.srli       s1, 5
2274:             sltu         a4, s3, a4
2275:             c.andi       a1, -1
2276:             andi         t0, ra, 1215
                  mulhu        s3, s5, s0
                  c.addi4spn   a3, sp, 224
                  sra          a3, s0, s2
                  bge          t6, a1, 2299f
                  andi         s0, sp, 1982
                  c.addi       ra, 1
                  addi         s2, tp, 727
                  bne          t5, a0, 2302f
                  c.lui        t6, 26
                  c.sub        a4, a5
                  c.add        sp, tp
                  c.and        s1, a4
                  xori         ra, t2, -960
                  slt          gp, s3, s11
                  and          t6, s8, s1
                  c.slli       s9, 9
                  remu         ra, ra, zero
                  bgeu         a1, s6, 2295f
2295:             srai         t2, s3, 23
                  and          s3, s0, tp
                  la           t4, amo_0+48 #start riscv_amo_instr_stream_13
                  la           gp, amo_0+20
                  amomax.w.aq   t6, s9, (t4)
                  sltiu        t0, s2, -431
                  amomin.w      s8, t1, (t4) #end riscv_amo_instr_stream_13
                  nop
                  bgeu         a0, s5, 2312f
2299:             slt          a2, t5, t3
                  addi         t4, s10, -2039
                  sltiu        a7, gp, -47
2302:             sltiu        t6, s1, 1477
                  beq          tp, s0, 2319f
                  bltu         s7, s10, 2322f
                  c.add        s10, t5
                  c.addi4spn   a1, sp, 800
                  c.srai       a0, 19
                  c.addi16sp   sp, 32
                  c.addi4spn   a1, sp, 656
                  c.mv         gp, t4
                  srl          t5, s2, gp
2312:             c.bnez       s0, 2326f
                  divu         t3, a2, a1
                  beq          s7, a7, 2326f
                  and          t0, t6, s10
                  srai         t2, a2, 11
                  c.addi       s9, 11
                  ori          s0, s9, 497
2319:             sltiu        s11, s1, 947
                  c.srai       a0, 6
                  srai         zero, zero, 9
2322:             bne          s9, t4, 2330f
                  c.slli       s11, 19
                  c.nop
                  c.xor        a2, a4
2326:             beq          s10, t6, 2338f
                  addi         s8, a2, 928
                  auipc        t6, 598542
                  slt          t3, t5, t4
2330:             slli         s4, t5, 9
                  srai         a0, s10, 29
                  srai         t3, a7, 14
                  add          s11, a3, sp
                  mulhu        t5, a4, zero
                  sltu         sp, s9, tp
                  srai         s6, s7, 28
                  slli         s2, s0, 1
2338:             bne          t6, ra, 2347f
                  c.or         a1, a2
                  c.andi       a4, -1
                  c.lui        s9, 30
                  c.bnez       s0, 2350f
                  c.li         a1, -1
                  c.or         a0, a2
                  andi         s3, a0, -85
                  xori         ra, sp, -2034
2347:             c.addi       t3, -1
                  c.slli       a1, 5
                  c.and        a1, a4
2350:             c.add        s5, sp
                  c.bnez       a1, 2359f
                  c.or         a1, a1
                  c.nop
                  bne          t1, ra, 2368f
                  c.addi16sp   sp, 240
                  c.addi16sp   sp, 304
                  bge          t5, a7, 2362f
                  c.mv         s8, a1
2359:             c.sub        s0, a0
                  div          a3, a5, s8
                  c.srai       a0, 29
2362:             srai         s7, s1, 8
                  rem          s0, t4, a0
                  c.addi4spn   a1, sp, 80
                  addi         t3, t3, -382
                  mulhu        s11, s11, a7
                  srli         s6, s11, 0
2368:             bltu         a4, s2, 2386f
                  slli         t3, s2, 10
                  blt          t5, zero, 2379f
                  c.addi4spn   a2, sp, 896
                  bge          t0, a2, 2373f
2373:             c.or         a2, a1
                  mulh         t3, a0, a3
                  c.mv         t0, a3
                  srai         s10, t6, 3
                  c.add        a1, s4
                  c.lui        t0, 4
2379:             c.andi       a2, 30
                  c.addi4spn   a0, sp, 64
                  bge          s0, s9, 2388f
                  c.srai       a1, 10
                  beq          ra, s6, 2400f
                  bge          s5, s4, 2399f
                  slt          s4, a1, a7
2386:             mulhsu       t2, zero, t5
                  c.slli       t1, 24
2388:             sub          zero, a4, s11
                  c.add        ra, tp
                  c.sub        a4, s1
                  c.srli       a2, 8
                  remu         s6, t4, a3
                  c.add        s10, s3
                  c.bnez       a2, 2409f
                  xor          t6, zero, s10
                  lui          t1, 91243
                  c.addi       a3, -1
                  add          s1, s10, s9
2399:             mul          zero, s6, t0
2400:             rem          s10, t5, s5
                  c.or         a0, a1
                  and          t4, s4, ra
                  sub          t0, s2, t6
                  andi         a2, s10, 1596
                  c.or         s1, a1
                  c.beqz       a0, 2424f
                  or           t5, a4, s0
                  ori          a1, a7, 1347
2409:             blt          s8, gp, 2413f
                  c.slli       s6, 10
                  c.li         s5, 27
                  c.srli       a4, 20
2413:             c.mv         s9, s6
                  or           t3, gp, t5
                  c.xor        s1, a2
                  mulh         zero, s2, a5
                  c.andi       s1, 7
                  c.srli       s0, 8
                  divu         s7, s9, ra
                  c.or         a4, a4
                  sltiu        sp, s0, 278
                  add          s9, s4, a0
                  c.xor        a4, a0
2424:             c.add        s0, s10
                  blt          t2, a6, 2444f
                  la           t6, region_1+763 #start riscv_load_store_hazard_instr_stream_7
                  lbu          s2, 64(t6)
                  ori          s1, s11, 103
                  sb           t6, 64(t6)
                  mulhsu       zero, t1, t2
                  lb           ra, 64(t6)
                  c.or         a0, a2
                  sub          s2, s7, s4
                  lb           s7, 64(t6)
                  lb           t0, 64(t6)
                  sb           s10, 64(t6)
                  sb           ra, -14(t6)
                  lb           s0, -57(t6)
                  lh           s11, -57(t6)
                  c.sub        a0, a4
                  sb           s2, -57(t6)
                  sh           s4, -57(t6)
                  lh           s2, -57(t6)
                  lh           ra, -57(t6)
                  c.addi       t2, 13
                  c.addi4spn   a3, sp, 480
                  sb           s1, -57(t6)
                  lh           s5, -57(t6)
                  lbu          ra, -57(t6)
                  lbu          t3, 16(t6)
                  lb           t1, 16(t6) #end riscv_load_store_hazard_instr_stream_7
                  c.srli       a0, 29
                  srl          gp, t2, t0
                  c.andi       s0, -1
                  slt          sp, s4, s9
                  beq          s9, s9, 2436f
                  sub          t6, a7, s2
                  bne          s6, t4, 2433f
2433:             lui          s11, 770490
                  c.addi16sp   sp, -16
                  add          a0, s5, t6
2436:             andi         sp, ra, -331
                  lui          s7, 968573
                  c.addi4spn   a1, sp, 832
                  mulhu        a4, a7, ra
                  c.addi       t0, 1
                  lui          s6, 361869
                  sra          a0, zero, a4
                  srl          s6, tp, a4
2444:             c.sub        s0, a3
                  c.addi       t4, -1
                  slt          s6, s10, s1
                  slt          a7, s7, t2
                  andi         t3, a4, 2007
                  xori         a1, t5, 815
                  mulh         s5, a5, a5
                  c.or         a0, s0
                  rem          s1, gp, gp
                  c.addi16sp   sp, -16
                  blt          a0, a7, 2462f
                  c.sub        s0, a3
                  divu         a1, s10, a0
                  c.srli       a4, 22
                  srl          s3, s5, zero
                  c.mv         t1, a6
                  c.xor        a1, a1
                  divu         a0, a2, t1
2462:             c.addi       sp, 17
                  xori         s0, tp, -909
                  c.add        s8, t1
                  c.addi       a0, 12
                  mulhsu       zero, s11, t5
                  sub          s10, t2, s2
                  slti         t2, zero, 383
                  bne          a3, s11, 2483f
                  xor          s2, a3, a2
                  c.li         t1, 28
                  lui          t5, 829127
                  c.add        a3, t1
                  bne          a2, s2, 2492f
                  auipc        a7, 368755
                  c.addi4spn   a0, sp, 784
                  c.and        a2, a3
                  ori          a0, t0, 540
                  slt          s4, s10, s6
                  c.and        a2, s0
                  slli         s9, t2, 10
                  mul          s2, s11, sp
2483:             addi         sp, s7, 1528
                  mulhsu       zero, s3, tp
                  rem          t6, a2, s2
                  c.and        a1, a4
                  beq          s9, s8, 2488f
2488:             rem          t2, tp, a4
                  sll          s3, a2, s6
                  c.slli       t3, 6
                  c.nop
2492:             andi         s0, zero, 890
                  add          a3, s8, s10
                  divu         s10, t5, gp
                  blt          t2, s9, 2513f
                  c.lui        s9, 11
                  nop
                  bltu         gp, gp, 2506f
                  c.bnez       s1, 2514f
                  c.xor        a3, a5
                  auipc        a0, 152518
                  srai         a4, zero, 14
                  andi         s5, a4, -58
                  slt          s7, s6, a0
                  srl          ra, t4, t6
2506:             div          s6, sp, s0
                  remu         t6, a2, t2
                  c.lui        t4, 6
                  c.xor        s0, a1
                  srli         s11, t3, 31
                  rem          t1, s3, a2
                  sll          a2, s3, t6
2513:             div          s9, a6, t1
2514:             sltiu        s11, t0, -28
                  c.li         t5, 9
                  c.slli       s2, 31
                  bgeu         s5, s1, 2526f
                  xori         t3, s11, -1135
                  c.srli       a2, 13
                  sub          s4, s10, s4
                  addi         zero, s10, 774
                  divu         ra, s10, a4
                  lui          s9, 321597
                  slt          sp, s10, sp
                  mul          s9, t2, a3
2526:             c.and        s1, a1
                  c.addi       s6, -1
                  rem          s5, s4, a5
                  mul          t6, a4, t4
                  bge          s10, s7, 2539f
                  mulhsu       s1, s6, a0
                  mulh         t0, a0, t2
                  c.bnez       a0, 2549f
                  c.nop
                  c.and        s1, a3
                  blt          sp, t6, 2540f
                  lui          s6, 209894
                  c.slli       s1, 4
2539:             ori          s0, s3, 203
2540:             addi         a4, gp, 1438
                  c.slli       s4, 6
                  c.andi       a2, -1
                  xori         a7, a5, 749
                  addi         a0, s1, 1669
                  blt          a7, t1, 2546f
2546:             c.nop
                  bgeu         t4, t0, 2561f
                  srli         s9, sp, 24
2549:             slt          zero, s7, a4
                  sub          s3, a0, a4
                  c.slli       t3, 3
                  auipc        a7, 823692
                  sltu         s7, a2, s2
                  c.slli       s11, 27
                  and          s7, s9, a3
                  srl          s9, t5, a3
                  c.xor        s0, a2
                  sltu         a0, a1, t2
                  xori         t6, t4, -1166
                  sltiu        s0, a1, 1594
2561:             bgeu         a3, s2, 2579f
                  rem          a3, ra, s9
                  auipc        zero, 287525
                  mulhsu       s10, t5, a0
                  c.mv         a0, a2
                  c.sub        s1, a1
                  andi         t3, s3, 1525
                  bgeu         a3, t4, 2580f
                  srli         s2, a1, 17
                  beq          a2, gp, 2578f
                  c.sub        a3, a1
                  c.sub        a4, a2
                  mulh         s3, zero, t5
                  beq          t1, a5, 2583f
                  c.sub        a2, a1
                  auipc        a3, 528494
                  and          t0, s3, a0
2578:             sltiu        s1, a0, -1048
2579:             mulhu        a4, s0, s8
2580:             c.xor        a0, a4
                  c.srli       a2, 1
                  c.li         ra, 4
2583:             remu         s4, t1, a5
                  c.nop
                  c.addi16sp   sp, 416
                  div          s6, s10, a7
                  sltu         t2, s0, a0
                  divu         a1, s8, s3
                  sll          a4, s1, s2
                  slti         s9, a0, 363
                  sltiu        s3, s1, 1953
                  xor          t2, s0, s11
                  sra          s0, t6, s2
                  c.beqz       a4, 2606f
                  mulhu        s6, a7, s11
                  xor          a1, a6, a5
                  bne          s0, s9, 2604f
                  sll          s10, s3, a1
                  c.xor        s0, a2
                  sub          s4, s1, a7
                  add          t3, ra, t6
                  sub          a0, a5, t4
                  c.srai       a2, 10
2604:             bge          a2, ra, 2621f
                  add          s7, sp, s0
2606:             divu         gp, sp, t2
                  andi         ra, t2, -1375
                  bgeu         gp, t0, 2627f
                  c.bnez       a4, 2614f
                  auipc        zero, 1008984
                  bltu         a3, gp, 2625f
                  bgeu         t6, ra, 2630f
                  c.add        s10, t2
2614:             c.li         s5, -1
                  c.addi4spn   s0, sp, 544
                  mul          a0, s9, s4
                  bgeu         t3, t0, 2632f
                  c.addi       s3, -1
                  sub          zero, t3, t4
                  sltiu        sp, a4, 534
2621:             c.andi       a1, -1
                  sub          gp, a0, s10
                  srl          s6, t1, t1
                  mul          t0, tp, t5
2625:             auipc        s10, 489838
                  remu         gp, s11, a3
2627:             srai         t6, s7, 6
                  c.nop
                  divu         t0, s9, zero
2630:             sltiu        s5, s0, 1114
                  slli         zero, t4, 6
2632:             mulhu        s4, ra, zero
                  c.li         a0, 25
                  mulhu        t4, a0, zero
                  mul          s4, a0, a3
                  bne          s10, a6, 2640f
                  c.srli       a3, 30
                  srli         a4, s6, 24
                  or           s1, t6, t5
2640:             c.xor        s0, s1
                  c.bnez       a2, 2655f
                  bne          s7, t5, 2650f
                  sll          s10, s10, s1
                  blt          a7, s3, 2648f
                  or           ra, s0, tp
                  or           gp, s9, s1
                  slti         s7, ra, 549
2648:             bne          a0, s11, 2667f
                  mul          s11, s10, s9
2650:             or           t1, t3, s4
                  slti         t4, s8, -540
                  mulhsu       zero, s5, sp
                  c.addi4spn   s0, sp, 736
                  and          a4, s2, a7
2655:             c.add        t4, t0
                  auipc        s6, 625287
                  c.li         s6, -1
                  mulhsu       s2, a3, a0
                  bgeu         s6, t2, 2660f
2660:             xor          s5, s5, t5
                  sra          s10, t5, s11
                  c.addi       s10, -1
                  bltu         a7, a4, 2680f
                  lui          zero, 167123
                  c.bnez       s0, 2683f
                  mulhu        gp, a3, a2
2667:             c.addi       a7, -1
                  c.beqz       s1, 2674f
                  beq          a2, t6, 2684f
                  sltu         s8, s9, gp
                  bltu         tp, s4, 2680f
                  addi         s9, s10, 283
                  divu         s0, t5, s3
2674:             c.add        a1, s3
                  beq          s0, s9, 2676f
2676:             sltu         s3, a1, s1
                  sub          t0, ra, a5
                  xori         a7, gp, 666
                  sra          a2, a2, t0
2680:             c.addi4spn   s1, sp, 736
                  xori         s6, sp, 1213
                  c.li         a1, -1
2683:             beq          sp, ra, 2691f
2684:             c.beqz       s1, 2699f
                  c.slli       s7, 30
                  mulhsu       s6, zero, s4
                  remu         t5, s5, s10
                  beq          zero, gp, 2697f
                  c.nop
                  c.srli       a1, 24
2691:             nop
                  remu         s3, t1, s0
                  bltu         a7, t6, 2707f
                  divu         s1, a2, t4
                  slt          t2, s11, s9
                  xori         a0, t5, 830
2697:             sub          ra, a1, a5
                  c.xor        s0, s1
2699:             bne          s9, sp, 2717f
                  c.addi4spn   s0, sp, 896
                  xori         s4, s8, -1873
                  addi         t0, t3, 1740
                  mulhu        t0, s8, a2
                  sltiu        t4, tp, 767
                  bltu         s4, s5, 2721f
                  divu         s5, ra, s3
2707:             srl          t1, a0, a3
                  srai         a2, s8, 31
                  ori          zero, t0, -1324
                  c.beqz       s1, 2729f
                  c.and        a1, s0
                  slt          gp, s11, t0
                  divu         s11, t4, a0
                  xor          t6, s4, s1
                  ori          a0, s5, -663
                  mulhsu       s4, t2, a3
2717:             c.sub        s0, a2
                  c.addi4spn   a0, sp, 64
                  or           t4, a5, gp
                  rem          t3, t6, a5
2721:             c.nop
                  xori         sp, ra, -1060
                  la           s7, amo_0+0 #start riscv_amo_instr_stream_20
                  la           s11, amo_0+4
                  c.srai       a1, 1
                  amoor.w.rl    t5, a1, (s7)
                  amoand.w      a2, t3, (s7)
                  amoor.w       t3, s5, (s11)
                  amomax.w      s8, s0, (s11)
                  amoadd.w.rl   a4, s4, (s7)
                  srl          t3, gp, zero
                  amomax.w.rl   s6, a4, (s11)
                  c.addi16sp   sp, -16
                  c.andi       a0, 7
                  amoswap.w     s10, s2, (s11)
                  amoand.w.rl   t5, s9, (s11)
                  srl          t4, t1, a4
                  c.li         t2, -1
                  amominu.w     ra, t5, (s7) #end riscv_amo_instr_stream_20
                  andi         a3, s4, -90
                  c.andi       s0, -1
                  remu         ra, s7, s1
                  slli         s7, gp, 26
                  blt          a0, s4, 2728f
2728:             beq          s5, a3, 2740f
2729:             bltu         s6, t6, 2743f
                  sltiu        t1, s0, 1760
                  c.lui        s2, 8
                  c.add        t6, a3
                  auipc        a7, 429654
                  auipc        t1, 173455
                  c.sub        a4, a4
                  rem          s6, t6, a1
                  and          ra, s0, s4
                  beq          ra, t3, 2747f
                  rem          a2, s11, zero
2740:             sub          s7, a7, a6
                  bgeu         a1, t2, 2749f
                  or           s7, t1, t2
2743:             c.srli       a0, 15
                  mulhsu       s6, tp, s8
                  and          s8, s8, a3
                  c.lui        gp, 26
2747:             xori         gp, a2, -1975
                  sll          a2, t4, s0
2749:             c.addi16sp   sp, -16
                  c.lui        t0, 19
                  nop
                  sll          s1, s8, zero
                  xor          a0, s3, t1
                  c.bnez       a4, 2759f
                  c.nop
                  c.beqz       a4, 2774f
                  mulh         s7, s0, sp
                  c.or         s1, a0
2759:             and          a7, a6, sp
                  srl          s2, t2, s0
                  ori          a1, ra, -1645
                  c.or         s1, a2
                  c.bnez       a4, 2775f
                  c.addi       s11, -1
                  srl          a1, s10, gp
                  c.bnez       a1, 2773f
                  xori         t4, s11, 635
                  c.andi       a4, 31
                  bne          s4, t0, 2770f
2770:             bgeu         t0, s7, 2778f
                  sltiu        s9, a3, 655
                  xor          gp, tp, t4
2773:             sra          s5, s4, s5
2774:             c.beqz       s1, 2782f
2775:             div          s6, s1, s9
                  andi         a7, a4, 707
                  c.srai       a3, 10
2778:             c.addi4spn   a3, sp, 176
                  div          a3, s1, s7
                  ori          t3, s0, 12
                  lui          t1, 788823
2782:             c.lui        t6, 18
                  remu         t4, s1, a6
                  sub          s9, s4, s7
                  xor          sp, tp, a7
                  bne          s6, s7, 2800f
                  ori          a2, a4, 621
                  slti         zero, s9, -1536
                  divu         sp, t6, a5
                  or           t3, t4, t1
                  c.addi       s6, 21
                  xori         t0, t6, -363
                  andi         s2, sp, -1994
                  xor          t2, ra, t3
                  add          s5, sp, ra
                  c.srli       s0, 7
                  c.nop
                  blt          t6, t5, 2805f
                  c.bnez       s1, 2817f
2800:             and          t4, s2, s0
                  lui          s3, 59738
                  andi         s2, t1, -298
                  srai         s11, s1, 26
                  divu         s3, a3, ra
2805:             srli         s1, t6, 1
                  remu         s4, t6, t3
                  nop
                  c.addi16sp   sp, -16
                  c.srai       a4, 7
                  sub          t4, gp, a0
                  or           t4, a6, a5
                  c.sub        s0, a3
                  c.add        a2, s3
                  c.beqz       a4, 2829f
                  bltu         s0, s8, 2820f
                  c.srai       a0, 2
2817:             slli         s6, s9, 16
                  c.srli       a2, 23
                  bltu         a4, t2, 2838f
2820:             c.addi4spn   a0, sp, 864
                  mul          t1, a4, t0
                  c.xor        a2, a3
                  div          s5, ra, a6
                  mulh         zero, ra, t6
                  c.andi       a0, -1
                  mulhu        s2, t3, s0
                  c.lui        t4, 16
                  slti         t3, a4, 1966
2829:             c.add        a3, gp
                  bltu         s8, s11, 2839f
                  c.or         a4, a3
                  sltu         s5, s8, sp
                  bge          a4, a3, 2847f
                  srl          a4, t6, s3
                  c.addi4spn   a2, sp, 80
                  la           s5, region_1+344 #start riscv_load_store_rand_instr_stream_3
                  lbu          s8, 1(s5)
                  sltiu        a3, zero, -1316
                  auipc        ra, 960131
                  srl          a1, s5, t0
                  lhu          t5, -16(s5)
                  c.li         a1, -1
                  sb           gp, 10(s5)
                  c.and        a3, a0
                  sh           s5, 0(s5)
                  lbu          t5, 15(s5)
                  srli         sp, t3, 24
                  sh           s2, 12(s5)
                  c.sub        a2, s0
                  mulhsu       a1, tp, s11
                  sw           a7, 8(s5)
                  sb           s7, -11(s5)
                  sra          s7, gp, t6
                  lbu          s6, 4(s5)
                  c.addi16sp   sp, 400
                  c.sub        s1, s1
                  rem          gp, a3, tp
                  or           a4, ra, t6
                  and          s2, s3, a5
                  c.srai       a3, 25
                  divu         a3, s0, s1
                  slli         t3, a3, 31
                  lw           s6, 8(s5)
                  c.lui        s4, 11
                  c.addi16sp   sp, 320
                  sb           a6, 5(s5)
                  auipc        sp, 892665
                  lh           sp, -6(s5) #end riscv_load_store_rand_instr_stream_3
                  srli         s10, s2, 23
                  div          t4, a6, s7
2838:             lui          a2, 64628
2839:             srl          s1, zero, t1
                  c.addi16sp   sp, -16
                  slli         s4, s9, 29
                  srl          s11, s1, s11
                  add          a1, t3, a4
                  srl          a4, a2, s10
                  c.andi       a2, 17
                  andi         s11, s6, 1656
2847:             sub          a3, a0, t1
                  c.srai       a4, 12
                  sra          a0, s7, t0
                  sltu         t5, s5, a2
                  beq          s1, s1, 2869f
                  auipc        gp, 984723
                  sub          s3, s3, t0
                  srli         a1, a7, 15
                  addi         t5, t5, 1028
                  remu         s8, gp, a6
                  mulhsu       s8, a4, s4
                  c.addi16sp   sp, 432
                  c.srai       s1, 20
                  c.and        a2, a0
                  sltiu        s2, s6, 1599
                  xor          t3, t5, s10
                  c.nop
                  mul          s10, s5, gp
                  c.srai       a4, 17
                  c.addi16sp   sp, -16
                  mul          t3, s4, s11
                  slli         a3, zero, 7
2869:             bgeu         s6, s3, 2884f
                  mulh         a0, zero, ra
                  c.srai       a2, 17
                  c.beqz       a2, 2876f
                  ori          s2, a3, -324
                  c.lui        t5, 7
                  c.and        a3, a2
2876:             beq          t0, s4, 2891f
                  nop
                  ori          a7, s9, 563
                  c.sub        a4, a0
                  c.lui        s2, 10
                  sltu         s8, s6, s8
                  c.sub        s1, a3
                  sltu         t2, t3, s2
2884:             c.srli       a4, 14
                  c.mv         s2, sp
                  sra          s2, s1, a0
                  lui          s10, 749696
                  c.bnez       a1, 2894f
                  c.and        s0, a1
                  mul          s4, a0, a7
2891:             c.addi4spn   a2, sp, 352
                  c.and        a3, s1
                  xor          t5, a0, t1
2894:             or           s3, gp, a4
                  or           t2, sp, a4
                  xor          s2, t4, t2
                  bgeu         s1, s2, 2906f
                  bne          t1, s10, 2914f
                  sub          t6, s7, ra
                  and          t0, ra, s7
                  c.beqz       s1, 2919f
                  c.nop
                  remu         s0, a6, tp
                  sub          s3, s8, s1
                  and          s7, t4, s4
2906:             ori          s3, t2, -660
                  add          t4, s11, s4
                  c.add        a3, s1
                  mulh         ra, a4, a1
                  c.addi       s2, -1
                  c.add        a2, t1
                  srli         t3, s6, 26
                  c.addi       s8, -1
2914:             bge          a1, a5, 2915f
2915:             c.srai       s0, 17
                  c.srli       a3, 19
                  c.andi       a0, -1
                  c.or         a1, a2
2919:             nop
                  c.and        a3, a4
                  c.beqz       s1, 2933f
                  c.addi4spn   a3, sp, 912
                  div          s8, s0, tp
                  blt          s6, sp, 2941f
                  sltu         t4, s6, a5
                  mul          s2, s4, s10
                  xor          a3, a6, a6
                  c.or         s1, a2
                  auipc        s3, 676678
                  rem          s8, t0, zero
                  mulh         gp, t3, t3
                  blt          s11, zero, 2946f
2933:             sltu         t0, a3, t0
                  c.srai       s1, 5
                  c.slli       a7, 1
                  rem          a0, t5, sp
                  c.srli       s1, 14
                  slti         a0, s7, -1370
                  c.mv         s6, s7
                  or           t5, s2, s6
2941:             or           a1, a0, a7
                  rem          ra, zero, s7
                  c.addi16sp   sp, 448
                  nop
                  sra          t1, gp, s6
2946:             slti         zero, s8, -868
                  remu         t2, tp, s5
                  nop
                  srai         a1, s8, 2
                  addi         s3, s9, -1850
                  ori          s10, a2, -701
                  rem          t2, s10, s8
                  srli         gp, ra, 25
                  or           s8, a1, a3
                  lui          t3, 345333
                  c.addi       a7, 6
                  addi         t3, s11, -1901
                  c.srli       a2, 18
                  c.sub        a1, a2
                  sra          t1, a2, a6
                  la           sp, region_0+1747 #start riscv_load_store_hazard_instr_stream_12
                  lbu          t1, -65(sp)
                  lb           t1, -65(sp)
                  sb           tp, -65(sp)
                  sh           a2, -65(sp)
                  sb           s7, -65(sp)
                  andi         s2, s5, -1756
                  add          t4, t6, s1
                  sb           s8, -65(sp)
                  lh           s5, -65(sp)
                  lhu          s5, -65(sp)
                  lhu          gp, -65(sp)
                  c.srai       a3, 26
                  sb           a2, -65(sp)
                  sb           a3, -65(sp) #end riscv_load_store_hazard_instr_stream_12
                  sub          zero, s6, a0
                  c.addi       a0, 26
                  srl          t4, zero, s0
                  c.sub        a0, s1
                  c.addi16sp   sp, 416
                  slli         t0, a0, 20
                  add          t1, t0, s4
                  xori         sp, s8, -1737
                  sltu         s2, a1, s7
                  lui          s10, 726673
                  c.addi       s8, 5
                  auipc        ra, 443596
                  or           s5, zero, s9
                  auipc        t6, 734399
                  ori          s7, a3, -1138
                  srl          a3, a0, t1
                  c.andi       a3, -1
                  sll          s9, sp, t1
                  rem          s10, t2, s3
                  sra          t2, t4, t0
                  c.nop
                  c.sub        a3, a1
                  add          s3, s4, sp
                  srl          ra, a4, a3
                  c.sub        a4, a3
                  sub          s8, s11, t0
                  c.addi       s1, -1
                  auipc        s3, 102370
                  c.beqz       s1, 2997f
                  c.srli       a4, 22
                  srai         s2, s4, 8
                  c.or         a3, a1
                  srl          t5, s0, a0
                  c.add        s1, t2
                  sltiu        s7, tp, 1176
                  sub          a3, t1, s2
2997:             c.sub        a2, s0
                  lui          t1, 971010
                  c.addi       a0, -1
                  bne          s8, s2, 3009f
                  xor          t1, s7, s3
                  sra          t5, tp, s4
                  sltiu        a7, s4, -1402
                  srai         s0, a4, 18
                  srli         t2, t4, 15
                  sub          zero, s0, s2
                  remu         s2, s10, a1
                  slt          s2, s4, a1
3009:             sub          s3, ra, a5
                  c.and        a1, a1
                  sltu         a0, a2, s5
                  sltiu        ra, s4, 669
                  slli         s8, s0, 28
                  mulh         a1, s10, s9
                  auipc        sp, 710280
                  beq          s2, a6, 3035f
                  slti         a2, a3, 1540
                  mulhsu       t3, s4, s11
                  mulh         s7, s6, gp
                  c.andi       a2, 19
                  xor          s0, s5, s10
                  bgeu         t4, a2, 3040f
                  c.addi16sp   sp, -16
                  sltu         s6, t4, s5
                  c.srli       a1, 29
                  srli         a2, s5, 17
                  c.addi4spn   a1, sp, 144
                  andi         sp, s11, -480
                  c.andi       a0, -1
                  c.andi       a3, -1
                  bgeu         sp, s1, 3043f
                  andi         a2, a0, 1367
                  blt          s0, s6, 3034f
3034:             or           a4, s6, s2
3035:             c.addi16sp   sp, 368
                  sra          s2, s6, gp
                  c.andi       s0, -1
                  add          a0, t6, t2
                  beq          s11, t1, 3043f
3040:             add          a1, a7, s2
                  c.or         s1, s0
                  sltiu        s7, s5, 100
3043:             c.beqz       a3, 3057f
                  c.andi       a1, -1
                  c.andi       a2, 3
                  addi         a7, gp, -103
                  bge          s6, a5, 3051f
                  c.beqz       a2, 3066f
                  sra          s6, a6, t6
                  c.add        s8, gp
3051:             c.lui        s5, 12
                  rem          s7, a7, a0
                  c.or         a4, a4
                  rem          s7, t0, a2
                  add          t6, a3, s5
                  slt          a3, a5, gp
3057:             andi         s3, a2, -507
                  and          a0, t4, s2
                  bge          s5, a7, 3078f
                  c.nop
                  remu         s6, a7, a7
                  addi         s9, s7, -1635
                  addi         s8, t2, 1900
                  slt          a2, tp, t2
                  beq          s1, gp, 3069f
3066:             blt          ra, s7, 3067f
3067:             c.xor        a4, a1
                  c.xor        a1, s0
3069:             slti         t5, t0, 1652
                  c.srli       s1, 11
                  xor          s11, a6, sp
                  c.add        a4, t3
                  c.slli       s8, 16
                  mulh         s2, a4, s8
                  c.addi16sp   sp, 288
                  and          s2, s0, a3
                  auipc        ra, 926829
3078:             c.xor        a4, a4
                  slt          s4, a6, a0
                  andi         s5, t2, -925
                  xor          a1, ra, t0
                  c.add        t2, t1
                  c.or         a3, s1
                  mulhu        s3, t0, zero
                  c.bnez       a4, 3086f
3086:             xor          s9, a7, a7
                  c.mv         a3, tp
                  c.srai       a3, 23
                  sltiu        zero, s6, -556
                  bne          tp, t1, 3102f
                  c.srai       a3, 1
                  c.add        a1, t5
                  c.addi       t5, -1
                  auipc        gp, 671524
                  c.slli       sp, 3
                  mulh         s0, t6, zero
                  remu         a1, s7, gp
                  beq          s7, s7, 3114f
                  xori         s8, s9, 1176
                  andi         t0, tp, -1042
                  mulhu        s2, s4, s8
3102:             addi         s2, s4, -981
                  xori         a4, s6, 1149
                  c.nop
                  c.and        a1, a5
                  ori          s4, t5, -1231
                  c.add        t2, s6
                  c.add        s11, s6
                  or           t1, tp, t4
                  c.mv         s5, a3
                  sll          s11, s3, a2
                  c.bnez       a1, 3130f
                  slli         a4, gp, 11
3114:             addi         a2, a3, -1811
                  sll          s0, t5, a5
                  mulh         ra, zero, s4
                  c.add        a4, t4
                  andi         t0, s10, 1560
                  c.and        s1, s1
                  ori          s9, t2, 150
                  c.or         a0, s1
                  blt          a7, sp, 3137f
                  sll          s2, t0, s8
                  c.srli       s0, 3
                  blt          t3, ra, 3143f
                  srl          s1, t1, ra
                  add          ra, t0, s8
                  div          t2, s9, a0
                  mul          sp, tp, a6
3130:             c.slli       t3, 17
                  c.mv         t6, a7
                  c.srai       a0, 15
                  divu         zero, a4, s9
                  bltu         t4, s3, 3146f
                  or           t1, t6, s9
                  auipc        s3, 605421
3137:             andi         s10, a6, 1458
                  c.li         s4, 3
                  div          s3, s9, a5
                  c.srai       a0, 2
                  bge          t1, a6, 3159f
                  blt          t4, s3, 3159f
3143:             divu         s7, a2, t1
                  sub          s10, s1, a6
                  sub          s8, s4, t0
3146:             slli         a2, s7, 23
                  xor          zero, a0, t4
                  xori         t5, t3, -663
                  beq          s4, a2, 3168f
                  c.li         s4, 2
                  c.add        s11, t6
                  slli         s10, t5, 3
                  c.addi       t1, 8
                  blt          a5, t3, 3162f
                  bge          s0, a0, 3156f
3156:             remu         t3, s10, a0
                  andi         gp, t6, -536
                  c.bnez       s0, 3173f
3159:             rem          s11, t6, a6
                  bge          s8, t1, 3166f
                  bgeu         t0, s0, 3176f
3162:             blt          s6, t3, 3170f
                  c.li         t2, -1
                  c.slli       a0, 10
                  bge          t3, s1, 3170f
3166:             slt          s11, s3, t3
                  or           s6, t1, t6
3168:             c.nop
                  bltu         a4, t2, 3176f
3170:             divu         s10, s9, s0
                  srl          s11, a4, a1
                  add          ra, a4, zero
3173:             bgeu         a6, a5, 3182f
                  c.lui        a0, 24
                  mulhu        sp, a7, a3
3176:             c.xor        a4, a4
                  andi         sp, sp, -1734
                  mulhsu       s1, s4, s5
                  c.slli       t2, 13
                  srai         t4, t5, 27
                  div          s10, tp, t6
3182:             c.srai       a4, 10
                  bltu         s8, zero, 3197f
                  slli         sp, t1, 15
                  c.li         a0, -1
                  srli         a3, a6, 29
                  xor          t6, s2, s7
                  c.beqz       a1, 3197f
                  sub          t4, sp, s6
                  ori          t4, s9, -292
                  c.srai       a3, 3
                  remu         t4, s11, a3
                  div          t4, t0, s0
                  nop
                  c.nop
                  c.addi16sp   sp, 176
3197:             or           t5, s11, a1
                  srai         a3, s4, 24
                  c.srli       s0, 12
                  c.addi       a4, 31
                  c.nop
                  div          a1, s7, s2
                  ori          s4, gp, -1606
                  c.mv         a7, t5
                  c.andi       a0, -1
                  c.srai       s0, 23
                  srl          gp, a1, s11
                  xor          s1, a3, a6
                  c.lui        s5, 23
                  c.addi4spn   a3, sp, 32
                  c.or         a4, s1
                  c.beqz       s0, 3221f
                  c.addi4spn   a2, sp, 976
                  sltu         s9, s0, t1
                  lui          t0, 486530
                  sll          a1, a0, a1
                  mul          gp, s0, a4
                  or           s8, a6, t0
                  addi         s5, s1, -1825
                  c.lui        s9, 10
3221:             srl          a0, t5, t2
                  bge          s9, t2, 3236f
                  c.sub        a1, a0
                  bgeu         s9, s6, 3232f
                  srai         t0, s8, 15
                  remu         sp, s5, s11
                  c.addi       s3, 7
                  nop
                  lui          gp, 40620
                  addi         s8, s2, 1193
                  auipc        t5, 455069
3232:             xor          s10, gp, a1
                  srai         t3, a5, 24
                  ori          a7, s2, -1463
                  bgeu         t1, a3, 3251f
3236:             c.sub        a2, s1
                  addi         a0, a4, -1050
                  mulh         s10, s3, a5
                  slti         a2, gp, 700
                  c.mv         a1, s6
                  slt          s7, t5, s5
                  andi         s9, s3, 718
                  c.and        a3, a0
                  c.addi4spn   a4, sp, 624
                  sll          sp, s7, tp
                  bgeu         a2, t3, 3261f
                  auipc        s6, 442157
                  sltu         a1, t6, a4
                  c.mv         a0, s2
                  andi         t1, s3, -1801
3251:             c.li         gp, -1
                  divu         s11, a1, s2
                  c.beqz       a2, 3254f
3254:             div          s5, s5, s4
                  blt          gp, tp, 3273f
                  c.bnez       a4, 3264f
                  c.li         s2, -1
                  c.or         s1, a5
                  mulhsu       ra, t2, t3
                  srl          s0, a4, a1
3261:             addi         s11, a1, -916
                  sltiu        sp, t4, -980
                  bgeu         sp, a6, 3277f
3264:             sltiu        s9, zero, 1048
                  c.nop
                  bne          t2, t3, 3270f
                  c.bnez       s1, 3281f
                  c.mv         s11, t5
                  c.addi16sp   sp, 16
3270:             andi         s11, t5, -801
                  andi         gp, zero, -538
                  sll          a2, t0, s2
3273:             bltu         s2, s4, 3285f
                  addi         s7, t6, 620
                  c.srli       a4, 30
                  c.or         a4, a5
3277:             slli         s7, s0, 11
                  c.mv         a2, t0
                  c.bnez       a2, 3288f
                  lui          t6, 47390
3281:             ori          t1, s6, 1052
                  slli         s9, s3, 2
                  srl          a1, s2, s11
                  c.lui        s10, 21
3285:             c.beqz       a2, 3291f
                  bgeu         zero, a3, 3290f
                  slli         t2, gp, 21
3288:             srl          t1, a6, sp
                  c.srli       a0, 3
3290:             sltiu        t1, zero, 160
3291:             mulhsu       a4, t1, s7
                  c.add        t4, a6
                  c.and        s0, a0
                  mulh         s3, s7, t1
                  c.srli       a3, 4
                  srl          a1, a3, a2
                  mulhsu       t0, s0, s0
                  c.mv         s6, t6
                  xori         gp, a2, -1477
                  sll          t2, t5, gp
                  c.slli       s11, 11
                  c.srai       s1, 23
                  mul          s7, a5, tp
                  nop
                  mul          t3, t3, sp
                  add          zero, a3, s0
                  and          a2, zero, s2
                  c.or         a4, a2
                  c.addi       t6, -1
                  and          a0, s8, t3
                  nop
                  sra          s4, s8, a4
                  c.mv         s5, s10
                  sltu         t6, s11, a1
                  sub          a0, t1, s8
                  add          s3, a1, s3
                  bne          t2, a5, 3335f
                  c.srai       s0, 13
                  lui          s11, 519802
                  c.or         a2, a4
                  c.and        s1, a2
                  bltu         t0, t2, 3330f
                  div          sp, s10, s2
                  sltu         s1, sp, s1
                  srli         t3, a7, 3
                  c.srli       a4, 15
                  and          a2, s1, sp
                  beq          tp, s6, 3342f
                  add          ra, t4, a5
3330:             beq          a5, s6, 3345f
                  c.nop
                  sltu         a4, s5, s9
                  c.or         s0, a4
                  slt          t1, zero, t4
3335:             c.mv         a0, t0
                  c.li         a0, 28
                  xori         zero, zero, 1844
                  c.add        t3, t3
                  c.srli       a1, 12
                  divu         a7, a2, s8
                  c.beqz       a0, 3350f
3342:             bltu         gp, t6, 3360f
                  c.beqz       a1, 3350f
                  c.mv         t1, s0
3345:             c.addi       t1, 8
                  lui          a4, 680079
                  xor          s7, t2, t2
                  sltiu        a1, s11, 188
                  bgeu         t5, s2, 3357f
3350:             c.srai       a0, 16
                  slt          s6, t5, s3
                  mulhsu       s2, t2, ra
                  lui          t3, 487149
                  c.sub        a3, a0
                  c.beqz       a0, 3356f
3356:             slli         zero, s7, 20
3357:             mul          gp, s5, sp
                  and          s9, a2, s1
                  bltu         s8, s4, 3377f
3360:             c.mv         t5, t3
                  bltu         s2, s9, 3362f
3362:             c.addi       t5, -1
                  bltu         t4, t2, 3375f
                  remu         ra, s6, t4
                  c.or         a3, a3
                  sltiu        gp, a7, 426
                  bne          s6, s9, 3382f
                  c.addi4spn   a3, sp, 208
                  c.addi4spn   a1, sp, 352
                  andi         s0, sp, -296
                  slli         s3, t0, 25
                  srli         t4, s4, 5
                  mul          s4, a2, s4
                  c.andi       a2, 12
3375:             lui          t6, 475213
                  c.lui        s10, 8
3377:             slt          t5, s7, sp
                  bge          s1, t2, 3383f
                  c.sub        a0, s1
                  mul          a4, a1, ra
                  srl          s8, a1, a5
3382:             c.sub        a1, a5
3383:             sub          a3, s5, s11
                  xori         s1, s0, -240
                  lui          sp, 435017
                  c.andi       a0, 23
                  c.xor        s0, a1
                  sll          s6, ra, s0
                  sra          s7, a5, s2
                  srai         a0, s6, 25
                  srl          s6, t5, t4
                  beq          a2, s11, 3401f
                  srli         s5, s5, 19
                  xor          s1, a6, s10
                  slli         s5, a3, 3
                  addi         ra, s6, -1192
                  rem          t0, t0, a0
                  c.beqz       a1, 3415f
                  c.srai       a3, 4
                  slti         a7, a5, -1629
3401:             bgeu         s8, s4, 3420f
                  bne          s6, t3, 3421f
                  blt          tp, t6, 3422f
                  c.xor        a0, a4
                  sltiu        s4, t1, 872
                  c.or         a3, a0
                  mulhu        a0, s11, t2
                  auipc        t3, 901859
                  srl          s3, a1, t3
                  mulhsu       t5, s2, s0
                  xor          gp, s5, a4
                  divu         a0, ra, a7
                  add          a4, a0, a1
                  slt          s5, a7, a4
3415:             sltiu        s9, a6, 1179
                  c.sub        a0, a3
                  c.li         a0, -1
                  c.addi16sp   sp, -16
                  nop
3420:             c.xor        s0, a1
3421:             add          s10, a6, ra
3422:             xor          t1, s7, s9
                  beq          a6, s7, 3438f
                  divu         a7, a2, t5
                  srai         s7, t6, 22
                  c.addi       a1, -1
                  c.addi4spn   a1, sp, 832
                  bge          t6, s1, 3436f
                  c.and        s1, s0
                  auipc        zero, 667598
                  c.li         a1, -1
                  mulhu        s0, t1, t1
                  slt          s5, t5, s10
                  sra          t6, s2, gp
                  or           s5, t5, t4
3436:             add          s0, s11, s11
                  or           s3, t0, s6
3438:             rem          s0, s8, s9
                  nop
                  xor          s10, s2, t4
                  c.srai       s1, 20
                  c.lui        gp, 9
                  slli         t1, t5, 25
                  bgeu         a2, a4, 3458f
                  srli         t2, s4, 26
                  c.bnez       s0, 3464f
                  beq          s2, s3, 3452f
                  add          s0, s5, t6
                  c.addi16sp   sp, -16
                  c.addi4spn   s1, sp, 432
                  sltu         gp, t6, a3
3452:             c.srli       s0, 30
                  andi         s3, t2, 1809
                  bgeu         zero, s1, 3462f
                  c.lui        t2, 9
                  nop
                  bne          a0, s11, 3471f
3458:             c.add        sp, s2
                  bge          t1, a5, 3471f
                  c.andi       a1, 2
                  remu         s5, a5, t0
3462:             or           s8, s5, t3
                  srai         t4, t5, 26
3464:             bne          ra, t1, 3480f
                  div          t4, ra, s7
                  nop
                  andi         t3, s1, 580
                  lui          s6, 82482
                  addi         s1, t1, -1732
                  add          s9, t5, a3
3471:             bgeu         a6, a2, 3478f
                  divu         a0, tp, s3
                  sltiu        s9, ra, 440
                  c.li         ra, -1
                  or           a0, s4, s3
                  sra          t6, s11, s8
                  c.xor        a0, a2
3478:             bne          ra, s9, 3479f
3479:             c.slli       s4, 14
3480:             sra          s11, s4, s7
                  c.lui        a7, 8
                  c.srli       a1, 10
                  mulhsu       s5, gp, t4
                  c.and        a4, a1
                  bltu         a4, a4, 3503f
                  remu         s3, tp, a0
                  add          a2, s1, a2
                  c.andi       a1, -1
                  remu         ra, s6, a4
                  add          s8, a7, s1
                  c.nop
                  lui          a0, 477698
                  and          a2, s5, a5
                  c.andi       s1, -1
                  divu         a7, a6, s3
                  c.srai       s0, 14
                  andi         t4, a1, 213
                  c.srai       a4, 12
                  sra          s3, s11, s4
                  c.addi       t1, 1
                  mulhsu       s5, tp, s11
                  slt          s10, s8, a6
3503:             slli         s5, s0, 30
                  srli         t0, ra, 22
                  c.addi16sp   sp, 384
                  srai         sp, ra, 24
                  sub          ra, a6, a1
sub_3_75:         jal          t6, 0f
0:                c.jal        8f
1:                c.j          9f
2:                jal          ra, 4f
3:                c.jal        1b
4:                c.j          10f
5:                jal          ra, 11f
6:                jal          ra, 7f
7:                c.j          2b
8:                c.j          3b
9:                c.jal        6b
10:               jal          s11, 5b
11:               c.xor        a3, a0
                  ori          s10, zero, -1082
                  c.andi       s0, -1
                  blt          s1, a7, 3511f
3511:             c.srai       s0, 1
                  slt          s9, a1, s3
                  c.or         s1, a5
                  sub          t1, a5, s1
                  c.srai       s1, 10
                  lui          s2, 177503
                  beq          a7, t4, 3521f
                  div          t5, a0, t1
                  c.srli       a3, 28
                  mulhu        sp, a7, t0
3521:             beq          s4, s3, 3536f
                  c.li         a3, 24
                  slt          a3, a4, ra
                  lui          t0, 895857
                  c.bnez       a0, 3533f
                  srai         t3, s0, 9
                  xor          zero, ra, s9
                  beq          tp, a5, 3529f
3529:             or           s6, a3, s2
                  slti         t4, a0, 780
                  mulhu        t6, s0, a3
                  srli         a1, t4, 18
3533:             c.slli       ra, 31
                  bne          s9, a0, 3538f
                  c.addi4spn   a4, sp, 784
3536:             c.andi       a1, -1
                  sra          s9, tp, s1
3538:             addi         t5, ra, 1760
                  slti         t4, zero, -463
                  c.nop
                  slt          a1, gp, s2
                  or           a7, t6, sp
                  slt          s8, s7, s1
                  mul          t2, s11, s7
                  andi         t3, t2, 432
                  c.add        s0, tp
                  and          t4, s7, t1
                  bgeu         gp, s0, 3566f
                  addi         s4, t1, 1518
                  mulh         a1, s1, t4
                  slti         a7, t6, -1761
                  ori          s2, s9, 621
                  sltu         s5, s6, s2
                  srai         a4, t1, 15
                  blt          s0, s0, 3572f
                  addi         a0, a6, -1199
                  mul          s5, a2, s8
                  c.addi       t3, 13
                  slt          t1, t6, sp
                  remu         s11, a4, s5
                  sra          a1, s8, ra
                  c.bnez       s1, 3581f
                  c.srli       s1, 20
                  mul          t2, tp, sp
                  divu         a0, a6, a0
3566:             c.srai       s0, 31
                  c.or         a4, s1
                  c.beqz       a3, 3580f
                  c.lui        t1, 24
                  rem          s10, t1, a0
                  slli         t5, s7, 6
3572:             c.srli       a1, 29
                  beq          a1, s5, 3582f
                  srl          t3, gp, t3
                  sra          t6, t2, a0
                  srl          s9, a1, tp
                  c.and        s1, a1
                  beq          gp, tp, 3584f
                  sub          s11, s2, s7
3580:             c.addi       s11, 24
3581:             rem          s4, s4, a5
3582:             c.or         a1, a4
                  add          s0, s4, t5
3584:             sll          s0, s9, t4
                  bne          s6, t1, 3603f
                  mulhsu       t2, a0, t0
                  c.addi4spn   s1, sp, 992
                  div          a0, t0, t4
                  c.add        s1, s4
                  auipc        t4, 118834
                  xori         gp, zero, 2017
                  nop
                  c.or         a4, a2
                  sra          zero, sp, a7
                  c.beqz       a3, 3604f
                  slti         t3, t3, -1531
                  bltu         t5, zero, 3606f
                  sra          zero, s9, s7
                  c.xor        a4, a4
                  lui          a1, 236205
                  divu         ra, s5, s1
                  nop
3603:             remu         s2, s9, gp
3604:             c.addi       s9, 24
                  srai         s9, s0, 7
3606:             c.add        s8, t6
                  sltiu        sp, a1, 1328
                  mulh         a7, s8, a4
                  bne          zero, a3, 3623f
                  mulh         a4, s9, gp
                  beq          t3, s0, 3626f
                  sltiu        t5, t5, -1862
                  c.li         s6, -1
                  c.xor        a2, a1
                  mulh         t1, a3, t2
                  c.and        s0, a1
                  c.addi       s1, 20
                  nop
                  c.sub        s0, a4
                  srai         s2, zero, 5
                  bltu         s11, zero, 3629f
                  c.or         a2, a3
3623:             mulhu        s6, t1, a2
                  mulh         s4, s4, a1
                  beq          a1, s5, 3639f
3626:             bgeu         zero, s4, 3633f
                  c.srli       s1, 31
                  beq          t3, t6, 3646f
3629:             bne          zero, s11, 3630f
3630:             bgeu         a0, tp, 3642f
                  ori          s1, s8, -361
                  c.beqz       a3, 3651f
3633:             c.srli       a1, 26
                  mulhsu       s1, a6, t6
                  c.addi       ra, -1
                  sll          a4, a2, s1
                  nop
                  srli         sp, s8, 3
3639:             ori          s6, a5, 968
                  auipc        sp, 341994
                  sub          s9, s2, s10
3642:             c.li         s2, -1
                  andi         a0, a5, -227
                  c.and        a3, a4
                  c.lui        t3, 20
3646:             mul          s4, tp, s0
                  remu         s4, s2, s9
                  c.andi       a3, 10
                  srai         a0, a2, 17
                  remu         ra, ra, s9
3651:             c.lui        a0, 17
                  c.slli       s9, 14
                  c.sub        a3, a2
                  c.mv         a4, a1
                  auipc        gp, 540116
                  bne          a4, a2, 3660f
                  c.lui        a7, 9
                  beq          s6, s0, 3664f
                  sub          s11, s0, a0
3660:             c.addi4spn   a0, sp, 208
                  sub          t3, a6, tp
                  mulh         s8, ra, sp
                  c.li         s5, 12
3664:             c.nop
                  c.srli       a3, 2
                  or           s10, t5, t0
                  c.mv         a7, s4
                  c.addi4spn   a4, sp, 144
                  sub          zero, t4, s2
                  slt          sp, a6, s1
                  c.andi       a0, 27
                  srli         a4, a3, 7
                  c.mv         s5, s2
                  c.and        s0, a5
                  mulhsu       a0, sp, a1
                  c.xor        a3, a3
                  div          s10, t6, t3
                  remu         a3, t4, s3
                  sra          a7, s0, gp
                  div          zero, s7, t0
                  xori         zero, t4, -253
                  c.mv         s6, t1
                  slti         a1, a0, -1089
                  bge          t3, s11, 3692f
                  beq          t1, s8, 3701f
                  c.addi16sp   sp, 464
                  c.slli       s10, 14
                  or           a4, ra, a4
                  add          a1, s6, s2
                  beq          a2, s4, 3708f
                  sltiu        t0, s2, 1087
3692:             c.bnez       a3, 3710f
                  slli         s3, s1, 10
                  c.srli       a3, 4
                  c.srli       a3, 10
                  slti         ra, a4, -1173
                  and          t3, s5, a5
                  c.srli       a1, 2
                  slt          t0, t1, t6
                  sltu         s8, s2, t5
3701:             bne          a7, s2, 3716f
                  c.beqz       s0, 3717f
                  nop
                  c.addi16sp   sp, 384
                  sltu         t1, s9, s6
                  c.slli       ra, 31
                  auipc        t3, 1002201
3708:             beq          s11, s4, 3722f
                  c.sub        a4, a3
3710:             addi         t0, s9, 1236
                  sll          a2, a1, s9
                  srl          t0, s5, s5
                  sltiu        s11, a1, 166
                  sra          s11, t5, a2
                  c.addi16sp   sp, 320
3716:             slt          sp, gp, t2
3717:             xor          a7, zero, a1
                  beq          sp, t2, 3735f
                  slti         t1, s2, 1228
                  c.srli       s1, 4
                  andi         t1, ra, -1394
3722:             div          t4, s11, a4
                  divu         a1, s5, s10
                  c.slli       t3, 19
                  or           ra, gp, a6
                  mul          ra, s4, s11
                  c.beqz       a0, 3731f
                  mulhu        s9, a2, s0
                  mulh         t4, zero, t2
                  c.or         s0, a4
3731:             c.bnez       a3, 3749f
                  sub          s7, s2, t4
                  blt          s6, s1, 3747f
                  remu         zero, s8, s10
3735:             lui          t1, 511613
                  c.srli       a3, 16
                  mulhu        s5, s3, s5
                  bltu         s0, s10, 3747f
                  xori         t2, a2, -1940
                  c.bnez       a1, 3749f
                  slli         sp, t3, 4
                  div          a7, t4, t3
                  beq          a3, t6, 3762f
                  c.lui        s9, 30
                  c.slli       t2, 7
                  c.bnez       a0, 3754f
3747:             bne          a2, s4, 3762f
                  c.sub        a1, s0
3749:             c.xor        s0, a0
                  c.lui        a0, 19
                  slli         s7, a4, 1
                  blt          s2, s0, 3753f
3753:             add          t2, s2, s7
3754:             sub          t3, t5, s5
                  andi         s2, s10, 1118
                  c.lui        a1, 22
                  nop
                  c.or         a0, s1
                  bne          ra, a3, 3768f
                  c.srai       a1, 7
                  c.xor        s1, a2
3762:             c.addi       s5, -1
                  mulh         t4, s1, gp
                  srai         s7, t2, 6
                  c.addi16sp   sp, -16
                  c.nop
                  bne          s0, t0, 3779f
3768:             slli         a3, s4, 24
                  c.mv         a2, sp
                  blt          a6, sp, 3771f
3771:             c.and        a4, s0
                  bgeu         t6, gp, 3777f
                  bne          s3, s7, 3791f
                  c.or         a1, s0
                  ori          s9, tp, -1491
                  sltu         s10, s5, a0
3777:             div          a0, t3, a0
                  c.srai       s1, 8
3779:             mulh         s3, a6, a7
                  c.beqz       a2, 3784f
                  bne          a1, t3, 3796f
                  sltu         a7, sp, s7
                  c.addi4spn   s0, sp, 608
3784:             xori         ra, a3, 503
                  c.and        s1, a2
                  rem          s9, t2, s3
                  auipc        a4, 890042
                  div          t3, s4, t5
sub_3_53:         jal          t6, 3f
0:                c.jal        8f
1:                c.jal        5f
2:                c.jal        0b
3:                c.j          2b
4:                jal          ra, 1b
5:                jal          ra, 6f
6:                jal          ra, 9f
7:                jal          ra, 4b
8:                jal          t1, 7b
9:                c.j          10f
10:               c.j          11f
11:               c.j          12f
12:               srai         a0, t1, 27
                  remu         t5, s5, s10
                  slli         s8, a5, 31
3791:             bge          a3, ra, 3799f
                  slt          t5, t3, t5
                  c.or         a4, a0
                  auipc        zero, 491993
                  c.srai       a4, 16
3796:             remu         gp, s5, s1
                  slli         s1, s8, 12
                  beq          s0, s10, 3803f
3799:             c.slli       s3, 10
                  nop
                  addi         s9, t0, -256
                  bne          s2, a4, 3810f
3803:             c.andi       a2, 20
                  xori         s11, ra, -79
                  srai         s0, a3, 5
                  lui          t3, 1031805
                  c.xor        a0, a3
                  mulh         s5, s5, t5
                  c.srai       s1, 31
3810:             c.nop
                  slli         a7, t3, 10
                  lui          t1, 956505
                  bge          a6, t5, 3831f
                  srl          s9, a5, s3
                  c.sub        a2, a5
                  c.addi       t6, 8
                  sra          s2, s10, t1
                  remu         t3, s7, t6
                  lui          s2, 1039299
                  mul          gp, a3, s1
                  c.addi       t2, 21
                  andi         a3, ra, 1930
                  c.li         a3, -1
                  c.srli       a2, 9
                  slti         a2, ra, -1915
                  nop
                  c.addi       t0, 22
                  bltu         s11, a3, 3840f
                  add          a0, s7, s6
                  srl          gp, a2, s11
3831:             beq          a1, t1, 3849f
                  slti         t5, s9, 499
                  c.andi       a4, -1
                  mulh         gp, s3, ra
                  addi         s11, s7, 1875
                  c.addi16sp   sp, 144
                  c.add        gp, a7
                  beq          a7, t2, 3854f
                  remu         s0, a5, a2
3840:             c.srli       a1, 26
                  remu         s7, s3, a2
                  divu         sp, gp, s10
                  sra          s9, sp, t2
                  c.lui        s9, 31
                  beq          s10, sp, 3853f
                  or           ra, s1, t4
                  c.xor        a3, s1
                  c.addi       s4, 13
3849:             sltu         gp, s7, t1
                  sra          s5, t2, t0
                  c.and        a3, a3
                  or           s10, a4, a2
3853:             c.srli       s0, 6
3854:             xor          t0, zero, t1
                  remu         s5, s5, s9
                  andi         t3, s7, 283
                  beq          tp, s7, 3869f
                  c.nop
                  addi         s3, t0, -686
                  xori         t2, s4, 1438
                  srli         s0, a7, 3
                  div          s6, sp, t5
                  c.beqz       a4, 3878f
                  andi         s5, a0, -653
                  ori          s0, s9, -1379
                  bne          t0, s5, 3872f
                  mul          s5, t1, a5
                  sra          s8, t6, t2
3869:             addi         s6, a0, -477
                  slt          s0, t1, a0
                  mul          s3, s7, s4
3872:             mulhsu       s7, ra, t4
                  c.and        s1, a2
                  c.or         a1, a4
                  c.andi       s1, 27
                  bge          a7, t3, 3880f
                  div          s1, zero, s9
3878:             bne          s4, s4, 3893f
                  srli         zero, s10, 25
3880:             and          a7, s10, s1
                  c.nop
                  addi         t6, zero, 7 #init loop 1 counter
                  xori         s10, sp, -1515
                  auipc        s7, 444012
                  andi         a1, s8, 1402
                  c.li         s4, -1
                  c.addi       gp, 1
                  c.or         a4, a1
                  addi         s6, zero, 6 #init loop 1 limit
                  andi         a1, ra, 283
                  remu         s1, ra, t3
sub_3_150_1_t:    mul          s1, t4, t4
                  mulhsu       t5, s3, a2
                  xori         s2, s8, -1389
                  addi         t6, t6, -1 #update loop 1 counter
                  c.sub        a1, a2
                  addi         t3, zero, -6 #init loop 0 counter
                  mulhu        a3, zero, s3
                  c.srai       a4, 27
                  addi         s5, zero, -6 #init loop 0 limit
                  slt          s2, a2, a3
                  ori          a7, t0, -776
sub_3_150_0_t:    nop
                  addi         t3, t3, -8 #update loop 0 counter
                  c.add        t4, s7
                  c.addi16sp   sp, 32
                  c.and        a1, s1
                  c.or         a3, a4
                  c.and        a3, s1
                  mulh         ra, t6, a1
                  bge          t3, s5, sub_3_150_0_t #branch for loop 0
                  c.lui        a3, 27
                  c.mv         gp, s7
                  bne          t6, s6, sub_3_150_1_t #branch for loop 1
                  c.addi       s0, 27
                  addi         a4, a0, 809
                  slt          s10, ra, tp
                  slli         t3, s4, 0
                  or           a7, gp, tp
                  sub          t6, a0, s8
                  andi         s10, s10, 684
                  mulh         s6, t2, s3
                  slli         sp, t4, 16
                  or           s10, gp, a6
                  beq          a2, gp, 3905f
                  xori         a2, tp, 692
3893:             c.add        a0, a2
                  c.addi16sp   sp, -16
                  c.sub        a3, a1
                  bgeu         s0, a4, 3905f
                  slti         t2, s2, 1132
                  c.or         a3, a0
                  srl          s8, t1, s9
                  div          t3, tp, s11
                  la           s5, region_1+566 #start load_store_instr_stream_1
                  la           s2, region_1+466 #start load_store_instr_stream_2
                  lh           ra, 36(s2)
                  la           a3, region_1+1443 #start load_store_instr_stream_0
                  lhu          s8, -196(s5)
                  la           t3, region_1+665 #start load_store_instr_stream_3
                  lb           a7, 118(s5)
                  sh           s3, 50(s2)
                  sb           s8, -15(a3)
                  lbu          a2, 31(s2)
                  lbu          s10, -14(a3)
                  lb           s3, -49(s2)
                  sb           t1, -98(s5)
                  sh           a7, -46(s2)
                  lbu          s4, 84(t3)
                  lhu          t6, -105(t3)
                  lhu          t4, -9(a3)
                  lh           t6, -15(a3)
                  lb           t1, 201(s5)
                  lhu          s7, 3(a3)
                  sw           a7, -361(t3)
                  lb           s10, -2(s5)
                  lb           s9, -50(s2)
                  lbu          sp, -4(s2)
                  lbu          a0, 149(s5)
                  sb           s2, 56(s2)
                  lbu          t2, -3(a3)
                  lbu          s9, 49(s5)
                  sb           zero, 86(s5)
                  sb           t3, -58(s2)
                  sh           s5, 116(s5)
                  lhu          s7, 19(t3)
                  sb           s3, 2(a3)
                  lhu          s11, -449(t3)
                  sh           s1, -4(s5) #end load_store_instr_stream_1
                  lbu          ra, -240(t3) #end load_store_instr_stream_3
                  lbu          gp, -34(s2) #end load_store_instr_stream_2
                  sh           s2, -3(a3)
                  lbu          s10, 14(a3)
                  lbu          s3, -14(a3) #end load_store_instr_stream_0
                  sll          ra, s10, s4
                  sub          s11, t3, t5
                  addi         t2, s10, 1130
                  c.mv         a2, sp
3905:             xor          s2, a1, s10
                  bltu         a6, s4, 3924f
                  sub          t4, s2, a0
                  srl          t3, a3, s0
                  c.or         a0, s1
                  srli         s9, t2, 14
                  srl          a4, s0, a3
                  c.addi16sp   sp, 160
                  divu         t2, s6, a3
                  andi         t1, sp, 1071
                  c.addi16sp   sp, -16
                  andi         a7, a0, 276
                  c.addi16sp   sp, 352
                  mulhu        s4, t1, gp
                  lui          s1, 511058
                  c.xor        s0, a4
                  add          t6, a2, t1
                  bge          s0, t2, 3931f
                  sltiu        s5, s8, -1013
3924:             c.addi4spn   a0, sp, 912
                  and          t2, s9, a0
                  c.sub        a0, s1
                  and          a0, s9, a5
                  c.li         s2, 29
                  c.srli       s1, 25
                  mul          s7, t6, a5
3931:             c.addi16sp   sp, 320
                  and          s11, s2, t6
                  c.or         a3, s1
                  ori          s7, s8, 217
                  c.beqz       a0, 3954f
                  c.mv         t5, s9
                  c.or         a3, a3
                  rem          s1, gp, s11
                  c.addi       t2, -1
                  lui          s0, 88827
                  c.bnez       a2, 3958f
                  c.lui        a2, 21
                  beq          gp, sp, 3962f
                  bge          t1, s8, 3945f
3945:             beq          t6, a3, 3946f
3946:             or           sp, s3, sp
                  or           s2, a4, a1
                  remu         zero, t3, s11
                  bge          s5, t4, 3956f
                  and          s7, s3, t3
                  c.addi       t6, -1
                  c.xor        s1, a4
                  mul          s9, t2, s4
3954:             c.nop
                  c.add        s9, a0
3956:             andi         a7, s4, -1336
                  srai         a2, a3, 14
3958:             c.andi       a4, 20
                  c.and        a2, s0
                  c.sub        a4, a1
                  slt          t0, a0, s1
3962:             andi         s9, zero, -665
                  c.lui        s0, 1
                  srl          t3, s9, zero
                  mulhsu       s4, t6, s6
                  bge          zero, t0, 3975f
                  mulh         a0, t1, t4
                  mul          ra, s6, a7
                  c.or         a2, a5
                  c.addi4spn   s0, sp, 624
                  c.mv         s8, a3
                  xori         zero, s6, 1599
                  srli         t3, a7, 4
                  slti         t6, t5, 1334
3975:             blt          t0, s9, 3989f
                  rem          s7, s9, s11
                  c.mv         a3, s2
                  blt          t6, s7, 3979f
3979:             bgeu         gp, t5, 3993f
                  andi         s6, a5, 1376
                  div          s5, s8, t2
                  c.sub        a2, a2
                  c.addi4spn   a4, sp, 976
                  blt          s2, t6, 3985f
3985:             c.li         s1, 26
                  c.lui        s0, 13
                  or           a3, s6, t2
                  andi         zero, a3, -383
3989:             srai         t6, t4, 3
                  c.lui        s0, 14
                  bne          a3, tp, 4000f
                  bne          t6, s11, 4007f
3993:             xor          s2, t3, s6
                  nop
                  c.srai       a4, 24
                  slli         ra, a6, 23
                  sltiu        a7, s4, -209
                  mulh         s6, zero, s11
                  div          s9, a0, t3
4000:             c.addi4spn   a3, sp, 448
                  srai         a0, s10, 7
                  mulhu        s7, a7, sp
                  add          a1, zero, tp
                  xori         sp, a5, 1161
                  nop
                  c.bnez       s0, 4024f
4007:             c.and        s1, a2
                  slti         zero, s2, 814
                  sra          t4, t6, t4
                  c.addi4spn   a0, sp, 848
                  rem          t4, s8, s5
                  or           s11, a6, t0
                  remu         t1, a3, a0
                  bge          t5, a0, 4022f
                  c.or         s0, a3
                  and          a4, a4, gp
                  mul          a2, t3, a6
                  mulhu        ra, t3, s5
                  ori          s8, a2, -66
                  and          s3, s6, gp
                  c.addi4spn   a0, sp, 944
4022:             bltu         sp, s3, 4023f
4023:             auipc        s2, 993202
4024:             sub          s6, s5, t5
                  c.slli       a7, 21
                  divu         s9, s10, zero
                  or           t4, s10, a0
                  bne          a1, s11, 4043f
                  srl          a1, s2, t1
                  mulhu        t0, s8, t2
                  auipc        ra, 737097
                  c.addi       a7, 17
                  or           t3, s2, t0
                  mulh         s3, t6, a0
                  c.add        s7, a0
                  blt          zero, s5, 4042f
                  ori          sp, gp, -2030
                  nop
                  c.nop
                  slt          sp, t6, t2
                  mulh         t3, t3, t1
4042:             c.bnez       a2, 4060f
4043:             c.srli       s0, 12
                  c.addi       t3, -1
                  slt          sp, s1, a5
                  remu         s9, t1, s6
                  lui          sp, 570301
                  c.xor        s0, a4
                  sll          s0, ra, a6
                  c.or         s1, s0
                  beq          s8, t4, 4065f
                  c.li         s6, -1
                  sll          a4, s11, t2
                  bge          s2, a3, 4062f
                  beq          s8, t3, 4069f
                  beq          sp, t6, 4063f
                  srl          t2, s2, a0
                  xori         s1, t3, -1913
                  c.mv         a0, a3
4060:             c.srai       a0, 8
                  mulhsu       s2, s11, a1
4062:             c.srli       a3, 10
4063:             or           a0, s9, t2
                  mulh         t4, t1, t3
4065:             bgeu         s10, s6, 4077f
                  andi         a1, s1, -1527
                  c.li         a1, -1
                  bgeu         s4, sp, 4072f
4069:             lui          s0, 489849
                  c.addi16sp   sp, -16
                  srli         t4, s2, 22
4072:             mulhsu       s2, s5, s7
                  c.mv         t3, s0
                  c.addi16sp   sp, 128
                  c.nop
                  bltu         s7, a6, 4094f
4077:             mul          ra, s9, a3
                  c.addi16sp   sp, -16
                  c.addi       s0, 15
                  c.srai       s1, 27
                  xor          t3, s3, s5
                  lui          s5, 294131
                  mul          t2, t4, tp
                  c.xor        s0, a0
                  xor          s5, gp, s11
                  mulh         s6, s9, sp
                  sll          a0, t2, sp
                  nop
                  c.and        a0, a2
                  sltiu        a4, t3, 1841
                  c.srai       s0, 18
                  add          t1, a7, a0
                  ori          s10, a7, 1165
4094:             mulhu        s10, s9, a0
                  bltu         s1, s4, 4099f
                  c.xor        a3, a2
                  and          t0, s8, zero
                  xor          s11, t2, sp
4099:             srl          s10, ra, s3
                  add          a1, s7, gp
                  sub          a0, a0, s0
                  c.srli       s0, 13
                  sll          s11, a6, s6
                  c.or         a2, a3
                  srai         t6, a3, 22
                  andi         t6, s1, -1318
                  auipc        zero, 503421
                  slt          s0, a3, s1
                  bltu         s5, t3, 4128f
                  c.and        a0, s1
                  c.andi       a2, 27
                  div          a4, a4, t0
                  bge          s2, a3, 4122f
                  add          s10, a4, t4
                  bgeu         s9, a2, 4123f
                  srai         a0, s0, 14
                  remu         a0, s6, s4
                  blt          t1, ra, 4123f
                  c.slli       a3, 30
                  mulhu        t3, s0, a2
                  or           t1, a4, a1
4122:             mul          t1, s4, s9
4123:             c.lui        s2, 30
                  mul          s11, a7, a7
                  slt          zero, zero, zero
                  remu         s9, a0, ra
                  slt          s2, s0, t6
4128:             bgeu         s8, s1, 4140f
                  sll          a3, s7, a2
                  c.addi4spn   a0, sp, 704
                  c.srai       a0, 9
                  srli         s8, t1, 9
                  divu         a0, s9, sp
                  sltu         s2, s9, t0
                  c.slli       s9, 9
                  or           s4, s1, s3
                  slli         t2, s6, 26
                  bgeu         t0, s7, 4156f
                  andi         s5, t3, -717
4140:             c.addi       s9, 28
                  c.srli       s0, 14
                  c.addi       s9, 28
                  xor          s2, t0, a5
                  mulhsu       t4, s0, a7
                  slti         s2, s9, 335
                  srai         s3, s4, 1
                  bne          t5, ra, 4156f
                  sltiu        a3, s9, 577
                  bltu         s0, s3, 4168f
                  rem          t4, t2, a3
                  bltu         s3, s1, 4152f
4152:             c.slli       t5, 6
                  c.add        a2, s5
                  c.addi16sp   sp, 352
                  lui          a3, 321448
4156:             c.li         a4, 4
                  xor          zero, s7, s3
                  mulh         s3, t4, sp
                  nop
                  ori          s2, t6, -1484
                  c.slli       a7, 16
                  div          t0, a0, t6
                  lui          a0, 460785
                  sltiu        s5, s4, -1668
                  slt          a4, t2, gp
                  c.or         a3, a3
                  slli         s6, s0, 19
4168:             divu         t0, s1, ra
                  c.slli       t6, 9
                  div          a4, a3, zero
                  c.or         s1, a3
                  c.sub        a2, a4
                  c.sub        s1, a5
                  c.lui        s5, 19
                  sub          t6, a5, a2
                  slt          s9, t4, t4
                  c.add        s9, s11
                  c.xor        a0, a0
                  or           a4, t3, t2
                  mulh         a7, s9, t0
                  c.mv         t5, t1
                  c.and        a2, s0
                  div          s1, a7, s9
                  c.addi16sp   sp, 336
                  auipc        a3, 901256
                  c.or         a3, a1
                  bge          a6, s11, 4203f
                  xor          sp, a4, s1
                  c.beqz       s0, 4204f
                  remu         gp, gp, s0
                  c.add        s1, tp
                  c.bnez       a4, 4209f
                  ori          s9, s9, -1685
                  ori          s10, a6, 1809
                  sra          t2, t4, a4
                  c.sub        a3, a3
                  sra          t4, s2, t5
                  bltu         s6, sp, 4212f
                  srai         t3, zero, 6
                  addi         gp, sp, -943
                  mul          s11, zero, ra
                  srl          t3, s3, s0
4203:             mul          s2, s3, t2
4204:             c.srli       a0, 3
                  c.li         ra, 27
                  mul          s3, s1, t6
                  c.bnez       a2, 4216f
                  slt          gp, t3, s11
4209:             lui          s11, 492304
                  bltu         gp, s5, 4229f
                  srli         t0, t2, 12
4212:             c.mv         s4, s0
                  bge          a6, t1, 4228f
                  blt          t2, t5, 4219f
                  divu         s6, s8, a1
4216:             divu         gp, ra, s6
                  srai         s9, s3, 17
                  beq          zero, t1, 4219f
4219:             c.nop
                  bgeu         t3, s7, 4238f
                  slli         s9, s10, 5
                  slli         t4, s3, 5
                  c.lui        t2, 7
                  and          s8, t0, t5
                  sltiu        a3, s11, -772
                  c.addi       sp, 28
                  c.or         s0, a4
4228:             andi         s1, a6, -690
4229:             bgeu         s4, sp, 4246f
                  ori          t4, a4, 1150
                  or           t5, a6, s2
                  mul          a3, t5, s3
                  and          s8, s11, t2
                  c.lui        s4, 25
                  ori          s8, tp, -1396
                  srli         s2, tp, 7
                  c.li         s1, -1
4238:             remu         s8, t3, a2
                  c.nop
                  xori         s4, ra, -543
                  remu         ra, s10, s6
                  c.mv         ra, s3
                  or           t5, s2, t2
                  c.andi       a0, -1
                  add          s4, a0, s7
4246:             c.and        s1, s0
                  mulhsu       t6, t6, a2
                  c.sub        a4, a4
                  ori          s4, s0, 669
                  or           s6, a7, t0
                  c.sub        a1, a4
                  c.srli       s1, 27
                  nop
                  addi         s11, a0, 242
                  lui          s5, 719433
                  c.srli       a1, 26
                  remu         s3, s3, s9
                  c.mv         t0, s7
                  ori          a0, t6, -2025
                  rem          s0, s1, zero
                  addi         s2, a3, 1810
                  srai         a4, s10, 28
                  bltu         s6, zero, 4267f
                  bgeu         t0, s8, 4278f
                  ori          t4, s2, 545
                  c.mv         t3, s1
4267:             xori         a7, a1, -175
                  c.slli       t1, 21
                  c.bnez       a0, 4283f
                  c.beqz       a3, 4282f
                  c.addi4spn   s1, sp, 288
                  blt          t2, s5, 4288f
                  div          a3, t3, s8
                  mulh         t4, t2, s2
                  c.addi4spn   a0, sp, 224
                  c.slli       t1, 13
                  xori         t1, gp, -797
4278:             sub          a4, a0, sp
                  mulh         ra, tp, s8
                  or           s2, s6, gp
                  slt          s5, t5, zero
4282:             and          t0, t6, s0
4283:             c.addi16sp   sp, -16
                  c.or         s0, a4
                  c.mv         t2, a7
                  nop
                  c.li         t2, -1
4288:             srl          s2, s7, s3
                  blt          t1, s9, 4307f
                  beq          s5, gp, 4296f
                  add          s3, tp, zero
                  bge          a4, gp, 4299f
                  blt          s5, t2, 4302f
                  srli         s1, s8, 5
                  c.slli       s0, 30
4296:             c.addi       gp, 1
                  c.bnez       a1, 4306f
                  c.addi       s3, 12
4299:             c.lui        a3, 29
                  bge          s3, a4, 4301f
4301:             c.srai       a3, 20
4302:             nop
                  c.srai       a3, 18
                  ori          a0, s7, -972
                  c.addi4spn   s0, sp, 880
4306:             ori          a2, a0, 394
4307:             mulhu        sp, sp, a1
                  sltu         s9, s10, gp
                  c.nop
                  srai         a4, a3, 9
                  divu         a0, a3, a4
                  nop
                  c.srai       s1, 23
                  nop
                  beq          a6, a5, 4330f
                  sub          s8, t5, s3
                  bge          s2, s2, 4335f
                  divu         t6, a3, a6
                  mulhsu       s3, a4, s9
                  auipc        t3, 987663
                  mulhsu       gp, s11, s7
                  mulh         ra, a2, s8
                  c.nop
                  c.mv         s11, a6
                  c.add        s10, s1
                  ori          s10, gp, -1212
                  c.mv         a3, ra
                  divu         t0, s8, sp
                  xor          s5, t2, t5
4330:             c.beqz       s1, 4349f
                  xor          a0, s11, s7
                  bltu         a1, s8, 4350f
                  mul          a4, ra, a6
                  mul          t6, s8, s11
4335:             c.addi16sp   sp, 112
                  sltiu        a7, a0, -1065
                  c.mv         s4, gp
                  rem          s6, s4, s11
                  sub          zero, t1, s5
                  srai         t6, s10, 2
                  div          a1, ra, a3
                  lui          s5, 82808
                  c.mv         s2, t1
                  xor          s6, a5, a3
                  and          a7, ra, zero
                  sltiu        s6, t3, 1764
                  c.addi4spn   a0, sp, 560
                  sltu         a2, s3, s9
4349:             c.or         a1, s1
4350:             c.or         s1, a5
                  auipc        s8, 647588
                  c.or         a2, a3
                  slti         t6, t2, -1353
                  slli         s3, a4, 11
                  c.lui        a3, 2
                  c.li         s2, -1
                  nop
                  srai         a4, t2, 20
                  c.addi4spn   a2, sp, 272
                  slti         a7, sp, -1979
                  bgeu         t3, s3, 4376f
                  c.or         s1, s0
                  remu         s10, gp, a7
                  srai         t5, zero, 0
                  c.addi       a1, 18
                  sra          s7, a3, s10
                  sll          s8, s9, s6
                  c.bnez       s0, 4369f
4369:             srli         t5, a0, 12
                  c.sub        s1, a3
                  blt          s4, a2, 4379f
                  c.bnez       a0, 4380f
                  sub          s0, s8, t5
                  div          s8, t5, t5
                  andi         s11, t2, -2022
4376:             addi         t4, a6, 1213
                  c.nop
                  c.li         s6, -1
4379:             sltu         a1, t1, a4
4380:             sltiu        sp, s1, -394
                  c.and        s1, a3
                  c.addi4spn   a2, sp, 224
                  c.lui        s3, 31
                  c.xor        a2, a2
                  mulh         s9, a7, s7
                  srli         a1, s3, 1
                  div          s3, s7, s2
                  mulh         t0, t2, a3
                  c.slli       sp, 20
                  c.lui        s11, 18
                  c.li         s9, -1
                  mulhsu       s11, a5, t5
                  slli         t3, a3, 29
                  c.srai       s1, 6
                  mulhu        s11, s1, a2
                  srli         t6, a6, 28
                  bge          s8, a6, 4401f
                  mulhsu       a2, s0, a4
                  sub          s3, tp, a3
                  add          t6, s7, a6
4401:             srl          s6, s5, s9
                  andi         a1, tp, -1670
                  auipc        t5, 782446
                  c.bnez       a0, 4416f
                  c.nop
                  remu         a0, tp, s1
                  divu         t0, a2, t6
                  nop
                  and          s6, tp, a0
                  beq          a3, t1, 4418f
                  slli         s1, t0, 22
                  blt          sp, s2, 4426f
                  sltu         s7, a2, t1
                  c.addi16sp   sp, 352
                  mul          a3, s11, t4
4416:             c.add        t4, sp
                  srli         s3, zero, 24
4418:             c.sub        a1, a2
                  xori         t5, s1, -879
                  rem          s8, a4, s9
                  blt          t6, t3, 4430f
                  add          s9, t1, s8
                  bgeu         s2, t1, 4435f
                  slt          t2, a2, a4
                  sltu         gp, t3, t2
4426:             sra          t3, gp, zero
                  c.bnez       s1, 4436f
                  nop
                  xor          s4, s4, t4
4430:             c.lui        a2, 18
                  andi         s7, t3, 1050
                  c.sub        a2, a4
                  c.beqz       a2, 4451f
                  c.or         a4, a0
4435:             bge          s8, zero, 4436f
4436:             srl          t1, a3, t4
                  c.mv         s4, a3
                  sltiu        s1, s3, -1248
                  mulh         a7, t5, s7
                  xor          s1, t3, zero
                  mulhu        t3, s1, a2
                  sltiu        s8, s9, -1363
                  c.nop
                  c.xor        a2, a5
                  add          s1, t5, t5
                  c.addi       t1, -1
                  andi         s10, s5, 903
                  sra          ra, t1, a7
                  sra          t3, s8, s4
                  sll          s4, t4, zero
4451:             c.mv         a1, s0
                  andi         s1, t3, -2020
                  sra          s2, sp, t5
                  c.beqz       a2, 4459f
                  bltu         a2, zero, 4472f
                  beq          t0, t0, 4460f
                  mulhsu       s3, t0, s3
                  c.and        s1, a3
4459:             c.li         t2, -1
4460:             andi         t0, t3, -450
                  c.and        a2, a2
                  mulhsu       s2, s10, tp
                  mul          s8, t6, a0
                  c.srai       a1, 24
                  rem          s6, t2, t4
                  c.xor        a2, a5
                  bltu         a6, t1, 4482f
                  srai         s5, a7, 19
                  nop
                  c.slli       a3, 16
                  remu         t0, s0, s4
4472:             srli         a0, a2, 20
                  c.or         a4, a3
                  srli         s8, tp, 11
                  slt          s10, ra, s5
                  c.or         a3, a2
                  bge          a4, a3, 4478f
4478:             c.addi4spn   a4, sp, 336
                  c.xor        a0, a1
                  and          s1, t4, s3
                  bltu         t6, ra, 4496f
4482:             c.addi4spn   a4, sp, 608
                  remu         s2, a4, tp
                  srai         t6, zero, 24
                  remu         ra, gp, t0
                  or           s11, a2, s8
                  c.mv         t3, a1
                  beq          a6, t4, 4506f
                  mulh         a7, gp, a2
                  lui          t3, 443754
                  bgeu         s11, s1, 4497f
                  ori          s0, s9, 1523
                  c.slli       s10, 13
                  c.andi       a2, 18
                  srai         a3, t1, 10
4496:             blt          s1, a4, 4504f
4497:             c.mv         t1, s8
                  bltu         a5, s4, 4510f
                  c.mv         s2, t3
                  c.beqz       a3, 4514f
                  nop
                  div          s9, s9, a1
                  srli         t3, s5, 7
4504:             c.andi       a4, 25
                  mulhsu       a1, t1, a7
4506:             c.sub        a0, a1
                  c.beqz       a0, 4516f
                  bltu         s3, a6, 4524f
                  c.andi       a3, -1
4510:             bltu         t2, a0, 4518f
                  sra          sp, s4, s6
sub_3_67:         jal          t6, 13f
0:                c.j          5f
1:                c.j          3f
2:                jal          ra, 9f
3:                jal          ra, 2b
4:                jal          ra, 8f
5:                c.jal        10f
6:                c.j          15f
7:                c.j          19f
8:                c.j          7b
9:                c.j          17f
10:               c.j          1b
11:               c.j          14f
12:               jal          sp, 18f
13:               c.jal        6b
14:               jal          t1, 4b
15:               c.jal        16f
16:               c.j          0b
17:               c.jal        12b
18:               c.j          11b
19:               srl          s3, t4, a2
                  mul          s1, s9, s8
                  c.beqz       s0, 4531f
4514:             srai         a0, gp, 23
                  remu         t5, sp, t1
4516:             addi         s5, s9, -311
                  bgeu         t4, s6, 4531f
4518:             div          s2, t6, t6
                  srli         s2, s3, 22
                  c.add        t5, t5
                  div          s0, a5, s5
                  c.addi16sp   sp, 384
                  sltu         s1, a4, t0
4524:             slti         zero, s3, -908
                  bgeu         a4, s7, 4533f
                  c.srli       s1, 4
                  blt          a6, s5, 4546f
                  c.beqz       s0, 4529f
4529:             sltu         a4, s0, s1
                  c.addi16sp   sp, -16
4531:             lui          s10, 601433
                  and          t5, s3, ra
4533:             mul          s8, t1, ra
                  ori          t1, s8, -1426
                  div          s1, tp, ra
                  c.add        s2, t1
                  sltiu        s3, a7, -1887
                  ori          a7, sp, -2008
                  slli         zero, s9, 23
                  c.nop
                  sub          a3, a4, a2
                  bgeu         s3, a3, 4556f
                  blt          t4, s11, 4561f
                  sra          a3, s11, t2
                  c.and        a3, a0
4546:             c.slli       a1, 11
                  rem          s9, t3, t5
                  addi         s9, a4, 107
                  xori         t2, s5, 1544
                  add          s4, t3, t3
                  c.addi       a1, 7
                  bge          s3, a3, 4556f
                  add          s11, t6, tp
                  blt          s1, sp, 4569f
                  c.xor        a4, a0
4556:             sub          a3, s6, a2
                  sltu         t6, t2, t6
                  sll          t5, a3, s0
                  bltu         s8, s4, 4578f
                  bltu         s7, s3, 4567f
4561:             c.bnez       a0, 4579f
                  bne          s8, ra, 4570f
                  bgeu         s8, a4, 4568f
                  xor          a2, tp, s8
                  slli         t4, s0, 7
                  c.lui        s5, 5
4567:             mulhsu       ra, a3, s10
4568:             bgeu         s0, s7, 4582f
4569:             sltu         a4, gp, a4
4570:             c.addi       a1, -1
                  c.srli       s1, 25
                  add          ra, gp, a6
                  and          s9, t0, t3
                  addi         s5, a7, -917
                  c.addi       a7, -1
                  slti         a7, t1, 1735
                  sub          a3, s6, s6
4578:             c.andi       a3, 20
4579:             c.andi       a2, -1
                  ori          a2, sp, 1838
                  c.bnez       a4, 4593f
4582:             mulhsu       s2, s8, s4
                  add          a2, s5, a5
                  c.srai       s1, 3
                  and          s6, s1, gp
                  c.sub        s1, a4
                  c.mv         s8, s10
                  c.slli       a7, 24
                  c.addi16sp   sp, -16
                  c.andi       a4, 7
                  sltiu        a2, zero, -740
                  blt          sp, a3, 4606f
4593:             bltu         t6, s10, 4608f
                  srl          a3, s0, gp
                  or           t4, a5, a4
                  c.beqz       a3, 4597f
4597:             rem          t0, a6, a1
                  c.addi4spn   s0, sp, 128
                  or           s7, a2, s8
                  c.beqz       a3, 4619f
                  addi         s3, s9, 1623
                  mulhsu       t0, s7, t5
                  sltu         s3, t0, a3
                  slt          s11, s6, t5
                  c.srai       a2, 17
4606:             c.nop
                  remu         a2, s5, s6
4608:             and          s5, t5, s11
                  mul          sp, a1, s6
                  beq          t3, t5, 4622f
                  bne          ra, zero, 4615f
                  sltu         s2, s2, a3
                  blt          a4, s4, 4622f
                  sltiu        s1, s4, -770
4615:             mulhsu       a2, t4, a4
                  srli         s6, s9, 10
                  srai         a2, s2, 15
                  sub          t0, s0, s4
4619:             bne          s10, s9, 4633f
                  sltiu        s2, s11, 1270
                  c.sub        a0, a0
4622:             lui          zero, 1042818
                  blt          a4, a7, 4631f
                  srai         s11, s9, 16
                  srli         sp, s7, 28
                  c.add        s0, s4
                  c.mv         a2, a3
                  xor          s6, gp, a1
                  sra          t0, a1, t0
                  bltu         t0, s2, 4645f
4631:             divu         t3, tp, s0
                  div          a1, gp, zero
4633:             nop
                  blt          s7, t5, 4638f
                  divu         t0, t3, gp
                  remu         t1, s8, s7
                  c.sub        a1, a5
4638:             sltiu        a4, a0, 1314
                  bgeu         gp, a3, 4654f
                  lui          t3, 219421
                  c.beqz       s1, 4648f
                  srl          ra, t3, a6
                  rem          t5, t6, t3
                  add          s1, s0, s1
4645:             c.andi       a0, 5
                  rem          a1, t5, s0
                  c.addi16sp   sp, -16
4648:             add          t5, s11, s8
                  c.addi4spn   a3, sp, 656
                  xor          s0, a3, s4
                  c.xor        a3, a5
                  ori          a7, s10, -623
                  blt          s8, a5, 4654f
4654:             c.srli       s1, 26
                  c.nop
                  bgeu         a2, tp, 4665f
                  andi         s0, t3, 1773
                  bgeu         sp, t4, 4675f
                  lui          s6, 46451
                  c.xor        s1, a3
                  c.addi       t3, -1
                  c.or         s0, a3
                  slt          s11, a0, s3
                  sltu         gp, s11, t0
4665:             c.andi       a2, -1
                  c.andi       s1, 8
                  mulh         s0, s7, s7
                  xor          s1, a5, s4
                  blt          tp, a7, 4675f
                  srai         s7, s9, 18
                  srl          t6, s9, s0
                  sltiu        a3, s1, 1151
                  nop
                  xor          t2, s5, t5
4675:             bne          a0, tp, 4676f
4676:             c.srli       s0, 26
                  c.sub        a2, a4
                  c.or         a1, a0
                  div          a4, gp, s8
                  c.addi16sp   sp, -16
                  bgeu         a5, s5, 4689f
                  xor          s9, a5, zero
                  bne          a2, s0, 4701f
                  c.add        a0, t0
                  mulhu        s4, s7, a3
                  bltu         s9, a1, 4695f
                  remu         s6, a6, s8
                  rem          s9, t2, s2
4689:             xor          a7, t1, t4
                  beq          s6, a2, 4709f
                  srli         t4, t2, 28
                  sra          s7, s8, sp
                  addi         t3, s9, 1802
                  xor          s3, s0, sp
4695:             andi         zero, zero, 1783
                  xor          t4, t6, t0
                  divu         sp, t0, s0
                  bgeu         s10, t4, 4714f
                  c.srai       a3, 13
                  ori          a4, a2, -968
4701:             nop
                  c.sub        a1, a0
                  c.xor        s1, s1
                  add          t0, a6, a5
                  c.addi16sp   sp, 16
                  c.addi4spn   s1, sp, 992
                  c.mv         s5, s8
                  bne          t5, s7, 4726f
4709:             mulhsu       t6, s7, t0
                  xori         s4, s4, 435
                  divu         gp, t2, t2
                  srai         s2, sp, 0
                  c.addi       t3, -1
4714:             c.andi       a0, 28
                  beq          t5, t0, 4733f
                  and          a1, t1, s0
                  remu         a3, t6, s9
                  mul          s4, a4, zero
                  c.slli       s7, 13
                  c.bnez       a4, 4734f
                  c.srai       a2, 10
                  addi         s3, t2, 737
                  slti         a4, t0, -331
                  bge          a2, t1, 4725f
4725:             lui          zero, 1035514
4726:             beq          t6, s3, 4744f
                  c.slli       s8, 22
                  bne          a6, a0, 4737f
                  sltiu        t2, s7, -954
                  c.addi4spn   a0, sp, 96
                  sltu         a1, a7, t5
                  sll          sp, s3, s11
4733:             srai         s9, s0, 13
4734:             auipc        s1, 208353
                  rem          s3, s5, t1
                  remu         a2, s0, a3
4737:             sltu         s4, a6, a1
                  remu         s7, a3, s1
                  sra          s2, t0, ra
                  mulhu        t5, a1, s9
                  ori          s6, s0, 1919
                  sltu         a0, t0, tp
                  ori          a1, gp, 480
4744:             mul          gp, s9, s9
                  sra          t6, t5, tp
                  andi         s0, ra, -859
                  sltiu        gp, t2, -365
                  ori          ra, zero, 1649
                  c.andi       s0, 10
                  nop
                  or           a0, s3, a5
                  slti         s6, s0, 1586
                  nop
                  c.andi       a4, -1
                  slti         s2, a5, 902
                  rem          s0, sp, s7
                  c.add        s3, a7
                  sll          s4, a7, s2
                  mulhsu       s11, s1, sp
                  srli         t1, t0, 11
                  sltiu        ra, a4, -860
                  slt          s0, a7, t3
                  rem          a7, s6, s10
                  mulh         s6, t2, a0
                  bge          a4, a1, 4773f
                  ori          s2, tp, -941
                  xor          a0, a3, s4
                  c.or         s0, a4
                  c.addi       gp, 10
                  ori          t1, a2, -1868
                  lui          s9, 265784
                  andi         s8, s5, -1116
4773:             mulhsu       s1, t5, a3
                  divu         s0, s10, s7
                  srl          s8, t3, s1
                  c.lui        a3, 17
                  bge          s7, t1, 4789f
                  sub          t0, s5, t6
                  nop
                  bgeu         a1, t5, 4784f
                  c.li         s5, 12
                  rem          zero, tp, a6
                  bne          t1, s4, 4800f
4784:             sltu         s6, s8, a1
                  c.beqz       s0, 4791f
                  bge          s3, s3, 4804f
                  sltiu        s5, t1, 864
                  mul          s7, t4, s3
4789:             rem          t0, t2, t0
                  sltu         t5, s10, s6
4791:             lui          s1, 893958
                  c.li         t0, 3
                  c.addi       t6, -1
                  c.nop
                  c.slli       a2, 29
                  blt          s2, s10, 4811f
                  div          s0, zero, tp
                  mulhsu       a1, tp, s8
                  bne          s8, sp, 4818f
4800:             slt          s5, t3, s6
                  lui          t1, 21633
                  c.beqz       a4, 4817f
                  bge          s0, s9, 4812f
4804:             andi         s11, a6, -1361
                  srai         s9, t4, 10
                  addi         s4, zero, -1930
                  c.slli       s8, 21
                  addi         s2, s11, -1978
                  bge          a7, s8, 4828f
                  c.mv         s5, s4
4811:             c.slli       t0, 12
4812:             nop
                  srli         a1, s3, 3
                  bne          s8, a2, 4832f
                  addi         s8, a2, -1471
                  beq          s6, s11, 4828f
4817:             srli         t4, s3, 3
4818:             xor          s4, s3, zero
                  sll          sp, s10, t3
                  c.beqz       a2, 4834f
                  addi         s3, tp, 2032
                  sltiu        zero, s1, 1871
                  add          a2, a7, s3
                  c.beqz       s0, 4840f
                  sll          s6, s11, s6
                  sra          t0, a2, s8
                  or           zero, tp, a0
4828:             andi         t4, ra, -82
                  srli         s6, s8, 4
                  c.nop
                  mulhu        ra, s10, zero
                  la           a4, region_1+1988 #start riscv_load_store_hazard_instr_stream_28
                  lb           t1, 9(a4)
                  lbu          t3, 9(a4)
                  sb           a3, 9(a4)
                  lw           a0, -184(a4)
                  lw           a1, -184(a4)
                  lb           a1, -184(a4)
                  sb           s10, -184(a4)
                  c.andi       s0, 2
                  srai         s4, s7, 26
                  srli         s3, s0, 24
                  lbu          t2, -184(a4)
                  lbu          s11, -88(a4)
                  sw           t5, -88(a4)
                  lhu          t5, -88(a4)
                  sh           s3, -88(a4)
                  sh           s2, -88(a4)
                  sb           s6, -114(a4)
                  sh           t2, -114(a4)
                  lb           s1, 5(a4)
                  c.srai       s1, 3
                  lw           s0, -40(a4) #end riscv_load_store_hazard_instr_stream_28
4832:             ori          a2, s10, -1776
                  div          s2, t6, s5
4834:             c.and        s0, a5
                  slt          a4, sp, a5
                  auipc        t1, 777507
                  c.xor        s1, s1
                  auipc        s2, 449757
                  c.addi4spn   a3, sp, 576
4840:             ori          s1, a7, -1152
                  rem          a1, zero, t4
                  lui          s6, 759957
                  srl          t5, s11, s4
                  sll          t5, zero, a6
                  add          t5, t3, gp
                  bne          gp, s1, 4847f
4847:             bgeu         zero, s10, 4861f
                  andi         t0, gp, 1288
                  remu         a4, zero, t3
                  c.lui        ra, 3
                  la           s8, region_0+1449 #start riscv_hazard_instr_stream_6
                  lb           t3, -82(s8)
                  c.srli       s0, 20
                  div          s0, s0, s0
                  c.xor        s0, s0
                  lh           ra, -155(s8)
                  lh           s9, -21(s8)
                  sb           s9, 73(s8)
                  c.slli       s9, 30
                  remu         s9, gp, ra
                  lbu          s9, 98(s8)
                  c.li         a7, 19
                  sb           gp, 0(s8)
                  lbu          s9, 8(s8)
                  slti         s0, a7, 234
                  c.nop
                  or           t3, t3, t3
                  c.srai       s0, 20
                  c.mv         s0, gp
                  sb           t3, 198(s8)
                  auipc        s9, 584852
                  lhu          s9, -185(s8)
                  add          a7, s9, t3
                  mul          gp, a7, s9
                  and          a7, ra, ra
                  lbu          a7, -142(s8)
                  srl          gp, s9, gp
                  sh           s9, 13(s8)
                  srai         gp, t3, 19
                  ori          ra, gp, 245
                  lbu          ra, -122(s8)
                  slti         s0, t3, 1333
                  slti         gp, t3, -1497
                  and          a7, gp, s9
                  lbu          ra, -242(s8)
                  sb           s9, -246(s8)
                  c.srli       s0, 18
                  lb           t3, 28(s8)
                  c.mv         gp, gp
                  sh           t3, -131(s8)
                  sb           ra, 10(s8)
                  or           s9, ra, a7
                  sb           ra, 113(s8)
                  lh           t3, 171(s8)
                  sb           s9, -70(s8)
                  divu         s9, s0, t3
                  div          ra, t3, s9
                  c.lui        gp, 1
                  c.andi       s0, 5
                  lbu          gp, -237(s8)
                  auipc        gp, 428538
                  sh           t3, -247(s8)
                  lh           ra, 111(s8)
                  c.addi       gp, 21
                  lhu          gp, 49(s8)
                  sh           t3, -29(s8)
                  lbu          s9, 244(s8)
                  lb           gp, 214(s8) #end riscv_hazard_instr_stream_6
                  bgeu         s9, ra, 4866f
                  c.sub        a2, a5
                  c.nop
                  c.mv         s0, t5
                  mulh         t4, t6, a0
                  slli         s1, a3, 30
                  add          s4, s5, zero
                  c.and        a0, s1
                  c.addi4spn   a2, sp, 816
                  bltu         s5, tp, 4868f
4861:             add          t5, s11, s6
                  c.xor        a0, a1
                  c.nop
                  sub          s0, a0, s7
                  srli         s2, a1, 9
4866:             c.li         t2, 25
                  or           s1, s10, a6
4868:             addi         s10, s2, 1650
                  remu         s9, t0, t5
                  andi         t1, s10, 1938
                  lui          a1, 362961
                  srli         t2, t3, 25
                  c.slli       s1, 21
                  mul          t6, a4, t4
                  c.li         s5, 16
                  bgeu         s4, gp, 4880f
                  beq          t1, s0, 4882f
                  div          a7, s0, t6
                  remu         t4, t5, a5
4880:             blt          a0, s6, 4887f
                  ori          a4, s8, -902
4882:             divu         s2, s10, s3
                  lui          s0, 405725
                  c.addi4spn   a1, sp, 384
                  beq          a7, a1, 4886f
4886:             c.slli       t0, 10
4887:             srl          s11, tp, t3
                  c.sub        s0, s0
                  c.li         s8, -1
                  bltu         a0, a3, 4899f
                  c.addi16sp   sp, -16
                  add          s6, sp, t0
                  mulhsu       gp, zero, s3
                  or           sp, s2, a4
                  sra          s11, s11, t0
                  remu         a2, s1, t6
                  c.or         a4, a5
                  c.addi       s4, -1
4899:             sra          s2, s2, a1
                  c.sub        a4, a2
                  mulhu        a7, a6, t4
                  slli         a7, a5, 6
                  c.beqz       a2, 4921f
                  or           s1, t1, a5
                  c.andi       a0, 15
                  sra          t1, s7, t1
                  bltu         s0, t1, 4915f
                  xori         s7, s0, -675
                  sltu         a7, a2, a5
                  bne          s9, t2, 4924f
                  bge          t6, s7, 4927f
                  xor          gp, a0, a3
                  srli         sp, t3, 20
                  c.sub        s1, a2
4915:             c.addi       s7, -1
                  sltu         ra, s2, s3
                  srli         s1, a3, 21
                  nop
                  or           gp, t6, s1
                  c.li         s2, -1
4921:             beq          a6, s10, 4936f
                  sltiu        a3, s1, 1493
                  c.bnez       a1, 4940f
4924:             c.addi16sp   sp, -16
                  c.lui        s0, 22
                  c.li         s9, 3
4927:             add          s9, s5, s5
                  xori         t2, t3, 1492
                  divu         s10, s5, a1
                  or           s1, a5, a7
                  sll          sp, s2, t6
                  bgeu         tp, a2, 4933f
4933:             bne          a1, s5, 4945f
                  slt          s8, s3, a0
                  c.sub        a2, s1
4936:             divu         s9, s1, a1
                  c.and        a4, a0
                  c.addi4spn   a2, sp, 272
                  c.srai       s0, 2
                  la           s5, region_0+1567 #start load_store_instr_stream_0
                  la           a4, region_0+1932 #start load_store_instr_stream_2
                  sb           s2, 13(a4)
                  la           t5, region_0+826 #start load_store_instr_stream_3
                  la           a0, region_0+950 #start load_store_instr_stream_1
                  lhu          a1, 144(t5)
                  sw           gp, 16(a4)
                  sb           s9, -15(a4)
                  lbu          t3, 205(t5)
                  sb           a1, -33(s5)
                  lhu          t6, 0(a4)
                  sb           t1, 11(a4)
                  sb           t4, 196(t5)
                  lhu          s6, -61(s5)
                  lbu          a1, 11(a4)
                  lbu          s7, -130(t5)
                  lb           t0, -17(a0)
                  lb           s0, -172(a0)
                  lbu          s4, 171(t5)
                  lbu          t0, -34(s5)
                  lb           sp, -7(a4)
                  lb           zero, -5(a4)
                  lh           s7, 246(a0)
                  sb           a2, 135(a0)
                  lb           sp, 25(t5) #end load_store_instr_stream_3
                  lhu          s11, -49(s5)
                  lbu          t1, -10(a4) #end load_store_instr_stream_2
                  lbu          sp, -47(a0) #end load_store_instr_stream_1
                  lbu          s2, -5(s5) #end load_store_instr_stream_0
4940:             c.lui        t3, 4
                  c.lui        t4, 7
                  mulhu        a4, a5, t5
                  srai         t6, s11, 0
                  andi         s5, s6, -1463
4945:             rem          s0, s11, s8
                  bge          s1, ra, 4964f
                  c.addi4spn   a3, sp, 976
                  srli         a1, s8, 2
                  ori          a0, a7, -631
                  sub          gp, s3, ra
                  addi         a4, t4, 799
                  slli         zero, a2, 0
                  divu         s5, a1, s5
                  c.li         s5, 4
                  remu         s0, s9, a6
                  c.addi       s8, -1
                  bgeu         t5, a7, 4965f
                  bne          s10, s6, 4973f
                  xori         s8, s9, 1359
                  bge          s10, t0, 4967f
                  c.and        a3, s1
                  andi         sp, t1, -1521
                  blt          t0, t2, 4964f
4964:             slli         s6, tp, 23
4965:             mulh         a4, s4, s8
                  rem          s6, t4, a5
4967:             c.add        s10, s8
                  c.and        s1, a3
                  and          s6, s7, s11
                  xor          t4, s6, s6
                  slli         a4, s2, 19
                  slt          a0, a6, a3
4973:             mul          s9, s3, a2
                  c.srai       a3, 6
                  c.nop
                  c.addi16sp   sp, -16
                  divu         t5, a5, s11
                  c.add        s4, t0
                  xor          ra, gp, t6
                  c.srai       a2, 27
                  slt          a1, a5, s0
                  c.sub        a3, s0
                  slti         t1, t1, 1274
                  sll          s1, s8, a4
                  divu         zero, t2, a3
                  c.nop
                  c.addi16sp   sp, 48
                  c.sub        a4, a4
                  c.srai       s0, 8
                  c.add        s5, s8
                  c.li         t6, -1
                  mulh         t1, a7, s0
                  addi         t5, s1, 63
                  slt          s7, t1, zero
                  mulhu        s1, a5, a5
                  bge          s0, t3, 5001f
                  auipc        gp, 8162
                  c.nop
                  c.nop
                  beq          s1, a2, 5004f
5001:             srli         a3, a5, 16
                  xori         s7, gp, -907
                  slli         s11, t1, 26
5004:             srl          t6, s10, t0
                  la           s6, region_0+867 #start load_store_instr_stream_1
                  la           a0, region_0+1901 #start load_store_instr_stream_2
                  sb           s5, 7(a0)
                  lb           s8, -12(s6)
                  la           t1, region_0+1829 #start load_store_instr_stream_0
                  lbu          s11, -8(s6)
                  lbu          a4, -745(t1)
                  lh           t0, -281(t1)
                  lbu          s8, 7(a0)
                  lb           s8, 6(s6)
                  lb           s4, -9(s6)
                  lbu          s10, -16(a0)
                  lw           ra, 143(t1)
                  lh           t4, 3(a0)
                  lb           t3, -1800(t1)
                  lw           s11, 5(s6)
                  lbu          a2, 12(s6)
                  lb           a2, -16(s6)
                  sb           s6, -16(a0) #end load_store_instr_stream_2
                  sw           t6, 5(s6)
                  sb           t5, -402(t1)
                  lb           s9, -319(t1)
                  sb           t5, 16(s6) #end load_store_instr_stream_1
                  sb           s5, -341(t1)
                  sb           s11, -333(t1) #end load_store_instr_stream_0
                  auipc        ra, 315333
                  xori         s6, a6, 1411
                  c.add        s11, s9
                  or           a4, a6, t6
                  c.and        a3, a4
                  ori          sp, zero, -2046
                  andi         t0, s8, -1122
                  slli         a3, a3, 7
                  c.mv         s3, gp
                  lui          s2, 265318
                  c.beqz       s0, 5024f
                  c.nop
                  c.bnez       a3, 5026f
                  c.mv         s5, s0
                  andi         s0, s11, -972
                  c.mv         a1, t1
                  c.xor        s0, s0
                  c.addi16sp   sp, -16
                  andi         a7, s10, 76
5024:             srl          s9, zero, a3
                  c.bnez       s0, 5033f
5026:             blt          t6, s11, 5044f
                  c.mv         sp, ra
                  c.addi16sp   sp, 336
                  add          s4, t0, s9
                  and          s10, a4, s0
                  mulh         a7, tp, s1
                  slli         a1, a1, 10
5033:             c.beqz       a1, 5048f
                  c.addi       s3, -1
                  c.beqz       a3, 5054f
                  and          a4, sp, s6
                  andi         s9, a7, -750
                  and          ra, a1, a5
                  auipc        ra, 938161
                  c.and        a4, a1
                  nop
                  sll          s8, ra, a7
                  c.addi16sp   sp, -16
5044:             add          a3, a4, a7
                  srli         s10, s11, 25
                  divu         s6, s5, t6
                  srai         s8, a6, 5
5048:             auipc        a3, 119056
                  c.addi       a2, -1
                  mulhsu       zero, t1, s9
                  sra          t2, a5, t0
                  slti         t0, s2, 832
                  nop
5054:             c.nop
                  bgeu         s1, ra, 5056f
5056:             slti         t6, s10, 1704
                  ori          s2, t3, -536
                  lui          t5, 675675
                  slli         t3, s2, 7
                  c.srli       s1, 3
                  rem          s1, gp, a3
                  addi         t4, s2, 1561
                  ori          sp, t1, 138
                  c.addi16sp   sp, 464
                  c.andi       a3, 30
                  mul          s0, a6, zero
                  sub          sp, s6, a0
                  bge          a4, a7, 5086f
                  slt          t2, t5, s5
                  srl          s1, tp, tp
                  nop
                  sltu         s8, t2, s5
                  srai         s1, s5, 30
                  addi         t0, s1, -118
                  sll          s1, t6, t1
                  c.andi       a0, -1
                  mul          t3, ra, t3
                  xor          s6, s4, a1
                  or           t5, s2, s0
                  c.add        a7, t6
                  mulhu        a4, s10, a3
                  la           t1, region_0+291 #start load_store_instr_stream_1
                  lb           sp, 16(t1)
                  la           s5, region_1+1696 #start load_store_instr_stream_0
                  lbu          t0, -199(s5)
                  lh           a3, -28(s5)
                  lb           ra, 4(t1)
                  lh           a3, -13(t1)
                  lw           t3, 180(s5)
                  lbu          s2, 240(s5)
                  sb           t2, 3(t1)
                  lw           s3, -208(s5)
                  lb           a7, 115(s5)
                  lw           sp, 9(t1) #end load_store_instr_stream_1
                  lh           ra, 54(s5)
                  lbu          t0, 31(s5)
                  lb           ra, -225(s5)
                  lw           s9, -136(s5) #end load_store_instr_stream_0
                  c.srai       s0, 16
                  nop
                  blt          a7, s0, 5090f
                  c.addi16sp   sp, 256
5086:             lui          sp, 474578
                  srl          s10, s8, a4
                  c.li         t1, 27
                  bgeu         a2, t0, 5101f
5090:             slt          t5, zero, s7
                  lui          t0, 954866
                  or           s10, s0, sp
                  beq          s2, s2, 5112f
                  c.lui        t4, 10
                  srai         a0, a4, 31
                  sra          t1, s9, s7
                  slli         t6, s11, 9
                  sra          t3, s0, t6
                  c.andi       a1, -1
                  c.mv         ra, tp
5101:             xor          s0, a3, t3
                  mulhsu       s7, t0, gp
                  ori          t1, a6, -686
                  bge          a6, s6, 5112f
                  xor          s9, a2, s5
                  c.xor        a4, a0
                  beq          s1, a2, 5111f
                  srai         gp, gp, 10
                  c.bnez       s1, 5123f
                  c.slli       t3, 4
5111:             beq          s2, sp, 5129f
5112:             c.add        s2, ra
                  lui          t2, 646571
                  c.srai       a1, 24
                  slli         a1, a6, 29
                  srl          s10, t0, t3
                  beq          s4, t3, 5126f
                  mulh         s8, s9, a7
                  c.mv         a7, ra
                  c.addi       a1, -1
                  blt          s0, t6, 5135f
                  addi         t4, s4, 637
5123:             div          t6, gp, a1
                  slti         t3, s9, 1930
                  c.or         s0, a4
5126:             mulh         a4, s4, s5
                  ori          a4, tp, 947
                  sub          a2, s0, t4
5129:             sub          a0, t3, s3
                  mulhsu       ra, s1, zero
                  sra          s5, t0, s5
                  bltu         s0, a0, 5150f
                  nop
                  mulhsu       a2, s0, t0
5135:             c.srai       a1, 10
                  c.add        s9, s11
                  srli         gp, a1, 6
                  mulh         s11, t5, s10
                  bne          a0, t3, 5154f
                  c.andi       s1, -1
                  srli         s1, gp, 20
                  xori         a4, s7, 1949
                  c.srai       a2, 12
                  remu         zero, sp, a3
                  auipc        s10, 648699
                  remu         s6, t6, a7
                  addi         s11, s6, 1884
                  or           s11, a2, s7
                  bgeu         a7, a0, 5167f
5150:             addi         a4, a6, -910
                  mul          s4, s10, tp
                  andi         ra, t4, 1454
                  c.and        a2, s1
5154:             c.mv         a4, s6
                  c.li         s4, 18
                  xori         a1, a1, -1308
                  sra          a3, ra, a6
                  sra          s5, s5, gp
                  mulh         t6, a3, sp
                  sra          t4, ra, t1
                  beq          sp, t1, 5175f
                  xor          t2, t0, s2
                  bge          s11, a6, 5181f
                  c.li         t0, -1
                  c.bnez       a2, 5181f
                  xori         a4, t0, 1203
5167:             nop
                  c.srai       a3, 11
                  sll          sp, zero, a0
                  blt          t4, t3, 5182f
                  sltu         s5, s2, s5
                  mulhsu       s6, a5, a1
                  mulh         a2, t6, s8
                  sltu         t5, s6, s5
5175:             remu         t4, s9, a3
                  and          s2, a6, s2
                  c.addi       a1, 16
                  bgeu         a5, s11, 5197f
                  c.li         s10, 15
                  remu         zero, t1, t6
5181:             sltu         s4, a1, zero
5182:             or           s5, a1, s0
                  c.add        a0, a3
                  c.addi       s1, 16
                  c.slli       s11, 17
                  c.addi4spn   a3, sp, 48
                  beq          s11, s5, 5199f
                  mul          t2, a6, a6
                  srl          s3, t4, t2
                  c.addi16sp   sp, -16
                  div          s3, a2, t1
                  rem          zero, a4, t0
                  c.and        s1, s1
                  sltu         ra, s10, s2
                  sltu         t4, s7, a1
                  bne          a5, gp, 5203f
5197:             c.li         ra, -1
                  c.addi4spn   a3, sp, 304
5199:             c.addi4spn   a1, sp, 576
                  c.nop
                  c.mv         t2, s7
                  c.addi       t3, -1
5203:             c.slli       t0, 2
                  mul          sp, t5, a3
                  c.addi4spn   a2, sp, 416
                  mulh         s1, s6, a0
                  add          s7, s5, a2
                  slt          s7, s11, s1
                  srai         s1, s7, 22
                  sltu         t3, s1, a3
                  divu         t6, t3, gp
                  c.srai       a1, 22
                  beq          s0, s5, 5214f
5214:             div          a0, s5, t2
                  sub          t0, a6, t6
                  addi         s5, t3, 1558
                  rem          s1, t1, a6
                  c.srai       s0, 10
                  slt          a1, gp, sp
                  c.or         a1, a3
                  nop
                  c.addi4spn   a1, sp, 928
                  rem          s4, t6, s4
                  ori          s2, t4, -309
                  and          s1, t5, a1
                  c.li         a1, 17
                  lui          t3, 626664
                  c.add        s2, s8
                  c.addi4spn   a1, sp, 1008
                  div          s8, s9, s9
                  rem          s8, s4, s6
                  sub          a7, a2, s11
                  addi         t4, t5, 1285
                  c.beqz       s1, 5243f
                  sll          t4, a7, s10
                  addi         a4, tp, 1015
                  andi         t2, s8, 505
                  c.bnez       a1, 5239f
5239:             bltu         t0, s5, 5254f
                  mulhu        t6, s10, s1
                  sll          s6, t0, s10
                  mul          s5, sp, gp
5243:             xor          s6, t3, a0
                  mulhu        s2, s1, ra
                  ori          a2, t5, 823
                  bltu         t5, tp, 5250f
                  c.add        a0, s9
                  sltu         a3, sp, s10
                  srl          sp, a5, a2
5250:             mul          a4, s3, zero
                  and          s0, t2, a4
                  srai         a3, s3, 13
                  bge          s6, tp, 5268f
5254:             sra          t1, tp, s6
                  ori          a1, s9, 73
                  c.addi       ra, -1
                  mulhu        s5, t6, t4
                  c.addi       t3, 8
                  mulhsu       s11, a4, gp
                  c.bnez       s1, 5274f
                  add          s11, s1, s0
                  c.and        a1, a0
                  c.slli       s0, 21
                  c.srai       a4, 27
                  rem          s2, t6, a2
                  c.andi       a2, -1
                  c.beqz       a2, 5275f
5268:             c.sub        a3, s0
                  mulhu        a2, t3, t6
                  c.xor        a4, a4
                  xori         s9, tp, 1573
                  c.andi       s0, -1
                  slli         s11, tp, 1
5274:             mulh         t4, s9, tp
5275:             slli         s2, tp, 23
                  addi         s3, a5, 1748
                  addi         t0, a2, -855
                  c.and        a3, s1
                  c.addi16sp   sp, 432
                  remu         a2, a4, s7
                  blt          a1, ra, 5289f
                  slt          sp, s4, t6
                  divu         zero, t6, s9
                  c.bnez       a4, 5288f
                  slli         s9, s4, 9
                  c.sub        a1, a1
                  srli         s11, t2, 25
5288:             srai         sp, ra, 0
5289:             c.or         a4, a4
                  bge          zero, ra, 5291f
5291:             sltiu        t1, a2, -1516
                  c.sub        s0, a0
                  c.addi       a1, -1
                  c.srai       a2, 19
                  xori         t6, s9, -800
                  c.addi       a4, -1
                  lui          a0, 175630
                  c.xor        a1, a4
                  auipc        a1, 412455
                  c.mv         s7, a6
                  c.addi4spn   a4, sp, 704
                  c.xor        s0, s0
                  srli         ra, a0, 19
                  slli         s9, s5, 14
                  andi         s7, s5, 1411
                  c.nop
                  bne          t4, a5, 5315f
                  addi         s4, t2, -444
                  rem          s5, s5, s5
                  la           s2, region_0+199 #start load_store_instr_stream_2
                  lbu          a4, -12(s2)
                  la           t0, region_0+200 #start load_store_instr_stream_3
                  la           s7, region_0+883 #start load_store_instr_stream_4
                  la           s9, region_0+301 #start load_store_instr_stream_1
                  lb           t5, 221(t0)
                  la           a1, region_0+1216 #start load_store_instr_stream_0
                  lbu          sp, 16(s2)
                  lb           s5, -209(a1)
                  lb           t6, -120(a1)
                  lbu          s10, 52(s2)
                  sb           t6, 101(a1)
                  sb           sp, -12(s9)
                  sh           tp, -146(a1)
                  sh           s2, -198(t0)
                  lbu          s5, -10(s2)
                  sb           a1, -114(a1)
                  lbu          s6, -6(s7)
                  lb           t4, 7(t0)
                  lbu          a3, 2(s2)
                  sh           s6, 76(a1)
                  lbu          s1, 14(s9)
                  lb           s1, 55(t0)
                  lb           t6, 4(s9)
                  lhu          ra, -204(a1)
                  lhu          a3, -5(s9)
                  lb           gp, 224(t0)
                  sb           zero, -10(s9)
                  lbu          s5, -26(a1)
                  sb           t0, -115(t0)
                  lb           s11, 16(s7)
                  lb           t4, 8(s9)
                  lhu          zero, 13(s7)
                  lb           a4, -29(t0)
                  lbu          s8, -11(s9)
                  lbu          t4, 5(s2)
                  lh           s0, -15(s2)
                  sb           gp, 233(t0)
                  lbu          a2, -10(s9)
                  lb           s0, 35(t0)
                  lb           a7, -13(s7)
                  sb           ra, 28(t0) #end load_store_instr_stream_3
                  lb           t1, 46(s2) #end load_store_instr_stream_2
                  sh           a4, -220(a1)
                  sb           s0, -15(s7) #end load_store_instr_stream_4
                  sb           tp, -5(s9) #end load_store_instr_stream_1
                  lb           s10, -164(a1) #end load_store_instr_stream_0
                  bltu         a6, a0, 5315f
                  beq          a4, t1, 5317f
                  remu         t2, t2, t3
                  c.li         t4, -1
                  lui          s2, 783073
5315:             c.lui        a7, 18
                  sltiu        t5, s1, 1697
5317:             addi         t1, s3, -1765
                  mulh         gp, a1, t2
                  sll          sp, s9, s0
                  slti         t3, gp, 694
                  sltiu        s4, s5, 421
                  c.beqz       s1, 5331f
                  srl          t4, s7, s1
                  sra          t2, s7, s8
                  slt          s11, sp, t5
                  addi         gp, s5, -254
                  slt          s4, s6, sp
                  slli         a7, s7, 25
                  c.nop
                  beq          t2, a5, 5349f
5331:             c.andi       a1, 0
                  c.srai       a3, 2
                  andi         t2, t3, 1151
                  mulh         s6, t1, s10
                  sra          s7, ra, tp
                  sltu         a7, t5, s1
                  rem          s8, s0, sp
                  and          a2, s11, s0
                  beq          t3, t2, 5348f
                  mulhu        t0, s4, ra
                  sltiu        s3, sp, 1189
                  c.xor        a0, a4
                  mulhsu       ra, a4, t1
                  bltu         a5, a2, 5358f
                  div          s1, s6, a1
                  srai         t1, s4, 9
                  c.bnez       a4, 5364f
5348:             c.addi16sp   sp, -16
5349:             c.lui        t5, 9
                  andi         t3, a3, 1769
                  andi         t6, s6, -690
                  c.srli       s0, 25
                  srl          gp, a3, a4
                  mul          s3, s6, s11
                  addi         t5, s0, 1242
                  bgeu         a7, s8, 5374f
                  beq          t6, s7, 5372f
5358:             c.nop
                  lui          s6, 131570
                  c.bnez       a4, 5377f
                  or           t5, s9, a3
                  xori         s9, s9, -1522
                  c.sub        s1, a4
5364:             c.slli       s7, 16
                  beq          a5, t3, 5384f
                  c.xor        a0, a5
                  c.andi       a4, 17
                  bne          s1, t2, 5374f
                  or           ra, a5, t4
                  c.addi       a7, 15
                  andi         s5, zero, -1849
5372:             sra          s6, s2, s11
                  beq          t1, a1, 5381f
5374:             mul          s1, zero, s4
                  c.srli       a4, 28
                  and          sp, t5, s7
5377:             c.addi       s4, -1
                  c.beqz       s1, 5379f
5379:             slt          s9, sp, a4
                  slt          t2, t6, a1
5381:             rem          a7, s7, t1
                  addi         s2, t3, 1641
                  remu         ra, t3, s7
5384:             sra          t2, t6, a3
                  bltu         s10, zero, 5394f
                  c.and        a4, s1
                  c.srli       a3, 22
                  bge          a3, a6, 5400f
                  auipc        t0, 520184
                  mulhsu       t0, sp, s0
                  c.li         a0, -1
                  ori          t0, s2, 1136
                  c.and        a4, a0
5394:             srl          a3, s7, s11
                  lui          s8, 561548
                  c.lui        a7, 20
                  auipc        s7, 435563
                  bgeu         gp, s1, 5412f
                  slt          t4, s10, t3
5400:             c.or         a1, a1
                  srai         a7, t6, 29
                  nop
                  bgeu         s11, a3, 5421f
                  ori          a7, tp, 1012
                  c.mv         ra, a4
                  slli         s3, a5, 21
                  beq          a1, s11, 5425f
                  srl          ra, a2, s9
                  and          t4, s3, s1
                  rem          t6, s5, s9
                  c.xor        a0, a3
5412:             xori         zero, ra, 786
                  c.slli       a1, 12
                  slti         a1, gp, -1197
                  c.lui        a4, 3
                  blt          s5, a1, 5434f
                  c.or         a0, a2
                  bge          s8, t2, 5426f
                  sltu         t0, zero, a0
                  c.srli       a0, 8
5421:             xor          t2, a7, gp
                  bltu         a7, t3, 5426f
                  bne          t0, s2, 5439f
                  c.srai       a4, 18
5425:             c.andi       a4, -1
5426:             c.srli       a3, 24
                  addi         s6, t2, 1193
                  slli         s11, s8, 1
                  c.slli       s1, 31
                  sll          a7, s0, t6
                  c.bnez       a3, 5440f
                  mul          gp, t4, a7
                  lui          s8, 810930
5434:             c.srai       a1, 2
                  mulh         s2, s9, s10
                  nop
                  c.addi4spn   s1, sp, 784
                  slti         gp, s9, -70
5439:             c.addi       t3, 13
5440:             bne          s1, a5, 5458f
                  srl          t1, s6, a1
                  xor          s0, s3, sp
                  xori         s8, s3, 1151
                  slli         sp, t0, 12
                  c.slli       gp, 3
                  c.mv         s10, s1
                  bne          s2, t3, 5462f
                  mulh         s6, t2, a3
                  remu         a2, a7, a3
                  c.srai       s0, 2
                  bltu         t3, t6, 5452f
5452:             bne          s1, s8, 5467f
                  bgeu         t1, s5, 5458f
                  sll          ra, a4, s4
                  mulhu        ra, a7, t1
                  or           t1, zero, t6
                  sltu         s2, s0, t6
5458:             mul          gp, s9, a2
                  mulh         t5, t6, s11
                  addi         t1, sp, 311
                  c.addi       s2, -1
5462:             c.slli       t5, 4
                  c.beqz       s0, 5482f
                  c.nop
                  bne          a4, t4, 5477f
                  and          a1, s11, s5
5467:             slli         t2, a6, 7
                  sra          a7, a4, sp
                  xor          s0, a0, s6
                  c.srai       a1, 24
                  slli         sp, tp, 0
                  c.bnez       s0, 5479f
                  la           s1, region_1+1861 #start riscv_load_store_hazard_instr_stream_21
                  lhu          ra, 17(s1)
                  sh           t4, 17(s1)
                  lb           t0, 14(s1)
                  lbu          t6, 14(s1)
                  c.srli       a3, 5
                  sb           s3, 14(s1)
                  sb           t0, 14(s1)
                  lbu          a4, -20(s1)
                  c.xor        a2, a4
                  sb           tp, -20(s1)
                  sb           s7, -20(s1)
                  lb           gp, -20(s1)
                  c.nop
                  or           s8, t4, sp
                  lbu          gp, -20(s1)
                  auipc        sp, 1046610
                  sb           a2, -20(s1)
                  sb           t5, -20(s1) #end riscv_load_store_hazard_instr_stream_21
                  c.bnez       a2, 5487f
                  xori         s2, s3, 1842
                  add          a3, tp, s0
                  div          t2, zero, s3
5477:             c.xor        a4, a2
                  blt          a6, a3, 5492f
5479:             c.xor        s0, a0
                  nop
                  mulhsu       ra, a2, a7
5482:             ori          zero, a6, 1012
                  c.mv         a1, s6
                  c.addi4spn   a4, sp, 112
                  lui          s10, 397581
                  auipc        a1, 814646
5487:             bltu         t0, a1, 5496f
                  c.xor        a4, a4
                  slti         t5, a0, 1315
                  mul          s11, a7, a1
                  c.xor        a4, a4
5492:             nop
                  div          a4, a5, s6
                  nop
                  divu         t6, a5, s5
5496:             xor          s6, s7, sp
                  mul          s3, t2, s6
                  or           s5, s5, s3
                  c.lui        s1, 10
                  c.slli       t2, 18
                  srai         gp, s10, 12
                  or           t3, t6, a6
                  c.mv         gp, t4
                  ori          s7, sp, 536
                  mulhsu       s1, s6, a4
                  mulhsu       t3, s3, a7
                  c.srai       a3, 20
                  bgeu         tp, t4, 5516f
                  c.mv         a1, a6
                  sub          a0, s5, s9
                  sltiu        s11, s3, 1671
                  sra          s8, s6, s2
                  c.srli       a3, 12
                  xor          s0, ra, t5
                  c.mv         t4, t3
5516:             srl          s9, a2, t5
                  ori          s9, a7, 175
                  ori          s0, gp, 1767
                  c.lui        s6, 24
                  c.lui        a7, 28
                  c.beqz       a4, 5525f
                  mulh         s3, zero, t5
                  c.mv         t6, s0
                  rem          ra, a5, a3
5525:             c.beqz       a3, 5526f
5526:             remu         s1, t5, a0
                  c.bnez       s0, 5541f
                  c.bnez       a3, 5529f
5529:             bge          t3, zero, 5541f
                  ori          t0, s11, 2033
                  bne          s11, zero, 5535f
                  rem          t4, sp, a5
                  sltiu        s10, a6, 1881
                  c.nop
5535:             nop
                  andi         t3, a4, 1448
                  c.xor        a1, s1
                  mulh         gp, s10, a6
                  bltu         gp, s8, 5546f
                  c.addi       s6, 5
5541:             c.bnez       s1, 5545f
                  sltu         ra, a4, s1
                  srai         s1, t6, 10
                  bne          t1, s10, 5561f
5545:             c.sub        a1, a1
5546:             beq          a2, zero, 5564f
                  c.or         a3, s0
                  c.bnez       a2, 5562f
                  c.addi16sp   sp, 496
                  c.li         s10, -1
                  sll          t3, t1, a5
                  bgeu         ra, s10, 5567f
                  bne          t1, t1, 5572f
                  xor          ra, a4, s8
                  c.lui        a3, 12
                  c.addi16sp   sp, 304
                  andi         a3, s10, -986
                  bne          s0, t6, 5573f
                  mulh         a3, t2, t1
                  bltu         s9, t0, 5569f
5561:             sltu         ra, s11, a7
5562:             bge          s3, t2, 5563f
5563:             c.srai       a1, 3
5564:             c.add        t1, s5
                  bltu         t6, t3, 5583f
                  divu         s6, s6, s8
5567:             c.andi       a3, -1
                  sll          s1, a5, s5
5569:             c.addi16sp   sp, 416
                  c.beqz       a1, 5578f
                  remu         t5, t0, s5
5572:             xor          gp, s5, s9
5573:             mulhsu       t6, a7, a3
                  c.xor        s0, a4
                  mulh         s1, t6, s6
                  auipc        a4, 886886
                  xor          gp, a6, t1
5578:             mulhu        s7, t3, tp
                  sra          t5, ra, a4
                  c.srai       s1, 11
                  c.mv         ra, tp
                  nop
5583:             and          s4, s7, s4
                  c.mv         a0, t5
                  mulh         a3, s5, s5
                  slt          s8, t2, s8
                  c.or         s1, s0
                  divu         gp, t4, t2
                  c.srli       s1, 28
                  addi         a7, s10, 1649
                  bge          s6, t3, 5605f
                  bne          s6, t2, 5593f
5593:             lui          ra, 336777
                  c.srai       s0, 17
                  bge          s2, t2, 5610f
                  sub          s4, s9, s4
                  bge          s0, s4, 5606f
                  bltu         t2, a5, 5617f
                  c.mv         gp, gp
                  or           t5, s10, s1
                  mul          s11, t4, t5
                  c.li         s1, -1
                  lui          t6, 471090
                  sra          t1, t2, a2
5605:             slt          s3, a5, s9
5606:             c.addi       t6, -1
                  c.bnez       a0, 5625f
                  mul          s4, s11, a7
                  bge          tp, gp, 5614f
5610:             mulhu        t0, s7, s7
                  add          s3, a6, ra
                  c.sub        s0, a2
                  bgeu         t5, s6, 5631f
5614:             bne          a7, a2, 5623f
                  c.addi4spn   a2, sp, 688
                  remu         s11, gp, s2
5617:             auipc        t0, 326841
                  c.xor        s1, a2
                  c.bnez       s1, 5627f
                  mulhu        s3, a1, a4
                  c.srli       a4, 6
                  bgeu         gp, a0, 5634f
5623:             c.bnez       a2, 5629f
                  divu         gp, tp, a5
5625:             c.nop
                  c.sub        a3, a4
5627:             c.srai       a3, 26
                  xori         s1, a0, 819
5629:             c.addi4spn   a4, sp, 208
                  sub          s1, tp, t3
5631:             c.or         a1, a4
                  sub          s8, s4, sp
                  srl          s5, s11, s5
5634:             c.li         s0, -1
                  sra          s1, t3, a4
                  bne          a1, t0, 5644f
                  c.lui        s10, 31
                  rem          t4, s3, a7
                  c.xor        a2, a3
                  remu         a2, s10, a7
                  c.or         a0, s0
                  c.srli       a1, 22
                  c.and        a1, s1
5644:             srl          s11, s0, ra
                  or           a7, t6, s6
                  xori         s2, s1, -495
                  c.srli       a2, 29
                  xori         a0, s3, -722
                  sltu         s4, gp, a3
                  bltu         s3, a7, 5666f
                  nop
                  bge          s11, s6, 5656f
                  c.bnez       a2, 5672f
                  mulhsu       a3, s1, s4
                  sll          t6, s0, t4
5656:             blt          t3, a2, 5665f
                  bne          s7, s11, 5661f
                  c.xor        a4, a3
                  c.addi16sp   sp, 160
                  auipc        t4, 900231
5661:             c.slli       ra, 15
                  nop
                  srl          t6, zero, t4
                  slt          s9, a1, t6
5665:             addi         t2, sp, 516
5666:             sll          sp, t6, a3
                  c.addi4spn   a3, sp, 576
                  c.andi       s1, -1
                  c.mv         s5, a2
                  sltu         s1, s6, s4
                  sra          s3, s2, gp
5672:             andi         s2, s5, -1981
                  c.nop
                  c.nop
                  sltu         s11, a0, s8
                  slt          s7, s3, s6
                  c.mv         s4, a4
                  c.srai       a4, 31
                  srl          a0, t2, s2
                  sll          t1, s10, a4
                  c.beqz       s1, 5690f
                  c.slli       t4, 29
                  addi         s10, t4, -1233
                  bge          a3, s5, 5702f
                  c.addi4spn   a4, sp, 48
                  rem          t6, s9, s3
                  c.add        t4, a2
                  addi         sp, zero, 8 #init loop 0 counter
                  addi         a1, zero, 7 #init loop 0 limit
sub_3_149_0_t:    add          a2, a4, t2
                  c.nop
                  addi         sp, sp, -3 #update loop 0 counter
                  bgeu         sp, a1, sub_3_149_0_t #branch for loop 0
                  mulhsu       s0, a2, sp
                  c.lui        a3, 13
                  sltu         s0, s0, s0
5690:             mulh         s7, a0, a5
                  slli         s7, a5, 4
                  sub          s3, a6, s7
                  c.addi       t2, -1
                  slli         s8, t0, 14
                  nop
                  xor          t6, s6, a2
                  nop
                  slt          s0, a0, a6
                  sltu         s2, t4, tp
                  ori          a0, t4, 401
                  c.srli       a1, 27
5702:             andi         s0, a4, 1318
                  add          a2, tp, t6
                  lui          a7, 774013
                  c.srai       s0, 9
                  bgeu         a5, s4, 5724f
                  xor          a4, t4, a2
                  c.and        s0, s0
                  ori          t5, s5, 1661
                  andi         t4, s9, 346
                  bgeu         s0, t5, 5718f
                  c.beqz       a4, 5726f
                  c.beqz       a1, 5714f
5714:             c.add        sp, t6
                  mulh         t5, s10, sp
                  c.or         s1, a1
                  xor          s6, a1, t5
5718:             slti         a1, sp, -649
                  mulhsu       gp, t0, s5
                  c.slli       t1, 22
                  lui          s1, 990958
                  c.andi       s1, -1
                  c.andi       a1, 3
5724:             c.bnez       s0, 5742f
                  add          a4, s10, s3
5726:             c.xor        s1, s1
                  mul          t4, t3, t0
                  addi         s6, t1, -291
                  c.lui        s3, 15
                  or           t0, s4, t0
                  divu         t2, t5, t0
                  c.slli       a3, 7
                  mulh         zero, t1, gp
                  c.beqz       a1, 5753f
                  slli         a3, s6, 21
                  mulhsu       a2, s0, sp
                  blt          s3, a1, 5745f
                  c.lui        s0, 1
                  mul          gp, a1, ra
                  c.nop
                  div          sp, a3, a7
5742:             slli         a1, a3, 9
                  ori          gp, ra, -1470
                  div          s1, s2, t5
5745:             c.add        ra, s4
                  c.andi       s1, -1
                  or           t5, zero, s6
                  srl          ra, s1, s4
                  bge          t0, s0, 5761f
                  mulhsu       s2, s4, a0
                  andi         s3, a0, 996
                  add          a7, t6, s6
5753:             nop
                  c.bnez       a4, 5771f
                  c.li         t5, -1
                  srli         s4, a4, 20
                  c.lui        s8, 26
                  slt          t6, gp, ra
                  sra          t1, s2, s11
                  div          s11, t4, t6
5761:             sltu         s1, tp, gp
                  blt          t5, s11, 5771f
                  divu         s4, t4, t3
                  c.bnez       a3, 5776f
                  c.addi4spn   s1, sp, 144
                  addi         s11, s6, 1873
                  divu         sp, s2, s2
                  addi         t2, s10, 1703
                  andi         s3, a1, 511
                  andi         s2, a7, 269
5771:             mul          s9, t4, s0
                  slt          t5, t5, sp
                  mulh         a3, a6, tp
                  bge          a6, s7, 5782f
                  bge          s7, a5, 5783f
5776:             mulh         t3, tp, t2
                  sltiu        s2, s7, -239
                  slti         t1, s11, -21
                  bne          a5, a0, 5780f
5780:             bgeu         a2, s10, 5795f
                  ori          t3, s1, 868
5782:             bgeu         zero, zero, 5797f
5783:             c.srai       s0, 27
                  mul          s9, tp, s2
                  xori         s4, zero, -757
                  and          s3, s10, t2
                  blt          s4, a0, 5793f
                  andi         s9, a0, 945
                  srl          gp, t0, tp
                  andi         a0, a6, -1124
                  c.bnez       s1, 5805f
                  c.slli       gp, 5
5793:             mulh         s5, a7, s5
                  remu         s5, a7, gp
5795:             bltu         s7, s11, 5813f
                  c.addi4spn   s0, sp, 240
5797:             c.mv         s3, s11
                  c.lui        t6, 21
                  c.and        a4, a3
                  c.bnez       a2, 5815f
                  c.and        a3, s0
                  c.add        a0, s6
                  sll          s7, s11, s11
                  c.bnez       s1, 5809f
5805:             srai         s8, s3, 8
                  c.beqz       a1, 5820f
                  sll          s3, t1, sp
                  sltiu        zero, s1, -1184
5809:             remu         t5, a4, t6
                  add          s8, a2, a0
                  srli         ra, t0, 6
                  srli         t6, s5, 15
                  la           s0, region_0+1018 #start load_store_instr_stream_3
                  la           s7, region_0+858 #start load_store_instr_stream_1
                  la           s2, region_0+455 #start load_store_instr_stream_0
                  lh           sp, 46(s7)
                  lb           a2, -230(s2)
                  lb           sp, 237(s7)
                  la           t5, region_0+558 #start load_store_instr_stream_2
                  lbu          t1, -4(s0)
                  lb           a1, -131(s2)
                  sb           t3, 8(t5)
                  lw           s10, 18(s7)
                  lb           s5, 5(s0)
                  lbu          s9, -201(s7)
                  lhu          s6, -14(s0)
                  lh           s1, -10(t5)
                  lb           t3, 33(s7)
                  sw           s9, -6(t5)
                  sh           t2, 12(t5)
                  lh           s10, 28(s7)
                  lbu          a3, 268(s2)
                  sh           t1, 206(s7)
                  lb           s5, 720(s2)
                  lb           t6, 4(s0)
                  sw           s8, -10(t5)
                  lb           t2, 13(t5)
                  lb           s1, -111(s7)
                  sh           a6, 501(s2)
                  sh           tp, 0(s0)
                  lb           gp, -47(s7) #end load_store_instr_stream_1
                  lbu          gp, -13(t5) #end load_store_instr_stream_2
                  lb           a3, -13(s0) #end load_store_instr_stream_3
                  lbu          a7, 651(s2) #end load_store_instr_stream_0
5813:             mulhsu       a2, s2, s4
                  auipc        s11, 604613
5815:             div          s3, t4, a6
                  blt          s3, s3, 5832f
                  c.slli       s0, 10
                  bge          a1, s5, 5819f
5819:             xori         gp, s4, 1789
5820:             mulhu        s2, s7, t0
                  sub          t2, s6, a7
                  lui          a3, 440741
                  divu         t4, a5, s9
                  bgeu         t3, a5, 5839f
                  and          t0, zero, s3
                  srai         s2, s11, 6
                  srl          s7, t4, t0
                  c.addi16sp   sp, -16
                  c.bnez       a4, 5847f
                  c.lui        ra, 13
                  c.addi4spn   s0, sp, 112
5832:             c.add        a0, a7
                  auipc        s6, 789999
                  mulhu        t6, s0, s8
                  beq          t0, a0, 5843f
                  mulhu        a1, a3, s1
                  andi         s0, a0, 1961
                  remu         s6, a4, sp
5839:             bltu         t2, a1, 5857f
                  sltiu        t3, gp, 1803
                  andi         a1, s0, 1768
                  c.mv         a0, t2
5843:             c.sub        a4, a2
                  andi         s11, sp, -489
                  slli         t1, s5, 21
                  slli         t1, gp, 7
5847:             mulhu        a0, a7, t0
                  divu         s0, s10, s10
                  sltiu        s4, s1, -1021
                  c.and        a4, a3
                  bge          a5, s11, 5865f
                  c.srai       a1, 14
                  c.and        a2, s0
                  c.addi16sp   sp, 64
                  slli         s1, a7, 20
                  auipc        t3, 909207
5857:             addi         s0, s3, 1330
                  c.slli       s10, 6
                  beq          a5, t4, 5864f
                  c.addi4spn   a2, sp, 992
                  xor          a2, a0, s1
                  sub          s10, s10, t3
                  auipc        s6, 842690
5864:             c.slli       s4, 7
5865:             lui          s9, 320371
                  mulh         a3, a6, ra
                  nop
                  add          gp, s1, s8
                  bgeu         t2, a4, 5888f
                  srli         s11, a4, 30
                  c.bnez       a4, 5872f
5872:             c.and        a3, s0
                  xori         a4, sp, -99
                  c.srai       a4, 18
                  srli         t6, s6, 11
                  c.lui        s2, 1
                  mulhsu       a7, s11, a3
                  lui          s8, 611107
                  mulh         gp, s0, t4
                  bltu         t6, tp, 5881f
5881:             c.addi16sp   sp, 64
                  bltu         s7, s10, 5888f
                  srai         s3, gp, 16
                  srai         s1, a7, 2
                  c.nop
                  auipc        s7, 129501
                  slt          t3, s7, a7
5888:             div          t4, t6, t4
                  mul          a0, t6, t4
                  bne          s5, zero, 5904f
                  c.andi       a1, -1
                  xor          ra, a4, s1
                  srl          a0, a3, t0
                  c.srai       a3, 18
                  andi         s1, t2, -1022
                  bgeu         sp, s10, 5912f
                  bne          s0, s1, 5915f
                  div          s5, s2, tp
                  or           t6, s5, t3
                  add          s1, tp, s10
                  c.addi4spn   a3, sp, 480
                  mulhsu       a3, sp, t2
                  bge          t2, t0, 5915f
5904:             c.or         s0, a1
                  slt          t4, zero, s1
                  c.xor        a4, a4
                  and          t2, t1, a5
                  sub          s3, t1, s10
                  mulhu        s7, s8, sp
                  c.addi       a7, 11
                  c.add        t1, a6
5912:             c.li         t2, 3
                  c.xor        a4, a3
                  blt          s5, a7, 5929f
5915:             slt          s2, a1, s9
                  bgeu         a6, t4, 5925f
                  srli         s6, t5, 16
                  c.lui        s10, 2
                  mulhu        a7, s0, s6
                  sll          t2, s3, ra
                  c.addi16sp   sp, -16
                  blt          a6, tp, 5937f
                  mulhsu       s8, tp, gp
                  slti         s11, a3, -157
5925:             remu         t2, tp, t4
                  add          t6, a1, zero
                  bge          t4, s10, 5941f
                  sltu         s1, a7, t2
5929:             c.srai       a0, 23
                  ori          a3, gp, 1983
                  andi         zero, s2, 1219
                  xori         a4, s2, 1925
                  remu         s1, t1, t2
                  xor          a7, a6, s4
                  c.srai       s1, 29
                  sra          t4, t4, t4
5937:             div          t6, t3, t2
                  c.add        s10, a1
                  c.or         a3, a0
                  c.or         a3, a3
5941:             mulhu        t0, s8, s7
                  c.srli       a2, 17
                  c.andi       s0, -1
                  c.bnez       a1, 5956f
                  blt          s7, s2, 5954f
                  c.add        s8, gp
                  addi         s1, s10, 415
                  lui          s3, 47069
                  remu         sp, t4, s11
                  sra          t5, t5, t4
                  or           sp, s6, a3
                  xori         t2, s2, -988
                  mulhu        s9, s6, t2
5954:             c.beqz       s0, 5972f
                  mulh         s5, a0, a1
5956:             bne          t3, s3, 5960f
                  c.li         s7, 15
                  c.nop
                  bgeu         ra, s3, 5967f
5960:             bne          a3, t3, 5968f
                  bge          s6, t4, 5968f
                  auipc        t3, 575348
                  sra          a4, a0, a4
                  ori          s7, s8, 759
                  c.sub        s1, a3
                  srli         s11, s11, 15
5967:             rem          a0, t5, s1
5968:             sll          a4, s11, s8
                  srai         a7, a6, 7
                  c.andi       s1, -1
                  sltiu        s9, a5, -572
5972:             c.srli       a3, 13
                  c.addi       s7, -1
                  c.add        s3, tp
                  rem          s4, s6, t3
                  bgeu         s11, a7, 5993f
                  nop
                  c.li         s0, -1
                  c.bnez       a3, 5988f
                  divu         s2, a3, t2
                  c.bnez       a4, 5985f
                  div          s11, s9, a1
                  c.or         s0, a2
                  addi         a7, s10, 1457
5985:             addi         s11, zero, -1057
                  c.nop
                  xori         s10, t6, 945
5988:             c.slli       t2, 11
                  c.add        s0, a1
                  c.and        a4, a1
                  auipc        a3, 632147
                  divu         s6, zero, s1
5993:             sltiu        s8, s9, 2016
                  bne          s2, s8, 6013f
                  la           t5, amo_0+4 #start riscv_amo_instr_stream_4
                  la           a7, amo_0+32
                  la           t3, amo_0+60
                  amominu.w     s0, a0, (a7)
                  amomaxu.w.aq  s9, s9, (a7)
                  amomaxu.w.rl  s0, t6, (t5)
                  amomaxu.w.aq  gp, s5, (t3)
                  amoand.w.rl   s2, a4, (t5)
                  c.slli       t2, 14
                  amominu.w.aq  gp, a7, (t5) #end riscv_amo_instr_stream_4
                  srai         t1, t5, 12
                  c.srai       a4, 19
                  c.add        s5, a1
                  bge          s9, s1, 5999f
5999:             add          s5, s3, gp
                  and          s5, a0, s3
                  andi         s10, a3, 200
                  c.slli       s11, 10
                  andi         a3, s8, -11
                  c.bnez       a4, 6020f
                  c.addi16sp   sp, 272
                  c.addi16sp   sp, 256
                  c.mv         ra, s9
                  c.add        s4, ra
                  mulhu        s4, a3, s1
                  c.or         s1, a5
                  and          a7, a7, s6
                  c.li         ra, -1
6013:             bltu         t2, a3, 6014f
6014:             lui          t0, 610642
                  srai         s3, s5, 18
                  or           t2, t1, t4
                  divu         t4, s6, s7
                  bne          gp, t6, 6022f
                  xori         a7, s3, 1204
6020:             c.slli       s3, 27
                  sra          a4, s10, s1
6022:             c.li         s11, 22
                  c.or         a3, a3
                  c.add        t0, s6
                  c.srai       a1, 11
                  auipc        s6, 497080
                  c.sub        a1, a3
                  c.addi16sp   sp, 16
                  c.beqz       a0, 6046f
                  srl          a1, a4, t4
                  sltiu        zero, s5, 1903
                  srl          t6, s7, a4
                  andi         t1, s11, 844
                  sltiu        s6, s8, -1613
                  c.sub        s0, a3
                  c.lui        t5, 24
                  sltu         s11, s3, s5
                  sltiu        a4, a7, -254
                  remu         a0, a7, t3
                  bge          t6, a7, 6059f
                  mulhsu       ra, t1, t0
                  bltu         t2, s8, 6057f
                  rem          a3, s1, s11
                  and          s10, s10, ra
                  mulhu        t6, s4, t3
6046:             nop
                  slti         sp, a0, 1402
                  andi         t5, t4, -786
                  remu         s8, a7, a3
                  slt          ra, s6, a4
                  beq          tp, a7, 6065f
                  srl          s1, t3, s2
                  sll          zero, tp, a6
                  mulhu        zero, a1, zero
                  slti         s4, t3, -4
                  c.andi       a0, 23
6057:             srli         s8, s3, 9
                  c.srli       a4, 30
6059:             c.add        t6, ra
                  srli         a1, zero, 31
                  srl          s9, s7, s11
                  lui          t1, 770634
                  auipc        s6, 969091
                  c.beqz       a4, 6078f
6065:             c.beqz       s1, 6077f
                  c.add        a7, s7
                  ori          a4, s0, 460
                  c.lui        t2, 26
                  sra          a3, s3, a5
                  sltu         a4, s10, a6
                  c.or         a2, s0
                  remu         zero, a3, s3
                  auipc        t5, 579993
                  nop
                  c.addi       ra, 11
                  beq          s1, sp, 6088f
6077:             bge          t2, t2, 6085f
6078:             sra          ra, t0, s3
                  srli         s7, t2, 6
                  c.beqz       s0, 6089f
                  c.and        a0, s1
                  srli         s7, ra, 17
                  srli         t5, s8, 11
                  srl          sp, a3, s3
6085:             sra          s1, s6, zero
                  mul          t1, ra, a2
                  c.nop
6088:             divu         t5, t5, s0
6089:             sub          gp, s5, s0
                  nop
                  c.xor        a0, a3
                  c.lui        t1, 9
                  c.and        s1, a4
                  mulh         t6, t0, s2
                  xor          t6, tp, t4
                  c.li         a2, 1
                  nop
                  bltu         s6, a4, 6099f
6099:             srli         a2, tp, 4
                  c.addi       s10, 2
                  c.addi4spn   a2, sp, 304
                  sltiu        s5, s0, -2026
                  srai         s8, ra, 3
                  c.srai       a4, 8
                  auipc        t1, 148063
                  lui          a1, 146013
                  addi         a3, s1, 658
                  or           a4, zero, t2
                  bge          a2, s1, 6128f
                  add          t3, s2, s7
                  c.xor        a2, a3
                  remu         t5, a3, s11
                  bne          ra, a5, 6120f
                  sll          a7, s0, a2
                  mulh         a3, t4, s0
                  ori          t4, s11, -897
                  c.andi       s0, 23
                  la           t3, amo_0+56 #start riscv_lr_sc_instr_stream_18
                  mulhu        s9, t1, t5
                  c.addi16sp   sp, 288
                  divu         s8, t1, t3
                  slti         s1, s10, -15
                  andi         s4, t0, -1379
                  slti         a2, s8, -684
                  lr.w.rl       s1, (t3)
                  c.slli       a3, 31
                  divu         s10, t4, a7
                  c.srli       a2, 2
                  c.addi4spn   a3, sp, 528
                  mulhu        s11, ra, a2
                  sltiu        a1, zero, -1342
                  sc.w.aq       a1, s9, (t3) #end riscv_lr_sc_instr_stream_18
                  xor          t1, s2, s2
                  c.add        a2, t5
6120:             c.and        s0, a0
                  and          s4, gp, sp
                  rem          s11, a2, t6
                  c.srli       a4, 21
                  sltiu        a2, s5, -541
                  sltiu        sp, ra, -922
                  slti         t1, a4, -372
                  c.andi       a2, -1
6128:             bne          s8, s10, 6129f
6129:             srl          sp, s1, a7
                  and          s4, tp, t3
                  c.and        a4, s1
                  c.addi       a0, -1
                  mul          s3, s10, t3
                  slli         gp, s11, 23
                  mulhsu       a0, s4, s4
                  c.beqz       s0, 6144f
                  c.lui        t2, 19
                  lui          t6, 760730
                  c.addi16sp   sp, 64
                  mulhsu       s2, t1, s6
                  c.sub        a4, a5
                  remu         a0, t2, t2
                  c.mv         t1, s8
6144:             c.nop
                  beq          a0, s8, 6153f
                  auipc        s3, 104245
                  c.or         a2, a3
                  c.slli       a4, 30
                  auipc        s0, 765002
                  mulhu        t0, a4, ra
                  or           s1, s0, a7
                  c.nop
6153:             andi         t5, gp, -996
                  sltu         t3, a6, s6
                  c.or         a1, a5
                  blt          s1, sp, 6174f
                  c.andi       a3, 2
                  sll          a2, a7, a5
                  andi         s7, s0, 18
                  c.srli       a0, 30
                  c.nop
                  bge          a3, s8, 6167f
                  srli         s8, a4, 24
                  slli         s2, s9, 0
                  xor          a1, s8, s1
                  c.or         a3, s0
6167:             or           t6, a3, s4
                  c.xor        a1, a1
                  c.slli       a2, 9
                  bge          zero, a1, 6174f
                  slli         t0, t3, 27
                  c.addi       s8, -1
                  mulhu        s5, s10, a1
                  la           s6, region_0+83 #start riscv_hazard_instr_stream_28
                  lbu          a2, 94(s6)
                  c.and        a2, a0
                  and          a3, a0, a7
                  c.srai       a0, 17
                  rem          a7, a3, a2
                  c.srli       a2, 22
                  c.andi       a2, -1
                  sltu         a7, a2, a3
                  divu         a3, a2, a3
                  lh           a7, 39(s6)
                  slt          s7, a2, s7
                  addi         a2, s5, -853
                  sb           a3, 42(s6)
                  lb           s5, 171(s6)
                  sub          a2, a0, a7
                  c.and        a3, a3
                  lb           a2, 160(s6)
                  sb           a7, 98(s6)
                  lh           a2, 115(s6)
                  sb           a0, 146(s6)
                  slt          s7, a3, a0
                  lhu          s5, -45(s6)
                  srl          s7, a3, a0
                  lhu          s5, 213(s6)
                  mul          s5, s5, a2
                  c.slli       s5, 5
                  sb           a7, 253(s6)
                  lb           a2, 94(s6)
                  add          a7, s5, s7
                  lbu          a7, -6(s6)
                  c.slli       s5, 31
                  addi         a7, a7, -706
                  lbu          s5, 224(s6)
                  addi         a7, s7, 1184
                  sra          a2, a2, s5
                  c.srai       a2, 14
                  rem          s5, a3, a3
                  srli         a0, s5, 2
                  sb           s5, 42(s6)
                  and          s7, a2, a0
                  lb           a0, 176(s6)
                  sra          a0, a3, a2
                  slt          s7, a7, a7
                  lh           s5, 19(s6)
                  c.sub        a0, a3
                  mulhu        s5, a3, s5
                  sb           s7, 162(s6)
                  lb           s7, 50(s6)
                  addi         a0, a7, 734
                  lbu          s5, 150(s6) #end riscv_hazard_instr_stream_28
6174:             c.srai       a3, 4
                  xor          a3, s11, s8
                  auipc        a7, 956979
                  divu         t3, t6, a3
                  c.nop
                  beq          s4, a5, 6188f
                  bgeu         tp, a7, 6186f
                  c.addi4spn   s1, sp, 832
                  xori         t2, s6, -1789
                  c.add        t4, s8
                  auipc        s0, 145100
                  mulhsu       a0, s5, tp
6186:             xori         s0, s6, 2019
                  c.addi       sp, -1
6188:             c.xor        a1, a3
                  c.bnez       a0, 6203f
                  c.mv         s7, tp
                  addi         s5, t6, 1635
                  lui          s5, 544206
                  sltiu        s2, zero, 1426
                  ori          s10, s6, -1929
                  sra          t1, a7, s2
                  sub          a1, s2, s0
                  c.beqz       a2, 6215f
                  c.xor        a3, a5
                  c.addi       t6, -1
                  c.nop
                  mulh         s5, a5, gp
                  sltiu        s4, a6, -1827
6203:             addi         a3, s11, -1145
                  xor          a7, t3, a6
                  sra          a7, s9, sp
                  nop
                  and          sp, sp, ra
                  sra          s4, a4, t6
                  c.xor        s0, s0
                  lui          t1, 854643
                  c.addi16sp   sp, 16
                  c.or         s1, a0
                  sltu         gp, a6, tp
                  c.addi4spn   s1, sp, 576
6215:             c.beqz       s1, 6233f
                  sltu         s8, t3, a5
                  srai         t5, s6, 29
                  slt          s8, t3, s8
                  divu         s3, s10, s5
                  mulh         sp, sp, s2
                  c.xor        a3, a0
                  mulhu        s7, a1, t3
                  srli         a2, t3, 27
                  slti         s1, s10, 1411
                  or           s7, sp, t5
                  c.nop
                  or           s7, s3, s10
                  or           t3, s8, tp
                  sltiu        a7, s5, -1426
                  blt          sp, t5, 6248f
                  bltu         t4, s9, 6240f
                  beq          sp, s0, 6247f
6233:             or           a1, zero, t2
                  c.or         a0, a3
                  c.lui        s3, 4
                  c.slli       t0, 6
                  bne          zero, s10, 6252f
                  c.nop
                  or           s6, s0, t2
6240:             or           s0, a0, s9
                  rem          ra, ra, a3
                  blt          s5, s5, 6251f
                  c.addi16sp   sp, -16
                  div          s2, a3, a0
                  slt          t3, t0, ra
                  c.xor        s1, a1
6247:             bltu         s6, a0, 6262f
6248:             blt          s10, s8, 6257f
                  and          s1, t3, s4
                  slt          a3, a0, t0
6251:             c.sub        a0, a3
6252:             or           s3, s3, s10
                  bgeu         a4, s10, 6265f
                  bltu         s9, zero, 6268f
                  ori          zero, s8, 867
                  c.slli       s0, 26
6257:             c.slli       a2, 1
                  slli         ra, a7, 4
                  c.bnez       s1, 6267f
                  srl          s3, tp, a6
                  c.beqz       a0, 6279f
6262:             c.srai       s0, 18
                  c.nop
                  addi         t1, a1, 1019
6265:             sltiu        s4, a3, -363
                  srli         t5, s5, 16
6267:             c.addi       a3, 9
6268:             c.or         a0, a3
                  sub          zero, s5, t4
                  c.xor        s1, a0
                  c.add        s5, s3
                  c.add        t0, t0
                  rem          zero, a0, s7
                  mul          s0, s9, s8
                  div          s4, a7, s2
                  ori          t4, t0, 1084
                  addi         a2, t4, -23
                  or           s9, a6, s6
6279:             nop
                  c.addi4spn   a2, sp, 784
                  xor          a2, t4, a7
                  div          zero, s2, ra
                  lui          t1, 868072
                  c.and        a4, s0
                  sltu         a7, sp, t4
                  auipc        s1, 89774
                  slli         t6, t3, 4
                  slti         ra, a7, -1080
                  srl          s2, s9, a4
                  mulhu        s8, t4, a0
                  and          a4, s5, t5
                  c.srai       a2, 14
                  c.and        s0, a2
                  sltiu        a0, s11, 400
                  c.beqz       a0, 6296f
6296:             sltiu        s10, s2, 657
                  c.addi16sp   sp, 448
                  c.srli       s0, 16
                  bltu         s3, s8, 6316f
                  slti         a0, t3, 960
                  c.addi       ra, -1
                  remu         zero, s11, a4
                  c.andi       s1, 18
                  divu         t3, a3, ra
                  c.srai       a3, 2
                  sltu         ra, zero, a5
                  lui          a4, 985282
                  slli         t2, t3, 13
                  c.li         s2, 8
                  beq          s5, t2, 6322f
                  c.addi4spn   a4, sp, 32
                  or           a0, s0, s10
                  or           a3, a6, s11
                  or           t5, s5, ra
                  blt          a1, t3, 6323f
6316:             auipc        gp, 524814
                  divu         s2, s3, a5
                  c.addi16sp   sp, -16
                  mulh         s4, t5, s3
                  or           t6, a5, s10
                  c.lui        s2, 3
6322:             c.srai       s1, 13
6323:             or           a0, sp, s10
                  c.bnez       s1, 6338f
                  sra          zero, a3, t1
                  c.bnez       a0, 6341f
                  c.sub        a4, a0
                  ori          a3, s3, 1107
                  auipc        t3, 649571
                  c.srai       s1, 4
                  div          a1, s4, t0
                  and          t1, a0, t1
                  mul          s9, a0, t0
                  lui          t4, 607879
                  c.mv         gp, a0
                  c.sub        a0, a0
                  blt          s1, a0, 6352f
6338:             mulhu        t4, s1, s11
                  blt          s8, a4, 6357f
                  srl          s9, s5, ra
6341:             sltiu        a7, s2, -763
                  nop
                  c.addi16sp   sp, -16
                  mulhu        sp, s3, t2
                  bge          s5, s1, 6363f
                  xor          s3, tp, a2
                  mulhsu       gp, tp, s10
                  c.add        t4, a6
                  c.and        a4, s0
                  bltu         s6, s8, 6355f
                  xori         a7, t1, -1360
6352:             c.andi       a1, 17
                  c.li         a2, 14
                  c.addi       t4, -1
6355:             sltu         t4, s7, gp
                  ori          s4, zero, 624
6357:             c.xor        a0, s0
                  mulhsu       sp, ra, s8
                  c.beqz       s1, 6360f
6360:             bltu         s9, a1, 6374f
                  blt          t0, ra, 6368f
                  c.addi16sp   sp, 336
6363:             c.or         s0, a1
                  c.srli       a0, 1
                  c.bnez       a2, 6369f
                  beq          a2, t2, 6367f
6367:             srl          a3, s9, t2
6368:             slli         s9, a4, 17
6369:             c.andi       a3, -1
                  andi         s10, t0, 296
                  and          s4, a7, t1
                  mulh         s1, a2, s8
                  sltiu        s3, a3, 1709
6374:             mulhu        a2, a2, gp
                  mulhsu       a0, gp, a5
                  srli         s0, a5, 7
                  bge          t4, ra, 6386f
                  c.srli       a4, 18
                  c.addi16sp   sp, -16
                  srai         s1, a7, 20
                  addi         a7, s3, 305
                  remu         t2, t6, ra
                  c.lui        s1, 21
                  beq          t5, sp, 6390f
                  lui          t3, 527672
6386:             c.beqz       a2, 6402f
                  ori          s9, ra, -1797
                  bgeu         t3, sp, 6392f
                  c.andi       s1, 30
6390:             mulhu        t5, a6, s0
                  c.xor        s0, a4
6392:             bltu         sp, zero, 6400f
                  c.and        a0, a5
                  mul          a1, s10, s4
                  c.srai       a1, 28
                  bge          t4, s3, 6415f
                  and          t3, s10, s2
                  lui          t6, 454313
                  lui          t4, 112056
6400:             slt          s0, s1, t2
                  div          s5, a5, ra
6402:             rem          a4, t3, ra
                  sra          s8, s9, sp
                  c.sub        a4, a2
                  mulhsu       s5, s5, s5
                  bge          t0, t5, 6425f
                  xor          s4, zero, a0
                  sltu         s3, s5, t5
                  c.sub        a0, s1
                  slt          ra, s4, s3
                  c.add        s6, t2
                  c.or         a2, a1
                  c.sub        s0, a5
                  c.nop
6415:             rem          s2, s2, a5
                  c.addi16sp   sp, -16
                  rem          s10, t4, a0
                  c.bnez       a4, 6436f
                  c.nop
                  rem          t1, s10, a3
                  andi         a3, t4, -337
                  sub          a2, t4, a4
                  nop
                  slt          a1, s0, gp
6425:             bltu         a4, t3, 6443f
                  and          s10, s5, t4
                  mul          s5, s11, tp
                  c.sub        s1, s0
                  add          zero, s2, a4
                  bge          s0, s7, 6438f
                  ori          t1, s5, 159
                  c.srai       a3, 3
                  ori          s5, s5, 1020
                  c.srli       a4, 8
                  remu         s7, t0, s10
6436:             c.li         s4, -1
                  c.beqz       a3, 6456f
6438:             lui          s7, 359366
                  add          s8, t0, a3
                  bgeu         s1, ra, 6452f
                  c.addi4spn   a2, sp, 592
                  xor          ra, t0, s3
6443:             and          a7, t3, sp
                  divu         s11, t2, s3
                  c.or         a2, a4
                  c.beqz       s0, 6464f
                  rem          s2, tp, t0
                  c.srai       a0, 31
                  c.mv         a0, a1
                  mulhsu       s1, a5, t1
                  sll          s9, t2, a3
6452:             c.beqz       a0, 6459f
                  srl          s3, gp, s1
                  lui          s5, 93540
                  lui          t3, 78440
6456:             divu         a1, a1, t4
                  sra          t3, t0, s0
                  lui          s3, 764311
6459:             auipc        s7, 565665
                  c.or         a1, a0
                  c.sub        a3, a4
                  c.or         a2, a3
                  blt          tp, s4, 6478f
6464:             auipc        s1, 853338
                  divu         s4, t4, a5
                  sub          s4, zero, t2
                  rem          sp, a3, s0
                  beq          gp, s8, 6469f
6469:             xor          t6, a2, a4
                  andi         t6, t5, -62
                  sll          t0, a6, s5
                  sra          a3, s2, a7
                  c.addi       a7, -1
                  addi         a2, t2, 2007
                  addi         t3, zero, 445
                  sltiu        s0, t2, 1455
                  or           a3, s11, a7
6478:             c.addi4spn   s0, sp, 880
                  c.addi4spn   a0, sp, 208
                  c.or         a4, s0
                  rem          ra, s4, s0
                  c.srai       a4, 24
                  sll          t6, t0, t1
                  sub          s0, s4, s3
                  sub          a2, t5, s1
                  c.srai       a1, 25
                  andi         s10, a3, 925
                  c.and        s0, a5
                  remu         a3, t5, a1
                  auipc        sp, 496397
                  bne          s0, tp, 6495f
                  srl          t0, s10, s4
                  c.beqz       a4, 6508f
                  c.sub        s1, s0
6495:             slli         s9, s4, 10
                  c.bnez       a1, 6505f
                  add          s0, a2, s2
                  bgeu         a0, s7, 6513f
                  slli         s4, t6, 9
                  c.slli       s11, 27
                  sll          t1, a2, s6
                  andi         t1, s8, 1382
                  c.addi       t5, -1
                  bge          t0, s0, 6512f
6505:             sltu         t2, s11, s1
                  c.add        a1, s5
                  c.bnez       s0, 6511f
6508:             c.sub        a3, a1
                  slt          ra, s9, a0
                  rem          s1, t2, a4
6511:             remu         s5, t1, a5
6512:             mulhsu       a4, ra, a2
6513:             remu         zero, t6, a1
                  and          gp, ra, a5
                  andi         s4, s4, -503
                  add          s8, s2, zero
                  c.addi       s2, -1
                  sltu         s2, a6, s0
                  c.addi16sp   sp, 256
                  c.li         s0, 31
                  srli         zero, t4, 29
                  c.mv         a2, s11
                  sll          t2, tp, a6
                  andi         t0, s8, -1288
                  sltiu        s9, s2, 1013
                  blt          a0, s3, 6540f
                  add          s8, sp, s3
                  mulh         s7, ra, a0
                  blt          tp, s11, 6530f
6530:             slti         gp, gp, -1506
                  rem          s6, a5, t6
                  srl          s11, t1, a6
                  blt          a0, t3, 6549f
                  c.lui        t3, 7
                  addi         sp, a0, -748
                  c.nop
                  c.xor        a2, s1
                  xori         a2, s1, 840
                  xor          a2, a5, sp
6540:             sll          a4, s3, s1
                  c.srli       s1, 17
                  c.addi16sp   sp, 176
                  xori         gp, ra, 1038
                  c.nop
                  rem          s2, s10, t3
                  c.srli       a0, 23
                  nop
                  bge          s11, t6, 6562f
6549:             slli         t1, sp, 8
                  and          gp, t1, s6
                  sll          s7, a7, t2
                  c.addi       sp, -1
                  sll          s10, a6, sp
                  bne          t1, a5, 6560f
                  nop
                  add          s10, s3, a1
                  srai         a1, tp, 6
                  slli         s11, s8, 7
                  bgeu         s2, s9, 6568f
6560:             or           s1, a7, s5
                  nop
6562:             mulhsu       a2, t3, ra
                  sltiu        s11, a6, -940
                  c.li         ra, -1
                  div          s7, t5, t6
                  sltiu        s2, a3, -1226
                  c.lui        a2, 27
6568:             remu         zero, t5, a6
                  sub          s4, s6, a3
                  c.lui        s1, 27
                  div          s0, s8, s3
                  c.beqz       a4, 6591f
                  c.mv         a7, a4
                  c.addi4spn   a2, sp, 528
                  xori         s4, s3, -989
                  sub          t2, s7, a4
                  sra          s5, s0, a4
                  c.addi16sp   sp, 400
                  slt          t4, s5, s3
                  c.srai       s0, 21
                  sltiu        s6, s3, -1446
                  sra          s10, t1, a1
                  slt          zero, tp, t1
                  bgeu         s7, a2, 6589f
                  srl          s4, s10, s5
                  xor          gp, a5, t4
                  xor          zero, a6, s7
                  or           a2, t3, a2
6589:             blt          s5, a4, 6606f
                  rem          zero, s9, a4
6591:             c.lui        s2, 14
                  slt          s4, a2, t6
                  mulh         s4, t2, t1
                  auipc        s7, 910077
                  c.addi16sp   sp, -16
                  remu         s3, s10, t6
                  remu         t4, s11, a3
                  auipc        s3, 781576
                  srli         t4, s0, 21
                  srli         s0, a6, 18
                  auipc        t4, 477508
                  c.addi16sp   sp, -16
                  c.lui        s6, 17
                  slti         t2, a3, -181
                  c.and        a0, s0
6606:             auipc        t2, 1038481
                  c.andi       a0, -1
                  la           t1, region_0+1740 #start load_store_instr_stream_1
                  la           s7, region_0+903 #start load_store_instr_stream_0
                  sb           s10, 231(t1)
                  lb           s1, 46(s7)
                  lbu          s5, -21(t1)
                  la           s2, region_0+1716 #start load_store_instr_stream_3
                  lb           a7, 182(t1)
                  sb           s1, 205(t1)
                  la           a3, region_0+998 #start load_store_instr_stream_2
                  lb           t6, 3(s2)
                  sh           t6, 2(a3)
                  lbu          s11, -50(s7)
                  sb           s5, -11(t1)
                  lb           s9, 18(s7)
                  sb           ra, 7(s2)
                  lb           t4, -39(s7)
                  lb           s1, 4(s2)
                  sh           tp, 16(a3)
                  lbu          a1, -11(a3)
                  lb           t5, 14(s2)
                  lbu          s4, 191(t1)
                  sh           t0, 11(s7)
                  sh           s10, -10(a3)
                  lbu          t0, -72(t1)
                  sb           tp, 10(s2)
                  sh           s2, -8(a3) #end load_store_instr_stream_2
                  sb           t6, -14(s2) #end load_store_instr_stream_3
                  sb           t3, 52(s7)
                  lb           s9, -44(s7)
                  sh           a2, 140(t1) #end load_store_instr_stream_1
                  lb           t4, -25(s7) #end load_store_instr_stream_0
                  xor          t5, s10, s4
                  c.slli       s4, 1
                  c.or         s1, a1
                  rem          a0, a7, gp
                  bne          s7, s11, 6630f
                  or           s9, a1, a7
                  c.beqz       a3, 6623f
                  c.li         a2, -1
                  srli         s2, a1, 20
                  and          t6, a6, t5
                  c.bnez       a3, 6632f
                  c.beqz       a2, 6620f
6620:             srl          sp, a3, s5
                  slt          a2, s1, t3
                  mulhu        sp, t5, s4
6623:             c.add        s6, a2
                  addi         a3, s1, 1565
                  bne          ra, a4, 6633f
                  add          s10, s11, a2
                  srl          a2, a4, s5
                  auipc        s7, 273437
                  rem          a3, t1, tp
6630:             c.addi       s0, -1
                  slt          s0, s2, s1
6632:             xori         t3, t6, 2002
6633:             lui          s8, 1046529
                  c.nop
                  c.andi       a2, -1
                  bne          s4, t6, 6648f
                  auipc        s8, 118124
                  c.or         a2, s0
                  c.bnez       a0, 6657f
                  rem          s10, s7, s10
                  c.beqz       a2, 6649f
                  and          a2, a0, gp
                  c.and        a3, a0
                  and          t6, t4, ra
                  sltu         a2, s3, a3
                  c.add        a0, s6
                  divu         gp, s4, a5
6648:             sub          s10, tp, s4
6649:             andi         a4, sp, -759
                  xori         t2, t0, -1922
                  sll          a1, tp, s3
                  sltu         s4, a4, s10
                  srl          zero, a0, t0
                  c.slli       t1, 17
                  sltu         t5, s11, s1
                  sub          a1, s7, a7
6657:             mulh         ra, s3, s4
                  sra          s11, zero, t2
                  ori          a4, t1, 2038
                  mulh         s3, ra, s8
                  c.li         s3, 18
                  c.xor        a0, a4
                  xor          s6, sp, s11
                  c.bnez       s0, 6665f
6665:             slli         s3, tp, 0
                  c.beqz       a1, 6667f
6667:             c.xor        a0, a0
                  srli         s8, s6, 23
                  and          t4, s9, s8
                  srai         t3, a3, 24
                  addi         s5, tp, 614
                  bge          s9, s5, 6684f
                  c.xor        a1, a2
                  mulhsu       s5, t3, ra
                  c.srli       a2, 29
                  ori          s6, s11, 21
                  div          s5, s2, t0
                  c.add        s11, s9
                  c.srli       a3, 5
                  auipc        gp, 625454
                  sll          s11, a1, t1
                  andi         s10, a7, -939
                  sltiu        t4, s3, -712
6684:             slt          a7, s1, t4
                  xor          sp, gp, sp
                  div          s3, t6, s8
                  sra          s7, s0, t3
                  andi         gp, zero, 298
                  sra          s6, sp, a0
                  and          zero, gp, s5
                  c.srli       a3, 17
                  bge          s4, t5, 6697f
                  div          s1, t4, s4
                  add          s3, a3, s9
                  sltiu        s5, s5, 899
                  bgeu         s7, a7, 6703f
6697:             srai         a4, s7, 28
                  c.srli       a3, 3
                  bne          t3, t2, 6717f
                  c.nop
                  ori          a2, a0, -165
                  beq          a4, t5, 6716f
6703:             slli         s0, gp, 14
                  c.xor        s1, a2
                  slli         ra, s3, 4
                  addi         t6, zero, 10 #init loop 0 counter
                  div          t3, ra, s11
                  c.li         sp, -1
                  c.mv         a7, a4
                  addi         s0, zero, 10 #init loop 0 limit
                  c.srai       a1, 1
                  remu         s5, s8, s10
                  mulhsu       a3, t3, s11
                  add          a3, a5, s10
                  c.addi16sp   sp, 384
                  c.li         t1, -1
                  c.or         s1, s1
                  srai         t0, s11, 28
                  sltu         s5, s5, a5
sub_3_145_0_t:    mulh         t0, s3, sp
                  c.and        a3, a1
                  sltu         ra, a1, s2
                  c.li         a1, -1
                  rem          t2, s2, tp
                  addi         t6, t6, -8 #update loop 0 counter
                  nop
                  auipc        t2, 135729
                  bgeu         t6, s0, sub_3_145_0_t #branch for loop 0
                  nop
                  srli         s11, a3, 28
                  ori          s9, a0, 328
                  bge          t0, a5, 6712f
                  c.mv         s6, t4
                  addi         a7, t1, -1347
                  c.li         t5, 2
6712:             c.srai       a3, 3
                  bgeu         s3, s0, 6719f
                  mulhu        ra, s3, s9
                  mul          t6, a7, t2
6716:             bne          s1, t3, 6728f
6717:             sra          a7, gp, tp
                  srai         t1, s1, 19
6719:             bltu         a4, s0, 6735f
                  bge          s7, s7, 6739f
                  srli         t5, sp, 18
                  divu         s7, t1, a4
                  bne          s11, s9, 6738f
                  c.add        s5, s7
                  srli         t1, t4, 9
                  addi         s8, t3, -554
                  nop
6728:             c.addi4spn   a1, sp, 352
                  bltu         s5, a6, 6738f
                  c.addi       a2, 2
                  c.srai       a2, 12
                  mul          a2, s8, tp
                  c.lui        s8, 6
                  or           a1, tp, a3
6735:             c.li         s8, 22
                  xori         a1, t5, 787
                  c.bnez       a3, 6756f
6738:             c.addi4spn   s0, sp, 288
6739:             srai         t5, s0, 12
                  andi         ra, gp, -1254
                  and          ra, tp, t2
                  slli         a3, a7, 3
                  slt          t1, t2, gp
                  bltu         s10, a2, 6748f
                  srai         a4, a5, 31
                  beq          a6, a1, 6764f
                  xori         a1, a5, 2034
6748:             andi         t6, s6, 1429
                  c.addi4spn   s0, sp, 240
                  c.bnez       a0, 6768f
                  slti         zero, a0, 1085
                  lui          ra, 740024
                  and          t3, a7, a7
                  rem          a3, t3, a5
                  divu         s2, zero, s3
6756:             addi         t6, a0, 804
                  c.srli       a1, 23
                  auipc        t6, 567724
                  slt          a3, gp, a3
                  mulhu        a4, t0, a0
                  srli         t4, s10, 4
                  beq          s0, a1, 6770f
                  srl          s10, s0, zero
6764:             or           a7, tp, t1
                  divu         gp, s0, s9
                  srli         t5, s3, 25
                  c.nop
6768:             sltu         s11, a6, tp
                  c.and        s1, s1
6770:             c.mv         s7, t5
                  c.slli       s0, 3
                  c.xor        a2, s0
                  c.beqz       a2, 6790f
                  c.srai       a0, 1
                  or           t5, s6, t6
                  c.addi16sp   sp, 320
                  sltu         s5, s4, a7
                  sub          a2, s7, s0
                  lui          s6, 329454
                  nop
                  divu         a2, t1, s11
                  c.li         a1, -1
                  mulhsu       a0, ra, gp
                  addi         s5, a4, -494
                  mul          a1, s11, s2
                  slli         t4, a4, 1
                  xori         s11, a6, -1705
                  srli         t5, tp, 19
                  c.beqz       a2, 6807f
6790:             lui          s7, 672201
                  bltu         a1, t6, 6800f
                  c.andi       a2, -1
                  ori          t0, t0, 1774
                  bltu         t5, t2, 6802f
                  c.slli       s6, 6
                  c.beqz       a3, 6810f
                  c.srai       a2, 26
                  xor          s8, a1, a2
                  c.li         s9, 19
6800:             srai         a7, s5, 27
                  c.slli       s7, 9
6802:             addi         s11, s1, 1096
                  mulhu        gp, s1, a0
                  c.bnez       a3, 6813f
                  bge          a5, t3, 6806f
6806:             c.beqz       a0, 6820f
6807:             c.and        a1, a0
                  c.srai       a2, 31
                  mulh         s6, s6, t4
6810:             slli         s2, gp, 15
                  c.nop
                  bne          a2, a7, 6827f
6813:             auipc        s5, 1007259
                  c.bnez       a0, 6829f
                  c.addi4spn   a2, sp, 672
                  nop
                  sltu         t5, s7, a0
                  bltu         ra, s3, 6824f
                  c.beqz       a1, 6831f
6820:             bge          s2, s1, 6835f
                  blt          s0, s9, 6835f
                  ori          a2, s2, -1930
                  xor          t3, a3, s9
6824:             ori          a1, t5, 778
                  c.addi       s11, -1
                  bgeu         t3, s3, 6827f
6827:             sltiu        a7, t4, -307
                  remu         a1, a7, s6
6829:             c.mv         t5, t0
                  remu         s4, a5, s9
6831:             bltu         s2, s5, 6849f
                  div          t4, a7, gp
                  nop
                  mulhsu       a2, a2, a1
6835:             c.sub        a0, a2
                  c.andi       s0, -1
                  c.addi       a3, 15
                  c.mv         a1, t5
                  mul          gp, a0, s0
                  bgeu         t6, s5, 6847f
                  andi         zero, s0, 1247
                  bgeu         s7, s11, 6857f
                  divu         s3, a4, s0
                  remu         t5, a3, t3
                  beq          s10, t6, 6859f
                  mulhsu       s10, t2, s1
6847:             rem          s2, a4, s3
                  sltu         s5, s11, sp
6849:             rem          a1, a4, s8
                  sra          s3, a4, a6
                  nop
                  or           s6, s7, tp
                  bltu         t5, zero, 6870f
                  rem          a4, a4, ra
                  addi         t4, sp, 1099
                  c.addi4spn   a3, sp, 928
6857:             sltu         a1, zero, s0
                  srl          a0, a0, a0
6859:             slli         t2, t3, 5
                  srai         s3, a1, 15
                  rem          a3, t1, t1
                  c.beqz       a1, 6880f
                  c.srai       a1, 3
                  sra          a7, a5, a5
                  blt          tp, s10, 6879f
                  bne          s6, s7, 6885f
                  beq          a3, a1, 6883f
                  c.slli       ra, 28
                  sltu         s10, s0, s1
6870:             c.addi       a7, -1
                  c.beqz       s1, 6889f
                  c.addi4spn   a3, sp, 432
                  c.bnez       a1, 6878f
                  bge          s11, s2, 6882f
                  xor          ra, s2, t2
                  mulhsu       s0, s9, t0
                  c.li         s6, -1
6878:             sltiu        t1, t4, -370
6879:             ori          t2, t6, 1458
6880:             sll          s3, a2, tp
                  mul          a3, a3, s11
6882:             div          s2, a4, a7
6883:             c.srli       a3, 16
                  div          s4, a4, s9
6885:             rem          a3, a4, t4
                  mulh         s9, a7, s9
                  mul          s5, t6, s0
                  slt          a4, s6, t2
6889:             c.andi       a4, 21
                  sub          s10, s3, ra
                  xori         zero, t5, -995
                  xor          t0, s4, t6
                  beq          a6, t6, 6902f
                  bge          sp, s1, 6912f
                  rem          s0, a7, s8
                  sll          a2, s4, zero
                  mulh         s8, a3, zero
                  bgeu         a0, t5, 6899f
6899:             c.slli       a7, 9
                  srl          t6, t4, s3
                  c.xor        a0, a1
6902:             remu         gp, t3, s6
                  c.srli       a4, 24
                  bne          s11, t1, 6912f
                  c.andi       a3, -1
                  xori         a7, s9, -951
                  c.srai       a2, 15
                  srl          sp, t4, a6
                  mulhsu       s5, s9, s10
                  c.and        a0, a3
                  mul          s1, s6, s6
6912:             bge          a2, s11, 6916f
                  andi         s7, a0, 388
                  remu         zero, t2, s11
                  bge          a0, zero, 6927f
6916:             or           s6, s7, s8
                  xori         s6, s6, 161
                  bge          s3, a7, 6933f
                  c.and        a4, a2
                  bgeu         s8, ra, 6924f
                  c.addi       s1, -1
                  c.bnez       a3, 6931f
                  bne          a1, s2, 6924f
6924:             slli         s9, t6, 26
                  bge          a5, s0, 6944f
                  bltu         gp, t6, 6935f
6927:             addi         s6, s5, -1528
                  c.addi16sp   sp, -16
                  slli         t2, s8, 26
                  sltu         s10, s3, zero
6931:             bgeu         a4, s5, 6939f
                  c.li         s6, 26
6933:             sub          zero, s4, gp
                  c.or         a3, a4
6935:             c.beqz       a1, 6947f
                  c.nop
                  srli         s3, s9, 12
                  mulh         t2, a0, ra
6939:             and          s3, a2, a3
                  slli         a3, sp, 22
                  auipc        t2, 800312
                  bne          a4, a0, 6960f
                  mulh         s9, s6, a4
6944:             ori          s3, t0, -238
                  c.srli       a0, 14
                  remu         a7, s9, s4
6947:             c.addi       s1, 26
                  c.slli       s2, 21
                  sltu         a7, s10, t5
                  c.srai       a1, 15
                  div          ra, s3, s3
                  slt          s11, a6, t5
                  divu         t4, s1, s11
                  c.andi       a3, -1
                  c.li         s9, 8
                  c.add        s5, s10
                  c.mv         a1, s8
                  bne          t6, a4, 6972f
                  blt          a3, tp, 6977f
6960:             c.mv         a1, a4
                  blt          a7, t4, 6967f
                  auipc        a0, 872597
                  xor          s9, s3, a0
                  divu         zero, ra, s0
                  c.addi       t2, -1
                  or           gp, s11, s2
6967:             c.lui        s8, 2
                  bge          s11, a6, 6987f
                  mulhsu       s9, gp, s6
                  c.sub        s1, s0
                  mul          a1, s7, tp
6972:             c.li         t3, 8
                  rem          t4, s2, s1
                  andi         t1, t3, -1782
                  c.xor        a2, a1
                  sra          a7, sp, s7
6977:             lui          s8, 934382
                  c.mv         s1, s9
                  srl          s6, a6, a7
                  c.sub        s1, a2
                  c.add        t4, a5
                  bge          a0, t2, 6989f
                  srli         s10, s6, 30
                  bge          ra, s3, 6985f
6985:             c.mv         s6, t2
                  sra          zero, a1, tp
6987:             auipc        s2, 446170
                  bltu         a7, s5, 7006f
6989:             beq          zero, t4, 7003f
                  lui          s8, 1003316
                  slt          s8, t1, sp
                  beq          t6, s10, 7011f
                  slti         t4, s11, -1455
                  mulh         a4, t6, s0
                  sltu         ra, t4, a1
                  c.srli       a4, 29
                  c.addi16sp   sp, 352
                  c.nop
                  c.addi       s4, -1
                  or           t0, s7, a7
                  nop
                  bltu         ra, s8, 7018f
7003:             blt          s8, a2, 7007f
                  c.nop
                  sll          s2, s2, ra
7006:             slli         gp, s7, 23
7007:             mulh         a1, s2, s2
                  slt          t4, s6, a1
                  sra          a3, a3, s4
                  mulhu        s11, sp, s8
7011:             c.slli       t4, 10
                  c.addi       s7, 25
                  c.xor        a3, s1
                  mul          sp, a3, sp
                  divu         s10, s10, s6
                  lui          s3, 740193
                  div          t2, t3, a4
7018:             rem          s7, s5, t1
                  slli         t0, a5, 17
                  lui          a7, 688225
                  c.nop
                  sltu         t5, ra, t2
                  slti         zero, tp, 1202
                  slti         a2, gp, 907
                  slti         s3, a5, -1499
                  c.li         a7, 8
                  c.lui        s8, 31
                  xor          s10, zero, t1
                  andi         s6, t3, 135
                  addi         s8, zero, -6 #init loop 1 counter
                  c.addi4spn   a4, sp, 368
                  sub          t5, s6, a3
                  c.sub        s1, a3
                  c.slli       gp, 23
                  xor          s2, t4, s0
                  c.and        s0, a1
                  div          s4, t4, s9
                  c.sub        a0, a3
                  addi         ra, zero, 15 #init loop 1 limit
                  andi         s7, t1, 1106
                  slli         t4, a6, 5
                  sra          s10, s3, a4
                  c.andi       s0, -1
sub_3_143_1_t:    div          s11, ra, a4
                  c.andi       s1, 21
                  rem          a1, s5, sp
                  addi         s8, s8, 7 #update loop 1 counter
                  mulh         t4, s0, s7
                  c.and        a3, a4
                  addi         a2, zero, -10 #init loop 0 counter
                  lui          s3, 49349
                  lui          s5, 478723
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_143_0_t:    mulhu        s0, a6, ra
                  addi         a2, a2, 10 #update loop 0 counter
                  c.beqz       a2, sub_3_143_0_t #branch for loop 0
                  addi         s6, t4, -861
                  c.xor        a3, a3
                  blt          s8, ra, sub_3_143_1_t #branch for loop 1
                  c.li         s10, -1
                  srli         s9, a2, 30
                  xor          s5, s8, s6
                  slti         s4, s9, 1913
                  c.bnez       a0, 7042f
                  andi         s8, s10, 355
                  bge          s6, t4, 7052f
                  div          t1, s11, s6
                  or           t5, a2, sp
                  lui          a3, 466533
                  mulhsu       s1, s3, s2
                  mul          a7, gp, a2
                  divu         s10, zero, t2
7042:             bgeu         t4, a5, 7056f
                  div          t6, s2, s1
                  auipc        s11, 154082
                  mulhsu       t4, a2, t0
                  srli         ra, s9, 24
                  mul          t4, ra, t1
                  slti         t6, t4, 466
                  lui          s4, 394233
                  c.bnez       s1, 7055f
                  mulhu        s8, ra, t3
7052:             mulh         s9, a4, a2
                  c.sub        a2, s0
                  add          s4, t2, s2
7055:             c.addi16sp   sp, -16
7056:             andi         s5, s3, 1936
                  c.lui        a1, 9
                  beq          s1, sp, 7067f
                  beq          a1, s10, 7068f
                  c.xor        s0, a5
                  slli         s10, a3, 22
                  srl          zero, t0, a6
                  c.slli       s2, 8
                  mulhu        s9, t5, t3
                  c.beqz       a3, 7073f
                  c.sub        a1, a3
7067:             bge          s10, a2, 7075f
7068:             c.srai       a2, 23
                  ori          a4, a6, -573
                  mulhsu       s6, gp, a7
                  c.li         a2, 30
                  lui          a3, 806951
7073:             srai         a4, sp, 15
                  c.bnez       a0, 7089f
7075:             bge          t4, sp, 7079f
                  srai         ra, t1, 27
                  c.li         t6, 27
                  beq          a3, s9, 7093f
7079:             mulhsu       s8, gp, t1
                  add          s0, a7, s2
                  rem          s5, sp, s2
                  c.bnez       a4, 7083f
7083:             bne          a4, tp, 7095f
                  ori          s9, sp, 1187
                  c.andi       a3, -1
                  c.li         a1, 2
                  c.addi4spn   a3, sp, 592
                  slt          gp, t1, a3
7089:             mul          s10, t1, s10
                  mulh         s6, a7, t6
                  c.andi       a4, 14
                  ori          t1, a4, -278
7093:             c.lui        t3, 25
                  bltu         s7, t4, 7112f
7095:             c.xor        a3, s0
                  c.sub        s1, a1
                  andi         ra, a1, 280
                  rem          t3, t2, s10
                  bne          t1, s2, 7100f
7100:             c.bnez       a2, 7108f
                  bge          t1, t5, 7116f
                  c.slli       s9, 15
                  srai         s9, a5, 13
                  slt          a0, s9, tp
                  sltiu        s1, t5, 1804
                  c.beqz       a4, 7125f
                  c.add        a1, s4
7108:             mulhsu       t2, s0, s7
                  sra          t0, a6, s10
                  c.add        s0, a7
                  sltiu        a7, s7, 328
7112:             c.andi       s0, -1
                  mul          ra, a2, s2
                  c.sub        s0, a0
                  c.or         s0, a0
7116:             sltiu        a1, s10, 556
                  add          s5, a4, gp
                  c.or         a4, a4
                  bltu         t4, s9, 7124f
                  c.slli       s9, 10
                  blt          t6, t5, 7135f
                  and          a2, s9, t0
                  c.beqz       a4, 7124f
7124:             mulh         t4, gp, s2
7125:             c.xor        a2, s0
                  c.lui        a2, 10
                  c.addi16sp   sp, -16
                  addi         s9, s5, 1199
                  mul          s9, s3, t5
                  sltiu        t5, s10, -1574
                  srai         s6, a6, 26
                  slli         a3, t0, 31
                  xori         s8, a2, 1706
                  c.srli       a2, 19
7135:             c.lui        s4, 25
                  c.addi       s6, 18
                  add          a0, a0, s6
                  bne          a2, s6, 7146f
                  sltu         t6, sp, gp
                  or           s5, zero, s6
                  mulh         a3, ra, s7
                  remu         s5, s10, s9
                  sltu         s5, s0, t3
                  andi         s0, s8, -1023
                  sra          s11, s8, s0
7146:             c.andi       a2, -1
                  auipc        s8, 973908
                  c.li         s9, -1
                  c.nop
                  c.addi       t4, -1
                  c.srai       a3, 21
                  slli         sp, t2, 2
                  c.slli       a4, 2
                  or           s5, s11, sp
                  c.lui        s10, 31
                  c.srli       a1, 15
                  sll          s10, s0, a7
                  mul          t3, t4, s10
                  c.slli       s5, 1
                  c.addi       s3, 1
                  nop
sub_3_59:         jal          t6, 18f
0:                c.j          16f
1:                c.j          24f
2:                jal          ra, 8f
3:                c.j          6f
4:                c.j          15f
5:                jal          ra, 29f
6:                jal          ra, 9f
7:                c.jal        25f
8:                jal          ra, 26f
9:                c.j          10f
10:               jal          ra, 11f
11:               jal          t1, 17f
12:               jal          ra, 22f
13:               jal          t0, 12b
14:               c.j          20f
15:               c.jal        28f
16:               c.jal        3b
17:               jal          ra, 23f
18:               c.jal        1b
19:               c.j          13b
20:               c.j          5b
21:               c.j          27f
22:               c.jal        21b
23:               c.jal        7b
24:               jal          sp, 19b
25:               c.j          4b
26:               c.j          14b
27:               jal          a4, 0b
28:               jal          s4, 2b
29:               c.nop
                  sub          s9, t1, t4
                  c.addi4spn   a1, sp, 592
                  mulh         a1, s11, t2
                  slt          zero, s8, a7
                  c.addi16sp   sp, -16
                  c.bnez       a1, 7183f
                  srl          a4, t4, a3
                  c.nop
                  addi         t2, s2, 1435
                  c.addi4spn   s1, sp, 160
                  c.nop
                  ori          s9, s6, -2028
                  c.andi       a3, 30
                  add          sp, s11, s2
                  nop
                  srli         s8, s5, 9
                  bne          s8, tp, 7193f
                  or           a2, gp, t0
                  mul          s11, s7, s4
                  sltiu        sp, s5, 1085
                  xor          t4, s4, sp
7183:             c.and        s1, a4
                  ori          s8, a2, 1989
                  bltu         t0, s3, 7203f
                  nop
                  c.sub        a4, a4
                  slt          a7, a2, zero
                  c.slli       s1, 19
                  div          s0, s7, s5
                  bne          s5, tp, 7210f
                  xori         s4, sp, 130
7193:             sra          t6, s10, t0
                  sltiu        t6, a6, -1568
                  sub          gp, s1, a0
                  c.and        a0, a3
                  addi         s0, zero, 1805
                  mulhu        t3, t4, t5
                  mulhsu       a1, s10, t5
                  xori         s0, s8, -1375
                  remu         s1, s8, t5
                  blt          a3, t4, 7217f
7203:             c.andi       a4, -1
                  c.xor        a3, s0
                  divu         s3, s1, zero
                  c.sub        a3, a3
                  auipc        s8, 620302
                  c.sub        s1, a5
                  remu         s9, s4, a4
7210:             mul          s9, tp, s2
                  or           s9, s8, t3
                  auipc        s0, 720555
                  bgeu         gp, ra, 7217f
                  c.bnez       a1, 7220f
                  srl          t2, a2, a5
                  sltiu        a7, a3, -362
7217:             sub          gp, s2, s2
                  divu         t5, t2, a7
                  bgeu         t3, a3, 7234f
7220:             div          a4, zero, a7
                  or           a4, s7, t1
                  c.beqz       a1, 7234f
                  sltiu        s1, s0, -622
                  c.lui        s3, 10
                  remu         s8, gp, a7
                  c.srai       a3, 5
                  rem          t3, s1, s7
                  c.xor        s1, a4
                  ori          s4, s11, -232
                  xor          s5, a3, gp
                  la           gp, region_0+1901 #start load_store_instr_stream_3
                  la           s3, region_0+12 #start load_store_instr_stream_1
                  la           s7, region_0+190 #start load_store_instr_stream_0
                  la           t2, region_0+1597 #start load_store_instr_stream_2
                  lb           s2, -34(gp)
                  lhu          s9, -41(gp)
                  lw           t6, -4(s3)
                  lbu          s11, -22(gp)
                  lb           a4, 1763(s7)
                  la           t0, region_0+1061 #start load_store_instr_stream_4
                  lb           t5, -176(gp)
                  lbu          s5, -8(t0)
                  lbu          ra, -113(t2)
                  sb           s8, 61(s3)
                  lb           a2, -10(s3)
                  lh           t5, -78(s7)
                  lb           s4, -196(t2)
                  lhu          s9, 878(s7)
                  sb           s3, 248(t2)
                  lhu          a0, 50(s3)
                  lbu          a2, 3(t0)
                  lbu          s2, -163(t2)
                  lb           s1, -244(t2)
                  lbu          s6, -161(t2)
                  lhu          a7, 49(gp)
                  lbu          s2, -50(t0)
                  lb           s1, -176(t2)
                  sw           s10, -109(gp)
                  lbu          s2, -248(gp)
                  sb           a4, 827(s7)
                  lw           t4, 64(s3)
                  sh           s4, -10(s3)
                  sb           a7, 22(t2)
                  lhu          a2, -9(t2) #end load_store_instr_stream_2
                  lb           t3, -212(gp)
                  sb           s1, -235(gp)
                  lb           t6, 132(s7)
                  sh           gp, 37(t0)
                  lb           zero, 58(s3)
                  lbu          s11, 48(gp) #end load_store_instr_stream_3
                  lbu          a4, -9(s3) #end load_store_instr_stream_1
                  lb           s8, -24(t0) #end load_store_instr_stream_4
                  sb           a7, 1463(s7) #end load_store_instr_stream_0
                  c.xor        s0, s1
                  c.lui        s4, 1
                  mulh         s10, s8, s9
7234:             or           a7, s11, s6
                  mulh         t5, s10, a7
                  slt          a3, a4, s3
                  divu         a4, a5, s3
                  slt          gp, s6, gp
                  div          s1, t0, a1
                  c.srli       a3, 24
                  remu         s2, s2, s4
                  c.srai       a1, 7
                  bltu         s10, s10, 7257f
                  c.li         sp, 30
                  addi         a3, a2, -460
                  mulhsu       s11, s8, s3
                  addi         a7, t3, -1761
                  xor          t2, t2, a3
                  add          zero, sp, t1
                  srl          t2, a1, a2
                  srl          s10, t6, s9
                  nop
                  div          s3, zero, t2
                  c.sub        a4, a0
                  add          s1, s4, t6
                  c.and        s0, a1
7257:             c.mv         t6, s8
                  srai         s3, t2, 3
                  c.beqz       a3, 7267f
                  sltiu        a2, a3, -1097
                  bne          s3, s1, 7270f
                  c.nop
                  xori         ra, t3, 874
                  c.add        a3, s9
                  or           ra, zero, a4
                  div          a7, s11, s11
7267:             srai         s6, a2, 3
                  c.and        s0, s1
                  sltu         s0, a7, t1
7270:             mulhu        sp, s4, zero
                  mulhu        zero, s9, a4
                  and          t4, s5, sp
                  c.bnez       a3, 7282f
                  c.addi4spn   a0, sp, 784
                  c.addi4spn   s0, sp, 800
                  beq          s3, s8, 7294f
                  mulhsu       s11, s9, t1
                  c.xor        a4, s0
                  c.xor        s0, a3
                  c.li         t6, -1
                  c.addi16sp   sp, -16
7282:             rem          s11, s3, a3
                  mulhsu       t2, s2, s1
                  mulhsu       sp, s6, s6
                  sltiu        ra, tp, -453
                  sra          s2, a5, a7
                  beq          s0, zero, 7296f
                  c.addi       gp, -1
                  c.sub        s0, a4
                  c.andi       a0, 16
                  c.and        s1, a4
                  srli         s7, s1, 25
                  sltiu        s7, s7, 1977
7294:             c.addi       s10, 23
                  c.lui        a0, 28
7296:             c.and        a1, a3
                  blt          a3, a2, 7305f
                  c.srli       a2, 18
                  xor          s6, t3, s11
                  c.srai       a4, 30
                  c.and        a1, a4
                  slti         a0, a0, -1879
                  c.nop
                  add          t6, s8, t6
7305:             c.addi4spn   a0, sp, 864
                  c.nop
                  bltu         t5, sp, 7319f
                  mulhsu       a7, a0, t1
                  sra          sp, s1, s7
                  addi         sp, s1, 312
                  c.addi       t5, -1
                  bne          s4, t4, 7319f
                  div          a4, ra, sp
                  c.srli       s1, 21
                  or           s7, a3, sp
                  blt          s11, t5, 7317f
7317:             c.srai       a3, 21
                  divu         s3, a5, zero
7319:             xori         sp, t4, 1757
                  div          s1, s4, gp
                  blt          s0, s0, 7327f
                  c.slli       s0, 26
                  c.add        a2, a6
                  sub          sp, s5, s8
                  bge          a7, a6, 7327f
                  blt          sp, t4, 7327f
7327:             mulhsu       s8, a6, t2
                  lw           t6, 4(tp)
                  addi         tp, tp, 16
                  c.sub        a4, a4
                  sra          a1, gp, s7
                  sltu         sp, a0, t1
                  andi         s7, t3, 1292
13087:            addi x13, x31, 1
13087:            jalr x13, x13, 0
sub_5:            beq          zero, ra, sub_5_stack_p
                  andi         t0, a4, 677
sub_5_stack_p:    addi         tp, tp, -56
                  c.srli       a0, 10
                  slli         a4, zero, 26
                  c.mv         t1, sp
                  sw           t6, 4(tp)
                  srli         gp, s7, 19
                  slli         gp, ra, 16
                  auipc        t5, 998520
                  c.srli       a1, 15
                  c.srli       a4, 27
                  slli         a3, s6, 23
                  andi         a7, t5, -942
                  blt          s1, t4, 6f
                  and          gp, t0, a2
                  bltu         s8, t2, 10f
6:                c.slli       t3, 2
                  c.srai       a2, 11
                  c.bnez       s0, 20f
                  andi         s4, s6, -282
10:               c.beqz       a4, 13f
                  sll          a7, ra, t3
                  c.xor        a4, a3
13:               mulh         ra, a3, a4
                  sltiu        a7, s0, -1279
                  c.add        a2, a0
                  beq          s7, zero, 32f
                  rem          t4, s10, a6
                  addi         s8, s7, 164
                  mulh         s5, s10, a5
20:               mul          s4, t5, a7
                  sltu         s8, a2, s5
                  c.bnez       a4, 24f
                  c.mv         s8, t5
24:               c.add        s11, t4
                  c.beqz       a2, 26f
26:               mulhsu       a7, t1, s4
                  slli         s6, s7, 9
                  and          sp, s7, a7
                  c.andi       a3, 11
                  bge          tp, s5, 42f
                  remu         zero, a2, a4
32:               blt          a4, s8, 49f
                  xor          s8, s11, t0
                  slt          s1, a2, s3
                  sltiu        s8, s1, 1736
                  remu         s5, ra, a5
                  c.xor        a2, a1
                  add          t5, s7, zero
                  sll          gp, a6, t3
                  beq          zero, t5, 56f
                  bne          s2, s10, 54f
42:               mul          s2, a6, t1
                  c.beqz       a3, 55f
                  c.beqz       s0, 58f
                  slt          s3, s1, t6
                  sll          s10, s11, s11
                  c.andi       a3, 22
                  bgeu         a0, t2, 49f
49:               xor          s8, s10, s6
                  c.bnez       a3, 62f
                  c.lui        a0, 26
                  divu         gp, s3, t2
                  rem          s1, t2, s2
54:               srai         t6, s7, 26
55:               andi         s1, a2, 1901
56:               mulhsu       t0, s10, a0
                  xori         s11, s4, 1767
58:               mulhsu       s3, tp, s9
                  c.bnez       a3, 75f
                  srli         s2, t6, 18
                  divu         s0, sp, t1
62:               c.srli       s1, 16
                  bltu         s1, t4, 65f
                  bge          t4, t5, 72f
65:               c.sub        a1, a1
                  c.sub        a3, a3
                  sltu         a4, t1, ra
                  c.slli       s6, 7
                  or           ra, t6, t4
                  c.addi       t0, -1
                  rem          t3, tp, s4
72:               auipc        s2, 427952
                  bne          t5, t3, 75f
                  c.add        s1, s10
75:               c.addi16sp   sp, -16
                  c.add        t1, t1
                  lw           t6, 4(tp)
                  addi         tp, tp, 56
                  c.addi       a2, 20
                  c.li         a3, 24
92:               addi x19, x31, 1
92:               c.jalr x19
sub_4:            c.and        s0, a2
                  andi         t5, s2, 331
                  addi         tp, tp, -44
                  sw           t6, 4(tp)
                  srl          s7, a1, a4
                  xori         s6, a6, 741
                  andi         sp, t6, 1107
                  slt          zero, ra, a4
                  andi         a7, s11, -1727
                  add          t2, s9, t3
                  srl          s4, a0, gp
                  nop
                  c.addi4spn   s1, sp, 400
                  bgeu         s10, zero, 19f
                  sll          t2, t5, ra
                  divu         s2, sp, a0
                  c.addi       t0, -1
                  lui          s2, 534330
                  andi         t3, s1, -1272
                  auipc        a7, 1014543
                  add          t2, t0, s2
                  c.addi4spn   s1, sp, 912
                  c.addi       s2, -1
                  c.mv         t4, t0
                  c.srli       a1, 2
                  bge          gp, t6, 19f
                  div          s0, t4, zero
                  or           s9, a6, a2
                  rem          s8, ra, s5
                  nop
19:               or           t2, t3, s4
                  xori         t6, t6, 1906
                  c.and        s1, a0
                  c.or         a0, s1
                  slt          s10, a0, s11
                  mulh         a0, a4, sp
                  c.and        a2, a1
                  slt          s7, s11, t5
                  auipc        zero, 225741
                  c.li         s2, -1
                  c.add        s0, s3
                  remu         t4, t1, a6
                  slt          s1, a2, a3
                  c.and        a2, a2
                  xori         t3, zero, -721
                  c.srli       a0, 13
                  srli         a2, ra, 10
                  mulh         t5, tp, a6
                  blt          tp, ra, 40f
                  mulh         t2, a4, zero
                  sub          a1, t3, t4
40:               slti         a3, s11, 496
                  sll          gp, t1, ra
                  divu         s2, s0, s9
                  c.addi4spn   a4, sp, 96
                  beq          t1, s0, 60f
                  slti         gp, s7, -1939
                  c.or         a3, s0
                  bge          s3, a1, 64f
                  c.andi       s0, 9
                  c.lui        t0, 2
                  and          t3, a3, s1
                  mulhsu       a7, s5, s1
                  slli         s2, t1, 13
                  c.addi16sp   sp, -16
                  div          t3, s4, s5
                  remu         s7, tp, t3
                  c.li         a0, -1
                  xori         s5, s2, -1246
                  c.li         s9, 12
                  blt          s1, t4, 61f
60:               auipc        s2, 438482
61:               sll          a2, gp, s9
                  bge          a2, a1, 79f
                  c.lui        s9, 1
64:               sra          s11, s8, s7
                  slti         a7, t4, -1131
                  lui          s10, 794005
                  nop
                  sll          s6, s4, t1
                  bne          t1, s7, 83f
                  c.and        a3, a4
                  c.add        s7, gp
                  and          a4, a3, s4
                  c.beqz       a3, 75f
                  c.mv         gp, gp
75:               c.srai       a1, 20
                  srli         ra, ra, 5
                  c.srli       a0, 6
                  andi         s10, s3, -113
79:               mulhsu       zero, s6, s8
                  c.bnez       a2, 83f
                  c.srli       a2, 27
                  srli         s6, s0, 6
83:               xor          t4, s11, t5
                  lw           t6, 4(tp)
                  addi         s5, t1, 489
                  addi         tp, tp, 44
                  lui          t4, 839795
                  lui          a7, 980888
100:              addi x24, x31, 0
100:              c.jr x24
sub_1:            c.beqz       a5, sub_1_stack_p
                  xor          gp, ra, t3
                  slti         t2, s10, -843
                  auipc        s11, 34010
sub_1_stack_p:    addi         tp, tp, -24
                  ori          t4, s1, -192
                  sw           t6, 4(tp)
                  auipc        t4, 46052
                  c.or         a0, a0
                  sltiu        a2, s10, 331
                  c.addi4spn   a4, sp, 176
                  beq          s2, a3, sub_1_j4 #branch to jump instr
                  lui          gp, 972262
                  c.slli       a4, 12
sub_1_j4:         jal          t6, sub_4 #jump sub_1 -> sub_4
                  and          s9, zero, s1
                  addi         a1, a0, 708
                  c.and        a3, a4
                  sltiu        t3, a2, -1124
                  slli         s8, s0, 4
                  mulh         t0, s9, s10
                  bgeu         a5, s5, sub_1_j5 #branch to jump instr
                  andi         s3, t4, -586
                  divu         s10, t3, t2
                  c.add        s1, gp
sub_1_j5:         jal          t6, sub_3 #jump sub_1 -> sub_3
                  la           s1, region_1+1726 #start load_store_instr_stream_3
                  lb           s8, 71(s1)
                  la           t3, region_1+1909 #start load_store_instr_stream_0
                  la           a7, region_1+1696 #start load_store_instr_stream_2
                  sh           t5, 45(t3)
                  la           t5, region_1+311 #start load_store_instr_stream_4
                  lbu          zero, -120(s1)
                  lb           gp, 38(t5)
                  lh           gp, -498(a7)
                  lh           a3, -57(t5)
                  sb           s0, 24(t5)
                  lhu          s4, 232(s1)
                  lbu          s5, -31(s1)
                  la           t1, region_1+1591 #start load_store_instr_stream_1
                  lb           sp, -137(s1)
                  lhu          zero, -610(a7)
                  lw           gp, -907(t1)
                  sb           s9, 55(t5)
                  lbu          ra, 12(t3)
                  sb           s6, 40(a7)
                  sb           a7, 154(t1)
                  lbu          s3, -12(t5)
                  sw           t4, 142(s1)
                  lb           s10, -55(t5)
                  lbu          s6, 316(t1)
                  sh           t0, -124(s1)
                  sb           a0, 32(t3)
                  sw           s7, 197(t1)
                  lb           t0, 58(t5)
                  sb           gp, -153(s1)
                  lb           s4, 16(t5)
                  sb           a3, -983(a7)
                  lbu          s4, 191(s1)
                  lb           s2, 62(t5)
                  sb           s4, -1162(t1)
                  sb           a5, -17(t5) #end load_store_instr_stream_4
                  lb           a4, -1109(t1) #end load_store_instr_stream_1
                  lb           t0, -100(s1) #end load_store_instr_stream_3
                  sh           s10, 3(t3)
                  sb           t4, -896(a7) #end load_store_instr_stream_2
                  sh           s8, -17(t3) #end load_store_instr_stream_0
                  la           s4, region_0+1323 #start riscv_hazard_instr_stream_1
                  lh           zero, -9(s4)
                  mul          a1, s10, zero
                  lbu          zero, 147(s4)
                  lb           zero, 80(s4)
                  lh           s10, -187(s4)
                  div          a1, zero, s10
                  c.andi       a2, 19
                  c.sub        a1, a2
                  lbu          t2, -6(s4)
                  sb           t2, 236(s4)
                  lw           s10, -107(s4)
                  sltiu        t2, t2, 1798
                  add          zero, zero, t2
                  or           s10, zero, sp
                  lbu          t2, -248(s4)
                  lh           t2, 241(s4)
                  lbu          sp, 164(s4)
                  addi         sp, a2, 576
                  lh           zero, 137(s4)
                  mul          s10, sp, zero
                  lh           t2, 101(s4)
                  slti         a1, a1, 362
                  sra          s10, zero, zero
                  c.lui        s10, 23
                  lh           a1, -135(s4)
                  slti         zero, zero, -693
                  lh           a1, 201(s4) #end riscv_hazard_instr_stream_1
                  la           s5, region_1+1606 #start load_store_instr_stream_1
                  lbu          gp, -1403(s5)
                  la           s1, region_0+721 #start load_store_instr_stream_0
                  lbu          s3, 21(s5)
                  lbu          t1, -465(s5)
                  sb           t0, -5(s1)
                  lbu          gp, -960(s5)
                  sw           t5, 326(s5)
                  lbu          s6, 234(s5)
                  lbu          t3, 12(s1)
                  lbu          s3, -538(s5)
                  lbu          s0, -37(s5)
                  sw           t5, -5(s1)
                  lb           sp, -12(s1)
                  sb           a4, 109(s5) #end load_store_instr_stream_1
                  sb           a5, -8(s1) #end load_store_instr_stream_0
                  la           s9, region_0+1719 #start riscv_load_store_hazard_instr_stream_1
                  lbu          t4, -56(s9)
                  lb           t2, -56(s9)
                  srai         s11, gp, 4
                  lb           a3, -56(s9)
                  lbu          zero, -56(s9)
                  sb           a3, -56(s9)
                  ori          t0, t0, 742
                  lb           gp, -56(s9)
                  mul          t5, a0, s1
                  sb           s4, -56(s9)
                  c.mv         a1, t2
                  sb           a2, -56(s9)
                  sb           s3, -56(s9)
                  lb           s4, -56(s9)
                  lbu          a3, -56(s9)
                  and          t0, s7, s0
                  lbu          s8, -56(s9)
                  sb           t5, -56(s9)
                  lb           s2, -56(s9)
                  lb           s6, -56(s9)
                  mul          a1, s0, a1
                  lb           t6, -56(s9)
                  lbu          s11, -56(s9)
                  sb           ra, -56(s9)
                  sb           a0, -56(s9) #end riscv_load_store_hazard_instr_stream_1
                  la           t6, region_1+986 #start load_store_instr_stream_1
                  la           a4, region_0+703 #start load_store_instr_stream_0
                  lhu          a2, -150(t6)
                  sb           s7, -841(t6)
                  lbu          gp, -9(a4)
                  lh           s8, -878(t6)
                  lbu          s8, -337(t6)
                  lbu          a7, 83(t6)
                  lh           a0, 13(a4)
                  lb           s6, 446(t6)
                  lw           gp, 5(a4)
                  lbu          zero, -273(t6)
                  lb           ra, 5(a4)
                  lbu          s8, -221(t6)
                  lbu          a3, 551(t6) #end load_store_instr_stream_1
                  sh           t6, 9(a4) #end load_store_instr_stream_0
sub_1_7:          jal          t6, 6f
0:                c.jal        20f
1:                jal          ra, 0b
2:                jal          ra, 7f
3:                c.j          27f
4:                c.jal        3b
5:                jal          ra, 19f
6:                c.jal        21f
7:                c.jal        18f
8:                c.j          10f
9:                c.jal        2b
10:               c.jal        14f
11:               c.jal        22f
12:               jal          ra, 15f
13:               c.j          25f
14:               c.jal        13b
15:               c.j          1b
16:               c.j          11b
17:               c.jal        23f
18:               jal          sp, 26f
19:               jal          a0, 9b
20:               jal          t1, 5b
21:               c.jal        12b
22:               c.jal        24f
23:               c.jal        16b
24:               c.j          8b
25:               c.jal        4b
26:               jal          ra, 17b
27:               c.andi       s1, -1
                  la           sp, region_0+166 #start riscv_load_store_rand_instr_stream_2
                  lb           zero, -17(sp)
                  c.or         a3, a5
                  lbu          s7, -88(sp)
                  c.xor        a2, s1
                  lbu          t3, 1496(sp)
                  lh           s4, -152(sp)
                  mulhu        a3, s0, s2
                  sb           zero, 131(sp)
                  sltu         a2, a5, s5
                  sb           s1, 1034(sp)
                  srli         a0, s2, 21
                  mulhsu       t3, ra, a2
                  slli         s10, s0, 15
                  srli         a7, t5, 19
                  c.sub        s0, a1
                  lh           s9, 532(sp)
                  lbu          s5, 656(sp)
                  slli         t1, t4, 17
                  c.slli       s6, 15
                  sb           s2, 723(sp)
                  xor          s2, s5, s3
                  slt          a2, t6, gp
                  c.sub        a0, a3
                  and          s6, s9, s6
                  c.or         a4, a1
                  lb           zero, 1052(sp)
                  lbu          t0, 1609(sp)
                  nop
                  c.sub        a2, a3
                  lbu          a2, 1144(sp)
                  lui          a4, 660179
                  sb           t4, 1059(sp)
                  addi         a2, a1, -1102
                  sll          ra, a6, ra
                  lb           ra, 184(sp)
                  xor          a7, s10, t0
                  lbu          a3, 393(sp)
                  srl          ra, s5, s0
                  sub          t0, a5, t4
                  sb           s0, 1538(sp)
                  sb           a3, 875(sp)
                  addi         t6, t4, 594
                  lh           gp, 82(sp)
                  lbu          s7, 979(sp)
                  sh           zero, 68(sp) #end riscv_load_store_rand_instr_stream_2
                  la           sp, region_0+1558 #start riscv_hazard_instr_stream_2
                  sb           a2, -17(sp)
                  andi         s3, s1, 643
                  srai         t0, s3, 14
                  lbu          t0, -31(sp)
                  lbu          s1, -63(sp)
                  and          t0, s3, s1
                  lbu          s3, 15(sp)
                  lh           s10, 50(sp)
                  c.li         t0, 21
                  sb           a2, -41(sp)
                  sb           t0, -55(sp)
                  lhu          t0, -18(sp)
                  ori          t0, a2, -439
                  sb           s3, -33(sp)
                  add          s10, s10, t0
                  c.mv         s10, s1
                  lbu          s7, 1(sp)
                  mulh         s7, s7, a2
                  srai         s7, s10, 16
                  lbu          a2, 15(sp)
                  lb           a2, -37(sp)
                  c.srai       s1, 22
                  lb           a2, 50(sp)
                  xor          t0, s1, s3
                  or           s3, s1, s3
                  srai         s1, a2, 18
                  lb           s7, -47(sp)
                  slli         s1, s7, 21
                  sb           s3, -3(sp)
                  andi         s10, a2, -814
                  sw           s3, -34(sp)
                  xor          s1, a2, s7
                  lui          s10, 413052
                  auipc        a2, 946799
                  slt          s1, a2, t0
                  c.sub        s1, s1
                  c.add        s7, s7
                  c.lui        t0, 12
                  lb           s1, -31(sp)
                  lb           a2, 28(sp)
                  c.lui        t0, 15
                  c.or         s1, s1
                  lb           a2, -17(sp)
                  lbu          s7, -7(sp)
                  lw           s7, -38(sp)
                  lbu          s3, 57(sp)
                  sb           s3, 51(sp)
                  or           s7, s3, s10
                  sh           s10, -28(sp)
                  sh           a2, 60(sp)
                  lw           s3, -50(sp) #end riscv_hazard_instr_stream_2
                  addi         s0, zero, 10 #init loop 0 counter
                  remu         a0, a0, s9
                  div          ra, t5, zero
                  addi         zero, zero, 0 #init loop 0 limit
                  c.nop
                  sra          s4, s5, s6
                  mulh         a2, t2, s5
                  c.srai       a0, 13
                  or           a3, a0, gp
sub_1_15_0_t:     add          s1, t6, s3
                  c.sub        a4, a4
                  addi         s0, s0, -2 #update loop 0 counter
                  c.andi       a4, 5
                  sltiu        s11, t0, 355
                  srli         ra, t6, 6
                  sltiu        s4, t4, 1142
                  andi         s4, t3, -518
                  mulh         s11, a2, sp
                  auipc        t1, 843603
                  c.bnez       s0, sub_1_15_0_t #branch for loop 0
                  mulhsu       s10, t4, s0
                  la           s2, amo_0+56 #start riscv_lr_sc_instr_stream_0
                  lr.w.rl       zero, (s2)
                  sc.w          s0, t4, (s2) #end riscv_lr_sc_instr_stream_0
                  la           t3, amo_0+0 #start riscv_lr_sc_instr_stream_1
                  slti         ra, a3, -1446
                  lr.w          ra, (t3)
                  c.lui        a1, 18
                  remu         s0, s9, s1
                  add          a7, s1, a4
                  ori          t4, t5, -232
                  andi         t0, a0, 1717
                  lui          ra, 873229
                  c.srai       s1, 18
                  c.add        s8, t3
                  c.add        s4, s6
                  slti         s9, t2, 1887
                  sc.w          a1, a1, (t3) #end riscv_lr_sc_instr_stream_1
                  la           s6, amo_0+56 #start riscv_amo_instr_stream_0
                  la           t1, amo_0+4
                  sltiu        ra, a3, 139
                  nop
                  amomin.w.aq   s0, s10, (s6)
                  amoswap.w.rl  t2, s11, (s6)
                  amoswap.w.rl  s1, sp, (t1)
                  amomaxu.w.aq  a4, sp, (s6)
                  c.li         t5, 5
                  amoswap.w.aq  t4, t0, (t1)
                  c.sub        s1, a0
                  slti         gp, t0, 48
                  amominu.w.rl  t4, s5, (s6)
                  c.addi       sp, -1
                  mulh         a3, a7, s0
                  c.add        s8, s3
                  amoxor.w      a4, zero, (t1)
                  amoxor.w.aq   s8, s3, (s6)
                  amoadd.w      s0, s1, (t1)
                  amoand.w.aq   s8, gp, (s6) #end riscv_amo_instr_stream_0
                  la           a2, region_0+1963 #start riscv_load_store_rand_instr_stream_1
                  lh           s2, 35(a2)
                  slti         s10, t2, -867
                  lh           a0, -107(a2)
                  c.xor        s0, s0
                  sltiu        t0, s10, 1017
                  sltiu        t3, t2, 471
                  lb           gp, -20(a2)
                  lh           s2, 23(a2)
                  c.addi       t6, -1
                  c.nop
                  sb           t1, -32(a2)
                  srai         s4, a3, 4
                  sb           ra, -228(a2)
                  lbu          s8, -238(a2)
                  div          a1, t2, s0
                  addi         s5, s11, 1470
                  addi         s4, a2, -1198
                  lb           s1, -161(a2)
                  xor          a4, s4, a7
                  remu         t5, s4, sp
                  sb           sp, -202(a2)
                  sb           s4, -99(a2)
                  lb           s8, -160(a2)
                  sra          s11, s11, a2
                  lh           t5, 19(a2)
                  lui          s2, 411921
                  c.addi       s0, -1
                  xori         t5, a6, -921
                  sltiu        s6, s8, 1174
                  sw           s4, -87(a2)
                  sh           t6, 31(a2)
                  srli         s10, s2, 16
                  sh           a6, -101(a2) #end riscv_load_store_rand_instr_stream_1
                  la           gp, region_1+1443 #start load_store_instr_stream_0
                  sb           t5, -397(gp)
                  la           a2, region_1+756 #start load_store_instr_stream_1
                  sb           s2, -22(a2)
                  sh           ra, -497(gp)
                  lh           a1, -54(a2)
                  lbu          s3, -1226(gp)
                  lb           a3, -1197(gp)
                  lb           sp, -845(gp)
                  sb           a4, 33(a2)
                  sb           ra, -37(a2)
                  sh           s6, -12(a2)
                  sh           zero, -183(gp)
                  lbu          sp, 36(a2)
                  lb           a0, -13(a2)
                  sb           s7, -15(a2)
                  lb           s6, 72(gp)
                  lb           a7, -52(a2)
                  sh           sp, 321(gp)
                  sw           s11, 16(a2) #end load_store_instr_stream_1
                  lbu          t6, -410(gp) #end load_store_instr_stream_0
sub_1_6:          jal          t6, 16f
0:                jal          ra, 10f
1:                c.j          13f
2:                c.jal        5f
3:                c.j          8f
4:                c.jal        15f
5:                c.j          19f
6:                c.jal        11f
7:                c.j          2b
8:                jal          ra, 6b
9:                jal          ra, 20f
10:               c.jal        12f
11:               c.jal        1b
12:               jal          ra, 4b
13:               jal          t1, 18f
14:               c.jal        17f
15:               c.j          3b
16:               c.jal        9b
17:               jal          sp, 7b
18:               c.jal        14b
19:               c.jal        21f
20:               jal          s2, 0b
21:               c.addi       a7, -1
                  la           t3, region_1+1809 #start load_store_instr_stream_3
                  lb           ra, 0(t3)
                  la           t6, region_1+1097 #start load_store_instr_stream_4
                  lbu          a0, 11(t6)
                  la           a2, region_1+554 #start load_store_instr_stream_2
                  lhu          sp, -142(a2)
                  sb           t2, -14(t6)
                  lbu          s6, -22(t3)
                  la           a4, region_1+1355 #start load_store_instr_stream_1
                  la           gp, region_1+1317 #start load_store_instr_stream_0
                  lw           t0, -1(t6)
                  lb           s8, -64(t3)
                  lbu          ra, 2(a4)
                  sb           s10, -14(gp)
                  lbu          s2, 7(t6)
                  sw           s10, -41(t3)
                  lbu          s2, -8(t6)
                  sb           zero, 11(a4)
                  sb           t0, 83(a2)
                  lb           t4, -2(t6)
                  lbu          s6, 64(t3)
                  lw           t2, -118(a2)
                  sb           ra, -187(a2)
                  lw           t4, 11(gp)
                  sb           s4, -16(a4)
                  lw           s10, 13(a4)
                  lb           s9, 29(t3)
                  lhu          zero, -1(a4)
                  lbu          s3, -11(gp)
                  lb           s7, -8(gp)
                  lb           s7, 4(a4)
                  lb           s10, 14(gp)
                  lbu          a7, -8(a4)
                  lb           s7, 16(gp)
                  lbu          s5, -15(gp)
                  sb           zero, -62(t3)
                  lbu          t5, -64(t3)
                  lw           s4, 9(a4)
                  lb           s10, -23(a2) #end load_store_instr_stream_2
                  lbu          a3, -11(gp)
                  sb           a4, 27(t3) #end load_store_instr_stream_3
                  lb           t2, 4(a4)
                  lh           t5, 13(gp)
                  lbu          s5, 16(t6) #end load_store_instr_stream_4
                  lbu          sp, 8(a4) #end load_store_instr_stream_1
                  sb           s3, 11(gp) #end load_store_instr_stream_0
                  la           sp, region_1+1614 #start riscv_load_store_hazard_instr_stream_0
                  lb           t5, -421(sp)
                  lb           t4, -421(sp)
                  lb           a2, -421(sp)
                  sb           tp, -1245(sp)
                  mulh         ra, s10, sp
                  sb           a1, -1245(sp)
                  lbu          t3, -1245(sp)
                  sb           a1, -1245(sp)
                  lb           s1, -1245(sp)
                  lbu          zero, -1245(sp)
                  c.or         s0, a1
                  lw           a7, -1146(sp)
                  srli         t6, t4, 12
                  lh           t0, -1146(sp)
                  ori          a2, s6, -905
                  sb           s4, -1217(sp) #end riscv_load_store_hazard_instr_stream_0
sub_1_5:          jal          t6, 9f
0:                c.jal        11f
1:                c.j          6f
2:                jal          ra, 0b
3:                jal          ra, 10f
4:                jal          s2, 14f
5:                c.j          7f
6:                c.j          13f
7:                c.jal        1b
8:                c.j          5b
9:                c.jal        3b
10:               jal          ra, 8b
11:               c.j          12f
12:               c.jal        4b
13:               c.jal        2b
14:               xor          s5, t5, a2
                  addi         t0, zero, 10 #init loop 0 counter
                  addi         s0, zero, 10 #init loop 0 limit
sub_1_14_0_t:     mulhsu       ra, t3, t5
                  addi         t0, t0, -9 #update loop 0 counter
                  bgeu         t0, s0, sub_1_14_0_t #branch for loop 0
                  divu         s5, s2, tp
                  la           s0, region_1+145 #start riscv_hazard_instr_stream_0
                  c.or         s1, s1
                  lb           t6, 1381(s0)
                  auipc        s1, 668546
                  c.and        s1, s1
                  lb           s1, 1594(s0)
                  lb           t0, 459(s0)
                  sltu         s1, t1, gp
                  lb           t3, 1846(s0)
                  lh           gp, 31(s0)
                  sb           t3, -28(s0)
                  lw           gp, 1527(s0)
                  c.add        t1, t0
                  sll          t1, t0, t3
                  add          t3, s1, gp
                  srai         t3, t6, 19
                  lb           t0, 1110(s0)
                  c.nop
                  lbu          t0, 1439(s0)
                  sb           gp, 1179(s0)
                  sb           gp, 974(s0)
                  sb           s1, -53(s0)
                  sb           t1, 297(s0)
                  nop
                  lb           t3, 389(s0)
                  lb           s1, 536(s0)
                  lh           s1, -95(s0)
                  nop
                  c.nop
                  c.slli       gp, 28
                  lh           t0, 313(s0)
                  lbu          t1, 1722(s0)
                  sb           t6, 1700(s0)
                  lh           t3, 1081(s0)
                  mulhsu       gp, s1, t3
                  lb           t0, 112(s0)
                  sh           gp, 459(s0)
                  sb           s1, 1526(s0)
                  lbu          t0, 1478(s0)
                  sb           t1, 270(s0)
                  lw           t1, 983(s0)
                  lbu          gp, 1064(s0)
                  or           s1, t0, t6
                  slti         s1, t1, -657
                  lbu          t1, 1230(s0)
                  lb           t6, 1558(s0) #end riscv_hazard_instr_stream_0
                  la           t0, amo_0+56 #start riscv_amo_instr_stream_1
                  la           t1, amo_0+28
                  la           s11, amo_0+8
                  amoxor.w      s10, a5, (t1)
                  slt          a0, t6, a2
                  amoadd.w.rl   t5, a3, (s11)
                  amoand.w.rl   s4, t5, (t0) #end riscv_amo_instr_stream_1
                  la           a2, region_0+1273 #start riscv_load_store_rand_instr_stream_0
                  sub          t5, t5, tp
                  c.lui        s2, 26
                  sb           s5, -1195(a2)
                  lbu          s8, 143(a2)
                  auipc        s4, 716857
                  slt          a3, a3, a7
                  sb           a0, 465(a2)
                  slli         t6, gp, 8
                  lhu          t1, -125(a2)
                  lb           s6, -80(a2)
                  srai         s5, a6, 26
                  lb           a7, -1064(a2)
                  lbu          s10, 340(a2)
                  xori         t5, t2, 1135
                  c.and        s0, a0
                  c.or         a4, a1
                  sw           s0, -57(a2)
                  sh           gp, 625(a2)
                  lh           zero, -233(a2)
                  c.addi4spn   a3, sp, 688
                  c.lui        a3, 2
                  remu         s8, s11, s2
                  sb           a3, -118(a2)
                  sh           s5, 593(a2)
                  addi         s0, zero, 1281
                  srli         a1, s5, 2
                  lbu          a7, -936(a2)
                  lw           s7, 687(a2)
                  lbu          s8, 532(a2)
                  sb           s8, 580(a2)
                  and          t2, t5, s1
                  ori          s10, s3, -884
                  lb           a0, 461(a2)
                  lui          t3, 983194
                  lbu          t6, 160(a2)
                  sb           a7, 406(a2)
                  c.lui        t5, 11
                  lbu          s6, 476(a2) #end riscv_load_store_rand_instr_stream_0
                  la           sp, region_0+1803 #start riscv_load_store_hazard_instr_stream_2
                  lw           s2, 1(sp)
                  sb           s4, 1(sp)
                  lw           zero, 1(sp)
                  lb           t0, 0(sp)
                  lui          t1, 174952
                  c.nop
                  sw           t6, -7(sp)
                  rem          t0, zero, a6
                  ori          zero, t5, 150
                  lhu          s1, 9(sp)
                  sub          s6, a6, gp
                  sb           a6, -4(sp)
                  lb           t2, -4(sp)
                  sb           ra, 13(sp)
                  lbu          t2, 13(sp)
                  lh           t0, 13(sp)
                  lh           s6, 13(sp)
                  lhu          t3, 13(sp)
                  sb           sp, -16(sp)
                  lh           s5, -15(sp) #end riscv_load_store_hazard_instr_stream_2
                  la           t4, region_0+933 #start load_store_instr_stream_0
                  lb           zero, 187(t4)
                  lbu          a1, 170(t4)
                  sw           a5, -141(t4)
                  lbu          s7, 76(t4)
                  la           t0, region_1+47 #start load_store_instr_stream_1
                  lb           zero, 11(t4)
                  sh           s8, 189(t0)
                  lbu          a7, 20(t4)
                  lb           t1, 118(t0)
                  lbu          t6, 182(t0)
                  lbu          a7, 3(t0)
                  lh           a3, -35(t4)
                  lhu          zero, 179(t4)
                  lbu          a0, 197(t4)
                  sw           s6, 53(t0) #end load_store_instr_stream_1
                  lbu          t1, 241(t4) #end load_store_instr_stream_0
                  c.bnez       a0, 8f
                  add          t2, s9, a2
                  c.slli       s4, 30
                  auipc        s11, 113979
                  add          s2, t3, s0
                  c.srai       a0, 1
                  c.add        s7, gp
                  c.beqz       a3, 11f
8:                remu         s9, tp, a2
                  slti         s2, s1, 1463
                  slt          a7, a6, s3
11:               c.or         s1, a0
                  div          s3, ra, a3
                  c.andi       a2, -1
                  beq          tp, a7, 30f
                  slt          sp, sp, s10
                  sub          s1, t0, s10
                  mulhu        s5, sp, t6
                  mul          s6, a2, s2
                  xori         gp, a2, 387
                  bge          a1, t0, 24f
                  srli         s8, tp, 18
                  c.srai       a4, 18
                  bgeu         t2, a0, 40f
24:               sll          t5, t3, s0
                  bltu         t0, s11, 34f
                  and          a0, s4, s5
                  mulhsu       sp, s3, t2
                  slti         t6, s0, 729
                  auipc        s9, 774321
30:               bne          a1, a3, 32f
                  srai         a3, ra, 28
32:               remu         t5, a4, a2
                  ori          ra, tp, -8
                  sltiu        s4, t3, 1272
                  sltu         t4, s10, t6
                  c.andi       s1, -1
                  c.add        s11, t5
                  c.lui        s5, 23
sub_1_j2:         jal          t6, sub_5 #jump sub_1 -> sub_5
                  slti         s5, ra, 841
34:               srli         a7, a2, 18
                  sltiu        t2, s10, 2037
                  c.lui        t0, 15
                  c.addi4spn   a1, sp, 560
                  lui          t0, 500731
                  sltu         a1, s10, s0
40:               c.xor        s0, a4
                  add          a7, s9, a2
                  beq          t5, zero, 45f
                  mulhsu       s0, s4, a7
                  c.mv         s7, s0
45:               mulhu        a1, t4, t1
                  auipc        t5, 1005335
                  c.li         a3, 12
                  srai         t6, s11, 29
                  c.addi       s7, 13
                  andi         t6, s9, 858
                  c.add        a7, t5
                  ori          a3, a5, -1970
                  c.li         ra, 28
                  slt          gp, a2, a0
                  remu         t2, t2, t2
                  blt          t1, s0, 61f
                  c.li         gp, 0
                  c.beqz       s0, 69f
                  c.andi       a4, -1
                  auipc        t4, 1033385
61:               ori          a7, s9, 1039
                  or           t6, s0, t0
                  auipc        t6, 700083
                  srai         s5, a1, 23
                  sub          s2, t0, a5
                  c.or         a2, a4
                  slt          t1, t6, sp
                  rem          a1, sp, t6
69:               bgeu         a1, a5, 82f
                  bge          s5, s1, 78f
                  sltiu        t4, a0, 1055
                  ori          ra, a3, 1585
                  remu         gp, s0, a3
                  rem          t1, a3, t2
                  ori          a3, a1, 1568
                  srli         s2, s8, 14
                  c.srli       a4, 24
78:               andi         a0, tp, 1686
                  add          s8, s4, tp
                  mulh         t2, sp, t4
                  lui          a2, 197078
82:               divu         s4, a5, s9
                  bgeu         a2, s11, 101f
                  c.srli       a1, 21
                  srli         s1, ra, 10
                  xori         s10, t1, -1208
                  add          s4, s0, gp
                  c.addi4spn   a1, sp, 32
                  and          s4, t2, s8
                  rem          s6, a6, s9
                  or           t5, s3, t2
                  c.addi16sp   sp, 144
                  mulh         s4, a4, t4
                  srl          t3, s6, s2
                  divu         a1, s9, s10
                  mulhsu       a3, s1, a7
                  or           t1, ra, zero
                  sra          s6, s10, a5
                  mul          s8, s3, s3
                  divu         zero, s6, t1
101:              c.srli       a4, 31
                  bne          t3, gp, 109f
                  slti         gp, s8, 259
                  div          s9, tp, s4
                  bltu         t1, t0, 116f
                  bgeu         a3, zero, 117f
                  c.and        s0, a3
                  c.lui        t1, 15
109:              sltu         s0, s10, gp
                  c.addi16sp   sp, -16
                  mulhu        s10, a3, s5
                  mulhsu       s0, s6, t5
                  c.srli       a2, 3
                  addi         t3, s4, 879
                  remu         a4, s1, s9
116:              c.nop
117:              srli         s0, a0, 23
                  c.or         a2, a3
                  c.srai       a4, 4
                  c.bnez       a4, 128f
                  blt          s10, t4, 133f
                  mulh         a7, a0, s11
                  auipc        s10, 1018802
                  slt          a1, ra, t3
                  c.xor        a2, a0
                  c.xor        s1, a2
                  c.addi       t4, 21
128:              c.xor        s0, a1
                  c.sub        a0, s0
                  c.mv         s6, t4
                  xor          a3, s8, s3
                  sltu         a4, s7, s5
133:              beq          a2, s5, 143f
                  sub          s1, zero, a2
                  blt          sp, sp, 144f
                  blt          a4, t5, 153f
                  c.lui        s1, 12
                  slt          a2, t3, s9
                  mul          s6, a4, a4
                  srli         t6, t2, 26
                  bge          s8, s10, 156f
                  mulhu        t6, a4, s4
143:              c.and        a2, s0
144:              c.slli       a2, 20
                  and          a1, a3, tp
                  mulhsu       s4, s6, t5
                  c.andi       a3, -1
                  c.addi       a3, 9
                  c.beqz       a2, 153f
                  c.beqz       a3, 166f
                  addi         s6, t4, -752
                  ori          s2, sp, 640
153:              sll          a2, s6, zero
                  c.andi       a0, 15
                  ori          s5, s7, -1991
156:              remu         t0, sp, a7
                  and          a2, a5, t3
                  c.addi4spn   a0, sp, 464
                  slli         s6, s4, 24
                  and          s11, a7, t6
                  c.addi4spn   s1, sp, 80
                  sra          t0, s0, s9
                  c.andi       a2, -1
                  srli         s6, s11, 14
                  auipc        sp, 901052
166:              bltu         s0, ra, 167f
167:              mulhsu       s4, gp, ra
                  sll          t0, ra, a7
                  bgeu         s2, t6, 183f
                  sub          s2, a7, s0
                  c.addi       a0, -1
                  c.andi       a0, -1
                  beq          t1, t1, 182f
                  bne          s10, t1, 189f
                  c.sub        a4, s1
                  mul          s11, a2, gp
                  sltiu        t2, tp, 1265
                  rem          sp, s9, a7
                  sub          a0, s6, t4
                  c.mv         t3, a3
                  c.beqz       a0, 183f
182:              c.xor        a4, a3
183:              sll          s4, a7, t2
                  c.and        a1, a1
                  srai         a0, s4, 10
                  xor          a0, a5, t2
                  ori          sp, t1, 1149
                  mulhsu       t3, a1, s8
189:              addi         sp, a0, -459
                  and          s10, s10, s0
                  div          t2, s3, s0
                  divu         s10, a7, a1
                  and          t4, t3, zero
                  slti         s4, s7, -224
                  bgeu         s2, s9, 201f
                  sltu         t3, a3, t0
                  andi         s11, t2, 233
                  rem          a1, a7, a7
                  nop
                  c.and        a2, a3
201:              c.xor        s0, a5
                  c.sub        s0, a2
                  c.addi16sp   sp, -16
                  xor          t4, t0, ra
                  c.addi16sp   sp, 336
                  sll          ra, t2, a6
                  c.nop
                  c.addi       a7, 27
                  and          s11, a4, a4
                  c.srli       a2, 21
                  c.and        a0, a0
                  srai         a2, t2, 14
                  remu         t5, s2, t1
                  bge          t6, s6, 225f
                  nop
                  blt          a0, s2, 234f
                  srli         s3, s8, 24
                  sub          t0, t5, s7
                  blt          a1, a2, 225f
                  srl          a1, a1, t0
                  rem          t4, a0, a2
                  c.addi4spn   a0, sp, 16
                  c.and        a4, s0
                  add          t6, t4, ra
225:              srli         s9, a2, 1
                  lui          a4, 192081
                  divu         a1, sp, t2
                  slt          s3, a6, zero
                  slli         a4, s10, 31
                  bgeu         t6, t3, 239f
                  c.sub        a3, s1
                  sltu         t1, a4, sp
                  sltu         s7, t6, s11
234:              bgeu         a2, a2, 238f
                  sltiu        t5, t1, 998
                  bltu         s5, s11, 245f
                  c.xor        a0, a4
238:              xor          a3, sp, a7
239:              c.nop
                  srl          s3, t2, a0
                  c.addi16sp   sp, -16
                  xor          ra, ra, t4
                  srli         a4, s10, 9
                  c.slli       t3, 13
245:              sll          t0, t5, t3
                  c.add        a4, t5
                  c.addi4spn   a3, sp, 960
                  sub          a7, s10, s5
                  sra          s10, a6, a5
                  c.sub        a3, a4
                  div          s1, tp, t1
                  div          sp, a4, s10
                  add          a0, s1, t5
                  and          a2, a3, a4
                  bltu         a6, t6, 260f
                  mulh         s7, t6, s3
                  c.lui        t1, 4
                  c.or         a2, a1
                  remu         sp, gp, sp
260:              c.xor        s1, s1
                  sltu         sp, s0, s10
                  mul          s4, s8, tp
                  sra          sp, t1, zero
                  mulhsu       s1, t4, a4
                  bge          a0, s0, 268f
                  mul          a3, s11, t5
                  c.li         s3, -1
268:              c.li         gp, 15
                  sltiu        t0, t6, 1364
                  srai         t0, zero, 20
                  bltu         a2, a2, 280f
                  blt          sp, s2, 288f
                  sub          s6, ra, a6
                  slti         t1, sp, -909
                  srai         a1, a5, 4
                  divu         s9, a6, gp
                  lui          t3, 754922
                  xor          sp, s5, t1
                  c.slli       gp, 21
280:              srai         zero, s7, 9
                  c.addi16sp   sp, 448
                  c.slli       s10, 15
                  xor          a0, s10, t2
                  xori         s3, t6, 1931
                  bge          s2, t6, 293f
                  xori         zero, t3, 916
                  c.and        s1, a1
288:              c.andi       s0, -1
                  sltiu        s5, ra, -1349
                  add          a7, s0, s3
                  c.srai       a4, 20
                  mulhsu       a0, a7, t5
293:              c.addi16sp   sp, 320
                  c.xor        a1, s0
                  beq          t2, a0, 310f
                  slt          a1, tp, s4
                  c.lui        s5, 3
                  c.sub        s1, s0
                  mulhu        s1, t6, a3
                  and          s7, s0, a1
                  c.mv         s2, t2
                  bltu         zero, s2, 313f
                  or           zero, t0, s5
                  sub          t6, s9, t2
                  c.xor        s0, a4
                  c.srai       s0, 27
                  c.addi       t1, -1
                  slti         a4, t1, 1151
                  c.sub        s0, a1
310:              srai         sp, s7, 10
                  slt          a3, a6, ra
                  or           a1, ra, s10
313:              c.xor        a0, a1
                  bgeu         a1, t5, 318f
                  c.addi       s7, -1
                  c.addi       s0, -1
                  bge          t2, s10, 319f
318:              c.addi4spn   a3, sp, 720
319:              c.sub        a2, a3
                  mulhsu       t6, a6, t6
                  add          ra, ra, s10
                  xori         t0, s2, -725
                  c.mv         t4, s2
                  mulhsu       gp, a1, s6
                  c.nop
                  c.sub        s0, a0
                  c.li         s3, -1
                  slli         s6, a7, 16
                  c.and        a0, a2
                  add          t5, a3, zero
                  c.addi16sp   sp, -16
                  div          s10, a5, zero
                  c.and        s1, s1
                  div          s6, a6, a6
                  div          zero, tp, tp
                  add          t4, sp, a0
                  slli         t3, s0, 27
                  c.bnez       a4, 349f
                  c.and        s1, a5
                  bgeu         s5, a7, 354f
                  c.xor        a0, s1
                  xor          s3, a1, t5
                  c.or         a1, s0
                  xori         s5, s1, -351
                  andi         a0, s11, 1484
                  c.bnez       a3, 347f
347:              mulh         s4, t5, a4
                  c.xor        a0, s0
349:              srli         a7, gp, 24
                  c.bnez       a3, 365f
                  slli         s1, s6, 2
                  andi         t2, a4, 771
                  bge          s0, s1, 370f
354:              mulhu        gp, s5, t2
                  c.or         s1, s0
                  divu         t3, ra, s9
                  c.sub        s1, a5
                  mulh         a0, t0, s7
                  divu         s9, t6, s2
                  srai         sp, t0, 18
                  or           t6, s6, a4
                  c.sub        s0, a1
                  c.srai       s0, 31
                  c.srai       a2, 22
365:              sltu         t3, s7, ra
                  mulh         s9, s11, s4
                  srl          a1, sp, s9
                  andi         s1, s6, 1400
                  slt          a1, a7, s0
                  mulh         gp, s5, s0
                  c.addi16sp   sp, 176
                  auipc        a1, 835304
                  srl          t1, gp, a2
                  nop
sub_1_j3:         jal          t6, sub_2 #jump sub_1 -> sub_2
                  mulhu        s2, s3, gp
370:              c.srai       a3, 31
                  bltu         a7, t1, 375f
                  lui          s4, 154724
                  div          t0, s6, a1
                  c.addi16sp   sp, 80
375:              mulh         zero, a7, zero
                  c.or         a4, s0
                  rem          s2, t2, a4
                  addi         s10, a6, -1286
                  slli         s11, t2, 2
                  bltu         s1, gp, 388f
                  c.li         s10, 14
                  xor          a0, a6, a0
                  c.xor        s0, a3
                  c.or         a2, a3
                  mulhu        s10, sp, s7
                  add          t0, a0, s9
                  lui          s8, 332738
388:              slti         t0, s9, 298
                  sll          t3, s10, a2
                  sll          t5, s4, t6
                  addi         s11, t0, -549
                  div          a7, ra, a6
                  srl          s6, s7, s6
                  remu         a4, s4, s2
                  mul          a0, t3, a3
                  c.add        t0, a3
                  c.lui        t2, 19
                  c.li         a0, 6
                  add          s3, t1, ra
                  mul          a4, tp, s1
                  c.addi16sp   sp, -16
                  divu         s0, a0, a7
                  blt          a5, a0, 419f
                  c.lui        a1, 31
                  divu         t2, s11, sp
                  sll          a7, tp, a7
                  bgeu         s6, a4, 420f
                  div          s0, s4, a6
                  c.xor        a3, s0
                  c.addi16sp   sp, 32
                  c.and        a2, a4
                  c.or         a4, s1
                  c.xor        a3, s0
                  slti         gp, a1, -629
                  addi         t5, s10, -1371
                  c.bnez       a2, 424f
                  c.and        a1, a4
                  div          a7, s10, a5
419:              sltu         gp, s2, s9
420:              remu         s1, s1, s10
                  bne          t1, ra, 431f
                  c.srai       s1, 12
                  xor          a0, s0, s3
424:              srli         t0, a5, 25
                  c.mv         gp, s0
                  sll          t2, tp, t6
                  addi         s0, s4, 1198
                  andi         s11, s8, -817
                  slt          s11, a3, zero
                  slt          t3, s2, sp
431:              c.mv         a3, t4
                  rem          s2, a5, a7
                  addi         a1, s5, 650
                  xor          s9, s1, t4
                  srli         t1, a4, 25
                  c.and        a1, a2
                  or           gp, s9, sp
                  ori          t5, s10, 1454
                  slt          s10, a6, a1
                  c.addi16sp   sp, -16
                  rem          t4, t1, tp
                  sub          a4, a3, a0
                  blt          tp, a1, 445f
                  or           t4, t4, s3
445:              sll          t5, sp, s9
                  mul          s11, s10, a1
                  slt          a1, a4, s5
                  c.mv         s5, a4
                  mul          s3, s5, s6
                  blt          tp, tp, 457f
                  lui          t1, 420030
                  srli         ra, tp, 19
                  slti         s11, s6, 510
                  beq          a7, s6, 466f
                  bltu         s6, t1, 472f
                  blt          s5, t3, 473f
457:              c.add        s5, s5
                  sltiu        t0, ra, 513
                  beq          s9, t1, 470f
                  c.li         s2, 24
                  nop
                  bgeu         a4, tp, 464f
                  remu         s10, s8, t5
464:              addi         s5, sp, -758
                  c.add        a2, s0
466:              sub          s3, s4, a6
                  srl          s6, s0, ra
                  c.slli       sp, 16
                  sub          t3, a2, a5
470:              c.addi16sp   sp, -16
                  remu         s11, s10, t6
472:              bne          s7, a3, 473f
473:              c.srai       a2, 25
                  mulh         t0, ra, s3
                  srli         s11, a7, 29
                  c.addi16sp   sp, -16
                  c.xor        a0, a0
                  c.srli       a4, 2
                  c.slli       gp, 17
                  c.addi16sp   sp, 192
                  add          t6, s9, a3
                  c.and        a3, a4
                  c.and        a1, a3
                  c.mv         a4, tp
                  bne          t4, a4, 501f
                  ori          s7, tp, 31
                  sltiu        t0, s3, 1964
                  mul          t5, a6, zero
                  c.xor        s0, a1
                  c.add        t2, s6
                  xor          s2, a4, s2
                  c.sub        a0, a5
                  mulh         s1, a0, a5
                  remu         a7, t1, a6
                  mul          a7, gp, s11
                  mul          s8, s6, tp
                  srli         s1, s6, 20
                  remu         t6, a3, s9
                  nop
                  c.nop
501:              mulhu        s9, a6, t5
                  sltu         s0, t5, tp
                  lui          ra, 520110
                  sll          t5, a7, s1
                  c.lui        a7, 1
                  c.beqz       a4, 524f
                  mul          a7, s9, s9
                  c.and        a2, a3
                  xor          s10, t3, a6
                  c.mv         s4, a2
                  c.and        a2, a5
                  c.mv         s8, tp
                  c.add        a1, t2
                  slli         s0, s11, 28
                  bgeu         s5, s4, 523f
                  sltu         t3, gp, s2
                  slti         a7, a1, 1641
                  auipc        s10, 281688
                  srli         t1, a7, 28
                  mulh         t2, s0, a5
                  nop
                  bne          zero, a7, 525f
523:              div          zero, a1, t2
524:              divu         s0, s9, s10
525:              xor          sp, sp, ra
                  c.add        t0, s9
                  ori          a2, s5, 1922
                  sltiu        s11, t5, -110
                  mulhsu       t4, t4, a5
                  sltiu        a4, s6, -892
                  sll          a7, gp, a5
                  slli         zero, a5, 27
                  c.addi       s8, -1
                  auipc        a2, 772771
                  auipc        sp, 126511
                  srai         a2, s6, 7
                  c.srai       s0, 28
                  slli         s5, t6, 5
                  bgeu         tp, s5, 553f
                  bne          a4, t5, 552f
                  c.or         a4, a4
                  slti         t4, s5, -1232
                  bltu         s3, t4, 551f
                  mul          t6, s7, t5
                  bgeu         s7, a4, 560f
                  c.sub        a2, a1
                  divu         s3, gp, t6
                  mulhsu       s11, s8, a1
                  lui          t3, 1036401
                  c.xor        a0, a4
551:              c.li         s7, 5
552:              add          t5, a5, s6
553:              c.sub        a4, a0
                  divu         s3, s2, s10
                  srli         s1, tp, 11
                  sll          sp, s8, s7
                  beq          t5, s0, 572f
                  divu         a1, t3, tp
                  c.beqz       s1, 561f
560:              c.andi       s1, 29
561:              or           s0, a5, ra
                  c.add        s9, s5
                  srli         sp, t5, 0
                  c.addi16sp   sp, 464
                  c.add        sp, t2
                  c.beqz       a0, 582f
                  sltiu        s11, t6, 1087
                  c.mv         t4, sp
                  andi         t5, t5, 962
                  bltu         a0, gp, 579f
                  nop
572:              slli         s10, a5, 0
                  c.xor        a2, a3
                  divu         a3, s7, s0
                  c.slli       s2, 27
                  auipc        s11, 347233
                  nop
                  c.xor        a2, s0
579:              mulhu        t4, s2, t1
                  bge          t2, s8, 591f
                  sll          t2, a1, s3
582:              srl          s6, s7, a7
                  bgeu         t0, t6, 591f
                  blt          s11, s10, 588f
                  div          s9, s1, a2
                  srl          a2, t2, s5
                  sub          s0, s11, a6
588:              bge          gp, a3, 599f
                  xori         t2, t1, 799
                  c.srli       a2, 5
591:              bltu         s1, t6, 604f
                  blt          t1, s3, 596f
                  or           sp, s6, a1
                  slli         sp, t2, 0
                  sltiu        a4, s1, 1647
596:              ori          t2, t6, 73
                  remu         t5, s8, a7
                  sra          gp, tp, a2
599:              slli         t3, s6, 6
                  nop
                  add          s0, gp, a4
                  c.srli       s1, 11
                  add          a7, t5, a0
604:              or           t5, tp, a6
                  c.sub        a2, s1
                  or           s4, zero, t5
                  rem          s4, s1, s9
                  sll          t0, s10, a3
                  nop
                  ori          a4, a4, -1821
                  addi         s5, a7, 1243
                  c.or         s0, a1
                  c.xor        a2, a0
                  c.sub        a0, a3
                  c.slli       s5, 10
                  sub          s6, s3, s11
                  c.nop
                  c.or         a3, a4
                  c.mv         t5, s0
                  bltu         s11, s6, 637f
                  bne          s8, s3, 628f
                  sltu         t3, s1, t4
                  slli         a1, a3, 12
                  srli         ra, tp, 7
                  sll          a1, s3, s10
                  bltu         s10, t1, 630f
                  sltiu        t1, a0, -1411
628:              sll          t6, t5, s4
                  remu         a1, t5, t1
630:              c.srli       a4, 28
                  and          s0, s7, s8
                  mul          s8, a1, t6
                  bltu         s9, t0, 642f
                  c.bnez       a1, 644f
                  bne          a0, s10, 644f
                  c.li         t3, 23
637:              srai         t1, t4, 23
                  sltu         a2, s4, t6
                  sltiu        t2, s1, 280
                  remu         s11, tp, s10
                  andi         gp, s1, -652
                  sltiu        s7, s7, 1263
                  or           a1, a7, a5
                  c.srai       a1, 29
                  la           s11, sub_4
                  c.add        a7, sp
                  and          t0, s3, tp
                  addi         s11, s11, -203
                  c.lui        s9, 25
                  mulhsu       s1, tp, a4
sub_1_j6:         jalr         t6, s11, 204 #jump sub_1 -> sub_4
                  lui          s2, 160299
642:              c.nop
                  mulhu        t6, a6, s10
644:              sll          a7, a0, s11
                  srai         t3, t5, 2
                  sra          s4, t1, t4
                  c.or         a0, s1
                  c.addi4spn   a2, sp, 240
                  blt          s9, t2, 655f
                  c.or         a1, a2
                  xor          s8, s2, a5
                  c.beqz       a3, 657f
                  remu         s3, a0, t4
                  sltiu        s2, s8, -794
655:              sub          s10, tp, a0
                  c.nop
657:              slli         a4, s4, 11
                  bge          a7, a5, 669f
                  c.addi       t3, -1
                  c.xor        a1, a5
                  mulhu        a0, s7, t3
                  ori          a3, s8, -1479
                  c.xor        a0, a5
                  xor          t3, ra, a4
                  auipc        a2, 707779
                  xori         a2, s11, 1101
                  or           s8, t6, a6
                  mulhu        t6, s4, t6
669:              c.and        a2, s1
                  c.bnez       a4, 674f
                  andi         t3, a6, 1044
                  auipc        s11, 706667
                  slti         a0, s8, -871
674:              slli         t6, t3, 4
                  div          t4, a1, t0
                  sll          a0, s1, sp
                  c.nop
                  c.xor        a2, a1
                  mulhsu       s6, ra, gp
                  rem          s5, s5, a2
                  c.addi       s2, -1
                  sub          t3, s6, s9
                  c.xor        a4, a2
                  slt          a2, zero, t2
                  sltu         ra, a6, t4
                  addi         s8, gp, -719
                  div          s9, sp, s4
                  c.lui        a7, 10
                  slt          a3, s3, sp
                  c.add        ra, a2
                  c.sub        s0, a3
                  divu         s5, s6, s10
                  c.add        s3, a7
                  div          t4, a3, a6
                  nop
                  c.or         a4, s1
                  c.xor        a3, s0
                  mulh         s6, ra, t6
                  rem          s6, s9, s3
                  c.andi       s0, 20
                  mulhu        ra, t1, a7
                  srai         s7, t0, 18
                  bgeu         a6, ra, 720f
                  sltiu        a2, s11, 1877
                  c.addi16sp   sp, -16
                  xor          s2, s7, ra
                  c.add        t6, s2
                  c.andi       a2, -1
                  bge          a7, s6, 710f
710:              slli         t1, t6, 3
                  bltu         tp, s0, 715f
                  c.beqz       a2, 723f
                  or           t3, tp, a1
                  xori         s2, t1, 817
715:              xori         gp, s2, -880
                  mulhsu       s10, zero, s3
                  divu         zero, a5, s1
                  c.or         a1, a0
                  c.li         a1, -1
720:              addi         t1, s8, -171
                  c.addi4spn   s0, sp, 928
                  c.beqz       s1, 724f
723:              sra          zero, tp, a5
724:              nop
                  mulh         s6, s10, tp
                  sra          a3, a0, t1
                  mul          a3, a1, tp
                  nop
                  sra          s6, s7, t5
                  bge          s9, a5, 741f
                  lui          a0, 639303
                  bge          tp, s7, 741f
                  bgeu         s6, s6, 748f
                  c.srai       s0, 3
                  sltiu        s1, t6, -1258
                  auipc        t1, 633266
                  sltiu        a3, ra, -1282
                  ori          s4, a0, -1004
                  c.srai       a1, 29
                  c.nop
741:              c.or         s1, a3
                  bge          s9, s4, 746f
                  and          a3, s9, a7
                  remu         t4, s9, a7
                  c.lui        t0, 28
746:              c.mv         t2, s10
                  mulhu        ra, a7, s8
748:              c.lui        s8, 21
                  srli         t3, s4, 18
                  c.addi16sp   sp, -16
                  c.addi4spn   a2, sp, 752
                  c.addi       s6, 21
                  c.lui        a0, 5
                  bne          t4, s5, 772f
                  mulhu        a0, ra, a4
                  sra          s11, gp, t5
                  nop
                  c.lui        gp, 26
                  c.add        gp, s10
                  div          gp, s11, s9
                  beq          a7, tp, 769f
                  add          a4, t5, sp
                  sll          s7, sp, t0
                  mulh         zero, a3, t6
                  c.sub        a4, a4
                  auipc        a7, 418177
                  c.andi       a4, 7
                  sltiu        t3, a4, -1556
769:              xori         s4, t3, -382
                  lui          s3, 477036
                  sltu         gp, t5, s5
772:              c.mv         t1, t0
                  c.nop
                  andi         a0, tp, 1585
                  xori         t0, s0, -814
                  div          s4, a0, a6
                  add          a3, t5, a3
                  c.andi       a3, -1
                  c.lui        s5, 26
                  and          t6, ra, t3
                  c.nop
                  lui          sp, 875189
                  c.nop
                  c.addi       t1, -1
                  slli         s9, a2, 10
                  srai         a7, s6, 19
                  divu         a1, s5, zero
                  bltu         s10, a3, 800f
                  or           s11, a4, sp
                  c.mv         a2, gp
                  c.mv         t2, ra
                  bgeu         a5, a4, 800f
                  xori         gp, gp, 1868
                  remu         a4, t3, zero
                  mulh         zero, s8, s5
                  c.addi4spn   a3, sp, 784
                  remu         a3, s11, t2
                  beq          s6, t4, 808f
                  lui          s4, 486651
800:              c.addi4spn   a3, sp, 896
                  andi         s11, s2, -796
                  sra          t1, a3, s11
                  c.lui        s7, 26
                  bltu         gp, s8, 812f
                  c.addi16sp   sp, 464
                  addi         t1, a1, 1581
                  mulhu        s7, a1, gp
808:              divu         t5, s11, sp
                  c.mv         ra, s6
                  c.and        a3, a0
                  c.addi16sp   sp, -16
812:              sltiu        s7, t3, -1060
                  c.addi16sp   sp, 80
                  c.lui        s4, 5
                  mulhu        t3, t1, t6
                  c.srli       s0, 5
                  c.or         a4, s1
                  sltiu        t4, a1, 54
                  c.addi4spn   s0, sp, 672
                  c.or         a0, a0
                  c.nop
                  sra          gp, t6, s7
                  nop
                  srli         s9, s3, 20
                  rem          t2, s5, s9
                  slti         s11, s4, -279
                  auipc        zero, 184254
                  c.nop
                  c.li         s3, 5
                  rem          t4, s5, s5
                  sll          gp, s3, sp
                  slli         s2, s7, 5
                  lw           t6, 4(tp)
                  c.mv         t0, a1
                  div          sp, s1, a7
                  addi         tp, tp, 24
                  sra          s9, s1, s9
1494:             addi x21, x31, 1
1494:             jalr x21, x21, 0
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
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_2:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_3:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_4:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_5:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_6:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_7:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_8:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_9:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_10:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_11:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_12:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_13:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_14:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x15, test_done
                  jalr x0, x15, 0

mmode_intr_vector_15:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
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
                  .option rvc;

mmode_exception_handler:
                  addi x16, x16, -4
                  sw  x4, (x16)
                  add x4, x16, zero
                  addi x4, x4, -128
                  sw  x1, 4(x4)
                  sw  x2, 8(x4)
                  sw  x3, 12(x4)
                  sw  x4, 16(x4)
                  sw  x5, 20(x4)
                  sw  x6, 24(x4)
                  sw  x7, 28(x4)
                  sw  x8, 32(x4)
                  sw  x9, 36(x4)
                  sw  x10, 40(x4)
                  sw  x11, 44(x4)
                  sw  x12, 48(x4)
                  sw  x13, 52(x4)
                  sw  x14, 56(x4)
                  sw  x15, 60(x4)
                  sw  x16, 64(x4)
                  sw  x17, 68(x4)
                  sw  x18, 72(x4)
                  sw  x19, 76(x4)
                  sw  x20, 80(x4)
                  sw  x21, 84(x4)
                  sw  x22, 88(x4)
                  sw  x23, 92(x4)
                  sw  x24, 96(x4)
                  sw  x25, 100(x4)
                  sw  x26, 104(x4)
                  sw  x27, 108(x4)
                  sw  x28, 112(x4)
                  sw  x29, 116(x4)
                  sw  x30, 120(x4)
                  sw  x31, 124(x4)
                  add x16, x4, zero
                  csrr x29, 0x341 # MEPC
                  csrr x29, 0x342 # MCAUSE
                  li x30, 0x3 # BREAKPOINT
                  beq x29, x30, ebreak_handler
                  li x30, 0x8 # ECALL_UMODE
                  beq x29, x30, ecall_handler
                  li x30, 0x9 # ECALL_SMODE
                  beq x29, x30, ecall_handler
                  li x30, 0xb # ECALL_MMODE
                  beq x29, x30, ecall_handler
                  li x30, 0x1
                  beq x29, x30, instr_fault_handler
                  li x30, 0x5
                  beq x29, x30, load_fault_handler
                  li x30, 0x7
                  beq x29, x30, store_fault_handler
                  li x30, 0xc
                  beq x29, x30, pt_fault_handler
                  li x30, 0xd
                  beq x29, x30, pt_fault_handler
                  li x30, 0xf
                  beq x29, x30, pt_fault_handler
                  li x30, 0x2 # ILLEGAL_INSTRUCTION
                  beq x29, x30, illegal_instr_handler
                  csrr x30, 0x343 # MTVAL
                  1: la x15, test_done
                  jalr x1, x15, 0

ecall_handler:    
                  la x29, _start
                  sw x0, 0(x29)
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  la x15, write_tohost
                  jalr x0, x15, 0

instr_fault_handler:
                  add x4, x16, zero
                  lw  x1, 4(x4)
                  lw  x2, 8(x4)
                  lw  x3, 12(x4)
                  lw  x4, 16(x4)
                  lw  x5, 20(x4)
                  lw  x6, 24(x4)
                  lw  x7, 28(x4)
                  lw  x8, 32(x4)
                  lw  x9, 36(x4)
                  lw  x10, 40(x4)
                  lw  x11, 44(x4)
                  lw  x12, 48(x4)
                  lw  x13, 52(x4)
                  lw  x14, 56(x4)
                  lw  x15, 60(x4)
                  lw  x16, 64(x4)
                  lw  x17, 68(x4)
                  lw  x18, 72(x4)
                  lw  x19, 76(x4)
                  lw  x20, 80(x4)
                  lw  x21, 84(x4)
                  lw  x22, 88(x4)
                  lw  x23, 92(x4)
                  lw  x24, 96(x4)
                  lw  x25, 100(x4)
                  lw  x26, 104(x4)
                  lw  x27, 108(x4)
                  lw  x28, 112(x4)
                  lw  x29, 116(x4)
                  lw  x30, 120(x4)
                  lw  x31, 124(x4)
                  addi x4, x4, 128
                  add x16, x4, zero
                  lw  x4, (x16)
                  addi x16, x16, 4
                  mret

load_fault_handler:
                  add x4, x16, zero
                  lw  x1, 4(x4)
                  lw  x2, 8(x4)
                  lw  x3, 12(x4)
                  lw  x4, 16(x4)
                  lw  x5, 20(x4)
                  lw  x6, 24(x4)
                  lw  x7, 28(x4)
                  lw  x8, 32(x4)
                  lw  x9, 36(x4)
                  lw  x10, 40(x4)
                  lw  x11, 44(x4)
                  lw  x12, 48(x4)
                  lw  x13, 52(x4)
                  lw  x14, 56(x4)
                  lw  x15, 60(x4)
                  lw  x16, 64(x4)
                  lw  x17, 68(x4)
                  lw  x18, 72(x4)
                  lw  x19, 76(x4)
                  lw  x20, 80(x4)
                  lw  x21, 84(x4)
                  lw  x22, 88(x4)
                  lw  x23, 92(x4)
                  lw  x24, 96(x4)
                  lw  x25, 100(x4)
                  lw  x26, 104(x4)
                  lw  x27, 108(x4)
                  lw  x28, 112(x4)
                  lw  x29, 116(x4)
                  lw  x30, 120(x4)
                  lw  x31, 124(x4)
                  addi x4, x4, 128
                  add x16, x4, zero
                  lw  x4, (x16)
                  addi x16, x16, 4
                  mret

store_fault_handler:
                  add x4, x16, zero
                  lw  x1, 4(x4)
                  lw  x2, 8(x4)
                  lw  x3, 12(x4)
                  lw  x4, 16(x4)
                  lw  x5, 20(x4)
                  lw  x6, 24(x4)
                  lw  x7, 28(x4)
                  lw  x8, 32(x4)
                  lw  x9, 36(x4)
                  lw  x10, 40(x4)
                  lw  x11, 44(x4)
                  lw  x12, 48(x4)
                  lw  x13, 52(x4)
                  lw  x14, 56(x4)
                  lw  x15, 60(x4)
                  lw  x16, 64(x4)
                  lw  x17, 68(x4)
                  lw  x18, 72(x4)
                  lw  x19, 76(x4)
                  lw  x20, 80(x4)
                  lw  x21, 84(x4)
                  lw  x22, 88(x4)
                  lw  x23, 92(x4)
                  lw  x24, 96(x4)
                  lw  x25, 100(x4)
                  lw  x26, 104(x4)
                  lw  x27, 108(x4)
                  lw  x28, 112(x4)
                  lw  x29, 116(x4)
                  lw  x30, 120(x4)
                  lw  x31, 124(x4)
                  addi x4, x4, 128
                  add x16, x4, zero
                  lw  x4, (x16)
                  addi x16, x16, 4
                  mret

ebreak_handler:   
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
                  add x4, x16, zero
                  lw  x1, 4(x4)
                  lw  x2, 8(x4)
                  lw  x3, 12(x4)
                  lw  x4, 16(x4)
                  lw  x5, 20(x4)
                  lw  x6, 24(x4)
                  lw  x7, 28(x4)
                  lw  x8, 32(x4)
                  lw  x9, 36(x4)
                  lw  x10, 40(x4)
                  lw  x11, 44(x4)
                  lw  x12, 48(x4)
                  lw  x13, 52(x4)
                  lw  x14, 56(x4)
                  lw  x15, 60(x4)
                  lw  x16, 64(x4)
                  lw  x17, 68(x4)
                  lw  x18, 72(x4)
                  lw  x19, 76(x4)
                  lw  x20, 80(x4)
                  lw  x21, 84(x4)
                  lw  x22, 88(x4)
                  lw  x23, 92(x4)
                  lw  x24, 96(x4)
                  lw  x25, 100(x4)
                  lw  x26, 104(x4)
                  lw  x27, 108(x4)
                  lw  x28, 112(x4)
                  lw  x29, 116(x4)
                  lw  x30, 120(x4)
                  lw  x31, 124(x4)
                  addi x4, x4, 128
                  add x16, x4, zero
                  lw  x4, (x16)
                  addi x16, x16, 4
                  mret

illegal_instr_handler:
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
                  add x4, x16, zero
                  lw  x1, 4(x4)
                  lw  x2, 8(x4)
                  lw  x3, 12(x4)
                  lw  x4, 16(x4)
                  lw  x5, 20(x4)
                  lw  x6, 24(x4)
                  lw  x7, 28(x4)
                  lw  x8, 32(x4)
                  lw  x9, 36(x4)
                  lw  x10, 40(x4)
                  lw  x11, 44(x4)
                  lw  x12, 48(x4)
                  lw  x13, 52(x4)
                  lw  x14, 56(x4)
                  lw  x15, 60(x4)
                  lw  x16, 64(x4)
                  lw  x17, 68(x4)
                  lw  x18, 72(x4)
                  lw  x19, 76(x4)
                  lw  x20, 80(x4)
                  lw  x21, 84(x4)
                  lw  x22, 88(x4)
                  lw  x23, 92(x4)
                  lw  x24, 96(x4)
                  lw  x25, 100(x4)
                  lw  x26, 104(x4)
                  lw  x27, 108(x4)
                  lw  x28, 112(x4)
                  lw  x29, 116(x4)
                  lw  x30, 120(x4)
                  lw  x31, 124(x4)
                  addi x4, x4, 128
                  add x16, x4, zero
                  lw  x4, (x16)
                  addi x16, x16, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x29, 0x300 # MSTATUS;
                  csrr  x29, 0x304 # MIE;
                  csrr  x29, 0x344 # MIP;
                  csrrc x29, 0x344, x29 # MIP;
                  add x4, x16, zero
                  lw  x1, 4(x4)
                  lw  x2, 8(x4)
                  lw  x3, 12(x4)
                  lw  x4, 16(x4)
                  lw  x5, 20(x4)
                  lw  x6, 24(x4)
                  lw  x7, 28(x4)
                  lw  x8, 32(x4)
                  lw  x9, 36(x4)
                  lw  x10, 40(x4)
                  lw  x11, 44(x4)
                  lw  x12, 48(x4)
                  lw  x13, 52(x4)
                  lw  x14, 56(x4)
                  lw  x15, 60(x4)
                  lw  x16, 64(x4)
                  lw  x17, 68(x4)
                  lw  x18, 72(x4)
                  lw  x19, 76(x4)
                  lw  x20, 80(x4)
                  lw  x21, 84(x4)
                  lw  x22, 88(x4)
                  lw  x23, 92(x4)
                  lw  x24, 96(x4)
                  lw  x25, 100(x4)
                  lw  x26, 104(x4)
                  lw  x27, 108(x4)
                  lw  x28, 112(x4)
                  lw  x29, 116(x4)
                  lw  x30, 120(x4)
                  lw  x31, 124(x4)
                  addi x4, x4, 128
                  add x16, x4, zero
                  lw  x4, (x16)
                  addi x16, x16, 4
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
