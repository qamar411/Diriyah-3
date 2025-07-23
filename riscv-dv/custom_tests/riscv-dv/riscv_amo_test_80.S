.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x23, h0_start
jalr x0, x23, 0
h0_start:
                  li x12, 0x40001105
                  csrw 0x301, x12
kernel_sp:        
                  la x17, kernel_stack_end

trap_vec_init:    
                  la x12, mtvec_handler
                  ori x12, x12, 1
                  csrw 0x305, x12 # MTVEC

mepc_setup:       
                  la x12, init
                  csrw 0x341, x12

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x12, 0x1800
                  csrw 0x300, x12 # MSTATUS
                  li x12, 0x0
                  csrw 0x304, x12 # MIE
                  mret
init:             
                  li x0, 0x80000000
                  li x1, 0xf3033ea1
                  li x2, 0x0
                  li x3, 0x80000000
                  li x4, 0x80000000
                  li x5, 0x80000000
                  li x6, 0x80000000
                  li x7, 0xf82d4bb1
                  li x8, 0xd9233d08
                  li x9, 0x0
                  li x10, 0x80000000
                  li x11, 0x0
                  li x12, 0xf
                  li x13, 0x0
                  li x14, 0x0
                  li x16, 0x2023b911
                  li x18, 0x6262fa40
                  li x19, 0x0
                  li x20, 0xf94065d8
                  li x21, 0xf24c043
                  li x22, 0x80000000
                  li x23, 0x80000000
                  li x24, 0x80000000
                  li x25, 0x5
                  li x26, 0x0
                  li x27, 0x0
                  li x28, 0xd
                  li x29, 0xe
                  li x30, 0xf65c4bf9
                  li x31, 0xf43c3768
                  la x15, user_stack_end
main:             c.add        s6, tp
                  la           gp, sub_1
                  addi         gp, gp, -700
                  c.li         s5, -1
                  sltu         a3, t4, a0
                  beq          gp, s6, main_j4 #branch to jump instr
                  c.and        s1, s1
                  slti         t2, gp, -1517
                  remu         s4, s0, a0
main_j4:          jalr         ra, gp, 701 #jump main -> sub_1
                  la           t0, amo_0+12 #start riscv_lr_sc_instr_stream_8
                  c.addi       sp, -1
                  xor          s8, a6, ra
                  slti         s5, s6, -1423
                  xor          a3, zero, a6
                  c.or         a0, a3
                  mulhu        s2, s4, t6
                  add          s0, s5, s0
                  lui          a6, 978509
                  c.andi       s0, 26
                  srai         a0, s3, 12
                  auipc        t4, 716661
                  lr.w          sp, (t0)
                  srli         s1, s6, 14
                  mulhu        s1, t0, t2
                  sc.w.rl       ra, sp, (t0) #end riscv_lr_sc_instr_stream_8
                  la           a0, amo_0+28 #start riscv_amo_instr_stream_15
                  la           s5, amo_0+56
                  la           t5, amo_0+8
                  amominu.w     s10, s5, (t5)
                  amoswap.w     tp, s9, (s5)
                  c.nop
                  amoswap.w.rl  s10, a1, (t5)
                  amoor.w       s6, a5, (a0)
                  amoand.w      s10, t1, (t5)
                  xor          s0, a3, a5
                  amoswap.w.rl  sp, s6, (t5) #end riscv_amo_instr_stream_15
                  la           a3, region_1+980 #start load_store_instr_stream_2
                  la           s2, region_1+954 #start load_store_instr_stream_1
                  la           t2, region_1+790 #start load_store_instr_stream_0
                  lh           s10, -180(t2)
                  lb           sp, 927(a3)
                  lbu          a1, -11(s2)
                  sb           t2, -380(a3)
                  lb           s6, 282(a3)
                  sb           t1, 8(t2)
                  lh           t3, 14(s2)
                  lbu          a2, 1007(a3)
                  lb           a2, 164(t2)
                  lb           s0, -599(a3)
                  sb           s1, -7(s2)
                  sb           s2, 337(a3)
                  sb           a2, 7(s2)
                  sb           t3, -496(a3)
                  lb           s8, -71(t2)
                  sb           a6, 70(t2)
                  lb           s1, -12(t2)
                  lbu          s3, -7(s2)
                  lb           s0, -208(a3)
                  sb           sp, 114(t2)
                  sb           a0, 4(s2)
                  sw           a4, -2(s2) #end load_store_instr_stream_1
                  sb           s6, 173(a3) #end load_store_instr_stream_2
                  lbu          t4, -17(t2)
                  sb           s11, 143(t2)
                  sb           gp, 177(t2) #end load_store_instr_stream_0
                  addi         a0, zero, 9 #init loop 1 counter
                  c.addi4spn   a4, sp, 736
                  sltu         sp, a1, t5
                  addi         ra, zero, 8 #init loop 1 limit
main_123_1_t:     c.and        a2, a5
                  and          s0, s9, tp
                  addi         a0, a0, -6 #update loop 1 counter
                  mulhsu       gp, t1, a3
                  addi         a1, zero, 1 #init loop 0 counter
                  sll          sp, s0, s2
                  slli         t2, a1, 25
                  addi         s10, zero, -15 #init loop 0 limit
                  sll          a3, s6, t6
                  srl          zero, t3, a3
main_123_0_t:     c.mv         s9, s7
                  sltiu        t0, s9, 1854
                  c.addi4spn   s0, sp, 528
                  addi         a1, a1, -1 #update loop 0 counter
                  auipc        s1, 839123
                  beq          a1, s10, main_123_0_t #branch for loop 0
                  mul          a2, s10, s7
                  slli         a6, t0, 27
                  mulh         a6, s10, tp
                  srai         t6, t0, 5
                  c.xor        a2, a3
                  bgeu         a0, ra, main_123_1_t #branch for loop 1
                  c.slli       s2, 3
                  la           ra, region_1+741 #start riscv_hazard_instr_stream_13
                  lbu          t2, 17(ra)
                  slti         t4, t4, 1900
                  sltiu        s10, t4, -1434
                  sb           a6, -60(ra)
                  add          s10, a6, t2
                  mul          a1, a1, t4
                  c.lui        a6, 21
                  lh           a6, -5(ra)
                  c.nop
                  c.slli       s10, 29
                  mul          s9, a1, a6
                  lw           s9, 51(ra)
                  lbu          a6, 46(ra)
                  c.or         a1, a1
                  sra          a6, a1, a1
                  lh           s10, 11(ra)
                  lbu          a6, -12(ra)
                  sb           a6, -48(ra)
                  c.add        s10, a6
                  div          a6, s10, t2
                  lbu          a6, -7(ra)
                  divu         t4, s9, t2
                  lw           t2, -29(ra)
                  lbu          a1, -11(ra)
                  c.sub        a1, a1
                  lb           s9, -22(ra)
                  lbu          a1, 50(ra)
                  sb           t4, -50(ra)
                  xor          s9, s10, s10
                  lb           a1, -18(ra)
                  andi         s10, a1, 337
                  remu         t2, a1, t4
                  auipc        s10, 914357
                  c.add        t2, t4
                  lb           t4, -21(ra)
                  sra          a6, a1, a1
                  sw           s9, 35(ra)
                  c.srli       a1, 18
                  div          s10, s10, s10
                  lb           a6, 12(ra)
                  c.add        s10, a1
                  remu         a6, t4, a6
                  sll          a1, s10, a1
                  srl          t4, s9, a6
                  and          t2, t2, t2
                  lbu          t2, -29(ra) #end riscv_hazard_instr_stream_13
                  la           sp, region_1+252 #start riscv_hazard_instr_stream_17
                  c.or         a4, a4
                  c.xor        a2, a4
                  add          a6, a6, a2
                  lb           a4, 5(sp)
                  lbu          s10, -1(sp)
                  sb           s2, 15(sp)
                  c.swsp       a4, 12(sp)
                  lb           s10, 11(sp)
                  andi         s10, s10, -184
                  lui          s3, 978214
                  lb           a4, -7(sp)
                  lbu          s10, -1(sp)
                  c.or         a4, a2
                  sb           s10, 9(sp)
                  xor          a2, s3, s3
                  lbu          s2, 14(sp)
                  mulhsu       s10, a6, s2
                  remu         a4, a6, s10
                  sh           s3, 2(sp)
                  sb           s10, -11(sp)
                  c.add        s10, s2
                  c.nop
                  sh           a4, -4(sp)
                  lb           a4, -9(sp) #end riscv_hazard_instr_stream_17
                  la           a6, amo_0+12 #start riscv_amo_instr_stream_11
                  amoxor.w.aq   s6, s1, (a6)
                  amoor.w.rl    s4, a2, (a6)
                  c.srli       s1, 12
                  amoadd.w      t5, t5, (a6)
                  amomin.w.aq   a1, a3, (a6) #end riscv_amo_instr_stream_11
main_49:          jal          ra, 3f
0:                c.j          8f
1:                jal          t0, 4f
2:                c.jal        10f
3:                c.jal        11f
4:                c.j          5f
5:                jal          t1, 2b
6:                jal          gp, 1b
7:                jal          gp, 9f
8:                jal          ra, 7b
9:                jal          ra, 12f
10:               c.jal        0b
11:               c.jal        6b
12:               c.slli       s5, 27
                  la           a4, region_0+1971 #start riscv_load_store_hazard_instr_stream_6
                  lbu          t5, -62(a4)
                  lb           tp, 28(a4)
                  c.or         s1, a0
                  sb           gp, 28(a4)
                  lbu          a2, -14(a4)
                  lbu          sp, -14(a4)
                  sh           s9, 9(a4)
                  lb           t6, 9(a4)
                  sb           s3, -26(a4)
                  sb           t3, -20(a4)
                  add          a1, a6, a3
                  c.nop
                  sw           t4, -15(a4)
                  lhu          s4, -15(a4)
                  lbu          t4, -6(a4)
                  lb           sp, 2(a4)
                  sb           t4, 12(a4)
                  sh           a1, -15(a4)
                  lbu          ra, 1(a4)
                  sb           s3, -17(a4)
                  andi         sp, sp, 522
                  lb           s4, -44(a4)
                  c.srli       s0, 24
                  c.sub        s0, s0
                  sb           tp, -44(a4) #end riscv_load_store_hazard_instr_stream_6
                  la           tp, region_0+242 #start load_store_instr_stream_0
                  la           t4, region_1+1920 #start load_store_instr_stream_1
                  lbu          t1, -97(tp)
                  sb           gp, 1498(tp)
                  lhu          a6, -122(t4)
                  lb           t0, -1909(t4)
                  lbu          a4, -207(t4)
                  lw           sp, 16(t4)
                  sb           t4, 161(tp)
                  sb           a5, -319(t4)
                  sw           sp, -1892(t4)
                  lbu          t3, -633(t4)
                  lb           s8, 41(tp)
                  sb           a4, -1231(t4)
                  lb           a2, 1031(tp)
                  lbu          s0, 1303(tp)
                  lhu          sp, -296(t4) #end load_store_instr_stream_1
                  lb           sp, 1313(tp)
                  sb           ra, 609(tp)
                  lbu          a6, 1716(tp) #end load_store_instr_stream_0
                  la           t4, region_0+766 #start riscv_hazard_instr_stream_24
                  c.andi       a4, 18
                  auipc        a4, 730022
                  c.lui        t5, 5
                  sra          s8, s6, s2
                  slti         s2, s8, -546
                  auipc        t5, 565120
                  c.lui        t5, 28
                  c.li         t5, 17
                  lhu          s6, -14(t4)
                  sh           a4, 14(t4)
                  div          a4, t5, tp
                  lb           t5, 11(t4)
                  remu         s2, s2, s2
                  lb           a4, 3(t4)
                  divu         a4, t5, t5
                  lbu          a4, 13(t4)
                  sra          tp, s8, s6
                  mul          s6, a4, tp
                  sra          a4, a4, a4
                  lb           s2, 7(t4)
                  mulh         s8, s6, s2
                  lb           s2, 9(t4)
                  sb           a4, 9(t4)
                  slti         s8, s6, 1600
                  lbu          a4, 9(t4)
                  sra          s8, s8, s8
                  lb           t5, 2(t4)
                  andi         tp, s8, -2023
                  lb           s6, 6(t4)
                  lbu          s8, 15(t4) #end riscv_hazard_instr_stream_24
                  la           sp, region_0+646 #start riscv_load_store_rand_instr_stream_1
                  sb           s2, 5(sp)
                  mulhsu       t4, a7, s4
                  lb           a6, 3(sp)
                  srl          s0, a0, s1
                  sb           t4, 13(sp)
                  remu         t3, t6, a6
                  srai         ra, t5, 0
                  lhu          s4, -12(sp)
                  ori          a4, a3, -954
                  lb           s1, 12(sp)
                  srai         s8, s7, 17
                  lb           a4, 5(sp)
                  lh           a3, -2(sp)
                  div          s11, a3, gp
                  lbu          s5, 13(sp)
                  sll          t5, t0, t5
                  lhu          a0, 12(sp)
                  lb           s0, -7(sp)
                  xori         s9, t1, 1606
                  sb           zero, -7(sp)
                  sb           t3, -7(sp)
                  auipc        gp, 929646
                  xori         s3, a3, 1917
                  nop
                  sh           s4, 8(sp)
                  add          t4, a1, t4
                  lb           a3, 13(sp)
                  slti         s3, s1, 313
                  lh           s11, 0(sp)
                  mulhu        s2, a1, s8
                  slti         s4, s2, 1783
                  lbu          a0, -15(sp)
                  lbu          gp, -15(sp)
                  mulhu        a0, a4, s5
                  c.mv         a0, s10
                  lbu          t1, -10(sp)
                  srai         ra, a2, 20
                  slt          t1, a1, t1
                  addi         s1, a3, 728
                  lbu          a1, -16(sp)
                  sb           a0, -7(sp)
                  lb           gp, 1(sp)
                  sll          s9, s4, s10
                  srli         s3, a0, 13
                  sll          s4, a0, s10
                  lb           s11, -2(sp)
                  nop
                  lb           t0, -5(sp)
                  c.add        t3, s5
                  c.nop
                  slti         t6, s5, 1214
                  c.add        a4, s2
                  lhu          a1, -10(sp) #end riscv_load_store_rand_instr_stream_1
                  la           gp, amo_0+12 #start riscv_amo_instr_stream_16
                  la           tp, amo_0+44
                  amoswap.w.rl  a2, a4, (tp)
                  amoadd.w.aq   t3, s0, (tp)
                  amoadd.w.rl   s5, t6, (tp)
                  amomin.w.aq   s9, s2, (gp)
                  amomax.w.aq   zero, s7, (tp)
                  amomax.w      a6, sp, (gp)
                  amomax.w.rl   t2, t4, (tp)
                  c.or         a0, a3
                  c.lui        s5, 30
                  amoand.w      a1, t6, (gp)
                  amominu.w.aq  t3, t3, (tp) #end riscv_amo_instr_stream_16
                  la           s11, region_0+585 #start load_store_instr_stream_2
                  la           a1, region_0+1935 #start load_store_instr_stream_0
                  lb           tp, 44(s11)
                  lb           s8, -1404(a1)
                  lbu          s8, 4(s11)
                  lbu          t4, -506(a1)
                  lb           t5, -58(s11)
                  la           a4, region_0+1412 #start load_store_instr_stream_1
                  lbu          s1, -11(s11)
                  la           s10, region_0+1741 #start load_store_instr_stream_3
                  lh           a2, 5(s11)
                  lb           sp, -15(s10)
                  lb           a3, -565(a1)
                  lhu          t0, -397(a1)
                  lh           s6, 29(s11)
                  lhu          a6, 32(a4)
                  lbu          t6, -31(a4)
                  lhu          a2, -999(s10)
                  lh           a0, -1775(a1)
                  sb           s9, -43(a4)
                  lb           a2, -904(a1)
                  lh           t5, 50(a4)
                  lb           ra, 22(s11)
                  lb           t5, 35(a4)
                  sw           s5, -75(a1)
                  lb           s8, -43(a4)
                  lbu          a6, -1254(a1)
                  lbu          t3, -172(s10)
                  lhu          s3, -49(s11)
                  lbu          t5, -750(s10)
                  sh           a5, -14(a4)
                  lbu          t4, -21(a4)
                  lb           ra, -54(s11)
                  lbu          s9, -1738(a1)
                  lb           a3, -3(a4)
                  lb           t4, -45(a4) #end load_store_instr_stream_1
                  sh           s10, -17(s11) #end load_store_instr_stream_2
                  lh           t0, 77(s10) #end load_store_instr_stream_3
                  lb           t6, -1800(a1) #end load_store_instr_stream_0
                  la           t3, amo_0+36 #start riscv_lr_sc_instr_stream_17
                  mulhsu       s8, a2, t3
                  div          s8, sp, a1
                  xor          s6, a6, s11
                  sltiu        s2, s0, 1523
                  remu         t0, sp, a7
                  c.li         a1, 15
                  lr.w.aq       s9, (t3)
                  lui          t1, 213367
                  mulhsu       a0, s11, tp
                  mulh         a6, t4, s7
                  slt          t0, t4, t3
                  c.mv         s4, t3
                  c.andi       a2, 17
                  srli         s8, t4, 29
                  c.lui        a2, 4
                  sc.w.rl       a6, s1, (t3) #end riscv_lr_sc_instr_stream_17
                  la           a4, region_0+1172 #start load_store_instr_stream_1
                  sb           a1, 0(a4)
                  la           s2, region_1+966 #start load_store_instr_stream_0
                  lh           s9, 10(a4)
                  lhu          t0, 70(s2)
                  lbu          gp, 3(a4)
                  lbu          s8, 0(a4)
                  lw           t0, 226(s2)
                  lbu          s1, -3(a4)
                  lbu          zero, -14(a4)
                  lbu          a2, -3(a4)
                  lb           s1, -77(s2)
                  lh           zero, 2(a4)
                  lb           t0, -1(a4) #end load_store_instr_stream_1
                  sb           t2, -156(s2)
                  lb           t2, 177(s2) #end load_store_instr_stream_0
main_48:          jal          ra, 1f
0:                c.j          2f
1:                c.j          11f
2:                c.jal        9f
3:                c.j          7f
4:                c.jal        10f
5:                jal          ra, 3b
6:                c.jal        0b
7:                c.jal        8f
8:                jal          ra, 12f
9:                jal          ra, 5b
10:               c.j          6b
11:               c.jal        4b
12:               c.mv         t3, s2
                  la           gp, amo_0+44 #start riscv_lr_sc_instr_stream_13
                  lr.w.aq       s1, (gp)
                  sc.w.rl       ra, a2, (gp) #end riscv_lr_sc_instr_stream_13
                  la           s8, region_0+1107 #start riscv_hazard_instr_stream_7
                  xor          s1, s9, s1
                  mul          s6, s9, s1
                  lh           t2, 1(s8)
                  div          a0, s9, s0
                  sra          s6, a0, s6
                  lbu          a0, -11(s8)
                  c.nop
                  sra          t2, a0, s0
                  sltiu        s6, s0, 925
                  and          s1, s6, a0
                  lb           s6, -6(s8)
                  mulhu        s6, a0, s1
                  sb           s6, 10(s8)
                  and          s0, a0, s9
                  andi         s1, s6, -1200
                  c.srai       a0, 27
                  mul          s0, a0, s0
                  lbu          t2, 1(s8)
                  sll          s1, s1, a0
                  div          s9, s6, s0
                  rem          s9, s9, s6
                  c.or         a0, s1
                  xori         a0, s1, -1665
                  sh           s0, 13(s8)
                  lhu          s0, -5(s8)
                  c.slli       s1, 9
                  lbu          s0, 6(s8)
                  sb           s1, 11(s8)
                  lbu          s6, -6(s8)
                  c.srli       a0, 2
                  sltu         s9, s1, s6
                  lb           t2, 4(s8)
                  c.lui        s6, 6
                  mulh         t2, s6, s1
                  lbu          s1, 4(s8)
                  and          s9, a0, s6
                  divu         s6, s6, s0
                  srli         t2, s6, 7
                  slli         s1, s0, 28
                  c.lui        s0, 10
                  sb           s1, -12(s8) #end riscv_hazard_instr_stream_7
                  la           a6, region_0+1687 #start load_store_instr_stream_1
                  la           s5, region_1+115 #start load_store_instr_stream_0
                  lh           s4, -177(a6)
                  lbu          s6, 9(s5)
                  sb           t5, -81(a6)
                  lhu          s10, -231(a6)
                  lbu          tp, 8(s5)
                  lb           t0, -246(a6)
                  lb           s0, -15(s5)
                  lh           t0, 233(a6)
                  sb           s2, -42(a6)
                  sb           s8, 0(s5)
                  sb           gp, 64(a6) #end load_store_instr_stream_1
                  lbu          zero, 15(s5)
                  lb           s10, 8(s5) #end load_store_instr_stream_0
                  la           a2, amo_0+28 #start riscv_amo_instr_stream_12
                  la           s10, amo_0+4
                  la           t2, amo_0+56
                  la           s6, amo_0+32
                  amoand.w.aq   zero, a4, (a2)
                  amoswap.w.rl  tp, a3, (s10)
                  amomaxu.w.rl  s3, zero, (t2)
                  amomin.w      t6, s6, (t2)
                  amoand.w      a6, t5, (a2)
                  c.and        a0, s1
                  c.addi       t5, 7
                  amomaxu.w.aq  s0, s2, (t2)
                  xori         s2, s6, -1738
                  mul          tp, s5, t0
                  amoor.w.aq    gp, ra, (s10) #end riscv_amo_instr_stream_12
                  la           s8, region_1+1680 #start load_store_instr_stream_0
                  sh           s7, -14(s8)
                  la           tp, region_0+159 #start load_store_instr_stream_1
                  sb           t3, 9(s8)
                  lh           t0, 83(tp)
                  lbu          s9, 138(tp)
                  sb           s9, -5(s8)
                  sb           a0, 187(tp)
                  sw           a5, -12(s8)
                  lbu          gp, 249(tp)
                  lbu          gp, 108(tp)
                  sh           tp, -14(s8)
                  sb           s0, 9(s8)
                  lbu          sp, 186(tp)
                  lb           s11, 11(s8)
                  sb           s0, 12(s8)
                  sb           s11, -7(s8)
                  sh           a7, -89(tp)
                  sb           a5, 184(tp)
                  lb           t1, 76(tp) #end load_store_instr_stream_1
                  sb           s0, -3(s8) #end load_store_instr_stream_0
                  la           s9, region_1+558 #start riscv_load_store_hazard_instr_stream_9
                  sh           s4, -40(s9)
                  lb           a4, -5(s9)
                  sb           s3, -5(s9)
                  lh           tp, 32(s9)
                  mulh         s10, s2, t4
                  lbu          t4, -40(s9)
                  lb           sp, -40(s9)
                  lw           s1, 46(s9)
                  sb           t6, 46(s9)
                  lb           t6, 46(s9)
                  lw           a1, 46(s9)
                  lw           a0, 46(s9)
                  sb           s8, 46(s9)
                  sh           a6, -50(s9)
                  lbu          zero, -50(s9)
                  srl          t4, a1, s9
                  lw           s2, -50(s9) #end riscv_load_store_hazard_instr_stream_9
                  la           t0, amo_0+16 #start riscv_amo_instr_stream_4
                  amoswap.w     tp, s5, (t0) #end riscv_amo_instr_stream_4
                  la           sp, region_1+1946 #start riscv_load_store_rand_instr_stream_21
                  lh           zero, 24(sp)
                  lbu          gp, 29(sp)
                  xor          ra, t6, ra
                  lb           s8, 15(sp)
                  xor          s9, s3, t0
                  sb           t1, 15(sp)
                  ori          s1, a3, 516
                  lb           s2, 9(sp)
                  lbu          a1, 17(sp)
                  lbu          t2, -60(sp)
                  divu         a3, a2, s3
                  sb           s11, 9(sp)
                  lb           a0, -4(sp)
                  lb           t6, -8(sp)
                  lbu          ra, -45(sp)
                  lbu          ra, -59(sp)
                  lbu          s11, -25(sp)
                  lb           t4, 5(sp)
                  lbu          ra, -9(sp)
                  c.andi       s0, 8
                  c.slli       t0, 20
                  rem          gp, t6, s8
                  lb           ra, -37(sp)
                  sltiu        s6, tp, 1150
                  lh           s0, -24(sp)
                  lbu          gp, -40(sp)
                  lb           a1, 41(sp)
                  sb           t4, -13(sp)
                  c.nop
                  lb           a0, 39(sp)
                  sb           s9, 25(sp)
                  remu         s4, s4, s2
                  lb           s5, -43(sp)
                  sb           sp, -19(sp)
                  sll          ra, s9, s9
                  lbu          a4, -4(sp)
                  lb           a3, 23(sp)
                  c.addi       t6, -1
                  lbu          zero, -55(sp)
                  c.li         a0, -1
                  lbu          s11, -58(sp) #end riscv_load_store_rand_instr_stream_21
main_61:          jal          ra, 11f
0:                c.jal        3f
1:                c.jal        13f
2:                jal          t1, 12f
3:                c.jal        5f
4:                c.jal        18f
5:                c.jal        2b
6:                jal          ra, 8f
7:                jal          ra, 15f
8:                c.j          23f
9:                jal          ra, 22f
10:               c.j          0b
11:               c.jal        7b
12:               c.j          20f
13:               c.jal        19f
14:               jal          t1, 10b
15:               jal          t1, 6b
16:               c.j          21f
17:               c.j          1b
18:               c.j          9b
19:               c.jal        24f
20:               c.jal        4b
21:               c.jal        17b
22:               c.j          16b
23:               c.j          14b
24:               c.and        a1, a4
main_63:          jal          ra, 1f
0:                c.jal        13f
1:                jal          t0, 7f
2:                jal          ra, 4f
3:                c.jal        9f
4:                c.j          10f
5:                jal          tp, 11f
6:                c.jal        3b
7:                c.jal        2b
8:                c.j          6b
9:                jal          ra, 0b
10:               jal          s6, 12f
11:               c.jal        8b
12:               c.jal        5b
13:               addi         s5, a4, 1787
                  la           t5, amo_0+16 #start riscv_amo_instr_stream_9
                  la           a2, amo_0+20
                  amoswap.w     a1, tp, (a2)
                  amoswap.w     a4, a5, (a2)
                  amoswap.w.aq  s8, s5, (a2)
                  amomax.w      t3, s7, (t5)
                  c.andi       s1, 8
                  amoor.w.aq    zero, s1, (t5)
                  amomin.w      sp, s7, (t5)
                  amoor.w.aq    a1, zero, (a2)
                  amoand.w      s4, t1, (a2) #end riscv_amo_instr_stream_9
                  la           a2, region_0+908 #start load_store_instr_stream_1
                  la           a3, region_1+1104 #start load_store_instr_stream_0
                  lbu          s0, -30(a3)
                  lbu          s1, 16(a2)
                  lb           t3, -196(a3)
                  sb           a5, 228(a3)
                  lb           a4, 5(a2)
                  lb           s5, -3(a2)
                  lbu          a0, 244(a3)
                  sb           s8, -1(a2)
                  lh           s0, -154(a3)
                  lbu          a4, -4(a3)
                  sb           a3, 223(a3)
                  lh           sp, -10(a2)
                  lbu          s5, 3(a2)
                  lhu          s5, 8(a2) #end load_store_instr_stream_1
                  sh           a4, 38(a3) #end load_store_instr_stream_0
                  la           a3, region_1+1335 #start load_store_instr_stream_0
                  la           s6, region_1+841 #start load_store_instr_stream_1
                  sb           s5, -14(a3)
                  la           s3, region_1+715 #start load_store_instr_stream_3
                  la           t3, region_1+304 #start load_store_instr_stream_4
                  lb           ra, 55(s3)
                  lh           s4, -50(t3)
                  lb           tp, 15(t3)
                  la           t6, region_1+1971 #start load_store_instr_stream_2
                  lhu          s0, 235(s3)
                  lbu          t2, -8(a3)
                  lb           a2, -28(t3)
                  lb           s2, 58(s6)
                  lb           a0, -2(a3)
                  sb           a6, 46(s6)
                  lb           a2, 55(t3)
                  sb           t5, -158(t6)
                  lb           a0, 94(s3)
                  lbu          sp, -18(s6)
                  sb           t5, -197(t6)
                  lh           tp, -89(t6)
                  lb           s2, 33(t3)
                  lbu          s5, 7(a3)
                  sb           a5, -126(t6)
                  lhu          t2, -163(s3)
                  lhu          s8, -115(t6)
                  lhu          s1, -189(s3)
                  sw           a4, -103(t6)
                  sb           t3, 66(s6)
                  lbu          a1, -1(a3)
                  lb           s10, 176(s3)
                  lbu          t0, -61(s6)
                  lbu          t5, 48(s6)
                  sh           s1, -231(s3)
                  lbu          tp, 0(a3)
                  lbu          ra, 201(s6)
                  lhu          s9, -243(s6)
                  lbu          s5, -9(a3)
                  lh           a1, -57(s3) #end load_store_instr_stream_3
                  lb           t4, -44(t3)
                  lbu          a4, 2(a3)
                  sb           tp, 189(s6)
                  lbu          s1, -216(s6) #end load_store_instr_stream_1
                  sb           t4, -51(t3)
                  sb           gp, 10(a3)
                  sb           s0, -19(t3) #end load_store_instr_stream_4
                  lh           a1, -151(t6) #end load_store_instr_stream_2
                  sb           s8, -6(a3) #end load_store_instr_stream_0
                  la           s9, region_1+1886 #start load_store_instr_stream_1
                  lb           ra, 23(s9)
                  la           s8, region_0+1803 #start load_store_instr_stream_0
                  lbu          gp, -180(s8)
                  lb           t0, -232(s8)
                  lbu          s5, 25(s9)
                  lbu          s6, -28(s9)
                  lb           a4, -8(s9)
                  lh           s1, 55(s8)
                  lh           a3, -168(s9)
                  lb           s0, -201(s9)
                  lbu          a2, -188(s8)
                  lb           s11, -83(s9)
                  sb           tp, -152(s8)
                  lb           s11, -141(s9)
                  sh           s2, -16(s9) #end load_store_instr_stream_1
                  lhu          s1, 9(s8) #end load_store_instr_stream_0
                  la           s4, region_0+59 #start riscv_load_store_rand_instr_stream_14
                  lh           t2, 141(s4)
                  lui          a4, 889892
                  lb           tp, 772(s4)
                  lh           a3, 1501(s4)
                  c.addi       a1, -1
                  sb           t0, 1170(s4)
                  c.or         s1, a4
                  c.addi4spn   a2, sp, 880
                  mulh         tp, s6, a2
                  mulhu        t6, sp, a1
                  or           s2, a5, s10
                  mulhsu       s3, t0, a5
                  sll          a1, s6, t3
                  remu         t3, a5, s4
                  c.slli       s1, 7
                  sh           a2, 1605(s4)
                  c.addi       s10, -1
                  lb           a2, 945(s4)
                  mulh         a6, a3, a7
                  mulhsu       a3, t4, a3
                  mulhsu       s0, a0, s9
                  lbu          a4, 714(s4)
                  slti         t2, t2, -165
                  c.addi       a1, -1
                  lb           s2, 762(s4)
                  c.nop
                  sb           s5, 635(s4)
                  rem          s0, t5, ra
                  c.addi       t4, -1
                  srai         t6, a0, 17
                  sb           s3, 267(s4)
                  remu         t3, s5, a1
                  c.and        s0, a5
                  xor          s10, s8, t5
                  sb           s2, 1236(s4)
                  lh           s6, 1443(s4)
                  c.addi4spn   a1, sp, 800
                  lbu          a0, 680(s4)
                  remu         a6, a7, a2
                  lbu          s2, 132(s4)
                  c.xor        a1, a4
                  c.li         a0, 31
                  lb           s6, 1508(s4) #end riscv_load_store_rand_instr_stream_14
                  la           tp, region_1+219 #start load_store_instr_stream_0
                  lbu          a3, 120(tp)
                  la           a0, region_0+710 #start load_store_instr_stream_1
                  lh           t2, -95(tp)
                  lbu          a6, -591(a0)
                  lb           a6, 162(tp)
                  sh           t3, -374(a0)
                  sb           a5, 229(tp)
                  lhu          s11, -205(tp)
                  lbu          s11, -115(tp)
                  sb           t3, 675(a0)
                  lb           s9, 216(tp)
                  sb           a1, -41(a0)
                  lb           t0, 182(tp)
                  sb           s9, -114(tp)
                  lhu          s2, 648(a0) #end load_store_instr_stream_1
                  lbu          s1, -134(tp) #end load_store_instr_stream_0
                  la           t6, region_0+1032 #start riscv_hazard_instr_stream_4
                  lh           s8, 54(t6)
                  c.nop
                  c.xor        s0, s0
                  sb           s10, 17(t6)
                  xor          ra, s8, s10
                  sb           s0, -49(t6)
                  srl          s8, ra, tp
                  lh           s10, -24(t6)
                  sb           tp, 26(t6)
                  mulhsu       ra, ra, s0
                  c.slli       s10, 30
                  sb           s8, -34(t6)
                  lbu          s4, 23(t6)
                  lb           s4, -37(t6)
                  c.sub        s0, s0
                  lbu          s4, 5(t6)
                  lbu          s8, -40(t6)
                  lb           s10, 10(t6)
                  c.sub        s0, s0
                  c.sub        s0, s0
                  lui          tp, 666957
                  ori          s8, s4, 1360
                  lb           ra, -3(t6)
                  lh           ra, 18(t6)
                  c.add        s0, s8
                  mulhu        s4, s8, s0
                  lb           ra, 15(t6)
                  c.srai       s0, 7
                  lw           ra, -60(t6)
                  lbu          s0, -17(t6)
                  lb           s10, 23(t6)
                  lhu          ra, -36(t6)
                  sltiu        s4, s10, -2036
                  xori         s0, s10, 869
                  slli         s4, ra, 10
                  lbu          ra, -28(t6)
                  div          s10, s4, s4
                  sb           s4, 37(t6)
                  srl          s0, s0, tp
                  sll          s8, s0, tp
                  ori          s10, ra, -613
                  lb           s4, 35(t6)
                  lb           ra, 37(t6)
                  c.mv         s4, s10
                  c.srli       s0, 28
                  lh           s4, -36(t6)
                  sll          s8, s4, s8
                  lb           s0, 49(t6)
                  lh           s8, -30(t6)
                  sb           s0, 41(t6) #end riscv_hazard_instr_stream_4
                  la           sp, region_0+1810 #start riscv_load_store_hazard_instr_stream_7
                  lbu          t0, 155(sp)
                  lbu          t6, 155(sp)
                  lbu          tp, 155(sp)
                  sb           gp, 141(sp)
                  c.andi       a2, -1
                  lb           s5, 141(sp)
                  lb           s3, 141(sp)
                  sb           tp, 141(sp)
                  lbu          s3, 141(sp)
                  sh           zero, -72(sp)
                  lbu          a0, -72(sp)
                  sh           a3, -72(sp)
                  lbu          a3, -241(sp)
                  slti         s11, s10, 1081
                  sb           s8, 103(sp)
                  lb           t4, 103(sp)
                  sb           a2, 103(sp)
                  sb           a4, 103(sp)
                  lbu          s2, 103(sp) #end riscv_load_store_hazard_instr_stream_7
                  la           sp, region_1+399 #start riscv_load_store_rand_instr_stream_24
                  addi         s8, s0, 529
                  divu         ra, s9, gp
                  c.srli       s0, 2
                  lhu          a2, -3(sp)
                  add          s4, s11, a3
                  sll          t1, a5, a2
                  c.and        a2, a5
                  lbu          gp, -11(sp)
                  sb           t5, -2(sp)
                  addi         gp, s1, 1232
                  c.add        t2, s1
                  ori          s5, t6, -261
                  lbu          s0, -6(sp)
                  c.addi       s2, -1
                  sub          s0, sp, s2
                  lbu          s3, 1(sp)
                  lbu          gp, 2(sp)
                  xor          t1, t2, ra
                  lbu          s6, 14(sp)
                  divu         a1, tp, t0
                  lbu          zero, -3(sp)
                  lb           a1, 7(sp)
                  lb           s8, -11(sp)
                  lbu          t3, -16(sp) #end riscv_load_store_rand_instr_stream_24
                  addi         s1, zero, -4 #init loop 1 counter
                  xor          t2, ra, s0
                  andi         t1, zero, -862
                  addi         zero, zero, 0 #init loop 1 limit
main_125_1_t:     rem          t5, a0, s8
                  c.srli       a1, 5
                  addi         s1, s1, 4 #update loop 1 counter
                  addi         s0, zero, 6 #init loop 0 counter
                  addi         s5, a5, -1043
                  addi         t6, zero, 9 #init loop 0 limit
main_125_0_t:     mul          s4, s7, a5
                  mulh         s6, s6, a1
                  addi         s0, s0, 7 #update loop 0 counter
                  ori          t4, t4, 1782
                  srai         a4, a5, 18
                  or           s2, t5, t3
                  blt          s0, t6, main_125_0_t #branch for loop 0
                  c.sub        a3, a5
                  c.bnez       s1, main_125_1_t #branch for loop 1
                  c.add        s6, a4
                  la           s6, region_0+595 #start load_store_instr_stream_0
                  la           s0, region_0+987 #start load_store_instr_stream_2
                  sh           s11, 163(s0)
                  la           s1, region_0+1134 #start load_store_instr_stream_3
                  lbu          s11, 792(s0)
                  la           s10, region_0+596 #start load_store_instr_stream_1
                  lbu          t5, -300(s0)
                  lh           a2, -11(s6)
                  lb           gp, -772(s0)
                  lbu          a4, -3(s10)
                  lb           t4, 100(s0)
                  sh           s4, 14(s10)
                  lb           s11, -202(s0)
                  lbu          zero, -47(s1)
                  sb           a3, -2(s6)
                  sb           s6, 2(s10)
                  sb           a3, 728(s0)
                  lbu          a4, 3(s6)
                  lbu          t5, -302(s0)
                  lb           a0, 2(s6)
                  sb           ra, -48(s1)
                  lbu          s5, -874(s0)
                  lb           s4, 2(s6)
                  lh           a6, 6(s10)
                  sb           t6, 4(s6)
                  sh           s2, -12(s10) #end load_store_instr_stream_1
                  sb           s10, -61(s1)
                  lb           t4, -622(s0) #end load_store_instr_stream_2
                  lb           a3, -44(s1)
                  sb           t6, -26(s1)
                  lb           a6, 44(s1) #end load_store_instr_stream_3
                  sb           t3, 8(s6)
                  lhu          t2, -5(s6) #end load_store_instr_stream_0
                  la           s1, region_1+481 #start load_store_instr_stream_2
                  la           t1, region_1+95 #start load_store_instr_stream_4
                  la           s0, region_1+322 #start load_store_instr_stream_3
                  sb           s2, -11(s1)
                  la           s4, region_1+1892 #start load_store_instr_stream_0
                  sb           tp, -211(s0)
                  lw           zero, -5(s1)
                  lhu          a2, 1477(t1)
                  sb           a1, 14(s0)
                  sb           a4, -51(s4)
                  sh           a4, 0(s0)
                  la           s9, region_1+1873 #start load_store_instr_stream_1
                  lh           s10, -43(t1)
                  sw           s6, 118(s0)
                  sb           s2, 298(t1)
                  lb           t5, -12(s4)
                  sb           a7, 1(s1)
                  lh           t3, -234(s0)
                  lb           sp, 1053(t1)
                  sh           tp, -45(s9)
                  sb           s3, 1045(t1)
                  sb           sp, -11(s9)
                  lb           a2, 6(s1)
                  sw           t0, 4(s4)
                  lh           a2, 18(s4)
                  lbu          a2, -232(s0)
                  lbu          t4, -172(s9)
                  sh           t2, 11(s1)
                  lh           a3, -39(s9)
                  lbu          t3, 23(s4)
                  sb           t2, 16(s1)
                  lbu          gp, -127(s0)
                  sb           a0, 641(t1)
                  sb           s7, -116(s9)
                  lh           a4, -235(s9)
                  sb           a6, -3(s1)
                  sh           a3, -144(s0)
                  sb           a5, 10(s1)
                  lhu          ra, 58(s4)
                  sw           a4, -52(s4)
                  sb           a3, -163(s9)
                  lhu          gp, -64(s4)
                  sb           t1, -37(s0)
                  lbu          a6, 76(t1) #end load_store_instr_stream_4
                  sb           t5, -64(s0) #end load_store_instr_stream_3
                  lh           gp, -239(s9)
                  lb           t0, -4(s1)
                  sb           a1, 20(s9) #end load_store_instr_stream_1
                  lw           zero, -1(s1) #end load_store_instr_stream_2
                  sh           t0, -28(s4) #end load_store_instr_stream_0
                  la           sp, region_1+1425 #start riscv_load_store_rand_instr_stream_9
                  c.slli       s10, 14
                  c.lui        t4, 24
                  slti         t1, a6, 1493
                  lbu          s6, -24(sp)
                  xori         s3, s2, -618
                  lb           s4, -64(sp)
                  sh           s4, 13(sp)
                  sra          s10, s0, s6
                  sub          t1, s1, s9
                  srai         s5, a0, 7
                  lui          a2, 498292
                  add          t2, s6, s0
                  rem          s5, a0, s6
                  lb           s4, -52(sp)
                  c.add        a1, a4
                  c.addi       a0, 28
                  lb           a6, -45(sp)
                  mul          a0, a1, a2
                  ori          s11, s7, 401
                  sb           t2, -40(sp)
                  sb           t1, -49(sp)
                  sll          t3, s3, a7
                  sh           a0, -55(sp)
                  sh           t0, 43(sp)
                  lh           t0, 53(sp)
                  lh           a4, 11(sp)
                  lb           s4, 30(sp) #end riscv_load_store_rand_instr_stream_9
                  la           s4, region_1+513 #start load_store_instr_stream_0
                  la           t5, region_1+850 #start load_store_instr_stream_4
                  la           t1, region_1+1398 #start load_store_instr_stream_3
                  lh           a0, -14(t1)
                  lb           tp, 245(t5)
                  la           a2, region_1+596 #start load_store_instr_stream_2
                  la           s3, region_1+1803 #start load_store_instr_stream_1
                  lbu          a3, -171(s4)
                  sw           gp, -1047(s3)
                  lbu          gp, -447(s3)
                  lbu          a0, 142(s4)
                  sb           s6, 15(t1)
                  lbu          ra, -14(a2)
                  lb           t0, -1182(s3)
                  lbu          t4, -1251(s3)
                  lb           t2, 192(t5)
                  lbu          s8, -1(t1)
                  lbu          t6, 653(t5)
                  sw           s4, 10(t1)
                  lb           a6, 174(s4)
                  lbu          t3, -1501(s3)
                  lb           zero, 98(t5)
                  lbu          s2, -1326(s3)
                  sb           t3, 307(t5)
                  sb           t5, -73(s4)
                  sh           t5, -57(s4)
                  lb           s2, 190(s4)
                  sh           sp, -712(t5)
                  lh           a3, 14(a2)
                  lb           s2, 1(a2)
                  lbu          s2, 133(t5)
                  lb           t6, 18(s4)
                  lb           t2, 16(a2)
                  lb           a4, -14(a2) #end load_store_instr_stream_2
                  lbu          s0, 821(t5)
                  sw           t1, -1395(s3)
                  sb           s6, 25(t5)
                  lbu          t3, 1000(t5) #end load_store_instr_stream_4
                  sb           t0, 212(s4)
                  lbu          gp, -6(t1)
                  lw           sp, -2(t1) #end load_store_instr_stream_3
                  lbu          zero, -370(s3) #end load_store_instr_stream_1
                  lh           tp, -243(s4) #end load_store_instr_stream_0
                  la           s3, region_0+1210 #start load_store_instr_stream_2
                  lb           s10, -45(s3)
                  la           s9, region_0+1619 #start load_store_instr_stream_1
                  lh           t4, 11(s9)
                  la           s5, region_0+1789 #start load_store_instr_stream_3
                  sb           s9, 10(s5)
                  lhu          sp, 15(s9)
                  lb           s0, -58(s3)
                  lbu          t6, 16(s9)
                  lh           t5, 13(s5)
                  la           s4, region_0+1526 #start load_store_instr_stream_0
                  lhu          a4, -7(s9)
                  lb           a6, 14(s3)
                  sb           s5, -4(s5)
                  lbu          a2, 0(s4)
                  sb           s0, 53(s4)
                  lb           zero, 1(s9)
                  lbu          t1, 21(s4)
                  lbu          t6, -45(s4)
                  lhu          t5, -54(s4)
                  sb           a2, 16(s9)
                  lbu          t3, -4(s5)
                  lb           s6, -38(s3)
                  lb           t1, 53(s4)
                  sh           gp, 42(s4)
                  lb           zero, 11(s3)
                  lbu          a2, -10(s5)
                  sb           a2, 0(s9)
                  lb           a2, 52(s4)
                  sb           s4, 54(s3)
                  sb           s7, -16(s5)
                  sh           a6, 11(s9) #end load_store_instr_stream_1
                  lw           t2, 34(s3) #end load_store_instr_stream_2
                  lb           ra, 1(s5) #end load_store_instr_stream_3
                  lhu          t6, 62(s4) #end load_store_instr_stream_0
                  la           sp, region_0+625 #start riscv_load_store_hazard_instr_stream_10
                  lb           a1, 361(sp)
                  c.slli       s6, 8
                  lh           a2, 361(sp)
                  sh           s2, 361(sp)
                  lui          zero, 653026
                  lhu          s0, 361(sp)
                  lhu          t4, 361(sp)
                  lhu          a3, 361(sp)
                  lbu          s6, 361(sp)
                  sb           a2, 361(sp)
                  lhu          s10, 361(sp)
                  lhu          s9, 361(sp)
                  sb           a6, 361(sp)
                  lhu          a2, 361(sp)
                  sb           a1, -432(sp)
                  lb           s11, -432(sp)
                  lhu          s2, 899(sp)
                  sw           a3, 899(sp)
                  c.or         s1, s1
                  sw           tp, 899(sp)
                  div          s9, t2, sp
                  lb           s5, 899(sp)
                  lhu          s1, 899(sp)
                  lhu          s6, 899(sp) #end riscv_load_store_hazard_instr_stream_10
                  la           a3, region_0+962 #start load_store_instr_stream_1
                  la           t4, region_1+1491 #start load_store_instr_stream_0
                  sb           a3, -6(t4)
                  lhu          tp, 38(a3)
                  lb           s6, 0(a3)
                  lbu          s1, -15(a3)
                  lbu          a1, -8(t4)
                  lw           ra, -254(a3)
                  lbu          t2, 184(a3)
                  lh           s1, -236(a3)
                  lb           s1, -2(t4)
                  lb           s11, -86(a3)
                  lhu          s5, -9(t4)
                  lb           s8, -160(a3)
                  sb           s0, -15(t4)
                  lb           s4, 129(a3)
                  lbu          a0, -165(a3) #end load_store_instr_stream_1
                  lbu          ra, -16(t4) #end load_store_instr_stream_0
                  la           sp, region_0+146 #start riscv_load_store_hazard_instr_stream_24
                  lb           a1, 1604(sp)
                  lhu          s11, 1604(sp)
                  sh           a3, 1604(sp)
                  lb           s1, 1604(sp)
                  sh           s8, 1604(sp)
                  lb           a4, 1604(sp)
                  lb           t6, 1604(sp)
                  sb           s5, 1604(sp)
                  lb           t0, 1604(sp)
                  xor          gp, zero, t6
                  lb           s2, 1604(sp)
                  lb           s4, 1604(sp)
                  lhu          a2, 1604(sp)
                  lhu          t0, 1604(sp)
                  lh           s1, 1604(sp) #end riscv_load_store_hazard_instr_stream_24
                  la           s9, amo_0+48 #start riscv_amo_instr_stream_2
                  amoxor.w      a4, ra, (s9)
                  amomaxu.w.rl  t1, s3, (s9) #end riscv_amo_instr_stream_2
                  la           t6, amo_0+4 #start riscv_amo_instr_stream_7
                  la           t5, amo_0+44
                  la           s3, amo_0+4
                  add          ra, a7, t3
                  amoand.w.rl   a6, t6, (t6)
                  amominu.w.aq  a1, s3, (t6)
                  rem          a3, s7, t2
                  amominu.w     a2, t3, (s3) #end riscv_amo_instr_stream_7
                  la           s6, amo_0+0 #start riscv_amo_instr_stream_0
                  la           a6, amo_0+24
                  slli         s0, s8, 8
                  amomaxu.w.aq  a3, t5, (a6)
                  amoand.w.aq   ra, a6, (s6)
                  amomax.w.aq   s0, s5, (s6)
                  amomax.w.rl   t5, t1, (a6) #end riscv_amo_instr_stream_0
                  la           sp, region_0+846 #start riscv_load_store_hazard_instr_stream_0
                  lbu          a0, 451(sp)
                  c.mv         ra, a2
                  remu         s6, s8, t6
                  sh           a2, -104(sp)
                  sh           a0, -94(sp)
                  lb           t0, -396(sp)
                  sb           a4, -541(sp)
                  sh           s1, 362(sp)
                  sb           sp, 781(sp)
                  lb           t0, 231(sp)
                  sll          a2, ra, sp
                  c.and        a2, s1
                  srli         tp, t5, 2
                  lbu          ra, 557(sp)
                  c.add        s2, a4
                  sb           s10, 467(sp)
                  lbu          a1, -155(sp)
                  lbu          s0, -155(sp)
                  lb           a4, 117(sp)
                  lbu          s3, 117(sp)
                  lb           a2, 511(sp)
                  sb           t3, 511(sp) #end riscv_load_store_hazard_instr_stream_0
                  addi         s5, zero, 6 #init loop 1 counter
                  sll          t2, s4, a2
                  c.sub        s0, a2
                  c.addi16sp   sp, 336
                  addi         a1, zero, 6 #init loop 1 limit
main_135_1_t:     c.mv         a3, s11
                  slli         s4, sp, 21
                  addi         s5, s5, -1 #update loop 1 counter
                  addi         tp, zero, 10 #init loop 0 counter
                  addi         t6, zero, 10 #init loop 0 limit
main_135_0_t:     c.sub        a0, a4
                  auipc        zero, 102992
                  c.xor        a4, a2
                  addi         tp, tp, -9 #update loop 0 counter
                  divu         s10, a0, a0
                  remu         a4, s4, a6
                  slt          a0, s11, t4
                  slt          a2, s4, a4
                  c.sub        s1, a0
                  bgeu         tp, t6, main_135_0_t #branch for loop 0
                  c.sub        a0, s0
                  c.lui        s8, 28
                  c.and        s1, a4
                  bgeu         s5, a1, main_135_1_t #branch for loop 1
                  remu         s1, a0, t0
                  la           s8, region_1+9 #start riscv_hazard_instr_stream_12
                  xor          sp, ra, s4
                  lbu          sp, -8(s8)
                  divu         a0, s4, ra
                  lb           ra, 49(s8)
                  c.add        ra, a0
                  slli         ra, sp, 2
                  c.or         a0, a0
                  srai         sp, ra, 9
                  lh           sp, 53(s8)
                  sub          a0, sp, t2
                  c.mv         t2, sp
                  sh           s11, 57(s8)
                  lb           sp, 26(s8)
                  and          s4, ra, ra
                  lbu          s11, 41(s8)
                  lb           s4, 20(s8)
                  lb           s4, 28(s8)
                  lb           s11, 34(s8)
                  slti         s4, s4, -2044
                  srl          t2, a0, s4
                  mul          t2, a0, a0
                  slli         ra, t2, 23
                  slt          a0, ra, a0
                  xor          s11, s4, a0
                  slli         t2, sp, 11
                  srai         t2, s4, 10
                  mul          s11, t2, sp
                  slt          t2, sp, s11
                  mulhu        s11, sp, s4
                  c.add        t2, s11
                  mulh         s4, s11, s4
                  c.srai       a0, 2
                  mulhu        ra, s11, a0
                  c.slli       a0, 10
                  sub          sp, a0, s11
                  lh           s4, 1(s8)
                  c.slli       ra, 10
                  addi         t2, sp, 1346
                  sb           t2, 4(s8)
                  lb           a0, 29(s8)
                  lbu          s11, 16(s8)
                  lb           s4, 10(s8) #end riscv_hazard_instr_stream_12
                  la           t2, amo_0+20 #start riscv_amo_instr_stream_17
                  amominu.w     a4, s1, (t2) #end riscv_amo_instr_stream_17
                  la           a6, region_0+743 #start load_store_instr_stream_4
                  la           a3, region_0+588 #start load_store_instr_stream_3
                  la           t2, region_0+266 #start load_store_instr_stream_1
                  lbu          t1, -46(a6)
                  la           a2, region_0+1655 #start load_store_instr_stream_2
                  lh           a1, 55(a2)
                  sb           zero, 51(t2)
                  lb           a4, 5(a2)
                  la           s1, region_0+1210 #start load_store_instr_stream_0
                  lbu          sp, 26(a2)
                  lbu          s8, 131(a6)
                  lb           zero, 0(a3)
                  lw           tp, 121(a6)
                  sw           s10, -54(t2)
                  lbu          a4, -104(a6)
                  lb           s2, 11(a3)
                  lbu          s10, 60(a2)
                  sh           gp, 145(a6)
                  lhu          t6, -4(s1)
                  sb           a6, 24(s1)
                  sb           s0, 60(a2) #end load_store_instr_stream_2
                  sb           t3, 35(t2)
                  lb           s5, -3(a3)
                  lbu          s9, 14(t2)
                  lh           s3, 10(s1)
                  lb           t6, 54(t2)
                  lb           s5, -36(t2)
                  lw           s2, -131(a6)
                  lb           gp, 52(s1)
                  lb           s8, -209(a6)
                  c.lw         a0, 8(a3)
                  sh           a2, -4(a3) #end load_store_instr_stream_3
                  lhu          s6, -46(s1)
                  lbu          a1, 54(a6)
                  sb           s5, -33(a6)
                  lbu          t4, -35(t2)
                  sb           zero, -53(s1)
                  sb           tp, 206(a6) #end load_store_instr_stream_4
                  lb           tp, -25(t2) #end load_store_instr_stream_1
                  sb           s5, -3(s1) #end load_store_instr_stream_0
                  la           sp, region_1+1310 #start riscv_hazard_instr_stream_6
                  xori         t5, a0, -892
                  lh           a0, -50(sp)
                  c.andi       a1, 15
                  lb           s11, -50(sp)
                  lb           tp, -57(sp)
                  lw           s5, -6(sp)
                  sb           t5, 23(sp)
                  c.lui        tp, 28
                  c.add        t5, tp
                  lh           t5, -8(sp)
                  rem          s11, a0, tp
                  slli         a1, t5, 5
                  xor          a1, t5, s5
                  sw           t5, -46(sp)
                  rem          s5, a0, s5
                  divu         a0, s11, s5
                  xori         s11, s11, 1110
                  nop
                  c.and        a1, a1
                  lhu          tp, -36(sp)
                  lh           t5, 58(sp)
                  c.sub        a1, a0
                  slli         tp, a0, 12
                  sb           t5, -30(sp)
                  divu         s11, t5, a0
                  sltiu        t5, s5, 1329
                  lb           tp, -57(sp)
                  sh           s11, -58(sp) #end riscv_hazard_instr_stream_6
                  la           a0, amo_0+20 #start riscv_lr_sc_instr_stream_2
                  sub          t5, a5, s2
                  lr.w          s8, (a0)
                  sc.w.aq       zero, s7, (a0) #end riscv_lr_sc_instr_stream_2
                  la           t0, region_1+1974 #start load_store_instr_stream_1
                  sb           s7, -11(t0)
                  la           s9, region_0+182 #start load_store_instr_stream_0
                  sb           t0, 15(t0)
                  lhu          s6, -160(s9)
                  lbu          t5, -7(t0)
                  lbu          a6, 1(t0)
                  lb           sp, -163(s9)
                  lh           sp, 40(s9)
                  lhu          a0, 4(t0)
                  sb           a5, 219(s9)
                  sw           tp, 2(t0)
                  sb           a0, 131(s9)
                  sb           a0, -7(t0) #end load_store_instr_stream_1
                  lb           gp, -43(s9)
                  lbu          s3, 205(s9) #end load_store_instr_stream_0
                  la           ra, region_1+1685 #start riscv_load_store_hazard_instr_stream_17
                  lb           tp, -2(ra)
                  lbu          gp, -2(ra)
                  lb           s2, 2(ra)
                  sb           t0, -8(ra)
                  lw           a6, 15(ra)
                  lw           s3, 15(ra)
                  lw           t3, 15(ra)
                  sw           zero, 15(ra)
                  sh           s2, 15(ra)
                  lhu          s10, 15(ra)
                  lb           s11, -2(ra)
                  sh           gp, -11(ra)
                  sb           t0, -5(ra)
                  sll          a3, a3, t2
                  sb           s10, -5(ra)
                  lbu          s0, 8(ra)
                  sb           s9, 8(ra)
                  lb           s3, -15(ra) #end riscv_load_store_hazard_instr_stream_17
                  la           a2, region_0+1883 #start riscv_load_store_rand_instr_stream_5
                  c.mv         s9, a1
                  c.or         a0, a3
                  lui          a3, 541257
                  sltu         s4, t1, t2
                  auipc        s8, 732138
                  lhu          a4, -35(a2)
                  sb           s1, 43(a2)
                  c.addi4spn   a3, sp, 400
                  auipc        a0, 665608
                  sh           t1, 49(a2)
                  c.nop
                  c.xor        a3, a4
                  srl          s4, a5, s3
                  sh           zero, 51(a2)
                  lbu          sp, 39(a2)
                  mulhsu       gp, gp, s7
                  andi         s1, s7, -1439
                  sltu         s6, a4, t0
                  lb           t3, -10(a2)
                  sb           s3, -59(a2)
                  sub          t0, t0, t5
                  lb           s1, 23(a2)
                  nop
                  slli         tp, a1, 7
                  sll          t4, a7, t2
                  lw           s4, -19(a2)
                  and          t1, t3, sp
                  c.and        a0, a0
                  c.li         s5, 19
                  c.addi       s9, 20
                  lb           a6, 62(a2)
                  lhu          a3, 19(a2)
                  sb           a5, -27(a2)
                  lb           a3, 14(a2)
                  lb           a1, -21(a2)
                  c.addi4spn   a4, sp, 96
                  lb           t6, -18(a2)
                  lbu          s11, -32(a2)
                  lbu          s6, -62(a2)
                  nop
                  c.li         a6, -1
                  c.addi16sp   sp, 112
                  srai         s9, s6, 4
                  add          a1, a7, s3
                  lh           t1, -5(a2)
                  c.mv         sp, t5
                  nop
                  sb           s1, -42(a2)
                  sltiu        s10, a6, -767
                  lbu          s11, 36(a2) #end riscv_load_store_rand_instr_stream_5
                  la           gp, region_0+1249 #start riscv_hazard_instr_stream_15
                  remu         a4, s2, s1
                  lh           t5, -43(gp)
                  lw           s1, 51(gp)
                  sb           a4, 48(gp)
                  sh           t5, -25(gp)
                  lb           a0, 31(gp)
                  lbu          t3, -20(gp)
                  lb           a0, -60(gp)
                  sb           s1, 54(gp)
                  sb           a0, 48(gp)
                  sb           s1, -4(gp)
                  srli         s2, s2, 10
                  lb           t5, 48(gp)
                  c.addi       s2, -1
                  sh           a0, -27(gp)
                  c.mv         a4, s1
                  sb           t5, -36(gp)
                  sh           s2, -59(gp)
                  sb           s1, -51(gp)
                  sub          s2, a4, t5
                  sra          s2, a4, a4
                  sb           s1, -10(gp)
                  add          a0, s2, s2
                  lbu          t3, -18(gp)
                  lb           s1, -16(gp)
                  lbu          t3, -47(gp)
                  sb           a4, 21(gp)
                  sub          s2, a4, t3
                  sb           s2, -4(gp)
                  c.nop
                  lb           a4, -15(gp)
                  lb           t5, 5(gp)
                  sub          a4, s1, s1
                  lbu          t5, -52(gp)
                  lbu          a4, 57(gp)
                  sb           a4, -6(gp)
                  sltu         a4, a0, s2
                  lb           a4, -36(gp)
                  sra          t5, a4, s2
                  c.sub        a4, a0
                  sb           a0, -40(gp) #end riscv_hazard_instr_stream_15
                  la           t6, region_1+496 #start load_store_instr_stream_1
                  la           gp, region_1+1247 #start load_store_instr_stream_0
                  la           t5, region_1+1153 #start load_store_instr_stream_2
                  sb           a2, -5(t6)
                  sw           gp, 5(gp)
                  lb           tp, -13(t6)
                  sb           s3, 0(gp)
                  sw           s3, 9(gp)
                  lh           a6, 6(t6)
                  sb           sp, 227(t5)
                  sb           t6, 177(t5)
                  lbu          t4, 6(gp)
                  lhu          s8, -12(t6)
                  lb           t2, -14(gp)
                  sw           t1, -205(t5)
                  lbu          a3, 2(gp)
                  lb           s4, 9(t6)
                  lbu          t0, -45(t5)
                  lhu          a4, -8(t6)
                  lb           s10, -9(t6)
                  lb           s6, 16(gp)
                  sw           t6, 8(t6)
                  sw           s6, -3(gp)
                  sb           s2, -9(t6) #end load_store_instr_stream_1
                  sb           s3, 10(gp)
                  lb           a1, 73(t5) #end load_store_instr_stream_2
                  sh           t1, -5(gp) #end load_store_instr_stream_0
                  addi         gp, zero, 5 #init loop 1 counter
                  c.srai       s0, 29
                  addi         a0, zero, 5 #init loop 1 limit
main_131_1_t:     c.lui        s0, 3
                  addi         gp, gp, -4 #update loop 1 counter
                  addi         s6, zero, -9 #init loop 0 counter
                  c.li         s10, 12
                  addi         t6, zero, -6 #init loop 0 limit
                  remu         t0, t3, a4
                  c.sub        a2, a0
main_131_0_t:     mulhsu       a2, s9, a5
                  srli         s4, a1, 23
                  addi         s6, s6, 6 #update loop 0 counter
                  mulh         t5, zero, t5
                  c.addi4spn   s0, sp, 160
                  blt          s6, t6, main_131_0_t #branch for loop 0
                  auipc        a3, 649261
                  slli         a3, s1, 18
                  bgeu         gp, a0, main_131_1_t #branch for loop 1
                  mulhsu       a6, s2, s9
                  addi         t5, zero, 4 #init loop 1 counter
                  srl          ra, s5, s10
                  auipc        t1, 944999
                  mul          s2, s7, s7
                  or           s2, s6, t0
                  c.and        a3, a3
                  addi         t4, zero, -8 #init loop 1 limit
                  srli         t3, tp, 28
main_136_1_t:     or           s4, s2, t3
                  addi         t5, t5, -6 #update loop 1 counter
                  addi         s1, zero, 10 #init loop 0 counter
                  c.addi       t0, -1
                  srl          sp, s10, s0
                  addi         zero, zero, 0 #init loop 0 limit
                  mulhsu       a1, a3, s8
                  c.sub        a2, a1
                  divu         t3, t3, s8
main_136_0_t:     c.addi       a1, 18
                  slli         a2, a3, 12
                  srl          s4, s8, tp
                  slli         sp, s4, 19
                  addi         s1, s1, -2 #update loop 0 counter
                  sll          s6, s8, ra
                  slt          sp, s2, a6
                  c.bnez       s1, main_136_0_t #branch for loop 0
                  ori          s10, s5, 1627
                  add          a6, s9, gp
                  c.lui        a3, 20
                  c.sub        a4, a0
                  slli         s6, a3, 28
                  beq          t5, t4, main_136_1_t #branch for loop 1
                  mul          t2, t1, zero
                  addi         s8, zero, 10 #init loop 1 counter
                  and          s5, a5, s6
                  addi         s2, zero, 10 #init loop 1 limit
                  c.addi16sp   sp, -16
                  or           a6, s5, ra
                  add          a1, sp, s5
                  nop
main_120_1_t:     c.addi       s9, -1
                  addi         s8, s8, -9 #update loop 1 counter
                  mul          s4, s10, a0
                  c.or         a1, a1
                  auipc        s10, 196281
                  addi         ra, zero, -4 #init loop 0 counter
                  addi         a2, zero, 20 #init loop 0 limit
                  divu         sp, a0, s1
main_120_0_t:     nop
                  mulhsu       a1, s3, t0
                  c.add        s10, s6
                  addi         ra, ra, 6 #update loop 0 counter
                  beq          ra, a2, main_120_0_t #branch for loop 0
                  divu         t4, zero, s6
                  bgeu         s8, s2, main_120_1_t #branch for loop 1
                  lui          s10, 253002
                  addi         s10, zero, 8 #init loop 1 counter
                  and          s5, t1, s0
                  addi         t4, zero, 8 #init loop 1 limit
                  c.xor        a3, s0
main_119_1_t:     or           a1, s3, a1
                  andi         a3, sp, 337
                  addi         s10, s10, -7 #update loop 1 counter
                  addi         t1, zero, 0 #init loop 0 counter
                  c.or         a1, a0
                  addi         t3, zero, 12 #init loop 0 limit
                  mulhu        a3, s3, a2
                  mulhsu       s9, t6, gp
main_119_0_t:     c.nop
                  andi         t2, s9, -1878
                  addi         t1, t1, 5 #update loop 0 counter
                  blt          t1, t3, main_119_0_t #branch for loop 0
                  sll          a6, a5, a1
                  bgeu         s10, t4, main_119_1_t #branch for loop 1
                  c.lui        s4, 27
main_68:          jal          ra, 12f
0:                jal          ra, 2f
1:                c.j          13f
2:                c.j          8f
3:                jal          t1, 11f
4:                c.jal        0b
5:                c.j          10f
6:                jal          ra, 9f
7:                c.j          6b
8:                jal          t1, 1b
9:                jal          ra, 5b
10:               jal          t2, 3b
11:               c.jal        4b
12:               jal          t1, 7b
13:               c.li         s8, 9
                  la           tp, region_1+1731 #start riscv_hazard_instr_stream_1
                  or           a3, a0, t5
                  c.sub        a3, a0
                  c.nop
                  mul          zero, zero, a6
                  xor          t5, a6, zero
                  slli         t5, t5, 22
                  sb           zero, -213(tp)
                  c.slli       a0, 6
                  sh           s5, 215(tp)
                  remu         s5, a6, a3
                  c.add        a6, t5
                  slt          a6, a3, a3
                  c.andi       a0, 31
                  andi         t5, zero, -1226
                  nop
                  lbu          t5, -77(tp)
                  lb           a0, -247(tp)
                  addi         a3, a6, -9
                  sltu         a6, s5, t5
                  c.srai       a3, 11
                  nop
                  sra          t5, zero, a3
                  lb           t5, -150(tp)
                  c.mv         a0, s5
                  auipc        t5, 843031
                  lbu          zero, 183(tp)
                  lb           zero, -85(tp)
                  mulh         a0, s5, zero
                  c.add        s5, a6
                  add          a0, zero, t5
                  lbu          a3, -224(tp)
                  slt          a3, a0, a6
                  xori         a0, zero, 1184
                  c.sub        a0, a0
                  div          a6, a0, a0
                  lbu          t5, 244(tp)
                  remu         zero, a3, t5
                  remu         zero, a0, zero
                  lh           a6, 223(tp) #end riscv_hazard_instr_stream_1
                  la           sp, region_0+1893 #start riscv_load_store_rand_instr_stream_22
                  lb           ra, 47(sp)
                  lui          a1, 917921
                  slti         a1, s1, 1732
                  lb           s8, 9(sp)
                  mulhsu       t2, gp, t4
                  c.li         t0, 5
                  c.sub        s1, a1
                  lhu          a6, -33(sp)
                  sra          t5, t4, s10
                  and          t1, a0, zero
                  lb           t0, -14(sp)
                  c.nop
                  sub          a4, a7, a6
                  c.andi       s1, 25
                  c.lui        t2, 18
                  xori         s4, s5, -406
                  slli         s11, s9, 0
                  mulh         s8, t6, s8
                  c.srai       a0, 9
                  slli         s6, s11, 27
                  sltu         a4, zero, s11
                  lbu          t6, -22(sp)
                  mulhu        ra, a3, s0
                  srai         s2, s11, 22
                  c.srai       a2, 18
                  slt          gp, s1, a6
                  mul          s0, s6, sp
                  lbu          s10, 23(sp)
                  sb           s6, 43(sp)
                  lhu          t4, 35(sp)
                  lbu          a1, 27(sp)
                  c.slli       a3, 4
                  lbu          a4, 4(sp)
                  mulh         s0, s2, sp
                  lbu          zero, 61(sp)
                  ori          a0, gp, 1440
                  sb           a5, -30(sp)
                  auipc        s11, 617436
                  c.andi       s0, -1
                  c.srai       s1, 30
                  lw           s9, -53(sp) #end riscv_load_store_rand_instr_stream_22
                  la           s4, region_0+400 #start riscv_load_store_hazard_instr_stream_8
                  mulhsu       s2, s5, sp
                  lb           s10, -9(s4)
                  lb           a2, -9(s4)
                  lb           s9, -9(s4)
                  sll          sp, zero, ra
                  lb           s9, -9(s4)
                  lb           s8, -9(s4)
                  c.addi16sp   sp, 480
                  lbu          a6, -9(s4)
                  lui          t0, 891127
                  lb           a2, -9(s4)
                  lbu          s9, -9(s4)
                  auipc        a3, 508657
                  sb           s9, -9(s4)
                  lbu          a3, -9(s4)
                  c.mv         tp, s10
                  c.nop
                  lb           s0, -14(s4)
                  lb           t5, -14(s4)
                  lh           ra, -14(s4)
                  sh           a1, -14(s4)
                  lh           sp, -14(s4)
                  lb           sp, -14(s4)
                  lbu          s6, -14(s4) #end riscv_load_store_hazard_instr_stream_8
                  la           a2, amo_0+0 #start riscv_amo_instr_stream_13
                  la           s2, amo_0+40
                  la           tp, amo_0+32
                  amoand.w      t4, t3, (tp)
                  ori          a1, s6, -1743
                  amomax.w      a0, s7, (tp)
                  amominu.w.aq  a0, gp, (a2)
                  c.nop
                  amomaxu.w     sp, zero, (a2)
                  amoand.w      s11, a4, (s2) #end riscv_amo_instr_stream_13
                  la           s10, amo_0+60 #start riscv_lr_sc_instr_stream_10
                  div          t4, a2, a3
                  andi         s1, a7, -57
                  c.andi       a3, 0
                  andi         a0, t4, 929
                  div          t2, t3, s6
                  lr.w.aq       s0, (s10)
                  slli         a6, zero, 28
                  slt          t2, t5, s9
                  sc.w.rl       s9, s0, (s10) #end riscv_lr_sc_instr_stream_10
                  la           ra, region_1+1258 #start riscv_load_store_rand_instr_stream_10
                  mulhsu       gp, s7, a1
                  c.li         t6, -1
                  lbu          sp, 28(ra)
                  srl          s6, s3, s4
                  slli         a4, t3, 6
                  lb           s9, 224(ra)
                  sb           t5, -135(ra)
                  slt          t3, t4, s7
                  sh           ra, 52(ra)
                  c.sub        a2, s0
                  add          s1, s8, a6
                  c.srai       s1, 3
                  div          s3, a6, a2
                  lb           a1, 61(ra)
                  c.or         a2, a1
                  lbu          s8, 75(ra)
                  lui          a3, 535630
                  sb           a3, 214(ra)
                  lb           a2, -88(ra)
                  sh           s11, 234(ra)
                  lhu          gp, 124(ra)
                  lb           s6, -177(ra)
                  addi         t0, s3, -998
                  c.add        s10, s5
                  lbu          a4, -87(ra)
                  sb           t1, -243(ra)
                  lhu          s10, 192(ra)
                  sb           s2, 245(ra)
                  c.lui        s11, 13
                  lbu          a2, -129(ra)
                  sb           s5, 15(ra)
                  sb           s7, -81(ra)
                  c.addi16sp   sp, 320
                  lbu          s8, 107(ra)
                  divu         gp, a1, t3
                  lhu          s9, -32(ra)
                  lhu          s4, 196(ra) #end riscv_load_store_rand_instr_stream_10
                  la           a2, region_1+915 #start load_store_instr_stream_0
                  lhu          s4, 469(a2)
                  la           s0, region_1+475 #start load_store_instr_stream_1
                  lb           t6, 238(s0)
                  la           a0, region_1+1275 #start load_store_instr_stream_2
                  sb           s8, -128(s0)
                  lhu          zero, 441(a0)
                  lbu          gp, -439(a0)
                  lhu          a3, 25(s0)
                  lhu          t3, -207(a2)
                  sb           s6, -144(a2)
                  lbu          a6, 217(s0)
                  sb           t2, -912(a2)
                  sh           zero, -27(a0)
                  lbu          gp, 164(s0)
                  lbu          t5, -1169(a0)
                  lbu          s6, -654(a2)
                  sb           a0, 164(s0)
                  lbu          s2, -91(a2)
                  lw           t5, -79(s0)
                  sb           zero, 666(a0)
                  lb           s3, 90(s0)
                  lb           a6, 902(a2)
                  lh           t6, -71(s0)
                  lbu          a3, -75(a0) #end load_store_instr_stream_2
                  sb           t6, -218(s0) #end load_store_instr_stream_1
                  lbu          t2, 292(a2)
                  sb           t0, 526(a2) #end load_store_instr_stream_0
                  la           s9, region_1+1109 #start load_store_instr_stream_1
                  la           t0, region_1+827 #start load_store_instr_stream_0
                  sh           s5, 553(s9)
                  lhu          ra, -31(t0)
                  lw           sp, 679(s9)
                  lh           tp, 165(s9)
                  lbu          s11, 58(t0)
                  sb           t1, 149(s9)
                  sb           t2, 294(s9)
                  lbu          a4, 20(t0)
                  sw           t3, 287(s9)
                  lbu          s8, 370(s9)
                  sb           a5, 38(t0)
                  sb           zero, 125(s9)
                  sb           s11, -223(s9)
                  lbu          s11, -394(s9) #end load_store_instr_stream_1
                  lb           s4, -8(t0) #end load_store_instr_stream_0
                  la           sp, region_0+1992 #start riscv_load_store_hazard_instr_stream_18
                  lb           a0, -191(sp)
                  sb           a3, -191(sp)
                  slti         s4, s0, 1220
                  xor          ra, t3, sp
                  lb           zero, -191(sp)
                  lbu          t6, -191(sp)
                  add          s5, s11, t1
                  lbu          t6, -191(sp)
                  sb           a7, -191(sp)
                  addi         a0, s2, -95
                  lb           a2, -191(sp)
                  c.srli       a2, 20
                  lbu          tp, -191(sp)
                  lb           gp, -191(sp)
                  srli         t6, s5, 29
                  lb           a6, -191(sp)
                  lbu          t2, -191(sp)
                  lb           s1, -191(sp)
                  sb           a2, -191(sp)
                  lb           t2, -191(sp)
                  lbu          ra, -191(sp)
                  ori          t6, a1, 447
                  lbu          s4, -191(sp) #end riscv_load_store_hazard_instr_stream_18
                  la           s8, region_0+334 #start load_store_instr_stream_1
                  la           t4, region_1+1237 #start load_store_instr_stream_0
                  lb           a3, -129(s8)
                  lhu          s3, -215(t4)
                  sb           s5, -82(t4)
                  lh           a4, 106(s8)
                  lbu          s5, 14(t4)
                  sb           s7, -203(s8)
                  lb           s3, 42(t4)
                  lbu          a4, 158(t4)
                  lbu          s6, 94(t4)
                  lb           s3, -89(s8)
                  lb           ra, -192(s8)
                  lbu          s3, 233(s8) #end load_store_instr_stream_1
                  lbu          tp, -64(t4) #end load_store_instr_stream_0
                  la           s9, region_0+1723 #start riscv_hazard_instr_stream_9
                  ori          a2, tp, 1190
                  c.srli       a2, 18
                  lbu          a6, -169(s9)
                  sb           a2, -1024(s9)
                  sh           tp, 191(s9)
                  lbu          tp, -1088(s9)
                  lbu          tp, -1428(s9)
                  xori         s10, a2, -1857
                  sb           a2, -41(s9)
                  sub          t0, tp, t0
                  c.xor        a2, a2
                  c.lui        a6, 31
                  slti         s5, t0, -1825
                  sh           s10, 123(s9)
                  lb           tp, -186(s9)
                  sll          t0, tp, s10
                  slti         t0, s5, 958
                  srl          a2, a6, a2
                  sb           tp, -201(s9)
                  rem          a2, tp, t0
                  c.slli       a6, 17
                  sb           s10, -520(s9)
                  auipc        a6, 531196
                  sb           a6, -1528(s9)
                  lh           tp, -405(s9)
                  c.srai       a2, 28
                  c.li         a6, 11
                  sb           tp, -1002(s9)
                  lbu          a6, -746(s9)
                  lh           s5, -1643(s9)
                  sll          s10, tp, a2
                  c.mv         tp, s10
                  lbu          s10, -869(s9)
                  and          t0, tp, s5
                  divu         s5, s10, t0
                  mulhsu       s5, s10, tp
                  andi         t0, a6, 114
                  c.nop
                  lb           s10, -853(s9)
                  c.lui        s5, 2
                  sh           a6, -1661(s9)
                  addi         s5, s5, 389
                  add          t0, t0, t0
                  sra          s10, a6, a2
                  lhu          s10, -1033(s9)
                  c.li         s5, 4
                  sb           a6, -952(s9)
                  rem          s5, a6, tp
                  slt          s10, tp, tp
                  lbu          t0, -984(s9)
                  lbu          a2, 29(s9) #end riscv_hazard_instr_stream_9
                  la           sp, region_0+134 #start riscv_load_store_hazard_instr_stream_20
                  c.add        a4, tp
                  c.and        a3, s1
                  sh           s3, 614(sp)
                  sw           a1, 614(sp)
                  sb           a0, 614(sp)
                  lbu          s11, 1157(sp)
                  lbu          s8, 1407(sp)
                  lh           s11, 808(sp)
                  lh           t5, 1346(sp)
                  lhu          t4, 1346(sp)
                  lhu          tp, 1346(sp)
                  sh           s1, 1346(sp)
                  mulhsu       zero, a2, sp
                  sw           s8, 1346(sp)
                  sb           sp, 1346(sp)
                  lw           gp, 1346(sp)
                  sw           s9, 1346(sp)
                  sh           t0, 1346(sp)
                  lb           s1, 1346(sp)
                  sb           a2, 1346(sp) #end riscv_load_store_hazard_instr_stream_20
                  la           t4, amo_0+12 #start riscv_lr_sc_instr_stream_16
                  sltiu        s6, s3, -907
                  lr.w          s6, (t4)
                  sc.w.aq       t1, s0, (t4) #end riscv_lr_sc_instr_stream_16
                  la           a1, region_1+71 #start riscv_load_store_rand_instr_stream_20
                  lui          s0, 1021691
                  lb           s3, 16(a1)
                  and          a3, s0, s7
                  auipc        a3, 552921
                  slti         sp, s10, -183
                  remu         t2, s0, s4
                  sb           a5, -48(a1)
                  mulhu        s3, s0, a1
                  sw           t0, -39(a1)
                  c.xor        s1, a1
                  and          t1, zero, s7
                  lb           s10, 8(a1)
                  lbu          s1, -58(a1)
                  sltiu        s10, t2, 1444
                  srli         s3, s2, 3
                  srli         t1, zero, 28
                  xor          s10, a5, a7
                  lb           a2, -44(a1)
                  lb           t5, 57(a1)
                  sb           s9, -54(a1)
                  c.addi16sp   sp, -16
                  or           s5, a0, t0
                  srl          zero, s7, zero
                  and          t3, s8, s4
                  lh           ra, -19(a1)
                  lb           s2, -1(a1)
                  mulh         t4, sp, s7
                  c.li         s0, -1
                  c.add        t5, t3
                  lbu          a0, -6(a1)
                  c.srli       a3, 13
                  sub          ra, t4, t2
                  lbu          s8, -62(a1)
                  nop
                  sb           a4, 47(a1)
                  ori          ra, s1, 350
                  divu         tp, ra, s1
                  c.srli       a2, 8
                  sb           a1, 21(a1)
                  lhu          sp, -9(a1)
                  lb           t4, -30(a1)
                  sb           a6, 58(a1) #end riscv_load_store_rand_instr_stream_20
                  la           s1, region_0+579 #start riscv_load_store_hazard_instr_stream_4
                  lbu          a6, 11(s1)
                  lhu          ra, 11(s1)
                  lb           ra, 11(s1)
                  lb           s2, 11(s1)
                  sb           t6, 1(s1)
                  slt          sp, s11, a3
                  lhu          a4, -7(s1)
                  lw           a1, -7(s1)
                  lb           s2, -8(s1)
                  lh           gp, 15(s1)
                  lhu          s9, 15(s1)
                  xori         a1, s11, 48
                  lw           ra, -15(s1)
                  sw           s11, -15(s1)
                  sb           zero, 16(s1)
                  c.srli       a1, 18
                  andi         s10, a0, 540
                  lw           s2, 1(s1)
                  lh           t1, 1(s1)
                  lh           s9, 1(s1)
                  sh           t6, 1(s1)
                  lw           t6, 1(s1) #end riscv_load_store_hazard_instr_stream_4
                  la           sp, region_1+1832 #start riscv_load_store_hazard_instr_stream_16
                  lb           gp, -141(sp)
                  lb           tp, -141(sp)
                  andi         zero, t5, 1247
                  c.srli       a0, 22
                  sb           gp, -141(sp)
                  lb           s4, -141(sp)
                  lb           s9, -141(sp)
                  lbu          t1, -141(sp)
                  addi         t2, tp, -35
                  lb           s10, -141(sp)
                  lw           s5, -188(sp)
                  slli         s3, zero, 29
                  mul          s11, t6, t6
                  lhu          t2, -166(sp)
                  and          t6, gp, t4
                  lhu          a4, -166(sp)
                  lb           a0, -135(sp)
                  auipc        a0, 1041897
                  lb           s8, -161(sp)
                  c.lwsp       a6, 44(sp) #end riscv_load_store_hazard_instr_stream_16
main_65:          jal          ra, 2f
0:                c.jal        3f
1:                c.j          10f
2:                c.jal        5f
3:                jal          ra, 15f
4:                c.j          19f
5:                c.j          17f
6:                c.jal        9f
7:                c.j          4b
8:                c.jal        14f
9:                c.j          12f
10:               c.jal        7b
11:               jal          ra, 1b
12:               c.jal        13f
13:               jal          ra, 21f
14:               c.j          22f
15:               c.j          16f
16:               c.j          18f
17:               c.j          6b
18:               jal          t1, 11b
19:               jal          ra, 20f
20:               jal          ra, 8b
21:               c.j          0b
22:               c.jal        23f
23:               c.andi       s1, -1
                  addi         t2, zero, -5 #init loop 1 counter
                  srl          s2, s2, s2
                  sltiu        ra, sp, -1190
                  mulhsu       tp, t3, s6
                  sltu         a2, t3, t5
                  addi         t0, zero, -9 #init loop 1 limit
main_129_1_t:     div          t5, s2, a4
                  addi         t2, t2, -4 #update loop 1 counter
                  c.nop
                  c.mv         gp, tp
                  or           s2, tp, t6
                  mulhsu       s6, s8, zero
                  addi         a3, zero, -6 #init loop 0 counter
                  sll          s2, s6, s6
                  c.lui        s3, 26
                  slti         s10, a7, 223
                  xori         ra, a5, 264
                  addi         a1, zero, 16 #init loop 0 limit
                  srai         zero, t5, 1
main_129_0_t:     mulhu        t6, a7, a3
                  addi         a3, a3, 5 #update loop 0 counter
                  addi         a4, s9, 626
                  xori         s8, t2, -1171
                  blt          a3, a1, main_129_0_t #branch for loop 0
                  c.sub        s0, a1
                  sra          s8, s1, ra
                  and          t5, s9, ra
                  xor          a4, t6, s7
                  xor          a0, t5, a5
                  bne          t2, t0, main_129_1_t #branch for loop 1
                  sltu         a0, s1, zero
main_66:          jal          ra, 2f
0:                c.jal        11f
1:                jal          ra, 6f
2:                jal          t2, 10f
3:                c.j          0b
4:                c.j          8f
5:                c.j          9f
6:                jal          ra, 5b
7:                c.j          4b
8:                c.jal        3b
9:                c.j          7b
10:               c.j          1b
11:               jal          ra, 12f
12:               c.sub        a2, a2
                  addi         a3, zero, 4 #init loop 0 counter
                  addi         s1, zero, -14 #init loop 0 limit
main_124_0_t:     c.add        sp, a0
                  addi         a3, a3, -3 #update loop 0 counter
                  bge          a3, s1, main_124_0_t #branch for loop 0
                  mulh         s3, a5, s10
                  la           a4, region_0+1900 #start load_store_instr_stream_1
                  lbu          t0, 54(a4)
                  la           tp, region_1+298 #start load_store_instr_stream_0
                  sb           s6, 536(tp)
                  lh           t0, 22(a4)
                  lhu          a0, 368(tp)
                  lbu          t0, -53(a4)
                  lb           s5, 920(tp)
                  lbu          s0, -61(a4)
                  lb           t0, -44(a4)
                  sb           s10, 25(a4)
                  lb           t3, -53(a4) #end load_store_instr_stream_1
                  sh           s8, 476(tp)
                  lbu          a3, 143(tp)
                  sh           s1, 620(tp) #end load_store_instr_stream_0
main_44:          jal          ra, 7f
0:                jal          ra, 8f
1:                c.jal        6f
2:                c.jal        13f
3:                c.j          11f
4:                c.j          12f
5:                jal          ra, 18f
6:                c.j          17f
7:                jal          sp, 15f
8:                c.jal        2b
9:                c.j          16f
10:               c.j          4b
11:               c.j          0b
12:               c.j          3b
13:               c.jal        1b
14:               jal          ra, 10b
15:               c.jal        14b
16:               c.j          5b
17:               c.jal        9b
18:               sltu         t1, a0, t1
main_54:          jal          ra, 8f
0:                jal          t1, 18f
1:                jal          ra, 0b
2:                c.j          15f
3:                c.j          7f
4:                c.j          11f
5:                c.j          6f
6:                c.jal        16f
7:                jal          t1, 2b
8:                c.j          12f
9:                jal          t1, 13f
10:               c.j          3b
11:               c.j          9b
12:               c.j          14f
13:               c.jal        17f
14:               c.jal        4b
15:               jal          ra, 1b
16:               jal          t3, 10b
17:               c.jal        5b
18:               c.addi       a6, 23
                  la           t4, region_1+75 #start riscv_hazard_instr_stream_5
                  sh           sp, 1157(t4)
                  lbu          s4, 250(t4)
                  sltu         s3, s11, s5
                  sb           a2, 815(t4)
                  remu         s5, s3, s4
                  c.sub        a2, a2
                  c.nop
                  or           s4, s4, s5
                  lb           a2, 1915(t4)
                  sb           a2, 239(t4)
                  mulh         a2, s5, s3
                  sb           s4, 224(t4)
                  lb           s3, 877(t4)
                  lbu          s4, 1225(t4)
                  lh           a2, 309(t4)
                  sw           s11, 909(t4)
                  lhu          s3, 1019(t4)
                  lbu          s5, 258(t4)
                  sb           s5, 1768(t4)
                  lbu          s11, 1135(t4)
                  lb           s5, 142(t4)
                  add          s3, sp, s11
                  lbu          s5, 315(t4)
                  lbu          s3, 493(t4)
                  sb           s11, 822(t4)
                  lh           s11, 825(t4)
                  lw           s3, 1617(t4)
                  ori          s4, sp, 749
                  c.li         s11, -1
                  sb           s5, 1740(t4)
                  sh           a2, 943(t4)
                  lbu          s4, 673(t4)
                  c.xor        a2, a2
                  sb           s11, 922(t4)
                  xori         s11, s5, 769
                  lb           s5, 1232(t4)
                  sb           s5, 632(t4)
                  sh           s4, 1717(t4)
                  lb           s11, 523(t4)
                  andi         s5, s11, -1795
                  sb           s3, -9(t4) #end riscv_hazard_instr_stream_5
main_50:          jal          ra, 4f
0:                c.jal        1f
1:                c.j          9f
2:                jal          tp, 7f
3:                c.jal        8f
4:                jal          ra, 11f
5:                jal          s10, 6f
6:                c.jal        3b
7:                jal          t4, 13f
8:                c.jal        10f
9:                c.j          12f
10:               jal          ra, 0b
11:               c.jal        5b
12:               c.j          2b
13:               div          s0, s11, a7
                  addi         t5, zero, 10 #init loop 1 counter
                  mulh         s3, s5, a1
                  addi         a6, zero, 10 #init loop 1 limit
                  c.add        t6, s9
                  c.or         a2, a0
main_130_1_t:     slti         s4, s2, 834
                  and          gp, a5, s6
                  addi         t5, t5, -9 #update loop 1 counter
                  c.nop
                  divu         a0, s0, t1
                  or           ra, ra, t0
                  addi         a4, zero, -7 #init loop 0 counter
                  andi         s6, s1, 1938
                  addi         zero, zero, 0 #init loop 0 limit
                  mulhu        gp, t5, s6
main_130_0_t:     mul          t3, a5, t6
                  addi         a4, a4, 7 #update loop 0 counter
                  c.addi16sp   sp, -16
                  c.bnez       a4, main_130_0_t #branch for loop 0
                  lui          s4, 577568
                  c.lui        t0, 3
                  bgeu         t5, a6, main_130_1_t #branch for loop 1
                  sub          gp, t0, a2
                  la           a2, amo_0+12 #start riscv_lr_sc_instr_stream_4
                  mulhu        t2, t2, s11
                  lui          s5, 741279
                  c.add        a6, t1
                  c.srli       s0, 4
                  andi         s8, t6, 664
                  lr.w.aq       t4, (a2)
                  c.mv         ra, tp
                  c.li         a4, -1
                  divu         gp, t5, a5
                  div          s10, t5, s8
                  lui          t2, 195002
                  srli         tp, a5, 10
                  or           s4, s5, a7
                  sra          t1, t1, sp
                  sc.w          zero, s7, (a2) #end riscv_lr_sc_instr_stream_4
                  la           a6, region_0+63 #start riscv_hazard_instr_stream_19
                  lbu          s5, 14(a6)
                  xori         tp, a4, -53
                  sra          a4, a4, a4
                  remu         gp, tp, tp
                  sltiu        s0, gp, -1668
                  lb           tp, -10(a6)
                  lb           s0, -8(a6)
                  lb           s5, -10(a6)
                  nop
                  sltu         gp, tp, tp
                  srli         a1, gp, 11
                  divu         s0, a4, s5
                  sh           s0, 11(a6)
                  lbu          a1, 14(a6)
                  lb           a4, 4(a6)
                  nop
                  c.mv         gp, s0
                  nop
                  lb           tp, -16(a6)
                  slli         tp, gp, 24
                  lui          a1, 836216
                  slt          s0, a1, s0
                  ori          tp, a1, 1935
                  lb           tp, 15(a6)
                  srai         gp, a1, 13
                  lbu          tp, -8(a6)
                  lb           a1, -16(a6)
                  srl          s0, s0, s0
                  slti         a1, gp, 820
                  c.sub        a4, s0
                  slli         gp, gp, 26
                  c.srai       a4, 7
                  auipc        s0, 376892
                  lb           s0, 0(a6)
                  srli         a4, a4, 29
                  slt          s5, tp, tp
                  lb           gp, 12(a6)
                  lb           s0, -5(a6)
                  lbu          s5, -6(a6)
                  sltu         a4, a1, s5
                  sb           a1, -8(a6) #end riscv_hazard_instr_stream_19
                  la           t3, amo_0+60 #start riscv_amo_instr_stream_18
                  la           s4, amo_0+32
                  la           s10, amo_0+24
                  la           s1, amo_0+24
                  amoswap.w     a4, s6, (t3)
                  amoand.w      t4, t6, (s4)
                  amoadd.w.aq   t5, s2, (s10)
                  amomaxu.w.aq  s6, a2, (s1)
                  amomin.w      s11, s11, (s1)
                  amomaxu.w.rl  a1, s6, (s4)
                  amoswap.w.rl  a2, a1, (s10)
                  amomax.w.rl   t5, a3, (s4) #end riscv_amo_instr_stream_18
                  la           sp, region_0+505 #start riscv_hazard_instr_stream_21
                  lb           s10, 876(sp)
                  remu         s11, a6, s1
                  srai         a6, a4, 27
                  lb           s1, 738(sp)
                  sltiu        s10, s3, 1781
                  remu         a4, s1, a6
                  lbu          a6, 863(sp)
                  sb           s1, 269(sp)
                  lb           s3, 1127(sp)
                  lhu          s3, -3(sp)
                  c.and        a4, s1
                  ori          s10, a6, 62
                  sb           a4, -500(sp)
                  sb           s3, 260(sp)
                  srai         a6, s3, 19
                  sh           s1, -301(sp)
                  lbu          s1, 246(sp)
                  sltiu        s3, a4, -183
                  lbu          s10, -420(sp)
                  mul          s10, s3, a4
                  sb           s11, 260(sp)
                  sb           s3, 677(sp)
                  lbu          s11, 620(sp)
                  lhu          s1, 315(sp)
                  lb           s1, 654(sp)
                  lui          s1, 944381
                  c.and        a4, a4
                  sb           s11, 564(sp)
                  rem          a6, s1, a6
                  lw           s3, -73(sp)
                  lbu          s3, 1437(sp)
                  lbu          a6, 1182(sp)
                  c.slli       a6, 31
                  lbu          s1, -353(sp)
                  c.or         a4, a4
                  sb           s3, -442(sp) #end riscv_hazard_instr_stream_21
                  la           s5, amo_0+24 #start riscv_lr_sc_instr_stream_15
                  sub          a1, s7, t1
                  c.nop
                  sltu         s0, s5, a0
                  lr.w.aq       s8, (s5)
                  and          t6, a4, s6
                  srl          s10, s1, s10
                  c.xor        s0, a2
                  and          a3, t6, s7
                  c.srli       a3, 19
                  c.addi       sp, 19
                  sc.w.rl       sp, a6, (s5) #end riscv_lr_sc_instr_stream_15
                  la           s6, region_1+1737 #start riscv_hazard_instr_stream_23
                  srli         s4, s1, 14
                  lb           t2, -610(s6)
                  srl          s4, s1, t1
                  sll          a2, zero, zero
                  c.li         t1, -1
                  lh           s4, -1107(s6)
                  slti         zero, a2, -1030
                  sb           zero, -722(s6)
                  lb           s4, -494(s6)
                  sb           t1, -1522(s6)
                  lbu          t2, -341(s6)
                  lbu          zero, -910(s6)
                  divu         t2, s4, t2
                  sw           a2, -1645(s6)
                  auipc        zero, 969468
                  xori         zero, s4, 1517
                  xor          t1, s4, t1
                  c.li         a2, 26
                  sra          a2, s1, s1
                  sb           a2, -1077(s6)
                  sb           zero, -1410(s6)
                  slli         t1, t2, 9
                  addi         a2, zero, 1172
                  c.li         s1, -1
                  mul          zero, s4, t1
                  c.srli       s1, 25
                  c.lui        a2, 11
                  lbu          zero, 171(s6)
                  lb           a2, -654(s6)
                  addi         t2, s1, -1893
                  c.or         a2, a2
                  mulh         a2, t2, s4
                  c.mv         t2, s4
                  xori         zero, t1, 2032
                  c.srai       s1, 12
                  lb           t2, -1384(s6)
                  sll          t1, zero, s1
                  sh           t1, -543(s6)
                  sh           a2, -1403(s6)
                  sltiu        s1, t1, -1791
                  lbu          s4, -776(s6)
                  c.sub        a2, a2
                  lh           a2, -1615(s6) #end riscv_hazard_instr_stream_23
                  addi         tp, zero, -3 #init loop 0 counter
                  c.nop
                  addi         sp, zero, 10 #init loop 0 limit
                  and          a2, s3, t6
main_134_0_t:     c.nop
                  addi         tp, tp, 10 #update loop 0 counter
                  bltu         tp, sp, main_134_0_t #branch for loop 0
                  sub          s10, a6, a5
                  la           t4, amo_0+8 #start riscv_lr_sc_instr_stream_3
                  c.slli       a2, 9
                  lr.w.rl       a6, (t4)
                  sc.w.aq       s4, a6, (t4) #end riscv_lr_sc_instr_stream_3
main_45:          jal          ra, 11f
0:                c.j          7f
1:                jal          ra, 14f
2:                c.j          8f
3:                c.j          5f
4:                c.j          10f
5:                jal          ra, 1b
6:                c.jal        3b
7:                c.j          12f
8:                c.jal        13f
9:                jal          s9, 4b
10:               jal          ra, 15f
11:               c.j          0b
12:               jal          ra, 2b
13:               c.j          6b
14:               c.jal        9b
15:               xori         t6, s6, 313
main_58:          jal          ra, 4f
0:                c.j          10f
1:                jal          ra, 7f
2:                jal          t1, 15f
3:                c.jal        2b
4:                c.jal        0b
5:                c.j          3b
6:                c.j          9f
7:                jal          s1, 6b
8:                c.j          12f
9:                jal          ra, 8b
10:               jal          t1, 14f
11:               c.j          1b
12:               jal          ra, 13f
13:               jal          ra, 5b
14:               jal          gp, 11b
15:               c.sub        a3, a3
main_46:          jal          ra, 9f
0:                jal          t1, 12f
1:                jal          tp, 17f
2:                c.j          13f
3:                c.jal        5f
4:                jal          t1, 1b
5:                jal          t1, 16f
6:                c.jal        0b
7:                jal          a0, 3b
8:                jal          t1, 2b
9:                c.j          7b
10:               c.jal        11f
11:               c.j          6b
12:               c.jal        15f
13:               c.j          14f
14:               jal          ra, 4b
15:               c.j          8b
16:               jal          a0, 10b
17:               c.j          18f
18:               sltiu        s6, s1, -2005
main_56:          jal          ra, 13f
0:                c.jal        18f
1:                jal          ra, 8f
2:                c.j          7f
3:                jal          sp, 2b
4:                jal          ra, 3b
5:                jal          t1, 16f
6:                c.jal        21f
7:                c.j          12f
8:                c.jal        6b
9:                c.jal        1b
10:               c.jal        4b
11:               c.jal        10b
12:               c.jal        20f
13:               jal          t1, 14f
14:               c.jal        15f
15:               c.j          11b
16:               jal          ra, 19f
17:               c.jal        0b
18:               c.j          5b
19:               jal          s5, 9b
20:               jal          t1, 17b
21:               c.or         a3, s0
                  la           s3, amo_0+32 #start riscv_lr_sc_instr_stream_5
                  rem          a1, a3, sp
                  mulh         s4, gp, ra
                  c.and        a3, a2
                  c.lui        t4, 18
                  c.mv         a4, s11
                  lr.w          gp, (s3)
                  c.srai       a2, 19
                  c.addi       t4, -1
                  sc.w.rl       s11, t0, (s3) #end riscv_lr_sc_instr_stream_5
                  la           t2, amo_0+60 #start riscv_lr_sc_instr_stream_11
                  ori          t5, s0, 1767
                  rem          t4, t1, t2
                  c.lui        tp, 1
                  c.nop
                  lr.w          a3, (t2)
                  divu         a3, s2, t3
                  div          ra, t0, a2
                  c.addi       sp, -1
                  srl          s0, s8, a7
                  add          a0, a5, s6
                  lui          t4, 86131
                  c.or         a2, s0
                  slli         s0, sp, 23
                  mul          s1, tp, s5
                  sc.w          t5, s9, (t2) #end riscv_lr_sc_instr_stream_11
                  la           s10, amo_0+24 #start riscv_lr_sc_instr_stream_18
                  slli         s2, s11, 21
                  mulh         t6, s1, s5
                  slt          a6, a3, a0
                  nop
                  c.srli       s0, 5
                  mulhu        s8, ra, gp
                  remu         s3, gp, s5
                  lr.w.aq       s3, (s10)
                  sc.w.aq       zero, a6, (s10) #end riscv_lr_sc_instr_stream_18
                  la           t5, amo_0+32 #start riscv_lr_sc_instr_stream_6
                  addi         a0, a3, -1936
                  lr.w.rl       t4, (t5)
                  sc.w          t0, t6, (t5) #end riscv_lr_sc_instr_stream_6
                  la           s5, amo_0+24 #start riscv_amo_instr_stream_8
                  la           a2, amo_0+24
                  la           a6, amo_0+0
                  amoadd.w.aq   a0, s6, (a2)
                  c.xor        s0, a4
                  amoswap.w     s1, tp, (s5)
                  amomaxu.w.rl  a4, tp, (a2) #end riscv_amo_instr_stream_8
                  la           sp, region_1+258 #start riscv_hazard_instr_stream_8
                  c.addi       s1, 11
                  sub          ra, t3, a4
                  lb           tp, -79(sp)
                  c.mv         t3, s1
                  rem          t3, s1, ra
                  srl          tp, t3, s10
                  sb           s10, 1401(sp)
                  addi         tp, s10, -1729
                  lbu          tp, 243(sp)
                  sb           a4, -228(sp)
                  srl          t3, tp, t3
                  sb           ra, 1119(sp)
                  sh           s1, -78(sp)
                  srai         ra, ra, 13
                  auipc        s1, 32132
                  lb           s1, 1124(sp)
                  lbu          s10, 605(sp)
                  lbu          a4, 1608(sp)
                  lb           s10, 1609(sp)
                  lhu          s1, -44(sp)
                  lh           t3, -78(sp)
                  lb           tp, 53(sp)
                  andi         s1, t3, -801
                  lb           s1, 409(sp)
                  sb           t3, 291(sp)
                  sb           t3, 1102(sp)
                  lb           t3, 1423(sp)
                  srai         ra, t3, 29
                  lb           s1, 1081(sp)
                  sh           t3, 1158(sp)
                  lui          tp, 154501
                  sh           s10, 1426(sp)
                  lh           tp, 1124(sp) #end riscv_hazard_instr_stream_8
                  la           sp, region_0+1922 #start riscv_hazard_instr_stream_20
                  c.srai       a1, 4
                  or           t6, t4, s3
                  and          t0, t6, s3
                  lb           t6, 26(sp)
                  lb           s0, -11(sp)
                  c.srai       s0, 15
                  c.li         t4, -1
                  srl          s0, s3, t4
                  lhu          a1, 8(sp)
                  sb           t6, 55(sp)
                  sh           t4, -50(sp)
                  lb           s0, -33(sp)
                  addi         s0, t4, -1592
                  xor          s3, t4, s0
                  or           t4, s3, s0
                  div          t0, s3, a1
                  sltiu        t0, t6, 1976
                  sub          a1, t6, t0
                  lh           t4, 32(sp)
                  c.or         a1, a1
                  sb           s3, 40(sp)
                  lbu          t0, 35(sp)
                  lbu          t4, -51(sp)
                  lb           s3, 31(sp)
                  sb           t6, 32(sp)
                  sb           t6, 8(sp)
                  sb           s0, 27(sp)
                  mulhsu       t4, s3, t0
                  mul          t6, t4, s0
                  addi         s0, s0, 199
                  c.slli       s0, 3
                  andi         s0, t0, -172
                  mul          s0, s0, s3
                  lb           a1, -35(sp)
                  srai         a1, t0, 15
                  lbu          t0, -17(sp)
                  xor          a1, s3, t0
                  lbu          t0, -11(sp)
                  srl          t6, t0, t0
                  mulhsu       s3, t0, a1
                  lbu          s3, 64(sp)
                  lbu          s3, 19(sp)
                  lbu          t6, 17(sp)
                  c.or         s0, a1
                  lui          t0, 195916
                  c.mv         t6, t6
                  sh           t4, -28(sp)
                  c.slli       s3, 17
                  mulh         t0, a1, t0
                  c.lui        s0, 11
                  sb           s0, 35(sp) #end riscv_hazard_instr_stream_20
                  la           t1, region_1+1419 #start riscv_hazard_instr_stream_14
                  mulh         s1, t0, a6
                  xor          t0, t2, s1
                  srl          s1, a6, t6
                  andi         s1, t0, 1298
                  lh           t6, 223(t1)
                  and          s1, t2, t6
                  lbu          t0, -72(t1)
                  lb           s1, 46(t1)
                  lb           t0, 90(t1)
                  lbu          t6, -12(t1)
                  lbu          t0, -252(t1)
                  lhu          t6, -1(t1)
                  lhu          s1, 107(t1)
                  add          a6, t0, t2
                  sb           a3, -58(t1)
                  sb           t6, 139(t1)
                  auipc        s1, 170711
                  lbu          s1, -7(t1)
                  sh           a6, 79(t1)
                  sb           a6, -151(t1)
                  sh           t2, 209(t1)
                  mul          t2, t2, a6
                  lhu          t2, -27(t1)
                  lbu          a6, 50(t1)
                  divu         a6, s1, s1
                  remu         t0, t6, t2
                  lb           a6, 178(t1)
                  srai         a6, t2, 16
                  sh           a3, 117(t1)
                  sb           a6, 244(t1)
                  c.or         s1, a3
                  lhu          t0, -229(t1)
                  ori          a3, t2, -807
                  sb           t0, 132(t1)
                  sh           a6, -115(t1)
                  xor          t2, a3, t6
                  sub          t2, s1, a3
                  sub          a3, t2, a6
                  c.li         t6, 13
                  lbu          t0, -39(t1)
                  c.xor        s1, a3
                  div          a6, s1, a3
                  lhu          s1, -63(t1)
                  lbu          s1, 17(t1) #end riscv_hazard_instr_stream_14
main_55:          jal          ra, 15f
0:                c.j          11f
1:                jal          ra, 8f
2:                c.j          0b
3:                c.j          1b
4:                jal          t1, 13f
5:                c.jal        3b
6:                c.jal        12f
7:                jal          t6, 9f
8:                jal          ra, 2b
9:                c.jal        10f
10:               c.j          14f
11:               c.j          6b
12:               c.jal        4b
13:               c.j          7b
14:               c.jal        16f
15:               jal          s5, 5b
16:               xor          t6, t3, t0
                  la           s6, region_1+501 #start riscv_load_store_rand_instr_stream_7
                  c.add        t3, s1
                  c.or         a3, a5
                  sub          t6, t5, zero
                  srli         s3, a5, 26
                  lb           s4, -207(s6)
                  c.addi16sp   sp, -16
                  sb           s8, -180(s6)
                  xor          s0, a5, zero
                  add          t2, t2, s11
                  lb           t4, -27(s6)
                  sb           zero, 173(s6)
                  srl          s10, t2, a1
                  c.addi4spn   a2, sp, 432
                  div          t6, s3, ra
                  lb           a2, 128(s6)
                  lh           a1, 155(s6)
                  lbu          s11, 167(s6)
                  slt          sp, t0, a2
                  lh           t1, 189(s6)
                  sb           t4, 31(s6)
                  lb           s1, -7(s6)
                  lbu          t5, -117(s6)
                  sub          a1, a6, a7
                  lh           s0, 185(s6)
                  c.addi4spn   a3, sp, 704
                  mulhu        a1, s11, t3
                  nop
                  mulhsu       s9, t3, t4
                  sra          a2, s6, t0
                  sb           s5, 46(s6)
                  lh           t3, 93(s6)
                  c.srai       a4, 7
                  c.addi4spn   a2, sp, 896
                  mul          a0, a0, t6
                  lhu          s10, -39(s6)
                  c.srai       s1, 16
                  sb           tp, -143(s6)
                  sb           t6, 252(s6)
                  lbu          t4, 74(s6)
                  srl          a1, t2, a1
                  sw           a2, -117(s6)
                  lb           s10, -208(s6)
                  lbu          s2, 15(s6)
                  lbu          t1, -60(s6)
                  lb           a2, 252(s6)
                  c.andi       s0, -1
                  nop
                  lbu          s9, 204(s6)
                  div          s1, sp, a1
                  lhu          s11, 167(s6)
                  sb           s1, 185(s6) #end riscv_load_store_rand_instr_stream_7
                  la           s11, region_1+1189 #start load_store_instr_stream_1
                  lh           t6, -1125(s11)
                  la           s10, region_0+1485 #start load_store_instr_stream_0
                  lb           s8, -15(s10)
                  sh           a6, -1003(s11)
                  lh           t2, -15(s10)
                  lhu          s5, -5(s10)
                  lbu          s6, 783(s11)
                  lb           a3, -10(s10)
                  lh           zero, -241(s11)
                  sb           s2, -12(s10)
                  lb           gp, -10(s10)
                  sb           a1, 5(s10)
                  sb           gp, -752(s11) #end load_store_instr_stream_1
                  lbu          s5, -8(s10)
                  lhu          t4, -15(s10)
                  lh           zero, -5(s10) #end load_store_instr_stream_0
                  la           s6, region_1+1972 #start load_store_instr_stream_0
                  la           t4, region_0+283 #start load_store_instr_stream_1
                  lhu          s10, 53(t4)
                  lb           sp, -195(t4)
                  sw           s2, -112(s6)
                  lh           t3, -225(t4)
                  sh           s6, -1766(s6)
                  lbu          tp, -158(s6)
                  lhu          s3, 189(t4)
                  lbu          ra, -1065(s6)
                  lbu          s11, -1469(s6)
                  sb           t6, -1267(s6)
                  lh           zero, -1920(s6)
                  sb           t2, -139(t4) #end load_store_instr_stream_1
                  lbu          s2, -1755(s6) #end load_store_instr_stream_0
                  la           a0, region_1+949 #start load_store_instr_stream_0
                  la           sp, region_0+1822 #start load_store_instr_stream_1
                  lb           s3, 24(a0)
                  lhu          s6, -27(a0)
                  sh           s11, -1240(sp)
                  lw           a6, 39(a0)
                  lw           s5, 11(a0)
                  lhu          s11, -410(sp)
                  lw           s3, -938(sp)
                  lh           s11, -540(sp)
                  sh           zero, 1(a0)
                  lb           s3, -165(sp) #end load_store_instr_stream_1
                  sb           s0, 16(a0) #end load_store_instr_stream_0
                  la           tp, region_1+1929 #start load_store_instr_stream_0
                  lbu          sp, -1868(tp)
                  la           a3, region_1+549 #start load_store_instr_stream_1
                  lb           s4, 38(tp)
                  lb           t6, -255(tp)
                  sb           ra, -1453(tp)
                  lbu          t2, -2(a3)
                  lbu          a4, 22(a3)
                  lb           s11, -7(tp)
                  lh           s9, -35(a3)
                  sb           s4, -570(tp)
                  sb           gp, 28(a3)
                  lb           t0, -1801(tp)
                  sb           a3, -52(a3)
                  lb           t2, 62(a3)
                  sh           s1, -323(tp)
                  sb           t4, -10(a3) #end load_store_instr_stream_1
                  lb           t5, -1643(tp)
                  sb           s9, -1475(tp) #end load_store_instr_stream_0
                  la           sp, region_0+1139 #start riscv_load_store_rand_instr_stream_3
                  srai         s8, s10, 6
                  c.addi       s0, 14
                  sb           s11, 39(sp)
                  sub          ra, s7, s2
                  sb           t5, -95(sp)
                  sub          a3, s8, tp
                  slt          a2, zero, a5
                  sb           t2, -253(sp)
                  rem          s6, s10, a5
                  and          t5, tp, s8
                  c.li         s11, -1
                  lui          s3, 710676
                  lbu          tp, 144(sp)
                  remu         s11, s3, t0
                  add          s10, a6, t3
                  slt          a3, t2, t2
                  divu         t0, ra, t2
                  lhu          a4, -191(sp)
                  c.slli       t3, 11
                  sltiu        s1, a6, 1710
                  addi         ra, a0, 695
                  lb           s6, -62(sp)
                  auipc        t5, 211076
                  lbu          ra, -116(sp)
                  xori         t4, tp, -43
                  lb           tp, 205(sp)
                  sra          t4, s5, t5
                  lb           s1, -194(sp)
                  sb           a6, -46(sp)
                  lb           a2, 130(sp)
                  auipc        t6, 860584
                  mulhu        a6, s9, t2
                  srai         s6, a3, 12
                  sh           t6, -165(sp) #end riscv_load_store_rand_instr_stream_3
main_47:          jal          ra, 2f
0:                jal          ra, 10f
1:                c.j          3f
2:                jal          ra, 9f
3:                jal          ra, 24f
4:                c.j          18f
5:                c.j          20f
6:                c.jal        5b
7:                c.jal        23f
8:                c.j          1b
9:                c.jal        13f
10:               c.jal        25f
11:               c.jal        0b
12:               c.jal        22f
13:               jal          t2, 12b
14:               c.j          4b
15:               jal          ra, 14b
16:               c.jal        17f
17:               jal          ra, 6b
18:               jal          ra, 27f
19:               jal          a1, 8b
20:               c.jal        28f
21:               jal          t1, 19b
22:               c.jal        15b
23:               c.jal        11b
24:               c.jal        16b
25:               jal          ra, 26f
26:               c.j          21b
27:               c.j          7b
28:               sltiu        zero, s4, 1519
                  la           a6, region_0+820 #start load_store_instr_stream_2
                  la           s9, region_0+538 #start load_store_instr_stream_3
                  la           s6, region_0+720 #start load_store_instr_stream_0
                  la           tp, region_0+1195 #start load_store_instr_stream_1
                  lbu          s0, 9(s6)
                  sb           t6, -84(a6)
                  sb           a6, 78(tp)
                  la           a0, region_0+1801 #start load_store_instr_stream_4
                  lbu          s4, 920(a6)
                  sb           s4, -252(tp)
                  lbu          zero, -785(a6)
                  lhu          s1, -22(s6)
                  lb           t4, 225(s9)
                  sb           s10, -12(tp)
                  sb           a7, 1031(a6)
                  lh           a3, 16(s6)
                  lhu          t2, -50(s6)
                  lb           s2, 239(s9)
                  lbu          s8, -59(s6)
                  sb           s6, -200(tp)
                  lbu          a1, -6(a0)
                  sb           a4, 6(a0)
                  lbu          t2, 38(s6)
                  lbu          zero, 25(s6)
                  lb           s1, -14(tp)
                  sb           t4, -163(s9)
                  lb           t6, 582(a6)
                  lhu          s5, 208(s9)
                  lbu          s11, -156(tp)
                  lh           a2, 5(a0)
                  sb           sp, 89(s9)
                  lb           gp, 1066(a6)
                  sb           a0, -28(s9)
                  lh           gp, -162(a6)
                  sw           t4, 194(s9)
                  lbu          s5, -14(a0)
                  lhu          s10, 113(tp) #end load_store_instr_stream_1
                  lbu          ra, -4(s6)
                  lbu          s2, 2(a0)
                  lhu          t0, 11(a0) #end load_store_instr_stream_4
                  lbu          t3, 25(s6)
                  lb           t1, -193(s9) #end load_store_instr_stream_3
                  lbu          t6, -605(a6) #end load_store_instr_stream_2
                  lb           s3, 46(s6) #end load_store_instr_stream_0
                  la           sp, region_0+1713 #start riscv_load_store_hazard_instr_stream_5
                  lb           t4, -48(sp)
                  lb           s9, -48(sp)
                  lbu          tp, -48(sp)
                  sb           ra, -48(sp)
                  lbu          t1, -48(sp)
                  or           t6, t4, t0
                  lb           s6, 30(sp)
                  lb           s9, 30(sp)
                  c.srai       a3, 2
                  lb           a1, 30(sp)
                  lb           zero, 30(sp)
                  lb           s2, 30(sp)
                  lb           a3, 30(sp)
                  sb           t0, 30(sp)
                  lhu          t5, -217(sp)
                  sw           a7, -217(sp)
                  lb           t6, -217(sp) #end riscv_load_store_hazard_instr_stream_5
main_60:          jal          ra, 7f
0:                jal          a4, 2f
1:                jal          t1, 4f
2:                jal          ra, 15f
3:                jal          t1, 6f
4:                c.j          12f
5:                jal          ra, 9f
6:                c.j          17f
7:                c.j          1b
8:                c.jal        11f
9:                c.jal        10f
10:               c.jal        8b
11:               c.jal        3b
12:               c.j          16f
13:               c.j          18f
14:               jal          ra, 5b
15:               jal          ra, 13b
16:               c.j          14b
17:               jal          ra, 0b
18:               c.sub        a4, a0
                  la           t6, region_0+128 #start riscv_load_store_hazard_instr_stream_19
                  sb           a7, -47(t6)
                  sltiu        s6, s8, 1489
                  lb           t2, -47(t6)
                  lbu          ra, -47(t6)
                  xor          s6, a3, s0
                  lb           s2, -47(t6)
                  lbu          ra, -47(t6)
                  sb           s11, -47(t6)
                  sb           a0, -47(t6)
                  c.srli       a3, 21
                  addi         t4, a4, 881
                  lbu          a1, -47(t6)
                  lb           a2, -47(t6)
                  lbu          t5, -47(t6)
                  slti         s6, s11, 878
                  and          sp, s5, s6
                  lb           s3, -47(t6)
                  lbu          a0, -47(t6)
                  lbu          s3, -59(t6)
                  sb           a7, -59(t6)
                  lbu          gp, -59(t6)
                  lb           t2, -59(t6)
                  and          s5, s1, s11
                  lb           t0, -59(t6) #end riscv_load_store_hazard_instr_stream_19
main_57:          jal          ra, 5f
0:                jal          t1, 18f
1:                c.jal        13f
2:                c.j          0b
3:                c.jal        7f
4:                jal          sp, 8f
5:                c.j          6f
6:                c.j          16f
7:                c.jal        14f
8:                c.j          3b
9:                jal          ra, 11f
10:               jal          t1, 15f
11:               c.j          17f
12:               c.jal        19f
13:               c.jal        4b
14:               c.j          9b
15:               c.jal        12b
16:               jal          s2, 2b
17:               c.jal        10b
18:               jal          t1, 1b
19:               ori          a4, t6, -1383
                  la           s9, region_0+101 #start riscv_load_store_rand_instr_stream_16
                  lb           t4, 154(s9)
                  mulhu        t2, t0, ra
                  lhu          s4, 1145(s9)
                  srli         s10, a1, 11
                  lb           ra, 1385(s9)
                  rem          s11, a6, s4
                  lbu          s1, 1764(s9)
                  divu         t3, sp, t4
                  mulhsu       a3, s7, s4
                  lb           a2, 692(s9)
                  c.xor        a4, s1
                  lhu          tp, 313(s9)
                  lbu          gp, 1188(s9)
                  lh           s3, 1079(s9)
                  andi         a1, a2, 556
                  lb           s6, 1377(s9)
                  lbu          s1, 1341(s9)
                  lb           tp, 1492(s9)
                  lbu          t0, 970(s9)
                  sb           t5, 1824(s9)
                  sub          s11, a1, t1
                  c.addi4spn   s1, sp, 496
                  c.mv         s10, t0
                  c.addi       s4, 16
                  sub          t3, t6, a5
                  srli         t3, s0, 27
                  nop
                  sra          t4, ra, a5
                  sb           s8, 1524(s9)
                  c.addi       t3, 7
                  c.add        s8, s4
                  c.addi4spn   a2, sp, 816
                  sb           t3, 1892(s9)
                  sb           s11, 1769(s9)
                  c.addi       a6, -1
                  mulhu        s0, s9, a2
                  lw           ra, 347(s9)
                  lbu          a4, 72(s9)
                  slt          s6, t0, s8
                  sb           sp, 484(s9)
                  lbu          s3, 6(s9)
                  sll          t1, s7, s5
                  lhu          t5, 1811(s9) #end riscv_load_store_rand_instr_stream_16
                  la           s0, amo_0+56 #start riscv_amo_instr_stream_1
                  la           s4, amo_0+24
                  la           t6, amo_0+60
                  amoswap.w.rl  a0, t0, (t6)
                  amomin.w      s1, t1, (s0)
                  amomin.w.rl   t3, a1, (s0)
                  ori          s11, s2, -1228
                  divu         sp, s8, t0
                  c.addi       t2, -1
                  c.srli       a2, 15
                  amoswap.w     a6, s2, (s0)
                  amoadd.w      t0, s6, (s0)
                  or           gp, a3, s6
                  amomax.w.aq   t3, s8, (s4)
                  amoxor.w.rl   t3, t1, (t6)
                  ori          t4, s9, -259
                  srli         a4, gp, 9
                  amoadd.w.rl   t2, s8, (s4) #end riscv_amo_instr_stream_1
                  la           s6, region_0+1588 #start riscv_load_store_hazard_instr_stream_13
                  sb           s3, 3(s6)
                  c.lui        t1, 4
                  lbu          tp, 3(s6)
                  lbu          tp, 3(s6)
                  lb           t1, -2(s6)
                  sh           s4, -2(s6)
                  srai         t5, a4, 1
                  addi         s11, s9, -1038
                  sub          s2, gp, t0
                  lh           t6, -2(s6)
                  sb           s0, -2(s6)
                  lbu          t2, -2(s6)
                  sb           s9, -16(s6)
                  c.mv         s9, s10
                  lhu          t2, -16(s6) #end riscv_load_store_hazard_instr_stream_13
                  addi         a4, zero, -5 #init loop 1 counter
                  c.li         s1, 0
                  sltu         t1, s7, t0
                  c.add        s2, s10
                  c.addi       ra, -1
                  slt          t6, s2, s10
                  addi         s11, zero, -3 #init loop 1 limit
main_122_1_t:     c.mv         a0, t0
                  c.sub        a0, s1
                  mulhsu       sp, t2, s10
                  andi         s9, a0, -1475
                  addi         a4, a4, 5 #update loop 1 counter
                  c.srli       s1, 21
                  addi         a6, zero, 3 #init loop 0 counter
                  addi         gp, zero, -7 #init loop 0 limit
                  sra          t3, s5, s6
main_122_0_t:     sltiu        t4, a6, 1613
                  addi         a6, a6, -2 #update loop 0 counter
                  c.addi       s9, -1
                  xori         s0, s2, 806
                  xori         t5, t3, 400
                  srai         s9, s6, 11
                  c.nop
                  bge          a6, gp, main_122_0_t #branch for loop 0
                  and          s3, a2, tp
                  slti         a3, t0, -1038
                  andi         a0, t4, 785
                  xor          s4, a0, t4
                  blt          a4, s11, main_122_1_t #branch for loop 1
                  addi         s4, t6, 347
                  la           s2, region_1+800 #start load_store_instr_stream_3
                  la           a2, region_1+1724 #start load_store_instr_stream_1
                  la           sp, region_1+1501 #start load_store_instr_stream_4
                  la           s4, region_1+1077 #start load_store_instr_stream_2
                  lb           a3, 3(a2)
                  la           t5, region_1+134 #start load_store_instr_stream_0
                  lb           tp, -15(a2)
                  lb           t1, 3(sp)
                  lbu          a4, 9(s4)
                  lh           s3, -8(t5)
                  lbu          s9, 150(s2)
                  lw           a6, -8(a2)
                  lb           zero, 0(sp)
                  sb           s11, 11(a2)
                  lb           s5, -216(s2)
                  lw           a6, 147(s4)
                  lb           t0, -149(s4)
                  lh           s3, 10(t5)
                  lh           ra, 143(s4)
                  lb           a6, 77(s2)
                  lb           a0, -187(s2)
                  sh           a1, -6(a2)
                  lh           s8, 21(s4)
                  sb           t5, 241(s2)
                  sh           s2, 8(t5)
                  sb           a5, -14(sp)
                  lbu          s6, 7(a2)
                  lbu          a4, 9(t5)
                  sb           t6, -206(s4)
                  sw           s3, -185(s4)
                  lbu          t0, -59(s2)
                  lb           t4, -14(sp)
                  sb           a7, -15(a2)
                  lb           s1, -165(s4)
                  lhu          s1, -3(sp)
                  lb           s10, 3(a2)
                  lb           t1, 14(sp) #end load_store_instr_stream_4
                  sb           t4, -256(s4) #end load_store_instr_stream_2
                  sb           s10, -7(t5)
                  lbu          t4, 149(s2)
                  lb           t4, 2(a2)
                  sb           s9, 227(s2) #end load_store_instr_stream_3
                  lbu          s8, 9(a2) #end load_store_instr_stream_1
                  lw           s0, 6(t5) #end load_store_instr_stream_0
                  la           t6, region_0+1259 #start riscv_load_store_rand_instr_stream_13
                  c.xor        a4, a5
                  sll          s2, a6, s6
                  c.addi4spn   s1, sp, 576
                  c.xor        a3, a0
                  or           a6, t5, a4
                  lb           gp, 15(t6)
                  c.addi4spn   s1, sp, 64
                  and          a0, a4, gp
                  auipc        s0, 685350
                  lbu          s11, 12(t6)
                  c.li         tp, 0
                  slt          gp, t6, a5
                  sb           s11, 233(t6)
                  lb           s5, -65(t6)
                  slti         a2, t1, -935
                  mulh         a6, tp, s2
                  sb           a5, 186(t6)
                  sb           s7, 224(t6)
                  lh           s3, -169(t6)
                  lb           ra, -156(t6)
                  lbu          t1, -41(t6)
                  c.li         s1, 9
                  xori         a0, t2, 1094
                  sb           s7, -84(t6)
                  sltiu        t3, sp, -1343
                  lbu          t2, 192(t6)
                  slt          t1, t5, a0
                  lbu          s8, -158(t6)
                  lbu          sp, -245(t6)
                  c.li         t4, -1
                  sll          t5, a0, s7
                  xor          s9, s7, s5
                  c.slli       s6, 29
                  lbu          a0, 86(t6)
                  lbu          a4, 62(t6)
                  slli         s8, gp, 24
                  c.andi       a2, 1
                  remu         a0, s5, s6
                  sh           a5, 199(t6)
                  sb           a1, 72(t6)
                  xor          s5, gp, a6
                  c.addi       s3, 16
                  lbu          s11, 54(t6)
                  lh           a6, -77(t6)
                  c.addi       gp, 25
                  c.srli       a3, 30
                  lb           a2, 93(t6) #end riscv_load_store_rand_instr_stream_13
                  la           t0, amo_0+44 #start riscv_amo_instr_stream_5
                  amoadd.w.aq   a1, s1, (t0)
                  amomin.w.aq   s5, s5, (t0)
                  amoand.w      a3, s9, (t0)
                  amoswap.w.aq  s5, t1, (t0)
                  amomaxu.w.aq  a2, a6, (t0)
                  sll          s9, s4, tp
                  auipc        sp, 622874
                  amoor.w.aq    s3, gp, (t0)
                  auipc        t4, 932681
                  amoxor.w.rl   a3, s8, (t0) #end riscv_amo_instr_stream_5
                  la           sp, region_0+1198 #start riscv_hazard_instr_stream_18
                  lhu          tp, 16(sp)
                  lw           a0, 2(sp)
                  lbu          a3, -10(sp)
                  lb           tp, -13(sp)
                  divu         t5, a0, t5
                  lb           t2, -7(sp)
                  lbu          a3, 5(sp)
                  sh           t5, -10(sp)
                  addi         a0, s4, -2042
                  lui          tp, 669191
                  nop
                  sh           a0, 12(sp)
                  lbu          t2, -1(sp)
                  sb           s4, -13(sp)
                  sb           tp, -13(sp)
                  mulh         a3, s4, s4
                  lhu          tp, -2(sp)
                  add          a0, a0, s4
                  sh           t5, 16(sp)
                  lb           t5, -3(sp)
                  c.nop
                  slt          tp, s4, a0
                  srl          a0, tp, tp
                  sw           a3, -14(sp)
                  lh           tp, 16(sp)
                  div          t2, tp, s4
                  addi         a0, t2, -698
                  c.mv         s4, t2
                  lb           a3, 9(sp)
                  add          a3, s4, s4
                  lbu          tp, -5(sp)
                  lbu          a0, 16(sp)
                  sltiu        t2, s4, 613
                  slt          t5, t5, s4
                  sltiu        t2, a0, -1715
                  lh           tp, -6(sp)
                  slt          t2, t2, s4
                  lbu          a3, 13(sp)
                  sw           s4, -14(sp)
                  lhu          a0, -2(sp)
                  c.nop
                  andi         a3, t2, -494
                  lbu          t2, 9(sp)
                  c.slli       t5, 22
                  lh           a3, 8(sp)
                  lh           tp, -4(sp)
                  lhu          tp, -6(sp)
                  lbu          a0, 11(sp)
                  lbu          tp, 5(sp) #end riscv_hazard_instr_stream_18
main_59:          jal          ra, 5f
0:                c.j          12f
1:                c.j          3f
2:                jal          t1, 4f
3:                c.j          11f
4:                c.j          7f
5:                c.jal        8f
6:                c.j          0b
7:                jal          ra, 1b
8:                c.jal        2b
9:                jal          ra, 6b
10:               c.jal        9b
11:               c.j          10b
12:               srli         a0, a2, 10
                  la           ra, amo_0+56 #start riscv_amo_instr_stream_14
                  la           t6, amo_0+60
                  la           s8, amo_0+12
                  la           s3, amo_0+16
                  amoswap.w.aq  a2, s9, (s3)
                  amoor.w.rl    t1, s2, (s8)
                  amominu.w.rl  a0, s1, (s3)
                  add          a4, s0, s10
                  amomax.w.rl   zero, t4, (t6)
                  sll          sp, t4, a5
                  nop
                  amoxor.w.rl   t1, a2, (ra)
                  lui          a1, 71756
                  amoxor.w.rl   s11, t0, (ra) #end riscv_amo_instr_stream_14
                  addi         a3, zero, 1 #init loop 0 counter
                  addi         t3, zero, 7 #init loop 0 limit
                  c.srai       a0, 9
                  xori         s8, t6, 478
                  slt          s0, s10, t1
                  c.slli       a2, 6
                  add          a6, a4, a3
                  divu         t0, s3, t5
main_126_0_t:     auipc        s0, 522653
                  andi         s4, a3, 1743
                  addi         a3, a3, 8 #update loop 0 counter
                  or           s3, s10, t0
                  blt          a3, t3, main_126_0_t #branch for loop 0
                  addi         a0, s11, 1023
                  la           a4, region_0+1215 #start load_store_instr_stream_1
                  sb           a4, -1(a4)
                  la           s9, region_1+1667 #start load_store_instr_stream_0
                  lb           s11, 33(s9)
                  lbu          t5, -63(s9)
                  lbu          s8, -58(a4)
                  lh           t1, 55(s9)
                  lhu          t2, 15(a4)
                  sh           t0, -3(s9)
                  sh           a0, -47(a4)
                  lb           s2, 24(a4)
                  lb           s5, -5(s9)
                  sh           ra, 47(a4)
                  lhu          t3, 45(s9)
                  lbu          a2, 50(a4) #end load_store_instr_stream_1
                  sb           t5, -21(s9) #end load_store_instr_stream_0
                  la           ra, amo_0+4 #start riscv_amo_instr_stream_6
                  la           a2, amo_0+60
                  c.andi       a1, 7
                  srl          a0, t5, a0
                  amominu.w.aq  t0, s10, (a2)
                  sll          a6, a3, s1
                  amoadd.w      s4, s7, (ra)
                  amomax.w.aq   a6, t4, (a2)
                  amomax.w.aq   t5, a6, (a2)
                  amomin.w.aq   gp, zero, (ra) #end riscv_amo_instr_stream_6
                  la           s2, region_1+697 #start riscv_load_store_rand_instr_stream_4
                  lbu          sp, 5(s2)
                  sb           s1, 28(s2)
                  sb           a0, -112(s2)
                  sh           a0, 145(s2)
                  xor          s1, s6, t1
                  lbu          a2, -146(s2)
                  c.and        s0, a4
                  mul          s10, ra, a7
                  c.sub        a1, a1
                  xori         a0, zero, -1624
                  srai         a4, s3, 14
                  c.or         a2, a2
                  lbu          s10, 82(s2)
                  lbu          sp, 79(s2)
                  c.addi       s3, 22
                  lbu          sp, -51(s2)
                  srli         ra, a3, 15
                  sb           t2, 176(s2)
                  or           s8, tp, t4
                  lb           s8, -239(s2)
                  lbu          s0, -254(s2)
                  lh           sp, -205(s2)
                  sb           gp, -42(s2)
                  sw           a5, -113(s2)
                  lbu          s0, 220(s2)
                  sb           a1, -174(s2)
                  c.or         a3, a3
                  slt          ra, tp, a4
                  rem          a6, zero, s7
                  lb           gp, 76(s2)
                  lb           a4, 231(s2)
                  c.addi       t3, 29
                  srl          t6, zero, s3
                  lbu          s5, 0(s2)
                  lbu          s8, -10(s2) #end riscv_load_store_rand_instr_stream_4
                  la           sp, region_1+1229 #start riscv_load_store_rand_instr_stream_12
                  lb           s11, -824(sp)
                  sb           t5, 430(sp)
                  c.addi       a4, 2
                  sb           s10, -38(sp)
                  lh           a4, -383(sp)
                  xor          s0, a0, a5
                  lhu          a3, 249(sp)
                  sh           s8, 279(sp)
                  c.sub        a3, a4
                  lb           s1, -296(sp)
                  sb           a1, -928(sp)
                  auipc        a4, 307417
                  divu         t5, a5, s4
                  lb           s8, 706(sp)
                  mulhu        t4, gp, s9
                  slli         t6, a3, 0
                  sw           a4, -637(sp)
                  sltu         gp, gp, s3
                  or           s9, s11, sp
                  lb           t6, -1074(sp)
                  sb           a6, 767(sp)
                  lbu          s6, 120(sp)
                  sb           s4, -1077(sp)
                  divu         t2, s5, a5
                  ori          s0, s11, 423
                  sh           t3, -815(sp)
                  lhu          ra, -1025(sp)
                  srl          gp, s4, a2
                  lbu          t0, -1138(sp)
                  sb           a6, -452(sp)
                  lui          s5, 45773
                  andi         gp, s9, -1970
                  addi         t0, s1, 1487
                  sw           t5, 247(sp)
                  sltu         s2, s7, s6
                  lb           s1, -388(sp)
                  lbu          s4, -1056(sp)
                  lb           s1, 678(sp)
                  xor          zero, s0, zero
                  lh           s5, -809(sp)
                  lh           t3, -637(sp)
                  srl          ra, t5, s2
                  add          t2, a2, t6
                  sb           s10, 622(sp)
                  lb           s4, -734(sp)
                  lb           s11, -656(sp) #end riscv_load_store_rand_instr_stream_12
                  la           sp, region_1+1141 #start riscv_load_store_hazard_instr_stream_1
                  lb           t1, -165(sp)
                  lhu          s3, -165(sp)
                  sh           t6, -165(sp)
                  addi         gp, a0, -1441
                  lhu          t5, -165(sp)
                  slli         t1, a4, 24
                  lh           a0, -165(sp)
                  lhu          s4, -165(sp)
                  slt          s2, s7, s1
                  c.sub        s0, s0
                  sh           t6, -165(sp)
                  lb           ra, -165(sp)
                  lbu          s4, -165(sp)
                  sll          t2, zero, tp
                  andi         t3, gp, -800
                  lh           t5, -165(sp)
                  sb           s4, -165(sp)
                  sw           ra, -165(sp)
                  lbu          t0, -165(sp)
                  lb           a3, -165(sp)
                  lbu          s6, -165(sp)
                  mulhu        t4, s7, s4
                  sh           s8, -165(sp)
                  lbu          t6, -165(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           s5, region_1+1181 #start riscv_load_store_hazard_instr_stream_14
                  sltiu        a6, s10, 1819
                  mulhu        t1, tp, tp
                  sb           s1, 14(s5)
                  lw           s10, -37(s5)
                  lh           a2, -37(s5)
                  lb           zero, -37(s5)
                  lb           tp, -30(s5)
                  add          t3, a4, s4
                  lbu          a1, -30(s5)
                  sb           a7, -30(s5)
                  sra          a6, s6, t2
                  lbu          s0, 44(s5)
                  lb           s3, 44(s5)
                  sb           s7, 5(s5)
                  lbu          t1, 5(s5)
                  c.sub        s1, s1
                  auipc        t5, 255902
                  c.li         s11, -1
                  sb           a4, 16(s5) #end riscv_load_store_hazard_instr_stream_14
main_62:          jal          ra, 10f
0:                jal          ra, 11f
1:                c.j          0b
2:                jal          t1, 15f
3:                jal          ra, 14f
4:                c.jal        28f
5:                c.j          13f
6:                c.jal        9f
7:                c.jal        19f
8:                c.j          18f
9:                jal          ra, 17f
10:               c.j          26f
11:               c.j          7b
12:               c.j          24f
13:               c.j          12b
14:               c.j          1b
15:               c.jal        27f
16:               jal          ra, 25f
17:               c.j          5b
18:               c.jal        29f
19:               jal          ra, 22f
20:               c.jal        8b
21:               jal          t5, 3b
22:               jal          t1, 20b
23:               c.jal        4b
24:               jal          ra, 2b
25:               c.j          21b
26:               jal          ra, 23b
27:               c.j          16b
28:               c.jal        6b
29:               or           sp, s4, s1
main_67:          jal          ra, 7f
0:                c.jal        29f
1:                c.jal        15f
2:                jal          t1, 19f
3:                c.j          12f
4:                jal          ra, 24f
5:                jal          t5, 21f
6:                c.jal        16f
7:                c.jal        17f
8:                c.j          25f
9:                jal          t0, 1b
10:               c.j          8b
11:               c.j          4b
12:               c.j          14f
13:               c.j          11b
14:               jal          t1, 23f
15:               c.j          27f
16:               jal          t1, 9b
17:               c.jal        10b
18:               jal          t1, 5b
19:               c.jal        18b
20:               c.jal        3b
21:               c.j          6b
22:               jal          s11, 28f
23:               c.j          0b
24:               jal          ra, 26f
25:               c.j          22b
26:               c.j          20b
27:               jal          ra, 13b
28:               c.j          2b
29:               xor          t3, sp, a3
main_51:          jal          ra, 11f
0:                c.jal        2f
1:                c.j          5f
2:                jal          ra, 3f
3:                c.jal        17f
4:                c.j          20f
5:                c.jal        15f
6:                c.jal        4b
7:                c.jal        16f
8:                c.j          10f
9:                c.j          8b
10:               jal          s2, 13f
11:               c.j          0b
12:               c.j          18f
13:               jal          ra, 6b
14:               jal          ra, 9b
15:               jal          ra, 19f
16:               c.jal        12b
17:               c.j          7b
18:               jal          ra, 14b
19:               jal          t1, 21f
20:               jal          ra, 1b
21:               sub          s6, a4, t5
                  la           tp, region_0+1784 #start load_store_instr_stream_1
                  la           t0, region_1+991 #start load_store_instr_stream_0
                  sb           s3, 49(tp)
                  lb           a0, 12(tp)
                  lbu          t4, -17(tp)
                  lh           a3, -22(tp)
                  sb           s9, 162(t0)
                  lbu          t3, 31(tp)
                  lbu          t3, 184(t0)
                  lb           sp, -27(tp)
                  lh           s6, 16(tp)
                  sh           zero, -209(t0)
                  sb           a6, -50(tp)
                  sb           t6, -35(tp)
                  lbu          s4, 23(tp) #end load_store_instr_stream_1
                  lw           s10, -211(t0)
                  sb           t1, 118(t0) #end load_store_instr_stream_0
                  la           sp, region_1+508 #start riscv_hazard_instr_stream_2
                  divu         a3, s11, s10
                  lbu          a0, -200(sp)
                  mulhsu       a3, s11, s1
                  sw           a3, -152(sp)
                  c.mv         s8, s1
                  lh           a3, 62(sp)
                  sh           s8, -252(sp)
                  auipc        a3, 385631
                  sh           s8, -156(sp)
                  lbu          s10, 2(sp)
                  sb           s10, -212(sp)
                  rem          s10, s11, s11
                  sb           a0, -217(sp)
                  c.li         a3, -1
                  c.srai       a0, 1
                  lb           a3, 252(sp)
                  c.swsp       s8, 56(sp)
                  lbu          s10, 111(sp)
                  sb           s10, 1(sp)
                  sll          a0, s11, a3
                  lbu          s8, -178(sp)
                  lbu          a3, 98(sp)
                  mulhu        a0, s10, s8
                  mulhsu       s11, s1, a3
                  div          s10, s1, s10
                  c.mv         s1, a0
                  c.nop
                  lw           s11, 204(sp)
                  lb           a0, -168(sp)
                  c.andi       s1, 30
                  mulhsu       s1, a3, s1
                  lhu          s10, 14(sp)
                  c.addi       s10, -1
                  slti         a0, s8, -130
                  lb           s10, 1(sp)
                  lh           s8, 38(sp)
                  slti         s8, s1, 1696
                  c.srai       a3, 3
                  lh           s11, 130(sp) #end riscv_hazard_instr_stream_2
                  la           s8, region_0+938 #start riscv_load_store_rand_instr_stream_11
                  remu         s1, a0, a4
                  sb           s5, 12(s8)
                  xor          s2, t4, s4
                  add          s2, a2, t6
                  c.addi       a4, -1
                  remu         s10, t5, s8
                  lhu          s10, 2(s8)
                  c.sub        a2, a1
                  lh           t2, -12(s8)
                  remu         s1, a3, sp
                  lb           zero, 13(s8)
                  c.andi       a3, -1
                  lb           t5, 12(s8)
                  div          t2, t2, a2
                  lbu          t1, 11(s8)
                  lb           ra, -13(s8)
                  sb           t5, 4(s8)
                  c.slli       tp, 4
                  remu         ra, s6, a3
                  sra          zero, s11, zero
                  slli         t5, t2, 14
                  sb           a2, -3(s8)
                  lbu          s10, 3(s8)
                  lbu          a1, -5(s8)
                  sh           zero, 12(s8)
                  sll          t5, t0, a6
                  or           s3, t3, s9
                  lbu          tp, -1(s8)
                  sb           a0, 5(s8)
                  lb           a4, -10(s8)
                  sb           s10, -14(s8)
                  lhu          gp, 8(s8)
                  c.lui        s9, 17
                  add          s0, a2, t6
                  lb           a4, 14(s8)
                  sltu         s9, sp, s1
                  addi         sp, tp, 1183
                  slti         a3, s8, -1745
                  xor          t2, t5, t6
                  or           t2, s10, a3
                  xor          ra, a2, s11
                  slli         t1, t3, 2
                  sh           s0, -10(s8)
                  lhu          zero, -8(s8)
                  sw           a0, 14(s8)
                  lb           a4, -4(s8)
                  lb           zero, -9(s8) #end riscv_load_store_rand_instr_stream_11
                  la           t2, region_1+696 #start riscv_hazard_instr_stream_22
                  sra          t6, a1, sp
                  sh           a1, 822(t2)
                  c.addi       a1, 24
                  slli         a1, s11, 0
                  xori         sp, s11, -1904
                  xori         s11, a1, -1596
                  slli         sp, a1, 0
                  lb           t6, -187(t2)
                  andi         t6, s9, -1322
                  c.srli       a1, 15
                  lb           s9, 883(t2)
                  srl          s11, sp, a1
                  rem          sp, sp, s2
                  sw           a1, -232(t2)
                  div          t6, s2, s9
                  lb           s9, 887(t2)
                  c.sub        a1, a1
                  nop
                  sh           a1, 510(t2)
                  lbu          a1, 270(t2)
                  xori         s9, sp, 960
                  addi         t6, t6, 1828
                  slti         s11, sp, 1499
                  c.sub        a1, a1
                  c.addi16sp   sp, -16
                  sb           t6, 907(t2)
                  c.mv         a1, s9
                  remu         s11, sp, s9
                  c.xor        a1, a1
                  div          sp, s2, a1
                  srai         s11, a1, 8
                  sh           s2, 536(t2)
                  mulh         t6, s2, a1
                  c.mv         sp, s11
                  c.srai       a1, 23
                  addi         s2, a1, 1217
                  sb           sp, 672(t2) #end riscv_hazard_instr_stream_22
                  la           a2, region_0+347 #start riscv_hazard_instr_stream_16
                  c.xor        s0, s0
                  mulhu        s0, t3, s0
                  c.andi       s0, 14
                  lbu          t0, 90(a2)
                  lbu          s9, -135(a2)
                  mulhsu       sp, t3, t0
                  lbu          sp, 331(a2)
                  div          s4, s4, sp
                  lb           s4, 1261(a2)
                  sb           t3, 180(a2)
                  c.xor        s0, s0
                  auipc        s9, 400834
                  ori          s0, s9, 1651
                  ori          sp, t3, -1594
                  srl          t3, t3, s0
                  lb           s0, 795(a2)
                  lb           sp, -316(a2)
                  sb           s9, 706(a2)
                  lb           s0, 415(a2)
                  lhu          s0, 915(a2)
                  mulhsu       t0, s9, t3
                  c.slli       sp, 17
                  lbu          t3, 1298(a2)
                  sb           s0, 366(a2)
                  lhu          t0, -335(a2)
                  div          t3, s4, s4
                  sltu         sp, s9, t3
                  lb           t3, 576(a2)
                  lb           s0, 703(a2) #end riscv_hazard_instr_stream_16
                  la           tp, amo_0+60 #start riscv_lr_sc_instr_stream_0
                  mul          sp, a0, tp
                  sra          a2, a7, s4
                  c.or         a2, a1
                  lr.w.aq       a6, (tp)
                  or           ra, s1, s4
                  xor          s0, s0, a4
                  c.and        a0, a2
                  sc.w.rl       s8, s8, (tp) #end riscv_lr_sc_instr_stream_0
                  la           s9, amo_0+44 #start riscv_lr_sc_instr_stream_12
                  and          t3, a7, t5
                  lr.w          tp, (s9)
                  c.srai       s0, 8
                  sc.w          s3, t6, (s9) #end riscv_lr_sc_instr_stream_12
                  addi         a2, zero, 8 #init loop 0 counter
                  c.addi16sp   sp, 368
                  slli         s10, t4, 5
                  addi         zero, zero, 0 #init loop 0 limit
                  srli         t1, sp, 13
main_127_0_t:     mulhsu       s9, s0, ra
                  addi         a2, a2, -1 #update loop 0 counter
                  c.andi       a4, 20
                  lui          s11, 916877
                  xor          s2, a0, sp
                  c.and        a0, a4
                  and          s9, t0, a4
                  sub          gp, s0, s2
                  sra          s5, t6, t2
                  sltu         s8, tp, ra
                  c.slli       s8, 1
                  or           a3, a5, a1
                  mulhsu       s8, t4, a0
                  and          tp, s9, t2
                  c.sub        a0, a4
                  slli         a1, s10, 12
                  c.beqz       a2, main_127_0_t #branch for loop 0
                  mulhsu       s1, a3, s5
                  la           a4, region_0+297 #start riscv_load_store_rand_instr_stream_6
                  sll          t0, t1, zero
                  lb           s2, -16(a4)
                  auipc        t0, 489229
                  lb           s2, 4(a4)
                  divu         s1, a5, t6
                  lb           s0, -15(a4)
                  sb           tp, -15(a4)
                  lb           t2, 2(a4)
                  sltiu        a6, a6, -1509
                  sb           t5, 3(a4)
                  lb           s6, -8(a4)
                  sw           a6, -5(a4)
                  c.srai       a0, 28
                  srli         t4, s6, 13
                  sb           a1, -8(a4)
                  slti         a3, s3, 736
                  sb           ra, -8(a4)
                  c.addi       a2, -1
                  sb           t1, -2(a4)
                  nop
                  c.andi       a3, -1
                  lb           t3, 0(a4)
                  ori          s6, s2, -1643
                  sltiu        t6, sp, -10
                  lb           a3, 11(a4)
                  c.addi16sp   sp, 256
                  mulh         t3, s9, s9
                  c.or         a0, a3
                  c.srli       a2, 21
                  lb           t0, -8(a4)
                  srl          a6, t0, t2
                  mulhu        a1, t1, a1
                  sb           s0, 12(a4)
                  mul          s8, s4, a0
                  slti         s1, s2, -217
                  lbu          s3, -8(a4)
                  lbu          t6, -11(a4)
                  c.nop
                  sra          t3, tp, t3
                  sll          s4, s11, s1
                  lbu          s5, 8(a4)
                  lb           t5, 2(a4)
                  lw           s0, 7(a4)
                  lw           s8, -9(a4)
                  c.or         a0, s0
                  sb           a4, 1(a4)
                  sb           s9, 4(a4)
                  slti         s8, s8, -1506
                  lbu          s9, 8(a4)
                  remu         s11, a2, s5
                  slti         s1, s6, -693
                  lhu          a0, 7(a4) #end riscv_load_store_rand_instr_stream_6
                  la           s9, region_0+810 #start load_store_instr_stream_0
                  lhu          s4, -368(s9)
                  sh           s8, 1178(s9)
                  la           a1, region_1+275 #start load_store_instr_stream_1
                  lbu          a2, 547(s9)
                  lbu          gp, 264(s9)
                  sh           a2, 15(a1)
                  sb           s3, 1007(s9)
                  lbu          a6, -8(a1)
                  lh           gp, -1(a1)
                  lb           t6, -1(a1)
                  sh           s1, 246(s9)
                  lbu          t3, 1059(s9)
                  lh           s1, -9(a1)
                  lhu          a3, -9(a1)
                  sb           s2, 977(s9)
                  lhu          s6, -15(a1) #end load_store_instr_stream_1
                  lhu          t2, 1068(s9)
                  lbu          s8, -784(s9) #end load_store_instr_stream_0
                  la           a4, region_0+7 #start load_store_instr_stream_3
                  la           t1, region_0+1716 #start load_store_instr_stream_2
                  la           t4, region_0+1468 #start load_store_instr_stream_1
                  la           s8, region_0+26 #start load_store_instr_stream_0
                  lbu          t2, 48(s8)
                  lbu          s3, -1004(t4)
                  lb           t3, -26(t1)
                  sb           t1, 11(a4)
                  sb           a7, 14(a4)
                  lb           t3, 9(a4)
                  sh           tp, -4(t1)
                  lhu          t5, -7(a4)
                  lbu          zero, 12(a4)
                  sb           s2, 10(a4)
                  lb           s4, 199(t4)
                  lhu          s2, 14(t1)
                  sb           t3, 42(s8)
                  lb           gp, -724(t4)
                  lhu          t5, 48(t1)
                  lbu          s2, 9(s8)
                  sb           s10, -61(t1)
                  lh           s2, 38(s8)
                  lb           a2, -945(t4)
                  lhu          s9, 16(s8)
                  lb           a1, 109(t4)
                  lh           s10, -56(t1) #end load_store_instr_stream_2
                  lbu          s11, 2(a4) #end load_store_instr_stream_3
                  sh           s8, -644(t4) #end load_store_instr_stream_1
                  lbu          s9, 7(s8) #end load_store_instr_stream_0
                  addi         t6, zero, 9 #init loop 1 counter
                  addi         a2, zero, 19 #init loop 1 limit
main_128_1_t:     sub          a4, ra, sp
                  c.mv         s6, ra
                  addi         t6, t6, 9 #update loop 1 counter
                  c.mv         ra, a5
                  addi         s9, zero, 2 #init loop 0 counter
                  c.srai       s0, 23
                  addi         t4, zero, 10 #init loop 0 limit
                  c.addi       t0, -1
main_128_0_t:     div          t5, s1, s11
                  addi         s9, s9, 6 #update loop 0 counter
                  bltu         s9, t4, main_128_0_t #branch for loop 0
                  mul          s4, s4, a0
                  c.slli       s4, 15
                  mulh         s8, a3, a5
                  c.or         a3, a3
                  blt          t6, a2, main_128_1_t #branch for loop 1
                  c.add        s8, a0
                  la           s11, region_0+8 #start riscv_load_store_hazard_instr_stream_12
                  srl          a6, s0, a4
                  lhu          s8, 392(s11)
                  lbu          s8, 392(s11)
                  sb           t4, 392(s11)
                  lb           s6, 392(s11)
                  lh           s10, 392(s11)
                  lw           a6, 392(s11)
                  sh           s9, 1456(s11)
                  sw           s11, 1456(s11)
                  lbu          t0, 1456(s11)
                  c.mv         a3, s4
                  sb           t1, 1456(s11)
                  sw           t3, 1456(s11)
                  lb           s1, 1456(s11)
                  lhu          s2, 1456(s11)
                  lh           a3, 1456(s11)
                  sw           s8, 1456(s11)
                  lb           s8, 1199(s11)
                  lb           a2, 1199(s11) #end riscv_load_store_hazard_instr_stream_12
                  la           t1, region_1+670 #start load_store_instr_stream_0
                  sh           a6, -188(t1)
                  sb           t2, 1181(t1)
                  lb           gp, 960(t1)
                  la           t6, region_0+1525 #start load_store_instr_stream_1
                  lb           t0, -31(t1)
                  lbu          t2, 10(t6)
                  lbu          s9, 1164(t1)
                  sb           t4, 52(t6)
                  sb           t2, -24(t6)
                  sb           s8, 1260(t1)
                  lh           s1, 502(t1)
                  lhu          a2, 5(t6)
                  lh           a2, 15(t6) #end load_store_instr_stream_1
                  sb           t6, 989(t1) #end load_store_instr_stream_0
                  la           gp, region_1+555 #start load_store_instr_stream_1
                  la           t2, region_0+1726 #start load_store_instr_stream_0
                  sb           gp, 56(gp)
                  sb           a7, 50(gp)
                  lbu          s8, -845(t2)
                  lbu          a6, -1647(t2)
                  lb           a1, -369(t2)
                  sb           s7, -1067(t2)
                  lw           s10, 33(gp)
                  lb           a0, -462(t2)
                  sb           a2, -1309(t2)
                  lbu          t1, -565(t2)
                  sb           t3, -36(gp)
                  lbu          a1, -862(t2)
                  sh           a4, 35(gp) #end load_store_instr_stream_1
                  lbu          s6, -734(t2)
                  lb           s2, -1707(t2) #end load_store_instr_stream_0
                  la           gp, amo_0+36 #start riscv_lr_sc_instr_stream_7
                  sll          s3, s5, s0
                  slti         s8, s0, -948
                  xori         t5, a3, 1703
                  lr.w.aq       a2, (gp)
                  nop
                  lui          zero, 270759
                  sltiu        s0, s11, 1319
                  srli         a1, zero, 2
                  sra          ra, t1, ra
                  c.addi       s2, 14
                  c.mv         ra, s8
                  and          sp, a3, t0
                  sc.w.rl       s5, a0, (gp) #end riscv_lr_sc_instr_stream_7
                  la           t3, region_1+1643 #start load_store_instr_stream_1
                  la           s11, region_1+313 #start load_store_instr_stream_2
                  la           a4, region_1+1291 #start load_store_instr_stream_0
                  sw           t6, 225(a4)
                  sb           a0, 38(s11)
                  sb           t6, -82(t3)
                  sw           s3, 197(t3)
                  lh           a2, 21(s11)
                  sb           a6, -218(a4)
                  sw           t3, 43(s11)
                  lhu          a1, 53(s11)
                  lhu          a2, -31(t3)
                  lbu          a1, -90(t3)
                  sb           s1, 31(s11)
                  lb           a6, -62(s11)
                  sb           s6, -130(t3)
                  sb           t0, -21(s11)
                  sb           t1, -221(a4)
                  lbu          t0, -109(t3)
                  lw           tp, 133(a4)
                  lw           zero, -29(s11)
                  sb           a3, 150(t3) #end load_store_instr_stream_1
                  lbu          ra, -84(a4)
                  sb           s4, 30(s11)
                  lh           t2, 49(s11) #end load_store_instr_stream_2
                  sb           s9, 225(a4)
                  lb           s6, 32(a4) #end load_store_instr_stream_0
                  la           sp, region_1+1349 #start riscv_load_store_rand_instr_stream_15
                  c.xor        a3, a5
                  lhu          zero, 33(sp)
                  remu         s3, a5, a2
                  lh           a3, 39(sp)
                  sb           s7, -41(sp)
                  lbu          s4, -64(sp)
                  lh           s10, -31(sp)
                  c.addi       a0, -1
                  c.xor        s0, a5
                  mulh         s5, a2, t1
                  sltiu        s5, s10, 55
                  sw           a1, -9(sp)
                  divu         s8, t2, gp
                  remu         s0, a3, s5
                  c.li         s1, -1
                  addi         s3, s0, 357
                  sb           a1, 10(sp)
                  sh           a7, -15(sp)
                  lbu          a2, -27(sp)
                  lbu          s3, 26(sp)
                  lb           s8, -50(sp)
                  xori         s9, a0, -460
                  c.srai       a1, 12
                  sub          a4, a0, gp
                  sub          a1, s4, t0
                  ori          t5, a3, 1948
                  rem          a3, a6, t4
                  c.and        s0, s1
                  sh           t0, 33(sp)
                  lbu          t5, -32(sp)
                  sb           ra, -52(sp)
                  lb           ra, -28(sp)
                  sb           s6, -58(sp)
                  ori          s0, t5, 958
                  c.srli       a2, 27
                  sb           s2, 5(sp)
                  sw           t1, -9(sp)
                  c.sub        a0, a4
                  c.sub        a4, a5
                  lb           t6, 58(sp)
                  c.sub        a1, s0
                  lui          s4, 424462
                  c.srli       a4, 14
                  sb           t2, -14(sp)
                  nop
                  and          a3, tp, ra
                  mulh         a1, s5, s0
                  sb           a3, -6(sp) #end riscv_load_store_rand_instr_stream_15
                  la           ra, region_0+1472 #start riscv_load_store_rand_instr_stream_2
                  c.slli       s6, 25
                  lb           t4, 0(ra)
                  sw           s0, 16(ra)
                  sll          s3, s6, s3
                  mul          tp, s11, zero
                  add          t2, s9, s0
                  c.slli       a6, 9
                  lbu          gp, -1(ra)
                  lui          tp, 645062
                  sra          s8, a0, s2
                  sb           a6, 1(ra)
                  mulhu        s6, s9, s0
                  and          tp, t4, s9
                  addi         sp, t6, 1018
                  addi         a1, t1, 1333
                  c.and        s1, a0
                  sh           t0, 12(ra)
                  addi         t3, t5, 527
                  lb           s11, -5(ra)
                  lbu          a0, 16(ra)
                  srli         a2, s11, 11
                  sb           s3, 7(ra)
                  sb           sp, -13(ra)
                  lui          t3, 731988
                  c.slli       t1, 5
                  sb           tp, 13(ra)
                  c.nop
                  sh           s5, 10(ra)
                  sb           s2, 1(ra)
                  lbu          t3, 14(ra)
                  slti         tp, s9, -671
                  sb           t5, 15(ra)
                  c.addi       s9, -1
                  lb           sp, 13(ra)
                  lb           t2, 7(ra)
                  c.andi       a0, 13
                  lb           s1, 15(ra)
                  or           s5, gp, s5
                  mulhu        s9, s6, t5
                  sb           a7, -6(ra)
                  nop
                  mulhu        sp, t2, s4
                  srai         t4, t0, 28
                  sb           t6, 13(ra)
                  lhu          s8, -16(ra)
                  c.nop
                  lbu          a4, 7(ra) #end riscv_load_store_rand_instr_stream_2
                  la           sp, region_1+1414 #start riscv_hazard_instr_stream_0
                  c.xor        a3, a3
                  lbu          ra, -1218(sp)
                  lb           a2, -184(sp)
                  remu         ra, a1, ra
                  c.nop
                  div          t4, a1, a2
                  lh           t4, -1178(sp)
                  lhu          a2, 276(sp)
                  lb           ra, -314(sp)
                  lb           ra, -1269(sp)
                  rem          ra, a1, a3
                  sltu         t4, ra, ra
                  lb           t3, 151(sp)
                  sll          a1, a2, t3
                  lbu          a3, -759(sp)
                  lb           a3, -869(sp)
                  sltiu        t3, ra, 747
                  c.srai       a1, 14
                  srl          a3, a1, ra
                  c.xor        a3, a3
                  lui          a1, 994571
                  remu         t3, a2, t3
                  lb           a3, -484(sp)
                  sb           a3, -177(sp)
                  ori          a3, a1, 131
                  sll          t3, ra, t3
                  div          a3, a2, a2
                  sltiu        a1, a3, 1924
                  add          a2, t3, t4
                  slt          t3, ra, t3
                  lbu          t4, -351(sp)
                  lb           a1, -585(sp)
                  lbu          a3, -154(sp)
                  sw           t3, -1122(sp)
                  lui          ra, 73453
                  slt          t4, ra, t4
                  c.or         a1, a3
                  add          a2, ra, t4
                  sb           a3, -636(sp)
                  lb           a2, -959(sp)
                  add          a1, a3, a3
                  div          ra, t4, ra
                  c.mv         t3, t3
                  or           t3, a2, a3
                  rem          a1, t3, ra
                  c.li         t3, 9
                  lhu          t4, -1248(sp) #end riscv_hazard_instr_stream_0
                  la           s6, region_0+1277 #start riscv_load_store_rand_instr_stream_8
                  c.sub        a2, a5
                  lbu          s0, 101(s6)
                  c.xor        a4, a5
                  lhu          a6, -73(s6)
                  lb           t0, 170(s6)
                  sb           a5, -111(s6)
                  or           s10, zero, sp
                  lh           s5, 15(s6)
                  c.mv         a1, tp
                  lb           tp, 147(s6)
                  andi         t2, t4, -306
                  or           s9, s3, s2
                  sll          t5, s1, a1
                  ori          zero, ra, 530
                  addi         t6, s0, 795
                  sra          tp, s5, t5
                  c.xor        a0, a1
                  c.srli       s1, 16
                  addi         s10, s11, 1923
                  sh           zero, 79(s6)
                  c.and        s0, s0
                  sltiu        s2, s8, 1613
                  ori          t4, a5, -928
                  xori         s4, s4, 590
                  mulhu        a2, t2, t1
                  sb           s1, 55(s6)
                  lw           a4, -229(s6)
                  lh           s0, 181(s6)
                  lhu          s9, 27(s6)
                  andi         tp, a1, 1366
                  lh           zero, 45(s6) #end riscv_load_store_rand_instr_stream_8
                  la           s2, region_0+1190 #start load_store_instr_stream_3
                  la           s3, region_0+1116 #start load_store_instr_stream_2
                  la           t2, region_0+1858 #start load_store_instr_stream_0
                  sb           tp, 48(s3)
                  la           a6, region_0+1569 #start load_store_instr_stream_4
                  lbu          t4, 13(t2)
                  lbu          s4, 8(a6)
                  lbu          s4, 11(t2)
                  la           t0, region_0+146 #start load_store_instr_stream_1
                  lbu          t5, 153(t0)
                  sh           zero, -136(t0)
                  lb           t5, -53(s3)
                  sb           s7, -5(t2)
                  lh           s5, 15(a6)
                  lb           a1, -39(s2)
                  lb           a0, -59(s3)
                  lbu          t1, 7(t2)
                  sb           t3, 58(s2)
                  sb           zero, 50(s2)
                  lhu          t5, 13(a6)
                  lw           sp, -74(t0)
                  sb           s9, 33(s3)
                  lb           s0, 40(s2)
                  sb           a1, -7(t2)
                  sb           s9, 51(t0)
                  sb           t6, 4(a6)
                  sh           t6, -8(s2)
                  sb           s10, -127(t0)
                  lh           a4, 38(t0)
                  sw           t6, -44(s3)
                  sb           zero, -8(a6)
                  lbu          s1, 1(t2)
                  lhu          a2, 134(t0)
                  lw           gp, -5(a6) #end load_store_instr_stream_4
                  lhu          sp, 2(t2)
                  lb           a3, -33(s2)
                  sb           a6, 247(t0)
                  sb           s10, 27(s2) #end load_store_instr_stream_3
                  lb           zero, 239(t0) #end load_store_instr_stream_1
                  lb           t6, -49(s3) #end load_store_instr_stream_2
                  lb           s8, 6(t2) #end load_store_instr_stream_0
                  la           s5, region_1+1033 #start load_store_instr_stream_0
                  la           s10, region_0+1540 #start load_store_instr_stream_1
                  lb           t3, 49(s10)
                  lbu          s0, -36(s5)
                  lh           t4, -6(s10)
                  lbu          s11, 44(s5)
                  lbu          a2, 6(s10)
                  lh           gp, -50(s10)
                  sb           s6, 29(s5)
                  lh           s6, 47(s5)
                  lbu          s6, 15(s10)
                  sb           t4, 0(s10) #end load_store_instr_stream_1
                  lb           a4, 53(s5) #end load_store_instr_stream_0
                  la           s2, region_1+1270 #start riscv_hazard_instr_stream_11
                  lui          s0, 47425
                  srl          s5, s0, a4
                  div          a4, s0, s0
                  c.lui        t5, 28
                  c.andi       s0, 2
                  lbu          s5, -1125(s2)
                  slti         t4, s5, 317
                  c.slli       s5, 31
                  c.mv         a4, s0
                  lui          a4, 75914
                  andi         t4, s0, -1816
                  c.slli       s0, 28
                  sb           t5, 357(s2)
                  c.andi       s0, 18
                  addi         s0, a2, -1091
                  c.srli       s0, 4
                  xor          a2, t5, a4
                  xori         s5, t4, 340
                  addi         t5, t5, -1175
                  lb           t5, -1192(s2)
                  lbu          a2, 331(s2)
                  lb           t5, -797(s2)
                  mulh         a4, s0, s0
                  mulhsu       s0, s0, s5
                  or           s5, t4, t5
                  sb           a2, -479(s2)
                  lb           a4, 313(s2)
                  lb           t5, -302(s2)
                  c.slli       s5, 27
                  sb           s0, 280(s2)
                  div          s5, t5, s5
                  sw           t4, -50(s2)
                  c.mv         s0, s0
                  c.slli       s5, 23
                  sll          t4, a4, a4
                  xori         t5, a4, 344
                  c.mv         s5, a2
                  lh           s0, 334(s2) #end riscv_hazard_instr_stream_11
                  la           t3, region_0+1639 #start load_store_instr_stream_1
                  lb           s11, 4(t3)
                  la           s6, region_1+484 #start load_store_instr_stream_0
                  lb           a1, 0(t3)
                  lbu          ra, -2(s6)
                  lh           t0, -2(s6)
                  lbu          s2, 8(t3)
                  sh           s4, 10(s6)
                  lbu          s9, 2(t3)
                  lbu          s9, 9(s6)
                  lb           ra, -11(s6)
                  lbu          a6, -12(t3)
                  lbu          t6, 12(s6)
                  sh           s7, -13(t3)
                  sb           a0, 7(s6)
                  lb           s8, 6(t3)
                  lb           s5, -2(t3) #end load_store_instr_stream_1
                  lb           tp, 2(s6)
                  sh           s2, -2(s6) #end load_store_instr_stream_0
                  la           a2, amo_0+32 #start riscv_lr_sc_instr_stream_1
                  lr.w.aq       s11, (a2)
                  sc.w.aq       t4, a4, (a2) #end riscv_lr_sc_instr_stream_1
                  la           s10, amo_0+60 #start riscv_lr_sc_instr_stream_9
                  xori         s4, t6, -1441
                  c.mv         s0, t1
                  lr.w.aq       s2, (s10)
                  mulh         s4, s8, t6
                  sc.w          s1, a2, (s10) #end riscv_lr_sc_instr_stream_9
                  la           t0, region_0+801 #start riscv_load_store_hazard_instr_stream_15
                  sb           zero, 76(t0)
                  sb           a3, 177(t0)
                  lh           s10, 177(t0)
                  sb           t4, -142(t0)
                  c.lui        a4, 26
                  sb           t6, -179(t0)
                  mulh         s10, tp, t2
                  lbu          s6, -179(t0)
                  c.addi16sp   sp, -16
                  ori          t3, s2, 177
                  sh           a7, -179(t0)
                  lbu          t2, 94(t0)
                  lhu          a0, 105(t0)
                  sw           t1, -157(t0)
                  lb           t5, -157(t0)
                  lhu          s4, -157(t0)
                  lui          a2, 415718
                  lbu          s6, 47(t0) #end riscv_load_store_hazard_instr_stream_15
                  la           s5, region_1+1381 #start load_store_instr_stream_0
                  sb           t4, 0(s5)
                  la           tp, region_1+1136 #start load_store_instr_stream_1
                  lbu          s2, 40(s5)
                  lb           t6, 762(tp)
                  lhu          s6, 102(tp)
                  lb           t2, 41(s5)
                  lbu          a2, -954(tp)
                  lw           t6, 100(tp)
                  lbu          a2, 30(s5)
                  sb           s5, -729(tp)
                  sb           a7, 100(tp)
                  lb           ra, -15(s5)
                  lbu          s10, -756(tp) #end load_store_instr_stream_1
                  sb           a1, 55(s5) #end load_store_instr_stream_0
                  la           tp, region_0+1684 #start load_store_instr_stream_2
                  la           a3, region_0+1878 #start load_store_instr_stream_4
                  la           t0, region_0+426 #start load_store_instr_stream_1
                  la           t3, region_0+216 #start load_store_instr_stream_0
                  sb           a0, -8(t3)
                  sb           t5, -24(a3)
                  lbu          s4, -7(t3)
                  sb           ra, 37(a3)
                  la           s11, region_0+653 #start load_store_instr_stream_3
                  sw           a0, 794(t0)
                  lb           a1, -12(tp)
                  lb           s6, 9(tp)
                  lb           t2, 14(s11)
                  lh           t5, 762(t0)
                  sb           a1, 5(tp)
                  lb           t5, 2(t3)
                  lbu          gp, -14(s11)
                  lb           s10, 11(a3)
                  lbu          t6, 5(tp)
                  lb           s5, -35(a3)
                  lb           s3, 1100(t0)
                  lw           t1, -13(s11)
                  lbu          t5, -44(a3)
                  sw           a2, 18(t0)
                  lbu          t2, 13(t3)
                  lb           t5, 9(a3)
                  lw           s6, -13(s11)
                  lb           a4, 3(t0)
                  lb           t1, -13(tp) #end load_store_instr_stream_2
                  lb           t6, 14(s11)
                  sb           t5, -24(a3) #end load_store_instr_stream_4
                  sb           a2, 7(t3)
                  lhu          t1, 9(s11)
                  lb           sp, -381(t0) #end load_store_instr_stream_1
                  lbu          s3, 11(s11) #end load_store_instr_stream_3
                  lh           a4, 10(t3) #end load_store_instr_stream_0
                  la           a1, region_0+1705 #start riscv_load_store_hazard_instr_stream_21
                  lb           s6, -4(a1)
                  lb           s3, -4(a1)
                  lb           a3, -4(a1)
                  srai         t1, gp, 29
                  mulhsu       t3, tp, s6
                  lb           t1, -4(a1)
                  srl          t3, s8, s1
                  lb           s11, -4(a1)
                  lb           t0, -4(a1)
                  lb           s10, -13(a1)
                  lw           s3, -13(a1)
                  div          s9, tp, t1
                  lh           ra, -13(a1)
                  lb           a6, -13(a1)
                  xori         s0, t0, -1845
                  lbu          a3, 2(a1)
                  lbu          s0, 2(a1)
                  lb           a4, 2(a1) #end riscv_load_store_hazard_instr_stream_21
                  la           sp, region_0+33 #start riscv_hazard_instr_stream_3
                  lw           s0, 135(sp)
                  lbu          t3, 13(sp)
                  c.and        a0, a0
                  andi         t2, t2, 791
                  c.mv         a0, t3
                  lh           t3, 245(sp)
                  lh           a2, -13(sp)
                  lb           t3, 202(sp)
                  c.srli       a2, 8
                  c.addi       t3, 18
                  lbu          a0, 194(sp)
                  sb           zero, 91(sp)
                  lbu          t3, 247(sp)
                  mulhsu       a0, a2, t3
                  c.sub        a2, a0
                  sb           a2, 32(sp)
                  c.sub        a0, a2
                  lb           zero, 50(sp)
                  sb           a2, 158(sp)
                  andi         a2, s0, -160
                  sb           s0, 74(sp)
                  srli         a2, t3, 28
                  lbu          zero, 160(sp)
                  remu         zero, t3, s0
                  srl          zero, zero, zero
                  c.xor        a0, s0
                  and          s0, t2, a0
                  nop
                  lhu          a2, 207(sp)
                  lbu          a2, 156(sp)
                  and          t2, a0, a2
                  c.xor        a0, s0
                  lb           t3, 240(sp)
                  c.xor        s0, s0
                  rem          a0, a0, t3
                  sb           a0, 76(sp)
                  srai         t2, a2, 22
                  sb           a2, 62(sp)
                  lbu          s0, 243(sp)
                  c.andi       s0, -1
                  or           t3, t2, a2
                  lh           t3, 201(sp)
                  lbu          t3, 85(sp)
                  lb           zero, -26(sp)
                  lbu          t3, 44(sp) #end riscv_hazard_instr_stream_3
                  la           s8, region_0+1309 #start load_store_instr_stream_3
                  la           t6, region_0+287 #start load_store_instr_stream_0
                  lbu          a4, -8(t6)
                  la           a2, region_0+1658 #start load_store_instr_stream_2
                  la           s1, region_0+1519 #start load_store_instr_stream_1
                  lb           a4, 53(a2)
                  la           s0, region_0+140 #start load_store_instr_stream_4
                  sb           a0, -6(s8)
                  sb           t2, -8(s1)
                  lbu          t4, -35(s0)
                  sb           tp, 2(t6)
                  lb           t4, -17(s0)
                  lbu          a0, 13(s0)
                  sb           s3, 37(s8)
                  lbu          tp, 10(s1)
                  sb           a5, -10(s1)
                  sh           t5, -54(a2)
                  lb           a3, -4(s1)
                  lbu          s4, 10(s0)
                  lb           sp, -6(s8)
                  lbu          t0, 6(a2)
                  lb           t4, -15(t6)
                  sh           s10, -37(s8)
                  lb           t3, 1(s0)
                  sb           s6, 7(s1)
                  sb           s11, 16(t6)
                  lhu          gp, 34(a2)
                  lb           a6, 0(s8)
                  lb           s11, -14(s0) #end load_store_instr_stream_4
                  sb           gp, 12(t6)
                  sb           s10, -39(a2)
                  lh           s10, 9(s1)
                  lb           s10, -52(s8)
                  lh           t3, -48(a2) #end load_store_instr_stream_2
                  sh           a5, -19(s8) #end load_store_instr_stream_3
                  sh           s0, 13(t6)
                  lbu          t5, 5(t6)
                  lbu          t4, -10(s1) #end load_store_instr_stream_1
                  lb           sp, 12(t6) #end load_store_instr_stream_0
                  la           a3, amo_0+32 #start riscv_amo_instr_stream_3
                  la           gp, amo_0+40
                  la           t5, amo_0+0
                  la           s9, amo_0+40
                  amominu.w.aq  a2, s8, (t5)
                  rem          s4, s1, zero
                  sltiu        s10, s6, 414
                  c.or         a4, s1
                  amoadd.w.aq   s10, tp, (a3)
                  amoswap.w.rl  a0, sp, (s9)
                  amoadd.w.aq   s5, s10, (t5)
                  amomaxu.w     t6, s2, (a3)
                  amomax.w      t3, s8, (s9)
                  c.mv         s6, s0
                  c.andi       a4, 1
                  amomax.w.rl   a0, a6, (t5)
                  amominu.w.aq  tp, s10, (t5)
                  c.add        t0, t6
                  srli         t4, a1, 24
                  amoswap.w.rl  zero, t0, (gp)
                  c.mv         s8, s5
                  amoor.w       s1, t3, (gp) #end riscv_amo_instr_stream_3
main_53:          jal          ra, 9f
0:                jal          ra, 13f
1:                c.jal        22f
2:                jal          t1, 28f
3:                c.jal        7f
4:                c.j          24f
5:                c.jal        14f
6:                jal          ra, 18f
7:                c.j          23f
8:                jal          a4, 11f
9:                jal          t6, 15f
10:               jal          ra, 5b
11:               c.j          17f
12:               c.jal        4b
13:               jal          s5, 1b
14:               c.jal        26f
15:               c.jal        8b
16:               c.j          3b
17:               c.j          20f
18:               jal          ra, 25f
19:               c.jal        0b
20:               jal          ra, 10b
21:               c.jal        12b
22:               c.jal        21b
23:               c.jal        19b
24:               c.j          27f
25:               jal          t1, 2b
26:               c.jal        16b
27:               c.jal        6b
28:               c.li         tp, 25
                  addi         t2, zero, 0 #init loop 0 counter
                  addi         s6, zero, 14 #init loop 0 limit
main_132_0_t:     mulhsu       t1, tp, t6
                  sub          s11, ra, a1
                  addi         t2, t2, 6 #update loop 0 counter
                  c.sub        s0, a4
                  bltu         t2, s6, main_132_0_t #branch for loop 0
                  or           t1, s11, ra
                  la           a0, region_0+1369 #start riscv_load_store_hazard_instr_stream_23
                  sw           s11, -61(a0)
                  lw           s3, -61(a0)
                  lh           s10, -61(a0)
                  slli         a3, t0, 24
                  sb           a2, -61(a0)
                  sb           tp, 28(a0)
                  rem          tp, s6, a5
                  div          gp, a4, s8
                  lbu          gp, 28(a0)
                  lbu          s9, 28(a0)
                  sb           a2, 28(a0)
                  lbu          a3, 28(a0)
                  sb           s2, 14(a0)
                  sb           s6, 14(a0)
                  lh           s8, -37(a0) #end riscv_load_store_hazard_instr_stream_23
                  la           s2, region_0+1631 #start riscv_hazard_instr_stream_10
                  sub          a3, s10, a1
                  sb           gp, -1188(s2)
                  lbu          gp, -172(s2)
                  c.lui        a1, 5
                  sb           s4, -48(s2)
                  lhu          s10, -5(s2)
                  sh           a3, -103(s2)
                  sb           sp, -1194(s2)
                  rem          a1, s10, sp
                  sb           a3, -1609(s2)
                  andi         s4, sp, -710
                  lhu          s10, 219(s2)
                  lb           s10, -1617(s2)
                  lb           s4, -540(s2)
                  lbu          s10, -170(s2)
                  sb           gp, -1020(s2)
                  lb           a3, -818(s2)
                  sh           a3, -867(s2)
                  c.slli       s10, 2
                  lbu          sp, -633(s2)
                  lh           gp, -957(s2)
                  sra          a1, s4, a3
                  c.srai       a3, 5
                  lb           sp, -426(s2)
                  lb           a1, 304(s2)
                  lb           sp, -30(s2)
                  sh           gp, -1599(s2)
                  c.add        s10, a3
                  mul          a1, sp, s10
                  sh           a3, 125(s2)
                  sb           s10, -680(s2)
                  sb           s10, -354(s2)
                  c.addi16sp   sp, 128
                  lbu          a3, -402(s2)
                  nop
                  sw           s4, 341(s2)
                  sh           a3, -1255(s2)
                  lhu          gp, -1511(s2)
                  lhu          sp, 69(s2)
                  slli         a3, a1, 21
                  sb           sp, -641(s2)
                  mulh         s10, a1, gp
                  lbu          s4, -212(s2) #end riscv_hazard_instr_stream_10
                  slti         s3, tp, 375
                  srl          s1, s10, t2
                  slt          t1, s0, a7
                  bne          s3, t4, 4f
4:                divu         s1, a0, gp
                  bltu         a6, s5, 9f
                  c.slli       s10, 8
                  and          t4, a1, t2
                  bne          a1, s6, 19f
9:                lui          s5, 351762
                  c.srli       a2, 23
                  c.sub        a4, a2
                  c.li         t3, -1
                  mul          a4, s6, s0
                  lui          t1, 71466
                  rem          gp, s4, t1
                  c.nop
                  add          s2, sp, s5
                  divu         a0, s6, s1
19:               bne          zero, t2, 38f
                  c.lui        t3, 17
                  c.andi       a1, 6
                  c.bnez       a1, 39f
                  sra          s5, s6, tp
                  and          a0, sp, s9
                  slt          s4, s6, a1
                  c.addi16sp   sp, -16
                  c.srai       a3, 5
                  slt          gp, s7, ra
                  c.srai       a0, 14
                  srl          t0, a0, t0
                  auipc        a4, 87905
                  c.mv         a3, s7
                  c.srai       s0, 13
                  and          s9, t1, sp
                  or           s10, a3, gp
                  sltu         t3, s11, gp
                  mul          s2, tp, s8
38:               nop
39:               c.addi16sp   sp, 336
                  or           s10, tp, t1
                  srl          s1, a7, a5
                  c.addi16sp   sp, 64
                  or           s8, a5, s11
                  add          t0, ra, a4
                  c.addi       s8, 14
                  mulhu        s9, a3, a3
                  mulhu        t1, s2, s4
                  mulhsu       t0, zero, s10
                  sra          s2, t1, s2
                  c.lui        a3, 17
                  c.beqz       a1, 63f
                  slt          ra, tp, s3
                  sra          a3, t2, s10
                  lui          t4, 10511
                  c.xor        s1, s1
                  bgeu         s6, s10, 70f
                  sll          s10, t5, t2
                  or           t2, s10, t0
                  xor          a2, s5, s9
                  mul          t6, a3, zero
                  bltu         s11, t6, 73f
                  sltu         a2, a1, s2
63:               c.lui        s2, 12
                  slti         t5, s0, -1369
                  xor          s1, sp, s8
                  mulhu        s11, s0, a5
                  addi         sp, a0, 419
                  bne          t0, a0, 79f
                  srl          s4, t1, t4
70:               bge          s7, sp, 87f
                  c.andi       a2, -1
                  c.andi       a1, -1
73:               add          s11, tp, ra
                  xor          s9, t3, zero
                  div          t1, a7, sp
                  c.srai       a0, 13
                  mulh         s11, sp, t3
                  addi         sp, s5, 200
79:               c.xor        a2, a1
                  remu         s11, a0, a4
                  srli         s6, t2, 13
                  addi         t2, a3, 1103
                  or           t1, s2, a5
                  sra          a2, gp, a2
                  c.addi4spn   s1, sp, 64
                  c.sub        a2, a2
87:               rem          sp, s5, t1
                  c.addi       s5, 6
                  c.srai       a0, 18
                  add          tp, a3, a5
                  c.xor        a2, a3
                  slli         a2, a3, 14
                  beq          s5, s3, 105f
                  la           gp, region_0+1609 #start load_store_instr_stream_1
                  lbu          s4, 12(gp)
                  lb           t3, -7(gp)
                  la           t6, region_0+1625 #start load_store_instr_stream_0
                  sh           sp, 9(t6)
                  sb           a1, -4(t6)
                  lb           s3, 3(gp)
                  lb           a1, 16(gp)
                  sh           a1, 15(t6)
                  lb           s8, 13(gp)
                  lb           t4, 16(gp)
                  lhu          s0, -13(gp)
                  sb           s6, 10(gp)
                  lbu          s6, 5(gp)
                  lh           t2, -1(t6)
                  lb           a2, 4(gp) #end load_store_instr_stream_1
                  lb           a2, -4(t6) #end load_store_instr_stream_0
                  slt          s6, t0, a7
                  c.and        s1, a0
                  sra          zero, t0, s3
                  remu         sp, a1, a2
                  auipc        t6, 340356
                  slt          s6, t3, t3
                  sll          s5, t6, s10
                  bltu         s6, gp, 118f
                  mul          s0, a5, s4
                  c.lui        t6, 17
                  c.mv         s1, a2
105:              lui          t2, 450034
                  addi         s9, t1, -1531
                  c.beqz       a4, 116f
                  andi         s1, s1, -1188
                  add          a3, tp, t3
                  sltu         a6, s0, a4
                  divu         t3, s8, t2
                  xori         a2, a5, 270
                  bgeu         s0, t3, 121f
                  c.lui        s2, 8
                  c.bnez       a4, 123f
116:              c.srli       a3, 30
                  c.li         a1, -1
118:              c.xor        s1, a2
                  mulhsu       s5, s5, s8
                  c.add        s8, a3
121:              mulhu        t5, s8, t2
                  add          s4, t4, t4
123:              bge          tp, s9, 140f
                  c.xor        a3, s0
                  auipc        a6, 700744
                  c.bnez       a4, 131f
                  mul          a6, gp, s9
                  remu         s1, gp, zero
                  bne          s7, a0, 131f
                  c.xor        s0, a2
131:              c.li         a2, 17
                  mulh         s4, t2, s4
                  lui          a6, 541945
                  sltu         gp, s4, s3
                  beq          s1, s10, 136f
136:              c.nop
                  c.li         gp, -1
                  slli         t2, a2, 6
                  c.addi4spn   a2, sp, 944
140:              mulhu        a4, a1, a0
                  blt          s2, s4, 157f
                  c.slli       gp, 29
                  slt          tp, zero, s4
                  c.mv         s4, t1
                  mulh         a3, a6, a3
                  sra          t0, t2, s7
                  mulhu        t4, t0, gp
                  slli         a0, t3, 23
                  mulhu        a6, a4, t5
                  c.srai       a3, 3
                  mul          s8, gp, t4
                  sub          s0, s0, s10
                  c.srai       a2, 8
                  bltu         s0, a6, 167f
                  c.addi       ra, -1
                  blt          s5, a2, 172f
157:              and          s9, s11, a4
                  c.mv         s10, a4
                  blt          s3, s5, 162f
                  mulh         s3, s11, t6
                  addi         s3, a5, -1008
162:              rem          t2, s0, tp
                  sra          s6, a2, a5
                  bge          sp, s8, 171f
                  c.addi16sp   sp, 160
                  slt          s9, s1, s5
167:              c.addi4spn   a1, sp, 64
                  mulh         s9, s6, ra
                  c.xor        a2, a4
                  beq          t0, s7, 190f
171:              c.lui        a1, 19
172:              blt          s3, a3, 185f
                  div          a1, s8, t1
                  c.lui        a6, 3
                  c.add        s3, a6
                  sltu         t5, a1, t4
                  sltu         a6, a7, gp
                  c.srai       a0, 13
                  mul          a6, a0, t6
                  c.addi4spn   s1, sp, 528
                  and          gp, s4, tp
                  mulhu        t1, s3, s3
                  mulhu        s6, t5, a4
                  c.lui        s3, 22
185:              addi         a2, t2, 832
                  lui          t5, 447220
                  nop
                  bne          s8, zero, 202f
                  bgeu         s3, s0, 198f
190:              c.mv         t1, a0
                  slli         s1, ra, 24
                  c.addi       ra, -1
                  addi         s0, s7, 1033
                  bne          a0, gp, 195f
195:              div          sp, t1, a0
                  remu         t4, s5, t1
                  or           a6, t3, a5
198:              mulhsu       s2, t2, s3
                  bltu         a6, t6, 217f
                  slli         s8, s1, 12
                  or           a6, sp, t2
202:              c.or         a3, s0
                  bgeu         s5, gp, 211f
                  srli         s6, a7, 24
                  srl          s3, a2, a6
                  c.li         s4, -1
                  c.or         s1, a1
                  or           s10, s6, a6
                  c.slli       ra, 22
                  sll          t5, ra, s10
211:              slt          a4, sp, ra
                  divu         s6, ra, a5
                  srl          a0, s7, gp
                  and          s1, t5, t2
                  c.beqz       s0, 229f
                  xor          a6, t4, s9
217:              sltiu        a1, sp, -1534
                  mulh         s11, t2, tp
                  mul          s0, a2, a6
                  nop
                  and          a1, ra, a1
                  beq          a3, s8, 223f
223:              c.addi16sp   sp, 432
                  lui          s10, 151198
                  c.or         a2, s0
                  add          a6, s10, tp
                  mulh         s9, s6, a3
                  c.xor        a2, a4
229:              add          ra, s5, a4
                  c.add        sp, s9
                  c.andi       s1, 6
                  ori          a4, ra, -1969
                  c.srli       a1, 29
                  c.xor        s0, s1
                  and          a4, t4, t1
                  addi         s1, a4, -1021
                  c.xor        a2, a1
                  srli         ra, t4, 11
                  mulhsu       s11, s11, s10
                  beq          s10, sp, 249f
                  rem          t3, t4, a7
                  xori         a2, t4, -1798
                  bgeu         a5, tp, 255f
                  remu         t1, s8, t3
                  div          a2, s3, s2
                  or           s9, gp, s0
                  c.bnez       s1, 260f
                  c.srli       a3, 28
249:              c.addi4spn   a1, sp, 720
                  addi         s4, t1, -1955
                  c.srai       a1, 25
                  c.andi       a3, 9
                  xori         t1, t5, -86
                  mulhu        s0, a2, ra
255:              xori         s0, zero, -659
                  c.sub        a0, s0
                  mulhsu       s1, t5, a3
                  c.slli       s5, 14
                  c.andi       a4, 14
260:              divu         t0, a1, t1
                  remu         s2, a4, a0
                  andi         a2, a1, 31
                  c.beqz       s1, 276f
                  c.mv         a6, t1
                  add          s3, tp, s7
                  c.add        tp, s11
                  c.add        tp, s10
                  auipc        a2, 156928
                  blt          ra, a3, 283f
                  bgeu         s8, a5, 279f
                  addi         s3, s2, 137
                  rem          t3, t3, s5
                  sltu         a0, tp, t0
                  mul          a4, s2, s4
                  or           ra, s10, s8
276:              bge          t1, a3, 288f
                  srai         t4, s7, 4
                  sll          s8, s1, a1
279:              bgeu         s5, a1, 296f
                  beq          t1, s8, 284f
                  remu         s2, s2, s2
                  c.add        a0, s2
283:              divu         a3, a4, s8
284:              blt          s11, s7, 285f
285:              sll          s8, s11, a2
                  srai         s1, t6, 28
                  addi         a1, t4, 385
288:              xor          a4, tp, t6
                  c.sub        s0, a3
                  sltu         t4, s1, t2
                  addi         s11, zero, 970
                  srli         s2, zero, 9
                  c.srai       s1, 31
                  c.li         s11, -1
                  andi         s6, t2, -946
296:              mul          s11, a5, t2
                  bne          s6, a3, 314f
                  add          ra, ra, s11
                  ori          s3, t6, -624
                  c.srli       s1, 26
                  c.or         a2, a4
                  slti         s6, ra, 1148
                  auipc        s8, 393750
                  c.mv         s3, t6
                  nop
                  slti         ra, a2, 679
                  slli         zero, a6, 24
                  slli         a3, t5, 0
                  mulhsu       s6, tp, a6
                  c.addi       t1, 7
                  bne          s11, s0, 328f
                  mulhsu       a2, a0, ra
                  c.or         s0, a4
314:              c.sub        s1, s0
                  c.li         a4, 10
                  mul          gp, t2, t3
                  srai         t2, s4, 16
                  c.mv         a0, t1
                  auipc        a6, 895637
                  c.or         a4, s1
                  c.or         s0, s0
                  sra          zero, s0, t4
                  c.addi       t0, -1
                  c.nop
                  c.beqz       a2, 342f
                  bne          s4, a3, 337f
                  sra          gp, s9, a3
328:              and          t2, a3, zero
                  add          s6, t4, zero
                  auipc        a3, 912589
                  mulh         t1, t5, a0
                  bgeu         s2, a6, 343f
                  andi         a2, s5, 504
                  auipc        sp, 683831
                  c.sub        a2, s0
                  addi         gp, a3, -197
337:              sll          t4, a6, t2
                  c.addi       s4, -1
                  c.xor        a2, a4
                  sub          gp, a4, a2
                  remu         s0, s7, s6
342:              xor          gp, s2, t3
343:              rem          t4, s10, a0
                  xor          a2, t1, sp
                  nop
                  mul          t0, t6, s1
                  div          s3, a6, s10
                  mulhu        t2, s5, s4
                  sra          t3, tp, s2
                  mulh         s2, a5, s7
                  mulh         s10, a1, t3
                  lui          t5, 219356
                  slti         t1, s5, 756
                  bne          s9, sp, 356f
                  nop
356:              c.addi       s2, -1
                  sll          t5, t1, s8
                  lui          s5, 295076
                  c.beqz       a4, 378f
                  mulhsu       s0, s0, s5
                  slli         t2, s0, 30
                  c.xor        a3, s0
                  andi         t5, tp, -1698
                  slli         gp, tp, 31
                  remu         s8, t4, s9
                  c.bnez       a2, 367f
367:              c.addi4spn   a2, sp, 576
                  c.addi4spn   a0, sp, 976
                  auipc        t1, 917239
                  c.nop
                  c.mv         t5, ra
                  xori         s6, t0, 1830
                  ori          t3, s10, 484
                  mul          s0, a1, s10
                  xori         t1, s2, -1589
                  bgeu         s5, a6, 392f
                  c.srli       a0, 9
378:              sub          s10, a4, a1
                  c.srai       a0, 3
                  c.slli       gp, 14
                  beq          s2, a0, 397f
                  ori          t6, s2, 1914
                  add          s5, ra, s0
                  sll          s4, a5, s7
                  c.sub        a3, a2
                  mul          s9, ra, s10
                  sra          s1, s2, s0
                  div          s3, s1, s11
                  srai         gp, a1, 4
                  c.xor        a4, s0
                  mulhu        a6, t0, s10
392:              beq          s10, t3, 395f
                  mulhsu       t4, t5, a5
                  slli         s8, t2, 9
395:              c.add        s4, s10
                  add          a1, s10, a7
397:              andi         t3, sp, 1562
                  mulhu        t0, a4, s7
                  c.mv         t2, t2
                  ori          s10, sp, -270
                  c.sub        s0, s1
                  beq          a6, a2, 422f
                  lui          a1, 19158
                  c.add        sp, sp
                  mulh         t1, s4, s4
                  nop
                  auipc        t6, 223774
                  c.lui        a6, 1
                  c.addi       a4, 20
                  auipc        a2, 64129
                  rem          t1, t5, a4
                  rem          ra, a7, t2
                  rem          s1, t6, a6
                  c.xor        s0, a5
                  divu         a3, gp, a7
                  c.srai       a4, 19
                  c.andi       s0, -1
                  lui          t2, 390057
                  sra          a0, t6, a5
                  nop
                  c.or         a2, a4
422:              div          tp, s6, a7
                  c.andi       a0, -1
                  mulhu        s4, t6, s8
                  c.li         a2, -1
                  mulhsu       gp, t4, t3
                  add          a6, a7, s7
                  andi         s0, a7, 1084
                  c.srli       a1, 13
                  rem          a3, gp, s4
                  auipc        t1, 727007
                  c.lui        ra, 21
                  c.add        s4, s4
                  c.lui        a2, 6
                  xor          s11, sp, s9
                  srl          s10, s10, tp
                  c.slli       t2, 26
                  c.srli       s1, 24
                  mulh         tp, s6, s1
                  bgeu         a0, a4, 452f
                  bne          a0, t3, 448f
                  bgeu         s3, s3, 450f
                  ori          s3, t3, -695
                  rem          s0, a6, t2
                  c.addi4spn   a2, sp, 368
                  slli         s9, s1, 4
                  c.lui        s6, 13
448:              add          a4, t3, a3
                  mul          s8, t6, a7
450:              c.beqz       a1, 468f
                  mulhsu       t4, t6, t3
452:              c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  c.mv         s4, a7
                  divu         t1, t6, t4
                  c.or         a0, a4
                  auipc        s3, 116079
                  sltiu        s5, s9, 514
                  sub          s6, t5, a5
                  andi         s6, t6, -224
                  srli         gp, a2, 25
                  add          sp, a2, sp
                  c.andi       s0, -1
                  sra          s3, t4, s6
                  bltu         a2, t4, 470f
                  srl          t4, a6, zero
                  c.mv         sp, s2
468:              slt          t2, s1, a1
                  mulhsu       t6, a1, t4
470:              bge          s3, t6, 481f
                  xori         s10, a0, -1742
                  c.bnez       a4, 473f
473:              c.addi       a1, -1
                  c.li         a6, 13
                  andi         gp, ra, -1824
                  bgeu         t6, ra, 496f
                  c.or         a1, a4
                  sll          t1, t6, a7
                  bgeu         tp, a2, 497f
                  mulh         s10, s10, t4
481:              sltiu        a4, s11, -770
                  c.andi       a3, 17
                  ori          s8, a6, 1310
                  srai         t1, a2, 11
                  c.nop
                  or           a6, a1, s5
                  xori         tp, t1, -1656
                  addi         s1, t6, 1611
                  c.mv         a4, t4
                  c.srai       s1, 4
                  sub          a0, s8, a1
                  c.srai       a0, 29
                  c.lui        t2, 5
                  c.srai       s1, 23
                  or           sp, s7, a2
496:              c.sub        a3, a0
                  la           a1, region_0+127 #start riscv_load_store_rand_instr_stream_23
                  c.andi       a4, 18
                  lui          a3, 490709
                  mul          a4, a5, s2
                  slti         a4, t1, -1619
                  lb           gp, 210(a1)
                  lhu          t5, -79(a1)
                  lbu          a4, -34(a1)
                  c.li         a0, 3
                  lb           t0, 84(a1)
                  addi         s9, s2, 748
                  lb           s4, 231(a1)
                  srli         s10, s0, 5
                  c.nop
                  sltu         s0, t3, s4
                  lb           a0, 62(a1)
                  lb           t4, 146(a1)
                  div          s10, a6, s11
                  sb           t2, 35(a1)
                  lb           t0, 11(a1)
                  add          sp, t3, t2
                  slt          s6, zero, zero
                  lbu          a3, 61(a1)
                  mul          zero, a2, s0
                  sltu         s11, s1, a1
                  c.or         a3, a2
                  c.li         s1, 23
                  sh           a2, 63(a1)
                  sh           t6, -121(a1)
                  divu         s1, t0, s2
                  and          s0, s11, t5
                  slti         t2, a0, 832
                  sb           s4, -102(a1)
                  lbu          t3, 218(a1)
                  c.li         t5, -1
                  slt          zero, s9, a4
                  c.addi       sp, 12
                  c.slli       s4, 1
                  sb           s9, 224(a1)
                  remu         t5, a2, s0
                  add          t0, s8, a7
                  div          t4, zero, t1
                  andi         s2, s3, -1197
                  lbu          zero, -80(a1)
                  lhu          s11, 91(a1)
                  mulhu        s1, tp, s2
                  lb           a4, -110(a1) #end riscv_load_store_rand_instr_stream_23
497:              sra          a4, t6, ra
                  ori          sp, ra, 1796
                  mulhu        t6, s5, s5
                  c.addi       t0, 2
                  slli         s2, t6, 11
                  c.nop
                  bltu         s0, s9, 516f
                  srli         t2, t2, 22
                  c.addi16sp   sp, 176
                  and          t0, t0, t6
                  beq          gp, a3, 516f
                  c.sub        a4, a0
                  c.li         ra, -1
                  srl          a2, s1, tp
                  bgeu         sp, a7, 523f
                  c.bnez       a2, 529f
                  c.srai       s0, 3
                  slti         s0, sp, 1903
                  c.or         a0, a0
516:              sll          s5, s2, t6
                  slt          s2, a6, gp
                  c.addi16sp   sp, -16
                  xori         s4, a7, -1171
                  sltu         ra, t0, s10
                  la           sp, region_1+140 #start riscv_load_store_hazard_instr_stream_11
                  lb           t0, 1680(sp)
                  sh           a4, 1680(sp)
                  sh           t0, 1680(sp)
                  lb           s5, 1680(sp)
                  xor          s6, sp, a5
                  nop
                  lb           s10, 1680(sp)
                  sb           a1, 1680(sp)
                  mulhsu       a2, a5, t3
                  sw           t1, 1680(sp)
                  lh           t0, 1680(sp)
                  lh           zero, 1680(sp)
                  lw           a0, 1680(sp)
                  c.mv         s8, t1
                  lhu          s11, 1680(sp)
                  lb           tp, 1680(sp)
                  sh           sp, 1680(sp)
                  lh           s10, 1680(sp)
                  lbu          ra, 1680(sp)
                  lw           a4, 1680(sp)
                  sw           s4, 1680(sp)
                  lw           a2, 1680(sp)
                  sh           s6, 1680(sp) #end riscv_load_store_hazard_instr_stream_11
                  slti         a6, t0, 1992
                  c.addi4spn   s1, sp, 464
523:              srai         t1, s8, 26
                  mulhu        s9, a7, s7
                  bltu         t5, a4, 533f
                  div          s11, t1, a2
                  bne          s0, s9, 530f
                  bge          ra, a2, 541f
529:              nop
530:              c.andi       a4, 1
                  sll          s2, t5, ra
                  c.addi4spn   a2, sp, 608
533:              sub          t1, t6, a3
                  and          t1, s9, sp
                  c.addi4spn   a4, sp, 208
                  add          s1, s8, s8
                  c.lui        s10, 19
                  c.srli       a3, 30
                  mul          t4, s2, a0
                  sltu         t0, zero, s8
541:              c.slli       a1, 21
                  bltu         a0, s0, 550f
                  sltu         t4, gp, s6
                  c.addi16sp   sp, -16
                  c.addi       s8, 17
                  mulh         t2, ra, s0
                  blt          a0, a0, 556f
                  div          sp, s6, a1
                  sll          gp, a5, s0
550:              slti         s8, s6, 1739
                  c.addi4spn   a2, sp, 656
                  slti         s10, gp, -805
                  bgeu         s3, a6, 567f
                  srl          s8, s1, a0
                  c.addi       t1, -1
556:              bge          ra, t2, 573f
                  beq          t5, s9, 574f
                  c.bnez       a3, 570f
                  c.srli       s0, 29
                  mulh         t2, t2, t0
                  c.slli       t3, 30
                  andi         s0, t5, -2001
                  c.nop
                  c.li         t3, -1
                  c.sub        s1, s1
                  c.andi       a1, 3
567:              divu         t2, a0, s6
                  bltu         s5, s7, 570f
                  c.mv         t5, s7
570:              addi         s11, a4, -1126
                  slt          s8, t5, s10
                  c.addi16sp   sp, 224
573:              blt          s4, a0, 585f
574:              ori          s11, tp, 1151
                  slti         s10, a1, 1069
                  mulhsu       t3, a4, ra
                  srli         s5, s1, 8
                  div          a1, sp, s10
                  c.slli       s9, 8
                  sll          s2, t2, a6
                  c.slli       t5, 4
                  c.lui        s2, 1
                  addi         a0, s10, -183
                  and          gp, t5, a4
585:              bge          gp, zero, 602f
                  or           s9, t5, a0
                  c.xor        a2, a2
                  c.xor        a1, a2
                  slt          a1, t0, s2
                  nop
                  xor          s11, s5, sp
                  auipc        a2, 648244
                  auipc        t4, 21766
                  ori          a6, s5, -190
                  c.srli       a4, 7
                  add          a0, t6, sp
                  c.andi       a1, 24
                  slt          s11, t3, a2
                  c.addi4spn   s0, sp, 96
                  c.xor        a1, a3
                  c.mv         t1, s10
602:              remu         s4, sp, tp
                  rem          a1, s8, a1
                  srai         s9, s9, 17
                  sub          s10, s1, a0
                  sub          s10, a4, s11
                  and          s2, a0, gp
                  slli         gp, a3, 22
                  blt          s8, s0, 628f
                  add          s4, a2, s10
                  c.bnez       a3, 627f
                  mulh         ra, s5, s1
                  sltiu        tp, a7, 439
                  beq          s4, s6, 615f
615:              c.srli       a4, 29
                  sub          sp, t5, a0
                  bge          s9, a6, 631f
                  srai         t5, a0, 31
                  c.xor        s0, a3
                  blt          a0, a0, 636f
                  bne          t5, t6, 626f
                  c.addi16sp   sp, -16
                  bgeu         t5, t3, 634f
                  c.srli       a2, 9
                  c.andi       s0, -1
626:              bne          a4, t3, 627f
627:              bne          s7, s7, 631f
628:              mul          s9, s6, tp
                  c.or         s0, a0
                  slti         a1, s10, 671
631:              mulhu        t2, tp, a1
                  srli         t2, s4, 29
                  sltu         s3, s9, a1
634:              c.add        s2, s5
                  bne          s5, a4, 642f
636:              xori         s11, s3, 1482
                  srli         t2, tp, 7
                  c.sub        a0, a0
                  andi         t2, a5, 1251
                  div          tp, tp, a1
                  srli         a1, tp, 24
642:              xor          t5, s7, t3
                  c.bnez       a0, 650f
                  or           t0, s2, tp
                  mulhsu       s6, a0, s2
                  bgeu         t3, s8, 657f
                  c.nop
                  bge          a6, tp, 659f
                  c.lui        a4, 18
650:              lui          s8, 817618
                  bltu         s8, a3, 667f
                  addi         t2, s0, 895
                  slli         t5, s4, 29
                  c.srai       s0, 15
                  slti         s0, s5, 1007
                  c.slli       gp, 17
657:              c.lui        a4, 29
                  sltiu        t1, s7, 1584
659:              auipc        s6, 112030
                  auipc        zero, 286137
                  mulhu        s6, t3, gp
                  srl          s3, a4, sp
                  bne          s6, a5, 679f
                  c.xor        a3, a2
                  bne          gp, s9, 667f
                  nop
667:              c.srai       s1, 16
                  sub          s10, t1, s10
                  xor          a4, t4, a4
                  mulhu        s9, s10, a3
                  sll          t3, a2, ra
                  bge          s1, t2, 680f
                  div          zero, s4, a3
                  c.or         a3, a2
                  c.slli       tp, 2
                  blt          s4, tp, 681f
                  c.nop
                  mulhu        gp, s6, a3
679:              auipc        s10, 178390
680:              c.bnez       a2, 697f
681:              nop
                  rem          t4, s11, s7
                  c.and        a3, a4
                  bge          s4, gp, 696f
                  sll          t6, t6, t2
                  auipc        s1, 1016066
                  slt          gp, sp, s1
                  c.bnez       a1, 701f
                  c.nop
                  remu         s10, s9, sp
                  add          s3, s11, tp
                  auipc        s6, 583787
                  rem          t2, s3, a2
                  sltu         t6, s7, s3
                  ori          tp, s9, -1542
696:              bne          s3, s4, 713f
697:              bge          sp, t4, 716f
                  xor          gp, a3, s2
                  c.bnez       a0, 717f
                  rem          s9, t0, s9
701:              bgeu         t3, t0, 715f
                  divu         s11, t1, s1
                  nop
                  c.addi16sp   sp, 432
                  div          s4, a1, s4
                  srai         s6, ra, 23
                  c.xor        a4, a0
                  slt          tp, s9, a0
                  srl          t4, sp, t1
                  c.add        t3, s11
                  ori          a6, a5, 111
                  bltu         s10, t2, 720f
713:              c.xor        a3, s1
                  c.slli       s2, 30
715:              c.add        s9, s5
716:              or           a3, s6, s10
717:              c.bnez       a4, 721f
                  c.beqz       s0, 730f
                  c.addi16sp   sp, -16
720:              auipc        s2, 294916
721:              remu         t3, a6, a6
                  srl          s11, s6, s5
                  blt          s3, t5, 743f
                  mulhu        s0, sp, a6
                  mulhu        a2, a7, t1
                  sll          a4, a4, s5
                  c.li         s6, -1
                  mulhu        s0, t4, s3
                  bgeu         s7, t6, 730f
730:              c.sub        a4, s1
                  mulhu        s4, zero, a0
                  c.slli       ra, 10
                  c.xor        a1, a4
                  slli         a0, s3, 15
                  blt          sp, t2, 748f
                  slti         s8, s0, -254
                  bltu         a2, s5, 746f
                  divu         s9, zero, s9
                  sub          t4, t3, s9
                  andi         s10, s7, 913
                  auipc        t1, 458391
                  beq          a7, zero, 759f
743:              c.srai       s0, 7
                  ori          a1, a2, -1851
                  c.lui        gp, 18
746:              slli         t6, s5, 5
                  ori          s6, a3, -343
748:              c.beqz       a4, 749f
749:              c.andi       s0, 9
                  c.li         s9, -1
                  addi         a3, s10, 1784
                  slli         s1, a5, 1
                  c.or         s0, a2
                  sltiu        a6, a5, 1772
                  sub          s5, s5, s11
                  or           s1, s9, s6
                  auipc        tp, 286828
                  div          s0, s10, t2
759:              mul          t4, t6, s10
                  c.mv         s0, t2
                  sub          s8, s6, t4
                  srai         tp, t3, 6
                  mulhu        a0, t1, t4
                  c.addi16sp   sp, -16
                  mul          ra, s10, a2
                  div          s10, tp, a3
                  nop
                  c.mv         a1, s3
                  sltu         s0, s6, a3
                  sll          sp, t3, t1
                  sltu         t4, s0, s6
                  bge          s2, s3, 786f
                  slti         s11, a2, -1430
                  lui          sp, 125541
                  nop
                  slt          s6, s11, s3
                  bne          a6, t1, 778f
778:              slt          t6, s8, s6
                  blt          s0, a4, 796f
                  auipc        zero, 376180
                  c.andi       a3, 6
                  srli         a0, a1, 11
                  c.lui        t1, 28
                  c.addi16sp   sp, -16
                  c.beqz       s0, 797f
786:              srai         t4, ra, 19
                  div          s9, t1, t2
                  sll          zero, t1, a7
                  c.addi16sp   sp, -16
                  sltu         tp, a6, t3
                  c.or         a4, a0
                  c.slli       t5, 1
                  bne          a1, a6, 802f
                  xori         sp, s9, -574
                  beq          s8, s10, 798f
796:              c.addi4spn   a3, sp, 480
797:              mulhu        a1, t2, a4
798:              add          s8, tp, s6
                  remu         t3, ra, a4
                  c.addi4spn   a4, sp, 384
                  c.slli       s3, 15
802:              c.xor        a3, a0
                  beq          t5, s3, 816f
                  c.srli       a0, 15
                  c.add        s11, s7
                  c.or         s1, a3
                  bgeu         t4, a3, 820f
                  sll          t5, a7, sp
                  c.srli       a2, 15
                  ori          s4, gp, -351
                  xor          a4, gp, t3
                  c.xor        a0, a3
                  nop
                  sra          t3, ra, a6
                  mulhu        t4, s0, t3
816:              c.srli       a2, 29
                  add          s3, s4, s5
                  slti         tp, s10, 1424
                  bne          a2, s4, 836f
820:              c.lui        tp, 30
                  ori          s4, a6, -1126
                  div          s1, s10, t0
                  c.bnez       s0, 835f
                  slt          a4, ra, s10
                  auipc        s9, 787702
                  beq          s9, a3, 834f
                  c.addi4spn   a4, sp, 880
                  andi         sp, a1, 1774
                  or           t6, zero, a3
                  srl          s1, gp, t3
                  div          t0, a4, t2
                  c.add        a1, t5
                  sra          t1, s5, a4
834:              rem          s9, tp, zero
835:              c.mv         t2, t6
836:              nop
                  c.addi16sp   sp, -16
                  c.bnez       s1, 850f
                  c.slli       s10, 2
                  srli         t1, a5, 0
                  c.beqz       a1, 855f
                  xori         t4, tp, -1885
                  c.add        s6, s0
                  c.slli       s6, 1
                  auipc        s2, 203689
                  add          t1, s11, s10
                  ori          t6, t0, -1261
                  andi         t5, s10, 1107
                  add          t0, a5, a7
850:              srai         sp, s5, 9
                  blt          a3, s4, 860f
                  mulhsu       t4, s5, t3
                  c.and        a0, a2
                  nop
855:              sltiu        s0, s10, -635
                  sra          a2, a2, t3
                  addi         s1, t3, 1771
                  c.lui        gp, 17
                  mul          a0, a3, a2
860:              c.beqz       a2, 879f
                  c.xor        a0, a2
                  c.add        a1, sp
                  c.slli       ra, 27
                  mulhu        s6, a5, zero
                  bge          t1, s4, 866f
866:              sub          gp, t3, s6
                  c.slli       ra, 19
                  mulhu        a3, s11, s10
                  mulh         a2, t3, a0
                  or           a6, s3, s8
                  bge          sp, t0, 873f
                  xori         a1, s10, 1687
873:              srai         t3, s0, 4
                  add          tp, s10, s5
                  mulhsu       s6, s7, a1
                  srli         ra, t3, 23
                  mulhsu       s5, s1, t4
                  c.beqz       a2, 881f
879:              sra          s6, s6, s0
                  slt          s5, a2, a3
881:              srl          a2, t2, s8
                  sub          a6, t4, s3
                  xor          t6, s1, t5
                  c.srli       a3, 3
                  c.addi16sp   sp, -16
                  lui          t2, 680028
                  remu         s10, a3, s5
                  c.nop
                  bgeu         t0, s5, 906f
                  div          zero, t2, s8
                  mulh         t2, s6, t3
                  slt          t1, a4, s4
                  c.sub        a2, a5
                  c.srli       a3, 22
                  xor          zero, t5, ra
                  beq          a7, s6, 900f
                  lui          s0, 212497
                  c.srai       s0, 6
                  bge          a4, s2, 915f
900:              c.andi       s1, -1
                  c.bnez       a3, 919f
                  c.slli       a6, 10
                  sltiu        t3, a6, 674
                  blt          a6, ra, 913f
                  c.bnez       a3, 921f
906:              bge          t6, a1, 913f
                  c.slli       t5, 20
                  c.addi16sp   sp, -16
                  c.addi       t5, -1
                  bne          s2, a0, 930f
                  c.or         a2, s0
                  sltiu        a1, s11, 1978
913:              sltu         zero, s8, s5
                  c.nop
915:              xor          s0, sp, a2
                  addi         s0, gp, 55
                  sll          a2, a6, a5
                  c.add        a0, a4
919:              srai         ra, s8, 8
                  auipc        s6, 21070
921:              remu         tp, s7, t2
                  xori         a4, a2, -1982
                  sub          t0, s5, s11
                  remu         zero, ra, a6
                  beq          s9, t5, 926f
926:              nop
                  slti         s0, s11, 724
                  c.slli       t2, 5
                  c.slli       s2, 26
930:              remu         t0, s6, a3
                  nop
                  auipc        t4, 191189
                  andi         tp, gp, -1435
                  sltiu        a2, t2, 51
                  slt          s0, a2, a1
                  c.addi       s4, -1
                  c.lui        s2, 27
                  remu         s8, s9, a3
                  c.beqz       a4, 956f
                  c.li         s8, -1
                  auipc        a0, 956317
                  c.li         a2, -1
                  c.andi       a4, 20
                  srl          s6, a6, s9
                  beq          a0, a2, 962f
                  c.mv         t5, a2
                  c.lui        a1, 8
                  add          t0, sp, s0
                  lui          zero, 844698
                  c.xor        s1, a1
                  beq          a1, t5, 965f
                  c.beqz       a4, 963f
                  addi         s1, t2, 86
                  c.bnez       a1, 965f
                  c.mv         s2, s10
956:              c.addi16sp   sp, -16
                  c.slli       tp, 9
                  div          a2, s0, a4
                  sltiu        s0, a1, -405
                  slli         a3, a4, 21
                  bgeu         s9, s3, 966f
962:              ori          s10, a1, 387
963:              c.addi4spn   a1, sp, 784
                  c.srai       s1, 4
965:              c.xor        a4, a0
966:              or           gp, t3, s3
                  c.li         a0, 20
                  c.andi       s1, -1
                  sub          s2, tp, s3
                  rem          s11, s7, a7
                  c.or         a3, s0
                  bge          s8, t6, 984f
                  srli         tp, s9, 19
                  mulh         s4, t6, zero
                  c.addi4spn   s1, sp, 608
                  ori          t6, t0, 1674
                  xor          zero, a3, s4
                  andi         a2, tp, -490
                  blt          s10, gp, 987f
                  c.lui        s0, 20
                  blt          s2, sp, 982f
982:              c.mv         tp, gp
                  andi         t3, a2, -500
984:              srli         s9, a3, 28
                  addi         t5, s0, -59
                  bltu         t4, a4, 1006f
987:              divu         s5, s2, a5
                  c.slli       t0, 9
                  sltiu        a4, s3, 1131
                  sub          a4, t3, s9
                  c.add        t3, t5
                  srai         ra, a1, 14
                  divu         ra, a2, s11
                  andi         s10, t4, -1213
                  slt          s2, gp, s3
                  slt          s3, ra, a5
                  c.mv         a3, t6
                  rem          a4, s11, a3
                  xori         a1, s8, 1729
                  c.addi4spn   a2, sp, 608
                  c.srli       a0, 2
                  mulh         a0, a7, a6
                  c.andi       a0, 20
                  slli         s11, a4, 30
                  c.bnez       a2, 1017f
1006:             bltu         a5, s5, 1022f
                  andi         a3, gp, 234
                  c.addi       ra, 20
                  c.add        s0, s4
                  lui          s5, 171487
                  nop
                  bne          s1, t6, 1024f
                  c.nop
                  beq          s0, t1, 1027f
                  sltu         a6, s6, a0
                  c.li         s3, 16
1017:             bne          t3, gp, 1026f
                  remu         s9, a7, t1
                  bne          s8, t4, 1036f
                  c.li         a6, 5
                  addi         zero, s9, -603
1022:             bge          s1, a4, 1030f
                  srai         t4, t5, 5
1024:             c.addi       s4, -1
                  xor          s1, s8, s4
1026:             sltiu        s0, tp, 331
1027:             ori          s5, a1, 1337
                  c.slli       a2, 28
                  div          s6, s9, a1
1030:             mulh         s5, s8, s11
                  remu         a2, a7, s4
                  rem          s4, t3, s3
                  bgeu         a4, s5, 1046f
                  c.xor        a0, a5
                  c.bnez       a1, 1046f
1036:             c.lui        a4, 17
                  div          t0, ra, s10
                  c.andi       s1, 27
                  c.srli       s0, 12
                  or           s4, a3, s2
                  slli         a2, s3, 16
                  auipc        s10, 406598
                  mulhsu       t1, a3, t1
                  lui          gp, 713544
main_52:          jal          ra, 8f
0:                c.jal        3f
1:                c.j          28f
2:                c.jal        12f
3:                jal          gp, 18f
4:                c.jal        26f
5:                jal          t2, 21f
6:                c.jal        23f
7:                jal          t6, 19f
8:                c.j          20f
9:                c.jal        30f
10:               c.jal        7b
11:               c.j          6b
12:               jal          ra, 0b
13:               jal          t1, 9b
14:               jal          ra, 10b
15:               c.jal        14b
16:               jal          tp, 2b
17:               c.j          27f
18:               c.jal        11b
19:               c.j          16b
20:               c.j          22f
21:               jal          ra, 25f
22:               c.j          5b
23:               c.j          4b
24:               c.j          29f
25:               c.jal        24b
26:               jal          ra, 13b
27:               jal          tp, 15b
28:               c.jal        17b
29:               c.jal        1b
30:               add          a1, s7, a3
                  c.srli       a4, 6
1046:             c.xor        a4, a4
                  c.and        s0, a3
                  xori         s1, s9, 1120
                  bgeu         t4, s8, 1050f
1050:             sll          s6, ra, s5
                  c.mv         a2, ra
                  c.srai       s0, 28
                  c.add        a4, s3
                  remu         a2, s3, s7
                  bne          sp, tp, 1069f
                  c.addi4spn   a0, sp, 320
                  c.and        a3, a3
                  beq          t4, s4, 1062f
                  remu         s6, s7, s9
                  andi         s0, t0, -493
                  xor          s0, s4, a1
1062:             mulhu        sp, t0, s1
                  blt          a1, s11, 1064f
1064:             c.li         s11, -1
                  srli         zero, s2, 21
                  c.srli       a4, 2
                  c.addi       s8, -1
                  mulh         s9, s8, a6
1069:             sltu         s2, t4, s8
                  lui          s0, 1036804
                  c.beqz       s1, 1073f
                  div          t1, zero, t3
1073:             nop
                  c.srai       a0, 24
                  mulh         t2, a6, zero
                  beq          s11, t3, 1094f
                  sltu         s8, t2, a6
                  c.slli       sp, 3
                  bne          a3, a6, 1082f
                  c.xor        a1, a0
                  slli         a1, s10, 2
1082:             c.nop
                  andi         s0, zero, 187
                  addi         t0, s0, 218
                  slti         a0, t2, 483
                  bne          a5, a5, 1097f
                  and          t4, s10, a0
                  srli         s11, a3, 18
                  xori         s3, ra, -516
                  sra          t1, a3, s2
                  divu         s8, s2, s3
                  c.slli       a4, 4
                  and          s4, a6, t3
1094:             slli         t6, s7, 1
                  c.xor        a0, a3
                  ori          a3, t0, -362
1097:             srl          sp, a7, t2
                  andi         s9, s7, -1530
                  xor          s5, s0, s9
                  c.lui        gp, 22
                  mul          zero, s3, s0
                  c.and        a2, a3
                  srli         s8, a1, 31
                  ori          s3, s0, -1308
                  c.addi4spn   a2, sp, 32
                  srai         s2, a2, 4
                  mulh         a0, a4, s2
                  c.addi4spn   s1, sp, 752
                  ori          s11, a0, 1508
                  rem          s8, s3, ra
                  mulhu        a2, s1, s0
                  srli         ra, a1, 15
                  mulh         t6, a3, a3
                  c.and        a2, s1
                  mulhsu       tp, t3, tp
                  div          tp, s2, tp
                  bge          s0, sp, 1122f
                  c.mv         a3, s2
                  c.xor        a3, a2
                  c.bnez       a2, 1137f
                  auipc        a4, 263217
1122:             c.add        s1, s8
                  c.srli       a3, 1
                  slti         s4, s0, 1368
                  ori          t2, s4, 1087
                  c.nop
                  sra          a1, a6, t4
                  rem          a0, s6, tp
                  c.or         a2, a3
                  remu         t0, s3, s2
                  mulhsu       gp, a6, t1
                  sub          tp, s0, sp
                  c.slli       s1, 18
                  mulhu        s2, ra, s7
                  ori          t0, t6, -1572
                  bne          s8, s2, 1143f
1137:             div          s10, s9, s8
                  srli         s1, s2, 12
                  sub          a0, s1, a7
                  c.add        s4, sp
                  mul          s11, sp, sp
                  blt          s2, sp, 1159f
1143:             bltu         a1, t1, 1151f
                  mulh         a4, s11, a0
                  bgeu         a1, s11, 1146f
1146:             addi         s4, a4, 1010
                  mulhsu       s0, a3, ra
                  mulhsu       s5, a4, s9
                  lui          t1, 964838
                  c.addi       a6, -1
1151:             c.li         s8, 23
                  sra          t0, s0, tp
                  slti         t0, a0, 617
                  c.xor        s1, a0
                  sltiu        t6, t4, 536
                  add          t0, t1, s6
                  srai         s11, tp, 14
                  c.and        s0, a5
1159:             srl          s10, a6, t4
                  remu         gp, a5, a2
                  mulhu        a3, s11, a6
                  srl          t5, sp, a0
                  c.srai       s0, 31
                  c.li         sp, -1
                  nop
                  c.lui        gp, 3
                  c.addi4spn   a2, sp, 624
                  xori         a4, s7, 1315
                  c.addi16sp   sp, 272
                  xori         t5, s4, 1315
                  c.srai       a4, 10
                  bgeu         t0, t0, 1181f
                  c.mv         t1, s6
                  xori         a0, s7, 477
                  ori          zero, s3, -2015
                  remu         a1, tp, s1
                  xori         zero, s9, -1593
                  div          a3, s3, zero
                  xor          ra, t0, s10
                  sra          s11, a6, s4
1181:             sltiu        s8, t3, 224
                  c.or         a4, s0
                  c.addi16sp   sp, 80
                  sll          a0, t2, s10
                  c.bnez       s1, 1197f
                  slti         a2, t0, -859
                  bne          a6, a1, 1201f
                  c.beqz       a1, 1207f
                  bne          zero, t6, 1206f
                  rem          s10, t1, gp
                  c.xor        a2, s1
                  sll          t4, s11, s1
                  c.addi4spn   a4, sp, 720
                  sll          a1, a2, s5
                  sra          t5, t2, t1
                  add          s0, t1, t4
1197:             divu         a6, t2, s10
                  c.xor        a2, a1
                  c.nop
                  c.li         t2, 11
1201:             auipc        s5, 255864
                  remu         s3, s3, ra
                  c.addi4spn   a3, sp, 304
                  sltu         t5, s7, a4
                  c.beqz       a2, 1221f
1206:             c.lui        a1, 15
1207:             sll          t0, t4, s0
                  bltu         s0, t5, 1211f
                  addi         a2, s4, -486
                  c.beqz       s1, 1227f
1211:             c.beqz       a2, 1215f
                  andi         a0, a5, 1404
                  blt          t0, s2, 1230f
                  c.sub        a0, s0
1215:             lui          t4, 348463
                  or           s11, s3, t3
                  sll          s4, a0, a2
                  c.addi       tp, 30
                  c.bnez       a2, 1226f
                  c.lui        s5, 14
1221:             c.addi4spn   a3, sp, 784
                  mulhu        s9, s2, a0
                  c.addi       t6, -1
                  slli         s9, a7, 11
                  sltiu        s5, gp, -1808
1226:             c.andi       a4, 11
1227:             remu         t3, s8, ra
                  divu         s5, s5, s7
                  ori          s5, s4, -1016
1230:             ori          s10, s5, 1345
                  auipc        s4, 686718
                  c.addi16sp   sp, 336
                  c.addi16sp   sp, 256
                  auipc        t5, 494412
                  auipc        gp, 452340
                  bgeu         ra, s1, 1245f
                  sra          s5, a5, a6
                  c.addi       s4, 1
                  and          t0, zero, gp
                  bge          gp, s6, 1254f
                  bge          t1, t1, 1242f
1242:             nop
                  slt          ra, s9, s8
                  slt          s0, t6, s0
1245:             sub          s1, a1, tp
                  ori          t1, a7, 176
                  c.lui        t0, 23
                  mulhsu       s8, a4, a2
                  bltu         s1, s11, 1263f
                  slti         t4, zero, 14
                  mulhsu       s5, s3, t4
                  c.bnez       a3, 1272f
                  c.bnez       s0, 1254f
1254:             c.li         s8, 12
                  mulhu        tp, a5, t0
                  c.or         a1, a3
                  and          s0, s8, sp
                  beq          t5, s11, 1266f
                  xori         s11, t2, 235
                  c.bnez       s1, 1279f
                  c.srli       a0, 20
                  ori          s11, s11, 342
1263:             mulhu        s1, zero, t1
                  blt          sp, s8, 1276f
                  slli         s1, t5, 17
1266:             blt          s10, s6, 1267f
1267:             c.srli       a2, 21
                  andi         zero, s7, -1720
                  andi         s6, t5, -172
                  srl          ra, a0, s4
                  bltu         zero, a0, 1287f
                  la           t0, amo_0+40 #start riscv_amo_instr_stream_10
                  la           s3, amo_0+44
                  la           s0, amo_0+28
                  la           s6, amo_0+16
                  amomin.w      a1, ra, (s0)
                  amoxor.w.aq   t3, t3, (t0)
                  add          sp, zero, t4
                  amoand.w.rl   a1, a1, (t0)
                  amoadd.w      s9, t1, (s0)
                  amoor.w.rl    ra, s1, (s6)
                  amomax.w      a2, sp, (s0)
                  amoor.w       s11, s11, (s6) #end riscv_amo_instr_stream_10
1272:             ori          tp, a6, -671
                  sub          t0, s7, gp
                  c.addi4spn   s0, sp, 16
                  beq          a2, t4, 1291f
1276:             c.andi       s1, 5
                  beq          t3, s0, 1294f
                  c.or         a3, a4
1279:             remu         s3, s0, a1
                  auipc        a0, 6300
                  bltu         a1, t5, 1283f
                  c.addi16sp   sp, 128
1283:             sub          a0, t2, s1
                  divu         a3, t5, s10
                  beq          s4, s1, 1298f
                  auipc        a2, 367089
1287:             auipc        t6, 230263
                  c.addi       s6, -1
                  c.xor        a2, a5
                  auipc        a0, 535438
1291:             auipc        a4, 370924
                  beq          a7, a5, 1310f
                  bltu         s8, a5, 1302f
1294:             c.add        ra, s11
                  remu         a0, a7, a1
                  c.nop
                  sll          t2, s8, s6
1298:             slli         ra, t1, 8
                  c.sub        s0, a2
                  beq          a1, s3, 1311f
                  c.or         a3, a1
1302:             addi         tp, t6, -578
                  srl          s5, a3, s2
                  c.srli       a4, 15
                  and          t5, a1, s11
                  sltu         s10, s9, t0
                  bne          a7, t6, 1315f
                  mul          a6, sp, s10
                  xor          t1, s10, s0
1310:             auipc        s6, 678022
1311:             c.or         a3, s1
                  c.beqz       a0, 1329f
                  divu         s2, s5, a4
                  c.mv         t0, a5
1315:             c.addi4spn   s1, sp, 752
                  mulh         t0, a2, a0
                  mulh         a4, s2, ra
                  ori          a2, t1, -1986
                  addi         s3, s10, -886
                  sll          gp, sp, sp
                  bge          s10, t2, 1332f
                  bltu         a0, zero, 1327f
                  srai         a1, t3, 13
                  nop
                  c.and        a1, a5
                  c.xor        a1, s0
1327:             bltu         a1, s9, 1339f
                  c.mv         s9, t3
1329:             srli         sp, s10, 28
                  c.xor        s0, a1
                  slli         t2, t3, 26
1332:             c.slli       t1, 28
                  c.beqz       s0, 1345f
                  c.sub        a2, a0
                  srli         t5, a5, 14
                  sltiu        s5, s9, -578
                  c.bnez       a0, 1350f
                  c.add        a4, s2
1339:             mulh         t1, t5, ra
                  mulhu        s9, a4, t6
                  bltu         t1, s1, 1358f
                  slt          a3, a1, tp
                  mulhsu       s1, ra, tp
                  c.addi4spn   a0, sp, 336
1345:             slt          s2, t0, a2
                  c.or         a0, a4
                  c.slli       s9, 8
                  mul          t6, s7, s3
                  c.andi       a1, 22
1350:             ori          a6, sp, -731
                  nop
                  sub          a6, t0, a2
                  c.addi       gp, 8
                  c.li         gp, -1
                  c.andi       a3, 15
                  or           s1, a4, s10
                  c.addi       t3, 26
1358:             mulh         a0, a6, s2
                  auipc        s3, 236236
                  remu         s3, a1, a0
                  sltiu        t5, s10, -1614
                  sltu         t4, a1, a7
                  c.srli       a1, 31
                  mul          s8, a6, t6
                  beq          a6, t0, 1373f
                  c.bnez       a0, 1378f
                  c.bnez       a0, 1374f
                  divu         a4, s5, gp
                  blt          s8, s10, 1378f
                  mulh         t6, t2, s8
                  xor          sp, s3, ra
                  mul          s10, s1, t6
1373:             mul          s10, t6, t2
1374:             sltu         s4, s2, s1
                  xori         s6, s1, 1884
                  c.sub        a3, s0
                  addi         zero, s4, 1500
1378:             mulhsu       s2, s2, s8
                  sll          s1, ra, s4
                  c.addi4spn   s1, sp, 832
                  and          ra, s9, a0
                  mulhsu       a1, sp, a7
                  andi         gp, a4, -1699
                  bltu         s7, s6, 1387f
                  c.bnez       a3, 1404f
                  sub          a3, s2, s1
1387:             remu         a1, a1, a0
                  c.bnez       a0, 1402f
                  c.addi4spn   a2, sp, 752
                  c.and        a4, s0
                  xori         a3, a1, 1554
                  sltiu        s10, t3, 1669
                  ori          s11, s8, -151
                  c.addi16sp   sp, -16
                  c.slli       s11, 15
                  c.beqz       a1, 1397f
1397:             sra          s4, s1, a1
                  c.beqz       a4, 1409f
                  rem          s0, sp, s11
                  sltiu        t0, a7, 1776
                  c.andi       a4, -1
1402:             addi         t1, a6, -1735
                  slt          t6, t6, ra
1404:             srl          s5, s5, gp
                  div          s4, s2, s4
                  c.addi16sp   sp, -16
                  nop
                  mul          s5, t4, a3
1409:             xor          s8, s5, gp
                  slli         t4, sp, 2
                  c.srai       a4, 3
                  c.bnez       s0, 1424f
                  rem          t3, a4, s5
                  c.sub        s1, a0
                  sra          t3, s0, t3
                  xor          a1, s4, a1
                  sll          t4, t4, a2
                  sll          a1, s9, a5
                  mulhsu       a3, tp, t0
                  c.sub        a0, s0
                  c.or         a4, s1
                  c.lui        s8, 13
                  addi         a2, s6, 1657
1424:             c.srli       a4, 27
                  srli         sp, t6, 14
                  c.andi       s0, 10
                  c.srli       a2, 14
                  sll          t2, t5, a7
                  c.slli       s3, 16
                  c.and        a4, a3
                  xori         a0, t6, 45
                  add          a0, s9, a4
                  auipc        s4, 33438
                  mulhsu       a2, sp, s10
                  slt          gp, s0, a4
                  c.srai       a1, 22
                  la           a3, region_0+991 #start load_store_instr_stream_0
                  la           a6, region_0+94 #start load_store_instr_stream_3
                  la           a0, region_0+569 #start load_store_instr_stream_2
                  sh           s2, -22(a6)
                  la           t0, region_0+41 #start load_store_instr_stream_1
                  lb           a4, 5(t0)
                  lbu          t4, 834(a0)
                  lbu          s11, 33(a6)
                  lb           t4, 170(a3)
                  lhu          s11, 441(a0)
                  lb           a4, 52(t0)
                  lb           s11, 980(a0)
                  lbu          s5, -57(a6)
                  sb           s10, 1191(a0)
                  lb           zero, 23(a6)
                  lb           gp, 116(a3)
                  sb           t3, 516(a0)
                  lbu          s6, -19(t0)
                  lbu          a1, 56(a6) #end load_store_instr_stream_3
                  sh           ra, 197(a3)
                  lb           s6, 755(a0)
                  sb           s7, -110(a3)
                  lbu          t1, 973(a0) #end load_store_instr_stream_2
                  lbu          s5, -11(t0)
                  lb           s9, 240(a3)
                  lb           s2, 28(t0) #end load_store_instr_stream_1
                  lb           t6, -206(a3)
                  lb           s9, -66(a3) #end load_store_instr_stream_0
                  add          t4, t4, a5
                  c.andi       a1, 20
                  or           a2, s0, a0
                  c.xor        a3, s0
                  bge          a4, a5, 1457f
                  bgeu         gp, s4, 1447f
                  slli         a2, s7, 20
                  srai         a1, s8, 29
                  div          s5, s1, a1
                  xor          ra, s7, t6
1447:             nop
                  slti         t6, a5, -1614
                  slt          s4, a0, t1
                  divu         s8, s8, s0
                  addi         s9, a6, -1946
                  srl          s1, t0, ra
                  c.addi       a4, -1
                  c.bnez       a1, 1474f
                  c.mv         a6, a4
                  and          t2, s8, t3
1457:             slli         s6, a5, 25
                  c.srai       a3, 22
                  c.xor        s0, a2
                  slli         tp, t2, 10
                  sub          zero, t1, t6
                  srl          s3, a0, a0
                  c.addi       sp, -1
                  div          tp, t2, s0
                  bge          t5, a7, 1478f
                  add          s1, a1, zero
                  c.add        sp, a6
                  c.add        t3, a0
                  c.addi16sp   sp, 64
                  c.addi4spn   s0, sp, 528
                  blt          s5, a3, 1488f
                  c.and        a4, a3
                  mulh         a3, s5, gp
1474:             c.li         t3, 20
                  c.slli       gp, 10
                  sltiu        t3, s10, 1424
                  nop
1478:             mulh         zero, s4, s7
                  xor          s2, s8, gp
                  divu         s0, s5, t3
                  c.srli       a3, 19
                  sll          s9, s5, s9
                  sltiu        s10, t2, 657
                  sltiu        s2, t5, 1954
                  sub          a0, s0, a4
                  sra          s8, ra, a1
                  c.and        s0, a4
1488:             c.beqz       a4, 1506f
                  andi         a3, a5, -1056
                  c.addi16sp   sp, -16
                  c.mv         t0, gp
                  c.addi       s4, 1
                  lui          a2, 377774
                  addi         t6, t2, -1516
                  ori          a3, s2, -748
                  sltu         s5, s2, a1
                  c.or         s1, s1
                  add          s0, t4, s9
                  add          t3, a1, a6
                  mulhsu       a3, ra, t1
                  addi         s8, s9, -1321
                  auipc        a0, 195377
                  c.lui        t2, 4
                  andi         t3, t3, 1849
                  lui          ra, 723161
1506:             c.li         t5, 8
                  c.addi16sp   sp, 224
                  c.addi16sp   sp, -16
                  srli         s2, ra, 18
                  bne          s10, t3, 1524f
                  bge          t2, s4, 1528f
                  sltu         t5, a2, t2
                  divu         ra, a3, t6
                  c.addi       a6, -1
                  div          t1, a6, sp
                  mulh         s8, ra, s9
                  srli         s6, a5, 11
                  div          s10, a7, zero
                  c.andi       a0, -1
                  xor          t6, a4, a4
                  mulhu        t5, gp, s1
                  mulhu        s10, a1, a1
                  bge          a6, sp, 1531f
1524:             xor          t2, s3, t1
                  xor          t3, t1, t5
                  lui          s8, 612076
                  c.xor        a2, a0
1528:             sltiu        s3, s8, -663
                  rem          s10, sp, ra
                  xori         a6, a2, -944
1531:             or           t6, a0, a7
                  rem          a6, gp, a5
                  blt          tp, s5, 1545f
                  and          t0, a3, a3
                  sltu         zero, s6, t6
                  c.and        a4, a3
                  sub          s5, a1, s0
                  srli         t1, s4, 6
                  c.sub        a3, s1
                  mulh         a0, s10, t5
                  auipc        a1, 499880
                  add          s5, a5, a7
                  xor          a2, zero, s0
                  auipc        s11, 845742
1545:             c.addi4spn   a2, sp, 192
                  andi         s5, t0, 190
                  c.beqz       s0, 1549f
                  c.srai       a1, 22
1549:             c.srli       a1, 3
                  c.slli       ra, 18
                  rem          s4, a3, s6
                  slti         s1, s3, -859
                  or           s10, a6, t5
                  sub          a2, t1, s9
                  c.and        a4, a4
                  c.bnez       a1, 1567f
                  mul          zero, gp, s7
                  remu         gp, a6, s2
                  c.srai       s0, 21
                  div          t4, s0, s2
                  div          gp, s11, a0
                  c.srli       a4, 18
                  mulhu        ra, a3, s10
                  xori         t4, ra, -1273
                  blt          t0, s10, 1566f
1566:             c.srli       s0, 8
1567:             srai         a3, s9, 24
                  slti         s6, zero, 699
                  c.add        t6, s6
                  c.add        s0, gp
                  bgeu         a2, s11, 1580f
                  c.or         s1, a0
                  c.nop
                  slti         t6, s1, 1682
                  andi         a1, a6, 1010
                  divu         s9, a5, t2
                  beq          t3, s9, 1581f
                  add          s5, a2, s4
                  c.xor        s0, a0
1580:             c.bnez       s1, 1581f
1581:             bne          s2, s1, 1598f
                  lui          t3, 637716
                  bge          a6, a5, 1599f
                  remu         s5, t6, t0
                  c.andi       s0, -1
                  blt          s11, s10, 1599f
                  addi         s11, a7, -1620
                  c.addi16sp   sp, -16
                  c.and        a1, s0
                  c.addi4spn   s1, sp, 496
                  beq          s2, a7, 1604f
                  xor          s1, s4, s6
                  c.addi       sp, 10
                  slli         s8, a2, 22
                  c.sub        a3, a0
                  c.srai       a1, 27
                  sltu         s4, s4, s11
1598:             slt          t0, a3, t0
1599:             xori         t5, a6, 475
                  bgeu         a6, a3, 1612f
                  sll          s2, a3, t3
                  sll          a2, a5, s6
                  nop
1604:             srai         tp, s2, 8
                  c.sub        a4, a2
                  remu         s1, a0, s4
                  or           s5, a1, zero
                  c.add        a6, s3
                  xor          a6, a1, t4
                  srl          s10, t1, a0
                  c.xor        a3, a2
1612:             c.lui        ra, 29
                  c.srli       a4, 9
                  and          s5, t2, sp
                  addi         s8, s3, 1216
                  mulh         a6, t5, a5
                  slt          t2, s10, s2
                  mulh         t2, a7, s9
                  sub          t6, a6, a3
                  c.li         s1, -1
                  beq          t2, t4, 1628f
                  c.addi4spn   s0, sp, 144
                  srli         a1, s1, 22
                  add          a6, s10, a0
                  bltu         s7, t4, 1626f
1626:             c.add        t6, s10
                  sltu         t2, s3, t0
1628:             sltu         s1, s9, s11
                  c.srli       a2, 13
                  slli         a4, s5, 4
                  c.sub        a3, a3
                  mulhu        a0, a5, zero
                  c.and        a1, a1
                  c.lui        ra, 11
                  c.or         a4, s0
                  c.srai       a4, 13
                  or           s8, a6, s0
                  or           s4, t1, a1
                  bltu         t5, t0, 1647f
                  srli         a3, a5, 8
                  c.addi       a2, -1
                  rem          tp, s7, s10
                  c.sub        a2, s1
                  bgeu         s2, ra, 1656f
                  addi         s11, s2, -62
                  sub          a2, s6, a0
1647:             bgeu         s8, t5, 1664f
                  slti         a6, s5, 138
                  c.addi       s4, -1
                  sltu         s6, t6, a3
                  lui          t6, 893943
                  sltiu        a4, s3, 394
                  bge          t5, s4, 1654f
1654:             or           s9, s6, s11
                  divu         s6, a7, a7
1656:             c.sub        a0, a4
                  bne          s0, s0, 1658f
1658:             sub          a2, tp, a5
                  c.andi       a0, -1
                  div          a2, s2, s4
                  ori          gp, a2, -1826
                  c.lui        a1, 30
                  and          s2, a0, s5
1664:             bltu         a6, s11, 1678f
                  mulh         tp, s1, s7
                  mulh         s2, t4, ra
                  srl          a2, s8, a6
                  srli         s2, s5, 3
                  blt          s10, a7, 1673f
                  slti         s3, sp, -1431
                  slt          a1, s6, gp
                  c.srli       a0, 26
1673:             bge          tp, s8, 1689f
                  sub          a3, a3, a3
                  c.xor        a4, a2
                  ori          s0, s2, -296
                  sll          zero, s9, gp
1678:             lui          a2, 149916
                  c.li         t0, -1
                  c.lui        a1, 10
                  c.slli       sp, 5
                  andi         s8, s1, 1740
                  c.addi16sp   sp, -16
                  c.mv         a0, gp
                  c.xor        a0, a5
                  c.andi       a0, 13
                  sltu         gp, t1, s1
                  nop
1689:             c.andi       s1, 25
                  mulhsu       s2, s0, sp
                  c.nop
                  mulhsu       s5, s11, a5
                  srai         t1, a4, 11
                  sltu         t1, a7, s6
                  xori         t1, t4, -950
                  c.and        a4, s1
                  ori          t1, a0, -70
                  sll          tp, a3, a2
                  blt          s6, t1, 1713f
                  mulhsu       s2, a4, a7
                  c.add        a3, s9
                  c.mv         a2, t3
                  c.bnez       a3, 1720f
                  sltu         s10, s7, s9
                  c.addi       s9, 21
                  c.andi       a2, -1
                  ori          a3, ra, 1789
                  div          a0, t4, a7
                  auipc        s11, 505234
                  c.mv         a0, s9
                  xor          ra, s7, t5
                  c.slli       a3, 16
1713:             lui          t5, 627279
                  c.addi       s0, -1
                  c.slli       s5, 9
                  c.lui        t1, 17
                  bne          t0, t2, 1726f
                  ori          s2, s11, -419
                  bgeu         a6, t4, 1732f
1720:             div          a4, t2, sp
                  c.add        a4, s5
                  add          s2, a7, a1
                  sltiu        a6, s1, 916
                  srl          ra, a2, ra
                  c.bnez       a3, 1742f
1726:             sltu         s8, s5, t2
                  c.addi4spn   a0, sp, 896
                  beq          a0, s7, 1747f
                  c.add        a6, s4
                  nop
                  c.srai       a0, 3
1732:             ori          s9, s1, 1646
                  sll          zero, t1, s2
                  c.mv         t0, s7
                  remu         a6, ra, a7
                  sltiu        t6, gp, -1353
                  bne          s6, s4, 1739f
                  xori         sp, a6, -911
1739:             c.or         a4, a4
                  c.addi16sp   sp, -16
                  mulhu        zero, gp, a2
1742:             c.bnez       a0, 1750f
                  c.or         s1, a3
                  auipc        a0, 300436
                  divu         s9, t0, s4
                  c.sub        s0, a2
1747:             sll          s5, s0, a3
                  xor          s6, zero, zero
                  xor          s8, s10, s8
1750:             sltu         a1, s7, a1
                  divu         a0, t0, gp
                  nop
                  c.addi16sp   sp, -16
                  slli         s2, t6, 8
                  c.or         s0, s0
                  lui          sp, 319051
                  c.addi4spn   a4, sp, 128
                  andi         t6, a6, -450
                  nop
                  sll          t0, s8, t6
                  bne          s5, s11, 1778f
                  slli         s1, a5, 16
                  div          a0, s10, s11
                  c.srli       a2, 23
                  c.andi       s1, 22
                  and          s9, a3, t4
                  divu         s0, s10, a0
                  c.slli       t0, 18
                  sltu         s4, a0, a2
                  sll          s6, gp, s1
                  sltu         s4, sp, ra
                  c.beqz       a3, 1783f
                  divu         t5, zero, s4
                  c.srli       a3, 2
                  slt          t1, gp, a1
                  c.nop
                  c.li         t5, -1
1778:             c.or         a0, a0
                  c.srai       a1, 22
                  bltu         t1, ra, 1798f
                  mulhu        sp, t2, a2
                  slli         ra, t1, 23
1783:             sltu         t2, a6, t5
                  ori          a0, a6, -1232
                  rem          s0, zero, s0
                  c.xor        a2, a5
                  c.and        a3, a5
                  c.beqz       a4, 1791f
                  bgeu         s7, t1, 1800f
                  auipc        s10, 711260
1791:             c.beqz       s1, 1811f
                  sll          s11, a6, s7
                  c.li         ra, -1
                  mulhsu       t2, a2, t2
                  mulh         tp, a7, zero
                  bne          s2, s10, 1812f
                  c.mv         tp, s11
1798:             bltu         s7, tp, 1807f
                  or           s10, a0, a5
1800:             sra          a0, s11, gp
                  sra          t6, t2, a1
                  srli         s5, a0, 11
                  c.srai       a3, 2
                  divu         ra, s4, a2
                  c.srli       s1, 8
                  c.srai       a0, 23
1807:             sltu         tp, s8, s4
                  c.add        s1, t1
                  ori          t5, s5, -1746
                  lui          t1, 729661
                  addi         a3, zero, 9 #init loop 1 counter
                  mulhu        zero, t2, s2
                  mul          a4, a4, a2
                  addi         s4, zero, 19 #init loop 1 limit
                  sltiu        s2, s4, 930
                  c.li         s10, 20
main_137_1_t:     c.add        s11, t3
                  c.srai       a2, 14
                  addi         a3, a3, 5 #update loop 1 counter
                  auipc        t5, 61170
                  addi         a0, zero, 10 #init loop 0 counter
                  c.srli       a4, 12
                  addi         t3, zero, 0 #init loop 0 limit
                  add          s0, t6, t5
                  c.and        a4, s0
main_137_0_t:     sub          a2, a6, s2
                  slli         a4, s3, 24
                  addi         a0, a0, -4 #update loop 0 counter
                  c.mv         t5, s2
                  bge          a0, t3, main_137_0_t #branch for loop 0
                  andi         ra, t6, -1683
                  bltu         a3, s4, main_137_1_t #branch for loop 1
                  slt          s1, a3, s0
1811:             c.or         s0, a4
1812:             c.li         s9, -1
                  auipc        s8, 821609
                  c.andi       a0, 13
                  sra          gp, s9, a6
                  c.lui        s2, 23
                  nop
                  c.addi       s4, 26
                  c.addi       s3, 2
                  slt          s2, s0, a1
                  srai         a6, tp, 13
                  divu         a3, s0, s10
                  sll          t4, s4, a0
                  srli         s4, a5, 31
                  c.sub        a2, a3
                  c.sub        a2, a4
                  sll          a1, t2, tp
                  and          tp, zero, t4
                  mul          s8, a7, s6
                  add          gp, s10, s6
                  c.sub        a3, a1
                  remu         s2, zero, tp
                  sltu         a1, s2, t3
                  xor          s11, a1, a2
                  bge          s2, t4, 1840f
                  andi         s2, a3, -892
                  c.lui        a1, 1
                  bne          t0, t5, 1850f
                  slti         tp, t3, -1476
1840:             mulhsu       s6, s9, s4
                  sll          t6, tp, a6
                  divu         s5, a2, s2
                  sra          s5, t1, s6
                  auipc        s1, 198524
                  c.nop
                  addi         s9, s3, -1876
                  addi         a0, a5, -1795
                  bne          a4, zero, 1856f
                  or           ra, s3, tp
1850:             mul          s11, t2, a7
                  auipc        s0, 515403
                  blt          a7, ra, 1866f
                  divu         zero, a4, t1
                  c.srli       s0, 4
                  c.beqz       a1, 1864f
1856:             slt          s10, s7, s6
                  auipc        s10, 360770
                  srai         s4, ra, 18
                  mulhsu       s6, t5, s4
                  xor          s4, gp, s6
                  add          a1, s8, s1
                  c.srai       a4, 28
                  sltiu        a0, s11, 1578
1864:             blt          a5, a7, 1868f
                  c.mv         t2, a2
1866:             srai         t3, t6, 8
                  c.li         s2, 0
1868:             beq          a6, a0, 1884f
                  c.sub        a2, a5
                  c.sub        a2, s0
                  c.add        t2, s9
                  c.srai       a0, 5
                  sub          s2, s11, s5
                  div          zero, s0, a7
                  srai         t1, s8, 27
                  c.addi       t6, -1
                  rem          t6, a7, s1
                  sub          t3, t4, s9
                  addi         s11, tp, 1631
                  c.srai       a3, 24
                  add          t6, a4, s5
                  srl          zero, s3, s6
                  c.lui        tp, 28
1884:             mulhsu       s9, a7, s2
                  auipc        t5, 303201
                  c.andi       a3, -1
                  lui          a2, 938393
                  ori          t1, t0, -1737
                  bge          a6, s11, 1908f
                  c.add        t0, s7
                  bgeu         t6, a3, 1892f
1892:             sltu         s5, tp, t1
                  nop
                  mulh         s6, a7, a6
                  c.andi       a1, 2
                  slti         a2, t4, -914
                  mulh         s0, s8, zero
                  c.addi16sp   sp, 96
                  c.slli       a6, 1
                  andi         s6, a3, 354
                  bge          zero, s8, 1910f
                  beq          t1, s7, 1903f
1903:             slli         s10, s1, 8
                  c.srai       a0, 28
                  c.li         t4, -1
                  mulh         s10, a3, gp
                  c.or         a2, s0
1908:             c.addi       tp, 20
                  sra          a6, a3, a4
1910:             c.or         a0, a1
                  slti         s1, s4, -1650
                  remu         t5, sp, a0
                  nop
                  add          sp, a3, ra
                  nop
                  c.add        a3, a3
                  slt          s10, s11, s10
                  auipc        gp, 483785
                  c.nop
                  c.srli       a2, 3
                  c.xor        a2, s1
                  c.add        s11, s7
                  sub          a6, t6, s0
                  mulhu        sp, a2, s4
                  c.nop
                  c.sub        a2, s1
                  xor          s1, a2, s4
                  or           t4, a0, s0
                  c.sub        a3, a5
                  c.srai       a0, 2
                  bgeu         a6, a0, 1943f
                  c.or         s0, s0
                  c.and        s0, a1
                  c.and        a4, s1
                  mulh         s2, s4, s1
                  c.bnez       a1, 1947f
                  sltiu        t1, ra, -934
                  bge          gp, t2, 1950f
                  beq          s10, s1, 1956f
                  sltu         s1, t3, s8
                  slti         a4, ra, -1469
                  slt          zero, s4, tp
1943:             c.mv         gp, a1
                  ori          t1, a1, -369
                  auipc        a0, 860838
                  c.or         a1, s1
1947:             sltiu        s0, s8, -1774
                  nop
                  beq          a3, s6, 1954f
1950:             c.slli       tp, 22
                  c.srai       a1, 26
                  c.li         t6, 11
                  and          a3, s10, t0
1954:             div          a1, a0, a0
                  and          t5, a1, a7
1956:             c.nop
                  mulhu        s5, a7, s6
                  c.nop
                  bgeu         a5, gp, 1972f
                  c.srai       s0, 5
                  c.andi       a0, 27
                  mul          s0, t5, s10
                  beq          t2, a2, 1970f
                  sll          s5, a1, t6
                  c.or         a4, a3
                  mulhu        a2, a0, s6
                  sll          t5, a3, t0
                  c.andi       a0, 2
                  srli         a1, t5, 18
1970:             c.add        a6, a7
                  c.beqz       s0, 1991f
1972:             c.li         t3, 13
                  slti         t6, s10, 1235
                  c.sub        a1, s1
                  c.srai       a4, 14
                  c.addi4spn   s0, sp, 432
                  c.li         a0, -1
                  srl          s4, sp, a4
                  bgeu         zero, a3, 1993f
                  remu         t4, s5, s2
                  slti         s10, s4, -151
                  div          tp, s0, sp
                  blt          t2, s10, 2000f
                  addi         s0, s11, 1033
                  andi         tp, t3, 922
                  mulhsu       gp, ra, gp
                  c.lui        s0, 4
                  c.add        t6, t1
                  nop
                  c.bnez       s1, 1991f
1991:             mulhu        t5, t4, s2
                  c.mv         t2, a0
1993:             bltu         a3, t5, 1995f
                  bltu         a7, a0, 2011f
1995:             lui          a2, 799584
                  divu         a0, s5, s0
                  c.andi       a1, -1
                  ori          s9, s3, -235
                  c.srli       a1, 30
2000:             c.slli       s1, 25
                  auipc        s5, 1020913
                  c.sub        a3, s1
                  rem          t4, t1, s6
                  mulh         tp, t4, t6
                  mulhsu       s5, a3, a2
                  add          tp, s3, s10
                  c.lui        s10, 29
                  bgeu         a1, a7, 2021f
                  srl          tp, a5, zero
                  slli         sp, sp, 16
2011:             bne          t6, s3, 2028f
                  lui          tp, 251088
                  bgeu         s8, t1, 2025f
                  c.andi       a2, -1
                  remu         s9, s5, a6
                  sll          s3, s1, a2
                  rem          t1, a6, s4
                  slti         sp, s5, 1216
                  lui          t6, 99915
                  srli         s8, s9, 18
2021:             xori         t0, a4, 1321
                  beq          t6, s2, 2040f
                  ori          tp, a2, 445
                  auipc        t1, 779348
2025:             sltu         t3, s5, a6
                  bgeu         s1, a7, 2029f
                  c.xor        a3, a0
2028:             add          a4, s6, tp
2029:             divu         s2, a0, a2
                  sltu         s0, zero, t4
                  c.andi       a4, -1
                  srli         s8, s2, 3
                  bgeu         t4, s10, 2044f
                  srl          s11, a5, t4
                  lui          t6, 751517
                  c.mv         s9, t5
                  or           s6, t0, a3
                  sra          t5, tp, a6
                  sub          a3, a2, t4
2040:             c.andi       s0, 26
                  mulh         sp, s4, s8
                  c.lui        gp, 9
                  c.addi16sp   sp, -16
2044:             addi         t3, a2, 1001
                  mulh         t1, t3, a2
                  c.lui        s3, 23
                  slli         a3, zero, 25
                  c.andi       s1, 16
                  addi         s1, t4, 690
                  lui          s11, 76667
                  addi         s2, zero, 5 #init loop 1 counter
                  or           a1, zero, s3
                  addi         t3, zero, 14 #init loop 1 limit
main_133_1_t:     c.lui        a4, 29
                  div          s10, t1, s5
                  addi         s2, s2, 9 #update loop 1 counter
                  c.slli       t0, 31
                  c.srli       a2, 4
                  addi         s0, zero, 8 #init loop 0 counter
                  srl          t2, s11, t3
                  addi         zero, zero, 0 #init loop 0 limit
                  or           a4, s10, s7
main_133_0_t:     slti         t1, t5, 1560
                  mulhu        ra, a2, a5
                  addi         s0, s0, -8 #update loop 0 counter
                  rem          t5, s9, t0
                  c.bnez       s0, main_133_0_t #branch for loop 0
                  c.mv         a6, s1
                  bne          s2, t3, main_133_1_t #branch for loop 1
                  slli         t4, a5, 8
                  slt          t3, t6, s0
                  c.nop
                  blt          a7, s9, 2061f
                  c.srai       a2, 21
                  lui          a4, 962631
                  c.slli       tp, 26
                  bge          a4, a1, 2073f
                  c.or         a3, a3
                  c.bnez       s0, 2076f
                  sra          s11, s6, t3
2061:             c.xor        a4, a2
                  xor          s9, gp, s11
                  c.nop
                  and          s11, a2, s11
                  c.and        a3, s0
                  blt          s5, a4, 2080f
                  c.andi       s0, -1
                  c.add        s4, gp
                  lui          a0, 597113
                  add          a6, s7, a6
                  srli         t0, s3, 5
                  add          t2, sp, s9
2073:             c.addi16sp   sp, -16
                  remu         s11, a3, s10
                  bne          s1, s9, 2082f
2076:             slti         t1, a5, -530
                  c.addi16sp   sp, -16
                  andi         s5, tp, -1830
                  ori          gp, a2, 1157
2080:             c.beqz       a1, 2096f
                  auipc        t0, 817316
2082:             bltu         a0, s9, 2083f
2083:             c.li         a4, 2
                  mulhu        s0, tp, t4
                  bgeu         ra, s8, 2102f
                  and          t6, s2, s4
                  c.sub        a3, a5
                  srai         t2, t4, 8
                  c.addi16sp   sp, 32
                  c.andi       a0, 6
                  mulhsu       s1, tp, t0
                  srai         t4, t4, 26
                  sll          a6, s2, s8
                  sll          t2, s0, s6
                  c.slli       a6, 27
2096:             ori          s6, a1, 1329
                  c.lui        t5, 2
                  c.addi4spn   s1, sp, 864
                  c.slli       t2, 29
                  sub          a1, s2, a7
                  sltu         s1, s1, t1
2102:             addi         sp, a6, 1265
                  bltu         a7, a3, 2111f
                  ori          t0, t2, -942
                  c.beqz       s1, 2114f
                  ori          a6, zero, -504
                  beq          s5, sp, 2119f
                  mulh         t5, s10, t2
                  bne          s9, s9, 2127f
                  sltu         s5, sp, t6
2111:             rem          t4, s0, t5
                  c.and        a0, a5
                  xor          a6, s6, t3
2114:             or           tp, a7, t0
                  mulhsu       a3, t3, s2
                  andi         a3, t2, 1721
                  xor          s10, s5, s2
                  c.addi       s2, 12
2119:             c.or         a0, a0
                  mulhsu       s9, t1, a0
                  c.srai       a1, 5
                  xor          t5, tp, s3
                  c.beqz       a2, 2134f
                  nop
                  c.addi16sp   sp, -16
                  c.add        a1, s6
2127:             sra          t5, t2, sp
                  c.li         a2, 5
                  c.andi       s1, 19
                  srai         gp, t6, 4
                  sll          s5, gp, s2
                  slti         gp, s10, 454
                  add          t1, s6, zero
2134:             srai         gp, t0, 15
                  c.mv         tp, a5
                  nop
                  mul          t1, tp, s7
                  sll          a6, s4, a3
                  slti         a3, s8, 1257
                  srl          a3, s8, s2
                  addi         t6, t5, 279
                  c.andi       a1, -1
                  c.bnez       a0, 2156f
                  slli         s0, t2, 27
                  sra          t5, s3, gp
                  div          a2, t2, a3
                  beq          s11, s1, 2164f
                  c.andi       a4, 13
                  c.add        s8, s1
                  c.andi       a2, 29
                  c.li         t2, -1
                  c.slli       s6, 29
                  bge          s5, s10, 2170f
                  bge          s3, a7, 2167f
                  c.addi       a1, 1
2156:             mulhsu       t5, a6, s10
                  remu         a1, a7, zero
                  sltu         tp, s5, t1
                  c.srai       a3, 28
                  slt          s4, t5, a4
                  c.srli       s1, 2
                  nop
                  bltu         sp, gp, 2168f
2164:             mulh         t5, t2, s9
                  c.andi       a2, 20
                  c.lui        s9, 3
2167:             c.andi       s0, 15
2168:             remu         s9, t5, sp
                  sra          a0, gp, a2
2170:             c.andi       a4, 25
                  or           a1, s11, ra
                  blt          s11, a3, 2176f
                  c.and        a1, a3
                  c.andi       a4, -1
                  sltiu        t4, s0, 1058
2176:             c.li         ra, -1
                  xori         s11, a0, 530
                  sll          a0, a3, sp
                  c.mv         s1, t0
                  c.mv         a1, t5
                  sltu         s1, s8, t1
                  sra          s5, s3, a6
                  c.or         a4, a2
                  sltiu        ra, t6, -1673
                  slt          a2, s3, a4
                  c.addi16sp   sp, 208
                  slli         ra, ra, 24
                  bgeu         ra, t2, 2207f
                  and          t6, t2, s4
                  c.add        t4, t1
                  c.beqz       s1, 2203f
                  c.beqz       a4, 2208f
                  sub          ra, a3, gp
                  c.addi4spn   a0, sp, 960
                  or           a6, gp, sp
                  mulh         a1, s2, s5
                  beq          a6, tp, 2198f
2198:             nop
                  remu         s5, t0, a6
                  c.andi       s1, 11
                  c.and        a1, s1
                  srli         a2, zero, 16
2203:             c.add        s1, a6
                  bltu         s7, zero, 2213f
                  slti         s5, s1, -1549
                  c.or         a0, a4
2207:             c.or         a2, a2
2208:             slti         s0, t1, -149
                  c.addi       t4, -1
                  slti         s1, s3, -729
                  c.slli       s9, 6
                  andi         t2, t0, -189
2213:             xori         ra, t2, 1487
                  c.addi16sp   sp, 368
                  divu         t4, s0, sp
                  mul          s3, s6, s5
                  remu         a0, gp, a6
                  c.add        a1, a2
                  div          s1, a4, t5
                  sltiu        t1, s1, -1848
                  divu         s10, ra, s10
                  slli         t6, t5, 25
                  c.nop
                  c.andi       a2, -1
                  slt          s1, a3, sp
                  mulhu        s9, s4, zero
                  c.bnez       a3, 2235f
                  xor          a0, a4, sp
                  slti         a1, a1, 400
                  c.xor        a4, a1
                  sra          s5, s6, t0
                  remu         a6, zero, t2
                  addi         s6, s5, -678
                  c.srai       a0, 1
2235:             bne          s9, a5, 2236f
2236:             bltu         s2, s6, 2250f
                  divu         s11, s8, s11
                  mulhsu       s11, gp, t1
                  bltu         s9, gp, 2251f
                  rem          s6, a1, zero
                  c.beqz       s1, 2243f
                  c.or         a2, a0
2243:             c.lui        s8, 11
                  c.add        t0, s10
                  c.sub        s1, a1
                  c.sub        a2, s0
                  sltu         s9, a3, t0
                  mulhsu       t2, a4, s5
                  mulh         t3, s8, s10
2250:             c.slli       t2, 22
2251:             sub          s2, s11, t5
                  beq          a7, t6, 2263f
                  c.nop
                  c.xor        s1, s0
                  c.srai       s1, 4
                  divu         s9, a1, sp
                  bne          s2, t2, 2277f
                  sltiu        a1, zero, -575
                  srai         s11, a7, 19
                  c.nop
                  c.beqz       a1, 2264f
                  xor          a0, t1, a1
2263:             xor          s2, s11, t6
2264:             slli         t1, t2, 29
                  c.add        sp, t3
                  sub          t3, s3, t5
                  xori         ra, gp, -324
                  lui          a1, 32525
                  xor          t4, s11, s2
                  c.bnez       s1, 2288f
                  sltu         ra, t3, a1
                  sra          t5, s5, a6
                  slli         s9, s5, 8
                  srl          s5, t6, ra
                  c.lui        t5, 13
                  bgeu         t3, t6, 2289f
2277:             mul          a1, t5, t1
                  beq          s4, s4, 2287f
                  sub          s3, a5, s3
                  addi         a6, sp, -1187
                  c.add        a3, t6
                  c.and        a4, s1
                  slt          t6, s10, s10
                  c.and        s0, a3
                  c.andi       s0, 26
                  c.srli       s1, 10
2287:             sub          s2, s8, s3
2288:             andi         s0, a5, 1482
2289:             c.sub        a2, a0
                  c.mv         s2, s2
                  mul          tp, t0, s1
                  slt          t5, a4, s2
                  add          t1, ra, s5
                  rem          a2, t1, a4
                  c.lui        s6, 7
                  sltiu        s0, s10, -1057
                  mulh         gp, tp, zero
                  mulh         s6, a5, sp
                  div          t3, a6, t2
                  add          a4, s3, s8
                  c.addi4spn   s1, sp, 320
                  sltiu        a6, a7, -1272
                  c.slli       a3, 12
                  mulh         a0, gp, a3
                  and          a2, t4, t6
                  srl          a2, t6, t1
                  c.nop
                  c.nop
                  sll          tp, s6, ra
                  bltu         tp, a5, 2314f
                  mul          a0, s0, gp
                  c.addi       s0, 21
                  bne          a1, zero, 2324f
2314:             c.srli       a3, 21
                  add          t0, a1, t3
                  add          sp, s1, a2
                  c.srli       s1, 15
                  bge          s5, s9, 2319f
2319:             c.addi4spn   a0, sp, 112
                  bne          tp, sp, 2340f
                  addi         s3, t1, 1623
                  bltu         ra, s8, 2336f
                  sub          s4, s0, sp
2324:             c.or         a0, a4
                  rem          t2, s0, s9
                  or           a1, gp, s10
                  bge          s1, s1, 2334f
                  mulh         a3, a0, t0
                  bltu         gp, t6, 2338f
                  remu         s2, sp, s4
                  andi         zero, s3, 1709
                  slti         ra, s2, -1838
                  c.srli       a3, 10
2334:             srl          s2, s5, s5
                  xor          s11, a5, tp
2336:             c.and        s0, a2
                  c.andi       a0, -1
2338:             mul          t3, tp, t1
                  c.mv         t1, t5
2340:             remu         s6, a3, s5
                  sub          s11, s2, t3
                  c.li         s0, -1
                  sra          t1, s6, s0
                  xori         a4, ra, 1579
                  andi         s4, t1, -1926
                  divu         a2, s5, s11
                  c.nop
                  c.xor        a3, a2
                  blt          s6, tp, 2360f
                  sub          a4, t0, t6
                  c.or         a3, a2
                  andi         s11, s7, -1464
                  srl          s11, a3, t2
                  srl          zero, a3, s8
                  mulhu        s1, a2, sp
                  mul          s8, sp, a7
                  sltu         t1, a5, s1
                  c.or         a2, a2
                  sra          a4, s8, a2
2360:             c.andi       a4, 10
                  c.lui        a1, 25
                  div          a4, a6, a6
                  c.add        a2, a0
                  c.addi16sp   sp, 80
                  mulhsu       s10, a5, t1
                  slli         a1, ra, 14
                  xori         s0, a0, -1821
                  xori         s11, s7, -299
                  c.lui        a2, 2
                  c.bnez       s0, 2383f
                  slli         s8, gp, 13
                  remu         s3, a0, s4
                  nop
                  sltiu        a6, s0, 29
                  div          t1, t1, a1
                  xor          a6, s5, a7
                  xori         a1, s2, -381
                  blt          a6, t6, 2395f
                  xor          s9, s9, a6
                  ori          s5, tp, -1604
                  blt          s11, s2, 2393f
                  c.and        a3, a2
2383:             sub          sp, a1, a4
                  sub          s4, t4, a5
                  bltu         a0, t3, 2393f
                  mul          a2, a4, t2
                  mulh         a2, s0, sp
                  c.mv         t3, t1
                  bne          a6, s4, 2397f
                  c.slli       s10, 20
                  blt          gp, ra, 2405f
                  c.li         t2, 3
2393:             sltu         s8, t2, s9
                  ori          s9, t2, 822
2395:             beq          a1, ra, 2396f
2396:             srli         s1, a0, 27
2397:             srl          s9, a4, s0
                  andi         a6, tp, -1136
                  bge          s4, t1, 2402f
                  sub          t1, a2, t2
                  divu         s0, t0, a6
2402:             mulhsu       a3, a5, s11
                  c.srli       a1, 3
                  srli         s9, t5, 23
2405:             rem          a1, s11, a0
                  blt          a4, t4, 2423f
                  bltu         zero, t5, 2419f
                  c.andi       a2, 13
                  mulhsu       s8, zero, s5
                  sra          t6, a3, a4
                  c.addi4spn   a1, sp, 720
                  mulhu        ra, s3, a2
                  rem          t0, s1, s0
                  c.beqz       a3, 2415f
2415:             nop
                  xori         s0, s2, -958
                  slli         a3, t2, 18
                  andi         s2, s3, -244
2419:             c.lui        t1, 7
                  bne          t2, a5, 2436f
                  ori          a4, a7, 636
                  c.nop
2423:             sub          sp, s11, s10
                  mul          s5, t4, s5
                  xori         s2, s5, -62
                  andi         zero, a3, 1534
                  slti         t4, s1, -1338
                  div          a1, t6, t0
                  c.lui        ra, 17
                  sltu         t5, s1, t2
                  sltu         t1, s0, s9
                  slt          sp, t2, a7
                  c.lui        s1, 14
                  xor          s6, s0, s7
                  c.nop
2436:             c.sub        a3, s1
                  srl          s11, a7, s2
                  divu         s9, a4, a2
                  c.srli       s0, 5
                  sltu         a0, t1, s10
                  c.beqz       a2, 2446f
                  c.addi4spn   a1, sp, 640
                  mul          s9, a0, a0
                  c.andi       a1, 17
                  slti         s11, t2, -38
2446:             bge          s9, a3, 2448f
                  c.li         tp, -1
2448:             sltiu        ra, s10, -139
                  bge          s10, s6, 2466f
                  div          t3, s0, a5
                  sltu         s6, a2, a1
                  bltu         zero, s5, 2469f
                  c.addi4spn   a3, sp, 304
                  c.lui        s10, 10
                  c.addi4spn   s1, sp, 144
                  sll          a6, zero, a3
                  ori          t4, s4, -1719
                  andi         a4, a6, 334
                  add          s11, s3, gp
                  c.beqz       a3, 2479f
                  c.slli       t5, 12
                  c.addi       a3, 2
                  ori          s8, a0, -1182
                  rem          s8, a3, s9
                  c.addi16sp   sp, 352
2466:             c.bnez       s0, 2478f
                  c.and        s0, a4
                  c.mv         s6, s0
2469:             nop
                  slli         t4, s6, 23
                  sltu         a6, s6, s6
                  c.addi16sp   sp, 448
                  bgeu         gp, sp, 2489f
                  c.or         s0, a5
                  sltu         s0, s2, s10
                  sltu         a2, a2, s2
                  mulh         s8, t6, s7
2478:             c.xor        a1, s0
2479:             c.beqz       s0, 2491f
                  srai         s10, t1, 0
                  c.li         t1, 31
                  c.add        s2, s0
                  c.addi16sp   sp, -16
                  add          tp, ra, s10
                  mul          a6, t5, s6
                  c.srai       a4, 9
                  sltiu        t5, gp, 12
                  andi         t3, a0, -386
2489:             sltu         a1, gp, a5
                  bltu         t6, a6, 2491f
2491:             slti         gp, s3, -450
                  c.mv         s6, a5
                  srai         a2, s11, 23
                  c.bnez       a0, 2495f
2495:             and          a3, t3, a3
                  slti         tp, t3, -2004
                  c.sub        s0, a2
                  nop
                  c.sub        a4, s1
                  c.nop
                  and          t0, s9, ra
                  c.xor        a3, a0
                  and          zero, tp, s1
                  div          a3, s9, s1
                  c.andi       s1, 7
                  c.addi16sp   sp, -16
                  sltiu        s6, t4, 1602
                  ori          t4, s7, 956
                  c.or         s1, a5
                  or           s1, t3, t0
                  c.bnez       a3, 2518f
                  srli         s6, a2, 5
                  c.nop
                  c.or         a2, a5
                  sra          tp, s10, t3
                  srai         a4, t6, 19
                  blt          a1, a5, 2533f
2518:             c.slli       gp, 29
                  mul          a4, a6, t5
                  sltu         a2, a4, s0
                  srl          s0, a7, s6
                  c.bnez       s1, 2534f
                  c.lui        s5, 30
                  addi         s3, s7, -1225
                  sltu         a6, t3, s7
                  xori         s1, s2, -1902
                  div          zero, gp, a1
                  add          a1, gp, gp
                  sll          sp, a4, s4
                  c.slli       s4, 25
                  mulh         s6, s7, a7
                  c.addi16sp   sp, 352
2533:             xor          s9, s7, s2
2534:             xori         s5, t0, 928
                  srl          t5, s2, t6
                  sltiu        tp, s0, 1642
                  sll          t2, t3, sp
                  c.addi4spn   a2, sp, 432
                  remu         t1, s2, s7
                  sltiu        a1, s4, -1204
                  blt          s10, t1, 2542f
2542:             c.addi16sp   sp, -16
                  c.addi       t5, 31
                  c.srai       a2, 12
                  c.addi       t2, 7
                  sra          a2, a0, t5
                  rem          t5, t3, t2
                  c.beqz       s1, 2561f
                  lui          s2, 263052
                  remu         s8, a1, sp
                  mulhu        sp, s5, s9
                  sub          t2, a5, tp
                  mul          s3, a4, t0
                  c.mv         tp, s0
                  sra          t2, t3, a4
                  sltu         sp, a0, gp
                  c.mv         sp, s0
                  c.beqz       s1, 2575f
                  bltu         s7, t3, 2576f
                  mul          s6, a0, zero
2561:             or           gp, s9, ra
                  c.srai       s0, 1
                  beq          t2, s6, 2565f
                  sra          ra, sp, t1
2565:             slli         t1, s4, 30
                  sub          a6, a0, a1
                  srli         s5, a0, 4
                  c.addi       s3, 16
                  c.bnez       a2, 2582f
                  or           s4, s6, s11
                  srli         s8, t3, 23
                  blt          s7, t1, 2577f
                  mulh         sp, ra, a1
                  nop
2575:             c.mv         t5, sp
2576:             auipc        t3, 266024
2577:             c.beqz       s1, 2586f
                  or           s8, t4, s8
                  bge          zero, s2, 2598f
                  c.xor        a4, s1
                  sra          t4, zero, s11
2582:             div          s9, t0, t4
                  beq          t3, t5, 2591f
                  c.addi4spn   a0, sp, 992
                  bgeu         s2, s2, 2601f
2586:             lui          s3, 897398
                  xori         t3, a5, -1600
                  c.beqz       a2, 2596f
                  divu         s2, t6, a7
                  c.or         a0, a0
2591:             bne          s2, gp, 2602f
                  mulhu        s11, t2, ra
                  slli         t0, t1, 0
                  c.lui        s8, 10
                  c.slli       s11, 3
2596:             c.addi4spn   s1, sp, 608
                  c.or         s0, s0
2598:             mul          a6, a0, t2
                  c.slli       a4, 16
                  bge          a2, t6, 2609f
2601:             c.addi       s10, -1
2602:             c.slli       a2, 19
                  nop
                  bne          t1, a7, 2608f
                  slli         s8, s6, 1
                  bgeu         t2, s6, 2620f
                  slti         a2, s1, -115
2608:             beq          s11, a7, 2619f
2609:             c.or         a2, a3
                  andi         sp, t6, 583
                  xori         gp, t1, 1919
                  mulhsu       a4, zero, t3
                  ori          t5, t5, 1421
                  remu         zero, s4, a6
                  c.bnez       s1, 2632f
                  c.slli       s2, 11
                  c.lui        s4, 2
                  xor          s5, s3, a3
2619:             c.nop
2620:             c.sub        s0, a1
                  mul          s1, a3, a7
                  c.addi16sp   sp, -16
                  remu         sp, sp, s4
                  bne          gp, ra, 2641f
                  beq          a5, a5, 2643f
                  mulh         s3, s8, gp
                  sra          s8, t0, zero
                  and          tp, gp, gp
                  or           tp, s11, ra
                  c.andi       s1, 1
                  c.add        tp, a6
2632:             slti         s6, s8, 1083
                  xor          a0, t4, s6
                  nop
                  srl          a1, t2, s10
                  srli         t1, s7, 21
                  and          t5, s3, t5
                  c.slli       s10, 12
                  div          t0, t0, s7
                  xori         a3, t5, -412
2641:             slli         s0, s11, 3
                  c.bnez       a4, 2656f
2643:             slti         a2, t0, 667
                  c.mv         a0, s4
                  sll          s10, zero, t6
                  beq          s11, t6, 2666f
                  srl          s8, t6, s8
                  bne          a2, t1, 2660f
                  c.xor        a3, a0
                  bltu         s6, s1, 2653f
                  c.li         a0, 14
                  c.addi4spn   a0, sp, 480
2653:             slti         s9, s10, -852
                  sltiu        sp, t0, 943
                  sra          t4, t4, zero
2656:             div          s4, sp, t1
                  c.slli       s10, 2
                  lui          ra, 331371
                  sub          s3, s6, a5
2660:             add          t6, a4, s2
                  blt          s5, a5, 2669f
                  la           s3, region_0+502 #start riscv_load_store_rand_instr_stream_19
                  sh           a1, -286(s3)
                  lw           gp, 234(s3)
                  lb           t6, -67(s3)
                  mul          t1, s0, t5
                  mulhu        s2, s10, s5
                  sll          t6, a4, s0
                  sb           t1, 571(s3)
                  c.add        s8, a1
                  lbu          s9, 568(s3)
                  lbu          t2, 366(s3)
                  srai         s4, ra, 16
                  c.addi16sp   sp, 48
                  divu         sp, t0, t6
                  sb           s1, 1033(s3)
                  sb           s7, 43(s3)
                  or           a6, s10, sp
                  sb           s1, 585(s3)
                  sw           ra, 602(s3)
                  addi         gp, a2, -1742
                  xori         a6, a3, 1337
                  sb           tp, 318(s3)
                  lb           s4, 814(s3)
                  sh           s3, 428(s3)
                  lb           s4, 843(s3)
                  lb           s2, 1063(s3)
                  xor          s8, a3, gp
                  c.srai       a2, 26
                  sh           a5, 630(s3)
                  lh           t3, 814(s3)
                  auipc        gp, 944174
                  sltiu        t5, t5, -166
                  sh           zero, 954(s3)
                  sw           s1, 1154(s3)
                  lbu          tp, 110(s3)
                  lb           t2, 237(s3)
                  lb           s5, 414(s3)
                  lbu          tp, -411(s3)
                  lhu          s10, 32(s3)
                  sb           s4, -471(s3) #end riscv_load_store_rand_instr_stream_19
                  c.bnez       a4, 2678f
                  xor          s2, s1, gp
                  nop
                  bltu         s8, t5, 2678f
2666:             addi         t6, zero, 445
                  slt          t1, s8, t1
                  c.slli       t0, 6
2669:             bltu         s3, gp, 2680f
                  c.slli       s6, 25
                  lui          s11, 597509
                  bge          zero, t0, 2689f
                  sra          t4, t2, zero
                  c.mv         a0, tp
                  slt          t6, a3, t5
                  slt          t4, s5, a2
                  c.or         s1, a2
2678:             remu         t1, zero, a3
                  c.lui        t6, 16
2680:             c.srai       a0, 11
                  c.srai       a2, 28
                  c.bnez       a0, 2696f
                  c.andi       s1, -1
                  c.li         s1, 1
                  or           ra, a1, s5
                  c.bnez       a4, 2703f
                  divu         sp, t4, s7
                  c.mv         a2, s2
2689:             sltu         s11, s8, a0
                  c.addi16sp   sp, 496
                  c.mv         s3, t5
                  slli         t2, t6, 3
                  bltu         t5, zero, 2702f
                  nop
                  add          a3, t4, a6
2696:             mul          t2, s5, zero
                  sub          s1, a6, s11
                  bgeu         t2, t3, 2711f
                  xor          s10, s1, s11
                  slli         s4, a0, 5
                  bgeu         t0, t5, 2710f
2702:             slt          tp, t4, s1
2703:             c.nop
                  bge          zero, s0, 2706f
                  c.srli       a3, 5
2706:             or           a3, s10, a4
                  c.li         t1, -1
                  andi         a0, a4, 472
                  and          t2, a3, t5
2710:             c.addi       t5, 14
2711:             sll          a3, a6, gp
                  c.addi4spn   a0, sp, 960
                  c.mv         a0, s11
                  c.li         s9, 31
                  and          t0, a4, ra
                  or           tp, a7, s1
                  c.add        s3, tp
                  c.mv         s8, a3
                  sll          sp, s6, zero
                  or           t2, t6, t5
                  beq          tp, s5, 2722f
2722:             c.lui        t4, 22
                  c.and        a4, a5
                  c.nop
                  c.add        s6, t6
                  sltu         s3, t1, s3
                  c.srli       a2, 20
                  addi         t1, s6, 1027
                  beq          t6, t0, 2734f
                  c.and        s1, a3
                  c.addi16sp   sp, -16
                  c.li         s3, -1
                  rem          s8, zero, t4
2734:             or           t2, s2, s10
                  lui          a4, 601048
                  sub          t0, s5, s3
                  sll          s10, s3, s10
                  lui          zero, 121749
                  sub          s0, s7, ra
                  srai         t1, a5, 28
                  c.li         tp, -1
                  beq          t5, t1, 2753f
                  c.srai       a1, 3
                  c.and        a4, a4
                  c.lui        s8, 18
                  c.srai       a1, 3
                  auipc        s1, 578727
                  c.nop
                  bgeu         ra, s6, 2766f
                  mulhu        s6, a5, s9
                  c.addi4spn   a0, sp, 592
                  mulh         s6, s7, ra
2753:             sltiu        a4, a0, -965
                  mul          a1, t4, t1
                  auipc        a4, 260966
                  rem          t5, sp, a5
                  auipc        t5, 7834
                  divu         s6, t4, s7
                  srai         ra, s6, 23
                  c.andi       a3, -1
                  mulhsu       s5, a6, t0
                  sub          s10, sp, t5
                  la           sp, region_0+917 #start riscv_load_store_hazard_instr_stream_22
                  lbu          a0, -7(sp)
                  lb           t4, -6(sp)
                  lbu          s9, 4(sp)
                  lbu          a3, -2(sp)
                  lb           s11, -2(sp)
                  sb           s1, -2(sp)
                  lb           tp, -2(sp)
                  lb           s4, -2(sp)
                  lb           t1, -2(sp)
                  lb           zero, 1(sp)
                  sb           s1, 6(sp)
                  sb           s5, 6(sp)
                  sb           s7, 6(sp)
                  lb           t3, 6(sp)
                  sb           zero, 6(sp)
                  sb           t0, 6(sp)
                  c.sub        s1, a0
                  lb           a6, 8(sp)
                  lbu          s9, -10(sp) #end riscv_load_store_hazard_instr_stream_22
                  blt          sp, a0, 2781f
                  c.addi       s9, -1
                  slt          tp, a5, t6
2766:             mul          a3, t2, zero
                  bge          t1, t0, 2781f
                  sll          s6, a4, a7
                  c.nop
                  sub          ra, a6, s11
                  divu         zero, t1, s11
                  add          t6, t3, t3
                  bge          s3, t2, 2781f
                  beq          s10, a4, 2786f
                  c.add        s8, sp
                  c.addi       s6, -1
                  slli         gp, a4, 30
                  c.add        s4, s3
                  c.or         a4, s0
                  and          t1, t6, t0
2781:             mulhu        s10, s1, a7
                  bge          s2, s9, 2802f
                  la           a1, region_1+1812 #start load_store_instr_stream_1
                  lhu          t2, -16(a1)
                  lb           tp, -63(a1)
                  la           s10, region_0+1105 #start load_store_instr_stream_0
                  lbu          sp, 50(a1)
                  lb           s6, -64(a1)
                  lb           t3, -146(s10)
                  lbu          a6, 121(s10)
                  lw           gp, 99(s10)
                  sb           gp, -45(a1)
                  sh           s3, 16(a1)
                  lb           s2, 7(a1)
                  sw           a6, -153(s10)
                  sb           s3, -20(s10)
                  lbu          ra, -41(a1)
                  lb           a2, -90(s10)
                  lbu          s8, 37(a1) #end load_store_instr_stream_1
                  lh           t4, -39(s10)
                  lb           sp, -142(s10)
                  lbu          sp, 21(s10) #end load_store_instr_stream_0
                  c.add        ra, s9
                  srl          s4, s1, t6
                  slti         s2, s5, 1348
2786:             bne          gp, s8, 2798f
                  c.addi16sp   sp, -16
                  blt          s1, a0, 2795f
                  c.lui        t1, 30
                  mul          s10, t5, a1
                  c.add        t6, ra
                  c.xor        a2, a3
                  xor          s10, tp, ra
                  bge          t3, s5, 2806f
2795:             blt          s11, t4, 2812f
                  xor          tp, s8, a3
                  c.nop
2798:             lui          a3, 489846
                  sub          s9, s6, t3
                  xori         s8, a6, -742
                  mul          s8, t6, t0
2802:             sra          t2, gp, t1
                  c.andi       a1, 15
                  c.and        s1, s1
                  remu         t5, s0, a7
2806:             c.li         gp, -1
                  c.li         ra, 22
                  c.srai       a1, 11
                  mul          s1, t0, a6
                  sll          s2, s4, s1
                  c.or         a3, a1
2812:             c.or         a1, a5
                  lui          a0, 257789
                  c.sub        a3, a2
                  and          s4, t4, t4
                  bne          tp, a3, 2832f
                  slt          s11, a4, t5
                  c.xor        a0, a1
                  c.slli       t2, 16
                  c.add        a6, t4
                  ori          s5, a2, 47
                  srli         s1, t0, 14
                  mulhu        s2, s4, a3
                  c.srli       a4, 1
                  or           t5, s0, s7
                  c.nop
                  sra          t3, s9, s7
                  ori          sp, sp, -343
                  c.and        s0, s0
                  divu         a3, a7, a3
                  div          s1, zero, s7
2832:             auipc        t3, 759917
                  c.add        ra, s4
                  c.add        t6, s10
                  c.add        ra, ra
                  c.andi       s1, 10
                  mulh         gp, a5, s0
                  srl          t6, a4, ra
                  div          sp, s10, gp
                  mul          tp, s3, a3
                  c.add        a2, a0
                  xori         a1, s10, -1566
                  c.or         s1, a2
                  srli         s0, s4, 29
                  c.andi       a4, -1
                  c.add        a1, a3
                  lui          s5, 746049
                  c.beqz       s1, 2852f
                  c.xor        s0, a5
                  andi         sp, s9, 380
                  slli         t4, s6, 8
2852:             c.and        a1, a5
                  sub          s10, s3, s3
                  remu         ra, a2, t4
                  c.srai       a0, 5
                  c.addi16sp   sp, 448
                  c.xor        a4, a5
                  slli         s8, t2, 23
                  srl          a3, s1, a3
                  add          s0, zero, a4
                  slli         t0, s9, 18
                  c.nop
                  auipc        a3, 955365
                  remu         s9, a1, t0
                  ori          s9, t6, 721
                  c.bnez       s1, 2867f
2867:             sll          ra, t1, gp
                  sra          a1, a6, s1
                  slli         s8, a2, 22
                  andi         s0, sp, 676
                  c.li         a1, -1
                  addi         sp, s3, 1664
                  div          a6, s2, a3
                  sltu         t1, s5, t3
                  c.add        s10, a5
                  slli         gp, s0, 13
                  slli         s3, s4, 21
                  rem          t1, t0, s3
                  srli         s3, a4, 21
                  sltu         gp, t1, zero
                  andi         a0, tp, -398
                  c.slli       s8, 1
                  bgeu         a0, s1, 2902f
                  c.slli       t4, 21
                  srai         a1, s1, 20
                  sltiu        s4, t2, 329
                  or           a6, a1, a4
                  la           s5, region_1+710 #start riscv_load_store_hazard_instr_stream_2
                  lh           a1, 616(s5)
                  sw           a2, -482(s5)
                  lbu          t5, -482(s5)
                  lhu          ra, -482(s5)
                  lh           zero, -482(s5)
                  lw           t1, 506(s5)
                  lh           s1, 620(s5)
                  lb           s10, 341(s5)
                  c.add        ra, t5
                  sb           a0, 220(s5)
                  c.addi16sp   sp, -16
                  lb           t6, 220(s5)
                  lh           a3, 220(s5)
                  sh           tp, -616(s5)
                  lbu          s8, -616(s5)
                  lw           a0, -186(s5)
                  lb           zero, -271(s5)
                  xor          s8, gp, tp
                  sb           sp, 240(s5) #end riscv_load_store_hazard_instr_stream_2
                  add          t6, tp, t6
                  c.sub        a4, s0
                  sra          sp, t0, t2
                  blt          t4, t5, 2894f
                  slti         s4, a2, 1781
                  bge          a7, s6, 2894f
2894:             srai         a4, a4, 9
                  srai         s0, s2, 20
                  div          a4, s5, t4
                  sltiu        t1, a1, -1049
                  and          a4, s2, s1
                  srli         s3, tp, 24
                  la           s2, amo_0+4 #start riscv_lr_sc_instr_stream_14
                  lui          a0, 180086
                  and          tp, t1, s4
                  xori         t1, s2, -823
                  auipc        s1, 439728
                  c.mv         s11, s11
                  sltu         zero, a0, s1
                  remu         t2, t5, s9
                  srai         a6, s11, 8
                  srai         t3, a1, 0
                  c.sub        s1, a1
                  lr.w.aq       a1, (s2)
                  sc.w.aq       s0, gp, (s2) #end riscv_lr_sc_instr_stream_14
                  c.andi       a0, -1
                  c.bnez       s1, 2904f
2902:             c.li         s3, 21
                  nop
2904:             slt          t5, a3, t3
                  c.andi       a2, 16
                  c.nop
                  bgeu         t3, s2, 2919f
                  add          a2, s1, s8
                  c.slli       s5, 4
                  rem          a1, a5, s5
                  xor          s9, a5, ra
                  sra          ra, s8, t0
                  mul          s10, s2, a2
                  c.li         t2, -1
                  divu         sp, ra, t1
                  c.beqz       a1, 2928f
                  c.add        t1, s1
                  xor          a4, a1, s3
2919:             slt          a2, a2, zero
                  c.addi4spn   a3, sp, 928
                  remu         tp, s5, t0
                  c.andi       a0, 10
                  mulhu        a2, a0, a5
                  srai         a0, gp, 8
                  c.bnez       a3, 2933f
                  srl          s2, t5, a7
                  beq          sp, t2, 2939f
2928:             auipc        s6, 259098
                  c.addi       t4, 16
                  c.nop
                  c.srli       a1, 24
                  divu         tp, a1, s3
2933:             sll          t1, s3, sp
                  addi         t0, a7, 940
                  c.srli       a3, 11
                  mulhu        zero, t4, a7
                  c.nop
                  c.mv         ra, a1
2939:             and          zero, tp, a7
                  c.sub        a3, a5
                  mul          s6, s2, t3
                  xori         ra, ra, -1630
                  srli         t6, s10, 17
                  c.mv         a6, a6
                  mul          a0, s3, t3
                  addi         ra, a5, -889
                  add          s2, a2, a3
                  c.lui        s5, 17
                  addi         a6, a7, -703
                  c.addi       a0, -1
                  c.sub        s0, a3
                  slti         s3, zero, 1621
                  slli         s10, t1, 0
                  c.nop
                  beq          a6, ra, 2972f
                  mul          t5, s4, t0
                  bge          t2, t0, 2977f
                  bge          sp, a6, 2959f
2959:             nop
                  bge          a5, s10, 2976f
                  c.addi16sp   sp, -16
                  divu         t6, t2, s10
                  blt          s2, a0, 2982f
                  c.srai       a1, 4
                  bltu         a0, s7, 2966f
2966:             sra          tp, s4, s5
                  c.srli       a2, 24
                  bltu         t6, t2, 2986f
                  c.or         a3, a0
                  sub          s10, gp, s3
                  remu         a2, s6, a6
2972:             srl          s0, a4, a6
                  lui          t5, 73417
                  c.addi       s1, 19
                  c.lui        a4, 24
2976:             c.sub        a1, a4
2977:             c.xor        s1, a3
                  xor          a6, tp, s9
                  c.li         s9, 31
                  c.sub        s1, a0
                  mulhsu       t5, t4, s11
2982:             slti         s10, t1, -206
                  srli         s4, s2, 10
                  bltu         t2, s10, 3001f
                  div          t1, a2, a5
2986:             beq          tp, s1, 2999f
                  c.addi4spn   a1, sp, 96
                  c.mv         a3, s3
                  c.xor        a2, a2
                  add          s4, a0, a3
                  srl          s6, t6, a2
                  c.slli       t2, 27
                  c.or         s0, a5
                  remu         ra, s10, sp
                  c.or         a4, a4
                  auipc        s8, 80728
                  beq          ra, s5, 3011f
                  c.lui        ra, 30
2999:             sltiu        s6, a7, -1252
                  lui          s2, 120175
3001:             c.slli       s3, 13
                  c.srli       a0, 10
                  xor          s9, s7, s2
                  bne          s3, s8, 3018f
                  xor          a0, t2, s4
                  andi         a2, a5, 886
                  lui          a3, 878203
                  c.or         a0, a3
                  c.sub        a0, a2
                  c.addi       s1, -1
3011:             remu         a4, s9, a0
                  mulh         s4, s0, a3
                  xori         s4, t4, -962
                  rem          a1, a1, s7
                  c.sub        s0, s1
                  c.addi16sp   sp, 32
                  c.xor        a3, a2
3018:             add          t0, s6, s7
                  c.slli       a6, 26
                  sra          a6, a0, s10
                  c.mv         a2, s5
                  c.nop
                  bltu         a6, a5, 3036f
                  c.sub        a2, a2
                  bgeu         s5, a1, 3042f
                  addi         a4, t4, -101
                  add          a1, s5, a2
                  c.addi4spn   a1, sp, 816
                  nop
                  sltiu        ra, a5, 588
                  remu         t0, a5, a2
                  bge          a6, ra, 3033f
3033:             c.bnez       a1, 3035f
                  srli         t3, s10, 5
3035:             mulhsu       zero, a1, s10
3036:             c.and        a1, s1
                  mul          s5, t4, s0
                  c.mv         a4, s10
                  auipc        a2, 621402
                  slt          a0, t0, t1
                  bltu         tp, t1, 3048f
3042:             c.srli       a4, 8
                  nop
                  sll          s11, t6, a1
                  xori         a3, sp, 1933
                  c.sub        s0, a2
                  srai         s3, t5, 28
3048:             c.slli       s10, 18
                  div          ra, s3, s0
                  c.addi       t4, -1
                  c.beqz       a4, 3059f
                  and          s1, t5, a3
                  c.and        s1, a2
                  c.beqz       a2, 3071f
                  c.srai       s0, 16
                  c.beqz       a1, 3061f
                  bgeu         t4, a0, 3073f
                  mulh         gp, t3, s8
3059:             c.sub        a3, s1
                  addi         s10, s6, -233
3061:             mulhu        a2, s3, a6
                  c.li         ra, -1
                  c.bnez       s0, 3074f
                  c.and        s1, s1
                  bge          s4, sp, 3076f
                  sll          tp, t3, s5
                  slti         a2, a5, 1460
                  c.andi       a0, -1
                  add          s3, s2, zero
                  bge          t2, zero, 3074f
3071:             c.addi4spn   s1, sp, 624
                  div          a0, a1, a2
3073:             sltiu        s11, s6, 1123
3074:             divu         s2, s9, gp
                  c.addi       s4, -1
3076:             srai         s6, zero, 9
                  bltu         t1, a3, 3086f
                  c.beqz       a0, 3087f
                  c.beqz       s0, 3082f
                  c.andi       a0, -1
                  c.and        s0, s1
3082:             slt          a3, s3, a5
                  addi         s6, s7, 1484
                  xori         a2, tp, 1644
                  mul          t6, tp, t4
3086:             sltu         s2, s6, s1
3087:             blt          a2, t1, 3099f
                  c.addi4spn   a1, sp, 688
                  c.bnez       a2, 3097f
                  auipc        s3, 347763
                  bltu         s4, t0, 3096f
                  c.slli       tp, 3
                  c.xor        a1, a1
                  c.addi       t2, -1
                  sltiu        s11, s10, 1951
3096:             and          t5, a4, zero
3097:             remu         t2, a5, s0
                  bne          zero, a0, 3112f
3099:             bltu         s0, s2, 3100f
3100:             mulhsu       tp, s7, s10
                  slli         s5, a6, 22
                  andi         s6, gp, 1489
                  blt          s3, s3, 3116f
                  sll          t4, a0, a5
                  mulhu        s4, t1, s6
                  xori         t0, a7, -776
                  c.andi       s0, 11
                  slt          s5, a7, t3
                  mulh         a4, sp, a7
                  blt          a0, s3, 3111f
3111:             ori          s5, s0, -1784
3112:             c.li         s0, 26
                  c.lui        s9, 23
                  c.and        a2, a5
                  andi         tp, a6, -2017
3116:             c.add        t2, s8
                  andi         s1, ra, 1691
                  c.lui        t5, 27
                  sra          t3, a3, t6
                  sra          s0, s2, a7
                  c.mv         sp, t3
                  rem          t2, t5, s7
                  c.addi       s9, -1
                  or           a1, t4, t1
                  c.or         a4, s0
                  addi         a3, s11, -1757
                  lui          a0, 414753
                  sltiu        t0, t4, -125
                  rem          s10, a0, s7
                  auipc        s8, 459376
                  c.addi4spn   s1, sp, 192
                  sll          t6, s6, s3
                  slti         s11, t6, 1039
                  addi         gp, a0, 437
                  mulhsu       a4, s8, s1
                  c.mv         ra, sp
                  c.beqz       s1, 3150f
                  c.nop
                  c.li         a6, 24
                  c.addi4spn   a4, sp, 384
                  slt          a0, a0, a3
                  srl          s8, s9, s5
                  c.mv         t1, s10
                  divu         t0, t6, s9
                  srai         t0, s0, 21
                  xori         t2, s9, 375
                  mul          t5, t5, zero
                  c.nop
                  mul          zero, gp, t2
3150:             c.lui        gp, 3
                  and          a2, s3, a7
                  c.lui        s1, 8
                  addi         zero, sp, 2008
                  bge          t4, a7, 3166f
                  lui          t4, 793014
                  sra          zero, t4, t2
                  rem          s4, sp, a5
                  beq          s6, t3, 3165f
                  nop
                  slli         t3, a5, 19
                  c.beqz       a2, 3177f
                  mulhsu       t4, t1, s10
                  xor          gp, a0, a2
                  andi         s0, t5, 941
3165:             auipc        gp, 651242
3166:             c.addi16sp   sp, -16
                  xori         s9, s6, -1987
                  mul          sp, tp, t3
                  slli         s2, t4, 1
                  c.srli       a3, 2
                  slt          a0, a7, a2
                  c.andi       a0, 11
                  bne          gp, s1, 3184f
                  ori          a6, s7, -299
                  and          s3, a1, ra
                  add          t2, s10, s9
3177:             c.li         s11, 12
                  srai         t4, a1, 31
                  xor          a4, a7, t0
                  xor          s3, a4, t6
                  auipc        s8, 893643
                  sltu         a2, a6, sp
                  c.mv         t0, a6
3184:             add          t3, s6, a1
                  add          t2, sp, s6
                  c.xor        a0, s0
                  c.nop
                  c.srli       a3, 4
                  c.addi       sp, 24
                  mulhsu       gp, ra, a5
                  c.mv         s9, a6
                  srli         a4, t4, 2
                  sub          sp, a4, sp
                  srli         t2, t2, 22
                  slti         s6, a2, -266
                  srai         a6, s11, 2
                  c.addi       gp, -1
                  c.slli       s10, 10
                  sltu         a3, t1, t4
                  ori          t5, t0, 553
                  beq          a4, a3, 3217f
                  mulhu        t5, a3, a1
                  c.addi16sp   sp, 256
                  c.li         sp, -1
                  c.mv         t4, sp
                  blt          zero, s4, 3208f
                  divu         t1, tp, s3
3208:             xori         a0, sp, 1731
                  slt          gp, a6, t6
                  mulhu        t6, s0, s7
                  c.beqz       a1, 3225f
                  slt          tp, s4, a4
                  sltiu        s11, s3, -277
                  blt          t0, a1, 3223f
                  c.andi       a0, -1
                  c.beqz       a2, 3235f
3217:             c.lui        ra, 17
                  rem          s6, a2, a2
                  c.addi       s3, -1
                  c.slli       a4, 7
                  sltu         sp, s1, t5
                  c.addi4spn   a4, sp, 464
3223:             mulh         ra, a1, s10
                  c.lui        a2, 1
3225:             mul          t5, a7, t1
                  rem          s3, a4, s5
                  srai         sp, s1, 15
                  bge          t3, s2, 3239f
                  andi         sp, zero, 403
                  bgeu         s10, s7, 3247f
                  xor          sp, s8, tp
                  slti         a2, t1, 493
                  c.li         t6, -1
                  mul          a2, a3, a6
3235:             c.andi       a3, -1
                  lui          s10, 400085
                  c.andi       a0, 19
                  srli         sp, zero, 31
3239:             ori          ra, gp, 1453
                  c.and        a2, a0
                  c.mv         s10, s2
                  c.slli       s9, 31
                  c.nop
                  c.add        a3, s4
                  c.lui        gp, 13
                  ori          s11, tp, 1985
3247:             mulhsu       a6, s1, s1
                  c.slli       t0, 10
                  auipc        t3, 501220
                  or           s11, t1, s8
                  remu         gp, t4, s11
                  divu         s11, s8, t2
                  c.srli       s1, 7
                  la           a2, region_0+667 #start riscv_load_store_rand_instr_stream_18
                  sltu         s9, s1, a1
                  lbu          a1, 3(a2)
                  sb           t6, -8(a2)
                  lb           t1, 10(a2)
                  auipc        s5, 307105
                  lb           t1, 6(a2)
                  c.addi4spn   s0, sp, 80
                  slli         gp, a0, 30
                  lhu          s2, 1(a2)
                  divu         a1, a7, a3
                  sb           s2, -5(a2)
                  c.addi16sp   sp, 208
                  lbu          t1, -16(a2)
                  lb           s9, 4(a2)
                  sb           s0, -3(a2)
                  sb           sp, -1(a2)
                  lbu          s4, 0(a2)
                  c.xor        s0, s1
                  sb           a5, 2(a2)
                  lb           s5, -3(a2)
                  lbu          a3, -4(a2)
                  auipc        a1, 902657
                  slli         t0, sp, 14
                  xori         tp, ra, -97
                  sh           s10, -7(a2)
                  sb           a3, 3(a2)
                  sh           s6, -1(a2)
                  ori          a3, gp, 233
                  lbu          s9, -12(a2)
                  srli         a4, t0, 23
                  lb           a4, 15(a2)
                  sb           s7, -6(a2)
                  sb           t4, 11(a2) #end riscv_load_store_rand_instr_stream_18
                  sra          t4, gp, s10
                  slt          t5, t3, tp
                  c.addi16sp   sp, 48
                  addi         t4, s0, -482
                  bge          ra, sp, 3275f
                  c.andi       a4, 8
                  sra          zero, t4, a4
                  c.nop
                  c.bnez       a3, 3266f
                  c.srli       s0, 6
                  c.and        a2, a0
                  or           ra, s7, s8
3266:             and          gp, a0, s5
                  or           s0, s7, s10
                  xor          a2, t0, t1
                  sra          t2, zero, a4
                  sll          a4, t0, s11
                  c.addi4spn   a2, sp, 208
                  c.andi       s1, 6
                  or           s0, s6, a2
                  c.srai       a3, 4
3275:             c.addi4spn   s1, sp, 432
                  c.addi4spn   a3, sp, 832
                  c.addi16sp   sp, 32
                  c.and        a1, s1
                  ori          a2, a7, 1692
                  c.beqz       s0, 3281f
3281:             c.addi16sp   sp, 448
                  bltu         t5, ra, 3299f
                  addi         a6, t4, -1055
                  mulh         zero, t2, zero
                  nop
                  srl          a1, t5, s4
                  c.andi       a2, -1
                  or           t0, s4, t3
                  c.mv         t0, s4
                  c.srli       s1, 1
                  mulhu        s10, s9, a6
                  c.beqz       a0, 3301f
                  c.and        a0, a2
                  c.slli       s2, 28
                  c.mv         a1, a6
                  c.xor        a2, a3
                  sltu         a1, t6, s10
                  c.beqz       a3, 3318f
3299:             sll          s8, t6, ra
                  slti         s0, s10, -1299
3301:             c.sub        a3, a2
                  andi         a3, a4, -1771
                  srl          t2, s0, ra
                  divu         a0, t6, a3
                  sltiu        gp, s0, -1509
                  c.srai       s0, 19
                  sltiu        t5, a4, -642
                  slli         t2, ra, 4
                  xor          s6, s5, t1
                  xor          s3, a1, ra
                  c.xor        a4, a0
                  sub          t1, a3, s4
                  sltu         a3, s2, s3
                  c.beqz       s0, 3332f
                  c.sub        a3, a5
                  slt          t3, a3, s10
                  c.and        a1, s1
3318:             add          a4, sp, ra
                  beq          a3, s3, 3327f
                  c.or         a1, a3
                  c.beqz       a1, 3338f
                  sub          t0, s8, tp
                  add          s5, a2, t2
                  auipc        s2, 78378
                  c.or         a4, a5
                  c.addi       ra, 18
3327:             c.addi4spn   a2, sp, 560
                  c.slli       t2, 29
                  ori          t6, s2, 231
                  mul          t4, a4, tp
                  sltu         gp, a4, s0
3332:             c.or         a4, a2
                  c.and        a4, a5
                  bltu         s7, a4, 3346f
                  srai         sp, a4, 24
                  sll          a6, a2, a0
                  c.srli       a0, 15
3338:             slli         s2, a5, 29
                  ori          s8, t1, -1276
                  sub          s10, t5, s11
                  lui          a3, 1013386
                  c.lui        s2, 11
                  remu         s4, a1, t1
                  srl          t4, a2, s0
                  sll          s4, sp, a6
3346:             mulhsu       t3, a5, ra
                  srl          a3, a0, s6
                  srai         a1, t6, 15
                  andi         s8, a2, -1819
                  c.mv         gp, t0
                  c.or         a2, a4
                  srl          a4, s2, s3
                  rem          s1, a3, a0
                  slt          a3, a0, a6
                  mulhsu       t3, a4, s3
                  sra          a2, s1, a4
                  sub          s9, s9, sp
                  c.li         t6, -1
                  c.addi16sp   sp, 448
                  sltiu        s9, s8, -1538
                  rem          t6, sp, a1
                  srli         t5, s4, 22
                  c.lui        a2, 4
                  srli         t2, a6, 27
                  and          a6, s2, s11
                  srl          ra, a2, t0
                  c.addi4spn   a0, sp, 544
                  sub          a0, a0, ra
                  mul          t4, s3, s7
                  lui          zero, 308644
                  c.bnez       a2, 3380f
                  c.sub        s0, a5
                  divu         a0, t1, ra
                  c.addi16sp   sp, -16
                  c.srai       s0, 9
                  bltu         s0, a2, 3387f
                  and          t3, tp, s7
                  mul          s10, a4, s10
                  and          s10, s5, a1
3380:             sra          a2, sp, s11
                  addi         t2, s11, -1526
                  addi         gp, ra, -746
                  remu         s3, s0, s5
                  bltu         t5, a4, 3396f
                  andi         s9, t6, 1110
                  nop
3387:             c.beqz       a1, 3404f
                  c.srli       a1, 1
                  divu         a2, s11, s2
                  c.and        a2, a5
                  c.sub        a1, a5
                  rem          s10, t0, a6
                  xor          t1, t1, t4
                  c.bnez       a3, 3411f
                  ori          tp, a5, 1004
3396:             addi         s6, a3, 627
                  xori         s10, s2, 1357
                  c.xor        s1, a0
                  nop
                  remu         s10, t6, s1
                  auipc        t6, 551406
                  c.or         s1, a1
                  c.or         a4, a2
3404:             rem          t5, a7, a5
                  bge          a3, s3, 3406f
3406:             c.mv         t0, t2
                  lui          s9, 381822
                  auipc        s3, 891041
                  ori          a3, a5, -134
                  nop
3411:             c.xor        a3, a2
                  bgeu         a3, a6, 3429f
                  xori         s3, a6, 588
                  auipc        s0, 990370
                  slti         t3, t4, -2023
                  ori          a2, a4, 143
                  or           ra, s5, a5
                  div          s9, s5, gp
                  sll          s11, s10, sp
                  c.xor        a0, s0
                  mulhu        s5, s2, t5
                  c.xor        s0, a3
                  addi         t3, t6, -285
                  c.andi       s0, -1
                  srai         s5, a3, 16
                  c.li         a6, 27
                  addi         a3, a7, -1743
                  srli         s6, t0, 22
3429:             c.nop
                  mulh         s5, ra, tp
                  div          a0, a3, ra
                  c.xor        s0, a5
                  divu         a2, tp, tp
                  div          ra, a7, t6
                  remu         t3, t3, s8
                  and          s3, t6, s9
                  rem          sp, s6, a3
                  bge          s2, a5, 3455f
                  sub          s3, t4, t3
                  slti         s11, a0, 229
                  c.bnez       a3, 3445f
                  auipc        t5, 782845
                  c.mv         s0, gp
                  nop
3445:             c.or         s1, s1
                  xori         s8, t1, -196
                  c.nop
                  andi         t3, s6, -246
                  beq          sp, gp, 3450f
3450:             srl          s4, s0, t2
                  sll          t2, s9, s3
                  c.bnez       a0, 3465f
                  sub          s6, s4, tp
                  c.nop
3455:             c.beqz       a4, 3460f
                  sltu         t3, s7, t3
                  sub          tp, t4, ra
                  xori         t0, s9, -783
                  ori          a1, s4, -1149
3460:             remu         ra, a3, s11
                  mulh         t1, s10, gp
                  c.srli       a0, 11
                  srl          sp, a6, s8
                  mulhsu       a4, a2, a1
3465:             sltu         a6, a1, tp
                  c.addi16sp   sp, 336
                  mulh         s8, a4, sp
                  mulhu        s8, s5, s10
                  c.li         s2, 19
                  rem          sp, s11, t0
                  slti         t3, s5, -1116
                  mulh         a0, s7, s3
                  c.srli       s1, 16
                  mulh         s3, a0, a2
                  la           a0, region_0+52 #start load_store_instr_stream_1
                  la           s10, region_1+1742 #start load_store_instr_stream_0
                  lb           s0, -1(a0)
                  lb           a3, 13(a0)
                  sh           a4, -6(a0)
                  lb           t2, -11(a0)
                  lb           t6, -9(s10)
                  lw           t0, 10(s10)
                  lhu          s3, 8(s10)
                  lhu          s6, -10(s10)
                  sb           s7, -9(s10)
                  lbu          gp, 3(a0)
                  sw           t0, -8(a0)
                  lbu          t5, 12(a0)
                  lb           s9, -3(s10)
                  lb           s11, 9(a0) #end load_store_instr_stream_1
                  lbu          a1, 7(s10) #end load_store_instr_stream_0
                  auipc        s9, 197512
                  mulh         t1, t4, s11
                  c.addi       a4, -1
                  c.beqz       a1, 3489f
                  xor          a1, ra, t2
                  c.nop
                  remu         a4, s3, s7
                  c.xor        a4, s0
                  c.andi       a0, -1
                  bne          a0, a1, 3485f
3485:             c.beqz       a0, 3497f
                  srli         a3, t6, 24
                  c.bnez       a2, 3489f
                  c.bnez       a1, 3491f
3489:             sll          t3, s7, s5
                  rem          a3, s10, s2
3491:             beq          a0, t5, 3507f
                  srl          s9, a5, s8
                  xor          a2, s3, a3
                  mulhsu       s5, a6, a0
                  c.add        s11, a1
                  blt          a3, s7, 3516f
3497:             xor          a0, s6, s10
                  sll          t6, gp, gp
                  and          s1, a4, s1
                  ori          s10, s4, 1239
                  c.addi       gp, -1
                  addi         ra, t0, 650
                  nop
                  blt          t4, t1, 3520f
                  c.bnez       a2, 3513f
                  remu         t1, t0, a6
3507:             bgeu         gp, t0, 3521f
                  c.and        a2, a2
                  c.bnez       a3, 3521f
                  mulh         a6, a0, s11
                  c.addi4spn   a0, sp, 848
                  c.addi       s2, -1
3513:             c.beqz       a4, 3531f
                  bge          s5, t4, 3527f
                  nop
3516:             mulh         s6, t6, t5
                  or           t2, s6, s0
                  c.add        a0, t1
                  blt          a2, s4, 3533f
3520:             slt          zero, t4, zero
3521:             c.srai       a3, 2
                  c.lui        gp, 1
                  sub          s6, s7, t1
                  sra          a4, s6, t0
                  sra          s5, a6, s2
                  srai         s0, t2, 19
3527:             sra          s9, s7, t2
                  c.lui        t3, 15
                  c.nop
                  c.srli       s0, 17
3531:             mulh         s9, a7, t2
                  c.nop
3533:             auipc        s3, 815523
                  c.addi4spn   s1, sp, 944
                  bne          a7, a3, 3542f
                  c.or         a4, a2
                  c.nop
                  bltu         gp, s8, 3546f
                  bgeu         t0, t4, 3548f
                  mul          a1, s2, s7
                  mulh         a0, s8, a5
3542:             c.srai       a2, 13
                  andi         a0, a2, 987
                  auipc        a4, 404655
                  srli         a2, s3, 21
3546:             beq          t6, a2, 3565f
                  lui          t1, 190710
3548:             c.bnez       s0, 3565f
                  srl          tp, s8, t3
                  addi         t0, s4, -1972
                  c.nop
                  sltiu        a6, zero, 607
                  c.xor        a1, a0
                  andi         s3, s2, 848
                  c.xor        a0, a0
                  sub          s0, ra, a2
                  c.bnez       a3, 3562f
                  bgeu         a2, s1, 3574f
                  c.add        t6, s8
                  mulhsu       t3, t2, s10
                  srl          s4, a7, s3
3562:             nop
                  srl          a2, zero, s0
                  srli         a2, gp, 21
3565:             andi         a0, s3, -712
                  mulh         gp, a0, s6
                  mulhu        a2, s9, s3
                  c.nop
                  andi         s4, a5, 1534
                  and          a0, t4, a7
                  srli         s5, a6, 10
                  mulh         a6, tp, a1
                  c.add        a1, a7
3574:             sltiu        a6, a6, -420
                  c.bnez       a0, 3583f
                  c.beqz       a0, 3594f
                  beq          a7, a3, 3578f
3578:             nop
                  bne          tp, s9, 3590f
                  c.lui        a2, 1
                  c.lui        t0, 8
                  slti         t2, a0, -1340
3583:             bne          a7, a1, 3595f
                  c.addi16sp   sp, 416
                  srli         s0, a5, 29
                  ori          a2, t0, 1567
                  sra          zero, t6, s1
                  c.xor        a4, a3
                  sll          a2, s7, sp
3590:             addi         t2, s1, 1312
                  sub          s4, s11, sp
                  blt          ra, t1, 3603f
                  bgeu         zero, a0, 3610f
3594:             nop
3595:             xor          gp, t5, a7
                  remu         gp, s3, a6
                  remu         s1, a6, t4
                  and          sp, s5, s10
                  c.li         sp, 23
                  sub          t3, s4, a1
                  addi         s3, gp, -541
                  nop
3603:             c.bnez       a4, 3605f
                  c.and        a4, a1
3605:             c.bnez       a1, 3622f
                  slli         a0, s4, 19
                  c.srli       a4, 24
                  div          s9, a5, s10
                  sltu         s3, s2, a3
3610:             div          s8, tp, ra
                  srli         s9, a4, 20
                  c.beqz       a4, 3620f
                  addi         t1, s9, -1831
                  sltu         gp, s5, t5
                  srai         s1, sp, 17
                  c.srli       s1, 31
                  srai         s0, t4, 15
                  c.addi4spn   a0, sp, 800
                  and          t6, gp, t2
3620:             c.li         a1, -1
                  c.addi4spn   s1, sp, 720
3622:             c.slli       a4, 16
                  c.lui        t3, 2
                  bltu         s4, t3, 3636f
                  xori         s11, t5, -1369
                  slt          tp, a4, s7
                  addi         a6, a2, 38
                  remu         s2, s8, a5
                  divu         a0, a3, a7
                  c.bnez       a2, 3634f
                  lui          s9, 733362
                  c.nop
                  c.lui        a4, 9
3634:             c.li         t1, -1
                  c.nop
3636:             divu         tp, a3, s0
                  srli         s3, a4, 18
                  addi         t5, s9, -1659
                  bne          gp, s3, 3658f
                  mulh         t5, a5, a2
                  c.beqz       a4, 3650f
                  c.slli       a2, 5
                  lui          s1, 413880
                  and          s1, gp, s11
                  c.srai       s0, 3
                  c.srli       s0, 1
                  c.beqz       a1, 3656f
                  xori         a3, t1, -668
                  add          t2, t5, s9
3650:             c.beqz       a0, 3651f
3651:             c.addi16sp   sp, -16
                  srl          a6, gp, gp
                  srai         zero, t0, 10
                  mul          a0, a1, a3
                  c.mv         s4, a4
3656:             c.or         s1, a3
                  xor          sp, a1, a3
3658:             divu         s1, a1, s4
                  xor          t3, s6, t2
                  or           s11, gp, t3
                  c.li         a1, 15
                  bge          s7, s4, 3665f
                  bgeu         a3, s3, 3670f
                  blt          zero, s5, 3680f
3665:             c.andi       a0, 11
                  c.sub        a4, a5
                  c.nop
                  xori         s10, t3, -912
                  nop
3670:             bgeu         s9, t6, 3671f
3671:             c.xor        a1, a1
                  c.li         tp, 29
                  divu         s6, s2, a7
                  sll          ra, s10, s7
                  c.lui        a0, 15
                  c.or         a3, a4
                  mul          a6, t5, a5
                  sll          a1, ra, t4
                  beq          a2, t4, 3696f
3680:             c.nop
                  beq          a1, t6, 3693f
                  c.mv         t5, s5
                  or           ra, s9, s9
                  sltu         s2, a6, a0
                  c.addi4spn   a0, sp, 816
                  slti         s4, t4, 1917
                  c.mv         a6, a0
                  srai         t2, t3, 15
                  c.mv         t2, a7
                  c.addi16sp   sp, -16
                  xor          s6, s8, t5
                  sltiu        s6, a1, -928
3693:             bgeu         a7, s2, 3707f
                  sltiu        a6, t1, -778
                  c.li         s3, 30
3696:             bgeu         t2, s8, 3716f
                  c.srai       a4, 10
                  beq          s9, t1, 3711f
                  slli         sp, s3, 13
                  div          zero, ra, s11
                  bge          s2, a7, 3715f
                  c.srai       s0, 5
                  sra          a4, s3, a3
                  bltu         t3, s2, 3717f
                  divu         a6, t3, a0
                  slt          s11, t2, s10
3707:             andi         t0, s7, -1375
                  c.slli       s5, 28
                  c.mv         t1, a4
                  beq          tp, s10, 3726f
3711:             mulhsu       s0, s3, t0
                  nop
                  lui          s1, 952147
                  c.addi       s0, 9
3715:             or           a2, a6, s10
3716:             sltu         tp, t2, s4
3717:             c.bnez       a0, 3733f
                  or           a0, s10, t6
                  lui          s4, 55017
                  or           s6, t4, s1
                  lui          t0, 869949
                  sltu         t5, s8, s3
                  mulh         a6, s4, s2
                  c.li         t2, 15
                  mul          s0, a2, a7
3726:             c.srai       a2, 26
                  c.addi4spn   s0, sp, 336
                  mulhsu       t5, ra, a1
                  srai         a6, s10, 0
                  remu         t2, s6, t4
                  div          t2, a5, a5
                  c.sub        a0, a0
3733:             sra          zero, s0, a2
                  c.slli       gp, 13
                  c.slli       s9, 29
                  mulh         t3, a5, t4
                  c.sub        a4, a2
                  c.and        s0, a5
                  mulhsu       t1, a1, s8
                  c.addi16sp   sp, 336
                  mulhsu       a3, s6, zero
                  xori         s2, t1, 949
                  beq          s5, s6, 3745f
                  srl          s4, s9, a2
3745:             c.addi4spn   a4, sp, 32
                  sll          sp, gp, s11
                  sub          a0, s9, s5
                  c.andi       a0, -1
                  divu         s2, t3, a5
                  lui          sp, 491111
                  bgeu         a6, a3, 3760f
                  auipc        s10, 941363
                  sra          s8, tp, t1
                  bltu         s4, a5, 3765f
                  lui          s0, 175864
                  blt          a4, s7, 3769f
                  div          t4, ra, t5
                  div          zero, s9, s3
                  c.slli       a3, 13
3760:             blt          a0, a5, 3764f
                  mul          t0, a2, s9
                  sub          gp, a6, sp
                  bne          a1, s11, 3782f
3764:             c.addi4spn   a3, sp, 208
3765:             beq          sp, s7, 3779f
                  c.add        s1, s3
                  mulhu        t6, s11, t2
                  xori         s0, a4, -1018
3769:             c.addi4spn   s0, sp, 336
                  slt          t4, gp, a5
                  c.addi       s4, -1
                  c.addi4spn   a1, sp, 160
                  c.and        s1, a2
                  c.andi       a4, -1
                  c.xor        a4, s1
                  xor          t0, a4, a7
                  slt          s5, s11, t5
                  c.lui        s8, 4
3779:             bltu         s2, a1, 3799f
                  c.addi4spn   a0, sp, 400
                  slti         s4, s11, 1145
3782:             addi         s3, s5, -1891
                  nop
                  blt          a4, t1, 3785f
3785:             sll          s1, t5, zero
                  mul          tp, a3, ra
                  c.xor        a3, a3
                  ori          a3, t2, -737
                  andi         ra, a3, -1538
                  or           a2, s3, s9
                  c.add        s2, s9
                  c.bnez       a1, 3795f
                  c.bnez       s1, 3800f
                  mul          ra, t0, s5
3795:             div          tp, t6, ra
                  la           s5, region_0+1308 #start load_store_instr_stream_0
                  lb           a6, -4(s5)
                  la           s3, region_1+1325 #start load_store_instr_stream_1
                  lh           sp, -1(s3)
                  lh           a1, 9(s3)
                  lb           a2, -5(s5)
                  lh           s9, -7(s3)
                  lb           s0, -2(s3)
                  lb           s2, -5(s5)
                  sh           s4, -5(s3)
                  lbu          s6, 2(s5)
                  lhu          a2, 15(s3) #end load_store_instr_stream_1
                  sh           a5, -6(s5) #end load_store_instr_stream_0
                  c.addi       s0, 4
                  mulhu        t4, t0, t5
                  c.lui        ra, 16
3799:             bltu         s10, s11, 3811f
3800:             srl          a6, s2, a5
                  c.bnez       a4, 3806f
                  c.bnez       s1, 3820f
                  mulh         s3, t2, t0
                  addi         a2, t5, -1273
                  bne          s9, a6, 3817f
3806:             c.add        s6, t6
                  c.slli       tp, 11
                  xor          ra, sp, t2
                  ori          a6, t4, -1939
                  sltiu        sp, t6, 1732
3811:             c.li         gp, 24
                  mul          s4, t3, s5
                  andi         s6, t2, -540
                  sub          a4, t1, s4
                  c.slli       a3, 8
                  sll          s8, a0, tp
3817:             sltu         ra, s11, s2
                  bgeu         s0, t2, 3831f
                  c.addi4spn   a0, sp, 80
3820:             srli         sp, s10, 2
                  divu         a4, a4, s11
                  c.slli       a4, 20
                  lui          tp, 768535
                  srli         s4, t2, 28
                  c.andi       s0, 1
                  xor          t0, a1, s10
                  auipc        t6, 845969
                  nop
                  rem          s10, a1, a4
                  srl          t0, s8, a1
3831:             remu         t0, t0, s10
                  c.li         s6, -1
                  srl          t0, t2, s0
                  xori         a1, a7, 640
                  c.or         a4, a3
                  bltu         s3, s8, 3850f
                  c.addi       a6, 13
                  c.li         gp, 20
                  andi         s9, a5, -1625
                  rem          s4, t0, s9
                  bgeu         t4, a2, 3842f
3842:             slti         s11, t2, -411
                  blt          s5, t1, 3860f
                  xori         t6, tp, 1
                  srli         t0, t6, 26
                  c.add        a0, s7
                  mulh         t0, a3, s5
                  srli         s10, a1, 31
                  sltiu        t5, tp, 449
3850:             c.nop
                  sltiu        a1, t4, 1174
                  bne          zero, a1, 3861f
                  mulhsu       s1, a7, s1
                  sub          t0, t4, s4
                  and          zero, s7, s7
                  slli         s1, t2, 21
                  c.nop
                  srai         s6, s5, 22
                  bgeu         t5, tp, 3876f
3860:             c.andi       a1, 22
3861:             c.xor        s1, a3
                  c.srai       a3, 1
                  srai         gp, ra, 10
                  c.srli       a2, 5
                  add          a0, s6, sp
                  mulh         gp, a4, s1
                  c.andi       s0, 18
                  sltiu        t6, s0, -2009
                  slli         ra, t4, 5
                  nop
                  c.and        a3, a5
                  sra          a3, t2, s3
                  andi         s3, ra, -1996
                  srli         s8, a3, 31
                  c.slli       a4, 29
3876:             or           a0, s6, a2
                  c.addi4spn   s0, sp, 32
                  slli         t3, s2, 30
                  c.nop
                  c.andi       s1, -1
                  andi         s3, a4, -2032
                  c.add        a1, t3
                  sub          s8, zero, s8
                  c.add        t6, a1
                  remu         a1, zero, t6
                  rem          a1, ra, s2
                  slti         t1, gp, -1522
                  xor          s3, a2, s6
                  slti         s1, a3, -1227
                  c.li         t0, 20
                  sub          s5, zero, a4
                  beq          s5, gp, 3903f
                  lui          t3, 226986
                  c.addi16sp   sp, 192
                  blt          t4, t6, 3896f
3896:             slt          s5, a5, t5
                  mul          a3, s9, a4
                  slli         a0, s3, 0
                  c.lui        s10, 18
                  sltu         t2, ra, a6
                  c.or         a2, a1
                  remu         t1, s6, a4
3903:             c.srai       s0, 7
                  c.add        s10, a6
                  c.beqz       a0, 3913f
                  c.and        a3, a0
                  sra          t1, t3, gp
                  c.addi16sp   sp, -16
                  and          a1, t2, s11
                  srli         a6, s3, 26
                  c.lui        s0, 27
                  c.li         gp, 23
3913:             c.andi       a2, -1
                  c.sub        a2, s1
                  addi         t4, a4, 858
                  divu         ra, t2, t3
                  auipc        a1, 887859
                  ori          s1, a4, 1221
                  add          t3, s10, tp
                  bltu         t3, gp, 3928f
                  c.slli       s9, 14
                  mulhsu       s4, s0, s8
                  slli         tp, zero, 7
                  bltu         t4, a0, 3941f
                  addi         s8, s10, 1262
                  c.lui        s4, 29
                  slt          a1, s0, zero
3928:             mulh         t0, t1, t4
                  c.srli       s0, 24
                  c.add        t3, t0
                  c.mv         gp, a5
                  c.li         t0, -1
                  c.add        s5, gp
                  xori         a1, tp, -603
                  xor          zero, ra, sp
                  and          s0, gp, s11
                  andi         t3, s11, -723
                  c.lui        t4, 2
                  c.nop
                  slti         t3, s0, 1347
3941:             slti         a6, s8, 888
                  sub          t6, zero, sp
                  sltiu        s1, s8, 1565
                  blt          s10, a1, 3961f
                  nop
                  ori          a1, sp, 646
                  c.srai       s0, 12
                  remu         s10, a6, s8
                  addi         s1, sp, -1947
                  c.or         a4, a2
                  c.mv         t3, ra
                  c.xor        a0, s0
                  slti         t5, s5, -1194
                  c.mv         t3, s10
                  ori          s0, s2, -1436
                  c.li         a1, -1
                  c.andi       a3, 24
                  remu         a2, s11, a3
                  srl          s5, t5, t0
                  slt          t1, s5, a7
3961:             mulhsu       t0, s3, s3
                  c.or         a3, a5
                  sra          s8, s3, t3
                  sra          s8, a2, s5
                  srai         a2, s11, 2
                  rem          a0, t5, t5
                  auipc        s8, 8776
                  divu         s1, s1, a5
                  and          t2, a2, s3
                  c.mv         a4, a5
                  blt          zero, ra, 3983f
                  rem          a2, tp, s9
                  sll          t3, s4, a5
                  beq          t5, a6, 3985f
                  c.and        a3, a0
                  mulhsu       t5, s8, tp
                  sub          t4, a2, ra
                  sll          t2, sp, t2
                  mulh         a2, a3, t2
                  la           sp, region_0+1453 #start riscv_load_store_rand_instr_stream_17
                  lb           t2, -14(sp)
                  ori          s3, sp, 640
                  xor          t0, s7, s6
                  mulh         a1, a3, gp
                  c.andi       s1, 4
                  or           t6, sp, t3
                  xori         s2, t5, -1351
                  xori         t1, t6, -46
                  srl          s3, zero, t1
                  sub          t5, t5, s9
                  c.srli       a0, 8
                  sb           s2, -8(sp)
                  c.slli       t1, 26
                  slt          t0, tp, t1
                  sll          a3, s8, s10
                  sb           t2, -12(sp)
                  lbu          gp, 6(sp)
                  c.slli       t5, 19
                  ori          s6, a2, 510
                  nop
                  lb           s2, -8(sp)
                  rem          t4, s2, t6
                  sh           a7, 3(sp)
                  c.nop
                  lb           a6, 10(sp)
                  lhu          a6, -5(sp)
                  andi         a3, s10, -1474
                  or           s9, t3, s4
                  xori         s1, ra, 701
                  lbu          s9, 11(sp)
                  mulh         a1, a3, s11
                  c.lui        gp, 3
                  c.slli       s9, 29
                  divu         zero, a2, gp
                  sh           s10, -5(sp)
                  slli         s3, s2, 12
                  sh           a0, -1(sp)
                  addi         t0, t5, -1733
                  addi         t6, a5, 1252
                  sb           t6, -10(sp)
                  c.xor        a4, a5
                  lb           a0, -8(sp) #end riscv_load_store_rand_instr_stream_17
                  or           gp, t6, a3
                  c.sub        s1, a0
                  and          s5, s5, s4
3983:             beq          s11, s8, 3996f
                  andi         s8, s0, 587
3985:             c.srai       a4, 8
                  c.addi       a2, -1
                  lui          a0, 751850
                  ori          gp, ra, 235
                  slti         t3, t6, 1417
                  sll          t6, s5, a3
                  and          s3, a3, s5
                  auipc        s4, 282299
                  andi         t1, s10, 961
                  c.andi       s0, -1
                  ori          t5, t5, -1908
3996:             mulhsu       s5, s6, tp
                  mul          s9, s8, sp
                  rem          s4, sp, s8
                  c.srli       a0, 7
                  c.and        a0, a1
                  c.srli       s1, 3
                  c.nop
                  slli         sp, a3, 30
                  c.xor        a1, a0
                  xor          s10, a1, a5
                  c.nop
                  slt          a0, s3, s9
                  bgeu         s6, a5, 4024f
                  bltu         gp, s1, 4014f
                  bge          s0, s4, 4011f
4011:             blt          s10, a1, 4019f
                  c.srli       a4, 18
                  mulh         a3, s8, a0
4014:             c.andi       a1, 15
                  slti         s1, t0, -1909
                  mulhsu       s6, t5, s11
                  c.mv         s10, t3
                  c.beqz       s0, 4035f
4019:             nop
                  auipc        s2, 530943
                  blt          t2, a3, 4024f
                  slti         s9, s4, -58
                  c.bnez       s1, 4024f
4024:             c.and        a1, s1
                  slt          s8, a7, a5
                  c.beqz       a0, 4027f
4027:             srai         t4, tp, 7
                  c.and        s0, a2
                  slt          a4, a5, a0
                  div          s5, s9, a7
                  bge          t2, sp, 4033f
                  remu         sp, t3, s2
4033:             c.or         a1, s0
                  slti         s11, sp, -1480
4035:             c.beqz       a4, 4047f
                  c.or         a4, s0
                  and          a2, s5, a2
                  auipc        s9, 219066
                  c.andi       s1, -1
                  sltiu        s1, a3, 1066
                  c.addi4spn   a0, sp, 112
                  c.addi       a2, 18
                  c.addi16sp   sp, 416
                  sll          s1, a4, s5
                  c.mv         t2, a1
                  beq          s1, s2, 4053f
4047:             bne          s11, t5, 4064f
                  slli         s5, t0, 24
                  divu         s2, tp, s4
                  addi         a6, s0, 129
                  or           a6, t4, s4
                  divu         a3, t6, a4
4053:             c.srai       a3, 7
                  c.bnez       s0, 4063f
                  xor          a4, t4, s6
                  auipc        a4, 317770
                  c.addi16sp   sp, -16
                  c.sub        a0, s1
                  c.addi       ra, 8
                  c.add        t0, t3
                  nop
                  xor          sp, zero, s4
4063:             c.bnez       a3, 4077f
4064:             ori          a2, s8, 1427
                  slti         a4, s11, -598
                  c.li         sp, 31
                  c.add        t0, s0
                  c.andi       a4, -1
                  mulhu        zero, t2, s4
                  div          t5, s5, s9
                  c.or         s0, s0
                  rem          s11, gp, t2
                  srai         t3, t0, 20
                  remu         s4, t2, ra
                  c.xor        a4, a2
                  sltu         t4, a1, a0
4077:             c.or         a2, a5
                  beq          a3, s8, 4090f
                  sltiu        a3, a7, -767
                  andi         s3, s10, -1470
                  or           t3, t2, s3
                  nop
                  remu         t0, a2, a3
                  bne          t6, t1, 4092f
                  bne          s6, a0, 4099f
                  c.li         a1, -1
                  bne          t4, s4, 4105f
                  srli         s8, a1, 21
                  addi         s0, s11, -1704
4090:             mulh         s1, t1, s10
                  blt          t2, t6, 4107f
4092:             mul          a0, t4, sp
                  lui          s2, 88774
                  blt          s2, a3, 4111f
                  remu         a2, s4, t0
                  c.lui        tp, 3
                  slti         s5, a7, -1963
                  sltu         s9, ra, s2
4099:             bltu         t5, s2, 4112f
                  c.lui        s2, 29
                  c.addi16sp   sp, -16
                  lui          s9, 110949
                  c.addi16sp   sp, -16
                  nop
4105:             divu         s1, a6, s3
                  auipc        gp, 365798
4107:             c.lui        a3, 1
                  slli         s6, gp, 9
                  bltu         zero, ra, 4120f
                  and          t5, t2, a0
4111:             mulh         a6, s11, s11
4112:             mul          a0, sp, gp
                  srai         a2, a0, 29
                  auipc        a0, 293054
                  c.addi       s8, -1
                  ori          s3, s10, 564
                  c.beqz       s1, 4134f
                  bltu         a2, t2, 4127f
                  beq          a5, s11, 4131f
4120:             mulhsu       s9, s9, s6
                  c.add        t1, t2
                  c.or         a4, a5
                  c.andi       a4, 31
                  srli         a0, a2, 15
                  slt          t0, gp, s8
                  sltiu        a1, s4, -470
4127:             c.addi4spn   a2, sp, 176
                  divu         a2, a3, a5
                  bgeu         a7, ra, 4149f
                  c.beqz       a1, 4134f
4131:             c.addi4spn   a3, sp, 112
                  slt          s8, s0, gp
                  sltiu        t0, a5, -687
4134:             mul          a3, zero, s1
                  c.srli       a2, 9
                  c.lui        t2, 31
                  sra          gp, a4, a3
                  xor          gp, gp, gp
                  slli         a1, s9, 29
                  c.lui        tp, 19
                  c.beqz       a3, 4160f
                  ori          a2, t4, 1880
                  c.nop
                  div          t0, s5, zero
                  la           t6, region_0+124 #start load_store_instr_stream_0
                  la           ra, region_0+1278 #start load_store_instr_stream_1
                  lbu          t3, 27(t6)
                  sw           sp, -782(ra)
                  lbu          t4, 243(t6)
                  lb           t5, 208(t6)
                  sb           s3, -265(ra)
                  lb           t3, -829(ra)
                  lbu          a4, -1037(ra)
                  lw           s1, 76(t6)
                  lw           a4, -122(ra)
                  sb           t4, -95(ra)
                  lb           s10, 115(ra)
                  lbu          gp, -32(t6)
                  lb           t2, -245(ra) #end load_store_instr_stream_1
                  lhu          s2, 140(t6) #end load_store_instr_stream_0
                  c.addi4spn   s1, sp, 848
                  c.add        t6, s10
                  xor          a1, s11, s8
                  slli         t0, sp, 31
4149:             c.slli       s1, 6
                  sll          s0, s3, t6
                  sra          s9, tp, s6
                  mul          t3, gp, t6
                  c.srai       a2, 23
                  c.addi16sp   sp, 352
                  c.srai       a2, 6
                  beq          a7, tp, 4175f
                  add          s6, s9, t6
                  c.sub        a4, a1
                  ori          s0, s4, -519
4160:             c.sub        a4, a0
                  c.and        a2, s0
                  add          s8, t6, t0
                  sltiu        a4, s10, -22
                  c.srai       a0, 29
                  or           t3, s2, t5
                  or           t3, t0, s4
                  bne          t1, s11, 4181f
                  srl          tp, t0, a3
                  srai         tp, s0, 27
                  auipc        s5, 244535
                  c.andi       a1, 28
                  auipc        a3, 718981
                  sltiu        t5, ra, -654
                  c.or         a2, s0
4175:             or           s11, t3, s6
                  add          s4, a4, t3
                  sll          a6, a1, s10
                  srl          sp, s4, t4
                  remu         sp, s1, ra
                  bgeu         s9, a4, 4196f
4181:             c.slli       ra, 23
                  mulhsu       s8, ra, t0
                  blt          s6, s7, 4191f
                  div          s10, a0, s11
                  srl          t4, gp, a5
                  bltu         s1, t1, 4200f
                  sub          tp, s2, gp
                  auipc        s5, 939303
                  c.sub        a2, a5
                  c.nop
4191:             auipc        t2, 908
                  mul          ra, a1, s0
                  c.andi       a1, -1
                  sltiu        s3, s3, 533
                  c.lui        s0, 25
4196:             mulh         t0, s0, t5
                  srli         a4, tp, 10
                  c.lui        a1, 3
                  c.bnez       a0, 4211f
4200:             slt          gp, s6, s10
                  blt          t2, s3, 4214f
                  mulhu        a4, s10, s3
                  mulhu        s3, a0, sp
                  c.lui        a4, 29
                  c.nop
                  slti         a3, a4, -1317
                  slt          a6, ra, s2
                  c.srai       a1, 5
                  c.beqz       s1, 4218f
                  lui          s5, 71771
4211:             auipc        t0, 632894
                  or           s3, s1, s1
                  mulhu        s8, t5, s6
4214:             blt          t3, s1, 4223f
                  blt          sp, s11, 4227f
                  c.add        s4, t1
                  srai         t3, s7, 9
4218:             c.nop
                  c.bnez       a2, 4230f
                  xori         t5, s5, 1058
                  mulh         s8, t1, tp
                  srl          s9, a3, s7
4223:             divu         t6, s2, a3
                  beq          t5, a5, 4241f
                  auipc        ra, 368500
                  mulhu        a1, s2, s1
4227:             ori          s9, s11, 250
                  srl          zero, t0, a7
                  slli         zero, s0, 11
4230:             srl          gp, t6, a2
                  sltu         t0, a7, t2
                  nop
                  auipc        s9, 584220
                  bne          s0, t1, 4250f
                  lui          gp, 61768
                  auipc        gp, 84133
                  blt          t2, s9, 4255f
                  mul          s3, s7, s11
                  c.add        t0, a6
                  add          t2, t3, t4
4241:             addi         s9, s1, 1881
                  divu         t6, t3, a5
                  slti         sp, s2, 934
                  c.sub        s0, a3
                  sltu         s8, s0, a4
                  c.and        a3, s1
                  auipc        s0, 183963
                  ori          gp, t3, -1701
                  c.andi       s0, 13
4250:             slli         zero, s10, 16
                  nop
                  bge          s7, t4, 4269f
                  c.addi       a3, 2
                  c.slli       a3, 23
4255:             c.and        a1, a0
                  c.lui        t1, 30
                  or           s8, s3, s4
                  sra          a4, ra, ra
                  mul          s5, a3, s11
                  slt          s10, a0, a6
                  bge          s5, s5, 4262f
4262:             nop
                  blt          s4, zero, 4267f
                  c.sub        s1, a5
                  nop
                  c.addi4spn   a1, sp, 96
4267:             bge          s10, s6, 4272f
                  c.mv         s9, gp
4269:             sub          t6, a2, ra
                  andi         s1, a5, 1580
                  la           s8, region_0+1393 #start load_store_instr_stream_0
                  la           sp, region_1+510 #start load_store_instr_stream_1
                  lb           s1, 8(s8)
                  sw           a0, -14(sp)
                  sb           t6, -64(s8)
                  lbu          s6, 21(sp)
                  lbu          a1, 55(sp)
                  sb           a4, -1(s8)
                  lw           t0, 23(s8)
                  lbu          t2, 27(sp)
                  lb           s10, 48(s8)
                  sb           zero, -34(sp) #end load_store_instr_stream_1
                  lbu          s10, 20(s8)
                  lb           zero, -62(s8) #end load_store_instr_stream_0
                  c.xor        s1, s1
4272:             slti         a6, t2, -1177
                  c.beqz       a0, 4290f
                  blt          t6, a5, 4275f
4275:             or           s2, s11, s7
                  and          s11, s9, t4
                  slt          s5, s3, a6
                  c.srli       s0, 23
                  c.nop
                  mulhsu       a4, tp, a4
                  addi         s6, a0, 1900
                  slt          s11, s7, s5
                  mul          t3, t6, a6
                  ori          zero, a6, 1687
                  c.addi16sp   sp, 128
                  divu         t5, a4, s3
                  addi         s11, s5, 1577
                  mulhu        a0, t0, a4
                  c.sub        a4, a3
4290:             sltiu        t6, sp, 1358
                  c.add        s4, gp
                  lui          s8, 259173
                  c.nop
                  c.nop
                  remu         s6, s3, s10
                  or           s4, s9, a7
                  sra          gp, zero, s9
                  sltu         t6, a4, t0
                  c.sub        a2, a1
                  lui          zero, 295542
                  srl          gp, a6, s3
                  c.addi16sp   sp, 400
                  c.li         s11, -1
                  c.addi4spn   s0, sp, 400
                  bne          s1, a6, 4306f
4306:             c.addi4spn   a4, sp, 64
                  sub          t4, s4, t1
                  bge          a6, t4, 4310f
                  c.addi4spn   a0, sp, 992
4310:             srl          a6, a5, tp
                  remu         sp, s0, s8
                  c.srai       a1, 7
                  slti         t0, tp, 813
                  sub          t2, s5, t4
                  c.li         s0, -1
                  c.slli       s3, 8
                  beq          t0, tp, 4330f
                  srai         s2, s4, 3
                  blt          tp, t3, 4339f
                  sll          s8, t2, a6
                  c.bnez       a2, 4328f
                  srli         zero, s1, 18
                  sll          a4, s5, t3
                  c.beqz       a3, 4335f
                  mul          s1, a3, sp
                  c.add        gp, a4
                  div          s9, s6, zero
4328:             sra          sp, a6, a6
                  mulh         t2, a7, t4
4330:             c.srai       a0, 28
                  c.bnez       a1, 4339f
                  mulhsu       a6, t5, s3
                  c.or         a3, a4
                  sub          s4, t5, t6
4335:             c.li         s5, 8
                  divu         a0, s1, sp
                  add          t1, t1, a6
                  c.andi       a2, 29
4339:             c.mv         s8, s4
                  srai         s10, s3, 0
                  c.lui        t5, 9
                  mulh         a4, s9, a2
                  c.xor        a3, a3
                  addi         sp, a6, -1643
                  mulhu        a0, s3, a5
                  c.li         s10, 17
                  c.addi       a4, 8
                  slti         gp, s11, 1157
                  sra          s3, t4, a1
                  ori          zero, t1, 1592
                  add          s2, a5, s8
                  remu         t4, gp, a2
                  rem          t1, t4, a3
                  c.slli       t6, 15
                  c.and        a3, s0
                  c.andi       s1, 4
                  c.bnez       a1, 4369f
                  c.andi       s0, -1
                  mulhsu       s4, t2, s0
                  c.bnez       s1, 4363f
                  c.sub        a2, a0
                  mul          t4, t0, s8
4363:             or           t0, s0, t2
                  bgeu         s3, t2, 4381f
                  andi         s4, a4, -549
                  srai         sp, sp, 10
                  bne          tp, a5, 4379f
                  bgeu         a3, a1, 4375f
4369:             lui          a4, 19395
                  divu         t5, s11, s7
                  mulhsu       a2, t6, s4
                  sltu         s2, s5, sp
                  c.addi16sp   sp, -16
                  or           t5, t1, s5
4375:             c.slli       sp, 11
                  nop
                  srl          s2, tp, tp
                  c.addi       a0, 14
4379:             c.beqz       a4, 4396f
                  div          ra, tp, s2
4381:             beq          s4, s5, 4397f
                  divu         s3, a5, s0
                  blt          a2, a5, 4396f
                  mulhsu       s4, t3, a3
                  mul          a1, s3, s2
                  xor          t3, tp, t0
                  divu         t1, zero, gp
                  slt          a1, t0, s6
                  mulh         a2, a7, s11
                  lui          tp, 408105
                  rem          s5, ra, s3
                  c.bnez       a4, 4394f
                  lui          a2, 800568
4394:             slt          t6, a1, s2
                  mulhsu       zero, t1, a3
4396:             c.nop
4397:             srl          t2, ra, t4
                  c.xor        s1, a3
                  c.li         a0, 30
                  nop
                  c.slli       t1, 13
                  c.nop
                  c.addi16sp   sp, 480
                  mul          a0, ra, t3
                  mulhu        s6, s4, a0
                  auipc        a1, 953970
                  xor          a3, t6, s9
                  c.li         t0, -1
                  c.add        tp, s2
                  blt          a0, sp, 4411f
4411:             c.srai       a2, 8
                  c.xor        a0, a4
                  mul          t2, s7, tp
                  bltu         t3, s11, 4426f
                  rem          tp, a4, a2
                  bgeu         a0, a1, 4432f
                  c.xor        a3, a2
                  nop
                  rem          s11, tp, a1
                  blt          s9, a0, 4428f
                  slli         s5, ra, 11
                  xori         t1, s10, 740
                  add          s4, s8, s4
                  c.srai       a3, 22
                  and          t2, t6, a5
4426:             bgeu         a2, a5, 4437f
                  sll          a2, s6, t5
4428:             andi         s1, s11, 1845
                  xor          a4, a5, t2
                  bne          s6, a2, 4435f
                  srli         a1, zero, 30
4432:             sltiu        s3, tp, 1249
                  sra          s6, s5, s0
                  lui          s9, 969374
4435:             beq          gp, s3, 4452f
                  c.sub        a4, a4
4437:             ori          a1, s6, 26
                  beq          s0, a1, 4456f
                  or           a2, s3, a4
                  mul          t1, a6, sp
                  srai         gp, ra, 28
                  srai         t3, sp, 7
                  c.slli       t4, 20
                  xor          t0, s0, s1
                  c.srli       a0, 12
                  c.lui        a6, 7
                  bltu         sp, zero, 4451f
                  remu         ra, a6, a1
                  c.and        a1, a4
                  and          a0, gp, a5
4451:             blt          tp, a4, 4468f
4452:             c.srai       a4, 22
                  sltu         gp, a0, t3
                  sltu         a2, s6, s4
                  slti         t1, a0, 639
4456:             addi         s6, t4, -165
                  c.srli       a1, 22
                  bge          sp, t1, 4471f
                  xor          t0, a5, s3
                  bltu         ra, s5, 4471f
                  c.and        s1, s0
                  c.andi       a4, -1
                  div          s3, s10, s1
                  sll          t4, s5, a7
                  mulhsu       a0, s6, s3
                  sra          t6, ra, ra
                  bltu         s8, t4, 4487f
4468:             remu         s2, s10, a7
                  c.or         s1, s1
                  c.slli       a0, 25
4471:             ori          s10, t3, -1763
                  c.addi       s1, 10
                  sra          a0, s6, a3
                  sll          t1, a5, a6
                  sltu         zero, t0, s2
                  c.lui        t6, 29
                  mulhu        s1, s2, a3
                  la           t5, sub_4
                  slli         s9, s6, 8
                  c.slli       s4, 26
                  c.srli       s1, 18
                  c.nop
                  c.addi16sp   sp, -16
                  nop
                  addi         t5, t5, -337
                  c.srli       a4, 12
main_j2:          jalr         ra, t5, 337 #jump main -> sub_4
                  c.lui        t3, 22
                  c.li         s8, 9
                  mul          s8, t5, t5
                  mul          t1, s10, s5
                  srl          t1, a7, s3
                  addi         a0, a3, 983
                  c.and        a3, a3
                  c.slli       a3, 10
                  c.li         t1, -1
                  c.slli       ra, 13
4487:             or           s6, t4, s6
                  srai         s9, t3, 0
                  bne          a4, s1, 4501f
                  srl          s8, gp, a5
                  c.srli       a2, 13
                  c.andi       a4, -1
                  srli         t6, s5, 1
                  c.addi       s4, -1
                  slli         t5, a7, 26
                  c.srli       s1, 25
                  add          s6, sp, s5
                  rem          tp, s4, s0
                  mulhu        t0, t2, s9
                  xori         t0, a5, 1482
4501:             c.addi4spn   a2, sp, 288
                  sub          a0, t4, s0
                  nop
                  rem          t3, a4, tp
                  mulh         a1, sp, s0
                  ori          a3, zero, 1734
                  nop
                  c.srli       a0, 3
                  bltu         t6, tp, 4518f
                  c.beqz       a1, 4513f
                  ori          s9, s0, 1531
                  nop
4513:             c.nop
                  srli         ra, s9, 8
                  c.addi4spn   a4, sp, 624
                  c.slli       ra, 21
                  srli         s2, t4, 4
4518:             sra          s0, ra, a6
                  mulhu        ra, a5, t6
                  nop
                  bge          t2, t6, 4538f
                  srli         a3, s7, 13
                  c.nop
                  c.addi16sp   sp, -16
                  sltu         t6, tp, s6
                  c.srli       a0, 13
                  c.or         a2, s0
                  sltiu        s0, t6, -1659
                  slli         a6, s8, 21
                  bne          tp, t5, 4544f
                  bge          a1, t6, 4545f
                  c.addi4spn   s0, sp, 96
                  bge          a1, a4, 4541f
                  c.beqz       a2, 4535f
4535:             c.beqz       a2, 4544f
                  slt          t0, a6, s1
                  c.nop
4538:             blt          a4, s8, 4557f
                  ori          t4, t0, -1977
                  c.sub        a0, a5
4541:             sll          gp, s6, sp
                  rem          a1, t2, tp
                  c.srai       a0, 11
4544:             and          t1, s6, s6
4545:             lui          s10, 734417
                  lui          gp, 492266
                  srl          zero, s6, s7
                  ori          t5, a4, 1832
                  and          sp, tp, s2
                  c.and        s1, a3
                  sltu         ra, s0, a7
                  bgeu         t4, t2, 4553f
4553:             sll          s3, s9, tp
                  c.addi       s5, -1
                  add          s3, a5, s4
                  mulhu        s6, a6, s11
4557:             div          t1, s0, t4
                  c.lui        s1, 4
                  blt          s6, a4, 4579f
                  c.addi16sp   sp, -16
                  rem          t2, a0, s4
                  slli         tp, tp, 14
                  sra          t2, s4, s4
                  c.bnez       a2, 4571f
                  add          t4, t6, a1
                  add          zero, a2, gp
                  xori         a4, a5, 457
                  ori          t2, s2, -27
                  mul          s10, t0, sp
                  sltu         ra, s10, a4
4571:             bgeu         gp, s6, 4576f
                  sltu         s11, t1, t4
                  addi         a4, t5, 1218
                  addi         s6, gp, -113
                  add          t3, a5, t1
4576:             or           t3, s1, t0
                  mulh         t0, s3, s9
                  xor          gp, t2, s4
4579:             mulh         s3, a7, a0
                  mul          s3, a5, t3
                  c.nop
                  bltu         s6, t5, 4596f
                  srl          a3, s1, s11
                  ori          t5, s11, -994
                  andi         t6, a5, 1809
                  sub          s10, ra, t3
                  mulhu        s2, gp, s1
                  mulhsu       t6, t0, t0
                  slti         zero, t4, 1260
                  slli         a2, s7, 31
                  c.srai       a1, 18
                  bge          sp, t2, 4604f
                  c.or         s1, a5
                  c.bnez       a2, 4611f
                  bge          s9, s11, 4612f
4596:             c.srli       a1, 30
                  slti         t3, s11, 1811
                  ori          t4, s1, -1779
                  srl          s8, a3, a3
                  c.xor        a0, s0
                  addi         s11, s3, -670
                  nop
                  add          s11, s10, a5
4604:             c.and        a2, a0
                  remu         a0, s8, s4
                  c.lui        s9, 19
                  c.or         s0, s0
                  c.addi       t4, -1
                  c.add        s9, s0
                  xor          s9, a7, a7
4611:             mulh         s2, s10, a6
4612:             slt          s2, s0, t6
                  c.xor        a3, s0
                  auipc        t5, 833551
                  xor          s3, a6, a2
                  c.bnez       a4, 4635f
                  sltu         t3, s10, s6
                  c.mv         s5, t1
                  c.mv         t1, sp
                  divu         a1, a6, s8
                  mulhu        s4, t6, s4
                  c.or         s1, s0
                  bne          s7, a7, 4632f
                  beq          s2, a6, 4637f
                  c.srai       a0, 23
                  rem          t3, t2, a0
                  bne          s8, t0, 4639f
                  bltu         a5, a2, 4645f
                  sra          tp, t1, a2
                  or           s11, a2, s6
                  lui          t6, 1076
4632:             bne          a0, t4, 4646f
                  c.addi4spn   a3, sp, 736
                  c.li         s2, -1
4635:             c.nop
                  c.add        t1, ra
4637:             add          s10, s4, s1
                  andi         a0, s1, 595
4639:             bgeu         s5, s6, 4652f
                  blt          a5, s6, 4643f
                  addi         s9, t6, 322
                  auipc        s11, 369757
4643:             andi         a0, s4, -1957
                  div          a2, s0, a4
4645:             c.li         sp, -1
4646:             mulh         t1, a2, s0
                  nop
                  c.and        a3, a1
                  c.xor        a0, a1
                  srl          a3, s3, a1
                  c.srai       a3, 1
4652:             bne          t3, s5, 4653f
4653:             mulhu        a6, t5, gp
                  srli         a3, t2, 4
                  add          s8, s10, a5
                  bne          t2, s1, 4658f
                  mulh         s9, zero, sp
4658:             srl          a4, a4, tp
                  sltiu        s2, s4, -819
                  c.srai       a0, 24
                  beq          s9, ra, 4673f
                  sltiu        t5, t0, -50
                  c.bnez       a2, 4671f
                  c.add        s1, s10
                  sra          t2, s10, t0
                  bgeu         a1, s3, 4677f
                  c.slli       s6, 19
                  ori          s4, t2, 953
                  mul          s2, a4, tp
                  blt          t3, a7, 4679f
4671:             mulhsu       tp, a1, a0
                  slli         gp, a4, 12
4673:             mul          t4, t3, s1
                  or           s1, t4, ra
                  c.srli       a4, 22
                  c.mv         t6, s10
4677:             bne          s10, s8, 4678f
4678:             auipc        t3, 198639
4679:             srli         a4, t3, 31
                  srai         a1, tp, 7
                  xori         s9, s0, -16
                  addi         a1, zero, 1801
                  bgeu         t0, t6, 4694f
                  xor          a0, s4, t4
                  auipc        s2, 739009
                  lui          t3, 227167
                  c.lui        t0, 18
                  sub          s5, s0, zero
                  mul          s2, a0, a0
                  c.li         a3, 12
                  lui          s8, 838632
                  div          tp, s9, tp
                  c.srli       a3, 23
4694:             c.andi       a0, 10
                  addi         s3, s1, 290
                  c.srli       a4, 11
                  c.bnez       a0, 4713f
                  sll          s9, t3, a1
                  rem          s8, a6, t5
                  c.srai       a0, 24
                  sub          s6, t1, s1
                  sub          s5, t1, s5
                  xori         s8, t4, -1568
                  xori         s8, a3, -497
                  blt          a0, a2, 4722f
                  bge          s3, tp, 4707f
4707:             c.addi       s2, 21
                  c.slli       s5, 5
                  srl          s3, a7, a3
                  lui          s1, 152622
                  c.srai       s1, 31
                  c.nop
4713:             mulhsu       s8, a2, t4
                  c.andi       a0, 27
                  mulhsu       t5, a6, t0
                  remu         ra, s5, s5
                  c.slli       t1, 2
                  remu         s11, s11, a7
                  srai         t1, ra, 2
                  bltu         t1, s7, 4728f
                  c.or         a4, s1
4722:             slli         a1, a1, 11
                  c.beqz       s0, 4739f
                  c.or         a1, a5
                  c.and        a3, a5
                  srai         tp, s4, 18
                  c.li         s11, -1
4728:             slli         t3, gp, 10
                  c.add        s6, t3
                  bge          tp, s8, 4748f
                  c.addi16sp   sp, -16
                  sub          a0, s7, a3
                  c.slli       a4, 24
                  sltiu        a4, a7, 694
                  sltiu        s9, s7, 910
                  bne          a7, a7, 4740f
                  c.sub        a1, a1
                  c.and        a2, a1
4739:             or           a0, tp, t2
4740:             mulhu        a3, ra, sp
                  sltu         s11, t6, a1
                  c.li         t3, 28
                  sub          a6, t3, gp
                  beq          s1, t1, 4757f
                  sltu         s2, t3, t1
                  c.nop
                  addi         s3, s7, -599
4748:             srai         sp, s4, 22
                  c.and        a2, s0
                  c.srli       a0, 8
                  andi         s4, a2, -1865
                  slli         t2, s11, 15
                  c.xor        a2, a3
                  slti         a4, t5, 495
                  div          zero, s8, t4
                  mulh         sp, sp, s6
4757:             c.beqz       s1, 4775f
                  c.or         s0, a3
                  blt          a7, a1, 4764f
                  slti         s0, s8, -996
                  mul          s11, sp, t2
                  or           s0, a6, a7
                  sra          s9, zero, s1
4764:             c.beqz       a3, 4773f
                  c.mv         s1, a2
                  xor          s5, s7, s5
                  sub          a6, s5, t6
                  c.srli       a0, 6
                  c.li         t6, 0
                  c.sub        a2, a3
                  slli         sp, a5, 8
                  beq          a5, s6, 4779f
4773:             div          a4, s9, s0
                  sltiu        t1, a3, -271
4775:             c.addi4spn   a0, sp, 800
                  slti         a1, s5, -1319
                  c.li         s0, 15
                  bge          s2, s0, 4795f
4779:             xori         t4, s3, 1693
                  sll          s3, a4, sp
                  lui          s2, 142894
                  slti         s11, s7, -1122
                  c.bnez       a3, 4800f
                  c.andi       a2, -1
                  sltu         tp, a2, t0
                  c.li         a0, -1
main_64:          jal          ra, 21f
0:                c.j          12f
1:                c.j          20f
2:                c.j          4f
3:                jal          ra, 8f
4:                jal          s2, 0b
5:                jal          ra, 2b
6:                jal          a1, 1b
7:                jal          ra, 15f
8:                c.j          24f
9:                jal          ra, 7b
10:               c.jal        18f
11:               c.j          16f
12:               c.j          22f
13:               jal          t1, 11b
14:               jal          t1, 19f
15:               c.j          3b
16:               c.jal        5b
17:               jal          gp, 10b
18:               c.jal        23f
19:               c.jal        9b
20:               jal          ra, 26f
21:               c.j          25f
22:               c.j          14b
23:               c.j          13b
24:               c.jal        6b
25:               jal          tp, 17b
26:               rem          s1, a2, ra
                  addi         t3, t1, 500
                  c.beqz       s1, 4799f
                  nop
                  ori          s3, sp, -1428
                  c.andi       a2, 21
                  bne          t3, gp, 4808f
                  auipc        a3, 172159
                  c.srli       s1, 21
4795:             c.srai       s1, 8
                  c.addi16sp   sp, -16
                  c.li         t1, -1
                  nop
4799:             c.li         a0, 21
4800:             c.nop
                  divu         s9, ra, a2
                  c.and        a2, a4
                  c.lui        s3, 24
                  xor          s10, a1, t5
                  addi         t5, s8, -945
                  div          s10, a6, a2
                  c.srai       s1, 18
4808:             sltu         s1, a1, a2
                  sra          a3, s9, ra
                  xori         ra, s0, 700
                  c.srai       a2, 7
                  c.add        s3, a3
                  add          tp, a6, a6
                  xori         a6, a1, 1459
                  srli         t1, tp, 0
                  bltu         s9, s5, 4819f
                  srl          s2, a0, s7
                  srai         s9, s6, 9
4819:             ori          a2, s5, -946
                  bge          a0, a7, 4840f
                  slti         t6, tp, -1769
                  c.li         a1, -1
                  mulh         a2, s11, tp
                  bge          t6, s7, 4836f
                  div          a6, t5, a0
                  sltu         t2, tp, sp
                  c.nop
                  and          tp, s1, gp
                  rem          s2, s9, t2
                  c.sub        a3, a3
                  rem          s0, a7, s11
                  mulhsu       s5, a6, s1
                  nop
                  mulh         t6, zero, tp
                  slti         t4, a5, 1124
4836:             or           a2, sp, s3
                  c.sub        a0, a4
                  or           s10, t5, t3
                  remu         t6, s10, s8
4840:             xori         zero, a3, -964
                  rem          sp, zero, s11
                  slti         s2, t3, -1227
                  bltu         s7, sp, 4847f
                  mulhsu       a1, s6, s5
                  c.sub        s1, s0
                  andi         s6, t1, 1992
4847:             beq          a2, t2, 4855f
                  srl          s5, zero, s9
                  rem          s3, s7, s10
                  c.lui        s2, 23
                  c.li         s9, 24
                  sltiu        t0, s0, -1958
                  c.addi       a4, -1
                  sltu         t1, s11, t1
4855:             remu         s3, zero, s10
                  ori          s9, s7, -1055
                  c.or         a1, a1
                  bne          a5, s7, 4860f
                  c.addi4spn   a0, sp, 464
4860:             c.or         s0, s1
                  auipc        t2, 330755
                  c.srai       s1, 2
                  bgeu         t4, sp, 4880f
                  slt          t1, a7, s8
                  c.and        a2, a3
                  c.li         gp, -1
                  and          s4, t2, t5
                  auipc        a0, 344421
                  mulh         s9, zero, a7
                  nop
                  sltiu        zero, a2, -420
                  nop
                  slli         t0, sp, 3
                  sltu         t0, t3, a3
                  ori          sp, sp, -386
                  xor          t6, gp, t6
                  xori         s4, s6, -1153
                  c.slli       t3, 5
                  la           a6, sub_3
                  andi         a0, s6, 873
                  c.or         a3, a1
                  addi         a6, a6, -242
                  rem          t0, t2, a3
                  mul          zero, s4, s2
                  bltu         a1, t2, main_j3 #branch to jump instr
                  sub          ra, s8, a7
                  divu         s5, s3, a3
                  sll          sp, t4, a4
main_j3:          jalr         ra, a6, 242 #jump main -> sub_3
                  c.addi4spn   a1, sp, 352
                  mulhsu       t4, s9, t1
                  beq          s3, s9, 4891f
4880:             c.and        a2, a1
                  c.addi       ra, 1
                  div          a6, a5, t3
                  addi         a6, a6, 1342
                  c.li         t6, 31
                  add          s6, s10, t5
                  c.srli       a4, 15
                  mul          s8, t3, a6
                  auipc        a6, 243043
                  c.lui        s2, 1
                  mulhsu       t4, tp, s9
4891:             c.bnez       s1, 4908f
                  c.bnez       s0, 4905f
                  remu         s4, t3, a7
                  ori          a4, t2, -1904
                  sub          a4, s2, t3
                  mulh         sp, s10, a1
                  c.bnez       a3, 4898f
4898:             mulhsu       t0, t5, tp
                  beq          s8, a6, 4918f
                  mulhu        s5, a4, t1
                  add          s10, tp, a2
                  c.bnez       a3, 4903f
4903:             c.sub        s1, a2
                  sll          zero, t0, sp
4905:             beq          a3, s11, 4919f
                  bgeu         a1, s2, 4920f
                  div          zero, zero, gp
4908:             remu         s1, s10, a0
                  addi         t1, s5, 82
                  c.nop
                  c.and        a4, a1
                  sltu         tp, t1, a1
                  c.addi       t1, -1
                  c.slli       s3, 28
                  c.andi       s1, -1
                  c.bnez       s1, 4925f
                  c.lui        ra, 1
4918:             c.li         t0, -1
4919:             c.xor        a1, a3
4920:             c.nop
                  and          t3, s6, a2
                  c.beqz       a3, 4934f
                  c.lui        s6, 22
                  bltu         sp, s8, 4925f
4925:             ori          s1, s0, -1424
                  blt          zero, t5, 4934f
                  sltu         s4, a2, a3
                  c.addi       t0, 22
                  ori          a6, t4, -1899
                  sra          a6, t5, t1
                  rem          s8, t1, t2
                  bne          t4, t5, 4948f
                  mulhsu       t3, t2, a2
4934:             bge          ra, s8, 4945f
                  or           s9, t0, s9
                  sra          tp, s9, sp
                  sll          a3, s0, t0
                  c.slli       s9, 13
                  bltu         a5, t6, 4953f
                  mulh         sp, a5, t1
                  c.lui        s0, 4
                  nop
                  sll          t4, t5, s3
                  srai         tp, ra, 28
4945:             c.add        s4, a2
                  c.mv         a3, gp
                  sltu         a3, sp, t1
4948:             c.sub        a4, s0
                  c.addi4spn   a1, sp, 64
                  slt          s2, t2, zero
                  div          t0, t6, a3
                  blt          gp, a5, 4957f
4953:             c.srai       a1, 17
                  beq          s3, sp, 4968f
                  srli         t3, s8, 7
                  addi         s8, gp, 413
4957:             mulhu        a0, s11, s4
                  bge          a1, a0, 4961f
                  beq          a1, s6, 4971f
                  sltu         zero, s9, sp
4961:             mulh         s4, a7, a7
                  divu         gp, s5, gp
                  remu         t3, s4, a4
                  slt          t4, a3, t4
                  add          s1, a7, zero
                  or           a1, s4, a6
                  srl          a4, s2, t6
4968:             and          s11, zero, t6
                  c.xor        s0, a2
                  c.li         s0, 11
4971:             mulh         s3, sp, a5
                  and          s4, a1, s9
                  c.addi4spn   s1, sp, 48
                  bltu         s11, t2, 4982f
                  beq          s11, gp, 4977f
                  blt          gp, a2, 4983f
4977:             bne          gp, t1, 4989f
                  auipc        a3, 59061
                  srl          s2, s7, a3
                  beq          zero, s6, 4988f
                  c.li         a0, -1
4982:             addi         s11, t4, -1281
4983:             rem          ra, t1, t4
                  sll          s0, tp, a6
                  mul          a2, a0, s0
                  mulh         s3, s3, t2
                  c.addi4spn   a2, sp, 704
4988:             xori         s1, zero, 756
4989:             c.mv         s5, a5
                  rem          s5, t2, s1
                  or           a0, s4, s5
                  sub          ra, a5, s4
                  blt          s5, a3, 4994f
4994:             mulh         s5, a1, t1
                  c.nop
                  addi         a2, sp, -1734
                  bne          a2, a1, 5001f
                  sra          t1, t6, zero
                  xor          t5, a0, a6
                  bltu         a6, s3, 5013f
5001:             beq          t6, a7, 5002f
5002:             lui          t1, 41272
                  andi         s1, s8, -1220
                  beq          s10, sp, 5016f
                  slti         t5, s2, 243
                  sub          s2, zero, s1
                  srli         t2, t4, 12
                  bltu         t2, ra, 5021f
                  slt          t0, a4, zero
                  c.andi       a1, 14
                  bne          s9, sp, 5027f
                  or           a4, t4, a3
5013:             xor          zero, s4, a0
                  rem          a0, sp, tp
                  auipc        s6, 674328
5016:             c.nop
                  sll          a4, tp, t1
                  divu         a4, a7, s6
                  sltiu        a4, a5, -283
                  c.xor        s0, a5
5021:             div          zero, tp, s4
                  sltiu        t4, s5, 1494
                  remu         t0, gp, t5
                  xor          a6, a7, sp
                  c.beqz       a1, 5034f
                  c.srai       a2, 17
5027:             bne          gp, s11, 5038f
                  slli         s9, t4, 13
                  auipc        a6, 387679
                  sll          t6, a2, t1
                  sltu         ra, t0, gp
                  nop
                  srl          s3, s6, s7
5034:             bltu         tp, a7, 5051f
                  rem          s8, a1, t4
                  mulh         s3, s8, t1
                  addi         a1, zero, 1376
5038:             c.mv         tp, s0
                  andi         s1, s11, -1638
                  c.sub        a1, a3
                  c.srli       a2, 13
                  sub          a0, t0, s4
                  mul          t3, s4, a2
                  c.and        a4, a5
                  c.add        s6, sp
                  bgeu         t2, tp, 5055f
                  c.andi       s0, -1
                  rem          a0, t4, ra
                  c.li         s0, 10
                  c.srli       a3, 21
5051:             srl          a2, s8, zero
                  bgeu         a4, t4, 5069f
                  sra          t1, tp, a6
                  c.beqz       s0, 5070f
5055:             mulh         a6, s6, tp
                  slti         s11, t3, -1551
                  c.beqz       a1, 5074f
                  beq          s9, zero, 5059f
5059:             blt          a4, a0, 5070f
                  or           s11, a0, a2
                  add          sp, a3, a0
                  srai         t1, t2, 13
                  c.bnez       s1, 5081f
                  c.mv         s8, a5
                  rem          tp, s7, tp
                  slt          s3, s6, gp
                  addi         s4, a1, -1974
                  sub          s9, a7, a7
5069:             c.addi4spn   s1, sp, 976
5070:             beq          a1, a7, 5090f
                  bgeu         s2, s0, 5090f
                  mul          s11, s2, a1
                  bgeu         s11, a0, 5090f
5074:             blt          s7, s7, 5082f
                  c.andi       a1, 14
                  bltu         s10, t4, 5088f
                  nop
                  c.bnez       a4, 5089f
                  c.lui        tp, 29
                  c.addi       t2, 1
5081:             or           s8, t3, a5
5082:             ori          a0, t3, 1032
                  c.sub        a3, a5
                  c.add        s10, s10
                  bgeu         s10, a7, 5092f
                  add          s4, t5, a4
                  beq          s11, a0, 5100f
5088:             sll          a2, s2, a4
5089:             bge          s11, s2, 5105f
5090:             blt          s5, s7, 5104f
                  c.mv         t3, t3
5092:             c.nop
                  sltu         s3, tp, s1
                  c.add        t5, s11
                  c.lui        t1, 2
                  c.addi16sp   sp, -16
                  c.srai       a4, 11
                  srl          t1, t2, sp
                  divu         a2, tp, s8
5100:             c.add        sp, s7
                  bge          t2, t4, 5110f
                  div          t6, tp, a6
                  c.addi4spn   a0, sp, 736
5104:             c.andi       a1, 19
5105:             c.srai       a4, 30
                  c.and        a1, s1
                  andi         s6, s0, 30
                  c.slli       t0, 30
                  c.and        a4, s1
5110:             mulh         a0, s1, s2
                  rem          s9, a5, s0
                  bge          t6, t5, 5113f
5113:             c.xor        s0, a1
                  sltu         s4, s1, s7
                  c.and        a2, a3
                  c.andi       s0, 31
                  sltu         a0, tp, ra
                  mulhsu       s9, t0, s7
                  rem          ra, zero, s9
                  auipc        a2, 1039814
                  ori          s11, a6, 1897
                  srli         s10, t2, 20
                  blt          s1, a2, 5124f
5124:             sra          a0, s7, ra
                  sltu         s1, s9, t6
                  slli         a3, zero, 2
                  sltu         a3, zero, s10
                  bgeu         gp, a2, 5142f
                  c.li         t5, -1
                  la           s11, region_0+920 #start riscv_load_store_hazard_instr_stream_3
                  lhu          t4, 44(s11)
                  lbu          s5, 44(s11)
                  sb           a5, -11(s11)
                  lbu          zero, -11(s11)
                  sb           s5, -11(s11)
                  c.srli       a1, 8
                  lb           t5, 57(s11)
                  lbu          t4, 34(s11)
                  lhu          t1, -14(s11)
                  lhu          t3, -14(s11)
                  lhu          a6, -2(s11)
                  lb           a1, -39(s11) #end riscv_load_store_hazard_instr_stream_3
                  c.add        t5, a4
                  addi         s4, t0, -1478
                  addi         s8, zero, 1515
                  c.addi16sp   sp, -16
                  c.srli       s1, 8
                  c.bnez       a2, 5140f
                  xori         t5, a6, 804
                  mulhsu       zero, s8, a3
                  mul          a6, gp, s8
                  bge          t3, tp, 5156f
5140:             mul          ra, s1, a6
                  xori         a3, s7, 1141
5142:             c.andi       a2, 25
                  or           s1, s3, zero
                  c.andi       s1, 24
                  remu         s10, s5, a5
                  bge          s2, s6, 5163f
                  xor          t4, ra, t0
                  c.or         a1, a2
                  c.beqz       a0, 5165f
                  mulhsu       t2, a6, a3
                  bge          t2, s4, 5163f
                  c.slli       a3, 24
                  sltiu        gp, s11, 259
                  slli         t6, a2, 7
                  srai         t2, t4, 30
5156:             mulh         sp, s8, a2
                  sra          s3, t0, a2
                  bgeu         s10, s9, 5178f
                  c.addi4spn   a3, sp, 144
                  bge          a0, a6, 5179f
                  nop
                  ori          s0, s3, 1122
5163:             sll          tp, s6, a0
                  c.or         s0, s1
5165:             xor          a0, gp, s2
                  and          s1, t4, t1
                  c.or         a1, a0
                  c.nop
                  slli         a2, s4, 14
                  c.xor        a3, s0
                  andi         s9, sp, -380
                  auipc        t6, 722993
                  andi         s1, t2, 1128
                  lui          s9, 804147
                  bgeu         s7, t0, 5184f
                  and          s4, s11, t4
                  slti         t0, s8, -136
5178:             andi         t2, a4, 101
5179:             or           zero, s7, t5
                  xor          ra, t5, gp
                  c.xor        a1, a3
                  srli         t0, s2, 22
                  and          t0, t4, s3
5184:             bne          t5, ra, 5196f
                  c.addi4spn   s1, sp, 928
                  mulhsu       t3, s0, sp
                  c.bnez       a3, 5189f
                  c.xor        a1, s1
5189:             sltiu        tp, a6, -627
                  bgeu         t6, s8, 5208f
                  add          t3, gp, a0
                  xor          t2, a4, s5
                  c.add        s4, s6
                  c.or         s1, a2
                  srai         s9, s2, 7
5196:             xor          s6, a6, a0
                  c.andi       s1, -1
                  c.addi16sp   sp, -16
                  c.bnez       a2, 5212f
                  slli         zero, s0, 26
                  slt          s0, s11, s1
                  c.beqz       a2, 5206f
                  sra          s8, ra, a4
                  andi         t0, t4, 923
                  divu         s2, s1, a7
5206:             slli         t5, sp, 31
                  c.sub        a4, s1
5208:             divu         s8, gp, s10
                  mulh         s4, s11, gp
                  remu         s5, s9, ra
                  c.and        s1, a5
5212:             c.addi       a3, -1
                  srl          s6, a4, t1
                  c.mv         s1, a6
                  c.beqz       s1, 5216f
5216:             bne          s9, sp, 5219f
                  c.bnez       a4, 5228f
                  addi         s8, a1, -698
5219:             bne          tp, s11, 5236f
                  or           a4, s1, s9
                  c.addi       s6, -1
                  div          s5, t1, s9
                  and          a1, t2, ra
                  c.and        s1, s0
                  c.andi       a4, -1
                  c.srai       s1, 29
                  c.and        a1, a0
5228:             mul          s3, s3, ra
                  c.sub        a4, s0
                  beq          t3, t2, 5238f
                  add          s5, t2, zero
                  slti         a0, t6, 90
                  c.srli       a4, 1
                  c.addi4spn   a0, sp, 272
                  c.and        a3, a3
5236:             c.bnez       a4, 5253f
                  c.and        s1, a4
5238:             rem          a1, t2, s2
                  c.andi       s0, -1
                  bne          s8, t2, 5248f
                  bgeu         sp, s5, 5242f
5242:             c.srli       s0, 5
                  addi         ra, a1, 1113
                  slti         s2, sp, -1348
                  c.nop
                  sltu         t2, a1, a3
                  c.or         a3, s1
5248:             sll          t3, s8, gp
                  c.andi       a3, -1
                  blt          s4, s7, 5262f
                  srai         t6, a5, 1
                  add          s4, s10, a1
5253:             and          t4, s8, s1
                  divu         tp, gp, t2
                  c.addi4spn   a4, sp, 848
                  c.bnez       s1, 5268f
                  c.add        t5, s0
                  srai         a0, t6, 25
                  srl          sp, tp, s2
                  srai         a2, t1, 6
                  or           ra, a6, s8
5262:             c.slli       sp, 31
                  sltiu        t4, s3, 625
                  xor          t3, sp, a5
                  slli         sp, s5, 27
                  beq          s0, a7, 5282f
                  add          t5, a0, a4
5268:             c.add        s10, s10
                  andi         t3, t0, -1536
                  c.bnez       s0, 5281f
                  c.bnez       s1, 5275f
                  c.addi       tp, -1
                  c.bnez       s1, 5290f
                  c.bnez       s0, 5293f
5275:             c.li         a0, 25
                  c.xor        a0, a4
                  slt          t5, gp, s5
                  c.addi16sp   sp, 112
                  bge          a5, s1, 5299f
                  blt          s7, t0, 5294f
5281:             c.addi4spn   a4, sp, 944
5282:             rem          s10, s3, s8
                  remu         t1, s9, t4
                  xori         a4, t0, 527
                  and          t6, t4, t1
                  c.and        a3, a4
                  c.addi16sp   sp, 176
                  c.addi       s5, 17
                  lui          t0, 344556
5290:             c.lui        t4, 31
                  c.bnez       a4, 5294f
                  c.addi4spn   a3, sp, 496
5293:             div          a4, s2, t6
5294:             auipc        sp, 414867
                  add          t6, s3, s5
                  mulh         t0, a5, a7
                  slli         a3, a4, 0
                  c.lui        s4, 6
5299:             addi         t6, s2, -1873
                  xori         a0, a6, -1895
                  c.and        s1, a4
                  c.lui        s9, 22
                  c.and        a2, a2
                  mulhu        s9, s4, a0
                  mulh         sp, a1, s4
                  nop
                  c.li         t4, -1
                  c.addi       s3, 7
                  c.addi16sp   sp, -16
                  div          s2, s10, sp
                  sltiu        t0, s10, -1842
                  c.andi       a1, -1
                  xori         sp, s1, 365
                  c.li         a6, 2
                  xori         ra, a3, -45
                  c.mv         s11, a1
                  sltiu        a4, s10, -1775
                  sltu         sp, a3, s6
                  mulhsu       zero, a7, s11
                  bgeu         t6, t2, 5337f
                  srli         t2, t0, 19
                  c.xor        a3, s1
                  c.xor        a2, s0
                  sll          a0, s10, sp
                  c.slli       gp, 2
                  mul          t6, s11, tp
                  bge          tp, t0, 5334f
                  c.sub        a1, a5
                  ori          tp, gp, 1991
                  bltu         a0, s8, 5343f
                  xori         t3, s4, 1451
                  c.xor        s0, a2
                  div          s1, a0, s4
5334:             c.add        s6, t5
                  rem          s3, s8, ra
                  c.nop
5337:             c.addi4spn   a2, sp, 672
                  mulhu        a6, s5, a4
                  c.bnez       a1, 5357f
                  slt          t4, zero, t5
                  c.slli       a3, 22
                  and          s8, a1, a1
5343:             add          s5, s0, t3
                  slli         s6, t3, 23
                  mul          t1, a0, gp
                  mul          ra, a4, t6
                  slli         tp, s7, 22
                  c.bnez       a4, 5362f
                  c.addi16sp   sp, -16
                  c.andi       a3, -1
                  xori         sp, a0, 1910
                  bge          a2, s1, 5363f
                  slli         t0, s2, 1
                  sll          a3, a1, t5
                  slt          a0, s6, gp
                  bgeu         a2, t1, 5365f
5357:             c.addi16sp   sp, -16
                  c.or         a1, a4
                  sra          a1, t5, s2
                  mulhsu       t5, s5, s9
                  sltiu        s6, a4, 796
5362:             sltiu        a0, a2, 407
5363:             srl          t6, a5, s7
                  srli         t2, a6, 24
5365:             sll          s2, s1, s1
                  c.nop
                  sltiu        s9, a4, 1400
                  mulh         a4, s4, zero
                  c.add        a2, t4
                  sll          t5, s2, a2
                  xori         s3, a3, 1950
                  remu         a0, s8, a5
                  ori          a0, sp, 108
                  addi         s2, gp, -1719
                  nop
                  rem          s10, s7, s3
                  c.srli       s0, 8
                  slt          s1, a5, s1
                  c.slli       s10, 6
                  c.beqz       s1, 5393f
                  bltu         s0, s2, 5386f
                  div          s10, a5, a4
                  c.li         t4, -1
                  c.nop
                  c.or         a2, a2
5386:             sub          zero, t6, a5
                  sra          a6, a5, a1
                  slti         tp, t4, -1199
                  c.andi       a4, -1
                  slti         a0, s10, -1479
                  c.addi16sp   sp, -16
                  c.addi       a4, -1
5393:             and          zero, s11, s7
                  c.srli       a1, 2
                  srli         s6, t0, 15
                  divu         t6, s9, s0
                  c.sub        a3, a5
                  lui          a0, 285324
                  slt          a6, gp, s8
                  auipc        t6, 408250
                  div          s9, a0, s1
                  c.xor        a0, a2
                  sltu         s9, t0, s9
                  c.bnez       s1, 5405f
5405:             c.srai       a0, 25
                  beq          s7, t6, 5415f
                  blt          gp, s5, 5424f
                  ori          tp, s2, 473
                  andi         t1, s8, -1677
                  c.slli       t5, 14
                  auipc        s10, 978149
                  mulh         zero, a1, s4
                  mulhu        t0, s9, s0
                  sltu         s0, s3, s7
5415:             c.add        s5, s1
                  srai         ra, zero, 17
                  mulhu        t0, t6, s6
                  c.addi       ra, 22
                  bne          t1, sp, 5427f
                  srai         t2, t0, 26
                  mulhu        sp, s9, a5
                  c.srai       a1, 10
                  c.bnez       s1, 5439f
5424:             sll          s3, a5, t3
                  c.and        s1, a0
                  bltu         t3, t4, 5443f
5427:             c.andi       a0, -1
                  mul          a1, gp, s2
                  c.or         a0, a5
                  c.bnez       a2, 5432f
                  sltiu        s1, a6, 696
5432:             xor          t2, s8, s11
                  c.addi4spn   a3, sp, 416
                  c.srli       a3, 6
                  c.xor        a4, a5
                  srai         s1, s8, 17
                  nop
                  c.li         s6, -1
5439:             c.srli       a2, 11
                  rem          a0, s2, sp
                  mulhsu       s3, tp, a0
                  slli         a4, s2, 7
5443:             divu         s2, s1, a4
                  c.addi16sp   sp, -16
                  slti         s9, a2, 976
                  c.add        gp, s0
                  bne          zero, s9, 5459f
                  c.and        s0, a3
                  ori          s0, s5, 1326
                  c.mv         t1, s5
                  rem          t1, tp, a3
                  addi         t1, s8, 96
                  xor          s4, ra, s6
                  bltu         a5, t0, 5455f
5455:             c.lui        a6, 7
                  beq          sp, s1, 5469f
                  div          t4, s5, t4
                  divu         t4, a1, a3
5459:             srl          tp, s2, t1
                  sra          s6, a4, a3
                  c.bnez       a4, 5477f
                  auipc        a4, 667172
                  bge          zero, s5, 5471f
                  rem          gp, s7, a6
                  c.sub        s0, s1
                  sll          s3, t1, a4
                  andi         t5, s6, 682
                  and          tp, s6, sp
5469:             c.beqz       a3, 5478f
                  sltu         tp, s11, t3
5471:             sll          a4, a2, s6
                  c.sub        a1, s0
                  auipc        a2, 707488
                  or           t4, zero, s6
                  slti         t4, s2, -1088
                  c.lui        s9, 4
5477:             c.addi16sp   sp, -16
5478:             blt          s4, t5, 5489f
                  mulh         ra, t3, s10
                  c.and        a4, a3
                  beq          s8, t1, 5486f
                  c.srai       s0, 23
                  c.slli       s3, 31
                  addi         s11, s8, -1997
                  beq          s9, s9, 5487f
5486:             xori         zero, a6, 1028
5487:             xor          zero, a5, t2
                  or           s4, s11, a7
5489:             beq          a2, zero, 5506f
                  rem          t2, s0, s2
                  c.mv         t0, a0
                  and          s5, s8, t1
                  slti         s2, gp, 35
                  c.sub        a3, a2
                  and          s10, s4, s5
                  c.srai       a4, 15
                  sll          a0, t4, a0
                  sltu         s5, gp, s9
                  sra          sp, s1, s0
                  c.addi       t2, 18
                  srl          zero, s5, a0
                  sra          s9, s6, s8
                  c.srli       a3, 23
                  sltiu        t2, s2, -494
                  andi         s1, gp, -1609
5506:             slt          s10, s9, s11
                  c.addi4spn   a4, sp, 64
                  bgeu         t2, t6, 5509f
5509:             sltiu        s2, a1, 1211
                  c.nop
                  rem          s2, s1, t6
                  c.mv         s6, t2
                  sra          a3, t1, s1
                  sub          a3, tp, gp
                  c.add        a0, sp
                  mul          t1, t6, a1
                  bge          t4, t3, 5534f
                  divu         zero, s8, s2
                  bgeu         t0, s1, 5539f
                  div          a6, gp, t6
                  c.andi       a1, 22
                  c.bnez       s1, 5535f
                  srli         s1, s9, 29
                  slt          a3, a6, gp
                  mul          t1, a3, s1
                  bne          s5, s9, 5530f
                  xor          s9, ra, s2
                  srl          a3, a7, sp
                  andi         sp, s3, -780
5530:             sll          t6, s3, s5
                  c.mv         a1, a0
                  c.slli       t0, 26
                  andi         a3, a6, 591
5534:             remu         a4, ra, ra
5535:             lui          a6, 864141
                  sltu         tp, a2, a2
                  c.or         a0, s0
                  mulh         t4, s8, a4
5539:             mul          a2, s2, t4
                  xor          a0, a4, t0
                  addi         s11, s5, -2032
                  c.or         s1, a2
                  xori         s4, tp, 37
                  ori          a1, t2, -557
                  mulhu        s0, a0, s0
                  c.addi16sp   sp, -16
                  sltu         t0, s9, s6
                  andi         s6, a7, -644
                  xori         t6, sp, -1164
                  mulhu        s5, a3, s5
                  bgeu         a3, s10, 5565f
                  c.li         sp, -1
                  c.nop
                  mul          a0, t0, gp
                  sra          s3, s0, a3
                  xor          s5, a4, t2
                  c.xor        a2, a2
                  c.addi4spn   a0, sp, 368
                  divu         a3, tp, t4
                  c.nop
                  and          s10, t4, sp
                  c.addi16sp   sp, -16
                  mulhu        t5, gp, t0
                  sltu         t2, sp, ra
5565:             sub          gp, s1, a1
                  andi         a1, s0, 1424
                  sub          s1, t6, a1
                  or           s10, sp, a0
                  xori         t0, a3, 1604
                  ori          t0, s3, -352
                  slli         s8, t4, 27
                  or           t1, s7, t4
                  c.sub        a0, a4
                  bne          s7, t3, 5586f
                  beq          s4, a7, 5578f
                  c.nop
                  c.nop
5578:             div          t2, s6, a5
                  c.srli       a4, 16
                  c.nop
                  remu         gp, zero, a0
                  bgeu         t3, a6, 5593f
                  c.addi16sp   sp, 368
                  xori         t4, zero, 794
                  mulh         s5, s10, s2
5586:             beq          sp, a4, 5602f
                  c.addi       a2, 19
                  sll          sp, t6, s2
                  c.slli       s3, 4
                  c.srli       a1, 13
                  sub          t6, t1, a4
                  remu         s0, s7, t6
5593:             c.and        a3, a4
                  beq          s6, s4, 5608f
                  beq          s7, a1, 5604f
                  c.srli       a3, 1
                  c.addi4spn   a2, sp, 448
                  c.and        s1, a1
                  mul          a1, ra, s7
                  auipc        sp, 671222
                  bltu         a3, s2, 5602f
5602:             c.and        a0, a4
                  beq          t0, s5, 5622f
5604:             div          a2, s11, s9
                  c.lui        ra, 2
                  slt          t4, s10, tp
                  blt          t4, s0, 5615f
5608:             slt          s3, s3, t1
                  xori         a4, s6, -1617
                  sltiu        a0, a2, -1950
                  rem          a6, s3, a5
                  ori          t0, t4, -1036
                  c.mv         t0, t6
                  c.nop
5615:             sltu         a1, s9, a2
                  srai         t3, a4, 28
                  bge          s9, a3, 5635f
                  lui          s0, 280137
                  mulhu        s6, s10, s4
                  div          a4, s6, s9
                  beq          t0, s9, 5622f
5622:             sll          a6, a6, t5
                  slli         s0, a5, 7
                  lui          s11, 411571
                  c.xor        s1, a1
                  and          t1, a5, ra
                  c.addi       s1, 13
                  c.lui        t6, 14
                  mulhu        s0, t2, a2
                  rem          a3, sp, a3
                  div          zero, t4, a5
                  c.add        a6, s8
                  addi         a1, a0, -1578
                  add          t0, sp, a7
5635:             c.andi       a1, -1
                  mulhu        a1, gp, a5
                  div          t6, s1, zero
                  divu         zero, t2, s6
                  slli         ra, t0, 21
                  c.srai       s0, 22
                  c.srai       s0, 15
                  slti         a3, tp, -874
                  c.and        s0, a5
                  ori          a6, s2, -1202
                  c.lui        t2, 31
                  c.addi16sp   sp, 80
                  c.or         a1, a2
                  la           gp, region_0+1783 #start load_store_instr_stream_0
                  lhu          zero, -933(gp)
                  la           s2, region_0+1755 #start load_store_instr_stream_1
                  sb           t3, -474(gp)
                  sb           a5, 182(s2)
                  lbu          a1, -1370(gp)
                  sb           t3, -100(s2)
                  lbu          a6, -1715(gp)
                  sb           a5, 210(s2)
                  sb           t6, 158(s2)
                  sb           s6, -958(gp)
                  sb           ra, -56(s2)
                  lh           s11, 193(s2)
                  sb           gp, -1352(gp)
                  lb           s10, -936(gp)
                  sb           t5, 169(s2) #end load_store_instr_stream_1
                  lw           s6, -435(gp) #end load_store_instr_stream_0
                  sll          s3, s10, t5
                  xori         s8, a1, 1591
                  bgeu         a7, a4, 5662f
                  c.srli       a4, 5
                  c.andi       a3, -1
                  xori         a1, s5, 1382
                  xori         t2, ra, 193
                  ori          s2, a7, -1278
                  mulhsu       t0, s7, a0
                  slt          zero, a2, s6
                  bne          s5, s10, 5670f
                  c.srai       a0, 28
                  c.mv         t1, t0
                  srai         s5, tp, 20
5662:             beq          a1, ra, 5679f
                  c.nop
                  sll          ra, t5, a2
                  c.slli       sp, 17
                  bgeu         t0, ra, 5683f
                  bltu         t2, s5, 5674f
                  c.srai       a2, 26
                  c.add        gp, a6
5670:             mul          t1, s6, t3
                  c.add        s2, ra
                  srl          ra, a3, t5
                  auipc        t6, 719780
5674:             divu         t0, a4, sp
                  c.lui        s10, 22
                  bne          s11, s9, 5688f
                  slt          s2, a0, zero
                  slti         s8, s1, -1405
5679:             bge          t6, t3, 5695f
                  c.srai       s0, 24
                  slt          s9, a1, s0
                  andi         s4, a7, -152
5683:             nop
                  c.andi       s0, 31
                  addi         t3, t3, -75
                  c.srai       s1, 13
                  slt          a0, t6, s2
5688:             c.slli       tp, 24
                  c.mv         tp, s5
                  mulhu        t5, ra, s5
                  c.and        a3, a4
                  mulhu        s10, a3, s8
                  sra          t3, t1, t0
                  auipc        t3, 32775
5695:             add          t3, a0, s8
                  or           t5, a7, a1
                  rem          t2, a0, t3
                  bltu         s9, s6, 5712f
                  c.add        s3, a5
                  c.and        a0, a3
                  mul          s0, s10, a4
                  divu         a3, s4, t1
                  rem          s4, s5, a3
                  sra          s3, zero, a4
                  slti         t0, t4, 1848
                  c.add        t3, s1
                  c.xor        a4, a4
                  andi         s11, t6, 271
                  mul          s5, s5, ra
                  c.li         t4, 15
                  bgeu         s0, s4, 5719f
5712:             c.srli       a0, 12
                  mulhsu       t6, a7, s7
                  sltu         gp, a4, gp
                  blt          t5, s11, 5734f
                  addi         s11, s9, -1819
                  c.addi16sp   sp, 144
                  sra          s4, t3, a4
5719:             mulh         s2, t3, s3
                  sltu         a2, t3, ra
                  xor          a1, t2, a6
                  srl          s5, a0, s8
                  divu         a6, s4, s9
                  sltu         s10, a7, ra
                  addi         s1, zero, -8 #init loop 1 counter
                  xori         s5, a7, 1477
                  addi         zero, zero, 0 #init loop 1 limit
                  sltu         a4, gp, zero
main_121_1_t:     c.nop
                  addi         s1, s1, 2 #update loop 1 counter
                  addi         s6, zero, -3 #init loop 0 counter
                  sub          t2, gp, t1
                  addi         s11, s8, -1137
                  slt          a0, gp, tp
                  slli         s2, s2, 9
                  mul          gp, t3, t2
                  c.sub        s0, a3
                  rem          s8, s6, s8
                  add          t5, a4, s5
                  divu         a4, a1, s4
                  addi         tp, zero, 7 #init loop 0 limit
main_121_0_t:     slt          a2, t4, s8
                  sltiu        a3, s3, -485
                  addi         s6, s6, 10 #update loop 0 counter
                  xor          t1, a1, gp
                  c.add        gp, a7
                  bne          s6, tp, main_121_0_t #branch for loop 0
                  ori          t1, a6, 1920
                  add          t2, t3, s4
                  xori         t6, a3, -723
                  c.sub        a0, a5
                  xor          s8, a6, a6
                  c.bnez       s1, main_121_1_t #branch for loop 1
                  mulhsu       s4, s5, s11
                  auipc        t2, 737803
                  c.srli       a2, 1
                  blt          s7, s8, 5729f
                  and          s1, s6, s5
5729:             and          s9, a4, t1
                  mul          t0, t4, a5
                  ori          s1, a0, 1305
                  c.andi       a2, -1
                  bne          s1, sp, 5750f
5734:             remu         t0, a3, s7
                  sra          ra, ra, s1
                  c.add        s8, t5
                  c.add        s11, a6
                  c.bnez       s0, 5749f
                  c.add        s1, s8
                  blt          t2, a1, 5744f
                  c.or         a4, s1
                  beq          ra, gp, 5754f
                  rem          s0, t0, t5
5744:             slt          t0, gp, t1
                  c.addi4spn   s1, sp, 736
                  c.sub        a0, s1
                  ori          a4, t6, -338
                  c.and        s0, a0
5749:             c.srai       a1, 12
5750:             mul          tp, s0, a3
                  c.add        a3, s1
                  c.sub        a3, s1
                  c.xor        a3, a4
5754:             remu         s2, t4, t4
                  c.lui        a3, 14
                  bgeu         s11, tp, 5776f
                  bltu         a5, s7, 5769f
                  ori          s0, a3, -700
                  bne          s1, t4, 5770f
                  c.bnez       a3, 5761f
5761:             sll          s1, t5, a1
                  div          a4, tp, s11
                  ori          t2, s10, 2022
                  beq          s5, t4, 5781f
                  sub          a0, s8, s4
                  andi         s6, a3, 1620
                  mulh         a6, a5, gp
                  beq          s7, t0, 5769f
5769:             nop
5770:             slti         s10, t6, -122
                  srai         s2, a3, 4
                  c.add        s1, a0
                  beq          a6, sp, 5780f
                  lui          a6, 1030004
                  c.xor        s0, a3
5776:             sltu         s1, s2, t1
                  c.and        a4, a1
                  addi         s11, zero, -672
                  srli         ra, s6, 0
5780:             c.addi       t0, -1
5781:             c.sub        a0, a3
                  c.andi       a0, -1
                  c.add        s0, s3
                  sltiu        a4, t3, 713
                  xor          a6, a7, t6
                  sub          a4, zero, a5
                  ori          s5, zero, -1443
                  c.li         a2, -1
                  c.add        ra, t2
                  sltiu        a6, s11, 1626
                  c.or         a0, a0
                  c.addi4spn   s0, sp, 16
                  c.slli       gp, 27
                  sltu         a1, sp, t3
                  c.or         a0, a2
                  rem          s10, s7, a7
                  bgeu         s3, a3, 5802f
                  slli         a4, tp, 13
                  c.addi4spn   a4, sp, 704
                  divu         sp, tp, s8
                  c.sub        s1, s1
5802:             srli         a1, s3, 5
                  c.slli       s9, 2
                  remu         t1, s10, t2
                  c.xor        a3, a3
                  andi         s2, s9, 1498
                  sltu         a0, tp, a3
                  c.srli       a0, 12
                  c.nop
                  auipc        s10, 711401
                  mul          s6, s3, s7
                  beq          t6, a0, 5828f
                  rem          a2, s11, t2
                  c.nop
                  c.sub        a0, a5
                  beq          t2, t2, 5829f
                  bne          t2, t4, 5825f
                  c.and        s0, s1
                  lui          s6, 391443
                  c.mv         t0, s4
                  c.srli       s1, 20
                  srai         t1, tp, 9
                  and          t4, s5, a2
                  mulh         t2, a1, a4
5825:             c.lui        a4, 11
                  mulh         a2, ra, s11
                  sra          s4, t0, s5
5828:             andi         t1, t0, -957
5829:             bge          s4, tp, 5832f
                  lui          s8, 499421
                  c.andi       a3, -1
5832:             sll          t2, a7, a4
                  add          sp, s2, a6
                  c.li         t1, -1
                  sub          t4, t3, t4
                  xori         s8, a2, 28
                  c.srli       a3, 14
                  c.bnez       a4, 5851f
                  div          s2, gp, a2
                  c.li         t6, -1
                  c.add        s9, s5
                  blt          s10, s4, 5851f
                  mulhu        s9, s3, a3
                  c.addi       a4, 5
                  rem          t2, s2, s11
                  div          gp, t6, t4
                  c.add        s2, s1
                  and          s2, s8, s1
                  c.addi4spn   a2, sp, 864
                  sltu         s8, t2, a5
5851:             bne          gp, a7, 5868f
                  c.li         a1, -1
                  mulh         s1, t2, s5
                  c.addi16sp   sp, -16
                  addi         t6, t5, -214
                  c.nop
                  div          a2, s1, ra
                  sub          a0, s5, a5
                  c.beqz       a1, 5860f
5860:             c.or         a3, s1
                  c.lui        tp, 5
                  slt          gp, a3, a0
                  slli         tp, s5, 16
                  c.srai       a0, 31
                  mulh         s9, tp, t5
                  c.sub        a0, a2
                  c.sub        s0, a0
5868:             mul          t6, s7, s3
                  addi         s3, a6, -80
                  c.addi16sp   sp, -16
                  auipc        t2, 309709
                  c.add        sp, t6
                  remu         s2, s1, gp
                  addi         s3, s0, -443
                  mulhsu       t2, a4, a0
                  mulhu        t2, s4, s8
                  c.and        a2, a3
                  c.srli       a0, 20
                  sltiu        s1, s3, 145
                  nop
                  la           tp, region_1+1905 #start riscv_load_store_rand_instr_stream_0
                  sb           tp, -1582(tp)
                  lb           a3, -142(tp)
                  or           s11, sp, tp
                  lui          t5, 650728
                  lb           s5, -71(tp)
                  lbu          a4, -270(tp)
                  mulh         s4, t1, a2
                  lbu          s2, -482(tp)
                  sltiu        a2, a6, 723
                  c.xor        s0, s0
                  c.srai       a0, 23
                  sb           t4, -1014(tp)
                  sb           a7, -996(tp)
                  lbu          gp, -716(tp)
                  ori          a4, a5, 13
                  xor          a6, s11, gp
                  lhu          a4, -223(tp)
                  auipc        t3, 89705
                  sb           t5, -636(tp)
                  auipc        s0, 476232
                  c.addi       a6, 23
                  lh           s1, -127(tp)
                  c.andi       s0, -1
                  lh           s11, -1655(tp)
                  sh           a0, -1375(tp)
                  addi         s10, s10, -1839
                  lb           a4, 17(tp)
                  lbu          s10, -1508(tp)
                  srli         t6, t4, 4
                  sb           t2, -770(tp)
                  c.andi       s1, -1
                  lbu          s0, -1030(tp)
                  lb           ra, -698(tp)
                  sb           a2, -1010(tp)
                  sub          s3, s10, a0
                  slt          s3, t5, a7
                  sh           s2, -443(tp) #end riscv_load_store_rand_instr_stream_0
                  srl          s11, s6, a3
                  mulh         t3, s5, a7
                  ori          t0, s2, 1038
                  srai         s9, s3, 6
                  or           ra, a0, s9
                  xori         t6, t6, -1606
                  lui          a1, 713628
                  c.srai       a3, 22
                  auipc        a4, 855061
                  add          s5, s7, tp
                  c.nop
                  sltu         t6, t3, sp
                  c.slli       sp, 7
                  c.or         s0, a2
                  srai         s1, a0, 29
                  add          s2, a0, tp
                  slli         s3, s6, 28
                  c.sub        s1, a1
                  c.or         s0, a1
                  c.li         s3, 30
                  remu         s6, s5, a0
                  sltu         t1, s1, a6
                  c.nop
                  c.beqz       a3, 5918f
                  sll          t0, s8, t3
                  divu         s9, a3, s1
                  div          s5, s0, a1
                  slt          t5, a5, t2
                  bgeu         s11, tp, 5926f
                  mulh         t0, s5, sp
                  auipc        s9, 407786
                  srl          a4, t1, a4
                  c.srai       s0, 10
                  c.slli       s3, 6
                  remu         ra, s6, t0
                  nop
                  auipc        t1, 448412
5918:             c.andi       a4, 21
                  divu         a4, s11, ra
                  c.lui        t3, 22
                  bltu         gp, s1, 5930f
                  sll          s6, s5, t3
                  slli         s2, a5, 19
                  mulhsu       a3, t5, t1
                  c.nop
5926:             divu         s0, a1, s1
                  remu         t0, s2, t5
                  nop
                  mul          t3, t1, s11
5930:             c.addi       s6, -1
                  beq          s5, a0, 5949f
                  slt          zero, sp, zero
                  nop
                  sltiu        t0, s6, -1415
                  auipc        t3, 177991
                  sltu         s8, zero, s8
                  c.addi4spn   a1, sp, 624
                  c.lui        s10, 31
                  c.slli       t5, 10
                  c.addi       t3, 6
                  slti         a0, a1, -347
                  c.sub        a2, s1
                  c.or         a1, s0
                  c.nop
                  srli         zero, s1, 11
                  bge          s4, s0, 5947f
5947:             c.slli       t0, 20
                  c.addi16sp   sp, -16
5949:             nop
                  c.beqz       s0, 5951f
5951:             beq          ra, s1, 5952f
5952:             c.mv         gp, s8
                  sll          sp, ra, t1
                  mulhsu       a1, s8, ra
                  xor          a4, ra, t4
                  c.sub        s0, a1
                  beq          s8, sp, 5971f
                  rem          s2, t4, t4
                  c.addi16sp   sp, 416
                  c.addi4spn   s0, sp, 416
                  xori         t3, a2, 968
                  c.xor        a2, a0
                  rem          t5, a3, s8
                  bgeu         s0, a5, 5976f
                  bge          s2, s2, 5973f
                  c.mv         s8, s7
                  mul          a2, sp, a6
                  slti         a0, a0, 1462
                  srl          a1, s7, t5
                  andi         gp, ra, -1708
5971:             srli         s8, t2, 23
                  mul          gp, s10, t5
5973:             c.xor        a0, s0
                  sll          a0, t5, t2
                  nop
5976:             sltiu        s0, ra, 1551
                  mul          t2, a2, t4
                  sra          t3, t4, s7
                  bltu         s2, s2, 5992f
                  slti         s6, t3, -1058
                  c.addi4spn   a1, sp, 496
                  beq          tp, a3, 5993f
                  sltiu        s0, a4, 908
                  sll          sp, t0, s5
                  or           s1, t3, s9
                  c.srai       a1, 19
                  mulh         t6, a5, a3
                  srl          zero, gp, t4
                  srli         s1, a0, 7
                  bne          zero, t5, 6009f
                  and          ra, s2, a6
5992:             c.andi       a0, 12
5993:             c.and        a0, a1
                  c.or         a1, a1
                  mulhsu       a0, a0, s4
                  c.mv         ra, s2
                  slt          a4, t6, s8
                  slti         t2, gp, -656
                  slt          s5, s2, tp
                  srl          tp, t0, s1
                  auipc        t3, 795138
                  andi         t3, s9, -387
                  ori          t4, s3, 623
                  div          t3, ra, t5
                  remu         tp, s8, t1
                  lui          t4, 109068
                  xori         t5, s7, 717
                  c.or         a3, a3
6009:             c.andi       a2, -1
                  or           t3, s8, s7
                  beq          s4, a3, 6013f
                  sra          s6, s1, a1
6013:             c.xor        a4, a5
                  c.bnez       a4, 6022f
                  c.or         a3, a1
                  xor          t3, t6, s9
                  xori         s8, a4, -148
                  slti         s0, s10, -799
                  nop
                  mulhsu       s10, ra, gp
                  c.addi16sp   sp, -16
6022:             c.addi       s3, 25
                  c.or         a0, s0
                  slt          s0, a1, t4
                  srl          a3, s7, t2
                  mul          a2, a1, zero
                  auipc        s10, 274886
                  mulhu        a0, s5, s9
                  sltiu        s0, ra, 1101
                  xori         t2, a6, 389
                  bgeu         t4, a3, 6038f
                  c.or         a3, a3
                  srl          zero, s11, s9
                  beq          s6, t2, 6051f
                  xor          t6, s11, t0
                  c.beqz       a2, 6041f
                  rem          t0, s0, t0
6038:             c.andi       s1, 13
                  xori         s3, s2, 2013
                  c.nop
6041:             srli         s1, s11, 1
                  c.addi       t4, 23
                  add          a2, a3, s2
                  div          s6, t2, s11
                  c.addi       t5, -1
                  mulh         s4, s6, gp
                  c.mv         s10, s8
                  c.bnez       s1, 6065f
                  ori          s3, a3, -1270
                  c.srli       a2, 8
6051:             c.lui        s11, 3
                  andi         t3, t6, -224
                  and          a1, ra, a3
                  auipc        gp, 302331
                  mulh         t4, t2, a1
                  addi         t0, s2, 1319
                  c.beqz       a2, 6069f
                  sll          t2, a6, gp
                  sltu         t0, s4, tp
                  bge          s2, t6, 6069f
                  auipc        s10, 122486
                  xori         t0, t5, -1900
                  c.mv         a4, a3
                  c.add        s5, a3
6065:             c.xor        a0, a2
                  c.addi4spn   a4, sp, 496
                  and          gp, a2, s0
                  c.addi16sp   sp, 16
6069:             c.sub        a2, a4
                  mulhu        s1, a3, s7
                  sub          a0, s3, s1
                  c.srli       s1, 31
                  c.bnez       s0, 6090f
                  c.xor        a3, a2
                  sltu         s6, tp, s2
                  c.and        a2, a2
                  blt          a5, a3, 6093f
                  sub          s2, ra, a1
                  or           t1, s5, t4
                  c.lui        s2, 13
                  xor          s6, a7, t0
                  nop
                  c.addi4spn   a0, sp, 1008
                  c.addi       s3, -1
                  c.lui        t5, 22
                  c.addi16sp   sp, -16
                  c.andi       a3, 23
                  or           gp, s5, s5
                  c.lui        t4, 10
6090:             c.bnez       a1, 6102f
                  c.nop
                  remu         a4, s6, t2
6093:             divu         s0, a2, ra
                  srai         a0, a6, 11
                  mulhsu       s4, s5, a4
                  addi         s0, zero, -764
                  c.li         t6, -1
                  rem          t5, a5, t1
                  srli         gp, s6, 30
                  c.sub        a2, a5
                  c.andi       a1, -1
6102:             slti         s2, s1, -490
                  c.beqz       a4, 6116f
                  nop
                  c.addi4spn   a3, sp, 688
                  c.beqz       a2, 6115f
                  c.li         sp, -1
                  sll          s11, s5, s1
                  c.mv         s6, t2
                  c.add        a2, s0
                  srli         t4, zero, 10
                  and          s4, a4, t3
                  c.addi       t5, 27
                  div          s11, a5, s0
6115:             mulhu        s11, s5, a2
6116:             or           tp, a6, gp
                  nop
                  or           s8, s10, s7
                  sra          gp, s7, s8
                  c.bnez       a3, 6136f
                  addi         a3, zero, 1921
                  mulhsu       zero, t2, t6
                  andi         s9, s4, -172
                  c.andi       a3, 7
                  c.srli       a0, 21
                  bge          s5, a3, 6130f
                  auipc        s4, 348372
                  blt          s0, s9, 6148f
                  mulhu        s10, s9, a3
6130:             bge          t3, s0, 6147f
                  c.srai       a1, 22
                  c.or         a2, a0
                  add          t6, s10, s10
                  auipc        s11, 54717
                  xor          a0, t5, t3
6136:             c.nop
                  andi         zero, s8, -1959
                  slli         s10, t6, 4
                  mulhu        sp, ra, t1
                  c.nop
                  nop
                  sltu         t6, t2, a2
                  ori          s3, t3, -1664
                  c.lui        a0, 29
                  slli         t5, s8, 12
                  blt          s4, t5, 6160f
6147:             and          s3, zero, t1
6148:             c.xor        a4, a4
                  ori          tp, s10, -1025
                  xor          a1, a6, sp
                  mul          a6, s10, s4
                  bne          a5, a7, 6170f
                  rem          zero, t2, a6
                  rem          s10, t3, s7
                  slt          t4, t5, s10
                  c.xor        a1, a4
                  srai         a4, t5, 16
                  slti         tp, s8, 860
                  ori          tp, t2, -404
6160:             or           a2, sp, s11
                  sltiu        a4, s9, 1307
                  xor          s0, s7, t1
                  remu         s0, s4, t3
                  ori          s6, t3, 1721
                  c.nop
                  andi         zero, s8, 467
                  c.addi4spn   a2, sp, 96
                  sra          t0, t1, t5
                  mulhsu       a0, s6, a0
6170:             c.and        a2, s0
                  sub          s4, s4, a4
                  c.slli       gp, 11
                  mulh         gp, s9, s3
                  sub          s6, t6, a0
                  c.and        s1, a5
                  and          t3, s10, a2
                  remu         s3, s3, s8
                  nop
                  sll          s10, s8, a2
                  c.addi16sp   sp, -16
                  bltu         tp, a4, 6184f
                  xor          s1, t3, a5
                  c.srli       a2, 1
6184:             sub          s3, s5, t4
                  blt          s1, s8, 6196f
                  ori          t2, t4, 689
                  c.bnez       a4, 6196f
                  c.add        t4, gp
                  c.addi16sp   sp, -16
                  sub          s3, s3, t1
                  xori         a6, t3, -1626
                  sub          s3, a7, ra
                  c.xor        s0, a0
                  c.andi       a1, -1
                  c.lui        s10, 11
6196:             srli         a2, s4, 9
                  c.lui        ra, 2
                  remu         a2, s5, t4
                  c.andi       a4, -1
                  c.add        s1, sp
                  div          s1, ra, s6
                  c.addi16sp   sp, -16
                  c.slli       a3, 30
                  lui          a0, 1000434
                  sub          s1, a0, s2
                  addi         a2, s7, 2018
                  slli         a6, t3, 4
                  mulhsu       ra, gp, ra
                  bne          t1, s11, 6221f
                  c.or         a3, a3
                  c.xor        s0, a3
                  and          s6, t4, s9
                  c.addi4spn   a4, sp, 624
                  c.and        a0, a3
                  xor          a2, t2, t4
                  c.li         s3, 30
                  c.bnez       a1, 6220f
                  slli         s2, a3, 27
                  andi         s9, a6, 1664
6220:             c.slli       gp, 18
6221:             c.beqz       a1, 6222f
6222:             mulhu        sp, a3, t0
                  c.add        t0, gp
                  c.andi       a4, 17
                  c.srli       a3, 18
                  bne          s10, zero, 6242f
                  mul          t3, t2, t5
                  c.beqz       a2, 6242f
                  c.andi       s0, 27
                  c.slli       ra, 17
                  xori         a6, s10, -479
                  sub          t5, a1, t6
                  mulhsu       a0, s2, s5
                  c.srli       s0, 31
                  mulh         a3, sp, a2
                  c.nop
                  bne          a0, gp, 6242f
                  c.or         a0, a2
                  nop
                  c.sub        a0, a1
                  remu         a6, t1, t1
6242:             c.and        a1, s1
                  c.li         s10, -1
                  slli         gp, s3, 12
                  addi         a1, t2, -1689
                  c.srli       a2, 28
                  add          s9, s0, a5
                  nop
                  ori          s1, s7, 654
                  c.bnez       a0, 6268f
                  or           t0, a7, t1
                  remu         a6, s1, t1
                  mul          s3, ra, a1
                  bltu         sp, t3, 6273f
                  or           s6, a6, gp
                  c.or         a2, a0
                  xor          a4, t5, t2
                  rem          a3, a0, zero
                  sub          zero, s5, s1
                  sll          sp, s3, ra
                  c.lui        s0, 2
                  c.addi16sp   sp, -16
                  c.and        a2, a2
                  slt          ra, a2, a5
                  lui          t5, 758656
                  c.add        gp, a3
                  and          a2, ra, t4
6268:             nop
                  sll          s8, s2, s9
                  c.and        a0, s1
                  sub          s1, s10, s4
                  auipc        t6, 812596
6273:             srl          t1, s10, gp
                  remu         s8, s9, zero
                  c.lui        s8, 30
                  slt          s6, s10, s6
                  blt          t2, t6, 6293f
                  nop
                  slti         tp, gp, 1689
                  add          s10, s6, a4
                  c.addi16sp   sp, -16
                  sll          sp, a0, s8
                  ori          s3, t6, -1935
                  c.lui        a0, 29
                  c.andi       a4, -1
                  auipc        gp, 647449
                  c.or         a0, s1
                  add          t5, ra, a0
                  bne          sp, s11, 6300f
                  xor          t4, s8, t5
                  add          t1, ra, sp
                  xori         s9, s8, 1903
6293:             mul          t2, s7, s8
                  nop
                  mulh         a0, s5, s7
                  c.slli       s8, 27
                  andi         a3, a6, -1227
                  c.sub        a1, a2
                  c.slli       s1, 7
6300:             or           a0, tp, t6
                  c.nop
                  and          s4, t1, tp
                  c.bnez       a1, 6315f
                  bgeu         t3, s9, 6315f
                  remu         s8, ra, a7
                  c.beqz       a0, 6323f
                  beq          tp, a0, 6324f
                  c.andi       s1, -1
                  sra          s2, s9, t3
                  divu         s1, zero, s7
                  c.beqz       a4, 6325f
                  c.lui        s9, 17
                  c.nop
                  sltu         t3, a0, tp
6315:             lui          s3, 330913
                  add          a4, s11, a3
                  c.beqz       a1, 6319f
                  xori         sp, s11, -1248
6319:             c.srli       a1, 10
                  c.bnez       a0, 6328f
                  bne          s3, s7, 6330f
                  mulhu        s4, sp, s5
6323:             c.addi       t2, 22
6324:             mulh         t3, a4, s9
                  la           s4, sub_2
                  xor          s8, s4, a1
                  addi         s4, s4, -255
                  blt          s3, a1, main_j1 #branch to jump instr
                  lui          s3, 64625
                  slt          zero, tp, t6
                  divu         a2, t1, t5
                  c.andi       a2, -1
main_j1:          jalr         ra, s4, 256 #jump main -> sub_2
6325:             c.addi4spn   s0, sp, 672
                  andi         t0, a3, 1684
                  mulh         s9, a3, gp
6328:             and          a4, t6, a4
                  srai         a4, a6, 31
6330:             lui          s4, 826900
                  sltu         t0, s2, s3
                  srl          a1, s6, a2
                  auipc        a4, 306236
                  bge          gp, a4, 6338f
                  slli         t3, t0, 21
                  rem          ra, a3, t2
                  srai         s1, s0, 22
6338:             divu         s1, s0, s2
                  c.lui        a4, 21
                  c.beqz       a4, 6357f
                  bltu         a3, gp, 6342f
6342:             auipc        s2, 277646
                  auipc        t3, 221256
                  sltu         t4, a5, a2
                  lui          gp, 336374
                  remu         s11, s8, ra
                  c.addi16sp   sp, -16
                  mulhsu       s1, a3, s1
                  beq          s3, a2, 6356f
                  sltu         t3, zero, s4
                  rem          t3, s2, s6
                  c.addi4spn   s0, sp, 112
                  c.sub        a4, a4
                  mulhsu       s9, t6, t3
                  nop
6356:             or           s3, a5, s10
6357:             slti         t1, a4, 901
                  c.sub        a1, a3
                  c.addi16sp   sp, -16
                  srl          t4, a6, a6
                  c.lui        a6, 25
                  c.andi       a4, -1
                  c.li         s9, -1
                  slt          tp, sp, a5
                  sltu         s0, t3, a2
                  c.beqz       a4, 6379f
                  c.andi       a2, -1
                  mulhsu       t6, gp, a4
                  slt          t1, gp, tp
                  andi         t0, sp, 901
                  mul          a2, s3, s0
                  beq          a5, s5, 6373f
6373:             div          ra, a1, sp
                  la           s9, region_0+287 #start load_store_instr_stream_0
                  lb           s4, 616(s9)
                  la           s8, region_0+813 #start load_store_instr_stream_2
                  la           tp, region_0+1416 #start load_store_instr_stream_1
                  lbu          s0, 1(tp)
                  sb           ra, -177(s8)
                  lbu          s0, 422(s9)
                  sb           t2, -26(tp)
                  lbu          s11, 354(s9)
                  lb           a3, 78(s9)
                  sb           t0, -175(s8)
                  sb           s6, 738(s9)
                  sb           t6, 61(tp)
                  sb           a1, 16(s8)
                  lb           t0, 1430(s9)
                  lb           t0, 315(s9)
                  sb           t4, -1(tp)
                  lbu          s6, -167(s8)
                  sb           s2, 1588(s9)
                  sb           t4, 236(s8) #end load_store_instr_stream_2
                  lh           a6, 22(tp)
                  sb           s5, -61(tp) #end load_store_instr_stream_1
                  sb           t3, 488(s9) #end load_store_instr_stream_0
                  and          sp, zero, t3
                  sra          t3, a1, a4
                  c.addi4spn   a2, sp, 560
                  slli         gp, ra, 17
                  c.srai       a1, 21
6379:             mulhu        zero, s8, t5
                  auipc        t5, 218458
                  mulhu        sp, ra, t4
                  slti         tp, t4, 272
                  divu         s0, gp, a2
                  sltu         sp, zero, s1
                  and          s10, zero, a1
                  c.bnez       a2, 6394f
                  lui          s10, 62972
                  andi         s11, t5, 1200
                  srli         t6, s1, 1
                  c.or         a2, a5
                  rem          t2, t1, s2
                  c.sub        a3, a2
                  beq          s11, t2, 6406f
6394:             srl          s3, s3, t0
                  rem          s0, t1, a7
                  bltu         a6, s10, 6412f
                  mul          gp, s11, s0
                  beq          a2, a4, 6412f
                  mul          a6, s2, tp
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 32
                  andi         a2, s8, 1240
                  or           t5, t2, tp
                  c.srai       a4, 1
                  divu         s2, s5, s4
6406:             slli         s4, a5, 3
                  xor          sp, s1, a6
                  slti         t0, t2, 1030
                  mulh         a2, s2, t4
                  rem          s8, s1, a0
                  blt          s6, s1, 6412f
6412:             add          s8, t6, s2
                  la x23, test_done
                  jalr x0, x23, 0
test_done:        
                  li gp, 1
                  ecall
sub_2:            sll          t3, t3, a5
                  c.or         s0, a5
                  bltu         t3, t0, sub_2_stack_p
sub_2_stack_p:    addi         a5, a5, -12
                  slti         a2, tp, -436
                  xor          s5, s0, t0
                  sw           ra, 4(a5)
                  and          s2, s8, s0
                  and          t1, s0, s8
                  ori          s1, t6, 1599
                  c.bnez       s0, 19f
                  srli         a4, sp, 6
                  xor          t3, s10, t6
                  mul          a1, t0, s2
                  and          ra, s0, a2
                  mulhu        t4, s1, s6
                  rem          tp, tp, zero
                  beq          a4, a3, 13f
                  div          a1, t5, s2
                  slti         t2, s0, -1090
                  sll          s8, s0, s4
13:               rem          s8, s1, a5
                  mulh         s6, sp, s0
                  andi         ra, tp, -1929
                  c.mv         s11, sp
                  mul          a3, s3, s8
                  c.addi       t0, 26
19:               srli         s6, t6, 23
                  remu         t1, t4, ra
                  blt          a5, gp, 38f
                  bltu         ra, t4, 25f
                  bge          t3, a5, 43f
                  nop
25:               mulh         a2, a1, t3
                  andi         t6, s5, -1365
                  c.and        a3, a2
                  c.addi       s2, 6
                  mulhu        tp, s10, t2
                  c.addi4spn   a3, sp, 704
                  andi         t6, s2, 1758
                  auipc        a1, 248866
                  addi         s11, a7, 602
                  c.addi       a3, 1
                  beq          t1, t0, 50f
                  remu         s0, s11, s8
                  auipc        zero, 146645
38:               c.andi       a2, 14
                  c.srli       a4, 20
                  blt          a7, s11, 41f
41:               sltu         s11, s2, s7
                  srai         t0, a0, 14
43:               mul          a2, a3, t0
                  sra          t5, a4, sp
                  slli         sp, gp, 10
                  mulhsu       ra, a2, gp
                  c.sub        a3, a4
                  and          s5, s10, s5
                  auipc        s10, 654161
50:               bge          sp, s3, 58f
                  add          a2, s2, gp
                  remu         s6, t0, a4
                  mulhu        s4, tp, zero
                  divu         a0, s5, a2
                  bne          t0, s7, 56f
56:               remu         s8, s2, gp
                  c.add        a1, s5
58:               c.addi4spn   a3, sp, 816
                  c.or         s0, a1
                  sltu         s2, s6, s11
                  xori         a4, gp, -707
                  c.li         gp, -1
                  mulhsu       s1, s3, t4
                  slti         t0, a4, 296
                  andi         a0, s8, 1095
                  mul          a3, s0, zero
                  sra          sp, gp, a0
                  xor          tp, zero, t0
                  c.mv         t3, s3
                  bne          a7, s4, 78f
                  sltu         a1, t6, t5
                  blt          s6, a2, 87f
                  andi         s1, t0, -410
                  divu         s4, t3, zero
                  bne          t1, a6, 78f
                  and          tp, s7, a4
                  c.addi       ra, -1
78:               c.srli       s1, 31
                  c.mv         tp, t1
                  slti         ra, t0, 1938
                  mulh         s11, zero, t3
                  mulh         zero, a0, a3
                  slli         a1, s3, 5
                  c.bnez       a2, 91f
                  nop
                  mulhsu       a4, ra, gp
87:               ori          a6, s3, -1705
                  slli         a0, s6, 15
                  xori         t1, tp, 688
                  slli         a4, zero, 24
91:               c.slli       a1, 2
                  c.addi4spn   a1, sp, 496
                  c.bnez       s0, 106f
                  slt          gp, sp, a2
                  andi         t6, s2, 1740
                  c.andi       s0, 8
                  c.slli       s1, 30
                  c.bnez       a4, 99f
99:               c.add        tp, s8
                  c.beqz       a4, 111f
                  c.slli       a1, 11
                  c.andi       a4, 14
                  slti         a6, s8, 310
                  sltiu        s6, a7, -1091
                  rem          t6, zero, s3
106:              remu         t0, t2, s11
                  srl          a2, a1, s4
                  c.and        a0, a2
                  c.sub        a2, a5
                  or           s1, a6, t4
111:              slli         t1, s10, 8
                  c.mv         a3, ra
                  c.sub        a0, a2
                  srl          a0, sp, a6
                  c.xor        a0, a5
                  remu         t1, s7, a4
                  bge          t3, s8, 123f
                  beq          zero, s2, 133f
                  slli         s11, a1, 31
                  or           s1, a7, tp
                  sll          s11, s9, tp
                  beq          s4, t1, 131f
123:              bltu         s3, zero, 143f
                  c.or         s1, a2
                  blt          t5, t3, 134f
                  or           tp, a7, t3
                  c.mv         s9, a7
                  sub          sp, s9, a5
                  and          s4, t4, a5
                  sub          gp, s8, a3
131:              div          t2, s4, t5
                  nop
133:              auipc        t3, 56830
134:              c.nop
                  c.xor        a4, a5
                  c.xor        a4, a0
                  addi         t4, s9, -885
                  sub          s9, a2, t0
                  c.addi4spn   a1, sp, 304
                  rem          t1, s10, s2
                  sltu         s4, a3, sp
                  c.addi4spn   s0, sp, 192
143:              blt          t6, s4, 163f
                  c.beqz       a0, 158f
                  bne          t1, ra, 163f
                  slli         t3, s11, 14
                  xori         a4, s11, -1507
                  bne          t2, s4, 164f
                  sub          s8, sp, a5
                  srli         s11, a4, 20
                  addi         t6, gp, -1157
                  rem          s1, s4, a2
                  bltu         t6, t2, 154f
154:              xori         sp, t0, 832
                  or           t6, a5, a7
                  c.nop
                  srli         s8, t6, 2
158:              c.andi       s1, 23
                  andi         s2, s8, -1347
                  c.lui        a2, 9
                  nop
                  bltu         s2, a1, 170f
163:              c.or         a3, a5
164:              c.sub        s0, a3
                  blt          s11, sp, 168f
                  bge          s9, ra, 170f
                  sltiu        s4, a4, 890
168:              xor          tp, a6, a7
                  c.addi       s4, 12
170:              rem          s1, s1, ra
                  sltiu        sp, a1, 725
                  xori         t0, a0, 713
                  srli         s11, s10, 15
                  andi         a2, s1, -944
                  sll          s5, zero, gp
                  lw           ra, 4(a5)
                  addi         a5, a5, 12
                  auipc        a3, 390825
                  mulh         t0, gp, s6
                  sll          s6, s1, t0
                  and          tp, t0, s7
                  c.lui        s2, 4
191:              addi x7, x1, 1
191:              jalr x7, x7, 0
sub_5:            c.and        a3, a5
                  blt          a6, s5, sub_5_stack_p
                  xor          t6, a6, tp
                  c.nop
sub_5_stack_p:    addi         a5, a5, -8
                  sw           ra, 4(a5)
                  slti         a2, s4, 1259
                  andi         s9, a7, -2042
                  srli         s3, a2, 0
                  c.or         a1, a0
                  c.xor        a4, a4
                  slti         s11, gp, -36
                  slti         gp, s2, -1310
                  bge          t6, s5, 14f
                  nop
                  c.add        s4, s11
                  and          t4, zero, a2
                  mulhsu       s2, t0, s7
                  c.and        a3, s0
                  c.add        s2, a7
                  c.addi16sp   sp, -16
14:               sll          a2, a0, t2
                  bgeu         gp, t5, 18f
                  slli         tp, t6, 31
                  divu         s0, s2, t3
18:               c.xor        a4, a5
                  srai         a1, a1, 13
                  and          s6, s2, s1
                  addi         s2, s3, 705
                  bne          s10, s8, 42f
                  sll          s3, t3, sp
                  c.slli       s3, 1
                  mul          gp, s5, a2
                  mulh         sp, gp, a3
                  c.beqz       a0, 46f
                  c.addi4spn   a0, sp, 208
                  c.li         ra, -1
                  sll          sp, zero, t5
                  sltu         s9, a0, sp
                  srli         zero, t1, 9
                  add          t4, s4, sp
                  c.add        s5, s1
                  nop
                  addi         s3, s2, -219
                  nop
                  mulhsu       sp, a7, s8
                  add          gp, t1, a7
                  rem          a0, t2, s5
                  c.andi       a0, 16
42:               bltu         a6, a2, 53f
                  add          s0, a5, gp
                  sub          s11, a6, zero
                  blt          a4, tp, 53f
46:               slt          s1, t0, s5
                  divu         sp, s2, sp
                  ori          s9, sp, 1426
                  c.addi       a1, -1
                  bne          s10, t2, 51f
51:               mulhsu       ra, t6, a5
                  nop
53:               slti         a1, a4, 104
                  auipc        s1, 826380
                  xor          a0, a6, a3
                  xori         t1, sp, -1099
                  lw           ra, 4(a5)
                  lui          t5, 585574
                  mulhu        a4, s5, s11
                  c.sub        a1, a5
                  addi         a5, a5, 8
                  mul          t2, a0, a7
                  c.addi16sp   sp, 432
                  div          s1, t0, zero
                  xori         s9, sp, 297
73:               addi x18, x1, 0
73:               jalr x18, x18, 0
sub_1:            c.nop
                  addi         a5, a5, -16
                  addi         s6, t0, 1421
                  ori          s8, gp, -1403
                  sw           ra, 4(a5)
                  c.srai       a1, 23
                  c.addi       s10, -1
                  slt          s11, sp, s4
                  la           sp, region_1+59 #start riscv_hazard_instr_stream_3
                  sb           t2, 1754(sp)
                  srai         a3, s0, 17
                  lbu          a2, 1400(sp)
                  mulh         t0, a3, s1
                  ori          t2, a3, -569
                  lb           s1, 1830(sp)
                  lb           a2, 1061(sp)
                  sltu         t0, t0, t0
                  lb           s1, 494(sp)
                  lui          t2, 511284
                  xor          t0, s1, s0
                  or           a2, a3, a2
                  and          t0, s0, s0
                  c.andi       s0, 17
                  c.li         a2, -1
                  c.nop
                  lbu          a2, 659(sp)
                  c.srai       a3, 22
                  lh           a2, 1435(sp)
                  xor          s1, t0, a3
                  sb           a3, 882(sp)
                  lbu          a3, 1084(sp)
                  c.nop
                  sub          t2, s0, a3
                  nop
                  lb           s0, 1886(sp)
                  lbu          s1, 979(sp)
                  sb           s0, 91(sp)
                  lb           a3, 1305(sp)
                  andi         a2, t0, -669
                  add          s1, t0, a2
                  lui          t2, 566453
                  andi         t0, s0, -513
                  lb           t0, 246(sp)
                  divu         t2, t2, a3
                  lh           t2, 1287(sp)
                  sw           t2, 1909(sp)
                  sb           s1, 1528(sp)
                  lb           a2, 384(sp)
                  sb           t2, 1413(sp)
                  sb           a2, 724(sp)
                  srai         a3, s1, 24
                  mulhu        s1, a2, s0
                  lbu          a3, 103(sp)
                  srl          a3, t0, s0
                  lbu          t2, 882(sp)
                  lb           a2, 608(sp) #end riscv_hazard_instr_stream_3
                  la           s10, region_0+169 #start riscv_load_store_rand_instr_stream_3
                  lbu          s8, -20(s10)
                  div          s9, t2, a5
                  divu         tp, t4, s7
                  lb           a0, 33(s10)
                  lbu          gp, -4(s10)
                  lhu          t5, -55(s10)
                  lh           gp, 11(s10)
                  lbu          t0, -27(s10)
                  mulhsu       tp, a4, t5
                  lb           zero, -30(s10)
                  sh           s10, 9(s10)
                  lb           a2, 62(s10)
                  c.mv         t1, s11
                  sb           t0, 26(s10)
                  lbu          tp, -3(s10)
                  lhu          t2, 9(s10)
                  xor          s0, a3, t4
                  lb           sp, 20(s10)
                  c.xor        a4, a4
                  lh           a4, 47(s10)
                  auipc        a1, 1010918
                  sb           t3, -46(s10)
                  lb           s1, 33(s10)
                  mul          gp, a7, t6
                  c.sub        a2, a0
                  srli         s4, a1, 16
                  lbu          s2, 31(s10)
                  slli         t2, a4, 8
                  c.sub        s0, a1
                  sb           t0, -49(s10)
                  nop
                  remu         tp, a1, gp
                  sb           s5, 50(s10)
                  divu         s8, tp, ra
                  sh           t2, -39(s10)
                  ori          zero, a0, -913
                  lbu          t2, 16(s10)
                  sb           s8, -16(s10)
                  c.xor        a2, s0
                  div          t6, t3, t0
                  lhu          s8, 53(s10)
                  andi         a2, a4, 2045
                  lh           s11, 53(s10)
                  lb           s11, 17(s10)
                  sltu         t0, t2, t0
                  c.li         t0, -1
                  lbu          t2, -64(s10)
                  sb           t2, 15(s10)
                  sb           a5, 48(s10) #end riscv_load_store_rand_instr_stream_3
                  la           gp, amo_0+56 #start riscv_lr_sc_instr_stream_0
                  mulhu        a6, a4, s6
                  lr.w.rl       t5, (gp)
                  xori         sp, s10, -2010
                  c.addi       a1, -1
                  auipc        t3, 343775
                  add          a0, s8, a3
                  slli         t1, a6, 31
                  mulh         s3, s0, s0
                  slt          a4, a0, s6
                  c.and        s0, a4
                  xor          t5, s2, a2
                  divu         s6, a4, s6
                  div          t3, t3, a2
                  c.andi       a1, -1
                  xor          t6, a4, s8
                  sc.w.aq       s8, ra, (gp) #end riscv_lr_sc_instr_stream_0
sub_1_13:         jal          ra, 8f
0:                c.j          13f
1:                c.jal        20f
2:                jal          t1, 14f
3:                jal          a2, 7f
4:                c.j          2b
5:                c.j          12f
6:                c.j          17f
7:                jal          t1, 11f
8:                c.jal        3b
9:                c.j          0b
10:               c.j          6b
11:               c.jal        16f
12:               c.jal        1b
13:               c.j          4b
14:               jal          ra, 18f
15:               c.jal        19f
16:               jal          t1, 15b
17:               c.j          5b
18:               c.j          10b
19:               c.jal        9b
20:               srli         a2, t2, 29
sub_1_14:         jal          ra, 11f
0:                c.j          4f
1:                c.j          17f
2:                jal          t4, 8f
3:                jal          gp, 13f
4:                c.j          6f
5:                jal          ra, 2b
6:                c.j          1b
7:                jal          ra, 12f
8:                c.j          14f
9:                c.j          15f
10:               c.j          0b
11:               c.jal        7b
12:               jal          ra, 3b
13:               jal          ra, 9b
14:               jal          s1, 16f
15:               jal          ra, 5b
16:               jal          ra, 10b
17:               ori          t6, a0, 1751
                  la           sp, region_0+1615 #start riscv_load_store_hazard_instr_stream_5
                  lb           s2, -186(sp)
                  c.xor        a0, a1
                  sb           s1, -186(sp)
                  lb           gp, -186(sp)
                  lb           t3, -186(sp)
                  sb           t0, 207(sp)
                  lh           a3, 207(sp)
                  sb           gp, 207(sp)
                  lbu          s8, 207(sp)
                  lbu          zero, 207(sp)
                  sb           s11, 207(sp)
                  lbu          t4, 207(sp)
                  and          gp, a2, a6
                  lb           s4, -224(sp)
                  c.xor        s0, a4
                  sb           a1, -224(sp)
                  sb           a2, 158(sp)
                  sb           ra, 65(sp)
                  lbu          s10, -43(sp)
                  sra          zero, t4, ra
                  sw           t0, -43(sp) #end riscv_load_store_hazard_instr_stream_5
                  la           s2, region_0+648 #start riscv_hazard_instr_stream_1
                  mulhu        gp, gp, t5
                  lui          s1, 740895
                  xori         a4, s1, -271
                  lh           t5, 52(s2)
                  lb           a4, 139(s2)
                  lbu          s4, -152(s2)
                  c.sub        s1, a4
                  slti         t5, s4, 416
                  sh           gp, -120(s2)
                  lbu          a4, -35(s2)
                  lh           s4, -122(s2)
                  lb           gp, -157(s2)
                  lui          a4, 884843
                  or           s4, s6, s6
                  lb           s4, -180(s2)
                  or           a4, s1, s4
                  c.srli       a4, 13
                  c.or         s1, s1
                  c.or         a4, s1
                  c.add        gp, s6
                  sb           t5, 249(s2)
                  sll          gp, t5, s4
                  divu         s6, gp, s1
                  sltu         s6, a4, gp
                  lb           t5, -7(s2)
                  andi         s1, a4, -36
                  srl          t5, a4, s4
                  c.or         s1, a4
                  sb           a4, -25(s2)
                  lh           a4, 200(s2)
                  mul          s4, t5, s1
                  rem          s4, s1, s6
                  mulhsu       t5, s6, t5
                  sra          a4, t5, t5
                  mulhsu       a4, s4, a4
                  xor          t5, s6, a4
                  sb           a4, 2(s2)
                  lui          gp, 886657
                  lb           s4, -11(s2)
                  lhu          s4, 4(s2)
                  sltu         s1, s4, t5
                  lbu          a4, 136(s2)
                  remu         s6, s1, s6
                  ori          s4, s1, -153
                  sb           gp, 152(s2)
                  sltiu        s1, gp, 1174
                  c.nop
                  lb           s1, -236(s2)
                  lbu          a4, 163(s2) #end riscv_hazard_instr_stream_1
                  la           s0, amo_0+56 #start riscv_amo_instr_stream_0
                  amoor.w.rl    s5, s10, (s0)
                  amoxor.w.aq   s11, a5, (s0)
                  amoand.w.aq   a6, t6, (s0)
                  amomin.w.rl   a0, s3, (s0)
                  amomaxu.w.aq  s10, t1, (s0)
                  amoxor.w.aq   sp, gp, (s0)
                  amomax.w.rl   a2, tp, (s0)
                  amomaxu.w.rl  zero, zero, (s0)
                  c.mv         s2, s8
                  amoor.w.rl    s2, gp, (s0)
                  amomax.w.aq   a6, a1, (s0) #end riscv_amo_instr_stream_0
                  la           t2, amo_0+44 #start riscv_amo_instr_stream_3
                  la           s1, amo_0+12
                  la           s3, amo_0+28
                  amoswap.w.rl  a0, ra, (s1)
                  amoor.w.aq    a1, s2, (s1)
                  amomin.w.rl   ra, s2, (s1)
                  amoand.w.aq   s8, t3, (s3)
                  c.and        a0, a5
                  amoor.w       a1, t6, (t2) #end riscv_amo_instr_stream_3
                  la           sp, region_0+609 #start riscv_hazard_instr_stream_2
                  c.lui        gp, 1
                  lb           t5, -2(sp)
                  lbu          s4, -9(sp)
                  lb           t6, 8(sp)
                  addi         t6, t6, 315
                  c.li         t6, -1
                  divu         t6, gp, t6
                  mulhsu       s4, t5, a4
                  c.and        a4, a4
                  sltu         a4, gp, s4
                  lw           t5, -5(sp)
                  sb           s5, 12(sp)
                  sb           s4, 11(sp)
                  mulh         t5, s4, t5
                  sh           a4, -13(sp)
                  lbu          t6, 10(sp)
                  lb           s4, -16(sp)
                  lui          a4, 214796
                  lb           s4, -12(sp)
                  sb           s4, 16(sp)
                  lbu          t6, 10(sp)
                  c.sub        a4, a4
                  lb           s5, -16(sp)
                  sh           s4, 5(sp)
                  sh           t6, 11(sp)
                  divu         gp, t6, t5
                  slli         t6, s4, 0
                  sb           gp, 4(sp)
                  lhu          t6, -13(sp)
                  and          t5, s5, t6
                  lb           s4, -12(sp)
                  lw           s5, 15(sp)
                  lb           a4, -11(sp)
                  divu         t6, a4, s4
                  lb           a4, 0(sp)
                  and          a4, gp, s5
                  lbu          a4, -11(sp)
                  sb           s4, 14(sp)
                  mulh         s5, t5, t5
                  sb           gp, 5(sp)
                  slti         a4, s4, -2030
                  c.slli       t5, 25
                  lh           s4, -7(sp)
                  sw           gp, -1(sp)
                  sw           gp, 3(sp) #end riscv_hazard_instr_stream_2
                  la           a3, region_1+1530 #start riscv_load_store_rand_instr_stream_5
                  c.slli       a0, 2
                  lb           a2, 26(a3)
                  srai         s9, t2, 10
                  lhu          s8, 214(a3)
                  mulhu        t2, s5, s2
                  sh           t3, -206(a3)
                  lbu          t5, -71(a3)
                  lb           t0, -72(a3)
                  lbu          s8, -31(a3)
                  sltiu        t0, a1, -958
                  lb           t0, 19(a3)
                  lui          sp, 961598
                  lhu          s0, -206(a3)
                  lb           t0, -168(a3)
                  slli         ra, zero, 23
                  sb           a3, 65(a3)
                  c.srai       s0, 1
                  lb           s0, -55(a3)
                  lbu          t2, -195(a3)
                  div          t5, a6, t2
                  c.and        a2, s0
                  xor          zero, s4, s6
                  mulh         a6, s4, s6
                  sb           t6, -37(a3)
                  lb           t4, 200(a3)
                  sltiu        sp, a7, -94
                  sh           sp, -246(a3)
                  lbu          t3, -166(a3)
                  sb           s9, -240(a3)
                  sb           t5, -59(a3)
                  lbu          sp, -162(a3)
                  lb           a0, 173(a3) #end riscv_load_store_rand_instr_stream_5
                  la           t0, region_1+1471 #start riscv_load_store_rand_instr_stream_2
                  mulh         t2, sp, tp
                  slt          t2, a3, s4
                  lhu          t1, -37(t0)
                  lh           t4, -41(t0)
                  lhu          t4, -25(t0)
                  sll          zero, s3, gp
                  lbu          t6, -42(t0)
                  mul          t2, tp, s9
                  lbu          gp, -20(t0)
                  c.srli       a0, 18
                  srli         t3, t1, 24
                  lbu          a1, -34(t0)
                  lbu          t4, -32(t0)
                  lb           a4, 23(t0)
                  ori          t2, zero, 1275
                  c.slli       a1, 17
                  lhu          t5, 47(t0)
                  c.slli       s8, 10
                  sltiu        t6, t4, -1838
                  c.mv         ra, tp
                  c.andi       a3, -1
                  lb           tp, -37(t0)
                  lb           s2, -32(t0)
                  add          s9, s9, a3
                  c.addi4spn   a4, sp, 208
                  lbu          tp, -52(t0)
                  ori          t5, s3, -1
                  lbu          gp, 10(t0)
                  addi         sp, s0, -1412
                  sh           t4, 57(t0)
                  lbu          a0, -52(t0)
                  lb           t6, 44(t0)
                  c.srli       a3, 16
                  mulh         t3, s1, s5
                  sltiu        s6, a6, -1909
                  nop
                  sll          a3, s0, s5
                  srl          a2, gp, t0
                  sra          s10, a7, s3
                  lbu          s5, -32(t0) #end riscv_load_store_rand_instr_stream_2
sub_1_12:         jal          ra, 8f
0:                jal          sp, 10f
1:                c.j          15f
2:                c.j          12f
3:                jal          s5, 0b
4:                c.jal        7f
5:                c.j          21f
6:                c.j          14f
7:                c.jal        23f
8:                c.j          19f
9:                c.j          1b
10:               c.jal        25f
11:               jal          ra, 20f
12:               c.jal        13f
13:               c.jal        16f
14:               c.j          18f
15:               c.jal        11b
16:               c.jal        4b
17:               jal          sp, 9b
18:               c.j          17b
19:               c.j          22f
20:               c.jal        24f
21:               jal          t1, 3b
22:               c.jal        6b
23:               jal          t1, 5b
24:               jal          s8, 2b
25:               c.srli       a1, 7
                  la           t4, region_0+94 #start load_store_instr_stream_1
                  la           a2, region_0+557 #start load_store_instr_stream_3
                  la           tp, region_0+1107 #start load_store_instr_stream_2
                  sb           t6, -104(tp)
                  la           s5, region_0+1759 #start load_store_instr_stream_4
                  lbu          s10, 122(a2)
                  la           s9, region_0+1376 #start load_store_instr_stream_0
                  sw           s10, 1179(a2)
                  lbu          s2, -103(tp)
                  sb           a7, 1224(a2)
                  lh           a3, 23(s5)
                  lhu          s3, -34(t4)
                  lb           s3, 249(t4)
                  lb           s11, 13(t4)
                  sb           t3, -10(s5)
                  lb           s0, 716(a2)
                  lb           s0, 10(s9)
                  sb           s1, -94(t4)
                  sb           a5, 7(s9)
                  lh           ra, 0(s9)
                  lhu          s6, 167(tp)
                  lb           t5, 93(a2)
                  lh           sp, 126(t4)
                  lb           s8, -56(s5)
                  lb           a0, -30(s5)
                  lb           ra, 1294(a2)
                  sb           s1, 869(a2)
                  lb           a1, -125(tp)
                  lh           s4, 59(s5)
                  lbu          a0, 215(t4)
                  lw           t3, 45(s5)
                  lhu          s4, -153(tp) #end load_store_instr_stream_2
                  sb           a4, -6(s9)
                  lb           a4, -63(s5) #end load_store_instr_stream_4
                  sb           a4, 14(s9)
                  lb           s1, 993(a2) #end load_store_instr_stream_3
                  lb           s3, 135(t4) #end load_store_instr_stream_1
                  sw           sp, -16(s9) #end load_store_instr_stream_0
                  la           sp, region_1+1719 #start riscv_load_store_hazard_instr_stream_0
                  lbu          s11, 34(sp)
                  lb           s1, 34(sp)
                  lbu          s3, 208(sp)
                  lhu          zero, -235(sp)
                  c.mv         a3, a7
                  sb           a5, -235(sp)
                  lh           a0, -235(sp)
                  sw           t6, -47(sp)
                  sb           ra, 68(sp)
                  sb           t0, 68(sp)
                  lbu          a3, 68(sp)
                  lb           t0, 68(sp)
                  lbu          t3, 68(sp)
                  lb           s6, 68(sp)
                  lbu          s3, 68(sp)
                  lbu          zero, 68(sp)
                  addi         a6, a3, -1031
                  lbu          gp, 68(sp)
                  lb           a3, 68(sp)
                  lb           s1, -24(sp)
                  lb           tp, -24(sp) #end riscv_load_store_hazard_instr_stream_0
                  la           s9, region_0+32 #start load_store_instr_stream_1
                  la           s6, region_1+1947 #start load_store_instr_stream_0
                  sb           a0, -1266(s6)
                  sb           s9, -22(s9)
                  sb           t1, -9(s9)
                  sb           t4, -1646(s6)
                  lb           a0, -15(s9)
                  lh           s3, -489(s6)
                  lhu          t6, 40(s9)
                  sb           s7, -60(s6)
                  lb           t2, -1(s9)
                  sw           t6, 32(s9) #end load_store_instr_stream_1
                  lbu          s5, -62(s6)
                  sw           t0, -1051(s6) #end load_store_instr_stream_0
                  la           s8, region_1+789 #start load_store_instr_stream_0
                  la           s2, region_1+1510 #start load_store_instr_stream_2
                  la           t5, region_1+1678 #start load_store_instr_stream_3
                  la           s3, region_1+1494 #start load_store_instr_stream_1
                  sh           a5, -4(s2)
                  lbu          gp, -16(s8)
                  lhu          zero, -2(s2)
                  lb           a6, -161(s3)
                  lb           t4, -13(t5)
                  sh           s8, 12(s2)
                  lb           s1, 313(s8)
                  sb           a4, -3(s2)
                  sb           a1, -13(s3)
                  lbu          a0, -256(s3)
                  lbu          s4, 918(s8)
                  lh           s0, -16(s2)
                  lbu          t0, -23(t5)
                  lbu          a2, -167(s3)
                  lbu          s4, 63(t5)
                  sb           s7, 113(s8)
                  lb           sp, 4(t5)
                  lb           t4, 1140(s8)
                  sh           s10, 0(s2)
                  lbu          ra, 53(t5)
                  sb           s3, 152(s8)
                  lb           t6, 7(s2)
                  lhu          t0, -10(s2)
                  sh           t3, 655(s8)
                  sb           s0, 55(t5)
                  sh           t2, -14(s2)
                  lb           a1, 364(s8)
                  lb           t0, 207(s3)
                  lb           ra, 48(t5) #end load_store_instr_stream_3
                  sh           t2, 2(s2) #end load_store_instr_stream_2
                  lb           s9, -94(s3) #end load_store_instr_stream_1
                  lb           s9, 1017(s8)
                  lbu          s4, 866(s8) #end load_store_instr_stream_0
                  la           s6, region_0+910 #start riscv_load_store_rand_instr_stream_0
                  lbu          s2, -13(s6)
                  lb           s4, 88(s6)
                  lhu          s1, -98(s6)
                  lbu          s2, 255(s6)
                  lh           a2, 70(s6)
                  sltiu        a6, s1, 792
                  sb           s9, 3(s6)
                  sb           t2, -55(s6)
                  lb           a3, 147(s6)
                  c.or         a2, s0
                  lbu          tp, -33(s6)
                  sb           a4, -99(s6)
                  mulh         t5, tp, t1
                  lb           s8, 189(s6)
                  lbu          zero, -236(s6)
                  lbu          t6, 215(s6)
                  sw           s3, 62(s6)
                  lh           s1, -206(s6)
                  srai         a3, gp, 17
                  srai         s5, a5, 2
                  lbu          s1, -13(s6)
                  c.andi       a1, 23
                  c.srai       a3, 15
                  lhu          gp, -12(s6)
                  lb           t4, 53(s6)
                  lb           t1, -105(s6)
                  addi         t1, sp, 1043
                  lb           a3, 217(s6)
                  lh           s10, -48(s6)
                  sltu         tp, t3, t0
                  lbu          ra, -191(s6)
                  sb           a7, 32(s6)
                  sh           t6, 216(s6)
                  lbu          s1, 69(s6)
                  add          a2, s7, sp
                  lw           a2, 118(s6)
                  lb           t5, 231(s6)
                  c.andi       a3, 30
                  sb           s10, -129(s6)
                  sh           a3, -64(s6) #end riscv_load_store_rand_instr_stream_0
                  la           t6, region_0+1928 #start riscv_load_store_rand_instr_stream_1
                  lbu          s2, -1385(t6)
                  lh           a4, -1894(t6)
                  mulh         a3, t4, a0
                  c.li         sp, -1
                  rem          a1, s2, a3
                  sb           t6, -1493(t6)
                  lb           a4, 22(t6)
                  c.srli       a1, 22
                  lb           s2, -1321(t6)
                  c.addi16sp   sp, -16
                  lhu          s10, -862(t6)
                  lbu          t1, -559(t6)
                  sb           a5, -1725(t6)
                  or           t2, tp, t5
                  lb           sp, -1375(t6)
                  c.addi4spn   a3, sp, 384
                  lb           s11, -925(t6)
                  sb           a3, -1617(t6)
                  mul          s6, t5, s6
                  lb           a4, -1137(t6)
                  sb           a5, -1752(t6)
                  lh           a1, -1376(t6)
                  lh           gp, -1910(t6)
                  lui          s5, 298215
                  lhu          s6, -1122(t6)
                  lhu          zero, -1456(t6)
                  lh           t5, -1692(t6)
                  sb           a1, -274(t6)
                  lbu          s0, -1616(t6)
                  lhu          s2, -542(t6)
                  lhu          s6, -944(t6)
                  lbu          t0, -396(t6)
                  lb           zero, 56(t6)
                  sh           t1, -376(t6)
                  slti         s3, t6, 646
                  lb           s2, -253(t6) #end riscv_load_store_rand_instr_stream_1
sub_1_11:         jal          ra, 12f
0:                c.j          10f
1:                c.jal        11f
2:                c.jal        1b
3:                jal          ra, 0b
4:                c.j          13f
5:                c.j          9f
6:                c.j          2b
7:                c.j          3b
8:                jal          ra, 6b
9:                jal          t1, 14f
10:               jal          ra, 8b
11:               c.jal        5b
12:               c.j          4b
13:               c.jal        7b
14:               c.xor        a4, a1
                  addi         s11, zero, -3 #init loop 0 counter
                  lui          s9, 635272
                  remu         s2, zero, t6
                  add          t4, a1, t2
                  mulh         t0, s8, t2
                  addi         tp, zero, -1 #init loop 0 limit
                  ori          a2, a7, 1093
sub_1_30_0_t:     ori          a3, s6, -1290
                  rem          a4, t5, a6
                  sra          s1, s11, a6
                  addi         s11, s11, 2 #update loop 0 counter
                  mul          t0, a0, t4
                  c.nop
                  c.sub        s0, a3
                  bne          s11, tp, sub_1_30_0_t #branch for loop 0
                  or           s0, t3, s6
                  la           t0, region_1+1580 #start load_store_instr_stream_0
                  la           a4, region_1+483 #start load_store_instr_stream_1
                  lhu          s1, 40(t0)
                  lbu          zero, -127(a4)
                  sb           s3, -38(t0)
                  sb           t2, -128(a4)
                  lh           a6, -18(t0)
                  sb           s0, -31(t0)
                  sb           s11, 35(t0)
                  lbu          a3, -27(a4)
                  sb           a0, 164(a4)
                  lbu          ra, -35(t0)
                  lb           s2, -240(a4)
                  sb           a6, 87(a4)
                  lb           a6, -19(t0)
                  lbu          s2, -99(a4)
                  sh           a4, 187(a4)
                  lhu          s11, 30(t0)
                  lb           s5, 14(a4)
                  lh           s3, -53(a4) #end load_store_instr_stream_1
                  sb           s5, -13(t0) #end load_store_instr_stream_0
                  la           s4, region_1+689 #start load_store_instr_stream_1
                  la           a0, region_0+447 #start load_store_instr_stream_0
                  lb           s5, 2(s4)
                  sb           s10, -4(s4)
                  lh           t0, 55(a0)
                  lbu          a2, -10(s4)
                  lbu          ra, 16(a0)
                  sb           s9, -26(a0)
                  lb           a3, -8(s4)
                  sw           s6, 29(a0)
                  lbu          s1, -7(s4)
                  lb           t3, -28(a0)
                  lb           ra, -14(s4)
                  lbu          t4, -8(a0)
                  sh           a3, -9(s4) #end load_store_instr_stream_1
                  lhu          tp, 35(a0) #end load_store_instr_stream_0
                  la           a1, region_1+1673 #start load_store_instr_stream_0
                  la           t4, region_0+747 #start load_store_instr_stream_1
                  lhu          a2, 97(a1)
                  lhu          s10, 211(a1)
                  lbu          gp, -10(t4)
                  lhu          a3, 193(a1)
                  lbu          a0, -28(a1)
                  sb           t5, 2(t4)
                  lh           s6, 21(a1)
                  sb           t5, 9(t4)
                  lb           a0, 1(t4)
                  lb           s11, 0(t4)
                  lbu          s11, -13(t4)
                  lbu          a3, -228(a1)
                  lbu          a6, 12(t4)
                  sb           t5, -12(t4)
                  lbu          s11, 74(a1)
                  lbu          s1, 11(t4)
                  lh           t2, -5(t4) #end load_store_instr_stream_1
                  sb           s5, -127(a1) #end load_store_instr_stream_0
                  la           ra, amo_0+40 #start riscv_lr_sc_instr_stream_3
                  srai         t0, a0, 18
                  c.srai       a1, 23
                  c.or         a4, a4
                  c.or         s1, a4
                  c.addi       t4, -1
                  lr.w.aq       s4, (ra)
                  divu         t2, t1, s7
                  srai         a2, t1, 9
                  sc.w          tp, a3, (ra) #end riscv_lr_sc_instr_stream_3
sub_1_15:         jal          ra, 10f
0:                c.jal        1f
1:                c.jal        5f
2:                c.j          3f
3:                c.j          8f
4:                c.jal        6f
5:                jal          t1, 11f
6:                c.j          2b
7:                c.jal        13f
8:                jal          a2, 9f
9:                c.j          7b
10:               jal          ra, 0b
11:               c.j          14f
12:               c.jal        15f
13:               c.j          12b
14:               jal          ra, 4b
15:               sll          s6, s3, a7
                  la           s10, amo_0+32 #start riscv_amo_instr_stream_1
                  la           s5, amo_0+28
                  la           t0, amo_0+48
                  c.nop
                  amoor.w.aq    t3, t6, (s10)
                  amomin.w.rl   t1, t1, (t0)
                  c.or         s1, s0
                  auipc        t5, 984861
                  amoadd.w.aq   s2, t4, (t0)
                  c.or         a3, a0
                  amomax.w      t3, tp, (s10)
                  amomax.w      tp, a6, (t0)
                  amoadd.w.aq   a3, t5, (t0)
                  amoor.w.rl    s9, s8, (s10)
                  amomax.w      gp, t6, (s10)
                  slli         s4, s1, 22
                  amomax.w.aq   a1, t4, (s10) #end riscv_amo_instr_stream_1
                  la           sp, region_0+938 #start riscv_load_store_hazard_instr_stream_1
                  lb           a3, 9(sp)
                  rem          t0, zero, s10
                  sb           t3, 9(sp)
                  mulh         s6, t3, t6
                  lbu          t3, 9(sp)
                  sb           s6, 9(sp)
                  lb           t1, 9(sp)
                  sb           a6, 9(sp)
                  lb           s4, 9(sp)
                  lb           a1, 9(sp)
                  lbu          a1, 9(sp)
                  sb           zero, 9(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           a4, region_1+517 #start riscv_load_store_hazard_instr_stream_4
                  lb           t4, -172(a4)
                  lb           a3, -172(a4)
                  sb           t2, -113(a4)
                  lb           s10, -113(a4)
                  lb           s0, -113(a4)
                  lbu          a1, -181(a4)
                  sw           a2, -181(a4)
                  sb           tp, -156(a4)
                  c.srai       a2, 30
                  lb           t4, -195(a4)
                  sh           a0, -195(a4)
                  lbu          s10, -195(a4)
                  sw           a2, -109(a4)
                  lhu          s8, -109(a4)
                  sb           ra, -72(a4) #end riscv_load_store_hazard_instr_stream_4
                  la           sp, region_1+1613 #start riscv_load_store_hazard_instr_stream_2
                  lh           zero, -1141(sp)
                  sw           a3, -1141(sp)
                  sh           t1, -1141(sp)
                  lw           t0, -1141(sp)
                  lbu          s1, -70(sp)
                  lbu          t2, -70(sp)
                  sb           t3, -70(sp)
                  mulhsu       a1, zero, tp
                  lhu          a0, -223(sp)
                  slli         s10, sp, 7
                  lbu          s10, -223(sp)
                  sh           s3, -223(sp)
                  lb           a0, 26(sp)
                  lb           t2, -255(sp)
                  srli         s8, t0, 22
                  c.nop
                  sb           s3, -255(sp)
                  xor          t2, ra, s1
                  lb           s11, -528(sp)
                  sb           s10, -1102(sp) #end riscv_load_store_hazard_instr_stream_2
                  la           s0, region_1+926 #start load_store_instr_stream_1
                  lhu          s5, -6(s0)
                  lh           s4, 0(s0)
                  la           a6, region_0+225 #start load_store_instr_stream_0
                  lhu          s2, 12(s0)
                  sb           a6, 88(a6)
                  sb           s1, 168(a6)
                  lhu          s8, -4(s0)
                  lw           ra, 47(a6)
                  lbu          s11, 8(s0)
                  lh           s5, 53(a6)
                  sh           s5, -8(s0) #end load_store_instr_stream_1
                  lw           ra, 127(a6) #end load_store_instr_stream_0
                  la           t0, region_0+1137 #start riscv_hazard_instr_stream_5
                  lbu          zero, -2(t0)
                  sb           s0, 9(t0)
                  mulhu        ra, ra, s5
                  c.srli       s0, 12
                  slt          s9, s9, s0
                  lb           ra, -1(t0)
                  lb           s5, 6(t0)
                  andi         zero, s6, 1199
                  c.add        s5, s5
                  sb           ra, -10(t0)
                  c.lui        s5, 29
                  lhu          s5, 15(t0)
                  sb           ra, 13(t0)
                  or           s6, s6, s9
                  mulhu        zero, zero, s0
                  sw           s5, 15(t0)
                  lh           zero, 3(t0)
                  lb           s9, -14(t0)
                  lb           s6, -4(t0)
                  mulhsu       s5, zero, zero
                  mulh         ra, s6, s5
                  sh           s6, 5(t0)
                  sh           s9, 3(t0)
                  mulhu        ra, s0, s9
                  slli         zero, zero, 19
                  ori          s9, s5, 1487
                  nop
                  lhu          s9, -1(t0)
                  lbu          s0, -15(t0)
                  xor          s9, zero, s9
                  lbu          s5, 14(t0) #end riscv_hazard_instr_stream_5
                  la           t2, amo_0+44 #start riscv_lr_sc_instr_stream_1
                  lr.w.aq       s2, (t2)
                  slti         a3, sp, 807
                  c.xor        a0, a2
                  divu         s9, s8, a4
                  sc.w          a1, a2, (t2) #end riscv_lr_sc_instr_stream_1
                  la           s2, region_0+937 #start riscv_hazard_instr_stream_0
                  sb           a0, -54(s2)
                  lb           a0, 64(s2)
                  lb           s8, 21(s2)
                  sb           t4, 56(s2)
                  lbu          a2, -17(s2)
                  lb           a0, 7(s2)
                  c.sub        a2, a2
                  sb           t4, -24(s2)
                  lbu          a0, -58(s2)
                  c.srli       a2, 18
                  sb           a0, 38(s2)
                  lb           s9, -36(s2)
                  lbu          s9, 60(s2)
                  add          s8, a2, t4
                  xor          s9, t4, s0
                  c.sub        a2, a2
                  lb           s8, -12(s2)
                  c.nop
                  lhu          s0, 33(s2)
                  slli         a0, a2, 20
                  sb           s8, -37(s2)
                  c.slli       s0, 24
                  lbu          a0, 25(s2)
                  sw           a0, 11(s2)
                  srl          a0, s9, a2
                  lbu          s8, -16(s2)
                  lbu          a0, 28(s2)
                  sh           a0, -59(s2)
                  lbu          a2, -54(s2)
                  mulhsu       s9, s8, s9
                  mulh         s8, a2, s8
                  slli         a2, s8, 11
                  sb           s8, 45(s2)
                  sb           s8, 14(s2)
                  mulhsu       s8, t4, s0
                  lb           a0, -28(s2)
                  sh           s9, 61(s2)
                  srli         a0, s8, 20
                  lb           a2, -30(s2) #end riscv_hazard_instr_stream_0
                  la           s11, region_1+626 #start load_store_instr_stream_0
                  la           s3, region_0+1028 #start load_store_instr_stream_1
                  sb           a3, 11(s11)
                  lbu          a1, 4(s3)
                  lb           a1, -16(s3)
                  lbu          t4, 0(s3)
                  lbu          tp, 3(s11)
                  sb           t4, -6(s11)
                  lb           s0, -13(s3)
                  sb           s6, -8(s3) #end load_store_instr_stream_1
                  lb           t2, -12(s11)
                  lbu          t4, -13(s11) #end load_store_instr_stream_0
                  la           s2, region_0+1430 #start riscv_load_store_rand_instr_stream_4
                  lbu          gp, -45(s2)
                  lbu          s8, 92(s2)
                  lhu          t1, 52(s2)
                  sh           a1, 208(s2)
                  sh           a0, 190(s2)
                  lbu          t5, 27(s2)
                  sll          t0, s6, a1
                  lbu          s0, -220(s2)
                  sltiu        a3, t5, -1678
                  sb           t0, 66(s2)
                  lb           zero, 105(s2)
                  lhu          tp, 38(s2)
                  sltu         a4, t5, t5
                  addi         a6, t2, -1707
                  c.srli       a2, 18
                  mulh         ra, a3, tp
                  slli         t4, tp, 29
                  lb           a4, 41(s2)
                  lbu          t6, 115(s2)
                  slti         a4, s0, -1267
                  remu         s6, ra, t5
                  sb           a7, -149(s2)
                  sltu         t5, t6, t2
                  slli         a0, t1, 21
                  c.addi4spn   s0, sp, 496
                  lh           tp, 194(s2)
                  c.addi       s6, 10
                  sltu         gp, s10, t1
                  xor          tp, a6, a0
                  lb           a2, 17(s2)
                  sltu         t4, tp, s6
                  andi         sp, s3, -1798
                  c.mv         t0, a3
                  c.andi       a2, -1
                  lbu          a0, -26(s2)
                  slti         gp, t1, 62
                  sh           a4, -18(s2)
                  remu         s4, t0, s11
                  slti         t4, a3, 1558
                  divu         s8, zero, s6
                  ori          s4, s1, -95
                  lbu          a4, -215(s2) #end riscv_load_store_rand_instr_stream_4
                  la           sp, region_1+1314 #start riscv_load_store_hazard_instr_stream_3
                  sb           t5, 39(sp)
                  lb           t1, 39(sp)
                  srl          gp, zero, a0
                  sltiu        s6, a5, 928
                  lhu          t5, 10(sp)
                  sb           t6, -4(sp)
                  sltiu        ra, s6, 1802
                  rem          a6, a1, s10
                  sb           a0, 55(sp)
                  xori         a6, t0, -932
                  lbu          s3, -32(sp)
                  lh           gp, -54(sp)
                  lhu          t2, 2(sp)
                  lb           ra, -49(sp)
                  mulhu        s9, s7, a0
                  lbu          t3, -27(sp) #end riscv_load_store_hazard_instr_stream_3
                  la           s5, region_1+841 #start load_store_instr_stream_0
                  la           ra, region_1+1524 #start load_store_instr_stream_3
                  la           tp, region_1+1366 #start load_store_instr_stream_2
                  sw           a1, -13(s5)
                  lb           s9, -13(ra)
                  lhu          t4, -24(tp)
                  sw           t6, 186(tp)
                  lb           s8, -13(ra)
                  la           s2, region_1+1406 #start load_store_instr_stream_1
                  lb           gp, -2(s2)
                  lw           a0, 15(s5)
                  lbu          a0, -3(s5)
                  lb           s8, -1(s2)
                  lbu          a0, -7(s5)
                  sb           s3, 1(ra)
                  lb           s10, -221(tp)
                  sb           s3, -1(ra)
                  lbu          zero, 3(s2)
                  sb           a2, -69(tp)
                  sb           s10, 125(tp)
                  lb           t6, -1(s2)
                  lhu          t2, -7(s5)
                  sb           tp, -1(s2) #end load_store_instr_stream_1
                  lh           t0, -92(tp) #end load_store_instr_stream_2
                  lbu          s10, -14(s5)
                  sb           s2, 5(ra) #end load_store_instr_stream_3
                  lbu          t3, 15(s5) #end load_store_instr_stream_0
sub_1_10:         jal          ra, 22f
0:                c.j          21f
1:                c.jal        0b
2:                jal          sp, 4f
3:                c.jal        24f
4:                c.jal        15f
5:                jal          ra, 13f
6:                jal          t1, 11f
7:                jal          gp, 9f
8:                c.jal        18f
9:                c.j          10f
10:               c.j          19f
11:               jal          t1, 16f
12:               jal          ra, 2b
13:               c.j          6b
14:               c.jal        12b
15:               c.j          8b
16:               jal          a2, 23f
17:               c.j          20f
18:               c.jal        17b
19:               c.j          5b
20:               jal          ra, 1b
21:               c.j          7b
22:               jal          ra, 14b
23:               c.jal        3b
24:               mulhsu       sp, t0, zero
                  la           t1, region_1+613 #start load_store_instr_stream_2
                  la           a2, region_1+1274 #start load_store_instr_stream_0
                  lb           a6, 29(a2)
                  lbu          t6, -2(t1)
                  la           sp, region_1+978 #start load_store_instr_stream_1
                  sh           tp, 21(t1)
                  sb           s4, -3(a2)
                  lbu          s1, 26(t1)
                  sh           s6, -45(t1)
                  sb           t5, 7(sp)
                  lbu          ra, 3(sp)
                  sh           t4, 27(t1)
                  sb           sp, -16(sp)
                  lh           s3, 19(t1)
                  lbu          s11, -42(t1)
                  lw           a4, -34(a2)
                  lb           s3, 7(sp)
                  lbu          s1, -53(a2)
                  lbu          a0, -1(sp)
                  lbu          s10, -16(t1) #end load_store_instr_stream_2
                  sb           a4, -11(sp) #end load_store_instr_stream_1
                  sb           t1, -60(a2) #end load_store_instr_stream_0
                  la           t1, region_0+476 #start riscv_hazard_instr_stream_4
                  lhu          t0, 42(t1)
                  lbu          s2, 58(t1)
                  lh           t0, 2(t1)
                  sltiu        s2, t3, 445
                  lh           t2, 14(t1)
                  lb           t2, -58(t1)
                  sb           t0, 58(t1)
                  or           s9, s2, s1
                  sll          s2, s9, t2
                  lb           t2, -57(t1)
                  mul          t3, s2, s2
                  lhu          t0, -18(t1)
                  slti         t0, t0, 676
                  sra          t2, t0, s9
                  sltu         t3, t2, t3
                  slt          s9, s2, t0
                  c.andi       s1, -1
                  sh           s9, -44(t1)
                  lbu          s2, 9(t1)
                  auipc        t2, 1021083
                  sra          t0, t2, s1
                  c.and        s1, s1
                  sb           t3, 62(t1)
                  or           s9, s1, t3
                  c.or         s1, s1
                  srai         t2, s2, 11
                  addi         t3, t3, 1653
                  slti         s1, t3, 1087
                  auipc        s2, 928119
                  xor          t3, s9, t0
                  mul          t2, s1, s1
                  c.lui        t0, 22
                  mulh         s9, t0, s2
                  ori          t0, t3, 1303
                  sra          s2, s2, t0
                  mul          s2, s2, t0
                  sb           s1, 61(t1)
                  c.mv         s9, t0
                  add          s9, t3, t0
                  sb           t2, 28(t1)
                  lb           s9, 57(t1) #end riscv_hazard_instr_stream_4
                  addi         s11, zero, -3 #init loop 1 counter
                  addi         s5, zero, 19 #init loop 1 limit
sub_1_28_1_t:     slti         t2, s0, -156
                  addi         s11, s11, 2 #update loop 1 counter
                  addi         tp, zero, -8 #init loop 0 counter
                  andi         a6, gp, 1817
                  addi         t5, zero, -16 #init loop 0 limit
sub_1_28_0_t:     or           t1, s3, s11
                  xor          s10, a5, t3
                  addi         tp, tp, -8 #update loop 0 counter
                  beq          tp, t5, sub_1_28_0_t #branch for loop 0
                  beq          s11, s5, sub_1_28_1_t #branch for loop 1
                  c.srai       a3, 16
                  addi         s0, zero, 5 #init loop 1 counter
                  addi         t3, zero, 4 #init loop 1 limit
sub_1_29_1_t:     slti         a2, sp, 1521
                  addi         s0, s0, -2 #update loop 1 counter
                  addi         s10, zero, 8 #init loop 0 counter
                  addi         a3, zero, 18 #init loop 0 limit
sub_1_29_0_t:     add          s6, s2, a1
                  addi         s10, s10, 10 #update loop 0 counter
                  bne          s10, a3, sub_1_29_0_t #branch for loop 0
                  bgeu         s0, t3, sub_1_29_1_t #branch for loop 1
                  c.srai       s1, 2
                  la           s0, amo_0+48 #start riscv_amo_instr_stream_2
                  la           a2, amo_0+44
                  la           s1, amo_0+32
                  amoor.w.rl    a1, t3, (a2)
                  add          s9, t4, a1
                  amomax.w.rl   ra, gp, (a2)
                  amoxor.w.rl   a6, a0, (s1)
                  c.srai       a1, 1
                  amoswap.w     a0, a2, (s0) #end riscv_amo_instr_stream_2
                  addi         a3, zero, 6 #init loop 1 counter
                  add          s6, s9, a7
                  c.addi       t3, -1
                  srli         a0, s3, 16
                  mul          t5, a7, tp
                  lui          s6, 106368
                  c.or         a0, a4
                  c.and        a0, a5
                  mulh         t1, t5, s8
                  xor          s8, a2, a4
                  addi         s3, zero, -12 #init loop 1 limit
sub_1_31_1_t:     slti         s4, a5, 150
                  addi         a3, a3, -5 #update loop 1 counter
                  addi         s0, zero, 4 #init loop 0 counter
                  c.and        a1, a4
                  c.lui        a0, 1
                  addi         sp, zero, 17 #init loop 0 limit
                  xor          s6, s7, s8
sub_1_31_0_t:     sltiu        t2, s3, 566
                  mulhsu       s9, s3, s9
                  srai         s1, s1, 9
                  addi         s0, s0, 3 #update loop 0 counter
                  sll          s6, ra, t6
                  add          t5, s5, s9
                  bltu         s0, sp, sub_1_31_0_t #branch for loop 0
                  c.nop
                  bge          a3, s3, sub_1_31_1_t #branch for loop 1
                  nop
                  la           t5, region_1+531 #start load_store_instr_stream_1
                  la           t2, region_0+636 #start load_store_instr_stream_0
                  lb           tp, 29(t5)
                  lh           s6, -39(t5)
                  lb           a4, -9(t5)
                  lh           sp, -9(t5)
                  lbu          s1, 38(t5)
                  lbu          s0, 5(t2)
                  sw           t1, 1(t5)
                  lbu          t1, 1(t2)
                  sb           s6, 17(t5)
                  sb           a5, 12(t2)
                  lbu          t1, -28(t5)
                  lb           t0, 4(t2)
                  sb           a0, -64(t5) #end load_store_instr_stream_1
                  lb           s6, -7(t2) #end load_store_instr_stream_0
                  auipc        s11, 141884
                  sra          s2, gp, t4
                  bgeu         t4, zero, 13f
                  c.xor        s0, a4
                  c.nop
                  c.bnez       a0, 14f
                  sub          s9, a0, a2
                  sltu         t6, s1, tp
                  andi         t0, a3, -1461
                  slt          a2, s5, zero
                  mulhsu       tp, s4, sp
                  div          zero, s8, a0
                  srli         s1, s8, 25
13:               divu         ra, s11, a7
14:               slli         a0, a7, 1
                  bne          tp, s6, 31f
                  c.srli       a2, 23
                  sll          a2, a6, a7
                  c.addi16sp   sp, 160
                  sub          zero, s11, t3
                  c.bnez       a3, 31f
                  andi         t4, s5, -1543
                  blt          s0, zero, 28f
                  slli         t6, t4, 13
                  c.li         t1, 25
                  c.nop
                  c.and        a2, a5
                  c.srli       a0, 26
28:               xori         s2, s7, -1638
                  remu         a2, t1, a3
                  sra          a6, zero, a0
31:               beq          s11, sp, 41f
                  c.and        s1, a4
                  sll          a0, a7, s10
                  xor          t4, s9, t6
                  c.addi       s10, 30
                  sra          t1, t4, s10
                  c.andi       s1, -1
                  xori         s3, s8, -645
                  blt          a2, s11, 59f
                  slt          a4, s2, t4
41:               c.bnez       a4, 60f
                  sltiu        s2, s2, -1982
                  c.lui        tp, 3
                  c.addi       a4, -1
                  srl          a0, t5, gp
                  srl          sp, s2, t1
                  rem          s11, t4, a5
                  divu         a6, sp, s8
                  beq          ra, t1, 56f
                  c.add        a2, ra
                  srl          a3, s3, tp
                  c.slli       t6, 16
                  xori         s9, a4, -920
                  srl          s2, tp, t4
                  bge          t1, s10, 67f
56:               c.sub        a0, a0
                  c.and        a1, a0
                  remu         tp, sp, tp
59:               auipc        a1, 121789
60:               xor          a4, t2, tp
                  slt          s9, t6, a0
                  sra          t1, a5, gp
                  remu         s10, t3, s5
                  mul          sp, t0, s11
                  nop
                  slt          s4, s11, s0
67:               addi         s11, t0, -2012
                  xor          zero, s0, t5
                  bne          zero, t5, 81f
                  sub          sp, tp, s7
                  c.andi       a0, -1
                  sub          t6, s5, t6
                  c.slli       t5, 31
                  xori         zero, s10, 2013
                  sra          a1, tp, a1
                  c.li         s0, -1
                  c.addi16sp   sp, 192
                  add          s6, s2, t1
                  bge          a5, s0, 88f
                  slti         tp, s0, -1160
81:               divu         a0, a3, t5
                  beq          s11, a4, 84f
                  slti         zero, s7, -1320
84:               c.lui        s0, 19
                  mul          sp, t1, s5
                  c.bnez       s0, 91f
                  ori          a3, a2, -211
88:               c.xor        a2, s0
                  auipc        t0, 290826
                  slt          s6, a6, s9
91:               c.sub        a0, s1
                  c.and        s0, a3
                  slli         t0, a6, 16
                  mulh         s10, s8, t4
                  c.sub        a2, a3
                  sra          s5, s0, s3
                  and          s1, s10, gp
                  srai         s10, a7, 4
                  mul          a1, t5, gp
                  c.mv         sp, a7
                  sub          a2, s10, t5
                  add          s2, t3, a7
                  c.addi4spn   a4, sp, 864
                  c.lui        t0, 30
                  c.lui        t6, 30
                  and          t6, s10, s0
                  sltu         t2, s7, ra
                  bge          s11, a6, 126f
                  bge          a2, t0, 119f
                  c.addi16sp   sp, 16
                  c.mv         sp, t2
                  slti         sp, a2, -1633
                  c.srai       a3, 18
                  srli         a2, s3, 18
                  div          s3, s5, s7
                  c.addi16sp   sp, 272
                  ori          gp, t4, 529
                  mulhsu       sp, t5, a5
119:              bge          s2, s8, 133f
                  blt          s0, a5, 134f
                  nop
                  xori         t4, t6, 1859
                  c.addi16sp   sp, -16
                  add          a0, a0, a1
                  remu         s11, s0, gp
126:              andi         s2, t1, -1068
                  sltu         s1, s3, t1
                  c.xor        s0, a2
                  c.bnez       a1, 146f
                  c.mv         s6, s9
                  sra          t5, ra, a5
                  sra          s3, s1, s7
133:              mulhsu       a6, zero, sp
134:              c.li         a4, -1
                  c.add        sp, s8
                  xori         a1, a4, -1751
                  sll          t6, s5, s6
                  sltu         gp, s0, t4
                  div          tp, a3, a5
                  slti         t1, t1, -1124
                  nop
                  srai         s2, s7, 25
                  c.andi       a4, 26
                  srli         s11, tp, 14
                  blt          s5, t0, 146f
146:              srl          a3, s8, s11
                  addi         tp, t1, 716
                  and          t2, a4, t2
                  rem          s5, t1, t6
                  mul          s3, t4, ra
                  div          a1, a1, s3
                  srl          s3, t3, t1
                  sltiu        t4, s3, 858
                  bne          s10, s6, 156f
                  mulhsu       s9, s7, s3
156:              c.addi       a2, 13
                  srl          t6, a0, s8
                  or           s6, sp, a3
                  c.addi16sp   sp, -16
                  or           s4, s7, a1
                  blt          a2, a6, 179f
                  c.beqz       a4, 174f
                  c.srli       s0, 17
                  sltiu        s10, a4, -133
                  xori         s2, zero, -1318
                  c.srai       a1, 10
                  ori          gp, zero, -1820
                  c.li         a1, 24
                  nop
                  c.and        a4, a3
                  xor          t0, s4, s1
                  c.sub        a1, a5
                  sltiu        t4, s7, 111
174:              divu         sp, t6, tp
                  slti         s3, s6, -1360
                  blt          sp, t6, 192f
                  c.srli       s0, 10
                  srl          t0, s10, a2
179:              mul          t3, s5, a1
                  c.add        tp, s1
                  auipc        zero, 17227
                  mulhu        t0, t5, s7
                  c.xor        a4, s1
                  c.mv         s4, a0
                  c.andi       a4, -1
                  mul          a0, t6, t2
                  addi         a1, s4, -430
                  mulhsu       s11, a5, a7
                  c.bnez       a3, 192f
                  mulhu        zero, s4, t6
                  add          s10, t0, zero
192:              sub          s8, t1, t3
                  remu         s11, t4, sp
                  c.slli       s8, 8
                  slti         s8, s10, -1153
                  c.add        a2, t0
                  c.addi16sp   sp, 176
                  slt          t3, t3, t5
                  sltu         s5, s7, a1
                  c.andi       a2, -1
                  and          s11, ra, s6
                  bge          tp, a4, 215f
                  slt          s4, t0, zero
                  c.slli       s11, 16
                  andi         a3, zero, -1250
                  c.nop
                  sltiu        s8, s4, 751
                  c.xor        a0, a5
                  c.addi4spn   a0, sp, 784
                  c.xor        s1, a0
                  sub          ra, a7, t2
                  bne          a2, a6, 225f
                  xor          a2, gp, a0
                  c.srli       s1, 1
215:              srai         a3, s5, 10
                  slli         gp, ra, 21
                  sltu         t2, s1, tp
                  srai         s10, t4, 10
                  c.addi16sp   sp, 128
                  mulhu        s0, t0, a7
                  ori          s10, t2, 1404
                  slli         t5, zero, 23
                  beq          s7, s10, 234f
                  c.addi16sp   sp, -16
225:              c.xor        a4, a2
                  lui          t5, 729484
                  bge          s2, a7, 228f
228:              mulhu        a6, s11, s1
                  c.lui        a0, 5
                  mulhu        t2, s11, a2
                  srl          s3, gp, s4
                  c.beqz       a4, 240f
                  bge          a6, s7, 234f
234:              c.lui        s1, 19
                  c.andi       a0, 15
                  add          t2, s1, a3
                  c.bnez       s1, 253f
                  c.beqz       a2, 256f
                  c.bnez       a1, 256f
240:              sra          s1, ra, s11
                  or           a0, a5, s6
                  lui          t6, 890180
                  sltu         s10, a5, s4
                  c.li         s3, 14
                  sra          sp, a3, s6
                  c.lui        a4, 20
                  bgeu         s3, ra, 261f
                  bge          t4, s2, 257f
                  sra          s10, a4, s1
                  c.slli       a2, 31
                  rem          s9, a2, t6
                  c.add        gp, s1
253:              and          t4, t1, s11
                  sub          a6, gp, s11
                  c.addi       s11, 8
256:              rem          a0, tp, s1
257:              addi         s11, a3, -589
                  c.add        s6, a6
                  c.add        s6, s1
                  add          tp, a2, a3
261:              c.mv         tp, t3
                  c.addi4spn   a0, sp, 528
                  bge          a5, t6, 276f
                  srli         sp, t3, 31
                  bgeu         s0, t6, 267f
                  nop
267:              mulhu        s10, s6, a2
                  c.sub        a4, a3
                  c.andi       a2, 5
                  sll          s6, t5, tp
                  rem          s4, a7, s2
                  sra          t6, a6, t5
                  mul          t1, a5, gp
                  beq          gp, a1, 287f
                  sub          s4, s8, zero
276:              c.lui        s4, 16
                  bne          s0, t3, 287f
                  sra          t0, s1, t3
                  c.addi4spn   s1, sp, 112
                  c.addi16sp   sp, -16
                  slt          s8, a0, s5
                  c.xor        a1, a1
                  sub          s8, a2, s0
                  xor          t3, t3, tp
                  c.li         s3, 31
                  c.addi16sp   sp, -16
287:              andi         gp, a2, 2
                  srli         t2, ra, 10
                  c.slli       s6, 8
                  c.nop
                  mulhsu       gp, sp, t0
                  c.sub        s1, a2
                  c.and        a0, a0
                  beq          ra, s11, 308f
                  c.slli       t4, 1
                  sltiu        s3, zero, -642
                  srai         t5, a4, 11
                  c.lui        s5, 16
                  andi         tp, s3, -234
                  bne          s10, s0, 301f
301:              nop
                  sub          s8, s6, a1
                  bge          t2, a5, 314f
                  bge          t5, t2, 314f
                  rem          ra, t2, t0
                  mul          s1, gp, a6
                  xori         gp, tp, -120
308:              rem          s3, s9, s2
                  slti         s0, t3, 261
                  c.addi       s9, -1
                  c.addi       s3, 24
                  srli         s9, s3, 31
                  bge          s11, t2, 331f
314:              addi         s4, a3, 445
                  div          s11, t1, s1
                  mulhsu       a4, a3, s9
                  sub          s5, s7, t4
                  c.xor        a2, a1
                  sltu         ra, a0, t0
                  divu         s2, s4, s6
                  mulhu        t0, s2, s5
                  bltu         s8, zero, 333f
                  bgeu         t5, s8, 335f
                  c.and        s0, a0
                  sltu         t0, s1, t3
                  c.beqz       s0, 328f
                  sltu         a4, a4, a0
328:              bge          s5, a0, 344f
                  mul          t4, sp, a1
                  or           s9, ra, s11
331:              slt          t1, zero, t6
                  c.sub        a2, a2
333:              sltiu        t4, a3, -1652
                  c.sub        a0, a3
335:              xor          s6, zero, a6
                  c.add        s11, a1
                  c.srai       a0, 23
                  c.slli       sp, 9
                  remu         s5, gp, s10
                  bltu         a3, t2, 346f
                  c.li         t2, 8
                  div          s6, s4, t1
                  mul          t6, t0, s0
344:              blt          a5, a3, 349f
                  sra          zero, sp, a5
346:              ori          t5, s5, 43
                  c.xor        a3, a4
                  sltiu        ra, a6, 799
349:              c.or         a2, a3
                  c.bnez       s0, 370f
                  bge          t2, sp, 370f
                  c.sub        s1, a4
                  c.xor        a3, a3
                  c.li         s6, -1
                  mulhsu       s2, t3, a2
                  rem          s5, zero, s9
                  c.sub        a2, a5
                  c.srli       a0, 3
                  bltu         s9, a6, 371f
                  c.srai       a0, 12
                  slt          ra, s1, s5
                  c.addi16sp   sp, -16
                  c.addi       s6, 9
                  c.xor        s0, a0
                  ori          a2, a0, -1112
                  xori         t2, t1, 883
                  mulhsu       s2, s9, zero
                  blt          s2, s2, 380f
                  xor          t5, a2, s3
370:              c.lui        t4, 20
371:              remu         s6, a4, s5
                  c.nop
                  mulhsu       s0, t1, a3
                  c.addi16sp   sp, -16
                  andi         t6, s4, -909
                  srl          s0, s5, a3
                  mul          s6, s10, gp
                  c.add        a6, s5
                  blt          t1, s5, 388f
380:              c.beqz       a0, 388f
                  divu         s11, s6, t5
                  sra          zero, a0, a2
                  bge          t6, a6, 386f
                  or           a6, a5, zero
                  bge          s5, ra, 396f
386:              rem          a2, s11, a6
                  divu         s10, a6, s11
388:              blt          gp, a4, 395f
                  c.slli       s9, 22
                  and          t4, s1, s5
                  add          gp, a6, s11
                  bltu         a4, tp, 412f
                  c.mv         t6, t3
                  c.srai       a4, 27
395:              andi         zero, s1, -1800
396:              c.srai       a3, 2
                  la           a2, amo_0+28 #start riscv_lr_sc_instr_stream_2
                  srli         a1, s2, 15
                  or           t3, tp, a1
                  c.srai       s0, 22
                  mulhu        a3, t5, s1
                  c.mv         s4, s0
                  c.addi16sp   sp, 432
                  ori          s4, a5, 1492
                  c.addi16sp   sp, 160
                  ori          a0, s5, -1312
                  div          s9, s6, a0
                  lr.w          s0, (a2)
                  c.sub        a1, a5
                  ori          a4, t2, 1022
                  c.mv         t6, t5
                  sc.w.aq       s10, s11, (a2) #end riscv_lr_sc_instr_stream_2
                  div          s4, s1, s9
                  addi         a2, a4, -1627
                  blt          s9, s7, 401f
                  beq          a2, t4, 402f
401:              auipc        sp, 542567
402:              sltu         t5, t1, s2
                  c.mv         s4, a6
                  mulhsu       a1, a1, a5
                  mul          s0, s4, s3
                  c.srai       s1, 16
                  mulhsu       s6, a5, s9
                  add          s10, sp, s1
                  c.nop
                  c.add        s5, a2
                  srl          t3, a1, a0
412:              mulhsu       s3, t0, sp
                  c.nop
                  c.sub        a2, a1
                  c.addi       gp, 17
                  c.slli       t3, 19
                  c.addi4spn   a0, sp, 144
                  bltu         s9, a0, 429f
                  mulhsu       t2, a2, s5
                  c.slli       a2, 19
                  sltiu        s10, a5, -363
                  lui          a6, 830906
                  addi         s9, t3, 1333
                  bge          s6, s9, 438f
                  add          sp, s6, a3
                  and          t1, s11, a7
                  mulh         s5, gp, a4
                  c.addi16sp   sp, 464
429:              sltu         a6, t4, zero
                  c.lui        tp, 25
                  bltu         s0, sp, 447f
                  slli         t3, s4, 26
                  or           sp, a7, sp
                  c.nop
                  c.mv         a0, t6
                  bltu         s11, a4, 449f
                  nop
438:              srl          s6, t6, gp
                  auipc        s5, 588730
                  ori          sp, s10, 641
                  div          s3, zero, t5
                  slli         s4, t6, 21
                  c.li         t3, -1
                  c.or         a3, a2
                  bltu         a7, a2, 457f
                  srai         s9, s1, 6
447:              c.lui        a3, 31
                  divu         a6, a7, s7
449:              sltu         a1, s8, s0
                  bne          a1, s7, 468f
                  c.addi       sp, 8
                  lui          sp, 1005057
                  beq          tp, zero, 464f
                  xori         a0, a5, -881
                  slti         s0, a0, 816
                  slli         a2, t3, 28
457:              blt          a5, a4, 466f
                  c.bnez       a1, 470f
                  xor          a4, s10, s1
                  xori         s2, t0, 171
                  or           a6, a3, s6
                  xori         s0, s10, 512
                  c.srai       s1, 21
464:              auipc        s6, 575145
                  div          a0, tp, zero
466:              xori         s6, t5, 1273
                  mulhu        s9, a4, t2
468:              c.and        a2, a3
                  nop
470:              addi         s10, ra, -1433
                  andi         a2, s4, 1982
                  andi         a2, t5, -2011
                  lui          t2, 108296
                  srai         a4, s8, 14
                  andi         a2, t4, -946
                  srai         t4, s6, 12
                  lui          t0, 409032
                  nop
                  c.addi4spn   a0, sp, 288
                  c.srai       a0, 18
                  mulhsu       a0, s1, a4
                  c.li         s3, 21
                  srai         s3, t6, 28
                  mul          a1, a1, a0
                  ori          s0, s3, -1818
                  remu         s5, s0, s7
                  c.sub        a0, a3
                  c.lui        s9, 3
                  c.li         t3, 4
                  sltiu        a4, a1, -978
                  mul          zero, s11, a6
                  beq          a1, a2, 493f
493:              beq          s5, s1, 506f
                  bne          s0, s0, 495f
495:              or           a1, gp, a3
                  auipc        tp, 318343
                  c.slli       ra, 22
                  c.beqz       s1, 510f
                  c.nop
                  c.sub        a3, a2
                  or           a6, s2, s9
                  ori          s9, t3, 1836
                  bltu         t6, gp, 510f
                  c.nop
                  srl          a4, sp, s6
506:              c.andi       a2, 3
                  bgeu         t5, s10, 512f
                  slli         a1, a6, 9
                  c.lui        s6, 11
510:              remu         t2, a0, s6
                  bge          t1, tp, 514f
512:              or           s3, a0, a5
                  slli         s8, s11, 27
514:              c.xor        a3, a2
                  bltu         s2, a3, 525f
                  c.and        a4, a1
                  and          ra, s5, t6
                  and          t4, s0, a4
                  mulh         t5, t0, gp
                  div          s3, s7, t3
                  mulh         s4, s10, s0
                  mulhsu       t0, tp, t0
                  c.beqz       a1, 529f
                  sltiu        a0, ra, 815
525:              sra          t2, a0, a7
                  c.or         s1, a3
                  mulhu        tp, a7, t3
                  slli         a1, sp, 18
529:              sll          a6, s0, s6
                  c.add        tp, a3
                  div          s9, t0, s5
                  srl          a4, zero, s6
                  sltu         tp, gp, t5
                  sll          zero, a3, s9
                  c.addi4spn   a2, sp, 960
                  sltiu        s2, s9, -859
                  c.xor        a0, s0
                  sll          tp, s4, ra
                  mulh         a0, t1, s9
                  sll          sp, s11, a5
                  bne          s8, t4, 560f
                  srli         a0, a7, 25
                  add          s0, s10, a5
                  remu         a2, s0, t0
                  srai         s0, a4, 28
                  c.sub        s1, s1
                  remu         s8, s2, s9
                  ori          t1, t3, 1024
                  c.addi       t6, -1
                  slt          t2, s1, s1
                  nop
                  slt          s8, t4, sp
                  sll          a6, s10, zero
                  xori         s11, a4, -21
                  nop
                  c.or         a2, a4
                  mul          zero, s7, tp
                  c.sub        s1, s1
                  ori          t0, a1, 639
560:              sltu         s10, s10, s8
                  nop
                  beq          t2, a0, 576f
                  slt          t1, t3, a1
                  addi         a2, ra, 489
                  c.addi       sp, 21
                  sra          a2, s2, sp
                  slli         s4, t6, 16
                  srai         s6, s0, 2
                  c.andi       a1, -1
                  srli         s10, t4, 23
                  addi         t5, s3, 98
                  c.slli       s1, 3
                  srli         zero, t6, 19
                  slt          a3, s4, t6
                  beq          a4, zero, 585f
576:              addi         t5, a6, -331
                  mulhsu       gp, s5, s0
                  auipc        s0, 338259
                  c.addi       t4, 14
                  c.addi       t0, -1
                  mul          t3, t6, s7
                  bne          t2, a0, 593f
                  bge          zero, s6, 592f
                  ori          s8, s9, -912
585:              c.xor        a4, s0
                  srli         s1, a2, 1
                  srai         sp, s0, 1
                  addi         s0, t3, -1461
                  c.li         t5, -1
                  srl          ra, a4, a6
                  or           t0, s10, s2
592:              xor          t3, s1, s3
593:              c.xor        a4, a1
                  bgeu         s9, s4, 602f
                  sll          t1, s8, t4
                  or           s0, a4, a1
                  bge          t0, t0, 613f
                  xor          s3, s10, a2
                  c.bnez       a0, 617f
                  add          s11, a1, s9
                  sra          t5, a7, t1
602:              slli         t2, a4, 3
                  xor          t4, s1, s10
                  mulhsu       s10, t1, gp
                  c.slli       t3, 7
                  or           s8, a2, t4
                  bltu         s7, t0, 624f
                  divu         s3, t6, s7
                  xori         s10, s4, 686
                  blt          a7, a1, 622f
                  c.and        s0, a3
                  mul          t0, s8, t6
613:              srli         s11, zero, 0
                  c.bnez       a1, 633f
                  slti         s4, s4, -1879
                  c.srai       a4, 1
617:              mul          s5, s7, a6
                  mulhsu       s8, t3, s6
                  rem          zero, a6, gp
                  and          t4, gp, t5
                  c.srli       a4, 3
622:              c.addi4spn   s1, sp, 640
                  c.addi16sp   sp, 16
624:              rem          s11, s11, s8
                  slti         a6, s9, 746
                  srl          ra, a5, s3
                  addi         s3, s11, -518
                  sub          t6, zero, zero
                  c.bnez       s0, 643f
                  c.mv         tp, ra
                  slli         t1, s4, 22
                  bgeu         t3, t2, 634f
633:              srl          s2, t1, t2
634:              remu         t4, tp, sp
                  c.srai       a1, 20
                  andi         s3, t6, -1350
                  sra          t5, a4, t2
                  auipc        tp, 198392
                  auipc        s3, 123346
                  bge          a2, tp, 645f
                  div          s0, t0, s2
                  mul          t5, s8, gp
643:              sltu         s11, t4, a7
                  slt          s6, s3, s8
645:              beq          s6, s7, 659f
                  c.bnez       s0, 655f
                  remu         zero, s6, s11
                  or           t2, s7, a1
                  bltu         s4, t0, 660f
                  sll          t2, t3, s2
                  c.srai       a4, 27
                  c.addi4spn   s0, sp, 800
                  c.add        t4, t2
                  mulh         a2, t5, s5
655:              mulh         s2, t0, t6
                  and          sp, t3, s11
                  xor          a0, t2, zero
                  c.and        a2, a3
659:              c.slli       t0, 4
660:              c.addi16sp   sp, 288
                  mulhu        sp, s0, a3
                  c.nop
                  bne          tp, s11, 671f
                  c.nop
                  c.and        a2, a4
                  mulhsu       a1, a2, s11
                  bgeu         a2, zero, 678f
                  mulhu        a2, s8, t6
                  xor          a6, a5, t2
                  andi         t6, zero, -234
671:              addi         t6, s10, 238
                  slli         t1, a7, 28
                  or           s8, t4, a6
                  c.andi       a1, -1
                  c.beqz       a4, 687f
                  srl          gp, s9, t4
                  slti         a4, sp, 197
678:              c.srai       a2, 5
                  xori         s3, a0, 133
                  bgeu         s0, a5, 698f
                  srl          s1, s8, t1
                  addi         s8, zero, 787
                  c.nop
                  mulh         a4, t0, s0
                  bne          a2, s2, 698f
                  c.or         a2, a4
687:              slt          t6, a2, s7
                  mulhsu       s1, s4, ra
                  c.addi4spn   a0, sp, 784
                  and          s0, s10, t5
                  lui          tp, 338646
                  add          t5, a0, t3
                  bltu         s10, s6, 699f
                  c.slli       sp, 31
                  remu         t4, t5, a1
                  bne          s10, s0, 703f
                  slli         s9, a2, 8
698:              div          s3, t5, t1
699:              c.addi       t0, -1
                  bltu         a1, gp, 710f
                  c.and        a2, a1
                  andi         t5, s1, -652
703:              bge          gp, t2, 719f
                  sub          s4, sp, s2
                  mul          s4, s9, t3
                  mulh         s8, a0, a3
                  sra          t1, s10, a2
                  srl          s6, t5, t3
                  beq          s4, t1, 722f
710:              andi         t2, a5, -402
                  bltu         s9, s4, 728f
                  c.addi4spn   s1, sp, 368
                  rem          t6, t6, s9
                  mulhsu       s2, s0, s10
                  bne          a0, a6, 731f
                  slti         t0, s2, 1056
                  c.lui        s2, 4
                  rem          s9, tp, a5
719:              c.add        s6, s0
                  c.and        a0, a5
                  sll          s2, a0, s4
722:              slli         a2, ra, 3
                  c.andi       a1, 18
                  c.nop
                  blt          s0, t6, 743f
                  sub          s8, gp, a2
                  div          gp, a7, s7
728:              xor          ra, t3, gp
                  sra          a2, s3, sp
                  sltiu        gp, a3, -310
731:              bgeu         a7, s0, 734f
                  c.add        s6, t6
                  srl          gp, t5, s5
734:              div          a3, a1, t6
                  c.srai       a1, 31
                  c.srai       a0, 11
                  sra          s2, tp, a4
                  remu         sp, t2, s0
                  sub          s0, s3, tp
                  mulhu        s11, a6, s3
                  mulh         s4, sp, a5
                  c.srai       a2, 2
743:              mulhu        s4, t6, a1
                  nop
                  c.li         s6, -1
                  c.xor        s0, a0
                  slt          zero, gp, t0
                  mulh         a6, a4, t1
                  c.addi       s4, 20
                  c.beqz       a0, 751f
751:              srli         s4, a5, 26
                  mulh         s6, a4, t4
                  c.or         a2, s0
                  srai         t4, s5, 26
                  div          s4, a3, a2
                  auipc        t0, 220156
                  or           t2, s11, s5
                  mulhu        a1, s11, t1
                  bne          s2, t3, 761f
                  rem          t3, s8, s8
761:              sub          sp, t0, a0
                  add          t0, s4, a6
                  srli         s1, s10, 7
                  c.addi4spn   a3, sp, 448
                  xori         s9, a1, -480
                  c.andi       a4, 22
                  c.lui        s8, 21
                  c.srai       a3, 3
                  and          s4, tp, s9
                  nop
                  mul          s11, a7, t2
                  bltu         t1, a1, 781f
                  divu         s0, a5, a1
                  srai         a2, a6, 12
                  slti         a1, s7, 1429
                  c.srai       a3, 23
                  mulh         t6, s2, gp
                  bgeu         t1, a0, 788f
                  c.lui        a4, 8
                  bne          t4, a7, 800f
781:              c.xor        a1, s1
                  srl          a2, tp, s7
                  c.andi       a4, -1
                  bge          a2, t1, 796f
                  c.or         a4, s0
                  beq          s11, gp, 797f
                  mulh         s2, sp, t0
788:              nop
                  c.xor        a0, s1
                  c.lui        ra, 22
                  rem          a2, t3, t0
                  divu         t6, t4, s4
                  mulh         t2, s8, s9
                  divu         t1, s1, tp
                  sll          sp, s7, s7
796:              xori         s0, t1, 534
797:              c.addi4spn   a1, sp, 416
                  beq          t0, s5, 799f
799:              c.andi       a0, 10
800:              lui          a0, 71701
                  slti         s1, a3, 475
                  mulhu        s2, gp, s9
                  rem          s11, s6, s1
                  or           s9, s2, a3
                  mulhu        tp, s10, zero
                  c.bnez       a3, 809f
                  c.srai       a1, 30
                  slt          t4, t1, a4
809:              srli         s2, a3, 27
                  or           a2, s9, s1
                  c.addi4spn   a3, sp, 752
                  ori          a4, t4, 1746
                  c.nop
                  andi         gp, t3, -242
                  lui          s4, 576832
                  sub          s3, s3, t0
                  c.and        a3, a5
                  c.addi4spn   a4, sp, 272
                  slli         t5, a5, 26
                  c.slli       s9, 31
                  sltiu        zero, s0, -1742
                  mul          t4, s9, s7
                  ori          t6, t4, 679
                  c.sub        s1, a4
                  c.addi16sp   sp, -16
                  sll          t4, s2, a5
                  add          zero, a0, a7
                  andi         tp, a2, -475
                  slt          a6, a3, gp
                  remu         s2, a2, sp
                  or           s11, s8, t3
                  rem          s8, gp, s3
                  c.xor        a0, a0
                  remu         gp, t6, a6
                  blt          a6, a6, 841f
                  c.addi16sp   sp, -16
                  addi         s10, s5, -1226
                  c.add        sp, s10
                  addi         s1, t2, 1174
                  c.addi4spn   a1, sp, 672
841:              slt          s10, s4, s7
                  c.xor        a2, a1
                  addi         t4, s6, -898
                  div          a2, a5, a7
                  mulhu        s11, s0, a0
                  bgeu         sp, a6, 848f
                  auipc        s8, 332493
848:              c.slli       sp, 22
                  xor          ra, ra, s3
                  c.addi16sp   sp, -16
                  c.addi4spn   a3, sp, 704
                  c.slli       t4, 2
                  c.slli       s8, 31
                  or           t5, s11, a7
                  ori          t2, a2, 1322
                  srl          s4, s5, s6
                  c.or         a2, a3
                  c.addi4spn   s0, sp, 304
                  mulhu        a3, t4, ra
                  c.addi16sp   sp, 256
                  c.li         s8, 25
                  rem          s2, a2, s6
                  c.andi       a4, -1
                  c.slli       a1, 20
                  c.sub        a3, a3
                  bge          a4, a6, 878f
                  c.lui        t3, 8
                  c.or         a1, a2
                  c.add        s3, ra
                  remu         s11, tp, a6
                  c.addi16sp   sp, 304
                  blt          a0, s11, 883f
                  c.addi4spn   a0, sp, 672
                  c.srai       s1, 7
                  andi         ra, a1, -1291
                  lui          zero, 103830
                  c.beqz       a3, 884f
878:              bgeu         s0, tp, 880f
                  div          a2, s0, ra
880:              bgeu         s3, a1, 898f
                  c.srai       s0, 23
                  c.mv         t1, t6
883:              sub          a2, a0, a0
884:              c.srli       a2, 3
                  auipc        a4, 282128
                  bgeu         t3, sp, 899f
                  bge          gp, t2, 892f
                  sltiu        s9, gp, 1502
                  xori         t1, t3, -1525
                  bge          s10, gp, 910f
                  divu         s4, s10, zero
892:              bltu         t4, gp, 906f
                  mul          s11, a4, a2
                  c.lui        tp, 1
                  lui          a0, 795523
                  c.andi       a3, -1
                  srli         s5, ra, 1
898:              mulhu        s1, t3, sp
899:              c.sub        a1, a1
                  bltu         a0, a5, 901f
901:              sra          a1, a0, a6
                  srai         s10, s0, 12
                  srli         s4, tp, 7
                  slt          gp, t3, t5
                  c.srli       a4, 1
906:              c.or         a3, a0
                  c.srli       a3, 25
                  sll          s10, tp, s7
                  c.lui        t4, 2
910:              srai         a0, t1, 5
                  sll          t5, tp, s6
                  xori         a6, ra, 1871
                  bne          zero, t1, 921f
                  c.sub        a3, s0
                  c.addi       s6, 22
                  mulh         t4, s3, t6
                  slt          s4, a7, t2
                  beq          t0, zero, 930f
                  bgeu         t6, t6, 936f
                  slli         t1, s2, 1
921:              slt          a2, s3, sp
                  nop
                  c.addi16sp   sp, 272
                  bltu         s5, tp, 934f
                  bne          a1, s10, 941f
                  c.addi4spn   s0, sp, 800
                  xor          zero, s1, t6
                  sltiu        a6, t1, -1207
                  c.srli       a4, 6
930:              slti         t2, a7, -1013
                  slli         sp, s9, 0
                  sra          zero, s5, a3
                  sra          sp, s0, s5
934:              c.sub        a4, a5
                  c.lui        gp, 2
936:              c.and        s0, a0
                  and          s6, s6, t6
                  addi         t4, t6, -87
                  xor          t1, s7, gp
                  bltu         a7, t6, 952f
941:              mulhsu       s9, t4, t1
                  c.mv         s6, t5
                  ori          s6, a3, -465
                  c.add        tp, tp
                  bne          tp, t3, 964f
                  c.addi4spn   s0, sp, 112
                  c.mv         s0, t2
                  ori          a1, ra, -1675
                  c.andi       a4, -1
                  c.and        s0, a0
                  bge          ra, a0, 964f
952:              c.add        a4, a5
                  c.xor        a4, a4
                  sll          s2, a3, a6
                  srl          t0, a7, s3
                  c.slli       ra, 7
                  nop
                  sltu         a3, t4, s8
                  mulhsu       s9, s2, t2
                  c.beqz       a0, 976f
                  bge          s1, s8, 972f
                  beq          s3, s2, 963f
963:              nop
964:              c.beqz       a4, 973f
                  mul          ra, a1, s7
                  c.bnez       s1, 976f
                  bne          tp, s1, 981f
                  bne          s10, s6, 977f
                  srai         a2, a2, 17
                  divu         s8, a5, a4
                  andi         a2, s2, -1577
972:              c.li         ra, 29
973:              xori         t5, a6, 1684
                  bne          s6, t5, 985f
                  c.addi4spn   a2, sp, 992
976:              sra          s9, s10, s9
977:              or           gp, sp, s6
                  xori         t5, s0, 1498
                  c.li         t5, 19
                  bne          s4, a0, 998f
981:              lui          gp, 315813
                  div          t6, t4, a0
                  bgeu         s8, t6, 993f
                  c.srli       a0, 18
985:              blt          a4, s2, 987f
                  c.srai       a4, 1
987:              srli         s3, t0, 19
                  or           zero, s6, s1
                  xori         s9, t5, -1594
                  mul          s8, s2, zero
                  c.addi4spn   a2, sp, 400
                  c.or         a1, a1
993:              blt          ra, s11, 998f
                  xor          s5, s7, tp
                  auipc        t2, 241864
                  bne          a4, s8, 1009f
                  add          t0, a1, a5
998:              srl          zero, zero, s3
                  c.sub        a2, a5
                  slt          sp, zero, t6
                  srli         s10, s2, 26
                  beq          ra, a4, 1010f
                  addi         sp, sp, 382
                  sltu         s8, zero, a7
                  c.bnez       a2, 1012f
                  c.li         t1, 4
                  div          s4, a5, a6
                  mulh         a0, t2, t6
1009:             c.lui        t6, 17
1010:             slli         s11, a2, 30
                  c.addi4spn   a1, sp, 176
1012:             c.andi       a1, -1
                  lui          s0, 891740
                  c.or         a4, a5
                  sltu         t2, sp, ra
                  slli         s10, a6, 16
                  and          t6, a4, a0
                  nop
                  c.mv         ra, sp
                  c.nop
                  mulhsu       s8, s6, gp
                  sra          t2, s4, t0
                  srl          a2, a0, s6
                  sltu         sp, s6, t5
                  c.bnez       s0, 1037f
                  remu         s0, t4, s11
                  srli         t5, tp, 17
                  bge          a5, t4, 1042f
                  srai         t6, sp, 10
                  c.slli       s11, 1
                  divu         t1, s2, a0
                  c.addi       a1, 24
                  remu         tp, t5, s4
                  ori          t2, s11, -1479
                  andi         s11, a5, 1612
                  sub          s11, sp, gp
1037:             bge          s10, t4, 1050f
                  lui          sp, 1031934
                  c.addi       t3, 21
                  mulhu        a3, t0, sp
                  mulh         t1, s10, ra
1042:             c.slli       a1, 14
                  slt          s9, s9, tp
                  divu         sp, s10, gp
                  c.addi       s4, 16
                  sll          s10, t1, t0
                  c.add        tp, s4
                  c.sub        a3, s1
                  blt          s0, s1, 1059f
1050:             c.srai       a3, 15
                  c.lui        t5, 20
                  c.lui        t1, 29
                  nop
                  c.srli       a3, 8
                  c.add        t2, s2
                  xor          s8, a5, sp
                  c.srai       a2, 29
                  c.andi       s1, -1
1059:             srl          s6, s0, t3
                  rem          s11, a1, tp
                  c.beqz       a2, 1075f
                  remu         t6, t6, ra
                  bltu         t2, a7, 1066f
                  c.mv         sp, t6
                  and          gp, s8, sp
1066:             c.andi       a3, 2
                  rem          s0, a3, s4
                  auipc        t5, 988775
                  sra          s10, s2, sp
                  c.nop
                  c.or         a4, a5
                  c.mv         t1, t1
                  divu         s5, t2, a4
                  mulhu        a6, t2, s11
1075:             rem          zero, a6, tp
                  c.li         ra, 15
                  c.lui        a0, 30
                  mulhu        gp, s5, a3
                  c.addi       s2, -1
                  srai         a4, a0, 22
                  c.addi       s8, 16
                  bltu         a4, s0, 1091f
                  c.srli       a1, 28
                  c.add        t6, gp
                  ori          t5, s7, -645
                  or           s8, a4, t2
                  mulh         ra, tp, s5
                  nop
                  lui          s8, 440600
                  bge          s0, a2, 1102f
1091:             or           t0, t2, a0
                  c.andi       a4, 3
                  bgeu         gp, t4, 1104f
                  slli         s9, tp, 4
                  mulh         s9, t2, t4
                  mul          a2, a2, t3
                  bltu         s9, t0, 1113f
                  c.addi4spn   a0, sp, 784
                  blt          zero, s8, 1110f
                  c.addi16sp   sp, -16
                  lui          a6, 37234
1102:             divu         a3, s0, s4
                  c.srli       a2, 4
1104:             nop
                  srl          s0, t0, a6
                  c.addi       t5, -1
                  c.nop
                  srai         s2, t1, 26
                  c.sub        a1, a5
1110:             and          sp, ra, a0
                  div          t1, s0, a6
                  c.lui        tp, 28
1113:             bge          gp, gp, 1130f
                  bne          ra, a0, 1132f
                  slti         s1, a7, -903
                  addi         t6, s2, -1729
                  mulh         s8, t0, tp
                  c.li         s3, 28
                  c.addi16sp   sp, -16
                  c.addi       t5, -1
                  sll          t3, tp, s11
                  ori          zero, s8, 1628
                  sra          s3, a7, gp
                  srai         ra, t0, 6
                  bgeu         gp, s10, 1126f
1126:             c.sub        a2, s1
                  xor          a0, ra, t0
                  div          s10, t2, a2
                  mulhsu       t5, s11, t3
1130:             c.and        a4, a5
                  c.sub        a0, s0
1132:             c.sub        s1, s1
                  c.srli       a4, 28
                  c.or         a2, a5
                  c.srli       a4, 31
                  sltiu        a4, a0, -49
                  c.nop
                  c.lui        s1, 10
                  sltiu        gp, s9, -1007
                  sltiu        s0, a3, 164
                  c.or         a1, a0
                  rem          a3, s4, tp
                  srl          a0, a3, a7
                  bge          s5, a3, 1162f
                  srai         a3, a7, 14
                  bgeu         t4, s11, 1166f
                  slt          t0, t2, s9
                  mulhu        a1, t1, t4
                  sub          s1, a0, a7
                  c.xor        a1, a1
                  blt          t0, t4, 1152f
1152:             addi         t4, s10, -1020
                  addi         t0, t6, 137
                  c.nop
                  c.and        a0, s0
                  c.slli       s5, 15
                  c.beqz       a4, 1176f
                  sll          a4, t5, s7
                  c.xor        a1, s0
                  bltu         t4, a0, 1171f
                  mulh         s11, s10, a0
1162:             c.li         s5, 15
                  mulh         ra, a2, s3
                  bge          t6, s6, 1173f
                  c.mv         s5, a4
1166:             mulhu        a2, s0, t3
                  add          t4, s5, t3
                  mul          s11, s1, t0
                  ori          s11, s5, -1279
                  sltiu        a3, a3, -1521
1171:             bgeu         zero, a6, 1187f
                  sra          t2, zero, s1
1173:             c.addi       sp, 20
                  c.add        ra, a6
                  mulhu        s11, tp, zero
1176:             sltiu        a4, t2, 1704
                  andi         s9, a5, -1421
                  srai         a3, gp, 30
                  mulhsu       s3, s9, s6
                  c.andi       a3, -1
                  c.addi       s1, -1
                  ori          zero, s0, 15
                  slli         a0, s0, 19
                  lui          s9, 645469
                  c.andi       a2, 11
                  auipc        s0, 152645
1187:             xori         t3, s1, 157
                  c.srli       a4, 27
                  srl          zero, s0, a6
                  ori          s11, s4, -980
                  ori          t2, s9, -921
                  divu         a6, gp, tp
                  bltu         s6, t2, 1195f
                  beq          s7, s1, 1200f
1195:             slt          t3, t2, a3
                  beq          ra, a5, 1208f
                  srai         gp, s1, 4
                  c.and        a1, s0
                  sra          t6, tp, s4
1200:             c.addi       s5, -1
                  mulh         s1, s6, s9
                  c.lui        t6, 27
                  c.addi16sp   sp, -16
                  c.xor        a0, s0
                  div          t0, t2, s8
                  and          t5, s9, s0
                  sll          t1, s10, a3
1208:             c.slli       a0, 26
                  sub          t4, t1, s9
                  remu         t3, t4, t0
                  c.or         a2, a2
                  bge          tp, s1, 1232f
                  slti         gp, s0, -93
                  xori         t3, gp, -889
                  c.add        s3, gp
                  c.bnez       a0, 1232f
                  mul          t3, s5, t5
                  c.bnez       a3, 1235f
                  bgeu         a7, a7, 1228f
                  c.nop
                  sltiu        s11, s11, 1968
                  c.add        a2, s5
                  bge          t0, a6, 1239f
                  andi         s10, a0, 763
                  c.slli       t3, 28
                  remu         t5, s10, s3
                  c.add        t2, t3
1228:             xori         s4, s8, 389
                  bne          s5, s6, 1241f
                  c.srli       a1, 6
                  c.mv         s5, t5
1232:             mulhu        t4, s6, t4
                  sltu         a1, t2, a6
                  c.mv         t6, t3
1235:             c.lui        a0, 4
                  c.beqz       s0, 1246f
                  sltu         a4, s9, t4
                  auipc        t5, 982415
1239:             addi         a0, a5, 1
                  c.xor        a4, a1
1241:             c.nop
                  c.and        a3, a4
                  srli         s1, tp, 25
                  c.srli       a0, 19
                  rem          t0, a6, t6
1246:             sra          t2, gp, t4
                  c.mv         s0, a4
                  sra          t3, s11, s11
                  c.srli       a2, 6
                  bne          a6, t0, 1262f
                  xor          ra, s1, a5
                  c.addi       s8, 10
                  c.mv         s1, a3
                  c.addi4spn   s0, sp, 352
                  c.beqz       a0, 1268f
                  bltu         t2, t0, 1259f
                  sub          t4, a5, t1
                  divu         s6, a0, t4
1259:             rem          a3, tp, s0
                  c.srai       a0, 18
                  sll          s2, s0, a6
1262:             lui          s6, 344584
                  c.addi4spn   a3, sp, 352
                  mulhsu       a3, s1, s6
                  xori         s3, s8, -1963
                  or           s6, a7, s0
                  c.and        a1, s0
1268:             or           sp, s2, a5
                  mul          s11, t2, s5
                  bne          t4, a4, 1282f
                  srli         s1, t5, 29
                  divu         s8, s4, s6
                  c.mv         s0, t0
                  bltu         a2, a4, 1282f
                  mulh         t2, sp, a6
                  c.andi       s1, -1
                  nop
                  c.sub        a3, a0
                  c.or         s0, a0
                  srai         ra, s0, 12
                  la           a1, region_1+418 #start load_store_instr_stream_0
                  lhu          a2, -6(a1)
                  la           s2, region_1+1680 #start load_store_instr_stream_1
                  lhu          a6, 62(s2)
                  lb           t3, 2(a1)
                  sb           gp, -10(s2)
                  lb           s6, -10(a1)
                  lbu          zero, 17(s2)
                  lbu          s5, 1(a1)
                  lbu          s4, -19(s2)
                  sb           a5, 14(a1)
                  lb           s0, 46(s2) #end load_store_instr_stream_1
                  lbu          a4, 8(a1) #end load_store_instr_stream_0
                  bne          t5, a5, 1291f
1282:             mulhu        t6, t0, a0
                  slti         a3, a0, -846
                  bge          s8, s6, 1285f
1285:             c.xor        a3, a2
                  c.nop
                  slli         a4, a5, 19
                  auipc        tp, 687880
                  sltu         s10, a2, t1
                  c.mv         s6, a6
1291:             sra          s3, t3, s4
                  c.lui        s6, 30
                  bne          gp, t4, 1302f
                  c.addi4spn   a3, sp, 240
                  mulhu        s5, s9, sp
                  sltiu        t6, s7, 1527
                  ori          s9, s1, -1955
                  c.li         s8, 12
                  c.addi       s10, 14
                  bltu         a0, gp, 1302f
                  and          s3, a3, a7
1302:             c.bnez       s0, 1315f
                  c.and        a1, a3
                  c.sub        a4, a0
                  xor          a3, ra, s11
                  c.srai       s1, 26
                  auipc        a4, 842247
                  mulh         s9, gp, s0
                  bge          t2, a6, 1314f
                  mul          t5, a3, a2
                  div          s3, a4, t0
                  c.sub        a1, a1
                  sltiu        s0, t0, -1077
1314:             sll          s4, s9, s5
1315:             sub          t3, a3, t5
                  mulhsu       t2, s3, s2
                  srai         s2, tp, 10
                  c.or         s0, a0
                  rem          s3, s7, s10
                  c.srai       a3, 25
                  c.lui        s4, 3
                  sra          a6, sp, t3
                  or           tp, a6, t6
                  c.srli       s0, 13
                  c.addi       s8, -1
                  c.xor        a0, a5
                  rem          a6, a3, t2
                  c.add        t3, s9
                  addi         s3, a4, 1616
                  nop
                  c.srli       s1, 5
                  c.addi       s6, 15
                  c.or         s0, a2
                  lui          s4, 311916
                  andi         s9, sp, -519
                  rem          ra, s8, t2
                  and          ra, a4, s0
                  or           t6, t6, a6
                  c.addi       a1, 27
                  c.and        a2, a2
                  slti         s0, a0, -417
                  sltu         t2, s6, a3
                  or           s8, s5, a7
                  andi         t6, t4, -714
                  mulhu        t1, t5, a5
                  bltu         s8, a7, 1360f
                  auipc        s3, 733104
                  divu         sp, a2, zero
                  andi         s9, a7, -261
                  rem          sp, s2, s6
                  addi         t3, t2, -52
                  xori         s6, s11, -439
                  or           gp, t3, s10
                  andi         a3, s1, 1711
                  bltu         ra, s4, 1362f
                  bge          s1, s3, 1374f
                  nop
                  mulh         t1, tp, t4
                  div          s10, a3, t4
1360:             c.addi4spn   a3, sp, 816
                  c.mv         a1, t4
1362:             slli         t5, s3, 6
                  addi         gp, zero, -772
                  c.srli       s1, 29
                  c.srli       a0, 10
                  c.srli       a4, 16
                  c.srai       a0, 4
                  slt          s3, s0, a0
                  mulh         t0, a3, gp
                  c.li         s0, 16
                  bne          ra, t1, 1382f
                  slti         t1, a7, -371
                  c.srli       a2, 11
1374:             sltiu        t6, s8, 385
                  bge          sp, s1, 1376f
1376:             mulh         s3, s7, t6
                  mulhu        s8, a1, t6
                  srai         s11, a6, 2
                  div          s11, t4, a1
                  c.addi4spn   a0, sp, 688
                  srai         s9, s10, 7
1382:             nop
                  mul          a2, a2, t1
                  and          s3, t2, a6
                  rem          tp, t1, a4
                  c.add        t6, a2
                  c.li         sp, 26
                  or           t6, t1, s2
                  andi         s11, gp, -1064
                  bge          s4, t1, 1404f
                  bne          ra, s3, 1402f
                  remu         s5, a7, tp
                  c.addi4spn   a3, sp, 448
                  mul          t0, s11, s9
                  c.sub        a1, a4
                  sll          s9, s1, s10
                  mulhsu       a4, s5, s0
                  c.addi       a3, -1
                  c.addi       a4, 18
                  c.addi4spn   s1, sp, 208
                  divu         t4, s8, s9
1402:             srli         s11, a1, 8
                  blt          tp, a2, 1409f
1404:             beq          a5, s2, 1422f
                  c.or         a0, a4
                  srli         t1, a4, 19
                  sub          s11, s1, t5
                  slt          s10, s4, t2
1409:             lui          sp, 108698
                  c.sub        a4, a0
                  addi         ra, s9, -862
                  rem          s11, t4, t4
                  c.mv         a2, a0
                  c.srai       a3, 21
                  auipc        t6, 681739
                  andi         t1, t3, 473
                  c.slli       s0, 11
                  c.and        s0, s1
                  c.or         a3, a0
                  slti         s11, s0, 867
                  c.addi16sp   sp, -16
1422:             c.add        t3, s1
                  c.xor        a0, a2
                  c.or         s1, a4
                  c.srai       s1, 30
                  srai         sp, s5, 31
                  auipc        s10, 400430
                  sltu         ra, t2, t3
                  bltu         s3, ra, 1448f
                  auipc        tp, 585091
                  sll          t5, a2, ra
                  slli         s11, t1, 13
                  mulh         a6, zero, a5
                  mulh         t2, t2, s8
                  c.srli       s1, 16
                  c.srai       a0, 27
                  sltu         gp, sp, s11
                  c.sub        a4, a4
                  divu         t0, zero, t2
                  divu         t6, s6, t2
                  div          s3, s1, a7
                  sltiu        s9, a2, -1198
                  c.or         a2, a0
                  divu         s8, tp, t4
                  slt          a0, a4, s11
                  mul          s0, t5, s2
                  srl          a2, t3, s2
1448:             remu         a0, t6, a6
                  slt          a6, s9, t1
                  ori          t4, a7, -1356
                  add          t1, a0, t1
                  sll          s1, a7, ra
                  c.sub        s0, a2
                  c.sub        s0, a0
                  c.li         ra, -1
                  c.addi       t1, 7
                  c.srli       a4, 9
                  c.nop
                  srl          sp, a3, s1
                  c.sub        s1, a0
                  c.bnez       a1, 1472f
                  slli         s10, t0, 28
                  lui          s8, 554925
                  c.lui        s4, 19
                  div          s9, zero, s5
                  srai         a4, t0, 3
                  slli         zero, sp, 0
                  remu         s1, s6, s7
                  divu         s2, s3, s10
                  c.andi       s0, -1
                  sll          ra, t5, s10
1472:             sub          s5, a0, t0
                  srai         t4, s10, 19
                  rem          s4, zero, s1
                  rem          t6, a4, s7
                  or           s1, gp, s8
                  xori         s0, s6, -80
                  c.addi4spn   a1, sp, 496
                  mul          t0, s3, sp
                  c.lui        tp, 9
                  c.add        s5, t6
                  beq          a3, zero, 1484f
                  c.bnez       s0, 1500f
1484:             mulh         ra, s0, tp
                  sll          s3, sp, s6
                  c.nop
                  c.or         a0, s1
                  blt          t4, s10, 1495f
                  and          s4, s10, a0
                  c.andi       a4, 25
                  slti         t0, s7, -1199
                  sll          t3, s10, t6
                  c.addi       a6, -1
                  c.addi       t2, -1
1495:             divu         a6, s7, ra
                  xori         a4, a6, -601
                  bgeu         a6, s11, 1511f
                  slt          tp, gp, gp
                  mul          t4, t1, sp
1500:             add          s2, s8, zero
                  c.lui        a6, 7
                  c.sub        a3, a5
                  mulhsu       s11, s3, a3
                  c.bnez       a1, 1505f
1505:             mulhu        s10, a6, zero
                  c.or         s0, a4
                  c.add        a6, a4
                  sll          ra, s3, a1
                  sub          t0, gp, t6
                  c.or         a4, a2
1511:             mulh         s1, s5, tp
                  auipc        a6, 536418
                  and          ra, s1, a0
                  c.andi       s1, 5
                  c.mv         gp, s9
                  auipc        s1, 690023
                  c.and        a1, a1
                  bgeu         s4, s3, 1534f
                  sll          a0, a4, s3
                  c.addi16sp   sp, 144
                  remu         s4, s7, t4
                  sra          a3, t2, gp
                  srli         sp, t3, 26
                  srai         s6, zero, 29
                  c.addi4spn   a0, sp, 672
                  bge          s9, a0, 1542f
                  rem          t4, a3, t5
                  div          s3, t5, s1
                  mulhu        t3, t1, a0
                  bge          s4, t2, 1539f
                  srli         a1, s3, 13
                  auipc        s3, 86479
                  c.lui        s10, 31
1534:             mulhu        zero, s6, t4
                  c.sub        a3, s1
                  addi         t6, tp, -1002
                  srli         s8, s0, 28
                  xori         a1, s0, -40
1539:             c.bnez       a2, 1559f
                  c.sub        s1, s1
                  c.srai       a0, 22
1542:             sub          tp, a3, gp
                  sltiu        t4, t4, 253
                  c.srai       a4, 10
                  nop
                  mul          t6, t4, a7
                  c.and        a2, a4
                  xor          s0, ra, zero
                  c.xor        a3, a4
                  sra          s3, gp, s4
                  mulhu        s8, gp, zero
                  xori         a4, s3, 1391
                  c.andi       s0, -1
                  rem          zero, t0, a3
                  beq          a3, s6, 1567f
                  beq          a6, tp, 1575f
                  sub          t3, t1, zero
                  c.li         s3, 4
1559:             sub          s11, a1, t3
                  c.mv         ra, a3
                  sll          a1, s11, s0
                  add          a1, a5, s10
                  c.slli       s9, 19
                  bltu         sp, t6, 1577f
                  c.nop
                  bgeu         s0, s0, 1569f
1567:             or           a6, a3, s4
                  srl          a6, s4, a3
1569:             ori          s8, a6, -417
                  add          s4, a4, s11
                  c.lui        s8, 3
                  c.srli       a1, 7
                  c.bnez       s0, 1577f
                  c.li         tp, -1
1575:             c.sub        s0, a4
                  beq          s1, a1, 1577f
1577:             remu         s2, a6, gp
                  c.srai       a1, 20
                  mul          t1, sp, s5
                  sra          t4, s6, a5
                  lw           ra, 4(a5)
                  sub          s4, t1, zero
                  auipc        a6, 526259
                  c.andi       a2, 3
                  addi         a5, a5, 16
                  c.slli       tp, 17
2749:             addi x26, x1, 0
2749:             jalr x26, x26, 0
sub_3:            sra          s6, a2, a0
                  mulhsu       t2, s1, a0
                  remu         t2, ra, s10
                  addi         a5, a5, -44
                  slli         s1, a3, 21
                  sltu         s3, s0, zero
                  xor          t5, s2, tp
                  sw           ra, 4(a5)
                  srli         a4, a3, 20
                  srai         a3, ra, 21
                  c.addi       a0, 27
                  sra          t1, s10, t4
                  divu         tp, a4, a7
                  sra          t5, sp, t0
                  divu         t5, t3, s9
                  c.xor        a0, a0
                  beq          a0, s10, 12f
                  sltu         s2, s4, gp
                  c.bnez       a3, 12f
                  c.srai       a0, 27
                  c.beqz       a3, 12f
                  c.lui        s11, 6
                  sltiu        s1, t0, 1263
12:               lui          s2, 739728
                  lw           ra, 4(a5)
                  rem          t5, s1, gp
                  or           t0, a0, a7
                  c.and        a2, a3
                  c.mv         s4, t6
                  mulhsu       s4, a5, s4
                  c.sub        s1, s0
                  addi         a5, a5, 44
                  rem          sp, s3, zero
33:               addi x8, x1, 0
33:               c.jalr x8
sub_4:            c.mv         s1, gp
                  sub          a3, t5, a7
                  sltu         t4, t2, s6
                  c.or         a4, s0
                  lui          s10, 595302
                  addi         a5, a5, -40
                  c.addi4spn   s0, sp, 352
                  sw           ra, 4(a5)
                  c.xor        a1, a4
                  c.srli       a4, 8
                  add          t4, a6, a3
                  lui          zero, 136171
                  la           s3, region_0+1990 #start load_store_instr_stream_2
                  la           t1, region_0+236 #start load_store_instr_stream_1
                  la           t0, region_0+335 #start load_store_instr_stream_0
                  lbu          s6, 568(t0)
                  sh           sp, -236(s3)
                  lw           t6, 596(t1)
                  lbu          s4, -140(t1)
                  lhu          s10, 1381(t0)
                  lbu          s5, 1(s3)
                  sh           gp, -311(t0)
                  sb           t6, 506(t1)
                  sb           s3, -167(s3)
                  lbu          ra, -148(s3)
                  sb           a1, -151(s3)
                  lhu          a1, 1127(t0)
                  lbu          t5, -150(s3)
                  sb           a7, -204(s3)
                  sb           s9, -65(t1)
                  lb           gp, -76(s3)
                  lb           tp, 249(t0)
                  lb           t5, 234(t0)
                  lb           s8, -255(s3) #end load_store_instr_stream_2
                  lb           zero, 1615(t1)
                  lb           sp, 601(t0)
                  lbu          t3, 333(t1) #end load_store_instr_stream_1
                  lb           s4, 783(t0) #end load_store_instr_stream_0
                  la           sp, region_0+1247 #start riscv_load_store_rand_instr_stream_1
                  lbu          s4, -42(sp)
                  ori          t2, sp, 553
                  add          s8, a7, a4
                  divu         t1, s8, s0
                  sb           t2, -1171(sp)
                  lb           s9, -156(sp)
                  c.sub        a2, a4
                  mul          t2, t5, a0
                  sra          s3, t1, zero
                  c.mv         t0, s0
                  xor          t3, t0, t0
                  div          s1, s1, t3
                  lbu          s0, 422(sp)
                  xori         a3, s10, 630
                  c.xor        a0, a2
                  lw           a3, -919(sp)
                  lbu          a0, -268(sp)
                  xor          s11, s9, a3
                  srai         a1, a2, 18
                  lui          t4, 322897
                  c.and        a1, a4
                  c.xor        a3, a5
                  lhu          a3, 471(sp)
                  remu         t0, s3, a3
                  sb           a2, 255(sp)
                  xori         t5, a6, -1576
                  c.andi       a2, 27
                  mulhsu       s2, sp, t4
                  and          ra, s7, s4
                  lbu          gp, 716(sp)
                  mul          ra, tp, t2
                  sh           s1, -747(sp)
                  lbu          t1, 558(sp)
                  and          s2, s10, s7
                  lb           a0, -213(sp) #end riscv_load_store_rand_instr_stream_1
                  la           s8, region_0+333 #start riscv_hazard_instr_stream_2
                  c.srli       s0, 3
                  ori          gp, sp, -531
                  c.addi4spn   s0, sp, 400
                  lb           s3, -41(s8)
                  c.xor        s0, s0
                  lbu          s9, -51(s8)
                  xori         s9, sp, -1789
                  srli         s9, s9, 19
                  c.lui        s9, 26
                  sb           s0, -60(s8)
                  lbu          s3, -45(s8)
                  addi         s5, s5, -1681
                  c.mv         s0, s3
                  c.xor        s0, s0
                  lbu          s0, 6(s8)
                  sb           gp, -64(s8)
                  xori         s0, s9, 1593
                  lb           s9, 50(s8)
                  lbu          s0, -34(s8)
                  mulh         s0, sp, sp
                  sb           s9, -32(s8)
                  lw           sp, 3(s8)
                  mulhsu       s5, s9, s0
                  lhu          s9, -43(s8)
                  lb           s5, 38(s8)
                  nop
                  lhu          s0, -57(s8)
                  lb           s5, -4(s8)
                  sb           sp, 35(s8)
                  lb           sp, 51(s8)
                  andi         s3, s9, -1900
                  lbu          s9, -10(s8)
                  sb           s0, -26(s8)
                  lb           gp, 30(s8)
                  divu         s9, s9, gp
                  c.sub        s0, s0
                  lbu          s9, 57(s8)
                  c.add        s5, sp
                  c.lui        gp, 15
                  srli         s5, s9, 2
                  lbu          sp, -53(s8)
                  lb           s5, -34(s8)
                  lbu          s3, 14(s8)
                  sh           sp, 49(s8)
                  lb           s5, 48(s8)
                  sh           s3, -55(s8)
                  lb           s9, 8(s8)
                  mulhsu       sp, s9, s0
                  lbu          s0, 46(s8)
                  c.or         s0, s0
                  mulh         s0, s9, s9
                  lb           s9, -20(s8)
                  remu         s3, s0, s0
                  lh           s9, 51(s8) #end riscv_hazard_instr_stream_2
                  addi         sp, zero, 4 #init loop 1 counter
                  addi         s6, zero, 4 #init loop 1 limit
                  slt          t2, s1, s7
                  c.andi       s1, 29
sub_4_34_1_t:     mulh         t3, s2, s11
                  addi         sp, sp, -3 #update loop 1 counter
                  c.andi       a3, -1
                  addi         a2, zero, -10 #init loop 0 counter
                  srl          t2, s2, t1
                  addi         zero, zero, 0 #init loop 0 limit
sub_4_34_0_t:     sub          a3, s4, t1
                  addi         a2, a2, 10 #update loop 0 counter
                  srli         t3, a0, 22
                  c.beqz       a2, sub_4_34_0_t #branch for loop 0
                  bgeu         sp, s6, sub_4_34_1_t #branch for loop 1
                  c.slli       s5, 5
                  la           sp, region_1+1193 #start riscv_hazard_instr_stream_3
                  and          t6, a2, s1
                  sw           a2, 35(sp)
                  nop
                  sb           t6, -20(sp)
                  c.andi       a2, 6
                  sw           s11, 59(sp)
                  lb           a2, 23(sp)
                  lbu          t6, -50(sp)
                  c.addi       t5, 30
                  sh           t5, 1(sp)
                  andi         s11, s1, -1224
                  lb           s1, 50(sp)
                  sra          t5, t5, t5
                  srl          s11, t5, t6
                  remu         t6, s1, s11
                  lbu          s1, -8(sp)
                  mul          t6, s6, t5
                  sb           s1, 10(sp)
                  lhu          s1, 47(sp)
                  lbu          s1, -52(sp)
                  lb           s1, 44(sp)
                  ori          t5, s1, -1962
                  lb           t5, -11(sp)
                  lbu          t5, 52(sp)
                  lb           s1, -22(sp)
                  slt          t6, t5, s1
                  div          s6, t5, s1
                  lhu          s6, -35(sp)
                  c.srli       a2, 27
                  lb           t5, 40(sp)
                  xori         a2, s11, 1652
                  mul          t5, s6, t6
                  lhu          s1, 35(sp)
                  lb           a2, -5(sp)
                  lh           a2, 59(sp)
                  sb           a2, 0(sp)
                  auipc        a2, 986777
                  c.slli       t5, 9
                  lb           s1, -28(sp) #end riscv_hazard_instr_stream_3
                  la           t2, amo_0+48 #start riscv_amo_instr_stream_3
                  la           s6, amo_0+40
                  ori          t1, a3, -963
                  amomax.w.rl   s8, a3, (s6)
                  ori          s11, t4, -1077
                  srli         a2, a7, 11
                  amominu.w     a2, s1, (t2)
                  amoor.w       s1, a7, (s6) #end riscv_amo_instr_stream_3
sub_4_15:         jal          ra, 12f
0:                c.j          21f
1:                c.jal        20f
2:                c.j          9f
3:                c.j          18f
4:                jal          a3, 1b
5:                c.jal        7f
6:                c.j          19f
7:                c.j          22f
8:                c.j          13f
9:                c.j          14f
10:               jal          ra, 16f
11:               jal          ra, 23f
12:               c.j          15f
13:               c.jal        25f
14:               jal          ra, 10b
15:               c.jal        11b
16:               c.jal        26f
17:               c.j          24f
18:               c.jal        2b
19:               c.jal        3b
20:               c.jal        28f
21:               c.j          5b
22:               c.jal        17b
23:               jal          ra, 27f
24:               jal          ra, 6b
25:               c.j          0b
26:               c.j          4b
27:               jal          ra, 8b
28:               or           zero, s9, gp
sub_4_13:         jal          ra, 1f
0:                jal          s5, 6f
1:                c.j          11f
2:                c.j          13f
3:                c.j          15f
4:                c.jal        7f
5:                jal          ra, 17f
6:                c.j          2b
7:                jal          s8, 3b
8:                jal          ra, 0b
9:                jal          ra, 10f
10:               c.jal        8b
11:               jal          t1, 5b
12:               jal          ra, 21f
13:               jal          ra, 20f
14:               c.j          18f
15:               c.j          19f
16:               jal          ra, 4b
17:               jal          ra, 16b
18:               c.jal        12b
19:               c.j          9b
20:               c.jal        14b
21:               ori          gp, s5, 158
sub_4_14:         jal          ra, 4f
0:                c.j          7f
1:                jal          ra, 12f
2:                c.jal        9f
3:                c.jal        15f
4:                jal          ra, 1b
5:                jal          ra, 14f
6:                c.jal        0b
7:                jal          ra, 5b
8:                c.j          10f
9:                c.jal        8b
10:               c.jal        13f
11:               c.j          3b
12:               c.j          6b
13:               c.j          11b
14:               jal          s0, 2b
15:               c.j          16f
16:               c.srai       a1, 23
                  la           ra, region_1+1008 #start riscv_load_store_rand_instr_stream_2
                  lw           s2, -832(ra)
                  nop
                  sb           s7, 231(ra)
                  mulh         a3, a1, s10
                  lb           a6, 89(ra)
                  c.addi16sp   sp, -16
                  srli         s1, s6, 2
                  lbu          s10, -266(ra)
                  slli         zero, s5, 18
                  c.addi4spn   a4, sp, 240
                  lh           a1, -240(ra)
                  sll          s9, zero, s2
                  lbu          s10, 205(ra)
                  sh           a0, -240(ra)
                  lbu          s9, -54(ra)
                  div          s8, a4, ra
                  c.xor        a3, s1
                  rem          s4, tp, ra
                  c.addi16sp   sp, 272
                  c.srli       s1, 11
                  sw           ra, 384(ra)
                  c.sub        s1, s0
                  sb           sp, 501(ra)
                  srai         t2, s6, 14
                  mulh         a1, s11, a4
                  c.mv         s1, a2
                  and          s1, s0, t5
                  c.lui        tp, 24
                  c.srli       a3, 8
                  lbu          t4, 534(ra)
                  sb           s4, -185(ra)
                  c.addi4spn   a3, sp, 192
                  sw           a3, -716(ra)
                  lh           s3, -688(ra)
                  lbu          s1, -637(ra)
                  c.li         s4, -1
                  c.and        a0, s0
                  c.addi4spn   a4, sp, 64
                  sb           ra, 361(ra) #end riscv_load_store_rand_instr_stream_2
                  la           s8, region_1+1549 #start riscv_load_store_rand_instr_stream_0
                  lbu          t6, 24(s8)
                  sb           a3, -54(s8)
                  sb           s6, 2(s8)
                  mul          zero, ra, a1
                  srai         s10, s0, 2
                  c.nop
                  lbu          t1, 36(s8)
                  sh           t1, -41(s8)
                  srli         gp, a3, 26
                  sb           tp, 62(s8)
                  c.sub        a3, a3
                  c.addi       s0, 10
                  addi         s2, s9, 556
                  divu         a1, t6, ra
                  lbu          a6, 64(s8)
                  lhu          a4, -5(s8)
                  sh           s4, 5(s8)
                  xori         a1, a7, -1867
                  xori         s1, s10, -1221
                  lbu          sp, 34(s8)
                  lb           s11, 9(s8)
                  srli         s4, t2, 24
                  lb           s1, 21(s8)
                  lbu          zero, -36(s8)
                  c.srli       a2, 8
                  c.addi       a4, 14
                  c.addi4spn   a0, sp, 688
                  lb           sp, -59(s8)
                  c.slli       a3, 10
                  sub          t2, s5, a6
                  lbu          a0, -29(s8)
                  lb           s2, 37(s8)
                  sb           ra, -11(s8)
                  add          sp, gp, a6
                  divu         s3, t0, s3
                  div          s10, s5, a1
                  c.or         a2, a2
                  sw           s11, 31(s8)
                  lhu          s2, -19(s8) #end riscv_load_store_rand_instr_stream_0
                  la           t6, region_1+1728 #start riscv_hazard_instr_stream_6
                  lb           s1, -41(t6)
                  lh           t4, -38(t6)
                  remu         s1, a1, a1
                  c.mv         t4, a1
                  srl          s1, s4, zero
                  lbu          t4, -62(t6)
                  c.lui        t4, 8
                  slli         s4, s4, 5
                  lb           t4, 18(t6)
                  lhu          t4, 60(t6)
                  rem          s1, t1, s4
                  mulh         s4, t1, s4
                  auipc        zero, 862315
                  c.lui        s1, 11
                  c.and        s1, a1
                  lw           t1, 56(t6)
                  c.mv         t4, t4
                  sltiu        t4, t1, 1931
                  lb           s4, 33(t6)
                  lhu          t1, 56(t6)
                  sb           s4, -63(t6)
                  c.srai       a1, 28
                  sh           t1, 64(t6)
                  sltu         s1, t4, zero
                  lb           s4, -15(t6)
                  sh           zero, 40(t6)
                  c.mv         t1, s4
                  c.and        a1, s1
                  lb           s4, -23(t6)
                  and          s4, t1, s4
                  sb           a1, 36(t6)
                  sll          t1, s4, t1
                  lui          zero, 51241
                  lbu          s4, 62(t6)
                  slti         t4, s1, -1137
                  c.xor        s1, a1
                  lbu          a1, -39(t6)
                  sb           a1, 42(t6)
                  sb           a1, 49(t6) #end riscv_hazard_instr_stream_6
                  la           s8, region_1+994 #start load_store_instr_stream_3
                  lbu          gp, 199(s8)
                  la           t3, region_1+1127 #start load_store_instr_stream_2
                  la           s1, region_1+77 #start load_store_instr_stream_0
                  sb           s6, -63(s1)
                  lb           zero, 225(s8)
                  la           s6, region_1+4 #start load_store_instr_stream_4
                  lbu          s5, 20(s6)
                  la           t6, region_1+746 #start load_store_instr_stream_1
                  sb           tp, 12(s1)
                  lb           a0, 12(t6)
                  lhu          s4, -7(s1)
                  lh           a2, 10(t6)
                  lhu          s9, -11(t3)
                  sb           s6, -52(s8)
                  lh           t2, 33(s1)
                  lh           a2, -15(t3)
                  lb           t4, -8(t3)
                  sh           s2, -2(t6)
                  lbu          s3, 4(t3)
                  lbu          a0, 24(s6)
                  lb           a1, 9(s6)
                  sh           t0, -16(t6)
                  sh           t5, -3(t3)
                  lb           t4, 10(s6)
                  sb           s7, 12(t3)
                  sb           s5, 26(s6) #end load_store_instr_stream_4
                  lb           s0, 145(s8)
                  lh           gp, -4(t6)
                  sb           t5, -26(s1)
                  lbu          ra, -3(t3)
                  lb           s5, 3(t6)
                  lb           s11, -46(s1)
                  lbu          t0, 16(t3)
                  lbu          a0, 1(t3)
                  lw           t4, 74(s8) #end load_store_instr_stream_3
                  lbu          s2, 8(t3) #end load_store_instr_stream_2
                  lb           a3, -3(t6) #end load_store_instr_stream_1
                  sb           s10, 44(s1) #end load_store_instr_stream_0
sub_4_17:         jal          ra, 15f
0:                c.jal        17f
1:                jal          t1, 2f
2:                jal          ra, 0b
3:                c.j          11f
4:                c.jal        8f
5:                jal          ra, 16f
6:                c.j          14f
7:                c.jal        9f
8:                c.j          10f
9:                c.j          5b
10:               c.jal        3b
11:               jal          t1, 7b
12:               jal          t1, 6b
13:               c.j          1b
14:               c.jal        13b
15:               c.jal        4b
16:               c.jal        12b
17:               mulhsu       s9, ra, t4
                  la           s6, amo_0+40 #start riscv_amo_instr_stream_2
                  la           t0, amo_0+44
                  la           t2, amo_0+60
                  amomaxu.w.aq  s4, a0, (t2)
                  amoor.w.rl    t5, s4, (t2)
                  amominu.w.aq  s2, s7, (s6) #end riscv_amo_instr_stream_2
                  la           s6, amo_0+12 #start riscv_amo_instr_stream_4
                  la           t2, amo_0+0
                  la           a3, amo_0+24
                  la           t0, amo_0+8
                  amominu.w     a2, t4, (t2)
                  amoadd.w.aq   t5, s8, (t2)
                  amomaxu.w.rl  gp, a1, (s6)
                  amomin.w.rl   s10, s9, (s6)
                  amomaxu.w     s8, s6, (a3)
                  amominu.w.aq  gp, t5, (s6)
                  amoand.w.aq   s3, a0, (t2)
                  amoxor.w      gp, s2, (t2)
                  amoor.w       s8, ra, (t0)
                  amoadd.w      s2, s5, (s6) #end riscv_amo_instr_stream_4
                  la           s9, region_1+1908 #start load_store_instr_stream_1
                  sb           a7, -461(s9)
                  lhu          t0, -1748(s9)
                  la           s6, region_1+1040 #start load_store_instr_stream_0
                  lh           t3, -454(s9)
                  sb           a0, 767(s6)
                  lb           s5, -713(s9)
                  sb           s0, 387(s6)
                  lhu          a1, -690(s9)
                  la           t4, region_1+851 #start load_store_instr_stream_2
                  lb           s4, 808(s6)
                  sb           s9, 116(t4)
                  lbu          tp, 159(t4)
                  lb           a2, 775(s6)
                  lbu          t5, -684(s9)
                  sh           s9, 430(s6)
                  lbu          t0, -83(t4)
                  lbu          t2, -1731(s9)
                  lbu          a4, 527(s6)
                  lw           a3, -135(t4)
                  sb           ra, 39(t4)
                  lbu          t5, -747(s9)
                  lh           a4, -318(s6)
                  sb           a0, -680(s9)
                  sb           s6, -132(t4) #end load_store_instr_stream_2
                  sh           s3, -1210(s9) #end load_store_instr_stream_1
                  lb           zero, -89(s6) #end load_store_instr_stream_0
                  la           s4, amo_0+52 #start riscv_amo_instr_stream_1
                  amomax.w.aq   a6, tp, (s4) #end riscv_amo_instr_stream_1
                  la           a3, region_0+1174 #start load_store_instr_stream_1
                  lbu          s8, 63(a3)
                  sb           gp, 35(a3)
                  la           t0, region_1+342 #start load_store_instr_stream_0
                  lbu          s0, -12(t0)
                  lbu          sp, 50(t0)
                  lb           s6, 123(a3)
                  lb           s3, 41(t0)
                  lhu          a1, 88(a3)
                  sb           t2, -16(t0)
                  lh           a4, 56(t0)
                  lbu          t2, 160(a3)
                  lbu          s0, 139(a3)
                  lb           s3, -168(a3) #end load_store_instr_stream_1
                  lw           t2, -34(t0)
                  sb           a7, -51(t0)
                  sh           gp, -48(t0) #end load_store_instr_stream_0
                  la           a1, region_0+289 #start load_store_instr_stream_1
                  lh           t1, 1259(a1)
                  la           s0, region_1+1100 #start load_store_instr_stream_0
                  lw           zero, 231(a1)
                  lh           t0, -6(s0)
                  lb           s2, -14(s0)
                  sh           a5, -14(s0)
                  sb           a1, 12(a1)
                  sh           s7, -14(s0)
                  lbu          a0, 1302(a1)
                  lb           a2, -8(s0)
                  sh           a4, 1521(a1)
                  lb           gp, -1(s0)
                  lh           a6, -125(a1) #end load_store_instr_stream_1
                  sb           t5, 8(s0) #end load_store_instr_stream_0
                  la           s2, region_1+391 #start riscv_hazard_instr_stream_1
                  slli         t4, s3, 1
                  addi         s4, a4, 382
                  c.addi       t4, 27
                  slli         t0, s4, 8
                  lb           s3, 12(s2)
                  lbu          ra, -13(s2)
                  c.slli       ra, 6
                  c.srai       a4, 9
                  or           t4, t4, t0
                  addi         t4, t4, -823
                  sra          s4, a4, s4
                  add          s3, a4, t0
                  lbu          s3, 6(s2)
                  lb           t0, -30(s2)
                  lbu          s4, 30(s2)
                  div          a4, t4, a4
                  sb           t0, -13(s2)
                  and          t4, ra, t4
                  ori          a4, ra, -312
                  lbu          s4, 31(s2)
                  sb           a4, -58(s2)
                  sra          t0, ra, s3
                  sh           t0, 15(s2)
                  lw           t4, 61(s2)
                  c.slli       t0, 10
                  mul          s4, s4, t4
                  sb           s3, -53(s2)
                  lb           t4, 49(s2)
                  xori         s3, ra, 392
                  sb           t4, -35(s2)
                  sw           ra, 13(s2)
                  lbu          s3, -53(s2)
                  addi         s4, ra, -120
                  c.slli       t0, 13
                  sb           s3, -14(s2)
                  c.sub        a4, a4
                  c.lui        s3, 30
                  sltiu        s3, s4, -27
                  add          s4, s3, t4
                  lbu          t4, -62(s2)
                  nop
                  c.sub        a4, a4
                  sw           s3, 37(s2)
                  lb           a4, 58(s2)
                  c.srli       a4, 9
                  sb           s4, 54(s2)
                  lh           t0, -63(s2)
                  lbu          a4, 49(s2)
                  sb           a4, 56(s2) #end riscv_hazard_instr_stream_1
                  la           ra, region_1+330 #start riscv_load_store_rand_instr_stream_5
                  c.li         s4, -1
                  andi         a0, zero, -1555
                  c.lui        s1, 29
                  lbu          s11, 197(ra)
                  lh           sp, 170(ra)
                  lbu          t6, -151(ra)
                  rem          s9, t1, s6
                  lh           s0, -88(ra)
                  c.srli       s0, 9
                  c.sub        s0, a4
                  slli         a6, a6, 18
                  sh           s3, -168(ra)
                  lb           t2, 77(ra)
                  mulh         tp, t4, s6
                  sltiu        t6, t2, -1045
                  c.mv         s11, s4
                  addi         tp, a4, -1847
                  lhu          t4, -90(ra)
                  lb           t2, 55(ra)
                  mulhu        s5, t0, gp
                  sh           t1, 120(ra)
                  rem          s10, a1, s8
                  c.lui        t6, 15
                  remu         sp, t2, s8
                  srai         s3, s6, 12
                  mulhsu       s11, s3, s1
                  slt          t2, a7, ra
                  sb           s6, -141(ra)
                  sb           t5, -195(ra)
                  c.sub        a2, s0
                  or           t3, t1, a0
                  sb           gp, 119(ra)
                  sb           a6, -158(ra)
                  lb           t5, -77(ra)
                  sub          a1, s2, s8
                  sh           sp, 200(ra) #end riscv_load_store_rand_instr_stream_5
                  la           t2, region_0+546 #start load_store_instr_stream_0
                  la           a0, region_1+395 #start load_store_instr_stream_1
                  sw           s11, -114(t2)
                  lh           s9, 1409(a0)
                  lbu          s8, -83(a0)
                  lh           t6, 1310(t2)
                  sh           t6, 1173(a0)
                  lh           zero, 1290(t2)
                  lbu          a1, 1249(t2)
                  sh           s11, -197(a0)
                  lbu          s0, -95(t2)
                  lhu          s8, 1239(a0) #end load_store_instr_stream_1
                  sb           s0, -56(t2) #end load_store_instr_stream_0
                  la           s4, amo_0+40 #start riscv_amo_instr_stream_0
                  la           t2, amo_0+48
                  la           s9, amo_0+8
                  la           a3, amo_0+60
                  c.slli       a0, 14
                  amomin.w.aq   t0, tp, (t2)
                  amoxor.w.rl   s5, a2, (s9)
                  amomax.w.rl   s8, s5, (s9)
                  amominu.w.rl  s5, s9, (t2)
                  amoadd.w.rl   s11, a3, (s9)
                  slt          a4, t2, t0
                  andi         a1, s4, 155
                  ori          s2, gp, -1021
                  srl          t6, s5, ra
                  srai         t4, s8, 1
                  divu         s1, a0, s10
                  amoadd.w      a6, s11, (s9)
                  c.or         a4, s0
                  amomaxu.w     s6, ra, (s4)
                  amoxor.w.rl   a6, t0, (a3) #end riscv_amo_instr_stream_0
                  la           sp, region_1+511 #start riscv_load_store_hazard_instr_stream_5
                  slli         gp, a1, 11
                  remu         a1, gp, sp
                  lb           a2, -122(sp)
                  sb           t5, -122(sp)
                  mulhu        t3, s2, t6
                  lbu          s1, -122(sp)
                  lbu          a6, -122(sp)
                  lbu          a6, 1060(sp)
                  nop
                  sh           s7, 3(sp)
                  lbu          a0, 1242(sp)
                  lbu          s3, 458(sp)
                  lb           s10, 458(sp)
                  lb           t1, 458(sp) #end riscv_load_store_hazard_instr_stream_5
                  la           a2, region_0+305 #start riscv_load_store_hazard_instr_stream_6
                  sltiu        t5, s4, -632
                  lh           s2, -15(a2)
                  lhu          t1, -15(a2)
                  slli         t6, s8, 31
                  lb           a3, -15(a2)
                  lhu          t3, -15(a2)
                  lbu          sp, -15(a2)
                  lh           s5, -15(a2)
                  lb           ra, -26(a2)
                  srai         tp, s2, 0
                  lbu          a3, -26(a2)
                  srai         a6, s5, 1
                  c.add        a1, t3
                  lb           s5, -26(a2)
                  lui          s5, 508835
                  sh           t6, 35(a2)
                  lb           a1, 8(a2)
                  lb           a3, 8(a2)
                  lbu          s2, 8(a2)
                  lbu          a4, -4(a2)
                  lbu          t4, -4(a2)
                  lbu          s3, -4(a2) #end riscv_load_store_hazard_instr_stream_6
                  la           s3, region_0+835 #start load_store_instr_stream_2
                  lbu          gp, -14(s3)
                  la           s0, region_0+782 #start load_store_instr_stream_0
                  lbu          a0, -44(s3)
                  lbu          ra, 44(s3)
                  lbu          a1, 43(s0)
                  la           s4, region_0+1606 #start load_store_instr_stream_1
                  lbu          s11, 57(s4)
                  lb           s10, 36(s3)
                  sh           s0, 21(s3)
                  lb           t6, 28(s3)
                  lbu          t2, -35(s0)
                  lbu          zero, 63(s4)
                  lw           t5, -54(s0)
                  sb           s1, -17(s3)
                  lbu          ra, -33(s4)
                  lh           s10, -34(s0)
                  lb           s5, 54(s4)
                  lbu          t4, -51(s0)
                  lb           s11, 35(s0)
                  sb           t2, 3(s4)
                  sb           t0, -55(s4)
                  lb           a0, -32(s4)
                  sb           a4, 59(s4) #end load_store_instr_stream_1
                  lh           s9, -4(s0)
                  lh           t2, -15(s3) #end load_store_instr_stream_2
                  lb           s1, -33(s0) #end load_store_instr_stream_0
                  la           ra, region_0+1110 #start load_store_instr_stream_1
                  la           t4, region_0+1758 #start load_store_instr_stream_0
                  lbu          sp, 10(ra)
                  lbu          gp, -11(ra)
                  lhu          s1, -1406(t4)
                  sb           ra, -1(ra)
                  lhu          t5, -6(ra)
                  lbu          tp, -908(t4)
                  sb           zero, -6(ra)
                  lb           tp, -935(t4)
                  lb           s1, -1(ra)
                  sb           a5, 10(ra)
                  lbu          zero, 88(t4)
                  lb           s10, -13(ra) #end load_store_instr_stream_1
                  lh           s9, -1632(t4) #end load_store_instr_stream_0
sub_4_12:         jal          ra, 11f
0:                c.j          8f
1:                jal          ra, 6f
2:                c.j          7f
3:                c.j          1b
4:                c.jal        9f
5:                c.jal        2b
6:                jal          t5, 0b
7:                jal          ra, 4b
8:                c.jal        12f
9:                c.jal        10f
10:               jal          a0, 3b
11:               c.j          5b
12:               sll          s4, s1, a7
                  la           s1, region_0+1989 #start riscv_load_store_hazard_instr_stream_1
                  sh           a7, -195(s1)
                  lbu          s9, -195(s1)
                  sb           t5, -195(s1)
                  lb           ra, -195(s1)
                  lhu          a4, -195(s1)
                  c.addi16sp   sp, -16
                  sll          sp, t2, s8
                  lhu          s10, -195(s1)
                  sb           t4, -195(s1)
                  lh           s10, -195(s1)
                  sh           s4, -195(s1)
                  remu         t3, t2, gp
                  sh           t1, -195(s1)
                  lb           s6, -195(s1)
                  sh           t3, -195(s1)
                  lbu          a4, -195(s1)
                  lhu          t6, -195(s1)
                  lhu          t6, -195(s1)
                  lh           t1, -195(s1) #end riscv_load_store_hazard_instr_stream_1
                  la           gp, region_0+1653 #start riscv_load_store_rand_instr_stream_4
                  lbu          t0, 1(gp)
                  sw           s11, -5(gp)
                  sw           t4, 15(gp)
                  lb           s5, 8(gp)
                  sltiu        t2, t6, -1600
                  lhu          s11, 1(gp)
                  c.or         s0, a2
                  lbu          a4, 6(gp)
                  lbu          ra, 12(gp)
                  slti         t4, a6, 1293
                  c.lui        t4, 5
                  lb           s3, -3(gp)
                  lb           s11, 14(gp)
                  ori          t2, s10, -589
                  lbu          s6, 10(gp)
                  or           s11, a1, s10
                  sw           gp, -1(gp)
                  lbu          a3, -6(gp)
                  lbu          s6, -6(gp)
                  lbu          s6, -4(gp)
                  or           t4, s2, t6
                  sb           a7, -12(gp)
                  c.mv         a1, a1
                  slt          s9, t4, t6
                  mulh         s0, s6, s10
                  slti         t6, a1, -116
                  c.slli       s8, 26
                  lh           s8, 1(gp)
                  andi         s10, a0, 1430
                  andi         t2, ra, 188
                  lbu          a6, 14(gp) #end riscv_load_store_rand_instr_stream_4
                  la           s4, region_0+1097 #start load_store_instr_stream_2
                  la           a3, region_0+1715 #start load_store_instr_stream_0
                  la           tp, region_0+214 #start load_store_instr_stream_1
                  sh           t6, 175(s4)
                  lhu          t1, 7(a3)
                  sb           tp, -107(tp)
                  sb           t6, 268(s4)
                  lb           t1, -136(tp)
                  lbu          t0, 29(s4)
                  lhu          zero, 170(tp)
                  sb           s9, 11(tp)
                  lb           gp, 14(a3)
                  lw           t0, -597(s4)
                  lbu          a1, 61(tp)
                  sb           s7, -11(a3)
                  sb           s4, 4(a3)
                  lbu          t1, 6(a3)
                  sb           s4, -1009(s4)
                  sh           s10, 156(tp)
                  sb           a4, 11(a3)
                  lb           t2, 6(a3)
                  sb           s7, 6(a3)
                  lhu          s2, -134(tp)
                  lb           s5, -594(s4)
                  sb           s10, 142(tp)
                  sh           s10, -303(s4)
                  lh           a0, -269(s4)
                  lb           t2, -47(tp)
                  lb           t4, 828(s4) #end load_store_instr_stream_2
                  sb           zero, -5(a3)
                  lhu          zero, -128(tp) #end load_store_instr_stream_1
                  lb           a6, -14(a3) #end load_store_instr_stream_0
                  la           t6, amo_0+28 #start riscv_lr_sc_instr_stream_0
                  lr.w.rl       s1, (t6)
                  sc.w.rl       t1, t2, (t6) #end riscv_lr_sc_instr_stream_0
                  la           a1, region_0+651 #start load_store_instr_stream_1
                  la           ra, region_1+1833 #start load_store_instr_stream_0
                  lbu          tp, 125(a1)
                  lbu          t1, -82(ra)
                  lh           a3, 107(a1)
                  sb           a1, 110(ra)
                  sw           a6, 13(a1)
                  lbu          t6, 158(a1)
                  sb           s9, 28(ra)
                  lbu          t1, -234(a1)
                  lb           tp, -16(ra)
                  sb           s6, 178(a1)
                  lb           a4, 122(a1) #end load_store_instr_stream_1
                  sb           s2, -59(ra) #end load_store_instr_stream_0
                  la           s6, amo_0+60 #start riscv_lr_sc_instr_stream_1
                  sll          gp, s7, a4
                  srl          t6, s10, s3
                  andi         a0, a0, 1042
                  sub          s1, s3, t4
                  mul          a4, a0, a1
                  nop
                  and          t4, a6, s8
                  lr.w.rl       s11, (s6)
                  c.xor        s0, a4
                  sc.w.aq       t3, sp, (s6) #end riscv_lr_sc_instr_stream_1
                  la           t5, amo_0+56 #start riscv_lr_sc_instr_stream_4
                  c.sub        s1, a1
                  xor          s9, a5, t2
                  lr.w.aq       t3, (t5)
                  sc.w.aq       s8, ra, (t5) #end riscv_lr_sc_instr_stream_4
                  la           t1, amo_0+24 #start riscv_lr_sc_instr_stream_2
                  c.andi       a4, 19
                  lr.w.aq       tp, (t1)
                  nop
                  c.mv         s8, t3
                  sltu         s4, ra, t6
                  c.xor        a4, a2
                  c.and        s0, s0
                  sll          s0, tp, s6
                  and          a6, a6, t5
                  add          a0, a5, s11
                  srli         t4, s9, 31
                  sc.w.rl       s0, a4, (t1) #end riscv_lr_sc_instr_stream_2
                  addi         a2, zero, 8 #init loop 0 counter
                  slli         s11, a6, 27
                  c.sub        s1, a0
                  c.sub        a4, a2
                  c.li         a1, 0
                  addi         ra, zero, 13 #init loop 0 limit
                  slti         gp, s10, -58
                  add          sp, s4, t6
sub_4_36_0_t:     divu         a6, t4, gp
                  c.or         a1, a4
                  sltiu        a4, gp, 18
                  srl          s8, t4, a3
                  addi         a2, a2, 4 #update loop 0 counter
                  c.and        a4, s0
                  bltu         a2, ra, sub_4_36_0_t #branch for loop 0
                  c.add        s9, a3
                  addi         s4, zero, -9 #init loop 0 counter
                  srai         s5, ra, 12
                  addi         s11, zero, 11 #init loop 0 limit
sub_4_33_0_t:     nop
                  addi         s4, s4, 10 #update loop 0 counter
                  beq          s4, s11, sub_4_33_0_t #branch for loop 0
                  c.mv         t0, t4
                  la           s10, region_0+1514 #start riscv_load_store_hazard_instr_stream_2
                  sh           a4, -10(s10)
                  sw           t1, -10(s10)
                  mulh         s1, t6, s4
                  lhu          s4, -10(s10)
                  lb           s9, -10(s10)
                  sltu         a6, a0, t4
                  lb           a6, -10(s10)
                  sh           s4, -10(s10)
                  sb           a4, -10(s10)
                  lb           t3, -13(s10)
                  lbu          s6, -13(s10)
                  sb           t4, -13(s10)
                  lb           s3, -13(s10)
                  c.addi       s3, 10
                  lbu          t5, -13(s10)
                  sb           sp, -13(s10)
                  slti         t2, s0, 1177
                  sb           s10, -13(s10) #end riscv_load_store_hazard_instr_stream_2
sub_4_18:         jal          ra, 12f
0:                jal          ra, 7f
1:                c.jal        22f
2:                c.jal        23f
3:                c.j          21f
4:                c.jal        18f
5:                c.jal        4b
6:                c.jal        15f
7:                c.j          6b
8:                jal          ra, 1b
9:                c.jal        10f
10:               c.j          19f
11:               c.jal        0b
12:               jal          ra, 11b
13:               c.jal        3b
14:               c.jal        2b
15:               jal          t1, 20f
16:               jal          tp, 9b
17:               c.jal        5b
18:               c.jal        13b
19:               c.jal        14b
20:               c.jal        8b
21:               c.j          16b
22:               c.j          17b
23:               c.and        a3, a4
                  la           s1, region_1+1745 #start riscv_load_store_hazard_instr_stream_3
                  lbu          a1, -42(s1)
                  lb           tp, -64(s1)
                  sb           s4, -26(s1)
                  sltu         sp, a5, a7
                  lh           a2, -43(s1)
                  sb           tp, -43(s1)
                  lhu          zero, -43(s1)
                  lb           gp, 46(s1)
                  lbu          s3, 61(s1)
                  divu         t0, s0, t2
                  lb           a2, 61(s1)
                  lh           t6, 61(s1)
                  lh           tp, -29(s1)
                  lh           s10, -29(s1)
                  lw           s8, 63(s1)
                  lb           a6, 50(s1)
                  sltiu        a6, s7, -610
                  lb           t3, -36(s1)
                  lbu          zero, -36(s1)
                  lb           s10, 29(s1)
                  lbu          t2, -5(s1) #end riscv_load_store_hazard_instr_stream_3
                  la           a6, region_1+661 #start riscv_hazard_instr_stream_5
                  c.or         a3, a4
                  xori         s4, s4, -1053
                  lbu          sp, 4(a6)
                  c.addi       ra, 11
                  c.and        a4, a4
                  auipc        sp, 180666
                  sb           ra, 4(a6)
                  slt          tp, tp, ra
                  sb           s4, -4(a6)
                  lh           s4, 7(a6)
                  c.andi       a4, 16
                  lhu          sp, -3(a6)
                  sb           tp, -5(a6)
                  c.addi16sp   sp, 160
                  sh           a3, -15(a6)
                  sw           s4, -5(a6)
                  c.slli       s4, 27
                  lbu          a3, 2(a6)
                  mulhsu       a4, tp, s4
                  mulhu        s4, s4, ra
                  sb           a4, 7(a6)
                  ori          s4, s4, -1036
                  sub          tp, sp, a4
                  sw           a3, 7(a6)
                  slli         tp, s4, 16
                  sb           a3, 0(a6)
                  c.sub        a4, a3
                  c.or         a3, a4
                  auipc        tp, 1020600
                  lb           a3, -10(a6)
                  lb           ra, -8(a6)
                  lbu          a3, -12(a6)
                  slt          ra, a4, sp
                  sb           sp, -16(a6)
                  lb           sp, 1(a6)
                  srai         a4, sp, 27
                  c.slli       ra, 6
                  lhu          a4, -15(a6)
                  mul          s4, s4, ra
                  sb           a3, -12(a6)
                  lbu          a3, 10(a6)
                  lbu          a4, -14(a6)
                  lb           s4, 2(a6) #end riscv_hazard_instr_stream_5
                  la           sp, region_1+1919 #start load_store_instr_stream_1
                  la           s1, region_0+1780 #start load_store_instr_stream_0
                  lbu          t5, -8(sp)
                  sw           a1, -3(sp)
                  lbu          s11, 12(sp)
                  sh           a7, -1(sp)
                  lbu          t4, -1049(s1)
                  sb           s6, 7(sp)
                  sb           t3, 115(s1)
                  sb           s11, -1304(s1)
                  sb           a3, 14(sp)
                  lb           s3, -13(sp)
                  lbu          a6, -531(s1)
                  lb           t1, 11(sp)
                  sb           gp, 16(sp)
                  sb           ra, 8(sp) #end load_store_instr_stream_1
                  sb           a6, -1762(s1) #end load_store_instr_stream_0
                  addi         t3, zero, 10 #init loop 1 counter
                  addi         s9, zero, 17 #init loop 1 limit
                  c.nop
sub_4_35_1_t:     xori         a4, sp, -1195
                  c.srai       s0, 12
                  addi         s10, s8, -52
                  addi         t3, t3, 7 #update loop 1 counter
                  addi         t6, zero, -2 #init loop 0 counter
                  c.addi16sp   sp, 80
                  mulhsu       s2, tp, zero
                  addi         s3, zero, -5 #init loop 0 limit
                  slt          t4, s0, t5
sub_4_35_0_t:     rem          a1, s5, s9
                  srl          s5, s7, s11
                  addi         t6, t6, -3 #update loop 0 counter
                  c.srli       a1, 15
                  sll          t0, a3, s6
                  bge          t6, s3, sub_4_35_0_t #branch for loop 0
                  rem          s10, s11, a4
                  bne          t3, s9, sub_4_35_1_t #branch for loop 1
                  divu         s5, s4, s10
                  la           sp, region_1+626 #start riscv_load_store_rand_instr_stream_3
                  sra          t0, tp, s6
                  c.andi       a2, -1
                  lbu          s1, 44(sp)
                  sb           t5, -55(sp)
                  nop
                  sb           a1, 45(sp)
                  lb           t1, 36(sp)
                  lbu          a0, -13(sp)
                  lb           t0, 39(sp)
                  c.nop
                  lb           t3, 21(sp)
                  srai         s10, s11, 4
                  andi         ra, s1, -1553
                  sb           s8, -13(sp)
                  lbu          tp, 15(sp)
                  sb           t5, -15(sp)
                  c.and        a0, a1
                  lb           zero, 21(sp)
                  slti         t5, a2, 1163
                  sb           s9, -47(sp)
                  c.xor        a4, a1
                  lb           zero, 46(sp)
                  c.slli       a1, 12
                  lbu          t4, -11(sp)
                  mul          gp, s10, t5
                  sb           a3, 10(sp)
                  c.xor        a4, s0
                  lbu          s2, 31(sp)
                  and          a3, s5, ra
                  c.sub        s1, s0
                  c.lui        s11, 27
                  or           s2, zero, tp
                  rem          s4, a6, s5
                  c.or         s1, a5
                  mulh         s1, t3, t2
                  lb           s6, 1(sp)
                  lhu          a1, 48(sp)
                  sh           s8, 60(sp)
                  sb           t2, 14(sp)
                  sw           s6, 6(sp) #end riscv_load_store_rand_instr_stream_3
                  la           s10, amo_0+16 #start riscv_lr_sc_instr_stream_3
                  lr.w          t4, (s10)
                  mulhu        ra, a1, s9
                  lui          a0, 150345
                  rem          a1, a1, s4
                  c.mv         gp, s11
                  sc.w.aq       a3, t3, (s10) #end riscv_lr_sc_instr_stream_3
                  addi         a2, zero, 7 #init loop 0 counter
                  addi         t0, zero, 13 #init loop 0 limit
                  ori          s2, s10, 1580
sub_4_37_0_t:     remu         t1, a7, s4
                  addi         a2, a2, 1 #update loop 0 counter
                  and          s1, s10, s2
                  sltiu        s4, a2, 588
                  beq          a2, t0, sub_4_37_0_t #branch for loop 0
                  slt          t3, ra, tp
                  la           t3, region_0+1761 #start load_store_instr_stream_1
                  la           tp, region_0+839 #start load_store_instr_stream_0
                  lb           a6, 4(t3)
                  lbu          s11, -816(tp)
                  lhu          gp, 13(t3)
                  lb           t4, -32(tp)
                  sh           t0, -5(t3)
                  lb           a1, -14(t3)
                  sb           a0, -734(tp)
                  sb           a0, -663(tp)
                  lb           s1, -37(tp)
                  lb           sp, -11(t3)
                  lbu          a4, 538(tp)
                  sb           gp, -16(t3) #end load_store_instr_stream_1
                  lh           s6, -301(tp) #end load_store_instr_stream_0
                  la           t2, region_1+1289 #start riscv_load_store_hazard_instr_stream_4
                  sb           a6, 106(t2)
                  sb           a1, 244(t2)
                  lb           a0, 244(t2)
                  lb           a2, 244(t2)
                  lb           s3, -164(t2)
                  lb           s1, -164(t2)
                  srli         sp, s4, 12
                  lbu          s8, -250(t2)
                  sb           a4, 80(t2)
                  sb           s4, 80(t2)
                  lh           sp, -117(t2)
                  sb           sp, -117(t2)
                  sb           s4, -208(t2)
                  sb           a0, -10(t2)
                  sb           t2, -112(t2)
                  sb           zero, -172(t2)
                  sb           a5, -172(t2)
                  lh           s2, 221(t2)
                  sw           tp, -153(t2)
                  lbu          s5, 118(t2) #end riscv_load_store_hazard_instr_stream_4
sub_4_16:         jal          ra, 15f
0:                c.j          5f
1:                jal          ra, 9f
2:                jal          ra, 20f
3:                c.j          4f
4:                jal          a4, 6f
5:                jal          t0, 18f
6:                c.jal        23f
7:                c.j          2b
8:                c.jal        17f
9:                c.j          22f
10:               c.jal        7b
11:               jal          ra, 10b
12:               jal          a3, 11b
13:               c.jal        14f
14:               jal          t2, 1b
15:               jal          ra, 3b
16:               jal          tp, 8b
17:               c.jal        13b
18:               c.jal        12b
19:               c.jal        24f
20:               jal          sp, 19b
21:               c.j          0b
22:               jal          t1, 21b
23:               c.jal        16b
24:               c.and        s1, a3
                  la           t4, region_0+229 #start riscv_hazard_instr_stream_0
                  mul          s0, s3, gp
                  lbu          sp, 300(t4)
                  lb           s0, 918(t4)
                  mulhu        s3, s0, s10
                  lw           gp, 1159(t4)
                  addi         s8, s3, -246
                  sb           s10, 477(t4)
                  add          s3, sp, s0
                  c.addi4spn   s0, sp, 16
                  lb           sp, 332(t4)
                  sb           sp, 549(t4)
                  lh           s10, 317(t4)
                  c.or         s0, s0
                  sra          gp, s0, s0
                  sh           sp, 1337(t4)
                  lhu          sp, -37(t4)
                  sb           s10, 262(t4)
                  c.srli       s0, 23
                  ori          s10, s3, -528
                  sll          s8, s3, s8
                  lb           s3, 100(t4)
                  sb           s0, 590(t4)
                  c.and        s0, s0
                  rem          s3, s10, s0
                  lbu          sp, 1440(t4)
                  lbu          s3, -122(t4)
                  xor          s10, s3, s3
                  xori         s10, gp, -866
                  lb           gp, 899(t4)
                  rem          s10, s10, gp
                  lb           s10, 572(t4)
                  c.addi       sp, -1
                  c.srli       s0, 2
                  sw           gp, 1343(t4)
                  lhu          s3, 221(t4)
                  sb           gp, 677(t4)
                  lw           s10, 183(t4) #end riscv_hazard_instr_stream_0
                  la           s10, region_0+1040 #start load_store_instr_stream_0
                  la           s0, region_1+669 #start load_store_instr_stream_1
                  lhu          s4, -135(s0)
                  sb           t6, 9(s10)
                  sb           t4, -13(s0)
                  lbu          s6, -177(s0)
                  sb           gp, 7(s10)
                  sb           t1, 3(s10)
                  lhu          a3, 215(s0)
                  lb           s9, 168(s0)
                  sb           s8, -150(s0)
                  lh           a4, -6(s10)
                  lb           a3, 79(s0)
                  sb           t3, 98(s0)
                  lb           s6, -140(s0) #end load_store_instr_stream_1
                  lb           s3, 5(s10) #end load_store_instr_stream_0
                  bgeu         ra, t3, 5f
                  c.addi16sp   sp, -16
                  sltu         ra, a5, a1
                  andi         s1, a4, -1364
                  c.srai       a1, 17
5:                srl          a3, a5, t4
                  c.add        t0, s9
                  mulhsu       sp, a2, sp
                  bne          t5, s0, 25f
                  mulhsu       s10, s10, t2
                  divu         zero, s4, tp
                  mulh         zero, t2, zero
                  srai         s1, s6, 24
                  c.srli       s0, 24
                  c.or         a1, s0
                  sll          t0, s3, gp
                  c.nop
                  slt          t0, zero, s0
                  ori          zero, gp, 194
                  c.addi4spn   a0, sp, 208
                  remu         tp, s5, s1
                  bge          s3, s3, 23f
                  c.lui        gp, 17
23:               xori         t2, zero, 1078
                  c.li         ra, -1
25:               c.nop
                  beq          a5, t1, 33f
                  remu         a1, s2, a4
                  sub          s2, t2, s0
                  c.mv         s5, s9
                  mulhu        a4, a7, ra
                  srai         t1, t6, 21
                  sub          t2, t1, zero
33:               xori         a3, gp, -1179
                  andi         tp, s4, 331
                  c.addi       s2, -1
                  c.beqz       s1, 39f
                  lui          s3, 278969
                  blt          s5, s11, 57f
39:               c.and        a0, a4
                  add          s6, s1, s1
                  c.xor        a2, a5
                  c.bnez       s1, 60f
                  sll          t1, s3, s7
                  nop
                  c.addi       a4, 24
                  blt          t2, t2, 49f
                  slt          t3, s8, t4
                  c.srai       a3, 26
49:               bltu         a7, a6, 67f
                  divu         s3, t4, s0
                  bge          s2, a6, 52f
52:               rem          s3, sp, s5
                  addi         ra, s3, 205
                  c.xor        a1, a4
                  c.srli       a4, 12
                  c.and        a3, a1
57:               c.addi16sp   sp, -16
                  sltiu        a4, t0, 1301
                  sub          t5, a1, t6
60:               bge          s3, a0, 74f
                  c.nop
                  or           s5, s1, a1
                  mulhsu       a6, a5, s6
                  div          a1, s5, a3
                  lui          ra, 929523
                  c.slli       s9, 20
67:               xori         s5, a3, 477
                  div          a0, a1, a3
                  sub          sp, gp, s10
                  c.addi16sp   sp, 160
                  lui          a2, 698926
                  c.sub        s0, a5
                  beq          a2, s10, 90f
74:               beq          a6, s0, 82f
                  mulh         s5, s1, a1
                  srli         s4, a1, 22
                  div          s5, s7, s1
                  c.slli       s5, 3
                  c.bnez       a4, 90f
                  add          gp, a7, zero
                  sra          tp, s8, a5
82:               c.or         a2, s0
                  and          a2, a3, a4
                  srl          a0, t4, tp
                  mul          tp, a0, a0
                  bge          zero, s3, 95f
                  lui          zero, 712278
                  sltiu        s3, s6, 236
                  auipc        s6, 342913
90:               div          s8, s5, t1
                  c.addi4spn   a1, sp, 1008
                  mulhu        tp, t3, gp
                  c.addi4spn   a2, sp, 608
                  ori          s9, a6, -19
95:               c.beqz       a3, 108f
                  sll          a0, s7, s5
                  ori          a2, s5, -1820
                  beq          a1, gp, 103f
                  sltu         t3, a7, t2
                  bne          a5, s7, 102f
                  sll          sp, t3, tp
                  la           sp, region_1+1007 #start riscv_hazard_instr_stream_4
                  lhu          s1, 19(sp)
                  sra          a4, a4, t0
                  div          a4, s9, t0
                  lbu          t0, 31(sp)
                  c.or         a4, s1
                  mul          s1, t0, s9
                  xor          t5, zero, t0
                  c.addi       t0, 11
                  c.addi       t0, 16
                  c.li         s9, -1
                  sh           t5, 35(sp)
                  remu         t0, zero, t5
                  sll          s9, t0, t0
                  sb           a4, 14(sp)
                  lbu          t0, -48(sp)
                  lhu          a4, -37(sp)
                  lhu          a4, 11(sp)
                  c.add        t5, t0
                  divu         s9, t0, s1
                  lbu          a4, 10(sp)
                  sra          t5, zero, zero
                  sh           t0, -17(sp)
                  sb           s1, -16(sp)
                  mulh         zero, s1, t0
                  sra          t0, a4, t0
                  lh           a4, 29(sp)
                  sltu         t0, zero, a4
                  rem          zero, a4, s1
                  sb           t5, -19(sp)
                  c.li         t5, -1
                  xor          s1, t5, s9
                  lb           zero, -1(sp) #end riscv_hazard_instr_stream_4
102:              c.beqz       a0, 120f
103:              srli         s10, a4, 20
                  srai         s3, t4, 19
                  c.srli       a1, 4
                  ori          t2, a5, -698
                  c.add        ra, a7
108:              and          t5, s9, s2
                  sra          t5, a2, a7
                  c.srli       a1, 23
                  c.li         tp, 23
                  c.beqz       a0, 121f
                  c.and        a0, a3
                  c.srli       s1, 27
                  nop
                  c.li         s0, -1
                  xori         tp, a7, 351
                  bne          t5, t5, 128f
                  sll          a3, s4, s4
120:              ori          gp, a4, -353
121:              bge          a0, s9, 128f
                  c.bnez       s1, 131f
                  mulhu        ra, t3, s10
                  xori         s11, a7, -433
                  mulhu        t0, t4, s0
                  c.li         tp, -1
                  remu         s4, s11, s8
128:              c.bnez       a0, 138f
                  bne          s9, s6, 132f
                  c.addi16sp   sp, -16
131:              mulh         s3, a4, s10
132:              c.srai       a2, 24
                  mulhsu       s6, a5, tp
                  c.and        s0, a4
                  bne          a6, a2, 149f
                  c.add        a3, ra
                  add          s9, t6, a7
138:              c.addi4spn   a2, sp, 752
                  slt          sp, s9, s4
                  rem          s6, s5, sp
                  c.bnez       a4, 151f
                  sub          t5, t6, s9
                  lui          t3, 868392
                  mulhsu       s11, a7, a0
                  lui          s2, 266416
                  remu         a3, s0, s4
                  c.bnez       a0, 164f
                  slli         a3, t1, 6
149:              c.or         s0, a3
                  c.addi16sp   sp, 288
151:              c.sub        a3, s1
                  bgeu         a2, t4, 172f
                  and          s5, tp, gp
                  lui          t3, 92483
                  sll          s1, s8, t4
                  sra          t3, t4, zero
                  sltu         t2, t0, t3
                  remu         s2, a1, s6
                  sltu         t1, ra, a2
                  c.addi16sp   sp, 256
                  c.nop
                  blt          s1, t6, 175f
                  c.add        a4, sp
164:              bltu         t1, a5, 173f
                  c.addi4spn   a2, sp, 544
                  bgeu         gp, a3, 167f
167:              c.slli       s0, 28
                  c.or         a4, a0
                  bge          ra, s9, 172f
                  c.addi       gp, -1
                  c.addi16sp   sp, 432
172:              sltu         t1, s5, a1
173:              addi         t2, a4, 1592
                  slli         s8, t4, 0
175:              slli         sp, t0, 4
                  divu         sp, s11, s11
                  mulh         a1, ra, a2
                  srli         s2, s11, 16
                  srli         t6, a4, 31
                  bltu         s8, a1, 189f
                  blt          sp, t1, 201f
                  c.addi4spn   s1, sp, 496
                  c.addi4spn   a3, sp, 48
                  xor          t2, s4, s10
                  add          gp, t4, s1
                  c.addi4spn   a1, sp, 592
                  xori         tp, s8, -345
                  sra          s5, s6, a6
189:              andi         a4, t5, -1650
                  c.lui        s2, 3
                  c.addi16sp   sp, 16
                  sub          a3, s11, s3
                  sltiu        s5, s0, 899
                  c.add        a3, a4
                  mulhu        s6, a6, s2
                  c.li         s1, -1
                  sltiu        a0, s3, -65
                  slti         t0, gp, 1045
                  srl          s9, t0, s5
                  c.slli       s0, 19
201:              c.add        a3, s11
                  c.addi       t5, 2
                  c.sub        a3, s1
                  addi         zero, t1, -1783
                  sltu         zero, s6, t1
                  lui          ra, 464951
                  add          sp, s11, s3
                  xor          s11, t0, zero
                  ori          s2, a1, 1422
                  c.bnez       s1, 227f
                  c.slli       sp, 2
                  bltu         a6, sp, 221f
                  mulhsu       s5, s0, t1
                  srli         a2, sp, 13
                  c.xor        a2, a0
                  bge          a0, t0, 224f
                  srli         t5, t0, 27
                  andi         s6, s0, -143
                  c.srai       a2, 26
                  xor          s11, s3, s11
221:              slt          zero, sp, t0
                  remu         s0, t6, a3
                  c.li         s5, -1
224:              c.srli       a0, 6
                  add          t6, s8, a2
                  rem          a4, s3, ra
227:              bgeu         a7, s10, 237f
                  sll          s10, t4, t3
                  c.srai       a3, 24
                  rem          t5, zero, gp
                  srl          tp, t4, gp
                  or           t5, a3, s3
                  srl          t1, t2, t3
                  rem          s4, sp, a4
                  slti         ra, zero, -393
                  mulh         a2, s8, a2
237:              auipc        s2, 28314
                  nop
                  remu         ra, t4, a1
                  c.srli       s0, 26
                  lui          zero, 311243
                  c.mv         s10, t5
                  mulhu        s3, s3, a7
                  c.lui        s8, 3
                  lui          s2, 269961
                  c.and        a3, a1
                  c.slli       t2, 27
                  srl          t3, t3, s1
                  c.slli       t3, 4
                  c.addi4spn   a4, sp, 96
                  bltu         a0, ra, 262f
                  c.li         a6, -1
                  nop
                  slti         ra, a7, -252
                  srli         t3, s3, 14
                  c.mv         t5, s1
                  sltiu        s8, a7, -939
                  c.addi4spn   a3, sp, 192
                  c.bnez       a1, 278f
                  c.add        s5, s8
                  slt          zero, t1, a3
262:              bge          a6, s7, 264f
                  sub          zero, s7, t2
264:              mulhsu       a0, zero, a0
                  c.addi       a1, 30
                  slti         a1, a4, 295
                  mulhu        s5, t2, t3
                  c.lui        tp, 11
                  mulhu        a0, t4, a0
                  c.srai       a3, 19
                  mulh         s2, s7, s7
                  add          t4, s1, sp
                  srl          ra, t4, a7
                  sll          s0, s9, t0
                  srl          s10, a5, s6
                  bltu         a5, s9, 290f
                  nop
278:              c.lui        s3, 16
                  nop
                  c.addi16sp   sp, -16
                  srl          a4, s7, t3
                  srl          s0, s11, t3
                  add          s3, s9, zero
                  c.or         a0, a0
                  xor          s1, tp, a5
                  bge          s0, t6, 291f
                  rem          a2, s4, s10
                  div          t1, s5, s2
                  addi         s1, s2, 278
290:              bltu         zero, a7, 293f
291:              c.addi16sp   sp, 192
                  auipc        a2, 547493
293:              c.lui        t3, 5
                  bltu         ra, a6, 296f
                  bne          s10, gp, 312f
296:              c.nop
                  c.li         s10, 14
                  beq          s0, gp, 316f
                  c.xor        s0, a4
                  slti         a4, t6, 193
                  nop
                  slt          t0, a3, s10
                  sra          s2, s4, tp
                  addi         a0, t4, -904
                  srai         a2, a3, 9
                  divu         s2, t2, t5
                  sra          s6, t4, s5
                  add          t6, s2, t1
                  divu         a2, s11, s10
                  bne          s1, ra, 323f
                  srl          a4, s2, s11
312:              mul          s4, s11, gp
                  beq          a3, a2, 330f
                  srl          t6, a5, gp
                  div          s8, a6, s11
316:              and          s0, t2, s4
                  c.addi       s11, 19
                  sltu         s1, a3, a6
                  remu         t0, t1, sp
                  nop
                  mulhu        tp, s11, t5
                  c.beqz       a1, 329f
323:              xori         t2, t0, -1590
                  sra          s4, a7, t0
                  remu         s4, t5, a2
                  c.srai       a1, 19
                  srai         s0, a4, 25
                  c.addi       s11, -1
329:              c.nop
330:              srli         s9, t0, 3
                  c.lui        s4, 20
                  mulh         s3, a2, t6
                  c.lui        s4, 23
                  c.or         a0, a4
                  srl          a0, t1, a4
                  mulh         s3, a5, a6
                  sltu         s0, s7, t6
                  slti         s0, a1, 1148
                  divu         s6, s9, a2
                  div          t5, s1, gp
                  slti         t6, s6, -1751
                  blt          s10, s1, 355f
                  lui          s0, 773174
                  srl          t5, s11, gp
                  mulh         s10, s11, s3
                  add          t4, ra, t0
                  ori          t4, s3, 1390
                  bgeu         s7, s0, 358f
                  andi         t6, a5, 1661
                  mulhsu       s8, t4, s5
                  c.li         t5, 28
                  slli         s10, t0, 18
                  addi         a1, s6, -531
                  c.bnez       s0, 361f
355:              c.addi4spn   a4, sp, 944
                  sll          ra, t0, s9
                  lui          a0, 205273
358:              srl          ra, s7, s3
                  blt          s8, ra, 362f
                  c.addi4spn   a3, sp, 288
361:              c.slli       ra, 23
362:              slli         gp, t6, 0
                  c.bnez       s1, 381f
                  auipc        s4, 935948
                  sll          t3, a2, a5
                  slti         a0, a6, 1918
                  xori         t2, a4, 1377
                  c.or         a0, s1
                  c.beqz       a1, 379f
                  c.addi       s1, 14
                  slti         s2, a5, 1573
                  c.andi       a4, 26
                  c.addi16sp   sp, 448
                  xor          t4, a7, s5
                  c.bnez       a3, 380f
                  c.mv         s3, s11
                  srli         t2, s10, 5
                  and          t0, tp, s1
379:              xori         s0, a3, -586
380:              c.nop
381:              sll          t0, s11, a6
                  lui          s10, 23533
                  c.srai       s1, 24
                  sra          t2, gp, s8
                  mulh         a3, t1, s1
                  rem          s6, t4, s6
                  c.bnez       a3, 401f
                  rem          a6, s5, t3
                  xor          t2, s11, s10
                  slli         a3, tp, 5
                  div          s10, t0, s9
                  c.slli       gp, 18
                  srli         a6, t5, 16
                  c.srai       a0, 25
                  c.andi       a2, -1
                  lui          s11, 656985
                  c.lui        s4, 23
                  mulhu        t6, a2, a4
                  or           zero, a2, a5
                  and          a1, t6, t2
401:              srai         s2, ra, 8
                  c.addi16sp   sp, 240
                  blt          a2, s3, 421f
                  c.addi4spn   s0, sp, 848
                  c.lui        s3, 7
                  c.srli       a1, 19
                  bge          s5, s3, 420f
                  sra          s0, t4, s3
                  c.addi4spn   a1, sp, 480
                  xori         zero, a6, -1483
                  sra          t1, t1, gp
                  c.addi16sp   sp, 288
                  sltiu        a3, a5, 1533
                  c.slli       s3, 2
                  sltiu        t2, t3, -561
                  srl          t4, gp, a4
                  mulh         s4, s9, s2
                  c.lui        a2, 1
                  remu         s1, s6, a4
420:              c.addi16sp   sp, 432
421:              sll          s1, t3, s4
                  c.mv         s6, s9
                  mulhsu       t4, a4, s6
                  bne          s3, t6, 437f
                  c.or         a2, a2
                  c.mv         t3, s11
                  c.xor        a0, a5
                  c.lui        s9, 29
                  srl          s3, s11, t1
                  c.addi       gp, -1
                  nop
                  blt          tp, a3, 449f
                  mulhsu       t6, s3, a0
                  remu         s2, zero, s4
                  slli         s1, t1, 2
                  srl          t0, a7, t5
437:              sltiu        t2, zero, -1378
                  c.srai       a4, 16
                  bne          a4, s6, 449f
                  srl          s2, s11, t2
                  c.srli       a1, 18
                  divu         t5, gp, a7
                  c.srli       s1, 3
                  c.srli       a3, 26
                  bgeu         s2, ra, 459f
                  c.nop
                  c.bnez       s0, 449f
                  c.slli       a3, 30
449:              or           s4, a4, s5
                  c.addi16sp   sp, -16
                  c.bnez       s1, 460f
                  mulh         t6, s1, a7
                  mul          s6, s3, s10
                  c.addi4spn   a0, sp, 656
                  c.li         a2, 11
                  addi         s2, a5, 638
                  c.bnez       s1, 460f
                  c.addi       s10, -1
459:              ori          s11, sp, 2009
460:              bne          tp, ra, 463f
                  srai         s3, s3, 26
                  nop
463:              ori          s3, s11, 317
                  bgeu         a3, s5, 481f
                  c.and        a0, a2
                  mulhu        t4, a6, t0
                  c.sub        a0, a3
                  c.li         a4, -1
                  add          s5, a0, s4
                  bltu         t0, sp, 472f
                  or           t1, s0, s6
472:              c.lui        t5, 3
                  slli         s5, t2, 27
                  xor          t4, s7, s10
                  srl          t1, a5, s4
                  slli         s0, zero, 27
                  addi         sp, a0, -1862
                  c.li         a4, 7
                  beq          t6, a4, 486f
                  slli         a3, s9, 19
481:              c.lui        gp, 23
                  c.addi4spn   a1, sp, 864
                  xori         s5, t4, -1959
                  slli         gp, a7, 12
                  div          zero, sp, t5
486:              slti         gp, t1, -32
                  c.srli       a3, 26
                  srai         a2, t3, 25
                  c.addi       s8, -1
                  c.addi16sp   sp, 256
                  bge          sp, a7, 505f
                  bgeu         a5, a1, 497f
                  add          t6, s10, s6
                  c.slli       s0, 1
                  sra          zero, a5, s4
                  c.addi       a3, 3
497:              c.srli       a4, 23
                  xor          s3, s2, s6
                  c.andi       a1, -1
                  c.or         s0, s0
                  c.addi16sp   sp, -16
                  slt          t4, a1, a3
                  c.bnez       a1, 521f
                  c.beqz       a4, 514f
505:              mulhu        ra, t4, zero
                  auipc        a1, 383127
                  c.slli       t4, 7
                  mul          t3, a1, t1
                  xor          a4, a7, sp
                  mulh         s1, s1, t2
                  sll          gp, gp, a5
                  bltu         a7, a2, 515f
                  auipc        a4, 390211
514:              slli         s9, t5, 25
515:              and          s11, t4, t3
                  add          s11, s6, s2
                  slt          t3, s5, a3
                  sra          s6, t2, t0
                  addi         t1, a7, 1176
                  c.xor        a2, s0
521:              c.lui        s8, 24
                  mul          a4, s6, s0
                  mulh         s5, a3, a6
                  rem          s11, tp, t3
                  bge          s9, a4, 533f
                  xori         gp, s4, -224
                  mulh         a3, a1, t1
                  mulhsu       a6, a4, t3
                  c.lui        s10, 19
                  or           s10, s8, s3
                  auipc        t4, 619301
                  bltu         s11, s8, 551f
533:              srl          t5, t2, a1
                  c.or         a2, a4
                  c.bnez       s1, 536f
536:              divu         a2, a2, t2
                  auipc        t0, 463177
                  slt          t1, t2, s6
                  slti         s5, s0, -2005
                  ori          a0, t5, -1109
                  srli         s8, a2, 2
                  c.or         a1, s1
                  c.lui        s6, 18
                  c.and        s1, s1
                  c.addi4spn   a1, sp, 464
                  c.add        s1, sp
                  slt          zero, t0, s11
                  slti         s5, t3, -1863
                  and          sp, s5, s0
                  c.sub        s0, a2
551:              sra          s6, s8, a3
                  c.nop
                  c.srli       a3, 24
                  c.addi16sp   sp, -16
                  divu         s10, s7, t4
                  c.beqz       a0, 561f
                  c.sub        a4, a2
                  div          s3, zero, t2
                  c.addi4spn   a4, sp, 704
                  sltiu        s11, t6, 1151
561:              xor          t4, t0, a3
                  bge          t4, s9, 569f
                  xori         t6, a0, -1835
                  sltiu        s5, t3, -1186
                  mulhsu       sp, a5, sp
                  remu         s1, s11, a4
                  srl          sp, s10, s3
                  c.add        a6, t6
569:              c.lui        a2, 13
                  srli         t6, t2, 10
                  xor          a6, a7, ra
                  c.sub        a0, a4
                  divu         a2, t2, t5
                  c.nop
                  rem          s8, a5, a1
                  srai         t3, a7, 9
                  addi         s2, a3, 985
                  slti         a6, a7, -1414
                  slli         gp, gp, 14
                  c.li         a4, -1
                  slt          s11, s2, s4
                  sll          a2, a5, s9
                  c.addi4spn   a4, sp, 896
                  xor          s5, t4, s3
                  bne          s11, s5, 594f
                  mulhu        a1, a7, s2
                  bge          s2, s6, 605f
                  blt          t5, s10, 605f
                  c.slli       s1, 25
                  ori          a0, t4, -1287
                  bgeu         s5, s5, 600f
                  div          a3, gp, a1
                  c.nop
594:              slt          s8, s9, ra
                  slt          t3, s7, s8
                  c.andi       a2, -1
                  slt          ra, s7, s5
                  mulhsu       s11, s7, s4
                  bge          s4, gp, 610f
600:              remu         s5, s10, t2
                  mul          t0, a5, t3
                  bge          a0, t3, 612f
                  c.or         a2, a3
                  c.or         a1, a2
605:              c.addi16sp   sp, -16
                  xori         a0, s9, -580
                  andi         s10, a1, -826
                  c.beqz       s0, 628f
                  c.addi       t5, 30
610:              sll          s3, s1, tp
                  xor          s8, s3, a1
612:              bltu         s1, t0, 630f
                  sub          a3, t4, a0
                  nop
                  beq          a0, a6, 617f
                  c.slli       a3, 28
617:              ori          ra, t3, 121
                  c.nop
                  c.sub        a2, a0
                  c.addi16sp   sp, -16
                  c.addi       sp, 20
                  slt          s6, zero, s1
                  auipc        s6, 304919
                  or           a3, s11, sp
                  sub          s1, tp, t3
                  c.addi4spn   a4, sp, 640
                  c.and        s1, a0
628:              c.bnez       a2, 645f
                  c.xor        a2, s0
630:              c.beqz       a1, 647f
                  sra          s2, t3, t0
                  lui          s6, 534147
                  nop
                  auipc        zero, 548211
                  c.li         s2, 2
                  beq          a6, sp, 641f
                  c.li         t4, 27
                  mul          ra, s0, sp
                  c.slli       s9, 1
                  c.addi       a6, 7
641:              mulhu        t4, a6, a2
                  xori         s9, t6, 1462
                  c.beqz       s1, 661f
                  nop
645:              c.sub        a2, s0
                  c.bnez       s1, 655f
647:              c.andi       a3, 15
                  mulhsu       s9, s4, a2
                  beq          sp, a6, 662f
                  c.mv         s8, t3
                  c.bnez       a0, 661f
                  sll          a6, t0, s10
                  c.and        s0, a5
                  sltiu        zero, gp, -656
655:              lui          s6, 993950
                  and          s5, s4, sp
                  sltiu        t2, t1, -488
                  sub          a0, a3, a3
                  remu         t5, s1, s2
                  and          a6, s9, s9
661:              c.bnez       s1, 679f
662:              c.andi       a4, 8
                  mul          s4, s5, ra
                  c.mv         s9, a7
                  c.sub        a0, a0
                  lui          zero, 300298
                  c.xor        a4, a2
                  sltiu        s8, s4, -1824
                  srai         s6, ra, 17
                  c.or         s0, a0
                  c.or         s0, a3
                  add          s5, sp, a4
                  c.add        s4, tp
                  slt          s10, t4, t2
                  mulhsu       t6, t0, s9
                  c.sub        a2, a0
                  sltu         s6, tp, t2
                  mulhsu       s3, t2, a6
679:              or           sp, s11, gp
                  sub          sp, s0, s5
                  and          a1, t4, s6
                  rem          tp, a5, t2
                  bge          s3, s4, 693f
                  nop
                  bne          a0, t0, 688f
                  div          t5, a6, t6
                  srai         a6, sp, 31
688:              and          t0, s7, zero
                  mulh         s10, s4, a3
                  srai         a6, a7, 14
                  lui          ra, 31942
                  addi         a4, zero, 828
693:              c.srli       a0, 18
                  auipc        a4, 979213
                  divu         sp, t3, a1
                  bltu         s0, a6, 715f
                  bltu         a5, s3, 702f
                  andi         s6, tp, -329
                  srai         s11, ra, 24
                  srai         t0, a4, 15
                  sll          t3, s3, a0
702:              ori          t2, a7, -1237
                  c.addi4spn   a2, sp, 352
                  c.beqz       s0, 714f
                  c.nop
                  bge          s3, s2, 717f
                  c.or         a4, s1
                  c.sub        a0, a0
                  c.srai       s1, 12
                  ori          s2, t1, -657
                  c.addi       a4, -1
                  nop
                  auipc        sp, 892391
714:              c.srai       a2, 25
715:              beq          s2, s1, 717f
                  ori          t1, t6, 845
717:              c.li         s9, -1
                  c.srai       a0, 29
                  srai         s9, s6, 8
                  srai         a3, zero, 14
                  c.and        a3, a3
                  c.andi       s0, -1
                  sub          s11, t0, s6
                  slli         t1, a3, 9
                  c.or         a3, s1
                  bge          s3, sp, 729f
                  c.nop
                  divu         a1, a5, t2
729:              c.addi       a0, -1
                  c.xor        a3, s0
                  bge          sp, a0, 738f
                  bne          s6, tp, 752f
                  c.lui        s5, 17
                  blt          ra, s8, 743f
                  divu         s11, t6, s3
                  mul          t5, a4, s9
                  add          s9, s11, s11
738:              c.srai       a0, 26
                  srai         a0, s3, 9
                  sra          s2, s8, s10
                  slt          tp, ra, t5
                  c.beqz       a1, 749f
743:              mulhsu       a6, tp, s11
                  lui          a1, 863518
                  mulhsu       a1, s4, t5
                  bge          a2, zero, 749f
                  c.andi       a1, -1
                  mulhsu       a4, s0, s6
749:              div          t4, a0, a1
                  c.li         s2, 13
                  c.andi       a0, -1
752:              slli         s10, s8, 12
                  c.andi       a4, 1
                  and          zero, s2, s7
                  srai         s6, t3, 9
                  c.srli       s0, 19
                  slli         s11, a2, 27
                  srl          t5, a3, a5
                  div          a4, a3, s1
                  mulh         t3, ra, s2
                  beq          gp, t3, 769f
                  addi         s11, a7, -1369
                  bgeu         a1, s4, 777f
                  sra          t2, s5, a2
                  slli         t0, t2, 11
                  c.srai       a3, 20
                  andi         zero, s2, -1980
                  c.add        t5, a2
769:              mul          t3, tp, t3
                  mulhsu       a6, t6, t5
                  c.srli       a0, 10
                  mulh         a1, a6, s8
                  c.addi16sp   sp, -16
                  sltu         s10, s9, s1
                  bgeu         t1, a2, 776f
776:              bltu         s7, a1, 785f
777:              slli         s5, t6, 20
                  xori         s8, s0, -225
                  c.sub        a2, a2
                  mulhsu       s5, s9, t2
                  andi         t3, gp, -376
                  c.or         a4, a1
                  nop
                  srl          s8, s2, t6
785:              c.addi4spn   s0, sp, 368
                  c.srai       a2, 28
                  addi         zero, a4, 767
                  mul          t2, s8, s0
                  srli         s4, gp, 31
                  xori         s6, t4, 1768
                  mul          t6, t5, s6
                  rem          a1, s3, a6
                  xori         s2, a1, 121
                  addi         s2, t0, -105
                  c.andi       s1, 2
                  slt          t2, t1, s4
                  la           s8, region_0+174 #start load_store_instr_stream_1
                  lhu          s6, 8(s8)
                  lbu          tp, 9(s8)
                  la           s4, region_1+1779 #start load_store_instr_stream_0
                  lb           s9, -9(s4)
                  lb           t0, -10(s4)
                  sh           s9, 0(s8)
                  lhu          t1, 9(s4)
                  sb           a4, 7(s8)
                  sb           t6, -8(s4)
                  lbu          s10, -2(s8)
                  lbu          s11, -14(s4)
                  lh           t6, 1(s4)
                  lb           s3, -15(s8)
                  lh           tp, -16(s8)
                  sb           s11, 16(s4)
                  lb           s6, -8(s4)
                  lbu          s0, 8(s8)
                  lh           a0, -14(s8) #end load_store_instr_stream_1
                  sb           s5, 6(s4) #end load_store_instr_stream_0
                  bne          s8, sp, 814f
                  c.addi4spn   s0, sp, 848
                  sll          a2, t0, ra
                  divu         s2, s9, s7
                  sra          s10, t4, s4
                  remu         a0, s8, t3
                  beq          s9, s4, 821f
                  c.bnez       a3, 817f
                  c.bnez       a0, 819f
                  lui          tp, 433898
                  srli         a3, t1, 0
                  slti         a4, a7, -1288
                  c.mv         s10, a5
                  srai         s1, s8, 22
                  rem          t6, a2, s1
                  c.nop
                  bge          a6, a0, 814f
814:              or           t3, s0, gp
                  c.lui        tp, 6
                  ori          tp, zero, 1688
817:              c.andi       a2, -1
                  addi         t5, a7, -525
819:              c.addi16sp   sp, -16
                  add          t3, t5, a7
821:              beq          a0, ra, 830f
                  sltu         a2, sp, a2
                  c.xor        a1, a5
                  mulhu        s10, s4, s0
                  sub          s5, s4, t5
                  sltu         t4, s7, t0
                  c.slli       t2, 9
                  c.addi16sp   sp, 496
                  div          t6, t3, s10
830:              remu         s0, s2, s10
                  c.sub        s1, s1
                  and          s1, t1, a0
                  c.bnez       s0, 844f
                  bgeu         tp, s5, 851f
                  c.addi16sp   sp, -16
                  div          gp, a0, t2
                  c.addi4spn   s1, sp, 288
                  sub          s0, a0, s5
                  c.addi       a2, -1
                  slt          s1, a6, ra
                  and          s8, sp, ra
                  c.slli       s2, 18
                  mul          t1, sp, a1
844:              nop
                  slti         a6, s6, -990
                  mulh         t4, a4, ra
                  andi         a6, s11, 1593
                  xor          s0, a2, t0
                  c.add        t2, sp
                  ori          t6, s11, 1318
851:              slt          t1, a1, gp
                  c.beqz       a2, 855f
                  lui          a0, 260393
                  c.addi4spn   s0, sp, 800
855:              beq          s1, a5, 873f
                  auipc        t4, 567753
                  mulhsu       s4, tp, s7
                  bgeu         t1, s6, 877f
                  c.addi4spn   s0, sp, 144
                  c.li         s5, -1
                  c.addi       t6, -1
                  sltu         t0, t6, sp
                  bge          s9, s2, 873f
                  andi         t5, ra, 1388
                  bne          s5, s5, 872f
                  slt          a4, ra, t5
                  c.sub        s0, s0
                  c.mv         t2, s6
                  c.bnez       a3, 886f
                  lui          s2, 992907
                  c.xor        a2, s1
872:              c.lui        s11, 10
873:              andi         s5, a1, 1234
                  xori         t2, tp, 84
                  addi         a4, s1, 1656
                  nop
877:              lui          s1, 1004634
                  c.andi       a4, -1
                  c.bnez       a2, 882f
                  bltu         a5, s3, 894f
                  ori          t2, s5, -226
882:              slti         tp, a1, 912
                  mulhu        s2, a5, t5
                  bne          sp, a5, 889f
                  slt          s6, s6, tp
886:              sltiu        ra, t3, 2010
                  c.addi16sp   sp, -16
                  and          ra, zero, tp
889:              addi         a6, sp, 1927
                  c.srai       a0, 5
                  divu         s4, a7, t1
                  srli         gp, ra, 25
                  srl          s11, a4, s6
894:              srai         a2, a5, 31
                  c.slli       t1, 14
                  or           s0, t6, gp
                  c.addi       t2, -1
                  divu         t4, a2, s7
                  add          s9, tp, t3
                  mulh         s11, t4, tp
                  sra          s3, s10, a1
                  c.addi16sp   sp, -16
                  mulhsu       s9, sp, zero
                  slti         sp, t4, 1274
                  mulhsu       a1, s11, t6
                  remu         t5, s0, s5
                  c.srai       a4, 10
                  andi         a3, s11, -909
                  sltiu        gp, s0, -1217
                  c.andi       a1, -1
                  rem          s4, sp, a0
                  nop
                  bltu         t6, a5, 920f
                  c.addi16sp   sp, -16
                  divu         s11, t1, a5
                  c.andi       a1, -1
                  div          t5, a1, a4
                  c.addi16sp   sp, -16
                  mulh         a3, gp, s6
920:              slli         a3, a6, 19
                  blt          a0, s4, 935f
                  sra          t3, s2, s3
                  sltiu        a0, s9, 998
                  addi         a3, s0, 1241
                  lui          s1, 782235
                  c.beqz       s0, 935f
                  add          sp, gp, a0
                  srai         s4, zero, 27
                  bgeu         a5, s6, 942f
                  srl          zero, t4, s4
                  c.beqz       a4, 933f
                  slt          s9, s11, a3
933:              mul          s6, s5, ra
                  sra          s5, a1, t4
935:              blt          gp, sp, 955f
                  addi         sp, s1, 1421
                  slli         t5, s1, 23
                  andi         s8, gp, -496
                  sltu         s11, a4, a6
                  c.andi       s1, -1
                  c.sub        a3, a4
942:              c.li         t2, -1
                  c.bnez       a2, 961f
                  c.andi       s1, -1
                  auipc        tp, 45870
                  auipc        s1, 887562
                  c.addi       t6, 11
                  srli         s1, t0, 29
                  srli         a3, a3, 17
                  auipc        t0, 927524
                  lui          t5, 205408
                  sltu         s9, zero, s3
                  beq          t2, a6, 961f
                  c.beqz       a0, 964f
955:              mulh         t6, s6, a0
                  slti         s11, t6, 1834
                  c.add        gp, sp
                  mulhu        t5, t4, t6
                  c.andi       a0, -1
                  srl          s10, s9, s1
961:              xori         s5, t5, -923
                  bge          s4, t4, 980f
                  bgeu         s1, a3, 966f
964:              mulh         s6, s2, t1
                  andi         s2, t1, -1295
966:              divu         s3, t5, a4
                  slli         t4, s0, 26
                  div          tp, s10, s6
                  c.and        s0, a0
                  addi         s4, gp, 296
                  auipc        sp, 614611
                  slli         s10, s6, 10
                  rem          s6, a5, zero
                  auipc        s9, 436348
                  c.sub        a3, a3
                  bne          a4, a7, 989f
                  slli         t5, a4, 26
                  mulhu        t1, zero, a2
                  sltu         a3, a4, a5
980:              auipc        s9, 551801
                  srli         t2, a2, 31
                  bltu         s2, t4, 984f
                  beq          s3, tp, 992f
984:              beq          a7, gp, 1001f
                  c.addi       s10, -1
                  slti         s6, s7, -140
                  c.beqz       s0, 992f
                  and          s3, a6, t0
989:              sra          s5, s1, s10
                  xori         t4, a0, -1739
                  c.addi       a1, 3
992:              bltu         t4, t3, 1002f
                  c.andi       s0, -1
                  remu         gp, s11, t1
                  sltu         s3, s4, a5
                  srli         t4, sp, 19
                  and          t1, t0, s1
                  slli         a3, t4, 11
                  sltiu        t5, sp, 2000
                  c.addi4spn   s1, sp, 560
1001:             c.addi16sp   sp, 16
1002:             sltu         t6, t5, t6
                  c.andi       s0, -1
                  ori          t5, t4, -1292
                  auipc        t5, 407223
                  mulhsu       t0, s4, a5
                  c.mv         ra, s8
                  lui          a6, 59694
                  srl          s5, t4, t1
                  la           sp, region_0+838 #start riscv_load_store_hazard_instr_stream_0
                  lb           a1, -466(sp)
                  lb           t1, -466(sp)
                  sb           s8, -466(sp)
                  sw           s2, -466(sp)
                  lb           s8, -466(sp)
                  slli         t4, t1, 0
                  lw           ra, -466(sp)
                  lbu          s3, -466(sp)
                  lbu          t1, -466(sp)
                  sh           t4, -466(sp)
                  c.xor        a4, a4
                  c.li         gp, 26
                  or           t1, s3, t4
                  add          a4, t5, t2
                  and          a4, s11, s3
                  lbu          a0, -466(sp) #end riscv_load_store_hazard_instr_stream_0
                  sra          s10, s5, s10
                  sltiu        t1, t5, 1886
                  nop
                  sub          a3, a6, a1
                  beq          a0, s2, 1027f
                  slt          a1, s6, sp
                  remu         a1, t1, t6
                  c.beqz       s0, 1034f
                  mul          a1, s11, s0
                  beq          s6, a4, 1033f
                  sra          t0, a6, s2
                  sltiu        gp, s9, -2010
                  c.addi16sp   sp, 384
                  and          s10, s11, t1
                  bgeu         a2, sp, 1031f
                  srai         sp, a6, 4
                  c.bnez       a4, 1029f
1027:             sltiu        zero, s8, -1843
                  addi         s3, sp, 1550
1029:             or           s5, a4, a1
                  mul          a1, zero, a5
1031:             c.andi       s0, -1
                  slti         s9, s8, -570
                  la           a2, region_0+434 #start riscv_load_store_rand_instr_stream_6
                  lbu          s6, 250(a2)
                  sb           t1, -12(a2)
                  mulhu        zero, s11, s4
                  lb           t1, 1011(a2)
                  lh           s11, -158(a2)
                  lbu          t5, 508(a2)
                  lw           s11, -326(a2)
                  sltu         s6, tp, tp
                  lb           s6, -57(a2)
                  sh           a3, 452(a2)
                  sra          t6, s10, tp
                  auipc        s11, 421785
                  sub          s8, a6, s5
                  lbu          s10, 56(a2)
                  slti         t2, t5, 1559
                  sb           s6, 731(a2)
                  sltu         a1, zero, s10
                  sub          gp, zero, t2
                  lh           a6, 70(a2)
                  lbu          tp, -179(a2)
                  sb           t2, 1107(a2)
                  sb           s1, 680(a2)
                  lb           a3, 1011(a2)
                  sb           t3, 1419(a2)
                  c.mv         s5, s3
                  sw           t6, 1334(a2)
                  xor          gp, s5, t0
                  lhu          s11, 92(a2)
                  sb           s5, 1535(a2)
                  lbu          zero, 511(a2)
                  sb           s6, 1471(a2)
                  c.and        a3, a0
                  lb           gp, 55(a2)
                  divu         tp, a6, s6
                  lb           s0, 621(a2)
                  lh           s1, 978(a2)
                  lw           s4, 670(a2)
                  sb           s2, 541(a2)
                  lb           s2, 1511(a2)
                  sb           a2, 1345(a2)
                  sub          a3, t4, s3
                  lbu          s6, 1511(a2) #end riscv_load_store_rand_instr_stream_6
1033:             c.or         a4, a0
1034:             c.addi16sp   sp, -16
                  remu         tp, s3, tp
                  ori          s10, s8, 835
                  c.srli       a3, 25
                  c.beqz       s0, 1041f
                  andi         s5, s10, -1051
                  c.addi4spn   a2, sp, 304
1041:             c.addi       s1, 22
                  c.bnez       a0, 1050f
                  beq          s8, s6, 1061f
                  slli         sp, s11, 27
                  sll          a3, t6, gp
                  divu         a3, s2, s7
                  xor          t3, gp, s1
                  c.srli       a1, 1
                  auipc        t0, 29188
1050:             srl          t1, s2, s0
                  add          s6, s6, s5
                  add          s10, zero, zero
                  c.mv         tp, a5
                  slt          s3, s7, a6
                  srli         t2, a5, 3
                  xori         zero, a3, 97
                  add          s5, s10, t1
                  c.andi       a0, -1
                  bgeu         s5, a4, 1077f
                  c.li         a4, 12
1061:             blt          a6, s8, 1063f
                  c.andi       s0, 18
1063:             c.bnez       a3, 1072f
                  beq          s5, s4, 1067f
                  sltiu        s3, s4, -3
                  mul          s3, a7, s1
1067:             slti         s9, t3, 511
                  c.add        t4, t0
                  bge          a3, zero, 1076f
                  add          s11, t2, t2
                  andi         s6, a2, -1440
1072:             xor          a2, s8, s4
                  sltu         t4, s1, tp
                  add          tp, s5, t5
                  sra          s2, a5, a2
1076:             bgeu         t4, t6, 1094f
1077:             add          a6, t2, a5
                  c.addi       s4, 17
                  andi         t5, s9, -607
                  c.addi4spn   a2, sp, 928
                  bltu         s5, s6, 1098f
                  slli         sp, s5, 31
                  c.beqz       a0, 1088f
                  c.xor        s0, s1
                  sll          gp, s2, s11
                  divu         s2, t1, s3
                  c.slli       t2, 25
1088:             auipc        s8, 489815
                  bne          s3, s1, 1091f
                  c.slli       t0, 30
1091:             nop
                  bgeu         s10, s7, 1111f
                  c.bnez       a2, 1113f
1094:             sltiu        a2, t6, 1418
                  nop
                  bltu         a4, t5, 1101f
                  c.addi4spn   a2, sp, 544
1098:             srai         t3, a2, 7
                  c.or         a1, s1
                  bge          t4, a5, 1113f
1101:             c.add        s5, a5
                  beq          s0, zero, 1111f
                  sub          t3, t5, s4
                  divu         ra, ra, ra
                  mulhsu       s2, s8, s0
                  c.bnez       a0, 1116f
                  c.srai       s1, 3
                  bne          a4, t2, 1118f
                  srli         s10, s3, 7
                  slli         t1, s0, 20
1111:             c.beqz       s1, 1120f
                  c.addi16sp   sp, -16
1113:             divu         s5, a5, a3
                  and          sp, gp, tp
                  c.bnez       s1, 1116f
1116:             divu         t2, a6, t5
                  xor          s11, t5, t0
1118:             mulhu        a2, t0, a2
                  c.addi16sp   sp, 480
1120:             slt          gp, a0, gp
                  c.bnez       a4, 1135f
                  add          t3, s3, s2
                  c.nop
                  c.srai       a0, 2
                  mul          s5, t4, a1
                  rem          a3, tp, t3
                  c.srli       a2, 16
                  mulhu        s0, t3, s4
                  addi         a0, sp, -283
                  c.or         a1, a4
                  lui          zero, 487396
                  xor          s6, s1, t2
                  c.bnez       a3, 1143f
                  c.andi       s1, -1
1135:             slt          s4, a5, a1
                  andi         t6, ra, -635
                  mulhsu       sp, s1, t6
                  rem          tp, a6, t4
                  sltu         zero, t3, a0
                  c.xor        a3, a4
                  and          ra, s5, s3
                  blt          t1, s4, 1159f
1143:             c.and        a4, s0
                  sub          s8, s5, t2
                  beq          t4, a1, 1156f
                  sltiu        s11, s7, 1543
                  c.addi4spn   a1, sp, 672
                  srli         a1, a1, 12
                  sltiu        s9, t6, -1001
                  nop
                  ori          s4, s6, -984
                  c.and        a4, a0
                  auipc        s11, 746937
                  and          t5, a5, t1
                  c.addi       s3, -1
1156:             div          t2, s10, a1
                  and          t4, t5, s0
                  bltu         t4, a4, 1175f
1159:             mul          t5, gp, s11
                  c.beqz       a3, 1177f
                  lui          s8, 799799
                  sltiu        t1, t0, -1405
                  srli         a1, s4, 20
                  c.li         a6, 27
                  c.xor        a3, s1
                  beq          a4, s1, 1169f
                  slli         t0, s0, 13
                  c.addi       s3, 6
1169:             bge          a2, t0, 1171f
                  c.or         s0, a5
1171:             or           t3, s7, t4
                  c.li         a2, -1
                  ori          s1, a7, -252
                  c.xor        a0, s0
1175:             blt          sp, s0, 1184f
                  xori         sp, sp, 281
1177:             slti         s9, s1, -1761
                  mul          a2, zero, s1
                  auipc        ra, 909759
                  and          ra, t0, s8
                  srli         s0, s3, 9
                  slli         tp, s10, 5
                  add          s9, t1, t3
1184:             slt          sp, a5, a4
                  c.slli       t2, 27
                  c.addi4spn   s0, sp, 208
                  c.slli       ra, 5
                  nop
                  sub          gp, s1, a2
                  c.srli       a2, 18
                  sltiu        t5, s0, 1729
                  lui          t4, 1010385
                  c.xor        a1, a5
                  c.or         s0, a2
                  nop
                  auipc        s9, 17694
                  rem          t3, t0, a2
                  srli         t0, zero, 21
                  c.slli       t3, 3
                  remu         s9, s8, zero
                  nop
                  c.or         a0, a0
                  auipc        t3, 524042
                  and          gp, a6, ra
                  c.srli       a0, 11
                  or           s2, s2, a2
                  or           zero, s1, s3
                  c.xor        a2, a2
                  nop
                  c.beqz       a4, 1224f
                  srli         t1, a7, 12
                  blt          t0, tp, 1222f
                  c.nop
                  slli         a6, s2, 31
                  bne          t6, a0, 1217f
                  sltu         s6, t5, s3
1217:             add          a2, sp, a2
                  slt          a6, sp, t3
                  sltu         t2, gp, a5
                  c.add        t5, s4
                  srl          s4, s3, a6
1222:             lui          a2, 154564
                  c.lui        s5, 17
1224:             sltiu        gp, a1, -10
                  or           s3, s4, t0
                  andi         a4, s5, 1349
                  bgeu         s2, a4, 1230f
                  srl          t2, zero, s5
                  blt          s11, a2, 1248f
1230:             c.addi       t1, -1
                  c.addi4spn   a2, sp, 384
                  blt          sp, sp, 1246f
                  sltiu        a3, t2, 1602
                  xori         s3, s5, -104
                  c.slli       a1, 2
                  bgeu         a6, a3, 1254f
                  mulh         s3, s5, a1
                  remu         a2, s7, t4
                  srli         s5, tp, 29
                  c.and        s1, s1
                  bltu         s4, zero, 1254f
                  xori         s9, s1, -1586
                  nop
                  c.add        sp, s1
                  beq          ra, s10, 1248f
1246:             c.srli       s1, 16
                  c.addi       a3, 26
1248:             mulhsu       s6, a3, t6
                  sub          s6, s0, ra
                  or           s9, a3, tp
                  bgeu         a3, gp, 1268f
                  c.add        t0, a1
                  lui          s3, 960273
1254:             c.addi4spn   a4, sp, 480
                  c.mv         a6, s8
                  c.srai       a4, 24
                  slt          gp, a2, t6
                  sra          s4, t0, a4
                  c.andi       a1, 21
                  c.addi4spn   a4, sp, 16
                  blt          s3, zero, 1279f
                  c.addi4spn   a3, sp, 832
                  remu         t0, a1, tp
                  lui          s2, 655378
                  bgeu         t3, a0, 1274f
                  auipc        a4, 817782
                  and          t6, t3, a6
1268:             c.addi       ra, 24
                  c.and        a3, a1
                  c.li         t3, 7
                  ori          s4, a0, -1876
                  divu         s4, s8, s8
                  lui          a3, 187351
1274:             c.add        t3, s7
                  divu         a4, t1, ra
                  bgeu         s11, t3, 1281f
                  srai         a1, t5, 14
                  or           s4, s2, s2
1279:             c.lui        ra, 17
                  c.beqz       a1, 1287f
1281:             beq          zero, s7, 1288f
                  slli         gp, t4, 2
                  sra          t1, a1, s3
                  sltu         s6, s2, ra
                  div          t6, s10, gp
                  c.add        s4, s6
1287:             mulh         t4, s5, s4
1288:             xori         a0, t4, -1048
                  div          t5, s4, t1
                  and          s8, t1, t0
                  div          s8, s10, t3
                  bne          s4, s4, 1300f
                  slti         a4, a7, -248
                  beq          s7, s8, 1304f
                  andi         t5, t2, 1305
                  c.lui        s9, 12
                  lui          zero, 475185
                  ori          a1, a5, 681
                  lui          zero, 430514
1300:             mul          s6, s8, t2
                  sll          a2, t2, s9
                  c.add        t5, a3
                  srl          s11, tp, a6
1304:             c.add        t0, s7
                  c.nop
                  c.mv         t4, s5
                  slli         gp, gp, 3
                  bne          a2, tp, 1326f
                  xori         s2, sp, 965
                  c.srli       s0, 25
                  c.sub        a2, a1
                  c.lui        t3, 20
                  c.slli       s2, 22
                  c.and        s1, a4
                  mulhsu       s9, s6, a2
                  c.xor        a3, a4
                  auipc        s0, 84805
                  c.or         a0, s1
                  c.or         a1, a3
                  c.bnez       a1, 1321f
1321:             mulhsu       t5, s10, s9
                  srl          t1, s5, a3
                  srl          tp, a6, a5
                  bgeu         s5, ra, 1334f
                  lui          t3, 159031
1326:             slli         s6, tp, 16
                  c.beqz       a2, 1347f
                  c.addi       t3, -1
                  c.lui        a1, 28
                  c.li         t0, 21
                  bne          s1, a5, 1344f
                  c.andi       a2, -1
                  slt          a2, t6, tp
1334:             divu         s3, s6, s5
                  mulhsu       t1, a7, s7
                  sub          s4, t3, s4
                  sra          s10, sp, a3
                  c.addi       s4, 26
                  c.sub        s0, a2
                  c.xor        s1, a4
                  and          a6, ra, a5
                  beq          a7, t6, 1347f
                  c.and        a1, a2
1344:             add          s1, a7, t3
                  c.bnez       a1, 1356f
                  mulhsu       s9, s11, s10
1347:             c.sub        s1, s0
                  c.xor        a0, a2
                  sra          a2, s6, s2
                  andi         s3, a6, -690
                  c.lui        s3, 1
                  sltu         s0, s8, a3
                  slli         ra, s0, 28
                  c.add        a1, s11
                  rem          s1, t4, a7
1356:             blt          s6, s6, 1365f
                  lui          s10, 541315
                  c.beqz       a1, 1365f
                  c.li         a1, 19
                  mulhsu       t2, a4, t5
                  or           s2, sp, a0
                  ori          a4, sp, -1568
                  add          gp, t6, s7
                  mulhsu       t3, s1, zero
1365:             c.beqz       a1, 1375f
                  sll          t3, t0, t1
                  c.srli       a3, 11
                  bge          t5, t5, 1373f
                  srai         a1, s3, 20
                  c.addi16sp   sp, -16
                  addi         a4, a4, -1276
                  remu         t2, s5, a7
1373:             c.and        a4, a5
                  rem          s9, s5, t6
1375:             sll          t4, s7, a1
                  mul          zero, t4, ra
                  sub          a3, zero, s3
                  beq          zero, s6, 1397f
                  sra          s6, t1, ra
                  sltiu        tp, t3, 45
                  xori         s5, gp, -1463
                  sll          s3, s3, s6
                  c.addi4spn   a4, sp, 848
                  ori          s9, s3, -1724
                  slt          t3, s11, s2
                  auipc        t5, 572130
                  nop
                  sltiu        a3, s4, 1052
                  xori         s6, a5, 1702
                  bgeu         s11, s3, 1408f
                  bgeu         s5, sp, 1392f
1392:             sltu         sp, a7, s2
                  sltu         t0, s7, s2
                  add          a0, t2, s10
                  srli         s10, tp, 1
                  mulh         a4, t4, s10
1397:             mulhu        s8, t1, t5
                  c.or         s1, a2
                  bgeu         ra, t4, 1416f
                  sltu         t2, s8, a6
                  c.or         a2, a2
                  c.add        t4, a3
                  mulhsu       s4, s5, s8
                  bgeu         a3, s1, 1415f
                  srli         a4, s10, 8
                  c.addi4spn   a3, sp, 352
                  c.mv         tp, gp
1408:             srai         s1, s4, 3
                  sub          t3, s6, a3
                  sub          a2, s7, gp
                  xori         sp, t5, -277
                  c.lui        a4, 12
                  slli         s11, s7, 31
                  srl          s1, a1, s3
1415:             and          t5, s0, s8
1416:             lui          t4, 603183
                  c.addi16sp   sp, -16
                  sub          s8, a4, t2
                  bne          a7, s9, 1428f
                  remu         s2, t1, s6
                  c.mv         s2, sp
                  c.bnez       a3, 1429f
                  c.mv         a3, a5
                  c.andi       s1, -1
                  sltiu        s2, s2, 1917
                  remu         a2, s7, a1
                  xor          s6, a5, a0
1428:             mulh         a1, s5, zero
1429:             sltu         a2, a6, t2
                  srl          t4, s4, a0
                  addi         a6, s10, -441
                  and          gp, sp, s1
                  c.nop
                  sra          t6, a1, a5
                  c.srli       a2, 11
                  blt          tp, s6, 1446f
                  srl          s0, t2, a3
                  slti         s3, s3, 366
                  c.srai       s1, 10
                  bne          a3, s4, 1454f
                  auipc        s5, 85747
                  c.andi       a2, 8
                  mulhu        t5, t2, a1
                  sra          a3, t3, s8
                  or           s6, s7, s3
1446:             xori         s0, s11, -708
                  lui          a0, 534651
                  div          s9, zero, s8
                  c.beqz       s0, 1454f
                  c.srli       a3, 9
                  sll          ra, a0, s7
                  bge          s10, s8, 1454f
                  c.andi       a0, -1
1454:             sub          t0, s11, s6
                  c.andi       a3, 12
                  ori          t1, s1, 381
                  or           a0, gp, s1
                  sll          s4, s0, gp
                  mulh         a1, s9, s10
                  nop
                  c.and        s1, a3
                  divu         s2, sp, t4
                  mulhu        s1, a0, t4
                  c.slli       s3, 13
                  sll          sp, s9, t6
                  c.srai       a2, 17
                  andi         s5, s5, 1520
                  srli         a4, t6, 22
                  c.srli       a1, 31
                  c.slli       s5, 10
                  srai         t6, s6, 27
                  lui          zero, 1041418
                  sll          a6, a4, s2
                  c.andi       a4, -1
                  divu         tp, t2, a7
                  c.andi       a2, -1
                  c.li         s8, 3
                  rem          t2, a2, sp
                  srl          t4, t1, t5
                  c.add        s3, gp
                  c.lui        a4, 21
                  c.mv         t1, t2
                  slt          sp, t2, s10
                  or           t3, a2, t0
                  rem          tp, t1, zero
                  c.sub        a2, s1
                  c.xor        a3, a1
                  and          s11, tp, t3
                  slt          t4, sp, t1
                  c.addi       s2, 9
                  bne          t0, a0, sub_4_j5 #branch to jump instr
                  c.xor        s1, a0
                  c.addi4spn   a1, sp, 208
                  sltu         tp, a3, a1
sub_4_j5:         jal          ra, sub_5 #jump sub_4 -> sub_5
                  mul          t0, s5, s3
                  xor          s5, t4, a7
                  andi         t5, t4, 611
                  xori         s0, t4, 1102
                  bgeu         a5, a0, 1505f
                  c.andi       a2, -1
                  c.nop
                  c.mv         s5, s5
                  bgeu         s8, t3, 1504f
                  c.sub        a2, a0
                  c.sub        a2, a3
                  c.slli       s8, 24
                  c.sub        a4, a0
                  ori          s3, a0, 357
                  or           t4, t6, s11
                  xori         zero, a5, 1603
                  beq          s6, a1, 1520f
1504:             slti         s2, ra, 1356
1505:             bge          t1, s11, 1508f
                  c.srli       a3, 24
                  bltu         a1, sp, 1510f
1508:             bltu         t1, t3, 1525f
                  mulhsu       a3, a1, t6
1510:             mul          t2, s1, s10
                  lui          sp, 919056
                  remu         s6, zero, a5
                  sll          a4, a4, tp
                  slt          t0, t4, s9
                  addi         s6, t2, -1157
                  sltu         s2, s8, t5
                  bge          sp, t1, 1537f
                  sltiu        gp, s4, 1086
                  c.slli       s10, 24
1520:             nop
                  c.bnez       a0, 1523f
                  divu         a1, s5, zero
1523:             bltu         a1, tp, 1541f
                  sltiu        t3, s5, -420
1525:             and          a2, s8, sp
                  div          s6, t2, ra
                  c.slli       s3, 31
                  srl          s11, t5, ra
                  srai         s11, s8, 8
                  c.or         a1, a4
                  ori          s0, s10, 276
                  beq          s6, a7, 1540f
                  nop
                  mulhsu       s9, a2, zero
                  c.srai       a0, 12
                  c.li         s9, -1
1537:             c.mv         t6, tp
                  c.sub        a2, s0
                  beq          t4, t1, 1552f
1540:             c.addi       t5, 23
1541:             c.addi16sp   sp, 208
                  c.andi       s1, 29
                  sltu         a6, a2, s9
                  or           tp, a1, tp
                  c.add        a1, s0
                  slti         t1, s4, -36
                  c.srai       s0, 26
                  srl          s10, t5, s4
                  sub          s6, tp, s0
                  andi         s3, a1, 2038
                  and          a0, s10, t3
1552:             addi         s8, a2, 1963
                  srai         a0, t1, 27
                  auipc        zero, 928259
                  c.add        sp, t6
                  slli         s3, s2, 31
                  beq          zero, s9, 1560f
                  slt          t6, t6, a2
                  addi         t5, tp, 443
1560:             c.srai       a2, 1
                  ori          t2, s5, -1094
                  mulhsu       s6, s9, a7
                  srai         a4, s0, 6
                  c.bnez       a2, 1574f
                  bgeu         t1, s7, 1583f
                  sra          t4, s4, a4
                  c.add        t3, a7
                  slti         s5, t3, 137
                  divu         s2, a5, s9
                  divu         t3, sp, a4
                  bltu         s8, t0, 1580f
                  div          t0, s8, a1
                  c.srai       s1, 17
1574:             bltu         ra, s2, 1587f
                  sltu         s0, zero, sp
                  c.and        a0, a4
                  slli         s6, tp, 28
                  srl          t2, a0, s11
                  c.sub        a0, a1
1580:             sub          t1, t3, ra
                  divu         s0, gp, a5
                  c.xor        a3, a5
1583:             c.add        s11, s11
                  srli         t5, s11, 0
                  srai         t0, a2, 5
                  blt          t0, ra, 1593f
1587:             mulh         t2, t0, t0
                  c.beqz       a1, 1593f
                  bltu         s1, s2, 1590f
1590:             c.srai       a0, 3
                  sub          a1, s11, s7
                  srai         t5, s11, 9
1593:             nop
                  xori         t1, a4, 739
                  c.andi       a1, 3
                  c.andi       a4, -1
                  c.srai       a0, 10
                  srl          s1, s6, a6
                  slti         s4, t3, -173
                  c.bnez       s0, 1607f
                  addi         s8, a4, -942
                  auipc        a6, 865398
                  mulh         s0, a1, a4
                  c.add        s11, s5
                  sra          t4, a4, a6
                  ori          a6, t3, -340
1607:             c.nop
                  rem          s0, s9, t4
                  nop
                  mulhsu       a0, t1, s7
                  nop
                  c.nop
                  c.addi16sp   sp, 320
                  beq          s1, ra, 1632f
                  xor          t0, t2, a1
                  xor          s3, zero, t4
                  div          s6, t5, ra
                  and          zero, s5, s2
                  c.slli       gp, 8
                  c.mv         t5, sp
                  lui          s8, 995679
                  add          a1, s10, s5
                  c.beqz       a3, 1633f
                  bne          a2, a7, 1635f
                  c.addi16sp   sp, -16
                  c.srai       a4, 29
                  c.or         a3, s1
                  c.nop
                  c.srli       a1, 12
                  ori          a1, s3, 924
                  sltiu        sp, t5, 1566
1632:             rem          a2, a1, s11
1633:             c.srli       a2, 2
                  c.xor        a0, a1
1635:             c.sub        a4, a0
                  add          s4, ra, t1
                  slli         t3, s5, 7
                  mulhu        a2, s7, a2
                  rem          sp, s5, a4
                  add          a3, gp, s9
                  bgeu         t5, s5, 1651f
                  div          tp, a3, a7
                  sub          a2, sp, sp
                  c.sub        s1, a5
                  auipc        gp, 242179
                  c.add        t6, a5
                  ori          tp, gp, 1057
                  slti         ra, a6, 1036
                  beq          s6, s9, 1652f
                  or           t2, tp, s3
1651:             c.andi       a4, -1
1652:             c.addi       s2, 26
                  xori         a1, s7, -1401
                  srai         a6, a1, 6
                  sltiu        t1, t2, -423
                  c.addi16sp   sp, -16
                  bge          a5, a7, 1666f
                  c.mv         t5, a5
                  c.addi4spn   a4, sp, 496
                  lui          t3, 744437
                  sltu         s9, a3, gp
                  c.lui        t2, 10
                  mulhu        s10, t6, t4
                  mulhu        a1, t4, s3
                  c.lui        t5, 3
1666:             beq          sp, a7, 1668f
                  add          s3, sp, a2
1668:             c.srli       a2, 7
                  srl          a0, a6, t6
                  sra          s1, s10, t0
                  xor          zero, zero, ra
                  c.srai       s0, 13
                  blt          t4, a3, 1686f
                  c.addi4spn   s1, sp, 304
                  mulhsu       s9, t2, a5
                  slt          t0, s6, t1
                  c.srai       a1, 19
                  c.and        a1, a1
                  or           t6, s11, t1
                  mulh         s4, t4, t3
                  beq          s9, t3, 1698f
                  slt          s0, a5, a2
                  auipc        t3, 546886
                  add          s10, t2, gp
                  addi         t5, a1, 1265
1686:             srai         zero, a0, 20
                  srl          gp, s1, a2
                  c.or         a2, s0
                  nop
                  rem          s8, t0, a0
                  c.mv         a3, a6
                  bge          t0, a0, 1695f
                  slti         a0, t0, 362
                  c.mv         s6, a5
1695:             add          t3, t2, gp
                  slli         ra, ra, 30
                  c.addi16sp   sp, -16
1698:             and          t6, a6, a7
                  andi         s8, s6, -275
                  sub          t6, a2, t0
                  mulh         s2, t1, a2
                  sltiu        s3, t4, 360
                  c.bnez       s0, 1712f
                  c.xor        a0, a5
                  sll          tp, s4, t1
                  bltu         tp, s8, 1711f
                  slti         a3, s11, 1151
                  mulhsu       a2, a1, t3
                  blt          t4, s5, 1723f
                  rem          s1, s4, s4
1711:             auipc        s10, 370650
1712:             bltu         ra, a7, 1729f
                  c.or         a1, s0
                  div          s8, a3, s10
                  lui          a1, 113227
                  c.add        t1, t2
                  c.srai       s1, 13
                  andi         t2, s5, 36
                  sll          s11, a2, a1
                  xor          zero, a5, t3
                  c.addi4spn   a3, sp, 704
                  c.addi       s3, -1
1723:             srai         t0, t6, 10
                  c.nop
                  c.srai       a2, 17
                  mulhsu       s11, s7, ra
                  srli         t2, t5, 31
                  sltiu        s0, t5, -1059
1729:             slt          t4, s2, s4
                  mul          ra, ra, a2
                  xori         s11, s6, 884
                  c.add        t1, t1
                  sltu         ra, s4, t5
                  mulhsu       gp, s1, s9
                  addi         zero, sp, 1567
                  srai         s9, t0, 6
                  bge          s6, t5, 1754f
                  sub          s11, s1, a5
                  c.bnez       a2, 1757f
                  c.or         a3, a1
                  bne          s6, s6, 1761f
                  bge          t4, s7, 1750f
                  sll          s9, t5, a3
                  mulhsu       s1, a5, sp
                  or           t5, s3, tp
                  sltu         t0, t0, s4
                  mulh         zero, a6, s11
                  addi         t0, s7, -983
                  c.srli       s0, 22
1750:             divu         t2, t5, s10
                  sra          s10, zero, s5
                  c.and        a2, a2
                  c.addi4spn   a0, sp, 576
1754:             beq          s7, t6, 1756f
                  addi         s4, s8, 401
1756:             bge          s9, t0, 1767f
1757:             beq          t5, t3, 1767f
                  sub          gp, s10, a3
                  blt          a2, s5, 1767f
                  c.addi       s0, -1
1761:             c.addi16sp   sp, 144
                  sltiu        s11, t6, 478
                  srl          s3, a4, t5
                  or           t3, a4, a1
                  c.srai       a1, 18
                  sll          s2, a0, sp
1767:             c.srli       s1, 7
                  c.addi       s5, 18
                  lw           ra, 4(a5)
                  c.li         a0, -1
                  sra          s6, s7, t5
                  addi         a5, a5, 40
                  divu         s6, s6, t4
                  sltiu        a4, t5, -1257
3108:             addi x19, x1, 1
3108:             c.jr x19
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
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
.section .region_1,"aw",@progbits;
region_1:
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
.section .amo_0,"aw",@progbits;
amo_0:
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
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
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_2:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_3:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_4:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_5:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_6:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_7:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_8:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_9:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_10:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_11:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_12:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_13:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_14:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_15:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
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
                  .option rvc;

mmode_exception_handler:
                  addi x17, x17, -4
                  sw  x15, (x17)
                  add x15, x17, zero
                  addi x15, x15, -128
                  sw  x1, 4(x15)
                  sw  x2, 8(x15)
                  sw  x3, 12(x15)
                  sw  x4, 16(x15)
                  sw  x5, 20(x15)
                  sw  x6, 24(x15)
                  sw  x7, 28(x15)
                  sw  x8, 32(x15)
                  sw  x9, 36(x15)
                  sw  x10, 40(x15)
                  sw  x11, 44(x15)
                  sw  x12, 48(x15)
                  sw  x13, 52(x15)
                  sw  x14, 56(x15)
                  sw  x15, 60(x15)
                  sw  x16, 64(x15)
                  sw  x17, 68(x15)
                  sw  x18, 72(x15)
                  sw  x19, 76(x15)
                  sw  x20, 80(x15)
                  sw  x21, 84(x15)
                  sw  x22, 88(x15)
                  sw  x23, 92(x15)
                  sw  x24, 96(x15)
                  sw  x25, 100(x15)
                  sw  x26, 104(x15)
                  sw  x27, 108(x15)
                  sw  x28, 112(x15)
                  sw  x29, 116(x15)
                  sw  x30, 120(x15)
                  sw  x31, 124(x15)
                  add x17, x15, zero
                  csrr x12, 0x341 # MEPC
                  csrr x12, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x12, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x12, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x12, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x12, x9, ecall_handler
                  li x9, 0x1
                  beq x12, x9, instr_fault_handler
                  li x9, 0x5
                  beq x12, x9, load_fault_handler
                  li x9, 0x7
                  beq x12, x9, store_fault_handler
                  li x9, 0xc
                  beq x12, x9, pt_fault_handler
                  li x9, 0xd
                  beq x12, x9, pt_fault_handler
                  li x9, 0xf
                  beq x12, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x12, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
                  1: la x23, test_done
                  jalr x1, x23, 0

ecall_handler:    
                  la x12, _start
                  sw x0, 0(x12)
                  sw x1, 4(x12)
                  sw x2, 8(x12)
                  sw x3, 12(x12)
                  sw x4, 16(x12)
                  sw x5, 20(x12)
                  sw x6, 24(x12)
                  sw x7, 28(x12)
                  sw x8, 32(x12)
                  sw x9, 36(x12)
                  sw x10, 40(x12)
                  sw x11, 44(x12)
                  sw x12, 48(x12)
                  sw x13, 52(x12)
                  sw x14, 56(x12)
                  sw x15, 60(x12)
                  sw x16, 64(x12)
                  sw x17, 68(x12)
                  sw x18, 72(x12)
                  sw x19, 76(x12)
                  sw x20, 80(x12)
                  sw x21, 84(x12)
                  sw x22, 88(x12)
                  sw x23, 92(x12)
                  sw x24, 96(x12)
                  sw x25, 100(x12)
                  sw x26, 104(x12)
                  sw x27, 108(x12)
                  sw x28, 112(x12)
                  sw x29, 116(x12)
                  sw x30, 120(x12)
                  sw x31, 124(x12)
                  la x23, write_tohost
                  jalr x0, x23, 0

instr_fault_handler:
                  add x15, x17, zero
                  lw  x1, 4(x15)
                  lw  x2, 8(x15)
                  lw  x3, 12(x15)
                  lw  x4, 16(x15)
                  lw  x5, 20(x15)
                  lw  x6, 24(x15)
                  lw  x7, 28(x15)
                  lw  x8, 32(x15)
                  lw  x9, 36(x15)
                  lw  x10, 40(x15)
                  lw  x11, 44(x15)
                  lw  x12, 48(x15)
                  lw  x13, 52(x15)
                  lw  x14, 56(x15)
                  lw  x15, 60(x15)
                  lw  x16, 64(x15)
                  lw  x17, 68(x15)
                  lw  x18, 72(x15)
                  lw  x19, 76(x15)
                  lw  x20, 80(x15)
                  lw  x21, 84(x15)
                  lw  x22, 88(x15)
                  lw  x23, 92(x15)
                  lw  x24, 96(x15)
                  lw  x25, 100(x15)
                  lw  x26, 104(x15)
                  lw  x27, 108(x15)
                  lw  x28, 112(x15)
                  lw  x29, 116(x15)
                  lw  x30, 120(x15)
                  lw  x31, 124(x15)
                  addi x15, x15, 128
                  add x17, x15, zero
                  lw  x15, (x17)
                  addi x17, x17, 4
                  mret

load_fault_handler:
                  add x15, x17, zero
                  lw  x1, 4(x15)
                  lw  x2, 8(x15)
                  lw  x3, 12(x15)
                  lw  x4, 16(x15)
                  lw  x5, 20(x15)
                  lw  x6, 24(x15)
                  lw  x7, 28(x15)
                  lw  x8, 32(x15)
                  lw  x9, 36(x15)
                  lw  x10, 40(x15)
                  lw  x11, 44(x15)
                  lw  x12, 48(x15)
                  lw  x13, 52(x15)
                  lw  x14, 56(x15)
                  lw  x15, 60(x15)
                  lw  x16, 64(x15)
                  lw  x17, 68(x15)
                  lw  x18, 72(x15)
                  lw  x19, 76(x15)
                  lw  x20, 80(x15)
                  lw  x21, 84(x15)
                  lw  x22, 88(x15)
                  lw  x23, 92(x15)
                  lw  x24, 96(x15)
                  lw  x25, 100(x15)
                  lw  x26, 104(x15)
                  lw  x27, 108(x15)
                  lw  x28, 112(x15)
                  lw  x29, 116(x15)
                  lw  x30, 120(x15)
                  lw  x31, 124(x15)
                  addi x15, x15, 128
                  add x17, x15, zero
                  lw  x15, (x17)
                  addi x17, x17, 4
                  mret

store_fault_handler:
                  add x15, x17, zero
                  lw  x1, 4(x15)
                  lw  x2, 8(x15)
                  lw  x3, 12(x15)
                  lw  x4, 16(x15)
                  lw  x5, 20(x15)
                  lw  x6, 24(x15)
                  lw  x7, 28(x15)
                  lw  x8, 32(x15)
                  lw  x9, 36(x15)
                  lw  x10, 40(x15)
                  lw  x11, 44(x15)
                  lw  x12, 48(x15)
                  lw  x13, 52(x15)
                  lw  x14, 56(x15)
                  lw  x15, 60(x15)
                  lw  x16, 64(x15)
                  lw  x17, 68(x15)
                  lw  x18, 72(x15)
                  lw  x19, 76(x15)
                  lw  x20, 80(x15)
                  lw  x21, 84(x15)
                  lw  x22, 88(x15)
                  lw  x23, 92(x15)
                  lw  x24, 96(x15)
                  lw  x25, 100(x15)
                  lw  x26, 104(x15)
                  lw  x27, 108(x15)
                  lw  x28, 112(x15)
                  lw  x29, 116(x15)
                  lw  x30, 120(x15)
                  lw  x31, 124(x15)
                  addi x15, x15, 128
                  add x17, x15, zero
                  lw  x15, (x17)
                  addi x17, x17, 4
                  mret

ebreak_handler:   
                  csrr  x12, 0x341
                  addi  x12, x12, 4
                  csrw  0x341, x12
                  add x15, x17, zero
                  lw  x1, 4(x15)
                  lw  x2, 8(x15)
                  lw  x3, 12(x15)
                  lw  x4, 16(x15)
                  lw  x5, 20(x15)
                  lw  x6, 24(x15)
                  lw  x7, 28(x15)
                  lw  x8, 32(x15)
                  lw  x9, 36(x15)
                  lw  x10, 40(x15)
                  lw  x11, 44(x15)
                  lw  x12, 48(x15)
                  lw  x13, 52(x15)
                  lw  x14, 56(x15)
                  lw  x15, 60(x15)
                  lw  x16, 64(x15)
                  lw  x17, 68(x15)
                  lw  x18, 72(x15)
                  lw  x19, 76(x15)
                  lw  x20, 80(x15)
                  lw  x21, 84(x15)
                  lw  x22, 88(x15)
                  lw  x23, 92(x15)
                  lw  x24, 96(x15)
                  lw  x25, 100(x15)
                  lw  x26, 104(x15)
                  lw  x27, 108(x15)
                  lw  x28, 112(x15)
                  lw  x29, 116(x15)
                  lw  x30, 120(x15)
                  lw  x31, 124(x15)
                  addi x15, x15, 128
                  add x17, x15, zero
                  lw  x15, (x17)
                  addi x17, x17, 4
                  mret

illegal_instr_handler:
                  csrr  x12, 0x341
                  addi  x12, x12, 4
                  csrw  0x341, x12
                  add x15, x17, zero
                  lw  x1, 4(x15)
                  lw  x2, 8(x15)
                  lw  x3, 12(x15)
                  lw  x4, 16(x15)
                  lw  x5, 20(x15)
                  lw  x6, 24(x15)
                  lw  x7, 28(x15)
                  lw  x8, 32(x15)
                  lw  x9, 36(x15)
                  lw  x10, 40(x15)
                  lw  x11, 44(x15)
                  lw  x12, 48(x15)
                  lw  x13, 52(x15)
                  lw  x14, 56(x15)
                  lw  x15, 60(x15)
                  lw  x16, 64(x15)
                  lw  x17, 68(x15)
                  lw  x18, 72(x15)
                  lw  x19, 76(x15)
                  lw  x20, 80(x15)
                  lw  x21, 84(x15)
                  lw  x22, 88(x15)
                  lw  x23, 92(x15)
                  lw  x24, 96(x15)
                  lw  x25, 100(x15)
                  lw  x26, 104(x15)
                  lw  x27, 108(x15)
                  lw  x28, 112(x15)
                  lw  x29, 116(x15)
                  lw  x30, 120(x15)
                  lw  x31, 124(x15)
                  addi x15, x15, 128
                  add x17, x15, zero
                  lw  x15, (x17)
                  addi x17, x17, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x12, 0x300 # MSTATUS;
                  csrr  x12, 0x304 # MIE;
                  csrr  x12, 0x344 # MIP;
                  csrrc x12, 0x344, x12 # MIP;
                  add x15, x17, zero
                  lw  x1, 4(x15)
                  lw  x2, 8(x15)
                  lw  x3, 12(x15)
                  lw  x4, 16(x15)
                  lw  x5, 20(x15)
                  lw  x6, 24(x15)
                  lw  x7, 28(x15)
                  lw  x8, 32(x15)
                  lw  x9, 36(x15)
                  lw  x10, 40(x15)
                  lw  x11, 44(x15)
                  lw  x12, 48(x15)
                  lw  x13, 52(x15)
                  lw  x14, 56(x15)
                  lw  x15, 60(x15)
                  lw  x16, 64(x15)
                  lw  x17, 68(x15)
                  lw  x18, 72(x15)
                  lw  x19, 76(x15)
                  lw  x20, 80(x15)
                  lw  x21, 84(x15)
                  lw  x22, 88(x15)
                  lw  x23, 92(x15)
                  lw  x24, 96(x15)
                  lw  x25, 100(x15)
                  lw  x26, 104(x15)
                  lw  x27, 108(x15)
                  lw  x28, 112(x15)
                  lw  x29, 116(x15)
                  lw  x30, 120(x15)
                  lw  x31, 124(x15)
                  addi x15, x15, 128
                  add x17, x15, zero
                  lw  x15, (x17)
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
